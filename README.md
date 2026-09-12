# Agents, Everywhere — hackathon project

Our entry for the **AI Tinkerers Global Hackathon — "Agents, Everywhere: Bots, Channels &
More"** (12–13 September 2026, 48 cities), São Paulo site at Faculdade Impacta.

> **This branch (`main`) is the codebase.** It is intentionally empty at the start of the
> event — the project gets built here, together, on the day.

---

## 🚀 Teammates: start here

Everything you need to get oriented lives on the **[`skill-agent`](../../tree/skill-agent)**
branch as portable [Agent Skills](https://agentskills.io) — an open format that works in
**any** harness: Claude Code, Codex, Cursor, VS Code / GitHub Copilot, Gemini CLI, OpenCode,
Goose, Amp, Zed, Roo Code, Factory, Kiro and others.

Install them into your own agent, whichever one you use:

```bash
# grab just the skills branch, without touching your working copy of main
git clone --branch skill-agent --single-branch \
  https://github.com/henrique-simoes/AI-Tinkerers-OpenAI-agents-everywhere-hackathon.git ae-skills
```

Then copy the skills into your harness's skills directory:

```bash
# cross-tool default (VS Code / Copilot and others), project-scoped
mkdir -p .agents/skills && cp -R ae-skills/skills/* .agents/skills/

# or Claude Code, available in every project
mkdir -p ~/.claude/skills && cp -R ae-skills/skills/* ~/.claude/skills/
```

Full install paths for each harness: **[`skill-agent` branch README](../../tree/skill-agent)**.

### What you get

| Skill | What it does |
|---|---|
| **`agents-everywhere-hackathon`** | The challenge brief, the five mandatory deliverables, the 4h15m build window, judging, and the full sponsor stack with real SDK detail — OpenAI, CopilotKit/AG-UI, OpenRouter, Ambiguous AI, Exa, Trigger.dev, Auth0, Mozilla.ai, Kimchi |
| **`agent-relay`** *(optional)* | Coordination when several people or agents build in this repo at once — claims, interface contracts, handoffs — over git alone, no services |

Both are **optional and independent**. Install either, both, or neither. Nothing in this
repo depends on them, and teammates who prefer their own workflow are unaffected.

---

## The challenge, in one line

> Most AI agents still operate inside a separate chat window. Build a **working agent that
> acts in an untapped context** — a tool, channel, device or environment where people
> already do their work and daily life.

## What we must submit — all five, before 15:30

1. **Title**
2. **Written description** — what it is, who it's for, **why this context matters**
3. **Public GitHub repository** ← this repo
4. **Two-minute video** of it actually running
5. **Public social post** tagging the sponsors

Detailed hour-by-hour plan: `references/submission-checklist.md` inside the hackathon skill.

---

## Repo conventions

- `main` is the codebase and stays demoable — with several people pushing, a broken `main`
  is a team outage.
- **No secrets, ever.** `.env.example` holds placeholders only; real keys stay local.
- Use whatever editor, agent or workflow you like. Nothing here is tool-specific.
- Conventions the team agrees on get written here, and this README wins.

## License

MIT — see [LICENSE](LICENSE). The hackathon requires code others can review, reuse and
learn from.

---

*Built at the AI Tinkerers Global Hackathon, presented by OpenAI. This is a participant
project — not affiliated with, or endorsed by, OpenAI or AI Tinkerers.*
