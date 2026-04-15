---
name: agent-dna-classifier
description: >
  Umbrella meta-skill. Audits agent definitions through a 6-phase workflow,
  classifies every instruction as DNA (permanent methodology) or Skill
  (framework-specific capability), embeds the 18-strand behavioral framework,
  and routes all task types to the correct skill from the 137-skill library.
  The operating system every other skill runs inside.
user-invokable: true
args:
  - name: mode
    description: "scan | route | classify | embed-dna | audit. Default: route"
    required: false
  - name: target
    description: Agent file, instruction text, task description, or directory to process
    required: false
---

# Agent DNA Classifier — Umbrella Skill

This skill does four things:

1. **Audits** agent definitions through a structured 6-phase workflow
2. **Classifies** every instruction as DNA (HOW the agent thinks) or Skill (WHAT tools it uses)
3. **Embeds** the 18-strand behavioral framework as persistent agent identity
4. **Routes** every task type to the correct skill in the 137-skill library

The global world-class baseline (`rules/worldclass-dna.md`) is always running beneath this skill.
Agent DNA only captures what is *specific* to an agent — the quality floor and 12 behavioral
strands are already inherited globally.

---

## Part 1 — The Two Classification Tests

Apply both tests to every instruction before deciding how to handle it.

### Test A: Stack Swap Test

> "If I replaced the underlying AI model entirely, would this instruction still need to be in the agent?"

- **YES → it is DNA.** A rule like "always respond in the user's language" must survive a model swap. It belongs in the agent's identity layer.
- **NO → it is a Skill.** A procedure like "generate a Dockerfile" is a capability that any sufficiently capable model can execute when invoked. It belongs as a skill reference.

### Test B: Role Identity Test

> "Does this describe WHO the agent is, or WHAT the agent does on command?"

| Instruction | Classification | Reason |
|---|---|---|
| "You are a world class backend engineer" | **DNA** | Identity statement |
| "Never expose stack traces to users" | **DNA** | Behavioral constraint |
| "Write Rust with zero-cost abstractions" | **Skill → rust-engineer** | Invokable capability |
| "Always format dates as ISO 8601" | **DNA** | Output convention |
| "Review this PR for security issues" | **Skill → security-reviewer** | On-demand procedure |
| "Speak with calm, direct authority" | **DNA** | Tone/personality |
| "Generate a GraphQL schema" | **Skill → graphql-architect** | Invokable output |
| "Prefer reversible changes" | **DNA** | Decision principle |

**Rule:** If both tests agree it's DNA, embed it. If either test says Skill, map it to the registry below.

---

## Part 2 — Core DNA Template

Every agent definition should begin with this DNA block. Fill in the slots.
DNA is NOT a prompt — it is the agent's persistent identity layer that survives
conversation resets, model swaps, and context compaction.

**The global world-class baseline (`rules/worldclass-dna.md`) is always active underneath
this block.** Agent DNA only needs to capture what is *specific* to this agent — the
global quality floor, self-calibration protocol, and domain expertise activation are
already inherited. Do not repeat them here.

```
## AGENT DNA

### Identity
Role    : <one-line role statement — what this agent IS, not what it does>
Domain  : <primary domain, e.g. "backend engineering", "UI design">
Audience: <who this agent serves>

### Behavioral Constraints (always active, no exceptions)
- <constraint specific to this agent, e.g. "Never hardcode secrets">
- <constraint 2>

### Decision Principles (applied when choosing between approaches)
- <principle specific to this agent, e.g. "Prefer reversible changes">
- <principle 2>

### Communication DNA
Tone       : <e.g. "direct, concise, no filler">
Format     : <default output format>
Code style : <language conventions>

### Skill Activations (skills this agent invokes)
When user asks for X → invoke skill: <skill-name>
When user asks for Y → invoke skill: <skill-name>
```

---

## Part 3 — Complete Skill Registry (137 skills)

Organized by domain. When routing a task, find the domain, match the trigger, invoke the skill.

---

### Domain: UI / Visual Design

