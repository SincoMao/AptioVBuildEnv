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
            <provider name="Microsoft-WindowsPhone-Test-HarnessPerfProvider"
                guid="{592B81C7-EBF9-4552-A439-1AD20435EAFC}"
                messageFileName="%_NTTREE%\Microsoft-WindowsPhone-TestHarnessPerfProviderEtw.dll"
                resourceFileName="%_NTTREE%\Microsoft-WindowsPhone-TestHarnessPerfProviderEtw.dll"
                symbol="TEST_HARNESS_PERF_ETWPROVIDER">
                <keywords>
                    <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
                    <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
                    <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
                </keywords>

                <tasks>
                    <task name="MeasurementSeparator" value="1"/>
                    <task name="DeviceInfo" value="2"/>
                    <task name="MemoryInfoGlobal" value="3"/>
                    <task name="MemoryInfoProcess" value="4"/>
                </tasks>

                <!-- Templates -->
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
                    <!-- Test events-->

                    <!-- Etw measurement separator for the UnifiedParser-->
                    <event value="1"
                      level="win:Informational"
                      opcode="win:Start"
                      symbol="EtwTest_Measurement_Start"
                      task="MeasurementSeparator"
                      keywords="Performance"
                      template="String"/>
                    <event value="2"
                      level="win:Informational"
                      opcode="win:Start"
                      symbol="EtwTest_KPIMeasurement_Start"
                      task="MeasurementSeparator"
                      keywords="Performance"
                      template="IntAndString"/>
                    <event value="3"
                      level="win:Informational"
                      opcode="win:Stop"
                      symbol="EtwTest_Measurement_End"
                      task="MeasurementSeparator"
                      keywords="Performance"/>
                    <event value="4"
                      level="win:Informational"
                      opcode="win:Info"
                      symbol="EtwTest_Measurement_Info"
                      task="MeasurementSeparator"
                      template="String"
                      keywords="Performance"/>
                  <event value="5"
                      level="win:Informational"
                      opcode="win:Info"
                      symbol="EtwTest_Measurement_Value"
                      task="MeasurementSeparator"
                      template="TwoStrings"
                      keywords="Performance" />
      
                    <!-- DeviceInfo data-->
                    <event value="20"
                      level="win:Informational"
                      opcode="win:Info"
                      symbol="EtwTest_DeviceData_Info"
                      task="DeviceInfo"
                      template="TwoStrings" 
                      keywords="Performance"/>

                    <!-- DeviceInfo - memory data-->
                    <event value="40"
                      level="win:Informational"
                      opcode="win:Info"
                      symbol="EtwTest_GlobalMemory_Info"
                      task="MemoryInfoGlobal"
                      keywords="Performance"
                      template="GlobalMemory"/>
                    <event value="41"
                      level="win:Informational"
                      opcode="win:Info"
                      symbol="EtwTest_ProcessMemory_Info"
                      task="MemoryInfoProcess"
                      keywords="Performance"
                      template="ProcessMemory"/>
                </events>
            </provider>
        </events>
    </instrumentation>
    <localization>
        <resources culture="en-US">
            <stringTable>
                <string id="Keyword.Error"              value="Error" />
                <string id="Keyword.Performance"        value="Performance" />
            </stringTable>
        </resources>
    </localization>

</instrumentationManifest>
