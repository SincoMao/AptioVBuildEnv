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
          name="Microsoft-WindowsPhone-Camera-MFTTests"
          guid="{798F4272-D80C-47A2-8ECF-650512AA94E4}"
          symbol="Microsoft_WindowsPhone_Camera_MFTTests"
          resourceFileName="mf.mfcaptureengine.mftunittests.dll"
          messageFileName="mf.mfcaptureengine.mftunittests.dll"
                >

        <channels />

        <!-- Keywords for Microsoft-WindowsPhone-MetaProcMFT -->
        <keywords>
            <keyword mask="0x0000000000000001" name="Error" />
            <keyword mask="0x0000000000000002" name="Performance" />
            <!-- Other keywords are provider-specific. -->
            <keyword mask="0x0000000000000004" name="Debug" />
        </keywords>

        <tasks>
            <task
                name="Unit-Test"
                value="100"
                symbol="Unit_Test"
                message="$(string.Unit_Test.TaskMessage)"
                />
            <task
                name="Take-Photo"
                value="101"
                symbol="Take_Photo"
                message="$(string.Take_Photo.TaskMessage)"
                />
        </tasks>

        <templates>
            <template tid="String">
                <data inType="win:UnicodeString" name="pszString"/>
            </template>
        </templates>

        <events>
          <event
              keywords="Performance"
              level="win:Informational"
              message="$(string.Begin_Unit_Test.EventMessage)"
              opcode="win:Start"
              symbol="Begin_Unit_Test"
              task="Unit-Test"
              template="String"
              value="200"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_Unit_Test.EventMessage)"
              opcode="win:Stop"
              symbol="End_Unit_Test"
              task="Unit-Test"
              value="201"
              />
          <event
              keywords="Performance"
              level="win:Informational"
              message="$(string.Begin_Take_Photo.EventMessage)"
              opcode="win:Start"
              symbol="Begin_Take_Photo"
              task="Take-Photo"
              value="202"
              />
          <event
              keywords="Performance "
              level="win:Informational"
              message="$(string.End_Take_Photo.EventMessage)"
              opcode="win:Stop"
              symbol="End_Take_Photo"
              task="Take-Photo"
              value="203"
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
            id="Unit_Test.TaskMessage"
            value="Unit Test Task"
            />
        <string
            id="Take_Photo.TaskMessage"
            value="Take Photo Task"
            />
        <!-- Event Messages -->
        <string
            id="Begin_Unit_Test.EventMessage"
            value="Begin Unit Test"
            />
        <string
            id="End_Unit_Test.EventMessage"
            value="End Unit Test"
            />
        <string
            id="Begin_Take_Photo.EventMessage"
            value="Begin Take Photo"
            />
        <string
            id="End_Take_Photo.EventMessage"
            value="End Take Photo"
            />
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
