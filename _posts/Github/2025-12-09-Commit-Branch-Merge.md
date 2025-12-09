---
layout: post
title: "Commit / Branch / Merge"
date: 2025-12-09

---

## 개요

Commit, Branch, Merge는 Git의 3대 핵심 기능이다. 이들을 이해하면 효과적인 버전 관리가 가능하다.

## Commit (커밋)

### 커밋이란?
- 특정 시점의 프로젝트 스냅샷
- 변경사항의 논리적 단위
- 고유한 SHA-1 해시값으로 식별

### 커밋 만들기
```bash
# 파일을 스테이징
git add <파일명>

# 모든 변경사항 스테이징
git add .

# 커밋 생성
git commit -m "커밋 메시지"
```

### 좋은 커밋 메시지 작성법
```
feat: 사용자 로그인 기능 추가

- JWT 토큰 기반 인증 구현
- 로그인 폼 컴포넌트 작성
- 인증 상태 관리 추가
```

**규칙:**
- 제목: 50자 이내, 명령형으로 작성
- 본문: 무엇을, 왜 변경했는지 설명
- 커밋 타입 prefix 사용 (feat, fix, docs, refactor 등)

### 커밋 수정하기
```bash
# 마지막 커밋 수정
git commit --amend

# 커밋 메시지만 수정
git commit --amend -m "새 메시지"
```

## Branch (브랜치)

### 브랜치란?
- 독립적인 작업 공간
- 코드의 분기점
- 가볍고 빠른 Git의 핵심 기능

### 브랜치의 필요성
- 메인 코드를 건드리지 않고 새 기능 개발
- 여러 작업을 동시에 진행
- 실험적인 코드를 안전하게 테스트

### 브랜치 명령어
```bash
# 브랜치 목록 확인
git branch

# 새 브랜치 생성
git branch <브랜치명>

# 브랜치 전환
git checkout <브랜치명>

# 브랜치 생성 + 전환
git checkout -b <브랜치명>

# 브랜치 삭제
git branch -d <브랜치명>
```

### 브랜치 전략

#### Git Flow
```
main (배포)
  └── develop (개발)
       ├── feature/login (기능)
       ├── feature/signup (기능)
       └── hotfix/bug-123 (긴급 수정)
```

#### Github Flow (간단한 방식)
```
main
  ├── feature/new-ui
  └── fix/navigation-bug
```

### 브랜치 네이밍 컨벤션
- `feature/기능명`: 새로운 기능
- `fix/버그명`: 버그 수정
- `hotfix/긴급수정`: 긴급 수정
- `refactor/리팩토링내용`: 코드 개선
- `docs/문서명`: 문서 작업

## Merge (병합)

### 머지란?
- 서로 다른 브랜치의 변경사항을 합치는 작업
- 독립적으로 진행된 작업을 통합

### 머지 방법
```bash
# develop 브랜치에 feature 브랜치 병합
git checkout develop
git merge feature/login
```

### 머지 유형

#### Fast-Forward Merge
```
Before:
main:    A---B
              \
feature:       C---D

After:
main:    A---B---C---D
```
- 새로운 커밋 없이 포인터만 이동
- 커밋 히스토리가 일직선
- 간단하고 깔끔

#### 3-Way Merge
```
Before:
main:    A---B---C
              \
feature:       D---E

After:
main:    A---B---C---F (merge commit)
              \     /
feature:       D---E
```
- 새로운 병합 커밋 생성
- 브랜치 히스토리 보존
- 협업 시 변경사항 추적 용이

### Merge Conflict (병합 충돌)

#### 충돌이 발생하는 경우
- 같은 파일의 같은 부분을 다르게 수정
- Git이 자동으로 병합할 수 없는 상황

#### 충돌 해결 방법
```bash
# 1. 머지 시도 (충돌 발생)
git merge feature/branch

# 2. 충돌 파일 확인
git status

# 3. 충돌 표시 확인 및 수정
<<<<<<< HEAD
현재 브랜치의 내용
=======
병합하려는 브랜치의 내용
>>>>>>> feature/branch

# 4. 충돌 해결 후 스테이징
git add <파일명>

# 5. 병합 완료
git commit
```

### Rebase (대안적 병합 방법)
```bash
git rebase main
```
- 브랜치의 커밋을 다른 브랜치 위로 이동
- 일직선 히스토리 생성
- 깔끔하지만 히스토리 재작성

**주의:** 이미 푸시된 커밋은 rebase하지 말 것!

## 실전 워크플로우 예시

```bash
# 1. 새 기능 브랜치 생성
git checkout -b feature/user-profile

# 2. 작업 및 커밋
git add .
git commit -m "feat: 사용자 프로필 페이지 추가"

# 3. 원격 브랜치에 푸시
git push origin feature/user-profile

# 4. Pull Request 생성 (Github에서)

# 5. 코드 리뷰 및 승인 후 머지

# 6. 로컬 main 업데이트
git checkout main
git pull origin main

# 7. 완료된 브랜치 삭제
git branch -d feature/user-profile
```

## 결론

Commit, Branch, Merge는 Git의 핵심이다:
- **Commit**: 변경사항을 의미 있는 단위로 저장
- **Branch**: 독립적인 작업 공간 제공
- **Merge**: 분리된 작업을 통합

이 세 가지를 마스터하면 효율적인 협업이 가능하다.
