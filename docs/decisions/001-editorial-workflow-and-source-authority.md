# Decision Record: Editorial Workflow and Source Authority

**Date:** 2026-06-18
**Status:** Active
**Supersedes:** Implicit workflow from EDITING_CHARTER.md and working-session.md

---

## Problem

The repository evolved through several revision cycles and developed:

1. **Stale state claims** — Files named "final" or "publication-ready" that do not reflect current editorial direction
2. **Conflicting editorial rules** — Same guidance duplicated across README, AGENTS.md, docs/, and skill resources with drift between copies
3. **Duplicated guidance** — Style rules appearing in five or more locations
4. **Outdated manuscript statistics** — Word counts and paragraph counts from previous passes still present in workflow files
5. **Framework-heavy instructions** — Metadata reinforcing taxonomy-heavy prose (four pulls, fifteen resistance categories, etc.) while the manuscript direction is de-frameworking
6. **Unclear authority** — No explicit hierarchy between repo-level docs and skill resources
7. **Historical reports too close to current instructions** — Final reports presented alongside active workflow guidance
8. **No clear workflow for selecting editorial passes** — Agents cannot reliably determine which pass is active or whether manuscript edits are allowed
9. **No mechanism to prevent unwanted manuscript rewrites** — Workflow-only requests could trigger manuscript edits
10. **Manuscript duplication** — Two editable copies with unclear precedence (`manuscript/human.md` and skill resource copy)

---

## Decision

### 1. Authority Hierarchy

Editorial authority flows in this order:

1. **`AGENTS.md`** — Bootloader only: task classification, mandatory skill activation, prohibition against hidden rules
2. **`.agents/skills/human-systems-context/SKILL.md`** — Routing and source selection, high-level behavior, pass discipline, source precedence
3. **`resources/source/`** — Canonical editorial and authorial rules (binding)
4. **`resources/playbooks/`** — Execution procedures
5. **`docs/current-state.md`** — Current operational state (single source of truth)
6. **`docs/`** — Human-readable summaries, reports, working records (subordinate to source/)
7. **`README.md`** — Public orientation, not detailed agent control

**Rule:** Canonical behavioral rules must not live only in `docs/` or README. They belong in `resources/source/`.

---

### 2. Task Classes

Five task classes are defined. An agent must determine the class before any work.

#### Class A: Repository and Workflow Maintenance

**Examples:**
- Update agent instructions
- Fix source hierarchy
- Remove stale documentation
- Improve playbooks
- Correct status metadata
- Audit workflow consistency

**Rules:**
- Manuscript content MUST NOT be materially edited
- Manuscript MAY be read for context
- No prose pass may be activated
- Output MUST focus on repository behavior

#### Class B: Manuscript Diagnosis

**Examples:**
- Review current draft
- Identify list density
- Assess prose rhythm
- Map repeated structures
- Review chapter movement

**Rules:**
- Manuscript is read but NOT modified
- Findings go into a dated diagnostic report
- Findings MUST distinguish evidence from recommendation
- No manuscript changes unless explicitly requested

#### Class C: Bounded Editorial Pass

**Examples:**
- De-patterning (Pass A)
- Causal tightening (Pass B)
- Language and load balancing (Pass C)
- Continuity pass (Pass D)
- Final integrity read (Pass E)

**Rules:**
- Exactly ONE pass is active
- Pass permissions and prohibitions are explicit
- Supporting docs MAY be updated only as required by the pass
- Agent MUST NOT blend passes

#### Class D: Manuscript Rewrite

**Examples:**
- Rebuild a chapter
- Revise a sustained case
- Restructure the whole manuscript

**Rules:**
- MUST be explicitly requested
- Requires a change map
- Requires preserved-content constraints
- Requires post-change continuity checks
- CANNOT be inferred from a general workflow request

#### Class E: Publication Preparation

**Examples:**
- Copy-edit preparation
- Source verification
- Permissions review
- Front matter
- Export
- Submission package

**Rules:**
- Separate from developmental editing
- MUST NOT be declared active merely because prose feels mature
- Requires explicit user instruction

---

### 3. Isolated Pass Rule

**Only one editorial pass may be active at a time.**

When a pass is declared:
- All feedback, critique, and changes MUST be scoped to that pass
- If a different concern is discovered, it is logged and deferred
- Pass permissions and prohibitions are binding
- The agent MUST record the active pass in `docs/current-state.md`

**Pass definitions:**

| Pass | Purpose | Allowed | Forbidden |
|------|---------|---------|-----------|
| A | De-patterning / structural prose release | Expand causal prose, merge repeated sections, dissolve frameworks, vary paragraph structure | New taxonomy, aggressive compression, new substantive claims |
| B | Causal tightening | Strengthen connective reasoning, clarify actor/action/consequence | New frameworks, major restructuring, generic line polishing |
| C | Language and load balancing | Fix grammar, vary sentence length, reduce keyword clusters, replace jargon | Changing underlying argument, adding cases, restructuring chapters |
| D | Continuity and concept return | Adjust transitions, remove redundant reintroductions, create subtle callbacks | New named concepts, turning ideas into branded themes, mechanical summaries |
| E | Final read integrity | Minimal corrections to protect flow, accuracy, continuity | Broad rewriting, new conceptual material, structural experimentation |

