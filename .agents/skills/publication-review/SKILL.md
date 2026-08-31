---
name: publication-review
description: Assess whether a Human System artifact is ready to be published — evidence integrity, accidental universals, unresolved placeholders, references, public/private boundaries. Use for Publication Preparation tasks (ADR 002 §4 class 6). Produces a readiness verdict. It cannot grant permission to publish; that is a separate explicit human decision (class 7).
---

# Publication Review

Publication preparation is not publication. This skill reviews an artifact and
reports a verdict. Moving the artifact to a public location is a separate class
7 action that requires an explicit human instruction naming the artifact.

Load `human-systems-context` first. Run `reader-test` (class 3 capability) as
part of preparation and read its findings into this review.

## Checks

1. **What it claims now.** State the artifact's central claim and its
   confidence level as currently written. Confirm the author intends that.
2. **Evidence integrity.** Every external claim traces to a registered source
   (`grounded-citations verify`). No citation left attached to a claim that was
   edited out from under it. No source reconstructed from memory.
3. **Accidental universals.** Claims phrased as laws that are meant as bounded
   observations. List each with its location.
4. **Unresolved placeholders.** TODOs, "[cite]", "TK", empty sections, notes to
   self, draft-only scaffolding.
5. **References and links.** Every reference resolves. Every link is live and
   points where the text says.
6. **Claim/evidence match.** Spot-check that cited sources actually support the
   sentences citing them.
7. **Public/private boundary.** No unpublished conceptual material, private
   client detail, personal data, internal notes, or manuscript content leaks
   into an artifact headed for a public location.
8. **Residual uncertainty.** State plainly what the artifact does not resolve,
   so a "ready with caveats" verdict can name the caveats.
9. **Reader-test findings.** Summarise what the clean reader flagged and whether
   it was addressed.

## Verdict

Report exactly one:

- **Ready** — no blocking issues; caveats, if any, are minor and stated.
- **Ready with explicit caveats** — publishable if the author accepts the
  listed, specific caveats.
- **Not ready** — blocking issues listed, each with what would clear it.

## Hard boundary

"Ready" is a description of the artifact, not an authorisation. This skill never
moves a file to a public path, never opens a publish PR framed as "just
shipping the ready artifact", and never treats "prepare"/"finish"/"review"/
"looks ready" as permission. Publication is class 7 and needs the human to say
so about that specific artifact.
