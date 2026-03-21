<div align="center">

🌐 [繁體中文](./README.md) | **English** | [简体中文](./README.zh-CN.md) | [Tiếng Việt](./README.vi.md)

# Vibe-SDLC

**AI-Driven Software Development Lifecycle for Claude Code**

Upgrade AI from "can write code" to "can run an entire software development lifecycle"

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![GitHub CLI](https://img.shields.io/badge/GitHub_CLI-Required-orange)](https://cli.github.com/)

[Quick Start](#-quick-start) · [Workflow](#-five-development-phases) · [Installation](#-installation) · [Examples](./skills/README.md) · [Full SOP](./Vibe-SDLC.md)

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

### 3. Start Building

```
/vibe-sdlc-p1-spec       ← Write spec documents (PRD, SRD, API Spec, Dev Plan)
/vibe-sdlc-p2-issues     ← Convert plan into GitHub Issues
/vibe-sdlc-p3-dev        ← Pick up Issue → develop → test → auto-create PR
/vibe-sdlc-p4-pr         ← Monitor CI → fix failures → merge → update progress
/vibe-sdlc-p5-release    ← Milestone acceptance → collect feedback → next iteration
```

<details>
<summary><b>💡 From idea to first PR in just 3 prompts</b></summary>

```
You: /vibe-sdlc-p1-spec
     I want to build a personal finance app. Let's discuss and write the PRD.
     ...(AI helps complete all spec documents)

You: /vibe-sdlc-p2-issues
     Specs are finalized, please create GitHub Issues.

You: /vibe-sdlc-p3-dev
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
| 1 | Define Specs & Plan | `/vibe-sdlc-p1-spec` | Write / review PRD, SRD, API Spec, UI/UX, Dev Plan, CI/CD Spec |
| 2 | Mount Tasks | `/vibe-sdlc-p2-issues` | Create Labels / Milestones → dev Issues → verification Issues → Project board |
| 3 | Development Loop | `/vibe-sdlc-p3-dev` | Pick Issue → implement → test → Vibe Check → auto-create PR |
| 4 | CI Monitor & Post-Merge | `/vibe-sdlc-p4-pr` | Monitor CI → fix failures → merge → update Dev Plan → verification reminder |
| 5 | Release & Iterate | `/vibe-sdlc-p5-release` | Deploy → acceptance → collect feedback → update specs → next iteration |

---

## ✨ Key Features

### 📄 Spec Document System

All spec files are stored in `/docs` as the Single Source of Truth:

| Document | Path | Description |
|----------|------|-------------|
| PRD | `/docs/01-1-PRD.md` | Product requirements, user stories, feature list |
| SRD | `/docs/01-2-SRD.md` | Tech stack, architecture, security & performance |
| API Spec | `/docs/01-3-API_Spec.md` + `API_Spec.yaml` | API endpoint docs + OpenAPI contract |
| UI/UX Design | `/docs/01-4-UI_UX_Design.md` | Visual and interaction design specs (if applicable) |
| Dev Plan | `/docs/02-Dev_Plan.md` | Milestones, task breakdown, roles, Git collaboration strategy |
| Review Report | `/docs/03-Docs_Review_Report.md` | AI cross-reference results with inconsistencies and gaps |
| CI/CD Spec | `/docs/04-CI_CD_Spec.md` | CI Workflow, quality gates, Docker config (optional) |

> 📁 Full examples at [`skills/vibe-sdlc-p1-spec/examples/docs/`](./skills/vibe-sdlc-p1-spec/examples/docs/)

### 💬 Issue Status Tracking

Issues serve as the sole cross-session communication channel. AI auto-posts comments at key moments:

| Trigger | Comment |
|---------|---------|
| Task claimed | 🚀 **Task Claimed** — role, branch, worktree |
| Blocked | 📋 **Progress Update** — blocker reason |
| Vibe Check passed | ✅ **Vibe Check Passed** — auto-create PR with link |
| PR merged | 🎉 **Task Complete** — Dev Plan updated, pending verification Issues listed |

### 🤖 Multi Sub Agent Parallel Development

Native support for highly parallel multi-agent development, using `API_Spec.yaml` as the frontend-backend decoupling contract:

- **Worktree Isolation** — each Sub Agent uses an independent Git Worktree
- **Branch Naming** — `feat/<agent>/<issue-N>-<description>`
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

## 🗂️ Directory Structure

```
Vibe-SDLC/
├── README.md                          ← This file (Traditional Chinese)
├── README.en.md                       ← English version
├── CLAUDE.md                          ← Claude Code project guide
├── Vibe-SDLC.md                       ← Full SOP specification (v8.1)
├── install.sh                         ← One-click install script
└── skills/                            ← Skills release resources
    ├── README.md                      ← Skills detailed docs & examples
    ├── DEPLOY.md                      ← Deployment instructions
    ├── local-tunnel/skill.md          ← Publish local services to public
    ├── vibe-sdlc/skill.md             ← Overview & navigation
    ├── vibe-sdlc-p1-spec/             ← Phase 1 + examples/docs/
    ├── vibe-sdlc-p2-issues/skill.md   ← Phase 2: Task mounting
    ├── vibe-sdlc-p3-dev/skill.md      ← Phase 3: Development loop
    ├── vibe-sdlc-p4-pr/skill.md       ← Phase 4: CI monitoring & post-merge
    └── vibe-sdlc-p5-release/skill.md  ← Phase 5: Release & iterate
```

---

## 📚 Related Documents

| Document | Description |
|----------|-------------|
| [`Vibe-SDLC.md`](./Vibe-SDLC.md) | Full SOP specification (v8.1) with all workflow details |
| [`skills/README.md`](./skills/README.md) | Skills detailed docs, phase responsibilities & usage examples |
| [`skills/DEPLOY.md`](./skills/DEPLOY.md) | Deployment instructions |
| [`skills/vibe-sdlc-p1-spec/examples/docs/`](./skills/vibe-sdlc-p1-spec/examples/docs/) | Complete spec document examples |

---

## 📄 License

[MIT](LICENSE)
