# AI Security Maturity Assessment — a product case study

> **Personal portfolio. Not a Cisco publication.** This repository contains no Cisco source code, no
> confidential information, no product internals and no customer data. The assessment it discusses is
> a Cisco Systems, Inc. product; I describe only my own methodology and publicly available facts.
> Views are my own. See **[DISCLAIMER.md](DISCLAIMER.md)**.

How a questionnaire-driven AI security assessment gets designed, validated and shipped — written up
as a product-management case study. The publicly available **Cisco AI Security Assessment** is live on
cisco.com and asks eight questions to give an organisation a read on its AI security posture:

**→ [Take the assessment](https://www.cisco.com/site/us/en/products/security/ai-defense/cisco-ai-security-assessment.html)**

**Author:** Shikhar Prakash — Customer Success Specialist, AI Defense, Cisco Systems
ISB Professional Certificate in Product Management · Cornell Agentic AI Certification

---

## Why this exists

Cisco's own published research found that **86% of organisations had an AI-related security incident
in the past year, while fewer than half have the resources to assess their AI security at all.** Those
two numbers next to each other describe a *diagnosis* gap, not a detection gap — and you cannot ask for
a control against a risk you have not been able to name.

This repository is my write-up of the thinking behind closing that gap: the problem space, the design
method for a scored assessment instrument, how you validate a model whose output is a judgement, and
the decisions I would defend or change.

## Deliverables

| Document | What it is |
|---|---|
| [1. The problem space](docs/01-problem-space.md) | Why an AI security diagnosis gap exists, built entirely from published, cited figures |
| [2. Case study](docs/02-case-study.md) | The product narrative: who it is for, the central bet, what eight questions can and cannot establish, what shipping publicly required, and an honest retrospective |
| [3. Reference architecture](docs/03-architecture.md) | Seven patterns for building a self-serve assessment product, each justified against the alternative it rejects and the failure mode it avoids |
| [4. Designing the instrument](docs/04-designing-the-instrument.md) | Question economics, separating likelihood-shaped from impact-shaped inputs, why maturity must reduce likelihood but not loss magnitude, and how to be precise about borrowing from FAIR |
| [5. Validating a scoring model](docs/05-validating-a-scoring-model.md) | Expert prediction as ground truth, differential pairs, and the honesty disciplines that keep a validation story from quietly becoming theatre |
| [6. Decision log](docs/06-decision-log.md) | Nine decisions in context / options / decision / consequence form, including the one I got wrong |
| [7. Standards landscape](docs/07-standards-landscape.md) | SANS, OWASP, MITRE ATLAS, NIST, ISO and FAIR — what each is actually for, how they stack, and the mistakes that cost credibility |
| [diagrams/architecture.mmd](diagrams/architecture.mmd) | The reference architecture as Mermaid |

Start with **[2. Case study](docs/02-case-study.md)** if you have ten minutes, or
**[6. Decision log](docs/06-decision-log.md)** if you have five.

## What this deliberately does not contain

I was asked more than once to publish "the business case". I did not, and the reason is itself a
product judgement: **a business case's substance is the part that cannot be published** — the revenue
model, the attach economics, the resourcing ask, the unreleased roadmap, the internal read on
competing products. Strip those out and you do not have a shorter business case, you have a shell, and
any reader who has written one recognises the shell immediately.

So there are no scoring weights, thresholds or constants here; no threat taxonomies, control
identifiers or product mappings; no assessment question banks; no validation corpus or accuracy
figures; no internal economics, roadmap or competitive analysis. What is here is the **method**, which
is the transferable part, plus publicly verifiable facts about what shipped.

[7. Standards landscape](docs/07-standards-landscape.md) names and links every framework referenced.
None is reproduced — in particular the SANS AI Security Maturity Model is SANS Institute copyright and
is cited rather than quoted.

## How this was produced and reviewed

Every document was written from scratch for this repository. Figures are drawn from published sources
and carry a citation and an access date; where a figure comes from vendor survey research — including
Cisco's own — it is labelled as such rather than presented as measurement. A pre-publication
confidentiality review was run over the whole repository before it was pushed.

Corrections are welcome. If you believe anything here discloses material it should not, or
misattributes a third party's work, please open an issue and I will correct or remove it.

## Licence

Prose and diagrams are licensed **CC BY 4.0** — see [LICENSE](LICENSE), which also sets out what the
grant does *not* cover (Cisco trademarks and product content; the SANS, OWASP, MITRE, NIST and ISO
materials, each the property of its publisher). `push_to_github.sh` is MIT.
