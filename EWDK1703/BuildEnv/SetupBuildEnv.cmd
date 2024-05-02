@ECHO OFF
set WDK_CURRENT_KIT_VERSION=10
set DisableRegistryUse=True

set EnterpriseWDK=True

set "BuildLabSetupRoot=%~dp0"
set "BuildLabSetupRoot=%BuildLabSetupRoot:~0,-1%"
for %%d in (%BuildLabSetupRoot%) do set BuildLabSetupRoot=%%~dpd

if "%BuildLabSetupRoot:~-1%" == "\" set BuildLabSetupRoot=%BuildLabSetupRoot:~0,-1%
set "BuildLabSetupFilesRoot=%BuildLabSetupRoot%\Program Files"

REM   Calling IHV/OEM specific Environment Setup before Microsoft environment configs in the case of overrides
REM    Pass in %2 for targeted parameters to be pass for platform specific settings.
if exist "%BuildLabSetupRoot%\BuildEnv\SetDevEnv.cmd" (call %BuildLabSetupRoot%\BuildEnv\SetDevEnv.cmd %2)

REM Check to see if VCInstallDir_140 environment is set. If not, set to default enterprise WDK path.
if  "%VCInstallDir_140%" == "" set "VCInstallDir_140=%BuildLabSetupFilesRoot%\Microsoft Visual Studio 14.0\VC\"
set "VCInstallDir=%VCInstallDir_140%"

REM Check to see if VSnstallDir_140 environment is set. If not, set to default enterprise WDK path.
if "%VSInstallDir_140%" ==""  set "VSInstallDir_140=%BuildLabSetupFilesRoot%\Microsoft Visual Studio 14.0\"
set "VSInstallDir=%VSInstallDir_140%"

REM Check to see if VCRedistPath_140 environment is set. If not, set to default enterprise WDK path.
if "%VCRedistPath_140%" ==""  set "VCRedistPath_140=%BuildLabSetupFilesRoot%\Microsoft Visual Studio 14.0\VC\redist"
set "VCRedistPath=%VCRedistPath_140%"

REM Setting WindowsSdkDir_81 to 10 SDK path forces Dev12 to use the 10 SDK in order to make Dev12 compatible with Threshold.
set  "WindowsSdkDir=%BuildLabSetupFilesRoot%\Windows Kits\10\"
set  "WindowsSdkDir_81A=%BuildLabSetupFilesRoot%\Microsoft SDKs\Windows\v8.1A\"
set  "WindowsSdkDir_82A=%BuildLabSetupFilesRoot%\Microsoft SDKs\Windows\v8.2A\"
set  "WDKContentRoot=%BuildLabSetupFilesRoot%\Windows Kits\10\"

REM Setting Framework paths
set  "TrackerSdkPathX64=%BuildLabSetupFilesRoot%\MSBuild\14.0\Bin\amd64"
set  "TrackerSdkPathX86=%BuildLabSetupFilesRoot%\MSBuild\14.0\Bin"

REM Setting Framework paths
set  "MSBuildToolsRoot=%BuildLabSetupFilesRoot%\MSBuild\14.0\Bin\"
set  "MSBuildToolsRoot=%BuildLabSetupFilesRoot%\MSBuild\14.0\Bin\"
set  "MSBuildProgramfiles32=%BuildLabSetupFilesRoot%\"
set  "MSBuildExtensionsPath=%BuildLabSetupFilesRoot%\MSBuild\"
set  "MSBuildExtensionsPath32=%BuildLabSetupFilesRoot%\MSBuild\"
set  "MSBuildExtensionsPath64=%BuildLabSetupFilesRoot%\MSBuild\"
set  "FrameworkDir_110=%SystemRoot%\Microsoft.NET\Framework\"
set  "FrameworkDir_120=%SystemRoot%\Microsoft.NET\Framework\"
set  "FrameworkDir_140=%SystemRoot%\Microsoft.NET\Framework\"
set  "FrameworkSdkRoot=%BuildLabSetupFilesRoot%\Microsoft SDKs\Windows\v10.0A\"
Set  "FrameworkPathOverride=%BuildLabSetupFilesRoot%\Reference Assemblies\Microsoft\Framework\.NETFramework\v4.7\"
set  "TargetFrameworkSDKToolsDirectory=%BuildLabSetupFilesRoot%\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7 Tools\"
Set  "DotNetSDKRoot=%BuildLabSetupFilesRoot%\Windows Kits\NETFXSDK\4.7\"
set  "VCTargetsPath12=%BuildLabSetupFilesRoot%\MSBuild\Microsoft.Cpp\v4.0\V140\"
set  "VCTargetsPath=%VCTargetsPath12%"
set  "VisualStudioVersion=14.0"
set  "MsBuildCppTaskAssemblyRoot=%FrameworkPathOverride%"
set  "UCRTContentRoot=%WDKContentRoot%"
set  "UniversalCRTSdkDir=%WDKContentRoot%"
set  "MSBUILDSDKREFERENCEDIRECTORY=%BuildLabSetupFilesRoot%"


