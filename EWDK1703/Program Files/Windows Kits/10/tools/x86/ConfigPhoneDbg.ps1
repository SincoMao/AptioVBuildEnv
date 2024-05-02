
<#
.SYNOPSIS
    Configures the kernel debugger KDNET settings for a Windows Phone
    currently attached to the computer in mass storage mode.
  
  PREREQUISITES 
    Must be executed with administrative rights.
    DISM from Windows 8 or higher is required.

  RUNNING FROM CMD.EXE
    cmd /c powershell -executionpolicy bypass -File <PathToThisFile>

.DESCRIPTION
    This configures the kernel debugger KDNET settings for a Windows Phone
    currently attached to the computer in mass storage mode.
    By default, the IP of the machine running the script is used, and the phone is configured for kernel debugging.
    This script must be run as administrator.
    BCDEdit from Windows 8 or higher must be in the machine PATH.

.PARAMETER HostIP
    IP of the host machine. This is optional. If specified, it will be used as the host IP.
    By default, the IP of the local PC will be used.

.PARAMETER PhonePartitionPath
    Path to the partition containing the phone bootloader. This is optional.
    If more than one phone is connected to the PC, this parameter must be specified to control which phone will be configured.
    If specified, this should be full path to the root of the phone bootloader partition.
    By default, all drives will be searched to try to find the phone partition.

.PARAMETER Disable
    Specify this switch to disable kernel debugging on the phone.
    If this switch is not specified, kernel debugging is enabled on the phone.

.EXAMPLE
    ./ConfigPhoneDbg.ps1
    Configure a phone for kernel debugging with the default settings.

.EXAMPLE
    ./ConfigPhoneDbg.ps1 -HostIP "111.222.333.44"
    Configure a phone for kernel debugging with a specified host IP.

.EXAMPLE
    ./ConfigPhoneDbg.ps1 -PhonePartitionPath "H:\EFIESP"
    Configure a phone for kernel debugging. The root path to the phone partition is specified to be "H:\EFIESP".

.EXAMPLE
    ./ConfigPhoneDbg.ps1 -Disable
    Disables kernel debugging for a phone

#>

param (
        [Parameter (Mandatory=$false, Position=0, HelpMessage="Enter the IP address of the host machine.")]
        [string]$HostIP,
        
        [Parameter (Mandatory=$false, Position=1, HelpMessage="Enter the path to the phone partition.")]
        [string]$PhonePartitionPath,
        
        [Parameter (Mandatory=$false, HelpMessage="Indicate that kernel debugging should be disabled.")]
        [switch]$Disable
       )

#
# Validate the the script is run as admin
#
function Validate-AdminAccess
{
    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
        [Security.Principal.WindowsBuiltInRole]::Administrator))
    {
        Write-Host -fore red -back black "This script must be executed as an administrator."
        return $false
    }
    return $true
}


#
# Validate the input parameters
#
function Validate-Parameters
{
    # Validate the host IP
    if (-Not [String]::IsNullOrEmpty($HostIP)) 
    {
        $isHostIpValid = ($HostIP -As [System.Net.IPAddress]) -As [Bool]
        if (-Not $isHostIpValid) 
        {
            Write-Host -fore red -back black "The specified HostIP '$HostIp' is invalid."
            return $false
        }
    }

    # Validate the phone partition path
    if (-Not [String]::IsNullOrEmpty($PhonePartitionPath) -and !(Test-Path $PhonePartitionPath))
    {
        Write-Host -fore red -back black "The specified PhonePartitionPath '$PhonePartitionPath' is invalid or does not exist."
        return $false
    }

    return $true;
}

#
# Get the path to the phone partition
#
function Get-PhonePartitionPath
{
    try
    {
        # Get all partitions with an assigned drive letter
        $partitions = Get-Partition | Where-Object –FilterScript { $_.Type -eq "Basic" }
    }
    catch{
        return
    }

    # Find the first EFIESP partition
    foreach ($partition in $partitions) 
    {
        foreach ($accessPath in $partitions.AccessPaths)
        {
            if ($accessPath -match ":\\EFIESP\\") 
            {
                return $accessPath;
            }
        }
    }

    # If there is no EFIESP bootloader path, find the BOOTME path
    foreach ($partition in $partitions) 
    {
        foreach ($accessPath in $partitions.AccessPaths)
        {
            if (Join-Path $accessPath "efi\Microsoft\Boot\BCD" | Test-Path)
            {
                return $accessPath;
            }
        }
    }

    # The boot partition was not found, return nothing
}


#
# Get the IP of the host machine
#
function Get-HostIP
{
    $firstIpv4address = [Net.DNS]::GetHostAddresses("") | Where-Object { $_.AddressFamily -eq 'InterNetwork' } | Select-Object -First 1

    if ($firstIpv4address) 
    {
        return $firstIpv4Address.IPAddressToString
    }

    # No valid IPv4 address found, return nothing
}

#
# Write out the error that occured during the execution of a command
#
function Print-ExecError($exeCmd, $params, $exitCode, $cmdOutput)
{
    Write-Host -fore red -back black "Executing the following command failed with exit code $exitCode :"
    Write-Host -fore red -back black "    $exeCmd $params"
    Write-Host -fore red -back black
    Write-Host -fore red -back black "Command Output:"
    Write-Host -fore red -back black "    $cmdOutput"
}

