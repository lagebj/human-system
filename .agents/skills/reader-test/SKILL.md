---
name: reader-test
description: Test a Human System artifact with a reader that does not carry the accumulated conceptual context shared by the author and the primary coding agents. Diagnostic only — it reports how the artifact lands, it never rewrites it. Use during Paper Development and Publication Preparation (ADR 002 §4 classes 4 and 6).
---

# Reader Test

The author and the coding agents that helped write a paper share years of
Human System context. A real reader does not. This skill checks what the
artifact communicates to someone without that context.

Core invariant:

> The reader must not inherit Human System conceptual context.

The idea is adapted from the "Reader Testing" stage of Anthropic's
`doc-coauthoring` skill; the implementation here is Human System's own.

## What the reader reports

Given only the artifact (no other Human System files, no `human-systems-context`,
no project background), the reader reports:

- the central proposition, in their words
- what knowledge they had to assume to follow it
- claims that are asserted but not supported
- terms used in a special or ambiguous way
- places where the reasoning moves faster than they can follow
- passages open to a materially different reading
- claims that sound universal but are probably meant as bounded
- evidence they would want to see
- assumptions the author seems not to notice they are making
- implications present in the text but never stated
- what they think the author wants them to conclude
- what is left unresolved
- **Does this sound like a person exploring a view or an organisation declaring policy?**
- **Which statements did they read as established facts?**
- **Where did the writer appear more certain than the evidence justified?**
- **Where did they feel the text had been organised for them rather than thought through with them?**
- **Did any list or heading structure feel mechanical?**
- **What appears unresolved? Did unresolved material feel intentional or merely incomplete?**
- **What do they think the author's own position is?**
- **Did any humour or sarcasm alter how they interpreted the author's stance?**
- **Did they notice any references to internal agent processes, workflows, or validation?**

It does **not** rewrite, edit, or "improve" the artifact. Findings are a list
for the author to act on.

## Running the reader

### Preferred: isolated session

If a clean subagent or session is available, dispatch the reader there with:

- the artifact text (or a path to just that file)
- the prompt in `references/clean-session-procedure.md`
- **nothing else** — no `human-systems-context`, no repo context, no
  conceptual sources, no prior conversation

### Fallback: manual fresh session

If reliable isolated invocation is not available, follow the manual procedure
in `references/clean-session-procedure.md`: a new session, a human pastes only
the artifact and the reader prompt, the findings are pasted back.

Isolation matters more than automation. A convenient reader that has seen the
project context is worthless for this.

## Hard constraints

- Never required for devcontainer startup or repository validation.
- Never requires AI-provider authentication to be part of `scripts/validate.sh`.
- Never injects `human-systems-context` or any project-internal context into
  the reader.
- Output is diagnostic. Acting on it is separate work under `paper-development`.
