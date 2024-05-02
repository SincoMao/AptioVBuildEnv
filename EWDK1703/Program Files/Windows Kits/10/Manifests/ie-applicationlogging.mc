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
      
      <!-- Here we describe the provider that uses this manifest.
           Each provider will have its own manifest. -->
      <provider name="Microsoft-WindowsPhone-IE-DataStore-Provider"
          guid="{B2109897-F2CF-402f-8C9A-A97464431865}"
          symbol="BERP_IE_DataStore"
          messageFileName="BrowserLogging.dll"
          resourceFileName="BrowserLogging.dll">

        <!-- Keywords work much like WindowsPhone "debug zones."  They are tags that can 
             be assigned to events to break them into classes.  Keyword masks are 64-bit, of
             which you may use the lower 48.  For more information on keyword definitions, see 
             http://msdn.microsoft.com/en-us/library/aa382786(VS.85).aspx -->

        <!-- Keywords for Microsoft-WindowsPhone-IE-DataStore -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WP best practices.  Every event on this channel
               should be tagged with at least one of these keywords. -->
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
          <keyword mask="0x0000000000000004" name="TabStorage" />
          <!-- Other keywords are channel-specific. -->
        </keywords>
        

        <!-- Tasks are used with opcodes win:Start and win:Stop to link start and stop events from
             the same task together. -->
        <tasks>
          <!-- Tab Storage -->
          <task name="PERF_TABSTORAGE_INITSTORAGE"                  symbol="PERF_TABSTORAGE_INITSTORAGE_TASK"                      value="1"/>
          <task name="PERF_TABSTORAGE_SAVECURRENTPAGE"              symbol="PERF_TABSTORAGE_SAVECURRENTPAGE_TASK"                  value="2"/>
          <task name="PERF_TABSTORAGE_SAVETABS"                     symbol="PERF_TABSTORAGE_SAVETABS_TASK"                         value="3"/>
          <task name="PERF_TABSTORAGE_SAVESINGLETAB"                symbol="PERF_TABSTORAGE_SAVESINGLETABS_TASK"                   value="4"/>
          <task name="PERF_TABSTORAGE_RECOVERTABS"                  symbol="PERF_TABSTORAGE_PERF_TABSTORAGE_RECOVERTAB_TASK"       value="5"/>
          <task name="PERF_TABSTORAGE_RECOVERSINGLETAB"             symbol="PERF_TABSTORAGE_PERF_TABSTORAGE_RECOVERSINGLETAB_TASK" value="6"/>
          <task name="PERF_TABSTORAGE_FINDTABSTORAGENAME"           symbol="PERF_TABSTORAGE_FINDTABSTORAGENAME_TASK"               value="7"/>         
          <!-- Debug messages -->
        </tasks>


        <!-- Event Templates -->
        <!-- Here we define the data payloads that may be written with events.
               If multiple events share the same data payload, they can use the same template.
               See the Remarks section in http://msdn.microsoft.com/en-us/library/aa382774(VS.85).aspx
               for valid inType / outType combinations.
               The "%" values noted here are for user convenience, when referencing the stringTable below. -->

        <templates>
          <template tid="DeleteTabIndexFailed">
            <data name="hr"     inType="win:Int32" outType="win:HResult" />
            <data name="uint3"  inType="win:UInt32" />
          </template>
          <template tid="FindTabIndexWithMinValueFailed">
            <data name="hr"     inType="win:Int32" outType="win:HResult" />
            <data name="uint3"  inType="win:UInt32" />
          </template>
          <template tid="FindTabIndexWithMaxValueFailed">
            <data name="hr"     inType="win:Int32" outType="win:HResult" />
            <data name="uint3"  inType="win:UInt32" />
          </template>
          <template tid="GetTotalTabIndexFailed">
            <data name="hr"     inType="win:Int32" outType="win:HResult" />
            <data name="uint3"  inType="win:UInt32" />
          </template>
          <template tid="SetTabMarkedForDeletionInfo">
            <data name="String" inType="win:UnicodeString" />
            <data name="hr"     inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="SetTabInPrivateModeInfo">
            <data name="String" inType="win:UnicodeString" />
            <data name="hr"     inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="CreateStorageFailed">
            <data name="hr"     inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="SaveCurrentPage">
            <data name="title"      inType="win:UnicodeString" />
            <data name="url"        inType="win:UnicodeString" />
            <data name="thumbnail"  inType="win:UInt32" />
          </template>
          <template tid="SaveAndRecoverTab">
            <data name="uint3"   inType="win:UInt32" />
          </template>
        </templates>

        <!-- IE-DataStore Events -->
        <!-- Here we define the events that this provider writes.
             For information on opcodes, see http://msdn.microsoft.com/en-us/library/aa383956(VS.85).aspx. -->
        <events>
          <!-- Tab Storage -->
          <event value="1"  symbol="PERF_TABSTORAGE_INITSTORAGE_BEGIN"        task="PERF_TABSTORAGE_INITSTORAGE"         opcode="win:Start"  keywords="Performance TabStorage" level="win:Informational"/>
          <event value="2"  symbol="PERF_TABSTORAGE_INITSTORAGE_END"          task="PERF_TABSTORAGE_INITSTORAGE"         opcode="win:Stop"   keywords="Performance TabStorage" level="win:Informational"/>
          <event value="3"  symbol="PERF_TABSTORAGE_SAVECURRENTPAGE_BEGIN"    task="PERF_TABSTORAGE_SAVECURRENTPAGE"     opcode="win:Start"  keywords="Performance TabStorage" level="win:Informational" template="SaveCurrentPage" message="$(string.Microsoft-WindowsPhone-IE-DataStore-TabStorage.event.1.message)"/>
          <event value="4"  symbol="PERF_TABSTORAGE_SAVECURRENTPAGE_END"      task="PERF_TABSTORAGE_SAVECURRENTPAGE"     opcode="win:Stop"   keywords="Performance TabStorage" level="win:Informational"/>
          <event value="5"  symbol="PERF_TABSTORAGE_SAVETABS_BEGIN"           task="PERF_TABSTORAGE_SAVETABS"            opcode="win:Start"  keywords="Performance TabStorage" level="win:Informational"/>
          <event value="6"  symbol="PERF_TABSTORAGE_SAVETABS_END"             task="PERF_TABSTORAGE_SAVETABS"            opcode="win:Stop"   keywords="Performance TabStorage" level="win:Informational" template="SaveAndRecoverTab" message="$(string.Microsoft-WindowsPhone-IE-DataStore-TabStorage.event.2.message)"/>
          <event value="7"  symbol="PERF_TABSTORAGE_SAVESINGLETAB_BEGIN"      task="PERF_TABSTORAGE_SAVESINGLETAB"       opcode="win:Start"  keywords="Performance TabStorage" level="win:Informational"/>
          <event value="8"  symbol="PERF_TABSTORAGE_SAVESINGLETAB_END"        task="PERF_TABSTORAGE_SAVESINGLETAB"       opcode="win:Stop"   keywords="Performance TabStorage" level="win:Informational" template="SaveAndRecoverTab" message="$(string.Microsoft-WindowsPhone-IE-DataStore-TabStorage.event.3.message)"/>
          <event value="9"  symbol="PERF_TABSTORAGE_RECOVERTABS_BEGIN"        task="PERF_TABSTORAGE_RECOVERTABS"         opcode="win:Start"  keywords="Performance TabStorage" level="win:Informational"/>
          <event value="10" symbol="PERF_TABSTORAGE_RECOVERTABS_END"          task="PERF_TABSTORAGE_RECOVERTABS"         opcode="win:Stop"   keywords="Performance TabStorage" level="win:Informational" template="SaveAndRecoverTab" message="$(string.Microsoft-WindowsPhone-IE-DataStore-TabStorage.event.4.message)"/>
          <event value="11" symbol="PERF_TABSTORAGE_RECOVERSINGLETAB_BEGIN"   task="PERF_TABSTORAGE_RECOVERSINGLETAB"    opcode="win:Start"  keywords="Performance TabStorage" level="win:Informational"/>
          <event value="12" symbol="PERF_TABSTORAGE_RECOVERSINGLETAB_END"     task="PERF_TABSTORAGE_RECOVERSINGLETAB"    opcode="win:Stop"   keywords="Performance TabStorage" level="win:Informational" template="SaveAndRecoverTab" message="$(string.Microsoft-WindowsPhone-IE-DataStore-TabStorage.event.5.message)"/>
          <event value="13" symbol="PERF_TABSTORAGE_FINDTABSTORAGENAME_BEGIN" task="PERF_TABSTORAGE_FINDTABSTORAGENAME"  opcode="win:Start"  keywords="Performance TabStorage" level="win:Informational"/>
          <event value="14" symbol="PERF_TABSTORAGE_FINDTABSTORAGENAME_END"   task="PERF_TABSTORAGE_FINDTABSTORAGENAME"  opcode="win:Stop"   keywords="Performance TabStorage" level="win:Informational"/>
            
          <!-- Debug messages -->
          
          <!-- Retail messages -->
          <event value="2000"  symbol="Retail_IEDataStore_DeleteTabIndex"           keywords="Debug"  level="win:Error" version="0" template="DeleteTabIndexFailed"            message="$(string.Microsoft-WindowsPhone-IE-DataStore.event.2000.message)"/>
          <event value="2001"  symbol="Retail_IEDataStore_FindTabIndexWithMinValue" keywords="Debug"  level="win:Error" version="0" template="FindTabIndexWithMinValueFailed"  message="$(string.Microsoft-WindowsPhone-IE-DataStore.event.2001.message)"/>
          <event value="2002"  symbol="Retail_IEDataStore_FindTabIndexWithMaxValue" keywords="Debug"  level="win:Error" version="0" template="FindTabIndexWithMaxValueFailed"  message="$(string.Microsoft-WindowsPhone-IE-DataStore.event.2002.message)"/>
          <event value="2003"  symbol="Retail_IEDataStore_GetTotalTabIndex"         keywords="Debug"  level="win:Error" version="0" template="GetTotalTabIndexFailed"          message="$(string.Microsoft-WindowsPhone-IE-DataStore.event.2003.message)"/>
          <event value="2004"  symbol="Retail_IEDataStore_SetTabMarkedForDeletion"  keywords="Debug"  level="win:Error" version="0" template="SetTabMarkedForDeletionInfo"     message="$(string.Microsoft-WindowsPhone-IE-DataStore.event.2004.message)"/>
          <event value="2005"  symbol="Retail_IEDataStore_CreateStorageFailed"      keywords="Debug"  level="win:Error" version="0" template="CreateStorageFailed"             message="$(string.Microsoft-WindowsPhone-IE-DataStore.event.2005.message)"/>
          <event value="2006"  symbol="Retail_IEDataStore_SetTabInPrivateMode"      keywords="Debug"  level="win:Error" version="0" template="SetTabInPrivateModeInfo"         message="$(string.Microsoft-WindowsPhone-IE-DataStore.event.2006.message)"/>
        </events>
      </provider>

      <provider
        name="Microsoft-WindowsPhone-IE-IEUX-Provider"
        guid="{3FB6C15E-2B38-4bf2-B989-6FFC48D0543F}"
        symbol="BERP_IEUX"
        messageFileName="BrowserLogging.dll"
        resourceFileName="BrowserLogging.dll">
        <keywords>
          <keyword mask="0x0000000000000001" name="Debug"/>
          <keyword mask="0x0000000000000002" name="Performance"/>
          <keyword mask="0x0000000000000004" name="GestureNavigation" />
        </keywords>
        <templates>
          <template tid="GenericString">
            <data name="String1" inType="win:UnicodeString" />
          </template>
          <template tid="DeleteHistoryFailed">
            <data name="dw" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="BrowserHostModelInitFailed">
            <data name="dw" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="DeleteSingleHistoryFailed">
            <data name="dw" inType="win:Int32" outType="win:HResult" />
          </template>
        </templates>
        <tasks>
          <task name="PERF_BROWSERHOSTMODEL_ONPAUSE"            symbol="PERF_BROWSERHOSTMODEL_ONPAUSE_TASK"            value="1"/>
          <task name="PERF_BROWSERHOSTMODEL_ONRESUME"           symbol="PERF_BROWSERHOSTMODEL_ONRESUME_TASK"           value="2"/>
          <task name="PERF_BROWSERHOSTMODEL_PAGEVISIBLE"        symbol="PERF_BROWSERHOSTMODEL_PAGEVISIBLE_TASK"        value="3"/>
          <task name="PERF_BROWSERHOSTMODEL_ONFAVORITES"        symbol="PERF_BROWSERHOSTMODEL_ONFAVORITES_TASK"        value="4"/>
          <task name="PERF_BROWSERHOSTMODEL_ONHISTORY"          symbol="PERF_BROWSERHOSTMODEL_ONHISTORY_TASK"          value="5"/>
          <task name="PERF_BROWSERHOSTMODEL_ONTABSCENTER"       symbol="PERF_BROWSERHOSTMODEL_ONTABSCENTER_TASK"       value="6"/>
          <task name="PERF_BROWSERHOSTMODEL_CLOSETAB"           symbol="PERF_BROWSERHOSTMODEL_CLOSETAB_TASK"           value="7"/>
          <task name="PERF_BROWSERHOSTMODEL_CUSTOMHEADERS"      symbol="PERF_BROWSERHOSTMODEL_CUSTOMHEADERS_TASK"      value="8"/>
          <task name="PERF_KIDZONEVM_ISPINNEDTOKIDZONE"         symbol="PERF_KIDZONEVM_ISPINNEDTOKIDZONE_TASK"         value="9"/>
          <task name="PERF_HISTORYPROVIDERMODEL_HISTORYDELETE"  symbol="PERF_HISTORYPROVIDERMODEL_DELETEHISTORY_TASK"  value="10"/>          

          <!-- Debug messages -->
          <task name="DEBUG_BROWSERHOSTMODEL_ONBEFORENAVIGATE2"     symbol="DEBUG_BROWSERHOSTMODEL_ONBEFORENAVIGATE2_TASK"      value="1000"/>
          <task name="DEBUG_DOWNLOADMODEL_DOWNLOAD"                 symbol="DEBUG_DOWNLOADMODEL_DOWNLOAD_TASK"                  value="1001"/>
          <task name="DEBUG_DOWNLOADMODEL_DOWNLOADLAUNCH"           symbol="DEBUG_DOWNLOADMODEL_DOWNLOADLAUNCH_TASK"            value="1002"/>
          <task name="DEBUG_DOWNLOADMODEL_DOWNLOADFILENAME"         symbol="DEBUG_DOWNLOADMODEL_DOWNLOADFILENAME_TASK"          value="1003"/>
          <task name="DEBUG_DOWNLOADMODEL_DOWNLOADFILEPATH"         symbol="DEBUG_DOWNLOADMODEL_DOWNLOADFILEPATH_TASK"          value="1004"/>
          <task name="DEBUG_DOWNLOADMODEL_DOWNLOADPROGRESS"         symbol="DEBUG_DOWNLOADMODEL_DOWNLOADPROGRESS_TASK"          value="1005"/>
          <task name="DEBUG_DOWNLOADMODEL_DOWNLOADERROR"            symbol="DEBUG_DOWNLOADMODEL_DOWNLOADERROR_TASK"             value="1006"/>
          <task name="DEBUG_DOWNLOADMODEL_DOWNLOADICON"             symbol="DEBUG_DOWNLOADMODEL_DOWNLOADICON_TASK"              value="1007"/>
          <task name="DEBUG_DOWNLOADMODEL_DOWNLOADNAVIGATECOMPLETE" symbol="DEBUG_DOWNLOADMODEL_DOWNLOADNAVIGATECOMPLETE_TASK"  value="1008"/>
          <task name="DEBUG_DOWNLOADMODEL_CANCEL"                   symbol="DEBUG_DOWNLOADMODEL_CANCEL_TASK"                    value="1009"/>
          <task name="DEBUG_DOWNLOADMODEL_REFRESH"                  symbol="DEBUG_DOWNLOADMODEL_REFRESH_TASK"                   value="1010"/>
          <task name="DEBUG_DOWNLOADMODEL_LAUNCH"                   symbol="DEBUG_DOWNLOADMODEL_LAUNCH_TASK"                    value="1011"/>
          <task name="DEBUG_DOWNLOADMODEL_DISMISS"                  symbol="DEBUG_DOWNLOADMODEL_DISMISS_TASK"                   value="1012"/>

          <!-- Retail messages -->
          <task name="RETAIL_HISTORYPROVIDERMODEL_DELETEHISTORY_FAILED"    symbol="RETAIL_HISTORYPROVIDERMODEL_DELETEHISTORY_FAILED_TASK"     value="2000"/>
          <task name="RETAIL_BROWSERHOSTMODEL_INIT_FAILED"          symbol="RETAIL_BROWSERHOSTMODEL_INIT_FAILED_TASK"           value="2001"/>
          <task name="RETAIL_BROWSERHOSTMODEL_ONCANCELREQUESTED"    symbol="RETAIL_DOWNLOADMODEL_ONCANCELREQUESTED_TASK"        value="2002"/>
          <task name="RETAIL_HISTORYPROVIDERMODEL_DELETESINGLEHISTORY_FAILED"    symbol="RETAIL_HISTORYPROVIDERMODEL_DELETESINGLEHISTORY_FAILED_TASK"     value="2004"/>
          
          <!-- GestureNavigation -->
          <task name="PERF_GESTURENAVIGATION_OVERLAYPANEL_SHOW"     symbol="PERF_GESTURENAVIGATION_OVERLAYPANEL_SHOW_TASK"      value="3200"/>
          <task name="PERF_GESTURENAVIGATION_OVERLAYPANEL_HIDE"     symbol="PERF_GESTURENAVIGATION_OVERLAYPANEL_HIDE_TASK"      value="3201"/>
          <task name="PERF_GESTURENAVIGATION_SIDEPANEL_READY"       symbol="PERF_GESTURENAVIGATION_SIDEPANEL_READY_TASK"        value="3202"/>
          <task name="PERF_GESTURENAVIGATION_ONFIRSTRENDERCOMPLETE" symbol="PERF_GESTURENAVIGATION_ONFIRSTRENDERCOMPLETE_TASK"  value="3203"/>
        </tasks>
        <events>
          <event value="1"  symbol="PERF_BROWSERHOSTMODEL_ONPAUSE_BEGIN"       task="PERF_BROWSERHOSTMODEL_ONPAUSE"       opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="2"  symbol="PERF_BROWSERHOSTMODEL_ONPAUSE_END"         task="PERF_BROWSERHOSTMODEL_ONPAUSE"       opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="3"  symbol="PERF_BROWSERHOSTMODEL_ONRESUME_BEGIN"      task="PERF_BROWSERHOSTMODEL_ONRESUME"      opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="4"  symbol="PERF_BROWSERHOSTMODEL_ONRESUME_END"        task="PERF_BROWSERHOSTMODEL_ONRESUME"      opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="5"  symbol="PERF_BROWSERHOSTMODEL_PAGEVISIBLE"         task="PERF_BROWSERHOSTMODEL_PAGEVISIBLE"   opcode="win:Info"   keywords="Performance" level="win:Informational"/>
          <event value="6"  symbol="PERF_BROWSERHOSTMODEL_ONFAVORITES_BEGIN"   task="PERF_BROWSERHOSTMODEL_ONFAVORITES"   opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="7"  symbol="PERF_BROWSERHOSTMODEL_ONFAVORITES_END"     task="PERF_BROWSERHOSTMODEL_ONFAVORITES"   opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="8"  symbol="PERF_BROWSERHOSTMODEL_ONHISTORY_BEGIN"     task="PERF_BROWSERHOSTMODEL_ONHISTORY"     opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="9"  symbol="PERF_BROWSERHOSTMODEL_ONHISTORY_END"       task="PERF_BROWSERHOSTMODEL_ONHISTORY"     opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="10" symbol="PERF_BROWSERHOSTMODEL_ONTABSCENTER_BEGIN"  task="PERF_BROWSERHOSTMODEL_ONTABSCENTER"  opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="11" symbol="PERF_BROWSERHOSTMODEL_ONTABSCENTER_END"    task="PERF_BROWSERHOSTMODEL_ONTABSCENTER"  opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="12" symbol="PERF_BROWSERHOSTMODEL_CLOSETAB_BEGIN"      task="PERF_BROWSERHOSTMODEL_CLOSETAB"      opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="13" symbol="PERF_BROWSERHOSTMODEL_CLOSETAB_END"        task="PERF_BROWSERHOSTMODEL_CLOSETAB"      opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="14" symbol="PERF_BROWSERHOSTMODEL_CUSTOMHEADERS_BEGIN" task="PERF_BROWSERHOSTMODEL_CUSTOMHEADERS" opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="15" symbol="PERF_BROWSERHOSTMODEL_CUSTOMHEADERS_END"   task="PERF_BROWSERHOSTMODEL_CUSTOMHEADERS" opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="16" symbol="PERF_KIDZONEVM_ISPINNEDTOKIDZONE_BEGIN"    task="PERF_KIDZONEVM_ISPINNEDTOKIDZONE"    opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="17" symbol="PERF_KIDZONEVM_ISPINNEDTOKIDZONE_END"      task="PERF_KIDZONEVM_ISPINNEDTOKIDZONE"    opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="18" symbol="PERF_HISTORYPROVIDERMODEL_HISTORYDELETE_BEGIN" task="PERF_HISTORYPROVIDERMODEL_HISTORYDELETE" opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="19" symbol="PERF_HISTORYPROVIDERMODEL_HISTORYDELETE_END"   task="PERF_HISTORYPROVIDERMODEL_HISTORYDELETE" opcode="win:Stop"   keywords="Performance" level="win:Informational"/>

          <!-- Debug messages -->
          <event value="1000" symbol="DEBUG_BROWSERHOSTMODEL_ONBEFORENAVIGATE2_INFO"      task="DEBUG_BROWSERHOSTMODEL_ONBEFORENAVIGATE2"       opcode="win:Info" level="win:Informational" keywords="Debug " version="0" template="GenericString" message="$(string.Microsoft-WindowsPhone-IE-IEUX.event.1000.message)" />
          <event value="1001" symbol="DEBUG_DOWNLOADMODEL_DOWNLOAD_BEGIN"                 task="DEBUG_DOWNLOADMODEL_DOWNLOAD"                   opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1002" symbol="DEBUG_DOWNLOADMODEL_DOWNLOAD_END"                   task="DEBUG_DOWNLOADMODEL_DOWNLOAD"                   opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1003" symbol="DEBUG_DOWNLOADMODEL_DOWNLOADLAUNCH_INFO"            task="DEBUG_DOWNLOADMODEL_DOWNLOADLAUNCH"             opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1004" symbol="DEBUG_DOWNLOADMODEL_DOWNLOADFILENAME_INFO"          task="DEBUG_DOWNLOADMODEL_DOWNLOADFILENAME"           opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1005" symbol="DEBUG_DOWNLOADMODEL_DOWNLOADFILEPATH_INFO"          task="DEBUG_DOWNLOADMODEL_DOWNLOADFILEPATH"           opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1006" symbol="DEBUG_DOWNLOADMODEL_DOWNLOADPROGRESS_INFO"          task="DEBUG_DOWNLOADMODEL_DOWNLOADPROGRESS"           opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1007" symbol="DEBUG_DOWNLOADMODEL_DOWNLOADERROR_INFO"             task="DEBUG_DOWNLOADMODEL_DOWNLOADERROR"              opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1008" symbol="DEBUG_DOWNLOADMODEL_DOWNLOADICON_INFO"              task="DEBUG_DOWNLOADMODEL_DOWNLOADICON"               opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1009" symbol="DEBUG_DOWNLOADMODEL_DOWNLOADNAVIGATECOMPLETE_INFO"  task="DEBUG_DOWNLOADMODEL_DOWNLOADNAVIGATECOMPLETE"   opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1010" symbol="DEBUG_DOWNLOADMODEL_CANCEL_INFO"                    task="DEBUG_DOWNLOADMODEL_CANCEL"                     opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1011" symbol="DEBUG_DOWNLOADMODEL_REFRESH_INFO"                   task="DEBUG_DOWNLOADMODEL_REFRESH"                    opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1012" symbol="DEBUG_DOWNLOADMODEL_LAUNCH_INFO"                    task="DEBUG_DOWNLOADMODEL_LAUNCH"                     opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1013" symbol="DEBUG_DOWNLOADMODEL_DISMISS_INFO"                   task="DEBUG_DOWNLOADMODEL_DISMISS"                    opcode="win:Info" level="win:Informational" keywords="Debug" />
          
          <!-- Retail messages -->
          <event value="2000" symbol="RETAIL_HISTORYPROVIDERMODEL_DELETEHISTORY_FAILED_INFO"     task="RETAIL_HISTORYPROVIDERMODEL_DELETEHISTORY_FAILED"      opcode="win:Info" level="win:Error"         keywords="Debug" version="0" template="DeleteHistoryFailed"             message="$(string.Microsoft-WindowsPhone-IE-IEUX.event.2000.message)"/>
          <event value="2001" symbol="RETAIL_BROWSERHOSTMODEL_INIT_FAILED_INFO"           task="RETAIL_BROWSERHOSTMODEL_INIT_FAILED"            opcode="win:Info" level="win:Error"         keywords="Debug" version="0" template="BrowserHostModelInitFailed"      message="$(string.Microsoft-WindowsPhone-IE-IEUX.event.2001.message)"/>
          <event value="2002" symbol="RETAIL_BROWSERHOSTMODEL_ONCANCELREQUESTED_INFO"     task="RETAIL_BROWSERHOSTMODEL_ONCANCELREQUESTED"      opcode="win:Info" level="win:Error"         keywords="Debug" version="0" />
          <event value="2004" symbol="RETAIL_HISTORYPROVIDERMODEL_DELETESINGLEHISTORY_FAILED_INFO"     task="RETAIL_HISTORYPROVIDERMODEL_DELETESINGLEHISTORY_FAILED"      opcode="win:Info" level="win:Error"         keywords="Debug" version="0" template="DeleteSingleHistoryFailed"             message="$(string.Microsoft-WindowsPhone-IE-IEUX.event.2004.message)"/>
          
          <!-- Gesture Navigation -->
          <event value="3200" symbol="PERF_GESTURENAVIGATION_OVERLAYPANEL_SHOW"           task="PERF_GESTURENAVIGATION_OVERLAYPANEL_SHOW"       opcode="win:Info" level="win:Informational" keywords="Performance GestureNavigation"/>
          <event value="3201" symbol="PERF_GESTURENAVIGATION_OVERLAYPANEL_HIDE"           task="PERF_GESTURENAVIGATION_OVERLAYPANEL_HIDE"       opcode="win:Info" level="win:Informational" keywords="Performance GestureNavigation"/>
          <event value="3202" symbol="PERF_GESTURENAVIGATION_SIDEPANEL_READY"             task="PERF_GESTURENAVIGATION_SIDEPANEL_READY"         opcode="win:Info" level="win:Informational" keywords="Performance GestureNavigation"/>
          <event value="3203" symbol="PERF_GESTURENAVIGATION_ONFIRSTRENDERCOMPLETE"       task="PERF_GESTURENAVIGATION_ONFIRSTRENDERCOMPLETE"   opcode="win:Info" level="win:Informational" keywords="Performance GestureNavigation"/>
        </events>
        
        <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
        <!-- If you change this list, please also update iexploreperf.h and ..\markup\Directory.uix -->
        <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

      </provider>

      <provider
        name="Microsoft-WindowsPhone-IE-TabsManager-Provider"
        guid="{99B09923-7E31-4a1c-B2AA-A6C6F9DC2083}"
        symbol="BERP_TabsManager"
        messageFileName="BrowserLogging.dll"
        resourceFileName="BrowserLogging.dll">
        <keywords>
          <keyword mask="0x0000000000000001" name="Debug"/>
          <keyword mask="0x0000000000000002" name="Performance"/>
        </keywords>
        <templates>
          <template tid="CrossNavigateInNewTab">
            <data name="pszSessionID"     inType="win:UnicodeString" />
          </template>
          <template tid="UpdateSessionInfoFailed">
            <data name="hr"               inType="win:Int32" outType="win:HResult" />
            <data name="pszSessionID"     inType="win:UnicodeString" />
          </template>
        </templates>
        <tasks>
          <task name="PERF_TABSMANAGER_CROSSNAVIGATEINNEWTAB"                     symbol="PERF_TABSMANAGER_CROSSNAVIGATEINNEWTAB_TASK"                      value="1"/>
          <task name="PERF_TABSMANAGER_RUN"                                       symbol="PERF_TABSMANAGER_RUN_TASK"                                        value="4"/>
          <task name="PERF_TABSMANAGER_CREATESESSIONID"                           symbol="PERF_TABSMANAGER_CREATESESSIONID_TASK"                            value="5"/>
          <task name="PERF_TABSMANAGER_LAUNCHSESSION"                             symbol="PERF_TABSMANAGER_LAUNCHSESSION_TASK"                              value="7"/>
        </tasks>
        <events>
          <event value="1"  symbol="PERF_TABSMANAGER_CROSSNAVIGATEINNEWTAB_BEGIN"                     task="PERF_TABSMANAGER_CROSSNAVIGATEINNEWTAB"                     opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="2"  symbol="PERF_TABSMANAGER_CROSSNAVIGATEINNEWTAB_END"                       task="PERF_TABSMANAGER_CROSSNAVIGATEINNEWTAB"                     opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="7"  symbol="PERF_TABSMANAGER_RUN_BEGIN"                                       task="PERF_TABSMANAGER_RUN"                                       opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="8"  symbol="PERF_TABSMANAGER_RUN_END"                                         task="PERF_TABSMANAGER_RUN"                                       opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="9"  symbol="PERF_TABSMANAGER_CREATESESSIONID_BEGIN"                           task="PERF_TABSMANAGER_CREATESESSIONID"                           opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="10" symbol="PERF_TABSMANAGER_CREATESESSIONID_END"                             task="PERF_TABSMANAGER_CREATESESSIONID"                           opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="13" symbol="PERF_TABSMANAGER_LAUNCHSESSION_BEGIN"                             task="PERF_TABSMANAGER_LAUNCHSESSION"                             opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="14" symbol="PERF_TABSMANAGER_LAUNCHSESSION_END"                               task="PERF_TABSMANAGER_LAUNCHSESSION"                             opcode="win:Stop"   keywords="Performance" level="win:Informational"/>

          <!-- Retail messages -->
          <event value="2000" symbol="RETAIL_TABSLAUNCHER_CROSSNAVIGATEINNEWTAB"                                                                                   opcode="win:Info"   keywords="Debug"       level="win:Warning"        template="CrossNavigateInNewTab"                      message="$(string.Microsoft-WindowsPhone-IE-TabsManager.event.2000.message)"/>
          <event value="2002" symbol="RETAIL_TABSLAUNCHER_UPDATESESSIONINFO_FAILED"                                                                                opcode="win:Info"   keywords="Debug"       level="win:Warning"        template="UpdateSessionInfoFailed"                    message="$(string.Microsoft-WindowsPhone-IE-TabsManager.event.2002.message)"/>

        </events>
      </provider>

      <provider name="Microsoft-WindowsPhone-IE-ExtensionObject-Provider"
          guid="{BAC14F4C-FF88-4267-9C0F-4616987B9E7D}"
          symbol="IEXO"
          messageFileName="BrowserLogging.dll"
          resourceFileName="BrowserLogging.dll">

        <!-- Keywords work much like Windows Mobile "debug zones."  They are tags that can 
             be assigned to events to break them into classes.  Keyword masks are 64-bit, of
             which you may use the lower 48.  For more information on keyword definitions, see 
             http://msdn.microsoft.com/en-us/library/aa382786(VS.85).aspx -->

        <!-- Keywords for Microsoft-WindowsPhone-IE-ExtensionObject -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WM best practices.  Every event on this channel
               should be tagged with at least one of these keywords. -->
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
          <keyword mask="0x0000000000000004" name="TabRehydration" />
          <!-- Other keywords are channel-specific. -->
          <keyword mask="0x0000000000000008" name="Roaming" />
        </keywords>
        

        <!-- Tasks are used with opcodes win:Start and win:Stop to link start and stop events from
             the same task together. -->
        <tasks>
          <!-- FileDownload (100-199) -->

          <!-- Tab Rehydration -->
          <task name="PERF_TABREHYDRATION_SAVE"                  symbol="PERF_TABREHYDRATION_SAVE_TASK"                   value="300"/>
          <task name="PERF_TABREHYDRATION_RECOVER"               symbol="PERF_TABREHYDRATION_RECOVER_TASK"                value="301"/>
          
          <!-- Debug messages -->
          <task name="Debug_DownloadThread_KickOffDownload"                  symbol="Debug_DownloadThread_KickOffDownload_Task"                   value="1000"/>
        </tasks>


        <!-- Event Templates -->
        <!-- Here we define the data payloads that may be written with events.
               If multiple events share the same data payload, they can use the same template.
               See the Remarks section in http://msdn.microsoft.com/en-us/library/aa382774(VS.85).aspx
               for valid inType / outType combinations.
               The "%" values noted here are for user convenience, when referencing the stringTable below. -->

        <templates>
          <template tid="FileDownloadLaunch">
            <data name="psz" inType="win:UnicodeString" />
          </template>
          <template tid="DownloadManagerDownloadRefresh">
            <data name="psz" inType="win:UnicodeString" />
          </template>
          <template tid="DownloadManagerDownloadLaunch">
            <data name="psz" inType="win:UnicodeString" />
          </template>
          <template tid="DownloadManagerResPath">
            <data name="psz1" inType="win:UnicodeString" />
            <data name="psz2" inType="win:UnicodeString" />
          </template>
          <template tid="DownloadManagerFilePath">
            <data name="psz" inType="win:UnicodeString" />
          </template>
          <template tid="DownloadThreadStart">
            <data name="psz1" inType="win:UnicodeString" />
          </template>
          <template tid="DownloadThreadOnProgress">
            <data name="uint1" inType="win:UInt32" />
            <data name="uint2" inType="win:UInt32" />
            <data name="uint3" inType="win:UInt32" />
            <data name="psz1" inType="win:UnicodeString" />
          </template>
          <template tid="DownloadThreadOnProgressAborting">
            <data name="dw" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="DownloadThreadOnStopBinding">
            <data name="dw" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="DownloadThreadOnDataAvailable">
            <data name="psz1" inType="win:UnicodeString" />
          </template>
          <template tid="OnInitializeTabStorageFailed">
            <data name="dw" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="SHFindSession">
            <data name="psz1" inType="win:UnicodeString" />
            <data name="dw" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="SHCloseSession">
            <data name="psz1" inType="win:UnicodeString" />
            <data name="dw" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="TabId">
            <data name="psz" inType="win:GUID" />
          </template>
          <template tid="TabIdTitleUrlFavicon">
            <data name="tabId" inType="win:GUID" />
            <data name="pageTitle" inType="win:UnicodeString" />
            <data name="pageUrl" inType="win:UnicodeString" />
            <data name="faviconUrl" inType="win:UnicodeString" />
          </template>
        </templates>

        <!-- IE-ExtensionObject Events -->
        <!-- Here we define the events that this provider writes.
             For information on opcodes, see http://msdn.microsoft.com/en-us/library/aa383956(VS.85).aspx. -->
        <events>

          <!-- FileDownload (100-199) -->
          <event value="101"  symbol="IEXO_FileDownload_DelegateNavigate" keywords="Debug"  level="win:Informational" />
          <event value="102"  symbol="IEXO_FileDownload_Start"            keywords="Debug"  level="win:Informational" />
          <event value="103"  symbol="IEXO_FileDownload_End"              keywords="Debug"  level="win:Informational" />
          <event value="104"  symbol="IEXO_FileDownload_Abort"            keywords="Debug"  level="win:Informational" />
          <event value="105"  symbol="IEXO_FileDownload_Failed"           keywords="Debug"  level="win:Informational" />
          <event value="106"  symbol="IEXO_FileDownload_Launch"           keywords="Debug"  level="win:Informational" version="0" template="FileDownloadLaunch" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.106.message)"/>

          <event value="200"  symbol="IEXO_Debug_Pause"                   keywords="Debug"  level="win:Informational" />
          <event value="201"  symbol="IEXO_Debug_Resume"                  keywords="Debug"  level="win:Informational" />

          <!-- Tab Rehydration -->
          <event value="301"  symbol="PERF_TABREHYDRATION_SAVE_BEGIN"       task="PERF_TABREHYDRATION_SAVE"         opcode="win:Start"  keywords="Performance TabRehydration" level="win:Informational"/>
          <event value="302"  symbol="PERF_TABREHYDRATION_SAVE_END"         task="PERF_TABREHYDRATION_SAVE"         opcode="win:Stop"   keywords="Performance TabRehydration" level="win:Informational"/>
          <event value="303"  symbol="PERF_TABREHYDRATION_RECOVER_BEGIN"    task="PERF_TABREHYDRATION_RECOVER"         opcode="win:Start"  keywords="Performance TabRehydration" level="win:Informational"/>
          <event value="304"  symbol="PERF_TABREHYDRATION_RECOVER_END"      task="PERF_TABREHYDRATION_RECOVER"         opcode="win:Stop"   keywords="Performance TabRehydration" level="win:Informational"/>
          
          <!-- Debug messages -->
          <event value="1000"  symbol="Debug_IEXO_DelegateNavigate"                       keywords="Debug"  level="win:Informational" />
          <event value="1001"  symbol="Debug_DownloadManager_DelegateNavigate"            keywords="Debug"  level="win:Informational" />
          <event value="1002"  symbol="Debug_DownloadManager_DelegateNavigate_Media"      keywords="Debug"  level="win:Informational" />
          <event value="1003"  symbol="Debug_DownloadManager_DelegateNavigate_Download"   keywords="Debug"  level="win:Informational" />
          <event value="1004"  symbol="Debug_DownloadManager_NavigateComplete"            keywords="Debug"  level="win:Informational" />
          <event value="1005"  symbol="Debug_DownloadManager_DownloadCancel"              keywords="Debug"  level="win:Informational" />
          <event value="1006"  symbol="Debug_DownloadManager_DownloadRefresh_Restarting"  keywords="Debug"  level="win:Informational" />
          <event value="1007"  symbol="Debug_DownloadManager_DownloadRefresh_Opening"     keywords="Debug"  level="win:Informational" version="0" template="DownloadManagerDownloadRefresh" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.1007.message)"/>
          <event value="1008"  symbol="Debug_DownloadManager_DownloadLaunch"              keywords="Debug"  level="win:Informational" />
          <event value="1009"  symbol="Debug_DownloadManager_DownloadLaunch_Opening"      keywords="Debug"  level="win:Informational" version="0" template="DownloadManagerDownloadLaunch" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.1010.message)"/>
          <event value="1010"  symbol="Debug_DownloadManager_DownloadDismiss"             keywords="Debug"  level="win:Informational" />
          <event value="1011"  symbol="Debug_DownloadManager_StopIfActive"                keywords="Debug"  level="win:Informational" />
          <event value="1012"  symbol="Debug_DownloadManager_UpdateFriendlyFileName"      keywords="Debug"  level="win:Informational" />
          <event value="1013"  symbol="Debug_DownloadManager_StreamFromIconPath_ResPath"  keywords="Debug"  level="win:Informational" version="0" template="DownloadManagerResPath"  message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.1013.message)"/>
          <event value="1014"  symbol="Debug_DownloadManager_StreamFromIconPath_FilePath" keywords="Debug"  level="win:Informational" version="0" template="DownloadManagerFilePath" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.1014.message)"/>
          <event value="1015"  symbol="Debug_DownloadThread_Destructor"                   keywords="Debug"  level="win:Informational" />
          <event value="1016"  symbol="Debug_DownloadThread_Start"                        keywords="Debug"  level="win:Informational" version="0" template="DownloadThreadStart" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.1016.message)"/>
          <event value="1017"  symbol="Debug_DownloadThread_Stop"                         keywords="Debug"  level="win:Informational" />
          <event value="1018"  symbol="Debug_DownloadThread_KickOffDownload_Begin"        keywords="Debug"  level="win:Informational" task="Debug_DownloadThread_KickOffDownload" opcode="win:Start"/>
          <event value="1019"  symbol="Debug_DownloadThread_KickOffDownload_End"          keywords="Debug"  level="win:Informational" task="Debug_DownloadThread_KickOffDownload" opcode="win:Stop"/>
          <event value="1020"  symbol="Debug_DownloadThread_OnStartBinding"               keywords="Debug"  level="win:Informational" />
          <event value="1021"  symbol="Debug_DownloadThread_GetPriority"                  keywords="Debug"  level="win:Informational" />
          <event value="1022"  symbol="Debug_DownloadThread_OnLowResource"                keywords="Debug"  level="win:Informational" />
          <event value="1023"  symbol="Debug_DownloadThread_OnProgress"                   keywords="Debug"  level="win:Informational" version="0" template="DownloadThreadOnProgress" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.1023.message)"/>
          <event value="1024"  symbol="Debug_DownloadThread_OnProgress_Aborting"          keywords="Debug"  level="win:Informational" version="0" template="DownloadThreadOnProgressAborting" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.1024.message)"/>
          <event value="1025"  symbol="Debug_DownloadThread_OnStopBinding"                keywords="Debug"  level="win:Informational" version="0" template="DownloadThreadOnStopBinding" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.1025.message)"/>
          <event value="1026"  symbol="Debug_DownloadThread_GetBindInfo"                  keywords="Debug"  level="win:Informational" />
          <event value="1027"  symbol="Debug_DownloadThread_OnDataAvailable"              keywords="Debug"  level="win:Informational" version="0" template="DownloadThreadOnDataAvailable" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.1027.message)"/>
          <event value="1028"  symbol="Debug_DownloadThread_OnObjectAvailable"            keywords="Debug"  level="win:Informational" />
          <event value="1029"  symbol="Debug_DownloadThread_GetBindInfoEx"                keywords="Debug"  level="win:Informational" />
          <event value="1030"  symbol="Debug_DownloadThread_BeginningTransaction"         keywords="Debug"  level="win:Informational" />
          <event value="1031"  symbol="Debug_IEXO_DownloadManagerSaveTab"                 keywords="Debug"  level="win:Informational" />
          <event value="1032"  symbol="Debug_IEXO_DownloadManagerRestoreTab"              keywords="Debug"  level="win:Informational" />
          <event value="1033"  symbol="Debug_IEXO_DownloadManagerDownloadEnded"           keywords="Debug"  level="win:Informational" />
          <event value="1034"  symbol="Debug_IEXO_WriteTabRoamingFile"                    keywords="Roaming"  level="win:Informational" version="0" template="TabIdTitleUrlFavicon" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.1034.message)"/>
          <event value="1035"  symbol="Debug_IEXO_DeleteTabRoamingFile"                   keywords="Roaming"  level="win:Informational" version="0" template="TabId" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.1035.message)"/>
 
          <!-- Retail messages -->
          <event value="2000"  symbol="Retail_IEXO_OnInitializeTabStorageFailed"          keywords="Debug"  level="win:Error" version="0" template="OnInitializeTabStorageFailed" message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.2000.message)"/>
          <event value="2001"  symbol="Retail_IEXO_CloseTabSession_SHFindSession"         keywords="Debug"  level="win:Error" version="0" template="SHFindSession"                message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.2001.message)"/>
          <event value="2002"  symbol="Retail_IEXO_CloseTabSession_SHCloseSession"        keywords="Debug"  level="win:Error" version="0" template="SHCloseSession"               message="$(string.Microsoft-WindowsPhone-IE-IEExtension.event.2002.message)"/>
        </events>

      </provider>

      <provider
        name="Microsoft-WindowsPhone-IE-Iexplore-Provider"
        guid="{739EAE95-FAFA-4e1a-9F98-3E2F723BCBC6}"
        symbol="BERP_Iexplore"
        messageFileName="BrowserLogging.dll"
        resourceFileName="BrowserLogging.dll">
        <keywords>
          <keyword mask="0x0000000000000001" name="Debug"/>
          <keyword mask="0x0000000000000002" name="Performance"/>
        </keywords>
        <tasks>
          <task name="PERF_IEXPLORE_RUN"          symbol="PERF_IEXPLORE_RUN_TASK"         value="1"/>
          <task name="PERF_IEXPLORE_LOAD_TESTXO"  symbol="PERF_IEXPLORE_LOAD_TESTXO_TASK" value="2"/>
        </tasks>
        <events>
          <event value="1" symbol="PERF_IEXPLORE_RUN"               task="PERF_IEXPLORE_RUN" opcode="win:Info"  level="win:Informational" keywords="Performance"/>
          <event value="2" symbol="PERF_IEXPLORE_LOAD_TESTXO_BEGIN" task="PERF_IEXPLORE_RUN" opcode="win:Start" level="win:Informational" keywords="Performance"/>
          <event value="3" symbol="PERF_IEXPLORE_LOAD_TESTXO_END"   task="PERF_IEXPLORE_RUN" opcode="win:Stop"  level="win:Informational" keywords="Performance"/>
        </events>

      </provider>

      <provider
        name="Microsoft-WindowsPhone-IE-FileUtility-Provider"
        guid="{4938062B-00C5-434e-AC6F-6980BC8FE4DB}"
        symbol="BERP_IEFileUtility"
        messageFileName="BrowserLogging.dll"
        resourceFileName="BrowserLogging.dll">
        <keywords>
          <keyword mask="0x0000000000000001" name="Debug"/>
          <keyword mask="0x0000000000000002" name="Performance"/>
        </keywords>
        <templates>
          <template tid="HasFreeSpace">
            <data name="ul1" inType="win:UInt64" />
            <data name="ul2" inType="win:UInt64" />
          </template>
        </templates>
        <tasks>
        </tasks>
        <events>

          <!-- Debug messages -->
          <event value="1000" symbol="Debug_FileUtility_HasFreeSpace"   opcode="win:Info" level="win:Informational" keywords="Debug " version="0" template="HasFreeSpace" message="$(string.Microsoft-WindowsPhone-IE-FileUtility.event.1000.message)" />
        </events>

        <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
        <!-- If you change this list, please also update iexploreperf.h and ..\markup\Directory.uix -->
        <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

      </provider>

      <provider
        name="Microsoft-WindowsPhone-IE-Settings-Provider"
        guid="{92CD3211-F11E-4d53-9040-5D111AB75754}"
        symbol="BERP_IE_Settings"
        messageFileName="BrowserLogging.dll"
        resourceFileName="BrowserLogging.dll">
        <keywords>
          <keyword mask="0x0000000000000001" name="Debug"/>
          <keyword mask="0x0000000000000002" name="Performance"/>
        </keywords>
        <templates>
          <template tid="SuppressError">
            <data name="psz" inType="win:AnsiString" />
            <data name="dw" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="OnLinkClickedError">
            <data name="psz" inType="win:UnicodeString" />
          </template>
        </templates>
        <tasks>
          <task name="PERF_DELETE_CACHE"  value="1"/>
        </tasks>
        <events>
          <event value="1" symbol="PERF_DELETE_CACHE_BEGIN"  task="PERF_DELETE_CACHE"  opcode="win:Start" level="win:Informational" keywords="Performance"/>
          <event value="2" symbol="PERF_DELETE_CACHE_END"    task="PERF_DELETE_CACHE"  opcode="win:Stop"  level="win:Informational" keywords="Performance"/>

          <!-- Retail messages -->
          <event value="2000" symbol="RETAIL_SUPPRESS_SPLASH_ERROR"                    opcode="win:Info"  level="win:Warning"       keywords="Debug" template="SuppressError"       message="$(string.Microsoft-WindowsPhone-IE-Settings.event.2000.message)"/>
          <event value="2001" symbol="RETAIL_ONLINKCLICKED_ERROR"                      opcode="win:Info"  level="win:Warning"       keywords="Debug" template="OnLinkClickedError"  message="$(string.Microsoft-WindowsPhone-IE-Settings.event.2001.message)"/>
        </events>

      </provider>

      <provider
        name="Microsoft-WindowsPhone-Suggestions-Provider"
        guid="{4F912829-B932-41e3-87AE-106809893449}"
        symbol="BERP_Suggestions"
        messageFileName="BrowserLogging.dll"
        resourceFileName="BrowserLogging.dll">
        <keywords>
          <keyword mask="0x0000000000000001" name="Debug"/>
          <keyword mask="0x0000000000000002" name="Performance"/>
        </keywords>
        <templates>
          <template tid="OnSuggestionsReadyTemplate">
            <data name="dw" inType="win:UInt32" outType="win:HexInt32" />
            <data name="psz" inType="win:UnicodeString" />
          </template>
          <template tid="DumpDebugTemplate">
            <data name="dw1" inType="win:UInt32" outType="win:HexInt32" />
            <data name="psz" inType="win:UnicodeString" />
            <data name="dw2" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="FailedCoInitializeEx">
            <data name="dw" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="FailedGetSuggestionsManager">
            <data name="dw" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="FailedCustomizeDataSource">
            <data name="dw1" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="FailedActivatingDataSource">
            <data name="psz" inType="win:GUID" />
          </template>
        </templates>
        
        <tasks>
          <task name="PERF_SUGGESTIONS_UPDATESUGGESTIONS"  value="1"/>
          <task name="PERF_SUGGESTIONS_REQUESTSUGGESTIONS" value="2"/>
          <task name="PERF_SUGGESTIONS_ADDDATASOURCEMINS"  value="3"/>

          <!-- Debug messages -->
        </tasks>
        <events>
          <event value="1" symbol="PERF_SUGGESTIONS_UPDATESUGGESTIONS_BEGIN"  task="PERF_SUGGESTIONS_UPDATESUGGESTIONS"  opcode="win:Start" level="win:Informational" keywords="Performance"/>
          <event value="2" symbol="PERF_SUGGESTIONS_UPDATESUGGESTIONS_END"    task="PERF_SUGGESTIONS_UPDATESUGGESTIONS"  opcode="win:Stop"  level="win:Informational" keywords="Performance"/>
          <event value="3" symbol="PERF_SUGGESTIONS_ADDDATASOURCEMINS_BEGIN"  task="PERF_SUGGESTIONS_ADDDATASOURCEMINS"  opcode="win:Start" level="win:Informational" keywords="Performance"/>
          <event value="4" symbol="PERF_SUGGESTIONS_ADDDATASOURCEMINS_END"    task="PERF_SUGGESTIONS_ADDDATASOURCEMINS"  opcode="win:Stop"  level="win:Informational" keywords="Performance"/>
          <event value="5" symbol="PERF_SUGGESTIONS_REQUESTSUGGESTIONS_BEGIN" task="PERF_SUGGESTIONS_REQUESTSUGGESTIONS" opcode="win:Start" level="win:Informational" keywords="Performance"/>
          <event value="6" symbol="PERF_SUGGESTIONS_REQUESTSUGGESTIONS_END"   task="PERF_SUGGESTIONS_REQUESTSUGGESTIONS" opcode="win:Stop"  level="win:Informational" keywords="Performance"/>

          <!-- Debug messages -->
          <event value="1000" symbol="DEBUG_MTFSUGGESTIONSMANAGER_ONSUGGESTIONSREADY"     opcode="win:Info" level="win:Informational" keywords="Debug" template="OnSuggestionsReadyTemplate" message="$(string.Microsoft-WindowsPhone-Suggestions.event.1000.message)" />
          <event value="1001" symbol="DEBUG_MTFSUGGESTIONSMANAGER_DUMPDEBUG"              opcode="win:Info" level="win:Informational" keywords="Debug" template="DumpDebugTemplate"          message="$(string.Microsoft-WindowsPhone-Suggestions.event.1001.message)" />
          <event value="1002" symbol="DEBUG_MTFSUGGESTIONSMANAGER_UNSORTED_RESULTS"       opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1003" symbol="DEBUG_MTFSUGGESTIONSMANAGER_SORTED_RESULTS"         opcode="win:Info" level="win:Informational" keywords="Debug" />
          <event value="1004" symbol="DEBUG_MTFSUGGESTIONSMANAGER_RESULTS_WITH_MINIMUMS"  opcode="win:Info" level="win:Informational" keywords="Debug" />
          
          <!-- Retail messages -->
          <event value="2000" symbol="RETAIL_SUGGESTIONSMODEL_INITIALIZED"                                opcode="win:Info" level="win:Warning"       keywords="Debug" />
          <event value="2001" symbol="RETAIL_SUGGESTIONSMODEL_INITIALIZED_FAILED_COINITIALIZEEX"          opcode="win:Info" level="win:Error"         keywords="Debug" template="FailedCoInitializeEx"         message="$(string.Microsoft-WindowsPhone-Suggestions.event.2001.message)"/>
          <event value="2002" symbol="RETAIL_SUGGESTIONSMODEL_INITIALIZED_FAILED_GETSUGGESTIONSMANAGER"   opcode="win:Info" level="win:Error"         keywords="Debug" template="FailedGetSuggestionsManager"  message="$(string.Microsoft-WindowsPhone-Suggestions.event.2002.message)"/>
          <event value="2003" symbol="RETAIL_MTFFACADE_CUSTOMIZEDATASOURCE_FAILED"                        opcode="win:Info" level="win:Error"         keywords="Debug" template="FailedCustomizeDataSource"    message="$(string.Microsoft-WindowsPhone-Suggestions.event.2003.message)"/>
          <event value="2004" symbol="RETAIL_MTFSUGGESTIONSMANAGER_ACTIVATEDATASOURCE_FAILED"             opcode="win:Info" level="win:Error"         keywords="Debug" template="FailedActivatingDataSource"   message="$(string.Microsoft-WindowsPhone-Suggestions.event.2004.message)"/>
        </events>

      </provider>
      
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Microsoft-WindowsPhone-IE-DataStore-TabStorage.event.1.message" value="OleTabRecoveryStore::SaveCurrentPage Title = %1 Url = %2 Thumbnail = 0x%3">
        </string>
        <string id="Microsoft-WindowsPhone-IE-DataStore-TabStorage.event.2.message" value="OleTabRecoveryStore::SaveTabs Save %1 tabs in total">
        </string>
        <string id="Microsoft-WindowsPhone-IE-DataStore-TabStorage.event.3.message" value="OleTabRecoveryStore::SaveSingleTab EntryId = %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-DataStore-TabStorage.event.4.message" value="OleTabRecoveryStore::RecoverTab Recover = %1 tabs in total">
        </string>
        <string id="Microsoft-WindowsPhone-IE-DataStore-TabStorage.event.5.message" value="OleTabRecoveryStore::RecoverSingleTab EntryId = %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-DataStore.event.2000.message" value="TabIndexStore::DeleteTabIndex hr = %1 GetLastError = %2">
        </string>
        <string id="Microsoft-WindowsPhone-IE-DataStore.event.2001.message" value="TabIndexStore::FindTabIndexWithMinValue hr = %1 GetLastError = %2">
        </string>
        <string id="Microsoft-WindowsPhone-IE-DataStore.event.2002.message" value="TabIndexStore::FindTabIndexWithMaxValue hr = %1 GetLastError = %2">
        </string>
        <string id="Microsoft-WindowsPhone-IE-DataStore.event.2003.message" value="TabIndexStore::GetTotalTabIndex hr = %1 GetLastError = %2">
        </string>
        <string id="Microsoft-WindowsPhone-IE-DataStore.event.2004.message" value="TabIndexStore::SetTabMarkedForDeletion for %1 returned %2">
        </string>
        <string id="Microsoft-WindowsPhone-IE-DataStore.event.2005.message" value="TabStorage::CreateStorage failed with error %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-DataStore.event.2006.message" value="TabIndexStore::SetTabInPrivateMode for %1 returned %2">
        </string>
      </stringTable>

      <stringTable>
        <string id="opcode.Start" value="Start">
        </string>
        <string id="opcode.Info" value="Info">
        </string>
        <string id="level.Warning" value="Warning">
        </string>
        <string id="level.Verbose" value="Verbose">
        </string>
        <string id="level.Error" value="Error">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEUX.event.1000.message" value="Navigation: %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEUX.event.2000.message" value="DeleteHistory failed! - %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEUX.event.2001.message" value="BrowserHostModel::Init failed with error %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEUX.event.2004.message" value="DeleteSingleHistory failed! - %1">
        </string>   
      </stringTable>

      <stringTable>
        <string id="Microsoft-WindowsPhone-IE-TabsManager.event.2000.message" value="TabsLauncherModel::CrossNavigateInNewTab Launching Session=%1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-TabsManager.event.2002.message" value="TabsLauncherModel::UpdateSessionInfo failed with error %1 for Session = %2">
        </string>
      </stringTable>

      <stringTable>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.106.message" value="Launch %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.1007.message" value="DownloadManager::DownloadRefresh Opening %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.1010.message" value="DownloadManager::DownloadLaunch Opening %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.1013.message" value="DownloadManager::IconPath %1 %2">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.1014.message" value="DownloadManager::FilePath %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.1016.message" value="DownloadThread::Start %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.1023.message" value="DownloadThread::OnProgress %1 %2/%3 %4">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.1024.message" value="DownloadThread::OnProgress aborting %1 ">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.1025.message" value="DownloadThread::OnStopBinding %1 ">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.1027.message" value="DownloadThread::OnDataAvailable %1 ">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.1034.message" value="TabRoaming::WriteTabRoamingFile ID:[%1] Title:[%2] URL:[%3] FaviconURL:[%4]">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.1035.message" value="TabRoaming::DeleteRoamingFile %1 ">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.2000.message" value="CIEExtension::OnInitializeTabStorage failed with error %1 ">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.2001.message" value="CIEExtension::CloseTabSession - SHFindSession for %1 returned %2 ">
        </string>
        <string id="Microsoft-WindowsPhone-IE-IEExtension.event.2002.message" value="CIEExtension::CloseTabSession - SHCloseSession for %1 returned %2 ">
        </string>
      </stringTable>

      <stringTable>
        <string id="Microsoft-WindowsPhone-IE-FileUtility.event.1000.message" value="FileUtility::HasFreeSpace %1 %2">
        </string>
      </stringTable>

      <stringTable>
        <string id="Microsoft-WindowsPhone-IE-Settings.event.2000.message" value="MODEL ERROR SUPPRESSED: %1, %2">
        </string>
        <string id="Microsoft-WindowsPhone-IE-Settings.event.2001.message" value="OnLinkClicked error with URL = %1">
        </string>
      </stringTable>

      <stringTable>
        <string id="Microsoft-WindowsPhone-Suggestions.event.1000.message" value="[%1] %2">
        </string>
        <string id="Microsoft-WindowsPhone-Suggestions.event.1001.message" value="Prob: %d %s Data Source Index:(%d)">
        </string>
        <string id="Microsoft-WindowsPhone-Suggestions.event.2001.message" value="SuggestionsModel::Initialize failed - CoInitializeEx failed with %1">
        </string>
        <string id="Microsoft-WindowsPhone-Suggestions.event.2002.message" value="SuggestionsModel::Initialize failed - Get*SuggestionsManager failed with %1">
        </string>
        <string id="Microsoft-WindowsPhone-Suggestions.event.2003.message" value="Failed in MtfFacade::CustomizeDataSource for dwDataSourceID = %1">
        </string>
        <string id="Microsoft-WindowsPhone-Suggestions.event.2004.message" value="Activating data source %1 failed.">
        </string>
      </stringTable>
      
    </resources>
  </localization>
</instrumentationManifest>
