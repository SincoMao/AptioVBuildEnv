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

      <provider name="Microsoft-WindowsPhone-CertValidator"
          guid="{BF8A94E7-DA33-49F1-8017-BB0148A3E68D}"
          symbol="MICROSOFT_WINDOWSPHONE_CERTVAL"
          messageFileName="CertValidator.dll"
          resourceFileName="CertValidator.dll">

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <keyword mask="0x0000000000000004" name="Verbose" message="$(string.Keyword.Verbose)" />
        </keywords>

        <templates>

          <!-- Event Template defined for CertVal Logging -->
          <template tid="CertValHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
          </template>
          
          <template tid="CertValInfoUniTemplate1">
            <data name="P1_GenStr" inType="win:UnicodeString" outType="xs:string"/>
          </template>
          
        </templates>

        <events>

          <!-- The default handling of ifErrorReturn logging -->
          <!-- Level 2 -->
          <event value="1"
              level="win:Error"
              template="CertValHrTemplate"
              symbol="CertValErrorOriginateEvent"
              message="$(string.Event.CertValErrorOriginateMessage)"
              keywords="Error"/>

          <!-- Level 3 -->
          <event value="2"
              level="win:Warning"
              template="CertValHrTemplate"
              symbol="CertValErrorPropagateEvent"
              message="$(string.Event.CertValPropagateErrorMessage)"/>

          <!-- Level 4 -->
          <event value="4"
              level="win:Informational"
              template="CertValInfoUniTemplate1"
              symbol="CertValInfoCertificateSubjectName"
              message="$(string.Event.CertValInfoCertificateSubjectName)"
              keywords="Verbose" />

        </events>

      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="Keyword.Error" value="Error" />
        <string id="Keyword.Performance" value="Performance" />
        <string id="Keyword.Verbose" value="Verbose" />

        <string id="Event.CertValErrorOriginateMessage" value="CertVal - Error: %1"/>
        <string id="Event.CertValPropagateErrorMessage" value="CertVal - Error Propagated: %1"/>
        <string id="Event.CertValInfoCertificateSubjectName" value="CertVal - Intermediate Certificate Subject Name: %1"/>

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
