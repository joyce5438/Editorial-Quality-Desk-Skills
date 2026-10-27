# Editorial Quality Desk Skills

<p align="center">
  <strong>모듈형 AI 글쓰기 및 편집 품질 관리 시스템.</strong>
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

현재 버전은 완전한 컨트롤러 구조를 구축하고 하나의 주요 Skill 모듈을 포함합니다.

**Editorial Quality Control Spec v1.0**

---

## 이 프로젝트는 무엇인가

Editorial Quality Desk Skills는 AI를 활용한 글쓰기와 편집을 위한 모듈형 Skill 시스템입니다.

**이 Skill은 다국어 편집 프레임워크이며, 현재 이 프로젝트는 중국어 글쓰기 최적화를 목표로 구현되어 있습니다.**

이 Skill은 “컨트롤러 및 라우팅”과 “실제 글쓰기·편집 규칙”을 분리합니다.

- `SKILL.md`: 컨트롤, 활성화, 라우팅, 모듈 로딩, 우선순위, 충돌 처리 및 검수.
- `references/spec-dsl.md`: AI 실행용 Editorial Quality Control v1.0 DSL.
- `references/spec-human.md`: 사람이 직접 읽을 수 있는 전체 규격.
- `references/examples.md`: 좋은 사례와 나쁜 사례 라이브러리.
- `references/regression-cases.md`: 알려진 실패 사례와 회귀 방지 규칙.

`SKILL.md`는 모든 글쓰기 규칙을 주 파일에 넣지 않고 의도적으로 간결하게 유지합니다. 향후 다른 글쓰기 하위 Skill을 추가할 때는 독립 모듈을 추가하고, 컨트롤러가 작업에 따라 로드 여부를 결정합니다.

---

## 설계 원칙

### 컨트롤러는 전체 규칙집이 아니다

`SKILL.md`가 담당하는 항목:

- 활성화 시점
- 작업 라우팅
- 모듈 로딩
- 실행 순서
- 우선순위
- 충돌 처리
- 검수
- 중지 조건

실제 글쓰기와 편집 규칙은 독립 모듈에 둡니다.

### 점진적 로딩

현재 작업에 필요한 규칙만 로드하고, 모든 모듈을 매번 컨텍스트에 넣지 않습니다.

### 먼저 보존하고, 그다음 다듬는다

현재 기본 모듈의 우선순위:

1. 사실의 완전성
2. 원래 의미 보존
3. 논리적 완전성
4. 불확실성, 정도, 강조점 보존
5. 저자 어조
6. 명확성과 구체성
7. 구조와 정보 밀도
8. 문체 다듬기

### 최소 개입

한 문장을 “다르게 쓸 수 있다”는 이유만으로 다시 써야 하는 것은 아닙니다. 실질적인 개선이 있을 때만 수정합니다.

---

## 현재 모듈: Editorial Quality Control v1.0

포함 항목:

- 원래 의미와 사실 보존
- 논리적 완전성
- 불확실성과 강조점 보존
- 최소 개입
- 명확성과 구체성
- 정보 밀도
- 문단 구조
- 긴 문장 제어
- 자연스러운 문장 리듬
- 대조와 전환 표현
- 허구의 “A가 아니라 B” 대립 방지
- 제목과 소제목 품질
- 지나치게 문학적인 제목 방지
- AI스러운 표현 점검
- 가짜 깊이와 공허한 추상 표현 방지
- 저자 어조 보존
- 국소적 부작용 점검
- 전체 글 재귀 검토
- 수정이 더 높은 우선순위를 훼손할 경우 롤백

---

## 설치

사용 중인 AI 도구를 선택하세요. Editorial Quality Desk는 **Codex**를 주요 지원 환경으로 하며 **Claude Code**와도 호환됩니다.

> **모델 권장 사항**
>
> GPT-5.6 Terra High만으로도 이 Skill을 충분히 잘 실행할 수 있으며, 반드시 GPT-6.1을 사용할 필요는 없습니다.  
> 글쓰기와 편집에서는 추론 능력이 높다고 항상 더 좋은 결과가 나오는 것은 아닙니다. 중간급 모델이 어조, 리듬, 자연스러운 표현에 더 잘 맞는 경우도 있습니다.

## Codex

다음 지시문을 Codex 대화창에 붙여 넣으세요:

```text
codex plugin marketplace add and install joyce5438/Editorial-Quality-Desk-Skills
```

### 업데이트

```text
codex plugin marketplace upgrade editorial-quality-desk
```

## Claude Code

이 프로젝트를 Claude Code Plugin Marketplace에 추가한 다음 Skill을 설치합니다:

```text
/plugin marketplace add joyce5438/Editorial-Quality-Desk-Skills
/plugin install editorial-quality-desk@editorial-quality-desk
```

### 업데이트

```text
/plugin marketplace update editorial-quality-desk
```

설치 또는 업데이트 후에는 새 세션을 시작하세요.

---

# 사용 방법

다음 작업에 적합합니다.

- 글 작성
- 글 리라이팅
- 글 교정
- 문단 재구성
- AI스러운 표현 줄이기
- 제목과 소제목 개선
- 긴 문장 제어
- 대조와 전환 표현 점검
- 가독성을 높이면서 저자의 말투 보존

표준 호출:

```text
Use Editorial Quality Desk.
```

자연어 단축 호출:

```text
Call editor.
```

작업을 바로 이어서 입력할 수도 있습니다:

```text
Call editor. Review the article.
```

---
