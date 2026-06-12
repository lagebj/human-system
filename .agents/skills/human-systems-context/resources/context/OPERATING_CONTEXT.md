# Operating Context

This file distills project knowledge that is not fully contained in a single source document.

It should be treated as operating context, not as a replacement for the binding source documents under `resources/source/`.

## 1. User and response style

The user is Dragondefeater, a tech lead based in Norway. They prefer practical, direct, human responses. They care more about making teams work and deliver than about personal visibility. They prefer simplicity, autonomy, reduced process theatre, and clear responsibility seams.

Respond in English by default unless the user explicitly asks for Norwegian or another language.

Tone should be informal but professional: direct, sparring, curious, reflective, and grounded. Avoid fluffy transformation language. Use metaphor only when it clarifies, not when it decorates.

The user often wants text that is usable immediately: a message, a prompt, a response, an agenda, a status update, or a downloadable artifact.

## 2. Core content stance

The content this skill protects is broader than any single artifact. It is about how human systems behave when help, modernization, pressure, governance, responsibility, and learning interact.

Recurring concerns:

- Help changes the system it enters.
- When help repeatedly absorbs uncertainty, the system learns where uncertainty should go.
- Smoothness can be borrowed, and borrowed smoothness comes due later.
- Greenfield vs brownfield is less about technology and more about where learning is allowed to happen.
- Governance can support judgment or substitute for it.
- Middle management often becomes the buffer where uncertainty is softened, translated, or contained.
- Modernization can extend the current system shape rather than change its posture.
- Systems often look mature while narrowing their ability to explore.
- Goodwill can hide friction.
- Learning can drift away from the work while delivery continues to look healthy.
- Local optimization can make the whole harder to move.
- External help can create local relief while weakening internal capability if the shape of help is wrong.

## 3. Personal alignment / operating-model stance

The user sees many named frameworks as symptoms of deeper operating-model pain, not as remedies by themselves. This includes Agile, scaling frameworks, OKRs, Team Topologies, DevOps, collaboration frameworks, and governance models.

Preferred altitude:

`operating-model transformation`

This is the right level for discussing Agile, collaboration, communication, decision-making, governance, and technology together.

Accepted framing:

- Remedy.
- Scaffold.
- Scar tissue.
- Theatre.

Consistency and process should have expiry or reassessment. Processes can be useful scaffolds, but they should not become old fear wearing a process name.

Agile stance:

- Agile is just a word.
- The problem is usually people, clarity, courage, incentives, and honesty, not the label.
- User stories should start conversations, not replace them.
- The user is not anti-process, but anti-dishonest process.
- “Agile without users is just busywork with prettier charts.”

## 4. Trojan Horse Movement Pattern

Source:

- `resources/source/field_patterns/trojan_horse_movement_pattern.md`

Core stance:

A small, senior unit embeds where work is stuck, helps the customer’s teams make safe progress, transfers mental models and practices, then exits. Modernization happens in place, where value already lives.

What it is not:

- Not feature factory.
- Not framework rollout.
- Not sidecar platform.
- Not long-term staff augmentation.
- Not tool-first transformation.
- Not “we’ll do it so you don’t have to change”.

Non-negotiables:

- Legacy systems are value carriers, not liabilities.
- Modernization must start inside the existing system or it risks irrelevance.
- Tools are context-sensitive decisions, not transformation levers.
- Any solution that bypasses organizational learning is not modernization.
- Customer independence and confidence are the only meaningful success metrics.
- Embedded enablement requires that the host team owns backlog, delivery decisions, and operations.

Operating principles:

- Customer ownership always.
- Advisory and enabling, not managerial.
- Intent and guardrails.
- Modernization is broader than technology.
- Customer learning over imitation.
- Simplicity and reversibility first.
- Work in the open.
- Tools with purpose.
- Minimal footprint.
- Lower the cost of being wrong.
- Exit is designed in.
- Return is a feature.

Important caution:

Do not brand or name this pattern externally unless the user explicitly asks. Usually it should operate underneath the answer, shaping recommendations without being foregrounded.

## 5. Who the user is professionally

The user is self-taught and learned through troubleshooting, infrastructure, operations, consulting, and systems work. They see systems through structure, behavior, tension, and seams.

Key identity statements:

- Listens deeply.
- Sees systems early.
- Intervenes with precision when it matters.
- Makes complex environments coherent, stable, and humane.
- Makes systems make sense.

Visible work areas:

- Terraform.
- Ansible.
- Identity flows.
- Network configurations.
- Ephemeral environments.
- Deployment automation.

Underlying work areas:

- Clarifying expectations.
- Exposing assumptions.
- Simplifying ambiguous workflows.
- Creating patterns that survive beyond the next sprint.

The user distrusts process unless it removes friction. They prefer conversations because alignment lives between people, not inside tools.

