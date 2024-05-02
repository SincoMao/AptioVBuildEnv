'---------------------------------------------------------------------------
' Microsoft Test Automation Sources
'
' Copyright 2005 Microsoft Corporation. All Rights Reserved.
'
' Common.vbs
'
' Collection: WDTF Automation Scenarios
' 
' Environment: CScript
'
' Primary Contact: WDTF Support (WDTFSupp@microsoft.com)
'
' Remarks:
'   This file is used as an include file for many of the Automated Scenarios
' produced using WDTF. It exports classes that make writing, understanding,
' and maintaining these scenarios easier.
'
' History:
'   [Date]        -   [Status]
'   Dec 00 2005   -   Created
'   Apr 08 2006   -   Updated comments. Wrapped Rnd/Randomize
'---------------------------------------------------------------------------



'----------------------------------------------------------------------------
'  Wrap Randomize for use in JScript
'----------------------------------------------------------------------------
Function SeedRand(Seed)
    On Error Goto 0
    Rnd -Seed
    Randomize Seed
End Function
Function Rand()
    Rand = Rnd
End Function

'----------------------------------------------------------------------------
'  Wrap CStr for use in JScript
'----------------------------------------------------------------------------
Function JStr(value)
    JStr = CStr(value)
End Function



'****************************************************************************
'****************************************************************************
'****************************************************************************
'  Everything below this line is just for comparison to the JScript equivalent
'****************************************************************************
'****************************************************************************
'****************************************************************************



'----------------------------------------------------------------------------
'  Find and Start all the SimpleIO for devices
'----------------------------------------------------------------------------
Sub ConstructSimpleIOStress(Devices, TestingDevices)
    On Error Goto 0
    
    Dim Device
    Dim SimpleIOStress
    
    Dim Count
        Count = 0

    For Each Device In Devices
        
        Count = Count + 1
        
        StartTest "( " & Count & " )", "Name: " & Device.GetValue("DisplayName")
        
        TraceDeviceInfo(Device)
        
        On Error Goto 0
        '  Save Device problem code and status
        Device.Context("PreviousStatus") = Device.GetValue("Status")
        Device.Context("PreviousProblemCode") = Device.GetValue("ProblemCode")
        
        On Error Resume Next
        Set SimpleIOStress = Device.GetInterface("SimpleIOStress")
        
        If Err.number = 0 Then
            
            L.Trace LVL_MSG, hLog, "SimpleIOStress found. Starting it."
            
            On Error Resume Next
            SimpleIOStress.Start()
            If Err.number <> 0 Then
                L.Trace LVL_ERR, hLog, Err.number, 1, FileName, 0, "Start() failed: " & Err.Description
                Err.Clear
            Else
            
                ' Save the SimpleIOStress in "SimpleIOStress"
                Device.Context("SimpleIO") = SimpleIOStress
                
                TestingDevices.Add(Device)
            End If

        Else
            L.Trace LVL_MSG, hLog, "SimpleIOStress NOT found."
        End If
        
        EndTest "( " & Count & " )"
        
        On Error Goto 0
    Next
End Sub



Sub CheckSimpleIOStress(bStop, Devices)
    On Error Goto 0
    
    Dim Device
    
    Dim Count
        Count = 0
    
    For Each Device In Devices
    
        Count = Count + 1

        StartTest "(" & Count & ")", "Name: " & Device.GetValue("DisplayName")
        
        TraceDeviceInfo(Device)
        
        Dim SimpleIOStress
        Set SimpleIOStress = Device.Context("SimpleIO")
        
        If bStop Then
            On Error Resume Next
            SimpleIOStress.Stop
            If Err.number <> 0 Then
                L.Trace LVL_ERR, hLog, Err.number, 1, FileName, 0, "Stop() failed to close device: " & Err.Description
            End If
            On Error Goto 0
        Else
            On Error Resume Next
            SimpleIOStress.Pause
            If Err.number <> 0 Then
                L.Trace LVL_ERR, hLog, Err.number, 1, FileName, 0, "Pause() failed! Internal Test Error. " & Err.Description
            End If
            On Error Goto 0
        End If
        
        L.Trace LVL_MSG, hLog, "Failure Count: " & SimpleIOStress.Status.FCount
        L.Trace LVL_MSG, hLog, "Success Count: " & SimpleIOStress.Status.SCount
        
        On Error Resume Next
        SimpleIOStress.Status.AssertSuccess()
        If Err.number <> 0 Then
            L.Trace LVL_ERR, hLog, Err.number, 1, FileName, 0, _
                "SimpleIOStress Failed! " & Err.Description
        End If
        On Error Goto 0
                
        EndTest "(" & Count & ")"
    Next
