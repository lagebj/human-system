#!/usr/bin/env bash
#
# Validation self-tests: prove the checks actually catch known-bad configs.
# Each fixture is the real config with one defect; the matching check must fail.
# The real configs are also re-run here and must pass.
#
#   bash scripts/tests/run.sh
#
# Exit 0 = all expectations met.
set -Euo pipefail

root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$root"
F="$root/scripts/tests/fixtures"
lib="$root/scripts/lib"

pass=0 failcount=0
expect_fail() { # <label> <cmd...>
  local label="$1"; shift
  if "$@" >/dev/null 2>&1; then
    printf '  [BAD]  %s — check passed but should have failed\n' "$label" >&2
    failcount=$((failcount + 1))
  else
    printf '  [OK]   %s — correctly rejected\n' "$label"
    pass=$((pass + 1))
  fi
}
expect_pass() { # <label> <cmd...>
  local label="$1"; shift
  if "$@" >/dev/null 2>&1; then
    printf '  [OK]   %s — correctly accepted\n' "$label"
    pass=$((pass + 1))
  else
    printf '  [BAD]  %s — check failed but should have passed\n' "$label" >&2
    failcount=$((failcount + 1))
  fi
}

printf '=== workflow-config checks ===\n'
expect_pass "real workflow.json" \
  bash "$lib/check-workflow.sh"
expect_fail "workflow: unknown skill reference" \
  env WORKFLOW_FILE="$F/workflow-unknown-skill.json" bash "$lib/check-workflow.sh"
expect_fail "workflow: unresolvable pinned-upstream skill" \
  env WORKFLOW_FILE="$F/workflow-unpinned-upstream.json" bash "$lib/check-workflow.sh"
expect_fail "workflow: clean-reader does not exclude human-systems-context" \
  env WORKFLOW_FILE="$F/workflow-clean-reader-leak.json" bash "$lib/check-workflow.sh"
expect_fail "workflow: missing publication explicit-intent gate" \
  env WORKFLOW_FILE="$F/workflow-missing-publication-gate.json" bash "$lib/check-workflow.sh"

printf '\n=== pinned-skill lock checks ===\n'
expect_pass "real agent-skills.json + lock" \
  bash "$lib/check-pinned-skills.sh"
expect_fail "lock: malformed commit SHA" \
  env LOCK_FILE="$F/lock-malformed-sha.json" bash "$lib/check-pinned-skills.sh"
expect_fail "lock: skill entry missing path" \
  env LOCK_FILE="$F/lock-missing-path.json" bash "$lib/check-pinned-skills.sh"
expect_fail "desired/lock skill-path mismatch" \
  env DESIRED_FILE="$F/desired-lock-mismatch.json" bash "$lib/check-pinned-skills.sh"

printf '\n=== summary ===\n'
printf 'expectations met: %d, unmet: %d\n' "$pass" "$failcount"
exit $(( failcount > 0 ? 1 : 0 ))
