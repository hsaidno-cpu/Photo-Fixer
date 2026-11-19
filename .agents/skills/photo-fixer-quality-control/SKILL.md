---
name: photo-fixer-quality-control
description: Memeriksa hasil edit foto sebelum diserahkan. Gunakan untuk memeriksa kesesuaian instruksi, bagian yang harus dipertahankan, artefak, tepi, wajah, teks, logo, cahaya, warna, dan keluaran.
---

# PHOTO FIXER — QUALITY CONTROL

## Misi
Menjadi pemeriksa akhir yang tidak ikut membela hasil edit hanya karena prosesnya sudah dilakukan.

## Input
- Foto sumber bila tersedia.
- Hasil edit atau output tool.
- Daftar perubahan yang diminta.
- Daftar elemen yang harus dipertahankan.
- Format dan ukuran target jika ada.

## Prosedur
1. Bandingkan hasil dengan permintaan dan daftar elemen terkunci.
2. Periksa wajah, ekspresi, rambut, tangan, jari, pakaian, aksesori, dan jumlah subjek.
3. Periksa logo, label, tulisan, bentuk produk, serta kendaraan.
4. Periksa tepi mask, bayangan, pantulan, perspektif, depth of field, dan konsistensi cahaya.
5. Periksa tekstur kulit, noise, ketajaman, warna, clipping, halo, dan artefak.
6. Periksa apakah perubahan mengubah makna foto dokumenter.
7. Periksa format/dimensi bila diminta dan bila data file tersedia.
8. Catat setiap cacat dan tentukan apakah perlu rework, pembatasan klaim, atau penghentian.

## Tingkat temuan
- P0: pelanggaran integritas, manipulasi yang menyesatkan, atau perubahan penting yang tidak diizinkan. HOLD.
- P1: wajah/objek utama berubah, tulisan/logo rusak, atau cacat besar. REWORK/HOLD.
- P2: cacat terlihat tetapi terbatas dan dapat diterima hanya bila diungkapkan.
- P3: kekurangan kosmetik yang tidak memengaruhi tujuan.

Jangan memberi skor angka seolah-olah terukur bila tidak ada rubrik kuantitatif yang disepakati.

## Keluaran
- Tujuan dan ruang lingkup pemeriksaan.
- Temuan per kategori.
- Elemen yang dipertahankan atau yang berubah.
- Status PASS, PASS_WITH_LIMITATIONS, REWORK, atau HOLD.
- Bukti pemeriksaan yang benar-benar tersedia dan keterbatasan.

## Aturan klaim
Pemeriksaan berbasis instruksi tidak sama dengan pemeriksaan piksel. Jika gambar hasil tidak dapat dilihat atau dibandingkan, tandai NOT_VERIFIED. Jangan mengklaim lulus.
