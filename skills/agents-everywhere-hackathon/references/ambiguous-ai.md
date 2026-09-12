# Ambiguous AI 🏆

**Named prize: Best Use of Ambiguous AI — one NVIDIA DGX Spark for the team.**

Site: <https://www.ambiguous.ai/> · Agents: <https://www.ambiguous.ai/agents> ·
Recipes: <https://www.ambiguous.ai/agents/recipes> · Console: <https://app.ambiguous.ai/developers>
**OpenAPI spec: <https://app.ambiguous.ai/api/openapi.json> — public, no auth, 939 paths / 58 modules**
Retrieved 2026-09-12. ✅ verified against the live spec unless marked.

> **Read the OpenAPI spec before the marketing pages.** It needs no key, and everything that
> wins this prize is in it and *not* on the website.

## What it is ✅

The workspace for human–AI collaboration: **17 productivity apps rebuilt from scratch** —
Docs, Sheets, Slides, Wiki, Mail, Chat, Forms, Sign, Tasks, Calendar, CRM, Drive, Identity,
Assistant, Admin, Automations — so AI coworkers work in the same apps, on the same data, as
everyone else. Each coworker has **its own identity, login and workspace email**; you can
email it, message it in chat, assign it a task, or @mention it in a comment.

| | |
|---|---|
| Base URL | `https://app.ambiguous.ai/api/` ✅ |
| Auth | `Authorization: Bearer $AMBIGUOUS_API_KEY` (keys start `ak_`) ✅ |
| CLI | `npx ambiguous` ✅ |
| Free tier | 5 members, 1,000 AI actions/month; external agents free for routine CRUD ✅ |

## The part that wins the prize: `/api/coworkers/*` ✅

Not documented on the website. A first-class **AI-coworker runtime**:

| Endpoint | Gives you |
|---|---|
| `POST /api/coworkers/provision` | `display_name`, `persona`, `focus_areas`, `role`, `manager_user_id` → returns the coworker's own `api_key` |
| `GET/POST /{id}/playbooks` | named playbooks: `objective`, `instructions`, `subtasks`, `trigger_types` |
| `/{id}/playbooks/{pid}/versions` | **versioned** playbooks, each version with a `change_reason` |
| `POST /{id}/dispatch` | "the canonical *wake a coworker* action" — `source`, `event`, `payload`, `playbook_id`, `idempotency_key` |
| `GET /{id}/executions` | execution history; running ones expose `surface`, `thread_ref`, `fanout_depth` |
| `GET/POST /{id}/monitored-channels` | the coworker natively watches Chat channels |
| `PATCH /{id}/manager` | "reassign the **accountable human**" — admin-only |
| `POST /{id}/pause` · `/resume` · `/rotate-token` | lifecycle control |
| `GET /api/internal/coworkers/llm-usage` | per-coworker LLM usage 🟡 *(under `/internal/` — verify your `ak_` key reaches it)* |
| `GET /api/internal/coworkers/{id}/memories` | coworker memory 🟡 *(same caveat)* |

### Their philosophy, stated in their own event names ✅

```
agent.created    agent.first_tool_call_succeeded    agent.first_week
```

`agent.first_week`. With `persona`, `focus_areas`, an accountable human manager, versioned
playbooks carrying change reasons, and pause/resume, the thesis is plain: **AI coworkers are
staff you hire, onboard, coach, manage and hold accountable.** Build for that thesis.

## Module endpoints ✅

`documents` · `sheets` (`GET /sheets/{id}/range`, `PATCH /sheets/{id}/cells`) · `slides` ·
`wiki/pages` · `mail` (`GET /mail/inbox`, `POST /mail/send`) · `channels/{id}/messages` ·
`crm/contacts`, `crm/deals` · `tasks` (+ `/{id}/complete`, `/{id}/comments`) ·
`calendar/events`, `/availability` · `forms` · `drive` · `search` ·
`admin/audit-log` · `automations` · `assistant`.

**`POST /api/llm`** — `{ prompt, output_schema?, model?, max_output_tokens?, temperature? }`.
**Model choice is a first-class parameter**, so model routing is natively expressible. ✅

## Webhooks ✅

`POST /api/webhooks` (returns an HMAC signing secret, **one-time visibility**) ·
`GET /api/webhooks/event-types` · `/{id}/test` · `/rotate-secret` · `/deliveries`.
Verify with constant-time HMAC comparison; replay protection included.

Event names include `task.assigned` · `task.completed` · `task.due_soon` · `task.overdue` ·
`task.commented` · `document.shared` · `document.updated` · `sheet.updated` ·
`comment.created` · `deal.won` / `lost` / `stage_changed` · `form.submitted` ·
and git-aware `task.pr_linked` / `task.pr_merged` / `task.commit_landed`.

## The Assistant, as a sub-tool ✅

`POST /api/assistant/chat` and `/chat/stream` (SSE), `/capabilities`, `/turns/{id}/replay`.
Runs a **SPEAR** loop — Scope, Plan, Execute, Assess, Resolve — and self-corrects against the
original prompt. External agents can call it: **delegation within delegation.**

## Their three showcased recipes ✅

1. **First coworker** — `provision` → returns its own `ak_` key → it authors a document.
2. **Webhook registration** — HMAC verification + replay protection.
3. **Human-to-agent task handoff** — human `POST /api/tasks` → coworker receives the webhook →
   does the work → `POST /api/documents` → `POST /api/tasks/{id}/comments` with the link →
   `PATCH` complete. **This is their canonical loop. Build it.**

## Making it load-bearing (what the prize actually rewards)

1. **Hire, don't call.** Provision a coworker with a persona, focus areas and an accountable
   manager. An API call with no identity is the cosmetic version.
2. **Be reachable the human way** — a task assignment, an email, an @mention, a monitored
   channel. Recipe 3 is the shape.
3. **Produce artifacts humans continue working on** — a Doc, a Sheet, a CRM record, a Task
   comment — then close the loop by marking the task complete.
4. **Use a playbook, and version it.** Coaching an agent with a `change_reason` changelog is
   the single most distinctive thing you can demo here.
5. **Cross more than one module.** Chat → Doc → Task → CRM in one flow demonstrates the whole
   product thesis in 90 seconds.

## Verify before you build ⏱️

- [ ] `curl https://app.ambiguous.ai/api/openapi.json` and read `/coworkers/*` — no auth needed
- [ ] Provision a coworker; confirm the returned `ak_` key works
- [ ] **Test `/api/internal/coworkers/llm-usage` and `/memories` with that key** — the two 🟡 items
- [ ] Register a webhook, call `/{id}/test`, verify the HMAC path end-to-end
- [ ] Create a playbook, then a second version; confirm `change_reason` persists
- [ ] `POST /api/llm` with an explicit `model` — confirm which models are accepted
- [ ] Note what counts as an "AI action" against the 1,000/month free budget
