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
            <provider name="Microsoft-WindowsPhone-Comms-CommsApis"
                guid="{788fda79-b68a-40df-b409-8778a3fa6edd}"
                resourceFileName="CommsApis.dll"
                messageFileName="CommsApis.dll"
                symbol="MICROSOFT_WINDOWSPHONE_COMMS_COMMSAPIS">

                <?comment
                <!--Channel to which this Publisher can publish -->
                <channels>
                    <!-- PhoneLogging publishes to the Cellcore channel -->
                    <importChannel chid="CommsApisLogChannel" name="Microsoft-WindowsMobile-CommsApis-Channel"/>
                </channels> ?>

                <!--Keywords for CommsApis Name Space -->
                <keywords>
                    <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
                    <keyword name="Error"               mask="0x00000001" />
                    <keyword name="Performance"         mask="0x00000002" />

                    <!-- Provider-specific keywords -->
                    <keyword name="Debug"               mask="0x00000004" />
                    <keyword name="VoipCallCoordinator" mask="0x00000008" />
                    <keyword name="VoipPhoneCall"       mask="0x00000010" />
                    <keyword name="AudioRouter"         mask="0x00000020" />
                    <keyword name="SmsIntercept"        mask="0x00000040" />
                    <keyword name="PhoneCallFilter"     mask="0x00000080" />
                    <keyword name="SmsFilter"           mask="0x00000100" />

                    <keyword name="SocialAPI"           mask="0x00000200" />
                    <keyword name="OnlinePhotosAPI"     mask="0x00000400" />
                    <keyword name="EntityAPI"           mask="0x00000800" />
                    <keyword name="MediaRTAPI"          mask="0x00001000" />

                    <!-- temporary BUG: 254932 -->
                    <keyword name="ThirdPartyTemp"      mask="0x10000000" />

                    <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
                    <keyword name="Warning"             mask="0x0000400000000000" />
                    <keyword name="StateTransition"     mask="0x0000800000000000"  />
                </keywords>

                <tasks>
                    <task name="CreateVoipShim"    symbol="CREATE_VOIP_SHIM"  value="1"/>
                    <task name="ReleaseVoipShim"   symbol="RELEASE_VOIP_SHIM" value="2"/>
                    <task name="IncomingCall"      symbol="INCOMING_CALL"     value="3"/>
                    <task name="StartCall"         symbol="START_CALL"        value="4"/>
                    <task name="EndCall"           symbol="END_CALL"          value="5"/>
                    <task name="SetAudioRouting"   symbol="SET_AUDIO_ROUTING" value="6"/>
                    <task name="ProcessMuteStateNotification" symbol="PROCESS_MUTE_STATE_NOTIFICATION" value="7"/>
                </tasks>

                <!-- Enumeration strings -->
                <maps>
                  <valueMap name="FeedType">
                    <map value="0" message="$(string.FeedType.Home)"/>
                    <map value="1" message="$(string.FeedType.Contact)"/>
                    <map value="2" message="$(string.FeedType.Dashboard)"/>
                  </valueMap>

                  <valueMap name="UpdateMode">
                    <map value="0" message="$(string.UpdateMode.Refresh)"/>
                    <map value="1" message="$(string.UpdateMode.Append)"/>
                    <map value="2" message="$(string.UpdateMode.InplaceUpdate)"/>
                  </valueMap>

                  <valueMap name="ThirdPartyApp">
                    <map value="0" message="$(string.ThirdPartyApp.Facebook)"/>
                    <map value="1" message="$(string.ThirdPartyApp.Twitter)"/>
                    <map value="2" message="$(string.ThirdPartyApp.NewDrive)"/>
                    <map value="3" message="$(string.ThirdPartyApp.zFaceBlue)"/>
                    <map value="4" message="$(string.ThirdPartyApp.zTwitter)"/>
                    <map value="5" message="$(string.ThirdPartyApp.Other)"/>
                  </valueMap>
                </maps>

                <!--Event Templates -->
                <templates>

                    <template tid="CommsHrTemplate">
                        <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
                        <data name="P2_String" inType="win:AnsiString"/>
                        <data name="P3_UInt32" inType="win:UInt32"/>
                    </template>

                    <template tid="OneString">
                        <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string"/>
                    </template>

                    <template tid="TwoStrings">
                        <data name="Prop_UnicodeString_1" inType="win:UnicodeString" outType="xs:string"/>
                        <data name="Prop_UnicodeString_2" inType="win:UnicodeString" outType="xs:string"/>
                    </template>

                    <template tid="OneHexInt">
                        <data name="Prop_HexInt32" inType="win:UInt32" outType="win:HexInt32"/>
                    </template>

                    <template tid="OneGuid">
                        <data name="Prop_Guid" inType="win:GUID" outType="xs:GUID"/>
                    </template>

                    <template tid="OneHexIntOneGuid">
                        <data name="Prop_HexInt32" inType="win:UInt32" outType="win:HexInt32"/>
                        <data name="Prop_Guid" inType="win:GUID" outType="xs:GUID"/>
                    </template>

                    <template tid="TwoHexInts">
                        <data name="Prop_HexInt32_1" inType="win:UInt32" outType="win:HexInt32"/>
                        <data name="Prop_HexInt32_2" inType="win:UInt32" outType="win:HexInt32"/>
                    </template>

                    <template tid="OneUnsignedInt">
                        <data name="Prop_UInt_1" inType="win:UInt32" outType="xs:unsignedInt"/>
                    </template>

                    <template tid="TwoUnsignedInts">
                        <data name="Prop_UInt_1" inType="win:UInt32" outType="xs:unsignedInt"/>
                        <data name="Prop_UInt_2" inType="win:UInt32" outType="xs:unsignedInt"/>
                    </template>

                    <template tid="StringAndOneInt">
                        <data name="Prop_UnicodeString" inType="win:UnicodeString"  outType="xs:string"/>
                        <data name="Prop_HexInt32"      inType="win:Int32"          outType="xs:int"/>
                    </template>

                    <template tid="FeedTypeUpdateModeUintUint">
                        <data name="Prop_Type" inType="win:UInt32" map="FeedType"/>
                        <data name="Prop_Mode" inType="win:UInt32" map="UpdateMode"/>
                        <data name="Prop_UInt_1" inType="win:UInt32"/>
                        <data name="Prop_UInt_2" inType="win:UInt32"/>
                    </template>

                    <template tid="ThirdPartyTemplate">
                        <data name="Prop_Caller"        inType="win:UInt32"          map="ThirdPartyApp"/>
                        <data name="Prop_UnicodeString" inType="win:UnicodeString"  outType="xs:string"/>
                    </template>

                    <!--
                    <template tid="OneBool">
                        <data name="Prop_BOOL" inType="win:Boolean" outType="xs:boolean"/>
                    </template>
                    -->

                </templates>

                <!--All the Events that can be published by this Publisher -->
                <events>
                    <event value="10000"
                        level="win:Informational"
                        template="ThirdPartyTemplate"
                        symbol="THIRDPARTY_MESSAGE"
                        message="$(string.ThirdPartyMessage)"
                        keywords="ThirdPartyTemp StateTransition"/>

                    <event value="1"
                        level="win:Error"
                        template="CommsHrTemplate"
                        symbol="CommsErrorOriginateEvent"
                        message="$(string.Event.CommsErrorOriginateMessage)"
                        keywords="Error"/>

                    <event value="2"
                        level="win:Warning"
                        template="CommsHrTemplate"
                        symbol="CommsErrorPropagateEvent"
                        message="$(string.Event.CommsPropagateErrorMessage)"
                        keywords="Warning"/>

                    <event value="10"
                        level="win:Verbose"
                        template="OneString"
                        symbol="TRACE_STRING"
                        message="$(string.Publisher.TraceString)"
                        keywords="Debug"/>

                    <!--Events published by VoipCallCoordinator -->
                    <event value="100"
                        level="win:Informational"
                        symbol="OPENING_VOIP_RPC_CLIENT"
                        message="$(string.Publisher.OpeningVoipRpcClient)"
                        keywords="VoipCallCoordinator"/>

                    <event value="101"
                        level="win:Informational"
                        symbol="OPENED_VOIP_RPC_CLIENT"
                        message="$(string.Publisher.OpenedVoipRpcClient)"
                        keywords="VoipCallCoordinator"/>

                    <event value="102"
                        level="win:Informational"
                        template="OneHexInt"
                        symbol="NEW_INCOMING_VOIP_CALL"
                        message="$(string.Publisher.NewIncomingVoipCall)"
                        keywords="VoipCallCoordinator"/>

                    <event value="103"
                        level="win:Informational"
                        template="OneHexInt"
                        symbol="NEW_OUTGOING_VOIP_CALL"
                        message="$(string.Publisher.NewOutgoingVoipCall)"
                        keywords="VoipCallCoordinator"/>

                    <event value="105"
                        level="win:Informational"
                        template="OneHexIntOneGuid"
                        symbol="OUTGOING_UPGRADE_VIDEO_CALL"
                        message="$(string.Publisher.OutgoingUpgradeVideoCall)"
                        keywords="VoipCallCoordinator"/>

                    <event value="106"
                        level="win:Informational"
                        template="OneHexInt"
                        symbol="INCOMING_UPGRADE_VIDEO_CALL"
                        message="$(string.Publisher.IncomingUpgradeVideoCall)"
                        keywords="VoipCallCoordinator"/>

                    <!--Events published by VoipPhoneCall -->
                    <event value="120"
                        level="win:Informational"
                        template="OneHexInt"
                        symbol="INVOKING_ACCEPT_INCOMING"
                        message="$(string.Publisher.InvokingAcceptIncoming)"
                        keywords="VoipPhoneCall"/>

                    <event value="121"
                        level="win:Informational"
                        template="OneHexInt"
                        symbol="INVOKING_REJECT_INCOMING"
                        message="$(string.Publisher.InvokingRejectIncoming)"
                        keywords="VoipPhoneCall"/>

                    <event value="122"
                        level="win:Informational"
                        template="OneHexInt"
                        symbol="INVOKING_HOLD"
                        message="$(string.Publisher.InvokingHold)"
                        keywords="VoipPhoneCall"/>

                    <event value="123"
                        level="win:Informational"
                        template="OneHexInt"
                        symbol="INVOKING_UNHOLD"
                        message="$(string.Publisher.InvokingUnhold)"
                        keywords="VoipPhoneCall"/>

                    <event value="124"
                        level="win:Informational"
                        template="OneHexInt"
                        symbol="INVOKING_END"
                        message="$(string.Publisher.InvokingEnd)"
                        keywords="VoipPhoneCall"/>

                    <event value="140"
                        level="win:Informational"
                        symbol="OPENING_AUDIO_ROUTING_RPC_CLIENT"
                        message="$(string.Publisher.OpeningAudioRoutingRpcClient)"
                        keywords="AudioRouter"/>

                    <event value="141"
                        level="win:Informational"
                        symbol="OPENED_AUDIO_ROUTING_RPC_CLIENT"
                        message="$(string.Publisher.OpenedAudioRoutingRpcClient)"
                        keywords="AudioRouter"/>

                    <event value="142"
                        level="win:Informational"
                        symbol="SMS_INTERCEPT_APP_ADDED"
                        message="$(string.Publisher.SmsInterceptAppAdded)"
                        keywords="SmsIntercept"/>

                    <event value="143"
                        level="win:Informational"
                        symbol="SMS_INTERCEPT_APP_REMOVED"
                        message="$(string.Publisher.SmsInterceptAppRemoved)"
                        keywords="SmsIntercept"/>

                    <event value="144"
                        level="win:Verbose"
                        symbol="SMS_INTERCEPT_NEW_SMS_ARRIVED"
                        message="$(string.Publisher.OnNewSmsArrived)"
                        keywords="SmsIntercept"/>

                    <event value="145"
                        level="win:Verbose"
                        template="OneUnsignedInt"
                        symbol="SMS_INTERCEPT_NEW_SMS_RETRIEVED"
                        message="$(string.Publisher.OnNewSmsRetrieved)"
                        keywords="SmsIntercept"/>

                    <!--Events published by PhoneCallFilter -->
                    <event value="150"
                        level="win:Informational"
                        symbol="OPENING_PHONE_CALL_FILTER_CLIENT"
                        message="$(string.Publisher.OpeningPhoneCallFilterClient)"
                        keywords="PhoneCallFilter"/>

                    <event value="151"
                        level="win:Informational"
                        symbol="OPENED_PHONE_CALL_FILTER_CLIENT"
                        message="$(string.Publisher.OpenedPhoneCallFilterClient)"
                        keywords="PhoneCallFilter"/>

                    <!--Events published by SmsFilter -->
                    <event value="152"
                        level="win:Informational"
                        symbol="OPENING_SMS_FILTER_CLIENT"
                        message="$(string.Publisher.OpeningSmsFilterClient)"
                        keywords="SmsFilter"/>

                    <event value="153"
                        level="win:Informational"
                        symbol="OPENED_SMS_FILTER_CLIENT"
                        message="$(string.Publisher.OpenedSmsFilterClient)"
                        keywords="SmsFilter"/>

                    <event value="200"
                        level="win:Verbose"
                        symbol="PHPERF_VOIP_INCOMING_CALL_BEGIN"
                        task="IncomingCall"
                        opcode="win:Start"
                        keywords="Performance"/>

                    <event value="201"
                        level="win:Verbose"
                        symbol="PHPERF_VOIP_OUTGOING_CALL_BEGIN"
                        task="StartCall"
                        opcode="win:Start"
                        keywords="Performance"/>

                    <event value="202"
                        level="win:Verbose"
                        symbol="PHPERF_VOIP_OUTGOING_CALL_END"
                        task="StartCall"
                        opcode="win:Stop"
                        keywords="Performance"/>

                    <event value="203"
                        level="win:Verbose"
                        symbol="PHPERF_VOIP_END_CALL_BEGIN"
                        task="EndCall"
                        opcode="win:Start"
                        keywords="Performance"/>

                    <event value="204"
                        level="win:Verbose"
                        symbol="PHPERF_SET_AUDIO_ROUTING_BEGIN"
                        task="SetAudioRouting"
                        opcode="win:Start"
                        keywords="Performance"/>

                    <event value="205"
                        level="win:Verbose"
                        symbol="PHPERF_SET_AUDIO_ROUTING_END"
                        task="SetAudioRouting"
                        opcode="win:Stop"
                        keywords="Performance"/>

                    <event value="206"
                        level="win:Verbose"
                        symbol="PHPERF_VOIP_NOTIFY_MUTED_BEGIN"
                        task="ProcessMuteStateNotification"
                        opcode="win:Start"
                        keywords="Performance"/>

                    <event value="207"
                        level="win:Verbose"
                        symbol="PHPERF_VOIP_NOTIFY_UNMUTED_BEGIN"
                        task="ProcessMuteStateNotification"
                        opcode="win:Start"
                        keywords="Performance"/>

                    <!--Events published by SocialAPI -->
                    <event value="301"
                        level="win:Warning"
                        template="OneUnsignedInt"
                        symbol="SOCIAL_PROPERTY_MISSING"
                        message="$(string.Publisher.SocialPropertyMissing)"
                        keywords="SocialAPI"/>

                    <event value="302"
                        level="win:Warning"
                        symbol="SOCIAL_TEXT_MISSING"
                        message="$(string.Publisher.SocialTextMissing)"
                        keywords="SocialAPI"/>

                    <event value="303"
                        level="win:Warning"
                        symbol="TOO_MANY_MEDIA_THUMBNAILS"
                        message="$(string.Publisher.TooManyThumbnails)"
                        keywords="SocialAPI"/>

                    <event value="304"
                        level="win:Warning"
                        template="OneUnsignedInt"
                        symbol="SOCIAL_PROPERTY_INVALID"
                        message="$(string.Publisher.SocialPropertyInvalid)"
                        keywords="SocialAPI"/>

                    <event value="305"
                        level="win:Informational"
                        template="FeedTypeUpdateModeUintUint"
                        symbol="SOCIAL_FEED_SAVE"
                        message="$(string.Publisher.SocialFeedSave)"
                        keywords="SocialAPI StateTransition"/>

                    <event value="306"
                        level="win:Warning"
                        symbol="SOCIAL_IMAGE_MISSING"
                        message="$(string.Publisher.SocialImageMissing)"
                        keywords="SocialAPI"/>

                    <event value="307"
                        level="win:Warning"
                        template="OneString"
                        symbol="SOCIAL_ORIGINATE_ERROR"
                        message="$(string.Publisher.SocialOriginateError)"
                        keywords="SocialAPI"/>
                    
                    <event value="308"
                        level="win:Verbose"
                        template="StringAndOneInt"
                        symbol="SOCIAL_CANCELLATION"
                        message="$(string.Publisher.SocialCancellation)"/>

                    <!--Events published by OnlinePhotosAPI -->
                    <event value="401"
                        level="win:Informational"
                        template="OneString"
                        symbol="ONLINEPHOTOS_SAVE_PICTURE"
                        message="$(string.Publisher.OnlinePhotosSavePicture)"
                        keywords="OnlinePhotosAPI StateTransition"/>

                    <event value="402"
                        level="win:Informational"
                        template="OneString"
                        symbol="ONLINEPHOTOS_SAVE_VIDEO"
                        message="$(string.Publisher.OnlinePhotosSaveVideo)"
                        keywords="OnlinePhotosAPI StateTransition"/>

                    <event value="403"
                        level="win:Informational"
                        template="OneString"
                        symbol="ONLINEPHOTOS_SAVE_ALBUM"
                        message="$(string.Publisher.OnlinePhotosSaveAlbum)"
                        keywords="OnlinePhotosAPI StateTransition"/>

                    <event value="404"
                        level="win:Informational"
                        template="OneUnsignedInt"
                        symbol="ONLINEPHOTOS_BULK_SAVE_ALBUMS"
                        message="$(string.Publisher.OnlinePhotosBulkSaveAlbums)"
                        keywords="OnlinePhotosAPI StateTransition"/>

                    <event value="405"
                        level="win:Informational"
                        template="OneUnsignedInt"
                        symbol="ONLINEPHOTOS_BULK_SAVE_MEDIAITEMS"
                        message="$(string.Publisher.OnlinePhotosBulkSaveMediaItems)"
                        keywords="OnlinePhotosAPI StateTransition"/>

                    <event value="406"
                        level="win:Informational"
                        symbol="ONLINEPHOTOS_BULK_SAVE_ALBUMS_COMPLETE"
                        message="$(string.Publisher.OnlinePhotosBulkSaveAlbumsComplete)"
                        keywords="OnlinePhotosAPI StateTransition"/>

                    <event value="407"
                        level="win:Informational"
                        symbol="ONLINEPHOTOS_BULK_SAVE_MEDIAITEMS_COMPLETE"
                        message="$(string.Publisher.OnlinePhotosBulkSaveMediaItemsComplete)"
                        keywords="OnlinePhotosAPI StateTransition"/>

                    <!--Events published by Media RT -->
                    <event value="600"
                        level="win:Informational"
                        template="OneGuid"
                        symbol="MEDIART_STORE_NOTFOUND"
                        message="$(string.Publisher.MediaRTSToreNotFound)"
                        keywords="MediaRTAPI StateTransition"/>

                    <!--Events published by PhoneCallAnnotationsManager -->
                    <event value="500"
                        level="win:Informational"
                        template="OneString"
                        symbol="StartingLocationQuery"
                        message="$(string.Publisher.StartingLocationQuery)"
                        keywords="StateTransition"/>

                    <event value="501"
                        level="win:Informational"
                        template="OneString"
                        symbol="CompletingLocationQuery"
                        message="$(string.Publisher.CompletingLocationQuery)"
                        keywords="StateTransition"/>

                    <event value="502"
                        level="win:Informational"
                        template="OneString"
                        symbol="StartingAnnotationsRpcServer"
                        message="$(string.Publisher.StartingAnnotationsRpcServer)"
                        keywords="StateTransition"/>

                    <event value="503"
                        level="win:Informational"
                        symbol="StoppingAnnotationsRpcServer"
                        message="$(string.Publisher.StoppingAnnotationsRpcServer)"
                        keywords="StateTransition"/>

                </events>
            </provider>
        </events>

    </instrumentation>

    <localization>
        <resources culture="en-US">
            <stringTable>
                <!-- Enum strings -->
                <string id="FeedType.Home"                                          value="HomeFeed"/>
                <string id="FeedType.Contact"                                       value="ContactFeed"/>
                <string id="FeedType.Dashboard"                                     value="DashboardFeed"/>

                <string id="UpdateMode.Refresh"                                     value="Refresh"/>
                <string id="UpdateMode.Append"                                      value="Append"/>
                <string id="UpdateMode.InplaceUpdate"                               value="InplaceUpdate"/>

                <string id="ThirdPartyApp.Facebook"                                 value="Facebook"/>
                <string id="ThirdPartyApp.Twitter"                                  value="Twitter"/>
                <string id="ThirdPartyApp.NewDrive"                                 value="NewDrive"/>
                <string id="ThirdPartyApp.zFaceBlue"                                value="zFaceBlue"/>
                <string id="ThirdPartyApp.zTwitter"                                 value="zTwitter"/>
                <string id="ThirdPartyApp.Other"                                    value="Other"/>
                <string id="ThirdPartyMessage"                                      value="3rd party log: %1 - %2"/>

                <string id="Event.CommsErrorOriginateMessage"                       value="Error: HRESULT: %1 Location: %2 Line Number: %3"/>
                <string id="Event.CommsPropagateErrorMessage"                       value="Error Propagated: HRESULT: %1 Location: %2 Line Number: %3"/>

                <string id="Publisher.TraceString"                                  value="%1"/>

                <string id="Publisher.OpeningVoipRpcClient"                         value="Opening VoIP RPC client"/>
                <string id="Publisher.OpenedVoipRpcClient"                          value="Opened VoIP RPC client"/>
                <string id="Publisher.NewIncomingVoipCall"                          value="New incoming VoIP call %1"/>
                <string id="Publisher.NewOutgoingVoipCall"                          value="New outgoing VoIP call %1"/>
                <string id="Publisher.OutgoingUpgradeVideoCall"                     value="Outgoing Video call upgrade call: %1, Call upgrade Guid: %2"/>
                <string id="Publisher.IncomingUpgradeVideoCall"                     value="New incoming upgrade video call %1"/>

                <string id="Publisher.InvokingAcceptIncoming"                       value="Invoking AcceptIncoming for VoIP call %1"/>
                <string id="Publisher.InvokingRejectIncoming"                       value="Invoking RejectIncoming for VoIP call %1"/>
                <string id="Publisher.InvokingHold"                                 value="Invoking Hold for VoIP call %1"/>
                <string id="Publisher.InvokingUnhold"                               value="Invoking Unhold for VoIP call %1"/>
                <string id="Publisher.InvokingEnd"                                  value="Invoking End for VoIP call %1"/>
                <string id="Publisher.OpeningAudioRoutingRpcClient"                 value="Opening audio routing RPC client"/>
                <string id="Publisher.OpenedAudioRoutingRpcClient"                  value="Opened audio routing RPC client"/>
                <string id="Publisher.OnNewSmsArrived"                              value="A new SMS has arrived"/>
                <string id="Publisher.OnNewSmsRetrieved"                            value="A new SMS has been retrieved of length %1"/>
                <string id="Publisher.SmsInterceptAppAdded"                         value="A new SMS Intercept application has been added"/>
                <string id="Publisher.SmsInterceptAppRemoved"                       value="A new SMS Intercept application has been removed"/>
                <string id="Publisher.OpeningPhoneCallFilterClient"                 value="Opening phone call filter client"/>
                <string id="Publisher.OpenedPhoneCallFilterClient"                  value="Opened phone call filter client"/>
                <string id="Publisher.OpeningSmsFilterClient"                       value="Opening SMS filter client"/>
                <string id="Publisher.OpenedSmsFilterClient"                        value="Opened SMS filter client"/>

                <string id="Publisher.SocialPropertyMissing"                        value="Social object is missing UDM property: %1"/>
                <string id="Publisher.SocialPropertyInvalid"                        value="Social object has invalid value for UDM property: %1"/>
                <string id="Publisher.SocialTextMissing"                            value="Social object needs at least one text field"/>
                <string id="Publisher.TooManyThumbnails"                            value="Social object has too many thumbnails"/>
                <string id="Publisher.SocialFeedSave"                               value="Saving feed of type=%1, updateMode=%2, operationId=%3, itemCount=%4"/>
                <string id="Publisher.SocialImageMissing"                           value="Social object needs an image or an image URL"/>
                <string id="Publisher.SocialOriginateError"                         value="Social Originate Error: %1"/>
                <string id="Publisher.SocialCancellation"                           value="Social Cancellation State(Cookie: %2): %1 "/>

                <string id="Publisher.OnlinePhotosSavePicture"                      value="Saving online picture remote id: [%1]"/>
                <string id="Publisher.OnlinePhotosSaveVideo"                        value="Saving online video remote id: [%1])"/>
                <string id="Publisher.OnlinePhotosSaveAlbum"                        value="Saving online album remote id: [%1])"/>

                <string id="Publisher.OnlinePhotosBulkSaveAlbums"                   value="Bulk saving %1 albums"/>
                <string id="Publisher.OnlinePhotosBulkSaveMediaItems"               value="Bulk saving %1 media items"/>
                <string id="Publisher.OnlinePhotosBulkSaveAlbumsComplete"           value="Done bulk saving albums"/>
                <string id="Publisher.OnlinePhotosBulkSaveMediaItemsComplete"       value="Done bulk saving media items"/>

                <string id="Publisher.MediaRTSToreNotFound"                         value="The store for app %1 was not found"/>
              
                <string id="Publisher.StartingLocationQuery"                        value="PhoneCallAnnotations: Starting location query. Phone number: %1"/>
                <string id="Publisher.CompletingLocationQuery"                      value="PhoneCallAnnotations: Completing location query. Location: %1"/>
                <string id="Publisher.StartingAnnotationsRpcServer"                 value="PhoneCallAnnotations: Starting RPC server with endpoint %1"/>
                <string id="Publisher.StoppingAnnotationsRpcServer"                 value="PhoneCallAnnotations: Stopping RPC server"/>
            </stringTable>
        </resources>
    </localization>

</instrumentationManifest>

