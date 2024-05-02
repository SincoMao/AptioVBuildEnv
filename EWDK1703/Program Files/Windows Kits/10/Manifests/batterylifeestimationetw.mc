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
      
      <provider name="Microsoft-WindowsPhone-BatteryLifeEstimations"
          guid="{CDC1F6F4-5E70-11E1-8D83-5CA74824019B}"
          symbol="MICROSOFT_WINDOWSPHONE_BATTERYLIFEESTIMATIONS"
          messageFileName="PowerNotif.dll"
          resourceFileName="PowerNotif.dll">
        
        <keywords>
          <keyword mask="0x0000000000000001" name="Debug" />
          <keyword mask="0x0000000000000002" name="Performance" />
          <keyword mask="0x0000000000000004" name="Error" />
          <keyword mask="0x0000000000000008" name="Information" />
          <keyword mask="0x0000000000000010" name="RecordBasedEstimation" />
          <keyword mask="0x0000000000000020" name="LinearBasedEstimation" />
        </keywords>

        <templates>

          <template tid="GenericHRESULTFailureTemplate">
            <!--%1--> <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="AlgorithmHRESULTFailureTemplate">
            <!--%1--> <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="AlgorithmStep" inType="win:UInt32" outType="win:HexInt32"/>
          </template>
        
          <template tid="LinearEstimatorSeedUpdatedTemplate">
            <!--%1--> <data name="RatePerHour" inType="win:Float" outType="xs:float"/>
          </template>

          <template tid="LinearEstimatorEstimateFromSeedTemplate">
            <!--%1--> <data name="EstimateInMinutes" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="BatteryPercentage" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%3--> <data name="UsedRatePerHour" inType="win:Float" outType="xs:float"/>
          </template>

          <template tid="LinearEstimatorBlendedEstimateTemplate">
            <!--%1--> <data name="EstimateInMinutes" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="BatteryPercentage" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%3--> <data name="RealtimeRatePerHour" inType="win:Float" outType="xs:float"/>
            <!--%4--> <data name="LinearRatePerHour" inType="win:Float" outType="xs:float"/>
            <!--%5--> <data name="UsedRatePerHour" inType="win:Float" outType="xs:float"/>
          </template>

          <template tid="TimeRecordEstimatorEstimateTemplate">
            <!--%1--> <data name="EstimateType" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="EstimateInHours" inType="win:Float" outType="xs:float"/>
            <!--%3--> <data name="EstimateErrorInHours" inType="win:Float" outType="xs:float"/>
            <!--%4--> <data name="BatteryPercentage" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%5--> <data name="ActiveRecordCount" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%6--> <data name="ConvergingRecordCount" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="EstimateFailureTemplate">
            <!--%1--> <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="EstimateType" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%3--> <data name="BatteryLifePercent" inType="win:UInt32" outType="win:HexInt32"/>
          </template>
   
          <template tid="TimeRecordEstimatorPartialResultTemplate">
            <!--%1--> <data name="EstimateInHours" inType="win:Float" outType="xs:float"/>
            <!--%2--> <data name="EstimateErrorInHours" inType="win:Float" outType="xs:float"/>
            <!--%3--> <data name="RemainingBattery" inType="win:Float" outType="xs:float"/>
            <!--%4--> <data name="ActiveRecordCount" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%5--> <data name="ConvergingRecordCount" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="TimeRecordEstimatorBeginLoopTemplate">
            <!--%1--> <data name="RemainingBattery" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="DayOfWeek" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%3--> <data name="RecordOfDay" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%4--> <data name="HoursLeftInRecord" inType="win:Float" outType="xs:float"/>
          </template>

          <template tid="TimeRecordAttributionCommitTemplate">
            <!--%1--> <data name="WeekDay" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="RecordInDay" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%3--> <data name="DeltaMinutes" inType="win:Float" outType="xs:float"/>
            <!--%4--> <data name="DeltaPercent" inType="win:Float" outType="xs:float"/>
            <!--%5--> <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="ActivityRecordAttributionCommitTemplate">
            <!--%1--> <data name="Activity" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="DeltaMinutes" inType="win:Float" outType="xs:float"/>
            <!--%3--> <data name="DeltaPercent" inType="win:Float" outType="xs:float"/>
            <!--%4--> <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="RecordsFileResetTemplate">
            <!--%1--> <data name="OldVersion" inType="win:UInt32" outType="win:HexInt32"/>
            <!--%2--> <data name="NewVersion" inType="win:UInt32" outType="win:HexInt32"/>
          </template>
          
        </templates>

        <events>

          <event value="1"
              symbol="BATTERYLIFEESTIMATIONSETW_LinearEstimatorSeedUpdated"
              keywords="LinearBasedEstimation"
              level="win:Informational"
              template="LinearEstimatorSeedUpdatedTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.LinearEstimatorSeedUpdated)" />

          <event value="2"
              symbol="BATTERYLIFEESTIMATIONSETW_LinearEstimatorSeedSaveFailed"
              keywords="LinearBasedEstimation"
              level="win:Error"
              template="GenericHRESULTFailureTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.LinearEstimatorSeedSaveFailed)" />
              
          <event value="3"
              symbol="BATTERYLIFEESTIMATIONSETW_TimeSinceChargedSaveFailed"
              keywords="LinearBasedEstimation"
              level="win:Error"
              template="GenericHRESULTFailureTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.TimeSinceChargedSaveFailed)" />
              
          <event value="4"
              symbol="BATTERYLIFEESTIMATIONSETW_LinearEstimatorEstimateFromSeed"
              keywords="LinearBasedEstimation"
              level="win:Informational"
              template="LinearEstimatorEstimateFromSeedTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.LinearEstimatorEstimateFromSeed)" />

          <event value="5"
              symbol="BATTERYLIFEESTIMATIONSETW_LinearEstimatorBlendedEstimate"
              keywords="LinearBasedEstimation"
              level="win:Informational"
              template="LinearEstimatorBlendedEstimateTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.LinearEstimatorBlendedEstimate)" />

          <event value="6"
              symbol="BATTERYLIFEESTIMATIONSETW_TimeRecordEstimatorEstimate"
              keywords="RecordBasedEstimation"
              level="win:Informational"
              template="TimeRecordEstimatorEstimateTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.TimeRecordEstimatorEstimate)" />

          <event value="7"
              symbol="BATTERYLIFEESTIMATIONSETW_TimeRecordEstimatorEstimateFailure"
              keywords="RecordBasedEstimation"
              level="win:Error"
              template="EstimateFailureTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.TimeRecordEstimatorEstimateFailure)" />

          <event value="8"
              symbol="BATTERYLIFEESTIMATIONSETW_TimeRecordEstimatorPartialResult"
              keywords="RecordBasedEstimation"
              level="win:Verbose"
              template="TimeRecordEstimatorPartialResultTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.TimeRecordEstimatorPartialResult)" />

          <event value="9"
              symbol="BATTERYLIFEESTIMATIONSETW_InitialRecordAttributionFailure"
              keywords="RecordBasedEstimation"
              level="win:Error"
              template="GenericHRESULTFailureTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.InitialRecordAttributionFailure)" />

          <event value="10"
              symbol="BATTERYLIFEESTIMATIONSETW_TimeRecordAttributionCommit"
              keywords="RecordBasedEstimation"
              level="win:Verbose"
              template="TimeRecordAttributionCommitTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.TimeRecordAttributionCommit)" />

          <event value="11"
              symbol="BATTERYLIFEESTIMATIONSETW_ActivityRecordAttributionCommit"
              keywords="RecordBasedEstimation"
              level="win:Verbose"
              template="ActivityRecordAttributionCommitTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.ActivityRecordAttributionCommit)" />

          <event value="12"
              symbol="BATTERYLIFEESTIMATIONSETW_RecordsFileCreateOpenFailure"
              keywords="RecordBasedEstimation"
              level="win:Error"
              template="AlgorithmHRESULTFailureTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.RecordsFileCreateOpenFailure)" />

          <event value="13"
              symbol="BATTERYLIFEESTIMATIONSETW_RecordsFileReset"
              keywords="RecordBasedEstimation"
              level="win:Informational"
              template="RecordsFileResetTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.RecordsFileReset)" />

          <event value="14"
              symbol="BATTERYLIFEESTIMATIONSETW_TimeRecordEstimatorNotEnoughDataYet"
              keywords="RecordBasedEstimation"
              level="win:Informational"
              message="$(string.BATTERYLIFEESTIMATIONS.TimeRecordEstimatorNotEnoughDataYet)" />

          <event value="15"
              symbol="BATTERYLIFEESTIMATIONSETW_TimeRecordEstimatorBeginLoop"
              keywords="RecordBasedEstimation"
              level="win:Verbose"
              template="TimeRecordEstimatorBeginLoopTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.TimeRecordEstimatorBeginLoop)" />
              
          <event value="16"
              symbol="BATTERYLIFEESTIMATIONSETW_TimeRecordEstimatorSaveRecordsFailed"
              keywords="RecordBasedEstimation"
              level="win:Error"
              template="GenericHRESULTFailureTemplate"
              message="$(string.BATTERYLIFEESTIMATIONS.TimeRecordEstimatorSaveRecordsFailed)" />
              

        </events>

      </provider>
    </events>
  </instrumentation>

  <!-- Localizable strings for the BatteryLifeEstimations Events -->
  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="BATTERYLIFEESTIMATIONS.LinearEstimatorSeedUpdated" value="LinearEstimator: Updated linear discharge seed to: %1 percent per hour" />
        <string id="BATTERYLIFEESTIMATIONS.LinearEstimatorSeedSaveFailed" value="LinearEstimator: Failed to save linear discharge seed in the registry HRESULT: %1" />
        <string id="BATTERYLIFEESTIMATIONS.TimeSinceChargedSaveFailed" value="LinearEstimator: Failed to save time since charged in the registry HRESULT: %1" />
        <string id="BATTERYLIFEESTIMATIONS.LinearEstimatorBlendedEstimate" value="LinearEstimator: Blended estimate produced: %1 minutes. (BatteryPercentage: %2, RealTimeRate: %3, LinearRate: %4, UsedRate: %5)" />
        <string id="BATTERYLIFEESTIMATIONS.LinearEstimatorEstimateFromSeed" value="LinearEstimator: Seeded estimate produced: %1 minutes. (BatteryPercentage: %2, UsedRate: %3)" />
        <string id="BATTERYLIFEESTIMATIONS.TimeRecordEstimatorEstimate" value="TimeRecordEstimator: Estimate produced: type %1, estimate: %2 hours (+/- %3 hr). (BatteryPercentage: %4, ActiveRecordCount: %5, ConvergingRecordCount: %6)" />
        <string id="BATTERYLIFEESTIMATIONS.TimeRecordEstimatorEstimateFailure" value="TimeRecordEstimator: Failed to produce estimate. HRESULT %1, EstimateType %2 BatteryPercentage %3" />
        <string id="BATTERYLIFEESTIMATIONS.TimeRecordEstimatorPartialResult" value="TimeRecordEstimator: Partial Result: %1 hours (+/- %2 hr). (BatteryPercentage: %3, ActiveRecordCount: %4, ConvergingRecordCount: %5)" />
        <string id="BATTERYLIFEESTIMATIONS.InitialRecordAttributionFailure" value="EstimationUpdater: ActivateAccumulatorFromTimestamp initial attribution failed HRESULT: %1" />
        <string id="BATTERYLIFEESTIMATIONS.TimeRecordAttributionCommit" value="EstimationUpdater: weekDay: %1, recordInDay: %2, delta.minutes: %3, delta.percent: %4, HRESULT: %5" />
        <string id="BATTERYLIFEESTIMATIONS.ActivityRecordAttributionCommit" value="EstimationUpdater: activity %1, delta.minutes: %2, delta.percent: %3, HRESULT %4" />
        <string id="BATTERYLIFEESTIMATIONS.RecordsFileCreateOpenFailure" value="EstimationAccumulatorSet: Failed to create-or-open records file (step %2) HRESULT: %1" />
        <string id="BATTERYLIFEESTIMATIONS.RecordsFileReset" value="EstimationAccumulatorSet: Record file reset. Old version %1, New version %2" />
        <string id="BATTERYLIFEESTIMATIONS.TimeRecordEstimatorNotEnoughDataYet" value="TimeRecordEstimator: not enough data in estimation records to produce record based estimations." />
        <string id="BATTERYLIFEESTIMATIONS.TimeRecordEstimatorBeginLoop" value="TimeRecordEstimator: begin record loop. BatteryPercentage: %1, DayOfWeek %2, RecordInDay %3, HoursLeftInRecord %4" />
        <string id="BATTERYLIFEESTIMATIONS.TimeRecordEstimatorSaveRecordsFailed" value="TimeRecordEstimator: Failed to save records to file. HRESULT: %1" />
        
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
