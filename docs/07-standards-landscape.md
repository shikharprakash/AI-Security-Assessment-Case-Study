*Personal work. No confidential or employer-proprietary information. See [DISCLAIMER](../DISCLAIMER.md).*

# 7. The AI security standards landscape

> Each standard below is **named, characterised and linked**. None is reproduced. In particular the
> SANS AI Security Maturity Model's stage descriptions, control definitions and per-level criteria are
> SANS Institute copyright and are not reproduced or paraphrased here — obtain the model from SANS.
> All pages accessed 2026-11-05.

A practitioner's orientation, because the most common failure I see is people treating these as
competing options when they answer entirely different questions.

## What each one is for

| Standard | Publisher | The question it answers |
|---|---|---|
| **AI Security Maturity Model** | SANS Institute | *How mature is our programme, and what does better look like?* Three pillars — Protect AI, Utilize AI, Govern AI — and five organisational stages. Published 12 May 2026. |
| **Top 10 for LLM Applications** | OWASP | *What goes wrong with an LLM application?* A ranked risk list. The **2026 edition (4 August 2026)** supersedes 2025 and reordered most of it. |
| **Top 10 for Agentic Applications** | OWASP | *What goes wrong specifically when the AI acts?* Agent-shaped failure modes — goal hijack, tool misuse, identity abuse, rogue agents. 2026 edition, announced December 2025. |
| **ATLAS** | MITRE | *How do adversaries actually attack AI systems?* A knowledge base of observed adversary techniques, built in the shape of MITRE's ATT&CK. Updated frequently. |
| **AI RMF 1.0** (AI 100-1) | NIST | *How do we organise AI risk management as a function?* Four functions: GOVERN, MAP, MEASURE, MANAGE. Published 26 January 2023. |
| **Generative AI Profile** (AI 600-1) | NIST | *How does AI RMF apply to generative AI specifically?* A companion profile, not a standalone framework. July 2024. |
| **ISO/IEC 42001** | ISO / IEC | *Can we be audited and certified?* An AI management system standard — the certifiable one. December 2023. |
| **ISO/IEC 23894** | ISO / IEC | *How should we approach AI risk management?* **Guidance, not certifiable** — the AI companion to ISO 31000. February 2023. |
| **EU AI Act** | European Union | *What are we legally obliged to do?* Regulation (EU) 2024/1689, in force 1 August 2024, with obligations phasing in. |
| **AI Controls Matrix / AI-CAIQ** | Cloud Security Alliance | *Can we self-assess rigorously, for free?* A control matrix with a long self-assessment questionnaire. July 2025. |
| **AI Maturity Assessment** | OWASP | *Can we self-assess maturity, for free?* A SAMM-style maturity framework with worksheets. August 2025. |
| **FAIR** (O-RT, O-RA) | The Open Group | *How do we quantify risk in money?* Decomposes risk into loss event frequency and loss magnitude, quantitatively. |

## How they relate

They stack rather than compete:

- **ATLAS and the OWASP Top 10s describe the threat.** ATLAS catalogues what adversaries do; the OWASP
  lists rank what commonly goes wrong in applications. Use them to enumerate what you are defending
  against. They do not tell you how to organise yourself.
- **NIST AI RMF and ISO/IEC 23894 describe the function.** They tell you what a risk-management
  practice looks like structurally. They do not enumerate threats and they do not score you.
- **SANS AI-SMM scores the programme.** It tells you where you sit on a maturity trajectory. It is the
  layer that answers "are we getting better?".
- **ISO/IEC 42001 certifies the management system.** It is the one that produces an auditable
  artefact a customer or regulator will accept.
- **The EU AI Act obliges.** Everything else is voluntary; this is not.
- **FAIR quantifies.** When you need a number in currency rather than a band, this is the model.

A reasonable practitioner path: use ATLAS and OWASP to know what you are facing, AI RMF to structure
the function, SANS to measure the programme's maturity, 42001 if you need certification, and the AI
Act to establish the floor.

## Where I would start

If you are standing up AI security governance from nothing, in order:

1. **An inventory.** Nothing else is actionable without knowing what AI you run. Every framework
   assumes this and none of them does it for you.
2. **The EU AI Act's risk tiering**, if you operate in or sell into the EU — it is the only
   non-optional item and it determines how much of the rest you need.
3. **A maturity baseline** against a published model, so you have a trajectory rather than a snapshot.
4. **Threat enumeration** scoped to the deployment patterns you actually run — the OWASP agentic list
   if you run agents, the LLM list if you run applications.
5. **ISO/IEC 42001** only when you need to show someone else, not to improve.

## Common mistakes

These recur often enough to be worth listing, and getting one wrong in front of a practitioner costs
credibility immediately.

**NIST AI RMF's functions are not the Cybersecurity Framework's.** They are GOVERN, MAP, MEASURE,
MANAGE — not Identify/Protect/Detect/Respond/Recover. Blending the two is a common and very visible
error.

**GOVERN is cross-cutting, not step one.** Drawing AI RMF as a four-box linear sequence with GOVERN
first misrepresents it; GOVERN's policies apply across the other three, which are applied iteratively.

**ISO/IEC 42001 is certifiable; 23894 is guidance.** This gets stated backwards constantly. If someone
tells you they are "certified to 23894", they are not.

**The EU AI Act's high-risk dates have moved.** An amending instrument — the Digital Omnibus on AI —
pushed the high-risk obligations back. Stand-alone systems in scope of Annex III now fall due in
**December 2027**, and high-risk AI built into products already covered by other regulation in
**August 2028**; both previously sat in August 2026. Several popular public trackers have not caught
up. Check EUR-Lex for the amending act itself rather than trusting a summary page.

**The OWASP LLM Top 10 moved in 2026.** The 2026 edition reordered most entries and renamed one
relative to 2025. Citing the 2025 ordering as current is now wrong, and the legacy OWASP project page
still renders an even older 2023 list — do not cite from it.

**MITRE ATLAS counts are not monotonic.** Techniques get re-parented between releases, so a total can
go down while the catalogue grows. Quote a release version alongside any count.

**FAIR is not an ordinal likelihood-by-impact grid.** The model was conceived as an argument against
exactly that, and in favour of expressing risk as probability distributions over annualised loss in
money. An ordinal instrument may legitimately say it borrows FAIR's way of factoring the problem; it
may not say it performs a FAIR analysis or satisfies either of The Open Group's two FAIR standards.
That claim will not survive one conversation with a practitioner.

**"Mapped to" is doing a lot of work.** When a vendor says its product maps to a framework, ask
whether every entry is mapped, which edition, and who wrote the rationale. Partial coverage pinned to
a superseded edition is common and is not the same claim.

## Links

- SANS AI Security Maturity Model — https://www.sans.org/white-papers/sans-ai-security-maturity-model-ebook
- OWASP GenAI Security Project (both Top 10s) — https://genai.owasp.org/
- OWASP AI Maturity Assessment — https://owasp.org/www-project-ai-maturity-assessment/
- MITRE ATLAS — https://atlas.mitre.org/
- NIST AI Risk Management Framework — https://www.nist.gov/itl/ai-risk-management-framework
- ISO/IEC 42001 — https://www.iso.org/standard/42001
- ISO/IEC 23894 — https://www.iso.org/standard/77304.html
- Cloud Security Alliance AI Controls Matrix — https://cloudsecurityalliance.org/research/artifacts/ai-controls-matrix
- The Open Group Open FAIR — https://www.opengroup.org/open-fair

---

**Back to:** [README](../README.md)
