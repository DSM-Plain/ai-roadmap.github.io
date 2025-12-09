---
layout: post
title: "Pull Request란?"
date: 2025-12-09
---

## 개요

Pull Request(PR)는 Github의 핵심 협업 기능이다. 코드 리뷰와 협업을 위한 강력한 도구이다.

## Pull Request란?

### 정의
- 내 브랜치의 변경사항을 다른 브랜치에 병합해달라는 요청
- 코드 리뷰와 토론의 장
- 협업의 중심 도구

### 왜 PR을 사용하나?
- **코드 품질 보장**: 리뷰를 통한 버그 발견
- **지식 공유**: 팀원들이 변경사항 파악
- **논의의 장**: 구현 방식에 대한 토론
- **이력 관리**: 왜 이렇게 했는지 기록

## PR 생성 과정

### 1. 브랜치 작업
```bash
# 새 브랜치 생성 및 작업
git checkout -b feature/user-authentication
# ... 코드 작성 ...
git add .
git commit -m "feat: 사용자 인증 기능 추가"
```

### 2. 원격에 푸시
```bash
git push origin feature/user-authentication
```

### 3. Github에서 PR 생성
1. Github 저장소 페이지 접속
2. "Compare & pull request" 버튼 클릭
3. PR 정보 작성
4. "Create pull request" 클릭

## 좋은 PR 작성법

### PR 제목
```
feat: 사용자 로그인 및 회원가입 기능 구현
```
- 명확하고 간결하게
- 커밋 메시지 컨벤션 활용
- 한눈에 무엇을 했는지 파악 가능

### PR 설명 (Description)
```markdown
## 변경 사항
- JWT 기반 인증 시스템 구현
- 로그인/회원가입 API 엔드포인트 추가
- 사용자 인증 미들웨어 작성

## 테스트 방법
1. 회원가입: POST /api/auth/signup
2. 로그인: POST /api/auth/login
3. 인증 확인: GET /api/user/profile (토큰 필요)

## 스크린샷
![로그인 화면](이미지URL)

## 체크리스트
- [x] 테스트 작성 완료
- [x] 문서 업데이트
- [x] 코드 리뷰 준비 완료

## 관련 이슈
Closes #123
```

### PR 템플릿 활용
저장소에 `.github/pull_request_template.md` 파일 생성:
```markdown
## 변경 사항

## 테스트 방법

## 스크린샷 (필요시)

## 체크리스트
- [ ] 테스트 추가/수정
- [ ] 문서 업데이트
- [ ] 코드 리뷰 준비 완료
```

## PR 리뷰 프로세스

### 리뷰어 할당
- 적절한 리뷰어 지정
- 최소 1명 이상 권장
- 관련 코드의 전문가 포함

### 코드 리뷰
```markdown
# 리뷰 코멘트 예시

좋은 구현입니다! 한 가지 제안이 있습니다.

**제안:**
이 부분을 함수로 분리하면 재사용성이 높아질 것 같습니다.

**질문:**
이 로직에서 null 체크가 필요하지 않을까요?
```

### 리뷰 상태
- **Comment**: 일반 의견
- **Approve**: 승인, 병합 가능
- **Request changes**: 수정 요청

### 변경 요청 대응
```bash
# 로컬에서 수정
git add .
git commit -m "refactor: 리뷰 피드백 반영"
git push origin feature/user-authentication
```
- PR에 자동으로 반영됨
- 리뷰어에게 알림 전송

## PR 병합 방법

### Merge Commit
```
main: A---B---C-------M
            \         /
feature:     D---E---F
```
- 모든 커밋 히스토리 보존
- 병합 커밋 생성
- 브랜치 흐름 명확

### Squash and Merge
```
main: A---B---C---D'

feature의 D,E,F를 하나로 합침
```
- 여러 커밋을 하나로 압축
- 깔끔한 히스토리
- 작은 커밋들을 정리

### Rebase and Merge
```
main: A---B---C---D---E---F
```
- 일직선 히스토리
- 병합 커밋 없음
- 가장 깔끔하지만 주의 필요

## PR 자동화

### Draft PR
- 작업 중인 PR 표시
- 아직 리뷰 불필요
- 진행 상황 공유용

### 자동 체크
```yaml
# .github/workflows/pr-checks.yml
name: PR Checks
on: [pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - run: npm test
      - run: npm run lint
```

### PR 라벨 활용
- `bug`: 버그 수정
- `enhancement`: 기능 개선
- `documentation`: 문서 작업
- `help wanted`: 도움 필요

## PR 모범 사례

### 작은 PR 만들기
- 한 번에 하나의 주제만
- 리뷰하기 쉬운 크기
- 300줄 이하 권장

### 자주 커밋하기
- 논리적 단위로 커밋
- 커밋 메시지 명확히
- 리뷰 시 변경사항 추적 용이

### 테스트 포함
- 새 기능에는 테스트 추가
- 기존 테스트 통과 확인
- CI/CD 통과 확인

### 문서 업데이트
- README 수정
- API 문서 업데이트
- 주석 추가

## 오픈소스 기여 시 PR

### Fork & PR 워크플로우
```bash
# 1. 원본 저장소 Fork
# Github에서 Fork 버튼 클릭

# 2. Fork한 저장소 Clone
git clone https://github.com/내계정/프로젝트.git

# 3. Upstream 추가
git remote add upstream https://github.com/원본계정/프로젝트.git

# 4. 브랜치 생성 및 작업
git checkout -b fix/typo-in-readme

# 5. 커밋 및 푸시
git push origin fix/typo-in-readme

# 6. PR 생성
# Github에서 원본 저장소로 PR 생성
```

### 기여 가이드라인 확인
- CONTRIBUTING.md 읽기
- 코드 스타일 준수
- 커밋 메시지 규칙 따르기

## 결론

Pull Request는 단순한 코드 병합 도구가 아니다:
- 팀 협업의 핵심
- 코드 품질 향상
- 지식 공유의 장
- 프로젝트 히스토리 기록

좋은 PR을 만드는 습관이 좋은 개발자를 만든다.
