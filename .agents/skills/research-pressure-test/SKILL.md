---
name: research-pressure-test
description: Make a Human System proposition collide with reality, established theory, and competing explanations. Use for Research / Pressure Testing tasks (ADR 002 §4 class 3) — comparing an idea with the literature, hunting counterexamples, finding boundary conditions, asking what would falsify it. Wraps the pinned upstream `research` skill for search mechanics. Output is an evidence and reasoning map, never replacement author prose.
---

# Research Pressure Test

The goal is not "find sources that agree with the author." The goal is to try
to break the proposition and report what survived.

This skill is Human System's orchestration. It **wraps** the pinned upstream
`research` skill (from `drader/researcher_agent`, CC-BY-NC-4.0), which owns the
search mechanics — literature sweep, source verification, PRISMA review,
Socratic question-formulation, claim-by-claim fact-check. Use the upstream
skill's `verify`, `socratic`, `brief`, or `full` mode for the mechanical work;
use this skill to decide what to point it at and how to read what comes back.
When external evidence is gathered, run `grounded-citations` alongside so
sources are registered at retrieval time.

Load `human-systems-context` first.

## Procedure

Work the proposition through these, in order. Each produces text in the map.

1. **Exact proposition.** State the single claim under test in one sentence.
   If it is really several claims, split them and test each.
2. **Observation vs inference.** What was directly observed. What is concluded
   from it. Keep them visually distinct.
3. **Embedded assumptions.** What must hold for the claim to be true.
4. **Material conditions.** Context variables that plausibly drove the outcome,
   including ones that were hidden or unknowable.
5. **Overlapping theory.** Which established bodies of work already say
   something close. Candidates: Deming, systems thinking, socio-technical
   systems, organizational learning, psychology (safety, defensiveness,
   helping), cybernetics, complexity, organizational sociology, decision
   theory, software architecture and engineering research. Use upstream
   `research` to find the actual literature; cite with `grounded-citations`.
6. **Competing explanations.** Established theories or plain alternatives that
   would explain the same observation differently. Look for these deliberately.
7. **Supporting evidence.** What backs the claim, with sources.
8. **Contrary evidence and counterexamples.** What cuts against it, with
   sources. A pressure test that finds none has not tried.
9. **Boundary conditions.** Where the claim stops holding.
10. **Predictions.** If this explanation is useful, what should we expect to
    see that we could check.
11. **Falsifiers.** What observation would force a revision or retraction.
12. **Residual unknowns.** What remains genuinely open.

## Distinguishing the claim from the neighbours

Do not run an originality contest. For each overlap, say which of these it is:

- an existing established idea (the author is rediscovering it — say so)
- independent overlap (same idea, arrived at separately)
- a different combination or framing of known ideas
- a difference that comes from the consultant-entry vantage point
- an extension of established work
- a qualification or boundary on established work
- a genuine contradiction with established work

"Plausibly overlaps; originality unproven" is an acceptable and common result.

## Constraints

- Output is an **evidence and reasoning map**, appended to or beside the
  proposition's source file. It does not rewrite the author's prose or settle
  the question.
- Evidence must be able to move the model. If the map only lists confirmations,
  redo steps 6 and 8.
- No manuscript edits. No paper drafting.
- Store only enough of a source for provenance and verification (author, title,
  where, when accessed, which claims depend on it). Do not paste long
  copyrighted passages.