End Sub



'----------------------------------------------------------------------------
'  Method does a sleep cycle
'----------------------------------------------------------------------------
Sub DoSleepCycle(ConsoleAction, SleepState)
    On Error Goto 0
    
    If SleepState = 0 Then
        ' Go back to the lightest sleep state
        SleepState = ConsoleAction.GetFirstSleepState
    End If
    
    If SleepState = 0 Then
        L.Trace LVL_ERR, hLog, -1, 1, FileName, 0, "The system reports that it no longer supports any sleep states."
    Else

        L.Trace LVL_MSG, hLog, "Time: " & Now
        L.Trace LVL_MSG, hLog, "Sleep State: S" & SleepState
                
        '  Set sleep and wake info
        ConsoleAction.SetSleepStateInfo SleepPeriod, SleepState

        '
        '  Check whether autowake is possible
        '
        Dim AutoWake
        AutoWake = ConsoleAction.EnableAutoWakeIfPossible
        If AutoWake = 0 Then
            L.Trace LVL_ERR, hLog, -1, 1, FileName, 0, "Automatic wakeup is not supported for this sleep state."
        Else
            '
            '  Put the system into the sleep state
            '
            On Error Resume Next
            ConsoleAction.SetSleepState()
            If Err.number <> 0 Then
                L.Trace LVL_ERR, hLog, Err.number, 1, FileName, 0, "SetSleepState() failed. " & Err.Description
            Else
                L.Trace LVL_MSG, hLog, "Awake: " & Now
            End If
            On Error Goto 0
            
        End If
        
    End If
    
    ' Reset the idle timers, to make sure system doesn't just go back to sleep.
    Console.SimulateUserKeyPress()
End Sub



'----------------------------------------------------------------------------
'  Check problem codes and status for all devices
'----------------------------------------------------------------------------
Sub CheckDeviceStatus(Devices)
    On Error Goto 0
    
    Dim Device
    
    Dim Count
        Count = 0

    Dim NewProblemCode
    Dim PreviousProblemCode
    Dim NewStatus
    Dim PreviousStatus
        
    For Each Device In Devices

        Count = Count + 1
        
        StartTest "(" & Count & ")", "Name: " & Device.GetValue("DisplayName")
        
        TraceDeviceInfo(Device)
        
        NewProblemCode = Device.GetValue("ProblemCode")
        NewStatus      = Device.GetValue("Status")
        PreviousProblemCode = Device.Context("PreviousProblemCode")
        PreviousStatus      = Device.Context("PreviousStatus")
        
        If NewProblemCode <> PreviousProblemCode Then
            L.Trace LVL_MSG, hLog, "Previous Problem Code: " & PreviousProblemCode
            L.Trace LVL_ERR, hLog, -1, 1, FileName, 0, "Problem Code has changed to: " & NewProblemCode
            
        End If

        Device.Context("PreviousProblemCode") = NewProblemCode

        ' Ignore the 0x100 bit, since it just means that the device thinks it needs a reboot
        If BinaryAND(NewStatus, &HFFFFFEFF) <> BinaryAND(PreviousStatus, &HFFFFFEFF) Then
            L.Trace LVL_MSG, hLog, "Previous Status Code: " & PreviousStatus
            L.Trace LVL_ERR, hLog, -1, 1, FileName, 0, "Status Code has changed to: " & NewStatus            
        End If

        Device.Context("PreviousStatus") = NewStatus
        
        EndTest "(" & Count & ")"
    Next
End Sub


