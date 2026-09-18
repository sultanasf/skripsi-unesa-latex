# Architecture

```text
.
|-- latex-work-dir/       # sumber dan build LaTeX
|   |-- main_proposal.tex  # runner Bab I-III
|   |-- main_skripsi.tex   # runner Bab I-V
|   |-- config/            # metadata dan format
|   |-- pages/             # front matter/lampiran
|   |-- chapters/          # isi bersama
|   |-- refs/              # BibTeX
|   `-- assets/            # aset hasil/user
|-- work-dir/              # bukti, data, analisis, log AI
|-- .agents/skills/        # instruksi agent khusus UNESA
`-- docs/                  # dokumentasi publik
```

Runner menentukan urutan halaman dan bab. `config/variables.tex` menjadi sumber
identitas tunggal. Bab tidak diduplikasi antara proposal dan skripsi. `work-dir`
tidak menjadi sumber LaTeX otomatis; perpindahan output harus disengaja dan
terverifikasi.
