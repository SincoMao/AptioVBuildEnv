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

<!-- TODO:
   1. Search-and-replace to change "MyProvider" to your provider name.
   2. Use guidgen.exe or other tool to generate a new GUID for your provider.
   3. Update messageFileName/resourceFileName.  These will probably refer to
      a resource-only DLL that does not actually load on the target device.
      Do not include any path information in messageFileName/resourceFileName.
   4. Delete the "MyKeyword" keyword, and consider adding your own keywords.
      Keywords work much like WP7 "debug zones."  They are tags that can
      be assigned to events to break them into classes.  Keyword masks are 64-bit, of
      which you may use the lower 48.  For more information on keyword definitions, see
      http://msdn.microsoft.com/en-us/library/aa382786(VS.85).aspx
   5. Delete the sample tasks and define tasks for any event-pairs which have
      start/stop semantics. Tasks are used with opcodes win:Start and win:Stop to link
      start and stop events from the same task together.  For events without start/stop
      semantics, adding a task still causes tools (xperf) to print them better.
   6. Delete the sample templates.  Define templates for the different kinds of data you wish to log.
      If multiple events share the same data payload, they can use the same template.
      See the Remarks section in http://msdn.microsoft.com/en-us/library/aa382774(VS.85).aspx
      for valid inType / outType combinations.
      For more complex data types, it is suggested that you use a tool like EcManGen.exe from
      the Win7 SDK to author manifests.
   7. Delete the sample events and add your own.
      For information on opcodes, see http://msdn.microsoft.com/en-us/library/aa383956(VS.85).aspx.
   8. Delete the sample strings and define strings to match your own events.
   9. To avoid spoofing, add provider security settings under
      HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\security

   ** Never log any data which should be protected for security or privacy purposes.
   -->

<provider name="Microsoft-WindowsPhone-Net-Cellcore-Cellux"
  guid="{d9035584-b054-41c3-b8a5-b137e5576e56}"
  symbol="MICROSOFT_WINDOWSPHONE_Net_CELLCORE_Cellux"
  messageFileName="NetCellcoreCelluxProviderResources.dll"
  resourceFileName="NetCellcoreCelluxProviderResources.dll">

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
  <task value="1" name="CellularUx" />
  <task value="2" name="Cmhelper" />
  <task value="3" name="APN" />
</tasks>


<templates>

    <template tid="tDword">
      <data name="DwordName" inType="win:UInt32" outType="win:HexInt32"/>
    </template>

    <template tid="t2DwordsHex">
      <data name="DwordName1" inType="win:UInt32" outType="win:HexInt32"/>
      <data name="DwordName2" inType="win:UInt32" outType="win:HexInt32"/>
    </template>

    <template tid="tDwordBool">
      <data name="DwordName" inType="win:UInt32" outType="win:HexInt32"/>
      <data name="BoolName" inType="win:Boolean"/>
    </template>

    <template tid="tDecHex">
      <data name="Int32Name" inType="win:Int32"/>
      <data name="DwordName" inType="win:UInt32" outType="win:HexInt32"/>
    </template> 
    
    <template tid="tTwoDwords">
      <data name="DwordOne" inType="win:UInt32" outType="win:HexInt32"/>
      <data name="DwordTwo" inType="win:UInt32" outType="win:HexInt32"/>
    </template> 

    <template tid="tUnicodeString">
      <data name="szName" inType="win:UnicodeString" />
    </template>

    <template tid="tBool">
      <data name="BoolName" inType="win:Boolean"/>
    </template>

    <template tid="tInt32">
      <data name="Int32Name" inType="win:Int32"/>
    </template>

    <template tid="tInt32AndInt32">
        <data name="Int32Name" inType="win:Int32"/>
        <data name="Int32Name2" inType="win:Int32"/>
    </template>
    
    <template tid="tUnicodeStringAndInt32">
      <data name="szName" inType="win:UnicodeString" />
      <data name="Int32Name2" inType="win:Int32"/>
    </template>
     
    <template tid="tImsiInSlot">
       <data name="slot" inType="win:Int32"/>
       <data name="slot0incan0" inType="win:Int32"/>
       <data name="cImsi" inType="win:Int32"/>
       <data name="imsi0" inType="win:UnicodeString" />
       <data name="imsi1" inType="win:UnicodeString"/>
    </template>

    <template tid="tIMSServices">
       <data name="IMS" inType="win:Boolean"/>
       <data name="SMS" inType="win:Boolean"/>
       <data name="Voice" inType="win:Boolean"/>
       <data name="Video" inType="win:Boolean"/>
    </template>

    <template tid="tInt32AndInt32AndInt32">
        <data name="Int32Name" inType="win:Int32"/>
        <data name="Int32Name2" inType="win:Int32"/>
        <data name="Int32Name3" inType="win:Int32"/>
    </template>

    <template tid="tLineString">
       <data name="Int32Line" inType="win:Int32"/>
       <data name="szString" inType="win:UnicodeString" />
    </template>
