# Git Hooks 가이드

이 프로젝트는 브랜치 네이밍 규칙과 커밋 메시지 규칙을 자동으로 검증하는 Git hooks를 사용합니다.

## 설치 방법

저장소를 clone한 후 다음 명령어를 실행하세요:

```bash
./scripts/install-hooks.sh
```

## 브랜치 네이밍 규칙

### 형식
```
{prefix}/{description}
```

### 허용된 Prefix

| Prefix | 용도 | 예시 |
|--------|------|------|
| `docs/` | 문서 생성 | `docs/add-react-hooks` |
| `edit/` | 문서 수정 | `edit/update-javascript-basics` |
| `delete/` | 문서 삭제 | `delete/remove-outdated-post` |
| `feat/` | 로드맵 기능 추가 | `feat/implement-search` |
| `fix/` | 기능 수정 (hotfix 포함) | `fix/correct-typo` |
| `remove/` | 기능 삭제 | `remove/unused-assets` |

### Description 규칙
- 소문자와 숫자만 사용
- 단어는 하이픈(`-`)으로 구분
- 영문으로 작성 권장

### 올바른 예시
```bash
git checkout -b docs/add-javascript-basics
git checkout -b feat/implement-search-feature
git checkout -b fix/correct-layout-bug
```

### 잘못된 예시
```bash
git checkout -b feature/add-new-feature  # 'feature'는 허용되지 않음 (feat 사용)
git checkout -b docs/Add_New_File        # 대문자와 언더스코어 사용 불가
git checkout -b docs/file                # 너무 짧거나 모호함
```

## 커밋 메시지 규칙

### 형식
```
{prefix}: {메시지 내용}
```

브랜치의 prefix와 커밋 메시지의 prefix가 일치해야 합니다.

### Prefix 매칭

| 브랜치 | 커밋 메시지 Prefix |
|--------|-------------------|
| `docs/...` | `docs:` |
| `edit/...` | `edit:` |
| `delete/...` | `delete:` |
| `feat/...` | `feat:` |
| `fix/...` | `fix:` |
| `remove/...` | `remove:` |

### 올바른 예시

```bash
# docs/add-react-hooks 브랜치에서
git commit -m "docs: Add React Hooks documentation"

# feat/implement-search 브랜치에서
git commit -m "feat: Implement search functionality"

# fix/correct-typo 브랜치에서
git commit -m "fix: Correct typo in README"
```

### 잘못된 예시

```bash
# docs/add-react-hooks 브랜치에서
git commit -m "feat: Add React Hooks documentation"  # prefix 불일치

# feat/new-feature 브랜치에서
git commit -m "Add new feature"  # prefix 누락
```

## main/master 브랜치 예외

`main` 또는 `master` 브랜치에서는 이러한 규칙이 적용되지 않습니다.

## Hooks 제거

Hooks를 제거하려면:

```bash
./scripts/uninstall-hooks.sh
```

## 트러블슈팅

### Hook이 실행되지 않아요

1. Hook 파일에 실행 권한이 있는지 확인:
   ```bash
   ls -l .git/hooks/commit-msg
   ```

2. 실행 권한이 없다면:
   ```bash
   chmod +x .git/hooks/commit-msg
   ```

### 검증을 일시적으로 건너뛰고 싶어요

```bash
git commit --no-verify -m "메시지"
```

⚠️ 주의: 팀 규칙을 준수하기 위해 가급적 사용하지 마세요.

### Hook을 수정했는데 반영이 안 돼요

`.githooks/commit-msg`를 수정한 후 다시 설치해야 합니다:

```bash
./scripts/install-hooks.sh
```

## 추가 정보

- Git hooks는 `.git/hooks/` 디렉토리에 저장되며 버전 관리되지 않습니다
- 이 프로젝트는 `.githooks/` 디렉토리에 hooks를 저장하여 팀원과 공유합니다
- 모든 기여자는 저장소를 clone한 후 반드시 hooks를 설치해야 합니다
