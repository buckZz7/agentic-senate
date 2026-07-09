The site is entirely static, but the Senate's most compelling asset is *live proof that it works* — real verdicts with real reasoning at real (tiny) costs.

**Evidence:** PR #9 (fast-track, $0.0065) and PR #10 (full deliberation, 3–0, $0.0697) produced verdict comments that are more persuasive than any marketing copy on the page. Reference sites in this class (Gittensor's own homepage, Linear's changelog) lead with live/streaming activity because it converts skeptics.

**Task:** Add a "Recent rulings" section that fetches from the GitHub API client-side (no build step, no secrets — public read endpoints):
- `GET /repos/buckZz7/agentic-senate/issues/comments?per_page=…` filtered to `github-actions[bot]` verdict comments, or the `deliberations/` directory listing
- Render: PR title, verdict badge (APPROVE green / REJECT red / ESCALATE gold), track, cost, senator vote table
- Graceful degradation if rate-limited (60 req/h unauthenticated): cache in localStorage, show placeholder

**Acceptance:** section renders real verdicts from the live repo; zero API keys in client code; handles empty/error states.
