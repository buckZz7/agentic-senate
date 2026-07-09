#!/usr/bin/env bash
# Seed founding issues + labels for buckZz7/agentic-senate
set -euo pipefail
R="https://api.github.com/repos/buckZz7/agentic-senate"
H=(-H "Authorization: token $GITHUB_TOKEN" -H "Accept: application/vnd.github+json")
DIR="$(cd "$(dirname "$0")" && pwd)/issue_bodies"

# Labels
for row in "senate-priority|D93F0B|High-value work for the Senate's mission" \
           "evals|0E8A16|Decision-quality evaluation harness" \
           "senator-conduct|B60205|Reports of senator misconduct (Article II honesty)" \
           "amendment|5319E7|Proposals to change the Constitution"; do
  IFS='|' read -r name color desc <<< "$row"
  curl -s "${H[@]}" -X POST "$R/labels" -d "{\"name\":\"$name\",\"color\":\"$color\",\"description\":\"$desc\"}" > /dev/null
done

issue() { # title labels-json body-file
  curl -s "${H[@]}" -X POST "$R/issues" \
    -d "$(python3 - "$1" "$2" "$3" <<'PY'
import json, sys
print(json.dumps({"title": sys.argv[1], "labels": json.loads(sys.argv[2]), "body": open(sys.argv[3]).read()}))
PY
)" | python3 -c "import json,sys; d=json.load(sys.stdin); print('created #', d.get('number'), '-', d.get('title'))"
}

issue "Smart per-file diff chunking so senators never lose sight of files" '["senate-priority"]' "$DIR/1.md"
issue "Persist deliberation transcripts from CI back to the repository" '["senate-priority","good first issue"]' "$DIR/2.md"
issue "Enforce Article III composition rules in code (config validator)" '["senate-priority"]' "$DIR/3.md"
issue "Decision-quality benchmark: fixture PRs with known-correct verdicts" '["senate-priority","evals"]' "$DIR/4.md"
issue "LLM client: retries, backoff, and error taxonomy" '["good first issue"]' "$DIR/5.md"
issue "Give senators test-run evidence (safely) instead of diff-only review" '["senate-priority"]' "$DIR/6.md"
issue "Senator accountability dashboard from deliberation transcripts" '["evals"]' "$DIR/7.md"
issue "Rotate fast-track reviewer duty across senators" '["good first issue"]' "$DIR/8.md"
echo "--- done ---"
