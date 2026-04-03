# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 通用要求

### 一般要求

1. 回覆時請儘量使用**繁體中文**，專有名詞可保留原
2. 文件格式我偏好 Markdown，若需描述流程圖或架構圖等請用Mermaid格式，並即時渲染成 png (或 jpg) 圖片，以利我筆記及閱讀。
3. 要請在要求我授權執行某些指令時，請**加上簡短的備註** (請儘量使用繁體中文進行備註)，說明這次指令的目的是什麼，備註內容儘量精簡，不要超過200字。
4. `.env` 含有敏感資訊，嚴格禁止 commit 或傳輸 ！

### Performance & Execution Efficiency

* **輸出持久化 (Output Persistence)**：
若某個指令（如 `curl`, `java`, `python`, 或 `sql`）的輸出結果需要透過 `grep`, `sed`, `awk`, 或 `jq` 進行多次分析，**務必**先將該輸出結果儲存至暫存檔中。
* **避免重複執行 (Avoid Redundant Execution)**：
若參數未曾變更，**請勿**重複執行相同的 `java` 或 `python` 腳本。在執行之前，請先檢查當前目錄下是否已存在先前生成的輸出檔案。
* **偏好的工作流程 (Preferred Workflow)**：
1. 執行高成本指令：`python script.py > temp_output.txt`
2. 進行多次分析：`grep "error" temp_output.txt`、`awk '{print $1}' temp_output.txt`
3. 當作業階段結束後再進行清理。

## 專案概述

Vibe-SDLC 是一個定義 Vibe-Coding 軟體開發生命週期（Software Development Life Cycle）的專案。目標是建立一套適用於 AI 輔助開發（Vibe Coding）情境下的 SDLC 流程與規範。

### 核心原則

1. **人類決策、AI 執行、GitHub 管控**
2. 所有開發工作皆以 `/docs` 中的規格文件為唯一真相來源
3. 每個階段有明確的前置條件與完成條件，未達成不得跳過
4. **規格文件版本化管理**：任何對 `/docs` 規格文件的修改，都必須同步更新該文件的版本號、最後更新日期、版本修訂說明表格，確保修訂軌跡可追溯
5. **臨時需求即時同步**：開發過程中若有臨時新增需求、Bug 修正導致規格變更、或新增 Issue，應即時回溯修改對應的規格文件與 Dev Plan，而非等到迭代結束才統一更新

### 流程階段

| Phase | 名稱 | Skill 指令 | 說明 |
|-------|------|-----------|------|
| — | 進度儀表板 | `/vibe-sdlc` | 產出里程碑進度、待審 PR、待驗證 Issue 儀表板，自動判斷當前 Phase |
| 1 | 定義規格文件與計畫 | `/vibe-sdlc-spec` | 撰寫 PRD、SRD、API Spec、UI/UX、Dev Plan、審查報告、CI/CD Spec |
| 2 | 任務掛載 | `/vibe-sdlc-issues` | 建立 Labels/Milestones → 開發 Issues → 驗證 Issues → Project 看板 |
| 3 | 開發循環 | `/vibe-sdlc-dev` | 領取 Issue → 實作 → 測試 → Vibe Check → 自動建 PR |
| 4 | CI 監控與合併後作業 | `/vibe-sdlc-pr` | 監控 CI → 修正失敗 → Merge 後更新 Dev Plan → 手動驗證提醒 |
| 5 | 交付與迭代 | `/vibe-sdlc-release` | 部署驗收 → 收集回饋 → 更新規格 → 下一輪迭代 |
| — | Agent 狀態查詢與彙整 | `/vibe-sdlc-status` | 查詢 Agent 工作狀態、彙整 STATUS.md |

### Skill 維護規則 

1. **`.claude/skills/` 為 skill 的開發主目錄**：所有 skill 的新增與修改都在 `.claude/skills/` 下進行

