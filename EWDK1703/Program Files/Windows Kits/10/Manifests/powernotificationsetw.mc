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
 
      <provider name="Microsoft-WindowsPhone-Power"
          guid="{5C103042-7E75-4629-A748-BDFA67607FAC}"
          symbol="MICROSOFT_WINDOWSPHONE_POWER"
          messageFileName="PowerNotif.dll"
          resourceFileName="PowerNotif.dll">

        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.PowerEvent.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.PowerEvent.Performance)" />
        </keywords>


        <tasks>
          <task value="1" name="PresenceDetect" />
          <task value="2" name="ScreenControl" />
        </tasks>

        <events>
            <event value="500"
                   symbol="PresenceDetect_Start"
                   task="PresenceDetect"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Start"
                   message="$(string.PowerEvent.PresenceDetectStart)" />

            <event value="501"
                   symbol="PresenceDetect_Stop"
                   task="PresenceDetect"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Stop"
                   message="$(string.PowerEvent.PresenceDetectStop)" />

            <event value="502"
                   symbol="PresenceDetectScreen_Off"
                   task="ScreenControl"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Start"
                   message="$(string.PowerEvent.PresenceDetectScreenOff)" />
                   
            <event value="503"
                   symbol="PresenceDetectScreen_On"
                   task="ScreenControl"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Stop"
                   message="$(string.PowerEvent.PresenceDetectScreenOn)" />
                   
            <event value="504"
                   symbol="ScreenOn"
                   task="ScreenControl"
                   keywords="Performance"
                   level="win:Informational"
                   opcode="win:Info"
                   message="$(string.PowerEvent.ScreenOn)" />

        </events>


      </provider>
     
      <provider name="Microsoft-WindowsPhone-PowerNotifications"
          guid="{9C86E843-828D-4C11-8C46-F1F0E25F1E5F}"
          symbol="MICROSOFT_WINDOWSPHONE_POWERNOTIFICATIONS"
          messageFileName="PowerNotif.dll"
          resourceFileName="PowerNotif.dll">
        
        <keywords>
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
          <keyword mask="0x0000000000000004" name="Error" />
          <keyword mask="0x0000000000000008" name="Information" />
          <keyword mask="0x0000000000000010" name="BatterySaver" />
          <keyword mask="0x0000000000000020" name="BatteryEstimator" />
          <keyword mask="0x0000000000010000" name="Shutdown" />
        </keywords>

        <templates>
        
          <template tid="SavingsStateTransitionTemplate">
            <!--%1--> <data name="newSavingsState" inType="win:UInt32" outType="win:HexInt32"/>
          </template>
          
          <template tid="SavingsTriggerTransitionTemplate">
            <!--%1--> <data name="newSavingsTriggerEnabled" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="newSavingsTriggerConfig" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%3--> <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GenericHRESULTFailureTemplate">
            <!--%1--> <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="AlgorithmHRESULTFailureTemplate">
            <!--%1--> <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="AlgorithmStep" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GetEstimateInMinutesResultTemplate">
            <!--%1--> <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="EstimateType" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%3--> <data name="BatteryLifePercent" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%4--> <data name="EstimateInMinutes" inType="win:UInt32" outType="win:HexInt32"/>
          </template>
   
          <template tid="GetDischargeSpanInMinutesResultTemplate">
            <!--%1--> <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="DischargeSpanInMinutes" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="ProcessPowerChangeTemplate">
            <!--%1--> <data name="ACLineStatus" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="BatteryFlags" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%3--> <data name="BatteryLifePercent" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="EstimateSavingsAdjustmentTemplate">
            <!--%1--> <data name="OriginalEstimateInMinutes" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="AdjustedEstimateInMinutes" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="PowerBroadcastNotificationTemplate">
            <!--%1--> <data name="BatteryLifePercent" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="LastBatteryLifePercent" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%3--> <data name="ShutdownLevel" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%4--> <data name="AcDcStatus" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="PowerCustomShutdownLevelReachedTemplate">
            <!--%1--> <data name="BatteryLifePercent" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="ShutdownLevel" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="PowerShutdownLevelConfigTemplate">
            <!--%1--> <data name="ShutdownLevel" inType="win:UInt32" outType="win:HexInt32"/>
          </template>
          
        </templates>

        <events>

          <event value="1"
              symbol="POWERNOTIFETW_SvcInitializeFailure"
              keywords="Error"
              level="win:Error"
              template="GenericHRESULTFailureTemplate"
              message="$(string.POWERNOTIF.ServiceInitializeFailure)" />
              
          <event value="2"
              symbol="POWERNOTIFETW_SvcRegisterRPCFailure"
              keywords="Error"
              level="win:Error"
              template="AlgorithmHRESULTFailureTemplate"
              message="$(string.POWERNOTIF.ServiceRPCInitializeFailure)" />

          <event value="50"
              symbol="POWERNOTIFETW_PowerShutdownLevelConfig"
              keywords="Information Shutdown"
              level="win:Informational"
              template="PowerShutdownLevelConfigTemplate"
              message="$(string.POWERNOTIF.PowerShutdownLevelConfig)" />

          <event value="51"
              symbol="POWERNOTIFETW_PowerBroadcastNotification"
              keywords="Information Shutdown"
              level="win:Informational"
              template="PowerBroadcastNotificationTemplate"
              message="$(string.POWERNOTIF.PowerBroadcastNotification)" />

          <event value="52"
              symbol="POWERNOTIFETW_PowerCustomShutdownLevelReached"
              keywords="Information Shutdown"
              level="win:Informational"
              template="PowerCustomShutdownLevelReachedTemplate"
              message="$(string.POWERNOTIF.PowerCustomShutdownLevelReached)" />

          <event value="100"
              symbol="POWERNOTIFETW_SavingsTransitionEvent"
              keywords="BatterySaver"
              level="win:Informational"
              template="SavingsStateTransitionTemplate"
              message="$(string.POWERNOTIF.SavingsTransitionEventMessage)" />

          <event value="101"
              symbol="POWERNOTIFETW_SavingsTriggerTransitionEvent"
              keywords="BatterySaver"
              level="win:Informational"
              template="SavingsTriggerTransitionTemplate"
              message="$(string.POWERNOTIF.SavingsTriggerTransitionEventMessage)" />

          <event value="102"
              symbol="POWERNOTIFETW_SavingsNoChangeEvent"
              keywords="BatterySaver"
              level="win:Informational"
              template="SavingsStateTransitionTemplate"
              message="$(string.POWERNOTIF.SavingsNoChangeEvent)" />

          <event value="103"
              symbol="POWERNOTIFETW_BatterySaverProcessPowerChange"
              keywords="BatterySaver"
              level="win:Informational"
              template="ProcessPowerChangeTemplate"
              message="$(string.POWERNOTIF.BatterySaverProcessPowerChange)" />

          <event value="104"
              symbol="POWERNOTIFETW_UsingDefaultBatterySaverTriggerInfoEvent"
              keywords="BatterySaver"
              level="win:Informational"
              template="GenericHRESULTFailureTemplate"
              message="$(string.POWERNOTIF.UsingDefaultBatterySaverTriggerInfoEvent)" />
              
          <event value="1000"
              symbol="POWERNOTIFETW_BatterySaverInitializeFailure"
              keywords="BatterySaver"
              level="win:Error"
              template="GenericHRESULTFailureTemplate"
              message="$(string.POWERNOTIF.BatterySaverInitializeFailure)" />

          <event value="1001"
              symbol="POWERNOTIFETW_BatterySaverWNFBroadcastFailure"
              keywords="BatterySaver"
              level="win:Error"
              template="GenericHRESULTFailureTemplate"
              message="$(string.POWERNOTIF.BatterySaverWNFBroadcastFailure)" />

          <event value="1002"
              symbol="POWERNOTIFETW_BatterySaverGetSystemPowerStatusFailure"
              keywords="BatterySaver"
              level="win:Error"
              template="GenericHRESULTFailureTemplate"
              message="$(string.POWERNOTIF.BatterySaverGetSystemPowerStatusFailure)" />

          <event value="1003"
              symbol="POWERNOTIFETW_BatterySaverOOBERestoreRegisterFailure"
              keywords="BatterySaver"
              level="win:Error"
              template="GenericHRESULTFailureTemplate"
              message="$(string.POWERNOTIF.BatterySaverOOBERestoreRegisterFailure)" />

          <event value="1004"
              symbol="POWERNOTIFETW_BatterySaverOOBERestoreReceived"
              keywords="BatterySaver"
              level="win:Informational"
              message="$(string.POWERNOTIF.BatterySaverOOBERestoreReceived)" />

          <event value="2000"
              symbol="POWERNOTIFETW_BatteryEstimatorInitializeFailure"
              keywords="BatteryEstimator"
              level="win:Error"
              template="GenericHRESULTFailureTemplate"
              message="$(string.POWERNOTIF.BatteryEstimatorInitializeFailure)" />

          <event value="2001"
              symbol="POWERNOTIFETW_GetEstimateInMinutesFailure"
              keywords="BatteryEstimator"
              level="win:Error"
              template="GetEstimateInMinutesResultTemplate"
              message="$(string.POWERNOTIF.GetEstimateInMinutesResult)" />

          <event value="2002"
              symbol="POWERNOTIFETW_GetDischargeSpanInMinutesFailure"
              keywords="BatteryEstimator"
              level="win:Error"
              template="GenericHRESULTFailureTemplate"
              message="$(string.POWERNOTIF.GetDischargeSpanInMinutesFailure)" />

          <event value="2003"
              symbol="POWERNOTIFETW_GetDischargeSpanInMinutesSuccess"
              keywords="BatteryEstimator"
              level="win:Informational"
              template="GetDischargeSpanInMinutesResultTemplate"
              message="$(string.POWERNOTIF.GetDischargeSpanInMinutesSuccess)" />

          <event value="2004"
              symbol="POWERNOTIFETW_EstimateSavingsAdjustment"
              keywords="BatteryEstimator"
              level="win:Informational"
              template="EstimateSavingsAdjustmentTemplate"
              message="$(string.POWERNOTIF.EstimateSavingsAdjustment)" />

          <event value="2005"
              symbol="POWERNOTIFETW_GetEstimateInMinutesSuccess"
              keywords="BatteryEstimator"
              level="win:Informational"
              template="GetEstimateInMinutesResultTemplate"
              message="$(string.POWERNOTIF.GetEstimateInMinutesResult)" />

          <event value="2006"
              symbol="POWERNOTIFETW_BatteryEstimatorProcessPowerChange"
              keywords="BatteryEstimator"
              level="win:Informational"
              template="ProcessPowerChangeTemplate"
              message="$(string.POWERNOTIF.BatteryEstimatorProcessPowerChange)" />
          
        </events>

      </provider>
    </events>
  </instrumentation>

  <!-- Localizable strings for the PowerNotifications Events -->
  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="PowerEvent.Error"                      value="Error" />
        <string id="PowerEvent.Performance"                value="Performance" />

        <string id="PowerEvent.PresenceDetectStart"               value="PresenceDetect Start" />
        <string id="PowerEvent.PresenceDetectStop"                value="PresenceDetect Stop" />
        <string id="PowerEvent.PresenceDetectScreenOff"           value="PresenceDetectScreen Off" />
        <string id="PowerEvent.PresenceDetectScreenOn"            value="PresenceDetectScreen On" />
        <string id="PowerEvent.ScreenOn"                          value="ScreenOn" />

        <string id="POWERNOTIF.ServiceInitializeFailure" value="PowerNotif service failed to initialize. HRESULT: %1" />
        <string id="POWERNOTIF.ServiceRPCInitializeFailure" value="PowerNotif service failed to initialize RPC step %2. HRESULT: %1" />

        <string id="POWERNOTIF.PowerShutdownLevelConfig" value="PowerNotif battery shutdown level configuration: %1" />
        <string id="POWERNOTIF.PowerBroadcastNotification" value="PowerNotif broadcast notification. BatteryLife %1, Previous BatteryLife %2, shutdown level %3, AcDcStatus %4" />
        <string id="POWERNOTIF.PowerCustomShutdownLevelReached" value="PowerNotif custom battery shutdown level reached. BatteryLife %1, shutdown level %2" />

        <string id="POWERNOTIF.SavingsTransitionEventMessage" value="BatterySaver current state updated, new state: %1" />
        <string id="POWERNOTIF.SavingsNoChangeEvent" value="BatterySaver state stayed the same, state: %1" />
        <string id="POWERNOTIF.SavingsTriggerTransitionEventMessage" value="BatterySaver trigger configuration updated, state: %1 config: %2. Save to regustry HRESULT: %3" />
     
        <string id="POWERNOTIF.BatterySaverInitializeFailure" value="BatterySaver failed to initialize. HRESULT:  %1" />
        <string id="POWERNOTIF.BatterySaverOOBERestoreRegisterFailure" value="BatterySaver failed to registery for WNF_SHL_OOBE_RESTORE_COMPLETE. HRESULT:  %1" />
        <string id="POWERNOTIF.BatterySaverOOBERestoreReceived" value="BatterySaver received a WNF_SHL_OOBE_RESTORE_COMPLETE notification, updating triggers..." />
        
        <string id="POWERNOTIF.UsingDefaultBatterySaverTriggerInfoEvent" value="BatterySaver failed to read trigger from registry. Using default trigger. HRESULT:  %1" />
        <string id="POWERNOTIF.BatterySaverWNFBroadcastFailure" value="BatterySaver failed to send WNF broadcast. HRESULT:  %1" />
        <string id="POWERNOTIF.BatterySaverGetSystemPowerStatusFailure" value="BatterySaver failed to obtain power information from GetSystemPowerStatus. HRESULT: %1" />
        <string id="POWERNOTIF.BatterySaverProcessPowerChange" value="BatterySaver processing power change. ACLineStatus %1, BatteryFlag %2, BatteryLifePercent: %3" />  

        <string id="POWERNOTIF.BatteryEstimatorInitializeFailure" value="BatteryEstimator failed to initialize. HRESULT:  %1" />
        <string id="POWERNOTIF.BatteryEstimatorProcessPowerChange" value="BatteryEstimator processing power change. ACLineStatus %1, BatteryFlag %2, BatteryLifePercent: %3" />  
        <string id="POWERNOTIF.GetEstimateInMinutesResult" value="BatteryEstimator.GetEstimateInMinutes result HRESULT: %1, EstimateType: %2, BatteryLifePercent: %3, Estimate: %4 minutes" />
        <string id="POWERNOTIF.GetDischargeSpanInMinutesFailure" value="BatteryEstimator.GetDischargeSpanInMinutesFailure failed HRESULT: %1" />
        <string id="POWERNOTIF.GetDischargeSpanInMinutesSuccess" value="BatteryEstimator.GetDischargeSpanInMinutesFailure succeeded HRESULT: %1, Discharge span: %2 minutes" />
        <string id="POWERNOTIF.EstimateSavingsAdjustment" value="EstimateSavingsAdjustment done. Original estimate: %1 minutes, adjusted estimate: %2 minutes" />

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
