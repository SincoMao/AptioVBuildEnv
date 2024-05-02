
'
'  Use default query or one from the command line.
'

DeviceQuery = "IsDevice"


if WScript.Arguments.Named.Exists("DQ") then 

    DeviceQuery = DeviceQuery & " AND " & WScript.Arguments.Named("DQ")

End if


'
'  Make sure the query only returns devices that make sense to test Disable/Eanable for
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

set Devices = WDTF.DeviceDepot.Query(DeviceQuery)

'
'  Loop threw each device
'

For Each Device In Devices

   '
   '  Get PNP action for Device 
   ' 

   set PNPAction = Device.GetInterface("PNP")


   '
   '   Attempt to disable device
   '

   if PNPAction.DisableDevice() = False then 
      WDTF.Log.OutputInfo "   Do something if Disable failed"
   else 
      WDTF.Log.OutputInfo "   Do something if it Disabled"   
   end if 

   '
   '  See if we need a reboot
   '

   if  PNPAction.Target.Eval("IsRebootNeeded") = True then 
      WDTF.Log.OutputInfo "   Do something if reboot is needed"
   else 
      WDTF.Log.OutputInfo "   Do something if no reboot is needed"   
   end if
 

   '
   '   Attempt to Enable device
   '

   if PNPAction.EnableDevice() = False then 
      WDTF.Log.OutputInfo "   Do something if Enable failed"
   else 
      WDTF.Log.OutputInfo "   Do something if it Enableed"   
   end if 



Next


WDTFSup.WaitForMinutes(1)
