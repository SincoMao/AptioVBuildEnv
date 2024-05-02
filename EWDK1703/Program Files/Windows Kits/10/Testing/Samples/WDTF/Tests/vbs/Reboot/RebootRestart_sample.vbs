
'
' Variable defenition 
'

Dim WDTF
Dim System


'
' Create WDTF object
'

Set WDTF = CreateObject("WDTF2.WDTF")


'
' Get System Action
'

Set System = WDTF.SystemDepot.ThisSystem.GetInterface("System")


'
' See if we have restarted 
'
    
if System.IsRestarted then

   '
   '  Resume test case after reboot
   '


else

   '
   ' Run a test case that requires a reboot
   '
      
   System.RebootRestart


End If

