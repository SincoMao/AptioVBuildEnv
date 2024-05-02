#Requires -RunAsAdministrator 

if ($env:PROCESSOR_ARCHITECTURE -eq "AMD64" -or $env:PROCESSOR_ARCHITECTURE -eq "IA64") {$TARGET_ARCHITECTURE = "x64"}
elseif ($env:PROCESSOR_ARCHITECTURE -eq "x86") {$TARGET_ARCHITECTURE = "x86"}
elseif ($env:PROCESSOR_ARCHITECTURE -eq "ARM") {$TARGET_ARCHITECTURE = "arm"}

msiexec /i "$PSScriptRoot\Setup\Windows Driver Testing Framework (WDTF) Runtime Libraries-${TARGET_ARCHITECTURE}_en-us.msi" /qb  /l*v "$PSScriptRoot\Setup\Logs\Windows Driver Testing Framework (WDTF) Runtime Libraries-${TARGET_ARCHITECTURE}_en-us.msi_install.log" | Out-Null
& "$PSScriptRoot\Setup\${TARGET_ARCHITECTURE}\Wex.Services.exe" /install:Te.service
Set-Service Te.Service -startuptype "automatic"
Start-Service Te.Service