# Platform Adaptation

Build and verification tooling in this repository targets POSIX systems
(Linux, macOS, WSL). `Makefile`, `latex-work-dir/scripts/check-workspace.sh`,
and the `prepare` step in the VS Code recipe assume `make`, `sh`, `unzip`,
and Poppler tools.

When a user works on Windows or macOS, an AI agent may adapt the orchestration
layer as described here. The LaTeX pipeline itself is already portable.

## Detection

- `uname -s` returns `Linux` or `Darwin`; a missing `make`, `sh`, or `unzip`,
  or `Windows_NT` in the environment, indicates a Windows host.
- If `make ci`, `make proposal`, or `make skripsi` cannot run because a tool is
  missing, enter adaptation mode instead of reporting the workspace broken.

## Allowed changes

- Add or modify build orchestration: PowerShell entry point, Python driver,
  or shims. Keep directory layout and target names recognizable.
- Fix the `.vscode/settings.json` recipe when `make` is unavailable; the
  `prepare UNESA assets` tool step is the only Windows-broken step.
- Add per-OS install instructions to `docs/INSTALL.md`.
- Provide a documented cross-platform equivalent of `check-workspace.sh`
  (for example a PowerShell port) with identical check semantics.

## Invariants (do not change)

1. Compilation stays `latexmk -xelatex` on the root runners only:
   `latex-work-dir/main_proposal.tex` and
   `latex-work-dir/main_skripsi.tex`. Never compile files in `chapters/`,
   `pages/`, `formats/`, or `config/` directly.
2. Output paths stay `output/proposal/Proposal_UNESA.pdf` and
   `output/skripsi/Skripsi_UNESA.pdf`.
3. Page size stays A5 and the strict build still embeds Book Antiqua extracted
   from the user-supplied DOCX (never committed).
4. Fallback mode keeps building with no DOCX present.
5. No DOCX, font, logo, or build cache enters Git.
6. `check-workspace.sh` semantics survive: required files, chapter wiring,
   A5 page size, embedded fonts in strict mode, undefined references and
   citations, placeholder and overfull warnings, public-source scan.
   Porting a check is allowed; weakening or deleting one is not.
7. The POSIX path keeps working: `make ci` stays green on Linux, which is
   what CI validates.

## Tool substitution

| POSIX | Windows | macOS |
| --- | --- | --- |
| `make` | none native: use WSL or a PowerShell/Python driver | `brew install make` (gmake) |
| `sh script.sh` | WSL or Git Bash; or port to PowerShell | built-in |
| `unzip -p archive member` | `Expand-Archive`, .NET `System.IO.Compression`, or Python `zipfile` | built-in |
| `command -v X` | `Get-Command X` | `command -v X` |
| `rg`, `unzip`, Poppler | `winget`, `scoop`, or `choco` | `brew install unzip ripgrep poppler` |
| TeX Live with `xelatex`, `latexmk`, `bibtex` | install-tl or MiKTeX | MacTeX |

## Required verification before declaring done

1. Build both documents on the target OS; both PDFs exist at the invariant
   paths.
2. Page size is A5; in strict mode Book Antiqua is embedded.
3. No undefined references or citations; report placeholder and overfull
   warnings to the user.
4. Run the equivalent of `make check`; never weaken a check to make it pass.
5. Append what was adapted, how it was verified, and residual gaps to
   `work-dir/ai/log.md`.

## Upstreaming

If the adaptation produces tooling that also works on Linux/macOS, propose it
upstream in a pull request so later users need less adaptation: keep `make`
targets as thin wrappers, place shared drivers under `latex-work-dir/scripts/`
or `scripts/`, and suggest a CI matrix row for the new platform.
