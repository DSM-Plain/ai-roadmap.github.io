# 3단계 계층 구조 가이드

## 폴더 구조 → 사이드바 매핑

이 프로젝트는 **폴더 구조가 자동으로 3단계 계층 사이드바로 변환**됩니다.

### 폴더 구조
```
_posts/
├── [1단계 - 메인 카테고리]/
│   ├── [2단계 - 서브 카테고리]/
│   │   └── [3단계 - 섹션]/
│   │       └── YYYY-MM-DD-파일명.md
```

### 사이드바 표시
```
▼ 1단계 (메인 카테고리)
  ▼ 2단계 (서브 카테고리)
    ▼ 3단계 (섹션)
      • 포스트 제목
```

## 현재 구조 예시

### Frontend 카테고리
```
_posts/frontend/
├── javascript/
│   ├── basics/
│   │   └── 2025-12-04-variables.md → "JavaScript 변수 선언"
│   └── advanced/
│       └── 2025-12-04-closures.md → "JavaScript 클로저 이해하기"
├── react/
│   └── hooks/
│       └── 2025-12-04-usestate.md → "React useState 훅"
└── css/
    └── layout/
        └── 2025-12-04-flexbox.md → "CSS Flexbox 레이아웃"
```

**사이드바 표시:**
```
▼ Frontend
  ▼ Javascript
    ▼ Basics
      • JavaScript 변수 선언 (let, const, var)
    ▼ Advanced
      • JavaScript 클로저 이해하기
  ▼ React
    ▼ Hooks
      • React useState 훅 사용법
  ▼ Css
    ▼ Layout
      • CSS Flexbox 레이아웃
```

### Backend 카테고리
```
_posts/backend/
├── nodejs/
│   └── express/
│       └── 2025-12-04-routing.md → "Express 라우팅 기초"
└── database/
    └── sql/
        └── 2025-12-04-basic-queries.md → "SQL 기본 쿼리"
```

**사이드바 표시:**
```
▼ Backend
  ▼ Nodejs
    ▼ Express
      • Express 라우팅 기초
  ▼ Database
    ▼ Sql
      • SQL 기본 쿼리
```

## 작동 원리

### 1. 자동 카테고리 생성 (Jekyll Plugin)
파일: `_plugins/auto_categories.rb`

```ruby
# _posts/frontend/javascript/basics/2025-12-04-variables.md
# → categories: ["frontend", "javascript", "basics"]
```

### 2. 계층적 사이드바 렌더링
파일: `_includes/toc-hierarchical.html`

- 모든 포스트의 categories 배열을 분석
- 1단계, 2단계, 3단계별로 그룹화
- 중첩된 `<ul>` 구조로 렌더링

### 3. 레이아웃 적용
파일: `_layouts/home.html`, `_layouts/post.html`, `_layouts/search-base.html`

모든 레이아웃에서 `toc-hierarchical.html`을 include

## 새 카테고리 추가 방법

### 1단계: 폴더 생성
```bash
# DevOps > Docker > Basics 카테고리 추가
mkdir -p _posts/devops/docker/basics
```

### 2단계: 포스트 작성
```bash
# 파일 생성
touch _posts/devops/docker/basics/2025-12-05-dockerfile.md
```

```yaml
---
title: Dockerfile 작성법
author: Your Name
date: 2025-12-05
layout: post
---

# Dockerfile이란?

내용 작성...
```

**⚠️ 중요:** `category` 또는 `categories` 필드를 front matter에 작성하지 마세요!
폴더 구조에서 자동으로 생성됩니다.

### 3단계: 빌드 및 확인
```bash
bundle exec jekyll build

# 로그에서 확인:
# Auto-categories: Dockerfile 작성법 => devops > docker > basics
```

### 4단계: 로컬 서버 실행
```bash
bundle exec jekyll serve

# http://localhost:4000/frontend-roadmap.github.io/
```

사이드바에 자동으로 추가됨:
```
▼ Devops
  ▼ Docker
    ▼ Basics
      • Dockerfile 작성법
```

## 사이드바 기능

