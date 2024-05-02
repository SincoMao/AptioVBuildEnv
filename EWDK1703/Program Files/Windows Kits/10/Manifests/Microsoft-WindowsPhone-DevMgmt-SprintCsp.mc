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
<!-- <?xml version="1.0" encoding="UTF-16"?> --><instrumentationManifest
    xmlns="http://schemas.microsoft.com/win/2004/08/events"
    xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    >
  <instrumentation>
    <events>
      <!--Publisher Info -->
      <provider
          guid="{16D29899-A697-43A5-9043-460DDB4F133A}"
          messageFileName="SprintCSP.dll"
          name="Microsoft-WindowsPhone-DevMgmt-SprintCSP"
          resourceFileName="SprintCSP.dll"
          symbol="MICROSOFT_WINDOWSPHONE_DEVMGMT_SPRINTCSP"
          >
        <!--No channel info necessary-->
        <channels/>
        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword
              mask="0x00000001"
              name="Error"
              />
          <keyword
              mask="0x00000002"
              name="Performance"
              />
          <!-- Provider-specific keywords -->
          <keyword
              mask="0x00000004"
              name="Debug"
              />
        </keywords>
        <tasks>
          <task
              name="CSPSession"
              symbol="CSP_SESSION"
              value="1"
              />
        </tasks>
        <!--Event Templates -->
        <templates>
          <template tid="HrTemplate">
            <data
                inType="win:Int32"
                name="P1_HResult"
                outType="win:HResult"
                />
            <data
                inType="win:AnsiString"
                name="P2_String"
                />
            <data
                inType="win:UInt32"
                name="P3_UInt32"
                />
          </template>
          <template tid="HrDwTemplate">
            <data
                inType="win:Int32"
                name="P1_HResult"
                outType="win:HResult"
                />
            <data
                inType="win:UInt32"
                name="P2_UInt32"
                />
          </template>
        </templates>
        <!--All the Events that can be published by this Publisher -->
        <events>
          <event
              keywords="Error"
              level="win:Error"
              message="$(string.Event.ErrorOriginateMessage)"
              symbol="ErrorOriginateEvent"
              template="HrTemplate"
              value="1"
              />
          <event
              keywords="Debug"
              level="win:Informational"
              message="$(string.Event.DoPublishWNFOMADMSettingChangedMessage)"
              symbol="DoPublishWNFOMADMSettingChangedEvent"
              value="2"
              />
          <event
              keywords="Debug"
              level="win:Informational"
              message="$(string.Event.SIMNODELOCKEventMessage)"
              symbol="SIMNODELOCKEvent"
              template="HrDwTemplate"
              value="3"
              />
          <!-- Performance marker events -->
          <event
              keywords="Performance"
              level="win:Verbose"
              opcode="win:Start"
              symbol="PERF_CSPSESSION_BEGIN"
              task="CSPSession"
              value="1002"
              />
          <event
              keywords="Performance"
              level="win:Verbose"
              opcode="win:Stop"
              symbol="PERF_CSPSESSION_END"
              task="CSPSession"
              value="1003"
              />
        </events>
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string
            id="Event.ErrorOriginateMessage"
            value="Error: %1 Location: %2 Line Number: %3"
            />
        <string
            id="Event.DoPublishWNFOMADMSettingChangedMessage"
            value="Published WNF for OMADM Setting Changed"
            />
        <string
            id="Event.SIMNODELOCKEventMessage"
            value="SIM NODE LOCK: hr %1 state %2"
            />
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
