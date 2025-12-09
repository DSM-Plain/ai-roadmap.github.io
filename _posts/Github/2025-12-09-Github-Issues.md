---
layout: post
title: "Github Issues"
date: 2025-12-09
categories: [Github]
---

## 개요

Github Issues는 버그 추적, 작업 관리, 아이디어 제안을 위한 강력한 도구이다.

## Issues란?

### 정의
- 프로젝트의 작업 항목을 추적하는 시스템
- 버그, 기능 요청, 질문, 할 일 등을 관리
- 팀원 간 소통과 협업의 중심

### 언제 사용하나?
- 버그 발견 시
- 새 기능 제안
- 문서 개선 필요
- 질문이나 논의 주제
- 작업 계획 및 할 일

## Issue 생성하기

### 기본 Issue 작성
```markdown
Title: 로그인 시 토큰 만료 에러 발생

## 문제 설명
사용자가 로그인 후 1시간이 지나면 자동으로 로그아웃되지 않고
다음 요청에서 401 에러가 발생합니다.

## 재현 방법
1. 사용자 로그인
2. 1시간 대기
3. 페이지 새로고침 또는 API 요청
4. 401 Unauthorized 에러 발생

## 예상 동작
토큰 만료 시 자동으로 로그아웃되어야 함

## 실제 동작
에러 메시지만 표시되고 로그인 상태 유지됨

## 환경
- OS: macOS 14.0
- 브라우저: Chrome 120.0
- 앱 버전: v1.2.3

## 추가 정보
콘솔 에러 로그:
```
Error: Token expired at 2024-12-09T10:00:00Z
```

## Labels (라벨)

### 기본 라벨
```
bug           버그 수정
enhancement   기능 개선
documentation 문서 작업
question      질문
duplicate     중복 이슈
invalid       유효하지 않음
wontfix       수정하지 않음
```

### 커스텀 라벨 전략
```
# 우선순위
priority: critical   🔴
priority: high       🟠
priority: medium     🟡
priority: low        🟢

# 상태
status: in-progress  🔄
status: blocked      🚫
status: needs-review 👀

# 영역
area: frontend       💻
area: backend        🔧
area: database       🗄️
area: devops         ⚙️

# 난이도
difficulty: easy     ⭐
difficulty: medium   ⭐⭐
difficulty: hard     ⭐⭐⭐
```

### 라벨 활용
```
Issue #123
Labels: bug, priority: high, area: backend

→ 백엔드의 높은 우선순위 버그임을 한눈에 파악
```

## Assignees (담당자)

### 담당자 지정
```
Assignees: @developer-name

→ 누가 이 이슈를 해결할지 명확히
```

### 여러 담당자
```
Assignees:
  - @frontend-dev (UI 작업)
  - @backend-dev (API 수정)

→ 협업이 필요한 작업
```

## Milestones (마일스톤)

### 마일스톤 생성
```
Title: v2.0.0 Release
Due Date: 2025-01-31
Description: 메이저 업데이트 - 새로운 UI와 성능 개선
```

### Issue와 연결
```
Issue #45: 새로운 디자인 시스템 적용
Milestone: v2.0.0 Release

Issue #67: 데이터베이스 쿼리 최적화
Milestone: v2.0.0 Release

→ 진행률: 1/2 (50%)
```

## Issue 템플릿

### 버그 리포트 템플릿
```markdown
# .github/ISSUE_TEMPLATE/bug_report.md

---
name: 버그 리포트
about: 버그를 제보합니다
title: '[BUG] '
labels: bug
assignees: ''
---

## 버그 설명
버그에 대한 명확하고 간결한 설명

## 재현 방법
1. '...'로 이동
2. '...'를 클릭
3. '...'까지 스크롤
4. 에러 확인

## 예상 동작
무엇이 일어나야 하는지 설명

## 스크린샷
가능하다면 스크린샷 첨부

## 환경
- OS: [e.g. iOS]
- 브라우저: [e.g. chrome, safari]
- 버전: [e.g. 22]

## 추가 컨텍스트
기타 관련 정보
```

### 기능 요청 템플릿
```markdown
# .github/ISSUE_TEMPLATE/feature_request.md

---
name: 기능 요청
about: 새로운 기능을 제안합니다
title: '[FEATURE] '
labels: enhancement
assignees: ''
---

## 문제/동기
어떤 문제를 해결하거나 개선하고 싶은가요?

## 제안하는 해결책
원하는 기능에 대한 명확한 설명

## 대안
고려해본 대안이 있다면 설명

## 추가 컨텍스트
스크린샷, 레퍼런스 등
```

## Issue 참조 및 연결

### Issue 간 참조
```markdown
# Issue #45에서
이것은 #23과 관련이 있습니다
#67의 중복입니다
```

### 커밋에서 Issue 참조
```bash
git commit -m "fix: 로그인 버그 수정 #123"
```

### PR에서 Issue 자동 닫기
```markdown
# PR 설명에
Closes #123
Fixes #234
Resolves #345

