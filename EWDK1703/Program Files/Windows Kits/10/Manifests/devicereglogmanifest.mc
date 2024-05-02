<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<!-- <?xml version="1.0" encoding="UTF-16"?> -->
<instrumentationManifest
            xmlns="http://schemas.microsoft.com/win/2004/08/events"
            xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
            xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <instrumentation>
    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsMobile-DeviceRegPublisher"
          guid="{5F5B677E-3285-4044-80F0-C6140520BE18}"
          symbol="WINDOWSMOBILE_DEVICEREGLOG_PUBLISHER"
          resourceFileName="TBD"
          messageFileName="TBD">
          
        <!--Channel to which this Publisher can publish -->
        <channels>
          <!--New Channel can be declared for this Publisher-->
          <channel chid="DeviceRegChannel"
              name="Microsoft-WindowsMobile-DeviceRegPublisher-Channel"
              type="Operational"
              symbol="DEVICEREGLOG_CHANNEL"
              enabled="true"
              value="52"/>
        </channels>

        <!--Keywords for DeviceReg Name Space, Note: it is 64bit value -->
        <keywords>
          <keyword name="INFORMATION" mask="0x00000001" />
          <keyword name="NOTICE" mask="0x00000002" />
          <keyword name="WARNING" mask="0x00000004" />
          <keyword name="ERROR" mask="0x00000008" />
          <keyword name="CRITICAL" mask="0x00000010" />
        </keywords>

        <!--Event Templates -->
        <templates>
          <template tid="StringLogTemplate">
            <data name="LoggingString" inType="win:UnicodeString" />
            <UserData>
              <DeviceRegEvent xmlns="DeviceRegNs">
                <LoggingString> %1 </LoggingString>
              </DeviceRegEvent>
            </UserData>
          </template>
        </templates>

        <!--All the Events that can be published by this Publisher -->
        <events>
          <event value="1000"
              level="win:Informational"
              template="StringLogTemplate"
              channel="DeviceRegChannel"
              keywords="INFORMATION"
              symbol="DEVICEREG_INFORMATION_EVENT"
              message="$(string.DeviceRegPublisher.InformationLogMessage)"/>

          <event value="1001"
              level="win:LogAlways"
              template="StringLogTemplate"
              channel="DeviceRegChannel"
              keywords="NOTICE"
              symbol="DEVICEREG_NOTICE_EVENT"
              message="$(string.DeviceRegPublisher.NoticeLogMessage)"/>

          <event value="1002"
              level="win:Warning"
              template="StringLogTemplate"
              channel="DeviceRegChannel"
              keywords="WARNING"
              symbol="DEVICEREG_WARNING_EVENT"
              message="$(string.DeviceRegPublisher.WarningLogMessage)"/>

          <event value="1003"
              level="win:Error"
              template="StringLogTemplate"
              channel="DeviceRegChannel"
              keywords="ERROR"
              symbol="DEVICEREG_ERROR_EVENT"
              message="$(string.DeviceRegPublisher.ErrorLogMessage)"/>

          <event value="1004"
              level="win:Critical"
              template="StringLogTemplate"
              channel="DeviceRegChannel"
              keywords="CRITICAL"
              symbol="DEVICEREG_CRITICAL_EVENT"
              message="$(string.DeviceRegPublisher.CriticalLogMessage)"/>
      </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="DeviceRegPublisher.InformationLogMessage"
            value="DeviceReg (Information): [%1]%n"/>
        <string id="DeviceRegPublisher.NoticeLogMessage"
            value="DeviceReg (Notice): [%1]%n"/>
        <string id="DeviceRegPublisher.WarningLogMessage"
            value="DeviceReg (Warning): [%1]%n"/>
        <string id="DeviceRegPublisher.ErrorLogMessage"
            value="DeviceReg (Error): [%1]%n"/>
        <string id="DeviceRegPublisher.CriticalLogMessage"
            value="DeviceReg (Critical): [%1]%n"/>
      </stringTable> 
    </resources>
  </localization>
</instrumentationManifest>




