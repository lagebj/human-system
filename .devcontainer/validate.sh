#!/usr/bin/env bash
set -Eeuo pipefail

workspace="${CODESPACE_VSCODE_FOLDER:-$(git rev-parse --show-toplevel 2>/dev/null || pwd)}"
cd "$workspace"

errors=0

printf '=== Human System Devcontainer Validation ===\n\n'

# 1. Tool versions
printf '%s\n' '--- Tool Versions ---'
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
printf '%s\n' '--- User Check ---'
if [[ "$(id -u)" != "0" ]]; then
  printf '[OK] Running as non-root user: %s (uid %s)\n' "$(id -un)" "$(id -u)"
else
  printf '[FAIL] Running as root — devcontainer should use non-root user\n' >&2
  errors=$((errors + 1))
fi

printf '\n'

# 3. Volume ownership check
printf '%s\n' '--- Volume Ownership ---'
for dir in \
  "$HOME/.claude" \
  "$HOME/.config/opencode"
do
  if [[ -d "$dir" ]]; then
    dir_owner="$(stat -c '%u:%g' "$dir" 2>/dev/null || stat -f '%u:%g' "$dir" 2>/dev/null || echo 'unknown')"
    if [[ "$dir_owner" == "$(id -u):$(id -g)" ]]; then
      printf '[OK] %s owned by %s\n' "$dir" "$dir_owner"
    else
      printf '[FAIL] %s owned by %s (expected %s:%s)\n' "$dir" "$dir_owner" "$(id -u)" "$(id -g)" >&2
      errors=$((errors + 1))
    fi
  else
    printf '[INFO] %s does not exist yet\n' "$dir"
  fi
done

for dir in \
  "$HOME/.config/opencode/skills" \
  "$HOME/.config/opencode/instructions"
do
  if [[ -d "$dir" ]]; then
    if [[ -w "$dir" ]]; then
      printf '[OK] %s is writable\n' "$dir"
    else
      printf '[FAIL] %s is not writable by current user\n' "$dir" >&2
      errors=$((errors + 1))
    fi
  else
    if touch "$dir" 2>/dev/null; then
      rmdir "$dir"
      printf '[OK] %s can be created\n' "$dir"
    else
      printf '[FAIL] Cannot create %s — permission denied\n' "$dir" >&2
      errors=$((errors + 1))
    fi
  fi
done

printf '\n'

# 4. Agent parity validation
printf '%s\n' '--- Agent Parity ---'
bash .devcontainer/validate-agent-parity.sh || errors=$((errors + $?))

printf '\n'

# 5. Worktree integrity — no tracked changes introduced by lifecycle
printf '%s\n' '--- Worktree Integrity ---'
git_status="$(git status --porcelain)"
if [[ -z "$git_status" ]]; then
  printf '[OK] Git worktree is clean (no tracked changes from lifecycle)\n'
else
  printf '[FAIL] Git worktree has changes:\n' >&2
  printf '%s\n' "$git_status" >&2
  errors=$((errors + 1))
fi

printf '\n'

# 6. No secrets in tracked files
printf '%s\n' '--- Secret Scan ---'
secret_patterns=(
  'ANTHROPIC_API_KEY=sk-'
  'OLLAMA_API_KEY=sk-'
  'password='
  'secret_key='
  'token=ghp_'
)

# Exclude this script itself: it defines the patterns above, so scanning it
# would always self-match.
secret_hits=0
scan_files="$(git ls-files | grep -vx '.devcontainer/validate.sh')"
for pattern in "${secret_patterns[@]}"; do
  if printf '%s\n' "$scan_files" | xargs -r grep -l -F -e "$pattern" 2>/dev/null | grep -q .; then
    printf '[FAIL] Potential secret found matching pattern: %s\n' "$pattern" >&2
    errors=$((errors + 1))
    secret_hits=$((secret_hits + 1))
  fi
done
if [[ "$secret_hits" -eq 0 ]]; then
  printf '[OK] No hardcoded secrets found in tracked files\n'
fi

printf '\n'

# 7. Manuscript untouched
printf '%s\n' '--- Manuscript Integrity ---'
manuscript_head="$(git show HEAD:manuscript/human.md 2>/dev/null | sha256sum || echo 'N/A')"
manuscript_disk="$(sha256sum < manuscript/human.md 2>/dev/null || echo 'N/A')"
if [[ "$manuscript_head" == "$manuscript_disk" ]]; then
  printf '[OK] manuscript/human.md unchanged\n'
else
  printf '[WARN] manuscript/human.md has working-tree changes (expected if editing)\n'
fi

printf '\n'

# 8. Mutable state isolation — check that agent config points to Human System scoped paths
printf '%s\n' '--- State Isolation ---'
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

