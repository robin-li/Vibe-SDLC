#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────
# Vibe-SDLC Skills 一鍵安裝腳本
# 將 skills/ 下所有 skill 部署至 Claude Code 可識別的位置
# ─────────────────────────────────────────────────────────
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$SCRIPT_DIR/skills"

# ── 顏色定義 ──
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# ── 收集所有 skill 目錄（含 skill.md 的子目錄） ──
# 結果存入 SKILL_DIRS 陣列
collect_skill_dirs() {
    SKILL_DIRS=()
    for dir in "$SKILLS_SRC"/*/; do
        [ -d "$dir" ] || continue
        [ -f "$dir/skill.md" ] && SKILL_DIRS+=("$dir")
    done
}

print_banner() {
    echo ""
    echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}║     Vibe-SDLC Skills Installer           ║${NC}"
    echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════╝${NC}"
    echo ""
}

print_usage() {
    echo -e "${BOLD}使用方式${NC}："
    echo "  ./install.sh [模式] [目標路徑]"
    echo ""
    echo -e "${BOLD}安裝模式${NC}："
    echo "  global          全域安裝（~/.claude/skills/），所有專案可用"
    echo "  project [PATH]  專案層級安裝（預設為當前目錄的 .claude/skills/）"
    echo "  shared  [PATH]  共享安裝（同 project，額外提交至 Git）"
    echo ""
    echo -e "${BOLD}範例${NC}："
    echo "  ./install.sh global                        # 全域安裝"
    echo "  ./install.sh project                       # 安裝至當前專案"
    echo "  ./install.sh project /path/to/my-project   # 安裝至指定專案"
    echo "  ./install.sh shared  /path/to/my-project   # 安裝至指定專案並提交 Git"
    echo ""
    echo -e "${BOLD}互動模式${NC}："
    echo "  ./install.sh                               # 不帶參數，進入互動式選擇"
}

# ── 前置檢查 ──
check_source() {
    if [ ! -d "$SKILLS_SRC" ]; then
        echo -e "${RED}錯誤：找不到 skills/ 目錄（$SKILLS_SRC）${NC}"
        echo "請確認在 Vibe-SDLC 專案根目錄下執行本腳本。"
        exit 1
    fi

    collect_skill_dirs
    if [ "${#SKILL_DIRS[@]}" -eq 0 ]; then
        echo -e "${RED}錯誤：skills/ 目錄下找不到任何含 skill.md 的子目錄${NC}"
        exit 1
    fi
}

# ── 列出將安裝的 skills ──
list_skills() {
    echo -e "${BOLD}將安裝以下 skills：${NC}"
    for dir in "${SKILL_DIRS[@]}"; do
        local name
        name=$(basename "$dir")
        # 從 skill.md frontmatter 解析第一行有意義的描述文字
        local desc=""
        desc=$(awk '/^description:/{
            sub(/^description: *>? */, "")
            if (length($0) > 0) { print; exit }
            getline; sub(/^ */, "")
            if (length($0) > 0) print
            exit
        }' "$dir/skill.md")
        echo -e "  ${GREEN}/$name${NC}  ${desc:+— $desc}"
    done
    echo ""
}

# ── 安裝核心函式 ──
do_install() {
    local target_dir="$1"

    mkdir -p "$target_dir"

    local installed=0
    for dir in "${SKILL_DIRS[@]}"; do
        local name
        name=$(basename "$dir")
        # 若目標已存在，先移除舊版
        if [ -d "$target_dir/$name" ]; then
            rm -rf "$target_dir/$name"
        fi
        cp -r "$dir" "$target_dir/$name"
        installed=$((installed + 1))
    done

    echo -e "${GREEN}✅ 已安裝 $installed 個 skills 至 $target_dir${NC}"
}

# ── 驗證安裝 ──
verify_install() {
    local target_dir="$1"
    local ok=true

    for dir in "${SKILL_DIRS[@]}"; do
        local name
        name=$(basename "$dir")
        if [ ! -f "$target_dir/$name/skill.md" ]; then
            echo -e "${RED}  ✗ $name/skill.md 不存在${NC}"
            ok=false
        fi
    done

    if $ok; then
        echo -e "${GREEN}✅ 驗證通過，所有 skill.md 皆已就位${NC}"
    else
        echo -e "${RED}⚠️  部分檔案缺失，請檢查安裝目錄${NC}"
        return 1
    fi
}

