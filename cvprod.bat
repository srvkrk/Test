set TC_ROOT=C:\Siemens\cvprod
set FMS_HOME=C:\Siemens\cvprod\tccs
set JAVA_HOME=C:\Siemens\Zulu_Java
set JRE_HOME=C:\Siemens\Zulu_Java
set CLASSPATH=%TC_ROOT%\portal
set PATH=%FMS_HOME%\bin;%FMS_HOME%\lib;TC_ROOT\portal;%PATH%
start "Start FCC" /min cmd /c "%TC_ROOT%\tccs\bin\fccstat.exe -restart"
D:\TC14_3\eclipse\eclipse.exe -vm C:\Siemens\Zulu_Java\bin\javaw