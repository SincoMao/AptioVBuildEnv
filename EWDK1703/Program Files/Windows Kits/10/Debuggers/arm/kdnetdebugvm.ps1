#
# Argument initialization
#

$nextarg = "none"
$DebugPort = "unassigned"
$targetcomputer = "."
$VMName = ""
$VMGuid = ""
$AutoAssign = "false"
$DebugOff = "false"

function funHelp()
{
$helpText=@"

DESCRIPTION:
NAME: kdnetdebugvm.ps1
Displays (and optionally sets) the port used to network debug a VM.

PARAMETERS: 
-computerName Specifies the name of the computer on which to run the script
-help         Displays help
-vmname       (optional) Name of the VM of interest
-vmguid       (optional) GUID of the VM of interest
-port         (optional) Network port to use for debugging
-debugoff
-autoassign

Either vmname or vmguid must be specified to identify the VM, but not both.
Note that vmname may not uniquely identify the VM, but vmguid does.

SYNTAX:
kdnetdebugvm.ps1 [-computerName targetcomputer] [-vmname NameOfVM] [-vmguid GuidOfVM] [-port PortNumber]

"@
$helpText
exit
}


foreach ($argument in $args)
{
    # parse commands with no following arguments
    switch ($argument)
    {
        "?"     {funHelp}
        "help"  {funHelp}
        "-help" {funHelp}
        "/?"    {funHelp}
        "-?"    {funHelp}
        "autoassign"    {$AutoAssign = "true"}
        "-autoassign"   {$AutoAssign = "true"}
        "/autoassign"   {$AutoAssign = "true"}
        "debugoff"        {$DebugOff = "true"}
        "-debugoff"       {$DebugOff = "true"}
        "/debugoff"       {$DebugOff = "true"}
        default {}
    }

    # parse values that followed a switch

    switch ($nextarg)
    {
        "vmname"        {$VMName = $argument}
        "-vmname"       {$VMName = $argument}
        "/vmname"       {$VMName = $argument}
        "vmguid"        {$VMGuid = $argument}
        "-vmguid"       {$VMGuid = $argument}
        "/vmguid"       {$VMGuid = $argument}
        "port"          {$DebugPort = $argument}
        "-port"         {$DebugPort = $argument}
        "/port"         {$DebugPort = $argument}
        "computername"  {$targetcomputer = $argument}
        "-computername" {$targetcomputer = $argument}
        "/computername" {$targetcomputer = $argument}
        default         {}
    }

    $nextarg = $argument
}

if (($VMName -eq "") -and ($VMGuid -eq ""))
{
    funHelp
}

if (($VMName -ne "") -and ($VMGuid -ne ""))
{
    funHelp
}

$ns = "root\virtualization\v2"
$VMWPName = "$env:windir\system32\vmwp.exe"

#Get a VMManagementService object
$VMManagementService = gwmi -class "Msvm_VirtualSystemManagementService" -namespace $ns -computername $targetcomputer

#Get the VM object that we want to modify
if ($VMName -ne "")
{
    $VM = Get-VM -computername $targetcomputer -VMName $VMName
}

if ($VMGuid -ne "")
{
    $VM = Get-VM -computername $targetcomputer -Id $VMGuid
}

#Get the VirtualSystemGlobalSettingData of the VM we want to modify
$VMSystemGlobalSettingData = gwmi -namespace $ns -computername $targetcomputer -class Msvm_VirtualSystemSettingData | ? { $_.ConfigurationID -eq $VM.Id }

# Set a new debugport
if ($DebugPort -ne "unassigned")
{
    #Change the ElementName property
    $VMSystemGlobalSettingData.DebugPort = $DebugPort
    $VMSystemGlobalSettingData.DebugPortEnabled = 1

    $VMManagementService.ModifySystemSettings($VMSystemGlobalSettingData.GetText(1))
    $FWRuleName = "SynthDebugInboundRule-$DebugPort"
    New-NetFirewallRule -DisplayName $FWRuleName -Program $VMWPName -Protocol UDP -Action Allow -Direction Inbound -LocalPort $DebugPort
}

# Enable auto assigned debug ports
if ($AutoAssign -ne "false")
{
    #Change the ElementName property
    $VMSystemGlobalSettingData.DebugPortEnabled = 2
    $VMManagementService.ModifySystemSettings($VMSystemGlobalSettingData.GetText(1))
    Write-Host -Foreground Yellow "Firewall Ports for autoassign mode can be opened only after the VM is started."
}

