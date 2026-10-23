#!/usr/bin/env bash
# Session 3 lab runner. Every step is one command; nothing to type into the code.
#   bash lab.sh l1 fail | check | show | apply | pass | try   (L1 Contract)
#   bash lab.sh reset l1                                  (put the TODO version back, e.g. for the assignment)
set -euo pipefail
cd "$(dirname "$0")"
PY=${PY:-python}
hdr() { printf '\n\033[1m━━━ L1 Contract · %s ━━━\033[0m\n%s\n\n' "$1" "$2"; }

case "${1:-}:${2:-}" in
  l1:fail)  hdr "step 1 · SEE IT FAIL" "Objective: model output is untrusted input. In the deck: Contract topic, 'The model's reply is untrusted input'."
            "$PY" lab/l1/fail.py ;;
  l1:check) hdr "steps 2 and 5 · RUN THE CHECKS" "Objective: see what the contract tests check, and why they fail or pass. In the deck: Service topic, 'How you test an LLM service'."
            "$PY" lab/l1/check.py ;;
  l1:show)  hdr "step 3 · READ THE FIX" "Objective: see exactly what Pydantic adds. In the deck: Contract topic, 'What is Pydantic?' and 'The contract in code'."
            "$PY" lab/l1/show.py ;;
  l1:apply) hdr "step 4 · APPLY THE FIX" "Objective: put the contract in place, and see exactly what changed."
            "$PY" lab/l1/apply.py ;;
  l1:pass)  hdr "step 5 · SEE IT PASS" "Objective: the same bad replies, now caught. In the deck: Contract topic, 'The contract in code'."
            "$PY" lab/l1/pass.py ;;
  l1:try)   hdr "step 6 · TRY IT" "Objective: read Pydantic's error types. Predict first. In the deck: Contract topic, 'Predict the validation error'."
            "$PY" lab/l1/try.py ;;
  reset:l1) echo "HOW THIS STEP RUNS: copies lab/l1/models_start.py (the empty starter) -> app/models.py"
            cp lab/l1/models_start.py app/models.py
            echo "  ↩️  app/models.py is back to the TODO version (for the write-it-yourself assignment)." ;;
  *) sed -n '2,5p' "$0"; exit 1 ;;
esac
