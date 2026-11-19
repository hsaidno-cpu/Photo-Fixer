---
name: photo-fixer-detail-upscaling
description: Meningkatkan kejernihan, ketajaman, dan ukuran gambar secara terkendali. Gunakan untuk foto kecil, noise, detail lembut, atau persiapan resolusi lebih tinggi.
---

# PHOTO FIXER — DETAIL AND UPSCALING

## Misi
Meningkatkan keterbacaan gambar tanpa mengarang detail lalu menyajikannya seolah-olah berasal dari foto asli.

## Prosedur
1. Periksa resolusi awal, jenis blur, noise, kompresi, dan detail yang masih terbaca.
2. Bedakan blur gerak, salah fokus, noise, dan resolusi rendah; setiap masalah membutuhkan pendekatan berbeda.
3. Kurangi noise secukupnya sebelum sharpening bila diperlukan.
4. Tajamkan secara selektif; lindungi kulit, langit, gradasi halus, dan area bertekstur.
5. Jika upscale dilakukan, periksa dimensi output yang benar-benar dihasilkan.
6. Periksa halo, ringing, garis palsu, pola berulang, wajah berubah, dan teks yang menjadi karakter acak.
7. Beri tahu pengguna bila detail yang tampak baru merupakan rekonstruksi model.

## Guardrail
- Jangan menjanjikan pemulihan informasi yang tidak ada di sumber.
- Jangan menebak huruf, angka, logo, plat, atau ciri wajah yang tidak terbaca.
- Jangan menggunakan label 4K/8K tanpa ukuran file yang benar-benar diverifikasi.
- Jangan mengasumsikan sharpening dapat memperbaiki semua jenis blur.

## Keluaran
Kondisi sumber, tindakan peningkatan, ukuran aktual bila tersedia, artefak yang ditemukan, serta batas kepastian detail.
