# Human System Devcontainer

## What this container provides

- Node.js 24 on Debian Bookworm
- Non-root development user (`node`)
- `git`, GitHub CLI (`gh`), `curl`, `jq`, `ripgrep`
- OpenCode CLI (pinned version)
- Claude Code (via devcontainer feature)
- Agent skill synchronization for both OpenCode and Claude Code

## What this container does NOT provide

There is no application stack — no database, no web framework, no CMS, no
application server. This is a workshop for future development, not a running
application.

## Opening locally

1. Clone the repository
2. Open in VS Code
3. When prompted, reopen in the devcontainer (or use the Command Palette:
   "Dev Containers: Reopen in Container")
4. Wait for the post-create script to finish

## Opening in Codespaces

1. Create a Codespace from the repository on GitHub
2. The same `.devcontainer/devcontainer.json` is used
3. Add `OLLAMA_API_KEY` as a Codespaces secret for OpenCode Web to start
   automatically

## Environment variables and secrets

The devcontainer loads a gitignored `.env` file at the workspace root
**automatically on boot**. Copy `.env.example` to `.env` and fill in values:

```bash
cp .env.example .env
$EDITOR .env
```

Values are exported into every terminal, the VS Code environment probe, and the
`postCreate` / `postStart` lifecycle scripts. The mechanism:

- `.devcontainer/load-dotenv.sh` — sourced helper that exports `KEY=VALUE` lines
  from `.env` (silent no-op when `.env` is absent).
- `postCreateCommand` installs a one-line hook into `~/.bashrc`, `~/.profile`,
  and `/etc/profile.d/99-human-system-dotenv.sh` (idempotent across rebuilds).
- `postCreate` and `postStart` also source the helper directly.

After editing `.env` in a running container, either open a new terminal or run
`. .devcontainer/load-dotenv.sh` in the current one.

Recognised keys (see `.env.example`): `OLLAMA_API_KEY`, `GH_TOKEN`,
`CLAUDE_CODE_OAUTH_TOKEN`.

In **GitHub Codespaces**, `.env` is never present (it is gitignored and never
pushed); set these as Codespaces secrets instead and the auto-loader no-ops.

## Authentication

### GitHub CLI

With `GH_TOKEN` in `.env`, `gh` is authenticated on boot. Otherwise:

```bash
gh auth login
```

### Claude Code

Claude Code uses Claude.ai subscription authentication by default. The
devcontainer's managed settings enforce `forceLoginMethod: "claudeai"` and
clear any inherited API credentials. `CLAUDE_CODE_OAUTH_TOKEN` in `.env` is
picked up automatically; otherwise run `claude` and follow the interactive
authentication flow.

### OpenCode

The project default model is `ollama/qwen3.5:27b` (local Ollama), controlled by
`opencode.json`. Users can explicitly override it with `/model` or the `-m`
flag. Ollama Cloud (`ollama-cloud/glm-5.1:cloud`) remains available as an
alternative provider.

#### Local Ollama

OpenCode connects to a local Ollama instance running on the host at
`http://host.docker.internal:11434/v1`. This works automatically on macOS and
Windows (Docker Desktop). On Linux, `host.docker.internal` may need
`--add-host=host.docker.internal:host-gateway` in `devcontainer.json`
`runArgs`.

The model `qwen3.5:27b` must be pulled on the Ollama host before use:

```bash
ollama pull qwen3.5:27b
```

The devcontainer does not automatically download models.

#### Ollama Cloud

OpenCode authenticates to Ollama Cloud using `OLLAMA_API_KEY`:

- **Local devcontainer**: put it in `.env` (loaded on boot)
- **Codespaces**: add as a GitHub Codespaces secret

The project-level `opencode.json` configures the `ollama-cloud` provider with
`apiKey: "{env:OLLAMA_API_KEY}"`, so no `/connect` step is needed. The
environment variable is the sole credential source; do not run
`opencode providers login` for `ollama-cloud` or the `auth.json` credential
will conflict with the project configuration.