### 접기/펼치기
- 각 카테고리를 클릭하면 하위 항목이 접히거나 펼쳐집니다
- 기본적으로 모든 카테고리가 펼쳐진 상태로 표시됩니다

### 현재 페이지 표시
- 현재 보고 있는 페이지는 파란색으로 강조됩니다
- 해당 페이지의 모든 상위 카테고리가 자동으로 펼쳐집니다

### TOC (Table of Contents)
- 포스트 내의 `h1`, `h2`, `h3` 헤딩이 자동으로 목차로 변환됩니다
- 현재 페이지의 사이드바 하단에 표시됩니다

## 파일 구조

```
frontend-roadmap.github.io/
├── _plugins/
│   └── auto_categories.rb          # 폴더 → categories 자동 변환
├── _includes/
│   └── toc-hierarchical.html       # 3단계 계층 사이드바
├── _layouts/
│   ├── home.html                   # 홈 레이아웃
│   ├── post.html                   # 포스트 레이아웃
│   └── search-base.html            # 검색 레이아웃
└── _posts/
    ├── backend/
    ├── docs/
    ├── frontend/
    └── learning/
```

## 제한사항

### ❌ Front matter에 category 작성 금지
```yaml
---
title: 제목
category: JavaScript    # ❌ 작성하지 마세요!
categories: [Frontend]  # ❌ 작성하지 마세요!
layout: post
---
```

### ✅ 폴더 구조만으로 관리
```
_posts/frontend/javascript/basics/파일.md  # ✅ 이것만으로 충분!
→ categories: ["frontend", "javascript", "basics"]
```

### 최대 깊이: 3단계
```
✅ _posts/1단계/2단계/3단계/파일.md       # OK
❌ _posts/1단계/2단계/3단계/4단계/파일.md # 4단계는 무시됨
```

## 트러블슈팅

### 사이드바에 포스트가 안 보여요
1. 파일명이 `YYYY-MM-DD-제목.md` 형식인지 확인
2. Front matter가 올바른지 확인 (title, date, layout)
3. 빌드 로그에서 `Auto-categories` 확인

### 계층이 잘못 표시돼요
1. 폴더 구조를 확인하세요
2. `bundle exec jekyll clean` 후 재빌드
3. 브라우저 캐시 삭제

### 플러그인이 작동하지 않아요
- GitHub Pages는 커스텀 플러그인을 지원하지 않습니다
- GitHub Actions를 사용해서 빌드해야 합니다
- 또는 로컬에서 빌드 후 `_site` 디렉토리를 배포하세요

## 예제 워크플로우

### 1. React 튜토리얼 시리즈 추가

```bash
# 폴더 생성
mkdir -p _posts/frontend/react/tutorial

# 포스트 작성
cat > _posts/frontend/react/tutorial/2025-12-05-getting-started.md << 'EOF'
---
title: React 시작하기
author: Your Name
date: 2025-12-05
layout: post
---

# React란?

React는 사용자 인터페이스를 만들기 위한 JavaScript 라이브러리입니다.
EOF

# 빌드
bundle exec jekyll build
```

**결과:**
```
Frontend > React > Tutorial > React 시작하기
```

### 2. 데이터베이스 카테고리 확장

```bash
# MongoDB 섹션 추가
mkdir -p _posts/backend/database/mongodb

# NoSQL 포스트 작성
cat > _posts/backend/database/mongodb/2025-12-05-intro.md << 'EOF'
---
title: MongoDB 소개
author: Your Name
date: 2025-12-05
layout: post
---

# MongoDB란?

NoSQL 데이터베이스...
EOF
```

**결과:**
```
Backend
├─ Database
│  ├─ Sql
│  │  └─ SQL 기본 쿼리
│  └─ Mongodb
│     └─ MongoDB 소개
```

## 요약

✅ **자동화**: 폴더만 만들면 카테고리 자동 생성
✅ **3단계 계층**: 체계적인 콘텐츠 구조
✅ **확장성**: 무한히 카테고리 추가 가능
✅ **직관적**: 폴더 구조 = 사이드바 구조

이제 프로젝트에 새로운 콘텐츠를 쉽게 추가하고 관리할 수 있습니다! 🎉
