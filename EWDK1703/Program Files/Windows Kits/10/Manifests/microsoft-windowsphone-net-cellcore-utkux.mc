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


<provider name="Microsoft-WindowsPhone-Net-Cellcore-UtkUx"
  guid="{78ed7f6b-39ba-4418-b10e-c8ea6414cce9}"
  symbol="MICROSOFT_WINDOWSPHONE_Net_CELLCORE_UtkUx"
  messageFileName="NetCellcoreUtkUxProviderResources.dll"
  resourceFileName="NetCellcoreUtkUxProviderResources.dll">

<channels />

<keywords>
    <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
    <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
    <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
    <!-- Other keywords are provider-specific. -->
    <keyword mask="0x0000000000000004" name="Information" message="$(string.Keyword.Information)" />
    <keyword mask="0x0000000000000008" name="Trace" message="$(string.Keyword.Trace)" />
    <keyword mask="0x0000000000000010" name="FunctionTrace" message="$(string.Keyword.FunctionTrace)" />
    <keyword mask="0x0000000000000020" name="SetupMenu" message="$(string.Keyword.SetupMenu)" />
    <keyword mask="0x0000000000000040" name="ProactiveCmd" message="$(string.Keyword.ProactiveCmd)" />
    <keyword mask="0x0000000000000080" name="Uix" message="$(string.Keyword.Uix)" />
    <keyword mask="0x0000000000000100" name="MV" message="$(string.Keyword.MV)" />
</keywords>


<tasks>
    <task value="1" name="UtkUx" />
    <task value="2" name="Init" />
    <task value="3" name="Deinit" />
    <task value="4" name="WNF" />
    <task value="5" name="Uix" />
    <task value="6" name="MV" />
</tasks>


<templates>
    <template tid="tAnsiString">
      <data name="AnsiStringName" inType="win:AnsiString" outType="xs:string" />
    </template>

    <template tid="tAnsiStringAndHRESULT">
      <data name="AnsiStringName" inType="win:AnsiString" outType="xs:string" />
      <data name="HResultName" inType="win:Int32" outType="win:HResult" />
    </template>

    <template tid="tTwoAnsiStringAndHRESULT">
      <data name="AnsiStringName1" inType="win:AnsiString" outType="xs:string" />
      <data name="AnsiStringName2" inType="win:AnsiString" outType="xs:string" />
      <data name="HResultName" inType="win:Int32" outType="win:HResult" />
    </template>

    <template tid="tAnsiStringAndInt32">
      <data name="AnsiStringName" inType="win:AnsiString" outType="xs:string" />
      <data name="Int32Name" inType="win:Int32" outType="xs:int" />
    </template>

    <template tid="tAnsiStringAndTwoUInt32">
      <data name="AnsiStringName" inType="win:AnsiString" outType="xs:string" />
      <data name="UInt32Name1" inType="win:UInt32" outType="xs:unsignedInt" />
      <data name="UInt32Name2" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>

    <template tid="tTwoUnicodeString">
      <data name="UnicodeStringName1" inType="win:UnicodeString" outType="xs:string" />
      <data name="UnicodeStringName2" inType="win:UnicodeString" outType="xs:string" />
    </template>

    <template tid="tHRESULT">
      <data name="HResultName" inType="win:Int32" outType="win:HResult" />
    </template>

    <template tid="tHRESULTAndUInt32">
      <data name="HResultName" inType="win:Int32" outType="win:HResult" />
      <data name="UInt32Name" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>

    <template tid="tHRESULTAndTwoUInt32">
      <data name="HResultName" inType="win:Int32" outType="win:HResult" />
      <data name="UInt32Name1" inType="win:UInt32" outType="xs:unsignedInt" />
      <data name="UInt32Name2" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>

    <template tid="tInt32">
      <data name="Int32Name" inType="win:Int32" outType="xs:int" />
    </template>

    <template tid="tUInt32">
      <data name="UInt32Name" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>

    <template tid="tUInt32ToHex">
      <data name="UInt32Name" inType="win:UInt32" outType="win:HexInt32" />
    </template>

    <template tid="tTwoUInt32">
      <data name="UInt32Name1" inType="win:UInt32" outType="xs:unsignedInt" />
      <data name="UInt32Name2" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>

    <template tid="tTwoBoolean">
      <data name="BooleanName1" inType="win:Boolean" outType="xs:boolean" />
      <data name="BooleanName2" inType="win:Boolean" outType="xs:boolean" />
    </template>

    <template tid="tBoolean">
      <data name="BooleanName" inType="win:Boolean" outType="xs:boolean"/>
    </template>

    <template tid="tTwoGuid">
      <data name="GuidName1" inType="win:GUID" />
      <data name="GuidName2" inType="win:GUID" />
    </template>

    <template tid="tTwoDwordsHex">
      <data name="DwordName1" inType="win:UInt32" outType="win:HexInt32" />
      <data name="DwordName2" inType="win:UInt32" outType="win:HexInt32" />
    </template>

    <template tid="tUnicodeStringAndtDword">
      <data name="UnicodeStringName" inType="win:UnicodeString" />
      <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>
