<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<!--
Use of this source code is subject to the terms of the Microsoft
premium shared source license agreement under which you licensed
this source code. If you did not accept the terms of the license
agreement, you are not authorized to use this source code.
For the terms of the license, please see the license agreement
signed by you and Microsoft.
THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
-->

<instrumentationManifest
            xmlns="http://schemas.microsoft.com/win/2004/08/events"
            xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:Comms="http://www.w3.org/2001/XMLSchema">
  <instrumentation>

    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-Comms-Messaging"
          guid="{2FD73F42-35C6-49fb-B6B2-7DD07899D547}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_MESSAGING"
          resourceFileName="MessagingDataModel.dll"
          messageFileName="MessagingDataModel.dll">

        <channels/>

        <!--Main rules for ETW logging:
                 1. All Events with (Level >= win:Error) AND (Keyword == Error) go to Session WinPhone-Critical.
                 2. All Events with (Level >= win:warning) AND (Keyword != Error) go to Session WinPhone-Circular.
                 3. All Events with (Level >= win:Informational) AND (Keyword == StateTransition) go to Session SelfHost-Critical.
                 4. All Events with (Level >= win:Informational) AND (Keyword != (Error||Warning||StateTransition)) go to Session SelfHost-Circular.
                 (Levels:  win:Critical > win:Error > win:Warning  win:Informational > win:Verbose.) -->

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)"/>
        </keywords>

        <!--Event Templates -->
        <templates>
          <template tid="Comms_Messaging_DWORD_template">
            <data name="Prop_Data_UInt32" inType="win:UInt32"/>
            <UserData>
              <printfTrace xmlns="Comms_Messaging_DWORD">
                <Prop_Data_UInt32> %1 </Prop_Data_UInt32>
              </printfTrace>
            </UserData>
          </template>
        </templates>

        <tasks>
          <!-- DataModel -->
          <task name="PERF_MESSAGING_MULTISIMCONVERTER_CREATEINSTANCE_WITH_PHONEOM" value="600"/>
          <task name="PERF_MESSAGING_MULTISIMCONVERTER_GETSIMID" value="601"/>

          <task name="PERF_SMSMMS_SMSMMSPROVIDER_INITIALIZE" value="574"/>

          <task name="PERF_SENDUTILS_BUILDMMSMESSAGE" value="57"/>
          <task name="PERF_SENDUTILS_SETBASICMMSPROPERTIES" value="58"/>
          <task name="PERF_SENDUTILS_CREATEONEATTACHMENT" value="59"/>
          <task name="PERF_SENDUTILS_CREATEONEATTACHMENT_CREATEATTACH" value="60"/>
          <task name="PERF_SENDUTILS_CREATEONEATTACHMENT_OPENPROPERTY" value="61"/>
          <task name="PERF_SENDUTILS_CREATEONEATTACHMENT_WRITETEXTPROP" value="62"/>
          <task name="PERF_SENDUTILS_CREATEONEATTACHMENT_WRITESTREAMPROP" value="63"/>
          <task name="PERF_SENDUTILS_CREATEONEATTACHMENT_COMMIT" value="64"/>
          <task name="PERF_SENDUTILS_CREATEONEATTACHMENT_SETPROPS" value="65"/>
          <task name="PERF_SENDUTILS_SETBASICMMSPROPERTIES_SETPROPS" value="66"/>
          <task name="PERF_SENDUTILS_ADDSLIDE" value="69"/>
          <task name="PERF_SENDUTILS_GETSMIL" value="70"/>
          <task name="PERF_UTILS_CREATEMESSAGEINDRAFTS" value="79"/>
          <task name="PERF_UTILS_RESETDRAFTMESSAGE" value="80"/>
        </tasks>

        <events>

          <!-- Begin Messaging perf events -->
          <event value="5"
                 symbol="PERF_MESSAGING_MULTISIMCONVERTER_CREATEINSTANCE_WITH_PHONEOM_START"
                 task="PERF_MESSAGING_MULTISIMCONVERTER_CREATEINSTANCE_WITH_PHONEOM"
                 level="win:Verbose"
                 opcode="win:Start"
                 keywords="Performance"/>

          <event value="55"
                 symbol="PERF_MESSAGING_MULTISIMCONVERTER_CREATEINSTANCE_WITH_PHONEOM_STOP"
                 task="PERF_MESSAGING_MULTISIMCONVERTER_CREATEINSTANCE_WITH_PHONEOM"
                 level="win:Verbose"
                 opcode="win:Stop"
                 keywords="Performance"/>

          <event value="6"
                 symbol="PERF_MESSAGING_MULTISIMCONVERTER_GETSIMID_START"
                 task="PERF_MESSAGING_MULTISIMCONVERTER_GETSIMID"
                 level="win:Verbose"
                 opcode="win:Start"
                 keywords="Performance"/>

          <event value="56"
                 symbol="PERF_MESSAGING_MULTISIMCONVERTER_GETSIMID_STOP"
                 task="PERF_MESSAGING_MULTISIMCONVERTER_GETSIMID"
                 level="win:Verbose"
                 opcode="win:Stop"
                 keywords="Performance"/>

          <event value="157"
                 symbol="PERF_SENDUTILS_BUILDMMSMESSAGE_START"
                 task="PERF_SENDUTILS_BUILDMMSMESSAGE"
                 level="win:Verbose"
                 opcode="win:Start"
                 keywords="Performance"/>

          <event value="158"
                 symbol="PERF_SENDUTILS_SETBASICMMSPROPERTIES_START"
                 task="PERF_SENDUTILS_SETBASICMMSPROPERTIES"
                 level="win:Verbose"
                 opcode="win:Start"
                 keywords="Performance"/>

          <event value="159"
                 symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_START"
                 task="PERF_SENDUTILS_CREATEONEATTACHMENT"
                 level="win:Verbose"
                 opcode="win:Start"
                 keywords="Performance"/>

          <event value="160"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_CREATEATTACH_START"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_CREATEATTACH"
                level="win:Verbose"
                opcode="win:Start"
                keywords="Performance"/>

          <event value="161"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_OPENPROPERTY_START"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_OPENPROPERTY"
                level="win:Verbose"
                opcode="win:Start"
                keywords="Performance"/>

          <event value="162"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_WRITETEXTPROP_START"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_WRITETEXTPROP"
                level="win:Verbose"
                opcode="win:Start"
                keywords="Performance"/>

          <event value="163"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_WRITESTREAMPROP_START"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_WRITESTREAMPROP"
                level="win:Verbose"
                opcode="win:Start"
                keywords="Performance"/>

          <event value="164"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_COMMIT_START"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_COMMIT"
                level="win:Verbose"
                opcode="win:Start"
                keywords="Performance"/>

          <event value="165"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_SETPROPS_START"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_SETPROPS"
                level="win:Verbose"
                opcode="win:Start"
                keywords="Performance"/>

          <event value="166"
                symbol="PERF_SENDUTILS_SETBASICMMSPROPERTIES_SETPROPS_START"
                task="PERF_SENDUTILS_SETBASICMMSPROPERTIES_SETPROPS"
                level="win:Verbose"
                opcode="win:Start"
                keywords="Performance"/>

          <event value="169"
                 symbol="PERF_SENDUTILS_ADDSLIDE_START"
                 task="PERF_SENDUTILS_ADDSLIDE"
                 level="win:Verbose"
                 opcode="win:Start"
                 keywords="Performance"/>

          <event value="170"
                 symbol="PERF_SENDUTILS_GETSMIL_START"
                 task="PERF_SENDUTILS_GETSMIL"
                 level="win:Verbose"
                 opcode="win:Start"
                 keywords="Performance"/>

          <event value="179"
                 symbol="PERF_UTILS_CREATEMESSAGEINDRAFTS_START"
                 task="PERF_UTILS_CREATEMESSAGEINDRAFTS"
                 level="win:Verbose"
                 opcode="win:Start"
                 keywords="Performance"/>

          <event value="180"
                 symbol="PERF_UTILS_RESETDRAFTMESSAGE_START"
                 task="PERF_UTILS_RESETDRAFTMESSAGE"
                 level="win:Verbose"
                 opcode="win:Start"
                 keywords="Performance"/>

          <event value="257"
                 symbol="PERF_SENDUTILS_BUILDMMSMESSAGE_STOP"
                 task="PERF_SENDUTILS_BUILDMMSMESSAGE"
                 level="win:Verbose"
                 opcode="win:Stop"
                 keywords="Performance"/>

          <event value="258"
                 symbol="PERF_SENDUTILS_SETBASICMMSPROPERTIES_STOP"
                 task="PERF_SENDUTILS_SETBASICMMSPROPERTIES"
                 level="win:Verbose"
                 opcode="win:Stop"
                 keywords="Performance"/>

          <event value="259"
                 symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_STOP"
                 task="PERF_SENDUTILS_CREATEONEATTACHMENT"
                 level="win:Verbose"
                 opcode="win:Stop"
                 keywords="Performance"/>

          <event value="260"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_CREATEATTACH_STOP"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_CREATEATTACH"
                level="win:Verbose"
                opcode="win:Stop"
                keywords="Performance"/>

          <event value="261"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_OPENPROPERTY_STOP"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_OPENPROPERTY"
                level="win:Verbose"
                opcode="win:Stop"
                keywords="Performance"/>

          <event value="262"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_WRITETEXTPROP_STOP"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_WRITETEXTPROP"
                level="win:Verbose"
                opcode="win:Stop"
                keywords="Performance"/>

          <event value="263"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_WRITESTREAMPROP_STOP"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_WRITESTREAMPROP"
                level="win:Verbose"
                opcode="win:Stop"
                keywords="Performance"/>

          <event value="264"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_COMMIT_STOP"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_COMMIT"
                level="win:Verbose"
                opcode="win:Stop"
                keywords="Performance"/>

          <event value="265"
                symbol="PERF_SENDUTILS_CREATEONEATTACHMENT_SETPROPS_STOP"
                task="PERF_SENDUTILS_CREATEONEATTACHMENT_SETPROPS"
                level="win:Verbose"
                opcode="win:Stop"
                keywords="Performance"/>

          <event value="266"
                symbol="PERF_SENDUTILS_SETBASICMMSPROPERTIES_SETPROPS_STOP"
                task="PERF_SENDUTILS_SETBASICMMSPROPERTIES_SETPROPS"
                level="win:Verbose"
                opcode="win:Stop"
                keywords="Performance"/>

          <event value="269"
                 symbol="PERF_SENDUTILS_ADDSLIDE_STOP"
                 task="PERF_SENDUTILS_ADDSLIDE"
                 level="win:Verbose"
                 opcode="win:Stop"
                 keywords="Performance"/>

          <event value="270"
                 symbol="PERF_SENDUTILS_GETSMIL_STOP"
                 task="PERF_SENDUTILS_GETSMIL"
                 level="win:Verbose"
                 opcode="win:Stop"
                 keywords="Performance"/>

          <event value="279"
                 symbol="PERF_UTILS_CREATEMESSAGEINDRAFTS_STOP"
                 task="PERF_UTILS_CREATEMESSAGEINDRAFTS"
                 level="win:Verbose"
                 opcode="win:Stop"
                 keywords="Performance"/>

          <event value="280"
                 symbol="PERF_UTILS_RESETDRAFTMESSAGE_STOP"
                 task="PERF_UTILS_RESETDRAFTMESSAGE"
                 level="win:Verbose"
                 opcode="win:Stop"
                 keywords="Performance"/>

          <!-- Begin Message preview perf Events -->
          <!-- start events -->
          <event value="579"
                 symbol="PERF_SMSMMS_SMSMMSPROVIDER_INITIALIZE_START"
                 task="PERF_SMSMMS_SMSMMSPROVIDER_INITIALIZE"
                 level="win:Verbose"
                 opcode="win:Start"
                 keywords="Performance"/>

          <!-- stop events -->
          <event value="580"
                 symbol="PERF_SMSMMS_SMSMMSPROVIDER_INITIALIZE_STOP"
                 task="PERF_SMSMMS_SMSMMSPROVIDER_INITIALIZE"
                 level="win:Verbose"
                 opcode="win:Stop"
                 keywords="Performance"/>
          <!-- End Message preview perf Events -->
          
        </events>
      </provider>
    </events>

  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Keyword.Performance"
                value="Performance"/>
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>

