
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
'  Loop threw each device
'

For Each Device In DeviceCol

   '
   ' Get device to do I/O against
   '

   set IoDeviceCol = Device.GetRelations("below-or-self/","")

   '
   '  Get I/O Stress collection
   '

   set IoStressCol = IoDeviceCol.GetInterfacesIfExist("SimpleIOStressEx")

   '
   '  Perform some BEFORE I/O stress
   '

   if IoStressCol.Count then 
      IoStressCol.Start()
      WScript.Sleep(IOPeriod)
      IoStressCol.Stop()
   End if

   '
   '  Get PNP action for Device 
   ' 
   set PNPAction = Device.GetInterface("PNP")

   '
   '  Cycle threw Devices 
   ' 

   For i = 1 To Cycles

      '
      '   Disable / Enable device
      '

      PNPAction.DisableDevice()
      PNPAction.EnableDevice()

      '
      '  Wait a bit for device to become ready
      '

      WScript.Sleep(10000)

      '
      '  Perform some AFTER I/O stress
      '
      if IoStressCol.Count then 
         IoStressCol.Start()
         WScript.Sleep(IOPeriod)
         IoStressCol.Stop()
      End if

   Next

Next

WDTFSup.WaitForMinutes(1)


