#!/usr/bin/env bash
set -euo pipefail
repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd)"
build_dir="$(mktemp -d -t wasteland-paper.XXXXXX)"
trap 'rm -rf -- "$build_dir"' EXIT
git clone -q https://github.com/biohackrxiv/bhxiv-gen-pdf.git "$build_dir/generator"
git -C "$build_dir/generator" checkout -q 528a72096ee47bd3eea3521b6e93b31fd6469213
cp "$repo_root/paper.md" "$repo_root/paper.bib" "$build_dir/"
resources="$build_dir/generator/resources/biohackrxiv"
# The venue template assumes a published CC BY paper. Keep draft metadata honest.
python3 - "$resources/latex.template" <<'PYTEMPLATE'
from pathlib import Path
import sys
p = Path(sys.argv[1])
t = p.read_text()
t = t.replace(r'Authors retain copyright and release the work under a Creative Commons Attribution 4.0 International License (\href{https://creativecommons.org/licenses/by/4.0/}{\color{linky}{CC-BY}}).', 'Draft licence to be agreed by the authors.')
t = t.replace('  Published by', '  Prepared for')
t = t.replace(r'\begin{document}', r'$if(authors)$$else$\author{Author list open}$endif$' + '\n' + r'\begin{document}')
p.write_text(t)
PYTEMPLATE
cd "$build_dir"
pandoc paper.md -s --biblatex \
  --template="$resources/latex.template" \
  --lua-filter="$resources/filters/strip-trailing-references-heading.lua" \
  -V journal_name=BioHackrXiv.org -V journal_url=https://biohackrxiv.org/ \
  -V logo_path="$resources/logo.png" -V year=2026 \
  -V 'submitted=Draft, not submitted' \
  -V 'event_title=DBCLS BioHackathon 2026' \
  -V event_url=https://2026.biohackathon.org/ \
  -V 'event_location=Matsuyama, Japan, 13–19 September 2026' \
  -V geometry:margin=1in -o paper.tex
lualatex -interaction=nonstopmode -halt-on-error paper.tex > build.log 2>&1 || { cat build.log; exit 1; }
biber paper >> build.log 2>&1 || { cat build.log; exit 1; }
for pass in 2 3; do
  lualatex -interaction=nonstopmode -halt-on-error paper.tex >> build.log 2>&1 || { cat build.log; exit 1; }
done
cp paper.pdf "$repo_root/docs/submission/paper.pdf"
printf 'Built %s\n' "$repo_root/docs/submission/paper.pdf"
cd "$repo_root/docs/submission"
pandoc demos.md --standalone --pdf-engine=lualatex -o demos.pdf
printf 'Built %s\n' "$repo_root/docs/submission/demos.pdf"
