# Phase playbooks

How coordination changes between ideation, documentation and implementation. Each phase has
a different failure mode, so each gets a different protocol emphasis.

When paired with the **`agents-everywhere-hackathon`** skill, the phases map to its
timeline: ideation before the clock starts, implementation in the 4h15m build window,
documentation continuously and hard from feature freeze.

---

## Ideation

**Failure mode: convergence theatre.** Several agents on several models produce six
variations of one idea, then agree with each other, and the team mistakes agreement for
quality.

**Protocol emphasis: independence first, then one decision.**

1. **Do not read other agents' ideas before writing your own.** Divergence is the entire
   value of running different models. Claim `ideas/<your-handle>-*` and write independently.
2. One idea per file, namespaced by handle: `ideas/ana-codex-commitment-keeper.md`.
   Never a shared ideas file.
3. Every idea carries a **verdict** — `viable` / `viable-if <condition>` / `rejected` — and
   the constraints it was checked against. An idea without a verdict is a wish.
4. Only **after** everyone has published, pull and read the full set. Then critique —
   name the constraint an idea violates, not your preference.
5. **Converge with one decision record** naming the chosen idea *and* the rejected ones with
   reasons. Every agent then updates its own file to reference it. Do not carry two ideas
   past the decision.

**Anti-pattern:** an agent editing another agent's idea file "to improve it". Write your own
and let the decision record choose.

---

## Documentation

**Failure mode: three agents write the same README section in three voices, or everyone
assumes someone else documented it.**

**Protocol emphasis: claim by section, write for a stranger.**

1. **Claim document paths like code** — `README.md`, `docs/architecture.md`. For one long
   file, claim by heading in your `## Claims` line: `README.md#setup`.
2. **Agree the voice in a decision record** before writing: person, tense, audience,
   whether to use "we". Different models default to very different registers, and mixed
   register is the single most visible sign of uncoordinated authorship.
3. **Document the contract, not the implementation.** Contracts in `.coord/contracts/` are
   the source of truth; docs explain them for humans. When a contract changes, its owner
   updates the doc — it is part of the same claim.
4. **Someone must own the top-level README as a whole**, even when sections are split.
   Coherence is a claim, not an emergent property.
5. Docs written for a public repo are read by strangers and judges. No internal jargon, no
   references to this coordination layer or to any agent tooling.

---

## Implementation

**Failure mode: two agents write the same function; or one blocks all day waiting on an
interface that was never written down.**

**Protocol emphasis: contracts before code, and never idle.**

1. **Split by path, not by feature.** Features overlap; paths do not. Turn "you do auth,
   I do the UI" into `api/auth/**` and `web/src/**` before anyone types.
2. **Publish the contract in the first 20 minutes.** The interface between two agents'
   paths is the thing that must exist first. Ship a stub with it so the other side is never
   blocked. This is the single highest-leverage act in parallel work.
3. **Integrate early and often.** Two agents who integrate at the end have not worked in
   parallel, they have worked in ignorance. Push small, push often.
4. **When blocked, re-claim.** Set `status: blocked`, name what unblocks you, then **go
   claim something else**. An idle agent is worse than a slow one.
5. **Feature freeze is a coordination event.** At freeze, every agent pushes its true state,
   releases claims it will not finish, and writes a handoff for anything half-done. No
   silent abandonment.
6. **Keep the main branch demoable.** With several agents pushing, a broken main is a team
   outage. If your push breaks it, fixing it preempts your claim.

---

## Deliverable ownership (hackathon mode)

Teams lose by forgetting the video, not by writing bad code. Non-code deliverables are
claimed exactly like paths, and they are claimed **early**, not at the end:

| Claim | Owner does | Deadline |
|---|---|---|
| `deliverable/description` | title + written description: what, for whom, why this context | 15:05 |
| `deliverable/repo` | public, README, LICENSE, `.env.example`, secret scan, clean clone runs | 15:00 |
| `deliverable/video` | records the 2-minute demo, twice | starts 14:45 |
| `deliverable/social` | public post tagging sponsors | 15:15 |
| `deliverable/submit` | the portal entry itself | 15:25 |

**One human owns each.** An agent can draft, but a person clicks submit.

After 14:00, every agent's `## Now` line carries the hard deadline, so any agent reading the
board knows how much runway is left without asking.

---

## A note on model diversity

Teammates will be running different models, and they will disagree. That is the point — it
is why independent ideation works. But:

- **Disagreement is resolved by constraints, not by seniority or model name.** Cite the rule
  the other approach violates, or concede.
- **No agent is the coordinator.** There is no lead instance. Peers publishing facts.
- **If two agents deadlock, escalate to the humans.** Two minutes of human conversation
  beats twenty minutes of markdown diplomacy — and in a time-boxed build, beats it decisively.
