@REM
@REM Copyright (c) Microsoft Corporation.  All rights reserved.
@REM
@REM
@REM Use of this source code is subject to the terms of the Microsoft
@REM premium shared source license agreement under which you licensed
@REM this source code. If you did not accept the terms of the license
@REM agreement, you are not authorized to use this source code.
@REM For the terms of the license, please see the license agreement
@REM signed by you and Microsoft.
@REM THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
@REM
@REM ============================================================
@REM  Script to copy Internal Platform.xml file to Platform.xml during installation
@REM  or uninstallation of StandaloneSDK
@REM ============================================================

@echo off
SETLOCAL

REM Copyright display
ECHO Microsoft (R) Copy Internal Platform Tool version 10.0.0
ECHO Copyright (c) Microsoft Corporation
ECHO All rights reserved.

REM Show usage text
set SHOW_HELP=
if /i "%~1" == "/?" set SHOW_HELP=1
if /i "%~1" == "-?" set SHOW_HELP=1
if /i "%~1" == "/help" set SHOW_HELP=1
if /i "%~1" == "-help" set SHOW_HELP=1
if /i "%SHOW_HELP%" == "1" (
    ECHO.
    ECHO CopyInternalPlatformtoPlatformXML.cmd copies InternalPlatform.xml to Platform.xml
    ECHO This command line utility does not take any arguments as input
    ECHO.
    ECHO Must be run from an elevated command prompt.
    EXIT /B 0
)

REM Check for elevation
fltmc >nul 2>&1
if ERRORLEVEL 1 (
    fsutil dirty query %systemdrive% >nul 2>&1
    if ERRORLEVEL 1 (
        ECHO Error: You must run this script from an elevated command prompt.
        EXIT /B 5
    ) else (
        ECHO Confirmed running as administrator.
    )
) else (
    ECHO Confirmed running as administrator.
)

ECHO Moving InternalPlatform.xml to Platform.xml in the SDK. 

REM Get SDK install folder from the registry
set SDKInstallFolder = ""
for /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\SOFTWARE\Wow6432Node\Microsoft\Microsoft SDKs\Windows\v10.0" /v InstallationFolder') DO SET SDKInstallFolder=%%B

if NOT EXIST "%SDKInstallFolder%" (
    for /F "tokens=2* delims=	 " %%A IN ('REG QUERY "HKLM\SOFTWARE\Microsoft\Microsoft SDKs\Windows\v10.0" /v InstallationFolder') DO SET SDKInstallFolder=%%B
)

REM Exit if you can't find the SDK install folder
if NOT EXIST "%SDKInstallFolder%" (
    ECHO Error: Can't find the SDK install folder: "%SDKInstallFolder%". Please install the Windows SDK before running this tool.
    EXIT /B 3
)
echo An SDK was found at the following location: %SDKInstallFolder%

set SDKVersion=10.0.15063.0
set PlatformsFolder=%SDKInstallFolder%Platforms\UAP\%SDKVersion%
set PlatformFileName=%PlatformsFolder%\Platform.xml
set InternalPlatformFileName=%PlatformsFolder%\InternalPlatform.xml

COPY /Y "%InternalPlatformFileName%" "%PlatformFileName%"

EXIT /B 0

ENDLOCAL