</templates>


<events>

<!-- utkuxdll EVENTS  -->
    <event value="100"
      symbol="_UtkUxDll_Attach"
      task="UtkUx"
      keywords="Performance"
      level="win:Informational"
      opcode="win:Start"
      message="$(string.Event.UtkUxDllAttach)" />

    <event value="101"
      symbol="_UtkUxDll_Detach"
      task="UtkUx"
      keywords="Performance"
      level="win:Informational"
      opcode="win:Stop"
      message="$(string.Event.UtkUxDllDetach)" />

<!-- UTKUX Function Trace EVENTS  -->
    <event value="102"
      symbol="_UtkUx_FunctionStart"
      task="UtkUx"
      keywords="FunctionTrace"
      level="win:Verbose"
      opcode="win:Start"
      template="tAnsiString"
      message="$(string.Event.UtkUxFunctionStart)" />

    <event value="103"
      symbol="_UtkUx_FunctionDone"
      task="UtkUx"
      keywords="FunctionTrace"
      level="win:Verbose"
      opcode="win:Stop"
      template="tAnsiString"
      message="$(string.Event.UtkUxFunctionDone)" />

<!-- Other UTKUX EVENTS -->
    <event value="104"
      symbol="_UtkUx_NullCurrentCmd"
      task="UtkUx"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiString"
      message="$(string.Event.UtkUxNullCurrentCmd)" />

    <event value="105"
      symbol="_UtkUx_NonNullCurrentCmd"
      task="UtkUx"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiString"
      message="$(string.Event.UtkUxNonNullCurrentCmd)" />

    <event value="106"
      symbol="_UtkUx_NullSetupMenu"
      task="UtkUx"
      keywords="Error SetupMenu"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiString"
      message="$(string.Event.UtkUxNullSetupMenu)" />

    <event value="107"
      symbol="_UtkUx_NoUrlInLB"
      task="UtkUx"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tUInt32ToHex"
      message="$(string.Event.UtkUxNoUrlInLB)" />

    <event value="108"
      symbol="_UtkUx_FailedRegisterWaitForSingleObject"
      task="UtkUx"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiString"
      message="$(string.Event.UtkUxFailedRegisterWaitForSingleObject)" />

    <event value="109"
      symbol="_UtkUx_WrongCmdTypeForHelpInTR"
      task="UtkUx"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tUInt32ToHex"
      message="$(string.Event.UtkUxWrongCmdTypeForHelpInTR)" />

    <event value="110"
      symbol="_UtkUx_WrongCmdTypeForOkInTR"
      task="UtkUx"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tUInt32ToHex"
      message="$(string.Event.UtkUxWrongCmdTypeForOkInTR)" />

    <event value="111"
      symbol="_UtkUx_WrongCmdTypeForSelInTR"
      task="UtkUx"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tUInt32ToHex"
      message="$(string.Event.UtkUxWrongCmdTypeForSelInTR)" />

    <event value="112"
      symbol="_UtkUx_WrongActionForTR"
      task="UtkUx"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tInt32"
      message="$(string.Event.UtkUxWrongActionForTR)" />

    <event value="113"
      symbol="_UtkUx_WrongActionForSetupMenu"
      task="UtkUx"
      keywords="Error SetupMenu"
      level="win:Error"
      opcode="win:Info"
      template="tInt32"
      message="$(string.Event.UtkUxWrongActionForSetupMenu)" />

    <event value="114"
      symbol="_UtkUx_FailedSendEnvelopeCmd"
      task="UtkUx"
      keywords="Error SetupMenu"
      level="win:Error"
      opcode="win:Info"
      template="tHRESULT"
      message="$(string.Event.UtkUxFailedSendEnvelopeCmd)" />

    <event value="115"
      symbol="_UtkUx_EnvelopeCmdIsSent"
      task="UtkUx"
      keywords="Information SetupMenu"
      level="win:Informational"
      opcode="win:Info"
      template="tInt32"
      message="$(string.Event.UtkUxEnvelopeCmdIsSent)" />

    <event value="116"
      symbol="_UtkUx_IncorrectEnvelopeCmdLength"
      task="UtkUx"
      keywords="Error SetupMenu"
      level="win:Error"
      opcode="win:Info"
      template="tTwoUInt32"
      message="$(string.Event.UtkUxIncorrectEnvelopeCmdLength)" />

    <event value="117"
      symbol="_UtkUx_GetDefaultDurationFromMv"
      task="UtkUx"
      keywords="Information ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      template="tTwoUInt32"
      message="$(string.Event.UtkUxGetDefaultDurationFromMv)" />

