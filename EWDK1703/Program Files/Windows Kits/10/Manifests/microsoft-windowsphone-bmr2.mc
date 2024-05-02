<?xml version="1.0" encoding="UTF-8"?>
<instrumentationManifest xsi:schemaLocation="http://schemas.microsoft.com/win/2004/08/events eventman.xsd" xmlns="http://schemas.microsoft.com/win/2004/08/events" xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:trace="http://schemas.microsoft.com/win/2004/08/events/trace">
    <instrumentation>
        <events>
            <provider name="Microsoft-WindowsPhone-BMR2" guid="{FFEF6934-8D7F-41C9-A33F-0BDD2AE8887C}" symbol="MICROSOFT_WINDOWSPHONE_BMR2" resourceFileName="BMR2CspSettingHandler.dll" messageFileName="BMR2CspSettingHandler.dll">
                <events>
                    <!-- Use for printf-style tracing -->
                    <event symbol="PRINTF_MESSAGE_INFO" value="0" level="win:Informational" template="tTraceMessage">
                    </event>
                    <event symbol="PRINTF_MESSAGE_WARNING" value="1" level="win:Warning" template="tTraceMessage">
                    </event>
                    <event symbol="PRINTF_MESSAGE_ERROR" value="2" level="win:Error" template="tTraceMessage" keywords="Error ">
                    </event>

                    <!-- Roaming CPL: 100-199 -->
                    <event symbol="UX_ROAMINGCPL_CONTROLLER_INSTANTIATION_ERROR" value="100" version="0" level="win:Error" task="UX_ROAMINGCPL" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.100.message)">
                    </event>
                    <event symbol="UX_ROAMINGCPL_MODEL_GETREGISTRY_ERROR" value="101" version="0" level="win:Error" task="UX_ROAMINGCPL" template="String Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.101.message)">
                    </event>
                    <event symbol="UX_ROAMINGCPL_MODEL_ENABLEGROUP_ERROR" value="102" version="0" level="win:Error" task="UX_ROAMINGCPL" template="String Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.102.message)">
                    </event>
                    <event symbol="UX_ROAMINGCPL_MODEL_ISGROUPENABLED_ERROR" value="103" version="0" level="win:Error" task="UX_ROAMINGCPL" template="String Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.103.message)">
                    </event>
                    <event symbol="UX_ROAMINGCPL_MODEL_ENABLEGROUP_INFO" value="104" version="0" level="win:Informational" task="UX_ROAMINGCPL" template="String Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.104.message)">
                    </event>
                    <event symbol="UX_ROAMINGCPL_MODEL_ISROAMINGENABLED_ERROR" value="105" version="0" level="win:Error" task="UX_ROAMINGCPL" template="Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.105.message)">
                    </event>

                    <!-- Setting Monitor Host: 200-299 -->
                    <event symbol="BACKGROUND_TASK_MAINTENANCE_INFO" value="200" version="0" level="win:Informational" task="BACKGROUND_TASK" opcode="MAINTENANCE" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.1.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_MAINTENANCE_ERROR" value="201" version="0" level="win:Error" task="BACKGROUND_TASK" opcode="MAINTENANCE" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.1.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_SETTINGCHANGE_INFO" value="202" version="0" level="win:Informational" task="BACKGROUND_TASK" opcode="SETTINGCHANGE" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.1.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_SETTINGCHANGE_ERROR" value="203" version="0" level="win:Error" task="BACKGROUND_TASK" opcode="SETTINGCHANGE" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.1.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_NO_MICROSOFT_ACCOUNT_INFO" value="204" version="0" level="win:Informational" task="MONITOR_SERVICE" message="$(string.Microsoft-WindowsPhone-BMR2.event.204.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_START_MONITORS_ERROR" value="205" version="0" level="win:Error" task="MONITOR_SERVICE" opcode="STARTMONITORS" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.1.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_STOP_MONITORS_ERROR" value="206" version="0" level="win:Error" task="MONITOR_SERVICE" template="Bool Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.206.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_RUNNING_PUBLISHERS_INFO" value="207" version="0" level="win:Informational" task="MONITOR_SERVICE" template="Dword Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.207.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_LIVEID_RESULT" value="208" version="0" level="win:Informational" task="MONITOR_SERVICE" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.208.message)">
                    </event>
                    <event symbol="FILE_SCP_NULLNOTIFY_ERROR" value="209" version="0" level="win:Error" task="FILE_SCP" template="String" message="$(string.Microsoft-WindowsPhone-BMR2.event.209.message)">
                    </event>
                    <event symbol="SYNC_CLOUD_CHANGE_INFO" value="210" version="1" level="win:Informational" task="MONITOR_SERVICE" opcode="CLOUDCHANGE" template="Dword Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.210.message)">
                    </event>
                    <event symbol="SYNC_CLOUD_CHANGE_ERROR" value="211" version="0" level="win:Error" task="MONITOR_SERVICE" opcode="CLOUDCHANGE" template="Dword Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.211.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_REFRESH_ERROR" value="212" version="0" level="win:Error" task="MONITOR_SERVICE" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.212.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_CLOUDCHANGE_INFO" value="213" version="0" level="win:Informational" task="BACKGROUND_TASK" opcode="CLOUDCHANGE" message="$(string.Microsoft-WindowsPhone-BMR2.event.213.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_CLOUDCHANGE_ERROR" value="214" version="0" level="win:Error" task="BACKGROUND_TASK" opcode="CLOUDCHANGE" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.214.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_MAINTENANCE_BATTERY_ALLOWED_INFO" value="215" version="0" level="win:Informational" task="BACKGROUND_TASK" opcode="MAINTENANCE_BATTERY" message="$(string.Microsoft-WindowsPhone-BMR2.event.215.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_MAINTENANCE_BATTERY_ALLOWED_ERROR" value="216" version="0" level="win:Error" task="BACKGROUND_TASK" opcode="MAINTENANCE_BATTERY" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.216.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_MAINTENANCE_NOTIFICATION_INFO" value="217" version="0" level="win:Informational" task="BACKGROUND_TASK" opcode="MAINTENANCE_NOTIFICATION" message="$(string.Microsoft-WindowsPhone-BMR2.event.217.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_MAINTENANCE_NOTIFICATION_ERROR" value="218" version="0" level="win:Error" task="BACKGROUND_TASK" opcode="MAINTENANCE_NOTIFICATION" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.218.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_SYNCATPOSTLOGON" value="219" version="0" level="win:Informational" task="MONITOR_SERVICE" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.219.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_ONSTARTING_START" value="220" version="0" level="win:Verbose" task="MONITOR_SERVICE" opcode="win:Start" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.220.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_ONSTARTING_STOP" value="221" version="0" level="win:Verbose" task="MONITOR_SERVICE" opcode="win:Stop" template="Hr" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.221.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_ONSTARTED_START" value="222" version="0" level="win:Verbose" task="MONITOR_SERVICE" opcode="win:Start" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.222.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_ONSTARTED_STOP" value="223" version="0" level="win:Verbose" task="MONITOR_SERVICE" opcode="win:Stop" template="Hr" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.223.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_ONSTOPPING_START" value="224" version="0" level="win:Verbose" task="MONITOR_SERVICE" opcode="win:Start" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.224.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_ONSTOPPING_STOP" value="225" version="0" level="win:Verbose" task="MONITOR_SERVICE" opcode="win:Stop" template="Hr" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.225.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_MAINTENANCE_CANCEL" value="226" version="0" level="win:Informational" task="BACKGROUND_TASK" opcode="MAINTENANCE_CANCEL" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.1.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_CHANGE_PUBLISHER_ENABLED" value="227" version="0" level="win:Informational" task="MONITOR_SERVICE" template="String Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.227.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_MAINTENANCE_SUBSCRIPTION" value="228" version="0" level="win:Informational" task="BACKGROUND_TASK" opcode="MAINTENANCE_NOTIFICATION" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.228.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_NOTIFICATION_CHANNELS_CHANGED" value="229" version="0" level="win:Informational" task="MONITOR_SERVICE" template="Bool Bool Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.229.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_NOTIFICATION_CHANNEL_CHANGED" value="230" version="0" level="win:Informational" task="MONITOR_SERVICE" template="String Bool Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.230.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_INVALID_BASE_STRING" value="231" version="0" level="win:Error" task="MONITOR_SERVICE" template="String String" message="$(string.Microsoft-WindowsPhone-BMR2.event.231.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_CHECK" value="232" version="0" level="win:Informational" template="String FILETIME ULONGLONG ULONGLONG Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.232.message)">
                    </event>
                    <event symbol="BACKGROUND_TASK_NOTIFICATION_RESULT" value="233" version="0" level="win:Informational" template="Bool Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.233.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_BACKGROUND_TASK_CANCEL" value="234" version="0" level="win:Informational" task="MONITOR_SERVICE" template="Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.234.message)">
                    </event>
                    <event symbol="MONITOR_SERVICE_INITIALIZE_AAD_ERROR" value="235" version="0" level="win:Error" task="MONITOR_SERVICE" template="Bool Bool Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.235.message)">
                    </event>

                    <!-- BMR2 Restore Services: 300-399 -->
                    <event symbol="DEVICEPROFILE" value="300" version="2" level="win:Informational" task="DEVICEPROFILES" template="String String String String Filetime Dword Dword Dword String Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.300.message)">
                    </event>
                    <event symbol="DEVICEPROFILE_DUPLICATE_IGNORED" value="302" version="0" level="win:Informational" task="DEVICEPROFILES" template="String" message="$(string.Microsoft-WindowsPhone-BMR2.event.302.message)">
                    </event>
                    <event symbol="DEVICEPROFILE_NO_PROFILES" value="303" version="0" level="win:Informational" task="DEVICEPROFILES" template="Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.303.message)">
                    </event>
                    <event symbol="DEVICEPROFILE_ERROR_IGNORED_WARNING" value="304" version="0" level="win:Warning" task="DEVICEPROFILES" template="Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.304.message)">
                    </event>
                    <event symbol="DEVICEPROFILE_SKYDRIVE_ERROR" value="305" version="0" level="win:Error" task="DEVICEPROFILES" template="Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.305.message)">
                    </event>
                    <event symbol="DEVICEPROFILE_RESTOREDEVICEID" value="306" version="0" level="win:Informational" task="DEVICEPROFILES" template="String" message="$(string.Microsoft-WindowsPhone-BMR2.event.306.message)">
                    </event>

                    <!-- CSP Setting Handler: 400-499 -->
                    <event symbol="CSP_SH_PROVISIONING_COLLECTION_ERROR" value="400" version="0" level="win:Error" task="CSP_SETTINGHANDLER" opcode="PROVISIONING" template="Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.400.message)">
                    </event>
                    <event symbol="CSP_SH_PROVISIONING_UNIT_ERROR" value="401" version="0" level="win:Error" task="CSP_SETTINGHANDLER" opcode="PROVISIONING" template="Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.401.message)">
                    </event>
                    <event symbol="CSP_SH_GETUNIT_WARNING" value="402" version="0" level="win:Warning" task="CSP_SETTINGHANDLER" opcode="GETUNIT" template="Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.1.message)">
                    </event>
                    <event symbol="CSP_SH_PROVISIONING_SETTING_WARNING" value="403" version="0" level="win:Warning" task="CSP_SETTINGHANDLER" opcode="PROVISIONING" template="Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.403.message)">
                    </event>
                    <event symbol="CSP_SH_INITIALIZE" value="404" version="0" level="win:Informational" task="CSP_SETTINGHANDLER" template="String" message="$(string.Microsoft-WindowsPhone-BMR2.event.404.message)">
                    </event>
                    <event symbol="CSP_SH_APPLYUNIT" value="405" version="0" level="win:Informational" task="CSP_SETTINGHANDLER" opcode="APPLYUNIT" template="String" message="$(string.Microsoft-WindowsPhone-BMR2.event.405.message)">
                    </event>
                    <event symbol="CSP_SH_APPLYUNIT_VERSION_MISMATCH" value="406" version="0" level="win:Error" task="CSP_SETTINGHANDLER" opcode="APPLYUNIT" template="Dword Dword Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.406.message)">
                    </event>
                    <event symbol="CSP_SH_APPLYUNIT_SETTING" value="407" version="0" level="win:Informational" task="CSP_SETTINGHANDLER" opcode="APPLYUNIT" template="String String" message="$(string.Microsoft-WindowsPhone-BMR2.event.407.message)">
                    </event>
                    <event symbol="CSP_SH_APPLYUNIT_WARNING" value="408" version="0" level="win:Warning" task="CSP_SETTINGHANDLER" opcode="APPLYUNIT" template="Hr" keywords="Error " message="$(string.Microsoft-WindowsPhone-BMR2.event.408.message)">
                    </event>
                    <event symbol="CSP_SH_GETUNIT" value="409" version="0" level="win:Informational" task="CSP_SETTINGHANDLER" opcode="GETUNIT" template="String" message="$(string.Microsoft-WindowsPhone-BMR2.event.409.message)">
                    </event>
                    <event symbol="CSP_SH_GETUNIT_SETTING" value="410" version="0" level="win:Informational" task="CSP_SETTINGHANDLER" opcode="GETUNIT" template="String String" message="$(string.Microsoft-WindowsPhone-BMR2.event.410.message)">
                    </event>

                    <!-- SettingSyncExtensions: 500-599 -->
                    <event symbol="ENGINE_EXT_GROUPPOLICY_ALLOWED" value="500" version="0" level="win:Verbose" task="ENGINE_EXT" template="Dword Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.500.message)">
                    </event>
                    <event symbol="ENGINE_EXT_NETWORKPOLICY_ALLOWED" value="501" version="0" level="win:Verbose" task="ENGINE_EXT" template="String Dword Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.501.message)">
                    </event>
                    <event symbol="ENGINE_EXT_NETWORKPOLICY_WARNING" value="502" version="0" level="win:Informational" task="ENGINE_EXT" template="String Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.502.message)">
                    </event>
                    <event symbol="ENGINE_EXT_NETWORKPOLICY_ALLOWED_TO_UPLOAD_OR_DOWNLOAD" value="503" version="0" level="win:Verbose" task="ENGINE_EXT" template="String Dword Bool Bool Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.503.message)">
                    </event>
                    <event symbol="ENGINE_EXT_NOTIFY_BACKUP_STATUS" value="504" version="0" level="win:Verbose" task="ENGINE_EXT" template="Hr Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.504.message)">
                    </event>
                    <event symbol="ENGINE_EXT_SCHEDULE_ENABLE" value="505" version="0" level="win:Verbose" task="ENGINE_EXT" template="SCHEDULE_TYPE hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.505.message)">
                    </event>
                    <event symbol="ENGINE_EXT_SCHEDULE_DISABLE" value="506" version="0" level="win:Verbose" task="ENGINE_EXT" template="SCHEDULE_TYPE hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.506.message)">
                    </event>
                    <event symbol="ENGINE_EXT_SCHEDULE_ADVANCE" value="507" version="0" level="win:Verbose" task="ENGINE_EXT" template="SCHEDULE_TYPE hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.507.message)">
                    </event>
                    <event symbol="ENGINE_EXT_SET_LAST_KNOWN_GOOD_BACKUP_TIME" value="508" version="0" level="win:Verbose" task="ENGINE_EXT" template="FILETIME" message="$(string.Microsoft-WindowsPhone-BMR2.event.508.message)">
                    </event>
                    <event symbol="ENGINE_EXT_SET_LAST_BACKUP_STATUS" value="509" version="0" level="win:Verbose" task="ENGINE_EXT" template="hr FILETIME" message="$(string.Microsoft-WindowsPhone-BMR2.event.509.message)">
                    </event>
                    <event symbol="ENGINE_EXT_SET_RESTORE_IN_PROGRESS" value="510" version="0" level="win:Verbose" task="ENGINE_EXT" template="Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.510.message)">
                    </event>
                    <event symbol="ENGINE_EXT_NETWORKPOLICY_REJECTED_BY_PRIORITY" value="511" version="0" level="win:Warning" task="ENGINE_EXT" template="Dword String DPU_STATE Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.511.message)">
                    </event>
                    <event symbol="ENGINE_EXT_CONNECTION_DETAILS_FAILED" value="512" version="0" level="win:Error" task="ENGINE_EXT" template="Dword Dword" message="$(string.Microsoft-WindowsPhone-BMR2.event.512.message)">
                    </event>

                    <!-- Restore: 600-699 -->
                    <event symbol="RESTORE_START" value="600" version="0" level="win:Informational" task="RESTORE" opcode="win:Start">
                    </event>
                    <event symbol="RESTORE_CANCEL" value="601" version="0" level="win:Informational" opcode="win:Start">
                    </event>
                    <event symbol="RESTORE_COLLECTION_START" value="602" version="0" level="win:Verbose" task="RESTORE" opcode="COLLECTION" template="String" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.602.message)">
                    </event>
                    <event symbol="RESTORE_COLLECTION_STOP" value="603" version="0" level="win:Verbose" task="RESTORE" opcode="COLLECTION" template="Hr" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.603.message)">
                    </event>
                    <event symbol="RESTORE_STOP" value="604" version="0" level="win:Informational" task="RESTORE" opcode="win:Stop" template="hr RESTORE_ERRORTYPE" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.604.message)">
                    </event>
                    <event symbol="GETDEVICEPROFILE_START" value="605" version="0" level="win:Verbose" task="RESTORE" opcode="win:Start" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.605.message)">
                    </event>
                    <event symbol="GETDEVICEPROFILE_FOUND" value="606" version="0" level="win:Informational" task="RESTORE" template="String" message="$(string.Microsoft-WindowsPhone-BMR2.event.606.message)">
                    </event>
                    <event symbol="GETDEVICEPROFILE_NOTFOUND" value="607" version="0" level="win:Informational" task="RESTORE" message="$(string.Microsoft-WindowsPhone-BMR2.event.607.message)">
                    </event>
                    <event symbol="GETDEVICEPROFILE_STOP" value="608" version="0" level="win:Verbose" task="RESTORE" opcode="win:Stop" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.608.message)">
                    </event>
                    <event symbol="SYNCPAYLOAD3_START" value="609" version="0" level="win:Verbose" task="RESTORE" opcode="win:Start" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.609.message)">
                    </event>
                    <event symbol="SYNCPAYLOAD3_STOP" value="610" version="0" level="win:Verbose" task="RESTORE" opcode="win:Stop" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.610.message)">
                    </event>
                    <event symbol="WINDOWSANYWHEREFEATURE_DISABLED" value="611" version="0" level="win:Informational" task="RESTORE" message="$(string.Microsoft-WindowsPhone-BMR2.event.611.message)">
                    </event>
                    <event symbol="COMPARE_DEVICE_PROFILEARRAY" value="612" version="0" level="win:Informational" task="RESTORE" template="String String String String String String Filetime Filetime Bool Bool Int32" message="$(string.Microsoft-WindowsPhone-BMR2.event.612.message)">
                    </event>
                    <event symbol="SYNCSTRUCTURE_START" value="613" version="0" level="win:Verbose" task="RESTORE" opcode="win:Start" template="String" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.613.message)">
                    </event>
                    <event symbol="SYNCSTRUCTURE_STOP" value="614" version="0" level="win:Verbose" task="RESTORE" opcode="win:Stop" template="String" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.614.message)">
                    </event>
                    <event symbol="DATASTOREID_CREATED" value="615" version="0" level="win:Informational" task="RESTORE" message="$(string.Microsoft-WindowsPhone-BMR2.event.615.message)">
                    </event>
                    <event symbol="CLOUDSTOREDATA_LOADED" value="616" version="0" level="win:Informational" task="RESTORE" message="$(string.Microsoft-WindowsPhone-BMR2.event.616.message)">
                    </event>
                    <event symbol="SYNCPAYLOAD1_START" value="617" version="0" level="win:Verbose" task="RESTORE" opcode="win:Start" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.617.message)">
                    </event>
                    <event symbol="SYNCPAYLOAD1_STOP" value="618" version="0" level="win:Verbose" task="RESTORE" opcode="win:Stop" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.618.message)">
                    </event>
                    <event symbol="SYNCPAYLOAD2_START" value="619" version="0" level="win:Verbose" task="RESTORE" opcode="win:Start" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.619.message)">
                    </event>
                    <event symbol="SYNCPAYLOAD2_STOP" value="620" version="0" level="win:Verbose" task="RESTORE" opcode="win:Stop" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.620.message)">
                    </event>
                    <event symbol="WINDOWSANYWHEREFEATURE_ENABLED" value="621" version="0" level="win:Informational" task="RESTORE" message="$(string.Microsoft-WindowsPhone-BMR2.event.621.message)">
                    </event>
                    <event symbol="APPLY_ROAMING_COLLECTION_START" value="622" version="0" level="win:Verbose" task="RESTORE" opcode="win:Start" template="String" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.622.message)">
                    </event>
                    <event symbol="APPLY_ROAMING_COLLECTION_STOP" value="623" version="0" level="win:Verbose" task="RESTORE" opcode="win:Stop" template="String Hr" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.623.message)">
                    </event>
                    <event symbol="APPLY_BACKUPONLY_COLLECTIONS_START" value="624" version="0" level="win:Verbose" task="RESTORE" opcode="win:Start"  keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.624.message)">
                    </event>
                    <event symbol="APPLY_BACKUPONLY_COLLECTIONS_STOP" value="625" version="0" level="win:Verbose" task="RESTORE" opcode="win:Stop" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.625.message)">
                    </event>
                    <event symbol="SYNCBOOTSTRAPPAYLOAD1_START" value="626" version="0" level="win:Verbose" task="RESTORE" opcode="win:Start"  keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.626.message)">
                    </event>
                    <event symbol="SYNCBOOTSTRAPPAYLOAD1_STOP" value="627" version="0" level="win:Verbose" task="RESTORE" opcode="win:Stop" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.627.message)">
                    </event>

                    <!-- Roaming: 700-799 -->
                    <event symbol="ROAMING_STARTROAMING_START" value="700" version="0" level="win:Informational" task="ROAMING" opcode="STARTROAMING" keywords="Performance ">
                    </event>
                    <event symbol="ROAMING_STARTROAMING_STOP" value="701" version="0" level="win:Informational" task="ROAMING" opcode="STARTROAMING" template="Hr" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.701.message)">
                    </event>
                    <event symbol="ROAMING_FINISHSTARTROAMING_START" value="702" version="0" level="win:Informational" task="ROAMING" opcode="FINISHSTARTROAMING" keywords="Performance ">
                    </event>
                    <event symbol="ROAMING_FINISHSTARTROAMING_ACCOUNT_ROAMINGAVAILABLE" value="703" version="0" level="win:Informational" task="ROAMING" opcode="FINISHSTARTROAMING" template="Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.703.message)">
                    </event>
                    <event symbol="ROAMING_FINISHSTARTROAMING_STOP" value="704" version="0" level="win:Informational" task="ROAMING" opcode="FINISHSTARTROAMING" template="Hr" keywords="Performance " message="$(string.Microsoft-WindowsPhone-BMR2.event.704.message)">
                    </event>
                    <event symbol="ROAMING_UPDATE_CHECK" value="705" version="0" level="win:Informational" task="ROAMING" template="Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.705.message)">
                    </event>
                    <event symbol="ROAMING_FINISHSTARTROAMING_ACCOUNT_BACKUPAVAILABLE" value="706" version="0" level="win:Informational" task="ROAMING" opcode="FINISHSTARTROAMING" template="Bool" message="$(string.Microsoft-WindowsPhone-BMR2.event.706.message)">
                    </event>

                    <!-- Theme Setting Handler: 800-899 -->
                    <event symbol="THEME_ROAMEDCOLOR_TO_PHONECOLOR" value="800" version="0" level="win:Informational" task="THEME_SETTINGHANDLER" opcode="APPLYUNIT" template="Dword Dword Dword" message="$(string.Microsoft-WindowsPhone-BMR2.event.800.message)">
                    </event>
                    <event symbol="THEME_PHONECOLOR_TO_ROAMEDCOLOR" value="801" version="0" level="win:Informational" task="THEME_SETTINGHANDLER" opcode="GETUNIT" template="Dword Dword Dword" message="$(string.Microsoft-WindowsPhone-BMR2.event.801.message)">
                    </event>

                    <!-- Setting Handler: 900-999 -->
                    <event symbol="SETTINGHANDLER_UNESCAPEFAILURE" value="900" version="0" level="win:Error" task="SETTINGHANDLER" template="String Dword Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.900.message)">
                    </event>
                    <event symbol="SETTINGHANDLER_ESCAPEFAILURE" value="901" version="0" level="win:Error" task="SETTINGHANDLER" template="String Dword Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.900.message)">
                    </event>
                    <event symbol="SETTINGHANDLER_APPLYUNITFAILURE" value="902" version="0" level="win:Error" task="SETTINGHANDLER" template="String Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.902.message)">
                    </event>
                    <event symbol="SETTINGHANDLER_GETUNITFAILURE" value="903" version="0" level="win:Error" task="SETTINGHANDLER" template="String Hr" message="$(string.Microsoft-WindowsPhone-BMR2.event.903.message)">
                    </event>
                </events>
                <levels>
                </levels>
                <tasks>
                    <task name="CSP_SETTINGHANDLER" symbol="CSP_SETTINGHANDLER" value="1" eventGUID="{00000000-0000-0000-0000-000000000000}">
                    </task>
                    <task name="UX_ROAMINGCPL" symbol="UX_ROAMINGCPL" value="2" eventGUID="{00000000-0000-0000-0000-000000000000}">
                    </task>
                    <task name="MONITOR_SERVICE" symbol="MONITOR_SERVICE" value="3" eventGUID="{00000000-0000-0000-0000-000000000000}">
                    </task>
                    <task name="BACKGROUND_TASK" symbol="BACKGROUND_TASK" value="4" eventGUID="{00000000-0000-0000-0000-000000000000}">
                    </task>
                    <task name="ENGINE_EXT" symbol="ENGINE_EXT" value="5" eventGUID="{00000000-0000-0000-0000-000000000000}">
                    </task>
                    <task name="DEVICEPROFILES" symbol="DEVICEPROFILES" value="6" eventGUID="{00000000-0000-0000-0000-000000000000}">
                    </task>
                    <task name="FILE_SCP" symbol="FILE_SCP" value="7" eventGUID="{00000000-0000-0000-0000-000000000000}">
                    </task>
                    <task name="RESTORE" symbol="RESTORE" value="8" eventGUID="{00000000-0000-0000-0000-000000000000}">
                    </task>
                    <task name="ROAMING" symbol="ROAMING" value="9" eventGUID="{00000000-0000-0000-0000-000000000000}">
                    </task>
                    <task name="THEME_SETTINGHANDLER" symbol="THEME_SETTINGHANDLER" value="10" eventGUID="{00000000-0000-0000-0000-000000000000}">
                    </task>
                    <task name="SETTINGHANDLER" symbol="SETTINGHANDLER" value="11" eventGUID="{00000000-0000-0000-0000-000000000000}">
                    </task>
                </tasks>
                <opcodes>
                    <opcode name="PROVISIONING" symbol="PROVISIONING" value="10">
                    </opcode>
                    <opcode name="APPLYUNIT" symbol="APPLYUNIT" value="11">
                    </opcode>
                    <opcode name="GETUNIT" symbol="GETUNIT" value="12">
                    </opcode>
                    <opcode name="MAINTENANCE" symbol="MAINTENANCE" value="13">
                    </opcode>
                    <opcode name="SETTINGCHANGE" symbol="SETTINGCHANGE" value="14">
                    </opcode>
                    <opcode name="STARTMONITORS" symbol="STARTMONITORS" value="15">
                    </opcode>
                    <opcode name="CLOUDCHANGE" symbol="CLOUDCHANGE" value="16">
                    </opcode>
                    <opcode name="COLLECTION" symbol="COLLECTION" value="17">
                    </opcode>
                    <opcode name="STARTROAMING" symbol="STARTROAMING" value="18">
                    </opcode>
                    <opcode name="FINISHSTARTROAMING" symbol="FINISHSTARTROAMING" value="19">
                    </opcode>
                    <opcode name="MAINTENANCE_BATTERY" symbol="MAINTENANCE_BATTERY" value="20">
                    </opcode>
                    <opcode name="MAINTENANCE_NOTIFICATION" symbol="MAINTENANCE_NOTIFICATION" value="21">
                    </opcode>
                    <opcode name="MAINTENANCE_CANCEL" symbol="MAINTENANCE_CANCEL" value="22">
                    </opcode>
                </opcodes>
                <keywords>
                    <keyword name="Error" mask="0x1">
                    </keyword>
                    <keyword name="Performance" mask="0x2">
                    </keyword>
                </keywords>
                <maps>
                    <valueMap name="RESTORE_ERRORTYPE">
                        <map value="0" message="$(string.Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.0.message)">
                        </map>
                        <map value="1" message="$(string.Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.1.message)">
                        </map>
                        <map value="2" message="$(string.Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.2.message)">
                        </map>
                        <map value="3" message="$(string.Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.3.message)">
                        </map>
                        <map value="4" message="$(string.Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.4.message)">
                        </map>
                        <map value="5" message="$(string.Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.5.message)">
                        </map>
                    </valueMap>
                    <valueMap name="SCHEDULE_TYPE">
                        <map value="0" message="$(string.Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.0.message)">
                        </map>
                        <map value="1" message="$(string.Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.1.message)">
                        </map>
                        <map value="2" message="$(string.Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.2.message)">
                        </map>
                        <map value="3" message="$(string.Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.3.message)">
                        </map>
                        <map value="4" message="$(string.Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.4.message)">
                        </map>
                        <map value="5" message="$(string.Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.5.message)">
                        </map>
                        <map value="6" message="$(string.Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.6.message)">
                        </map>
                        <map value="7" message="$(string.Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.7.message)">
                        </map>
                        <map value="8" message="$(string.Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.8.message)">
                        </map>
                    </valueMap>
                    <valueMap name="DPU_STATE">
                        <map value="0" message="$(string.Microsoft-WindowsPhone-BMR2.map.DPU_STATE.0.message)">
                        </map>
                        <map value="1" message="$(string.Microsoft-WindowsPhone-BMR2.map.DPU_STATE.1.message)">
                        </map>
                        <map value="2" message="$(string.Microsoft-WindowsPhone-BMR2.map.DPU_STATE.2.message)">
                        </map>
                        <map value="3" message="$(string.Microsoft-WindowsPhone-BMR2.map.DPU_STATE.3.message)">
                        </map>
                        <map value="4" message="$(string.Microsoft-WindowsPhone-BMR2.map.DPU_STATE.4.message)">
                        </map>
                        <map value="5" message="$(string.Microsoft-WindowsPhone-BMR2.map.DPU_STATE.5.message)">
                        </map>
                        <map value="6" message="$(string.Microsoft-WindowsPhone-BMR2.map.DPU_STATE.6.message)">
                        </map>
                    </valueMap>
                </maps>
                <templates>
                    <template tid="String">
                        <data name="psz" inType="win:UnicodeString" outType="xs:string">
                        </data>
                    </template>
                    <template tid="Hr">
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                    </template>
                    <template tid="Dword Dword Hr">
                        <data name="dword1" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="dword2" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                    </template>
                    <template tid="String String">
                        <data name="psz1" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="psz2" inType="win:UnicodeString" outType="xs:string">
                        </data>
                    </template>
                    <template tid="String Dword Hr">
                        <data name="psz" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="dword" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                    </template>
                    <template tid="String Hr">
                        <data name="psz" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                    </template>
                    <template tid="String Bool">
                        <data name="psz" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="flag" inType="win:Boolean" outType="xs:boolean">
                        </data>
                    </template>
                    <template tid="Bool Hr">
                        <data name="flag" inType="win:Boolean" outType="xs:boolean">
                        </data>
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                    </template>
                    <template tid="Dword">
                        <data name="dword" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                    </template>
                    <template tid="Dword Hr">
                        <data name="dword" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                    </template>
                    <template tid="String String String String Filetime Dword Dword Dword String Bool">
                        <data name="Id" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="Name" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="Make" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="Model" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="ModifiedTime" inType="win:FILETIME" outType="xs:dateTime">
                        </data>
                        <data name="MinOsVersion.Major" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="MinOsVersion.Minor" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="MinOsVersion.Build" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="BuildString" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="IsCurrentDevice" inType="win:Boolean" outType="xs:boolean">
                        </data>
                    </template>
                    <template tid="Dword Bool">
                        <data name="dword" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="flag" inType="win:Boolean" outType="xs:boolean">
                        </data>
                    </template>
                    <template tid="String Dword Bool">
                        <data name="psz" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="dword" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="result" inType="win:Boolean" outType="xs:boolean">
                        </data>
                    </template>
                    <template tid="hr RESTORE_ERRORTYPE">
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                        <data name="errortype" inType="win:UInt32" map="RESTORE_ERRORTYPE">
                        </data>
                    </template>
                    <template tid="tTraceMessage">
                        <data name="Message" inType="win:Pointer">
                        </data>
                    </template>
                    <template tid="String Dword Bool Bool Bool">
                        <data name="psz" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="dword" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="flag1" inType="win:Boolean" outType="xs:boolean">
                        </data>
                        <data name="flag2" inType="win:Boolean" outType="xs:boolean">
                        </data>
                        <data name="result" inType="win:Boolean" outType="xs:boolean">
                        </data>
                    </template>
                    <template tid="Bool">
                        <data name="boolval" inType="win:Boolean" outType="xs:boolean">
                        </data>
                    </template>
                    <template tid="SCHEDULE_TYPE hr">
                        <data name="scheduletype" inType="win:UInt32" map="SCHEDULE_TYPE">
                        </data>
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                    </template>
                    <template tid="FILETIME">
                        <data name="FileTime" inType="win:FILETIME" outType="win:DateTimeCultureInsensitive">
                        </data>
                    </template>
                    <template tid="hr FILETIME">
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                        <data name="FileTime" inType="win:FILETIME" outType="win:DateTimeCultureInsensitive">
                        </data>
                    </template>
                    <template tid="Dword Dword Dword">
                        <data name="color1" inType="win:UInt32" outType="xs:HexInt32">
                        </data>
                        <data name="color2" inType="win:UInt32" outType="xs:HexInt32">
                        </data>
                        <data name="bgindex" inType="win:UInt32" outType="xs:HexInt32">
                        </data>
                    </template>
                    <template tid="Hr Hr">
                        <data name="hrstatus" inType="win:UInt32" outType="xs:HexInt32">
                        </data>
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                    </template>
                    <template tid="Dword String DPU_STATE Hr">
                        <data name="priority" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="connection" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="dpustate" inType="win:UInt32" map="DPU_STATE">
                        </data>
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                    </template>
                    <template tid="Dword Dword">
                        <data name="priority" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                        <data name="cmresult" inType="win:UInt32" outType="xs:unsignedInt">
                        </data>
                    </template>
                    <template tid="Bool Bool Bool">
                        <data name="boolval1" inType="win:Boolean" outType="xs:boolean">
                        </data>
                        <data name="boolval2" inType="win:Boolean" outType="xs:boolean">
                        </data>
                        <data name="boolval3" inType="win:Boolean" outType="xs:boolean">
                        </data>
                    </template>
                    <template tid="Bool Bool Hr">
                        <data name="boolval1" inType="win:Boolean" outType="xs:boolean">
                        </data>
                        <data name="boolval2" inType="win:Boolean" outType="xs:boolean">
                        </data>
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                    </template>
                    <template tid="String Bool Hr">
                        <data name="psz" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="boolval" inType="win:Boolean" outType="xs:boolean">
                        </data>
                        <data name="hr" inType="win:UInt32" outType="win:HexInt32">
                        </data>
                    </template>
                    <template tid="String FILETIME ULONGLONG ULONGLONG Bool">
                        <data name="psz" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="FileTime" inType="win:FILETIME" outType="win:DateTimeCultureInsensitive">
                        </data>
                        <data name="difference" inType="win:UInt64">
                        </data>
                        <data name="lastOperation" inType="win:UInt64">
                        </data>
                        <data name="result" inType="win:Boolean" outType="xs:boolean">
                        </data>
                    </template>
                    <template tid="Bool Bool">
                        <data name="backup" inType="win:Boolean" outType="xs:boolean">
                        </data>
                        <data name="roaming" inType="win:Boolean" outType="xs:boolean">
                        </data>
                    </template>
                    <template tid="String String String String String String Filetime Filetime Bool Bool Int32">
                        <data name="ProductName" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="Model1" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="Model2" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="DeviceMake" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="Make1" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="Make2" inType="win:UnicodeString" outType="xs:string">
                        </data>
                        <data name="FileTime1" inType="win:FILETIME" outType="xs:dateTime">
                        </data>
                        <data name="FileTime2" inType="win:FILETIME" outType="xs:dateTime">
                        </data>
                        <data name="IsCurrentDevice1" inType="win:Boolean" outType="xs:boolean">
                        </data>
                        <data name="IsCurrentDevice2" inType="win:Boolean" outType="xs:boolean">
                        </data>
                        <data name="Result" inType="win:Int32" outType="xs:int">
                        </data>
                    </template>
                </templates>
            </provider>
        </events>
    </instrumentation>
    <localization>
        <resources culture="en-US">
            <stringTable>
                <string id="opcode.Stop" value="Stop">
                </string>
                <string id="opcode.Start" value="Start">
                </string>
                <string id="level.Warning" value="Warning">
                </string>
                <string id="level.Verbose" value="Verbose">
                </string>
                <string id="level.Informational" value="Information">
                </string>
                <string id="level.Error" value="Error">
                </string>

                <!-- GENERIC: 900-999 -->
                <string id="Microsoft-WindowsPhone-BMR2.event.903.message" value="Get: Setting Unit: [%1] Hr: [%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.902.message" value="Apply: Setting Unit: [%1] Hr: [%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.900.message" value="String to escape=[%1] Position in String=[%2] Hr=[%3]">
                </string>

                <!-- Theme: 800-899 -->
                <string id="Microsoft-WindowsPhone-BMR2.event.800.message" value="Roamed color=[%1] to phone color=[%2], Background index=[%3]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.801.message" value="Phone color=[%1] to roamed color=[%2], Background index=[%3]">
                </string>

                <!-- Roaming: 700-799 -->
                <string id="Microsoft-WindowsPhone-BMR2.event.706.message" value="Account connected, backup service available [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.705.message" value="Phone has been updated [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.704.message" value="hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.703.message" value="Account connected, roaming service available [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.701.message" value="hr=[%1]">
                </string>

                <!-- Restore: 600-699 -->
                <string id="Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.5.message" value="RESTORE_ERRORTYPE_TFA">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.4.message" value="RESTORE_ERRORTYPE_CANCELLED">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.3.message" value="RESTORE_ERRORTYPE_WARNING_DATALOSS">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.2.message" value="RESTORE_ERRORTYPE_RETRY">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.1.message" value="RESTORE_ERRORTYPE_UNEXPECTED">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.RESTORE_ERRORTYPE.0.message" value="RESTORE_ERRORTYPE_NONE">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.627.message" value="Stop restoring backup only collections">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.626.message" value="Start restoring backup only collections">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.625.message" value="Stop restoring backup only collections">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.624.message" value="Start restoring backup only collections">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.623.message" value="Stop applying roaming collection: [%1] with hr = [%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.622.message" value="Start applying roaming collection: [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.621.message" value="Windows Anywhere feature is enabled">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.620.message" value="Stop Sync Payload 2">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.619.message" value="Start Sync Payload 2">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.618.message" value="Stop Sync Payload 1">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.617.message" value="Start Sync Payload 1">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.616.message" value="Data loaded from cloud store">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.615.message" value="Cloud data store id created">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.614.message" value="Stop syncing structure for [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.613.message" value="Start syncing structure for [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.612.message" value="Comparing devices with current device properties: product name = [%1], model1 = [%2], model2 = [%3], device make = [%4], make1 = [%5], make2 = [%6], filetime1 = [%7], filetime2 = [%8], IsCurrentDevice1 = [%9], IsCurrentDevice2 = [%10], result = [%11]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.611.message" value="Windows Anywhere feature is disabled">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.610.message" value="Stop Sync Payload 3">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.609.message" value="Start Sync Payload 3">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.608.message" value="Stop GetBestDeviceProfile">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.607.message" value="No device profile found">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.606.message" value="Best device profile found with device id[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.605.message" value="Start GetBestDeviceProfile">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.604.message" value="hr=[%1] errortype=[%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.603.message" value="hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.602.message" value="FQCID: [%1]">
                </string>

                <!-- SettingSyncExtensions: 500-599 -->
                <string id="Microsoft-WindowsPhone-BMR2.map.DPU_STATE.6.message" value="last">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.DPU_STATE.5.message" value="exempt-zero-rate">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.DPU_STATE.4.message" value="over-limit">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.DPU_STATE.3.message" value="off-track">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.DPU_STATE.2.message" value="on-track">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.DPU_STATE.1.message" value="under-track">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.DPU_STATE.0.message" value="not-tracked">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.8.message" value="unblock-notification-channels">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.7.message" value="maintenance-cancel">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.6.message" value="first-maintenance">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.5.message" value="account-signin">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.4.message" value="first-start">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.3.message" value="monitor-service-start">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.2.message" value="maintenance-notification">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.1.message" value="maintenance-battery-allowed">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.map.SCHEDULE_TYPE.0.message" value="maintenance">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.512.message" value="Connection manager rejects collection with priority [%1] with cmresult [%2}.">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.511.message" value="Network policy rejects collection with priority [%1] on connection [%2] of dpustate [%3], hr = [%4].">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.510.message" value="Set restore-in-progress flag [%1].">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.509.message" value="Set last backup status [%1] time [%2].">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.508.message" value="Set last known good backup time [%1].">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.507.message" value="Schedule [%1] is advanced.">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.506.message" value="Schedule [%1] is disabled.">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.505.message" value="Schedule [%1] is enabled.">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.504.message" value="NotifyBackupStatus is called with status [%1], hr=[%2].">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.503.message" value="Network policy allows collection [%1]: reason=[%2] upload=[%3], userinitiated=[%4], result[%5].">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.502.message" value="No network priority configured for collection [%1], hr=[%2] ignored">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.501.message" value="Network policy allows collection [%1] for operation [%2]: [%3].">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.500.message" value="Group policy [%1] allows roaming: [%2].">
                </string>

                <!-- CSP Setting Handler: 400-499 -->
                <string id="Microsoft-WindowsPhone-BMR2.event.410.message" value="Setting Name=[%1] Path=[%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.409.message" value="Setting Unit: [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.408.message" value="hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.407.message" value="Setting Name=[%1] Path=[%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.406.message" value="Max Supported Creation Id=[%1], Actual CreationId=[%2], hr=[%3]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.405.message" value="Setting Unit: [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.404.message" value="Setting Collection: [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.403.message" value="Setting: hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.401.message" value="Setting Unit: hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.400.message" value="Setting Collection: hr=[%1]">
                </string>

                <!-- BMR2 Restore Services: 300-399 -->
                <string id="Microsoft-WindowsPhone-BMR2.event.306.message" value="Restore from device id[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.305.message" value="Querying Skydrive for device profiles failed with error: hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.304.message" value="Device profile ignored due to error: hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.303.message" value="No device profiles found: hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.302.message" value="Duplicate device profile detected and ignored for device id [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.300.message" value="Device profile: id[%1] name[%2] make[%3] model[%4] modifiedtime[%5] min_os_version[%6.%7.%8] backup_os_version[%9] currentdevice[%10]">
                </string>

                <!-- Setting Monitor Host: 200-299 -->
                <string id="Microsoft-WindowsPhone-BMR2.event.235.message" value="Setting Monitor Service will not start for AAD connected account: Feature_AADMobileRoaming[%1], AllowedByGroupPolicy[%2], SettingSyncAllowedForUser[%3]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.234.message" value="Background task is being cancelled = [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.233.message" value="Background backup=[%1] roaming=[%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.232.message" value="Background task check for [%1] last went=[%2] registered span=[%3] difference=[%4] approved=[%5]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.231.message" value="Invalid String given for HKEY base=[%1] Key=[%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.230.message" value="Notification channel changed: channel=[%1] blocked=[%2] hr=[%3]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.229.message" value="Notification channels changed: blocked=[%1] callback=[%2] hr=[%3]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.228.message" value="Maintenance subscription renewal completed with hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.227.message" value="Change publisher [%1] enabled [%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.225.message" value="OnStopping Stop hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.224.message" value="OnStopping Start">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.223.message" value="OnStarted Stop hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.222.message" value="OnStarted Start">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.221.message" value="OnStarting Stop hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.220.message" value="OnStarting Start">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.219.message" value="SyncAtPostLogon hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.218.message" value="Background Sync as maintenance as notification failed: hr = [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.217.message" value="Background Sync as maintenance as notification">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.216.message" value="Background Sync as maintenance with battery allowed failed: hr = [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.215.message" value="Background Sync as maintenance with battery allowed">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.214.message" value="Background Sync on cloud change retry failed: hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.213.message" value="Background Sync on cloud change retry">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.212.message" value="Setting sync engine refresh call failed: hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.211.message" value="Sync on cloud change failed: Type=[%1], hr=[%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.210.message" value="Sync on cloud change: Type=[%1], hr=[%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.209.message" value="File system change publisher notified with null string for collection [%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.208.message" value="Live id check result is hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.207.message" value="Setting change publishers running change: Running=[%1], hr=[%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.206.message" value="Flag=[%1], hr=[%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.204.message" value="Microsoft account not attached. Stopping monitor service.">
                </string>

                <!-- Roaming CPL: 100-199 -->
                <string id="Microsoft-WindowsPhone-BMR2.event.105.message" value="Failed to check if roaming is enabled. hr=[%1]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.104.message" value="Group [%1] was set to [%2].">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.103.message" value="Failed to check if roaming group is enabled: [%1]. hr=[%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.102.message" value="Failed to enable roaming group: [%1]. hr=[%2].">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.101.message" value="Failed to get registry key: [%1]. hr=[%2]">
                </string>
                <string id="Microsoft-WindowsPhone-BMR2.event.100.message" value="Couldn't instantiate the UI Controller.">
                </string>

                <!-- Shared: 1-99 -->
                <string id="Microsoft-WindowsPhone-BMR2.event.1.message" value="hr=[%1]">
                </string>
            </stringTable>
        </resources>
    </localization>
</instrumentationManifest>
