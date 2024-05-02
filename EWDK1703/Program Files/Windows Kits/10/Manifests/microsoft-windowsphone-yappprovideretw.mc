<?xml version='1.0' encoding='utf-8' standalone='yes'?>
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
<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

    <instrumentation>
        <events>
            <provider name="Microsoft-WindowsPhone-Test-YappProvider"
                guid="{CC95F278-3A4B-4F3E-8A58-9D152C0B17BE}"
                messageFileName="%_NTTREE%\Microsoft.Phone.Test.EtwAutomationSdk.EtwYappProvider.dll"
                resourceFileName="%_NTTREE%\Microsoft.Phone.Test.EtwAutomationSdk.EtwYappProvider.dll"
                symbol="TEST_YAPP_ETWPROVIDER">

                <keywords>
                    <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
                    <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
                    <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
                </keywords>
                
                <tasks>
                    <task name="PerfTrace" value="1"/>
                    <task name="LogTrace" value="2"/>
                    <task name="MemoryInfo" value="3"/>
                </tasks>

                <templates>
                <template tid="String">
                    <data inType="win:UnicodeString" name="psz" />
                </template>
                <template tid="TwoStrings">
                    <data
                        inType="win:UnicodeString"
                        name="Property"/>
                    <data
                       inType="win:UnicodeString"
                       name="Value"/>
                </template>
                <template tid="IntAndString">
                    <data
                        inType="win:UInt32"
                        name="Property"/>
                    <data
                       inType="win:UnicodeString"
                       name="Value"/>
                </template>
                <template tid="GlobalMemory">
                    <data
                        inType="win:UInt64"
                        name="CommitTotal"/>
                    <data
                       inType="win:UInt64"
                       name="CommitLimit"/>
                    <data
                       inType="win:UInt64"
                       name="CommitPeak"/>
                    <data
                       inType="win:UInt64"
                       name="PhysicalTotal"/>
                    <data
                       inType="win:UInt64"
                       name="PhysicalAvailable"/>
                    <data
                       inType="win:UInt64"
                       name="SystemCache"/>
                    <data
                       inType="win:UInt64"
                       name="KernelTotal"/>
                    <data
                       inType="win:UInt64"
                       name="KernelPaged"/>
                    <data
                       inType="win:UInt64"
                       name="KernelNonpaged"/>
                    <data
                       inType="win:UInt64"
                       name="PageSize"/>
                    <data
                       inType="win:UInt64"
                       name="HandleCount"/>
                    <data
                       inType="win:UInt64"
                       name="ProcessCount"/>
                    <data
                        inType="win:UInt64"
                        name="ThreadCount"/>
                </template>
                <template tid="ProcessMemory">
                    <data
                        inType="win:UnicodeString"
                        name="ProcessName"/>
                    <data
                        inType="win:UInt32"
                        name="ProcessId"/>
                    <data
                       inType="win:UInt64"
                       name="PageFaultCount"/>
                    <data
                       inType="win:UInt64"
                       name="PeakWorkingSetSize"/>
                    <data
                       inType="win:UInt64"
                       name="QuotaPeakPagedPoolUsage"/>
                    <data
                       inType="win:UInt64"
                       name="QuotaPagedPoolUsage"/>
                    <data
                       inType="win:UInt64"
                       name="QuotaPeakNonPagedPoolUsage"/>
                    <data
                       inType="win:UInt64"
                       name="QuotaNonPagedPoolUsage"/>
                    <data
                       inType="win:UInt64"
                       name="PagefileUsage"/>
                    <data
                       inType="win:UInt64"
                       name="PeakPagefileUsage"/>
                    <data
                       inType="win:UInt64"
                       name="PrivateUsage"/>
                </template>
                </templates>
                <events>
                    <!-- Test events for perf tracing-->
                    <event value="1"
                      level="win:Informational"
                      opcode="win:Start"
                      symbol="EtwYapp_Measurement_Start"
                      task="PerfTrace"
                      keywords="Performance"
                      template="String"/>
                    <event value="2"
                      level="win:Informational"
                      opcode="win:Start"
                      symbol="EtwYapp_KPIMeasurement_Start"
                      task="PerfTrace"
                      keywords="Performance"
                      template="IntAndString"/>
                    <event value="3"
                      level="win:Informational"
                      opcode="win:Stop"
                      symbol="EtwYapp_Measurement_End"
                      task="PerfTrace"
                      keywords="Performance"/>
                    <event value="5"
                      level="win:Informational"
                      opcode="win:Info"
                      symbol="EtwYapp_Measurement_Value"
                      task="PerfTrace"
                      template="TwoStrings"
                      keywords="Performance" />
                    
                    <event value="40"
                      level="win:Informational"
                      opcode="win:Info"
                      symbol="EtwYapp_GlobalMemory_Info"
                      task="MemoryInfo"
                      keywords="Performance"
                      template="GlobalMemory"/>
                    <event value="41"
                      level="win:Informational"
                      opcode="win:Info"
                      symbol="EtwYapp_ProcessMemory_Info"
                      task="MemoryInfo"
                      keywords="Performance"
                      template="ProcessMemory"/>

                    <!-- Test events for logging-->
                    <event value="51"
                      level="win:Informational"
                      opcode="win:Start"
                      symbol="EtwYapp_TestStep_Begin"
                      message="$(string.Publisher.HarnessTestStepBegin)"
                      task="LogTrace"
                      template="String"/>
                    <event value="52"
                      level="win:Informational"
                      opcode="win:Stop"
                      symbol="EtwYapp_TestStep_End"
                      message="$(string.Publisher.HarnessTestStepEnd)"
                      task="LogTrace" />
                    <event value="53"
                      level="win:Informational"
                      opcode="win:Info"
                      symbol="EtwYapp_Trace_Info"
                      message="$(string.Publisher.HarnessInfo)"
                      task="LogTrace"
                      template="String"/>
                    <event value="54"
                      level="win:Warning"
                      opcode="win:Info"
                      symbol="EtwYapp_Trace_Warning"
                      message="$(string.Publisher.HarnessWarning)"
                      task="LogTrace"
                      template="String"/>
                    <event value="55"
                      level="win:Error"
                      opcode="win:Info"
                      symbol="EtwYapp_Trace_Error"
                      message="$(string.Publisher.HarnessError)"
                      task="LogTrace"
                      template="String"/>
                    <event value="56"
                      level="win:Critical"
                      opcode="win:Info"
                      symbol="EtwYapp_Trace_Exception"
                      message="$(string.Publisher.HarnessException)"
                      task="LogTrace"
                      keywords="Error"
                      template="TwoStrings"/>
                </events>
            </provider>
        </events>
    </instrumentation>
    
    <localization>
      <resources culture="en-US">
        <stringTable>
        
            <string id="Keyword.Error"              value="Error" />
            <string id="Keyword.Performance"        value="Performance" />
            <string id="Publisher.HarnessInfo"      value="[Info]: %1"/>
            <string id="Publisher.HarnessWarning"   value="[Warning]: %1"/>
            <string id="Publisher.HarnessError"     value="[Error]: %1"/>
            <string id="Publisher.HarnessException" value="[Exception]: %1%n [Stack Trace]: %2"/>
            <string id="Publisher.HarnessTestStepBegin" value="[TestStepBegin] %1"/>
            <string id="Publisher.HarnessTestStepEnd" value="[TestStepEnd]"/>
        </stringTable>
      </resources>
    </localization>
</instrumentationManifest>
