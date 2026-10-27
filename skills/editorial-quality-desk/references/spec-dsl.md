# Editorial Quality Control Spec v1.0 — DSL Edition

> Purpose: operational instruction set for AI-assisted editing.  
> Design goal: preserve meaning first, improve only where material editorial gain exists, and recursively re-check the full text after each meaningful patch.

---

```text
::OBJECTIVE{editorial_quality|pri:HIGHEST_WITHIN_SKILL}

target:
produce clear, specific, natural, high-information-density writing
while preserving the author's original meaning, facts, logic,
argument structure, emphasis, uncertainty, emotional intensity,
and recognizable voice.

ACCEPT:
no material editorial weakness remains across all CHECK dimensions.

STOP:
when only optional stylistic alternatives remain.

BENCHMARK:
high-quality magazine editing |
professional nonfiction editing |
natural human-authored prose |
author-consistent editorial refinement

PRIORITY:
semantic_fidelity >
factual_integrity >
logical_integrity >
uncertainty_preservation >
emphasis_preservation >
author_voice >
clarity >
specificity >
information_density >
structure >
rhythm >
stylistic_polish
```

---

```text
::HARD_CONSTRAINT{semantic_fidelity|standard:strict}
::HARD_CONSTRAINT{factual_integrity|standard:strict}
::HARD_CONSTRAINT{logical_integrity|standard:strict}
::HARD_CONSTRAINT{uncertainty_preservation|standard:strict}
::HARD_CONSTRAINT{emphasis_preservation|standard:strict}
::HARD_CONSTRAINT{author_intent|standard:strict}

::QUALITY_CHECK{clarity|standard:high}
::QUALITY_CHECK{specificity|standard:high}
::QUALITY_CHECK{information_density|standard:high}
::QUALITY_CHECK{paragraph_structure|standard:clear_function}
::QUALITY_CHECK{sentence_length|standard:controlled}
::QUALITY_CHECK{sentence_rhythm|standard:natural_varied}
::QUALITY_CHECK{semantic_redundancy|standard:minimal}
::QUALITY_CHECK{transition|standard:natural_non_repetitive}
::QUALITY_CHECK{contrast_logic|standard:no_false_opposition}
::QUALITY_CHECK{heading_quality|standard:direct_specific}
::QUALITY_CHECK{heading_poetic_excess|standard:minimal}
::QUALITY_CHECK{heading_specificity|standard:high}
::QUALITY_CHECK{ai_voice|standard:minimal}
::QUALITY_CHECK{formulaic_structure|standard:minimal}
::QUALITY_CHECK{pseudo_depth|standard:none}
::QUALITY_CHECK{empty_abstraction|standard:minimal}
::QUALITY_CHECK{metaphorical_reframing|standard:no_unprompted_reframing}
::QUALITY_CHECK{forced_triplets|standard:none}
::QUALITY_CHECK{empty_adjectives|standard:minimal}
::QUALITY_CHECK{author_voice|standard:preserve}
::QUALITY_CHECK{overediting|standard:none}
::QUALITY_CHECK{cross_dimension_damage|standard:none}
```

---

```text
::CONSTRAINT{semantic_preservation|pri:critical}

[NEVER]
- alter factual meaning
- invent facts
- remove material facts
- alter the author's central claim
- convert speculation into fact
- convert uncertainty into certainty
- flatten degree differences
- remove necessary qualifications
- alter emphasis without justification
- replace author observation with editor opinion
- reorder arguments merely for stylistic neatness
- rewrite the author's reasoning style merely for polish
```

---

```text
::CONSTRAINT{logical_preservation|pri:critical}

[NEVER]
- convert contrast into causality
- convert causality into comparison
- convert sequence into logic
- convert parallel structure into hierarchy
- remove a valid A-B contrast
- create a contrast that did not exist
- introduce a conclusion unsupported by prior text
```

---

