@echo off
rem 

set JAVA_HOME=C:\Siemens\Zulu_Java
set JRE_HOME=C:\Siemens\Zulu_Java
set JRE64_HOME=C:\Siemens\Zulu_Java
set FMS_HOME=C:\Siemens\cvprod\tccs

cd %FMS_HOME%
cd bin
fccstat.exe -stop
fccstat.exe -restart
fccstat.exe -status


setlocal

rem TPR is short for TC_PORTAL_ROOT to reduce command line length
title Teamcenter Rich Client

call "C:\Siemens\cvprod\install\tem_init.bat"

set TPR=C:\Siemens\cvprod\portal
if not defined FMS_HOME set FMS_HOME=C:\Siemens\cvprod\tccs

rem use AUX_PATH env var for any additional required paths
rem save original path for external applications
set ORIGINAL_PATH=%PATH%
rem for optimal startup performance, keep the PATH length at a minimum
set PATH=%SYSTEMROOT%\system32;%FMS_HOME%\bin;%FMS_HOME%\lib;%TPR%;%AUX_PATH%

set JAVA_HOME=%TC_JRE_HOME%
set JRE_HOME=%TC_JRE_HOME%



:start_portal
cd /d %TPR%
set CLASSPATH=.;
set VM_XMX=2048m

rem Set DJIPJL_VMARG environment variable
IF EXIST "%TPR%\djipjl\setenv.cmd" call "%TPR%\djipjl\setenv.cmd"

@echo Starting Teamcenter Rich Client...
start Teamcenter.exe %* -vm "%JRE_HOME%\bin\javaw.exe" -vmargs -Xmx%VM_XMX% %DJIPJL_VMARG%  --add-opens java.desktop/javax.swing=ALL-UNNAMED
