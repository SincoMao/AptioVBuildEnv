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
      <provider name="Microsoft-WindowsPhone-WindowsSystemLauncher"
          guid="{5BBABE0A-B28B-4A7F-B7C1-1071F2D8A176}"
          symbol="MICROSOFT_WINDOWSPHONE_WindowsSystemLauncher"
          messageFileName="WindowsSystemLauncherProviderManifest.dll"
          resourceFileName="WindowsSystemLauncherProviderManifest.dll">
        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Information" message="$(string.Keyword.Information)" />
        </keywords>


        <tasks>          
          <task value="1" name="CreateDssToken" />
          <task value="2" name="LaunchUri" />
          <task value="3" name="LaunchFile" />
          <task value="4" name="DisplayMarketplacePopup" />
          <task value="5" name="LaunchError" />
          <task value="6" name="BeginNavigation" />
          <task value="7" name="DssTokenError" />
          <task value="8" name="LaunchSessionCompleted" />
          <task value="9" name="MarketplacePopupFailed" />
          <task value="10" name="NoTaskFound" />
          <task value="11" name="PerformLaunchFailed" />
        </tasks>

        <templates>

          <template tid="tDword">
            <data name="dwErrorCode" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          
          <template tid="tDwordAndString">
            <data name="dwErrorCode" inType="win:UInt32" outType="win:HexInt32" />
            <data name="pszInput" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="tString">
            <data name="pszInput" inType="win:UnicodeString" outType="xs:string" />
          </template>

        </templates>

        <events>
          <event value="100"
              symbol="LaunchUri"
              task="LaunchUri"
              keywords="Information"
              level="win:Informational"
              template="tString"
              message="$(string.Event.LaunchUri)" />

          <event value="101"
              symbol="LaunchFile"
              task="LaunchFile"
              keywords="Information"
              level="win:Informational"
              template="tString"
              message="$(string.Event.LaunchFile)" />

          <event value="102"
              symbol="LaunchError"
              task="LaunchError"
              keywords="Error"
              level="win:Error"
              template="tDwordAndString"
              message="$(string.Event.LaunchError)" />

          <event value="103"
              symbol="DisplayMarketplacePopup"
              task="DisplayMarketplacePopup"
              keywords="Information"
              level="win:Informational"
              message="$(string.Event.DisplayMarketplacePopup)" />

          <event value="104"
              symbol="CreateDssToken_Start"
              task="CreateDssToken"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              message="$(string.Event.CreateDssTokenStart)" />
          <event value="105"
              symbol="CreateDssToken_Stop"
              task="CreateDssToken"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Stop"
              message="$(string.Event.CreateDssTokenStop)" />

          <event value="106"
              symbol="BeginNavigation_Start"
              task="BeginNavigation"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              message="$(string.Event.BeginNavigationStart)" />
          
          <event value="107"
              symbol="BeginNavigation_Stop"
              task="BeginNavigation"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Stop"
              message="$(string.Event.BeginNavigationStop)" />

          <event value="108"
                 symbol="DssTokenError"
                 task="DssTokenError"
                 keywords="Error"
                 level="win:Error"
                 template="tDword"
                 message="$(string.Event.DssTokenError)" />

          <event value="109"
                 symbol="TaskHostLaunchSessionCompleted"
                 task="LaunchSessionCompleted"
                 keywords="Information"
                 level="win:Informational"
                 template="tDword"
                 message="$(string.Event.LaunchSessionCompleted)" />

          <event value="110"
                 symbol="MarketplacePopupFailed"
                 task="MarketplacePopupFailed"
                 keywords="Error"
                 level="win:Error"
                 template="tDword"
                 message="$(string.Event.MarketplacePopupFailed)" />

          <event value="111"
               symbol="NoTaskFound"
               task="NoTaskFound"
               keywords="Error"
               level="win:Error"
               message="$(string.Event.NoTaskFound)" />

          <event value="112"
             symbol="PerformLaunchFailed"
             task="PerformLaunchFailed"
             keywords="Error"
             level="win:Error"
             template="tDword"
             message="$(string.Event.PerformLaunchFailed)" />

        </events>
      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Keyword.Error"                value="Error" />
        <string id="Keyword.Performance"          value="Performance" />
        <string id="Keyword.Information"          value="Information" />

        <string id="Event.LaunchUri"              value="LaunchUri, uri=%1" />
        <string id="Event.LaunchFile"             value="LaunchFile, file=%1" />
        <string id="Event.LaunchError"            value="Launch Error, hr=%1, sourceUriOrFile=%2" />
        <string id="Event.DisplayMarketplacePopup" value="Navigate to marketplace ARD displayed" />
        <string id="Event.CreateDssTokenStart"    value="DSS Token Creation Start" />
        <string id="Event.CreateDssTokenStop"     value="DSS Token Creation Stop" />
        <string id="Event.BeginNavigationStart"   value="BeginNavigation Start" />
        <string id="Event.BeginNavigationStop"    value="BeginNavigation Stop" />
        <string id="Event.DssTokenError"          value="DSS Error, hr=%1" />
        <string id="Event.LaunchSessionCompleted" value="LaunchSessionCompleted, hr=%1" />
        <string id="Event.MarketplacePopupFailed" value="Marketplace ARD Failed, hr=%1" />
        <string id="Event.NoTaskFound"            value="No task could be found." />
        <string id="Event.ViewNotFound"           value="No view could be found, or it is of the incorrect type, hr=%1" />
        <string id="Event.PerformLaunchFailed"    value="PerformLaunchAction failed, hr=%1" />
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
