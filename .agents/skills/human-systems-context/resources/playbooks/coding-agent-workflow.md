# Coding Agent Workflow

Use this when producing prompts for coding agents, especially for Matchboard or project tooling.

## Required reading

1. `resources/context/OPERATING_CONTEXT.md`
2. `resources/context/DOMAIN_MODEL.md`
3. Any user-provided screenshots, repo state, or current bug description

## Prompt structure

When creating a coding-agent prompt, include:

1. Repository/context.
2. Current observed behavior.
3. Desired behavior.
4. Scope and non-goals.
5. Implementation guidance.
6. Acceptance criteria.
7. Regression checks.
8. Documentation/update expectations if relevant.

## Matchboard-specific reminders

Core app:

- Planning and fairness tool for youth football.
- Teams: Rød, Hvit, Blå.
- Support planning periods/seasons, rounds, fixtures, players, teams, opponents, formations, and post-match reports.
- Vercel + Neon Postgres.
- Local-first direction is dropped.

Known features/issues to preserve:

- Rescheduling should auto-place matches in an existing round or create a new round if needed.
- Formation creator must be discoverable from navigation.
- Pitch view must keep GK and striker inside displayed bounds.
- Position slots should support assigning players, not just deselecting.
- Post-match flow should be simplified.
- Manual players should appear in post-match dropdowns; removed players should disappear.
- Warnings must be meaningful and refresh after edits.
- Player and team stats must use a consistent source of truth.
- Fixtures can show soft result indication for win/draw/loss.

Youth football philosophy constraints:

- Preserve stable social belonging.
- Support controlled, temporary movement.
- Do not encode hard early sorting as identity.
- Effort, attendance, learning behavior, and game impact matter.
- Pools may support candidate relationships alongside stable teams.

## Prompt quality check

Before returning the prompt, ask internally:

- Can the coding agent act without asking the same context questions again?
- Are acceptance criteria testable?
- Are regressions named?
- Have I avoided vague “make it better” language?
- Have I preserved the user’s product intent, not just UI symptoms?
