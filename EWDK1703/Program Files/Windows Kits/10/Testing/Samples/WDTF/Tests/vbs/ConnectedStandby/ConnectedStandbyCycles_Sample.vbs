'
' Variable defenition 
'
Dim System
Dim TestMode
Dim TestCycles
Dim CSDuration
Dim DelayBetweenCycles
Dim WDTFSup
Dim SimulatedBatterySystemSystemAction


'
'  Use default query or one from the command line.
'

TestCycles = 1
CSDuration = 10
DelayBetweenCycles = 5

'
'  Display Usage
'
If WScript.Arguments.Named.Exists("?") Then
    WScript.Echo("")
    WScript.Echo("This script will put the system under test through the specified number of ")
    WScript.Echo("Connected Standby cycles.")
    WScript.Echo("")
    WScript.Echo("Usage: cscript ConnectedStandbyCycles_Sample.vbs [/TestCycles:n] [/CSDuration:n] [/DelayBetweenCycles:n]")
    WScript.Echo("")
    WScript.Echo("  /TestCycles:n           n indicates the number of test cycles.")
    WScript.Echo("")
    WScript.Echo("  /CSDuration:n           n indicates delay time in seconds between CS enter and exit.")
    WScript.Echo("")
    WScript.Echo("  /DelayBetweenCycles:n   n indicates delay time in seconds between CS cycles.")
    WScript.Echo("")
    WScript.Quit(1)
End If


'   Parameter details are as following -
'
'        TestCycles
'            Number of test cycles.
' 
'        CSDuration
'            Delay time in seconds between CS enter and exit.
'
'        DelayBetweenCycles
'            Delay time in seconds between CS cycles.
'

If WScript.Arguments.Named.Exists("TestCycles") Then
    TestCycles = WScript.Arguments.Named("TestCycles")
    If TestCycles = 0 Then
        WScript.Echo("Number of test cycles should be greater than 0. Set to default value of 1.")
        TestCycles = 1
    End If
End If                

If WScript.Arguments.Named.Exists("CSDuration") Then
    CSDuration = WScript.Arguments.Named("CSDuration")
    If CSDuration = 0 Then
        WScript.Echo("Connected Standby duration should be greater than 0. Set to default value of 10 seconds.")
        CSDuration = 10
    End If
End If                

If WScript.Arguments.Named.Exists("DelayBetweenCycles") Then
    DelayBetweenCycles = WScript.Arguments.Named("DelayBetweenCycles")
    If DelayBetweenCycles = 0 Then
        WScript.Echo("Delay between test cycles should be greater than 0. Set to default value of 5 seconds.")
        DelayBetweenCycles = 5
    End If
End If                

'
' Create WDTF object
'

Set WDTF = CreateObject("WDTF2.WDTF")

'
' Set TestModeVerify to TRUE to catch device configuration issues
'

WDTF.Config.TestModeVerify = True

'
' Get WDTFSup
'

Set WDTFSup = WDTF.SystemDepot.ThisSystem.GetInterface("Support")

'
' Get System Action
'

Set System = WDTF.SystemDepot.ThisSystem.GetInterface("System")

'
' Only run on system that supports AoAc
'
If NOT WDTF.SystemDepot.ThisSystem.Eval("PowerStates::AoAc=True") Then

   WDTF.Log.OutputError "This test only works on AoAc-capable system."
   WScript.Quit(50)

End If

'
'  Simulate DC power status to decrease timeouts for services that can block
'  deep platform idle states.
'
'  Create SimulatedBattery object, enable the simulated battery, disable real
'  batteries, and set to DC
'
Set SimulatedBatterySystemSystemAction = WDTF.SystemDepot.ThisSystem.GetInterface("SimulatedBatterySystem")
SimulatedBatterySystemSystemAction.EnableSimulatedBattery()
SimulatedBatterySystemSystemAction.DisableRealBatteries()
SimulatedBatterySystemSystemAction.SetSimulatedBatteryToDC()
'
' Wait for second order effects of changing to DC propagate through the system
' before entering CS, otherwise it can interfere with test operation.
'     Example: Switching to DC while in CS will cause the system to briefly exit
'     CS, thus interfering with the automation and changing to unexpected state.
' This is not done inside the SimulatedBatterySystem interface because the test
' might want to monitor and/or verify the second order effects (policy changing,
' display changing brightness, etc.) instead of getting them out of the way before
' continuing.
'
WScript.Sleep 1000


WDTF.Log.OutputInfo "TestCycles: " & TestCycles 
WDTF.Log.OutputInfo "CSDuration: " & CSDuration
WDTF.Log.OutputInfo "DelayBetweenCycles: " & DelayBetweenCycles


If TestCycles = 1 Then
    WDTF.Log.StartTestCase "Perform " & TestCycles & " Connected Standby Cycle"
Else 
    WDTF.Log.StartTestCase "Perform " & TestCycles & " Connected Standby Cycles"
End If

Dim i
For i = 1 To TestCycles


   WDTF.Log.OutputInfo "Test Connected Standby Cycle #" & i


   '
   '  Enter and exit Connected Standby
   '

   System.ConnectedStandby(CSDuration * 1000)

   '
   '  Alternatively, enter and exit Connected Standby in two separate calls.
   '  This requires the script host to be exempted with the DAM.
   ' 
   '  System.EnterConnectedStandby
   '  <Perform some tests>
   '  System.ExitConnectedStandby
   '

   '
   '  Wait a bit before continuing
   '

   If (i < TestCycles) Then
      WDTFSup.WaitForSeconds(DelayBetweenCycles)
   End If

Next


'
'  set to AC power status, enable real batteries, disable the simulated battery
'
SimulatedBatterySystemSystemAction.SetSimulatedBatteryToAC()
SimulatedBatterySystemSystemAction.EnableRealBatteries()
SimulatedBatterySystemSystemAction.DisableSimulatedBattery()

WDTF.Log.EndTestCase


