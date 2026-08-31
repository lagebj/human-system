#!/usr/bin/env bash
#
# Load workspace .env into the current environment.
#
# Meant to be *sourced*, not executed:
#
#   . .devcontainer/load-dotenv.sh
#
# It reads KEY=VALUE lines from the gitignored .env at the workspace root and
# exports them. It is safe to source repeatedly and safe to source when .env
# does not exist (Codespaces, fresh clones), in which case it is a silent no-op.
#
# The devcontainer wires this into shell startup (see post-create.sh) so that
# .env values are present in every terminal, in the VS Code environment probe,
# and in the lifecycle scripts — without committing secrets.

# Resolve the workspace root. Prefer the well-known devcontainer path, then an
# explicit override, then the git top level, then the current directory.
if [ -n "${HUMAN_SYSTEM_WORKSPACE:-}" ]; then
  __hs_workspace="${HUMAN_SYSTEM_WORKSPACE}"
elif [ -d "/workspaces/human-system" ]; then
  __hs_workspace="/workspaces/human-system"
elif __hs_git_root="$(git rev-parse --show-toplevel 2>/dev/null)"; then
  __hs_workspace="${__hs_git_root}"
else
  __hs_workspace="$(pwd)"
fi

__hs_env_file="${__hs_workspace}/.env"

if [ -f "${__hs_env_file}" ]; then
  # Export everything defined while sourcing the file. The file is the user's
  # own local secrets file; treat it the way docker-compose treats .env.
  set -a
  # shellcheck disable=SC1090
  . "${__hs_env_file}"
  set +a
fi

unset __hs_workspace __hs_env_file __hs_git_root
