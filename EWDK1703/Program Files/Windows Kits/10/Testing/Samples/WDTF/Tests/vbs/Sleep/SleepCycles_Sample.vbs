
'
' Variable defenition 
'

Dim WDTF
Dim System
Dim SleepState


'
' Create WDTF object
'

Set WDTF = CreateObject("WDTF2.WDTF")


'
' Get System Action
'

Set System = WDTF.SystemDepot.ThisSystem.GetInterface("System")


'
'  Start test case 
'

WDTF.Log.StartTestCase "Enumerate Threw All Sleep States"
   

'
' Cycle threw sleep states
'
    
SleepState =  System.GetFirstSleepState 

do while SleepState 


   System.Sleep SleepState


   SleepState =  System.GetNextSleepState 

Loop


'
'  End test case 
'


WDTF.Log.EndTestCase

