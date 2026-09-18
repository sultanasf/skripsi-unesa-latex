#!/bin/sh
set -eu

status=0
mode=default
case "${1:-}" in
  --ci) mode=ci ;;
  --strict) mode=strict ;;
esac

for command_name in latexmk xelatex bibtex pdfinfo pdffonts rg; do
  if ! command -v "$command_name" >/dev/null 2>&1; then
    printf '%s\n' "ERROR: command tidak tersedia: $command_name"
    status=1
  fi
done

if [ "$mode" = strict ]; then
  for font_file in build/fonts/BookAntiqua-regular.ttf build/fonts/BookAntiqua-bold.ttf build/fonts/BookAntiqua-italic.ttf build/fonts/BookAntiqua-boldItalic.ttf; do
    if [ ! -s "$font_file" ]; then
      printf '%s\n' "ERROR: font strict tidak tersedia: $font_file"
      status=1
    fi
  done
  if [ ! -s build/assets/logo_unesa.png ]; then
    printf '%s\n' 'ERROR: logo strict tidak tersedia: build/assets/logo_unesa.png'
    status=1
  fi
fi

for required_file in \
  main_proposal.tex \
  main_skripsi.tex \
  config/variables.tex \
  ../work-dir/project.md \
  ../work-dir/ai/log.md \
  ../.agents/skills/unesa-latex-template/SKILL.md \
  ../.agents/skills/unesa-quantitative-thesis/SKILL.md \
  ../.agents/skills/unesa-research-workflow/SKILL.md \
  output/proposal/Proposal_UNESA.pdf \
  output/skripsi/Skripsi_UNESA.pdf; do
  if [ ! -f "$required_file" ]; then
    printf '%s\n' "ERROR: file wajib tidak ditemukan: $required_file"
    status=1
  fi
done

for chapter in 1 2 3; do
  if ! rg -Fq "\\input{chapters/bab${chapter}}" main_proposal.tex; then
    printf '%s\n' "ERROR: proposal tidak memuat Bab $chapter."
    status=1
  fi
done

if rg -Fq '\input{chapters/bab4}' main_proposal.tex || \
   rg -Fq '\input{chapters/bab5}' main_proposal.tex; then
  printf '%s\n' 'ERROR: proposal memuat Bab IV atau Bab V.'
  status=1
fi

for chapter in 1 2 3 4 5; do
  if ! rg -Fq "\\input{chapters/bab${chapter}}" main_skripsi.tex; then
    printf '%s\n' "ERROR: skripsi tidak memuat Bab $chapter."
    status=1
  fi
done

for pdf_file in \
  output/proposal/Proposal_UNESA.pdf \
  output/skripsi/Skripsi_UNESA.pdf; do
  if [ -f "$pdf_file" ]; then
    if ! pdfinfo "$pdf_file" | rg -q 'Page size:[[:space:]]+419[.]5[0-9]* x 595[.]2[0-9]* pts'; then
      printf '%s\n' "ERROR: ukuran halaman bukan A5: $pdf_file"
      status=1
    fi
    if [ "$mode" = strict ] && ! pdffonts "$pdf_file" | rg -q 'BookAntiqua'; then
      printf '%s\n' "ERROR: Book Antiqua tidak tertanam: $pdf_file"
      status=1
    fi
  fi
done

if rg -n 'LaTeX Warning:.*undefined|Citation .* undefined|There were undefined references|multiply defined' build/*.log; then
  printf '%s\n' 'ERROR: referensi silang atau sitasi belum selesai.'
  status=1
fi

placeholder_count=$(rg -n '\[[^]]*(belum|Belum|Tulis|tulis|Masukkan|masukkan|Jelaskan|jelaskan|Sajikan|sajikan|Uraikan|uraikan|Nyatakan|nyatakan|Susun|susun|Bandingkan|bandingkan|Berikan|berikan|Lampirkan|lampirkan|Bagian|bagian)' chapters pages | wc -l | tr -d ' ')
if [ "$placeholder_count" -gt 0 ]; then
  printf '%s\n' "WARNING: $placeholder_count placeholder isi masih tersedia."
fi

if rg -n 'Nama Lengkap|000000000|kata kunci [0-9]|keyword [0-9]' config/variables.tex >/dev/null; then
  printf '%s\n' 'WARNING: metadata contoh masih tersedia di config/variables.tex.'
fi

if ! rg -q '^[[:space:]]*@[[:alpha:]]+[[:space:]]*[{(]' refs/references.bib; then
  printf '%s\n' 'WARNING: daftar pustaka belum memiliki entri terverifikasi.'
elif ! rg -q '\\cite[a-zA-Z*]*[[:space:]]*\{' chapters pages formats; then
  printf '%s\n' 'WARNING: entri daftar pustaka belum disitasi dalam naskah.'
fi

if rg -n 'Overfull \\hbox|Overfull \\vbox' build/*.log; then
  printf '%s\n' 'WARNING: overfull box ditemukan; periksa layout PDF.'
fi

if [ "$mode" = ci ]; then
  legacy_pattern=$(printf '\120\105\116\123')
  if rg -n -i "$legacy_pattern" ../README.md ../AGENTS.md ../.agents README.md docs 2>/dev/null; then
    printf '%s\n' 'ERROR: legacy institution reference found in public source.'
    status=1
  fi
fi

if [ "$status" -ne 0 ]; then
  exit "$status"
fi

printf '%s\n' 'CHECK OK: struktur dokumen/workspace, build, ukuran A5, font, dan referensi silang valid.'
