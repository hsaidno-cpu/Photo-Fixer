# Panduan Adaptasi Lintas-Platform

## Prinsip

Satu sumber instruksi PHOTO FIXER disimpan dalam Markdown dan YAML frontmatter. Struktur ini mengikuti pola Agent Skills: satu folder per skill, satu berkas SKILL.md, dan referensi tambahan yang dipanggil saat diperlukan.

Kesamaan format tidak berarti setiap aplikasi memiliki cara pemasangan, pemanggilan, tool gambar, atau kemampuan yang sama. Periksa dokumentasi platform sebelum memasang atau mengandalkan fitur tertentu.

## Lokasi skill yang digunakan paket ini

| Platform | Lokasi umum |
|---|---|
| Codex | .agents/skills |
| Claude Code | .claude/skills |
| GitHub Copilot | .github/skills atau .copilot/skills, bergantung pada pengalaman |
| Gemini CLI | .gemini/skills atau .agents/skills |
| Cursor | .cursor/skills atau .agents/skills |
| Agen lain yang mengikuti Agent Skills | Ikuti folder skill dan SKILL.md sesuai dokumentasi agen tersebut |

## Aturan adaptasi

1. Pertahankan isi SKILL.md utama dan subskill.
2. Pertahankan referensi relatif atau salin seluruh folder referensi bersamanya.
3. Bila platform tidak mendukung pemanggilan subskill, gunakan isi subskill sebagai bagian instruksi/handoff internal.
4. Bila platform tidak mendukung slash command, gunakan nama perintah sebagai teks biasa.
5. Bila platform tidak mendukung tool edit gambar, keluarkan prompt dan instruksi, jangan klaim gambar sudah diedit.
6. Jangan membuat adapter khusus sebelum ada kebutuhan nyata atau dokumentasi API yang jelas.

## ChatGPT dan GPT khusus

Skill yang didukung aplikasi ChatGPT dapat memakai berkas instruksi dan referensi. Untuk GPT khusus yang menggunakan Instructions dan Knowledge:
- masukkan alur kerja ringkas PHOTO FIXER ke Instructions;
- unggah katalog perintah, checklist, dan preset sebagai Knowledge;
- sebutkan bahwa foto harus diberikan sebagai input pada percakapan;
- gunakan fitur gambar yang benar-benar tersedia pada model/akun tersebut.

Paket di repository ini belum otomatis terpasang pada akun ChatGPT dan belum menjadi aplikasi yang dapat dicari di direktori aplikasi. Distribusi melalui plugin resmi memerlukan proses pengemasan dan pendaftaran tersendiri.

## Ketentuan kejujuran kompatibilitas

Status platform harus dibedakan:
- FORMAT_COMPATIBLE: format berkas dapat dibaca.
- DISCOVERY_SUPPORTED: platform dapat menemukan skill pada lokasi tertentu.
- TOOL_COMPATIBLE: tool edit gambar tersedia.
- BEHAVIOR_TESTED: perilaku telah diuji pada versi platform/model yang dicatat.

Jangan menyebut platform didukung penuh hanya karena bisa membaca Markdown.
