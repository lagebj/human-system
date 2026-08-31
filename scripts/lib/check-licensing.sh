#!/usr/bin/env bash
#
# Validate licensing / REUSE metadata.
# Runs `reuse lint` when available (CI installs it); otherwise does structural
# checks and notes the skip.
#
# Exit 0 = pass, 1 = fail.
set -Eeuo pipefail

root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$root"

errors=0
fail() { printf '  [FAIL] %s\n' "$1" >&2; errors=$((errors + 1)); }
ok()   { printf '  [OK] %s\n' "$1"; }
skip() { printf '  [SKIP] %s\n' "$1"; }

# Only licences actually referenced by files may live in LICENSES/ (an unused
# licence there fails `reuse lint`). CC-BY-NC-SA-4.0 is added when the first
# published artifact is assigned it — see LICENSE.md.
for f in LICENSES/MPL-2.0.txt LICENSES/LicenseRef-All-Rights-Reserved.txt; do
  [[ -s "$f" ]] && ok "license text present: $f" || fail "missing or empty: $f"
done
grep -q "CC-BY-NC-SA-4.0" LICENSE.md \
  && ok "LICENSE.md documents the CC-BY-NC-SA-4.0 category for future published material" \
  || fail "LICENSE.md does not mention the CC-BY-NC-SA-4.0 category"
[[ -f LICENSE.md ]] && ok "LICENSE.md present" || fail "LICENSE.md missing"
[[ -f THIRD_PARTY_NOTICES.md ]] && ok "THIRD_PARTY_NOTICES.md present" || fail "THIRD_PARTY_NOTICES.md missing"

if [[ -f REUSE.toml ]]; then
  if command -v python3 >/dev/null; then
    if python3 - <<'PY'
import sys
try:
    import tomllib
except ModuleNotFoundError:
    sys.exit(0)  # older python; skip structural parse
with open("REUSE.toml", "rb") as fh:
    data = tomllib.load(fh)
assert data.get("version") == 1, "REUSE.toml version must be 1"
anns = data.get("annotations", [])
assert anns, "REUSE.toml has no [[annotations]]"
for a in anns:
    assert "SPDX-License-Identifier" in a, "annotation missing SPDX-License-Identifier"
    assert "SPDX-FileCopyrightText" in a, "annotation missing SPDX-FileCopyrightText"
PY
    then ok "REUSE.toml parses and is structurally valid"
    else fail "REUSE.toml failed structural validation"
    fi
  fi
else
  fail "REUSE.toml missing"
fi

if command -v reuse >/dev/null 2>&1; then
  if reuse lint; then
    ok "reuse lint passed"
  else
    fail "reuse lint failed (see output above)"
  fi
else
  skip "reuse not installed — 'reuse lint' runs in CI (.github/workflows/validate.yml)"
fi

exit $(( errors > 0 ? 1 : 0 ))
