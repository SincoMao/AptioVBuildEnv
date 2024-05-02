'
' Variable defenition 
'
Dim WDTF
Dim SimulatedBatterySystemSystemAction


'
' Create WDTF object
'
Set WDTF = CreateObject("WDTF2.WDTF")

'
'  Get SimulatedBatterySystem action interface
'
Set SimulatedBatterySystemSystemAction = WDTF.SystemDepot.ThisSystem.GetInterface("SimulatedBatterySystem")

If WScript.Arguments.Named.Exists("setup") Then
    Setup
ElseIf WScript.Arguments.Named.Exists("cleanup") Then
    Cleanup
ElseIf WScript.Arguments.Named.Exists("AC") Then
    AC
ElseIf WScript.Arguments.Named.Exists("DC") Then
    DC
ElseIf WScript.Arguments.Named.Exists("percent") Then
    ChargeLevel WScript.Arguments.Named("percent")
Else
    Help
End If


Sub Setup
    '  enable the simulated battery
    SimulatedBatterySystemSystemAction.EnableSimulatedBattery()

    '  disable real batteries
    SimulatedBatterySystemSystemAction.DisableRealBatteries()
End Sub

Sub ChargeLevel(ByVal percent)
    If (percent < 0) or (percent > 100) Then percent = 100
    '  set to percent percent charge level
    SimulatedBatterySystemSystemAction.SetSimulatedBatteryChargePercentage(percent)
End Sub

Sub DC
    '  set to DC power status
    SimulatedBatterySystemSystemAction.SetSimulatedBatteryToDC()

    ' might need to wait for second-order effects of DC change to propagate through the system before
    ' continuing with testing
    WScript.Sleep 1000
End Sub

Sub AC
    '  set to AC power status
    SimulatedBatterySystemSystemAction.SetSimulatedBatteryToAC()
End Sub

Sub CleanUp
    '  enable real batteries
    SimulatedBatterySystemSystemAction.EnableRealBatteries()

    '  disable the simulated battery
    SimulatedBatterySystemSystemAction.DisableSimulatedBattery()
End Sub

Sub Help
    WDTF.Log.OutputInfo "Simulated Battery Control Script"
    WDTF.Log.OutputInfo "  usage: cscript.exe SimulatedBattery_Control.vbs <control>"
    WDTF.Log.OutputInfo "  example: cscript.exe SimulatedBattery_Control.vbs /setup"
    WDTF.Log.OutputInfo "Controls:"
    WDTF.Log.OutputInfo "  /setup     - sets up the simulated battery, this must be called before"
    WDTF.Log.OutputInfo "               attempting to use the AC, DC, or chargepercent controls"
    WDTF.Log.OutputInfo "  /cleanup   - cleans up the simulated battery"
    WDTF.Log.OutputInfo "  /AC        - sets the simulated battery to AC power"
    WDTF.Log.OutputInfo "  /DC        - sets the simulated battery to DC power"
    WDTF.Log.OutputInfo "  /chargepercent:<percent> - sets the simulated battery charge percent"
End Sub