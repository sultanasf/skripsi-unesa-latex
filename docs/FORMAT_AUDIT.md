# Audit Template UNESA

Audit ini berasal dari dua DOCX lokal yang disediakan pengguna:

- `TEMPLATE FORMAT PROPOSAL KUANTITTAIF.docx`
- `TEMPLATE FORMAT SKRIPSI KUANTITATIF.docx`

## Aturan Terverifikasi

| Elemen | Bukti | Implementasi |
|---|---|---|
| Kertas | A5, 14,8 x 21 cm; 8391 x 11906 twip | `a5paper` |
| Cetak | Bolak-balik | `twoside` |
| Font | Book Antiqua 10 pt | strict build memakai DOCX lokal |
| Margin | Kiri/atas 2,5 cm; kanan/bawah 2 cm | `geometry` left/right + `asymmetric` |
| Spasi | Multiple 1,15; abstrak/kutipan panjang tunggal | `setspace` |
| Bab | `BAB I` dan judul kapital, tebal, terpusat | `titlesec` |
| Subbagian | `A.`, `B.`, `C.` | `\\section` |
| Bagian awal | Romawi kecil | runner |
| Bagian inti/akhir | Arab mulai Bab I | runner |
| Footer | Nomor halaman tengah | `fancyhdr` |
| Sampul | Abu-abu `#5F5D5D`, aksen emas, logo UNESA | `formats/cover.tex` |
| Abstrak | Satu halaman, tunggal, maksimal 250 kata | `pages/abstrak.tex`, `pages/abstract.tex` |
| Pustaka | Sumber yang dirujuk, alfabetis | BibTeX sementara `apalike` |

## Batas Bukti

DOCX tidak menetapkan nama gaya sitasi, format persamaan, format kode, detail
caption, heading lebih dalam, atau seluruh isi proposal. Hal tersebut sengaja
tidak difiksasi. Catat keputusan baru di `docs/FORMAT_STATUS.md` dan
`work-dir/decisions.md` setelah ada arahan resmi.

Font dan aset resmi tidak disimpan di repository. Strict build membutuhkan file
DOCX lokal dan tidak menyiratkan izin redistribusi.
