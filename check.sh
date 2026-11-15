
#!/bin/bash

PROJECT_NAME="Space Explorer"
ERRORS=0

echo "================================"
echo "       PROJECT DIAGNOSTICS"
echo "================================"

check_file() {
    local FILE="$1"

    if [ -f "$FILE" ]; then
        echo "[PASS] $FILE"
    else
        echo "[FAIL] $FILE is missing"
        ((ERRORS++))
    fi
}

check_directory() {
    local DIR="$1"

    if [ -d "$DIR" ]; then
        echo "[PASS] Directory: $DIR"
    else
        echo "[FAIL] Directory: $DIR is missing"
        ((ERRORS++))
    fi
}

echo ""
echo "Checking directories..."

check_directory "css"
check_directory "js"

echo ""
echo "Checking files..."

check_file "index.html"
check_file "css/style.css"
check_file "js/app.js"
check_file "setup.sh"
check_file "build.sh"

echo ""
echo "Checking Git..."

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "[PASS] Git repository detected"
else
    echo "[FAIL] Git repository not found"
    ((ERRORS++))
fi

echo ""
echo "================================"

if [ "$ERRORS" -eq 0 ]; then
    echo "ALL CHECKS PASSED!"
else
    echo "$ERRORS ERROR(S) FOUND"
fi

echo "================================"

exit "$ERRORS"
