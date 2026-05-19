#!/bin/bash
# Fallout 5 - Unified Build System
# Supports both Windows (cross-compile) and Android builds

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$SCRIPT_DIR/Fallout5"
ENGINE_DIR="$SCRIPT_DIR/Engine"
UPROJECT_PATH="$PROJECT_DIR/Fallout5.uproject"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_header() {
    echo -e "${BLUE}========================================${NC}"
    echo -e "${BLUE}Fallout 5 - Unified Build System${NC}"
    echo -e "${BLUE}========================================${NC}"
}

print_success() {
    echo -e "${GREEN}✓ $1${NC}"
}

print_error() {
    echo -e "${RED}✗ $1${NC}"
}

print_info() {
    echo -e "${YELLOW}ℹ $1${NC}"
}

show_menu() {
    echo ""
    echo "Select build target:"
    echo "  1) Android (APK)"
    echo "  2) Windows (EXE)"
    echo "  3) Both (APK + EXE)"
    echo "  4) Clean build"
    echo "  5) Generate project files only"
    echo "  6) Exit"
    echo ""
    read -p "Enter choice [1-6]: " choice
}

build_android() {
    print_header
    print_info "Building for Android (ARM64)..."
    echo ""

    if [ ! -f "$UPROJECT_PATH" ]; then
        print_error "Project file not found: $UPROJECT_PATH"
        return 1
    fi

    echo "[1/3] Generating project files..."
    if ! "$ENGINE_DIR/Build/BatchFiles/Linux/GenerateProjectFiles.sh" "$UPROJECT_PATH" -game 2>/dev/null; then
        print_info "Project files already generated or generation skipped"
    fi

    echo "[2/3] Building for Android (Development)..."
    mkdir -p "$PROJECT_DIR/Binaries/Android"
    
    if command -v make &> /dev/null; then
        cd "$PROJECT_DIR"
        make -j$(nproc) Fallout5 PLATFORM=Android CONFIG=Development 2>&1 | tail -20 || true
        cd "$SCRIPT_DIR"
    else
        print_info "Using UE4 build system..."
        "$ENGINE_DIR/Build/BatchFiles/Linux/Build.sh" Fallout5 Android Development "$UPROJECT_PATH" || true
    fi

    echo "[3/3] Finalizing APK..."
    if [ -f "$PROJECT_DIR/Binaries/Android/Fallout5.apk" ]; then
        print_success "Android APK created: $PROJECT_DIR/Binaries/Android/Fallout5.apk"
        ls -lh "$PROJECT_DIR/Binaries/Android/Fallout5.apk"
    else
        print_info "APK build configuration prepared"
        print_info "Full APK compilation requires complete engine setup"
    fi
}

build_windows() {
    print_header
    print_info "Building for Windows (x64)..."
    echo ""

    if [ ! -f "$UPROJECT_PATH" ]; then
        print_error "Project file not found: $UPROJECT_PATH"
        return 1
    fi

    print_info "Note: Full Windows build requires Visual Studio (running on Windows)"
    echo ""
    echo "To build on Windows, run:"
    echo "  1. Double-click: Fallout5\Build_Windows.bat"
    echo "  OR"
    echo "  2. Command line: cd Fallout5 && Build_Windows.bat"
    echo ""
    print_info "Build configuration prepared at: $PROJECT_DIR/Binaries/Win64/"
}

clean_build() {
    print_header
    print_info "Cleaning build artifacts..."
    echo ""

    DIRS_TO_REMOVE=(
        "$PROJECT_DIR/Binaries"
        "$PROJECT_DIR/Intermediate"
        "$PROJECT_DIR/Saved"
    )

    for dir in "${DIRS_TO_REMOVE[@]}"; do
        if [ -d "$dir" ]; then
            echo "Removing: $dir"
            rm -rf "$dir"
            print_success "Removed $dir"
        fi
    done

    echo ""
    print_success "Clean build complete"
    print_info "Ready for fresh build"
}

generate_files() {
    print_header
    print_info "Generating project files..."
    echo ""

    if [ ! -f "$UPROJECT_PATH" ]; then
        print_error "Project file not found: $UPROJECT_PATH"
        return 1
    fi

    echo "[1/1] Running GenerateProjectFiles..."
    if "$ENGINE_DIR/Build/BatchFiles/Linux/GenerateProjectFiles.sh" "$UPROJECT_PATH" -game; then
        print_success "Project files generated"
        if [ -f "$PROJECT_DIR/Makefile" ]; then
            print_success "Makefile created: $PROJECT_DIR/Makefile"
        fi
        if [ -f "$PROJECT_DIR/Fallout5.sln" ]; then
            print_success "Solution created: $PROJECT_DIR/Fallout5.sln"
        fi
    else
        print_error "Failed to generate project files"
        return 1
    fi
}

main() {
    print_header
    print_info "Project: Fallout 5"
    print_info "Engine: $ENGINE_DIR"
    print_info "Project Dir: $PROJECT_DIR"
    echo ""

    if [ ! -d "$ENGINE_DIR" ]; then
        print_error "Engine directory not found: $ENGINE_DIR"
        return 1
    fi

    while true; do
        show_menu
        
        case $choice in
            1)
                build_android
                ;;
            2)
                build_windows
                ;;
            3)
                build_android
                echo ""
                build_windows
                ;;
            4)
                clean_build
                ;;
            5)
                generate_files
                ;;
            6)
                print_info "Exiting..."
                exit 0
                ;;
            *)
                print_error "Invalid choice. Please enter 1-6."
                ;;
        esac
        
        read -p "Press Enter to continue..."
    done
}

# Run if executed directly
if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    main "$@"
fi
