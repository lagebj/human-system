# Raw corpus — technical reasoning

> Provenance: direct user messages available in the project/conversation history used to build this bundle. Wording is preserved as available. No prose cleanup was applied.

## mb-2026-08-30-finalisation
- Date: 2026-08-30
- Context: State model simplification
- Provenance: `direct-user-message`

I fully agree with your suggestions here. Another thing I have noticed is all the "complete", "finalize", "lock" functionality at the differetn stages and routes, do we really need all of these? Actual date and clock-time should be sufficient for a lot of these finalised states. If a match has started, the pre-match plan is finalised. If the coach has made any errors in pre-match planning that can be fixed in post-match report. Do we really need to for example "Confirm lineup"? Finalise round? finalise match? Lock

## mb-2026-08-30-backfill
- Date: 2026-08-30
- Context: Automatic backfill logic
- Provenance: `direct-user-message`

Same with Events and "drafts", locking players etc. Instead of locking a player to a squad before automatic backfill, we should look at the already assigned players (these should automatically be "locked") and the evidence we have about target size and current assignments, an automatic backfill should not distribute 9 players evenly across 3 teams if team 1 has target size 12 and 11 players already assigned, then 1 should go here and the rest be distributed across the teams actually lacking players

## mb-2026-08-30-programme-docs
- Date: 2026-08-30
- Context: Implementation programme scope
- Provenance: `direct-user-message`

We need to redefine surrounding docs and principles to match this programmes intent in the programme as well

## mb-2026-08-30-kicks-weekly
- Date: 2026-08-30
- Context: Product concept adaptation
- Provenance: `direct-user-message`

The weekly summary is nice IMO, how, when and where? Also pinning names to the stats would be helpful, for example instead of "3 had no match opportunity" we could say "Noah, Emil and Elias had no match opportunity", same with other stats. This ties up well with the situational-decision-support programme we have implemented (currently in PR). Regarding the voice recording, I like the idea, but it requires storage, I do not have a good storage system as far as I know implemented. I am also not sure I understand what you mean by "true matchday mode" here.

## mb-2026-08-29-situational-flows
- Date: 2026-08-29
- Context: Situation-driven UX
- Provenance: `direct-user-message`

There are different modes on the coach side I think as well, there is matchday, with last minute changes, quick decisions and actions etc. There is short-term planning like next round and there is long-term planning, we enter with different intents probably. Your case about mobile flow being difficult is very true, only the live match reporting works well on mobile really. What do the internet say about decision-/situation-driven flows like this? A lot of the stuff under "More" are interesting, but we need to build the same data into situational and decision driven workflows as well where appropriate, it is difficult to know what data is relevant where and especially when, but maybe we could fetch some experiences from the wild on this? Inspiration does not need to be from a similar app or domain, but

## mb-2026-08-29-spec-transfer
- Date: 2026-08-29
- Context: Architecture/specification transfer
- Provenance: `direct-user-message`

Is this transferrable to a technical spec and a coding agent prompt? I am not against introducing new dependencies or engines if neccessary, but we should reuse what we already leverage if possible, is for example OPA useful here?

## mb-2026-08-29-rego
- Date: 2026-08-29
- Context: Feature gate decision
- Provenance: `direct-user-message`

Should we remove this Rego gate entirely or should we default to true?

## mb-2026-08-29-collab-invite
- Date: 2026-08-29
- Context: Cross-group collaboration
- Provenance: `direct-user-message`

A hospitering invitation should be bi-directional, if G2016 wants to use G2015 players, they should send an invitation for it as well, the invitation from G2015 to use G2016 players should implicitly assume that the opposite is true. Maybe we could extend this to requests as well, if an collab path exists, G2015 can request X amount of players from G2016 for a match or event, they

## mb-2026-08-29-collab-counter
- Date: 2026-08-29
- Context: Specific-player request flow
- Provenance: `direct-user-message`

A request for players should also be an email for visibility as quickly as possible. If we are to support requesting specific players, we must also support rejecting that specific player and providing a counter-suggestion.

## mb-2026-08-26-locking-time
- Date: 2026-08-26
- Context: Time-based state transitions
- Provenance: `direct-user-message`

I think alot of the "locking" can happen based on dates maybe? A match/round is configurable all the way up to or around kick-off time, then it locks automatically? Something like that. Post-match report has to be open until submitted though, this may be something the coach does the following day for example

## mb-2026-08-26-postmatch-correction
- Date: 2026-08-26
- Context: Late correction principle
- Provenance: `direct-user-message`

Any last minute changes done for a match that has not been recorded pre-match in matchboard for any reason must be possible to record post-match.

## mb-2026-08-26-existing-data
- Date: 2026-08-26
- Context: Backfill/evidence constraints
- Provenance: `direct-user-message`

In regards of running this on existing data, the current player attributes are representative for all existing seasons and matches luckily, and we shouldn't touch existing locked reports of course, the main value from running the engine on existing data is really to build the opponent level evidence, we cannot use this to mutate players right

## mb-2026-08-26-multiselect
- Date: 2026-08-26
- Context: Evidence model refinement
- Provenance: `direct-user-message`

I agree with your assessment here and lets go for this. It would be nice for the interaction to allow multiple selection here, so we do not have to repeat the operations X amount of times per player, in regards of the us rating vs them rating, we cannot solely depend on that going forward, it is a signal, but who played for how long and where also needs to be accounted for in opponent rating. 4 goals against in a specific timeslot in a match when we are at our "weakest" is also a signal if you understand what I mean?

## mb-2026-08-27-demo-data
- Date: 2026-08-27
- Context: Demo-data tone
- Provenance: `direct-user-message`

For the seeded demo data we should find some cool names for players, teams, events etc. Not use "Player 1", Team A", "Event 2" etc. This is an opportunity to have some fun and be creative IMO

## mb-2026-08-20-weekly-summary
- Date: 2026-08-20
- Context: Weekly summary reasoning
- Provenance: `direct-user-message`

I want to automate the snapshots from the app for the documentation, is this possible to do as part of the coding agent flow we currently have?

## music-2026-08-21-live-vocals
- Date: 2026-08-21
- Context: Live vocal recording
- Provenance: `direct-user-message`

I want to explore the options for recording vocals in my setup live together with the rest of the band. We have built boxes for both guitar rigs to dampen the sound in the room and play with headsets using the P16HQs, the bass is signal only, no sound in the room. The drums are of course sounding in the room and are mic'ed all over. So for best possible mixing I would like to figure out how to include vocals in the live setup without breaking the mixing opportunities

## music-2026-08-21-vocal-bleed
- Date: 2026-08-21
- Context: Follow-up question
- Provenance: `direct-user-message`

What about vocal bleed in drums mics?

## general-2026-08-17-public-urls
- Date: 2026-08-17
- Context: Capability inquiry
- Provenance: `direct-user-message`

What info are you able to fetch from my Matchboard app using the public URLs, app.matchboard.football, test.matchboard.football and matchboard-chi.vercel.app?

## general-2026-08-14-rpc
- Date: 2026-08-14
- Context: Exploring unfamiliar concept
- Provenance: `direct-user-message`

https://miren.dev/blog/rpc-that-calls-you-back
This is a fascinating concept, is there any possibilities given my Tech stack to use similar model? Is there potentially any value to it in Matchboard context?
