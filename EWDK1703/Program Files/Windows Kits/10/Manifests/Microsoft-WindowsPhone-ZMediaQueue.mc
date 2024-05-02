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
      <!-- ZMediaQueue provider. -->
      <provider name="Microsoft-WindowsPhone-ZMediaQueue"
          guid="{8135A447-8C2F-400D-B40A-A9B9CB6E15D1}"
          symbol="MICROSOFT_WINDOWSPHONE_ZMEDIAQUEUE"
          messageFileName="zmediaqueuesvc.dll"
          resourceFileName="zmediaqueuesvc.dll">

        <!-- Here we list the Channels to which this Provider writes data. -->
        <!-- Note: You can customize the "chid" values here, but they must match the "channel" values
             you declare in your events. -->
        <channels />


        <!-- Keywords for Microsoft-WindowsPhone-ZMediaQueue -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WM best practices.  Every event on this channel
               should be tagged with at least one of these keywords. -->
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
        </keywords>


        <!-- Tasks are used with opcodes win:Start and win:Stop to link start and stop events from
             the same task together. -->
        <tasks>
            <task name="MediaPlaybackStateChange" value="1"/>
            <task name="MediaItemChange" value="2"/>
            <task name="Radio_Activate" value="3"/>
            <task name="Radio_TuneToFrequency" value="4"/>
            <task name="Radio_Acquire" value="5"/>
            <task name="Radio_Seek" value="6"/>
            <task name="AOAC_Register" value="7"/>
            <task name="AOAC_Activate" value="8"/>
            <task name="AOAC_DeActivate" value="9"/>
            <task name="AOAC_UnRegister" value="10"/>
            <task name="AOAC_Request" value="11"/>
        </tasks>


        <!-- Event Templates -->
        <templates>
            <template tid="QueuePlayStateOperation">
                <data name="ZMediaQueue" inType="win:UInt32"/>
                <data name="PlayState" inType="win:UInt32"/>
            </template>
          <template tid="QueueOperation">
            <data name="ZMediaQueue" inType="win:UInt32"/>
          </template>
          <template tid="RadioOperation">
            <data name="kHz" inType="win:UInt32"/>
            <data name="subChannel" inType="win:UInt32"/>
          </template>
          <template tid="RadioSeekOperation">
            <data name="seekDir" inType="win:UnicodeString"/>
          </template>
          <template tid="ZMediaQueue_Template_OneUInt32">
              <data name="This" inType="win:Pointer"/>
              <data name="IntData" inType="win:UInt32"/>
          </template>
          <template tid="ZMediaQueue_Template_OneGUIDOneUInt32">
              <data name="This" inType="win:Pointer"/>
              <data name="GuidData" inType="win:GUID"/>
              <data name="IntData" inType="win:UInt32"/>
          </template>
        </templates>


        <events>
            <event value="1"
                message="$(string.ZMediaQueue.MediaPlaybackStateChange.Start)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                template="QueuePlayStateOperation"
                symbol="MediaPlaybackStateChange_Start"
                task="MediaPlaybackStateChange"/>
            <event value="2"
                message="$(string.ZMediaQueue.MediaPlaybackStateChange.Stop)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="MediaPlaybackStateChange_Stop"
                task="MediaPlaybackStateChange"/>
            <event value="3"
                message="$(string.ZMediaQueue.MediaItemChange.Start)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                template="QueueOperation"
                symbol="MediaItemChange_Start"
                task="MediaItemChange"/>
            <event value="4"
                message="$(string.ZMediaQueue.MediaItemChange.Stop)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="MediaItemChange_Stop"
                task="MediaItemChange"/>
            <event value="5"
                message="$(string.ZMediaQueue.Radio_Activate.Start)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                symbol="Radio_Activate_Start"
                task="Radio_Activate"/>
            <event value="6"
                message="$(string.ZMediaQueue.Radio_Activate.Stop)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="Radio_Activate_Stop"
                task="Radio_Activate"/>
            <event value="7"
                message="$(string.ZMediaQueue.Radio_TuneToFrequency.Start)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                template="RadioOperation"
                symbol="Radio_TuneToFrequency_Start"
                task="Radio_TuneToFrequency"/>
            <event value="8"
                message="$(string.ZMediaQueue.Radio_TuneToFrequency.Stop)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="Radio_TuneToFrequency_Stop"
                task="Radio_TuneToFrequency"/>
            <event value="9"
                message="$(string.ZMediaQueue.Radio_Acquire.Start)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                symbol="Radio_Acquire_Start"
                task="Radio_Acquire"/>
            <event value="10"
                message="$(string.ZMediaQueue.Radio_Acquire.Stop)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="Radio_Acquire_Stop"
                task="Radio_Acquire"/>
            <event value="11"
                message="$(string.ZMediaQueue.Radio_Seek.Start)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Start"
                template="RadioSeekOperation"
                symbol="Radio_Seek_Start"
                task="Radio_Seek"/>
            <event value="12"
                message="$(string.ZMediaQueue.Radio_Seek.Stop)"
                level="win:Informational"
                keywords="Performance"
                opcode="win:Stop"
                symbol="Radio_Seek_Stop"
                task="Radio_Seek"/>

            <!-- AOAC -->
            <event value="13"
                symbol="AOAC_Register"
                level="win:Informational"
                task="AOAC_Register"
                keywords="Debug"
                opcode="win:Info"
                template="ZMediaQueue_Template_OneUInt32"
                message="$(string.ZMediaQueue.AOAC_Register)"/>
            <event value="14"
                symbol="AOAC_Activate"
                level="win:Informational"
                task="AOAC_Activate"
                keywords="Debug"
                opcode="win:Info"
                template="ZMediaQueue_Template_OneGUIDOneUInt32"
                message="$(string.ZMediaQueue.AOAC_Activate)"/>
            <event value="15"
                symbol="AOAC_DeActivate"
                level="win:Informational"
                task="AOAC_DeActivate"
                keywords="Debug"
                opcode="win:Info"
                template="ZMediaQueue_Template_OneGUIDOneUInt32"
                message="$(string.ZMediaQueue.AOAC_DeActivate)"/>
            <event value="16"
                symbol="AOAC_UnRegister"
                level="win:Informational"
                task="AOAC_UnRegister"
                keywords="Debug"
                opcode="win:Info"
                template="ZMediaQueue_Template_OneUInt32"
                message="$(string.ZMediaQueue.AOAC_UnRegister)"/>
            <event value="504"
                symbol="AOAC_Request"
                level="win:Informational"
                task="AOAC_Request"
                keywords="Debug"
                opcode="win:Info"
                template="ZMediaQueue_Template_OneGUIDOneUInt32"
                message="$(string.ZMediaQueue.AOAC_Request)"/>

        </events>

      </provider>
    </events>
  </instrumentation>

    <localization>
        <resources culture="en-US">
            <stringTable>
                <string
                    id="EventProviderName"
                    value="Microsoft-WindowsPhone-ZMediaQueue"
                />
                <string
                    id="ZMediaQueue.MediaPlaybackStateChange.Start"
                    value="ZMediaQueue (%1) media playback state (%2) start"
                />
                <string
                    id="ZMediaQueue.MediaPlaybackStateChange.Stop"
                    value="ZMediaQueue media playback state change stopped"
                />
                <string
                    id="ZMediaQueue.MediaItemChange.Start"
                    value="ZMediaQueue (%1) media item change start"
                />
                <string
                    id="ZMediaQueue.MediaItemChange.Stop"
                    value="ZMediaQueue media item change stopped"
                />
                <string
                    id="ZMediaQueue.Radio_Activate.Start"
                    value="ZMediaQueue radio activate start"
                />
                <string
                    id="ZMediaQueue.Radio_Activate.Stop"
                    value="ZMediaQueue radio activate stopped"
                />
                <string
                    id="ZMediaQueue.Radio_TuneToFrequency.Start"
                    value="ZMediaQueue radio tune to frequency kHz (%1) subChannel (%2) start"
                />
                <string
                    id="ZMediaQueue.Radio_TuneToFrequency.Stop"
                    value="ZMediaQueue radio tune to frequency stopped"
                />
                <string
                    id="ZMediaQueue.Radio_Acquire.Start"
                    value="ZMediaQueue radio 1st acquire start"
                />
                <string
                    id="ZMediaQueue.Radio_Acquire.Stop"
                    value="ZMediaQueue radio 1st acquire stopped"
                />
                <string
                    id="ZMediaQueue.Radio_Seek.Start"
                    value="ZMediaQueue radio seek in direction (%1) start"
                />
                <string
                    id="ZMediaQueue.Radio_Seek.Stop"
                    value="ZMediaQueue radio seek stopped"
                />
                <string
                    id="ZMediaQueue.AOAC_Register"
                    value="AOAC Register(%1), Client ID = %2"
                />
                <string
                    id="ZMediaQueue.AOAC_Activate"
                    value="AOAC Activate(%1), PID = %2, Client ID = %3"
                />
                <string
                    id="ZMediaQueue.AOAC_DeActivate"
                    value="AOAC DeActivate(%1), PID = %2, Client ID = %3"
                />
                <string
                    id="ZMediaQueue.AOAC_UnRegister"
                    value="AOAC UnRegister(%1), Client ID = %2"
                />
                <string
                    id="ZMediaQueue.AOAC_Request"
                    value="AOAC Request(%1), PID = %2, Active = %3"
                />
            </stringTable>
        </resources>
    </localization>

</instrumentationManifest>
