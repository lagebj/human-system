#!/usr/bin/env bash
#
# Canonical Human System repository validation.
#
# One entrypoint, run identically locally and in CI
# (.github/workflows/validate.yml). Deterministic, non-interactive. Requires no
# Claude or OpenCode authentication and does no live web research.
#
#   bash scripts/validate.sh
#
# Composes focused checks in scripts/lib/. Exit 0 = all passed, 1 = a check
# failed, 2 = harness error.
set -Euo pipefail

root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$root"
lib="$root/scripts/lib"

checks=(
  "Repository structure:check-structure.sh"
  "Workflow configuration:check-workflow.sh"
  "Pinned upstream Agent Skills:check-pinned-skills.sh"
  "Licensing / REUSE:check-licensing.sh"
  "Claude / OpenCode parity:check-parity.sh"
  "Site build and publication boundary:check-site.sh"
)

# Self-tests (fixtures) run last, out-of-band from the check list.
run_selftests() {
  printf -- '--- Validation self-tests ---\n'
  if bash "$root/scripts/tests/run.sh"; then
    return 0
  fi
  return 1
}

failed=()
printf '=== Human System validation ===\n\n'
for entry in "${checks[@]}"; do
  title="${entry%%:*}"
  script="$lib/${entry##*:}"
  printf -- '--- %s ---\n' "$title"
  if [[ ! -x "$script" && ! -f "$script" ]]; then
    printf '  [FAIL] missing check script: %s\n' "$script" >&2
    failed+=("$title")
    printf '\n'
    continue
  fi
  if bash "$script"; then
    :
  else
    failed+=("$title")
  fi
  printf '\n'
done

run_selftests || failed+=("Validation self-tests")
printf '\n'

printf '=== Summary ===\n'
if [[ "${#failed[@]}" -eq 0 ]]; then
  printf 'All checks passed.\n'
  exit 0
fi
printf 'FAILED: %s\n' "${failed[*]}" >&2
exit 1
