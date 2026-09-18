---
name: unesa-quantitative-thesis
description: Menyusun, meninjau, atau merevisi isi ilmiah proposal dan skripsi kuantitatif UNESA berdasarkan bukti. Gunakan saat pengguna meminta Bab I-V, abstrak, rumusan masalah, hipotesis, kajian teori, penelitian relevan, metode kuantitatif, hasil, pembahasan, simpulan, atau saran.
metadata:
  institution: Universitas Negeri Surabaya
  methodology: Kuantitatif
  version: "1.0"
---

# Penulisan Skripsi Kuantitatif UNESA

Skill ini mengatur isi ilmiah. Format visual diatur skill
`unesa-latex-template`.

## Gerbang Bukti

Sebelum menulis:

1. Baca pertanyaan dan scope di `work-dir/project.md`.
2. Baca arahan terbaru di `work-dir/catatan/pembimbing.md`.
3. Periksa sumber di `work-dir/referensi/index.md` dan `work-dir/papers/`.
4. Untuk hasil, periksa data, script, log, tabel, diagnostik, dan catatan
   verifikasi di `work-dir/analisis/`.
5. Jika bukti kurang, sebutkan kekurangan dan sisakan placeholder. Jangan
   mengganti kekurangan dengan klaim umum.

## Status Pernyataan

Kelompokkan setiap pernyataan kerja sebagai:

- fakta sumber: harus punya sitasi terverifikasi;
- hasil analisis: harus dapat ditelusuri ke output;
- interpretasi penulis: harus konsisten dengan hasil dan batasan;
- placeholder: harus eksplisit dan tidak terdengar sebagai fakta.

## Struktur Wajib

### Bab I Pendahuluan

- Latar Belakang Masalah: bukti kondisi aktual, kondisi ideal, kesenjangan,
  dampak, urgensi, dan arah penelitian.
- Identifikasi Masalah: peta masalah yang ditopang latar belakang.
- Batasan Masalah: objek, unit, lokasi, periode, variabel, dan metode.
- Rumusan Masalah: kalimat tanya yang dapat dijawab data.
- Tujuan Penelitian: pasangan satu-ke-satu dengan rumusan.
- Manfaat Penelitian: teoretis dan praktis tanpa janji berlebih.
- Asumsi Penelitian: opsional, hanya bila benar-benar digunakan.

### Bab II Kajian Pustaka

- Kajian Teori: definisi, konstruk, asumsi, indikator, serta sintesis.
- Hasil Penelitian yang Relevan: bandingkan tujuan, data, metode, temuan,
  keterbatasan, dan celah; sajikan narasi dan matriks.
- Kerangka Berpikir: hubungan logis antarvariabel berdasarkan teori dan bukti.
- Pertanyaan Penelitian dan/atau Hipotesis: selaras dengan rumusan serta desain.

Jangan memakai materi pembelajaran yang belum melalui uji publik sebagai dasar
utama. Utamakan paper primer dan dokumen metode resmi.

### Bab III Metode Penelitian

- Jenis atau Desain Penelitian.
- Tempat dan Waktu Penelitian, bila relevan.
- Populasi dan Sampel atau Subjek/Sumber Data.
- Definisi Operasional Variabel.
- Teknik dan Instrumen Pengumpulan Data.
- Validitas dan Reliabilitas Instrumen, bila survei.
- Teknik Analisis Data.

Pastikan desain, sampling, pengukuran, dan analisis cukup rinci untuk direplikasi.
Jangan memilih uji statistik hanya karena umum dipakai. Kaitkan setiap uji dengan
skala data, asumsi, dan rumusan masalah.

### Bab IV Hasil Penelitian dan Pembahasan

- Analisis Deskripsi: konteks dan perkembangan data.
- Statistik Deskriptif: N, pusat, sebaran, rentang, serta kualitas data.
- Hasil Penelitian: mengikuti urutan pertanyaan atau hipotesis; tanpa
  interpretasi panjang.
- Pembahasan: makna temuan, teori, studi terdahulu, mekanisme, kontribusi.
- Keterbatasan Penelitian: dampak keterbatasan terhadap validitas dan
  generalisasi.

Angka pada narasi, tabel, dan simpulan wajib cocok dengan output analisis.
Laporkan hasil yang tidak signifikan dan hasil yang bertentangan, bukan hanya
hasil yang mendukung hipotesis.

### Bab V Kesimpulan dan Saran

- Simpulan menjawab rumusan, bukan merangkum semua bab.
- Implikasi dibatasi oleh hasil dan ruang lingkup.
- Saran bersifat operasional, memiliki sasaran, dan berasal dari simpulan atau
  keterbatasan.

## Abstrak

Maksimal 250 kata, satu halaman, satu spasi. Muat rasional, tujuan, desain,
tempat, subjek atau sumber data, pengumpulan, instrumen, analisis, hasil,
simpulan, dan saran. Tulis abstrak terakhir agar angka dan simpulan cocok dengan
naskah. Abstract bahasa Inggris harus setara secara makna, bukan menambah hasil.

## Pemeriksaan Konsistensi

Gunakan matriks pada
[references/consistency-matrix.md](references/consistency-matrix.md). Setelah
revisi, periksa pasangan berikut:

- masalah, rumusan, tujuan, hipotesis;
- variabel, definisi operasional, instrumen, data;
- rumusan, teknik analisis, hasil, simpulan;
- hasil, pembahasan, implikasi, saran;
- klaim, sitasi, entri BibTeX, sumber primer.

## Larangan

- Jangan membuat referensi, DOI, halaman kutipan, atau metadata.
- Jangan membuat data, koefisien, nilai p, interval, reliabilitas, atau hasil uji.
- Jangan menyebut hubungan kausal jika desain hanya mendukung asosiasi.
- Jangan menghapus hasil yang tidak sesuai hipotesis.
- Jangan memakai persona pada isi ilmiah.
- Jangan menyamarkan keterbatasan atau status data.
