# Struktur File

## Entry Point

| File | Isi |
|---|---|
| `main_proposal.tex` | Sampul, persetujuan, daftar, Bab I-III, pustaka, lampiran |
| `main_skripsi.tex` | Sampul, front matter lengkap, daftar, Bab I-V, pustaka, lampiran |

## Konfigurasi

| File | Fungsi | Kebijakan |
|---|---|---|
| `config/variables.tex` | Semua metadata | Edit pertama |
| `config/toggles.tex` | Halaman opsional | Edit sesuai kebutuhan |
| `config/packages.tex` | Paket dan pemuatan font | Ubah hanya bila perlu |
| `config/formatting.tex` | Aturan format UNESA | Terkunci tanpa bukti baru |

## Isi Bersama

| Folder | Fungsi |
|---|---|
| `chapters/` | Bab I-V, dipakai kedua runner |
| `pages/` | Halaman awal dan lampiran |
| `formats/` | Sampul |
| `refs/` | Basis data BibTeX |
| `assets/generated/` | Gambar/tabel hasil analisis terverifikasi |
| `assets/user/` | Aset penulis atau pihak ketiga berlisensi |

## Hasil Build

`build/` menyimpan file sementara, logo, dan font hasil ekstraksi lokal.
`output/` menyimpan PDF stabil. Keduanya diabaikan Git.
