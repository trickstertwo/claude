@echo off
REM Copy Claude Code automation template to a new project

if "%~1"=="" (
  echo Usage: copy-to-project.bat C:\path\to\your\project
  echo.
  echo This will copy the .claude automation files to your project.
  exit /b 1
)

set "PROJECT_PATH=%~1"

if not exist "%PROJECT_PATH%" (
  echo Error: Directory %PROJECT_PATH% does not exist
  exit /b 1
)

echo 📦 Copying Claude Code automation to: %PROJECT_PATH%
echo.

REM Copy .claude directory
xcopy /E /I /Y .claude "%PROJECT_PATH%\.claude"

echo ✅ Copied .claude\ directory
echo.
echo 🎯 Next steps:
echo   1. cd %PROJECT_PATH%
echo   2. Open in Claude Code
echo   3. Type: /init-automation
echo   4. Answer 8 questions about your tech stack
echo   5. Done! Full automation configured
echo.
echo ⏱️  Total time: ~10 minutes