# Turn off debugging
if ($DebugOff -ne "false")
{
    $DebugPort = $VMSystemGlobalSettingData.DebugPort
    #Change the ElementName property
    $VMSystemGlobalSettingData.DebugPortEnabled = 0
    $VMSystemGlobalSettingData.DebugPort = 0
    $VMManagementService.ModifySystemSettings($VMSystemGlobalSettingData.GetText(1))
    # May throw an exception if the rule did not exist already.
    # If two rules exist with the same name, both will be deleted.
    if ($DebugPort -ne 0)
    {
        $FWRuleName = "SynthDebugInboundRule-$DebugPort"
        Remove-NetFirewallRule -DisplayName $FWRuleName
    }
}

$VMSystemGlobalSettingData

exit

# SIG # Begin signature block
# MIIiUAYJKoZIhvcNAQcCoIIiQTCCIj0CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDbHDLYuqp9Du8W
# ZSYoLwjEyhkYywkzwemxEtpUqBqajKCCC48wggUXMIID/6ADAgECAhMzAAABVWn/
# trcDzpKuAAAAAAFVMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTAwHhcNMTcwMTE4MTczNzE1WhcNMTgwNDEyMTczNzE1WjCBjjEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjENMAsGA1UECxMETU9Q
# UjEpMCcGA1UEAxMgTWljcm9zb2Z0IFdpbmRvd3MgS2l0cyBQdWJsaXNoZXIwggEi
# MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC1aU/qQl3Y54jwYELDfFJmqTmO
# ak2vaz2d+V+df0fnIh5kpfZUfrFNZfAayKfkyKBNvIhK1CqjssBa/gb205DjNysd
# lze+Cl7hGegxumJuQuCYI03BknY9Xs21k+TG6vPja2b5dP11ZdMafjbIimJpPyQa
# uzlUu+qLtrlDNRubkiEB9l+kCfgrgVnjuWoneBOZuRDg4ML/fCElOeAKLVQkyYM/
# uQQUubgnoYINmCc2hlGVs13Ev1jSkm2xub4R1m7LVzH47thpaauMmLyCFy9rFm5k
# TMA9f1sR8KdGgXk8WewEUfzipygduRSEQwibUMUi/IVZx9yHPSkY5kKTCPmlAgMB
# AAGjggF7MIIBdzAfBgNVHSUEGDAWBgorBgEEAYI3CgMUBggrBgEFBQcDAzAdBgNV
# HQ4EFgQUPmZLaJa2HNVV0z4Pcmtb1/DASZswUgYDVR0RBEswSaRHMEUxDTALBgNV
# BAsTBE1PUFIxNDAyBgNVBAUTKzIyOTkwMytmNjkzMGU4YS0wNmNmLTRlMWQtOGJk
# Yy0yMTQ4YTdhOTk5MWYwHwYDVR0jBBgwFoAU5vxfe7siAFjkck619CF0IzLm76ww
# VgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9j
# cmwvcHJvZHVjdHMvTWljQ29kU2lnUENBXzIwMTAtMDctMDYuY3JsMFoGCCsGAQUF
# BwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3Br
# aS9jZXJ0cy9NaWNDb2RTaWdQQ0FfMjAxMC0wNy0wNi5jcnQwDAYDVR0TAQH/BAIw
# ADANBgkqhkiG9w0BAQsFAAOCAQEA6B6g529lVcNJvQe1gBPA1fEnepxIqWBy9BUA
# n6hHP26LFQqPTavgtlM9kUhAkzcQtrqWHP0CA8NCe5onBno5qsWWKfHIpqniIDeh
# /GfCcsDtNdniNwxcxF2IP9rT/lirNZKALV25Qr/tLC/fdLPXNSp6Roy6Lhzxx6OZ
# WSeZ7iLTliklM8kbmFLSXpkDH3RzPv3n6j6kTA5njCLJ//wlVBe8n24dfLosq5yT
# 52wRSdsnh4T1NxKuT0BvYSyGLERVSXUy1qXyvRkuUVQfgOLeme34nZrzVaFlyyOy
# 3WU0lypOHKhnCqFhIWuqlEe9p13YrcU0S65nBgsQw7Fzm/CsaDCCBnAwggRYoAMC
# AQICCmEMUkwAAAAAAAMwDQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMw
# EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVN
# aWNyb3NvZnQgQ29ycG9yYXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENl
# cnRpZmljYXRlIEF1dGhvcml0eSAyMDEwMB4XDTEwMDcwNjIwNDAxN1oXDTI1MDcw
# NjIwNTAxN1owfjELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEo
# MCYGA1UEAxMfTWljcm9zb2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMDCCASIwDQYJ
# KoZIhvcNAQEBBQADggEPADCCAQoCggEBAOkOZFB5Z7XE4/0JAEyelKz3VmjqRNjP
# xVhPqaV2fG1FutM5krSkHvn5ZYLkF9KP/UScCOhlk84sVYS/fQjjLiuoQSsYt6JL
# bklMaxUH3tHSwokecZTNtX9LtK8I2MyI1msXlDqTziY/7Ob+NJhX1R1dSfayKi7V
# hbtZP/iQtCuDdMorsztG4/BGScEXZlTJHL0dxFViV3L4Z7klIDTeXaallV6rKIDN
# 1bKe5QO1Y9OyFMjByIomCll/B+z/Du2AEjVMEqa+Ulv1ptrgiwtId9aFR9UQucbo
# qu6Lai0FXGDGtCpbnCMcX0XjGhQebzfLGTOAaolNo2pmY3iT1TDPlR8CAwEAAaOC
# AeMwggHfMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBTm/F97uyIAWORyTrX0
# IXQjMubvrDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYw
# DwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoY
# xDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtp
# L2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYB
# BQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDCBnQYDVR0gBIGV
# MIGSMIGPBgkrBgEEAYI3LgMwgYEwPQYIKwYBBQUHAgEWMWh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9QS0kvZG9jcy9DUFMvZGVmYXVsdC5odG0wQAYIKwYBBQUHAgIw
# NB4yIB0ATABlAGcAYQBsAF8AUABvAGwAaQBjAHkAXwBTAHQAYQB0AGUAbQBlAG4A
# dAAuIB0wDQYJKoZIhvcNAQELBQADggIBABp071dPKXvEFoV4uFDTIvwJnayCl/g0
# /yosl5US5eS/z7+TyOM0qduBuNweAL7SNW+v5X95lXflAtTx69jNTh4bYaLCWiMa
# 8IyoYlFFZwjjPzwek/gwhRfIOUCm1w6zISnlpaFpjCKTzHSY56FHQ/JTrMAPMGl/
# /tIlIG1vYdPfB9XZcgAsaYZ2PVHbpjlIyTdhbQfdUxnLp9Zhwr/ig6sP4GubldZ9
# KFGwiUpRpJpsyLcfShoOaanX3MF+0Ulwqratu3JHYxf6ptaipobsqBBEm2O2smmJ
# BsdGhnoYP+jFHSHVe/kCIy3FQcu/HUzIFu+xnH/8IktJim4V46Z/dlvRU3mRhZ3V
# 0ts9czXzPK5UslJHasCqE5XSjhHamWdeMoz7N4XR3HWFnIfGWleFwr/dDY+Mmy3r
# tO7PJ9O1Xmn6pBYEAackZ3PPTU+23gVWl3r36VJN9HcFT4XG2Avxju1CCdENduMj
# VngiJja+yrGMbqod5IXaRzNij6TJkTNfcR5Ar5hlySLoQiElihwtYNk3iUGJKhYP
# 12E8lGhgUu/WR5mggEDuFYF3PpzgUxgaUB04lZseZjMTJzkXeIc2zk7DX7L1PUdT
# tuDl2wthPSrXkizON1o+QEIxpB8QCMJWnL8kXVECnWp50hfT2sGUjgd7JXFEqwZq
# 5tTG3yOalnXFMYIWFzCCFhMCAQEwgZUwfjELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9zb2Z0IENvZGUgU2lnbmluZyBQ
# Q0EgMjAxMAITMwAAAVVp/7a3A86SrgAAAAABVTANBglghkgBZQMEAgEFAKCCAQQw
# GQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisG
# AQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIPXanYReDke4A4xfLyXay0/Smam1pIYj
# 32l27y5HOVS4MDwGCisGAQQBgjcKAxwxLgwsVmRKNkplTVV5cmpselFLcGNYS24z
# WkNMTjhkM2JlSCtiY0VKVGEyZVJXND0wWgYKKwYBBAGCNwIBDDFMMEqgJIAiAE0A
# aQBjAHIAbwBzAG8AZgB0ACAAVwBpAG4AZABvAHcAc6EigCBodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vd2luZG93czANBgkqhkiG9w0BAQEFAASCAQB4S2i8BroWc9++
# /3R4qXJFphLoONHas672tO+DD13mxaIZiEUtqmt+wXrrpTAuFm3ouIp8MdnWqLaj
# /V0OKtq7iEHXMwntSUwcB8138pf/Mzp684x0ooqvu3IBARHbNU+0KwwgCI0CaVyl
# n4f+YUQWKSaPrAvSADmEP/b0u4bMNvvtefnnJju+e3btgdNxW7w5DtX8MiZDOh6R
# UxdJdRdvdM3NTiR+o0fV4ZdZdO4ICWsrQF+yKmrdQvuHcYnBqLLTadtNn9Mmy0PI
# jvi1MTnX0kU8V4M9PZaACVbLaE4VcfW1RI1jWJJPM8eHRvufy5mHhurRtAc1qfo/
# mI2s+BMDoYITSjCCE0YGCisGAQQBgjcDAwExghM2MIITMgYJKoZIhvcNAQcCoIIT
# IzCCEx8CAQMxDzANBglghkgBZQMEAgEFADCCAT0GCyqGSIb3DQEJEAEEoIIBLASC
# ASgwggEkAgEBBgorBgEEAYRZCgMBMDEwDQYJYIZIAWUDBAIBBQAEIAzhYFegMcf7
# i3tw/kPpfWVHrYEIdvrMwlOfNTd8NXMuAgZYr6bxrloYEzIwMTcwMzE5MTc1NjQw
# Ljg2NVowBwIBAYACAfSggbmkgbYwgbMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpX
# YXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
# Q29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAlBgNVBAsTHm5DaXBoZXIgRFNF
# IEVTTjpGNTI4LTM3NzctOEE3NjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3Rh
# bXAgU2VydmljZaCCDs0wggZxMIIEWaADAgECAgphCYEqAAAAAAACMA0GCSqGSIb3
# DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIw
# MAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAx
# MDAeFw0xMDA3MDEyMTM2NTVaFw0yNTA3MDEyMTQ2NTVaMHwxCzAJBgNVBAYTAlVT
# MRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
# ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1l
# LVN0YW1wIFBDQSAyMDEwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
# qR0NvHcRijog7PwTl/X6f2mUa3RUENWlCgCChfvtfGhLLF/Fw+Vhwna3PmYrW/AV
# UycEMR9BGxqVHc4JE458YTBZsTBED/FgiIRUQwzXTbg4CLNC3ZOs1nMwVyaCo0UN
# 0Or1R4HNvyRgMlhgRvJYR4YyhB50YWeRX4FUsc+TTJLBxKZd0WETbijGGvmGgLvf
# YfxGwScdJGcSchohiq9LZIlQYrFd/XcfPfBXday9ikJNQFHRD5wGPmd/9WbAA5ZE
# fu/QS/1u5ZrKsajyeioKMfDaTgaRtogINeh4HLDpmc085y9Euqf03GS9pAHBIAmT
# eM38vMDJRF1eFpwBBU8iTQIDAQABo4IB5jCCAeIwEAYJKwYBBAGCNxUBBAMCAQAw
# HQYDVR0OBBYEFNVjOlyKMZDzQ3t8RhvFM2hahW1VMBkGCSsGAQQBgjcUAgQMHgoA
# UwB1AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQY
# MBaAFNX2VsuP6KJcYmjRPZSQW9fOmhjEMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6
# Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1
# dF8yMDEwLTA2LTIzLmNybDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0
# dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIw
# MTAtMDYtMjMuY3J0MIGgBgNVHSABAf8EgZUwgZIwgY8GCSsGAQQBgjcuAzCBgTA9
# BggrBgEFBQcCARYxaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL1BLSS9kb2NzL0NQ
# Uy9kZWZhdWx0Lmh0bTBABggrBgEFBQcCAjA0HjIgHQBMAGUAZwBhAGwAXwBQAG8A
# bABpAGMAeQBfAFMAdABhAHQAZQBtAGUAbgB0AC4gHTANBgkqhkiG9w0BAQsFAAOC
# AgEAB+aIUQ3ixuCYP4FxAz2do6Ehb7Prpsz1Mb7PBeKp/vpXbRkws8LFZslq3/Xn
# 8Hi9x6ieJeP5vO1rVFcIK1GCRBL7uVOMzPRgEop2zEBAQZvcXBf/XPleFzWYJFZL
# dO9CEMivv3/Gf/I3fVo/HPKZeUqRUgCvOA8X9S95gWXZqbVr5MfO9sp6AG9LMEQk
# IjzP7QOllo9ZKby2/QThcJ8ySif9Va8v/rbljjO7Yl+a21dA6fHOmWaQjP9qYn/d
# xUoLkSbiOewZSnFjnXshbcOco6I8+n99lmqQeKZt0uGc+R38ONiU9MalCpaGpL2e
# Gq4EQoO4tYCbIjggtSXlZOz39L9+Y1klD3ouOVd2onGqBooPiRa6YacRy5rYDkea
# gMXQzafQ732D8OE7cQnfXXSYIghh2rBQHm+98eEA3+cxB6STOvdlR3jo+KhIq/fe
# cn5ha293qYHLpwmsObvsxsvYgrRyzR30uIUBHoD7G4kqVDmyW9rIDVWZeodzOwjm
# mC3qjeAzLhIp9cAvVCch98isTtoouLGp25ayp0Kiyc8ZQU3ghvkqmqMRZjDTu3Qy
# S99je/WZii8bxyGvWbWu3EQ8l1Bx16HSxVXjad5XwdHeMMD9zOZN+w2/XU/pnR4Z
# OC+8z1gFLu8NoFA12u8JJxzVs341Hgi62jbb01+P3nSISRIwggTaMIIDwqADAgEC
# AhMzAAAAsIbpkiAKXer4AAAAAACwMA0GCSqGSIb3DQEBCwUAMHwxCzAJBgNVBAYT
# AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
# VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFBDQSAyMDEwMB4XDTE2MDkwNzE3NTY1NloXDTE4MDkwNzE3NTY1
# NlowgbMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
# EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xDTALBgNV
# BAsTBE1PUFIxJzAlBgNVBAsTHm5DaXBoZXIgRFNFIEVTTjpGNTI4LTM3NzctOEE3
# NjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCASIwDQYJ
# KoZIhvcNAQEBBQADggEPADCCAQoCggEBAPDl8I2UWama12wJB3cUIVldtz14uDWt
# 9TAx/87h/9bpGsmDmCP7kBDBkuw6vFBskL1c8WutTKL1YaWH4SmsozwS33/EAILO
# vbQKX8u525q3GS1a7QcArVT9M6z2+BIkSiRnV9q4S6GsD4D5Ob0gDbWnxCxL8aFW
# 5vIvJ7kmwTMl2SsMMHJQhGuSapWM8voITbguJNVD09zr83RqiLPJtGDcyWWtXwnl
# EWoUNMHkVwYSRuagvYRaJEJD9rz0LFWZWo2ziKaqEpQivoa1SomMqkewoMUfG4+c
# 8GJtVJ0y06nEm1PpuXI7vxeer1hcncYrUCG72JbMNu+NpnPZrbtDcBUCAwEAAaOC
# ARswggEXMB0GA1UdDgQWBBT8qAdS2e8p/phDPBVcdF63f3PgrzAfBgNVHSMEGDAW
# gBTVYzpcijGQ80N7fEYbxTNoWoVtVTBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8v
# Y3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNUaW1TdGFQQ0Ff
# MjAxMC0wNy0wMS5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRw
# Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1RpbVN0YVBDQV8yMDEw
# LTA3LTAxLmNydDAMBgNVHRMBAf8EAjAAMBMGA1UdJQQMMAoGCCsGAQUFBwMIMA0G
# CSqGSIb3DQEBCwUAA4IBAQCS/YD3db1lkD4XzdUVg8WOApE7rE59YO+POQaTkOMP
# qkU9iT8C/exvuFCQCWyE0jchmbHBhnYd5A3Gjv8Y4KL6RrWFd3RuTgxERdC80rYE
# fnBLD9arB2lWSnZk6PmqR6Ojhtz0z0S4SRBbZ4/R2nmuOt2HUwboj2r8f9fko4ZF
# FQ2RYiI6kErj2GgBScktDmt4bBEC9I9NEWBzqAMhDZfjD3J1u/3oDrjr/CBBnY6T
# /cUzcz45er1qNB45R2IRtRzvV/Rzg3GfqBRlvuQDjk1txAEzG35X7KHzHJepOKf0
# qDo5+Yk1/F2jIq4KvY0MqzESbum9YRbs9Bk6JIViX6myoYIDdjCCAl4CAQEwgeOh
# gbmkgbYwgbMxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
# VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xDTAL
# BgNVBAsTBE1PUFIxJzAlBgNVBAsTHm5DaXBoZXIgRFNFIEVTTjpGNTI4LTM3Nzct
# OEE3NjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaIlCgEB
# MAkGBSsOAwIaBQADFQC8hPudWxLaxzaFO4hmnqMWGNXMHKCBwjCBv6SBvDCBuTEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjENMAsGA1UECxMETU9Q
# UjEnMCUGA1UECxMebkNpcGhlciBOVFMgRVNOOjU3RjYtQzFFMC01NTRDMSswKQYD
# VQQDEyJNaWNyb3NvZnQgVGltZSBTb3VyY2UgTWFzdGVyIENsb2NrMA0GCSqGSIb3
# DQEBBQUAAgUA3Hk3NzAiGA8yMDE3MDMxOTE2NTgzMVoYDzIwMTcwMzIwMTY1ODMx
# WjB0MDoGCisGAQQBhFkKBAExLDAqMAoCBQDceTc3AgEAMAcCAQACAhHuMAcCAQAC
# AhlEMAoCBQDceoi3AgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwGg
# CjAIAgEAAgMW42ChCjAIAgEAAgMHoSAwDQYJKoZIhvcNAQEFBQADggEBAI/fE1tk
# 98WmGP9YXCu71YHxgoMJQPCQOcxhoDerXbMG79ayA0z2Ls27wHenkJfERVdyJ3sk
# HpsT9vQFmA9HU7q7yGPZqeDPc38E2KAOQpK/H7rRpdv7dnNJOMDnkcDaviLXJjAc
# bjSciSeDanp6+JDk8GGuJZYMN74hu47vO2Z5NlIZv8EkIKFPLE2eK3KjUYOBNhZy
# Lxu+q7An+NPUKa1p8DkAWBnTPmBy5hkwU7y/1YyD+K+IDTg6CbujdRJ9ISFdmYtI
# N4JetkD5jXbtZDtC8/GWCtIpnUFC/cITD00KtB54Pm/1OjNC5kJ+zAzTycV1SbHH
# oF4PcL8ShS8SrqkxggL1MIIC8QIBATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UE
# CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
# b2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQ
# Q0EgMjAxMAITMwAAALCG6ZIgCl3q+AAAAAAAsDANBglghkgBZQMEAgEFAKCCATIw
# GgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCCvr2r7
# 52hVerbCT+E1+K4bV+qCiimht8JJfFI59CNWpTCB4gYLKoZIhvcNAQkQAgwxgdIw
# gc8wgcwwgbEEFLyE+51bEtrHNoU7iGaeoxYY1cwcMIGYMIGApH4wfDELMAkGA1UE
# BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAc
# BgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0
# IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAACwhumSIApd6vgAAAAAALAwFgQUl2Mq
# 6HRkfEuDBoOkR6IkG+yagKIwDQYJKoZIhvcNAQELBQAEggEAiV2NoXG4mzAQezB8
# NPzhwrguNZh1NqFkHS8ejjsrDQ8SEH8DltiwMJlCVLxf6s3f8p6tBlXSmcIi/w31
# IPPLadMZS/yRGe30WSKqdyrzOh78wDUtVFQQFZTWqkEIMx0hsZvcugamJkXoSgd3
# s2xDhZOK6gqPgVa3CvGJm17w1qY1ZsJBh+VgOGYGDQKKGMBEquGJyvUVuqNIzZGc
# Uu3HbzsVD4s6hu0o7PVGLxS0hCCnCOSJwYBqyUWcCMrcV/ekTx8Gq26A5Ak/VW20
# XZ4aX0Hpt2V/3BpgYXMuWI+amzsWGPzgEowh2HZRgfHRQxGHsj5Y+wydwXpO+hHJ
# 25UiRw==
# SIG # End signature block
