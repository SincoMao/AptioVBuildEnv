' Windows Installer database table export for use with Windows Scripting Host
' Copyright (c) Microsoft Corporation. All rights reserved.
' Demonstrates the use of the Database.Export method and MsiDatabaseExport API
'
Option Explicit

Const msiOpenDatabaseModeReadOnly     = 0

Dim shortNames:shortNames = False
Dim argCount:argCount = Wscript.Arguments.Count
Dim iArg:iArg = 0
If (argCount < 3) Then
	Wscript.Echo "Windows Installer database table export utility" &_
		vbNewLine & " 1st argument is path to MSI database (installer package)" &_
		vbNewLine & " 2nd argument is path to folder to contain the exported table(s)" &_
		vbNewLine & " Subseqent arguments are table names to export (case-sensitive)" &_
		vbNewLine & " Specify '*' to export all tables, including _SummaryInformation" &_
		vbNewLine & " Specify /s or -s anywhere before table list to force short names" &_
		vbNewLine &_
		vbNewLine & " Copyright (C) Microsoft Corporation.  All rights reserved."
	Wscript.Quit 1
End If

On Error Resume Next
Dim installer : Set installer = Nothing
Set installer = Wscript.CreateObject("WindowsInstaller.Installer") : CheckError

Dim database : Set database = installer.OpenDatabase(NextArgument, msiOpenDatabaseModeReadOnly) : CheckError
Dim folder : folder = NextArgument
Dim table, view, record
While iArg < argCount
	table = NextArgument
	If table = "*" Then
		Set view = database.OpenView("SELECT `Name` FROM _Tables")
		view.Execute : CheckError
		Do
			Set record = view.Fetch : CheckError
			If record Is Nothing Then Exit Do
			table = record.StringData(1)
			Export table, folder : CheckError
		Loop
		Set view = Nothing
		table = "_SummaryInformation" 'not an actual table
		Export table, folder : Err.Clear  ' ignore if no summary information
	Else
		Export table, folder : CheckError
	End If
Wend
Wscript.Quit(0)            

Sub Export(table, folder)
	Dim file : If shortNames Then file = Left(table, 8) & ".idt" Else file = table & ".idt"
	database.Export table, folder, file
End Sub

Function NextArgument
	Dim arg, chFlag
	Do
		arg = Wscript.Arguments(iArg)
		iArg = iArg + 1
		chFlag = AscW(arg)
		If (chFlag = AscW("/")) Or (chFlag = AscW("-")) Then
			chFlag = UCase(Right(arg, Len(arg)-1))
			If chFlag = "S" Then 
				shortNames = True
			Else
				Wscript.Echo "Invalid option flag:", arg : Wscript.Quit 1
			End If
		Else
			Exit Do
		End If
	Loop
	NextArgument = arg
End Function

Sub CheckError
	Dim message, errRec
	If Err = 0 Then Exit Sub
	message = Err.Source & " " & Hex(Err) & ": " & Err.Description
	If Not installer Is Nothing Then
		Set errRec = installer.LastErrorRecord
		If Not errRec Is Nothing Then message = message & vbNewLine & errRec.FormatText
	End If
	Wscript.Echo message
	Wscript.Quit 2
End Sub

