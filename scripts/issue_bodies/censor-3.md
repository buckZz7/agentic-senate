The deliberation process diagram is an ASCII flowchart in a `<pre>` block. On desktop it reads as charmingly technical; on narrow viewports it forces horizontal scrolling inside a card and the box-drawing characters break alignment at some zoom levels.

**Evidence:** at 375px viewport width the `<pre>` requires ~2.5 screens of horizontal scroll; the diagram is the single most information-dense element on the page and mobile users get the worst version of it. Reference: Stripe and Linear render process/architecture diagrams as responsive HTML/SVG that reflows or scales.

**Task:** Replace the `<pre>` flowchart with a responsive diagram — either:
- Semantic HTML/CSS (flex column of stage cards with connecting arrows via CSS pseudo-elements), which reflows naturally, or
- An inline SVG with `viewBox` scaling and a vertical mobile variant

Keep the monospace/technical flavor for labels (it fits the brand); the goal is reflow, not restyling.

**Acceptance:** no horizontal scroll at 320px width; diagram legible at all breakpoints; before/after mobile screenshots in the PR.
