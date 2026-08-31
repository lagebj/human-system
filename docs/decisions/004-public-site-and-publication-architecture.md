# Decision Record: Public Site and Publication Architecture

**Date:** 2026-08-31
**Status:** Proposed
**Supersedes:** None
**Superseded by:** None

---

## Context

The Human System repository has reached a stable operating model (ADR 002) with task-class routing, agent skills, and repository validation. The project now needs a mechanism to expose selected intellectual material to public readers without conflating repository visibility with deliberate publication.

Current state:

- No public website exists.
- `docs/current-state.md` explicitly lists "Publication / website implementation" as inactive.
- Intellectual material exists in `manuscript/`, `inbox/`, `resources/source/`, and `resources/context/`, none of which should automatically become public web content.
- The repository workflow distinguishes paper development (Class 4), publication preparation (Class 6), and publication (Class 7), with Class 7 requiring explicit human intent.
- No structural boundary exists to prevent working material from entering a website build.

The project needs:

1. A lightweight static site generator capable of rendering long-form reading.
2. A structural publication boundary that prevents working material from entering the build.
3. GitHub Pages deployment that publishes only from the protected default branch.
4. Minimal public identity (Home, About, Papers index) without inventing certainty or populating with fake content.
5. Validation that the publication boundary cannot be accidentally bypassed.

---

## Decision

### 1. Astro as static site generator

Use Astro (current stable release) as the static site generator for the Human System public site.

**Why Astro:**

- Native Markdown/MDX support for paper rendering.
- Built-in content collections API with schema validation.
- Zero JavaScript by default for content sites.
- Excellent long-form typography and accessibility support.
- GitHub Pages integration via official actions.
- Minimal dependency surface compared to framework-based alternatives.

### 2. Site location and structure

Place the site in `site/` at the repository root:

```
site/
├── src/
│   ├── components/
│   ├── layouts/
│   ├── pages/
│   ├── styles/
│   └── content.config.ts
├── public/
├── astro.config.mjs
├── package.json
└── ...
```

The site loads published papers directly from `papers/published/` at the repository root, not from a duplicated Astro content directory. This preserves the canonical source location.

### 3. Publication boundary: working vs published

Create two directories at the repository root:

```
papers/
├── working/    — drafts, research notes, unpublished material
└── published/  — deliberately published papers (canonical source)
```

**Critical boundary:** The Astro content loader must load ONLY from `papers/published/**`. It must NOT:

- Load `papers/working/**` and filter by frontmatter.
- Load `manuscript/**`.
- Load `inbox/**`.
- Load `.agents/**`, `resources/source/**`, `resources/context/**`, or `docs/**`.

The boundary is **path-based**, not frontmatter-based. A `draft: true` flag is insufficient to prevent publication.

### 4. Published paper metadata schema

Define a minimal Astro content schema for published papers:

```yaml
title: string (required)
description: string (required)
published: date (required) — original publication date
updated: date (optional) — last meaningful content revision
topics: string[] (optional) — simple descriptive terms
status: "published" (optional) — explicit publication state
```

Do not create:

- Maturity levels or confidence scores.
- Epistemic status taxonomies.
- Editorial workflow states.
- Semantic versioning for papers.

### 5. Publication history

Preserve publication history by tracking:

- `published` — original public publication date (does not change on revision).
- `updated` — date of latest material revision (optional).
- Git history — canonical source of detailed revision history.

Do not build a parallel version-control database. Do not assign semantic versions to papers.

### 6. Initial site information architecture

Minimal navigation:

```
Human System
├── Home (/)
├── Papers (/papers/)
└── About (/about/)
```

Do not add empty navigation for hypothetical future categories (Blog, Notes, Research, Book, Newsletter, Resources, Frameworks, Tools).

### 7. Content authorization for this programme

This task explicitly authorizes publication of:

- The Human System website shell.
- Minimal public project/about content created by this programme.

This task does NOT authorize publication of:

- Manuscript content (`manuscript/**`).
- Existing private/working conceptual material as papers.
- New substantive essays or papers.
- Working-paper drafts (`papers/working/**`).
- Inbox content (`inbox/**`).
- Internal source files (`.agents/**`, `resources/**`).

### 8. GitHub Pages deployment

Use GitHub Actions as the Pages publishing source:

```
repository source
       ↓
GitHub Actions (on push to main)
       ↓
Astro static build
       ↓
Pages artifact
       ↓
GitHub Pages deployment
```

**Key constraints:**

- PRs validate and build but do NOT deploy to production.
- Production deployment occurs only from the protected default branch (`main`) after merge.
- Use the official Astro GitHub Pages action or current recommended mechanism.
- Do not commit generated `dist/` files to the repository.
- Configure Pages to use **GitHub Actions** as the source (not branch-based `/docs` publishing).

### 9. URL and base path

Initially deploy to the default GitHub Pages URL:

```
https://lagebj.github.io/human-system/
```

Configure Astro with the correct `base` path for a project site. Keep custom-domain migration straightforward by centralizing site URL configuration. Do not commit a `CNAME` file when using Actions-based deployment.

### 10. Licensing integration

Respect the repository's multi-license model:

- Site software/tooling → MPL-2.0.
- Working intellectual content (`papers/working/**`) → All rights reserved.
- Published intellectual material (`papers/published/**`) → CC-BY-NC-SA-4.0.
- Third-party components → upstream terms.

Update `REUSE.toml` to classify new site files and the publication boundary. The public website should expose the license for published material without implying all repository contents share the paper license.

### 11. Visual direction

Restrained reading-first design:

**Priorities:**

1. Typography.
2. Readable line length.
3. Whitespace.
4. Hierarchy.
5. Excellent long-form reading.
6. Responsive layout.
7. Accessibility.

**Avoid:**

- Dashboard cards everywhere.
- Gradients and decorative hero illustrations.
- Excessive borders or glassmorphism.
- Animated backgrounds.
- Generic tech visuals.
- Oversized marketing CTAs.
- Tag-cloud aesthetics.

Use system fonts or appropriately licensed web-safe/open fonts. Do not add font binaries without explicit licensing.

### 12. Accessibility

Target current sensible web accessibility practices:

- Semantic HTML.
- Keyboard navigation.
- Visible focus.
- Sufficient contrast.
- Responsive typography.
- Correct heading hierarchy.
- Meaningful link text.
- Reduced-motion respect (if motion exists).
- No information conveyed only through color.

Do not add an accessibility framework merely for this.

### 13. Metadata

Provide basic public metadata:

- Page title.
- Description.
- Canonical URL (where determinable).
- Open Graph metadata.
- Appropriate viewport metadata.

Do not add SEO machinery beyond what a small static publication needs.

### 14. RSS and sitemap

**RSS:** Defer until papers exist. Do not introduce newsletter infrastructure.

**Sitemap:** Add only if straightforward with current Astro tooling and useful for the deployed site. Avoid unnecessary dependency expansion.

### 15. Validation requirements

Extend the canonical repository validator (`bash scripts/validate.sh`) to include:

**Site validation:**

- Dependencies install deterministically.
- Astro config is valid.
- Astro build succeeds.
- Generated internal links are valid.
- Site is compatible with configured Pages base path.

**Publication boundary validation:**

- `papers/working/**` is NOT loaded into Astro content.
- `manuscript/**` is NOT loaded.
- `inbox/**` is NOT loaded.
- `.agents/**` is NOT loaded.
- Only `papers/published/**` is eligible for the paper collection.

**Content schema validation:**

- Published paper frontmatter validates against the schema.

**Licensing validation:**

- REUSE/SPDX validation remains green.

**Publication-boundary regression test:**

- Create synthetic fixtures to prove the boundary mechanically.
- Verify only published fixtures enter the collection.
- Do not create fake production published papers.

### 16. Reader test

Before deploying initial public site content, run a clean-context reader test against Home and About copy:

- What do you think Human System is?
- Is it clear whether this is a framework, consultancy, book, research project, or something else?
- What does the author appear to claim?
- Which claims sound universal?
- What terms require hidden context?
- What would you expect to find on this site?
- What feels unclear or overstated?

Use findings to identify issues. Do not automatically accept every suggested rewrite. Preserve authorial judgment.

### 17. No invented certainty

Public copy should reflect that Human System is developing. Avoid:

- "The Human System framework proves…"
- "The definitive model…"
- "These principles always…"
- "Organizations must…"
- "The solution is…"

Prefer claims calibrated to actual evidence and perspective. The site should be comfortable saying that ideas are being tested and revised.

### 18. No excessive disclaimers

Do not make every paragraph hesitant. The work can state propositions clearly. The distinction is:

```
clear proposition
≠
universal certainty
```

Write directly. Do not bury the project under caveats.

---

## Rationale

**Why Astro?** Astro provides the smallest sensible surface area for a static content site. It has native Markdown support, content schema validation, and GitHub Pages integration without introducing a component framework, backend, or build complexity. Alternatives like Hugo or Jekyll would work but lack the TypeScript/JavaScript ecosystem alignment for future extensibility if needed.

**Why path-based boundary?** Frontmatter-based filtering (`draft: true`) is fragile: a build process could accidentally omit the filter, or a future contributor might not understand the convention. A path-based boundary is structural: if the loader does not include `papers/working/`, that content literally cannot enter the build.

**Why GitHub Pages?** The repository already lives on GitHub. Pages provides free static hosting with simple Actions-based deployment. It avoids introducing additional infrastructure, secrets, or operational burden.

**Why minimal navigation?** The site currently has zero published papers. Adding navigation for hypothetical future content (Blog, Book, Resources) creates false expectations and maintenance burden. Add navigation when there is actual content requiring it.

**Why defer RSS?** RSS is useful once papers exist. Building it now adds dependency complexity without immediate reader benefit. It can be added in a future small change when the first paper is published.

---

## Alternatives considered

### Alternative 1: MkDocs or Material for MkDocs

- **Benefits:** Simple Markdown-to-HTML, Python-based, good documentation theme.
- **Costs:** Primarily designed for documentation, not long-form essay publication. Less flexible for custom layouts. Python dependency in a Node-centric devcontainer.
- **Reason not selected:** Astro provides better long-form reading experience and aligns with existing devcontainer tooling.

### Alternative 2: Hugo

- **Benefits:** Extremely fast builds, Go binary (no runtime dependencies), excellent for large content sites.
- **Costs:** Go dependency in devcontainer. Go templating less familiar than Astro's TypeScript/JavaScript. Less extensible for future interactive needs.
- **Reason not selected:** Astro's TypeScript alignment and component model provide better future optionality with minimal current complexity.

### Alternative 3: Jekyll (GitHub Pages native)

- **Benefits:** Native GitHub Pages support (no Actions needed), Ruby-based, mature.
- **Costs:** Ruby dependency. Less flexible content schema. Frontmatter-dependent publication boundary (fragile).
- **Reason not selected:** Cannot enforce path-based publication boundary as cleanly. Astro's content collections API provides schema validation and structural exclusion.

### Alternative 4: Next.js or other React framework

- **Benefits:** Full flexibility, component ecosystem, API routes if needed later.
- **Costs:** Significant complexity overhead. Client-side JavaScript by default. Over-engineering for a static content site.
- **Reason not selected:** Violates the principle of minimal complexity. No demonstrated need for React, SSR, or API routes.

### Alternative 5: Commit generated `dist/` to a `gh-pages` branch

- **Benefits:** Simple to understand. No Actions complexity.
- **Costs:** Generated artifacts in Git history. Harder to validate before publication. Risk of working content accidentally committed.
- **Reason not selected:** Actions-based deployment keeps generated output out of the repository and provides a clear CI/CD boundary.

---

## Consequences

### Positive