</templates>


<events>

    <event value="100"
      symbol="Cellux_Start"
      task="CellularUx"
      keywords="Performance"
      level="win:Informational"
      opcode="win:Start"
      message="$(string.Event.CelluxStart)" />

    <event value="101"
      symbol="Cellux_Exit"
      task="CellularUx"
      keywords="Performance"
      level="win:Informational"
      opcode="win:Stop"
      message="$(string.Event.CelluxExit)" />

    <event value="102"
      symbol="CellularUxCellularUxMpCmHelper_Null"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      message="$(string.Event.CellularUxCellularUxMpCmHelperNull)" />

    <event value="103"
      symbol="CellularUxCellularUxModemCreateEvent_Failed"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      message="$(string.Event.CellularUxCellularUxModemCreateEventFailed)" />

    <event value="104"
      symbol="CellularUxCellularUxCanCreateEvent_Failed"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      message="$(string.Event.CellularUxCellularUxCanCreateEventFailed)" />
      
    <!-- Deprecated -->
    <event value="105"
      symbol="CellularUxUpdateNetworkName_SzNetworkName"
      task="CellularUx"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      template = "tUnicodeString"              
      message="$(string.Event.CellularUxUpdateNetworkNameSzNetworkName)" /> 

    <event value="106"
      symbol="CellularUxSetGprsOn_Val"
      task="CellularUx"
      keywords="Trace"
      level="win:Verbose"
      opcode="win:Info"
      template = "tBool"
      message="$(string.Event.CellularUxSetGprsOnVal)" />

    <event value="107"
      symbol="CellularUxGetDataRoaming_fDataRoaming"
      task="CellularUx"
      keywords="Trace"
      level="win:Verbose"
      opcode="win:Info"
      template = "tBool"
      message="$(string.Event.CellularUxGetDataRoamingFDataRoaming)" />

    <event value="108"
      symbol="CellularUxSetDataRoaming_Val"
      task="CellularUx"
      keywords="Trace"
      level="win:Verbose"
      opcode="win:Info"
      template = "tInt32"
      message="$(string.Event.CellularUxSetDataRoamingVal)" />

    <event value="109"
      symbol="CellularUxGetHighSpeedVisible_True"
      task="CellularUx"
      keywords="Trace"
      level="win:Verbose"
      opcode="win:Info"
      message="$(string.Event.CellularUxGetHighSpeedVisibleTrue)" />

    <event value="110"
      symbol="CellularUxGetHighSpeedVisible_False"
      task="CellularUx"
      keywords="Trace"
      level="win:Verbose"
      opcode="win:Info"
      message="$(string.Event.CellularUxGetHighSpeedVisibleFalse)" />

    <event value="111"
      symbol="CellularUxGetGsmNetworkListVisible_True"
      task="CellularUx"
      keywords="Trace"
      level="win:Verbose"
      opcode="win:Info"
      message="$(string.Event.CellularUxGetGsmNetworkListVisibleTrue)" />

    <event value="112"
      symbol="CellularUxGetGsmNetworkListVisible_False"
      task="CellularUx"
      keywords="Trace"
      level="win:Verbose"
      opcode="win:Info"
      message="$(string.Event.CellularUxGetGsmNetworkListVisibleFalse)" />

    <event value="113"
      symbol="RtlSubscribeWnfStateChangeNotification_Failed"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template = "tInt32"
      message="$(string.Event.RtlSubscribeWnfStateChangeNotificationFailed)" />

    <!-- 114 is deprecated. -->
    <event value="114"
      symbol="RtlSubscribeUICCWnfStateChangeNotification_Failed"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template = "tInt32"
      message="$(string.Event.RtlSubscribeUICCWnfStateChangeNotificationFailed)" />

    <event value="115"
      symbol="RtlQueryWnfStateData_Failed"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template = "tInt32"
      message="$(string.Event.RtlQueryWnfStateDataFailed)" />

    <event value="116"
      symbol="RtlSubscribeWnfStateChange_Failed"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template="tInt32AndInt32"
      message="$(string.Event.RtlSubscribeWnfStateChangeFailed)" />

  <event value="117"
    symbol="CellularUxPhoneAPIs_Failed"
    task="CellularUx"
    keywords="Error"
    level="win:Critical"
    opcode="win:Info"
    template = "tDword"
    message="$(string.Event.CellularUxPhoneAPIsFailed)" />

   <event value="118"
      symbol="CellularUxIMSIQueryCBError"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template = "tInt32"
      message="$(string.Event.CellularUxIMSIQueryCBError)" />
      
   <event value="119"
      symbol="CellularUxQueryImsiInSlotError"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template = "tDecHex"
      message="$(string.Event.CellularUxQueryImsiInSlotError)" />

    <event value="120"
      symbol="ActivateSIMUunlockUI"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template="tInt32AndInt32"
      message="$(string.Event.ActivateSIMUunlockUI)" />

    <event value="121"
      symbol="GetPhoneLineIdFailed"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template="tInt32"
      message="$(string.Event.GetPhoneLineIdFailed)" />

  <!-- Deprecated -->  
    <event value="122"
      symbol="CellularUxUpdateNetworkNameFailed"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      message="$(string.Event.CellularUxUpdateNetworkNameFailed)" />
  
    <event value="123"
      symbol="CellularUxUpdateNetworkName_SzNetworkNameEx"
      task="CellularUx"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      template = "tUnicodeStringAndInt32"              
      message="$(string.Event.CellularUxUpdateNetworkNameSzNetworkNameEx)" /> 
  
    <event value="124"
      symbol="CellularUxGetNetworkNameFailed"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template="tInt32"
      message="$(string.Event.CellularUxGetNetworkNameFailed)" />
    
    <event value="125"
      symbol="CellularUxBadSimLockInfo"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      template="tInt32"
      message="$(string.Event.CellularUxBadSimLockInfo)" />
    
    <event value="126"
      symbol="CellularUxQuerySlotAffinityFailed"
      task="CellularUx"
      keywords="Error"
      level="win:Critical"
      opcode="win:Info"
      message="$(string.Event.CellularUxQuerySlotAffinityFailed)" />
  
    <event value="127"
      symbol="CellularUxQuerySlotAffinitySucceeded"
      task="CellularUx"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      template = "tDword"              
      message="$(string.Event.CellularUxQuerySlotAffinitySucceeded)" /> 

    <event value="128"
      symbol="CellularUxQueryImsiInSlot"
      task="CellularUx"
      keywords="Information"
      level="win:Informational"
      opcode="win:Info"
      template = "tImsiInSlot"
      message="$(string.Event.CellularUxQueryImsiInSlot)" />

    <event value="129"
      symbol="CellularUxWrongStateNameInStkWnfCallback"
      task="CellularUx"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "t2DwordsHex"
      message="$(string.Event.CellularUxWrongStateNameInStkWnfCallback)" />

    <event value="130"
       symbol="CellularUxUpdateStkButton"
       task="CellularUx"
       keywords="Information"
       level="win:Informational"
       opcode="win:Info"
       template = "tDwordBool"
       message="$(string.Event.CellularUxUpdateStkButton)" />
  
    <event value="131"
      symbol="CellularUxSetBkgrndData"
      task="CellularUx"
      keywords="Trace"
      level="win:Critical"
      opcode="win:Info"
      template = "tTwoDwords"
      message="$(string.Event.CellularUxSetBkgrndData)" />

    <event value="132"
      symbol="SetPrefferedPLMNFailed"
      task="CellularUx"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tDword"
      message="$(string.Event.SetPrefferedPLMNFailed)" />

    <event value="133"
      symbol="CellularUxDataRoamingPolicyUpdate"
      task="CellularUx"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template = "tBool"
      message="$(string.Event.CellularUxDataRoamingPolicyUpdate)" />

    <event value="134"
      symbol="SetNetworkItem"
      task="CellularUx"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template = "tDword"
      message="$(string.Event.SetNetworkItemSelected)" />
	  
	<event value="135"
      symbol="CellularUxGetDataConnectionToggle"
      task="CellularUx"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template = "tBool"
      message="$(string.Event.GetDataConnectionToggle)" />
	
	<event value="136"
      symbol="CellularUxSetDataConnectionToggle"
      task="CellularUx"
      keywords="Trace"
      level="win:Informational"
      opcode="win:Info"
      template = "tBool"
      message="$(string.Event.SetDataConnectionToggle)" />

    <event value="300"
      symbol="APNPageAPNPageCmConnControl_Failed"
      task="APN"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      message="$(string.Event.APNPageAPNPageCmConnControlFailed)" />   

    <event value="301"
      symbol="APNPageAPNPagePsInit_Failed"
      task="APN"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tDword"
      message="$(string.Event.APNPageAPNPagePsInitFailed)" />   

    <event value="302"
      symbol="APNPageGphGetConnectionConfigAPN"
      task="APN"
      keywords="Information"
      level="win:Verbose"
      opcode="win:Info"
      template = "tUnicodeString"              
      message="$(string.Event.APNPageGphGetConnectionConfigAPN)" />   	 
      
    <event value="303"
      symbol="APNPageDeleteClickedPsDelProxy_Failed"
      task="APN"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tDword"
      message="$(string.Event.APNPageDeleteClickedPsDelProxyFailed)" />   

    <event value="304"
      symbol="APNPageDeleteClickedCmDeleteConnectionConfig_Failed"
      task="APN"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tDword"
      message="$(string.Event.APNPageDeleteClickedCmDeleteConnectionConfigFailed)" />   

    <event value="305"
      symbol="APNPageAddConnConfigCmAdd_Failed"
      task="APN"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tDword"
      message="$(string.Event.APNPageAPNPageAddConnConfigCmAddFailed)" />   

    <event value="306"
      symbol="APNPageSetOrDeleteProxyPsSetProxy_Failed"
      task="APN"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tDword"
      message="$(string.Event.APNPageSetOrDeleteProxyPsSetProxyFailed)" />

    <event value="307"
      symbol="APNPageSetOrDeleteProxyPsDelProxy_Failed"
      task="APN"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tDword"
      message="$(string.Event.APNPageSetOrDeleteProxyPsDelProxyFailed)" />

    <event value="308"
       symbol="SetDMProfileConfigCalled"
       task="CellularUx"
       keywords="Information"
       level="win:Informational"
       opcode="win:Info"
       template = "tInt32AndInt32AndInt32"
       message="$(string.Event.SetDMProfileConfigCalled)" />

    <event value="309"
       symbol="GetDMProfileConfigCalled"
       task="CellularUx"
       keywords="Information"
       level="win:Informational"
       opcode="win:Info"
       template = "tInt32"
       message="$(string.Event.GetDMProfileConfigCalled)" />

    <event value="310"
       symbol="OnSetDMProfileConfigCompletionCalled"
       task="CellularUx"
       keywords="Information"
       level="win:Informational"
       opcode="win:Info"
       template = "tInt32AndInt32"
       message="$(string.Event.OnSetDMProfileConfigCompletionCalled)" />

    <event value="311"
       symbol="OnGetDMProfileConfigCompletionCalled"
       task="CellularUx"
       keywords="Information"
       level="win:Informational"
       opcode="win:Info"
       template = "tInt32AndInt32AndInt32"
       message="$(string.Event.OnGetDMProfileConfigCompletionCalled)" />

    <event value="312"
       symbol="GetToggleValue"
       task="CellularUx"
       keywords="Information"
       level="win:Informational"
       opcode="win:Info"
       template = "tIMSServices"
       message="$(string.Event.GetToggleValue)" />

    <event value="999"
       symbol="CellUxForDebugging"
       task="CellularUx"
       keywords="Information"
       level="win:Informational"
       opcode="win:Info"
       template = "tLineString"
       message="$(string.Event.CellUxForDebugging)" />
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

        <string id="Event.CelluxStart"               value="[Cellux] Cellux starts" />
        <string id="Event.CelluxExit"                value="[Cellux] Cellux exits" />

        <string id="Event.CellularUxCellularUxMpCmHelperNull"                             value="[Cellux] CellularUX::CellularUX: m_pCMHelper is NULL" />
        <string id="Event.CellularUxCellularUxModemCreateEventFailed"                     value="[Cellux] CellularUX::CellularUX: m_hModemDone is NULL, CreateEvent failed" />
        <string id="Event.CellularUxCellularUxCanCreateEventFailed"                       value="[Cellux] CellularUX::CellularUX: m_hCanDone is NULL, CreateEvent failed" />
        <string id="Event.CellularUxUpdateNetworkNameSzNetworkName"                       value="[Cellux] CellularUX::UpdateNetworkName: szNetworkName = %1" />
        <string id="Event.CellularUxUpdateNetworkNameSzNetworkNameEx"                     value="[Cellux] CellularUX::UpdateNetworkName: szNetworkName = %1, slot = %2" />
        <string id="Event.CellularUxQuerySlotAffinitySucceeded"                           value="[Cellux] CellularUX::CellularUX: slot = %1" />
        <string id="Event.CellularUxQuerySlotAffinityFailed"                              value="[Cellux] CellularUX::CellularUX: Query WNF_CELL_CONFIGURED_LINES_CAN0 failed" />
        <string id="Event.CellularUxSetGprsOnVal"                                         value="[Cellux] CellularUX::SetGPRSOn: val = %1" />
        <string id="Event.CellularUxGetDataRoamingFDataRoaming"                           value="[Cellux] CellularUX::GetDataRoaming: fDataRoaming = %1" />
        <string id="Event.CellularUxSetDataRoamingVal"                                    value="[Cellux] CellularUX::SetDataRoaming: set to val = %1" />
        <string id="Event.CellularUxGetHighSpeedVisibleTrue"                              value="[Cellux] CellularUX::GetHighSpeedVisible: True" />
        <string id="Event.CellularUxGetHighSpeedVisibleFalse"                             value="[Cellux] CellularUX::GetHighSpeedVisible: False" />
        <string id="Event.CellularUxGetGsmNetworkListVisibleTrue"                         value="[Cellux] CellularUX::GetGSMNetworkListVisible: True" />
        <string id="Event.CellularUxGetGsmNetworkListVisibleFalse"                        value="[Cellux] CellularUX::GetGSMNetworkListVisible: False" />
        <string id="Event.RtlSubscribeWnfStateChangeNotificationFailed"                   value="[Cellux] CellularUX::CellularUX: register WNF_CELL_UTK_SETUP_MENU_SLOT0 failed. Error = %1" />
        <string id="Event.RtlSubscribeUICCWnfStateChangeNotificationFailed"               value="[Cellux] CellularUX::CellularUX: register WNF_CELL_UICC_STATUS_SLOT0 failed. Error = %1" />        
        <string id="Event.RtlQueryWnfStateDataFailed"                                     value="[Cellux] CellularUX::CellularUX: query WNF_CELL_RADIO_TYPE_MODEM0failed. Error = %1" />
        <string id="Event.RtlSubscribeWnfStateChangeFailed"                               value="[Cellux] CellularUX::CellularUX: register for WNF state changes failed. Error = %1 Line = %2" />
        <string id="Event.CellularUxPhoneAPIsFailed"                                      value="[Cellux] CellularUX::CellularUX: Call to Phone APIs failed. Error = %1" />      
        <string id="Event.SetPrefferedPLMNFailed"                                         value="[Cellux] CellularUX::OnSetPreferredPLMNCompletion: Error = %1" />
        <string id="Event.CellularUxDataRoamingPolicyUpdate"                              value="[Cellux] CellularUX::UpdateDataRoamingPolicy: fDisabledByPolicy = %1" />
        <string id="Event.SetDataConnectionToggle"                                        value="[Cellux] CellularUX::SetDataConnectionToggle: fDataEnabled = %1" />		
        <string id="Event.GetDataConnectionToggle"                                        value="[Cellux] CellularUX::GetDataConnectionToggle: fDataEnabled = %1" />
        <string id="Event.SetNetworkItemSelected"                                         value="[Cellux] CellularUX::SetNetworkItemSelected: Function = %1" />
        <string id="Event.CellularUxIMSIQueryCBError"                                     value="[Cellux] s_imsiWnfQueryCallback: abnormal data. Length = %1" />
        <string id="Event.CellularUxQueryImsiInSlotError"                                 value="[Cellux] QueryImsiInSlot: Slot %1 Error = %2" />
        <string id="Event.CellularUxQueryImsiInSlot"                                      value="[Cellux] QueryImsiInSlot: Slot %1 Slot0InCan0 %2 cImsi %3 Imsi0 %4 Imsi1 %5" />
        <string id="Event.CellularUxSetBkgrndData"                                        value="[Cellux] CellularUX::SetRestrictBkgrndCellData: old %1 new %2" />
        <string id="Event.ActivateSIMUunlockUI"                                           value="[Cellux] CellularUX: Launch SIM Pin UI. hr = %1 slot = %2" />   
        <string id="Event.GetPhoneLineIdFailed"                                           value="[Cellux] CellularUX: Failed to get PhoneLineId. slot = %1" />    
        <string id="Event.CellularUxUpdateNetworkNameFailed"                              value="[Cellux] CellularUX::UpdateNetworkName: Failed to get Can specific data" />  
        <string id="Event.CellularUxGetNetworkNameFailed"                                 value="[Cellux] CellularUX::GetNetworkName: Failed on slot: %1" />  
        <string id="Event.CellularUxBadSimLockInfo"                                       value="[Cellux] CellularUX: Sim lock state = %1" />
        <string id="Event.CellularUxWrongStateNameInStkWnfCallback"                       value="[Cellux] s_STKWNFNotificationCallback: wrong state name (= %1, %2) which is neither WNF_CELL_UTK_SETUP_MENU_SLOT0 nor WNF_CELL_UTK_SETUP_MENU_SLOT1 "/>
        <string id="Event.CellularUxUpdateStkButton"                                      value="[Cellux] CellularUX::UpdateSTKButton: fShowSTKButton is set to %2 for slot %1"/>
        <string id="Event.APNPageAPNPageCmConnControlFailed"                              value="[Cellux] APNPage::APNPage: CmConnControl failed to initialize" />
        <string id="Event.APNPageAPNPagePsInitFailed"                                     value="[Cellux] APNPage::APNPage: PsInit Failed, retVal = %1" />
        <string id="Event.APNPageGphGetConnectionConfigAPN"                               value="[Cellux] APNPage::APNPage: GPH:GetConnectionConfigAPN : %1" />
        <string id="Event.APNPageDeleteClickedPsDelProxyFailed"                           value="[Cellux] APNPage::DeleteClicked: PsDelProxy Failed, retVal = %1" />
        <string id="Event.APNPageDeleteClickedCmDeleteConnectionConfigFailed"             value="[Cellux] APNPage::DeleteClicked: CmDeleteConnectionConfig Failed, cmRes = %1" />
        <string id="Event.APNPageAPNPageAddConnConfigCmAddFailed"                         value="[Cellux] APNPage::AddConnConfig: CmAdd/UpdateConnectionConfig Failed, cmRes = %1" />
        <string id="Event.APNPageSetOrDeleteProxyPsSetProxyFailed"                        value="[Cellux] APNPage::SetOrDeleteProxy: PsSetProxy() Failed, retVal = %1" />
        <string id="Event.APNPageSetOrDeleteProxyPsDelProxyFailed"                        value="[Cellux] APNPage::SetOrDeleteProxy: PsDelProxy() Failed, retVal = %1" />
        <string id="Event.SetDMProfileConfigCalled"                                       value="[Cellux] CellularUX::SetConfigBoolValue: Item: %1, Type: %2, Value: %3" />
        <string id="Event.GetDMProfileConfigCalled"                                       value="[Cellux] CellularUX::GetConfigBoolValue: %1" />
        <string id="Event.OnSetDMProfileConfigCompletionCalled"                           value="[Cellux] CellularUX::OnSetDMProfileConfigCompletion: Item: %1, Value: %2" />
        <string id="Event.OnGetDMProfileConfigCompletionCalled"                           value="[Cellux] CellularUX::OnGetDMProfileConfigCompletion: Item: %1, Bool Value: %2, DWORD Value: %3" />
        <string id="Event.GetToggleValue"                                                 value="[Cellux] CellularUX::GetToggleValue: IMS: %1, SMS: %2, Voice: %3, Video: %4" />
        <string id="Event.CellUxForDebugging"                                             value="[Cellux] Debugging[Line=%1]: %2" />
     </stringTable>
</resources>
</localization>

</instrumentationManifest>
