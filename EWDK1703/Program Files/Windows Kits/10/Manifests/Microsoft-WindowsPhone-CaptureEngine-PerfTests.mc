<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<!--
Use of this source code is subject to the terms of the Microsoft shared
source or premium shared source license agreement under which you licensed
this source code. If you did not accept the terms of the license agreement,
you are not authorized to use this source code. For the terms of the license,
please see the license agreement between you and Microsoft or, if applicable,
see the SOURCE.RTF on your install media or the root of your tools installation.
THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
-->
<instrumentationManifest
    xmlns="http://schemas.microsoft.com/win/2004/08/events"
    xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>
    <events>
      <provider
          name="Microsoft-WindowsPhone-CaptureEngine-PerfTests"
          guid="{f12107d9-d5a9-49a1-a2ea-b2f15095ee08}"
          symbol="Microsoft_WindowsPhone_CaptureEngine_PerfTests"
          resourceFileName="PerfTests.dll"
          messageFileName="PerfTests.dll">

        <channels />

        <!-- Keywords for Microsoft-WindowsPhone-CaptureEngine -->
        <keywords>
            <keyword mask="0x0000000000000001" name="Error" />
            <keyword mask="0x0000000000000002" name="Performance" />
            <!-- Other keywords are provider-specific. -->
            <keyword mask="0x0000000000000004" name="Debug" />
        </keywords>

        <tasks>
            <task
                name="RecordStart-Latency-Perf-Test"
                value="100"
                symbol="RecordStart_Latency_Perf_Test"
                message="$(string.RecordStartLatency.TaskMessage)"
                />
          <task
                name="RecordStop-Latency-Perf-Test"
                value="101"
                symbol="RecordStop_Latency_Perf_Test"
                message="$(string.RecordStopLatency.TaskMessage)"
                />
          <task
                name="StillCapture-Latency-Perf-Test"
                value="102"
                symbol="StillCapture_Latency_Perf_Test"
                message="$(string.StillCaptureLatency.TaskMessage)"
                />
          <task
                name="VideoCaptureStartup-Latency-Perf-Test"
                value="103"
                symbol="VideoCaptureStartup_Latency_Perf_Test"
                message="$(string.VideoCaptureStartup.TaskMessage)"
                />
          <task
               name="StillCaptureStartup-Latency-Perf-Test"
               value="104"
               symbol="StillCaptureStartup_Latency_Perf_Test"
               message="$(string.StillCaptureStartup.TaskMessage)"
                />
        </tasks>
        <templates>
            <template tid="String">
                <data inType="win:UnicodeString" name="pszString"/>
            </template>
            <template tid="StringString">
                <data inType="win:UnicodeString" name="pszDesc"/>
                <data inType="win:UnicodeString" name="pszString"/>
            </template>
        </templates>
        <events>
          <event
              keywords="Performance"
              level="win:Informational"
              message="$(string.Begin_RecordStart_Latency_Perf_Test.EventMessage)"
              opcode="win:Start"
              symbol="Begin_RecordStart_Latency_Perf_Test"
              task="RecordStart-Latency-Perf-Test"
              template="String"
              value="200"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_RecordStart_Latency_Perf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_RecordStart_Latency_Perf_Test"
              task="RecordStart-Latency-Perf-Test"
              template="String"
              value="201"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.Begin_RecordStop_Latency_Perf_Test.EventMessage)"
              opcode="win:Start"
              symbol="Begin_RecordStop_Latency_Perf_Test"
              template="String"
              task="RecordStop-Latency-Perf-Test"
              value="300"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_RecordStop_Latency_Perf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_RecordStop_Latency_Perf_Test"
              task="RecordStop-Latency-Perf-Test"
              template="String"
              value="301"
              />
          <event
             keywords="Performance "
             level="win:Informational"
             message="$(string.Begin_StillCapture_Latency_Perf_Test.EventMessage)"
             opcode="win:Start"
             symbol="Begin_StillCapture_Latency_Perf_Test"
             task="StillCapture-Latency-Perf-Test"
             template="String"
             value="400"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_StillCapture_Latency_Perf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_StillCapture_Latency_Perf_Test"
              task="StillCapture-Latency-Perf-Test"
              template="String"
              value="401"
              />
          <event
             keywords="Performance "
             level="win:Informational"
             message="$(string.Begin_VideoCaptureStartup_Latency_Perf_Test.EventMessage)"
             opcode="win:Start"
             symbol="Begin_VideoCaptureStartup_Latency_Perf_Test"
             task="VideoCaptureStartup-Latency-Perf-Test"
             template="String"
             value="500"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_VideoCaptureStartup_Latency_Perf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_VideoCaptureStartup_Latency_Perf_Test"
              task="VideoCaptureStartup-Latency-Perf-Test"
              template="String"
              value="501"
              />
          <event
             keywords="Performance "
             level="win:Informational"
             message="$(string.Begin_StillCaptureStartup_Latency_Perf_Test.EventMessage)"
             opcode="win:Start"
             symbol="Begin_StillCaptureStartup_Latency_Perf_Test"
             task="StillCaptureStartup-Latency-Perf-Test"
             template="String"
             value="600"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_StillCaptureStartup_Latency_Perf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_StillCaptureStartup_Latency_Perf_Test"
              task="StillCaptureStartup-Latency-Perf-Test"
              template="String"
              value="601"
              />
        </events>
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <!-- Keywords -->
        <string
            id="Keyword.Error"
            value="Error"
            />
        <string
            id="Keyword.Performance"
            value="Performance"
            />
        <string
            id="Keyword.Debug"
            value="Debug"
            />
        <!-- Task Messages -->
        <string
            id="RecordStartLatency.TaskMessage"
            value="Start Record Task"
            />
        <string
          id="RecordStopLatency.TaskMessage"
          value="Stop Record Task"
            />
        <string
          id="StillCaptureLatency.TaskMessage"
          value="Capture Still Image Task"
            />
        <string
          id="VideoCaptureStartup.TaskMessage"
          value="Setup Video Capture Task"
            />
        <string
          id="StillCaptureStartup.TaskMessage"
          value="Setup Still Capture Task"
            />
        <!-- Event Messages -->
        <string
            id="Begin_RecordStart_Latency_Perf_Test.EventMessage"
            value="Begin Record Start Perf Marker"
            />
        <string
            id="End_RecordStart_Latency_Perf_Test.EventMessage"
            value="End Record Start Perf Marker"
            />
        <string
           id="Begin_RecordStop_Latency_Perf_Test.EventMessage"
           value="Begin Record Stop Perf Marker"
            />
        <string
            id="End_RecordStop_Latency_Perf_Test.EventMessage"
            value="End Record Stop Perf Marker"
            />
        <string
           id="Begin_StillCapture_Latency_Perf_Test.EventMessage"
           value="Begin Still Capture Perf Marker"
            />
        <string
            id="End_StillCapture_Latency_Perf_Test.EventMessage"
            value="End Still Capture Perf Marker"
            />
        <string
           id="Begin_VideoCaptureStartup_Latency_Perf_Test.EventMessage"
           value="Begin Video Capture Startup Perf Marker"
            />
        <string
            id="End_VideoCaptureStartup_Latency_Perf_Test.EventMessage"
            value="End Video Capture Startup Perf Marker"
            />
        <string
           id="Begin_StillCaptureStartup_Latency_Perf_Test.EventMessage"
           value="Begin Still Capture Startup Perf Marker"
            />
        <string
            id="End_StillCaptureStartup_Latency_Perf_Test.EventMessage"
            value="End Still Capture Startup Perf Marker"
            />
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
