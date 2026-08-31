# Third-Party Notices

Human System uses a small number of external Agent Skills. They are **not
vendored** into this repository. The devcontainer fetches them to a local cache
at pinned commit SHAs recorded in `.devcontainer/agent-skills.lock.json`, and
exposes them to Claude Code and OpenCode by symlink. They keep their upstream
licences and are never relicensed.

Per-skill detail (what was inspected, wrapped, or reimplemented) is in
`docs/development/agent-skill-provenance.md`. This file reproduces the licence
texts.

| Skill (as used) | Upstream | Pinned commit | Licence | Consumed |
|---|---|---|---|---|
| `research` | `drader/researcher_agent` — `skills/research` | `d9937f6e5f223efca7ac239d464bf4d455a415c1` | CC-BY-NC-4.0 | directly, pinned; wrapped by `research-pressure-test` |
| `grounded-citations` | `NousResearch/hermes-agent` — `skills/research/grounded-citations` | `3aee290899e478c5fdfb6a241ef62758a49829b3` | MIT | directly, pinned |
| `writing-for-agents` | `mattpocock/skills` — `skills/productivity/writing-for-agents` | `6654f6b60cd9d5be8b54c6fafe44346dabeb3b76` | MIT | directly, pinned |

Inspected but **not** used: `msimchowitz/writing-skills` `for-agents/writing`
(MIT, commit `214981fe02326f27b0fc8790d00eb4b731607073`) — its router concept
is already covered by `human-systems-context` + `.agents/workflow.json`;
`anthropics/skills` `skills/doc-coauthoring` (commit
`3b3fad96af16a10759d930941b4520ba0c40edae`) — its "Reader Testing" idea was
reimplemented independently as the Human System-owned `reader-test` skill; no
text was copied.

---

## `drader/researcher_agent` — CC BY-NC 4.0

Copyright (c) 2026 Oğuz Gençer.

Licensed under the Creative Commons Attribution-NonCommercial 4.0 International
License (CC-BY-NC-**4.0**). Full text:
<https://creativecommons.org/licenses/by-nc/4.0/legalcode>. Do not confuse it
with CC-BY-NC-**SA**-4.0, the (different) licence intended for Human System's
own future published material.

The `skills/research` skill is used unmodified at the pinned commit. Human
System's `research-pressure-test` skill is an independent wrapper that invokes
it; the wrapper's text is original. Attribution to Oğuz Gençer is retained
here and in `docs/development/agent-skill-provenance.md`. Human System is a
non-commercial project.

---

## `NousResearch/hermes-agent` — MIT

```
MIT License

Copyright (c) 2025 Nous Research

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## `mattpocock/skills` — MIT

```
MIT License

Copyright (c) 2026 Matt Pocock

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
