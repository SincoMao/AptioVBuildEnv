
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
'  Get Simple I/O Stress test for devices 
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

   For Each Action In Actions
     WDTF.Log.OutputInfo "DeviceID: " &  Action.Target.GetValue("DEVICEID")
     Action.Start()
   Next

   WScript.Sleep(10000)

   For Each Action In Actions
     Action.Stop()
   Next


End if


WDTF.Log.EndTestCase

