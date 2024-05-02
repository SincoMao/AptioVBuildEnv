' Windows Installer utility to list feature composition in an MSI database
' For use with Windows Scripting Host, CScript.exe or WScript.exe
' Copyright (c) Microsoft Corporation. All rights reserved.
' Demonstrates the use of adding temporary columns to a read-only database
'
Option Explicit
Public isGUI, installer, database, message, featureParam, nextSequence  'global variables accessed across functions

Const msiOpenDatabaseModeReadOnly = 0
Const msiDbNullInteger            = &h80000000
Const msiViewModifyUpdate         = 2

' Check if run from GUI script host, in order to modify display
If UCase(Mid(Wscript.FullName, Len(Wscript.Path) + 2, 1)) = "W" Then isGUI = True

' Show help if no arguments or if argument contains ?
Dim argCount:argCount = Wscript.Arguments.Count
If argCount > 0 Then If InStr(1, Wscript.Arguments(0), "?", vbTextCompare) > 0 Then argCount = 0
If argCount = 0 Then
	Wscript.Echo "Windows Installer utility to list feature composition in an installer database." &_
		vbLf & " The 1st argument is the path to an install database, relative or complete path" &_
		vbLf & " The 2nd argument is the name of the feature (the primary key of Feature table)" &_
		vbLf & " If the 2nd argument is not present, all feature names will be listed as a tree" &_
		vbLf & " If the 2nd argument is ""*"" then the composition of all features will be listed" &_
		vbLf & " Large databases or features are better displayed by using CScript than WScript" &_
		vbLf & " Note: The name of the feature, if provided,  is case-sensitive" &_
		vbNewLine &_
		vbNewLine & "Copyright (C) Microsoft Corporation.  All rights reserved."
	Wscript.Quit 1
End If

' Connect to Windows Installer object
On Error Resume Next
Set installer = Nothing
Set installer = Wscript.CreateObject("WindowsInstaller.Installer") : CheckError

' Open database
Dim databasePath:databasePath = Wscript.Arguments(0)
Set database = installer.OpenDatabase(databasePath, msiOpenDatabaseModeReadOnly) : CheckError
REM Set database = installer.OpenDatabase(databasePath, 1) : CheckError

If argCount = 1 Then  'If no feature specified, then simply list features
	ListFeatures False
	ShowOutput "Features for " & databasePath, message
ElseIf Left(Wscript.Arguments(1), 1) = "*" Then 'List all features
	ListFeatures True
Else
	QueryFeature Wscript.Arguments(1) 
End If
Wscript.Quit 0

' List all table rows referencing a given feature
Function QueryFeature(feature)
	' Get feature info and format output header
	Dim view, record, header, parent
	Set view = database.OpenView("SELECT `Feature_Parent` FROM `Feature` WHERE `Feature` = ?") : CheckError
	Set featureParam = installer.CreateRecord(1)
	featureParam.StringData(1) = feature
	view.Execute featureParam : CheckError
	Set record = view.Fetch : CheckError
	Set view = Nothing
	If record Is Nothing Then Fail "Feature not in database: " & feature
	parent = record.StringData(1)
	header = "Feature: "& feature & "  Parent: " & parent

	' List of tables with foreign keys to Feature table - with subsets of columns to display
	DoQuery "FeatureComponents","Component_"                         '
	DoQuery "Condition",        "Level,Condition"                    '
	DoQuery "Billboard",        "Billboard,Action"                   'Ordering

	QueryFeature = ShowOutput(header, message)
	message = Empty
End Function

' Query used for sorting and corresponding record field indices
const irecParent   = 1  'put first in order to use as query parameter
const irecChild    = 2  'primary key of Feature table
const irecSequence = 3  'temporary column added for sorting
const sqlSort = "SELECT `Feature_Parent`,`Feature`,`Sequence` FROM `Feature`"

