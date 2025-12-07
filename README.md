---
layout: home
title: Plain 프론트 로드맵에 오신 것을 환영합니다~
permalink: /
---

# Frontend Roadmap 기여 가이드

프론트엔드 로드맵 프로젝트에 오신 것을 환영합니다! 이 가이드는 후배들이 쉽게 로드맵에 기여할 수 있도록 작성되었습니다.

## 프로젝트 구조

```
frontend-roadmap.github.io/
├── _config.yml           # Jekyll 설정 파일
├── _posts/              # 블로그 포스트 (계층적 폴더 구조, depth 제한 없음)
│   ├── frontend/        # 메인 카테고리
│   │   ├── javascript/  # 서브 카테고리
│   │   │   ├── basics/  # 하위 카테고리 (원하는 만큼 깊게 가능)
│   │   │   └── advanced/
│   │   ├── react/
│   │   └── css/
│   ├── backend/
│   ├── docs/
│   └── learning/
├── _plugins/            # Jekyll 플러그인
│   ├── auto_categories.rb  # 폴더 구조에서 자동으로 카테고리 생성
│   └── post_tree.rb        # 계층적 포스트 트리 생성
├── _includes/           # 재사용 가능한 HTML 조각
│   ├── toc-date.html    # 날짜별 목차 (사이드바)
│   └── toc-tree.html    # 계층적 트리 렌더링
├── _layouts/            # 페이지 레이아웃
└── assets/              # CSS, JS, 이미지 등
```

## 초기 세팅 확인

현재 프로젝트는 다음과 같이 설정되어 있습니다:

### Jekyll 설정 (_config.yml)
- **사이트 제목**: "Plain Frontend Roadmap"
- **설명**: GitBook 스타일의 프론트엔드 학습 페이지
- **테마**: jekyll-gitbook (원격 테마 사용)
- **URL**: https://dsm-plain.github.io/frontend-roadmap.github.io

### 주요 기능
- **자동 카테고리 생성**: 폴더 구조에서 자동으로 다단계 카테고리 생성 (`_plugins/auto_categories.rb`)
- **계층적 사이드바**: 폴더 구조를 계층적 트리로 표시, 섹션별 독립적인 펼치기/접기 지원 (`_plugins/post_tree.rb`)
- **사이드바에서 목차 자동 생성**: 각 포스트의 헤딩에서 목차 자동 생성
- **검색 기능**: 전체 포스트 검색
- **코드 하이라이팅**: 다양한 언어 문법 강조

## 새로운 콘텐츠 추가하기

### 1. 새 포스트 작성하기

`_posts/` 폴더 내에 **원하는 만큼 깊은 폴더 구조**를 만들고 마크다운 파일을 생성합니다. 파일명은 반드시 다음 형식을 따라야 합니다:

```
_posts/[카테고리]/[서브카테고리]/[하위카테고리]/.../YYYY-MM-DD-제목.md
```

예시:
- `_posts/frontend/javascript/basics/2025-12-04-variables.md`
- `_posts/backend/database/sql/advanced/2025-12-04-optimization.md`
- `_posts/frontend/react/hooks/custom/2025-12-04-useCustomHook.md`

**폴더 구조와 카테고리:**
- 폴더 구조가 자동으로 **다단계 카테고리**로 변환됩니다 (depth 제한 없음)
- `_posts/frontend/javascript/basics/파일.md` → categories: `[frontend, javascript, basics]`
- `_posts/a/b/c/d/파일.md` → categories: `[a, b, c, d]` (원하는 만큼 깊게 가능!)
- 사이드바에서 계층적으로 표시되며, 각 섹션을 독립적으로 펼치고 접을 수 있습니다

### 2. Front Matter 설정

모든 포스트는 상단에 YAML Front Matter가 필요합니다:

```yaml
---
title: JavaScript 변수 선언
author: 작성자 이름
date: 2025-12-04
layout: post
---
```

**Front Matter 필드 설명**:
- `title`: 포스트 제목 (사이드바에 표시됨)
- `author`: 작성자 이름
- `date`: 작성 날짜 (YYYY-MM-DD 형식)
- `layout`: `post`로 고정
- ⚠️ **`category` 또는 `categories` 필드는 작성하지 않습니다** - 폴더 구조에서 자동 생성됨 (`_plugins/auto_categories.rb`)

### 3. 콘텐츠 작성

Front Matter 아래에 마크다운 형식으로 콘텐츠를 작성합니다:

