setlocal
@echo off

set DST=%1
if not exist "%DST%" set DST=

if "%DST%" == "" goto :Usage

echo Setting up FFU binaries in directory: %DST%

rem
rem Set up binaries in the target root
rem

echo. > %DST%\startup.nsh
echo \efi\boot\bootmgrfw.efi > %DST%\startup.nsh


robocopy %~dp0 %DST%\efi\boot bootarm.efi
ren %DST%\efi\boot\bootarm.efi bootmgrfw.efi

robocopy %~dp0 %DST%\efi\Microsoft\boot BCD

robocopy %~dp0 %DST%\Windows\System32\boot efisimpleio.dll
ren %DST%\Windows\System32\boot\efisimpleio.dll efisimpleio.efi

robocopy %~dp0 %DST%\Windows\System32\boot ffuloader.efi


rem
rem Edit BCD to force flashing on boot
rem

set BCD=%DST%\efi\Microsoft\boot\BCD

set GUID={f78248a0-9a19-40aa-a1ec-a06882b635c6}

rem Set up bootmgr for immediate FFU
bcdedit /store %BCD% /set {bootmgr} bootsequence %GUID% /addfirst

bcdedit /store %BCD% /set {bootmgr} timeout 0

bcdedit /store %BCD% /set {bootmgr} displaybootmenu No

bcdedit /store %BCD% /set {globalsettings} testsigning Yes

bcdedit /store %BCD% /set {globalsettings} nointegritychecks Yes

rem Set up FFULoader in bootsequence so we enter the app
bcdedit /store %BCD% /create %GUID% /application osloader /d "FFU Loader (programmatic)"
 
bcdedit /store %BCD% /set %GUID% device boot
 
bcdedit /store %BCD% /set %GUID% inherit {bootloadersettings}
 
bcdedit /store %BCD% /set %GUID% path \windows\system32\boot\ffuloader.efi


rem Set ForceFFU bit in BCD so we don't continue booting after entering FFULoader
bcdedit /store %BCD% /set {globalsettings} custom:26000203 Yes

exit /b 0

:Usage
echo.
echo Usage: applyffusettings.bat ^<destination^>
echo.
echo Copies the contents of the ffubinaries directory to the
echo appropriate locations underneath the destination root.
echo After this script is run, the destination will contain
echo a valid minimal set of binaries such that FFU will launch on
echo device boot.
echo.
echo This script requires bcdedit.exe to be in the path to function
echo properly.
exit /b 1
