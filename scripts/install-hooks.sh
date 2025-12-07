#!/bin/bash

# ========================================
# Git Hooks 설치 스크립트
# ========================================

# 색상 정의
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

HOOKS_DIR=".githooks"
GIT_HOOKS_DIR=".git/hooks"

echo ""
echo "========================================="
echo "Git Hooks 설치 시작"
echo "========================================="
echo ""

# .githooks 디렉토리가 존재하는지 확인
if [ ! -d "$HOOKS_DIR" ]; then
    echo "오류: $HOOKS_DIR 디렉토리를 찾을 수 없습니다."
    exit 1
fi

# .git 디렉토리가 존재하는지 확인
if [ ! -d ".git" ]; then
    echo "오류: Git 저장소가 아닙니다. 프로젝트 루트에서 실행해주세요."
    exit 1
fi

# .githooks의 모든 hook 파일을 .git/hooks로 복사
INSTALLED_COUNT=0

for hook in "$HOOKS_DIR"/*; do
    # README.md는 제외
    if [ -f "$hook" ] && [[ ! "$hook" =~ README.md$ ]]; then
        hook_name=$(basename "$hook")

        # 복사
        cp "$hook" "$GIT_HOOKS_DIR/$hook_name"

        # 실행 권한 부여
        chmod +x "$GIT_HOOKS_DIR/$hook_name"

        echo -e "${GREEN}✓${NC} $hook_name 설치 완료"
        INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
    fi
done

echo ""
echo "========================================="
echo -e "${GREEN}Git Hooks 설치 완료!${NC}"
echo "========================================="
echo ""
echo "설치된 hooks: $INSTALLED_COUNT개"
echo ""
echo "브랜치 네이밍 규칙:"
echo "  {prefix}/{description}"
echo ""
echo "허용된 prefix:"
echo "  docs/, edit/, delete/, feat/, fix/, remove/"
echo ""
echo "커밋 메시지 규칙:"
echo "  브랜치 prefix와 동일한 prefix 사용"
echo "  예: docs/ 브랜치 → docs: 커밋 메시지"
echo ""
echo "자세한 내용은 .githooks/README.md를 참고하세요."
echo ""
