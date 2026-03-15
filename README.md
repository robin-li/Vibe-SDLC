# Vibe-SDLC

> **AI 輔助軟體開發生命週期（Software Development Life Cycle）流程規範與 Claude Code Skill 套件**

---

## 專案簡介

Vibe-SDLC 定義了一套適用於 **AI 輔助開發（Vibe Coding）** 情境下的完整 SDLC 流程。核心理念：

> **人類決策、AI 執行、GitHub 管控**

開發者（導演）負責規格定義與關鍵決策；AI 助手（執行者）負責實作、測試與報告；GitHub 負責版本管控、CI/CD 與任務追蹤。

---

## 核心角色

| 類別 | 代號 | 名稱 | 職責 |
|------|------|------|------|
| 🧑 人類 | H-Director | 導演 | 最高決策、規格審查、Milestone 驗收、PR 合併 |
| 🧑 人類 | H-Reviewer | 審查員 | 特定領域審查（UX/安全），可由 Director 兼任 |
| 🤖 AI | A-Main | 主代理 | 統籌任務、協調 Sub Agents、整合驗證 |
| 🤖 AI | A-Backend | 後端子代理 | 專注 `/backend/**`：API、DB、ORM |
| 🤖 AI | A-Frontend | 前端子代理 | 專注 `/frontend/**`：UI、狀態管理、API Client |
| 🤖 AI | A-QA | 測試子代理 | 專注 `/tests/**`：E2E 測試、覆蓋率 |
| 🤖 AI | A-DevOps | 部署子代理 | 專注 CI/CD、Docker、監控配置 |

---

## 五個開發階段

```
專案啟動
  └→ Phase 1: /vibe-sdlc-p1-spec     撰寫規格 → 交叉比對審查 → 定稿
      └→ Phase 2: /vibe-sdlc-p2-issues  審核計畫 → 建立 GitHub Issues
          └→ Phase 3: /vibe-sdlc-p3-dev      領取 Issue → 開發 → Vibe Check
              └→ Phase 4: /vibe-sdlc-p4-pr       推送 → PR → CI → Merge
                  └→ Phase 3: /vibe-sdlc-p3-dev      領取下一個 Issue...（重複）
                      └→ Phase 5: /vibe-sdlc-p5-release 里程碑完成 → 部署 → 回饋
                          └→ Phase 2: /vibe-sdlc-p2-issues  下一輪迭代
```

| Phase | 名稱 | Slash Command | 觸發時機 |
|-------|------|--------------|----------|
| 1 | 定義規格文件與計畫 | `/vibe-sdlc-p1-spec` | 專案啟動，撰寫或審查規格 |
| 2 | 任務掛載 | `/vibe-sdlc-p2-issues` | 規格定稿，建立 GitHub Issues |
| 3 | 開發循環 | `/vibe-sdlc-p3-dev` | 日常開發，領取 Issue 實作 |
| 4 | 自動化驗證 | `/vibe-sdlc-p4-pr` | 本地驗證通過，推送 PR |
| 5 | 交付與迭代 | `/vibe-sdlc-p5-release` | 里程碑完成，部署與收集回饋 |

---

## Multi Sub Agent 並行開發

Vibe-SDLC 原生支援多 Sub Agent 高度並行開發模式，以 `API_Spec.yaml` 作為前後端解耦契約：

### Git 協作策略

- **Worktree**：每個 Sub Agent 使用獨立 Git Worktree，避免分支切換干擾
  ```bash
  git worktree add ../worktree-backend feat/backend/issue-12-auth-api
  git worktree add ../worktree-frontend feat/frontend/issue-15-login-ui
  ```
- **分支命名**：`feat/<agent>/<issue-N>-<簡述>`
- **雙層 PR 審查**：Sub Agent 提交 PR → GitHub CI → A-Main 初審（確認 PR 範圍）→ H-Director 終審 & Merge
- **PR 範圍限制**：A-Backend 只能修改 `/backend/**`，A-Frontend 只能修改 `/frontend/**`，違者駁回

### 工作量估算單位

傳統「人月/人時」不適用，改用：
- **AI Sessions**：一次完整 Agent 對話執行（AI 角色）
- **HRH（Human Review Hours）**：人類審查決策時間（人類角色）

---

## 規格文件體系

| 文件 | 路徑 | 說明 |
|------|------|------|
| PRD | `/docs/01-1-PRD.md` | 產品需求、使用者故事、功能清單 |
| SRD | `/docs/01-2-SRD.md` | 技術棧、系統架構、安全與性能要求 |
| API Spec（說明） | `/docs/01-3-API_Spec.md` | API 端點文字說明 |
| API Spec（合約） | `/docs/API_Spec.yaml` | OpenAPI 規格，前後端唯一 API 契約 |
| Dev Plan | `/docs/02-Dev_Plan.md` | 里程碑、任務清單、角色分工、Git 協作策略 |
| 審查報告 | `/docs/03-Docs_Review_Report.md` | AI 交叉比對結果，含不一致與遺漏項目 |

---

## 目錄結構

```
Vibe-SDLC/
├── README.md                        ← 本說明文件
├── CLAUDE.md                        ← Claude Code 指引
├── Vibe-SDLC.md                     ← 完整 SOP 規範文件
└── skills/
    ├── README.md                    ← Skills 使用說明
    ├── DEPLOY.md                    ← 部署詳細說明
    ├── vibe-sdlc/
    │   └── skill.md                 ← 總覽與導航
    ├── vibe-sdlc-p1-spec/
    │   ├── skill.md                 ← Phase 1：定義規格文件與計畫
    │   └── examples/docs/           ← 規格文件範例（PRD、SRD、API Spec、Dev Plan 等）
    ├── vibe-sdlc-p2-issues/
    │   └── skill.md                 ← Phase 2：任務掛載
    ├── vibe-sdlc-p3-dev/
    │   └── skill.md                 ← Phase 3：開發循環
    ├── vibe-sdlc-p4-pr/
    │   └── skill.md                 ← Phase 4：自動化驗證
    └── vibe-sdlc-p5-release/
        └── skill.md                 ← Phase 5：交付與迭代
```

---

## 快速部署 Skills

### 全域部署（所有專案可用）

```bash
cp -r skills/vibe-sdlc* ~/.claude/skills/
```

### 專案層級部署

```bash
mkdir -p .claude/skills
cp -r /path/to/Vibe-SDLC/skills/vibe-sdlc* .claude/skills/
```

### 共享部署（納入版本控制）

```bash
mkdir -p .claude/skills
cp -r /path/to/Vibe-SDLC/skills/vibe-sdlc* .claude/skills/
git add .claude/skills/
git commit -m "Add Vibe-SDLC skills for AI-assisted development workflow"
```

部署後輸入 `/vibe-sdlc` 驗證，若看到流程總覽即成功。

---

## 前置需求

- [Claude Code](https://claude.ai/code) CLI
- [GitHub CLI (`gh`)](https://cli.github.com/)：Phase 2 建立 Issues、Phase 4 建立 PR 時需要
- 專案使用 **GitHub** 作為版本管理與 CI/CD 平台

---

## 相關文件

- [`Vibe-SDLC.md`](./Vibe-SDLC.md)：完整 SOP 規範文件（v7.0）
- [`skills/README.md`](./skills/README.md)：Skills 詳細說明與使用範例
- [`skills/DEPLOY.md`](./skills/DEPLOY.md)：部署方式詳細說明
- [`skills/vibe-sdlc-p1-spec/examples/docs/`](./skills/vibe-sdlc-p1-spec/examples/docs/)：規格文件範例
