' Windows Installer utility to generate file cabinets from MSI database
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
If (argCount < 2) Then
	Wscript.Echo "Windows Installer utility to generate compressed file cabinets from MSI database" &_
		vbNewLine & " The 1st argument is the path to MSI database, at the source file root" &_
		vbNewLine & " The 2nd argument is the base name used for the generated files (DDF, INF, RPT)" &_
		vbNewLine & " The 3rd argument can optionally specify separate source location from the MSI" &_
		vbNewLine & " The following options may be specified at any point on the command line" &_
		vbNewLine & "  /L to use LZX compression instead of MSZIP" &_
		vbNewLine & "  /F to limit cabinet size to 1.44 MB floppy size rather than CD" &_
		vbNewLine & "  /C to run compression, else only generates the .DDF file" &_
		vbNewLine & "  /U to update the MSI database to reference the generated cabinet" &_
		vbNewLine & "  /E to embed the cabinet file in the installer package as a stream" &_
		vbNewLine & "  /S to sequence number file table, ordered by directories" &_
		vbNewLine & "  /R to revert to non-cabinet install, removes cabinet if /E specified" &_
		vbNewLine & " Notes:" &_
		vbNewLine & "  In order to generate a cabinet, MAKECAB.EXE must be on the PATH" &_
		vbNewLine & "  base name used for files and cabinet stream is case-sensitive" &_
		vbNewLine & "  If source type set to compressed, all files will be opened at the root" &_
		vbNewLine & "  (The /R option removes the compressed bit - SummaryInfo property 15 & 2)" &_
		vbNewLine & "  To replace an embedded cabinet, include the options: /R /C /U /E" &_
		vbNewLine & "  Does not handle updating of Media table to handle multiple cabinets" &_
		vbNewLine &_
		vbNewLine & "Copyright (C) Microsoft Corporation.  All rights reserved."
	Wscript.Quit 1
End If

' Get argument values, processing any option flags
Dim compressType : compressType = "MSZIP"
Dim cabSize      : cabSize      = "CDROM"
Dim makeCab      : makeCab      = False
Dim embedCab     : embedCab     = False
Dim updateMsi    : updateMsi    = False
Dim sequenceFile : sequenceFile = False
Dim removeCab    : removeCab    = False
Dim databasePath : databasePath = NextArgument
Dim baseName     : baseName     = NextArgument
Dim sourceFolder : sourceFolder = NextArgument
If Not IsEmpty(NextArgument) Then Fail "More than 3 arguments supplied" ' process any trailing options
If Len(baseName) < 1 Or Len(baseName) > 8 Then Fail "Base file name must be from 1 to 8 characters"
If Not IsEmpty(sourceFolder) And Right(sourceFolder, 1) <> "\" Then sourceFolder = sourceFolder & "\"
Dim cabFile : cabFile = baseName & ".CAB"
Dim cabName : cabName = cabFile : If embedCab Then cabName = "#" & cabName

' Connect to Windows Installer object
On Error Resume Next
Dim installer : Set installer = Nothing
Set installer = Wscript.CreateObject("WindowsInstaller.Installer") : CheckError

' Open database
Dim database, openMode, view, record, updateMode, sumInfo, sequence, lastSequence
If updateMsi Or sequenceFile Or removeCab Then openMode = msiOpenDatabaseModeTransact Else openMode = msiOpenDatabaseModeReadOnly
Set database = installer.OpenDatabase(databasePath, openMode) : CheckError

