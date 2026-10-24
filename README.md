# Session 3 lab: Python & Production Engineering

**From prototype to a service the platform team will run.**

**AI Forward Deployed Engineering · IIT Delhi × Varsity · Session 3 · Sat 24 Oct 2026**

Example Bank (fictional) has a complaint-triage prototype, `triage_prototype.py`. It works on a laptop.
The Head of Retail Ops wants it live; the Sr. Platform Engineer won't run a script; the CISO wants an
audit trail with no account numbers in the logs. You'll turn it into a typed, logged, containerised service.

## Start here: get your lab ready (5 minutes, before the session)

### Option A (recommended): GitHub Codespaces

Everything works here, including Git and Docker. Nothing to install on your laptop.

1. Sign in to GitHub (a free account is fine): https://github.com
2. On **this repository's** page, click the green **Use this template** button → **Create a new repository**.
   Give it any name and create it. This is **your own copy**: you can push branches and open pull requests in it.
   (Don't open a codespace on this page itself: you couldn't push your work.)
3. **In your copy**, click **Code** → **Codespaces** → **Create codespace on main**. The first start takes 2 to 3
   minutes.
4. In the terminal at the bottom, run:

   ```bash
   bash check_setup.sh
   ```

   You should see **All good. You are ready for the session.**
5. Then stop the codespace to save your free hours: github.com/codespaces → **⋯** → **Stop**. On the day, open it
   again from the same page.

Free allowance: GitHub Free includes 120 core-hours a month. A 2-core codespace uses 2 per hour, so you get about
60 hours. Delete the codespace when you've finished the self-paced work.

### Option B (if GitHub or Codespaces is blocked, common on company laptops): Google Colab

1. Open the notebook in Colab with a Google account:
   https://colab.research.google.com/github/sendtoshailesh/fde-s03-lab/blob/main/colab/s03_lab.ipynb
   (or download `colab/s03_lab.ipynb` from this repo and use File → Upload notebook in Colab).
2. **Runtime** → **Run all**. The first cells should run without errors.

Colab runs the same lab: the four live primers, then the four deep dives. You write no code. Two parts (Docker,
and opening `/docs` in a browser) need Codespaces, which you can do later from a personal device. Colab's
storage is temporary: File → Save a copy in Drive.

### Good to know

- No API key is needed: the lab has an offline model.
- Everything in the lab is fictional. Never paste real customer or company data into it.
- If `check_setup.sh` shows a ❌, post a screenshot in the session chat and we'll help you fix it.

## Choose your path

### Path A · Primers first (recommended if a topic feels abstract)

Start with `primer/README.md`, or follow the same sequence as the full lab:

1. `primer/l1-pydantic-mini/` — **L1 Contract**: why messy LLM output needs a contract
2. `primer/l2-async-fastapi-mini/` — **L2 Service**: async calls, timeouts and FastAPI
3. `primer/l3-observability-mini/` — **L3 Observability**: request IDs, masking and JSON audit logs
4. `primer/l4-ship-mini/` — **L4 Ship**: deliberate staging and Docker images a platform team accepts

These are short, concept-first warm-ups. The simplest learner flow is:

**L1 primer → L2 primer → L3 primer → L4 primer → full lab**

Then come back to this main lab once the idea lands.

### Path B · Full lab / deep dive

Use this when you want the full Session 3 experience: typed models, service endpoint, timeout handling,
logging, Git and Docker.

- Start here: `FULL-LAB.md`
- Guided L1 walkthrough: `lab/L1-deep-dive.md`
- Write-it-yourself checks: `bash grade.sh l1`, then `l2`, `l3`, `l4`

| Rung | When | You build | Check |
|---|---|---|---|
| **L1 Contract** | Live lab | Pydantic models; bad model output goes to a human | `bash grade.sh l1` |
| **L2 Service** | Live lab | FastAPI `/triage` (async, with a timeout) and `/healthz` | `bash grade.sh l2` |
| **L3 Observability** | Self-paced | One JSON log line per request, request ID, masked account numbers | `bash grade.sh l3` |
| **L4 Ship** | Self-paced | Git branch + PR; a Dockerfile the platform team would accept | `bash grade.sh l4` |
| **Handover** | Self-paced | `HANDOVER.md`, half a page for the Sr. Platform Engineer | `bash grade.sh handover` |

**Live lab:** **`lab/L1-live.md`** (L1 primer, ~8 min), then **`lab/L2-live.md`** (L2 primer: async, timeout, FastAPI, ~12–15 min), **`lab/L3-live.md`** (L3 primer: masked JSON logs, ~8 min) and **`lab/L4-live.md`** (L4 primer: Git staging and Docker, ~8–10 min, codespace only). Afterwards, at your own pace: **`lab/L1-deep-dive.md`**, then **`lab/L2-deep-dive.md`**, then **`lab/L3-deep-dive.md`**, then **`lab/L4-deep-dive.md`** (in a codespace: it needs Docker). Every step is one command; you write no code during the session.

**Short version:** run the primers in order for the concept path; use `FULL-LAB.md` for the deeper hands-on path.

## Quick cheat sheet

- **Reset a full-lab rung:** `bash lab.sh reset l1|l2|l3|l4`
- **Check your work:** `bash grade.sh l1|l2|l3|l4|handover|all`
- **Replay the guided deep-dive flow:** `bash lab.sh l1|l2|l3|l4 fail|check|show|apply|pass|try`
- **Primer mini-labs do not need reset:** just rerun `cd primer/<mini-lab> && bash run.sh all`

## Optional: a real model

Add a secret named `GEMINI_API_KEY` (Codespaces: github.com/settings/codespaces → Secrets; Colab: the 🔑 panel).
A free key is at https://aistudio.google.com/apikey. On free tiers, providers may use your prompts to improve
their products: use only the fictional data here. The grader always uses the offline stub.

## Files

| Path | What |
|---|---|
| `triage_prototype.py` | The "before". Run it: `python triage_prototype.py` |
| `app/models.py` | L1: the contract |
| `app/main.py` | L2: the service; L3: request logging |
| `app/logging_setup.py` | L3: JSON logs and masking |
| `app/llm.py` | The model client (offline stub + optional live model). No changes needed |
| `tests/` | What the grader checks |
| `Dockerfile` | L4b: works, but the platform team would refuse it. Fix it |
| `SELF-PACED.md` | Step-by-step guide for L3, L4 and the handover |
| `GLOSSARY.md` | One-page glossary for L1/L2/L3/L4 and lab terms |
| `primer/README.md` | Index of the short concept-first primers for L1, L2 and L3 |
| `primer/l1-pydantic-mini/` | Optional L1 primer: why Pydantic helps with LLM output |
| `primer/l2-async-fastapi-mini/` | Optional L2 primer: async, timeout and FastAPI |
| `primer/l3-observability-mini/` | Optional L3 primer: request IDs, masking and JSON audit logs |
| `primer/l4-ship-mini/` | Optional L4 primer: deliberate staging and Docker images the platform team accepts |
| `FULL-LAB.md` | How to use the existing lab as the deeper version after the primer |
| `HANDOVER.md` | Your handover note (template) |

## Stuck?

- `ModuleNotFoundError`: run `pip install -r requirements.txt`.
- Port 8000 already in use: stop the other `uvicorn` (Ctrl+C), or use `--port 8001`.
- `docker` not found in a codespace: Ctrl/Cmd + Shift + P → **Codespaces: Full Rebuild Container**.
- Company laptop blocks github.com: use Option B, or a personal device.
- Still stuck: post in the session chat with the exact error.
