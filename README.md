# Editorial Quality Desk Skills

<p align="center">
  <strong>A modular quality-control system for AI-assisted writing and editing.</strong>
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

The current version establishes the complete controller architecture and includes the first baseline module:

**Editorial Quality Control Spec v1.0**

---

## What this project is

Editorial Quality Desk Skills is a modular Skill system for AI-assisted writing and editing.

**The skill is built on a cross-language editorial framework, but this project currently implements it with Chinese writing optimization as the primary target.**

The skill separates **controller orchestration** from **actual editorial rules**:

- `SKILL.md`: controller, activation, routing, module loading, priority, conflict handling, and acceptance.
- `references/spec-dsl.md`: the AI-executable Editorial Quality Control v1.0 DSL.
- `references/spec-human.md`: the complete human-readable specification.
- `references/examples.md`: positive and negative example library.
- `references/regression-cases.md`: known failure cases and regression-prevention rules.

`SKILL.md` is intentionally kept lean instead of becoming a container for every writing rule. Future writing subskills can be added as independent modules, with the controller deciding whether they should be loaded for a given task.

---

## Design principles

### The controller is not the rulebook

`SKILL.md` handles:

- activation timing
- task routing
- module loading
- execution order
- priority
- conflict handling
- acceptance
- stopping conditions

The actual editorial and writing rules live in independent modules.

### Progressive loading

Load only the rules required by the current task instead of forcing every module into context every time.

### Preserve first, polish second

The current baseline module uses this priority order:

1. factual integrity
2. preservation of original meaning
3. logical integrity
4. preservation of uncertainty, degree, and emphasis
5. author voice
6. clarity and specificity
7. structure and information density
8. stylistic refinement

### Minimum intervention

The existence of another possible wording is not, by itself, a reason to rewrite a sentence.

Edit only when there is a material improvement.

---

## Current module: Editorial Quality Control v1.0

Includes:

- preservation of meaning and facts
- logical integrity
- preservation of uncertainty and emphasis
- minimum intervention
- clarity and specificity
- information density
- paragraph structure
- long-sentence control
- natural sentence rhythm
- contrast and transition control
- prevention of invented “not A, but B” oppositions
- heading and subheading quality
- avoidance of overly literary headings
- AI-style detection
- avoidance of pseudo-depth and empty abstraction
- author-voice preservation
- local side-effect checks
- full-text recursive review
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

Choose the AI tool you use. Editorial Quality Desk primarily targets **Codex** and is also compatible with **Claude Code**.

> **Model recommendation**
>
> GPT-5.6 Terra High already runs this skill very well; GPT-6.1 is not required.  
> For writing and editing, stronger reasoning does not always produce better prose. Mid-tier models can sometimes be a better fit for tone, rhythm, and natural wording.

## Codex

Add this repository as a Codex plugin marketplace:

```bash
codex plugin marketplace add joyce5438/Editorial-Quality-Desk-Skills
```

### Update

```bash
codex plugin marketplace upgrade editorial-quality-desk
```

## Claude Code

Run from your project root:

```bash
mkdir -p .claude/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .claude/skills/editorial-quality-desk
```

### Update

```bash
git -C .claude/skills/editorial-quality-desk pull --ff-only
```

After installing or updating, start a new session.

---

# Usage

Suitable for tasks such as:

- article editing
- rewriting
- proofreading
- paragraph restructuring
- reducing AI-like phrasing
- improving headings and subheadings
- controlling long sentences
- checking contrast and transition logic
- preserving author voice while improving readability

You can also invoke it explicitly:

```text
Use the Editorial Quality Desk skill to edit this article.
```

Or:

```text
Review this draft with Editorial Quality Control v1.0.
```

---

## Why there is a DSL

`references/spec-dsl.md` is not decorative pseudo-code. It describes editorial behavior in an operational form:

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

Its main purpose is to reduce a common AI editing failure: a local sentence appears improved while meaning, logic, voice, or surrounding context is damaged.

---

## Documents

- [Human-readable specification `spec-human.md`](./references/spec-human.md)
- [AI execution DSL `spec-dsl.md`](./references/spec-dsl.md)
- [Example library `examples.md`](./references/examples.md)
- [Regression cases `regression-cases.md`](./references/regression-cases.md)

---

## Extensible architecture

Possible future modules include:

- food and beverage writing
- travel writing
- investment writing
- headline editing
- long-form narrative structure
- fact/opinion separation
- publication-specific style modules

`SKILL.md` decides which modules should be loaded for each task.

---

## Compatibility

Current design targets:

- OpenAI Codex / Agent Skills
- Claude Code custom Skills

Core rules are kept as provider-neutral as practical so the project is not tied to a single model or platform.

---

## Status

**v1.0**

The controller architecture and baseline Editorial Quality Control module are ready to use.

`examples.md` and `regression-cases.md` are intended to grow from real editorial cases instead of being pre-filled with artificial examples.

---

## Core principles

> **Good editing should make the writing clearer, not make the editor more visible.**

> **Can be rewritten ≠ should be rewritten.**

---

## Author

**Austin**  
https://x.com/austinsayhi