```text
::CONSTRAINT{minimum_intervention|pri:critical}

[IF]
sentence is already clear
AND precise
AND natural
AND logically correct
AND contextually functional
=> [KEEP]

[IF]
the only reason to edit is "another wording is possible"
=> [KEEP]

[IF]
edit adds stylistic novelty
BUT no material improvement
=> [REJECT_EDIT]

[IF]
edit makes the editor more visible
WITHOUT improving reader understanding
=> [REJECT_EDIT]

[PRINCIPLE]
ability_to_rewrite != reason_to_rewrite
```

---

```text
::CONSTRAINT{cross_dimension_integrity|pri:critical}

[IF]
improvement in one QUALITY_CHECK
causes material degradation in any HARD_CONSTRAINT
=> [ROLLBACK]

[IF]
improvement in one lower-priority dimension
causes material degradation in a higher-priority dimension
=> [ROLLBACK]

Examples:
clarity ↑ but semantic_precision ↓ => ROLLBACK
brevity ↑ but logical_integrity ↓ => ROLLBACK
heading_impact ↑ but factual_fidelity ↓ => ROLLBACK
ai_voice ↓ but author_voice ↓ => REVISE_OR_ROLLBACK
specificity ↑ but readability ↓ => REBALANCE
```

---

```text
::RULE{clarity}

[FOR_EACH_SENTENCE]
identify:
- subject
- action_or_state
- claim_type
- relation_to_previous_sentence

[IF]
subject is unclear
OR pronoun reference is ambiguous
=> [PATCH]

[IF]
logical step is missing
AND omission causes reader confusion
=> [ADD_MINIMUM_NECESSARY_LINK]

[IF]
explanation repeats obvious information
=> [REMOVE]

[IF]
sentence sounds complete
BUT communicates little concrete meaning
=> [REWRITE_FOR_CONTENT]
```

---

```text
::RULE{specificity}

[PREFER]
observable_detail
concrete_action
verifiable_fact
identifiable_difference
explicit_cause
specific_sensory_description
precise_comparison

[SCAN_FOR]
層次
氛圍
質感
體驗
儀式感
故事感
高級感
文化底蘊
獨特魅力
豐富
細膩
深刻
驚艷
完美
迷人
優雅

[IF]
abstract word has no concrete support
=> [PATCH_WITH_SPECIFIC_CONTENT]

[IF]
abstract word accurately summarizes already-established detail
=> [KEEP]
```

---

```text
::RULE{no_unprompted_metaphorical_reframing}

[IF]
source uses an explicit category, relation, function, role, hierarchy,
or other literal label
=> [PRESERVE_SEMANTIC_FUNCTION]

[NEVER]
replace a clear literal term with a metaphorical, narrative,
or abstract label merely for style

[RISKY_SUBSTITUTIONS]
特色菜 -> 主線
配菜 -> 配角
原因 -> 線索
功能 -> 角色
段落 -> 篇章
步驟 -> 路徑
分類 -> 拼圖
重點 -> 舞台中央

[ALLOW]
only if the source text or surrounding context
already establishes the same metaphorical frame

[TEST]
"Did the author establish this metaphor,
or did the editor invent it?"

[IF]
editor invented it
=> [RESTORE_LITERAL_TERM]

[PRINCIPLE]
clear literal classification >
editor-invented metaphor
```

---

```text
::RULE{information_density}

[FOR_EACH_PARAGRAPH]
assign primary function:
- new_information
- explanation
- observation
- comparison
- background
- argument_progression
- conclusion

[IF]
paragraph has no clear function
=> [RESTRUCTURE_OR_REMOVE]

[IF]
two adjacent sentences communicate same meaning
without emphasis function
=> [MERGE_OR_DELETE]

[IF]
paragraph-ending sentence only repeats prior content
=> [DELETE]

[IF]
summary adds new synthesis
=> [KEEP]
```

---

```text
::RULE{paragraph_structure}

[IF]
one paragraph performs multiple unrelated primary functions
=> [SPLIT]

[IF]
two adjacent paragraphs perform the same function
AND separation adds no value
=> [MERGE]

[NEVER]
force equal paragraph length

[NEVER]
create paragraph breaks only to simulate visual structure
```