<!-- EVENTS in UTKUX::Initialize -->
    <event value="200"
      symbol="_Init_FailedSubscribeProactiveCmd"
      task="Init"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tHRESULT"
      message="$(string.Event.InitFailedSubscribeProactiveCmd)" />

    <event value="201"
      symbol="_Init_FailedSubscribeSetupMenu"
      task="Init"
      keywords="Error SetupMenu"
      level="win:Error"
      opcode="win:Info"
      template="tHRESULTAndUInt32"
      message="$(string.Event.InitFailedSubscribeSetupMenu)" />

    <event value="202"
      symbol="_Init_FailedQueryProactiveCmd"
      task="Init"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tHRESULT"
      message="$(string.Event.InitFailedQueryProactiveCmd)" />

    <!-- Event 203 is deprecated -->
    <event value="203"
      symbol="_Init_FailedRegOpenKeyEx"
      task="Init"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template="tHRESULT"
      message="$(string.Event.InitFailedRegOpenKeyEx)" />

    <event value="204"
      symbol="_Init_SetDefaultDuration"
      task="Init"
      keywords="Information ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      template="tUInt32"
      message="$(string.Event.InitSetDefaultDuration)" />

    <event value="205"
      symbol="_Init_SetGetInputDuration"
      task="Init"
      keywords="Information ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      template="tUInt32"
      message="$(string.Event.InitSetGetInputDuration)" />

    <!-- Event 206 is deprecated -->
    <event value="206"
      symbol="_Init_FailedRegCloseKey"
      task="Init"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template="tHRESULT"
      message="$(string.Event.InitFailedRegCloseKey)" />

    <event value="207"
      symbol="_Init_FailedRpcInitialize"
      task="Init"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiStringAndHRESULT"
      message="$(string.Event.InitFailedRpcInitialize)" />
  
    <event value="208"
      symbol="_Init_SetSlotIndexOfDisplayedSetupMenu"
      task="Init"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      template="tInt32"
      message="$(string.Event.InitSetSlotIndexOfDisplayedSetupMenu)" />

    <event value="209"
      symbol="_Init_FailedQuerySimFriendlyName"
      task="Init"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template="tHRESULTAndUInt32"
      message="$(string.Event.InitFailedQuerySimFriendlyName)" />
  
    <event value="210"
      symbol="_Init_FailedSubscribeSimFriendlyName"
      task="Init"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template="tHRESULTAndUInt32"
      message="$(string.Event.InitFailedSubscribeSimFriendlyName)" />

    <event value="211"
      symbol="_Init_SetFlagForRelaunch"
      task="Init"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      template="tBoolean"
      message="$(string.Event.InitSetFlagForRelaunch)" />

