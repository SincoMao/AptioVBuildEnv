' Windows Installer utility to report or update file versions, sizes, languages
' For use with Windows Scripting Host, CScript.exe or WScript.exe
' Copyright (c) Microsoft Corporation. All rights reserved.
' Demonstrates the access to install engine and actions
'
Option Explicit

' FileSystemObject.CreateTextFile and FileSystemObject.OpenTextFile
Const OpenAsASCII   = 0 
Const OpenAsUnicode = -1

' FileSystemObject.CreateTextFile
Const OverwriteIfExist = -1
Const FailIfExist      = 0

' FileSystemObject.OpenTextFile
Const OpenAsDefault    = -2
Const CreateIfNotExist = -1
Const FailIfNotExist   = 0
Const ForReading = 1
Const ForWriting = 2
Const ForAppending = 8

Const msiOpenDatabaseModeReadOnly = 0
Const msiOpenDatabaseModeTransact = 1

Const msiViewModifyInsert         = 1
Const msiViewModifyUpdate         = 2
Const msiViewModifyAssign         = 3
Const msiViewModifyReplace        = 4
Const msiViewModifyDelete         = 6

Const msiUILevelNone = 2

Const msiRunModeSourceShortNames = 9

Const msidbFileAttributesNoncompressed = &h00002000

Dim argCount:argCount = Wscript.Arguments.Count
Dim iArg:iArg = 0
If argCount > 0 Then If InStr(1, Wscript.Arguments(0), "?", vbTextCompare) > 0 Then argCount = 0
If (argCount < 1) Then
	Wscript.Echo "Windows Installer utility to updata File table sizes and versions" &_
		vbNewLine & " The 1st argument is the path to MSI database, at the source file root" &_
		vbNewLine & " The 2nd argument can optionally specify separate source location from the MSI" &_
		vbNewLine & " The following options may be specified at any point on the command line" &_
		vbNewLine & "  /U to update the MSI database with the file sizes, versions, and languages" &_
		vbNewLine & "  /H to populate the MsiFileHash table (and create if it doesn't exist)" &_
		vbNewLine & " Notes:" &_
		vbNewLine & "  If source type set to compressed, all files will be opened at the root" &_
		vbNewLine & "  Using CSCRIPT.EXE without the /U option, the file info will be displayed" &_
		vbNewLine & "  Using the /H option requires Windows Installer version 2.0 or greater" &_
		vbNewLine & "  Using the /H option also requires the /U option" &_
		vbNewLine &_
		vbNewLine & "Copyright (C) Microsoft Corporation.  All rights reserved."
	Wscript.Quit 1
End If

' Get argument values, processing any option flags
Dim updateMsi    : updateMsi    = False
Dim populateHash : populateHash = False
Dim sequenceFile : sequenceFile = False
Dim databasePath : databasePath = NextArgument
Dim sourceFolder : sourceFolder = NextArgument
If Not IsEmpty(NextArgument) Then Fail "More than 2 arguments supplied" ' process any trailing options
If Not IsEmpty(sourceFolder) And Right(sourceFolder, 1) <> "\" Then sourceFolder = sourceFolder & "\"
Dim console : If UCase(Mid(Wscript.FullName, Len(Wscript.Path) + 2, 1)) = "C" Then console = True

' Connect to Windows Installer object
On Error Resume Next
Dim installer : Set installer = Nothing
Set installer = Wscript.CreateObject("WindowsInstaller.Installer") : CheckError

Dim errMsg

' Check Installer version to see if MsiFileHash table population is supported
Dim supportHash : supportHash = False
Dim verInstaller : verInstaller = installer.Version
If CInt(Left(verInstaller, 1)) >= 2 Then supportHash = True
If populateHash And NOT supportHash Then
	errMsg = "The version of Windows Installer on the machine does not support populating the MsiFileHash table."
	errMsg = errMsg & " Windows Installer version 2.0 is the mininum required version. The version on the machine is " & verInstaller & vbNewLine
	Fail errMsg
End If

' Check if multiple language package, and force use of primary language
REM	Set sumInfo = database.SummaryInformation(3) : CheckError

' Open database
Dim database, openMode, view, record, updateMode, sumInfo
If updateMsi Then openMode = msiOpenDatabaseModeTransact Else openMode = msiOpenDatabaseModeReadOnly
Set database = installer.OpenDatabase(databasePath, openMode) : CheckError

