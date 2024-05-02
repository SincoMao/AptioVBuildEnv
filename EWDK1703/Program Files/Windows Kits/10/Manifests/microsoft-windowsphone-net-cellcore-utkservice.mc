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


<provider name="Microsoft-WindowsPhone-Net-Cellcore-UtkService"
  guid="{60FF0474-CB0C-4189-AA4F-D8333F4A1EF3}"
  symbol="MICROSOFT_WINDOWSPHONE_Net_CELLCORE_UtkService"
  messageFileName="NetCellcoreUtkServiceProviderResources.dll"
  resourceFileName="NetCellcoreUtkServiceProviderResources.dll">

<channels />

<keywords>
    <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
    <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
    <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
    <!-- Other keywords are provider-specific. -->
    <keyword mask="0x0000000000000004" name="Information" message="$(string.Keyword.Information)" />
    <keyword mask="0x0000000000000008" name="Trace" message="$(string.Keyword.Trace)" />
</keywords>


<tasks>
  <task value="1" name="ServiceMain" />
  <task value="2" name="Cellular" />
  <task value="3" name="UTK" />
  <task value="4" name="RPC" />
  <task value="5" name="ClientLaunch" />
  <task value="9" name="UiData" />
</tasks>


<templates>
    <template tid="tDword-uInt">
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>

    <template tid="tDword-uIntAndDword-uInt">
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />
        <data name="dwCode2" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>

    <template tid="tDword-uIntAndDword-Hex">
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />
        <data name="dwCode2" inType="win:UInt32" outType="win:HexInt32" />
    </template>
    
    <template tid="tFourDwords">
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />
        <data name="dwCode2" inType="win:UInt32" outType="xs:HexInt32" />
        <data name="dwCode3" inType="win:UInt32" outType="xs:unsignedInt" />
        <data name="dwCode4" inType="win:UInt32" outType="xs:HexInt32" />        
    </template>

    <template tid="tDword-Hex">
        <data name="dwCode1" inType="win:UInt32" outType="win:HexInt32" />
    </template>

    <template tid="tGUID">
        <data name="guidCode1" inType="win:GUID" />
    </template>

    <template tid="tDwordAndGUID">
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />
        <data name="guidCode1" inType="win:GUID" />
    </template>

    <template tid="tGUIDAndDword">
        <data name="guidCode1" inType="win:GUID" />
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>

    <template tid="tGUIDAnd2Dwords">
        <data name="guidCode1" inType="win:GUID" />
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />
        <data name="dwCode2" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>

    <template tid="tGUIDAnd3Dwords">
        <data name="guidCode1" inType="win:GUID" />
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />
        <data name="dwCode2" inType="win:UInt32" outType="xs:unsignedInt" />
        <data name="dwCode3" inType="win:UInt32" outType="xs:unsignedInt" />        
    </template>

    <template tid="tHRESULTAndHex">
        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
        <data name="dwCode1" inType="win:UInt32" outType="win:HexInt32" />
    </template>   

    <template tid="tDwordAndtHRESULT">
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />    
        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
    </template>   

    <template tid="tAnsiStringAndtDwordAndtHRESULT">
        <data name="AnsiStringName" inType="win:AnsiString" />    
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />    
        <data name="HResult" inType="win:Int32" outType="win:HResult" />
    </template> 
    
    <template tid="tGUIDAndGUID">
        <data name="guidCode1" inType="win:GUID" />
        <data name="guidCode2" inType="win:GUID" />        
    </template>

    <template tid="tAnsiStringAndtDword">
        <data name="AnsiStringName" inType="win:AnsiString" />
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>

    <template tid="tUInt8">
        <data name="UInt8Name" inType="win:UInt8" outType="win:HexInt8" />
    </template>

    <template tid="tAnsiStringAndNtStatus">
        <data name="AnsiStringName" inType="win:AnsiString" />
        <data name="NtStatusName" inType="win:UInt32" outType="win:NTSTATUS" />
    </template>

    <template tid="tAnsiStringAndDword-Hex">
        <data name="AnsiStringName" inType="win:AnsiString" />
        <data name="DwordName" inType="win:UInt32" outType="win:HexInt32" />
    </template>

    <template tid="tAnsiString">
        <data name="AnsiStringName" inType="win:AnsiString" />
    </template>

    <template tid="tTwoBoolean">
        <data name="BooleanName1" inType="win:Boolean" outType="xs:boolean"/>
        <data name="BooleanName2" inType="win:Boolean" outType="xs:boolean"/>
    </template>

    <template tid="tBoolean">
        <data name="BooleanName" inType="win:Boolean" outType="xs:boolean"/>
    </template>

    <template tid="tAnsiStringAndtDwordAndtDword-Hex">
        <data name="AnsiStringName" inType="win:AnsiString" />    
        <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />    
        <data name="dwCode2" inType="win:UInt32" outType="win:HexInt32" />
    </template>

    <template tid="tUnicodeStringAndtDword">
      <data name="UnicodeStringName" inType="win:UnicodeString" />
      <data name="dwCode1" inType="win:UInt32" outType="xs:unsignedInt" />
    </template>
