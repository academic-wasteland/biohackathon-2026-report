# Literature search and positioning

Searched 18 September 2026. This is a focused narrative search for relevant predecessors, not a systematic review. Searches covered scientific multi-agent systems; agent interoperability and delegation; semantic bioinformatics services; and federated execution, access and provenance. Primary papers, author manuscripts and official specifications were used for manuscript claims. Search snippets and commentary sites were used only to locate primary sources.

## Search themes

- `multi agent scientific research AI scientist Agent Laboratory AI co scientist`
- `Agent2Agent protocol scientific research agents federation discovery MCP`
- `federated scientific workflows GA4GH WES TES RO-Crate Workflow Run Crate`
- `GA4GH Passports digital identity access permissions`
- `SADI semantic automated discovery integration scientific web services`
- Citation and publisher follow-up for Paper2Agent, AIP, SADI, Passports and TES.

## Included comparisons

| Source | Primary material consulted | What it establishes for this report |
|---|---|---|
| Agent Laboratory, Schmidgall et al. (2025), v2 | [Full author manuscript](https://arxiv.org/html/2501.04227v2) | Coordinated literature review, experimentation and report writing, with human feedback. Cite as a preprint. |
| Co-Scientist, Gottweis et al. (2026) | [Nature article](https://doi.org/10.1038/s41586-026-10644-y), architecture and methods | Multi-agent hypothesis generation, critique and refinement. Use the published article rather than only its earlier preprint. |
| Paper2Agent, Miao et al. (2026) | [Nature article](https://doi.org/10.1038/s41586-026-11044-y), framework and demonstrations | Converts paper code into tested MCP services and already demonstrates cooperating agents. Published 16 September 2026, relevant to this event-end report. |
| A2A v1.0.0 | [Official specification](https://a2a-protocol.org/v1.0.0/specification/), especially sections 7, 8 and 13 | Agent discovery, tasks and explicit authentication/authorisation responsibilities. Do not claim A2A lacks authorisation. |
| MCP 2025-11-25 | [Specification](https://modelcontextprotocol.io/specification/2025-11-25) and [authorisation specification](https://modelcontextprotocol.io/specification/2025-11-25/basic/authorization) | Tool/resource interfaces and OAuth-based authorisation for protected HTTP services. |
| SADI, Wilkinson et al. (2011) | [Full primary article](https://doi.org/10.1186/2041-1480-2-8), service model and discovery | Semantic typing and service composition predate current LLM agents. |
| TES, Kanitz et al. (2024) | [Full author manuscript](https://arxiv.org/html/2405.00013v1), [author publication record](https://www.microsoft.com/en-us/research/publication/the-ga4gh-task-execution-application-programming-interface-enabling-easy-multicloud-task-execution/) | Batch execution across compute environments and compute-to-data use. Bibliography cites final journal DOI. |
| WES | [Official GA4GH documentation](https://www.ga4gh.org/product/workflow-execution-service-wes/) | Workflow execution interface; possible future backend, not a claimed implemented adapter. |
| GA4GH Passports, Voisin et al. (2021) | [Author-hosted paper](https://orbilu.uni.lu/bitstream/10993/48800/1/passport.pdf) and [official product documentation](https://www.ga4gh.org/product/ga4gh-passports/) | Portable researcher attributes and permissions; relevant precursor for credential interoperability. |
| AIP, Prakash (2026), v1 | [Full preprint](https://arxiv.org/html/2603.24775v1), protocol, related work and limitations | Invocation-bound delegation and scope attenuation are overlapping work. Cite its mechanism, without adopting its broad novelty/security claims. |
| Workflow Run RO-Crate, Leo et al. (2024) | [Full PLOS ONE article](https://doi.org/10.1371/journal.pone.0309210), profiles and implementations | Existing packaging for execution provenance; future integration target. |

Crossref supplied Co-Scientist and Workflow Run RO-Crate bibliography metadata. Publisher/arXiv author lists supplied the other entries where Crossref rate limits prevented retrieval. Bibliographic author lists describe the cited papers; the Wasteland manuscript author list remains empty.

## Resulting argument

Motivation follows the local wrap-up slides, especially slide 1 and its speaker notes: a human currently mediates discovery, request translation and result routing; reusable operational conventions could let independently operated services coordinate within the owners' permissions. Local control, complementary expertise, participation with existing infrastructure and inspectable attribution motivate federation. These are design goals, not measured adoption or efficiency results.

The related-work section explicitly credits existing agent collaboration, semantic service discovery, execution federation, permissions and provenance. The contribution is their concrete integration in the described hackathon prototype. No priority, comparative performance or universal interoperability claim is made. The manuscript distinguishes the custom relay deployment from A2A conformance, and potential MCP/GA4GH/RO-Crate integrations from implemented paths.

## Expanded BioHackathon lineage and demonstration sources

The follow-up search used the BioHackrXiv archive, DOI records and report PDFs to identify projects with overlapping responsibilities. Queries covered BioHackathon semantic web services, logic programming, workflow provenance, FAIR Digital Objects and RDF-backed MCP tools. Full report PDFs were downloaded from OSF and their text inspected; claims below are based on those reports, rather than archive summaries.

| Earlier project | Primary report | Relationship and distinction |
|---|---|---|
| BioHackathon 2008 | [Katayama et al., 2010](https://doi.org/10.1186/2041-1480-1-8) | Service interfaces, data exchange and BioMoby/workflow integration establish the longstanding distributed-service problem. |
| BioHackathon 2010 | [Katayama et al., 2013](https://doi.org/10.1186/2041-1480-4-6) | Semantic Web infrastructure, identifiers and clients precede the town service descriptions. |
| Logic programming, Japan 2019 | [Mungall et al., 2020](https://doi.org/10.37044/osf.io/km9ux) | Prolog/SPARQL, Biolink and type inference relate to explicit contracts. The report itself identifies Japan 2019; an archive category is inconsistent with this. |
| WfExS/Workflow Run Crate, Europe 2023 | [Fernández et al., 2024](https://doi.org/10.37044/osf.io/7f94w) | Already describes data providers, permissions and a workflow ecosystem. Wasteland adds a particular agent-facing exchange, with interoperable packaging still to implement. |
| FAIR Digital Objects, Europe 2023 | [Soiland-Reyes et al., 2024](https://doi.org/10.37044/osf.io/gmk2h) | RO-Crate, Bioschemas and Signposting are foundations to reuse for research-object discovery and packaging. |
| MCP server tools with RDF shapes, Japan 2025 | [Labra Gayo et al., 2025](https://doi.org/10.37044/osf.io/8qeh5_v1) | TogoMCP, schema context and rudof support knowledge-graph querying. Receiver task admission has a different role. The bibliography uses the full PDF's ten-author list. |

The two journal author lists were retrieved from Crossref. BioHackrXiv author lists and dates were checked against the full PDFs. Event dates and publication years are distinguished in the manuscript.

Implementation documentation and captured browser proofs were also read at pangenome-town `585b32fc45d741e84290c6d2cb84b659395ecb0c` and starter-pack `eeb5f712182ab630db29798dda990290657ef529`. These add FAIRhaven's persisted bounded auditor, Camelot's reviewed issuance interface, cohort and visitor demonstrations, and separate static replay/live presentation paths. Earlier pinned citations remain where they identify the original variant proof or protocol documentation. The manuscript does not treat these snapshots as one tested release. Supplementary screenshots come from the dated source proofs and were not regenerated during writing.


## Sysifoss and implemented standards (18 September update)

All nine Academic Wasteland repositories were cloned and reviewed at their default branches. Sysifoss adds an implemented TES mapper, dispatch/polling broker and RO-Crate completion carrier. Its dependency is Research Commons' `ro_crates` branch (open PR 3 at review time); the default Research Commons branch lacks `ROCrateBuilder`. The report now separates implemented TES/carrier support from future WES, Passport, complete artifact capture and multi-town packaging.

The broker code, mapper, stage, CLI demos and tests were read alongside the carrier builder, recovery code, schema, SHACL constraints and tests. The source distinguishes the scripted demo reasoner and mocked CLI dispatch from the web stage's real TES call. The 18 September rehearsal completed one public-data task and captured two pre-dispatch refusals. Four local broker tests and 65 carrier tests passed. The live case was exercised through the stage, rather than repeated through the separate live test.

The [official Process Run Crate specification](https://www.researchobject.org/workflow-run-crate/profiles/process_run_crate/) clarifies the distinction between software execution actions and full workflow provenance. The reviewed code declares RO-Crate v1.1, Process Run v0.1 and its own carrier profile. The manuscript reports those declared versions and project checks; it does not infer current-version or externally certified conformance. The code's telemetry digest is a placeholder and outputs/logs are references. These are explicit implementation limits in the main text.
