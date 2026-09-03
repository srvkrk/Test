@echo off
setlocal

set "ROOT=D:\Siemens Document\Backend_Data_19_05_26\CVeh_Serv_Bkp_20_05_26\sourav"

echo.
echo ==========================================
echo Cleaning files under:
echo %ROOT%
echo ==========================================
echo.

REM Delete files named "compile"
for /r "%ROOT%" %%F in (compile) do (
    if exist "%%F" (
        echo Deleting: %%F
        del /f /q "%%F"
    )
)

REM Delete files named "link_custom_exits"
for /r "%ROOT%" %%F in (link_custom_exits) do (
    if exist "%%F" (
        echo Deleting: %%F
        del /f /q "%%F"
    )
)

REM Delete files named "linkitk"
for /r "%ROOT%" %%F in (linkitk) do (
    if exist "%%F" (
        echo Deleting: %%F
        del /f /q "%%F"
    )
)

REM Delete all files with ".o" extension
for /r "%ROOT%" %%F in (*.o) do (
    if exist "%%F" (
        echo Deleting: %%F
        del /f /q "%%F"
    )
)

REM Delete all ".log" files
for /r "%ROOT%" %%F in (*.log) do (
    if exist "%%F" (
        echo Deleting: %%F
        del /f /q "%%F"
    )
)

echo.
echo ==========================================
echo Cleanup completed successfully.
echo ==========================================
echo.

pause