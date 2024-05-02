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
      <provider name="Microsoft-WindowsPhone-UTBase"
        guid="{CE52AFD4-44CD-43F5-86F9-86736107E6DF}"
        symbol="MICROSOFT_WINDOWSPHONE_UTBASE"
        messageFileName="UtBase.lib"
        resourceFileName="UtBase.lib">

        <templates>
          <template tid="Suite">
            <data name="Suite" inType="win:UnicodeString" />
          </template>
          <template tid="Group">
            <data name="Group" inType="win:UnicodeString" />
          </template>
          <template tid="Test">
            <data name="Test" inType="win:UnicodeString" />
          </template>
          <template tid="Group_Hresult">
            <data name="Group" inType="win:UnicodeString" />
            <data name="Hresult" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="Test_Hresult">
            <data name="Test" inType="win:UnicodeString" />
            <data name="Hresult" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="Suite_Hresult">
            <data name="Suite" inType="win:UnicodeString" />
            <data name="Hresult" inType="win:Int32" outType="win:HResult"/>
          </template>
        </templates>

        <events>
          <event value="1"
            level="win:Informational"
            template="Suite"
            symbol="EventSuiteSetup"
            message="$(string.EventSuiteSetup)"/>
          <event value="2"
            level="win:Informational"
            template="Suite_Hresult"
            symbol="EventSuiteSetupResult"
            message="$(string.EventSuiteSetupResult)"/>
          <event value="3"
            level="win:Informational"
            template="Group"
            symbol="EventSuiteTeardown"
            message="$(string.EventSuiteTeardown)"/>
          <event value="4"
            level="win:Informational"
            template="Group_Hresult"
            symbol="EventSuiteTeardownResult"
            message="$(string.EventSuiteTeardownResult)"/>
          <event value="5"
            level="win:Informational"
            template="Group"
            symbol="EventGroupSetup"
            message="$(string.EventGroupSetup)"/>
          <event value="6"
            level="win:Informational"
            template="Group_Hresult"
            symbol="EventGroupSetupResult"
            message="$(string.EventGroupSetupResult)"/>
          <event value="7"
            level="win:Informational"
            template="Group"
            symbol="EventGroupTeardown"
            message="$(string.EventGroupTeardown)"/>
          <event value="8"
            level="win:Informational"
            template="Group_Hresult"
            symbol="EventGroupTeardownResult"
            message="$(string.EventGroupTeardownResult)"/>
          <event value="9"
            level="win:Informational"
            template="Group"
            symbol="EventTestSetup"
            message="$(string.EventTestSetup)"/>
          <event value="10"
            level="win:Informational"
            template="Group_Hresult"
            symbol="EventTestSetupResult"
            message="$(string.EventTestSetupResult)"/>
          <event value="11"
            level="win:Informational"
            template="Group"
            symbol="EventTestTeardown"
            message="$(string.EventTestTeardown)"/>
          <event value="12"
            level="win:Informational"
            template="Group_Hresult"
            symbol="EventTestTeardownResult"
            message="$(string.EventTestTeardownResult)"/>
          <event value="13"
            level="win:Informational"
            template="Test"
            symbol="EventTestStart"
            message="$(string.EventTestStart)"/>
          <event value="14"
            level="win:Informational"
            template="Test_Hresult"
            symbol="EventTestResult"
            message="$(string.EventTestResult)"/>
        </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="EventSuiteSetup" value="UtBase: Suite: %1  SuiteSetup is being called"/>
        <string id="EventSuiteSetupResult" value="UtBase: Suite: %1  SuiteSetup result: %2"/>
        <string id="EventSuiteTeardown" value="UtBase: Suite: %1  SuiteTeardown is being called "/>
        <string id="EventSuiteTeardownResult" value="UtBase: Suite: %1  SuiteTeardown result: %2"/>
        <string id="EventGroupSetup" value="UtBase: Group: %1  GroupSetup is being called"/>
        <string id="EventGroupSetupResult" value="UtBase: Group: %1  GroupSetup result: %2"/>
        <string id="EventGroupTeardown" value="UtBase: Group: %1  GroupTeardown is being called"/>
        <string id="EventGroupTeardownResult" value="UtBase: Group: %1  GroupTeardown result: %2"/>
        <string id="EventTestSetup" value="UtBase: Group: %1  TestSetup is being called"/>
        <string id="EventTestSetupResult" value="UtBase: Group: %1  TestSetup result: %2"/>
        <string id="EventTestTeardown" value="UtBase: Group: %1  TestTeardown is being called"/>
        <string id="EventTestTeardownResult" value="UtBase: Group: %1  TestTeardown result: %2"/>
        <string id="EventTestStart" value="UtBase: Test: %1  is starting"/>
        <string id="EventTestResult" value="UtBase: Test: %1  completed.  Result: %2"/>
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
