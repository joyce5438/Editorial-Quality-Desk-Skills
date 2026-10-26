# Editorial Quality Desk Skills

<p align="center">
  <strong>模块化的 AI 写作与编辑质量控制系統。</strong>
</p>

<p align="center">
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-111111">
  <img alt="Format" src="https://img.shields.io/badge/format-Agent%20Skill-111111">
  <img alt="Languages" src="https://img.shields.io/badge/docs-EN%20%7C%20繁中%20%7C%20简中%20%7C%20한국어-111111">
</p>

<p align="center">
  <a href="./README.md">English</a> ·
  <strong>简体中文</strong> ·
  <a href="./README.zh-CN.md">简体中文</a> ·
  <a href="./README.ko.md">한국어</a>
</p>

---

## 版本

**Editorial Quality Desk Skills v1.0**

当前版本建立了完整的主控架構，並包含第一个基礎模块：

**Editorial Quality Control Spec v1.0**

---

## 这个项目是什麼

Editorial Quality Desk Skills 是一套供 AI 協助写作与编辑使用的模块化 Skill 系統。

它把「主控調度」与「實際写作规则」拆開：

- `SKILL.md`：主控、啟動、路由、模块加载、优先级、衝突處理与验收。
- `references/spec-dsl.md`：給 AI 執行的 Editorial Quality Control v1.0 DSL。
- `references/spec-human.md`：人類可直接閱讀的完整規範。
- `references/examples.md`：正反案例庫。
- `references/regression-cases.md`：已知失敗案例与回歸防止规则。

`SKILL.md` 刻意維持精簡，不把所有写作规则塞進主檔。未來新增其他写作子技能時，只需要加入獨立模块，再由主控依任務決定是否加载。

---

## 設計原則

### 主控不是规则大全

`SKILL.md` 負責：

- 何時啟動
- 任務路由
- 模块加载
- 執行順序
- 优先级
- 衝突處理
- 验收
- 停止條件

真正的写作规则放在獨立模块中。

### 漸進加载

只加载当前任務需要的规则，不让所有模块每次都進入上下文。

### 先保留，再美化

当前的基礎模块優先順序为：

1. 事实完整
2. 原意保留
3. 逻辑完整
4. 不确定性、程度与重點保留
5. 作者语气
6. 清晰度与具体性
7. 结构与信息密度
8. 風格修飾

### 最低干預

只因为一句話「還有別種寫法」，不代表應該重寫。

只有存在實質改善時才修改。

---

## 当前模块：Editorial Quality Control v1.0

包含：

- 原意与事实保留
- 逻辑完整性
- 不确定性与重點保留
- 最低干預
- 清晰度与具体性
- 信息密度
- 段落结构
- 长句控制
- 自然句子節奏
- 对比与转折词
- 避免虛構「不是 A，而是 B」對立
- 标题与小标题质量
- 避免過度文青标题
- AI 味檢查
- 避免假深度与空泛抽象詞
- 作者语气保留
- 局部副作用檢查
- 全文递归复查
- 當修改破壞更高优先级時回滾

---

## 项目结构

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

本项目採用檔案系統式 Agent Skill。

以下指令區塊在 GitHub 頁面右上角会有原生「一鍵複製」按鈕。

## Codex：项目级安裝

在项目根目录執行：

```bash
mkdir -p .agents/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .agents/skills/editorial-quality-desk
```

安裝後：

```text
your-project/
└─ .agents/
   └─ skills/
      └─ editorial-quality-desk/
         ├─ SKILL.md
         └─ references/
```

### 更新

```bash
git -C .agents/skills/editorial-quality-desk pull --ff-only
```

---

## Claude Code：项目级安裝

在项目根目录執行：

```bash
mkdir -p .claude/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .claude/skills/editorial-quality-desk
```

安裝後：

```text
your-project/
└─ .claude/
   └─ skills/
      └─ editorial-quality-desk/
         ├─ SKILL.md
         └─ references/
```

### 更新

```bash
git -C .claude/skills/editorial-quality-desk pull --ff-only
```

---

## Claude Code：个人级安裝

让 Skill 可跨项目使用：

```bash
mkdir -p ~/.claude/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git ~/.claude/skills/editorial-quality-desk
```

### 更新

```bash
git -C ~/.claude/skills/editorial-quality-desk pull --ff-only
```

---

## 手動安裝

也可以直接下载整个 repository，放進對應的 Skill 目录。

**项目連結：**  
[joyce5438/Editorial-Quality-Desk-Skills](https://github.com/joyce5438/Editorial-Quality-Desk-Skills)

请保持 `SKILL.md` 与 `references/` 在同一个 Skill 目录內。

---

# 使用方式

適合下列任務：

- 编辑文章
- 改寫
- 校稿
- 重整段落
- 降低 AI 味
- 改善标题与小标题
- 控制长句
- 檢查对比与转折词
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

## 为什麼有 DSL

`references/spec-dsl.md` 不是裝飾性的偽程式碼，而是用操作型格式描述编辑行为：

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

它主要用來降低 AI 编辑常見的问题：局部句子看似變好，但原意、逻辑、语气或上下文反而被破壞。

---

## 文件

- [人類可讀規範 `spec-human.md`](./references/spec-human.md)
- [AI 執行 DSL `spec-dsl.md`](./references/spec-dsl.md)
- [案例庫 `examples.md`](./references/examples.md)
- [回歸案例 `regression-cases.md`](./references/regression-cases.md)

---

## 可扩展架構

未來可以新增：

- 飲食与品茗写作
- 旅遊写作
- 投資写作
- 标题编辑
- 長文敘事结构
- 事实／觀點分離
- 特定媒體風格模块

由 `SKILL.md` 依任務決定加载哪些模块。

---

## 兼容性

当前設計目標：

- OpenAI Codex / Agent Skills
- Claude Code custom Skills

核心规则盡量維持 provider-neutral，避免把內容綁死在單一模型或平台。

---

## 狀態

**v1.0**

主控架構与 Editorial Quality Control 基礎模块已可使用。

`examples.md` 与 `regression-cases.md` 会優先从真實编辑案例持續累積，而不是預先塞滿人工案例。

---

## 核心原則

> **好的编辑應該让文字更清楚，而不是让讀者看見编辑有多会寫。**

> **可以改，不代表應該改。**

---

## 作者

**Austin**  
https://x.com/austinsayhi
