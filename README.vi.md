<div align="center">

🌐 [繁體中文](./README.md) | [English](./README.en.md) | [简体中文](./README.zh-CN.md) | **Tiếng Việt**

# Vibe-SDLC

**AI-Driven Software Development Lifecycle for Claude Code**

Nâng cấp AI từ "viết code được" lên "chạy được toàn bộ quy trình phát triển phần mềm"

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude_Code-Skills-blueviolet)](https://docs.anthropic.com/en/docs/claude-code)
[![GitHub CLI](https://img.shields.io/badge/GitHub_CLI-Required-orange)](https://cli.github.com/)

[Bắt đầu nhanh](#-bắt-đầu-nhanh) · [Quy trình](#-năm-giai-đoạn-phát-triển) · [Cài đặt](#-cài-đặt) · [Ví dụ](#-ví-dụ-sử-dụng) · [SOP đầy đủ](./Vibe-SDLC.md)

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
| **Phân loại tức thì** | Khi nhà phát triển báo bug/yêu cầu trực tiếp, AI hỏi cách xử lý (sửa ngay / tạo Issue / hoãn lại) trước khi hành động |

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
/vibe-sdlc-spec       ← Viết tài liệu đặc tả (PRD, SRD, API Spec, Dev Plan)
/vibe-sdlc-issues     ← Chuyển kế hoạch thành GitHub Issues
/vibe-sdlc-dev        ← Nhận Issue → phát triển → kiểm thử → tự động tạo PR
/vibe-sdlc-pr         ← Giám sát CI → sửa lỗi → merge → cập nhật tiến độ
/vibe-sdlc-release    ← Nghiệm thu milestone → thu thập phản hồi → vòng lặp tiếp theo
/vibe-sdlc-status     ← Truy vấn trạng thái Agent → Tổng hợp STATUS.md
```

<details>
<summary><b>💡 Từ ý tưởng đến PR đầu tiên, chỉ cần 3 câu prompt</b></summary>

```
Bạn: /vibe-sdlc-spec
     Tôi muốn xây dựng một app quản lý tài chính cá nhân.
     Hãy thảo luận và giúp tôi viết PRD.
     ...(AI hỗ trợ hoàn thành tất cả tài liệu đặc tả)

Bạn: /vibe-sdlc-issues
     Đặc tả đã hoàn tất, hãy tạo GitHub Issues.

Bạn: /vibe-sdlc-dev
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
| 1 | Định nghĩa đặc tả & kế hoạch | `/vibe-sdlc-spec` | Viết / đánh giá PRD, SRD, API Spec, UI/UX, Dev Plan, CI/CD Spec |
| 2 | Gắn kết task | `/vibe-sdlc-issues` | Tạo Labels / Milestones → Issues phát triển → Issues xác minh → bảng Project |
| 3 | Vòng lặp phát triển | `/vibe-sdlc-dev` | Nhận Issue → triển khai → kiểm thử → Vibe Check → tự động tạo PR |
| 4 | Giám sát CI & hậu merge | `/vibe-sdlc-pr` | Giám sát CI → sửa lỗi → merge → cập nhật Dev Plan → nhắc xác minh |
| 5 | Bàn giao & lặp lại | `/vibe-sdlc-release` | Triển khai → nghiệm thu → thu thập phản hồi → cập nhật đặc tả → vòng lặp tiếp |
| — | Truy vấn trạng thái Agent | `/vibe-sdlc-status` | Truy vấn trạng thái Agent → Tổng hợp STATUS.md → Cảnh báo bất thường |

---

## ✨ Tính năng chính

### 📄 Hệ thống tài liệu đặc tả

Tất cả file đặc tả lưu trong `/docs`, là nguồn sự thật duy nhất (Single Source of Truth):

| Tài liệu | Đường dẫn | Mô tả |
|-----------|-----------|-------|
| Docs Index | `/docs/00-Docs_Index.md` | Điểm vào & điều hướng: liệt kê tất cả tài liệu đặc tả, thời điểm tạo, quan hệ phụ thuộc |
| PRD | `/docs/01-1-PRD.md` | Yêu cầu sản phẩm, user story, danh sách tính năng |
| SRD | `/docs/01-2-SRD.md` | Yêu cầu phi chức năng, triển khai, bảo mật & hiệu năng |
| SDD | `/docs/01-3-SDD.md` | Kiến trúc hệ thống, thiết kế component, mô hình dữ liệu, ghi nhận quyết định kiến trúc (ADR) |
| GDD | `/docs/01-4-GDD.md` | Tài liệu thiết kế game: cơ chế cốt lõi, cân bằng số liệu, thiết kế màn (tuỳ lĩnh vực) |
| API Spec | `/docs/01-5-API_Spec.md` + `API_Spec.yaml` | Mô tả API endpoint + hợp đồng OpenAPI |
| UI/UX Design | `/docs/01-6-UI_UX_Design.md` + `/docs/ui/*.html` | Đặc tả thiết kế giao diện & tương tác (tuỳ chọn) + wireframe HTML + Tailwind làm tham chiếu; tuân thủ 9 nguyên tắc trong [UI_UX_Writing_Guidelines](./skills/vibe-sdlc-spec/references/UI_UX_Writing_Guidelines.md) |
| Dev Plan | `/docs/02-Dev_Plan.md` | Milestone, phân chia task, phân công vai trò, chiến lược Git |
| Báo cáo đánh giá | `/docs/03-Docs_Review_Report.md` | Kết quả đối chiếu chéo của AI, bao gồm mâu thuẫn và thiếu sót |
| CI/CD Spec | `/docs/04-CI_CD_Spec.md` | CI Workflow, cổng chất lượng, cấu hình Docker (tùy chọn) |

> 📁 Xem ví dụ đầy đủ tại [`skills/vibe-sdlc-spec/examples/docs/`](./skills/vibe-sdlc-spec/examples/docs/)

### 💬 Theo dõi trạng thái Issue

Issue là kênh giao tiếp duy nhất xuyên suốt các session. AI tự động đăng comment tại các thời điểm quan trọng:

| Thời điểm | Comment |
|-----------|---------|
| Nhận task | 🚀 **Nhận Task** — vai trò, branch, worktree |
| Bị chặn | 📋 **Cập nhật tiến độ** — lý do bị chặn |
| Vibe Check đạt | ✅ **Vibe Check Đạt** — tự động tạo PR kèm link |
| Sau khi merge PR | 🎉 **Task Hoàn thành** — cập nhật Dev Plan, liệt kê Issues cần xác minh |

### 📊 Tổng hợp STATUS.md & chiến lược version control

Mỗi Agent duy trì file trạng thái riêng (`/docs/status/A-*.md`), A-Main tổng hợp thành `STATUS.md` toàn cục. Mỗi dự án **bắt buộc** chọn một trong ba chế độ version control và khai báo trong `CLAUDE.md`:

| Chế độ | Phù hợp với |
|--------|-------------|
| **A: Version control toàn phần** | Cộng tác nhiều người, cần truy vết lịch sử đầy đủ |
| **B: Bỏ qua hoàn toàn** | Cá nhân một máy, STATUS chỉ là snapshot local |
| **C: Hỗn hợp** (mặc định khuyến nghị) | Cá nhân nhiều máy, chỉ `STATUS.md` được version control |

> Chi tiết xem [Vibe-SDLC.md §9.4](./Vibe-SDLC.md#94-statusmd-版控策略). Nếu chưa khai báo, A-Main sẽ chủ động hỏi và hỗ trợ cấu hình khi chạy `/vibe-sdlc-status` lần đầu.

### 🤖 Phát triển song song Multi Sub Agent

Hỗ trợ sẵn phát triển song song với nhiều Sub Agent, sử dụng `API_Spec.yaml` làm hợp đồng tách biệt frontend-backend:

- **Cách ly Worktree** — mỗi Sub Agent sử dụng Git Worktree độc lập
- **Chiến lược branch** — ⛔ Nghiêm cấm push trực tiếp vào main. Có Issue → `feat/<agent>/<issue-N>-<mô-tả>`; Không có Issue (sửa nhỏ) → `dev/main-agent`
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

## 💡 Ví dụ sử dụng

Dưới đây minh họa cách nhà phát triển (đạo diễn) tương tác với trợ lý AI ở từng giai đoạn.

### Tình huống 1: Kiểm tra tiến độ dự án — Bảng tiến độ

```
> /vibe-sdlc
```

AI sẽ tự động thu thập dữ liệu GitHub Issues, PR, trạng thái CI và tạo **bảng tiến độ**, bao gồm:
- Tiến độ hoàn thành từng milestone (thanh tiến độ + phần trăm)
- PR đang chờ duyệt và trạng thái CI
- Issue đang thực hiện và Issue chờ xác minh
- PR được merge gần đây
- Phát hiện Phase hiện tại và đưa ra đề xuất cụ thể

Phù hợp sử dụng khi bắt đầu ngày làm việc hoặc khi không chắc bước tiếp theo là gì.

---

### Tình huống 2: Phase 1 — Viết tài liệu đặc tả

**Bắt đầu viết PRD từ đầu:**

```
> /vibe-sdlc-spec
> Tôi muốn phát triển một Todo List API, hỗ trợ thao tác CRUD. Người dùng cần đăng nhập mới truy cập được todo của mình.
> Hãy giúp tôi viết PRD.
```

**Đã có đặc tả, yêu cầu đánh giá chéo:**

```
> /vibe-sdlc-spec
> Tôi đã đặt PRD, SRD, API Spec, Dev Plan vào /docs rồi. Hãy thực hiện đánh giá chéo.
```

**Sửa theo kết quả đánh giá:**

```
> Mục #3 trong báo cáo đánh giá nói SRD thiếu đặc tả rate limiting. Hãy bổ sung —
> giới hạn 60 request mỗi người dùng mỗi phút.
```

---

### Tình huống 3: Phase 2 — Tạo GitHub Issues

**Kiểm tra Dev Plan và tạo Issues (sau khi báo cáo đánh giá đạt):**

```
> /vibe-sdlc-issues
> Đặc tả đã hoàn tất, báo cáo đánh giá xác nhận không có vấn đề. Hãy tạo GitHub Issues.
```

**Chỉ tạo Issues cho milestone cụ thể:**

```
> /vibe-sdlc-issues
> Tạm thời chỉ tạo Issues cho Milestone 1. M2 trở đi đợi M1 xong rồi tính.
```

---

### Tình huống 4: Phase 3 — Vòng lặp phát triển hàng ngày

**Giao Issue cho AI phát triển:**

```
> /vibe-sdlc-dev
> Hãy xử lý Issue #5 — triển khai API đăng ký người dùng.
```

Sau khi hoàn thành phát triển và kiểm thử, khi Vibe Check đạt, AI sẽ **ngay lập tức push branch và tạo PR**, sau đó báo cáo kết quả kèm link PR. Trong quá trình phát triển, gặp vấn đề AI sẽ ưu tiên tự điều tra và giải quyết — chỉ báo cáo khi không thể xử lý. Bạn chỉ cần Code Review trên GitHub.

**Thêm yêu cầu trong quá trình AI phát triển:**

```
> Thêm một test case: khi định dạng email không hợp lệ phải trả về 400 Bad Request.
```

**Phát hiện vấn đề khi Code Review:**

```
> Hãy đổi sang dùng bcrypt để hash mật khẩu, đừng dùng SHA-256. Sửa xong push lại.
```

---

### Tình huống 5: Phase 4 — Giám sát CI & hậu merge

**Khi CI thất bại (PR đã được Phase 3 tự động tạo):**

```
> /vibe-sdlc-pr
> CI bị lỗi rồi, đây là báo cáo lỗi: [dán thông báo lỗi CI]
> Hãy phân tích nguyên nhân và sửa.
```

**Cập nhật tiến độ sau merge:**

```
> PR đã merge rồi, hãy cập nhật trạng thái task trong Dev Plan.
> Trên board còn Issue nào không? Nếu còn thì tiếp tục xử lý cái tiếp theo.
```

---

### Tình huống 6: Phase 5 — Bàn giao milestone

**Xác nhận trạng thái hoàn thành milestone:**

```
> /vibe-sdlc-release
> Tất cả Issue của M1 lẽ ra đã merge xong, hãy xác nhận và tạo báo cáo hoàn thành.
```

**Đưa ra phản hồi và khởi động vòng lặp tiếp theo:**

```
> Môi trường test đã chạy xong, có vài phản hồi:
> 1. Trang danh sách cần chức năng phân trang (yêu cầu mới)
> 2. Thao tác xóa nên đổi thành soft delete (thay đổi yêu cầu)
> 3. Nội dung trang đăng nhập trông không ổn (tạm hoãn)
> Hãy giúp tôi tổng hợp và cập nhật PRD và Dev Plan.
```

---

### Tình huống 7: Báo cáo Bug hoặc yêu cầu mới khi kiểm thử/nghiệm thu — Quy trình Thu thập & Phân luồng Issue

Khi bạn **mô tả trực tiếp Bug, yêu cầu mới hoặc góp ý cải thiện** trong quá trình phát triển, kiểm thử hoặc nghiệm thu (ví dụ "XX hỏng rồi", "tôi muốn XX"), AI sẽ lập tức dừng lại, không đụng vào bất kỳ file nào, rồi đưa ra 5 lựa chọn xử lý. Đây là cơ chế cốt lõi của Vibe-SDLC (Nguyên tắc cốt lõi #6), có thể được kích hoạt ở bất kỳ Phase 3, 4 hoặc 5 nào.

**Tình huống: Phát hiện vấn đề và yêu cầu mới trong lúc nghiệm thu M1**

```
> Tôi vừa thử luồng đăng ký trên môi trường test, phát hiện kiểm tra độ dài mật khẩu chỉ ở 6 ký tự, lẽ ra phải ít nhất 8.
> Ngoài ra trang danh sách tải hơi chậm, muốn thêm chức năng phân trang.
```

```
📋 Tùy chọn theo dõi Issue
─────────────────
Bạn đã báo cáo:
  - [Bug] Kiểm tra độ dài mật khẩu nên tăng từ 6 lên 8 ký tự
  - [Feature] Thêm phân trang cho trang danh sách

Vui lòng chọn cách xử lý:
  1️⃣  Vấn đề nhỏ, sửa trực tiếp (không tạo Issue)
  2️⃣  Tạo Issue rồi sửa ngay
  3️⃣  Ghi lại trước, lát nữa tạo Issues theo lô
  4️⃣  Kết thúc thu thập, tạo Issues theo lô và bắt đầu phát triển
  5️⃣  Kết thúc thu thập, tạo Issues theo lô và đợi chỉ thị

Chọn (1/2/3/4/5):
```

**Hướng dẫn tùy chọn**:

| Nội dung báo cáo | Tùy chọn gợi ý | Hành vi của AI |
|---|:---:|---|
| Typo, chỉnh copy, config đơn giản | **1** | Sửa trực tiếp trên nhánh `dev/main-agent` và tạo PR |
| Một Bug hoặc một yêu cầu cần xử lý ngay | **2** | Tạo Issue → vào P3 → tự động tạo PR |
| Nhiều phản hồi cần thu thập trước | **3** | Lưu danh sách; khi bạn nói "tổng hợp báo cáo" thì tạo theo lô |
| Danh sách đã xác nhận, làm ngay toàn bộ | **4** | Tạo Issues theo lô → vào P3 theo thứ tự ưu tiên |
| Danh sách đã xác nhận, review ưu tiên trước | **5** | Tạo Issues theo lô → dừng và chờ |

**Ví dụ hội thoại tùy chọn 4 (xử lý nhiều phản hồi sau nghiệm thu):**

```
> 4
> Mục 1 là Bug P0 cho M1, mục 2 là yêu cầu mới vào backlog M2.
```

AI sẽ lần lượt xác nhận tiêu đề, Labels, Milestone của từng Issue, thực thi `gh issue create` theo lô, sau đó trực tiếp nhận Issue P0 để vào vòng lặp phát triển Phase 3. Nếu nội dung báo cáo liên quan đến thay đổi PRD / API Spec, AI sẽ **cập nhật truy ngược ngay lập tức** các file đặc tả tương ứng và tăng phiên bản sau khi xử lý (Nguyên tắc cốt lõi #4, #5).

> 💡 **Khi nào KHÔNG kích hoạt**: Nhận Issue có sẵn qua `/vibe-sdlc-dev`, câu hỏi thuần túy về code, hoặc khi bạn nói rõ "sửa luôn đi" / "sửa nhanh" — AI sẽ thực thi ngay không hỏi lại.

---

### Tình huống 8: Phát triển song song Multi Sub Agent

**Để AI tạo Dev Plan có chiến lược Git:**

```
> /vibe-sdlc-spec
> Dev Plan hãy dùng kiến trúc Multi Sub Agent, gồm A-Backend, A-Frontend, A-QA, A-DevOps,
> và thêm cấu hình Worktree cùng quy trình đánh giá PR hai lớp theo đặc tả.
```

**Sub Agent tự động tạo PR sau khi Vibe Check đạt:**

```
> /vibe-sdlc-dev
> Tôi là A-Backend. Hãy xử lý Issue #12 — triển khai Auth API.
(AI hoàn thành phát triển → Vibe Check → tự động tạo PR)
```

**A-Main giám sát CI và điều phối merge:**

```
> /vibe-sdlc-pr
> PR #34 CI đã pass, A-Main đã sơ duyệt xác nhận phạm vi đúng (chỉ sửa /backend/**).
> Xin mời H-Director thực hiện duyệt cuối.
```

---

### Mẹo sử dụng prompt

| Mẹo | Mô tả | Ví dụ |
|-----|-------|-------|
| **Giao việc rõ ràng** | Nói AI xử lý Issue nào | `Hãy xử lý Issue #12` |
| **Đặt ràng buộc** | Chỉ định công nghệ hoặc giới hạn | `Dùng PostgreSQL, không dùng SQLite` |
| **Từng bước một** | Mỗi lần chỉ làm một giai đoạn | `Chỉ đánh giá Dev Plan, đừng tạo Issues` |
| **Tham chiếu đặc tả** | Trỏ đến phần cụ thể | `Xem yêu cầu bảo mật ở SRD mục 3.2` |
| **Cung cấp ngữ cảnh** | Dán thông báo lỗi hoặc ảnh chụp | `CI báo lỗi: [thông báo lỗi]` |
| **Xác nhận hàng loạt** | Duyệt nhiều mục cùng lúc | `Chấp nhận tất cả đề xuất trong báo cáo, sửa một lần` |

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
    ├── vibe-sdlc-spec/             ← Phase 1 + examples/docs/
    ├── vibe-sdlc-issues/skill.md   ← Phase 2: Gắn kết task
    ├── vibe-sdlc-dev/skill.md      ← Phase 3: Vòng lặp phát triển
    ├── vibe-sdlc-pr/skill.md       ← Phase 4: Giám sát CI & hậu merge
    ├── vibe-sdlc-release/skill.md  ← Phase 5: Bàn giao & lặp lại
    └── vibe-sdlc-status/skill.md  ← Truy vấn & tổng hợp trạng thái Agent
```

---

## 📚 Tài liệu liên quan

| Tài liệu | Mô tả |
|-----------|-------|
| [`Vibe-SDLC.md`](./Vibe-SDLC.md) | Tài liệu SOP đầy đủ (v8.1) với mọi chi tiết quy trình |
| [`skills/README.md`](./skills/README.md) | Tài liệu chi tiết Skills, vai trò từng Phase & ví dụ sử dụng |
| [`skills/DEPLOY.md`](./skills/DEPLOY.md) | Hướng dẫn triển khai chi tiết |
| [`skills/vibe-sdlc-spec/examples/docs/`](./skills/vibe-sdlc-spec/examples/docs/) | Ví dụ đầy đủ tài liệu đặc tả |

---

## 📄 License

[MIT](LICENSE)
