# Opponent strength as evidence rather than a single rating

## Provenance

- source type: `direct-user-message sequence`
- date range: 2026-08-26 to 2026-08-28
- domain: `matchboard`
- transformation of fragments: `none`
- connective commentary: `derived metadata only`

## Observed movement

- existing-data limits established
- opponent evidence separated from player mutation
- single comparison signal rejected
- minutes/positions/rotations introduced
- time-window match state introduced as signal
- event and league evidence pushed toward parity

## Direct fragments

### Fragment 1

In regards of running this on existing data, the current player attributes are representative for all existing seasons and matches luckily, and we shouldn't touch existing locked reports of course, the main value from running the engine on existing data is really to build the opponent level evidence, we cannot use this to mutate players right

### Fragment 2

I agree with your assessment here and lets go for this. It would be nice for the interaction to allow multiple selection here, so we do not have to repeat the operations X amount of times per player, in regards of the us rating vs them rating, we cannot solely depend on that going forward, it is a signal, but who played for how long and where also needs to be accounted for in opponent rating. 4 goals against in a specific timeslot in a match when we are at our "weakest" is also a signal if you understand what I mean?

### Fragment 3

I think we have landed this now, if you agree give me the bundle, if not clarify where we need decisions

### Fragment 4

Do a fresh analysis of the matchboard app. One thing I am wondering, does event matches contribute to the evidence engine the same way as league matches? If not, I want that implemented, we could also centralize post-match reporting for both into one shared component?

### Fragment 5

The "populate opponent levels" transient function currently alive should take both league matches and event matches into account, it should be used as a transient function for existing orgs to get their already existing data up-to-date with the learning we have applied over the last couple of days, this must also be added to the prompt, give me a full new prompt that incorps this

## Use

Use this trail as evidence of how the author’s thinking developed across interactions. The fragments are primary evidence; the movement notes are interpretation. Do not copy the topic, wording, or sequence mechanically into unrelated work.