' Recursive function to resolve parent feature chain, return tree level (low order 8 bits of sequence number)
Function LinkParent(childView)
	Dim view, record, level
	On Error Resume Next
	Set record = childView.Fetch
	If record Is Nothing Then Exit Function  'return Empty if no record found
	If Not record.IsNull(irecSequence) Then LinkParent = (record.IntegerData(irecSequence) And 255) + 1 : Exit Function 'Already resolved
	If record.IsNull(irecParent) Or record.StringData(irecParent) = record.StringData(irecChild) Then 'Root node
		level = 0
	Else  'child node, need to get level from parent
		Set view = database.OpenView(sqlSort & " WHERE `Feature` = ?") : CheckError
		view.Execute record : CheckError '1st param is parent feature
		level = LinkParent(view)
		If IsEmpty(level) Then Fail "Feature parent does not exist: " & record.StringData(irecParent)
	End If
	record.IntegerData(irecSequence) = nextSequence + level
	nextSequence = nextSequence + 256
	childView.Modify msiViewModifyUpdate, record : CheckError
	LinkParent = level + 1
End Function

' List all features in database, sorted hierarchically
Sub ListFeatures(queryAll)
	Dim viewSchema, view, record, feature, level
	On Error Resume Next
	Set viewSchema = database.OpenView("ALTER TABLE Feature ADD Sequence LONG TEMPORARY") : CheckError
	viewSchema.Execute : CheckError  'Add ordering column, keep view open to hold temp columns
	Set view = database.OpenView(sqlSort) : CheckError
	view.Execute : CheckError
	nextSequence = 0
	While LinkParent(view) : Wend  'Loop to link rows hierachically
	Set view = database.OpenView("SELECT `Feature`,`Title`, `Sequence` FROM `Feature` ORDER BY Sequence") : CheckError
	view.Execute : CheckError
	Do
		Set record = view.Fetch : CheckError
		If record Is Nothing Then Exit Do
		feature = record.StringData(1)
		level = record.IntegerData(3) And 255
		If queryAll Then
			If QueryFeature(feature) = vbCancel Then Exit Sub
		Else
			If Not IsEmpty(message) Then message = message & vbLf
			message = message & Space(level * 2) & feature & "  (" & record.StringData(2) & ")"
		End If
	Loop
End Sub

' Perform a join to query table rows linked to a given feature, delimiting and qualifying names to prevent conflicts
Sub DoQuery(table, columns)
	Dim view, record, columnCount, column, output, header, delim, columnList, tableList, tableDelim, query, joinTable, primaryKey, foreignKey, columnDelim
	On Error Resume Next
	tableList  = Replace(table,   ",", "`,`")
	tableDelim = InStr(1, table, ",", vbTextCompare)
	If tableDelim Then  ' need a 3-table join
		joinTable = Right(table, Len(table)-tableDelim)
		table = Left(table, tableDelim-1)
		foreignKey = columns
		Set record = database.PrimaryKeys(joinTable)
		primaryKey = record.StringData(1)
		columnDelim = InStr(1, columns, ",", vbTextCompare)
		If columnDelim Then foreignKey = Left(columns, columnDelim - 1)
		query = " AND `" & foreignKey & "` = `" & primaryKey & "`"
	End If
	columnList = table & "`." & Replace(columns, ",", "`,`" & table & "`.`")
	query = "SELECT `" & columnList & "` FROM `" & tableList & "` WHERE `Feature_` = ?" & query
	If database.TablePersistent(table) <> 1 Then Exit Sub
	Set view = database.OpenView(query) : CheckError
	view.Execute featureParam : CheckError
	Do
		Set record = view.Fetch : CheckError
		If record Is Nothing Then Exit Do
		If IsEmpty(output) Then
			If Not IsEmpty(message) Then message = message & vbLf
			message = message & "----" & table & " Table----  (" & columns & ")" & vbLf
		End If
		output = Empty
		columnCount = record.FieldCount
		delim = "  "
		For column = 1 To columnCount
			If column = columnCount Then delim = vbLf
			output = output & record.StringData(column) & delim
		Next
		message = message & output
	Loop
End Sub

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

Function ShowOutput(header, message)
	ShowOutput = vbOK
	If IsEmpty(message) Then Exit Function
	If isGUI Then
		ShowOutput = MsgBox(message, vbOKCancel, header)
	Else
		Wscript.Echo "> " & header
		Wscript.Echo message
	End If
End Function

Sub Fail(message)
	Wscript.Echo message
	Wscript.Quit 2
