' Windows Installer utility to execute SQL statements against an installer database
' For use with Windows Scripting Host, CScript.exe or WScript.exe
' Copyright (c) Microsoft Corporation. All rights reserved.
' Demonstrates the script-driven database queries and updates
'
Option Explicit

Const msiOpenDatabaseModeReadOnly = 0
Const msiOpenDatabaseModeTransact = 1

Dim argNum, argCount:argCount = Wscript.Arguments.Count
If (argCount < 2) Then
	Wscript.Echo "Windows Installer utility to execute SQL queries against an installer database." &_
		vbLf & " The 1st argument specifies the path to the MSI database, relative or full path" &_
		vbLf & " Subsequent arguments specify SQL queries to execute - must be in double quotes" &_
		vbLf & " SELECT queries will display the rows of the result list specified in the query" &_
		vbLf & " Binary data columns selected by a query will not be displayed" &_
		vblf &_
		vblf & "Copyright (C) Microsoft Corporation.  All rights reserved."
	Wscript.Quit 1
End If

' Scan arguments for valid SQL keyword and to determine if any update operations
Dim openMode : openMode = msiOpenDatabaseModeReadOnly
For argNum = 1 To argCount - 1
	Dim keyword : keyword = Wscript.Arguments(argNum)
	Dim keywordLen : keywordLen = InStr(1, keyword, " ", vbTextCompare)
	If (keywordLen) Then keyword = UCase(Left(keyword, keywordLen - 1))
	If InStr(1, "UPDATE INSERT DELETE CREATE ALTER DROP", keyword, vbTextCompare) Then
		openMode = msiOpenDatabaseModeTransact
	ElseIf keyword <> "SELECT" Then
		Fail "Invalid SQL statement type: " & keyword
	End If
Next

' Connect to Windows installer object
On Error Resume Next
Dim installer : Set installer = Nothing
Set installer = Wscript.CreateObject("WindowsInstaller.Installer") : CheckError

' Open database
Dim databasePath:databasePath = Wscript.Arguments(0)
Dim database : Set database = installer.OpenDatabase(databasePath, openMode) : CheckError

' Process SQL statements
Dim query, view, record, message, rowData, columnCount, delim, column
For argNum = 1 To argCount - 1
	query = Wscript.Arguments(argNum)
	Set view = database.OpenView(query) : CheckError
	view.Execute : CheckError
	If Ucase(Left(query, 6)) = "SELECT" Then
		Do
			Set record = view.Fetch
			If record Is Nothing Then Exit Do
			columnCount = record.FieldCount
			rowData = Empty
			delim = "  "
			For column = 1 To columnCount
				If column = columnCount Then delim = vbLf
				rowData = rowData & record.StringData(column) & delim
			Next
			message = message & rowData
		Loop
	End If
Next
If openMode = msiOpenDatabaseModeTransact Then database.Commit
If Not IsEmpty(message) Then Wscript.Echo message
Wscript.Quit 0

Sub CheckError
	Dim message, errRec
	If Err = 0 Then Exit Sub
	message = Err.Source & " " & Hex(Err) & ": " & Err.Description
	If Not installer Is Nothing Then
		Set errRec = installer.LastErrorRecord
		If Not errRec Is Nothing Then message = message & vbLf & errRec.FormatText
	End If
	Fail message
End Sub

Sub Fail(message)
	Wscript.Echo message
	Wscript.Quit 2
End Sub

