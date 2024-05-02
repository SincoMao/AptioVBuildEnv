<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<assembly
    xmlns="urn:schemas-microsoft-com:asm.v3"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    manifestVersion="1.0"
    >
  <assemblyIdentity
      buildType="$(build.buildType)"
      language="neutral"
      name="Microsoft-WindowsPhone-TouchMiniDriver-Events"
      processorArchitecture="$(build.arch)"
      publicKeyToken="$(Build.WindowsPublicKeyToken)"
      version="$(build.version)"
      versionScope="nonSxS"
      />
  <instrumentation xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events">
    <events xmlns="http://schemas.microsoft.com/win/2004/08/events">
      <provider
          guid="{f09089a6-bca1-49e8-b834-cbf04007416f}"
          message="$(string.EventProviderName)"
          messageFileName="cypresstouch.sys"
          name="Microsoft-WindowsPhone-TouchMiniDriver"
          resourceFileName="cypresstouch.sys"
          symbol="TouchMiniDriverControlGuid"
          >

        <keywords>
          <keyword
              mask="0x001000"
              name="TouchMiniDriver"
              />
        </keywords>

        <tasks>
          <task
              name="Read"
              value="1"
              />
          <task
              name="Write"
              value="2"
              />
        </tasks>

        <events>
          <event
              keywords="TouchMiniDriver"
              level="win:Informational"
              opcode="win:Info"
              symbol="TouchIsr"
              task="Read"
              value="1"
              />
        </events>

      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string
            id="EventProviderName"
            value="Microsoft-WindowsPhone-TouchMiniDriver"
            />
      </stringTable>
    </resources>
  </localization>
</assembly>
