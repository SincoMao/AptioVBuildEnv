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
          name="Microsoft-WindowsPhone-Camera-Driver-PerfTests"
          guid="{1D14BCCE-E5F8-4C5D-BEC5-234F60D72E74}"
          symbol="Microsoft_WindowsPhone_Camera_Driver_PerfTests"
          resourceFileName="cameradrivertest.dll"
          messageFileName="cameradrivertest.dll">

        <channels />

        <!-- Keywords for Microsoft-WindowsPhone-MetaProcMFT -->
        <keywords>
            <keyword mask="0x0000000000000001" name="Error" />
            <keyword mask="0x0000000000000002" name="Performance" />
            <!-- Other keywords are provider-specific. -->
            <keyword mask="0x0000000000000004" name="Debug" />
        </keywords>

        <tasks>
            <task
                name="AutoFocus-Perf-Test"
                value="100"
                symbol="AutoFocus_Perf_Test"
                message="$(string.AFPerf_Test.TaskMessage)"
                />
            <task
                name="PreviewPin-Perf-Test"
                value="101"
                symbol="PreviewPin_Perf_Test"
                message="$(string.PreviewPinPerf_Test.TaskMessage)"
                />
            <task
                name="ZoomLevelPreview-Perf-Test"
                value="102"
                symbol="ZoomLevelPreview_Perf_Test"
                message="$(string.ZoomLevelPreviewPerf_Test.TaskMessage)"
                />
            <task
                name="FlashModeSwitch-Perf-Test"
                value="103"
                symbol="FlashModeSwitch_Perf_Test"
                message="$(string.FlashModeSwitchPerf_Test.TaskMessage)"
                />
            <task
                name="StillPin-Perf-Test"
                value="104"
                symbol="StillPin_Perf_Test"
                message="$(string.StillPinPerf_Test.TaskMessage)"
                />
            <task
                name="StreamingPin-Perf-Test"
                value="105"
                symbol="StreamingPin_Perf_Test"
                message="$(string.StreamingPinPerf_Test.TaskMessage)"
                />
            <task
                name="VideoPin-Perf-Test"
                value="106"
                symbol="VideoPin_Perf_Test"
                message="$(string.VideoPinPerf_Test.TaskMessage)"
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
              message="$(string.Begin_AFPerf_Test.EventMessage)"
              opcode="win:Start"
              symbol="Begin_AutoFocus_Perf_Test"
              task="AutoFocus-Perf-Test"
              template="String"
              value="200"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_AFPerf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_AutoFocus_Perf_Test"
              task="AutoFocus-Perf-Test"
              value="201"
              />
          <event
              keywords="Performance"
              level="win:Informational"
              message="$(string.Begin_PreviewPinPerf_Test.EventMessage)"
              opcode="win:Start"
              symbol="Begin_PreviewPinPerf_Test"
              task="PreviewPin-Perf-Test"
              template="String"
              value="202"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_PreviewPinPerf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_PreviewPinPerf_Test"
              task="PreviewPin-Perf-Test"
              value="203"
              />
          <event
              keywords="Performance"
              level="win:Informational"
              message="$(string.Begin_ZoomLevelPreviewPerf_Test.EventMessage)"
              opcode="win:Start"
              symbol="Begin_ZoomLevelPreviewPerf_Test"
              template="String"
              task="ZoomLevelPreview-Perf-Test"
              value="204"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_ZoomLevelPreviewPerf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_ZoomLevelPreviewPerf_Test"
              task="ZoomLevelPreview-Perf-Test"
              value="205"
              />
          <event
              keywords="Performance"
              level="win:Informational"
              message="$(string.Begin_FlashModeSwitchPerf_Test.EventMessage)"
              opcode="win:Start"
              symbol="Begin_FlashModeSwitchPerf_Test"
              task="FlashModeSwitch-Perf-Test"
              template="StringString"
              value="206"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_FlashModeSwitchPerf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_FlashModeSwitchPerf_Test"
              task="FlashModeSwitch-Perf-Test"
              value="207"
              />
          <event
              keywords="Performance"
              level="win:Informational"
              message="$(string.Begin_StillPinPerf_Test.EventMessage)"
              opcode="win:Start"
              symbol="Begin_StillPinPerf_Test"
              task="StillPin-Perf-Test"
              template="String"
              value="208"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_StillPinPerf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_StillPinPerf_Test"
              task="StillPin-Perf-Test"
              value="209"
              />
          <event
              keywords="Performance"
              level="win:Informational"
              message="$(string.Begin_StreamingPinPerf_Test.EventMessage)"
              opcode="win:Start"
              symbol="Begin_StreamingPinPerf_Test"
              task="StreamingPin-Perf-Test"
              template="String"
              value="210"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_StreamingPinPerf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_StreamingPinPerf_Test"
              task="StreamingPin-Perf-Test"
              value="211"
              />
          <event
              keywords="Performance"
              level="win:Informational"
              message="$(string.Begin_VideoPinPerf_Test.EventMessage)"
              opcode="win:Start"
              symbol="Begin_VideoPinPerf_Test"
              task="VideoPin-Perf-Test"
              template="String"
              value="212"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_VideoPinPerf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_VideoPinPerf_Test"
              task="VideoPin-Perf-Test"
              value="213"
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
            id="AFPerf_Test.TaskMessage"
            value="AutoFocus Latency Test Task"
            />
        <string
            id="PreviewPinPerf_Test.TaskMessage"
            value="Preview Pin Perf Task"
            />
        <string
            id="ZoomLevelPreviewPerf_Test.TaskMessage"
            value="Zoom Level Preview Perf Task"
            />
        <string
            id="FlashModeSwitchPerf_Test.TaskMessage"
            value="Flash Mode Switch Perf Task"
            />
        <string
            id="StillPinPerf_Test.TaskMessage"
            value="Still Pin Perf Task"
            />
        <string
            id="StreamingPinPerf_Test.TaskMessage"
            value="Streaming Pin Perf Task"
            />
        <string
            id="VideoPinPerf_Test.TaskMessage"
            value="Video Pin Perf Task"
            />
        <!-- Event Messages -->
        <string
            id="Begin_AFPerf_Test.EventMessage"
            value="Begin Auto Focus Latency Perf Marker"
            />
        <string
            id="End_AFPerf_Test.EventMessage"
            value="End Auto Focus Latency Perf Marker"
            />
        <string
            id="Begin_PreviewPinPerf_Test.EventMessage"
            value="Begin Preview Pin Perf Marker"
            />
        <string
            id="End_PreviewPinPerf_Test.EventMessage"
            value="End Preview Pin Perf Marker"
            />
        <string
            id="Begin_ZoomLevelPreviewPerf_Test.EventMessage"
            value="Begin Zoom Level Preview Perf Marker"
            />
        <string
            id="End_ZoomLevelPreviewPerf_Test.EventMessage"
            value="End Zoom Level Preview Perf Marker"
            />
        <string
            id="Begin_FlashModeSwitchPerf_Test.EventMessage"
            value="Begin Flash Mode Switch Perf Marker"
            />
        <string
            id="End_FlashModeSwitchPerf_Test.EventMessage"
            value="End Flash Mode Switch Perf Marker"
            />
        <string
            id="Begin_StillPinPerf_Test.EventMessage"
            value="Begin Still Pin Perf Marker"
            />
        <string
            id="End_StillPinPerf_Test.EventMessage"
            value="End Still Pin Perf Marker"
            />
        <string
            id="Begin_StreamingPinPerf_Test.EventMessage"
            value="Begin Streaming Pin Perf Marker"
            />
        <string
            id="End_StreamingPinPerf_Test.EventMessage"
            value="End Streaming Pin Perf Marker"
            />
        <string
            id="Begin_VideoPinPerf_Test.EventMessage"
            value="Begin Video Pin Perf Marker"
            />
        <string
            id="End_VideoPinPerf_Test.EventMessage"
            value="End Video Pin Perf Marker"
            />
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