---

### 4. Current-State File Rule

**One and only one file contains current operational state:**

`docs/current-state.md`

**Required contents:**
- Manuscript path
- Current revision identifier or commit
- Current word count
- Current chapter count
- Current editorial direction
- Last completed pass
- Active pass (or "none")
- Next proposed pass
- Known unresolved risks
- Documents currently authoritative
- Stale or archived reports
- Date of last verification

**Prohibited contents:**
- Historical narrative
- Multiple revision states
- Unverified statistics
- "Publication-ready" claims without external verification

**The README MUST NOT serve as the operational current-state database.**

---

### 5. Archive Rule

Historical reports MUST be clearly distinguished from current guidance.

**Structure:**
- `docs/current-state.md` — Current truth only
- `docs/decisions/` — Decision records (ADR-style)
- `docs/reports/archive/` — Historical reports
- `docs/logs/` — Dated session records
- `resources/source/` — Canonical source material (no expiry)

**Files that MUST be archived or marked historical:**
- `docs/final-editorial-report.md`
- `docs/restructure-report.md`
- `docs/working-session.md` (or rewritten as current-state)
- `docs/editing-log.md` (moved to logs/)

**Rule:** Files named `final-*`, `complete-*`, or `publication-ready` do not imply current authority. They MUST include `last verified` dates and revision identifiers.

---

### 6. Manuscript Canonical-Source Policy

**Canonical manuscript:** `manuscript/human.md`

**Mirror copy:** `.agents/skills/human-systems-context/resources/source/book_work/human.md`

**Resolution:**
- The skill resource copy is a **stale snapshot** for context loading only
- It MUST NOT be edited directly
- It SHOULD be synchronized periodically or replaced with a pointer
- Agents MUST read from `manuscript/human.md` for editing work
- The skill MAY load the snapshot for context when manuscript work is requested

**Divergence detection:** If the two copies diverge significantly, the skill resource copy MUST be updated or marked as stale in `docs/current-state.md`.

---

### 7. Inbox Policy

**Path:** `inbox/`

**Status:** Unverified and non-canonical until deliberately promoted.

**Rules:**
- Agents MAY read inbox for inspiration
- Agents MUST NOT treat inbox items as manuscript truth
- Inbox material MUST be promoted through explicit decision
- Promotion paths:
  - To `resources/source/` — canonical stance or pattern
  - To `resources/context/` — distilled operational memory
  - To `manuscript/notes/` — manuscript notes
  - To `manuscript/human.md` — woven into text (via editorial pass)
  - Discarded — no longer relevant

---

### 8. Source Freshness Policy

Every state-bearing document MUST include:
- `last verified` date
- The revision or commit it refers to
- Whether it is current, historical, or canonical

**Canonical principles** (in `resources/source/`) do not need artificial expiry dates.

**Statistics, status, reports, and working-session files** DO require freshness metadata.

**Rule:** Agents MUST treat mismatched revision identifiers as stale until verified.

---

## Consequences

### Positive
- Agents can reliably determine what kind of task has been requested
- Manuscript-edit permission is explicit
- Source authority is unambiguous
- Current state has one canonical location
- Stale reports cannot be mistaken for current instructions
- Pass blending is prevented by explicit discipline
- Manuscript duplication is governed

### Negative
- Some historical files must be moved or marked, which may temporarily confuse collaborators
- The skill resource copy of the manuscript will be stale until synchronized
- Agents must load `docs/current-state.md` before workflow work

### Neutral
- Decision records add a new file type to the repository
- Archive structure adds directories that were not previously present

---

## How to Amend This Decision

Future changes to editorial workflow or source authority SHOULD:

1. Create a new decision record (`docs/decisions/002-*.md`)
2. Reference this decision
3. Explain what is changing and why
4. Update affected files (current-state, SKILL.md, playbooks)
5. Mark this decision as superseded if replaced

---

## Verification Checklist

Before considering this decision implemented, verify:

- [ ] `docs/current-state.md` exists with current information
- [ ] `docs/decisions/001-editorial-workflow-and-source-authority.md` exists
- [ ] `docs/reports/archive/` directory exists
- [ ] `docs/logs/` directory exists
- [ ] `AGENTS.md` references SKILL.md as authoritative
- [ ] `SKILL.md` references this decision or current-state
- [ ] README.md does not contain stale operational detail
- [ ] No "publication-ready" claims without verification
- [ ] Manuscript canonical path is explicit
- [ ] Skill resource copy is marked as stale snapshot
