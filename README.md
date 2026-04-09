<div align="center">

🌐 **繁體中文** | [English](./README.en.md) | [简体中文](./README.zh-CN.md) | [Tiếng Việt](./README.vi.md)

# Vibe-SDLC

**AI-Driven Software Development Lifecycle for Claude Code**

讓 AI 從「能寫程式」升級為「能跑完整個軟體開發流程」

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![GitHub CLI](https://img.shields.io/badge/GitHub_CLI-Required-orange)](https://cli.github.com/)

[快速開始](#-快速開始) · [流程總覽](#-五個開發階段) · [安裝方式](#-安裝方式) · [使用範例](#-使用範例) · [完整 SOP](./Vibe-SDLC.md)

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
| **議題收集與處置流程** | 開發者直接回報 Bug / 需求時，AI 先詢問處理方式（直接修 / 建 Issue / 暫存），再依選擇執行 |

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
/vibe-sdlc-spec       ← 撰寫規格文件（PRD、SRD、SDD、API Spec、Dev Plan）
/vibe-sdlc-issues     ← 將計畫轉為 GitHub Issues
/vibe-sdlc-dev        ← 領取 Issue → 開發 → 測試 → 自動建 PR
/vibe-sdlc-pr         ← 監控 CI → 修正失敗 → Merge 後更新進度
/vibe-sdlc-release    ← 收集回饋 → Release 發佈 → 啟動下一輪迭代
/vibe-sdlc-status     ← 查詢 Agent 狀態 → 彙整 STATUS.md
```

<details>
<summary><b>💡 從想法到第一個 PR，只需 3 句 prompt</b></summary>

```
你：/vibe-sdlc-spec
    我要做一個個人記帳App，請與我討論並幫我撰寫 PRD。
    ...（AI 協助完成所有規格文件）

你：/vibe-sdlc-issues
    規格定稿了，請建立 GitHub Issues。

你：/vibe-sdlc-dev
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
  └→ P1: 定義規格         撰寫 PRD / SRD / SDD / API Spec / Dev Plan → 交叉審查 → 定稿
      └→ P2: 任務掛載       將 Dev Plan 轉為 GitHub Issues + Project 看板
          └→ P3: 開發循環       領取 Issue → 實作 → 測試 → Vibe Check → 自動建 PR
              └→ P4: CI 與合併     監控 CI → 修正失敗 → Merge → 更新 Dev Plan
                  └→ P3: ...          領取下一個 Issue（重複 P3↔P4）
                      └→ P5: 交付迭代     里程碑完成 → 部署驗收 → 回饋 → 回到 P2
```

| Phase | 名稱 | Slash Command | 說明 |
|:-----:|------|---------------|------|
| — | 進度儀表板 | `/vibe-sdlc` | 自動偵測專案狀態、產出儀表板、導航至對應 Phase |
| 1 | 定義規格文件與計畫 | `/vibe-sdlc-spec` | 撰寫 / 審查 PRD、SRD、SDD、API Spec、UI/UX、Dev Plan、CI/CD Spec |
| 2 | 任務掛載 | `/vibe-sdlc-issues` | 建立 Labels / Milestones → 開發 Issues → 驗證 Issues → Project 看板 |
| 3 | 開發循環 | `/vibe-sdlc-dev` | 領取 Issue → 實作 → 測試 → Vibe Check → 自動建 PR |
| 4 | CI 監控與合併後作業 | `/vibe-sdlc-pr` | 監控 CI → 修正失敗 → Merge → 更新 Dev Plan → 驗證提醒 |
| 5 | 回饋收集、Release 與迭代 | `/vibe-sdlc-release` | 收集回饋 → Release 發佈 → 啟動下一輪迭代 |
| — | Agent 狀態查詢 | `/vibe-sdlc-status` | 查詢 Agent 工作狀態 → 彙整 STATUS.md → 異常提醒 |

---

## ✨ 主要特性

### 📄 規格文件體系

所有規格文件存放在 `/docs`，是開發的唯一真相來源（Single Source of Truth）：

| 文件 | 路徑 | 說明 |
|------|------|------|
| PRD | `/docs/01-1-PRD.md` | 產品需求、使用者故事、功能清單 |
| SRD | `/docs/01-2-SRD.md` | 技術棧、系統架構、安全與性能要求 |
| API Spec | `/docs/01-5-API_Spec.md` + `API_Spec.yaml` | API 端點說明 + OpenAPI 合約 |
| UI/UX 設計 | `/docs/01-6-UI_UX_Design.md` + `/docs/ui/*.html` | 視覺與互動設計規格（選用）+ HTML + Tailwind wireframe 視覺參考；遵循 [UI_UX_Writing_Guidelines](./skills/vibe-sdlc-spec/references/UI_UX_Writing_Guidelines.md) 9 條準則 |
| Dev Plan | `/docs/02-Dev_Plan.md` | 里程碑、任務清單、角色分工、Git 協作策略 |
| 審查報告 | `/docs/03-Docs_Review_Report.md` | AI 交叉比對結果，含不一致與遺漏項目 |
| CI/CD 規格 | `/docs/04-CI_CD_Spec.md` | CI Workflow、品質閘門、Docker 配置（選用） |

> 📁 完整範例見 [`skills/vibe-sdlc-spec/examples/docs/`](./skills/vibe-sdlc-spec/examples/docs/)

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
- **分支策略** — ⛔ 嚴禁直接 push main。有 Issue → `feat/<agent>/<issue-N>-<簡述>`；無 Issue 小修 → `dev/main-agent`
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

## 💡 使用範例

以下展示開發者（導演）在各階段如何下 prompt 與 AI 助手互動。

### 場景一：查看專案進度 — 進度儀表板

```
> /vibe-sdlc
```

AI 會自動收集 GitHub Issues、PR、CI 狀態等數據，產出**進度儀表板**，包含：
- 各里程碑完成進度（進度條 + 百分比）
- 待審 PR 與 CI 狀態
- 進行中 Issue 與待驗證 Issue
- 最近合併的 PR
- 判斷當前 Phase 並給出具體建議

適合在每天開工前、不確定下一步該做什麼時使用。

---

### 場景二：Phase 1 — 撰寫規格文件

**從零開始撰寫 PRD：**

```
> /vibe-sdlc-spec
> 我要開發一個 Todo List API，支援 CRUD 操作，使用者需登入才能存取自己的待辦事項。
> 請幫我撰寫 PRD。
```

**已有規格，請求交叉審查：**

```
> /vibe-sdlc-spec
> 我已經把 PRD、SRD、API Spec、Dev Plan 都放在 /docs 下了，請進行交叉比對審查。
```

**針對審查結果修正：**

```
> 審查報告第 3 項提到 SRD 缺少 rate limiting 規格，請幫我補上，
> 限制為每個使用者每分鐘 60 次請求。
```

---

### 場景三：Phase 2 — 建立 GitHub Issues

**審核 Dev Plan 並建立 Issues（審查報告通過後）：**

```
> /vibe-sdlc-issues
> 規格已經定稿了，審查報告也確認無誤，請幫我建立 GitHub Issues。
```

**只建立特定里程碑的 Issues：**

```
> /vibe-sdlc-issues
> 先只建 Milestone 1 的 Issues 就好，M2 之後的等 M1 完成再說。
```

---

### 場景四：Phase 3 — 日常開發循環

**指派 Issue 給 AI 開發：**

```
> /vibe-sdlc-dev
> 請處理 Issue #5，實作使用者註冊 API。
```

AI 完成開發與測試後，Vibe Check 通過會**立即自動推送分支並建立 PR**，然後向你彙報結果與 PR 連結。開發過程中遇到問題會優先自行排查與解決，無法解決時才上報。你只需在 GitHub 上進行 Code Review。

**若 AI 開發過程中你想追加需求：**

```
> 追加一個測試案例：當 email 格式不正確時應回傳 400 Bad Request。
```

**若你在 Code Review 中發現問題：**

```
> 密碼雜湊請改用 bcrypt，不要用 SHA-256。修正後重新推送。
```

---

### 場景五：Phase 4 — CI 監控與合併後作業

**CI 失敗時（PR 已由 Phase 3 自動建立）：**

```
> /vibe-sdlc-pr
> CI 掛了，這是錯誤報告：[貼上 CI 錯誤訊息]
> 請分析原因並修正。
```

**Merge 後更新進度：**

```
> PR 已經 merge 了，請更新 Dev Plan 的任務狀態。
> 看板上還有 Issue 嗎？有的話繼續處理下一個。
```

---

### 場景六：Phase 5 — 里程碑交付

**確認里程碑完成狀態：**

```
> /vibe-sdlc-release
> M1 的所有 Issue 應該都 merge 了，請確認一下並產出完成報告。
```

**提供回饋並啟動下一輪迭代：**

```
> 測試環境跑過了，有幾個回饋：
> 1. 列表頁需要分頁功能（新需求）
> 2. 刪除操作應改為軟刪除（需求變更）
> 3. 登入頁的文案不好看（暫不處理）
> 請幫我整理並更新 PRD 和 Dev Plan。
```

---

### 場景七：測試/驗收中回報 Bug 或新增需求 — 議題收集與處置流程

當你在開發、測試或驗收過程中**直接描述 Bug、新需求或改善建議**時（例如「XX 壞了」「我想要 XX」），AI 會立刻停下、不動任何檔案，先給你 5 個處理選項。這是 Vibe-SDLC 的核心機制（核心原則第 6 條），會在 Phase 3、4、5 任何階段被觸發。

**情境：M1 驗收期間發現問題與新需求**

```
> 我剛在測試環境試了註冊流程，發現密碼長度只檢核到 6 碼，應該至少 8 碼。
> 另外列表頁載入有點慢，希望加上分頁功能。
```

```
📋 Issue 追蹤選項
─────────────────
您回報了：
  - [Bug] 密碼長度檢核應從 6 碼提升至 8 碼
  - [Feature] 列表頁加入分頁功能

請選擇處理方式：
  1️⃣  小問題，直接修正（不建 Issue）
  2️⃣  建立 Issue 後立即修正
  3️⃣  先記下來，待會一起建立 Issues
  4️⃣  議題收集完成，彙整成 Issues 並開始開發
  5️⃣  議題收集完成，彙整成 Issues 並等待指示

請選擇（1/2/3/4/5）：
```

**選項對應指南**：

| 你的回報內容 | 建議選項 | AI 行為 |
|---|:---:|---|
| Typo、文案微調、簡單 config | **1** | 在 `dev/main-agent` 分支直接修正並提 PR |
| 單一 Bug 或單一需求要立即處理 | **2** | 建 Issue → 立即進入 P3 開發 → 自動建 PR |
| 一連串回饋要先收集 | **3** | 暫存清單，等你說「整理回報」再批量建立 |
| 確認的清單要立刻全部開做 | **4** | 批量建 Issues → 立即依優先序開發 |
| 確認的清單要先 review 優先級 | **5** | 批量建 Issues → 停下等指示 |

**選項 4 範例對話（驗收後一次性處理多項回饋）：**

```
> 4
> 第 1 項是 P0 Bug 要進 M1，第 2 項是新需求進 M2 backlog。
```

AI 會逐一確認每筆 Issue 的標題、Labels、Milestone，批量執行 `gh issue create`，接著直接領取 P0 Issue 進入 Phase 3 開發循環。若回報內容涉及 PRD / API Spec 變更，AI 會在處理完成後**即時回溯更新**對應規格文件並升版（核心原則第 4、5 條）。

> 💡 **何時不會觸發**：透過 `/vibe-sdlc-dev` 領取既有 Issue、純粹的程式碼問答、或你明確說「直接改」「快速修一下」時，AI 會直接執行不再詢問。

---

### 場景八：Multi Sub Agent 並行開發

**讓 AI 產生含 Git 協作策略的 Dev Plan：**

```
> /vibe-sdlc-spec
> Dev Plan 請採用 Multi Sub Agent 架構，包含 A-Backend、A-Frontend、A-QA、A-DevOps，
> 並依照規範加入 Worktree 配置與雙層 PR 審查流程。
```

**Sub Agent 的 Vibe Check 通過後自動建 PR：**

```
> /vibe-sdlc-dev
> 我是 A-Backend，請處理 Issue #12，實作 Auth API。
（AI 完成開發 → Vibe Check → 自動建 PR）
```

**A-Main 監控 CI 並協調合併：**

```
> /vibe-sdlc-pr
> PR #34 的 CI 已通過，A-Main 初審確認範圍正確（僅修改 /backend/**），
> 請 H-Director 進行終審。
```

---

### 提示技巧

| 技巧 | 說明 | 範例 |
|------|------|------|
| **明確指派** | 告訴 AI 處理哪個 Issue | `請處理 Issue #12` |
| **給定約束** | 指定技術選型或限制 | `使用 PostgreSQL，不要用 SQLite` |
| **分段操作** | 一次只做一個階段 | `先只審核 Dev Plan，不要建 Issues` |
| **引用規格** | 指向特定文件章節 | `參考 SRD 3.2 節的安全要求` |
| **附上上下文** | 貼上錯誤訊息或截圖 | `CI 報錯了：[錯誤訊息]` |
| **批次確認** | 一次核准多項操作 | `審查報告的建議全部接受，請一次修正` |

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
    ├── vibe-sdlc-spec/             ← Phase 1 + examples/docs/（規格文件範例）
    ├── vibe-sdlc-issues/skill.md   ← Phase 2：任務掛載
    ├── vibe-sdlc-dev/skill.md      ← Phase 3：開發循環
    ├── vibe-sdlc-pr/skill.md       ← Phase 4：CI 監控與合併後作業
    ├── vibe-sdlc-release/skill.md  ← Phase 5：回饋收集、Release 與迭代
    └── vibe-sdlc-status/skill.md  ← Agent 狀態查詢與彙整
```

---

## 📚 相關文件

| 文件 | 說明 |
|------|------|
| [`Vibe-SDLC.md`](./Vibe-SDLC.md) | 完整 SOP 規範文件（v8.2），包含所有流程細節 |
| [`skills/README.md`](./skills/README.md) | Skills 詳細說明、各 Phase 職責與使用範例 |
| [`skills/DEPLOY.md`](./skills/DEPLOY.md) | 部署方式詳細說明 |
| [`skills/vibe-sdlc-spec/examples/docs/`](./skills/vibe-sdlc-spec/examples/docs/) | 規格文件完整範例 |

---

## 📄 License

[MIT](LICENSE)
