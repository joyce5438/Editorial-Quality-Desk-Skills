# Regression Cases

> Purpose: record previously identified editorial failures so they do not reappear after later revisions.

Regression cases are not a replacement for the core specification. They are concrete tests for failure modes that have already occurred.

---

## How to add a regression case

Use this format:

```md
## REG-XXX — <name>

### Trigger
What kind of task or sentence causes the failure.

### Bad pattern
> ...

### Why it fails
...

### Required behavior
...

### Preferred example
> ...

### Related rules
- ...
```

---

## REG-001 — Invented contrast in food writing

### Trigger

A direct observation is rewritten into a rhetorical 「不是 A，而是 B」 structure even though A was never a real reader assumption or argument.

### Bad pattern

> 肉汁不是為了壓過紫蘇，而是替麵添一層圓潤。

### Why it fails

「壓過紫蘇」 is an invented opposition. The source observation only needs to describe what the meat juices contribute. Introducing A makes the sentence more rhetorical, less direct, and more AI-like.

### Required behavior

If A is not a real misconception, prior claim, common interpretation, or necessary comparison target:

1. delete A;
2. state B directly;
3. do not replace the false contrast with another artificial comparison.

### Preferred example

> 牛胸肉的肉汁讓紫蘇油蕎麥麵多了一層圓潤。

### Related rules

- minimum intervention
- contrast logic
- false opposition
- AI voice
- heading specificity

---

## REG-002 — Clear subheading compressed into a vague noun phrase

### Trigger

A complete-sentence subheading is shortened simply because headings are assumed to need to be short.

### Bad pattern

> 肉汁與紫蘇的平衡

### Why it fails

The phrase hides the actual point of the section. Brevity was improved, but information density and specificity were damaged.

### Required behavior

Allow a complete sentence when it communicates the section's concrete point more clearly.

### Preferred example

> 牛胸肉的肉汁讓紫蘇油蕎麥麵多了一層圓潤。

### Related rules

- heading quality
- heading specificity
- cross-dimension integrity
- minimum intervention

---

## REG-003 — Poetic heading with low information value

### Trigger

A heading is rewritten to sound literary or evocative even though the article is better served by a direct observation.

### Bad patterns

> 一碗麵裡的溫柔

> 味覺的另一種可能

> 味道與時間的對話

### Why it fails

These headings could be reused across many unrelated articles. They introduce mood without telling the reader what the section actually contains.

### Required behavior

Prefer content, observation, or conclusion over atmosphere and metaphor.

### Related rules

- heading poetic excess
- heading specificity
- empty abstraction
- AI voice

---

## REG-004 — Unprompted metaphorical reframing

### Trigger

A clear literal category, relation, function, role, or hierarchy term is rewritten as a more literary or narrative metaphor even though the source text did not establish that metaphorical frame.

### Bad pattern

> 這裡另一條主線是慶尚道風格的蔬菜燉雞（야채찜닭）。

### Why it fails

「特色菜」 is a clear category label. Replacing it with 「主線」 introduces a narrative metaphor that the source text did not establish.

The problem is not merely that 「主線」 sounds more literary. It changes the semantic function of the wording from classification to narrative framing, making the sentence less direct and more AI-like.

### Required behavior

When the source uses an explicit category, relation, function, role, or hierarchy term:

1. preserve its semantic function;
2. do not replace it with a metaphor merely to make the prose sound more polished;
3. allow metaphorical wording only when the source or surrounding context already establishes the same metaphorical system.

### Preferred example

> 這裡另一個特色菜是慶尚道風格的蔬菜燉雞（야채찜닭）。

### Related rules

- semantic fidelity
- specificity
- minimum intervention
- AI voice
- no unprompted metaphorical reframing