' Create MsiFileHash table if we will be populating it and it is not already present
Dim hashView, iTableStat, fileHash, hashUpdateRec
iTableStat = Database.TablePersistent("MsiFileHash")
If populateHash Then
	If NOT updateMsi Then
		errMsg = "Populating the MsiFileHash table requires that the database be open for writing. Please include the /U option"
		Fail errMsg		
	End If

	If iTableStat <> 1 Then
		Set hashView = database.OpenView("CREATE TABLE `MsiFileHash` ( `File_` CHAR(72) NOT NULL, `Options` INTEGER NOT NULL, `HashPart1` LONG NOT NULL, `HashPart2` LONG NOT NULL, `HashPart3` LONG NOT NULL, `HashPart4` LONG NOT NULL PRIMARY KEY `File_` )") : CheckError
		hashView.Execute : CheckError
	End If

	Set hashView = database.OpenView("SELECT `File_`, `Options`, `HashPart1`, `HashPart2`, `HashPart3`, `HashPart4` FROM `MsiFileHash`") : CheckError
	hashView.Execute : CheckError

	Set hashUpdateRec = installer.CreateRecord(6)
End If

' Create an install session and execute actions in order to perform directory resolution
installer.UILevel = msiUILevelNone
Dim session : Set session = installer.OpenPackage(database,1) : If Err <> 0 Then Fail "Database: " & databasePath & ". Invalid installer package format"
Dim shortNames : shortNames = session.Mode(msiRunModeSourceShortNames) : CheckError
If Not IsEmpty(sourceFolder) Then session.Property("OriginalDatabase") = sourceFolder : CheckError
Dim stat : stat = session.DoAction("CostInitialize") : CheckError
If stat <> 1 Then Fail "CostInitialize failed, returned " & stat

' Join File table to Component table in order to find directories
Dim orderBy : If sequenceFile Then orderBy = "Directory_" Else orderBy = "Sequence"
Set view = database.OpenView("SELECT File,FileName,Directory_,FileSize,Version,Language FROM File,Component WHERE Component_=Component ORDER BY " & orderBy) : CheckError
view.Execute : CheckError

' Create view on File table to check for companion file version syntax so that we don't overwrite them
Dim companionView
set companionView = database.OpenView("SELECT File FROM File WHERE File=?") : CheckError

' Fetch each file and request the source path, then verify the source path, and get the file info if present
Dim fileKey, fileName, folder, sourcePath, fileSize, version, language, delim, message, info
Do
	Set record = view.Fetch : CheckError
	If record Is Nothing Then Exit Do
	fileKey    = record.StringData(1)
	fileName   = record.StringData(2)
	folder     = record.StringData(3)
REM	fileSize   = record.IntegerData(4)
REM	companion  = record.StringData(5)
	version    = record.StringData(5)
REM	language   = record.StringData(6)

	' Check to see if this is a companion file
	Dim companionRec
	Set companionRec = installer.CreateRecord(1) : CheckError
	companionRec.StringData(1) = version
	companionView.Close : CheckError
	companionView.Execute companionRec : CheckError
	Dim companionFetch
	Set companionFetch = companionView.Fetch : CheckError
	Dim companionFile : companionFile = True
	If companionFetch Is Nothing Then
		companionFile = False
	End If

	delim = InStr(1, fileName, "|", vbTextCompare)
	If delim <> 0 Then
		If shortNames Then fileName = Left(fileName, delim-1) Else fileName = Right(fileName, Len(fileName) - delim)
	End If
	sourcePath = session.SourcePath(folder) & fileName
	If installer.FileAttributes(sourcePath) = -1 Then
		message = message & vbNewLine & sourcePath
	Else
		fileSize = installer.FileSize(sourcePath) : CheckError
		version  = Empty : version  = installer.FileVersion(sourcePath, False) : Err.Clear ' early MSI implementation fails if no version
		language = Empty : language = installer.FileVersion(sourcePath, True)  : Err.Clear ' early MSI implementation doesn't support language
		If language = version Then language = Empty ' Temp check for MSI.DLL version without language support
		If Err <> 0 Then version = Empty : Err.Clear
		If updateMsi Then
			' update File table info
			record.IntegerData(4) = fileSize
			If Len(version)  > 0 Then record.StringData(5) = version
			If Len(language) > 0 Then record.StringData(6) = language
			view.Modify msiViewModifyUpdate, record : CheckError

			' update MsiFileHash table info if this is an unversioned file
			If populateHash And Len(version) = 0 Then
				Set fileHash = installer.FileHash(sourcePath, 0) : CheckError
				hashUpdateRec.StringData(1) = fileKey
				hashUpdateRec.IntegerData(2) = 0
				hashUpdateRec.IntegerData(3) = fileHash.IntegerData(1)
				hashUpdateRec.IntegerData(4) = fileHash.IntegerData(2)
				hashUpdateRec.IntegerData(5) = fileHash.IntegerData(3)
				hashUpdateRec.IntegerData(6) = fileHash.IntegerData(4)
				hashView.Modify msiViewModifyAssign, hashUpdateRec : CheckError
			End If
		ElseIf console Then
			If companionFile Then
				info = "* "
				info = info & fileName : If Len(info) < 12 Then info = info & Space(12 - Len(info))
				info = info & "  skipped (version is a reference to a companion file)"
			Else
				info = fileName : If Len(info) < 12 Then info = info & Space(12 - Len(info))
				info = info & "  size=" & fileSize : If Len(info) < 26 Then info = info & Space(26 - Len(info))
				If Len(version)  > 0 Then info = info & "  vers=" & version : If Len(info) < 45 Then info = info & Space(45 - Len(info))
				If Len(language) > 0 Then info = info & "  lang=" & language
			End If
			Wscript.Echo info
		End If
	End If
