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
<!-- <?xml version="1.0" encoding="UTF-16"?> -->
<instrumentationManifest
    xmlns="http://schemas.microsoft.com/win/2004/08/events"
    xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <instrumentation>
    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-Comms-PhoneVoicemail"
          guid="{6560D3A9-20F6-4E26-B92F-E524FE3FA123}"
          resourceFileName="Voicemail.dll"
          messageFileName="Voicemail.dll"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_PHONEVOICEMAIL">
        <!--Channel to which this Publisher can publish -->
        <channels>
            <!-- PhoneLogging publishes to the Cellcore channel -->
            <importChannel chid="PhoneLogChannel" name="Microsoft-WindowsMobile-CellularLogPublisher-Channel"/>
        </channels>
        <!--Keywords for Phone and Connectivity Name Space -->
        <keywords>
            <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
            <keyword name="Error"        mask="0x00000001" />
            <keyword name="Performance"  mask="0x00000002" />

            <!-- Provider-specific keywords -->
            <keyword name="Debug"        mask="0x00000004" />
            <keyword name="PhoneDefault" mask="0x00000008" />  <!-- indicates events that will be logged with default settings on a retail device -->
            <keyword name="CONTROLLER"   mask="0x00000010" />
            <keyword name="CellularProvider" mask="0x00000020" />
            <keyword name="PHONEUI"      mask="0x00000040" />
            <keyword name="Callhistory"  mask="0x00000100" />
            <keyword name="CDMA"         mask="0x00000200" />
            <keyword name="VVM"          mask="0x00000400" />           
            <keyword name="MISC"         mask="0x00001000" />

            <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
            <keyword name="Warning" mask="0x0000004000000000" />
            <keyword name="StateTransition" mask="0x0000008000000000"/>
        </keywords>
        <tasks />
        <!-- Enumeration strings -->
        <maps>
          <valueMap name="AccountStatus">
              <map value="0" message="$(string.Enums.ACCOUNTSTATUS_UNKNOWN)"/>
              <map value="1" message="$(string.Enums.ACCOUNTSTATUS_IDLE)"/>
              <map value="2" message="$(string.Enums.ACCOUNTSTATUS_SYNCHRONIZEPENDING)"/>
              <map value="3" message="$(string.Enums.ACCOUNTSTATUS_SYNCHRONIZESTOPPING)"/>
              <map value="4" message="$(string.Enums.ACCOUNTSTATUS_SYNCHRONIZING)"/>
              <map value="5" message="$(string.Enums.ACCOUNTSTATUS_DISCONNECTED)"/>
              <map value="6" message="$(string.Enums.ACCOUNTSTATUS_THROTTLED)"/>
              <map value="7" message="$(string.Enums.ACCOUNTSTATUS_ATTENTIONREQUIRED)"/>
          </valueMap>
          <valueMap name="ConnectivityState">
              <map value="0" message="$(string.Enums.Connectivity_State_Unknown)"/>
              <map value="1" message="$(string.Enums.Connectivity_State_Syncing)"/>
              <map value="2" message="$(string.Enums.Connectivity_State_Connected)"/>
              <map value="3" message="$(string.Enums.Connectivity_State_Disconnected)"/>
              <map value="4" message="$(string.Enums.Connectivity_State_Not_Applicable)"/>
          </valueMap>
          <valueMap name="ProvisionState">
              <map value="0" message="$(string.Enums.PH_VOICEMAILPROVISIONINGSTATE_LEGACY_ONLY)"/>
              <map value="1" message="$(string.Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_SUPPORTED)"/>
              <map value="2" message="$(string.Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_CONFIGURED)"/>
              <map value="3" message="$(string.Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_ENABLED)"/>
              <map value="4" message="$(string.Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_ENABLED_NEW_USER)"/>
              <map value="5" message="$(string.Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_NOT_FUNCTIONING)"/>
              <map value="6" message="$(string.Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_CREATED)"/>
              <map value="7" message="$(string.Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_PASSWORD_RESET)"/>
              <map value="8" message="$(string.Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_INITIALIZED)"/>
          </valueMap>
          <!-- LastSyncErrorType enum values match SyncErrorType defined in AccountsRT -->
          <valueMap name="LastSyncErrorType">
              <map value="0" message="$(string.Enums.LastSyncErrorType_Unknown)"/>
              <map value="1" message="$(string.Enums.LastSyncErrorType_NoError)"/>
              <map value="2" message="$(string.Enums.LastSyncErrorType_UnClassified)"/>
              <map value="3" message="$(string.Enums.LastSyncErrorType_PasswordError)"/>
              <map value="4" message="$(string.Enums.LastSyncErrorType_ClientCertError)"/>
              <map value="5" message="$(string.Enums.LastSyncErrorType_ServerCertError)"/>
              <map value="6" message="$(string.Enums.LastSyncErrorType_ConnectivityError)"/>
              <map value="7" message="$(string.Enums.LastSyncErrorType_PolicyError)"/>
          </valueMap>
          <valueMap name="SyncReason">
              <map value="0" message="$(string.Enums.VisualVoicemailSyncNone)"/>
              <map value="1" message="$(string.Enums.VisualVoicemailSyncInitial)"/>
              <map value="2" message="$(string.Enums.VisualVoicemailSyncNewMessageNotification)"/>
              <map value="3" message="$(string.Enums.VisualVoicemailSyncOtherNotification)"/>
              <map value="4" message="$(string.Enums.VisualVoicemailSyncUnexpectedLegacyNotification)"/>
              <map value="5" message="$(string.Enums.VisualVoicemailSyncClientInitiated)"/>
              <map value="6" message="$(string.Enums.VisualVoicemailSyncClientInitiatedOnlyIfDisconnected)"/>
              <map value="7" message="$(string.Enums.VisualVoicemailSyncClientInitiatedOnlyIfUnacknowledgedNotify)"/>
          </valueMap>
        </maps>
        <!--Event Templates -->
        <templates>
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>
          <template tid="OneBool">
            <data name="Prop_Boolean" inType="win:Boolean"/>
          </template>
          <template tid="OneString">
            <data name="Prop_UnicodeString" inType="win:UnicodeString"  outType="xs:string"/>
          </template>
          <template tid="OneHexInt">
            <data name="Prop_HexInt32_1"    inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="AccountStatusTemplate">
            <data name="AccountStatus"      inType="win:UInt32"         map="AccountStatus"/>
          </template>
          <template tid="ConnectivityStateTemplate">
            <data name="ConnectivityState"  inType="win:UInt32"         map="ConnectivityState"/>
          </template>
          <template tid="VvmSyncFailureResultTemplate">
            <data name="LastSyncErrorType"  inType="win:UInt32"         map="LastSyncErrorType"/>
          </template>
          <template tid="ProvisionStateTemplate">
            <data name="ProvisionState"     inType="win:UInt32"         map="ProvisionState"/>
          </template>
          <template tid="VvmStartSyncTemplate">
            <data name="SyncReason"         inType="win:UInt32"         map="SyncReason"/>
          </template>
          <template tid="StringAndOneHexInt">
            <data name="Prop_UnicodeString" inType="win:UnicodeString"  outType="xs:string"/>
            <data name="Prop_HexInt32_1"    inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="StringAndTwoHexInts">
            <data name="Prop_UnicodeString" inType="win:UnicodeString"  outType="xs:string"/>
            <data name="Prop_HexInt32_1"    inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="Prop_HexInt32_2"    inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
        </templates>
        <!--All the Events that can be published by this Publisher -->
        <events>
          <event
            value="1"
            symbol="CommsErrorOriginateEvent"
            keywords="Error"
            level="win:Error"
            template="CommsHrTemplate"
            message="$(string.Event.CommsErrorOriginateMessage)"/>

          <event
            value="2"
            symbol="CommsErrorPropagateEvent"
            keywords="Warning"
            level="win:Warning"
            template="CommsHrTemplate"
            message="$(string.Event.CommsPropagateErrorMessage)"/>

          <!-- Visual Voicemail events (850) -->
          <event
            value="851"
            symbol="PHONE_EVENT_VVM_MESSAGE_RECEIVED"
            keywords="StateTransition"
            level="win:Informational"
            template="OneString"
            message="$(string.Publisher.VvmMessageReceived)"/>

          <event
            value="852"
            symbol="PHONE_EVENT_VVM_FIELD_VALUE_MISSING"
            keywords="Error"
            level="win:Error"
            template="OneString"
            message="$(string.Publisher.VvmFieldValueMissing)"/>

          <event
            value="854"
            symbol="PHONE_EVENT_VVM_ACCOUNT_STATUS_UNKNOWN"
            keywords="VVM"
            level="win:Informational"
            template="OneHexInt"
            message="$(string.Publisher.VvmAccountStatusUnknown)"/>

        <event value="855"
            level="win:Informational"
            keywords="StateTransition"
            symbol="PHONE_EVENT_VVM_SIM_SWAP"
            message="$(string.Publisher.VvmSimSwap)"/>

        <event value="856"
            level="win:Informational"
            template="StringAndTwoHexInts"
            keywords="StateTransition"
            symbol="PHONE_EVENT_LEGACY_VOICEMAIL_MESSAGE_RECEIVED"
            message="$(string.Publisher.LegacyVoicemailMessageReceived)"/>
        
        <event
            value="857"
            symbol="PHONE_EVENT_VVM_SENDING_CO_SMS"
            keywords="StateTransition"
            level="win:Informational"
            template="OneString"
            message="$(string.Publisher.SendingCOSms)"/>

          <event
            value="859"
            symbol="PHONE_EVENT_VVM_PROVIDER_INITIALIZED"
            keywords="VVM"
            level="win:Informational"
            template="StringAndOneHexInt"
            message="$(string.Publisher.VvmProviderInitialized)"/>

          <event
            value="860"
            symbol="PHONE_EVENT_VVM_ACCOUNT_STATUS_CHANGE"
            keywords="StateTransition" 
            level="win:Informational"
            template="AccountStatusTemplate"
            message="$(string.Publisher.VvmAccountStatusChange)"/>

          <event
            value="862"
            symbol="PHONE_EVENT_VVM_VOICEMAIL_COUNT_IN_MAPI_NOTIFICATION"
            keywords="StateTransition"
            level="win:Informational"
            template="OneBool"
            message="$(string.Publisher.VvmVoicemailCountInMapiNotification)"/>

          <event
            value="863"
            symbol="PHONE_EVENT_VVM_ACCOUNT_DELETED"
            keywords="StateTransition"
            level="win:Informational"
            message="$(string.Publisher.VvmAccountDeleted)"/>

          <event
            value="864"
            symbol="PHONE_EVENT_VVM_UNEXPECTED_MESSAGE_ELEMENT"
            keywords="Warning"
            level="win:Warning"
            template="OneString"
            message="$(string.Publisher.VvmUnexpectedMessageElement)"/>

          <event
            value="865"
            symbol="PHONE_EVENT_VVM_SYNC_FAILURE_RESULT"
            keywords="Error"
            level="win:Error"
            template="VvmSyncFailureResultTemplate"
            message="$(string.Publisher.VvmSyncFailureResult)"/>

          <event
            value="866"
            symbol="PHONE_EVENT_VVM_NEW_MESSAGE_IN_INBOX_MAPI_NOTIFICATION"
            keywords="StateTransition"
            level="win:Informational"
            message="$(string.Publisher.VvmNewMessageInInboxMapiNotification)"/>

          <event
            value="867"
            symbol="PHONE_EVENT_VVM_INBOX_ITEM_MAPI_NOTIFICATION"
            keywords="StateTransition"
            level="win:Informational"
            template="OneHexInt"
            message="$(string.Publisher.VvmInboxItemMapiNotification)"/>

          <event
            value="868"
            symbol="PHONE_EVENT_VVM_INBOX_RESET"
            keywords="StateTransition"
            level="win:Informational"
            message="$(string.Publisher.VvmInboxReset)"/>

          <event
            value="870"
            symbol="PHONE_EVENT_VVM_ACCOUNT_DOES_NOT_EXIST"
            keywords="VVM"
            level="win:Informational"
            template="OneString"
            message="$(string.Publisher.VvmAccountDoesNotExist)"/>

          <event
            value="871"
            symbol="NOTIFY_VVM_EXISTS_IDLE_NEW_MESSAGES"
            keywords="StateTransition"
            level="win:Informational"
            message="$(string.Publisher.NotifyDueToIdleNewMessages)"/>

          <event
            value="872"
            symbol="NOTIFY_NO_VVM_EXISTS_IDLE_NO_NEW_MESSAGES"
            keywords="StateTransition"
            level="win:Informational"
            message="$(string.Publisher.NotifyDueToIdleNoNewMessages)"/>

          <event
            value="873"
            symbol="NOTIFY_VVM_EXISTS_SYNC_ERROR"
            keywords="StateTransition"
            level="win:Informational"
            message="$(string.Publisher.NotifyDueToSyncError)"/>

          <event
            value="874"
            symbol="NOTIFY_NO_VVM_EXISTS_NEW_MESSAGE_COUNT"
            keywords="StateTransition"
            level="win:Informational"
            message="$(string.Publisher.NotifyDueToNewMessageCount)"/>

          <event
            value="875"
            symbol="PHONE_EVENT_VVM_CONNECTIVITY_STATE_CHANGE"
            keywords="StateTransition"
            level="win:Informational"
            template="ConnectivityStateTemplate"
            message="$(string.Publisher.VvmConnectivityStateChangedMessage)"/>

          <event
            value="876"
            symbol="PHONE_EVENT_VVM_PROVISIONING_STATE_CHANGE"
            keywords="StateTransition"
            level="win:Informational"
            template="ProvisionStateTemplate"
            message="$(string.Publisher.VvmSetProvisioningStateMessage)"/>
            
          <event
            value="877"
            symbol="PHONE_EVENT_VVM_START_SYNC"
            keywords="StateTransition"
            level="win:Informational"
            template="VvmStartSyncTemplate"
            message="$(string.Publisher.VvmStartSyncMessage)"/>
            
          <event
            value="878"
            symbol="PHONE_EVENT_VVM_TRANSPORT_START_SYNC"
            keywords="StateTransition"
            level="win:Informational"
            template="VvmStartSyncTemplate"
            message="$(string.Publisher.VvmTransportStartSyncMessage)"/>
          <event
            value="879"
            symbol="PHONE_EVENT_VVM_OMTPMAPISESSION_EXPIRED"
            keywords="VVM"
            level="win:Informational"
            message="$(string.Publisher.VvmOmtpMapiSessionExpired)"/>
          <event
            value="880"
            symbol="PHONE_EVENT_VVM_OMTP_HANDLE_REFRESH"
            keywords="VVM"
            level="win:Informational"
            message="$(string.Publisher.VvmOmtpHandleRefresh)"/>
        </events>
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Event.CommsErrorOriginateMessage"                       value="Error: %1 Location: %2 Line Number: %3"/>   
        <string id="Event.CommsPropagateErrorMessage"                       value="Error Propagated: %1 Location: %2 Line Number: %3"/>
        <string id="Publisher.VvmMessageReceived"                           value="New Visual Voicemail message received: %1"/>
        <string id="Publisher.VvmFieldValueMissing"                         value="The value for field %1 is missing"/>
        <string id="Publisher.VvmAccountStatusUnknown"                      value="User VVM Account status is unknown. Reason code: %1"/>
        <string id="Publisher.VvmSimSwap"                                   value="Sim Swap detected"/>
        <string id="Publisher.LegacyVoicemailMessageReceived"               value="New Legacy Voicemail message received: %1. Line Number: %2. Message count: %3"/>
        <string id="Publisher.VvmAccountDeleted"                            value="Deleted User VVM Account"/>
        <string id="Publisher.VvmUnexpectedMessageElement"                  value="Unexpected message element: %1 found in system message"/>
        <string id="Publisher.VvmSyncFailureResult"                         value="Sync failed with result: %1"/>
        <string id="Publisher.SendingCOSms"                                 value="Sending Client originated SMS message: %1"/>
        <string id="Publisher.VvmProviderInitialized"                       value="VVM Provider initialized. Initialization key path: %1. Current voicemail provisioning state is: %2"/>
        <string id="Publisher.VvmAccountStatusChange"                       value="VVM sync Account status changed. New status is: %1"/>
        <string id="Publisher.VvmVoicemailCountInMapiNotification"          value="Inbox message count decremented in Mapi notification. Reset: %1"/>
        <string id="Publisher.VvmNewMessageInInboxMapiNotification"         value="Inbox new message arrival reported by Mapi notification"/>
        <string id="Publisher.VvmInboxItemMapiNotification"                 value="Inbox item Mapi notification. Event: %1"/>
        <string id="Publisher.VvmInboxReset"                                value="Received Inbox Reset Notification"/>
        <string id="Publisher.VvmAccountDoesNotExist"                       value="VVM Account with name %1 does not exist."/>
        <string id="Publisher.NotifyDueToIdleNewMessages"                   value="Notifying that VVM exists (sync idle, new messages)" />
        <string id="Publisher.NotifyDueToIdleNoNewMessages"                 value="Notifying that no VVM exists (sync idle, no new messages)" />
        <string id="Publisher.NotifyDueToSyncError"                         value="Notifying that VVM exists (sync error)" />
        <string id="Publisher.NotifyDueToNewMessageCount"                   value="Notifying that no VVM exists (message count reset)" />
        <string id="Publisher.VvmConnectivityStateChangedMessage"           value="SmsImapProvider notify %1"/> 
        <string id="Publisher.VvmSetProvisioningStateMessage"               value="SmsImapProvider set %1"/> 
        <string id="Publisher.VvmStartSyncMessage"                          value="SmsImapProvider StartSync with reason %1"/> 
        <string id="Publisher.VvmTransportStartSyncMessage"                 value="ImapTransportFacade StartSync with reason %1"/>
        <string id="Publisher.VvmOmtpMapiSessionExpired"                    value="OmtpMapiSession has expired, getting new instance."/> 
        <string id="Publisher.VvmOmtpHandleRefresh"                         value="OmtpMapiSession refreshed, now refreshing OmtpAccount instance."/>

        <string id="Enums.ACCOUNTSTATUS_UNKNOWN"                            value="ACCOUNTSTATUS_UNKNOWN"/>
        <string id="Enums.ACCOUNTSTATUS_IDLE"                               value="ACCOUNTSTATUS_IDLE"/>
        <string id="Enums.ACCOUNTSTATUS_SYNCHRONIZEPENDING"                 value="ACCOUNTSTATUS_SYNCHRONIZEPENDING"/>
        <string id="Enums.ACCOUNTSTATUS_SYNCHRONIZESTOPPING"                value="ACCOUNTSTATUS_SYNCHRONIZESTOPPING"/>
        <string id="Enums.ACCOUNTSTATUS_SYNCHRONIZING"                      value="ACCOUNTSTATUS_SYNCHRONIZING"/>
        <string id="Enums.ACCOUNTSTATUS_DISCONNECTED"                       value="ACCOUNTSTATUS_DISCONNECTED"/>
        <string id="Enums.ACCOUNTSTATUS_THROTTLED"                          value="ACCOUNTSTATUS_THROTTLED"/>
        <string id="Enums.ACCOUNTSTATUS_ATTENTIONREQUIRED"                  value="ACCOUNTSTATUS_ATTENTIONREQUIRED"/>

        <string id="Enums.Connectivity_State_Unknown"                       value="Connectivity_State_Unknown"/>  
        <string id="Enums.Connectivity_State_Syncing"                       value="Connectivity_State_Syncing"/>
        <string id="Enums.Connectivity_State_Connected"                     value="Connectivity_State_Connected"/>
        <string id="Enums.Connectivity_State_Disconnected"                  value="Connectivity_State_Disconnected"/>
        <string id="Enums.Connectivity_State_Not_Applicable"                value="Connectivity_State_Not_Applicable"/>
          
        <string id="Enums.PH_VOICEMAILPROVISIONINGSTATE_LEGACY_ONLY"                value="PH_VOICEMAILPROVISIONINGSTATE_LEGACY_ONLY"/>
        <string id="Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_SUPPORTED"           value="PH_VOICEMAILPROVISIONINGSTATE_VISUAL_SUPPORTED"/>
        <string id="Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_CONFIGURED"          value="PH_VOICEMAILPROVISIONINGSTATE_VISUAL_CONFIGURED"/>
        <string id="Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_ENABLED"             value="PH_VOICEMAILPROVISIONINGSTATE_VISUAL_ENABLED"/>
        <string id="Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_ENABLED_NEW_USER"    value="PH_VOICEMAILPROVISIONINGSTATE_VISUAL_ENABLED_NEW_USER"/>
        <string id="Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_NOT_FUNCTIONING"     value="PH_VOICEMAILPROVISIONINGSTATE_VISUAL_NOT_FUNCTIONING"/>
        <string id="Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_CREATED"             value="PH_VOICEMAILPROVISIONINGSTATE_VISUAL_CREATED"/>
        <string id="Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_PASSWORD_RESET"      value="PH_VOICEMAILPROVISIONINGSTATE_VISUAL_PASSWORD_RESET"/>
        <string id="Enums.PH_VOICEMAILPROVISIONINGSTATE_VISUAL_INITIALIZED"         value="PH_VOICEMAILPROVISIONINGSTATE_VISUAL_INITIALIZED"/>

        <string id="Enums.LastSyncErrorType_Unknown"                         value="Unknown"/>
        <string id="Enums.LastSyncErrorType_NoError"                         value="NoError"/>
        <string id="Enums.LastSyncErrorType_UnClassified"                    value="UnClassified"/>
        <string id="Enums.LastSyncErrorType_PasswordError"                   value="PasswordError"/>
        <string id="Enums.LastSyncErrorType_ClientCertError"                 value="ClientCertError"/>
        <string id="Enums.LastSyncErrorType_ServerCertError"                 value="ServerCertError"/>
        <string id="Enums.LastSyncErrorType_ConnectivityError"               value="ConnectivityError"/>
        <string id="Enums.LastSyncErrorType_PolicyError"                     value="PolicyError"/>
          
        <string id="Enums.VisualVoicemailSyncNone"                                          value="VisualVoicemailSyncNone"/>
        <string id="Enums.VisualVoicemailSyncInitial"                                       value="VisualVoicemailSyncInitial"/>
        <string id="Enums.VisualVoicemailSyncNewMessageNotification"                        value="VisualVoicemailSyncNewMessageNotification"/>
        <string id="Enums.VisualVoicemailSyncOtherNotification"                             value="VisualVoicemailSyncOtherNotification"/>
        <string id="Enums.VisualVoicemailSyncUnexpectedLegacyNotification"                  value="VisualVoicemailSyncUnexpectedLegacyNotification"/>
        <string id="Enums.VisualVoicemailSyncClientInitiated"                               value="VisualVoicemailSyncClientInitiated"/>
        <string id="Enums.VisualVoicemailSyncClientInitiatedOnlyIfDisconnected"             value="VisualVoicemailSyncClientInitiatedOnlyIfDisconnected"/>
        <string id="Enums.VisualVoicemailSyncClientInitiatedOnlyIfUnacknowledgedNotify"     value="VisualVoicemailSyncClientInitiatedOnlyIfUnacknowledgedNotify"/>          
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
