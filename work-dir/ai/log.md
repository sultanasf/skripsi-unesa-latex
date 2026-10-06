# Log Bantuan AI

Gunakan satu bagian bertanggal untuk setiap bantuan substantif.

## Template Entri

### YYYY-MM-DD - Aktivitas

- Aktivitas:
- Input yang dibaca/diberikan:
- File atau bagian yang berubah:
- Keputusan mahasiswa:
- Batasan atau bukti kurang:
- Verifikasi manusia:

### 2026-10-06 - Kontrak adaptasi lintas platform

- Aktivitas: Menyusun kontrak adaptasi platform untuk agent harness agar
  pengguna Windows/macOS dapat menyesuaikan lapisan orkestrasi build tanpa
  melemahkan pemeriksaan dan tanpa merusak jalur Linux.
- Input yang dibaca/diberikan: `AGENTS.md`, `.opencode/opencode.json`,
  `docs/INSTALL.md`, `latex-work-dir/Makefile`,
  `latex-work-dir/scripts/check-workspace.sh`, `.github/workflows/ci.yml`,
  `.vscode/settings.json`, `latex-work-dir/.latexmkrc`; arahan pengguna pada
  percakapan.
- File atau bagian yang berubah: `docs/PLATFORM.md` (baru), `.gitattributes`
  (tambahan aturan eol untuk `*.bat`/`*.ps1`), `AGENTS.md` (bagian Platform
  Adaptation), `.opencode/opencode.json` (instructions), `docs/INSTALL.md`
  (pointer Windows/macOS).
- Keputusan mahasiswa: Memilih pendekatan catatan kontrak yang dieksekusi
  agent alih-alih porting penuh sekarang; meminta commit berisi catatan.
- Batasan atau bukti kurang: Host belum memiliki TeX Live yang berfungsi,
  sehingga `make ci` end-to-end belum dapat dijalankan; verifikasi terbatas
  pada JSON, sintaks shell, `make prepare`, dan pemindaian token.
- Verifikasi manusia: (diisi mahasiswa)
