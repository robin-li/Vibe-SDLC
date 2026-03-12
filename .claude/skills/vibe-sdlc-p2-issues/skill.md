---
name: vibe-sdlc-p2-issues
description: >
  Vibe-SDLC Phase 2：任務掛載 (Planning → Issues)。審核 Dev Plan 完整性，並自動建立 GitHub Issues。
  使用時機：規格文件已定稿，需要將開發計畫轉換為 GitHub Issues 與看板任務。
user_invocable: true
---

# Phase 2：任務掛載 (Planning → Issues)

## 目的

將 Dev Plan 轉換為 GitHub Issues，使每項任務皆可追蹤、可分派、可度量。

## 你的角色

你是 AI 助手（執行者）。在此階段你的職責是：
- 審核 Dev Plan 的完整性，交叉比對 SRD 中的非功能性需求
- 產出遺漏項目報告
- 依據 Dev Plan 逐一建立 GitHub Issues

**你不應該**：自行決定任務優先級或增刪任務，這些由開發者決策。

## 前置條件

- Phase 1 所有完成條件已達成（規格文件已定稿）
- 以下文件存在且已定稿：
  - `/docs/01-1-PRD.md`
  - `/docs/01-2-SRD.md`
  - `/docs/01-3-API_Spec.md`
  - `/docs/02-Dev_Plan.md`
- GitHub Projects 看板已建立

## 操作步驟

| 步驟 | 執行者 | 操作 | 產出 |
|------|--------|------|------|
| 1 | **開發者** | 指示 AI 審核 Dev Plan 完整性 | — |
| 2 | **AI 助手** | 讀取 `02-Dev_Plan.md`，交叉比對 SRD 中的安全實作與非功能性需求，列出遺漏項目 | 審核報告 |
| 3 | **開發者** | 審閱報告，確認或補充遺漏項目 | 核准結果 |
| 4 | **開發者** | 指示 AI 按里程碑建立 Issues | — |
| 5 | **AI 助手** | 依 Dev Plan 逐一建立 GitHub Issues，每個 Issue 包含：標題、描述、優先級標籤、里程碑標籤、依賴關係說明 | GitHub Issues |
| 6 | **GitHub** | 自動將 Issues 同步至 Projects 看板 | 看板就緒 |
| 7 | **開發者** | 確認看板上的 Issue 清單與排序是否正確 | 最終確認 |

## Issue 格式規範

建立每個 Issue 時，**必須**使用以下格式：

```markdown
## 任務描述
[具體要實作的功能或工作內容]

## 產出文件
- [ ] [文件 1]（如適用）
- [ ] [文件 2]（如適用）

## 驗收標準
- [ ] [標準 1]
- [ ] [標準 2]

## 技術參考
- SRD 相關章節：[章節名稱]
- API 端點：[端點路徑]（如適用）
- 其它參考文件

## 依賴
- 前置任務：#[Issue 編號]（如適用）

## 標籤
- 優先級：P0 / P1 / P2
- 里程碑：M1 / M2 / M3 / M4
- 類型：feature / infra / security / test
```

## Dev Plan 審核報告格式

```markdown
# Dev Plan 完整性審核報告

## 審查範圍
- Dev Plan：02-Dev_Plan.md
- 比對依據：01-2-SRD.md（安全性、效能、非功能性需求）

## 已涵蓋的非功能性需求
| SRD 需求 | 對應 Dev Plan 任務 |
|----------|-------------------|

## 遺漏項目
| 編號 | SRD 需求描述 | 建議新增任務 | 建議里程碑 |
|------|-------------|-------------|-----------|

## 結論
- 已涵蓋：N / M 項
- 遺漏：N 項
- 建議：[通過 / 需補充後重新審核]
```

## 完成條件

- [ ] Dev Plan 中的所有任務皆已轉為 GitHub Issues
- [ ] 每個 Issue 皆有完整的驗收標準與標籤
- [ ] Projects 看板已正確顯示所有 Issues

## 行為指引

當使用者呼叫此 skill 時：

1. 先確認前置條件：檢查 `/docs` 下的規格文件是否存在
2. 若缺少前置文件，提示使用者先完成 Phase 1（`/vibe-sdlc-p1-spec`）
3. 讀取 `02-Dev_Plan.md` 與 `01-2-SRD.md`，執行完整性審核
4. 產出審核報告，等待開發者確認
5. 開發者核准後，詢問要建立哪個里程碑的 Issues（或全部）
6. 使用 `gh` CLI 逐一建立 Issues，每建立一個即回報
7. 全部建立完成後，提示開發者確認看板，並告知可進入 Phase 3（`/vibe-sdlc-p3-dev`）