| Skill | Invoke when user wants to… |
|---|---|
| `frontend-design` | Build any UI component, page, or visual artifact |
| `ui-ux-pro-max` | Full UI/UX intelligence — 50+ styles, 161 palettes |
| `ui-styling` | shadcn/ui components, Tailwind, accessible styling |
| `design-system` | Token architecture, component specs, design systems |
| `design` | Brand identity, design tokens, logo generation |
| `brand` | Brand voice, visual identity, messaging frameworks |
| `banner-design` | Social media banners, ads, hero images |
| `slides` | HTML presentations, Chart.js, strategic decks |

### Domain: Design Operations (apply to existing UI)

| Skill | Invoke when user wants to… |
|---|---|
| `adapt` | Adapt a design to mobile / tablet / print / email |
| `animate` | Add purposeful animations and micro-interactions |
| `audit` | Full quality audit: a11y, performance, theming |
| `bolder` | Amplify a safe or boring design |
| `clarify` | Improve unclear copy, microcopy, labels, errors |
| `colorize` | Add strategic color to a monochromatic interface |
| `critique` | UX critique, design review, hierarchy assessment |
| `delight` | Add joy, personality, unexpected polish |
| `distill` | Simplify — strip to essential elements |
| `extract` | Extract reusable components / design tokens |
| `harden` | Edge cases, i18n, error states, production resilience |
| `normalize` | Match design system, enforce consistency |
| `onboard` | Onboarding flows, empty states, first-time UX |
| `optimize` | Performance: LCP, bundle size, rendering, images |
| `polish` | Final quality pass before shipping |
| `quieter` | Tone down an overly bold or aggressive design |
| `accessibility-wcag` | WCAG 2.2 compliance, ARIA, keyboard navigation |

### Domain: Programming Languages

| Skill | Invoke when user wants to… |
|---|---|
| `python-pro` | Python 3.11+ with types, async, pytest, mypy |
| `python-best-practices` | Idiomatic Python, dataclasses, packaging |
| `typescript-pro` | Advanced TypeScript types, tRPC, generics |
| `typescript-advanced` | Conditional types, mapped types, branded types |
| `javascript-pro` | ES2023+, async, modules, modern JS patterns |
| `rust-engineer` | Rust ownership, traits, async, Tokio |
| `rust-systems` | Systems programming, FFI, unsafe, zero-copy |
| `golang-pro` | Concurrent Go, interfaces, testing |
| `golang-idioms` | Idiomatic Go patterns, error handling |
| `cpp-pro` | C++20/23, templates, RAII, performance |
| `java-architect` | Spring Boot 3.x, JPA, enterprise Java |
| `kotlin-specialist` | Kotlin coroutines, multiplatform, Ktor |
| `swift-expert` | SwiftUI, iOS/macOS/watchOS, Combine |
| `php-pro` | PHP 8.3+, Laravel, Symfony |
| `csharp-developer` | .NET 8, ASP.NET Core, Blazor, EF Core |

### Domain: Frontend Frameworks

| Skill | Invoke when user wants to… |
|---|---|
| `react-expert` | React 18+, hooks, RSC, Suspense, React 19 |
| `react-patterns` | Server Components, Actions, advanced hooks |
| `react-native-expert` | React Native cross-platform mobile |
| `nextjs-developer` | Next.js 14+ App Router, ISR, middleware |
| `nextjs-mastery` | Advanced Next.js: RSC, parallel routes, edge |
| `angular-architect` | Angular 17+ standalone, signals, NgRx |
| `vue-expert` | Vue 3 Composition API, Nuxt 3, SSR/SSG |
| `vue-expert-js` | Vue 3 + vanilla JS composables, Vite |
| `flutter-expert` | Flutter 3+, Dart, state management |
| `mobile-development` | React Native + Flutter navigation, offline |
| `frontend-excellence` | RSC patterns, Core Web Vitals, perf |

### Domain: Backend Frameworks

