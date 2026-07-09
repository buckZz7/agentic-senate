Full deliberation currently runs a fixed process regardless of contention: openings → exactly one rebuttal round → votes (Article IV §2). Unanimous-from-the-start cases pay for a rebuttal round they don't need; genuinely split cases end debate just when it's getting useful.

**Evidence:** PR #10 and #19 were 3–0 from opening assessments onward — the rebuttal round changed nothing (cost ~1/3 of each deliberation). Conversely, contentious proposals (like the PR #17/#18 constitutional questions) get no more debate than trivial ones. This misallocates deliberation against Article II §6 (Economy: "deliberate in proportion to stakes").

**Task — two parts:**

1. **Escalating debate rounds.** After openings, collect *provisional leanings* (APPROVE/REJECT/ABSTAIN, one line). If unanimous → skip straight to final votes. If split → run a rebuttal round and re-poll; continue up to `max_debate_rounds` (config, default 3) or until leanings converge. Each extra round must respect the deliberation budget — budget exhaustion still ESCALATEs (never silently approves).

2. **Vote-flip tracking.** Record each senator's leaning-per-round in the `Deliberation` object and transcript (`leaning_history`). This measures whether debate actually changes minds — the foundational metric for the accountability dashboard (#7) and for evaluating whether future debate-structure changes are worth their cost.

**Constraints:**
- `senate/deliberation/` is a protected path — expect FULL_DELIBERATION on your PR.
- Backward compatible with `senate/config.yaml` (absent `max_debate_rounds` → current behavior: exactly one rebuttal round).
- Offline tests in `evals/test_process.py` style (FakeLLM): unanimous-skip, split-escalates, round-cap respected, budget exhaustion mid-debate escalates, leaning history recorded.

**Acceptance:** tests pass without API key; a real deliberation on a trivially unanimous PR costs measurably less than today's; transcript shows leaning history per round.
