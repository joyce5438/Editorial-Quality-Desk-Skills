# Editorial Quality Desk Skills

<p align="center">
  <strong>A modular editorial-quality control desk for AI-assisted writing and editing.</strong>
</p>

<p align="center">
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-111111">
  <img alt="Format" src="https://img.shields.io/badge/format-Agent%20Skill-111111">
  <img alt="Languages" src="https://img.shields.io/badge/docs-EN%20%7C%20繁中%20%7C%20简中%20%7C%20한국어-111111">
</p>

<p align="center">
  <strong>English</strong> ·
  <a href="./README.zh-TW.md">繁體中文</a> ·
  <a href="./README.zh-CN.md">简体中文</a> ·
  <a href="./README.ko.md">한국어</a>
</p>

---

## Version

**Editorial Quality Desk Skills v1.0**

The current release establishes the controller architecture and the first baseline module:

**Editorial Quality Control Spec v1.0**

---

## What this project is

Editorial Quality Desk Skills is a modular skill system for AI-assisted editorial work.

It separates **orchestration** from **editorial rules**:

- `SKILL.md` acts as the desk controller.
- `references/spec-dsl.md` contains the machine-oriented execution rules.
- `references/spec-human.md` is the human-readable specification.
- `references/examples.md` stores curated positive and negative examples.
- `references/regression-cases.md` stores known failure patterns so corrected problems do not return.

The controller is intentionally kept separate from the detailed writing guidance. Future writing subskills can be added as independent modules and routed by `SKILL.md` only when relevant.

---

## Design principles

### Controller, not monolith

`SKILL.md` handles:

- activation
- routing
- module loading
- execution order
- priority
- conflict handling
- validation
- stopping conditions

It should **not** become a second copy of the editorial rules.

### Progressive disclosure

The desk loads only the modules needed for the current task instead of forcing every rule into context every time.

### Preserve before polishing

The current baseline prioritizes:

1. factual integrity
2. semantic fidelity
3. logical integrity
4. uncertainty, degree, and emphasis
5. author voice
6. clarity and specificity
7. structure and information density
8. stylistic refinement

### Minimum intervention

A sentence is not rewritten merely because another wording is possible.

The system should edit only when the change produces a material improvement.

---

## Current module — Editorial Quality Control v1.0

The first module focuses on:

- semantic and factual preservation
- logical integrity
- preservation of uncertainty and emphasis
- minimum intervention
- clarity and specificity
- information density
- paragraph structure
- sentence-length control
- natural sentence rhythm
- contrast and transition logic
- prevention of false 「不是 A，而是 B」 oppositions
- heading and subheading quality
- avoidance of overly literary or vague headings
- anti-AI-style checks
- removal of pseudo-depth and empty abstraction
- author-voice preservation
- local side-effect checks
- global recursive review
- rollback when an edit damages a higher-priority dimension

---

## Repository structure

```text
Editorial-Quality-Desk-Skills/
├─ README.md
├─ README.zh-TW.md
├─ README.zh-CN.md
├─ README.ko.md
├─ SKILL.md
└─ references/
   ├─ spec-dsl.md
   ├─ spec-human.md
   ├─ examples.md
   └─ regression-cases.md
```

---

# Installation

The repository is designed as a filesystem-based Agent Skill.

The examples below install the whole repository as one skill directory, so `SKILL.md` can continue to resolve its `references/` files without path changes.

## Codex — project-level installation

OpenAI documents repo-local skills under `.agents/skills/`.

From the root of your project:

```bash
mkdir -p .agents/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .agents/skills/editorial-quality-desk
```

After installation:

```text
your-project/
└─ .agents/
   └─ skills/
      └─ editorial-quality-desk/
         ├─ SKILL.md
         └─ references/
```

### Update

```bash
git -C .agents/skills/editorial-quality-desk pull --ff-only
```

> If your project already uses Git and you do not want a nested Git repository, install this repository as a submodule or copy the files into the same target directory instead.

---

## Claude Code — project-level installation