Environment precedence (highest to lowest):

1. Already-exported environment variables (Codespaces secrets, `containerEnv`,
   explicit shell exports)
2. Values from `.env` (only fill in variables not already set)

## OpenCode Web

### Start

```bash
bash .devcontainer/start-opencode.sh
```

### Stop

```bash
bash .devcontainer/stop-opencode.sh
```

In Codespaces, OpenCode Web starts automatically when `OLLAMA_API_KEY` is
available.

OpenCode Web runs on port 4096.

## Where mutable state lives

| State | Location | Persists across rebuilds |
|-------|----------|------------------------|
| Claude Code config/auth | `/home/node/.claude` (Docker volume) | Yes |
| OpenCode config | `/home/node/.config/opencode` (Docker volume) | Yes |
| Agent skills (managed) | `/home/node/.local/share/human-system-agent-skills/` | No (rebuilt) |
| Shell history | `/home/node/.bash_history` (default) | No |
| OpenCode Web logs | `/home/node/.local/state/human-system/` | No |

Volume names are prefixed with `human-system-` to avoid collision with other
devcontainers (e.g., Matchboard).

## Agent skill parity

Both Claude Code and OpenCode discover the same skills:

1. **Repo-local skills** from `.agents/skills/` (authoritative, committed) —
   `human-systems-context`, `concept-development`, `research-pressure-test`,
   `paper-development`, `reader-test`, `publication-review`.
2. **Pinned upstream skills** from `.devcontainer/agent-skills.lock.json` —
   checked out at exact commit SHAs into
   `~/.local/share/human-system-agent-skills/pinned/`. Currently `research`
   (`drader/researcher_agent`), `grounded-citations`
   (`NousResearch/hermes-agent`), `writing-for-agents` (`mattpocock/skills`).
   Desired sources: `.devcontainer/agent-skills.json`. Updates only through
   `docs/development/agent-skill-update-workflow.md` — never automatic.
3. **Externally managed collections** from `addyosmani/agent-skills` and
   `lagebj/agent-skills` (synchronized from `main`, symlinked).

The sync script (`sync-agent-skills.sh`) creates symlinks in both
`~/.config/opencode/skills/` and `.claude/skills/` pointing to the same
source checkouts. Symlinks and checkouts are gitignored.

Run parity validation:

```bash
bash .devcontainer/validate-agent-parity.sh
```

## Tool versions

| Tool | Version | Controlled by |
|------|---------|---------------|
| Node.js | 24 | Dockerfile build arg `NODE_VARIANT` |
| OpenCode | 1.18.8 | Dockerfile build arg `OPENCODE_VERSION` |
| Claude Code | latest | Devcontainer feature (auto-updated) |
| GitHub CLI | latest | Devcontainer feature |

To update OpenCode, change `OPENCODE_VERSION` in both the Dockerfile and
`devcontainer.json` build args, then rebuild the container.

## Validation

Run the full environment validation:

```bash
bash .devcontainer/validate.sh
```

This checks tool availability, agent parity, worktree integrity, secret
absence, and manuscript integrity.

## Troubleshooting

### Container build fails without credentials

The build does not require any external credentials. If it fails, check that
the Dockerfile builds correctly on its own:

```bash
docker build -f .devcontainer/Dockerfile .devcontainer/
```

### Claude Code authentication not persisting

The Claude config directory is a Docker volume. It should persist across
container rebuilds. If it resets, check that the volume mount in
`devcontainer.json` is working:

```bash
ls -la /home/node/.claude/
```

### OpenCode skills not appearing

Re-run the skill sync:

```bash
bash .devcontainer/sync-agent-skills.sh --required
```

### OpenCode Web not starting (Codespaces)

Check that `OLLAMA_API_KEY` is set as a Codespaces secret. Without it,
OpenCode Web will not start but the container will still function normally
for terminal-based OpenCode usage.