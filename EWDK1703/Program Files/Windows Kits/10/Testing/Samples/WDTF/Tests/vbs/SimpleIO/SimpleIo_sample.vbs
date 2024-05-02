
'
' Variable defenition 
'

Dim WDTF
Dim Devices
Dim Action
Dim Actions 
Dim DeviceQuery



'
'  Use default query or one from the command line.
'

DeviceQuery = "IsDevice"


if WScript.Arguments.Named.Exists("DQ") then 

    DeviceQuery = DeviceQuery & " AND " & WScript.Arguments.Named("DQ")

End if


'
' Create WDTF object
'

Set WDTF = CreateObject("WDTF2.WDTF")


'
' Query for devices 
'

set Devices = WDTF.DeviceDepot.Query(DeviceQuery)


'
'  Get Simple I/O tests for all devices that have them. 
'


set Actions = Devices.GetInterfacesIfExist("SimpleIOEx")

'
'  Start test case 
'

WDTF.Log.StartTestCase "Start Simple I/O"



'
'  Do a litle bit of device testing. 
'

For Each Action In Actions

      Action.Open()
      Action.PerformIO()
      Action.Close()
   
Next

'
'  End test case.
'   

WDTF.Log.EndTestCase
