# Editorial Quality Desk Skills

<p align="center">
  <strong>模組化的 AI 寫作與編輯品質控制系統。</strong>
</p>

<p align="center">
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-111111">
  <img alt="Format" src="https://img.shields.io/badge/format-Agent%20Skill-111111">
  <img alt="Languages" src="https://img.shields.io/badge/docs-EN%20%7C%20繁中%20%7C%20简中%20%7C%20한국어-111111">
</p>

<p align="center">
  <a href="./README.md">English</a> ·
  <strong>繁體中文</strong> ·
  <a href="./README.zh-CN.md">简体中文</a> ·
  <a href="./README.ko.md">한국어</a>
</p>

---

## 版本

**Editorial Quality Desk Skills v1.0**

目前版本建立了完整的主控架構，並包含第一個基礎模組：

**Editorial Quality Control Spec v1.0**

---

## 這個專案是什麼

Editorial Quality Desk Skills 是一套供 AI 協助寫作與編輯使用的模組化 Skill 系統。

**技能為跨語言編輯框架，但目前本專案我僅以中文寫作最佳化為目標實作。**

本技能把「主控調度」與「實際編寫規則」拆開：

- `SKILL.md`：主控、啟動、路由、模組載入、優先級、衝突處理與驗收。
- `references/spec-dsl.md`：給 AI 執行的 Editorial Quality Control v1.0 DSL。
- `references/spec-human.md`：人類可直接閱讀的完整規範。
- `references/examples.md`：正反案例庫。
- `references/regression-cases.md`：已知失敗案例與回歸防止規則。

`SKILL.md` 刻意維持精簡，不把所有寫作規則塞進主檔。未來新增其他寫作子技能時，只需要加入獨立模組，再由主控依任務決定是否載入。

---

## 設計原則

### 主控不是規則大全

`SKILL.md` 負責：

- 何時啟動
- 任務路由
- 模組載入
- 執行順序
- 優先級
- 衝突處理
- 驗收
- 停止條件

真正的編輯寫作規則放在獨立模組中。

### 漸進載入

只載入當下任務需要的規則，不讓所有模組每次都進入上下文。

### 先保留，再美化

目前的基礎模組優先順序為：

1. 事實完整
2. 原意保留
3. 邏輯完整
4. 不確定性、程度與重點保留
5. 作者語氣
6. 清晰度與具體性
7. 結構與資訊密度
8. 風格修飾

### 最低干預

只因為一句話「還有別種寫法」，不代表應該重寫。

只有存在實質改善時才修改。

---

## 目前模組：Editorial Quality Control v1.0

包含：

- 原意與事實保留
- 邏輯完整性
- 不確定性與重點保留
- 最低干預
- 清晰度與具體性
- 資訊密度
- 段落結構
- 長句控制
- 自然句子節奏
- 對比與轉換詞
- 避免虛構「不是 A，而是 B」對立
- 標題與小標題品質
- 避免過度文青標題
- AI 味檢查
- 避免假深度與空泛抽象詞
- 作者語氣保留
- 局部副作用檢查
- 全文遞迴複查
- 當修改破壞更高優先級時回滾

---

## 專案結構

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

# 安裝

選擇你使用的 AI 工具。Editorial Quality Desk 以 **Codex** 為主要支援環境，並相容於 **Claude Code**。

> **模型建議**
>
> GPT-5.6 Terra High 已能很好地執行本技能，不一定需要使用 GPT-6.1。  
> 寫作與編輯任務並非推理能力越高越好；中等模型在語氣、節奏與文字自然度上，有時反而更適合。

## Codex

在專案根目錄執行：

```bash
mkdir -p .agents/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .agents/skills/editorial-quality-desk
```

### 更新

```bash
git -C .agents/skills/editorial-quality-desk pull --ff-only
```

## Claude Code

在專案根目錄執行：

```bash
mkdir -p .claude/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .claude/skills/editorial-quality-desk
```

### 更新

```bash
git -C .claude/skills/editorial-quality-desk pull --ff-only
```

安裝或更新完成後，請開啟新的工作階段。

---

# 使用方式

適合下列任務：

- 編輯文章
- 改寫
- 校稿
- 重整段落
- 降低 AI 味
- 改善標題與小標題
- 控制長句
- 檢查對比與轉換詞
- 在改善可讀性的同時保留作者聲音

也可以明確指定：

```text
Use the Editorial Quality Desk skill to edit this article.
```

或：

```text
Review this draft with Editorial Quality Control v1.0.
```

---

## 為什麼有 DSL

`references/spec-dsl.md` 不是裝飾性的偽程式碼，而是用操作型格式描述編輯行為：

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

它主要用來降低 AI 編輯常見的問題：局部句子看似變好，但原意、邏輯、語氣或上下文反而被破壞。

---

## 文件

- [人類可讀規範 `spec-human.md`](./references/spec-human.md)
- [AI 執行 DSL `spec-dsl.md`](./references/spec-dsl.md)
- [案例庫 `examples.md`](./references/examples.md)
- [回歸案例 `regression-cases.md`](./references/regression-cases.md)

---

## 可擴充架構

未來可以新增：

- 飲食與品茗寫作
- 旅遊寫作
- 投資寫作
- 標題編輯
- 長文敘事結構
- 事實／觀點分離
- 特定媒體風格模組

由 `SKILL.md` 依任務決定載入哪些模組。

---

## 相容性

目前設計目標：

- OpenAI Codex / Agent Skills
- Claude Code custom Skills

核心規則盡量維持 provider-neutral，避免把內容綁死在單一模型或平台。

---

## 狀態

**v1.0**

主控架構與 Editorial Quality Control 基礎模組已可使用。

`examples.md` 與 `regression-cases.md` 會優先從真實編輯案例持續累積，而不是預先塞滿人工案例。

---

## 核心原則

> **好的編輯應該讓文字更清楚，而不是讓讀者看見編輯有多會寫。**

> **可以改，不代表應該改。**

---

## 作者

**Austin**  
https://x.com/austinsayhi
