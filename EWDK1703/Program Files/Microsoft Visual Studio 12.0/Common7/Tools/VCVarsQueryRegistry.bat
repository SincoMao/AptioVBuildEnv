@call :GetWindowsSdkDir
@call :GetWindowsSdkExecutablePath32
@call :GetWindowsSdkExecutablePath64
@call :GetExtensionSdkDir
@call :GetVSInstallDir
@call :GetVCInstallDir
@call :GetFSharpInstallDir
@if "%1"=="32bit" (
	@call :GetFrameworkDir32
	@call :GetFrameworkVer32
)
@if "%2"=="64bit" (
	@call :GetFrameworkDir64
	@call :GetFrameworkVer64
)
@if "%1 %2"=="64bit 32bit" (
	@call :GetFrameworkDir64
	@call :GetFrameworkVer64
)
@SET Framework40Version=v4.0

@REM -----------------------------------------------------------------------
@REM Used by MsBuild to determine where to look in the registry for VCTargetsPath
@REM -----------------------------------------------------------------------
@SET VisualStudioVersion=12.0

@goto end

@REM -----------------------------------------------------------------------
:GetWindowsSdkDir
@set WindowsSdkDir=
@call :GetWindowsSdkDirHelper32 HKLM > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkDirHelper32 HKCU > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkDirHelper64 HKLM > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkDirHelper64 HKCU > nul 2>&1
@exit /B 0

:GetWindowsSdkDirHelper32
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\Microsoft SDKs\Windows\v8.1" /v "InstallationFolder"') DO (
	@if "%%i"=="InstallationFolder" (
		@SET "WindowsSdkDir=%%k"
	)
)
@if "%WindowsSdkDir%"=="" exit /B 1
@exit /B 0

:GetWindowsSdkDirHelper64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\Microsoft SDKs\Windows\v8.1" /v "InstallationFolder"') DO (
	@if "%%i"=="InstallationFolder" (
		@SET "WindowsSdkDir=%%k"
	)
)
@if "%WindowsSdkDir%"=="" exit /B 1
@exit /B 0

@REM -----------------------------------------------------------------------
:GetExtensionSdkDir
@set ExtensionSdkDir=

@if exist "%ProgramFiles%\Microsoft SDKs\Windows\v8.1\ExtensionSDKs\Microsoft.VCLibs\12.0\SDKManifest.xml" set ExtensionSdkDir=%ProgramFiles%\Microsoft SDKs\Windows\v8.1\ExtensionSDKs
@if exist "%ProgramFiles(x86)%\Microsoft SDKs\Windows\v8.1\ExtensionSDKs\Microsoft.VCLibs\12.0\SDKManifest.xml" set ExtensionSdkDir=%ProgramFiles(x86)%\Microsoft SDKs\Windows\v8.1\ExtensionSDKs

@if "%ExtensionSdkDir%"=="" exit /B 1
@exit /B 0

@REM -----------------------------------------------------------------------
:GetWindowsSdkExecutablePath32
@set WindowsSDK_ExecutablePath_x86=
@call :GetWindowsSdkExePathHelper HKLM > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkExePathHelper HKCU > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkExePathHelperWow6432 HKLM > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkExePathHelperWow6432 HKCU > nul 2>&1
@exit /B 0

:GetWindowsSdkExePathHelper
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\Microsoft SDKs\Windows\v8.1A\WinSDK-NetFx40Tools" /v "InstallationFolder"') DO (
	@if "%%i"=="InstallationFolder" (
		@SET "WindowsSDK_ExecutablePath_x86=%%k"
	)
)
@if "%WindowsSDK_ExecutablePath_x86%"=="" exit /B 1
@exit /B 0

:GetWindowsSdkExePathHelperWow6432
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\Microsoft SDKs\Windows\v8.1A\WinSDK-NetFx40Tools" /v "InstallationFolder"') DO (
	@if "%%i"=="InstallationFolder" (
		@SET "WindowsSDK_ExecutablePath_x86=%%k"
	)
)
@if "%WindowsSDK_ExecutablePath_x86%"=="" exit /B 1
@exit /B 0

@REM -----------------------------------------------------------------------
:GetWindowsSdkExecutablePath64
@set WindowsSDK_ExecutablePath_x64=
@call :GetWindowsSdkExePathHelper_x64 HKLM > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkExePathHelper_x64 HKCU > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkExePathHelperWow6432_x64 HKLM > nul 2>&1
@if errorlevel 1 call :GetWindowsSdkExePathHelperWow6432_x64 HKCU > nul 2>&1
@exit /B 0

