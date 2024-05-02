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


Set System = WDTF.SystemDepot.ThisSystem.GetInterface("System")

'
' Query for devices 
'
if System.IsRestarted then

  WDTF.Log.OutputInfo "Enabled EDT on all devices"

else

  set Devices = WDTF.DeviceDepot.Query(DeviceQuery)

  set EDT = Devices.GetInterfacesIfExist("EDT")

  EDT.SkipRestart = true

  EDT.Enable()
  
   '
   ' Reboot and restart
   '

   System.RebootRestart()  

end if
