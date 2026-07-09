The site sets `font-family: Georgia, "Times New Roman", serif` globally with no loaded webfont, a single weight, and no letter-spacing tuning at display sizes.

**Evidence (vs. SOTA reference points):** Linear, Stripe, and Vercel all (a) load a variable webfont, (b) use 3 distinct weights as a hierarchy system (e.g. 400 read / 510 emphasize / 590 announce), and (c) apply *negative* letter-spacing that scales with display size (Linear: -1.056px at 48px, -0.704px at 32px, ~normal below 16px). Our hero headline renders at default tracking with default weight, so the typographic hierarchy carries less authority than the content deserves. The serif choice itself is defensible (classical/governance character) — the execution is what lags.

**Task:**
- Load a quality serif display face for headings (e.g. Fraunces or Playfair Display via Google Fonts) + a neutral sans (e.g. Inter) for body/UI text
- Define an explicit type scale (display/h1/h2/body/caption) with per-size weight and letter-spacing values as CSS custom properties
- Keep the marble-and-gold identity — this is a refinement, not a redesign

**Acceptance:** side-by-side screenshots (before/after) in the PR; no layout regressions on mobile; Lighthouse performance not degraded by font loading (use `font-display: swap`, preconnect).