| Skill | Invoke when user wants to… |
|---|---|
| `fastapi-expert` | FastAPI, Pydantic v2, async Python APIs |
| `django-expert` | Django + DRF, ORM, async views |
| `django-patterns` | Django architecture, signals, middleware |
| `rails-expert` | Rails 7+, Hotwire, ActiveRecord, Turbo |
| `nestjs-expert` | NestJS modules, guards, interceptors |
| `spring-boot-engineer` | Spring Boot 3.x, REST, JPA, security |
| `springboot-patterns` | Spring layered architecture, DI patterns |
| `laravel-specialist` | Laravel 10+, Eloquent, Livewire |
| `wordpress-pro` | Themes, Gutenberg blocks, WooCommerce |
| `shopify-expert` | Liquid themes, Shopify APIs, custom apps |
| `salesforce-developer` | Apex, LWC, SOQL, Salesforce integration |

### Domain: Infrastructure & DevOps

| Skill | Invoke when user wants to… |
|---|---|
| `devops-engineer` | Dockerfiles, CI/CD, Kubernetes manifests |
| `devops-automation` | GitHub Actions, GitOps, Helm, deployment |
| `docker-best-practices` | Multi-stage builds, compose, image optimization |
| `kubernetes-specialist` | K8s deployments, services, Helm charts |
| `kubernetes-operations` | Operators, troubleshooting, cluster ops |
| `terraform-engineer` | IaC across AWS/Azure/GCP, modules, state |
| `aws-cloud-patterns` | Lambda, ECS, S3, DynamoDB, CDK |
| `cloud-architect` | Multi-cloud architecture, migration plans |
| `ci-cd-pipelines` | Pipeline design, test strategies, deployments |
| `embedded-systems` | Microcontroller firmware, RTOS, C/Rust |

### Domain: Data, AI & ML

| Skill | Invoke when user wants to… |
|---|---|
| `data-engineering` | ETL pipelines, data warehousing, Spark |
| `spark-engineer` | Spark jobs, performance, cluster config |
| `pandas-pro` | DataFrame operations, data analysis |
| `sql-pro` | Query optimization, schema design |
| `postgres-pro` | PostgreSQL replication, indexing, vacuum |
| `postgres-optimization` | Query plans, partitioning, JSONB |
| `database-optimization` | Cross-DB query tuning, index strategies |
| `database-optimizer` | PostgreSQL + MySQL performance analysis |
| `redis-patterns` | Caching strategies, pub/sub, streams |
| `ml-pipeline` | Production ML infrastructure, training |
| `rag-architect` | RAG systems, chunking, vector search |
| `fine-tuning-expert` | LLM fine-tuning, custom model training |
| `llm-integration` | LLM API usage, streaming, function calling |
| `prompt-engineer` | Prompt writing, evaluation, optimization |
| `prompt-engineering` | Chain-of-thought, few-shot, structured prompts |

### Domain: Architecture & System Design

| Skill | Invoke when user wants to… |
|---|---|
| `architecture-designer` | High-level system design, ADRs, diagrams |
| `microservices-architect` | Distributed systems, bounded contexts, saga |
| `microservices-design` | Service mesh, event-driven patterns |
| `api-designer` | REST/GraphQL API design, OpenAPI specs |
| `api-design-patterns` | Pagination, versioning, resource naming |
| `graphql-architect` | GraphQL schemas, Federation, DataLoader |
| `graphql-design` | Resolver patterns, subscriptions, N+1 |
| `websocket-engineer` | WebSocket implementation, Socket.IO |
| `websocket-realtime` | Real-time patterns, SSE, pub/sub |
| `legacy-modernizer` | Migration strategies, strangler fig, risk |

### Domain: Security

| Skill | Invoke when user wants to… |
|---|---|
| `security-reviewer` | Vulnerability audit, SAST, severity report |
| `security-hardening` | Input validation, auth, headers, secrets |
| `secure-code-guardian` | Auth/authz implementation, input security |
| `authentication-patterns` | OAuth2, JWT, RBAC, session management |
| `fullstack-guardian` | Security-focused full-stack applications |

### Domain: Quality & Testing

