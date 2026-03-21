<div align="center">

🌐 **繁體中文** | [English](./README.en.md) | [简体中文](./README.zh-CN.md) | [Tiếng Việt](./README.vi.md)

# Vibe-SDLC

**AI-Driven Software Development Lifecycle for Claude Code**

讓 AI 從「能寫程式」升級為「能跑完整個軟體開發流程」

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![GitHub CLI](https://img.shields.io/badge/GitHub_CLI-Required-orange)](https://cli.github.com/)

[快速開始](#-快速開始) · [流程總覽](#-五個開發階段) · [安裝方式](#-安裝方式) · [使用範例](./skills/README.md) · [完整 SOP](./Vibe-SDLC.md)

</div>

---

## 什麼是 Vibe-SDLC？

Vibe-SDLC 是一套封裝為 **Claude Code Slash Commands** 的完整軟體開發流程。它將需求分析、規格撰寫、任務拆解、開發測試到部署交付的每個環節標準化，讓 AI 助手能依照明確的 SOP 自主執行，同時確保人類始終掌握決策權。

> **核心理念：人類決策、AI 執行、GitHub 管控**

| 原則 | 說明 |
|------|------|
| **規格即真相** | 所有開發工作以 `/docs` 中的規格文件為唯一真相來源 |
| **階段不跳過** | 每個階段有明確的前置條件與完成條件，未達成不得進入下一階段 |
| **版本化管理** | 對規格文件的任何修改都必須同步更新版本號、日期與修訂說明表格 |
| **即時同步** | 開發中的臨時需求、Bug 修正或規格變更，應即時回溯更新規格文件 |
| **即時回報分流** | 開發者直接回報 Bug / 需求時，AI 先詢問處理方式（直接修 / 建 Issue / 暫存），再依選擇執行 |

---

## 🚀 快速開始

### 1. 安裝

```bash
git clone https://github.com/anthropics/vibe-sdlc.git
cd vibe-sdlc
./install.sh global    # 全域安裝，所有專案皆可使用
```

### 2. 啟動

在你的專案目錄中開啟 [Claude Code](https://docs.anthropic.com/en/docs/claude-code)，輸入：

```
/vibe-sdlc
```

AI 會自動偵測專案狀態、產出進度儀表板，並建議下一步。

### 3. 開始開發

```
/vibe-sdlc-p1-spec       ← 撰寫規格文件（PRD、SRD、API Spec、Dev Plan）
/vibe-sdlc-p2-issues     ← 將計畫轉為 GitHub Issues
/vibe-sdlc-p3-dev        ← 領取 Issue → 開發 → 測試 → 自動建 PR
/vibe-sdlc-p4-pr         ← 監控 CI → 修正失敗 → Merge 後更新進度
/vibe-sdlc-p5-release    ← 里程碑驗收 → 收集回饋 → 啟動下一輪迭代
```

<details>
<summary><b>💡 從想法到第一個 PR，只需 3 句 prompt</b></summary>

```
你：/vibe-sdlc-p1-spec
    我要做一個個人記帳App，請與我討論並幫我撰寫 PRD。
    ...（AI 協助完成所有規格文件）

你：/vibe-sdlc-p2-issues
    規格定稿了，請建立 GitHub Issues。

你：/vibe-sdlc-p3-dev
    請處理 Issue #1。
    ...（AI 自動完成開發、測試、建立 PR）
```

</details>

### 前置需求

| 工具 | 用途 | 安裝 |
|------|------|------|
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | AI 開發助手 CLI | `npm install -g @anthropic-ai/claude-code` |
| [GitHub CLI (`gh`)](https://cli.github.com/) | Issues / PR / Project 操作 | `brew install gh && gh auth login` |
| Git | 版本管控 | 內建 |

---

## 📋 五個開發階段

```
專案啟動
  └→ P1: 定義規格         撰寫 PRD / SRD / API Spec / Dev Plan → 交叉審查 → 定稿
      └→ P2: 任務掛載       將 Dev Plan 轉為 GitHub Issues + Project 看板
          └→ P3: 開發循環       領取 Issue → 實作 → 測試 → Vibe Check → 自動建 PR
              └→ P4: CI 與合併     監控 CI → 修正失敗 → Merge → 更新 Dev Plan
                  └→ P3: ...          領取下一個 Issue（重複 P3↔P4）
                      └→ P5: 交付迭代     里程碑完成 → 部署驗收 → 回饋 → 回到 P2
```

| Phase | 名稱 | Slash Command | 說明 |
|:-----:|------|---------------|------|
| — | 進度儀表板 | `/vibe-sdlc` | 自動偵測專案狀態、產出儀表板、導航至對應 Phase |
| 1 | 定義規格文件與計畫 | `/vibe-sdlc-p1-spec` | 撰寫 / 審查 PRD、SRD、API Spec、UI/UX、Dev Plan、CI/CD Spec |
| 2 | 任務掛載 | `/vibe-sdlc-p2-issues` | 建立 Labels / Milestones → 開發 Issues → 驗證 Issues → Project 看板 |
| 3 | 開發循環 | `/vibe-sdlc-p3-dev` | 領取 Issue → 實作 → 測試 → Vibe Check → 自動建 PR |
| 4 | CI 監控與合併後作業 | `/vibe-sdlc-p4-pr` | 監控 CI → 修正失敗 → Merge → 更新 Dev Plan → 驗證提醒 |
| 5 | 交付與迭代 | `/vibe-sdlc-p5-release` | 部署驗收 → 收集回饋 → 更新規格 → 啟動下一輪迭代 |

---

## ✨ 主要特性

### 📄 規格文件體系

所有規格文件存放在 `/docs`，是開發的唯一真相來源（Single Source of Truth）：

| 文件 | 路徑 | 說明 |
|------|------|------|
| PRD | `/docs/01-1-PRD.md` | 產品需求、使用者故事、功能清單 |
| SRD | `/docs/01-2-SRD.md` | 技術棧、系統架構、安全與性能要求 |
| API Spec | `/docs/01-3-API_Spec.md` + `API_Spec.yaml` | API 端點說明 + OpenAPI 合約 |
| UI/UX 設計 | `/docs/01-4-UI_UX_Design.md` | 視覺與互動設計規格（如適用） |
| Dev Plan | `/docs/02-Dev_Plan.md` | 里程碑、任務清單、角色分工、Git 協作策略 |
| 審查報告 | `/docs/03-Docs_Review_Report.md` | AI 交叉比對結果，含不一致與遺漏項目 |
| CI/CD 規格 | `/docs/04-CI_CD_Spec.md` | CI Workflow、品質閘門、Docker 配置（選用） |

> 📁 完整範例見 [`skills/vibe-sdlc-p1-spec/examples/docs/`](./skills/vibe-sdlc-p1-spec/examples/docs/)

### 💬 Issue 狀態追蹤

Issue 是跨 session 的唯一溝通媒介，AI 在關鍵時刻自動發佈 Comment：

| 時機 | Comment |
|------|---------|
| 領取任務 | 🚀 **任務領取** — 角色、分支、worktree |
| 遇到阻塞 | 📋 **進度更新** — 阻塞原因 |
| Vibe Check 通過 | ✅ **Vibe Check 通過** — 自動建 PR 並回報連結 |
| PR 合併後 | 🎉 **任務完成** — 更新 Dev Plan、列出待驗證 Issues |

### 🤖 Multi Sub Agent 並行開發

原生支援多 Sub Agent 高度並行開發，以 `API_Spec.yaml` 作為前後端解耦契約：

- **Worktree 隔離** — 每個 Sub Agent 使用獨立 Git Worktree
- **分支命名** — `feat/<agent>/<issue-N>-<簡述>`
- **雙層 PR 審查** — Sub Agent PR → CI → A-Main 初審 → H-Director 終審
- **PR 範圍限制** — A-Backend 只能修改 `/backend/**`，違者駁回

### 🛡️ 安全檢查機制

- **追加 Commit 安全檢查** — 推送前確認 PR 仍為 OPEN，避免 push 至已合併的分支
- **既有測試失敗處理** — AI 自動歸因（flaky / 既有 bug / 本次造成）再決定處理方式
- **自主排查原則** — 遇到問題優先自行調查與解決，無法解決時才上報開發者

---

## 👥 核心角色

| 類別 | 代號 | 名稱 | 職責 |
|:----:|------|------|------|
| 🧑 人類 | `H-Director` | 導演 | 最高決策、規格審查、Milestone 驗收、PR 合併 |
| 🧑 人類 | `H-Reviewer` | 審查員 | 特定領域審查（UX / 安全），可由 Director 兼任 |
| 🤖 AI | `A-Main` | 主代理 | 統籌任務、協調 Sub Agents、整合驗證 |
| 🤖 AI | `A-Backend` | 後端子代理 | 專注 `/backend/**`：API、DB、ORM |
| 🤖 AI | `A-Frontend` | 前端子代理 | 專注 `/frontend/**`：UI、狀態管理、API Client |
| 🤖 AI | `A-QA` | 測試子代理 | 專注 `/tests/**`：E2E 測試、覆蓋率 |
| 🤖 AI | `A-DevOps` | 部署子代理 | 專注 CI/CD、Docker、監控配置 |

---

## 📦 安裝方式

### 一鍵安裝（推薦）

```bash
./install.sh                               # 互動式選擇
./install.sh global                        # 全域安裝
./install.sh project /path/to/my-project   # 安裝至指定專案
./install.sh shared  /path/to/my-project   # 安裝至指定專案並提交 Git
```

<details>
<summary>手動安裝</summary>

```bash
# 全域安裝（所有專案可用）
cp -r skills/vibe-sdlc* ~/.claude/skills/
cp -r skills/local-tunnel ~/.claude/skills/

# 專案層級安裝（僅限特定專案）
mkdir -p /path/to/my-project/.claude/skills
cp -r skills/vibe-sdlc* /path/to/my-project/.claude/skills/
cp -r skills/local-tunnel /path/to/my-project/.claude/skills/
```

</details>

安裝後輸入 `/vibe-sdlc` 驗證，看到進度儀表板即成功。

---

## 🗂️ 目錄結構

```
Vibe-SDLC/
├── README.md                          ← 本說明文件
├── CLAUDE.md                          ← Claude Code 專案指引
├── Vibe-SDLC.md                       ← 完整 SOP 規範文件（v8.2）
├── install.sh                         ← 一鍵安裝腳本
└── skills/                            ← Skills 發佈資源
    ├── README.md                      ← Skills 詳細說明與使用範例
    ├── DEPLOY.md                      ← 部署方式詳細說明
    ├── local-tunnel/skill.md          ← 發佈本地服務至公網
    ├── vibe-sdlc/skill.md             ← 總覽與導航
    ├── vibe-sdlc-p1-spec/             ← Phase 1 + examples/docs/（規格文件範例）
    ├── vibe-sdlc-p2-issues/skill.md   ← Phase 2：任務掛載
    ├── vibe-sdlc-p3-dev/skill.md      ← Phase 3：開發循環
    ├── vibe-sdlc-p4-pr/skill.md       ← Phase 4：CI 監控與合併後作業
    └── vibe-sdlc-p5-release/skill.md  ← Phase 5：交付與迭代
```

---

## 📚 相關文件

| 文件 | 說明 |
|------|------|
| [`Vibe-SDLC.md`](./Vibe-SDLC.md) | 完整 SOP 規範文件（v8.2），包含所有流程細節 |
| [`skills/README.md`](./skills/README.md) | Skills 詳細說明、各 Phase 職責與使用範例 |
| [`skills/DEPLOY.md`](./skills/DEPLOY.md) | 部署方式詳細說明 |
| [`skills/vibe-sdlc-p1-spec/examples/docs/`](./skills/vibe-sdlc-p1-spec/examples/docs/) | 規格文件完整範例 |

---

## 📄 License

[MIT](LICENSE)
