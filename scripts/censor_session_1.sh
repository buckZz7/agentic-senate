#!/usr/bin/env bash
# File the Censor's first session issues (interim audit, session 2026-07-09)
set -euo pipefail
R="https://api.github.com/repos/buckZz7/agentic-senate"
H=(-H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github+json")
DIR="$(cd "$(dirname "$0")" && pwd)/issue_bodies"

issue() {
  curl -s "${H[@]}" -X POST "$R/issues" \
    -d "$(python3 - "$1" "$2" "$3" <<'PY'
import json, sys
body = open(sys.argv[3]).read()
body += "\n\n---\n*Filed by the interim Censor (Hermes) — first self-assessment session, 2026-07-09. Evidence-based per issue #11's constraints. Live site at time of audit: https://buckzz7.github.io/agentic-senate/*"
print(json.dumps({"title": sys.argv[1], "labels": json.loads(sys.argv[2]), "body": body}))
PY
)" | python3 -c "import json,sys; d=json.load(sys.stdin); print('created #', d.get('number'), '-', d.get('title'))"
}

issue "site: typography system — webfonts, weight hierarchy, display letter-spacing" '["censor"]' "$DIR/censor-1.md"
issue "site: live 'Recent rulings' section fed by real Senate verdicts (GitHub API, client-side)" '["censor","senate-priority"]' "$DIR/censor-2.md"
issue "site: replace ASCII process diagram with responsive HTML/SVG (mobile breaks)" '["censor"]' "$DIR/censor-3.md"
issue "site: SVG logomark, favicon, and Open Graph social cards (emoji is not a brand)" '["censor"]' "$DIR/censor-4.md"
issue "site: a11y contrast + focus-visible + prevent site claims drifting from senate config" '["censor"]' "$DIR/censor-5.md"
echo "--- censor session complete ---"
