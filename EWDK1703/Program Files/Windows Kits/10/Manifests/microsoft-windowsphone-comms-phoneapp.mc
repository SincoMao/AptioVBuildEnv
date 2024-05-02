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
      <provider name="Microsoft-WindowsPhone-Comms-PhoneApp"
          guid="{19E77E83-09DB-4C9A-839C-5A113D39D50E}"
          resourceFileName="Phone.dll"
          messageFileName="Phone.dll"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_PHONEAPP">
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
            <keyword name="Uix"          mask="0x00002000" />
            <keyword name="Favorites"    mask="0x00004000" />

            <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
            <keyword name="Warning" mask="0x0000400000000000" />
        </keywords>
        <tasks>
          <task name="CallHistoryLaunch"   symbol="CALLHISTORY_LAUNCH"  value="26"/>
          <task name="PlayDTMF"            symbol="PLAYDTMF"            value="27"/>
          <task name="StopEventSound"      symbol="STOPEVENTSOUND"      value="29"/>
          <task name="CallHistoryListInit" symbol="CALLHISTORYINIT"     value="30"/>
          <task name="PhoneUIXAdapterInit" symbol="PHONEUIXADAPTERINIT" value="31"/>
          <task name="VvmCodeModelInit"    symbol="VVMCODEMODELINIT"    value="32"/>
        </tasks>
        <!-- Enumeration strings -->
        <maps>
          <valueMap name="AudioPlaybackState">
            <map value="0" message="$(string.Enums.AudioPlayback_Idle)" />
            <map value="1" message="$(string.Enums.AudioPlayback_FileOpened)" />
            <map value="2" message="$(string.Enums.AudioPlayback_WaitingToPlay)" />
            <map value="3" message="$(string.Enums.AudioPlayback_Playing)" />
            <map value="4" message="$(string.Enums.AudioPlayback_Paused)" />
            <map value="5" message="$(string.Enums.AudioPlayback_Complete)" />
            <map value="6" message="$(string.Enums.AudioPlayback_ShutDown)" />
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
            <data name="Prop_BOOL" inType="win:Boolean" outType="xs:boolean"/>
          </template>
          <template tid="OneString">
            <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string"/>
          </template>
          <template tid="OneStringAndOneUint">
            <data name="String" inType="win:UnicodeString" outType="xs:string"/>
            <data name="Uint" inType="win:UInt32" />
          </template>
          <template tid="BoolAndHResult">
            <data name="Prop_BOOL" inType="win:Boolean" outType="xs:boolean"/>
            <data name="HResult" inType="win:UInt32" outType="win:HexInt32"/>
          </template>
          <template tid="OneHexInt">
            <data name="Prop_HexInt32" inType="win:UInt32" outType="win:HexInt32"/>
          </template>
          <template tid="OneUint">
            <data name="Prop_Uint32" inType="win:UInt32"/>
          </template>
          <template tid="OneHexIntOneUint">
            <data name="Prop_HexInt32" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="Prop_Uint32" inType="win:UInt32"/>
          </template>
          <template tid="TwoUints">
            <data name="Prop1_Uint32" inType="win:UInt32"/>
            <data name="Prop2_Uint32" inType="win:UInt32"/>
          </template>
          <template tid="TwoPtrs">
            <data name="Prop1_Uint32" inType="win:Pointer"/>
            <data name="Prop2_Uint32" inType="win:Pointer"/>
          </template>
          <template tid="PlaybackState">
            <data name="State" inType="win:UInt32" map="AudioPlaybackState"/>
          </template>
          <template tid="OneStringAndOneAudioPlaybackState">
            <data name="String" inType="win:UnicodeString" outType="xs:string"/>
            <data name="State" inType="win:UInt32" map="AudioPlaybackState"/>
          </template>
          <template tid="OneBoolAndOneAudioPlaybackState">
            <data name="Prop_BOOL" inType="win:Boolean" outType="xs:boolean"/>
            <data name="State" inType="win:UInt32" map="AudioPlaybackState"/>
          </template>
          <template tid="TwoAudioPlaybackStates">
            <data name="State1" inType="win:UInt32" map="AudioPlaybackState"/>
            <data name="State2" inType="win:UInt32" map="AudioPlaybackState"/>
          </template>
          <template tid="FourBools">
            <data name="Prop_BOOL1" inType="win:Boolean" outType="xs:boolean"/>
            <data name="Prop_BOOL2" inType="win:Boolean" outType="xs:boolean"/>
            <data name="Prop_BOOL3" inType="win:Boolean" outType="xs:boolean"/>
            <data name="Prop_BOOL4" inType="win:Boolean" outType="xs:boolean"/>
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
          <event value="850"
            level="win:Informational"
            template="OneString"
            keywords="VVM"
            symbol="INITIALIZING_AUDIOFILE"
            message="$(string.Event.InitializingAudioFile)" />

          <event value="851"
            level="win:Informational"
            template="OneString"
            keywords="VVM"
            symbol="CLOSING_AUDIOFILE"
            message="$(string.Event.ClosingAudioFile)" />

          <event value="852"
            level="win:Informational"
            template="OneStringAndOneUint"
            keywords="VVM"
            symbol="PLAY_AUDIOFILE"
            message="$(string.Event.PlayAudioFile)" />

          <event value="853"
            level="win:Informational"
            template="OneString"
            keywords="VVM"
            symbol="PAUSE_AUDIOFILE"
            message="$(string.Event.PauseAudioFile)" />

          <event value="854"
            level="win:Informational"
            template="OneStringAndOneUint"
            keywords="VVM"
            symbol="AUDIOFILE_OPENED"
            message="$(string.Event.AudioFileOpened)" />

          <event value="855"
            level="win:Informational"
            template="OneString"
            keywords="VVM"
            symbol="AUDIOFILE_SUPPRESSED_PAUSE_NOTIFICATION"
            message="$(string.Event.AudioFileSuppressedPauseNotification)" />

          <event value="856"
            level="win:Informational"
            template="OneString"
            keywords="VVM"
            symbol="AUDIOFILE_PLAYBACK_COMPLETE"
            message="$(string.Event.AudioFilePlaybackComplete)" />

          <event value="857"
            level="win:Verbose"
            template="OneStringAndOneAudioPlaybackState"
            keywords="VVM"
            symbol="AUDIOFILE_NOTIFYING_STATE"
            message="$(string.Event.AudioFileNotifyingState)" />

          <event value="860"
            level="win:Warning"
            template="PlaybackState"
            keywords="Warning"
            symbol="AUDIOCODEMODEL_IGNORING_STATE_CHANGE"
            message="$(string.Event.AudioCodeModelIgnoringStateChange)"/>

          <event value="861"
            level="win:Informational"
            template="OneBool"
            keywords="VVM"
            symbol="AUDIOCODEMODEL_TURNING_ROUTING_ON"
            message="$(string.Event.AudioCodeModelTurningRoutingOn)"/>

          <event value="862"
            level="win:Informational"
            keywords="VVM"
            symbol="AUDIOCODEMODEL_TURNING_ROUTING_OFF"
            message="$(string.Event.AudioCodeModelTurningRoutingOff)"/>

          <event value="863"
            level="win:Verbose"
            template="OneBool"
            keywords="VVM"
            symbol="AUDIOCODEMODEL_SPEAKERPHONE_STATE_CHANGED"
            message="$(string.Event.AudioCodeModelSpeakerphoneStateChanged)"/>

          <event value="864"
            level="win:Verbose"
            template="OneUint"
            keywords="VVM"
            symbol="AUDIOCODEMODEL_PHONE_STATE_CHANGED"
            message="$(string.Event.AudioCodeModelPhoneStateChanged)"/>

          <event value="865"
            level="win:Verbose"
            template="OneBoolAndOneAudioPlaybackState"
            keywords="VVM"
            symbol="AUDIOCODEMODEL_SET_SPEAKERPHONE"
            message="$(string.Event.AudioCodeModelSetSpeakerphone)"/>

          <event value="866"
            level="win:Verbose"
            template="TwoAudioPlaybackStates"
            keywords="VVM"
            symbol="AUDIOCODEMODEL_STATE_TRANSITION"
            message="$(string.Event.AudioCodeModelStateTransition)"/>
          
          <event value="869"
            level="win:Informational"
            template="OneHexInt"
            channel="PhoneLogChannel"
            keywords="VVM"
            symbol="PHONE_EVENT_VVM_LIST_SUPPLIER_NOTIFICATION"
            message="$(string.Publisher.VvmListSupplierNotification)"/>

          <!-- UI Events (900) -->
          <event value="904"
            level="win:Error"
            template="BoolAndHResult"
            channel="PhoneLogChannel"
            keywords="PHONEUI"
            symbol="PHONE_PROXIMITYSENSOR_FAILURE"
            message="$(string.Publisher.ProximitySensorFailure)"/>

          <event value="999"
            symbol="PHONE_INVESTIGATIONAL"
            level="win:Informational"
            keywords="Debug Performance Uix"
            template="OneString"
            message="$(string.Publisher.InvestigationString)"/>

          <!-- Performance marker events -->
          <event value="1043"
            symbol="PHONEAPPPERF_CALLHISTORYLAUNCH_END"
            task="CallHistoryLaunch"
            opcode="win:Stop"
            channel="PhoneLogChannel"
            keywords="Performance"
            level="win:Informational"/>

          <event value="1044"
            symbol="PHONEAPPPERF_PLAYDTMF_BEGIN"
            task="PlayDTMF"
            opcode="win:Start"
            channel="PhoneLogChannel"
            keywords="Performance PHONEUI"
            level="win:Verbose"/>

          <event value="1045"
            symbol="PHONEAPPPERF_PLAYDTMF_END"
            task="PlayDTMF"
            opcode="win:Stop"
            channel="PhoneLogChannel"
            keywords="Performance PHONEUI"
            level="win:Verbose"/>

          <event value="1046"
            symbol="PHONEAPPPERF_STOPEVENTSOUNDS_BEGIN"
            task="StopEventSound"
            opcode="win:Start"
            channel="PhoneLogChannel"
            keywords="Performance PHONEUI"
            level="win:Verbose"/>

          <event value="1047"
            symbol="PHONEAPPPERF_STOPEVENTSOUNDS_END"
            task="StopEventSound"
            opcode="win:Stop"
            channel="PhoneLogChannel"
            keywords="Performance PHONEUI"
            level="win:Verbose"/>

          <event value="1048"
            symbol="PHONEAPPPERF_CALLHISTORYLISTINIT_BEGIN"
            task="CallHistoryListInit"
            opcode="win:Start"
            channel="PhoneLogChannel"
            keywords="Performance PHONEUI"
            level="win:Informational"/>
 
          <event value="1049"
            symbol="PHONEAPPPERF_CALLHISTORYLISTINIT_END"
            task="CallHistoryListInit"
            opcode="win:Stop"
            channel="PhoneLogChannel"
            keywords="Performance PHONEUI"
            level="win:Informational"/>

          <event value="1050"
            symbol="PHONEAPPPERF_PhoneUIXAdapterInitialize_Begin"
            task="PhoneUIXAdapterInit"
            opcode="win:Start"
            channel="PhoneLogChannel"
            keywords="Performance PHONEUI"
            level="win:Informational"/>

          <event value="1051"
            symbol="PHONEAPPPERF_PhoneUIXAdapterInitialize_End"
            task="PhoneUIXAdapterInit"
            opcode="win:Stop"
            channel="PhoneLogChannel"
            keywords="Performance PHONEUI"
            level="win:Informational"/>

          <event value="1052"
            symbol="PHONEAPPPERF_VvmCodeModelInitialize_Begin"
            task="VvmCodeModelInit"
            opcode="win:Start"
            channel="PhoneLogChannel"
            keywords="Performance PHONEUI"
            level="win:Informational"/>

          <event value="1053"
            symbol="PHONEAPPPERF_VvmCodeModelInitialize_End"
            task="VvmCodeModelInit"
            opcode="win:Stop"
            channel="PhoneLogChannel"
            keywords="Performance PHONEUI"
            level="win:Informational"/>

          <event value="1500"
            level="win:Informational"
            symbol="UdmListAdapter_Invoke"
            message="$(string.Event.UdmListAdapter_Invoke)"
            template="TwoUints"
            keywords="Callhistory"/>
          
          <event value="1501"
            level="win:Informational"
            symbol="UdmListAdapter_SetEnumerator"
            message="$(string.Event.UdmListAdapter_SetEnumerator)"
            template="TwoPtrs"
            keywords="Callhistory"/>
          
          <event value="1502"
            level="win:Informational"
            symbol="CallbackNotAllowed"
            message="$(string.Publisher.CallbackNotAllowed)"
            template="FourBools"
            keywords="Callhistory"/>

          <event value="1600"
            level="win:Informational"
            symbol="FavoritesListObjectModel_Initialize"
            message="$(string.Publisher.FavoritesListObjectModel_Initialize)"
            template="OneString"
            keywords="Favorites"/>

          <event value="1601"
            level="win:Informational"
            symbol="FavoritesListObjectModel_AddItem"
            message="$(string.Publisher.FavoritesListObjectModel_AddItem)"
            template="OneHexInt"
            keywords="Favorites"/>

          <event value="1602"
            level="win:Informational"
            symbol="FavoritesListObjectModel_AddItemCompleted"
            message="$(string.Publisher.FavoritesListObjectModel_AddItemCompleted)"
            template="OneHexIntOneUint"
            keywords="Favorites"/>

          <event value="1603"
            level="win:Informational"
            symbol="FavoritesListObjectModel_DeleteItem"
            message="$(string.Publisher.FavoritesListObjectModel_DeleteItem)"
            template="OneHexInt"
            keywords="Favorites"/>

          <event value="1604"
            level="win:Informational"
            symbol="FavoritesListObjectModel_DeleteItemCompleted"
            message="$(string.Publisher.FavoritesListObjectModel_DeleteItemCompleted)"
            template="OneHexIntOneUint"
            keywords="Favorites"/>

          <event value="1605"
            level="win:Informational"
            symbol="FavoritesListPresenter_NotificationReceived"
            message="$(string.Publisher.FavoritesListPresenter_NotificationReceived)"
            template="OneStringAndOneUint"
            keywords="Favorites"/>
        </events>
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Event.CommsErrorOriginateMessage"                       value="Error: %1 Location: %2 Line Number: %3"/>   
        <string id="Event.CommsPropagateErrorMessage"                       value="Error Propagated: %1 Location: %2 Line Number: %3"/>
        <string id="Publisher.InvestigationString"                          value="%1"/>
        <string id="Publisher.VvmListSupplierNotification"                  value="VVM list supplier notified. Event: %1"/>
        <string id="Publisher.ProximitySensorFailure"                       value="ProximityPowerManagementEnable failed to set activated to %1 with error code %2"/>
        <string id="Event.UdmListAdapter_Invoke"                            value="Udm.Invoke Type=%1 Context=%2"/>
        <string id="Event.UdmListAdapter_SetEnumerator"                     value="UdmListAdapter.SetEnumerator OldEnumerator=%1 NewEnumerator=%2"/>
        <string id="Event.InitializingAudioFile"                            value="AudioFile initializing %1" />
        <string id="Event.ClosingAudioFile"                                 value="AudioFile closing %1" />
        <string id="Event.PlayAudioFile"                                    value="AudioFile initiating %2ms delay for playback of %1" />
        <string id="Event.PauseAudioFile"                                   value="AudioFile pause %1" />
        <string id="Event.AudioFileOpened"                                  value="AudioFile %1 opened; duration is %2 seconds" />
        <string id="Event.AudioFileSuppressedPauseNotification"             value="AudioFile suppressed pause notification because %1 already completed playback"/>
        <string id="Event.AudioFilePlaybackComplete"                        value="AudioFile %1 completed playback"/>
        <string id="Event.AudioFileNotifyingState"                          value="AudioFile %1 notifying of state change to %2"/>
        <string id="Event.AudioCodeModelIgnoringStateChange"                value="AudioCodeModel shut down; ignoring audio state change %1"/>
        <string id="Event.AudioCodeModelTurningRoutingOn"                   value="AudioCodeModel turning audio routing on; IsSpeakerphone = %1"/>
        <string id="Event.AudioCodeModelTurningRoutingOff"                  value="AudioCodeModel turning audio routing off"/>
        <string id="Event.AudioCodeModelSpeakerphoneStateChanged"           value="AudioCodeModel speakerphone state changed; enabled = %1"/>
        <string id="Event.AudioCodeModelPhoneStateChanged"                  value="AudioCodeModel phone state changed; active call count = %1"/>
        <string id="Event.AudioCodeModelSetSpeakerphone"                    value="AudioCodeModel called to set speakerphone; enable = %1; current state = %2" />
        <string id="Event.AudioCodeModelStateTransition"                    value="AudioCodeModel transitions from state %1 to %2." />
        
        <string id="Enums.AudioPlayback_Idle"                               value="AudioPlayback_Idle" />
        <string id="Enums.AudioPlayback_FileOpened"                         value="AudioPlayback_FileOpened" />
        <string id="Enums.AudioPlayback_WaitingToPlay"                      value="AudioPlayback_WaitingToPlay" />
        <string id="Enums.AudioPlayback_Playing"                            value="AudioPlayback_Playing" />
        <string id="Enums.AudioPlayback_Paused"                             value="AudioPlayback_Paused" />
        <string id="Enums.AudioPlayback_Complete"                           value="AudioPlayback_Complete" />
        <string id="Enums.AudioPlayback_ShutDown"                           value="AudioPlayback_ShutDown" />

        <string id="Publisher.CallbackNotAllowed"                           value="Callback not allowed. Item properties: emergency: %1; blocked: %2; number present: %3; is video and video disabled: %4" />

        <string id="Publisher.FavoritesListObjectModel_Initialize"          value="FavoritesListObjectModel: Initialized for line %1." />
        <string id="Publisher.FavoritesListObjectModel_AddItem"             value="FavoritesListObjectModel: Add item %1 initiated." />
        <string id="Publisher.FavoritesListObjectModel_AddItemCompleted"    value="FavoritesListObjectModel: Add item %1 completed (list size: %2)" />
        <string id="Publisher.FavoritesListObjectModel_DeleteItem"          value="FavoritesListObjectModel: Delete item %1 initiated." />
        <string id="Publisher.FavoritesListObjectModel_DeleteItemCompleted" value="FavoritesListObjectModel: Delete item %1 completed (index: %2)" />
        <string id="Publisher.FavoritesListPresenter_NotificationReceived"  value="FavoritesListPresenter: Notification '%1' received - %2 items in list." />
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
