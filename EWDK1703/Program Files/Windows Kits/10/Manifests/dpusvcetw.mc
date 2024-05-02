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
<!-- <?xml version="1.0" encoding="UTF-16"?> -->
<instrumentationManifest xsi:schemaLocation="http://schemas.microsoft.com/win/2004/08/events eventman.xsd" 
                         xmlns="http://schemas.microsoft.com/win/2004/08/events" 
                         xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events" 
                         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                         xmlns:xs="http://www.w3.org/2001/XMLSchema" 
                         xmlns:trace="http://schemas.microsoft.com/win/2004/08/events/trace">
  <instrumentation>
    <events>
      <provider name="Microsoft-WindowsPhone-DataPlanUsageServiceProvider" 
                guid="{65423FB8-9AE9-409E-95E6-DE74FF95B2BC}" 
                symbol="MICROSOFT_WINDOWSPHONE_DPUSVC_PROVIDER" 
                resourceFileName="DpuSvc.dll" 
                messageFileName="DpuSvc.dll">
        <events>
          <event value="1"
                 symbol="DPUSVC_SERVICE_INIT"  
                 version="0" 
                 level="win:Informational" 
                 keywords="Error" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.1.message)" />
          
          <event value="2" 
                 symbol="DPUSVC_SERVICE_UNINIT"  
                 version="0" 
                 level="win:Informational" 
                 keywords="Error" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.2.message)"/>

          <event value="3" 
                 symbol="DPUSVC_SERVICE_INIT_BEGIN"  
                 version="0" 
                 level="win:Informational" 
                 keywords="Error"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.3.message)"/>

          <event value="4" 
                 symbol="DPUSVC_INIT_EVENT_HANDLER_BEGIN"
                 version="0" 
                 level="win:Informational" 
                 keywords="Error"
                 template="Template_ClassType"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.4.message)"/>

          <event value="5" 
                 symbol="DATAPLAN_START_TRACKING"
                 version="0" 
                 level="win:Informational" 
                 keywords="Error"
                 template="Template_ClassType"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.5.message)"/>

          <event value="6" 
                 symbol="DATAPLAN_SERVICE_INIT_FAILURE"
                 version="0" 
                 level="win:Informational" 
                 keywords="Error"
                 template="Template_OnlyErrorCode" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.6.message)"/>

          <event value="7" 
                 symbol="DATAPLAN_SERVICE_DELAYED_INIT_BEGIN"
                 version="0" 
                 level="win:Informational" 
                 keywords="Error"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.7.message)"/>

          <event value="8" 
                 symbol="DATAPLAN_SERVICE_DELAYED_INIT"
                 version="0" 
                 level="win:Informational" 
                 keywords="Error"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.8.message)"/>

          <event value="9" 
                 symbol="DATAPLAN_SERVICE_DELAYED_INIT_FAILURE"
                 version="0" 
                 level="win:Informational" 
                 keywords="Error"
                 template="Template_OnlyErrorCode" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.9.message)"/>
                 
          <event value="10" 
                 symbol="DPUSVC_CMNOTIFICATION_HANDLER_BEGIN" 
                 version="0" 
                 level="win:Informational"
                 template="Template_ClassType"
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.10.message)"/>

          <event symbol="DPUSVC_CMNOTIFICATION_HANDLER_END" 
                 value="11" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ErrorCode"
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.11.message)"/>

          <event value="12" 
                 symbol="DPUSVC_RPCSETPARAMETER_HANDLER_BEGIN" 
                 version="0" 
                 level="win:Informational" 
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.12.message)"/>

          <event value="13"
                 symbol="DPUSVC_RPCSETPARAMETER_HANDLER_END" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_OnlyErrorCode" 
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.13.message)"/>

          <event value="14" 
                 symbol="DPUSVC_RPCQUERYPARAMETER_HANDLER_BEGIN" 
                 version="0" 
                 level="win:Informational" 
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.14.message)"/>

          <event value="15" 
                 symbol="DPUSVC_RPCQUERYPARAMETER_HANDLER_END" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_OnlyErrorCode" 
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.15.message)"/>

          <event value="16"
                 symbol="DPUSVC_ASYNC_REFRESH"
                 version="0"
                 level="win:Informational"
                 template="Template_ClassType"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.16.message)"/>

          <event value="17"
                 symbol="DPUSVC_RPCRESETDATAUSAGE_HANDLER_BEGIN"
                 version="0"
                 level="win:Informational"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.17.message)"/>

          <event value="18"
                 symbol="DPUSVC_RPCRESETDATAUSAGE_HANDLER_END"
                 version="0"
                 level="win:Informational"
                 template="Template_OnlyErrorCode"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.18.message)"/>

          <event value="19"
                 symbol="DPUSVC_RPCGETATTRIBUTEDNETWORKUSAGE_HANDLER_BEGIN"
                 version="0"
                 level="win:Informational"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.19.message)"/>

          <event value="20"
                 symbol="DPUSVC_RPCGETATTRIBUTEDNETWORKUSAGE_HANDLER_END"
                 version="0"
                 level="win:Informational"
                 template="Template_OnlyErrorCode"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.20.message)"/>

          <event value="21"
                 symbol="DPUSVC_GET_CLAIMED_CONNECTION"
                 version="0"
                 level="win:Informational"
                 template="Template_ClassType"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.21.message)"/>

          <event value="22"
                 symbol="DPUSVC_RPC_GETATTRIBUTEDNETWORKUSAGE_PARAMETER"
                 version="0"
                 level="win:Informational"
                 template="Template_DpuGetAttributedNetworkUsageParameter"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.22.message)"/>

          <event value="23"
                 symbol="DPUSVC_RPCGETLIVETILECONTENT_HANDLER_BEGIN"
                 version="0"
                 level="win:Informational"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.23.message)"/>

          <event value="24"
                 symbol="DPUSVC_RPCGETLIVETILECONTENT_HANDLER_END"
                 version="0"
                 level="win:Informational"
                 template="Template_OnlyErrorCode"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.24.message)"/>
          
          <event value="50" 
                 symbol="DATAPLAN_REFRESH_WNF_GLOBAL_DPUSTATE_FAILURE" 
                 version="0" 
                 level="win:Warning" 
                 template="Template_UpdateGlobalDpuStateWNFFailure" 
                 keywords="Error" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.50.message)"/>

          <event value="51"
                 symbol="DPUSVC_CMNOTIFICATION_DETAILS"
                 version="0" 
                 level="win:Informational" 
                 template="Template_CmNotificationDetails" 
                 keywords="Error" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.51.message)"/>

          <event value="52" 
                 symbol="DPUSVC_SYSTEMTIMECHANGE_HANDLER_BEGIN" 
                 version="0" 
                 level="win:Informational" 
                 keywords="Error" 
                 template="Template_ClassType"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.52.message)"/>

          <event value="53" 
                 symbol="DPU_QUERY_PROCESS_AS_STATS" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_QueryAsStats"
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.53.message)"/>

          <event value="54" 
                 symbol="DPUSVC_USER_DATAPLAN_STATIC" 
                 version="0" 
                 level="win:Informational"
                 template="Template_DataPlanType"
                 keywords="Error"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.54.message)"/>

          <event value="55"
                 symbol="DPUSVC_SIM_DATA_PLAN"
                 version="0"
                 level="win:Informational"
                 template="Template_ClassTypeAndString"
                 keywords="Error"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.55.message)"/>
          
          <event value="56" 
                 symbol="DPUSVC_USER_DATAPLAN_FIXED" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_FixedDataPlan" 
                 keywords="Error "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.56.message)"/>

          <event value="57" 
                 symbol="DPUSVC_DATA_SAVER_MODE" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_DataSaverMode" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.57.message)"/>

          <event value="58" 
                 symbol="DPUSVC_SYSTEMTIMECHANGE_HANDLER_END" 
                 version="0" 
                 level="win:Informational" 
                 keywords="Error "
                 template="Template_ErrorCode"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.58.message)"/>

          <event value="59" 
                 symbol="DPUSVC_CMCONNECTION_DETAILS" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_CmConnectionDetails" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.59.message)"/>

          <event value="60" 
                 symbol="DATAPLAN_REFRESH_GLOBAL_DPUSTATE_WNF" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_UpdateGlobalDpuStateWNFFailure" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.60.message)"/>

          <event value="61"
                 symbol="DATAPLAN_REFRESH_GLOBAL_DPUSTATE" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_RefreshGlobalDpuState" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.61.message)"/>

          <event value="62"
                 symbol="DPUSVC_SYSTEMTIMECHANGE_IGNORE" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ClassType" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.62.message)"/>

          <event value="63"
                 symbol="DPUSVC_SYSTEMTIMECHANGE_UPDATE_DATAPLAN" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_TimeDelta" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.63.message)"/>

          <event value="65" 
                 symbol="DATAPLAN_REGISTER_NDUNOTIFICATION_REMOVED" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_RegisterNduNotificationOps" 
                 keywords="Error "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.65.message)"/>

          <event value="66" 
                 symbol="DATAPLAN_REGISTER_NDUNOTIFICATION_ADDED" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_RegisterNduNotificationOps" 
                 keywords="Error "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.66.message)"/>

          <event value="67" 
                 symbol="DPUSVC_TIMEZONECHANGE_HANDLER_BEGIN" 
                 version="0" 
                 level="win:Informational" 
                 keywords="Error" 
                 template="Template_ClassType"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.67.message)"/>

          <event value="68"
                 symbol="DPUSVC_TIMEZONECHANGE_HANDLER_END" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ErrorCode" 
                 keywords="Performance " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.68.message)"/>

          <event value="69"
                 symbol="DPUSVC_DPUCONNECTION_DETAILS"
                 version="0"
                 level="win:Informational"
                 template="Template_DpuConnectionDetails"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.69.message)"/>

          <event value="70"
                 symbol="DPUSVC_DPUCONNECTION_INVALID"
                 version="0"
                 level="win:Informational"
                 template="Template_ClassTypeAndString"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.70.message)"/>
          
          <event value="71"
                 symbol="DPUSVC_RPC_OP_PARAMETER"
                 version="0"
                 level="win:Informational"
                 template="Template_DpuOp"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.71.message)"/>

          <event value="72"
                 symbol="DPUSVC_CONNCONFIG"
                 version="0"
                 level="win:Informational"
                 template="Template_ConnConfig"
                 keywords="Performance "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.72.message)"/>

          <event value="80" 
                 symbol="DATAPLAN_SET_CM_DPUCHAR" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_SetCMDpuChar" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.80.message)"/>

          <event value="81"
                 symbol="DATAPLAN_SET_CM_DPUCHAR_FAILURE"
                 version="0" 
                 level="win:Warning" 
                 template="Template_ErrorCode" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.81.message)"/>

          <event value="82" 
                 symbol="DATAPLAN_REGISTER_NDUNOTIFICATION_FAILURE" 
                 version="0" 
                 level="win:Warning" 
                 template="Template_RegisterNduNotificationFailure" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.82.message)"/>

          <event value="83" 
                 symbol="DATAPLAN_EOD_NOTIFICATION_HANDLER_BEGIN" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ClassType"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.83.message)"/>

          <event value="84" 
                 symbol="DATAPLAN_NDU_BYTELIMIT_NOTIFICATION_HANDLER_BEGIN" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ClassType"
                 keywords="Performance " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.84.message)"/>

          <event value="85"
                 symbol="DATAPLAN_EOD_NOTIFICATION_HANDLER_END" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ErrorCode" 
                 keywords="Performance " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.85.message)"/>

          <event value="86" 
                 symbol="DATAPLAN_NDU_BYTELIMIT_NOTIFICATION_HANDLER_END" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ErrorCode" 
                 keywords="Performance " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.86.message)"/>

          <event value="87" 
                 symbol="DATAPLAN_BILLINGCYCLE_DAY" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_BillingCycle_Day" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.87.message)"/>

          <event value="88" 
                 symbol="DATAPLAN_BILLINGCYCLE" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_BillingCycle" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.88.message)"/>

          <event value="89" 
                 symbol="DATAPLAN_DATAPLAN_CURVE" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_DataPlanCurve" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.89.message)"/>

          <event value="90" 
                 symbol="DATAPLAN_DATAPLAN_DPUSTATE" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_DpuState" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.90.message)"/>

          <event value="91" 
                 symbol="DATAPLAN_ADD_CMCONNECTION" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_AddCmConnection" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.91.message)"/>

          <event value="92" 
                 symbol="DPU_GRACEFUL_COMPLETION" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ClassType" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.92.message)"/>

          <event value="93" 
                 symbol="DATAPLAN_SRUM_QUERY" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_SrumQuery" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.93.message)"/>

          <event value="94" 
                 symbol="DATAPLAN_STOP_TRACKING" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ClassType" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.94.message)"/>

          <event value="95" 
                 symbol="DATAPLAN_SHOW_NOTIFICATION" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_Notification" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.95.message)"/>

          <event value="96" 
                 symbol="DATAPLAN_UPDATE_LIVETILE" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ClassType" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.96.message)"/>

          <event value="97" 
                 symbol="DATAPLAN_DONT_UPDATE_LIVETILE" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ClassType" 
                 keywords="Error " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.97.message)"/>

          <event value="98" 
                 symbol="DATAPLAN_NDU_POLLHINT_NOTIFICATION_HANDLER_BEGIN" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ClassType"
                 keywords="Performance " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.98.message)"/>

          <event value="99" 
                 symbol="DATAPLAN_NDU_POLLHINT_NOTIFICATION_HANDLER_END" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ErrorCode" 
                 keywords="Performance " 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.99.message)"/>

          <event value="101"
                 symbol="DPUSVC_EXCEPTION_WIN32"
                 version="0"
                 level="win:Error"
                 template="Template_OnlyErrorCode"
                 keywords="Error"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.101.message)"/>

          <event value="102"
                 symbol="DPUSVC_EXCEPTION_WINHR"
                 version="0" 
                 level="win:Error"
                 template="Template_OnlyErrorCodeHex"
                 keywords="Error"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.102.message)"/>

          <event value="103"
                 symbol="DPUSVC_EXCEPTION_CM"
                 version="0"
                 level="win:Error"
                 template="Template_OnlyErrorCode"
                 keywords="Error"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.103.message)"/>
          
          <event value="104"
                 symbol="DPUSVC_OUTOFMEMORY"
                 version="0"
                 level="win:Warning"
                 keywords="Error "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.104.message)"/>

          <event value="105"
                 symbol="DPUSVC_EXCEPTION_NT"
                 version="0"
                 level="win:Error"
                 template="Template_OnlyErrorCode"
                 keywords="Error "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.105.message)"/>

          <event value="106"
                 symbol="DPUSVC_EXCEPTION_SWALLOW"
                 version="0"
                 level="win:Warning"
                 keywords="Error "
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.106.message)"/>

          <event value="107" 
                 symbol="DPUSVC_REGISTER_USAGE_NOTIFICATION_BEGIN" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ClassType"
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.107.message)"/>

          <event value="108" 
                 symbol="DPUSVC_REGISTER_USAGE_NOTIFICATION_END" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ErrorCode"
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.108.message)"/>

          <event value="109" 
                 symbol="DPUSVC_UNREGISTER_USAGE_NOTIFICATION_BEGIN" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ClassType"
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.109.message)"/>

          <event value="110" 
                 symbol="DPUSVC_UNREGISTER_USAGE_NOTIFICATION_END" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_ErrorCode"
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.110.message)"/>

          <event value="111" 
                 symbol="DATAPLAN_CELLULAR_LIVETILE" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_Cellular_LiveTile"
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.111.message)"/>

          <event value="112" 
                 symbol="DATAPLAN_WIFI_LIVETILE" 
                 version="0" 
                 level="win:Informational" 
                 template="Template_WiFi_LiveTile"
                 keywords="Performance" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.112.message)"/>

          <event value="113" 
                 symbol="DATAPLAN_PUBLISH_SEB_INTERNET_PRESENT"
                 version="0" 
                 level="win:Informational" 
                 template="Template_PubSebLevelEvent" 
                 keywords="Informational" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.113.message)"/>

          <event value="114" 
                 symbol="DATAPLAN_PUBLISH_SEB_FREE_NETWORK_PRESENT"
                 version="0" 
                 level="win:Informational" 
                 template="Template_PubSebLevelEvent" 
                 keywords="Informational" 
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.114.message)"/>

           <event value="116"
                  symbol="DATAPLAN_NDU_RECALCULATEQUOTA"
                  version="0"
                  level="win:Informational"
                  template="Template_RecalcQuotaEvent"
                  keywords="Informational"
                  message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.116.message)"/>

           <event value="117"
                  symbol="DATAPLAN_NDU_BYTECOUNTLIMIT"
                  version="0"
                  level="win:Informational"
                  template="Template_NduByteCountLimit"
                  keywords="Informational"
                  message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.117.message)"/>

          <event value="118"
                 symbol="DATAPLAN_USAGE_WNFSTATE"
                 version="0"
                 level="win:Informational"
                 template="Template_ClassTypeWnfState"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.118.message)"/>

           <event value="200"
                  symbol="DPU_QUERY_TIME_WINDOW"
                  version="0"
                  level="win:Informational"
                  template="Template_QueryTimeWindow"
                  keywords="Informational"
                  message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.200.message)"/>

          <event value="201"
                 symbol="DATAPLAN_BYTE_LIMIT_TRIGGERED"
                 version="0"
                 level="win:Informational"
                 template="Template_ClassTypeWnfState"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.201.message)"/>

          <event value="202"
                 symbol="DATAPLAN_POLL_HINT_TRIGGERED"
                 version="0"
                 level="win:Informational"
                 template="Template_ClassTypeWnfState"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.202.message)"/>

          <event value="203"
                 symbol="DPUSVC_SIM_SLOT"
                 version="0"
                 level="win:Informational"
                 template="Template_ClassTypeSimSlot"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.203.message)"/>

          <event value="204"
                 symbol="DPUSVC_SELECTED_SIM_SLOT"
                 version="0"
                 level="win:Informational"
                 template="Template_ClassTypeStringNumber"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.204.message)"/>

          <event value="1001"
                 symbol="SRUMHOST_ENTER_CONNECTED_STANDBY"
                 version="0"
                 level="win:Informational"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.1.message)" />

          <event value="1002"
                 symbol="SRUMHOST_EXIT_CONNECTED_STANDBY"
                 version="0"
                 level="win:Informational"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.2.message)"/>

          <event value="1003"
                 symbol="SRUMHOST_SIGNAL_WAKEUP_CHANNEL"
                 version="0"
                 level="win:Informational"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.3.message)"/>

          <!-- MS taken to call NetBwTopAppUsage -->
          <event value="1004"
                 symbol="NETBWAPI_SYSTEM_USAGE_RPC_QUERY_START"
                 version="0"
                 level="win:Informational"
                 keywords="Performance"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.4.message)"/>

          <event value="1005"
                 symbol="NETBWAPI_SYSTEM_USAGE_RPC_QUERY_END"
                 version="0"
                 level="win:Informational"
                 template="Template_ErrorCodeUInt"
                 keywords="Error"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.5.message)"/>

          <event value="1006"
                 symbol="SRUMHOST_TOPAPP_RESULTS"
                 version="0"
                 level="win:Informational"
                 template="Template_TopAppResults"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.6.message)"/>

          <!-- MS taken to call NetBwConnectionUsage -->
          <event value="1007"
                 symbol="SRUMHOST_SRUM_QUERY_START"
                 version="0"
                 level="win:Informational"
                 keywords="Performance"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.7.message)"/>

          <event value="1008"
                 symbol="SRUMHOST_SRUM_QUERY_END"
                 version="0"
                 level="win:Informational"
                 template="Template_ErrorCodeUInt"
                 keywords="Error"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.8.message)"/>

          <event value="1009"
                 symbol="SRUMHOST_CONNUSAGE_RESULTS"
                 version="0"
                 level="win:Informational"
                 template="Template_ConnUsageResults"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.9.message)"/>

          <event value="1010"
                 symbol="SRUMHOST_STARTING"
                 version="0"
                 level="win:Informational"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.10.message)"/>

          <event value="1011"
                 symbol="SRUMHOST_STARTED"
                 version="0"
                 level="win:Informational"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.11.message)"/>

          <event value="1012"
                 symbol="SRUMHOST_SHUTDOWNINPROGRESS"
                 version="0"
                 level="win:Informational"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.12.message)"/>

          <event value="1013"
                 symbol="SRUMHOST_CALLTRACE"
                 version="0"
                 level="win:Informational"
                 template="Template_CallTrace"
                 keywords="Informational"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.13.message)"/>

          <event value="1014"
                 symbol="SRUMHOST_CONNUSAGE_START"
                 version="0"
                 level="win:Informational"
                 keywords="Performance"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.14.message)"/>

          <event value="1020"
                 symbol="SRUMHOST_SYSTEM_USAGE_START"
                 version="0"
                 level="win:Informational"
                 keywords="Performance"
                 task="Query"
                 opcode="win:Start"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.20.message)"/>

          <event value="1021"
                 symbol="SRUMHOST_SYSTEM_USAGE_END"
                 version="0"
                 level="win:Informational"
                 template="Template_ErrorCodeUInt"
                 keywords="Error"
                 task="Query"
                 opcode="win:Stop"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.21.message)"/>

          <event value="1030"
                 symbol="SRUMHOST_TOPAPP_START"
                 version="0"
                 level="win:Informational"
                 keywords="Performance"
                 message="$(string.Microsoft-WindowsPhone-SrumHostServiceProvider.event.30.message)"/>

        </events>
        
        <levels />
        
        <keywords>
          <keyword name="Error" 
                   mask="0x1" 
                   message="$(string.Keyword.Error)"/>
          
          <keyword name="Performance" 
                   mask="0x2" 
                   message="$(string.Keyword.Performance)"/>
          
          <keyword name="Informational"
                   mask="0x4"
                   message="$(string.Keyword.Informational)"/>
        </keywords>
        
        <maps>
          <valueMap name="CMNotificationType">
              <map value="101" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.CMNotificationType.101.message)"/>

              <map value="102" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.CMNotificationType.102.message)"/>

              <map value="501" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.CMNotificationType.501.message)"/>

              <map value="502" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.CMNotificationType.502.message)"/>

              <map value="503"
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.CMNotificationType.503.message)"/>
          </valueMap>

          <valueMap name="DpuMediaType">
              <map value="0" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuMediaType.0.message)"/>

              <map value="1" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuMediaType.1.message)"/>

              <map value="2" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuMediaType.2.message)"/>

              <map value="3" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuMediaType.3.message)"/>
          </valueMap>
          
          <valueMap name="DpuWNFStateName">
              <map value="0" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.0.message)"/>

              <map value="1" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.1.message)"/>

              <map value="2" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.2.message)"/>

              <map value="3" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.3.message)"/>

              <map value="4" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.4.message)"/>

              <map value="5" 
                   message="$(string.Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.4.message)"/>
          </valueMap>
          
          <valueMap name="ConnectionState">
              <map value="0" 
                   message="$(string.ConnectionState.CMCS_DISCONNECTED)"/>

              <map value="1" 
                   message="$(string.ConnectionState.CMCS_DISCONNECTED_UNAVAILABLE)"/>

              <map value="2" 
                   message="$(string.ConnectionState.CMCS_DISCONNECTED_DISABLED)"/>

              <map value="100" 
                   message="$(string.ConnectionState.CMCS_CONNECTING)"/>

              <map value="101" 
                   message="$(string.ConnectionState.CMCS_CONNECTING_ASSOCIATING)"/>

              <map value="102" 
                   message="$(string.ConnectionState.CMCS_CONNECTING_AUTHENTICATING)"/>

              <map value="103" 
                   message="$(string.ConnectionState.CMCS_CONNECTING_WAITING_FOR_IP)"/>

              <map value="200" 
                   message="$(string.ConnectionState.CMCS_CONNECTED)"/>

              <map value="300" 
                   message="$(string.ConnectionState.CMCS_SUSPENDED)"/>

              <map value="400" 
                   message="$(string.ConnectionState.CMCS_DISCONNECTING)"/>
          </valueMap>

          <valueMap name="CMRoamType">
              <map value="0"
                   message="$(string.CMRoamType.CMRT_HOME)"/>

              <map value="1"
                   message="$(string.CMRoamType.CMRT_DOMESTIC)"/>

              <map value="2"
                   message="$(string.CMRoamType.CMRT_ROAM)"/>
          </valueMap>

          <valueMap name="CMDpuState">
              <map value="0" 
                   message="$(string.CMDpuState.CMDPU_NOT_TRACKED)"/>

              <map value="1" 
                   message="$(string.CMDpuState.CMDPU_UNDER_TRACK)"/>

              <map value="2" 
                   message="$(string.CMDpuState.CMDPU_ON_TRACK)"/>

              <map value="3" 
                   message="$(string.CMDpuState.CMDPU_OFF_TRACK)"/>
            
              <map value="4" 
                   message="$(string.CMDpuState.CMDPU_OVER_LIMIT)"/>
          </valueMap>
          
          <valueMap name="DpuSvcDpuState">
              <map value="1" 
                   message="$(string.DpuSvcDpuState.DPU_STATE_UNKNOWN)"/>

              <map value="3" 
                   message="$(string.DpuSvcDpuState.DPU_STATE_EXEMPT_ZERO_RATE)"/>

              <map value="7" 
                   message="$(string.DpuSvcDpuState.DPU_STATE_OVER_LIMIT)"/>

              <map value="15" 
                   message="$(string.DpuSvcDpuState.DPU_STATE_OFF_TRACK)"/>

              <map value="31" 
                   message="$(string.DpuSvcDpuState.DPU_STATE_ON_TRACK)"/>

              <map value="63" 
                   message="$(string.DpuSvcDpuState.DPU_STATE_UNDER_TRACK)"/>

              <map value="127" 
                   message="$(string.DpuSvcDpuState.DPU_STATE_NOT_TRACKED)"/>
          </valueMap>

          <valueMap name="DpuOpCode">
            <map value="0"
                 message="$(string.DpuOpCode.UserCostProfile)"/>

            <map value="1"
                 message="$(string.DpuOpCode.OperatorCostProfile)"/>

            <map value="2"
                 message="$(string.DpuOpCode.OperatorDataUsage)"/>

            <map value="3"
                 message="$(string.DpuOpCode.DataSaverMode)"/>

            <map value="4"
                 message="$(string.DpuOpCode.ZeroRatedAPNs)"/>

            <map value="5"
                 message="$(string.DpuOpCode.FirstRunShown)"/>

            <map value="6"
                 message="$(string.DpuOpCode.UseUserCost)"/>

            <map value="7"
                 message="$(string.DpuOpCode.ServiceProviderGuid)"/>
          </valueMap>

          <valueMap name="WcmMediaType">
            <map value="0"
                 message="$(string.WcmMediaType.Unknown)"/>

            <map value="1"
                 message="$(string.WcmMediaType.Ethernet)"/>

            <map value="2"
                 message="$(string.WcmMediaType.Wlan)"/>

            <map value="3"
                 message="$(string.WcmMediaType.Mbn)"/>
          </valueMap>
        </maps>
        
        <templates>
          <template tid="Template_OnlyErrorCode">
            <data name="ErrorCode"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>
          </template>
          
          <template tid="Template_ClassType">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
          </template>
          
          <template tid="Template_ErrorCode">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
              
            <data name="ErrorCode" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>
          </template>

          <template tid="Template_DataPlanType">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
          </template>

          <template tid="Template_ClassTypeAndString">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="StringValue"
                  inType="win:UnicodeString"
                  outType="xs:string"/>
          </template>

          <template tid="Template_ClassTypeStringNumber">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="StringValue"
                  inType="win:UnicodeString"
                  outType="xs:string"/>

            <data name="Result"
                  inType="win:UInt32"
                  outType="xs:HexInt32"/>
          </template>

          <template tid="Template_ClassTypeSimSlot">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="StringValue1"
                  inType="win:UnicodeString"
                  outType="xs:string"/>

            <data name="StringValue2"
                  inType="win:UnicodeString"
                  outType="xs:string"/>

            <data name="Slot"
                  inType="win:UInt32"
                  outType="xs:HexInt32"/>
          </template>

          <template tid="Template_UpdateGlobalDpuStateWNFFailure">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
              
            <data name="WNFStateIndex" 
                  inType="win:UInt32" 
                  map="DpuWNFStateName"/>

            <data name="ErrorCode" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>
          </template>
          
          <template tid="Template_PubSebLevelEvent">              
            <data name="WNFStateValue" 
                  inType="win:UInt32"/>

            <data name="Status" 
                  inType="win:UInt32"/>
          </template>
          
          <template tid="Template_RecalcQuotaEvent">
            <data name="Result"
                  inType="win:UInt32"
                  outType="xs:HexInt32"/>
            
            <data name="Quota"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>
          
            <data name="NduByteLimit"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>
          
            <data name="Usage"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>
          
          </template>
          
          <template tid="Template_RegisterNduByteCountLimit">
            <data name="ProfileId"
                  inType="win:UInt32"
                  outType="xs:HexInt32"/>

            <data name="ProfileName"
                  inType="win:UnicodeString" 
                  outType="xs:string"/>
            
            <data name="AccessString"
                  inType="win:UnicodeString" 
                  outType="xs:string"/>
            
            <data name="ApnPurposeId"
                  inType="win:UInt32"
                  outType="xs:HexInt32"/>

            <data name="QuotaExceededWnf"
                  inType="win:Boolean" 
                  outType="xs:boolean"/>

          </template>
          <template tid="Template_ClassTypeWnfState">

            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="WNFState1"
                  inType="win:UInt32"
                  outType="xs:HexInt32"/>

            <data name="WNFState2"
                  inType="win:UInt32"
                  outType="xs:HexInt32"/>
          </template>

          <template tid="Template_CmNotificationDetails">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
              
            <data name="Type" 
                  inType="win:UInt32"
                  map="CMNotificationType"/>

            <data name="ConnectionName" 
                  inType="win:UnicodeString" 
                  outType="xs:string"/>

            <data name="State" 
                  inType="win:UInt32" 
                  map="ConnectionState"/>
          </template>
          
          <template tid="Template_FixedDataPlan">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
            
            <data name="PlanType"
                  inType="win:UnicodeString"
                  outType="xs:string"/>

            <data name="PlanLength"
                  inType="win:Int32" 
                  outType="xs:int"/>

            <data name="StartDate" 
                  inType="win:FILETIME" 
                  outType="xs:dateTime"/>

            <data name="TimeReference" 
                  inType="win:UnicodeString" 
                  outType="xs:string"/>

            <data name="DataLimit" 
                  inType="win:UInt32" 
                  outType="xs:unsignedInt"/>

            <data name="DataSaverMode" 
                  inType="win:Int32" 
                  outType="xs:int"/>
          </template>
          
          <template tid="Template_DataSaverMode">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="SIM"
                  inType="win:UnicodeString"
                  outType="xs:string"/>
            
            <data name="DataSaverMode" 
                  inType="win:Int32" 
                  outType="xs:int"/>
          </template>
          
          <template tid="Template_CmConnectionDetails">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="ConnectionName" 
                  inType="win:UnicodeString" 
                  outType="xs:string"/>

            <data name="Description" 
                  inType="win:UnicodeString" 
                  outType="xs:string"/>

            <data name="State" 
                  inType="win:UInt32" 
                  map="ConnectionState"/>

            <data name="RoamState"
                  inType="win:UInt32"
                  map="CMRoamType"/>

            <data name="DpuState" 
                  inType="win:UInt32" 
                  map="CMDpuState"/>

            <data name="IfIndex" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="IfType" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="CspConnectionName" 
                  inType="win:UnicodeString" 
                  outType="xs:string"/>
                  
            <data name="Adapter" 
                  inType="win:UnicodeString" 
                  outType="xs:string"/>

            <data name="Type" 
                  inType="win:GUID" 
                  outType="xs:GUID"/>

            <data name="Device" 
                  inType="win:GUID" 
                  outType="xs:GUID"/>

            <data name="Network" 
                  inType="win:GUID" 
                  outType="xs:GUID"/>

          </template>

          <template tid="Template_ConnConfig">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="ConnectionName"
                  inType="win:UnicodeString"
                  outType="xs:string"/>
                  
            <data name="RequiresMapping"
                  inType="win:Boolean"
                  outType="xs:boolean"/>

            <data name="Exempted"
                  inType="win:Boolean"
                  outType="xs:boolean"/>
                  
          </template>
          
          <template tid="Template_DpuConnectionDetails">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
            
            <data name="ConnectionName"
                  inType="win:UnicodeString"
                  outType="xs:string"/>

            <data name="Active"
                  inType="win:Boolean"
                  outType="xs:boolean"/>

            <data name="ProfileName"
                  inType="win:UnicodeString"
                  outType="xs:string"/>

            <data name="AccessString"
                  inType="win:UnicodeString"
                  outType="xs:string"/>

            <data name="MediaType"
                  inType="win:UInt32"
                  map="DpuMediaType"/>
            
            <data name="Executor"
                  inType="win:UInt32"
                  outType="xs:unsignedInt"/>
            
            <data name="IfLuid"
                  inType="win:UInt64"
                  outType="xs:HexInt64"/>

            <data name="ProfileId"
                  inType="win:UInt64"
                  outType="xs:HexInt64"/>

            <data name="NduNotificationRegistered"
                  inType="win:Boolean"
                  outType="xs:boolean"/>

            <data name="ApnPurposeId"
                  inType="win:UInt32"
                  outType="xs:HexInt32"/>                  
          </template>

          <template tid="Template_WiFi_LiveTile">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
                  
            <data name="changed"
                  inType="win:Boolean"
                  outType="xs:boolean"/>

            <data name="CurrentWiFiUsage" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="NewWiFiUsage" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>
          </template>

          <template tid="Template_Cellular_LiveTile">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
                  
            <data name="changed"
                  inType="win:Boolean"
                  outType="xs:boolean"/>

            <data name="CurrentType" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="NewType" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="CurrentCellUsage" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="NewCellUsage" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="CurrentOverLimit" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="NewOverLimit" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="CurrentNearLimit" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="NewNearLimit" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="CurrentExpiration" 
                  inType="win:Boolean" 
                  outType="xs:boolean"/>

            <data name="NewExpiration" 
                  inType="win:Boolean" 
                  outType="xs:boolean"/>
          </template>


          <template tid="Template_DpuOp">
            <data name="Sim"
                  inType="win:UnicodeString"
                  outType="xs:string"/>

            <data name="OpCode"
                  inType="win:UInt32" 
                  map="DpuOpCode"/>
          </template>

          <template tid="Template_RefreshGlobalDpuState">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
              
            <data name="Previous" 
                  inType="win:UInt32" 
                  map="DpuSvcDpuState"/>

            <data name="Current" 
                  inType="win:UInt32" 
                  map="DpuSvcDpuState"/>
          </template>
          
          <template tid="Template_SetCMDpuChar">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
              
            <data name="ConnectName" 
                  inType="win:UnicodeString" 
                  outType="xs:string"/>

            <data name="CMDpuState" 
                  inType="win:UInt32" 
                  map="CMDpuState"/>
          </template>

          <template tid="Template_NduByteCountLimit">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="IfLuid" 
                  inType="win:UInt64" 
                  outType="xs:HexInt64"/>

            <data name="ProfileId" 
                  inType="win:UInt64" 
                  outType="xs:HexInt64"/>

            <data name="Quota" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>
                  
            <data name="QuotaExceededWnf"
                  inType="win:Boolean" 
                  outType="xs:boolean"/>                  
          </template>
          
          <template tid="Template_RegisterNduNotificationFailure">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="IfLuid" 
                  inType="win:UInt64" 
                  outType="xs:HexInt64"/>

            <data name="ProfileId" 
                  inType="win:UInt64" 
                  outType="xs:HexInt64"/>
                  
            <data name="ErrorCode" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>
          </template>

          <template tid="Template_RegisterNduNotificationOps">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="IfLuid" 
                  inType="win:UInt64" 
                  outType="xs:HexInt64"/>

            <data name="ProfileId" 
                  inType="win:UInt64" 
                  outType="xs:HexInt64"/>
          </template>

          <template tid="Template_BillingCycle">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
              
            <data name="CurrentBillingCylceStartDate" 
                  inType="win:FILETIME" 
                  outType="xs:dateTime"/>

            <data name="NextBillingCylceStartDate" 
                  inType="win:FILETIME" 
                  outType="xs:dateTime"/>

            <data name="CurrentTime" 
                  inType="win:FILETIME" 
                  outType="xs:dateTime"/>
                  
            <data name="Expiration" 
                  inType="win:Boolean" 
                  outType="xs:boolean"/>

            <data name="CurrentCap" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>
          </template>
          
          <template tid="Template_BillingCycle_Day">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
              
            <data name="CurrentBillingCylceStartDate" 
                  inType="win:FILETIME" 
                  outType="xs:dateTime"/>

            <data name="TotalDaysInBillingCycle" 
                  inType="win:Int32" 
                  outType="xs:int"/>

            <data name="PassedDaysInBillingCycle" 
                  inType="win:Int32" 
                  outType="xs:int"/>
                  
            <data name="Expiration" 
                  inType="win:Boolean" 
                  outType="xs:boolean"/>

            <data name="CurrentCap" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>
          </template>

          <template tid="Template_Notification">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="Usage" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="OverLimit" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="NearLimit" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="OverLimitNotification" 
                  inType="win:Boolean" 
                  outType="xs:boolean"/>

            <data name="NearLimitNotification" 
                  inType="win:Boolean" 
                  outType="xs:boolean"/>
          </template>

          <template tid="Template_DataPlanCurve">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
              
            <data name="DataSaverMode" 
                  inType="win:Int32" 
                  outType="xs:int"/>

            <data name="Usage" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="overLimitMark" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="Limit" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="onTrackUpperBoundMark" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="DayCap" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="onTrackLowerBoundMark" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>
          </template>
          
          <template tid="Template_DpuState">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>
              
            <data name="DpuState" 
                  inType="win:UInt32" 
                  map="DpuSvcDpuState"/>
          </template>
          
          <template tid="Template_AddCmConnection">
            <data name="ClassType" 
                  inType="win:AnsiString" 
                  outType="xs:string"/>

            <data name="ConnectionName" 
                  inType="win:UnicodeString" 
                  outType="xs:string"/>
          </template>

          <template tid="Template_SrumQuery">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="BeginDate"
                  inType="win:FILETIME"
                  outType="xs:dateTime"/>

            <data name="EndDate"
                  inType="win:FILETIME"
                  outType="xs:dateTime"/>

            <data name="CellularTotal" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>

            <data name="WiFiTotal" 
                  inType="win:UInt64" 
                  outType="xs:unsignedLong"/>
          </template>
          
          <template tid="Template_QueryTimeWindow">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="BeginDate"
                  inType="win:SYSTEMTIME"
                  outType="xs:dateTime"/>

            <data name="EndDate"
                  inType="win:SYSTEMTIME"
                  outType="xs:dateTime"/>
          </template>
          
          <template tid="Template_QueryAsStats">
            <data name="TotalCellUsage"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>
            
            <data name="TotalWiFiUsage"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>

            <data name="ExcludedCellUsage"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>

            <data name="ExcludedWiFiUsage"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>
          </template>

          <template tid="Template_TimeDelta">
            <data name="ClassType"
                  inType="win:AnsiString"
                  outType="xs:string"/>

            <data name="NewDate"
                  inType="win:SYSTEMTIME"
                  outType="xs:dateTime"/>
          </template>

          <template tid="Template_OnlyErrorCodeHex">
            <data name="ErroCode"
                  inType="win:HexInt32"
                  outType="win:HexInt32"/>
          </template>
          <template tid="Template_ElapsedTime">
            <data name="ElapsedMs"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>
          </template>

          <template tid="Template_ErrorCodeUInt">
            <data name="ErroCode"
                  inType="win:UInt32"
                  outType="xs:unsignedInt"/>
          </template>

          <!-- NetBwTopAppUsage results -->
          <template tid="Template_TopAppResults">
            <data name="BeginTime"
                  inType="win:SYSTEMTIME"
                  outType="xs:dateTime"/>

            <data name="EndTime"
                  inType="win:SYSTEMTIME"
                  outType="xs:dateTime"/>

            <data name="Entries"
                  inType="win:UInt32"
                  outType="xs:unsignedInt"/>

            <data name="Apps"
                  inType="win:UInt32"
                  outType="xs:unsignedInt"/>

            <data name="Svcs"
                  inType="win:UInt32"
                  outType="xs:unsignedInt"/>

            <data name="Exes"
                  inType="win:UInt32"
                  outType="xs:unsignedInt"/>

            <data name="AppsBytes"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>

            <data name="SvcsBytes"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>

            <data name="ExesBytes"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>
          </template>

          <!-- NetBwConnectionUsage results -->
          <template tid="Template_ConnUsageResults">
            <data name="BeginTime"
                  inType="win:SYSTEMTIME"
                  outType="xs:dateTime"/>

            <data name="EndTime"
                  inType="win:SYSTEMTIME"
                  outType="xs:dateTime"/>

            <data name="BytesSentCellular"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>

            <data name="BytesRcvdCellular"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>

            <data name="BytesSentRoaming"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>

            <data name="BytesRcvdRoaming"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>

            <data name="BytesSentWifi"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>

            <data name="BytesRcvdWifi"
                  inType="win:UInt64"
                  outType="xs:unsignedLong"/>

          </template>

          <!-- NetBwConnectionUsage results -->
          <template tid="Template_CallTrace">
            <data name="PlanName"
                  inType="win:UnicodeString"
                  outType="xs:string"/>

            <data name="ErrorCode"
                  inType="win:HexInt32"
                  outType="xs:HexInt32"/>
          </template>

          <template tid="Template_DpuGetAttributedNetworkUsageParameter">
            <data name="StartTime"
                  inType="win:FILETIME"
                  outType="xs:dateTime"/>

            <data name="EndTime"
                  inType="win:FILETIME"
                  outType="xs:dateTime"/>

            <data name="PhysicalInterfaceGuid"
                  inType="win:GUID"
                  outType="xs:GUID"/>

            <data name="MediaType"
                  inType="win:UInt32"
                  map="WcmMediaType"/>
            
            <data name="ProfileName"
                  inType="win:UnicodeString"
                  outType="xs:string"/>
          </template>
          
        </templates>

        <tasks>
          <task name="Query" value="1" />
        </tasks>
        
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.1.message" 
                value="SvcInitialize: DataSenseSvc minimum initialization finished, marks the service entering running state"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.2.message"
                value="SvcUninitialize: DataSenseSvc uninitialization finished"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.3.message"
                value="SvcInitialize: DataSenseSvc minimum initialization started"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.4.message"
                value="[%1]: data plan object and global DpuState has been initialized, now enabling TP callbacks"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.5.message"
                value="[%1]: start data plan tracking"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.6.message" 
                value="SvcInitialize: DataSenseSvc minimum initialization failed with error code: [%1]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.7.message"
                value="SvcDelayedInitialization: the service entered running state, DataSenseSvc delayed initialization started"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.8.message" 
                value="SvcDelayedInitialization: DataSenseSvc delayed initialization finished"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.9.message"
                value="SvcDelayedInitialization: DataSenseSvc delayed initialization failed with error code: [%1]"/>
        
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.107.message" 
                value="[%1]: Begin RegisterUsageNofication"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.108.message" 
                value="[%1]: End RegisterUsageNofication [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.109.message" 
                value="[%1]: Begin UnregisterUsageNofication"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.110.message" 
                value="[%1]: End UnregisterUsageNofication [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.99.message" 
                value="&lt;&lt; [%1]: finish handling the Ndu Poll Hint notification [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.98.message" 
                value="&gt;&gt; [%1]: start to handle the Ndu Poll Hint notification"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.97.message" 
                value="[%1]: skip updating live tile"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.96.message" 
                value="[%1]: updating live tile"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.95.message" 
                value="[%1]: current data usage is [%2], OverLimit mark is [%3], NearLimit mark is [%4], OverLimit Notification is [%5], Near Limit Notification is [%6]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.94.message" 
                value="[%1]: data plan tracking stopped, rundown of all thread pool threads owned by data plan object is finished"/>
                
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.93.message" 
                value="[%1]: query SRUM between [%2] and [%3], result (bytes): cellular total [%4], WiFi total [%5]"/>
                
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.92.message" 
                value="[%1]: rundown of all thread pool threads owned by DataSenseSvc is finished"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.91.message" 
                value="[%1]: Connection Name [%2] added"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.90.message" 
                value="[%1]: DpuState is [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.89.message" 
                value="[%1]: data saver mode is [%2], usage since this cycle [%3] bytes, today Dpu curve (bytes): OverLimit &gt;= [%4] (actual limit is [%5]), OffTrack &gt;= [%6] (actual day cap is [%7]), UnderTrack &lt; [%8]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.88.message" 
                value="[%1]: this billing cycle start date [%2], end date [%3], current time [%4], data plan expires [%5], current on track line is at [%6] bytes"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.87.message" 
                value="[%1]: the billing cycle start date [%2], total days in this cycle [%3], days into this cycle [%4], data plan expires [%5], current on track line is at [%6] bytes"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.86.message" 
                value="&lt;&lt; [%1]: Ndu Byte Limit notification was handled with error code [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.85.message" 
                value="&lt;&lt; [%1]: Psm timer notificaiton was handled with error code [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.84.message" 
                value="&gt;&gt; [%1]: start to handle the Ndu Byte Limit notification"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.83.message" 
                value="&gt;&gt; [%1]: start to handle Psm timer notification"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.82.message" 
                value="[%1]: failed to register Ndu notification for interface: IfLuid [%2], ProfileId [%3] with error code [%4]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.81.message" 
                value="[%1]: failed to set the DpuState on the CM connection with error code [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.80.message"
                value="[%1]: set the DpuState of Connection [%2] to [%3]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.72.message"
                value="[%1]: Connection Name [%2] fUseRequiresMappingsPolicy [%3] and fExemptFromDisablePolicy [%4]"/>
                
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.71.message"
                value="Rpc: SIM [%1] Opcode [%2]"/>
        
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.70.message"
                value="[%1]: Connection Name [%2] is INVALID"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.69.message"
                value="[%1]: Connection Name [%2] is VALID: Active [%3], ProfileName [%4], AccessString [%5], MediaType [%6], Executor [%7], IfLuid [%8], ProfileId [%9], NduNotifReged [%10], ApnPurposeID [%11]"/>
        
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.68.message" 
                value="&lt;&lt; [%1]: Timezone change event was handled with error code [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.67.message" 
                value="&gt;&gt; [%1]: start to handle the timezone change event"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.66.message" 
                value="[%1]: Ndu notification registered for interface: IfLuid [%2], ProfileId [%3]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.65.message" 
                value="[%1]: Ndu notification unregistered for interface: IfLuid [%2], ProfileId [%3]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.63.message" 
                value="[%1]: existing data plan has the cycle start date in the future, update the cycle start date to be current system time [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.62.message" 
                value="[%1]: the time moved forwards, ignore this system time change event"/>
                
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.61.message" 
                value="[%1]: previous Global DpuState is [%2] and current Global DpuState is [%3]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.60.message" 
                value="[%1]: update the WNF State [%2] Data to value [%3]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.59.message" 
                value="[%1]: Connection Name [%2] retrieved: Description [%3], State [%4], RoamState [%5], DpuState [%6], IfIndex [%7], IfType [%8], CspConnectionName [%9], Adapter [%10], Type [%11], Device [%12], Network [%13] "/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.58.message" 
                value="&lt;&lt; [%1]: system time change notification was handled with error code: [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.57.message" 
                value="[%1]: data saver mode for SIM [%2] is [%3]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.56.message" 
                value="[%1]: date plan object instantiated: Plan Type [%2], Plan Length [%3], StartDate [%4], in [%5], DataLimit [%6MB], DataSaverMode [%7]"/>
        
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.55.message"
                value="[%1]: get data plan object for SIM [%2]"/>
        
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.54.message" 
                value="[%1]: data plan object instantiated"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.53.message" 
                value="DpuProcessSrumRecordSetAsStats: total cellular usage [%1] and wifi usage [%2] (excluded [%3] cellular usage and [%4] wifi usage"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.52.message" 
                value="&gt;&gt; [%1]: start to handle system time change notification"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.51.message" 
                value="[%1]: received a CM Notification: Type [%2], ConnenctName [%3], State [%4]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.50.message" 
                value="[%1]: failed to update the WNF State [%2] for global DpuState with error code [%3]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.24.message" 
                value="&lt;&lt; RPC: DpuRpcGetLiveTileContent was handled with error code [%1]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.23.message" 
                value="&gt;&gt; RPC: start to process [DpuRpcGetLiveTileContent]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.22.message"
                value="RPC: RpcGetAttributedNetworkUsage: StartTime [%1], EndTime [%2], PhysicalInterfaceGuid [%3], MediaType [%4], ProfileName [%5]"/>
        
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.21.message"
                value="[%1]: add claimed connections if there are any"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.20.message" 
                value="&lt;&lt; RPC: RpcGetAttributedNetworkUsage was handled with error code [%1]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.19.message" 
                value="&gt;&gt; RPC: start to process [RpcGetAttributedNetworkUsage]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.18.message" 
                value="&lt;&lt; RPC: RpcResetDataUsage was handled with error code: [%1]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.17.message" 
                value="&gt;&gt; RPC: start to process [RpcResetDataUsage]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.16.message" 
                value="[%1]: global DpuState Refresh has been triggered"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.15.message" 
                value="&lt;&lt; RPC: RpcQuerytParameter was handled with error code: [%1]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.14.message" 
                value="&gt;&gt; RPC: start to process [RpcQuerytParameter]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.13.message" 
                value="&lt;&lt; RPC: RpcSetParameter was handled with error code: [%1]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.12.message" 
                value="&gt;&gt; RPC: start to process [RpcSetParameter]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.11.message" 
                value="&lt;&lt; [%1]: CM notification was handled with error code: [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.10.message"
                value="&gt;&gt; [%1]: start to handle CM Notification"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.106.message" 
                value="DataSenseSvc unknown exception swallowed"/>
                
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.105.message"
                value="Exception Raised with NT status [%1]"/>
        
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.104.message" 
                value="DataSenseSvc out of memory exception caught"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.103.message" 
                value="Exception Raised with CmResult [%1]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.102.message" 
                value="Exception Raised with HR [%1]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.101.message" 
                value="Exception Raised with Win32 error [%1]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.111.message" 
                value="[%1]: Cellular LiveTile info changed [%2]: (Current/New) Data Plan Type ([%3]/{%4]), Cellular usage ([%5]/{%6]), OverLimitMark ([%7]/{%8]), NearLimitMark ([%9]/{%10]), Expiration ([%11]/{%12])"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.112.message" 
                value="[%1]: WiFi LiveTile info changed [%2]: (Current/New) WiFi usage ([%3]/{%4])"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.113.message" 
                value="Published WNF_SEB_INTERNET_PRESENT with value [%1], resulting NTSTATUS [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.114.message" 
                value="Published WNF_SEB_FREE_NETWORK_PRESENT with value [%1], resulting NTSTATUS [%2]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.116.message"
                value="NduTracker recalculated quota: Result [%1], Quota [%2], NduByteLimit [%3], Usage [%4]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.117.message" 
                value="[%1]: Register Ndu notification for interface IfLuid [%2], ProfileId [%3] with Quota [%4], QuotaExceededWNF [%5]"/>
                
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.118.message"
                value="[%1]: WNF State [%2 %3]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.200.message"
                value="[%1] query between [%2] and [%3]"/>
        
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.201.message"
                value="[%1] Byte limit triggered - publishing WNF state: [%2 %3]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.202.message"
                value="[%1] Poll hint triggered - publishing WNF state: [%2 %3]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.203.message"
                value="[%1] Requested SIM [%2] SIM [%3] Slot [%4]"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.event.204.message"
                value="[%1] SIM [%2] Slot [%3]"/>

        <string id="Keyword.Performance" 
                value="Performance"/>

        <string id="Keyword.Error" 
                value="Error"/>

        <string id="Keyword.Informational"
                value="Informational"/>
        
        <string id="DpuSvcDpuState.DPU_STATE_UNKNOWN" 
                value="DPU_STATE_UNKNOWN"/>

        <string id="DpuSvcDpuState.DPU_STATE_UNDER_TRACK" 
                value="DPU_STATE_UNDER_TRACK"/>

        <string id="DpuSvcDpuState.DPU_STATE_EXEMPT_ZERO_RATE" 
                value="DPU_STATE_EXEMPT_ZERO_RATE"/>
                
        <string id="DpuSvcDpuState.DPU_STATE_OVER_LIMIT" 
                value="DPU_STATE_OVER_LIMIT"/>

        <string id="DpuSvcDpuState.DPU_STATE_ON_TRACK" 
                value="DPU_STATE_ON_TRACK"/>

        <string id="DpuSvcDpuState.DPU_STATE_OFF_TRACK" 
                value="DPU_STATE_OFF_TRACK"/>

        <string id="DpuSvcDpuState.DPU_STATE_NOT_TRACKED" 
                value="DPU_STATE_NOT_TRACKED"/>

        <string id="ConnectionState.CMCS_SUSPENDED" 
                value="CMCS_SUSPENDED"/>

        <string id="ConnectionState.CMCS_DISCONNECTING" 
                value="CMCS_DISCONNECTING"/>

        <string id="ConnectionState.CMCS_DISCONNECTED_UNAVAILABLE" 
                value="CMCS_DISCONNECTED_UNAVAILABLE"/>

        <string id="ConnectionState.CMCS_DISCONNECTED_DISABLED" 
                value="CMCS_DISCONNECTED_DISABLED"/>

        <string id="ConnectionState.CMCS_DISCONNECTED" 
                value="CMCS_DISCONNECTED"/>

        <string id="ConnectionState.CMCS_CONNECTING_WAITING_FOR_IP" 
                value="CMCS_CONNECTING_WAITING_FOR_IP"/>

        <string id="ConnectionState.CMCS_CONNECTING_AUTHENTICATING" 
                value="CMCS_CONNECTING_AUTHENTICATING"/>

        <string id="ConnectionState.CMCS_CONNECTING_ASSOCIATING" 
                value="CMCS_CONNECTING_ASSOCIATING"/>

        <string id="ConnectionState.CMCS_CONNECTING" 
                value="CMCS_CONNECTING"/>

        <string id="ConnectionState.CMCS_CONNECTED" 
                value="CMCS_CONNECTED"/>

        <string id="CMRoamType.CMRT_UNKNOWN"
                value="CMRT_UNKNOWN"/>

        <string id="CMRoamType.CMRT_HOME"
                value="CMRT_HOME"/>

        <string id="CMRoamType.CMRT_DOMESTIC"
                value="CMRT_DOMESTIC"/>

        <string id="CMRoamType.CMRT_ROAM"
                value="CMRT_ROAM"/>

        <string id="CMDpuState.CMDPU_UNDER_TRACK" 
                value="CMDPU_UNDER_TRACK"/>

        <string id="CMDpuState.CMDPU_OVER_LIMIT" 
                value="CMDPU_OVER_LIMIT"/>

        <string id="CMDpuState.CMDPU_ON_TRACK" 
                value="CMDPU_ON_TRACK"/>

        <string id="CMDpuState.CMDPU_OFF_TRACK" 
                value="CMDPU_OFF_TRACK"/>

        <string id="CMDpuState.CMDPU_NOT_TRACKED" 
                value="CMDPU_NOT_TRACKED"/>

        <string id="DpuOpCode.UserCostProfile"
                value="UserCostProfile"/>

        <string id="DpuOpCode.OperatorCostProfile"
                value="OperatorCostProfile"/>

        <string id="DpuOpCode.OperatorDataUsage"
                value="OperatorDataUsage"/>

        <string id="DpuOpCode.DataSaverMode"
                value="DataSaverMode"/>

        <string id="DpuOpCode.ZeroRatedAPNs"
                value="ZeroRatedAPNs"/>

        <string id="DpuOpCode.FirstRunShown"
                value="FirstRunShown"/>

        <string id="DpuOpCode.UseUserCost"
                value="UseUserCost"/>

        <string id="DpuOpCode.ServiceProviderGuid"
                value="ServiceProviderGuid"/>

        <string id="WcmMediaType.Unknown"
                value="Unknown"/>

        <string id="WcmMediaType.Ethernet"
                value="Ethernet"/>

        <string id="WcmMediaType.Wlan"
                value="Wlan"/>

        <string id="WcmMediaType.Mbn"
                value="Mbn"/>
        
        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.5.message"
                value="WNF_CNET_DPU_GLOBAL_STATE_NOT_TRACKED"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.4.message"
                value="WNF_CNET_DPU_GLOBAL_STATE_UNDER_TRACK"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.3.message"
                value="WNF_CNET_DPU_GLOBAL_STATE_ON_TRACK"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.2.message"
                value="WNF_CNET_DPU_GLOBAL_STATE_OFF_TRACK"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.1.message"
                value="WNF_CNET_DPU_GLOBAL_STATE_OVER_LIMIT"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuWNFStateName.0.message"
                value="WNF_CNET_DPU_GLOBAL_STATE_EXEMPT_ZERO_RATE"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.CMNotificationType.503.message"
                value="CMNT_CONNECTION_CONFIGURATION_DELETED"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.CMNotificationType.502.message"
                value="CMNT_CONNECTION_CONFIGURATION_UPDATED"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.CMNotificationType.501.message"
                value="CMNT_CONNECTION_CONFIGURATION_ADDED"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.CMNotificationType.102.message"
                value="CMNT_CONNECTION_STATE_DISCONNECTED"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.CMNotificationType.101.message"
                value="CMNT_CONNECTION_STATE_CONNECTED"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuMediaType.0.message"
                value="DPU_MEDIA_UNKOWN"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuMediaType.1.message"
                value="DPU_MEDIA_ETHERNET"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuMediaType.2.message"
                value="DPU_MEDIA_WLAN"/>

        <string id="Microsoft-WindowsPhone-DataPlanUsageServiceProvider.map.DpuMediaType.3.message"
                value="DPU_MEDIA_MBN"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.1.message"
                value="SRUMHOST: Enter Connected Standby mode"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.2.message"
                value="SRUMHOST: Exit Connected Standby mode"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.3.message"
                value="SRUMHOST: Signal 15 minute Wakeup Channel"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.4.message"
                value="NETBWAPI: NetBwSystemUsage RPC starts"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.5.message"
                value="NETBWAPI: NetBwSystemUsage RPC ends [%1]"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.6.message"
                value="SRUMHOST: NetBwTopAppUsage between [%1] and [%2]: [%3] Entries, [%4] Apps with [%7] bytes, [%5] Svcs with [%8] bytes, [%6] Exes with [%9] bytes"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.7.message"
                value="SRUMHOST: netbwSruQueryStats starts"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.8.message"
                value="SRUMHOST: netbwSruQueryStats ends [%1]"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.9.message"
                value="SRUMHOST: NetBwConnectionUsage between [%1] and [%2]: Sent/Rcvd Cellular [%3]/[%4], Roaming [%5]/[%6], Wifi [%7]/[%8]"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.10.message"
                value="SRUMHOST: Starting"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.11.message"
                value="SRUMHOST: Started"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.12.message"
                value="SRUMHOST: Failed to Start because system shutdown is in progress"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.13.message"
                value="SRUMHOST: Function [%1] returned [%2]"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.14.message"
                value="SRUMHOST: netBwConnectionUsageWorker starts"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.20.message"
                value="SRUMHOST: NetBwSystemUsage starts"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.21.message"
                value="SRUMHOST: NetBwSystemUsage ends [%1]"/>

        <string id="Microsoft-WindowsPhone-SrumHostServiceProvider.event.30.message"
                value="SRUMHOST: netbwSortedProcessUsage/netBwConvertToTopAppUsage starts"/>

      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>


