# Vibe-SDLC Skills 部署說明

## 檔案清單

```
skills/
├── DEPLOY.md                        ← 本說明文件
├── vibe-sdlc/
│   └── skill.md                     ← 總覽與導航
├── vibe-sdlc-p1-spec/
│   ├── skill.md                     ← Phase 1：定義規格文件與計畫
│   └── examples/docs/               ← 規格文件範例
│       ├── 01-1-PRD.md              ← 產品需求文件範例
│       ├── 01-2-SRD.md              ← 系統需求文件範例
│       ├── 01-3-API_Spec.md         ← API 介面規格範例
│       ├── 01-4-UI_UX_Design.md     ← UI/UX 設計文件範例
│       ├── 02-Dev_Plan.md           ← 開發計畫範例
│       ├── 03-Docs_Review_Report.md ← 規格審查報告範例
│       ├── 04-CI_CD_Spec.md         ← CI/CD 規格文件範例
│       └── API_Spec.yaml            ← OpenAPI 合約範例
├── vibe-sdlc-p2-issues/
│   └── skill.md                     ← Phase 2：任務掛載
├── vibe-sdlc-p3-dev/
│   └── skill.md                     ← Phase 3：開發循環
├── vibe-sdlc-p4-pr/
│   └── skill.md                     ← Phase 4：自動化驗證
└── vibe-sdlc-p5-release/
    └── skill.md                     ← Phase 5：交付與迭代
```

## 目錄結構說明

Claude Code 的 skills 要求每個 skill 為**獨立子目錄**，目錄中包含一個 `skill.md` 檔案。格式如下：

```
<skills-dir>/<skill-name>/skill.md
```

其中 `skill.md` 的 frontmatter 定義了 skill 的名稱、描述與是否可由使用者呼叫：

```yaml
---
name: vibe-sdlc
description: >
  Vibe-SDLC 流程總覽與導航。
user_invocable: true
---
```

## 部署方式

Claude Code 的 skills 支援三個層級的部署位置，依據你的需求選擇：

### 方式一：全域部署（所有專案皆可使用）

將 skill 子目錄複製到個人設定目錄：

```bash
cp -r skills/vibe-sdlc* ~/.claude/skills/
```

### 方式二：專案層級部署（僅限特定專案）

將 skill 子目錄複製到目標專案的 `.claude/skills/` 目錄：

```bash
# 在目標專案根目錄下執行
mkdir -p .claude/skills
cp -r /path/to/Vibe-SDLC/skills/vibe-sdlc* .claude/skills/
```

### 方式三：共享部署（團隊共用，納入版本控制）

將 skill 子目錄放在專案的 `.claude/skills/` 目錄並提交至 Git：

```bash
mkdir -p .claude/skills
cp -r /path/to/Vibe-SDLC/skills/vibe-sdlc* .claude/skills/
git add .claude/skills/
git commit -m "Add Vibe-SDLC skills for AI-assisted development workflow"
```

## 驗證部署

部署完成後，在 Claude Code 中輸入以下指令驗證：

```
/vibe-sdlc
```

若看到進度儀表板與 Phase 導航，表示部署成功。

## 使用方式

| 指令 | 用途 |
|------|------|
| `/vibe-sdlc` | 產出進度儀表板（里程碑進度、待審 PR、待驗證 Issue），自動判斷當前 Phase |
| `/vibe-sdlc-p1-spec` | 撰寫或審查規格文件 |
| `/vibe-sdlc-p2-issues` | 審核 Dev Plan → 建立 GitHub Issues |
| `/vibe-sdlc-p3-dev` | 領取 Issue → 開發 → 測試 → Vibe Check |
| `/vibe-sdlc-p4-pr` | 推送程式碼 → 建立 PR → 處理 CI |
| `/vibe-sdlc-p5-release` | 部署驗收 → 收集回饋 → 更新規格 |

## 典型工作流程

```
專案啟動
  └→ /vibe-sdlc-p1-spec     撰寫規格 → 審查 → 定稿
      └→ /vibe-sdlc-p2-issues   審核計畫 → 建立 Issues
          └→ /vibe-sdlc-p3-dev       領取 Issue #1 → 開發 → Vibe Check
              └→ /vibe-sdlc-p4-pr        推送 → PR → CI → Merge
                  └→ /vibe-sdlc-p3-dev       領取 Issue #2 → ...（重複）
                      └→ ...
                          └→ /vibe-sdlc-p5-release   里程碑完成 → 部署 → 回饋
                              └→ /vibe-sdlc-p2-issues   下一輪迭代
```

## 注意事項

- 這些 skills 假設專案使用 GitHub 作為版本管理與 CI/CD 平台
- Phase 2 與 Phase 4 會使用 `gh` CLI，請確保已安裝並登入（`gh auth login`）
- 規格文件預設路徑為 `/docs`，可依專案需求調整 skill 內容中的路徑
