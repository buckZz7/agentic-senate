## The Censor — a scheduled self-assessment organ for the Senate

> *"Something in the system should look at the current state of things — website, code, processes — and suggest updates. There's always room for improvement, even if the Custodian doesn't know exactly how to prompt for it."* — the Custodian

The Senate is currently **reactive**: it only thinks when a PR arrives. This issue proposes the **Censor** (after the Roman office that conducted the census and audited public works): an autonomous agent that runs on a schedule, senses the current state of the project, compares it against reference points, and emits *direction* in the form of well-specified GitHub issues.

This closes the sensing loop: **sense → propose (Censor) → build (miners) → deliberate (Senate) → merge (Custodian/Senate)** — a full self-improving system where the backlog generates itself.

### Duties (v1 scope)

Each session, the Censor:

1. **Senses state**
   - Screenshots the live site (https://buckzz7.github.io/agentic-senate/)
   - Reads the repo tree, recent commits, open/closed issues, PR velocity
   - Reads recent deliberation transcripts in `deliberations/`
2. **Compares against references**
   - Site: SOTA-but-reasonable design references (typography, hierarchy, spacing — not novelty for its own sake)
   - Code: architecture smells, missing tests, TODO drift
   - Process: verdict quality, stale issues, senator conduct signals
3. **Emits direction, never decisions**
   - Files at most **5 issues per session**, each with concrete evidence (screenshots, file paths, metrics, reference comparisons) and acceptance criteria
   - Labels them (`censor`, plus `senate-priority` where warranted)
   - Posts a short session report (what was examined, what was healthy, what was flagged)

### Constitutional constraints (non-negotiable)

- **Article II §2 (Safety):** The Censor has NO merge authority and NO write access to code. It proposes; power stays with the Senate and Custodian. Initiative and authority must never live in the same organ.
- **Article II §6 (Economy):** Hard budget cap per session (suggest $1.00). Budget exhaustion ends the session gracefully.
- **Article II §3 (Honesty):** Every critique must cite evidence. No hallucinated problems — an issue without reproducible evidence is misconduct.
- Rate-limited: skip a session if >50% of its previous issues remain open (don't flood the backlog).

### Suggested implementation

- `senate/censor/` module reusing the existing `ChatClient` plumbing
- Scheduled workflow (`censor.yml`, weekly cron + `workflow_dispatch`)
- Session reports committed to `censor/reports/` (like `deliberations/`)
- The Censor model should differ from sitting senators where practical (fresh eyes)

### Acceptance criteria

- A dry-run mode that outputs proposed issues as a report without filing them
- Unit tests for the issue-quality gate (evidence present, count cap, budget stop)
- One real session producing at least one issue a human judges useful

This is the flagship issue of the repository. It is also the prototype for the long-term vision: a Censor that audits *any* repo against *its* constitution is the organ that notices when reality drifts from a written vision.
