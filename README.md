# Workspace Skripsi UNESA

Workspace berbasis AI untuk proposal dan skripsi kuantitatif Universitas Negeri
Surabaya (UNESA). Format LaTeX diturunkan dari dua template DOCX lokal yang
disediakan pengguna. Repo ini menyediakan base template dan working directory,
bukan keputusan akademik final atau panduan resmi UNESA.

## Folder Utama

```text
.
|-- latex-work-dir/     # sumber LaTeX dan PDF hasil kompilasi
|-- work-dir/           # catatan, paper, data, analisis, administrasi, log AI
|-- .agents/skills/     # skill AI khusus workspace ini
|-- AGENTS.md           # aturan kerja AI lintas folder
|-- docs/               # instalasi, format, workflow AI, dan release
`-- .github/            # CI dan template kontribusi
```

## Mulai Cepat

1. Isi semua identitas di `latex-work-dir/config/variables.tex`.
2. Simpan sumber, catatan, dan data kerja di `work-dir/`.
3. Tulis isi bersama di `latex-work-dir/chapters/`.
4. Jalankan build dari `latex-work-dir/`:

```bash
make proposal
make skripsi
make all
make check
```

Hasil stabil tersedia di:

- `latex-work-dir/output/proposal/Proposal_UNESA.pdf`
- `latex-work-dir/output/skripsi/Skripsi_UNESA.pdf`

`make ci` memakai fallback font distribusi TeX dan tidak membutuhkan DOCX resmi. Untuk output yang
meniru template sumber secara ketat, sediakan DOCX lokal lalu jalankan `make
strict`. DOCX, logo resmi, dan Book Antiqua tidak disimpan di repo karena status
lisensi/redistribusinya belum jelas.

## Alur AI

AI wajib membaca `AGENTS.md`, skill relevan, `work-dir/catatan/`, dan bukti
sumber sebelum mengubah naskah. Klaim, sitasi, angka, serta hasil analisis tidak
boleh dibuat tanpa bukti. Setiap bantuan substantif dicatat di
`work-dir/ai/log.md`, sesuai halaman pernyataan penggunaan AI pada template.

Alur agentic lengkap ada di `docs/AI_WORKFLOW.md`. Konfigurasi skill dimuat saat
sesi dimulai. Setelah perubahan di `.agents/` atau `.opencode/`, tutup lalu mulai
ulang OpenCode agar skill baru termuat.

## Dasar Format

- Kertas A5, 14,8 x 21 cm, bolak-balik.
- Font Book Antiqua 10 pt.
- Margin kiri 2,5 cm; atas 2,5 cm; kanan 2 cm; bawah 2 cm.
- Spasi multiple 1,15; kutipan langsung panjang memakai spasi tunggal.
- Bagian awal bernomor Romawi kecil; bagian inti dan akhir bernomor Arab.
- Proposal memuat halaman persetujuan, daftar, Bab I-III, daftar pustaka, dan
  lampiran.
- Skripsi penuh memuat front matter resmi, Bab I-V, daftar pustaka, dan
  lampiran.

Rincian terkalibrasi tersedia di `docs/FORMAT_STATUS.md` dan
`docs/FORMAT_AUDIT.md`.

## Release Public

Repo memakai MIT untuk kode, dokumentasi, script, dan skill buatan repo. Logo,
merek, font, DOCX resmi, paper, data, administrasi, dan isi skripsi tidak tercakup.
Baca `NOTICE.md`, `CONTRIBUTING.md`, dan `SECURITY.md` sebelum memakai atau
berkontribusi.
