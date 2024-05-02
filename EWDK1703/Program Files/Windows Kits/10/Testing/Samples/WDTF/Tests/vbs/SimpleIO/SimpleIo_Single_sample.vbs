
'
' Variable defenition 
'

Dim WDTF
Dim SimpleIO
Dim Device
Dim DeviceQuery


'
'  Use default query or one from the command line.
'

DeviceQuery = "Volume::DriveLetter"


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

'
'  Get Simple I/O test for device 
'
if Device.HasInterface("SimpleIOEx") then



  Set SimpleIO = Device.GetInterface("SimpleIOEx")

  '
  '  Start test case 
  '

  WDTF.Log.StartTestCase "Start Simple I/O"


  '
  ' Use Simple I/O a bit.
  '

  SimpleIO.Open()
  SimpleIO.PerformIO()
  SimpleIO.PerformIO()
  SimpleIO.Close

  '
  '  End test case 
  '

  WDTF.Log.EndTestCase

end if