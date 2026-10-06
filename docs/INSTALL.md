# Installation

## Dependencies

- TeX Live with XeLaTeX, Latexmk, BibTeX, and packages listed in
  `latex-work-dir/config/packages.tex`.
- `make`, `unzip`, `grep`, Ripgrep, Poppler `pdfinfo`/`pdffonts`.
- VS Code + LaTeX Workshop optional.
- Windows/macOS: build tooling is POSIX-oriented. See `docs/PLATFORM.md` for
  the adaptation contract before changing any build or check script.

## Public/Fallback Build

```bash
make doctor
make ci
```

Fallback uses the TeX distribution default font and placeholder logo. Output is for drafting and
CI, not final submission.

## Strict Local Build

Obtain official DOCX through authorized UNESA channels. Do not commit it.

```bash
make strict UNESA_TEMPLATE_DOCX="/absolute/path/template.docx"
```

Strict build extracts font/logo into ignored `latex-work-dir/build/` only.

## VS Code

Open repository root. Use `make proposal`, `make skripsi`, or recipe configured in
`.vscode/settings.json`. Compile only root runners, never chapter files directly.
