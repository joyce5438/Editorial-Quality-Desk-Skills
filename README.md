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

Paste the following instruction into a Codex conversation:

```text
codex plugin marketplace add and install joyce5438/Editorial-Quality-Desk-Skills
```

### Update

```text
codex plugin marketplace upgrade editorial-quality-desk
```

## Claude Code

Add this repository as a Claude Code plugin marketplace, then install the plugin:

```text
/plugin marketplace add joyce5438/Editorial-Quality-Desk-Skills
/plugin install editorial-quality-desk@editorial-quality-desk
```

### Update

```text
/plugin marketplace update editorial-quality-desk
```

After installing or updating, start a new session.

---

# Usage

Standard invocation:

```text
Use Editorial Quality Desk.
```

Short natural-language invocation:

```text
Call editor.
```

You can also append the task directly:

```text
Call editor. Review this draft.
```