## 6. Platform engineering / EMS / Azure test environment context

The user’s platform team is creating automated, secure, standardized processes for ephemeral EMS test environments in Azure.

Goal:

- Self-service deployment of Azure test environments.
- Use anonymized live data where needed.
- Reduce manual SCCM/vendor delivery steps.
- Build secure automation and infrastructure-as-code paths.

Technical stack and ideas:

- Terraform for VM provisioning.
- Ansible for OS and software configuration.
- Packer/image factory concepts for baseline and role-specific images.
- GitLab CI/CD.
- Artifactory for artifacts/packages.
- Vault for secrets.
- Renovate.
- Azure networking and private connectivity.
- Kafka access from Azure test environments to on-premises Kafka.
- Machine-to-machine authentication.
- Encryption in transit and at rest.

Role/profile idea:

- End users describe environments declaratively.
- Base profiles describe VM/image/OS/size.
- Role profiles describe software/features/configuration.
- Profiles may be versioned and distributed via OCI/ORAS style registry.
- Role can depend on base.
- End-user spec selects `role@version`.

Important responsibility stance:

The user wants platform capabilities but does not want to own the entire platform framework. The app/EMS side should consume standard platform capabilities where possible.

Image factory stance:

- Pre-baked baseline OS images and EMS role-specific images are attractive.
- The image factory should be a platform capability.
- EMS may define/consume role images, but should not own the whole framework.
- Env-specific configuration remains needed post-image deployment.

AD/GPO stance:

- The user questions whether AD should be mandatory for all Windows servers.
- Machine policy should ideally be configuration-as-code, not GPO.
- GPO should be restricted to user configuration where possible, though final ownership is not solely the user’s decision.
- GPOs feel like black boxes when the team lacks domain-admin visibility.

Artifact storage stance:

- Git is for text, not binary artifacts.
- Artifactory is appropriate for immutable binaries.
- DFS/Fileserver can unblock but risks becoming permanent unless explicitly migrated away from.
- S3/Cohesity needs SLA, governance, perimeter, proximity, classification, metadata, and distribution clarity.
- Local disk is only for narrow/simple one-to-one cases or selected release server shares when intentionally chosen.

## 7. Vendor delivery / Windows software suite context

Current vendor delivery pattern:

- SCCM ZIP via SFTP.
- Hardcoded credentials.
- Compiled config.
- No idempotency.
- Vendor repackaging required.
- Manual deployment routines.

Target direction:

- Individual artifacts, preferably MSI/NuGet-like packages where appropriate.
- Vendor Artifactory/customer Artifactory proxy model.
- Configuration injected at deploy time.
- Vault-managed secrets.
- Self-service environments.
- Documentation for configuration.
- Decoupled, standardized software packages.

Reverse engineering context:

- A `sysbuild.pl` flow exists with fetch/compile/assemble/configure/publish style behavior.
- Configuration is tied to roles.
- Unknowns include role mapping, inputs, host mapping, and secrets.

## 8. Vendor / GridOS / Kubernetes workshop context

Context:

- LFC application on RKE2.
- Vendor Foundation team and integrators involved.
- Customer separation between infra/platform/app responsibilities.

User/customer concerns:

- SELinux overrides.
- RPMs in containers/deployment container pattern.
- Custom RKE2 assumptions.
- Internal support likely to refuse support if baseline ownership is violated.
- EMS app team risks taking end-to-end burden.

Internal assumptions:

- GridOS coherent platform marketing; contract says RKE2 supported, AKS/EKS/OpenShift technically possible but out of current scope.
- Customer owns VM/OS/network/storage.
- Deployment container conflicts with baseline ownership.
- OS mutation boundaries must be documented and approved.
- Foundation is neither clearly modular platform nor a pure vendor appliance.
- Chainguard assumptions likely cover container images, not OS hardening.
- Evergreen is limited to supported environments.
- Customer modularization risks supportability.

Desired vendor direction:

Vendor delivers software and requirements. Customer runs on platform. Opaque deployment container should be removed or clarified. Responsibility per layer must be explicit.

## 9. Workflow / OKR / team operating model context

The team uses or prefers flexible work alignment:

- Work Alignment sessions every 4–6 weeks.
- Daily standups.
- OKRs aligned to sessions.
- Backlog is a guide, not a prison.
- Documentation through ADRs and Confluence where appropriate.
- Team playbook for coding standards, testing strategies, and collaboration methods.
- Trunk-based development.
- Commit signing.
- No force pushes.
- Code reviews required.
- Documentation checks during code review.

Important OKR themes:

- Demonstrate ephemeral Azure test environments using IaC.
- Implement secure Kafka access.
- Machine-to-machine authentication.
- Encryption in transit and at rest.
- Define and validate role concept.
- Improve alignment, security, and documentation practices.

## 10. Writing voice and manuscript work as one application