:GetWindowsSdkExePathHelper_x64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\Microsoft SDKs\Windows\v8.1A\WinSDK-NetFx40Tools-x64" /v "InstallationFolder"') DO (
	@if "%%i"=="InstallationFolder" (
		@SET "WindowsSDK_ExecutablePath_x64=%%k"
	)
)
@if "%WindowsSDK_ExecutablePath_x64%"=="" exit /B 1
@exit /B 0

:GetWindowsSdkExePathHelperWow6432_x64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\Microsoft SDKs\Windows\v8.1A\WinSDK-NetFx40Tools-x64" /v "InstallationFolder"') DO (
	@if "%%i"=="InstallationFolder" (
		@SET "WindowsSDK_ExecutablePath_x64=%%k"
	)
)
@if "%WindowsSDK_ExecutablePath_x64%"=="" exit /B 1
@exit /B 0

@REM -----------------------------------------------------------------------
:GetVSInstallDir
@set VSINSTALLDIR=
@call :GetVSInstallDirHelper32 HKLM > nul 2>&1
@if errorlevel 1 call :GetVSInstallDirHelper32 HKCU > nul 2>&1
@if errorlevel 1 call :GetVSInstallDirHelper64  HKLM > nul 2>&1
@if errorlevel 1 call :GetVSInstallDirHelper64  HKCU > nul 2>&1
@exit /B 0

:GetVSInstallDirHelper32
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\VisualStudio\SxS\VS7" /v "12.0"') DO (
	@if "%%i"=="12.0" (
		@SET "VSINSTALLDIR=%%k"
	)
)
@if "%VSINSTALLDIR%"=="" exit /B 1
@exit /B 0

:GetVSInstallDirHelper64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\SxS\VS7" /v "12.0"') DO (
	@if "%%i"=="12.0" (
		@SET "VSINSTALLDIR=%%k"
	)
)
@if "%VSINSTALLDIR%"=="" exit /B 1
@exit /B 0

@REM -----------------------------------------------------------------------
:GetVCInstallDir
@set VCINSTALLDIR=
@call :GetVCInstallDirHelper32 HKLM > nul 2>&1
@if errorlevel 1 call :GetVCInstallDirHelper32 HKCU > nul 2>&1
@if errorlevel 1 call :GetVCInstallDirHelper64  HKLM > nul 2>&1
@if errorlevel 1 call :GetVCInstallDirHelper64  HKCU > nul 2>&1
@exit /B 0

:GetVCInstallDirHelper32
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\VisualStudio\SxS\VC7" /v "12.0"') DO (
	@if "%%i"=="12.0" (
		@SET "VCINSTALLDIR=%%k"
	)
)
@if "%VCINSTALLDIR%"=="" exit /B 1
@exit /B 0

:GetVCInstallDirHelper64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\SxS\VC7" /v "12.0"') DO (
	@if "%%i"=="12.0" (
		@SET "VCINSTALLDIR=%%k"
	)
)
@if "%VCINSTALLDIR%"=="" exit /B 1
@exit /B 0

@REM -----------------------------------------------------------------------
:GetFSharpInstallDir
@set FSHARPINSTALLDIR=
@call :GetFSharpInstallDirHelper32 HKLM > nul 2>&1
@if errorlevel 1 call :GetFSharpInstallDirHelper32 HKCU > nul 2>&1
@if errorlevel 1 call :GetFSharpInstallDirHelper64  HKLM > nul 2>&1
@if errorlevel 1 call :GetFSharpInstallDirHelper64  HKCU > nul 2>&1
@exit /B 0

:GetFSharpInstallDirHelper32
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\VisualStudio\12.0\Setup\F#" /v "ProductDir"') DO (
	@if "%%i"=="ProductDir" (
		@SET "FSHARPINSTALLDIR=%%k"
	)
)
@if "%FSHARPINSTALLDIR%"=="" exit /B 1
@exit /B 0

:GetFSharpInstallDirHelper64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\12.0\Setup\F#" /v "ProductDir"') DO (
	@if "%%i"=="ProductDir" (
		@SET "FSHARPINSTALLDIR=%%k"
	)
)
@if "%FSHARPINSTALLDIR%"=="" exit /B 1
@exit /B 0