'' SIG '' Begin signature block
'' SIG '' MIIiTgYJKoZIhvcNAQcCoIIiPzCCIjsCAQExDzANBglg
'' SIG '' hkgBZQMEAgEFADB3BgorBgEEAYI3AgEEoGkwZzAyBgor
'' SIG '' BgEEAYI3AgEeMCQCAQEEEE7wKRaZJ7VNj+Ws4Q8X66sC
'' SIG '' AQACAQACAQACAQACAQAwMTANBglghkgBZQMEAgEFAAQg
'' SIG '' 4Xv5+5ronXWl5cvPsyZzr63fsdqLVPGyNx2CnUPSw9mg
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
'' SIG '' edIX09rBlI4HeyVxRKsGaubUxt8jmpZ1xTGCFhcwghYT
'' SIG '' AgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpX
'' SIG '' YXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
'' SIG '' VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNV
'' SIG '' BAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIw
'' SIG '' MTACEzMAAAFVaf+2twPOkq4AAAAAAVUwDQYJYIZIAWUD
'' SIG '' BAIBBQCgggEEMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3
'' SIG '' AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEV
'' SIG '' MC8GCSqGSIb3DQEJBDEiBCCTomCWupXq/cO2dABBvp7p
'' SIG '' lEiaCHSbP9k/KqOmsPL9uzA8BgorBgEEAYI3CgMcMS4M
'' SIG '' LHhjVUF2OFRCMzdrK1g4WllrU0pvbUl2ckZZam9kSDFs
'' SIG '' cEVnNWgxWWp3SFk9MFoGCisGAQQBgjcCAQwxTDBKoCSA
'' SIG '' IgBNAGkAYwByAG8AcwBvAGYAdAAgAFcAaQBuAGQAbwB3
'' SIG '' AHOhIoAgaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3dp
'' SIG '' bmRvd3MwDQYJKoZIhvcNAQEBBQAEggEActKP9Dpg/JFa
'' SIG '' DMsPxxMHJ2oXcLdxg2+f0rPm9fencB1kRhJzD4iic0Ls
'' SIG '' +if709/U353zwsqd/CJB+nRC+OawubSvz9mh8TKpBsqv
'' SIG '' 7nlxmyYsah6MVSkIOONiuB8sFt7TFvJLDv4i4tAwqcig
'' SIG '' 2eQL4kkezkrHZ9H/p5bhWDP4BBuvpCT8eOt/hQW59IjE
'' SIG '' AGw+etKbe6w7HTqMsWhnHvNWT/eG5/dmQrC8uLjgXpok
'' SIG '' AhG5Wnb/urBHvYNn2VGHqNQB6FaBzC9IyVjEQ3F+1mlM
'' SIG '' FF4R8KIPinrBz7q/wJa4xq0tQhX1QD8fFwyg54M908m1
'' SIG '' WG9XS8RhFFiuhex72n0IbqGCE0owghNGBgorBgEEAYI3
'' SIG '' AwMBMYITNjCCEzIGCSqGSIb3DQEHAqCCEyMwghMfAgED
'' SIG '' MQ8wDQYJYIZIAWUDBAIBBQAwggE9BgsqhkiG9w0BCRAB
'' SIG '' BKCCASwEggEoMIIBJAIBAQYKKwYBBAGEWQoDATAxMA0G
'' SIG '' CWCGSAFlAwQCAQUABCA+5w3zhI5SzyBMlm/Ni5wMel2H
'' SIG '' 2E3Z58Bza0x3JxfI/AIGWK+qJqYFGBMyMDE3MDMxOTEy
'' SIG '' MzAxNS41NDFaMAcCAQGAAgH0oIG5pIG2MIGzMQswCQYD
'' SIG '' VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
'' SIG '' A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
'' SIG '' IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScwJQYD
'' SIG '' VQQLEx5uQ2lwaGVyIERTRSBFU046QkJFQy0zMENBLTJE
'' SIG '' QkUxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
'' SIG '' IFNlcnZpY2Wggg7NMIIGcTCCBFmgAwIBAgIKYQmBKgAA
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
'' SIG '' AKGl/bnup/yenQAAAAAAoTANBgkqhkiG9w0BAQsFADB8
'' SIG '' MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
'' SIG '' bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
'' SIG '' cm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
'' SIG '' b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0xNjA5
'' SIG '' MDcxNzU2NDhaFw0xODA5MDcxNzU2NDhaMIGzMQswCQYD
'' SIG '' VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
'' SIG '' A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
'' SIG '' IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScwJQYD
'' SIG '' VQQLEx5uQ2lwaGVyIERTRSBFU046QkJFQy0zMENBLTJE
'' SIG '' QkUxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
'' SIG '' IFNlcnZpY2UwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
'' SIG '' ggEKAoIBAQCb0AF55iKvenwbdR7zt2fWHd6n3gA02BL5
'' SIG '' B+oIex9NTcqFlHqrdmsqB0WNUSfTtl1GpSXGYhR5i0/M
'' SIG '' 5iz17J9Neh00IjYquMPi7MVQ7dP9Q8Etv8Xw+s/MhJDr
'' SIG '' oqaybVegj7lhcNRJzogvgy47gUqTtUlKxGXJloXkL/qs
'' SIG '' 4thXHTP2vhDnwlIbE+D5FDaos5v02xXw9NJrfS24Vc4R
'' SIG '' 6Vb/lOkhDruRV8ycFXlwzY6s0+OBmZjDDgff23PFzylj
'' SIG '' 9T7sNxh6c/YkdbX8yTeUMFcH1aBAFU0LFrDm1TddPNjT
'' SIG '' q7yHl4d6VXNLYUPB8wmIkr7OuOWESjwWN5xBziCXgcgJ
'' SIG '' AgMBAAGjggEbMIIBFzAdBgNVHQ4EFgQUq1y5gr5xKtWP
'' SIG '' 4OiyKc/6G9O3+kgwHwYDVR0jBBgwFoAU1WM6XIoxkPND
'' SIG '' e3xGG8UzaFqFbVUwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0
'' SIG '' cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJv
'' SIG '' ZHVjdHMvTWljVGltU3RhUENBXzIwMTAtMDctMDEuY3Js
'' SIG '' MFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0
'' SIG '' cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9N
'' SIG '' aWNUaW1TdGFQQ0FfMjAxMC0wNy0wMS5jcnQwDAYDVR0T
'' SIG '' AQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkq
'' SIG '' hkiG9w0BAQsFAAOCAQEAI2BMuAVU6WfJvjk8FTLDE8iz
'' SIG '' AJB/FzOb/XYvXUwSs+iwJKL+svQfqLKOLk4QB1zo9zSK
'' SIG '' 7jQd6OFEhvge2949EpSHwZoPQ+Cb+hRhq7bqEuOqiGrX
'' SIG '' ZXflB1vQUFPRxVrUKC8qSlF5H3k5KnfHYeUjfyoF2iae
'' SIG '' 1UC24l/cOhN05Tr9qvs/Avwr+fggUlsoyl2yICjuHR70
'' SIG '' ioS8F1LqsxJxmiwdG04NeNHbkw0kXheISVQh/NhcJtDp
'' SIG '' E+Fsyk6/B7g7+eGcL0YMZTqcRbAJp3NMLGu21xZj4Pxy
'' SIG '' OJmmBc0ykUGiXvq7160Oe4XL8w93O3gy00+WkRRII8aK
'' SIG '' l5dYHf2lQaGCA3YwggJeAgEBMIHjoYG5pIG2MIGzMQsw
'' SIG '' CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
'' SIG '' MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
'' SIG '' b2Z0IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScw
'' SIG '' JQYDVQQLEx5uQ2lwaGVyIERTRSBFU046QkJFQy0zMENB
'' SIG '' LTJEQkUxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0
'' SIG '' YW1wIFNlcnZpY2WiJQoBATAJBgUrDgMCGgUAAxUAgq6J
'' SIG '' 9bTmPxZcILwX5MHDQM0562iggcIwgb+kgbwwgbkxCzAJ
'' SIG '' BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
'' SIG '' DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
'' SIG '' ZnQgQ29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAl
'' SIG '' BgNVBAsTHm5DaXBoZXIgTlRTIEVTTjo1N0Y2LUMxRTAt
'' SIG '' NTU0QzErMCkGA1UEAxMiTWljcm9zb2Z0IFRpbWUgU291
'' SIG '' cmNlIE1hc3RlciBDbG9jazANBgkqhkiG9w0BAQUFAAIF
'' SIG '' ANx4Tr4wIhgPMjAxNzAzMTkwMDI2MzhaGA8yMDE3MDMy
'' SIG '' MDAwMjYzOFowdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA
'' SIG '' 3HhOvgIBADAHAgEAAgIFeDAHAgEAAgIc4jAKAgUA3Hmg
'' SIG '' PgIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZ
'' SIG '' CgMBoAowCAIBAAIDFuNgoQowCAIBAAIDB6EgMA0GCSqG
'' SIG '' SIb3DQEBBQUAA4IBAQBHA8poJRCsUg/V9slRF66XiCzk
'' SIG '' fs8cj8n2jnnsLWGpHIqCu+ONcS+WJvbwjQV8Wqzk2TkO
'' SIG '' ALxWmcHC/Ce0RueYyUbNeagBdvio0O3bP5K/V5P/CJ6O
'' SIG '' w+qHYgYjLbWRf1VGHDXXL5z2J/ey70JD41Rx0ZVacZDD
'' SIG '' zGmX24nQMlEciQ2IM2GXqdFJwHdGSrFmerbhHWw64zW7
'' SIG '' noIbEnvV66aExyVEe/Pz+EDJGarllwoL9yptHS789UvY
'' SIG '' xyh5+HRfqGKWdxA4P0fhPPEVlqw5fKGcjXGWvD8RXP55
'' SIG '' FKDnOfY1fx5TUHDbTivSzNaoS0PKZTYvK55G53Q4e++W
'' SIG '' KwvjZTCvMYIC9TCCAvECAQEwgZMwfDELMAkGA1UEBhMC
'' SIG '' VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
'' SIG '' B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
'' SIG '' b3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUt
'' SIG '' U3RhbXAgUENBIDIwMTACEzMAAAChpf257qf8np0AAAAA
'' SIG '' AKEwDQYJYIZIAWUDBAIBBQCgggEyMBoGCSqGSIb3DQEJ
'' SIG '' AzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQg
'' SIG '' PmrLsLP9otY6D0i0Wih4BZIHnSjLczA5o4+r4GKQKfYw
'' SIG '' geIGCyqGSIb3DQEJEAIMMYHSMIHPMIHMMIGxBBSCron1
'' SIG '' tOY/FlwgvBfkwcNAzTnraDCBmDCBgKR+MHwxCzAJBgNV
'' SIG '' BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
'' SIG '' VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
'' SIG '' Q29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
'' SIG '' aW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAAoaX9ue6n/J6d
'' SIG '' AAAAAAChMBYEFKPTriIFcdHV+sxanaP9r28Dc5xfMA0G
'' SIG '' CSqGSIb3DQEBCwUABIIBAHqzktC3c9g7m4U1aMGl3dT7
'' SIG '' yYGJJdL6vO13RNiaseAf4uasMKswUUDvCILfMba+xavF
'' SIG '' s/yVIMFuvC6MZhFfyNLedu2n/l4coV0gyev3SvcPFQgV
'' SIG '' ZFP641MxUpJuN/weeS4VQMsn+056sxvVEmj3dOXp7lA9
'' SIG '' hDJ/n1lx3879heaHk007yGBkQJTOXOlBZIsPfaXDY/eR
'' SIG '' EU3QVujPTx+DoQu8lfK1OoLmk3gO73gluWlMYlEWMSt4
'' SIG '' utncn+uEm42+8wWLjKImK13aXGDU6EnWZ5ILUW6UFcCO
'' SIG '' iSJUxTmnvnszvMPUF/PHcDHS4m+zBquZtzPn4Mqa58M0
'' SIG '' V5DfUYPTpcc=
'' SIG '' End signature block