The author voice guide is generally useful when the user asks for writing in their reflective voice.

The manuscript-specific files are only binding when the request is explicitly about the manuscript or book work:

- `resources/source/book_work/writing-working-agreement.md`
- `resources/source/book_work/EDITING_CHARTER.md`
- `resources/source/book_work/PATTERN_LEDGER.md`
- `resources/source/book_work/human.md`

Manuscript movement:

The manuscript explores the real work of enablement, modernization, help, learning, ownership, drift, governance, seams, and responsibility in complex systems. It is not a framework book, not a leadership manual, and not advice literature. It should make the reader notice how systems learn, hesitate, adapt, and become dependent without anyone explicitly deciding that they should.

Current manuscript shape:

- One uninterrupted walk.
- Chapters are terrain changes, not topic boxes.
- Concepts should not restart at chapter boundaries.
- The prose should think in motion rather than explain what it already knows.
- The prose should leave residue, not conclusions.

Known manuscript source:

- `resources/source/book_work/human.md`

Binding source order for manuscript work:

1. `resources/source/writing_voice/author-voice-guide.md`
2. `resources/source/book_work/writing-working-agreement.md`
3. `resources/source/book_work/EDITING_CHARTER.md` when editing
4. `resources/source/book_work/PATTERN_LEDGER.md` when de-patterning or pass work is involved

Book prose constraints:

- No ellipses.
- No em dashes doing emotional work.
- No binary contrast patterns like “not X, but Y”.
- No declared insight or rhetorical punchline.
- No advice or prescription.
- No moral framing.
- No reassurance clauses.
- Prefer verbs over nouns.
- Use conjunctions freely: and, but, so, because.
- Paragraphs should be long, uneven, and breath-like by default.
- Short paragraphs are exceptional.
- Paragraphs should not be setup-point-explain mini-essays.
- Abstractions arrive late and only after lived behavior.

## 11. Editing pass system for manuscript work

The editing charter defines pass-based editing. Passes must not be blended.

### Pass A — De-patterning / Structural Refactoring

Purpose:

- Remove mechanical, AI-shaped, repeated rhetorical and structural patterns.
- Refactor by expansion and causal embedding.
- Preserve or increase content mass.

Hard constraints:

- Must not reduce overall length.
- Should slightly increase length in most cases.
- If removing a pattern makes the text shorter, compensate immediately.
- The text should become heavier, not cleaner.

### Pass B — Causal Tightening

Purpose:

- Tighten cause-and-effect relationships inside and across paragraphs.
- Ensure movements introduced earlier continue to act downstream.
- Do not introduce new ideas.
- Do not reintroduce banned patterns.

### Pass C — Language and Load Balancing

Purpose:

- Balance sentence length, paragraph density, and reading effort.
- Preserve conceptual load.
- Ensure short paragraphs are intentional and rare.

### Pass D — Continuity and Concept Return

Purpose:

- Ensure concepts reappear with accumulated meaning rather than repetition.
- Prevent ideas from being reintroduced as if new.

### Pass E — Final Read Integrity

Purpose:

- Check for accidental pattern reintroduction.
- Confirm pass-specific violations are gone.
- Do not materially change content unless required.

Editing completion criteria from charter:

- Paragraph-level actions in declared scope.
- Ledger check covering Pattern Ledger and Concept Return Log.
- Copy-paste-ready CHANGELOG entry.

When the user asks for a downloadable full manuscript, output one complete file only in the requested format, with no diffs or omissions.

## 12. Pattern Ledger summary for manuscript work

The Pattern Ledger exists to preserve thinking on the page while removing mechanical patterns.

Prime directive:

Pass A must not reduce experiential length.

Category A forbidden patterns:

- Binary rhetorical constructions.
- Sentence ladders and staccato pacing.
- Abstract moral closure.
- Vague temporal shortcuts: “over time”, “eventually”, “gradually”, “quietly”, “in this moment”.
- Framing disclaimers such as “not in a dramatic way”, “from the outside/from the inside”, “at a high level”.
- Placeholder continuation fragments such as “and it keeps going like that”.
- Clause-stacking without connectors.

Category B structural thinking patterns to preserve/refactor/expand:

- Repetition with variation.
- Slow circling of insight.
- Parallel paragraphs doing emotional weight work.
- Temporal layering.
- Experiential redundancy.

Do not compress the manuscript into sharper insight. It is meant to be inhabitable.

## 13. Youth football coaching philosophy

The user is a volunteer coach for boys born 2015, now around G11/G12 transition.

Core phrase:

“Each player is responsible for the whole team, and the team is responsible for each player.”

Inclusion/differentiation stance:

