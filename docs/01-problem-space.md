# 1. The problem space: AI security has a diagnosis gap

> Every figure in this document comes from a published source and is cited. Nothing here is drawn from
> internal research. See [DISCLAIMER.md](../DISCLAIMER.md).

## The two numbers that define the problem

Cisco's Cybersecurity Readiness Index 2025, a survey of roughly 8,000 business leaders with security
responsibility across 30 markets, reported two findings that sit uncomfortably next to each other:

- **86%** of organisations experienced an AI-related security incident in the preceding twelve months.
- **Fewer than half** have the resources to conduct a comprehensive AI security assessment.

Read them together and the shape of the problem becomes clear. This is not primarily a *detection*
problem — the security industry sells detection, and sells it well. It is a **diagnosis** problem.

An organisation that cannot name what it is exposed to cannot ask for a control, cannot write a
requirement, cannot brief a board, and cannot prioritise a budget. The conversation stalls before any
product is discussed, which is bad for the customer and, incidentally, bad for every vendor in the
category.

## Adoption is not the constraint

It is tempting to assume the gap is an adoption lag — that organisations simply have not got to AI
yet. The published evidence says otherwise. Adoption is high and rising:

| Finding | Figure | Source |
|---|---|---|
| Organisations using generative AI | 72% | McKinsey, *The State of AI* 2025 — 1,993 respondents across 105 countries |
| Organisations using AI in at least one business function | 78% | Stanford HAI, *AI Index 2025* |
| Executives reporting active use of AI agents | 52% | McKinsey, *The State of AI* 2025 |
| Organisations with at least some agents already in deployment | 42% | KPMG, *AI Quarterly Pulse*, Q3 2025 |

Meanwhile readiness has not moved. Cisco's AI Readiness Index has run three annual editions, each
polling roughly 8,000 senior leaders at organisations above 500 employees in 26 industries. The share
rated *fully ready* to deploy AI came out at **14%, then 13%, then 13%** across 2023, 2024 and 2025. Three years, no improvement, against a backdrop of accelerating deployment.

That divergence is the whole story. Capability is scaling; the ability to reason about the risk of
that capability is not.

## Governance is thinner than policy implies

ISACA's 2026 AI Pulse Poll, surveying 3,400 digital-trust professionals, found:

- **90%** report that employees use AI tools.
- **38%** have a formal, comprehensive AI policy.
- **25%** have **no active AI policy at all**.

So the modal organisation has employees using AI, no comprehensive policy governing it, and — per the
Cisco figure above — no practical means of assessing the resulting exposure. The gap is not between
leaders and laggards. It is close to universal.

## The agentic edge is where it is widest

The gap is not uniform across deployment types. It is sharply worse for agentic systems, which are
precisely the systems being deployed fastest. Cisco's State of AI Security 2026 reported:

- **83%** of organisations plan agentic AI deployments.
- **29%** feel secure in the agentic deployments they already run.
- Of more than **30,000** agentic AI "skills" analysed by Cisco researchers, **over a quarter**
  contained at least one vulnerability.

An agent differs from a chatbot in the dimension that matters most for risk: it *acts*. It calls
tools, reads systems, writes to them, and chains to other agents. The blast radius of a compromised
agent is not a bad answer — it is an executed action. A fifty-four-point gap between intent and
confidence, on the deployment pattern with the largest blast radius, is the single most urgent
diagnostic need in the category.

## Why the existing options do not close it

Three kinds of thing already exist, and none of them is a five-minute diagnosis.

**Consulting-led assessments** are high fidelity and genuinely useful. They are also five or six
figures and four to eight weeks, and they require a scoping call, a statement of work, and often
access to the estate. They cannot be the answer for the majority of the 86%, because the economics do
not reach that far down.

**Posture-management products** (AI-SPM and adjacent tooling) are the right long-term answer for an
organisation that has already decided to invest. But they require the environment — connections,
credentials, agents or read-only API access — which means legal review, procurement, and a decision
that has to be *justified before* the thing that would justify it exists. That is circular.

**Standards and self-assessment frameworks** are free, rigorous and public. The OWASP AI Maturity
Assessment, the Cloud Security Alliance's AI Controls Matrix with its 320-question AI-CAIQ, the NIST
AI RMF Playbook, and the SANS AI Security Maturity Model all give an organisation a structure to
reason with. Their deliberate limitation is that they are **vendor-neutral by design**, so they stop
short of the question a practitioner actually asks next: *given all that — what do I do on Monday?*

Each of the three is well made. The gap between them is the opportunity: something with the rigour of
the frameworks, the delivery friction of a web page, and an output specific enough to act on.

## Why "it only has to be roughly right" is the key insight

The instinct of a security engineer, confronted with "assess my AI risk", is to measure. Scan the
estate, enumerate the models, test the endpoints — produce a precise answer.

That instinct is correct and it is also why the gap persists. Precision requires access; access
requires a decision; the decision requires the diagnosis you do not yet have.

A questionnaire is less precise than a scan, by a wide margin. But it is available to an organisation
that has approved nothing, and it is good enough to answer the only question that matters at this
stage: **where should I look first?** A directionally correct answer available in five minutes to
everyone beats a precise answer available in eight weeks to the few who can already justify it.

That trade — accuracy for reach — is the design decision the rest of this case study is built on.

## The market is forming around governance, not just tooling

One figure here comes from a genuine independent analyst rather than a commercial market-research
estimate, and is worth isolating for that reason. In a press release dated 17 February 2026, **Gartner
put 2026 spending on AI governance platforms at $492M, and projected it past $1B by 2030.**

A deliberate note on the figures in this section: published "AI security market size" estimates vary
by roughly an order of magnitude depending on whether they size *AI for security* — AI embedded in
security products — or *security for AI*, which is this category. Commercial estimates for "AI
governance market size" diverge by more than 30× across publishers. I have not quoted any of them,
because I could not establish which definition each uses. The Gartner figure is the only one here from
a top-tier independent analyst with a stated scope.

---

## Sources

- Cisco, *Cybersecurity Readiness Index 2025* — May 2025; around 8,000 respondents across 30 markets
- Cisco, *AI Readiness Index* — 2023, 2024 and 2025 editions; around 8,000 senior leaders, organisations above 500 employees
- Cisco, *State of AI Security 2026* (February 2026)
- ISACA, *AI Pulse Poll 2026* — 3,400 digital-trust professionals
- McKinsey, *The State of AI* — 2025; 1,993 respondents, 105 countries
- Stanford HAI, *AI Index Report 2025*
- KPMG, *AI Quarterly Pulse Survey*, Q3 2025
- Gartner, *Global AI Regulations Fuel Billion-Dollar Market for AI Governance Platforms* (17 Feb 2026)
- OWASP, *AI Maturity Assessment*; Cloud Security Alliance, *AI Controls Matrix / AI-CAIQ*;
  NIST, *AI RMF 1.0 Playbook*; SANS Institute, *AI Security Maturity Model*

Cisco-published figures are vendor survey research and are labelled as such. They are self-reported
survey data, not measured incident telemetry.

**Next:** [2. The case study](02-case-study.md)
