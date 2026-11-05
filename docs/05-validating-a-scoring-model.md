*Personal work. No confidential or employer-proprietary information. See [DISCLAIMER](../DISCLAIMER.md).*

# 5. Validating a model whose output is a judgement

> Method only. No case content, no results, no measured figures from any product.

## Regression-by-recording is not validation

The reflexive way to protect a scoring engine is to capture what it currently emits and assert that
nothing changes. Call it regression-by-recording. It answers one question — *is today's behaviour
yesterday's behaviour?* — and it answers nothing else.

Consider what happens if the engine was wrong on the day you recorded. You have now frozen the error
and built a gate that defends it. Every future attempt to correct the behaviour trips the gate and
looks like a regression. The suite is green, permanently, and worthless.

For a product whose output is an opinion, you need a second opinion to compare against. Everything
below is about where that second opinion comes from and how you keep it honest.

## Human prediction, recorded in advance

Build a set of fictional organisations. Write each one as **prose** — a paragraph or two describing a
plausible business, what AI it runs, how exposed it is, how it is governed.

Then, for each, have an assessor read the narrative and commit to an answer: which band they expect,
which areas they expect to come out worst, whatever your instrument emits. Write it down. Only then
derive the structured answers and run the engine.

Sequencing is the entire technique. An expectation recorded after seeing the output is not an
expectation — it is a justification, and it will agree far more often than it has any right to.

**Write the narrative before the answers**, too. If you compose answer sets directly you will reach
for combinations the instrument handles tidily, because you are thinking in its categories. Prose
first produces awkward organisations, and the awkward ones are where you learn something.

## When the engine and the assessor disagree

A disagreement is a **question, not a verdict**. Four things it can mean:

| Reading | What it means | Response |
|---|---|---|
| The model is at fault | The assessor is right and the engine mishandles this shape of organisation | Change the engine |
| The expectation is at fault | The assessor erred, or applied a standard inconsistently with other cases | Change the expectation, and record the change |
| Neither is at fault | Something real exists that the instrument has no vocabulary for | Extend the instrument |
| Only the presentation is at fault | The judgement is sound; the output misleads | Change the presentation |

Teams default to the first reading. In my experience the other three together are more common, and
conflating them produces engine churn aimed at problems that live elsewhere.

## The corpus outranks the argument

Adopt one rule and hold it: **when a change reduces agreement, the change loses.** Not the corpus —
the change. However elegant the reasoning, however clean the implementation, however obviously
correct it seemed at design time.

This is unpleasant to enforce and it is where the method pays for itself. You will build
well-motivated improvements that compile, that pass everything else, that you can defend from first
principles, and that measurably make the instrument agree with expert judgement *less often*. Backing
them out is the discipline.

Two practical consequences. Budget for discarded work, because there will be some. And keep a written
record of what was attempted and what it measured — otherwise the same idea returns in six months,
proposed in good faith by someone who has no way of knowing it was already tried and already lost.

## Twins: the test that finds broken causation

Construct pairs of cases that differ in exactly one respect — the same organisation with and without
a particular control, at two levels of data sensitivity, at two levels of autonomy. Then assert only
the **direction** of the difference, never the absolute values.

Twins are worth more than absolute-agreement cases, and the reason is worth being precise about.
Absolute agreement conflates two separate properties: whether the instrument puts organisations in
the right *order*, and whether it puts them at the right *level*. Getting the level wrong is a
calibration fault — unpleasant, and fixable by moving boundaries. Getting the order wrong is a
reasoning fault, and no amount of boundary-moving repairs it. An instrument that rates an
organisation as *more* exposed after it adds a protection is not mis-tuned; it is incoherent, and
twins are the only test in your suite that will say so.

They also survive re-tuning. Absolute expectations shift whenever you move a boundary; directions must
not. So a directional failure appearing after a tuning change is unambiguous — the change was wrong.

## Three disciplines that keep it honest

**Changes to an expectation are always annotated.** If an assessor revises what a case should produce,
the revision carries a note: what moved, and on what grounds. Cases without a note have never been
touched. Skip this and agreement rises quietly over the months because the target drifted, and no one
can reconstruct how much of the improvement was real.

**Quote the figure measured against untouched expectations.** Here is the trap. Revise a meaningful
share of your expectations after an engine change and agreement against the revised set will approach
perfect — and that number is close to meaningless, since a revised expectation is no longer
independent of the thing it is testing. Hold both internally if you like. Publish only the figure the
engine faced blind. Leading with the harder number is the simplest protection against a validation
story that drifts into dishonesty without anyone deciding to be dishonest.

**Leave real disagreements open.** When investigation ends with the assessor and the engine still not
agreeing, say so and keep the case open. A finding honestly left unresolved is worth more than one
closed by adjusting what the right answer was supposed to be.

## The limits of the method

A corpus feels like validation of everything. It is not, and the gaps matter:

- **It is not reality.** The organisations are invented. What you are measuring is concordance with an
  assessor's judgement — a proxy for correctness, not correctness itself. A systematic blind spot in
  the assessor becomes a systematic blind spot in the instrument, invisibly.
- **It says nothing about usability.** Perfect concordance tells you nothing about whether a stranger
  can finish the questionnaire unaided, and completion is what everything downstream rests on. That
  requires cold users and it is a different exercise — see the retrospective in
  [2. Case study](02-case-study.md).
- **It cannot support population claims.** Invented cases carry no information about the distribution
  of real respondents, so they can never validate a percentile, a benchmark or a "compared to your
  peers" statement.
- **It inherits its authors.** A corpus written by one person encodes one person's calibration.
  Widening the pool of assessors improves it more than any number of additional cases from the same
  hand — and it is the improvement most often skipped, because it requires other people's time.

## Show your working

The practice I would push hardest for, and the one that meets most resistance: **put the instrument's
agreement figures where users can see them, unflattering ones included.**

Something that asks a security leader to rely on its judgement ought to be able to say how often that
judgement holds up. Almost nothing in this category does. It differentiates, it is the right thing to
do, and it creates a useful obligation — a published number is one you cannot quietly let decay.

Publish it properly or not at all: the blind figure, its denominator, the method behind it, and the
open disagreements alongside. Withdrawing the measure the first time it reads badly is worse than
never having offered it.

---

**Next:** [6. Decision log](06-decision-log.md)