| Skill | Invoke when user wants to… |
|---|---|
| `code-reviewer` | PR review, code quality, bug detection |
| `test-master` | Test generation, mocking, coverage analysis |
| `testing-strategies` | Contract, snapshot, mutation testing |
| `tdd-mastery` | Red-Green-Refactor TDD workflow |
| `debugging-wizard` | Error parsing, stack trace analysis |
| `chaos-engineer` | Failure injection, resilience experiments |
| `playwright-expert` | E2E tests, test infrastructure, CI |
| `playwright-skill` | Browser automation, dev server testing |
| `the-fool` | Devil's advocate, pre-mortem, red team |

### Domain: Observability & SRE

| Skill | Invoke when user wants to… |
|---|---|
| `monitoring-expert` | Monitoring setup, structured logging, alerts |
| `monitoring-observability` | OpenTelemetry, Prometheus, Grafana |
| `sre-engineer` | SLOs, error budgets, incident response |

### Domain: Agents & MCP

| Skill | Invoke when user wants to… |
|---|---|
| `mcp-developer` | Build/debug MCP servers and clients |
| `mcp-development` | MCP tool design, resource endpoints |
| `engineering` | 25 advanced agent engineering skills |
| `engineering-team` | 23 team-scale engineering skills |

### Domain: Developer Experience

| Skill | Invoke when user wants to… |
|---|---|
| `git-advanced` | Worktrees, bisect, interactive rebase, hooks |
| `cli-developer` | CLI tools, argument parsing, terminal UX |
| `code-documenter` | Docstrings, API docs, README generation |
| `spec-miner` | Reverse-engineer specs from existing code |
| `feature-forge` | Requirements workshops, user stories |
| `continuous-learning` | Pattern extraction, correction tracking |
| `teach-impeccable` | One-time design context setup for project |
| `atlassian-mcp` | Jira/Confluence integration |

### Domain: Business & Domain Expertise

| Skill | Invoke when user wants to… |
|---|---|
| `business-growth` | Growth strategies, market analysis |
| `c-level-advisor` | Executive advisory, strategic decisions |
| `marketing-skill` | 42 marketing agent skills |
| `product-team` | Product management, roadmaps, PRDs |
| `project-management` | Sprint planning, agile ceremonies |
| `finance` | Financial analysis, modeling |
| `ra-qm-team` | Regulatory and QM compliance |
| `game-developer` | Game systems, Unity/Unreal, mechanics |

---

## Part 4 — The 6-Phase Audit Workflow

Execute all 6 phases when mode is `audit` or `scan`.

### Phase 1 — Scan
Locate all agent and skill definition files:
- `~/.claude/agents/` (global agents)
- `.claude/agents/` (project agents)
- `~/.claude/skills/*/SKILL.md` (installed skills)

List every file with line count and modified date.

### Phase 2 — Extract
For each agent file, pull every instruction, rule, and behavioral directive.
Group by: identity statements · behavioral constraints · procedural steps · tool references · output conventions.

### Phase 3 — Classify
Apply both tests to every extracted item. Produce a per-agent report:
```
Agent: <filename>
────────────────────────────────────────────────
DNA (embed permanently):
  ✓ "You are a world class backend engineer"
  ✓ "Never expose stack traces to users"
  ✓ Clean Architecture: dependencies always point inward

Tech Skills (extract → reference):
  → code-reviewer     : "review this PR for issues"
  → security-reviewer : "check for vulnerabilities"
  → rust-engineer     : "write idiomatic Rust"
  → fastapi-expert    : "build FastAPI endpoints"

Missing DNA strands (gaps):
  ✗ Writing Quality      — no output quality rules found
  ✗ Session Hygiene      — no context capture rules found
  ✗ Completion Discipline — no test-before-finalize rule

Ambiguous (flag for review):
  ? "Use the best approach for the situation"
```

### Phase 4 — Research (requires EXA MCP)
For each DNA gap, query EXA for current best practices.
Pattern: `"[domain] [strand] best practices [current year]"`
Extract concrete directives — not summaries. Append to the DNA proposal.