# ── 模式：全域安裝 ──
install_global() {
    local target="$HOME/.claude/skills"
    echo -e "${CYAN}📦 全域安裝 → $target${NC}"
    do_install "$target"
    verify_install "$target"
    echo ""
    echo -e "${YELLOW}提示：全域安裝的 skills 可在所有專案中使用。${NC}"
}

# ── 模式：專案層級安裝 ──
install_project() {
    local project_root="${1:-.}"
    project_root="$(cd "$project_root" && pwd)"
    local target="$project_root/.claude/skills"

    echo -e "${CYAN}📦 專案層級安裝 → $target${NC}"

    if [ ! -d "$project_root" ]; then
        echo -e "${RED}錯誤：目標專案目錄不存在（$project_root）${NC}"
        exit 1
    fi

    do_install "$target"
    verify_install "$target"
    echo ""
    echo -e "${YELLOW}提示：專案層級 skills 僅在該專案中可用。${NC}"
    echo -e "${YELLOW}      如需讓團隊共用，請將 .claude/skills/ 提交至 Git。${NC}"
}

# ── 模式：共享安裝（含 Git 提交） ──
install_shared() {
    local project_root="${1:-.}"
    project_root="$(cd "$project_root" && pwd)"
    local target="$project_root/.claude/skills"

    echo -e "${CYAN}📦 共享安裝 → $target（含 Git 提交）${NC}"

    if [ ! -d "$project_root/.git" ]; then
        echo -e "${RED}錯誤：目標目錄不是 Git 倉庫（$project_root）${NC}"
        exit 1
    fi

    do_install "$target"
    verify_install "$target"

    echo ""
    echo -e "${CYAN}📝 提交至 Git ...${NC}"
    cd "$project_root"
    # 加入所有已安裝的 skill 目錄
    for dir in "${SKILL_DIRS[@]}"; do
        local name
        name=$(basename "$dir")
        git add ".claude/skills/$name/"
    done
    if git diff --cached --quiet; then
        echo -e "${YELLOW}ℹ️  無新的變更需要提交（skills 可能已是最新版本）${NC}"
    else
        git commit -m "Add/update Vibe-SDLC skills for AI-assisted development workflow"
        echo -e "${GREEN}✅ 已提交至 Git${NC}"
    fi
    echo ""
    echo -e "${YELLOW}提示：請執行 git push 將變更推送至遠端，讓團隊成員也能使用。${NC}"
}

# ── 互動式選擇 ──
interactive_mode() {
    echo -e "${BOLD}請選擇安裝模式：${NC}"
    echo ""
    echo "  1) ${BOLD}global${NC}   — 全域安裝（~/.claude/skills/），所有專案可用"
    echo "  2) ${BOLD}project${NC}  — 專案層級安裝，僅限特定專案"
    echo "  3) ${BOLD}shared${NC}   — 共享安裝，安裝至專案並提交 Git"
    echo ""
    read -rp "請輸入選項 (1/2/3): " choice

    case "$choice" in
        1)
            install_global
            ;;
        2)
            read -rp "目標專案路徑（直接按 Enter 使用當前目錄）: " path
            install_project "${path:-.}"
            ;;
        3)
            read -rp "目標專案路徑（直接按 Enter 使用當前目錄）: " path
            install_shared "${path:-.}"
            ;;
        *)
            echo -e "${RED}無效選項：$choice${NC}"
            exit 1
            ;;
    esac
}

# ── 主程式 ──
main() {
    print_banner

    # 先處理 help，不需要檢查來源
    case "${1:-}" in
        -h|--help|help)
            print_usage
            return 0
            ;;
    esac

    check_source
    list_skills

    case "${1:-}" in
        global)
            install_global
            ;;
        project)
            install_project "${2:-.}"
            ;;
        shared)
            install_shared "${2:-.}"
            ;;
        "")
            interactive_mode
            ;;
        *)
            echo -e "${RED}未知模式：$1${NC}"
            echo ""
            print_usage
            exit 1
            ;;
    esac

    echo ""
    echo -e "${GREEN}${BOLD}🎉 安裝完成！${NC}"
    echo -e "在 Claude Code 中輸入 ${CYAN}/vibe-sdlc${NC} 驗證安裝是否成功。"
    echo ""
}

main "$@"
