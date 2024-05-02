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

      <provider name="Microsoft-WindowsPhone-Comms-ImportXmlContacts"
          guid="{4E733439-0480-4cf6-8D7F-9CDA5B9A0290}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_IMPORT_XML_CONTACTS"
          messageFileName="ImportXmlContacts.exe"
          resourceFileName="ImportXmlContacts.exe">
          
        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />

          <!-- Provider-specific keywords -->
          <keyword mask="0x0000000000000010" name="Util" message="$(string.Keyword.Util)" />

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning" message="$(string.Keyword.Warning)"/>
        </keywords>

        <templates>

          <!--Event Template defined for Comms Logging -->
          <template tid="CommsHrTemplate">
            <data name="P1_HexInt32" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

        </templates>

        <tasks>
        </tasks>

        <events>

          <!-- CommsErrorEvent and CommsErrorPropagateEvent are the default handling of 
          ifErrorReturn and ehm HR logging -->
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

        <!-- strings for keywords -->
        <string id="Keyword.Error"                              value="Error" />
        <string id="Keyword.Performance"                        value="Performance" />
        <string id="Keyword.Util"                               value="Util" />
        <string id="Keyword.Warning"                            value="Warning" />

        <string id="Event.CommsErrorOriginateMessage"           value="Error: HRESULT: %1 Location: %2 Line Number: %3"/>    
        <string id="Event.CommsPropagateErrorMessage"           value="Error Propagated: HRESULT: %1 Location: %2 Line Number: %3"/>

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
