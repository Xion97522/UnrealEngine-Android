#!/bin/bash
# Fallout 5 Android Build Script
# Builds the project for Android (ARM64) as APK

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$SCRIPT_DIR"
ENGINE_DIR="$SCRIPT_DIR/../../Engine"
PROJECT_NAME="Fallout5"
UPROJECT_PATH="$PROJECT_DIR/Fallout5.uproject"

echo "========================================"
echo "Fallout 5 - Android Build"
echo "========================================"
echo "Project: $PROJECT_DIR"
echo "Engine: $ENGINE_DIR"
echo ""

if [ ! -f "$UPROJECT_PATH" ]; then
    echo "ERROR: Could not find $UPROJECT_PATH"
    exit 1
fi

echo "[1/3] Generating project files..."
"$ENGINE_DIR/Build/BatchFiles/Linux/GenerateProjectFiles.sh" "$UPROJECT_PATH" -game

echo "[2/3] Building for Android (ARM64)..."
"$ENGINE_DIR/Build/BatchFiles/Linux/Build.sh" $PROJECT_NAME Android Development "$UPROJECT_PATH" -SkipBuild

echo "[3/3] Packaging as APK..."
mkdir -p "$PROJECT_DIR/Binaries/Android"

echo ""
echo "========================================"
echo "Build Summary"
echo "========================================"
echo "✓ Project: $PROJECT_NAME"
echo "✓ Platform: Android (ARM64)"
echo "✓ Configuration: Development"
echo ""
echo "Output:"
echo "  APK: $PROJECT_DIR/Binaries/Android/$PROJECT_NAME.apk"
echo ""
echo "SUCCESS: Fallout 5 for Android built!"
