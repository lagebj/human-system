# Licensing

Human System is a **multi-license repository**. Different kinds of material
carry different terms. File-level SPDX/REUSE metadata in `REUSE.toml` is
authoritative; this page explains the intent.

| Material | Licence | SPDX identifier |
|---|---|---|
| Human System-authored software, tooling, scripts, devcontainer, validators, and operational configuration/docs | Mozilla Public License 2.0 | `MPL-2.0` |
| Intellectual material the author has **deliberately published** | Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International | `CC-BY-NC-SA-4.0` |
| Working intellectual material — working papers, conceptual sources, field notes, inbox captures, unpublished theory | All rights reserved | `LicenseRef-All-Rights-Reserved` |
| The book manuscript (`manuscript/**`) | All rights reserved | `LicenseRef-All-Rights-Reserved` |
| Third-party material (e.g. pinned upstream Agent Skills) | Upstream terms, unchanged | see `THIRD_PARTY_NOTICES.md` |

Notes:

- **Software/tooling → MPL-2.0** unless a concrete compatibility problem is
  found. MPL-2.0 is file-level copyleft: modifications to MPL-covered files
  stay under MPL-2.0, but it combines cleanly with other code.
- **Published intellectual material → CC-BY-NC-SA-4.0.** No material in this
  repository is designated as published yet. Presence of a file in Git is not
  publication and is not a licence grant. When the first piece is deliberately
  published, the author runs `reuse download CC-BY-NC-SA-4.0` (adds
  `LICENSES/CC-BY-NC-SA-4.0.txt`) and assigns `CC-BY-NC-SA-4.0` to that piece
  in `REUSE.toml`. The licence text is not committed before then so that
  `reuse lint` does not flag an unused licence.
- **Working and manuscript material → all rights reserved.** Shared publicly
  for transparency and continuity, not for reuse. See
  `LICENSES/LicenseRef-All-Rights-Reserved.txt` for the full statement,
  including that mandatory copyright exceptions (quotation for criticism or
  review, and similar) still apply.
- **Third-party material keeps its upstream licence.** It is never silently
  relicensed. Pinned Agent Skills are not vendored into this repository; they
  are fetched to a devcontainer cache at pinned commits and listed in
  `THIRD_PARTY_NOTICES.md` and `docs/development/agent-skill-provenance.md`.

Full licence texts are in `LICENSES/`. This repository follows the
[REUSE](https://reuse.software) specification; `reuse lint` runs as part of
`scripts/validate.sh`.

This page does not create custom legal restrictions and does not overclaim what
these licences guarantee. Where this prose and `REUSE.toml` or the texts in
`LICENSES/` disagree, the machine-readable metadata and the full texts govern.
