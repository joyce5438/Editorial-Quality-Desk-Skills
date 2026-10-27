# Editorial Quality Desk Skills

<p align="center">
  <strong>A modular AI writing and editorial quality control system.</strong>
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

The current version establishes the complete controller architecture and includes one primary skill module:

**Editorial Quality Control Spec v1.0**

---

## What this project is

Editorial Quality Desk Skills is a modular Skill system for AI-assisted writing and editing.

**The skill is a cross-language editorial framework; this project is currently implemented with Chinese writing optimization as its target.**

The skill separates the “controller and routing” layer from the “actual writing and editing rules”:

- `SKILL.md`: controller, activation, routing, module loading, priorities, conflict handling, and acceptance.
- `references/spec-dsl.md`: Editorial Quality Control v1.0 DSL for AI execution.
- `references/spec-human.md`: complete human-readable specification.
- `references/examples.md`: positive and negative example library.
- `references/regression-cases.md`: known failure cases and regression-prevention rules.

`SKILL.md` is intentionally kept lean instead of containing every writing rule. Future writing subskills can be added as independent modules, and the controller decides whether to load them according to the task.

---

## Design principles

### The controller is not the complete rulebook

`SKILL.md` handles:

- when to activate
- task routing
- module loading
- execution order
- priorities
- conflict handling
- acceptance
- stopping conditions

The actual writing and editing rules live in independent modules.

### Progressive loading

Load only the rules needed for the current task instead of putting every module into context every time.

### Preserve first, polish second

The current foundational module uses this priority order:

1. factual integrity
2. preservation of original meaning
3. logical integrity
4. preservation of uncertainty, degree, and emphasis
5. author voice
6. clarity and specificity
7. structure and information density
8. stylistic refinement

### Minimum intervention

The fact that a sentence “could be written another way” does not mean it should be rewritten. Edit only when there is a material improvement.

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
- contrast and transitions
- avoiding invented “not A, but B” contrasts
- heading and subheading quality
- avoiding overly literary headings
- AI-style phrasing checks
- avoiding pseudo-depth and empty abstractions
- preservation of author voice
- local side-effect checks
- recursive full-text review
- rollback when an edit damages a higher-priority requirement

---

## Installation

Choose the AI tool you use. Editorial Quality Desk primarily supports **Codex** and is also compatible with **Claude Code**.

> **Model recommendation**
>
> GPT-5.6 Terra High already runs this skill very well; GPT-6.1 is not required.  
> For writing and editing tasks, stronger reasoning does not necessarily produce better results; mid-tier models can sometimes be a better fit for tone, rhythm, and natural wording.

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

Add this project to the Claude Code Plugin Marketplace, then install the skill:

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

Suitable for tasks such as:

- article writing
- article rewriting
- article proofreading
- paragraph restructuring
- reducing AI-like phrasing
- improving headings and subheadings
- controlling long sentences
- checking contrast and transitions
- improving readability while preserving the author's tone

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
Call editor. Review the article.
```

---
