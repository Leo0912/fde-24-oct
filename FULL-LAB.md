# Full lab: the deep-dive version after the primer

Use this path if you want to go beyond the small Pydantic demo and do the full Session 3 lab.

## What this version adds beyond the primer

The primer in `primer/l1-pydantic-mini/` teaches one key idea:

- messy LLM output is untrusted input
- a small Pydantic contract can stop silent misroutes and crashes

This full lab keeps that idea, then adds the production engineering pieces around it:

- a request model (`Complaint`)
- a full response model (`TriageResult`)
- safe parsing in `parse_triage(...)`
- an async FastAPI service with `/triage` and `/healthz`
- timeout handling
- structured logging with request IDs and masking
- Git workflow and Docker hardening

## Suggested sequence

### 1. Optional warm-up

If you want the concept-first path before the full implementation, run the primers in the same order as Session 3:

- `primer/l1-pydantic-mini/` → contract
- `primer/l2-async-fastapi-mini/` → service
- `primer/l3-observability-mini/` → observability

Then come back to the full lab.

### 2. Guided L1 walkthrough

If you want the instructor-style deep dive:

```bash
bash lab.sh l1 fail
bash lab.sh l1 check
bash lab.sh l1 show
bash lab.sh l1 apply
bash lab.sh l1 pass
```

This uses `lab/L1-deep-dive.md` to explain exactly what is happening and why.

### 3. Write-it-yourself version

If you want to implement the contract yourself instead of only watching the guided flow:

```bash
bash lab.sh reset l1
bash grade.sh l1
```

Then edit:

- `app/models.py`

Keep checking until `bash grade.sh l1` passes.

### 4. Continue the full lab

After L1, move on to:

- `bash grade.sh l2` — service endpoint and timeout handling
- `bash grade.sh l3` — logging, request IDs, masking
- `bash grade.sh l4` — Git and Docker
- `bash grade.sh handover` — handover note

## Which path should a learner choose?

- Choose the **primer** if Pydantic still feels abstract or too busy.
- Choose the **full lab** if you already understand the idea and want the real implementation.
- Best flow for most learners: **primer first, full lab second**.

## Important files in the full lab

- `lab/L1-deep-dive.md` — guided walkthrough of the deep-dive L1 story
- `app/models.py` — the L1 contract learners eventually implement
- `app/main.py` — the L2 and L3 service code
- `tests/` — what `grade.sh` checks
- `SELF-PACED.md` — how to finish L3, L4 and handover

## One-line summary

The primer teaches **why** Pydantic helps. The full lab teaches **how that idea fits into a production-ready service**.