if "%1" == "" (
    set "MsBuildBinRoot=%BuildLabSetupFilesRoot%\MSBuild\14.0\Bin\"
    set Platform=x86
    set "path=%BuildLabSetupRoot%\System;%WindowsSdkDir%bin\x86;%VCInstallDir%bin\;%VCRedistPath%\x86\Microsoft.VC140.CRT\;%BuildLabSetupRoot%\Program Files\Microsoft Visual Studio 12.0\VC\redist\x86\Microsoft.VC120.CRT;%WDKContentRoot%Redist\ucrt\DLLs\x86;%path%"
)

if /i "%1" == "x86" (
    set "MsBuildBinRoot=%BuildLabSetupFilesRoot%\MSBuild\14.0\Bin\"
    set Platform=x86
    set "path=%BuildLabSetupRoot%\System;%WindowsSdkDir%bin\x86;%VCInstallDir%bin\;%VCRedistPath%\x86\Microsoft.VC140.CRT\;%BuildLabSetupRoot%\Program Files\Microsoft Visual Studio 12.0\VC\redist\x86\Microsoft.VC120.CRT;%WDKContentRoot%Redist\ucrt\DLLs\x86;%path%"
)

if /i "%1" == "x86_amd64" (
    set "MsBuildBinRoot=%BuildLabSetupFilesRoot%\MSBuild\14.0\Bin\"
    set Platform=x64
    set "path=%BuildLabSetupRoot%\System;%WindowsSdkDir%bin\x86;%VCInstallDir%bin\x86_amd64\;%VCInstallDir%bin\;%VCRedistPath%\x86\Microsoft.VC140.CRT\;%BuildLabSetupRoot%\Program Files\Microsoft Visual Studio 12.0\VC\redist\x86\Microsoft.VC120.CRT;%WDKContentRoot%Redist\ucrt\DLLs\x86;%path%"
)
 
if /i "%1" == "amd64" (
    set "MsBuildBinRoot=%BuildLabSetupFilesRoot%\MSBuild\14.0\Bin\amd64\"
    set Platform=x64
    set "path=%BuildLabSetupRoot%\System64;%WindowsSdkDir%bin\x64;%VCInstallDir%bin\amd64\;%VCRedistPath%\x64\Microsoft.VC140.CRT\;%BuildLabSetupRoot%\Program Files\Microsoft Visual Studio 12.0\VC\redist\x86\Microsoft.VC120.CRT;%WDKContentRoot%Redist\ucrt\DLLs\x64;%path%"
)

if /i "%1" == "x86_arm" (
    set "MsBuildBinRoot=%BuildLabSetupFilesRoot%\MSBuild\14.0\Bin\"
    set Platform=Arm
    set "path=%BuildLabSetupRoot%\System;%WindowsSdkDir%bin\x86;%VCInstallDir%bin\x86_arm\;%VCInstallDir%bin\;%VCRedistPath%\x86\Microsoft.VC140.CRT\;%BuildLabSetupRoot%\Program Files\Microsoft Visual Studio 12.0\VC\redist\x86\Microsoft.VC120.CRT;%WDKContentRoot%Redist\ucrt\DLLs\x86;%path%"
 
)
if /i "%1" == "x86_arm64" (
    set "MsBuildBinRoot=%BuildLabSetupFilesRoot%\MSBuild\14.0\Bin\"
    set Platform=ARM64
    set "path=%BuildLabSetupRoot%\System;%WindowsSdkDir%bin\x86;%VCInstallDir%bin\x86_arm64;%VCInstallDir%bin\;%VCRedistPath%\x86\Microsoft.VC140.CRT\;%BuildLabSetupRoot%\Program Files\Microsoft Visual Studio 12.0\VC\redist\x86\Microsoft.VC120.CRT;%WDKContentRoot%Redist\ucrt\DLLs\x86;%path%"
)

set "path=%WDKContentRoot%\Tools\bin\i386;%BuildLabSetupFilesRoot%\Microsoft Visual Studio 14.0\Common7\IDE;%path%"
set "path=%MsBuildBinRoot%;%path%"


title "Vs2015 & WDK Build Env WDKContentRoot: %WDKContentRoot%"
@ECHO ON
