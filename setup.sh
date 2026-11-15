
#!/bin/bash

PROJECT_NAME="Space Explorer"

echo "================================"
echo "       $PROJECT_NAME"
echo "================================"

# Check required tools
for tool in git python; do
    if command -v "$tool" >/dev/null 2>&1; then
        echo "[OK] $tool is installed"
    else
        echo "[WARNING] $tool is not installed"
    fi
done

# Check project structure
mkdir -p css js

for file in index.html css/style.css js/app.js; do
    if [ -f "$file" ]; then
        echo "[OK] Found: $file"
    else
        echo "[MISSING] $file"
    fi
done

echo "Setup check completed!"