<!-- EVENTS in WNF callback -->
    <event value="400"
      symbol="_Wnf_RcvAndParseCmd"
      task="WNF"
      keywords="Information SetupMenu ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      template="tUInt32ToHex"
      message="$(string.Event.WnfRcvAndParseCmd)" />

    <event value="401"
      symbol="_Wnf_CmdAckedTwice"
      task="WNF"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiString"
      message="$(string.Event.WnfCmdAckedTwice)" />

    <event value="402"
      symbol="_Wnf_FailedAckCmd"
      task="WNF"
      keywords="Error SetupMenu ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiStringAndHRESULT"
      message="$(string.Event.WnfFailedAckCmd)" />

    <event value="403"
      symbol="_Wnf_CmdIsAcked"
      task="WNF"
      keywords="Information SetupMenu ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      template="tAnsiString"
      message="$(string.Event.WnfCmdIsAcked)" />

    <event value="404"
      symbol="_Wnf_UnsupportedCmdType"
      task="WNF"
      keywords="Error SetupMenu ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tUInt32ToHex"
      message="$(string.Event.WnfUnsupportedCmdType)" />

    <event value="405"
      symbol="_Wnf_IncorrectCmd"
      task="WNF"
      keywords="Error SetupMenu ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tUInt32ToHex"
      message="$(string.Event.WnfIncorrectCmd)" />

    <event value="406"
      symbol="_Wnf_FailedSendRsp"
      task="WNF"
      keywords="Error SetupMenu ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiStringAndHRESULT"
      message="$(string.Event.WnfFailedSendRsp)" />

    <event value="407"
      symbol="_Wnf_RspIsSent"
      task="WNF"
      keywords="Information SetupMenu ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      template="tAnsiStringAndInt32"
      message="$(string.Event.WnfRspIsSent)" />

    <event value="408"
      symbol="_Wnf_RspLengthTooLong"
      task="WNF"
      keywords="Error SetupMenu ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiStringAndTwoUInt32"
      message="$(string.Event.WnfRspLengthTooLong)" />

    <event value="409"
      symbol="_Wnf_RcvNullCmd"
      task="WNF"
      keywords="Information ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      message="$(string.Event.WnfRcvNullCmd)" />

    <!-- This event is deprecated -->
    <event value="410"
      symbol="_Wnf_CallingLaunchToast"
      task="WNF"
      keywords="Information ProactiveCmd"
      level="win:Verbose"
      opcode="win:Info"
      message="$(string.Event.WnfCallingLaunchToast)" />

    <event value="411"
      symbol="_Wnf_StartPlayEventSound"
      task="WNF"
      keywords="Information ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      template="tHRESULT"
      message="$(string.Event.WnfStartPlayEventSound)" />

    <event value="412"
      symbol="_Wnf_StopEventSounds"
      task="WNF"
      keywords="Information ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      template="tHRESULT"
      message="$(string.Event.WnfStopEventSounds)" />

    <event value="413"
      symbol="_Wnf_NonUiCmd"
      task="WNF"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tUInt32ToHex"
      message="$(string.Event.WnfNonUiCmd)" />

    <!-- This event is deprecated -->
    <event value="414"
      symbol="_Wnf_CheckForegroundAppAndObscurity"
      task="WNF"
      keywords="Information ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      template="tTwoBoolean"
      message="$(string.Event.WnfCheckForegroundAppAndObscurity)" />

    <!-- This event is deprecated -->
    <event value="415"
      symbol="_Wnf_ShellPostMessageToast"
      task="WNF"
      keywords="Information ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      template="tHRESULT"
      message="$(string.Event.WnfShellPostMessageToast)" />

    <event value="416"
      symbol="_Wnf_WrongEditBoxStringMinMaxLength"
      task="WNF"
      keywords="Error ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tTwoUInt32"
      message="$(string.Event.WnfWrongEditBoxStringMinMaxLength)" />

    <event value="417"
      symbol="_Wnf_RspIsNotSentNewCmd"
      task="WNF"
      keywords="Information SetupMenu ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      message="$(string.Event.WnfRspIsNotSentNewCmd)" />

    <event value="418"
      symbol="_Wnf_FailedGenerateTR"
      task="WNF"
      keywords="Information SetupMenu ProactiveCmd"
      level="win:Error"
      opcode="win:Info"
      template="tHRESULT"
      message="$(string.Event.WnfFailedGenerateTR)" />

    <event value="419"
      symbol="_Wnf_CrashedRpcCall"
      task="WNF"
      keywords="Error SetupMenu ProactiveCmd"
      level="win:Critical"
      opcode="win:Info"
      template="tTwoAnsiStringAndHRESULT"
      message="$(string.Event.WnfCrashedRpcCall)" />

    <event value="420"
      symbol="_Wnf_CheckForegroundApp"
      task="WNF"
      keywords="Information ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      template="tTwoGuid"
      message="$(string.Event.WnfCheckForegroundApp)"
    />

    <event value="421"
      symbol="_Wnf_SetSustainedTextForDisplayText"
      task="WNF"
      keywords="Information ProactiveCmd"
      level="win:Informational"
      opcode="win:Info"
      message="$(string.Event.WnfSetSustainedTextForDisplayText)"
    />

    <event value="422"
      symbol="_Wnf_WrongStateNameInFriendlyNameCallback"
      task="WNF"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template="tTwoDwordsHex"
      message="$(string.Event.WnfWrongStateNameInFriendlyNameCallback)"
    />

    <event value="423"
      symbol="_Wnf_WrongDataInFriendlyNameCallback"
      task="WNF"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template="tTwoUInt32"
      message="$(string.Event.WnfWrongDataInFriendlyNameCallback)"
    />

    <event value="424"
      symbol="_Wnf_CmdIsReceivedWhenUiIsExiting"
      task="WNF"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      template="tUInt32ToHex"
      message="$(string.Event.WnfCmdIsReceivedWhenUiIsExiting)"
    />

    <event value="425"
      symbol="_Wnf_FriendlyNameIsUpdatedWhenUiIsExiting"
      task="WNF"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      template="tUnicodeStringAndtDword"
      message="$(string.Event.WnfFriendlyNameIsUpdatedWhenUiIsExiting)"
    />
    
