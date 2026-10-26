# Editorial Quality Desk Skills

A modular editorial-quality skill desk for AI-assisted writing and editing.

This repository separates **orchestration** from **editorial rules**:

- `SKILL.md` — routing, activation, module loading, execution order, conflict handling, and acceptance flow.
- `references/spec-dsl.md` — machine-oriented Editorial Quality Control Spec v1.0.
- `references/spec-human.md` — human-readable Editorial Quality Control Spec v1.0.
- `references/examples.md` — curated positive/negative examples. Initially a scaffold.
- `references/regression-cases.md` — cases used to prevent previously corrected failures from returning.

## Design principle

`SKILL.md` is the desk controller. It should stay lightweight and should **not** become a second copy of the writing rules.

Future writing/editing modules can be added under `references/` (or later split into dedicated module folders). The controller decides which modules are relevant to the task, loads only those modules, applies their priority rules, and performs final validation.

## Current module

**Editorial Quality Control v1.0**

Focuses on:

- semantic and factual preservation
- logical integrity
- minimum intervention
- clarity and specificity
- information density
- paragraph and sentence structure
- contrast and transition control
- heading quality
- anti-AI-style checks
- author-voice preservation
- recursive self-review and rollback

## Status

v1.0 foundation. The examples and regression libraries are intentionally extensible and will grow from real editing cases.