</templates>


<events>

<!-- SERVICE MAIN EVENTS  -->
    <event value="100"
      symbol="_UtkService_Attach"
      task="ServiceMain"
      keywords="Performance"
      level="win:Informational"
      opcode="win:Start"
      message="$(string.Event.UtkServiceAttach)" />

    <event value="101"
      symbol="_UtkService_Detach"
      task="ServiceMain"
      keywords="Performance"
      level="win:Informational"
      opcode="win:Stop"
      message="$(string.Event.UtkServiceDetach)" />

    <event value="102"
      symbol="_UtkService_Start"
      task="ServiceMain"
      keywords="Performance"
      level="win:Informational"
      opcode="win:Start"
      message="$(string.Event.UtkServiceStart)" />

    <event value="103"
      symbol="_UtkService_Stop"
      task="ServiceMain"
      keywords="Performance"
      level="win:Informational"
      opcode="win:Stop"
      message="$(string.Event.UtkServiceStop)" />

    <event value="104"
      symbol="_UtkService_NonNullHandleInDestructor"
      task="ServiceMain"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      message="$(string.Event.UtkServiceNonNullHandleInDestructor)" />

    <event value="201"
      symbol="_Cellular_OnModemAdded"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tGUID"
      message="$(string.Event.OnModemAdded)" />
      
    <event value="202"
      symbol="_Cellular_OnModemRemoved"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tGUID"
      message="$(string.Event.OnModemRemoved)" />
      
    <event value="203"
      symbol="_Cellular_OnModemExistenceDone"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      message="$(string.Event.OnModemExistenceDone)" />
   
    <event value="204"
      symbol="_Cellular_OnSlotAdded"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uInt"
      message="$(string.Event.OnSlotAdded)" />

    <event value="205"
      symbol="_Cellular_OnSlotRemoved"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uInt"
      message="$(string.Event.OnSlotRemoved)" />

    <event value="206"
      symbol="_Cellular_OnSlotExistenceDone"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      message="$(string.Event.OnSlotExistenceDone)" />

    <event value="207"
      symbol="_Cellular_OnSlotStateChanged"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uIntAndDword-uInt"
      message="$(string.Event.OnSlotStateChanged)" />

    <event value="208"
      symbol="_Cellular_OnUICCAdded"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uInt"
      message="$(string.Event.OnUICCAdded)" />

    <event value="209"
      symbol="_Cellular_OnUICCRemoved"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uInt"
      message="$(string.Event.OnUICCRemoved)" />

    <event value="210"
      symbol="_Cellular_OnFinished"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tHRESULTAndHex"
      message="$(string.Event.OnFinished)" />

    <event value="211"
      symbol="_Cellular_RegisterToolkitService"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uInt"      
      message="$(string.Event.RegisterToolkitService)" />

    <event value="212"
      symbol="_Celluar_DuplicatedSlot_Error"
      task="Cellular"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template="tDword-uIntAndDword-uInt"      
      message="$(string.Event.DuplicatedSlot_Error)" />

    <event value="213"
      symbol="_Cellular_CantFindSlot_Error"
      task="Cellular"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template="tDword-uIntAndDword-uInt"      
      message="$(string.Event.CantFindSlot_Error)" />

    <event value="214"
      symbol="_Cellular_InvalidSlotIndex_Error"
      task="Cellular"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template="tDword-uIntAndDword-uInt"
      message="$(string.Event.InvalidSlotIndex_Error)" />

    <event value="215"
      symbol="_Cellular_UpdateSimFriendlyName"
      task="Cellular"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tUnicodeStringAndtDword"
      message="$(string.Event.UpdateSimFriendlyName)" />

    <event value="216"
      symbol="_Cellular_SlotIndexNotMatch_Error"
      task="Cellular"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template="tDword-uIntAndDword-uInt"
      message="$(string.Event.SlotIndexNotMatch_Error)" />
      
    <event value="301"
      symbol="_UTK_ProactiveCommand"
      task="UTK"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-Hex"
      message="$(string.Event.ProactiveCommand)" />

    <event value="302"
      symbol="_UTK_InvalidProactiveCommand"
      task="UTK"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-Hex"
      message="$(string.Event.InvaildProactiveCommand)" />

    <event value="303"
      symbol="_UTK_CleaningUpWNF"
      task="UTK"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uInt"
      message="$(string.Event.CleaningUpWNF)" />

    <event value="304"
      symbol="_UTK_HandleAckOrTimeout"
      task="UTK"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uInt"
      message="$(string.Event.HandleAckOrTimeout)" />

    <event value="305"
      symbol="_UTK_LastCommandNotResponded"
      task="UTK"
      keywords="Trace"
      level="win:Warning"
      opcode="win:Info"
      template="tDword-uInt"
      message="$(string.Event.LastCommandNotResponded)" />

    <event value="306"
      symbol="_UTK_PrintHr"
      task="UTK"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDwordAndtHRESULT"
      message="$(string.Event.PrintHr)" />

    <event value="307"
      symbol="_UTK_PrintErrorHr"
      task="UTK"
      keywords="Trace"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiStringAndtDwordAndtHRESULT"
      message="$(string.Event.PrintErrorHr)" />

    <event value="308"
      symbol="_UTK_StartAckTimer"
      task="UTK"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      message="$(string.Event.StartAckTimer)" />

    <event value="309"
      symbol="_UTK_SubscribedUserActivityWnf"
      task="UTK"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tAnsiString"
      message="$(string.Event.SubscribedUserActivityWnf)" />

    <event value="310"
      symbol="_UTK_NoEventListInSetupEventList"
      task="UTK"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      message="$(string.Event.NoEventListInSetupEventList)" />

    <event value="311"
      symbol="_UTK_NullPtrOrWrongLength"
      task="UTK"
      keywords="Error"
      level="win:Warning"
      opcode="win:Info"
      template="tAnsiStringAndtDword"
      message="$(string.Event.NullPtrOrWrongLength)" />

    <event value="312"
      symbol="_UTK_SendEnvelopeCmdForUserActivity"
      task="UTK"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      message="$(string.Event.SendEnvelopeCmdForUserActivity)" />

    <event value="313"
      symbol="_UTK_FailedGetModuleHandle"
      task="UTK"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template="tAnsiString"
      message="$(string.Event.FailedGetModuleHandle)" />

    <event value="314"
      symbol="_UTK_UnsubscribedUserActivityWnf"
      task="UTK"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tAnsiString"
      message="$(string.Event.UnsubscribedUserActivityWnf)" />

    <event value="315"
      symbol="_UTK_NonZeroLengthForTouchActivity"
      task="UTK"
      keywords="Error"
      level="win:Warning"
      opcode="win:Info"
      template="tDword-uInt"
      message="$(string.Event.NonZeroLengthForTouchActivity)" />

    <event value="316"
      symbol="_UTK_SetupMenuIsPublished"
      task="UTK"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      message="$(string.Event.UTK_SetupMenuIsPublished)" />

    <event value="317"
      symbol="_UTK_ShellIsNotReadyOrScreenIsLocked"
      task="UTK"
      keywords="Information"
      level="win:Warning"
      opcode="win:Info"
      template="tTwoBoolean"
      message="$(string.Event.UTK_ShellIsNotReadyOrScreenIsLocked)" />

    <event value="318"
      symbol="_UTK_TrIsSentbyInternal"
      task="UTK"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      template="tAnsiStringAndtDwordAndtDword-Hex"
      message="$(string.Event.UTK_TrIsSentbyInternal)" />

    <event value="319"
      symbol="_UTK_ShellIsNotReady"
      task="UTK"
      keywords="Information"
      level="win:Warning"
      opcode="win:Info"
      template="tBoolean"
      message="$(string.Event.UTK_ShellIsNotReady)" />

    <event value="320"
      symbol="_UTK_ScreenIsLocked"
      task="UTK"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      message="$(string.Event.UTK_ScreenIsLocked)" />

    <event value="321"
      symbol="_UTK_OneLeftOverCmdForThisSlot"
      task="UTK"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uInt"
      message="$(string.Event.UTK_OneLeftOverCmdForThisSlot)" />

    <event value="322"
      symbol="_UTK_OneLeftOverCmdButNotForThisSlot"
      task="UTK"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uInt"
      message="$(string.Event.UTK_OneLeftOverCmdButNotForThisSlot)" />

    <event value="323"
      symbol="_UTK_NoLeftOverCmd"
      task="UTK"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      message="$(string.Event.UTK_NoLeftOverCmd)" />

    <event value="401"
      symbol="_RPC_AckCommand"
      task="RPC"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tGUIDAnd2Dwords"
      message="$(string.Event.AckCommand)" />

    <event value="402"
      symbol="_RPC_SendCommandResponse"
      task="RPC"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tGUIDAnd3Dwords"
      message="$(string.Event.SendCommandResponse)" />

    <event value="403"
      symbol="_RPC_SendEnvelope"
      task="RPC"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tGUIDAndDword"
      message="$(string.Event.SendEnvelope)" />

    <event value="404"
      symbol="_RPC_CannotHandleRequestDueToNullUicc"
      task="RPC"
      keywords="Trace"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiStringAndtDword"      
      message="$(string.Event.CannotHandleRequestDueToNullUicc)" />

    <event value="405"
      symbol="_RPC_RequestForInvalidCommand"
      task="RPC"
      keywords="Trace"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiStringAndtDword"
      message="$(string.Event.RequestForInvalidCommand)" />

    <event value="406"
      symbol="_RPC_InvalidResponse"
      task="RPC"
      keywords="Trace"
      level="win:Error"
      opcode="win:Info"
      template="tAnsiStringAndtDword"
      message="$(string.Event.InvalidResponse)" />

    <event value="407"
      symbol="_RPC_FailedSecurityCall"
      task="RPC"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template="tAnsiStringAndNtStatus"
      message="$(string.Event.FailedSecurityCall)" />

    <event value="408"
      symbol="_RPC_FailedInitDeinitCall"
      task="RPC"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template="tAnsiStringAndDword-Hex"
      message="$(string.Event.FailedInitDeinitCall)" />

    <event value="501"
      symbol="_UI_ForegroundApp"
      task="ClientLaunch"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tGUIDAndGUID"
      message="$(string.Event.LaunchForegroundApp)" />
      
    <event value="502"
      symbol="_UI_IsShellReady"
      task="ClientLaunch"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uIntAndDword-uInt"
      message="$(string.Event.IsShellReady)" />

    <event value="503"
      symbol="_UI_WnfShellReady"
      task="ClientLaunch"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template="tDword-uInt"
      message="$(string.Event.WnfShellReady)" />

    <event value="504"
      symbol="_UI_LaunchUx"
      task="ClientLaunch"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      message="$(string.Event.LaunchUx)" />
      
    <event value="506"
      symbol="_UI_FailedToSubscribeShellReadyWNF"
      task="ClientLaunch"
      keywords="Trace"
      level="win:Warning"
      opcode="win:Info"
      message="$(string.Event.FailedToSubscribeShellReadyWNF)" />

    <event value="507"
      symbol="_UI_FailedToLoadResourceDll_Error"
      task="ClientLaunch"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      message="$(string.Event.FailedToLoadResourceDll_Error)" />

    <event value="901"
      symbol="_UiData_Parsing_Error"
      task="UiData"
      keywords="Trace"
      level="win:Error"
      opcode="win:Info"
      template="tFourDwords"      
      message="$(string.Event.UiData_Parsing_Error)" />

    <event value="902"
      symbol="_UiData_Unsupported_CmdQualifier_For_Local_Info"
      task="UiData"
      keywords="Trace"
      level="win:Error"
      opcode="win:Info"
      template="tUInt8"      
      message="$(string.Event.UiData_Unsupported_CmdQualifier_For_Local_Info)" />
      
    </events>
      