<!-- EVENTS related to UIX Get/Set methods -->
    <event value="500"
      symbol="_Uix_SetVisFlagAndConSelInd"
      task="Uix"
      keywords="Information Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tAnsiStringAndInt32"
      message="$(string.Event.UixSetVisFlagAndConSelInd)" />

    <event value="501"
      symbol="_Uix_SetActionToDeactTimer"
      task="Uix"
      keywords="Information Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tAnsiStringAndInt32"
      message="$(string.Event.UixSetActionToDeactTimer)" />

    <event value="502"
      symbol="_Uix_SetIsHelpAvailable"
      task="Uix"
      keywords="Information Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tAnsiStringAndInt32"
      message="$(string.Event.UixSetIsHelpAvailable)" />

    <event value="503"
      symbol="_Uix_GetSelectItemMenuList"
      task="Uix"
      keywords="Information ProactiveCmd Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tUInt32"
      message="$(string.Event.UixGetSelectItemMenuList)" />

    <event value="504"
      symbol="_Uix_GetSetupMenuList"
      task="Uix"
      keywords="Information SetupMenu Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tUInt32"
      message="$(string.Event.UixGetSetupMenuList)" />

    <event value="505"
      symbol="_Uix_GetMenuListNullCommand"
      task="Uix"
      keywords="Error Uix"
      level="win:Error"
      opcode="win:Info"
      message="$(string.Event.UixGetMenuListNullCommand)" />

    <event value="506"
      symbol="_Uix_GetNullMenuList"
      task="Uix"
      keywords="Information Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tUInt32ToHex"
      message="$(string.Event.UixGetNullMenuList)" />

    <event value="507"
      symbol="_Uix_NullEditBoxString"
      task="Uix"
      keywords="Error ProactiveCmd Uix"
      level="win:Error"
      opcode="win:Info"
      message="$(string.Event.UixNullEditBoxString)" />

    <event value="508"
      symbol="_Uix_ModifyEditBoxString"
      task="Uix"
      keywords="Information ProactiveCmd Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tUInt32"
      message="$(string.Event.UixModifyEditBoxString)" />

    <event value="510"
      symbol="_Uix_SetFlagForServiceLaunch"
      task="Uix"
      keywords="Information Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tUInt32"
      message="$(string.Event.UixSetFlagForServiceLaunch)" />

    <event value="511"
      symbol="_Uix_UiAboutToExit"
      task="Uix"
      keywords="Information Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tAnsiString"
      message="$(string.Event.UixUiAboutToExit)"
    />

    <!-- This event is deprecated -->
    <event value="512"
      symbol="_Uix_SetFlagForObscurity"
      task="Uix"
      keywords="Information Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tBoolean"
      message="$(string.Event.UixSetFlagForObscurity)"
    />

    <event value="513"
      symbol="_Uix_DurationTooLong"
      task="Uix"
      keywords="Information Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tTwoUInt32"
      message="$(string.Event.UixDurationTooLong)"
    />

    <event value="514"
      symbol="_Uix_InvalidSlotIndex"
      task="Uix"
      keywords="Error Uix"
      level="win:Error"
      opcode="win:Info"
      template="tTwoUInt32"
      message="$(string.Event.UixInvalidSlotIndex)"
    />

    <event value="515"
      symbol="_Uix_UpdateSimFriendlyName"
      task="Uix"
      keywords="Information Uix"
      level="win:Informational"
      opcode="win:Info"
      template="tUnicodeStringAndtDword"
      message="$(string.Event.UixUpdateSimFriendlyName)"
    />

    <event value="516"
      symbol="_Uix_FailedToLoadResourceDll"
      task="Uix"
      keywords="Error Uix"
      level="win:Error"
      opcode="win:Info"
      message="$(string.Event.UixFailedToLoadResourceDll)" 
    />

<!-- EVENTS related to MV Settings -->
    <event value="600"
      symbol="_MV_UnknownRadioType"
      task="MV"
      keywords="Error MV"
      level="win:Critical"
      opcode="win:Info"
      template="tUInt32ToHex"
      message="$(string.Event.MvUnknownRadioType)"
    />

    <event value="601"
      symbol="_MV_FailedToQueryRadioTypeWnf"
      task="MV"
      keywords="Error MV"
      level="win:Critical"
      opcode="win:Info"
      template="tHRESULTAndTwoUInt32"
      message="$(string.Event.MvFailedToQueryRadioTypeWnf)"
    />

    <event value="602"
      symbol="_MV_DefaultDurationGreaterThanMax"
      task="MV"
      keywords="Error MV"
      level="win:Error"
      opcode="win:Info"
      template="tTwoUInt32"
      message="$(string.Event.MvDefaultDurationGreaterThanMax)"
    />

    <event value="603"
      symbol="_MV_DefaultGetInputDurationGreaterThanMax"
      task="MV"
      keywords="Error MV"
      level="win:Error"
      opcode="win:Info"
      template="tTwoUInt32"
      message="$(string.Event.MvDefaultGetInputDurationGreaterThanMax)"
    />

    <event value="604"
      symbol="_MV_FailedToQueryConfiguredLinesWnf"
      task="MV"
      keywords="Error MV"
      level="win:Error"
      opcode="win:Info"
      template="tHRESULTAndTwoUInt32"
      message="$(string.Event.MvFailedToQueryConfiguredLinesWnf)"
    />

    <event value="605"
      symbol="_MV_FailedToQueryImsiWnf"
      task="MV"
      keywords="Error MV"
      level="win:Error"
      opcode="win:Info"
      template="tHRESULTAndTwoUInt32"
      message="$(string.Event.MvFailedToQueryImsiWnf)"
    />

    <event value="606"
      symbol="_MV_NumberOfImsisOutOfRange"
      task="MV"
      keywords="Error MV"
      level="win:Error"
      opcode="win:Info"
      template="tTwoUInt32"
      message="$(string.Event.MvNumberOfImsisOutOfRange)"
    />

</events>

</provider>
</events>
</instrumentation>