→ PR 머지 시 자동으로 이슈들이 닫힘
```

## Issue 검색 및 필터링

### 기본 필터
```
is:open          열린 이슈만
is:closed        닫힌 이슈만
is:issue         이슈만 (PR 제외)
author:username  특정 작성자
assignee:username 특정 담당자
label:bug        특정 라벨
```

### 고급 검색
```
is:open label:bug sort:created-desc
→ 최신 순으로 정렬된 열린 버그들

is:issue assignee:@me is:open
→ 내가 담당한 열린 이슈들

is:closed milestone:"v2.0.0"
→ v2.0.0 마일스톤에서 완료된 이슈들

created:>2024-12-01
→ 12월 1일 이후 생성된 이슈들
```

### 저장된 필터
```
브라우저 북마크에 저장:
https://github.com/user/repo/issues?q=is:open+assignee:@me

→ 빠른 접근
```

## Issue 토론 및 협업

### 효과적인 코멘트
```markdown
# 진행 상황 업데이트
@team-lead 현재 디버깅 중입니다.
원인을 파악했고, 오늘 안에 수정 가능할 것 같습니다.

# 추가 정보 요청
@reporter 재현 단계에서 어떤 사용자 권한으로
로그인하셨는지 알 수 있을까요?

# 해결책 제안
이 문제는 두 가지 방법으로 해결할 수 있을 것 같습니다:
1. 토큰 갱신 로직 추가
2. 자동 로그아웃 구현

어떤 방향이 좋을까요? @team
```

### 멘션 활용
```markdown
@username        특정 사용자
@team/teamname   팀 전체
@organization    조직 전체
```

### 이모지 반응
```
👍 동의
👎 반대
😄 좋음
🎉 축하
😕 헷갈림
❤️  좋아요
🚀 출시
👀 확인중
```

## Task Lists (작업 목록)

### 체크리스트 생성
```markdown
## 할 일 목록
- [x] 버그 원인 파악
- [x] 수정 코드 작성
- [ ] 테스트 작성
- [ ] 문서 업데이트
- [ ] PR 생성

진행률: 2/5 완료
```

### 하위 이슈로 변환
```markdown
- [ ] 프론트엔드 수정 #234
- [ ] 백엔드 API 업데이트 #235
- [ ] 문서 작성 #236

→ 큰 작업을 여러 이슈로 분할
```

## Issue 자동화

### Github Actions 활용
```yaml
# .github/workflows/stale.yml
name: 'Close stale issues'
on:
  schedule:
    - cron: '0 0 * * *'

jobs:
  stale:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/stale@v5
        with:
          stale-issue-message: '30일간 활동이 없어 곧 닫힙니다.'
          close-issue-message: '닫혔습니다. 필요시 재오픈해주세요.'
          days-before-stale: 30
          days-before-close: 7
```

### 라벨 자동화
```yaml
# .github/workflows/label.yml
name: Auto Label
on: [issues]

jobs:
  label:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/labeler@v4
        with:
          repo-token: ${{ secrets.GITHUB_TOKEN }}
```

## Issue 관리 모범 사례

### 좋은 Issue 작성
✅ **명확한 제목**
```
❌ "버그"
✅ "로그인 시 토큰 만료 에러 발생"
```

✅ **재현 가능한 정보**
- 단계별 재현 방법
- 환경 정보
- 스크린샷/로그

✅ **적절한 라벨링**
- 우선순위 표시
- 카테고리 분류
- 담당자 지정

### Issue 관리
```
주기적으로:
- 오래된 이슈 정리
- 중복 이슈 통합
- 우선순위 재조정
- 진행 상황 업데이트
```

### 템플릿 활용
- 일관된 포맷
- 필수 정보 누락 방지
- 빠른 이슈 작성

## 실전 활용 예시

### 버그 추적
```
1. 사용자가 버그 발견
2. Issue 생성 (#123)
3. 개발자 확인 및 재현
4. 담당자 할당
5. 수정 커밋 (fix: bug #123)
6. PR 생성 (Closes #123)
7. 머지 후 이슈 자동 닫힘
```

### 기능 개발
```
1. 기능 제안 Issue (#200)
2. 팀 논의 및 승인
3. 마일스톤 할당 (v2.0.0)
4. 하위 이슈 생성
   - UI 디자인 #201
   - API 개발 #202
   - 테스트 작성 #203
5. 각각 작업 및 완료
6. 전체 완료 시 #200 닫기
```

## 결론

Github Issues는 프로젝트 관리의 핵심이다:
- 체계적인 작업 추적
- 투명한 커뮤니케이션
- 효율적인 협업

잘 관리된 Issues는 프로젝트의 건강성을 나타낸다.
