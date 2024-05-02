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
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:Comms="http://www.w3.org/2001/XMLSchema">
  <instrumentation>

    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-Comms-DirectAccessClient"
          guid="{7b404aa4-50eb-4446-ab8f-22ccf285c12a}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_DIRECTACCESSCLIENT"
          resourceFileName="CommsDirectAccessClient.dll"
          messageFileName="CommsDirectAccessClient.dll">

        <!--Event Templates -->
        <templates>

          <!--Event Template defined for Comms Logging -->
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

          <!-- Provider-specific templates -->
          <template tid="RCSeRequestCapabilityTemplate">
            <data name="Count" inType="win:UInt32" outType="xs:unsignedInt"/>
          </template>

        </templates>

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error"/>
          <keyword mask="0x0000000000000002" name="Performance"/>

          <!-- Provider-specific keywords -->
          <keyword mask="0x0000000000000004" name="RCSe" message="$(string.Keyword.RCSe)" />
          <keyword mask="0x0000000000000100" name="debug" message="$(string.Keyword.Debug)" />

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning"/>
        </keywords>

        <tasks>
            <task message="$(string.Task.TraceMessage)" name="tracemessage" value="10" /> 
        </tasks>

        <events>
          <event value="1"
              level="win:Error"
              template="CommsHrTemplate"
              symbol="CommsErrorOriginateEvent"
              message="$(string.Event.CommsErrorOriginateMessage)"
              keywords="Error"/>

          <event value="2"
              level="win:Warning"
              template="CommsHrTemplate"
              symbol="CommsErrorPropagateEvent"
              message="$(string.Event.CommsPropagateErrorMessage)"
              keywords="Warning"/>

          <!--Events published by RCSe capability detection -->
          <event value="100"
              level="win:Informational"
              template="RCSeRequestCapabilityTemplate"
              symbol="RCSE_REQUEST_CAPABILITY"
              message="$(string.Publisher.RCSeRequestCapability)"
              keywords="RCSe"/>

       </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Event.CommsErrorOriginateMessage"
            value="Error: %1 Location: %2 Line Number: %3"/>    
        <string id="Event.CommsPropagateErrorMessage"
            value="Error Propagated: %1 Location: %2 Line Number: %3"/>

        <string id="Keyword.Debug" value="Debug" /> 
        <string id="Keyword.RCSe" value="RCSe capability detection" />
        <string id="Task.TraceMessage" value="Trace" /> 

        <string id="Publisher.RCSeRequestCapability"
            value="Sending %1 numbers to Capability Detection Service"/>

     </stringTable>
    </resources>
  </localization>
</instrumentationManifest>

