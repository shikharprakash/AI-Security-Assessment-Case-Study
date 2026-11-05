*Personal work. No confidential or employer-proprietary information. See [DISCLAIMER](../DISCLAIMER.md).*

# 2. Case study: taking an AI security assessment from idea to public launch

## The problem, in one sentence

Enterprises are deploying AI faster than they can reason about its security, and the binding
constraint is not detection — it is **diagnosis**. [Document 1](01-problem-space.md) sets out the
published evidence: 86% of organisations had an AI-related security incident in the past year, and
fewer than half have the resources to assess their AI security at all.

## Who it is for

Three distinct people, and conflating them is the most common way these products fail.

**The security leader** holds the budget and the board relationship, is accountable for AI risk, and
is usually not an AI specialist. They need something *defensible* — they will be challenged on any
number they present, so they need to be able to say why it is what it is. They distrust anything that
looks like a lead-capture form more than they distrust a wrong answer.

**The governance or GRC lead** holds a job title that barely existed three years ago. They report
into legal or risk rather than IT, they read regulation for a living, and their difficulty is
structural: the accountability sits with them while the systems sit with somebody else. What helps
them is a measurement that repeats — something they can run again next quarter and plot, plus
mappings onto the frameworks their auditors already recognise.

**The AI platform engineer** owns the inference gateway, the retrieval stack, and the agents. They
are allergic to governance theatre and will abandon anything that wastes their time or tells them what
they already know. They want specificity they can turn into tickets.

The security leader and the governance lead are the buyers. The engineer is the person whose
cooperation determines whether anything actually changes. A product that speaks only to the engineer
never gets funded; one that speaks only to the buyer never gets implemented.

## The central product bet

**Trade accuracy for reach.**

The engineer's instinct — mine included, initially — is to measure: connect to the estate, enumerate
the models, test the endpoints, produce a precise answer. That instinct is right about accuracy and
wrong about sequencing. Precision requires access, access requires an approval decision, and the
approval decision requires the diagnosis that does not yet exist. The loop never starts.

A questionnaire is substantially less precise than a scan. It is also available to an organisation
that has approved nothing, signed nothing and connected nothing — and it is good enough to answer the
only question that matters at this stage, which is *where should I look first?*

Everything else followed from accepting that trade.

## What a short public instrument can and cannot establish

Cisco's publicly available assessment asks **eight questions**. Publicly, per the page, they cover the
types of AI applications in use, how much autonomy the most advanced of them operate with, how models
are sourced, the sensitivity of the data those systems can touch, the state of agent supply-chain
governance, what runtime protection is applied, how applications are tested for vulnerabilities and
misalignment, and how agent identity is handled. The output is one of three named readiness bands —
**Foundational**, **Progressing** or **Advanced** — plus priority focus areas.

Eight questions is a severe constraint, and working within it taught me more than any other part of
this project. What eight questions *can* do:

- Separate an organisation that has no governance strategy from one that inventories assets from one
  that scans them before approval from one that monitors them continuously. That is a real four-point
  gradient and it is answerable honestly by someone who is not a specialist.
- Establish blast radius cheaply. Autonomy level and data sensitivity between them bound how bad a
  failure can get, in two questions.
- Find the agent-shaped gap. Two of the eight are agent-specific — supply chain and identity — which
  is the right allocation given that agentic deployment is where the intent-versus-confidence gap is
  widest.

What eight questions **cannot** do, and should not claim to:

- Tell you whether a specific model jailbreaks. That needs a test harness against a live endpoint,
  which is a different product with a different buyer.
- Produce compliance evidence. Self-reported maturity is claimed, not audited, and an instrument that
  implies otherwise is doing its user harm.
- Replace a full assessment. It is explicitly a first read, and the honest framing of the output is
  "here is where to look", not "here is your risk".

The discipline that matters here is **refusing to over-claim on a thin instrument**. It is very easy
to dress eight answers up as a quantified risk posture. Resisting that is the difference between a
tool a CISO forwards to their board and a tool they quietly close.

## What shipping publicly actually required

The engineering was the easy part. What a working prototype does not have, and what consumed most of
the elapsed time, was everything that turns software into a product someone will put their name on:

- **A privacy position that legal will sign.** Not a policy slide — an architectural commitment, and
  then language that accurately describes it. If any part of the claim is aspirational, it has to come
  out of the copy.
- **Accessibility.** A public page on a major corporate domain has a conformance bar that an internal
  prototype does not.
- **Brand and content review.** Wording that reads as confident internally can read as over-claiming
  externally, and an external reviewer is right about that more often than the author is.
- **A naming and positioning decision.** When an organisation already ships adjacent free tools, the
  largest risk is not that the new one is redundant — it is that nobody can tell which to use when.
  That is resolved with naming and routing, and it has to be resolved *before* announcement, not
  after.
- **An owner.** The single most common way a working prototype fails to become a product is that no
  one is accountable for it between "it works" and "it ships".

## Outcome

The assessment is publicly live on cisco.com, and Cisco AI promoted it on LinkedIn in November 2026.

That is the whole of the outcome claim, deliberately. I have no adoption figures to present and would
not publish them if I did. The verifiable fact is that something that began as a prototype is now a
public page that any customer can use, which is the outcome that was being aimed at.

## Retrospective: what I would do differently

**I would have tested with cold users far earlier.** Nearly all early validation was internal or
facilitated — someone who knew the product was in the room. That tells you whether the logic holds.
It tells you nothing about whether a stranger completes it, and completion is the metric everything
downstream depends on. I had extensive evidence about correctness and almost none about desirability,
which is an unusual way round and not a good one.

**I under-weighted the "which tool do I use?" problem.** I treated it as a late positioning task. It
is an early product-definition task, because the answer changes what each product should be.

**I would have written down what the instrument does not do, sooner.** Being explicit about scope
early would have prevented several rounds of argument about features that were never in scope. A
written non-goals list is cheaper than the same list discovered through review.

**What I would keep:** anchoring on an externally published maturity model rather than inventing a
proprietary one. It costs some design freedom and buys credibility that a vendor-authored framework
cannot buy at any price. See [7. Standards landscape](07-standards-landscape.md).

---

**What this document deliberately omits**, and why: market sizing, pricing and attach-rate economics,
the internal competitive assessment, the roadmap, and resourcing. Those are the employer's, not mine
to publish — see [DISCLAIMER.md](../DISCLAIMER.md). All public figures are cited in
[1. The problem space](01-problem-space.md).

**Next:** [3. Reference architecture](03-architecture.md)
