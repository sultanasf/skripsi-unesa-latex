# Aturan AI Workspace Skripsi UNESA

## Batas Folder

- Ubah naskah hanya di `latex-work-dir/`.
- Simpan bukti, data, catatan, paper, keluaran analisis, dan administrasi di
  `work-dir/`.
- Jangan memasukkan DOCX resmi, font, logo, paper, data, atau administrasi ke
  Git. Template resmi yang tersedia lokal bersifat read-only.
- Jangan memindahkan data mentah dari `work-dir/data/raw/` ke naskah. Turunkan
  tabel atau gambar terverifikasi ke `latex-work-dir/assets/generated/`.

## Integritas Akademik

- Jangan membuat sitasi, DOI, kutipan, data, hasil uji, nilai statistik, atau
  kesimpulan yang tidak ada pada bukti.
- Bedakan fakta sumber, hasil analisis, interpretasi penulis, dan placeholder.
- Untuk setiap klaim literatur, pastikan entri BibTeX dan sumber primer tersedia
  atau tandai klaim sebagai belum terverifikasi.
- Pertahankan bahasa ilmiah Indonesia: baku, lugas, konsisten, tanpa persona
  `saya`, `kami`, atau `kita` pada isi ilmiah.
- Satu paragraf memuat satu ide pokok dan sekurang-kurangnya dua ide pendukung.
- AI membantu proses; mahasiswa tetap memeriksa, mengambil keputusan ilmiah,
  dan bertanggung jawab atas semua isi.

## Sebelum Mengedit

1. Baca skill yang cocok di `.agents/skills/`.
2. Baca `latex-work-dir/config/variables.tex` dan file target.
3. Baca catatan pembimbing serta bukti terkait di `work-dir/`.
4. Nyatakan kekurangan bukti; jangan menutupinya dengan teks generik.

## Sesudah Mengedit

1. Perbarui `work-dir/ai/log.md` untuk bantuan substantif.
2. Jalankan target build dokumen terdampak.
3. Jalankan `make check` sebelum menyatakan naskah siap.
4. Laporkan warning, placeholder, sitasi hilang, atau data belum tervalidasi.

## Public Repository

- Kode, dokumentasi, script, dan skill mengikuti `LICENSE` MIT.
- Aset institusi, font, template resmi, dan isi skripsi mengikuti hak pemiliknya.
- Jangan membuka data mahasiswa, identitas responden, credential, atau dokumen
  administrasi melalui issue atau pull request.

## Entry Point

- Proposal: `latex-work-dir/main_proposal.tex`.
- Skripsi penuh: `latex-work-dir/main_skripsi.tex`.
- Jangan compile file di `chapters/`, `pages/`, `formats/`, atau `config/`
  secara langsung.

## Platform Adaptation

- Tooling build workspace ini menargetkan POSIX (Linux, macOS, WSL). Pada
  Windows/macOS, jangan menyatakan workspace rusak ketika `make`, `sh`, atau
  `unzip` tidak tersedia.
- Jika OS bukan Linux atau `make`/`sh` tidak tersedia, baca dan ikuti
  `docs/PLATFORM.md` sebelum membuat perubahan apa pun.
- Adaptasi hanya boleh menyentuh lapisan orkestrasi. Pipeline
  `latexmk -xelatex`, entry point, path keluaran, ukuran A5, aturan font/DOCX,
  dan semantik `check-workspace.sh` bersifat tetap.
- Jalur Linux wajib tetap hijau (`make ci`).
