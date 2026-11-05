*Personal work. No confidential or employer-proprietary information. See [DISCLAIMER](../DISCLAIMER.md).*

# 6. Decision log

Nine decisions, in the form I keep them: context, the options actually considered, what was decided,
and what it cost. Where a decision turned out to be wrong, that is recorded too.

These are product and engineering judgements, stated in general terms. They contain no parameters,
mappings or instrument content — see [DISCLAIMER.md](../DISCLAIMER.md).

---

## D1 — Questionnaire, not scanner

**Context.** Assessing AI security exposure accurately means inspecting the estate. Inspecting the
estate requires access. Access requires an approval decision that the customer cannot justify until
they have the assessment.

**Options.** (a) Connect to the environment via read-only API or agent. (b) Ask the customer to
describe their environment. (c) Hybrid — questionnaire now, optional connection later.

**Decision.** (b). Pure questionnaire, no environment access of any kind.

**Consequence.** Reach increased enormously — anyone can start without approving anything. Precision
dropped, and the product permanently cannot answer questions of the form "is *this* model safe". That
boundary has to be stated to users rather than fudged, and every review cycle produces someone asking
for (c). The answer is that (c) is a different product with a different buyer.

---

## D2 — A short public instrument, accepting what shortness costs

**Context.** Each additional question costs completions and buys resolution. Somewhere there is a
length past which the marginal question costs more than it buys.

**Options.** (a) Comprehensive — thirty or more questions, maximum fidelity. (b) Short — under ten,
maximum completion. (c) Progressive — short core, optional depth.

**Decision.** (b) for the public self-serve surface, with an explicit list of what the instrument
therefore cannot establish.

**Consequence.** Completion is dramatically better and the output is coarser. The real work was not
choosing the number — it was deciding *which* questions survive, and accepting that two of the few
available slots had to go to agentic concerns because that is where the gap is widest. (c) remains
attractive and was not attempted; I still think it is the right eventual shape.

---

## D3 — Deterministic engine; the language model stays out of the judgement

**Context.** An LLM could generate the assessment directly. It would handle free text, read
fluently, and ship sooner.

**Options.** (a) LLM generates the assessment. (b) Deterministic engine, no model anywhere.
(c) Deterministic judgement, LLM confined to explanation and narrative.

**Decision.** (c), with the boundary enforced architecturally rather than by convention.

**Consequence.** Identical answers always produce an identical result, which is what makes the output
defensible when a customer is challenged on it — and what makes regression testing possible at all.
The cost is that free-text input becomes a separate, harder problem, and genuinely unusual situations
get a generic answer. Worth it. "The model said so" is not a defence a security leader can take to a
board.

---

## D4 — Anchor on a published external model rather than inventing one

**Context.** A vendor can define its own maturity model and control its own narrative, or adopt a
published one and inherit its credibility.

**Options.** (a) Author a proprietary model. (b) Adopt a published model as-is. (c) Adopt a published
model and extend it where it has gaps.

**Decision.** (b)/(c) — anchor on a published model, cite it, link to it, and be explicit about any
place the implementation departs from it.

**Consequence.** Credibility with security buyers that no vendor-authored framework can buy at any
price — the buyer has usually heard of the model already. The costs are real: you inherit the model's
structure including the parts that fit badly, you inherit its release cadence, and any departure you
make has to be disclosed rather than quietly absorbed. A third cost I underestimated: a published
model is **copyrighted**, so you may cite and describe it but not reproduce it, which constrains how
much of it can appear in your own material. See [7. Standards landscape](07-standards-landscape.md).

---

## D5 — Content as data, editable without a release

**Context.** A standards-anchored product has a standing currency obligation. Published frameworks
renumber, rename and reorder entries; some ship monthly.

**Options.** (a) Copy and taxonomies compiled into the application. (b) Held as data, resolved at
runtime, editable by a non-engineer.

**Decision.** (b), with layered resolution — shipped default, promoted override, live edit.

**Consequence.** A framework correction becomes a content edit rather than an engineering ticket, which
is the difference between staying current and visibly rotting. The costs are version skew, a new
surface through which wording can change without review, and the need to treat content edits as
auditable events. All manageable; all real.

---

## D6 — Stateless by default — and then this changed

**Context.** A self-serve assessment can keep everything in the browser or persist sessions
server-side.

**Options.** (a) Stateless — nothing leaves the browser. (b) Persisted — saveable, resumable,
analysable.

**Decision.** (a) initially. Later, (b), for genuine reasons: people wanted to resume, and facilitated
sessions needed saving.

**Consequence.** This is the decision I most want to flag as a *lesson* rather than a success. The
stateless posture supported a very strong, very simple trust claim. The moment persistence arrived,
that claim became partly aspirational — and the thing that must not happen, and which is easy to let
happen, is for the original copy to survive the architectural change. The rule I would now impose from
day one: **the privacy claim in user-facing copy is a derived artefact of the architecture, and it is
re-reviewed every time persistence changes.** If any clause has become aspirational, the copy changes
before the next release, not after someone notices.

---

## D7 — The report is a product surface, not an export

**Context.** The downloadable document is what circulates inside the customer's organisation and gets
lifted into their board material. Most of the perceived value lives there, and it is read by people
who never see the web product.

**Options.** (a) Treat it as an export of the page. (b) Treat it as a first-class surface with its own
design, generated from the same prepared data.

**Decision.** (b), and make document generation a build gate so a real artefact is produced and
inspected on every change.

**Consequence.** The page and the document cannot disagree, which eliminates the single most
credibility-destroying defect this class of product has. It costs real engineering — document
rendering has its own layout failure modes, invisible to type checkers and unit tests, findable only
by looking at the output.

---

## D8 — Expert-prediction corpus instead of snapshot tests

**Context.** A snapshot suite tells you the engine still does what it did yesterday. It will preserve
a wrong answer indefinitely and report green.

**Options.** (a) Snapshot the current outputs. (b) Author cases with a human-written expected outcome
recorded *before* the engine runs, and measure agreement.

**Decision.** (b), with the rule that a change moving agreement away from the corpus gets reverted
however good its reasoning.

**Consequence.** Several well-motivated improvements were built, measured, found to make agreement
worse, and reverted. That is the method working, not failing — but it means budgeting for reverted
work and recording what was tried so it is not re-attempted later by someone who does not know.
Method in [5. Validating a scoring model](05-validating-a-scoring-model.md).

---

## D9 — Refuse to over-claim on a thin instrument

**Context.** Eight answers can be dressed up as a quantified risk posture. Doing so is easy, it
demos well, and it is a lie.

**Options.** (a) Present the output as a risk score. (b) Present it as a readiness band plus priority
focus areas, with explicit limits.

**Decision.** (b). State plainly that self-reported maturity is claimed rather than audited, that the
output is a directional first read, and that it is not compliance evidence.

**Consequence.** The product promises less and is trusted more. This is the decision I would defend
most strongly to anyone building in this space: in a category where every competitor is free, the only
durable differentiator is whether a security leader is willing to forward your output to their board
with their own name attached. Over-claiming forfeits that permanently, and you do not get a second
chance at it.

---

**Next:** [7. Standards landscape](07-standards-landscape.md)
