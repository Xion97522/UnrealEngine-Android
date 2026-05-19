@ECHO OFF
REM Fallout 5 Windows Build Script
REM Builds the project for Windows (x64) in Shipping configuration

SETLOCAL ENABLEDELAYEDEXPANSION

SET PROJECT_DIR=%~dp0
SET ENGINE_DIR=%PROJECT_DIR%..\..\Engine
SET PROJECT_NAME=Fallout5
SET UPROJECT_PATH=%PROJECT_DIR%Fallout5.uproject

ECHO ========================================
ECHO Fallout 5 - Windows Build
ECHO ========================================
ECHO Project: %PROJECT_DIR%
ECHO Engine: %ENGINE_DIR%
ECHO.

IF NOT EXIST "%UPROJECT_PATH%" (
    ECHO ERROR: Could not find %UPROJECT_PATH%
    PAUSE
    EXIT /B 1
)

ECHO [1/3] Generating Visual Studio project files...
CALL "%ENGINE_DIR%\Build\BatchFiles\Windows\GenerateProjectFiles.bat" "%UPROJECT_PATH%" -game

IF ERRORLEVEL 1 (
    ECHO ERROR: Failed to generate project files
    PAUSE
    EXIT /B 1
)

ECHO [2/3] Building project for Windows (x64) Shipping...
CALL "%ENGINE_DIR%\Build\BatchFiles\Windows\Build.bat" %PROJECT_NAME% Win64 Shipping "%UPROJECT_PATH%"

IF ERRORLEVEL 1 (
    ECHO ERROR: Build failed
    PAUSE
    EXIT /B 1
)

ECHO [3/3] Build complete!
ECHO.
ECHO Output:
ECHO   Executable: %PROJECT_DIR%Binaries\Win64\UE4Editor.exe
ECHO   Shipping:   %PROJECT_DIR%Binaries\Win64\%PROJECT_NAME%-Shipping.exe
ECHO.
ECHO SUCCESS: Fallout 5 for Windows built successfully!
PAUSE
