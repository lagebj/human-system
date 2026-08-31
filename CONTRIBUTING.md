# Contributing

Human System is one author's working body of thought, plus the tooling that
supports it. It is not a collaboratively authored wiki, and it is not trying to
become one. That shapes what contribution means here.

## Contribution vs authorship

The intellectual position in this repository is the author's. Contributions
improve the surrounding conditions — the evidence, the tooling, the accuracy —
without silently rewriting that position.

> Substantive disagreement with the author's intellectual position is normally
> better contributed as evidence, a counterexample, research, a field
> observation, or a discussion issue than as a pull request that quietly
> rewrites the position.

A PR that changes what a conceptual source or the manuscript *claims* will be
treated as a disagreement to discuss, not a patch to merge.

## Welcome

- tooling improvements and bug fixes (devcontainer, scripts, validation, CI)
- factual corrections
- relevant research and established theory the thinking should engage with
- contrary evidence and counterexamples
- field observations and concrete examples
- criticism, including sharp criticism, of the ideas

## How to contribute

- **Ideas, evidence, disagreement, counterexamples:** open an issue. Templates
  are provided for counterexamples, research/theory, and factual corrections.
- **Tooling and repository fixes:** open a PR from a branch
  (`<type>/<short-kebab-description>`), never a commit straight to `main`. Use
  Conventional Commits. Run `bash scripts/validate.sh` and paste the result in
  the PR.
- Classify the work against `.agents/workflow.json` before starting. Most
  outside contributions are class 1 (Repository / Tooling) or class 3 input
  (research / counterexamples).

## Boundaries

- **No CLA.** By contributing you agree your contribution is provided under the
  licence that applies to the files it touches (see `LICENSE.md` / `REUSE.toml`)
  — MPL-2.0 for tooling, upstream terms for third-party material. Do not send
  PRs that modify all-rights-reserved intellectual material.
- Do not edit `manuscript/human.md`. Manuscript work is a deliberate, separate,
  author-directed activity.
- Do not add project-management machinery (boards, sprints, roadmaps, priority
  matrices) or a CLA process.
- Report security issues privately — see `SECURITY.md`.
