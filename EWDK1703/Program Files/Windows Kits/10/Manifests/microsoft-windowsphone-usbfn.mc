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

      <provider name="Microsoft-WindowsPhone-UsbFn"
          guid="{3E542731-DBCF-47B3-AED9-C2BEE11A5497}"
          symbol="ChipIdeaGuid"
          messageFileName="UsbFnChipIdea.sys"
          resourceFileName="UsbFnChipIdea.sys"
          >

        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Transfers" message="$(string.Keyword.Transfers)" />
          <keyword mask="0x0000000000000008" name="DPC" message="$(string.Keyword.DPC)" />
          <keyword mask="0x0000000000000010" name="Power" message="$(string.Keyword.Power)" />
          <keyword mask="0x0000000000000020" name="Charging" message="$(string.Keyword.Charging)" />
          <keyword mask="0x0000000000000040" name="EpWatchdog" message="$(string.Keyword.EpWatchdog)" />
        </keywords>


        <tasks>
          <task value="1" name="Transfer" />
          <task value="2" name="Transaction" />
          <task value="3" name="DpcNoneEvent" />
          <task value="4" name="DpcSetupEvent" />
          <task value="5" name="DpcAttachEvent" />
          <task value="6" name="DpcDetachEvent" />
          <task value="7" name="DpcSuspendEvent" />
          <task value="8" name="DpcResumeEvent" />
          <task value="9" name="DpcResetEvent" />
          <task value="10" name="DpcMultipleEvent" />
          <task value="11" name="NotifyCharger" />
          <task value="12" name="PortDetection" />
          <task value="13" name="PortDetectionString" />
          <task value="14" name="Register" />
          <task value="15" name="DetectionPhase" />
          <task value="16" name="EpWatchdogTimerStart" />
          <task value="17" name="EpWatchdogTimerStop" />
          <task value="18" name="EpWatchdogWorkItemBegin" />
          <task value="19" name="EpWatchdogWorkItemEnd" />
          <task value="20" name="EpWatchdogWorkItemRegs" />
        </tasks>


        <templates>
          <template tid="tSingleDword">
            <data name="RegisterValue" inType="win:UInt32" outType="win:HexInt32" />
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

          <template tid="tWatchdogRegs">
            <data name="Endpoint" inType="win:UInt32" outType="win:HexInt32" />
            <data name="ENDPTCOMPLETE" inType="win:UInt32" outType="win:HexInt32" />
            <data name="ENDPTPRIME" inType="win:UInt32" outType="win:HexInt32" />
            <data name="ENDPTSTATUS" inType="win:UInt32" outType="win:HexInt32" />
          </template>
		  
          <template tid="tQwordAndDword">
            <data name="ByteCount" inType="win:UInt64" outType="win:HexInt64" />
            <data name="EndpointNumber" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tDwordQwordAndString">
            <data name="ByteCount" inType="win:UInt64" outType="win:HexInt64" />
            <data name="Endpoint" inType="win:UInt32" outType="win:HexInt32" />
            <data name="UnicodeString" inType="win:UnicodeString"/>
          </template>

		  
        </templates>

        <events>

          <event value="100"
              symbol="TransactionBeginEvent"
              task="Transaction"
              opcode="win:Start"
              keywords="Transfers"
              template="tQwordAndDword"
              level="win:Informational"
              message="$(string.Event.TransactionBegin)" />

          <event value="101"
              symbol="TransactionEndEvent"
              task="Transaction"
              opcode="win:Stop"
              keywords="Transfers"
              template="tDwordQwordAndString"
              level="win:Informational"
              message="$(string.Event.TransactionEnd)" />

          <event value="200"
              symbol="TransferBeginEvent"
              task="Transfer"
              opcode="win:Start"
              keywords="Transfers"
              template="tTwoDwords"
              level="win:Informational"
              message="$(string.Event.TransferBegin)" />

          <event value="201"
              symbol="TransferEndEvent"
              task="Transfer"
              opcode="win:Stop"
              keywords="Transfers"
              level="win:Informational"
              template="tQwordAndDword"
              message="$(string.Event.TransferEnd)" />

          <event value="300"
              symbol="DpcNoneEvent"
              task="DpcNoneEvent"
              keywords="DPC"
              level="win:Informational"
              message="$(string.Event.DpcNone)" />

          <event value="301"
              symbol="DpcSetupEvent"
              task="DpcSetupEvent"
              keywords="DPC"
              level="win:Informational"
              message="$(string.Event.DpcSetup)" />

          <event value="303"
              symbol="DpcAttachEvent"
              task="DpcAttachEvent"
              keywords="DPC"
              level="win:Error"
              message="$(string.Event.DpcAttach)" />

          <event value="304"
              symbol="DpcDetachEvent"
              task="DpcDetachEvent"
              keywords="DPC"
              level="win:Error"
              message="$(string.Event.DpcDetach)" />

          <event value="305"
              symbol="DpcSuspendEvent"
              task="DpcSuspendEvent"
              keywords="DPC"
              level="win:Error"
              message="$(string.Event.DpcSuspend)" />

          <event value="306"
              symbol="DpcResumeEvent"
              task="DpcResumeEvent"
              keywords="DPC"
              level="win:Error"
              message="$(string.Event.DpcResume)" />

          <event value="307"
              symbol="DpcResetEvent"
              task="DpcResetEvent"
              keywords="DPC"
              level="win:Error"
              message="$(string.Event.DpcReset)" />

          <event value="308"
              symbol="DpcMultipleEvent"
              task="DpcMultipleEvent"
              keywords="DPC"
              level="win:Informational"
              message="$(string.Event.DpcMultiple)" />

         <event value="309"
              symbol="NotifyCharger"
              task="NotifyCharger"
              keywords="Charging"
              level="win:Error"
              template="tDwordAndString"
              message="$(string.Event.NotifyCharger)" />

         <event value="310"
              symbol="PortDetection"
              task="PortDetection"
              keywords="Charging"
              level="win:Error"
              template="tTwoDwords"
              message="$(string.Event.PortDetection)" />

         <event value="311"
              symbol="PortDetectionString"
              task="PortDetectionString"
              keywords="Charging"
              level="win:Error"
              template="tDwordAndString"
              message="$(string.Event.PortDetectionString)" />
              
         <event value="312"
              symbol="Register"
              task="Register"
              keywords="Charging"
              level="win:Error"
              template="tDwordAndString"
              message="$(string.Event.Register)" />

         <event value="313"
              symbol="DetectionPhase"
              task="DetectionPhase"
              keywords="Charging"
              level="win:Error"
              template="tSingleDword"
              message="$(string.Event.DetectionPhase)" />

         <event value="400"
              symbol="EpWatchdogTimerStart"
              task="EpWatchdogTimerStart"
              keywords="EpWatchdog"
              level="win:Informational"
              template="tDwordAndString"
              message="$(string.Event.EpWatchdogTimerStart)" />

         <event value="401"
              symbol="EpWatchdogTimerStop"
              task="EpWatchdogTimerStop"
              keywords="EpWatchdog"
              level="win:Informational"
              template="tDwordAndString"
              message="$(string.Event.EpWatchdogTimerStop)" />

         <event value="402"
              symbol="EpWatchdogWorkItemBegin"
              task="EpWatchdogWorkItemBegin"
              opcode="win:Start"
              keywords="EpWatchdog"
              level="win:Informational"
              template="tSingleDword"
              message="$(string.Event.EpWatchdogWorkItemBegin)" />

         <event value="403"
              symbol="EpWatchdogWorkItemEnd"
              task="EpWatchdogWorkItemEnd"
              opcode="win:Stop"
              keywords="EpWatchdog"
              template="tSingleDword"
              level="win:Informational"
              message="$(string.Event.EpWatchdogWorkItemEnd)" />

         <event value="404"
              symbol="EpWatchdogWorkItemRegs"
              task="EpWatchdogWorkItemRegs"
              keywords="EpWatchdog"
              template="tWatchdogRegs"
              level="win:Verbose"
              message="$(string.Event.EpWatchdogWorkItemRegs)" />
          
        </events>

      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="Keyword.Error"                   value="Error" />
        <string id="Keyword.Performance"             value="Performance" />
        <string id="Keyword.Transfers"               value="Transfers" />
        <string id="Keyword.DPC"                     value="DPC" />
        <string id="Keyword.Power"                   value="Power" />
        <string id="Keyword.Charging"                value="Charging" />
        <string id="Keyword.EpWatchdog"              value="EpWatchdog" />

        <string id="Event.TransactionBegin"          value="Begin Transfer expecting %1 bytes on EP %2" />
        <string id="Event.TransactionEnd"            value="End Transfer of %1 bytes on EP %2 (%3)" />
        <string id="Event.TransferBegin"             value="Begin transaction expectiong %1 bytes on EP %2" />
        <string id="Event.TransferEnd"               value="End transaction of %1 bytes on EP %2" />

        <string id="Event.DpcNone"                   value="DPC: No interrupts" />
        <string id="Event.DpcSetup"                  value="DPC: Setup packet" />
        <string id="Event.DpcAttach"                 value="DPC: Attach" />
        <string id="Event.DpcDetach"                 value="DPC: Detach" />
        <string id="Event.DpcSuspend"                value="DPC: Suspend" />
        <string id="Event.DpcResume"                 value="DPC: Resume" />
        <string id="Event.DpcReset"                  value="DPC: Reset" />
        <string id="Event.DpcMultiple"               value="DPC: Multiple events handled in DPC" />
        <string id="Event.NotifyCharger"             value="NotifyCharger: Event: %2 State: %1" />
        <string id="Event.PortDetection"             value="ChargerPortDetection: Stage: %1 Status: %2" />
        <string id="Event.PortDetectionString"       value="ChargerPortDetection: Stage: %1 Status: %2" />
        <string id="Event.Register"                  value="Register: Name: %2 Value: %1" />
        <string id="Event.DetectionPhase"            value="DetectionPhase: Phase: %1" />

        <string id="Event.EpWatchdogTimerStart"      value="Starting EP %1 timer: %2" />
        <string id="Event.EpWatchdogTimerStop"       value="Stopping EP %1 timer: %2" />
        <string id="Event.EpWatchdogWorkItemBegin"   value="EP %1 Watchdog work item start" />
        <string id="Event.EpWatchdogWorkItemEnd"     value="EP %1 Watchdog work item end" />
        <string id="Event.EpWatchdogWorkItemRegs"    value="EP %1: ENDPTCOMPLETE: %2, ENDPTPRIME: %3, ENDPTSTATUS: %4" />

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
