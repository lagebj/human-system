# Research and Writing Agent Workflow

How a coding agent should work in Human System once concept, research, paper,
and publication activity begins. This is the map; the behaviour lives in the
skills, and the authoritative activation rules live in `.agents/workflow.json`.

## Task classes

From ADR 002 §4, enumerated in `.agents/workflow.json`:

| # | Class | One line |
|---|---|---|
| 1 | Repository / Tooling | devcontainer, skills, automation, structure, workflow config |
| 2 | Concept Development | experience → observation → possible pattern → working proposition; stop there |
| 3 | Research / Pressure Testing | collide a claim with evidence, established theory, competing explanations |
| 4 | Paper Development | plan / draft / revise a short, narrow paper |
| 5 | Manuscript Work | `manuscript/human.md` — explicit user request only |
| 6 | Publication Preparation | readiness review; does not authorise publishing |
| 7 | Publication | expose a specific artifact publicly — explicit, artifact-named instruction only |

## Skill activation

`.agents/workflow.json` gives each class its `required`, `conditional` (with a
`when` trigger), and `excluded` skills. The short version:

- **required** — the task does not proceed without it.
- **conditional** — load only when its trigger actually applies. Not every
  paper runs research, citations, reader-test, and publication-review; that is
  context pollution.
- **excluded** — deliberately kept out of context for that class.

## Manuscript isolation

There is no `manuscript-writing` skill. Manuscript voice and editing-pass rules
live inside `human-systems-context` (its class 5 routing) and
`resources/source/book_work/`. `load_manuscript_rules` in `.agents/workflow.json`
is true **only** for class 5. Classes 2–4 and 6 must not load the Author Voice
Guide, Writing Working Agreement, Editing Charter, or Pattern Ledger. A paper
may state propositions directly, cite, and explain — things the manuscript may
not.

## Research / pressure testing

`research-pressure-test` (Human System-owned) is the entry point. It **wraps**
the pinned upstream `research` skill, which owns the generic mechanics
(literature sweep, `verify`, `socratic`, PRISMA). Normal selection is
`research-pressure-test`; the agent does not need to reason about the upstream
composition each time. The output is an **evidence and reasoning map** appended
beside the proposition — it does not rewrite the author's prose or settle the
question. It must seek contrary evidence and counterexamples, not only
confirmations.

## Evidence and citations

`grounded-citations` (pinned upstream, MIT) owns provenance. Invariant:

> Sources are registered when evidence is discovered, not reconstructed when
> prose is nearly finished.

Its `scripts/sources.py` keeps a `url → [n]` ledger; render the Sources block
mechanically; `verify` (with `--evidence` for verbatim quotes) checks
claim-to-evidence integrity and catches unknown or stale references. Run it
from the pinned checkout
(`~/.local/share/human-system-agent-skills/pinned/hermes-agent/skills/research/grounded-citations/scripts/sources.py`);
use `--ledger <path>` to keep the ledger with the paper. Store only enough of a
source for provenance and verification — not large copyrighted passages.

## Upstream skill ownership

Human System owns integration and domain behaviour: `human-systems-context`,
task routing, the conceptual context, `concept-development`,
`research-pressure-test`, `reader-test`, `publication-review`, manuscript
routing, workflow config. Generic capabilities stay upstream and pinned:
`research`, `grounded-citations`, `writing-for-agents`. Provenance:
`agent-skill-provenance.md`. Updates: `agent-skill-update-workflow.md` — never
automatic.

## Clean-context reader testing

`reader-test` diagnoses how an artifact reads to someone **without** accumulated
Human System context. It never rewrites the artifact. The reader must not
receive `human-systems-context` or any project-internal context. Prefer an
isolated session; fall back to a manual fresh session
(`.agents/skills/reader-test/references/clean-session-procedure.md`). It is
never required for devcontainer startup and never part of a validation step
that needs AI-provider authentication.

## Publication-review boundary

`publication-review` (class 6) produces `Ready` / `Ready with explicit caveats`
/ `Not ready`. **"Ready" is not permission.** Publication (class 7) is a
separate action that needs an explicit human instruction naming the specific
artifact. "Prepare", "finish", "review", and "looks ready" never grant it.

## Claude / OpenCode parity

Both agents resolve the same skills. `.agents/skills/*` (repo-local) and the
pinned upstream checkouts are symlinked into both `~/.config/opencode/skills/`
and `<workspace>/.claude/skills/` by `.devcontainer/sync-agent-skills.sh`. The
`.claude/skills/` symlinks and the pinned checkouts are gitignored — no tracked
churn. `bash .devcontainer/validate-agent-parity.sh` checks parity; it is also
called by `scripts/validate.sh`.

## Validation

One command, locally and in CI:

```bash
bash scripts/validate.sh
```

It composes focused checks (repo structure, workflow config, pinned-skill lock,
licensing/REUSE, agent parity, manuscript-untouched). It requires no
interactive AI-agent authentication and does no live web research. CI runs the
same command in `.github/workflows/validate.yml`.
