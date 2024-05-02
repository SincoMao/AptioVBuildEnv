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

      <provider name="Microsoft-WindowsPhone-Comms-RecoverEdb"
          guid="{2E65F68E-5BFF-4E7B-8A78-A4AAD36CB91B}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMSRecoverEdb"
          messageFileName="commscsp.dll"
          resourceFileName="commscsp.dll">

          <!--No channel info necessary-->
        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />

          <!-- Provider-specific keywords -->
          <keyword mask="0x0000000000000008" name="debug" message="$(string.Keyword.Debug)" />

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning" message="$(string.Keyword.Warning)"/>
        </keywords>

        <tasks>
          <task value="1" name="Task1" />
          <task value="2" name="Task2" />
          <task value="3" message="$(string.Task.TraceMessage)" name="tracemessage" />
        </tasks>

        <templates>

          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_AnsiString" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

          <!--Event Template defined for Comms Logging -->
          <template tid="CommsErrorTemplate">
            <data name="P1_HexInt32" inType="win:HexInt32"/>
          </template>
          
          <template tid="tTraceMessage">
            <data inType="win:Pointer" name="Message" />
          </template>

        </templates>

        <events>

          <!-- CommsErrorEvent and CommsErrorPropagateEvent are the default handling of 
          ifErrorReturn and ehm HR logging -->
          <event value="1"
              level="win:Error"
              template="CommsHrTemplate"
              symbol="CommsErrorEvent"
              message="$(string.Event.CommsErrorMessage)"
              keywords="Error"/>

          <event value="2"
              level="win:Warning"
              template="CommsHrTemplate"
              symbol="CommsErrorPropagateEvent"
              message="$(string.Event.CommsPropagateErrorMessage)"
              keywords="Warning"/>

          <event value="3"
              level="win:Error"
              template="CommsHrTemplate"
              symbol="CommsErrorOriginateEvent"
              message="$(string.Event.CommsErrorMessage)"
              keywords="Error"/>
              
          <event value="4"
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

        <string id="Keyword.Debug" value="Debug" /> 
        <string id="Task.TraceMessage" value="Trace" /> 
        <string id="Event.CommsErrorMessage"
            value="HRESULT(%1) Location: %2 Line Number: %3"/>
        <string id="Event.CommsPropagateErrorMessage"
            value="HRESULT Propagated(%1) Location: %2 Line Number: %3"/>
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