'----------------------------------------------------------------------------
'  Do a disable/enable cycle on all devices in Devices
'----------------------------------------------------------------------------
Sub DoDisableEnableCycle(Devices)
    On Error Goto 0
    Dim Device
    Dim Action
    Dim DeviceIsDisabled
    
    For Each Device In Devices
    
        TraceDeviceInfo(Device)
        
        On Error Resume Next
        Set Action = Device.GetInterface("DisEn")
        
        If Err.number = 0 Then
            On Error Resume Next
            Action.Disable()
            If Err.number = 0 Then
                L.Trace LVL_MSG, hLog, "Disable() Passed"
            Else
                L.Trace LVL_ERR, hLog, Err.number, 1, FileName, 0, "Disable() failed: " & Err.Description
            End If
            On Error Goto 0
            
            WScript.Sleep(10000)
            
            DeviceIsDisabled = False
            
            On Error Resume Next
            DeviceIsDisabled = Action.IsDisabled
            If Not DeviceIsDisabled Then
                ' This may be considered an error in most cases. But some devices
                ' (like keyboards, certain mice, display adapters, and boot/system volumes)
                ' cannot be disabled without a reboot.
                L.Trace LVL_MSG, hLog, "Is the device requiring a reboot?"
                L.Trace LVL_MSG, hLog, "Status  Code: " & Device.GetValue("Status")
                L.Trace LVL_MSG, hLog, "Problem Code: " & Device.GetValue("ProblemCode")
            End If
            If Err.number <> 0 Then
                L.Trace LVL_ERR, hLog, Err.number, 1, FileName, 0, "IsDisabled Failed: " & Err.Description
            End If
            On Error Goto 0
            
            On Error Resume Next
            Action.Enable()
            If Err.number = 0 Then
                L.Trace LVL_MSG, hLog, "Enable() Passed"
            Else
                L.Trace LVL_ERR, hLog, Err.number, 1, FileName, 0, "Enable() failed: " & Err.Description
            End If
            On Error Goto 0
        Else
            L.Trace LVL_MSG, hLog, "DisEn implementation not found! " & Err.Description
        End If
        
        On Error Goto 0
    Next
End Sub



'----------------------------------------------------------------------------
'  Simple Wrapper for outputting standard device information
'----------------------------------------------------------------------------
Sub TraceDeviceInfo(InfoDevice)
    On Error Goto 0
    L.Trace LVL_MSG, hLog, "DeviceID: " & InfoDevice.GetValue("DeviceID")
    L.Trace LVL_MSG, hLog, "Name: "     & InfoDevice.GetValue("DisplayName")
    L.Trace LVL_MSG, hLog, "Class: "    & InfoDevice.GetValue("ClassGUID")
End Sub



'----------------------------------------------------------------------------
'  Simple Wrapper for Starting a TestGroup/TestCase
'----------------------------------------------------------------------------
Sub StartTest(TUID_Suffix, Assertion)
    On Error Goto 0
    Dim Depth
        Depth = UBound(TUID_Build)
    
    ReDim Preserve TUID_Build(Depth+1)
    
    TUID_Build(Depth+1) = Array(TUID_Build(Depth)(0) & TUID_Suffix, Assertion)
    
    L.StartTestEx TUID_Build(Depth+1)(0), Assertion, 4, TUID_Build(Depth)(0), TUID_Build(Depth)(1), hLog
End Sub


'----------------------------------------------------------------------------
'  Simple Wrapper for ending a TestGroup/TestCase
'----------------------------------------------------------------------------
Sub EndTest(TUID_Suffix)
    On Error Goto 0
    Dim Depth
        Depth = UBound(TUID_Build)
        
    If (TUID_Build(Depth-1)(0) & TUID_Suffix) <> TUID_Build(Depth)(0) Then
        L.Trace LVL_ERR, hLog, -1, 1, FileName, 0, "Test has a bug in logging, StartTest/EndTest are improperly nested"
    End If
    
    L.EndTest TUID_Build(Depth)(1), 1, "", hLog
    
    ReDim Preserve TUID_Build(Depth-1)
End Sub
