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

      <provider name="Microsoft-WindowsPhone-Comms-ContactsUtil"
          guid="{057B81C2-AE5C-4085-898E-350FD51FE1F1}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_CONTACTSUTIL"
          messageFileName="ContactsUtil.dll"
          resourceFileName="ContactsUtil.dll">
          
        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />

          <!-- Provider-specific keywords -->

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
          <task name="CONTACTSUTIL_PERF_GETLOCALE" value="1"/>
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

          <!-- Perf -->
          <event value="100"
              level="win:Informational"
              symbol="CONTACTSUTIL_PERF_GETLOCALE_START"
              task="CONTACTSUTIL_PERF_GETLOCALE"
              opcode="win:Start"
              keywords="Performance"/>

          <event value="101"
              level="win:Informational"
              symbol="CONTACTSUTIL_PERF_GETLOCALE_STOP"
              task="CONTACTSUTIL_PERF_GETLOCALE"
              opcode="win:Start"
              keywords="Performance"/>

        </events>

      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>

        <!-- strings for keywords -->
        <string id="Keyword.Error"                                  value="Error" />
        <string id="Keyword.Performance"                            value="Performance" />
        <string id="Keyword.Util"                                   value="Util" />
        
        <string id="Keyword.Warning"                                value="Warning" />

        <string id="Event.CommsErrorOriginateMessage"               value="Error: HRESULT: %1 Location: %2 Line Number: %3"/>    
        <string id="Event.CommsPropagateErrorMessage"               value="Error Propagated: HRESULT: %1 Location: %2 Line Number: %3"/>

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