---

```text
::RULE{sentence_length}

[SCAN_FOR]
multiple independent claims
multiple logical turns
stacked subordinate clauses
multiple exceptions
multiple parenthetical additions
excessive connector stacking

[IF]
sentence contains too many independent semantic units
=> [SPLIT_OR_RESTRUCTURE]

[HEURISTIC]
3+ commas
OR 2+ major logical turns
OR repeated 而/但/因此/同時/甚至/以及
=> [REVIEW]

[IMPORTANT]
heuristic != automatic split rule

[CHECK_AFTER_SPLIT]
- meaning preserved?
- subject preserved?
- logical relation preserved?
- emphasis preserved?
- rhythm still natural?

[IF] any answer = no
=> [ROLLBACK_OR_RESTRUCTURE]
```

---

```text
::RULE{sentence_rhythm}

[PREFER]
natural variation in sentence length

[SHORT_SENTENCE_USE]
emphasis
judgment
closure
rhythm_change

[LONG_SENTENCE_USE]
complex_relation
qualification
layered_observation

[SCAN_FOR]
uniform sentence lengths
repeated identical syntax
every paragraph ending with a summary line
repeated 首先/其次/此外/最後 structure

[IF]
pattern is mechanical
=> [PATCH]

[IF]
irregularity is natural and author-specific
=> [KEEP]
```

---

```text
::RULE{contrast}

[IF]
structure = 「不是 A，而是 B」
=> [TEST_A]

[TEST_A]
A is valid if at least one is true:
- likely reader assumption
- previously stated claim
- common interpretation
- real comparison target
- necessary misconception to clarify

[IF] A valid
=> [PRESERVE_A_B_RELATION]

[IF] A invalid
=> [DELETE_FALSE_OPPOSITION]
=> [STATE_B_DIRECTLY]

[WHEN_REPHRASING_VALID_CONTRAST]
allowed:
「不同於 A，B……」
「比起 A，B……」
「相較於 A，B……」
「A 偏向……；B 則……」
「A 強調……，B 更著重……」

[NEVER]
remove A only to avoid repetition

[NEVER]
convert valid contrast into causality, sequence, or simple parallelism
```

---

```text
::RULE{transition}

[SCAN]
adjacent sentences
adjacent paragraphs

[WATCHLIST]
然而
不過
但
因此
同時
此外
換句話說
更重要的是
值得注意的是
事實上
與此同時
有趣的是
從某種程度上說
某種意義上

[IF]
transition repeats unnecessarily
=> [PATCH]

[IF]
transition can be removed without semantic loss
=> [DELETE]

[IF]
alternative transition sounds less natural
=> [KEEP_ORIGINAL]

[NEVER]
vary transition merely for lexical variety
```

---

```text
::RULE{heading}

target:
tell the reader what the section actually says

[PRIORITY]
content >
observation >
conclusion >
style

[ALLOW]
complete sentence headings

[IF]
complete sentence is clearer than noun phrase
=> [KEEP_COMPLETE_SENTENCE]

[NEVER]
shorten a clear heading into a vague noun phrase merely for brevity

[IF]
heading could fit dozens of unrelated articles
=> [TOO_GENERIC]

[IF]
heading relies mainly on mood, metaphor, atmosphere, or abstraction
=> [TOO_POETIC]

[IF]
heading does not reveal section content
=> [REWRITE]
```

---

```text
::RULE{heading_poetic_excess}

[SCAN_FOR_PATTERNS]
一場……的旅行
時間留下的……
舌尖上的……
一碗……裡的溫柔
城市角落的……
在……裡遇見……
……與時間的對話
當……遇見……
一場關於……的想像
……與……的交會
與土地的對話

[IF]
pattern contains low information density
AND could apply to many unrelated articles
=> [REWRITE_SPECIFICALLY]

[TEST]
"Could this title fit 50 other articles?"

[IF] yes
=> [FAIL_HEADING_SPECIFICITY]
```

