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

### 流程階段

| Phase | 名稱 | Skill 指令 | 說明 |
|-------|------|-----------|------|
| — | 進度儀表板 | `/vibe-sdlc` | 產出里程碑進度、待審 PR、待驗證 Issue 儀表板，自動判斷當前 Phase |
| 1 | 定義規格文件與計畫 | `/vibe-sdlc-p1-spec` | 撰寫 PRD、SRD、API Spec、UI/UX、Dev Plan、審查報告、CI/CD Spec |
| 2 | 任務掛載 | `/vibe-sdlc-p2-issues` | 建立 Labels/Milestones → 開發 Issues → 驗證 Issues → Project 看板 |
| 3 | 開發循環 | `/vibe-sdlc-p3-dev` | 領取 Issue → 實作 → 測試 → Vibe Check → 自動建 PR |
| 4 | CI 監控與合併後作業 | `/vibe-sdlc-p4-pr` | 監控 CI → 修正失敗 → Merge 後更新 Dev Plan → 手動驗證提醒 |
| 5 | 交付與迭代 | `/vibe-sdlc-p5-release` | 部署驗收 → 收集回饋 → 更新規格 → 下一輪迭代 |

### 目錄結構

```
Vibe-SDLC/
├── CLAUDE.md                           ← 專案指引（本文件）
├── skills/                             ← Skills 源碼（發佈用）
│   ├── README.md                       ← 完整使用說明與範例
│   ├── DEPLOY.md                       ← 部署方式說明
│   ├── vibe-sdlc/skill.md             ← 總覽與導航
│   ├── vibe-sdlc-p1-spec/             ← Phase 1 skill + examples/docs/
│   ├── vibe-sdlc-p2-issues/skill.md   ← Phase 2 skill
│   ├── vibe-sdlc-p3-dev/skill.md      ← Phase 3 skill
│   ├── vibe-sdlc-p4-pr/skill.md       ← Phase 4 skill
│   └── vibe-sdlc-p5-release/skill.md  ← Phase 5 skill
└── .claude/skills/                     ← 本專案部署的 skills（與 skills/ 同步）
```

### 規格文件範例

Phase 1 skill 包含完整的規格文件範例（`skills/vibe-sdlc-p1-spec/examples/docs/`）：

| 文件 | 說明 |
|------|------|
| `01-1-PRD.md` | 產品需求文件 |
| `01-2-SRD.md` | 系統需求文件 |
| `01-3-API_Spec.md` + `API_Spec.yaml` | API 介面規格 + OpenAPI 合約 |
| `01-4-UI_UX_Design.md` | UI/UX 設計文件 |
| `02-Dev_Plan.md` | 開發計畫（含角色定義、任務拆解、Git 協作策略） |
| `03-Docs_Review_Report.md` | 規格審查報告 |
| `04-CI_CD_Spec.md` | CI/CD 規格文件 |
