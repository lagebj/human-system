#!/usr/bin/env bash
#
# Repository structure validation for Human System.
#
# Detects structural problems in the operating model without a build system:
# missing required files, broken instruction/source path references, manuscript
# canonical-path ambiguity, ADR status inconsistency, stale current-state
# metadata, duplicate current-state files, and accidental manuscript edits.
#
# Exit 0 = all checks passed. Exit 1 = one or more checks failed.
#
# Usage: bash scripts/validate-repo.sh

set -Eeuo pipefail

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$repo_root"

errors=0
fail() { printf '[FAIL] %s\n' "$1" >&2; errors=$((errors + 1)); }
ok()   { printf '[OK] %s\n' "$1"; }
info() { printf '[INFO] %s\n' "$1"; }

printf '=== Human System Repository Validation ===\n\n'

# 1. Required files ------------------------------------------------------------
echo '--- Required files ---'
required=(
  "AGENTS.md"
  "CLAUDE.md"
  "README.md"
  "manuscript/human.md"
  "docs/current-state.md"
  "docs/decisions/001-editorial-workflow-and-source-authority.md"
  "docs/decisions/002-repository-operating-model-and-source-authority.md"
  ".agents/skills/human-systems-context/SKILL.md"
  ".agents/skills/human-systems-context/resources/context/RESOURCE_MAP.md"
  ".agents/skills/human-systems-context/resources/source/core_stance/contextual-intervention.md"
  ".agents/skills/human-systems-context/resources/playbooks/working-session.md"
)
for f in "${required[@]}"; do
  if [[ -f "$f" ]]; then ok "$f"; else fail "missing required file: $f"; fi
done
printf '\n'

# 2. Referenced instruction/source paths resolve ----------------------------
echo '--- Referenced paths resolve ---'
# Pull repo-relative paths out of the routing files and confirm they exist.
scan_files=(
  "AGENTS.md"
  ".agents/skills/human-systems-context/SKILL.md"
  ".agents/skills/human-systems-context/resources/playbooks/working-session.md"
  "docs/current-state.md"
  "docs/decisions/002-repository-operating-model-and-source-authority.md"
)
missing_paths=0
for sf in "${scan_files[@]}"; do
  [[ -f "$sf" ]] || continue
  # Match tokens that look like repo paths: start with docs/, scripts/,
  # manuscript/, or resources/ and end at whitespace, backtick, paren, comma.
  while IFS= read -r ref; do
    [[ -n "$ref" ]] || continue
    # Normalise a leading resources/ to the skill root.
    if [[ "$ref" == resources/* ]]; then
      candidate=".agents/skills/human-systems-context/$ref"
    else
      candidate="$ref"
    fi
    if [[ -e "$candidate" ]]; then
      :
    else
      fail "$sf references non-existent path: $ref"
      missing_paths=$((missing_paths + 1))
    fi
  done < <(grep -oE '(docs|scripts|manuscript|resources)/[A-Za-z0-9._/-]+\.(md|sh|py)' "$sf" | sort -u)
done
[[ "$missing_paths" -eq 0 ]] && ok "all scanned path references resolve"
printf '\n'

# 3. Manuscript canonical path ---------------------------------------------
echo '--- Manuscript canonical path ---'
if [[ -f "manuscript/human.md" ]]; then
  ok "canonical manuscript: manuscript/human.md"
else
  fail "canonical manuscript missing: manuscript/human.md"
fi
snapshot=".agents/skills/human-systems-context/resources/source/book_work/human.md"
if [[ -f "$snapshot" ]]; then
  if grep -qiE 'stale snapshot|context.loading only|do not edit' \
      docs/current-state.md AGENTS.md \
      .agents/skills/human-systems-context/SKILL.md 2>/dev/null; then
    ok "book_work/human.md present and marked as a stale snapshot"
  else
    fail "book_work/human.md present but not marked as a stale snapshot anywhere authoritative"
  fi
fi
printf '\n'

# 4. ADR status consistency ---------------------------------------------------
echo '--- ADR status consistency ---'
adr1="docs/decisions/001-editorial-workflow-and-source-authority.md"
adr2="docs/decisions/002-repository-operating-model-and-source-authority.md"
if grep -qiE '^\*\*Status:\*\*\s*Superseded' "$adr1"; then
  ok "ADR 001 marked Superseded"
else
  fail "ADR 001 is not marked Superseded (ADR 002 replaces it as the operating model)"
fi
if grep -qi 'Superseded by.*002' "$adr1"; then
  ok "ADR 001 points forward to ADR 002"
else
  fail "ADR 001 does not link forward to ADR 002"
fi
if grep -qiE '^\*\*Status:\*\*\s*Accepted' "$adr2"; then
  ok "ADR 002 marked Accepted"
else
  fail "ADR 002 is not marked Accepted"
fi
if grep -qi 'Supersedes:.*001' "$adr2"; then
  ok "ADR 002 links back to ADR 001"
else
  fail "ADR 002 does not link back to ADR 001"
fi
printf '\n'

# 5. current-state.md freshness + uniqueness --------------------------------
echo '--- current-state.md ---'
cs_count="$(find . -name current-state.md -not -path './.git/*' | wc -l | tr -d ' ')"
if [[ "$cs_count" == "1" ]]; then
  ok "single current-state.md"
else
  fail "expected exactly one current-state.md, found $cs_count"
fi
if grep -qE '^\*\*Last verified:\*\*[[:space:]]*[0-9]{4}-[0-9]{2}-[0-9]{2}' docs/current-state.md; then
  ok "current-state.md has a Last verified date"
else
  fail "current-state.md has no 'Last verified: YYYY-MM-DD' line"
fi
if grep -qiE 'publication-ready|all contracts met|final editorial pass complete' docs/current-state.md README.md; then
  fail "stale completion/publication claim found in current-state.md or README.md"
else
  ok "no stale publication-ready claims in current-state.md / README.md"
fi
printf '\n'

# 6. Manuscript untouched vs origin/main ----------------------------------
echo '--- Manuscript integrity ---'
base_ref=""
for ref in origin/main main; do
  if git rev-parse --verify --quiet "$ref" >/dev/null; then base_ref="$ref"; break; fi
done
if [[ -n "$base_ref" ]]; then
  if git diff --quiet "$base_ref" -- manuscript/human.md; then
    ok "manuscript/human.md has no diff against $base_ref"
  else
    fail "manuscript/human.md differs from $base_ref (should be untouched by non-manuscript work)"
    git --no-pager diff --stat "$base_ref" -- manuscript/human.md >&2 || true
  fi
else
  info "no main/origin/main ref available; skipping manuscript diff check"
fi
printf '\n'

# Summary -----------------------------------------------------------------------
printf '=== Validation complete ===\n'
if [[ "$errors" -eq 0 ]]; then
  printf 'All checks passed.\n'
  exit 0
fi
printf '%d check(s) failed.\n' "$errors" >&2
exit 1
