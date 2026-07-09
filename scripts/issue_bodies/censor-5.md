The site has accessibility and information-freshness gaps:

**Evidence:**
1. `--muted: #9aa3b5` body text on `--panel: #12151d` cards ≈ 6.8:1 contrast (passes), but `--gold-dim: #8a7223` on `--bg: #0b0d12` used for CTA borders ≈ 3.4:1 — below WCAG AA for text-adjacent UI at small sizes. Footer `--gold-dim` "⚖ ⚖ ⚖" and small text sit near the threshold.
2. No `:focus-visible` styles — keyboard navigation shows browser-default outlines that clash with the design (or are suppressed by some browsers on dark themes). Reference: Linear/Stripe ship deliberate multi-layer focus rings.
3. Static claims will rot: "Three senators, three model families" and the Phase 0 badge are hardcoded. When `senate/config.yaml` changes (protected path, but changeable by amendment), the site will silently lie — a fidelity problem (Constitution, Article II §1).

**Task:**
- Bump low-contrast tokens to meet WCAG AA (adjust `--gold-dim` usage or sizes)
- Add explicit `:focus-visible` treatment consistent with the gold accent
- Move senator names/models/phase into a small JSON the page fetches from the repo raw URL (single source of truth = `senate/config.yaml`-derived), or add a CI check that fails when site claims drift from config

**Acceptance:** axe-core or Lighthouse a11y score ≥ 95; tab-through screencast/screenshots in PR; site senator list provably derived from config.
