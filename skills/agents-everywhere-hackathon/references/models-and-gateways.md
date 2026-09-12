# Models and gateways — OpenAI, OpenRouter, Kimchi, Mozilla.ai

Retrieved 2026-09-12.

---

## OpenAI — presenting sponsor ✅

Docs: <https://platform.openai.com/docs> · <https://developers.openai.com/>

> **Before building anything from scratch: read the starter repo + access email.** The
> organizers ship a starter repository and access information before the event. ✅

### Agents SDK ✅

```bash
pip install openai-agents          # Python
npm install @openai/agents zod     # TypeScript
```

Optional Python extras: `pip install 'openai-agents[voice]'`, `'openai-agents[redis]'` ✅.

A lightweight framework for agentic apps with few abstractions — the production upgrade of
Swarm. Primitives: **Agents** (an LLM with instructions, tools, guardrails and handoffs),
**handoffs**, **guardrails**, **sessions**, and **tracing** ✅.

Also documented ✅:
- **Sandbox agents** — preconfigured with a container for work over long time horizons
- **Realtime agents** — voice agents with full agent features
- **Voice agents** — STT → agent workflow → TTS pipelines

### Realtime API ✅

Server-side, low-latency speech-to-speech agents over **WebSocket** transport. For new
realtime agents, start with **`gpt-realtime-2.1`** ✅.
Quickstart: <https://openai.github.io/openai-agents-python/realtime/quickstart/>

**This is the sponsor path for any voice / physical / wearable idea.**

### Apps SDK 🟡

Build apps that live inside ChatGPT. Relevant if the "untapped context" you pick *is*
ChatGPT itself. Confirm current status and availability at
<https://developers.openai.com/> before committing a project to it.

---

## OpenRouter ✅

Docs: <https://openrouter.ai/docs/quickstart>

An **AI gateway and model marketplace**: a unified interface to hundreds of models from
many providers, designed to reduce vendor lock-in while giving availability, cost
flexibility, and routing control ✅.

**OpenAI-compatible.** Point any OpenAI SDK at it:

| | |
|---|---|
| Base URL | `https://openrouter.ai/api/v1` ✅ |
| Chat completions | `https://openrouter.ai/api/v1/chat/completions` ✅ |
| Auth | `Authorization: Bearer <YOUR_API_KEY>` ✅ |
| List models | `GET https://openrouter.ai/api/v1/models` ✅ |

Optional headers, which also put your app on the OpenRouter leaderboards ✅:

```
HTTP-Referer: <YOUR_SITE_URL>
X-Title: <YOUR_SITE_NAME>
```

```python
from openai import OpenAI
client = OpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key=OPENROUTER_API_KEY,
)
```

**Why it earns its place at a hackathon:** it is your failover when a provider rate-limits
you at 15:00 with the video unrecorded. Wire it as a fallback even if it is not the star.

---

## Kimchi by Cast AI — São Paulo local sponsor ✅

Docs: <https://docs.kimchi.dev/docs/inference-quickstart> ·
CLI: <https://github.com/castai/kimchi-cli>

Cast AI's AI platform: **serverless inference over open-source models** (GLM, Kimi,
MiniMax) behind a single API key, with multi-model routing and cost attribution per PR or
team. Built on Cast AI's Kubernetes and cloud-cost-optimization background; it brings
**identity, policy and audit to autonomous agents in production** ✅.

| | |
|---|---|
| Endpoint | `https://llm.kimchi.dev/openai/v1` — **OpenAI-compatible** ✅ |
| Auth | API key from Kimchi → API Keys → Create API key ✅ |
| Billing | Pay per token ✅ |

CLI ✅:
```bash
kimchi            # launch the coding harness
kimchi setup      # point your AI coding assistant at Cast AI-hosted open models
kimchi version
```
`kimchi setup` needs no Anthropic or OpenAI key — just a Cast AI key ✅.

**Angle most teams will miss:** the **governance and audit story for autonomous agents**.
If your project involves an agent acting with real permissions, "here is the identity,
policy and audit trail" is a genuine differentiator — and it flatters the local sponsor.

---

## Mozilla.ai ✅

Site: <https://www.mozilla.ai/> · GitHub: <https://github.com/mozilla-ai>

Open-source AI tools and infrastructure for **trustworthy, transparent and controllable**
AI applications ✅. Python.

| Library | What it does |
|---|---|
| **`any-llm`** | One interface across LLM providers — OpenAI, Anthropic, Azure/Microsoft Foundry, Mistral, Ollama and more, without changing code. v1.0 adds production stability, standardized reasoning output, auto provider detection ✅ |
| **`any-agent`** | A single interface to use **and evaluate** different agent frameworks ✅ |
| **`any-guardrail`** | Guardrails ✅ |
| **`mcpd`** | MCP daemon ✅ |

**Where it earns a slot:** `any-agent` gives you a real evaluation story — "we compared
three agent frameworks on this task" is a strong 15 seconds of a 2-minute video, and very
few teams will have one.
