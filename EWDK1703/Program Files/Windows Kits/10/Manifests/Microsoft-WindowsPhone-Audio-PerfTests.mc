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
      <provider
          name="Microsoft-WindowsPhone-Audio-PerfTests"
          guid="{78e77f65-4f5e-4d86-9444-1b88b407c43e}"          
          symbol="Microsoft_WindowsPhone_Audio_PerfTests"
          resourceFileName="AudioTests.dll"
          messageFileName="AudioTests.dll">

        <channels />

        <!-- Keywords for Microsoft-WindowsPhone-Audio -->
        <keywords>
            <keyword mask="0x0000000000000001" name="Error" />
            <keyword mask="0x0000000000000002" name="Performance" />
            <!-- Other keywords are provider-specific. -->
            <keyword mask="0x0000000000000004" name="Debug" />
        </keywords>

        <tasks>
            <task
                name="Audio-Setup-Perf-Test"
                value="100"
                symbol="Audio_Setup_Perf_Test"
                message="$(string.AudioSetup_Test.TaskMessage)"
                />
        </tasks>
        <templates>
            <template tid="String">
                <data inType="win:UnicodeString" name="pszString"/>
            </template>
            <template tid="StringString">
                <data inType="win:UnicodeString" name="pszDesc"/>
                <data inType="win:UnicodeString" name="pszString"/>
            </template>
        </templates>
        <events>
          <event
              keywords="Performance"
              level="win:Informational"
              message="$(string.Begin_AudioSetupPerf_Test.EventMessage)"
              opcode="win:Start"
              symbol="Begin_AudioSetup_Perf_Test"
              task="Audio-Setup-Perf-Test"
              template="String"
              value="200"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_AudioSetupPerf_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_AudioSetup_Perf_Test"
              task="Audio-Setup-Perf-Test"
              value="201"
              />          
        </events>
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <!-- Keywords -->
        <string
            id="Keyword.Error"
            value="Error"
            />
        <string
            id="Keyword.Performance"
            value="Performance"
            />
        <string
            id="Keyword.Debug"
            value="Debug"
            />
        <!-- Task Messages -->
        <string
            id="AudioSetup_Test.TaskMessage"
            value="Audio Pipeline Setup Task"
            />        
        <!-- Event Messages -->
        <string
            id="Begin_AudioSetupPerf_Test.EventMessage"
            value="Begin Audio Pipeline Setup Perf Marker"
            />
        <string
            id="End_AudioSetupPerf_Test.EventMessage"
            value="End Audio Pipeline Setup Perf Marker"
            />       
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
