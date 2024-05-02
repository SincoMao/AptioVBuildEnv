<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<instrumentationManifest
            xmlns="http://schemas.microsoft.com/win/2004/08/events"
            xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:Comms="http://www.w3.org/2001/XMLSchema">
  <instrumentation>

    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-Comms-CommsMessageService"
          guid="{6A7E44C5-AF45-4054-BB38-966632C24E5D}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_COMMSMESSAGESERVICE"
          resourceFileName="CommsMessageService.dll"
          messageFileName="CommsMessageService.dll">


        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />

          <!-- Provider-specific keywords -->
          <!-- We will use keywords to filter out which component the event is for i.e. the  core service
                         and each plug-in will get a keyword.
          -->
          <keyword mask="0x0000000000000004" name="CoreService" message="$(string.Keyword.CoreService)" />
        </keywords>

        <tasks>
          <!-- Begin Comms Message Service Specific Tasks -->
          <task name="INITIALIZE"                   value="1"/>
          <task name="SERVICEONSTARTING"            value="13"/>
          <task name="LIFECYCLEEVENT"               value="14"/>
          <!-- End MAPI Shell Notification Specific Tasks -->
        </tasks>

        <events>
          <!-- Comms Message Service Specific Events -->         
          <event value="100"  level="win:Verbose"  task="INITIALIZE"        symbol="INITIALIZE_START"        opcode="win:Start"  keywords="Performance CoreService"/>
          <event value="101"  level="win:Verbose"  task="INITIALIZE"        symbol="INITIALIZE_STOP"         opcode="win:Stop"   keywords="Performance CoreService"/>
          <event value="108"  level="win:Verbose"  task="SERVICEONSTARTING" symbol="SERVICEONSTARTING_START" opcode="win:Start"  keywords="Performance CoreService"/>
          <event value="109"  level="win:Verbose"  task="SERVICEONSTARTING" symbol="SERVICEONSTARTING_STOP"  opcode="win:Stop"   keywords="Performance CoreService"/>
        </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Keyword.Performance" value="Performance" />
        <string id="Keyword.CoreService" value="CoreService" />
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>


