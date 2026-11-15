
#!/bin/bash

set -e

PROJECT_NAME="Space Explorer"
BUILD_DIR="dist"

echo "================================"
echo "       BUILDING PROJECT"
echo "================================"

# Clean previous build
if [ -d "$BUILD_DIR" ]; then
    rm -rf "$BUILD_DIR"
    echo "[CLEAN] Previous build removed"
fi

# Create build directories
mkdir -p "$BUILD_DIR/css"
mkdir -p "$BUILD_DIR/js"

# Copy website files
cp index.html "$BUILD_DIR/"
cp css/style.css "$BUILD_DIR/css/"
cp js/app.js "$BUILD_DIR/js/"

# Count files
FILE_COUNT=$(find "$BUILD_DIR" -type f | wc -l)

echo ""
echo "Project: $PROJECT_NAME"
echo "Build directory: $BUILD_DIR"
echo "Files copied: $FILE_COUNT"
echo ""
echo "Build completed successfully!"
