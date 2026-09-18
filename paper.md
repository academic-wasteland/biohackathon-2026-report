---
title: 'Academic Wasteland: a federated research commons for discovery, delegation and local control'
title_short: 'Academic Wasteland: a federated research commons'
authors: [Robert Hoehndorf, Michel Dumontier, Alexander Kanitz, Chang Sun, Daniel Puthawala, Priscilla Joanne, Dawn Chen, Angganararas Lungidningtyas, Jiandong Chen, Nuria Fabrega]
affiliations: []
authors_short: 'Draft: author list open'
date: '18 September 2026'
tags:
  - federated research
  - scientific agents
  - semantic interoperability
  - authorisation
  - provenance
bibliography: paper.bib
event: 'DBCLS BioHackathon 2026'
biohackathon_name: 'DBCLS BioHackathon 2026'
biohackathon_url: 'https://2026.biohackathon.org/'
biohackathon_location: 'Matsuyama, Japan, 13–19 September 2026'
group: 'Academic Wasteland'
git_url: 'https://github.com/academic-wasteland/biohackathon-2026-report'
abstract: |
  Using another laboratory's scientific services requires researchers to discover capabilities, translate requests, coordinate execution and respect restrictions on data use. Shared conventions could let agents perform this coordination while each laboratory retains control of its resources. During DBCLS BioHackathon 2026, we developed Academic Wasteland, a prototype research commons organised into independently configurable nodes called towns. The implementation combines authenticated message exchange, provider-owned semantic service descriptions, receiver-controlled authorisation, and versioned conformance profiles. Demonstrations expose their inter-town messages and keep controlled data within the local analysis step. Separate executable certification scenarios exercise scoped trust, holder binding, delegation and revocation. These results establish a working integration of discovery, local policy and bounded scientific services. The present deployment uses a shared relay and co-hosted demonstration towns; an independently implemented client and separately administered town have since interoperated with the credential and status profile, while stronger host isolation and complete reproducibility packaging remain subsequent milestones.
---

**Working submission draft. The author list, affiliations, contribution statements and author order remain open.**

# Introduction

Scientific expertise, data and computational resources are distributed across laboratories. Consider a researcher investigating a possible genetic cause of a phenotype: a specialist service may maintain a useful prediction model, another institution may hold relevant variants under access restrictions, and a third group may provide an independent interpretation. Bringing these contributions together requires finding the services, establishing compatible inputs, obtaining permission, coordinating execution and understanding the evidence returned. As more scientific methods become accessible through agents, the ability to organise such collaborations becomes a research infrastructure problem.

A researcher can already coordinate these steps through email, web interfaces and scripts. Email can carry the question, data and answer, but the person must identify the recipient, translate each request, relay intermediate results and track the conditions under which they may be used. Bespoke scripts can automate an agreed collaboration, at the cost of encoding each service's interface and assumptions. We want a researcher to state an objective and let compatible services coordinate the routine steps under explicit local rules, while the researcher controls the objective, permitted actions and interpretation of the result. The practical motivation is to reduce the repeated integration work needed to use another laboratory's capabilities.

Local control is essential to this goal. A laboratory should be able to contribute a model or analysis service while retaining its choice of software, hardware and trusted collaborators. A data custodian should be able to permit a particular computation and release a limited result. A collaborator should be able to inspect who requested an analysis, which service performed it and which inputs and evidence support its output. Shared descriptions and linked research objects could also make small contributions easier to attribute and results easier to repeat or challenge. These are design objectives whose operational costs and benefits require evaluation.

The resulting vision is a research commons in which temporary collaborations can form around questions. Participation would consist of exposing a bounded capability under the provider's own conditions. This gives individual laboratories a reason to join before a complete ecosystem exists: they can offer an existing service and obtain complementary services through the same conventions. Common interfaces could reduce dependence on one agent framework or platform, while independent operation could preserve institutional responsibility for data and compute. The immediate question is which conventions are sufficient to make one useful collaboration work.

