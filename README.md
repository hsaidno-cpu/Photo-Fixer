# PHOTO FIXER

**Photo Fixer** adalah satu paket skill AI untuk memperbaiki, memulihkan, dan mengolah foto dengan alur kerja yang terarah. Tujuan utamanya bukan membuat semua foto terlihat seperti hasil filter, melainkan menghasilkan edit yang sesuai kebutuhan sambil menjaga bagian penting dari foto asli.

Paket ini memakai satu skill utama sebagai pengatur kerja dan 11 subskill khusus. Semua instruksi inti ditulis dalam Markdown dengan format Agent Skills agar mudah dipindahkan ke berbagai agen AI yang mendukung format tersebut.

> **Prinsip utama:** perbaiki bagian yang diminta, pertahankan bagian lain, dan jangan mengarang detail yang tidak terlihat pada foto asli.

## 1. Yang bisa dilakukan

- Retouch potret secara alami tanpa menghilangkan tekstur kulit.
- Menjaga bentuk wajah, ekspresi, pose, dan ciri visual subjek.
- Memulihkan foto lama, pudar, tergores, berdebu, atau rusak.
- Memperbaiki pencahayaan, warna, kontras, white balance, dan tampilan film.
- Menghapus objek atau merapikan latar sesuai instruksi.
- Mengganti latar dan membuat komposisi foto baru yang tetap masuk akal.
- Membuat foto produk, kendaraan, potret profesional, dan materi media sosial.
- Menambah ketajaman atau resolusi dengan batasan agar detail tidak dibuat-buat.
- Memeriksa hasil akhir agar perubahan tidak melebar ke bagian yang tidak diminta.

Photo Fixer adalah **paket instruksi untuk AI**, bukan aplikasi editor foto mandiri. Hasil edit langsung hanya dapat dibuat bila platform yang digunakan memiliki fitur edit/generasi gambar. Tanpa kemampuan tersebut, Photo Fixer akan menyusun prompt dan arahan kerja yang siap dipakai di editor lain.

## 2. Arsitektur paket

Satu paket, satu pengatur utama, sebelas subskill:

| Bagian | Fokus |
|---|---|
| photo-fixer | Mengatur permintaan, memilih subskill, menjaga konsistensi, dan menyatukan hasil |
| photo-fixer-image-assessment | Memeriksa foto, memahami tujuan, dan menentukan bagian yang boleh diubah |
| photo-fixer-portrait-retouch | Retouch kulit dan potret dengan hasil alami |
| photo-fixer-photo-restoration | Memulihkan foto lama dan memperbaiki kerusakan |
| photo-fixer-lighting-film | Mengatur pencahayaan, suasana, dan tampilan film |
| photo-fixer-color-correction | Memperbaiki warna, kontras, dan rentang terang-gelap |
| photo-fixer-background-object-editing | Merapikan latar, menghapus objek, dan membuat blur |
| photo-fixer-scene-compositing | Mengganti lokasi, latar, atau menyatukan elemen foto |
| photo-fixer-product-vehicle-photography | Mengolah foto produk, mobil, dan motor |
| photo-fixer-social-formatting | Menyiapkan foto untuk sampul dan media sosial |
| photo-fixer-detail-upscaling | Menajamkan dan memperbesar gambar secara terkendali |
| photo-fixer-quality-control | Memeriksa kesesuaian hasil, bagian yang dipertahankan, dan cacat edit |

Subskill dipisahkan sebagai folder skill sendiri agar platform yang mendukung Agent Skills dapat menemukannya. Skill utama tetap menjadi pintu masuk yang mengatur urutan dan handoff.

## 3. Instalasi cepat

### A. Windows PowerShell

Pastikan Git sudah terpasang. Buka PowerShell, lalu jalankan:

~~~powershell
git clone https://github.com/hsaidno-cpu/Photo-Fixer.git
cd Photo-Fixer
.\install.ps1 -Target agents
~~~

