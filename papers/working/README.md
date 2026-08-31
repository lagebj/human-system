# Papers — Working

This directory contains working intellectual material that is NOT published.

## What belongs here

- Observations being developed into papers.
- Incomplete drafts.
- Research notes associated with papers.
- Source/evidence material.
- Structural experiments.
- Unpublished revisions.

## Publication boundary

Content in `papers/working/`:

- May be committed to the repository.
- May be read by agents when appropriate for concept development or paper preparation.
- **Must never appear in the generated website build.**
- **Must never be published to the public site without explicit authorization.**

The Astro site content loader is configured to load ONLY from `papers/published/`. This is a structural boundary, not a frontmatter filter.

## Moving to published

Moving a file from `papers/working/` to `papers/published/` is a **publication action** that requires:

1. Completion of Class 6 (Publication Preparation) workflow.
2. Explicit human instruction authorizing Class 7 (Publication).

Do not move content to `papers/published/` merely because it "looks ready". Publication is a deliberate decision, not an inference.

## Licensing

Working material in this directory is **All Rights Reserved** by default (per `REUSE.toml`). It does not carry the CC-BY-NC-SA-4.0 license that applies to published material.

## Related

- `../published/` — canonical source for deliberately published papers.
- `docs/decisions/004-public-site-and-publication-architecture.md` — publication boundary decision.
- `AGENTS.md` — task-class routing (Class 4: paper development, Class 6: publication preparation, Class 7: publication).
- `.agents/workflow.json` — skill activation by task class.
