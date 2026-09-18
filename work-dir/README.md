# Research Working Directory

Folder kerja non-naskah. Isinya menjadi bukti bagi teks, tabel, gambar, dan
kesimpulan di `latex-work-dir/`.

```text
work-dir/
|-- project.md          # pertanyaan, scope, status, keputusan
|-- catatan/            # catatan pembimbing dan rapat
|-- papers/             # PDF sumber lokal, diabaikan Git
|-- referensi/          # indeks sumber dan status verifikasi
|-- data/
|   |-- raw/            # data asli, read-only, diabaikan Git
|   `-- processed/      # data turunan
|-- analisis/           # script, notebook, log eksekusi, output antara
|-- administrasi/       # dokumen sensitif, diabaikan Git
|-- panduan/            # hasil audit panduan dan keputusan format
|-- decisions.md        # register keputusan yang masih open
`-- ai/                 # log bantuan serta catatan verifikasi AI
```

## Aturan Aliran Data

1. Simpan data asli di `data/raw/`; jangan edit in place.
2. Simpan transformasi dan analisis di `analisis/` beserta versi software dan
   parameter.
3. Simpan hasil antara di `data/processed/`.
4. Ekspor hanya tabel atau gambar final terverifikasi ke
   `../latex-work-dir/assets/generated/`.
5. Catat hubungan input, script, output, dan bagian naskah di `project.md`.
6. Jangan masukkan data pribadi, kredensial, atau dokumen administrasi ke Git.
