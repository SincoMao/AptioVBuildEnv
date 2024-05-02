@echo off
setlocal

REM
REM Check that SMV environment variable is set correctly
REM 

IF "%SDV%" == "" (
	ECHO.
	ECHO Error: You need to have the SDV environment variable set. 
	GOTO EXIT
)

SET SMV=%SDV%\smv
SET SDVAP=%SMV%\analysisplugins\sdv

ECHO SDV: %SDV%
ECHO SMV: %SMV%
ECHO SDVAP: %SDVAP%

REM
REM Set our build environment prefix for configuration files
REM
SET BE=msbuild
IF NOT "%SDXROOT%"=="" (
        SET BE=razzle
)

ECHO Build environment: %BE%


REM
REM This script is a wrapper to call SMV for staticdv commands
REM
SET str1=%1
IF /i "%1"=="" GOTO HELP
IF /i "%1"=="/?" GOTO HELP
IF /i "%1"=="/help" GOTO HELP
IF /i "%1"=="/scan" GOTO SCAN
IF /i "%1"=="/lib" GOTO LIB
IF /i "%1"=="/clean" GOTO CLEAN
IF /i "%1"=="/view" GOTO VIEW
IF /i "%1"=="/nullcheck" GOTO NULLCHECK
IF /i "%1"=="/viewdefect" GOTO VIEWDEFECT
IF /i NOT x%str1:/check=%==x%str1% GOTO CHECK
GOTO HELP

REM
REM Primary actions for SDV
REM

:SCAN
"%smv%\bin\smv" /plugin:"%sdvap%\bin\smvsdv.dll" /config:"%sdvap%\configurations\%BE%-build-scan.xml" %1 %2 %3 %4 %5 %6 %7 %8
GOTO EXIT

:LIB
"%smv%\bin\smv" /plugin:"%sdvap%\bin\smvsdv.dll" /config:"%sdvap%\configurations\%BE%-build.xml" /lib %1 %2 %3 %4 %5 %6 %7 %8
GOTO EXIT

:CLEAN
"%smv%\bin\smv" /plugin:"%sdvap%\bin\smvsdv.dll" /clean %1 %2 %3 %4 %5 %6 %7 %8
GOTO EXIT

:CHECK
IF /I "%2"=="/cloud" (
  "%smv%\bin\smv" /plugin:"%sdvap%\bin\smvsdv.dll" /config:"%sdvap%\configurations\%BE%-build-verify-cloud.xml" /analyze  %1 %2 %3 %4 %5 %6 %7 %8
  GOTO EXIT
) 
"%smv%\bin\smv" /plugin:"%sdvap%\bin\smvsdv.dll" /config:"%sdvap%\configurations\%BE%-build-verify.xml" /analyze  %1 %2 %3 %4 %5 %6 %7 %8
GOTO EXIT

:VIEWDEFECT
"%sdv%\bin\sdvdefect.exe" sdv\check\nullcheck\bug1
GOTO EXIT

:NULLCHECK
"%smv%\bin\smv" /plugin:"%sdvap%\bin\smvsdv.dll" /config:"%sdvap%\configurations\%BE%-build-verify-nullcheck.xml" /analyze %1 %2 %3 %4 %5 %6 %7 %8
GOTO EXIT

:VIEW
IF "%SDXROOT%"=="" (
"%sdv%\bin\sdvcontroller.exe" %MSBuildProjectFile_SDV% %CONFIGURATION_SDV% %PLATFORM_SDV% %1 %2 %3 %4 %5 %6 %7 %8
GOTO EXIT
) ELSE (
start "SDVController" "%sdv%\bin\sdvcontroller.exe" %1 %2 %3 %4 %5 %6 %7 %8
GOTO EXIT
)

:HELP
"%smv%\bin\smv" /plugin:"%smv%\analysisplugins\sdv\bin\smvsdv.dll" /help
GOTO EXIT

:EXIT
