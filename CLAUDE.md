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
