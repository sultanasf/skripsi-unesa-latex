# AI Workflow

## Urutan Kerja

1. Baca `AGENTS.md` dan skill yang sesuai.
2. Baca `work-dir/project.md`, `work-dir/decisions.md`, dan catatan pembimbing.
3. Verifikasi sumber primer sebelum membuat klaim literatur.
4. Simpan raw data read-only di `work-dir/data/raw/`.
5. Jalankan analisis dari script yang tercatat di `work-dir/analisis/`.
6. Ekspor hanya tabel/gambar terverifikasi ke `latex-work-dir/assets/generated/`.
7. Tulis naskah berdasarkan bukti, bukan keluaran AI yang belum diperiksa.
8. Catat bantuan substantif di `work-dir/ai/log.md`.
9. Build dokumen terdampak dan jalankan `make check`.

## Klasifikasi Klaim

- **Fakta sumber**: punya sumber primer dan sitasi.
- **Hasil analisis**: punya input, script, output, dan audit trail.
- **Interpretasi**: keputusan penulis yang konsisten dengan hasil dan batasan.
- **Placeholder**: teks sementara yang ditandai jelas.

## Tanggung Jawab Manusia

Mahasiswa memeriksa identitas, klaim, terjemahan, angka, analisis, keputusan
metode, sitasi, pernyataan AI, privasi, dan kesiapan serah terima. AI tidak boleh
membuat DOI, kutipan, data, hasil uji, atau kesimpulan tanpa bukti.

## Log Minimum

Setiap entri `work-dir/ai/log.md` mencatat tanggal, aktivitas, input, keluaran,
keputusan manusia, keterbatasan, dan verifikasi.
