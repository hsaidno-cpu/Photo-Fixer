# Panduan Kontribusi

Terima kasih sudah membantu meningkatkan PHOTO FIXER.

## Sebelum mengubah paket
1. Baca README dan skill utama.
2. Tentukan subskill yang memiliki tanggung jawab terhadap perubahan.
3. Hindari menaruh seluruh logika di skill utama.
4. Pertahankan kompatibilitas format Agent Skills dan YAML frontmatter.
5. Tambahkan atau perbarui kasus uji saat perilaku berubah.

## Standar kontribusi
- Gunakan Bahasa Indonesia yang jelas pada isi instruksi.
- Gunakan nama skill lowercase dengan tanda hubung.
- Setiap skill harus menjelaskan pemicu, tujuan, prosedur, batasan, dan keluaran.
- Jangan mengklaim fitur, tool, model, atau platform telah diuji bila belum diuji.
- Pisahkan fakta, asumsi, dan usulan.
- Hindari penambahan prompt yang membuat identitas wajah, logo, atau bukti visual berubah tanpa izin.
- Jangan memasukkan foto pribadi, token, password, atau rahasia ke repository.

## Pemeriksaan
Jalankan:

~~~bash
python tests/validate_package.py
~~~

Tambahkan hasil uji perilaku secara terpisah. Tes struktur yang lulus tidak membuktikan hasil edit visual.