```markdown
---
title: React useState 훅
author: 홍길동
date: 2025-12-04
layout: post
---

# useState 훅이란?

React에서 상태를 관리하는 가장 기본적인 훅입니다.

## 기본 사용법

\```jsx
const [count, setCount] = useState(0);
\```

## 예제 코드

\```jsx
function Counter() {
  const [count, setCount] = useState(0);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>
        증가
      </button>
    </div>
  );
}
\```
```

**파일 위치**: `_posts/frontend/react/hooks/2025-12-04-usestate.md`

## 카테고리 관리

### 계층적 폴더 구조와 자동 카테고리

폴더 구조가 자동으로 카테고리로 변환되어 사이드바에 계층적으로 표시됩니다 (depth 제한 없음):

```
_posts/
├── frontend/              # 1단계: 메인 카테고리
│   ├── javascript/        # 2단계: 서브 카테고리
│   │   ├── basics/        # 3단계: 섹션
│   │   │   └── 2025-12-04-variables.md
│   │   └── advanced/
│   │       └── 2025-12-04-closures.md
│   ├── react/
│   │   └── hooks/
│   │       └── 2025-12-04-usestate.md
│   └── css/
│       └── layout/
│           └── 2025-12-04-flexbox.md
└── backend/
    ├── nodejs/
    │   └── express/
    │       └── 2025-12-04-routing.md
    └── database/
        └── sql/
            └── 2025-12-04-queries.md
```

**사이드바 표시 예상 결과:**
```
Frontend
├─ JavaScript
│  ├─ Basics
│  │  └─ JavaScript 변수 선언
│  └─ Advanced
│     └─ JavaScript 클로저 이해하기
├─ React
│  └─ Hooks
│     └─ React useState 훅
└─ CSS
   └─ Layout
      └─ CSS Flexbox 레이아웃

Backend
├─ Nodejs
│  └─ Express
│     └─ Express 라우팅 기초
└─ Database
   └─ SQL
      └─ SQL 기본 쿼리
```

### 새 카테고리 추가하기

새로운 폴더를 만들면 자동으로 카테고리가 생성됩니다:

```bash
# 새로운 계층 구조 만들기 (원하는 만큼 깊게 가능)
mkdir -p _posts/devops/docker/basics
mkdir -p _posts/frontend/react/advanced/optimization/memoization
```

그 안에 포스트를 작성하면:
- `_posts/devops/docker/basics/파일.md` → `devops > docker > basics` 계층으로 표시
- `_posts/frontend/react/advanced/optimization/memoization/파일.md` → 5단계 계층으로 표시

⚠️ **중요**: 파일명은 반드시 `YYYY-MM-DD-제목.md` 형식이어야 Jekyll이 포스트로 인식합니다!

## 목차(TOC) 자동 생성

각 포스트 내에서 `h1`, `h2`, `h3` 헤딩을 사용하면 사이드바에 자동으로 목차가 생성됩니다.

### 목차 생성 예시

```markdown
---
title: CSS Flexbox 완전 정복
author: 작성자 이름
date: 2025-12-04
layout: post
---

# Flexbox란?

## 기본 개념

### Flex Container
### Flex Item

## 주요 속성

### justify-content
### align-items
```

위와 같이 작성하면 사이드바에서 포스트를 클릭했을 때 다음과 같은 목차가 표시됩니다:

```
CSS Flexbox 완전 정복
  └ Flexbox란?
    └ 기본 개념
    └ 주요 속성
```

### 목차에서 제외하기

특정 헤딩을 목차에서 제외하려면 `no_toc` 클래스를 추가합니다:

```markdown
## 이 헤딩은 목차에 표시 안됨
{: .no_toc }
```

## 로컬에서 테스트하기

### 1. Ruby 및 Jekyll 설치

```bash
# macOS
brew install ruby
gem install jekyll bundler

# Ubuntu/Debian
sudo apt-get install ruby-full build-essential
gem install jekyll bundler
```

### 2. 의존성 설치

```bash
bundle install
```

### 3. 로컬 서버 실행

```bash
bundle exec jekyll serve
```

브라우저에서 `http://localhost:4000/frontend-roadmap.github.io/`로 접속하여 확인합니다.

## 마크다운 문법 팁

### 코드 블록

\```javascript
const greeting = "Hello, World!";
console.log(greeting);
\```

### 팁/경고 박스

```markdown
> ##### TIP
>
> 유용한 팁을 여기에 작성하세요.
{: .block-tip }

> ##### WARNING
>
> 주의사항을 여기에 작성하세요.
{: .block-warning }

