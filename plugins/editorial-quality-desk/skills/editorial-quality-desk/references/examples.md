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

---

## Example: Remove an invented value judgment

### Context
A paragraph compares three regional beef soups by ingredients and preparation. No ranking by prestige or quality has been introduced.

### Original
> 這三種牛肉系湯飯的差別不在「哪一碗比較高級」。玄風處理膠質副產物，義城擅長雜碎的完整利用，羅州則把多個肉部位的清肉感與湯的層次分開安排。

### Preferred
> 玄風以牛皮下的膠質層為主角，義城充分利用牛頭與內臟，羅州則講究不同肉部位的處理與清湯層次。三地各自發展出不同的牛肉湯飯做法。

### Why
「哪一碗比較高級」是文章未提出的比較。直接寫出三地差異，資訊更集中；不要把虛構對立改寫成另一種對比句。

### Rules
- unnecessary defensive negation
- contrast logic
- information density
- minimum intervention

---

## Example: Keep a necessary evidence boundary

### Context
The article discusses whether chicken soup with rice can be identified as an established regional gukbap tradition. The available evidence is insufficient.

### Original — keep
> 這不是說雞肉不能進入湯飯，而是研究上應保留空白。若沒有持續的地方用語、老店師承或報導記錄，就不該為了湊齊豬、牛、雞、魚、海鮮的分類表，而把一般雞湯泡飯寫成地方湯飯。

### Why
The negation separates lack of evidence for an established regional tradition from a claim that chicken cannot be used. Removing it would weaken the research boundary. A scan hit is not an instruction to rewrite.

### Rules
- unnecessary defensive negation: keep valid qualification
- uncertainty preservation
- logical preservation
- minimum intervention

---

## Example: Keep a boundary between restaurant invention and local tradition

### Context
A Seoul restaurant introduces herbs and green vegetable oil into pork soup. The article distinguishes the restaurant's own innovation from a historical Bukchon tradition.

### Original — keep
> 這是都市融合的例子，但仍應說清楚它屬於店家創作，並不代表北村當地原本就有這種湯飯傳統。

### Why
The qualification protects a meaningful distinction between an individual restaurant's dish and a regionally inherited practice. It is not an invented rebuttal.

### Rules
- unnecessary defensive negation: keep valid distinction
- factual integrity
- contrast logic
