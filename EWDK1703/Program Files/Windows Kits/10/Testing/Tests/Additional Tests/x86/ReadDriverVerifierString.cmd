@echo off

setlocal

set dvflag=
set dvdrivers=
FOR /F "tokens=2*" %%A IN ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v VerifyDriverLevel 2^>NUL') DO SET dvflag=%%B
FOR /F "tokens=2*" %%A IN ('REG QUERY "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v VerifyDrivers 2^>NUL') DO SET dvdrivers=%%B

if "%dvflag%"=="" (set dvstring=) else (set dvstring=%dvflag% %dvdrivers%)

REM %2 should be "HLK\DriverVerifierRegistrySettings"

%1 /CONFIGREG /ADD /VALUE:%2 /DATA:"%dvstring%"

endlocal
exit /b 0