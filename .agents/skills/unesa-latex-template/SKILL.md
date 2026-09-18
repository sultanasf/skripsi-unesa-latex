---
name: unesa-latex-template
description: Memelihara, mengedit, atau mengompilasi template LaTeX proposal dan skripsi UNESA di latex-work-dir. Gunakan saat pengguna menyebut format UNESA, main_proposal.tex, main_skripsi.tex, cover, margin, font, halaman awal, tabel, gambar, sitasi, lampiran, build, atau error LaTeX workspace ini.
metadata:
  institution: Universitas Negeri Surabaya
  template: Proposal dan Skripsi Kuantitatif
  version: "1.0"
---

# Template LaTeX Skripsi UNESA

Skill ini menjaga dua keluaran dari satu sumber isi:

- `latex-work-dir/main_proposal.tex`: Bab I-III.
- `latex-work-dir/main_skripsi.tex`: front matter lengkap dan Bab I-V.

## Urutan Kerja

1. Baca `latex-work-dir/config/variables.tex` dan file target.
2. Baca `docs/FORMAT_AUDIT.md` serta catatan pembimbing relevan.
3. Tentukan apakah perubahan menyentuh isi, metadata, atau format.
4. Pertahankan satu sumber bab; jangan duplikasi bab proposal.
5. Catat bantuan substantif di `work-dir/ai/log.md`.
6. Jalankan target build terdampak, lalu `make check` dari
   `latex-work-dir/`.
7. Laporkan placeholder, warning, sitasi hilang, atau aturan belum pasti.

## Prinsip Inti

**Edit identitas hanya di `config/variables.tex`; semua halaman wajib memakai
command metadata.**

Jangan mengubah aturan terkalibrasi di `config/formatting.tex` kecuali tersedia
panduan baru atau keputusan pembimbing yang tercatat. Jangan compile file bab,
halaman, format, atau konfigurasi langsung.

## Tugas Umum

### Mengubah Identitas

Ubah command terkait di `config/variables.tex`:

```latex
\newcommand{\NamaMahasiswa}{Nama Lengkap Mahasiswa}
\newcommand{\NIM}{00000000000}
\newcommand{\JudulPenelitian}{Judul Penelitian}
\newcommand{\NamaPembimbing}{Nama Pembimbing, Gelar}
\newcommand{\NIPPembimbing}{000000000000000000}
```

Daftar lengkap ada di [references/variables.md](references/variables.md).

### Menambah Gambar

Sebut dan bahas gambar sebelum gambar muncul. Simpan hasil olah data di
`assets/generated/`; simpan gambar penulis di `assets/user/`.

```latex
Gambar~\ref{fig:kerangka} menyajikan hubungan antarvariabel penelitian.

\begin{figure}[H]
  \centering
  \includegraphics[width=0.85\textwidth]{assets/user/kerangka.pdf}
  \caption{Kerangka berpikir penelitian}
  \label{fig:kerangka}
  \Sumber{Disusun oleh penulis}
\end{figure}
```

Untuk gambar pihak ketiga, `\Sumber{...}` harus memuat sitasi terverifikasi.

### Menambah Tabel

Gunakan `tblr`. Caption dan label berada sebelum badan tabel.

```latex
Tabel~\ref{tab:deskriptif} menyajikan ringkasan variabel penelitian.

\begin{table}[H]
  \centering
  \caption{Statistik deskriptif variabel penelitian}
  \label{tab:deskriptif}
  \begin{tblr}{colspec={X c c c}}
    Variabel & N & Rata-rata & SD \\
    [Nama] & [nilai] & [nilai] & [nilai] \\
  \end{tblr}
  \Sumber{Hasil analisis data terverifikasi, [tahun]}
\end{table}
```

Jangan mengisi angka contoh sebagai hasil penelitian.

### Menambah Persamaan

```latex
\begin{equation}
  y_i = \beta_0 + \beta_1 x_i + \varepsilon_i
  \label{eq:model}
\end{equation}

Persamaan~\ref{eq:model} menyatakan spesifikasi model yang digunakan.
```

Definisikan semua simbol dan satuan. Jangan menyatakan model sudah digunakan
sebelum script atau output analisis tersedia.

### Menambah Sitasi

Tambahkan entri terverifikasi ke `refs/references.bib`:

```latex
Menurut \citet{kunci2026}, ...
...
Temuan terdahulu menunjukkan ... \citep{kunci2026}.
```

Semua sumber dalam pustaka harus disitasi; semua sitasi harus ada di pustaka.
Gaya `apalike` bersifat keputusan sementara karena DOCX hanya menetapkan urutan
alfabetis. Jangan mengganti gaya tanpa arahan prodi atau pembimbing.

### Build

```bash
cd latex-work-dir
make proposal
make skripsi
make check
```

Compiler wajib XeLaTeX. `make ci` memakai fallback. `make strict` mengekstrak
Book Antiqua dan logo dari DOCX sumber ke `build/`. Font hasil ekstraksi tidak
boleh dimasukkan ke Git.

## Larangan

- Jangan hardcode identitas di `pages/`, `formats/`, atau `chapters/`.
- Jangan menyalin font Book Antiqua dari `build/` ke aset terlacak.
- Jangan mengubah template DOCX resmi atau aset institusi lokal.
- Jangan menghapus Bab IV-V agar proposal dapat dibangun; runner proposal sudah
  mengecualikannya.
- Jangan membuat sumber, DOI, data, hasil uji, atau kesimpulan.
- Jangan menekan warning build tanpa memeriksa penyebab.

Lihat [references/file-structure.md](references/file-structure.md) dan
[references/formatting-rules.md](references/formatting-rules.md) sebelum
perubahan struktural atau format.
