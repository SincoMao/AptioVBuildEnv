<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<instrumentationManifest
    xmlns="http://schemas.microsoft.com/win/2004/08/events"
    xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <instrumentation>
        <events>

            <provider
                name="Microsoft-WindowsPhone-Tools-PerfX"
                guid="{C0407EC5-4D47-4297-AA61-2CFDD4975ADD}"
                messageFileName="PerfXService.dll"
                resourceFileName="PerfXService.dll"
                symbol="MICROSOFT_WINDOWSPHONE_TOOLS_PERFX">

                <keywords>
                    <keyword mask="0x0000000000000001" name="Error" />
                    <keyword mask="0x0000000000000002" name="Performance" />
                    <keyword mask="0x0000000000000004" name="Initialization" />
                    <keyword mask="0x0000000000000008" name="Service" />
                    <keyword mask="0x0000000000000010" name="Collection" />
                    <keyword mask="0x0000000000000020" name="ETW" />
                    <keyword mask="0x0000000000000040" name="XmlParser" />
                    <keyword mask="0x0000000000000080" name="PowerState" />
                </keywords>

                <maps>
                    <valueMap name="PerfXInitializationState">
                        <map value="0" message="$(string.Maps.PerfXInitializationState.PERFX_INIT_PENDING)"/>
                        <map value="1" message="$(string.Maps.PerfXInitializationState.PERFX_INIT_FAILED)"/>
                        <map value="2" message="$(string.Maps.PerfXInitializationState.PERFX_INIT_SUCCEEDED)"/>
                    </valueMap>
                    <valueMap name="PerfXCollectionState">
                        <map value="0" message="$(string.Maps.PerfXCollectionState.PERFX_COLLECTION_STOPPED)"/>
                        <map value="1" message="$(string.Maps.PerfXCollectionState.PERFX_COLLECTION_PENDING)"/>
                        <map value="2" message="$(string.Maps.PerfXCollectionState.PERFX_COLLECTION_RUNNING)"/>
                    </valueMap>
                </maps>

                <templates>

                    <template tid="tid_EtwFailure">
                        <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="tid_EtwQueryProviderNotFound">
                        <data name="ProviderGuid" inType="win:GUID" />
                    </template>

                    <template tid="tid_ServiceEngineState">
                        <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="State" inType="win:UInt32" outType="win:HexInt32" />
                        <UserData>
                            <ExecManLogEvent xmlns="em">
                                <State> %1 </State>
                                <HRESULT> %2 </HRESULT>
                            </ExecManLogEvent>
                        </UserData>
                    </template>

                    <template tid="tid_ServiceState">
                        <data name="InitializationState" inType="win:UInt32" map="PerfXInitializationState" />
                        <data name="CollectionState" inType="win:UInt32" map="PerfXCollectionState" />
                    </template>

                    <template tid="tid_BootSettings">
                        <data name="Enabled" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="PreconfigIndex" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="tid_PreconfigValue">
                        <data name="PreconfigIndex" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="PreconfigName" inType="win:UnicodeString" />
                    </template>

                    <template tid="tid_DllTriggerInfo">
                        <data name="TriggerDllName" inType="win:AnsiString" />
                        <data name="TriggerDllEntryPoint" inType="win:AnsiString" />
                        <data name="TriggerName" inType="win:UnicodeString" />
                        <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="tid_FlushFile">
                        <data name="OutputFile" inType="win:UnicodeString" />
                    </template>

                    <template tid="tid_Upload">
                        <data name="TraceMineId" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="tid_ProfileStart">
                        <data name="ProfilerDurationMilliseconds" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="tid_ProviderInfo">
                        <data name="ProviderName" inType="win:UnicodeString" />
                        <data name="SessionName" inType="win:UnicodeString" />
                    </template>

                    <template tid="tid_ModeChange">
                        <data name="OldMode" inType="win:UnicodeString" />
                        <data name="NewMode" inType="win:UnicodeString" />
                    </template>

                    <template tid="tid_Trigger">
                        <data name="TriggerName" inType="win:UnicodeString" />
                    </template>

                    <template tid="tid_TriggerEnableFailed">
                        <data name="TriggerName" inType="win:UnicodeString" />
                        <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="tid_XmlParserFailedToOpenFile">
                        <data name="FileName" inType="win:UnicodeString" />
                    </template>

                    <template tid="tid_XmlParserError">
                        <data name="FileName" inType="win:UnicodeString" />
                        <data name="LineNumber" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="Column" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="tid_InvalidXmlString">
                        <data name="InvalidString" inType="win:UnicodeString" />
                    </template>

                    <template tid="tid_IllegalXmlString">
                        <data name="ObjectName" inType="win:UnicodeString" />
                        <data name="IllegalString" inType="win:UnicodeString" />
                    </template>

                    <template tid="tid_Boolean">
                        <data name="Value" inType="win:Boolean" outType="xs:boolean" />
                    </template>

                    <template tid="tid_UInt32">
                        <data name="Value" inType="win:UInt32" outType="xs:unsignedInt" />
                    </template>

                </templates>

                <tasks>
                    <task name="Initialization" symbol="TASK_INITIALIZATION" value="10" />
                    <task name="Collection" symbol="TASK_COLLECTION" value="11" />
                    <task name="Flush" symbol="TASK_FLUSH" value="12" />
                    <task name="Profile" symbol="TASK_PROFILE" value="13" />
                    <task name="FlushThread" symbol="TASK_FLUSH_THREAD" value="14" />
                    <task name="FlushThread_WaitForBoot" symbol="TASK_FLUSH_THREAD_WAIT_FOR_BOOT" value="15" />
                    <task name="Service" symbol="TASK_SERVICE" value="16" />
                    <task name="Trigger" symbol="TASK_TRIGGER" value="17" />
                    <task name="ETW" symbol="TASK_ETW" value="18" />
                    <task name="XmlParser" symbol="TASK_XML_PARSER" value="19" />
                    <task name="PowerState" symbol="TASK_POWER_STATE" value="20" />
                </tasks>

                <opcodes>
                    <opcode name="StartTraceFail" symbol="OPCODE_START_TRACE_FAIL" value="10" />
                    <opcode name="QueryTraceFail" symbol="OPCODE_QUERY_TRACE_FAIL" value="11" />
                    <opcode name="FlushTraceFail" symbol="OPCODE_FLUSH_TRACE_FAIL" value="12" />
                    <opcode name="EnumerateTraceGuidsFail" symbol="OPCODE_ENUMERATE_TRACE_GUIDS_FAIL" value="13" />
                    <opcode name="QueryProviderNotFound" symbol="OPCODE_QUERY_PROVIDER_NOT_FOUND" value="14" />
                    <opcode name="EnableTraceFail" symbol="OPCODE_ENABLE_TRACE_FAIL" value="15" />
                    <opcode name="UpdateTraceFail" symbol="OPCODE_UPDATE_TRACE_FAIL" value="16" />
                    <opcode name="QueryKernelGroupmaskFail" symbol="OPCODE_QUERY_KERNEL_GROUPMASK_FAIL" value="17" />
                    <opcode name="QueryKernelCallstackFlagsFail" symbol="OPCODE_QUERY_KERNEL_CALLSTACK_FLAGS_FAIL" value="18" />
                    <opcode name="OpenTraceFail" symbol="OPCODE_OPEN_TRACE_FAIL" value="19" />
                    <opcode name="ProcessTraceFail" symbol="OPCODE_PROCESS_TRACE_FAIL" value="20" />

                    <opcode name="BootSettings" symbol="OPCODE_BOOT_SETTINGS" value="30" />
                    <opcode name="SetPreconfig" symbol="OPCODE_SET_PRECONFIG" value="31" />
                    <opcode name="TriggerDllLoadFailure" symbol="OPCODE_TRIGGER_DLL_LOAD_FAILURE" value="32" />
                    <opcode name="TriggerDllEntryPointNotFound" symbol="OPCODE_TRIGGER_DLL_ENTRY_POINT_NOT_FOUND" value="33" />
                    <opcode name="TriggerCreationFailure" symbol="OPCODE_TRIGGER_CREATION_FAILURE" value="34" />
                    <opcode name="FailTooManyTriggers" symbol="OPCODE_FAIL_TOO_MANY_TRIGGERS" value="35" />
                    <opcode name="FailWrongState" symbol="OPCODE_FAIL_WRONG_STATE" value="36" />
                    <opcode name="SkipFlush" symbol="OPCODE_SKIP_FLUSH" value="37" />
                    <opcode name="Upload" symbol="OPCODE_UPLOAD" value="38" />
                    <opcode name="SkipUpload" symbol="OPCODE_SKIP_UPLOAD" value="39" />
                    <opcode name="ServiceEngineState" symbol="OPCODE_SERVICE_ENGINE_STATE" value="40" />
                    <opcode name="ProviderChange" symbol="OPCODE_PROVIDER_CHANGE" value="41" />
                    <opcode name="ProviderSkipChange" symbol="OPCODE_PROVIDER_SKIP_CHANGE" value="42" />
                    <opcode name="ProviderRestore" symbol="OPCODE_PROVIDER_RESTORE" value="43" />
                    <opcode name="ProviderSkipRestore" symbol="OPCODE_PROVIDER_SKIP_RESTORE" value="44" />
                    <opcode name="ModeChange" symbol="OPCODE_MODE_CHANGE" value="45" />
                    <opcode name="ModeChangeFailed" symbol="OPCODE_MODE_CHANGE_FAILED" value="46" />

                    <opcode name="Enable" symbol="OPCODE_ENABLE" value="50" />
                    <opcode name="EnableFailed" symbol="OPCODE_ENABLE_FAILED" value="51" />
                    <opcode name="Disable" symbol="OPCODE_DISABLE" value="52" />
                    <opcode name="Pause" symbol="OPCODE_PAUSE" value="53" />
                    <opcode name="Resume" symbol="OPCODE_RESUME" value="54" />
                    <opcode name="Signal" symbol="OPCODE_SIGNAL" value="55" />
                    <opcode name="IgnoreSignal" symbol="OPCODE_IGNORE_SIGNAL" value="56" />

                    <opcode name="FailedToOpenFile" symbol="OPCODE_FAILED_TO_OPEN_FILE" value="60" />
                    <opcode name="ParseError" symbol="OPCODE_PARSE_ERROR" value="61" />
                    <opcode name="InvalidNode" symbol="OPCODE_INVALID_NODE" value="62" />
                    <opcode name="InvalidAttributeName" symbol="OPCODE_INVALID_ATTRIBUTE_NAME" value="63" />
                    <opcode name="InvalidAttributeValue" symbol="OPCODE_INVALID_ATTRIBUTE_VALUE" value="64" />
                    <opcode name="UnresolvedReference" symbol="OPCODE_UNRESOLVED_REFERENCE" value="65" />
                    <opcode name="MissingAttribute" symbol="OPCODE_MISSING_ATTRIBUTE" value="66" />
                    <opcode name="IllegalAttribute" symbol="OPCODE_ILLEGAL_ATTRIBUTE" value="67" />

                    <opcode name="BatteryLevel" symbol="OPCODE_BATTERY_LEVEL" value="70" />
                    <opcode name="AcOnline" symbol="OPCODE_AC_ONLINE" value="71" />
                    <opcode name="UserIdle" symbol="OPCODE_USER_IDLE" value="72" />

                    <opcode name="BatteryLevelRundown" symbol="OPCODE_BATTERY_LEVEL_RUNDOWN" value="80" />
                    <opcode name="AcOnlineRundown" symbol="OPCODE_AC_ONLINE_RUNDOWN" value="81" />
                    <opcode name="UserIdleRundown" symbol="OPCODE_USER_IDLE_RUNDOWN" value="82" />
                </opcodes>

                <events>

                    <!-- Initialization -->

                    <event value="100"
                        symbol="Service_Start"
                        keywords="Initialization Service"
                        level="win:Informational"
                        task="Service"
                        opcode="win:Start" />

                    <event value="101"
                        symbol="Service_Stop"
                        keywords="Initialization Service"
                        level="win:Informational"
                        task="Service"
                        opcode="win:Stop" />

                    <event value="102"
                        symbol="ServiceEngineState"
                        keywords="Initialization Service"
                        level="win:Informational"
                        task="Service"
                        opcode="ServiceEngineState"
                        template="tid_ServiceEngineState"
                        message="$(string.Events.ServiceEngineState)" />

                    <event value="110"
                        symbol="FlushThread_Start"
                        keywords="Initialization"
                        level="win:Informational"
                        task="FlushThread"
                        opcode="win:Start" />

                    <event value="111"
                        symbol="FlushThread_Stop"
                        keywords="Initialization"
                        level="win:Informational"
                        task="FlushThread"
                        opcode="win:Stop" />

                    <event value="112"
                        symbol="FlushThreadWaitForBoot_Start"
                        keywords="Initialization"
                        level="win:Informational"
                        task="FlushThread_WaitForBoot"
                        opcode="win:Start" />

                    <event value="113"
                        symbol="FlushThreadWaitForBoot_Stop"
                        keywords="Initialization"
                        level="win:Informational"
                        task="FlushThread_WaitForBoot"
                        opcode="win:Stop" />

                    <event value="120"
                        symbol="BootSettings"
                        keywords="Initialization"
                        level="win:Informational"
                        task="Initialization"
                        opcode="BootSettings"
                        template="tid_BootSettings"
                        message="$(string.Events.BootSettings)" />

                    <event value="121"
                        symbol="SetPreconfig"
                        keywords="Initialization"
                        level="win:Informational"
                        task="Initialization"
                        opcode="SetPreconfig"
                        template="tid_PreconfigValue"
                        message="$(string.Events.SetPreconfig)" />

                    <event value="130"
                        symbol="TriggerDllLoadFailure"
                        keywords="Initialization Error"
                        level="win:Error"
                        task="Initialization"
                        opcode="TriggerDllLoadFailure"
                        template="tid_DllTriggerInfo"
                        message="$(string.Events.TriggerDllLoadFailure)" />

                    <event value="131"
                        symbol="TriggerDllEntryPointNotFound"
                        keywords="Initialization Error"
                        level="win:Error"
                        task="Initialization"
                        opcode="TriggerDllEntryPointNotFound"
                        template="tid_DllTriggerInfo"
                        message="$(string.Events.TriggerDllEntryPointNotFound)" />

                    <event value="132"
                        symbol="TriggerCreationFailure"
                        keywords="Initialization Error"
                        level="win:Error"
                        task="Initialization"
                        opcode="TriggerCreationFailure"
                        template="tid_DllTriggerInfo"
                        message="$(string.Events.TriggerCreationFailure)" />

                    <event value="133"
                        symbol="FailTooManyTriggers"
                        keywords="Initialization Error"
                        level="win:Error"
                        task="Initialization"
                        opcode="FailTooManyTriggers"
                        message="$(string.Events.FailTooManyTriggers)" />

                    <!-- Collection -->

                    <event value="190"
                        symbol="FailWrongState"
                        keywords="Error Service"
                        level="win:Error"
                        task="Service"
                        opcode="FailWrongState"
                        template="tid_ServiceState"
                        message="$(string.Events.FailWrongState)" />

                    <event value="200"
                        symbol="Upload"
                        keywords="Collection"
                        level="win:Error"
                        task="Collection"
                        opcode="Upload"
                        template="tid_Upload"
                        message="$(string.Events.Upload)" />
                        
                    <event value="201"
                        symbol="UploadFailed"
                        keywords="Error Service"
                        level="win:Error"
                        task="Service"
                        opcode="Upload"
                        template="tid_UInt32"
                        message="$(string.Events.UploadFailed)" />

                    <event value="210"
                        symbol="Flush_Start"
                        keywords="Collection Performance"
                        level="win:Informational"
                        task="Flush"
                        opcode="win:Start" />

                    <event value="211"
                        symbol="Flush_Stop"
                        keywords="Collection Performance"
                        level="win:Informational"
                        task="Flush"
                        opcode="win:Stop" />

                    <event value="212"
                        symbol="SkipFlush"
                        keywords="Collection"
                        level="win:Warning"
                        task="Collection"
                        opcode="SkipFlush"
                        message="$(string.Events.SkipFlush)" />

                    <event value="213"
                        symbol="FlushFile"
                        keywords="Collection"
                        level="win:Informational"
                        task="Flush"
                        opcode="win:Info"
                        template="tid_FlushFile" />

                    <event value="220"
                        symbol="Profile_Start"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Profile"
                        opcode="win:Start"
                        template="tid_ProfileStart"
                        message="$(string.Events.ProfileStart)" />

                    <event value="221"
                        symbol="Profile_Stop"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Profile"
                        opcode="win:Stop" />

                    <event value="230"
                        symbol="SkipUpload"
                        keywords="Collection"
                        level="win:Warning"
                        task="Collection"
                        opcode="SkipUpload"
                        message="$(string.Events.SkipUpload)" />

                    <event value="240"
                        symbol="ProviderChange"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Collection"
                        opcode="ProviderChange"
                        template="tid_ProviderInfo"
                        message="$(string.Events.ProviderChange)" />

                    <event value="241"
                        symbol="ProviderSkipChange"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Collection"
                        opcode="ProviderSkipChange"
                        template="tid_ProviderInfo"
                        message="$(string.Events.ProviderSkipChange)" />

                    <event value="242"
                        symbol="ProviderRestore"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Collection"
                        opcode="ProviderRestore"
                        template="tid_ProviderInfo"
                        message="$(string.Events.ProviderRestore)" />

                    <event value="243"
                        symbol="ProviderSkipRestore"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Collection"
                        opcode="ProviderSkipRestore"
                        template="tid_ProviderInfo"
                        message="$(string.Events.ProviderSkipRestore)" />

                    <event value="250"
                        symbol="ModeChange"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Collection"
                        opcode="ModeChange"
                        template="tid_ModeChange"
                        message="$(string.Events.ModeChange)" />

                    <event value="251"
                        symbol="ModeChangeFailed"
                        keywords="Collection"
                        level="win:Error"
                        task="Collection"
                        opcode="ModeChangeFailed"
                        template="tid_EtwFailure"
                        message="$(string.Events.ModeChangeFailed)" />

                    <event value="260"
                        symbol="TriggerEnable"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Trigger"
                        opcode="Enable"
                        template="tid_Trigger"
                        message="$(string.Events.TriggerEnable)" />

                    <event value="261"
                        symbol="TriggerEnableFailed"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Trigger"
                        opcode="EnableFailed"
                        template="tid_TriggerEnableFailed"
                        message="$(string.Events.TriggerEnableFailed)" />

                    <event value="262"
                        symbol="TriggerDisable"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Trigger"
                        opcode="Disable"
                        template="tid_Trigger"
                        message="$(string.Events.TriggerDisable)" />

                    <event value="263"
                        symbol="TriggerPause"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Trigger"
                        opcode="Pause"
                        template="tid_Trigger"
                        message="$(string.Events.TriggerPause)" />

                    <event value="264"
                        symbol="TriggerResume"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Trigger"
                        opcode="Resume"
                        template="tid_Trigger"
                        message="$(string.Events.TriggerResume)" />

                    <event value="265"
                        symbol="TriggerSignal"
                        keywords="Collection"
                        level="win:Error"
                        task="Trigger"
                        opcode="Signal"
                        template="tid_Trigger"
                        message="$(string.Events.TriggerSignal)" />

                    <event value="266"
                        symbol="TriggerIgnoreSignal"
                        keywords="Collection"
                        level="win:Verbose"
                        task="Trigger"
                        opcode="IgnoreSignal"
                        template="tid_Trigger"
                        message="$(string.Events.TriggerIgnoreSignal)" />

                    <!-- ETW -->

                    <event value="300"
                        symbol="StartTraceFail"
                        keywords="Error ETW"
                        level="win:Error"
                        task="ETW"
                        opcode="StartTraceFail"
                        template="tid_EtwFailure"
                        message="$(string.Events.StartTraceFail)" />

                    <event value="301"
                        symbol="QueryTraceFail"
                        keywords="Error ETW"
                        level="win:Error"
                        task="ETW"
                        opcode="QueryTraceFail"
                        template="tid_EtwFailure"
                        message="$(string.Events.QueryTraceFail)" />

                    <event value="302"
                        symbol="FlushTraceFail"
                        keywords="Error ETW"
                        level="win:Error"
                        task="ETW"
                        opcode="FlushTraceFail"
                        template="tid_EtwFailure"
                        message="$(string.Events.FlushTraceFail)" />

                    <event value="303"
                        symbol="EnumerateTraceGuidsFail"
                        keywords="Error ETW"
                        level="win:Error"
                        task="ETW"
                        opcode="EnumerateTraceGuidsFail"
                        template="tid_EtwFailure"
                        message="$(string.Events.EnumerateTraceGuidsFail)" />

                    <event value="304"
                        symbol="QueryProviderNotFound"
                        keywords="Error ETW"
                        level="win:Informational"
                        task="ETW"
                        opcode="QueryProviderNotFound"
                        template="tid_EtwQueryProviderNotFound"
                        message="$(string.Events.QueryProviderNotFound)" />

                    <event value="305"
                        symbol="EnableTraceFail"
                        keywords="Error ETW"
                        level="win:Error"
                        task="ETW"
                        opcode="EnableTraceFail"
                        template="tid_EtwFailure"
                        message="$(string.Events.EnableTraceFail)" />

                    <event value="306"
                        symbol="UpdateTraceFail"
                        keywords="Error ETW"
                        level="win:Error"
                        task="ETW"
                        opcode="UpdateTraceFail"
                        template="tid_EtwFailure"
                        message="$(string.Events.UpdateTraceFail)" />

                    <event value="307"
                        symbol="QueryKernelGroupmaskFail"
                        keywords="Error ETW"
                        level="win:Error"
                        task="ETW"
                        opcode="QueryKernelGroupmaskFail"
                        template="tid_EtwFailure"
                        message="$(string.Events.QueryKernelGroupmaskFail)" />

                    <event value="308"
                        symbol="QueryKernelCallstackFlagsFail"
                        keywords="Error ETW"
                        level="win:Error"
                        task="ETW"
                        opcode="QueryKernelCallstackFlagsFail"
                        template="tid_EtwFailure"
                        message="$(string.Events.QueryKernelCallstackFlagsFail)" />

                    <event value="309"
                        symbol="OpenTraceFail"
                        keywords="Error ETW"
                        level="win:Error"
                        task="ETW"
                        opcode="OpenTraceFail"
                        template="tid_EtwFailure"
                        message="$(string.Events.OpenTraceFail)" />

                    <event value="310"
                        symbol="ProcessTraceFail"
                        keywords="Error ETW"
                        level="win:Error"
                        task="ETW"
                        opcode="ProcessTraceFail"
                        template="tid_EtwFailure"
                        message="$(string.Events.ProcessTraceFail)" />

                    <!-- XmlParser -->

                    <event value="400"
                        symbol="XmlParserFailedToOpenFile"
                        keywords="Error XmlParser"
                        level="win:Error"
                        task="XmlParser"
                        opcode="FailedToOpenFile"
                        template="tid_XmlParserFailedToOpenFile"
                        message="$(string.Events.XmlParserFailedToOpenFile)" />

                    <event value="401"
                        symbol="XmlParserError"
                        keywords="Error XmlParser"
                        level="win:Error"
                        task="XmlParser"
                        opcode="ParseError"
                        template="tid_XmlParserError"
                        message="$(string.Events.XmlParserError)" />

                    <event value="402"
                        symbol="InvalidXmlNode"
                        keywords="Error XmlParser"
                        level="win:Error"
                        task="XmlParser"
                        opcode="InvalidNode"
                        template="tid_InvalidXmlString"
                        message="$(string.Events.InvalidXmlNode)" />

                    <event value="403"
                        symbol="InvalidXmlAttributeName"
                        keywords="Error XmlParser"
                        level="win:Error"
                        task="XmlParser"
                        opcode="InvalidAttributeName"
                        template="tid_InvalidXmlString"
                        message="$(string.Events.InvalidXmlAttributeName)" />

                    <event value="404"
                        symbol="InvalidXmlAttributeValue"
                        keywords="Error XmlParser"
                        level="win:Error"
                        task="XmlParser"
                        opcode="InvalidAttributeValue"
                        template="tid_InvalidXmlString"
                        message="$(string.Events.InvalidXmlAttributeValue)" />

                    <event value="405"
                        symbol="UnresolvedXmlReference"
                        keywords="Error XmlParser"
                        level="win:Error"
                        task="XmlParser"
                        opcode="UnresolvedReference"
                        template="tid_InvalidXmlString"
                        message="$(string.Events.UnresolvedXmlReference)" />

                    <event value="406"
                        symbol="MissingXmlAttribute"
                        keywords="Error XmlParser"
                        level="win:Error"
                        task="XmlParser"
                        opcode="MissingAttribute"
                        template="tid_InvalidXmlString"
                        message="$(string.Events.MissingXmlAttribute)" />

                    <event value="407"
                        symbol="IllegalXmlAttribute"
                        keywords="Error XmlParser"
                        level="win:Error"
                        task="XmlParser"
                        opcode="IllegalAttribute"
                        template="tid_IllegalXmlString"
                        message="$(string.Events.IllegalXmlAttribute)" />

                    <event value="500"
                        symbol="BatteryLevel"
                        keywords="PowerState"
                        level="win:Error"
                        task="PowerState"
                        opcode="BatteryLevel"
                        template="tid_UInt32"
                        message="$(string.Events.WnfState)" />

                    <event value="501"
                        symbol="AcOnline"
                        keywords="PowerState"
                        level="win:Error"
                        task="PowerState"
                        opcode="AcOnline"
                        template="tid_Boolean"
                        message="$(string.Events.WnfState)" />

                    <event value="502"
                        symbol="UserIdle"
                        keywords="PowerState"
                        level="win:Error"
                        task="PowerState"
                        opcode="UserIdle"
                        template="tid_Boolean"
                        message="$(string.Events.WnfState)" />

                    <event value="510"
                        symbol="BatteryLevelRundown"
                        keywords="PowerState"
                        level="win:Error"
                        task="PowerState"
                        opcode="BatteryLevelRundown"
                        template="tid_UInt32"
                        message="$(string.Events.WnfState)" />

                    <event value="511"
                        symbol="AcOnlineRundown"
                        keywords="PowerState"
                        level="win:Error"
                        task="PowerState"
                        opcode="AcOnlineRundown"
                        template="tid_Boolean"
                        message="$(string.Events.WnfState)" />

                    <event value="512"
                        symbol="UserIdleRundown"
                        keywords="PowerState"
                        level="win:Error"
                        task="PowerState"
                        opcode="UserIdleRundown"
                        template="tid_Boolean"
                        message="$(string.Events.WnfState)" />

                </events>

            </provider>

        </events>
    </instrumentation>

    <localization>
        <resources culture="en-US">
            <stringTable>

                <string id="Maps.PerfXInitializationState.PERFX_INIT_PENDING" value="pending" />
                <string id="Maps.PerfXInitializationState.PERFX_INIT_FAILED" value="failed" />
                <string id="Maps.PerfXInitializationState.PERFX_INIT_SUCCEEDED" value="succeeded" />
                <string id="Maps.PerfXCollectionState.PERFX_COLLECTION_STOPPED" value="stopped" />
                <string id="Maps.PerfXCollectionState.PERFX_COLLECTION_PENDING" value="pending" />
                <string id="Maps.PerfXCollectionState.PERFX_COLLECTION_RUNNING" value="running" />

                <string id="Events.FailWrongState" value="Fail RPC call due to bad state, Service initialization state=%1, Collection state=%2" />
                <string id="Events.TriggerDllLoadFailure" value="Trigger DLL not found (DLL=%1, EntryPoint=%2, TriggerName=%3, hr=%4" />
                <string id="Events.TriggerDllEntryPointNotFound" value="Trigger DLL entry point not found (DLL=%1, EntryPoint=%2, TriggerName=%3, hr=%4" />
                <string id="Events.TriggerCreationFailure" value="Trigger creation failure (DLL=%1, EntryPoint=%2, TriggerName=%3, hr=%4" />
                <string id="Events.Upload" value="Upload, TraceMineId=%1" />
                <string id="Events.UploadFailed" value="Upload failed with hr = %1" />
                <string id="Events.SkipFlush" value="Skipping flush because collection is disabled" />
                <string id="Events.ProfileStart" value="Start Profiler, Duration=%1 ms" />
                <string id="Events.SkipUpload" value="Skipping upload, still inside ThrottleIntervalSeconds" />
                <string id="Events.ServiceEngineState" value="ServiceEngine State: %1, HRESULT: %2" />
                <string id="Events.BootSettings" value="PerfX boot settings: enabled=%1 preconfig=%2" />
                <string id="Events.SetPreconfig" value="Preconfig is now [%1]=%2" />
                <string id="Events.ProviderChange" value="Change collection for provider %1 in session %2" />
                <string id="Events.ProviderSkipChange" value="Session %2 not found, not modifying settings for provider %1" />
                <string id="Events.ProviderRestore" value="Restore state for provider %1 in session %2" />
                <string id="Events.ProviderSkipRestore" value="Session %2 not found, not restoring settings for provider %1" />
                <string id="Events.ModeChange" value="Mode transition from %1 to %2" />
                <string id="Events.ModeChangeFailed" value="Failed to change collection modes with hr=%1" />

                <string id="Events.TriggerEnable" value="Enable trigger %1" />
                <string id="Events.TriggerEnableFailed" value="Failed to enable trigger %1, hr=%2" />
                <string id="Events.TriggerDisable" value="Disable trigger %1" />
                <string id="Events.TriggerPause" value="Pause trigger %1" />
                <string id="Events.TriggerResume" value="Resume trigger %1" />
                <string id="Events.TriggerSignal" value="Signal trigger %1" />
                <string id="Events.TriggerIgnoreSignal" value="Ignore signal for disabled/paused trigger %1" />
                <string id="Events.FailTooManyTriggers" value="Cannot enable preconfig, too many triggers" />

                <string id="Events.StartTraceFail" value="StartTrace failed, result=%1" />
                <string id="Events.QueryTraceFail" value="QueryTrace failed, result=%1" />
                <string id="Events.FlushTraceFail" value="FlushTrace failed, result=%1" />
                <string id="Events.EnumerateTraceGuidsFail" value="EnumerateTraceGuidsEx failed, result=%1" />
                <string id="Events.QueryProviderNotFound" value="QueryProvider failed to find ProviderGuid=%1" />
                <string id="Events.EnableTraceFail" value="EnableTraceEx2 failed, result=%1" />
                <string id="Events.UpdateTraceFail" value="UpdateTrace failed, result=%1" />
                <string id="Events.QueryKernelGroupmaskFail" value="QueryKernelGroupmask failed, result=%1" />
                <string id="Events.QueryKernelCallstackFlagsFail" value="QueryKernelCallstackFlags failed, result=%1" />
                <string id="Events.OpenTraceFail" value="OpenTrace failed, result=%1" />
                <string id="Events.ProcessTraceFail" value="ProcessTrace failed, result=%1" />

                <string id="Events.XmlParserFailedToOpenFile" value="Failed to open XML file %1" />
                <string id="Events.XmlParserError" value="XML parser: error in %1, line %2 column %3" />
                <string id="Events.InvalidXmlNode" value="XML parser: encountered invalid node %1" />
                <string id="Events.InvalidXmlAttributeName" value="XML parser: encountered invalid attribute %1" />
                <string id="Events.InvalidXmlAttributeValue" value="XML parser: encountered invalid value %1" />
                <string id="Events.UnresolvedXmlReference" value="XML parser: unresolved reference to %1" />
                <string id="Events.MissingXmlAttribute" value="XML parser: %1 object is missing a required attribute" />
                <string id="Events.IllegalXmlAttribute" value="XML parser: %1 object contains an illegal attribute %2" />

                <string id="Events.WnfState" value="State is %1." />

            </stringTable>
        </resources>
    </localization>

</instrumentationManifest>