' Remove existing cabinet(s) and revert to source tree install if options specified
If removeCab Then
	Set view = database.OpenView("SELECT DiskId, LastSequence, Cabinet FROM Media ORDER BY DiskId") : CheckError
	view.Execute : CheckError
	updateMode = msiViewModifyUpdate
	Set record = view.Fetch : CheckError
	If Not record Is Nothing Then ' Media table not empty
		If Not record.IsNull(3) Then
			If record.StringData(3) <> cabName Then Wscript.Echo "Warning, cabinet name in media table, " & record.StringData(3) & " does not match " & cabName
			record.StringData(3) = Empty
		End If
		record.IntegerData(2) = 9999 ' in case of multiple cabinets, force all files from 1st media
		view.Modify msiViewModifyUpdate, record : CheckError
		Do
			Set record = view.Fetch : CheckError
			If record Is Nothing Then Exit Do
			view.Modify msiViewModifyDelete, record : CheckError 'remove other cabinet records
		Loop
	End If
	Set sumInfo = database.SummaryInformation(3) : CheckError
	sumInfo.Property(11) = Now
	sumInfo.Property(13) = Now
	sumInfo.Property(15) = sumInfo.Property(15) And Not 2
	sumInfo.Persist
	Set view = database.OpenView("SELECT `Name`,`Data` FROM _Streams WHERE `Name`= '" & cabFile & "'") : CheckError
	view.Execute : CheckError
	Set record = view.Fetch
	If record Is Nothing Then
		Wscript.Echo "Warning, cabinet stream not found in package: " & cabFile
	Else
		view.Modify msiViewModifyDelete, record : CheckError
	End If
	Set sumInfo = Nothing ' must release stream
	database.Commit : CheckError
	If Not updateMsi Then Wscript.Quit 0
End If

' Create an install session and execute actions in order to perform directory resolution
installer.UILevel = msiUILevelNone
Dim session : Set session = installer.OpenPackage(database,1) : If Err <> 0 Then Fail "Database: " & databasePath & ". Invalid installer package format"
Dim shortNames : shortNames = session.Mode(msiRunModeSourceShortNames) : CheckError
If Not IsEmpty(sourceFolder) Then session.Property("OriginalDatabase") = sourceFolder : CheckError
Dim stat : stat = session.DoAction("CostInitialize") : CheckError
If stat <> 1 Then Fail "CostInitialize failed, returned " & stat

' Check for non-cabinet files to avoid sequence number collisions
lastSequence = 0
If sequenceFile Then
	Set view = database.OpenView("SELECT Sequence,Attributes FROM File") : CheckError
	view.Execute : CheckError
	Do
		Set record = view.Fetch : CheckError
		If record Is Nothing Then Exit Do
		sequence = record.IntegerData(1)
		If (record.IntegerData(2) And msidbFileAttributesNoncompressed) <> 0 And sequence > lastSequence Then lastSequence = sequence
	Loop	
End If

' Join File table to Component table in order to find directories
Dim orderBy : If sequenceFile Then orderBy = "Directory_" Else orderBy = "Sequence"
Set view = database.OpenView("SELECT File,FileName,Directory_,Sequence,File.Attributes FROM File,Component WHERE Component_=Component ORDER BY " & orderBy) : CheckError
view.Execute : CheckError

' Create DDF file and write header properties
Dim FileSys : Set FileSys = CreateObject("Scripting.FileSystemObject") : CheckError
Dim outStream : Set outStream = FileSys.CreateTextFile(baseName & ".DDF", OverwriteIfExist, OpenAsASCII) : CheckError
outStream.WriteLine "; Generated from " & databasePath & " on " & Now
outStream.WriteLine ".Set CabinetNameTemplate=" & baseName & "*.CAB"
outStream.WriteLine ".Set CabinetName1=" & cabFile
outStream.WriteLine ".Set ReservePerCabinetSize=8"
outStream.WriteLine ".Set MaxDiskSize=" & cabSize
outStream.WriteLine ".Set CompressionType=" & compressType
outStream.WriteLine ".Set InfFileLineFormat=(*disk#*) *file#*: *file* = *Size*"
outStream.WriteLine ".Set InfFileName=" & baseName & ".INF"
outStream.WriteLine ".Set RptFileName=" & baseName & ".RPT"
outStream.WriteLine ".Set InfHeader="
outStream.WriteLine ".Set InfFooter="
outStream.WriteLine ".Set DiskDirectoryTemplate=."
outStream.WriteLine ".Set Compress=ON"
outStream.WriteLine ".Set Cabinet=ON"