End Sub

'' SIG '' Begin signature block
'' SIG '' MIIiUQYJKoZIhvcNAQcCoIIiQjCCIj4CAQExDzANBglg
'' SIG '' hkgBZQMEAgEFADB3BgorBgEEAYI3AgEEoGkwZzAyBgor
'' SIG '' BgEEAYI3AgEeMCQCAQEEEE7wKRaZJ7VNj+Ws4Q8X66sC
'' SIG '' AQACAQACAQACAQACAQAwMTANBglghkgBZQMEAgEFAAQg
'' SIG '' o40u8w/79QYYEVTk+LHUW40T5s95rhdh/xj2PF/Wgf2g
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
'' SIG '' edIX09rBlI4HeyVxRKsGaubUxt8jmpZ1xTGCFhowghYW
'' SIG '' AgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpX
'' SIG '' YXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
'' SIG '' VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNV
'' SIG '' BAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIw
'' SIG '' MTACEzMAAAFVaf+2twPOkq4AAAAAAVUwDQYJYIZIAWUD
'' SIG '' BAIBBQCgggEEMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3
'' SIG '' AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEV
'' SIG '' MC8GCSqGSIb3DQEJBDEiBCBmLaNeceZdSz7AECnK5Pxb
'' SIG '' f4krRCXeVr7WqcKeY8ATRDA8BgorBgEEAYI3CgMcMS4M
'' SIG '' LGQ4dmhKUEFmQ2dWTjcvKzRKQS9NZEZnM3hRVkN2d3FE
'' SIG '' T0ZjOEkyeW5vMTg9MFoGCisGAQQBgjcCAQwxTDBKoCSA
'' SIG '' IgBNAGkAYwByAG8AcwBvAGYAdAAgAFcAaQBuAGQAbwB3
'' SIG '' AHOhIoAgaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3dp
'' SIG '' bmRvd3MwDQYJKoZIhvcNAQEBBQAEggEAEA7zQwHXRtKO
'' SIG '' TY7t7OiQyBsnYKLTtklioYdmpygR6GjeARDxTj31oCIx
'' SIG '' PSM7KMrbmj7OlYiUteFoBjUxbqZsTG5B5cIVxKH10rzr
'' SIG '' 0GhlmPtzpg3gM71CXdh/wnb0eB9PTnRD8chliS8si5yh
'' SIG '' RaXR+QVbDX9KepugJbmrH2DJ3AxNvhAN45pz06OlwRKY
'' SIG '' /ycVINX+UcyZidXw0z6jMconCIRqcqIpeXg/BSw6wusN
'' SIG '' 8hoNmnxQmzEkmgZA+fbTvT2e4LdhRg5NxLzsXkBfvFvj
'' SIG '' NsLg7HbwTuDdSx2i/SJvXpsoCBl0ClY7fhGlVp3oYPYA
'' SIG '' C2rtM1ssnSv3dqn8OSv+NaGCE00wghNJBgorBgEEAYI3
'' SIG '' AwMBMYITOTCCEzUGCSqGSIb3DQEHAqCCEyYwghMiAgED
'' SIG '' MQ8wDQYJYIZIAWUDBAIBBQAwggE9BgsqhkiG9w0BCRAB
'' SIG '' BKCCASwEggEoMIIBJAIBAQYKKwYBBAGEWQoDATAxMA0G
'' SIG '' CWCGSAFlAwQCAQUABCB6DuMXILQEvfq4b06omWITIlUZ
'' SIG '' yjtV7uJ/zC9CNi9EWAIGWK+zLoemGBMyMDE3MDMxOTEy
'' SIG '' MjY0NC40NDRaMAcCAQGAAgH0oIG5pIG2MIGzMQswCQYD
'' SIG '' VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
'' SIG '' A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
'' SIG '' IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScwJQYD
'' SIG '' VQQLEx5uQ2lwaGVyIERTRSBFU046QjhFQy0zMEE0LTcx
'' SIG '' NDQxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
'' SIG '' IFNlcnZpY2Wggg7QMIIGcTCCBFmgAwIBAgIKYQmBKgAA
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
'' SIG '' AJ9n8rWoIwZbewAAAAAAnzANBgkqhkiG9w0BAQsFADB8
'' SIG '' MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
'' SIG '' bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
'' SIG '' cm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
'' SIG '' b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0xNjA5
'' SIG '' MDcxNzU2NDdaFw0xODA5MDcxNzU2NDdaMIGzMQswCQYD
'' SIG '' VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
'' SIG '' A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
'' SIG '' IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScwJQYD
'' SIG '' VQQLEx5uQ2lwaGVyIERTRSBFU046QjhFQy0zMEE0LTcx
'' SIG '' NDQxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
'' SIG '' IFNlcnZpY2UwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
'' SIG '' ggEKAoIBAQC5CPEjnN3EAi8ChaGjJ5dk+QOcElQ/U4Ja
'' SIG '' uD7rfW4YxXLBJ9VwKQzwlkvWj4THFjlinvuxDSOEouMw
'' SIG '' 99J1UAvT2dDQ7vqSvV1fNzn4xnIRZCszgUXXToabEJMR
'' SIG '' YDBd0Xy0zVwBKn35zWkXl8LVVJIhhCb1uipgAYscz9Gn
'' SIG '' lFZiejB5yZ5qPkymXaFZe3IOk2OiwqM3vxeq4Tl5ovz9
'' SIG '' 1/yt4x7ZgGsS/Trud44w4DuUY8bemRGpnRLBhdklmesB
'' SIG '' +g5oPRuomT8YMPpozg8EXi+o8Iex9l4bL86BTK0hETMy
'' SIG '' CH9niRgDPQtBkdAWR8kbYte0Ki+U2grlj4zMUyl1+A5Z
'' SIG '' AgMBAAGjggEbMIIBFzAdBgNVHQ4EFgQU/YsbIsN9I0d2
'' SIG '' ph7f4GbUUum2+aAwHwYDVR0jBBgwFoAU1WM6XIoxkPND
'' SIG '' e3xGG8UzaFqFbVUwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0
'' SIG '' cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJv
'' SIG '' ZHVjdHMvTWljVGltU3RhUENBXzIwMTAtMDctMDEuY3Js
'' SIG '' MFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0
'' SIG '' cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9N
'' SIG '' aWNUaW1TdGFQQ0FfMjAxMC0wNy0wMS5jcnQwDAYDVR0T
'' SIG '' AQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkq
'' SIG '' hkiG9w0BAQsFAAOCAQEAZRDBbGvPFR6vD0g2698tC7wA
'' SIG '' AOaRZhpQlmW5MQ9ljKnxdMvH55b4G/O+M/LM/EGcwcgp
'' SIG '' mNYx8h03PfGXpM+y9mOUgDVCGvI8lN+nOuApOX2Oj3vY
'' SIG '' VANURv9cz/nqtPNHIVDwhds3s4X8Ls/Tm9KGzuuAcFtB
'' SIG '' mYGGM9YY7KvgwZEggUVefa8hac4CkcIVhfKrl7Rw6Ypo
'' SIG '' icfnbNlWUsBFZP0EWO6S7lL3nTfD+Qzbi2mkcN6CXLNl
'' SIG '' sYdo1kuU/GNyXr1KNyt1U7Rz4tiAViEpBBu0zpzRFHFF
'' SIG '' wzBkjnmdu5LjxcypA1W7c78BFXqZBq7GdVvtcbg2D0NW
'' SIG '' 9wTBvAu/R6GCA3kwggJhAgEBMIHjoYG5pIG2MIGzMQsw
'' SIG '' CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
'' SIG '' MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
'' SIG '' b2Z0IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScw
'' SIG '' JQYDVQQLEx5uQ2lwaGVyIERTRSBFU046QjhFQy0zMEE0
'' SIG '' LTcxNDQxJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0
'' SIG '' YW1wIFNlcnZpY2WiJQoBATAJBgUrDgMCGgUAAxUAbNMn
'' SIG '' CPL52ajL+RnekktKrdsZo8GggcIwgb+kgbwwgbkxCzAJ
'' SIG '' BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
'' SIG '' DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
'' SIG '' ZnQgQ29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAl
'' SIG '' BgNVBAsTHm5DaXBoZXIgTlRTIEVTTjo1N0Y2LUMxRTAt
'' SIG '' NTU0QzErMCkGA1UEAxMiTWljcm9zb2Z0IFRpbWUgU291
'' SIG '' cmNlIE1hc3RlciBDbG9jazANBgkqhkiG9w0BAQUFAAIF
'' SIG '' ANx4TgQwIhgPMjAxNzAzMTkwMDIzMzJaGA8yMDE3MDMy
'' SIG '' MDAwMjMzMlowdzA9BgorBgEEAYRZCgQBMS8wLTAKAgUA
'' SIG '' 3HhOBAIBADAKAgEAAgIAqwIB/zAHAgEAAgIbRTAKAgUA
'' SIG '' 3HmfhAIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEE
'' SIG '' AYRZCgMBoAowCAIBAAIDFuNgoQowCAIBAAIDB6EgMA0G
'' SIG '' CSqGSIb3DQEBBQUAA4IBAQAB2KbR4sESJJa3F71YYIPi
'' SIG '' MGEtyPD27ksqA9UY2P0uJ+Aiv0z/GkWTcRKWlXRJxaKw
'' SIG '' kYvhsyPDX1dqmRSl7GXg7FAqtD/sjqrndI/bo/KC4R1Q
'' SIG '' Bdw0E1oV1LS4ioM3Hrgeyhvq7kxLApu0OWyHO/d+wp4x
'' SIG '' bn3GVnoU3qoc4mnUOuDBecq8cbuztcAJcKS968Wf4wp9
'' SIG '' +s7nKkC8u1Eez5a2tze8+p/vsbYToL5TRqH8v2YpClK9
'' SIG '' RwaetbVbm3WQlNnQlIXyYcIiO7KU75WslDcrg8edOb4P
'' SIG '' axLrZiQua0GbIfvZ9wmFpzkDGVmfwB39FptgPaloA/wM
'' SIG '' tQvrLYZ4x1M9MYIC9TCCAvECAQEwgZMwfDELMAkGA1UE
'' SIG '' BhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNV
'' SIG '' BAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBD
'' SIG '' b3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRp
'' SIG '' bWUtU3RhbXAgUENBIDIwMTACEzMAAACfZ/K1qCMGW3sA
'' SIG '' AAAAAJ8wDQYJYIZIAWUDBAIBBQCgggEyMBoGCSqGSIb3
'' SIG '' DQEJAzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQx
'' SIG '' IgQgyFXZrXSJIMQImRyyHs7CXowkYgAt6MezEGTqQMvR
'' SIG '' snwwgeIGCyqGSIb3DQEJEAIMMYHSMIHPMIHMMIGxBBRs
'' SIG '' 0ycI8vnZqMv5Gd6SS0qt2xmjwTCBmDCBgKR+MHwxCzAJ
'' SIG '' BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
'' SIG '' DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
'' SIG '' ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29m
'' SIG '' dCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAAn2fytagj
'' SIG '' Blt7AAAAAACfMBYEFDDNHFUoHEUOnkCjzyALAxxVOp+1
'' SIG '' MA0GCSqGSIb3DQEBCwUABIIBAJQXOjFMZndzlR/WGNc9
'' SIG '' rs71nYaeUpHJwhPHHw3H1xkCTgGby2pDPAK17J3EB95p
'' SIG '' jBft1tJiOG6FN21M8QV+6DUHch4n6W0f6vmQvGODooni
'' SIG '' 4t1H8NAcZ7b8JO0jotOyahKHM2WU7TudC5ZXhvJk8HeZ
'' SIG '' Zs4+cgLX1xVSmH9vz++6zzp3Sv0KfNBBMTq1Yj7EwPUD
'' SIG '' FNBtXC15OFv9O77ikYFl6Xosw9jKgxPmPbw+qEOE91QW
'' SIG '' Ilg+iGTW1WmJ7m/Jy9KObZRDL0UJpDkYTSTIflwsgGQ5
'' SIG '' saTo2jKaLDwcTM+6Oz0bNsWMKExw9Iko3kNuMtk+DStO
'' SIG '' KpjnOrnHoY/0f2o=
'' SIG '' End signature block
