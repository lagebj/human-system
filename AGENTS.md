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
2. `.agents/skills/human-systems-context/SKILL.md` — routing to the smallest
   sufficient context.
3. `docs/decisions/` — accepted ADRs. **ADR 002** is the current operating
   model; ADR 001 is superseded except for its manuscript editing-pass mechanics.
4. `docs/current-state.md` — current project state (mandatory read).
5. `.agents/skills/human-systems-context/resources/playbooks/working-session.md`
   — the working-session flow.

Everything under `resources/source/` and `resources/context/` (outside
`book_work/`) is **intellectual context**: it informs reasoning, it does not
govern work. Operational facts may govern work; intellectual claims should not
acquire authority just from where they are filed. See ADR 002 §2.

## Before any work

1. Read `docs/current-state.md`.
2. Classify the task (ADR 002 §4):

   | Class | Work | Manuscript edits | Publication |
   |---|---|---|---|
   | 1 Repository / Tooling | devcontainer, skills, instructions, automation, structure, workflows | no | no |
   | 2 Concept Development | capture/develop/connect ideas, find contradictions | no (unless asked) | no |
   | 3 Research / Pressure Testing | compare with theory, counterexamples, falsification, boundary conditions | no | no |
   | 4 Paper Development | plan/draft/revise/source-check a narrow paper | no | no |
   | 5 Manuscript Work | diagnosis / bounded pass / rewrite / integration of `manuscript/human.md` | **only with explicit request** | no |
   | 6 Publication Preparation | copy edit, references, metadata, formatting, preview prep | per artifact | no (prep only) |
   | 7 Publication | expose a specific artifact as public website content | per artifact | **explicit, artifact-named instruction only** |

3. Load context for that class via `SKILL.md`. Use the smallest sufficient set.
   Do not load manuscript-only rules for Class 1–4, 6, 7.

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
- `bash scripts/validate-repo.sh` passes, or the failure is reported with output.
- The final report separates completed work from unresolved risks, and does not
  describe the operating model as final.