</provider>
</events>
</instrumentation>


<localization>
<resources culture="en-US">
    <stringTable>

        <string id="Keyword.Error"                   value="Error" />
        <string id="Keyword.Performance"             value="Performance" />
        <string id="Keyword.Information"             value="Information" />
        <string id="Keyword.Trace"                   value="Trace" />

        <string id="Event.UtkServiceAttach"          value="[UtkService] Service dll is attached" />
        <string id="Event.UtkServiceDetach"          value="[UtkService] Service dll is detached" />

        <string id="Event.UtkServiceStart"           value="[UtkService] Service starts" />
        <string id="Event.UtkServiceStop"            value="[UtkService] Service stops" />

        <string id="Event.UtkServiceNonNullHandleInDestructor"            value="[UtkService] m_pCellHandler is NOT NULL in UtkService::~UtkService!!" />

        <string id="Event.OnModemAdded"              value="[UtkService] Added modem: [%1]" />
        <string id="Event.OnModemRemoved"            value="[UtkService] Removed modem: [%1] " />
        <string id="Event.OnModemExistenceDone"      value="[UtkService] Modem existence done." />

        <string id="Event.OnSlotAdded"               value="[UtkService] Slot with index=[%1] added" />
        <string id="Event.OnSlotRemoved"             value="[UtkService] Slot with index [%1] removed" />
        <string id="Event.OnSlotExistenceDone"       value="[UtkService] Slot existence done" />
        
        <string id="Event.OnSlotStateChanged"        value="[UtkService] Slot at index [%1] changed state to [%2]" />
        <string id="Event.OnUICCAdded"               value="[UtkService] UICC is added to Slot index [%1]" />
        <string id="Event.OnUICCRemoved"             value="[UtkService] UICC is removed from Slot index [%1]" />

        <string id="Event.OnFinished"                value="[UtkService] OnFinished(result=%1, context=%2)" />
        <string id="Event.RegisterToolkitService"    value="[UtkService] [Line=%1] Calling RegisterToolkitService" />

        <string id="Event.DuplicatedSlot_Error"      value="[UtkService] [Line=%1] Slot(Index=%d) already exists" />
        <string id="Event.CantFindSlot_Error"        value="[UtkService] [Line=%1] [Slot Index=%2] Can't find the slot in the map" />
        <string id="Event.InvalidSlotIndex_Error"    value="[UtkService] [Line=%1] The slot index (=%2) is invalid" />
      
        <string id="Event.UpdateSimFriendlyName"     value="[UtkService] UtkSlotHandler::OnUICCFriendlyNameChange: The SIM friendly name is updated as %1 for slot %2" />
        <string id="Event.SlotIndexNotMatch_Error"   value="[UtkService] UtkSlotHandler::OnUICCFriendlyNameChange: The slot index %1 obtained from pUICC does not match the slot index %2 of UtkSlotHandler" />

        <string id="Event.ProactiveCommand"                     value="[UtkService] ProactiveCommmand (type=%1)" />
        <string id="Event.InvaildProactiveCommand"              value="[UtkService] Invalid ProactiveCommmand (Error=%1)" />        
        <string id="Event.CleaningUpWNF"                        value="[UtkService] [Line=%1] Cleaning up WNF notification" />
        <string id="Event.HandleAckOrTimeout"                   value="[UtkService] HandleAckOrTimeout [bTimedout=%1]" />
        <string id="Event.LastCommandNotResponded"              value="[UtkService] [Line=%1][Warning] a last command is still alive" />
        <string id="Event.PrintHr"                              value="[UtkService] [Line=%1] HRESULT=%2" />       
        <string id="Event.PrintErrorHr"                         value="[UtkService] [%1][Line=%2] HRESULT=%3" />
        <string id="Event.StartAckTimer"                        value="[UtkService] StartAckTimer" />
        <string id="Event.SubscribedUserActivityWnf"            value="[UtkService] Subscribed %1" />
        <string id="Event.NoEventListInSetupEventList"          value="[UtkService] UtkCellHandler::OnUICCToolkitCommandReceived: No Event List TLV in the Set up Event List command" />
        <string id="Event.NullPtrOrWrongLength"                 value="[UtkService] %1: NULL buffer pointer or incorrect buffer length (%2 != sizeof(DWORD))" />
        <string id="Event.SendEnvelopeCmdForUserActivity"       value="[UtkService] UtkCellHandler::HandleWnfUserActivity: SendEnvelope is done for User Activity" />
        <string id="Event.FailedGetModuleHandle"                value="[UtkService] GetModuleHandle returns a NULL HMODULE in %1" />
        <string id="Event.UnsubscribedUserActivityWnf"          value="[UtkService] Unsubscribed WNF_OS_USER_PRESENCE or WNF_SHL_DEVICE_LOCK_STATE by invoking %1" />
        <string id="Event.NonZeroLengthForTouchActivity"        value="[UtkService] UtkCellHandler::HandleWnfUserActivityStatic: the buffer length (%1) is not zero for Touch Activity WNF callback" />
        <string id="Event.UTK_SetupMenuIsPublished"             value="[UtkService] UtkCellHandler::OnUICCToolkitCommandReceived: SetupMenu is published" />        
        <string id="Event.UTK_ShellIsNotReadyOrScreenIsLocked"  value="[UtkService] UtkCellHandler::OnUICCToolkitCommandReceived: IsShellReady = %1 or IsScreenLocked = %2, so UI is not launched" />
        <string id="Event.UTK_TrIsSentbyInternal"               value="[UtkService] [%1] [Line=%2] Terminal response with result = %3 is sent by calling SendCommandResponseInternal" />
        <string id="Event.UTK_ShellIsNotReady"                  value="[UtkService] UtkCellHandler::OnUICCToolkitCommandReceived: IsShellReady = %1, so neither UI nor toast is launched" />
        <string id="Event.UTK_ScreenIsLocked"                   value="[UtkService] UtkCellHandler::OnUICCToolkitCommandReceived: screen is locked, so toast is launched" />
        <string id="Event.UTK_OneLeftOverCmdForThisSlot"        value="[UtkService] UtkSlotHandler::HandleWnfProactiveCmdForQuery: There is a left-over command for this slot with index = %1" />
        <string id="Event.UTK_OneLeftOverCmdButNotForThisSlot"  value="[UtkService] UtkSlotHandler::HandleWnfProactiveCmdForQuery: There is a left-over command but not for this slot with index = %1" />
        <string id="Event.UTK_NoLeftOverCmd"                    value="[UtkService] UtkSlotHandler::HandleWnfProactiveCmdForQuery: There is no left-over command for either slot" />

        <string id="Event.AckCommand"                       value="[UtkService] AckCommand (Modem=%1, Slot=%2, CmdID=%3)" />
        <string id="Event.SendCommandResponse"              value="[UtkService] SendCommandResponse (Modem=%1, Slot=%2, CmdID=%3, DataLen=%4)" />
        <string id="Event.SendEnvelope"                     value="[UtkService] SendEnvelope (Modem=%1, Slot=%2)" />
        <string id="Event.CannotHandleRequestDueToNullUicc" value="[UtkService] Warning: [%1][LINE=%2] Cannot handle a RPC request due to null Uicc" />
        <string id="Event.RequestForInvalidCommand"         value="[UtkService] Warning: [%1][LINE=%2] RPC request for invalid or stale command" />
        <string id="Event.InvalidResponse"                  value="[UtkService] Warning: [%1][LINE=%2] Invalid response" />
        <string id="Event.FailedSecurityCall"               value="[UtkService] Error: QueryTransientObjectSecurityDescriptor failed with NTSTATUS = %2 for %1" />
        <string id="Event.FailedInitDeinitCall"             value="[UtkService] Error: %1 failed with RPC_STATUS = %2" />

        <string id="Event.LaunchForegroundApp"              value="[UtkService] Checking foreground app (ForegroundApp=%1, UtkClient=%2)" />
        <string id="Event.IsShellReady"                     value="[UtkService] [Line=%1] IsShellReady=%2" />
        <string id="Event.WnfShellReady"                    value="[UtkService] WnfShellReady (IsShellReady=%1)" />
        <string id="Event.LaunchUx"                         value="[UtkService] Launch Ux" />
        <string id="Event.FailedToSubscribeShellReadyWNF"   value="[UtkService] Error: Failed To subscribe ShellReady WNF" />
        <string id="Event.FailedToLoadResourceDll_Error"    value="[UtkService] UtkSlotHandler::LaunchToast: Failed to load the resource dll C:\\Programs\\UtkUx\\UtkUxRes.dll" />
     
        <string id="Event.UiData_Parsing_Error"                             value="[UtkService][Line=%1] Proactive command parsing error TagId=%2, Length=%3, Error=%4" />
        <string id="Event.UiData_Unsupported_CmdQualifier_For_Local_Info"   value="[UtkService] UtkUIProactiveCommand::GetTerminalResponse: Unsupported command qualifier (%1) for Provide Local Information" />
        
    </stringTable>
</resources>
</localization>

</instrumentationManifest>
