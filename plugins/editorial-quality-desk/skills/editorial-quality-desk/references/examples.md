# Examples

> Status: scaffold.  
> Purpose: store curated positive/negative examples that improve execution reliability without bloating `SKILL.md`.

---

## How to use this file

Add examples only when they clarify a rule better than another paragraph of abstract guidance.

Each example should include:

- context
- original text
- problem
- preferred edit
- why the edit is better
- rule(s) demonstrated

Recommended format:

```md
## Example: <short name>

### Context
...

### Original
> ...

### Problem
...

### Preferred
> ...

### Why
...

### Rules
- ...
```

---

## Example categories to build later

- valid contrast preserved
- false contrast removed
- long sentence split without losing logic
- heading made specific without becoming clickbait
- poetic heading rejected
- AI-style summary removed
- abstract adjective grounded in concrete detail
- author voice preserved despite cleanup
- repeated transitions simplified
- intentional repetition preserved
- three-part list reduced when the third item is filler
- paragraph split by function
- paragraph merge when separation is artificial

---

## Initial example

### Context

Food writing. The section describes how beef brisket changes the flavor of perilla-oil buckwheat noodles.

### Weak heading

> 肉汁與紫蘇的平衡

### Better heading

> 牛胸肉的肉汁讓紫蘇油蕎麥麵多了一層圓潤

### Why

The better heading states the actual observation instead of compressing the section into a generic noun phrase.

### Rules

- heading specificity
- complete-sentence subheadings are allowed
- content before style

---

## Example: Remove false contrast, keep grounded sensory language

### Context

Food writing. The original AI draft describes the mayonnaise salad and pickled radish served with fried chicken gizzards.

### AI draft

> 桌邊還會出現舊式炸雞店常見的美乃滋沙拉（케요네즈 사라다）與醃蘿蔔。它們不是陪襯：雞胗連吃幾口後，用冰涼脆口的蘿蔔換一口，下一塊才會重新聽見炸衣的聲音。

### Human revision

> 桌邊還會出現舊式炸雞店常見的美乃滋沙拉（케요네즈 사라다）與醃蘿蔔。雞胗連吃幾口後，用冰涼脆口的蘿蔔換一口味，下一塊重新聽見嘴裡酥脆炸衣的聲音。

### What changed

1. 「它們不是陪襯」 was removed because it creates a false opposition. The text had not established that the salad and radish were merely decorative or secondary.
2. The sensory sentence was retained and made more specific. 「嘴裡酥脆炸衣的聲音」 has concrete sensory grounding and directly describes the eating experience.
3. The revision did not remove figurative or vivid language merely because it was expressive.

### Why the human revision is better

The weak part of the AI draft is not the sensory phrasing itself. The problem is the invented rhetorical setup before it.

This distinction matters:

- unsupported rhetorical framing should be removed;
- grounded sensory language can remain when it is clear, specific, and relevant.

The goal is not to make prose flat. The goal is to remove artificial editorial framing while preserving useful human texture.

### Rules demonstrated

- contrast logic
- no false opposition
- specificity
- minimum intervention
- author voice preservation
- AI voice control
- preserve grounded sensory language

