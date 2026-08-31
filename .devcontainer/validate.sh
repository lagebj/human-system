#!/usr/bin/env bash
set -Eeuo pipefail

workspace="${CODESPACE_VSCODE_FOLDER:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
cd "$workspace"

errors=0

printf '=== Human System Devcontainer Validation ===\n\n'

# 1. Tool versions
printf '--- Tool Versions ---\n'
printf 'Node: %s\n' "$(node --version)"
printf 'npm: %s\n' "$(npm --version)"
printf 'git: %s\n' "$(git --version)"
printf 'gh: %s\n' "$(gh --version 2>/dev/null | head -1 || echo 'NOT FOUND')"
printf 'jq: %s\n' "$(jq --version)"
printf 'rg: %s\n' "$(rg --version | head -1)"
printf 'OpenCode: %s\n' "$(opencode --version 2>/dev/null || echo 'NOT FOUND')"

if command -v claude >/dev/null 2>&1; then
  printf 'Claude Code: %s\n' "$(claude --version 2>/dev/null || echo 'installed (version unavailable)')"
else
  printf 'Claude Code: NOT FOUND\n'
  errors=$((errors + 1))
fi

printf '\n'

# 2. Non-root user check
printf '--- User Check ---\n'
if [[ "$(id -u)" != "0" ]]; then
  printf '[OK] Running as non-root user: %s (uid %s)\n' "$(id -un)" "$(id -u)"
else
  printf '[FAIL] Running as root — devcontainer should use non-root user\n' >&2
  errors=$((errors + 1))
fi

printf '\n'

# 3. Agent parity validation
printf '--- Agent Parity ---\n'
bash .devcontainer/validate-agent-parity.sh || errors=$((errors + $?))

printf '\n'

# 4. Worktree integrity — no tracked changes introduced by lifecycle
printf '--- Worktree Integrity ---\n'
git_status="$(git status --porcelain)"
if [[ -z "$git_status" ]]; then
  printf '[OK] Git worktree is clean (no tracked changes from lifecycle)\n'
else
  printf '[FAIL] Git worktree has changes:\n' >&2
  printf '%s\n' "$git_status" >&2
  errors=$((errors + 1))
fi

printf '\n'

# 5. No secrets in tracked files
printf '--- Secret Scan ---\n'
secret_patterns=(
  'ANTHROPIC_API_KEY=sk-'
  'OLLAMA_API_KEY=sk-'
  'password='
  'secret_key='
  'token=ghp_'
)

for pattern in "${secret_patterns[@]}"; do
  if git ls-files | xargs grep -rl "$pattern" 2>/dev/null | head -1 | grep -q .; then
    printf '[FAIL] Potential secret found matching pattern: %s\n' "$pattern" >&2
    errors=$((errors + 1))
  fi
done
printf '[OK] No hardcoded secrets found in tracked files\n'

printf '\n'

# 6. Manuscript untouched
printf '--- Manuscript Integrity ---\n'
manuscript_head="$(git show HEAD:manuscript/human.md 2>/dev/null | sha256sum || echo 'N/A')"
manuscript_disk="$(sha256sum < manuscript/human.md 2>/dev/null || echo 'N/A')"
if [[ "$manuscript_head" == "$manuscript_disk" ]]; then
  printf '[OK] manuscript/human.md unchanged\n'
else
  printf '[WARN] manuscript/human.md has working-tree changes (expected if editing)\n'
fi

printf '\n'

# 7. Mutable state isolation — check that agent config points to Human System scoped paths
printf '--- State Isolation ---\n'
claude_config="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
printf 'Claude config dir: %s\n' "$claude_config"

opencode_config="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
printf 'OpenCode config dir: %s\n' "$opencode_config"

# Check for accidental Matchboard references
matchboard_refs="$(grep -rl 'matchboard' .devcontainer/ 2>/dev/null | grep -v 'README.md' | grep -v 'validate.sh' || true)"
if [[ -z "$matchboard_refs" ]]; then
  printf '[OK] No accidental Matchboard references in devcontainer scripts\n'
else
  printf '[WARN] Potential Matchboard references found in:\n' >&2
  printf '%s\n' "$matchboard_refs" >&2
  for f in $matchboard_refs; do
    grep -n 'matchboard' "$f" | head -5
  done
fi

printf '\n'

# 8. No application infrastructure
printf '--- Application Infrastructure Check ---\n'
for pkg in postgresql-client prisma vercel brevo astro; do
  if command -v "$pkg" >/dev/null 2>&1; then
    printf '[FAIL] Application infrastructure found: %s (should not be in this devcontainer)\n' "$pkg" >&2
    errors=$((errors + 1))
  fi
done
printf '[OK] No application infrastructure packages detected\n'

printf '\n=== Validation Complete ===\n'
if [[ "$errors" -eq 0 ]]; then
  printf 'All checks passed.\n'
  exit 0
else
  printf '%d check(s) failed.\n' "$errors" >&2
  exit 1
fi