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
      <provider name="Microsoft-WindowsPhone-Comms-Logging"
          guid="{db923f05-afb5-43d7-aab9-1e85bdad101d}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_LOGGING"
          resourceFileName="cemapi.dll"
          messageFileName="cemapi.dll">

        <templates>
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>
        </templates>

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error"/>
          <keyword mask="0x0000000000000002" name="Performance"/>

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning"/>
        </keywords>

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
        <string id="Publisher.Models.CEMAPI_MAPICTX_Delete"
             value="MAPI Context is being deleted"/>
        <string id="Publisher.Models.CEMAPI_Event_Lost"
             value="MAPI Event is lost"/>
        <string id="Publisher.Models.CEMAPI_Event_DataError"
             value="MAPI Event data error"/>
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>

