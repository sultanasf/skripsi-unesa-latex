# LaTeX Working Directory

Dua dokumen memakai metadata, bab, referensi, dan aset penelitian yang sama:

- `main_proposal.tex`: front matter proposal, Bab I-III, pustaka, lampiran.
- `main_skripsi.tex`: front matter lengkap, Bab I-V, pustaka, lampiran.

## Struktur

```text
latex-work-dir/
|-- main_proposal.tex
|-- main_skripsi.tex
|-- config/       # metadata, package, toggle, format terkunci
|-- formats/      # sampul
|-- pages/        # halaman awal dan lampiran
|-- chapters/     # isi ilmiah bersama
|-- assets/
|   |-- generated/ # hasil olah terverifikasi dari work-dir
|   `-- user/      # gambar buatan atau berlisensi milik penulis
|-- refs/         # BibTeX
|-- scripts/      # pemeriksaan workspace
|-- build/        # sementara, dibuat otomatis
`-- output/       # PDF stabil, dibuat otomatis
```

## Build

```bash
make proposal
make skripsi
make all
make check
make clean
make cleanall
```

`make prepare` membaca DOCX sumber secara lokal untuk mengekstrak logo dan font
ke `build/`. Target ini juga mengaktifkan BibTeX setelah entri nyata tersedia.
File hasil ekstraksi tidak dilacak Git. Jangan compile file bab, halaman,
format, atau konfigurasi secara langsung.

## Isi Naskah

1. Ubah `config/variables.tex`.
2. Ganti placeholder bertanda kurung siku di `chapters/` dan `pages/`.
3. Tambahkan sumber terverifikasi ke `refs/references.bib`, lalu pakai
   `\citep{kunci}` atau `\citet{kunci}`.
4. Letakkan gambar hasil analisis yang dapat direproduksi di
   `assets/generated/` dan gambar lain di `assets/user/`.
5. Jalankan `make check`; baca semua warning sebelum penyerahan.

## Ketidakpastian Panduan

Template DOCX menyatakan daftar pustaka harus alfabetis, tetapi tidak menyebut
nama gaya sitasi. Workspace memakai `apalike` karena menghasilkan sitasi
penulis-tahun dan daftar alfabetis. Konfirmasi gaya sitasi dengan program studi
atau pembimbing sebelum penyerahan. Aturan tabel, gambar, persamaan, tingkat
judul di bawah subbagian, dan posisi pasti nomor halaman juga tidak dijelaskan
lengkap; implementasi mengikuti pola visual yang dapat diekstrak dari DOCX.

## Kebutuhan Sistem

- TeX Live dengan XeLaTeX, Latexmk, BibTeX, dan paket pada `config/packages.tex`.
- `make`, `unzip`, dan `grep` untuk build.
- Poppler (`pdfinfo`, `pdffonts`) dan Ripgrep (`rg`) untuk `make check`.
