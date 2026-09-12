# Ship-day checklist

Submissions close at **15:30**. Work backwards from that, not forwards from 11:15.

## Timeline

| Time | Do this |
|---|---|
| 11:15 | Team formed, idea locked, **demo sentence written down** |
| 11:30 | Repo created, public, licensed, `.gitignore` + `.env.example` in place |
| 11:45 | Riskiest integration proven with a hello-world **before** building around it |
| 13:00 | Core flow working end-to-end, however ugly |
| 14:00 | **Feature freeze.** Only polish and fixes after this |
| 14:15 | Cache/seed the demo data so the video cannot be broken by Wi-Fi |
| 14:45 | **Start recording the video** |
| 15:05 | README + written description finalized |
| 15:15 | Social post drafted and published |
| 15:25 | Everything submitted in the portal |
| 15:30 | **Closed** |

If any of these slips by more than 15 minutes, cut scope — do not extend the timeline.

## The five deliverables

- [ ] **Title** — clear, specific, memorable
- [ ] **Written description** — what it is, **who it's for**, and **why this context matters**
- [ ] **Public GitHub repo** — pushed, public, runs from a clean clone, licensed
- [ ] **Two-minute video** — the thing actually running; lead with the demo, not the slides
- [ ] **Social post** — public, tagging the event sponsors

## Repo hygiene (it is judged)

- [ ] `README.md` — what it is, the untapped context, how to run it, what it uses
- [ ] `LICENSE` — MIT unless the team decided otherwise
- [ ] `.env.example` with placeholders; **no real keys anywhere in history**
- [ ] Secret scan before going public
- [ ] `main` is the working demo path
- [ ] Name the sponsor tech you used and *how* — this is how sponsor prizes get noticed

## Video that works in 2 minutes

1. **0:00–0:15** — the demo sentence, over a shot of the thing running.
2. **0:15–1:30** — one uninterrupted flow. Real, not narrated slides. Show the agent
   *acting* in its context, and show a human reacting to it.
3. **1:30–1:50** — the architecture in one frame; name the sponsor tech.
4. **1:50–2:00** — why this context matters.

Record it **twice**. The second take is always better and you will have time for exactly two.

## Common ways teams lose

- Building for 4 hours and submitting nothing because the video was left to last.
- A live API call failing on stage Wi-Fi with no cached fallback.
- A private repo, or a public repo with a key in the history.
- A great idea with no working flow — the organizers explicitly rank a clear working demo above ambition.
- Sponsor tech mentioned but not visibly used, so no sponsor prize.
