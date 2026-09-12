# Supporting stack — Exa, Trigger.dev, Auth0

Retrieved 2026-09-12.

---

## Exa — search infrastructure for AI ✅

Docs: <https://docs.exa.ai> · MCP: <https://docs.exa.ai/reference/exa-mcp>

Search infrastructure for AI applications. Its engine and APIs help developers and agents
**find, retrieve and synthesize relevant, high-quality web content from natural-language
queries** ✅ — meaning-based retrieval rather than keyword matching.

**Exa credits are attached to all three global placements.** The organizers want it used.

### Capabilities ✅

- **Search** — find pages on a topic and get clean, ready-to-use content
- **Contents** — fetch the full content of a known URL
- **Advanced search** — filters over domains, dates, content options
- **Answer** — a direct, **citation-backed** answer to a natural-language question; works
  for both specific answers and open-ended summaries
- **Context (Exa Code)** — <https://exa.ai/docs/reference/context>

### MCP server ✅

```bash
npx exa-mcp-server        # EXA_API_KEY in the environment
```

Open source; drops straight into any MCP-capable harness. **This is the fastest path** —
if your agent already speaks MCP, Exa is minutes, not an integration.

Python and TypeScript SDKs exist 🟡 — confirm package names at docs.exa.ai.

### Where it fits

Any agent that needs current, grounded web knowledge. The **Answer** endpoint's citations
are worth showing on screen in the video — they make the agent look trustworthy.

---

## Trigger.dev — durable background jobs ✅

Docs: <https://trigger.dev/docs> · LLM-friendly index: <https://trigger.dev/docs/llms.txt>

Open-source background-jobs framework: reliable workflows written as **ordinary async
code**, with queuing, automatic retries, elastic scaling and real-time monitoring for
long-running tasks and AI workloads ✅. **v4 is GA** ✅.

### Why an agent project needs it

It is the answer to *"this agent task takes three minutes and the HTTP request times out."*
Anything scheduled, fan-out, or crash-surviving belongs here.

### v4 features worth knowing ✅

- **Warm starts** — 100–300 ms execution vs. seconds for cold starts
- **Waitpoints** — pause a run for **human-in-the-loop approval** (excellent demo material)
- **Run prioritization** and **queue management** with pause
- **AI tool integration** — convert tasks into AI SDK tools
- **AI Agents** — durable multi-turn AI chats, one task per conversation, surviving
  refreshes, deploys and crashes
- Middleware and lifecycle hooks with shared state and proper cleanup

### Shape ✅

Tasks are defined with the `task` function, taking an `id` and an async `run` function.
Exact import path and current API: check <https://trigger.dev/docs/tasks/overview> — the
v4 rules file at
<https://github.com/triggerdotdev/trigger.dev/blob/main/rules/4.0.0/advanced-tasks.md>
is written for agents and is the fastest correct reference 🟡.

### Time budget ⏱️

Docs claim first task built and deployed in ~3 minutes, and an AI agent in 3 steps ✅.
Realistically budget **30 minutes** including account setup and one deploy. **There is a
deploy step** — do not discover that at 15:00.

---

## Auth0 — the unlock for third-party-account ideas ✅

Docs: <https://auth0.com/ai/docs> · <https://auth0.com/docs/get-started/auth0-for-ai-agents>
Token Vault: <https://auth0.com/ai/docs/intro/token-vault>

Developer identity platform — authentication and authorization for web, mobile and **AI**
applications ✅.

### Token Vault — the part that matters ✅

A secure, centralized store for third-party provider tokens, implementing federated
identity across connections. **AI agents fetch access tokens for external identity
providers and call their APIs through a single Auth0 integration**, with OAuth 2.0 /
OpenID Connect security controls.

- Handles OAuth flows for **30+ pre-integrated apps** (GitHub, Slack, Google Workspace and
  more) **plus any custom OAuth provider** ✅
- Manages access tokens, refresh tokens and the whole lifecycle automatically ✅
- Out-of-the-box integrations with **LangChain, LlamaIndex, and the Vercel AI SDK** ✅

### Why this is strategically important

The hackathon requires a **public repository**. That rules out scraping a commercial
service or handling a user's credentials directly. Token Vault is the **legitimate path**
to "the agent acts on the user's accounts" — and it is a sponsor, so the honest
architecture is also the rewarded one.

### Time budget ⏱️

Faster than building OAuth yourself, but it is still identity plumbing. Budget **45+
minutes** and **set the tenant and connections up before the event**. If the idea does not
genuinely need third-party account access, skip it.
