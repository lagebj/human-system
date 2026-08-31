# Human System — Agent Bootloader

This file is a bootloader. It routes work; it does not contain editorial or
conceptual rules. Those live in the skill and its sources.

## What this repository is

The working home for an evolving body of thought about understanding and
intervening responsibly in human systems when the right action depends on
context. The recurring entrypoint is consulting and technical/organizational
work. "It depends, therefore identify what it depends upon" is a recurring
thread.

Shorter papers are the expected near-term way of testing the thinking. The book
manuscript (`manuscript/human.md`) is preserved as one possible future
synthesis, not the primary output. Enablement and the Trojan Horse Movement
Pattern are applied consequences of the thinking, not its centre.

It is not a generic prompt collection, a global style guide, a personal
knowledge base dump, or a book-only workspace.

## Operationally authoritative files

In this order, for *how work is done* (not for what is true about human systems):

1. `AGENTS.md` — this bootloader.
2. `.agents/workflow.json` — **authoritative** task-class → skill-activation map
   (required / conditional / excluded skills, wrappers, explicit-intent gates).
3. `.agents/skills/human-systems-context/SKILL.md` — how to load the smallest
   sufficient context for a class.
4. `docs/decisions/` — accepted ADRs. **ADR 002** is the operating model
   (task classes); **ADR 003** covers the agent-skill and foundation decisions.
   ADR 001 is superseded except its manuscript editing-pass mechanics.
5. `docs/current-state.md` — current project state (mandatory read).
6. `.agents/skills/human-systems-context/resources/playbooks/working-session.md`
   — the working-session flow.

Everything under `resources/source/` and `resources/context/` (outside
`book_work/`) is **intellectual context**: it informs reasoning, it does not
govern work. Operational facts may govern work; intellectual claims should not
acquire authority just from where they are filed. See ADR 002 §2.

## Before any work

1. Read `docs/current-state.md`.
2. **Classify the task** (ADR 002 §4):

   | Class | Work |
   |---|---|
   | 1 Repository / Tooling | devcontainer, skills, instructions, automation, structure, workflow config |
   | 2 Concept Development | capture/develop/connect ideas, find contradictions |
   | 3 Research / Pressure Testing | collide a claim with evidence and theory; counterexamples; falsifiers; boundary conditions |
   | 4 Paper Development | plan/draft/revise/source-check a narrow paper |
   | 5 Manuscript Work | diagnosis / bounded pass / rewrite / integration of `manuscript/human.md` |
   | 6 Publication Preparation | copy edit, references, metadata, formatting, preview prep |
   | 7 Publication | expose a specific artifact as public website content |

3. **Resolve the class in `.agents/workflow.json`.** Load its `required` skills.
4. Load a `conditional` skill only when its `when` trigger actually applies.
5. Respect `excluded`. In particular, `reader-test` never receives
   `human-systems-context` or project-internal context (`clean_reader`).
6. Respect `requires_explicit_user_intent` — true for **manuscript-work** and
   **publication**. Do not proceed on those without an explicit, artifact-named
   instruction.
7. `load_manuscript_rules` is true only for class 5; never load Author Voice
   Guide / Editing Charter / Pattern Ledger for other classes.
8. Do the work, then run repository validation (below).

## Permissions

- **Manuscript:** `manuscript/human.md` is edited only under Class 5 with an
  explicit request. All other work leaves it with no material diff.
- **Publication:** never inferred from "looks ready", "prepare this", "finish
  this", "review this". Class 7 needs an explicit instruction naming the
  artifact.
- **New files:** place per ADR 002 §1 and the resource map. Durable behavioural
  rules go in `AGENTS.md`, an ADR, `docs/current-state.md`, or a source map —
  not buried in unrelated prose.
- **Decisions:** an accepted ADR may be superseded when reality changes. Write a
  new ADR; do not rewrite the old one.

## Git / workflow discipline

Use the `git-branch-commit-pr` skill. Fetch and branch from current `main`
(`<type>/<short-kebab-description>`). Never commit to `main`. Conventional
Commits. Stage intentionally. PR states exact validation commands and results.
Use `adr-governance` when the change decides durable structure or authority.

## Before completion

- Changed files match the task class.
- `manuscript/human.md` has no material diff unless Class 5 was active and
  requested.
- `docs/current-state.md` is accurate (update only if its subject changed;
  avoid documentation churn — ADR 002 §8).
- Referenced instruction/source paths resolve.
- `bash scripts/validate.sh` passes, or the failure is reported with its output.
  This is the one canonical validator; CI runs the same command.
- Files carry correct REUSE/SPDX licensing (`REUSE.toml`; `LICENSE.md` explains
  the multi-license model).
- The final report separates completed work from unresolved risks, and does not
  describe the operating model or this foundation as final.