' Fetch each file and request the source path, then verify the source path
Dim fileKey, fileName, folder, sourcePath, delim, message, attributes
Do
	Set record = view.Fetch : CheckError
	If record Is Nothing Then Exit Do
	fileKey    = record.StringData(1)
	fileName   = record.StringData(2)
	folder     = record.StringData(3)
	sequence   = record.IntegerData(4)
	attributes = record.IntegerData(5)
	If (attributes And msidbFileAttributesNoncompressed) = 0 Then
		If sequence <= lastSequence Then
			If Not sequenceFile Then Fail "Duplicate sequence numbers in File table, use /S option"
			sequence = lastSequence + 1
			record.IntegerData(4) = sequence
			view.Modify msiViewModifyUpdate, record
		End If
		lastSequence = sequence
		delim = InStr(1, fileName, "|", vbTextCompare)
		If delim <> 0 Then
			If shortNames Then fileName = Left(fileName, delim-1) Else fileName = Right(fileName, Len(fileName) - delim)
		End If
		sourcePath = session.SourcePath(folder) & fileName
		outStream.WriteLine """" & sourcePath & """" & " " & fileKey
		If installer.FileAttributes(sourcePath) = -1 Then message = message & vbNewLine & sourcePath
	End If
Loop
outStream.Close
REM Wscript.Echo "SourceDir = " & session.Property("SourceDir")
If Not IsEmpty(message) Then Fail "The following files were not available:" & message

' Generate compressed file cabinet
If makeCab Then
	Dim WshShell : Set WshShell = Wscript.CreateObject("Wscript.Shell") : CheckError
	Dim cabStat : cabStat = WshShell.Run("MakeCab.exe /f " & baseName & ".DDF", 7, True) : CheckError
	If cabStat <> 0 Then Fail "MAKECAB.EXE failed, possibly could not find source files, or invalid DDF format"
End If

' Update Media table and SummaryInformation if requested
If updateMsi Then
	Set view = database.OpenView("SELECT DiskId, LastSequence, Cabinet FROM Media ORDER BY DiskId") : CheckError
	view.Execute : CheckError
	updateMode = msiViewModifyUpdate
	Set record = view.Fetch : CheckError
	If record Is Nothing Then ' Media table empty
		Set record = Installer.CreateRecord(3)
		record.IntegerData(1) = 1
		updateMode = msiViewModifyInsert
	End If
	record.IntegerData(2) = lastSequence
	record.StringData(3) = cabName
	view.Modify updateMode, record
	Set sumInfo = database.SummaryInformation(3) : CheckError
	sumInfo.Property(11) = Now
	sumInfo.Property(13) = Now
	sumInfo.Property(15) = (shortNames And 1) + 2
	sumInfo.Persist
End If

