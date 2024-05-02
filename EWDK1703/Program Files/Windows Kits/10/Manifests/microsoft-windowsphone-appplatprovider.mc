<?xml version="1.0" encoding="utf-8"?>
<instrumentationManifest xmlns="http://schemas.microsoft.com/win/2004/08/events" xmlns:ms="http://manifests.microsoft.com/win/2004/08/windows/events" xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <instrumentation>
    <events>
      <provider name="Microsoft-WindowsPhone-AppPlatProvider" guid="{3C42000F-CC27-48C3-A005-48F6E38B131F}" messageFileName="%_NTTREE%\Microsoft-WindowsPhone-AppPlatProvider.dll" resourceFileName="%_NTTREE%\Microsoft-WindowsPhone-AppPlatProvider.dll" symbol="MICROSOFT_WINDOWSPHONE_APPPLATPROVIDER">
        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Component Keywords-->
          <keyword mask="0x0000000000000004" name="Generic" message="$(string.Keyword.Generic)" />
          <keyword mask="0x0000000000000008" name="Common" message="$(string.Keyword.Common)" />
          <keyword mask="0x0000000000000010" name="PacMan" message="$(string.Keyword.PacMan)" />
          <keyword mask="0x0000000000000200" name="ResMan" message="$(string.Keyword.ResMan)" />
          <keyword mask="0x0000000000000400" name="DeviceReg" message="$(string.Keyword.DeviceReg)" />
          <keyword mask="0x0000000000000800" name="Bss" message="$(string.Keyword.Bss)" />
          <keyword mask="0x0000000000001000" name="Sqm" message="$(string.Keyword.Sqm)" />
          <keyword mask="0x0000000000002000" name="Share" message="$(string.Keyword.ShareBroker)" />
          <keyword mask="0x0000000000020000" name="ProductionCircular" message="$(string.Keyword.ProductionCircular)" />
          <keyword mask="0x0000000000040000" name="ProductionCritical" message="$(string.Keyword.ProductionCritical)" />
          <keyword mask="0x0000000000080000" name="SelfHostCircular" message="$(string.Keyword.SelfHostCircular)" />
          <keyword mask="0x0000000000100000" name="SelfHostCritical" message="$(string.Keyword.SelfHostCritical)" />
          <keyword mask="0x0000000000200000" name="DevPlatCircular" message="$(string.Keyword.DevPlatCircular)" />
          <keyword mask="0x0000000001000000" name="BTPolicy" message="$(string.Keyword.BTPolicy)" />
          <keyword mask="0x0000000002000000" name="BatterySense" message="$(string.Keyword.BatterySense)" />
          <keyword mask="0x0000000008000000" name="PlatformInterop" message="$(string.Keyword.PlatformInterop)" />
          <keyword mask="0x0000000010000000" name="BAPolicy" message="$(string.Keyword.BAPolicy)" />
        </keywords>
        <tasks>
          <task name="BNS_PERIODIC_AGENT_LAUNCH" value="1" />
          <task name="BNS_ONIDLE_AGENT_LAUNCH" value="2" />
          <task name="BNS_LOCATION_PERFETCH" value="3" />
          <task name="BNS_KEEPALIVE_AGENT_LAUNCH" value="4" />
          <task name="BNS_INCOMINGCALL_AGENT_LAUNCH" value="5" />
          <task name="BNS_NABSYNC_AGENT_LAUNCH" value="6" />
          <task name="BackgroundTransferPolicyTrace" value="11" />
          <task name="LogTrace" value="10" />
          <task name="GlobalMemStats" value="7" />
          <task name="ProcessMemStats" value="8" />
          <task name="BackgroundAudioPolicyTrace" value="24" />
        </tasks>
        <maps>
          <!-- Sample to convert enums to strings in a message format.  Use templates like this: <data name="p1_UInt32" inType="win:UInt32" map="Descriptions" /> -->
          <valueMap name="Descriptions">
            <map value="1" message="$(string.Maps.Descriptions.Sample1)" />
            <map value="2" message="$(string.Maps.Descriptions.Sample2)" />
          </valueMap>
          <valueMap name="BssRecurringType">
            <map value="0" message="$(string.Maps.BssRecurringType.None)" />
            <map value="1" message="$(string.Maps.BssRecurringType.Daily)" />
            <map value="2" message="$(string.Maps.BssRecurringType.Weekly)" />
            <map value="3" message="$(string.Maps.BssRecurringType.Monthly)" />
            <map value="4" message="$(string.Maps.BssRecurringType.EndOfMonth)" />
            <map value="5" message="$(string.Maps.BssRecurringType.Yearly)" />
            <map value="6" message="$(string.Maps.BssRecurringType.Maximum)" />
          </valueMap>
          <valueMap name="BssNotificationType">
            <map value="0" message="$(string.Maps.BssNotificationType.TimeBasedAlarm)" />
            <map value="1" message="$(string.Maps.BssNotificationType.TimeBasedReminder)" />
            <map value="2" message="$(string.Maps.BssNotificationType.PeriodicTask)" />
            <map value="3" message="$(string.Maps.BssNotificationType.OnIdleTask)" />
            <map value="4" message="$(string.Maps.BssNotificationType.KeepAliveTask)" />
            <map value="5" message="$(string.Maps.BssNotificationType.IncomingCallTask)" />
            <map value="6" message="$(string.Maps.BssNotificationType.NabSyncTask)" />
            <map value="7" message="$(string.Maps.BssNotificationType.Maximum)" />
          </valueMap>
          <valueMap name="BssNotificationState">
            <map value="0" message="$(string.Maps.BssNotificationState.Scheduled)" />
            <map value="1" message="$(string.Maps.BssNotificationState.Completed)" />
            <map value="2" message="$(string.Maps.BssNotificationState.Disabled)" />
            <map value="3" message="$(string.Maps.BssNotificationState.Maximum)" />
          </valueMap>
          <valueMap name="BssEventHandlerType">
            <map value="0" message="$(string.Maps.BssEventHandlerType.CheckAll)" />
            <map value="1" message="$(string.Maps.BssEventHandlerType.TimerManager)" />
            <map value="2" message="$(string.Maps.BssEventHandlerType.PeriodicTaskLaunching)" />
            <map value="3" message="$(string.Maps.BssEventHandlerType.PeriodicTaskCancelling)" />
            <map value="4" message="$(string.Maps.BssEventHandlerType.OnIdleLaunching)" />
            <map value="5" message="$(string.Maps.BssEventHandlerType.OnIdleCancelling)" />
            <map value="6" message="$(string.Maps.BssEventHandlerType.KeepAlivePeriodicLaunching)" />
            <map value="7" message="$(string.Maps.BssEventHandlerType.KeepAliveNetworkOn)" />
            <map value="8" message="$(string.Maps.BssEventHandlerType.KeepAliveBatterySaverLaunching)" />
            <map value="9" message="$(string.Maps.BssEventHandlerType.DebuggerEvent)" />
            <map value="10" message="$(string.Maps.BssEventHandlerType.Last)" />
          </valueMap>
          <valueMap name="BssNotificationDescription">
            <map value="0" message="$(string.Maps.BssNotificationDescription.CreateNotification)" />
            <map value="1" message="$(string.Maps.BssNotificationDescription.DeleteNotification)" />
            <map value="2" message="$(string.Maps.BssNotificationDescription.ExpireNotification)" />
            <map value="3" message="$(string.Maps.BssNotificationDescription.LaunchNotification)" />
            <map value="4" message="$(string.Maps.BssNotificationDescription.UpdateNotification)" />
            <map value="5" message="$(string.Maps.BssNotificationDescription.CancelNotification)" />
            <map value="6" message="$(string.Maps.BssNotificationDescription.DisableNotification)" />
            <map value="7" message="$(string.Maps.BssNotificationDescription.EnableNotification)" />
            <map value="8" message="$(string.Maps.BssNotificationDescription.AimVerifyNotification)" />
            <map value="9" message="$(string.Maps.BssNotificationDescription.CleanTimer)" />
            <map value="10" message="$(string.Maps.BssNotificationDescription.NoLaunchExpiredTask)" />
            <map value="11" message="$(string.Maps.BssNotificationDescription.RemoveBecauseOfAbort)" />
            <map value="12" message="$(string.Maps.BssNotificationDescription.MarkCompletedGbaExpired)" />
            <map value="13" message="$(string.Maps.BssNotificationDescription.RemoveBecauseOfUnhandledExceptions)" />
            <map value="14" message="$(string.Maps.BssNotificationDescription.CancelScheduledTask)" />
            <map value="15" message="$(string.Maps.BssNotificationDescription.UpdateTaskStatus)" />
            <map value="16" message="$(string.Maps.BssNotificationDescription.SentRequestToAim)" />
            <map value="17" message="$(string.Maps.BssNotificationDescription.NoLaunchCompletedOrRunningTask)" />
            <map value="18" message="$(string.Maps.BssNotificationDescription.ScheduledTaskLaunchResult)" />
          </valueMap>
          <valueMap name="ORCHESTRATOR_ExecutionMode">
            <map value="0" message="$(string.Maps.Descriptions.OR_EXECUTE)" />
            <map value="1" message="$(string.Maps.Descriptions.OR_ROLLBACK)" />
            <map value="2" message="$(string.Maps.Descriptions.OR_CLEANUP)" />
            <map value="3" message="$(string.Maps.Descriptions.OR_FORCEEXECUTE)" />
          </valueMap>
          <valueMap name="ORCHESTRATOR_STATEMACHINE">
            <map value="0" message="$(string.Maps.Descriptions.OR_INSTALL)" />
            <map value="1" message="$(string.Maps.Descriptions.OR_UPDATE)" />
            <map value="2" message="$(string.Maps.Descriptions.OR_UPDATE_LICENSE)" />
            <map value="3" message="$(string.Maps.Descriptions.OR_DBPROVISION_INSTALL)" />
            <map value="4" message="$(string.Maps.Descriptions.OR_DBPROVISION_UNINSTALL)" />
            <map value="5" message="$(string.Maps.Descriptions.OR_DBPROVISION_UPDATE)" />
            <map value="6" message="$(string.Maps.Descriptions.OR_FORCEUNINSTALL)" />
            <map value="7" message="$(string.Maps.Descriptions.OR_INSTALL_WORKER)" />
            <map value="8" message="$(string.Maps.Descriptions.OR_STATEMACHINE_COUNT)" />
          </valueMap>
          <valueMap name="ORCHESTRATOR_ACTIVITY_TYPE">
            <map value="0" message="$(string.Maps.Descriptions.AT_BEGIN_INSTALL)" />
            <map value="1" message="$(string.Maps.Descriptions.AT_BEGIN_UNINSTALL)" />
            <map value="2" message="$(string.Maps.Descriptions.AT_BEGIN_UPDATE)" />
            <map value="3" message="$(string.Maps.Descriptions.AT_BEGIN_DBPROVISION_INSTALL)" />
            <map value="4" message="$(string.Maps.Descriptions.AT_BEGIN_DBPROVISION_UNINSTALL)" />
            <map value="5" message="$(string.Maps.Descriptions.AT_BEGIN_DBPROVISION_UPDATE)" />
            <map value="6" message="$(string.Maps.Descriptions.AT_BEGIN_UPDATE_LICENSE)" />
            <map value="7" message="$(string.Maps.Descriptions.AT_BEGIN_REVOKE_LICENSE)" />
            <map value="8" message="$(string.Maps.Descriptions.AT_BEGIN_INSTALLER_WORKER)" />
            <map value="9" message="$(string.Maps.Descriptions.AT_BEGIN_SD_MOVE)" />
            <map value="10" message="$(string.Maps.Descriptions.AT_VERIFY_PACKAGE_SIGNATURE)" />
            <map value="11" message="$(string.Maps.Descriptions.AT_CHAMBER_PROVISION)" />
            <map value="12" message="$(string.Maps.Descriptions.AT_CHAMBER_REPROVISION)" />
            <map value="13" message="$(string.Maps.Descriptions.AT_CHAMBER_DEPROVISION)" />
            <map value="14" message="$(string.Maps.Descriptions.AT_CHAMBER_SDMOVE_REPROVISION)" />
            <map value="15" message="$(string.Maps.Descriptions.AT_INSTALLER_WORKER)" />
            <map value="16" message="$(string.Maps.Descriptions.AT_EXTRACT_PACKAGE)" />
            <map value="17" message="$(string.Maps.Descriptions.AT_MDIL_BIND)" />
            <map value="18" message="$(string.Maps.Descriptions.AT_PARSE_MANIFEST)" />
            <map value="19" message="$(string.Maps.Descriptions.AT_PARSE_DBPROVISION_MANIFEST)" />
            <map value="20" message="$(string.Maps.Descriptions.AT_UPDATE_PARSE_MANIFEST)" />
            <map value="21" message="$(string.Maps.Descriptions.AT_UPDATE_PARSE_DBPROVISION_MANIFEST)" />
            <map value="22" message="$(string.Maps.Descriptions.AT_VERIFY_MANIFEST)" />
            <map value="23" message="$(string.Maps.Descriptions.AT_CREATE_APP_FOLDER)" />
            <map value="24" message="$(string.Maps.Descriptions.AT_DELETE_APP_FOLDER)" />
            <map value="25" message="$(string.Maps.Descriptions.AT_UPDATE_APP_FOLDER)" />
            <map value="26" message="$(string.Maps.Descriptions.AT_FORCE_DELETE_APP_FOLDER)" />
            <map value="27" message="$(string.Maps.Descriptions.AT_MOVE_APP_FOLDER)" />
            <map value="28" message="$(string.Maps.Descriptions.AT_COPY_APP_FILES)" />
            <map value="29" message="$(string.Maps.Descriptions.AT_MOVE_SD_FOLDER)" />
            <map value="30" message="$(string.Maps.Descriptions.AT_MOVE_SD_CLEANUP)" />
            <map value="31" message="$(string.Maps.Descriptions.AT_RETRIEVE_APP_INFO)" />
            <map value="32" message="$(string.Maps.Descriptions.AT_INSERT_DB_RECORDS)" />
            <map value="33" message="$(string.Maps.Descriptions.AT_DELETE_DB_RECORDS)" />
            <map value="34" message="$(string.Maps.Descriptions.AT_FORCE_DELETE_DB_RECORDS)" />
            <map value="35" message="$(string.Maps.Descriptions.AT_UPDATE_DB_RECORDS)" />
            <map value="36" message="$(string.Maps.Descriptions.AT_FINALIZE_DB_STATE)" />
            <map value="37" message="$(string.Maps.Descriptions.AT_FIX_INSERT_RECORD)" />
            <map value="38" message="$(string.Maps.Descriptions.AT_FIX_UPDATE_RECORD)" />
            <map value="39" message="$(string.Maps.Descriptions.AT_FIX_UPDATE_LICENSE_RECORD)" />
            <map value="40" message="$(string.Maps.Descriptions.AT_UPDATE_SD_MOVE_DB_RECORDS)" />
            <map value="41" message="$(string.Maps.Descriptions.AT_ADD_LICENSE)" />
            <map value="42" message="$(string.Maps.Descriptions.AT_DELETE_LICENSE)" />
            <map value="43" message="$(string.Maps.Descriptions.AT_FORCE_DELETE_LICENSE)" />
            <map value="44" message="$(string.Maps.Descriptions.AT_UPDATE_LICENSE)" />
            <map value="45" message="$(string.Maps.Descriptions.AT_INSTALL_UPDATED_LICENSE)" />
            <map value="46" message="$(string.Maps.Descriptions.AT_VERIFY_ENTERPRISE_ID)" />
            <map value="47" message="$(string.Maps.Descriptions.AT_CODEINTEGRITY)" />
            <map value="48" message="$(string.Maps.Descriptions.AT_TERMINATE_UNINSTALL_APP)" />
            <map value="49" message="$(string.Maps.Descriptions.AT_TERMINATE_UPDATE_APP)" />
            <map value="50" message="$(string.Maps.Descriptions.AT_TERMINATE_SD_MOVE_APP)" />
            <map value="51" message="$(string.Maps.Descriptions.AT_DECRYPT_EXAP)" />
            <map value="52" message="$(string.Maps.Descriptions.AT_SQLCE_DB_REINDEX)" />
            <map value="53" message="$(string.Maps.Descriptions.AT_FINISH_INSTALLER_WORKER)" />
            <map value="54" message="$(string.Maps.Descriptions.AT_REGISTRY_PROVISIONING)" />
            <map value="55" message="$(string.Maps.Descriptions.AT_REGISTRY_DEPROVISIONING)" />
            <map value="56" message="$(string.Maps.Descriptions.AT_UPDATE_REGISTRY_PROVISIONING)" />
            <map value="57" message="$(string.Maps.Descriptions.AT_XBF_GENERATOR)" />
            <map value="58" message="$(string.Maps.Descriptions.AT_WNS_REGISTRATION)" />
            <map value="59" message="$(string.Maps.Descriptions.AT_WNS_DEREGISTRATION)" />
            <map value="60" message="$(string.Maps.Descriptions.AT_BEGIN_BACKUP_RESTORE)" />
            <map value="61" message="$(string.Maps.Descriptions.AT_FINISH_BACKUP_RESTORE)" />
            <map value="62" message="$(string.Maps.Descriptions.AT_BEGIN_LIGHTUP_INSTALL)" />
            <map value="63" message="$(string.Maps.Descriptions.AT_CHECK_LIGHTUP_MANIFEST)" />
            <map value="64" message="$(string.Maps.Descriptions.AT_PROCESS_LIGHTUP)" />
            <map value="65" message="$(string.Maps.Descriptions.AT_STAGE_DATA)" />
            <map value="66" message="$(string.Maps.Descriptions.AT_REGISTER_MODERN)" />
            <map value="67" message="$(string.Maps.Descriptions.AT_BEGIN_LIGHTUP_UPDATE)" />
            <map value="68" message="$(string.Maps.Descriptions.AT_UNREGISTER_LIGHTUP)" />
            <map value="69" message="$(string.Maps.Descriptions.AT_POLICY_CHECK)" />
            <map value="70" message="$(string.Maps.Descriptions.AT_PARSE_CACHE_TOKEN)" />
            <map value="71" message="$(string.Maps.Descriptions.AT_BEGIN_SD_LIGHTUP_MOVE)" />
            <map value="72" message="$(string.Maps.Descriptions.AT_SD_LIGHTUP_MOVE_STAGE)" />
            <map value="73" message="$(string.Maps.Descriptions.AT_SD_LIGHTUP_MOVE_PROCESS_RESOURCE_PATH)" />
            <map value="74" message="$(string.Maps.Descriptions.AT_SD_LIGHTUP_MOVE_UPDATE_DB)" />
            <map value="75" message="$(string.Maps.Descriptions.AT_SD_LIGHTUP_MOVE_MOVE_PACKAGE)" />
            <map value="76" message="$(string.Maps.Descriptions.AT_UNDEFINED)" />
          </valueMap>
          <valueMap name="MDIL">
            <map value="0" message="$(string.Maps.Descriptions.MDILSTART)" />
            <map value="1" message="$(string.Maps.Descriptions.MDILSTOP)" />
          </valueMap>
          <valueMap name="INSTALL_TYPE">
            <map value="0" message="$(string.Maps.Descriptions.APPLICATION_INSTALL_NORMAL)" />
            <map value="1" message="$(string.Maps.Descriptions.APPLICATION_INSTALL_IN_ROM)" />
            <map value="2" message="$(string.Maps.Descriptions.APPLICATION_INSTALL_PA)" />
            <map value="3" message="$(string.Maps.Descriptions.APPLICATION_INSTALL_DEBUG)" />
            <map value="4" message="$(string.Maps.Descriptions.APPLICATION_INSTALL_ENTERPRISE)" />
            <map value="5" message="$(string.Maps.Descriptions.APPLICATION_INSTALL_INVALID)" />
          </valueMap>
          <valueMap name="LIFECYCLE_NOTIFICATION">
              <map value="0" message="$(string.Maps.Descriptions.APP_INSTALL_STARTED)" />
              <map value="1" message="$(string.Maps.Descriptions.APP_INSTALL_FINISHED)" />
              <map value="2" message="$(string.Maps.Descriptions.APP_UPDATE_STARTED)" />
              <map value="3" message="$(string.Maps.Descriptions.APP_UPDATE_FINISHED)" />
              <map value="4" message="$(string.Maps.Descriptions.APP_UNINSTALL_STARTED)" />
              <map value="5" message="$(string.Maps.Descriptions.APP_UNINSTALL_FINISHED)" />
              <map value="6" message="$(string.Maps.Descriptions.APP_UPDATELICENSE_STARTED)" />
              <map value="7" message="$(string.Maps.Descriptions.APP_UPDATELICENSE_FINISHED)" />
              <map value="8" message="$(string.Maps.Descriptions.APP_DOWNLOAD_STARTED)" />
              <map value="9" message="$(string.Maps.Descriptions.APP_DOWNLOAD_INPROGRESS)" />
              <map value="10" message="$(string.Maps.Descriptions.APP_DOWNLOAD_FINISHED)" />
              <map value="11" message="$(string.Maps.Descriptions.APP_INSTALL_INPROGRESS)" />
              <map value="12" message="$(string.Maps.Descriptions.APP_UPDATE_INPROGRESS)" />
              <map value="13" message="$(string.Maps.Descriptions.APP_REVOKELICENSE_STARTED)" />
              <map value="14" message="$(string.Maps.Descriptions.APP_REVOKELICENSE_FINISHED)" />
              <map value="15" message="$(string.Maps.Descriptions.APP_FRAMEWORK_INSTALL_STARTED)" />
              <map value="16" message="$(string.Maps.Descriptions.APP_FRAMEWORK_INSTALL_FINISHED)" />
              <map value="17" message="$(string.Maps.Descriptions.APP_DISABLED_SD_CARD)" />
              <map value="18" message="$(string.Maps.Descriptions.APP_DISABLED_ENTERPRISE)" />
              <map value="19" message="$(string.Maps.Descriptions.APP_ENABLED)" />
              <map value="20" message="$(string.Maps.Descriptions.APP_MOVE_STARTED)" />
              <map value="21" message="$(string.Maps.Descriptions.APP_MOVE_INPROGRESS)" />
              <map value="22" message="$(string.Maps.Descriptions.APP_MOVE_FINISHED)" />
              <map value="23" message="$(string.Maps.Descriptions.APP_RESTORE_STARTED)" />
              <map value="24" message="$(string.Maps.Descriptions.APP_RESTORE_FINISHED)" />
              <map value="25" message="$(string.Maps.Descriptions.APP_DISABLED_BACKING_UP)" />
              <map value="26" message="$(string.Maps.Descriptions.APP_DOWNLOAD_STATUS_UPDATE)" />
              <map value="27" message="$(string.Maps.Descriptions.APP_DISABLED_MDIL_BINDING)" />
          </valueMap>
          <valueMap name="TILE_NOTIFICATION">
            <map value="0" message="$(string.Maps.Descriptions.TILE_CREATED)" />
            <map value="1" message="$(string.Maps.Descriptions.TILE_DELETED)" />
            <map value="2" message="$(string.Maps.Descriptions.TILE_UPDATED)" />
            <map value="3" message="$(string.Maps.Descriptions.TILE_APPVISIBLE)" />
            <map value="4" message="$(string.Maps.Descriptions.TILE_APPINVISIBLE)" />
            <map value="5" message="$(string.Maps.Descriptions.TILE_PINNED)" />
            <map value="6" message="$(string.Maps.Descriptions.TILE_UNPINNED)" />
            <map value="7" message="$(string.Maps.Descriptions.TILE_MAX)" />
            <map value="8" message="$(string.Maps.Descriptions.TILE_INVALID)" />
          </valueMap>
          <valueMap name="INSTALLTYPE">
            <map value="0" message="$(string.Maps.INSTALLTYPE.INSTALLTYPE_INVALID)" />
            <map value="1" message="$(string.Maps.INSTALLTYPE.INSTALLTYPE_APPX_PACKAGE)" />
            <map value="2" message="$(string.Maps.INSTALLTYPE.INSTALLTYPE_FRAMEWORK_PACKAGE)" />
            <map value="3" message="$(string.Maps.INSTALLTYPE.INSTALLTYPE_XAP_PACKAGE)" />
            <map value="4" message="$(string.Maps.INSTALLTYPE.INSTALLTYPE_APPX_INFUSED)" />
            <map value="5" message="$(string.Maps.INSTALLTYPE.INSTALLTYPE_FRAMEWORK_INFUSED)" />
            <map value="6" message="$(string.Maps.INSTALLTYPE.INSTALLTYPE_XAP_INFUSED)" />
          </valueMap>
          <valueMap name="PM_NOTIFICATION_TYPE">
            <map value="1" message="$(string.Maps.PM_NOTIFICATION_TYPE.PNT_LIFECYCLE_NOTIFICATION)" />
            <map value="2" message="$(string.Maps.PM_NOTIFICATION_TYPE.PNT_TILE_NOTIFICATION)" />
            <map value="4" message="$(string.Maps.PM_NOTIFICATION_TYPE.PNT_BNS_NOTIFICATION)" />
            <map value="5" message="$(string.Maps.PM_NOTIFICATION_TYPE.PNT_INVALID)" />
          </valueMap>
          <valueMap name="BatterySenseState">
            <map value="0" message="$(string.Maps.BatterySense.ExecutionState.UnInitialized)" />
            <map value="1" message="$(string.Maps.BatterySense.ExecutionState.Enabled)" />
            <map value="2" message="$(string.Maps.BatterySense.ExecutionState.Disabled)" />
            <map value="3" message="$(string.Maps.BatterySense.ExecutionState.AlwaysEnabled)" />
            <map value="4" message="$(string.Maps.BatterySense.ExecutionState.Max)" />
          </valueMap>
          <valueMap name="BatterySenseExecutionType">
            <map value="0" message="$(string.Maps.BatterySense.ExecutionType.None)" />
            <map value="1" message="$(string.Maps.BatterySense.ExecutionType.Background_Full)" />
            <map value="2" message="$(string.Maps.BatterySense.ExecutionType.Background_Limited)" />
          </valueMap>
          <valueMap name="AcquireRelease">
            <map value="0" message="$(string.Maps.AcquireRelease.Release)" />
            <map value="1" message="$(string.Maps.AcquireRelease.Acquire)" />
          </valueMap>
          <valueMap name="PsmAppState">
            <map value="0" message="$(string.Maps.PsmAppState.Active)" />
            <map value="1" message="$(string.Maps.PsmAppState.Brokered)" />
            <map value="2" message="$(string.Maps.PsmAppState.Sandboxed)" />
            <map value="3" message="$(string.Maps.PsmAppState.Quiescing)" />
            <map value="4" message="$(string.Maps.PsmAppState.Halted)" />
            <map value="5" message="$(string.Maps.PsmAppState.TerminatePending)" />
            <map value="6" message="$(string.Maps.PsmAppState.Terminated)" />
            <map value="7" message="$(string.Maps.PsmAppState.HaltPending)" />
            <map value="8" message="$(string.Maps.PsmAppState.Deleted)" />
            <map value="9" message="$(string.Maps.PsmAppState.Initialized)" />
            <map value="10" message="$(string.Maps.PsmAppState.OutSwapped)" />
            <map value="11" message="$(string.Maps.PsmAppState.Invalid)" />
          </valueMap>
          <valueMap name="PsmHostState">
            <map value="0" message="$(string.Maps.PsmHostState.Empty)" />
            <map value="1" message="$(string.Maps.PsmHostState.AcquireGroupScheduling)" />
            <map value="2" message="$(string.Maps.PsmHostState.ReleaseGroupScheduling)" />
            <map value="3" message="$(string.Maps.PsmHostState.QuotaPolicySuspend)" />
            <map value="4" message="$(string.Maps.PsmHostState.QuotaPolicyResume)" />
            <map value="5" message="$(string.Maps.PsmHostState.Invalid)" />
          </valueMap>
          <valueMap name="PlmVisibilityState">
              <map
                  message="$(string.Maps.PLM.VisibilityState.Unknown)"
                  value="0"
              />
              <map
                  message="$(string.Maps.PLM.VisibilityState.Unknown)"
                  value="1"
              />
              <map
                  message="$(string.Maps.PLM.VisibilityState.Foreground)"
                  value="2"
              />
              <map
                  message="$(string.Maps.PLM.VisibilityState.Background)"
                  value="3"
              />
          </valueMap>
        </maps>
        <!-- Templates -->
        <templates>
          <template tid="Template_Boolean">
            <data name="p1_Boolean" inType="win:Boolean" outType="xs:boolean" />
          </template>
          <template tid="Template_Boolean_UInt32">
            <data name="p1_Boolean" inType="win:Boolean" outType="xs:boolean" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_Boolean_GUID_UInt32">
            <data name="p1_Boolean" inType="win:Boolean" outType="xs:boolean" />
            <data name="p2_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_Boolean_GUID">
            <data name="p1_Boolean" inType="win:Boolean" outType="xs:boolean" />
            <data name="p2_GUID" inType="win:GUID" outType="xs:GUID" />
          </template>
          <template tid="Template_Boolean_UInt32_UInt32">
            <data name="p1_Boolean" inType="win:Boolean" outType="xs:boolean" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_Empty"></template>
          <template tid="Template_GUID">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
          </template>
          <template tid="Template_GUID_UInt32">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_GUID_PID_UInt32">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_GUID_UInt32_UInt32">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_GUID_UInt32_Dec_UInt32">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" />
          </template>
          <template tid="Template_GUID_UInt32_UInt32_UInt32">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_GUID_String_PID">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template_GUID_PID">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template_PID">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template_PID_GUID">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2_GUID" inType="win:GUID" outType="xs:GUID" />
          </template>
          <template tid="Template_PID_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_PID_String_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_PID_UInt32_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_PID_UInt32_UInt32_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_PID_UInt32_Boolean_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_Boolean" inType="win:Boolean" outType="xs:boolean" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_Hex_UInt32_Dec_UInt32_Hex_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_Dec_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template_Dec_UInt32_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template_Dec_UInt32_UInt32_Hex_UInt32_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_Dec_UInt32_Hex_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_Dec_UInt32_Hex_UInt32_UInt32_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_String_Dec_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template_String_String_Dec_UInt32_UInt32_UInt32_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p4_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p5_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p6_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template_String_Dec_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template_String_Boolean_Dec_UInt32_Hex_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_Boolean" inType="win:Boolean" outType="xs:boolean" />
            <data name="p3_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_Dec_UInt32_Hex_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_Dec_UInt32_Hex_UInt32_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_String_String_Dec_UInt32_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_String" inType="win:UnicodeString" />
            <data name="p4_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p5_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UInt64">
            <data name="p1_UInt32" inType="win:UInt64" />
          </template>
          <template tid="Template_UInt32_GUID_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UInt32_PID_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UInt32_PID_Boolean_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p3_Boolean" inType="win:Boolean" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UInt32_Boolean">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_Boolean" inType="win:Boolean" />
          </template>
          <template tid="Template_UInt32_Boolean_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_Boolean" inType="win:Boolean" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UInt32_String">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_String" inType="win:UnicodeString" />
          </template>
          <template tid="Template_UInt32_String_String">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_String" inType="win:UnicodeString" />
          </template>
          <template tid="Template_UInt32_String_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UInt32_String_Dec_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_UInt32" inType="win:UInt32" />
          </template>
          <template tid="Template_UInt32_String_Boolean">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_Boolean" inType="win:Boolean" />
          </template>
          <template tid="Template_UInt32_String_UInt32_Dec_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" />
          </template>
          <template tid="Template_UInt32_String_String_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_String" inType="win:UnicodeString" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UInt32_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UInt32_UInt32_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UInt32_UInt32_UInt32_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UInt32_Boolean_UInt32_Boolean">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_Boolean" inType="win:Boolean" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_Boolean" inType="win:Boolean" />
          </template>
          <template tid="Template_UInt32_String_Boolean_Boolean_UInt32">
            <data name="p1_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_Boolean" inType="win:Boolean" />
            <data name="p4_Boolean" inType="win:Boolean" />
            <data name="p5_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String">
            <data name="p1_String" inType="win:UnicodeString" />
          </template>
          <template tid="Template_String_String">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_String" inType="win:UnicodeString" />
          </template>
          <template tid="Template_String_String_Boolean">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_Boolean" inType="win:Boolean" />
          </template>
          <template tid="Template_String_String_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_GUID_UInt32_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_String_UInt32_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_UInt32_Boolean">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_Boolean" inType="win:Boolean" />
          </template>
          <template tid="Template_String_UInt32_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_Boolean_Boolean_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_Boolean" inType="win:Boolean" />
            <data name="p3_Boolean" inType="win:Boolean" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_String_String">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_String" inType="win:UnicodeString" />
          </template>
          <template tid="Template_String_String_String_String">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_String" inType="win:UnicodeString" />
            <data name="p4_String" inType="win:UnicodeString" />
          </template>
          <template tid="Template_AnsiString_UInt32_UInt32">
            <data name="p1_AnsiString" inType="win:AnsiString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_AnsiString_Base10UInt32_UInt32">
            <data name="p1_AnsiString" inType="win:AnsiString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_UInt32_PID_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_String_UInt32_UInt32_UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_GUID_SytemTime">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_Time" inType="win:SYSTEMTIME" />
          </template>
          <template tid="Template_GUID_SytemTime_SytemTime">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_Time" inType="win:SYSTEMTIME" />
            <data name="p3_Time" inType="win:SYSTEMTIME" />
          </template>
          <template tid="Template_TraceURI_HRESULT">
            <data inType="win:UnicodeString" name="URI" />
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_GUID_ORCHESTRATOR_STATEMACHINE_ORCHESTRATOR_ExecutionMode_ORCHESTRATOR_ACTIVITY_TYPE_HRESULT">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_UInt32" inType="win:UInt32" map="ORCHESTRATOR_STATEMACHINE" />
            <data name="p3_UInt32" inType="win:UInt32" map="ORCHESTRATOR_ExecutionMode" />
            <data name="p4_UInt32" inType="win:UInt32" map="ORCHESTRATOR_ACTIVITY_TYPE" />
            <data name="p5_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <!-- BSS templates -->
          <template tid="BssTemplate_BssNotificationDescription">
            <data name="productId" inType="win:GUID" outType="xs:GUID" />
            <data name="notificationID" inType="win:GUID" outType="xs:GUID" />
            <data name="name" inType="win:UnicodeString" />
            <data name="type" inType="win:UInt32" map="BssNotificationType" />
            <data name="state" inType="win:UInt32" map="BssNotificationState" />
            <data name="description" inType="win:UInt32" map="BssNotificationDescription" />
          </template>
          <template tid="BssTemplate_BssNotificationDescription_AgentId">
            <data name="productId" inType="win:GUID" outType="xs:GUID" />
            <data name="notificationID" inType="win:GUID" outType="xs:GUID" />
            <data name="name" inType="win:UnicodeString" />
            <data name="type" inType="win:UInt32" map="BssNotificationType" />
            <data name="state" inType="win:UInt32" map="BssNotificationState" />
            <data name="description" inType="win:UInt32" map="BssNotificationDescription" />
            <data name="agentId" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="BssTemplate_BssNotificationDescription_AgentId_HR">
            <data name="productId" inType="win:GUID" outType="xs:GUID" />
            <data name="notificationID" inType="win:GUID" outType="xs:GUID" />
            <data name="name" inType="win:UnicodeString" />
            <data name="type" inType="win:UInt32" map="BssNotificationType" />
            <data name="state" inType="win:UInt32" map="BssNotificationState" />
            <data name="description" inType="win:UInt32" map="BssNotificationDescription" />
            <data name="agentId" inType="win:UInt32" outType="win:HexInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="BssTemplate_EventHandlerThreadProc">
            <data name="state" inType="win:UInt32" map="BssEventHandlerType" />
            <data name="exitCheckAllThread" inType="win:Boolean" outType="xs:boolean" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_GUID_HRESULT_String">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_String" inType="win:UnicodeString" />
          </template>
          <template tid="Template_GUID_HRESULT">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_LIFECYCLE_NOTIFICATION_GUID_UInt32_HRESULT_BOOL">
            <data name="p1_UInt32" inType="win:UInt32" map="LIFECYCLE_NOTIFICATION" />
            <data name="p2_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:unsignedInt" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p5_Boolean" inType="win:Boolean" outType="xs:boolean" />
          </template>
          <template tid="Template_MDIL_GUID_String">
            <data name="p1_UInt32" inType="win:UInt32" map="MDIL" />
            <data name="p2_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p3_String" inType="win:UnicodeString" />
          </template>
          <template tid="Template_GUID_String_INSTALL_TYPE">
            <data name="p1_GUID" inType="win:GUID" outType="xs:GUID" />
            <data name="p2_String" inType="win:UnicodeString" />
            <data name="p3_UInt32" inType="win:UInt32" map="INSTALL_TYPE" />
          </template>
          <template tid="Template_TILE_NOTIFICATION_GUID">
            <data name="p1_UInt32" inType="win:UInt32" map="TILE_NOTIFICATION" />
            <data name="p2_GUID" inType="win:GUID" outType="xs:GUID" />
          </template>
          <template tid="Template_FILE_Line_HRESULT_HRESULT_GUID">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p5_GUID" inType="win:GUID" outType="xs:GUID" />
          </template>
          <!-- SQM AppUsage -->
          <template tid="Template_FILE_Line_HRESULT__UInt32">
            <data name="p1_String" inType="win:UnicodeString" />
            <data name="p2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template__p0_UInt32_map_ORCHESTRATOR_ACTIVITY_TYPE">
            <data name="p0" inType="win:UInt32" map="ORCHESTRATOR_ACTIVITY_TYPE" />
          </template>
          <template tid="Template__p0_Boolean_Default__p1_UInt32_map_ORCHESTRATOR_ACTIVITY_TYPE">
            <data name="p0" inType="win:Boolean" />
            <data name="p1" inType="win:UInt32" map="ORCHESTRATOR_ACTIVITY_TYPE" />
          </template>
          <template tid="Template__p0_UInt32_HexInt32">
            <data name="p0" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32">
            <data name="p0" inType="win:UnicodeString" />
            <data name="p1" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_UnicodeString_Default__p1_Boolean_Default">
            <data name="p0" inType="win:UnicodeString" />
            <data name="p1" inType="win:Boolean" />
          </template>
          <template tid="Template__p0_GUID_Default">
            <data name="p0" inType="win:GUID" />
          </template>
          <template tid="Template__p0_UnicodeString_Default">
            <data name="p0" inType="win:UnicodeString" />
          </template>
          <template tid="Template__p0_UInt32_map_INSTALLTYPE">
            <data name="p0" inType="win:UInt32" map="INSTALLTYPE" />
          </template>
          <template tid="Template" />
          <template tid="Template__p0_UInt32_map_PM_NOTIFICATION_TYPE__p1_GUID_Default__p2_UInt32_unsignedInt">
            <data name="p0" inType="win:UInt32" map="PM_NOTIFICATION_TYPE" />
            <data name="p1" inType="win:GUID" />
            <data name="p2" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template_GlobalMemory">
            <data inType="win:UInt64" name="CommitTotal" />
            <data inType="win:UInt64" name="CommitLimit" />
            <data inType="win:UInt64" name="CommitPeak" />
            <data inType="win:UInt64" name="PhysicalTotal" />
            <data inType="win:UInt64" name="PhysicalAvailable" />
            <data inType="win:UInt64" name="SystemCache" />
            <data inType="win:UInt64" name="KernelTotal" />
            <data inType="win:UInt64" name="KernelPaged" />
            <data inType="win:UInt64" name="KernelNonpaged" />
            <data inType="win:UInt64" name="PageSize" />
            <data inType="win:UInt64" name="HandleCount" />
            <data inType="win:UInt64" name="ProcessCount" />
            <data inType="win:UInt64" name="ThreadCount" />
          </template>
          <template tid="Template_ProcessMemory">
            <data inType="win:UInt32" name="ProcessId" />
            <data inType="win:UnicodeString" name="ProcessName" />
            <data inType="win:GUID" name="ProductID" />
            <data inType="win:Boolean" name="IsForeground" />
            <data inType="win:UInt64" name="PageFaultCount" />
            <data inType="win:UInt64" name="WorkingSetSize" />
            <data inType="win:UInt64" name="PeakWorkingSetSize" />
            <data inType="win:UInt64" name="QuotaPeakPagedPoolUsage" />
            <data inType="win:UInt64" name="QuotaPagedPoolUsage" />
            <data inType="win:UInt64" name="QuotaPeakNonPagedPoolUsage" />
            <data inType="win:UInt64" name="QuotaNonPagedPoolUsage" />
            <data inType="win:UInt64" name="PagefileUsage" />
            <data inType="win:UInt64" name="PeakPagefileUsage" />
          </template>
          <template tid="Template__p0_UInt32_unsignedInt__p1_UInt32_unsignedInt">
            <data name="p0" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p1" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template__p0_UInt32_unsignedInt">
            <data name="p0" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template__p0_UInt32_HexInt32__p1_UInt32_HexInt32">
            <data name="p0" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p1" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_UInt32_HexInt32">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_Int32__p1_AnsiString__p2_Uint32">
            <data name="p0" inType="win:Int32" outType="win:HResult" />
            <data name="p1" inType="win:AnsiString" />
            <data name="p2" inType="win:UInt32" />
          </template>
          <template tid="Template_pointer">
            <data name="p0" inType="win:Pointer" outType="win:HexInt64" />
          </template>
          <template tid="Template_String_Boolean">
            <data name="p0" inType="win:UnicodeString" outType="xs:string" />
            <data name="p1" inType="win:Boolean" outType="xs:boolean" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_UInt32_unsignedInt">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template__p0_UnicodeString_Default__p1_UnicodeString_Default">
            <data name="p0" inType="win:UnicodeString" />
            <data name="p1" inType="win:UnicodeString" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_UInt32_unsignedInt__p2_UInt32_HexInt32">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_GUID_Default__p2_UInt32_HexInt32__p3_UInt32_HexInt32">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:GUID" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_FormattedMessage">
            <data name="Message" inType="win:Pointer" />
          </template>
          <template tid="Template_GUID_BSState_BSState">
            <data name="ProductId" inType="win:GUID" />
            <data name="OldState" inType="win:UInt32" map="BatterySenseState" />
            <data name="NewState" inType="win:UInt32" map="BatterySenseState" />
          </template>
          <template tid="Template_GUID_BSState_UInt32">
            <data name="ProductId" inType="win:GUID" />
            <data name="State" inType="win:UInt32" map="BatterySenseState" />
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_GUID_BSType_UInt32">
            <data name="ProductId" inType="win:GUID" />
            <data name="Type" inType="win:UInt32" map="BatterySenseExecutionType" />
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_GUID_BSState_String_UInt32">
            <data name="ProductId" inType="win:GUID" />
            <data name="State" inType="win:UInt32" map="BatterySenseState" />
            <data name="Package" inType="win:UnicodeString" />
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_GUID_BSType_BSState_UInt32">
            <data name="ProductId" inType="win:GUID" />
            <data name="Type" inType="win:UInt32" map="BatterySenseExecutionType" />
            <data name="State" inType="win:UInt32" map="BatterySenseState" />
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32__p2_UInt32_HexInt32">
            <data name="p0" inType="win:UnicodeString" />
            <data name="p1" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_WorkItemId_TaskInstanceId">
            <data name="WorkItemId" inType="win:GUID" outType="xs:GUID" />
            <data name="TaskInstanceId" inType="win:GUID" outType="xs:GUID" />
          </template>
          <template tid="Template_WorkItemId">
            <data name="WorkItemId" inType="win:GUID" outType="xs:GUID" />
          </template>
          <template tid="Template_WorkItemId_Status">
            <data name="WorkItemId" inType="win:GUID" outType="xs:GUID" />
            <data name="Status" inType="win:Int32" outType="win:HResult" />
          </template>

          <!--BackgroundTransfer Policy-->
          <template tid="Template_BT_LoadedRegistry">
            <data name="p1_Boolean" inType="win:Boolean" />
            <data name="p2_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3_UInt32" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p4_UInt32" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_BT_CheckEvaluationConditions">
            <data name="p1_Boolean" inType="win:Boolean" />
            <data name="p2_Boolean" inType="win:Boolean" />
            <data name="p3_Boolean" inType="win:Boolean" />
            <data name="p4_Boolean" inType="win:Boolean" />
            <data name="p5_Boolean" inType="win:Boolean" />
            <data name="p6_Boolean" inType="win:Boolean" />
            <data name="p7_Boolean" inType="win:Boolean" />
          </template>
          <template tid="Template_BT_NetworkConditions">
            <data name="p1_Boolean" inType="win:Boolean" />
            <data name="p2_Boolean" inType="win:Boolean" />
            <data name="p3_Boolean" inType="win:Boolean" />
          </template>
          <template tid="Template__p1_UnicodeString_Default__p2_HexInt32_Default">
            <data name="p1" inType="win:UnicodeString" />
            <data name="p2" inType="win:HexInt32" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_UInt32_map_ORCHESTRATOR_ACTIVITY_TYPE__p2_UInt32_HexInt32">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UInt32" map="ORCHESTRATOR_ACTIVITY_TYPE" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__GUID_String_String_HR">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UnicodeString" outType="xs:string" />
            <data name="p2" inType="win:UnicodeString" outType="xs:string" />
            <data name="p3" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="Template__GUID_String_HR">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UnicodeString" outType="xs:string" />
            <data name="p2" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="Template__Boolean_Int_HR">
            <data name="p0" inType="win:Boolean" outType="xs:boolean" />
            <data name="p1" inType="win:Int32" />
            <data name="p2" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="Template__GUID_String_Int">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UnicodeString" outType="xs:string" />
            <data name="p2" inType="win:Int32" />
          </template>
          <template tid="Template__GUID_String">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UnicodeString" outType="xs:string" />
          </template>
          <template tid="Template__GUID_String_HexInt_Int">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UnicodeString" outType="xs:string" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p3" inType="win:Int32" />
          </template>
          <template tid="Template__GUID_String_HexInt">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UnicodeString" outType="xs:string" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UnicodeString_Hresult">
            <data name="String" inType="win:UnicodeString" />
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template_UnicodeString">
            <data name="String" inType="win:UnicodeString" />
          </template>
          <template tid="Template__UInt32_String_GUID_String_Hr">
            <data name="p0" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p1" inType="win:UnicodeString" outType="xs:string" />
            <data name="p2" inType="win:GUID" />
            <data name="p3" inType="win:UnicodeString" outType="xs:string" />
            <data name="p4" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__String_String_Int">
            <data name="p0" inType="win:UnicodeString" outType="xs:string" />
            <data name="p1" inType="win:UnicodeString" outType="xs:string" />
            <data name="p2" inType="win:Int32" />
          </template>
          <template tid="Template__p0_UInt64_unsignedLong__p1_UInt32_unsignedInt__p2_UInt32_HexInt32">
            <data name="p0" inType="win:UInt64" outType="xs:unsignedLong" />
            <data name="p1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_UnicodeString_Default__p1_UInt32_unsignedInt__p2_UInt32_HexInt32">
            <data name="p0" inType="win:UnicodeString" />
            <data name="p1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_Boolean_Default__p1_Boolean_Default">
            <data name="p0" inType="win:Boolean" />
            <data name="p1" inType="win:Boolean" />
          </template>
          <template tid="Template__p0_Boolean_Default__p1_Boolean_Default__p2_UInt32_HexInt32">
            <data name="p0" inType="win:Boolean" />
            <data name="p1" inType="win:Boolean" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="RETemplate_SetApplicationProperties">
            <data name="Status" inType="win:UInt32" outType="win:HexInt32" />
            <data name="PsmKey" inType="win:UnicodeString" />
            <data name="HostJobType" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="CpuRate" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="HardMemoryLimit" inType="win:UInt64" outType="xs:unsignedLong" />
            <data name="NotifyMemoryLowLimit" inType="win:UInt64" outType="xs:unsignedLong" />
            <data name="NotifyMemoryHighLimit" inType="win:UInt64" outType="xs:unsignedLong" />
            <data name="Priority" inType="win:UInt8" outType="xs:unsignedByte" />
            <data name="IsCpuSet" inType="win:Boolean" />
            <data name="IsHardMemorySet" inType="win:Boolean" />
            <data name="IsMemoryLowSet" inType="win:Boolean" />
            <data name="IsMemoryHighSet" inType="win:Boolean" />
            <data name="IsPrioritySet" inType="win:Boolean" />
          </template>
          <template tid="RETemplate_QueryApplicationProperties">
            <data name="Status" inType="win:UInt32" outType="win:HexInt32" />
            <data name="PsmKey" inType="win:UnicodeString" />
            <data name="HostJobType" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="CpuRate" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="HardMemoryLimit" inType="win:UInt64" outType="xs:unsignedLong" />
            <data name="NotifyMemoryLowLimit" inType="win:UInt64" outType="xs:unsignedLong" />
            <data name="NotifyMemoryHighLimit" inType="win:UInt64" outType="xs:unsignedLong" />
            <data name="Priority" inType="win:UInt8" outType="xs:unsignedByte" />
          </template>
          <template tid="RETemplate_QueryApplicationPropertiesFail">
            <data name="Status" inType="win:UInt32" outType="win:HexInt32" />
            <data name="PsmKey" inType="win:UnicodeString" />
            <data name="HostJobType" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="CpuRate" inType="win:Pointer" />
            <data name="HardMemoryLimit" inType="win:Pointer" />
            <data name="NotifyMemoryLowLimit" inType="win:Pointer" />
            <data name="NotifyMemoryHighLimit" inType="win:Pointer" />
            <data name="Priority" inType="win:Pointer" />
          </template>
          <template tid="RETemplate_QueryMemoryUsage">
            <data name="Status" inType="win:UInt32" outType="win:HexInt32" />
            <data name="PsmKey" inType="win:UnicodeString" />
            <data name="HostJobType" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="MemoryUsage" inType="win:Pointer" />
          </template>
          <template tid="RETemplate_HandleGroupOwnershipNotification">
            <data name="Status" inType="win:UInt32" outType="win:HexInt32" />
            <data name="PsmKey" inType="win:UnicodeString" />
            <data name="HostJobType" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="AcquireRelease" inType="win:UInt8" map="AcquireRelease" />
            <data name="UpdateRate" inType="win:Boolean" />
          </template>
          <template tid="RETemplate_HandleHostEmptyNotification">
            <data name="PsmKey" inType="win:UnicodeString" />
            <data name="HostJobType" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="RETemplate_PsmApplicationStateNotification">
            <data name="PSid" inType="win:Pointer" />
            <data name="Session" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="PsmKey" inType="win:UnicodeString" />
            <data name="State"  inType="win:UInt8" map="PsmAppState" />
          </template>
          <template tid="RETemplate_PsmHostStateNotification">
            <data name="PSid" inType="win:Pointer" />
            <data name="Session" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="PsmKey" inType="win:UnicodeString" />
            <data name="HostJobType" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="State"  inType="win:UInt8" map="PsmHostState" />
          </template>






          <template tid="Template__p0_UnicodeString_Default__p1_UInt32_unsignedInt">
            <data name="p0" inType="win:UnicodeString" />
            <data name="p1" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template__p0_UnicodeString_Default__p1_UInt32_unsignedInt__p2_UInt32_unsignedInt">
            <data name="p0" inType="win:UnicodeString" />
            <data name="p1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template__p0_UnicodeString_Default__p1_Boolean_Default__p2_UInt32_unsignedInt">
            <data name="p0" inType="win:UnicodeString" />
            <data name="p1" inType="win:Boolean" />
            <data name="p2" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
        </templates>
        <events>
          <!-- Developer string tracing 0 - 5 -->
          <event keywords="DevPlatCircular" task="LogTrace" template="Template_String" opcode="win:Info" value="0" level="win:Verbose" symbol="Generic_Trace_Verbose" message="$(string.Format.Verbose)" />
          <event keywords="DevPlatCircular" task="LogTrace" template="Template_String" opcode="win:Info" value="1" level="win:Informational" symbol="Generic_Trace_Info" message="$(string.Format.Info)" />
          <event keywords="DevPlatCircular" task="LogTrace" template="Template_String" opcode="win:Info" value="2" level="win:Warning" symbol="Generic_Trace_Warning" message="$(string.Format.Warning)" />
          <event keywords="DevPlatCircular" task="LogTrace" template="Template_String" opcode="win:Info" value="3" level="win:Error" symbol="Generic_Trace_Error" message="$(string.Format.Error)" />
          <!-- Production tracing 200 and up -->
          <!-- FailFast -->
          <event value="200" level="win:Critical" opcode="win:Info" symbol="UtilityFailFast" message="$(string.Format.FailFast)" task="LogTrace" keywords="ProductionCritical" template="Template_String" />
          <!-- Component:AppResolverUI:400 -->
          <event value="400" opcode="win:Info" level="win:Error" symbol="AppResolverUI_RetrieveCandidates_Error" message="$(string.Format.AppResolver_RetrieveCandidates_Message)" task="LogTrace" keywords="ProductionCircular" template="Template_TraceURI_HRESULT" />
          <event value="401" opcode="win:Info" level="win:Error" symbol="AppResolverUI_InitializeFromResolverCandidate_Error" message="$(string.Format.AppResolver_InitializeFromResolverCandidate_Message)" task="LogTrace" keywords="ProductionCircular" template="Template_TraceURI_HRESULT" />
          <!-- Component:PacMan:700 -->
          <event value="700" opcode="win:Info" level="win:Informational" symbol="PM_ActivityExecution" message="$(string.Format.PM.ActivityExecution)" task="LogTrace" keywords="SelfHostCritical PacMan" template="Template_GUID_ORCHESTRATOR_STATEMACHINE_ORCHESTRATOR_ExecutionMode_ORCHESTRATOR_ACTIVITY_TYPE_HRESULT" />
          <event value="701" opcode="win:Info" level="win:Error" symbol="PM_MDILMaintenanceError" message="$(string.Format.PM.MDILMaintenanceError)" task="LogTrace" keywords="ProductionCircular SelfHostCritical PacMan" template="Template_GUID_HRESULT_String" />
          <event value="702" opcode="win:Info" level="win:Error" symbol="PM_MDILMaintenanceErrorVerbose" message="$(string.Format.PM.MDILMaintenanceError)" task="LogTrace" keywords="SelfHostCritical PacMan" template="Template_GUID_HRESULT_String" />
          <event value="703" opcode="win:Info" level="win:Verbose" symbol="PM_MDILMaintenanceState" message="$(string.Format.PM.MDILMaintenanceState)" task="LogTrace" keywords="DevPlatCircular PacMan" template="Template_MDIL_GUID_String" />
          <event value="704" opcode="win:Info" level="win:Verbose" symbol="PM_MDILMaintenance" message="$(string.Format.PM.MDILMaintenance)" task="LogTrace" keywords="DevPlatCircular PacMan" template="Template_GUID" />
          <event value="705" opcode="win:Info" level="win:Error" symbol="PM_XBFTimeout" message="$(string.Format.PM.XBFTimeout)" task="LogTrace" keywords="ProductionCircular SelfHostCritical PacMan" template="Template_GUID" />
          <event value="706" opcode="win:Info" level="win:Error" symbol="PM_XBFFailed" message="$(string.Format.PM.XBFFailed)" task="LogTrace" keywords="ProductionCircular SelfHostCritical PacMan" template="Template_GUID_UInt32" />
          <event value="707" opcode="win:Info" level="win:Verbose" symbol="PM_InstallerInfo" message="$(string.Format.PM.InstallerInfo)" task="LogTrace" keywords="DevPlatCircular PacMan" template="Template_GUID_String_INSTALL_TYPE" />
          <event value="708" opcode="win:Info" level="win:Error" symbol="PM_LifecycleEventError" message="$(string.Format.PM.Lifecycle)" task="LogTrace" keywords="ProductionCircular SelfHostCritical PacMan ms:Telemetry" template="Template_LIFECYCLE_NOTIFICATION_GUID_UInt32_HRESULT_BOOL" />
          <event value="709" opcode="win:Info" level="win:Verbose" symbol="PM_LifecycleEvent" message="$(string.Format.PM.Lifecycle)" task="LogTrace" keywords="SelfHostCritical PacMan" template="Template_LIFECYCLE_NOTIFICATION_GUID_UInt32_HRESULT_BOOL" />
          <event value="710" opcode="win:Info" level="win:Verbose" symbol="PM_TileEvent" message="$(string.Format.PM.Tile)" task="LogTrace" keywords="DevPlatCircular PacMan" template="Template_TILE_NOTIFICATION_GUID" />
          <event value="711" opcode="win:Info" level="win:Verbose" symbol="PM_ConvertHRVerbose" message="$(string.Format.PM.ConvertHR_Full)" task="LogTrace" keywords="SelfHostCritical DevPlatCircular PacMan" template="Template_FILE_Line_HRESULT_HRESULT_GUID" />
          <event value="712" opcode="win:Info" level="win:Error" symbol="PM_ConvertHR_Full" message="$(string.Format.PM.ConvertHR_Full)" task="LogTrace" keywords="ProductionCritical SelfHostCritical PacMan" template="Template_FILE_Line_HRESULT_HRESULT_GUID" />
          <event value="713" opcode="win:Info" level="win:Error" symbol="PM_ConvertHR" message="$(string.Format.PM.ConvertHR)" task="LogTrace" keywords="ProductionCircular SelfHostCritical PacMan" template="Template_FILE_Line_HRESULT_HRESULT_GUID" />
          <event value="714" opcode="win:Info" level="win:Error" symbol="PM_TraceError" message="$(string.Format.PM.TraceError)" task="LogTrace" keywords="ProductionCircular SelfHostCritical PacMan" template="Template_FILE_Line_HRESULT_HRESULT_GUID" />
          <event value="715" opcode="win:Info" level="win:Error" symbol="PM_TraceError_ProductID" message="$(string.Format.PM.TraceError_ProductID)" task="LogTrace" keywords="ProductionCircular SelfHostCritical PacMan" template="Template_FILE_Line_HRESULT_HRESULT_GUID" />
          <event value="716" opcode="win:Info" level="win:Error" symbol="PM_TraceError_ESE" message="$(string.Format.PM.TraceError_ESE)" task="LogTrace" keywords="ProductionCircular SelfHostCritical PacMan" template="Template_FILE_Line_HRESULT__UInt32" />
          <event value="717" opcode="win:Info" level="win:Error" symbol="PM_ActivityExecutionError" message="$(string.Format.PM.ActivityExecutionError)" task="LogTrace" keywords="SelfHostCritical ProductionCritical PacMan" template="Template_GUID_ORCHESTRATOR_STATEMACHINE_ORCHESTRATOR_ExecutionMode_ORCHESTRATOR_ACTIVITY_TYPE_HRESULT" />
          <event value="718" opcode="win:Info" level="win:Informational" symbol="PacManBackupRestoreBeginActivityExecute" message="$(string.PacMan.BackupRestoreBeginActivityExecute)" keywords="DevPlatCircular PacMan" template="Template__p0_UInt32_map_ORCHESTRATOR_ACTIVITY_TYPE" />
          <event value="719" opcode="win:Info" level="win:Informational" symbol="PacManBackupRestoreActivityRollback" message="$(string.PacMan.BackupRestoreActivityRollback)" keywords="DevPlatCircular PacMan" template="Template__p0_UInt32_map_ORCHESTRATOR_ACTIVITY_TYPE" />
          <event value="720" opcode="win:Info" level="win:Informational" symbol="PacManBackupRestoreActivityIsRollbackNeeded" message="$(string.PacMan.BackupRestoreActivityIsRollbackNeeded)" keywords="DevPlatCircular PacMan" template="Template__p0_Boolean_Default__p1_UInt32_map_ORCHESTRATOR_ACTIVITY_TYPE" />
          <event value="721" opcode="win:Info" level="win:Informational" symbol="PacManWnsRegistrationImpersonateUser" message="$(string.PacMan.WnsRegistrationImpersonateUser)" keywords="DevPlatCircular PacMan" template="Template__p0_UInt32_HexInt32" />
          <event value="722" opcode="win:Info" level="win:Verbose" symbol="PacManWnsRegistrationRegister" message="$(string.PacMan.WnsRegistrationRegister)" keywords="DevPlatCircular PacMan" template="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32" />
          <event value="723" opcode="win:Info" level="win:Verbose" symbol="PacManWnsRegistrationDeRegister" message="$(string.PacMan.WnsRegistrationDeRegister)" keywords="DevPlatCircular PacMan" template="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32" />
          <event value="724" opcode="win:Info" level="win:Verbose" symbol="PacManWnsRegistrationAddTemporaryRegistration" message="$(string.PacMan.WnsRegistrationAddTemporaryRegistration)" keywords="DevPlatCircular PacMan" template="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32" />
          <event value="725" opcode="win:Info" level="win:Verbose" symbol="PacManWnsRegistrationRemoveTemporaryRegistration" message="$(string.PacMan.WnsRegistrationRemoveTemporaryRegistration)" keywords="DevPlatCircular PacMan" template="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32" />
          <event value="726" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPReadLicenseFile" message="$(string.PacMan.AppInstallCSPReadLicenseFile)" keywords="DevPlatCircular PacMan" template="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32" />
          <event value="727" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetProductID" message="$(string.PacMan.AppInstallCSPSetProductID)" keywords="DevPlatCircular PacMan" template="Template__p0_GUID_Default" />
          <event value="728" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetPackagePath" message="$(string.PacMan.AppInstallCSPSetPackagePath)" keywords="DevPlatCircular PacMan" template="Template__p0_UnicodeString_Default" />
          <event value="729" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetDependencyPackages" message="$(string.PacMan.AppInstallCSPSetDependencyPackages)" keywords="DevPlatCircular PacMan" template="Template__p0_UnicodeString_Default" />
          <event value="730" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetLicensePath" message="$(string.PacMan.AppInstallCSPSetLicensePath)" keywords="DevPlatCircular PacMan" template="Template__p0_UnicodeString_Default" />
          <event value="731" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetInstanceID" message="$(string.PacMan.AppInstallCSPSetInstanceID)" keywords="DevPlatCircular PacMan" template="Template__p0_GUID_Default" />
          <event value="732" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetOfferID" message="$(string.PacMan.AppInstallCSPSetOfferID)" keywords="DevPlatCircular PacMan" template="Template__p0_GUID_Default" />
          <event value="733" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetPayloadID" message="$(string.PacMan.AppInstallCSPSetPayloadID)" keywords="DevPlatCircular PacMan" template="Template__p0_GUID_Default" />
          <event value="734" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetInstallTypeWithAMap" message="$(string.PacMan.AppInstallCSPSetInstallTypeWithAMap)" keywords="DevPlatCircular PacMan" template="Template__p0_UInt32_map_INSTALLTYPE" />
          <event value="735" opcode="win:Info" level="win:Informational" symbol="PacManClientNotificationThreadStarts" message="$(string.PacMan.ClientNotificationThreadStarts)" keywords="DevPlatCircular PacMan" template="Template" />
          <event value="736" opcode="win:Info" level="win:Informational" symbol="PacManClientNotificationTypeWithAMap" message="$(string.PacMan.ClientNotificationTypeWithAMap)" keywords="DevPlatCircular PacMan" template="Template__p0_UInt32_map_PM_NOTIFICATION_TYPE__p1_GUID_Default__p2_UInt32_unsignedInt" />
          <event value="737" opcode="win:Info" level="win:Informational" symbol="PacManClientNotificationThreadExits" message="$(string.PacMan.ClientNotificationThreadExits)" keywords="DevPlatCircular PacMan" template="Template__p0_UInt32_HexInt32" />
          <event value="738" opcode="win:Info" level="win:Informational" symbol="PacManClientCreateNotificationManager" message="$(string.PacMan.ClientCreateNotificationManager)" keywords="DevPlatCircular PacMan" template="Template__p0_UInt32_HexInt32" />
          <event value="739" opcode="win:Info" level="win:Informational" symbol="PacManIndex_Rebuild_Required" message="$(string.Format.PM.Index_Rebuild_Required)" keywords="SelfHostCritical DevPlatCircular PacMan" template="Template_Empty" />
          <event value="740" opcode="win:Info" level="win:Informational" symbol="PacManRebuilding_Index_For_Table" message="$(string.Format.PM.PacManRebuilding_Index_For_Table)" keywords="SelfHostCritical DevPlatCircular PacMan" template="Template_String" />
          <event value="741" opcode="win:Info" level="win:Informational" symbol="PacManRebuilding_Index" message="$(string.Format.PM.PacManRebuilding_Index)" keywords="SelfHostCritical DevPlatCircular PacMan" template="Template_String_String_UInt32" />
          <event value="742" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetUninstallDisabled" message="$(string.PacMan.AppInstallCSPSetUninstallDisabled)" keywords="DevPlatCircular PacMan" template="Template_Boolean" />
          <event value="743" opcode="win:Info" level="win:Informational" symbol="PacManInitializePackageManager" message="$(string.PacMan.InitializePackageManager)" template="Template__p0_UInt32_HexInt32" />
          <event value="744" opcode="win:Info" level="win:Informational" symbol="PacManOnSDCardStateChange" message="$(string.PacMan.OnSDCardStateChange)" keywords="SelfHostCritical PacMan" template="Template__p0_GUID_Default__p1_UInt32_unsignedInt" />
          <event value="745" opcode="win:Info" level="win:Informational" symbol="PacManStartSDCleanupTask" message="$(string.PacMan.StartSDCleanupTask)" keywords="SelfHostCritical PacMan" template="Template" />
          <event value="746" opcode="win:Info" level="win:Informational" symbol="PacManSDCleanupTaskWorkerStart" message="$(string.PacMan.SDCleanupTaskWorkerStart)" keywords="SelfHostCritical PacMan" template="Template" />
          <event value="747" opcode="win:Info" level="win:Informational" symbol="PacManSubscribeToSDCardNotifications" message="$(string.PacMan.SubscribeToSDCardNotifications)" keywords="SelfHostCritical PacMan" template="Template__p0_UInt32_HexInt32" />
          <event value="748" opcode="win:Info" level="win:Informational" symbol="PacManSDCardPresenceInfoChangeCallback" message="$(string.PacMan.SDCardPresenceInfoChangeCallback)" keywords="SelfHostCritical PacMan" template="Template" />
          <event value="749" opcode="win:Info" level="win:Informational" symbol="PacManShellReady" message="$(string.PacMan.ShellReady)" template="Template" />
          <event value="750" opcode="win:Info" level="win:Informational" symbol="PacManSDCleanupTaskRollbackJunkFolder" message="$(string.PacMan.SDCleanupTaskRollbackJunkFolder)" keywords="SelfHostCritical PacMan" template="Template__p0_UnicodeString_Default__p1_UnicodeString_Default" />
          <event value="751" opcode="win:Info" level="win:Informational" symbol="PacManSDCleanupTaskDisableSDApp" message="$(string.PacMan.SDCleanupTaskDisableSDApp)" keywords="SelfHostCritical PacMan" template="Template__p0_GUID_Default" />
          <event value="752" opcode="win:Info" level="win:Informational" symbol="PacManSDCleanupTaskDeleteUnknownFolder" message="$(string.PacMan.SDCleanupTaskDeleteUnknownFolder)" keywords="SelfHostCritical PacMan" template="Template__p0_UnicodeString_Default" />
          <event value="753" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetIsBundle" message="$(string.PacMan.AppInstallCSPSetIsBundle)" keywords="DevPlatCircular PacMan" template="Template_Boolean" />
          <event value="754" opcode="win:Info" level="win:Informational" symbol="PacManAppStateChangeTaskOnAppStateChange" message="$(string.PacMan.AppStateChangeTaskOnAppStateChange)" keywords="SelfHostCritical PacMan" template="Template__p0_GUID_Default__p1_UInt32_unsignedInt__p2_UInt32_HexInt32" />
          <event value="755" opcode="win:Info" level="win:Informational" symbol="PacManUpdateAppPushNotification" message="$(string.PacMan.UpdateAppPushNotification)" keywords="SelfHostCritical PacMan" template="Template__p0_GUID_Default__p1_UInt32_unsignedInt__p2_UInt32_HexInt32" />
          <event value="756" opcode="win:Info" level="win:Informational" symbol="PacManAppStateChangeTaskStart" message="$(string.PacMan.AppStateChangeTaskStart)" keywords="SelfHostCritical PacMan" template="Template" />
          <event value="757" opcode="win:Info" level="win:Informational" symbol="PacManAppMaintenanceTaskRun" message="$(string.PacMan.AppMaintenanceTaskRun)" keywords="SelfHostCritical PacMan" template="Template__p0_GUID_Default__p1_GUID_Default__p2_UInt32_HexInt32__p3_UInt32_HexInt32" />
          <event value="758" opcode="win:Info" level="win:Verbose" symbol="PacManVisualElementsDEHExtSetManifestPath" message="$(string.PacMan.VisualElementsDEHExtSetManifestPath)" template="Template__p0_UnicodeString_Default" />
          <event value="759" opcode="win:Info" level="win:Informational" symbol="PacManCreateInstallRequest" message="$(string.PacMan.CreateInstallRequest)" keywords="SelfHostCritical PacMan" template="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32__p2_UInt32_HexInt32" />
          <event value="760" opcode="win:Info" level="win:Informational" symbol="PacManCreateUninstallRequest" message="$(string.PacMan.CreateUninstallRequest)" keywords="SelfHostCritical PacMan" template="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32__p2_UInt32_HexInt32" />
          <event value="761" opcode="win:Info" level="win:Informational" symbol="PacManCreateUpdateRequest" message="$(string.PacMan.CreateUpdateRequest)" keywords="SelfHostCritical PacMan" template="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32__p2_UInt32_HexInt32" />
          <event value="762" opcode="win:Info" level="win:Warning" symbol="PacManFailedToStoreActivityContext" message="$(string.PacMan.FailedToStoreActivityContext)" keywords="SelfHostCritical PacMan" template="Template__p0_GUID_Default__p1_UInt32_map_ORCHESTRATOR_ACTIVITY_TYPE__p2_UInt32_HexInt32" />
          <event value="763" opcode="win:Info" level="win:Verbose" symbol="PacManAppxDownload" message="$(string.PacMan.AppxDownload)" template="Template__p0_UInt64_unsignedLong__p1_UInt32_unsignedInt__p2_UInt32_HexInt32" />
          <event value="764" opcode="win:Info" level="win:Informational" symbol="PacManAppXSetVolumeStatus" message="$(string.PacMan.AppXSetVolumeStatus)" template="Template__p0_UnicodeString_Default__p1_UInt32_unsignedInt__p2_UInt32_HexInt32" />
          <event value="765" opcode="win:Info" level="win:Informational" symbol="PacManSendTokenNotificationTileUpdatedByProcessId" message="$(string.PacMan.SendTokenNotificationTileUpdatedByProcessId)" template="Template__p0_UInt32_HexInt32" />
          <event value="766" opcode="win:Info" level="win:Informational" symbol="PacManVisualElementsProcessWindowsPhoneReservedAppInfo" message="$(string.PacMan.VisualElementsProcessWindowsPhoneReservedAppInfo)" template="Template__p0_Boolean_Default__p1_Boolean_Default__p2_UInt32_HexInt32" />
          <event value="767" opcode="win:Info" level="win:Error" symbol="PM_ChamberMaintenanceError" message="$(string.Format.PM.ChamberMaintenanceError)" task="LogTrace" keywords="ProductionCircular SelfHostCritical PacMan" template="Template_GUID_HRESULT" />
          <event value="768" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetFullyPreInstall" message="$(string.PacMan.AppInstallCSPSetFullyPreInstall)" keywords="DevPlatCircular PacMan" template="Template_Boolean" />
          <event value="769" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetForceUpdate" message="$(string.PacMan.AppInstallCSPSetForceUpdate)" keywords="DevPlatCircular PacMan" template="Template_Boolean" />
          <event value="770" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetDeferMdilBind" message="$(string.PacMan.AppInstallCSPSetDeferMdilBind)" keywords="DevPlatCircular PacMan" template="Template_Boolean" />
          <event value="771" opcode="win:Info" level="win:Informational" symbol="PacManBindDeferredMdilBinaries" message="$(string.PacMan.BindDeferredMdilBinaries)" keywords="SelfHostCritical PacMan" template="Template__p0_UInt32_HexInt32" />
          <event value="772" opcode="win:Info" level="win:Verbose" symbol="PacManBindFileSkipWithNoFiles" message="$(string.PacMan.BindFileSkipWithNoFiles)" template="Template__p0_UInt32_unsignedInt" />
          <event value="773" opcode="win:Info" level="win:Verbose" symbol="PacManBindFileWait" message="$(string.PacMan.BindFileWait)" template="Template__p0_UInt32_unsignedInt" />
          <event value="774" opcode="win:Info" level="win:Verbose" symbol="PacManBindFileEnd" message="$(string.PacMan.BindFileEnd)" template="Template__p0_UInt32_unsignedInt__p1_UInt32_unsignedInt" />
          <event value="775" opcode="win:Info" level="win:Error" symbol="PacManReBind" message="$(string.PacMan.ReBind)" template="Template__p0_UInt32_HexInt32" />
          <event value="776" opcode="win:Info" level="win:Verbose" symbol="PacManBindStart" message="$(string.PacMan.BindStart)" template="Template__p0_UInt32_unsignedInt" />
          <event value="777" opcode="win:Info" level="win:Informational" symbol="PacManBindFileStart" message="$(string.PacMan.BindFileStart)" template="Template__p0_UnicodeString_Default__p1_UInt32_unsignedInt__p2_UInt32_unsignedInt" />
          <event value="778" opcode="win:Info" level="win:Verbose" symbol="PacManBindFileSkip" message="$(string.PacMan.BindFileSkip)" template="Template__p0_UnicodeString_Default__p1_Boolean_Default__p2_UInt32_unsignedInt" />
          <event value="779" opcode="win:Info" level="win:Warning" symbol="PacManLockdownFeatureEnabledWithoutExports" message="$(string.PacMan.LockdownFeatureEnabledWithoutExports)" template="Template" />
          <event value="780" opcode="win:Info" level="win:Informational" symbol="PM_LifecycleEventFinished" message="$(string.Format.PM.Lifecycle)" task="LogTrace" keywords="ProductionCritical SelfHostCritical PacMan ms:Telemetry" template="Template_LIFECYCLE_NOTIFICATION_GUID_UInt32_HRESULT_BOOL" />
          <event value="781" opcode="win:Info" level="win:Informational" symbol="PM_LifecycleEventStarted" message="$(string.Format.PM.Lifecycle)" task="LogTrace" keywords="ProductionCritical SelfHostCritical PacMan ms:Telemetry" template="Template_LIFECYCLE_NOTIFICATION_GUID_UInt32_HRESULT_BOOL" />
          <event value="782" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetAltPackagePathOnSystem" message="$(string.PacMan.AppInstallCSPSetAltPackagePathOnSystem)" keywords="DevPlatCircular PacMan" template="Template__p0_UnicodeString_Default__p1_Boolean_Default" />
          <event value="783" opcode="win:Info" level="win:Informational" symbol="PacManAppInstallCSPSetAltPackagePathOnData" message="$(string.PacMan.AppInstallCSPSetAltPackagePathOnData)" keywords="DevPlatCircular PacMan" template="Template__p0_UnicodeString_Default__p1_Boolean_Default" />
          <event value="784" opcode="win:Info" level="win:Error" symbol="PacManAppInstallCSPInvalidPackagePathOnData" message="$(string.PacMan.AppInstallCSPInvalidPackagePathOnData)" keywords="ProductionCircular SelfHostCritical PacMan" template="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32" />
          <event value="785" opcode="win:Info" level="win:Verbose" symbol="PacManStopServicingIgnorableError" message="$(string.PacMan.StopServicingIgnorableError)" keywords="DevPlatCircular PacMan" template="Template__p0_GUID_Default" />
          <event value="786" opcode="win:Info" level="win:Verbose" symbol="PM_MDILMaintenanceErrorCode" message="$(string.PacMan.PM_MDILMaintenanceErrorCode)" keywords="ProductionCircular SelfHostCritical PacMan" template="Template_GUID_HRESULT_String" />
          <event value="787" opcode="win:Info" level="win:Critical" symbol="PacManCriticalInfo" message="$(string.PacMan.PacManCriticalInfo)" keywords="ProductionCritical SelfHostCritical PacMan" template="Template_String_UInt32" />
          <event value="788" opcode="win:Info" level="win:Verbose" symbol="PacManShellServiceHostIgnorableError" message="$(string.PacMan.ShellServiceHostIgnorableError)" keywords="DevPlatCircular PacMan" template="Template__p0_GUID_Default" />
          <!-- Component:BatterySense:1200 -->
          <event value="1201" opcode="win:Info" level="win:Informational" symbol="BatterySense_StateChange" message="$(string.BatterySense.StateChange)" keywords="BatterySense DevPlatCircular ProductionCircular" template="Template_GUID_BSState_BSState" />
          <event value="1202" opcode="win:Info" level="win:Informational" symbol="BatterySense_SetState" message="$(string.BatterySense.SetState)" keywords="BatterySense DevPlatCircular" template="Template_GUID_BSState_UInt32" />
          <event value="1203" opcode="win:Info" level="win:Informational" symbol="BatterySense_SendNotification" message="$(string.BatterySense.SendNotification)" keywords="BatterySense DevPlatCircular" template="Template_GUID_BSState_String_UInt32" />
          <event value="1204" opcode="win:Info" level="win:Verbose" symbol="BatterySense_RegisterStateChangeHandler" message="$(string.BatterySense.RegisterStateChangeHandler)" keywords="BatterySense DevPlatCircular" template="Template_UInt32_UInt32" />
          <event value="1205" opcode="win:Info" level="win:Verbose" symbol="BatterySense_UnRegisterStateChangeHandler" message="$(string.BatterySense.UnRegisterStateChangeHandler)" keywords="BatterySense DevPlatCircular" template="Template_UInt32_UInt32" />
          <event value="1206" opcode="win:Info" level="win:Informational" symbol="BatterySense_GetState" message="$(string.BatterySense.GetState)" keywords="BatterySense DevPlatCircular" template="Template_GUID_BSState_UInt32" />
          <event value="1207" opcode="win:Info" level="win:Warning" symbol="BatterySense_SendNotificationError" message="$(string.BatterySense.SendNotificationError)" keywords="BatterySense DevPlatCircular ProductionCircular" template="Template_UInt32_UInt32" />
          <event value="1208" opcode="win:Info" level="win:Informational" symbol="BatterySense_GetSettings" message="$(string.BatterySense.GetSettings)" keywords="BatterySense DevPlatCircular" template="Template_UInt32_UInt32" />
          <event value="1209" opcode="win:Info" level="win:Informational" symbol="BatterySense_RequestExecution" message="$(string.BatterySense.RequestExecution)" keywords="BatterySense DevPlatCircular" template="Template_GUID_BSType_BSState_UInt32" />
          <event value="1210" opcode="win:Info" level="win:Verbose" symbol="BatterySense_GetType" message="$(string.BatterySense.GetType)" keywords="BatterySense DevPlatCircular" template="Template_GUID_BSType_UInt32" />
          <event value="1211" opcode="win:Info" level="win:Verbose" symbol="BatterySense_SetType" message="$(string.BatterySense.SetType)" keywords="BatterySense DevPlatCircular" template="Template_GUID_BSType_UInt32" />
          <!-- Component:BackgroundTransferPolicy:1700-->
          <event value="1701" opcode="win:Info" level="win:Informational" symbol="BTPolicy_NetworkStatusChange" task="BackgroundTransferPolicyTrace" keywords="BTPolicy DevPlatCircular" message="$(string.BTPolicy.NetworkStatusChange)" template="Template_BT_NetworkConditions" />
          <event value="1702" opcode="win:Info" level="win:Informational" symbol="BTPolicy_ForegroundAppChange" task="BackgroundTransferPolicyTrace" keywords="BTPolicy DevPlatCircular" message="$(string.BTPolicy.ForegroundAppChange)" template="Template_String" />
          <event value="1703" opcode="win:Info" level="win:Informational" symbol="BTPolicy_CheckConditions" task="BackgroundTransferPolicyTrace" keywords="BTPolicy DevPlatCircular" message="$(string.BTPolicy.CheckConditions)" template="Template_BT_CheckEvaluationConditions" />
          <event value="1704" opcode="win:Info" level="win:Informational" symbol="BTPolicy_ClearPausedList" task="BackgroundTransferPolicyTrace" keywords="BTPolicy DevPlatCircular" message="$(string.BTPolicy.ClearPausedList)" />
          <event value="1705" opcode="win:Info" level="win:Informational" symbol="BTPolicy_PauseBackgroundTransfers" task="BackgroundTransferPolicyTrace" keywords="BTPolicy DevPlatCircular" message="$(string.BTPolicy.PauseBackgroundTransfers)" />
          <event value="1706" opcode="win:Info" level="win:Informational" symbol="BTPolicy_ReschedulePausedTransfers" task="BackgroundTransferPolicyTrace" keywords="BTPolicy DevPlatCircular" message="$(string.BTPolicy.ReschedulePausedTransfers)" />
          <event value="1707" opcode="win:Info" level="win:Informational" symbol="BTPolicy_Enter" task="BackgroundTransferPolicyTrace" keywords="BTPolicy DevPlatCircular" message="$(string.BTPolicy.EnterFunction)" template="Template_UnicodeString"/>
          <event value="1708" opcode="win:Info" level="win:Informational" symbol="BTPolicy_ExitHr" task="BackgroundTransferPolicyTrace" keywords="BTPolicy DevPlatCircular" message="$(string.BTPolicy.ExitFunctionHr)" template="Template_UnicodeString_Hresult"/>
          <event value="1709" opcode="win:Info" level="win:Informational" symbol="BTPolicy_ApplicationUninstalled" task="BackgroundTransferPolicyTrace" keywords="BTPolicy DevPlatCircular" message="$(string.BTPolicy.ApplicationUninstalled)" template="Template_String"/>
          <event value="1710" opcode="win:Info" level="win:Error" symbol="BTPolicy_ErrorOriginateEvent" task="BackgroundTransferPolicyTrace" keywords="BTPolicy Error DevPlatCircular" message="$(string.BTPolicy.ErrorOriginateEvent)" template="Template__p0_Int32__p1_AnsiString__p2_Uint32"/>
          <event value="1711" opcode="win:Info" level="win:Error" symbol="BTPolicy_ErrorPropagateEvent" task="BackgroundTransferPolicyTrace" keywords="BTPolicy Error DevPlatCircular" message="$(string.BTPolicy.ErrorPropagateEvent)" template="Template__p0_Int32__p1_AnsiString__p2_Uint32"/>
          <event value="1712" opcode="win:Info" level="win:Informational" symbol="BTPolicy_StartQuotaEpoch" task="BackgroundTransferPolicyTrace" keywords="BTPolicy DevPlatCircular" message="$(string.BTPolicy.StartQuotaEpoch)" template="Template_UInt64"/>
          <event value="1713" opcode="win:Info" level="win:Informational" symbol="BTPolicy_EndQuotaEpoch" task="BackgroundTransferPolicyTrace" keywords="BTPolicy" message="$(string.BTPolicy.EndQuotaEpoch)" template="Template_UInt64"/>
          <event value="1714" opcode="win:Info" level="win:Informational" symbol="BTPolicy_QuotaExhausted" task="BackgroundTransferPolicyTrace" keywords="BTPolicy" message="$(string.BTPolicy.QuotaExhausted)" />
          <event value="1715" opcode="win:Info" level="win:Informational" symbol="BTPolicy_ResetQuota" task="BackgroundTransferPolicyTrace" keywords="BTPolicy" message="$(string.BTPolicy.ResetQuota)" />
          <event value="1716" opcode="win:Info" level="win:Informational" symbol="BTPolicy_ChargingStatusChange" task="BackgroundTransferPolicyTrace" keywords="BTPolicy" message="$(string.BTPolicy.ChargingStatusChange)" template="Template_Boolean" />
          <event value="1717" opcode="win:Info" level="win:Informational" symbol="BTPolicy_LoadedRegistry" task="BackgroundTransferPolicyTrace" keywords="BTPolicy" message="$(string.BTPolicy.LoadedRegistry)" template="Template_BT_LoadedRegistry" />
          <!-- Component:BackgroundAudioPolicy:1800-->
          <event value="1801" opcode="win:Info" level="win:Informational" symbol="BAPolicy_TimerExpired" task="BackgroundAudioPolicyTrace" keywords="BAPolicy" message="$(string.BAPolicy.TimerExpired)" />
          <event value="1802" opcode="win:Info" level="win:Informational" symbol="BAPolicy_TimerStarted" task="BackgroundAudioPolicyTrace" keywords="BAPolicy" message="$(string.BAPolicy.TimerStarted)" />
          <event value="1803" opcode="win:Info" level="win:Informational" symbol="BAPolicy_TimerStopped" task="BackgroundAudioPolicyTrace" keywords="BAPolicy" message="$(string.BAPolicy.TimerStopped)" />
          <event value="1804" opcode="win:Info" level="win:Informational" symbol="BAPolicy_UpdateActiveForegroundStatus" task="BackgroundAudioPolicyTrace" keywords="BAPolicy" message="$(string.BAPolicy.UpdateActiveForegroundStatus)" template="Template_Boolean_GUID" />
          <!-- Component:BSS:6000 -->
          <event value="6017" opcode="win:Start" level="win:Informational" symbol="BssLocationPrefetchStart" message="$(string.Format.Bss.LocationPrefetchStart)" task="BNS_LOCATION_PERFETCH" keywords="Bss SelfHostCritical" />
          <event value="6018" opcode="win:Stop" level="win:Informational" symbol="BssLocationPrefetchEnd" message="$(string.Format.Bss.LocationPrefetchEnd)" task="BNS_LOCATION_PERFETCH" keywords="Bss SelfHostCritical" />
          <event value="6019" opcode="win:Info" level="win:Informational" symbol="BssStartService" message="$(string.Format.Bss.ServiceStart)" keywords="Bss SelfHostCritical " template="Template_UInt32" />
          <event value="6020" opcode="win:Info" level="win:Informational" symbol="BssStopService" message="$(string.Format.Bss.ServiceStop)" keywords="Bss SelfHostCritical " template="Template_UInt32" />
          <event value="6023" opcode="win:Info" level="win:Informational" symbol="BssOnIdleSessionWakeupEvent" message="$(string.Format.Bss.OnIdleSessionWakeupEvent)" keywords="Bss SelfHostCritical" template="Template_UInt32_UInt32" />
          <event value="6024" opcode="win:Info" level="win:Informational" symbol="BssOnIdleSessionStart" message="$(string.Format.Bss.OnIdleSessionStart)" keywords="Bss SelfHostCritical" />
          <event value="6025" opcode="win:Info" level="win:Informational" symbol="BssOnIdleSessionStop" message="$(string.Format.Bss.OnIdleSessionStop)" keywords="Bss SelfHostCritical" template="Template_UInt32" />
          <event value="6032" opcode="win:Info" level="win:Informational" symbol="BssCancelAllPendingAsyncRequestsStart" message="$(string.Format.Bss.CancelAllPendingAsyncRequestsStart)" keywords="Bss SelfHostCritical" />
          <event value="6033" opcode="win:Info" level="win:Informational" symbol="BssCancelAllPendingAsyncRequestsEnd" message="$(string.Format.Bss.CancelAllPendingAsyncRequestsEnd)" keywords="Bss SelfHostCritical" />
          <event value="6050" opcode="win:Info" level="win:Informational" symbol="BssEventHandlerThreadProc" message="$(string.Format.Bss.EventHandlerThreadProc)" task="LogTrace" keywords="Bss SelfHostCritical" template="BssTemplate_EventHandlerThreadProc" />
          <event value="6051" opcode="win:Info" level="win:Informational" symbol="BssNotificationEvent" message="$(string.Format.Bss.NotificationEvent)" task="LogTrace" keywords="Bss SelfHostCritical" template="BssTemplate_BssNotificationDescription" />
          <event value="6052" opcode="win:Info" level="win:Informational" symbol="BssNotificationEventAgentId" message="$(string.Format.Bss.NotificationEventAgentId)" task="LogTrace" keywords="Bss SelfHostCritical" template="BssTemplate_BssNotificationDescription_AgentId" />
          <event value="6053" opcode="win:Info" level="win:Informational" symbol="BssNotificationEventAgentIdHr" message="$(string.Format.Bss.NotificationEventAgentIdHr)" task="LogTrace" keywords="Bss SelfHostCritical" template="BssTemplate_BssNotificationDescription_AgentId_HR" />
          <event value="6054" opcode="win:Info" level="win:Informational" symbol="BssSentAimCancelRequest" message="$(string.Format.Bss.SentAimCancelRequest)" task="LogTrace" keywords="Bss SelfHostCritical" template="Template_UInt32" />
          <event value="6055" opcode="win:Info" level="win:Informational" symbol="BssDisableSchedulesForDebugSession" message="$(string.Format.Bss.DisableSchedulesForDebugSession)" task="LogTrace" keywords="Bss SelfHostCritical" />
          <event value="6056" opcode="win:Info" level="win:Informational" symbol="BssEnableSchedulesForDebugSession" message="$(string.Format.Bss.EnableSchedulesForDebugSession)" task="LogTrace" keywords="Bss SelfHostCritical" />
          <event value="6057" opcode="win:Info" level="win:Informational" symbol="BssEnableTaskNotification" message="$(string.Format.Bss.EnableTaskNotification)" task="LogTrace" keywords="Bss SelfHostCritical" template="Template_UInt32_UInt32" />
          <event value="6058" opcode="win:Info" level="win:Informational" symbol="BssHandleNetworkOnEventForKeepAliveAgentNoNetwork" message="$(string.Format.Bss.HandleNetworkOnEventForKeepAliveAgentNoNetwork)" task="LogTrace" keywords="Bss SelfHostCritical" />
          <event value="6059" opcode="win:Info" level="win:Informational" symbol="BssHandlePeriodicEventForKeepAliveAgentNoNetwork" message="$(string.Format.Bss.HandlePeriodicEventForKeepAliveAgentNoNetwork)" task="LogTrace" keywords="Bss SelfHostCritical" />
          <event value="6060" opcode="win:Info" level="win:Informational" symbol="BssRequestFetchLocationUseCached" message="$(string.Format.Bss.RequestFetchLocationUseCached)" task="LogTrace" keywords="Bss SelfHostCritical" />
          <event value="6061" opcode="win:Info" level="win:Informational" symbol="BssRequestFetchLocationFresh" message="$(string.Format.Bss.RequestFetchLocationFresh)" task="LogTrace" keywords="Bss SelfHostCritical" />
          <event value="6062" opcode="win:Info" level="win:Informational" symbol="BssAsyncFetchLoopExit" message="$(string.Format.Bss.AsyncFetchLoopExit)" task="LogTrace" keywords="Bss SelfHostCritical" />
          <event value="6063" opcode="win:Info" level="win:Informational" symbol="BssAsyncFetchLoopError" message="$(string.Format.Bss.AsyncFetchLoopError)" task="LogTrace" keywords="Bss SelfHostCritical" template="Template_UInt32" />
          <event value="6064" opcode="win:Info" level="win:Informational" symbol="BssRequestFetchLocationDelaying" message="$(string.Format.Bss.RequestFetchLocationDelaying)" task="LogTrace" keywords="Bss SelfHostCritical" template="Template_UInt32" />
          <event value="6065" opcode="win:Info" level="win:Informational" symbol="BssLaunchScheduledTaskExSkipLaunch" message="$(string.Format.Bss.LaunchScheduledTaskExSkipLaunch)" task="LogTrace" keywords="Bss SelfHostCritical" template="Template_GUID_UInt32_UInt32" />
          <event value="6066" opcode="win:Info" level="win:Error" symbol="BssCHRLog" message="$(string.Format.Bss.CHRLog)" task="LogTrace" keywords="Bss ProductionCircular" template="Template_String_UInt32_UInt32" />

          <!--  Component:DevPlatMigrator:6400 -->
          <event value="6400" opcode="win:Info" level="win:Informational" symbol="DevPlatMigratorMainStart" message="$(string.DevPlatMigrator.MainStart)" keywords="DevPlatCircular" template="Template" />
          <event value="6401" opcode="win:Info" level="win:Informational" symbol="DevPlatMigratorMainReadRegistryConfig" message="$(string.DevPlatMigrator.MainReadRegistryConfig)" keywords="DevPlatCircular" template="Template__p0_UInt32_unsignedInt__p1_UInt32_unsignedInt" />
          <event value="6402" opcode="win:Info" level="win:Verbose" symbol="DevPlatMigratorMainGetBuildInfo" message="$(string.DevPlatMigrator.MainGetBuildInfo)" keywords="DevPlatCircular" template="Template" />
          <event value="6403" opcode="win:Info" level="win:Verbose" symbol="DevPlatMigratorMainGetBuildInfoResults" message="$(string.DevPlatMigrator.MainGetBuildInfoResults)" keywords="DevPlatCircular" template="Template__p0_UInt32_unsignedInt__p1_UInt32_unsignedInt" />
          <event value="6404" opcode="win:Info" level="win:Verbose" symbol="DevPlatMigratorMainGetCancelNgenAndReindex" message="$(string.DevPlatMigrator.MainGetCancelNgenAndReindex)" keywords="DevPlatCircular" template="Template_UInt32_UInt32" />
          <event value="6405" opcode="win:Info" level="win:Informational" symbol="DevPlatMigratorMainFinish" message="$(string.DevPlatMigrator.MainFinish)" keywords="DevPlatCircular" template="Template__p0_UInt32_HexInt32__p1_UInt32_HexInt32" />
          <!--  Component:StartBackupRestore:7000 -->
          <event value="7000" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRBackupToFolder" message="$(string.StartBackupRestore.BackupStart)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__p0_UInt32_HexInt32" />
          <event value="7001" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRApplyBackupFromStagingFolder" message="$(string.StartBackupRestore.ApplyStartBackup)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__p0_UInt32_HexInt32" />
          <event value="7002" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRRestoreBackupToStagingFolder" message="$(string.StartBackupRestore.StageStartBackup)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__p0_UInt32_HexInt32" />
          <event value="7003" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRModifyTilesForApplication" message="$(string.StartBackupRestore.ReplacePlaceholderTiles)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry"  template="Template__p0_GUID_Default__p1_UInt32_HexInt32" />
          <event value="7004" opcode="win:Info" task="LogTrace" level="win:Error" symbol="SBRErrorOriginateEvent" message="$(string.StartBackupRestore.OriginateMessage)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__p0_Int32__p1_AnsiString__p2_Uint32" />
          <event value="7005" opcode="win:Info" task="LogTrace" level="win:Error" symbol="SBRErrorPropagateEvent" message="$(string.StartBackupRestore.PropagateMessage)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__p0_Int32__p1_AnsiString__p2_Uint32" />
          <event value="7006" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRReplacePlaceHolderTile" message="$(string.StartBackupRestore.ReplacePlaceHolderTile)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String_String_HR" />
          <event value="7007" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRGetUnits" message="$(string.StartBackupRestore.GetUnits)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__p0_UInt32_unsignedInt__p1_UInt32_unsignedInt" />
          <event value="7008" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRApplyUnit" message="$(string.StartBackupRestore.ApplyUnit)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__p0_UnicodeString_Default" />
          <event value="7009" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBROpenStream" message="$(string.StartBackupRestore.OpenStream)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__p0_UnicodeString_Default" />
          <event value="7010" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRBeginSession" message="$(string.StartBackupRestore.BeginSession)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__p0_UInt32_unsignedInt" />
          <event value="7011" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBREndSession" message="$(string.StartBackupRestore.EndSession)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__Boolean_Int_HR" />
          <event value="7012" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRRestoreTile" message="$(string.StartBackupRestore.RestoreTile)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String_Int" />
          <event value="7013" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRUpdateExistingTile" message="$(string.StartBackupRestore.UpdateExistingTile)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String" />
          <event value="7014" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRAddNewPlaceHolderTile" message="$(string.StartBackupRestore.AddNewPlaceHolderTile)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String_HexInt_Int" />
          <event value="7015" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRAddNewTile" message="$(string.StartBackupRestore.AddNewTile)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String_HexInt_Int" />
          <event value="7016" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRRestoringImageFile" message="$(string.StartBackupRestore.RestoringImageFile)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String" />
          <event value="7017" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRAddNewModernPlaceHolderTile" message="$(string.StartBackupRestore.AddNewModernPlaceHolderTile)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String_Int" />
          <event value="7018" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRAddNewModernTile" message="$(string.StartBackupRestore.AddNewModernTile)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__String_String_Int" />
          <event value="7019" opcode="win:Info" task="LogTrace" level="win:Error" symbol="SBRRestorePropertyError" message="$(string.StartBackupRestore.RestorePropertyError)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__UInt32_String_GUID_String_Hr" />
          <event value="7020" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRBackupAbsoluteImagePath" message="$(string.StartBackupRestore.BackupAbsoluteImagePath)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String" />
          <event value="7021" opcode="win:Info" task="LogTrace" level="win:Error" symbol="SBRRestoreTileFailed" message="$(string.StartBackupRestore.RestoreTileFailed)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String_HR" />
          <event value="7022" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRPlaceHolderTileUnpinned" message="$(string.StartBackupRestore.PlaceHolderTileUnpinned)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String_HR" />
          <event value="7023" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRUnavailableApp" message="$(string.StartBackupRestore.UnavailableApp)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String_Int" />
          <event value="7024" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRRegisterForNotifications" message="$(string.StartBackupRestore.RegisterForNotifications)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String_String_HR" />
          <event value="7025" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRResolveRawUriProperty" message="$(string.StartBackupRestore.ResolveRawUriProperty)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template_String_String_String" />
          <event value="7026" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="SBRResolvedRawPropertiesForTile" message="$(string.StartBackupRestore.ResolvedRawUriPropertiesForTile)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template_GUID_HRESULT" />
          <!--  Component:AppListBackupRestore:7100 -->
          <event value="7100" opcode="win:Info" task="LogTrace" level="win:Informational" symbol="ALBRAppInstall" message="$(string.AppListBackupRestore.AppInstall)" keywords="DevPlatCircular SelfHostCritical ms:Telemetry" template="Template__GUID_String_HR" />
          <!-- Component:ShareBroker:8000 -->
          <event value="8000" opcode="win:Info" level="win:Informational" symbol="ShareBroker_InvokeFlow" keywords="Share DevPlatCircular" message="$(string.ShareBroker.InvokeFlow)" template="Template_pointer" />
          <event value="8001" opcode="win:Info" level="win:Error" symbol="ShareBroker_Error" keywords="Share DevPlatCircular" message="$(string.ShareBroker.Error)" template="Template_AnsiString_Base10UInt32_UInt32" />
          <event value="8002" opcode="win:Start" task="LogTrace" level="win:Informational" symbol="ShareBroker_BeginFetchDataPackage" keywords="Share Performance DevPlatCircular" message="$(string.ShareBroker.BeginFetchDataPackage)" />
          <event value="8003" opcode="win:Stop" task="LogTrace" level="win:Informational" symbol="ShareBroker_EndFetchDataPackage" keywords="Share Performance DevPlatCircular" message="$(string.ShareBroker.EndFetchDataPackage)" />
          <event value="8004" opcode="win:Info" level="win:Informational" symbol="ShareBroker_LaunchingSharePicker" keywords="Share DevPlatCircular" message="$(string.ShareBroker.LaunchingSharePicker)" />
          <event value="8005" opcode="win:Info" level="win:Informational" symbol="ShareBroker_CallerNotAppContainer" keywords="Share DevPlatCircular" message="$(string.ShareBroker.CallerNotAppContainer)" template="Template_PID" />
          <event value="8006" opcode="win:Info" level="win:Informational" symbol="ShareBroker_SFToDSSToken" keywords="Share DevPlatCircular" message="$(string.ShareBroker.SFToDSSToken)" template="Template_String_Boolean" />
          <event value="8007" opcode="win:Info" level="win:Informational" symbol="ShareBroker_ReportTargetStarted" keywords="Share DevPlatCircular" message="$(string.ShareBroker.ReportTargetStarted)" template="Template_GUID" />
          <event value="8008" opcode="win:Info" level="win:Informational" symbol="ShareBroker_ReportTargetRetrievedData" keywords="Share DevPlatCircular" message="$(string.ShareBroker.ReportTargetRetrievedData)" template="Template_GUID" />
          <event value="8009" opcode="win:Info" level="win:Informational" symbol="ShareBroker_ReportTargetSubmittedBackgroundTask" keywords="Share DevPlatCircular" message="$(string.ShareBroker.ReportTargetSubmittedBackgroundTask)" template="Template_GUID" />
          <event value="8010" opcode="win:Info" level="win:Informational" symbol="ShareBroker_ReportTargetCompleted" keywords="Share DevPlatCircular" message="$(string.ShareBroker.ReportTargetCompleted)" template="Template_GUID" />
          <event value="8011" opcode="win:Info" level="win:Informational" symbol="ShareBroker_DismissUI" keywords="Share DevPlatCircular" message="$(string.ShareBroker.DismissUI)" template="Template_GUID" />
          <event value="8012" opcode="win:Info" level="win:Informational" symbol="ShareBroker_ReportTargetError" keywords="Share DevPlatCircular" message="$(string.ShareBroker.ReportTargetError)" template="Template_GUID" />
          <event value="8013" opcode="win:Info" level="win:Informational" symbol="ShareBroker_RunningShareEntryCreate" keywords="Share DevPlatCircular" message="$(string.ShareBroker.RunningShareEntryCreate)" template="Template_GUID_String_PID" />
          <event value="8014" opcode="win:Info" level="win:Informational" symbol="ShareBroker_RunningShareEntryDestroy" keywords="Share DevPlatCircular" message="$(string.ShareBroker.RunningShareEntryDestroy)" template="Template_GUID" />
          <event value="8015" opcode="win:Info" level="win:Informational" symbol="ShareBroker_HandleTargetCrash" keywords="Share DevPlatCircular" message="$(string.ShareBroker.HandleTargetCrash)" template="Template_GUID_PID" />
          <event value="8016" opcode="win:Info" level="win:Informational" symbol="ShareBroker_CreatedBackgroundWorkItem" keywords="Share DevPlatCircular" message="$(string.ShareBroker.CreatedBackgroundWorkItem)" template="Template_GUID" />
          <event value="8017" opcode="win:Info" level="win:Informational" symbol="ShareBroker_CancelBackgroundWorkItem" keywords="Share DevPlatCircular" message="$(string.ShareBroker.CancelBackgroundWorkItem)" template="Template_GUID" />
          <event value="8018" opcode="win:Info" level="win:Error" symbol="ShareBroker_CancelBackgroundWorkItemFailed" keywords="Share DevPlatCircular" message="$(string.ShareBroker.CancelBackgroundWorkItemFailed)" template="Template_GUID_UInt32" />
          <event value="8019" opcode="win:Start" task="LogTrace" level="win:Informational" symbol="ShareBroker_BeginDataPackageClone" keywords="Share Performance DevPlatCircular" message="$(string.ShareBroker.BeginDataPackageClone)" />
          <event value="8020" opcode="win:Stop" task="LogTrace" level="win:Informational" symbol="ShareBroker_EndDataPackageClone" keywords="Share Performance DevPlatCircular" message="$(string.ShareBroker.EndDataPackageClone)" />
          <event value="8021" opcode="win:Info" level="win:Error" symbol="ShareBroker_ReleaseDeferralFailed" keywords="Share DevPlatCircular" message="$(string.ShareBroker.ReleaseDeferralFailed)" template="Template_UInt32" />
          <event value="8022" opcode="win:Info" level="win:Informational" symbol="ShareBroker_ShareUICancelled" keywords="Share DevPlatCircular" message="$(string.ShareBroker.ShareUICancelled)" />

          <!-- Modern Resource Enforcer 8200 -->

          <event value="8200"
            symbol="RE_SetApplicationPropertiesFailed"
            opcode="win:Info"
            level="win:Error"
            keywords="DevPlatCircular SelfHostCritical"
            template="RETemplate_SetApplicationProperties"
            message="$(string.ModernResourceEnforcer.RE_SetApplicationPropertiesFailed)" />

          <event value="8201"
            symbol="RE_QueryApplicationPropertiesFailed"
            opcode="win:Info"
            level="win:Error"
            keywords="DevPlatCircular SelfHostCritical"
            template="RETemplate_QueryApplicationPropertiesFail"
            message="$(string.ModernResourceEnforcer.RE_QueryApplicationPropertiesFailed)" />

          <event value="8202"
            symbol="RE_QueryMemoryUsageFailed"
            opcode="win:Info"
            level="win:Error"
            keywords="DevPlatCircular"
            template="RETemplate_QueryMemoryUsage"
            message="$(string.ModernResourceEnforcer.RE_QueryMemoryUsageFailed)" />

          <event value="8203"
            symbol="RE_QuerySharedCommitFailed"
            opcode="win:Info"
            level="win:Error"
            keywords="DevPlatCircular"
            template="RETemplate_QueryMemoryUsage"
            message="$(string.ModernResourceEnforcer.RE_QuerySharedCommitFailed)" />

          <event value="8204"
            symbol="RE_SetApplicationProperties"
            opcode="win:Info"
            level="win:Verbose"
            keywords="DevPlatCircular"
            template="RETemplate_SetApplicationProperties"
            message="$(string.ModernResourceEnforcer.RE_SetApplicationProperties)" />

          <event value="8205"
            symbol="RE_QueryApplicationProperties"
            opcode="win:Info"
            level="win:Verbose"
            keywords="DevPlatCircular"
            template="RETemplate_QueryApplicationProperties"
            message="$(string.ModernResourceEnforcer.RE_QueryApplicationProperties)" />

          <!-- ModernEnforcer : Notifications -->
          <event value="8210"
            symbol="RE_HandleGroupOwnershipNotification"
            opcode="win:Info"
            level="win:Verbose"
            keywords="DevPlatCircular"
            template="RETemplate_HandleGroupOwnershipNotification"
            message="$(string.ModernResourceEnforcer.RE_HandleGroupOwnershipNotification)" />

          <event value="8211"
            symbol="RE_HandleHostEmptyNotification"
            opcode="win:Info"
            level="win:Verbose"
            keywords="DevPlatCircular"
            template="RETemplate_HandleHostEmptyNotification"
            message="$(string.ModernResourceEnforcer.RE_HandleHostEmptyNotification)" />

          <event value="8212"
            symbol="RE_PsmApplicationStateNotification"
            opcode="win:Info"
            level="win:Verbose"
            keywords="DevPlatCircular"
            template="RETemplate_PsmApplicationStateNotification"
            message="$(string.ModernResourceEnforcer.RE_PsmApplicationStateNotification)" />

          <event value="8213"
            symbol="RE_PsmHostStateNotification"
            opcode="win:Info"
            level="win:Verbose"
            keywords="DevPlatCircular"
            template="RETemplate_PsmHostStateNotification"
            message="$(string.ModernResourceEnforcer.RE_PsmHostStateNotification)" />

          <!-- Component:Generic:10000 -->
          <event value="10001" opcode="win:Info" level="win:Informational" symbol="GenericTraceFunctionError" message="$(string.Format.GenericTraceFunctionError)" keywords="DevPlatCircular" template="Template__p1_UnicodeString_Default__p2_HexInt32_Default" />
            
          <!-- Component:PlatformInterop:9000 -->
          <event value="9000" level="win:Verbose" symbol="PlatformInterop_Debug_Trace" template="Template_String" keywords="PlatformInterop DevPlatCircular" message="$(string.Format.Generic)" />
          <event value="9001" level="win:Error" symbol="PlatformInterop_Error" template="Template_String" keywords="PlatformInterop DevPlatCircular Error" message="$(string.PlatformInterop.Error)" />
          <event value="9002" level="win:Verbose" symbol="PlatformInterop_Method_Exit" template="Template_String_UInt32" keywords="PlatformInterop DevPlatCircular" message="$(string.PlatformInterop.MethodExitMessage)" />
        </events>
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <!-- Keywords -->
        <string id="Keyword.Error" value="Error" />
        <string id="Keyword.Performance" value="Performance" />
        <string id="Keyword.Generic" value="Generic" />
        <string id="Keyword.Common" value="Common" />
        <string id="Keyword.PacMan" value="PacMan" />
        <string id="Keyword.ResMan" value="ResMan" />
        <string id="Keyword.DeviceReg" value="DeviceReg" />
        <string id="Keyword.Bss" value="Bss" />
        <string id="Keyword.Sqm" value="Sqm" />
        <string id="Keyword.ShareBroker" value="ShareBroker" />
        <string id="Keyword.BatterySense" value="Battery Sense" />
        <string id="Keyword.PlatformInterop" value="PlatformInterop" />
        <string id="Keyword.ProductionCircular" value="Production Circular" />
        <string id="Keyword.ProductionCritical" value="Production Critical" />
        <string id="Keyword.SelfHostCircular" value="SelfHost Circular" />
        <string id="Keyword.SelfHostCritical" value="SelfHost Critical" />
        <string id="Keyword.DevPlatCircular" value="DevPlat Circular" />
        <string id="Keyword.BTPolicy" value="Background Transfer Policy" />
        <string id="Keyword.BAPolicy" value="Background Audio Policy" />
        <!-- String tracing formats -->
        <string id="Format.Generic" value="%1" />
        <string id="Format.Verbose" value="[Verbose]: %1" />
        <string id="Format.Info" value="[Info]: %1" />
        <string id="Format.Warning" value="[Warning]: %1" />
        <string id="Format.Error" value="[Error]: %1" />
        <!-- Custom formats-->
        <string id="Format.FailFast" value="*** FailFast ***   %1" />
        <string id="Format.CHRLog" value="CHRLog" />
        <string id="Format.TaskStart" value="Task: %1 has started" />
        <string id="Format.TaskSuspend" value="Task: %1 has paused" />
        <string id="Format.TaskResume" value="Task: %1 has resumed" />
        <string id="Format.TaskStop" value="Task: %1 has completed" />
        <string id="Format.EM_BeginGetTaskInfo" value="EM: +GetTaskInfo()" />
        <string id="Format.EM_EndGetTaskInfo" value="EM: -GetTaskInfo(). HRESULT = %1" />
        <string id="Format.EM_GetAppInfo" value="EM: GetAppInfo:%1,%2:%3" />
        <string id="Format.EM_ParseBackgroundAbilities" value="EM: ParseBackgroundAbilities - HRESULT=%1" />
        <string id="Format.EM_BeginExecManServerHostCreateProcess" value="EM: +ExecManServerHost::CreateProcess" />
        <string id="Format.EM_EndExecManServerHostCreateProcess" value="EM: -ExecManServerHost::CreateProcess. HRESULT=%1" />
        <string id="Format.Sqm.AppUsage" value="Sqm::AppPlatSqmAppDataUsage: %1/%2 - TaskID = %3, Type = %4, NewState = %5, ReasonForStateChange = %6, Duration (ms) = %7, PeakMemory (kb) = %8" />
        <string id="Format.Emc.StartTaskCallbackBegin" value="Emc::ExecuteCommand: StartTaskCallbackBegin: TaskID = %1" />
        <string id="Format.Emc.StartTaskCallbackEnd" value="Emc::ExecuteCommand: StartTaskCallbackEnd: TaskID = %1, HR = %2" />
        <string id="Format.Emc.PauseTaskCallbackBegin" value="Emc::ExecuteCommand: PauseTaskCallbackBegin: TaskID = %1" />
        <string id="Format.Emc.PauseTaskCallbackEnd" value="Emc::ExecuteCommand: PauseTaskCallbackEnd: TaskID = %1, HR = %2" />
        <string id="Format.Emc.ResumeTaskCallbackBegin" value="Emc::ExecuteCommand: ResumeTaskCallbackBegin: TaskID = %1" />
        <string id="Format.Emc.ResumeTaskCallbackEnd" value="Emc::ExecuteCommand: ResumeTaskCallbackEnd: TaskID = %1, HR = %2" />
        <string id="Format.Emc.ControlTaskCallbackBegin" value="Emc::ExecuteCommand: ControlTaskCallbackBegin: TaskID = %1" />
        <string id="Format.Emc.ControlTaskCallbackEnd" value="Emc::ExecuteCommand: ControlTaskCallbackEnd: TaskID = %1, HR = %2" />
        <string id="Format.Emc.CancelTaskCallbackBegin" value="Emc::ExecuteCommand: CancelTaskCallbackBegin: TaskID = %1" />
        <string id="Format.Emc.CancelTaskCallbackEnd" value="Emc::ExecuteCommand: CancelTaskCallbackEnd: TaskID = %1, HR = %2" />
        <string id="Format.Emc.BackgroundExecutionTaskCallbackBegin" value="Emc::ExecuteCommand: BackgroundExecutionTaskCallbackBegin: TaskID = %1" />
        <string id="Format.Emc.BackgroundExecutionTaskCallbackEnd" value="Emc::ExecuteCommand: BackgroundExecutionTaskCallbackEnd: TaskID = %1, HR = %2" />
        <string id="Format.Emc.RegisterBackgroundExecutionRequest" value="Emc::RegisterBackgroundExecutionRequest: TaskID = %1, ExecutionType = %2, HR = %3" />
        <string id="Format.Emc.DeregisterBackgroundExecutionRequest" value="Emc::DeregisterBackgroundExecutionRequest: TaskID = %1, ExecutionType = %2, Reason = %3, HR = %4" />
        <string id="Format.Emc.EnsureXbfForCurrentLocaleBegin" value="Emc::EnsureXbfForCurrentLocale: EnsureXbfForCurrentLocaleBegin: ProductID = %1" />
        <string id="Format.Emc.EnsureXbfForCurrentLocaleEnd" value="Emc::EnsureXbfForCurrentLocale: EnsureXbfForCurrentLocaleEnd: ProductID = %1" />
        <string id="Format.EM_SkipTerminateProcess" value="EM: Skipping terminate process call for %1" />
        <string id="Format.EM_TerminateProcess" value="EM: Terminating process: PID = %1, ExitCode = %2" />
        <string id="Format.FTM_NotifyTaskComplete" value="FTM: NotifyTaskInstanceCompleted TaskID=%1 HRESULT=%2" />
        <string id="Format.FTM_NotifyTaskPaused" value="FTM: NotifyTaskInstancePaused TaskID=%1 HRESULT=%2" />
        <string id="Format.FTM_NotifyTaskRunning" value="FTM: NotifyTaskInstanceRunning TaskID=%1 HRESULT=%2" />
        <string id="Format.FTM_SendTaskStatusChange" value="FTM: SendTaskStatusChange TaskID=%1 Status=%2 HRESULT=%3" />
        <string id="Format.FTM_NotifyTaskHostCompleted" value="FTM: NotifyTaskHostCompleted HRESULT=%1" />
        <string id="Format.FTM_DiscardFrozenHost" value="FTM: Discarding NotifyTaskHostFrozen notification because the host isn't really frozen" />
        <string id="Format.FTM_NotifyTaskHostFrozen" value="FTM: NotifyTaskHostFrozen PID=%1 HRESULT=%2" />
        <string id="Format.FTM_NotifyTaskHostDehydrated" value="FTM: NotifyTaskHostDehydrated HRESULT=%1" />
        <string id="Format.FTM_RegisterCallback" value="FTM: Registering callback %1 HRESULT=%2" />
        <string id="Format.FTM_NewDehydrationSuppressingTask" value="FTM: New Task %1 is dehydration-suppressing" />
        <string id="Format.FTM_ApplyDehydrationSuppressingPolicy" value="FTM: Applying Dehydration-Suppressing Policy to Host PID %1" />
        <string id="Format.FTM_RevokeDehydrationSuppressingPolicy" value="FTM: Revoking Dehydration-Suppressing Policy to Host PID %1" />
        <string id="Format.FTM_BeginLaunchTask" value="FTM: +LaunchTask TaskURI=%1 LaunchFlags=%2" />
        <string id="Format.FTM_EndLaunchTask" value="FTM: -LaunchTask TaskURI=%1 TaskID=%2 PID=%3 HRESULT=%4" />
        <string id="Format.FTM_ResumeTask" value="FTM: ResumeTask TaskID=%1 HRESULT=%2" />
        <string id="Format.FTM_RemovingFGResources" value="FTM: Removing Foreground Resources from TaskID=%1" />
        <string id="Format.FTM_SetForegroundTaskInstanceId" value="FTM: SetForegroundTaskInstanceId TaskID=%1 HRESULT=%2" />
        <string id="Format.FTM_PauseTask" value="FTM: PauseTask TaskID=%1 HRESULT=%2" />
        <string id="Format.FTM_CancelTask" value="FTM: CancelTask TaskID=%1 Frozen=%2 HRESULT=%3" />
        <string id="Format.FTM_IgnoreAbort" value="FTM: AbortTask being ignored because the task is completed TaskID=%1" />
        <string id="Format.FTM_AbortTask" value="FTM: AbortTask TaskID=%1 Reason=%2 HRESULT=%3" />
        <string id="Format.FTM_SetTaskDehydrationEligibility" value="FTM: SetTaskDehydrationEligibility TaskID=%1 State=%2 HRESULT=%3" />
        <string id="Format.FTM_RequestProcessBackgroundExecution" value="FTM: RequestProcessBackgroundExecution type=%1 Pid=%2 HRESULT=%3" />
        <string id="Format.FTM_CancelProcessBackgroundExecution" value="FTM: CancelProcessBackgroundExecutionRequest type=%1 Pid=%2 HRESULT=%3" />
        <string id="Format.FTM_TaskRunningInBackground" value="FTM: TaskRunningInBackground TaskID=%1 PID=%2  HRESULT=%3" />
        <string id="Format.FTM_TaskRunningInForeground" value="FTM: TaskRunningInForeground TaskID=%1 PID=%2  HRESULT=%3" />
        <string id="Format.FTM_ChangeActivationPolicyResumeForBG" value="FTM: Changing activation policy to resume due to BG Execution for ProductID %1" />
        <string id="Format.FTM_OnShutdownComplete" value="FTM: OnShutdownCompleted" />
        <string id="Format.FTM_IgnoreWatchdog" value="FTM: Ignoring expired watchdog for task %1 because it is being debugged." />
        <string id="Format.FTM_RunInBGExpired" value="FTM: Watchdog fired for task %1 while running in background. Pausing Task." />
        <string id="Format.FTM_BGDeniedNotRunning" value="FTM: Request BG Execution Denied because it wasn't running. TaskID=%1" />
        <string id="Format.FTM_BGDeniedProductForbidden" value="FTM: Request BG Execution Denied because product was forbidden. TaskID=%1" />
        <string id="Format.FTM_BGDeniedNoBGManifest" value="FTM: Request BG Execution Denied because task didn't have BG abilities in its manifest. TaskID=%1" />
        <string id="Format.FTM_BGDeniedNoResources" value="FTM: Request BG Execution Denied due to lack of resources. TaskID=%1" />
        <string id="Format.FTM_BGDeniedBatteryPolicy" value="FTM: Request BG Execution Denied because battery policy prevented it. TaskID=%1" />
        <string id="Format.FTM_RequestBGAccess" value="FTM: RequestBGAccess IsAllowed=%1 TaskID=%2 HRESULT=%3" />
        <string id="Format.FTM_RemoveBGAccess" value="FTM: RemoveBGRequest RequestedRemoval=%1 ActualRemoval=%2 TaskID=%3 HRESULT=%4" />
        <string id="Format.FTM_ForbidBG" value="FTM: ForbidBackgroundExecution for ProductID %1. HRESULT=%2" />
        <string id="Format.FTM_AllowBG" value="FTM: AllowBackgroundExecution for ProductID %1. HRESULT=%2" />
        <string id="Format.FTM_NoBGDueToMemory" value="FTM: Process is using too much memory for BG Execution. PID=%1, MemUsage=%2, RequiredMemUsage=%3" />
        <string id="Format.FTM_StopBGOOM" value="FTM: Removing BG capability from Task ID %1 due to OOM" />
        <string id="Format.FTM_NewBatterySaverState" value="FTM: Battery Saver State has change. New state = %1" />
        <string id="Format.FTM_NewBGRequestDueToBatterySaverState" value="FTM: Attempted new BG Execution request due to battery state change. TaskID=%1" />
        <string id="Format.FTM_IsValidTaskInstancePid" value="FTM: IsValidTaskInstancePid TaskID=%1 Pid=%2 fValid=%3 HRESULT=%4" />
        <string id="Format.FTM_DetermineChildTaskResourceSet" value="FTM: DetermineBestResourceSet for child ProductID=%1 LaunchFlags=%2 ResourceSetType=%3" />
        <string id="Format.FTM_ResourceSetRevoked" value="FTM: OnRelease ResourceSet TaskID=%1 ResouceSet=%2 HRESULT=%3" />
        <string id="Format.FTM_AcquireNetworkRefFailure" value="FTM:UITask Call to Acquire network reference failed CM_RESULT=%1" />
        <string id="Format.FTM_ReleaseNetworkRefFailure" value="FTM:UITask Call to Release network reference failed CM_RESULT=%1" />

        <!-- AppResolverUI -->
        <string id="Format.AppResolver_RetrieveCandidates_Message" value="[Error in AppResolverUI]: AppResolverUI::RetrieveCandidates URI = %1, HRESULT = %2" />
        <string id="Format.AppResolver_InitializeFromResolverCandidate_Message" value="[Error in AppResolverUI]: AppItem::InitializeFromResolverCandidate URI = %1, HRESULT = %2" />
        <!-- BSS -->
        <string id="Format.Bss.NotificationEvent" value="Bss: %6 - ProductId = %1, NotificationId = %2, Name = '%3', Type = %4, state = %5" />
        <string id="Format.Bss.NotificationEventAgentId" value="Bss: %6 - ProductId = %1, NotificationId = %2, Name = '%3', Type = %4, state = %5, AgentId = %7" />
        <string id="Format.Bss.NotificationEventAgentIdHr" value="Bss: %6 - ProductId = %1, NotificationId = %2, Name = '%3', Type = %4, state = %5, AgentId = %7, HR = %8" />
        <string id="Format.Bss.EventHandlerThreadProc" value="Bss::EventHandlerThreadProc: dwObjectState = %1, exitCheckAllThread = %2, lastError = %3" />
        <string id="Format.Bss.LocationPrefetchStart" value="Bss::FetchLocation: Start" />
        <string id="Format.Bss.LocationPrefetchEnd" value="Bss::FetchLocation: End" />
        <string id="Format.Bss.OnIdleSessionWakeupEvent" value="Bss::EventHandlerThreadProc: First launch event for OnIdle tasks (%1 -&gt; %2)" />
        <string id="Format.Bss.ServiceStart" value="Bss: Service Start - HR = %1" />
        <string id="Format.Bss.ServiceStop" value="Bss: Service Stop - HR = %1" />
        <string id="Format.Bss.OnIdleSessionStart" value="Bss::EventHandlerThreadProc: Launched OnIdle tasks" />
        <string id="Format.Bss.OnIdleSessionStop" value="Bss::EventHandlerThreadProc: OnIdle end event - WAIT_OBJECT = %1" />
        <string id="Format.Bss.EventHandlerThreadProcOnIdleStart" value="Bss::EventHandlerThreadProc: dwObjectState = %1, exitCheckAllThread = %2, lastError = %3" />
        <string id="Format.Bss.SentAimCancelRequest" value="Bss::AimProxyCancelTaskAgent: Sent requested to AIM to cancel task (AgentId = %1)" />
        <string id="Format.Bss.DisableSchedulesForDebugSession" value="Bss::DisableSchedulesForDebugSessionStart" />
        <string id="Format.Bss.EnableSchedulesForDebugSession" value="Bss::EnableSchedulesForDebugSessionEnd" />
        <string id="Format.Bss.EnableTaskNotification" value="Bss::EnableTaskNotification: NotificationType = %1, fEnable = %2" />
        <string id="Format.Bss.HandleNetworkOnEventForKeepAliveAgentNoNetwork" value="Bss::HandleNetworkOnEventForKeepAliveAgent: No network. False alarm network on event" />
        <string id="Format.Bss.HandlePeriodicEventForKeepAliveAgentNoNetwork" value="Bss::HandlePeriodicEventForKeepAliveAgent: No network" />
        <string id="Format.Bss.CancelAllPendingAsyncRequestsStart" value="Bss::CancelAllPendingAsyncRequests: Begin cancel all pending requests" />
        <string id="Format.Bss.CancelAllPendingAsyncRequestsEnd" value="Bss::CancelAllPendingAsyncRequests: Finished cancel all pending requests" />
        <string id="Format.Bss.AsyncFetchLoopExit" value="Bss::BNSSLocationFetcher::AsyncFetchLoop: Worker thread exiting normally as instance is being destroyed" />
        <string id="Format.Bss.AsyncFetchLoopError" value="Bss::BNSSLocationFetcher::AsyncFetchLoop: Error, unexpected wait return: %1. Worker thread will now exit!" />
        <string id="Format.Bss.RequestFetchLocationDelaying" value="Bss::BNSSLocationFetcher::RequestFetchLocation: Delaying fetch request for %1 msecs" />
        <string id="Format.Bss.RequestFetchLocationUseCached" value="Bss::BNSSLocationFetcher::RequestFetchLocation: Use cached location (is recent enough)" />
        <string id="Format.Bss.RequestFetchLocationFresh" value="Bss::BNSSLocationFetcher::RequestFetchLocation: Fetched a fresh location (cached is too old)" />
        <string id="Format.Bss.LaunchScheduledTaskExSkipLaunch" value="Bss::LaunchScheduledTaskEx: Skip for %1 because the recurring interval (%2/%3) is not reached" />
        <string id="Format.Bss.CHRLog" value="Bss: [%1:%2] %3" />
        <!-- PacMan -->
        <string id="PacMan.ReBind" value="Attempting to rebind again because first round failed: %1" />
        <string id="PacMan.BindFileEnd" value="Bind complete for HANDLE %1 and %2 now active" />
        <string id="PacMan.BindFileWait" value="Saturated and waiting with %1 now active" />
        <string id="PacMan.BindFileSkipWithNoFiles" value="Starting bind skipped: no files. %1 now active" />
        <string id="PacMan.BindFileSkip" value="Starting bind skipped: %1 isSmall = %2. %3 now active" />
        <string id="PacMan.BindFileStart" value="Starting bind returned on %1 with HANDLE %2 and %3 now active" />
        <string id="PacMan.BindStart" value="Starting with %1 files" />
        <string id="PacMan.VisualElementsProcessWindowsPhoneReservedAppInfo" value="Found WindowsPhoneReservedAppInfoHelper: IsPinableOnKidZone = %1, ExemptFromEnterpriseAllowDenyPolicy = %2, DeploymentAppEnumerationHubFilter = %3" />
        <string id="PacMan.LockdownFeatureEnabledWithoutExports" value="Lockdown extended feature enabled, but implementation binary does not export LockDownMgrIsAppAllowed" />
        <string id="PacMan.SendTokenNotificationTileUpdatedByProcessId" value="Tile update by ProcessID %1" />
        <string id="PacMan.AppXSetVolumeStatus" value="SetVolumeStatus: VolumePath[%1], Online[%2], hr:0x%3" />
        <string id="PacMan.AppxDownload" value="AppxRangeDownload offset[%1] size[%2] hr[%3]" />
        <string id="PacMan.FailedToStoreActivityContext" value="Unable to Store the ActivityContext for %1 during %2 - %3" />
        <string id="PacMan.CreateUpdateRequest" value="CreateUpdateRequest: ProductID=%1, ApplicationFlags=%2, hr=%3" />
        <string id="PacMan.CreateUninstallRequest" value="CreateUninstallRequest: ProductID=%1, ApplicationFlags=%2, hr=%3" />
        <string id="PacMan.CreateInstallRequest" value="CreateInstallRequest: ProductID=%1, ApplicationFlags=%2, hr=%3" />
        <string id="PacMan.AppMaintenanceTaskRun" value="AppMaintenanceTask, ProductID=%1, InstanceID=%2, hrReindex=%3, hrRebind=%4" />
        <string id="PacMan.AppStateChangeTaskStart" value="AppStateChangeTask starts" />
        <string id="PacMan.BindDeferredMdilBinaries" value="BindDeferredMdilBinaries: hr=%1" />
        <string id="PacMan.UpdateAppPushNotification" value="AppStateChangeTask::UpdateAppPushNotification: ProductID=%1, fEnable=%2, hr=%3" />
        <string id="PacMan.AppStateChangeTaskOnAppStateChange" value="AppStateChangeTask::OnAppStateChange: ProductID=%1, State=%2, hr=%3" />
        <string id="PacMan.SDCleanupTaskDeleteUnknownFolder" value="SDCleanupTask delete unknown folder: %1" />
        <string id="PacMan.SDCleanupTaskDisableSDApp" value="SDCleanupTask disable SD app: %1" />
        <string id="PacMan.SDCleanupTaskRollbackJunkFolder" value="SDCleanupTask rollback Junk folder: %1 =&gt; %2" />
        <string id="PacMan.ShellReady" value="ShellReady callback" />
        <string id="PacMan.SDCardPresenceInfoChangeCallback" value="SDCardPresenceInfoChangeCallback" />
        <string id="PacMan.SubscribeToSDCardNotifications" value="SubscribeToSDCardNotifications hr=%1" />
        <string id="PacMan.SDCleanupTaskWorkerStart" value="SDCleanupTaskWorker starts" />
        <string id="PacMan.StartSDCleanupTask" value="StartSDCleanupTask" />
        <string id="PacMan.OnSDCardStateChange" value="OnSDCardStateChange: StorageID=%1, fPresent=%2" />
        <string id="PacMan.InitializePackageManager" value="InitializePackageManager, hr=%1" />
        <string id="PacMan.VisualElementsDEHExtSetManifestPath" value="Setting manifest path: %1" />
        <string id="PacMan.ClientCreateNotificationManager" value="[PMNCLIENT] CoCreating a new notification manager (%1)" />
        <string id="PacMan.ClientNotificationThreadExits" value="[PMNCLIENT] Client listener thread exiting (%1)" />
        <string id="PacMan.ClientNotificationTypeWithAMap" value="[PMNCLIENT] Received client notification %1: ProductID=%2, Size=%3" />
        <string id="PacMan.ClientNotificationThreadStarts" value="[PMNCLIENT] Client listener thread starting" />
        <string id="PacMan.AppInstallCSPSetInstallTypeWithAMap" value="PM: AppInstallCSP::SetInstallType: %1" />
        <string id="PacMan.AppInstallCSPSetPayloadID" value="PM: AppInstallCSP::SetPayloadID: %1" />
        <string id="PacMan.AppInstallCSPSetOfferID" value="PM: AppInstallCSP::SetOfferID: %1" />
        <string id="PacMan.AppInstallCSPSetInstanceID" value="PM: AppInstallCSP::SetInstanceID: %1" />
        <string id="PacMan.AppInstallCSPSetLicensePath" value="PM: AppInstallCSP::SetLicensePath: %1" />
        <string id="PacMan.AppInstallCSPSetDependencyPackages" value="PM: AppInstallCSP::SetDependencyPackages: %1" />
        <string id="PacMan.AppInstallCSPSetPackagePath" value="PM: AppInstallCSP::SetPackagePath: %1" />
        <string id="PacMan.AppInstallCSPSetAltPackagePathOnSystem" value="PM: AppInstallCSP::SetAltPackagePathOnSystem: %1, File exists: %2" />
        <string id="PacMan.AppInstallCSPSetAltPackagePathOnData" value="PM: AppInstallCSP::SetAltPackagePathOnData: %1, File exists: %2" />
        <string id="PacMan.AppInstallCSPInvalidPackagePathOnData" value="PM: AppInstallCSP::SetAltPackagePathOnData, Invalid Prefix in Path: %1, HR = %2" />
        <string id="PacMan.AppInstallCSPSetProductID" value="PM: AppInstallCSP::SetProductID: %1" />
        <string id="PacMan.AppInstallCSPSetUninstallDisabled" value="PM: AppInstallCSP::SetUninstallDisabled: %1" />
        <string id="PacMan.AppInstallCSPSetIsBundle" value="PM: AppInstallCSP::SetIsBundle: %1" />
        <string id="PacMan.AppInstallCSPSetFullyPreInstall" value="PM: AppInstallCSP::SetFullyPreInstall: %1" />
        <string id="PacMan.AppInstallCSPSetForceUpdate" value="PM: AppInstallCSP::SetForceUpdate: %1" />
        <string id="PacMan.AppInstallCSPSetDeferMdilBind" value="PM: AppInstallCSP::SetDeferMdilBind: %1" />
        <string id="PacMan.AppInstallCSPReadLicenseFile" value="PM: AppInstallCSP::Read license file [%1], HR = %2" />
        <string id="PacMan.WnsRegistrationRemoveTemporaryRegistration" value="WnsRegistrationActivity::RemoveTemporaryRegistration: %1 - %2" />
        <string id="PacMan.WnsRegistrationAddTemporaryRegistration" value="WnsRegistrationActivity::AddTemporaryRegistration: %1 - %2" />
        <string id="PacMan.WnsRegistrationDeRegister" value="WnsRegistrationActivity::DeRegister: %1 - %2" />
        <string id="PacMan.WnsRegistrationRegister" value="WnsRegistrationActivity::Register: %1 - %2" />
        <string id="PacMan.WnsRegistrationImpersonateUser" value="ImpersonateUserHelper Failed: %1" />
        <string id="PacMan.BackupRestoreActivityIsRollbackNeeded" value="BackupRestoreActivity::IsRollbackNeeded: %1 for %2" />
        <string id="PacMan.BackupRestoreActivityRollback" value="BackupRestoreActivity::Rollback %1" />
        <string id="PacMan.BackupRestoreBeginActivityExecute" value="BackupRestoreActivity::Execute: %1" />
        <string id="PacMan.StopServicingIgnorableError" value="FinishedServiceOfPackage returned ignorable error, ProductID=%1" />
        <string id="PacMan.PM_MDILMaintenanceErrorCode" value="MDIL maintenance fails, ProductID=%1 Error=%2 File=%3" />
        <string id="PacMan.PacManCriticalInfo" value="PM: [Critical] %1:%2" />
        <string id="PacMan.ShellServiceHostIgnorableError" value="CoCreateInstance of ShellServiceHost returned ignorable error REGDB_E_CLASSNOTREG, ProductID=%1" />
        <string id="Format.PM.ActivityExecution" value="PM: ActivityExecution ProductID: %1 [%2]: [%3]: [%4]:.hr : %5" />
        <string id="Format.PM.ActivityExecutionError" value="PM: ActivityExecution Error ProductID: %1 [%2]: [%3]: [%4]:.hr : %5" />
        <string id="Format.PM.MDILMaintenanceError" value="PM: MDILMaintenance failed ProductID: %1 hr: %2; %3" />
        <string id="Format.PM.MDILMaintenanceState" value="PM: MDILMaintenance %1 ProductID: %2 File: %3" />
        <string id="Format.PM.MDILMaintenance" value="PM: MDILMaintenance ProductID: %1" />
        <string id="Format.PM.XBFTimeout" value="PM: XBF Generation Timeout: ProductID: %1" />
        <string id="Format.PM.XBFFailed" value="PM: XBF Failed ProductID: %1 hr: %2" />
        <string id="Format.PM.InstallerInfo" value="PM: ProductID: [%1]|OrchestratorType: [%2]|AppType: [%3]" />
        <string id="Format.PM.Lifecycle" value="PM: %1 : ProductID: %2, Progress: %3, hr: %4, isLegacyXap: %5" />
        <string id="Format.PM.Tile" value="PM: %1 : ProductID: %2" />
        <string id="Format.PM.ConvertHR_Full" value="PM: %1:%2 : (hrInternal: %3 , hrExternal: %4) ProductID: %5" />
        <string id="Format.PM.ConvertHR" value="PM: %1:%2 : (hrInternal: %3 , hrExternal: %4)" />
        <string id="Format.PM.TraceError" value="PM: %1:%2 : hr: %3" />
        <string id="Format.PM.TraceError_ProductID" value="PM: %1:%2 : hr: %3 ProductID: %5" />
        <string id="Format.PM.TraceError_ESE" value="PM: %1:%2 : hr: %3 JET_ERR: %4" />
        <string id="Format.PM.Index_Rebuild_Required" value="Index deleted when attaching the Database, mark all tables for index refresh" />
        <string id="Format.PM.PacManRebuilding_Index_For_Table" value="Rebuilding indexes for Table: %s" />
        <string id="Format.PM.PacManRebuilding_Index" value="Table: %s Index: %s is being Rebuilt (Is JetSetCurrentIndex failure [%d])" />
        <string id="Format.PM.ChamberMaintenanceError" value="PM: ChamberMaintenance failed ProductID: %1 hr: %2" />
        <!-- StartBackupRestore -->
        <string id="StartBackupRestore.ReplacePlaceholderTiles" value="Modified placeholder tiles for ProductID %1, HR = %2" />
        <string id="StartBackupRestore.StageStartBackup" value="Applied StartBackup to staging location : HR = %1" />
        <string id="StartBackupRestore.ApplyStartBackup" value="Applied StartBackup from staging location : HR = %1" />
        <string id="StartBackupRestore.BackupStart" value="Backed up start : HR = %1" />
        <string id="StartBackupRestore.OriginateMessage" value="StartBackupRestore Error: %1 Location: %2 Line Number: %3" />
        <string id="StartBackupRestore.PropagateMessage" value="StartBackupRestore Error Propagated: %1 Location: %2 Line Number: %3" />
        <string id="StartBackupRestore.ReplacePlaceHolderTile" value="StartBackupRestore replaced PlaceHolderTileId %2 with new TileId %3 for ProductID %1, HR: %4" />
        <string id="StartBackupRestore.GetUnits" value="TileSettingHandler for Hub %1 returned %2 setting units for backup" />
        <string id="StartBackupRestore.ApplyUnit" value="TileSettingHandler restored SettingUnit %1 to staging area" />
        <string id="StartBackupRestore.OpenStream" value="TileSettingHandler returned DataStream for SettingUnit %1 for backup" />
        <string id="StartBackupRestore.BeginSession" value="TileSettingHandler started a new Backup or Restore Session, flags %1" />
        <string id="StartBackupRestore.EndSession" value="TileSettingHandler ended Session, IsRestoreSession? %1, Number of Failures %2,  Final HR: %3" />
        <string id="StartBackupRestore.RestoreTile" value="TileSettingHandler restored TileId %2 to PacMan for ProductId %1 with %3 image files" />
        <string id="StartBackupRestore.UpdateExistingTile" value="TileSettingHandler updating existing TileId %2 for ProductId %1 in PacMan" />
        <string id="StartBackupRestore.AddNewPlaceHolderTile" value="TileSettingHandler adding new placeholder TileId %2 in Template %3 for Product %1 on Hub %4" />
        <string id="StartBackupRestore.AddNewTile" value="TileSettingHandler adding new TileId %2 in Template %3 for ProductId %1 on Hub %4" />
        <string id="StartBackupRestore.RestoringImageFile" value="TileSettingHandler restoring image file %2 for ProductId %1" />
        <string id="StartBackupRestore.AddNewModernPlaceHolderTile" value="TileSettingHandler adding new Modern placeholder TileId %2 for Product %1 on Hub %3" />
        <string id="StartBackupRestore.AddNewModernTile" value="TileSettingHandler adding new Modern TileId %2 for AUMID %1 on Hub %3" />
        <string id="StartBackupRestore.RestorePropertyError" value="TileSettingHandler encountered error %5 restoring PropId %1, Value %2 for Product %3 TileId %4. Skipping." />
        <string id="StartBackupRestore.BackupAbsoluteImagePath" value="TileSettingHandler backed up Product %1 with an absolute path %2" />
        <string id="StartBackupRestore.RestoreTileFailed" value="TileSettingHandler failed to restore TileId %2 for Product %1, HR: %3" />
        <string id="StartBackupRestore.PlaceHolderTileUnpinned" value="PlaceHolder Tile %2 for Product %1 has been unpinned, HR: %3" />
        <string id="StartBackupRestore.UnavailableApp" value="App Product %1 in AppState %3 is unavailable for restore, creating placeholder for Tile %2" />
        <string id="StartBackupRestore.RegisterForNotifications" value="Register Product %1 Package %2 SecondaryTile %3 for WPN Notifications HR: %4" />
        <string id="StartBackupRestore.ResolveRawUriProperty" value="Resolving %1 which replaces %2 with %3" />
        <string id="StartBackupRestore.ResolvedRawUriPropertiesForTile" value="Resolved properties for %1 which returned HR=%2" />
        <!-- AppListBackupRestore -->
        <string id="AppListBackupRestore.AppInstall" value="AppList Restore enqueued app for install: ProductId %1, Params %2, HR: %3" />

          <string id="Maps.PLM.VisibilityState.Unknown" value="Unknown" />
          <string id="Maps.PLM.VisibilityState.Foreground" value="Foreground" />
          <string id="Maps.PLM.VisibilityState.Background" value="Background" />

          <!-- Background Transfer Policy-->
        <string id="BTPolicy.NetworkStatusChange" value="BTPolicy: Network Status CHange : isWifi=%1, isCellular=%2, isVoiceConflicting=%3" />
        <string id="BTPolicy.ForegroundAppChange" value="BTPolicy: Foreground App change AUMId = %1" />
        <string id="BTPolicy.CheckConditions" value="BTPolicy: Checkconditions, isWifi=%1, isCellular=%2, isVoiceConflicting=%3, isForegroundApp=%4, BatterySaverMode=%5, BatteryCharging=%6, isAboveQuota=%7" />
        <string id="BTPolicy.ClearPausedList" value="BTPolicy: Clear the paused transfer List as these entries are stale now" />
        <string id="BTPolicy.PauseBackgroundTransfers" value="BTPolicy: Pause all background transfers" />
        <string id="BTPolicy.ReschedulePausedTransfers" value="BTPolicy: Reschedule all paused transfers" />
        <string id="BTPolicy.EnterFunction" value="BTPolicy: Enter %1" />
        <string id="BTPolicy.ExitFunctionHr" value="BTPolicy: Exit %1, HR=%2" />
        <string id="BTPolicy.ApplicationUninstalled" value="BTPolicy: Application Uninstalled/Disabled AUMId = %1" />
        <string id="BTPolicy.ErrorOriginateEvent" value="BTPolicy: Error: %1 Location: %2 Line Number: %3" />
        <string id="BTPolicy.ErrorPropagateEvent" value="BTPolicy: Error: Propagated: %1 Location: %2 Line Number: %3" />
        <string id="BTPolicy.StartQuotaEpoch" value="BTPolicy: Starting a Quodata Epoch TotalTransferTime=%1" />
        <string id="BTPolicy.EndQuotaEpoch" value="BTPolicy: Ending a Quodata Epoch TotalTransferTime=%1" />
        <string id="BTPolicy.QuotaExhausted" value="BTPolicy: BT Time Quota exhausted" />
        <string id="BTPolicy.ResetQuota" value="BTPolicy: Reseting BT Time quota" />
        <string id="BTPolicy.ChargingStatusChange" value="BTPolicy: Battery Charging State changed isCharging=%1" />
        <string id="BTPolicy.LoadedRegistry" value="BTPolicy: Reset=%1, MaxTimeThreshold=%2, QuotaResetTime=%3 UsedQuota=%4" />
        <!-- Background Audio Policy-->
        <string id="BAPolicy.TimerExpired" value="BAPolicy: Inactivity Timer Expired" />
        <string id="BAPolicy.TimerStarted" value="BAPolicy: Inactivity Timer Started" />
        <string id="BAPolicy.TimerStopped" value="BAPolicy: Inactivity Timer Stopped" />
        <string id="BAPolicy.UpdateActiveForegroundStatus" value="BAPolicy: Update Foreground Active Status isActiveTaskForegroundRunning=%1 activeWorkItem=%2"/>
        <!-- Battery Sense -->
        <string id="BatterySense.GetSettings" value="BatterySense: Get Settings Max Slots %1, hr %2" />
        <string id="BatterySense.RequestExecution" value="BatterySense: Request Execution for product %1, request type %2, acquired state %3, hr %4" />
        <string id="BatterySense.StateChange" value="BatterySense: State changed product %1 from %2 to %3" />
        <string id="BatterySense.GetState" value="BatterySense: Get state product %1 to %2, hr %3" />
        <string id="BatterySense.SetState" value="BatterySense: Set state product %1 to %2, hr %3" />
        <string id="BatterySense.GetType" value="BatterySense: Get executiopn type product %1, execution type %2, hr %3" />
        <string id="BatterySense.SetType" value="BatterySense: Set executiopn type product %1, execution type %2, hr %3" />
        <string id="BatterySense.SendNotification" value="BatterySense: Send state change notification for product %1 to %2 pkg %3, listener count %4" />
        <string id="BatterySense.SendNotificationError" value="BatterySense: Send state change notification failed for handler %1, hr %2" />

        <string id="BatterySense.RegisterStateChangeHandler" value="BatterySense: Register state change handler %1, hr %2" />
        <string id="BatterySense.UnRegisterStateChangeHandler" value="BatterySense: UnRegister state change handler %1, hr %2" />
        <!-- Battery Sense map strings -->
        <string id="Maps.BatterySense.ExecutionState.UnInitialized" value="UnInitialized" />
        <string id="Maps.BatterySense.ExecutionState.Enabled" value="Enabled" />
        <string id="Maps.BatterySense.ExecutionState.Disabled" value="Disabled" />
        <string id="Maps.BatterySense.ExecutionState.AlwaysEnabled" value="AlwaysEnabled" />
        <string id="Maps.BatterySense.ExecutionState.Max" value="Unknown" />
        <string id="Maps.BatterySense.ExecutionType.None" value="None" />
        <string id="Maps.BatterySense.ExecutionType.Background_Full" value="Background-Full" />
        <string id="Maps.BatterySense.ExecutionType.Background_Limited" value="Background-Limited" />
        <!-- DevPlatMigrator -->
        <string id="DevPlatMigrator.MainFinish" value="DevPlat Migrator exitting: retVal = %1, hr = %2" />
        <string id="DevPlatMigrator.MainGetCancelNgenAndReindex" value="ParentBranchBuild/QFELevel matches so we are skipping ngen and reindex: %1 %2" />
        <string id="DevPlatMigrator.MainGetBuildInfoResults" value="Get new and old build info to compare: new = %1, old = %2" />
        <string id="DevPlatMigrator.MainGetBuildInfo" value="Get new and old build info to compare" />
        <string id="DevPlatMigrator.MainReadRegistryConfig" value="Read settings from registry: Config = %1, FailSetMaintenance = %2" />
        <string id="DevPlatMigrator.MainStart" value="DevPlat Migrator starting" />
        <!-- Map values -->
        <!-- PacMan Map values -->
        <!-- Map1 -->
        <string id="Maps.Descriptions.OR_EXECUTE" value="OR_EXECUTE" />
        <string id="Maps.Descriptions.OR_ROLLBACK" value="OR_ROLLBACK" />
        <string id="Maps.Descriptions.OR_CLEANUP" value="OR_CLEANUP" />
        <string id="Maps.Descriptions.OR_FORCEEXECUTE" value="OR_FORCEEXECUTE" />
        <!-- Map2 -->
        <string id="Maps.Descriptions.OR_INSTALL" value="OR_INSTALL" />
        <string id="Maps.Descriptions.OR_UPDATE" value="OR_UPDATE" />
        <string id="Maps.Descriptions.OR_UPDATE_LICENSE" value="OR_UPDATE_LICENSE" />
        <string id="Maps.Descriptions.OR_DBPROVISION_INSTALL" value="OR_DBPROVISION_INSTALL" />
        <string id="Maps.Descriptions.OR_DBPROVISION_UNINSTALL" value="OR_DBPROVISION_UNINSTALL" />
        <string id="Maps.Descriptions.OR_DBPROVISION_UPDATE" value="OR_DBPROVISION_UPDATE" />
        <string id="Maps.Descriptions.OR_FORCEUNINSTALL" value="OR_FORCEUNINSTALL" />
        <string id="Maps.Descriptions.OR_INSTALL_WORKER" value="OR_INSTALL_WORKER" />
        <string id="Maps.Descriptions.OR_STATEMACHINE_COUNT" value="OR_STATEMACHINE_COUNT" />
        <!-- Map3 -->
        <string id="Maps.Descriptions.AT_BEGIN_INSTALL" value="AT_BEGIN_INSTALL" />
        <string id="Maps.Descriptions.AT_BEGIN_UNINSTALL" value="AT_BEGIN_UNINSTALL" />
        <string id="Maps.Descriptions.AT_BEGIN_UPDATE" value="AT_BEGIN_UPDATE" />
        <string id="Maps.Descriptions.AT_BEGIN_DBPROVISION_INSTALL" value="AT_BEGIN_DBPROVISION_INSTALL" />
        <string id="Maps.Descriptions.AT_BEGIN_DBPROVISION_UNINSTALL" value="AT_BEGIN_DBPROVISION_UNINSTALL" />
        <string id="Maps.Descriptions.AT_BEGIN_DBPROVISION_UPDATE" value="AT_BEGIN_DBPROVISION_UPDATE" />
        <string id="Maps.Descriptions.AT_BEGIN_UPDATE_LICENSE" value="AT_BEGIN_UPDATE_LICENSE" />
        <string id="Maps.Descriptions.AT_BEGIN_REVOKE_LICENSE" value="AT_BEGIN_REVOKE_LICENSE" />
        <string id="Maps.Descriptions.AT_BEGIN_INSTALLER_WORKER" value="AT_BEGIN_INSTALLER_WORKER" />
        <string id="Maps.Descriptions.AT_BEGIN_SD_MOVE" value="AT_BEGIN_SD_MOVE" />
        <string id="Maps.Descriptions.AT_VERIFY_PACKAGE_SIGNATURE" value="AT_VERIFY_PACKAGE_SIGNATURE" />
        <string id="Maps.Descriptions.AT_CHAMBER_PROVISION" value="AT_CHAMBER_PROVISION" />
        <string id="Maps.Descriptions.AT_CHAMBER_REPROVISION" value="AT_CHAMBER_REPROVISION" />
        <string id="Maps.Descriptions.AT_CHAMBER_DEPROVISION" value="AT_CHAMBER_DEPROVISION" />
        <string id="Maps.Descriptions.AT_CHAMBER_SDMOVE_REPROVISION" value="AT_CHAMBER_SDMOVE_REPROVISION" />
        <string id="Maps.Descriptions.AT_INSTALLER_WORKER" value="AT_INSTALLER_WORKER" />
        <string id="Maps.Descriptions.AT_EXTRACT_PACKAGE" value="AT_EXTRACT_PACKAGE" />
        <string id="Maps.Descriptions.AT_MDIL_BIND" value="AT_MDIL_BIND" />
        <string id="Maps.Descriptions.AT_PARSE_MANIFEST" value="AT_PARSE_MANIFEST" />
        <string id="Maps.Descriptions.AT_PARSE_DBPROVISION_MANIFEST" value="AT_PARSE_DBPROVISION_MANIFEST" />
        <string id="Maps.Descriptions.AT_UPDATE_PARSE_MANIFEST" value="AT_UPDATE_PARSE_MANIFEST" />
        <string id="Maps.Descriptions.AT_UPDATE_PARSE_DBPROVISION_MANIFEST" value="AT_UPDATE_PARSE_DBPROVISION_MANIFEST" />
        <string id="Maps.Descriptions.AT_VERIFY_MANIFEST" value="AT_VERIFY_MANIFEST" />
        <string id="Maps.Descriptions.AT_CREATE_APP_FOLDER" value="AT_CREATE_APP_FOLDER" />
        <string id="Maps.Descriptions.AT_DELETE_APP_FOLDER" value="AT_DELETE_APP_FOLDER" />
        <string id="Maps.Descriptions.AT_UPDATE_APP_FOLDER" value="AT_UPDATE_APP_FOLDER" />
        <string id="Maps.Descriptions.AT_FORCE_DELETE_APP_FOLDER" value="AT_FORCE_DELETE_APP_FOLDER" />
        <string id="Maps.Descriptions.AT_MOVE_APP_FOLDER" value="AT_MOVE_APP_FOLDER" />
        <string id="Maps.Descriptions.AT_COPY_APP_FILES" value="AT_COPY_APP_FILES" />
        <string id="Maps.Descriptions.AT_MOVE_SD_FOLDER" value="AT_MOVE_SD_FOLDER" />
        <string id="Maps.Descriptions.AT_MOVE_SD_CLEANUP" value="AT_MOVE_SD_CLEANUP" />
        <string id="Maps.Descriptions.AT_RETRIEVE_APP_INFO" value="AT_RETRIEVE_APP_INFO" />
        <string id="Maps.Descriptions.AT_INSERT_DB_RECORDS" value="AT_INSERT_DB_RECORDS" />
        <string id="Maps.Descriptions.AT_DELETE_DB_RECORDS" value="AT_DELETE_DB_RECORDS" />
        <string id="Maps.Descriptions.AT_FORCE_DELETE_DB_RECORDS" value="AT_FORCE_DELETE_DB_RECORDS" />
        <string id="Maps.Descriptions.AT_UPDATE_DB_RECORDS" value="AT_UPDATE_DB_RECORDS" />
        <string id="Maps.Descriptions.AT_FINALIZE_DB_STATE" value="AT_FINALIZE_DB_STATE" />
        <string id="Maps.Descriptions.AT_FIX_INSERT_RECORD" value="AT_FIX_INSERT_RECORD" />
        <string id="Maps.Descriptions.AT_FIX_UPDATE_RECORD" value="AT_FIX_UPDATE_RECORD" />
        <string id="Maps.Descriptions.AT_FIX_UPDATE_LICENSE_RECORD" value="AT_FIX_UPDATE_LICENSE_RECORD" />
        <string id="Maps.Descriptions.AT_UPDATE_SD_MOVE_DB_RECORDS" value="AT_UPDATE_SD_MOVE_DB_RECORDS" />
        <string id="Maps.Descriptions.AT_ADD_LICENSE" value="AT_ADD_LICENSE" />
        <string id="Maps.Descriptions.AT_DELETE_LICENSE" value="AT_DELETE_LICENSE" />
        <string id="Maps.Descriptions.AT_FORCE_DELETE_LICENSE" value="AT_FORCE_DELETE_LICENSE" />
        <string id="Maps.Descriptions.AT_UPDATE_LICENSE" value="AT_UPDATE_LICENSE" />
        <string id="Maps.Descriptions.AT_INSTALL_UPDATED_LICENSE" value="AT_INSTALL_UPDATED_LICENSE" />
        <string id="Maps.Descriptions.AT_VERIFY_ENTERPRISE_ID" value="AT_VERIFY_ENTERPRISE_ID" />
        <string id="Maps.Descriptions.AT_CODEINTEGRITY" value="AT_CODEINTEGRITY" />
        <string id="Maps.Descriptions.AT_TERMINATE_UNINSTALL_APP" value="AT_TERMINATE_UNINSTALL_APP" />
        <string id="Maps.Descriptions.AT_TERMINATE_UPDATE_APP" value="AT_TERMINATE_UPDATE_APP" />
        <string id="Maps.Descriptions.AT_TERMINATE_SD_MOVE_APP" value="AT_TERMINATE_SD_MOVE_APP" />
        <string id="Maps.Descriptions.AT_DECRYPT_EXAP" value="AT_DECRYPT_EXAP" />
        <string id="Maps.Descriptions.AT_SQLCE_DB_REINDEX" value="AT_SQLCE_DB_REINDEX" />
        <string id="Maps.Descriptions.AT_FINISH_INSTALLER_WORKER" value="AT_FINISH_INSTALLER_WORKER" />
        <string id="Maps.Descriptions.AT_REGISTRY_PROVISIONING" value="AT_REGISTRY_PROVISIONING" />
        <string id="Maps.Descriptions.AT_REGISTRY_DEPROVISIONING" value="AT_REGISTRY_DEPROVISIONING" />
        <string id="Maps.Descriptions.AT_UPDATE_REGISTRY_PROVISIONING" value="AT_UPDATE_REGISTRY_PROVISIONING" />
        <string id="Maps.Descriptions.AT_XBF_GENERATOR" value="AT_XBF_GENERATOR" />
        <string id="Maps.Descriptions.AT_WNS_REGISTRATION" value="AT_WNS_REGISTRATION" />
        <string id="Maps.Descriptions.AT_WNS_DEREGISTRATION" value="AT_WNS_DEREGISTRATION" />
        <string id="Maps.Descriptions.AT_BEGIN_BACKUP_RESTORE" value="AT_BEGIN_BACKUP_RESTORE" />
        <string id="Maps.Descriptions.AT_FINISH_BACKUP_RESTORE" value="AT_FINISH_BACKUP_RESTORE" />
        <string id="Maps.Descriptions.AT_BEGIN_LIGHTUP_INSTALL" value="AT_BEGIN_LIGHTUP_INSTALL" />
        <string id="Maps.Descriptions.AT_CHECK_LIGHTUP_MANIFEST" value="AT_CHECK_LIGHTUP_MANIFEST" />
        <string id="Maps.Descriptions.AT_PROCESS_LIGHTUP" value="AT_PROCESS_LIGHTUP" />
        <string id="Maps.Descriptions.AT_STAGE_DATA" value="AT_STAGE_DATA" />
        <string id="Maps.Descriptions.AT_REGISTER_MODERN" value="AT_REGISTER_MODERN" />
        <string id="Maps.Descriptions.AT_BEGIN_LIGHTUP_UPDATE" value="AT_BEGIN_LIGHTUP_UPDATE" />
        <string id="Maps.Descriptions.AT_UNREGISTER_LIGHTUP" value="AT_UNREGISTER_LIGHTUP" />
        <string id="Maps.Descriptions.AT_MIGRATE_DATA" value="AT_MIGRATE_DATA" />
        <string id="Maps.Descriptions.AT_POLICY_CHECK" value="AT_POLICY_CHECK" />
        <string id="Maps.Descriptions.AT_PARSE_CACHE_TOKEN" value="AT_PARSE_CACHE_TOKEN" />
        <string id="Maps.Descriptions.AT_BEGIN_SD_LIGHTUP_MOVE" value="AT_BEGIN_SD_LIGHTUP_MOVE" />
        <string id="Maps.Descriptions.AT_SD_LIGHTUP_MOVE_STAGE" value="AT_SD_LIGHTUP_MOVE_STAGE" />
        <string id="Maps.Descriptions.AT_SD_LIGHTUP_MOVE_REPROVISION" value="AT_SD_LIGHTUP_MOVE_REPROVISION" />
        <string id="Maps.Descriptions.AT_SD_LIGHTUP_MOVE_PROCESS_RESOURCE_PATH" value="AT_SD_LIGHTUP_MOVE_PROCESS_RESOURCE_PATH" />
        <string id="Maps.Descriptions.AT_SD_LIGHTUP_MOVE_UPDATE_DB" value="AT_SD_LIGHTUP_MOVE_UPDATE_DB" />
        <string id="Maps.Descriptions.AT_SD_LIGHTUP_MOVE_MOVE_PACKAGE" value="AT_SD_LIGHTUP_MOVE_MOVE_PACKAGE" />
        <string id="Maps.Descriptions.AT_UNDEFINED" value="AT_UNDEFINED" />
        <!-- Map3 -->
        <string id="Maps.Descriptions.MDILSTART" value="MDIL Start" />
        <string id="Maps.Descriptions.MDILSTOP" value="MDIL Completed" />
        <!-- Map4 -->
        <string id="Maps.Descriptions.APPLICATION_INSTALL_NORMAL" value="PM_APPLICATION_INSTALL_NORMAL" />
        <string id="Maps.Descriptions.APPLICATION_INSTALL_IN_ROM" value="PM_APPLICATION_INSTALL_IN_ROM" />
        <string id="Maps.Descriptions.APPLICATION_INSTALL_PA" value="PM_APPLICATION_INSTALL_PA" />
        <string id="Maps.Descriptions.APPLICATION_INSTALL_DEBUG" value="PM_APPLICATION_INSTALL_DEBUG" />
        <string id="Maps.Descriptions.APPLICATION_INSTALL_ENTERPRISE" value="PM_APPLICATION_INSTALL_ENTERPRISE" />
        <string id="Maps.Descriptions.APPLICATION_INSTALL_INVALID" value="PM_APPLICATION_INSTALL_INVALID" />
        <!-- Map5 -->
        <string id="Maps.Descriptions.APP_INSTALL_STARTED" value="APP_INSTALL_STARTED" />
        <string id="Maps.Descriptions.APP_INSTALL_FINISHED" value="APP_INSTALL_FINISHED" />
        <string id="Maps.Descriptions.APP_UPDATE_STARTED" value="APP_UPDATE_STARTED" />
        <string id="Maps.Descriptions.APP_UPDATE_FINISHED" value="APP_UPDATE_FINISHED" />
        <string id="Maps.Descriptions.APP_UNINSTALL_STARTED" value="APP_UNINSTALL_STARTED" />
        <string id="Maps.Descriptions.APP_UNINSTALL_FINISHED" value="APP_UNINSTALL_FINISHED" />
        <string id="Maps.Descriptions.APP_UPDATELICENSE_STARTED" value="APP_UPDATELICENSE_STARTED" />
        <string id="Maps.Descriptions.APP_UPDATELICENSE_FINISHED" value="APP_UPDATELICENSE_FINISHED" />
        <string id="Maps.Descriptions.APP_DOWNLOAD_STARTED" value="APP_DOWNLOAD_STARTED" />
        <string id="Maps.Descriptions.APP_DOWNLOAD_INPROGRESS" value="APP_DOWNLOAD_INPROGRESS" />
        <string id="Maps.Descriptions.APP_DOWNLOAD_FINISHED" value="APP_DOWNLOAD_FINISHED" />
        <string id="Maps.Descriptions.APP_INSTALL_INPROGRESS" value="APP_INSTALL_INPROGRESS" />
        <string id="Maps.Descriptions.APP_UPDATE_INPROGRESS" value="APP_UPDATE_INPROGRESS" />
        <string id="Maps.Descriptions.APP_REVOKELICENSE_STARTED" value="APP_REVOKELICENSE_STARTED" />
        <string id="Maps.Descriptions.APP_REVOKELICENSE_FINISHED" value="APP_REVOKELICENSE_FINISHED" />
        <string id="Maps.Descriptions.APP_FRAMEWORK_INSTALL_STARTED" value="APP_FRAMEWORK_INSTALL_STARTED" />
        <string id="Maps.Descriptions.APP_FRAMEWORK_INSTALL_FINISHED" value="APP_FRAMEWORK_INSTALL_FINISHED" />
        <string id="Maps.Descriptions.APP_DISABLED_SD_CARD" value="APP_DISABLED_SD_CARD" />
        <string id="Maps.Descriptions.APP_DISABLED_ENTERPRISE" value="APP_DISABLED_ENTERPRISE" />
        <string id="Maps.Descriptions.APP_ENABLED" value="APP_ENABLED" />
        <string id="Maps.Descriptions.APP_MOVE_STARTED" value="APP_MOVE_STARTED" />
        <string id="Maps.Descriptions.APP_MOVE_INPROGRESS" value="APP_MOVE_INPROGRESS" />
        <string id="Maps.Descriptions.APP_MOVE_FINISHED" value="APP_MOVE_FINISHED" />
        <string id="Maps.Descriptions.APP_RESTORE_STARTED" value="APP_RESTORE_STARTED" />
        <string id="Maps.Descriptions.APP_RESTORE_FINISHED" value="APP_RESTORE_FINISHED" />
        <string id="Maps.Descriptions.APP_DISABLED_BACKING_UP" value="APP_DISABLED_BACKING_UP" />
        <string id="Maps.Descriptions.APP_DOWNLOAD_STATUS_UPDATE" value="APP_DOWNLOAD_STATUS_UPDATE" />
        <string id="Maps.Descriptions.APP_DISABLED_MDIL_BINDING" value="APP_DISABLED_MDIL_BINDING" />
        <!-- Map6 -->
        <string id="Maps.Descriptions.TILE_CREATED" value="TILE_CREATED" />
        <string id="Maps.Descriptions.TILE_DELETED" value="TILE_DELETED" />
        <string id="Maps.Descriptions.TILE_UPDATED" value="TILE_UPDATED" />
        <string id="Maps.Descriptions.TILE_APPVISIBLE" value="TILE_APPVISIBLE" />
        <string id="Maps.Descriptions.TILE_APPINVISIBLE" value="TILE_APPINVISIBLE" />
        <string id="Maps.Descriptions.TILE_PINNED" value="TILE_PINNED" />
        <string id="Maps.Descriptions.TILE_UNPINNED" value="TILE_UNPINNED" />
        <string id="Maps.Descriptions.TILE_MAX" value="TILE_MAX" />
        <string id="Maps.Descriptions.TILE_INVALID" value="TILE_INVALID" />
        <!-- End PacMan map values -->
        <string id="Maps.Descriptions.Sample1" value="Sample map value 1" />
        <string id="Maps.Descriptions.Sample2" value="Sample map value 2" />
        <string id="Maps.BssRecurringType.None" value="None" />
        <string id="Maps.BssRecurringType.Daily" value="Daily" />
        <string id="Maps.BssRecurringType.Weekly" value="Weekly" />
        <string id="Maps.BssRecurringType.Monthly" value="Monthly" />
        <string id="Maps.BssRecurringType.EndOfMonth" value="End of Month" />
        <string id="Maps.BssRecurringType.Yearly" value="Yearly" />
        <string id="Maps.BssRecurringType.Maximum" value="Maximum" />
        <string id="Maps.BssNotificationType.TimeBasedAlarm" value="TimeBasedAlarm" />
        <string id="Maps.BssNotificationType.TimeBasedReminder" value="TimeBasedReminder" />
        <string id="Maps.BssNotificationType.PeriodicTask" value="PeriodicTask" />
        <string id="Maps.BssNotificationType.OnIdleTask" value="OnIdleTask" />
        <string id="Maps.BssNotificationType.KeepAliveTask" value="KeepAliveTask" />
        <string id="Maps.BssNotificationType.IncomingCallTask" value="IncomingCallTask" />
        <string id="Maps.BssNotificationType.NabSyncTask" value="NabSyncTask" />
        <string id="Maps.BssNotificationType.Maximum" value="Maximum" />
        <string id="Maps.BssNotificationState.Scheduled" value="Scheduled" />
        <string id="Maps.BssNotificationState.Completed" value="Completed" />
        <string id="Maps.BssNotificationState.Disabled" value="Disabled" />
        <string id="Maps.BssNotificationState.Maximum" value="Maximum" />
        <string id="Maps.BssEventHandlerType.CheckAll" value="CheckAll" />
        <string id="Maps.BssEventHandlerType.TimerManager" value="TimerManager" />
        <string id="Maps.BssEventHandlerType.PeriodicTaskLaunching" value="PeriodicTaskLaunching" />
        <string id="Maps.BssEventHandlerType.PeriodicTaskCancelling" value="PeriodicTaskCancelling" />
        <string id="Maps.BssEventHandlerType.OnIdleLaunching" value="OnIdleLaunching" />
        <string id="Maps.BssEventHandlerType.OnIdleCancelling" value="OnIdleCancelling" />
        <string id="Maps.BssEventHandlerType.KeepAlivePeriodicLaunching" value="KeepAlivePeriodicLaunching" />
        <string id="Maps.BssEventHandlerType.KeepAliveNetworkOn" value="KeepAliveNetworkOn" />
        <string id="Maps.BssEventHandlerType.KeepAliveBatterySaverLaunching" value="KeepAliveBatterySaverLaunching" />
        <string id="Maps.BssEventHandlerType.DebuggerEvent" value="DebuggerEvent" />
        <string id="Maps.BssEventHandlerType.Last" value="Last" />
        <string id="Maps.BssNotificationDescription.CreateNotification" value="Create Notification" />
        <string id="Maps.BssNotificationDescription.DeleteNotification" value="Delete Notification" />
        <string id="Maps.BssNotificationDescription.ExpireNotification" value="Expire Notification" />
        <string id="Maps.BssNotificationDescription.LaunchNotification" value="Launch Notification" />
        <string id="Maps.BssNotificationDescription.UpdateNotification" value="Update Notification" />
        <string id="Maps.BssNotificationDescription.CancelNotification" value="Cancel Notification" />
        <string id="Maps.BssNotificationDescription.DisableNotification" value="Disable Notification" />
        <string id="Maps.BssNotificationDescription.EnableNotification" value="Enable Notification" />
        <string id="Maps.BssNotificationDescription.AimVerifyNotification" value="Verified Notification with AIM" />
        <string id="Maps.BssNotificationDescription.CleanTimer" value="Don't try to launch a running task but just clean out the timer" />
        <string id="Maps.BssNotificationDescription.NoLaunchExpiredTask" value="Don't launch the expired task" />
        <string id="Maps.BssNotificationDescription.RemoveBecauseOfAbort" value="Take it off from schedule since Abort() is called" />
        <string id="Maps.BssNotificationDescription.MarkCompletedGbaExpired" value="Mark the task as complete since it is expired" />
        <string id="Maps.BssNotificationDescription.RemoveBecauseOfUnhandledExceptions" value="Take it off from schedule due to multiple unhandled exceptions" />
        <string id="Maps.BssNotificationDescription.CancelScheduledTask" value="Cancel scheduled task" />
        <string id="Maps.BssNotificationDescription.UpdateTaskStatus" value="Updated task status" />
        <string id="Maps.BssNotificationDescription.SentRequestToAim" value="Sent request to AIM to launch task" />
        <string id="Maps.BssNotificationDescription.NoLaunchCompletedOrRunningTask" value="Don't launch the completed task or a running task" />
        <string id="Maps.BssNotificationDescription.ScheduledTaskLaunchResult" value="Scheduled task launch result" />
        <string id="Maps.SqmTaskState.Invalid" value="Invalid" />
        <string id="Maps.SqmTaskState.Started" value="Started" />
        <string id="Maps.SqmTaskState.Paused" value="Paused" />
        <string id="Maps.SqmTaskState.Resumed" value="Resumed" />
        <string id="Maps.SqmTaskState.MovedToBackground" value="MovedToBackground" />
        <string id="Maps.SqmTaskState.RunUnderLock" value="RunUnderLock" />
        <string id="Maps.SqmTaskStateTransition.Invalid" value="Invalid" />
        <string id="Maps.SqmTaskStateTransition.OK" value="OK" />
        <string id="Maps.SqmTaskStateTransition.Abort" value="Abort" />
        <string id="Maps.SqmTaskStateTransition.Unexpected" value="Unexpected" />
        <string id="Maps.SqmTaskStateTransition.ExceededRuntime" value="ExceededRuntime" />
        <string id="Maps.SqmTaskStateTransition.ResourcesSeized" value="ResourcesSeized" />
        <string id="Maps.SqmTaskStateTransition.Paused" value="Paused" />
        <string id="Maps.SqmTaskStateTransition.Resumed" value="Resumed" />
        <string id="Maps.SqmTaskStateTransition.ScreenLock" value="ScreenLock" />
        <string id="Maps.SqmTaskStateTransition.ScreenUnlocked" value="ScreenUnlocked" />
        <string id="Maps.SqmTaskStateTransition.MovedToBackground" value="MovedToBackground" />
        <string id="Maps.SqmTaskStateTransition.CbeExitTimeout" value="CbeExitTimeout" />
        <string id="Maps.SqmTaskStateTransition.CbeExitBatterySaver" value="CbeExitBatterySaver" />
        <string id="Maps.SqmTaskStateTransition.CbeExitParallelAgentPolicy" value="CbeExitParallelAgentPolicy" />
        <string id="Maps.SqmTaskStateTransition.CbeExitResourcesUnavailable" value="CbeExitResourcesUnavailable" />
        <string id="Maps.SqmTaskStateTransition.CbeExitControlPanel" value="CbeExitControlPanel" />
        <string id="Maps.SqmTaskStateTransition.CbeExitBandwidthSavings" value="CbeExitBandwidthSavings" />
        <string id="Maps.TaskHostModule.HeadlessHost" value="HeadlessHost" />
        <string id="Maps.TaskHostModule.TaskHost" value="TaskHost" />
        <string id="Maps.TaskHostModule.XcpHost" value="XcpHost" />
        <string id="Maps.TaskHostModule.TaskHostSvcs" value="TaskHostSvcs" />
        <string id="Maps.TaskHostModule.TaskHostUnitTests" value="TaskHostUnitTests" />
        <string id="ShareBroker.InvokeFlow" value="ShareBroker: InvokeFlow(HWND=%1)" />
        <string id="ShareBroker.Error" value="ShareBroker Error: %1:%2 [HRESULT=%3]" />
        <string id="ShareBroker.BeginFetchDataPackage" value="ShareBroker: Fetch Data Package [BEGIN]" />
        <string id="ShareBroker.EndFetchDataPackage" value="ShareBroker: Fetch Data Package [END]" />
        <string id="ShareBroker.LaunchingSharePicker" value="ShareBroker: Launching Share Picker" />
        <string id="ShareBroker.CallerNotAppContainer" value="ShareBroker: Caller (PID=%1) is not in AppContainer" />
        <string id="ShareBroker.SFToDSSToken" value="ShareBroker: SF (%0) converting to DSS token (readonly=%1)" />
        <string id="ShareBroker.ReportTargetStarted" value="ShareBroker: ReportTargetStarted - Share Entry %1" />
        <string id="ShareBroker.ReportTargetRetrievedData" value="ShareBroker: ReportTargetRetrievedData - Share Entry %1" />
        <string id="ShareBroker.ReportTargetSubmittedBackgroundTask" value="ShareBroker: ReportTargetSubmittedBackgroundTask - Share Entry %1" />
        <string id="ShareBroker.ReportTargetCompleted" value="ShareBroker: ReportTargetCompleted - Share Entry %1" />
        <string id="ShareBroker.DismissUI" value="ShareBroker: DismissUI - Share Entry %1" />
        <string id="ShareBroker.ReportTargetError" value="ShareBroker: ReportTargetStarted - Share Entry %0" />
        <string id="ShareBroker.RunningShareEntryCreate" value="ShareBroker: Sharing Entry Create %1 AUMID = %2 (PID=%3)" />
        <string id="ShareBroker.RunningShareEntryDestroy" value="ShareBroker: Sharing Entry Destroy %1" />
        <string id="ShareBroker.HandleTargetCrash" value="ShareBroker: Handle Target Crash %1 (PID=%2)" />
        <string id="ShareBroker.CreatedBackgroundWorkItem" value="ShareBroker: Created Background Work Item (ID=%1)" />
        <string id="ShareBroker.CancelBackgroundWorkItem" value="ShareBroker: Canceled Background Work Item (ID=%1)" />
        <string id="ShareBroker.CancelBackgroundWorkItemFailed" value="ShareBroker: Canceled Background Work Item Failed (ID=%1, Status=%2)" />
        <string id="ShareBroker.BeginDataPackageClone" value="ShareBroker: DataPackage Clone [BEGIN]" />
        <string id="ShareBroker.EndDataPackageClone" value="ShareBroker: DataPackage Clone [END]" />
        <string id="ShareBroker.ReleaseDeferralFailed" value="ShareBroker: DataPackageHost Deferral Release Failed (hr=%1)" />
        <string id="ShareBroker.ShareUICancelled" value="ShareBroker: ShareUI Cancelled" />
        <string id="PlatformInterop.MethodExitMessage" value="[%1] HResult = [%2]%n"/>
        <string id="PlatformInterop.Error" value="Push (Error): [%1]%n"/>
        <string id="Maps.FSM_STATE.HOST_CREATED" value="HOST_CREATED" />
        <string id="Maps.FSM_STATE.HOST_INITIALIZED" value="HOST_INITIALIZED" />
        <string id="Maps.FSM_STATE.HOST_RUNNING" value="HOST_RUNNING" />
        <string id="Maps.FSM_STATE.STARTING_TASK" value="STARTING_TASK" />
        <string id="Maps.FSM_STATE.REHYDRATING_TASK" value="REHYDRATING_TASK" />
        <string id="Maps.FSM_STATE.HOST_READY" value="HOST_READY" />
        <string id="Maps.FSM_STATE.HOST_PAUSING" value="HOST_PAUSING" />
        <string id="Maps.FSM_STATE.PAUSING_TASK" value="PAUSING_TASK" />
        <string id="Maps.FSM_STATE.PAUSED_TASK" value="PAUSED_TASK" />
        <string id="Maps.FSM_STATE.HOST_PAUSED" value="HOST_PAUSED" />
        <string id="Maps.FSM_STATE.RESUMING_TASK" value="RESUMING_TASK" />
        <string id="Maps.FSM_STATE.HOST_GOING_IN_BACKGROUND" value="HOST_GOING_IN_BACKGROUND" />
        <string id="Maps.FSM_STATE.TASK_GOING_IN_BACKGROUND" value="TASK_GOING_IN_BACKGROUND" />
        <string id="Maps.FSM_STATE.HOST_IN_BACKGROUND" value="HOST_IN_BACKGROUND" />
        <string id="Maps.FSM_STATE.TASK_GOING_IN_FOREGROUND" value="TASK_GOING_IN_FOREGROUND" />
        <string id="Maps.FSM_STATE.GRACEFULLY_DEHYDRATING_HOST" value="GRACEFULLY_DEHYDRATING_HOST" />
        <string id="Maps.FSM_STATE.HOST_VISIBLE" value="HOST_VISIBLE" />
        <string id="Maps.FSM_STATE.HOST_HIDDEN" value="HOST_HIDDEN" />
        <string id="Maps.FSM_STATE.HOST_FROZEN" value="HOST_FROZEN" />
        <string id="Maps.FSM_STATE.HOST_THAWED" value="HOST_THAWED" />
        <string id="Maps.FSM_STATE.HOST_EXITING" value="HOST_EXITING" />
        <string id="Maps.FSM_STATE.HOST_ERROR" value="HOST_ERROR" />
        <string id="Maps.NavigationDirection.Direction_Forward" value="Direction_Forward" />
        <string id="Maps.NavigationDirection.Direction_Backward" value="Direction_Backward" />
        <string id="Maps.NavigationDirection.Direction_ForceSize" value="Direction_ForceSize" />
        <string id="ModernResourceEnforcer.RE_SetApplicationPropertiesFailed"
            value="Modern Enforcer: Failed to call SetApplicationProperties - Status=%1, PsmKey=%2, HostJobType=%3: (%9, %10, %11, %12, %13) - CpuRate=%4, HardMemoryLimit=%5, NotifyMemoryLowLimit=%6, NotifyMemoryHighLimit=%7, Priority=%8"
            />
        <string id="ModernResourceEnforcer.RE_QueryApplicationPropertiesFailed"
            value="Modern Enforcer: Failed to call QueryApplicationProperties - Status=%1, PsmKey=%2, HostJobType=%3, CpuRate=%4, HardMemoryLimit=%5, NotifyMemoryLowLimit=%6, NotifyMemoryHighLimit=%7, Priority=%8"
            />
        <string id="ModernResourceEnforcer.RE_QueryMemoryUsageFailed"
            value="Modern Enforcer: Failed to call QueryMemoryUsage - Status=%1, PsmKey=%2, HostJobType=%3, MemoryUsage=%4"
            />
        <string id="ModernResourceEnforcer.RE_QuerySharedCommitFailed"
            value="Modern Enforcer: Failed to call QuerySharedCommit- Status=%1, PsmKey=%2, HostJobType=%3, SharedMemoryUsage=%4"
            />
        <string id="ModernResourceEnforcer.RE_SetApplicationProperties"
            value="Modern Enforcer: SetApplicationProperties - Status=%1, PsmKey=%2, HostJobType=%3: (%9, %10, %11, %12, %13) - CpuRate=%4, HardMemoryLimit=%5, NotifyMemoryLowLimit=%6, NotifyMemoryHighLimit=%7, Priority=%8"
            />
        <string id="ModernResourceEnforcer.RE_QueryApplicationProperties"
            value="Modern Enforcer: QueryApplicationProperties - Status=%1, PsmKey=%2, HostJobType=%3, CpuRate=%4, HardMemoryLimit=%5, NotifyMemoryLowLimit=%6, NotifyMemoryHighLimit=%7, Priority=%8"
            />
        <string id="ModernResourceEnforcer.RE_HandleGroupOwnershipNotification"
            value="Modern Enforcer: PSM GroupOwnershipNotification - Status=%1, PsmKey=%2, HostJobType=%3, %4, fUpdateRate=%5"
            />
        <string id="ModernResourceEnforcer.RE_HandleHostEmptyNotification"
            value="Modern Enforcer: PSM HostEmpty Notification - PsmKey=%1, HostJobType=%2"
            />
        <string id="ModernResourceEnforcer.RE_PsmApplicationStateNotification"
            value="Modern Enforcer: PsmApplicationStateNotification - Session=%2, PsmKey=%3, State=%4"
            />
        <string id="ModernResourceEnforcer.RE_PsmHostStateNotification"
            value="Modern Enforcer: PsmHostStateNotification - Session=%2, PsmKey=%3, HostJobType=%4, State=%5"
            />

        <string id="Maps.INSTALLTYPE.INSTALLTYPE_INVALID" value="INSTALLTYPE_INVALID" />
        <string id="Maps.INSTALLTYPE.INSTALLTYPE_APPX_PACKAGE" value="INSTALLTYPE_APPX_PACKAGE" />
        <string id="Maps.INSTALLTYPE.INSTALLTYPE_FRAMEWORK_PACKAGE" value="INSTALLTYPE_FRAMEWORK_PACKAGE" />
        <string id="Maps.INSTALLTYPE.INSTALLTYPE_XAP_PACKAGE" value="INSTALLTYPE_XAP_PACKAGE" />
        <string id="Maps.INSTALLTYPE.INSTALLTYPE_APPX_INFUSED" value="INSTALLTYPE_APPX_INFUSED" />
        <string id="Maps.INSTALLTYPE.INSTALLTYPE_FRAMEWORK_INFUSED" value="INSTALLTYPE_FRAMEWORK_INFUSED" />
        <string id="Maps.INSTALLTYPE.INSTALLTYPE_XAP_INFUSED" value="INSTALLTYPE_XAP_INFUSED" />
        <string id="Maps.PM_NOTIFICATION_TYPE.PNT_LIFECYCLE_NOTIFICATION" value="PNT_LIFECYCLE_NOTIFICATION" />
        <string id="Maps.PM_NOTIFICATION_TYPE.PNT_TILE_NOTIFICATION" value="PNT_TILE_NOTIFICATION" />
        <string id="Maps.PM_NOTIFICATION_TYPE.PNT_BNS_NOTIFICATION" value="PNT_BNS_NOTIFICATION" />
        <string id="Maps.PM_NOTIFICATION_TYPE.PNT_INVALID" value="PNT_INVALID" />
        <string id="Format.GenericTraceFunctionError" value="%1: %2" />
        <string id="Maps.AcquireRelease.Release" value="Release" />
        <string id="Maps.AcquireRelease.Acquire" value="Acquire" />
        <string id="Maps.PsmAppState.Active" value="Active" />
        <string id="Maps.PsmAppState.Brokered" value="Brokered" />
        <string id="Maps.PsmAppState.Sandboxed" value="Sandboxed" />
        <string id="Maps.PsmAppState.Quiescing" value="Quiescing" />
        <string id="Maps.PsmAppState.Halted" value="Halted" />
        <string id="Maps.PsmAppState.TerminatePending" value="TerminatePending" />
        <string id="Maps.PsmAppState.Terminated" value="Terminated" />
        <string id="Maps.PsmAppState.HaltPending" value="HaltPending" />
        <string id="Maps.PsmAppState.Deleted" value="Deleted" />
        <string id="Maps.PsmAppState.Initialized" value="Initialized" />
        <string id="Maps.PsmAppState.OutSwapped" value="OutSwapped" />
        <string id="Maps.PsmAppState.Invalid" value="Invalid" />
        <string id="Maps.PsmHostState.Empty" value="Empty" />
        <string id="Maps.PsmHostState.AcquireGroupScheduling" value="AcquireGroupScheduling" />
        <string id="Maps.PsmHostState.ReleaseGroupScheduling" value="ReleaseGroupScheduling" />
        <string id="Maps.PsmHostState.QuotaPolicySuspend" value="QuotaPolicySuspend" />
        <string id="Maps.PsmHostState.QuotaPolicyResume" value="QuotaPolicyResume" />
        <string id="Maps.PsmHostState.Invalid" value="Invalid" />
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