2. **同步至 `skills/` 作為發佈資源**：`.claude/skills/` 的變更必須同步複製至 `skills/` 對應目錄，`skills/` 是供外部使用者安裝的發佈來源。

3. **Skill 變更時必須同步更新說明文件**（包含但不限於）：

   | 文件 | 用途 | 同步重點 |
   |------|------|---------|
   | `./README.md` | 專案門面，含 Quick Start | Phase 表格、特性摘要、目錄結構 |
   | `./Vibe-SDLC.md` | 完整 SOP 規範 | 操作步驟、完成條件、角色職責 |
   | `./skills/README.md` | Skill 詳細介紹與使用範例 | Phase 詳細說明、使用範例 |
   | `./skills/DEPLOY.md` | 安裝部署說明 | 檔案清單、安裝步驟 |
   | `./.claude/skills/Vibe-SDLC-README.md` | 與 `skills/README.md` 內容一致 | 全文同步 |

4. **檢查清單**：每次 skill 變更後，確認以上文件中的相關描述（Phase 名稱、步驟編號、完成條件、核心原則等）是否需要連動更新。若不確定，以 `.claude/skills/` 下的 `skill.md` 為權威來源

5. 當使用者說「同步技能」或「同步 skills」時即觸發此同步及更新的動作，並依上述原則更新說明文件。

### 目錄結構

```
Vibe-SDLC/
├── CLAUDE.md                           ← 專案指引（本文件）
├── README.md                           ← 專案門面說明（含 Quick Start）
├── Vibe-SDLC.md                        ← 完整 SOP 規範文件
├── install.sh                          ← 一鍵安裝腳本
├── skills/                             ← Skills 發佈資源（由 .claude/skills/ 同步而來）
│   ├── README.md                       ← 完整使用說明與範例
│   ├── DEPLOY.md                       ← 部署方式說明
│   ├── vibe-sdlc/skill.md             ← 總覽與導航
│   ├── vibe-sdlc-spec/             ← Phase 1 skill + examples/docs/
│   ├── vibe-sdlc-issues/skill.md   ← Phase 2 skill
│   ├── vibe-sdlc-dev/skill.md      ← Phase 3 skill
│   ├── vibe-sdlc-pr/skill.md       ← Phase 4 skill
│   ├── vibe-sdlc-release/skill.md  ← Phase 5 skill
│   └── vibe-sdlc-status/skill.md  ← Agent 狀態查詢與彙整
└── .claude/skills/                     ← Skills 開發主目錄（本專案同時使用）
    ├── Vibe-SDLC-README.md             ← 與 skills/README.md 同步
    ├── vibe-sdlc/skill.md             ← 總覽與導航
    ├── vibe-sdlc-spec/             ← Phase 1 skill + examples/docs/
    ├── vibe-sdlc-issues/skill.md   ← Phase 2 skill
    ├── vibe-sdlc-dev/skill.md      ← Phase 3 skill
    ├── vibe-sdlc-pr/skill.md       ← Phase 4 skill
    ├── vibe-sdlc-release/skill.md  ← Phase 5 skill
    └── vibe-sdlc-status/skill.md  ← Agent 狀態查詢與彙整
```

### 規格文件範例

Phase 1 skill 包含完整的規格文件範例（`skills/vibe-sdlc-spec/examples/docs/`）：

| 文件 | 說明 |
|------|------|
| `01-1-PRD.md` | 產品需求文件 |
| `01-2-SRD.md` | 系統需求文件 |
| `01-3-API_Spec.md` + `API_Spec.yaml` | API 介面規格 + OpenAPI 合約 |
| `01-4-UI_UX_Design.md` | UI/UX 設計文件 |
| `02-Dev_Plan.md` | 開發計畫（含角色定義、任務拆解、Git 協作策略） |
| `03-Docs_Review_Report.md` | 規格審查報告 |
| `04-CI_CD_Spec.md` | CI/CD 規格文件 |
