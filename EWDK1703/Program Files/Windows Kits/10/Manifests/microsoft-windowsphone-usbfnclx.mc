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

      <provider name="Microsoft-WindowsPhone-UsbFnClx"
          guid="{DD4AC270-4867-49A1-B6CC-FA2E39325865}"
          symbol="UsbFnClxGuid"
          messageFileName="UsbFnClx.sys"
          resourceFileName="UsbFnClx.sys"
          >

        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Power" message="$(string.Keyword.Power)" />
          <keyword mask="0x0000000000000008" name="BusEvents" message="$(string.Keyword.BusEvents)" />
          <keyword mask="0x0000000000000010" name="UsbState" message="$(string.Keyword.UsbState)" />
        </keywords>


        <tasks>
          <task value="1" name="IdleTime" />
          <task value="2" name="F0Active" />
          <task value="3" name="F0Idle" />
          <task value="4" name="BusEventRequestArrival" />
          <task value="5" name="BusEventAttach" />
          <task value="6" name="BusEventReset" />
          <task value="7" name="BusEventDetach" />
          <task value="8" name="BusEventSuspend" />
          <task value="9" name="BusEventResume" />
          <task value="10" name="BusEventSetupPacket" />
          <task value="11" name="BusEventConfigured" />
          <task value="12" name="BusEventUnConfigured" />
          <task value="13" name="BusEventPortType" />
          <task value="14" name="BusEventBusTearDown" />
          <task value="15" name="BusEventStandardSetupPacket" />
          <task value="16" name="UsbState" />
          <task value="17" name="LPMTime" />
          <task value="18" name="LPMErrors" />
          <task value="19" name="ClassActivated" />
        </tasks>


        <templates>
          <template tid="tSingleDword">
            <data name="RegisterValue" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tSingleByte">
            <data name="RegisterValue" inType="win:UInt8" outType="win:HexInt8" />
          </template>

          <template tid="tTwoDwords">
            <data name="ByteCount" inType="win:UInt32" outType="win:HexInt32" />
            <data name="EndpointNumber" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tTwoDwordsAndString">
            <data name="ByteCount" inType="win:UInt32" outType="win:HexInt32" />
            <data name="Endpoint" inType="win:UInt32" outType="win:HexInt32" />
            <data name="UnicodeString" inType="win:UnicodeString"/>
          </template>

          <template tid="tDwordAndString">
            <data name="ByteCount" inType="win:UInt32" outType="win:HexInt32" />
            <data name="CompletionReason" inType="win:UnicodeString"/>
          </template>

          <template tid="tString">
            <data name="UnicodeString" inType="win:UnicodeString"/>
          </template>

          <template tid="tSetupPacket">
            <data name="BmRequestType" inType="win:UInt8" outType="win:HexInt8" />
            <data name="bRequest" inType="win:UInt8" outType="win:HexInt8" />
            <data name="wValue" inType="win:UInt16" outType="win:HexInt16" />
            <data name="wIndex" inType="win:UInt16" outType="win:HexInt16" />
            <data name="wLength" inType="win:UInt16" outType="win:HexInt16" />
          </template>
        </templates>

        <events>

          <event value="100"
              symbol="D0Entry"
              task="IdleTime"
              opcode="win:Stop"
              keywords="Power"
              level="win:Error"
              message="$(string.Event.D0Entry)" />

          <event value="101"
              symbol="D0Exit"
              task="IdleTime"
              opcode="win:Start"
              keywords="Power"
              level="win:Error"
              message="$(string.Event.D0Exit)" />

          <event value="102"
              symbol="EnterLPM"
              task="LPMTime"
              opcode="win:Start"
              keywords="Power"
              level="win:Error"
              message="$(string.Event.EnterLPM)" />

          <event value="103"
              symbol="ExitLPM"
              task="LPMTime"
              opcode="win:Stop"
              keywords="Power"
              level="win:Error"
              message="$(string.Event.ExitLPM)" />

          <event value="104"
              symbol="LPMEntryFailed"
              task="LPMErrors"
              keywords="Error"
              level="win:Error"
              template="tSingleDword"
              message="$(string.Event.LPMEntryFailed)" />

          <event value="105"
              symbol="PStateTransitionFailed"
              task="LPMErrors"
              keywords="Error"
              level="win:Error"
              template="tSingleDword"
              message="$(string.Event.PStateTransitionFailed)" />

          <event value="106"
              symbol="LPMExitFailed"
              task="LPMErrors"
              keywords="Error"
              level="win:Error"
              template="tSingleDword"
              message="$(string.Event.LPMExitFailed)" />


          <event value="200"
              symbol="F0Active"
              task="F0Active"
              keywords="Power"
              level="win:Error"
              message="$(string.Event.F0Active)" />

          <event value="201"
              symbol="F0Idle"
              task="F0Idle"
              keywords="Power"
              level="win:Error"
              message="$(string.Event.F0Idle)" />

          <event value="300"
              symbol="BusEventRequestArrival"
              task="BusEventRequestArrival"
              keywords="BusEvents"
              template="tSingleDword"
              level="win:Informational"
              message="$(string.Event.BusEventRequestArrival)" />

          <event value="301"
              symbol="BusEventAttach"
              task="BusEventAttach"
              keywords="BusEvents"
              level="win:Informational"
              message="$(string.Event.BusEventAttach)" />

          <event value="302"
              symbol="BusEventReset"
              task="BusEventReset"
              keywords="BusEvents"
              level="win:Informational"
              template="tString"
              message="$(string.Event.BusEventReset)" />

          <event value="303"
              symbol="BusEventDetach"
              task="BusEventDetach"
              keywords="BusEvents"
              level="win:Informational"
              message="$(string.Event.BusEventDetach)" />

          <event value="304"
              symbol="BusEventSuspend"
              task="BusEventSuspend"
              keywords="BusEvents"
              level="win:Informational"
              message="$(string.Event.BusEventSuspend)" />

          <event value="305"
              symbol="BusEventResume"
              task="BusEventResume"
              keywords="BusEvents"
              level="win:Informational"
              message="$(string.Event.BusEventResume)" />

          <event value="306"
              symbol="BusEventSetupPacket"
              task="BusEventSetupPacket"
              keywords="BusEvents"
              template="tSetupPacket"
              level="win:Informational"
              message="$(string.Event.BusEventSetupPacket)" />

          <event value="307"
              symbol="BusEventConfigured"
              task="BusEventConfigured"
              template="tSingleDword"
              keywords="BusEvents"
              level="win:Informational"
              message="$(string.Event.BusEventConfigured)" />

          <event value="308"
              symbol="BusEventUnConfigured"
              task="BusEventUnConfigured"
              keywords="BusEvents"
              level="win:Informational"
              message="$(string.Event.BusEventUnConfigured)" />

          <event value="309"
              symbol="BusEventPortType"
              task="BusEventPortType"
              keywords="BusEvents"
              template="tSingleDword"
              level="win:Error"
              message="$(string.Event.BusEventPortType)" />

          <event value="310"
              symbol="BusEventBusTearDown"
              task="BusEventBusTearDown"
              keywords="BusEvents"
              level="win:Informational"
              message="$(string.Event.BusEventTearDown)" />

          <event value="311"
              symbol="BusEventStandardSetupPacket"
              task="BusEventStandardSetupPacket"
              keywords="BusEvents"
              template="tSetupPacket"
              level="win:Error"
              message="$(string.Event.BusEventStandardSetupPacket)" />

          <event value="312"
              symbol="UsbState"
              task="UsbState"
              keywords="UsbState"
              template="tString"
              level="win:Error"
              message="$(string.Event.UsbState)" />
              
          <event value="313"
              symbol="ClassActivated"
              task="ClassActivated"
              keywords="UsbState"
              template="tSingleDword"
              level="win:Error"
              message="$(string.Event.ClassActivated)" />

        </events>

      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="Keyword.Error"                      value="Error" />
        <string id="Keyword.Performance"                value="Performance" />
        <string id="Keyword.Power"                      value="Power" />
        <string id="Keyword.BusEvents"                  value="BusEvents" />
        <string id="Keyword.UsbState"                   value="UsbState" />

        <string id="Event.D0Entry"                      value="UsbFnClx D0Entry" />
        <string id="Event.D0Exit"                       value="UsbFnClx D0Exit" />
        <string id="Event.F0Active"                     value="UsbFnClx F0Active" />
        <string id="Event.F0Idle"                       value="UsbFnClx F0Idle" />
        <string id="Event.EnterLPM"                     value="UsbFnClx EnterLPM" />
        <string id="Event.ExitLPM"                      value="UsbFnClx ExitLPM" />
        <string id="Event.LPMEntryFailed"               value="UsbFnClx filter driver failed to enter LPM: %1" />
        <string id="Event.LPMExitFailed"                value="Chipidea filter driver failed to exit LPM: %1" />
        <string id="Event.PStateTransitionFailed"       value="Chipidea P-State transition failed: %1" />

        <string id="Event.BusEventRequestArrival"       value="UsbFnClx Bus event request arrival: %1" />
        <string id="Event.BusEventAttach"               value="UsbFn Attach" />
        <string id="Event.BusEventReset"                value="UsbFn Reset, bus speed = %1" />
        <string id="Event.BusEventDetach"               value="UsbFn Detach" />
        <string id="Event.BusEventSuspend"              value="UsbFn Suspend" />
        <string id="Event.BusEventResume"               value="UsbFn Resume" />
        <string id="Event.BusEventSetupPacket"          value="UsbFn Setup Packet: %1 %2 %3 %4 %5" />
        <string id="Event.BusEventConfigured"           value="UsbFn Configured: %1" />
        <string id="Event.BusEventUnConfigured"         value="UsbFn UnConfigured" />
        <string id="Event.BusEventPortType"             value="UsbFn Port type detected: %1" />
        <string id="Event.BusEventTearDown"             value="UsbFn Bus Teardown" />
        <string id="Event.UsbState"                     value="UsbFn State: %1" />
        <string id="Event.BusEventStandardSetupPacket"  value="UsbFn Standard Setup Packet: %1 %2 %3 %4 %5" />
        <string id="Event.ClassActivated"               value="Class Activated: %1" />

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