Perintah tersebut memasang semua skill ke folder pengguna:

~~~text
%USERPROFILE%\.agents\skills\
~~~

Folder ini merupakan lokasi umum yang dikenali beberapa agen AI. Untuk memasang ke lokasi khusus, lihat pilihan target di bagian instalasi lengkap.

### B. macOS dan Linux

Buka Terminal, lalu jalankan:

~~~bash
git clone https://github.com/hsaidno-cpu/Photo-Fixer.git
cd Photo-Fixer
chmod +x ./install.sh
./install.sh agents
~~~

Secara bawaan, pemasangan masuk ke:

~~~text
~/.agents/skills/
~~~

### C. Instalasi manual

1. Unduh repository melalui tombol **Code → Download ZIP**, lalu ekstrak.
2. Buka folder hasil ekstrak.
3. Salin semua folder di dalam **.agents/skills/** ke folder skill pada platform yang digunakan.
4. Tutup dan buka kembali aplikasi AI bila skill belum muncul.
5. Ketik **photo fixer** atau perintah edit foto untuk menguji apakah skill dikenali.

Jangan hanya menyalin berkas SKILL.md utama. Folder referensi berisi katalog perintah dan daftar pemeriksaan yang dibutuhkan oleh skill.

## 4. Pilihan lokasi pemasangan

Installer mendukung beberapa lokasi berikut.

| Target | Windows / lokasi pengguna | Lokasi proyek |
|---|---|---|
| agents | $HOME/.agents/skills | .agents/skills |
| codex | $HOME/.agents/skills | .agents/skills |
| claude | $HOME/.claude/skills | .claude/skills |
| copilot | $HOME/.copilot/skills | .github/skills |
| gemini | $HOME/.gemini/skills | .gemini/skills |
| cursor | $HOME/.cursor/skills | .cursor/skills |
| all | Semua lokasi di atas | Semua lokasi di atas |

Contoh PowerShell:

~~~powershell
# Pasang untuk Claude Code
.\install.ps1 -Target claude

# Pasang untuk GitHub Copilot
.\install.ps1 -Target copilot

# Pasang untuk Gemini CLI
.\install.ps1 -Target gemini

# Pasang untuk Cursor
.\install.ps1 -Target cursor

# Pasang ke semua lokasi yang didukung installer
.\install.ps1 -Target all

# Pasang ke folder proyek tertentu
.\install.ps1 -Target agents -Scope Project -ProjectPath "D:\ProyekSaya"
~~~

Contoh macOS/Linux:

~~~bash
./install.sh claude
./install.sh copilot
./install.sh gemini
./install.sh cursor
./install.sh all
~~~

Installer tidak menghapus folder lama. Bila folder skill dengan nama yang sama sudah ada, pemasangan bawaan akan melewatinya agar perubahan pribadi tidak tertimpa. Untuk memperbarui, jalankan PowerShell dengan **-Force** setelah memastikan tidak ada perubahan lokal yang ingin disimpan:

~~~powershell
.\install.ps1 -Target agents -Force
~~~

Pada install.sh, installer melewati folder yang sudah ada. Hapus atau pindahkan folder tujuan terlebih dahulu bila ingin menggantinya.

## 5. Panduan singkat per platform

### OpenAI Codex

Lokasi yang disarankan adalah **.agents/skills/** di dalam proyek atau **~/.agents/skills/** untuk penggunaan pribadi. Sesudah instalasi, buka ulang Codex bila Photo Fixer belum terdeteksi. Anda dapat meminta: “Gunakan photo-fixer untuk memperbaiki pencahayaan foto ini.”

Dokumentasi: https://developers.openai.com/codex/skills/

### Claude Code

Pasang ke **.claude/skills/** pada proyek atau **~/.claude/skills/** untuk penggunaan pribadi. Jalankan Claude Code dari proyek tersebut, lalu minta Claude memakai Photo Fixer. Skill utama dan subskill dipasang bersama.

Dokumentasi: https://docs.anthropic.com/en/docs/claude-code/skills

### GitHub Copilot

Untuk proyek, gunakan **.github/skills/**. Untuk penggunaan pribadi, gunakan **~/.copilot/skills/** atau lokasi umum **~/.agents/skills/** bila didukung oleh pengalaman Copilot yang dipakai. Skill dapat digunakan di pengalaman Copilot yang mendukung Agent Skills.

Dokumentasi: https://docs.github.com/en/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/add-skills

### Gemini CLI

Pasang ke **.gemini/skills/** atau gunakan lokasi umum **.agents/skills/**. Setelah itu, periksa daftar skill dari sesi Gemini CLI.

Dokumentasi: https://geminicli.com/docs/cli/creating-skills/

### Cursor

Pasang ke **.cursor/skills/** atau lokasi umum **.agents/skills/**. Cursor juga mendukung beberapa lokasi kompatibilitas untuk skill Claude dan Codex.

Dokumentasi: https://cursor.com/docs/skills

### ChatGPT

Paket ini dapat dijadikan bahan untuk membuat skill yang kompatibel dengan alur kerja ChatGPT yang mendukung Skills, atau dipindahkan secara manual ke instruksi dan bahan pengetahuan GPT khusus. Untuk GPT khusus, letakkan aturan kerja utama pada bagian **Instructions** dan masukkan referensi seperti katalog perintah ke **Knowledge**. Jangan menganggap mengunggah ZIP ke percakapan biasa otomatis memasang skill ke akun.

Kemampuan pemasangan, ketersediaan Skills, dan jalur distribusi dapat berbeda menurut aplikasi, akun, dan versi. Repository ini belum merupakan aplikasi ChatGPT, server MCP, atau plugin yang otomatis terdaftar di direktori aplikasi.

Panduan GPT: https://help.openai.com/en/articles/8554397-create-a-gpt  
Panduan Skills: https://learn.chatgpt.com/docs/build-skills

## 6. Cara menggunakan

Unggah foto ke AI yang mendukung gambar, lalu jelaskan perubahan yang diinginkan. Sebutkan bagian yang harus tetap sama.

Contoh:

**Retouch alami**

~~~text
Gunakan PHOTO FIXER. Rapikan noda kecil dan kilap berlebih pada kulit.
Pertahankan pori-pori, tekstur kulit, bentuk wajah, ekspresi, rambut,
pakaian, dan latar. Jangan mengubah bagian lain.
~~~

**Restorasi foto lama**

~~~text
Gunakan PHOTO FIXER untuk memulihkan foto ini. Kurangi goresan, debu,
noda, dan warna pudar. Pertahankan wajah, pakaian, susunan orang,
dan suasana foto asli. Jangan menambahkan detail yang tidak didukung
oleh bagian foto yang masih terlihat.
~~~

**Ganti latar**

~~~text
Gunakan PHOTO FIXER. Ganti latar menjadi studio abu-abu lembut.
Pertahankan subjek, bentuk tubuh, wajah, pose, pakaian, dan rambut.
Sesuaikan arah cahaya dan bayangan agar hasilnya menyatu.
~~~

**Foto produk**

~~~text
Gunakan PHOTO FIXER untuk membuat foto produk bergaya studio.
Pertahankan bentuk, warna, logo, label, tulisan, dan detail produk.
Rapikan pencahayaan dan latar tanpa mengubah identitas produk.
~~~

**Gunakan perintah katalog**

~~~text
/photo-fixer:portrait-retouch
~~~

Nama pemanggilan perintah dapat berbeda antarplatform. Bila slash command tidak tersedia, tulis nama skill atau tempelkan instruksi yang relevan. Katalog lengkap berisi 100 perintah pada file **command-library.md**.

## 7. Prinsip menjaga keaslian foto

1. **Ubah hanya yang diminta.** Bagian lain dianggap terkunci.
2. **Wajah tidak boleh bergeser.** Bentuk wajah, mata, hidung, bibir, ekspresi, dan ciri khas dipertahankan kecuali pengguna meminta perubahan yang diperbolehkan.
3. **Kulit tetap bertekstur.** Hindari hasil terlalu licin, seperti plastik.
4. **Jangan mengarang detail.** Peningkatan resolusi bukan alasan untuk menciptakan tulisan, logo, tekstur, atau ciri wajah yang tidak terlihat.
5. **Cahaya harus konsisten.** Bayangan, pantulan, arah cahaya, dan warna subjek harus sesuai dengan lingkungan.
6. **Hasil harus diperiksa.** Periksa tepi rambut, jari, kacamata, tekstur, tulisan, logo, dan objek kecil.
7. **Foto bukti harus tetap jujur.** Jangan mengubah foto dokumentasi untuk menyesatkan orang atau menghilangkan konteks penting.

Lihat daftar lengkap pada **quality-checklist.md**.

## 8. Struktur repository

~~~text
Photo-Fixer/
├── .agents/
│   └── skills/
│       ├── photo-fixer/
│       │   ├── SKILL.md
│       │   └── references/
│       │       ├── command-library.md
│       │       ├── quality-checklist.md
│       │       └── output-presets.md
│       ├── photo-fixer-image-assessment/
│       ├── photo-fixer-portrait-retouch/
│       ├── photo-fixer-photo-restoration/
│       ├── photo-fixer-lighting-film/
│       ├── photo-fixer-color-correction/
│       ├── photo-fixer-background-object-editing/
│       ├── photo-fixer-scene-compositing/
│       ├── photo-fixer-product-vehicle-photography/
│       ├── photo-fixer-social-formatting/
│       ├── photo-fixer-detail-upscaling/
│       └── photo-fixer-quality-control/
├── install.ps1
├── install.sh
├── tests/
│   ├── validate_package.py
│   └── test-cases.md
├── CHANGELOG.md
├── VERSION
└── README.md
~~~

## 9. Pemeriksaan paket

Jalankan pemeriksaan struktur dengan Python 3:

~~~bash
python tests/validate_package.py
~~~

Pemeriksaan ini memvalidasi keberadaan skill, metadata dasar, tautan referensi lokal, dan jumlah perintah di katalog. Pemeriksaan struktur tidak membuktikan bahwa model AI tertentu akan menghasilkan edit yang sempurna. Pengujian perilaku tetap harus dilakukan pada platform dan alat edit gambar yang digunakan.

## 10. Batas kemampuan

- Kualitas hasil bergantung pada model, gambar sumber, instruksi, serta fitur edit gambar yang tersedia.
- Foto yang sangat kecil, buram berat, tertutup, atau rusak total mungkin tidak dapat dipulihkan secara akurat.
- AI dapat salah menebak detail halus. Jangan menganggap hasil rekonstruksi sebagai bukti asli.
- Nama lensa, resolusi, dan gaya visual adalah arahan tampilan, bukan jaminan spesifikasi kamera atau jumlah piksel tertentu.
- Photo Fixer tidak mengirim foto ke layanan luar dengan sendirinya. Pengelolaan data mengikuti platform AI atau aplikasi editor yang digunakan.

## 11. Kontribusi

Saran perbaikan, contoh kasus, perintah baru, dan laporan kesalahan dipersilakan melalui Issues atau Pull Request. Sertakan contoh input, hasil yang diharapkan, hasil yang terjadi, platform, serta subskill yang terkait. Jangan mengunggah foto pribadi orang lain tanpa izin.

## 12. Lisensi

Paket ini menggunakan Apache License 2.0. Lihat berkas **LICENSE** untuk ketentuan lengkap.

---

**Nama paket:** PHOTO FIXER  
**Versi:** 1.0.0  
**Bahasa dokumentasi:** Indonesia  
**Format utama:** Agent Skills (Markdown + YAML frontmatter)