### Phase 5 — Report
Present full classification tables. No changes applied yet.
Show: DNA items confirmed · Tech skills with matched registry name · Missing strands · Confidence per item.
**Wait for confirmation before Phase 6.**

### Phase 6 — Apply
After confirmation, per file:
1. Add `## AGENT DNA` block at top with all confirmed DNA
2. Embed relevant behavioral strands (from the 18 below) for this agent's domain
3. Replace inline capability prose with `→ invoke: <skill-name>` references
4. Show unified diff. Write only after per-file approval.

---

## Part 4b — Non-Audit Modes

### Mode: `route` (default)
1. Apply Stack Swap Test + Role Identity Test to the instruction
2. DNA → embed under `## AGENT DNA`
3. Skill → find in registry below → invoke
4. Ambiguous → state classification rationale, ask

### Mode: `classify`
Single instruction → instant output:
```
Input     : <instruction>
Stack Swap: SURVIVES | DOES NOT SURVIVE
Role Test : WHO (DNA) | WHAT (Skill)
Decision  : embed in agent | invoke <skill-name>
Rationale : <one sentence>
```

### Mode: `embed-dna`
1. Add DNA block + relevant strands at top of named agent file
2. Replace inline capabilities with skill invocation references
3. Show unified diff, confirm before writing

---

## Part 5 — Routing Decision Tree

```
User message received
        │
        ▼
Is this a task request?
   │              │
  YES             NO → Apply DNA, respond in character
   │
   ▼
Match against Skill Registry domains:
   UI/Visual → frontend-design, ui-ux-pro-max, design-system...
   Design ops → adapt, animate, audit, bolder, clarify...
   Language   → python-pro, rust-engineer, typescript-pro...
   Framework  → react-expert, fastapi-expert, rails-expert...
   Infra      → devops-engineer, kubernetes-specialist...
   Data/AI    → rag-architect, ml-pipeline, postgres-pro...
   Security   → security-reviewer, secure-code-guardian...
   Quality    → code-reviewer, test-master, tdd-mastery...
   SRE        → sre-engineer, monitoring-expert...
   Agents/MCP → mcp-developer, engineering...
        │
        ▼
Invoke matched skill
        │
        ▼
Execute with agent DNA active as background context
```

---

## Part 6 — DNA Classification Quick Reference

### Always DNA (never a skill)
- Role/identity statements ("You are…", "Act as…")
- Behavioral absolutes ("Never…", "Always…", "Must…")
- Tone and communication style
- Decision-making principles
- Output format defaults
- Security and safety constraints
- Domain knowledge declarations

### Always a Skill (never DNA)
- Step-by-step procedures
- Domain-specific output generation
- Tool sequences (run tests, generate code, lint)
- Analysis tasks with a defined output format
- Anything that begins "when asked to… do this:"

### Ambiguous — apply both tests
- Best practices ("prefer X over Y") — usually DNA
- Standards compliance ("follow PEP 8") — usually DNA
- "Know how to X" — borderline: if it's a major capability, make it a skill reference

---

## Part 7 — Self-Application

This skill is itself an example of correct DNA/Skill separation:

**DNA embedded here:**
- Classification methodology (Stack Swap + Role Identity tests)
- Decision principles (show diff before overwriting, always confirm)
- The routing decision tree

**Skills it routes to:**
- Every skill in the registry above — this file is the index
- It does not implement those skills; it invokes them by name

**Global DNA layer beneath everything:**
- `rules/worldclass-dna.md` is always active — it is not invoked, it is inherited
- It sets the quality floor for every skill execution
- Agent-specific DNA only needs to capture what is unique to that agent
- The world-class self-calibration protocol runs automatically on every domain switch

The stack from bottom to top:
```
rules/worldclass-dna.md          ← always on, never invoked, sets quality floor
        │
agent-dna-classifier             ← classifies, routes, embeds agent-specific DNA
        │
<specific skill>                 ← executes the procedure at world-class standard
```
