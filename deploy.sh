
#!/bin/bash

set -e

PROJECT_NAME="Space Explorer"

echo "================================"
echo "       DEPLOYMENT CHECK"
echo "================================"

# Check Git
if ! command -v git >/dev/null 2>&1; then
    echo "[ERROR] Git is not installed!"
    exit 1
fi

# Check repository
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "[ERROR] Git repository not found!"
    exit 1
fi

# Check remote
if ! git remote get-url origin >/dev/null 2>&1; then
    echo "[ERROR] GitHub remote is missing!"
    exit 1
fi

echo "[OK] Git repository detected"
echo "[OK] GitHub remote detected"

echo ""
echo "Repository:"
git remote get-url origin

echo ""
echo "Current branch:"
git branch --show-current

echo ""
echo "Git status:"
git status --short

echo ""
echo "================================"
echo "Deployment check completed!"
echo "================================"
