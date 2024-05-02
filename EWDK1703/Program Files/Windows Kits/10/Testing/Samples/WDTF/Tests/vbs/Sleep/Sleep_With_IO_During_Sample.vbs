
'
' Variable defenition 
'

Dim WDTF
Dim System
Dim SleepState
Dim Devices
Dim Actions
Dim Action
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
' Get System Action
'

Set System = WDTF.SystemDepot.ThisSystem.GetInterface("System")

'
' Query for device 
'

set Devices = WDTF.DeviceDepot.Query(DeviceQuery)


'
'  Get Simple I/O stress tests for each device that we have one.
'


set Actions = Devices.GetInterfacesIfExist("SimpleIOStressEx")


'
'  Start test case 
'

WDTF.Log.StartTestCase "Cycle Threw All Sleep States"


'
' Start device testing
'

Actions.DisableObjectErrorLogging()
Actions.Start()

   

'
' Loop threw all sleep states once
'
    
SleepState =  System.GetFirstSleepState 

do while SleepState 

   
    
   '
   '  Put system to sleep 
   '


   System.Sleep SleepState

   
   WScript.Sleep(10000)

 
   SleepState =  System.GetNextSleepState 

Loop


Actions.Stop()


'
'  End test case 
'


WDTF.Log.EndTestCase

