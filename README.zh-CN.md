<div align="center">

🌐 [繁體中文](./README.md) | [English](./README.en.md) | **简体中文** | [Tiếng Việt](./README.vi.md)

# Vibe-SDLC

**AI-Driven Software Development Lifecycle for Claude Code**

让 AI 从「能写代码」升级为「能跑完整个软件开发流程」

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![GitHub CLI](https://img.shields.io/badge/GitHub_CLI-Required-orange)](https://cli.github.com/)

[快速开始](#-快速开始) · [流程总览](#-五个开发阶段) · [安装方式](#-安装方式) · [使用示例](./skills/README.md) · [完整 SOP](./Vibe-SDLC.md)

</div>

---

## 什么是 Vibe-SDLC？

Vibe-SDLC 是一套封装为 **Claude Code Slash Commands** 的完整软件开发流程。它将需求分析、规格撰写、任务拆解、开发测试到部署交付的每个环节标准化，让 AI 助手能依照明确的 SOP 自主执行，同时确保人类始终掌握决策权。

> **核心理念：人类决策、AI 执行、GitHub 管控**

| 原则 | 说明 |
|------|------|
| **规格即真相** | 所有开发工作以 `/docs` 中的规格文件为唯一真相来源 |
| **阶段不跳过** | 每个阶段有明确的前置条件与完成条件，未达成不得进入下一阶段 |
| **版本化管理** | 对规格文件的任何修改都必须同步更新版本号、日期与修订说明表格 |
| **即时同步** | 开发中的临时需求、Bug 修正或规格变更，应即时回溯更新规格文件 |

---

## 🚀 快速开始

### 1. 安装

```bash
git clone https://github.com/anthropics/vibe-sdlc.git
cd vibe-sdlc
./install.sh global    # 全局安装，所有项目均可使用
```

### 2. 启动

在你的项目目录中打开 [Claude Code](https://docs.anthropic.com/en/docs/claude-code)，输入：

```
/vibe-sdlc
```

AI 会自动检测项目状态、生成进度仪表盘，并建议下一步操作。

### 3. 开始开发

```
/vibe-sdlc-p1-spec       ← 撰写规格文件（PRD、SRD、API Spec、Dev Plan）
/vibe-sdlc-p2-issues     ← 将计划转为 GitHub Issues
/vibe-sdlc-p3-dev        ← 领取 Issue → 开发 → 测试 → 自动建 PR
/vibe-sdlc-p4-pr         ← 监控 CI → 修正失败 → Merge 后更新进度
/vibe-sdlc-p5-release    ← 里程碑验收 → 收集反馈 → 启动下一轮迭代
```

<details>
<summary><b>💡 从想法到第一个 PR，只需 3 句 prompt</b></summary>

```
你：/vibe-sdlc-p1-spec
    我要做一个个人记账App，请与我讨论并帮我撰写 PRD。
    ...（AI 协助完成所有规格文件）

你：/vibe-sdlc-p2-issues
    规格定稿了，请创建 GitHub Issues。

你：/vibe-sdlc-p3-dev
    请处理 Issue #1。
    ...（AI 自动完成开发、测试、创建 PR）
```

</details>

### 前置需求

| 工具 | 用途 | 安装 |
|------|------|------|
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | AI 开发助手 CLI | `npm install -g @anthropic-ai/claude-code` |
| [GitHub CLI (`gh`)](https://cli.github.com/) | Issues / PR / Project 操作 | `brew install gh && gh auth login` |
| Git | 版本管控 | 内置 |

---

## 📋 五个开发阶段

```
项目启动
  └→ P1: 定义规格         撰写 PRD / SRD / API Spec / Dev Plan → 交叉审查 → 定稿
      └→ P2: 任务挂载       将 Dev Plan 转为 GitHub Issues + Project 看板
          └→ P3: 开发循环       领取 Issue → 实现 → 测试 → Vibe Check → 自动建 PR
              └→ P4: CI 与合并     监控 CI → 修正失败 → Merge → 更新 Dev Plan
                  └→ P3: ...          领取下一个 Issue（重复 P3↔P4）
                      └→ P5: 交付迭代     里程碑完成 → 部署验收 → 反馈 → 回到 P2
```

| Phase | 名称 | Slash Command | 说明 |
|:-----:|------|---------------|------|
| — | 进度仪表盘 | `/vibe-sdlc` | 自动检测项目状态、生成仪表盘、导航至对应 Phase |
| 1 | 定义规格文件与计划 | `/vibe-sdlc-p1-spec` | 撰写 / 审查 PRD、SRD、API Spec、UI/UX、Dev Plan、CI/CD Spec |
| 2 | 任务挂载 | `/vibe-sdlc-p2-issues` | 创建 Labels / Milestones → 开发 Issues → 验证 Issues → Project 看板 |
| 3 | 开发循环 | `/vibe-sdlc-p3-dev` | 领取 Issue → 实现 → 测试 → Vibe Check → 自动建 PR |
| 4 | CI 监控与合并后作业 | `/vibe-sdlc-p4-pr` | 监控 CI → 修正失败 → Merge → 更新 Dev Plan → 验证提醒 |
| 5 | 交付与迭代 | `/vibe-sdlc-p5-release` | 部署验收 → 收集反馈 → 更新规格 → 启动下一轮迭代 |

---

## ✨ 主要特性

### 📄 规格文件体系

所有规格文件存放在 `/docs`，是开发的唯一真相来源（Single Source of Truth）：

| 文件 | 路径 | 说明 |
|------|------|------|
| PRD | `/docs/01-1-PRD.md` | 产品需求、用户故事、功能清单 |
| SRD | `/docs/01-2-SRD.md` | 技术栈、系统架构、安全与性能要求 |
| API Spec | `/docs/01-3-API_Spec.md` + `API_Spec.yaml` | API 端点说明 + OpenAPI 合约 |
| UI/UX 设计 | `/docs/01-4-UI_UX_Design.md` | 视觉与交互设计规格（如适用） |
| Dev Plan | `/docs/02-Dev_Plan.md` | 里程碑、任务清单、角色分工、Git 协作策略 |
| 审查报告 | `/docs/03-Docs_Review_Report.md` | AI 交叉比对结果，含不一致与遗漏项目 |
| CI/CD 规格 | `/docs/04-CI_CD_Spec.md` | CI Workflow、质量闸门、Docker 配置（可选） |

> 📁 完整示例见 [`skills/vibe-sdlc-p1-spec/examples/docs/`](./skills/vibe-sdlc-p1-spec/examples/docs/)

### 💬 Issue 状态追踪

Issue 是跨 session 的唯一沟通媒介，AI 在关键时刻自动发布 Comment：

| 时机 | Comment |
|------|---------|
| 领取任务 | 🚀 **任务领取** — 角色、分支、worktree |
| 遇到阻塞 | 📋 **进度更新** — 阻塞原因 |
| Vibe Check 通过 | ✅ **Vibe Check 通过** — 自动建 PR 并回报链接 |
| PR 合并后 | 🎉 **任务完成** — 更新 Dev Plan、列出待验证 Issues |

### 🤖 Multi Sub Agent 并行开发

原生支持多 Sub Agent 高度并行开发，以 `API_Spec.yaml` 作为前后端解耦合约：

- **Worktree 隔离** — 每个 Sub Agent 使用独立 Git Worktree
- **分支命名** — `feat/<agent>/<issue-N>-<简述>`
- **双层 PR 审查** — Sub Agent PR → CI → A-Main 初审 → H-Director 终审
- **PR 范围限制** — A-Backend 只能修改 `/backend/**`，违者驳回

### 🛡️ 安全检查机制

- **追加 Commit 安全检查** — 推送前确认 PR 仍为 OPEN，避免 push 至已合并的分支
- **既有测试失败处理** — AI 自动归因（flaky / 既有 bug / 本次导致）再决定处理方式
- **自主排查原则** — 遇到问题优先自行调查与解决，无法解决时才上报开发者

---

## 👥 核心角色

| 类别 | 代号 | 名称 | 职责 |
|:----:|------|------|------|
| 🧑 人类 | `H-Director` | 导演 | 最高决策、规格审查、Milestone 验收、PR 合并 |
| 🧑 人类 | `H-Reviewer` | 审查员 | 特定领域审查（UX / 安全），可由 Director 兼任 |
| 🤖 AI | `A-Main` | 主代理 | 统筹任务、协调 Sub Agents、整合验证 |
| 🤖 AI | `A-Backend` | 后端子代理 | 专注 `/backend/**`：API、DB、ORM |
| 🤖 AI | `A-Frontend` | 前端子代理 | 专注 `/frontend/**`：UI、状态管理、API Client |
| 🤖 AI | `A-QA` | 测试子代理 | 专注 `/tests/**`：E2E 测试、覆盖率 |
| 🤖 AI | `A-DevOps` | 部署子代理 | 专注 CI/CD、Docker、监控配置 |

---

## 📦 安装方式

### 一键安装（推荐）

```bash
./install.sh                               # 交互式选择
./install.sh global                        # 全局安装
./install.sh project /path/to/my-project   # 安装至指定项目
./install.sh shared  /path/to/my-project   # 安装至指定项目并提交 Git
```

<details>
<summary>手动安装</summary>

```bash
# 全局安装（所有项目可用）
cp -r skills/vibe-sdlc* ~/.claude/skills/
cp -r skills/local-tunnel ~/.claude/skills/

# 项目级安装（仅限特定项目）
mkdir -p /path/to/my-project/.claude/skills
cp -r skills/vibe-sdlc* /path/to/my-project/.claude/skills/
cp -r skills/local-tunnel /path/to/my-project/.claude/skills/
```

</details>

安装后输入 `/vibe-sdlc` 验证，看到进度仪表盘即成功。

---

## 🗂️ 目录结构

```
Vibe-SDLC/
├── README.md                          ← 本说明文件（繁体中文）
├── README.zh-CN.md                    ← 简体中文版
├── README.en.md                       ← English version
├── CLAUDE.md                          ← Claude Code 项目指引
├── Vibe-SDLC.md                       ← 完整 SOP 规范文件（v8.1）
├── install.sh                         ← 一键安装脚本
└── skills/                            ← Skills 发布资源
    ├── README.md                      ← Skills 详细说明与使用示例
    ├── DEPLOY.md                      ← 部署方式详细说明
    ├── local-tunnel/skill.md          ← 发布本地服务至公网
    ├── vibe-sdlc/skill.md             ← 总览与导航
    ├── vibe-sdlc-p1-spec/             ← Phase 1 + examples/docs/（规格文件示例）
    ├── vibe-sdlc-p2-issues/skill.md   ← Phase 2：任务挂载
    ├── vibe-sdlc-p3-dev/skill.md      ← Phase 3：开发循环
    ├── vibe-sdlc-p4-pr/skill.md       ← Phase 4：CI 监控与合并后作业
    └── vibe-sdlc-p5-release/skill.md  ← Phase 5：交付与迭代
```

---

## 📚 相关文件

| 文件 | 说明 |
|------|------|
| [`Vibe-SDLC.md`](./Vibe-SDLC.md) | 完整 SOP 规范文件（v8.1），包含所有流程细节 |
| [`skills/README.md`](./skills/README.md) | Skills 详细说明、各 Phase 职责与使用示例 |
| [`skills/DEPLOY.md`](./skills/DEPLOY.md) | 部署方式详细说明 |
| [`skills/vibe-sdlc-p1-spec/examples/docs/`](./skills/vibe-sdlc-p1-spec/examples/docs/) | 规格文件完整示例 |

---

## 📄 License

[MIT](LICENSE)
