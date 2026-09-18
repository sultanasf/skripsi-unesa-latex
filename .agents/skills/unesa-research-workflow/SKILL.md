---
name: unesa-research-workflow
description: Mengelola alur AI-driven skripsi UNESA untuk paper, sitasi, catatan pembimbing, data, analisis reproducible, aset hasil, audit bukti, dan log penggunaan AI. Gunakan saat pengguna menambah referensi, mengolah data, membuat tabel/gambar hasil, mencatat arahan, memverifikasi klaim, atau menyiapkan pernyataan AI.
metadata:
  institution: Universitas Negeri Surabaya
  workflow: Evidence-first research
  version: "1.0"
---

# Workflow Riset Skripsi UNESA

## Peta Folder

- `work-dir/catatan/`: arahan pembimbing dan keputusan rapat.
- `work-dir/papers/`: PDF paper lokal; diabaikan Git.
- `work-dir/referensi/`: indeks sumber, status metadata, klaim yang didukung.
- `work-dir/data/raw/`: data asli read-only; diabaikan Git.
- `work-dir/data/processed/`: data turunan.
- `work-dir/analisis/`: script, notebook, environment, log, output antara.
- `work-dir/administrasi/`: dokumen sensitif; diabaikan Git.
- `work-dir/ai/`: aktivitas bantuan AI dan verifikasi manusia.
- `work-dir/decisions.md`: register keputusan akademik yang masih open.
- `latex-work-dir/assets/generated/`: hanya visual hasil terverifikasi.

## Referensi

1. Simpan PDF atau URL sumber primer.
2. Cocokkan judul, penulis, tahun, venue, halaman, dan DOI/URL dengan sumber
   penerbit.
3. Catat status di `work-dir/referensi/index.md`.
4. Buat entri `latex-work-dir/refs/references.bib` hanya setelah verifikasi.
5. Catat klaim spesifik yang didukung sumber.
6. Pastikan sitasi benar-benar merujuk isi sumber, bukan hanya topik serupa.

Jangan mengandalkan metadata hasil tebakan, cuplikan mesin pencari, atau sumber
sekunder jika sumber primer tersedia.

## Data dan Analisis

1. Simpan data asli tanpa modifikasi di `data/raw/`.
2. Catat asal, tanggal unduh, lisensi, definisi variabel, dan checksum.
3. Buat transformasi melalui script; simpan data turunan di `data/processed/`.
4. Kunci versi software, paket, parameter, seed, serta kriteria eksklusi.
5. Simpan output lengkap dan diagnostik sebelum membuat ringkasan.
6. Minta verifikasi mahasiswa terhadap asumsi, angka, dan keputusan model.
7. Ekspor tabel atau gambar final ke `latex-work-dir/assets/generated/`.
8. Catat jalur input-script-output-bagian naskah di `work-dir/project.md`.

Gunakan checklist pada
[references/reproducibility-checklist.md](references/reproducibility-checklist.md).

## Catatan Pembimbing

Tambah bagian bertanggal pada `work-dir/catatan/pembimbing.md`. Pisahkan arahan,
keputusan, bukti, tindak lanjut, dan tenggat. Jika arahan baru mengganti arahan
lama, pertahankan catatan lama lalu tandai statusnya.

## Log AI

Setiap bantuan substantif harus ditambahkan ke `work-dir/ai/log.md`:

- tanggal dan aktivitas;
- input yang diberikan kepada AI;
- file atau bagian yang dihasilkan/diubah;
- keputusan yang tetap dibuat manusia;
- batasan, pemeriksaan, dan koreksi manusia.

Sesuaikan pilihan di `latex-work-dir/config/variables.tex` dengan penggunaan
nyata. Jangan menandai kategori yang tidak digunakan dan jangan menghapus log
untuk mengecilkan peran AI.

## Privasi

- Jangan masukkan kredensial, data identitas responden, atau administrasi ke Git.
- Anonimkan data sebelum diberikan ke layanan AI eksternal.
- Jangan mengirim paper atau dataset berlisensi jika izin tidak mengizinkan.
- Tinjau `git status` sebelum commit.

## Serah Terima ke Naskah

Sebelum memindahkan hasil ke LaTeX, pastikan:

- hasil dapat direproduksi dari input dan script;
- label, unit, sampel, periode, dan pembulatan konsisten;
- tabel/gambar memiliki sumber dan catatan yang memadai;
- narasi menyebut hasil sesuai output;
- interpretasi tidak melampaui desain;
- keterbatasan tercatat;
- bantuan AI tercatat.
