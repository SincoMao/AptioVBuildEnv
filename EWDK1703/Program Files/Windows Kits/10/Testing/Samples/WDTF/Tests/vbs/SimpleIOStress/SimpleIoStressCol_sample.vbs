
'
' Variable defenition 
'

Dim WDTF
Dim Devices
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
' Query for device 
'

set Devices = WDTF.DeviceDepot.Query(DeviceQuery)


'
'  Get Simple I/O Stress test for device 
'

set Actions = Devices.GetInterfacesIfExist("SimpleIOStressEx")


'
'  Start test case 
'

WDTF.Log.StartTestCase "Start Device I/O"


'
' Start all I/O tests
'

if Actions.Count then

   Actions.StartAsync()
   WScript.Sleep(10000)
   Actions.Stop()

End if


WDTF.Log.EndTestCase

