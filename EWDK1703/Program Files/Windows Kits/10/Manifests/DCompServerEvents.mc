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
      <provider
        name="Microsoft-WindowsPhone-DirectComposition-Provider"
        guid="{FE6859DA-3726-46df-9989-003696FD48DC}"
        symbol="BERP_DirectComposition"
        messageFileName="dcomps.dll"
        resourceFileName="dcomps.dll">
        <keywords>
            <keyword mask="0x0000000000000001" name="Debug" />
            <keyword mask="0x0000000000000002" name="Performance" />
            <keyword mask="0x0000000000000004" name="BatchQueue" />
            <keyword mask="0x0000000000000008" name="Resources" />
            <keyword mask="0x0000000000000010" name="Timers" />
        </keywords>
        <templates>
            <template tid="BlitData">
                <data
                    inType="win:UInt32"
                    name="srcLeft"
                />
                <data
                    inType="win:UInt32"
                    name="srcTop"
                />
                <data
                    inType="win:UInt32"
                    name="srcWidth"
                />
                <data
                    inType="win:UInt32"
                    name="srcHeight"
                />
                <data
                    inType="win:UInt32"
                    name="destX"
                />
                <data
                    inType="win:UInt32"
                    name="destY"
                />
                <data
                    inType="win:HexInt64"
                    name="SrcTexture"
                />
                <data
                    inType="win:HexInt64"
                    name="DstTexture"
                />
            </template>
            <template tid="BindServerDevice">
                <data
                    inType="win:HexInt32"
                    name="SharedHandle"
                />
            </template>
            <template tid="SharedBuffer">
                <data
                    inType="win:HexInt32"
                    name="SharedHandle"
                />
                <data
                    inType="win:UInt32"
                    name="Width"
                />
                <data
                    inType="win:UInt32"
                    name="Height"
                />
            </template>
            <template tid="ChannelResource">
                <data
                    inType="win:HexInt32"
                    name="ChannelHandle"
                />
                <data
                    inType="win:HexInt32"
                    name="ResourceHandle"
                />
            </template>
            <template tid="PendingDeletes">
                <data
                    inType="win:Boolean"
                    name="PendingDeletes"
                />
            </template>
            <template tid="ChannelTag">
                <data
                    inType="win:HexInt32"
                    name="ChannelHandle"
                />
                <data
                    inType="win:HexInt32"
                    name="Tag"
                />
            </template>
            <template tid="Timer">
                <data
                    inType="win:HexInt64"
                    name="TimerID"
                />
                <data
                    inType="win:UInt32"
                    name="Interval"
                />
            </template>
        </templates>
        <tasks>
          <!-- Performance -->
          <task name="PERF_COMPOSITIONSERVER_EXECUTEPENDINGBATCHES"  
                symbol="PERF_COMPOSITIONSERVER_EXECUTEPENDINGBATCHES_TASK"    
                value="1" />
          <task name="PERF_ANIMATIONGROUP_TICK"  
                symbol="PERF_ANIMATIONGROUP_TICK_TASK"    
                value="2" />
          <task name="PERF_TARGETBINDING_ENUMLAYERS"  
                symbol="PERF_TARGETBINDING_ENUMLAYERS_TASK"    
                value="3" />
          <task name="PERF_COMPOSITIONSERVER_BLIT"
                symbol="PERF_COMPOSITIONSERVER_BLIT_TASK"
                value="4" />
          <task name="BATCHQUEUE_COMPOSITIONSERVER_COMMITBATCH"
                symbol="BATCHQUEUE_COMPOSITIONSERVER_COMMITBATCH_TASK"
                value="5" />
          <task name="PERF_CHANNEL_RELEASERESOURCE"
                symbol="PERF_CHANNEL_RELEASERESOURCE_TASK"
                value="6" />
          <task name="PERF_VSYNC"
                symbol="PERF_VSYNC_TASK"
                value="8" />
          <task name="PERF_TARGETBINDING_CLIPLAYERS"
                symbol="PERF_TARGETBINDING_CLIPLAYERS_TASK"
                value="9" />
          <task name="PERF_DMANIP_RUNNING"
                symbol="PERF_DMANIP_RUNNING_TASK"
                value="10" />

          <!-- Resources --> 
          <task name="RESOURCE_BINDSERVERDEVICE"
                symbol="RESOURCE_BINDSERVERDEVICE_TASK"
                value="100" />
          <task name="RESOURCE_SHAREDBUFFER_CREATE"
                symbol="RESOURCE_SHAREDBUFFER_CREATE_TASK"
                value="101" />  
          <task name="RESOURCE_GET_DELETEDRESOURCE"
                symbol="RESOURCE_GET_DELETEDRESOURCE_TASK"
                value="102" />         

	  <!-- Timers -->
          <task name="TIMER_CREATE"
                symbol="TIMER_CREATE_TASK"
                value="200" />   
          <task name="TIMER_DESTROY"
                symbol="TIMER_DESTROY_TASK"
                value="201" />  
          <task name="TIMER_SCHEDULE"
                symbol="TIMER_SCHEDULE_TASK"
                value="202" /> 
        </tasks>
        <events>
          <!-- opcode="win:Start/win:Stop" -->
          <event value="1" 
                 symbol="PERF_COMPOSITIONSERVER_EXECUTEPENDINGBATCHES_START" 
                 task="PERF_COMPOSITIONSERVER_EXECUTEPENDINGBATCHES" 
                 opcode="win:Start" 
                 keywords="Performance" 
                 level="win:Informational"/>
          <event value="2" 
                 symbol="PERF_COMPOSITIONSERVER_EXECUTEPENDINGBATCHES_STOP" 
                 task="PERF_COMPOSITIONSERVER_EXECUTEPENDINGBATCHES" 
                 opcode="win:Stop" 
                 keywords="Performance" 
                 level="win:Informational"/>
          <event value="3" 
                 symbol="PERF_ANIMATIONGROUP_TICK_START" 
                 task="PERF_ANIMATIONGROUP_TICK" 
                 opcode="win:Start" 
                 keywords="Performance" 
                 level="win:Informational"/>
          <event value="4" 
                 symbol="PERF_ANIMATIONGROUP_TICK_STOP" 
                 task="PERF_ANIMATIONGROUP_TICK" 
                 opcode="win:Stop" 
                 keywords="Performance" 
                 level="win:Informational"/>
          <event value="5" 
                 symbol="PERF_TARGETBINDING_ENUMLAYERS_START" 
                 task="PERF_TARGETBINDING_ENUMLAYERS" 
                 opcode="win:Start" 
                 keywords="Performance" 
                 level="win:Informational"/>
          <event value="6" 
                 symbol="PERF_TARGETBINDING_ENUMLAYERS_STOP" 
                 task="PERF_TARGETBINDING_ENUMLAYERS" 
                 opcode="win:Stop" 
                 keywords="Performance" 
                 level="win:Informational"/>
          <event value="7" 
                 symbol="PERF_CHANNEL_RELEASERESOURCE_START" 
                 task="PERF_CHANNEL_RELEASERESOURCE" 
                 opcode="win:Start" 
                 keywords="Performance" 
                 level="win:Informational"
                 template="ChannelResource" />
          <event value="8" 
                 symbol="PERF_CHANNEL_RELEASERESOURCE_STOP" 
                 task="PERF_CHANNEL_RELEASERESOURCE" 
                 opcode="win:Stop" 
                 keywords="Performance" 
                 level="win:Informational"
                 template="PendingDeletes" />

          <event value="9"
                 symbol="RESOURCE_BINDSERVERDEVICE_START"
                 task="RESOURCE_BINDSERVERDEVICE"
                 opcode="win:Start"
                 keywords="Resources"
                 level="win:Informational"
                 template="BindServerDevice" /> 
          <event value="10"
                 symbol="RESOURCE_BINDSERVERDEVICE_STOP"
                 task="RESOURCE_BINDSERVERDEVICE"
                 opcode="win:Stop"
                 keywords="Resources"
                 level="win:Informational"
                 template="BindServerDevice" /> 

          <event value="11"
                 symbol="PERF_VSYNC_TICK_START"
                 task="PERF_VSYNC"
                 opcode="win:Start"
                 keywords="Performance"
                 level="win:Informational" /> 
          <event value="12"
                 symbol="PERF_VSYNC_TICK_STOP"
                 task="PERF_VSYNC"
                 opcode="win:Stop"
                 keywords="Performance"
                 level="win:Informational" /> 

	        <event value="13"
                 symbol="TIMER_START"
                 task="TIMER_SCHEDULE"
                 opcode="win:Start"
                 keywords="Timers"
                 level="win:Informational"
                 template="Timer" />
	        <event value="14"
                 symbol="TIMER_STOP"
                 task="TIMER_SCHEDULE"
                 opcode="win:Stop"
                 keywords="Timers"
                 level="win:Informational"
                 template="Timer" />

          <event value="15"
                 symbol="PERF_TARGETBINDING_CLIPLAYERS_START"
                 task="PERF_TARGETBINDING_ENUMLAYERS"
                 opcode="win:Start"
                 keywords="Performance"
                 level="win:Informational"/>
          <event value="16"
                 symbol="PERF_TARGETBINDING_CLIPLAYERS_STOP"
                 task="PERF_TARGETBINDING_ENUMLAYERS"
                 opcode="win:Stop"
                 keywords="Performance"
                 level="win:Informational"/>
          
          <event value="17"
                 symbol="PERF_DMANIP_RUNNING_START"
                 task="PERF_DMANIP_RUNNING"
                 opcode="win:Start"
                 keywords="Performance"
                 level="win:Informational"/>
          <event value="18"
                 symbol="PERF_DMANIP_RUNNING_STOP"
                 task="PERF_DMANIP_RUNNING"
                 opcode="win:Stop"
                 keywords="Performance"
                 level="win:Informational"/>

          <!-- opcode="win:Info" -->
          <event value="100"
                 symbol="PERF_COMPOSITIONSERVER_BLIT"
                 task="PERF_COMPOSITIONSERVER_BLIT"
                 opcode="win:Info"
                 keywords="Performance"
                 level="win:Informational"
                 template="BlitData" />

          <event value="101"
                 symbol="BATCHQUEUE_COMPOSITIONSERVER_COMMITBATCH"
                 task="BATCHQUEUE_COMPOSITIONSERVER_COMMITBATCH"
                 opcode="win:Info"
                 keywords="BatchQueue"
                 level="win:Informational" />

          <event value="102"
                 symbol="RESOURCE_SHAREDBUFFER_CREATE"
                 task="RESOURCE_SHAREDBUFFER_CREATE"
                 opcode="win:Info"
                 keywords="Resources"
                 level="win:Informational"
                 template="SharedBuffer" />

          <event value="103"
                 symbol="PERF_VSYNC_FORCETICK"
                 task="PERF_VSYNC"
                 opcode="win:Info"
                 keywords="Resources"
                 level="win:Informational" />

          <event value="104"
                 symbol="RESOURCE_GET_DELETEDRESOURCE"
                 task="RESOURCE_GET_DELETEDRESOURCE"
                 opcode="win:Info"
                 keywords="Resources"
                 level="win:Informational"
                 template="ChannelTag" />
	  
          <event value="105"
                 symbol="TIMER_FIRE_EVENT"
                 task="TIMER_SCHEDULE"
                 opcode="win:Info"
                 keywords="Timers"
                 level="win:Informational"
                 template="Timer" />


        </events>
      </provider>
      <provider
        name="Microsoft-WindowsPhone-DirectManipulation-Provider"
        guid="{6B698E7D-4D6C-4955-9C34-AA9E639E2A85}"
        symbol="BERP_DirectManipulation"
        messageFileName="dcomps.dll"
        resourceFileName="dcomps.dll">
      </provider>
     </events>
   </instrumentation>
</instrumentationManifest>