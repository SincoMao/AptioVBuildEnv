<?xml version='1.0' encoding='utf-8' standalone='yes'?>

<?Copyright (c) Microsoft Corporation. All rights reserved.?>
<instrumentationManifest
    xmlns="http://schemas.microsoft.com/win/2004/08/events"
    xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    >
  <instrumentation>
    <events>
      <provider name="Microsoft-WindowsPhone-YMTF-Client-Taskhost"
          guid="{296D4EFB-98F3-4383-876B-3669AF3038A6}"
          messageFileName="Microsoft.Phone.Test.AppPlatform.Core.dll"
          resourceFileName="Microsoft.Phone.Test.AppPlatform.Core.dll"
          symbol="MICROSOFT_WINDOWSPHONE_YMTF_CLIENT_TASKHOST"
          >
        
        <keywords>
          <keyword mask="0x00004" name="Informational" message="$(string.Keyword.Informational)" />           
        </keywords>

        <tasks>
           <!-- Please try to keep this list ordered. -->
            <task name="LogTrace" value="1"/>
        </tasks>

        <!-- Event Templates -->
        <templates>
          <!-- We only trace strings so this is the only template needed -->
          <template tid="String">
            <data inType="win:UnicodeString" name="String" />
          </template>
        </templates>

        <!-- Telemetry Events -->
        <events>
          <event keywords="Informational" task="LogTrace" template="String" opcode="win:Info" value="5" level="win:Informational" symbol="Generic_Trace_Info" message="$(string.Format.Info)"/>
        </events>
        
      </provider>
      <provider name="Microsoft-WindowsPhone-YMTF-MessagingLibrary"
          guid="{DBEE04F7-3A1F-4691-BF03-2C5095A46B48}"
          messageFileName="Microsoft.Phone.Test.AppPlatform.MessagingLibrary.dll"
          resourceFileName="Microsoft.Phone.Test.AppPlatform.MessagingLibrary.dll"
          symbol="MICROSOFT_WINDOWSPHONE_YMTF_MESSAGINGLIBRARY"
          >
        
        <keywords>
          <keyword mask="0x00004" name="Informational" message="$(string.Keyword.Informational)" />           
        </keywords>

        <tasks>
           <!-- Please try to keep this list ordered. -->
            <task name="LogTrace" value="1"/>
        </tasks>

        <!-- Event Templates -->
        <templates>
          <!-- We only trace strings so this is the only template needed -->
          <template tid="String">
            <data inType="win:UnicodeString" name="String" />
          </template>
        </templates>

        <!-- Telemetry Events -->
        <events>
          <event keywords="Informational" task="LogTrace" template="String" opcode="win:Info" value="5" level="win:Informational" symbol="Generic_Trace_Info" message="$(string.Format.Info)"/>
        </events>
        
      </provider>
    </events>
  </instrumentation>
  <!-- Localizable strings for the Telemetry Events -->
  <localization>
    <resources culture="en-US">
      <stringTable>
          <string id="Keyword.Informational"      value="Informational" />
          <string id="Format.Info"                value="%1" />
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
