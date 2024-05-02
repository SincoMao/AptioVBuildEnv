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
      <provider name="Microsoft-WindowsPhone-Comms-PhoneShellUI"
          guid="{A5347B8A-3C9C-4F07-9440-1E0C5CFCC9D0}"
          resourceFileName="PhoneShellUI.dll"
          messageFileName="PhoneShellUI.dll"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_PHONESHELLUI">

        <!--No channel info necessary-->
        <channels />

        <!--Keywords for Phone and Connectivity Name Space -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword name="Error"        mask="0x00000001" />
          <keyword name="Performance"  mask="0x00000002" />

          <keyword name="Debug"        mask="0x00000004" />
          <keyword name="PhoneDefault" mask="0x00000008" /> <!-- indicates events that will be logged with default settings on a retail device -->
          <keyword name="CONTROLLER"   mask="0x00000010" />
          <keyword name="CallMonitor"  mask="0x00000020" />
          <keyword name="CallInfoItem" mask="0x00000040" />
          <keyword name="PHONEUI"      mask="0x00000080" />
          <keyword name="SimSec"       mask="0x00000100" />
          <keyword name="Uix"          mask="0x00000200" />
          <keyword name="CallProgress" mask="0x00000400" />

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword name="Warning" mask="0x0000004000000000" />
        </keywords>
        <tasks>
          <task name="StartCall"    symbol="START_CALL"     value="1"/>
          <task name="EndCall"      symbol="END_CALL"       value="2"/>
          <task name="AnswerCall"   symbol="ANSWER_CALL"    value="3"/>
          <task name="IgnoreCall"   symbol="IGNORE_CALL"    value="4"/>
          <task name="IncomingCall" symbol="INCOMING_CALL"  value="6">
            <opcodes>
              <opcode name="NumberAvailable" symbol="CALLERID_NUMBER_AVAILABLE"  value="11" />
              <opcode name="Display"         symbol="INCOMING_DISPLAY"           value="12" />
            </opcodes>
          </task>
          <task name="PlayRing"         symbol="PLAY_RING"           value="7"/>
          <task name="SwapCalls"        symbol="SWAP_CALLS"          value="8"/>
          <task name="StartRinging"     symbol="START_RINGING"       value="9"/>
          <task name="MinimizeUI"       symbol="MINIMIZE_UI"         value="10"/>
          <task name="ExpandFromMinimized" symbol="EXPAND_FROM_MINIMIZED" value="11"/>
          <task name="Mute"             symbol="MUTE"                value="20"/>
          <task name="SpeakerPhone"     symbol="SPEAKERPHONE"        value="21"/>
          <task name="Hold"             symbol="HOLD"                value="22"/>
          <task name="Bluetooth"        symbol="BLUETOOTH"           value="23"/>
          <task name="SwitchCamera"     symbol="SWITCH_CAMERA"       value="24"/>
          <task name="StopEventSound"   symbol="STOPEVENTSOUND"      value="29"/>
          <task name="PowerMonitor"     symbol="POWERMONITOR"        value="30"/>
          <task name="SimSecUnlockPhone"  symbol="SIMSEC_UNLOCKPHONE" value="32"/>
          <task name="SimSecEnablePin"    symbol="SIMSEC_ENABLEPIN"   value="33"/>
          <task name="SimSecDisablePin"   symbol="SIMSEC_DISABLEPIN"  value="34"/>
          <task name="SimSecChangePin"    symbol="SIMSEC_CHANGEPIN"   value="35"/>
          <task name="SimSecChangePin2"   symbol="SIMSEC_CHANGEPIN2"  value="36"/>
          <task name="SimSecGetPin2"      symbol="SIMSEC_GETPIN2"     value="37"/>
          <task name="Vibrate"            symbol="VIBRATE"   value="38"/>
        </tasks>
        <!-- Enumeration strings -->
        <maps>
          <valueMap name="SimFunctionCall">
            <map value="0" message="$(string.Enums.PH_SIMSEC_GETPHONELOCKINGSTATE)"/>
            <map value="1" message="$(string.Enums.PH_SIMSEC_GETPHONELOCKEDSTATE)"/>
          </valueMap>

          <valueMap name="LineSimState">
            <map value="0" message="$(string.Enums.LineSimState_Unknown)"/>
            <map value="1" message="$(string.Enums.LineSimState_Active)"/>
            <map value="2" message="$(string.Enums.LineSimState_NoSim)"/>
            <map value="3" message="$(string.Enums.LineSimState_InvalidSim)"/>
            <map value="4" message="$(string.Enums.LineSimState_PinLocked)"/>
            <map value="5" message="$(string.Enums.LineSimState_PukLocked)"/>
            <map value="6" message="$(string.Enums.LineSimState_PinEnabled)"/>
            <map value="7" message="$(string.Enums.LineSimState_DisabledSim)"/>
          </valueMap>
            
          <valueMap name="PersoState">
            <map value="0" message="$(string.Enums.PersoState_Unknown)"/>
            <map value="1" message="$(string.Enums.PersoState_Ready)"/>
            <map value="2" message="$(string.Enums.PersoState_PinLocked)"/>
            <map value="3" message="$(string.Enums.PersoState_PukLocked)"/>
            <map value="4" message="$(string.Enums.PersoState_Blocked)"/>
          </valueMap>
            
          <valueMap name="SimSecDialog">
            <map value="0" message="$(string.Enums.SimSecDialog_EnterPin)"/>
            <map value="1" message="$(string.Enums.SimSecDialog_EnterPuk)"/>
            <map value="2" message="$(string.Enums.SimSecDialog_ChangePin)"/>
            <map value="3" message="$(string.Enums.SimSecDialog_EnablePin)"/>
            <map value="4" message="$(string.Enums.SimSecDialog_DisablePin)"/>
            <map value="5" message="$(string.Enums.SimSecDialog_SimDisabled)"/>
            <map value="6" message="$(string.Enums.SimSecDialog_SimInvalid)"/>
            <map value="7" message="$(string.Enums.SimSecDialog_PersoUnlocked)"/>
            <map value="8" message="$(string.Enums.SimSecDialog_EnterPuk_Perso)"/>
            <map value="9" message="$(string.Enums.SimSecDialog_ChangePin2)"/>            
            <map value="10" message="$(string.Enums.SimSecDialog_NotSet)"/>
          </valueMap>

          <valueMap name="SimPin">
            <map value="0"  message="$(string.Enums.SimPin_Pin1)"/>
            <map value="1"  message="$(string.Enums.SimPin_PHPin)"/>
            <map value="2"  message="$(string.Enums.SimPin_PHFPin)"/>
            <map value="3"  message="$(string.Enums.SimPin_Pin2)"/>
            <map value="4"  message="$(string.Enums.SimPin_NetPin)"/>
            <map value="5"  message="$(string.Enums.SimPin_NetSubPin)"/>
            <map value="6"  message="$(string.Enums.SimPin_CorpPin)"/>
            <map value="7"  message="$(string.Enums.SimPin_SPPin)"/>
            <map value="8"  message="$(string.Enums.SimPin_3GPP2_Net1Pin)"/>
            <map value="9"  message="$(string.Enums.SimPin_3GPP2_Net2Pin)"/>
            <map value="10" message="$(string.Enums.SimPin_3GPP2_SPPin)"/>
            <map value="11" message="$(string.Enums.SimPin_3GPP2_CorpPin)"/>
            <map value="12" message="$(string.Enums.SimPin_3GPP2_HRPDPin)"/>
            <map value="13" message="$(string.Enums.SimPin_3GPP2_UIMPin)"/>
            <map value="14" message="$(string.Enums.SimPin_NotSet)"/>
          </valueMap>

          <valueMap name="OnOffBoolean">
            <map value="0"  message="$(string.Enums.OFF)"/>
            <map value="1"  message="$(string.Enums.ON)"/>
          </valueMap>
          <valueMap name="TrueFalseBoolean">
            <map value="0"  message="$(string.Enums.FALSE)"/>
            <map value="1"  message="$(string.Enums.TRUE)"/>
          </valueMap>

          <!-- Keep in sync with the values in PhoneShellUIWatchdogs.h -->
          <valueMap name="PhoneShellUIWatchdogs">
            <map value="1"  message="$(string.Watchdog_PlayEventSoundWithVoiceText)"/>
            <map value="2"  message="$(string.Watchdog_StopEventSounds)"/>
            <map value="3"  message="$(string.Watchdog_Vibrate)"/>
            <map value="4"  message="$(string.Watchdog_DeviceOrientationMonitoringInit)"/>
            <map value="5"  message="$(string.Watchdog_DeviceOrientationMonitoringStart)"/>
            <map value="6"  message="$(string.Watchdog_DeviceOrientationMonitoringStop)"/>
            <map value="7"  message="$(string.Watchdog_DeviceOrientationMonitoringDeInit)"/>
          </valueMap>

          <valueMap name="CallProgressVisibleState">
            <map value="0" message="$(string.Enums.CallProgressVisibleState_PrimaryOnly)"/>
            <map value="1" message="$(string.Enums.CallProgressVisibleState_SecondaryOnly)"/>
            <map value="2" message="$(string.Enums.CallProgressVisibleState_Both)"/>
            <map value="3" message="$(string.Enums.CallProgressVisibleState_Neither)"/>
          </valueMap>

          <valueMap name="MinimizedInvokeAction">
            <map value="0" message="$(string.Enums.MinimizedInvokeAction_Conference)"/>
            <map value="1" message="$(string.Enums.MinimizedInvokeAction_Nothing)"/>
            <map value="2" message="$(string.Enums.MinimizedInvokeAction_OpenCallProgress)"/>
            <map value="3" message="$(string.Enums.MinimizedInvokeAction_Swap)"/>
            <map value="4" message="$(string.Enums.MinimizedInvokeAction_UnholdPrimaryAndOpenCallProgress)"/>
            <map value="5" message="$(string.Enums.MinimizedInvokeAction_UnholdSecondary)"/>
            <map value="6" message="$(string.Enums.MinimizedInvokeAction_Unlock)"/>
          </valueMap>

          <valueMap name="DeviceLockType">
            <map value="0" message="$(string.Enums.DeviceLockType_PasswordLocked)"/>
            <map value="1" message="$(string.Enums.DeviceLockType_ScreenLocked)"/>
            <map value="2" message="$(string.Enums.DeviceLockType_Unlocked)"/>
          </valueMap>

          <valueMap name="StreamState">
            <map value="0" message="$(string.Enums.StreamState_Initialized)"/>
            <map value="1" message="$(string.Enums.StreamState_ResourcesAcquired)"/>
            <map value="2" message="$(string.Enums.StreamState_Playing)"/>
            <map value="3" message="$(string.Enums.StreamState_Paused)"/>
            <map value="4" message="$(string.Enums.StreamState_Destroyed)"/>
          </valueMap>

          <valueMap name="StreamSource">
            <map value="0" message="$(string.Enums.StreamSource_Local)"/>
            <map value="1" message="$(string.Enums.StreamSource_Remote)"/>
          </valueMap>

          <valueMap name="PhoneCallType">
            <map value="0" message="$(string.Enums.PhoneCallType_AudioOnly)"/>
            <map value="1" message="$(string.Enums.PhoneCallType_AudioVideo)"/>
          </valueMap>

          <valueMap name="VideoCallTransitionState">
            <map value="0" message="$(string.Enums.PhoneVideoTransitionState_Idle)"/>
            <map value="1" message="$(string.Enums.PhoneVideoTransitionState_IncomingAdd)"/>
            <map value="2" message="$(string.Enums.PhoneVideoTransitionState_OutgoingAdd)"/>
            <map value="3" message="$(string.Enums.PhoneVideoTransitionState_OutgoingDrop)"/>
          </valueMap>

          <valueMap name="PhoneVideoTransitionError">
            <map value="0" message="$(string.Enums.PhoneVideoTransitionError_None)"/>
            <map value="1" message="$(string.Enums.PhoneVideoTransitionError_Rejected)"/>
          </valueMap>

          <valueMap name="SwitchLocalCamera">
            <map value="0" message="$(string.Enums.SwitchCamera_Front)"/>
            <map value="1" message="$(string.Enums.SwitchCamera_Back)"/>
          </valueMap>

          <valueMap name="DeviceOrientation">
            <map value="0" message="$(string.Enums.DeviceOrientation_Unknown)"/>
            <map value="1" message="$(string.Enums.DeviceOrientation_Portrait_Up)"/>
            <map value="2" message="$(string.Enums.DeviceOrientation_Landscape_Left)"/>
            <map value="4" message="$(string.Enums.DeviceOrientation_Portrait_Down)"/>
            <map value="8" message="$(string.Enums.DeviceOrientation_Landscape_Right)"/>
          </valueMap>

          <valueMap name="VideoQuality">
            <map value="0" message="$(string.Enums.VideoQuality_Low)"/>
            <map value="1" message="$(string.Enums.VideoQuality_Average)"/>
            <map value="2" message="$(string.Enums.VideoQuality_High)"/>
          </valueMap>

          <valueMap name="LowVideoQualityState">
            <map value="0" message="$(string.Enums.LowVideoQualityState_Idle)"/>
            <map value="1" message="$(string.Enums.LowVideoQualityState_Warning)"/>
            <map value="2" message="$(string.Enums.LowVideoQualityState_DropVideo)"/>
          </valueMap>

          <valueMap name="VideoTransitionTextState">
            <map value="0" message="$(string.Enums.VideoTransitionTextState_None)"/>
            <map value="1" message="$(string.Enums.VideoTransitionTextState_Requesting)"/>
            <map value="2" message="$(string.Enums.VideoTransitionTextState_Rejected)"/>
            <map value="3" message="$(string.Enums.VideoTransitionTextState_Timeout)"/>
            <map value="4" message="$(string.Enums.VideoTransitionTextState_Failed)"/>
          </valueMap>

          <valueMap name="VideoCallButtonPanelState">
            <map value="0" message="$(string.Enums.VideoCallButtonPanelState_Unknown)"/>
            <map value="1" message="$(string.Enums.VideoCallButtonPanelState_Show)"/>
            <map value="2" message="$(string.Enums.VideoCallButtonPanelState_ShowWithoutExpandedRow)"/>
            <map value="3" message="$(string.Enums.VideoCallButtonPanelState_Hide)"/>
            <map value="4" message="$(string.Enums.VideoCallButtonPanelState_RestartDismissTimerIfVisibleOrShow)"/>
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
            <data name="Prop_UnicodeString" inType="win:UnicodeString"  outType="xs:string"/>
          </template>
          <template tid="OneBool">
            <data name="Prop_BOOL"          inType="win:Boolean"        outType="xs:boolean"/>
          </template>
          <template tid="OneBoolTrueFalse">
            <data name="Prop_BOOL"          inType="win:UInt32"         map="TrueFalseBoolean"/>
          </template>
          <template tid="BoolAndHexInt">
            <data name="Prop_BOOL"          inType="win:Boolean"        outType="xs:boolean"/>
            <data name="HResult"            inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="TwoBools">
            <data name="Prop_BOOL1"          inType="win:Boolean"        outType="xs:boolean"/>
            <data name="Prop_BOOL2"          inType="win:Boolean"        outType="xs:boolean"/>
          </template>
          <template tid="ThreeBools">
            <data name="Prop_BOOL1"          inType="win:Boolean"        outType="xs:boolean"/>
            <data name="Prop_BOOL2"          inType="win:Boolean"        outType="xs:boolean"/>
            <data name="Prop_BOOL3"          inType="win:Boolean"        outType="xs:boolean"/>
          </template>
          <template tid="StringAndHResult">
            <data name="Prop_UnicodeString" inType="win:UnicodeString"  outType="xs:string"/>
            <data name="HResult"            inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="OneUInt">
            <data name="Prop_UInt32_1"      inType="win:UInt32"         outType="win:unsignedInt"/>
          </template>
          <template tid="TwoUInts">
            <data name="Prop_UInt32_1"      inType="win:UInt32"         outType="win:unsignedInt"/>
            <data name="Prop_UInt32_2"      inType="win:UInt32"         outType="win:unsignedInt"/>
          </template>
          <template tid="OneHexInt">
            <data name="Prop_HexInt32_1"    inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="TwoHexInts">
            <data name="Prop_HexInt32_1"    inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="Prop_HexInt32_2"    inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="ThreeHexInts">
            <data name="Prop_HexInt32_1"    inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="Prop_HexInt32_2"    inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="Prop_HexInt32_3"    inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="FourHexInts">
            <data name="Prop_HexInt32_1"    inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="Prop_HexInt32_2"    inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="Prop_HexInt32_3"    inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="Prop_HexInt32_4"    inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="OneHexIntOneHexUlonglong">
            <data name="Prop_HexInt32_1"    inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="Prop_HexInt64_2"    inType="win:UInt64"         outType="win:HexInt64"/>
          </template>
          <template tid="OneLineId">
            <data name="lineId"             inType="win:GUID"           outType="xs:GUID"/>
          </template>
          <template tid="OneUIntOneLineId">
            <data name="Prop_UInt32_1"      inType="win:UInt32"         outType="win:unsignedInt"/>
            <data name="lineId"             inType="win:GUID"           outType="xs:GUID"/>
          </template>
          <template tid="OneLineIdOneBool">
            <data name="lineId"             inType="win:GUID"           outType="xs:GUID"/>
            <data name="Prop_BOOL"          inType="win:Boolean"        outType="xs:boolean"/>
          </template>
          <template tid="UIntAndBool">
            <data name="Prop_UInt32"        inType="win:UInt32"         outType="win:unsignedInt"/>
            <data name="Prop_BOOL"          inType="win:Boolean"        outType="xs:boolean"/>
          </template>
          <template tid="GuidStringHexInt">
            <data name="Prop_Guid"          inType="win:GUID"           outType="xs:GUID"/>
            <data name="Prop_String"        inType="win:UnicodeString"  outType="xs:string"/>
            <data name="Prop_HexInt32"      inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="SimFunctionCall">
            <data name="function"           inType="win:UInt32"         map="SimFunctionCall"/>
            <data name="hr"                 inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="state"              inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="SimStateChange">
            <data name="oldState"           inType="win:UInt32"         map="LineSimState"/>
            <data name="newState"           inType="win:UInt32"         map="LineSimState"/>
            <data name="previousServiceOn"  inType="win:UInt32"         map="OnOffBoolean"/>
          </template>
          <template tid="SimSecDialogChoice">
            <data name="simState"           inType="win:UInt32"         map="LineSimState"/>
            <data name="dialogType"         inType="win:UInt32"         map="SimSecDialog"/>
            <data name="pinType"            inType="win:UInt32"         map="SimPin"/>
          </template>
          <template tid="SimSecShow">
            <data name="dialogType"         inType="win:UInt32"         map="SimSecDialog"/>
            <data name="pinType"            inType="win:UInt32"         map="SimPin"/>
            <data name="showing"            inType="win:UInt32"         map="TrueFalseBoolean"/>
          </template>
          <template tid="OneLineIdOneSimSecDialogChoiceOneBool">
            <data name="lineId"             inType="win:GUID"           outType="xs:GUID"/>
            <data name="dialogType"         inType="win:UInt32"         map="SimSecDialog"/>
            <data name="Prop_BOOL"          inType="win:Boolean"        outType="xs:boolean"/>
          </template>
          <template tid="HResultAndTwoInts">
            <data name="hr"                 inType="win:Int32"          outType="win:HResult"/>
            <data name="Prop_Int32_1"       inType="win:UInt32"/>
            <data name="Prop_Int32_2"       inType="win:UInt32"/>
          </template>
          <template tid="TwoSimSecDialogTypes">
            <data name="dialogType1"        inType="win:UInt32"         map="SimSecDialog"/>
            <data name="dialogType2"        inType="win:UInt32"         map="SimSecDialog"/>
          </template>
          <template tid="DialogTypePinType">
            <data name="dialogType"         inType="win:UInt32"         map="SimSecDialog"/>
            <data name="pinType"            inType="win:UInt32"         map="SimPin"/>
          </template>
          <template tid="DialogTypeAndInt">
            <data name="dialogType"         inType="win:UInt32"         map="SimSecDialog"/>
            <data name="Prop_Int32"         inType="win:UInt32"/>
          </template>
          <template tid="OperationTimedOut">
            <data name="OperationId"      inType="win:UInt32"     map="PhoneShellUIWatchdogs"/>
            <data name="OperationContext" inType="win:AnsiString" outType="xs:string"/>
            <data name="OperationTimeout" inType="win:UInt32"     outType="xs:unsignedInt"/>
            <data name="ElapsedTime"      inType="win:UInt32"     outType="xs:unsignedInt"/>
          </template>
          <template tid="OperationTimedOutComplete">
            <data name="OperationId"         inType="win:UInt32"     map="PhoneShellUIWatchdogs"/>
            <data name="OperationContext"    inType="win:AnsiString" outType="xs:string"/>
            <data name="OperationActualTime" inType="win:UInt32"     outType="xs:unsignedInt"/>
          </template>
          <template tid="CallProgressVisibleState">
            <data name="callProgressVisibleState" inType="win:UInt32"   map="CallProgressVisibleState"/>
          </template>
          <template tid="MinimizedState">
            <data name="newMinimizedCallId" inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="hintTextResourceId" inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="minimizedInvokeAction" inType="win:UInt32"      map="MinimizedInvokeAction"/>
          </template>
          <template tid="DeviceLockType">
            <data name="deviceLockType" inType="win:UInt32"   map="DeviceLockType"/>
          </template>
          <template tid="LineNotActionable">
            <data name="slotIdx" inType="win:UInt32" outType="win:unsignedInt"/>
            <data name="lineId" inType="win:GUID" outType="xs:GUID"/>
            <data name="simState" inType="win:UInt32" map="LineSimState"/>
            <data name="persoState" inType="win:UInt32" map="PersoState"/>
          </template>
          <template tid="VisibilityChanging">
            <data name="videoContextId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="visibility" inType="win:Boolean" outType="xs:boolean"/>
          </template>
          <template tid="VisibilityChanged">
            <data name="videoContextId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="desiredVisibility" inType="win:Boolean" outType="xs:boolean"/>
            <data name="visibility" inType="win:Boolean" outType="xs:boolean"/>
            <data name="hresult" inType="win:Int32" outType="win:HResult"/>
          </template>
          <template tid="StreamStateChange">
            <data name="videoContextId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="streamSource" inType="win:UInt32" map="StreamSource"/>
            <data name="streamState" inType="win:UInt32" map="StreamState"/>
          </template>
          <template tid="VideoConnection">
            <data name="streamSource" inType="win:UInt32" map="StreamSource"/>
            <data name="connectInProgress" inType="win:Boolean" outType="xs:boolean"/>
            <data name="session" inType="win:UInt32"/>
          </template>
          <template tid="VideoConnectCallback">
            <data name="streamSource" inType="win:UInt32" map="StreamSource"/>
            <data name="hresult" inType="win:Int32" outType="win:HResult"/>
            <data name="session" inType="win:UInt32"/>
          </template>
          <template tid="VideoConnected">
            <data name="streamSource" inType="win:UInt32" map="StreamSource"/>
            <data name="session" inType="win:UInt32"/>
          </template>
          <template tid="UpdateStreamState">
            <data name="streamSource" inType="win:UInt32" map="StreamSource"/>
            <data name="streamState" inType="win:UInt32" map="StreamState"/>
            <data name="Prop_UInt32_1" inType="win:UInt32" outType="win:unsignedInt"/>
            <data name="Prop_UInt32_2" inType="win:UInt32" outType="win:unsignedInt"/>
            <data name="Prop_UInt32_3" inType="win:UInt32" outType="win:unsignedInt"/>
          </template>
          <template tid="VideoCallDestroyComplete">
            <data name="callId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="hresult" inType="win:Int32" outType="win:HResult"/>
          </template>
          <template tid="PhoneCallTypeChanged">
            <data name="callId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="phoneCallType" inType="win:UInt32" map="PhoneCallType"/>
          </template>
          <template tid="VideoCallTransition">
            <data name="callId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="transitionState" inType="win:UInt32" map="VideoCallTransitionState"/>
          </template>
          <template tid="LocalCameraChanging">
            <data name="videoContextId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="switchCamera" inType="win:UInt32" map="SwitchLocalCamera"/>
          </template>
          <template tid="LocalCameraChanged">
            <data name="videoContextId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="switchCamera" inType="win:UInt32" map="SwitchLocalCamera"/>
            <data name="hresult" inType="win:Int32" outType="win:HResult"/>
          </template>
          <template tid="OrientationChanged">
            <data name="orientation" inType="win:UInt32" map="DeviceOrientation"/>
          </template>
          <template tid="VideoResolutionChanged">
            <data name="streamSource" inType="win:UInt32" map="StreamSource"/>
            <data name="Prop_UInt32_1" inType="win:UInt32" outType="win:unsignedInt"/>
            <data name="Prop_UInt32_2" inType="win:UInt32" outType="win:unsignedInt"/>
          </template>
          <template tid="PlayingIncomingVideoTransitionTone">
            <data name="callId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="count" inType="win:UInt32" outType="win:unsignedInt"/>
          </template>
          <template tid="RemoteVideoQualityChanged">
              <data name="videoContextId" inType="win:UInt32" outType="win:HexInt32"/>
              <data name="quality" inType="win:UInt32" map="VideoQuality"/>
          </template>
          <template tid="LowVideoQualityState">
              <data name="callId" inType="win:UInt32" outType="win:HexInt32"/>
              <data name="state" inType="win:UInt32" map="LowVideoQualityState"/>
              <data name="configValue" inType="win:UInt32" outType="win:unsignedInt"/>
              <data name="timerValue" inType="win:UInt32" outType="win:unsignedInt"/>
          </template>
          <template tid="VideoTransitionTextState">
            <data name="callId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="upgradeState" inType="win:UInt32" map="VideoCallTransitionState"/>
            <data name="upgradeError" inType="win:UInt32" map="PhoneVideoTransitionError"/>
            <data name="timerValue" inType="win:UInt32" outType="win:unsignedInt"/>
            <data name="oldTextState" inType="win:UInt32" map="VideoTransitionTextState"/>
            <data name="newTextState" inType="win:UInt32" map="VideoTransitionTextState"/>
          </template>
          <template tid="VideoCallButtonPanelState">
            <data name="callId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="videoButtonPanelState" inType="win:UInt32" map="VideoCallButtonPanelState"/>
          </template>
          <template tid="UpdateVideoCallPresenterShowState">
            <data name="callId" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="wasVideoCallProgressVisible" inType="win:Boolean" outType="xs:boolean"/>
            <data name="isVideoCall" inType="win:Boolean" outType="xs:boolean"/>
            <data name="visibility" inType="win:Boolean" outType="xs:boolean"/>
            <data name="videoTransition" inType="win:UInt32" map="VideoCallTransitionState"/>
          </template>
        </templates>
        <!--All the Events that can be published by this Publisher -->
        <events>
          <event value="1"
            symbol="CommsErrorOriginateEvent"
            level="win:Error"
            keywords="Error"
            template="CommsHrTemplate"
            message="$(string.Event.CommsErrorOriginateMessage)"/>

          <event value="2"
            symbol="CommsErrorPropagateEvent"
            level="win:Warning"
            keywords="Warning"
            template="CommsHrTemplate"
            message="$(string.Event.CommsPropagateErrorMessage)"/>

          <!-- simsec events (800) -->
          <event value="800"
            symbol="PHONE_EVENT_SIMFUNCTIONCALL"
            level="win:Informational"
            keywords="SimSec"
            template="SimFunctionCall"
            message="$(string.Publisher.SimFunctionCall)"/>

          <event value="801"
            symbol="PHONE_EVENT_SIM_CALL_RESULT"
            level="win:Informational"
            keywords="SimSec"
            template="StringAndHResult"
            message="$(string.Publisher.SimCallResult)"/>

          <event value="802"
            symbol="PHONE_EVENT_SIM_STATE_CHANGED"
            level="win:Informational"
            keywords="SimSec"
            template="SimStateChange"
            message="$(string.Publisher.SimStateChanged)"/>

          <event value="803"
            symbol="PHONE_EVENT_SIM_DIALOG_TYPE_FROM_SIM_STATE"
            level="win:Informational"
            keywords="SimSec"
            template="SimSecDialogChoice"
            message="$(string.Publisher.SimSecDialogTypeFromSimState)"/>

          <event value="804"
            symbol="PHONE_EVENT_SIM_GET_DIALOG_TYPE"
            level="win:Informational"
            keywords="SimSec"
            template="SimSecDialogChoice"
            message="$(string.Publisher.SimSecGetDialogType)"/>

          <event value="805"
            symbol="PHONE_EVENT_SIM_CHANGE_WHEN_DISABLED"
            level="win:Informational"
            keywords="SimSec"
            message="$(string.Publisher.SimSecChangeWhenDisabled)"/>

          <event value="806"
            symbol="PHONE_EVENT_SIM_UNLOCK_PHONE_REQUIRED"
            level="win:Informational"
            keywords="SimSec"
            template="OneLineIdOneSimSecDialogChoiceOneBool"
            message="$(string.Publisher.SimSecUnlockPhoneRequired)"/>

          <event value="807"
            symbol="PHONE_EVENT_SIM_START_SIMSEC_UI"
            level="win:Informational"
            keywords="SimSec"
            template="SimSecShow"
            message="$(string.Publisher.StartSimSecUI)"/>

          <event value="808"
            symbol="PHONE_EVENT_SIM_PINS_DONT_MATCH"
            level="win:Informational"
            keywords="SimSec"
            message="$(string.Publisher.SimSecMismatchedPins)"/>

          <event value="809"
            symbol="PHONE_EVENT_SIM_BAD_RETRY_COUNT"
            level="win:Informational"
            keywords="SimSec"
            template="HResultAndTwoInts"
            message="$(string.Publisher.SimSecBadRetryCount)"/>

          <event value="810"
            symbol="PHONE_EVENT_SIM_BAD_NEXT_DIALOG"
            level="win:Informational"
            keywords="SimSec"
            template="TwoSimSecDialogTypes"
            message="$(string.Publisher.SimSecBadNextDialog)"/>

          <event value="811"
            symbol="PHONE_EVENT_SIM_SUCCESSFUL_UNLOCK"
            level="win:Informational"
            keywords="SimSec"
            template="DialogTypePinType"
            message="$(string.Publisher.SimSecSuccesfulUnlock)"/>

          <event value="812"
            symbol="PHONE_EVENT_SIM_CLOSE_SIMSEC_UI"
            level="win:Informational"
            keywords="SimSec"
            message="$(string.Publisher.CloseSimSecUI)"/>

          <event value="813"
            symbol="PHONE_SPLASH_SIMSEC_HIDING"
            level="win:Informational"
            keywords="SimSec Uix"
            message="$(string.Publisher.HidingSimSecUISplash)"/>

          <event value="814"
            symbol="PHONE_SPLASH_SIMSEC_CLOSING"
            level="win:Informational"
            keywords="SimSec Uix"
            message="$(string.Publisher.ClosingSimSecUISplash)"/>

          <event value="815"
            symbol="PHONE_SPLASH_SIMSEC_NAVIGATETO"
            level="win:Informational"
            keywords="SimSec Uix"
            template="DialogTypeAndInt"
            message="$(string.Publisher.SimSecUINavigateTo)"/>

          <event value="816"
            symbol="PHONE_SPLASH_SIMSEC_SHOWING_ERROR_MESSAGEBOX"
            level="win:Informational"
            keywords="SimSec Uix"
            template="OneBool"
            message="$(string.Publisher.SimSecUIShowingErrorMessageBox)"/>

          <event value="817"
            symbol="PHONE_EVENT_SIMSEC_REFRESH_LINES"
            level="win:Informational"
            keywords="SimSec"
            template="OneUInt"
            message="$(string.Publisher.SimSecRefresh)"/>

          <event value="818"
            symbol="PHONE_EVENT_SIMSEC_UNLOCK"
            level="win:Informational"
            keywords="SimSec"
            template="OneLineId"
            message="$(string.Publisher.SimSecUnlock)"/>

          <event value="819"
            symbol="PHONE_EVENT_SIMSEC_ENABLEPIN"
            level="win:Informational"
            keywords="SimSec"
            template="OneLineId"
            message="$(string.Publisher.SimSecEnablePin)"/>

          <event value="820"
            symbol="PHONE_EVENT_SIMSEC_DISABLEPIN"
            level="win:Informational"
            keywords="SimSec"
            template="OneLineId"
            message="$(string.Publisher.SimSecDisablePin)"/>

          <event value="821"
            symbol="PHONE_EVENT_SIMSEC_CHANGEPIN"
            level="win:Informational"
            keywords="SimSec"
            template="OneLineId"
            message="$(string.Publisher.SimSecChangePin)"/>

          <event value="822"
            symbol="PHONE_EVENT_SIMSEC_CHANGEPIN2"
            level="win:Informational"
            keywords="SimSec"
            template="OneLineId"
            message="$(string.Publisher.SimSecChangePin2)"/>

          <event value="823"
            symbol="PHONE_EVENT_SIMSEC_GETPIN2"
            level="win:Informational"
            keywords="SimSec"
            template="OneLineId"
            message="$(string.Publisher.SimSecGetPin2)"/>

          <event value="824"
            symbol="PHONE_EVENT_SIMSEC_SLOTADDED"
            level="win:Informational"
            keywords="SimSec"
            template="OneUInt"
            message="$(string.Publisher.SimSecSlotAdded)"/>

          <event value="825"
            symbol="PHONE_EVENT_SIMSEC_SLOTUNLOCK"
            level="win:Informational"
            keywords="SimSec"
            template="OneUIntOneLineId"
            message="$(string.Publisher.SimSecSlotUnlock)"/>

          <event value="826"
            symbol="PHONE_EVENT_SIMSEC_LINE_NOT_ACTIONABLE"
            level="win:Informational"
            keywords="SimSec"
            template="LineNotActionable"
            message="$(string.Publisher.SimSecLineNotActionable)"/>

          <event value="827"
            symbol="PHONE_EVENT_SIMSEC_INVALID_WNF_INDEX"
            level="win:Informational"
            keywords="SimSec"
            template="ThreeHexInts"
            message="$(string.Publisher.SimSecInvalidWnfIndex)"/>
            
          <event value="828"
            symbol="PHONE_EVENT_SIMSEC_SLOT_UNLOCK_WNF"
            level="win:Informational"
            keywords="SimSec"
            template="OneUInt"
            message="$(string.Publisher.SimSecSlotUnlockWnf)"/>
            
          <event value="829"
            symbol="PHONE_EVENT_SIMSEC_SHELL_READY_WNF"
            level="win:Informational"
            keywords="SimSec"
            message="$(string.Publisher.SimSecShellReadyWnf)"/>

          <event value="830"
            symbol="PHONE_EVENT_SIMSEC_SHELL_READY"
            level="win:Informational"
            keywords="SimSec"
            message="$(string.Publisher.SimSecShellReady)"/>
                    
          <event value="831"
            symbol="PHONE_EVENT_SIMSEC_LOCKSCREEN_PINPAD_VISIBILITY_WNF"
            level="win:Informational"
            keywords="SimSec"
            message="$(string.Publisher.SimSecLockScreenPinPadVisibilityWnf)"/>
                 
          <event value="832"
            symbol="PHONE_EVENT_SIMSEC_LOCKSCREEN_PINPAD_VISIBILITY"
            level="win:Informational"
            keywords="SimSec"
            template="OneUInt"
            message="$(string.Publisher.SimSecLockScreenPinPadVisibility)"/>
                 
          <!-- UI Events (900) -->
          <event value="901"
            symbol="PHONE_PLAYEVENTSOUND_RESULT"
            level="win:Informational"
            keywords="PHONEUI"
            template="StringAndHResult"
            message="$(string.Publisher.PlayEventSoundResult)"/>

          <event value="904"
            symbol="PHONE_PROXIMITYSENSOR_FAILURE"
            level="win:Error"
            keywords="Error"
            template="BoolAndHexInt"
            message="$(string.Publisher.ProximitySensorFailure)"/>

          <event value="912"
            symbol="PHONE_UIXCALLSTATEFACADE_TURNSCREENON"
            level="win:Informational"
            keywords="PHONEUI"
            message="$(string.Publisher.TurnScreenOn)"/>

          <event value="914"
            symbol="PHONE_PROXIMITYSENSOR_SCREENTURNEDON"
            level="win:Informational"
            keywords="PHONEUI"
            template="OneBool"
            message="$(string.Publisher.ScreenTurnedOn)"/>

          <event value="915"
            symbol="PHONE_HARDWAREKEYBOARD_NOTFOUND"
            level="win:Informational"
            keywords="PHONEUI"
            template="OneHexInt"
            message="$(string.Publisher.HardwareKeyboardNotFound)"/>

          <event value="916"
            symbol="PHONE_WAITFORAPIREADY"
            level="win:Informational"
            keywords="PHONEUI"
            message="$(string.Publisher.WaitForPhoneApi)"/>

          <event value="917"
            symbol="PHONE_CREATE_CALLINFO_FOR_CALL"
            level="win:Informational"
            keywords="PHONEUI"
            template="OneHexInt"
            message="$(string.Publisher.CreateCallInfoForCall)"/>

          <event value="918"
            symbol="PHONE_SPLASH_LOADING_REALUI"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.SplashLoadingRealUi)"/>

          <event value="919"
            symbol="PHONE_SPLASH_INCOMINGCALLUI_VISIBLE"
            level="win:Informational"
            template="OneBool"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.SplashIncomingCallUIVisible)"/>

          <event value="920"
            symbol="PHONE_SPLASH_CPROG_SHOWINCOMINGCALLUI"
            level="win:Informational"
            template="OneBool"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.SplashCprogShowIncomingCallUI)"/>

          <event value="921"
            symbol="PHONE_ENDCALL_REQUESTED"
            level="win:Informational"
            template="OneHexInt"
            keywords="PHONEUI"
            message="$(string.Publisher.EndCallRequested)"/>

          <event value="922"
            symbol="PHONE_ENDCALL_AVAILABLE"
            level="win:Informational"
            template="BoolAndHexInt"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.EndCallAvailable)"/>

          <event value="923"
            symbol="PHONE_SPLASH_ENABLE_USERIDLE_TIMER"
            level="win:Informational"
            template="OneBool"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.EnableUserIdleTimer)"/>

          <event value="924"
            symbol="PHONE_SPLASH_MOUSEINTERACTIVE_CHANGED"
            level="win:Informational"
            template="OneBool"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.Splash_MouseInteractive_Changed)"/>

          <event value="925"
            symbol="PHONE_SPLASH_MASKEDAREA_VISIBLE"
            level="win:Informational"
            template="OneBool"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.Splash_MaskedArea_Visible)"/>

          <event value="926"
            symbol="PHONE_CALLPROGRESS_DISMISSED"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.CallProgress_Dismissed)"/>

          <event value="927"
            symbol="PHONE_CALLPROGRESS_VISIBILITYCHANGED"
            level="win:Informational"
            template="OneBool"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.CallProgress_VisibilityChanged)"/>

          <event value="928"
            symbol="PHONE_CALLPROGRESS_SHOW"
            level="win:Informational"
            template="OneHexInt"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.CallProgress_Show)"/>

          <event value="929"
            symbol="PHONE_CALLPROGRESS_HIDE"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.CallProgress_Hide)"/>

          <event value="930"
            symbol="PHONE_TEXTREPLY_DISMISSED"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.TextReply_Dismissed)"/>

          <event value="931"
            symbol="PHONE_TEXTREPLY_VISIBILITYCHANGED"
            level="win:Informational"
            template="OneBool"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.TextReply_VisibilityChanged)"/>

          <event value="932"
            symbol="PHONE_TEXTREPLY_SHOW"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.TextReply_Show)"/>

          <event value="933"
            symbol="PHONE_TEXTREPLY_HIDE"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.TextReply_Hide)"/>

          <event value="934"
            symbol="PHONE_INCOMINGCALL_DISMISSING"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.IncomingCall_Dismissing)"/>

          <event value="935"
            symbol="PHONE_INCOMINGCALL_SHOW"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.IncomingCall_Show)"/>

          <event value="936"
            symbol="PHONE_INCOMINGCALL_HIDE"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.IncomingCall_Hide)"/>

          <event value="937"
            symbol="PHONE_INCOMINGCALLRINGTONEMANAGER_CREATE"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.IncomingCallRingtoneManager_Create)"/>

          <event value="938"
            symbol="PHONE_INCOMINGCALL_STARTEDRINGING"
            level="win:Informational"
            template="OneHexInt"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.IncomingCall_StartedRinging)"/>

          <event value="939"
            symbol="OperationTimedOut"
            level="win:Error"
            template="OperationTimedOut"
            keywords="Error"
            message="$(string.Publisher.OperationTimedOut)"/>

          <event value="940"
            symbol="OperationTimedOutComplete"
            level="win:Error"
            template="OperationTimedOutComplete"
            keywords="Error"
            message="$(string.Publisher.OperationTimedOutComplete)"/>

          <event value="941"
            symbol="HIDING_MINIMIZED_CALL_UI"
            level="win:Informational"
            keywords="CONTROLLER"
            message="$(string.Publisher.HidingMinimizedCallUI)"/>

          <event value="942"
            symbol="SHOWING_MINIMIZED_CALL_UI"
            level="win:Informational"
            template="TwoHexInts"
            keywords="CONTROLLER"
            message="$(string.Publisher.ShowingMinimizedCallUI)"/>

          <event value="943"
            symbol="PHONE_STATE_CHANGE"
            level="win:Informational"
            keywords="CallMonitor"
            message="$(string.Publisher.PhoneStateChange)"/>

          <event value="944"
            symbol="PROVIDER_LINE_INFO_CHANGE"
            level="win:Informational"
            keywords="CallMonitor"
            message="$(string.Publisher.ProviderLineInfoChange)"/>

          <event value="945"
            symbol="PROVIDER_LINE_SERVICE_INFO_CHANGE"
            level="win:Informational"
            keywords="CallMonitor"
            message="$(string.Publisher.ProviderLineServiceInfoChange)"/>

          <event value="946"
            symbol="ACTION_AVAILABILITY_CHANGE"
            level="win:Informational"
            keywords="CallMonitor"
            message="$(string.Publisher.ActionAvailabilityChange)"/>

          <event value="947"
            symbol="UPDATING_INCOMING_CALL"
            level="win:Informational"
            template="ThreeHexInts"
            keywords="CallMonitor"
            message="$(string.Publisher.UpdatingIncomingCall)"/>

          <event value="948"
            symbol="UPDATING_PRIMARY_CALL"
            level="win:Informational"
            template="TwoHexInts"
            keywords="CallMonitor"
            message="$(string.Publisher.UpdatingPrimaryCall)"/>

          <event value="949"
            symbol="UPDATING_SECONDARY_CALL"
            level="win:Informational"
            template="TwoHexInts"
            keywords="CallMonitor"
            message="$(string.Publisher.UpdatingSecondaryCall)"/>

          <event value="950"
            symbol="CURRENT_CALL_MONITOR_STATE"
            level="win:Informational"
            template="FourHexInts"
            keywords="CallMonitor"
            message="$(string.Publisher.CurrentCallMonitorState)"/>

          <event value="951"
            symbol="CALLINFO_ITEM_PROPERTY_CHANGE"
            level="win:Informational"
            template="TwoHexInts"
            keywords="CONTROLLER"
            message="$(string.Publisher.CallInfoItemPropertyChange)"/>

          <event value="952"
            symbol="CALL_PROGRESS_VISIBLE_STATE"
            level="win:Informational"
            template="CallProgressVisibleState"
            keywords="CONTROLLER"
            message="$(string.Publisher.CallProgressVisibleState)"/>

          <event value="953"
            symbol="MINIMIZED_STATE_CHANGED"
            level="win:Informational"
            template="MinimizedState"
            keywords="CONTROLLER"
            message="$(string.Publisher.MinimizedStateChanged)"/>

          <event value="954"
            symbol="DEVICELOCK_TYPE"
            level="win:Informational"
            template="DeviceLockType"
            keywords="CONTROLLER"
            message="$(string.Publisher.DeviceLockType)"/>

          <event value="955"
            symbol="LAUNCHING_CALL_PROGRESS"
            level="win:Informational"
            template="OneHexInt"
            keywords="CONTROLLER"
            message="$(string.Publisher.LaunchingCallProgress)"/>

          <event value="956"
            symbol="PROCESSING_SYSTEM_STATE_CHANGE"
            level="win:Informational"
            keywords="CONTROLLER"
            message="$(string.Publisher.ProcessingSystemStateChange)"/>

          <event value="957"
            symbol="MINIMIZE_INVOKED"
            level="win:Informational"
            keywords="CONTROLLER"
            message="$(string.Publisher.MinimizeInvoked)"/>

          <event value="958"
            symbol="CALL_STATE_DESCRIPTION"
            level="win:Informational"
            template="TwoHexInts"
            keywords="CONTROLLER"
            message="$(string.Publisher.CallStateDescription)"/>

          <event value="959"
            symbol="AVAILABLE_ACTIONS_FOR_CALL_UPDATED"
            level="win:Informational"
            template="OneHexIntOneHexUlonglong"
            keywords="CallInfoItem"
            message="$(string.Publisher.AvailableActionsForCallUpdated)"/>

          <event value="960"
            symbol="STARTING_AUTO_DISMISS_TIMER"
            level="win:Informational"
            template="OneUInt"
            keywords="CallProgress"
            message="$(string.Publisher.StartingAutoDismissTimer)"/>

          <event value="961"
            symbol="PHONE_INCOMINGCALLRINGTONEMANAGER_UPDATE_INCOMING_CALL"
            level="win:Informational"
            template="OneHexInt"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.IncomingCallRingtoneManager_UpdateIncomingCall)"/>

          <event value="962"
            symbol="PHONE_INCOMINGCALL_UNLOCK_COMPLETE"
            level="win:Informational"
            template="ThreeBools"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.IncomingCallUnlockComplete)"/>

          <event value="963"
            symbol="PHONE_INCOMINGCALL_UNLOCK_UPDATE"
            level="win:Informational"
            template="OneBool"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.IncomingCallUnlockUpdate)"/>

          <event value="964"
            symbol="PHONE_VIDEOCALL_CREATE"
            level="win:Informational"
            template="TwoHexInts"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallCreate)"/>

          <event value="965"
            symbol="PHONE_VIDEOCALL_DESTROY"
            level="win:Informational"
            template="OneHexInt"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallDestroy)"/>

          <event value="966"
            symbol="PHONE_VIDEOCALL_VISIBLE_REQUEST"
            level="win:Informational"
            template="VisibilityChanging"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallVisibleRequest)"/>

          <event value="967"
            symbol="PHONE_VIDEOCALL_VISIBLE_COMPLETE"
            level="win:Informational"
            template="VisibilityChanged"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallVisibleComplete)"/>

          <event value="968"
            symbol="PHONE_VIDEOCALL_STREAMSTATE"
            level="win:Informational"
            template="StreamStateChange"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallStreamStateChange)"/>

          <event value="969"
            symbol="PHONE_VIDEOCALL_CONNECT"
            level="win:Informational"
            template="VideoConnection"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallConnect)"/>

          <event value="970"
            symbol="PHONE_VIDEOCALL_DISCONNECT"
            level="win:Informational"
            template="VideoConnection"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallDisconnect)"/>

          <event value="971"
            symbol="PHONE_VIDEOCALL_CONNECTING"
            level="win:Informational"
            template="VideoConnectCallback"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallConnecting)"/>

          <event value="972"
            symbol="PHONE_VIDEOCALL_UPDATESTREAMHANDLE"
            level="win:Informational"
            template="VideoConnected"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallUpdateStreamHandle)"/>

          <event value="973"
            symbol="PHONE_VIDEOCALL_UPDATESTREAMSTATE"
            level="win:Informational"
            template="UpdateStreamState"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallUpdateStreamState)"/>

          <event value="974"
            symbol="PHONE_VIDEOCALL_DESTROY_COMPLETE"
            level="win:Informational"
            template="VideoCallDestroyComplete"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallDestroyComplete)"/>

          <event value="975"
            symbol="PHONE_CALLTYPE_CHANGED"
            level="win:Informational"
            template="PhoneCallTypeChanged"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.PhoneCallTypeChanged)"/>

          <event value="976"
            symbol="PHONE_VIDEOCALL_TRANSITION_STATE_CHANGED"
            level="win:Informational"
            template="VideoCallTransition"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallTransitionState)"/>

          <event value="977"
            symbol="PHONE_VIDEOCALL_SWITCHCAMERA_REQUEST"
            level="win:Informational"
            template="LocalCameraChanging"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.LocalCameraChangeRequest)"/>

          <event value="978"
            symbol="PHONE_VIDEOCALL_SWITCHCAMERA_COMPLETE"
            level="win:Informational"
            template="LocalCameraChanged"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.LocalCameraChangeComplete)"/>

          <event value="979"
            symbol="PHONE_DEVICE_ORIENTATION_CHANGED"
            level="win:Informational"
            template="OrientationChanged"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.DeviceOrientationChanged)"/>

          <event value="980"
            symbol="PHONE_VIDEO_RESOLUTION_CHANGED"
            level="win:Informational"
            template="VideoResolutionChanged"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoResolutionChanged)"/>

          <event value="981"
            symbol="PHONE_REMOTE_VIDEOROTATION_CHANGED"
            level="win:Informational"
            template="OneUInt"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.RemoteVideoRotationChanged)"/>
      
          <event value="982"
            symbol="PHONE_UIXCALLSTATEFACADE_TURNSCREENOFF"
            level="win:Informational"
            keywords="PHONEUI"
            message="$(string.Publisher.TurnScreenOff)"/>

          <event value="983"
            symbol="PHONE_PLAYING_INCOMING_VIDEO_TRANSITION_TONE"
            level="win:Informational"
            template="PlayingIncomingVideoTransitionTone"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.PlayingIncomingVideoTransitionTone)"/>

          <event value="984"
            symbol="PHONE_REMOTE_VIDEOQUALITY_CHANGED"
            template="RemoteVideoQualityChanged"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.RemoteVideoQualityChanged)"/>

          <event value="985"
            symbol="PHONE_LOW_VIDEO_QUALITY_STATE"
            template="LowVideoQualityState"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.LowVideoQualityState)"/>

          <event value="986"
            symbol="PHONE_VIDEOCALL_INIT"
            level="win:Informational"
            template="OneHexInt"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallInitialize)"/>

          <event value="987"
            symbol="PHONE_VIDEO_TRANSITION_TEXT_STATE"
            template="VideoTransitionTextState"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoTransitionTextState)"/>

          <event value="988"
            symbol="PHONE_CALLPROGRESS_UI_ORIENTATION"
            template="OrientationChanged"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.CallprogreeUIOrientation)"/>

          <event value="989"
            symbol="PHONE_VIDEOCALL_BUTTON_PANEL_STATE_UPDATED"
            template="VideoCallButtonPanelState"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.VideoCallButtonPanelStateUpdated)"/>

          <event value="990"
            symbol="PHONE_VIDEOCALL_PRESENTER_SHOW_STATE_UPDATED"
            template="UpdateVideoCallPresenterShowState"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.UpdateVideoCallPresenterShowState)"/>

          <event value="991"
            symbol="CAMERA_IN_USE_CHECK"
            level="win:Informational"
            template="BoolAndHexInt"
            keywords="CONTROLLER"
            message="$(string.Publisher.CameraInUseCheck)"/>
          
          <event value="992"
            symbol="PHONE_REMINDME_DISMISSED"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.RemindMe_Dismissed)"/>

          <event value="993"
            symbol="PHONE_REMINDME_VISIBILITYCHANGED"
            level="win:Informational"
            template="OneBool"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.RemindMe_VisibilityChanged)"/>

          <event value="994"
            symbol="PHONE_REMINDME_SHOW"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.RemindMe_Show)"/>

          <event value="995"
            symbol="PHONE_REMINDME_HIDE"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.RemindMe_Hide)"/>
          
          <event value="999"
            symbol="PHONE_INVESTIGATIONAL"
            level="win:Informational"
            keywords="Debug Performance Uix"
            template="OneString"
            message="$(string.Publisher.InvestigationString)"/>

          <!-- Performance marker events -->
          <event value="1001"
            symbol="PHPERF_STARTCALL_END"
            task="StartCall"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1002"
            symbol="PHPERF_ENDCALL_BEGIN"
            task="EndCall"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1003"
            symbol="PHPERF_ENDCALL_END"
            task="EndCall"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1004"
            symbol="PHPERF_ANSWER_CALL_BEGIN"
            task="AnswerCall"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1005"
            symbol="PHPERF_ANSWERCALL_END"
            task="AnswerCall"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1006"
            symbol="PHPERF_IGNORECALL_BEGIN"
            task="IgnoreCall"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1007"
            symbol="PHPERF_IGNORECALL_END"
            task="IgnoreCall"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1008"
            symbol="PHPERF_VOIP_ANSWER_INCOMINGCALL_BEGIN"
            task="AnswerCall"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1009"
            symbol="PHPERF_MINIMIZE_UI_BEGIN"
            task="MinimizeUI"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1010"
            symbol="PHPERF_MINIMIZE_UI_END"
            task="MinimizeUI"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1011"
            symbol="PHPERF_SWAP_CALLS_BEGIN"
            task="SwapCalls"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1012"
            symbol="PHONESHELLUIPERF_INCOMINGCALLDISPLAY"
            task="IncomingCall"
            opcode="Display"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1014"
            symbol="PHONESHELLUIPERF_PLAYRING_BEGIN"
            task="PlayRing"
            opcode="win:Start"
            level="win:Verbose"
            keywords="PHONEUI Performance"/>

          <event value="1015"
            symbol="PHONESHELLUIPERF_PLAYRING_END"
            task="PlayRing"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1016"
            symbol="PHONESHELLUIPERF_STARTRINGING_BEGIN"
            task="StartRinging"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1017"
            symbol="PHONESHELLUIPERF_STARTRINGING_END"
            task="StartRinging"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1018"
            symbol="PHPERF_EXPAND_UI_BEGIN"
            task="ExpandFromMinimized"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1019"
            symbol="PHPERF_VOIP_EXPAND_UI_END"
            task="ExpandFromMinimized"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1020"
            symbol="PHONESHELLUIPERF_MUTE_BEGIN"
            task="Mute"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1021"
            symbol="PHONESHELLUIPERF_UNMUTE_BEGIN"
            task="Mute"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1022"
            symbol="PHPERF_CELLULAR_EXPAND_UI_END"
            task="ExpandFromMinimized"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1029"
            symbol="PHPERF_BTHANDSFREE_END"
            task="Bluetooth"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1030"
            symbol="PHPERF_SPEAKERPHONE_BEGIN"
            task="SpeakerPhone"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1033"
            symbol="PHPERF_SPEAKERPHONE_END"
            task="SpeakerPhone"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1034"
            symbol="PHPERF_HOLD_BEGIN"
            task="Hold"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1035"
            symbol="PHPERF_UNHOLD_BEGIN"
            task="Hold"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance Uix"/>

          <event value="1036"
            symbol="PHPERF_HOLD_END"
            task="Hold"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1037"
            symbol="PHPERF_MUTE_END"
            task="Mute"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1038"
            symbol="PHPERF_SWITCHCAMERA_END"
            task="SwitchCamera"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1046"
            symbol="PHONESHELLUIPERF_STOPEVENTSOUNDS_BEGIN"
            task="StopEventSound"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance PHONEUI"/>

          <event value="1047"
            symbol="PHONESHELLUIPERF_STOPEVENTSOUNDS_END"
            task="StopEventSound"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance PHONEUI"/>

          <event value="1048"
            symbol="PHONESHELLUIPERF_SIMSEC_UNLOCKPHONE_BEGIN"
            task="SimSecUnlockPhone"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance SimSec"/>

          <event value="1049"
            symbol="PHONESHELLUIPERF_SIMSEC_UNLOCKPHONE_END"
            task="SimSecUnlockPhone"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance SimSec"/>

          <event value="1050"
            symbol="PHONESHELLUIPERF_SIMSEC_ENABLEPIN_BEGIN"
            task="SimSecEnablePin"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance SimSec"/>

          <event value="1051"
            symbol="PHONESHELLUIPERF_SIMSEC_ENABLEPIN_END"
            task="SimSecEnablePin"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance SimSec"/>

          <event value="1052"
            symbol="PHONESHELLUIPERF_SIMSEC_DISABLEPIN_BEGIN"
            task="SimSecDisablePin"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance SimSec"/>

          <event value="1053"
            symbol="PHONESHELLUIPERF_SIMSEC_DISABLEPIN_END"
            task="SimSecDisablePin"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance SimSec"/>

          <event value="1054"
            symbol="PHONESHELLUIPERF_SIMSEC_CHANGEPIN_BEGIN"
            task="SimSecChangePin"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance SimSec"/>

          <event value="1055"
            symbol="PHONESHELLUIPERF_SIMSEC_CHANGEPIN_END"
            task="SimSecChangePin"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance SimSec"/>

          <event value="1056"
            symbol="PHONESHELLUIPERF_SIMSEC_CHANGEPIN2_BEGIN"
            task="SimSecChangePin2"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance SimSec"/>

          <event value="1057"
            symbol="PHONESHELLUIPERF_SIMSEC_CHANGEPIN2_END"
            task="SimSecChangePin2"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance SimSec"/>

          <event value="1058"
            symbol="PHONE_EVENT_SIM_CHANGEPIN2_WHEN_DISABLED"
            level="win:Informational"
            keywords="SimSec"
            message="$(string.Publisher.SimSecChangePin2WhenDisabled)"/>

          <event value="1059"
            symbol="PHONE_EVENT_SIM_GETPIN2_WHEN_DISABLED"
            level="win:Informational"
            keywords="SimSec"
            message="$(string.Publisher.SimSecGetPin2WhenDisabled)"/>

          <event value="1060"
            symbol="PHONESHELLUIPERF_SIMSEC_GETPIN2_BEGIN"
            task="SimSecGetPin2"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance SimSec"/>

          <event value="1061"
            symbol="PHONESHELLUIPERF_SIMSEC_GETPIN2_END"
            task="SimSecGetPin2"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance SimSec"/>
          
          <event value="1062"
            symbol="LAUNCH_EMERGENCY_CALL_DIALER"
            level="win:Informational"
            keywords="CONTROLLER"
            template="OneLineIdOneBool"
            message="$(string.Publisher.LaunchEmergencyCallDialer)"/>

          <event value="1063"
            symbol="PHONESHELLUIPERF_VIBRATE_BEGIN"
            task="Vibrate"
            opcode="win:Start"
            level="win:Verbose"
            keywords="PHONEUI Performance"/>

          <event value="1064"
            symbol="PHONESHELLUIPERF_VIBRATE_END"
            task="Vibrate"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="PHONEUI Performance"/>


          <!-- Addition PhoneShellUI Events (overflow from 999) -->
          <event value="1100"
            symbol="SHELL_GET_LOCKAPPHOST_FAILED"
            level="win:Informational"
            template="OneHexInt"
            keywords="CONTROLLER"
            message="$(string.Publisher.ShellGetLockAppHost)"/>

          <event value="1101"
            symbol="PER_SIM_SETTINGS_UPDATED"
            level="win:Informational"
            keywords="CallProgress"
            template="OneString"
            message="$(string.Publisher.PerSimSettingsUpdated)"/>

          <event value="1102"
            symbol="CORTANA_REMINDERS_AVAILABILITY"
            level="win:Informational"
            keywords="CONTROLLER"
            template="OneBool"
            message="$(string.Publisher.CortanaRemindersAvailability)"/>
          
          <event value="1103"
            symbol="LAUNCHING_CORTANA_REMINDERS"
            level="win:Informational"
            keywords="CONTROLLER"
            message="$(string.Publisher.CortanaRemindersLaunch)"/>

         <event value="1104"
            symbol="IGNORED_PROVIDER_LINE_SERVICE_INFO_UPDATE"
            level="win:Informational"
            template="OneHexInt"
            keywords="CallInfoItem"
            message="$(string.Publisher.ProviderLineServiceInfoUpdateIgnored)"/>

          <event value="1105"
             symbol="PROXIMITY_CONTROLLED_SPEAKER"
             level="win:Informational"
             template="OneBool"
             keywords="CONTROLLER"
             message="$(string.Publisher.ProximityControlledSpeaker)"/>
          
          <event value="1106"
             symbol="PROXIMITY_CONTROLLED_SPEAKER_REQUESTED"
             level="win:Informational"
             template="OneBool"
             keywords="CONTROLLER"
             message="$(string.Publisher.ProximityControlledSpeakerRequested)"/>

          <event value="1107"
             symbol="PROXIMITY_SET_SPEAKER"
             level="win:Informational"
             template="OneBool"
             keywords="CONTROLLER"
             message="$(string.Publisher.ProximitySetSpeaker)"/>

          <event value="1108"
            symbol="PHONE_INCOMINGCALL_STOPRINGING"
            level="win:Informational"
            keywords="PHONEUI Uix"
            message="$(string.Publisher.IncomingCall_StopRinging)"/>
              
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
        <string id="Publisher.SimSecRefresh"                                value="SimSecController: Found %1 simsec capable lines on refresh"/>
        <string id="Publisher.SimSecUnlock"                                 value="SimSecController: Unlocking line %1."/>
        <string id="Publisher.SimSecEnablePin"                              value="SimSecController: Enabling pin for line %1."/>
        <string id="Publisher.SimSecDisablePin"                             value="SimSecController: Disabling pin for line %1."/>
        <string id="Publisher.SimSecChangePin"                              value="SimSecController: Changing pin for line %1."/>
        <string id="Publisher.SimSecChangePin2"                             value="SimSecController: Changing pin2 for line %1."/>
        <string id="Publisher.SimSecGetPin2"                                value="SimSecController: Getting pin2 for line %1."/>
        <string id="Publisher.SimFunctionCall"                              value="SimCall: %1 returned hr = %2, state = %3"/>
        <string id="Publisher.SimCallResult"                                value="SimCall made - %1. Result: %2"/>
        <string id="Publisher.SimStateChanged"                              value="SimSecController detected change in SIM state from %1 to %2. Service on the line previously reported as on: %3."/>
        <string id="Publisher.SimSecDialogTypeFromSimState"                 value="SimSecController: For sim state %1, choosing dialog %2 for pin type %3."/>
        <string id="Publisher.SimSecGetDialogType"                          value="SimSecController: For sim state %1, final choice of dialog %2 for pin type %3."/>
        <string id="Publisher.SimSecChangeWhenDisabled"                     value="SimSecController: Tried to change the SIM Pin, but it's currently disabled."/>
        <string id="Publisher.SimSecUnlockPhoneRequired"                    value="SimSecController: Line %1 requires the following SIM Unlock dialog type: %2. UI disabled: %3"/>

        <string id="Publisher.SimSecShellReadyWnf"                          value="SimSecController: Got WNF update for shell ready."/>
        <string id="Publisher.SimSecShellReady"                             value="SimSecController: Shell is ready."/>
        <string id="Publisher.SimSecLockScreenPinPadVisibilityWnf"          value="SimSecController: Got WNF update for lock screen pin pad visibility changed."/>
        <string id="Publisher.SimSecLockScreenPinPadVisibility"             value="SimSecController: Lock screen pin pad is visible: %1."/>
        <string id="Publisher.SimSecSlotUnlockWnf"                          value="SimSecController: Slot %1 marked for unlock by WNF."/>
        <string id="Publisher.SimSecSlotAdded"                              value="SimSecController: Slot %1 added to the list for unlocking."/>
        <string id="Publisher.SimSecSlotUnlock"                             value="SimSecController: Slot %1 with associated line %2 scheduled for unlocking."/>
        <string id="Publisher.SimSecLineNotActionable"                      value="SimSecController: Slot %1 with associated line %2 not actionable yet. Line sim state: %3, Perso state: %4"/>
        <string id="Publisher.SimSecInvalidWnfIndex"                        value="SimSecController: Invalid index %3 received for slot %1. Current index for the slot: %2"/>
          
        <string id="Publisher.StartSimSecUI"                                value="SimSecViewBase: DialogType: %1, PinType: %2, Going to show? %3"/>
        <string id="Publisher.SimSecMismatchedPins"                         value="SimSecViewBase: The entered pins do not match"/>
        <string id="Publisher.SimSecBadRetryCount"                          value="SimSecViewBase: Tried to get retry count. Result: %1. Old retry count: %2, new count: %3"/>
        <string id="Publisher.SimSecBadNextDialog"                          value="SimSecViewBase: Reached a retry count of 0 for dialog %1 and we want to transition to %2, but this shouldn't happen."/>
        <string id="Publisher.SimSecSuccesfulUnlock"                        value="Successfully unlocked SIM via dialog %1 for pin type %2"/>
        <string id="Publisher.CloseSimSecUI"                                value="SimSecViewBase: Hiding the SimSec UI now"/>
        <string id="Publisher.HidingSimSecUISplash"                         value="Splash: Hiding SimSec UI as requested by the code model"/>
        <string id="Publisher.ClosingSimSecUISplash"                        value="Splash: SimSec UI has determined that it should close.  Now informing the code model."/>
        <string id="Publisher.SimSecUINavigateTo"                           value="Splash: SimSec UI navigating to dialog %1, page %2."/>
        <string id="Publisher.SimSecUIShowingErrorMessageBox"               value="Splash: SimSec UI is now showing an error messagebox: %1 "/>
        <string id="Publisher.PlayEventSoundResult"                         value="Event sound: %1, hr: %2"/>
        <string id="Publisher.ProximitySensorFailure"                       value="ProximityPowerManagementEnable failed to set activated to %1 with error code %2"/>
        <string id="Publisher.ScreenTurnedOn"                               value="Proximity Sensor: Screen turned on? : %1"/>
        <string id="Publisher.TurnScreenOn"                                 value="Controller: Turning screen on"/>
        <string id="Publisher.TurnScreenOff"                                value="Controller: Turning screen off"/>
        <string id="Publisher.HardwareKeyboardNotFound"                     value="Hardware Keyboard not found (hr: %1)"/>
        <string id="Publisher.WaitForPhoneApi"                              value="Waiting for the Phone API to get ready..."/>
        <string id="Publisher.CreateCallInfoForCall"                        value="Create CallInfo for Call: %1"/>
        <string id="Publisher.SplashLoadingRealUi"                          value="Splash: Loading Real UI..."/>
        <string id="Publisher.SplashIncomingCallUIVisible"                  value="Splash: Incoming Call UI - Visible: %1"/>
        <string id="Publisher.SplashCprogShowIncomingCallUI"                value="Splash: CallProgress - ShowIncomingCallUI=%1"/>
        <string id="Publisher.EndCallRequested"                             value="Requesting End Call (CallId=%1)"/>
        <string id="Publisher.EndCallAvailable"                             value="End Call Available: %1 (CallId=%2)"/>
        <string id="Publisher.EnableUserIdleTimer"                          value="Changing user idle timers on the device to: %1"/>
        <string id="Publisher.Splash_MouseInteractive_Changed"              value="Changing MainUI's UI.MouseInteractive to: %1"/>
        <string id="Publisher.Splash_MaskedArea_Visible"                    value="Changing MainUI's MaskedArea visibility to: %1"/>
        <string id="Publisher.CallProgress_Dismissed"                       value="Call Progress has been hidden from the user."/>
        <string id="Publisher.CallProgress_VisibilityChanged"               value="Changing Call Progress visibility to: %1"/>
        <string id="Publisher.CallProgress_Show"                            value="Call Progress Show() requested for CallId: %1"/>
        <string id="Publisher.CallProgress_Hide"                            value="Call Progress Hide() requested"/>
        <string id="Publisher.TextReply_Dismissed"                          value="The TextReply picker has been hidden from the user."/>
        <string id="Publisher.TextReply_VisibilityChanged"                  value="Changing the TextReplyPicker visibility to: %1"/>
        <string id="Publisher.TextReply_Show"                               value="TextReplyPicker Show() requested"/>
        <string id="Publisher.TextReply_Hide"                               value="TextReplyPicker Hide() requested"/>
        <string id="Publisher.RemindMe_Dismissed"                           value="The RemindMe has been hidden from the user."/>
        <string id="Publisher.RemindMe_VisibilityChanged"                   value="Changing the RemindMe visibility to: %1"/>
        <string id="Publisher.RemindMe_Show"                                value="RemindMe Show() requested"/>
        <string id="Publisher.RemindMe_Hide"                                value="RemindMe Hide() requested"/>
        <string id="Publisher.IncomingCall_Dismissing"                      value="Incoming Call is being hidden from the user."/>
        <string id="Publisher.IncomingCall_Show"                            value="IncomingCall Show() requested"/>
        <string id="Publisher.IncomingCall_Hide"                            value="IncomingCall Hide() requested"/>
        <string id="Publisher.SimSecChangePin2WhenDisabled"                 value="SimSecController: Tried to change the SIM Pin2, but it's currently disabled."/>
        <string id="Publisher.SimSecGetPin2WhenDisabled"                    value="SimSecController: Tried to acquire the SIM Pin2, but it's currently disabled."/>
        <string id="Publisher.HidingMinimizedCallUI"                        value="Hiding Minimized call UI."/>
        <string id="Publisher.ShowingMinimizedCallUI"                       value="Showing Minimized call UI for callId: %1, with hintTextResourceId: %2"/>
        <string id="Publisher.IncomingCallRingtoneManager_Create"           value="Creating IncomingCall RingtoneManager."/>
        <string id="Publisher.IncomingCallRingtoneManager_UpdateIncomingCall" value="Updating IncomingCall RingtoneManager for call %1"/>
        <string id="Publisher.IncomingCall_StartedRinging"                  value="Started ringing for incoming call %1.  Getting ready to display it to the user."/>
        <string id="Publisher.IncomingCall_StopRinging"                     value="Stopped ringing for incoming call."/>
        <string id="Publisher.OperationTimedOut"                            value='Operation "%1" timed out.  Context: %2.  Timeout value: %3ms.  Still waiting after: %4ms.'/>
        <string id="Publisher.OperationTimedOutComplete"                    value='Operation "%1" completed.  Context: %2.  Actual time: %3ms'/>
        <string id="Publisher.PhoneStateChange"                             value="Processing Phone State Change Event."/>
        <string id="Publisher.ProviderLineInfoChange"                       value="Processing ProviderLineInfo Change Event."/>
        <string id="Publisher.ProviderLineServiceInfoChange"                value="Processing ProviderLineServiceInfo Change Event."/>
        <string id="Publisher.ActionAvailabilityChange"                     value="Processing Action Availability Change Event."/>
        <string id="Publisher.UpdatingIncomingCall"                         value="Updating Incoming Call. Current Incoming CallId1: %1. Current Incoming CallId2: %2. New Incoming CallId: %3."/>
        <string id="Publisher.UpdatingPrimaryCall"                          value="Updating Primary Call. Current Primary CallId: %1. New Primary CallId: %2."/>
        <string id="Publisher.UpdatingSecondaryCall"                        value="Updating Secondary Call. Current Secondary CallId: %1. New Secondary CallId: %2."/>
        <string id="Publisher.AvailableActionsForCallUpdated"               value="Available Actions for CallId: %1 Updated. New set of actions: %2."/>
        <string id="Publisher.CurrentCallMonitorState"                      value="Current CallMonitor State: Incoming CallId: %1, Primary CallId: %2, Secondary CallId: %3, Active Call Count: %4"/>
        <string id="Publisher.CallInfoItemPropertyChange"                   value="CallInfoItem Property Changed. CallId: %1, Property: %2"/>
        <string id="Publisher.CallProgressVisibleState"                     value="Call Progress Visible State: %1"/>
        <string id="Publisher.MinimizedStateChanged"                        value="Minimized State Changed. New Minimized CallId: %1, Hint Text: %2, InvokeAction: %3"/>
        <string id="Publisher.DeviceLockType"                               value="Device Lock Type: %1"/>
        <string id="Publisher.LaunchingCallProgress"                        value="Launching Call Progress for CallId: %1"/>
        <string id="Publisher.ProcessingSystemStateChange"                  value="Processing Call Monitor System State Change notification."/>
        <string id="Publisher.MinimizeInvoked"                              value="User tapped on Minimized call."/>
        <string id="Publisher.CallStateDescription"                         value="Call State Description for CallId: %1 is %2"/>
        <string id="Publisher.StartingAutoDismissTimer"                     value="There are no active calls, but Call Progress is visible.  Starting %1ms auto-dismiss timer for Call Progress."/>
        <string id="Publisher.IncomingCallUnlockComplete"                   value="Incoming call: unlock complete: %1, old buttons enabled: %2, new buttons enabled: %3"/>
        <string id="Publisher.IncomingCallUnlockUpdate"                     value="Updating unlock complete: unlocked: %1"/>
        <string id="Publisher.VideoCallCreate"                              value="Create video call: call id: %1 context id: %2"/>
        <string id="Publisher.VideoCallInitialize"                          value="Initialize video call: context id: %1"/>
        <string id="Publisher.VideoCallDestroy"                             value="Destroy video call: context id: %1"/>
        <string id="Publisher.VideoCallVisibleRequest"                      value="Set video call visibility request: context id: %1, visible: %2"/>
        <string id="Publisher.VideoCallVisibleComplete"                     value="Video call visibility complete: context id: %1, desired visible: %2, visible: %3, result:%4"/>
        <string id="Publisher.VideoCallStreamStateChange"                   value="Video call stream state: context id: %1, source:%2, state: %3"/>
        <string id="Publisher.VideoCallConnect"                             value="Video call connect request source:%1, connect in progress:%2, handle:%3"/>
        <string id="Publisher.VideoCallDisconnect"                          value="Video call disconnect source:%1, connect in progress:%2, handle:%3"/>
        <string id="Publisher.VideoCallConnecting"                          value="Video call connecting source:%1, hr: %2, session: %3"/>
        <string id="Publisher.VideoCallUpdateStreamHandle"                  value="Update video stream handle source:%1, streamId: %2"/>
        <string id="Publisher.VideoCallUpdateStreamState"                   value="Update Stream state source: %1, play state: %2, visible: %3, stream state (local:%4, remote:%5)"/>
        <string id="Publisher.VideoCallDestroyComplete"                     value="Destroy video call complete: context id: %1, result=%2"/>
        <string id="Publisher.PhoneCallTypeChanged"                         value="Phone call type is changed (CallId:%1, type: %2)"/>
        <string id="Publisher.VideoCallTransitionState"                     value="Video call transition CallId:%1, state:%2"/>
        <string id="Publisher.LocalCameraChangeRequest"                     value="Switching local camera: context id: %1, camera: %2"/>
        <string id="Publisher.LocalCameraChangeComplete"                    value="Local camera has been switched: context id: %1, camera: %2, result:%3"/>
        <string id="Publisher.DeviceOrientationChanged"                     value="device orientation changed (orientation:%1)"/>
        <string id="Publisher.VideoResolutionChanged"                       value="video resolution change source:%1, width:%2, height:%3"/>
        <string id="Publisher.RemoteVideoRotationChanged"                   value="remote video rotation changed (rotation angle:%1)"/>
        <string id="Publisher.PlayingIncomingVideoTransitionTone"           value="Playing a tone for incoming video transition: call id: %1, count: %2"/>
        <string id="Publisher.RemoteVideoQualityChanged"                    value="Remove video quality changed: video context: %1, quality: %2"/>
        <string id="Publisher.LowVideoQualityState"                         value="Low video quality changed: call id: %1, state: %2, config value (ms): %3, timer value (ms): %4."/>
        <string id="Publisher.VideoTransitionTextState"                     value="Video transition text changed: call id: %1, upgrade state: %2, upgrade error: %3, timer value(ms): %4, text state: %5 -> %6."/>
        <string id="Publisher.CallprogreeUIOrientation"                     value="Call progress UI orientation changed: orientation: %1."/>
        <string id="Publisher.VideoCallButtonPanelStateUpdated"             value="Video call button panel state updated: call id: %1, button panel state: %2."/>
        <string id="Publisher.UpdateVideoCallPresenterShowState"            value="Show/Hide video call presenter: call id:%1, video call presenter was visible:%2, video call:%3, visibility:%4, video transition:%5"/>
        <string id="Publisher.CameraInUseCheck"                             value="Controller checking camera availability. Camera in use:%1, RmAvailabilityCheck result:%2"/>
        <string id="Publisher.LaunchEmergencyCallDialer"                    value="Controller requested to launch emergency call dialer. LineId: %1, ECBM state: %2"/>
        <string id="Publisher.ShellGetLockAppHost"                          value="Controller::_IsVoIPCallProgressUIVisibleAboveLock Shell_GetLockAppHost failed with: %1"/>
        <string id="Publisher.PerSimSettingsUpdated"                        value="Per sim settings updated for IMSI: %1"/>
        <string id="Publisher.CortanaRemindersAvailability"                 value="Cortana reminders availability: %1"/>
        <string id="Publisher.CortanaRemindersLaunch"                       value="Launching Cortana reminder flow"/>
        <string id="Publisher.ProviderLineServiceInfoUpdateIgnored"         value="Call (CallId %1) has already ended. Hence, ProviderLineServiceInfoUpdate ignored."/>
        <string id="Publisher.ProximityControlledSpeakerRequested"          value="Settings requests speaker controlled by proximity: %1"/>
        <string id="Publisher.ProximityControlledSpeaker"                   value="Speaker controlled by proximity: %1"/>
        <string id="Publisher.ProximitySetSpeaker"                          value="Proximity sets speaker to: %1"/>

        <string id="Enums.PH_SIMSEC_GETPHONELOCKINGSTATE"                   value="PH_SIMSEC_GETPHONELOCKINGSTATE"/>
        <string id="Enums.PH_SIMSEC_GETPHONELOCKEDSTATE"                    value="PH_SIMSEC_GETPHONELOCKEDSTATE"/>
        <string id="Enums.LineSimState_Unknown"                             value="LineSimState_Unknown"/>
        <string id="Enums.LineSimState_Active"                              value="LineSimState_Active"/>
        <string id="Enums.LineSimState_NoSim"                               value="LineSimState_NoSim"/>
        <string id="Enums.LineSimState_InvalidSim"                          value="LineSimState_InvalidSim"/>
        <string id="Enums.LineSimState_PinLocked"                           value="LineSimState_PinLocked"/>
        <string id="Enums.LineSimState_PukLocked"                           value="LineSimState_PukLocked"/>
        <string id="Enums.LineSimState_PinEnabled"                          value="LineSimState_PinEnabled"/>
        <string id="Enums.LineSimState_DisabledSim"                         value="LineSimState_DisabledSim"/>
          
        <string id="Enums.PersoState_Unknown"                               value="PersoState_Unknown"/>
        <string id="Enums.PersoState_Ready"                                 value="PersoState_Ready"/>
        <string id="Enums.PersoState_PinLocked"                             value="PersoState_PinLocked"/>
        <string id="Enums.PersoState_PukLocked"                             value="PersoState_PukLocked"/>
        <string id="Enums.PersoState_Blocked"                               value="PersoState_Blocked"/>

        <string id="Enums.SimSecDialog_EnterPin"                            value="SimSecDialog_EnterPin"/>
        <string id="Enums.SimSecDialog_EnterPuk"                            value="SimSecDialog_EnterPuk"/>
        <string id="Enums.SimSecDialog_ChangePin"                           value="SimSecDialog_ChangePin"/>
        <string id="Enums.SimSecDialog_EnablePin"                           value="SimSecDialog_EnablePin"/>
        <string id="Enums.SimSecDialog_DisablePin"                          value="SimSecDialog_DisablePin"/>
        <string id="Enums.SimSecDialog_SimDisabled"                         value="SimSecDialog_SimDisabled"/>
        <string id="Enums.SimSecDialog_SimInvalid"                          value="SimSecDialog_SimInvalid"/>
        <string id="Enums.SimSecDialog_PersoUnlocked"                       value="SimSecDialog_PersoUnlocked"/>
        <string id="Enums.SimSecDialog_EnterPuk_Perso"                      value="SimSecDialog_EnterPuk_Perso"/>
        <string id="Enums.SimSecDialog_ChangePin2"                          value="SimSecDialog_ChangePin2"/>
        <string id="Enums.SimSecDialog_NotSet"                              value="SimSecDialog_NotSet"/>
        <string id="Enums.SimPin_Pin1"                                      value="SimPin_Pin1"/>
        <string id="Enums.SimPin_PHPin"                                     value="SimPin_PHPin"/>
        <string id="Enums.SimPin_PHFPin"                                    value="SimPin_PHFPin"/>
        <string id="Enums.SimPin_Pin2"                                      value="SimPin_Pin2"/>
        <string id="Enums.SimPin_NetPin"                                    value="SimPin_NetPin"/>
        <string id="Enums.SimPin_NetSubPin"                                 value="SimPin_NetSubPin"/>
        <string id="Enums.SimPin_CorpPin"                                   value="SimPin_CorpPin"/>
        <string id="Enums.SimPin_SPPin"                                     value="SimPin_SPPin"/>
        <string id="Enums.SimPin_3GPP2_Net1Pin"                             value="SimPin_3GPP2_Net1Pin"/>
        <string id="Enums.SimPin_3GPP2_Net2Pin"                             value="SimPin_3GPP2_Net2Pin"/>
        <string id="Enums.SimPin_3GPP2_SPPin"                               value="SimPin_3GPP2_SPPin"/>
        <string id="Enums.SimPin_3GPP2_CorpPin"                             value="SimPin_3GPP2_CorpPin"/>
        <string id="Enums.SimPin_3GPP2_HRPDPin"                             value="SimPin_3GPP2_HRPDPin"/>
        <string id="Enums.SimPin_3GPP2_UIMPin"                              value="SimPin_3GPP2_UIMPin"/>
        <string id="Enums.SimPin_NotSet"                                    value="SimPin_NotSet"/>
        <string id="Enums.OFF"                                              value="OFF"/>
        <string id="Enums.ON"                                               value="ON"/>
        <string id="Enums.FALSE"                                            value="FALSE"/>
        <string id="Enums.TRUE"                                             value="TRUE"/>

        <!-- Watchdog strings -->
        <string id="Watchdog_PlayEventSoundWithVoiceText" value="PlayEventSoundWithVoiceText"/>
        <string id="Watchdog_StopEventSounds" value="StopEventSounds"/>
        <string id="Watchdog_Vibrate" value="Vibrate"/>
        <string id="Watchdog_DeviceOrientationMonitoringInit" value="DeviceOrientationMonitoringInit"/>
        <string id="Watchdog_DeviceOrientationMonitoringStart" value="DeviceOrientationMonitoringStart"/>
        <string id="Watchdog_DeviceOrientationMonitoringStop" value="DeviceOrientationMonitoringStop"/>
        <string id="Watchdog_DeviceOrientationMonitoringDeInit" value="DeviceOrientationMonitoringDeInit"/>

        <string id="Enums.CallProgressVisibleState_PrimaryOnly"             value="PrimaryOnly"/>
        <string id="Enums.CallProgressVisibleState_SecondaryOnly"           value="SecondaryOnly"/>
        <string id="Enums.CallProgressVisibleState_Both"                    value="Both"/>
        <string id="Enums.CallProgressVisibleState_Neither"                 value="Neither"/>
        <string id="Enums.MinimizedInvokeAction_Conference"                 value="Conference"/>
        <string id="Enums.MinimizedInvokeAction_Nothing"                    value="Nothing"/>
        <string id="Enums.MinimizedInvokeAction_OpenCallProgress"           value="OpenCallProgress"/>
        <string id="Enums.MinimizedInvokeAction_Swap"                       value="Swap"/>
        <string id="Enums.MinimizedInvokeAction_UnholdPrimaryAndOpenCallProgress"  value="UnholdPrimaryAndOpenCallProgress"/>
        <string id="Enums.MinimizedInvokeAction_UnholdSecondary"            value="UnholdSecondary"/>
        <string id="Enums.MinimizedInvokeAction_Unlock"                     value="Unlock"/>
        <string id="Enums.DeviceLockType_PasswordLocked"                    value="Password Locked"/>
        <string id="Enums.DeviceLockType_ScreenLocked"                      value="Screen Locked"/>
        <string id="Enums.DeviceLockType_Unlocked"                          value="Unlocked"/>
        <string id="Enums.StreamState_Initialized"                          value="Initialized"/>
        <string id="Enums.StreamState_ResourcesAcquired"                    value="ResourcesAcquired"/>
        <string id="Enums.StreamState_Playing"                              value="Playing"/>
        <string id="Enums.StreamState_Paused"                               value="Paused"/>
        <string id="Enums.StreamState_Destroyed"                            value="Destroyed"/>
        <string id="Enums.StreamSource_Local"                               value="Local"/>
        <string id="Enums.StreamSource_Remote"                              value="Remote"/>
        <string id="Enums.PhoneCallType_AudioOnly"                          value="Audio"/>
        <string id="Enums.PhoneCallType_AudioVideo"                         value="Video"/>
        <string id="Enums.PhoneVideoTransitionState_Idle"                   value="Idle"/>
        <string id="Enums.PhoneVideoTransitionState_IncomingAdd"            value="IncomingAdd"/>
        <string id="Enums.PhoneVideoTransitionState_OutgoingAdd"            value="OutgoingAdd"/>
        <string id="Enums.PhoneVideoTransitionState_OutgoingDrop"           value="OutgoingDrop"/>
        <string id="Enums.PhoneVideoTransitionError_None"                   value="NoError"/>
        <string id="Enums.PhoneVideoTransitionError_Rejected"               value="Rejected"/>
        <string id="Enums.SwitchCamera_Front"                               value="Front"/>
        <string id="Enums.SwitchCamera_Back"                                value="Back"/>
        <string id="Enums.DeviceOrientation_Unknown"                        value="Unknown"/>
        <string id="Enums.DeviceOrientation_Portrait_Up"                    value="Portrait Up"/>
        <string id="Enums.DeviceOrientation_Landscape_Left"                 value="Landscape Left"/>
        <string id="Enums.DeviceOrientation_Portrait_Down"                  value="Portrait Down"/>
        <string id="Enums.DeviceOrientation_Landscape_Right"                value="Landscape Right"/>
        <string id="Enums.VideoQuality_Low"                                 value="Low"/>
        <string id="Enums.VideoQuality_Average"                             value="Average"/>
        <string id="Enums.VideoQuality_High"                                value="High"/>
        <string id="Enums.LowVideoQualityState_Idle"                        value="Idle"/>
        <string id="Enums.LowVideoQualityState_Warning"                     value="Warning"/>
        <string id="Enums.LowVideoQualityState_DropVideo"                   value="DropVideo"/>
        <string id="Enums.VideoTransitionTextState_None"                    value="None"/>
        <string id="Enums.VideoTransitionTextState_Requesting"              value="Requesting"/>
        <string id="Enums.VideoTransitionTextState_Rejected"                value="Rejected"/>
        <string id="Enums.VideoTransitionTextState_Timeout"                 value="Timeout"/>
        <string id="Enums.VideoTransitionTextState_Failed"                  value="Failed"/>
        <string id="Enums.VideoCallButtonPanelState_Unknown"                value="Unknown"/>
        <string id="Enums.VideoCallButtonPanelState_Show"                   value="Show"/>
        <string id="Enums.VideoCallButtonPanelState_ShowWithoutExpandedRow" value="ShowWithoutExpandedRow"/>
        <string id="Enums.VideoCallButtonPanelState_Hide"                   value="Hide"/>
        <string id="Enums.VideoCallButtonPanelState_RestartDismissTimerIfVisibleOrShow" value="RestartDismissTimerIfVisibleOrShow"/>
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
