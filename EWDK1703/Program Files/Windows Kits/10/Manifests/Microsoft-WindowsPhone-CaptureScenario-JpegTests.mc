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
          name="Microsoft-WindowsPhone-CaptureScenario-JpegTests"
          guid="{a7572c2f-308e-4f0f-a20a-46080376af74}"
          symbol="Microsoft_WindowsPhone_CaptureScenario_JpegTests"
          resourceFileName="JpegExifTest.dll"
          messageFileName="JpegExifTest.dll">

			<channels />

			<!-- Keywords for Microsoft-WindowsPhone-CaptureBase -->
			<keywords>
				<keyword mask="0x0000000000000001" name="Error" />
				<keyword mask="0x0000000000000002" name="Performance" />
				<!-- Other keywords are provider-specific. -->
				<keyword mask="0x0000000000000004" name="Debug" />
			</keywords>
			<tasks>
				<task
					name="Perf-ETW-Jpeg-Encoding"
					value="100"
					symbol="Perf_ETW_Jpeg_Encoding"
					message="$(string.JpegEncoding.TaskMessage)"
					/>
			</tasks>

			<templates>
				<template tid="String">
					<data inType="win:UnicodeString" name="pszString"/>
				</template>
			</templates>			

			<events>
			
				<event
				  value="200"
				  keywords="Performance"
				  level="win:Informational"
				  message="$(string.Begin_Perf_ETW_Jpeg_Encoding.EventMessage)"
				  opcode="win:Start"
				  symbol="Begin_Perf_ETW_Jpeg_Encoding"
				  task="Perf-ETW-Jpeg-Encoding"
				  template="String"
				  />			
				  
				 <event
				  value="201"
				  keywords="Performance"
				  level="win:Informational"
				  message="$(string.End_Perf_ETW_Jpeg_Encoding.EventMessage)"
				  opcode="win:Stop"
				  symbol="End_Perf_ETW_Jpeg_Encoding"
				  task="Perf-ETW-Jpeg-Encoding"
				  template="String"
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
            id="JpegEncoding.TaskMessage"
            value="Jpeg Encoding Task"
            />
        <!-- Event Messages -->
        <string
            id="Begin_Perf_ETW_Jpeg_Encoding.EventMessage"
            value="Beging Jpeg Encoding Perf Marker"
            />
        <string
            id="End_Perf_ETW_Jpeg_Encoding.EventMessage"
            value="End Jpeg Encoding Perf Marker"
            />
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
