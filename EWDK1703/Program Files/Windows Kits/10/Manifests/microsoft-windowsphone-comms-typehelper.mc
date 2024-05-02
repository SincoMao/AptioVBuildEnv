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

      <provider name="Microsoft-WindowsPhone-Comms-TypeHelper"
          guid="{2a241950-8404-11e1-b0c4-0800200c9a66}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMSTypeHelper"
          messageFileName="CommsTypeHelperUtil.dll"
          resourceFileName="CommsTypeHelperUtil.dll">

          <!--No channel info necessary-->
        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000000000000100" name="debug" message="$(string.Keyword.Debug)" />
          <keyword mask="0x0000400000000000" name="Warning" message="$(string.Keyword.Warning)"/>
        </keywords>

        <templates>

          <!--Event Template defined for Comms Logging -->
          <template tid="CommsErrorTemplate">
            <data name="P1_HexInt32" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

          <template tid="tTraceMessage">
            <data inType="win:Pointer" name="Message" /> 
          </template>

        </templates>

        <tasks>
            <task message="$(string.Task.TraceMessage)" name="tracemessage" value="1" /> 
        </tasks>

        <events>

          <!-- CommsErrorOriginateEvent and CommsErrorPropagateEvent are the default handling of
          ifErrorReturn and ehm HR logging -->
          <event value="1"
              level="win:Error"
              template="CommsErrorTemplate"
              symbol="CommsErrorOriginateEvent"
              message="$(string.Event.CommsErrorMessage)"
              keywords="Error"/>

          <event value="2"
              level="win:Warning"
              template="CommsErrorTemplate"
              symbol="CommsErrorPropagateEvent"
              message="$(string.Event.CommsPropagateErrorMessage)"
              keywords="Warning"/>

          <event value="3" 
              level="win:Verbose"          
              symbol="_ETWMESSAGE" 
              keywords="debug" 
              task="tracemessage" 
              template="tTraceMessage" />

        </events>

      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="Keyword.Error"
            value="Error" />
        <string id="Keyword.Performance"
            value="Performance" />
        <string id="Keyword.Warning"
            value="Warning" />

        <string id="Event.CommsErrorMessage"
            value="HRESULT(%1)"/>
        <string id="Event.CommsPropagateErrorMessage"
            value="HRESULT Propagated(%1)"/>

        <string id="Keyword.Debug" value="Debug" /> 
        <string id="Task.TraceMessage" value="Trace" /> 

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>