Claude Code discovers project skills under `.claude/skills/<skill-name>/`.

From the root of your project:

```bash
mkdir -p .claude/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .claude/skills/editorial-quality-desk
```

After installation:

```text
your-project/
└─ .claude/
   └─ skills/
      └─ editorial-quality-desk/
         ├─ SKILL.md
         └─ references/
```

### Update

```bash
git -C .claude/skills/editorial-quality-desk pull --ff-only
```

---

## Claude Code — personal installation

For a personal skill available across projects:

```bash
mkdir -p ~/.claude/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git ~/.claude/skills/editorial-quality-desk
```

### Update

```bash
git -C ~/.claude/skills/editorial-quality-desk pull --ff-only
```

---

## Manual installation

You can also download the repository and place the complete folder in the appropriate skill directory.

**Repository:**  
[joyce5438/Editorial-Quality-Desk-Skills](https://github.com/joyce5438/Editorial-Quality-Desk-Skills)

Keep `SKILL.md` and `references/` together.

---

# Usage

The desk is designed to activate for substantive editorial tasks such as:

- editing
- rewriting
- proofreading
- restructuring
- polishing
- removing AI-like phrasing
- improving headings
- controlling long sentences
- reviewing contrast and transition logic
- preserving author voice while improving readability

You can also explicitly request it:

```text
Use the Editorial Quality Desk skill to edit this article.
```

Or:

```text
Review this draft with Editorial Quality Control v1.0.
```

The controller decides which registered modules should be loaded.

---

## Why the DSL exists

`references/spec-dsl.md` is not intended as decorative pseudo-code.

It expresses editorial behavior in an operational form:

```text
OBJECTIVE
→ HARD CONSTRAINTS
→ QUALITY CHECKS
→ PATCH
→ LOCAL RECHECK
→ GLOBAL RECHECK
→ ROLLBACK IF NEEDED
→ STOP WHEN ONLY OPTIONAL STYLE ALTERNATIVES REMAIN
```

This structure is designed to reduce a common failure mode in AI editing: fixing one sentence while damaging meaning, logic, voice, or surrounding context.

---

## Human-readable specification

For editors, writers, maintainers, or anyone reviewing the rules directly:

[Read `references/spec-human.md`](./references/spec-human.md)

For AI execution:

[Read `references/spec-dsl.md`](./references/spec-dsl.md)

For examples:

[Read `references/examples.md`](./references/examples.md)

For known failure patterns:

[Read `references/regression-cases.md`](./references/regression-cases.md)

---

## Regression-driven improvement

When a recurring editing failure is discovered, it can be added to `regression-cases.md`.

A regression case records:

- the trigger
- the bad pattern
- why it fails
- the required behavior
- a preferred example
- related rules

This allows the desk to become more reliable over time without turning `SKILL.md` into an oversized instruction file.

---

## Extending the desk

Future modules can be added without redesigning the controller.

Example:

```text
MODULE: food-writing
PATH: references/food-writing.md
ACTIVATE_WHEN: food, restaurant, tasting, beverage, or culinary editorial work
DEPENDS_ON: editorial-quality-control
```

Possible future modules include:

- food and beverage writing
- travel writing
- investment writing
- headline editing
- long-form narrative structure
- fact/claim separation
- publication-specific style modules

The controller should load only the modules relevant to the task.

---

## Compatibility

This repository follows the common `SKILL.md` + supporting-files model used by modern Agent Skills.

It is currently structured for:

- OpenAI Codex / Agent Skills
- Claude Code custom Skills

Because both systems can load a `SKILL.md` and supporting files from a skill directory, the core editorial modules are kept provider-neutral wherever practical.

---

## Status

**v1.0**

The architecture and baseline Editorial Quality Control module are usable now.

`examples.md` and `regression-cases.md` are intentionally designed to grow from real editing cases rather than being filled with artificial examples in advance.

---

## Core principle

> **Good editing should make the writing clearer, not make the editor more visible.**

> **Can be rewritten ≠ should be rewritten.**