#
# Enable KDNet over USB on a phone
#
function Enable-KDNet([string]$deviceBcdPath, [string]$hostIp, [array]$targetIDs)
{
    Write-Host "Configuring KDNet over USB..."
    Write-Host "Host IP: $hostIp"

    $busParams = 1

    # Call BCDEdit to set the kernel debugger settings
    $params = @("/store", $deviceBcdPath, "/dbgsettings", "net", "HOSTIP:$hostIp", "PORT:50000", "KEY:1.2.3.4")
    Write-Host -back black "  " $BcdEditCmd $params
    $bcdEditOutput = & $BcdEditCmd $params
    if ($LASTEXITCODE -ne 0) 
    {
        Print-ExecError $BcdEditCmd $params $LASTEXITCODE $bcdEditOutput
        return -1
    }
    
    # Enable kernel debugging 
    $params = @("/store", $deviceBcdPath, "/set", "{default}", "debug", "on")
    Write-Host -back black "  " $BcdEditCmd $params
    $bcdEditOutput = & $BcdEditCmd $params
    if ($LASTEXITCODE -ne 0) 
    { 
        Print-ExecError $BcdEditCmd $params $LASTEXITCODE $bcdEditOutput
        return -1
    }

    # Set KDNET as the debug transport
    $params = @("/store", $deviceBcdPath, "/set", "{default}", "dbgtransport", "kdnet.dll")
    Write-Host -back black "  " $BcdEditCmd $params
    $bcdEditOutput = & $BcdEditCmd $params
    if ($LASTEXITCODE -ne 0) 
    { 
        Print-ExecError $BcdEditCmd $params $LASTEXITCODE $bcdEditOutput
        return -1
    }

    # Set the bus params
    $params = @("/store", $deviceBcdPath, "/set", "{dbgsettings}", "busparams", "$busParams")
    Write-Host -back black "  " $BcdEditCmd $params
    $bcdEditOutput = & $BcdEditCmd $params
    if ($LASTEXITCODE -ne 0) 
    { 
        Print-ExecError $BcdEditCmd $params $LASTEXITCODE $bcdEditOutput
        return -1
    }
    
    Write-Host "KDNET settings configured successfully."
    Write-Host
    Write-Host "Command line to launch debugger: [ windbg.exe -k net:Port=50000,Key=1.2.3.4 ]"
    return 0
}


#
# Disable KDNet over USB on a phone
#
function Disable-KDNet([string]$deviceBcdPath)
{
    Write-Host "Disabling debugging..."
    
    # Disable kernel debugging
    $params = @("/store", $deviceBcdPath, "/set", "{default}", "debug", "off")
    Write-Host -back black "  " $BcdEditCmd $params
    $bcdEditOutput = & $BcdEditCmd $params
    if ($LASTEXITCODE -ne 0) 
    { 
        Print-ExecError $BcdEditCmd $params $LASTEXITCODE $bcdEditOutput
        return -1
    }
    
    Write-Host "Debugging was disabled"
    return 0
}

#
# Main function
#
function Config-PhoneKernelDbg
{
    if (!(Validate-AdminAccess))
    {
        return -1
    }
    if (!(Validate-Parameters))
    {
        return -1;
    }

    # Find the boot partition path
    if ([String]::IsNullOrEmpty($PhonePartitionPath))
    {
        $PhonePartitionPath = Get-PhonePartitionPath
    }
    if ([String]::IsNullOrEmpty($PhonePartitionPath)) 
    {
        Write-Host -fore red -back black "Could not find the 'EFIESP' or 'BOOTME' partition. Make sure the phone is in Mass Storage mode and that you are running the script as administrator."
        Write-Host -fore red -back black "You can also manually specify the path using the 'PhoneBootloaderPartitionPath' argument."
        return -1;
    }
   
    # Find the device BCD
    $deviceBcdPath = Join-Path $PhonePartitionPath "efi\Microsoft\Boot\BCD"
    if (!(Test-Path $deviceBcdPath)) 
    {
        Write-Host -fore red -back black "Could not find the device BCD at location '$deviceBcdPath'."
        Write-Host -fore red -back black "Make sure that '$PhonePartitionPath' is the phone EFIESP partiton."
        return -1;
    }

    # Find the host IP address
    if ([String]::IsNullOrEmpty($HostIP))
    {
        $HostIP = Get-HostIP
    }
    if ([String]::IsNullOrEmpty($HostIP)) 
    {
        Write-Host -fore red -back black "Could not find a valid IPv4 address for the local machine."
        Write-Host -fore red -back black "You can manually specify the host IP using the 'HostIP' argument."
        return -1;
    }

    if ($Disable) {
        return Disable-KDNet $deviceBcdPath
    }
    else {
        return Enable-KDNet $deviceBcdPath $HostIP
    }
}

#
# Script portion
#
Write-Host
$BcdEditCmd = "bcdedit.exe"
$retVal = Config-PhoneKernelDbg
Write-Host
Exit $retVal