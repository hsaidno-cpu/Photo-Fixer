---
name: photo-fixer-image-assessment
description: Menilai kondisi foto dan kebutuhan edit sebelum proses dimulai. Gunakan untuk diagnosis fokus, resolusi, cahaya, warna, kerusakan, komposisi, area berisiko, serta bagian yang harus dikunci.
---

# PHOTO FIXER — IMAGE ASSESSMENT

## Misi
Menilai gambar apa adanya dan membuat rencana edit yang jelas. Skill ini tidak mengubah foto; ia menentukan masalah yang terlihat, batas yang tidak boleh dilanggar, dan subskill yang tepat.

## Input
- Foto asli atau keterangannya.
- Tujuan pengguna.
- Area yang boleh diubah dan bagian yang harus dipertahankan.
- Format/rasio/ukuran keluaran bila diketahui.

## Prosedur
1. Pastikan gambar benar-benar tersedia dan dapat dilihat.
2. Klasifikasikan kebutuhan: potret, restorasi, cahaya, warna, latar/objek, komposisi, produk/kendaraan, format sosial, atau pembesaran.
3. Amati hanya hal yang tampak: fokus, blur, noise, resolusi, exposure, white balance, kontras, warna, komposisi, kerusakan, dan artefak.
4. Tandai wilayah sensitif: wajah, rambut, tangan, tulisan, logo, kaca, transparansi, pola, dan tepi objek.
5. Bedakan observasi, dugaan, dan hal yang tidak dapat dipastikan.
6. Tentukan intensitas edit: ringan, sedang, atau kreatif.
7. Susun peta: area ubah, area kunci, risiko, urutan kerja, dan pemeriksaan wajib.
8. Arahkan ke subskill yang tepat. Jangan mengirim tugas ke semua subskill sekaligus.

## Guardrail
- Jangan menyimpulkan identitas, usia, karakter, atau konteks yang tidak relevan dari foto.
- Jangan mengarang detail yang hilang atau tertutup.
- Jangan menganggap foto kecil pasti dapat dipulihkan menjadi detail asli.
- Untuk foto bukti/dokumentasi, jaga konteks dan integritas sumber.
- Jangan mulai edit bila satu konflik instruksi dapat mengubah hasil secara material.

## Keluaran
1. Kondisi yang teramati.
2. Tujuan edit dan tingkat intensitas.
3. Peta area ubah dan area kunci.
4. Subskill terpilih dan urutan.
5. Risiko, keterbatasan, dan pemeriksaan yang diperlukan.

## Status
ASSESSMENT_READY, ASSESSMENT_WITH_LIMITATIONS, atau BLOCKED. Diagnosis bukan bukti bahwa edit telah dilakukan.
