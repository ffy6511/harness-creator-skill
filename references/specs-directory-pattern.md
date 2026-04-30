# Specs directory pattern

Use this pattern when the repository needs a strong execution workflow for active development.

## Core idea

`specs/` is for plans that move work forward, not for every kind of long-lived knowledge.

The strongest shape is usually:

```text
specs/
├── AGENTS.md
├── draft/
├── active/
└── archive/
```

Use numbered `NN-...-plan.md` filenames so plans have a stable sequence.

## What specs should do

Each active spec should answer:

- what problem is being solved
- what phase is active
- what tasks remain
- what counts as done
- where the next session resumes

## What specs should not do

Avoid turning `specs/` into the permanent home for:

- lessons learned
- feature-facing explanations
- durable cross-cutting decisions

Those belong in `docs/`.

## Strong reference shape

The strongest real-world `specs/AGENTS.md` files do more than list directories. They define:

- directory lifecycle
- naming rules
- plan structure
- status transitions
- what belongs in specs versus what should move elsewhere
