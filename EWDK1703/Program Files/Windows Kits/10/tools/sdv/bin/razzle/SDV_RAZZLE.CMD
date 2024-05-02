REM
REM Configure pre DDK build environment for SDV
REM

if /I "%1"=="pre"     goto PRE
if /I "%1"=="PRE"     goto PRE
if /I "%1"=="post"    goto POST
if /I "%1"=="POST"    goto POST

goto END

:PRE
@echo Saving OACR environment variables.
set SDV_OLD_BUILD_PATH=%BUILD_PATH%
rem see makefile.def CC_NAME and LINK_NAME
set STATIC_DRIVER_VERIFIER=%SDV%\bin\interceptor
rem set PATH=%SDV%\bin\interceptor;%PATH%

REM
REM Clearing OACR environment variables.
REM
@echo Clearing OACR environment variables.
set BUILD_PATH=
rem make sure oacr does not intercept SDV interceptor
call "%SDV%\bin\SDV_OACR.cmd" off

goto END

:POST
REM
REM Restoring OACR environment variables.
REM
@echo Restoring OACR environment variables.
set PATH=%SDV_OLD_PATH%
set BUILD_PATH=%SDV_OLD_BUILD_PATH%
rem see makefile.def CC_NAME and LINK_NAME
set STATIC_DRIVER_VERIFIER=
call "%SDV%\\bin\\SDV_OACR.cmd" on

REM
REM Finished
REM

:END
@echo Finished.
