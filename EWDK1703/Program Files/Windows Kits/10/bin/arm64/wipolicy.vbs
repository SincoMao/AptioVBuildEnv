' Windows Installer utility to manage installer policy settings
' For use with Windows Scripting Host, CScript.exe or WScript.exe
' Copyright (c) Microsoft Corporation. All rights reserved.
' Demonstrates the use of the installer policy keys
' Policy can be configured by an administrator using the NT Group Policy Editor
'
Option Explicit

Dim policies(21, 4)
policies(1, 0)="LM" : policies(1, 1)="HKLM" : policies(1, 2)="Logging"              : policies(1, 3)="REG_SZ"    : policies(1, 4) = "Logging modes if not supplied by install, set of iwearucmpv"
policies(2, 0)="DO" : policies(2, 1)="HKLM" : policies(2, 2)="Debug"                : policies(2, 3)="REG_DWORD" : policies(2, 4) = "OutputDebugString: 1=debug output, 2=verbose debug output, 7=include command line"
policies(3, 0)="DI" : policies(3, 1)="HKLM" : policies(3, 2)="DisableMsi"           : policies(3, 3)="REG_DWORD" : policies(3, 4) = "1=Disable non-managed installs, 2=disable all installs"
policies(4, 0)="WT" : policies(4, 1)="HKLM" : policies(4, 2)="Timeout"              : policies(4, 3)="REG_DWORD" : policies(4, 4) = "Wait timeout in seconds in case of no activity"
policies(5, 0)="DB" : policies(5, 1)="HKLM" : policies(5, 2)="DisableBrowse"        : policies(5, 3)="REG_DWORD" : policies(5, 4) = "Disable user browsing of source locations if 1"
policies(6, 0)="AB" : policies(6, 1)="HKLM" : policies(6, 2)="AllowLockdownBrowse"  : policies(6, 3)="REG_DWORD" : policies(6, 4) = "Allow non-admin users to browse to new sources for managed applications if 1 - use is not recommended"
policies(7, 0)="AM" : policies(7, 1)="HKLM" : policies(7, 2)="AllowLockdownMedia"   : policies(7, 3)="REG_DWORD" : policies(7, 4) = "Allow non-admin users to browse to new media sources for managed applications if 1 - use is not recommended"
policies(8, 0)="AP" : policies(8, 1)="HKLM" : policies(8, 2)="AllowLockdownPatch"   : policies(8, 3)="REG_DWORD" : policies(8, 4) = "Allow non-admin users to apply small and minor update patches to managed applications if 1 - use is not recommended"
policies(9, 0)="DU" : policies(9, 1)="HKLM" : policies(9, 2)="DisableUserInstalls"  : policies(9, 3)="REG_DWORD" : policies(9, 4) = "Disable per-user installs if 1 - available on Windows Installer version 2.0 and later"
policies(10, 0)="DP" : policies(10, 1)="HKLM" : policies(10, 2)="DisablePatch"         : policies(10, 3)="REG_DWORD" : policies(10, 4) = "Disable patch application to all products if 1"
policies(11, 0)="UC" : policies(11, 1)="HKLM" : policies(11, 2)="EnableUserControl"    : policies(11, 3)="REG_DWORD" : policies(11, 4) = "All public properties sent to install service if 1"
policies(12, 0)="ER" : policies(12, 1)="HKLM" : policies(12, 2)="EnableAdminTSRemote"  : policies(12, 3)="REG_DWORD" : policies(12, 4) = "Allow admins to perform installs from terminal server client sessions if 1"
policies(13, 0)="LS" : policies(13, 1)="HKLM" : policies(13, 2)="LimitSystemRestoreCheckpointing" : policies(13, 3)="REG_DWORD" : policies(13, 4) = "Turn off creation of system restore check points on Windows XP if 1 - available on Windows Installer version 2.0 and later"
policies(14, 0)="SS" : policies(14, 1)="HKLM" : policies(14, 2)="SafeForScripting"     : policies(14, 3)="REG_DWORD" : policies(14, 4) = "Do not prompt when scripts within a webpage access Installer automation interface if 1 - use is not recommended"
policies(15, 0)="TP" : policies(15,1)="HKLM" : policies(15, 2)="TransformsSecure"     : policies(15, 3)="REG_DWORD" : policies(15, 4) = "Pin tranforms in secure location if 1 (only admin and system have write privileges to cache location)"
policies(16, 0)="EM" : policies(16, 1)="HKLM" : policies(16, 2)="AlwaysInstallElevated": policies(16, 3)="REG_DWORD" : policies(16, 4) = "System privileges if 1 and HKCU value also set - dangerous policy as non-admin users can install with elevated privileges if enabled"
policies(17, 0)="EU" : policies(17, 1)="HKCU" : policies(17, 2)="AlwaysInstallElevated": policies(17, 3)="REG_DWORD" : policies(17, 4) = "System privileges if 1 and HKLM value also set - dangerous policy as non-admin users can install with elevated privileges if enabled"
policies(18,0)="DR" : policies(18,1)="HKCU" : policies(18,2)="DisableRollback"      : policies(18,3)="REG_DWORD" : policies(18,4) = "Disable rollback if 1 - use is not recommended"
policies(19,0)="TS" : policies(19,1)="HKCU" : policies(19,2)="TransformsAtSource"   : policies(19,3)="REG_DWORD" : policies(19,4) = "Locate transforms at root of source image if 1"
policies(20,0)="SO" : policies(20,1)="HKCU" : policies(20,2)="SearchOrder"          : policies(20,3)="REG_SZ"    : policies(20,4) = "Search order of source types, set of n,m,u (default=nmu)"
policies(21,0)="DM" : policies(21,1)="HKCU" : policies(21,2)="DisableMedia"          : policies(21,3)="REG_DWORD"    : policies(21,4) = "Browsing to media sources is disabled"

