#!/usr/bin/env bash
#
# Validate the authoritative workflow configuration (.agents/workflow.json).
# Overridable for fixture tests: WORKFLOW_FILE, LOCK_FILE, SKILLS_DIR.
#
# Exit 0 = pass, 1 = fail.
set -Eeuo pipefail

root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
WORKFLOW_FILE="${WORKFLOW_FILE:-$root/.agents/workflow.json}"
LOCK_FILE="${LOCK_FILE:-$root/.devcontainer/agent-skills.lock.json}"
SKILLS_DIR="${SKILLS_DIR:-$root/.agents/skills}"

errors=0
fail() { printf '  [FAIL] %s\n' "$1" >&2; errors=$((errors + 1)); }
ok()   { printf '  [OK] %s\n' "$1"; }

command -v jq >/dev/null || { echo "jq required" >&2; exit 2; }

[[ -f "$WORKFLOW_FILE" ]] || { fail "workflow file missing: $WORKFLOW_FILE"; exit 1; }
jq -e . "$WORKFLOW_FILE" >/dev/null 2>&1 || { fail "workflow file is not valid JSON"; exit 1; }
ok "workflow.json is valid JSON"

[[ "$(jq -r '.authoritative' "$WORKFLOW_FILE")" == "true" ]] \
  && ok "marked authoritative" || fail "workflow.json is not marked authoritative"
[[ "$(jq -r '.version // empty' "$WORKFLOW_FILE")" != "" ]] \
  && ok "has a version" || fail "workflow.json has no version"

# All 7 ADR 002 classes present.
mapfile -t classnums < <(jq -r '.task_classes[].adr002_class' "$WORKFLOW_FILE" | sort -n)
if [[ "${classnums[*]}" == "1 2 3 4 5 6 7" ]]; then
  ok "all 7 ADR 002 task classes present"
else
  fail "task classes are not exactly 1..7 (got: ${classnums[*]:-none})"
fi

# Declared skills.
mapfile -t declared < <(jq -r '.skills | keys[]' "$WORKFLOW_FILE")
is_declared() { local s; for s in "${declared[@]}"; do [[ "$s" == "$1" ]] && return 0; done; return 1; }

# Every referenced skill name resolves to a .skills entry.
mapfile -t refs < <(jq -r '
  [ (.task_classes[] | (.required[]?, (.conditional[]?.skill), .excluded[]?)),
    (.wrappers[]? | (.wrapper, .uses[]?, .optionally_cooperates_with[]?)),
    .clean_reader.skill,
    (.clean_reader.must_exclude[]?) ] | unique[]' "$WORKFLOW_FILE")
for r in "${refs[@]}"; do
  [[ -n "$r" ]] || continue
  is_declared "$r" && : || fail "referenced skill not declared in .skills: $r"
done
[[ "$errors" -eq 0 ]] && ok "every referenced skill is declared" || true

# Lock names (for pinned-upstream resolution).
lock_names=""
if [[ -f "$LOCK_FILE" ]] && jq -e . "$LOCK_FILE" >/dev/null 2>&1; then
  lock_names="$(jq -r '.sources[].skills[].name' "$LOCK_FILE" 2>/dev/null || true)"
fi

# Resolve each declared skill by kind.
while IFS= read -r name; do
  kind="$(jq -r --arg n "$name" '.skills[$n].kind' "$WORKFLOW_FILE")"
  case "$kind" in
    human-system-owned)
      f="$SKILLS_DIR/$name/SKILL.md"
      if [[ -f "$f" ]]; then
        fmname="$(awk 'NR==1&&$0=="---"{f=1;next} f&&$0=="---"{exit} f&&/^name:/{sub(/^name:[[:space:]]*/,"");gsub(/["'"'"']/,"");print;exit}' "$f")"
        [[ "$fmname" == "$name" ]] && ok "local skill resolves: $name" \
          || fail "local skill $name: frontmatter name '$fmname' != dir name"
      else
        fail "local skill missing SKILL.md: $name"
      fi
      ;;
    pinned-upstream)
      if grep -qx "$name" <<<"$lock_names"; then
        ok "pinned-upstream skill resolves in lock: $name"
      else
        fail "pinned-upstream skill not in $LOCK_FILE: $name"
      fi
      ;;
    repo-collection)
      ok "repo-collection skill (external, not offline-verifiable): $name"
      ;;
    *)
      fail "skill $name has unknown kind: ${kind:-<none>}"
      ;;
  esac