'' SIG '' Begin signature block
'' SIG '' MIIiTQYJKoZIhvcNAQcCoIIiPjCCIjoCAQExDzANBglg
'' SIG '' hkgBZQMEAgEFADB3BgorBgEEAYI3AgEEoGkwZzAyBgor
'' SIG '' BgEEAYI3AgEeMCQCAQEEEE7wKRaZJ7VNj+Ws4Q8X66sC
'' SIG '' AQACAQACAQACAQACAQAwMTANBglghkgBZQMEAgEFAAQg
'' SIG '' VI4Hnca1EkyTrUPvd2CuA7Hjy/dDS98JnuMo4x3O0eig
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
'' SIG '' MC8GCSqGSIb3DQEJBDEiBCB2HP/BYQ/aISbvtLgqg6C6
'' SIG '' /l8LXj7DELdpEVbURjVPIjA8BgorBgEEAYI3CgMcMS4M
'' SIG '' LGRadXI3emhSU1paRHNNNXdMN2NoVVMwMldncCtQcmtP
'' SIG '' eDVMdTIvUW8xKzQ9MFoGCisGAQQBgjcCAQwxTDBKoCSA
'' SIG '' IgBNAGkAYwByAG8AcwBvAGYAdAAgAFcAaQBuAGQAbwB3
'' SIG '' AHOhIoAgaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3dp
'' SIG '' bmRvd3MwDQYJKoZIhvcNAQEBBQAEggEAZZEHtQPcpoa/
'' SIG '' Xm5NG7Jscv2KFk3ms5U2Cg+FHMRlSDwYwisN1oplW39W
'' SIG '' LnTK2Ndc9piZKHyA4ndxQZdGM/dNH9ap87cF2rN2tyMS
'' SIG '' r+iUU+EHV/1zO8Z/lm/qXWhx2eodMSSGyCaoOyRKRQbI
'' SIG '' nyYZUx+BjsoNDXhLhEuslUuOw7V1e0Y6a3PH/SHBYH9D
'' SIG '' JKeNwAu4rHx32MWkwY1feWhXRhGX/1gWFKGngfBPju9w
'' SIG '' Od4cgLm4xbkt2kJlNgnc63VQO/ksRu6uLtgRGoLu0Rwx
'' SIG '' Vw8VY2TaqXmcQxfQvd1jN9iIqAXfW9T5TPxh4mah4wW9
'' SIG '' wRl7O/RSVjablzZwSSbFmaGCE0kwghNFBgorBgEEAYI3
'' SIG '' AwMBMYITNTCCEzEGCSqGSIb3DQEHAqCCEyIwghMeAgED
'' SIG '' MQ8wDQYJYIZIAWUDBAIBBQAwggE8BgsqhkiG9w0BCRAB
'' SIG '' BKCCASsEggEnMIIBIwIBAQYKKwYBBAGEWQoDATAxMA0G
'' SIG '' CWCGSAFlAwQCAQUABCBqP0fPhpYKkV7Hho9Ond+2PHP3
'' SIG '' 43DydYfSNrVJJpmP6QIGWK+m7OVgGBIyMDE3MDMxOTEy
'' SIG '' NDk0Mi4zNFowBwIBAYACAfSggbmkgbYwgbMxCzAJBgNV
'' SIG '' BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
'' SIG '' VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
'' SIG '' Q29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAlBgNV
'' SIG '' BAsTHm5DaXBoZXIgRFNFIEVTTjpGNTI4LTM3NzctOEE3
'' SIG '' NjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
'' SIG '' U2VydmljZaCCDs0wggZxMIIEWaADAgECAgphCYEqAAAA
'' SIG '' AAACMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJV
'' SIG '' UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
'' SIG '' UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
'' SIG '' cmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBD
'' SIG '' ZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0xMDA3
'' SIG '' MDEyMTM2NTVaFw0yNTA3MDEyMTQ2NTVaMHwxCzAJBgNV
'' SIG '' BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
'' SIG '' VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
'' SIG '' Q29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
'' SIG '' aW1lLVN0YW1wIFBDQSAyMDEwMIIBIjANBgkqhkiG9w0B
'' SIG '' AQEFAAOCAQ8AMIIBCgKCAQEAqR0NvHcRijog7PwTl/X6
'' SIG '' f2mUa3RUENWlCgCChfvtfGhLLF/Fw+Vhwna3PmYrW/AV
'' SIG '' UycEMR9BGxqVHc4JE458YTBZsTBED/FgiIRUQwzXTbg4
'' SIG '' CLNC3ZOs1nMwVyaCo0UN0Or1R4HNvyRgMlhgRvJYR4Yy
'' SIG '' hB50YWeRX4FUsc+TTJLBxKZd0WETbijGGvmGgLvfYfxG
'' SIG '' wScdJGcSchohiq9LZIlQYrFd/XcfPfBXday9ikJNQFHR
'' SIG '' D5wGPmd/9WbAA5ZEfu/QS/1u5ZrKsajyeioKMfDaTgaR
'' SIG '' togINeh4HLDpmc085y9Euqf03GS9pAHBIAmTeM38vMDJ
'' SIG '' RF1eFpwBBU8iTQIDAQABo4IB5jCCAeIwEAYJKwYBBAGC
'' SIG '' NxUBBAMCAQAwHQYDVR0OBBYEFNVjOlyKMZDzQ3t8RhvF
'' SIG '' M2hahW1VMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBB
'' SIG '' MAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8G
'' SIG '' A1UdIwQYMBaAFNX2VsuP6KJcYmjRPZSQW9fOmhjEMFYG
'' SIG '' A1UdHwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9z
'' SIG '' b2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0Nl
'' SIG '' ckF1dF8yMDEwLTA2LTIzLmNybDBaBggrBgEFBQcBAQRO
'' SIG '' MEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWljcm9z
'' SIG '' b2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2VyQXV0XzIw
'' SIG '' MTAtMDYtMjMuY3J0MIGgBgNVHSABAf8EgZUwgZIwgY8G
'' SIG '' CSsGAQQBgjcuAzCBgTA9BggrBgEFBQcCARYxaHR0cDov
'' SIG '' L3d3dy5taWNyb3NvZnQuY29tL1BLSS9kb2NzL0NQUy9k
'' SIG '' ZWZhdWx0Lmh0bTBABggrBgEFBQcCAjA0HjIgHQBMAGUA
'' SIG '' ZwBhAGwAXwBQAG8AbABpAGMAeQBfAFMAdABhAHQAZQBt
'' SIG '' AGUAbgB0AC4gHTANBgkqhkiG9w0BAQsFAAOCAgEAB+aI
'' SIG '' UQ3ixuCYP4FxAz2do6Ehb7Prpsz1Mb7PBeKp/vpXbRkw
'' SIG '' s8LFZslq3/Xn8Hi9x6ieJeP5vO1rVFcIK1GCRBL7uVOM
'' SIG '' zPRgEop2zEBAQZvcXBf/XPleFzWYJFZLdO9CEMivv3/G
'' SIG '' f/I3fVo/HPKZeUqRUgCvOA8X9S95gWXZqbVr5MfO9sp6
'' SIG '' AG9LMEQkIjzP7QOllo9ZKby2/QThcJ8ySif9Va8v/rbl
'' SIG '' jjO7Yl+a21dA6fHOmWaQjP9qYn/dxUoLkSbiOewZSnFj
'' SIG '' nXshbcOco6I8+n99lmqQeKZt0uGc+R38ONiU9MalCpaG
'' SIG '' pL2eGq4EQoO4tYCbIjggtSXlZOz39L9+Y1klD3ouOVd2
'' SIG '' onGqBooPiRa6YacRy5rYDkeagMXQzafQ732D8OE7cQnf
'' SIG '' XXSYIghh2rBQHm+98eEA3+cxB6STOvdlR3jo+KhIq/fe
'' SIG '' cn5ha293qYHLpwmsObvsxsvYgrRyzR30uIUBHoD7G4kq
'' SIG '' VDmyW9rIDVWZeodzOwjmmC3qjeAzLhIp9cAvVCch98is
'' SIG '' TtoouLGp25ayp0Kiyc8ZQU3ghvkqmqMRZjDTu3QyS99j
'' SIG '' e/WZii8bxyGvWbWu3EQ8l1Bx16HSxVXjad5XwdHeMMD9
'' SIG '' zOZN+w2/XU/pnR4ZOC+8z1gFLu8NoFA12u8JJxzVs341
'' SIG '' Hgi62jbb01+P3nSISRIwggTaMIIDwqADAgECAhMzAAAA
'' SIG '' sIbpkiAKXer4AAAAAACwMA0GCSqGSIb3DQEBCwUAMHwx
'' SIG '' CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
'' SIG '' MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
'' SIG '' b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jv
'' SIG '' c29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTE2MDkw
'' SIG '' NzE3NTY1NloXDTE4MDkwNzE3NTY1NlowgbMxCzAJBgNV
'' SIG '' BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
'' SIG '' VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
'' SIG '' Q29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAlBgNV
'' SIG '' BAsTHm5DaXBoZXIgRFNFIEVTTjpGNTI4LTM3NzctOEE3
'' SIG '' NjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
'' SIG '' U2VydmljZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
'' SIG '' AQoCggEBAPDl8I2UWama12wJB3cUIVldtz14uDWt9TAx
'' SIG '' /87h/9bpGsmDmCP7kBDBkuw6vFBskL1c8WutTKL1YaWH
'' SIG '' 4SmsozwS33/EAILOvbQKX8u525q3GS1a7QcArVT9M6z2
'' SIG '' +BIkSiRnV9q4S6GsD4D5Ob0gDbWnxCxL8aFW5vIvJ7km
'' SIG '' wTMl2SsMMHJQhGuSapWM8voITbguJNVD09zr83RqiLPJ
'' SIG '' tGDcyWWtXwnlEWoUNMHkVwYSRuagvYRaJEJD9rz0LFWZ
'' SIG '' Wo2ziKaqEpQivoa1SomMqkewoMUfG4+c8GJtVJ0y06nE
'' SIG '' m1PpuXI7vxeer1hcncYrUCG72JbMNu+NpnPZrbtDcBUC
'' SIG '' AwEAAaOCARswggEXMB0GA1UdDgQWBBT8qAdS2e8p/phD
'' SIG '' PBVcdF63f3PgrzAfBgNVHSMEGDAWgBTVYzpcijGQ80N7
'' SIG '' fEYbxTNoWoVtVTBWBgNVHR8ETzBNMEugSaBHhkVodHRw
'' SIG '' Oi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9k
'' SIG '' dWN0cy9NaWNUaW1TdGFQQ0FfMjAxMC0wNy0wMS5jcmww
'' SIG '' WgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRw
'' SIG '' Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01p
'' SIG '' Y1RpbVN0YVBDQV8yMDEwLTA3LTAxLmNydDAMBgNVHRMB
'' SIG '' Af8EAjAAMBMGA1UdJQQMMAoGCCsGAQUFBwMIMA0GCSqG
'' SIG '' SIb3DQEBCwUAA4IBAQCS/YD3db1lkD4XzdUVg8WOApE7
'' SIG '' rE59YO+POQaTkOMPqkU9iT8C/exvuFCQCWyE0jchmbHB
'' SIG '' hnYd5A3Gjv8Y4KL6RrWFd3RuTgxERdC80rYEfnBLD9ar
'' SIG '' B2lWSnZk6PmqR6Ojhtz0z0S4SRBbZ4/R2nmuOt2HUwbo
'' SIG '' j2r8f9fko4ZFFQ2RYiI6kErj2GgBScktDmt4bBEC9I9N
'' SIG '' EWBzqAMhDZfjD3J1u/3oDrjr/CBBnY6T/cUzcz45er1q
'' SIG '' NB45R2IRtRzvV/Rzg3GfqBRlvuQDjk1txAEzG35X7KHz
'' SIG '' HJepOKf0qDo5+Yk1/F2jIq4KvY0MqzESbum9YRbs9Bk6
'' SIG '' JIViX6myoYIDdjCCAl4CAQEwgeOhgbmkgbYwgbMxCzAJ
'' SIG '' BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
'' SIG '' DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
'' SIG '' ZnQgQ29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAl
'' SIG '' BgNVBAsTHm5DaXBoZXIgRFNFIEVTTjpGNTI4LTM3Nzct
'' SIG '' OEE3NjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3Rh
'' SIG '' bXAgU2VydmljZaIlCgEBMAkGBSsOAwIaBQADFQC8hPud
'' SIG '' WxLaxzaFO4hmnqMWGNXMHKCBwjCBv6SBvDCBuTELMAkG
'' SIG '' A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
'' SIG '' BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
'' SIG '' dCBDb3Jwb3JhdGlvbjENMAsGA1UECxMETU9QUjEnMCUG
'' SIG '' A1UECxMebkNpcGhlciBOVFMgRVNOOjU3RjYtQzFFMC01
'' SIG '' NTRDMSswKQYDVQQDEyJNaWNyb3NvZnQgVGltZSBTb3Vy
'' SIG '' Y2UgTWFzdGVyIENsb2NrMA0GCSqGSIb3DQEBBQUAAgUA
'' SIG '' 3HhNiDAiGA8yMDE3MDMxOTAwMjEyOFoYDzIwMTcwMzIw
'' SIG '' MDAyMTI4WjB0MDoGCisGAQQBhFkKBAExLDAqMAoCBQDc
'' SIG '' eE2IAgEAMAcCAQACAgZSMAcCAQACAhlZMAoCBQDceZ8I
'' SIG '' AgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkK
'' SIG '' AwGgCjAIAgEAAgMW42ChCjAIAgEAAgMHoSAwDQYJKoZI
'' SIG '' hvcNAQEFBQADggEBALIPS5i9ELy2EvuYEcnZrsth8D00
'' SIG '' VZDy5Rf1WmJrT+9zAd/5neRwB4PTr/t+gajjE4qxFQyB
'' SIG '' 2jVpwfkbvuPib2zP254w9k2+WgCwraYFsRFnOuxBzAxJ
'' SIG '' v1cPjm0/RWCNiZfnlF15mCasSv2CWoJlo58O9yeftqI8
'' SIG '' g4XLZR+vc2hIXchqj1r1pJUfo9FxvfXlA7k5ppVRtGWt
'' SIG '' eJ30vqXo/w4ct6AcMy1z4+8PYVZzNG/n4UWjpzpjmQr7
'' SIG '' iUTIiecX9/xucT9PUvKFJi/Js4DDY0ST3PBhNccZ8bzB
'' SIG '' Vi9whN7lTWA/cE/FhMcK1lXUn1rrwlwsFnCf/Zq5noAB
'' SIG '' uFX14o4xggL1MIIC8QIBATCBkzB8MQswCQYDVQQGEwJV
'' SIG '' UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
'' SIG '' UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
'' SIG '' cmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1T
'' SIG '' dGFtcCBQQ0EgMjAxMAITMwAAALCG6ZIgCl3q+AAAAAAA
'' SIG '' sDANBglghkgBZQMEAgEFAKCCATIwGgYJKoZIhvcNAQkD
'' SIG '' MQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCBe
'' SIG '' G2q+5kLp6yHjs+5xmZ4iDwWa8CXfmCLd2Pimh+a83DCB
'' SIG '' 4gYLKoZIhvcNAQkQAgwxgdIwgc8wgcwwgbEEFLyE+51b
'' SIG '' EtrHNoU7iGaeoxYY1cwcMIGYMIGApH4wfDELMAkGA1UE
'' SIG '' BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
'' SIG '' BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
'' SIG '' b3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
'' SIG '' bWUtU3RhbXAgUENBIDIwMTACEzMAAACwhumSIApd6vgA
'' SIG '' AAAAALAwFgQUxQMZu7J99Fpg2wPHNzcLEkIqzAwwDQYJ
'' SIG '' KoZIhvcNAQELBQAEggEAY+1Z91mA7vqGiqdcngJe477i
'' SIG '' XrkgHLxwP+yflUG559qKIXgjmd341jJn7DZUUsjljXV9
'' SIG '' QTTxfRlsPmXTMm3fOGimxcdD3uuUBsNXIrAw2JCdpAok
'' SIG '' NnAn8Nxy2t8XYY0vFojfaMNDOgEwzGgsv50AshtYhPuo
'' SIG '' lCEzyyDS76zlvIrGPv92NVpHN23OknukMOw/PE1sfafS
'' SIG '' tpHehdFxWIFamhPHqXHd/3I1vbgwbYAoim5qhXxvSb7k
'' SIG '' KP54wn2EahfaVGiySHnilK3w9F3gKD5Ctgi+XThNleUs
'' SIG '' +Ahlk7Gnpx6szxnzI4bCgzyZkGVjhaft6mncKgli8tjP
'' SIG '' iqZN4Ij6dQ==
'' SIG '' End signature block
