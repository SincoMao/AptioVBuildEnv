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
        <events xmlns="http://schemas.microsoft.com/win/2004/08/events">
            <provider 
                name="Microsoft-WindowsMobile-TaskScheduler" 
                guid="{E8F90FE5-8C92-4146-A764-305AAF12B066}" 
                symbol="MICROSOFT_WINDOWSMOBILE_TASKSCHEDULER" 
                resourceFileName="TaskSchedulerSvc.dll" 
                messageFileName="TaskSchedulerSvc.dll"
                >
    
                <keywords>
                    <keyword mask="0x0000000000000001" name="Error" />
                    <keyword mask="0x0000000000000002" name="API" />
                    <keyword mask="0x0000000000000004" name="Security" />
                    <keyword mask="0x0000000000000008" name="Initialization" />
                    <keyword mask="0x0000000000000010" name="ScheduleManager" />
                    <keyword mask="0x0000000000000020" name="TimerManager" />
                    <keyword mask="0x0000000000000040" name="Storage" />
                    <keyword mask="0x0000000000000080" name="Schedule" />
                    <keyword mask="0x0000000000000100" name="Trigger" />
                    <keyword mask="0x0000000000000200" name="WNF" />
                    <keyword mask="0x0000000000000400" name="Aggregate" />
                    <keyword mask="0x0000000000000800" name="Evaluate" />
                    <keyword mask="0x0000000000001000" name="Action" />
                    <keyword mask="0x0000000000002000" name="Timer" />
                    <keyword mask="0x0000000000004000" name="Coalesce" />
                    <keyword mask="0x0000000000008000" name="Time" />
                    <keyword mask="0x0000000000010000" name="TimeChange" />
                    <keyword mask="0x0000000000020000" name="Performance" />
                    <keyword mask="0x0000000000040000" name="Broker" />
                    <keyword mask="0x0000000000080000" name="State" />
                    <keyword mask="0x0000000000100000" name="Nqm" />
                    <keyword mask="0x0000000000200000" name="WNFDelay" />
                </keywords>

                <tasks>
                    <task name="TaskInitialization"                value="1" />
                    <task name="TaskDeinitialization"              value="2" />
                    <task name="TaskLoadSchedules"                 value="3" />
                    <task name="TaskConstructSchedule"             value="4" />
                    <task name="TaskTimerThread"                   value="5" />
                    <task name="TaskTimeChangeEvent"               value="6" />
                    <task name="TaskWNFEvent"                      value="7" />
                    <task name="TaskActionLaunch"                  value="8" />
                    <task name="TaskAction"                        value="9" />
                    <task name="TaskTrigger"                       value="10" />
                    <task name="TaskTriggerEvaluate"               value="11" />
                    <task name="TaskCoalesce"                      value="12" />
                    <task name="TaskFindSchedule"                  value="13" />
                    <task name="TaskAdvanceSchedule"               value="14" />
                    <task name="BrokerFrameworkEvent"              value="15" />
                    <task name="TaskActionLaunchNQM"               value="16" />
                </tasks>

                <opcodes>
                    <opcode name="Initialization_Parameters"       value="12" />

                    <opcode name="API_CreateSchedule"              value="13" />
                    <opcode name="API_DeleteSchedule"              value="14" />
                    <opcode name="API_FindFirstSchedule"           value="15" />
                    <opcode name="API_FindNextSchedule"            value="16" />
                    <opcode name="API_FindScheduleClose"           value="17" />
                    <opcode name="API_GetSchedule"                 value="18" />
                    <opcode name="API_EnableSchedule"              value="19" />
                    <opcode name="API_ExecuteSchedule"             value="20" />
                    <opcode name="API_AdvanceSchedule"             value="21" />
                    <opcode name="API_SnoozeSchedule"              value="22" />
                    <opcode name="API_GetPublishStateName"         value="23" />
                    <opcode name="API_ServiceControl"              value="24" />

                    <opcode name="Scheduler_WaitTime"              value="25" />
                 
                    <opcode name="TimeChangeEvent_Parameters"      value="26" />

                    <opcode name="TimerEvent_Triggered"            value="27" />

                    <opcode name="ActionLaunch_Launch"             value="28" />
                    <opcode name="ActionLaunch_Parameters"         value="29" />
                    <opcode name="ActionLaunch_Results"            value="30" />

                    <opcode name="ConstructSchedule_Parameters"    value="31" />
                    
                    <opcode name="WNFEvent_Parameters"             value="32" />
                    
                    <opcode name="Coalesce_WaitTime"               value="33" />

                    <opcode name="Action_CreateAction"             value="34" />
                    <opcode name="Trigger_CreateTrigger"           value="35" />

                    <opcode name="Storage_RegistryWrite"           value="36" />
                    <opcode name="ActionLaunch_LaunchNQM"          value="37" />
                </opcodes>

                <templates>
                    <template tid="ObjectType">
                        <data name="TheObjectType" inType="win:UInt32" map="ObjectType"/>
                    </template>

                    <template tid="Integer">
                        <data name="IntegerValue" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="LongLongInteger">
                        <data name="LongLongValue" inType="win:Int64" />
                    </template>

                    <template tid="InitParameters">
                        <data name="TimeScale" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="TimeZoneID" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="Bias" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="StandardBias" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="DaylightBias" inType="win:UInt32" outType="win:HexInt32" />
                    </template>
                    
                    <template tid="LaunchTemplate">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="Path" inType="win:UnicodeString" />
                        <data name="CmdLine" inType="win:UnicodeString" />
                        <UserData>
                            <ExecManLogEvent xmlns="em">
                                <Path> %1 </Path>
                                <CmdLine> %2 </CmdLine>
                            </ExecManLogEvent>
                        </UserData>
                    </template>

                    <template tid="ScheduleNameGuid">
                        <data name="ScheduleName" inType="win:UnicodeString" />
                        <data name="ScheduleID" inType="win:GUID" />
                    </template>

                    <template tid="BackgroundWorkTemplate">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="URI" inType="win:UnicodeString" />
                    </template>

                    <template tid="GuidTwoSystemTimes">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="Time1" inType="win:SYSTEMTIME" />
                        <data name="Time2" inType="win:SYSTEMTIME" />
                    </template>

                    <template tid="TwoSystemTimes">
                        <data name="Time1" inType="win:SYSTEMTIME" />
                        <data name="Time2" inType="win:SYSTEMTIME" />
                    </template>

                    <template tid="GuidSystemTimeHR">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="Time" inType="win:SYSTEMTIME" />
                        <data name="HRESULT" inType="win:UInt32" outType="xs:HexInt32"/>
                    </template>

                    <template tid="PublishWNFTemplate">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="HiName" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="LoName" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="Datasize" inType="win:UInt32" outType="win:HexInt32" />
                        <UserData>
                            <ExecManLogEvent xmlns="em">
                                <HiName> %1 </HiName>
                                <LoName> %2 </LoName>
                                <Datasize> %3 </Datasize>
                            </ExecManLogEvent>
                        </UserData>
                    </template>

                    <template tid="WNFTemplate">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="HiName" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="LoName" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="WnfSubsTemplate">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="ScheduleAddress" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="HiName" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="LoName" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="ChangeStamp" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="WnfSubsTemplate2">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="ScheduleAddress" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="HiName" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="LoName" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="SignalEventTemplate">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="Eventname" inType="win:UnicodeString" />
                        <UserData>
                            <ExecManLogEvent xmlns="em">
                                <Eventname> %1 </Eventname>
                            </ExecManLogEvent>
                        </UserData>
                    </template>

                    <template tid="HResultTemplate">
                        <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
                        <UserData>
                            <ExecManLogEvent xmlns="em">
                                <HRESULT> %1 </HRESULT>
                            </ExecManLogEvent>
                        </UserData>
                    </template>

                    <template tid="Time">
                        <data name="wMonth" inType="win:UInt16" />
                        <data name="wDay" inType="win:UInt16" />
                        <data name="wYear" inType="win:UInt16" />
                        <data name="wHour" inType="win:UInt16" />
                        <data name="wMinute" inType="win:UInt16" />
                        <data name="wSecond" inType="win:UInt16" />
                        <UserData>
                            <ExecManLogEvent xmlns="em">
                                <HRESULT> %1 </HRESULT>
                            </ExecManLogEvent>
                        </UserData>
                    </template>

                    <template tid="ConstructScheduleTemplate">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="ScheduleName" inType="win:UnicodeString" />
                        <data name="HasRuntimeData" inType="win:Boolean" />
                        <data name="IsFromStore" inType="win:Boolean" />
                    </template>
                    
                    <template tid="TimeDate">
                        <data name="wYear" inType="win:UInt16" />
                        <data name="wMonth" inType="win:UInt16" />
                        <data name="wDay" inType="win:UInt16" />

                        <data name="wHour" inType="win:UInt16" />
                        <data name="wMinute" inType="win:UInt16" />
                        <data name="wSecond" inType="win:UInt16" />
                        <data name="wMilliseconds" inType="win:UInt16" />

                        <data name="TzID" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="InDST" inType="win:Boolean" />
                    </template>

                    <template tid="SystemTimeDateTemplate">
                        <data name="wYear" inType="win:UInt16" />
                        <data name="wMonth" inType="win:UInt16" />
                        <data name="wDay" inType="win:UInt16" />

                        <data name="wHour" inType="win:UInt16" />
                        <data name="wMinute" inType="win:UInt16" />
                        <data name="wSecond" inType="win:UInt16" />
                        <data name="wMilliseconds" inType="win:UInt16" />
                    </template>

                    <template tid="TimeChangeInfo">
                        <data name="TimeDifference" inType="win:Int64" />
                        <data name="TimeBiasDifference" inType="win:Int64" />
                    </template>

                    <template tid="timeMS_S">
                        <data name="WaitTimeMS" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="WaitTimeS" inType="win:Double" />
                    </template>

                    <template tid="GuidTemplate">
                        <data name="ScheduleGuid" inType="win:GUID" />
                    </template>

                    <template tid="GuidAndAddressTemplate">
                        <data name="ScheduleGuid" inType="win:GUID" />
                        <data name="ScheduleAddress" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="ActionType">
                        <data name="TheActionType" inType="win:UInt32" map="ActionType"/>
                    </template>

                    <template tid="WNFEvent">
                        <data name="WNFData0" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="WNFData1" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="ChangeStamp" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="DelayedWNFEvent">
                        <data name="WNFData0" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="WNFData1" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="TimeFormat">
                        <data name="IsUTCTime" inType="win:UInt32" map="TimeFormatType"/>
                    </template>

                    <template tid="NQMMode">
                        <data name="HasNQMMode" inType="win:UInt32" map="NQMModeType"/>
                    </template>
                    

                    <template tid="TriggerType">
                        <data name="TheTriggerType" inType="win:UInt32" map="TriggerType"/>
                    </template>

                    <template tid="PeriodicTriggerType">
                        <data name="TheTriggerType" inType="win:UInt32" map="PeriodicTriggerType"/>
                    </template>

                    <template tid="AggregateType">
                        <data name="TheAggregateType" inType="win:UInt32" map="AggregateType"/>
                    </template>

                    <template tid="AggregateTriggerType">
                        <data name="TheAggregateType" inType="win:UInt32" map="AggregateType"/>
                        <data name="AggregateLevel" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="SubtriggerCount" inType="win:UInt32" outType="win:HexInt32" />
                    </template>
                    
                    <template tid="CEAggregateTriggerType">
                        <data name="TheCEAggregateType" inType="win:UInt32" map="CEAggregateType"/>
                        <data name="ConditionsCount" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="tempInt64">
                        <data name="Int64Number" inType="win:Int64" />
                    </template>

                    <template tid="tempBoolean">
                        <data name="BooleanNumber" inType="win:Boolean" />
                    </template>

                    <template tid="tempSystemEventHeader">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="EventTriger" inType="win:UInt32" map="EventTriggerType"/>
                        <data name="LevelValue" inType="win:UInt32" map="LevelValueType" />
                        <data name="DataSize" inType="win:UInt32" />
                        <data name="Range" inType="win:UInt32" />
                        <data name="SessionID" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="tempPeriodicEvaluate">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="BooleanNumber" inType="win:Boolean" />
                    </template>

                    <template tid="tempAlarmEvaluate">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="BooleanNumber" inType="win:Boolean" />
                    </template>

                    <template tid="tempWNFEvaluateWithState">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="WNFData0" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="WNFData1" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="BooleanNumber" inType="win:Boolean" />
                    </template>

                    <template tid="tempWNFState">
                        <data name="WNFData0" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="WNFData1" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                    <template tid="tempAggregateEvaluate">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="AggregateLevel" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="BooleanNumber" inType="win:Boolean" />
                    </template>

                    <template tid="tempCEAggregateEvaluate">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="BooleanNumber" inType="win:Boolean" />
                    </template>

                    <template tid="tempCSebDelete">
                        <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="WNFData0" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="WNFData1" inType="win:UInt32" outType="win:HexInt32" />
                    </template>
                    
                    <template tid="tempScheduleStateChange">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="InitialState" inType="win:UInt32" map="ScheduleStateType" />
                        <data name="FinalState" inType="win:UInt32" map="ScheduleStateType" />
                    </template>

                    <template tid="tempScheduleState">
                        <data name="ScheduleID" inType="win:GUID" />
                        <data name="FinalState" inType="win:UInt32" map="ScheduleStateType" />
                    </template>

                    <template tid="AdhocCreationMode">
                        <data name="TheCreationMode" inType="win:UInt32" map="AdhocCreationMode"/>
                    </template>

                    <template tid="EventKey">
                        <data name="EventKey" inType="win:HexInt64" outType="win:HexInt64" />
                        <data name="Subscription" inType="win:HexInt32" outType="win:HexInt32" />
                        <data name="ScheduleCount" inType="win:HexInt32" outType="win:HexInt32" />
                    </template>
                    <template tid="EventNode">
                        <data name="Schedule" inType="win:Pointer" />
                        <data name="Id" inType="win:GUID" />
                        <data name="RefCount" inType="win:HexInt32" />
                        <data name="ChangeStamp" inType="win:HexInt32" />
                    </template>

                </templates>

                <maps>
                    <valueMap name="ObjectType">
                        <map value="0" message="$(string.ObjectType.TimerMgr)"/>
                        <map value="1" message="$(string.ObjectType.TaskStore)"/>
                        <map value="2" message="$(string.ObjectType.TimeInfo)"/>
                        <map value="3" message="$(string.ObjectType.TimeIntervalManager)"/>
                        <map value="4" message="$(string.ObjectType.TimebaseManager)"/>
                    </valueMap>
                    <valueMap name="TimeFormatType">
                        <map value="0" message="$(string.TimeFormatType.Local)"/>
                        <map value="1" message="$(string.TimeFormatType.UTC)"/>
                    </valueMap>
                    <valueMap name="NQMModeType">
                        <map value="0" message="$(string.NQMModeType.NoNQM)"/>
                        <map value="1" message="$(string.NQMModeType.HasNQM)"/>
                    </valueMap>
                    <valueMap name="ActionType">
                        <map value="0" message="$(string.ActionType.Launch)"/>
                        <map value="1" message="$(string.ActionType.BackgroundWork)"/>
                        <map value="2" message="$(string.ActionType.Signal)"/>
                        <map value="3" message="$(string.ActionType.Publish)"/>
                        <map value="4" message="$(string.ActionType.PublishAdhoc)"/>
                    </valueMap>
                    <valueMap name="TriggerType">
                        <map value="0" message="$(string.TriggerType.Periodic)"/>
                        <map value="1" message="$(string.TriggerType.WNFState)"/>
                        <map value="2" message="$(string.TriggerType.Aggregate)"/>
                        <map value="3" message="$(string.TriggerType.Se)"/>
                        <map value="4" message="$(string.TriggerType.CEAggregate)"/>
                        <map value="5" message="$(string.TriggerType.Alarm)"/>
                        <map value="6" message="$(string.TriggerType.PeriodicEx)"/>
                    </valueMap>
                    <valueMap name="PeriodicTriggerType">
                        <map value="0" message="$(string.PeriodicTriggerType.Maximum)"/>
                        <map value="1" message="$(string.PeriodicTriggerType.Average)"/>
                    </valueMap>
                    <valueMap name="AggregateType">
                        <map value="0" message="$(string.AggregateType.And)"/>
                        <map value="1" message="$(string.AggregateType.Or)"/>
                    </valueMap>
                    <valueMap name="CEAggregateType">
                        <map value="0" message="$(string.AggregateType.And)"/>
                        <map value="1" message="$(string.AggregateType.Or)"/>
                    </valueMap>
                    <valueMap name="EventTriggerType">
                        <map value="0" message="$(string.EventTriggerType.Level)"/>
                        <map value="1" message="$(string.EventTriggerType.Edge)"/>
                    </valueMap>
                    <valueMap name="LevelValueType">
                        <map value="0" message="$(string.LevelValueType.Zero)"/>
                        <map value="1" message="$(string.LevelValueType.One)"/>
                    </valueMap>
                    <valueMap name="ScheduleStateType">
                        <map value="0" message="$(string.ScheduleStateType.Invalid)"/>
                        <map value="1" message="$(string.ScheduleStateType.Initializing)"/>
                        <map value="2" message="$(string.ScheduleStateType.Waiting)"/>
                        <map value="3" message="$(string.ScheduleStateType.PendingStart)"/>
                        <map value="4" message="$(string.ScheduleStateType.Running)"/>
                        <map value="5" message="$(string.ScheduleStateType.Completed)"/>
                        <map value="6" message="$(string.ScheduleStateType.Unloading)"/>
                        <map value="7" message="$(string.ScheduleStateType.Error)"/>
                    </valueMap>
                    <valueMap name="AdhocCreationMode">
                        <map value="0" message="$(string.AdhocCreation.UseExisting)"/>
                        <map value="1" message="$(string.AdhocCreation.CreateNew)"/>
                    </valueMap>
                    
                </maps>
        
                <events>
                    <event
                        value="1"
                        level="win:Error"
                        keywords="Error Security"                        
                        template="HResultTemplate"
                        symbol="SecurityError"
                        message="$(string.Error.Security)"
                        />
                    <event
                        value="2"
                        level="win:Critical"
                        keywords="Error"                        
                        template="ObjectType"
                        symbol="ObjectCreationError"
                        message="$(string.Error.ObjectCreation)"
                        />
                    <event
                        value="3"
                        level="win:Critical"
                        keywords="Error"                        
                        template="Integer"
                        symbol="MemoryAllocationError"
                        message="$(string.Error.MemoryAlloc)"
                        />
                    <event 
                        value="4"
                        level="win:Informational"
                        symbol="ServiceInitializeStarted"
                        task="TaskInitialization"
                        opcode="win:Start"
                        keywords="Initialization Performance"
                        message="$(string.Initialization.Started)"
                        />
                    <event 
                        value="5"
                        level="win:Informational"
                        symbol="ServiceInitializeCompleted"
                        task="TaskInitialization"
                        opcode="win:Stop"
                        keywords="Initialization Performance"
                        message="$(string.Initialization.Completed)"
                        />
                    <event 
                        value="6"
                        level="win:Verbose"
                        symbol="ServiceInitializePhase1Started"
                        task="TaskInitialization"
                        opcode="win:Start"
                        keywords="Initialization Performance"
                        message="$(string.Initialization.Phase1.Started)"
                        />
                    <event 
                        value="7"
                        level="win:Verbose"
                        symbol="ServiceInitializePhase1Completed"
                        task="TaskInitialization"
                        opcode="win:Stop"
                        keywords="Initialization Performance"
                        message="$(string.Initialization.Phase1.Completed)"
                        />
                    <event 
                        value="8"
                        level="win:Verbose"
                        symbol="ServiceInitializePhase2Started"
                        task="TaskInitialization"
                        opcode="win:Start"
                        keywords="Initialization Performance"
                        message="$(string.Initialization.Phase2.Started)"
                        />
                    <event 
                        value="9"
                        level="win:Verbose"
                        symbol="ServiceInitializePhase2Completed"
                        task="TaskInitialization"
                        opcode="win:Stop"
                        keywords="Initialization Performance"
                        message="$(string.Initialization.Phase2.Completed)"
                        />
                    <event 
                        value="10"
                        level="win:Verbose"
                        symbol="LoadSchedulesStarted"
                        task="TaskLoadSchedules"
                        opcode="win:Start"
                        keywords="Initialization Performance ScheduleManager Schedule Storage"
                        message="$(string.LoadSchedules.Started)"
                        />
                    <event 
                        value="11"
                        level="win:Verbose"
                        symbol="LoadSchedulesCompleted"
                        task="TaskLoadSchedules"
                        opcode="win:Stop"
                        keywords="Initialization Performance ScheduleManager Schedule Storage"
                        message="$(string.LoadSchedules.Completed)"
                        />
                    <event
                        value="12"
                        level="win:Warning"
                        keywords="Error Schedule"                        
                        template="GuidTemplate"
                        symbol="ScheduleNotFoundWarning"
                        message="$(string.Error.ScheduleNotFound)"
                        />
                    <event
                        value="13"
                        level="win:Critical"
                        keywords="Error"                        
                        template="HResultTemplate"
                        symbol="RPCRegistrationError"
                        message="$(string.Error.RPCRegistration)"
                        />
                    <event
                        value="14"
                        level="win:Informational"
                        template="InitParameters"
                        symbol="InitializationParameters"
                        task="TaskInitialization"
                        opcode="Initialization_Parameters"
                        keywords="Initialization"
                        message="$(string.Initialization.InitParameters)"
                        /> 
                    <event 
                        value="15"
                        level="win:Informational"
                        symbol="ServiceStartsCount"
                        task="TaskInitialization"
                        template="Integer"
                        opcode="Initialization_Parameters"
                        keywords="Initialization"
                        message="$(string.Initialization.ServiceStarts)"
                        />
                    <event 
                        value="16"
                        level="win:Verbose"
                        symbol="ServiceUninitializeStarted"
                        task="TaskDeinitialization"
                        opcode="win:Start"
                        keywords="Initialization Performance"
                        message="$(string.Uninitialization.Started)"
                        />
                    <event 
                        value="17"
                        level="win:Verbose"
                        symbol="ServiceUninitializeCompleted"
                        task="TaskDeinitialization"
                        opcode="win:Stop"
                        keywords="Initialization Performance"
                        message="$(string.Uninitialization.Completed)"
                        />
                    <event
                        value="18"
                        level="win:Error"
                        keywords="Error Security"                        
                        symbol="FailedRetrievingCallerSID"                        
                        message="$(string.Error.RetrievingSidError)"
                        />

                    <event
                        value="20"
                        level="win:Warning"
                        opcode="Initialization_Parameters"
                        keywords="Error Schedule Initialization"                        
                        symbol="InvalidScheduleData"
                        task="TaskConstructSchedule"
                        message="$(string.Error.InvalidScheduleData)"
                        />
                    <event 
                        value="21"
                        level="win:Error"
                        template="GuidTemplate"
                        symbol="InitializeScheduleFailedGuid"
                        task="TaskConstructSchedule"
                        keywords="Error Schedule Initialization"                        
                        message="$(string.Error.InitializeScheduleFailedGuid)"
                        />
                    <event 
                        value="22"
                        level="win:Error"
                        symbol="InitializeScheduleFailed"
                        task="TaskConstructSchedule"
                        keywords="Error Schedule Initialization"                        
                        message="$(string.Error.InitializeScheduleFailed)"
                        />
                    <event 
                        value="23"
                        level="win:Warning"
                        symbol="AdvanceExceedsScheduleMaxRuncount"
                        keywords="Error Schedule"
                        message="$(string.Error.AdvanceExceedsMaxRuncount)"
                        />
                    <event 
                        value="25"
                        level="win:Warning"
                        symbol="ScheduleNotReadyForSnooze"
                        keywords="Error Schedule"
                        message="$(string.Error.ScheduleNotReadyForSnooze)"
                        />
                    <event 
                        value="26"
                        level="win:Error"
                        symbol="ActionCreationError"
                        template="ActionType"
                        task="TaskConstructSchedule"
                        keywords="Error Action"
                        message="$(string.Error.ActionCreationFailed)"
                        />
                    <event
                        value="27"
                        level="win:Critical"
                        keywords="Error Security Action"                        
                        template="HResultTemplate"
                        symbol="SecurityErrorTokenCreate"
                        message="$(string.Error.SecurityTokenCreate)"
                        />
                    <event 
                        value="28"
                        level="win:Informational"
                        template="LaunchTemplate"
                        keywords="Action"
                        symbol="LaunchTask"
                        task="TaskActionLaunch"
                        opcode="ActionLaunch_Launch"
                        message="$(string.Action.Launch)"
                        />
                    <event 
                        value="29"
                        level="win:Informational"
                        template="BackgroundWorkTemplate"
                        keywords="Action"
                        symbol="LaunchBackgroundWork"
                        task="TaskActionLaunch"
                        opcode="ActionLaunch_Launch"
                        message="$(string.Action.BackgroundWork)"
                        />
                    <event 
                        value="30"
                        level="win:Informational"
                        template="PublishWNFTemplate"
                        keywords="Action"
                        symbol="Publish"
                        task="TaskActionLaunch"
                        opcode="ActionLaunch_Launch"
                        message="$(string.Action.Publish)"
                        />
                    <event
                        value="31"
                        level="win:Informational"
                        template="SignalEventTemplate"
                        keywords="Action"
                        symbol="Signal"
                        task="TaskActionLaunch"
                        opcode="ActionLaunch_Launch"
                        message="$(string.Action.Signal)"
                        />
                    <event
                        value="32"
                        level="win:Informational"
                        opcode="ActionLaunch_Results"
                        keywords="Action"                        
                        symbol="ActionResults"
                        task="TaskActionLaunch"
                        template="HResultTemplate"
                        message="$(string.Action.Results)"
                        />
                    <event
                        value="33"
                        level="win:Informational"
                        opcode="ActionLaunch_Results"
                        keywords="Action"                        
                        symbol="ActionTimestamp"
                        task="TaskActionLaunch"
                        template="Time"
                        message="$(string.Action.Results.Timestamp)"
                        />
                    <event 
                        value="35"
                        level="win:Warning"
                        symbol="TriggerSnoozePastIntervalError"
                        keywords="Error Trigger"
                        message="$(string.Error.Trigger.SnoozePastInterval)"
                        />
                    <event 
                        value="36"
                        level="win:Verbose"
                        symbol="TimerProcessingStart"
                        task="TaskTimerThread"
                        opcode="win:Start"
                        template="Integer"
                        keywords="Performance TimerManager Timer"
                        message="$(string.TimerProcessing.Started)"
                        />
                    <event 
                        value="37"
                        level="win:Verbose"
                        symbol="TimerProcessingCompleted"
                        task="TaskTimerThread"
                        opcode="win:Stop"
                        keywords="Performance TimerManager Timer"
                        message="$(string.TimerProcessing.Completed)"
                        />
                    <event 
                        value="38"
                        level="win:Informational"
                        symbol="WNFEventProcessingStart"
                        template="DelayedWNFEvent"
                        task="TaskWNFEvent"
                        opcode="win:Start"
                        keywords="Performance WNF"
                        message="$(string.WNFProcessing.Started)"
                        />
                    <event 
                        value="39"
                        level="win:Informational"
                        symbol="WNFEventProcessingCompleted"
                        template="WNFEvent"
                        task="TaskWNFEvent"
                        opcode="win:Stop"
                        keywords="Performance WNF"
                        message="$(string.WNFProcessing.Completed)"
                        />
                    <event 
                        value="40"
                        level="win:Verbose"
                        symbol="TimeChangeProcessingStart"
                        task="TaskTimeChangeEvent"
                        opcode="win:Start"
                        keywords="Performance TimeChange"
                        template="LongLongInteger"
                        message="$(string.TimeChange.Started)"
                        />
                    <event 
                        value="41"
                        level="win:Verbose"
                        symbol="TimeChangeProcessingCompleted"
                        task="TaskTimeChangeEvent"
                        opcode="win:Stop"
                        keywords="Performance TimeChange"
                        message="$(string.TimeChange.Completed)"
                        />
                    <event 
                        value="42"
                        level="win:Verbose"
                        symbol="TimerThreadStart"
                        task="TaskTimerThread"
                        opcode="win:Start"
                        keywords="Performance TimerManager Timer"
                        message="$(string.TimerThread.Started)"
                        />
                    <event 
                        value="43"
                        level="win:Verbose"
                        symbol="TimerThreadCompleted"
                        task="TaskTimerThread"
                        opcode="win:Stop"
                        keywords="Performance TimerManager Timer"
                        message="$(string.TimerThread.Completed)"
                        />
                    <event 
                        value="44"
                        level="win:Verbose"
                        symbol="TimeDateLocal"
                        template="TimeDate"
                        keywords="Time"
                        message="$(string.TaskScheduler.TimeDateInfoLocal)"
                        />
                    <event 
                        value="45"
                        level="win:Verbose"
                        symbol="TimeDateUTC"
                        template="TimeDate"
                        keywords="Time"
                        message="$(string.TaskScheduler.TimeDateInfoUTC)"
                        />
                    <event 
                        value="46"
                        level="win:Informational"
                        template="ConstructScheduleTemplate"
                        symbol="ConstructSchedule"
                        task="TaskConstructSchedule"
                        opcode="win:Start"
                        keywords="Performance Schedule Initialization"
                        message="$(string.Schedule.Construct.Started)"
                        />
                    <event 
                        value="47"
                        level="win:Verbose"
                        template="HResultTemplate"
                        symbol="ConstructScheduleCompleted"
                        task="TaskConstructSchedule"
                        opcode="win:Stop"
                        keywords="Performance Schedule Initialization"
                        message="$(string.Schedule.Construct.Completed)"
                        />
                    <event 
                        value="48"
                        level="win:Verbose"
                        template="TimeFormat"
                        symbol="ScheduleTimeFormat"
                        task="TaskConstructSchedule"
                        keywords="Initialization Schedule"
                        message="$(string.Schedule.TimeFormat)"
                        />
                    <event 
                        value="49"
                        level="win:Verbose"
                        template="SystemTimeDateTemplate"
                        symbol="StartTimeDate"
                        task="TaskConstructSchedule"
                        keywords="Initialization Time Schedule"
                        message="$(string.Schedule.Construct.StartTimeAndDate)"
                        />
                    <event 
                        value="50"
                        level="win:Verbose"
                        template="SystemTimeDateTemplate"
                        symbol="EndTimeDate"
                        task="TaskConstructSchedule"
                        keywords="Initialization Time Schedule"
                        message="$(string.Schedule.Construct.EndTimeAndDate)"
                        />
                    <event 
                        value="51"
                        level="win:Verbose"
                        template="SystemTimeDateTemplate"
                        symbol="CreateTimeDate"
                        task="TaskConstructSchedule"
                        keywords="Initialization Time Schedule"
                        message="$(string.Schedule.Construct.CreateTimeAndDate)"
                        />
                    <event 
                        value="52"
                        level="win:Warning"
                        symbol="InvalidTimes"
                        task="TaskConstructSchedule"
                        keywords="Initialization Time Error Schedule"
                        message="$(string.Error.Schedule.InvalidTimes)"
                        />
                    <event 
                        value="53"
                        level="win:Error"
                        symbol="TriggerCreationError"
                        template="TriggerType"
                        task="TaskConstructSchedule"
                        keywords="Error Trigger"
                        message="$(string.Error.TriggerCreationFailed)"
                        />
                    <event 
                        value="54"
                        level="win:Verbose"
                        template="Integer"
                        symbol="MaxRuncount"
                        task="TaskConstructSchedule"
                        keywords="Initialization Schedule"
                        message="$(string.Schedule.Construct.MaxScheduleRuncount)"
                        />

                    <event 
                        value="55"
                        level="win:Verbose"
                        template="Integer"
                        symbol="ScheduleFlags"
                        task="TaskConstructSchedule"
                        keywords="Initialization Schedule"
                        message="$(string.Schedule.Construct.ScheduleFlags)"
                        />
                    <event
                        value="56"
                        level="win:Error"
                        keywords="Error Security Schedule"
                        template="HResultTemplate"
                        task="TaskConstructSchedule"
                        symbol="FailedToEstablishSecurityCredentials"
                        message="$(string.Error.Schedule.Security)"
                        />

                    <event
                        value="58"
                        level="win:Informational"
                        template="TimeChangeInfo"
                        symbol="TimeChangeInformation"
                        task="TaskTimeChangeEvent"
                        keywords="TimeChange"
                        opcode="TimeChangeEvent_Parameters"
                        message="$(string.TimeChange.TimeChangeInfo)"
                        />
                    <event 
                        value="59"
                        level="win:Informational"
                        symbol="WNFEvent"
                        template="WNFEvent"
                        task="TaskWNFEvent"
                        opcode="WNFEvent_Parameters"
                        keywords="WNF"
                        message="$(string.WNFProcessing.WNFEvent)"
                        />

                    <event 
                        value="63"
                        level="win:Verbose"
                        template="ActionType"
                        symbol="ScheduleActionType"
                        task="TaskAction"
                        opcode="Action_CreateAction"
                        keywords="Action Initialization"
                        message="$(string.Action.ActionType)"
                        />
                    <event 
                        value="64"
                        level="win:Verbose"
                        template="TriggerType"
                        symbol="ScheduleTriggerType"
                        task="TaskTrigger"
                        opcode="Trigger_CreateTrigger"
                        keywords="Trigger Initialization"
                        message="$(string.Trigger.TriggerType)"
                        />
                    <event 
                        value="65"
                        level="win:Informational"
                        symbol="APICreateSchedule"
                        task="TaskConstructSchedule"
                        keywords="API Schedule"
                        opcode="API_CreateSchedule"
                        message="$(string.API.CreateSchedule)"
                        />
                    <event 
                        value="66"
                        level="win:Informational"
                        symbol="APIDeleteSchedule"
                        keywords="API Schedule"
                        opcode="API_DeleteSchedule"
                        template="GuidTemplate"
                        message="$(string.API.DeleteSchedule)"
                        />
                    <event 
                        value="67"
                        level="win:Informational"
                        symbol="APIFindFirstSchedule"
                        task="TaskFindSchedule"
                        keywords="API Schedule"
                        opcode="API_FindFirstSchedule"
                        message="$(string.API.FindFirstSchedule)"
                        />
                    <event 
                        value="68"
                        level="win:Informational"
                        symbol="APIFindNextSchedule"
                        task="TaskFindSchedule"
                        keywords="API Schedule"
                        opcode="API_FindNextSchedule"
                        message="$(string.API.FindNextSchedule)"
                        />
                    <event 
                        value="69"
                        level="win:Informational"
                        symbol="APIFindScheduleClose"
                        task="TaskFindSchedule"
                        keywords="API Schedule"
                        opcode="API_FindScheduleClose"
                        message="$(string.API.FindScheduleClose)"
                        />
                    <event 
                        value="70"
                        level="win:Informational"
                        symbol="APIGetSchedule"
                        keywords="API Schedule"
                        opcode="API_GetSchedule"
                        template="GuidTemplate"
                        message="$(string.API.GetSchedule)"
                        />
                    <event 
                        value="71"
                        level="win:Informational"
                        symbol="APIEnableSchedule"
                        keywords="API Schedule"
                        opcode="API_EnableSchedule"
                        template="GuidTemplate"
                        message="$(string.API.EnableSchedule)"
                        />
                    <event 
                        value="72"
                        level="win:Informational"
                        symbol="APIExecuteSchedule"
                        keywords="API Schedule"
                        opcode="API_ExecuteSchedule"
                        template="GuidTemplate"
                        message="$(string.API.ExecuteSchedule)"
                        />
                    <event 
                        value="73"
                        level="win:Informational"
                        symbol="APIAdvanceSchedule"
                        task="TaskAdvanceSchedule"
                        keywords="API Schedule"
                        opcode="API_AdvanceSchedule"
                        template="GuidTemplate"
                        message="$(string.API.AdvanceSchedule)"
                        />
                    <event 
                        value="74"
                        level="win:Informational"
                        symbol="APIAdvanceScheduleIntervals"
                        task="TaskAdvanceSchedule"
                        keywords="API Schedule"
                        opcode="API_AdvanceSchedule"
                        template="GuidTemplate"
                        message="$(string.API.AdvanceScheduleIntervals)"
                        />
                    <event 
                        value="75"
                        level="win:Informational"
                        symbol="APISnoozeSchedule"
                        keywords="API Schedule"
                        opcode="API_SnoozeSchedule"
                        template="GuidTemplate"
                        message="$(string.API.SnoozeSchedule)"
                        />
                    <event 
                        value="76"
                        level="win:Informational"
                        symbol="APIGetPublishStateName"
                        keywords="API Schedule WNF"
                        opcode="API_GetPublishStateName"
                        template="GuidTemplate"
                        message="$(string.API.GetPublishStateName)"
                        />
                    <event 
                        value="77"
                        level="win:Informational"
                        symbol="APIServiceControl"
                        keywords="API"
                        opcode="API_ServiceControl"
                        template="Integer"
                        message="$(string.API.ServiceControl)"
                        />
                    <event
                        value="78"
                        level="win:Critical"
                        keywords="Error"                        
                        template="HResultTemplate"
                        symbol="InvalidTZID"
                        message="$(string.Error.InvalidTZID)"
                        />
                    <event 
                        value="79"
                        level="win:Warning"
                        keywords="Error"
                        symbol="TimeDifferenceExceedsMaxInterval"
                        message="$(string.Error.TimeDifferenceExceedsMaxInterval)"
                        />
                    <event 
                        value="80"
                        level="win:Warning"
                        keywords="Error"
                        symbol="LevelWnfStateEarlyTriggerOverride"
                        message="$(string.Error.LevelWnfStateEarlyTriggerOverride)"
                        />
                    <event 
                        value="81"
                        level="win:Error"
                        keywords="Error"
                        symbol="DelayedEarlyTriggerError"
                        message="$(string.Error.DelayedEarlyTriggerError)"
                        />
                    <event 
                        value="82"
                        level="win:Verbose"
                        template="LaunchTemplate"
                        keywords="Action Initialization"
                        symbol="LaunchSet"
                        task="TaskAction"
                        message="$(string.Action.Launch.Set)"
                        />
                    <event 
                        value="83"
                        level="win:Verbose"
                        template="BackgroundWorkTemplate"
                        keywords="Action Initialization"
                        symbol="WorkSet"
                        message="$(string.Action.BackgroundWork.Set)"
                        />
                    <event 
                        value="84"
                        level="win:Verbose"
                        template="SignalEventTemplate"
                        keywords="Action Initialization"
                        symbol="EventSet"
                        message="$(string.Action.Event.Set)"
                        />
                    <event 
                        value="85"
                        level="win:Verbose"
                        keywords="Action Initialization"
                        symbol="PublishSet"
                        message="$(string.Action.Publish.Set)"
                        />
                    <event 
                        value="86"
                        level="win:Verbose"
                        keywords="Action Initialization"
                        symbol="PublishAdhocSet"
                        message="$(string.Action.PublishAdhoc.Set)"
                        />
                    <event 
                        value="87"
                        level="win:Verbose"
                        template="PeriodicTriggerType"
                        symbol="PeriodicTriggerType"
                        task="TaskTrigger"
                        keywords="Trigger Initialization"
                        message="$(string.Trigger.PeriodicTriggerType)"
                        />
                    <event 
                        value="88"
                        level="win:Verbose"
                        template="tempInt64"
                        symbol="PeriodicIntervalMins"
                        task="TaskTrigger"
                        keywords="Trigger Initialization Time"
                        message="$(string.Trigger.PeriodicInterval)"
                        />
                    <event 
                        value="89"
                        level="win:Warning"
                        symbol="PeriodicContinuousRunInterval"
                        task="TaskTrigger"
                        keywords="Error Trigger Initialization"
                        message="$(string.Error.Trigger.ContinuousRunInterval)"
                        />
                    <event 
                        value="90"
                        level="win:Verbose"
                        symbol="PeriodicEarlyTrigger"
                        template="tempBoolean"
                        task="TaskTrigger"
                        keywords="Trigger Initialization Time"
                        message="$(string.Trigger.HasEarlyTrigger)"
                        />
                    <event 
                        value="91"
                        level="win:Verbose"
                        template="Integer"
                        symbol="PeriodicToleranceMins"
                        task="TaskTrigger"
                        keywords="Trigger Initialization Time"
                        message="$(string.Trigger.Tolerance)"
                        />
                    <event 
                        value="92"
                        level="win:Verbose"
                        template="SystemTimeDateTemplate"
                        symbol="TriggerStartTimeDate"
                        task="TaskTrigger"
                        keywords="Trigger Initialization Time"
                        message="$(string.Trigger.StartTimeAndDate)"
                        />
                    <event 
                        value="93"
                        level="win:Verbose"
                        template="SystemTimeDateTemplate"
                        symbol="NextTriggerTimeDate"
                        task="TaskTrigger"
                        keywords="Trigger Initialization Time"
                        message="$(string.Trigger.NextTriggerTimeAndDate)"
                        />
                    <event 
                        value="94"
                        level="win:Verbose"
                        template="SystemTimeDateTemplate"
                        symbol="SnoozedTriggerTimeDate"
                        task="TaskTrigger"
                        keywords="Trigger Initialization Time"
                        message="$(string.Trigger.SnoozedTriggerTimeAndDate)"
                        />
                    <event 
                        value="95"
                        level="win:Error"
                        symbol="FailedCreateEarlyTriggerError"
                        task="TaskTrigger"
                        keywords="Error Trigger Initialization"
                        message="$(string.Error.Trigger.FailedCreateEarlyTrigger)"
                        />
                    <event 
                        value="96"
                        level="win:Verbose"
                        template="SystemTimeDateTemplate"
                        symbol="HasRuntimeData"
                        task="TaskTrigger"
                        keywords="Trigger Initialization"
                        message="$(string.Trigger.HasRuntimeData)"
                        />
                    <event 
                        value="97"
                        level="win:Verbose"
                        symbol="WNFTriggerEvent"
                        template="WNFEvent"
                        task="TaskTrigger"
                        keywords="WNF Trigger"
                        message="$(string.Trigger.WNFTriggerEvent)"
                        />
                    <event 
                        value="98"
                        level="win:Verbose"
                        symbol="DelayedWNFTrigger"
                        template="Integer"
                        task="TaskTrigger"
                        keywords="WNF Trigger"
                        message="$(string.Trigger.DelayedWNFTrigger)"
                        />
                    <event 
                        value="99"
                        level="win:Verbose"
                        template="AggregateTriggerType"
                        symbol="AggregateTriggerSet"
                        task="TaskTrigger"
                        keywords="Aggregate Trigger Initialization"
                        message="$(string.Trigger.Aggregate.Set)"
                        />
                    <event 
                        value="100"
                        level="win:Error"
                        template="Integer"
                        symbol="TooManyAggregateLevelsError"
                        task="TaskTrigger"
                        keywords="Error Aggregate Trigger Initialization"
                        message="$(string.Error.Trigger.AggregateTooDeep)"
                        />
                    <event 
                        value="101"
                        level="win:Informational"
                        symbol="TriggeredInWnfHandler"
                        template="GuidTemplate"
                        task="TaskTrigger"
                        keywords="WNF Trigger Schedule"
                        message="$(string.Trigger.TriggeredInWnfHandler)"
                        />

                    <event 
                        value="103"
                        level="win:Verbose"
                        symbol="PeriodicTriggerEvaluate"
                        template="tempPeriodicEvaluate"
                        task="TaskTriggerEvaluate"
                        keywords="Timer Trigger Evaluate"
                        message="$(string.Trigger.PeriodicEvaluate)"
                        />
                    <event 
                        value="104"
                        level="win:Verbose"
                        symbol="WnfTriggerEvaluate"
                        template="tempWNFEvaluateWithState"
                        task="TaskTriggerEvaluate"
                        keywords="WNF Trigger Evaluate"
                        message="$(string.Trigger.WnfEvaluate)"
                        />
                    <event 
                        value="105"
                        level="win:Verbose"
                        symbol="WnfTriggerEvaluateWithState"
                        template="tempWNFEvaluateWithState"
                        task="TaskTriggerEvaluate"
                        keywords="WNF Trigger Evaluate"
                        message="$(string.Trigger.WnfEvaluateWithState)"
                        />
                    <event 
                        value="106"
                        level="win:Verbose"
                        symbol="AggregateTriggerEvaluate"
                        template="tempAggregateEvaluate"
                        task="TaskTriggerEvaluate"
                        keywords="Aggregate Trigger Evaluate"
                        message="$(string.Trigger.AggregateEvaluate)"
                        />
                    <event 
                        value="107"
                        level="win:Verbose"
                        template="Integer"
                        symbol="FindScheduleCount"
                        task="TaskFindSchedule"
                        keywords="ScheduleManager"
                        message="$(string.Find.ScheduleCount)"
                        />
                    <event 
                        value="108"
                        level="win:Warning"
                        symbol="FoundNoSchedules"
                        task="TaskFindSchedule"
                        keywords="ScheduleManager"
                        message="$(string.Find.NoSchedules)"
                        />
                    <event 
                        value="109"
                        level="win:Verbose"
                        template="Integer"
                        symbol="FindIndexIs"
                        task="TaskFindSchedule"
                        keywords="ScheduleManager"
                        message="$(string.Find.Index)"
                        />
                    <event 
                        value="110"
                        level="win:Error"
                        symbol="FindOperationNotStarted"
                        task="TaskFindSchedule"
                        keywords="ScheduleManager"
                        message="$(string.Error.Find.NotStarted)"
                        />
                    <event 
                        value="111"
                        level="win:Error"
                        symbol="FindOperationIsCompleted"
                        task="TaskFindSchedule"
                        keywords="ScheduleManager"
                        message="$(string.Error.Find.Completed)"
                        />
                    <event 
                        value="112"
                        level="win:Error"
                        symbol="PersistScheduleError"
                        task="TaskTimeChangeEvent"
                        template="GuidTemplate"
                        keywords="TimeChange ScheduleManager Storage"
                        message="$(string.Error.PersistSchedule)"
                        />
                    <event 
                        value="113"
                        level="win:Error"
                        symbol="NoTimechangeInfoProvidedError"
                        task="TaskTimeChangeEvent"
                        keywords="TimeChange ScheduleManager"
                        message="$(string.Error.NoTimechangeInfo)"
                        />
                    <event 
                        value="114"
                        level="win:Error"
                        symbol="PotentialContinuousRun"
                        task="TaskConstructSchedule"
                        keywords="Initialization Error Schedule Trigger"
                        message="$(string.Error.Trigger.PotentialContinuousRun)"
                        />
                    <event 
                        value="115"
                        level="win:Verbose"
                        symbol="RegistryWrite"
                        opcode="Storage_RegistryWrite"
                        message="$(string.Storage.RegistryWrite)"
                        keywords="Performance Storage"
                        />
                    <event 
                        value="116"
                        level="win:Informational"
                        symbol="DelayedWNFEventWaitComplete"
                        template="DelayedWNFEvent"
                        task="TaskWNFEvent"
                        keywords="WNF"
                        message="$(string.WNFProcessing.DelayedWNFEventWaitComplete)"
                        />
                    <event 
                        value="117"
                        level="win:Verbose"
                        symbol="BrokerFrameworkEventProcessingStart"
                        task="BrokerFrameworkEvent"
                        opcode="win:Start"
                        keywords="Performance Broker"
                        message="$(string.BrokerFrameworkEventProcessing.Started)"
                        />
                    <event 
                        value="118"
                        level="win:Verbose"
                        symbol="BrokerFrameworkEventProcessingCompleted"
                        task="BrokerFrameworkEvent"
                        opcode="win:Stop"
                        keywords="Performance Broker"
                        message="$(string.BrokerFrameworkEventProcessing.Completed)"
                        />


                    <event 
                        value="121"
                        level="win:Error"
                        symbol="ErrorDeleteCSebEvent"
                        template="tempCSebDelete"
                        keywords="Broker Trigger"
                        message="$(string.Error.Trigger.DeleteCSebEvent)"
                        />                        
                    <event 
                        value="122"
                        level="win:Verbose"
                        template="CEAggregateTriggerType"
                        symbol="CEAggregateTriggerSet"
                        task="TaskTrigger"
                        keywords="Broker Aggregate Trigger Initialization"
                        message="$(string.Trigger.CEAggregate.Set)"
                        />
                    <event 
                        value="123"
                        level="win:Verbose"
                        symbol="CEAggregateTriggerEvaluate"
                        template="tempCEAggregateEvaluate"
                        task="TaskTriggerEvaluate"
                        keywords="Broker Aggregate Trigger Evaluate"
                        message="$(string.Trigger.CEAggregateEvaluate)"
                        />
                    <event 
                        value="124"
                        level="win:Verbose"
                        symbol="BrokerFrameworkCentralEventProcessingStart"
                        task="BrokerFrameworkEvent"
                        opcode="win:Start"
                        keywords="Performance Broker"
                        message="$(string.BrokerFrameworkCentralEventProcessing.Started)"
                        />
                    <event 
                        value="125"
                        level="win:Verbose"
                        symbol="BrokerFrameworkCentralEventProcessingCompleted"
                        task="BrokerFrameworkEvent"
                        opcode="win:Stop"
                        keywords="Performance Broker"
                        message="$(string.BrokerFrameworkCentralEventProcessing.Completed)"
                        />
                    <event 
                        value="126"
                        level="win:Verbose"
                        symbol="AlarmTriggerType"
                        task="TaskTrigger"
                        keywords="Trigger Initialization"
                        message="$(string.Trigger.AlarmTriggerType)"
                        />
                    <event 
                        value="127"
                        level="win:Verbose"
                        symbol="AlarmTriggerEvaluate"
                        template="tempAlarmEvaluate"
                        task="TaskTriggerEvaluate"
                        keywords="Timer Trigger Evaluate"
                        message="$(string.Trigger.AlarmEvaluate)"
                        />
                    <event 
                        value="128"
                        level="win:Error"
                        template="Integer"
                        symbol="TriggerUnsupportedInAggregate"
                        task="TaskTrigger"
                        keywords="Error Aggregate Trigger Initialization"
                        message="$(string.Error.Trigger.AggregateTriggerTypeUnsupported)"
                        />

                    <event 
                        value="129"
                        level="win:Verbose"
                        symbol="TimeTransitionProcessingStart"
                        opcode="win:Start"
                        message="$(string.TimeTransitionProcessing.Started)"
                        />
                    <event 
                        value="130"
                        level="win:Verbose"
                        symbol="TimeTransitionProcessingCompleted"
                        opcode="win:Stop"
                        message="$(string.TimeTransitionProcessing.Completed)"
                        />
                    <event 
                        value="131"
                        level="win:Verbose"
                        symbol="ScheduleStateChange"
                        keywords="Schedule State"
                        template="tempScheduleStateChange"
                        message="$(string.Schedule.StateChange)"
                        />
                    <event 
                        value="132"
                        level="win:Verbose"
                        symbol="BrokerEventDroppedByPeriodic"
                        keywords="Trigger Timer Performance"
                        template="GuidTwoSystemTimes"
                        message="$(string.Trigger.BrokerEventDropped)"
                        />
                    <event 
                        value="133"
                        level="win:Verbose"
                        symbol="SnoozeProcessingStart"
                        opcode="win:Start"
                        keywords="Performance"
                        message="$(string.SnoozeProcessing.Started)"
                        />
                    <event 
                        value="134"
                        level="win:Verbose"
                        symbol="SnoozeProcessingCompleted"
                        opcode="win:Stop"
                        keywords="Performance"
                        message="$(string.SnoozeProcessing.Completed)"
                        />
                    <event
                        value="135"
                        level="win:Warning"
                        keywords="Error Schedule"                        
                        template="Integer"
                        symbol="ScheduleNotFoundAtAddressWarning"
                        message="$(string.Error.ScheduleNotFoundAtAddress)"
                        />
                    <event
                        value="136"
                        level="win:Verbose"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        template="Integer"
                        opcode="win:Start"
                        symbol="QueryWnfStateThreadStart"
                        message="$(string.WnfSharing.QueryThreadStart)"
                        />
                    <event
                        value="137"
                        level="win:Verbose"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        opcode="win:Stop"
                        symbol="QueryWnfStateThreadCompleted"
                        message="$(string.WnfSharing.QueryThreadCompleted)"
                        />
                    <event
                        value="138"
                        level="win:Informational"
                        template="tempWNFState"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="QueryWnfState"
                        message="$(string.WnfSharing.QueryState)"
                        />
                    <event
                        value="139"
                        level="win:Verbose"
                        template="Integer"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="QueryWnfStateReturnCode"
                        message="$(string.WnfSharing.QueryStateReturnCode)"
                        />
                    <event
                        value="140"
                        level="win:Verbose"
                        template="PublishWNFTemplate"
                        opcode="win:Start"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="SubscribeWnf"
                        message="$(string.WnfSharing.SubscribeWnf)"
                        />
                    <event
                        value="141"
                        level="win:Informational"
                        template="WnfSubsTemplate"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="NewWnfSubscription"
                        message="$(string.WnfSharing.NewSubscribeWnf)"
                        />
                    <event
                        value="142"
                        level="win:Verbose"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="NewSubscriptionSuccess"
                        message="$(string.WnfSharing.NewSubscriptionSuccess)"
                        />
                    <event
                        value="143"
                        level="win:Verbose"
                        template="Integer"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="FoundScheduleSubscription"
                        message="$(string.WnfSharing.FoundScheduleSubscription)"
                        />
                    <event
                        value="144"
                        level="win:Informational"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="QueryWnfStateForSubscription"
                        message="$(string.WnfSharing.QueryWnfStateForSubscription)"
                        />
                    <event
                        value="145"
                        level="win:Error"
                        template="WNFTemplate"
                        keywords="WNF ScheduleManager Error"                        
                        task="TaskWNFEvent"
                        symbol="FailedCreatingWnfSubscriptionNode"
                        message="$(string.Error.WnfSharing.FailedCreatingWnfSubscriptionNode)"
                        />
                    <event
                        value="146"
                        level="win:Error"
                        template="PublishWNFTemplate"
                        keywords="WNF ScheduleManager Error"                        
                        task="TaskWNFEvent"
                        symbol="FailedWnfSubscription"
                        message="$(string.Error.WnfSharing.FailedWnfSubscription)"
                        />
                    <event
                        value="147"
                        level="win:Informational"
                        template="WnfSubsTemplate"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="NewWnfSubscriptionListener"
                        message="$(string.WnfSharing.NewWnfSubscriptionListener)"
                        />
                    <event
                        value="148"
                        level="win:Verbose"
                        template="GuidAndAddressTemplate"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="AddScheduleListener"
                        message="$(string.WnfSharing.AddScheduleListener)"
                        />
                    <event
                        value="149"
                        level="win:Verbose"
                        opcode="win:Stop"
                        template="PublishWNFTemplate"
                        keywords="WNF ScheduleManager"                        
                        symbol="CompletedSubscribeWnf"
                        task="TaskWNFEvent"
                        message="$(string.WnfSharing.CompletedSubscribeWnf)"
                        />
                    <event
                        value="150"
                        level="win:Informational"
                        template="WnfSubsTemplate"
                        opcode="win:Start"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="UnsubscribeWnf"
                        message="$(string.WnfSharing.UnsubscribeWnf)"
                        />
                    <event
                        value="151"
                        level="win:Verbose"
                        opcode="win:Stop"
                        template="PublishWNFTemplate"
                        keywords="WNF ScheduleManager"                        
                        symbol="CompletedUnsubscribeWnf"
                        task="TaskWNFEvent"
                        message="$(string.WnfSharing.CompletedUnsubscribeWnf)"
                        />
                    <event
                        value="152"
                        level="win:Error"
                        template="WNFTemplate"
                        keywords="WNF ScheduleManager Error"                        
                        task="TaskWNFEvent"
                        symbol="ErrorNoWnfSubscription"
                        message="$(string.Error.WnfSharing.ErrorNoWnfSubscription)"
                        />
                    <event
                        value="153"
                        level="win:Error"
                        template="WNFTemplate"
                        keywords="WNF ScheduleManager Error"                        
                        task="TaskWNFEvent"
                        symbol="ErrorScheduleNotSubscribed"
                        message="$(string.Error.WnfSharing.ErrorScheduleNotSubscribed)"
                        />
                    <event
                        value="154"
                        level="win:Informational"
                        template="Integer"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="WnfReferenceCount"
                        message="$(string.WnfSharing.WnfReferenceCount)"
                        />
                    <event
                        value="155"
                        level="win:Informational"
                        template="WnfSubsTemplate2"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="ScheduleNoLongerSubscribing"
                        message="$(string.WnfSharing.ScheduleNoLongerSubscribing)"
                        />
                    <event
                        value="156"
                        level="win:Informational"
                        template="WnfSubsTemplate2"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="WNFEventNoLongerNeeded"
                        message="$(string.WnfSharing.WNFEventNoLongerNeeded)"
                        />
                    <event
                        value="157"
                        level="win:Informational"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        template="Integer"
                        opcode="win:Start"
                        symbol="UnsubscribeWnfThreadStart"
                        message="$(string.WnfSharing.UnsubscribeWnfThreadStart)"
                        />
                    <event
                        value="158"
                        level="win:Verbose"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        opcode="win:Stop"
                        symbol="UnsubscribeWnfThreadCompleted"
                        message="$(string.WnfSharing.UnsubscribeWnfThreadCompleted)"
                        />
                    <event
                        value="159"
                        level="win:Informational"
                        template="Integer"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="WnfChangeStamp"
                        message="$(string.WnfSharing.WnfChangeStamp)"
                        />
                    <event 
                        value="160"
                        level="win:Informational"
                        symbol="WNFEventWorker"
                        template="WNFEvent"
                        task="TaskWNFEvent"
                        opcode="WNFEvent_Parameters"
                        keywords="WNF"
                        message="$(string.WNFProcessing.WNFEventWorker)"
                        />
                    <event
                        value="161"
                        level="win:Error"
                        keywords="Error"                        
                        symbol="ErrorNullPointer"
                        message="$(string.Error.NullPointer)"
                        />
                    <event 
                        value="162"
                        level="win:Informational"
                        symbol="BaseBrokerWorker"
                        template="WNFEvent"
                        task="TaskWNFEvent"
                        opcode="WNFEvent_Parameters"
                        keywords="WNF"
                        message="$(string.WNFProcessing.BaseBrokerWorker)"
                        />
                    <event
                        value="163"
                        level="win:Error"
                        template="DelayedWNFEvent"
                        keywords="WNF ScheduleManager Error"                        
                        task="TaskWNFEvent"
                        symbol="ErrorWNFNotSubscribedEvent"
                        message="$(string.Error.WnfSharing.ErrorWNFNotSubscribedEvent)"
                        />
                    <event
                        value="164"
                        level="win:Error"
                        keywords="Schedule ScheduleManager Error"                        
                        symbol="ScheduleBadState"
                        template="tempScheduleState"
                        message="$(string.Error.ScheduleBadState)"
                        />
                    <event
                        value="165"
                        level="win:Error"
                        keywords="Schedule ScheduleManager Error"                        
                        template="GuidTemplate"
                        symbol="StartAfterEndTime"
                        message="$(string.Error.StartAfterEndTime)"
                        />
                    <event
                        value="166"
                        level="win:Error"
                        keywords="Schedule ScheduleManager Error"                        
                        template="WNFTemplate"
                        symbol="ExcessiveRuncount"
                        message="$(string.Error.ExcessiveRuncount)"
                        />
                    <event
                        value="167"
                        level="win:Error"
                        keywords="Trigger ScheduleManager Error"                        
                        template="GuidTemplate"
                        symbol="MissingTriggerObject"
                        message="$(string.Error.MissingTriggerObject)"
                        />
                    <event
                        value="168"
                        level="win:Error"
                        keywords="Action ScheduleManager Error"                        
                        template="GuidTemplate"
                        symbol="MissingActionObject"
                        message="$(string.Error.MissingActionObject)"
                        />
                    <event
                        value="169"
                        level="win:Error"
                        keywords="Storage ScheduleManager Error"                        
                        template="GuidTemplate"
                        symbol="MissingStoreObject"
                        message="$(string.Error.MissingStoreObject)"
                        />
                    <event
                        value="170"
                        level="win:Verbose"
                        keywords="ScheduleManager Error"                        
                        symbol="CheckingScheduleListConsistency"
                        message="$(string.Error.CheckingScheduleListConsistency)"
                        />
                    <event
                        value="171"
                        level="win:Warning"
                        keywords="Trigger Error"                        
                        template="TwoSystemTimes"
                        symbol="HeartbeatTrackingError"
                        message="$(string.Error.HeartbeatTrackingError)"
                        />
                    <event 
                        value="172"
                        level="win:Informational"
                        symbol="DelayedWNFEventCallback"
                        template="Integer"
                        task="TaskWNFEvent"
                        keywords="WNF"
                        message="$(string.WNFProcessing.DelayedWNFEventCallback)"
                        />
                    <event
                        value="173"
                        level="win:Informational"
                        template="Integer"
                        keywords="WNF ScheduleManager"                        
                        task="TaskWNFEvent"
                        symbol="RemainingSubscribers"
                        message="$(string.WnfSharing.WNFEventRemainingSubscribers)"
                        />
                    <event
                        value="174"
                        level="win:Error"
                        keywords="ScheduleManager Error"                        
                        symbol="ErrorServiceNotReady"
                        message="$(string.Error.ServiceNotReady)"
                        />
                    <event 
                        value="175"
                        level="win:Informational"
                        keywords="Action Initialization"
                        symbol="GenerateAdhocState"
                        template="AdhocCreationMode"
                        message="$(string.Action.PublishAdhoc.GenerateState)"
                        />
                    <event 
                        value="176"
                        level="win:Error"
                        keywords="Action Initialization Error"
                        symbol="ErrorCreateAdhocState"
                        message="$(string.Error.PublishAdhoc.CreateWnf)"
                        />
                    <event 
                        value="177"
                        level="win:Warning"
                        keywords="Action Initialization Error"
                        symbol="ErrorPersistAdhocState"
                        message="$(string.Error.PublishAdhoc.PersistState)"
                        />
                    <event 
                        value="178"
                        level="win:Informational"
                        template="NQMMode"
                        symbol="ScheduleNQMMode"
                        task="TaskConstructSchedule"
                        keywords="Initialization Schedule"
                        message="$(string.Schedule.NQMMode)"
                        />
                    <event 
                        value="179"
                        level="win:Informational"
                        keywords="Error"
                        symbol="DumpEventKey"
                        template="EventKey"
                        message="$(string.DumpEventKey)"
                        />
                     <event 
                        value="180"
                        level="win:Informational"
                        keywords="Error"
                        symbol="DumpScheduleList"
                        template="EventNode"
                        message="$(string.DumpScheduleList)"
                        />
                    <event 
                        value="181"
                        level="win:Informational"
                        template="LaunchTemplate"
                        keywords="Nqm Action"
                        symbol="LaunchTaskNQM"
                        task="TaskActionLaunchNQM"
                        opcode="ActionLaunch_LaunchNQM"
                        message="$(string.Action.LaunchNQM)"
                        />

                    <event 
                        value="182"
                        level="win:Error"
                        keywords="Nqm Action"
                        symbol="PdcClientRegistrationFailure"
                        message="$(string.Error.PdcClientRegistrationFailure)"
                        />
                    <event 
                        value="183"
                        level="win:Informational"
                        keywords="Nqm Action"
                        symbol="PdcManagerInitialized"
                        message="$(string.Pdc.Initialized)"
                        />
                    <event 
                        value="184"
                        level="win:Warning"
                        keywords="Nqm Action"
                        symbol="PdcScheduleAlreadyRegistered"
                        message="$(string.Pdc.ScheduleAlreadyRegistered)"
                        />
                    <event 
                        value="185"
                        level="win:Error"
                        keywords="Nqm Action"
                        symbol="PdcFailedActivityRequest"
                        template="GuidTemplate"
                        message="$(string.Error.PdcFailedActivityRequest)"
                        />
                    <event 
                        value="186"
                        level="win:Informational"
                        keywords="Nqm Action"
                        symbol="PdcNewActivityRegistered"
                        message="$(string.Pdc.NewActivityRegistered)"
                        />
                    <event 
                        value="187"
                        level="win:Informational"
                        keywords="Nqm Action"
                        symbol="PdcActivityUnregistered"
                        template="GuidTemplate"
                        message="$(string.Pdc.ActivityUnregistered)"
                        />
                    <event 
                        value="188"
                        level="win:Error"
                        keywords="Nqm Action"
                        symbol="ErrorPdcScheduleAlreadyRegistered"
                        template="GuidTemplate"
                        message="$(string.Error.PdcScheduleAlreadyRegistered)"
                        />
                    <event 
                        value="189"
                        level="win:Informational"
                        keywords="Nqm Action"
                        symbol="PdcActivityPopulated"
                        template="GuidTemplate"
                        message="$(string.Pdc.ActivityPopulated)"
                        />
                    <event 
                        value="190"
                        level="win:Informational"
                        symbol="TriggeredInTransitionHandler"
                        template="GuidTemplate"
                        task="TaskTrigger"
                        keywords="Trigger Schedule"
                        message="$(string.Trigger.TriggeredInTransitionHandler)"
                        />
                    <event 
                        value="191"
                        level="win:Informational"
                        symbol="DeleteScheduleInfo"
                        keywords="Schedule"
                        template="ScheduleNameGuid"
                        message="$(string.Schedule.DeleteSchedule)"
                        />
                    <event
                        value="192"
                        level="win:Verbose"
                        symbol="PersistingLastNextRunTime"
                        message="$(string.Storage.PersistingLastNextRunTime)"
                        keywords="Storage"
                        template="GuidSystemTimeHR"
                        />
                    <event
                        value="193"
                        level="win:Verbose"
                        symbol="LoadingLastNextRunTime"
                        message="$(string.Storage.LoadingLastNextRunTime)"
                        keywords="Storage"
                        template="GuidSystemTimeHR"
                        />
                    <event
                        value="194"
                        level="win:Informational"
                        symbol="NotResettingTimestamp"
                        message="$(string.WNFDelay.NotResettingTimestamp)"
                        keywords="WNFDelay"
                        template="GuidTemplate"
                        />

                </events>
            </provider>
        </events>
    </instrumentation>

    <localization>
        <resources culture="en-US">
            <stringTable>
                <string id="Error.ObjectCreation" value="Error creating object %1" />
                <string id="Error.MemoryAlloc" value="Memory allocation error (size %1)" />
                <string id="Error.Security" value="Security error -- Access Denied (hr = %1)" />
                <string id="Error.SecurityTokenCreate" value="Security error -- Error creating security token (hr = %1)" />
                <string id="Error.ScheduleNotFound" value="Schedule %1 was not found." />
                <string id="Error.ScheduleNotFoundAtAddress" value="Schedule was not found at address %1." />
                <string id="Error.RPCRegistration" value="Error registering RPC (hr = %1)" />
                <string id="Error.RetrievingSidError" value="Failed retrieving the caller's SID." />
                <string id="Error.InvalidScheduleData" value="Warning: Invalid/inconsistent data used to initialize schedule." />
                <string id="Error.InitializeScheduleFailedGuid" value="Failed initializing schedule %1" />
                <string id="Error.InitializeScheduleFailed" value="Failed initializing schedule: ???" />
                <string id="Error.AdvanceExceedsMaxRuncount" value="Error: Schedule advance operation exceeds or will exceed its maximum allowed runcount." />
                <string id="Error.ScheduleNotReadyForSnooze" value="Error: Schedule is not ready for snooze -- it is either not enabled or is past due." />
                <string id="Error.ActionCreationFailed" value="Error: Unable to create action of type '%1'" />
                <string id="Error.TriggerCreationFailed" value="Error: Unable to create trigger of type '%1'" />
                <string id="Error.Trigger.SnoozePastInterval" value="Error: Cannot snooze for time period larger than trigger's time interval." />
                <string id="Error.Schedule.InvalidTimes" value="Error: Schedule has invalid or inconsistent times." />
                <string id="Error.Trigger.Creation" value="Error was encountered when creating this trigger." />
                <string id="Error.Schedule.Security" value="Failed establishing schedule's security credentials. (hr = %1)" />
                <string id="Error.InvalidTZID" value="Error: Invalid time zone ID reported by operating system. (hr = %1)" />
                <string id="Error.TimeDifferenceExceedsMaxInterval" value="Trigger's saved next runtime exceeds max interval with current time.  Clipping next runtime to max interval." />
                <string id="Error.LevelWnfStateEarlyTriggerOverride" value="Periodic trigger's early trigger must be defined as a LEVEL trigger to track underlying state in real time. LEVEL has been forced to ensure this behavior." />
                <string id="Error.DelayedEarlyTriggerError" value="Periodic trigger's early trigger cannot be delayed." />
                <string id="Error.Trigger.ContinuousRunInterval" value="Warning: Periodic interval may result in continuous run schedule." />
                <string id="Error.Trigger.FailedCreateEarlyTrigger" value="Error occurred when creating early trigger associated with this periodic trigger." />
                <string id="Error.Trigger.AggregateTooDeep" value="Aggregate trigger has too many levels at level %1." />
                <string id="Error.Trigger.AggregateTriggerTypeUnsupported" value="Aggregate contains trigger of unsupported type %1." />
                <string id="Error.Trigger.PotentialContinuousRun" value="Error: Schedule's trigger may cause continuous firing.  Schedule should be disabled." />
                <string id="Error.Find.NotStarted" value="Error: FindNextSchedule called before FindFirstSchedule. Find operation cot started." />
                <string id="Error.Find.Completed" value="Error: Find operation has completed so no schedule will be returned." />
                <string id="Error.PersistSchedule" value="Error encountered when persisting schedule %1." />
                <string id="Error.NoTimechangeInfo" value="No timechange info provided to TimeChangeCallback. Aborting early." />
                <string id="Error.Trigger.DeleteCSebEvent" value="Error %1 returned when deleting CSeb event with State Name = (%2-%3)" />
                <string id="Error.NullPointer" value="Error NULL pointer" />
                <string id="Error.WnfSharing.FailedCreatingWnfSubscriptionNode" value="Error Failed creating WNF subscription node for State Name = (%2-%3), Schedule %1" />
                <string id="Error.WnfSharing.FailedWnfSubscription" value="Error Failed subscribing to WNF event State Name = (%2-%3) for schedule %1. ntStatus = %4" />
                <string id="Error.WnfSharing.ErrorNoWnfSubscription" value="Error no active subscription found for WNF state (%2-%3)" />
                <string id="Error.WnfSharing.ErrorScheduleNotSubscribed" value="Error schedule %1 not a subsciber to WNF state (%2-%3)" />
                <string id="Error.WnfSharing.ErrorWNFNotSubscribedEvent" value="Error WNF state (%1-%2) not in subscribed events mapping" />
                <string id="Error.ScheduleBadState" value="Schedule %1 is in state %2 when it should not be." />
                <string id="Error.StartAfterEndTime" value="Schedule %1 has start time after end time, invalid." />
                <string id="Error.ExcessiveRuncount" value="Schedule %1 runcount is %2 which exceeds its maximum runcount of %3." />
                <string id="Error.MissingTriggerObject" value="Schedule %1 has no trigger object.  Its pointer is NULL." />
                <string id="Error.MissingActionObject" value="Schedule %1 has no action object.  Its pointer is NULL." />
                <string id="Error.MissingStoreObject" value="Schedule %1 has no store object.  Its pointer is NULL." />
                <string id="Error.CheckingScheduleListConsistency" value="Checking consistency of schedule list" />
                <string id="Error.HeartbeatTrackingError" value="Warning: Current time %1 later than adjusted heartbeat expected time %2." />
                <string id="Error.ServiceNotReady" value="Warning: Callback was dropped since service is not ready." />
                <string id="Error.PublishAdhoc.CreateWnf" value="Warning: Error returned when creating new WNF state." />
                <string id="Error.PublishAdhoc.PersistState" value="Warning: Error returned when caching WNF state name in registry." />
                <string id="Error.PdcClientRegistrationFailure" value="Error: Error attempting to register with PDC." />
                <string id="Error.PdcFailedActivityRequest" value="Error: Failure encountered when attempting to increase PDC reference count for schedule %1." />
                <string id="Error.PdcScheduleAlreadyRegistered" value="Error: Schedule %1 already registered with PDC manager." />



                <string id="Initialization.Started" value="Start Initialization" />
                <string id="Initialization.Completed" value="End Initialization" />
                <string id="Initialization.Phase1.Started" value="Start Initialization Phase 1" />
                <string id="Initialization.Phase1.Completed" value="End Initialization Phase 1" />
                <string id="Initialization.Phase2.Started" value="Start Initialization Phase 2" />
                <string id="Initialization.Phase2.Completed" value="End Initialization Phase 2" />
                <string id="Initialization.InitParameters" value="Service parameters: TimeScale = %1, TZID = %2, Bias = %3, StandardBias = %4, DaylightBias = %5" />
                <string id="Initialization.ServiceStarts" value="TaskScheduler service reload count = %1" />

                <string id="Uninitialization.Started" value="Start Uninitialization" />
                <string id="Uninitialization.Completed" value="End Uninitialization" />
                
                <string id="LoadSchedules.Started" value="Start loading schedules" />
                <string id="LoadSchedules.Completed" value="End loading schedules" />

                <string id="Schedule.Construct.Started" value="Creating schedule: %2 %1, Stored Runtimedata = %3, From Store = %4" />
                <string id="Schedule.Construct.Completed" value="Done creating schedule. (hr = %1)" />
                <string id="Schedule.Construct.StartTimeAndDate" value="Start time: %2/%3/%1 at %4:%5:%6 %7ms" />
                <string id="Schedule.Construct.EndTimeAndDate" value="End time: %2/%3/%1 at %4:%5:%6 %7ms" />
                <string id="Schedule.Construct.CreateTimeAndDate" value="Creation time: %2/%3/%1 at %4:%5:%6 %7ms" />
                <string id="Schedule.Construct.MaxScheduleRuncount" value="Maximum runcount: %1" />
                <string id="Schedule.Construct.ScheduleFlags" value="Schedule's flags: %1" />
                <string id="Schedule.TimeFormat" value="Time format is %1" />
                <string id="Schedule.NQMMode" value="NQM mode is %1 for this schedule" />
                <string id="Schedule.StateChange" value="Schedule %1 state change: %2 --> %3" />
                <string id="Schedule.DeleteSchedule" value="Delete schedule %1 with Id %2" />

                <string id="Action.ActionType" value="Action type is '%1'" />
                <string id="Action.Launch" value="Launch( Path: %2 Commandline: %3 ) Schedule: %1"/>
                <string id="Action.LaunchNQM" value="LaunchNQM( Path: %2 Commandline: %3 ) Schedule: %1"/>
                <string id="Action.BackgroundWork" value="Background Work( URI: %2 ) Schedule: %1"/>
                <string id="Action.Publish" value="Publish( WNFState: (%2-%3) Databytes: %4 ) Schedule: %1"/>
                <string id="Action.Signal" value="Signal( Event name: %2 ) Schedule: %1"/>
                <string id="Action.Publish.Set" value="Publish"/>
                <string id="Action.PublishAdhoc.Set" value="Publish Adhoc"/>
                <string id="Action.PublishAdhoc.GenerateState" value="Adhoc state creation mode: %1"/>
                <string id="Action.BackgroundWork.Set" value="Set Background Work URI = %2"/>
                <string id="Action.Event.Set" value="Set Event Signal = %2"/>
                <string id="Action.Launch.Set" value="EXE Path = %2, Command Line = %3"/>
                <string id="Action.Results" value="Action results: hr = %1"/>
                <string id="Action.Results.Timestamp" value="%1\%2\%3 %4:%5:%6"/>

                <string id="TimerThread.Started" value="Timer thread has started." />
                <string id="TimerThread.Completed" value="Timer thread has ended." />

                <string id="TimerProcessing.Started" value="Timer thread signaled and processing started. (WaitResult=%1)" />
                <string id="TimerProcessing.Completed" value="Timer thread processing completed." />

                <string id="WNFProcessing.Started" value="WNF event (%1-%2) signaled and processing started." />
                <string id="WNFProcessing.Completed" value="WNF event (%1-%2) processing completed. Processed %3 schedules." />
                <string id="WNFProcessing.WNFEvent" value="WNF event: State Name = (%1-%2), Change = %3" />
                <string id="WNFProcessing.WNFEventWorker" value="WNF event worker: State Name = (%1-%2), Change = %3" />
                <string id="WNFProcessing.DelayedWNFEventCallback" value="Delayed WNF event callback: Context = %1" />
                <string id="WNFProcessing.DelayedWNFEventWaitComplete" value="Delayed WNF event wait completed: State Name = (%1-%2)" />
                <string id="WNFProcessing.BaseBrokerWorker" value="Base broker worker: State Name = (%1-%2), Change = %3" />

                <string id="WnfSharing.SubscribeWnf" value="Schedule %1 subscribing to WNF state (%2-%3) at change %4." />
                <string id="WnfSharing.CompletedSubscribeWnf" value="Completed processing schedule %1 subscription for state (%2-%3). ntStatus = %4" />
                <string id="WnfSharing.NewSubscribeWnf" value="Schedule %1-%2 creating new subscription for WNF state (%3-%4)." />
                <string id="WnfSharing.NewWnfSubscriptionListener" value="Schedule %1-%2 is a new listener for state (%3-%4) at change %5." />
                <string id="WnfSharing.NewSubscriptionSuccess" value="Successfully created new subscription." />
                <string id="WnfSharing.FoundScheduleSubscription" value="Found schedule subscription and increasing its reference count to %1." />
                <string id="WnfSharing.QueryWnfStateForSubscription" value="Subscription to WNF state already exists.  Force query to get its latest value." />
                <string id="WnfSharing.AddScheduleListener" value="Adding schedule %1-%2 as a new listener." />
                <string id="WnfSharing.QueryThreadStart" value="WNF query thread started with context %1" />
                <string id="WnfSharing.QueryThreadCompleted" value="WNF query thread completed." />
                <string id="WnfSharing.QueryState" value="Query WNF state (%1-%2)." />
                <string id="WnfSharing.QueryStateReturnCode" value="State queried (NTSTATUS: %1)." />
                <string id="WnfSharing.WnfReferenceCount" value="Reference count set to %1." />
                <string id="WnfSharing.WNFEventNoLongerNeeded" value="Schedule %1-%2 no longer needs subscription to WNF event (%3-%4)." />
                <string id="WnfSharing.WnfChangeStamp" value="WNF change stamp is %1." />

                <string id="WnfSharing.UnsubscribeWnf" value="Schedule %1-%2 unsubscribing WNF state (%3-%4) subscription at %5." />
                <string id="WnfSharing.CompletedUnsubscribeWnf" value="Completed processing unsubscription for schedule %1, state (%2-%3). ntStatus = %4" />
                <string id="WnfSharing.ScheduleNoLongerSubscribing" value="Schedule %1-%2 is no longer a subscriber to WNF state (%3-%4)." />
                <string id="WnfSharing.UnsubscribeWnfThreadStart" value="WNF unsubscription thread started with context %1" />
                <string id="WnfSharing.UnsubscribeWnfThreadCompleted" value="WNF unsubscription thread completed." />
                <string id="WnfSharing.WNFEventRemainingSubscribers" value="There are %1 remaining subscribers for the state." />

                <string id="BrokerFrameworkEventProcessing.Started" value="Broker framework event signaled and processing started." />
                <string id="BrokerFrameworkEventProcessing.Completed" value="Broker framework event processing completed." />

                <string id="BrokerFrameworkCentralEventProcessing.Started" value="Broker framework central event signaled and processing started." />
                <string id="BrokerFrameworkCentralEventProcessing.Completed" value="Broker framework central event processing completed." />

                <string id="TimeChange.Started" value="Time change event signaled and processing started. (delta = %1 sec)" />
                <string id="TimeChange.Completed" value="Time change event processing completed." />
                <string id="TimeChange.TimeChangeInfo" value="Time change parameters: TimeDifference = %1 secs TimeBiasDifference = %2 mins"/>

                <string id="TimeTransitionProcessing.Started" value="Time transition signaled and processing started." />
                <string id="TimeTransitionProcessing.Completed" value="Time transition event processing completed." />
                
                <string id="SnoozeProcessing.Started" value="Snooze thread processing started." />
                <string id="SnoozeProcessing.Completed" value="Snooze thread processing completed." />

                <string id="TaskScheduler.TimeDateInfoLocal" value="[LOCAL] Date and time: %2/%3/%1 at %4:%5:%6 %7ms (TZID = %8, InDST = %9)" />
                <string id="TaskScheduler.TimeDateInfoUTC"   value="[ UTC ] Date and time: %2/%3/%1 at %4:%5:%6 %7ms" />

                <string id="Trigger.TriggerType" value="Trigger type is '%1'" />
                <string id="Trigger.HasRuntimeData" value="Trigger contains stored runtime data, last run time: %2/%3/%1 at %4:%5:%6 %7ms" />
                <string id="Trigger.PeriodicTriggerType" value="%1 periodic trigger type" />
                <string id="Trigger.PeriodicInterval" value="With periodic interval of %1 minutes" />
                <string id="Trigger.AlarmTriggerType" value="Alarm trigger type" />
                <string id="Trigger.Tolerance" value="With periodic tolerance of %1 minutes" />
                <string id="Trigger.HasEarlyTrigger" value="Early trigger present? %1" />
                <string id="Trigger.StartTimeAndDate" value="Trigger start time: %2/%3/%1 at %4:%5:%6 %7ms" />
                <string id="Trigger.NextTriggerTimeAndDate" value="Next trigger time: %2/%3/%1 at %4:%5:%6 %7ms" />
                <string id="Trigger.SnoozedTriggerTimeAndDate" value="Snoozed trigger time: %2/%3/%1 at %4:%5:%6 %7ms" />
                <string id="Trigger.WNFTriggerEvent" value="WNF trigger event: State Name = (%1-%2), Initial change = %3" />
                <string id="Trigger.DelayedWNFTrigger" value="Delayed WNF trigger with delay of %1 minutes" />
                <string id="Trigger.Aggregate.Set" value="%1 aggregate trigger at level %2 with %3 subtriggers" />
                <string id="Trigger.CEAggregate.Set" value="%1 CEAggregate trigger with %2 conditions" />
                <string id="Trigger.TriggeredInWnfHandler" value="Schedule %1 has triggered in its WNF event handler." />
                <string id="Trigger.PeriodicEvaluate" value="Evaluate schedule %1 periodic trigger: %2" />
                <string id="Trigger.AlarmEvaluate" value="Evaluate schedule %1 alarm trigger: %2" />
                <string id="Trigger.WnfEvaluate" value="Evaluate schedule %1 WNF trigger [state (%2-%3)]: %4 (cached)" />
                <string id="Trigger.WnfEvaluateWithState" value="Evaluate schedule %1 WNF trigger [state (%2-%3)]: %4" />
                <string id="Trigger.AggregateEvaluate" value="Evaluate result schedule %1 aggregate level %2 trigger: %3" />
                <string id="Trigger.CEAggregateEvaluate" value="Evaluate result schedule %1 trigger: %2" />
                <string id="Trigger.BrokerEventDropped" value="Schedule %1 periodic trigger dropped broker event. (Current Time = %2, Comparison Time = %3)" />
                <string id="Trigger.TriggeredInTransitionHandler" value="Schedule %1 has triggered in its time transition handler." />

                <string id="API.CreateSchedule" value="API: Create schedule" />
                <string id="API.DeleteSchedule" value="API: Delete schedule" />
                <string id="API.FindFirstSchedule" value="API: Find first Schedule" />
                <string id="API.FindNextSchedule" value="API: Find next schedule" />
                <string id="API.FindScheduleClose" value="API: Find schedule close" />
                <string id="API.GetSchedule" value="API: Get schedule" />
                <string id="API.EnableSchedule" value="API: Enable schedule" />
                <string id="API.ExecuteSchedule" value="API: Execute schedule" />
                <string id="API.AdvanceSchedule" value="API: Advance schedule" />
                <string id="API.AdvanceScheduleIntervals" value="API: Advance schedule intervals" />
                <string id="API.SnoozeSchedule" value="API: Snooze schedule" />
                <string id="API.GetPublishStateName" value="API: Get publish state name" />
                <string id="API.ServiceControl" value="API: Service control" />

                <string id="Find.ScheduleCount" value="Find first schedule cached %1 schedules for operation." />
                <string id="Find.Index" value="Find operation index is %1." />
                <string id="Find.NoSchedules" value="Warning: No schedules discovered for find operation." />
                
                <string id="Pdc.Initialized" value="PDC Manager initialized for handling NQM subscriptions" />
                <string id="Pdc.ScheduleAlreadyRegistered" value="Warning: Schedule already registered with PDC manager." />
                <string id="Pdc.NewActivityRegistered" value="New activity registered with PDC manager." />
                <string id="Pdc.ActivityUnregistered" value="Activity for schedule %1 unregistered from PDC manager." />
                <string id="Pdc.ActivityPopulated" value="PDC activity populated for schedule %1." />

                <!-- Strings for mapped enumerations -->
                <string id="ObjectType.TimerMgr" value="Timer Manager"/>
                <string id="ObjectType.TaskStore" value="Task Store"/>
                <string id="ObjectType.TimeInfo" value="Time Information"/>
                <string id="ObjectType.TimeIntervalManager" value="Time Interval Manager"/>
                <string id="ObjectType.TimebaseManager" value="Timebase Manager"/>

                <string id="ActionType.Launch" value="Launch"/>
                <string id="ActionType.BackgroundWork" value="Background Worker"/>
                <string id="ActionType.Signal" value="Signal Event"/>
                <string id="ActionType.Publish" value="Publish WNF"/>
                <string id="ActionType.PublishAdhoc" value="Publish WNF (Adhoc)"/>

                <string id="TriggerType.Periodic" value="Periodic"/>
                <string id="TriggerType.WNFState" value="WNF State"/>
                <string id="TriggerType.Aggregate" value="Aggregate"/>
                <string id="TriggerType.Se" value="System Event"/>
                <string id="TriggerType.CEAggregate" value="CEAggregate"/>
                <string id="TriggerType.Alarm" value="Single Timer Alarm"/>
                <string id="TriggerType.PeriodicEx" value="Periodic (Extended)"/>

                <string id="PeriodicTriggerType.Maximum" value="Maximum"/>
                <string id="PeriodicTriggerType.Average" value="Average"/>

                <string id="AggregateType.And" value="AND"/>
                <string id="AggregateType.Or" value="OR"/>

                <string id="TimeFormatType.Local" value="local time"/>
                <string id="TimeFormatType.UTC" value="UTC time"/>

                <string id="NQMModeType.NoNQM" value="disabled"/>
                <string id="NQMModeType.HasNQM" value="enabled"/>

                <string id="EventTriggerType.Edge" value="'Edge'"/>
                <string id="EventTriggerType.Level" value="'Level'"/>
                
                <string id="LevelValueType.Zero" value="'Zero'"/>
                <string id="LevelValueType.One" value="'One'"/>

                <string id="Storage.RegistryWrite" value="Writing to registry." />
                <string id="Storage.PersistingLastNextRunTime" value="PersistingLastRunTime on schedule %1, LastRunTime %2, HR=%3" />
                <string id="Storage.LoadingLastNextRunTime" value="LoadingLastRunTime on schedule %1, LastRunTime %2, HR=%3" />

                <string id="ScheduleStateType.Invalid" value="Invalid" />
                <string id="ScheduleStateType.Initializing" value="Initializing" />
                <string id="ScheduleStateType.Waiting" value="Waiting" />
                <string id="ScheduleStateType.PendingStart" value="Pending Start" />
                <string id="ScheduleStateType.Running" value="Running" />
                <string id="ScheduleStateType.Completed" value="Completed" />
                <string id="ScheduleStateType.Unloading" value="Unloading" />
                <string id="ScheduleStateType.Error" value="Error" />

                <string id="AdhocCreation.UseExisting" value="existing state"/>
                <string id="AdhocCreation.CreateNew" value="new state"/>

                <string id="DumpEventKey" value="WNF Event %1 subscription %2 has %3 schedules"/>
                <string id="DumpScheduleList" value="   Schedule %2 Address %1 Reference %3 ChangeStamp %4"/>

                <string id="WNFDelay.NotResettingTimestamp" value="Not resetting the timestamp for schedule %1 as not in delay state"/>
            </stringTable>
        </resources>
    </localization>
</instrumentationManifest>

