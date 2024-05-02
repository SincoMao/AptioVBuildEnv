<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation. All rights reserved.
-->
<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>
    <events>
      <!-- Publisher Info -->
      <provider name="Microsoft-WindowsPhone-NfcController"
          guid="{A92C0AD8-6373-4758-A65D-8D0C934C4D09}"
          symbol="NFCCONTROLLER"
          messageFileName="NfcController.sys"
          resourceFileName="NfcController.sys">

        <channels />

        <keywords>
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <keyword mask="0x0000000000000004" name="Information" message="$(string.Keyword.Information)" />
        </keywords>

        <tasks>
          <task value="1" name="Enumeration" />
          <task value="2" name="Power" />
          <task value="3" name="Transfer" />
          <task value="4" name="IoControl" />
        </tasks>

        <templates>
          <template tid="ErrorCode">
            <data name="dwCode" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="ErrorCodeAndDescription">
            <data name="dwCode" inType="win:UInt32" outType="win:HexInt32" />
            <data name="szMessage" inType="win:UnicodeString" />
          </template>
          <template tid="BytesTransferred">
            <data name="dwBytesTransferred" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="IoControlCode">
            <data name="IoControlCode" inType="win:UInt32" outType="win:HexInt32" />
          </template>
        </templates>

        <events>
          <event value="100"
              symbol="DeviceAttach"
              task="Enumeration"
              keywords="Information"
              level="win:Informational"
              opcode="win:Info"
              message="$(string.Event.DeviceAttach)" />
          <event value="101"
              symbol="DeviceDetach"
              task="Enumeration"
              keywords="Information"
              level="win:Informational"
              opcode="win:Info"
              message="$(string.Event.DeviceDetach)" />
          <event value="102"
              symbol="PowerUp_Start"
              task="Power"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              message="$(string.Event.PowerUpStart)" />
          <event value="103"
              symbol="PowerUp_Stop"
              task="Power"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Stop"
              message="$(string.Event.PowerUpStop)" />
          <event value="104"
              symbol="PowerDown_Start"
              task="Power"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              message="$(string.Event.PowerDownStart)" />
          <event value="105"
              symbol="PowerDown_Stop"
              task="Power"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Stop"
              message="$(string.Event.PowerDownStop)" />
          <event value="106"
              symbol="ReadTransfer_Start"
              task="Transfer"
              keywords="Performance"
              level="win:Verbose"
              opcode="win:Start"
              message="$(string.Event.ReadTransferStart)" />
          <event value="107"
              symbol="ReadTransfer_Stop"
              task="Transfer"
              keywords="Performance"
              level="win:Verbose"
              opcode="win:Stop"
              template="BytesTransferred"
              message="$(string.Event.ReadTransferStop)" />
          <event value="108"
              symbol="WriteTransfer_Start"
              task="Transfer"
              keywords="Performance"
              level="win:Verbose"
              opcode="win:Start"
              message="$(string.Event.WriteTransferStart)" />
          <event value="109"
              symbol="WriteTransfer_Stop"
              task="Transfer"
              keywords="Performance"
              level="win:Verbose"
              opcode="win:Stop"
              template="BytesTransferred"
              message="$(string.Event.WriteTransferStop)" />
          <event value="110"
              symbol="IoControl_Start"
              task="IoControl"
              keywords="Performance"
              level="win:Verbose"
              opcode="win:Start"
              template="IoControlCode"
              message="$(string.Event.IoControlStart)" />
          <event value="111"
              symbol="IoControl_Stop"
              task="IoControl"
              keywords="Performance"
              level="win:Verbose"
              opcode="win:Stop"
              template="ErrorCode"
              message="$(string.Event.IoControlStop)" />
          <event value="112"
              symbol="TransferError"
              task="Transfer"
              keywords="Error"
              level="win:Error"
              opcode="win:Info"
              template="ErrorCode"
              message="$(string.Event.TransferError)" />
          <event value="113"
              symbol="FatalError"
              keywords="Error"
              level="win:Critical"
              opcode="win:Info"
              template="ErrorCode"
              message="$(string.Event.FatalError)" />
        </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Keyword.Error" value="Error" />
        <string id="Keyword.Performance" value="Performance" />
        <string id="Keyword.Information" value="Information" />

        <string id="Event.DeviceAttach" value="NFC Controller Device Attached" />
        <string id="Event.DeviceDetach" value="NFC Controller Device Detached" />
        <string id="Event.PowerUpStart" value="NFC Controller Power Up Start" />
        <string id="Event.PowerUpStop" value="NFC Controller Power Up Stop" />
        <string id="Event.PowerDownStart" value="NFC Controller Power Down Start" />
        <string id="Event.PowerDownStop" value="NFC Controller Power Down Stop" />
        <string id="Event.ReadTransferStart" value="NFC Controller Read Transfer Start" />
        <string id="Event.ReadTransferStop" value="NFC Controller Read Transfer Stop. Size: %1" />
        <string id="Event.WriteTransferStart" value="NFC Controller Write Transfer Start" />
        <string id="Event.WriteTransferStop" value="NFC Controller Write Transfer Stop. Size: %1" />
        <string id="Event.IoControlStart" value="NFC Controller IO Control Start. IO Code: %1" />
        <string id="Event.IoControlStop" value="NFC Controller IO Control Stop. Error Code: %1" />
        <string id="Event.TransferError" value="NFC Controller Transfer Failed. Error Code: %1" />
        <string id="Event.FatalError" value="NFC Controller Fatal Error. Error Code: %1" />
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>