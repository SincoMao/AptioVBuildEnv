
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
' Query for a single device 
'

set Device = WDTF.DeviceDepot.QuerySingle(DeviceQuery)


if Device.HasInterface("SimpleIOStressEx") then

  '
  '  Get Simple I/O Stress test for device 
  '


  Set SimpleIOStress = Device.GetInterface("SimpleIOStressEx")



  '
  '  Start test case 
  '

  WDTF.Log.StartTestCase "Start Device I/O"


  '
  '  Start , wait , and then stop Simple I/O Stress.
  '

  SimpleIOStress.StartAsync()

  WScript.Sleep(10000)

  SimpleIOStress.Pause()

  WScript.Sleep(10000)

  SimpleIOStress.ContinueAsync()

  WScript.Sleep(10000)

  SimpleIOStress.Stop

  '
  '   End test case 
  '
  WDTF.Log.EndTestCase

end if
