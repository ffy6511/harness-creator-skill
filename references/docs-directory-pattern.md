# Docs directory pattern

Use this pattern when the repository needs durable knowledge capture alongside active specs.

## Core idea

`docs/` is the companion system to `specs/`.

- `specs/` pushes implementation.
- `docs/` preserves reusable knowledge.

## Recommended structure

```text
docs/
├── AGENTS.md
├── lessons/
├── features/
└── decisions/
```

Use numbered `NN-topic.md` filenames inside each subdirectory.

## Why this split works

It prevents three common problems:

1. Important implementation lessons dying inside archived plans.
2. Durable design decisions living only in one stale spec.
3. Feature explanations being mixed with task checklists.

## Document roles

### lessons

Capture:

- hard-won integration knowledge
- debugging lessons
- non-obvious pitfalls

### features

Capture:

- what a feature does
- how the intended flow works
- what constraints shape the behavior

### decisions

Capture:

- durable architecture choices
- rejected alternatives
- cross-spec constraints

In many repos, `docs/decisions/` is a better long-term home than a separate specs constitution folder.
