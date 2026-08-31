---
name: paper-development
description: Plan, draft, and revise a short Human System paper — the near-term vehicle for testing the thinking. Use for Paper Development tasks (ADR 002 §4 class 4). Papers may state propositions directly, explain reasoning, cite literature, and expose uncertainty. Does not load manuscript prose constraints. Development is not publication.
---

# Paper Development

A Human System paper is short and narrow: one question, tested. It is not the
book and not bound by the book's rules. The form is deliberately unsettled —
reflective essay, practitioner paper, research-informed field paper, conceptual
paper, or something between. Do not impose IMRaD. Do not impose the manuscript's
literary constraints. Pick the form that fits the question.

Load `human-systems-context` first for current stance. Use the pinned
`writing-for-agents` skill only for agent-facing text, never for the paper
prose itself.

## What a paper may do that the manuscript may not

- state a proposition directly
- explain the reasoning
- cite literature and discuss counterexamples
- distinguish observation from hypothesis in plain words
- say what would make the claim wrong
- name what the author does not yet know

Explicit first-person, provisional language is fine and often correct: "I
think", "my current hypothesis is", "I have repeatedly observed", "this would
be wrong if", "this overlaps with", "I do not yet know".

## Do not

- manufacture certainty the evidence does not support
- turn the paper into advice or a framework
- optimise the prose for content-marketing cadence or SEO
- load the Author Voice Guide, Writing Working Agreement, Editing Charter, or
  Pattern Ledger — those are class 5 (Manuscript Work) only
- treat a finished draft as cleared for publication (that is class 6, then an
  explicit class 7 decision)

## Workflow

1. **Narrow.** Name the one question. Cut everything the paper does not need to
   answer it.
2. **Locate the claim.** What is being argued, and at what confidence.
3. **Decide what belongs.** Which observations, which research, which
   counterexamples. Leave the rest out.
4. **Draft.** Connect experience and evidence. Keep observation and theory
   distinguishable in the text.
5. **Pressure-test the load-bearing claims** with `research-pressure-test`
   (class 3) when they need it — not reflexively for every sentence.
6. **Register evidence with `grounded-citations`** when external sources are
   used — at retrieval time, not reconstructed at the end.
7. **Revise** for argumentative integrity: does each step follow, are
   alternatives addressed, is uncertainty preserved where it exists.
8. **Reader-test** with `reader-test` (class 3 capability) once the draft is
   independently readable — a reader without accumulated Human System context.
9. Development ends here. Publication preparation (class 6) and publication
   (class 7) are separate and gated.

## Conditional capabilities

Load these only when their trigger applies, not by default:

- `research-pressure-test` + `research` — when a claim needs testing
- `grounded-citations` — when external evidence is being gathered
- `reader-test` — when the draft can be read cold

## Output

A paper draft in a working location (not the manuscript, not a published path).
Its status is "draft" until a human says otherwise.
