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

      <provider name="Microsoft-WindowsPhone-Comms-EntityExtraction"
          guid="{A98B17D3-2049-493D-B096-F2F4B60EE2BD}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMSENTITYEXTRACTION"
          messageFileName="CommsEntityExtraction.dll"
          resourceFileName="CommsEntityExtraction.dll">

        <!--No channel info necessary-->
        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
        </keywords>

        <tasks>
          <!-- Performance tasks -->
          <task name="COMMSENTITYEXTRACTION_LINKRESOLVER_RESOLVELINKS" value="100"/>
          <task name="COMMSENTITYEXTRACTION_LINKRESOLVER_FINDANDLINKENTITIES" value="101"/>
          <task name="COMMSENTITYEXTRACTION_LINKRESOLVER_FINDANDLINKUNFORMATTEDTELS" value="102"/>
          <task name="COMMSENTITYEXTRACTION_LINKRESOLVER_PROCESSFOUNDENTITIES" value="103"/>

          <task name="COMMSENTITYEXTRACTION_CONTACTRESOLVER_RESOLVEMECONTACTDETAILS" value="200"/>
          <task name="COMMSENTITYEXTRACTION_CONTACTRESOLVER_RESOLVECONTACTDETAILS" value="201"/>
          <task name="COMMSENTITYEXTRACTION_CONTACTRESOLVER_GETCONTACTFROMSTORE" value="202"/>
          <task name="COMMSENTITYEXTRACTION_CONTACTRESOLVER_FINDCONTACT" value="203"/>
        </tasks>

        <templates>

          <!-- Event Template defined for printf style debug tracing -->
          <template tid="tTraceMessage">
            <data name="Message" inType="win:Pointer"/>
          </template>

          <!-- Event Template defined for Comms Logging -->
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>
        </templates>

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
              level="win:Informational"
              template="CommsHrTemplate"
              symbol="CommsErrorPropagateEvent"
              message="$(string.Event.CommsPropagateErrorMessage)"/>

          <!-- Performance events -->
          <event value="100" symbol="COMMSENTITYEXTRACTION_LINKRESOLVER_RESOLVELINKS_START" task="COMMSENTITYEXTRACTION_LINKRESOLVER_RESOLVELINKS" level="win:Verbose" opcode="win:Start" keywords="Performance"/>
          <event value="101" symbol="COMMSENTITYEXTRACTION_LINKRESOLVER_RESOLVELINKS_STOP" task="COMMSENTITYEXTRACTION_LINKRESOLVER_RESOLVELINKS" level="win:Verbose" opcode="win:Stop" keywords="Performance"/>
          <event value="102" symbol="COMMSENTITYEXTRACTION_LINKRESOLVER_FINDANDLINKENTITIES_START" task="COMMSENTITYEXTRACTION_LINKRESOLVER_FINDANDLINKENTITIES" level="win:Verbose" opcode="win:Start" keywords="Performance"/>
          <event value="103" symbol="COMMSENTITYEXTRACTION_LINKRESOLVER_FINDANDLINKENTITIES_STOP" task="COMMSENTITYEXTRACTION_LINKRESOLVER_FINDANDLINKENTITIES" level="win:Verbose" opcode="win:Stop" keywords="Performance"/>
          <event value="104" symbol="COMMSENTITYEXTRACTION_LINKRESOLVER_FINDANDLINKUNFORMATTEDTELS_START" task="COMMSENTITYEXTRACTION_LINKRESOLVER_FINDANDLINKUNFORMATTEDTELS" level="win:Verbose" opcode="win:Start" keywords="Performance"/>
          <event value="105" symbol="COMMSENTITYEXTRACTION_LINKRESOLVER_FINDANDLINKUNFORMATTEDTELS_STOP" task="COMMSENTITYEXTRACTION_LINKRESOLVER_FINDANDLINKUNFORMATTEDTELS" level="win:Verbose" opcode="win:Stop" keywords="Performance"/>
          <event value="106" symbol="COMMSENTITYEXTRACTION_LINKRESOLVER_PROCESSFOUNDENTITIES_START" task="COMMSENTITYEXTRACTION_LINKRESOLVER_PROCESSFOUNDENTITIES" level="win:Verbose" opcode="win:Start" keywords="Performance"/>
          <event value="107" symbol="COMMSENTITYEXTRACTION_LINKRESOLVER_PROCESSFOUNDENTITIES_STOP" task="COMMSENTITYEXTRACTION_LINKRESOLVER_PROCESSFOUNDENTITIES" level="win:Verbose" opcode="win:Stop" keywords="Performance"/>

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

        <string id="Event.CommsErrorOriginateMessage"
            value="Error: %1 Location: %2 Line Number: %3"/>    
        <string id="Event.CommsPropagateErrorMessage"
            value="Error Propagated: %1 Location: %2 Line Number: %3"/>

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
