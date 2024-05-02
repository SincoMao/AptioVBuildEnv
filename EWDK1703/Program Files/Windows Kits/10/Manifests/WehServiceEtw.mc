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
      <provider name="Microsoft-WindowsPhone-WEHService-Provider"
          guid="{D4D7B3D1-37BE-456A-87AF-3243318382D0}"
          symbol="WP_WEHService_PROVIDER"
          messageFileName="WEHServiceEtw.mc"
          resourceFileName="wehsvc.dll">

        <maps>
          <valueMap name="WEHServiceFunctionIndex">
            <!-- Please append new function entry to the end. Don't change the function index. -->
            <!-- Please also add the new function name to corresponding string id. -->
            <map value="1"
                 message="$(string.WEHService.WEHServiceFunctionIndex.1.FunctionName)"/>
            <map value="2"
                 message="$(string.WEHService.WEHServiceFunctionIndex.2.FunctionName)"/>
            <map value="3"
                 message="$(string.WEHService.WEHServiceFunctionIndex.3.FunctionName)"/>
            <map value="4"
                 message="$(string.WEHService.WEHServiceFunctionIndex.4.FunctionName)"/>
            <map value="5"
                 message="$(string.WEHService.WEHServiceFunctionIndex.5.FunctionName)"/>
            <map value="6"
                 message="$(string.WEHService.WEHServiceFunctionIndex.6.FunctionName)"/>
            <map value="7"
                 message="$(string.WEHService.WEHServiceFunctionIndex.7.FunctionName)"/>
            <map value="8"
                 message="$(string.WEHService.WEHServiceFunctionIndex.8.FunctionName)"/>
            <map value="9"
                 message="$(string.WEHService.WEHServiceFunctionIndex.9.FunctionName)"/>
            <map value="12"
                 message="$(string.WEHService.WEHServiceFunctionIndex.12.FunctionName)"/>
            <map value="13"
                 message="$(string.WEHService.WEHServiceFunctionIndex.13.FunctionName)"/>
            <!-- Please append new function entry to the end. Don't change the function index. -->
          </valueMap>

          <valueMap name="ExternalFunctionIndex">
            <!-- Please append new function entry to the end. Don't change the function index. -->
            <!-- Please also add the new function name to corresponding string id. -->
            <map value="1"
                 message="$(string.WEHService.ExternalFunctionIndex.1.FunctionName)"/>
            <map value="2"
                 message="$(string.WEHService.ExternalFunctionIndex.2.FunctionName)"/>
            <map value="3"
                 message="$(string.WEHService.ExternalFunctionIndex.3.FunctionName)"/>
            <map value="4"
                 message="$(string.WEHService.ExternalFunctionIndex.4.FunctionName)"/>
            <map value="5"
                 message="$(string.WEHService.ExternalFunctionIndex.5.FunctionName)"/>
            <!-- Please append new function entry to the end. Don't change the function index. -->
          </valueMap>
          
        </maps>

        <templates>

          <template tid="SingleDWORD">
            <data name="Prop_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="TwoDWORD">
            <data name="Prop1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Prop2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="ThreeDWORD">
            <data name="Prop1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Prop2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Prop3_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="SingleStringSingleDWORD">
            <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string" />
            <data name="Prop_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="SingleString">
            <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="FunctionIndex">
            <data name="Prop_UInt32_1" inType="win:UInt32" map="WEHServiceFunctionIndex" />
          </template>

          <template tid="FunctionResult">
            <data name="Prop_UInt32_1" inType="win:UInt32" map="WEHServiceFunctionIndex" />
            <data name="Prop_UInt32_2" inType="win:UInt32" outType="xs:HexInt32" />
          </template>
          <template tid="ExternalFunctionResult">
            <data name="Prop_UInt32_1" inType="win:UInt32" map="ExternalFunctionIndex" />
            <data name="Prop_UInt32_2" inType="win:UInt32" outType="xs:HexInt32" />
          </template>
        </templates>

        <events>
          <event value="1"
          level="win:Verbose"
          symbol="FunctionEntryPointEvent"
          template="FunctionIndex"
          message="$(string.WEHService.FunctionEntryPointEventMessage)"/>

          <event value="2"
          level="win:Verbose"
          symbol="FunctionReturnValueEvent"
          template="FunctionResult"
          message="$(string.WEHService.FunctionReturnValueEventEventMessage)"/>

          <event value="3"
          level="win:Verbose"
          symbol="FunctionCallReturned"
          template="ExternalFunctionResult"
          message="$(string.WEHService.FunctionCallReturnedMessage)"/>

          <event value="4"
          level="win:Error"
          symbol="ApplyLockdownFailure"
          template="SingleDWORD"
          message="$(string.WEHService.ApplyLockdownFailureMessage)"/>

          <event value="5"
          level="win:Error"
          symbol="ApplyDefaultLockdownFailure"
          template="SingleDWORD"
          message="$(string.WEHService.ApplyLockdownFailureMessage)"/>
          
        </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="WEHService.WEHServiceFunctionIndex.1.FunctionName"
              value="DefaultLockdown::StartDefaultLockdownCallbackStatic"/>
        <string id="WEHService.WEHServiceFunctionIndex.2.FunctionName"
              value="DefaultLockdown::WaitForStartDefaultLockdownNotification"/>
        <string id="WEHService.WEHServiceFunctionIndex.3.FunctionName"
              value="ServiceMain"/>
        <string id="WEHService.WEHServiceFunctionIndex.4.FunctionName"
              value="SvcInitialize"/>
        <string id="WEHService.WEHServiceFunctionIndex.5.FunctionName"
              value="SvcUninitialize"/>
        <string id="WEHService.WEHServiceFunctionIndex.6.FunctionName"
              value="RegisterForNotifications"/>
        <string id="WEHService.WEHServiceFunctionIndex.7.FunctionName"
              value="WehPacmanNotifSink::HandleLifeCycleNotification"/>
        <string id="WEHService.WEHServiceFunctionIndex.8.FunctionName"
              value="WEHFlash.CreateContext"/>
        <string id="WEHService.WEHServiceFunctionIndex.9.FunctionName"
              value="WEHFlash.CloseContext"/>
        <string id="WEHService.WEHServiceFunctionIndex.12.FunctionName"
              value="WEHFlash.RegisterWEHFlashRPCInterface"/>
        <string id="WEHService.WEHServiceFunctionIndex.13.FunctionName"
              value="WEHFlash.UnregisterWEHFlashRPCInterface"/>
        <string id="WEHService.ExternalFunctionIndex.1.FunctionName"
              value="CoInitialize"/>
        <string id="WEHService.ExternalFunctionIndex.2.FunctionName"
              value="RegisterServiceCtrlHandlerW"/>
        <string id="WEHService.ExternalFunctionIndex.3.FunctionName"
              value="CreateEvent"/>
        <string id="WEHService.ExternalFunctionIndex.4.FunctionName"
              value="CoCreateInstance"/>
        <string id="WEHService.ExternalFunctionIndex.5.FunctionName"
              value="LockDownMgrPinAppToStartIfNeeded"/>
        <string id="WEHService.FunctionReturnValueEventEventMessage"
              value="Return value from function %1. HR = %2."/>
        <string id="WEHService.FunctionCallReturnedMessage"
              value="Function %1 returned, HR = %2." />
        <string id="WEHService.FunctionEntryPointEventMessage"
              value="Function entry - %1."/>
        <string id="WEHService.ApplyLockdownFailureMessage"
              value="Failed to apply lockdown profile, hresult error = %1"/>
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
