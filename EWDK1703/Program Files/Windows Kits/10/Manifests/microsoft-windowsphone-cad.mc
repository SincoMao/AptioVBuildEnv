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

      <provider name="Microsoft-WindowsPhone-Cad"
          guid="{F184D934-D688-4AE7-B078-24CB2C8063FF}"
          symbol="MICROSOFT_WINDOWSPHONE_CAD"
          messageFileName="CadEtw.dll"
          resourceFileName="CadEtw.dll">

        <channels/>

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)"/>
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)"/>
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Trace" message="$(string.Keyword.Trace)"/>
          <keyword mask="0x0000000000000008" name="Notify" message="$(string.Keyword.Notify)"/>
        </keywords>


        <tasks>
          <task value="1" name="Trace"/>
          <task value="2" name="Error"/>
          <task value="4" name="Notify"/>
        </tasks>


        <templates>

          <template tid="tPowerSourceStatusEx">
            <data name="PowerSourceId" inType="win:UInt32"/>
            <data name="MaxChargeCurrent" inType="win:UInt32"/>
            <data name="PowerSourceInformation" inType="win:UInt32"/>
            <data name="PowerSourceStatus" inType="win:UInt32"/>
            <data name="ChargerId" inType="win:GUID"/>
          </template>

          <template tid="tString">
            <data name="Message" inType="win:UnicodeString"/>
          </template>

          <template tid="tStringNumHex">
            <data name="Function" inType="win:AnsiString"/>
            <data name="Line" inType="win:UInt32"/>
            <data name="ErrorCode" inType="win:HexInt32"/>
          </template>

          <template tid="tDword">
            <data name="PowerSourceId" inType="win:UInt32"/>
          </template>

          <template tid="tSourceChange">
            <data name="PowerSourceId" inType="win:UInt32"/>
            <data name="SourceOnline" inType="win:UInt32"/>
          </template>

          <template tid="tBatteryStatusInfo">
              <data name="Capacity" inType="win:UInt32"/>
              <data name="FullChargedCapacity" inType="win:UInt32"/>
              <data name="Voltage" inType="win:UInt32"/>
              <data name="Rate" inType="win:Int32"/>
          </template>

          <template tid="tBatterySetChargerStatus">
              <data name="Size" inType="win:UInt32"/>
              <data name="BatteryTag" inType="win:UInt32"/>
              <data name="InformationLevel" inType="win:UInt32"/>
              <data name="ChargingSourceType" inType="win:UInt32"/>
              <data name="VaData" inType="win:UInt32"/>
          </template>

          <template tid="tBatterySetChargerStatusResult">
              <data name="BatteryTag" inType="win:UInt32"/>
              <data name="InformationLevel" inType="win:UInt32"/>
              <data name="ChargingSourceType" inType="win:UInt32"/>
              <data name="Status" inType="win:UInt32"/>
          </template>

          <template tid="tCadPowerSourceInfoUsb">
              <data name="PowerSourceId" inType="win:UInt32"/>
              <data name="Version" inType="win:UInt16"/>
              <data name="Flags" inType="win:UInt32"/>
              <data name="MaxCurrent" inType="win:UInt32"/>
              <data name="Voltage" inType="win:UInt32"/>
			  <data name="PortType" inType="win:UInt32"/>
              <data name="PortId" inType="win:UInt64"/>
              <data name="PowerSourceInformation" inType="win:UInt32"/>
              <data name="OemCharger" inType="win:GUID"/>
          </template>

          <template tid="tBatterySetUsbChargerStatus">
              <data name="Size" inType="win:UInt32"/>
              <data name="BatteryTag" inType="win:UInt32"/>
              <data name="InformationLevel" inType="win:UInt32"/>
              <data name="ChargingSourceType" inType="win:UInt32"/>
              <data name="Reserved" inType="win:UInt32"/>
              <data name="Flags" inType="win:UInt32"/>
              <data name="MaxCurrent" inType="win:UInt32"/>
              <data name="Voltage" inType="win:UInt32"/>
              <data name="PortType" inType="win:UInt32"/>
              <data name="PortId" inType="win:UInt64"/>
              <data name="PowerSourceInformation" inType="win:Pointer"/>
              <data name="OemCharger" inType="win:GUID"/>
          </template>

        </templates>

        <events>

          <!-- The simplest event to define is one with no data payload. -->
          <event value="100"
              symbol="Trace"
              task="Trace"
              keywords="Trace"
              level="win:Informational"
              template="tString"
              message="$(string.Event.Trace)"/>

          <!-- Similar event with error keyword/level. -->
          <event value="101"
              symbol="Error"
              task="Error"
              keywords="Error"
              level="win:Error"
              template="tStringNumHex"
              message="$(string.Event.Error)"/>

          <event value="201"
              symbol="NotifyBatteryDriver"
              task="Notify"
              keywords="Notify"
              template="tPowerSourceStatusEx"
              level="win:Informational"
              message="$(string.Event.NotifyBatteryDriver)"/>

          <event value="202"
              symbol="UpdateChargingSource"
              task="Notify"
              keywords="Notify"
              template="tPowerSourceStatusEx"
              level="win:Informational"
              message="$(string.Event.UpdateChargingSource)"/>

          <event value="203"
              symbol="StartCharging"
              task="Notify"
              keywords="Notify"
              template="tPowerSourceStatusEx"
              level="win:Informational"
              message="$(string.Event.StartCharging)"/>

          <event value="204"
              symbol="StopCharging"
              task="Notify"
              keywords="Notify"
              template="tDword"
              level="win:Informational"
              message="$(string.Event.StopCharging)"/>

          <event value="205"
              symbol="ChargingSourceChange"
              task="Notify"
              keywords="Notify"
              template="tSourceChange"
              level="win:Informational"
              message="$(string.Event.ChargingSourceChange)"/>

          <event value="206"
              symbol="BatteryStatusInfo"
              task="Notify"
              keywords="Notify"
              template="tBatteryStatusInfo"
              level="win:Informational"
              message="$(string.Event.BatteryStatusInfo)"/>

          <event value="207"
              symbol="NotifyGenericChargerStatus"
              task="Notify"
              keywords="Notify"
              template="tBatterySetChargerStatus"
              level="win:Informational"
              message="$(string.Event.NotifyGenericChargerStatus)"/>

          <event value="208"
              symbol="NotifyChargerStatusResult"
              task="Notify"
              keywords="Notify"
              template="tBatterySetChargerStatusResult"
              level="win:Informational"
              message="$(string.Event.NotifyChargerStatusResult)"/>

          <event value="209"
              symbol="CadPowerSourceUpdateUsb"
              task="Notify"
              keywords="Notify"
              template="tCadPowerSourceInfoUsb"
              level="win:Informational"
              message="$(string.Event.CadPowerSourceUpdateUsb)"/>

          <event value="210"
              symbol="NotifyUsbChargerStatus"
              task="Notify"
              keywords="Notify"
              template="tBatterySetUsbChargerStatus"
              level="win:Informational"
              message="$(string.Event.NotifyUsbChargerStatus)"/>

        </events>

      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Keyword.Error"                      value="Error"/>
        <string id="Keyword.Performance"                value="Performance"/>
        <string id="Keyword.Trace"          	        value="Trace"/>
        <string id="Keyword.Notify"                     value="Notify"/>
        <string id="Event.Trace"                        value="CAD: %1"/>
        <string id="Event.Error"                        value="CAD: Internal Error Occurred in Function %1 Line %2. Error Code is %3"/>
        <string id="Event.NotifyBatteryDriver"          value="CAD: Notifying Battery Driver    - Id:%1 MaxCurrent:%2 Info:%3 Status:%4 ChargerId:%5"/>
        <string id="Event.UpdateChargingSource"         value="CAD: Power Source Update Call    - Id:%1 MaxCurrent:%2 Info:%3 Status:%4 ChargerId:%5"/>
        <string id="Event.StartCharging"                value="CAD: Start Charging IOCTL Call   - Id:%1 MaxCurrent:%2 Info:%3 Status:%4 ChargerId:%5"/>
        <string id="Event.StopCharging"                 value="CAD: Stop Charging IOCTL Call    - Id:%1"/>
        <string id="Event.ChargingSourceChange"         value="CAD: Source Change Notification  - Id:%1 SourceOnline:%2"/>
        <string id="Event.BatteryStatusInfo"            value="CAD: Battery Status              - Capacity:%1 FullChargedCapacity:%2 Voltage:%3 Rate:%4"/>
        <string id="Event.NotifyGenericChargerStatus"   value="CAD-BAT: Notify Generic Charger Status       - Size:%1 BatteryTag:%2 InformationLevel:%3 ChargingSourceType:%4 VaData:%5"/>
        <string id="Event.NotifyChargerStatusResult"    value="CAD-BAT: Notify Charger Status Result        - BatteryTag:%1 InformationLevel:%2 ChargingSourceType:%3 Status:%4"/>
        <string id="Event.CadPowerSourceUpdateUsb"      value="USB-CAD: Power Source Update Usb             - PowerSourceId:%1 Version:%2 Flags:%3 MaxCurrent:%4 Voltage:%5 PortType:%6 PortId:%7 PowerSourceInformation:%8 OemCharger:%9"/>
        <string id="Event.NotifyUsbChargerStatus"       value="CAD-BAT: Notify Usb Charger Status           - Size:%1 BatteryTag:%2 InformationLevel:%3 ChargingSourceType:%4 Reserved:%5 Flags:%6 MaxCurrent:%7 Voltage:%8 PortType:%9 PortId:%10 PowerSourceInformation:%11 OemCharger:%12"/>
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
