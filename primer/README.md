# Session 3 primers: short concept-first versions

These primers are **small, separate warm-ups** for Session 3. Learners run commands and read output; they write no code.

Use them when a topic feels too busy in the full lab and you want the idea first.

## Pick the topic you need

### L1 · Contract and Pydantic

Why messy LLM output needs a contract before routing.

```bash
cd primer/l1-pydantic-mini
bash run.sh all
```

### L2 · Async, timeout and FastAPI

Why `await`, deadlines and request validation matter in a service.

```bash
cd primer/l2-async-fastapi-mini
bash run.sh async
bash run.sh timeout
bash run.sh api
```

Optional browser step:

```bash
bash run.sh serve
```

### L3 · Observability and safe audit logs

Why `print()` is not enough, why request IDs matter, and why masking must happen before logs are stored.

```bash
cd primer/l3-observability-mini
bash run.sh all
```

## Best learner flow

- Start with the primer for the topic that feels abstract.
- Then come back to the full lab in the repo root.
- The primers teach the **why**; the full lab teaches the **how in a real service**.
