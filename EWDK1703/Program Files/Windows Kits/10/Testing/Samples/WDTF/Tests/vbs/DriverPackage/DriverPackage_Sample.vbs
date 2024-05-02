'
' Variable definition 
'

Dim WDTF
Dim Devices
Dim DeviceQuery

'
'  Use default query or one from the command line.
'

DeviceQuery = "IsDevice"

if WScript.Arguments.Named.Exists("DQ") then 

    DeviceQuery = DeviceQuery & " AND " & WScript.Arguments.Named("DQ")

End if

'
' Create WDTF and friend object
'

Set WDTF = CreateObject("WDTF2.WDTF")


WDTF.Log.OutputInfo "Driver Package Sample"