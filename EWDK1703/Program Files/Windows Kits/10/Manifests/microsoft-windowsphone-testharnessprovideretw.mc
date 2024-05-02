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
            <provider name="Microsoft-WindowsPhone-Test-HarnessProvider"
                guid="{E005A6E7-F96E-467E-A2C6-2B17819E81A5}"
                messageFileName="%_NTTREE%\Microsoft-WindowsPhone-TestHarnessProviderEtw.dll"
                resourceFileName="%_NTTREE%\Microsoft-WindowsPhone-TestHarnessProviderEtw.dll"
                symbol="TEST_HARNESS_ETWPROVIDER">

                <keywords>
                    <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
                    <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
                    <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
                </keywords>
                
                <tasks>
                    <!-- Please try to keep this list ordered. -->
                    <!-- Tasks for component HarnessProvider-->
                    <task name="LogTrace" value="1"/>
                </tasks>

                <!-- Templates -->
                <templates>
                    <template tid="String">
                        <data inType="win:UnicodeString" name="psz" />
                    </template>
                  <template tid="TwoStrings">
                    <data inType="win:UnicodeString" name="Property" />
                    <data inType="win:UnicodeString" name="Value" />
                  </template>
                </templates>

                <events>
                    <event value="1"
                      level="win:Informational"
                      opcode="win:Start"
                      symbol="EtwTest_TestStep_Begin"
                      message="$(string.Publisher.HarnessTestStepBegin)"
                      task="LogTrace"
                      template="String"/>
                    <event value="2"
                      level="win:Informational"
                      opcode="win:Stop"
                      symbol="EtwTest_TestStep_End"
                      message="$(string.Publisher.HarnessTestStepEnd)"
                      task="LogTrace"/>
                    <event value="3"
                      level="win:Informational"
                      opcode="win:Info"
                      symbol="EtwTest_Trace_Info"
                      message="$(string.Publisher.HarnessInfo)"
                      task="LogTrace"
                      template="String"/>
                    <event value="4"
                      level="win:Warning"
                      opcode="win:Info"
                      symbol="EtwTest_Trace_Warning"
                      message="$(string.Publisher.HarnessWarning)"
                      task="LogTrace"
                      template="String"/>
                    <event value="5"
                      level="win:Error"
                      opcode="win:Info"
                      symbol="EtwTest_Trace_Error"
                      message="$(string.Publisher.HarnessError)"
                      task="LogTrace"
                      template="String"/>
                    <event value="6"
                      level="win:Critical"
                      opcode="win:Info"
                      symbol="EtwTest_Trace_Exception"
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
          <string id="Publisher.HarnessInfo"   value="[Info]: %1"/>
          <string id="Publisher.HarnessWarning"   value="[Warning]: %1"/>
          <string id="Publisher.HarnessError"     value="[Error]: %1"/>
          <string id="Publisher.HarnessException" value="[Exception]: %1 [StackTrace]: %2"/>
          <string id="Publisher.HarnessTestStepBegin" value="[TestStepBegin]: %1"/>
          <string id="Publisher.HarnessTestStepEnd" value="[TestStepEnd]"/>
        </stringTable>
      </resources>
    </localization>
</instrumentationManifest>
