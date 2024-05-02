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
      <provider name="Microsoft-WindowsPhone-Vibration"
          guid="{C3A511B4-2248-4831-8098-A39AF07A557E}"
          symbol="MICROSOFT_WINDOWSPHONE_VIBRATION"
          messageFileName="ETWVibrationResources.dll"
          resourceFileName="ETWVibrationResources.dll">
        <channels />
        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Duration" message="$(string.Keyword.Duration)" />
        </keywords>
        <tasks>
          <task value="1" name="Vibrate" />
        </tasks>
        <templates>
          <template tid="tDword">
            <data name="EventTime" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="tErrorCode">
            <data name="EventTime" inType="win:UInt32" outType="win:HexInt32" />
          </template>
        </templates>
        <events>
          <event value="100"
              symbol="VibrationStart"
              task="Vibrate"
              keywords="Duration"
              level="win:Informational"
              opcode="win:Start"
              template="tDword"
              message="$(string.Event.VibrationStart)" />
          <event value="101"
              symbol="VibrationStop"
              task="Vibrate"
              keywords="Duration"
              level="win:Informational"
              opcode="win:Stop"
              template="tDword"
              message="$(string.Event.VibrationStop)" />
          <event value="110"
              symbol="VibrationWaitDuration"
              task="Vibrate"
              keywords="Duration"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.VibrationWaitDuration)" />
          <event value="112"
              symbol="VibrationDriverError"
              task="Vibrate"
              keywords="Error"
              level="win:Informational"
              template="tErrorCode"
              message="$(string.Event.VibrationDriverError)" />
        </events>
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Keyword.Error"              value="Error" />
        <string id="Keyword.Performance"        value="Performance" />
        <string id="Keyword.Duration"          value="Duration" />

        <string id="Event.VibrationStart"           value="VibrationStart, intVal=%1" />
        <string id="Event.VibrationStop"           value="VibrationStop, intVal=%1" />
        <string id="Event.VibrationWaitDuration"           value="VibrationWaitDuration, intVal=%1" />
        <string id="Event.VibrationDriverError"           value="VibrationDriverError, intVal=%1" />
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
