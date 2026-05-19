# Fallout 5 - Unreal Engine Game Project

## Overview
This is a First Person game recreation of Fallout 5 built with Unreal Engine. The project is configured to build for both Android (APK) and Windows (EXE).

## Project Structure
```
Fallout5/
├── Source/
│   └── Fallout5/
│       ├── Fallout5.h              - Module header
│       ├── Fallout5.cpp            - Module implementation
│       ├── Fallout5Character.h     - Player character class
│       ├── Fallout5Character.cpp   - Character implementation
│       ├── Fallout5GameMode.h      - Game mode class
│       └── Fallout5GameMode.cpp    - Game mode implementation
├── Content/                         - Game assets (to be populated)
├── Binaries/
│   ├── Android/                    - Android build artifacts (APK)
│   └── Win64/                      - Windows build artifacts (EXE)
├── Fallout5.uproject               - Project file
├── Build_Windows.bat               - Windows build script
└── Build_Android.sh                - Android build script
```

## Features Implemented
- **First Person Controller**: Enhanced Input System with movement and camera control
- **Character Movement**: Walking, jumping, controller-based movement
- **Camera System**: Spring arm for smooth third-person or first-person camera
- **Game Mode**: Custom game mode with Fallout5Character as default pawn
- **Multi-Platform Support**: Built for Windows (Win64) and Android (ARM64)

## Prerequisites

### For Windows (EXE) Build
- **Visual Studio 2019** or newer with C++ development tools
- **Unreal Engine 4.27+** compiled for Windows
- **Windows SDK** (included with Visual Studio)

### For Android (APK) Build
- **Android SDK** (API Level 34 or later)
- **Android NDK** (r21+)
- **Java Development Kit (JDK)** 8 or newer
- **Gradle** (bundled with Android Studio)
- **Unreal Engine 4.27+** compiled for Android

## Building the Project

### Windows Build
```bash
# Option 1: Run the batch script (Windows only)
Build_Windows.bat

# Option 2: Manual build
cd Fallout5
<UE4 Engine>/Build/BatchFiles/Windows/GenerateProjectFiles.bat Fallout5.uproject -game
<UE4 Engine>/Build/BatchFiles/Windows/Build.bat Fallout5 Win64 Shipping Fallout5.uproject
```

**Output**: `Binaries/Win64/Fallout5-Shipping.exe`

### Android Build
```bash
# Option 1: Run the shell script
./Build_Android.sh

# Option 2: Manual build
<UE4 Engine>/Build/BatchFiles/Linux/GenerateProjectFiles.sh Fallout5.uproject -game
<UE4 Engine>/Build/BatchFiles/Linux/Build.sh Fallout5 Android Development Fallout5.uproject
```

**Output**: `Binaries/Android/Fallout5.apk`

## Source Code Classes

### Fallout5Character (Fallout5Character.h/cpp)
- **Description**: Player character class with first-person camera control
- **Features**:
  - Enhanced Input System integration
  - Spring arm camera attachment
  - Character movement with configurable speed and acceleration
  - Input callbacks for Move and Look actions
  - Jump capability

### Fallout5GameMode (Fallout5GameMode.h/cpp)
- **Description**: Custom game mode that spawns the Fallout5Character
- **Features**:
  - Sets Fallout5Character as the default pawn class
  - Manages game flow and rules

## Build Configurations

### Development
- Debug symbols included
- Optimization: minimal
- Size: ~500MB+
- Use for: Testing and debugging

### Shipping
- Debug symbols stripped
- Full optimization enabled
- Size: ~200-300MB
- Use for: Distribution

## Deployment

### Windows
Simply run the `.exe` file. No installation required for the standalone build.

### Android
Install the APK on an Android device with API level 21 or higher:
```bash
adb install -r Binaries/Android/Fallout5.apk
```

## Troubleshooting

### Build Fails - Missing Engine
**Error**: "Cannot find Unreal Engine"
**Solution**: Ensure `Fallout5.uproject` correctly points to the engine using relative path `"."`

### Build Fails - Missing Dependencies
**Error**: "Missing Android SDK/NDK"
**Solution**: 
- Install Android SDK Platform API Level 34
- Install Android NDK r21 or later
- Set environment variables: `ANDROID_HOME` and `ANDROID_NDK`

### APK Won't Install
**Error**: "Application not installed"
**Solution**: 
- Ensure device is running Android 5.0+ (API 21+)
- Try: `adb install -r -g Binaries/Android/Fallout5.apk`

## Next Steps for Development

1. **Add Content**:
   - Import 3D models for Fallout universe
   - Create game levels and maps
   - Add NPCs and enemies

2. **Implement Gameplay**:
   - Weapon system
   - Inventory system
   - Quest system
   - Combat mechanics

3. **UI/UX**:
   - Main menu
   - HUD
   - Pause menu
   - Settings

4. **Optimization**:
   - Mobile optimization for Android
   - LOD (Level of Detail) setup
   - Shader caching

## Build Commands Summary

| Target | Command |
|--------|---------|
| Windows EXE | `Build_Windows.bat` |
| Android APK | `./Build_Android.sh` |
| Generate Files | `GenerateProjectFiles.bat/sh` |
| Clean Build | Delete `Intermediate/` and `Binaries/` folders |

## Resources
- [Unreal Engine Documentation](https://docs.unrealengine.com)
- [Enhanced Input System Guide](https://docs.unrealengine.com/en-US/enhanced-input-plugin/)
- [Mobile Development Guide](https://docs.unrealengine.com/en-US/mobile-development/)
- [Packaging & Deployment](https://docs.unrealengine.com/en-US/packaging-your-project/)

## License
This project is based on the Fallout IP and Unreal Engine. Ensure compliance with both licenses.

---

**Build System Version**: 1.0
**Created**: 2026-05-19
**Platform Support**: Windows (x64), Android (ARM64)
