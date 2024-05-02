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
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-ConnMgrLogPublisher"
          guid="{B1B4D6D9-2E22-440a-9F8D-9B6DEF3DD00D}"
          symbol="MICROSOFT_WINDOWSPHONE_CONNMGR_PUBLISHER"
          resourceFileName="CmService.dll"
          messageFileName="CmService.dll">

        <!--Dont need to specify channels in Apollo -->
        <channels />

        <!--Kewords for ConnMgr Name Space -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error"       message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Info"        message="$(string.Keyword.Info)" />
          <keyword mask="0x0000000000000008" name="Connect"     message="$(string.Keyword.Connect)" />	<!-- DEBUGMSG(ZONE_CONNECT -->
          <keyword mask="0x0000000000000010" name="Notify"      message="$(string.Keyword.Notify)" />	<!-- DEBUGMSG(ZONE_NOTIFY -->
          
        </keywords>

        <!--Value to string maps for enumeration values -->
        <maps>

          <valueMap name="PolicyType">
            <map value="0" message="$(string.PolicyType.CMPT_CONNECTION_MAPPINGS)" />
            <map value="1" message="$(string.PolicyType.CMPT_ROAMING_CONNECTIONS)" />
            <map value="2" message="$(string.PolicyType.CMPT_DISABLED_CONNECTIONS)" />
            <map value="3" message="$(string.PolicyType.CMPT_EXCLUSIVE_CONNECTIONS)" />
          </valueMap>            
            
          <valueMap name="Result">
            <map value="0" message="$(string.Result.CMRE_SUCCESS)" />
            <map value="13000" message="$(string.Result.CMRE_INVALID_REQUIREMENTS)" />
            <map value="13001" message="$(string.Result.CMRE_INVALID_PREFERENCES)" />
            <map value="13002" message="$(string.Result.CMRE_INVALID_SESSION)" />
            <map value="13003" message="$(string.Result.CMRE_INVALID_CONNECTION)" />
            <map value="13004" message="$(string.Result.CMRE_INVALID_CONNECTION_TYPE)" />
            <map value="13005" message="$(string.Result.CMRE_INVALID_DEVICE)" />
            <map value="13006" message="$(string.Result.CMRE_INVALID_PARAMETER)" />
            <map value="13007" message="$(string.Result.CMRE_INVALID_VERSION)" />
            <map value="13008" message="$(string.Result.CMRE_INVALID_HOST)" />
            <map value="13009" message="$(string.Result.CMRE_INCONSISTENT_CONFIGURATION)" />
            <map value="13010" message="$(string.Result.CMRE_INSUFFICIENT_BUFFER)" />
            <map value="13011" message="$(string.Result.CMRE_CONNECTION_ITERATION_NOT_STARTED)" />
            <map value="13012" message="$(string.Result.CMRE_NO_CONNECTIONS)" />
            <map value="13013" message="$(string.Result.CMRE_HOST_ADDRESS_ITERATION_NOT_STARTED)" />
            <map value="13014" message="$(string.Result.CMRE_NO_HOST_ADDRESSES)" />
            <map value="13015" message="$(string.Result.CMRE_CONNECTION_ACQUIRE_FAILED)" />
            <map value="13016" message="$(string.Result.CMRE_CONNECTION_RESOURCE_CONFLICT)" />
            <map value="13017" message="$(string.Result.CMRE_CONNECTION_ALREADY_ACQUIRED)" />
            <map value="13018" message="$(string.Result.CMRE_CONNECTION_NOT_ACQUIRED)" />
            <map value="13019" message="$(string.Result.CMRE_CONNECTION_NOT_RELEASED)" />
            <map value="13020" message="$(string.Result.CMRE_CONNECTION_RELEASE_FAILED)" />
            <map value="13021" message="$(string.Result.CMRE_CONNECTION_ALREADY_EXISTS)" />
            <map value="13022" message="$(string.Result.CMRE_CONNECTION_DOES_NOT_EXIST)" />
            <map value="13023" message="$(string.Result.CMRE_CONNECTION_AUTHENTICATION_FAILED)" />
            <map value="13024" message="$(string.Result.CMRE_NOT_ALLOWED)" />
            <map value="13025" message="$(string.Result.CMRE_NO_NOTIFICATIONS)" />
            <map value="13026" message="$(string.Result.CMRE_NO_POLICIES)" />
            <map value="13027" message="$(string.Result.CMRE_OUT_OF_MEMORY)" />
            <map value="13028" message="$(string.Result.CMRE_PENDING)" />
            <map value="13029" message="$(string.Result.CMRE_ACCESS_DENIED)" />
            <map value="13030" message="$(string.Result.CMRE_NOT_SUPPORTED)" />
            <map value="13031" message="$(string.Result.CMRE_NOT_IMPLEMENTED)" />
            <map value="13032" message="$(string.Result.CMRE_UNEXPECTED)" />
            <map value="13033" message="$(string.Result.CMRE_NOT_INITIALIZED)" />
            <map value="13034" message="$(string.Result.CMRE_CONNECTION_FAILED_TO_ASSOCIATE)" />
            <map value="13035" message="$(string.Result.CMRE_CONNECTION_IP_NOT_FOUND)" />
            <map value="13036" message="$(string.Result.CMRE_SERVICE_UNAVAILABLE)" />
          </valueMap>

          <valueMap name="ActivityState">
            <map value="0" message="$(string.ActivityState.CMDS_UNKNOWN)" />
            <map value="1" message="$(string.ActivityState.CMDS_DORMANT)" />
            <map value="2" message="$(string.ActivityState.CMDS_ACTIVE)" />
          </valueMap>

          <valueMap name="Characteristic">
            <map value="0" message="$(string.Characteristic.CMCH_BANDWIDTH_KBITPS)" />
            <map value="1" message="$(string.Characteristic.CMCH_ROAMING)" />
            <map value="2" message="$(string.Characteristic.CMCH_PERSISTENT)" />
            <map value="3" message="$(string.Characteristic.CMCH_CELLULAR)" />
            <map value="4" message="$(string.Characteristic.CMCH_DATA_PLAN_STATE)" />
            <map value="5" message="$(string.Characteristic.CMCH_VOICECALL_CONFLICT_STATE)" />
            <map value="6" message="$(string.Characteristic.CMCH_CLAIMED)" />
            <map value="7" message="$(string.Characteristic.CMCH_EXECUTOR)" />
          </valueMap>
          
          <valueMap name="RequirementOp">
            <map value="0" message="$(string.RequirementOp.CMRO_LESS_OR_EQUAL)" />
            <map value="1" message="$(string.RequirementOp.CMRO_GREATER_OR_EQUAL)" />
            <map value="2" message="$(string.RequirementOp.CMRO_EQUAL)" />
            <map value="3" message="$(string.RequirementOp.CMRO_NOT_EQUAL)" />
            <map value="4" message="$(string.Operator.INVALID)" />
          </valueMap>
          
          <valueMap name="PreferenceOp">
            <map value="0" message="$(string.PreferenceOp.CMPO_LOWEST)" />
            <map value="1" message="$(string.PreferenceOp.CMPO_HIGHEST)" />
            <map value="2" message="$(string.PreferenceOp.CMPO_LESS_OR_EQUAL)" />
            <map value="3" message="$(string.PreferenceOp.CMPO_GREATER_OR_EQUAL)" />
            <map value="4" message="$(string.PreferenceOp.CMPO_EQUAL)" />
            <map value="5" message="$(string.PreferenceOp.CMPO_NOT_EQUAL)" />
            <map value="6" message="$(string.Operator.INVALID)" />
          </valueMap>

          <valueMap name="ConnectionState">
            <map value="0" message="$(string.ConnectionState.CMCS_DISCONNECTED)" />
            <map value="1" message="$(string.ConnectionState.CMCS_DISCONNECTED_UNAVAILABLE)" />
            <map value="2" message="$(string.ConnectionState.CMCS_DISCONNECTED_DISABLED)" />
            <map value="100" message="$(string.ConnectionState.CMCS_CONNECTING)" />
            <map value="101" message="$(string.ConnectionState.CMCS_CONNECTING_ASSOCIATING)" />
            <map value="102" message="$(string.ConnectionState.CMCS_CONNECTING_AUTHENTICATING)" />
            <map value="103" message="$(string.ConnectionState.CMCS_CONNECTING_WAITING_FOR_IP)" />
            <map value="200" message="$(string.ConnectionState.CMCS_CONNECTED)" />
            <map value="300" message="$(string.ConnectionState.CMCS_SUSPENDED)" />
            <map value="400" message="$(string.ConnectionState.CMCS_DISCONNECTING)" />
          </valueMap>

          <valueMap name="FsmState">
            <map value="0" message="$(string.FsmState.sInvalid)" />
            <map value="1" message="$(string.FsmState.sDisdUnavCsp)" />
            <map value="2" message="$(string.FsmState.sDisdUnavRm)" />
            <map value="3" message="$(string.FsmState.sDisdUnavCspRm)" />
            <map value="4" message="$(string.FsmState.sDisdUnavClaim)" />
            <map value="5" message="$(string.FsmState.sDisd)" />
            <map value="6" message="$(string.FsmState.sCong)" />
            <map value="7" message="$(string.FsmState.sCongSuspdRm)" />
            <map value="8" message="$(string.FsmState.sCongSuspdRmUnavCsp)" />
            <map value="9" message="$(string.FsmState.sCongSuspdRmUnavRm)" />
            <map value="10" message="$(string.FsmState.sCongSuspdRmUnavCspRm)" />
            <map value="11" message="$(string.FsmState.sCongUnavCsp)" />
            <map value="12" message="$(string.FsmState.sCongUnavRm)" />
            <map value="13" message="$(string.FsmState.sCongUnavCspRm)" />
            <map value="14" message="$(string.FsmState.sCongAsscg)" />
            <map value="15" message="$(string.FsmState.sCongAuthg)" />
            <map value="16" message="$(string.FsmState.sCongWtgIp)" />
            <map value="17" message="$(string.FsmState.sCond)" />
            <map value="18" message="$(string.FsmState.sCondUnavRm)" />
            <map value="19" message="$(string.FsmState.sCondClaim)" />
            <map value="20" message="$(string.FsmState.sSuspdRm)" />
            <map value="21" message="$(string.FsmState.sSuspdRmUnavRm)" />
            <map value="22" message="$(string.FsmState.sDisg)" />
            <map value="23" message="$(string.FsmState.sDisgUnavCsp)" />
            <map value="24" message="$(string.FsmState.sDisgUnavRm)" />
            <map value="25" message="$(string.FsmState.sDisgUnavCspRm)" />
          </valueMap>

          <valueMap name="FsmResult">
            <map value="0" message="$(string.FsmResult.trTransitioned)" />
            <map value="1" message="$(string.FsmResult.trAlreadyInWantedState)" />
            <map value="2" message="$(string.FsmResult.trInvalidAction)" />
            <map value="3" message="$(string.FsmResult.trRetryLater)" />
          </valueMap>
          
          <valueMap name="CmCspInitResult">
            <map value="0" message="$(string.CmCspInitResult.rCspInit_Success)" />
            <map value="1" message="$(string.CmCspInitResult.rCspInit_LoadLibrary_Failure)" />
            <map value="2" message="$(string.CmCspInitResult.rCspInit_GetProcAddress_Failure)" />
          </valueMap>

          <valueMap name="CmRPCRegisterType">
            <map value="0" message="$(string.CmRPCRegisterType.Interface)" />
            <map value="1" message="$(string.CmRPCRegisterType.EndPoint)" />
          </valueMap>

        </maps>

        <!--Event Templates-->
        <templates>
          <template tid="Template_ServiceInit">
            <data name="Prop_InitTimeMs" inType="win:UInt32" />
          </template>

          <template tid="Template_ServiceRPCRegisterFailure">
            <data name="Prop_InterfaceName" inType="win:UnicodeString" />
            <data name="Prop_registerType" inType="win:UInt32" map="CmRPCRegisterType" />
            <data name="Prop_NTSTATUS" inType="win:UInt32" />
          </template>   

          <template tid="Template_ServiceInitIndividualCsp">
            <data name="Prop_CspName" inType="win:UnicodeString" />
            <data name="Prop_InitTimeMs" inType="win:UInt32" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />              
          </template>

          <template tid="Template_CspInitComplete">
              <data name="Prop_CspName" inType="win:UnicodeString" />
              <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>

          <template tid="Template_CspInitError">
              <data name="Prop_CspName" inType="win:UnicodeString" />
          </template>

            <!--For backward compatibility -->
          <template tid="Template_CandidateConnectionsHeader">
            <data name="Prop_ProcessName" inType="win:UnicodeString" />
            <data name="Prop_ProcessID" inType="win:UInt32" />
            <data name="Prop_AccountID" inType="win:UInt32" />
            <data name="Prop_Reqs" inType="win:UInt16" />
            <data name="Prop_Prefs" inType="win:UInt16" />
            <data name="Prop_NumConnections" inType="win:UInt16" />
          </template>

          <template tid="Template_CandidateConnectionsHeader2">
            <data name="Prop_ProcessName" inType="win:UnicodeString" />
            <data name="Prop_ProcessID" inType="win:UInt32" />
            <data name="Prop_Reqs" inType="win:Boolean" />
            <data name="Prop_Prefs" inType="win:Boolean" />
            <data name="Prop_Host" inType="win:UnicodeString" />            
            <data name="Prop_NumConnections" inType="win:UInt8" />
          </template>

          <template tid="Template_CandidateConnectionsBody">
            <data name="Prop_ConnectionID" inType="win:UInt32" />
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_IsConnected" inType="win:UInt16" />
            <data name="Prop_ConnectionInterfaceIndex" inType="win:HexInt32" />
          </template>

          <template tid="Template_CandidateConnectionsFooter">
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>
          
          <template tid="Template_ConfigConnection">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_ConnectionID" inType="win:UInt32" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>

          <template tid="Template_AddConnectionPendingCsp">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>

          <template tid="Template_AcquireReleaseConnection">
            <data name="Prop_ProcessID" inType="win:UInt32" />
            <data name="Prop_ConnectionID" inType="win:UInt32" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>

          <template tid="Template_AcquireConnectionAsync">
            <data name="Prop_ProcessID" inType="win:UInt32" />
            <data name="Prop_ConnectionID" inType="win:UInt32" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
            <data name="Prop_RequestHandle" inType="win:UInt32" />
          </template>

          <template tid="Template_CloseAsyncAcquire">
            <data name="Prop_ProcessID" inType="win:UInt32" />
            <data name="Prop_RequestHandle" inType="win:UInt32" />
          </template>          

          <template tid="Template_ClaimConnection">
            <data name="Prop_Adapter" inType="win:UnicodeString" />
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_ConnectionID" inType="win:UInt32" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>

          <template tid="Template_UnclaimedConnection">
            <data name="Prop_Adapter" inType="win:UnicodeString" />
          </template>

          <template tid="Template_SetDataActivityState">
            <data name="Prop_ProcessID" inType="win:UInt32" />
            <data name="Prop_ConnectionID" inType="win:UInt32" />
            <data name="Prop_ConnectionAlias" inType="win:HexInt32" />
            <data name="Prop_ActivityStateCurrent" inType="win:UInt16" map="ActivityState" />
            <data name="Prop_ActivityStateNew" inType="win:UInt16" map="ActivityState" /> 
          </template>

          <template tid="Template_SetDataActivityStateToCsp">
            <data name="Prop_ConnectionAlias" inType="win:HexInt32" />
            <data name="Prop_Delay" inType="win:UInt32" />
            <data name="Prop_ActivityState" inType="win:UInt16" map="ActivityState" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>

          <!--For backward compatibility -->
          <template tid="Template_CharacteristicUpdate">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_ConnectionID" inType="win:UInt32" />
            <data name="Prop_CharacteristicName" inType="win:UnicodeString" />
            <data name="Prop_CharacteristicValueCurrent" inType="win:UInt32" />
            <data name="Prop_CharacteristicValueNew" inType="win:UInt32" />
          </template>

          <template tid="Template_CharacteristicUpdate2">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_ConnectionID" inType="win:UInt32" />
            <data name="Prop_CharacteristicName" inType="win:UInt8" map="Characteristic" />
            <data name="Prop_CharacteristicValueCurrent" inType="win:UInt32" />
            <data name="Prop_CharacteristicValueNew" inType="win:UInt32" />
          </template>

          <template tid="Template_ConnectionStateChange">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_ConnectionDescription" inType="win:UnicodeString" />
            <data name="Prop_ConnectionID" inType="win:UInt32" />
            <data name="Prop_ConnectionStateCurrent" inType="win:UInt16" map="ConnectionState" />
            <data name="Prop_ConnectionStateNew" inType="win:UInt16" map="ConnectionState" />
          </template>

          <template tid="Template_ConnectDisconnectConnectionAtCsp">
            <data name="Prop_ConnectionAlias" inType="win:HexInt32" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>

          <template tid="Template_ConnectionStateChangeInternal">
            <data name="Prop_ConnectionAlias" inType="win:HexInt32" />
            <data name="Prop_Action" inType="win:UInt16" />
            <data name="Prop_FsmStateCurrent" inType="win:UInt16" map="FsmState" />
            <data name="Prop_FsmStateNew" inType="win:UInt16" map="FsmState" />
            <data name="Prop_FsmResult" inType="win:UInt16" map="FsmResult" />
          </template>

          <template tid="Template_ConnectionConnectConnection">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_CspConnectionName" inType="win:UnicodeString" />            
          </template>

          <template tid="Template_ConnectionDisconnectConnection">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_CspConnectionName" inType="win:UnicodeString" />
          </template>

          <template tid="Template_ConnectionConfigRetryNow">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_RetryNow" inType="win:Boolean" />
          </template> 

          <template tid="Template_CmCspInit">
            <data name="Prop_VerboseResult" inType="win:UInt32" map="CmCspInitResult" />
            <data name="Prop_LibraryName" inType="win:UnicodeString" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>
          
          <template tid="Template_CmCspCancelPendingConnect">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>          
          
          <template tid="Template_CmCspEnableConnection">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
            <data name="Prop_Enabled" inType="win:Boolean" />
          </template>

          <template tid="Template_CmCspConnectionConfigMigrateNeeded">
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
            <data name="Prop_MigrateNeeded" inType="win:Boolean" />
          </template>     

          <template tid="Template_CmCspMigrateConnectionConfig">
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>

          <template tid="Template_CmCspSetNetworkQuietMode">
              <data name="Prop_CspName" inType="win:UnicodeString" />
              <data name="Prop_Result" inType="win:UInt32" map="Result" />
              <data name="Prop_NetworkQuietMode" inType="win:Boolean" />
          </template>            

          <template tid="Template_CmCspSetDataActivityState">
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
            <data name="Prop_ActivityState" inType="win:UInt16" map="ActivityState" />
            <data name="Prop_Delay" inType="win:UInt32" />
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
          </template>
          
          <template tid="Template_CmConnectionStateAdd">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>
          
          <template tid="Template_CmConnectionStateUpdate">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_Owner" inType="win:HexInt32" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>
          
          <template tid="Template_CmConnectionStateDeleteAndDelRef">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>
          
          <template tid="Template_CmConnectionStateGetInfo">
            <data name="Prop_ConnectionState" inType="win:UInt16" map="ConnectionState" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>
          
          <template tid="Template_CmConnectionStateAddRemoveUserFailed">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
          </template>
          
          <template tid="Template_CmConnectionStateConnectDisconnect">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>

          <template tid="Template_ConnectFailureDueToThrottling">
            <data name="Prop_IsScreenOn" inType="win:Boolean" />
            <data name="Prop_NoOfFailedAttempts" inType="win:UInt32" />
            <data name="Prop_IsInThrottlingInterval" inType="win:Boolean" />
            <data name="Prop_IsBarred" inType="win:Boolean" />
          </template>          

          <template tid="Template_CmResourceAddRmvResourceIdListener">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
          </template>
          
          <template tid="Template_CmConnectionAddConfig">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>
          
          <template tid="Template_CmServiceInitCsps">
            <data name="Prop_CountCSPs" inType="win:UInt32" />
            <data name="Prop_CountTotalCSPs" inType="win:UInt32"/>
          </template>

          <template tid="Template_CmServiceInitOpenProcessTokenFailure">
            <data name="Prop_Error" inType="win:UInt32" />
          </template>

          <template tid="Template_CmServiceInitSetPrivelegeFailure">
            <data name="Prop_Error" inType="win:UInt32" />
          </template>

          <template tid="Template_CmServiceRmInitializeFailure">
            <data name="Prop_Error" inType="win:UInt32" />
          </template>

          <template tid="Template_CmServicePersistConfigAddDel">
            <data name="Prop_Entry" inType="win:UnicodeString" />
            <data name="Prop_FlagResult" inType="win:Boolean" />
            <data name="Prop_FlagFlush" inType="win:Boolean" />
          </template>

          <template tid="Template_CmServicePersistConfigIncompatibleVersion">
            <data name="Name" inType="win:UnicodeString" />
            <data name="PersistedVersion" inType="win:UInt32" />
            <data name="PersistedSize" inType="win:UInt32" />
            <data name="CurrentVersion" inType="win:UInt32" />
          </template>

          <template tid="Template_CmServicePersistConfigMigrateError">
            <data name="Name" inType="win:UnicodeString" />
            <data name="PersistedVersion" inType="win:UInt32" />
            <data name="PersistedSize" inType="win:UInt32" />
            <data name="CurrentVersion" inType="win:UInt32" />
            <data name="Result" inType="win:UInt32" map="Result" />
          </template>

          <template tid="Template_CmServicePersistPolicyIncompatibleVersion">
            <data name="PolicyType" inType="win:UInt32" />
            <data name="PersistedVersion" inType="win:UInt32" />
            <data name="PersistedSize" inType="win:UInt32" />
            <data name="CurrentVersion" inType="win:UInt32" />
          </template>

          <template tid="Template_CmServiceSortConnectionsByPolicy">
            <data name="Prop_AcctId" inType="win:UnicodeString" />
            <data name="Prop_Host" inType="win:UnicodeString" />
            <data name="Prop_FlagFound" inType="win:Boolean" />
          </template>
          
          <template tid="Template_CmServicePrintRequirements">
            <data name="Prop_Id" inType="win:UInt32"/>
            <data name="Prop_Total" inType="win:UInt32"/>
            <data name="Prop_CharacteristicName" inType="win:UInt8" map="Characteristic" />
            <data name="Prop_RequirementOp" inType="win:UInt8" map="RequirementOp" />
            <data name="Prop_Value" inType="win:UInt32" />
          </template>
          
          <template tid="Template_CmServicePrintPreferences">
            <data name="Prop_Id" inType="win:UInt32"/>
            <data name="Prop_Total" inType="win:UInt32"/>
            <data name="Prop_CharacteristicName" inType="win:UInt8" map="Characteristic" />
            <data name="Prop_PreferenceOp" inType="win:UInt8" map="PreferenceOp" />
            <data name="Prop_Value" inType="win:UInt32" />
          </template>
          
          <template tid="Template_CmServiceAcquireConnectionByInterfaceIndex">
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>
          
          <template tid="Template_CmServiceAcquireIfMatched">
            <data name="Prop_Result" inType="win:UInt32" map="Result" />
          </template>

          <template tid="Template_CmServiceGetDetailsIpAddr">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_ConnectionState" inType="win:UInt16" map="ConnectionState" />
            <data name="Prop_AdapterName" inType="win:UnicodeString" />
            <data name="Prop_ConnectionInterfaceIndex" inType="win:HexInt32" />
            <data name="Prop_ConnectionInterfaceType" inType="win:HexInt32" />
            <data name="Prop_SourceAddrCount" inType="win:UInt32" />
          </template>

          <template tid="Template_CmServiceIpAddrAdapterInfo">
            <data name="Prop_AdapterName" inType="win:AnsiString" />
            <data name="Prop_AdapterFriendlyName" inType="win:UnicodeString" />
            <data name="Prop_ConnectionInterfaceIndex" inType="win:HexInt32" />
            <data name="Prop_OperStatus" inType="win:UInt32" />
            <data name="Prop_IsUnicastAddrAvailable" inType="win:Boolean" />
          </template>

          <template tid="Template_CmServiceGetAdapterAddressResult">
            <data name="Error" inType="win:Int32"/>
          </template>

          <template tid="Template_CmServiceInvalidParameter">
            <data name="Para1" inType="win:Pointer" outType="win:HexInt64"/>
            <data name="Para2" inType="win:Pointer" outType="win:HexInt64"/>
            <data name="Para3" inType="win:Pointer" outType="win:HexInt64"/>
            <data name="Para4" inType="win:Int32" outType="xs:int"/>
          </template>

          <template tid="Template_CmServiceGetNotificationNoRegistration">
            <data name="hListener" inType="win:Pointer" outType="win:HexInt64"/>
          </template>

          <template tid="Template_CmServiceQueuedNotificationToListeners">
            <data name="NotifType" inType="win:UInt32" outType="xs:unsignedInt"/>
            <data name="ListenerCount" inType="win:UInt32" outType="xs:unsignedInt"/>
            <data name="Error" inType="win:Int32"/>
          </template>

          <template tid="Template_InitGlobalsWnfConnectedState">
            <data name="Error" inType="win:Int32"/>
          </template>

          <template tid="Template_UpdateWnfConnectedState">
            <data name="RadioOrNonCellularConnectedState" inType="win:Boolean"/>
            <data name="RadioActivity" inType="win:Boolean"/>
            <data name="NonCellularConnected" inType="win:Boolean"/>
          </template>
          
          <template tid="Template_CmServiceNetworkStateChangeTimerProc">
            <data name="EventData" inType="win:UInt32" outType="xs:HexInt32"/>
            <data name="WnfError" inType="win:UInt32" outType="xs:unsignedInt"/>
          </template>

          <template tid="Template_CmServiceNetworkStateChangeEnqueue">
            <data name="EventData" inType="win:UInt32" outType="xs:HexInt32"/>
          </template>

          <template tid="Template_PublishWnfStateError">
            <data name="Error" inType="win:Int32"/>
          </template>
          
          <template tid="Template_ClientAccountInfo">
            <data name="AccountName" inType="win:UnicodeString"/>
            <data name="ProcessID" inType="win:UInt32" />
          </template>
          
          <template tid="Template_CmServiceAlwaysConnectedScheduleWI">
            <data name="WI" inType="win:HexInt32"/>
            <data name="TypeStr" inType="win:UnicodeString"/>
            <data name="ConnName" inType="win:UnicodeString"/>
            <data name="ConnId" inType="win:UInt32"/>
            <data name="DelayMs" inType="win:UInt32"/>
          </template>
          
          <template tid="Template_CmServiceAlwaysConnectedReconnect">
            <data name="ConnName" inType="win:UnicodeString"/>
            <data name="ConnId" inType="win:UInt32"/>
            <data name="Acquired" inType="win:Boolean"/>
            <data name="Connected" inType="win:Boolean"/>
            <data name="AllowCancel" inType="win:Boolean"/>
            <data name="AdvanceSched" inType="win:Boolean"/>
            <data name="ResetSched" inType="win:Boolean"/>
          </template>
          
          <template tid="Template_CmServiceAlwaysConnectedProcessWI">
            <data name="WI" inType="win:HexInt32"/>
            <data name="TypeStr" inType="win:UnicodeString"/>
            <data name="ConnName" inType="win:UnicodeString"/>
            <data name="ConnId" inType="win:UInt32"/>
          </template>
          
          <template tid="Template_CmServiceRaiseAutoConnectPriority">
            <data name="ConnName" inType="win:UnicodeString" />
            <data name="Result" inType="win:UInt32" map="Result" />
          </template>
          
          <template tid="Template_ServiceInitWSAStartup">
            <data name="Error" inType="win:Int32"/>
          </template>
          
          <template tid="Template_ServiceInitAddConfigFailure">
            <data name="ConnEntry" inType="win:UnicodeString" />
            <data name="Result" inType="win:UInt32" map="Result" />
          </template>

          <template tid="Template_PdcClientRegistration">
            <data name="Status" inType="win:UInt32" />
          </template>
            
          <template tid="Template_PdcClientCallback">
            <data name="NqmState" inType="win:Boolean" />
          </template>

          <template tid="Template_PdcActivationClientRegistration">
            <data name="Status" inType="win:HexInt32" />
          </template>

          <template tid="Template_PdcActivationClientActivityRequest">
            <data name="Activity" inType="win:Boolean" />
            <data name="Status" inType="win:HexInt32" />
          </template>

          <template tid="Template_CmSetNetworkReference">
            <data name="Activate" inType="win:Boolean" />
            <data name="Result" inType="win:UInt32" map="Result" />
            <data name="TotalNetworkRefCount" inType="win:UInt32"/>
            <data name="ProcessId" inType="win:UInt32"/>
            <data name="ProcessNetworkRefCount" inType="win:UInt32"/>
            <data name="AppName" inType="win:UnicodeString"/>
          </template>

          <template tid="Template_CmReleaseNetworkReferenceInProcess">
            <data name="ProcessId" inType="win:UInt32"/>
            <data name="ProcessNetworkRefCount" inType="win:UInt32"/>
            <data name="TotalNetworkRefCount" inType="win:UInt32"/>
          </template>

          <template tid="Template_CmAcquireReleaseNdisReference">
            <data name="Result" inType="win:UInt32" map="Result" />
            <data name="TotalCmNdisRefCount" inType="win:UInt32"/>
            <data name="ProcessId" inType="win:UInt32"/>
            <data name="PerProcessCmNdisRefCount" inType="win:UInt32"/>
            <data name="AppName" inType="win:UnicodeString"/>
          </template>

          <template tid="Template_CmNdisReferenceError">
            <data name="FunctionName" inType="win:UnicodeString" />
            <data name="Error" inType="win:UInt32" />
          </template>

          <template tid="Template_CmReleaseNdisReferenceInProcess">
            <data name="ProcessId" inType="win:UInt32"/>
            <data name="ProcessNetworkRefCount" inType="win:UInt32"/>
            <data name="TotalNetworkRefCount" inType="win:UInt32"/>
          </template>
            
          <template tid="Template_CmNdisReferenceIoctlResult">
            <data name="Acquire-Release" inType="win:UnicodeString" />
            <data name="InterfaceLuid" inType="win:UInt64" outType="xs:HexInt64"/>            
            <data name="Result" inType="win:UInt32" />
          </template>            

          <template tid="Template_CmServiceGetCallerToken">
            <data name="Prop_Error" inType="win:HexInt32" />
          </template>

          <template tid="Template_UpdatePolicy">
            <data name="PolicyType" inType="win:UInt32" map="PolicyType" />
            <data name="Result" inType="win:HexInt32" map="Result" />
          </template>

          <template tid="Template_MappingsPolicyKey">
            <data name="ClientType" inType="win:UInt32" />
            <data name="Account" inType="win:UnicodeString" />
            <data name="Host" inType="win:UnicodeString" />
          </template>
            
          <template tid="Template_FilterConnectionsByMappingsPolicy">
            <data name="Connection" inType="win:UnicodeString" />
            <data name="PolicyRequired" inType="win:Boolean" />
            <data name="MatchPolicyData" inType="win:Boolean" />
          </template>            

          <template tid="Template_ResultAsHRESULT">
            <data name="HRESULT" inType="win:HexInt32" />
          </template>

          <template tid="Template_ResultAsCM_RESULT">
            <data name="HRESULT" inType="win:HexInt32" />
          </template>

          <template tid="Template_FirewallIdResult">
            <data name="RuleId" inType="win:UnicodeString" />
            <data name="HRESULT" inType="win:HexInt32" />
          </template> 

          <template tid="Template_FirewallApplyChange">
            <data name="RuleId" inType="win:UnicodeString" />
            <data name="Change" inType="win:HexInt32" />
            <data name="HRESULT" inType="win:HexInt32" />
          </template>  

          <template tid="Template_ValueChange">
            <data name="PreviousValue" inType="win:UInt32"/>
            <data name="NewValue" inType="win:UInt32"/>
            <data name="Result" inType="win:HexInt32" map="Result" />
          </template>

          <template tid="Template_AddZeroRatedClient">
            <data name="AccountId" inType="win:UnicodeString" />
            <data name="sid" inType="win:UnicodeString" />
            <data name="fIsPackageSid" inType="win:Boolean" />
            <data name="Result" inType="win:HexInt32" map="Result" />
          </template>  

          <template tid="Template_RemoveZeroRatedClient">
            <data name="AccountId" inType="win:UnicodeString" />
            <data name="sid" inType="win:UnicodeString" />
            <data name="Result" inType="win:HexInt32" map="Result" />
          </template>  

          <template tid="Template_ZeroRateHandler">
            <data name="Request" inType="win:Boolean" />
            <data name="EnforcementState" inType="win:UInt32"/>
            <data name="Result" inType="win:HexInt32" map="Result" />
          </template>

          <template tid="Template_ZeroRateZeroRatedConnection">
            <data name="ConnectionName" inType="win:UnicodeString" />
          </template>

          <template tid="Template_RemoveAllZeroRatedClients">
            <data name="RemoveMappingsResult" inType="win:HexInt32" map="Result" />
            <data name="RemoveFWRulesResult" inType="win:HexInt32" map="Result" />
          </template>

          <template tid="Template_CmServiceTimerQueueEnqueue">
            <data name="WorkItemHandle" inType="win:HexInt32" />
            <data name="WaitToRunMs" inType="win:UInt32" />
          </template>

          <template tid="Template_CmServiceTimerQueueCancel">
            <data name="WorkItemHandle" inType="win:HexInt32" />
            <data name="Cancelled" inType="win:Boolean" />
          </template>

          <template tid="Template_CmServiceTimerQueueItemCompleted">
            <data name="WorkItemHandle" inType="win:HexInt32" />
          </template>

        </templates>

        <!--All the Events that can be published by this Publisher -->
        <events>
          <event value="1"
              level="win:Informational"
              template="Template_ServiceInit"
              keywords="Info"
              symbol="CM_SERVICE_INIT"
              message="$(string.ServiceInit)" />

          <event value="2"
              level="win:Error"
              template="Template_ServiceRPCRegisterFailure"
              keywords="Error"
              symbol="CM_SERVICE_RPC_REGISTER_INTERFACE_FAILURE"
              message="$(string.RpcRegisterInterfaceFailure)" />

          <event value="3"
              level="win:Error"
              template="Template_ServiceRPCRegisterFailure"
              keywords="Error"
              symbol="CM_SERVICE_RPC_UNREGISTER_INTERFACE_FAILURE"
              message="$(string.RpcUnregisterInterfaceFailure)" />

          <event value="4"
              level="win:Informational"
              keywords="Info"
              symbol="CM_SERVICE_DEINIT_START"
              message="$(string.ServiceDeinitStart)" />

          <event value="5"
              level="win:Informational"
              keywords="Info"
              symbol="CM_SERVICE_DEINIT_COMPLETE"
              message="$(string.ServiceDeinitComplete)" />

          <event value="6"
              level="win:Informational"
              keywords="Info"
              symbol="CM_SERVICE_DEINIT_CONNECTIONS_CLEANUP"
              message="$(string.ServiceDeinitConnectionsCleanup)" />

          <event value="7"
              level="win:Informational"
              keywords="Info"
              symbol="CM_SERVICE_DEINIT_DELETED_CONNECTIONS_CLEANUP"
              message="$(string.ServiceDeinitDeletedConnectionsCleanup)" />            

            <!--For backward compatibility -->
          <event value="100"
              level="win:Informational"
              template="Template_CandidateConnectionsHeader"
              keywords="Info"
              symbol="CM_CANDIDATE_CONNECTIONS_HEADER"
              message="$(string.CandidateConnectionsHeader)" />

          <event value="103"
              level="win:Informational"
              template="Template_CandidateConnectionsHeader2"
              keywords="Info"
              symbol="CM_CANDIDATE_CONNECTIONS_HEADER2"
              message="$(string.CandidateConnectionsHeader2)" />
              
          <event value="101"
              level="win:Informational"
              template="Template_CandidateConnectionsBody"
              keywords="Info"
              symbol="CM_CANDIDATE_CONNECTIONS_BODY"
              message="$(string.CandidateConnectionsBody)" />

          <event value="102"
              level="win:Informational"
              template="Template_CandidateConnectionsFooter"
              keywords="Info"
              symbol="CM_CANDIDATE_CONNECTIONS_FOOTER"
              message="$(string.CandidateConnectionsFooter)" />
              
          <event value="104"
              level="win:Verbose"
              template="Template_CmServicePrintRequirements"
              keywords="Info"
              symbol="CM_CANDIDATE_CONNECTION_REQUIREMENTS"
              message="$(string.CmServicePrintRequirements)" />

          <event value="105"
              level="win:Verbose"
              template="Template_CmServicePrintPreferences"
              keywords="Info"
              symbol="CM_CANDIDATE_CONNECTION_PREFERENCES"
              message="$(string.CmServicePrintPreferences)" />

          <event value="200"
              level="win:Informational"
              template="Template_ConfigConnection"
              keywords="Info"
              symbol="CM_ADD_CONNECTION"
              message="$(string.AddConnection)" />

          <event value="201"
              level="win:Informational"
              template="Template_ConfigConnection"
              keywords="Info"
              symbol="CM_DEL_CONNECTION"
              message="$(string.DelConnection)" />

          <event value="202"
              level="win:Informational"
              template="Template_ConfigConnection"
              keywords="Info"
              symbol="CM_GET_CONNECTION"
              message="$(string.GetConnection)" />

          <event value="203"
              level="win:Informational"
              template="Template_AddConnectionPendingCsp"
              keywords="Info"
              symbol="CM_ADD_CONNECTION_PENDING_CSP"
              message="$(string.AddConnectionPendingCsp)" />

          <event value="204"
              level="win:Error"
              template="Template_AddConnectionPendingCsp"
              keywords="Error"
              symbol="CM_ADD_CONNECTION_PENDING_CSP_TIMEOUT"
              message="$(string.AddConnectionPendingCspTimeout)" />

          <event value="300"
              level="win:Informational"
              template="Template_AcquireReleaseConnection"
              keywords="Info"
              symbol="CM_ACQUIRE_CONNECTION"
              message="$(string.AcquireConnection)" />

          <event value="301"
              level="win:Informational"
              template="Template_ClaimConnection"
              keywords="Info"
              symbol="CM_CLAIM_CONNECTION"
              message="$(string.ClaimConnection)" />

          <event value="302"
              level="win:Informational"
              template="Template_UnclaimedConnection"
              keywords="Info"
              symbol="CM_UNCLAIMED_CONNECTION"
              message="$(string.UnclaimedConnection)" />

          <event value="303"
              level="win:Informational"
              template="Template_AcquireReleaseConnection"
              keywords="Info"
              symbol="CM_RELEASE_CONNECTION"
              message="$(string.ReleaseConnection)" />

          <event value="304"
              level="win:Informational"
              template="Template_AcquireConnectionAsync"
              keywords="Info"
              symbol="CM_ACQUIRE_CONNECTION_ASYNC"
              message="$(string.AcquireConnectionAsync)" />

          <event value="305"
              level="win:Informational"
              template="Template_CloseAsyncAcquire"
              keywords="Info"
              symbol="CM_CLOSE_ASYNC_ACQUIRE"
              message="$(string.CloseAsyncAcquire)" />

          <event value="400"
              level="win:Informational"
              template="Template_SetDataActivityState"
              keywords="Info"
              symbol="CM_SET_DATA_ACTIVITY_STATE"
              message="$(string.SetDataActivityState)" />

          <event value="401"
              level="win:Informational"
              template="Template_SetDataActivityStateToCsp"
              keywords="Info"
              symbol="CM_SET_DATA_ACTIVITY_STATE_TO_CSP"
              message="$(string.SetDataActivityStateToCsp)" />

          <!--For backward compatibility -->
          <event value="500"
              level="win:Informational"
              template="Template_CharacteristicUpdate"
              keywords="Info"
              symbol="CM_CHARACTERISTIC_UPDATE"
              message="$(string.CharacteristicUpdate)" />

          <event value="501"
              level="win:Informational"
              template="Template_CharacteristicUpdate2"
              keywords="Info"
              symbol="CM_CHARACTERISTIC_UPDATE2"
              message="$(string.CharacteristicUpdate)" />

          <event value="600"
              level="win:Informational"
              template="Template_ConnectionStateChange"
              keywords="Info"
              symbol="CM_CONNECTION_STATE_CHANGE"
              message="$(string.ConnectionStateChange)" />

          <event value="601"
              level="win:Informational"
              template="Template_ConnectDisconnectConnectionAtCsp"
              keywords="Info"
              symbol="CM_CONNECT_CONNECTION_AT_CSP"
              message="$(string.ConnectConnectionAtCsp)" />

          <event value="602"
              level="win:Informational"
              template="Template_ConnectDisconnectConnectionAtCsp"
              keywords="Info"
              symbol="CM_DISCONNECT_CONNECTION_AT_CSP"
              message="$(string.DisconnectConnectionAtCsp)" />

          <event value="603"
              level="win:Informational"
              template="Template_ConnectionStateChangeInternal"
              keywords="Info"
              symbol="CM_CONNECTION_STATE_CHANGE_INTERNAL"
              message="$(string.ConnectionStateChangeInternal)" />

          <event value="604"
              level="win:Informational"
              template="Template_ConnectionConnectConnection"
              keywords="Info"
              symbol="CM_CONNECTION_CONNECT_CONNECTION"
              message="$(string.ConnectionConnectConnection)" />

          <event value="605"
              level="win:Informational"
              template="Template_ConnectionDisconnectConnection"
              keywords="Info"
              symbol="CM_CONNECTION_DISCONNECT_CONNECTION"
              message="$(string.ConnectionDisconnectConnection)" />

          <event value="606"
              level="win:Informational"
              template="Template_ConnectionConfigRetryNow"
              keywords="Info"
              symbol="CM_UPDATE_CONNECTION_CONFIG_RETRYNOW"
              message="$(string.ConnectionConfigRetryNow)" />

          <event value="700"
              level="win:Warning"
              template="Template_CmCspInit"
              keywords="Info"
              symbol="CM_SERVICE_CSP_INIT"
              message="$(string.CmCspInit)" />
              
          <event value="701"
              level="win:Informational"
              template="Template_CmCspSetDataActivityState"
              keywords="Connect"
              symbol="CM_SERVICE_CSP_SET_DATA_ACTIVITY_STATE"
              message="$(string.CmCspSetDataActivityState)" />
          
          <event value="702"
              level="win:Informational"
              template="Template_CmCspCancelPendingConnect"
              keywords="Connect"
              symbol="CM_SERVICE_CSP_CANCEL_PENDING_CONNECT"
              message="$(string.CmCspCancelPendingConnect)" />
          
          <event value="703"
              level="win:Informational"
              template="Template_CmCspEnableConnection"
              keywords="Info"
              symbol="CM_SERVICE_CSP_ENABLE_CONNECTION"
              message="$(string.CmCspEnableConnection)" />

          <event value="704"
              level="win:Informational"
              template="Template_CmCspConnectionConfigMigrateNeeded"
              keywords="Info"
              symbol="CM_SERVICE_CSP_CONNECTION_CONFIG_MIGRATE_NEEDED"
              message="$(string.CmCspConnectionConfigMigrateNeeded)" />

          <event value="705"
              level="win:Informational"
              template="Template_CmCspMigrateConnectionConfig"
              keywords="Info"
              symbol="CM_SERVICE_CSP_MIGRATE_CONNECTION_CONFIG"
              message="$(string.CmCspMigrateConnectionConfig)" />

          <event value="706"
              level="win:Informational"
              template="Template_CmCspSetNetworkQuietMode"
              keywords="Info"
              symbol="CM_SERVICE_CSP_SET_NETWORK_QUIET_MODE"
              message="$(string.CmCspSetNetworkQuietMode)" />

          <event value="800"
              level="win:Informational"
              template="Template_CmServiceInitCsps"
              keywords="Info"
              symbol="CM_SERVICE_INIT_CSPS"
              message="$(string.CmServiceInitCsps)" />

          <event value="801"
              level="win:Error"
              keywords="Error"
              symbol="CM_SERVICE_INIT_RMNET_FAILED"
              message="$(string.CmServiceInitRmNetFailed)" />

          <event value="802"
              level="win:Error"
              keywords="Error"
              symbol="CM_SERVICE_INIT_THREAD_POOL_FAILED"
              message="$(string.CmServiceInitThreadPoolFailed)" />

          <event value="803"
              level="win:Error"
              template="Template_CmServiceInitOpenProcessTokenFailure"
              keywords="Error"
              symbol="CM_SERVICE_INIT_OPEN_PROCESS_TOKEN_FAILED"
              message="$(string.CmServiceInitOpenProcessTokenFailed)" />

          <event value="804"
              level="win:Error"
              template="Template_CmServiceInitSetPrivelegeFailure"
              keywords="Error"
              symbol="CM_SERVICE_INIT_SET_PRIVILEGE_FAILED"
              message="$(string.CmServiceInitSetPrivilegeFailed)" />

          <event value="805"
              level="win:Error"
              template="Template_CmServiceRmInitializeFailure"
              keywords="Error"
              symbol="CM_SERVICE_RM_INITIALIZE_FAILED"
              message="$(string.CmServiceRmInitializeFailed)" />

          <event value="806"
              level="win:Informational"
              template="Template_ServiceInit"
              keywords="Info"
              symbol="CM_SERVICE_INIT_PHASE1"
              message="$(string.CmServiceInitializePhase1)" />
              
          <event value="807"
              level="win:Informational"
              template="Template_ServiceInit"
              keywords="Info"
              symbol="CM_SERVICE_INIT_PHASE2"
              message="$(string.CmServiceInitializePhase2)" />
              
          <event value="808"
              level="win:Informational"
              template="Template_ServiceInit"
              keywords="Info"
              symbol="CM_SERVICE_INIT_PHASE3"
              message="$(string.CmServiceInitializePhase3)" />
              
          <event value="809"
              level="win:Informational"
              template="Template_ServiceInitIndividualCsp"
              keywords="Info"
              symbol="CM_SERVICE_INIT_INDIVIDUAL_CSP"
              message="$(string.CmServiceInitializeACsp)" />

          <event value="810"
              level="win:Error"
              template="Template_ServiceInitWSAStartup"
              keywords="Error"
              symbol="CM_SERVICE_INIT_WSASTARTUP"
              message="$(string.CmServiceInitWSAStartup)" />              

          <event value="811"
              level="win:Warning"
              template="Template_ServiceInitAddConfigFailure"
              keywords="Error"
              symbol="CM_SERVICE_INIT_ADDCONFIGFAILURE"
              message="$(string.CmServiceInitAddConfigFailure)" />

          <event value="812"
              level="win:Informational"
              template="Template_CspInitComplete"
              keywords="Info"
              symbol="CM_SERVICE_CSP_INIT_COMPLETE"
              message="$(string.CmServiceCspInitComplete)" />

          <event value="813"
              level="win:Error"
              template="Template_CspInitError"
              keywords="Error"
              symbol="CM_SERVICE_CSP_INIT_ERROR"
              message="$(string.CmServiceCspInitError)" />

          <event value="900"
              level="win:Warning"
              template="Template_CmConnectionStateAdd"
              keywords="Error"
              symbol="CM_CONNECTION_STATE_ADD"
              message="$(string.CmConnectionStateAdd)" />
              
          <event value="901"
              level="win:Warning"
              template="Template_CmConnectionStateUpdate"
              keywords="Info"
              symbol="CM_CONNECTION_STATE_UPDATE"
              message="$(string.CmConnectionStateUpdate)" />
          
          <event value="902"
              level="win:Warning"
              template="Template_CmConnectionStateDeleteAndDelRef"
              keywords="Info"
              symbol="CM_CONNECTION_STATE_DELETE_AND_DEL_REF"
              message="$(string.CmConnectionStateDeleteAndDelRef)" />
          
          <event value="903"
              level="win:Warning"
              template="Template_CmConnectionStateGetInfo"
              keywords="Info"
              symbol="CM_CONNECTION_STATE_GET_INFO"
              message="$(string.CmConnectionStateGetInfo)" />
          
          <event value="904"
              level="win:Warning"
              template="Template_CmConnectionStateAddRemoveUserFailed"
              keywords="Info"
              symbol="CM_CONNECTION_STATE_REMOVE_USER_FAILED"
              message="$(string.CmConnectionStateRemoveUserFailed)" />
              
          <event value="905"
              level="win:Warning"
              template="Template_CmConnectionStateAddRemoveUserFailed"
              keywords="Info"
              symbol="CM_CONNECTION_STATE_ADD_USER_FAILED"
              message="$(string.CmConnectionStateAddUserFailed)" />
              
          <event value="906"
              level="win:Warning"
              template="Template_CmConnectionStateConnectDisconnect"
              keywords="Info"
              symbol="CM_CONNECTION_STATE_CONNECT"
              message="$(string.CmConnectionStateConnect)" />
              
          <event value="907"
              level="win:Warning"
              template="Template_CmConnectionStateConnectDisconnect"
              keywords="Info"
              symbol="CM_CONNECTION_STATE_DISCONNECT"
              message="$(string.CmConnectionStateDisconnect)" />

          <event value="908"
              level="win:Informational"
              template="Template_ConnectFailureDueToThrottling"
              keywords="Info"
              symbol="CM_CONNECT_FAILURE_DUE_TO_THROTTLING"
              message="$(string.ConnectFailureDueToThrottling)" />          

          <event value="1000"
              level="win:Warning"
              template="Template_CmResourceAddRmvResourceIdListener"
              keywords="Error"
              symbol="CM_RESOURCE_ADD_ID_LISTENER"
              message="$(string.CmResourceAddResourceIdListener)" />
          
          <event value="1001"
              level="win:Warning"
              template="Template_CmResourceAddRmvResourceIdListener"
              keywords="Error"
              symbol="CM_RESOURCE_REMOVE_ID_LISTENER"
              message="$(string.CmResourceRmvResourceIdListener)" />
              
          <event value="1100"
              level="win:Warning"
              template="Template_CmConnectionAddConfig"
              keywords="Error"
              symbol="CM_CONNECTION_ADD_CONFIG"
              message="$(string.CmConnectionAddConfig)" />

          <event value="1200"
              level="win:Warning"
              template="Template_CmServicePersistConfigAddDel"
              keywords="Info"
              symbol="CM_PERSIST_CONFIG_ADD"
              message="$(string.CmServicePersistConfigAdd)" />
          
          <event value="1201"
              level="win:Warning"
              template="Template_CmServicePersistConfigAddDel"
              keywords="Info"
              symbol="CM_PERSIST_CONFIG_DELETE"
              message="$(string.CmServicePersistConfigDelete)" />

          <event value="1202"
              level="win:Error"
              template="Template_CmServicePersistConfigIncompatibleVersion"
              keywords="Error"
              symbol="CM_PERSIST_CONFIG_INCOMPATIBLE_VERSION"
              message="$(string.CmServicePersistConfigIncompatibleVersion)" />

          <event value="1203"
              level="win:Error"
              template="Template_CmServicePersistConfigMigrateError"
              keywords="Error"
              symbol="CM_PERSIST_CONFIG_MIGRATE_ERROR"
              message="$(string.CmServicePersistConfigMigrateError)" />

          <event value="1204"
              level="win:Error"
              template="Template_CmServicePersistPolicyIncompatibleVersion"
              keywords="Error"
              symbol="CM_PERSIST_POLICY_INCOMPATIBLE_VERSION"
              message="$(string.CmServicePersistPolicyIncompatibleVersion)" />

          <event value="1300"
              level="win:Verbose"
              template="Template_CmServiceSortConnectionsByPolicy"
              keywords="Info"
              symbol="CM_POLICY_SORT_CONNECTION"
              message="$(string.CmServiceSortConnectionsByPolicy)" />

          <event value="1400"
              level="win:Warning"
              template="Template_CmServiceAcquireConnectionByInterfaceIndex"
              keywords="Info"
              symbol="CM_SERVICE_ACQUIRE_CONNECTION_BY_INTERFACE_INDEX"
              message="$(string.CmServiceAcquireConnectionByInterfaceIndex)" />

          <event value="1500"
              level="win:Warning"
              template="Template_CmServiceAcquireIfMatched"
              keywords="Info"
              symbol="CM_SERVICE_ACQUIRE_IF_MATCHED"
              message="$(string.CmServiceAcquireIfMatched)" />

          <event value="1501"
              level="win:Informational"
              template="Template_CmServiceGetDetailsIpAddr"
              keywords="Info"
              symbol="CM_SERVICE_GET_DETAILS_IPADDR"
              message="$(string.CmServiceGetDetailsIpAddr)" />
            
          <event value="1502"
              level="win:Error"
              template="Template_CmServiceIpAddrAdapterInfo"
              keywords="Error"
              symbol="CM_SERVICE_IPADDR_ADAPTER_INFO"
              message="$(string.CmServiceIpAddrAdapterInfo)" />

          <event value="1503"
              level="win:Error"
              template="Template_CmServiceGetAdapterAddressResult"
              keywords="Error"
              symbol="CM_SERVICE_GET_ADAPTER_ADDRESS_RESULT"
              message="$(string.CmServiceGetAdapterAddressResult)" />

          <event value="1600"
              level="win:Informational"
              template="Template_CmServiceAlwaysConnectedScheduleWI"
              keywords="Info"
              symbol="CM_SERVICE_ALWAYS_CONNECTED_SCHEDULE_WORK"
              message="$(string.CmServiceAlwaysConnectedScheduleWI)" />
              
          <event value="1601"
              level="win:Informational"
              template="Template_CmServiceAlwaysConnectedReconnect"
              keywords="Info"
              symbol="CM_SERVICE_ALWAYS_CONNECTED_RECONNECT"
              message="$(string.CmServiceAlwaysConnectedReconnect)" />
              
          <event value="1602"
              level="win:Informational"
              template="Template_CmServiceAlwaysConnectedProcessWI"
              keywords="Info"
              symbol="CM_SERVICE_ALWAYS_CONNECTED_PROCESS_WORK"
              message="$(string.CmServiceAlwaysConnectedProcessWI)" />
              
          <event value="1603"
              level="win:Informational"
              template="Template_CmServiceRaiseAutoConnectPriority"
              keywords="Info"
              symbol="CM_SERVICE_RAISE_AUTO_CONNECT_PRIORITY"
              message="$(string.CmServiceRaiseAutoConnectPriority)" />

          <event value="1700"
              level="win:Informational"
              template="Template_CmServiceTimerQueueEnqueue"
              keywords="Info"
              symbol="CM_SERVICE_TIMERQUEUE_ENQUEUE"
              message="$(string.CmServiceTimerQueueEnqueue)" />

         <event value="1701"
              level="win:Informational"
              template="Template_CmServiceTimerQueueCancel"
              keywords="Info"
              symbol="CM_SERVICE_TIMERQUEUE_CANCEL"
              message="$(string.CmServiceTimerQueueCancel)" />

         <event value="1702"
              level="win:Informational"
              template="Template_CmServiceTimerQueueItemCompleted"
              keywords="Info"
              symbol="CM_SERVICE_TIMERQUEUE_ITEMCOMPLETED"
              message="$(string.CmServiceTimerQueueItemCompleted)" />

          <event value="2000"
              level="win:Warning"
              template="Template_CmServiceInvalidParameter"
              keywords="Info"
              symbol="CM_SERVICE_GET_NOTIFICATION_INVALID_PARAMETERS"
              message="$(string.CmServiceGetNotificationImplParameterInvalid)" />

          <event value="2001"
              level="win:Warning"
              template="Template_CmServiceGetNotificationNoRegistration"
              keywords="Info"
              symbol="CM_SERVICE_GET_NOTIFICATION_NO_REGISTRATION"
              message="$(string.CmServiceGetNotificationNoRegistration)" />

          <event value="2002"
              level="win:Informational"
              template="Template_CmServiceQueuedNotificationToListeners"
              keywords="Info"
              symbol="CM_SERVICE_QUEUED_NOTIFICATION_TO_LISTENERS"
              message="$(string.CmServiceQueuedNotificationToListeners)" />

          <event value="2200"
              level="win:Informational"
              template="Template_InitGlobalsWnfConnectedState"
              keywords="Info"
              symbol="CM_INIT_GLOBALS_WNF_CONNECTED_STATE"
              message="$(string.CmServiceInitGlobalsWnfConnectedState)" />

          <event value="2201"
              level="win:Informational"
              template="Template_UpdateWnfConnectedState"
              keywords="Info"
              symbol="CM_UPDATE_WNF_CONNECTED_STATE"
              message="$(string.CmServiceUpdateWnfConnectedState)" />

          <event value="2202"
              level="win:Informational"
              template="Template_PublishWnfStateError"
              keywords="Info"
              symbol="CM_PUBLISH_WNF_CONNECTED_STATE_ERROR"
              message="$(string.CmServicePublishWnfConnectedStateError)" />

          <event value="2203"
              level="win:Informational"
              template="Template_PublishWnfStateError"
              keywords="Info"
              symbol="CM_PUBLISH_WNF_NON_CELLLAR_CONNECTED_STATE_ERROR"
              message="$(string.CmServicePublishWnfNonCellularConnectedStateError)" />

          <event value="2204"
              level="win:Informational"
              template="Template_CmServiceNetworkStateChangeTimerProc"
              keywords="Info"
              symbol="CM_NETWORK_STATE_CHANGE_TIMER_PROC"
              message="$(string.CmServiceNetworkStateChangeTimerProc)" />

          <event value="2205"
              level="win:Informational"
              template="Template_CmServiceNetworkStateChangeEnqueue"
              keywords="Info"
              symbol="CM_NETWORK_STATE_CHANGE_ENQUEUE"
              message="$(string.CmServiceNetworkStateChangeEnqueue)" />

          <event value="2206"
              level="win:Informational"
              template="Template_CmServiceNetworkStateChangeEnqueue"
              keywords="Info"
              symbol="CM_NETWORK_STATE_CHANGE_NO_ENQUEUE"
              message="$(string.CmServiceNetworkStateChangeNoEnqueue)" />

          <event value="2300"
              level="win:Informational"
              template="Template_ClientAccountInfo"
              keywords="Info"
              symbol="CM_CLIENT_ACCOUNT_INFO"
              message="$(string.CmServiceSecurityClientAccount)" />

          <event value="2301"
              level="win:Error"
              template="Template_CmServiceGetCallerToken"
              keywords="Error"
              symbol="CM_GET_CALLER_TOKEN"
              message="$(string.CmServiceGetCallerToken)" />

          <event value="2400"
              level="win:Informational"
              template="Template_PdcClientRegistration"
              keywords="Info"
              symbol="CM_PDC_RESILIENCY_CLIENT_REGISTER"
              message="$(string.CmServicePdcResiliencyClientRegister)" />
            
          <event value="2401"
              level="win:Informational"
              template="Template_PdcClientRegistration"
              keywords="Info"
              symbol="CM_PDC_RESILIENCY_CLIENT_UNREGISTER"
              message="$(string.CmServicePdcResiliencyClientUnregister)" />
            
          <event value="2402"
              level="win:Informational"
              template="Template_PdcClientCallback"
              keywords="Info"
              symbol="CM_PDC_RESILIENCY_CLIENT_CALLBACK"
              message="$(string.CmServicePdcResiliencyClientCallback)" />

          <event value="2403"
              level="win:Informational"
              template="Template_PdcActivationClientRegistration"
              keywords="Info"
              symbol="CM_PDC_ACTIVATION_CLIENT_REGISTER"
              message="$(string.CmServicePdcActivationClientRegister)" />

          <event value="2404"
              level="win:Informational"
              template="Template_PdcActivationClientRegistration"
              keywords="Info"
              symbol="CM_PDC_ACTIVATION_CLIENT_UNREGISTER"
              message="$(string.CmServicePdcActivationClientUnregister)" />

          <event value="2405"
              level="win:Informational"
              template="Template_PdcActivationClientActivityRequest"
              keywords="Info"
              symbol="CM_PDC_ACTIVATION_CLIENT_ACTIVITY_REQUEST"
              message="$(string.CmServicePdcActivationClientActivityRequest)" />

          <event value="2406"
              level="win:Informational"
              template="Template_CmSetNetworkReference"
              keywords="Info"
              symbol="CM_SET_NETWORK_REFERENCE"
              message="$(string.CmServiceSetNetworkReference)" />

          <event value="2407"
              level="win:Informational"
              template="Template_CmReleaseNetworkReferenceInProcess"
              keywords="Info"
              symbol="CM_RELEASE_NETWORK_REFERENCE_IN_PROCESS"
              message="$(string.CmServiceReleaseNetworkReferenceInProcess)" />

          <event value="2408"
              level="win:Informational"
              template="Template_CmAcquireReleaseNdisReference"
              keywords="Info"
              symbol="CM_ACQUIRE_NDIS_REFERENCE"
              message="$(string.CmServiceAcquireNdisReference)" />

          <event value="2409"
              level="win:Informational"
              template="Template_CmAcquireReleaseNdisReference"
              keywords="Info"
              symbol="CM_RELEASE_NDIS_REFERENCE"
              message="$(string.CmServiceReleaseNdisReference)" />

          <event value="2410"
             level="win:Informational"
             template="Template_CmNdisReferenceError"
             keywords="Info"
             symbol="CM_NDIS_REFERENCE_ERROR"
             message="$(string.CmServiceNdisReferenceError)" />

          <event value="2411"
              level="win:Informational"
              template="Template_CmReleaseNdisReferenceInProcess"
              keywords="Info"
              symbol="CM_RELEASE_NDIS_REFERENCE_IN_PROCESS"
              message="$(string.CmServiceReleaseNdisReferenceInProcess)" />
            
          <event value="2412"
             level="win:Informational"
             template="Template_CmNdisReferenceIoctlResult"
             keywords="Info"
             symbol="CM_NDIS_REFERENCE_IOCTL_RESULT"
             message="$(string.CmServiceNdisReferenceIoctlResult)" />            

          <event value="2500"
              level="win:Informational"
              template="Template_UpdatePolicy"
              keywords="Info"
              symbol="CM_UPDATE_POLICY"
              message="$(string.CmServiceUpdatePolicy)" />

          <event value="2501"
              level="win:Informational"
              template="Template_MappingsPolicyKey"
              keywords="Info"
              symbol="CM_UPDATE_MAPPINGS_POLICY"
              message="$(string.CmServiceUpdateMappingsPolicy)" />
            
          <event value="2502"
              level="win:Informational"
              template="Template_FilterConnectionsByMappingsPolicy"
              keywords="Info"
              symbol="CM_FILTER_CONNECTIONS_BY_MAPPINGS_POLICY"
              message="$(string.CmServiceFilterConnectionsByMappingsPolicy)" />     

          <event value="3000"
              level="win:Error"
              template="Template_ResultAsHRESULT"
              keywords="Error"
              symbol="FirewallEnforcer_OpenLocalStoreError"
              message="$(string.3000)" />   

          <event value="3001"
              level="win:Error"
              template="Template_ResultAsHRESULT"
              keywords="Error"
              symbol="FirewallEnforcer_OpenDynamicStoreError"
              message="$(string.3001)" />   

          <event value="3002"
              level="win:Error"
              template="Template_ResultAsHRESULT"
              keywords="Error"
              symbol="FirewallEnforcer_FWGetConfigError"
              message="$(string.3002)" />

          <event value="3003"
              level="win:Error"
              template="Template_ResultAsHRESULT"
              keywords="Error"
              symbol="FirewallEnforcer_FWSetConfigError"
              message="$(string.3003)" />

          <event value="3004"
              level="win:Error"
              template="Template_FirewallIdResult"
              keywords="Error"
              symbol="FirewallEnforcer_SetFirewallRuleError"
              message="$(string.3004)" />

          <event value="3005"
              level="win:Error"
              template="Template_ResultAsHRESULT"
              keywords="Error"
              symbol="FirewallEnforcer_FWQueryFirewallRulesError"
              message="$(string.3005)" />

          <event value="3006"
              level="win:Error"
              template="Template_FirewallIdResult"
              keywords="Error"
              symbol="FirewallEnforcer_FWDeleteFirewallRuleError"
              message="$(string.3006)" />

          <event value="3007"
              level="win:Error"
              template="Template_FirewallApplyChange"
              keywords="Error"
              symbol="FirewallEnforcer_ApplyChangeError"
              message="$(string.3007)" />

          <event value="3008"
              level="win:Informational"
              template="Template_ResultAsHRESULT"
              keywords="Info"
              symbol="FirewallEnforcer_Start"
              message="$(string.3008)" />

          <event value="3009"
              level="win:Informational"
              template="Template_ResultAsHRESULT"
              keywords="Info"
              symbol="FirewallEnforcer_Stop"
              message="$(string.3009)" />

          <event value="3010"
              level="win:Informational"
              template="Template_ValueChange"
              keywords="Info"
              symbol="ZeroRateEnforcePolicy_SetState"
              message="$(string.3010)" />

          <event value="3011"
              level="win:Informational"
              template="Template_AddZeroRatedClient"
              keywords="Info"
              symbol="ZeroRateEnforcePolicy_AddZeroRatedClient"
              message="$(string.3011)" />

          <event value="3012"
              level="win:Informational"
              template="Template_RemoveZeroRatedClient"
              keywords="Info"
              symbol="ZeroRateEnforcePolicy_RemoveZeroRatedClient"
              message="$(string.3012)" />

          <event value="3013"
              level="win:Informational"
              template="Template_RemoveAllZeroRatedClients"
              keywords="Info"
              symbol="ZeroRateEnforcePolicy_RemoveAllZeroRatedClients"
              message="$(string.3013)" />

          <event value="3014"
              level="win:Error"
              keywords="Error"
              symbol="ZeroRateEnforcePolicy_InvalidAccountNameOnMappingError"
              message="$(string.3014)" />

          <event value="3015"
              level="win:Error"
              keywords="Error"
              symbol="ZeroRateEnforcePolicy_NoZeroRateConnectionsFound"
              message="$(string.3015)" />

          <event value="3016"
              level="win:Informational"
              template="Template_ZeroRateHandler"
              keywords="Info"
              symbol="FirewallEnforcer_HandleDisableRequest"
              message="$(string.3016)" />

          <event value="3017"
              level="win:Informational"
              template="Template_ZeroRateHandler"
              keywords="Info"
              symbol="FirewallEnforcer_HandleEnforceRequest"
              message="$(string.3017)" />

          <event value="3018"
              level="win:Informational"
              template="Template_ZeroRateZeroRatedConnection"
              keywords="Info"
              symbol="FirewallEnforcer_ZeroRateAddZeroRatedConnection"
              message="$(string.3018)" />

          <event value="3019"
              level="win:Informational"
              template="Template_ZeroRateZeroRatedConnection"
              keywords="Info"
              symbol="FirewallEnforcer_ZeroRateRemoveZeroRatedConnection"
              message="$(string.3019)" />

          <event value="3020"
              level="win:Informational"
              template="Template_ValueChange"
              keywords="Info"
              symbol="DisablePolicy_SetForcedDisableState"
              message="$(string.3020)" />

          <event value="3021"
              level="win:Informational"
              keywords="Info"
              symbol="DisablePolicy_ApplyingForcedDisableToHandlers"
              message="$(string.3021)" />

        </events>
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Keyword.Error"          value="Error" />
        <string id="Keyword.Performance"    value="Performance" />
        <string id="Keyword.Info"           value="Information" />
        <string id="Keyword.Connect"        value="Connect" />
        <string id="Keyword.Notify"         value="Notify" />

        <string id="ServiceInit"                                value="CmService::Init - time ms[%1]" />
        <string id="RpcRegisterInterfaceFailure"                value="CmService RPC Register Interface Failure - interfaceName[%1] registerType[%2] ntstatus[%3]" />
        <string id="RpcUnregisterInterfaceFailure"              value="CmService RPC Unregister Interface Failure - interfaceName[%1] registerType[%2] ntstatus[%3]" />
        <string id="ServiceDeinitStart"                         value="CmService::Deinit Starting" />
        <string id="ServiceDeinitComplete"                      value="CmService::Deinit Complete" />
        <string id="ServiceDeinitConnectionsCleanup"            value="CmService::Deinit - Active Connections cleaned up" />
        <string id="ServiceDeinitDeletedConnectionsCleanup"     value="CmService::Deinit - Deleted Connections (pending) cleaned up" />

          

        <string id="CandidateConnectionsHeader"         value="CmService::CandidateConnections - proc[%1][%2], acct[%3]; reqs[%4], prefs[%5]; conns[%6]" />
        <string id="CandidateConnectionsHeader2"        value="CmService::CandidateConnections - proc[%1][%2]; reqs[%3], prefs[%4], host[%5]; conns[%6]" />
        <string id="CandidateConnectionsBody"           value="CmService::CandidateConnections - connId[%1], connName[%2], connected[%3], ifIndex[%4]" />
        <string id="CandidateConnectionsFooter"         value="CmService::CandidateConnections - res[%1]" />
        <string id="AddConnection"                      value="CmService::AddConnection - conn[%1][%2]; res[%3]" />
        <string id="AddConnectionPendingCsp"            value="CmService::AddConnection Pending CSP, waiting for initialization - conn[%1]; res[%2]" />
        <string id="AddConnectionPendingCspTimeout"     value="CmService::AddConnection Pending CSP, Error: wait timeout - conn[%1]; res[%2]" />
        <string id="DelConnection"                      value="CmService::DeleteConnection - conn[%1][%2]; res[%3]" />
        <string id="GetConnection"                      value="CmService::GetConnection - conn[%1][%2]; res[%3]" />
        <string id="AcquireConnection"                  value="CmService::AcquireConnection - proc[%1]; connId[%2]; res[%3]" />
        <string id="ReleaseConnection"                  value="CmService::ReleaseConnection - proc[%1]; connId[%2]; res[%3]" />
        <string id="AcquireConnectionAsync"             value="CmService::AcquireConnectionAsync - proc[%1]; connId[%2]; res[%3]; requestHandle[%4]" />
        <string id="CloseAsyncAcquire"                  value="CmService::CloseAsyncAcquire - proc[%1]; requestHandle[%2]" />
        <string id="SetDataActivityState"               value="CmService::SetDataActivityState - proc[%1], connId[%2], alias[%3]; activity[%4]-[%5]" />
        <string id="SetDataActivityStateToCsp"          value="CmService::SetDataActivityStateToCsp - alias[%1]; delay[%2], activity[%3]; res[%4]" />
        <string id="ClaimConnection"                    value="CmService::ClaimConnection - adap[%1], conn[%2][%3]; res[%4]" />
        <string id="UnclaimedConnection"                value="CmService::UnclaimedConnection - adap[%1] was not claimed by any CSP" />
        <string id="CharacteristicUpdate"               value="CmService::CharacteristicUpdate - conn[%1][%2]; char[%3], value[%4]-[%5]" />
        <string id="ConnectionStateChange"              value="CmService::ConnectionStateChange - conn[%1][%2][%3]; state[%4]-[%5]" />
        <string id="ConnectionConnectConnection"        value="CmService::Connection:: Connecting - connName[%1], cspConnName[%2]" />
        <string id="ConnectionDisconnectConnection"     value="CmService::Connection:: Disconnecting - connName[%1], cspConnName[%2]" />
        <string id="ConnectionConfigRetryNow"           value="CmService::Connection:: Updating config for connName[%1], RetryNow[%2]" />
        <string id="ConnectConnectionAtCsp"             value="CmService::ConnectConnectionAtCsp - alias[%1]; res[%2]" />
        <string id="DisconnectConnectionAtCsp"          value="CmService::DisconnectConnectionAtCsp - alias[%1]; res[%2]" />
        <string id="ConnectionStateChangeInternal"      value="CmService::ConnectionStateChangeInternal - alias[%1]; fsmAction[%2], fsmState[%3]-[%4]; fsmRes[%5]" />
        <string id="CmCspSetDataActivityState"          value="CmService::CmServiceCsp::SetDataActivityState - res[%1]; state[%2], delay[%3], cspConnName[%4]" />
        <string id="CmCspInit"                          value="CmService::CmServiceCsp::Init - [%1]; lib[%2]; res[%3]" />
        <string id="CmCspCancelPendingConnect"          value="CmService::CmServiceCsp::CancelPendingConnect - cspConnName[%1]; res[%2]" />
        <string id="CmCspEnableConnection"              value="CmService::CmServiceCsp::CmCspEnableConnection - cspConnName[%1], res[%2], en[%3]" />
        <string id="CmCspConnectionConfigMigrateNeeded" value="CmService::CmServiceCsp::CmCspConnectionConfigMigrateNeeded - res[%1], needed[%2]" />
        <string id="CmCspMigrateConnectionConfig"       value="CmService::CmServiceCsp::CmCspMigrateConnectionConfig- res[%1]" />
        <string id="CmCspSetNetworkQuietMode"           value="CmService::CmServiceCsp::CmCspSetNetworkQuietMode- cspName[%1], res[%2], network quiet mode[%3]" />
        <string id="CmConnectionStateAdd"               value="CmService::CmConnectionState::Add - cspConnName[%1]; res[%2]" />
        <string id="CmConnectionStateUpdate"            value="CmService::CmConnectionState::Update - cspConnName[%1]; owner[%2]; res[%3]" />
        <string id="CmConnectionStateDeleteAndDelRef"   value="CmService::CmConnectionState::DeleteAndDelRef - cspConnName[%1]; res[%2]" />
        <string id="CmConnectionStateGetInfo"           value="CmService::ConnectionState::GetInfo - state[%1]; res[%2]" />
        <string id="CmConnectionStateRemoveUserFailed"  value="CmService::CmConnectionState::RemoveUser - cspConnName[%1]; failed removing user from resource" />
        <string id="CmConnectionStateAddUserFailed"     value="CmService::CmConnectionState::AddUser - cspConnName[%1]; failed adding user to resource" />
        <string id="CmConnectionStateConnect"           value="CmService::CmConnectionState::Connect - cspConnName[%1]; res[%2]" />
        <string id="CmConnectionStateDisconnect"        value="CmService::CmConnectionState::Disconnect - cspConnName[%1]; res[%2]" />
        <string id="ConnectFailureDueToThrottling"      value="CmService::ConnectionState:: Connect Failure due to Throttling - IsScreenOn[%1], NoOfFailedAttempts[%2], IsInThrottlingInterval[%3], IsBarred[%4]" />        
        <string id="CmResourceAddResourceIdListener"    value="CmService::ConnectionResource::AddResourceIdListener - cspConnName[%1]; failed adding Resource ID Listener" />
        <string id="CmResourceRmvResourceIdListener"    value="CmService::ConnectionResource::RemoveResourceIdListener - cspConnName[%1]; failed removing Resource ID Listener" />
        <string id="CmConnectionAddConfig"              value="CmService::Connection::AddConfig - connName[%1]; res[%2]" />
        <string id="CmServiceInitWSAStartup"            value="CmService::Service::Init - WSAStartup fails with error [%1]." />
        <string id="CmServiceInitCsps"                  value="CmService::Service::Init - done initializing CSPs; [%1] of [%2] CSPs initialized." />
        <string id="CmServiceInitRmNetFailed"           value="CmService::Service::RmNet.Initialize() failed." />
        <string id="CmServiceInitOpenProcessTokenFailed"  value="CmService::Service::OpenProcessToken() failed with error=[%1]." />
        <string id="CmServiceInitSetPrivilegeFailed"    value="CmService::Service::SetPrivilege() failed with error=[%1]." />
        <string id="CmServiceInitThreadPoolFailed"      value="CmService::Service::ThreadPool.Init() failed." />
        <string id="CmServiceRmInitializeFailed"        value="CmService::RmNet::Init RmInitialize() failed with error=[%1]." />
        <string id="CmServiceSecurityClientAccount"     value="CmService::Client account - Service name [%1][%2] (not reliable)." />
        <string id="CmServiceGetCallerToken"            value="CmService::Get caller token failed with error=[%1]" />

        <string id="CmServicePersistConfigAdd"          value="CmService::PersistConfig::Add - entry[%1]; success? [%2]; fFlush[%3]" />
        <string id="CmServicePersistConfigDelete"       value="CmService::PersistConfig::Delete - entry[%1]; success? [%2]; fFlush[%3]" />

        <string id="CmServicePersistConfigIncompatibleVersion"  value="CmService::Init Attempted to load incompatible config - Name[%1]; PersistedVersion [%2]; PersistedSize[%3]; CurrentVersion[%4]" />
        <string id="CmServicePersistConfigMigrateError"         value="CmService::Init Failed to migrate previous version config  - Name[%1]; PersistedVersion [%2]; PersistedSize[%3]; CurrentVersion[%4]; Result[%5]" />
        <string id="CmServicePersistPolicyIncompatibleVersion"  value="CmService::Init Attempted to load incompatible policy data - Type[%1]; PersistedVersion [%2]; PersistedSize[%3]; CurrentVersion[%4]" />

        <string id="CmServiceSortConnectionsByPolicy"   value="CmService::MappingsPolicy::SortConnectionsByPolicy - matching account id [%1], host [%2]; match found? [%3]" />
        <string id="CmServicePrintRequirements"         value="CmService::Requirements - req [%1/%2]: [%3] [%4] [%5]" />
        <string id="CmServicePrintPreferences"          value="CmService::Preferences - prefs  [%1/%2]: [%3] [%4] [%5]" />
        <string id="CmServiceAcquireConnectionByInterfaceIndex" value="CmService::AcquireConnectionByInterfaceIndex error [%1]" />
        <string id="CmServiceAcquireIfMatched"          value="CmService::Connection - AcquireIfMatched error [%1]" />
        <string id="CmServiceRaiseAutoConnectPriority"  value="CmService::RaiseAutoConnectPriority - con[%1], res[%2]" />

        <string id="CmServiceGetDetailsIpAddr"                      value="CmService::Connection::GetDetails -  ConnectionName [%1], State [%2], AdapterName [%3], IfIndex [%4], IfType [%5], AddressCount [%6]" />
        <string id="CmServiceIpAddrAdapterInfo"                     value="CmService::AdapterAddresses - AdapterName [%1], Friendly Name [%2], IfIndex [%3], OperStatus [%4], IsUnicastAddrAvailable [%5]" />
        <string id="CmServiceGetAdapterAddressResult"                 value="CmService::AdapterAddresses::Refresh - GetAdapterAddresses Returned with [%1]" />
          
        <string id="CmServiceGetNotificationImplParameterInvalid"   value="CmService::CmServiceGetNotificationImpl - some of the following parameters are invalid, hListener [%1], pNotification [%2], pcbNotification [%3], *pcbNotification [%4]" />
        <string id="CmServiceGetNotificationNoRegistration"         value="CmService::NotifListeners::GetAndRemoveNotif - Registration for listener [%1] does not exist" />
        <string id="CmServiceQueuedNotificationToListeners"         value="CmService::NotifListeners - Queued notification type [%1] to [%2] listeners; error [%3]" />
        <string id="CmServiceInitGlobalsWnfConnectedState"          value="CmService::InitGlobalsForWnfConnectedState()- initialize complete(error=[%1])." />
        <string id="CmServiceUpdateWnfConnectedState"               value="CmService::UpdateWnfConnectedsState()- update done(RadioOrNonCellularConnectedState=[%1], RadioActivity=[%2], NonCellularConnected=[%3])." />
        <string id="CmServicePublishWnfConnectedStateError"         value="CmService::PublishWnfConnectedState()- RtlPublishWnfStateData() error = [%1]." />
        <string id="CmServicePublishWnfNonCellularConnectedStateError"     value="CmService::NonCellularConnectedState publish - RtlPublishWnfStateData() error = [%1]." />
        <string id="CmServiceNetworkStateChangeTimerProc"   value="CmService::NetworkStateChangeEventManager fired network state change with event data [%1] and status [%2]" />
        <string id="CmServiceNetworkStateChangeEnqueue"     value="CmService::NetworkStateChangeEventManager started a new timer to deliver network state change with event data [%1]" />
        <string id="CmServiceNetworkStateChangeNoEnqueue"   value="CmService::NetworkStateChangeEventManager using an existing queued timer to deliver network state change with event data [%1]" />

        <string id="CmServiceInitializePhase1"      value="CmService::Init Phase 1 (Thread pool, WNF states, always connected connection, CM policies init) - time  ms [%1]." />
        <string id="CmServiceInitializePhase2"      value="CmService::Init Phase 2 (Rm/Rsps init) - time ms [%1]." />
        <string id="CmServiceInitializePhase3"      value="CmService::Init Phase 3 (Add persistent connections, claim connections) - time ms [%1]." />
        <string id="CmServiceInitAddConfigFailure"  value="CmService::Init Phase 3 AddConnectionConfig Failed entry[%1] res[%2]" />
        <string id="CmServiceInitializeACsp"        value="CmService::Init Csp [%1] - time ms [%2], Result [%3]" />
        <string id="CmServiceCspInitComplete"       value="CmService::Init Csp [%1], Result [%2]" />
        <string id="CmServiceCspInitError"          value="CmService::Init Csp [%1] Error. CM does not expect async init notification from this CSP" />
        
        <string id="CmServiceAlwaysConnectedScheduleWI"             value="CmService::AlwaysConnected - Scheduled work item [%1], type[%2], conn[%3][%4], delay ms[%5]" />
        <string id="CmServiceAlwaysConnectedReconnect"              value="CmService::AlwaysConnected - Reconnect conn[%1][%2], already acquired? [%3], connected[%4], allow cancel? [%5], advance schedule [%6], reset schedule? [%7]" />
        <string id="CmServiceAlwaysConnectedProcessWI"              value="CmService::AlwaysConnected - ProcessWorkItem [%1], type [%2], conn[%3][%4]" />

        <string id="CmServiceTimerQueueEnqueue"       value="CmService::TimerQueue - WorkItem [%1] enqueued, msecs until run [%2]." />
        <string id="CmServiceTimerQueueCancel"        value="CmService::TimerQueue - WorkItem [%1] cancel attempted, result [%2]." />
        <string id="CmServiceTimerQueueItemCompleted" value="CmService::TimerQueue - WorkItem [%1] completed." />
          
        <string id="CmServicePdcResiliencyClientRegister"           value="CmService::PdcResiliencyClientRegister - Result [%1]" />
        <string id="CmServicePdcResiliencyClientUnregister"         value="CmService::PdcResiliencyClientUnregister - Result [%1]" />
        <string id="CmServicePdcResiliencyClientCallback"           value="CmService::CmServicePdcResiliencyClientCallback - Network Quiet Mode [%1]" />
        <string id="CmServicePdcActivationClientRegister"           value="CmService::PdcActivationClientRegister - Status [%1]" />
        <string id="CmServicePdcActivationClientUnregister"         value="CmService::PdcActivationClientUnregister - Status [%1]" />
        <string id="CmServicePdcActivationClientActivityRequest"    value="CmService::PdcActivationClientActivityRequest - Activate [%1], Status [%2]" />
        <string id="CmServiceSetNetworkReference"                   value="CmService::SetNetworkReference - Activate [%1], Result [%2], TotalNetworkRefCount [%3], ProcessId [%4], PerProcessNetworkRefCount [%5], App [%6]" />
        <string id="CmServiceReleaseNetworkReferenceInProcess"      value="CmService::ReleaseNetworkReferenceInProcess - ProcessId [%1], PerProcessNetworkRefCount [%2], TotalNetworkRefCount [%3]" />
        <string id="CmServiceAcquireNdisReference"                  value="CmService::AcquireNdisReference - Result [%1], TotalCmNdisRefCount [%2], ProcessId [%3], PerProcessCmNdisRefCount [%4], App [%5]" />
        <string id="CmServiceReleaseNdisReference"                  value="CmService::ReleaseNdisReference - Result [%1], TotalCmNdisRefCount [%2], ProcessId [%3], PerProcessCmNdisRefCount [%4], App [%5]" />
        <string id="CmServiceNdisReferenceError"                    value="CmService::NdisReference - [%1]: Result [%2]" />
        <string id="CmServiceReleaseNdisReferenceInProcess"         value="CmService::ReleaseCmNdisReferenceInProcess - ProcessId [%1], PerProcessCmNdisRefCount [%2], TotalCmNdisRefCount [%3]" />
        <string id="CmServiceNdisReferenceIoctlResult"              value="CmService::NdisReference - [%1] InterfaceLuid [%2], Result [%3]" />

        <string id="CmServiceUpdatePolicy"                          value="CmService::CmServiceUpdatePolicy - Policy Type [%1], Result [%2]" />
        <string id="CmServiceUpdateMappingsPolicy"                  value="CmService::MappingsPolicy::CmServiceUpdateMappingsPolicy - ClientType[%1], Account [%2], Host [%3]" />
        <string id="CmServiceFilterConnectionsByMappingsPolicy"     value="CmService::MappingsPolicy::CmServiceFilterConnectionsByMappingsPolicy - Connection [%1], Policy Required, [%2], Match Policy Data [%3]" />

        <string id="3000" value="Error: CM FirewallEnforcer failed to open the local firewall store HRESULT [%1]" />
        <string id="3001" value="Error: CM FirewallEnforcer failed to open the dynamic firewall store HRESULT [%1]" />
        <string id="3002" value="Error: CM FirewallEnforcer failed to get configuration from firewall HRESULT [%1]" />
        <string id="3003" value="Error: CM FirewallEnforcer failed to set configuration to firewall HRESULT [%1]" />
        <string id="3004" value="Error: CM FirewallEnforcer SetFirewallRule failed ruleId [%1] HRESULT [%2]" />
        <string id="3005" value="Error: CM FirewallEnforcer failed to query rules HRESULT [%1]" />
        <string id="3006" value="Error: CM FirewallEnforcer DeleteFirewallRule failed ruleId [%1] HRESULT [%2]" />
        <string id="3007" value="Error: CM FirewallEnforcer failed to apply a change [%2] to ruleId [%1] HRESULT [%3]" />
        <string id="3008" value="CM FirewallEnforcer Start Result [%1]" />
        <string id="3009" value="CM FirewallEnforcer Stop Result [%1]" />
        <string id="3010" value="CM ZeroRateEnforcePolicy SetState Previous [%1] New [%2] Result [%3]" />
        <string id="3011" value="CM ZeroRateEnforcePolicy AddZeroRatedClient AccountId [%1] Sid [%2] fPackageSid [%3] Result [%4]" />
        <string id="3012" value="CM ZeroRateEnforcePolicy RemoveZeroRatedClient AccountId [%1] Sid [%2] Result [%3]" />
        <string id="3013" value="CM ZeroRateEnforcePolicy RemoveAllZeroRatedClients. Remove Mappings Result [%1], Remove FW Rules Result [%2]" />
        <string id="3014" value="Error: CM ZeroRateEnforcePolicy Invalid account name on mapping" />
        <string id="3015" value="Error: CM ZeroRateEnforcePolicy No Zero rate connections found" />
        <string id="3016" value="CM ZeroRateEnforcePolicy HandleDeviceTypeDisableStateChange Disable [%1] EnforcementState [%2] Result [%3]" />
        <string id="3017" value="CM ZeroRateEnforcePolicy HandleEnforcementRequest Enforce [%1] EnforcementState [%2] Result [%3]" />
        <string id="3018" value="CM ZeroRateEnforcePolicy Add zero rated connection Name [%1]" />
        <string id="3019" value="CM ZeroRateEnforcePolicy Remove zero rated connection Name [%1]" />
        <string id="3020" value="CM Disable policy: set forced state. Previous [%1] New [%2] Result [%3]" />
        <string id="3021" value="CM Disable policy: applying forced config to handlers." />

        <string id="PolicyType.CMPT_CONNECTION_MAPPINGS"            value="CMPT_CONNECTION_MAPPINGS" />
        <string id="PolicyType.CMPT_ROAMING_CONNECTIONS"            value="CMPT_ROAMING_CONNECTIONS" />
        <string id="PolicyType.CMPT_DISABLED_CONNECTIONS"           value="CMPT_DISABLED_CONNECTIONS" />
        <string id="PolicyType.CMPT_EXCLUSIVE_CONNECTIONS"          value="CMPT_EXCLUSIVE_CONNECTIONS" />

        <string id="Result.CMRE_SUCCESS"                            value="CMRE_SUCCESS" />
        <string id="Result.CMRE_INVALID_REQUIREMENTS"               value="CMRE_INVALID_REQUIREMENTS" />
        <string id="Result.CMRE_INVALID_PREFERENCES"                value="CMRE_INVALID_PREFERENCES" />
        <string id="Result.CMRE_INVALID_SESSION"                    value="CMRE_INVALID_SESSION" />
        <string id="Result.CMRE_INVALID_CONNECTION"                 value="CMRE_INVALID_CONNECTION" />
        <string id="Result.CMRE_INVALID_CONNECTION_TYPE"            value="CMRE_INVALID_CONNECTION_TYPE" />
        <string id="Result.CMRE_INVALID_DEVICE"                     value="CMRE_INVALID_DEVICE" />
        <string id="Result.CMRE_INVALID_PARAMETER"                  value="CMRE_INVALID_PARAMETER" />
        <string id="Result.CMRE_INVALID_VERSION"                    value="CMRE_INVALID_VERSION" />
        <string id="Result.CMRE_INVALID_HOST"                       value="CMRE_INVALID_HOST" />
        <string id="Result.CMRE_INCONSISTENT_CONFIGURATION"         value="CMRE_INCONSISTENT_CONFIGURATION" />
        <string id="Result.CMRE_INSUFFICIENT_BUFFER"                value="CMRE_INSUFFICIENT_BUFFER" />
        <string id="Result.CMRE_CONNECTION_ITERATION_NOT_STARTED"   value="CMRE_CONNECTION_ITERATION_NOT_STARTED" />
        <string id="Result.CMRE_NO_CONNECTIONS"                     value="CMRE_NO_CONNECTIONS" />
        <string id="Result.CMRE_HOST_ADDRESS_ITERATION_NOT_STARTED" value="CMRE_HOST_ADDRESS_ITERATION_NOT_STARTED" />
        <string id="Result.CMRE_NO_HOST_ADDRESSES"                  value="CMRE_NO_HOST_ADDRESSES" />
        <string id="Result.CMRE_CONNECTION_ACQUIRE_FAILED"          value="CMRE_CONNECTION_ACQUIRE_FAILED" />
        <string id="Result.CMRE_CONNECTION_RESOURCE_CONFLICT"       value="CMRE_CONNECTION_RESOURCE_CONFLICT" />
        <string id="Result.CMRE_CONNECTION_ALREADY_ACQUIRED"        value="CMRE_CONNECTION_ALREADY_ACQUIRED" />
        <string id="Result.CMRE_CONNECTION_NOT_ACQUIRED"            value="CMRE_CONNECTION_NOT_ACQUIRED" />
        <string id="Result.CMRE_CONNECTION_NOT_RELEASED"            value="CMRE_CONNECTION_NOT_RELEASED" />
        <string id="Result.CMRE_CONNECTION_RELEASE_FAILED"          value="CMRE_CONNECTION_RELEASE_FAILED" />
        <string id="Result.CMRE_CONNECTION_ALREADY_EXISTS"          value="CMRE_CONNECTION_ALREADY_EXISTS" />
        <string id="Result.CMRE_CONNECTION_DOES_NOT_EXIST"          value="CMRE_CONNECTION_DOES_NOT_EXIST" />
        <string id="Result.CMRE_CONNECTION_AUTHENTICATION_FAILED"   value="CMRE_CONNECTION_AUTHENTICATION_FAILED" />
        <string id="Result.CMRE_NOT_ALLOWED"                        value="CMRE_NOT_ALLOWED" />
        <string id="Result.CMRE_NO_NOTIFICATIONS"                   value="CMRE_NO_NOTIFICATIONS" />
        <string id="Result.CMRE_NO_POLICIES"                        value="CMRE_NO_POLICIES" />
        <string id="Result.CMRE_OUT_OF_MEMORY"                      value="CMRE_OUT_OF_MEMORY" />
        <string id="Result.CMRE_PENDING"                            value="CMRE_PENDING" />
        <string id="Result.CMRE_ACCESS_DENIED"                      value="CMRE_ACCESS_DENIED" />
        <string id="Result.CMRE_NOT_SUPPORTED"                      value="CMRE_NOT_SUPPORTED" />
        <string id="Result.CMRE_NOT_IMPLEMENTED"                    value="CMRE_NOT_IMPLEMENTED" />
        <string id="Result.CMRE_UNEXPECTED"                         value="CMRE_UNEXPECTED" />
        <string id="Result.CMRE_NOT_INITIALIZED"                    value="CMRE_NOT_INITIALIZED" />
        <string id="Result.CMRE_CONNECTION_FAILED_TO_ASSOCIATE"     value="CMRE_CONNECTION_FAILED_TO_ASSOCIATE" />
        <string id="Result.CMRE_CONNECTION_IP_NOT_FOUND"            value="CMRE_CONNECTION_IP_NOT_FOUND" />
        <string id="Result.CMRE_SERVICE_UNAVAILABLE"                value="CMRE_SERVICE_UNAVAILABLE" />     

        <string id="ActivityState.CMDS_UNKNOWN" value="CMDS_UNKNOWN" />
        <string id="ActivityState.CMDS_DORMANT" value="CMDS_DORMANT" />
        <string id="ActivityState.CMDS_ACTIVE"  value="CMDS_ACTIVE" />

        <string id="Characteristic.CMCH_BANDWIDTH_KBITPS"   value="CMCH_BANDWIDTH_KBITPS" />
        <string id="Characteristic.CMCH_ROAMING"            value="CMCH_ROAMING" />
        <string id="Characteristic.CMCH_PERSISTENT"         value="CMCH_PERSISTENT" />
        <string id="Characteristic.CMCH_CELLULAR"           value="CMCH_CELLULAR" />
        <string id="Characteristic.CMCH_DATA_PLAN_STATE"    value="CMCH_DATA_PLAN_STATE" />
        <string id="Characteristic.CMCH_VOICECALL_CONFLICT_STATE"    value="CMCH_VOICECALL_CONFLICT_STATE" />
        <string id="Characteristic.CMCH_CLAIMED"            value="CMCH_CLAIMED" />
        <string id="Characteristic.CMCH_EXECUTOR"           value="CMCH_EXECUTOR" />

        <string id="RequirementOp.CMRO_LESS_OR_EQUAL"       value="CMRO_LESS_OR_EQUAL" />
        <string id="RequirementOp.CMRO_GREATER_OR_EQUAL"    value="CMRO_GREATER_OR_EQUAL" />
        <string id="RequirementOp.CMRO_EQUAL"               value="CMRO_EQUAL" />
        <string id="RequirementOp.CMRO_NOT_EQUAL"           value="CMRO_NOT_EQUAL" />
        
        <string id="PreferenceOp.CMPO_LOWEST"               value="CMPO_LOWEST" />
        <string id="PreferenceOp.CMPO_HIGHEST"              value="CMPO_HIGHEST" />
        <string id="PreferenceOp.CMPO_LESS_OR_EQUAL"        value="CMPO_LESS_OR_EQUAL" />
        <string id="PreferenceOp.CMPO_GREATER_OR_EQUAL"     value="CMPO_GREATER_OR_EQUAL" />
        <string id="PreferenceOp.CMPO_EQUAL"                value="CMPO_EQUAL" />
        <string id="PreferenceOp.CMPO_NOT_EQUAL"            value="CMPO_NOT_EQUAL" />
        <string id="Operator.INVALID"                       value="INVALID OPERATOR" />
        
        <string id="ConnectionState.CMCS_DISCONNECTED"              value="CMCS_DISCONNECTED" />
        <string id="ConnectionState.CMCS_DISCONNECTED_UNAVAILABLE"  value="CMCS_DISCONNECTED_UNAVAILABLE" />
        <string id="ConnectionState.CMCS_DISCONNECTED_DISABLED"     value="CMCS_DISCONNECTED_DISABLED" />
        <string id="ConnectionState.CMCS_CONNECTING"                value="CMCS_CONNECTING" />
        <string id="ConnectionState.CMCS_CONNECTING_ASSOCIATING"    value="CMCS_CONNECTING_ASSOCIATING" />
        <string id="ConnectionState.CMCS_CONNECTING_AUTHENTICATING" value="CMCS_CONNECTING_AUTHENTICATING" />
        <string id="ConnectionState.CMCS_CONNECTING_WAITING_FOR_IP" value="CMCS_CONNECTING_WAITING_FOR_IP" />
        <string id="ConnectionState.CMCS_CONNECTED"                 value="CMCS_CONNECTED" />
        <string id="ConnectionState.CMCS_SUSPENDED"                 value="CMCS_SUSPENDED" />
        <string id="ConnectionState.CMCS_DISCONNECTING"             value="CMCS_DISCONNECTING" />

        <string id="FsmState.sInvalid"              value="sInvalid" />
        <string id="FsmState.sDisdUnavCsp"          value="sDisdUnavCsp" />
        <string id="FsmState.sDisdUnavRm"           value="sDisdUnavRm" />
        <string id="FsmState.sDisdUnavCspRm"        value="sDisdUnavCspRm" />
        <string id="FsmState.sDisdUnavClaim"        value="sDisdUnavClaim" />
        <string id="FsmState.sDisd"                 value="sDisd" />
        <string id="FsmState.sCong"                 value="sCong" />
        <string id="FsmState.sCongSuspdRm"          value="sCongSuspdRm" />
        <string id="FsmState.sCongSuspdRmUnavCsp"   value="sCongSuspdRmUnavCsp" />
        <string id="FsmState.sCongSuspdRmUnavRm"    value="sCongSuspdRmUnavRm" />
        <string id="FsmState.sCongSuspdRmUnavCspRm" value="sCongSuspdRmUnavCspRm" />
        <string id="FsmState.sCongUnavCsp"          value="sCongUnavCsp" />
        <string id="FsmState.sCongUnavRm"           value="sCongUnavRm" />
        <string id="FsmState.sCongUnavCspRm"        value="sCongUnavCspRm" />
        <string id="FsmState.sCongAsscg"            value="sCongAsscg" />
        <string id="FsmState.sCongAuthg"            value="sCongAuthg)" />
        <string id="FsmState.sCongWtgIp"            value="sCongWtgIp" />
        <string id="FsmState.sCond"                 value="sCond" />
        <string id="FsmState.sCondUnavRm"           value="sCondUnavRm" />
        <string id="FsmState.sCondClaim"            value="sCondClaim" />
        <string id="FsmState.sSuspdRm"              value="sSuspdRm" />
        <string id="FsmState.sSuspdRmUnavRm"        value="sSuspdRmUnavRm" />
        <string id="FsmState.sDisg"                 value="sDisg" />
        <string id="FsmState.sDisgUnavCsp"          value="sDisgUnavCsp" />
        <string id="FsmState.sDisgUnavRm"           value="sDisgUnavRm" />
        <string id="FsmState.sDisgUnavCspRm"        value="sDisgUnavCspRm" />

        <string id="FsmResult.trTransitioned"           value="trTransitioned" />
        <string id="FsmResult.trAlreadyInWantedState"   value="trAlreadyInWantedState" />
        <string id="FsmResult.trInvalidAction"          value="trInvalidAction" />
        <string id="FsmResult.trRetryLater"             value="trRetryLater" />
        
        <string id="CmCspInitResult.rCspInit_Success"                   value="success" />
        <string id="CmCspInitResult.rCspInit_LoadLibrary_Failure"       value="failed to load library" />
        <string id="CmCspInitResult.rCspInit_GetProcAddress_Failure"    value="failed to GetProcAddress" />

        <string id="CmRPCRegisterType.Interface"    value="Interface" />
        <string id="CmRPCRegisterType.EndPoint"    value="EndPoint" />

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
