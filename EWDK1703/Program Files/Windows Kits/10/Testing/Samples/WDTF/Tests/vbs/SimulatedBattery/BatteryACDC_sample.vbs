
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
'  Get your newly created SimulatedBatterySystem action interface
'

Set SimulatedBatterySystemSystemAction = WDTF.SystemDepot.ThisSystem.GetInterface("SimulatedBatterySystem")


'
'  set up for testing
'

'  enable the simulated battery
SimulatedBatterySystemSystemAction.EnableSimulatedBattery()

'  disable real batteries
SimulatedBatterySystemSystemAction.DisableRealBatteries()

'  set to DC power status
SimulatedBatterySystemSystemAction.SetSimulatedBatteryToDC()

'  set to 50% charge level
SimulatedBatterySystemSystemAction.SetSimulatedBatteryChargePercentage(50)

'
' It might be necessary to wait for second order effects of changing to DC propagate
' through the system before continuing the test, otherwise the effects can interfere
' with test operation.
'     Example: Switching to DC while in CS will cause the system to briefly exit
'     CS, thus interfering with automation that immediately tries to enter CS after
'     changing to DC.
' This is not done inside the SimulatedBatterySystem interface because the test
' might want to monitor and/or verify the second order effects (policy changing,
' display changing brightness, etc.) instead of getting them out of the way before
' continuing.
'
WScript.Sleep 1000


'
'  allow the system to run on DC power for 10 seconds
'    normally real test code would go here instead of a time delay
'    optionally the process can exit and leave the battery status as is and restore it later
'        example
'           1. run app to set simulated battery state before running tests
'              a. enable simulated battery
'              b. disable real batteries
'              c. set simulated battery to DC
'              d. set simulated battery to 50% charge level
'              e. exit app
'           2. run other tests and processes (including manual tests, reboots, etc.)
'           3. run app again to clean up
'              a. set simulated battery to AC
'              b. enable real batteries
'              c. disable simulated battery
'              d. exit app
'
WDTF.Log.OutputInfo "running test on DC power"
WScript.Sleep 10000 


'
'  clean up
'

'  set to AC power status
SimulatedBatterySystemSystemAction.SetSimulatedBatteryToAC()

'  enable real batteries
SimulatedBatterySystemSystemAction.EnableRealBatteries()

'  disable the simulated battery
SimulatedBatterySystemSystemAction.DisableSimulatedBattery()

