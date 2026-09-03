@echo off
title Siemens Teamcenter Cache Cleaner
echo ========================================================
echo   Closing Teamcenter, Java, and FCC Processes...
echo ========================================================

:: Forcefully close Teamcenter Rich Client and Java processes
taskkill /f /im portal.exe 2>nul
taskkill /f /im java.exe 2>nul
taskkill /f /im javaw.exe 2>nul
taskkill /f /im Teamcenter.exe 2>nul
taskkill /f /im ugraf.exe 2>nul
taskkill /f /im tcserver.exe 2>nul

:: Forcefully stop the File Client Cache (FCC) service
taskkill /f /im fcc.exe 2>nul

echo.
echo ========================================================
echo   Purging FCC Cache using native utilities...
echo ========================================================
:: Run native FCC purge command if the environment path exists
call fccstat -purge 2>nul
call fccstat -clear 2>nul

echo.
echo ========================================================
echo   Deleting Teamcenter Client Cache Directories...
echo ========================================================

:: Target user profile directories
set USER_DIR=C:\Users\%USERNAME%

if exist "%USER_DIR%\FCCCache" (
    echo Removing FCCCache...
    rmdir /s /q "%USER_DIR%\FCCCache"
)

if exist "%USER_DIR%\FCCCache_cvprod" (
    echo Removing FCCCache_cvprod...
    rmdir /s /q "%USER_DIR%\FCCCache_cvprod"
)

if exist "%USER_DIR%\FCCCache_uaprod" (
    echo Removing FCCCache_uaprod...
    rmdir /s /q "%USER_DIR%\FCCCache_uaprod"
)

if exist "%USER_DIR%\Teamcenter" (
    echo Removing Teamcenter Cache...
    rmdir /s /q "%USER_DIR%\Teamcenter"
)

if exist "%USER_DIR%\Siemens" (
    echo Removing Siemens AppData Cache...
    rmdir /s /q "%USER_DIR%\Siemens"
)

:: Clear the Siemens Local AppData directory
if exist "%LOCALAPPDATA%\Siemens" (
    echo Removing Siemens Local AppData...
    rmdir /s /q "%LOCALAPPDATA%\Siemens"
)

:: Delete standalone FCC log files from the profile root
del /f /q "%USER_DIR%\fcc.log" 2>nul
del /f /q "%USER_DIR%\fcc*.log" 2>nul

echo.
echo ========================================================
echo   Cleaning System Temporary Files...
echo ========================================================
:: Deletes user temporary files while ignoring locked files
del /s /f /q "%TEMP%\*.*" 2>nul

echo.
echo ========================================================
echo   Cache Cleanup Complete! You can now restart Teamcenter.
echo ========================================================

::start "" "C:\Siemens\cvprod\portal\portal.bat"
call "C:\Siemens\cvprod\portal\portal.bat"