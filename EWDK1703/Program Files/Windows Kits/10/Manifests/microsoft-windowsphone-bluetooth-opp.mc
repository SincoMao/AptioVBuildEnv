<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<?Copyright (c) Microsoft Corporation. All rights reserved.?>
<assembly
  xmlns="urn:schemas-microsoft-com:asm.v3"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  manifestVersion="1.0"
  >
  <instrumentation
    xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    >

    <events xmlns="http://schemas.microsoft.com/win/2004/08/events">
      <provider
        guid="{F780A2D1-75F6-4154-839D-404A04F49892}"
        message="$(string.Provider.Name)"
        name="Microsoft-WindowsPhone-Bluetooth-OPP"
        resourceFileName="BthOPPManager.dll"
        messageFileName="BthOPPManager.dll"
        symbol="BLUETOOTH_OPP_PROVIDER_GUID"
        >

        <keywords>
          <keyword
            mask="0x0000000000000100"
            name="debug"
            message="$(string.Keyword.Debug)"
            />
        </keywords>
        <keywords>
          <keyword
            mask="0x0000000000000200"
            name="warning"
            message="$(string.Keyword.Warning)"
            />
        </keywords>
        <keywords>
          <keyword
            mask="0x0000000000000400"
            name="error"
            message="$(string.Keyword.Error)"
            />
        </keywords>

        <tasks>
          <task
            message="$(string.Task.TraceMessage)"
            name="tracemessage"
            value="10"
            />
        </tasks>

        <templates>
          <template tid="tTraceMessage">
            <data
              inType="win:Pointer"
              name="Message"
              />
          </template>
        </templates>

        <events>
          <event
            symbol="_ETWMESSAGE"
            keywords="debug"
            task="tracemessage"
            template="tTraceMessage"
            value="1000"
            />
        </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string
          id="Provider.Name"
          value="Microsoft-WindowsPhone-Bluetooth-OPP"
          />
        <string
          id="Keyword.Debug"
          value="Debug"
          />
        <string
          id="Keyword.Warning"
          value="Warning"
          />
        <string
          id="Keyword.Error"
          value="Error"
          />
        <string
          id="Task.TraceMessage"
          value="Trace"
          />
      </stringTable>

    </resources>
  </localization>

</assembly>

