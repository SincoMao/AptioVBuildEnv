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
'' SIG '' MIIiSwYJKoZIhvcNAQcCoIIiPDCCIjgCAQExDzANBglg
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
'' SIG '' edIX09rBlI4HeyVxRKsGaubUxt8jmpZ1xTGCFhQwghYQ
'' SIG '' AgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpX
'' SIG '' YXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
'' SIG '' VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNV
'' SIG '' BAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIw
'' SIG '' MTACEzMAAAFVaf+2twPOkq4AAAAAAVUwDQYJYIZIAWUD
'' SIG '' BAIBBQCgggEEMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3
'' SIG '' AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEV
'' SIG '' MC8GCSqGSIb3DQEJBDEiBCCTomCWupXq/cO2dABBvp7p
'' SIG '' lEiaCHSbP9k/KqOmsPL9uzA8BgorBgEEAYI3CgMcMS4M
'' SIG '' LDMyWkltU2RBK3g3VFRZZWFlcjhPYk9ldHlseGJ3ZzRX
'' SIG '' a3NsYTR1bGZ6Tkk9MFoGCisGAQQBgjcCAQwxTDBKoCSA
'' SIG '' IgBNAGkAYwByAG8AcwBvAGYAdAAgAFcAaQBuAGQAbwB3
'' SIG '' AHOhIoAgaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3dp
'' SIG '' bmRvd3MwDQYJKoZIhvcNAQEBBQAEggEAeN+R3J67wpry
'' SIG '' liUXzCNip8UxqmE+Uhb8HLCy5vS1m1IE4s5AOVPGfk5Z
'' SIG '' 5tVovPLJtUnPXkKqHiXkXnhei7s+klSDgzkTp7bf/xST
'' SIG '' ws0EEnbGioayHcGBpEU9XWAKpmYX5X8iw4fuoKto+GzL
'' SIG '' f715EyRq3W/MlkjvogosQZBU5VO1dy/aXu+Th2SrlJx9
'' SIG '' NK6upabFnS6oNgZohQHwqRejpTd+0GfYLOZeSDfW4YGs
'' SIG '' yQo6UqjMzyWHeHd6nyXBVypKB8OV6O/NF660JdbStmvv
'' SIG '' Xa2t+Fy/bx+w73WiScXK++cqEmQdmT3D9Yhj3RD8fejZ
'' SIG '' gTXm1ytPd8Fs/+7KwB0KOaGCE0cwghNDBgorBgEEAYI3
'' SIG '' AwMBMYITMzCCEy8GCSqGSIb3DQEHAqCCEyAwghMcAgED
'' SIG '' MQ8wDQYJYIZIAWUDBAIBBQAwggE6BgsqhkiG9w0BCRAB
'' SIG '' BKCCASkEggElMIIBIQIBAQYKKwYBBAGEWQoDATAxMA0G
'' SIG '' CWCGSAFlAwQCAQUABCBkJ/ymKwio8ixK1utJO1UW2mur
'' SIG '' DvhVMKTXWmVcHPgR4wIGWK+TMHPsGBMyMDE3MDMxOTEy
'' SIG '' MTk1NC42MzVaMASAAgH0oIG5pIG2MIGzMQswCQYDVQQG
'' SIG '' EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
'' SIG '' BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
'' SIG '' cnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScwJQYDVQQL
'' SIG '' Ex5uQ2lwaGVyIERTRSBFU046MTQ4Qy1DNEI5LTIwNjYx
'' SIG '' JTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNl
'' SIG '' cnZpY2Wggg7NMIIGcTCCBFmgAwIBAgIKYQmBKgAAAAAA
'' SIG '' AjANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMx
'' SIG '' EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
'' SIG '' ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
'' SIG '' dGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2Vy
'' SIG '' dGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMTAwNzAx
'' SIG '' MjEzNjU1WhcNMjUwNzAxMjE0NjU1WjB8MQswCQYDVQQG
'' SIG '' EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
'' SIG '' BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
'' SIG '' cnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGlt
'' SIG '' ZS1TdGFtcCBQQ0EgMjAxMDCCASIwDQYJKoZIhvcNAQEB
'' SIG '' BQADggEPADCCAQoCggEBAKkdDbx3EYo6IOz8E5f1+n9p
'' SIG '' lGt0VBDVpQoAgoX77XxoSyxfxcPlYcJ2tz5mK1vwFVMn
'' SIG '' BDEfQRsalR3OCROOfGEwWbEwRA/xYIiEVEMM1024OAiz
'' SIG '' Qt2TrNZzMFcmgqNFDdDq9UeBzb8kYDJYYEbyWEeGMoQe
'' SIG '' dGFnkV+BVLHPk0ySwcSmXdFhE24oxhr5hoC732H8RsEn
'' SIG '' HSRnEnIaIYqvS2SJUGKxXf13Hz3wV3WsvYpCTUBR0Q+c
'' SIG '' Bj5nf/VmwAOWRH7v0Ev9buWayrGo8noqCjHw2k4GkbaI
'' SIG '' CDXoeByw6ZnNPOcvRLqn9NxkvaQBwSAJk3jN/LzAyURd
'' SIG '' XhacAQVPIk0CAwEAAaOCAeYwggHiMBAGCSsGAQQBgjcV
'' SIG '' AQQDAgEAMB0GA1UdDgQWBBTVYzpcijGQ80N7fEYbxTNo
'' SIG '' WoVtVTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTAL
'' SIG '' BgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNV
'' SIG '' HSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBWBgNV
'' SIG '' HR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29m
'' SIG '' dC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJB
'' SIG '' dXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUHAQEETjBM
'' SIG '' MEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29m
'' SIG '' dC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEw
'' SIG '' LTA2LTIzLmNydDCBoAYDVR0gAQH/BIGVMIGSMIGPBgkr
'' SIG '' BgEEAYI3LgMwgYEwPQYIKwYBBQUHAgEWMWh0dHA6Ly93
'' SIG '' d3cubWljcm9zb2Z0LmNvbS9QS0kvZG9jcy9DUFMvZGVm
'' SIG '' YXVsdC5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcA
'' SIG '' YQBsAF8AUABvAGwAaQBjAHkAXwBTAHQAYQB0AGUAbQBl
'' SIG '' AG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAAfmiFEN
'' SIG '' 4sbgmD+BcQM9naOhIW+z66bM9TG+zwXiqf76V20ZMLPC
'' SIG '' xWbJat/15/B4vceoniXj+bzta1RXCCtRgkQS+7lTjMz0
'' SIG '' YBKKdsxAQEGb3FwX/1z5Xhc1mCRWS3TvQhDIr79/xn/y
'' SIG '' N31aPxzymXlKkVIArzgPF/UveYFl2am1a+THzvbKegBv
'' SIG '' SzBEJCI8z+0DpZaPWSm8tv0E4XCfMkon/VWvL/625Y4z
'' SIG '' u2JfmttXQOnxzplmkIz/amJ/3cVKC5Em4jnsGUpxY517
'' SIG '' IW3DnKOiPPp/fZZqkHimbdLhnPkd/DjYlPTGpQqWhqS9
'' SIG '' nhquBEKDuLWAmyI4ILUl5WTs9/S/fmNZJQ96LjlXdqJx
'' SIG '' qgaKD4kWumGnEcua2A5HmoDF0M2n0O99g/DhO3EJ3110
'' SIG '' mCIIYdqwUB5vvfHhAN/nMQekkzr3ZUd46PioSKv33nJ+
'' SIG '' YWtvd6mBy6cJrDm77MbL2IK0cs0d9LiFAR6A+xuJKlQ5
'' SIG '' slvayA1VmXqHczsI5pgt6o3gMy4SKfXAL1QnIffIrE7a
'' SIG '' KLixqduWsqdCosnPGUFN4Ib5KpqjEWYw07t0MkvfY3v1
'' SIG '' mYovG8chr1m1rtxEPJdQcdeh0sVV42neV8HR3jDA/czm
'' SIG '' TfsNv11P6Z0eGTgvvM9YBS7vDaBQNdrvCScc1bN+NR4I
'' SIG '' uto229Nfj950iEkSMIIE2jCCA8KgAwIBAgITMwAAALRD
'' SIG '' Ohz+trpSiQAAAAAAtDANBgkqhkiG9w0BAQsFADB8MQsw
'' SIG '' CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
'' SIG '' MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
'' SIG '' b2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3Nv
'' SIG '' ZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0xNjA5MDcx
'' SIG '' NzU2NThaFw0xODA5MDcxNzU2NThaMIGzMQswCQYDVQQG
'' SIG '' EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
'' SIG '' BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENv
'' SIG '' cnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScwJQYDVQQL
'' SIG '' Ex5uQ2lwaGVyIERTRSBFU046MTQ4Qy1DNEI5LTIwNjYx
'' SIG '' JTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNl
'' SIG '' cnZpY2UwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
'' SIG '' AoIBAQDggU+7tdEwOj+DALfMVp/3m6y6s11kER6C1nrX
'' SIG '' 7iD7s9EIAWOXV6fC4kxWqLVX26DG37PRGLEefpGsGRlR
'' SIG '' bXP+ni1tJEIgxMjvRmnQbxxMYWqUMw+UPtuibyUqvxnS
'' SIG '' zgM6UhWARWUb/c+1/zeyaGaZZa3u/76BTUOeC3gJ1iqP
'' SIG '' PYq0BzPZsFAkUe9/9STUFQyPdhjYVry1baMpdNh1B0hA
'' SIG '' GY5mGJECAnAbQdv5J6EZdcaWqPpBL7t6xTSmMKCXk8ca
'' SIG '' bABagraMAGeSy8xN0myp48ReeQsBla6opLki/vlFXj99
'' SIG '' GRthnDd02aNRxe5I2VQzFINfsucPe7AfyZe+mYVxAgMB
'' SIG '' AAGjggEbMIIBFzAdBgNVHQ4EFgQUDJOrRdRsC3cv8ytX
'' SIG '' 8+kkxIcH9F8wHwYDVR0jBBgwFoAU1WM6XIoxkPNDe3xG
'' SIG '' G8UzaFqFbVUwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0cDov
'' SIG '' L2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVj
'' SIG '' dHMvTWljVGltU3RhUENBXzIwMTAtMDctMDEuY3JsMFoG
'' SIG '' CCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0cDov
'' SIG '' L3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNU
'' SIG '' aW1TdGFQQ0FfMjAxMC0wNy0wMS5jcnQwDAYDVR0TAQH/
'' SIG '' BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkqhkiG
'' SIG '' 9w0BAQsFAAOCAQEAArVhW6Cn0mqsJi+2wjSjdPuoe5Cx
'' SIG '' gi2oiRJdpPaCC1k9J+d6HXks+Mtyz0dr72/e65Jt7q/7
'' SIG '' XqGRhHjjX1F7xJcx4FCN7bqZ94gqv1Fq4iPkN0fdZuLF
'' SIG '' hQjs/nVx63ptSYklIR2djhbkWKTmqJW1m7SToYosuJwh
'' SIG '' OrwBUR+Y4J/z7epQzLs3hClq8CJspU+uExF5ZmRwJ6MM
'' SIG '' +rTeTLtQfsSff+mBUQTerhRf5g4MEIG6Rqw7YhLntdEK
'' SIG '' MPDTKez603Axbgp6JFHCIuYOIrdDUapTVSL1JLXn03V4
'' SIG '' KaE6W2kK4K18mc+ftJIoB36qcMQyhltKDthEtvU+Zx95
'' SIG '' w/IrU6GCA3YwggJeAgEBMIHjoYG5pIG2MIGzMQswCQYD
'' SIG '' VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
'' SIG '' A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
'' SIG '' IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScwJQYD
'' SIG '' VQQLEx5uQ2lwaGVyIERTRSBFU046MTQ4Qy1DNEI5LTIw
'' SIG '' NjYxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
'' SIG '' IFNlcnZpY2WiJQoBATAJBgUrDgMCGgUAAxUAB8CVl64u
'' SIG '' Tm7J03X22YlRmIsgbTqggcIwgb+kgbwwgbkxCzAJBgNV
'' SIG '' BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
'' SIG '' VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
'' SIG '' Q29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAlBgNV
'' SIG '' BAsTHm5DaXBoZXIgTlRTIEVTTjo0REU5LTBDNUUtM0Uw
'' SIG '' OTErMCkGA1UEAxMiTWljcm9zb2Z0IFRpbWUgU291cmNl
'' SIG '' IE1hc3RlciBDbG9jazANBgkqhkiG9w0BAQUFAAIFANx4
'' SIG '' jiEwIhgPMjAxNzAzMTkwNDU3MDVaGA8yMDE3MDMyMDA0
'' SIG '' NTcwNVowdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA3HiO
'' SIG '' IQIBADAHAgEAAgIN1jAHAgEAAgIfAzAKAgUA3HnfoQIB
'' SIG '' ADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZCgMB
'' SIG '' oAowCAIBAAIDB6EgoQowCAIBAAIDB6EgMA0GCSqGSIb3
'' SIG '' DQEBBQUAA4IBAQBIDYrjHSCYkNoU0UDvC0Lf7fZUw2xg
'' SIG '' zaL8/TXEobY35P74t23brmwOhgWq3ZWjIEcezAPW5li8
'' SIG '' 7d6McUJF1SLdlxzcpQedY+vxv+3Irx0dO1DlGRADEZpB
'' SIG '' nXgU/GB/rfew98LK1YL78YB3ahIvF+Hrf0UNSlCfVbAo
'' SIG '' AA5GCj2hJq1c1o6qQT3ifsrvtrPRswwSKieYG6IfwPfd
'' SIG '' jHXgimKU3TDNnOiv4NpfJhtSJ+eBSaFvVu+8vE8HIxuu
'' SIG '' rBD3N73eHur+ki7tGM406IW+jWK1DRysOE54AtFynyHm
'' SIG '' mNqgmIf8n7Z8O7KqgFTJ82f1un/C+tOAopn24Q1l30HX
'' SIG '' E4+3MYIC9TCCAvECAQEwgZMwfDELMAkGA1UEBhMCVVMx
'' SIG '' EzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
'' SIG '' ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
'' SIG '' dGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3Rh
'' SIG '' bXAgUENBIDIwMTACEzMAAAC0Qzoc/ra6UokAAAAAALQw
'' SIG '' DQYJYIZIAWUDBAIBBQCgggEyMBoGCSqGSIb3DQEJAzEN
'' SIG '' BgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQgNsPG
'' SIG '' Mv8ArgaNsC2FrZU+bJS+BDCVKZ2xVRfkpqzDYXQwgeIG
'' SIG '' CyqGSIb3DQEJEAIMMYHSMIHPMIHMMIGxBBQHwJWXri5O
'' SIG '' bsnTdfbZiVGYiyBtOjCBmDCBgKR+MHwxCzAJBgNVBAYT
'' SIG '' AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
'' SIG '' EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
'' SIG '' cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1l
'' SIG '' LVN0YW1wIFBDQSAyMDEwAhMzAAAAtEM6HP62ulKJAAAA
'' SIG '' AAC0MBYEFJ7fiqVBTwzeolUPDrr6SolQSeGGMA0GCSqG
'' SIG '' SIb3DQEBCwUABIIBALiedItxOsXn+oABOfw3V0IBFPo2
'' SIG '' NIz4CNbYM+j0x8HDC7ruK0VZ5C/51rIA2REyfUXw1JUe
'' SIG '' fJddbnManPjrCJWEuiTbbJM4RHKkIDI9mYoBJWxydPFI
'' SIG '' TAKp9kpMRU3pgpTkwLDZRHL6hrTOQEO/M2XiaUhVhvxd
'' SIG '' u4tcWShYalBiGt8u/umd2nsdNa3EUVb4Ppn3iP4fPhdv
'' SIG '' s0LlSzxUnNM40LnVgrdMD+wfj/1wkZwjRI4N9OgRex7G
'' SIG '' SFt7dhxyQAa/ZIC19YAJsvNNm734WRamYuThjrX1BFy8
'' SIG '' u2d0rXkdQQF6NnRPeUWG4L/sq/GHqgyXsJkLdCl2BiD+
'' SIG '' CXl46PI=
'' SIG '' End signature block