---

```text
::RULE{ai_voice}

[SCAN_FOR]
formulaic introductions
formulaic conclusions
balanced rhetorical pairs
artificial symmetry
generic summaries
forced profundity
decorative transitions
repeated sentence templates
over-polished rhythm
abstract praise without evidence
metaphor clusters
predictable three-part lists
moralizing final sentence

[IF] detected
=> [REWRITE_DIRECT_CONCRETE_CONTEXT_SPECIFIC]

[IF]
removal flattens real author personality
=> [ROLLBACK_OR_REBALANCE]
```

---

```text
::RULE{ai_opening}

[SCAN_FOR]
在……的世界裡……
隨著……的發展……
說到……，很多人首先想到……
如果你以為……那就錯了……
在這個……的時代……

[IF]
opening adds no necessary context
=> [DELETE_OR_REPLACE_WITH_DIRECT_ENTRY]

[IF]
opening carries real factual framing
=> [KEEP_OR_TIGHTEN]
```

---

```text
::RULE{ai_ending}

[SCAN_FOR]
或許這就是……的意義
這也再次證明……
最終，真正留下來的是……
不只是……更是……
值得我們重新思考……

[IF]
ending adds no new information or synthesis
=> [DELETE]

[IF]
ending is logically earned by the article
=> [KEEP]
```

---

```text
::RULE{pseudo_depth}

[IF]
sentence introduces abstract concepts
not established by preceding content
=> [DELETE_OR_GROUND]

[TEST]
"Is this conclusion derived from the article,
or does it merely sound profound?"

[IF]
merely sounds profound
=> [REMOVE]
```

---

```text
::RULE{over_explanation}

[IF]
sentence explains information already obvious to intended reader
=> [DELETE]

[IF]
term is unfamiliar
AND necessary for comprehension
AND likely to be misunderstood
=> [ADD_BRIEF_EXPLANATION]

[NEVER]
explain common concepts simply to make prose feel complete
```

---

```text
::RULE{semantic_redundancy}

[IF]
two expressions add no distinct information
=> [KEEP_STRONGER_ONE]

[IF]
next sentence only paraphrases previous sentence
=> [DELETE_OR_ADD_NEW_INFORMATION]

[IF]
repetition serves emphasis, rhythm, callback, or deliberate rhetoric
=> [KEEP]
```

---

```text
::RULE{forced_triplets}

[SCAN_FOR]
X、Y 與 Z
既 A，也 B，更 C
三項對稱並列
three-part rhetorical closure

[IF]
third item exists only for rhetorical completeness
=> [REMOVE]

[PRINCIPLE]
actual_information_count determines list length

[NEVER]
force 3-item structure
```

---

```text
::RULE{empty_adjectives}

[SCAN_FOR]
精緻
細膩
豐富
獨特
深刻
高級
驚艷
完美
迷人
有趣
優雅
舒服
特別
厲害

[IF]
adjective has no evidence or concrete description
=> [REMOVE_OR_SUPPORT]

[IF]
adjective accurately summarizes concrete evidence already given
=> [KEEP]
```

---

```text
::RULE{author_voice}

[DETECT]
author's baseline:
- directness
- sentence length
- level of formality
- degree of colloquial language
- judgment intensity
- humor_or_irony
- tolerance_for_abstraction
- preferred_rhythm

[EDIT]
improve clarity without normalizing personality

[NEVER]
convert all writing into:
magazine_prose_voice
advertising_voice
textbook_ai_voice
overly_polite_voice
luxury_brand_voice
generic_analytical_voice

[IF]
edited text could have been written by any generic AI
=> [FAIL_AUTHOR_VOICE]
```

---