' Embed cabinet if requested
If embedCab Then
	Set view = database.OpenView("SELECT `Name`,`Data` FROM _Streams") : CheckError
	view.Execute : CheckError
	Set record = Installer.CreateRecord(2)
	record.StringData(1) = cabFile
	record.SetStream 2, cabFile : CheckError
	view.Modify msiViewModifyAssign, record : CheckError 'replace any existing stream of that name
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
			Case "C" : makeCab      = True
			Case "E" : embedCab     = True
			Case "F" : cabSize      = "1.44M"
			Case "L" : compressType = "LZX"
			Case "R" : removeCab    = True
			Case "S" : sequenceFile = True
			Case "U" : updateMsi    = True
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
'' SIG '' MIIiTwYJKoZIhvcNAQcCoIIiQDCCIjwCAQExDzANBglg
'' SIG '' hkgBZQMEAgEFADB3BgorBgEEAYI3AgEEoGkwZzAyBgor
'' SIG '' BgEEAYI3AgEeMCQCAQEEEE7wKRaZJ7VNj+Ws4Q8X66sC
'' SIG '' AQACAQACAQACAQACAQAwMTANBglghkgBZQMEAgEFAAQg
'' SIG '' +3czCZ7bOIQLc7kJN8m8lyJpE9uBKr7KXjIe8c3/+0yg
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
'' SIG '' edIX09rBlI4HeyVxRKsGaubUxt8jmpZ1xTGCFhgwghYU
'' SIG '' AgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpX
'' SIG '' YXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYD
'' SIG '' VQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNV
'' SIG '' BAMTH01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIw
'' SIG '' MTACEzMAAAFVaf+2twPOkq4AAAAAAVUwDQYJYIZIAWUD
'' SIG '' BAIBBQCgggEEMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3
'' SIG '' AgEEMBwGCisGAQQBgjcCAQsxDjAMBgorBgEEAYI3AgEV
'' SIG '' MC8GCSqGSIb3DQEJBDEiBCDEMVlh939EqMc4TkKC/+Vg
'' SIG '' aSy/jIffuWAuDbIsr872HzA8BgorBgEEAYI3CgMcMS4M
'' SIG '' LGZWcDhqRVpLdWx0UjAxUExrWkNaeU1oRUliNFdESzFF
'' SIG '' WHEyVXJzVk9aUmc9MFoGCisGAQQBgjcCAQwxTDBKoCSA
'' SIG '' IgBNAGkAYwByAG8AcwBvAGYAdAAgAFcAaQBuAGQAbwB3
'' SIG '' AHOhIoAgaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3dp
'' SIG '' bmRvd3MwDQYJKoZIhvcNAQEBBQAEggEARhZ/osnvwQVG
'' SIG '' 7Y+9bHxCZ0L50pvtdKP4f79BqAK4oyLWxaoZg//MDr8w
'' SIG '' CUtclxBNFYiTknZ74o/7WxJsmd+Z0GUyWBgI6aexTVr6
'' SIG '' d8eMhfmq6P1l6C5AD37Cwwq3jqMiO0HByhIEyxaNywAN
'' SIG '' 1924pCpeqEwPR0HdIMzlKs7VGGqlVKM+x5jVTV+iaZmA
'' SIG '' T6TBAPc3CKNdpi033fUB0bfFHLSvq5dHDht+NvP+VCgq
'' SIG '' 4K/cDaSKuBgsxBcZn0Lu7UUl91vUQpflyBYbbrKPezef
'' SIG '' GgudIQ22X0sKfghIcHcG6RFNnIsdE/GS10zI7BZBJNZb
'' SIG '' VChejlYoFXPM6G/hskRKkqGCE0swghNHBgorBgEEAYI3
'' SIG '' AwMBMYITNzCCEzMGCSqGSIb3DQEHAqCCEyQwghMgAgED
'' SIG '' MQ8wDQYJYIZIAWUDBAIBBQAwggE8BgsqhkiG9w0BCRAB
'' SIG '' BKCCASsEggEnMIIBIwIBAQYKKwYBBAGEWQoDATAxMA0G
'' SIG '' CWCGSAFlAwQCAQUABCAHxu3Y2TZZ0hzWOxraW4Luoacv
'' SIG '' n/iyWXvv0PVAo3VxDAIGWK+MLcWEGBIyMDE3MDMxOTEy
'' SIG '' NTIzMi43OVowBwIBAYACAfSggbmkgbYwgbMxCzAJBgNV
'' SIG '' BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
'' SIG '' VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
'' SIG '' Q29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAlBgNV
'' SIG '' BAsTHm5DaXBoZXIgRFNFIEVTTjo3MjhELUM0NUYtRjlF
'' SIG '' QjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
'' SIG '' U2VydmljZaCCDs8wggZxMIIEWaADAgECAgphCYEqAAAA
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
'' SIG '' sjUFaDciHA2nAAAAAACyMA0GCSqGSIb3DQEBCwUAMHwx
'' SIG '' CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9u
'' SIG '' MRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
'' SIG '' b3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jv
'' SIG '' c29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTE2MDkw
'' SIG '' NzE3NTY1N1oXDTE4MDkwNzE3NTY1N1owgbMxCzAJBgNV
'' SIG '' BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
'' SIG '' VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQg
'' SIG '' Q29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAlBgNV
'' SIG '' BAsTHm5DaXBoZXIgRFNFIEVTTjo3MjhELUM0NUYtRjlF
'' SIG '' QjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAg
'' SIG '' U2VydmljZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
'' SIG '' AQoCggEBAJhKAbvRWPV/dJFC6aEuU13yLCBvEi6b09eV
'' SIG '' ldydb4l8DmtwKU2wLg81VvaPAkv4fFVtUM0/x6p48hAH
'' SIG '' qAdrA7v8K/CqJZ3d/PFjcCRlb4T6S0ReznIofcKzH8Vv
'' SIG '' hmqZh666/swFmL5vvhWCR2W3L3XKvNoQeps7Mk/aHUiS
'' SIG '' DiLnsbFCbVnCYp4sKgrwNTcgAgns4RTjtRfjgH5U7l1R
'' SIG '' DpPZmkozya8mDev2ayOVLz9dEiE3SiTPjr0Pm1M/7unu
'' SIG '' jHB72jv1armZPLfbAXwSyz9VzvSv1ga5OjzffCfUcpTN
'' SIG '' r0oJNsYi7F1zvTrigBod9b13cI1jcHvAwPbunjRph7cC
'' SIG '' AwEAAaOCARswggEXMB0GA1UdDgQWBBQzZL5naxzc+WNE
'' SIG '' BkjkxUPJkPaClTAfBgNVHSMEGDAWgBTVYzpcijGQ80N7
'' SIG '' fEYbxTNoWoVtVTBWBgNVHR8ETzBNMEugSaBHhkVodHRw
'' SIG '' Oi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9k
'' SIG '' dWN0cy9NaWNUaW1TdGFQQ0FfMjAxMC0wNy0wMS5jcmww
'' SIG '' WgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRw
'' SIG '' Oi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01p
'' SIG '' Y1RpbVN0YVBDQV8yMDEwLTA3LTAxLmNydDAMBgNVHRMB
'' SIG '' Af8EAjAAMBMGA1UdJQQMMAoGCCsGAQUFBwMIMA0GCSqG
'' SIG '' SIb3DQEBCwUAA4IBAQBB4LKgoMr0KG/Mjd3+270gVYls
'' SIG '' ICl2dj/UJ8lee4P7wcJHNo32eiFMRBs6cWOrIya/RK6i
'' SIG '' Ge8n1liGunpw+i+0S+RxSDpX0rX/oxAbmgnDXx4J6DDN
'' SIG '' ketUXMELWf706lIvqHo1a2C2gzgJppp225az1zWHqGQ6
'' SIG '' XAbPTBMNxiIYtwBjjLh1sUXhqUda2//8uxodVDnbFV/m
'' SIG '' V+Q0nngv/bTcIN/SExCjzj1x2eGwXmVZe45s7pWzmd/w
'' SIG '' qBxhD0xPV6rWxDH2fA1i62xrAKEKhNJ8cSknIqTYEw/A
'' SIG '' esid3To56t4nBtwEYY48aoSa3062mu2wTOH6UY2AQgWm
'' SIG '' JvaDbwHmoYIDeDCCAmACAQEwgeOhgbmkgbYwgbMxCzAJ
'' SIG '' BgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAw
'' SIG '' DgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
'' SIG '' ZnQgQ29ycG9yYXRpb24xDTALBgNVBAsTBE1PUFIxJzAl
'' SIG '' BgNVBAsTHm5DaXBoZXIgRFNFIEVTTjo3MjhELUM0NUYt
'' SIG '' RjlFQjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3Rh
'' SIG '' bXAgU2VydmljZaIlCgEBMAkGBSsOAwIaBQADFQC9/8WV
'' SIG '' Y5DxE5xg1hnAr+m4nh4gHaCBwjCBv6SBvDCBuTELMAkG
'' SIG '' A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
'' SIG '' BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
'' SIG '' dCBDb3Jwb3JhdGlvbjENMAsGA1UECxMETU9QUjEnMCUG
'' SIG '' A1UECxMebkNpcGhlciBOVFMgRVNOOjRERTktMEM1RS0z
'' SIG '' RTA5MSswKQYDVQQDEyJNaWNyb3NvZnQgVGltZSBTb3Vy
'' SIG '' Y2UgTWFzdGVyIENsb2NrMA0GCSqGSIb3DQEBBQUAAgUA
'' SIG '' 3HiORzAiGA8yMDE3MDMxOTA0NTc0M1oYDzIwMTcwMzIw
'' SIG '' MDQ1NzQzWjB2MDwGCisGAQQBhFkKBAExLjAsMAoCBQDc
'' SIG '' eI5HAgEAMAkCAQACAWgCAf8wBwIBAAICKxswCgIFANx5
'' SIG '' 38cCAQAwNgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGE
'' SIG '' WQoDAaAKMAgCAQACAxbjYKEKMAgCAQACAwehIDANBgkq
'' SIG '' hkiG9w0BAQUFAAOCAQEAd2qs1XA/praf5h7b6Qaz47Mw
'' SIG '' HhhtVT5PignGZjXoCZF/FyfS6d9dE1ZH/rQpvE0zV8Il
'' SIG '' g3GwFoyqnOudFxiGKNzNssS+1m3TN+weRiXw7zAp3Rj4
'' SIG '' y9qTmHZVJN8dzA+iwyVAA1WWNnwsoUUSYUIGZ/KfIhGg
'' SIG '' OhRI+K/fAhKMT7n9uPuKiKVRujfbMg6ytLFFyF1g/vfn
'' SIG '' 4FkbFOZIBzdXIxCcx9k2jlTh2tF2FkucwC22bkK+KmEX
'' SIG '' fxUru2r7kh0R6kkIAVKkCnzgDNKS4pZg+q9NhvJL65Rz
'' SIG '' JdDoqxPUzH90BvnJJ1xQmM3k1miqs4PV+3JbajMNAb5b
'' SIG '' v29TrhJifDGCAvUwggLxAgEBMIGTMHwxCzAJBgNVBAYT
'' SIG '' AlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQH
'' SIG '' EwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
'' SIG '' cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1l
'' SIG '' LVN0YW1wIFBDQSAyMDEwAhMzAAAAsjUFaDciHA2nAAAA
'' SIG '' AACyMA0GCWCGSAFlAwQCAQUAoIIBMjAaBgkqhkiG9w0B
'' SIG '' CQMxDQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIE
'' SIG '' IDkAejhvzs+4tp+RXpXOZlEM4Yf2kYeIlOJ/U9MvT7yg
'' SIG '' MIHiBgsqhkiG9w0BCRACDDGB0jCBzzCBzDCBsQQUvf/F
'' SIG '' lWOQ8ROcYNYZwK/puJ4eIB0wgZgwgYCkfjB8MQswCQYD
'' SIG '' VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
'' SIG '' A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
'' SIG '' IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQg
'' SIG '' VGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAALI1BWg3IhwN
'' SIG '' pwAAAAAAsjAWBBQ9/R2sGVE6+7NiMy2DQDSZXlcOUDAN
'' SIG '' BgkqhkiG9w0BAQsFAASCAQBfZMth1boc2yQYzUpDRVdC
'' SIG '' F12xYXcvbdT3nI84OYulmVK0LZKG/MJb0pq2qmaw/LS8
'' SIG '' Yhaod7gl527o0q+dqvr+E2+HvtpYs1Esdzny+KinT+7p
'' SIG '' A9ROSM7amOXLquC7RZq5LNBx8fFh/ek7Z6wjqXRRBXwR
'' SIG '' emmTBO7CDC9HYNMW/7rEtmXhR7KyvMxZsCMfV06Ipo7m
'' SIG '' ZTS5x9L4j9QPWRFnVjWRV+5xMKR2+otGeAs/OLQEelaa
'' SIG '' W6JaBvPMu5lH3BXKsG2O4tMLsVGO+4d7n4ANkgZgPyYK
'' SIG '' T2SjHazC8UAr9oa857zr3DOUjN9VW+ieSNBJadqgDaMN
'' SIG '' 5iy0/3+yA0DR
'' SIG '' End signature block
