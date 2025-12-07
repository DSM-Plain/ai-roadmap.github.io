#!/bin/bash

# ========================================
# Git Hooks 제거 스크립트
# ========================================

# 색상 정의
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

HOOKS_DIR=".githooks"
GIT_HOOKS_DIR=".git/hooks"

echo ""
echo "========================================="
echo "Git Hooks 제거 시작"
echo "========================================="
echo ""

# .git 디렉토리가 존재하는지 확인
if [ ! -d ".git" ]; then
    echo "오류: Git 저장소가 아닙니다."
    exit 1
fi

REMOVED_COUNT=0

# .githooks에 정의된 hook만 제거
for hook in "$HOOKS_DIR"/*; do
    if [ -f "$hook" ] && [[ ! "$hook" =~ README.md$ ]]; then
        hook_name=$(basename "$hook")

        if [ -f "$GIT_HOOKS_DIR/$hook_name" ]; then
            rm "$GIT_HOOKS_DIR/$hook_name"
            echo -e "${GREEN}✓${NC} $hook_name 제거 완료"
            REMOVED_COUNT=$((REMOVED_COUNT + 1))
        fi
    fi
done

echo ""
echo "========================================="
echo -e "${GREEN}Git Hooks 제거 완료!${NC}"
echo "========================================="
echo ""
echo "제거된 hooks: $REMOVED_COUNT개"
echo ""
