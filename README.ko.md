# Editorial Quality Desk Skills

<p align="center">
  <strong>AI 기반 글쓰기와 편집을 위한 모듈형 품질 관리 시스템.</strong>
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

현재 버전은 완전한 컨트롤러 구조를 구축하고 첫 번째 기본 모듈을 포함합니다.

**Editorial Quality Control Spec v1.0**

---

## 이 프로젝트는 무엇인가

Editorial Quality Desk Skills는 AI 보조 글쓰기와 편집을 위한 모듈형 Skill 시스템입니다.

**이 Skill은 다국어 편집 프레임워크를 기반으로 하지만, 현재 이 프로젝트는 중국어 글쓰기 최적화를 주요 구현 목표로 합니다.**

이 Skill은 **컨트롤러 오케스트레이션**과 **실제 편집 규칙**을 분리합니다.

- `SKILL.md`: 컨트롤러, 활성화, 라우팅, 모듈 로딩, 우선순위, 충돌 처리, 검수.
- `references/spec-dsl.md`: AI 실행용 Editorial Quality Control v1.0 DSL.
- `references/spec-human.md`: 사람이 직접 읽을 수 있는 전체 규칙.
- `references/examples.md`: 좋은/나쁜 예시 라이브러리.
- `references/regression-cases.md`: 알려진 실패 사례와 회귀 방지 규칙.

`SKILL.md`는 의도적으로 간결하게 유지하며 모든 글쓰기 규칙을 주 파일에 넣지 않습니다. 향후 다른 글쓰기 하위 Skill을 추가할 때는 독립 모듈을 추가하고, 컨트롤러가 작업에 따라 로드 여부를 결정합니다.

---

## 설계 원칙

### 컨트롤러는 규칙 모음집이 아니다

`SKILL.md`는 다음을 담당합니다.

- 언제 활성화할지
- 작업 라우팅
- 모듈 로딩
- 실행 순서
- 우선순위
- 충돌 처리
- 검수
- 종료 조건

실제 편집 및 글쓰기 규칙은 독립 모듈에 둡니다.

### 점진적 로딩

현재 작업에 필요한 규칙만 로드하고, 모든 모듈을 매번 컨텍스트에 넣지 않습니다.

### 먼저 보존하고, 그다음 다듬기

현재 기본 모듈의 우선순위는 다음과 같습니다.

1. 사실 보존
2. 원래 의미 보존
3. 논리 보존
4. 불확실성, 정도, 강조 보존
5. 저자 목소리
6. 명료성과 구체성
7. 구조와 정보 밀도
8. 문체 다듬기

### 최소 개입

다른 표현이 가능하다는 이유만으로 문장을 다시 쓰지 않습니다.

실질적인 개선이 있을 때만 수정합니다.

---

## 현재 모듈: Editorial Quality Control v1.0

포함 항목:

- 원래 의미와 사실 보존
- 논리 무결성
- 불확실성과 강조 보존
- 최소 개입
- 명료성과 구체성
- 정보 밀도
- 문단 구조
- 긴 문장 제어
- 자연스러운 문장 리듬
- 대조와 전환 표현
- 인위적인 “A가 아니라 B” 대립 방지
- 제목과 소제목 품질
- 지나치게 문학적인 제목 방지
- AI스러운 문체 점검
- 가짜 깊이와 공허한 추상 표현 방지
- 저자 목소리 보존
- 국소적 부작용 점검
- 전체 문서 재귀 검토
- 수정이 더 높은 우선순위를 손상시킬 경우 롤백

---

## 프로젝트 구조

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

사용 중인 AI 도구를 선택하세요. Editorial Quality Desk는 **Codex**를 주요 지원 환경으로 하며 **Claude Code**와도 호환됩니다.

> **모델 권장 사항**
>
> GPT-5.6 Terra High만으로도 이 Skill을 충분히 잘 실행할 수 있으며, 반드시 GPT-6.1을 사용할 필요는 없습니다.  
> 글쓰기와 편집에서는 추론 능력이 높다고 항상 더 좋은 문장이 나오는 것은 아닙니다. 중간급 모델이 어조, 리듬, 자연스러운 표현에 더 잘 맞는 경우도 있습니다.

## Codex

이 저장소를 Codex Plugin Marketplace로 추가합니다:

```bash
codex plugin marketplace add joyce5438/Editorial-Quality-Desk-Skills
```

### 업데이트

```bash
codex plugin marketplace upgrade editorial-quality-desk
```

## Claude Code

프로젝트 루트에서 실행합니다:

```bash
mkdir -p .claude/skills
git clone --depth 1 https://github.com/joyce5438/Editorial-Quality-Desk-Skills.git .claude/skills/editorial-quality-desk
```

### 업데이트

```bash
git -C .claude/skills/editorial-quality-desk pull --ff-only
```

설치 또는 업데이트 후에는 새 세션을 시작하세요.

---

# 사용 방법

다음 작업에 적합합니다.

- 글 편집
- 리라이팅
- 교정
- 문단 재구성
- AI스러운 표현 줄이기
- 제목과 소제목 개선
- 긴 문장 제어
- 대조와 전환 표현 점검
- 가독성을 높이면서 저자 목소리 보존

명시적으로 호출할 수도 있습니다.

```text
Use the Editorial Quality Desk skill to edit this article.
```

또는:

```text
Review this draft with Editorial Quality Control v1.0.
```

---

## 왜 DSL이 있는가

`references/spec-dsl.md`은 장식용 의사 코드가 아니라 편집 행동을 운영 가능한 형식으로 표현합니다.

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

주된 목적은 AI 편집에서 흔한 문제를 줄이는 것입니다. 한 문장이 더 좋아 보이더라도 원래 의미, 논리, 저자 목소리, 주변 문맥이 손상되는 상황을 방지합니다.

---

## 문서

- [사람이 읽는 규칙 `spec-human.md`](./references/spec-human.md)
- [AI 실행 DSL `spec-dsl.md`](./references/spec-dsl.md)
- [예시 라이브러리 `examples.md`](./references/examples.md)
- [회귀 사례 `regression-cases.md`](./references/regression-cases.md)

---

## 확장 가능한 구조

향후 다음과 같은 모듈을 추가할 수 있습니다.

- 음식 및 차·음료 글쓰기
- 여행 글쓰기
- 투자 글쓰기
- 제목 편집
- 장문 서사 구조
- 사실／의견 분리
- 특정 매체 스타일 모듈

`SKILL.md`가 작업에 따라 어떤 모듈을 로드할지 결정합니다.

---

## 호환성

현재 설계 대상:

- OpenAI Codex / Agent Skills
- Claude Code custom Skills

핵심 규칙은 가능한 한 provider-neutral하게 유지하여 특정 모델이나 플랫폼에 종속되지 않도록 합니다.

---

## 상태

**v1.0**

컨트롤러 구조와 Editorial Quality Control 기본 모듈은 현재 사용할 수 있습니다.

`examples.md`와 `regression-cases.md`는 인위적인 예시로 미리 채우기보다 실제 편집 사례를 통해 계속 축적하는 것을 원칙으로 합니다.

---

## 핵심 원칙

> **좋은 편집은 편집자가 얼마나 잘 쓰는지를 보여주는 것이 아니라, 글을 더 명확하게 만들어야 합니다.**

> **다시 쓸 수 있다고 해서 반드시 다시 써야 하는 것은 아닙니다.**

---

## 저자

**Austin**  
https://x.com/austinsayhi
