<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->

<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>
    <events>

      <!--** Never log any data which should be protected for security or privacy purposes.-->

      <provider name="Microsoft-WindowsPhone-DeviceUpdate-UX"
        guid="{B7C52B7F-A191-4A9B-9326-CB463BE521C2}"
        symbol="MICROSOFT_WINDOWSPHONE_DeviceUpdate_UX"
        messageFileName="DuErrorsUIRes.dll"
        resourceFileName="DuErrorsUIRes.dll">

        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
        </keywords>

        <maps>
          <!-- DuaState, value needs to match the DuaState enum -->
          <valueMap name="mDuaState">
            <map value="0" message="$(string.DuaState.DuaStateIdle)" />
            <map value="1" message="$(string.DuaState.DuaStateDetection)" />
            <map value="2" message="$(string.DuaState.DuaStateDownload)" />
            <map value="3" message="$(string.DuaState.DuaStatePreInstall)" />
            <map value="4" message="$(string.DuaState.DuaStateInstall)" />
            <map value="5" message="$(string.DuaState.DuaStatePostInstall)" />
            <map value="6" message="$(string.DuaState.DuaStateUpdateComplete)" />
            <map value="7" message="$(string.DuaState.DuaStateReadyToDownload)" />
            <map value="8" message="$(string.DuaState.DuaStateReadyToPreInstall)" />
            <map value="9" message="$(string.DuaState.DuaStateReadyToInstall)" />
            <map value="10" message="$(string.DuaState.DuaStateReadyToPostInstall)" />
            <map value="11" message="$(string.DuaState.DuaStateDetectionReport)" />
            <map value="12" message="$(string.DuaState.DuaStateDownloadReport)" />
            <map value="13" message="$(string.DuaState.DuaStateInstallReport)" />
            <map value="14" message="$(string.DuaState.DuaStateUnknown)" />
          </valueMap>

          <!-- DUUXType -->
          <valueMap name="mDisplayPage">
            <map value="1" message="$(string.DisplayPage.DMFProgress)" />
            <map value="2" message="$(string.DisplayPage.UpdateResult)" />
            <map value="3" message="$(string.DisplayPage.DuaClient)" />
          </valueMap>

          <!-- UpdateResultState -->
          <valueMap name="mUpdateResultState">
            <map value="1" message="$(string.UpdateResultState.InstallSucceeded)" />
            <map value="2" message="$(string.UpdateResultState.InstallFailed)" />
            <map value="3" message="$(string.UpdateResultState.DMFFailed)" />
            <map value="4" message="$(string.UpdateResultState.DMFWarning)" />
          </valueMap>

          <!-- DUUXModule -->
          <valueMap name="mUIResModule">
            <map value="1" message="$(string.UIResModule.PostUpdateUX)" />
            <map value="2" message="$(string.UIResModule.Notification)" />
          </valueMap>

          <!-- DismissedReason -->
          <valueMap name="mARDAction">
            <map value="0" message="$(string.ARDAction.ButtonPressed)" />
            <map value="1" message="$(string.ARDAction.Canceled)" />
            <map value="2" message="$(string.ARDAction.TimedOut)" />
            <map value="3" message="$(string.ARDAction.Dismissed)" />
            <map value="4" message="$(string.ARDAction.ItemSelected)" />
            <map value="5" message="$(string.ARDAction.ServerError)" />
          </valueMap>

          <!-- WNFChange -->
          <valueMap name="mWNF">
            <map value="1" message="$(string.WNF.StateChange)" />
            <map value="2" message="$(string.WNF.ProgressChange)" />
            <map value="3" message="$(string.WNF.DMFCompleteChange)" />
            <map value="4" message="$(string.WNF.DMFProgressChange)" />
            <map value="5" message="$(string.WNF.DeviceLockChange)" />
          </valueMap>

        </maps>

        <templates>

          <template tid="tDisplayPage">
            <data name="DisplayPage" inType="win:UInt32" map="mDisplayPage" />
          </template>

          <template tid="tUpdateResultState">
            <data name="UpdateResultState" inType="win:UInt32" map="mUpdateResultState" />
          </template>

          <template tid="tARDAction">
            <data name="ARDAction" inType="win:UInt32" map="mARDAction" />
          </template>

          <template tid="tWNF">
            <data name="WNF" inType="win:UInt32" map="mWNF" />
          </template>

          <template tid="tHRESULT">
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tBoolean">
            <data name="Boolean" inType="win:Boolean" />
          </template>

          <template tid="tString">
            <data name="szString" inType="win:UnicodeString" />
          </template>

          <template tid="tInt">
            <data name="Int" inType="win:Int32" />
          </template>

          <template tid="tDuaState">
            <data name="DuaState" inType="win:UInt32" map="mDuaState" />
          </template>

          <template tid="tCoreUpdateProgress">
            <data name="DuaState" inType="win:UInt32" map="mDuaState" />
            <data name="DWORD" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tDWORD">
            <data name="DWORD" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tDWORD2">
            <data name="DWORD1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="DWORD2" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tDWORD4">
            <data name="DWORD1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="DWORD2" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="DWORD3" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="DWORD4" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tHRESULTString">
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
            <data name="szString" inType="win:UnicodeString" />
          </template>

          <template tid="tLoadLibrary">
            <data name="Module" inType="win:UInt32" map="mUIResModule" />
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tLoadString">
            <data name="Module" inType="win:UInt32" map="mUIResModule" />
            <data name="Int" inType="win:Int32" />
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tSetDMFComplete">
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
            <data name="DWORD" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
        </templates>

        <!-- Device Lock templates -->
        <templates>
          <template tid="tDeviceLockedEventCallback">
            <data name="CurrentState" inType="win:UInt32" />
            <data name="CurrentChangeStamp" inType="win:UInt32" />
            <data name="InitialChangeStamp" inType="win:UInt32" />
          </template>
        </templates>

        <events>

          <!-- Shared Events -->
          <event value="1"
              symbol="DeviceUpdateUX_Error"
              level="win:Error"
              template="tHRESULT"
              message="$(string.Event.DeviceUpdateUX_Error)" />

          <event value="2"
              symbol="DeviceUpdateUX_LoadLibraryFailed"
              level="win:Error"
              template="tLoadLibrary"
              message="$(string.Event.DeviceUpdateUX_LoadLibraryFailed)" />

          <event value="3"
              symbol="DeviceUpdateUX_LoadStringFailed"
              level="win:Error"
              template="tLoadString"
              message="$(string.Event.DeviceUpdateUX_LoadStringFailed)" />

          <event value="4"
              symbol="DeviceUpdateUX_OnClosing"
              level="win:Informational"
              template="tDisplayPage"
              message="$(string.Event.DeviceUpdateUX_OnClosing)" />

          <event value="5"
              symbol="DeviceUpdateUX_SetPostUpdateUXComplete"
              level="win:Informational"
              template="tBoolean"
              message="$(string.Event.DeviceUpdateUX_SetPostUpdateUXComplete)" />

          <event value="6"
              symbol="DeviceUpdateUX_SetPostUpdateUXCompleteFailed"
              level="win:Error"
              template="tHRESULT"
              message="$(string.Event.DeviceUpdateUX_SetPostUpdateUXCompleteFailed)" />

          <event value="7"
              symbol="DeviceUpdateUX_SubscribeToWNF"
              level="win:Informational"
              template="tWNF"
              message="$(string.Event.DeviceUpdateUX_SubscribeToWNF)" />

          <event value="8"
              symbol="DeviceUpdateUX_UnsubscribeToWNF"
              level="win:Informational"
              template="tWNF"
              message="$(string.Event.DeviceUpdateUX_UnsubscribeToWNF)" />

          <event value="9"
              symbol="DeviceUpdateUX_UIXServiceAllocateStringFailed"
              level="win:Error"
              template="tHRESULT"
              message="$(string.Event.DeviceUpdateUX_UIXServiceAllocateStringFailed)" />

          <event value="10"
              symbol="DeviceUpdateUX_GetPostUpdateUXComplete"
              level="win:Informational"
              template="tDWORD"
              message="$(string.Event.DeviceUpdateUX_GetPostUpdateUXComplete)" />

          <event value="11"
              symbol="DeviceUpdateUX_GetPostUpdateUXCompleteFailed"
              level="win:Error"
              template="tHRESULT"
              message="$(string.Event.DeviceUpdateUX_GetPostUpdateUXCompleteFailed)" />

          <!-- Post Update UX Events -->
          <event value="101"
              symbol="DeviceUpdateUX_UpdateResultState"
              level="win:Informational"
              template="tUpdateResultState"
              message="$(string.Event.DeviceUpdateUX_UpdateResultState)" />

          <event value="102"
              symbol="DeviceUpdateUX_OnUserAction"
              level="win:Informational"
              template="tUpdateResultState"
              message="$(string.Event.DeviceUpdateUX_OnUserAction)" />

          <event value="103"
              symbol="DeviceUpdateUX_ResetIdleTimerFailed"
              level="win:Warning"
              template="tHRESULT"
              message="$(string.Event.DeviceUpdateUX_ResetIdleTimerFailed)" />

          <event value="104"
              symbol="DeviceUpdateUX_AdjustedProgress"
              level="win:Informational"
              template="tDWORD4"
              message="$(string.Event.DeviceUpdateUX_AdjustedProgress)" />

          <event value="105"
              symbol="DeviceUpdateUX_DMFCompleteCallback"
              level="win:Informational"
              template="tDWORD2"
              message="$(string.Event.DeviceUpdateUX_DMFCompleteCallback)" />

          <event value="106"
              symbol="DeviceUpdateUX_DMFProgressCallback"
              level="win:Verbose"
              template="tDWORD4"
              message="$(string.Event.DeviceUpdateUX_DMFProgressCallback)" />

          <event value="107"
              symbol="DeviceUpdateUX_UpdateSuccessBodyText"
              level="win:Informational"
              template="tString"
              message="$(string.Event.DeviceUpdateUX_UpdateSuccessBodyText)" />

          <event value="108"
              symbol="DeviceUpdateUX_ShellLockFailed"
              level="win:Error"
              template="tHRESULT"
              message="$(string.Event.DeviceUpdateUX_ShellLockFailed)" />

                    <event value="109"
                        symbol="DeviceUpdateUX_SetDMFComplete"
                        level="win:Informational"
                        template="tSetDMFComplete"
                        message="$(string.Event.DeviceUpdateUX_SetDMFComplete)" />

          <!-- DuaClient Events -->
          <event value="200"
              symbol="DeviceUpdateUX_SetAutoScanSetting"
              level="win:Informational"
              template="tBoolean"
              message="$(string.Event.DeviceUpdateUX_SetAutoScanSetting)" />

          <event value="201"
              symbol="DeviceUpdateUX_SetAutoDownloadSetting"
              level="win:Informational"
              template="tBoolean"
              message="$(string.Event.DeviceUpdateUX_SetAutoDownloadSetting)" />

          <event value="202"
              symbol="DeviceUpdateUX_GetLastCheckTimeFailed"
              level="win:Warning"
              template="tHRESULT"
              message="$(string.Event.DeviceUpdateUX_GetLastCheckTimeFailed)" />

          <event value="203"
              symbol="DeviceUpdateUX_StateChangeCallback"
              level="win:Informational"
              template="tDuaState"
              message="$(string.Event.DeviceUpdateUX_StateChangeCallback)" />

          <event value="204"
              symbol="DeviceUpdateUX_ProgressChangeCallback"
              level="win:Verbose"
              template="tCoreUpdateProgress"
              message="$(string.Event.DeviceUpdateUX_ProgressChangeCallback)" />

          <event value="205"
              symbol="DeviceUpdateUX_StartScan"
              level="win:Informational"
              message="$(string.Event.DeviceUpdateUX_StartScan)" />

          <event value="206"
              symbol="DeviceUpdateUX_GetDuaSvcState_Start"
              level="win:Informational"
              message="$(string.Event.DeviceUpdateUX_GetDuaSvcState_Start)" />

          <event value="207"
              symbol="DeviceUpdateUX_GetDuaSvcState_Stop"
              level="win:Informational"
              message="$(string.Event.DeviceUpdateUX_GetDuaSvcState_Stop)" />

          <event value="208"
              symbol="DeviceUpdateUX_StartDownload"
              level="win:Informational"
              message="$(string.Event.DeviceUpdateUX_StartDownload)" />

          <event value="209"
               symbol="DeviceUpdateUX_ChangeSettings_Failed"
               level="win:Informational"
               template="tInt"
               message="$(string.Event.DeviceUpdateUX_ChangeSettings_Failed)" />

          <event value="210"
               symbol="DeviceUpdateUX_UpdatePolicyChangeCallback"
               level="win:Informational"
               template="tInt"
               message="$(string.Event.DeviceUpdateUX_UpdatePolicyChangeCallback)" />

          <!-- Notification Events -->
          <event value="300"
              symbol="DeviceUpdateUX_NotificationArg"
              level="win:Informational"
              template="tString"
              message="$(string.Event.DeviceUpdateUX_NotificationArg)" />

          <event value="301"
              symbol="DeviceUpdateUX_ARDAction"
              level="win:Informational"
              template="tARDAction"
              message="$(string.Event.DeviceUpdateUX_ARDAction)" />

          <event value="302"
              symbol="DeviceUpdateUX_ARDButtonPressed"
              level="win:Informational"
              template="tInt"
              message="$(string.Event.DeviceUpdateUX_ARDButtonPressed)" />

                    <event value="303"
                        symbol="DeviceUpdateUX_CoreStateChange"
                        level="win:Informational"
                        template="tDWORD"
                        message="$(string.Event.DeviceUpdateUX_CoreStateChange)" />

                    <event value="304"
                        symbol="DeviceUpdateUX_LaunchingAppUri"
                        level="win:Informational"
                        template="tString"
                        message="$(string.Event.DeviceUpdateUX_LaunchingAppUri)" />

                    <event value="305"
                        symbol="DeviceUpdateUX_LaunchingAppUriFailed"
                        level="win:Error"
                        template="tHRESULTString"
                        message="$(string.Event.DeviceUpdateUX_LaunchingAppUri)" />

                    <!-- Device Lock events -->
                    <event value="400"
                        symbol="DeviceUpdateUX_LockedEventCallback"
                        level="win:Informational"
                        template="tDeviceLockedEventCallback"
                        message="$(string.Event.DeviceUpdateUX_LockedEventCallback)" />

          <!-- Feature Discovery events -->
          <event value="500"
              symbol="FeatureDiscoveryUX_SetWiFiAutoConnectStateFailed"
              level="win:Informational"
              template="tDWORD"
              message="$(string.Event.FeatureDiscoveryUX_SetWiFiAutoConnectStateFailed)" />

          <event value="501"
              symbol="FeatureDiscoveryUX_SetWiFiExchangeStateFailed"
              level="win:Error"
              template="tDWORD"
              message="$(string.Event.FeatureDiscoveryUX_SetWiFiExchangeStateFailed)" />

          <event value="502"
              symbol="FeatureDiscoveryUX_SetAdvertisingIdFailed"
              level="win:Error"
              template="tDWORD"
              message="$(string.Event.FeatureDiscoveryUX_SetAdvertisingIdFailed)" />

          <event value="503"
              symbol="FeatureDiscoveryUX_SetAutoAppUpdatesFailed"
              level="win:Error"
              template="tDWORD"
              message="$(string.Event.FeatureDiscoveryUX_SetAutoAppUpdatesFailed)" />

          <event value="504"
              symbol="FeatureDiscoveryUX_FeatureDiscoveryCompleteFailed"
              level="win:Error"
              template="tDWORD"
              message="$(string.Event.FeatureDiscoveryUX_FeatureDiscoveryCompleteFailed)" />

          <event value="505"
              symbol="FeatureDiscoveryUX_ModelInitializationFailed"
              level="win:Error"
              template="tDWORD"
              message="$(string.Event.FeatureDiscoveryUX_ModelInitializationFailed)" />
        </events>
      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="Keyword.Error"                                          value="Error" />
        <string id="Keyword.Performance"                                    value="Performance" />

        <string id="DuaState.DuaStateIdle"                                  value="DuaStateIdle" />
        <string id="DuaState.DuaStateDetection"                             value="DuaStateDetection" />
        <string id="DuaState.DuaStateReadyToDownload"                       value="DuaStateReadyToDownload" />
        <string id="DuaState.DuaStateDownload"                              value="DuaStateDownload" />
        <string id="DuaState.DuaStateReadyToPreInstall"                     value="DuaStateReadyToPreInstall" />
        <string id="DuaState.DuaStatePreInstall"                            value="DuaStatePreInstall" />
        <string id="DuaState.DuaStateReadyToInstall"                        value="DuaStateReadyToInstall" />
        <string id="DuaState.DuaStateInstall"                               value="DuaStateInstall" />
        <string id="DuaState.DuaStatePostInstall"                           value="DuaStatePostInstall" />
        <string id="DuaState.DuaStateReadyToPostInstall"                    value="DuaStateReadyToPostInstall" />
        <string id="DuaState.DuaStateUpdateComplete"                        value="DuaStateUpdateComplete" />
        <string id="DuaState.DuaStateDetectionReport"                       value="DuaStateDetectionReport" />
        <string id="DuaState.DuaStateDownloadReport"                        value="DuaStateDownloadReport" />
        <string id="DuaState.DuaStateInstallReport"                         value="DuaStateInstallReport" />
        <string id="DuaState.DuaStateUnknown"                               value="DuaStateUknown" />

        <string id="DisplayPage.DMFProgress"                                value="DMFProgress Page" />
        <string id="DisplayPage.UpdateResult"                               value="UpdateResult Page" />
        <string id="DisplayPage.DuaClient"                                  value="DuaClient Page" />

        <string id="UpdateResultState.InstallSucceeded"                     value="Install Succeeded" />
        <string id="UpdateResultState.InstallFailed"                        value="Install Failed" />
        <string id="UpdateResultState.DMFFailed"                            value="Data Migration Failed" />
        <string id="UpdateResultState.DMFWarning"                           value="Data Migration Warning" />

        <string id="UIResModule.Notification"                               value="DuaNotficationUIRes.dll" />
        <string id="UIResModule.PostUpdateUX"                               value="DuPostUpdateUIRes.dll" />

        <string id="ARDAction.ButtonPressed"                                value="Button Pressed" />
        <string id="ARDAction.Canceled"                                     value="Canceled" />
        <string id="ARDAction.TimedOut"                                     value="TimedOut" />
        <string id="ARDAction.Dismissed"                                    value="Dismissed" />
        <string id="ARDAction.ItemSelected"                                 value="ItemSelected" />
        <string id="ARDAction.ServerError"                                  value="ServerError" />

        <string id="WNF.StateChange"                                        value="WNF_DU_ENGINESTATE_CHANGE" />
        <string id="WNF.ProgressChange"                                     value="WNF_DU_CORE_UPDATE_PROGRESS" />
        <string id="WNF.DMFCompleteChange"                                  value="WNF_DMF_MIGRATION_COMPLETE" />
        <string id="WNF.DMFProgressChange"                                  value="WNF_DMF_MIGRATION_PROGRESS" />
        <string id="WNF.DeviceLockChange"                                   value="WNF_SHL_DEVICE_LOCK_STATE" />

        <string id="Event.DeviceUpdateUX_Error"                             value="[Device Update UX] Error! HRESULT = %1." />
        <string id="Event.DeviceUpdateUX_LoadLibraryFailed"                 value="[Device Update UX] LoadLibrary failed! Module = %1, HRESULT = %2." />
        <string id="Event.DeviceUpdateUX_LoadStringFailed"                  value="[Device Update UX] LoadString failed! Module = %1, String Index = %2, HRESULT = %3." />
        <string id="Event.DeviceUpdateUX_OnClosing"                         value="[Device Update UX] %1 OnClosing() Invoked." />
        <string id="Event.DeviceUpdateUX_GetPostUpdateUXComplete"           value="[Device Update UX] Get Post Update UX Complete Registry as %1." />
        <string id="Event.DeviceUpdateUX_GetPostUpdateUXCompleteFailed"     value="[Device Update UX] Get Post Update UX Complete Registry failed with HRESULT = %1." />
        <string id="Event.DeviceUpdateUX_SetPostUpdateUXComplete"           value="[Device Update UX] Set Post Update UX Complete Registry as %1." />
        <string id="Event.DeviceUpdateUX_SetPostUpdateUXCompleteFailed"     value="[Device Update UX] Set Post Update UX Complete Registry failed with HRESULT = %1." />
        <string id="Event.DeviceUpdateUX_SubscribeToWNF"                    value="[Device Update UX] Subscribing to %1." />
        <string id="Event.DeviceUpdateUX_UnsubscribeToWNF"                  value="[Device Update UX] Unsubscribing to %1." />
        <string id="Event.DeviceUpdateUX_UIXServiceAllocateStringFailed"    value="[Device Update UX] UIX Services Allocate String failed with HRESULT = %1." />
        <string id="Event.DeviceUpdateUX_StartScan"                         value="[Device Update UX] StartScan" />
        <string id="Event.DeviceUpdateUX_StartDownload"                     value="[Device Update UX] StartDownload" />
        <string id="Event.DeviceUpdateUX_GetDuaSvcState_Start"              value="[Device Update UX] GetDuaSvcState Start" />
        <string id="Event.DeviceUpdateUX_GetDuaSvcState_Stop"               value="[Device Update UX] GetDuaSvcState Stop" />
        <string id="Event.DeviceUpdateUX_LaunchingAppUri"                   value="[Device Update UX] Launching App Uri: %1" />
        <string id="Event.DeviceUpdateUX_LaunchingAppUriFailed"             value="[Device Update UX] App URI launch failed with HRESULT = %1, Uri = %2" />

        <string id="Event.DeviceUpdateUX_UpdateResultState"                 value="[Post Update UX] Update Result State: %1." />
        <string id="Event.DeviceUpdateUX_OnUserAction"                      value="[Post Update UX] User Action for %1." />
        <string id="Event.DeviceUpdateUX_ResetIdleTimerFailed"              value="[Post Update UX] Shell_IdleTimerReset failed with HRESULT = %1." />
        <string id="Event.DeviceUpdateUX_AdjustedProgress"                  value="[Post Update UX] Adjusted DMF Progress: TotalPhase = %1, CurrentPhase = %2, TotalSteps = %3, CurrentStep = %4." />
        <string id="Event.DeviceUpdateUX_DMFCompleteCallback"               value="[Post Update UX] WNF_DMF_MIGRATION_COMPLETE Callback: Complete = %1, Result = %2." />
        <string id="Event.DeviceUpdateUX_DMFProgressCallback"               value="[Post Update UX] WNF_DMF_MIGRATION_PROGRESS Callback: TotalPhase = %1, CurrentPhase = %2, TotalSteps = %3, CurrentStep = %4." />
        <string id="Event.DeviceUpdateUX_SetDMFComplete"                    value="[Post Update UX] SetDMFComplete - InstallResult: %1, DMFStatus: %2." />
        <string id="Event.DeviceUpdateUX_LockedEventCallback"               value="[Post Update UX] WNF_SHL_DEVICE_LOCK_STATE Callback: Current lock state = %1, current change stamp = %2, initial change stamp = %3." />
        <string id="Event.DeviceUpdateUX_UpdateSuccessBodyText"             value="[Post Update UX] Update Success Text: %1." />
        <string id="Event.DeviceUpdateUX_ShellLockFailed"                   value="[Post Update UX] Shell_Lock failed with HRESULT = %1." />

        <string id="Event.DeviceUpdateUX_SetAutoScanSetting"                value="[DuaSettings] Set AutoScan = %1." />
        <string id="Event.DeviceUpdateUX_SetAutoDownloadSetting"            value="[DuaSettings] Set AutoDownload = %1." />
        <string id="Event.DeviceUpdateUX_GetLastCheckTimeFailed"            value="[DuaSettings] GetLastCheckTime failed with HRESULT = %1." />
        <string id="Event.DeviceUpdateUX_StateChangeCallback"               value="[DuaSettings] WNF_DU_ENGINESTATE_CHANGE Callback: Engine State = %1." />
        <string id="Event.DeviceUpdateUX_ProgressChangeCallback"            value="[DuaSettings] WNF_DU_CORE_UPDATE_PROGRESS Callback: Engine State = %1, Progress = %2 percent." />
        <string id="Event.DeviceUpdateUX_ChangeSettings_Failed"             value="[DuaSettings] Could not change settings: DeviceUpdatePolicy = %1." />
        <string id="Event.DeviceUpdateUX_UpdatePolicyChangeCallback"        value="[DuaSettings] WNF_ENTR_UPDATE_POLICY_CHANGED Callback: PolicyNotification = %1." />

        <string id="Event.DeviceUpdateUX_NotificationArg"                   value="[Notification] CmdLine parameter: %1." />
        <string id="Event.DeviceUpdateUX_ARDAction"                         value="[Notification] ARD Action: %1." />
        <string id="Event.DeviceUpdateUX_ARDButtonPressed"                  value="[Notification] Button Pressed = %1." />
        <string id="Event.DeviceUpdateUX_CoreStateChange"                   value="[Notification] Queried core state change value: %1." />

        <string id="Event.FeatureDiscoveryUX_SetWiFiAutoConnectStateFailed"           value="[Feature Discovery] SetWiFiAutoConnectState failed, %1." />
        <string id="Event.FeatureDiscoveryUX_SetWiFiExchangeStateFailed"              value="[Feature Discovery] SetWiFiExchangeState failed, %1." />
        <string id="Event.FeatureDiscoveryUX_SetAdvertisingIdFailed"                  value="[Feature Discovery] SetAdvertisingId failed, %1." />
        <string id="Event.FeatureDiscoveryUX_SetAutoAppUpdatesFailed"                 value="[Feature Discovery] SetAutoAppUpdates failed, %1." />
        <string id="Event.FeatureDiscoveryUX_FeatureDiscoveryCompleteFailed"          value="[Feature Discovery] FeatureDiscoveryComplete failed, %1." />
        <string id="Event.FeatureDiscoveryUX_ModelInitializationFailed"               value="[Feature Discovery] Model Initialization failed, %1." />        
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
