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
      <provider name="Microsoft-WindowsPhone-TchHID"
          guid="{d205e05a-9904-4b1c-b068-b5d8725639a3}"
          message="$(string.EventProviderName)"
          messageFileName="TchHID.sys"
          resourceFileName="TchHID.sys"
          symbol="TchHIDControlGuid"
          >

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="TchHID" message="$(string.Keyword.TchHID)" />
        </keywords>

        <tasks>
          <task value="1" name="Read" />
          <task value="2" name="Write" />
          <task value="3" name="PerfMessage" />
          <task value="4" name="ClassDataRequest" />
          <task value="5" name="DeviceDataAvailable" />
          <task value="6" name="DeviceDataRequest" />
          <task value="7" name="ClassDataReady" />
        </tasks>

        <templates>
          <template tid="IRP">
            <data name="Irp" inType="win:Pointer" />
          </template>
          <template tid="monitorState">
            <data name="monitorstate" inType="win:UInt32"/>
          </template>
          <template tid="CompleteClassReadRequests">
              <data name="timestamp" inType="win:UInt32"/>
          </template>
        </templates>

        <events>
          <event value="1"
              keywords="TchHID"
              level="win:Informational"
              opcode="win:Info"
              symbol="EvtIoRead"
              task="ClassDataRequest" />

          <event value="2"
              keywords="TchHID"
              level="win:Informational"
              opcode="win:Info"
              symbol="CompletionRoutine"
              task="DeviceDataAvailable" />

          <event value="3"
              keywords="TchHID"
              level="win:Informational"
              opcode="win:Info"
              symbol="HIDReadRequest"
              task="DeviceDataRequest" />
              
           <event value="4"
              keywords="TchHID"
              level="win:Informational"
              opcode="win:Info"
              symbol="MonitorChange"
              task="PerfMessage" 
              template="monitorState"
              message="$(string.Event.PerfMessage)" />

          <event value="5"
              keywords="TchHID"
              level="win:Informational"
              opcode="win:Info"
              symbol="CompleteClassReadRequests"
              task="ClassDataReady"
              template="CompleteClassReadRequests"/>

        </events>

      </provider>
    </events>
  </instrumentation>
  
  
  <localization>
    <resources culture="en-US">
      <stringTable>
      
        <string id="Keyword.Error"                     value="Error" />
        <string id="Keyword.Performance"               value="Performance" />
        <string id="Keyword.TchHID"                    value="TchHID" />
        
        <string id="EventProviderName"                 value="Microsoft-WindowsPhone-TchHID" />
        <string id="Event.PerfMessage"                 value="%1" />

      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
