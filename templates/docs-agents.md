# Docs directory guide

This file defines how durable knowledge is organized inside `docs/`.

All scaffolded docs are written in English by default unless the user explicitly requests another language.

## Directory structure

```text
docs/
├── AGENTS.md
├── lessons/
│   └── NN-topic.md
├── features/
│   └── NN-topic.md
└── decisions/
    └── NN-topic.md
```

Use numbered `NN-` prefixes in each subdirectory so documents have a stable reading order.

## Core principle

Write for readers, not for the diff.

The reader may be:

- a future agent session
- a teammate unfamiliar with the codebase
- a future human reviewer

Describe what was done, why it matters, and what should be remembered. Do not turn docs into a low-value mirror of file paths and line numbers.

## Shared writing rules

1. Prefer module or responsibility names over exact file locations unless the file path itself is important.
2. Explain why a design or fix exists, not just what changed.
3. Keep code snippets short and only include them when they materially improve understanding.
4. Write normal prose as paragraphs. Do not hard-wrap every sentence into a separate line.
5. Keep documents understandable without requiring the reader to reconstruct the whole repo from code.

## File naming

Use this format:

- `NN-topic.md`

Examples:

- `00-session-recovery-lesson.md`
- `01-document-import-feature.md`
- `02-storage-strategy-decision.md`

Rules:

1. Use the next available `NN` value inside the target subdirectory.
2. Keep the topic short and kebab-case.
3. Do not reuse an old number for a different topic.

## Frontmatter

Every document should include YAML frontmatter:

```yaml
---
title: [Document title]
date: YYYY-MM-DD
modules:
  - [module]
tags:
  - [tag]
---
```

Fields:

- `title`: concise topic title
- `date`: creation or last major update date
- `modules`: affected modules or subsystems
- `tags`: searchable keywords

## `docs/lessons/`

Use this directory for:

- integration lessons
- debugging takeaways
- non-obvious implementation pitfalls
- experience summaries worth reusing

Recommended structure:

1. Background and motivation
2. Key steps
3. Pitfalls
4. References

Pitfall format:

- **Problem:** [symptom]
  - **Cause:** [root cause]
  - **Fix:** [resolution]

## `docs/features/`

Use this directory for:

- stable feature behavior
- user-facing or system-facing capability summaries
- explanations of how a subsystem is intended to behave

Recommended structure:

1. Purpose
2. Behavior
3. Constraints
4. Related plans

Feature docs should explain the behavior of the feature, not the task list used to implement it.

## `docs/decisions/`

Use this directory for:

- durable architecture choices
- cross-spec constraints
- rejected alternatives
- product or implementation preferences that should remain true across future plans

Recommended structure:

1. Background
2. Decision
3. Why this path
4. Rejected options
5. Long-term impact

This directory is the preferred home for durable design decisions. Do not create a separate specs constitution folder unless the repository has a very specific reason to do so.

## Relationship to specs

`docs/` is not a replacement for `specs/`.

- `specs/` answers: what are we building now, in what phases, and what remains?
- `docs/` answers: what have we learned, what does the feature do, and what durable decision should future work inherit?

Use both systems deliberately:

- keep plans actionable in `specs/`
- keep reusable knowledge readable in `docs/`
