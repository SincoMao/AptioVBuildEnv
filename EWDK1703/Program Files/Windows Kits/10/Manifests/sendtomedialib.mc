<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>
    <events>

      <provider name="Microsoft-WindowsPhone-Shell-SendToMediaLib"
          guid="{6A9B7790-23E6-4603-AA46-1C5CB93D15A7}"
          symbol="MICROSOFT_WINDOWSPHONE_SHELL_SENDTOMEDIALIB"
          messageFileName="SendToMediaLib.exe"
          resourceFileName="SendToMediaLib.exe">

        <keywords>
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
          <!-- Keeping the same keyword value as ShellChrome for screen capture -->
          <keyword mask="0x0000000000000800" name="ScreenCapture" />
        </keywords>

        <tasks>
          <task name="ScreenCapture" value="1">
            <opcodes>
              <opcode name="Arguments" value="11" />
              <opcode name="SaveFile" value="12" />
            </opcodes>
          </task>          
        </tasks>

        <!-- Event Templates -->
        <templates>
          <template tid="HResult">
            <data inType="win:Int32" outType="win:HResult" name="ErrorResult"/>
          </template>
          <template tid="CmdArgs">
            <data inType="win:UnicodeString" name="ArgString"/>
          </template>

        </templates>

        <events>

          <event value="1"
              symbol="SendToMediaLib_Arguments"
              keywords="Debug ScreenCapture"
              level="win:Informational"
              task="ScreenCapture"
              opcode="Arguments"
              template="CmdArgs"
              message="$(string.SendToMediaLib.Arguments)"/>
          
          <event value="2"
              symbol="SendToMediaLib_Save_Start"
              keywords="Performance ScreenCapture"
              level="win:Informational"
              task="ScreenCapture"
              opcode="win:Start"
              message="$(string.SendToMediaLib.Save.Start)"/>

          <event value="3"
              symbol="SendToMediaLib_Save_Stop"
              keywords="Performance ScreenCapture"
              level="win:Informational"
              task="ScreenCapture"
              opcode="win:Stop"
              message="$(string.SendToMediaLib.Save.Stop)"/>

          <event value="4"
              symbol="SendToMediaLib_Save_Result"
              keywords="Debug ScreenCapture"
              level="win:Error"
              task="ScreenCapture"
              opcode="SaveFile"
              template="HResult"
              message="$(string.SendToMediaLib.Save.Result)"/>

        </events>

      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="SendToMediaLib.Arguments"       value="Send to media library: args = %1"/>
        <string id="SendToMediaLib.Save.Start"      value="Send to media library: start"/>
        <string id="SendToMediaLib.Save.Stop"       value="Send to media library: stop"/>
        <string id="SendToMediaLib.Save.Result"     value="Save to media library: result = %1"/>
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
