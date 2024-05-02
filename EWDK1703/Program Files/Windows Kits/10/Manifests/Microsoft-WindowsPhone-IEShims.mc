<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<!--
Use of this source code is subject to the terms of the Microsoft
premium shared source license agreement under which you licensed
this source code. If you did not accept the terms of the license
agreement, you are not authorized to use this source code.
For the terms of the license, please see the license agreement
signed by you and Microsoft.
THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
-->
<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <instrumentation>
    <events>
      <provider
        name="Microsoft-WindowsPhone-IEShims-Events-Provider"
        guid="{E99E99CE-B719-4533-8C59-F5BE7DA1C5F4}"
        symbol="BERP_IEShims"
        messageFileName="ie_shims.dll"
        resourceFileName="ie_shims.dll">
        <keywords>
          <keyword mask="0x0000000000000001" name="PERFORMANCE"/>
        </keywords>
        <templates>
          <template tid="GenericUInt32">
            <data inType="win:UInt32" name="UnsignedInteger"/>
          </template>
          <template tid="FrameInfo">
              <data inType="win:UInt32" name="FrameId"/>
              <data inType="win:UInt32" name="ContactCount"/>
          </template>
          <template tid="SessionSummary">
              <data inType="win:UInt32" name="TotalFrames"/>
              <data inType="win:UInt32" name="FramesDropped"/>
              <data inType="win:UInt32" name="ThrottleDelay"/>
          </template>
          <template tid="ThrottleDelay">
              <data inType="win:UInt32" name="PreviousThrottle"/>
              <data inType="win:UInt32" name="NewThrottle"/>
          </template>
        </templates>
        <tasks>
          <!-- Message pump -->
          <task name="PERFORMANCE_PROCESS_POINTER_MOVE"            symbol="PERFORMANCE_PROCESS_POINTER_MOVE_TASK"                        value="1000"/>

          <!-- Pointer adapter -->
          <task name="INPUT_SESSION_BEGIN"                         symbol="INPUT_SESSION_BEGIN_TASK"                                     value="1100"/>
          <task name="INPUT_SESSION_END"                           symbol="INPUT_SESSION_END_TASK"                                       value="1101"/>
          <task name="INPUT_SESSION_MOVE"                          symbol="INPUT_SESSION_MOVE_TASK"                                      value="1102"/>

          <!-- Touch framelist -->
          <task name="INPUT_SESSION_SUMMARY"                       symbol="INPUT_SESSION_SUMMARY_TASK"                                   value="1200"/>
          <task name="INPUT_SESSION_THROTTLE_CHANGE"               symbol="INPUT_SESSION_THROTTLE_CHANGE_TASK"                           value="1201"/>
        </tasks>
        <events>
          <!-- Message pump -->
          <event value="1000" symbol="PERFORMANCE_PROCESS_POINTER_MOVE_START" task="PERFORMANCE_PROCESS_POINTER_MOVE" opcode="win:Start" keywords="PERFORMANCE" level="win:Informational" template="GenericUInt32"/>
          <event value="1001" symbol="PERFORMANCE_PROCESS_POINTER_MOVE_STOP" task="PERFORMANCE_PROCESS_POINTER_MOVE" opcode="win:Stop" keywords="PERFORMANCE" level="win:Informational" template="GenericUInt32"/>

          <!-- Pointer adapter -->
          <event value="1100" symbol="INPUT_SESSION_BEGIN" task="INPUT_SESSION_BEGIN" opcode="win:Info" keywords="PERFORMANCE" level="win:Informational" template="GenericUInt32"/>
          <event value="1101" symbol="INPUT_SESSION_END" task="INPUT_SESSION_END" opcode="win:Info" keywords="PERFORMANCE" level="win:Informational" template="GenericUInt32"/>
          <event value="1102" symbol="INPUT_SESSION_MOVE" task="INPUT_SESSION_MOVE" opcode="win:Info" keywords="PERFORMANCE" level="win:Informational" template="GenericUInt32"/>

          <!-- Touch framelist -->
            <event value="1200" symbol="INPUT_SESSION_SUMMARY" task="INPUT_SESSION_SUMMARY" opcode="win:Info" keywords="PERFORMANCE" level="win:Informational" template="SessionSummary"/>
            <event value="1201" symbol="INPUT_SESSION_THROTTLE_CHANGE" task="INPUT_SESSION_THROTTLE_CHANGE" opcode="win:Info" keywords="PERFORMANCE" level="win:Informational" template="ThrottleDelay"/>
        </events>
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="opcode.Start" value="Start">
        </string>
          <string id="opcode.Stop" value="Stop">
          </string>
          <string id="opcode.Info" value="Info">
        </string>
        <string id="level.Warning" value="Warning">
        </string>
        <string id="level.Verbose" value="Verbose">
        </string>
        <string id="level.Error" value="Error">
        </string>
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