> ##### DANGER
>
> 위험한 내용을 여기에 작성하세요.
{: .block-danger }
```

### 이미지 추가

```markdown
![이미지 설명](/frontend-roadmap.github.io/assets/images/example.png)
```

### 링크

```markdown
[링크 텍스트](https://example.com)
```

### 표

```markdown
| 속성 | 설명 | 예시 |
|------|------|------|
| display | 레이아웃 방식 | flex, grid |
| position | 위치 지정 | relative, absolute |
```

## Git Hooks 설정

이 프로젝트는 브랜치 네이밍 규칙과 커밋 메시지 규칙을 자동으로 검증합니다.

### 설치

저장소를 clone한 후 hooks를 설치하세요:

```bash
./scripts/install-hooks.sh
```

### 브랜치 네이밍 규칙

브랜치 이름은 다음 형식을 따라야 합니다:

```
{prefix}/{description}
```

**허용된 prefix:**
- `docs/` - 문서 생성
- `edit/` - 문서 수정
- `delete/` - 문서 삭제
- `feat/` - 로드맵 기능 추가
- `fix/` - 기능 수정 (hotfix 포함)
- `remove/` - 기능 삭제

**예시:**
```bash
git checkout -b docs/add-react-hooks
git checkout -b feat/implement-search
git checkout -b fix/correct-layout-bug
```

### 커밋 메시지 규칙

커밋 메시지는 브랜치 prefix와 일치해야 합니다:

```bash
# docs/ 브랜치에서
git commit -m "docs: Add React Hooks documentation"

# feat/ 브랜치에서
git commit -m "feat: Implement search functionality"
```

자세한 내용은 [.githooks/README.md](.githooks/README.md)를 참고하세요.

## Git 워크플로우

### 1. 저장소 클론

```bash
git clone https://github.com/dsm-plain/frontend-roadmap.github.io.git
cd frontend-roadmap.github.io
```

### 2. Git Hooks 설치 (필수!)

```bash
./scripts/install-hooks.sh
```

### 3. 브랜치 생성

```bash
# 올바른 형식: {prefix}/{description}
git checkout -b docs/add-react-hooks
```

### 4. 변경사항 커밋

```bash
git add _posts/2025-12-04-react-hooks.md
# 브랜치 prefix와 일치하는 커밋 메시지 사용
git commit -m "docs: Add React Hooks 기초 가이드"
```

### 5. 푸시 및 Pull Request

```bash
git push origin docs/add-react-hooks
```

GitHub에서 Pull Request를 생성합니다.

## 기여 가이드라인

### 작성 규칙

1. **명확하고 간결하게**: 초보자도 이해할 수 있도록 작성
2. **코드 예제 포함**: 이론만이 아닌 실제 코드 예제 제공
3. **한글 사용**: 한국어로 작성 (기술 용어는 영문 병기 가능)
4. **참고 자료 명시**: 외부 자료를 참고한 경우 출처 표기

### 커밋 메시지 규칙

```
Add: 새로운 콘텐츠 추가
Update: 기존 콘텐츠 수정
Fix: 오타나 오류 수정
Docs: 문서(README 등) 수정
Style: 포맷팅, 세미콜론 등 코드 변경 없는 수정
```

## 문제 해결

### 사이드바에 포스트가 안 보여요

1. **파일명**이 `YYYY-MM-DD-제목.md` 형식인지 확인 (가장 흔한 실수!)
   - ❌ `backend.md` (날짜 없음)
   - ✅ `2025-12-04-backend.md` (올바름)
2. Front Matter가 올바르게 작성되었는지 확인
3. `layout: post`가 포함되어 있는지 확인
4. Front Matter에 `category` 또는 `categories`를 수동으로 작성하지 않았는지 확인 (자동 생성과 충돌)

### 목차가 생성되지 않아요

1. `_config.yml`에서 `toc.enabled: true`인지 확인
2. 헤딩(`#`, `##`, `###`)을 사용했는지 확인
3. 헤딩 레벨이 `h1`~`h3` 범위 내인지 확인

### 로컬에서 실행이 안 돼요

```bash
# 의존성 재설치
bundle install

# 캐시 삭제 후 재실행
bundle exec jekyll clean
bundle exec jekyll serve
```

## 예제 포스트

완전한 예제 포스트는 `_posts/2019-04-28-howto.md` 파일을 참고하세요.

## 도움이 필요하면?

- 이슈 등록: [GitHub Issues](https://github.com/dsm-plain/frontend-roadmap.github.io/issues)
- Jekyll 문서: [Jekyll 공식 문서](https://jekyllrb.com/docs/)
- Markdown 가이드: [Markdown Guide](https://www.markdownguide.org/)

## License

This work is open sourced under the Apache License, Version 2.0.

Copyright 2019 Tao He.
