@echo off

NET USE H: /DELETE

rem set the Teamcenter Root Portal path
set TPR=C:\Siemens\cvprod\portal

cd /d "%TPR%"
cd ..
cd install
call tem_init.bat

set JRE_HOME=%TC_JRE_HOME%

cd /d "%TPR%"
rem change the shared location path accordingly
net use H: \\172.22.97.231\dmusession\jtcodes\Cvprod-JAR-Files install1 /USER:inst

rem 3 arguments  for the below jar source path, destination path, TPR i.e Teamcenter Portal Root path.
call java -jar %TPR%\T5CompareFile.jar H:\ %TPR%\plugins\ %TPR%\

NET USE H: /DELETE

call %TPR%\portal.bat