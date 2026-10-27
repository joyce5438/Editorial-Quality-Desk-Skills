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

当前版本建立了完整的主控架构，并包含一个主技能模块：

**Editorial Quality Control Spec v1.0**

---

## 这个项目是什么

Editorial Quality Desk Skills 是一套供 AI 辅助写作与编辑使用的模块化 Skill 系统。

**技能为跨语言编辑框架，目前本项目仅以中文写作优化为目标进行实现。**

本技能将“主控调度”与“实际编写规则”分开：

- `SKILL.md`：主控、启动、路由、模块加载、优先级、冲突处理与验收。
- `references/spec-dsl.md`：供 AI 执行的 Editorial Quality Control v1.0 DSL。
- `references/spec-human.md`：人类可直接阅读的完整规范。
- `references/examples.md`：正反案例库。
- `references/regression-cases.md`：已知失败案例与回归防止规则。

`SKILL.md` 刻意保持精简，不把所有写作规则塞进主文件。未来新增其他写作子技能时，只需加入独立模块，再由主控根据任务决定是否加载。

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

真正的编辑写作规则放在独立模块中。

### 渐进加载

只加载当前任务需要的规则，不让所有模块每次都进入上下文。

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

仅仅因为一句话“还有别种写法”，并不代表应该重写。只有存在实质改善时才修改。

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
- 避免虚构“不是 A，而是 B”对立
- 标题与小标题质量
- 避免过度文艺标题
- AI 味检查
- 避免假深度与空泛抽象词
- 作者语气保留
- 局部副作用检查
- 全文递归复查
- 当修改破坏更高优先级时回滚

---

## 安装

选择你使用的 AI 工具。Editorial Quality Desk 以 **Codex** 为主要支持环境，并兼容 **Claude Code**。

> **模型建议**
>
> GPT-5.6 Terra High 已能很好地执行本技能，不一定需要使用 GPT-6.1。  
> 写作与编辑任务并非推理能力越高越好；中等模型在语气、节奏与文字自然度上，有时反而更适合。

## Codex

将以下指令贴到 Codex 对话中：

```text
codex plugin marketplace add and install joyce5438/Editorial-Quality-Desk-Skills
```

### 更新

```text
codex plugin marketplace upgrade editorial-quality-desk
```

## Claude Code

将本项目加入 Claude Code Plugin Marketplace，然后安装技能：

```text
/plugin marketplace add joyce5438/Editorial-Quality-Desk-Skills
/plugin install editorial-quality-desk@editorial-quality-desk
```

### 更新

```text
/plugin marketplace update editorial-quality-desk
```

安装或更新完成后，请开启新的工作会话。

---

# 使用方式

适合下列任务：

- 撰写文章
- 改写文章
- 校稿文章
- 重整段落
- 降低 AI 味
- 改善标题与小标题
- 控制长句
- 检查对比与转折词
- 改善可读性的同时保留作者口吻

标准调用：

```text
Use Editorial Quality Desk.
```

自然语言简语：

```text
呼叫編輯。
```

也可以直接接上任务：

```text
呼叫編輯，檢查文章。
```

---
