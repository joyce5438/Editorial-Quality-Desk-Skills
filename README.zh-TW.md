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

## 安裝

選擇你使用的 AI 工具。Editorial Quality Desk 以 **Codex** 為主要支援環境，並相容於 **Claude Code**。

> **模型建議**
>
> GPT-5.6 Terra High 已能很好地執行本技能，不一定需要使用 GPT-6.1。  
> 寫作與編輯任務並非推理能力越高越好；中等模型在語氣、節奏與文字自然度上，有時反而更適合。

## Codex

將以下指令貼到 Codex 對話中：

```text
codex plugin marketplace add and install joyce5438/Editorial-Quality-Desk-Skills
```

### 更新

```text
codex plugin marketplace upgrade editorial-quality-desk
```

## Claude Code

將本專案加入 Claude Code Plugin Marketplace，接著安裝技能：

```text
/plugin marketplace add joyce5438/Editorial-Quality-Desk-Skills
/plugin install editorial-quality-desk@editorial-quality-desk
```

### 更新

```text
/plugin marketplace update editorial-quality-desk
```

安裝或更新完成後，請開啟新的工作階段。

---

# 使用方式

標準呼叫：

```text
Use Editorial Quality Desk.
```

自然語言簡語：

```text
呼叫編輯。
```

也可以直接接上任務：

```text
呼叫編輯，檢查這篇文章。
```
