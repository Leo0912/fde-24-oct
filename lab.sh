#!/usr/bin/env bash
# Session 3 lab runner. Every step is one command; nothing to type into the code.
#   bash lab.sh l1 fail | check | show | apply | pass | try          (L1 Contract)
#   bash lab.sh l2 fail | check | show | apply | pass | try | serve  (L2 Service)
#   bash lab.sh reset l1 | l2                                    (put the TODO version back, e.g. for the assignment)
set -euo pipefail
cd "$(dirname "$0")"
PY=${PY:-python}
RUNG="L1 Contract"
hdr() { printf '\n\033[1m━━━ %s · %s ━━━\033[0m\n%s\n\n' "$RUNG" "$1" "$2"; }

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
  l2:fail)  RUNG="L2 Service"; hdr "step 1 · SEE IT FAIL" "Objective: a script can't be called; the service's endpoints are still TODOs. In the deck: Service topic, 'What is FastAPI?'."
            "$PY" lab/l2/fail.py ;;
  l2:check) RUNG="L2 Service"; hdr "steps 2 and 5 · RUN THE CHECKS" "Objective: see what the service tests check, and why they fail or pass. In the deck: Service topic, 'How you test an LLM service'."
            "$PY" lab/l2/check.py ;;
  l2:show)  RUNG="L2 Service"; hdr "step 3 · READ THE FIX" "Objective: see the two endpoints, the timeout and the await. In the deck: Service topic, 'One request through FastAPI'; Async topic, 'Never wait forever'."
            "$PY" lab/l2/show.py ;;
  l2:apply) RUNG="L2 Service"; hdr "step 4 · APPLY THE FIX" "Objective: put the endpoints in place, and see exactly what changed."
            "$PY" lab/l2/apply.py ;;
  l2:pass)  RUNG="L2 Service"; hdr "step 5 · SEE IT PASS" "Objective: real requests to the real service: 200, human_review, 422, timeout. In the deck: Service topic, 'One request through FastAPI'."
            "$PY" lab/l2/pass.py ;;
  l2:try)   RUNG="L2 Service"; hdr "step 6 · TRY IT" "Objective: prove the real service is async (about 1 s vs about 10 s). In the deck: Async topic, 'I made it async'."
            "$PY" lab/l2/try_.py ;;
  l2:serve) RUNG="L2 Service"; hdr "step 7 · OPEN /docs" "Objective: the contract, written down, in your browser. In the deck: Service topic, 'One request through FastAPI'."
            echo "HOW THIS STEP RUNS"
            echo "  bash lab.sh l2 serve"
            echo "    └─ python -m uvicorn app.main:app --port 8000   (a web server running app/main.py; Ctrl+C to stop)"
            echo "  Then: Ports tab -> 8000 -> globe icon -> add /docs to the address. Keep the port Private."
            echo
            "$PY" -m uvicorn app.main:app --port 8000 ;;
  reset:l2) echo "HOW THIS STEP RUNS: copies lab/l2/main_start.py (the L2 starter) -> app/main.py"
            cp lab/l2/main_start.py app/main.py
            echo "  ↩️  app/main.py is back to the TODO version (for the write-it-yourself assignment)." ;;
  reset:l1) echo "HOW THIS STEP RUNS: copies lab/l1/models_start.py (the empty starter) -> app/models.py"
            cp lab/l1/models_start.py app/models.py
            echo "  ↩️  app/models.py is back to the TODO version (for the write-it-yourself assignment)." ;;
  *) sed -n '2,6p' "$0"; exit 1 ;;
esac
