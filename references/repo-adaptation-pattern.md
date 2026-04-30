# Repo adaptation pattern

Use this pattern when the repository already has some harness structure and the task is to improve it instead of replacing it.

## Core rule

**Adapt before you scaffold.**

The first job is to discover the repo's current truth source and working model. A harness is already present if the repo uses any stable combination of:

- `AGENTS.md` or `CLAUDE.md`
- `specs/` with active plans and maintained phase checklists
- `docs/` with lessons, feature docs, or durable decisions
- `feature_list.json`
- `progress.md`
- an explicit readiness or verification path

## Detection checklist

1. Find instruction files.
2. Find the state source.
3. Find the readiness path.
4. Find the verification path.
5. Find the session continuity path.

Do not introduce a second state source unless the user explicitly wants a migration.

## Common repo shapes

### Spec-driven

Markers:

- `specs/AGENTS.md`
- `specs/active/*.md`
- `docs/decisions/*.md`
- phase checkboxes and acceptance criteria

Preferred adaptation:

- keep the active spec as the main status plane
- improve readiness, verification, or governance around it
- avoid adding `feature_list.json` by default

### Feature-list-driven

Markers:

- `feature_list.json`
- `progress.md`
- session handoff notes

Preferred adaptation:

- tighten definition of done
- improve evidence recording
- strengthen readiness and clean-state rules

### Minimal

Markers:

- only `AGENTS.md`
- a few startup notes
- weak or implicit verification

Preferred adaptation:

- add the smallest missing subsystem
- do not jump straight to a large planning stack

## Anti-patterns

- Forcing `feature_list.json` into a mature spec-driven repo
- Adding `progress.md` when the active spec already captures progress and resume state
- Adding `init.sh` when the repo only needs a small readiness checklist
- Creating two different definitions of done
