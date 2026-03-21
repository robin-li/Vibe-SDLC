<div align="center">

🌐 [繁體中文](./README.md) | [English](./README.en.md) | [简体中文](./README.zh-CN.md) | **Tiếng Việt**

# Vibe-SDLC

**AI-Driven Software Development Lifecycle for Claude Code**

Nâng cấp AI từ "viết code được" lên "chạy được toàn bộ quy trình phát triển phần mềm"

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![GitHub CLI](https://img.shields.io/badge/GitHub_CLI-Required-orange)](https://cli.github.com/)

[Bắt đầu nhanh](#-bắt-đầu-nhanh) · [Quy trình](#-năm-giai-đoạn-phát-triển) · [Cài đặt](#-cài-đặt) · [Ví dụ](./skills/README.md) · [SOP đầy đủ](./Vibe-SDLC.md)

</div>

---

## Vibe-SDLC là gì?

Vibe-SDLC là một quy trình phát triển phần mềm hoàn chỉnh được đóng gói thành **Claude Code Slash Commands**. Nó chuẩn hóa mọi giai đoạn — từ phân tích yêu cầu, viết đặc tả, phân chia task, phát triển & kiểm thử, đến triển khai & bàn giao — cho phép trợ lý AI tự chủ thực thi theo SOP rõ ràng, đồng thời đảm bảo con người luôn nắm quyền quyết định.

> **Triết lý cốt lõi: Con người Quyết định, AI Thực thi, GitHub Quản lý**

| Nguyên tắc | Mô tả |
|------------|-------|
| **Đặc tả là sự thật** | Mọi công việc phát triển lấy file đặc tả trong `/docs` làm nguồn sự thật duy nhất |
| **Không bỏ qua giai đoạn** | Mỗi giai đoạn có điều kiện tiên quyết và điều kiện hoàn thành rõ ràng — phải đạt được mới được tiếp tục |
| **Quản lý phiên bản** | Mọi sửa đổi đặc tả phải cập nhật đồng thời số phiên bản, ngày tháng và bảng ghi chú thay đổi |
| **Đồng bộ tức thì** | Yêu cầu phát sinh, sửa bug hoặc thay đổi đặc tả trong quá trình phát triển phải được phản ánh ngay vào tài liệu đặc tả |

---

## 🚀 Bắt đầu nhanh

### 1. Cài đặt

```bash
git clone https://github.com/anthropics/vibe-sdlc.git
cd vibe-sdlc
./install.sh global    # Cài đặt toàn cục — dùng được cho mọi dự án
```

### 2. Khởi động

Mở [Claude Code](https://docs.anthropic.com/en/docs/claude-code) trong thư mục dự án của bạn và nhập:

```
/vibe-sdlc
```

AI sẽ tự động phát hiện trạng thái dự án, tạo bảng tiến độ và đề xuất bước tiếp theo.

### 3. Bắt đầu phát triển

```
/vibe-sdlc-p1-spec       ← Viết tài liệu đặc tả (PRD, SRD, API Spec, Dev Plan)
/vibe-sdlc-p2-issues     ← Chuyển kế hoạch thành GitHub Issues
/vibe-sdlc-p3-dev        ← Nhận Issue → phát triển → kiểm thử → tự động tạo PR
/vibe-sdlc-p4-pr         ← Giám sát CI → sửa lỗi → merge → cập nhật tiến độ
/vibe-sdlc-p5-release    ← Nghiệm thu milestone → thu thập phản hồi → vòng lặp tiếp theo
```

<details>
<summary><b>💡 Từ ý tưởng đến PR đầu tiên, chỉ cần 3 câu prompt</b></summary>

```
Bạn: /vibe-sdlc-p1-spec
     Tôi muốn xây dựng một app quản lý tài chính cá nhân.
     Hãy thảo luận và giúp tôi viết PRD.
     ...(AI hỗ trợ hoàn thành tất cả tài liệu đặc tả)

Bạn: /vibe-sdlc-p2-issues
     Đặc tả đã hoàn tất, hãy tạo GitHub Issues.

Bạn: /vibe-sdlc-p3-dev
     Hãy xử lý Issue #1.
     ...(AI tự động hoàn thành phát triển, kiểm thử và tạo PR)
```

</details>

### Yêu cầu tiên quyết

| Công cụ | Mục đích | Cài đặt |
|---------|----------|---------|
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | CLI trợ lý phát triển AI | `npm install -g @anthropic-ai/claude-code` |
| [GitHub CLI (`gh`)](https://cli.github.com/) | Thao tác Issues / PR / Project | `brew install gh && gh auth login` |
| Git | Quản lý phiên bản | Tích hợp sẵn |

---

## 📋 Năm giai đoạn phát triển

```
Khởi động dự án
  └→ P1: Định nghĩa đặc tả     Viết PRD / SRD / API Spec / Dev Plan → đánh giá chéo → hoàn tất
      └→ P2: Gắn kết task         Chuyển Dev Plan thành GitHub Issues + bảng Project
          └→ P3: Vòng lặp dev       Nhận Issue → triển khai → kiểm thử → Vibe Check → tự động tạo PR
              └→ P4: CI & Merge        Giám sát CI → sửa lỗi → merge → cập nhật Dev Plan
                  └→ P3: ...              Nhận Issue tiếp theo (lặp P3↔P4)
                      └→ P5: Bàn giao       Milestone hoàn thành → triển khai → phản hồi → quay về P2
```

| Phase | Tên | Slash Command | Mô tả |
|:-----:|-----|---------------|-------|
| — | Bảng tiến độ | `/vibe-sdlc` | Tự động phát hiện trạng thái dự án, tạo bảng tiến độ, điều hướng |
| 1 | Định nghĩa đặc tả & kế hoạch | `/vibe-sdlc-p1-spec` | Viết / đánh giá PRD, SRD, API Spec, UI/UX, Dev Plan, CI/CD Spec |
| 2 | Gắn kết task | `/vibe-sdlc-p2-issues` | Tạo Labels / Milestones → Issues phát triển → Issues xác minh → bảng Project |
| 3 | Vòng lặp phát triển | `/vibe-sdlc-p3-dev` | Nhận Issue → triển khai → kiểm thử → Vibe Check → tự động tạo PR |
| 4 | Giám sát CI & hậu merge | `/vibe-sdlc-p4-pr` | Giám sát CI → sửa lỗi → merge → cập nhật Dev Plan → nhắc xác minh |
| 5 | Bàn giao & lặp lại | `/vibe-sdlc-p5-release` | Triển khai → nghiệm thu → thu thập phản hồi → cập nhật đặc tả → vòng lặp tiếp |

---

## ✨ Tính năng chính

### 📄 Hệ thống tài liệu đặc tả

Tất cả file đặc tả lưu trong `/docs`, là nguồn sự thật duy nhất (Single Source of Truth):

| Tài liệu | Đường dẫn | Mô tả |
|-----------|-----------|-------|
| PRD | `/docs/01-1-PRD.md` | Yêu cầu sản phẩm, user story, danh sách tính năng |
| SRD | `/docs/01-2-SRD.md` | Tech stack, kiến trúc, bảo mật & hiệu năng |
| API Spec | `/docs/01-3-API_Spec.md` + `API_Spec.yaml` | Mô tả API endpoint + hợp đồng OpenAPI |
| UI/UX Design | `/docs/01-4-UI_UX_Design.md` | Đặc tả thiết kế giao diện & tương tác (nếu có) |
| Dev Plan | `/docs/02-Dev_Plan.md` | Milestone, phân chia task, phân công vai trò, chiến lược Git |
| Báo cáo đánh giá | `/docs/03-Docs_Review_Report.md` | Kết quả đối chiếu chéo của AI, bao gồm mâu thuẫn và thiếu sót |
| CI/CD Spec | `/docs/04-CI_CD_Spec.md` | CI Workflow, cổng chất lượng, cấu hình Docker (tùy chọn) |

> 📁 Xem ví dụ đầy đủ tại [`skills/vibe-sdlc-p1-spec/examples/docs/`](./skills/vibe-sdlc-p1-spec/examples/docs/)

### 💬 Theo dõi trạng thái Issue

Issue là kênh giao tiếp duy nhất xuyên suốt các session. AI tự động đăng comment tại các thời điểm quan trọng:

| Thời điểm | Comment |
|-----------|---------|
| Nhận task | 🚀 **Nhận Task** — vai trò, branch, worktree |
| Bị chặn | 📋 **Cập nhật tiến độ** — lý do bị chặn |
| Vibe Check đạt | ✅ **Vibe Check Đạt** — tự động tạo PR kèm link |
| Sau khi merge PR | 🎉 **Task Hoàn thành** — cập nhật Dev Plan, liệt kê Issues cần xác minh |

### 🤖 Phát triển song song Multi Sub Agent

Hỗ trợ sẵn phát triển song song với nhiều Sub Agent, sử dụng `API_Spec.yaml` làm hợp đồng tách biệt frontend-backend:

- **Cách ly Worktree** — mỗi Sub Agent sử dụng Git Worktree độc lập
- **Đặt tên branch** — `feat/<agent>/<issue-N>-<mô-tả>`
- **Đánh giá PR hai lớp** — Sub Agent PR → CI → A-Main đánh giá → H-Director duyệt cuối
- **Giới hạn phạm vi PR** — A-Backend chỉ được sửa `/backend/**`, vi phạm sẽ bị từ chối

### 🛡️ Cơ chế kiểm tra an toàn

- **Kiểm tra an toàn khi push commit** — xác nhận PR vẫn OPEN trước khi push, tránh push vào branch đã merge
- **Xử lý test thất bại có sẵn** — AI tự động phân loại (flaky / bug có sẵn / do thay đổi hiện tại) rồi quyết định cách xử lý
- **Nguyên tắc tự giải quyết** — gặp vấn đề ưu tiên tự điều tra và giải quyết, chỉ báo cáo khi không thể xử lý

---

## 👥 Vai trò cốt lõi

| Loại | Mã | Tên | Trách nhiệm |
|:----:|----|-----|-------------|
| 🧑 Con người | `H-Director` | Đạo diễn | Quyết định tối cao, đánh giá đặc tả, nghiệm thu milestone, merge PR |
| 🧑 Con người | `H-Reviewer` | Đánh giá viên | Đánh giá chuyên lĩnh vực (UX / bảo mật), có thể do Director kiêm nhiệm |
| 🤖 AI | `A-Main` | Agent chính | Điều phối task, phối hợp Sub Agent, tích hợp xác minh |
| 🤖 AI | `A-Backend` | Agent backend | Chuyên `/backend/**`: API, DB, ORM |
| 🤖 AI | `A-Frontend` | Agent frontend | Chuyên `/frontend/**`: UI, quản lý state, API Client |
| 🤖 AI | `A-QA` | Agent QA | Chuyên `/tests/**`: kiểm thử E2E, độ phủ |
| 🤖 AI | `A-DevOps` | Agent DevOps | Chuyên CI/CD, Docker, cấu hình giám sát |

---

## 📦 Cài đặt

### Cài đặt một lệnh (Khuyên dùng)

```bash
./install.sh                               # Chế độ tương tác
./install.sh global                        # Cài đặt toàn cục
./install.sh project /path/to/my-project   # Cài vào dự án cụ thể
./install.sh shared  /path/to/my-project   # Cài vào dự án và commit vào Git
```

<details>
<summary>Cài đặt thủ công</summary>

```bash
# Cài đặt toàn cục (dùng cho mọi dự án)
cp -r skills/vibe-sdlc* ~/.claude/skills/
cp -r skills/local-tunnel ~/.claude/skills/

# Cài đặt cấp dự án (chỉ dùng cho dự án cụ thể)
mkdir -p /path/to/my-project/.claude/skills
cp -r skills/vibe-sdlc* /path/to/my-project/.claude/skills/
cp -r skills/local-tunnel /path/to/my-project/.claude/skills/
```

</details>

Sau khi cài đặt, nhập `/vibe-sdlc` để xác minh — bạn sẽ thấy bảng tiến độ.

---

## 🗂️ Cấu trúc thư mục

```
Vibe-SDLC/
├── README.md                          ← File này (繁體中文)
├── README.vi.md                       ← Phiên bản tiếng Việt
├── README.en.md                       ← English version
├── CLAUDE.md                          ← Hướng dẫn dự án Claude Code
├── Vibe-SDLC.md                       ← Tài liệu SOP đầy đủ (v8.1)
├── install.sh                         ← Script cài đặt một lệnh
└── skills/                            ← Tài nguyên phát hành Skills
    ├── README.md                      ← Tài liệu chi tiết & ví dụ
    ├── DEPLOY.md                      ← Hướng dẫn triển khai
    ├── local-tunnel/skill.md          ← Phát hành dịch vụ local ra public
    ├── vibe-sdlc/skill.md             ← Tổng quan & điều hướng
    ├── vibe-sdlc-p1-spec/             ← Phase 1 + examples/docs/
    ├── vibe-sdlc-p2-issues/skill.md   ← Phase 2: Gắn kết task
    ├── vibe-sdlc-p3-dev/skill.md      ← Phase 3: Vòng lặp phát triển
    ├── vibe-sdlc-p4-pr/skill.md       ← Phase 4: Giám sát CI & hậu merge
    └── vibe-sdlc-p5-release/skill.md  ← Phase 5: Bàn giao & lặp lại
```

---

## 📚 Tài liệu liên quan

| Tài liệu | Mô tả |
|-----------|-------|
| [`Vibe-SDLC.md`](./Vibe-SDLC.md) | Tài liệu SOP đầy đủ (v8.1) với mọi chi tiết quy trình |
| [`skills/README.md`](./skills/README.md) | Tài liệu chi tiết Skills, vai trò từng Phase & ví dụ sử dụng |
| [`skills/DEPLOY.md`](./skills/DEPLOY.md) | Hướng dẫn triển khai chi tiết |
| [`skills/vibe-sdlc-p1-spec/examples/docs/`](./skills/vibe-sdlc-p1-spec/examples/docs/) | Ví dụ đầy đủ tài liệu đặc tả |

---

## 📄 License

[MIT](LICENSE)
