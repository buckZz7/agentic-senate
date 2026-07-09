# The Agentic Senate 🏛️

**A constitutional governance engine, governed by itself.**

This repository is an experiment in agentic governance on
[Gittensor (Bittensor subnet 74)](https://gittensor.io). It contains:

1. **A Constitution** ([`CONSTITUTION.md`](CONSTITUTION.md)) — a human-written
   statement of intent that governs everything in this repo.
2. **A Senate** ([`senate/`](senate/)) — a body of AI agents backed by diverse
   models that deliberates and votes on every proposed change, judging it
   against the Constitution.
3. **An incentive** — Gittensor miners are rewarded (in TAO-denominated alpha)
   for merged PRs that improve the Senate's decision-making.

The loop this creates: *miners improve the Senate → the Senate judges the
miners' work → better judgments make future improvements safer to accept →
power devolves from humans to the Senate as reliability is demonstrated.*

The long-term vision: a Senate architecture good enough that **anyone can
write a constitution for an idea in plain language, register a repo, and have
an incentivized swarm of agents and humans faithfully carry it out.**

## How it works

```
                  ┌────────────────────────────────────────┐
   PR opened ───► │ Triage Clerk (cheap model)             │
                  │  trivial? ──────────► FAST_TRACK       │
                  │  logic/security/CI? ► FULL_DELIBERATION│
                  │  protected path? ───► FULL (by law)    │
                  └────────────────┬───────────────────────┘
                                   ▼
                  ┌────────────────────────────────────────┐
                  │ The Senate (diverse models)            │
                  │  1. opening assessments                │
                  │  2. one rebuttal round                 │
                  │  3. votes with justification           │
                  └────────────────┬───────────────────────┘
                                   ▼
                  verdict posted on the PR + full transcript
                  committed to deliberations/
```

- **Ordinary changes**: simple majority (Article IV)
- **Constitutional amendments**: 2/3 supermajority + human Custodian approval
  during bootstrap (Articles V–VI)
- **Every deliberation is public** — transcripts live in `deliberations/`

### Bootstrap phases (Article VI)

| Phase | Senate verdict | Merge authority |
|---|---|---|
| **0 (current)** | Advisory comment on every PR | Human Custodian |
| 1 | Required status check | Human Custodian |
| 2 | Binding for ordinary changes | The Senate itself |

## For Gittensor miners

You are the Senate's evolutionary pressure. Improve it, get paid.

- Pick an [open issue](../../issues) (issues labeled `senate-priority` matter most)
- Source code improvements score highest under Gittensor's AST-based scoring;
  the Senate additionally values tests (Article II §4 — Quality)
- The Senate reviews your PR and posts its verdict; the Custodian merges
- Constitution edits are amendments: expect full deliberation and a
  supermajority requirement — read Article V before trying

New to Gittensor? See [docs/MINING.md](docs/MINING.md).

## Running the Senate locally

```bash
python -m venv .venv && . .venv/bin/activate
pip install pyyaml
export OPENROUTER_API_KEY=sk-or-...
export GITHUB_TOKEN=ghp_...
python -m senate.merge_gate --pr <number> --repo <owner>/<repo> --no-comment
```

Run the process tests (no API key needed):

```bash
python evals/test_process.py
```

## Repository map

```
CONSTITUTION.md        the law (protected — see Article V)
senate/
  config.yaml          senate composition, models, budgets (protected)
  models.py            Proposal / Deliberation / Vote data model
  llm.py               provider-agnostic LLM client + budget enforcement
  triage/              the Triage Clerk
  senators/            senator personas, opinions, rebuttals, ballots
  deliberation/        the constitutional process engine
  merge_gate.py        CI entrypoint: review PR → verdict → transcript
evals/                 process tests + (future) decision-quality benchmarks
deliberations/         public transcripts of every Senate deliberation
docs/                  governance procedure, miner guide, roadmap
```

## License

MIT — see [LICENSE](LICENSE).
