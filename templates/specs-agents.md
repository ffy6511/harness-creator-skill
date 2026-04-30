# Specs directory guide

This file defines how planning and implementation documents work inside `specs/`.

All scaffolded spec documents are written in English by default unless the user explicitly requests another language.

## Directory structure

```text
specs/
├── AGENTS.md
├── draft/
│   └── NN-topic-plan.md
├── active/
│   └── NN-topic-plan.md
└── archive/
    └── NN-topic-plan.md
```

Each `-plan.md` file contains the full planning package for that slice of work. Do not split one slice across separate "design" and "implementation" files unless the repository has a strong reason to do so.

Agent sessions should treat `specs/active/` as the main execution context.

## What belongs in specs

Use `specs/` for documents that actively move implementation forward:

- proposal and exploration drafts
- active execution plans
- archived completed or cancelled plans

`specs/` should answer:

- what problem is being solved
- what phase is active
- what tasks remain
- what counts as done
- what risks or blockers exist
- where the next session resumes

## What does not belong in specs

Do not use `specs/` as the long-term home for:

- reusable lessons
- feature-facing explanations
- durable cross-spec decisions

Those belong in `docs/`.

## Plan file naming

Use this format:

- `NN-topic-plan.md`

Examples:

- `00-public-demo-bootstrap-plan.md`
- `01-local-auth-and-storage-plan.md`

Rules:

1. Use an `NN-` numeric prefix that increments from the current directory contents.
2. Keep the topic short, concrete, and kebab-case.
3. Use the `-plan.md` suffix consistently.

## Required plan template

Every plan should follow this structure:

```markdown
# [Title]

## Metadata

| Field | Value |
| --- | --- |
| Created | YYYY-MM-DD |
| Scope | [services or modules affected] |
| Change type | feat / fix / refactor / docs / perf / test |
| Priority | P0 / P1 / P2 / P3 |
| Status | drafting / in-progress / review / completed / cancelled |

## Phases

- [ ] Phase 0: [phase name]
- [ ] Phase 1: [phase name]
- [ ] Phase 2: [phase name]

---

## Background

### Problem statement

[Describe the current problem.]

### Goal

[Describe the target outcome.]

### Key insights

[Optional but recommended if there is important design context.]

---

## Phase 0: [phase name]

### Goal

[Describe the phase goal.]

### Tasks

#### 0.1 [task name]

**Description:** [concrete task]

**Files involved:**

- `path/to/file` - [why this file matters]

**Acceptance criteria:**

- [ ] [criterion]
- [ ] [criterion]

---

## Risks and mitigations

| Risk | Impact | Mitigation |
| --- | --- | --- |
| [risk] | [impact] | [mitigation] |

---

## Summary

[Optional concise summary.]
```

## Status lifecycle

Plans move through these states:

| Status | Directory | Meaning |
| --- | --- | --- |
| `drafting` | `specs/draft/` | idea, research, or proposal not yet in execution |
| `in-progress` | `specs/active/` | active execution context |
| `review` | `specs/active/` | implementation complete, awaiting validation |
| `completed` | `specs/archive/` | finished and accepted |
| `cancelled` | `specs/archive/` | abandoned with reason recorded |

When archiving a plan, add a top-of-file status note such as:

```markdown
> **Status**: Completed (2026-05-01)
> **Archive reason**: Delivered and verified
```

or:

```markdown
> **Status**: Cancelled (2026-05-01)
> **Archive reason**: Replaced by a different approach
```

## Writing guidance

### Phase design

1. Keep each phase independently executable and verifiable.
2. Make dependencies between phases explicit.
3. Avoid oversized phases. A phase should be reviewable without scanning the whole repository.
4. Give each phase clear acceptance criteria.

### Task writing

1. Make each task concrete and actionable.
2. Name the relevant files or modules explicitly.
3. Write acceptance criteria that can be checked, not interpreted.

### Background writing

1. Start from the current system state, not just the desired change.
2. Explain why this work matters now.
3. Call out key design constraints early.

## Relationship to docs

`specs/` and `docs/` are complementary:

- `specs/` drives active execution.
- `docs/` captures durable knowledge.

When a design decision becomes durable beyond one plan, record it in `docs/decisions/`.
When a feature explanation or implementation lesson becomes reusable, record it in `docs/features/` or `docs/lessons/`.
