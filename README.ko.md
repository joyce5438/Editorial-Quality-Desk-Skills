# Editorial Quality Desk Skills

<p align="center">
  <strong>AI 기반 글쓰기와 편집을 위한 모듈형 편집 품질 관리 시스템.</strong>
</p>

<p align="center">
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-111111">
  <img alt="Format" src="https://img.shields.io/badge/format-Agent%20Skill-111111">
  <img alt="Languages" src="https://img.shields.io/badge/docs-EN%20%7C%20繁中%20%7C%20简中%20%7C%20한국어-111111">
</p>

<p align="center">
  <a href="./README.md">English</a> ·
  <a href="./README.zh-TW.md">繁體中文</a> ·
  <a href="./README.zh-CN.md">简体中文</a> ·
  <strong>한국어</strong>
</p>

---

## 버전

**Editorial Quality Desk Skills v1.0**

현재 버전은 컨트롤러 구조와 첫 번째 기본 모듈을 제공합니다.

**Editorial Quality Control Spec v1.0**

---

## 프로젝트 개요

Editorial Quality Desk Skills는 AI 보조 글쓰기와 편집을 위한 모듈형 Skill 시스템입니다.

오케스트레이션과 실제 편집 규칙을 분리합니다.

- `SKILL.md` — 활성화, 라우팅, 모듈 로딩, 우선순위, 충돌 처리, 검수 흐름
- `references/spec-dsl.md` — AI 실행용 DSL
- `references/spec-human.md` — 사람이 읽을 수 있는 전체 규칙
- `references/examples.md` — 좋은/나쁜 예시 라이브러리
- `references/regression-cases.md` — 이미 수정한 실패 패턴의 재발 방지 사례

`SKILL.md`는 의도적으로 가볍게 유지합니다. 세부 글쓰기 규칙은 별도 모듈에 두고, 컨트롤러가 필요한 경우에만 불러옵니다.

---

## 설계 원칙

### 컨트롤러와 규칙 분리

`SKILL.md`는 다음을 담당합니다.

- 활성화 조건
- 작업 라우팅
- 모듈 선택
- 실행 순서
- 우선순위
- 충돌 처리
- 검수
- 종료 조건

세부 편집 규칙은 별도 모듈에서 관리합니다.

### 점진적 로딩

현재 작업에 필요한 모듈만 로드합니다.

### 보존이 먼저, 문체 다듬기는 나중

현재 기본 우선순위:

1. 사실 보존
2. 의미 보존
3. 논리 보존
4. 불확실성, 정도, 강조 보존
5. 저자 목소리
6. 명료성 및 구체성
7. 구조 및 정보 밀도
8. 스타일 다듬기

### 최소 개입

다른 표현이 가능하다는 이유만으로 문장을 다시 쓰지 않습니다.

실질적인 개선이 있을 때만 수정합니다.

---

## 현재 모듈 — Editorial Quality Control v1.0

주요 기능:

- 의미 및 사실 보존
- 논리 무결성
- 불확실성과 강조 보존
- 최소 개입
- 명료성과 구체성
- 정보 밀도
- 문단 구조
- 긴 문장 제어
- 자연스러운 문장 리듬
- 대조와 전환 표현 제어
- 인위적인 「A가 아니라 B」 대립 방지
- 제목과 소제목 품질
- 지나치게 문학적이거나 추상적인 제목 방지
- AI 특유의 문체 점검
- 가짜 깊이와 빈 추상어 제거
- 저자 목소리 보존
- 지역적 부작용 점검
- 전체 문서 재검토
- 상위 우선순위를 손상시키는 수정 롤백

---

## 저장소 구조

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

# 설치

GitHub의 코드 블록에는 기본 복사 버튼이 제공되므로 아래 명령을 한 번에 복사할 수 있습니다.

## Codex — 프로젝트 설치

프로젝트 루트에서:

```bash
mkdir -p .agents/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .agents/skills/editorial-quality-desk
```

업데이트:

```bash
git -C .agents/skills/editorial-quality-desk pull --ff-only
```

---

## Claude Code — 프로젝트 설치

프로젝트 루트에서:

```bash
mkdir -p .claude/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .claude/skills/editorial-quality-desk
```

업데이트:

```bash
git -C .claude/skills/editorial-quality-desk pull --ff-only
```

---

## Claude Code — 개인 설치

모든 프로젝트에서 사용할 개인 Skill:

```bash
mkdir -p ~/.claude/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git ~/.claude/skills/editorial-quality-desk
```

업데이트:

```bash
git -C ~/.claude/skills/editorial-quality-desk pull --ff-only
```

---

## 수동 설치

저장소 전체를 내려받아 적절한 Skill 디렉터리에 넣어도 됩니다.

**Repository:**  
[joyce5438/Editorial-Quality-Desk-Skills](https://github.com/joyce5438/Editorial-Quality-Desk-Skills)

`SKILL.md`와 `references/`는 같은 Skill 디렉터리 안에 유지해야 합니다.

---

# 사용

다음과 같은 작업에 적합합니다.

- 문서 편집
- 리라이팅
- 교정
- 문단 재구성
- AI스러운 표현 제거
- 제목/소제목 개선
- 긴 문장 제어
- 대조 및 전환 논리 검토
- 저자 목소리를 유지하면서 가독성 개선

명시적으로 호출할 수도 있습니다.

```text
Use the Editorial Quality Desk skill to edit this article.
```

또는:

```text
Review this draft with Editorial Quality Control v1.0.
```

---

## DSL을 사용하는 이유

`references/spec-dsl.md`은 장식용 의사 코드가 아니라 실제 편집 행동을 운영 가능한 구조로 표현합니다.

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

목표는 한 문장을 개선하면서 의미, 논리, 저자 목소리, 주변 문맥을 손상시키는 AI 편집 실패를 줄이는 것입니다.

---

## 문서

- [사람용 규칙 `spec-human.md`](./references/spec-human.md)
- [AI 실행 DSL `spec-dsl.md`](./references/spec-dsl.md)
- [예시 `examples.md`](./references/examples.md)
- [회귀 사례 `regression-cases.md`](./references/regression-cases.md)

---

## 확장 가능 구조

향후 다음과 같은 모듈을 추가할 수 있습니다.

- 음식 및 음료 글쓰기
- 여행 글쓰기
- 투자 글쓰기
- 헤드라인 편집
- 장문 내러티브 구조
- 사실/의견 분리
- 매체별 스타일 모듈

`SKILL.md`가 작업에 따라 필요한 모듈만 선택합니다.

---

## 호환성

현재 목표 플랫폼:

- OpenAI Codex / Agent Skills
- Claude Code custom Skills

핵심 편집 규칙은 가능한 한 특정 공급자에 종속되지 않도록 설계합니다.

---

## 상태

**v1.0**

컨트롤러 구조와 기본 Editorial Quality Control 모듈을 사용할 수 있습니다.

`examples.md`와 `regression-cases.md`는 인위적으로 채우기보다 실제 편집 사례를 통해 확장하는 것을 원칙으로 합니다.

---

## 핵심 원칙

> **좋은 편집은 편집자의 기술을 드러내는 것이 아니라 글을 더 명확하게 만들어야 합니다.**

> **다시 쓸 수 있다는 것이 다시 써야 한다는 뜻은 아닙니다.**

---

## 저자

**Austin**  
https://x.com/austinsayhi
