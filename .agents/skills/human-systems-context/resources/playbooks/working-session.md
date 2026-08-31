# Working-Session Playbook

A short contract for a coding-agent working session in this repository. Keep it
in view; it is meant to be used, not admired.

## Flow

```text
Start
  ↓
current main (fetch; never work on stale branch state)
  ↓
branch  (<type>/<short-kebab-description>)
  ↓
read AGENTS.md + docs/current-state.md
  ↓
classify work  (ADR 002 task class 1–7)
  ↓
load smallest relevant context  (SKILL.md routing for that class)
  ↓
identify operational authority  (what may I modify? is publication in scope? no by default)
  ↓
ADR needed?  (durable structure / authority / boundary change → yes)
  ↓
make bounded change
  ↓
inspect for stale or contradictory authority near what you touched
  ↓
validate  (bash scripts/validate.sh; task-specific checks)
  ↓
commit + PR  (Conventional Commits; PR states exact validation results)
```

## Rules

- No work directly on stale branch state. Fetch and branch from current `main`.
- No silent manuscript edits. `manuscript/human.md` changes only under Class 5
  with an explicit request.
- No silent publication. Publication (Class 7) requires explicit instruction
  naming the specific artifact. "Prepare", "finish", "review", "looks ready" do
  not grant it.
- No inventing authority in random files. Durable rules go in `AGENTS.md`, an
  ADR, `docs/current-state.md`, or a source map — not buried in prose.
- Report exact validation results. Commands run and their real output. A skipped
  or failing check is reported as such.
- Discovered unrelated concerns are normally recorded or deferred, not folded
  into the current change.
- Current accepted decisions may be superseded when reality has changed. Write a
  new ADR; do not rewrite the old one.

## Before you finish

- Changed files match the task class.
- `docs/current-state.md` is still accurate (update only if its subject changed).
- No manuscript diff unless Class 5 was active and requested.
- Referenced instruction and source paths resolve.
- `bash scripts/validate.sh` passes, or the failure is explained.
