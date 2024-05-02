<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<!-- <?xml version="1.0" encoding="UTF-16"?> -->
<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>
    <events>
      <provider name="Microsoft-WindowsPhone-Comms-ContactsOM"
          guid="{8904379F-FBA2-4f71-B3E1-4154AD0824F4}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_CONTACTSOM"
          messageFileName="ContactsOM.dll"
          resourceFileName="ContactsOM.dll">

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />

          <!-- Provider-specific keywords -->
          <keyword mask="0x0000000000000008" name="Debug" message="$(string.Keyword.Debug)" />
          <keyword mask="0x0000000000000010" name="List" message="$(string.Keyword.List)" />
          <keyword mask="0x0000000000000020" name="History" message="$(string.Keyword.History)" />
          <keyword mask="0x0000000000000040" name="SCM" message="$(string.Keyword.SCM)" />
          <keyword mask="0x0000000000000080" name="Rooms" message="$(string.Keyword.Rooms)" />

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning" message="$(string.Keyword.Warning)"/>
        </keywords>
        
        
        <!--Event Templates -->
        <templates>

          <!--Event Template defined for Comms Logging -->
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

          <template tid="tTraceMessage">
            <data inType="win:Pointer" name="Message" /> 
          </template>

          <template tid="Int">
            <data name="P1_Int32" inType="win:Int32" />
          </template>

          <template tid="String">
            <data name="P1_UnicodeString" inType="win:UnicodeString" />
          </template>

          <template tid="IntInt">
            <data name="P1_Int32" inType="win:Int32" />
            <data name="P2_Int32" inType="win:Int32" />
          </template>

          <template tid="IntString">
            <data name="P1_Int32" inType="win:Int32" />
            <data name="P2_UnicodeString" inType="win:UnicodeString" />
          </template>

          <template tid="IntIntInt">
            <data name="P1_Int32" inType="win:Int32" />
            <data name="P2_Int32" inType="win:Int32" />
            <data name="P3_Int32" inType="win:Int32" />
          </template>

          <template tid="IntIntIntInt">
            <data name="P1_Int32" inType="win:Int32" />
            <data name="P2_Int32" inType="win:Int32" />
            <data name="P3_Int32" inType="win:Int32" />
            <data name="P4_Int32" inType="win:Int32" />
          </template>

          <template tid="Hex">
            <data name="P1_HexInt32" inType="win:HexInt32" />
          </template>

          <template tid="HexHex">
            <data name="P1_HexInt32" inType="win:HexInt32" />
            <data name="P2_HexInt32" inType="win:HexInt32" />
          </template>

          <template tid="HexInt">
            <data name="P1_HexInt32" inType="win:HexInt32" />
            <data name="P2_Int32" inType="win:Int32" />
          </template>
          
          <template tid="BoolBoolBool">
            <data name="P1_Boolean" inType="win:Boolean" />
            <data name="P2_Boolean" inType="win:Boolean" />
            <data name="P3_Boolean" inType="win:Boolean" />
          </template>

          <template tid="StringUIntHex">
            <data name="P1_UnicodeString" inType="win:UnicodeString" />
            <data name="P2_UInt" inType="win:UInt32" />
            <data name="P3_Int" inType="win:HexInt32" />
          </template>

          <template tid="Pointer">
            <data name="P1_Pointer" inType="win:Pointer" />
          </template>
        </templates>

        <tasks>

          <!-- Begin ContactsList Specific Tasks -->
          <task name="TRACEMESSAGE"                             value="100"/>
          <task name="CFS_CREATEINSTANCE"                       value="101"/>
          <task name="CFS_GETITEM"                              value="102"/>
          <task name="CFS_POPULATEGROUPINFO"                    value="103"/>
          <task name="CFS_PREPARE_NEXT_MATCH"                   value="104"/>
          <task name="CFS_ONEVENT"                              value="105"/>
          <task name="CFS_BACKGROUNDWORK"                       value="106"/>
          <task name="CFS_INVOKE_CLIENTLIST_RESET"              value="107"/>
          <task name="CONTACTS_OM_DEBUG"                        value="108"/>
          
          <task name="GFS_CREATEINSTANCE"                       value="150"/>
          <task name="GFS_BACKGROUNDWORK_UNIT"                  value="151"/>
          <task name="GFS_ONEVENT"                              value="152"/>
          <task name="GFS_INVOKE_CLIENTLIST_RESET"              value="153"/>
          <task name="GFS_INVOKE_CLIENTLIST_EVENT_NO_CALLBACK"  value="154"/>
          
          <task name="AUTOSUGGEST_CONTACTS_GETSUGGESTIONS"      value="201"/>
          <task name="AUTOSUGGEST_GROUPS_GETSUGGESTIONS"        value="202"/>
          
          <task name="LINKSUGGEST_POPULATESUGGESTIONS"          value="250"/>

          <task name="MEMBERSUGGEST_BACKGROUNDWORK"             value="300"/>

          <task name="CLI_CREATEINSTANCE"                       value="350"/>
          <task name="CLI_CACHEPROPERTIESINITEM"                value="351"/>
          <!-- End ContactsList Specific Tasks -->
        
          <!-- Begin History Specific Tasks -->
          <task name="HISTORY"                                  value="375"/>
          <task name="VVM_PROVIDER"                             value="376"/>
          <!-- End History Specific Tasks -->
          
          <task name="ROOMS"                                    value="400"/>
          <task name="ROOM_NOTE_GETUNSEENCOUNT"                 value="401"/>
        
        </tasks>
        
        <events>
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

          <!-- Debug events -->  
          <event value="10" level="win:Verbose" keywords="Debug" opcode="win:Info" task="TRACEMESSAGE" symbol="_ETWMESSAGE" template="tTraceMessage" />
          <event value="11" level="win:Informational" keywords="Debug" opcode="win:Info" task="CONTACTS_OM_DEBUG" symbol="Link_SuggestionSupplierInit" template="Pointer" message="$(string.Publisher.Link_SuggestionSupplierInit)"/>
          <event value="12" level="win:Informational" keywords="Debug" opcode="win:Info" task="CONTACTS_OM_DEBUG" symbol="Link_ShutDownSuggestionSupplier" template="Pointer" message="$(string.Publisher.Link_ShutDownSuggestionSupplier)"/>

          <!-- Begin SCM Specific Events -->
          <event value="100" level="win:Informational" keywords="SCM" symbol="SCM_READALLCONTACTS" message="$(string.Publisher.SCMReadAllContacts)"/>
          <event value="102" level="win:Informational" keywords="SCM" symbol="SCM_REFRESHSNAPSHOTCANCELLED" message="$(string.Publisher.SCMRefreshSnapshotCancelled)"/>
          <event value="103" level="win:Informational" keywords="SCM" symbol="SCM_IMPORTDONE" template="Hex" message="$(string.Publisher.SCMImportDone)"/>
          <event value="104" level="win:Informational" keywords="SCM" symbol="SCM_EXPORTDONE" template="Hex" message="$(string.Publisher.SCMExportDone)"/>
          <event value="105" level="win:Informational" keywords="SCM" symbol="SCM_READALLCONTACTSCANCELLED" message="$(string.Publisher.SCMReadAllContactsCancelled)"/>
          <event value="106" level="win:Informational" keywords="SCM" symbol="SCM_READCONTACTFAILED" template="HexInt" message="$(string.Publisher.SCMReadContactFailed)"/>
          <event value="107" level="win:Informational" keywords="SCM" symbol="SCM_EXPORTINGCONTACT" template="Int" message="$(string.Publisher.SCMExportingContact)"/>
          
          <!-- End SCM Specific Events -->

          <!-- Begin ContactsList Specific Events -->
          <event value="200" level="win:Verbose" keywords="Performance" opcode="win:Start" task="CFS_CREATEINSTANCE" symbol="CFS_CREATEINSTANCE_START"/>
          <event value="201" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="CFS_CREATEINSTANCE" symbol="CFS_CREATEINSTANCE_STOP"/>
          <event value="202" level="win:Verbose" keywords="Performance" opcode="win:Start" task="CFS_GETITEM" symbol="CFS_GETITEM_START" template="Int"/>
          <event value="203" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="CFS_GETITEM" symbol="CFS_GETITEM_STOP" template="Int"/>
          <event value="204" level="win:Verbose" keywords="Performance" opcode="win:Start" task="CFS_POPULATEGROUPINFO" symbol="CFS_POPULATEGROUPINFO_START"/>
          <event value="205" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="CFS_POPULATEGROUPINFO" symbol="CFS_POPULATEGROUPINFO_STOP"/>
          <event value="206" level="win:Verbose" keywords="Performance" opcode="win:Start" task="CFS_PREPARE_NEXT_MATCH" symbol="CFS_PREPARE_NEXT_MATCH_START"/>
          <event value="207" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="CFS_PREPARE_NEXT_MATCH" symbol="CFS_PREPARE_NEXT_MATCH_STOP" template="HexInt" message="$(string.Publisher.CFSPrepareNextMatchStop)"/>
          <event value="208" level="win:Informational" keywords="List" opcode="win:Info" task="CFS_ONEVENT" symbol="CFS_ONEVENT" template="HexInt" message="$(string.Publisher.CFSOnEvent)"/>
          <event value="209" level="win:Informational" keywords="List" opcode="win:Start" task="CFS_BACKGROUNDWORK" symbol="CFS_BACKGROUNDWORK_START" template="BoolBoolBool" message="$(string.Publisher.CFSBeginWork)"/>
          <event value="210" level="win:Informational" keywords="List" opcode="win:Stop" task="CFS_BACKGROUNDWORK" symbol="CFS_BACKGROUNDWORK_STOP"/>
          <event value="211" level="win:Informational" keywords="List" opcode="win:Info" task="CFS_INVOKE_CLIENTLIST_RESET" symbol="CFS_INVOKE_CLIENTLIST_RESET"/>

          <event value="250" level="win:Verbose" keywords="Performance" opcode="win:Start" task="GFS_CREATEINSTANCE" symbol="GFS_CREATEINSTANCE_START"/>
          <event value="251" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="GFS_CREATEINSTANCE" symbol="GFS_CREATEINSTANCE_STOP"/>
          <event value="252" level="win:Verbose" keywords="Performance" opcode="win:Start" task="GFS_BACKGROUNDWORK_UNIT" symbol="GFS_BACKGROUNDWORK_UNIT_START"/>
          <event value="253" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="GFS_BACKGROUNDWORK_UNIT" symbol="GFS_BACKGROUNDWORK_UNIT_STOP"/>
          <event value="254" level="win:Informational" keywords="List" opcode="win:Info" task="GFS_ONEVENT" symbol="GFS_ONEVENT" template="HexInt" message="$(string.Publisher.GFSOnEvent)"/>
          <event value="255" level="win:Informational" keywords="List" opcode="win:Info" task="GFS_INVOKE_CLIENTLIST_RESET" symbol="GFS_INVOKE_CLIENTLIST_RESET"/>
          <event value="256" level="win:Informational" keywords="List" opcode="win:Info" task="GFS_INVOKE_CLIENTLIST_EVENT_NO_CALLBACK" symbol="GFS_INVOKE_CLIENTLIST_EVENT_NO_CALLBACK" message="$(string.Publisher.GFSEventNoCallback)"/>
        
          <event value="300" level="win:Verbose" keywords="Performance" opcode="win:Start" task="AUTOSUGGEST_CONTACTS_GETSUGGESTIONS" symbol="AUTOSUGGEST_CONTACTS_GETSUGGESTIONS_START" template="StringUIntHex" message="$(string.Publisher.AutoSuggestGetSuggestions)"/>
          <event value="301" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="AUTOSUGGEST_CONTACTS_GETSUGGESTIONS" symbol="AUTOSUGGEST_CONTACTS_GETSUGGESTIONS_STOP" template="StringUIntHex" message="$(string.Publisher.AutoSuggestGetSuggestions)"/>
          <event value="302" level="win:Verbose" keywords="Performance" opcode="win:Start" task="AUTOSUGGEST_GROUPS_GETSUGGESTIONS" symbol="AUTOSUGGEST_GROUPS_GETSUGGESTIONS_START" template="StringUIntHex" message="$(string.Publisher.AutoSuggestGetSuggestions)"/>
          <event value="303" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="AUTOSUGGEST_GROUPS_GETSUGGESTIONS" symbol="AUTOSUGGEST_GROUPS_GETSUGGESTIONS_STOP" template="StringUIntHex" message="$(string.Publisher.AutoSuggestGetSuggestions)"/>
          
          <event value="350" level="win:Verbose" keywords="Performance" opcode="win:Start" task="LINKSUGGEST_POPULATESUGGESTIONS" symbol="LINKSUGGEST_POPULATESUGGESTIONS_START"/>
          <event value="351" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="LINKSUGGEST_POPULATESUGGESTIONS" symbol="LINKSUGGEST_POPULATESUGGESTIONS_STOP"/>
        
          <event value="400" level="win:Verbose" keywords="Performance" opcode="win:Start" task="MEMBERSUGGEST_BACKGROUNDWORK" symbol="MEMBERSUGGEST_BACKGROUNDWORK_START"/>
          <event value="401" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="MEMBERSUGGEST_BACKGROUNDWORK" symbol="MEMBERSUGGEST_BACKGROUNDWORK_STOP"/>

          <event value="450" level="win:Verbose" keywords="Performance" opcode="win:Start" task="CLI_CREATEINSTANCE" symbol="CLI_CREATEINSTANCE_START"/>
          <event value="451" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="CLI_CREATEINSTANCE" symbol="CLI_CREATEINSTANCE_STOP"/>
          <event value="452" level="win:Verbose" keywords="Performance" opcode="win:Start" task="CLI_CACHEPROPERTIESINITEM" symbol="CLI_CACHEPROPERTIESINITEM_START"/>
          <event value="453" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="CLI_CACHEPROPERTIESINITEM" symbol="CLI_CACHEPROPERTIESINITEM_STOP"/>
          <!-- End ContactsList Specific Events -->
        
          <!-- Begin Supplier Specific Events -->
          <event value="500" level="win:Informational" keywords="Performance" opcode="win:Start" task="VVM_PROVIDER" symbol="VVM_ENUMERATECOLLECTION_START" message="$(string.Publisher.VVM_StartEnumeration)"/>
          <event value="501" level="win:Informational" keywords="Performance" opcode="win:Stop" task="VVM_PROVIDER" symbol="VVM_ENUMERATECOLLECTION_STOP" message="$(string.Publisher.VVM_EndEnumeration)"/>
          <event value="502" level="win:Informational" keywords="Performance" opcode="win:Start" task="VVM_PROVIDER" symbol="VVM_ENUMERATEPHONENUMBERS_START" template="String" message="$(string.Publisher.VVM_StartEnumeratePhonenumbers)"/>
          <event value="503" level="win:Informational" keywords="Performance" opcode="win:Stop" task="VVM_PROVIDER" symbol="VVM_ENUMERATEPHONENUMBERS_STOP" template="String" message="$(string.Publisher.VVM_EndEnumeratePhonenumbers)"/>
          <event value="504" level="win:Informational" keywords="Performance" opcode="win:Info" task="VVM_PROVIDER" symbol="VVM_StartInspectSingleItem" message="$(string.Publisher.VVM_StartInspectSingleItem)"/>
          <event value="505" level="win:Informational" keywords="Performance" opcode="win:Info" task="VVM_PROVIDER" symbol="VVM_EndInspectSingleItem" template="String" message="$(string.Publisher.VVM_EndInspectSingleItem)"/>
          <event value="506" level="win:Informational" keywords="Performance" opcode="win:Start" task="VVM_PROVIDER" symbol="VVMMERGEDCOLLECTION_INITIALIZE_START" message="$(string.Publisher.VVMMERGEDCOLLECTION_INITIALIZE)"/>
          <event value="507" level="win:Informational" keywords="Performance" opcode="win:Stop" task="VVM_PROVIDER" symbol="VVMMERGEDCOLLECTION_INITIALIZE_STOP" message="$(string.Publisher.VVMMERGEDCOLLECTION_INITIALIZE)"/>
          <event value="508" level="win:Informational" keywords="Performance" opcode="win:Start" task="VVM_PROVIDER" symbol="VVMDATACOLLECTION_INITIALIZE_START" message="$(string.Publisher.VVMDATACOLLECTION_INITIALIZE)"/>
          <event value="509" level="win:Informational" keywords="Performance" opcode="win:Stop" task="VVM_PROVIDER" symbol="VVMDATACOLLECTION_INITIALIZE_STOP" message="$(string.Publisher.VVMDATACOLLECTION_INITIALIZE)"/>
          <event value="510" level="win:Informational" keywords="Performance" opcode="win:Start" task="VVM_PROVIDER" symbol="VVMDATACOLLECTION_RESET_START" message="$(string.Publisher.VVMDATACOLLECTION_RESET)"/>
          <event value="511" level="win:Informational" keywords="Performance" opcode="win:Stop" task="VVM_PROVIDER" symbol="VVMDATACOLLECTION_RESET_STOP" message="$(string.Publisher.VVMDATACOLLECTION_RESET)"/>
          <!-- End Supplier Specific Events -->

          <!-- Begin Room Specific Events -->
          <event value="600" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomChat_StartTracking" template="Int" message="$(string.Publisher.RoomChat_StartTracking)"/>
          <event value="601" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomChat_StopTracking" template="Int" message="$(string.Publisher.RoomChat_StopTracking)"/>
          <event value="602" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomChat_GetUnseenCount" template="IntIntInt" message="$(string.Publisher.RoomChat_GetUnseenCount)"/>
          <event value="603" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomChat_ClearUnseenCount" template="Int" message="$(string.Publisher.RoomChat_ClearUnseenCount)"/>
          <event value="604" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomChat_NotifyAllTrackedRooms" template="Int" message="$(string.Publisher.RoomChat_NotifyAllTrackedRooms)"/>
          <event value="605" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomChat_NotifyCallback_MessageModified" message="$(string.Publisher.RoomChat_NotifyCallback_MessageModified)"/>
          <event value="606" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomChat_NotifyCallback_ConversationModified" message="$(string.Publisher.RoomChat_NotifyCallback_ConversationModified)"/>
          <event value="607" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomChat_OnContentChangeNotification" template="Int" message="$(string.Publisher.RoomChat_OnContentChangeNotification)"/>
          <event value="608" level="win:Informational" keywords="Rooms" opcode="win:Start" task="ROOMS" symbol="RoomChat_GetUnseenCountForConversation_START" message="$(string.Publisher.RoomChat_GetUnseenCountForConversation)"/>
          <event value="609" level="win:Informational" keywords="Rooms" opcode="win:Stop" task="ROOMS" symbol="RoomChat_GetUnseenCountForConversation_STOP" message="$(string.Publisher.RoomChat_GetUnseenCountForConversation)"/>
          <event value="610" level="win:Informational" keywords="Rooms" opcode="win:Start" task="ROOMS" symbol="RoomChat_ClearUnseenCountForConversation_START" message="$(string.Publisher.RoomChat_ClearUnseenCountForConversation)"/>
          <event value="611" level="win:Informational" keywords="Rooms" opcode="win:Stop" task="ROOMS" symbol="RoomChat_ClearUnseenCountForConversation_STOP" message="$(string.Publisher.RoomChat_ClearUnseenCountForConversation)"/>
          <event value="612" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomMembers_StartTracking" template="Int" message="$(string.Publisher.RoomMembers_StartTracking)"/>
          <event value="613" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomMembers_StopTracking" template="Int" message="$(string.Publisher.RoomMembers_StopTracking)"/>
          <event value="614" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomMembers_GetUnseenCount" template="IntIntInt" message="$(string.Publisher.RoomMembers_GetUnseenCount)"/>
          <event value="615" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomMembers_ClearUnseenCount" template="Int" message="$(string.Publisher.RoomMembers_ClearUnseenCount)"/>
          <event value="616" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomMembers_GetTopUnseenContentAsString" template="Int" message="$(string.Publisher.RoomMembers_GetTopUnseenContentAsString)"/>
          <event value="617" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomMembers_OnContentChangeNotification" template="Int" message="$(string.Publisher.RoomMembers_OnContentChangeNotification)"/>
          <event value="618" level="win:Informational" keywords="Rooms" opcode="win:Start" task="ROOMS" symbol="RoomMembers_CalculateMembershipChanges_START" message="$(string.Publisher.RoomMembers_CalculateMembershipChanges)"/>
          <event value="619" level="win:Informational" keywords="Rooms" opcode="win:Stop" task="ROOMS" symbol="RoomMembers_CalculateMembershipChanges_STOP" message="$(string.Publisher.RoomMembers_CalculateMembershipChanges)"/>
          <event value="620" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_StartTracking" template="Int" message="$(string.Publisher.RoomPhotos_StartTracking)"/>
          <event value="621" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_StopTracking" template="Int" message="$(string.Publisher.RoomPhotos_StopTracking)"/>
          <event value="622" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_SyncContent_ClearingState" template="IntIntInt" message="$(string.Publisher.RoomPhotos_SyncContent_ClearingState)"/>
          <event value="623" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_GetUnseenCount" template="IntIntInt" message="$(string.Publisher.RoomPhotos_GetUnseenCount)"/>
          <event value="624" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_ClearUnseenCount" template="Int" message="$(string.Publisher.RoomPhotos_ClearUnseenCount)"/>
          <event value="625" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_OnContentChangeNotification" template="Int" message="$(string.Publisher.RoomPhotos_OnContentChangeNotification)"/>
          <event value="626" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_SyncWasInProgress_Stopping" message="$(string.Publisher.RoomPhotos_SyncWasInProgress_Stopping)"/>
          <event value="627" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_SyncCompletedForAllRooms" message="$(string.Publisher.RoomPhotos_SyncCompletedForAllRooms)"/>
          <event value="628" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_ChangesInUnseenPhotos" template="IntIntInt" message="$(string.Publisher.RoomPhotos_ChangesInUnseenPhotos)"/>
          <event value="629" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_ProcessingNextRoom" template="Int" message="$(string.Publisher.RoomPhotos_ProcessingNextRoom)"/>
          <event value="630" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_RefreshingAlbumForRoom" template="Int" message="$(string.Publisher.RoomPhotos_RefreshingAlbumForRoom)"/>
          <event value="631" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_RefreshingAlbumForRoom_Completed" message="$(string.Publisher.RoomPhotos_RefreshingAlbumForRoom_Completed)"/>
          <event value="632" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_LocalCacheReady_UpdatingMetadata" template="Int" message="$(string.Publisher.RoomPhotos_LocalCacheReady_UpdatingMetadata)"/>
          <event value="633" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_UpdatingUnseenPhotos" template="IntInt" message="$(string.Publisher.RoomPhotos_UpdatingUnseenPhotos)"/>
          <event value="634" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomPhotos_AlbumPhotoCount" template="Int" message="$(string.Publisher.RoomPhotos_AlbumPhotoCount)"/>
          <event value="635" level="win:Verbose" keywords="Performance" opcode="win:Start" task="ROOM_NOTE_GETUNSEENCOUNT" symbol="ROOM_NOTE_GETUNSEENCOUNT_START"/>
          <event value="636" level="win:Verbose" keywords="Performance" opcode="win:Stop" task="ROOM_NOTE_GETUNSEENCOUNT" symbol="ROOM_NOTE_GETUNSEENCOUNT_STOP"/>
          <event value="637" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomNote_StartTracking" template="Int" message="$(string.Publisher.RoomNote_StartTracking)"/>
          <event value="638" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomNote_StopTracking" template="Int" message="$(string.Publisher.RoomNote_StopTracking)"/>
          <event value="639" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomNote_GetUnseenCount" template="IntIntInt" message="$(string.Publisher.RoomNote_GetUnseenCount)"/>
          <event value="640" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomNote_ClearUnseenCount" template="Int" message="$(string.Publisher.RoomNote_ClearUnseenCount)"/>
          <event value="641" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomMembers_CalculateMembershipChangesInfo" template="IntIntIntInt" message="$(string.Publisher.RoomMembers_CalculateMembershipChangesInfo)"/>
          <event value="642" level="win:Informational" keywords="Rooms" opcode="win:Info" task="ROOMS" symbol="RoomMembers_NoChangeInEtag" template="String" message="$(string.Publisher.RoomMembers_NoChangeInEtag)"/>

          <!-- End Room Specific Events -->

        <!-- Begin History Specific Events -->
        <event value="800" level="win:Informational" keywords="History" opcode="win:Info" task="HISTORY" symbol="CallHistoryChannel_OnCallEvent" template="String" message="$(string.Publisher.OnCallEvent)"/>
        <event value="801" level="win:Informational" keywords="History" opcode="win:Info" task="HISTORY" symbol="CallHistoryChannel_MatchingAggregateNotFound" template="String" message="$(string.Publisher.MatchingAggregateNotFound)"/>
        
        <!-- End History Specific Events -->

        </events>

      </provider>

    </events>

  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>

        <!-- strings for keywords -->
        <string id="Keyword.Error"                               value="Error" />
        <string id="Keyword.Performance"                         value="Performance" />
        <string id="Keyword.Debug"                               value="Debug" />
        <string id="Keyword.SCM"                                 value="SCM" />
        <string id="Keyword.List"                                value="List" />
        <string id="Keyword.History"                             value="History" />
        <string id="Keyword.Rooms"                               value="Rooms" />
        <string id="Keyword.Warning"                             value="Warning" />

        <string id="Event.CommsErrorOriginateMessage"            value="Error: %1 Location: %2 Line Number: %3"/>    
        <string id="Event.CommsPropagateErrorMessage"            value="Error Propagated: %1 Location: %2 Line Number: %3"/>

        <string id="Publisher.SCMReadAllContacts"                value="Reading all contacts from SIM store"/>
        <string id="Publisher.SCMRefreshSnapshotCancelled"       value="_RefreshGroupSnapshot was cancelled by the user."/>
        <string id="Publisher.SCMImportDone"                     value="ScmCopyHelper::ImportContacts returned %1"/>
        <string id="Publisher.SCMExportDone"                     value="ScmCopyHelper::ExportContacts returned %1"/>
        <string id="Publisher.SCMReadAllContactsCancelled"       value="ReadAllContacts was cancelled by the user."/>
        <string id="Publisher.SCMReadContactFailed"              value="Failed to read contact at index %2. hr: %1"/>
        <string id="Publisher.SCMExportingContact"               value="Exporting contact at index %1"/>
        <string id="Publisher.CFSPrepareNextMatchStop"           value="CFS:PrepareNextMatch prepared %2 matches, returned hr %1"/>
        <string id="Publisher.CFSOnEvent"                        value="CFS:Received a notification dwFlags %1 ; cEvents %2"/>
        <string id="Publisher.CFSBeginWork"                      value="CFS:Begin background work; DynamicFilterIsChanging=%1 StaticFilterIsChanging=%2 ResetIndexedFilter=%3"/>
        <string id="Publisher.GFSOnEvent"                        value="GFS:Received a notification dwFlags %1 ; cEvents %2"/>
        <string id="Publisher.GFSEventNoCallback"                value="GFS:Attempted to notify callback of list update but callback is null!"/>
        <string id="Publisher.AutoSuggestGetSuggestions"         value="AutoSuggest:GetSuggestions SearchString=%1 MaxSuggestions=%2 STATICFILTER_PROPERTY=%3"/>

        <string id="Publisher.RoomChat_StartTracking" value="RoomsNotif: Chat: Start tracking room %1"/>
        <string id="Publisher.RoomChat_StopTracking" value="RoomsNotif: Chat: Stop tracking room %1"/>
        <string id="Publisher.RoomChat_GetUnseenCount" value="RoomsNotif: Chat: Get unseen count (RoomId=%1, unseenadd=%2, unseenremove=%3)"/>
        <string id="Publisher.RoomChat_ClearUnseenCount" value="RoomsNotif: Chat: Clear unseen count for room %1"/>
        <string id="Publisher.RoomChat_NotifyAllTrackedRooms" value="RoomsNotif: Chat: Lost or store modified notification: Number of rooms to notify %1"/>
        <string id="Publisher.RoomChat_NotifyCallback_MessageModified" value="RoomsNotif: Chat: message modified"/>
        <string id="Publisher.RoomChat_NotifyCallback_ConversationModified" value="RoomsNotif: Chat: conversation modified"/>
        <string id="Publisher.RoomChat_OnContentChangeNotification" value="RoomsNotif: Chat: notifying CTS for room %1"/>
        <string id="Publisher.RoomChat_GetUnseenCountForConversation" value="RoomsNotif: Chat: GetUnseenCount"/>
        <string id="Publisher.RoomChat_ClearUnseenCountForConversation" value="RoomsNotif: Chat: ClearUnseenCount"/>
        <string id="Publisher.RoomMembers_StartTracking" value="RoomsNotif: Members: Start tracking room %1"/>
        <string id="Publisher.RoomMembers_StopTracking" value="RoomsNotif: Members: Stop tracking room %1"/>
        <string id="Publisher.RoomMembers_GetUnseenCount" value="RoomsNotif: Members: Get unseen count (RoomId=%1, unseenadd=%2, unseenremove=%3)"/>
        <string id="Publisher.RoomMembers_ClearUnseenCount" value="RoomsNotif: Members: Clear unseen count for room %1"/>
        <string id="Publisher.RoomMembers_GetTopUnseenContentAsString" value="RoomsNotif: Members: Member who joined/left room namelen=%1"/>
        <string id="Publisher.RoomMembers_OnContentChangeNotification" value="RoomsNotif: Members: notifying CTS for room %1"/>
        <string id="Publisher.RoomMembers_CalculateMembershipChanges" value="RoomsNotif: Members: Calculate membership changes"/>
        <string id="Publisher.RoomMembers_CalculateMembershipChangesInfo" value="RoomsNotif: Members: room=%1, enumeratedOnce=%2, oldMembersCount=%3, currentMembersCount=%4"/>
        <string id="Publisher.RoomMembers_NoChangeInEtag" value="RoomsNotif: Members: Etag did not change(%1), must be local changes only"/>
        <string id="Publisher.RoomPhotos_StartTracking" value="RoomsNotif: Photos: Start tracking room %1"/>
        <string id="Publisher.RoomPhotos_StopTracking" value="RoomsNotif: Photos: Stop tracking room %1"/>
        <string id="Publisher.RoomPhotos_SyncContent_ClearingState" value="RoomsNotif: Photos: clearing state for room %1 oldunseen=%2 unseen=%3"/>
        <string id="Publisher.RoomPhotos_GetUnseenCount" value="RoomsNotif: Photos: Get unseen count (RoomId=%1, unseenadd=%2, unseenremove=%3)"/>
        <string id="Publisher.RoomPhotos_ClearUnseenCount" value="RoomsNotif: Photos: Clear unseen count for room %1"/>
        <string id="Publisher.RoomPhotos_OnContentChangeNotification" value="RoomsNotif: Photos: Notifying CTS for room %1"/>
        <string id="Publisher.RoomPhotos_SyncWasInProgress_Stopping" value="RoomsNotif: Photos: sync was in progress, but stopped"/>
        <string id="Publisher.RoomPhotos_SyncCompletedForAllRooms" value="RoomsNotif: Photos: Sync completed for all rooms"/>
        <string id="Publisher.RoomPhotos_ChangesInUnseenPhotos" value="RoomsNotif: Photos: Changes in unseen photos for room %1, unseen=%2 oldunseen=%3"/>
        <string id="Publisher.RoomPhotos_ProcessingNextRoom" value="RoomsNotif: Photos: processing next room %1"/>
        <string id="Publisher.RoomPhotos_RefreshingAlbumForRoom" value="RoomsNotif: Photos: refreshing album for room %1"/>
        <string id="Publisher.RoomPhotos_RefreshingAlbumForRoom_Completed" value="RoomsNotif: Photos: refreshing album for room completed"/>
        <string id="Publisher.RoomPhotos_LocalCacheReady_UpdatingMetadata" value="RoomsNotif: Photos: Local cache ready and updating metadata photocount=%1"/>
        <string id="Publisher.RoomPhotos_UpdatingUnseenPhotos" value="RoomsNotif: Photos: Updating unseen photos for room %1 unseen=%2"/>
        <string id="Publisher.RoomPhotos_AlbumPhotoCount" value="RoomsNotif: Photos: album has %1 photos"/>
        <string id="Publisher.RoomNote_StartTracking" value="RoomsNotif: Note: Start tracking room %1"/>
        <string id="Publisher.RoomNote_StopTracking" value="RoomsNotif: Note: Stop tracking room %1"/>
        <string id="Publisher.RoomNote_GetUnseenCount" value="RoomsNotif: Note: Get unseen count (RoomId=%1, unseenadd=%2, unseenremove=%3)"/>
        <string id="Publisher.RoomNote_ClearUnseenCount" value="RoomsNotif: Note: Clear unseen count for room %1"/>

        <string id="Publisher.OnCallEvent" value="Call update recieved for phone number = %1"/>
        <string id="Publisher.MatchingAggregateNotFound" value="no matching aggregate found for phone number = %1"/>

        <string id="Publisher.VVM_StartEnumeration" value="VVM_StartEnumeration"/>
        <string id="Publisher.VVM_EndEnumeration" value="VVM_EndEnumeration"/>
        <string id="Publisher.VVM_StartEnumeratePhonenumbers" value="VVM_StartEnumeratePhonenumbers = %1"/>
        <string id="Publisher.VVM_EndEnumeratePhonenumbers" value="VVM_EndEnumeratePhonenumbers = %1"/>
        <string id="Publisher.VVM_StartInspectSingleItem" value="VVM_StartInspectSingleItem"/>
        <string id="Publisher.VVM_EndInspectSingleItem" value="VVM_EndInspectSingleItem = %1"/>
        <string id="Publisher.VVMMERGEDCOLLECTION_INITIALIZE" value="VVMMERGEDCOLLECTION_INITIALIZE"/>
        <string id="Publisher.VVMDATACOLLECTION_INITIALIZE" value="VVMDATACOLLECTION_INITIALIZE"/>
        <string id="Publisher.VVMDATACOLLECTION_RESET" value="VVMDATACOLLECTION_RESET"/>
        <string id="Publisher.VVMDATACOLLECTION_GETDEFAULTPHONELINE" value="VVMDATACOLLECTION_GETDEFAULTPHONELINE"/>
        <string id="Publisher.VVMDATACOLLECTION_GETACCESSOR" value="VVMDATACOLLECTION_GETACCESSOR"/>

        <!-- Debug strings -->
        <string id="Publisher.Link_SuggestionSupplierInit" value="[ContactsLinking] Object [%1] LinkSuggestion supplier initialized"/>
        <string id="Publisher.Link_ShutDownSuggestionSupplier" value="[ContactsLinking] Object [%1] ShutDown LinkSuggestion supplier"/>

      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>

