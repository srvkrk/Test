@echo off
setlocal

set "TARGET=D:\Siemens Document\Backend_Data_19_05_26"

echo.
echo ============================================
echo Cleaning directory:
echo %TARGET%
echo ============================================
echo.

if not exist "%TARGET%\" (
    echo ERROR: Directory does not exist.
    pause
    exit /b 1
)

echo Deleting all files except .c files...
echo.

for /r "%TARGET%" %%F in (*) do (
    if /I not "%%~xF"==".c" (
        echo Deleting: %%F
        del /f /q "%%F"
    )
)

echo.
echo ============================================
echo Cleaning completed.
echo Only .c files have been kept.
echo ============================================
echo.

pause