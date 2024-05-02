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
                name="Microsoft-WindowsPhone-Tools-PerfX-Trigger"
                guid="{CC12990B-86EE-44c3-BF21-CE4F6686944A}"
                messageFileName="PerfXTrigger.dll"
                resourceFileName="PerfXTrigger.dll"
                symbol="MICROSOFT_WINDOWSPHONE_TOOLS_PERFX_TRIGGER">

                <keywords>
                    <keyword mask="0x0000000000000001" name="Error" />
                    <keyword mask="0x0000000000000002" name="Performance" />
                    <keyword mask="0x0000000000000004" name="Initialization" />
                    <keyword mask="0x0000000000000008" name="Collection" />
                    <keyword mask="0x0000000000000100" name="CpuTrigger" />
                    <keyword mask="0x0000000000000200" name="DiskFlushTrigger" />
                    <keyword mask="0x0000000000000400" name="HardFaultTrigger" />
                    <keyword mask="0x0000000000000800" name="TotalContentionTrigger" />
                    <keyword mask="0x0000000000001000" name="ProcessMemoryTrigger" />
                    <keyword mask="0x0000000000002000" name="MemoryEventTrigger" />
                    <keyword mask="0x0000000000004000" name="IdleDropTrigger" />
                    <keyword mask="0x0000000000008000" name="SimpleEtwTrigger" />
                </keywords>

                <templates>

                    <template tid="tid_CpuTriggerData">
                        <data name="CpuPercent" inType="win:UInt32" outType="xs:unsignedInt" />
                        <data name="ElapsedTimeMS" inType="win:UInt64" outType="xs:unsignedLong" />
                    </template>

                    <template tid="tid_DiskFlushTriggerData">
                        <data name="NumDiskFlushes" inType="win:UInt32" outType="xs:unsignedInt" />
                        <data name="ElapsedTimeMS" inType="win:UInt32" outType="xs:unsignedInt" />
                    </template>

                    <template tid="tid_HardFaultTriggerData">
                        <data name="NumHardFaults" inType="win:UInt32" outType="xs:unsignedInt" />
                        <data name="ElapsedTimeMS" inType="win:UInt32" outType="xs:unsignedInt" />
                    </template>

                    <template tid="tid_TotalContentionTriggerData">
                        <data name="NumContentions" inType="win:UInt32" outType="xs:unsignedInt" />
                        <data name="ElapsedTimeMS" inType="win:UInt32" outType="xs:unsignedInt" />
                    </template>

                    <template tid="tid_ProcessMemoryTriggerData">
                        <data name="ProcessId" inType="win:UInt32" outType="xs:unsignedInt" />
                        <data name="PeakCommitSizeMB" inType="win:UInt32" outType="xs:unsignedInt" />
                    </template>

                    <template tid="tid_MemoryEventOpenFailed">
                        <data name="EventName" inType="win:UnicodeString" />
                        <data name="NTSTATUS" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="tid_MemoryEventSignal">
                        <data name="EventName" inType="win:UnicodeString" />
                    </template>

                    <template tid="tid_WnfNotificationReceived">
                        <data name="OldValue" inType="win:UInt32" outType="xs:unsignedInt" />
                        <data name="NewValue" inType="win:UInt32" outType="xs:unsignedInt" />
                    </template>

                    <template tid="tid_BatteryDropTime">
                        <data name="DeltaMillis" inType="win:UInt32" outType="xs:unsignedInt" />
                    </template>

                    <template tid="tid_SimpleEtwTriggerData">
                        <data name="FriendlyName" inType="win:UnicodeString" outType="xs:string" />
                        <data name="EventId" inType="win:UInt32" outType="xs:unsignedInt" />
                        <data name="ProviderGuid" inType="win:GUID" outType="xs:GUID" />
                    </template>

                </templates>

                <tasks>
                    <task name="CpuTrigger" symbol="TASK_CPU_TRIGGER" value="10" />
                    <task name="DiskFlushTrigger" symbol="TASK_DISK_FLUSH_TRIGGER" value="11" />
                    <task name="HardFaultTrigger" symbol="TASK_HARD_FAULT_TRIGGER" value="12" />
                    <task name="TotalContentionTrigger" symbol="TASK_TOTAL_CONTENTION_TRIGGER" value="13" />
                    <task name="ProcessMemoryTriggerData" symbol="TASK_PROCESS_MEMORY_GROWTH_VS_INTERVAL" value="14" />
                    <task name="MemoryEventTrigger" symbol="TASK_MEMORY_EVENT_TRIGGER" value="16" />
                    <task name="IdleDropTrigger" symbol="TASK_IDLE_DROP_TRIGGER" value="17" />
                    <task name="SimpleEtwTrigger" symbol="TASK_SIMPLE_ETW_TRIGGER" value="18" />
                </tasks>

                <opcodes>
                    <opcode name="Data" symbol="OPCODE_DATA" value="10" />
                    <opcode name="InitFail" symbol="OPCODE_INIT_FAIL" value="11" />
                    <opcode name="Trigger" symbol="OPCODE_TRIGGER" value="12" />

                    <opcode name="BatteryDropTime" symbol="OPCODE_BATTERY_DROP_TIME" value="40" />
                    <opcode name="StartListening" symbol="OPCODE_START_LISTENING" value="41" />
                    <opcode name="StopListening" symbol="OPCODE_STOP_LISTENING" value="42" />
                </opcodes>

                <events>

                    <event value="100"
                        symbol="CpuTriggerData"
                        keywords="Collection CpuTrigger"
                        level="win:Informational"
                        task="CpuTrigger"
                        opcode="Trigger"
                        template="tid_CpuTriggerData"
                        message="$(string.Events.CpuTriggerData)" />

                    <event value="110"
                        symbol="DiskFlushTriggerData"
                        keywords="Collection DiskFlushTrigger"
                        level="win:Informational"
                        task="DiskFlushTrigger"
                        opcode="Trigger"
                        template="tid_DiskFlushTriggerData"
                        message="$(string.Events.DiskFlushTriggerData)" />

                    <event value="120"
                        symbol="HardFaultTriggerData"
                        keywords="Collection HardFaultTrigger"
                        level="win:Informational"
                        task="HardFaultTrigger"
                        opcode="Trigger"
                        template="tid_HardFaultTriggerData"
                        message="$(string.Events.HardFaultTriggerData)" />

                    <event value="130"
                        symbol="TotalContentionTriggerData"
                        keywords="Collection TotalContentionTrigger"
                        level="win:Informational"
                        task="TotalContentionTrigger"
                        opcode="Trigger"
                        template="tid_TotalContentionTriggerData"
                        message="$(string.Events.TotalContentionTriggerData)" />

                    <event value="140"
                        symbol="ProcessMemoryTriggerData"
                        keywords="Collection ProcessMemoryTrigger"
                        level="win:Informational"
                        task="ProcessMemoryTriggerData"
                        opcode="Trigger"
                        template="tid_ProcessMemoryTriggerData"
                        message="$(string.Events.ProcessMemoryTriggerData)" />

                    <event value="150"
                        symbol="MemoryEventTriggerInitFail"
                        keywords="Error Initialization MemoryEventTrigger"
                        level="win:Error"
                        task="MemoryEventTrigger"
                        opcode="InitFail"
                        template="tid_MemoryEventOpenFailed"
                        message="$(string.Events.MemoryEventTriggerInitFail)" />

                    <event value="151"
                        symbol="MemoryEventTriggerSignal"
                        keywords="Collection MemoryEventTrigger"
                        level="win:Informational"
                        task="MemoryEventTrigger"
                        opcode="Trigger"
                        template="tid_MemoryEventSignal"
                        message="$(string.Events.MemoryEventTriggerSignal)" />

                    <event value="163"
                        symbol="IdleDropTriggerBatteryDropTime"
                        keywords="IdleDropTrigger"
                        level="win:Informational"
                        task="IdleDropTrigger"
                        opcode="BatteryDropTime"
                        template="tid_BatteryDropTime"
                        message="$(string.Events.IdleDropTriggerBatteryDropTime)" />

                    <event value="164"
                        symbol="IdleDropTriggerStartListening"
                        keywords="IdleDropTrigger"
                        level="win:Informational"
                        task="IdleDropTrigger"
                        opcode="StartListening"
                        message="$(string.Events.IdleDropTriggerStartListening)" />

                    <event value="165"
                        symbol="IdleDropTriggerStopListening"
                        keywords="IdleDropTrigger"
                        level="win:Informational"
                        task="IdleDropTrigger"
                        opcode="StopListening"
                        message="$(string.Events.IdleDropTriggerStopListening)" />

                    <event value="166"
                        symbol="IdleDropTriggerSignal"
                        keywords="Collection IdleDropTrigger"
                        level="win:Informational"
                        task="IdleDropTrigger"
                        opcode="Trigger"
                        message="$(string.Events.IdleDropTriggerSignal)" />

                    <event value="170"
                        symbol="SimpleEtwTriggerData"
                        keywords="Collection SimpleEtwTrigger"
                        level="win:Informational"
                        task="SimpleEtwTrigger"
                        opcode="Trigger"
                        template="tid_SimpleEtwTriggerData"
                        message="$(string.Events.SimpleEtwTriggerData)" />

                </events>

            </provider>

        </events>
    </instrumentation>

    <localization>
        <resources culture="en-US">
            <stringTable>

                <string id="Events.CpuTriggerData" value="Cpu was at %1 percent, %2 ms" />
                <string id="Events.DiskFlushTriggerData" value="%1 disk flushes in %2 ms" />
                <string id="Events.HardFaultTriggerData" value="%1 hard faults in %2 ms" />
                <string id="Events.TotalContentionTriggerData" value="%1 contentions in %2 ms" />
                <string id="Events.ProcessMemoryTriggerData" value="ProcessId=%1, PeakCommitSize=%2 MB" />
                <string id="Events.MemoryEventTriggerInitFail" value="Failed to open memory event %1 with NTSTATUS=%2" />
                <string id="Events.MemoryEventTriggerSignal" value="Memory event %1 signaled" />
                <string id="Events.WnfNotificationUserIdle" value="WnfNotification for UserIdle: Old = %1, New = %2" />
                <string id="Events.WnfNotificationAcChanged" value="WnfNotification for AcChanged: Old = %1, New = %2" />
                <string id="Events.WnfNotificationBatteryDrop" value="WnfNotification for BatteryDrop: Old = %1, New = %2" />
                <string id="Events.IdleDropTriggerBatteryDropTime" value="Battery drop occurred %1ms into listening session." />
                <string id="Events.IdleDropTriggerStartListening" value="User idle and on battery power, beginning to listen for battery events." />
                <string id="Events.IdleDropTriggerStopListening" value="User not idle or not on battery power, no longer listening for battery events." />
                <string id="Events.IdleDropTriggerSignal" value="Battery drop occured in inappropriately short time, signalling." />
                <string id="Events.SimpleEtwTriggerData" value="SimpleEtwTrigger:%1 hit the max event threshold for event %1 on provider %2." />
            </stringTable>
        </resources>
    </localization>

</instrumentationManifest>