@REM -----------------------------------------------------------------------
:GetFrameworkDir32
@set FrameworkDir32=
@call :GetFrameworkDir32Helper32 HKLM > nul 2>&1
@if errorlevel 1 call :GetFrameworkDir32Helper32 HKCU > nul 2>&1
@if errorlevel 1 call :GetFrameworkDir32Helper64  HKLM > nul 2>&1
@if errorlevel 1 call :GetFrameworkDir32Helper64  HKCU > nul 2>&1
@exit /B 0

:GetFrameworkDir32Helper32
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\VisualStudio\SxS\VC7" /v "FrameworkDir32"') DO (
	@if "%%i"=="FrameworkDir32" (
		@SET "FrameworkDIR32=%%k"
	)
)
@if "%FrameworkDir32%"=="" exit /B 1
@exit /B 0

:GetFrameworkDir32Helper64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\SxS\VC7" /v "FrameworkDir32"') DO (
	@if "%%i"=="FrameworkDir32" (
		@SET "FrameworkDIR32=%%k"
	)
)
@if "%FrameworkDIR32%"=="" exit /B 1
@exit /B 0

@REM -----------------------------------------------------------------------
:GetFrameworkDir64
@set FrameworkDir64=
@call :GetFrameworkDir64Helper32 HKLM > nul 2>&1
@if errorlevel 1 call :GetFrameworkDir64Helper32 HKCU > nul 2>&1
@if errorlevel 1 call :GetFrameworkDir64Helper64  HKLM > nul 2>&1
@if errorlevel 1 call :GetFrameworkDir64Helper64  HKCU > nul 2>&1
@exit /B 0

:GetFrameworkDir64Helper32
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\VisualStudio\SxS\VC7" /v "FrameworkDir64"') DO (
	@if "%%i"=="FrameworkDir64" (
		@SET "FrameworkDIR64=%%k"
	)
)
@if "%FrameworkDIR64%"=="" exit /B 1
@exit /B 0

:GetFrameworkDir64Helper64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\SxS\VC7" /v "FrameworkDir64"') DO (
	@if "%%i"=="FrameworkDir64" (
		@SET "FrameworkDIR64=%%k"
	)
)
@if "%FrameworkDIR64%"=="" exit /B 1
@exit /B 0

@REM -----------------------------------------------------------------------
:GetFrameworkVer32
@set FrameworkVer32=
@call :GetFrameworkVer32Helper32 HKLM > nul 2>&1
@if errorlevel 1 call :GetFrameworkVer32Helper32 HKCU > nul 2>&1
@if errorlevel 1 call :GetFrameworkVer32Helper64  HKLM > nul 2>&1
@if errorlevel 1 call :GetFrameworkVer32Helper64  HKCU > nul 2>&1
@exit /B 0

:GetFrameworkVer32Helper32
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\VisualStudio\SxS\VC7" /v "FrameworkVer32"') DO (
	@if "%%i"=="FrameworkVer32" (
		@SET "FrameworkVersion32=%%k"
	)
)
@if "%FrameworkVersion32%"=="" exit /B 1
@exit /B 0

:GetFrameworkVer32Helper64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\SxS\VC7" /v "FrameworkVer32"') DO (
	@if "%%i"=="FrameworkVer32" (
		@SET "FrameworkVersion32=%%k"
	)
)
@if "%FrameworkVersion32%"=="" exit /B 1
@exit /B 0

@REM -----------------------------------------------------------------------
:GetFrameworkVer64
@set FrameworkVer64=
@call :GetFrameworkVer64Helper32 HKLM > nul 2>&1
@if errorlevel 1 call :GetFrameworkVer64Helper32 HKCU > nul 2>&1
@if errorlevel 1 call :GetFrameworkVer64Helper64  HKLM > nul 2>&1
@if errorlevel 1 call :GetFrameworkVer64Helper64  HKCU > nul 2>&1
@exit /B 0

:GetFrameworkVer64Helper32
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Microsoft\VisualStudio\SxS\VC7" /v "FrameworkVer64"') DO (
	@if "%%i"=="FrameworkVer64" (
		@SET "FrameworkVersion64=%%k"
	)
)
@if "%FrameworkVersion64%"=="" exit /B 1
@exit /B 0

:GetFrameworkVer64Helper64
@for /F "tokens=1,2*" %%i in ('reg query "%1\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\SxS\VC7" /v "FrameworkVer64"') DO (
	@if "%%i"=="FrameworkVer64" (
		@SET "FrameworkVersion64=%%k"
	)
)
@if "%FrameworkVersion64%"=="" exit /B 1
@exit /B 0

@REM -----------------------------------------------------------------------
:end