<localization>
<resources culture="en-US">
    <stringTable>

        <string id="Keyword.Error"                                  value="Error" />
        <string id="Keyword.Performance"                            value="Performance" />
        <string id="Keyword.Information"                            value="Information" />
        <string id="Keyword.Trace"                                  value="Trace" />
        <string id="Keyword.FunctionTrace"                          value="FunctionTrace" />
        <string id="Keyword.SetupMenu"                              value="SetupMenu" />
        <string id="Keyword.ProactiveCmd"                           value="ProactiveCmd" />
        <string id="Keyword.Uix"                                    value="Uix" />
        <string id="Keyword.MV"                                     value="MV" />

        <string id="Event.UtkUxDllAttach"                           value="[UtkUx] utkuxdll.dll is loaded" />
        <string id="Event.UtkUxDllDetach"                           value="[UtkUx] utkuxdll.dll is unloaded" />

        <string id="Event.UtkUxFunctionStart"                       value="[UtkUx] %1 starts" />
        <string id="Event.UtkUxFunctionDone"                        value="[UtkUx] %1 is done" />

        <string id="Event.UtkUxNullCurrentCmd"                      value="[UtkUx] %1: m_pCurrentCmd is NULL" />
        <string id="Event.UtkUxNonNullCurrentCmd"                   value="[UtkUx] %1: m_pCurrentCmd should be NULL, but it is not NULL" />
        <string id="Event.UtkUxNullSetupMenu"                       value="[UtkUx] %1: m_pSetupMenu is NULL" />
        <string id="Event.UtkUxNoUrlInLB"                           value="[UtkUx] UTKUX::LaunchBrowserWithGivenTaskId: m_pCurrentCmd (cmdType = %1 ) is Launch Browser but does not have a URL TLV" />
        <string id="Event.UtkUxFailedRegisterWaitForSingleObject"   value="[UtkUx] %1: RegisterWaitForSingleObject Failed" />
        <string id="Event.UtkUxWrongCmdTypeForHelpInTR"             value="[UtkUx] UTKUX::GenerateTerminalResponseBasedOnAction: Wrong cmdType (%1) for ACTIONTODEACTIVATEDURATIONTIMER_HELP" />
        <string id="Event.UtkUxWrongCmdTypeForOkInTR"               value="[UtkUx] UTKUX::GenerateTerminalResponseBasedOnAction: Wrong cmdType (%1) for ACTIONTODEACTIVATEDURATIONTIMER_OK" />
        <string id="Event.UtkUxWrongCmdTypeForSelInTR"              value="[UtkUx] UTKUX::GenerateTerminalResponseBasedOnAction: Wrong cmdType (%1) for ACTIONTODEACTIVATEDURATIONTIMER_ITEMSELECTED" />
        <string id="Event.UtkUxWrongActionForTR"                    value="[UtkUx] UTKUX::GenerateTerminalResponseBasedOnAction: Wrong action (%1) for generating the terminal response" />
        <string id="Event.UtkUxWrongActionForSetupMenu"             value="[UtkUx] UTKUX::SendEnvelopeCmdForSetupMenu: Wrong action (%1) for SetupMenu" />
        <string id="Event.UtkUxFailedSendEnvelopeCmd"               value="[UtkUx] UTKUX::SendEnvelopeCmdForSetupMenu: UtkSendEnvelope failed with hr=%1" />
        <string id="Event.UtkUxEnvelopeCmdIsSent"                   value="[UtkUx] UTKUX::SendEnvelopeCmdForSetupMenu: An envelope command (length = %1) is sent" />
        <string id="Event.UtkUxIncorrectEnvelopeCmdLength"          value="[UtkUx] UTKUX::SendEnvelopeCmdForSetupMenu: The length %1 of the envelope command is greater than the maximum length %2" />
        <string id="Event.UtkUxGetDefaultDurationFromMv"            value="[UtkUx] UTKUX::GetTimeoutValueFromMv: Get the default duration = %1ms and the default duration for Get Input = %2ms" />

        <string id="Event.InitFailedSubscribeProactiveCmd"          value="[UtkUx] UTKUX::QueryAndSubscribeWnfs: RtlSubscribeWnfStateChangeNotification failed for the proactive command with hr = %1" />
        <string id="Event.InitFailedSubscribeSetupMenu"             value="[UtkUx] UTKUX::QueryAndSubscribeWnfs: RtlSubscribeWnfStateChangeNotification failed for the setup menu of slot %2 with hr = %1" />
        <string id="Event.InitFailedQueryProactiveCmd"              value="[UtkUx] UTKUX::Initialize: RtlQueryWnfStateData failed for the proactive command with hr = %1" />
        <string id="Event.InitFailedRegOpenKeyEx"                   value="[UtkUX] UTKUX::GetTimeoutValueFromReg: RegOpenKeyEx failed with hr = %1" />
        <string id="Event.InitSetDefaultDuration"                   value="[UtkUX] UTKUX::GetTimeoutValueFromReg: the default timeout value is set to %1" />
        <string id="Event.InitSetGetInputDuration"                  value="[UtkUX] UTKUX::GetTimeoutValueFromReg: the default timeout value for Get Input is set to %1" />
        <string id="Event.InitFailedRegCloseKey"                    value="[UtkUX] UTKUX::GetTimeoutValueFromReg: RegOpenKeyEx failed with hr = %1" />
        <string id="Event.InitFailedRpcInitialize"                  value="[UtkUX] %1: RpcInitialize failed with hr = %2." />
        <string id="Event.InitSetSlotIndexOfDisplayedSetupMenu"     value="[UtkUx] UTKUX::SetSlotIndexOfDisplayedSetupMenu: The slot index of displayed Setup Menu is set to %1" />
        <string id="Event.InitFailedQuerySimFriendlyName"           value="[UtkUx] UTKUX::Initialize: Failed to query the SIM friendly name with hr = %1 for slot = %2" />
        <string id="Event.InitFailedSubscribeSimFriendlyName"       value="[UtkUx] UTKUX::QueryAndSubscribeWnfs: Failed to subscribe for the SIM friendly name with hr = %1 for slot = %2" />
        <string id="Event.InitSetFlagForRelaunch"                   value="[UtkUx] UTKUX::SetFlagForRelaunch: The relaunch flag is set to %1" />

        <string id="Event.WnfRcvAndParseCmd"                        value="[UtkUx] UTKUX::HandleWnf: A proactive command with cmdType = %1 is received and correctly parsed"/>
        <string id="Event.WnfCmdAckedTwice"                         value="[UtkUx] %1: The proactive command has already been acked before calling UtkAckCommand" />
        <string id="Event.WnfFailedAckCmd"                          value="[UtkUx] %1: Failed to ack the proactive command with hr = %2" />
        <string id="Event.WnfCmdIsAcked"                            value="[UtkUx] %1: The proactive command is acked" />
        <string id="Event.WnfUnsupportedCmdType"                    value="[UtkUx] UTKUX::HandleWnf: CmdType (%1) is not supported by UX" />
        <string id="Event.WnfIncorrectCmd"                          value="[UtkUx] UTKUX::HandleWnf: Failed to parse the proactive command with result = %1" />
        <string id="Event.WnfFailedSendRsp"                         value="[UtkUx] %1: Failed to send the terminal response with hr = %2 "/>
        <string id="Event.WnfRspIsSent"                             value="[UtkUx] %1: The terminal response (length = %2) is sent" />
        <string id="Event.WnfRspLengthTooLong"                      value="[UtkUx] %1: The response length %2 is larger than the maximum length %3" />
        <string id="Event.WnfRcvNullCmd"                            value="[UtkUx] UTKUX::HandleWnf: Received a NULL proactive command" />
        <string id="Event.WnfCallingLaunchToast"                    value="[UtkUx] UTKUX::SetFlagForObscurity: Calling LaunchToast()" />
        <string id="Event.WnfStartPlayEventSound"                   value="[UtkUx] UTKUX::ShowUIContent: Start playing the tone using PlayEventSound with hr = %1" />
        <string id="Event.WnfStopEventSounds"                       value="[UtkUx] UTKUX::HandleDurationTimer: Stop playing the tone using StopEventSounds with hr = %1" />
        <string id="Event.WnfNonUiCmd"                              value="[UtkUx] UTKUX::ShowUIContent: Received a non-UI command with cmdType = %1" />
        <string id="Event.WnfCheckForegroundAppAndObscurity"        value="[UtkUx] UTKUX::LaunchToast: Checking foreground app (ForegroundApp==UTK UI is %1) and obscurity (m_bObscured = %2)" />
        <string id="Event.WnfShellPostMessageToast"                 value="[UtkUx] UTKUX::LaunchToast: Shell_PostMessageToast has been called and returns hr = %1" />
        <string id="Event.WnfWrongEditBoxStringMinMaxLength"        value="[UtkUx] UTKUX::ShowUIContent: The minimum length %1 of the EditBox is greater than its maximum length %2" />
        <string id="Event.WnfRspIsNotSentNewCmd"                    value="[UtkUx] UTKUX::HandleDurationTimer: The terminal response is not sent because a new command arrives" />
        <string id="Event.WnfFailedGenerateTR"                      value="[UtkUx] UTKUX::HandleDurationTimer: GenerateTerminalResponseBasedOnAction failed with hr = %1" />
        <string id="Event.WnfCrashedRpcCall"                        value="[UtkUx] %1: The RPC call %2 crashed with hr = %3" />
        <string id="Event.WnfCheckForegroundApp"                    value="[UtkUx] UTKUX::IsUiInForeground: ForegroundApp = %1, UTK UI = %2"/>
        <string id="Event.WnfSetSustainedTextForDisplayText"        value="[UtkUx] UTKUX::HandleDurationTimer: SustainedTextForDisplayText is set to true"/>
        <string id="Event.WnfWrongStateNameInFriendlyNameCallback"  value="[UtkUx] HandleWnfStaticForSimFriendlyName: The WNF state name (=%1, %2) is wrong" />
        <string id="Event.WnfWrongDataInFriendlyNameCallback"       value="[UtkUx] HandleWnfStaticForSimFriendlyName: Either the actual data size (%1) is not equal to the expected value (%2) or the pointer buffer is NULL" />
        <string id="Event.WnfCmdIsReceivedWhenUiIsExiting"          value="[UtkUx] UTKUX::HandleWnf: A proactive command with type = 0x%1 is received when the UI is exiting" />
        <string id="Event.WnfFriendlyNameIsUpdatedWhenUiIsExiting"  value="[UtkUx] UTKUX::UpdateSimFriendlyName: The SIM friendly name is updated as %1 for slot %2 when the UI is exiting" />
        
        <string id="Event.UixSetVisFlagAndConSelInd"                value="[UtkUx] %1: m_visFlagAndContentSelIndex is set to %2" />
        <string id="Event.UixGetSelectItemMenuList"                 value="[UtkUx] UTKUX::GetMenuList: Get a SelectItem menu of slot %1 (i.e., pCommand = m_pCurrentCmd)" />
        <string id="Event.UixGetSetupMenuList"                      value="[UtkUx] UTKUX::GetMenuList: Get a SetupMenu menu of slot %1 (i.e., pCommand = m_pSetupMenuForSlot%1)" />
        <string id="Event.UixGetMenuListNullCommand"                value="[UtkUx] UTKUX::GetMenuList: pCommand is NULL" />
        <string id="Event.UixGetNullMenuList"                       value="[UtkUx] UTKUX::GetMenuList: pCommand with CmdType = %1 does not have a menu list" />
        <string id="Event.UixNullEditBoxString"                     value="[UtkUx] UTKUX::SetEditBoxTextString: pTextString is NULL" />
        <string id="Event.UixModifyEditBoxString"                   value="[UtkUx] UTKUX::ScanForInvalidCharactersAndDeleteThem: Invalid characters are deleted if they exist and the length of the current EditBox string is %1" />
        <string id="Event.UixSetIsHelpAvailable"                    value="[UtkUx] %1: m_bIsHelpAvailable is set to %2" />
        <string id="Event.UixSetActionToDeactTimer"                 value="[UtkUx] %1: m_actionToDeactivateDurationTimer is set to %2" />
        <string id="Event.UixSetFlagForServiceLaunch"               value="[UtkUx] UTKUX::SetFlagForServiceLaunch: m_bServiceLaunch is set to %1" />
        <string id="Event.UixUiAboutToExit"                         value="[UtkUx] %1: m_bUiExit is set to be TRUE, and UTK UX is about to exit" />
        <string id="Event.UixSetFlagForObscurity"                   value="[UtkUx] UTKUX::SetFlagForObscurity: m_bObscured is set to %1" />
        <string id="Event.UixDurationTooLong"                       value="[UtkUx] UTKUX::ShowUIContent: The timeout value %1 given by the Duration TLV is greater than the maximum one %2, so it is ignored and the timeout value is set to the maximum one"/>
        <string id="Event.UixInvalidSlotIndex"                      value="[UtkUx] The slot index (= %2) is invalid at line %1" />
        <string id="Event.UixUpdateSimFriendlyName"                 value="[UtkUx] UTKUX::UpdateSimFriendlyName: The SIM friendly name is updated as %1 for slot %2" />
        <string id="Event.UixFailedToLoadResourceDll"               value="[UtkUx] UTKUX::LaunchToast: Failed to load the resource dll C:\\Programs\\UtkUx\\UtkUxRes.dll" />

        <string id="Event.MvUnknownRadioType"                       value="[UtkUx] CMvSettings::CMvSettings: Got an unknown radio type = %1" />
        <string id="Event.MvFailedToQueryRadioTypeWnf"              value="[UtkUx] CMvSettings::CMvSettings: Either NtQueryWnfStateData fails for WNF_CELL_RADIO_TYPE_MODEM0 with hr = %1 or the returned data size %2 is not equal to the expected size = %3" />
        <string id="Event.MvDefaultDurationGreaterThanMax"          value="[UtkUx] CMvSettings::GetDefaultDuration: The default duration = %1ms set by MV is greater than the maximum one %2ms" />
        <string id="Event.MvDefaultGetInputDurationGreaterThanMax"  value="[UtkUx] CMvSettings::GetDefaultDurationForGetInput: The default duration for Get Input = %1ms set by MV is greater than the maximum one %2ms" />
        <string id="Event.MvFailedToQueryConfiguredLinesWnf"        value="[UtkUx] CMvSettings::GetExecutorIndexFromSlotIndex: Either NtQueryWnfStateData fails for WNF_CELL_CONFIGURED_LINES_CANx with hr = %1 or the returned data size %2 is not equal to the expected size = %3" />
        <string id="Event.MvFailedToQueryImsiWnf"                   value="[UtkUx] CMvSettings::GetImsiFromExecutorIndex: Either NtQueryWnfStateData fails for WNF_CELL_IMSI_CANx with hr = %1 or the returned data size %2 is not equal to the expected size = %3" />
        <string id="Event.MvNumberOfImsisOutOfRange"                value="[UtkUx] CMvSettings::GetImsiFromExecutorIndex: canImsi.cImsi = %1 is out of range (less than 0 or greater then %2)" />
      
    </stringTable>
</resources>
</localization>

</instrumentationManifest>
