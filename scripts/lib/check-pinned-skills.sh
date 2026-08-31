#!/usr/bin/env bash
#
# Validate the pinned upstream Agent Skill configuration.
# Overridable for fixture tests: DESIRED_FILE, LOCK_FILE, PROVENANCE_FILE.
#
# Exit 0 = pass, 1 = fail.
set -Eeuo pipefail

root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
DESIRED_FILE="${DESIRED_FILE:-$root/.devcontainer/agent-skills.json}"
LOCK_FILE="${LOCK_FILE:-$root/.devcontainer/agent-skills.lock.json}"
PROVENANCE_FILE="${PROVENANCE_FILE:-$root/docs/development/agent-skill-provenance.md}"

errors=0
fail() { printf '  [FAIL] %s\n' "$1" >&2; errors=$((errors + 1)); }
ok()   { printf '  [OK] %s\n' "$1"; }

command -v jq >/dev/null || { echo "jq required" >&2; exit 2; }

for f in "$DESIRED_FILE" "$LOCK_FILE"; do
  [[ -f "$f" ]] || { fail "missing: $f"; exit 1; }
  jq -e . "$f" >/dev/null 2>&1 || { fail "not valid JSON: $f"; exit 1; }
done
ok "agent-skills.json and agent-skills.lock.json are valid JSON"

# Lock: every source fully specified and commit-pinned.
n="$(jq '.sources | length' "$LOCK_FILE")"
[[ "$n" -ge 1 ]] && ok "lock has $n source(s)" || fail "lock has no sources"

while IFS= read -r row; do
  json="$(printf '%s' "$row" | base64 -d)"
  id="$(jq -r '.id // empty' <<<"$json")"
  repo="$(jq -r '.repository // empty' <<<"$json")"
  commit="$(jq -r '.commit // empty' <<<"$json")"
  lic="$(jq -r '.license // empty' <<<"$json")"
  prov="$(jq -r '.provenance // empty' <<<"$json")"
  [[ -n "$id" ]]   || fail "lock source with no id"
  [[ -n "$repo" ]] || fail "lock source $id: no repository"
  [[ "$commit" =~ ^[0-9a-f]{40}$ ]] || fail "lock source $id: commit is not a 40-hex SHA ('$commit')"
  [[ -n "$lic" ]]  || fail "lock source $id: no license"
  [[ -n "$prov" ]] || fail "lock source $id: no provenance reference"
  if jq -e 'has("ref") or has("branch")' <<<"$json" | grep -q true; then
    fail "lock source $id carries ref/branch — must be commit-pinned only"
  fi
  # Each skill has path + name.
  sc="$(jq '.skills | length' <<<"$json")"
  [[ "$sc" -ge 1 ]] || fail "lock source $id: no skills"
  jq -e '.skills | all(has("path") and has("name"))' <<<"$json" >/dev/null \
    || fail "lock source $id: a skill entry lacks path or name"
  # Provenance doc mentions this id.
  grep -q "$id" "$PROVENANCE_FILE" 2>/dev/null \
    && : || fail "provenance doc does not mention lock source: $id"
done < <(jq -r '.sources[] | @base64' "$LOCK_FILE")
[[ "$errors" -eq 0 ]] && ok "every lock source is commit-pinned, licensed, and has provenance" || true

# Desired: every source fully specified.
while IFS= read -r row; do
  json="$(printf '%s' "$row" | base64 -d)"
  id="$(jq -r '.id // empty' <<<"$json")"
  [[ -n "$id" ]] || fail "desired source with no id"
  jq -e 'has("repository") and has("skills") and has("license") and has("purpose")' <<<"$json" >/dev/null \
    || fail "desired source $id: missing repository/skills/license/purpose"
  jq -e '.skills | all(has("path") and has("name"))' <<<"$json" >/dev/null \
    || fail "desired source $id: a skill entry lacks path or name"
done < <(jq -r '.sources[] | @base64' "$DESIRED_FILE")

# Desired vs lock: same ids, same skill paths per id.
d_ids="$(jq -r '.sources[].id' "$DESIRED_FILE" | sort)"
l_ids="$(jq -r '.sources[].id' "$LOCK_FILE" | sort)"
if [[ "$d_ids" == "$l_ids" ]]; then
  ok "desired and lock cover the same source ids"
else
  fail "desired/lock id mismatch"$'\n'"  desired: $(tr '\n' ' ' <<<"$d_ids")"$'\n'"  lock:    $(tr '\n' ' ' <<<"$l_ids")"
fi
while IFS= read -r id; do
  [[ -n "$id" ]] || continue
  dp="$(jq -r --arg i "$id" '.sources[]|select(.id==$i)|.skills[].path' "$DESIRED_FILE" | sort | tr '\n' ',')"
  lp="$(jq -r --arg i "$id" '.sources[]|select(.id==$i)|.skills[].path' "$LOCK_FILE" | sort | tr '\n' ',')"
  [[ "$dp" == "$lp" ]] && ok "source $id: desired and lock request the same skill paths" \
    || fail "source $id: skill path mismatch (desired='$dp' lock='$lp')"
done <<<"$d_ids"

exit $(( errors > 0 ? 1 : 0 ))
