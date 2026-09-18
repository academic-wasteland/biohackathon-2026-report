# Academic Wasteland: BioHackathon 2026 report

Working BioHackrXiv submission from DBCLS BioHackathon 2026, Matsuyama, Japan, 13–19 September 2026.

**The author list, affiliations, author order and contribution statements remain open. This is a draft; it has not been deposited with BioHackrXiv.**

## Read the report

- [Manuscript PDF](docs/submission/paper.pdf)
- [Demonstrations: PDF](docs/submission/demos.pdf) and [editable guide](docs/submission/demos.md)
- [Manuscript source](paper.md) and [bibliography](paper.bib)
- [Submission source ZIP](docs/submission/submission-source.zip)
- [Literature search and positioning](docs/submission/literature-search.md)
- [Submission preparation notes](docs/submission/README.md)

The report explains the motivation for a research commons, compares related work, describes FAIRhaven and Camelot, and documents cohort analysis, remote compute, phenotype-guided variant analysis and credential tests. The demonstration guide includes captured screenshots, replay links and reproduction commands.

## Build

```sh
bash docs/submission/build-preview.sh
```

Requires Git, Pandoc, Python 3, LuaLaTeX, Biber and the BioHackrXiv template's LaTeX packages. The script pins the template revision and builds the manuscript and demonstration PDFs. It preserves empty author metadata by displaying an explicit draft placeholder.

The report is 12 pages including references, with a four-page demonstration companion. The venue suggests up to ten pages. Authorship, licence, funding and the event identifier remain to be finalised before deposit; see the preparation notes.

## Software and evidence

- [Research Commons](https://github.com/academic-wasteland/research-commons)
- [Pangenome Town](https://github.com/academic-wasteland/pangenome-town)
- [Wasteland Starter Pack](https://github.com/academic-wasteland/wasteland-starter-pack)

The bibliography pins implementation documentation and captured evidence. Demonstrations are examples of working integrations, not a comparative performance benchmark. Screenshots are reproduced from the cited project records. The manuscript licence remains to be agreed by the authors; upstream software, data, model and evidence rights are separate.
