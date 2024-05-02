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

      <provider name="Microsoft-WindowsPhone-Sensors"
          guid="{CF441505-1E7D-4907-8E5D-A5240CA18DB6}"
          symbol="WpSensorsEtwGuid"
          messageFileName="WpSensorsClx.sys"
          resourceFileName="WpSensorsClx.sys">

        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Debug" message="$(string.Keyword.Debug)" />
          <keyword mask="0x0000000000000008" name="Data" message="$(string.Keyword.Data)" />
        </keywords>


        <tasks>
          <task value="1" name="ErrorMessage" />
          <task value="2" name="DebugMessage" />
          <task value="3" name="PerfMessage" />
          <task value="4" name="AccDataMessage" />
          <task value="5" name="AlsDataMessage" />
          <task value="6" name="ProximityDataMessage" />
          <task value="7" name="OrientDataMessage" />
        </tasks>


        <templates>
          <template tid="tString">
            <data name="UnicodeString" inType="win:UnicodeString"/>
          </template>
          <template tid="t3Floats">
            <data name="X" inType="win:Float"/>
            <data name="Y" inType="win:Float"/>
            <data name="Z" inType="win:Float"/>
          </template>
          <template tid="tDword">
            <data name="Dword" inType="win:UInt32"/>
          </template>
        </templates>

        <events>
          <event value="100"
              symbol="SensorError"
              task="ErrorMessage"
              opcode="win:Start"
              keywords="Error"
              template="tString"
              level="win:Error"
              message="$(string.Event.ErrMessage)" />

          <event value="101"
              symbol="SensorDebug"
              task="DebugMessage"
              opcode="win:Start"
              keywords="Debug"
              template="tString"
              level="win:Informational"
              message="$(string.Event.DbgMessage)" />
              
          <event value="102"
              symbol="SensorPerf"
              task="PerfMessage"
              opcode="win:Start"
              keywords="Performance"
              template="tString"
              level="win:Informational"
              message="$(string.Event.PerfMessage)" />    

          <event value="103"
              symbol="SensorDataAccelerometer"
              task="AccDataMessage"
              opcode="win:Start"
              keywords="Data"
              template="t3Floats"
              level="win:Verbose"
              message="$(string.Event.StrAccDataMessage)" />    

          <event value="104"
              symbol="SensorDataAls"
              task="AlsDataMessage"
              opcode="win:Start"
              keywords="Data"
              template="tDword"
              level="win:Verbose"
              message="$(string.Event.StrAlsDataMessage)" />    

          <event value="105"
              symbol="SensorDataProximity"
              task="ProximityDataMessage"
              opcode="win:Start"
              keywords="Data"
              template="tDword"
              level="win:Verbose"
              message="$(string.Event.StrProximityDataMessage)" />    

          <event value="106"
              symbol="SensorDataOrientation"
              task="OrientDataMessage"
              opcode="win:Start"
              keywords="Data"
              template="tDword"
              level="win:Verbose"
              message="$(string.Event.StrOrientDataMessage)" />    
        </events>

      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="Keyword.Error"                   value="Error" />
        <string id="Keyword.Performance"             value="Performance" />
        <string id="Keyword.Debug"                   value="Debug" />
        <string id="Keyword.Data"                    value="SensorData" />

        <string id="Event.ErrMessage"                value="%1" />
        <string id="Event.DbgMessage"                value="%1" />
        <string id="Event.PerfMessage"               value="%1" />

        <string id="Event.StrAlsDataMessage"         value="ALS,%1,,,,," />
        <string id="Event.StrProximityDataMessage"   value="PRX,,%1,,,," />
        <string id="Event.StrOrientDataMessage"      value="Ort,,,%1,,," />
        <string id="Event.StrAccDataMessage"         value="ACC,,,,%1,%2,%3" />

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
