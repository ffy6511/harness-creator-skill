# ARCHITECTURE.md

[One-paragraph explanation of how the repository is organized and why the current structure exists.]

## Directory map

```text
.
├── docs/
│   ├── AGENTS.md
│   ├── lessons/
│   ├── features/
│   └── decisions/
├── specs/
│   ├── AGENTS.md
│   ├── draft/
│   ├── active/
│   └── archive/
└── [other dirs]
```

Document the repository structure with enough depth to explain module boundaries clearly. Use directory trees plus short inline comments after each directory entry.

Rules:

- Go deep enough to explain the real architecture, not just the top-level folders.
- Focus on directories, modules, services, packages, and ownership boundaries.
- Mention individual files only when they act as control points such as `AGENTS.md`, `README.md`, or a repo-wide config entrypoint.
- If the repository contains multiple apps, packages, or services, document each one separately instead of flattening them into one tree.

## Module responsibilities

Describe each major module, package, app, or service in a short paragraph.

For each one, explain:

- what it owns
- what it depends on
- what it should not own

If two modules have a boundary that is easy to violate, call that out explicitly.

## Dependency flow

Explain the important dependency directions in this repository.

Examples:

- frontend -> backend -> shared contracts
- CLI -> service client -> transport layer
- app packages -> core library -> infrastructure adapters

Document the intended direction, not every import edge.

## Control-plane documents

List the repository documents that control work and recovery.

Typical examples:

- `AGENTS.md` for startup rules and working discipline
- `specs/` for active plans
- `docs/` for durable knowledge
- `feature_list.json` or `progress.md` if this repo uses a lighter control plane

Make it clear which files answer:

- how to start work
- how to find current status
- how to understand long-term decisions

## Change management

When the repository structure changes:

1. Update this file in the same change.
2. Update the short structure summary in `AGENTS.md`.
3. Update any affected local guides such as `specs/AGENTS.md` or `docs/AGENTS.md`.

Do not leave directory moves or new subsystems undocumented.

## Open questions

Capture only real architectural uncertainties that matter to future work.

Do not turn this section into a backlog.