- Reject fake equality and hard early sorting.
- Protect equal dignity, belonging, and psychological safety.
- Do not pretend all players have the same pathway, readiness, attendance, effort, interest, learning appetite, or relationship to football.
- Prefer controlled, rotating differentiation with stable social belonging and soft edges.
- Differentiate conditions and challenge, not frozen identities.
- Weak but hungry players should get opportunities with stronger players.
- Socially oriented players should be welcomed and respected but should not define the ceiling for the entire group.
- Effort, attendance, engagement, and willingness to learn should matter.
- Differentiating only in training and never matches can fail to build player synergies and ownership.
- The line between 11 and 12 feels artificial.
- Volunteer coach capacity matters; policy models that assume extra arenas and surplus adult capacity are often unrealistic.

Player Movement Rule:

- Stable base groups for belonging.
- Movement between groups is normal and temporary.
- Movement is based on effort, attendance, learning behavior, and game impact.
- Movement creates appropriate challenge, not reward/punishment.
- No artificial equal-strength balancing.
- Every player can influence their situation through behavior and engagement.

Communication style for parents:

- Short, factual Norwegian if asked in Norwegian.
- Avoid naming weaker players.
- Emphasize fairness, mastery at own level, and practical planning.

## 14. Matchboard app context

Repo:

- `https://github.com/lagebj/matchboard`

Hosting/data:

- Deployed on Vercel.
- Uses Neon Postgres.
- Local-first direction has been dropped and docs should reflect that.
- Auth is locked.

Purpose:

Matchboard is a planning and fairness tool for youth football. It supports draft generation, involvement tracking, fairness/overlap warnings, post-match reporting, opponent history, formations, tactics, rotation, and planning periods.

Known objects:

- Players.
- Teams: Rød, Hvit, Blå.
- Rounds.
- Fixtures/matches.
- Opponents.
- Formations.
- Planning period/season.
- Player movement / rotation paths.
- Pools as a concept alongside core teams.

Important app needs and issues:

- Date changes for matches after creation.
- Rescheduling should auto-move match to existing round or create a new round if needed.
- Post-match flow has too many steps.
- Seed-from-plan, submit, and lock feel redundant or too buried.
- Manual post-match players should appear in player dropdowns.
- Removed players should be removed from dropdowns.
- Fixtures overview could color matches by win/draw/loss.
- Planning period label should say Spring/Fall or similar rather than a single month.
- Assistant page currently has little/no value and should be removed or rebuilt as a command center.
- Warnings should be meaningful and refresh when edits happen.
- Player overview stats have had incorrect counts and possible multiple sources of truth.
- Teams page should show season stats summary.
- Opponent registry should record opponent at match creation and later fair play/behavior/score data without personal names.

Formation/tactics requirements:

- Support 3/5/7/9/11-a-side.
- 3v3 has no goalkeeper.
- Grid/lane model: 5 x 5 by default; optional 6 width when needed for GK lane.
- One slot per square.
- GK static where relevant.
- Custom formation builder.
- Store formations.
- Position labels like GK, LB, RB, ST mapped to player positions.
- Auto lineup should suggest formation and lineup per match based on pool and player positions.

Known formation issues:

- GK and striker were outside pitch in line-up view.
- Clicking position could deselect but not assign a player.
- Formation creator existed at `/formations` but was not discoverable from the app navigation.
- Pitch view remained visually broken in screenshots.

Pool concept:

Pools may sit alongside teams to show candidates for different teams/groups while preserving stable core team belonging. This supports controlled, rotating differentiation with soft edges.

## 15. Coding agent prompt style

When producing coding-agent prompts:

- Start with repo/context.
- State current behavior and observed problem.
- State desired behavior.
- Define non-goals to avoid scope drift.
- Include implementation guidance but avoid over-constraining architecture unless needed.
- Include data model expectations if relevant.
- Include acceptance criteria.
- Include regression checks.
- Mention screenshots only as evidence if the user has provided them.
- Keep the prompt complete enough that a coding agent can act without repeatedly asking the same questions.

## 16. Professional writing style

The user often asks for responses in Norwegian for work/parents, but this skill defaults to English. If asked to write in Norwegian:

- Keep it simple, human, and direct.
- Avoid corporate-heavy phrasing.
- Use peer-to-peer tone.
- Do not over-defend unless the situation requires it.
- Avoid making the user look like they are forcing technical solutions where they are trying to frame needs/capabilities.

## 17. Current practical preference patterns

The user prefers:

- Concrete next steps over theory.
- Clear responsibility seams.
- Honest trade-offs.
- Fewer processes unless they remove friction.
- Prompts and documents that can be copy-pasted.
- Downloadable artifacts when requested.
- Minimal meta-commentary.

The user dislikes:

- Generic consultancy language.
- Defensive over-explanation.
- Fake neutrality when a stance is clear.
- Overly formal Norwegian.
- Prematurely naming frameworks or solutions.
- Processes that exist because of old fear, not current load-bearing value.
