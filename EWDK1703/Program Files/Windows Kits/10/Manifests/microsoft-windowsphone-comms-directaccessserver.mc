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
      <provider name="Microsoft-WindowsPhone-Comms-DirectAccessServer"
          guid="{ac5df123-b13f-4d15-bb36-d8eb9cb9e90f}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_DIRECTACCESSSERVER"
          resourceFileName="CommsDirectAccessService.dll"
          messageFileName="CommsDirectAccessService.dll">

        <!--Event Templates -->
        <templates>

          <!--Event Template defined for Comms Logging -->
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

          <!-- Provider-specific templates -->
          <template tid="RCSeSetCapabilityTemplate">
            <data name="State" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="Count" inType="win:UInt32" outType="xs:unsignedInt"/>
          </template>

          <template tid="RCSeNonMobileMatchTemplate">
              <data name="Count" inType="win:UInt32" outType="xs:unsignedInt"/>
          </template>

          <template tid="APIAccessedTemplate">
              <data name="AppName" inType="win:AnsiString" />
              <data name="AccessedString" inType="win:AnsiString" />
          </template>

        </templates>

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error"/>
          <keyword mask="0x0000000000000002" name="Performance"/>

          <!-- Provider-specific keywords -->
          <keyword mask="0x0000000000000004" name="RCSe" message="$(string.Keyword.RCSe)" />
          <keyword mask="0x0000000000000100" name="debug" message="$(string.Keyword.Debug)" />
          <keyword mask="0x0000000000000200" name="APICall" message="$(string.Keyword.APICall)" />

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
              template="RCSeSetCapabilityTemplate"
              symbol="RCSE_SET_CAPABILITY"
              message="$(string.Publisher.RCSeSetCapability)"
              keywords="RCSe"/>

          <event value="101"
              level="win:Informational"
              template="RCSeNonMobileMatchTemplate"
              symbol="RCSE_SET_CAPABILITY_NONMOBILEMATCH"
              message="$(string.Publisher.RCSeSetCapabilityContactMatchNonMobile)"
              keywords="RCSe"/>

          <event value="102"
              level="win:Informational"
              symbol="RCSE_SET_CAPABILITY_NOCONTACTMATCH"
              message="$(string.Publisher.RCSeSetCapabilityNoContactMatch)"
              keywords="RCSe"/>

           <event value="103"
               level="win:Informational"
              template="APIAccessedTemplate"
              symbol="DIRECT_ACCESS_CONTACT_READ_WRITE"
              message="$(string.Publisher.ContactsReadWriteAccessed)"
              keywords="APICall" />

          <event value="104"
              level="win:Informational"
              template="APIAccessedTemplate"
              symbol="DIRECT_ACCESS_BULK_READ"
              message="$(string.Publisher.ContactsBulkRead)"
              keywords="APICall" />

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
        <string id="Keyword.APICall" value="API Call" />

        <string id="Publisher.RCSeSetCapability"
            value="Set RCSe capability to %1 for %2 numbers"/>
        <string id="Publisher.RCSeSetCapabilityContactMatchNonMobile"
            value="Ignoring set RCSe capability: match %1 contact(s) on non-mobile number"/>
        <string id="Publisher.RCSeSetCapabilityNoContactMatch"
            value="Ignoring set RCSe capability: no contact match"/>
        <string id="Publisher.ContactsReadWriteAccessed"
            value="App: %1, Action: %2"/>
        <string id="Publisher.ContactsBulkRead"
            value="App: %1, Action: %2"/>

      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>