done < <(printf '%s\n' "${declared[@]}")

# No pinned-upstream skill may resolve to an unpinned ref.
if [[ -f "$LOCK_FILE" ]]; then
  while IFS= read -r sha; do
    [[ "$sha" =~ ^[0-9a-f]{40}$ ]] || fail "lock has a non-SHA commit: '$sha'"
  done < <(jq -r '.sources[].commit' "$LOCK_FILE")
  if jq -e '.sources[] | has("ref") or has("branch")' "$LOCK_FILE" | grep -q true; then
    fail "a lock source carries a ref/branch (must be commit-pinned only)"
  fi
  ok "no pinned-upstream skill follows an unpinned ref"
fi

# Wrapper relationships.
while IFS= read -r w; do
  [[ -n "$w" ]] || continue
  wraps="$(jq -r --arg w "$w" '.skills[$w].wraps // [] | sort | join(",")' "$WORKFLOW_FILE")"
  uses="$(jq -r --arg w "$w" '[.wrappers[] | select(.wrapper==$w) | (.uses // []) + (.optionally_cooperates_with // [])] | add | unique | sort | join(",")' "$WORKFLOW_FILE")"
  [[ "$wraps" == "$uses" && -n "$wraps" ]] \
    && ok "wrapper $w: declared wraps matches uses + optional ($wraps)" \
    || fail "wrapper $w: wraps='$wraps' vs uses+optional='$uses' disagree"
done < <(jq -r '.wrappers[]?.wrapper' "$WORKFLOW_FILE")

# Clean-reader guardrails.
jq -e '.clean_reader.skill == "reader-test"' "$WORKFLOW_FILE" >/dev/null \
  && ok "clean_reader.skill is reader-test" || fail "clean_reader.skill is not reader-test"
jq -e '.clean_reader.must_exclude | index("human-systems-context")' "$WORKFLOW_FILE" >/dev/null \
  && ok "clean_reader excludes human-systems-context" \
  || fail "clean_reader.must_exclude does not list human-systems-context"
jq -e '.clean_reader.auth_required_for_validation == false' "$WORKFLOW_FILE" >/dev/null \
  && ok "clean_reader needs no auth for validation" \
  || fail "clean_reader.auth_required_for_validation is not false"
jq -e '.clean_reader.required_for_devcontainer_startup == false' "$WORKFLOW_FILE" >/dev/null \
  && ok "clean_reader not required for devcontainer startup" \
  || fail "clean_reader.required_for_devcontainer_startup is not false"

# Explicit-human-intent gates.
for cls in manuscript-work publication; do
  jq -e --arg c "$cls" '.task_classes[$c].requires_explicit_user_intent == true' "$WORKFLOW_FILE" >/dev/null \
    && ok "$cls requires explicit user intent" \
    || fail "$cls does not require explicit user intent"
done
jq -e '.explicit_human_intent_gates | (index("manuscript-work") and index("publication"))' "$WORKFLOW_FILE" >/dev/null \
  && ok "explicit_human_intent_gates lists manuscript-work and publication" \
  || fail "explicit_human_intent_gates incomplete"

# load_manuscript_rules true only for manuscript-work.
bad="$(jq -r '.task_classes | to_entries[] | select(.key != "manuscript-work" and .value.load_manuscript_rules == true) | .key' "$WORKFLOW_FILE")"
[[ -z "$bad" ]] && ok "manuscript rules load only for manuscript-work" \
  || fail "load_manuscript_rules is true outside manuscript-work: $bad"

exit $(( errors > 0 ? 1 : 0 ))
