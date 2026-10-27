# Editorial Quality Desk Skills

<p align="center">
  <strong>模块化的 AI 写作与编辑质量控制系统。</strong>
</p>

<p align="center">
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-111111">
  <img alt="Format" src="https://img.shields.io/badge/format-Agent%20Skill-111111">
  <img alt="Languages" src="https://img.shields.io/badge/docs-EN%20%7C%20繁中%20%7C%20简中%20%7C%20한국어-111111">
</p>

<p align="center">
  <a href="./README.md">English</a> ·
  <a href="./README.zh-TW.md">繁體中文</a> ·
  <strong>简体中文</strong> ·
  <a href="./README.ko.md">한국어</a>
</p>

---

## 版本

**Editorial Quality Desk Skills v1.0**

当前版本建立了完整的主控架构，并包含第一个基础模块：

**Editorial Quality Control Spec v1.0**

---

## 这个项目是什么

Editorial Quality Desk Skills 是一套供 AI 辅助写作与编辑使用的模块化 Skill 系统。

**该技能采用跨语言编辑框架，但目前本项目仅以中文写作优化为目标进行实现。**

本技能将「主控调度」与「实际编写规则」分开：

- `SKILL.md`：主控、启动、路由、模块加载、优先级、冲突处理与验收。
- `references/spec-dsl.md`：供 AI 执行的 Editorial Quality Control v1.0 DSL。
- `references/spec-human.md`：人类可直接阅读的完整规范。
- `references/examples.md`：正反案例库。
- `references/regression-cases.md`：已知失败案例与回归防止规则。

`SKILL.md` 刻意保持精简，不把所有写作规则塞进主文件。未来新增其他写作子技能时，只需要加入独立模块，再由主控根据任务决定是否加载。

---

## 设计原则

### 主控不是规则大全

`SKILL.md` 负责：

- 何时启动
- 任务路由
- 模块加载
- 执行顺序
- 优先级
- 冲突处理
- 验收
- 停止条件

真正的编辑与写作规则放在独立模块中。

### 渐进加载

只加载当前任务所需的规则，不让所有模块每次都进入上下文。

### 先保留，再美化

当前基础模块的优先顺序为：

1. 事实完整
2. 原意保留
3. 逻辑完整
4. 不确定性、程度与重点保留
5. 作者语气
6. 清晰度与具体性
7. 结构与信息密度
8. 风格修饰

### 最低干预

只因为一句话「还有别种写法」，不代表应该重写。

只有存在实质改善时才修改。

---

## 当前模块：Editorial Quality Control v1.0

包含：

- 原意与事实保留
- 逻辑完整性
- 不确定性与重点保留
- 最低干预
- 清晰度与具体性
- 信息密度
- 段落结构
- 长句控制
- 自然句子节奏
- 对比与转折词
- 避免虚构「不是 A，而是 B」对立
- 标题与小标题质量
- 避免过度文艺化标题
- AI 味检查
- 避免假深度与空泛抽象词
- 作者语气保留
- 局部副作用检查
- 全文递归复查
- 当修改破坏更高优先级时回滚

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

# 安装

选择你使用的 AI 工具。Editorial Quality Desk 以 **Codex** 为主要支持环境，并兼容 **Claude Code**。

> **模型建议**
>
> GPT-5.6 Terra High 已能很好地执行本技能，不一定需要使用 GPT-6.1。  
> 写作与编辑任务并非推理能力越高越好；中等模型在语气、节奏与文字自然度上，有时反而更适合。

## Codex

在项目根目录执行：

```bash
mkdir -p .agents/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .agents/skills/editorial-quality-desk
```

### 更新

```bash
git -C .agents/skills/editorial-quality-desk pull --ff-only
```

## Claude Code

在项目根目录执行：

```bash
mkdir -p .claude/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .claude/skills/editorial-quality-desk
```

### 更新

```bash
git -C .claude/skills/editorial-quality-desk pull --ff-only
```

安装或更新完成后，请开启新的工作会话。

---

# 使用方式

适合下列任务：

- 编辑文章
- 改写
- 校稿
- 重整段落
- 降低 AI 味
- 改善标题与小标题
- 控制长句
- 检查对比与转折词
- 在改善可读性的同时保留作者声音

也可以明确指定：

```text
Use the Editorial Quality Desk skill to edit this article.
```

或：

```text
Review this draft with Editorial Quality Control v1.0.
```

---

## 为什么有 DSL

`references/spec-dsl.md` 不是装饰性的伪代码，而是用操作型格式描述编辑行为：

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

它主要用来降低 AI 编辑常见的问题：局部句子看似变好，但原意、逻辑、语气或上下文反而被破坏。

---

## 文件

- [人类可读规范 `spec-human.md`](./references/spec-human.md)
- [AI 执行 DSL `spec-dsl.md`](./references/spec-dsl.md)
- [案例库 `examples.md`](./references/examples.md)
- [回归案例 `regression-cases.md`](./references/regression-cases.md)

---

## 可扩展架构

未来可以新增：

- 饮食与品茗写作
- 旅游写作
- 投资写作
- 标题编辑
- 长文叙事结构
- 事实／观点分离
- 特定媒体风格模块

由 `SKILL.md` 根据任务决定加载哪些模块。

---

## 兼容性

当前设计目标：

- OpenAI Codex / Agent Skills
- Claude Code custom Skills

核心规则尽量保持 provider-neutral，避免把内容绑定在单一模型或平台。

---

## 状态

**v1.0**

主控架构与 Editorial Quality Control 基础模块已可使用。

`examples.md` 与 `regression-cases.md` 会优先从真实编辑案例持续累积，而不是预先塞满人工案例。

---

## 核心原则

> **好的编辑应该让文字更清楚，而不是让读者看见编辑有多会写。**

> **可以改，不代表应该改。**

---

## 作者

**Austin**  
https://x.com/austinsayhi
