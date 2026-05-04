# AGENTS.md

[One-sentence project purpose]

## Repository overview

```text
.
├── docs/                 # Durable knowledge: lessons, features, and long-lived decisions
├── specs/                # Active planning and execution context
├── ARCHITECTURE.md       # Detailed structure, module boundaries, and dependency flow
└── [other dirs]          # Add project-specific domains, apps, packages, or services here
```

Keep this section short. Summarize only the top-level directories and the most important control-point files so a new session can orient quickly.

Put the full directory tree, module responsibilities, and dependency flow in `ARCHITECTURE.md`.

If the repository structure changes, update both this summary and `ARCHITECTURE.md` in the same change.

## Startup workflow

Before writing code:

1. Confirm the working directory with `pwd`.
2. Read this file fully.
3. Read `ARCHITECTURE.md` if it exists.
4. Read the repo's current truth sources:
   - `specs/AGENTS.md` and active specs, if this repo is spec-driven.
   - `docs/AGENTS.md` and numbered docs, if this repo separates durable knowledge from active plans.
   - `feature_list.json` and `progress.md`, if this repo is feature-list-driven.
   - other repo-specific docs named here.
5. Run the standard readiness path:
   - `./init.sh`, or
   - the commands listed in `readiness-check.md`, or
   - the phase-0 checks in the active spec.
6. Review recent commits with `git log --oneline -5`.

If the readiness path is failing, repair that first before adding new scope.

## Working rules

- Preserve the existing harness shape if it is coherent.
- Keep exactly one current execution focus at a time.
- Do not claim done without running the required verification.
- Update the repo's current state source before ending the session.
- Leave a clean restart path for the next session.
- When directory structure changes, update the summary in this file and the detailed structure in `ARCHITECTURE.md` before closing the work.

## Professional conventions

### One source of truth per concern

Each kind of information should have one primary home. Do not maintain parallel status trackers, parallel decision logs, or duplicate feature descriptions unless the repository is explicitly migrating from one system to another.

If two files can disagree about the same question, the harness is already too weak.

### Keep the repository buildable from the repository itself

A new session should be able to recover the working flow from the repository, not from private memory or undocumented chat history. Startup steps, readiness checks, verification commands, and structural rules should all be discoverable from files in the repo.

If a human or agent must ask around before they can even verify the baseline, the repository is under-documented.

### Verification is mandatory, and broken builds are urgent

Do not treat verification as optional polish. Any change that claims to be complete must name the verification path that was actually run, and if the standard build or test path is already broken, fix that before stacking more scope on top.

The harness should optimize for trustworthy progress, not for optimistic status reports.

### Prefer small, self-contained changes

Keep changes narrow enough that their purpose is easy to explain and verify. Avoid mixing feature work, architectural refactoring, formatting churn, and incidental cleanup into one opaque batch unless the repository genuinely requires them to move together.

Small, well-bounded changes make both review and future agent recovery much more reliable.

### Separate planning from durable knowledge

Use planning artifacts to push current work forward, and use docs artifacts to preserve knowledge that should still matter after the current implementation slice ends. Do not bury reusable lessons, stable feature explanations, or long-lived decisions only inside active plans.

The point of this split is that active work changes quickly, but durable knowledge should remain readable and reusable.

### Record durable decisions explicitly

If a decision will shape multiple future features, specs, or refactors, write it down as a durable decision document instead of leaving it scattered across chats, commits, one plan file, or only inside `ARCHITECTURE.md`. Record both the chosen direction and the important alternatives that were rejected.

Future sessions should not have to rediscover the same architectural decision from scratch.

## State source

This repository uses **[choose one: active spec / feature_list.json / another file]** as the main status and scope tracker.

Do not create a second parallel state source unless the user explicitly wants a migration.

## Definition of done

Work is done only when all of the following are true:

- [ ] Target behavior is implemented.
- [ ] Required verification actually ran.
- [ ] Evidence is recorded in the main state source.
- [ ] The repository remains restartable from the standard readiness path.

## End of session

Before ending a session:

1. Update the main state source with current status.
2. Record unresolved blockers, risks, and next steps.
3. Keep temporary experiments or debug leftovers out of the main path.
4. Commit once the repo is in a safe, restartable state.

## Verification commands

```bash
# Replace with the repo's actual verification path
./init.sh
```

## Escalation

If you encounter:

- Architecture uncertainty: read `ARCHITECTURE.md` or the spec docs, then ask the user if needed.
- Scope ambiguity: re-read the current state source before expanding work.
- Repeated verification failure: record the blocker and stop stacking more changes.