Loop
REM Wscript.Echo "SourceDir = " & session.Property("SourceDir")
If Not IsEmpty(message) Then Fail "Error, the following files were not available:" & message

' Update SummaryInformation
If updateMsi Then
	Set sumInfo = database.SummaryInformation(3) : CheckError
	sumInfo.Property(11) = Now
	sumInfo.Property(13) = Now
	sumInfo.Persist
End If

' Commit database in case updates performed
database.Commit : CheckError
Wscript.Quit 0

' Extract argument value from command line, processing any option flags
Function NextArgument
	Dim arg
	Do  ' loop to pull in option flags until an argument value is found
		If iArg >= argCount Then Exit Function
		arg = Wscript.Arguments(iArg)
		iArg = iArg + 1
		If (AscW(arg) <> AscW("/")) And (AscW(arg) <> AscW("-")) Then Exit Do
		Select Case UCase(Right(arg, Len(arg)-1))
			Case "U" : updateMsi    = True
			Case "H" : populateHash = True
			Case Else: Wscript.Echo "Invalid option flag:", arg : Wscript.Quit 1
		End Select
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
'' SIG '' 90R1z4uuv6FSmeekmrnJ1Xqp08A0D4fjgi9+4dO31L2g
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
'' SIG '' MC8GCSqGSIb3DQEJBDEiBCBpnzVfoFOx9eNloN4oinKL
'' SIG '' hS15cYZW3l15EhEuDCDtaTA8BgorBgEEAYI3CgMcMS4M
'' SIG '' LG5lT0MrN2hvbnJVNnY2Zk1oTGJDb1R2STB4bmUrSlpX
'' SIG '' VnVCOUo0U1BsMUk9MFoGCisGAQQBgjcCAQwxTDBKoCSA
'' SIG '' IgBNAGkAYwByAG8AcwBvAGYAdAAgAFcAaQBuAGQAbwB3
'' SIG '' AHOhIoAgaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3dp
'' SIG '' bmRvd3MwDQYJKoZIhvcNAQEBBQAEggEASWm70iCkTb9g
'' SIG '' HGk8A43wXn+nT1lCqoBNwFqLCLaALnarKNZaStjoR6Ic
'' SIG '' CMHOy0QVXVCjXbl/wgZcDHSvbeFBphb714eLPWyP0icO
'' SIG '' lkDXlWy3WoXghFZF0WblT9maHpug7K7zq6pVsbRpR71d
'' SIG '' Nq4OcCx2oz5ju0sYmXJ+Wvqj406/m7rj40y3p250spE9
'' SIG '' mVCT1Sc7hHTWXZDvoj512tM6KQEqyjXQdKcIlK9c8CNo
'' SIG '' ELxwd6/rA2f9/zXuAz3UYo/RAlKAIenXfBXpcsGOYB48
'' SIG '' 7axddrP9mucKyVGRvB2GSD3BX0xZwvWXQRPnJbLARuEl
'' SIG '' uvaR6HzaRjj8PsPNLHoOw6GCE0owghNGBgorBgEEAYI3
'' SIG '' AwMBMYITNjCCEzIGCSqGSIb3DQEHAqCCEyMwghMfAgED
'' SIG '' MQ8wDQYJYIZIAWUDBAIBBQAwggE9BgsqhkiG9w0BCRAB
'' SIG '' BKCCASwEggEoMIIBJAIBAQYKKwYBBAGEWQoDATAxMA0G
'' SIG '' CWCGSAFlAwQCAQUABCBHk9W/nMpvyHn2UTPXKyCVl/WG
'' SIG '' PpNLQnPmRjaVcfSQxgIGWK+kc8ZjGBMyMDE3MDMxOTEy
'' SIG '' NTAxOC44NjFaMAcCAQGAAgH0oIG5pIG2MIGzMQswCQYD
'' SIG '' VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
'' SIG '' A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
'' SIG '' IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScwJQYD
'' SIG '' VQQLEx5uQ2lwaGVyIERTRSBFU046MzFDNS0zMEJBLTdD
'' SIG '' OTExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
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
'' SIG '' AKAamHg+Ztiq1wAAAAAAoDANBgkqhkiG9w0BAQsFADB8
'' SIG '' MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
'' SIG '' bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWlj
'' SIG '' cm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNy
'' SIG '' b3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDAeFw0xNjA5
'' SIG '' MDcxNzU2NDhaFw0xODA5MDcxNzU2NDhaMIGzMQswCQYD
'' SIG '' VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
'' SIG '' A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
'' SIG '' IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScwJQYD
'' SIG '' VQQLEx5uQ2lwaGVyIERTRSBFU046MzFDNS0zMEJBLTdD
'' SIG '' OTExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1w
'' SIG '' IFNlcnZpY2UwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
'' SIG '' ggEKAoIBAQDnbBTiMNFn0q0ErrbbIj3oKik17qFBqRtT
'' SIG '' zDw9+C29EQ14xQQRBWtYQ5TkYyQdZSPpxTPTkGsVDtFw
'' SIG '' Seqz5CJqlOVtYxLmz2jUfWg2d4h4zVm2Rsa8yEo5f/Rr
'' SIG '' hDE6cav0CN5rHLck7h+LX4foemFMOWavTqNyjUMNdZy7
'' SIG '' DkCqCxPlLNB1pcgKdofx3RXpPui/Js3halIYApN3/Q8R
'' SIG '' Xonxtgheo1MlUr6VZUMA9L07qjq0S2wEUmkqLZ/OOH8e
'' SIG '' Nz86h5CxHmMeVqHYYMu/2NFaRHxwih5T+ieprDGmawqd
'' SIG '' fKwwl6MmtoSlxKXxvHXIyYzwGBFB5c/P2Bg/TTMEI5wb
'' SIG '' AgMBAAGjggEbMIIBFzAdBgNVHQ4EFgQUyLDE96EVAg5i
'' SIG '' F3A6flI2kVqUdgEwHwYDVR0jBBgwFoAU1WM6XIoxkPND
'' SIG '' e3xGG8UzaFqFbVUwVgYDVR0fBE8wTTBLoEmgR4ZFaHR0
'' SIG '' cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJv
'' SIG '' ZHVjdHMvTWljVGltU3RhUENBXzIwMTAtMDctMDEuY3Js
'' SIG '' MFoGCCsGAQUFBwEBBE4wTDBKBggrBgEFBQcwAoY+aHR0
'' SIG '' cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9N
'' SIG '' aWNUaW1TdGFQQ0FfMjAxMC0wNy0wMS5jcnQwDAYDVR0T
'' SIG '' AQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkq
'' SIG '' hkiG9w0BAQsFAAOCAQEAEAl5B5cPky5wvUnWNvBUOfJA
'' SIG '' 9o8/0gl1HPNa52huXTrVOCoTayKvMK0VH0HUzFNFufi/
'' SIG '' 5yjPUF8rNebqHvvzXxD2J6+9IHnSWmy+QwhOKN76ZN6Y
'' SIG '' pd5bJk3DaUknO0o8sKDATJN9Rp0mgjy8LoF9xrWCMgsl
'' SIG '' qV3gauDb4uF7qiJiywW3Bj1uRb7ywZl+sAvQLK6CABG3
'' SIG '' qyerriIMhAkz0HUBOwqwy6oiL+QETaeukPVkdPjMVmxh
'' SIG '' Lr4hV5+EF1y7cpGteeCkIOsuAfQf0v8pDJva+Cbiy2uJ
'' SIG '' UFWiabXkwFhppCgufQBl8r1Jw/q/M8aZRz4bZonNVmqr
'' SIG '' O+tntX1SUqGCA3YwggJeAgEBMIHjoYG5pIG2MIGzMQsw
'' SIG '' CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
'' SIG '' MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9z
'' SIG '' b2Z0IENvcnBvcmF0aW9uMQ0wCwYDVQQLEwRNT1BSMScw
'' SIG '' JQYDVQQLEx5uQ2lwaGVyIERTRSBFU046MzFDNS0zMEJB
'' SIG '' LTdDOTExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0
'' SIG '' YW1wIFNlcnZpY2WiJQoBATAJBgUrDgMCGgUAAxUAhBVR
'' SIG '' ZSKLhet7VUDRWAMcDcVyb8CggcIwgb+kgbwwgbkxCzAJ
'' SIG '' BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
'' SIG '' DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
'' SIG '' ZnQgQ29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAl
'' SIG '' BgNVBAsTHm5DaXBoZXIgTlRTIEVTTjo1N0Y2LUMxRTAt
'' SIG '' NTU0QzErMCkGA1UEAxMiTWljcm9zb2Z0IFRpbWUgU291
'' SIG '' cmNlIE1hc3RlciBDbG9jazANBgkqhkiG9w0BAQUFAAIF
'' SIG '' ANx4Tl0wIhgPMjAxNzAzMTkwMDI1MDFaGA8yMDE3MDMy
'' SIG '' MDAwMjUwMVowdDA6BgorBgEEAYRZCgQBMSwwKjAKAgUA
'' SIG '' 3HhOXQIBADAHAgEAAgICtTAHAgEAAgIajTAKAgUA3Hmf
'' SIG '' 3QIBADA2BgorBgEEAYRZCgQCMSgwJjAMBgorBgEEAYRZ
'' SIG '' CgMBoAowCAIBAAIDFuNgoQowCAIBAAIDB6EgMA0GCSqG
'' SIG '' SIb3DQEBBQUAA4IBAQBtRlocmnKAPaKKu92WJTODBmoa
'' SIG '' zrp6g57UCo1cV4ExETWrKvOpbg7+R9p6aMti16KFKJGC
'' SIG '' 2IrYcQSgAjjHqsj7tMorv1i4o2V7dmkjr1eoJTDFyXfe
'' SIG '' jeDA3dNfqLTLqOxe18J9vTOdI5ESoL4qcZhi/Ktn2L3l
'' SIG '' jk9bDgmalmtWcni6RxpfbwUdH0KWSb70yCWBB1wcVaN2
'' SIG '' i13R0oKdBoe2Uq209wGjYP3VKyHFQjWBiqy0k9DZRvTM
'' SIG '' kgtIxrQhfBz/YonYVU+GRxClH2mEl6jm4308y5gP3lPg
'' SIG '' Q2Pm6kbfjG3QQjA7dboyCYpW1bkVNKZIiOscBEcRv1Vi
'' SIG '' 4rsGQAjOMYIC9TCCAvECAQEwgZMwfDELMAkGA1UEBhMC
'' SIG '' VVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcT
'' SIG '' B1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
'' SIG '' b3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUt
'' SIG '' U3RhbXAgUENBIDIwMTACEzMAAACgGph4PmbYqtcAAAAA
'' SIG '' AKAwDQYJYIZIAWUDBAIBBQCgggEyMBoGCSqGSIb3DQEJ
'' SIG '' AzENBgsqhkiG9w0BCRABBDAvBgkqhkiG9w0BCQQxIgQg
'' SIG '' mhoop+O4x234EPu3t/2O7aB2QYRwjt3y2gEIt7u/kEQw
'' SIG '' geIGCyqGSIb3DQEJEAIMMYHSMIHPMIHMMIGxBBSEFVFl
'' SIG '' IouF63tVQNFYAxwNxXJvwDCBmDCBgKR+MHwxCzAJBgNV
'' SIG '' BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
'' SIG '' VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
'' SIG '' Q29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBU
'' SIG '' aW1lLVN0YW1wIFBDQSAyMDEwAhMzAAAAoBqYeD5m2KrX
'' SIG '' AAAAAACgMBYEFA205Z4XZFJk7tqu2nYXGLVOSxgvMA0G
'' SIG '' CSqGSIb3DQEBCwUABIIBAFtQCcanoyZV6gUsmLn2kQxw
'' SIG '' bcNRDPDKmehkMVksx7hBj95RLPKXc1LN7xvGY9yyIPCy
'' SIG '' +3IQpHZaiQoz5j/VQN93FB8tdlXnUe8Gcxq/IxjYKsgY
'' SIG '' FgulSY8ViuDhNZ/nbRfKKhk4WaIREiqyis5xekPz9NaH
'' SIG '' oKaBWejcWvO3lZO88xqDQYMOu2BW0DMmCDQLLvUkdXc2
'' SIG '' AJljdkf+Kv+hxOu1nGMnx2pFBrp8DruETwGXsf+Xz+2g
'' SIG '' lTvuIbI+gWnxhV2JVeWpdL5yJTjRkPjyKC4xBPHRtJD5
'' SIG '' AiUT5Aj+g8DPCS05OYd2k3I+T/tr0UW+3opFVNgNxSMZ
'' SIG '' gYq9JzCeUtY=
'' SIG '' End signature block
