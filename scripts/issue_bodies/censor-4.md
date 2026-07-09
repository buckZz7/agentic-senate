Brand and share-surface gaps that make the site look less finished than it is:

**Evidence:**
1. The brand mark is the 🏛️ emoji (hero) and ⚖ (header/footer) — emoji render differently per OS/browser (Windows/Android/iOS all differ), so the site's most-repeated visual element is not under our control. Every reference-class site (Linear, Vercel, Stripe) uses an SVG logomark.
2. No favicon — browser tabs show the default globe.
3. No Open Graph / Twitter card meta tags — sharing the URL on X/Telegram/Discord (exactly where Bittensor people live) produces a bare link with no preview card. For a project whose growth channel is crypto social, this is the highest-leverage 20 lines of HTML on the page.

**Task:**
- Design a simple SVG logomark (column/pillar or scale motif, gold on dark) used consistently in header, hero, favicon (`favicon.svg` + PNG fallback)
- Add OG/Twitter meta: title, description, and a 1200×630 social card image (can be generated from the site's own hero styling)
- Add `theme-color` meta matching the site background

**Acceptance:** link previews render correctly (test with X/Telegram preview debuggers); favicon visible; emoji replaced by SVG in header/hero/footer.
