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

      <provider name="Microsoft-WindowsPhone-EPD"
          guid="{776F12A5-9009-4D03-8EC7-3D5D7EE575B6}"
          symbol="MICROSOFT_WINDOWSPHONE_EPD"
          messageFileName="EpdManifestResource.dll"
          resourceFileName="EpdManifestResource.dll">

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <keyword mask="0x0000000000000004" name="Verbose" message="$(string.Keyword.Verbose)" />
        </keywords>

        <templates>

          <!-- Event Template defined for Epd Logging -->
          <template tid="EpdHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
          </template>

          <template tid="EpdIntTemplate">
            <data name="P1_Int" inType="win:Int32" outType="xs:int"/>
          </template>
          
          <template tid="EpdInfoUniTemplate1">
            <data name="P1_GenStr" inType="win:UnicodeString" outType="xs:string"/>
          </template>

          <template tid="EpdInfoAnsiTemplate1">
            <data name="P1_GenStr" inType="win:AnsiString" outType="xs:string"/>
          </template>
          
          <template tid="EpdInfoTemplate3">
            <data name="P1_Endpoint" inType="win:UnicodeString" outType="xs:string"/>
            <data name="P2_TTL" inType="win:FILETIME" outType="xs:dateTime"/>
            <data name="P3_Moniker" inType="win:UnicodeString" outType="xs:string"/>
          </template>
          
        </templates>

        <events>

          <!-- The default handling of ifErrorReturn logging -->
          <!-- Level 2 -->
          <event value="1"
              level="win:Error"
              template="EpdHrTemplate"
              symbol="EpdErrorOriginateEvent"
              message="$(string.Event.EpdErrorOriginateMessage)"
              keywords="Error"/>

          <!-- Level 3 -->
          <event value="2"
              level="win:Warning"
              template="EpdHrTemplate"
              symbol="EpdErrorPropagateEvent"
              message="$(string.Event.EpdPropagateErrorMessage)"/>

          <!-- Level 4 -->
          <event value="4"
              level="win:Informational"
              template="EpdInfoUniTemplate1"
              symbol="EpdInfoLocalEvent"
              message="$(string.Event.EpdInfoLocalTemplate)"
              keywords="Verbose" />

          <event value="5"
              level="win:Informational"
              template="EpdInfoUniTemplate1"
              symbol="EpdInfoAutoEvent"
              message="$(string.Event.EpdInfoAutoTemplate)"
              keywords="Verbose" />

          <event value="6"
              level="win:Informational"
              template="EpdInfoUniTemplate1"
              symbol="EpdInfoReturnFromCacheEvent"
              message="$(string.Event.EpdInfoReturnCacheTemplate)"
              keywords="Verbose" />

          <event value="7"
              level="win:Informational"
              template="EpdInfoUniTemplate1"
              symbol="EpdInfoReturnFromDefaultEvent"
              message="$(string.Event.EpdInfoReturnDefaultTemplate)"
              keywords="Verbose" />

          <event value="8"
               level="win:Informational"
               template="EpdInfoTemplate3"
               symbol="EpdInfoFoundEndpointEvent"
               message="$(string.Event.EpdInfoEndpointTemplate)"
               keywords="Verbose" />
          
          <event value="9"
               level="win:Informational"
               template="EpdIntTemplate"
               symbol="EpdInfoHttpStatusCodeEvent"
               message="$(string.Event.EpdHttpStatusCode)"
               keywords="Verbose" />

          <event value="10"
               level="win:Informational"
               template="EpdInfoAnsiTemplate1"
               symbol="EpdInfoDevicePropertiesEvent"
               message="$(string.Event.EpdInfoDevicePropertiesTemplate)"
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

        <string id="Event.EpdErrorOriginateMessage" value="EPD - Error: %1"/>
        <string id="Event.EpdPropagateErrorMessage" value="EPD - Error Propagated: %1"/>
        <string id="Event.EpdInfoLocalTemplate" value="EPD - EPD_LOCAL called by moniker: %1"/>
        <string id="Event.EpdInfoAutoTemplate" value="EPD - EPD_AUTO called by moniker: %1"/>
        <string id="Event.EpdInfoDevicePropertiesTemplate" value="EPD - Device Properties: %1"/>
        <string id="Event.EpdInfoReturnCacheTemplate" value="EPD - endpoint: %1 returned from cache manifest"/>
        <string id="Event.EpdInfoReturnDefaultTemplate" value="EPD - endpoint: %1 returned from default manifest"/>
        <string id="Event.EpdInfoEndpointTemplate" value="EPD - Found endpoint: %1 with TTL: %2 for moniker: %3"/>
        <string id="Event.EpdHttpStatusCode" value="EPD - Manifest Download HTTP Status Code: %1"/>

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