- Structural publication boundary prevents accidental exposure of working material.
- Minimal site surface area reduces maintenance burden.
- GitHub Pages provides free, reliable hosting with no operational overhead.
- Astro's content schema ensures published papers have required metadata.
- Reader test catches unclear or overstated claims before publication.
- Validation gates prevent publication-boundary regressions.
- Repository remains the canonical source; website is a publication projection.

### Negative

- Adds Node.js dependency (Astro) to the devcontainer.
- Requires GitHub Actions configuration and maintenance.
- Initial setup is more complex than a simple `/docs` folder deployment.
- Another layer of indirection between source and published output.

### Risks and mitigations

- **Risk:** Publication boundary accidentally weakened (e.g., glob pattern changed to `papers/**`).

  **Mitigation:** Automated publication-boundary regression test in `validate.sh`. Code review must verify boundary integrity.

- **Risk:** Generated `dist/` accidentally committed.

  **Mitigation:** Add `site/dist/` to `.gitignore`. CI builds from source, not committed artifacts.

- **Risk:** Manuscript or working content accidentally exposed.

  **Mitigation:** Path-based loader excludes these directories structurally. Validation test proves exclusion. Reader test on initial content.

- **Risk:** Over-designing the visual layer.

  **Mitigation:** Design principles explicitly avoid dashboard cards, gradients, illustrations, and marketing aesthetics. Reading-first priority.

- **Risk:** Validation becomes flaky or slow.

  **Mitigation:** Keep validation focused: build succeeds, boundary holds, schema validates. Avoid complex E2E tests at this stage.

---

## Migration and compatibility

**Transition:** This is greenfield infrastructure. No existing website or publication system to migrate.

**Rollout:**

1. Create `papers/working/` and `papers/published/` directories.
2. Implement Astro site in `site/`.
3. Configure GitHub Pages Actions workflow.
4. Run validation locally and in CI.
5. Deploy to GitHub Pages on merge to `main`.

**Rollback:** Delete the `site/` directory and GitHub Pages configuration. No existing content is modified. The `papers/` directories can remain (empty) for future use.

**Compatibility:** No backward compatibility concerns. This is a new publication channel, not a replacement for an existing one.

---

## Security and operations

**Security:**

- Site build requires no secrets.
- GitHub Actions workflow uses minimal permissions (`contents: read`, `pages: write`, `id-token: write` as required by Pages).
- No exposure of `.env`, Ollama API keys, Claude credentials, or OpenCode credentials.
- No third-party analytics, comments, or search services embedded.

**Operations:**

- GitHub Pages environment: `github-pages`.
- Deployment only from `main` branch.
- PRs validate but do not deploy.
- No custom domain initially; use `https://lagebj.github.io/human-system/`.
- No SSL configuration needed (GitHub Pages handles HTTPS automatically).

**Observability:** None at this stage. No analytics or logging. Future analytics would require a separate privacy and technology decision.

---

## Related records

- **ADRs:**
  - `002-repository-operating-model-and-source-authority.md` — task classes, publication requires explicit intent (Class 7).
  - `003-agent-skill-and-repository-foundation.md` — validation, licensing, workflow foundation.

- **Repository files:**
  - `AGENTS.md` — bootloader, task routing, permissions.
  - `.agents/workflow.json` — task-class → skill-activation map.
  - `docs/current-state.md` — will be updated to reflect publication infrastructure.
  - `REUSE.toml` — will be updated for site files and publication boundary.
  - `scripts/validate.sh` — will be extended with site and boundary validation.

- **Skills:**
  - `human-systems-context` — task routing and context loading.
  - `publication-review` — assesses publication readiness.
  - `reader-test` — tests public copy with clean-context reader.
  - `git-branch-commit-pr` — delivery envelope.

---

## Implementation evidence

- **Pull request:** [To be created]
- **Validation:** `bash scripts/validate.sh` (extended with site and boundary checks).
- **Astro build:** `cd site && npm run build`.
- **GitHub Pages:** Deployed via `.github/workflows/pages.yml` on merge to `main`.

---

## Supersedes

None.

---

## Superseded by

None.

---

## History

### 2026-08-31

Record created. Decision proposed as part of initial publication infrastructure programme.