```text
::RULE{local_side_effect_check}

[AFTER_EACH_MATERIAL_EDIT]
read:
previous_sentence
edited_sentence
next_sentence
entire_paragraph

[CHECK_FOR]
new repetition
broken logic
missing subject
ambiguous reference
rhythm disruption
repeated transition
voice mismatch
new false opposition
new abstraction
new unsupported claim

[IF] side effect detected
=> [PATCH_OR_ROLLBACK]
```

---

```text
::PRIORITY_MAP

P0_ABSOLUTE_PRESERVE:
- facts
- meaning
- logic
- argument
- author intent
- uncertainty
- degree
- key emphasis

P1_MUST_FIX:
- semantic error
- factual contradiction
- broken logic
- ambiguity
- misleading sentence
- unnecessary false contrast

P2_SHOULD_FIX:
- excessive sentence length
- semantic redundancy
- weak paragraph structure
- vague headings
- excessive abstraction
- transition repetition
- obvious AI voice

P3_REFINE_IF_MATERIAL:
- rhythm
- word choice
- punctuation
- phrasing
- stylistic polish

P4_USUALLY_KEEP:
- harmless personal phrasing
- intentional repetition
- natural irregularity
- author-specific habits
- colloquial texture
```

---

```text
::LOOP{editorial_self_review|trigger:on_completion}

[READ]
read entire edited text as one continuous piece

[COMPARE]
compare edited text against:
- original meaning
- original facts
- original logic
- original argument structure
- original uncertainty
- original emphasis
- author voice
- all HARD_CONSTRAINT dimensions
- all QUALITY_CHECK dimensions
- all CONSTRAINT rules

[IDENTIFY]
rank remaining weaknesses by impact

priority:
1. semantic_damage
2. factual_damage
3. logical_damage
4. uncertainty_damage
5. clarity_problem
6. false_contrast
7. structural_weakness
8. excessive_sentence_length
9. semantic_redundancy
10. ai_voice
11. heading_weakness
12. stylistic_polish

[PATCH]
patch only material weaknesses

[RECHECK_LOCAL]
previous_sentence
edited_sentence
next_sentence
entire_paragraph

[RECHECK_GLOBAL]
re-run ALL HARD_CONSTRAINT dimensions
re-run ALL QUALITY_CHECK dimensions
re-run ALL critical CONSTRAINT rules

[IF]
new weakness introduced
=> [PATCH_OR_ROLLBACK]
=> re-enter LOOP

[IF]
any material weakness remains
=> [PATCH]
=> re-enter LOOP

[IF]
only optional stylistic alternatives remain
=> [Ω]

[IF]
further editing would reduce:
semantic_fidelity
factual_integrity
logical_integrity
clarity
precision
naturalness
author_voice
=> [Ω]
```

---

```text
::FINAL_CHECK

[ ] semantic fidelity preserved
[ ] facts preserved
[ ] logic preserved
[ ] uncertainty preserved
[ ] degree and emphasis preserved
[ ] no invented claim
[ ] no false opposition
[ ] valid contrast preserved
[ ] 「不是 A，而是 B」 used only when A is real and necessary
[ ] transitions are functional and non-repetitive
[ ] no materially overlong sentence remains
[ ] split sentences preserve logic
[ ] sentence patterns are not mechanically repetitive
[ ] no forced triplets
[ ] no generic summary padding
[ ] no pseudo-depth
[ ] no forced moral conclusion
[ ] subheadings directly describe content
[ ] headings are not excessively poetic
[ ] headings are specific to this text
[ ] abstract adjectives have concrete support
[ ] explicit categories, relations, and functions were not reframed into invented metaphors
[ ] each paragraph has a clear primary function
[ ] no unnecessary semantic repetition
[ ] author voice remains recognizable
[ ] no cosmetic rewriting for its own sake
[ ] no cross-dimension damage
```

---

```text
::CORE_PRINCIPLE

Good editing should make the writing clearer,
not make the editor more visible.

::SECONDARY_PRINCIPLE

Can be rewritten != should be rewritten.

::TERMINATION

[IF]
no material weakness remains
=> [Ω]
```
