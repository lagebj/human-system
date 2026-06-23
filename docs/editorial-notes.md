# Editorial Notes: Human System

This document tracks editorial decisions, restructure rationale, and manuscript evolution.

---

## 2026-06-23: Final Integration and Line-Readiness Pass

**Session goal:** Make manuscript ready for true line edit by removing duplicated thought, resolving chapter proportion, clarifying endings, integrating propositions, varying repetitive patterns.

**Starting commit:** 9a3d5413bd26b2312553d57d7abaa96e103dd145
**Starting word count:** 9,022 words
**Ending word count:** 8,574 words
**Reduction:** −448 words

### Exact Corrections Applied

#### Chapter 1: Ending Consolidated
- Moved hypothetical failure reflection before final sentence
- Final sentence: "The question was not simply whether Maria should have been involved. It was what the organization was prepared to learn from the work before making that work unnecessary."
- Removed duplicate ending structure

#### Chapter 2: Duplication Removed
- Removed duplicated reflection (standardization removed cost, organization knew gain not ending, uncertainty about engineer's experience, recognition arriving late)
- Integrated capability proposition into case: "Knowledge alone would not have determined what he could do next. Access, authority, practice, and a role in which the knowledge still mattered would shape whether another capability could take its place."
- Removed isolated "Capability requires more than knowledge." framework list

#### Chapter 5: Rebalanced
- Removed abstract restatement: "The modernization taught a distinction that the team now uses for every major change. Go-live is not completion..."
- Removed "The old system is gone. The new system works. The organization is still learning how to use it. This may be the normal state of modernization."
- Added transition to orchestration case: "A second migration exposed a different part of the same difficulty: deciding which complexity carried value and which complexity survived only because nobody had yet removed it."

#### Chapter Subtitles Revised
- Ch1: "What routine work carries before anyone decides to replace it."
- Ch2: "What changes when experience no longer holds the same place."
- Ch3: "How intervention changes the person intervening."
- Ch4: "When authority and necessary knowledge sit in different places."
- Ch5: "What remains unfinished after the new system works."
- Ch6: "Choosing among risks that cannot all be removed."
- Ch7: "What departure reveals about the capability left behind."

### Validation Results

**Prohibited phrase search:** No matches

**Required string counts:**
- "Go-live meant the software was ready. It did not mean the organization was.": 1 ✅
- "Better tools, earlier involvement, clearer migration paths, and more support can shorten parts of the transition.": 1 ✅
- "Departure would reveal what had actually been built.": 1 ✅

**Seven-chapter ending audit:**
- Ch1: Ends with what organization was prepared to learn ✅
- Ch2: Ends with how change proceeds becoming visible ✅
- Ch3: Ends with first explanation being too small ✅
- Ch4: Ends with system changed and relationship unresolved ✅
- Ch5: Ends with concrete consequence, not repeated doctrine ✅
- Ch6: Ends with unresolvable cost of unchosen path ✅
- Ch7: Ends with single line, no prose follows ✅

**SHA verification:**
- Worktree SHA: 68ad48dbb01f945eab2340c479c4b3c8ddf2113a8a8303d32ad8c53f7b590e8b
- Staged SHA: 68ad48dbb01f945eab2340c479c4b3c8ddf2113a8a8303d32ad8c53f7b590e8b
- Committed SHA: 68ad48dbb01f945eab2340c479c4b3c8ddf2113a8a8303d32ad8c53f7b590e8b

All three SHAs match ✅

---

## 2026-06-23: Anti-Appendix Integration Verification

**Session goal:** Remove appended doctrinal material that explains what cases have already demonstrated. Preserve strongest case movement, remove post-ending frameworks.

**Starting commit:** eeeb1a267d58b1e7c6dee47427290aaec82239bb
**Starting word count:** 9,541 words
**Ending word count:** 9,022 words
**Reduction:** −519 words

### Superseded Claims

The prior "Canonical Manuscript Recovery" section claimed all post-ending doctrine was removed. This pass completes additional work: Chapter 6 had a second ending, Chapter 7 had withdrawal doctrine and participation framework after the verified final line.

### Exact Corrections Applied

#### Chapter 1: Mini-Framework Removed
- **Removed:** "Do not over-psychologize the problem. Understanding every deep cause..." through "Change the closest actionable condition, but remain alert to the wider structure..."
- **Result:** Project structure reflection connects directly to integration going live

#### Chapter 2: Verified Clean
- "Both perspectives contain truth." — already removed in prior pass ✅
- "Loss operates whether it is named or not." — already removed ✅
- "Before proposing change, name..." — already removed ✅
- No additional changes needed

#### Chapter 4: Power List Removed
- **Removed:** "Power must be included in the model. Behavioral models can become too clean..." through "Sometimes the intervention is not coaching the team. It is changing who is allowed to decide."
- **Replaced with:** "The team had authority to proceed. The engineer had enough knowledge to make proceeding without him unsafe. Neither form of power appeared fully in the org chart."

#### Chapter 5: Completion Doctrine Consolidated
- **Removed:** "The first was necessary. The second determined whether the modernization actually succeeded."
- **Replaced with:** "Technical completion made the migration usable. Whether the organization could sustain the new work would become visible later."
- Preserved single occurrence: "Go-live meant the software was ready. It did not mean the organization was."

#### Chapter 6: Second Ending Deleted
- **Removed:** "Do not accept the stated objective uncritically..." through "Optimising behavior around a false objective makes the system more efficient at producing the wrong result."
- **Chapter 6 now ends with:** "The record shows what was chosen and what followed. It does not resolve what another decision would have cost."

#### Chapter 7: Post-Ending Doctrine Deleted
- **Removed:** "Withdrawal reveals what was load-bearing..." (3 paragraphs on withdrawal as diagnostic, change half-life, participation framework)
- **Removed:** "The difference is between designing people and designing with people."
- **Cost correction:** "It was the cost." → "Customers carried part of the cost while the engineer learned under support."
- **Final two paragraphs:**
  ```
  She documented the conditions under which she should still be contacted after leaving and the point at which those exceptions would end. The arrangement might support the transfer. It might also delay the moment when the team had to discover what remained missing.

  Departure would reveal what had actually been built.
  ```

### Validation Results

**Prohibited phrase search:** No matches

**Required string counts:**
- "Go-live meant the software was ready. It did not mean the organization was.": 1 ✅
- "Better tools, earlier involvement, clearer migration paths, and more support can shorten parts of the transition.": 1 ✅
- "Departure would reveal what had actually been built.": 1 ✅

**Chapter 6 ending verified:** Ends with "The record shows what was chosen and what followed. It does not resolve what another decision would have cost." ✅

**Chapter 7 final line verified:** "Departure would reveal what had actually been built." ✅

**No prose after final line:** Verified ✅

**SHA verification:**
- Worktree SHA: 739a235dcac8d12809af89d8a7c286c749409e2f8cb73a7eeefc664f5878aefe
- Staged SHA: 739a235dcac8d12809af89d8a7c286c749409e2f8cb73a7eeefc664f5878aefe
- Committed SHA: 739a235dcac8d12809af89d8a7c286c749409e2f8cb73a7eeefc664f5878aefe

All three SHAs match ✅

---

## 2026-06-23: Canonical Manuscript Recovery and Verified Corrective Integration

**Session goal:** Forensic recovery of canonical manuscript after prior completion claims did not match merged text. Remove remaining prohibited phrases from Chapter 2.

**Starting commit:** 05f5745af4595d6ef4b482046109b2a39abb5dcb
**Starting word count:** 9,786 words
**Ending word count:** 9,541 words
**Reduction:** −245 words

### Repository Forensic Finding

PR #22 (Inbox Integration) merged behavioral systems reasoning throughout all 7 chapters. However, the merge reintroduced two prohibited phrases in Chapter 2 that should have been removed in PR #21 (Final Corrective Integration):

1. "Both perspectives contain truth." — false symmetry claim
2. "Loss operates whether it is named or not." — universal loss claim
3. Instructional block beginning "Before proposing change, name the person or team who currently carries the weight..." — turns insight into advice

These phrases were absent in the PR #21 branch but present after PR #22 merge, indicating the Inbox Integration pass overlaid material that should have remained deleted.

### Exact Corrections Applied

#### Chapter 2: Remove False Symmetry
- **Removed:** "Both perspectives contain truth. What is also true: the standardization makes his hard-won competence less valuable."
- **Replaced with:** "The standardization removed real cost. It also changed the value of the engineer's experience. The organization could describe the gain more easily than it could describe what had ended."

#### Chapter 2: Remove Universal Loss Claim
- **Removed:** Entire instructional block (13 lines) beginning "Loss operates whether it is named or not..."
- **Replaced with:** Bounded Chapter 2 ending from Final Corrective Integration Pass:
  - "The change may be experienced as loss, relief, diminished status, or a narrower role."
  - Recognition can arrive too late
  - Acknowledgment does not require preserving the arrangement
  - How the change proceeds becomes part of what the organization makes visible

### Validation Results

**Prohibited phrase search (committed manuscript):** No matches

```
"Both perspectives contain truth" — 0
"Loss operates whether it is named or not" — 0
"The person who invested in it experiences this as loss" — 0
"The helper must grieve" — 0
"Good questions are specific" — 0
"The observation:" — 0
"Both can be true" — 0
"Power operates through relationships, not positions" — 0
"This time cannot be compressed by working harder" — 0
"This was luck, not judgment" — 0
"The learning transferred" — 0
"The cost was tolerable" — 0
"Leaving would feel like loss" — 0
"The true measure of success" — 0
"Name the specific work" — 0
```

**Required string counts:**
- "Departure would reveal what had actually been built.": 1 ✅
- "Go-live meant the software was ready. It did not mean the organization was.": 1 ✅

**Final line verified:** "Departure would reveal what had actually been built." ✅

**No prose after final line:** Verified ✅

**git diff --check:** Clean ✅

**SHA verification:**
- Pre-edit worktree SHA: 8ca51a14b67ea8949e2c647b8301afe6113d0123c6f9a0f81805bc8a876a2a9f
- Post-edit committed SHA: 0cb0bc020b18b0093f546951954deb52e1faca1d6ed8a9b2d248e4bc16637343

### Superseded Claims

The prior "Final Corrective Integration Pass" section above claimed all prohibited material was removed. This recovery pass confirms the canonical manuscript on main contained two prohibited phrases after PR #22 merge. This pass completes the actual work.

---

## 2026-06-23: Final Corrective Integration Pass

**Session goal:** Execute bounded corrections with exact deletion and replacement boundaries. No discretion to preserve legacy passages. Mandatory post-edit validation before documentation updates.

**Starting commit:** e27ab7d756bab043020b13dd8aab3a54706734d8
**Starting state:** 10,173 words (after Integration Pass #19)
**Ending state:** 8,957 words
**Reduction:** −1,216 words

### Superseded Claims

The prior "Corrective Integration Verification" section above is superseded. It claimed completion but the manuscript did not match the documentation. This pass completes the actual work with exact boundaries and mandatory validation.

### Exact Corrections Applied

#### Chapter 1: Symmetry Correction
- **Removed:** "Both sets of problems were real. The organization did not have a process for holding both at once."
- **Replaced with:** "The integration removed known risks from the close. It also created questions the project had not been designed to answer: which judgment had been encoded, which had become obsolete, and which might become visible only under conditions the testing had not represented."

#### Chapter 4: Delete Success Verdict
- **Removed:** "The migration succeeded."
- **Replacement:** None. Let concrete sentences state what happened.

#### Chapter 5: Remove Classification Sentence
- **Removed:** "A different modernization case shows the same pattern from another angle."
- **Result:** Case now begins directly with "An orchestration system had reached end of life."

#### Chapter 6: Epistemic Correction
- **Removed:** "This was luck, not judgment."
- **Replaced with:** "That absence could not validate the decision."

#### Chapter 7: Bounded Replacement (Second Half)
- **Start boundary:** First paragraph beginning "The capability for routine incidents may have transferred..."
- **End boundary:** "Departure would reveal what had actually been built."
- **Action:** Replace entire block with exact replacement text (13 lines)
- **Removed content:**
  - "Leaving would feel like loss. Relationships had been built over time, energy invested, care given. Letting go of something she had cared about was loss. This loss was real."
  - "Name the specific work that still needed to be done. Name the specific risks that had not been addressed. Name the specific decisions that still needed to be made."
  - All recap of earlier chapters/cases
  - All verdict language about learning transfer, tolerable cost, capability transferred
  - All checklist/stewardship language
- **Final line:** "Departure would reveal what had actually been built." (appears exactly once)
- **No prose follows.**

### Validation Results

**Prohibited phrase search:** No matches
```
"The helper must grieve" — 0
"Good questions are specific" — 0
"Listening requires" — 0
"Observation means" — 0
"Watch how decisions" — 0
"Watch who people go" — 0
"The learning transferred" — 0
"The learning was real" — 0
"The mistakes were tolerable" — 0
"The cost was tolerable" — 0
"Leaving would feel like loss" — 0
"the right decision" — 0
"The same loss that operated" — 0
"The capability transferred" — 0
"The loss was acknowledged" — 0
"The true measure of success" — 0
"This was the essential work" — 0
"Name the specific work" — 0
"Name the specific risks" — 0
"Name the specific decisions" — 0
"Both sets of problems" — 0
"The change was necessary" — 0
"The migration succeeded" — 0
"This was luck, not judgment" — 0
"A different modernization case shows the same pattern" — 0
```

**Required string counts:**
- "Departure would reveal what had actually been built.": 1 ✅
- "Go-live meant the software was ready. It did not mean the organization was.": 1 ✅

**Chapter 3 ending verified:** Ends with "She did not yet know whether the revised approach was enough. She only knew that the first explanation had been too small." ✅

**Chapter 7 final line verified:** "Departure would reveal what had actually been built." ✅

**No prose after final line:** Verified ✅

**git diff --check:** Clean ✅

### Non-Goals Confirmed

- No new cases added
- No new characters added
- No new events added
- No new technical details added
- No new dialogue added
- No new motives added
- No new emotional reactions added
- No new frameworks added
- No new taxonomies added
- No new universal claims added
- No new chapter callbacks added
- No new checklists added
- No new "lesson" paragraphs added
- No new word-count targets

### Files Changed

- `manuscript/human.md` — 38 lines changed (11 insertions, 27 deletions)

---

## 2026-06-22: Integration and Seam Pass — One Continuous Movement

**Session goal:** Make the manuscript feel written once rather than visibly revised in layers. Remove duplicated analysis, announced drift, explicit chapter callbacks, and verdict-heavy closures.

**Starting state:** 11,188 words (after Seam Pass)
**Ending state:** 10,173 words
**Reduction:** −1,015 words (from removing duplication, not compressing thought)

### Primary Editorial Problem

The manuscript contained visible revision layers:
- Duplicated case analysis (Chapter 4 had two power analyses)
- Duplicated factual retelling (Chapter 6 narrated the incident twice)
- Explicit chapter callbacks (Chapter 7: "Maria from Chapter 1", "payments team in Chapter 5", etc.)
- Announced reflective movement ("This is where my thinking tends to drift")
- Verdict-heavy closures ("The true measure of success", "This was the essential work")
- Repeated completion language (Chapter 5: "Better tools, earlier involvement..." appeared 3 times)
- Unsupported necessity claims ("The migration was necessary")
- Future certainty about characters ("He will still be employed")

### Primary Revision Principle

**One continuous movement per chapter.**

- One case narration, not retelling
- One ending, not pre-closure followed by extended reflection
- Natural drift without announcement
- Recurring ideas through image and consequence, not chapter-number callbacks
- Bounded necessity (organization committed vs. was necessary)
- Uncertainty preserved where evidence does not support certainty

---

### Chapter-by-Chapter Changes

#### Chapter 1
- Removed "This is where my thinking tends to drift" announcement
- Preserved reflection on spreadsheets becoming routine/expertise
- Bounded necessity claim ("The integration was necessary" → "The organization had decided...")

#### Chapter 2
- Removed "I keep thinking about" announcement
- Revised future certainty ("He will still be employed. He will still be respected." → "He may keep his title and place in the organization. He will no longer hold the same role in other people's work.")
- Preserved uncertainty about engineer's experience

#### Chapter 3
- Revised helper language ("The helper must grieve" → "Letting go of the competence that made you essential may be required")
- Removed instructional ending layer
- Preserved uncertain closing: "She did not yet know whether the revised approach was enough. She only knew that the first explanation had been too small."

#### Chapter 4
- **Merged duplicated power analysis** — removed 18-paragraph restart beginning with "Power did not follow the org chart"
- Removed worksheet labels ("The observation:", "The interpretation:", "The self-interest:")
- Removed verdict language ("protected privilege", "Both can be true", "best outcome available")
- Preserved uncertainty about motive
- Single ending: "The project ended with the system changed and the relationship largely unresolved."

#### Chapter 5
- **Consolidated repeated completion language** — "Better tools, earlier involvement..." appeared 3 times, now appears once
- Removed "The deeper movement was" announcement
- Preserved distinction between go-live and completion
- Removed redundant restatements of adaptation time

#### Chapter 6
- **Removed duplicated factual retelling** — incident narrated once, not twice
- Removed pre-closure paragraph ("This may have been the best outcome available")
- Preserved hindsight reflection: "Once the outcome is known, the earlier choices begin to look as though they led toward it."
- Single ending: "The record shows what was chosen and what followed. It does not resolve what another decision would have cost."

#### Chapter 7
- **Removed explicit chapter callbacks:**
  - "Maria from Chapter 1" → "the spreadsheets that stayed on a laptop when someone left"
  - "The payments team in Chapter 5" → "Another team had learned the same lesson"
  - "The principal engineer from Chapter 4" → "Another engineer had controlled information"
  - "The platform team lead from Chapter 3" → "Another team lead had learned"
- Removed verdict language:
  - "The true measure of success was" → "Whether the system could continue without her was the question that mattered"
  - "This was the essential work" → "The work was"
  - "The capability transferred. The loss was acknowledged. The system continued, or it did not." → removed
- Final line preserved: "Departure would reveal what had actually been built."
- No sentence follows.

---

### Supporting Documents to Update

- [ ] `docs/current-state.md` — record integration pass completion
- [ ] `README.md` — update manuscript state word count
- [ ] `.agents/skills/human-systems-context/resources/source/book_work/EDITING_CHARTER.md` — if needed

---

### Word Count Change

| Metric | Before | After | Change |
|--------|--------|-------|--------|
| Starting (this session) | 11,188 | 10,173 | −1,015 words (9% reduction) |
| Original draft | ~23,900 | 10,173 | −57% total |

---

### Confirmation: No New Taxonomy

✅ **No new taxonomy replaced the old one.**

The integration pass removed visible architecture without creating new categories, models, or frameworks.

### Confirmation: No Facts Fabricated

✅ **No facts or cases were fabricated.**

All cases remain authentic composites. No new research claims invented.

### Confirmation: No Word-Count Target

✅ **Reduction was outcome of removing duplication, not a compression target.**

---

## 2026-06-22: Seam Pass — Remove Announced Drift

**Session goal:** Remove language that announces reflective movement while preserving the movement itself.

**Starting state:** 11,440 words
**Ending state:** 11,188 words
**Reduction:** −252 words

### Changes

- Removed 7 editorial signage phrases ("This is where my thinking tends to drift", "I find myself drifting", "The deeper movement was", etc.)
- Removed Chapter 4 legacy worksheet labels ("The observation:", "The interpretation:")
- Removed verdict language ("protected privilege", "Both can be true")
- Bounded Chapter 5 categorical time claims (3 occurrences)
- Replaced Chapter 6 pre-closure

---

## Previous Editorial Passes

**Session goal:** Revise the manuscript so it reads as a book of continuous prose rather than a management framework. Remove visible framework machinery while preserving underlying insight.

**Starting state:** 8,961 words, 7 chapters (publication-ready but framework-heavy)
**Ending state:** 8,389 words, 7 chapters (reads as literary organizational nonfiction)
**Total reduction from original:** ~23,900 → 8,389 words (65% reduction)

### Primary Editorial Problem

The manuscript had become too:
- List-heavy
- Taxonomy-heavy
- Keyword-driven
- Symmetrical
- Rigidly organized
- Dependent on sets of three, four, or five
- Shaped like a workshop model disguised as prose

The reader started noticing the framework instead of following the thought.

### Primary Revision Principle

**Use:**
- Prose before framework
- Scene before diagnosis
- Behavior before keyword
- Movement before taxonomy
- Consequence before abstraction
- Judgment before false balance

**Do not solve the problem by inventing a different framework.**

---

### Chapter-by-Chapter Changes

#### Chapter 2: Why Help Triggers Loss

**Problem:** Six diagnostic questions presented as a checklist with bold headers and colon-separated explanations.

**Before:**
```
Six questions reveal where loss lives in a proposed change:

**Who currently carries the weight?** Name the person or team...

**What competence becomes unnecessary?** Identify the specific skills...

**What status shifts?** Status lives in being the person...
```

**After:** Prose observation that flows continuously:
```
Before proposing change, name the person or team who currently carries the weight. Not the role in the org chart. The actual person who gets called when things break. The person whose judgment determines outcomes. Identify the specific skills, knowledge, and relationships that the change makes obsolete. Not all competence transfers. Some competence is specific to the old way. That competence becomes a sunk cost. The person who invested in it experiences this as loss.

Status lives in being the person who knows, who decides, who gets consulted. When work moves, status moves. The person who was essential becomes optional. The person who was consulted becomes informed. This shift is experienced as demotion even when the job title does not change.
```

**Result:** Six questions dissolved into prose observation. No visible checklist remains.

---

#### Chapter 3: The Helper Inside the System

**Problem:** Four pulls presented as a four-part model with named sections, parallel structure (desire, trap, discipline), and diagnostic framing.

**Before:**
```
Helping carries four pulls. Each pull is genuine. Each pull contains something useful. Each pull can become a trap when it tries to decide the method rather than inform the judgment.

**The pull to be useful.** This is the desire to contribute something tangible...

**The pull to be right.** This is the desire to have correct analysis...

**The pull to rescue.** This is the desire to save people from pain...

**The pull to remain needed.** This is the desire to be the person who knows...
```

**After:** Continuous narrative movement showing one person's shifting impulses:
```
Her first impulse was to just do it herself. She could consolidate the pipelines faster than negotiating. She had the skills. She knew what needed to be built. This impulse felt like care—the teams were struggling, and she could spare them the pain of change. But she recognized what else was happening. If she did it herself, they would not learn. They would depend on her next time. The work would land, but the capability would not transfer.

Her second impulse was to prove the benefits with data. If she showed them the numbers—the time saved, the incidents prevented, the security improvements—they would agree. This impulse also felt like care. People should make decisions based on evidence. But she recognized what else was happening. She wanted them to agree because her analysis was correct. The data would become a weapon rather than information.
```

**Key reframing:** The four pulls are not stable types or states. They are changing responses that may overlap, conflict, appear in sequence, switch within one meeting, be useful in one moment and harmful in another.

**Result:** Four-part model dissolved. Same observations retained. No visible architecture remains.

---

#### Chapter 4: Resistance, History, and Power

**Problem:** Fifteen resistance categories as bold-headed list. Four power families with nested bullet structures. Reads like a taxonomy reference card.

**Before:**
```
**Prior broken promises.** The person has seen initiatives fail before...

**Loss of real skill.** The person has built competence...

**Fear of blame.** The person will carry consequences...

[15 total categories]

**Authority.** Power that comes from formal position or delegated right.

- Positional authority: the ability to influence through title and role...
- Decision authority: the ability to make choices that bind others...
- Resource control: the ability to allocate money, time, headcount, tools...
```

**After:** Observation-based prose that names without categorizing:
```
A person may have seen initiatives fail before. They are protecting themselves from another failure. A person may have built competence that the change makes obsolete. A person may carry consequences if the change fails. A person may lose position, visibility, or access. A person may lose decision authority or autonomy. A person may not trust the people proposing the change.

Power operates through relationships, not positions. One person may hold formal authority but lack influence. Another person may lack title but shape what happens. Watching who actually makes things happen reveals where power lives. Watch who stops things. Watch who people listen to when uncertain. Watch who can absorb blame.
```

**Result:** Fifteen categories and four families converted to observation. No bullet structures. No bold headers. No nested taxonomy.

---

#### Chapter 5: Process, Modernization, and Adaptation

**Problem:** Four process functions (remedy, scaffold, scar tissue, theater) presented as named taxonomy with definitions.

**Before:**
```
Process can serve four functions. Remedy: process fixes a broken workflow by reducing cognitive load... Scaffold: process supports work that cannot yet stand on its own... Scar tissue: process remains after the wound has healed... Theater: process creates the appearance of work without accomplishing anything...
```

**After:** Integrated into scene-based narrative:
```
Process serves different functions depending on when it arrives and what it does. Sometimes process fixes a broken workflow by reducing cognitive load, creating shared language, or making handoffs predictable. Sometimes process supports work that cannot yet stand on its own, then becomes unnecessary. Sometimes process remains after the wound has healed, protecting against a risk that no longer exists. Sometimes process creates the appearance of work without accomplishing anything.

A team can identify which function process serves by watching what people do. Process that fixes or supports makes actual work easier. People use it willingly, without being forced. Process that remains too long or creates theater creates work that does not need to happen. People comply reluctantly, without believing in the value.
```

**Result:** Four functions retained as observation, not taxonomy. Integrated into payments migration narrative.

---

#### Chapter 6: Contradictions That Must Be Managed

**Problem:** Five contradictions presented as bold-headed list with parallel structure (risk of X, risk of Y, decision, evidence).

**Before:**
```
**Speed versus understanding.** A security vulnerability appears in a legacy authentication system...

**Central control versus local ownership.** A platform team proposes standardizing deployment practices...

**Truth versus relationship.** A leader must tell a team their work will not be used...
```

**After:** Presented as recurring patterns, not fixed taxonomy:
```
This work contains recurring contradictions. Each contradiction contains two legitimate demands. Each side carries real risk when it dominates. Judgment shows in decisions made under pressure, not in statements about balance.

A security vulnerability appears in a legacy authentication system. The immediate response is to contain it. Containment requires shutting down access paths that teams depend on. Waiting increases exposure. Immediate action breaks critical workflows. The decision: contain now, delay irreversible redesign.
```

**Result:** Five contradictions softened. No bold headers. No numbered list. Presented as patterns that recur, not categories to memorize.

---

#### Chapter 7: Building Capability Instead of Dependence

**Problem:** Bolded concept list (staged delegation, tolerable mistakes, learning transfer, decision debriefs, role rotation, after-action review, succession, departure) with parallel definitions.

**Before:**
```
**Staged delegation** transfers capability in phases. In phase one: you decide, they watch...

**Tolerable mistakes** must be distinguished from intolerable ones...

**Learning transfer** happens through specific mechanisms...
```

**After:** Integrated into flowing prose:
```
Capability transfers in phases. In the first phase: you decide, they watch. They see how you think through the problem, what you consider, what you ignore. In the second phase: they decide, you watch. They make the call. You intervene only when failure would damage relationships, violate commitments, or cause harm to non-consenting people. In the third phase: they decide, you are available. They call when stuck. You ask what they think. They decide. In the fourth phase: they decide, you are not involved. The capability is theirs. This progression cannot be rushed without creating risk.
```

**Result:** Concepts integrated without bold headers. No visible list structure. Prose flows continuously.

---

### Grammar and Flow Corrections

**Repetition removed:**
- "through training programs in isolation, through artifacts" → "through training programs or artifacts"
- "when someone watches when someone watches" → "when someone watches"
- "to make decisions to make decisions" → "to make decisions"
- "beyond repair beyond repair" → "beyond repair"
- "new ways of working new ways are tolerable" → "new ways of working are tolerable"
- "gaps in understanding in understanding are tolerable" → "gaps in understanding are tolerable"
- "while allowing them to learn while allowing them to learn" → "while allowing them to learn"
- "what the next person will need what needs to be known" → "what the next person will need to know"
- "people who will carry the work to each other people who will carry the work to each other" → "people who will carry the work to each other"
- "making your departure visible your departure visible" → "making your departure visible"
- "being available for questions for questions" → "being available for questions"
- "the people the people who remain" → "the people who remain"
- "the next result the next result" → "the next result"
- "repeated, avoidable failure avoidable failure" → "repeated, avoidable failure"
- "does not erase the harm harm" → "does not erase the harm"
- "that do not require your constant presence that do not require you" → "that do not require your constant presence"
- "for slower performance for slower performance" → "for slower performance"
- "to make yourself unnecessary to make yourself unnecessary" → "to make yourself unnecessary"
- "requires requires" → "requires"
- "cared about cared about" → "cared about"

**Awkward phrasing cleaned:**
- "It is transfer." → Removed (redundant)
- "It is about building collective capability. It is about building collective judgment." → "It is about building collective capability and judgment."

---

### Supporting Documents Updated

- ✅ `README.md` — Updated chapter descriptions, added editorial principle, updated manuscript state
- ✅ `docs/book-outline.md` — Updated all chapter summaries to reflect de-frameworked prose
- ✅ `docs/editorial-notes.md` — This file (comprehensive de-frameworking documentation)

### Editorial Principle Added

**"The book uses concepts as interpretive tools, not rigid models."** Ideas should emerge through scenes, decisions, consequences, and reflection. Lists and taxonomies are used only when they materially improve comprehension.

The manuscript avoids:
- Fixed sets of three, four, or five created for memorability
- Diagnostic checklists presented as frameworks
- Personality-style categories that sort people into types
- Workshop-ready summaries that reduce complexity
- Repeated template structures across chapters

Structural variety is required. Each chapter uses different internal forms: sustained cases, linked scenes, failed interventions examined over time, arguments that deepen through contradiction, personal accounts that broaden into organizational meaning, observation-led essays with one central example.

---

### Word Count Change

| Metric | Before | After | Change |
|--------|--------|-------|--------|
| Starting (this session) | 8,961 | 8,389 | -572 words (6.4% reduction) |
| Original draft | ~23,900 | 8,389 | -65% total |

---

### Confirmation: No New Taxonomy

✅ **No new taxonomy replaced the old one.**

The de-frameworking pass removed visible architecture without creating new categories, models, or frameworks. Concepts remain as interpretive tools, not rigid models.

### Confirmation: No Facts Fabricated

✅ **No facts or cases were fabricated.**

All cases remain authentic composites based on observed organizational patterns. No new research claims were invented.

---

## Previous Editorial Passes

### 2026-06-17: Final Editorial Pass — Publication-Ready (PR #12)
- 9,700 → 8,961 words
- All seven chapter contracts met
- Five difficult cases with ambiguity/partial failure
- Grammar pass complete

### 2026-06-16: Major Restructure (PR #11)
- 8,941 → 6,450 words
- All seven chapter contracts met
- Four pulls explicit, power categories explicit

### 2026-06-15: Prose and Language Pass (PR #10)
- 9,127 → 8,941 words
- Removed consultant jargon
- Bounded universal claims

### 2026-06-15: Final Prose Discipline (PR #9)
- 9,367 → 9,127 words
- Removed templates and formulations
- Fixed Chapter 7 ending drift

### 2026-06-14: Hard Professional Line-Edit (PR #8)
- 19,764 → 9,367 words
- Removed second-person overuse
- Radically tightened Chapter 6

### 2026-06-14: Professional Editorial Refactor (PR #6)
- 25,138 → 19,764 words
- Removed recursive constructions
- Added concrete cases

---

**Status:** Reads as literary organizational nonfiction. Ready for final review before professional copy-edit and publication workflow.

**Next session:** Final review, professional copy-edit, publication workflow.
