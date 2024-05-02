@echo off
%~dp0..\..\redist\RegisterWDTF.exe >> ScriptErrors.txt

ECHO Running "CScript.exe %*" >> ScriptErrors.txt

CScript.exe %* 2>> ScriptErrors.txt

set _JOB_ExitCode=%ERRORLEVEL%

ECHO CScript.exe ended with exitcode: %_JOB_ExitCode% >> ScriptErrors.txt

%~dp0..\..\redist\UnRegisterWDTF.exe >> ScriptErrors.txt

Exit /B %_JOB_ExitCode%
