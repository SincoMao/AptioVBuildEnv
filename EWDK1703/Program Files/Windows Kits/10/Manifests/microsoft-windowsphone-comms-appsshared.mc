<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<instrumentationManifest
    xmlns="http://schemas.microsoft.com/win/2004/08/events"
    xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:Comms="http://www.w3.org/2001/XMLSchema">
  <instrumentation>

    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-Comms-AppsShared"
          guid="{EF5E8EC7-4D12-4478-A91B-AC520F8A0BEF}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_APPSSHARED"
          resourceFileName="CommsAppsShared.dll"
          messageFileName="CommsAppsShared.dll">

        <templates>
          <!--Event Template defined for Comms Logging -->
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

          <!--Event Template defined for Comms Logging -->
          <template tid="CommsIFFAILTemplate">
            <data name="Prop_FUNC_AnsiString" inType="win:AnsiString" />
            <data name="Prop_LINE_UInt32" inType="win:UInt32" />
            <data name="Prop_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="Comms_printftrace_template">
            <data name="Prop_FILE_AnsiString" inType="win:AnsiString" />
            <data name="Prop_LINE_UInt32" inType="win:UInt32" />
            <data name="Prop_Trace_UnicodeString" inType="win:UnicodeString" />
          </template>

          <template tid="Comms_scopetrace_template">
            <data name="Prop_FUNC_AnsiString" inType="win:AnsiString" />
          </template>

          <template tid="Int">
            <data name="Prop_Int1" inType="win:Int32"/>
          </template>

          <template tid="Uint">
            <data name="Prop_Uint1" inType="win:UInt32"/>
          </template>

          <template tid="Uint_Uint">
            <data name="Prop_Uint1" inType="win:UInt32"/>
            <data name="Prop_Uint2" inType="win:UInt32"/>
          </template>

          <template tid="Int_Int">
            <data name="Prop_Int1" inType="win:Int32"/>
            <data name="Prop_Int2" inType="win:Int32"/>
          </template>

          <template tid="Uint_Uint_Uint">
            <data name="Prop_Uint1" inType="win:UInt32"/>
            <data name="Prop_Uint2" inType="win:UInt32"/>
            <data name="Prop_Uint3" inType="win:UInt32"/>
          </template>

          <template tid="Uint_Uint_Uint_Uint_Uint">
            <data name="Prop_Uint1" inType="win:UInt32"/>
            <data name="Prop_Uint2" inType="win:UInt32"/>
            <data name="Prop_Uint3" inType="win:UInt32"/>
            <data name="Prop_Uint4" inType="win:UInt32"/>
            <data name="Prop_Uint5" inType="win:UInt32"/>
          </template>

          <template tid="Uint_Pointer_UnicodeString">
            <data name="Prop_Uint1" inType="win:UInt32"/>
            <data name="Prop_Pointer" inType="win:Pointer"/>
            <data name="Prop_UnicodeString" inType="win:UnicodeString"/>
          </template>

          <template tid="UnicodeString_Uint">
            <data name="Prop_UnicodeString1" inType="win:UnicodeString"/>
            <data name="Prop_Uint2" inType="win:UInt32"/>
          </template>

          <template tid="UnicodeString_Uint_Uint_Uint_Uint">
            <data name="Prop_UnicodeString1" inType="win:UnicodeString"/>
            <data name="Prop_Uint2" inType="win:UInt32"/>
            <data name="Prop_Uint3" inType="win:UInt32"/>
            <data name="Prop_Uint4" inType="win:UInt32"/>
            <data name="Prop_Uint5" inType="win:UInt32"/>
          </template>

          <template tid="UnicodeString_Int_Int_Int_Int">
            <data name="Prop_UnicodeString1" inType="win:UnicodeString"/>
            <data name="Prop_Int2" inType="win:Int32"/>
            <data name="Prop_Int3" inType="win:Int32"/>
            <data name="Prop_Int4" inType="win:Int32"/>
            <data name="Prop_Int5" inType="win:Int32"/>
          </template>

          <template tid="UnicodeString_Uint_Uint_Uint_Ptr">
            <data name="Prop_UnicodeString1" inType="win:UnicodeString"/>
            <data name="Prop_Uint2" inType="win:UInt32"/>
            <data name="Prop_Uint3" inType="win:UInt32"/>
            <data name="Prop_Uint4" inType="win:UInt32"/>
            <data name="Prop_Uint5" inType="win:Pointer"/>
          </template>

          <template tid="UnicodeString_Uint_Uint_Uint_Uint_Uint_Uint_Uint_Bool_Ptr">
            <data name="Prop_UnicodeString1" inType="win:UnicodeString"/>
            <data name="Prop_Uint2" inType="win:UInt32"/>
            <data name="Prop_Uint3" inType="win:UInt32"/>
            <data name="Prop_Uint4" inType="win:UInt32"/>
            <data name="Prop_Uint5" inType="win:UInt32"/>
            <data name="Prop_Uint6" inType="win:UInt32"/>
            <data name="Prop_Uint7" inType="win:UInt32"/>
            <data name="Prop_Uint8" inType="win:UInt32"/>
            <data name="Prop_Uint9" inType="win:Boolean"/>
            <data name="Prop_Uint10" inType="win:Pointer"/>
          </template>

          <template tid="Uint_Uint_UnicodeString_Uint_Uint">
            <data name="Prop_Uint1" inType="win:UInt32"/>
            <data name="Prop_Uint2" inType="win:UInt32"/>
            <data name="Prop_UnicodeString3" inType="win:UnicodeString"/>
            <data name="Prop_Uint4" inType="win:UInt32"/>
            <data name="Prop_Uint5" inType="win:UInt32"/>
          </template>

          <template tid="OneBool">
            <data name="Prop_BOOL" inType="win:Boolean" outType="xs:boolean"/>
          </template>

        </templates>

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />

          <!-- Provider-specific keywords -->
          <keyword mask="0x0000000000000004" name="Debug"/>
          <keyword mask="0x0000000000000020" name="StatusBarManager"/>
          <keyword mask="0x0000000000000040" name="UixPagedList"/>
          <keyword mask="0x0000000000000080" name="Other"/>

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning" message="$(string.Keyword.Warning)"/>
        </keywords>

        <tasks>
          <task name="COMMSAPPSHARED_CONTACTRESOLVER_RESOLVEMECONTACTDETAILS" value="200"/>
          <task name="COMMSAPPSHARED_CONTACTRESOLVER_RESOLVECONTACTDETAILS" value="201"/>
          <task name="COMMSAPPSHARED_CONTACTRESOLVER_GETCONTACTFROMSTORE" value="202"/>
          <task name="COMMSAPPSHARED_CONTACTRESOLVER_FINDCONTACT" value="203"/>
          <task name="COMMSAPPSHARED_HIGHLIGHTER_HIGHLIGHTSTRING" value="204"/>
        </tasks>

        <events>
          <!-- Standardized Errors, Warning, and Info Events -->

          <!-- CommsErrorEvent and CommsErrorPropagateEvent are the default handling of 
          ifErrorReturn and ehm HR logging -->
          <event value="1"
              level="win:Error"
              template="CommsHrTemplate"
              symbol="CommsErrorOriginateEvent"
              message="$(string.Event.CommsErrorOriginateMessage)"
              keywords="Error"/>

          <event value="2"
              level="win:Warning"
              template="CommsHrTemplate"
              symbol="CommsErrorPropagateEvent"
              message="$(string.Event.CommsPropagateErrorMessage)"
              keywords="Warning"/>

          <event value="200" symbol="COMMSAPPSHARED_CONTACTRESOLVER_RESOLVEMECONTACTDETAILS_START" task="COMMSAPPSHARED_CONTACTRESOLVER_RESOLVEMECONTACTDETAILS" level="win:Verbose" opcode="win:Start" keywords="Performance"/>
          <event value="201" symbol="COMMSAPPSHARED_CONTACTRESOLVER_RESOLVEMECONTACTDETAILS_STOP" task="COMMSAPPSHARED_CONTACTRESOLVER_RESOLVEMECONTACTDETAILS" level="win:Verbose" opcode="win:Stop" keywords="Performance"/>
          <event value="202" symbol="COMMSAPPSHARED_CONTACTRESOLVER_RESOLVECONTACTDETAILS_START" task="COMMSAPPSHARED_CONTACTRESOLVER_RESOLVECONTACTDETAILS" level="win:Verbose" opcode="win:Start" keywords="Performance"/>
          <event value="203" symbol="COMMSAPPSHARED_CONTACTRESOLVER_RESOLVECONTACTDETAILS_STOP" task="COMMSAPPSHARED_CONTACTRESOLVER_RESOLVECONTACTDETAILS" level="win:Verbose" opcode="win:Stop" keywords="Performance"/>
          <event value="204" symbol="COMMSAPPSHARED_CONTACTRESOLVER_GETCONTACTFROMSTORE_START" task="COMMSAPPSHARED_CONTACTRESOLVER_GETCONTACTFROMSTORE" level="win:Verbose" opcode="win:Start" keywords="Performance"/>
          <event value="205" symbol="COMMSAPPSHARED_CONTACTRESOLVER_GETCONTACTFROMSTORE_STOP" task="COMMSAPPSHARED_CONTACTRESOLVER_GETCONTACTFROMSTORE" level="win:Verbose" opcode="win:Stop" keywords="Performance"/>
          <event value="206" symbol="COMMSAPPSHARED_CONTACTRESOLVER_FINDCONTACT_START" task="COMMSAPPSHARED_CONTACTRESOLVER_FINDCONTACT" level="win:Verbose" opcode="win:Start" keywords="Performance"/>
          <event value="207" symbol="COMMSAPPSHARED_CONTACTRESOLVER_FINDCONTACT_STOP" task="COMMSAPPSHARED_CONTACTRESOLVER_FINDCONTACT" level="win:Verbose" opcode="win:Stop" keywords="Performance"/>
          <event value="208" symbol="COMMSAPPSHARED_HIGHLIGHTER_HIGHLIGHTSTRING_START" task="COMMSAPPSHARED_HIGHLIGHTER_HIGHLIGHTSTRING" level="win:Verbose" opcode="win:Start" keywords="Performance"  />
          <event value="209" symbol="COMMSAPPSHARED_HIGHLIGHTER_HIGHLIGHTSTRING_STOP" task="COMMSAPPSHARED_HIGHLIGHTER_HIGHLIGHTSTRING" level="win:Verbose" opcode="win:Stop"  keywords="Performance"  />

          <!-- StatusBarManager events -->
          <event value="500"
            level="win:Informational"
            symbol="StatusBarManager_AddedNewClientSubscription"
            message="$(string.Event.StatusBarManager_AddedNewClientSubscription)"
            template="Uint"
            keywords="StatusBarManager"/>

          <event value="501"
            level="win:Informational"
            symbol="StatusBarManager_CancelClientSubscription"
            message="$(string.Event.StatusBarManager_CancelClientSubscription)"
            template="Uint"
            keywords="StatusBarManager"/>

          <event value="502"
            level="win:Informational"
            symbol="StatusBarManager_NotifyNewEvent"
            message="$(string.Event.StatusBarManager_NotifyNewEvent)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="503"
            level="win:Informational"
            symbol="StatusBarManager_NotifyNewDelayedEvent"
            message="$(string.Event.StatusBarManager_NotifyNewDelayedEvent)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="504"
            level="win:Informational"
            symbol="StatusBarManager_NotifyExistingEvent"
            message="$(string.Event.StatusBarManager_NotifyExistingEvent)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="505"
            level="win:Informational"
            symbol="StatusBarManager_NotifyExistingDelayedEvent"
            message="$(string.Event.StatusBarManager_NotifyExistingDelayedEvent)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="506"
            level="win:Informational"
            symbol="StatusBarManager_DismissEvent"
            message="$(string.Event.StatusBarManager_DismissEvent)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="507"
            level="win:Informational"
            symbol="StatusBarManager_SetFilterCookie"
            message="$(string.Event.StatusBarManager_SetFilterCookie)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="508"
            level="win:Informational"
            symbol="StatusBarManager_ClearFilterCookie"
            message="$(string.Event.StatusBarManager_ClearFilterCookie)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="509"
            level="win:Informational"
            symbol="StatusBarManager_DelayEvent"
            message="$(string.Event.StatusBarManager_DelayEvent)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="510"
            level="win:Informational"
            symbol="StatusBarManager_ActivateDelayedEvent"
            message="$(string.Event.StatusBarManager_ActivateDelayedEvent)"
            template="Uint"
            keywords="StatusBarManager"/>

          <event value="511"
            level="win:Informational"
            symbol="StatusBarManager_SetLagTime"
            message="$(string.Event.StatusBarManager_SetLagTime)"
            template="Uint_Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="512"
            level="win:Informational"
            symbol="StatusBarManager_ExtendLagTime"
            message="$(string.Event.StatusBarManager_ExtendLagTime)"
            template="Uint_Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="513"
            level="win:Informational"
            symbol="StatusBarManager_ExtendElapsedLagTime"
            message="$(string.Event.StatusBarManager_ExtendElapsedLagTime)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="514"
            level="win:Informational"
            symbol="StatusBarManager_LagTimeElapsed"
            message="$(string.Event.StatusBarManager_LagTimeElapsed)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="515"
            level="win:Informational"
            symbol="StatusBarManager_IsStatusBarListeningReturned"
            message="$(string.Event.StatusBarManager_IsStatusBarListeningReturned)"
            template="Uint"
            keywords="StatusBarManager"/>

          <event value="516"
            level="win:Informational"
            symbol="ProgressIndicatorVM_QueueStatusEvent"
            message="$(string.Event.ProgressIndicatorVM_QueueStatusEvent)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="517"
            level="win:Informational"
            symbol="ProgressIndicatorVM_DisplayStatusEvent_Hide"
            message="$(string.Event.ProgressIndicatorVM_DisplayStatusEvent_Hide)"
            template="Uint"
            keywords="StatusBarManager"/>

          <event value="518"
            level="win:Informational"
            symbol="ProgressIndicatorVM_DisplayStatusEvent_SetText"
            message="$(string.Event.ProgressIndicatorVM_DisplayStatusEvent_SetText)"
            template="UnicodeString_Uint"
            keywords="StatusBarManager"/>

          <event value="519"
            level="win:Informational"
            symbol="ProgressIndicatorVM_DisplayStatusEvent_SetProgress"
            message="$(string.Event.ProgressIndicatorVM_DisplayStatusEvent_SetProgress)"
            template="Uint_Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="520"
            level="win:Informational"
            symbol="ProgressIndicatorVM_DisplayStatusEvent_SetMarquee"
            message="$(string.Event.ProgressIndicatorVM_DisplayStatusEvent_SetMarquee)"
            template="Uint"
            keywords="StatusBarManager"/>

          <event value="521"
            level="win:Informational"
            symbol="ProgressIndicatorVM_DisplayStatusEvent_TaskIdInvalid"
            message="$(string.Event.ProgressIndicatorVM_DisplayStatusEvent_TaskIdInvalid)"
            template="Uint"
            keywords="StatusBarManager"/>

          <event value="522"
            level="win:Informational"
            symbol="StatusBarManager_ActivateEventPackage_ShowNewEvent"
            message="$(string.Event.StatusBarManager_ActivateEventPackage_ShowNewEvent)"
            template="Uint_Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="523"
            level="win:Informational"
            symbol="StatusBarManager_ActivateEventPackage_IgnoreNewEvent"
            message="$(string.Event.StatusBarManager_ActivateEventPackage_IgnoreNewEvent)"
            template="Uint_Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="524"
            level="win:Informational"
            symbol="StatusBarManager_UpdateStatusBar_IgnoreClearText_StatusBarLocked"
            message="$(string.Event.StatusBarManager_UpdateStatusBar_IgnoreClearText_StatusBarLocked)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <event value="525"
            level="win:Informational"
            symbol="StatusBarManager_UpdateStatusBar_IgnoreClearText_NoEventShown"
            message="$(string.Event.StatusBarManager_UpdateStatusBar_IgnoreClearText_NoEventShown)"
            template="Uint_Uint"
            keywords="StatusBarManager"/>

          <!-- UixPagedList events -->
          <event value="898"
            level="win:Informational"
            symbol="PagedDataReader_PageInfo"
            message="$(string.Event.PagedDataReader_PageInfo)"
            template="UnicodeString_Uint_Uint_Uint_Uint"
            keywords="UixPagedList"/>

          <event value="899"
            level="win:Informational"
            symbol="PagedDataReader_PageItem"
            message="$(string.Event.PagedDataReader_PageItem)"
            template="Uint_Pointer_UnicodeString"
            keywords="UixPagedList"/>

          <event value="900"
            level="win:Informational"
            symbol="PagedDataReader_PageItemNull"
            message="$(string.Event.PagedDataReader_PageItemNull)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="901"
            level="win:Informational"
            symbol="PagedDataReader_SetPageRange"
            message="$(string.Event.PagedDataReader_SetPageRange)"
            template="Uint_Uint"
            keywords="UixPagedList"/>

          <event value="902"
            level="win:Informational"
            symbol="PagedDataReader_SetPageRange_RemoveFromStart"
            message="$(string.Event.PagedDataReader_SetPageRange_RemoveFromStart)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="903"
            level="win:Informational"
            symbol="PagedDataReader_SetPageRange_RemoveFromEnd"
            message="$(string.Event.PagedDataReader_SetPageRange_RemoveFromEnd)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="904"
            level="win:Informational"
            symbol="PagedDataReader_SetPageRange_AddToStart"
            message="$(string.Event.PagedDataReader_SetPageRange_AddToStart)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="905"
            level="win:Informational"
            symbol="PagedDataReader_SetPageRange_AddToEnd"
            message="$(string.Event.PagedDataReader_SetPageRange_AddToEnd)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="906"
            level="win:Informational"
            symbol="PagedDataReader_SetPageRange_ChangeStart"
            message="$(string.Event.PagedDataReader_SetPageRange_ChangeStart)"
            template="Uint_Uint"
            keywords="UixPagedList"/>

          <event value="907"
            level="win:Informational"
            symbol="PagedDataReader_SetPageRange_OnPageChanged"
            message="$(string.Event.PagedDataReader_SetPageRange_OnPageChanged)"
            keywords="UixPagedList"/>

          <event value="908"
            level="win:Informational"
            symbol="PagedDataReader_ProcessWork"
            message="$(string.Event.PagedDataReader_ProcessWork)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="909"
            level="win:Informational"
            symbol="PagedDataReader_ProcessRemoveAtIndex"
            message="$(string.Event.PagedDataReader_ProcessRemoveAtIndex)"
            template="Uint_Uint"
            keywords="UixPagedList"/>

          <event value="910"
            level="win:Informational"
            symbol="PagedDataReader_ProcessRemoveItems"
            message="$(string.Event.PagedDataReader_ProcessRemoveItems)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="911"
            level="win:Informational"
            symbol="PagedDataReader_ProcessRemoveItems_InPage"
            message="$(string.Event.PagedDataReader_ProcessRemoveItems_InPage)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="912"
            level="win:Informational"
            symbol="PagedDataReader_ProcessRemoveItems_BeforePage"
            message="$(string.Event.PagedDataReader_ProcessRemoveItems_BeforePage)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="913"
            level="win:Informational"
            symbol="PagedDataReader_ProcessRemoveItems_AfterPage"
            message="$(string.Event.PagedDataReader_ProcessRemoveItems_AfterPage)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="914"
            level="win:Informational"
            symbol="PagedDataReader_ProcessInsertAtIndex"
            message="$(string.Event.PagedDataReader_ProcessInsertAtIndex)"
            template="Uint_Uint"
            keywords="UixPagedList"/>

          <event value="915"
            level="win:Informational"
            symbol="PagedDataReader_ProcessReset"
            message="$(string.Event.PagedDataReader_ProcessReset)"
            keywords="UixPagedList"/>

          <event value="916"
            level="win:Informational"
            symbol="PagedDataReader_ProcessInsertItems"
            message="$(string.Event.PagedDataReader_ProcessInsertItems)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="917"
            level="win:Informational"
            symbol="PagedDataReader_ProcessInsertItems_AlreadyInPage"
            message="$(string.Event.PagedDataReader_ProcessInsertItems_AlreadyInPage)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="918"
            level="win:Informational"
            symbol="PagedDataReader_ProcessInsertItems_BeforePage"
            message="$(string.Event.PagedDataReader_ProcessInsertItems_BeforePage)"
            keywords="UixPagedList"/>

          <event value="919"
            level="win:Informational"
            symbol="PagedDataReader_ProcessInsertItems_AfterPage"
            message="$(string.Event.PagedDataReader_ProcessInsertItems_AfterPage)"
            keywords="UixPagedList"/>

          <event value="920"
            level="win:Informational"
            symbol="PagedDataReader_ProcessInsertItems_InPage"
            message="$(string.Event.PagedDataReader_ProcessInsertItems_InPage)"
            template="Uint_Uint"
            keywords="UixPagedList"/>

          <event value="921"
            level="win:Informational"
            symbol="PagedDataReader_ProcessInsertItems_Empty"
            message="$(string.Event.PagedDataReader_ProcessInsertItems_Empty)"
            keywords="UixPagedList"/>

          <event value="922"
            level="win:Informational"
            symbol="PagedDataReader_ProcessGetCount"
            message="$(string.Event.PagedDataReader_ProcessGetCount)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="923"
            level="win:Informational"
            symbol="PagedDataReader_ProcessGetItems"
            message="$(string.Event.PagedDataReader_ProcessGetItems)"
            template="Uint_Uint"
            keywords="UixPagedList"/>

          <event value="924"
            level="win:Informational"
            symbol="PagedDataReader_ProcessChangeNotifications"
            message="$(string.Event.PagedDataReader_ProcessChangeNotifications)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="925"
            level="win:Informational"
            symbol="PagedDataReader_ProcessChangeNotifications_InPage"
            message="$(string.Event.PagedDataReader_ProcessChangeNotifications_InPage)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="926"
            level="win:Informational"
            symbol="PagedDataReader_ProcessChangeNotifications_NotInPage"
            message="$(string.Event.PagedDataReader_ProcessChangeNotifications_NotInPage)"
            keywords="UixPagedList"/>

          <event value="927"
            level="win:Informational"
            symbol="PagedDataReader_ShutDown"
            message="$(string.Event.PagedDataReader_ShutDown)"
            keywords="UixPagedList"/>

          <event value="940"
            level="win:Informational"
            symbol="EnumeratingListProvider_State"
            message="$(string.Event.EnumeratingListProvider_State)"
            template="UnicodeString_Uint_Uint_Uint_Uint_Uint_Uint_Uint_Bool_Ptr"
            keywords="UixPagedList"/>

          <event value="941"
            level="win:Informational"
            symbol="EnumeratingListProvider_AsyncGetCount"
            message="$(string.Event.EnumeratingListProvider_AsyncGetCount)"
            keywords="UixPagedList"/>

          <event value="942"
            level="win:Informational"
            symbol="EnumeratingListProvider_OnItemInserted"
            message="$(string.Event.EnumeratingListProvider_OnItemInserted)"
            keywords="UixPagedList"/>

          <event value="943"
            level="win:Informational"
            symbol="EnumeratingListProvider_OnItemRemoved"
            message="$(string.Event.EnumeratingListProvider_OnItemRemoved)"
            keywords="UixPagedList"/>

          <event value="944"
            level="win:Informational"
            symbol="EnumeratingListProvider_OnItemChanged"
            message="$(string.Event.EnumeratingListProvider_OnItemChanged)"
            keywords="UixPagedList"/>

          <event value="945"
            level="win:Informational"
            symbol="EnumeratingListProvider_OnReset"
            message="$(string.Event.EnumeratingListProvider_OnReset)"
            keywords="UixPagedList"/>

          <event value="946"
            level="win:Informational"
            symbol="EnumeratingListProvider_GetUpdates_Reset"
            message="$(string.Event.EnumeratingListProvider_GetUpdates_Reset)"
            keywords="UixPagedList"/>

          <event value="947"
            level="win:Informational"
            symbol="EnumeratingListProvider_GetUpdates_Updates"
            message="$(string.Event.EnumeratingListProvider_GetUpdates_Updates)"
            keywords="UixPagedList"/>

          <event value="948"
            level="win:Informational"
            symbol="EnumeratingListProvider_AsyncGetItems"
            message="$(string.Event.EnumeratingListProvider_AsyncGetItems)"
            template="Uint_Uint"
            keywords="UixPagedList"/>

          <event value="949"
            level="win:Informational"
            symbol="EnumeratingListProvider_InvokeGetCount"
            message="$(string.Event.EnumeratingListProvider_InvokeGetCount)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="950"
            level="win:Informational"
            symbol="EnumeratingListProvider_TryBeginNextRead_BeginRead"
            message="$(string.Event.EnumeratingListProvider_TryBeginNextRead_BeginRead)"
            template="UnicodeString_Uint_Uint_Uint_Ptr"
            keywords="UixPagedList"/>

          <event value="951"
            level="win:Informational"
            symbol="EnumeratingListProvider_InvokeRead"
            message="$(string.Event.EnumeratingListProvider_InvokeRead)"
            template="Uint_Uint_UnicodeString_Uint_Uint"
            keywords="UixPagedList"/>

          <event value="952"
            level="win:Informational"
            symbol="EnumeratingListProvider_TryBeginNextRead_SplitRead"
            message="$(string.Event.EnumeratingListProvider_TryBeginNextRead_SplitRead)"
            template="Uint_Uint_Uint_Uint_Uint"
            keywords="UixPagedList"/>

          <event value="953"
            level="win:Informational"
            symbol="EnumeratingListProvider_ShutDown"
            message="$(string.Event.EnumeratingListProvider_ShutDown)"
            keywords="UixPagedList"/>

          <event value="970"
            level="win:Informational"
            symbol="UixPagedList_PageInfo"
            message="$(string.Event.UixPagedList_PageInfo)"
            template="UnicodeString_Int_Int_Int_Int"
            keywords="UixPagedList"/>

          <event value="971"
            level="win:Informational"
            symbol="UixPagedList_OnReset"
            message="$(string.Event.UixPagedList_OnReset)"
            keywords="UixPagedList"/>

          <event value="972"
            level="win:Informational"
            symbol="UixPagedList_VisualsReleased"
            message="$(string.Event.UixPagedList_VisualsReleased)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="973"
            level="win:Informational"
            symbol="UixPagedList_GetItem"
            message="$(string.Event.UixPagedList_GetItem)"
            template="Int"
            keywords="UixPagedList"/>

          <event value="974"
            level="win:Informational"
            symbol="UixPagedList_OnInsertBeforePage"
            message="$(string.Event.UixPagedList_OnInsertBeforePage)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="975"
            level="win:Informational"
            symbol="UixPagedList_OnInsertInPage"
            message="$(string.Event.UixPagedList_OnInsertInPage)"
            template="Uint_Uint"
            keywords="UixPagedList"/>

          <event value="976"
            level="win:Informational"
            symbol="UixPagedList_OnInsertAfterPage"
            message="$(string.Event.UixPagedList_OnInsertAfterPage)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="977"
            level="win:Informational"
            symbol="UixPagedList_OnRemoveBeforePage"
            message="$(string.Event.UixPagedList_OnRemoveBeforePage)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="978"
            level="win:Informational"
            symbol="UixPagedList_OnRemoveFromPage"
            message="$(string.Event.UixPagedList_OnRemoveFromPage)"
            template="Uint_Uint"
            keywords="UixPagedList"/>

          <event value="979"
            level="win:Informational"
            symbol="UixPagedList_OnRemoveAfterPage"
            message="$(string.Event.UixPagedList_OnRemoveAfterPage)"
            template="Uint"
            keywords="UixPagedList"/>

          <event value="980"
            level="win:Informational"
            symbol="UixPagedList_OnReplaceInPage"
            message="$(string.Event.UixPagedList_OnReplaceInPage)"
            template="Uint_Uint"
            keywords="UixPagedList"/>

          <event value="981"
            level="win:Informational"
            symbol="UixPagedList_TryAdjustPage_SetPageRange"
            message="$(string.Event.UixPagedList_TryAdjustPage_SetPageRange)"
            template="Uint_Uint_Uint"
            keywords="UixPagedList"/>

          <event value="982"
            level="win:Informational"
            symbol="UixPagedList_VisibleRangeChanged"
            message="$(string.Event.UixPagedList_VisibleRangeChanged)"
            template="Int_Int"
            keywords="UixPagedList"/>

          <event value="983"
            level="win:Informational"
            symbol="UixPagedList_ShutDown"
            message="$(string.Event.UixPagedList_ShutDown)"
            keywords="UixPagedList"/>

          <!-- Other Events -->

          <event value="1000"
            symbol="PROXIMITYSENSOR_CHANGING"
            level="win:Informational"
            keywords="Other"
            template="OneBool"
            message="$(string.Publisher.ProximitySensorChanging)"/>

        </events>

      </provider>

    </events>

  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <!--This is how event data can be used as part of Message String -->

        <string id="Keyword.Error"
            value="Error" />
        <string id="Keyword.Performance"
            value="Performance" />
        <string id="Keyword.Warning"
            value="Warning" />

        <string id="Event.CommsErrorOriginateMessage"
            value="Error: %1 Location: %2 Line Number: %3"/>
        <string id="Event.CommsPropagateErrorMessage"
            value="Error Propagated: %1 Location: %2 Line Number: %3"/>

        <!--New Event and Trace string definitions -->
        <string id="Publisher.CommsTraceEventMessage"
            value="%1[line %2]: %3.;%n"/>
        <string id="Publisher.CommsFailReturnEventMessage"
            value="Failing function %1 at line %2 with HR: %3"/>
        <string id="Publisher.CommsEventHRMessage"
            value="HRESULT(%3) in function %1 on line %2"/>
        <string id="Publisher.CommsScopeTraceEnterEventMessage"
            value="Enter function %1"/>
        <string id="Publisher.CommsScopeTraceExitEventMessage"
            value="Exit function %1"/>

        <string id="Event.StatusBarManager_AddedNewClientSubscription"
            value="Added new client subscription, %1"/>
        <string id="Event.StatusBarManager_CancelClientSubscription"
            value="Removed client subscription %1"/>
        <string id="Event.StatusBarManager_NotifyNewEvent"
            value="Notified new event %1 for client subscription %2"/>
        <string id="Event.StatusBarManager_NotifyNewDelayedEvent"
            value="Notified new delayed event %1 for client subscription %2"/>
        <string id="Event.StatusBarManager_NotifyExistingEvent"
            value="Notified existing event %1 for client subscription %2"/>
        <string id="Event.StatusBarManager_NotifyExistingDelayedEvent"
            value="Notified existing delayed event %1 for client subscription %2"/>
        <string id="Event.StatusBarManager_DismissEvent"
            value="Dismissed event %1 for client subscription %2"/>
        <string id="Event.StatusBarManager_SetFilterCookie"
            value="Set filter cookie on client subscription %1; event %2"/>
        <string id="Event.StatusBarManager_ClearFilterCookie"
            value="Cleared filter cookie on client subscription %1; event %2"/>
        <string id="Event.StatusBarManager_DelayEvent"
            value="Set delay of %1 ms on event %2"/>
        <string id="Event.StatusBarManager_ActivateDelayedEvent"
            value="Activated delayed event %1"/>
        <string id="Event.StatusBarManager_SetLagTime"
            value="Set lag time of %1 ms on event %2 for client subscription %3"/>
        <string id="Event.StatusBarManager_ExtendLagTime"
            value="Extended lag time of %1 ms on event %2 for client subscription %3"/>
        <string id="Event.StatusBarManager_ExtendElapsedLagTime"
            value="Lag time on event %1 elapsed for client subscription %2 but extended time was added"/>
        <string id="Event.StatusBarManager_LagTimeElapsed"
            value="Lag time on event %1 elapsed for client subscription %2"/>
        <string id="Event.StatusBarManager_IsStatusBarListeningReturned"
            value="StatusBarManager::IsStatusBarListening returned %1"/>
        <string id="Event.StatusBarManager_ActivateEventPackage_ShowNewEvent"
            value="StatusBarManager::_ActivateEventPackage showing new event %1 to replace %2 for client subscription %3"/>
        <string id="Event.StatusBarManager_ActivateEventPackage_IgnoreNewEvent"
            value="StatusBarManager::_ActivateEventPackage ignoring new event %1 since %2 has higher priority for client subscription %3"/>
        <string id="Event.StatusBarManager_UpdateStatusBar_IgnoreClearText_StatusBarLocked"
            value="StatusBarManager::_UpdateStatusBar not clearing status bar text because event %1 of client subscription %2 has the status bar locked"/>
        <string id="Event.StatusBarManager_UpdateStatusBar_IgnoreClearText_NoEventShown"
            value="StatusBarManager::_UpdateStatusBar not clearing status bar text for event %1 of client subscription %2 because no event is currentling being shown"/>

        <string id="Event.ProgressIndicatorVM_QueueStatusEvent"
            value="ProgressIndicatorVM: Queuing StatusEvent for task id %1 to be processed on the UI thread. Total queued: %2"/>
        <string id="Event.ProgressIndicatorVM_DisplayStatusEvent_Hide"
            value="ProgressIndicatorVM: Hide Progress Indicator for task id %1"/>
        <string id="Event.ProgressIndicatorVM_DisplayStatusEvent_SetText"
            value="ProgressIndicatorVM: Set text [%1] on Progress Indicator for task id %2"/>
        <string id="Event.ProgressIndicatorVM_DisplayStatusEvent_SetProgress"
            value="ProgressIndicatorVM: Set progress %1/%2 on Progress Indicator for task id %3"/>
        <string id="Event.ProgressIndicatorVM_DisplayStatusEvent_SetMarquee"
            value="ProgressIndicatorVM: Set Progress Indicator to indetermine for task id %1"/>
        <string id="Event.ProgressIndicatorVM_DisplayStatusEvent_TaskIdInvalid"
            value="ProgressIndicatorVM: Task id %1 is no longer valid; dropping request. This is likely because the task has already been closed"/>

        <!-- Strings for UIX Paged List Events -->
        <string id="Event.PagedDataReader_SetPageRange"
            value="PDR.SetPageRange(%1,%2)"/>
        <string id="Event.PagedDataReader_SetPageRange_RemoveFromStart"
            value="PDR.SetPageRange:RemoveFromStart(%1)"/>
        <string id="Event.PagedDataReader_SetPageRange_RemoveFromEnd"
            value="PDR.SetPageRange:RemoveFromEnd(%1)"/>
        <string id="Event.PagedDataReader_SetPageRange_AddToStart"
            value="PDR.SetPageRange:AddToStart(%1)"/>
        <string id="Event.PagedDataReader_SetPageRange_AddToEnd"
            value="PDR.SetPageRange:AddToEnd(%1)"/>
        <string id="Event.PagedDataReader_SetPageRange_ChangeStart"
            value="PDR.SetPageRange:ChangeStart(%1 to %2)"/>
        <string id="Event.PagedDataReader_SetPageRange_OnPageChanged"
            value="PDR.SetPageRange:OnPageChanged()"/>
        <string id="Event.PagedDataReader_ProcessWork"
            value="PDR.ProcessWork(CountUpdates=%1)"/>
        <string id="Event.PagedDataReader_ProcessRemoveAtIndex"
            value="PDR.ProcessRemoveAtIndex(%1-%2)"/>
        <string id="Event.PagedDataReader_ProcessRemoveItems"
            value="PDR.ProcessRemoveItems(%1)"/>
        <string id="Event.PagedDataReader_ProcessRemoveItems_InPage"
            value="PDR.ProcessRemoveItems:InPage(PageIndex=%1)"/>
        <string id="Event.PagedDataReader_ProcessRemoveItems_BeforePage"
            value="PDR.ProcessRemoveItems:BeforePage(CountRemoved=%1)"/>
        <string id="Event.PagedDataReader_ProcessRemoveItems_AfterPage"
            value="PDR.ProcessRemoveItems:AfterPage(CountRemoved=%1)"/>
        <string id="Event.PagedDataReader_ProcessInsertAtIndex"
            value="PDR.ProcessInsertAtIndex(Start=%1,Count=%2)"/>
        <string id="Event.PagedDataReader_ProcessReset"
            value="PDR.ProcessReset()"/>
        <string id="Event.PagedDataReader_ProcessInsertItems"
            value="PDR.ProcessInsertItems(CountItems=%1)"/>
        <string id="Event.PagedDataReader_ProcessInsertItems_AlreadyInPage"
            value="PDR.ProcessInsertItems:AlreadyInPage(PageIndex=%1)"/>
        <string id="Event.PagedDataReader_ProcessInsertItems_BeforePage"
            value="PDR.ProcessInsertItems:BeforePage"/>
        <string id="Event.PagedDataReader_ProcessInsertItems_AfterPage"
            value="PDR.ProcessInsertItems:AfterPage"/>
        <string id="Event.PagedDataReader_ProcessInsertItems_InPage"
            value="PDR.ProcessInsertItems:InPage(PageIndex=%1,ListIndex=%2)"/>
        <string id="Event.PagedDataReader_ProcessInsertItems_Empty"
            value="PDR.ProcessInsertItems:Empty"/>
        <string id="Event.PagedDataReader_ProcessGetCount"
            value="PDR.ProcessGetCount(%1)"/>
        <string id="Event.PagedDataReader_ProcessGetItems"
            value="PDR.ProcessGetItems(%1-%2)"/>
        <string id="Event.PagedDataReader_PageInfo"
            value="PDR.Page.%1: Range=%2-%3(%4) ListItemCount=%5"/>
        <string id="Event.PagedDataReader_PageItem"
            value="PDR.Item %1 = %2 %3"/>
        <string id="Event.PagedDataReader_PageItemNull"
            value="PDR.Item %1 = NULL"/>
        <string id="Event.PagedDataReader_ProcessChangeNotifications"
            value="PDR.ProcessChangeNotifications(%1)"/>
        <string id="Event.PagedDataReader_ProcessChangeNotifications_InPage"
            value="PDR.ProcessChangeNotifications:InPage(PageIndex=%1)"/>
        <string id="Event.PagedDataReader_ProcessChangeNotifications_NotInPage"
            value="PDR.ProcessChangeNotifications:NotInPage"/>
        <string id="Event.PagedDataReader_ShutDown"
            value="PDR.ShutDown()"/>
        
        <string id="Event.EnumeratingListProvider_State"
            value="ELP.State.%1 Count=%2 DbPosition=%3 ReadRequests=%4 Inserted=%5 Removed=%6 ChangeNotification=%7 IndexNotifications=%8 ResetPending=%9 countRequest=%10"/>
        <string id="Event.EnumeratingListProvider_AsyncGetCount"
            value="ELP.AsyncGetCount()"/>
        <string id="Event.EnumeratingListProvider_OnItemInserted"
            value="ELP.OnItemInserted()"/>
        <string id="Event.EnumeratingListProvider_OnItemRemoved"
            value="ELP.OnItemRemoved()"/>
        <string id="Event.EnumeratingListProvider_OnItemChanged"
            value="ELP.OnItemChanged()"/>
        <string id="Event.EnumeratingListProvider_OnReset"
            value="ELP.OnReset()"/>
        <string id="Event.EnumeratingListProvider_GetUpdates_Reset"
            value="ELP.GetUpdates() : Reset"/>
        <string id="Event.EnumeratingListProvider_GetUpdates_Updates"
            value="ELP.GetUpdates() : Updates"/>
        <string id="Event.EnumeratingListProvider_AsyncGetItems"
            value="ELP.AsyncGetItems(%1,%2)"/>
        <string id="Event.EnumeratingListProvider_InvokeGetCount"
            value="ELP.InvokeGetCount(%1)"/>
        <string id="Event.EnumeratingListProvider_TryBeginNextRead_BeginRead"
            value="ELP._TryBeginNextRead:BeginRead(%1,%2) Count=%3 DbPosition=%4 ReadContext=%5"/>
        <string id="Event.EnumeratingListProvider_InvokeRead"
            value="ELP.InvokeRead() StartIndex=%1 EndIndex=%2 Direction=%3 CountRequested=%4 CountRead=%5"/>
        <string id="Event.EnumeratingListProvider_TryBeginNextRead_SplitRead"
            value="ELP._TryBeginNextRead:SplitRead OriginalRange=%1-%2 Position=%3 ResultRange=%4,%5"/>
        <string id="Event.EnumeratingListProvider_ShutDown"
            value="ELP.ShutDown()"/>
        
        <string id="Event.UixPagedList_PageInfo"
            value="UPL.PageInfo.%1 ListCount=%2 LastItem=%3 UIX=%4-%5"/>
        <string id="Event.UixPagedList_OnReset"
            value="UPL.OnReset()"/>
        <string id="Event.UixPagedList_VisualsReleased"
            value="UPL.VisualsReleased(%1)"/>
        <string id="Event.UixPagedList_GetItem"
            value="UPL.GetItem(%1)"/>
        <string id="Event.UixPagedList_OnInsertBeforePage"
            value="UPL.OnInsertBeforePage(%1)"/>
        <string id="Event.UixPagedList_OnInsertInPage"
            value="UPL.OnInsertInPage(%1,%2)"/>
        <string id="Event.UixPagedList_OnInsertAfterPage"
            value="UPL.OnInsertAfterPage(%1)"/>
        <string id="Event.UixPagedList_OnRemoveBeforePage"
            value="UPL.OnRemoveBeforePage(%1)"/>
        <string id="Event.UixPagedList_OnRemoveFromPage"
            value="UPL.OnRemoveFromPage(%1,%2)"/>
        <string id="Event.UixPagedList_OnRemoveAfterPage"
            value="UPL.OnRemoveAfterPage(%1)"/>
        <string id="Event.UixPagedList_OnReplaceInPage"
            value="UPL.OnReplaceInPage(%1,%2)"/>
        <string id="Event.UixPagedList_TryAdjustPage_SetPageRange"
            value="UPL._TryAdjustPage(%1):SetPageRange(%2,%3)"/>
        <string id="Event.UixPagedList_VisibleRangeChanged"
            value="UPL.VisibleRangeChanged(%1,%2)"/>
        <string id="Event.UixPagedList_ShutDown"
            value="UPL.ShutDown()"/>
        
        <string id="Publisher.ProximitySensorChanging"
            value="[ProximitySensorManager] State changing to: %1"/>

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
