#!/usr/bin/env bash
#
# Claude / OpenCode skill parity — container-independent structural checks,
# plus the real devcontainer parity check when its manifest is present.
#
# Exit 0 = pass, 1 = fail.
set -Eeuo pipefail

root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$root"

errors=0
fail() { printf '  [FAIL] %s\n' "$1" >&2; errors=$((errors + 1)); }
ok()   { printf '  [OK] %s\n' "$1"; }
skip() { printf '  [SKIP] %s\n' "$1"; }

sync=".devcontainer/sync-agent-skills.sh"
if [[ -f "$sync" ]]; then
  grep -q 'opencode_skills_root' "$sync" && grep -q 'claude_skills_root' "$sync" \
    && ok "sync links skills into both OpenCode and Claude roots" \
    || fail "sync script does not target both agent skill roots"
  grep -q 'pinned_lock_file' "$sync" \
    && ok "sync processes the pinned lock file" \
    || fail "sync script does not reference the pinned lock file"
else
  fail "$sync missing"
fi

# Repo-local skills: frontmatter name must equal directory name.
while IFS= read -r f; do
  d="$(basename "$(dirname "$f")")"
  n="$(awk 'NR==1&&$0=="---"{x=1;next} x&&$0=="---"{exit} x&&/^name:/{sub(/^name:[[:space:]]*/,"");gsub(/["'"'"']/,"");print;exit}' "$f")"
  [[ "$n" == "$d" ]] && ok "repo-local skill name matches dir: $d" \
    || fail "repo-local skill $d: frontmatter name '$n' != dir name"
done < <(find .agents/skills -mindepth 2 -maxdepth 2 -name SKILL.md | sort)

# Generated skill state must not be tracked.
tracked_state="$(git ls-files | grep -E '^\.claude/skills/|human-system-agent-skills/' || true)"
[[ -z "$tracked_state" ]] && ok "no generated skill links/checkouts are tracked" \
  || fail "tracked generated skill state:"$'\n'"$tracked_state"
grep -qE '^\.claude/skills/?$' .gitignore && ok ".gitignore excludes .claude/skills/" \
  || fail ".gitignore does not exclude .claude/skills/"

# Real parity check when the devcontainer manifest exists.
manifest="${XDG_DATA_HOME:-$HOME/.local/share}/human-system-agent-skills/managed-skills.txt"
if [[ -f "$manifest" && -x .devcontainer/validate-agent-parity.sh ]]; then
  if bash .devcontainer/validate-agent-parity.sh >/tmp/hs-parity.$$ 2>&1; then
    ok "devcontainer agent-parity validation passed"
  else
    fail "devcontainer agent-parity validation failed:"$'\n'"$(sed 's/^/    /' /tmp/hs-parity.$$)"
  fi
  rm -f /tmp/hs-parity.$$
else
  skip "devcontainer skill manifest not present — structural parity checks only"
fi

exit $(( errors > 0 ? 1 : 0 ))
