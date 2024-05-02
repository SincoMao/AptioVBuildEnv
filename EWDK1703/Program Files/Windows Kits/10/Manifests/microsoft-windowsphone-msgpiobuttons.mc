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
      <provider name="Microsoft-WindowsPhone-MSGPIOButtons"
          guid="{64ab66b7-82d7-433b-98e9-45d642f7eee4}"
          symbol="MICROSOFT_WINDOWSPHONE_MSGPIOBUTTONS"
          messageFileName="MSGPIOWinPhone.sys"
          resourceFileName="MSGPIOWinPhone.sys">

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Warning" message="$(string.Keyword.Warning)" />
          <keyword mask="0x0000000000000008" name="Information" message="$(string.Keyword.Information)" />
        </keywords>


        <tasks>
          <task value="1" name="Error" />
          <task value="2" name="Warning" />
          <task value="3" name="ButtonInterrupt" />
          <task value="4" name="ButtonInjection" />
          <task value="5" name="ReadRequestHandling" />
        </tasks>


        <templates>

          <template tid="tNTStatusFailure">
            <data name="szFileName" inType="win:UnicodeString" />
            <data name="lineNumber" inType="win:Int32" />
            <data name="ntStatus"   inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tWarningMessage">
            <data name="szWarning" inType="win:UnicodeString" />
          </template>

          <template tid="tButtonReadCompleted">
            <data name="buttonBitField"   inType="win:UInt16" outType="win:HexInt16" />
          </template>

          <template tid="tDword">
            <data name="DwordValue"   inType="win:UInt32" outType="win:HexInt32" />
          </template>
        </templates>


        <events>

          <!-- A failing NTSTATUS value was detected -->
          <event value="1"
              symbol="NTSTATUSError"
              task="Error"
              keywords="Error"
              level="win:Error"
              template="tNTStatusFailure"
              message="$(string.Event.Error)" />

          <!-- A Warning message -->
          <event value="2"
              symbol="Warning"
              task="Warning"
              keywords="Warning"
              level="win:Informational"
              template="tWarningMessage"
              message="$(string.Event.Warning)" />

          <!-- Perf events -->
          <event value="100"
              symbol="ButtonPassiveISR"
              task="ButtonInterrupt"
              keywords="Performance"
              level="win:Informational" />

          <event value="101"
              symbol="ButtonInterruptWorkItem"
              task="ButtonInterrupt"
              keywords="Performance"
              level="win:Informational" />

          <event value="110"
              symbol="ButtonDriverWrite"
              task="ButtonInjection"
              keywords="Performance"
              level="win:Informational" />

          <event value="111"
              symbol="ButtonDriverAPIInject"
              task="ButtonInjection"
              keywords="Performance"
              level="win:Informational" />


          <event value="120"
              symbol="ButtonReadCompleted"
              task="ReadRequestHandling"
              keywords="Performance"
              level="win:Informational"
              template="tButtonReadCompleted"
              message="$(string.Event.ReadComplete)" />


          <event value="200"
              symbol="EnqueuingKernelDumpWorkItem"
              task="ReadRequestHandling"
              keywords="Information"
              level="win:Informational"
              message="$(string.Event.EnqueuingKernelDumpWorkItem)" />


          <event value="201"
              symbol="CurrentKernelDumpMode"
              task="ReadRequestHandling"
              keywords="Information"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.CurrentKernelDumpMode)" />


          <event value="202"
              symbol="CaptureLiveKernelDumpFailed"
              task="ReadRequestHandling"
              keywords="Error"
              level="win:Error"
              template="tDword"
              message="$(string.Event.CaptureLiveKernelDumpFailed)" />
        </events>

      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="Keyword.Error"          value="Error" />
        <string id="Keyword.Performance"    value="Performance" />
        <string id="Keyword.Warning"        value="Warning" />
        <string id="Keyword.Information"    value="Information" />

        <string id="Event.Error"                        value="NTSTATUS Failure: file='%1' line=(%2) NTSTATUS=%3" />
        <string id="Event.Warning"                      value="Warning: '%1'" />
        <string id="Event.ReadComplete"                 value="MSGPIOWinPhone Driver: ReadButtonPress Completed:  Reporting button state bit-field: (%1)" />
        <string id="Event.EnqueuingKernelDumpWorkItem"  value="MSGPIOWinPhone Driver: MSGPIOWinPhone Driver: Now enqueuing the work item for kernel dump collection" />
        <string id="Event.CurrentKernelDumpMode"        value="MSGPIOWinPhone Driver: Current Kernel Dump Mode: (%1)" />
        <string id="Event.CaptureLiveKernelDumpFailed"  value="MSGPIOWinPhone Driver: CaptureLiveKernelDump failed: (%1)" />
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
