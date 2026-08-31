# Papers — Published

This directory contains the canonical source files for deliberately published papers.

## What belongs here

Only material that has been:

1. Prepared through Class 6 (Publication Preparation) workflow.
2. Explicitly authorized for publication through Class 7 (Publication) instruction.

This is a **publication boundary**. Moving content into this directory is a publication action.

## Publication boundary

Content in `papers/published/`:

- Is eligible to appear in the generated website build.
- Is licensed under CC-BY-NC-SA-4.0 (per `REUSE.toml`).
- Represents deliberately published intellectual material.

The Astro site content loader loads ONLY from this directory. This is a structural boundary, not a frontmatter filter.

## Required metadata

Published papers must include frontmatter with:

```yaml
---
title: "Required — the paper's title"
description: "Required — concise description for indexes and metadata"
published: "Required — original publication date (YYYY-MM-DD)"
updated: "Optional — last meaningful content revision (YYYY-MM-DD)"
topics: ["Optional", "descriptive", "terms"]
status: "published"
---
```

The `published` date should not silently change when a paper is revised. Use `updated` for meaningful content changes.

## Publication history

Preserve publication history:

- `published` — original publication date (does not change on revision).
- `updated` — date of latest material revision (optional).
- Git history — canonical source of detailed revision history.

Do not assign semantic versions to papers. Do not create a parallel version-control database.

## Licensing

Published material in this directory is licensed under **CC-BY-NC-SA-4.0** (per `REUSE.toml`). The public website will expose this license on paper pages.

## Not a dumping ground

Do not populate this directory with:

- Fake or example papers to make the site look populated.
- Material that "seems finished" without explicit publication authorization.
- Manuscript excerpts.
- Working notes or drafts.

If there are zero published papers, the Papers index page should state that honestly.

## Related

- `../working/` — drafts, research notes, unpublished material (All Rights Reserved).
- `docs/decisions/004-public-site-and-publication-architecture.md` — publication boundary decision.
- `AGENTS.md` — task-class routing (Class 6: publication preparation, Class 7: publication).
- `.agents/workflow.json` — skill activation by task class.
