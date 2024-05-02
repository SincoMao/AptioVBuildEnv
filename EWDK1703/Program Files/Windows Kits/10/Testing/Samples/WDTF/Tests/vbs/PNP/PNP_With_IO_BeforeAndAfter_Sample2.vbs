
'
' Variable definition 
'

Dim WDTF
Dim DeviceCol
Dim Device
Dim IoDeviceCol
Dim IoDevice
Dim PNPAction
Dim IoStressCol
Dim IoStress

Dim DeviceQuery
Dim Cycles
Dim IOPeriod 

'
' Init Variable 
'

Cycles = 1
IOPeriod = 20000


'
'  Use default query or one from the command line.
'

DeviceQuery = "IsDevice"


if WScript.Arguments.Named.Exists("DQ") then 

    DeviceQuery = DeviceQuery & " AND " & WScript.Arguments.Named("DQ")

End if


'
'  Make sure the query only returns devices that make sence to test Disable/Eanable for
'

DeviceQuery = " IsPhantom=False AND IsDisableable=True AND IsStarted=True AND " + DeviceQuery

'
' Create WDTF object
'

Set WDTF = CreateObject("WDTF2.WDTF")

Set WDTFSup = WDTF.SystemDepot.ThisSystem.GetInterface("Support")

'
' Query for devices to Disable/Enable 
'

set DeviceCol = WDTF.DeviceDepot.Query(DeviceQuery)


'
'  Get I/O Stress collection
'


set IoStressCol = DeviceCol.GetInterfacesIfExist("SimpleIOStressEx")

'
'  Loop threw each I/O stress test
'

For Each IoStress In IoStressCol

   '
   '  Get PNP action for Device 
   ' 
   set PNPAction = IoStress.Target.GetInterface("PNP")

   '
   '  Perform some BEFORE I/O 
   '

   IoStress.Start()
   WScript.Sleep(IOPeriod)
   IoStress.Stop()

  
   '
   '   Disable / Enable device
   '

   PNPAction.DisableDevice()
   PNPAction.EnableDevice()
   WScript.Sleep(10000)

   '
   '  Perform some AFTER I/O 
   '

   IoStress.Start()
   WScript.Sleep(IOPeriod)
   IoStress.Stop()

Next


WDTFSup.WaitForMinutes(1)

