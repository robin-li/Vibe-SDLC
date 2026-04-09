<div align="center">

🌐 [繁體中文](./README.md) | **English** | [简体中文](./README.zh-CN.md) | [Tiếng Việt](./README.vi.md)

# Vibe-SDLC

**AI-Driven Software Development Lifecycle for Claude Code**

Upgrade AI from "can write code" to "can run an entire software development lifecycle"

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![GitHub CLI](https://img.shields.io/badge/GitHub_CLI-Required-orange)](https://cli.github.com/)

[Quick Start](#-quick-start) · [Workflow](#-five-development-phases) · [Installation](#-installation) · [Examples](#-usage-examples) · [Full SOP](./Vibe-SDLC.md)

</div>

---

## What is Vibe-SDLC?

Vibe-SDLC is a complete software development lifecycle packaged as **Claude Code Slash Commands**. It standardizes every stage — from requirements analysis, spec writing, task breakdown, development & testing, to deployment & delivery — enabling the AI assistant to execute autonomously following a clear SOP, while ensuring humans always retain decision-making authority.

> **Core Philosophy: Humans Decide, AI Executes, GitHub Governs**

| Principle | Description |
|-----------|-------------|
| **Specs as Truth** | All development work uses spec files in `/docs` as the single source of truth |
| **No Skipping Phases** | Each phase has clear preconditions and completion criteria — must be met before proceeding |
| **Version-Controlled Specs** | Any spec modification must update version number, date, and revision notes |
| **Real-Time Sync** | Ad-hoc requirements, bug fixes, or spec changes during development must be reflected in specs immediately |
| **Real-Time Triage** | When developers report bugs/requests directly, AI asks how to handle (fix now / create Issue / defer) before acting |

---

## 🚀 Quick Start

### 1. Install

```bash
git clone https://github.com/anthropics/vibe-sdlc.git
cd vibe-sdlc
./install.sh global    # Global install — available for all projects
```

### 2. Launch

Open [Claude Code](https://docs.anthropic.com/en/docs/claude-code) in your project directory and type:

```
/vibe-sdlc
```

The AI will automatically detect project status, generate a progress dashboard, and suggest the next step.

> **💡 Empty folders work out of the box**: If the working directory is a brand-new empty folder, `/vibe-sdlc-spec` enters an interactive Bootstrap flow that helps you set up `git init`, `CLAUDE.md`, `.gitignore`, `README.md`, `/docs` scaffolding, and the persistent `dev/main-agent` branch in one go — no manual pre-initialization required.

### 3. Start Building

```
/vibe-sdlc-spec       ← Write spec documents (PRD, SRD, API Spec, Dev Plan)
/vibe-sdlc-issues     ← Convert plan into GitHub Issues
/vibe-sdlc-dev        ← Pick up Issue → develop → test → auto-create PR
/vibe-sdlc-pr         ← Monitor CI → fix failures → merge → update progress
/vibe-sdlc-release    ← Milestone acceptance → collect feedback → next iteration
/vibe-sdlc-status     ← Query Agent status → Consolidate STATUS.md
```

<details>
<summary><b>💡 From idea to first PR in just 3 prompts</b></summary>

```
You: /vibe-sdlc-spec
     I want to build a personal finance app. Let's discuss and write the PRD.
     ...(AI helps complete all spec documents)

You: /vibe-sdlc-issues
     Specs are finalized, please create GitHub Issues.

You: /vibe-sdlc-dev
     Please work on Issue #1.
     ...(AI auto-completes development, testing, and creates a PR)
```

</details>

### Prerequisites

| Tool | Purpose | Install |
|------|---------|---------|
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | AI development assistant CLI | `npm install -g @anthropic-ai/claude-code` |
| [GitHub CLI (`gh`)](https://cli.github.com/) | Issues / PR / Project operations | `brew install gh && gh auth login` |
| Git | Version control | Built-in |

---

## 📋 Five Development Phases

```
Project Start
  └→ P1: Define Specs        Write PRD / SRD / API Spec / Dev Plan → cross-review → finalize
      └→ P2: Mount Tasks       Convert Dev Plan to GitHub Issues + Project board
          └→ P3: Dev Loop         Pick Issue → implement → test → Vibe Check → auto-create PR
              └→ P4: CI & Merge     Monitor CI → fix failures → merge → update Dev Plan
                  └→ P3: ...          Pick next Issue (repeat P3↔P4)
                      └→ P5: Release      Milestone done → deploy → feedback → back to P2
```

| Phase | Name | Slash Command | Description |
|:-----:|------|---------------|-------------|
| — | Dashboard | `/vibe-sdlc` | Auto-detect project status, generate dashboard, navigate to relevant phase |
| 1 | Define Specs & Plan | `/vibe-sdlc-spec` | Write / review PRD, SRD, API Spec, UI/UX, Dev Plan, CI/CD Spec |
| 2 | Mount Tasks | `/vibe-sdlc-issues` | Create Labels / Milestones → dev Issues → verification Issues → Project board |
| 3 | Development Loop | `/vibe-sdlc-dev` | Pick Issue → implement → test → Vibe Check → auto-create PR |
| 4 | CI Monitor & Post-Merge | `/vibe-sdlc-pr` | Monitor CI → fix failures → merge → update Dev Plan → verification reminder |
| 5 | Release & Iterate | `/vibe-sdlc-release` | Deploy → acceptance → collect feedback → update specs → next iteration |
| — | Agent Status Query | `/vibe-sdlc-status` | Query Agent working status → Consolidate STATUS.md → Alert on anomalies |

---

## ✨ Key Features

### 📄 Spec Document System

All spec files are stored in `/docs` as the Single Source of Truth:

| Document | Path | Description |
|----------|------|-------------|
| Docs Index | `/docs/00-Docs_Index.md` | Entry point and navigation: lists all spec documents, creation timing, dependencies |
| PRD | `/docs/01-1-PRD.md` | Product requirements, user stories, feature list |
| SRD | `/docs/01-2-SRD.md` | Non-functional requirements, deployment, security & performance constraints |
| SDD | `/docs/01-3-SDD.md` | System architecture, component design, data model, Architecture Decision Records (ADR) |
| GDD | `/docs/01-4-GDD.md` | Game Design Document: core mechanics, balancing, level design (domain-specific) |
| API Spec | `/docs/01-5-API_Spec.md` + `API_Spec.yaml` | API endpoint docs + OpenAPI contract |
| UI/UX Design | `/docs/01-6-UI_UX_Design.md` + `/docs/ui/*.html` | Visual and interaction design specs (optional) + HTML + Tailwind wireframe references; follows the [UI_UX_Writing_Guidelines](./skills/vibe-sdlc-spec/references/UI_UX_Writing_Guidelines.md) 9 principles |
| Dev Plan | `/docs/02-Dev_Plan.md` | Milestones, task breakdown, roles, Git collaboration strategy |
| Review Report | `/docs/03-Docs_Review_Report.md` | AI cross-reference results with inconsistencies and gaps |
| CI/CD Spec | `/docs/04-CI_CD_Spec.md` | CI Workflow, quality gates, Docker config (optional) |

> 📁 Full examples at [`skills/vibe-sdlc-spec/examples/docs/`](./skills/vibe-sdlc-spec/examples/docs/)

### 💬 Issue Status Tracking

Issues serve as the sole cross-session communication channel. AI auto-posts comments at key moments:

| Trigger | Comment |
|---------|---------|
| Task claimed | 🚀 **Task Claimed** — role, branch, worktree |
| Blocked | 📋 **Progress Update** — blocker reason |
| Vibe Check passed | ✅ **Vibe Check Passed** — auto-create PR with link |
| PR merged | 🎉 **Task Complete** — Dev Plan updated, pending verification Issues listed |

### 📊 STATUS.md Aggregation & Version Control

Each Agent maintains its own status file (`/docs/status/A-*.md`), while A-Main aggregates them into a global `STATUS.md`. Every project **must** choose one of three version control modes and declare it in `CLAUDE.md`:

| Mode | When to use |
|------|-------------|
| **A: Full version control** | Multi-person collaboration, full history traceability |
| **B: Fully ignored** | Single-user single-machine, STATUS as local snapshot only |
| **C: Hybrid** (recommended default) | Single-user multi-machine, only `STATUS.md` versioned |

> See [Vibe-SDLC.md §9.4](./Vibe-SDLC.md#94-statusmd-版控策略). If not declared, A-Main will proactively ask and help configure on first `/vibe-sdlc-status` call.

### 🤖 Multi Sub Agent Parallel Development

Native support for highly parallel multi-agent development, using `API_Spec.yaml` as the frontend-backend decoupling contract:

- **Worktree Isolation** — each Sub Agent uses an independent Git Worktree
- **Branch Strategy** — ⛔ Direct push to main is strictly prohibited. With Issue → `feat/<agent>/<issue-N>-<description>`; No Issue (small fix) → `dev/main-agent`
- **Two-Layer PR Review** — Sub Agent PR → CI → A-Main review → H-Director final review
- **PR Scope Restriction** — A-Backend can only modify `/backend/**`, violations are rejected

### 🛡️ Safety Mechanisms

- **Commit Push Safety Check** — verify PR is still OPEN before pushing, prevent pushes to merged branches
- **Legacy Test Failure Handling** — AI auto-attributes failures (flaky / existing bug / caused by current changes) before deciding action
- **Self-Resolution First** — investigate and resolve issues independently, only escalate when stuck

---

## 👥 Core Roles

| Type | Code | Name | Responsibility |
|:----:|------|------|----------------|
| 🧑 Human | `H-Director` | Director | Final decisions, spec review, milestone acceptance, PR merge |
| 🧑 Human | `H-Reviewer` | Reviewer | Domain-specific review (UX / security), can be filled by Director |
| 🤖 AI | `A-Main` | Main Agent | Task coordination, Sub Agent orchestration, integration verification |
| 🤖 AI | `A-Backend` | Backend Agent | Focus on `/backend/**`: API, DB, ORM |
| 🤖 AI | `A-Frontend` | Frontend Agent | Focus on `/frontend/**`: UI, state management, API Client |
| 🤖 AI | `A-QA` | QA Agent | Focus on `/tests/**`: E2E testing, coverage |
| 🤖 AI | `A-DevOps` | DevOps Agent | Focus on CI/CD, Docker, monitoring config |

---

## 📦 Installation

### One-Click Install (Recommended)

```bash
./install.sh                               # Interactive mode
./install.sh global                        # Global install
./install.sh project /path/to/my-project   # Install to specific project
./install.sh shared  /path/to/my-project   # Install to project and commit to Git
```

<details>
<summary>Manual Install</summary>

```bash
# Global install (available for all projects)
cp -r skills/vibe-sdlc* ~/.claude/skills/
cp -r skills/local-tunnel ~/.claude/skills/

# Project-level install (specific project only)
mkdir -p /path/to/my-project/.claude/skills
cp -r skills/vibe-sdlc* /path/to/my-project/.claude/skills/
cp -r skills/local-tunnel /path/to/my-project/.claude/skills/
```

</details>

After installation, type `/vibe-sdlc` to verify — you should see the progress dashboard.

---

## 💡 Usage Examples

The following scenarios show how developers (directors) interact with the AI assistant at each phase.

### Scenario 1: Check Project Progress — Dashboard

```
> /vibe-sdlc
```

The AI will automatically collect GitHub Issues, PR, CI status data and generate a **progress dashboard**, including:
- Milestone completion progress (progress bar + percentage)
- Pending PRs and CI status
- In-progress Issues and pending verification Issues
- Recently merged PRs
- Current Phase detection with specific recommendations

Great for daily stand-ups or when unsure what to do next.

---

### Scenario 2: Phase 1 — Writing Spec Documents

**Start writing a PRD from scratch:**

```
> /vibe-sdlc-spec
> I want to build a Todo List API with CRUD operations. Users need to log in to access their own todos.
> Please help me write the PRD.
```

**Already have specs, request cross-review:**

```
> /vibe-sdlc-spec
> I've placed the PRD, SRD, API Spec, and Dev Plan in /docs. Please perform a cross-reference review.
```

**Fix issues from review report:**

```
> Review report item #3 says SRD is missing rate limiting specs. Please add it —
> limit to 60 requests per user per minute.
```

---

### Scenario 3: Phase 2 — Creating GitHub Issues

**Review Dev Plan and create Issues (after review report passes):**

```
> /vibe-sdlc-issues
> Specs are finalized and the review report confirms no issues. Please create GitHub Issues.
```

**Only create Issues for a specific milestone:**

```
> /vibe-sdlc-issues
> Just create Milestone 1 Issues for now. We'll handle M2+ after M1 is done.
```

---

### Scenario 4: Phase 3 — Daily Development Loop

**Assign an Issue to AI for development:**

```
> /vibe-sdlc-dev
> Please work on Issue #5 — implement the user registration API.
```

After completing development and testing, when Vibe Check passes, the AI will **immediately push the branch and create a PR**, then report results and the PR link. Issues encountered during development are investigated and resolved independently first — only escalated when stuck. You just need to do Code Review on GitHub.

**Add requirements during AI development:**

```
> Add a test case: should return 400 Bad Request when email format is invalid.
```

**Found an issue during Code Review:**

```
> Please switch to bcrypt for password hashing instead of SHA-256. Push again after fixing.
```

---

### Scenario 5: Phase 4 — CI Monitoring & Post-Merge

**When CI fails (PR was auto-created by Phase 3):**

```
> /vibe-sdlc-pr
> CI failed. Here's the error report: [paste CI error message]
> Please analyze the cause and fix it.
```

**Update progress after merge:**

```
> PR has been merged. Please update the Dev Plan task status.
> Any more Issues on the board? If so, continue with the next one.
```

---

### Scenario 6: Phase 5 — Milestone Delivery

**Confirm milestone completion status:**

```
> /vibe-sdlc-release
> All Issues for M1 should be merged. Please verify and produce a completion report.
```

**Provide feedback and kick off the next iteration:**

```
> Staging tests are done. A few pieces of feedback:
> 1. List page needs pagination (new requirement)
> 2. Delete operation should be switched to soft delete (requirement change)
> 3. Login page copy needs improvement (defer for now)
> Please organize these and update the PRD and Dev Plan.
```

---

### Scenario 7: Reporting Bugs or New Requirements During Testing/Acceptance — Issue Collection & Triage Flow

When you **directly describe a Bug, new requirement, or improvement** during development, testing, or acceptance (e.g., "X is broken", "I want X"), AI will immediately stop, not touch any files, and present 5 handling options. This is a core Vibe-SDLC mechanism (Core Principle #6), triggered in any of Phase 3, 4, or 5.

**Scenario: Issues and new requirements found during M1 acceptance**

```
> I just tried the registration flow in staging — the password length check only enforces 6 characters, it should be at least 8.
> Also, the list page is slow to load, I want to add pagination.
```

```
📋 Issue Tracking Options
─────────────────
You reported:
  - [Bug] Password length check should be raised from 6 to 8 characters
  - [Feature] Add pagination to list page

Please choose how to handle:
  1️⃣  Small issue, fix directly (no Issue)
  2️⃣  Create Issue then fix immediately
  3️⃣  Record for now, batch-create Issues later
  4️⃣  Finish collecting, batch-create Issues, and start development
  5️⃣  Finish collecting, batch-create Issues, and wait for instructions

Select (1/2/3/4/5):
```

**Option guide**:

| Your report | Suggested option | AI behavior |
|---|:---:|---|
| Typo, copy tweak, simple config | **1** | Fix directly on `dev/main-agent` branch and create PR |
| Single Bug or single need to handle immediately | **2** | Create Issue → enter P3 → auto-create PR |
| A batch of feedback to collect first | **3** | Stash in list; batch-create when you say "organize reports" |
| Confirmed list, start working immediately | **4** | Batch-create Issues → enter P3 in priority order |
| Confirmed list, review priority first | **5** | Batch-create Issues → stop and wait |

**Option 4 example dialog (handling multiple feedback items after acceptance):**

```
> 4
> Item 1 is a P0 Bug for M1, item 2 is a new requirement for M2 backlog.
```

AI will confirm each Issue's title, labels, and milestone one by one, batch-execute `gh issue create`, then directly pick up the P0 Issue and enter the Phase 3 development loop. If reports involve PRD / API Spec changes, AI will **immediately update** the corresponding spec files and bump versions after handling (Core Principles #4, #5).

> 💡 **When it does NOT trigger**: Picking up an existing Issue via `/vibe-sdlc-dev`, pure code questions, or when you explicitly say "just fix it" / "quick fix" — AI will execute directly without asking.

---

### Scenario 8: Multi Sub Agent Parallel Development

**Have AI generate a Dev Plan with Git collaboration strategy:**

```
> /vibe-sdlc-spec
> Dev Plan should use Multi Sub Agent architecture with A-Backend, A-Frontend, A-QA, A-DevOps,
> and include Worktree configuration and two-layer PR review workflow per the spec.
```

**Sub Agent auto-creates PR after Vibe Check passes:**

```
> /vibe-sdlc-dev
> I'm A-Backend. Please work on Issue #12 — implement Auth API.
(AI completes development → Vibe Check → auto-creates PR)
```

**A-Main monitors CI and coordinates merging:**

```
> /vibe-sdlc-pr
> PR #34's CI has passed. A-Main's initial review confirms the scope is correct (only /backend/** modified).
> Please have H-Director perform the final review.
```

---

### Prompt Tips

| Tip | Description | Example |
|-----|-------------|---------|
| **Be specific** | Tell AI which Issue to work on | `Please work on Issue #12` |
| **Set constraints** | Specify tech choices or limits | `Use PostgreSQL, not SQLite` |
| **One phase at a time** | Do one phase per step | `Just review the Dev Plan, don't create Issues` |
| **Reference specs** | Point to specific sections | `See SRD section 3.2 security requirements` |
| **Provide context** | Paste error messages or screenshots | `CI error: [error message]` |
| **Batch confirm** | Approve multiple items at once | `Accept all suggestions from the review report, fix them all at once` |

---

## 🗂️ Directory Structure

```
Vibe-SDLC/
├── README.md                          ← This file (Traditional Chinese)
├── README.en.md                       ← English version
├── CLAUDE.md                          ← Claude Code project guide
├── Vibe-SDLC.md                       ← Full SOP specification (v8.8)
├── install.sh                         ← One-click install script
└── skills/                            ← Skills release resources
    ├── README.md                      ← Skills detailed docs & examples
    ├── DEPLOY.md                      ← Deployment instructions
    ├── local-tunnel/skill.md          ← Publish local services to public
    ├── vibe-sdlc/skill.md             ← Overview & navigation
    ├── vibe-sdlc-spec/             ← Phase 1 + examples/docs/
    ├── vibe-sdlc-issues/skill.md   ← Phase 2: Task mounting
    ├── vibe-sdlc-dev/skill.md      ← Phase 3: Development loop
    ├── vibe-sdlc-pr/skill.md       ← Phase 4: CI monitoring & post-merge
    ├── vibe-sdlc-release/skill.md  ← Phase 5: Release & iterate
    └── vibe-sdlc-status/skill.md  ← Agent status query & consolidation
```

---

## 📚 Related Documents

| Document | Description |
|----------|-------------|
| [`Vibe-SDLC.md`](./Vibe-SDLC.md) | Full SOP specification (v8.8) with all workflow details |
| [`skills/README.md`](./skills/README.md) | Skills detailed docs, phase responsibilities & usage examples |
| [`skills/DEPLOY.md`](./skills/DEPLOY.md) | Deployment instructions |
| [`skills/vibe-sdlc-spec/examples/docs/`](./skills/vibe-sdlc-spec/examples/docs/) | Complete spec document examples |

---

## 📄 License

[MIT](LICENSE)