We investigated this question during [DBCLS BioHackathon 2026](https://2026.biohackathon.org/), held in Matsuyama, Japan, on 13–19 September 2026 [@DBCLS2026]. A pre-hackathon proposal and semantic checker provided the starting point. During the event, we developed Academic Wasteland: communicating research nodes called towns, semantic service catalogues, scoped credential checks and executable demonstrations. This report describes the implemented connections between discovery, delegation and local admission decisions. Cohort comparison, remote execution and a phenotype-to-variant workflow test bounded instances of the intended collaboration; separate scenarios test certification failures. The software is available through the [Academic Wasteland organisation](https://github.com/academic-wasteland).

# Related work

## Scientific agents and reusable research methods

Agent Laboratory organises literature review, experimentation and report writing into a workflow of specialised language-model agents, with human feedback at each stage [@AgentLaboratory]. Co-Scientist uses generation, critique, ranking and refinement agents to develop hypotheses from a scientist's objective and evaluates proposals in biomedical applications [@CoScientist]. These systems show how agents can coordinate scientific reasoning within an orchestrated application. Wasteland addresses the deployment boundary around such capabilities: how separately operated services advertise themselves, receive requests and apply their own permissions. Either style of research assistant could act as a client or provider in that setting.

Paper2Agent is particularly close to the intended ecosystem. It converts papers and associated code into tested Model Context Protocol (MCP) tools and paper-specific agents, and demonstrates collaboration among multiple agents for gene prioritisation [@Paper2Agent]. It therefore already addresses executable dissemination and cooperation among scientific methods. Wasteland concentrates on the operational conditions for using such methods across custodians: provider-owned discovery metadata, receiver-selected trust and control over intermediate disclosures. Connecting a Paper2Agent service would be a concrete interoperability test.

## Agent protocols and semantic service discovery

MCP standardises access to tools, resources and prompts, and specifies OAuth-based authorisation for protected HTTP services [@MCP; @MCPAuthorization]. Agent2Agent (A2A) defines Agent Cards, messages, tasks and interaction patterns between agents. Its v1.0.0 specification requires authentication and authorisation checks and leaves the detailed policy to the server [@A2A]. These protocols provide relevant communication and security mechanisms. Wasteland makes application-level scientific requirements explicit, such as dataset-specific grants, semantic input types and checks before result release. The demonstrated deployment uses its own documented relay envelope; standards-based transport interoperability remains a separate conformance task.

Semantic discovery also has a substantial history in bioinformatics. Semantic Automated Discovery and Integration (SADI) describes services through Resource Description Framework (RDF) data and Web Ontology Language (OWL) input and output classes and supports their discovery and composition [@SADI]. FAIRhaven follows this established motivation for machine-readable service descriptions, using a restricted JSON for Linked Data (JSON-LD) profile with Data Catalog Vocabulary (DCAT) and Semanticscience Integrated Ontology (SIO) terms. Its implemented semantic search retrieves candidate services, while installed operation adapters perform the demonstrated planning. General semantic workflow composition is a further development objective.

## Federated execution, permissions and provenance

The Global Alliance for Genomics and Health (GA4GH) Task Execution Service (TES) provides a common interface for batch tasks across computing environments, including execution near distributed data [@TES]. Its Workflow Execution Service (WES) exposes workflow submission and management [@WES]. Sysifoss implements the TES connection: a Python broker translates a research task into a TES request, polls its execution state and packages a completion contribution [@Sysifoss]. WES and Passport integration remain separate development targets. Wasteland connects these execution interfaces to discovery and receiver-controlled task admission.

GA4GH Passports encode researcher attributes and access permissions as machine-readable visas for federated use [@Passports]. Wasteland's credential model addresses related requirements, with separate claims and bindings to an agent holder, exact task and receiver. Passport translation should preserve issuer trust and the meaning of each permission. The Agent Identity Protocol (AIP) preprint also proposes invocation-bound tokens and attenuated delegation across MCP, A2A and HTTP [@AIP]. This overlap makes cross-protocol authorisation a candidate for reuse and comparison. Wasteland's current credential encoding remains project-specific.

Workflow Run RO-Crate packages computational inputs, outputs, software and execution provenance, with implementations across several workflow systems [@WorkflowRunCrate]. The Research Commons RO-Crate branch now implements a message carrier with JSON-LD metadata, a Schema.org execution action and digest-checked recovery; Sysifoss uses it for completion contributions [@ROCrateCarrier; @Sysifoss]. This packages an individual contribution. Complete multi-town execution packaging remains a further step. Together, these predecessors locate the contribution of this hackathon in an executable integration of established ideas: discovering a scientific capability, checking authority to use it, carrying out the allowed operation and preserving evidence of the exchange.

## Relationship to earlier BioHackathon projects

The BioHackathon series has addressed distributed scientific services since its early meetings. The BioHackathon 2008 report describes incompatible service interfaces and exchange formats, with BioMoby and workflow tools as integration mechanisms [@BH2008]. BioHackathon 2010 extended this agenda to linked data, identifiers, ontologies and semantic clients [@BH2010]. Wasteland continues that integration problem at the point where an agent chooses and requests an operation under another provider's policy.

The 2019 logic-programming group connected Prolog and SPARQL resources, extended Biolink representations and explored type inference [@LogicReport]. This is a methodological predecessor for explicit machine-interpretable contracts. Wasteland uses a restricted message vocabulary and receiver-controlled ontology to decide task admissibility, alongside procedural checks for credentials and execution.

Two BioHackathon Europe 2023 submissions provide direct reuse opportunities. The WfExS/Workflow Run Crate report describes an ecosystem of workflow creators, data providers, registries, execution and deposition services [@WfExSReport]. The FAIR Digital Objects report connects RO-Crate, Bioschemas and Signposting for discoverable research objects [@FDOReport]. Wasteland adds an agent-facing request and permission exchange around these roles; the implemented RO-Crate carrier now provides a concrete point of connection, with cross-tool validation and complete run capture still required. The Japan 2025 report *MCP server tools with RDF shapes* develops TogoMCP, schema context and rudof integration for natural-language access to RDF resources [@MCPShapes]. Such a service could supply a town's knowledge-graph capability. Its schema context guides query construction; Wasteland's receiver contracts decide whether a submitted task is admissible.

## Position within the state of the art

Table 1 separates the established capability in each research line from the integration tested here. The comparison concerns responsibilities and evidence; comparative performance evaluation is future work.

Table: Established approaches and Wasteland's present scope.

| Research line | Established capability | Scope of the Wasteland prototype |
|:---|:---|:---|
| Agent Laboratory, Co-Scientist, Paper2Agent | Scientific reasoning, tool use and cooperating agents | Services operate behind separately configurable town policies; the demonstrated planner uses installed adapters. |
| MCP, A2A and AIP | Tool and agent interfaces, authentication hooks and delegated authority | Scientific claims, task binding and release gates; current relay and credential profiles need cross-implementation testing. |
| SADI and BioHackathon RDF/MCP work | Typed service discovery, composition and schema-guided queries | Provider-owned descriptions plus bounded discovery; general semantic planning remains prospective. |
| GA4GH TES/WES and Passports | Portable execution and federated access information | Sysifoss maps research tasks to TES requests; WES and Passport adapters remain prospective. |
| WfExS, RO-Crate and FAIR Digital Objects | Reproducible execution, provenance packaging and discovery | RO-Crate message carrier and Sysifoss completion packaging; complete multi-town run packages remain prospective. |

# Implementation

## Towns and message exchange

A town is an operational boundary containing services or agents, local resources and policies. A resident is an addressable service or agent within a town. This distinction lets a researcher contact a service without prescribing its internal model, workflow engine or programming language.

The hackathon deployment uses a shared HTTPS relay. Each town authenticates using its own bearer token. Messages contain a unique identifier, sender, recipient, timestamp, message kind and structured body. Replies reference the original request and reverse its endpoints. The relay checks the authenticated sender and rejects conflicting reuse of an identifier. Workers preserve replies before transmission so that interrupted delivery can retry the same message. This provides durable message handling; local handler side effects still require their own recovery strategy [@RelayProtocol].

The relay transports messages, while receiving towns select and execute handlers. Its credential establishes the sending town's transport identity. Agent qualifications and permissions are checked separately. This separation permits a small message client to participate while leaving scientific execution under the receiving operator's control.

## FAIRhaven: discovering capabilities and inspecting evidence

FAIRhaven applies the Findable, Accessible, Interoperable and Reusable (FAIR) principles to a practical question: which provider offers an operation with suitable scientific inputs and outputs, and what evidence accompanies that description? Providers publish their own service and dataset catalogues. Each entry identifies its publisher, operation, semantic types, formats, constraints, version, documentation and reuse conditions. The Python service harvests these catalogues over authenticated town messages, stores snapshots and revision history in SQLite, and exposes a web catalogue, JSON-LD and machine-readable search [@FairServices]. Another operator can run an index using the same implementation.

Registration fetches the requesting town's complete catalogue, validates publisher identity, identifier scope, locally controlled JSON-LD context and revision, then returns a persistent receipt. Malformed updates leave the previous snapshot intact; withdrawal and failed contact preserve an inspectable history. A pinned input/output type hierarchy supports semantic search. The catalogue separates provider declarations, metadata checks and observed demonstrations. Licence gaps remain visible, and the provider retains access decisions.

An hourly auditor contacts towns sequentially using reviewed, bounded probes. It can inspect catalogue replies, run synthetic phenotype examples and verify small public resource downloads. It labels unsupported operations or exhausted budgets as untested. Scheduling, reports and notification retries persist in SQLite. Providers receive private findings and metadata suggestions; the public interface exposes counts and timestamps. A successful probe establishes the specific response observed at that time [@FairAuditor]. This makes the difference between an advertised capability and a tested interaction visible to a prospective collaborator.

Concord complements FAIRhaven with versioned operating profiles and component-level conformance reports. Its initial holder-key and signed-status profiles contain nine and seventeen checks respectively. Reports identify the implementation, observer, profile and per-check outcomes. Receivers choose which profiles and observations they accept [@Concord].

## Camelot: issuing scoped credentials after review

Camelot is a town hosting a credential registrar and configurable demonstration issuers, including ethics and data-access authorities. It gives a requester a route from a missing permission to an application, a recorded human decision and a signed credential. Receivers independently choose which Camelot issuers, other institutions or local providers they trust for each claim [@Camelot; @Certification].

The Python registrar maintains file-backed issuer descriptions, applications, credentials and revocation state. Public keys and credential material are separated from private signing keys. A requester supplies its holder identity and key, requested claim and purpose. The operator reviews the application through a command-line interface or protected local cockpit, approves or denies it, and records the decision. Review evidence stays in private audit files. Approval issues an Ed25519-signed credential; receivers obtain its status through configured registrar endpoints. Public application submission and status retrieval remain separate from the operator's approval interface [@CamelotReview].

Camelot's purpose is to make the source, scope and lifecycle of an authority claim explicit. The receiving town still checks the holder, required claim types, task and audience bindings, expiry and status. Demonstration ethics issuers exercise this mechanism with synthetic or public data. Institutional adoption would require recognised review procedures, accountable issuers and appropriately isolated services.

## Sysifoss: standard execution and RO-Crate carriers

Sysifoss is a dedicated compute-broker town. Its Python mapper converts a Research Commons task into GA4GH TES inputs, outputs and a container command, retaining the task identifier and canonical document digest in TES tags. The broker uses `py-tes` to submit the request, polls execution state, handles terminal failures and packages a successful completion as a ResearchContribution [@Sysifoss]. Admission calls the Research Commons semantic validator against a local contract manifest and requires an entailed result before dispatch. The runtime can use the KM reasoner; the supplied demonstrations inject a deterministic reasoner to exercise the control flow.

Packaging uses the Research Commons `ro_crates` branch, which was an open integration pull request at the reviewed snapshot [@ROCrateCarrier]. The carrier stores the complete JSON-LD message, RO-Crate v1.1 metadata and a Schema.org CreateAction linking the actor, inputs or outputs and, when supplied, software. With a software instrument, it declares the Process Run Crate v0.1 profile. JSON Schema and SHACL checks validate the project carrier profile; recovery checks message identity, canonical digest and action linkage, with bounded ZIP extraction and rejection of unsafe paths. This is an implemented standards-based carrier with project-specific validation.

The current broker packages a completion statement and references to output and telemetry. Materialising the referenced output bytes and execution logs, replacing the placeholder telemetry digest with a measured value, and validating against external profile implementations remain necessary for a complete reusable execution package. The reviewed daemon entry point initialises the broker; automatic ledger consumption and signed contribution delivery described in the design require further integration. These boundaries distinguish the implemented mapper, polling and carrier from the broader deployment architecture.

## Semantic contracts and receiver-controlled authorisation

The Research Commons prototype validates messages in layers. JSON Schema checks serialised structure. Shapes Constraint Language (SHACL) checks graph constraints. An OWL semantic gate tests consistency and entailment against a trusted, versioned ontology bundle using the Kobayashi-MaRust reasoner. Sender assertions are restricted to permitted assertions about individuals; the receiver controls the ontology and its own additional facts. The checker distinguishes entailed, unknown, invalid and indeterminate outcomes [@ResearchCommons].

Protected computation requires additional procedural and cryptographic checks. Credentials and signed presentations bind an agent to its key, the exact task and the receiving town. Each receiver specifies which issuer may attest which claim within which dataset and operation scope. Qualification, ethics approval, dataset permission, compute permission and human delegation are distinct claims. A policy may require several claim types together while accepting alternative trusted issuers for a particular type [@Certification].

Delegated issuer authority is bounded by claim type, scope, dataset and permitted delegation depth. Status is rechecked before execution and before releasing results. A Keycloak adapter maps authenticated, introspected issuer, subject and group information to configured qualifications. The credential signature encoding is a project-specific profile. Credential issuance therefore remains a substantive decision about evidence, and interoperability with other credential implementations requires additional profile agreement.

# Use cases and demonstrations

The demonstrations test distinct boundaries: service discovery, dataset permission, access to remote compute, restricted disclosure and issuer choice. Results below come from dated captured runs and implementation documentation. Supplementary demonstration notes provide replay instructions, screenshots and the evidence associated with each case.

## Comparing cohorts under separate permissions

A researcher requests allele counts for the same genomic region from two logical cohorts in the public JaSaPaGe VCF. Ubar manages a nine-sample Saudi view and Yamatai a ten-sample Japanese view. The local stage withholds Ubar's dataset permission initially. An operator approves the exact region and aggregate output, issuing a signed grant; two local workers then run `bcftools` and recheck credentials before release. The captured rehearsal returned 510 shared callable biallelic sites in GRCh38 chr6:29940000–29950000. Attempting individual-genotype export with the aggregate approval was refused before an export process started [@StageDemo].

This case demonstrates permission-dependent execution and output scope over real public-source data. Cohorts are selected through sample manifests, and the displayed counts describe these small sample sets. The stage uses local workers and isolated demonstration authorities. A separate custody-adapter verification documents Yamatai executing Ubar's approved cohort task on DDBJ Slurm, with unsigned requests refused and successful-task replay returning the stored result [@DatasetCustody]. That adapter uses short-lived custodian grants for public-source cohorts; its policy is distinct from the native controlled-computation certification path.

## A visitor obtains remote compute

A second case starts with a visitor who has data but needs another town's execution capability. The visitor grants dataset permission, Yamatai supplies compute permission, and an isolated Camelot ethics issuer supplies the remaining required claim. Before that approval, the workflow waits without transferring the file or submitting a job. The approval binds the exact input fingerprint, task and destination [@StageDemo].

The default input is a synthetic three-site, two-sample VCF. After approval, Yamatai transfers it and submits a bounded Slurm job through DDBJ. The documented rehearsals completed jobs 20604587 and 20604631; the browser proof verified alternate/called allele counts of 1/4, 3/4 and 1/4. Credentials and the input binding are checked before transfer and before release, and the workflow returns aggregate output while cleaning up individual-level staged files [@VisitorProof]. This demonstrates cooperation among a data holder, an execution provider and an accepted authority. The isolated approval is a test credential; production use requires the institution's actual governance process.

## Phenotype-guided analysis with local variant filtering

We used a synthetic Marfan teaching case to test whether a town could obtain phenotype-based gene ranks, combine them with a locally held variant file and request interpretation of the selected allele. The input phenotypes include ectopia lentis, arachnodactyly and aortic root aneurysm, supplied as labels paired with Human Phenotype Ontology identifiers. Owner-controlled resource metadata specifies permitted compute locations and recipients, including the prohibition on exporting the complete variant file [@VariantDemo].

A contact service discovers suitable advertised operations and returns a bounded plan. Yamatai sends phenotype information to Ubar, where the installed INDIGENA model ranks mouse gene profiles and returns human orthologue annotations. Yamatai then opens its own synthetic Variant Call Format (VCF) file and filters its six heterozygous calls. Retention requires PASS status, read depth of at least 10, genotype quality of at least 20, allele frequency at most 0.001 and membership in the returned gene list. Four calls pass.

For each retained call, the demonstrator computes

$$s = \frac{0.45}{1+\log_2(r)} + 0.55v,$$

where $r$ is the phenotype-based gene rank and $v$ is the REVEL variant score. This explicit heuristic combines the two evidence sources. The selected allele is evaluated after ranking; its identity is excluded from the inputs to the rankers.

The [captured live run](https://github.com/academic-wasteland/pangenome-town/blob/main/docs/private-variant-proof.md) reports FBN1 at rank three among 1,529 mouse gene profiles. The FBN1 allele ranks second by REVEL alone and first under the combined heuristic. Table 2 shows how the phenotype rank changes the order of the leading two retained candidates [@VariantProof; @VariantDemo].

Table: Comparison of the selected FBN1 allele and the synthetic ADAMTSL4 decoy in the teaching case. Combined scores are rounded.

| Candidate | Phenotype gene rank | REVEL score | Combined score | Combined rank |
|:---|---:|---:|---:|---:|
| FBN1 | 3 | 0.821 | 0.6256 | 1 |
| ADAMTSL4 decoy | 5 | 0.860 | 0.6085 | 2 |

The selected allele is GRCh38 15:48421680 T>C, FBN1 NM_000138.5:c.7577A>G (p.Asn2526Ser). Yamatai sends that allele and resolved phenotype identifiers to Themis, an interpretation service at Ubar. The complete VCF, genotypes and candidate shortlist stay within Yamatai's local analysis step. The service generates a PDF, which Yamatai checks against the returned digest. Inspectable request and response identifiers connect planning, analysis and report retrieval.

Themis uses pinned public expert evidence for this one allele. It reproduces the ClinGen FBN1 expert assessment using PS4, PM2_Supporting, PP2 and PP3, yielding the classification “Likely pathogenic” under the specified American College of Medical Genetics and Genomics/Association for Molecular Pathology rule. The implementation documents the dated assessment and FBN1 specification used. Other alleles receive an explicit unclassified result. The synthetic case contributes no additional proband evidence; the classification concerns the curated variant–disease association [@VariantDemo].

This demonstration establishes the operation sequence and the information exchanged at each boundary. The case and decoy were constructed to illustrate combined ranking. The current towns share a host and user account, so the demonstrated boundary is enforced at the protocol and application layers. The fixture is public synthetic data. Selected alleles and phenotype identifiers themselves remain disclosures that a resource owner must permit.

## From a research task to a TES execution and RO-Crate

The Sysifoss demonstration asks whether a task can cross a standard execution interface and return an inspectable research object. The accepted scenario constructs a public-data task, passes the local validator with the demonstration's scripted reasoner, dispatches a TES request and packages its completion contribution. In the 18 September rehearsal, CSC TES completed task `task-3468d08c` with exit code zero after running a container command that read the first three lines of the public TES specification README. The resulting carrier contains the contribution JSON-LD and RO-Crate metadata linking the task, broker and software [@Sysifoss; @SysifossReplay].

Two further cases returned unknown and invalid admission outcomes respectively: one used the scripted negative reasoning response, and the other supplied a mismatched contract identifier. Both stopped before TES dispatch. The broker's four local tests passed, together with 65 carrier tests covering packaging, recovery, tampering and archive boundaries. These checks exercise the implemented integration with the pinned carrier branch. A [public replay](https://leechuck.de/academic-wasteland/sysifoss/) exposes the three cases, captured TES response and downloadable crate. It preserves the distinction between scripted reasoning, real remote execution and recorded presentation; visitors can inspect the run without submitting work.

## Alternative issuers, impersonation and revocation

Separate executable scenarios test how different receivers apply scoped trust. The six scenarios cover local issuer choice, a shared independent issuer, claims supplied by separate authorities, bounded accreditation chains, holder impersonation and human delegation, and unavailable, expired or revoked certification. The captured scenarios show Lisan accepting its local issuer while refusing Camelot-only qualifications, two towns accepting an independent board, and a delegated issuer being limited to its authorised scope. Each scenario includes accepted and rejected paths. Controlled-computation tests also exercise revocation during toy VCF processing and refusal to release the computed result [@Certification].

A recorded Keycloak v26.7.3 run additionally accepted a configured service-account qualification, refused holder impersonation and refused a revoked token on fresh introspection [@CertificationProof]. These checks make the admission decision inspectable: a qualification satisfies one requirement, while dataset, compute and any required ethics or human permissions must also be satisfied. Strict certification is configurable on the native controlled-computation path. Public contact services and simpler starter workflows retain their own documented policies. The phenotype demonstration and strict certification scenarios therefore exercise complementary components of the prototype.

## Aggregate release over intensive-care records

A town at Maastricht University serves a different data domain from the genomic services above. It computes statistical summaries over de-identified intensive-care records. The resource is MIMIC-IV, an electronic health record dataset covering admissions to one United States academic medical centre [@MIMICIV]. The town answers a fixed repertoire of cohort queries. It returns counts, means, medians and in-hospital mortality proportions, grouped by a small set of permitted patient and admission attributes. No row-level data is returned under any operation.

Six conditions must hold before a result is computed. The credential's signature must verify against a key published by an issuer this town trusts. A signed status statement, no older than sixty seconds, must confirm that the credential is not revoked. The requester must demonstrate control of the private key the credential names, by signing a single-use challenge that also commits to the exact query. A data use undertaking, signed with that same key, must already be on file. The query must be selected from a fixed allowlist, rather than supplied as code or as a database query. Finally, the proposed result is compared against every result the same requester has already received.

The captured run reported in-hospital mortality among 94,458 intensive-care stays, grouped by admission type. Rates ranged from 13.4 per cent for emergency admissions to 1.9 per cent for same-day surgical admissions. A second query requested the same cohort with one care unit excluded. Each cohort exceeded the minimum reportable group size, so either result would have been released alone. The two cohorts differed by exactly one stay. Subtracting one count from the other would therefore have disclosed that individual's presence in the excluded unit, and the second request was refused before any result was prepared [@ZerzuraDemo].

This case shows that admission can depend on the quantity to be released, and not only on the requester's authority. The preceding demonstrations decide whether a requester may ask a question. This one also decides whether a particular answer may be given, in light of the answers that requester already holds. That decision follows from the interaction history rather than from the requester, so no authorisation check can reach it.

Disclosure control is applied according to the dataset rather than uniformly. The openly licensed extract served over the relay receives none, because anyone may already download its records in full. The credentialed database receives minimum-cell-size suppression, and is queried locally only. Whether to serve that database over the relay is an institutional decision, which this work does not make.

## An independently implemented client and town

The credential and status profile was tested against Camelot by a client and town developed independently at Maastricht University. The client was written from the protocol documentation alone. It used the Python standard library, and not the reference implementation's optional cryptographic dependency. The town ran on separate hardware under its own access policy [@Zerzura].

Camelot issued a holder-bound credential after human review of the application. Such a credential names a public key whose private counterpart only the legitimate holder controls. That key was generated at the receiving site, and its private half was never transmitted. The independent verifier accepted the credential and refused four constructed failures: a presentation signed for one query but submitted alongside a different one; a presentation replayed after its single-use challenge had been spent; a presentation forwarded by a town other than the one the challenge was issued to; and a credential naming two different holder keys in separate fields. Status statements from the registrar were verified against issuer keys held in the receiving town's own trust store, not against any key accompanying the response.

The receiving town selects its own trust roots. Camelot publishes an issuer intended only for synthetic tests, which is deliberately left unaccredited. The verifier refused credentials from that issuer until its identifier was configured explicitly as a trust root. Refusal resumed once that configuration was removed.

Two defects were identified. An issuer allowlist expressed as a URL prefix admitted every issuer published beneath that prefix, including the unaccredited test issuer; accreditation is now required rather than merely reported. A client helper discarded the requested operation when a message body was supplied, so a client following the documentation received a generic acknowledgement that resembled a protocol mismatch rather than an error. Both were corrected and given regression tests. The independent verifier now runs against the registrar in the provider's continuous integration [@ZerzuraInterop].

Both parties used the same shared relay. The result therefore establishes interoperability between independently written implementations, and separate administration of the participating town. It does not establish independent institutional federation, which would also require independently operated transport.

# Discussion

The hackathon produced a working connection between service descriptions, messages, local scientific operations and explicit receiver policy. The biological example makes the value of this connection concrete: one town contributes phenotype-based ranking, another combines it with local variant data, and an interpretation service returns a sourced report. The human supplies the objective, and the installed adapters coordinate a bounded workflow with visible requests and results.

The implementation also clarifies three distinct forms of evidence. A relay token authenticates transport. A credential states a scoped claim from an issuer trusted by the receiver. A conformance report describes observations against a particular profile and implementation. Keeping these meanings separate helps an operator determine which evidence supports a specific decision.

Several boundaries define the next evaluation. The current relay is shared infrastructure, and the demonstration towns are co-hosted. Deployments under independent operators and administrative accounts would test operational federation and stronger isolation. Independent clients written from the protocol specification would test implementation interoperability. The constructed variant example establishes workflow behaviour; a separately designed dataset and evaluation protocol would support estimates of ranking performance. Themis currently reproduces one pinned expert assessment, making broader interpretation coverage a distinct development task.

The pre-hackathon proposal also envisaged independent replication, challenges to scientific claims and complete research-object packaging. The implemented RO-Crate carrier preserves a recoverable message, and Sysifoss connects that carrier to TES completion. Extending this to an entire interaction requires packaging the actual execution artifacts and permissions, then having an independently operated service repeat or challenge the result. Model checkpoints, ontology versions, external evidence and resource licences must be retained alongside the execution description for this purpose.

# Future work

The next interoperability test should connect a separately developed client and independently administered towns using a pinned profile. A2A transport and MCP service adapters, together with the implemented Sysifoss TES bridge, should preserve task identities, permissions and release decisions across their boundaries. Tests should include incompatible semantic types, changed catalogue versions, unavailable status services and interrupted execution. Separate operating-system accounts and restricted execution services would extend the current application-level custody boundary.

A second milestone is to extend the implemented RO-Crate carrier into a complete Workflow Run RO-Crate containing inputs or permitted references, workflow and model versions, signed decisions, execution observations and released outputs. This includes completing Sysifoss artifact collection, checking external profile conformance and integrating the reviewed carrier branch into the main release. An independent town should repeat the analysis and publish agreement or disagreement linked to that package. This would connect the prototype directly to the earlier WfExS and FAIR Digital Object work.

The practical benefit also needs measurement. A study should compare manual coordination, bespoke scripts and the town workflow on time to connect a new service, operator interventions, task completion, policy violations, compute cost and recovery from failure. FAIRhaven's probes need calibrated coverage and freshness measures. The phenotype workflow needs a held-out benchmark and broader interpretation evidence. Governance work should define issuer review responsibilities, revocation and appeal, software maintenance, attribution and incentives for providers to remain available.

# Conclusions

Academic Wasteland connects service discovery, reviewed credentials and receiver-controlled execution in a research commons prototype. The demonstrations show how these components support cohort analysis, remote compute and selective disclosure during variant prioritisation. Sysifoss adds standard TES dispatch and RO-Crate contribution packaging. Existing scientific-agent systems and BioHackathon infrastructure provide reusable foundations; the next step is to test these connections across independent implementations and package their results for reproducible reuse.

# Software and data availability

The [Research Commons repository](https://github.com/academic-wasteland/research-commons) contains the initial proposal, schemas, ontology contracts and semantic checker [@ResearchCommons]. The [pangenome-town repository](https://github.com/academic-wasteland/pangenome-town) contains the research services, certification implementation, synthetic variant fixture, evidence package and captured demonstrations [@VariantDemo; @Certification]. The [starter-pack repository](https://github.com/academic-wasteland/wasteland-starter-pack) contains the relay client, worker, FAIRhaven and Concord implementations [@RelayProtocol; @FairServices; @Concord]. The [Sysifoss repository](https://github.com/academic-wasteland/sysifoss) contains the TES broker and interactive demonstration [@Sysifoss; @SysifossDemo]. Its RO-Crate dependency is pinned to the reviewed [Research Commons integration branch](https://github.com/academic-wasteland/research-commons/pull/3) [@ROCrateCarrier]. The [FAIRhaven](https://github.com/academic-wasteland/fairhaven), [Camelot](https://github.com/academic-wasteland/camelot), [Ubar](https://github.com/academic-wasteland/ubar) and [Yamatai](https://github.com/academic-wasteland/yamatai) repositories provide town deployments and configurations. Versioned documentation links in the bibliography identify the source snapshots used for this draft.

The [recorded demonstration replay](https://leechuck.de/academic-wasteland/replay.html), [live cohort demonstration](https://leechuck.de/wasteland-live/demo), [live visitor demonstration](https://leechuck.de/wasteland-live/demo/visitor), [interactive phenotype demonstration](https://leechuck.de/wasteland-live/demo/phenotypes), [FAIRhaven catalogue](https://leechuck.de/wasteland-fair/) and [Concord handbook](https://leechuck.de/wasteland-concord/) provide interfaces to the deployed prototype. Reproduction instructions and environmental requirements are recorded with the demonstration, including the installed INDIGENA checkpoint and running town bridges. Upstream data, model and evidence rights remain attached to their respective resources.

# Acknowledgements

This work was developed and advanced during DBCLS BioHackathon 2026 in Matsuyama, Japan. We thank the organisers and participants for the setting for collaborative development, and the maintainers of the software, ontologies and public evidence used in the prototype. Named acknowledgements, funding statements and contributor roles will be completed with the author list.

# References
