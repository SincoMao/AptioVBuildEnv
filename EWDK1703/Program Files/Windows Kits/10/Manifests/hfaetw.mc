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
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>

    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-HandsFreeActivation"
          guid="{BB5F7E03-EDBC-4434-A33A-EE0B213F06DB}"
          symbol="WP_HFA_PROVIDER"
          messageFileName="hfaetw.dll"
          resourceFileName="hfaetw.dll">

        <!-- Enumeration strings -->
        <maps>
          <valueMap name="OMADM_SESSION_STATE">
            <map value="0" message="$(string.Enums.OMADM_SESSION_STATE_UNKNOWN)"/>
            <map value="1" message="$(string.Enums.OMADM_SESSION_STATE_READY)"/>
            <map value="2" message="$(string.Enums.OMADM_SESSION_STATE_CONNECTING)"/>
            <map value="3" message="$(string.Enums.OMADM_SESSION_STATE_COMMUNICATING)"/>
            <map value="4" message="$(string.Enums.OMADM_SESSION_STATE_ALERT_STATUS_AVAILABLE)"/>
            <map value="5" message="$(string.Enums.OMADM_SESSION_STATE_COMPLETED)"/>
          </valueMap>

          <valueMap name="OMADM_UIMODE">
            <map value="0" message="$(string.Enums.OMADM_UIMODE_NONE)"/>
            <map value="1" message="$(string.Enums.OMADM_UIMODE_DEFAULT)"/>
            <map value="2" message="$(string.Enums.OMADM_UIMODE_BACKGROUND)"/>
            <map value="3" message="$(string.Enums.OMADM_UIMODE_INFORMATIVE)"/>
            <map value="4" message="$(string.Enums.OMADM_UIMODE_USER_INTERACTIVE)"/>
          </valueMap>

          <valueMap name="DMSESSIONTYPE">
            <map value="0" message="$(string.Enums.HFACIDC)"/>
            <map value="1" message="$(string.Enums.HFACIPRL)"/>
            <map value="2" message="$(string.Enums.HFACIF)"/>
            <map value="3" message="$(string.Enums.UserCIDC)"/>
            <map value="4" message="$(string.Enums.UserCIPRL)"/>
            <map value="5" message="$(string.Enums.UserCISIM)"/>
            <map value="6" message="$(string.Enums.UserCIF)"/>
            <map value="7" message="$(string.Enums.HFACISIM)"/>
          </valueMap>

          <valueMap name="CMNT_CONNECTION_STATE">
            <map value="101" message="$(string.Enums.CMNT_CONNECTION_STATE_CONNECTED)"/>
            <map value="102" message="$(string.Enums.CMNT_CONNECTION_STATE_DISCONNECTED)"/>
          </valueMap>

          <valueMap name="READY_EVENTS">
            <map value="0" message="$(string.Enums.READY_EVENT_CELL_DEVICE_INFO_CAN0)"/>
            <map value="1" message="$(string.Enums.READY_EVENT_CELL_SYSTEM_TYPE_CAN0)"/>
            <map value="2" message="$(string.Enums.READY_EVENT_CELL_SUPPORTED_SYSTEM_TYPES_CAN0)"/>
            <map value="3" message="$(string.Enums.READY_EVENT_CM)"/>
          </valueMap>
        </maps>

        <!--Event Templates -->
        <templates>
          <template tid="Dword">
            <data name="dwValue1" inType="win:UInt32" />
            <UserData>
              <PCEvent xmlns="PCEvent">
                <dwValue1> %1 </dwValue1>
              </PCEvent>
            </UserData>
          </template>
          <template tid="String">
            <data name="str1" inType="win:UnicodeString" />
            <UserData>
              <PCEvent xmlns="PCEvent">
                <str1> %1 </str1>
              </PCEvent>
            </UserData>
          </template>
          <template tid="DwordString">
            <data name="dwValue1" inType="win:UInt32" />
            <data name="str2" inType="win:UnicodeString" />
            <UserData>
              <PCEvent xmlns="PCEvent">
                <dwValue1> %1 </dwValue1>
                <str2> %2 </str2>
              </PCEvent>
            </UserData>
          </template>
          <template tid="TwoDword">
            <data name="dwValue1" inType="win:UInt32" />
            <data name="dwValue2" inType="win:UInt32" />
            <UserData>
              <PCEvent xmlns="PCEvent">
                <dwValue1> %1 </dwValue1>
                <dwValue2> %2 </dwValue2>
              </PCEvent>
            </UserData>
          </template>
        </templates>

        <templates>
          <template tid="HrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

          <template tid="HrString">
            <data name="hr" inType="win:Int32" outType="win:HResult"/>
            <data name="alerttype" inType="win:UnicodeString"  outType="xs:string"/>
          </template>

          <template tid="SessionTypeUiModeAlertType">
            <data name="sessionType"        inType="win:UInt32"         map="DMSESSIONTYPE"/>
            <data name="uiMode"             inType="win:UInt32"         map="OMADM_UIMODE"/>
            <data name="Prop_UnicodeString" inType="win:UnicodeString"  outType="xs:string"/>
          </template>

          <template tid="DmSessionStateType">
            <data name="eventType"        inType="win:UInt32"         map="OMADM_SESSION_STATE"/>
          </template>

          <template tid="ReadyEventsType">
            <data name="eventType"        inType="win:UInt32"         map="READY_EVENTS"/>
          </template>

          <template tid="CmEventsType">
            <data name="eventType"        inType="win:UInt32"         map="CMNT_CONNECTION_STATE"/>
          </template>

          <template tid="SingleDWORD">
            <data name="Prop_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="SingleString">
            <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string" />
          </template>

        </templates>

        <!--All the Events that can be published by this Publisher -->

        <events>
          <event value="1"
                symbol="HFAPublishStartWnfError"
                level="win:Error"
                template="SingleDWORD"
                message="$(string.HFA.PublishStartWnfError)" />

          <event value="2"
                symbol="HFAPublishCompleteWnfError"
                level="win:Error"
                template="SingleDWORD"
                message="$(string.HFA.PublishCompleteWnfError)" />

          <event value="3"
                symbol="HFAUITraceErrorMessage"
                level="win:Error"
                template="SingleString"
                message="$(string.HFA.UITraceErrorMessage)" />

          <event value="4"
                symbol="HFAUITraceInformation"
                level="win:Informational"
                template="SingleString"
                message="$(string.HFA.UITraceInformation)" />

          <event value="5"
                symbol="ErrorOriginateEvent"
                level="win:Error"
                template="HrTemplate"
                message="$(string.HFA.ErrorOriginateMessage)" />

          <event value="6"
                symbol="HFARadioToolsResetRadioStart"
                level="win:Informational"
                message="$(string.HFA.RadioToolsResetRadioStart)" />

          <event value="7"
                symbol="HFARadioToolsResetRadioWaiting"
                level="win:Informational"
                message="$(string.HFA.RadioToolsResetRadioWaiting)" />
          
          <event value="8"
                symbol="HFARadioToolsStartResetRadioApmOn"
                level="win:Informational"
                message="$(string.HFA.RadioToolsStartResetRadioApmOn)" />
          
          <event value="9"
                symbol="HFARadioToolsStartResetRadioApmOnFailed"
                level="win:Informational"
                template="SingleDWORD"
                message="$(string.HFA.RadioToolsStartResetRadioApmOnFailed)" />

          <event value="10"
                symbol="HFARadioToolsStartResetRadioApmOff"
                level="win:Informational"
                message="$(string.HFA.RadioToolsStartResetRadioApmOff)" />
          
          <event value="11"
                symbol="HFARadioToolsStartResetRadioApmOffFailed"
                level="win:Informational"
                template="SingleDWORD"
                message="$(string.HFA.RadioToolsStartResetRadioApmOffFailed)" />

          <event value="12"
                symbol="HFARadioToolsSetApm"
                level="win:Informational"
                template="SingleDWORD"
                message="$(string.HFA.RadioToolsSetApm)" />
          
          <event value="13"
                symbol="HFARadioToolsSynchrResetRadioWrapperStart"
                level="win:Informational"
                message="$(string.HFA.RadioToolsSynchrResetRadioWrapperStart)" />
          
          <event value="14"
                symbol="HFARadioToolsSynchrResetRadioWrapperFinished"
                level="win:Informational"
                message="$(string.HFA.RadioToolsSynchrResetRadioWrapperFinished)" />
          
          <event value="15"
                symbol="HFARadioToolsCellularHelperResetModemStart"
                level="win:Informational"
                message="$(string.HFA.RadioToolsCellularHelperResetModemStart)" />

          <event value="16"
                symbol="HFARadioToolsCellularHelperStartModemResetAsync"
                level="win:Informational"
                message="$(string.HFA.RadioToolsCellularHelperStartModemResetAsync)" />
          
          <event value="17"
                symbol="HFARadioToolsCellularHelperCompleteModemResetAsync"
                level="win:Informational"
                template="SingleDWORD"                 
                message="$(string.HFA.RadioToolsCellularHelperCompleteModemResetAsync)" />          
                 
          <!-- non-UI related events -->
          <event value="100"
                symbol="DMStartSession"
                level="win:Informational"
                template="SessionTypeUiModeAlertType"
                message="$(string.HFA.DMStartSession)" />

          <event value="101"
                symbol="DMCloseSession"
                level="win:Informational"
                template="SingleString"
                message="$(string.HFA.DMCloseSession)" />

          <event value="102"
                symbol="DMNotifySystemReady"
                level="win:Informational"
                template="ReadyEventsType"
                message="$(string.HFA.DMNotifySystemReady)" />

          <event value="103"
                symbol="DMNotifySystemReadyAll"
                level="win:Informational"
                message="$(string.HFA.DMNotifySystemReadyAll)" />

          <event value="104"
                symbol="CmEventsType"
                level="win:Informational"
                template="CmEventsType"
                message="$(string.HFA.CmEventNotification)" />

          <event value="105"
                symbol="CmEventTimeout"
                level="win:Informational"
                message="$(string.HFA.CmEventTimeout)" />

          <event value="106"
                symbol="DmSessionState"
                level="win:Informational"
                template="DmSessionStateType"
                message="$(string.HFA.DmSessionState)" />

          <event value="107"
                symbol="DmSessionResult"
                level="win:Informational"
                template="HrString"
                message="$(string.HFA.DmSessionResult)" />

          <event value="108"
                symbol="HfaLaunchFlags"
                level="win:Informational"
                template="SingleDWORD"
                message="$(string.HFA.HfaLaunchFlags)" />

          <event value="109"
                 symbol="HfaLaunchSessionUI"
                 level="win:Informational"
                 message="$(string.HFA.HfaLaunchSessionUI)" />

          <event value="110"
                  symbol="HfaLaunchSessionNoUI"
                  level="win:Informational"
                  message="$(string.HFA.HfaLaunchSessionNoUI)" />

          <event value="111"
                symbol="HFARadioToolsEnsurePhoneCallIsDoneCallPresent"
                level="win:Informational"
                message="$(string.HFA.RadioToolsEnsurePhoneCallIsDoneCallPresent)" />

          <event value="112"
                symbol="HFARadioToolsEnsurePhoneCallIsDoneStartWaiting"
                level="win:Informational"
                message="$(string.HFA.RadioToolsEnsurePhoneCallIsDoneStartWaiting)" />

          <event value="113"
                symbol="HFARadioToolsEnsurePhoneCallIsDoneCallEnded"
                level="win:Informational"
                message="$(string.HFA.RadioToolsEnsurePhoneCallIsDoneCallEnded)" />
          
          <event value="114"
                symbol="HFARadioToolsNotifyPhoneCallbackCallEnded"
                level="win:Informational"
                message="$(string.HFA.RadioToolsNotifyPhoneCallbackCallEnded)" />

          <event value="118"
                symbol="HFARadioToolsCellularHelperModemResetStateCallback"
                level="win:Informational"
                template="SingleDWORD"                 
                message="$(string.HFA.RadioToolsCellularHelperModemResetStateCallback)" />          

        </events>

      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="HFA.PublishStartWnfError"                       value="HFA publish start WNF failed. status=%1." />
        <string id="HFA.PublishCompleteWnfError"                    value="HFA publish complete WNF failed. status=%1." />
        <string id="HFA.UITraceErrorMessage"                        value="HFA UI Error: %1" />
        <string id="HFA.UITraceInformation"                         value="HFA UI Info: %1" />
        <string id="HFA.ErrorOriginateMessage"                      value="Error: %1 Location: %2 Line Number: %3"/>
        <string id="HFA.Trace"                                      value="HFA trace: [%1]" />
        <string id="HFA.RadioToolsResetRadioStart"                  value="RadioTools::ResetRadio() - starting radio reset" />
        <string id="HFA.RadioToolsResetRadioWaiting"                value="RadioTools::ResetRadio() - waiting..." />
        <string id="HFA.RadioToolsStartResetRadioApmOn"             value="RadioTools::StartResetRadio() - setting airplane mode to on" />
        <string id="HFA.RadioToolsStartResetRadioApmOnFailed"       value="RadioTools::StartResetRadio() - setting airplane mode to on failed: %1" />
        <string id="HFA.RadioToolsStartResetRadioApmOff"            value="RadioTools::StartResetRadio() - setting airplane mode to off" />
        <string id="HFA.RadioToolsStartResetRadioApmOffFailed"      value="RadioTools::StartResetRadio() - setting airplane mode to off failed: %1" />
        <string id="HFA.RadioToolsSetApm"                           value="RadioTools::SetAPM() - setting airplane mode to %1" />
        <string id="HFA.RadioToolsSynchrResetRadioWrapperStart"     value="RadioTools::SynchrResetRadioWrapper() - calling ResetRadio" />
        <string id="HFA.RadioToolsSynchrResetRadioWrapperFinished"  value="RadioTools::SynchrResetRadioWrapper() - ResetRadio finished, returning" />
        <string id="HFA.RadioToolsCellularHelperResetModemStart"         value="RadioToolsCellularHelper::ResetModem() - starting modem reset" />
        <string id="HFA.RadioToolsCellularHelperStartModemResetAsync"    value="RadioToolsCellularHelper::StartResetModem() - rebooting modem." />        
        <string id="HFA.RadioToolsCellularHelperCompleteModemResetAsync" value="RadioToolsCellularHelper::CompleteResetModem() - modem restarted, hr: %1." />
        <string id="HFA.RadioToolsCellularHelperModemResetStateCallback" value="RadioToolsCellularHelper::OnModemResetStateChanged() - reset state: %1." />
        
        <string id="HFA.DMStartSession"             value="starting OMA-DM session. Type: %1, UIMode: %2,  alert-type: %3" />
        <string id="HFA.DMCloseSession"             value="closing OMA-DM session. alert-type: %1" />
        <string id="HFA.DMNotifySystemReady"        value="received system ready event: %1" />
        <string id="HFA.DMNotifySystemReadyAll"     value="all system-ready conditions are met" />
        <string id="HFA.CmEventNotification"        value="received CM notification: %1" />
        <string id="HFA.CmEventTimeout"             value="timed out waiting for WiFi and cellular connections" />
        <string id="HFA.DmSessionState"             value="received an OMA-DM session state notification: %1" />
        <string id="HFA.DmSessionResult"            value="OMA-DM session result is %1 for alert-type %2" />
        <string id="HFA.HfaLaunchFlags"             value="HFA launch flags value is: %1" />
        <string id="HFA.HfaLaunchSessionUI"         value="Launching HFA with UI" />
        <string id="HFA.HfaLaunchSessionNoUI"       value="Launching HFA without UI" />
        
        <string id="HFA.RadioToolsEnsurePhoneCallIsDoneCallPresent"       value="RadioTools::EnsurePhoneCallIsDone() - There is a Call" />
        <string id="HFA.RadioToolsEnsurePhoneCallIsDoneStartWaiting"      value="RadioTools::EnsurePhoneCallIsDone() - Start waiting for Call End" />
        <string id="HFA.RadioToolsEnsurePhoneCallIsDoneCallEnded"         value="RadioTools::EnsurePhoneCallIsDone() - Call Ended" />
        <string id="HFA.RadioToolsNotifyPhoneCallbackCallEnded"           value="NotifyPhoneCallback() - Call Ended" />

        <string id="Enums.HFACIDC"                  value="HFACIDC"/>
        <string id="Enums.HFACIPRL"                 value="HFACIPRL"/>
        <string id="Enums.HFACIF"                   value="HFACIF"/>
        <string id="Enums.UserCIDC"                 value="UserCIDC"/>
        <string id="Enums.UserCIPRL"                value="UserCIPRL"/>
        <string id="Enums.UserCISIM"                value="UserCISIM"/>
        <string id="Enums.UserCIF"                  value="UserCIF"/>
        <string id="Enums.HFACISIM"                 value="HFACISIM"/>

        <string id="Enums.OMADM_SESSION_STATE_UNKNOWN"                  value="UNKNOWN"/>
        <string id="Enums.OMADM_SESSION_STATE_READY"                    value="READY"/>
        <string id="Enums.OMADM_SESSION_STATE_CONNECTING"               value="CONNECTING"/>
        <string id="Enums.OMADM_SESSION_STATE_COMMUNICATING"            value="COMMUNICATING"/>
        <string id="Enums.OMADM_SESSION_STATE_ALERT_STATUS_AVAILABLE"   value="STATUS_AVAILABLE"/>
        <string id="Enums.OMADM_SESSION_STATE_COMPLETED"                value="COMPLETED"/>

        <string id="Enums.OMADM_UIMODE_NONE"                  value="NONE"/>
        <string id="Enums.OMADM_UIMODE_DEFAULT"               value="DEFAULT"/>
        <string id="Enums.OMADM_UIMODE_BACKGROUND"            value="BACKGROUND"/>
        <string id="Enums.OMADM_UIMODE_INFORMATIVE"           value="INFORMATIVE"/>
        <string id="Enums.OMADM_UIMODE_USER_INTERACTIVE"      value="USER_INTERACTIVE"/>

        <string id="Enums.CMNT_CONNECTION_STATE_CONNECTED"    value="CONNECTED"/>
        <string id="Enums.CMNT_CONNECTION_STATE_DISCONNECTED" value="DISCONNECTED"/>

        <string id="Enums.READY_EVENT_CELL_DEVICE_INFO_CAN0"             value="READY_EVENT_CELL_DEVICE_INFO_CAN0"/>
        <string id="Enums.READY_EVENT_CELL_SYSTEM_TYPE_CAN0"             value="READY_EVENT_CELL_SYSTEM_TYPE_CAN0"/>
        <string id="Enums.READY_EVENT_CELL_SUPPORTED_SYSTEM_TYPES_CAN0"  value="READY_EVENT_CELL_SUPPORTED_SYSTEM_TYPES_CAN0"/>
        <string id="Enums.READY_EVENT_CM"                                value="READY_EVENT_CM"/>
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
