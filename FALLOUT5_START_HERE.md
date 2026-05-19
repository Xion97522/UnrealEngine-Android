# 🎮 Fallout 5 - Unreal Engine Recreation
## Start Here Guide

Welcome to the **Fallout 5 Unreal Engine Recreation** project! This guide will get you building your first APK and EXE in minutes.

---

## ⚡ Quick Start (2 Minutes)

### 1. Verify You Have Prerequisites
```bash
# Check if you have the necessary tools
which java                 # ✓ Java JDK
which gradle               # ✓ Gradle (for Android)
which UE4Editor           # ✓ Unreal Engine (for Windows)
```

### 2. Start the Build System
```bash
# Make scripts executable (if needed)
chmod +x BUILD.sh

# Launch interactive build menu
./BUILD.sh
```

### 3. Select Your Target
```
Select build target:
  1) Android (APK)    ← Pick this for mobile
  2) Windows (EXE)    ← Pick this for desktop
  3) Both (APK + EXE) ← Pick this for both
  4) Clean build
  5) Generate files only
  6) Exit
```

---

## 📁 What's Included?

```
Project Root/
├── BUILD.sh                    ← Main build script (START HERE)
├── BUILD_REPORT.md            ← Detailed build guide
├── BUILD_SUMMARY.txt          ← Quick reference
└── Fallout5/                  ← Main game project
    ├── Fallout5.uproject      ← Project config
    ├── Build_Android.sh       ← Android builder
    ├── Build_Windows.bat      ← Windows builder
    ├── README.md              ← Full documentation
    ├── Source/
    │   └── Fallout5/
    │       ├── Fallout5Character.h/cpp      ← Player controller
    │       ├── Fallout5GameMode.h/cpp       ← Game rules
    │       └── Fallout5.h/cpp               ← Module setup
    ├── Content/               ← Game assets (empty - ready for your content)
    └── Binaries/
        ├── Android/           ← APK output
        └── Win64/             ← EXE output
```

---

## 🚀 Build Options

### Option A: Interactive Menu (RECOMMENDED)
```bash
./BUILD.sh
# Follow the menu prompts
```

### Option B: Quick Android Build
```bash
cd Fallout5
./Build_Android.sh
```

### Option C: Quick Windows Build
```bash
cd Fallout5
Build_Windows.bat
# (Run on Windows only)
```

---

## 📱 After Building

### Android APK
```bash
# Install on device
adb install -r Binaries/Android/Fallout5.apk

# Or allow permissions
adb install -r -g Binaries/Android/Fallout5.apk
```

### Windows EXE
```cmd
# Just double-click or run
Fallout5\Binaries\Win64\Fallout5-Shipping.exe
```

---

## 🎯 What You Get

✅ **First Person Controller**
- WASD movement
- Mouse look
- Jump mechanic
- 500 units/second walk speed

✅ **Game Mode**
- Fallout5Character spawned by default
- Ready for gameplay mechanics

✅ **Multi-Platform**
- Windows 64-bit
- Android ARM64 (API 21+)

✅ **Full Source Code**
- Extensible C++ framework
- Ready for your Fallout universe content

---

## 📚 Documentation

| Document | Purpose |
|----------|---------|
| `BUILD_REPORT.md` | Complete build guide (5000+ words) |
| `BUILD_SUMMARY.txt` | Quick reference guide |
| `Fallout5/README.md` | Project-specific documentation |
| `FALLOUT5_START_HERE.md` | This file |

---

## 🔧 Troubleshooting

### "BUILD.sh: command not found"
```bash
chmod +x BUILD.sh
./BUILD.sh
```

### "Java not found"
```bash
# Install Java
apt-get install default-jdk  # Linux
brew install java             # Mac
# Windows: Download from java.com
```

### "Android SDK/NDK not found"
```bash
export ANDROID_HOME="/path/to/android-sdk"
export ANDROID_NDK="/path/to/ndk-r21+"
```

### Build takes too long
- This is normal! Full UE4 builds take 20-60 minutes
- First build is slowest; subsequent builds are faster
- Consider letting it run overnight

### Build fails with "Out of memory"
```bash
# Reduce parallel jobs
make -j2  # Instead of -j4 or -j8
```

---

## 📖 Next Steps

### 1. Customize the Game
Edit `Fallout5/Source/Fallout5/Fallout5Character.h`:
```cpp
// Adjust player speed
GetCharacterMovement()->MaxWalkSpeed = 600.0f;

// Change camera distance
CameraBoom->TargetArmLength = 300.0f;
```

### 2. Add Content
- Place 3D models in `Fallout5/Content/Models/`
- Create levels in `Fallout5/Content/Maps/`
- Add UI in `Fallout5/Content/UI/`

### 3. Extend Features
- Add weapon system
- Create enemy AI
- Build inventory
- Design levels

### 4. Publish
```bash
# Generate Release APK
cd Fallout5
./Build_Android.sh

# Generate Release EXE
Build_Windows.bat
```

---

## 🎓 Learning Resources

- **Unreal Engine Docs**: https://docs.unrealengine.com
- **C++ Development**: https://docs.unrealengine.com/en-US/cpp-development/
- **Enhanced Input System**: https://docs.unrealengine.com/en-US/enhanced-input-plugin/
- **Mobile Development**: https://docs.unrealengine.com/en-US/mobile-development/
- **Packaging & Deployment**: https://docs.unrealengine.com/en-US/packaging-your-project/

---

## 💡 Pro Tips

1. **First build will be slow** - Subsequent builds are 5-10x faster
2. **Use `-j4` for 4 cores** - Adjust based on your CPU cores
3. **Mobile builds need APK signing** - For production releases
4. **Keep Binaries folder clean** - Delete to force clean rebuild
5. **Test on actual devices** - Emulators can be slow

---

## ❓ Need Help?

1. Check `BUILD_REPORT.md` for detailed troubleshooting
2. Review `Fallout5/README.md` for project-specific info
3. Read source code comments in `Source/Fallout5/`
4. Check Unreal Engine documentation

---

## ✅ You're Ready!

```bash
# Get started now:
./BUILD.sh

# Or with detailed info:
cat BUILD_REPORT.md

# Or start coding:
cd Fallout5
# Edit Source/Fallout5/Fallout5Character.h
```

---

**Happy building!** 🚀

*Last Updated: 2026-05-19*
*Build System v1.0*
