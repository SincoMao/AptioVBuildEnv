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

<provider name="Microsoft-WindowsPhone-Net-Cellcore-APMux"
  guid="{c8d71a73-83cb-4865-b152-5be67c655a5c}"
  symbol="MICROSOFT_WINDOWSPHONE_Net_CELLCORE_APMux"
  messageFileName="NetCellcoreAPMuxProviderResources.dll"
  resourceFileName="NetCellcoreAPMuxProviderResources.dll">

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
  <task value="1" name="APMUx" />
</tasks>


<templates>

    <template tid="tDword">
      <data name="DwordName" inType="win:UInt32" outType="win:HexInt32"/>
    </template> 

    <template tid="tInt32">
      <data name="Int32Name" inType="win:Int32"/>
    </template>

    <template tid="tInt32AndInt32">
      <data name="Int32Name" inType="win:Int32"/>
      <data name="Int32Name2" inType="win:Int32"/>      
    </template>

    <template tid="tHRESULT">
      <data name="HResultName" inType="win:Int32" outType="win:HResult"/>
    </template>

    <template tid="tHRESULTAndDword">
      <data name="HResultName" inType="win:Int32" outType="win:HResult"/>
      <data name="DwordName" inType="win:UInt32" outType="win:HexInt32"/>      
    </template>
    
</templates>


<events>

    <event value="100"
      symbol="APMux_Start"
      task="APMUx"
      keywords="Performance"
      level="win:Informational"
      opcode="win:Start"
      message="$(string.Event.APMuxStart)" />

    <event value="101"
      symbol="APMux_Exit"
      task="APMUx"
      keywords="Performance"
      level="win:Informational"
      opcode="win:Stop"
      message="$(string.Event.APMuxExit)" />

    <event value="102"
      symbol="RtlQueryWnfStateData_Failed"
      task="APMUx"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tDword"
      message="$(string.Event.RtlQueryWnfStateDataFailed)" /> 

    <event value="103"
      symbol="RtlSubscribeWnfStateChangeNotification_Failed"
      task="APMUx"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tDword"
      message="$(string.Event.RtlSubscribeWnfStateChangeNotificationFailed)" /> 

    <event value="104"
      symbol="UpdateAirplaneMode_State"
      task="APMUx"
      keywords="Information"
      level="win:Verbose"
      opcode="win:Info"
      template = "tInt32AndInt32"
      message="$(string.Event.UpdateAirPlaneModeState)" /> 

    <event value="105"
      symbol="SetAPMOn_State"
      task="APMUx"
      keywords="Information"
      level="win:Verbose"
      opcode="win:Info"
      template = "tInt32AndInt32"
      message="$(string.Event.SetApmOnState)" /> 

    <event value="106"
      symbol="SetAPMOn_Failed"
      task="APMUx"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tHRESULTAndDword"
      message="$(string.Event.SetApmOnFailed)" /> 

    <event value="107"
      symbol="WNFNotificationCallback_Failed"
      task="APMUx"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tDword"
      message="$(string.Event.WNFNotificationCallbackFailed)" /> 

    <event value="108"
      symbol="CoCreateInstance_Failed"
      task="APMUx"
      keywords="Error"
      level="win:Error"
      opcode="win:Info"
      template = "tHRESULT"
      message="$(string.Event.CoCreateInstanceFailed)" />

    <event value="109"
      symbol="UpdateAirplaneModeDetails_State"
      task="APMUx"
      keywords="Information"
      level="win:Verbose"
      opcode="win:Info"
      template = "tInt32AndInt32"
      message="$(string.Event.UpdateAirPlaneModeDetailsState)" />

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

        <string id="Event.APMuxStart"               value="[APMux] APMux starts" />
        <string id="Event.APMuxExit"                value="[APMux] APMux exits" />

        <string id="Event.RtlQueryWnfStateDataFailed"                                     value="[APMux] APMUX::APMUX: RtlQueryWnfStateData failed with status = %1" />
        <string id="Event.RtlSubscribeWnfStateChangeNotificationFailed"                   value="[APMux] APMUX::APMUX: RtlSubscribeWnfStateChangeNotification failed with status = %1" />
        <string id="Event.UpdateAirPlaneModeState"                                        value="[APMux] APMUX::UpdateAirPlaneModeState: m_dwAPMState = %1, dwState = %2" />
        <string id="Event.SetApmOnState"                                                  value="[APMux] APMUX::SetAPMOn: m_dwAPMState = %1, dwAPMState = %2" />
        <string id="Event.SetApmOnFailed"                                                 value="[APMux] APMUX::SetAPMOn: SetAirPlaneModeState failed with hr = %1(%2)" />
        <string id="Event.WNFNotificationCallbackFailed"                                  value="[APMux] s_WNFNotificationCallback: lLength (%1) != sizeof (DWORD) or pBuffer is NULL" />
        <string id="Event.CoCreateInstanceFailed"                                         value="[APMux] APMUX::InitializeCellCore: CoCreateInstance failed with hr = %1" />
        <string id="Event.UpdateAirPlaneModeDetailsState"                                 value="[APMux] APMUX::UpdateAirplaneModeStateDetails: m_dwTransitionState = %1, dwState = %2" />

    </stringTable>
</resources>
</localization>

</instrumentationManifest>