# 9. No application infrastructure
printf '%s\n' '--- Application Infrastructure Check ---'
for pkg in postgresql-client prisma vercel brevo astro; do
  if command -v "$pkg" >/dev/null 2>&1; then
    printf '[FAIL] Application infrastructure found: %s (should not be in this devcontainer)\n' "$pkg" >&2
    errors=$((errors + 1))
  fi
done
printf '[OK] No application infrastructure packages detected\n'

printf '\n'

# 10. Dotenv auto-load
printf '%s\n' '--- Dotenv Auto-load ---'
if [[ -f .devcontainer/load-dotenv.sh ]]; then
  printf '[OK] .devcontainer/load-dotenv.sh present\n'
else
  printf '[FAIL] .devcontainer/load-dotenv.sh missing\n' >&2
  errors=$((errors + 1))
fi

# Verify load-dotenv.sh has the Codespaces guard.
if [[ -f .devcontainer/load-dotenv.sh ]] \
   && grep -qF 'CODESPACES' .devcontainer/load-dotenv.sh; then
  printf '[OK] load-dotenv.sh has Codespaces guard\n'
else
  printf '[FAIL] load-dotenv.sh is missing Codespaces guard\n' >&2
  errors=$((errors + 1))
fi

# Verify load-dotenv.sh respects environment precedence (does not overwrite).
if [[ -f .devcontainer/load-dotenv.sh ]] \
   && grep -qF '!__hs_key+x' .devcontainer/load-dotenv.sh; then
  printf '[OK] load-dotenv.sh respects environment precedence\n'
else
  printf '[FAIL] load-dotenv.sh does not guard against overwriting existing env vars\n' >&2
  errors=$((errors + 1))
fi

hook_marker='# >>> human-system dotenv auto-load >>>'
hook_found=0
for rc in "$HOME/.bashrc" "$HOME/.profile" /etc/profile.d/99-human-system-dotenv.sh; do
  if [[ -f "$rc" ]] && grep -qF "$hook_marker" "$rc" 2>/dev/null; then
    hook_found=1
    printf '[OK] .env auto-load hook installed in %s\n' "$rc"
  fi
done
if [[ "$hook_found" -eq 0 ]]; then
  printf '[WARN] .env auto-load hook not found (run post-create.sh)\n' >&2
fi

if [[ -f .env ]]; then
  printf '[OK] .env present (local devcontainer)\n'
else
  printf '[INFO] no .env file (expected in Codespaces; use Codespaces secrets)\n'
fi

# 11. OpenCode provider configuration
printf '%s\n' '--- OpenCode Provider Config ---'
if [[ -f opencode.json ]]; then
  # Verify the default model.
  default_model="$(jq -r '.model // empty' opencode.json 2>/dev/null || echo '')"
  if [[ -n "$default_model" ]]; then
    printf '[OK] default model: %s\n' "$default_model"
  else
    printf '[FAIL] no default model set in opencode.json\n' >&2
    errors=$((errors + 1))
  fi

  # Verify local Ollama provider is configured.
  if jq -e '.provider.ollama' opencode.json >/dev/null 2>&1; then
    printf '[OK] local Ollama provider configured\n'
  else
    printf '[FAIL] local Ollama provider missing in opencode.json\n' >&2
    errors=$((errors + 1))
  fi

  # Verify Ollama Cloud provider references OLLAMA_API_KEY via env: interpolation.
  if grep -q '"apiKey".*"{env:OLLAMA_API_KEY}"' opencode.json; then
    printf '[OK] Ollama Cloud provider references OLLAMA_API_KEY via env: interpolation\n'
  else
    printf '[FAIL] Ollama Cloud provider does not reference OLLAMA_API_KEY via {env:...} interpolation\n' >&2
    errors=$((errors + 1))
  fi

  # Verify no literal API key in opencode.json.
  if grep -qE '"apiKey".*"[0-9a-f]{8,}"' opencode.json; then
    printf '[FAIL] opencode.json contains a literal API key (should use {env:...})\n' >&2
    errors=$((errors + 1))
  else
    printf '[OK] no literal API key in opencode.json\n'
  fi
else
  printf '[FAIL] opencode.json missing\n' >&2
  errors=$((errors + 1))
fi

# 12. .env is gitignored
printf '%s\n' '--- .env Gitignore ---'
if git check-ignore .env >/dev/null 2>&1; then
  printf '[OK] .env is gitignored\n'
else
  printf '[FAIL] .env is not gitignored (secrets must not be tracked)\n' >&2
  errors=$((errors + 1))
fi

printf '\n=== Validation Complete ===\n'
if [[ "$errors" -eq 0 ]]; then
  printf 'All checks passed.\n'
  exit 0
else
  printf '%d check(s) failed.\n' "$errors" >&2
  exit 1
fi