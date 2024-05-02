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
      <provider name="Microsoft-WindowsPhone-Comms-ContactsTokenService"
          guid="{BAF69C75-BCC8-4d07-AF28-B6519FF3F1E4}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_CONTACTSTOKENSERVICE"
          messageFileName="ContactsTokenService.dll"
          resourceFileName="ContactsTokenService.dll">

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />

          <!-- Provider-specific keywords -->
          <keyword mask="0x0000000000000008" name="Debug" message="$(string.Keyword.Debug)" />
          <keyword mask="0x0000000000000010" name="CTS" message="$(string.Keyword.CTS)" />
          <keyword mask="0x0000000000000020" name="RPC" message="$(string.Keyword.RPC)"/>

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning" message="$(string.Keyword.Warning)"/>
          <keyword mask="0x0000800000000000" name="StateTransition" message="$(string.Keyword.StateTransition)"/>
        </keywords>
        
        
        <!--Event Templates -->
        <templates>

          <!--Event Template defined for Comms Logging -->
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

          <template tid="Int">
            <data name="P1_Int32" inType="win:Int32" />
          </template>
          <template tid="IntInt">
            <data name="P1_Int32" inType="win:Int32" />
            <data name="P2_Int32" inType="win:Int32" />
          </template>
          <template tid="IntString">
            <data name="P1_Int32" inType="win:Int32" />
            <data name="P2_UnicodeString" inType="win:UnicodeString" />
          </template>
          <template tid="IntHexHex">
            <data name="P1_Int32" inType="win:Int32" />
            <data name="P2_HexInt32" inType="win:HexInt32" />
            <data name="P3_HexInt32" inType="win:HexInt32" />
          </template>
          <template tid="IntIntString">
            <data name="P1_Int32" inType="win:Int32" />
            <data name="P2_Int32" inType="win:Int32" />
            <data name="P3_UnicodeString" inType="win:UnicodeString" />
          </template>
          <template tid="IntStringStringString">
            <data name="P1_Int32" inType="win:Int32" />
            <data name="P2_UnicodeString" inType="win:UnicodeString" />
            <data name="P3_UnicodeString" inType="win:UnicodeString" />
            <data name="P4_UnicodeString" inType="win:UnicodeString" />
          </template>
          <template tid="IntStringStringStringString">
            <data name="P1_Int32" inType="win:Int32" />
            <data name="P2_UnicodeString" inType="win:UnicodeString" />
            <data name="P3_UnicodeString" inType="win:UnicodeString" />
            <data name="P4_UnicodeString" inType="win:UnicodeString" />
            <data name="P5_UnicodeString" inType="win:UnicodeString" />
          </template>
          
          <template tid="Hex">
            <data name="P1_HexInt32" inType="win:HexInt32" />
          </template>
          <template tid="HexIntIntHexHex">
            <data name="P1_HexInt32" inType="win:HexInt32" />
            <data name="P2_Int32" inType="win:Int32" />
            <data name="P3_Int32" inType="win:Int32" />
            <data name="P4_HexInt32" inType="win:HexInt32" />
            <data name="P5_HexInt32" inType="win:HexInt32" />
          </template>
          
          <template tid="String">
            <data name="P1_UnicodeString" inType="win:UnicodeString" />
          </template>
          <template tid="StringString">
            <data name="P1_UnicodeString" inType="win:UnicodeString" />
            <data name="P2_UnicodeString" inType="win:UnicodeString" />
          </template>
          <template tid="StringStringString">
            <data name="P1_UnicodeString" inType="win:UnicodeString" />
            <data name="P2_UnicodeString" inType="win:UnicodeString" />
            <data name="P3_UnicodeString" inType="win:UnicodeString" />
          </template>
          <template tid="StringStringIntInt">
            <data name="P1_UnicodeString" inType="win:UnicodeString" />
            <data name="P2_UnicodeString" inType="win:UnicodeString" />
            <data name="P3_Int32" inType="win:Int32" />
            <data name="P4_Int32" inType="win:Int32" />
          </template>
          <template tid="StringIntIntInt">
            <data name="P1_UnicodeString" inType="win:UnicodeString" />
            <data name="P2_Int32" inType="win:Int32" />
            <data name="P3_Int32" inType="win:Int32" />
            <data name="P4_Int32" inType="win:Int32" />
          </template>
          <template tid="StringStringStringStringIntIntIntInt">
            <data name="P1_UnicodeString" inType="win:UnicodeString" />
            <data name="P2_UnicodeString" inType="win:UnicodeString" />
            <data name="P3_UnicodeString" inType="win:UnicodeString" />
            <data name="P4_UnicodeString" inType="win:UnicodeString" />
            <data name="P5_Int32" inType="win:Int32" />
            <data name="P6_Int32" inType="win:Int32" />
            <data name="P7_Int32" inType="win:Int32" />
            <data name="P8_Int32" inType="win:Int32" />
          </template>

          <template tid="FileTime">
            <data name="Prop_Datestamp" inType="win:FILETIME" />
          </template>

          <template tid="CTS_NotificationTokenID_template">
            <data name="Prop_TokenID" inType="win:UnicodeString" />
          </template>

          <template tid="CTS_EnumerationTokenID_template">
            <data name="Prop_TokenID" inType="win:UnicodeString" />
            <data name="Prop_Index" inType="win:UInt32" />
          </template>

          <template tid="CTS_FavMissingFromEnum_template">
            <data name="Prop_OLITEMID" inType="win:UnicodeString" />
            <data name="Prop_TokenID" inType="win:UnicodeString" />
            <data name="Prop_IsFavorite" inType="win:UInt32" />
          </template>

          <template tid="CTS_EnumerationAttempts_template">
            <data name="Prop_Attempts" inType="win:UInt32" />
          </template>

          <template tid="CTS_TokenIDFail_template">
            <data name="Prop_TokenID" inType="win:UnicodeString" />
            <data name="Prop_HRESULT" inType="win:UInt32" />
          </template>

          <template tid="CTS_PSM_Update_template">
            <data name="Prop_Datestamp" inType="win:FILETIME" />
            <data name="Prop_TokenID"   inType="win:UnicodeString" />
          </template>

          <template tid="CTS_Photo_Update_template">
            <data name="Prop_Datestamp" inType="win:FILETIME" />
            <data name="Prop_TokenID"   inType="win:UnicodeString" />
            <data name="Prop_PhotoPath" inType="win:UnicodeString" />
          </template>

          <template tid="CTS_PoomContactPhotos_template">
            <data name="Prop_NumImages" inType="win:UInt16" />
            <data name="Prop_NumIcons"  inType="win:UInt16" />
          </template>

          <template tid="CTS_PoomContactPhotosPath_template">
            <data name="Prop_ItemID"      inType="win:UnicodeString" />
            <data name="Prop_ImageIndex"  inType="win:UInt16" />
            <data name="Prop_ImageExists" inType="win:UInt8" />
            <data name="Prop_ImagePath"   inType="win:UnicodeString" />
          </template>

          <template tid="CTS_PoomPeepPhotosPath_template">
            <data name="Prop_TokenID"     inType="win:UnicodeString" />
            <data name="Prop_SetPSM"      inType="win:UInt8"         />
            <data name="Prop_ImageExists" inType="win:UInt8"         />
            <data name="Prop_ImagePath"   inType="win:UnicodeString" />
            <data name="Prop_StoryExists" inType="win:UInt8"         />
            <data name="Prop_StoryPath"   inType="win:UnicodeString" />
          </template>

          <template tid="CTS_AMAccountChange_template">
            <data name="Prop_AccountType" inType="win:UnicodeString" />
          </template>

          <template tid="CTS_PoomUpdateStats_template">
            <data name="Prop_Events" inType="win:UInt16" />
            <data name="Prop_Add"    inType="win:UInt16" />
            <data name="Prop_Update" inType="win:UInt16" />
            <data name="Prop_Delete" inType="win:UInt16" />
          </template>

          <template tid="CTS_RdmTokenPosition_template">
            <data name="Prop_Index" inType="win:UInt32" />
            <data name="Prop_TokenID" inType="win:UnicodeString" />
          </template>          
          
        </templates>

        <tasks>
          <task name="REFRESH_FEEDS"                    value="1"/>
          <task name="PROCESS_FEEDS"                    value="2"/>
          <task name="PROCESS_FEEDS_IMAGEUPDATE"        value="3"/>
          <task name="ON_EVENT"                         value="4"/>
          <task name="UPDATE_START_FROM_POOM"           value="5"/>
          <task name="RESYNC_START_FROM_POOM"           value="6"/>
          <task name="THREAD_PROC"                      value="7"/>
          <task name="THREAD_ENTRY"                     value="8"/>
          <task name="CTS_SERVICE"                      value="9"/>
          <task name="REFRESH_TOKENS_ON_TIMER"          value="10"/>
          <task name="CTS_DEBUG"                        value="11"/>
          <task name="CTS_RPC"                          value="12"/>

          <task name="POOM_EVENT_OVERFLOW"              value="100"/>
          <task name="POOM_EVENT_DELETE_ACCOUNT"        value="101"/>
          <task name="POOM_EVENT_CONTACT_PHOTOS"        value="102"/>
          <task name="POOM_EVENT_CONTACT_PATH"          value="103"/>
          <task name="POOM_EVENT_LOSTEVENTS"            value="104"/>
          <task name="UPDATE_START_FROM_POOM_STATS"     value="105"/>
          <task name="POOM_EVENT_PEEP_PATH"             value="106"/>
          <task name="POOM_ENUMERATION_ATTEMPTS"        value="307"/>
          <task name="POOM_FAVORITE_MISSING"            value="308"/>
    
          <task name="AM_EVENT_ACCOUNT_ADD"             value="200"/>
          <task name="AM_EVENT_ACCOUNT_DELETE"          value="201"/>
          <task name="AM_EVENT_ACCOUNT_RESET"           value="202"/>
    
          <task name="CTS_TOKEN_NOTIFICATION"           value="300"/>
          <task name="CTS_TOKEN_NOTIFICATION_FAIL"      value="301"/>
          <task name="CTS_TOKEN_ENUMERATION"            value="302"/>
          <task name="CTS_RDM_TOKEN_POSITION"           value="303"/>
          <task name="CTS_TOKEN_UPDATE"                 value="304"/>

          <task name="CTS_PSM_UPDATE"                   value="400"/>
          <task name="CTS_PROFILEPHOTO_UPDATE"          value="401"/>
          <task name="CTS_PHOTOSTORY_UPDATE"            value="402"/>
          
          <task name="UCS_CREATE_EMAILHISTORY_CHANNEL"  value="500"/>
          <task name="UCS_CREATE_EMAILHISTORY_SUPPLIER" value="501"/>
          <task name="UCS_CREATE_SMSHISTORY_CHANNEL"    value="502"/>
          <task name="UCS_CREATE_SMSHISTORY_SUPPLIER"   value="503"/>
          <task name="UCS_CREATE_CALLHISTORY_CHANNEL"   value="504"/>
          <task name="UCS_CREATE_CALLHISTORY_SUPPLIER"  value="505"/>
          <task name="UCS_CREATE_VVMHISTORY_CHANNEL"    value="506"/>
          <task name="UCS_CREATE_VVMHISTORY_SUPPLIER"   value="507"/>
          <task name="UCS_GETUNSEENCOUNT"               value="508"/>
        
          <task name="Rooms"                            value="600"/>

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

          <!-- Begin CTS Specific Events -->

          <!-- Begin CTS Client specific -->
          <event value="500" level="win:Verbose" keywords="RPC" symbol="CTS_RPCCall" message="$(string.Publisher.RPC.Call)"/>
          
          <!-- Begin Room -->
          <event value="600" level="win:Informational" keywords="RPC" opcode="win:Info" task="CTS_RPC" symbol="RPCClient_Room_ClearUnseenCount" template="IntInt" message="$(string.Publisher.RPCClient_Room_ClearUnseenCount)"/>
          <!-- End Room -->
          
          <!-- End CTS Client specific -->

          <!-- Service specific -->                                                                                               
          <event value="1000" symbol="REFRESH_FEEDS_START"                task="REFRESH_FEEDS"                level="win:Informational" opcode="win:Start" keywords="CTS Performance"/>
          <event value="1001" symbol="REFRESH_FEEDS_STOP"                 task="REFRESH_FEEDS"                level="win:Informational" opcode="win:Stop"  keywords="CTS Performance"/>
          <event value="1002" symbol="PROCESS_FEEDS_START"                task="PROCESS_FEEDS"                level="win:Informational" opcode="win:Start" keywords="CTS Performance"/>
          <event value="1003" symbol="PROCESS_FEEDS_STOP"                 task="PROCESS_FEEDS"                level="win:Informational" opcode="win:Stop"  keywords="CTS Performance"/>
          <event value="1004" symbol="PROCESS_FEEDS_IMAGEUPDATE_START"    task="PROCESS_FEEDS_IMAGEUPDATE"    level="win:Informational" opcode="win:Start" keywords="CTS Performance"/>
          <event value="1005" symbol="PROCESS_FEEDS_IMAGEUPDATE_STOP"     task="PROCESS_FEEDS_IMAGEUPDATE"    level="win:Informational" opcode="win:Stop"  keywords="CTS Performance"/>
          <event value="1006" symbol="ON_EVENT_START"                     task="ON_EVENT"                     level="win:Informational" opcode="win:Start" keywords="CTS Performance"/>
          <event value="1007" symbol="ON_EVENT_STOP"                      task="ON_EVENT"                     level="win:Informational" opcode="win:Stop"  keywords="CTS Performance"/>
          <event value="1008" symbol="UPDATE_START_FROM_POOM_START"       task="UPDATE_START_FROM_POOM"       level="win:Informational" opcode="win:Start" keywords="CTS Performance"/>
          <event value="1009" symbol="UPDATE_START_FROM_POOM_STOP"        task="UPDATE_START_FROM_POOM"       level="win:Informational" opcode="win:Stop"  keywords="CTS Performance"/>
          <event value="1010" symbol="RESYNC_START_FROM_POOM_START"       task="RESYNC_START_FROM_POOM"       level="win:Informational" opcode="win:Start" keywords="CTS Performance"/>
          <event value="1011" symbol="RESYNC_START_FROM_POOM_STOP"        task="RESYNC_START_FROM_POOM"       level="win:Informational" opcode="win:Stop"  keywords="CTS Performance"/>
          <event value="1012" symbol="THREAD_PROC_START"                  task="THREAD_PROC"                  level="win:Informational" opcode="win:Start" keywords="CTS Performance"/>
          <event value="1013" symbol="THREAD_PROC_STOP"                   task="THREAD_PROC"                  level="win:Informational" opcode="win:Stop"  keywords="CTS Performance"/>
          <event value="1014" symbol="THREAD_ENTRY_START"                 task="THREAD_ENTRY"                 level="win:Informational" opcode="win:Start" keywords="CTS Performance"/>
          <event value="1015" symbol="THREAD_ENTRY_STOP"                  task="THREAD_ENTRY"                 level="win:Informational" opcode="win:Stop"  keywords="CTS Performance"/>
          <event value="1016" symbol="CTS_SERVICE_START"                  task="CTS_SERVICE"                  level="win:Informational" opcode="win:Start" keywords="CTS Performance"/>
          <event value="1017" symbol="CTS_SERVICE_STOP"                   task="CTS_SERVICE"                  level="win:Informational" opcode="win:Stop"  keywords="CTS Performance"/>
          <event value="1018" symbol="REFRESH_TOKENS_ON_TIMER_START"      task="REFRESH_TOKENS_ON_TIMER"      level="win:Informational" opcode="win:Start" keywords="CTS Performance"/>
          <event value="1019" symbol="REFRESH_TOKENS_ON_TIMER_STOP"       task="REFRESH_TOKENS_ON_TIMER"      level="win:Informational" opcode="win:Stop"  keywords="CTS Performance"/>
                                                                                                                                
          <!-- 100's are POOM -->                                                                                               
          <event value="1100" symbol="POOM_EVENT_OVERFLOW_EVENT"          task="POOM_EVENT_OVERFLOW"          level="win:Warning"       opcode="win:Info"  keywords="CTS Warning"         message="$(string.Publisher.Overflow)"/>
          <event value="1101" symbol="POOM_EVENT_DELETE_ACCOUNT_EVENT"    task="POOM_EVENT_DELETE_ACCOUNT"    level="win:Informational" opcode="win:Info"  keywords="CTS StateTransition" message="$(string.Publisher.PoomDelAccount)"/>
          <event value="1102" symbol="POOM_EVENT_CONTACT_PHOTOS_EVENT"    task="POOM_EVENT_CONTACT_PHOTOS"    level="win:Informational" opcode="win:Info"  keywords="CTS"           template="CTS_PoomContactPhotos_template" message="$(string.Publisher.PoomContactPhotos)"/>
          <event value="1103" symbol="POOM_EVENT_CONTACT_PATH_EVENT"      task="POOM_EVENT_CONTACT_PATH"      level="win:Informational"       opcode="win:Info"  keywords="CTS"           template="CTS_PoomContactPhotosPath_template" message="$(string.Publisher.PoomContactPhotosPath)"/>
          <event value="1104" symbol="POOM_EVENT_LOSTEVENTS_EVENT"        task="POOM_EVENT_LOSTEVENTS"        level="win:Warning"       opcode="win:Info"  keywords="CTS Warning"         message="$(string.Publisher.LostEvents)"/>
          <event value="1105" symbol="UPDATE_START_FROM_POOM_STATS_EVENT" task="UPDATE_START_FROM_POOM_STATS" level="win:Informational" opcode="win:Info"  keywords="CTS"           template="CTS_PoomUpdateStats_template" message="$(string.Publisher.PoomUpdateStats)"/>
          <event value="1106" symbol="POOM_EVENT_PEEP_PATH_EVENT"         task="POOM_EVENT_PEEP_PATH"         level="win:Informational"       opcode="win:Info"  keywords="CTS"           template="CTS_PoomPeepPhotosPath_template" message="$(string.Publisher.PoomPeepPhotosPath)"/>
          <event value="1107" symbol="POOM_ENUMERATION_ATTEMPTS_EVENT"    task="POOM_ENUMERATION_ATTEMPTS"    level="win:Informational" opcode="win:Info"  keywords="CTS"           template="CTS_EnumerationAttempts_template" message="$(string.Publisher.CTS_EnumerationAttempts_template)"/>
          <event value="1108" symbol="POOM_FAVORITE_MISSING_EVENT"        task="POOM_FAVORITE_MISSING"        level="win:Informational" opcode="win:Info"  keywords="CTS"           template="CTS_FavMissingFromEnum_template" message="$(string.Publisher.CTS_FavMissingFromEnum_template)"/>
                                                                                                                                                                                        
          <!-- 200's are AccountManager -->                                                                                                                                             
          <event value="1200" symbol="AM_EVENT_ACCOUNT_ADD_EVENT"         task="AM_EVENT_ACCOUNT_ADD"         level="win:Informational" opcode="win:Info"  keywords="CTS"   template="CTS_AMAccountChange_template" message="$(string.Publisher.AMAddAccount)"/>
          <event value="1201" symbol="AM_EVENT_ACCOUNT_DELETE_EVENT"      task="AM_EVENT_ACCOUNT_DELETE"      level="win:Informational" opcode="win:Info"  keywords="CTS"   template="CTS_AMAccountChange_template" message="$(string.Publisher.AMDelAccount)"/>
          <event value="1202" symbol="AM_EVENT_ACCOUNT_RESET_EVENT"       task="AM_EVENT_ACCOUNT_RESET"       level="win:Informational" opcode="win:Info"  keywords="CTS"   message="$(string.Publisher.AMResetAccounts)"/>
                                                                                                                                                                                        
          <!-- 300's are TokenManager -->                                                                                                                                               
          <event value="1300" symbol="CTS_TOKEN_NOTIFICATION_EVENT"             task="CTS_TOKEN_NOTIFICATION"       level="win:Informational" opcode="win:Info"  keywords="CTS"         template="CTS_NotificationTokenID_template" message="$(string.Publisher.CTS_NotificationTokenID_template)"/>
          <event value="1301" symbol="CTS_TOKEN_NOTIFICATION_FAIL_EVENT"        task="CTS_TOKEN_NOTIFICATION_FAIL"  level="win:Warning"       opcode="win:Info"  keywords="CTS Warning" template="CTS_TokenIDFail_template"         message="$(string.Publisher.CTS_TokenIDFail_template)"/>
          <event value="1302" symbol="CTS_TOKEN_ENUMERATION_EVENT"              task="CTS_TOKEN_ENUMERATION"        level="win:Informational" opcode="win:Info"  keywords="CTS"         template="CTS_EnumerationTokenID_template"  message="$(string.Publisher.CTS_EnumerationTokenID_template)"/>
          <event value="1303" symbol="CTS_RDM_TOKEN_POSITION_EVENT"             task="CTS_RDM_TOKEN_POSITION"       level="win:Informational" opcode="win:Info"  keywords="CTS"         template="CTS_RdmTokenPosition_template"    message="$(string.Publisher.CTS_RdmTokenPosition_template)"/>
          <event value="1304" symbol="CTS_MarkAggregateAsFavorite_Begin"        task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="String"                           message="$(string.Publisher.MarkAggregateAsFavorite_Begin)"/>
          <event value="1305" symbol="CTS_MarkAggregateAsFavorite_Complete"     task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="StringString"                     message="$(string.Publisher.MarkAggregateAsFavorite_Complete)"/>
          <event value="1306" symbol="CTS_MarkGroupAsFavorite_Begin"            task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="String"                           message="$(string.Publisher.MarkGroupAsFavorite_Begin)"/>
          <event value="1307" symbol="CTS_MarkGroupAsFavorite_Complete"         task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="StringString"                     message="$(string.Publisher.MarkGroupAsFavorite_Complete)"/>
          <event value="1308" symbol="CTS_RestoreAggregateAsFavorite_Begin"     task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="String"                           message="$(string.Publisher.RestoreAggregateAsFavorite_Begin)"/>
          <event value="1309" symbol="CTS_RestoreAggregateAsFavorite_Complete"  task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="StringString"                     message="$(string.Publisher.RestoreAggregateAsFavorite_Complete)"/>
          <event value="1310" symbol="CTS_RestoreGroupAsFavorite_Begin"         task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="String"                           message="$(string.Publisher.RestoreGroupAsFavorite_Begin)"/>
          <event value="1311" symbol="CTS_RestoreGroupAsFavorite_Complete"      task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="StringString"                     message="$(string.Publisher.RestoreGroupAsFavorite_Complete)"/>
          <event value="1312" symbol="CTS_CreateToken"                          task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="String"                           message="$(string.Publisher.CreateToken)"/>
          <event value="1313" symbol="CTS_CreateGroupToken"                     task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="String"                           message="$(string.Publisher.CreateGroupToken)"/>
          <event value="1314" symbol="CTS_UnpinContactTileFromStart"            task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="StringString"                     message="$(string.Publisher.UnpinContactTileFromStart)"/>
          <event value="1315" symbol="CTS_UnpinGroupTileFromStart"              task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="StringString"                     message="$(string.Publisher.UnpinGroupTileFromStart)"/>
          <event value="1316" symbol="CTS_AddTile"                              task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="IntString"                        message="$(string.Publisher.AddTile)"/>
          <event value="1317" symbol="CTS_UpdateToken"                          task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="IntString"                        message="$(string.Publisher.UpdateToken)"/>
          <event value="1318" symbol="CTS_UpdateGroupToken"                     task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="IntString"                        message="$(string.Publisher.UpdateGroupToken)"/>
          <event value="1319" symbol="CTS_DeleteTile"                           task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="String"                           message="$(string.Publisher.DeleteTile)"/>
          <event value="1320" symbol="CTS_GetTokenInfo"                         task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="StringStringStringStringIntIntIntInt" message="$(string.Publisher.GetTokenInfo)"/>
          <event value="1321" symbol="CTS_PopulateMixViewInfo"                  task="CTS_TOKEN_UPDATE"             level="win:Informational" opcode="win:Info"  keywords="CTS"         template="StringString"                     message="$(string.Publisher.PopulateMixViewInfo)"/>

          <!-- 400's are Feeds -->                                                                                                                                                     
          <event value="1400" symbol="CTS_PSM_UPDATE_EVENT"               task="CTS_PSM_UPDATE"               level="win:Informational" opcode="win:Info"  keywords="CTS"   template="CTS_PSM_Update_template"   message="$(string.Publisher.CTS_PSM_Update_template)"/>
          <event value="1401" symbol="CTS_PROFILEPHOTO_UPDATE_EVENT"      task="CTS_PROFILEPHOTO_UPDATE"      level="win:Informational" opcode="win:Info"  keywords="CTS"   template="CTS_Photo_Update_template" message="$(string.Publisher.CTS_Photo_Update_template)"/>
          <event value="1402" symbol="CTS_PHOTOSTORY_UPDATE_EVENT"        task="CTS_PHOTOSTORY_UPDATE"        level="win:Informational" opcode="win:Info"  keywords="CTS"   template="CTS_Photo_Update_template" message="$(string.Publisher.CTS_Photo_Update_template)"/>

          <!-- 500's are HistorySupplier -->                                                                                                                                                     
          <event value="1500" symbol="UCS_CREATE_EMAILHISTORY_CHANNEL_START"          task="UCS_CREATE_EMAILHISTORY_CHANNEL"                  level="win:Informational"   opcode="win:Start"  keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateEmailHistoryChannelStart)"/>
          <event value="1501" symbol="UCS_CREATE_EMAILHISTORY_CHANNEL_STOP"           task="UCS_CREATE_EMAILHISTORY_CHANNEL"                  level="win:Informational"   opcode="win:Stop"   keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateEmailHistoryChannelStop)"/>
          <event value="1502" symbol="UCS_CREATE_EMAILHISTORY_SUPPLIER_START"         task="UCS_CREATE_EMAILHISTORY_SUPPLIER"                 level="win:Informational"   opcode="win:Start"  keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateEmailHistorySupplierStart)"/>
          <event value="1503" symbol="UCS_CREATE_EMAILHISTORY_SUPPLIER_STOP"          task="UCS_CREATE_EMAILHISTORY_SUPPLIER"                 level="win:Informational"   opcode="win:Stop"   keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateEmailHistorySupplierStop)"/>
          <event value="1504" symbol="UCS_CREATE_SMSHISTORY_CHANNEL_START"            task="UCS_CREATE_SMSHISTORY_CHANNEL"                    level="win:Informational"   opcode="win:Start"  keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateSMSHistoryChannelStart)"/>
          <event value="1505" symbol="UCS_CREATE_SMSHISTORY_CHANNEL_STOP"             task="UCS_CREATE_SMSHISTORY_CHANNEL"                    level="win:Informational"   opcode="win:Stop"   keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateSMSHistoryChannelStop)"/>
          <event value="1506" symbol="UCS_CREATE_SMSHISTORY_SUPPLIER_START"           task="UCS_CREATE_SMSHISTORY_SUPPLIER"                   level="win:Informational"   opcode="win:Start"  keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateSMSHistorySupplierStart)"/>
          <event value="1507" symbol="UCS_CREATE_SMSHISTORY_SUPPLIER_STOP"            task="UCS_CREATE_SMSHISTORY_SUPPLIER"                   level="win:Informational"   opcode="win:Stop"   keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateSMSHistorySupplierStop)"/>
          <event value="1508" symbol="UCS_CREATE_CALLHISTORY_CHANNEL_START"           task="UCS_CREATE_CALLHISTORY_CHANNEL"                   level="win:Informational"   opcode="win:Start"  keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateCallHistoryChannelStart)"/>
          <event value="1509" symbol="UCS_CREATE_CALLHISTORY_CHANNEL_STOP"            task="UCS_CREATE_CALLHISTORY_CHANNEL"                   level="win:Informational"   opcode="win:Stop"   keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateCallHistoryChannelStop)"/>
          <event value="1510" symbol="UCS_CREATE_CALLHISTORY_SUPPLIER_START"          task="UCS_CREATE_CALLHISTORY_SUPPLIER"                  level="win:Informational"   opcode="win:Start"  keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateCallHistorySupplierStart)"/>
          <event value="1511" symbol="UCS_CREATE_CALLHISTORY_SUPPLIER_STOP"           task="UCS_CREATE_CALLHISTORY_SUPPLIER"                  level="win:Informational"   opcode="win:Stop"   keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateCallHistorySupplierStop)"/>
          <event value="1512" symbol="UCS_CREATE_VVMHISTORY_CHANNEL_START"            task="UCS_CREATE_VVMHISTORY_CHANNEL"                    level="win:Informational"   opcode="win:Start"  keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateVVMHistoryChannelStart)"/>
          <event value="1513" symbol="UCS_CREATE_VVMHISTORY_CHANNEL_STOP"             task="UCS_CREATE_VVMHISTORY_CHANNEL"                    level="win:Informational"   opcode="win:Stop"   keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateVVMHistoryChannelStop)"/>
          <event value="1514" symbol="UCS_CREATE_VVMHISTORY_SUPPLIER_START"           task="UCS_CREATE_VVMHISTORY_SUPPLIER"                   level="win:Informational"   opcode="win:Start"  keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateVVMHistorySupplierStart)"/>
          <event value="1515" symbol="UCS_CREATE_VVMHISTORY_SUPPLIER_STOP"            task="UCS_CREATE_VVMHISTORY_SUPPLIER"                   level="win:Informational"   opcode="win:Stop"   keywords="CTS Performance"                                           message="$(string.Publisher.UCSCreateVVMHistorySupplierStop)"/>
          <event value="1516" symbol="UCS_GETUNSEENCOUNT_START"                       task="UCS_GETUNSEENCOUNT"                               level="win:Informational"   opcode="win:Start"  keywords="CTS Performance"           template="Int"                  message="$(string.Publisher.UCSGetUnseenCountStart)"/>
          <event value="1517" symbol="UCS_GETUNSEENCOUNT_STOP"                        task="UCS_GETUNSEENCOUNT"                               level="win:Informational"   opcode="win:Stop"   keywords="CTS Performance"           template="IntInt"               message="$(string.Publisher.UCSGetUnseenCountStop)"/>

          <!-- End CTS Specific Events -->

          <!-- Begin Debug Specific Events -->
          <event value="2000" symbol="DBG_BEFORE_SHELL_READY"                          task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" message="$(string.Publisher.BEFORE_SHELL_READY)"/>
          <event value="2001" symbol="DBG_AFTER_SHELL_READY"                           task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="Int" message="$(string.Publisher.AFTER_SHELL_READY)"/>
          <event value="2002" symbol="DBG_USER_PRESENCE_CHANGED"                       task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="Int" message="$(string.Publisher.USER_PRESENCE_CHANGED)"/>
          <event value="2003" symbol="DBG_THREAD_AWAKE_FOR"                            task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="String" message="$(string.Publisher.THREAD_AWAKE_FOR)"/>
          <event value="2004" symbol="DBG_USERACTIVE"                                  task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" message="$(string.Publisher.USERACTIVE)"/>
          <event value="2005" symbol="DBG_StoreCreated"                                task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" message="$(string.Publisher.StoreCreated)"/>
          <event value="2006" symbol="DBG_EnumeratePoomEvent"                          task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="HexIntIntHexHex" message="$(string.Publisher.EnumeratePoomEvent)"/>
          <event value="2007" symbol="DBG_StoreChange"                                 task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntHexHex" message="$(string.Publisher.StoreChange)"/>
          <event value="2008" symbol="DBG_GroupNotification"                           task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" message="$(string.Publisher.GroupNotification)"/>
          <event value="2009" symbol="DBG_UpdatedAggregatesSize"                       task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="Int" message="$(string.Publisher.UpdatedAggregatesSize)"/>
          <event value="2010" symbol="DBG_ADVISED_FOR_POOM_NOTIF"                      task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" message="$(string.Publisher.ADVISED_FOR_POOM_NOTIF)"/>
          <event value="2011" symbol="DBG_UNADVISED_FOR_POOM_NOTIF"                    task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" message="$(string.Publisher.UNADVISED_FOR_POOM_NOTIF)"/>
          <event value="2012" symbol="DBG_UNADVISED_FOR_POOM_GROUP_NOTIF"              task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" message="$(string.Publisher.UNADVISED_FOR_POOM_GROUP_NOTIF)"/>
          <event value="2013" symbol="DBG_GetDataReturning"                            task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntString" message="$(string.Publisher.GetDataReturning)"/>
          <event value="2014" symbol="DBG_ACCOUNTEVENTTYPE_CHANGE_SYNCHRONIZING"       task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="String" message="$(string.Publisher.ACCOUNTEVENTTYPE_CHANGE_SYNCHRONIZING)"/>
          <event value="2015" symbol="DBG_SODACALLBACK_WAIT"                           task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="Int" message="$(string.Publisher.SODACALLBACK_WAIT)"/>
          <event value="2016" symbol="DBG_SODACALLBACK_DONE"                           task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="Int" message="$(string.Publisher.SODACALLBACK_DONE)"/>
          <event value="2017" symbol="DBG_SODACALLBACKREFRESH_ONCOMPLETE"              task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntInt" message="$(string.Publisher.SODACALLBACKREFRESH_ONCOMPLETE)"/>
          <event value="2018" symbol="DBG_SODACALLBACKREFRESHIMAGEPATH_ONCOMPLETE"     task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntInt" message="$(string.Publisher.SODACALLBACKREFRESHIMAGEPATH_ONCOMPLETE)"/>
          <event value="2019" symbol="DBG_SODACALLBACKSNAPSHOT_ONCOMPLETE"             task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntInt" message="$(string.Publisher.SODACALLBACKSNAPSHOT_ONCOMPLETE)"/>
          <event value="2020" symbol="DBG_SODACALLBACKSNAPSHOT_GETSNAPSHOT"            task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" message="$(string.Publisher.SODACALLBACKSNAPSHOT_GETSNAPSHOT)"/>
          <event value="2021" symbol="DBG_UPDATEIMAGE"                                 task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringStringString" message="$(string.Publisher.UPDATEIMAGE)"/>
          <event value="2022" symbol="DBG_UPDATEIMAGE_MAKEASYNCREQUEST"                task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringString" message="$(string.Publisher.UPDATEIMAGE_MAKEASYNCREQUEST)"/>
          <event value="2025" symbol="DBG_ProcessFeed_SnapshotDone"                    task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntIntString" message="$(string.Publisher.ProcessFeed_SnapshotDone)"/>
          <event value="2026" symbol="DBG_ProcessFeed_CallingProcessActivity"          task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringIntIntInt" message="$(string.Publisher.ProcessFeed_CallingProcessActivity)"/>
          <event value="2027" symbol="DBG_ProcessSocNotForMEToken"                     task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntIntString" message="$(string.Publisher.ProcessSocNotForMEToken)"/>
          <event value="2028" symbol="DBG_ProcessActivity"                             task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringStringIntInt" message="$(string.Publisher.ProcessActivity)"/>
          <event value="2029" symbol="DBG_GetImagePath_SnapshotDone"                   task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntString" message="$(string.Publisher.GetImagePath_SnapshotDone)"/>
          <event value="2030" symbol="DBG_GetImagePath_GetPropValDone"                 task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntIntString" message="$(string.Publisher.GetImagePath_GetPropValDone)"/>
          <event value="2031" symbol="DBG_GetImagePath_ChoosingFirstImgAvailToDownload" task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntInt" message="$(string.Publisher.GetImagePath_ChoosingFirstImgAvailToDownload)"/>
          <event value="2032" symbol="DBG_UpdateStartFromPOOM_EventInfo"               task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringStringIntInt" message="$(string.Publisher.UpdateStartFromPOOM_EventInfo)"/>
          <event value="2033" symbol="DBG_GetNextUpdateTime_PASTDUE"                   task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringStringString" message="$(string.Publisher.GetNextUpdateTime_PASTDUE)"/>
          <event value="2034" symbol="DBG_GetNextUpdateTime_FUTURE"                    task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringStringString" message="$(string.Publisher.GetNextUpdateTime_FUTURE)"/>
          <event value="2035" symbol="DBG_GetPinnedAggregates"                         task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringStringIntInt" message="$(string.Publisher.GetPinnedAggregates)"/>
          <event value="2036" symbol="DBG_EnumerateAggregatesWithPicture"              task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="Int" message="$(string.Publisher.EnumerateAggregatesWithPicture)"/>
          <event value="2037" symbol="DBG_EnumerateGroupMembersWithPicture"            task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="Int" message="$(string.Publisher.EnumerateGroupMembersWithPicture)"/>
          <event value="2038" symbol="DBG_UnfavoritingContactsOfAnAggregate"           task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="Int" message="$(string.Publisher.UnfavoritingContactsOfAnAggregate)"/>
          <event value="2040" symbol="DBG_PopulateTile_RemoteAggregateId"              task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringString" message="$(string.Publisher.PopulateTile_RemoteAggregateId)"/>
          <event value="2041" symbol="DBG_PopulateTile_RemoteGroupId"                  task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringString" message="$(string.Publisher.PopulateTile_RemoteGroupId)"/>
          <event value="2042" symbol="DBG_PopulateTile_RemoteRoomId"                   task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringString" message="$(string.Publisher.PopulateTile_RemoteRoomId)"/>
          <event value="2043" symbol="DBG_PopulateTile_ConnectTextInfo"                task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="String" message="$(string.Publisher.PopulateTile_ConnectTextInfo)"/>
          <event value="2044" symbol="DBG_PopulateTile_SocialText1Info"                task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringString" message="$(string.Publisher.PopulateTile_SocialText1Info)"/>
          <event value="2045" symbol="DBG_PopulateTile_SocialText2Info"                task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringString" message="$(string.Publisher.PopulateTile_SocialText2Info)"/>
          <event value="2046" symbol="DBG_CopyTileImage"                               task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringStringIntInt" message="$(string.Publisher.CopyTileImage)"/>
          <event value="2047" symbol="DBG_OversizedGroup_SkippingSocial"               task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntString" message="$(string.Publisher.SkippingSocial)"/>
          <event value="2048" symbol="DBG_OversizedGroup_SkippingConnect"              task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="IntString" message="$(string.Publisher.SkippingConnect)"/>
          <event value="2049" symbol="DBG_AppointmentNotification"                     task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" message="$(string.Publisher.AppointmentNotification)"/>
          <event value="2050" symbol="DBG_UNADVISED_FOR_POOM_APPOINTMENT_NOTIF"        task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" message="$(string.Publisher.UNADVISED_FOR_POOM_APPOINTMENT_NOTIF)"/>
          <event value="2052" symbol="DBG_MixView_Content"                             task="CTS_DEBUG" level="win:Verbose" opcode="win:Info" keywords="CTS" template="IntStringStringString" message="$(string.Publisher.DBG_MixView_Content)"/>
          <event value="2053" symbol="DBG_MixView_FetchImage"                          task="CTS_DEBUG" level="win:Verbose" opcode="win:Info" keywords="CTS" template="IntInt" message="$(string.Publisher.DBG_MixView_FetchImage)"/>
          <event value="2054" symbol="DBG_MixView_RefreshImage"                        task="CTS_DEBUG" level="win:Verbose" opcode="win:Info" keywords="CTS" template="FileTime" message="$(string.Publisher.DBG_MixView_RefreshImage)"/>
          <event value="2055" symbol="DBG_TileTaskParamsEmptyItemId"                   task="CTS_DEBUG" level="win:Informational" opcode="win:Info" keywords="CTS" template="StringString" message="$(string.Publisher.DBG_TileTaskParamsEmptyItemId)"/>
          <!-- End Debug Specific Events -->

          <!-- Begin Rooms Specific Events -->
          <event value="3000" symbol="Rooms_ProcessContentNotifications_START"         task="Rooms" level="win:Informational" opcode="win:Start" keywords="CTS" message="$(string.Publisher.Rooms_ProcessContentNotifications)"/>
          <event value="3001" symbol="Rooms_ProcessContentNotifications_STOP"          task="Rooms" level="win:Informational" opcode="win:Stop"  keywords="CTS" message="$(string.Publisher.Rooms_ProcessContentNotifications)"/>
          <event value="3002" symbol="Rooms_SyncRoomContentIfRefreshable_START"        task="Rooms" level="win:Informational" opcode="win:Start" keywords="CTS" message="$(string.Publisher.Rooms_SyncRoomContentIfRefreshable)"/>
          <event value="3003" symbol="Rooms_SyncRoomContentIfRefreshable_STOP"         task="Rooms" level="win:Informational" opcode="win:Stop"  keywords="CTS" message="$(string.Publisher.Rooms_SyncRoomContentIfRefreshable)"/>
          <event value="3004" symbol="Rooms_ClearUnseenCount_START"                    task="Rooms" level="win:Informational" opcode="win:Start" keywords="CTS" message="$(string.Publisher.Rooms_ClearUnseenCount)"/>
          <event value="3005" symbol="Rooms_ClearUnseenCount_STOP"                     task="Rooms" level="win:Informational" opcode="win:Stop"  keywords="CTS" message="$(string.Publisher.Rooms_ClearUnseenCount)"/>
          <event value="3006" symbol="Rooms_PopulateRoomTile_START"                    task="Rooms" level="win:Informational" opcode="win:Start" keywords="CTS" message="$(string.Publisher.Rooms_PopulateRoomTile)"/>
          <event value="3007" symbol="Rooms_PopulateRoomTile_STOP"                     task="Rooms" level="win:Informational" opcode="win:Stop"  keywords="CTS" message="$(string.Publisher.Rooms_PopulateRoomTile)"/>
          <event value="3008" symbol="Rooms_GetRoomTokenInfo_START"                    task="Rooms" level="win:Informational" opcode="win:Start" keywords="CTS" message="$(string.Publisher.Rooms_GetRoomTokenInfo)"/>
          <event value="3009" symbol="Rooms_GetRoomTokenInfo_STOP"                     task="Rooms" level="win:Informational" opcode="win:Stop"  keywords="CTS" message="$(string.Publisher.Rooms_GetRoomTokenInfo)"/>
          <event value="3010" symbol="Rooms_Chat_UnseenCount"                          task="Rooms" level="win:Informational" opcode="win:Info"  keywords="CTS" template="Int" message="$(string.Publisher.Rooms_Chat_UnseenCount)"/>
          <event value="3011" symbol="Rooms_Photos_UnseenCount"                        task="Rooms" level="win:Informational" opcode="win:Info"  keywords="CTS" template="Int" message="$(string.Publisher.Rooms_Photos_UnseenCount)"/>
          <event value="3012" symbol="Rooms_Calendar_UnseenCount"                      task="Rooms" level="win:Informational" opcode="win:Info"  keywords="CTS" template="Int" message="$(string.Publisher.Rooms_Calendar_UnseenCount)"/>
          <event value="3013" symbol="Rooms_Notes_UnseenCount"                         task="Rooms" level="win:Informational" opcode="win:Info"  keywords="CTS" template="Int" message="$(string.Publisher.Rooms_Notes_UnseenCount)"/>
          <event value="3014" symbol="Rooms_MembershipChangeText"                      task="Rooms" level="win:Informational" opcode="win:Info"  keywords="CTS" template="Int" message="$(string.Publisher.Rooms_MembershipChangeText)"/>
          <event value="3015" symbol="Rooms_NotesUnexpectedFile"                       task="Rooms" level="win:Informational" opcode="win:Info"  keywords="CTS" template="String" message="$(string.Publisher.Rooms_NotesUnexpectedFile)"/>
          <event value="3016" symbol="Rooms_ReplacedDefaultRoomTile"                   task="Rooms" level="win:Informational" opcode="win:Info"  keywords="CTS" message="$(string.Publisher.Rooms_ReplacedDefaultRoomTile)"/>
          <event value="3017" symbol="Rooms_RegisteredRoomsFound"                      task="Rooms" level="win:Informational" opcode="win:Info"  keywords="CTS" template="Int" message="$(string.Publisher.Rooms_RegisteredRoomsFound)"/>
          <event value="3018" symbol="Rooms_RegisteredRoomDeleted"                     task="Rooms" level="win:Informational" opcode="win:Info"  keywords="CTS" template="String" message="$(string.Publisher.Rooms_RegisteredRoomDeleted)"/>
          <event value="3019" symbol="Rooms_RoomRegistered"                            task="Rooms" level="win:Informational" opcode="win:Info"  keywords="CTS" template="String" message="$(string.Publisher.Rooms_RoomRegistered)"/>
          <!-- End Rooms Specific Events -->

        </events>

      </provider>

    </events>

  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>

        <!-- strings for keywords -->
        <string id="Keyword.Error"                              value="Error" />
        <string id="Keyword.Performance"                        value="Performance" />
        <string id="Keyword.Debug"                              value="Debug" />
        <string id="Keyword.CTS"                                value="CTS" />
        <string id="Keyword.Warning"                            value="Warning" />
        <string id="Keyword.StateTransition"                    value="StateTransition" />
        <string id="Keyword.RPC"                                value="RPC" />

        <string id="Publisher.RPC.Call"                         value="ContactsTokenService RPC Call"/>
        <string id="Publisher.RPCClient_Room_ClearUnseenCount"  value="CTS RPS client call to clear unseen count for room %1 with flags %2"/>

        <string id="Event.CommsErrorOriginateMessage"           value="Error: %1 Location: %2 Line Number: %3"/>    
        <string id="Event.CommsPropagateErrorMessage"           value="Error Propagated: %1 Location: %2 Line Number: %3"/>

        <string id="Publisher.CTS_NotificationTokenID_template"     value="Notification: StartTokenID %1"/>
        <string id="Publisher.CTS_EnumerationTokenID_template"      value="Enumerate: StartTokenID %1, %2"/>
        <string id="Publisher.CTS_EnumerationAttempts_template"     value="Enumerate: Stable enumeration took %1 attempts"/>
        <string id="Publisher.CTS_FavMissingFromEnum_template"      value="Item missing from enum: ItemId %1, TokenId=%2, IsFav = %3"/>
        <string id="Publisher.CTS_TokenIDFail_template"             value="StartTokenID %1 HRESULT(%2)"/>
        <string id="Publisher.CTS_PSM_Update_template"              value="PSMDate %1 TokenID %2"/>
        <string id="Publisher.CTS_Photo_Update_template"            value="PSMDate %1 TokenID %2 Photo %3"/>
        <string id="Publisher.Overflow"                             value="Overflow"/>
        <string id="Publisher.LostEvents"                           value="LostEvents"/>
        <string id="Publisher.PoomDelAccount"                       value="PoomDelAccount"/>
        <string id="Publisher.PoomContactPhotos"                    value="Refresh Contacts Tokens. ImageCount=%1, IconCount=%2"/>
        <string id="Publisher.PoomContactPhotosPath"                value="Contacts Tokens. ItemId=%1, ImageIndex=%2, ImageExists=%3 ImagePath=%4"/>
        <string id="Publisher.PoomPeepPhotosPath"                   value="Contacts Tokens. ItemId=%1 SetPSM=%2 ImageExists=%3 ImagePath=%4 StoryExists=%5 StoryPath=%6"/>
        <string id="Publisher.PoomUpdateStats"                      value="PoomUpdateStats. Events=%1, Add=%2, Update=%3, Delete=%4"/>
        <string id="Publisher.AMAddAccount"                         value="AMAddAccount type=%1"/>
        <string id="Publisher.AMDelAccount"                         value="AMDelAccount type=%1"/>
        <string id="Publisher.AMResetAccounts"                      value="AMResetAccounts"/>
        <string id="Publisher.CTS_RdmTokenPosition_template"        value="RdmTokenPosition: Position=%1, TokenID=%2"/>
        <string id="Publisher.MarkAggregateAsFavorite_Begin"        value="MarkAggregateAsFavorite_Begin ItemId: %1"/>
        <string id="Publisher.MarkAggregateAsFavorite_Complete"     value="MarkAggregateAsFavorite_Complete ItemId: %1  TokenId: %2  "/>
        <string id="Publisher.MarkGroupAsFavorite_Begin"            value="MarkGroupAsFavorite_Begin ItemId: %1"/>
        <string id="Publisher.MarkGroupAsFavorite_Complete"         value="MarkGroupAsFavorite_Complete ItemId: %1  TokenId: %2  "/>
        <string id="Publisher.RestoreAggregateAsFavorite_Begin"     value="RestoreAggregateAsFavorite_Begin TokenId: %1"/>
        <string id="Publisher.RestoreAggregateAsFavorite_Complete"  value="RestoreAggregateAsFavorite_Complete ItemId: %1  TokenId: %2  "/>
        <string id="Publisher.RestoreGroupAsFavorite_Begin"         value="RestoreGroupAsFavorite_Begin TokenId: %1"/>
        <string id="Publisher.RestoreGroupAsFavorite_Complete"      value="RestoreGroupAsFavorite_Complete ItemId: %1  TokenId: %2  "/>
        <string id="Publisher.CreateToken"                          value="CreateToken ItemId: %1  "/>
        <string id="Publisher.CreateGroupToken"                     value="CreateGroupToken ItemId: %1 "/>

        <string id="Publisher.UCSCreateEmailHistoryChannelStart"    value="CTSUnifiedConnectSupplier:Start CreateEmailHistoryChannel"/>
        <string id="Publisher.UCSCreateEmailHistoryChannelStop"     value="CTSUnifiedConnectSupplier:End CreateEmailHistoryChannel"/>
        <string id="Publisher.UCSCreateEmailHistorySupplierStart"   value="CTSUnifiedConnectSupplier:Start CreateEmailHistorySupplier"/>
        <string id="Publisher.UCSCreateEmailHistorySupplierStop"    value="CTSUnifiedConnectSupplier:End CreateEmailHistorySupplier"/>
        <string id="Publisher.UCSCreateSMSHistoryChannelStart"      value="CTSUnifiedConnectSupplier:Start CreateSMSHistoryChannel"/>
        <string id="Publisher.UCSCreateSMSHistoryChannelStop"       value="CTSUnifiedConnectSupplier:End CreateSMSHistoryChannel"/>
        <string id="Publisher.UCSCreateSMSHistorySupplierStart"     value="CTSUnifiedConnectSupplier:Start CreateSMSHistorySupplier"/>
        <string id="Publisher.UCSCreateSMSHistorySupplierStop"      value="CTSUnifiedConnectSupplier:End CreateSMSHistorySupplier"/>
        <string id="Publisher.UCSCreateCallHistoryChannelStart"     value="CTSUnifiedConnectSupplier:Start CallHistoryChannel"/>
        <string id="Publisher.UCSCreateCallHistoryChannelStop"      value="CTSUnifiedConnectSupplier:End CallHistoryChannel"/>
        <string id="Publisher.UCSCreateCallHistorySupplierStart"    value="CTSUnifiedConnectSupplier:Start CallHistorySupplier"/>
        <string id="Publisher.UCSCreateCallHistorySupplierStop"     value="CTSUnifiedConnectSupplier:End CallHistorySupplier"/>
        <string id="Publisher.UCSCreateVVMHistoryChannelStart"      value="CTSUnifiedConnectSupplier:Start CreateVVMHistoryChannel"/>
        <string id="Publisher.UCSCreateVVMHistoryChannelStop"       value="CTSUnifiedConnectSupplier:End CreateVVMHistoryChannel"/>
        <string id="Publisher.UCSCreateVVMHistorySupplierStart"     value="CTSUnifiedConnectSupplier:Start CreateVVMHistorySupplier"/>
        <string id="Publisher.UCSCreateVVMHistorySupplierStop"      value="CTSUnifiedConnectSupplier:End CreateVVMHistorySupplier"/>
        <string id="Publisher.UCSGetUnseenCountStart"               value="CTSUnifiedConnectSupplier:Start GetUnseenCount for type %1"/>
        <string id="Publisher.UCSGetUnseenCountStop"                value="CTSUnifiedConnectSupplier:End GetUnseenCount for type %1 returned %2"/>

        <string id="Publisher.BEFORE_SHELL_READY"                 value="CTS_DBG:BEFORE_SHELL_READY:  BEFORE shell ready wait"/>
        <string id="Publisher.AFTER_SHELL_READY"                        value="CTS_DBG:AFTER_SHELL_READY:  AFTER shell ready wait elapsed=%1"/>
        <string id="Publisher.USER_PRESENCE_CHANGED"                  value="CTS_DBG:User presence has changed new state=%1"/>
        <string id="Publisher.THREAD_AWAKE_FOR"                               value="CTS_DBG:THREAD_AWAKE_FOR: Wake for %1"/>
        <string id="Publisher.USERACTIVE"                                     value="CTS_DBG:USERACTIVE: USERACTIVE"/>
        <string id="Publisher.StoreCreated"                                   value="CTS_DBG:StoreCreated: StoreCreated "/>
        <string id="Publisher.EnumeratePoomEvent"                             value="CTS_DBG:EnumeratePoomEvent: EnumeratePoomEvent cookie=%1, eventIndex=%2 nProps=%3, EventType=%4 olObjectType=%5"/>
        <string id="Publisher.StoreChange"                                    value="CTS_DBG:StoreChange:  StoreChange nProps=%1, EventType=%2 olObjectType=%3"/>
        <string id="Publisher.GroupNotification"                              value="CTS_DBG:GroupNotification: GroupNotification from POOM "/>
        <string id="Publisher.AppointmentNotification"                        value="CTS_DBG:AppointmentNotification: An appointment in default live store was modified or created"/>
        <string id="Publisher.UpdatedAggregatesSize"                          value="CTS_DBG:UpdatedAggregatesSize: UpdatedAggregatesSize UpdatedAggregatesSize=%1"/>
        <string id="Publisher.ADVISED_FOR_POOM_NOTIF"                         value="CTS_DBG:ADVISED_FOR_POOM_NOTIF: Advised for POOM notifications"/>
        <string id="Publisher.UNADVISED_FOR_POOM_NOTIF"                       value="CTS_DBG:UNADVISED_FOR_POOM_NOTIF: un-Advised for POOM notifications"/>
        <string id="Publisher.UNADVISED_FOR_POOM_GROUP_NOTIF"                 value="CTS_DBG:UNADVISED_FOR_POOM_GROUP_NOTIF: un-Advised for POOM group notifications"/>
        <string id="Publisher.UNADVISED_FOR_POOM_APPOINTMENT_NOTIF"           value="CTS_DBG:UNADVISED_FOR_POOM_APPOINTMENT_NOTIF: un-Advised for POOM appointment notifications"/>
        <string id="Publisher.GetDataReturning"                               value="CTS_DBG:GetDataReturning:  # entries=%1, Time=%2"/>
        <string id="Publisher.ACCOUNTEVENTTYPE_CHANGE_SYNCHRONIZING"          value="CTS_DBG:ACCOUNTEVENTTYPE_CHANGE_SYNCHRONIZING:  ACCOUNTEVENTTYPE_CHANGE ACCOUNTSTATUS_SYNCHRONIZING %1"/>
        <string id="Publisher.SODACALLBACK_WAIT"                              value="CTS_DBG:SODACALLBACK_WAIT: WAIT refCount = %1"/>
        <string id="Publisher.SODACALLBACK_DONE"                              value="CTS_DBG:SODACALLBACK_DONE: DONE refCount = %1"/>
        <string id="Publisher.SODACALLBACKREFRESH_ONCOMPLETE"                 value="CTS_DBG:SODACALLBACKREFRESH_ONCOMPLETE: ID = %1 Action=%2"/>
        <string id="Publisher.SODACALLBACKREFRESHIMAGEPATH_ONCOMPLETE"        value="CTS_DBG:SODACALLBACKREFRESHIMAGEPATH_ONCOMPLETE: ID = %1 Action=%2"/>
        <string id="Publisher.SODACALLBACKSNAPSHOT_ONCOMPLETE"                value="CTS_DBG:SODACALLBACKSNAPSHOT_ONCOMPLETE: ID = %1 Action=%2"/>
        <string id="Publisher.SODACALLBACKSNAPSHOT_GETSNAPSHOT"               value="CTS_DBG:SODACALLBACKSNAPSHOT_GETSNAPSHOT"/>
        <string id="Publisher.UPDATEIMAGE"                                    value="CTS_DBG:UPDATEIMAGE:  Got %1, createtime=%2 path=%3"/>
        <string id="Publisher.UPDATEIMAGE_MAKEASYNCREQUEST"                   value="CTS_DBG:UPDATEIMAGE_MAKEASYNCREQUEST:  MAKE ASYNC REQUEST to download image for %1, createtime=%2"/>
        <string id="Publisher.UnpinContactTileFromStart"                      value="CTS_DBG:UnpinContactTileFromStart: Unfav TokenId: %1, ItemId: %2"/>
        <string id="Publisher.UnpinGroupTileFromStart"                        value="CTS_DBG:UnpinGroupTileFromStart: Unfav GroupTokenId: %1"/>
        <string id="Publisher.ProcessFeed_SnapshotDone"                       value="CTS_DBG:ProcessFeed_SnapshotDone:  for fav item name=%1, id=%3, %2 items in snapshot"/>
        <string id="Publisher.ProcessFeed_CallingProcessActivity"             value="CTS_DBG:ProcessFeed_CallingProcessActivity:  for group name=%2, id=%1, Processing activity %3 of %4"/>
        <string id="Publisher.ProcessSocNotForMEToken"                        value="CTS_DBG:ProcessSocNotForMEToken:  Top SocNot Text=%1, fav item name=%2, id=%3"/>
        <string id="Publisher.ProcessActivity"                                value="CTS_DBG:ProcessActivity:  creationtime=%1, id=%2, propertyType=%3, fav item name=%4"/>
        <string id="Publisher.GetImagePath_SnapshotDone"                      value="CTS_DBG:GetImagePath_SnapshotDone:  count is %1, %2"/>
        <string id="Publisher.GetImagePath_GetPropValDone"                    value="CTS_DBG:GetImagePath_GetPropValDone:  index is %1, found=%2, path=%3"/>
        <string id="Publisher.GetImagePath_ChoosingFirstImgAvailToDownload"   value="CTS_DBG:GetImagePath_ChoosingFirstImgAvailToDownload:  index is %1, found=%2, MAKE ASYNC REQUEST"/>
        <string id="Publisher.UpdateStartFromPOOM_EventInfo"                  value="CTS_DBG:UpdateStartFromPOOM_EventInfo: ItemId=%1 TokenId=%2 EventType=%3 ObjectType=%4"/>
        <string id="Publisher.GetNextUpdateTime_PASTDUE"                      value="CTS_DBG:GetNextUpdateTime_PASTDUE:  Now=%1, NextExpireTime=%2, PASTDUE Delta=%3"/>
        <string id="Publisher.GetNextUpdateTime_FUTURE"                       value="CTS_DBG:GetNextUpdateTime_FUTURE:  Now=%1, NextExpireTime=%2, FUTURE  Delta=%3"/>
        <string id="Publisher.GetPinnedAggregates"                            value="CTS_DBG:GetPinnedAggregates: PoomAgg: %3, id=%1 namelength=%4 Picture = %2"/>
        <string id="Publisher.EnumerateAggregatesWithPicture"                 value="CTS_DBG:EnumerateAggregatesWithPicture: PIMPR_HAS_DISPLAY_PICTURE count=%1"/>
        <string id="Publisher.EnumerateGroupMembersWithPicture"               value="CTS_DBG:EnumerateGroupMembersWithPicture: PIMPR_HAS_DISPLAY_PICTURE count=%1"/>
        <string id="Publisher.UnfavoritingContactsOfAnAggregate"              value="CTS_DBG:UnfavoritingContactsOfAnAggregate:  Unfavoriting %1 contacts"/>
        <string id="Publisher.AddTile"                                        value="CTS_DBG:AddTile: AddTile %1  %2  "/>
        <string id="Publisher.PopulateTile_RemoteAggregateId"                 value="CTS_DBG:PopulateTile_RemoteAggregateId: LocalId=%1, RemoteId=%2"/>
        <string id="Publisher.PopulateTile_RemoteGroupId"                     value="CTS_DBG:PopulateTile_RemoteGroupId: LocalId=%1, RemoteId=%2"/>
        <string id="Publisher.PopulateTile_RemoteRoomId"                      value="CTS_DBG:PopulateTile_RemoteRoomId:  LocalId=%1, RemoteId=%2"/>
        <string id="Publisher.PopulateTile_ConnectTextInfo"                   value="CTS_DBG:PopulateTile_ConnectTextInfo:   ConnectText is %1"/>
        <string id="Publisher.PopulateTile_SocialText1Info"                   value="CTS_DBG:PopulateTile_SocialText1Info:   PSMDate is %1, Now is %2"/>
        <string id="Publisher.PopulateTile_SocialText2Info"                   value="CTS_DBG:PopulateTile_SocialText2Info:   PSMDate is %1, Now is %2"/>
        <string id="Publisher.UpdateToken"                                    value="CTS_DBG:UpdateToken: UpdateToken %1  %2  "/>
        <string id="Publisher.UpdateGroupToken"                               value="CTS_DBG:UpdateGroupToken: UpdateGroupToken %1  %2  "/>
        <string id="Publisher.DeleteTile"                                     value="CTS_DBG:DeleteTile: Deleting extra token %1"/>
        <string id="Publisher.CopyTileImage"                                  value="CTS_DBG:CopyTileImage:  CopyFile(%1,%2)==%3 (%4)"/>
        <string id="Publisher.GetTokenInfo"                                   value="CTS_DBG:GetTokenInfo: TokenId=%1 ItemId=%2 PSMDate=%3, PhotoDate=%4, name=%5, Picture=%6, IsFav=%7, PSM=%8"/>
        <string id="Publisher.SkippingSocial"                                 value="CTS_DBG:OversizedGroup: Skipping social updates %1  %2  "/>
        <string id="Publisher.SkippingConnect"                                value="CTS_DBG:OversizedGroup: Skipping connect text %1  %2  "/>
        <string id="Publisher.PopulateMixViewInfo"                            value="CTS_DBG:PopulateMixViewInfo: TokenId=%1 ItemId=%2 "/>
        <string id="Publisher.DBG_MixView_Content"                            value="CTS_DBG:Populate slot %1 with text=%2, image=%3, uri=%4."/>
        <string id="Publisher.DBG_MixView_FetchImage"                         value="CTS_DBG:MixView image fetched, found %1 app images, %2 feed images"/>
        <string id="Publisher.DBG_MixView_RefreshImage"                       value="CTS_DBG:MixView refreshing app images, last refresh was %1"/>
        <string id="Publisher.DBG_TileTaskParamsEmptyItemId"                  value="CTS_DBG:Tile empty OLITEMID: TaskURI: %1, TaskParams: %2"/>

        <string id="Publisher.Rooms_ProcessContentNotifications" value="Rooms: Processing content change notifications"/>
        <string id="Publisher.Rooms_SyncRoomContentIfRefreshable" value="Rooms: Syncing room content if refreshable"/>
        <string id="Publisher.Rooms_ClearUnseenCount" value="Rooms: Clearing unseen count"/>
        <string id="Publisher.Rooms_PopulateRoomTile" value="Rooms: Populating room tile"/>
        <string id="Publisher.Rooms_GetRoomTokenInfo" value="Rooms: Getting room token info"/>
        <string id="Publisher.Rooms_Chat_UnseenCount" value="Rooms: %1 unseen chat messages"/>
        <string id="Publisher.Rooms_Photos_UnseenCount" value="Rooms: %1 unseen photos"/>
        <string id="Publisher.Rooms_Calendar_UnseenCount" value="Rooms: %1 unseen calendar events"/>
        <string id="Publisher.Rooms_Notes_UnseenCount" value="Rooms: %1 unseen notes"/>
        <string id="Publisher.Rooms_MembershipChangeText" value="Rooms: Membership change text length = %1"/>
        <string id="Publisher.Rooms_NotesUnexpectedFile" value="Rooms: Unexpected file in notes directory [%1]"/>
        <string id="Publisher.Rooms_ReplacedDefaultRoomTile" value="Rooms: Replaced default room tile on start with an activated room"/>
        <string id="Publisher.Rooms_RegisteredRoomsFound" value="Rooms: Found %1 Rooms registered with the share picker"/>
        <string id="Publisher.Rooms_RegisteredRoomDeleted" value="Rooms: Room with ID: %1 unregistered from Share Picker"/>
        <string id="Publisher.Rooms_RoomRegistered" value="Rooms: Room with ID: %1 registered with Share Picker"/>
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>

