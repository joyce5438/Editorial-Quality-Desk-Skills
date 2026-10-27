---
name: editorial-quality-desk
description: >
  Use for editing, rewriting, proofreading, restructuring, polishing, or reviewing
  editorial prose when semantic preservation, natural human style, clear headings,
  controlled sentence length, non-formulaic transitions, anti-AI-style checks,
  and recursive editorial quality control are required.
---

# Editorial Quality Desk

## Role

This file is the **controller and router** for the Editorial Quality Desk.

It does not contain the full writing rules.

Its responsibilities are to:

1. decide whether this skill should activate;
2. identify the task type;
3. load the minimum necessary editorial modules;
4. establish rule priority and conflict handling;
5. execute the editing workflow;
6. validate the result;
7. stop when only optional stylistic alternatives remain.

Detailed writing rules belong in referenced modules, not in this controller.

---

## 1. Activation

Activate this skill when the user asks to:

- edit an article, essay, review, feature, blog post, report prose, or long-form copy;
- rewrite prose while preserving meaning;
- proofread or polish editorial writing;
- remove AI-like phrasing;
- improve headings or subheadings;
- shorten or restructure long sentences;
- improve transitions or contrast logic;
- review writing quality without replacing the author's voice;
- enforce the Editorial Quality Control standard;
- apply any future module registered under this desk.

Do not activate merely because text is present.

Do not activate for:

- code;
- data tables;
- pure factual Q&A;
- translation with no editorial transformation;
- short wording fragments where full editorial review would be disproportionate;
- tasks governed by a more specific, higher-priority skill unless this desk is explicitly requested as an additional review layer.

---

## 2. Core architecture

The desk uses a controller-plus-modules architecture.

### Controller

`SKILL.md`

Handles:

- activation
- routing
- sequencing
- module selection
- conflict resolution
- acceptance criteria
- final review

### Current modules

`references/spec-dsl.md`

Primary machine-oriented execution rules for Editorial Quality Control v1.0.

`references/spec-human.md`

Human-readable reference. Use for explanation, documentation, and interpretation when needed. It is not the primary execution engine when `spec-dsl.md` is available.

`references/examples.md`

Example library. Use when a rule is ambiguous, when few-shot comparison would improve reliability, or when the user requests examples.

`references/regression-cases.md`

Known failure cases. Consult during final review whenever a task resembles a recorded failure mode.

### Future modules

Additional writing subskills may be registered under this desk.

Each future module should define:

- module name
- activation conditions
- scope
- hard constraints
- quality checks
- conflicts or dependencies
- output expectations

The controller should load only modules relevant to the current task.

---

## 3. Module-loading policy

### Required default

For substantive editorial editing:

1. read `references/spec-dsl.md`;
2. treat it as the primary execution specification;
3. consult `references/regression-cases.md` if the task matches a known failure pattern;
4. consult `references/examples.md` only when examples materially improve execution.

### Human documentation

Read `references/spec-human.md` when:

- the user asks how the rules work;
- a DSL rule requires interpretation;
- documentation or explanation is requested;
- a human-readable rationale is useful.

Do not load the human document merely to duplicate the DSL.

### Progressive disclosure

Do not load every future module by default.

Load the smallest set of modules capable of completing the task correctly.

---

## 4. Priority model

When modules or rules conflict, apply this order:

1. user intent and explicit task constraints;
2. factual integrity;
3. semantic fidelity;
4. logical integrity;
5. preservation of uncertainty, degree, and emphasis;
6. author voice;
7. clarity and readability;
8. structure and information density;
9. stylistic refinement.

A lower-priority improvement must never materially damage a higher-priority requirement.

If it does, reject or roll back that edit.

---

## 5. Editing workflow

### Phase A — Read

Read the complete source before making substantive edits whenever the full source is available.

Identify:

- purpose;
- intended reader;
- author voice;
- factual claims;
- argument structure;
- contrast relationships;
- uncertainty and degree;
- headings and paragraph boundaries.

### Phase B — Route

Determine which editorial modules apply.

For the current v1.0 baseline, substantive prose editing normally routes to:

`references/spec-dsl.md`

If future modules are applicable, load them in addition to the baseline only when their scope is relevant.

### Phase C — Protect

Lock high-priority invariants before editing:

- facts;
- meaning;
- logic;
- author intent;
- valid contrast;
- uncertainty;
- degree;
- emphasis.

### Phase D — Edit

Apply only material improvements.

Do not rewrite merely because an alternative wording exists.

Prefer the smallest edit that solves the identified problem.

### Phase E — Local validation

After each meaningful patch, inspect:

- previous sentence;
- edited sentence;
- next sentence;
- full paragraph.

Check for side effects.

### Phase F — Global validation

After a meaningful editing pass:

1. re-read the entire edited text;
2. re-run all applicable hard constraints;
3. re-run all applicable quality checks;
4. inspect relevant regression cases;
5. repair or roll back newly introduced weaknesses.

### Phase G — Stop

Stop when:

- no material editorial weakness remains; and
- remaining alternatives are merely stylistic preferences.

Do not continue polishing indefinitely.

---

## 6. Conflict handling

When two rules appear to conflict:

### Preserve meaning over elegance

If a cleaner sentence changes meaning, keep or restore the more accurate version.

### Preserve logic over variety

If avoiding a repeated transition damages the logical relationship, retain the correct transition.

### Preserve voice over generic polish

If removing AI-like phrasing also removes a real author trait, revise more narrowly.

### Preserve specificity over decorative language

If a poetic or abstract phrase obscures actual content, prefer concrete language.

### Preserve useful irregularity

Natural human writing does not require identical paragraph lengths, symmetric sentences, or three-item lists.

---

## 7. No-duplication rule

Do not copy the full contents of `spec-dsl.md` into this file.

Do not turn `SKILL.md` into a style guide.

When a writing rule becomes substantial enough to require detailed examples, exceptions, or maintenance, place it in a module and route to it from here.

---

## 8. Future module registration

When adding a new writing subskill, add a compact entry to this section.

Recommended format:

```text
MODULE: <module-name>
PATH: references/<module-file>.md
ACTIVATE_WHEN: <conditions>
DEPENDS_ON: <optional dependencies>
PRIORITY_NOTES: <conflict behavior>
```

Current registration:

```text
MODULE: editorial-quality-control
PATH: references/spec-dsl.md
ACTIVATE_WHEN: substantive prose editing, rewriting, polishing, or editorial review
DEPENDS_ON: none
PRIORITY_NOTES: baseline editorial quality and preservation layer
```

---

## 9. Examples and regression policy

### Examples

Examples are supporting evidence, not higher-priority rules.

If an example conflicts with a hard constraint, follow the hard constraint.

### Regression cases

Regression cases record errors that have already been identified and corrected.

When a new recurring failure is discovered:

1. record the bad pattern;
2. explain why it fails;
3. add the preferred correction or decision rule;
4. use it during later final reviews.

This creates a growing editorial memory without bloating the controller.

---

## 10. Output behavior

Unless the user requests commentary:

- return the edited artifact cleanly;
- do not narrate every internal check;
- do not expose chain-of-thought;
- do not append generic writing advice;
- do not add a summary that the source did not require.

If the user asks for a review instead of a rewrite, explain the findings without silently replacing the source.

If the user asks for both diagnosis and revision, separate them clearly.

---

## 11. Acceptance condition

The desk may finish only when all applicable high-priority constraints are preserved and no material editorial weakness remains.

The existence of another possible wording is not a reason to continue editing.

**Controller principle:** route precisely, edit minimally, validate globally.