Dim argCount:argCount = Wscript.Arguments.Count
Dim message, iPolicy, policyKey, policyValue, WshShell, policyCode
On Error Resume Next

' If no arguments supplied, then list all current policy settings
If argCount = 0 Then
	Set WshShell = WScript.CreateObject("WScript.Shell") : CheckError
	For iPolicy = 0 To UBound(policies)
		policyValue = ReadPolicyValue(iPolicy)
		If Not IsEmpty(policyValue) Then 'policy key present, else skip display
			If Not IsEmpty(message) Then message = message & vbLf
			message = message & policies(iPolicy,0) & ": " & policies(iPolicy,2) & "(" & policies(iPolicy,1) & ") = " & policyValue
		End If
	Next
	If IsEmpty(message) Then message = "No installer policies set"
	Wscript.Echo message
	Wscript.Quit 0
End If

' Check for ?, and show help message if found
policyCode = UCase(Wscript.Arguments(0))
If InStr(1, policyCode, "?", vbTextCompare) <> 0 Then
	message = "Windows Installer utility to manage installer policy settings" &_
		vbLf & " If no arguments are supplied, current policy settings in list will be reported" &_
		vbLf & " The 1st argument specifies the policy to set, using a code from the list below" &_
		vbLf & " The 2nd argument specifies the new policy setting, use """" to remove the policy" &_
		vbLf & " If the 2nd argument is not supplied, the current policy value will be reported"
	For iPolicy = 0 To UBound(policies)
		message = message & vbLf & policies(iPolicy,0) & ": " & policies(iPolicy,2) & "(" & policies(iPolicy,1) & ")  " & policies(iPolicy,4) & vbLf
	Next
	message = message & vblf & vblf & "Copyright (C) Microsoft Corporation.  All rights reserved."

	Wscript.Echo message
	Wscript.Quit 1
End If

' Policy code supplied, look up in array
For iPolicy = 0 To UBound(policies)
	If policies(iPolicy, 0) = policyCode Then Exit For
Next
If iPolicy > UBound(policies) Then Wscript.Echo "Unknown policy code: " & policyCode : Wscript.Quit 2
Set WshShell = WScript.CreateObject("WScript.Shell") : CheckError

' If no value supplied, then simply report current value
policyValue = ReadPolicyValue(iPolicy)
If IsEmpty(policyValue) Then policyValue = "Not present"
message = policies(iPolicy,0) & ": " & policies(iPolicy,2) & "(" & policies(iPolicy,1) & ") = " & policyValue
If argCount > 1 Then ' Value supplied, set policy
	policyValue = WritePolicyValue(iPolicy, Wscript.Arguments(1))
	If IsEmpty(policyValue) Then policyValue = "Not present"
	message = message & " --> " & policyValue
End If
Wscript.Echo message

Function ReadPolicyValue(iPolicy)
	On Error Resume Next
	Dim policyKey:policyKey = policies(iPolicy,1) & "\Software\Policies\Microsoft\Windows\Installer\" & policies(iPolicy,2)
	ReadPolicyValue = WshShell.RegRead(policyKey)
End Function

Function WritePolicyValue(iPolicy, policyValue)
	On Error Resume Next
	Dim policyKey:policyKey = policies(iPolicy,1) & "\Software\Policies\Microsoft\Windows\Installer\" & policies(iPolicy,2)
	If Len(policyValue) Then
		WshShell.RegWrite policyKey, policyValue, policies(iPolicy,3) : CheckError
		WritePolicyValue = policyValue
	ElseIf Not IsEmpty(ReadPolicyValue(iPolicy)) Then
		WshShell.RegDelete policyKey : CheckError
	End If
End Function

Sub CheckError
	Dim message, errRec
	If Err = 0 Then Exit Sub
	message = Err.Source & " " & Hex(Err) & ": " & Err.Description
	If Not installer Is Nothing Then
		Set errRec = installer.LastErrorRecord
		If Not errRec Is Nothing Then message = message & vbLf & errRec.FormatText
	End If
	Wscript.Echo message
	Wscript.Quit 2
End Sub

'' SIG '' Begin signature block
'' SIG '' MIIiTQYJKoZIhvcNAQcCoIIiPjCCIjoCAQExDzANBglg
'' SIG '' hkgBZQMEAgEFADB3BgorBgEEAYI3AgEEoGkwZzAyBgor
'' SIG '' BgEEAYI3AgEeMCQCAQEEEE7wKRaZJ7VNj+Ws4Q8X66sC
'' SIG '' AQACAQACAQACAQACAQAwMTANBglghkgBZQMEAgEFAAQg
'' SIG '' /P2vh2Oob6dK4LJgJX9q0NCUL4Tr2otbVtqd2lYQZG6g
'' SIG '' gguPMIIFFzCCA/+gAwIBAgITMwAAAVVp/7a3A86SrgAA
'' SIG '' AAABVTANBgkqhkiG9w0BAQsFADB+MQswCQYDVQQGEwJV
'' SIG '' UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
'' SIG '' UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
'' SIG '' cmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29kZSBT
'' SIG '' aWduaW5nIFBDQSAyMDEwMB4XDTE3MDExODE3MzcxNVoX
'' SIG '' DTE4MDQxMjE3MzcxNVowgY4xCzAJBgNVBAYTAlVTMRMw
'' SIG '' EQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
'' SIG '' b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRp
'' SIG '' b24xDTALBgNVBAsTBE1PUFIxKTAnBgNVBAMTIE1pY3Jv
'' SIG '' c29mdCBXaW5kb3dzIEtpdHMgUHVibGlzaGVyMIIBIjAN
'' SIG '' BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtWlP6kJd
'' SIG '' 2OeI8GBCw3xSZqk5jmpNr2s9nflfnX9H5yIeZKX2VH6x
'' SIG '' TWXwGsin5MigTbyIStQqo7LAWv4G9tOQ4zcrHZc3vgpe
'' SIG '' 4RnoMbpibkLgmCNNwZJ2PV7NtZPkxurz42tm+XT9dWXT
'' SIG '' Gn42yIpiaT8kGrs5VLvqi7a5QzUbm5IhAfZfpAn4K4FZ
'' SIG '' 47lqJ3gTmbkQ4ODC/3whJTngCi1UJMmDP7kEFLm4J6GC
'' SIG '' DZgnNoZRlbNdxL9Y0pJtsbm+EdZuy1cx+O7YaWmrjJi8
'' SIG '' ghcvaxZuZEzAPX9bEfCnRoF5PFnsBFH84qcoHbkUhEMI
'' SIG '' m1DFIvyFWcfchz0pGOZCkwj5pQIDAQABo4IBezCCAXcw
'' SIG '' HwYDVR0lBBgwFgYKKwYBBAGCNwoDFAYIKwYBBQUHAwMw
'' SIG '' HQYDVR0OBBYEFD5mS2iWthzVVdM+D3JrW9fwwEmbMFIG
'' SIG '' A1UdEQRLMEmkRzBFMQ0wCwYDVQQLEwRNT1BSMTQwMgYD
'' SIG '' VQQFEysyMjk5MDMrZjY5MzBlOGEtMDZjZi00ZTFkLThi
'' SIG '' ZGMtMjE0OGE3YTk5OTFmMB8GA1UdIwQYMBaAFOb8X3u7
'' SIG '' IgBY5HJOtfQhdCMy5u+sMFYGA1UdHwRPME0wS6BJoEeG
'' SIG '' RWh0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3Js
'' SIG '' L3Byb2R1Y3RzL01pY0NvZFNpZ1BDQV8yMDEwLTA3LTA2
'' SIG '' LmNybDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKG
'' SIG '' Pmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2Vy
'' SIG '' dHMvTWljQ29kU2lnUENBXzIwMTAtMDctMDYuY3J0MAwG
'' SIG '' A1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggEBAOge
'' SIG '' oOdvZVXDSb0HtYATwNXxJ3qcSKlgcvQVAJ+oRz9uixUK
'' SIG '' j02r4LZTPZFIQJM3ELa6lhz9AgPDQnuaJwZ6OarFlinx
'' SIG '' yKap4iA3ofxnwnLA7TXZ4jcMXMRdiD/a0/5YqzWSgC1d
'' SIG '' uUK/7Swv33Sz1zUqekaMui4c8cejmVknme4i05YpJTPJ
'' SIG '' G5hS0l6ZAx90cz795+o+pEwOZ4wiyf/8JVQXvJ9uHXy6
'' SIG '' LKuck+dsEUnbJ4eE9TcSrk9Ab2EshixEVUl1Mtal8r0Z
'' SIG '' LlFUH4Di3pnt+J2a81WhZcsjst1lNJcqThyoZwqhYSFr
'' SIG '' qpRHvadd2K3FNEuuZwYLEMOxc5vwrGgwggZwMIIEWKAD
'' SIG '' AgECAgphDFJMAAAAAAADMA0GCSqGSIb3DQEBCwUAMIGI
'' SIG '' MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
'' SIG '' bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
'' SIG '' cm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNy
'' SIG '' b3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkg
'' SIG '' MjAxMDAeFw0xMDA3MDYyMDQwMTdaFw0yNTA3MDYyMDUw
'' SIG '' MTdaMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
'' SIG '' aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQK
'' SIG '' ExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMT
'' SIG '' H01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTAw
'' SIG '' ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDp
'' SIG '' DmRQeWe1xOP9CQBMnpSs91Zo6kTYz8VYT6mldnxtRbrT
'' SIG '' OZK0pB75+WWC5BfSj/1EnAjoZZPOLFWEv30I4y4rqEEr
'' SIG '' GLeiS25JTGsVB97R0sKJHnGUzbV/S7SvCNjMiNZrF5Q6
'' SIG '' k84mP+zm/jSYV9UdXUn2siou1YW7WT/4kLQrg3TKK7M7
'' SIG '' RuPwRknBF2ZUyRy9HcRVYldy+Ge5JSA03l2mpZVeqyiA
'' SIG '' zdWynuUDtWPTshTIwciKJgpZfwfs/w7tgBI1TBKmvlJb
'' SIG '' 9aba4IsLSHfWhUfVELnG6Krui2otBVxgxrQqW5wjHF9F
'' SIG '' 4xoUHm83yxkzgGqJTaNqZmN4k9Uwz5UfAgMBAAGjggHj
'' SIG '' MIIB3zAQBgkrBgEEAYI3FQEEAwIBADAdBgNVHQ4EFgQU
'' SIG '' 5vxfe7siAFjkck619CF0IzLm76wwGQYJKwYBBAGCNxQC
'' SIG '' BAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1Ud
'' SIG '' EwEB/wQFMAMBAf8wHwYDVR0jBBgwFoAU1fZWy4/oolxi
'' SIG '' aNE9lJBb186aGMQwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0
'' SIG '' cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJv
'' SIG '' ZHVjdHMvTWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3Js
'' SIG '' MFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0
'' SIG '' cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9N
'' SIG '' aWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwgZ0GA1Ud
'' SIG '' IASBlTCBkjCBjwYJKwYBBAGCNy4DMIGBMD0GCCsGAQUF
'' SIG '' BwIBFjFodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vUEtJ
'' SIG '' L2RvY3MvQ1BTL2RlZmF1bHQuaHRtMEAGCCsGAQUFBwIC
'' SIG '' MDQeMiAdAEwAZQBnAGEAbABfAFAAbwBsAGkAYwB5AF8A
'' SIG '' UwB0AGEAdABlAG0AZQBuAHQALiAdMA0GCSqGSIb3DQEB
'' SIG '' CwUAA4ICAQAadO9XTyl7xBaFeLhQ0yL8CZ2sgpf4NP8q
'' SIG '' LJeVEuXkv8+/k8jjNKnbgbjcHgC+0jVvr+V/eZV35QLU
'' SIG '' 8evYzU4eG2GiwlojGvCMqGJRRWcI4z88HpP4MIUXyDlA
'' SIG '' ptcOsyEp5aWhaYwik8x0mOehR0PyU6zADzBpf/7SJSBt
'' SIG '' b2HT3wfV2XIALGmGdj1R26Y5SMk3YW0H3VMZy6fWYcK/
'' SIG '' 4oOrD+Brm5XWfShRsIlKUaSabMi3H0oaDmmp19zBftFJ
'' SIG '' cKq2rbtyR2MX+qbWoqaG7KgQRJtjtrJpiQbHRoZ6GD/o
'' SIG '' xR0h1Xv5AiMtxUHLvx1MyBbvsZx//CJLSYpuFeOmf3Zb
'' SIG '' 0VN5kYWd1dLbPXM18zyuVLJSR2rAqhOV0o4R2plnXjKM
'' SIG '' +zeF0dx1hZyHxlpXhcK/3Q2PjJst67TuzyfTtV5p+qQW
'' SIG '' BAGnJGdzz01Ptt4FVpd69+lSTfR3BU+FxtgL8Y7tQgnR
'' SIG '' DXbjI1Z4IiY2vsqxjG6qHeSF2kczYo+kyZEzX3EeQK+Y
'' SIG '' Zcki6EIhJYocLWDZN4lBiSoWD9dhPJRoYFLv1keZoIBA
'' SIG '' 7hWBdz6c4FMYGlAdOJWbHmYzEyc5F3iHNs5Ow1+y9T1H
'' SIG '' U7bg5dsLYT0q15IszjdaPkBCMaQfEAjCVpy/JF1RAp1q
'' SIG '' edIX09rBlI4HeyVxRKsGaubUxt8jmpZ1xTGCFhYwghYS
'' SIG '' AgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpX
'' SIG '' YXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
'' SIG '' VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNV
'' SIG '' BAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIw
'' SIG '' MTACEzMAAAFVaf+2twPOkq4AAAAAAVUwDQYJYIZIAWUD
'' SIG '' BAIBBQCgggEEMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3
'' SIG '' AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEV
'' SIG '' MC8GCSqGSIb3DQEJBDEiBCAbvhx3VbAeGL2j3TYUG6qi
'' SIG '' g4jEvkqKJzKdmGBb9zA5qzA8BgorBgEEAYI3CgMcMS4M
'' SIG '' LFo0bkpaN0tZQW1XWUw4aE82bjBVRmtCWlZpS1o5QmFl
'' SIG '' RTNYRjg2cnRjQ3M9MFoGCisGAQQBgjcCAQwxTDBKoCSA
'' SIG '' IgBNAGkAYwByAG8AcwBvAGYAdAAgAFcAaQBuAGQAbwB3
'' SIG '' AHOhIoAgaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3dp
'' SIG '' bmRvd3MwDQYJKoZIhvcNAQEBBQAEggEAQYsjvUtBR+oS
'' SIG '' Zo04LKzXcMzjrNpXUk4PwHMl4i15FE+w3M7uFBSBOLX3
'' SIG '' iJeTlNkgIn1Yja0DepVgJJdf2BJsK48uNg2E+VgTtyMH
'' SIG '' vtv0oq0JIrTNRPpoTHKkeBdHsfNv1d88Mb1wo0EvMhOD
'' SIG '' X9ksGHYK/jGhgTE5Kh1tAbiJq+Pr5DG63dGpqTsoqF1a
'' SIG '' FN/eUb8yPdGkQ+EvA7Vn9J6PgrZ5Oz4ACD+JlZXSKLCV
'' SIG '' FS4+UQDP4flNI6xOdDHgBr7+i2nZDeHt++0LJL8gnsNl
'' SIG '' UzkCB2s16KBAHM9WlFJMDMNlDq7Uun04BSpxzSNZ6FJX
'' SIG '' A2k/NHQ7WjN9IaG/Izn2tqGCE0kwghNFBgorBgEEAYI3
'' SIG '' AwMBMYITNTCCEzEGCSqGSIb3DQEHAqCCEyIwghMeAgED
'' SIG '' MQ8wDQYJYIZIAWUDBAIBBQAwggE9BgsqhkiG9w0BCRAB
'' SIG '' BKCCASwEggEoMIIBJAIBAQYKKwYBBAGEWQoDATAxMA0G
'' SIG '' CWCGSAFlAwQCAQUABCD8c3sOtPe9ocOeF9l6X5EcQl28
'' SIG '' U+iccZQ6QojZIdF+nAIGWK9mWZc5GBMyMDE3MDMxOTEy
'' SIG '' NTMxNi4wNjNaMAcCAQGAAgH0oIG5pIG2MIGzMQswCQYD
'' SIG '' VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
'' SIG '' A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
'' SIG '' IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScwJQYD
'' SIG '' VQQLEx5uQ2lwaGVyIERTRSBFU046OThGRC1DNjFFLUU2
'' SIG '' NDExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
'' SIG '' IFNlcnZpY2Wggg7MMIIGcTCCBFmgAwIBAgIKYQmBKgAA
'' SIG '' AAAAAjANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMC
'' SIG '' VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
'' SIG '' B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
'' SIG '' b3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3Qg
'' SIG '' Q2VydGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMTAw
'' SIG '' NzAxMjEzNjU1WhcNMjUwNzAxMjE0NjU1WjB8MQswCQYD
'' SIG '' VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
'' SIG '' A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
'' SIG '' IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
'' SIG '' VGltZS1TdGFtcCBQQ0EgMjAxMDCCASIwDQYJKoZIhvcN
'' SIG '' AQEBBQADggEPADCCAQoCggEBAKkdDbx3EYo6IOz8E5f1
'' SIG '' +n9plGt0VBDVpQoAgoX77XxoSyxfxcPlYcJ2tz5mK1vw
'' SIG '' FVMnBDEfQRsalR3OCROOfGEwWbEwRA/xYIiEVEMM1024
'' SIG '' OAizQt2TrNZzMFcmgqNFDdDq9UeBzb8kYDJYYEbyWEeG
'' SIG '' MoQedGFnkV+BVLHPk0ySwcSmXdFhE24oxhr5hoC732H8
'' SIG '' RsEnHSRnEnIaIYqvS2SJUGKxXf13Hz3wV3WsvYpCTUBR
'' SIG '' 0Q+cBj5nf/VmwAOWRH7v0Ev9buWayrGo8noqCjHw2k4G
'' SIG '' kbaICDXoeByw6ZnNPOcvRLqn9NxkvaQBwSAJk3jN/LzA
'' SIG '' yURdXhacAQVPIk0CAwEAAaOCAeYwggHiMBAGCSsGAQQB
'' SIG '' gjcVAQQDAgEAMB0GA1UdDgQWBBTVYzpcijGQ80N7fEYb
'' SIG '' xTNoWoVtVTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMA
'' SIG '' QTALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAf
'' SIG '' BgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBW
'' SIG '' BgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jv
'' SIG '' c29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29D
'' SIG '' ZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEE
'' SIG '' TjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jv
'' SIG '' c29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8y
'' SIG '' MDEwLTA2LTIzLmNydDCBoAYDVR0gAQH/BIGVMIGSMIGP
'' SIG '' BgkrBgEEAYI3LgMwgYEwPQYIKwYBBQUHAgEWMWh0dHA6
'' SIG '' Ly93d3cubWljcm9zb2Z0LmNvbS9QS0kvZG9jcy9DUFMv
'' SIG '' ZGVmYXVsdC5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABl
'' SIG '' AGcAYQBsAF8AUABvAGwAaQBjAHkAXwBTAHQAYQB0AGUA
'' SIG '' bQBlAG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAAfm
'' SIG '' iFEN4sbgmD+BcQM9naOhIW+z66bM9TG+zwXiqf76V20Z
'' SIG '' MLPCxWbJat/15/B4vceoniXj+bzta1RXCCtRgkQS+7lT
'' SIG '' jMz0YBKKdsxAQEGb3FwX/1z5Xhc1mCRWS3TvQhDIr79/
'' SIG '' xn/yN31aPxzymXlKkVIArzgPF/UveYFl2am1a+THzvbK
'' SIG '' egBvSzBEJCI8z+0DpZaPWSm8tv0E4XCfMkon/VWvL/62
'' SIG '' 5Y4zu2JfmttXQOnxzplmkIz/amJ/3cVKC5Em4jnsGUpx
'' SIG '' Y517IW3DnKOiPPp/fZZqkHimbdLhnPkd/DjYlPTGpQqW
'' SIG '' hqS9nhquBEKDuLWAmyI4ILUl5WTs9/S/fmNZJQ96LjlX
'' SIG '' dqJxqgaKD4kWumGnEcua2A5HmoDF0M2n0O99g/DhO3EJ
'' SIG '' 3110mCIIYdqwUB5vvfHhAN/nMQekkzr3ZUd46PioSKv3
'' SIG '' 3nJ+YWtvd6mBy6cJrDm77MbL2IK0cs0d9LiFAR6A+xuJ
'' SIG '' KlQ5slvayA1VmXqHczsI5pgt6o3gMy4SKfXAL1QnIffI
'' SIG '' rE7aKLixqduWsqdCosnPGUFN4Ib5KpqjEWYw07t0Mkvf
'' SIG '' Y3v1mYovG8chr1m1rtxEPJdQcdeh0sVV42neV8HR3jDA
'' SIG '' /czmTfsNv11P6Z0eGTgvvM9YBS7vDaBQNdrvCScc1bN+
'' SIG '' NR4Iuto229Nfj950iEkSMIIE2jCCA8KgAwIBAgITMwAA
'' SIG '' AJ0gnFZ3VdQomgAAAAAAnTANBgkqhkiG9w0BAQsFADB8
'' SIG '' MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
'' SIG '' bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
'' SIG '' cm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
'' SIG '' b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0xNjA5
'' SIG '' MDcxNzU2NDFaFw0xODA5MDcxNzU2NDFaMIGzMQswCQYD
'' SIG '' VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
'' SIG '' A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
'' SIG '' IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScwJQYD
'' SIG '' VQQLEx5uQ2lwaGVyIERTRSBFU046OThGRC1DNjFFLUU2
'' SIG '' NDExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
'' SIG '' IFNlcnZpY2UwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
'' SIG '' ggEKAoIBAQDSRJicEVoqGi6qn1NdbV28tll2kcAmWwPm
'' SIG '' yGxfoyrrTABGdDgUvyp4XbAjTOxuYEjsSeRbdaZw/fPU
'' SIG '' rlVujr0EH2c9Gf0xcoKUoXOxLrzwHNTb7yG4xqm0xsJG
'' SIG '' By6ZzD4hC8MuSN8ManXFNY7XWZyrO0h+nrLg/FSW3hNH
'' SIG '' OULQbtZL/b8MpPAL5froyIiL7pz7deHES+jLDmTOV95g
'' SIG '' qHpKzmUcuGWWI2I7fwVPWWbd6Q3V+Hy+wEzeewqWG8xV
'' SIG '' OQRvBghBOLv1Gd+1egR3BRzi7IzH8bGaXkduzLIeo9qW
'' SIG '' eIHu8AeYgFG+ugoUHn6eOlkkoVdzDP5BRE6WwlRRD6nF
'' SIG '' AgMBAAGjggEbMIIBFzAdBgNVHQ4EFgQUvIYIyltqWsrk
'' SIG '' vczLgrQVSOqH5aEwHwYDVR0jBBgwFoAU1WM6XIoxkPND
'' SIG '' e3xGG8UzaFqFbVUwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0
'' SIG '' cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJv
'' SIG '' ZHVjdHMvTWljVGltU3RhUENBXzIwMTAtMDctMDEuY3Js
'' SIG '' MFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0
'' SIG '' cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9N
'' SIG '' aWNUaW1TdGFQQ0FfMjAxMC0wNy0wMS5jcnQwDAYDVR0T
'' SIG '' AQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkq
'' SIG '' hkiG9w0BAQsFAAOCAQEAf94kIb1Z77TWi3HKWZG+LqhG
'' SIG '' gruP32QdfeYqC7woZ0v++Xe/tfROpP3oSg8+ZyKzVolt
'' SIG '' lwha7CMU9XkqE1eMkhedBiHq86jqGzvc24SaS/dyFfaf
'' SIG '' jyeo/6Xi1iCJlU1AqRVgXrmXAdcwC/9CamtW2exaXDYD
'' SIG '' gMwWLWrBuTNkT9tea3/Yb8CugaU47TrOXXIajEwVy1+T
'' SIG '' jLLdqgAt4/1kKKmpvhAd/hXcJ48fjqQD6o432wQlUx/h
'' SIG '' Mnr3OyKQzNwqDcFehgnVPlbvqyWgessyQFj2vQlbtsn/
'' SIG '' e0d5dIalhp3YIg1XXuGoDcYmTgL2/Tr2Aaz3l7y5kQ5h
'' SIG '' 253T76Y2aaGCA3UwggJdAgEBMIHjoYG5pIG2MIGzMQsw
'' SIG '' CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
'' SIG '' MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
'' SIG '' b2Z0IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScw
'' SIG '' JQYDVQQLEx5uQ2lwaGVyIERTRSBFU046OThGRC1DNjFF
'' SIG '' LUU2NDExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0
'' SIG '' YW1wIFNlcnZpY2WiJQoBATAJBgUrDgMCGgUAAxUAGA2s
'' SIG '' s4xoMLP4dBmyeM6AKzUvCPqggcIwgb+kgbwwgbkxCzAJ
'' SIG '' BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
'' SIG '' DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
'' SIG '' ZnQgQ29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAl
'' SIG '' BgNVBAsTHm5DaXBoZXIgTlRTIEVTTjo1N0Y2LUMxRTAt
'' SIG '' NTU0QzErMCkGA1UEAxMiTWljcm9zb2Z0IFRpbWUgU291
'' SIG '' cmNlIE1hc3RlciBDbG9jazANBgkqhkiG9w0BAQUFAAIF
'' SIG '' ANx4jj0wIhgPMjAxNzAzMTkwNDU3MzNaGA8yMDE3MDMy
'' SIG '' MDA0NTczM1owczA5BgorBgEEAYRZCgQBMSswKTAKAgUA
'' SIG '' 3HiOPQIBADAGAgEAAgEsMAcCAQACAinrMAoCBQDced+9
'' SIG '' AgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkK
'' SIG '' AwGgCjAIAgEAAgMW42ChCjAIAgEAAgMHoSAwDQYJKoZI
'' SIG '' hvcNAQEFBQADggEBAESkitUP1vYOLwbgCz874zVrxDgo
'' SIG '' FPeiegMo1h+MahmrclNwgGu+w/1/IOyULww48YgY3tuQ
'' SIG '' lrNLq8s2MMDMnoKrxRGhTBjl9GyvXCiNMVrj6xyLwSRp
'' SIG '' LDxdUq1CP/ZtW07KLfQ1nC4n7I9xSML0gjUsQ3MZ5e7c
'' SIG '' c/l47/qttsCUNOZKZt7nOljJWrpjgsrD1H9tY4TBJDn4
'' SIG '' qGCR9vrSZaEyfU7ZGcBL+LneT2oYQWVl4XLZjLm2At4C
'' SIG '' hVF/igHMMMQTucHnwXqbCLWHnKT21yOOrHn3y0Q0tcUy
'' SIG '' CthEvSPJHhFqCqYDtuiRsmLMthiyIP02Z4f1SVpPZNWM
'' SIG '' vYtNFIcxggL1MIIC8QIBATCBkzB8MQswCQYDVQQGEwJV
'' SIG '' UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
'' SIG '' UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
'' SIG '' cmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1T
'' SIG '' dGFtcCBQQ0EgMjAxMAITMwAAAJ0gnFZ3VdQomgAAAAAA
'' SIG '' nTANBglghkgBZQMEAgEFAKCCATIwGgYJKoZIhvcNAQkD
'' SIG '' MQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCCm
'' SIG '' spkFsv4nuGqTrwmOe3gMrVkhIoH5R/ygSIHItoJxuDCB
'' SIG '' 4gYLKoZIhvcNAQkQAgwxgdIwgc8wgcwwgbEEFBgNrLOM
'' SIG '' aDCz+HQZsnjOgCs1Lwj6MIGYMIGApH4wfDELMAkGA1UE
'' SIG '' BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
'' SIG '' BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
'' SIG '' b3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
'' SIG '' bWUtU3RhbXAgUENBIDIwMTACEzMAAACdIJxWd1XUKJoA
'' SIG '' AAAAAJ0wFgQUGeD9kBmLeZ8k4oqlHLqzYMO/S5AwDQYJ
'' SIG '' KoZIhvcNAQELBQAEggEAoPWQzfnmyzd5qrragx8WkxBU
'' SIG '' Gv4PJd7HcyVugMnrDpLNxfbZxyNS3AMLgVfUsnUpxPsi
'' SIG '' OKCjngZOXDu8MoJFRrpjC5IaT4kwKRx5RQwXlUBrVBlL
'' SIG '' ZtS7TypRztOog2g467GlNrxyKh8ra/mLN5Qg+vXXQyP0
'' SIG '' 0ZSmPXTcsFcF1Kb0V0YUHDCZgcoOZwUY1DL7/vpvQ9YF
'' SIG '' ssGs0J+pMUuJUriRnzQSYEMsIe2XIWGHG1/OtMDLPFR3
'' SIG '' xXeUaIFLdShzh2oM4b9qHKf6MMdqd8T84aawtpoKhs8x
'' SIG '' oVR9Jace5HZyvq066NbY7HU6+cBUqX8zzzV/G+Hm4ldi
'' SIG '' dNWRh5Twkw==
'' SIG '' End signature block
