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

      <provider name="Microsoft-WindowsPhone-AccountProvSvc"
          guid="{9000D609-40F9-4ED1-B6E4-07A1521446E8}"
          symbol="MICROSOFT_WINDOWSPHONE_ACCOUNTPROVSVC"
          messageFileName="ETWAccountProvSvcProvider.dll"
          resourceFileName="ETWAccountProvSvcProvider.dll">

        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <keyword mask="0x0000000000000004" name="DebugFriendly" message="$(string.Keyword.DebugFriendly)" />
          <keyword mask="0x0000000000000008" name="Information" message="$(string.Keyword.Information)" />
        </keywords>


        <tasks>
          <task value="1" name="Provision" />
          <task value="2" name="CapGroupCreation" />
          <task value="3" name="ServiceAccountCreation" />
          <task value="4" name="AccountProfileCreation" />
          <task value="5" name="ServiceCapabilityAssociation" />
        </tasks>

        <templates>
          <template tid="AccountProvSvcTemplate1">
            <data name="P1_UnicodeString" inType="win:UnicodeString" outType="xs:string"/>
            <data name="P2_HexInt32" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="P3_UnicodeString" inType="win:UnicodeString" outType="xs:string"/>
          </template>

          <template tid="AccountProvSvcTemplate2">
            <data name="P1_UnicodeString" inType="win:UnicodeString" outType="xs:string"/>
            <data name="P2_HexInt32" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="AccountProvSvcTemplate3">
            <data name="P1_UnicodeString" inType="win:UnicodeString" outType="xs:string"/>
            <data name="P2_UnicodeString" inType="win:UnicodeString" outType="xs:string"/>
            <data name="P3_UnicodeString" inType="win:UnicodeString" outType="xs:string"/>
          </template>

          <template tid="AccountProvSvcTemplate4">
            <data name="P1_UnicodeString" inType="win:UnicodeString" outType="xs:string"/>
          </template>

        </templates>

        <events>
            <event value="100"
                   symbol="Provision_Start"
                   task="Provision"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Start"
                   message="$(string.Event.ProvisionStart)" />

            <event value="101"
                   symbol="Provision_Stop"
                   task="Provision"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Stop"
                   message="$(string.Event.ProvisionStop)" />

            <event value="102"
                   symbol="CapGroupCreation_Start"
                   task="CapGroupCreation"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Start"
                   message="$(string.Event.CapGroupCreationStart)" />

            <event value="103"
                   symbol="CapGroupCreation_Stop"
                   task="CapGroupCreation"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Stop"
                   message="$(string.Event.CapGroupCreationStop)" />

            <event value="104"
                   symbol="ServiceAccountCreation_Start"
                   task="ServiceAccountCreation"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Start"
                   message="$(string.Event.ServiceAccountCreationStart)" />

            <event value="105"
                   symbol="ServiceAccountCreation_Stop"
                   task="ServiceAccountCreation"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Stop"
                   message="$(string.Event.ServiceAccountCreationStop)" />

            <event value="106"
                   symbol="AccountProfileCreation_Start"
                   task="AccountProfileCreation"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Start"
                   message="$(string.Event.AccountProfileCreationStart)" />

            <event value="107"
                   symbol="AccountProfileCreation_Stop"
                   task="AccountProfileCreation"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Stop"
                   message="$(string.Event.AccountProfileCreationStop)" />

            <event value="108"
                   symbol="ServiceCapAssociation_Start"
                   task="ServiceCapabilityAssociation"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Start"
                   message="$(string.Event.ServiceCapAssociationStart)" />

            <event value="109"
                   symbol="ServiceCapAssociation_Stop"
                   task="ServiceCapabilityAssociation"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Stop"
                   message="$(string.Event.ServiceCapAssociationStop)" />

            <event value="150"
                   template="AccountProvSvcTemplate2"
                   symbol="AccountProvSvcError"
                   keywords="Error"
                   level="win:Critical"
                   message="$(string.Event.AccountProvErrorMessage)" />

            <event value="151"
                   template="AccountProvSvcTemplate1"
                   symbol="AccountProvSvcAccountError"
                   keywords="Error"
                   level="win:Critical"
                   message="$(string.Event.AccountProvAccountErrorMessage)" />

            <event value="152"
                   template="AccountProvSvcTemplate2"
                   symbol="AccountProvSvcEnd"
                   keywords="DebugFriendly"
                   level="win:LogAlways"
                   message="$(string.Event.AccountProvEndMessage)" />

            <event value="153"
                   template="AccountProvSvcTemplate3"
                   symbol="AccountProvSvcAccountInfo"
                   keywords="Information"
                   level="win:Critical"
                   message="$(string.Event.AccountProvAccountInfoMessage)" />

            <event value="154"
                   template="AccountProvSvcTemplate4"
                   symbol="AccountProvSvcInfo"
                   keywords="DebugFriendly"
                   level="win:LogAlways"
                   message="$(string.Event.AccountProvInfoMessage)" />

            <event value="155"
                   template="AccountProvSvcTemplate3"
                   symbol="AccountProvSvcExtendedInfo"
                   keywords="DebugFriendly"
                   level="win:LogAlways"
                   message="$(string.Event.AccountProvExtendedInfoMessage)" />

        </events>


      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="Keyword.Error"                      value="Error" />
        <string id="Keyword.Performance"                value="Performance" />
        <string id="Keyword.DebugFriendly"              value="DebugFriendly" />
        <string id="Keyword.Information"                value="Information" />

        <string id="Event.ProvisionStart"               value="Provision Start" />
        <string id="Event.ProvisionStop"                value="Provision Stop" />

        <string id="Event.CapGroupCreationStart"        value="Capability Group Creation Start" />
        <string id="Event.CapGroupCreationStop"         value="Capability Group Creation Stop" />

        <string id="Event.ServiceAccountCreationStart"  value="Service Account Creation Start" />
        <string id="Event.ServiceAccountCreationStop"   value="Service Account Creation Stop" />

        <string id="Event.AccountProfileCreationStart"  value="Account Profile Creation Start" />
        <string id="Event.AccountProfileCreationStop"   value="Account Profile Creation Stop" />

        <string id="Event.ServiceCapAssociationStart"   value="Service Capability Association Start" />
        <string id="Event.ServiceCapAssociationStop"    value="Service Capability Association Stop" />

        <string id="Event.AccountProvErrorMessage"        value="AccountProvSvc: [%1] failed with '%2'"/>
        <string id="Event.AccountProvAccountErrorMessage" value="AccountProvSvc: [%1] failed with '%2', additional information '%3'"/>
        <string id="Event.AccountProvEndMessage"          value="AccountProvSvc: [%1] end with '%2'"/>
        <string id="Event.AccountProvAccountInfoMessage"  value="AccountProvSvc: [%1], '%2', '%3'"/>
        <string id="Event.AccountProvInfoMessage"         value="AccountProvSvc: [%1]"/>
        <string id="Event.AccountProvExtendedInfoMessage" value="AccountProvSvc: [%1] '%2' '%3'"/>

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
