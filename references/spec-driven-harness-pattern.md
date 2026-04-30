# Spec-driven harness pattern

Use this pattern when work is long-running, phase-based, cross-cutting, or still design-heavy.

## Why spec-driven harnesses exist

Some projects do not decompose cleanly into a flat feature list. They need:

- research before implementation
- explicit architecture direction
- staged execution
- long-lived context across many sessions

In those repos, the active spec becomes the control plane.

## Minimal pieces

- `specs/AGENTS.md`
- `specs/active/*.md`
- `docs/decisions/*.md` for stable decisions
- a repository-level readiness path
- a clean-state discipline

## What the active spec can replace

If actively maintained, the spec can replace:

- `feature_list.json`
- `progress.md`
- `session-handoff.md`

The spec becomes the answer to:

- what is the current phase
- what is done
- what is blocked
- what comes next
- what proof was collected

## What the active spec cannot replace

It does not replace:

- readiness checks
- verification commands
- repository hygiene
- governance reviews

Planning is not governance.

## Recommended structure

An active spec should include:

- goal
- scope
- phases
- task checkboxes
- risks
- verification path
- resume point

Stable design choices should move into `docs/decisions/NN-topic.md` once they stop being local to one spec.

## When not to use this pattern

Avoid spec-driven harnesses when:

- work is tiny and obvious
- the team will not maintain the spec
- there is no real phase structure
- a simple one-focus loop is enough
