*Personal work. No confidential or employer-proprietary information. See [DISCLAIMER](../DISCLAIMER.md).*

# 4. Designing a scored assessment instrument

> Method only. This document contains no weights, thresholds, modifiers, constants, control
> identifiers, taxonomies or mappings from any product. It is how I would approach the problem, and
> why.

## Question economics

Every question you add costs completions and buys resolution. That trade is the central design
tension in a self-serve instrument and it is worth being quantitative about even when you cannot
measure it precisely.

A reasonable way to think about each candidate question: **how many materially different organisations
does this question separate, and how confidently can a non-specialist answer it?** A question that
splits the population 95/5 buys you almost nothing. A question that splits it evenly but that half
your respondents answer wrongly buys you less than nothing, because now you have confident noise.

Three practical rules:

- **Prefer questions about posture over questions about inventory.** "How do you govern your model
  supply chain?" is answerable from memory. "How many models do you run?" requires someone to go and
  find out, and they will not — they will guess, abandon, or pick the middle option.
- **Prefer four well-separated options to six subtle ones.** If two adjacent options could both be
  defended for the same organisation, they are one option.
- **Make the gradient describe observable practice, not aspiration.** "No consistent strategy" →
  "inventory exists, limited scanning" → "assessed before approval" → "continuously monitored" is a
  ladder someone can locate themselves on honestly. "Basic / Intermediate / Advanced / Leading" is
  not; everyone picks Intermediate.

## Writing items a non-expert can answer honestly

The respondent is usually not the person who built the system. Items therefore have to be answerable
by someone with organisational rather than technical visibility.

- **Give concrete examples inside the option**, not in a tooltip. Naming the actual tools or patterns
  an option refers to converts a judgement call into a recognition task.
- **Never offer an option the respondent cannot verify.** If answering requires data they do not have,
  you have written a question that will be answered falsely.
- **Expand every acronym on first use.** The instrument is read by legal and risk functions, not only
  by engineers.
- **Make "we don't do this" a dignified answer.** If the lowest option reads as an accusation, people
  will not select it, and your instrument now systematically over-reports maturity.

## Separate likelihood-shaped inputs from impact-shaped inputs

The single most useful structural decision in scoring risk is to stop treating it as one number.

Some of what you ask changes **how likely** a loss event is: exposure surface, who can reach the
system, what it can call out to, what protections run at the boundary. Some of it changes **how bad**
a loss would be: the sensitivity of the data in scope, the regulatory class it falls under, the blast
radius of an autonomous action.

Keeping those two streams separate, and combining them only at the end, buys three things:

1. **Explicability.** "Your likelihood is high and your impact is moderate" is actionable advice.
   A single composite number is not.
2. **Correct behaviour under improvement.** Which brings us to the next section.
3. **Defensibility.** A security leader challenged on the output can decompose it.

### Process maturity should reduce likelihood, not loss magnitude

This is the asymmetry that most self-assessments get wrong, and it is worth being emphatic about.

Better controls change the **odds**. They do not change the **bill**. If regulated data is exposed,
the penalty, the notification duty and the damage to reputation arrive at full size regardless of how
disciplined the organisation was on the morning of the breach.

An instrument that lets maturity reduce impact will tell a well-run organisation handling regulated
data that it has low risk. That is wrong, and it is wrong in the most dangerous direction.

The corollary is that **maturity must never reduce risk to zero**. There should be a floor. No set of
controls eliminates a threat class, and a model that implies otherwise is selling comfort. A customer
should finish the assessment understanding that investment reduces risk and never claims to remove it.

## Derive the display scale from its own thresholds

If you present both a number and a band — "62, High" — then the number and the band are two statements
of the same fact, and they must not be able to disagree.

The robust way to guarantee that is to **derive the displayed scale from the band boundaries
themselves** rather than choosing a mapping independently. If the boundary between two bands sits at
some underlying value, then that value should map to exactly the displayed number at which the band
changes. Done this way, the mapping has **no free parameters** — there is nothing to tune and nothing
to defend, because the number and the label are generated from the same source.

Done the other way, you eventually ship the defect where a score displays inside one band and is
labelled with another. It is a small bug with an outsized cost: it is exactly the inconsistency an
attentive reviewer notices first, and it undermines confidence in everything else on the page.

## Sweep thresholds against evidence; do not choose them

Band boundaries invite intuition. Resist it. Choose them by **sweeping the parameter space against a
corpus of expected outcomes** (see [document 5](05-validating-a-scoring-model.md)) and taking the
region of best agreement, rather than by picking values that feel right.

Two disciplines make this honest:

- **Take the centre of a plateau, not a peak.** A single best-scoring value surrounded by worse ones
  is overfitting to your corpus. A broad region of near-equal performance is a real signal; sit in the
  middle of it.
- **Recognise when you have hit the ceiling.** If no choice of boundaries does better, the residual
  disagreement is not a calibration problem, and continuing to tune boundaries to chase it is
  overfitting dressed as rigour. Write down that you reached the ceiling, and stop.

## Be willing to leave a cell empty

When you map your own categories onto an external framework, there will be categories with no honest
counterpart. The temptation is to find the nearest plausible entry and assert it, because an empty
cell looks like incompleteness.

**Resist that, and document the refusal.** If a category describes something a framework does not
cover — for instance, a model property with no adversary behind it, mapped against a framework that
catalogues adversary behaviour — then asserting a mapping is inventing one. An instrument that is
visibly willing to say "nothing maps here, and here is why" is one whose other mappings can be
trusted. The empty cell is the credibility.

## Be precise about what you are borrowing

If you describe your approach by reference to an established risk model, be exact about the
relationship, because practitioners of that model will check.

Take FAIR as the worked example. Factor Analysis of Information Risk — carried by The Open Group as
two standards, a risk taxonomy and a risk analysis process — breaks risk into how often a loss event
occurs and how much it costs, and it does so in money, using distributions rather than point
estimates. A questionnaire that keeps a likelihood-shaped term apart from an impact-shaped term has
borrowed FAIR's **way of factoring the problem**. It has borrowed nothing else. It produces no
currency figure, no distribution and no annualised frequency, and FAIR exists precisely as an
argument *against* the ordinal grids it would otherwise resemble.

The sentence that survives scrutiny, then, is that the instrument *follows FAIR's decomposition
principle on an ordinal scale, without FAIR's quantification*. The sentences that do not survive are
"FAIR-based", "FAIR-aligned", and any claim of conformance to either standard. One clause of
precision buys you the ability to say it in front of someone who does this for a living.

## Evidence classes

A practice I would carry to any instrument that makes claims: label every quantitative claim with how
it was established, and keep the labels visible to the reader.

| Class | Meaning | Weight it carries |
|---|---|---|
| **Verified** | Measured, or reproducible by the reader | Highest |
| **Independent** | Carries a citation to an analyst house, a peer-reviewed source, or a standards body | High — but check how old it is |
| **Vendor** | Published by a vendor, including your own employer | Directional only |
| **Illustrative** | Constructed to demonstrate a method | None as evidence |

Mixing these silently is how a document ends up with a vendor survey figure doing the work of a
measurement. Labelling them forces the author to notice when an argument rests on the weakest class —
and tells the reader which numbers to trust.

---

**Next:** [5. Validating a scoring model](05-validating-a-scoring-model.md)
