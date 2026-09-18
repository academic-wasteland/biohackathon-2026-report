# BioHackrXiv submission preparation

Prepared 18 September 2026 from the supplied [publication slides](https://docs.google.com/presentation/d/193Qbc3M29t1Qr0PrRvPKinDXPvfcH3CJ4hBkMOUmChY/edit?slide=id.g2af314f854e_2_53) and the [current submission guidance](https://guide.biohackrxiv.org/submission_guidelines.html).

## Files

- `../../paper.md`: manuscript and BioHackrXiv YAML metadata; canonical editable source.
- `../../paper.bib`: references with pinned implementation snapshots.
- `paper.pdf`: locally compiled review copy using the BioHackrXiv LaTeX template.
- `demos.md` and `demos.pdf`: supplementary demonstration guide with replay/live links, expected results, reproduction commands and captured screenshots.
- `figures/`: unchanged screenshots from the documented cohort and visitor rehearsals.
- `submission-source.zip`: manuscript, bibliography and demonstration sources; complete authorship before using the official preview service.
- `literature-search.md`: search scope, consulted primary sources and comparison rationale.
- `build-preview.sh`: repeatable draft build. Requires Pandoc, Python 3, LuaLaTeX, Biber and the template's LaTeX packages.

Pagination needs a rebuild: the draft was 13 pages including references before the independent-implementation sections were added, and the demonstration companion is five pages. The venue suggests up to ten pages, so final editorial tightening may be appropriate after author review. The abstract is 254 words and all 41 bibliography entries are cited.

## Authorship remains open

The manuscript deliberately contains `authors: []` and `affiliations: []`. No author order or contribution assignments have been inferred. Populate these with the agreed contributors, affiliations, ORCIDs and CRediT roles, and replace `authors_short`. Robert's ORCID, if he is included, is `0000-0001-8149-5890`.

The official generator requires at least two authors. This draft preview uses its LaTeX template directly through Pandoc so it can display “Author list open” in place of author names. The PDF is labelled draft and not submitted; the template’s publication and CC BY notices are replaced with draft wording pending the authors’ choice. The source ZIP will need the completed author metadata before the official generator accepts it. All listed authors must approve the final manuscript before submission, as required by the venue.

## Remaining publication metadata

The [event index](https://index.biohackrxiv.org/meetings/) did not list Japan 2026 when checked on 18 September 2026. The [event website](https://2026.biohackathon.org/) confirms the name, dates and location used in the manuscript. Confirm registration and the official event identifier with the organisers before depositing; the current `event` value is a descriptive label, not an asserted registry code.

Agree the manuscript licence, funding statement, acknowledgements and contribution roles with the authors. The venue recommends CC BY or CC0. Resource and model rights remain separate from the manuscript licence.

The manuscript source and review artifacts are maintained in the dedicated [BioHackathon 2026 report repository](https://github.com/academic-wasteland/biohackathon-2026-report). Its root contains `paper.md` and `paper.bib`, and the manuscript `git_url` identifies this repository. The preview service also accepts the source ZIP.

## Evidence and scope

The report uses the existing phenotype/variant proof dated 17 September, cohort and visitor rehearsals dated 16 September, and documented certification scenarios. An additional Sysifoss rehearsal on 18 September completed one public-data CSC TES job and two pre-dispatch rejection cases; its recording and crate are published with the Sysifoss demo. Software changes already present in neighbouring working trees were left untouched. References pin committed documentation, independently of those uncommitted changes.

Numerical results were checked against `private-variant-demo.md` and `private-variant-proof.md`: 1,529 mouse profiles, FBN1 gene rank 3, four of six calls retained, REVEL-only rank 2 and combined rank 1. The combined scores were recomputed from the documented formula. The cohort rehearsal reports 510 shared biallelic sites; the visitor proof records two completed DDBJ jobs and three aggregate counts. Certification results come from the documented scenario suite. Sysifoss used a scripted reasoner with real TES execution; four local broker tests and 65 carrier tests passed. Local stage workers, remote Slurm execution, live relay queries and historical browser replay are distinguished in the paper and supplement. Broad historical test totals are omitted because they do not describe one frozen cross-repository release.

The implemented deployment uses a shared relay and co-hosted demonstration towns. Strict certification tests and the public phenotype workflow are described separately. Sysifoss implements TES dispatch and RO-Crate contribution packaging using the reviewed Research Commons integration branch. Independent implementation evaluation, stronger host isolation, complete output/log collection and multi-town packaging remain future work. `repository-snapshots.json` records all nine organisation repositories reviewed and the additional RO-Crate branch.

## Build and final submission

Run `bash docs/submission/build-preview.sh` from the repository root for a draft preview. The script checks out the exact BioHackrXiv generator revision in a temporary directory, builds outside the source tree and copies the main PDF here, then builds the demonstration PDF from the companion Markdown and screenshots.

After completing metadata, use the official [preview service](https://preview.biohackrxiv.org/) or its [generator](https://github.com/biohackrxiv/bhxiv-gen-pdf). Upload the resulting PDF through the [BioHackrXiv submission portal](https://biohackrxiv.org/), with source files as supplementary material. Publishing this repository makes the draft available for collaboration; a BioHackrXiv preprint deposit has not been made.
