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
      <provider name="Microsoft-WindowsPhone-EnterpriseExtCsps-Provider"
          guid="{60786989-4114-4374-A36A-339DDF60482D}"
          symbol="WP_EnterpriseExtCsps_PROVIDER"
          messageFileName="EnterpriseExtCsps.dll"
          resourceFileName="EnterpriseExtCsps.dll">

        <maps>
          <valueMap name="EnterpriseExtCspsFunctionIndex" symbol="ENTEXT_FUNCS">
            <!-- Please append new function entry to the end. Don't change the function index. -->
            <!-- Please also add the new function name to corresponding string id. -->

            <!-- EnterpriseExtFileSystem. -->            
            <map value="23"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.23.FunctionName)"/>
            <map value="24"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.24.FunctionName)"/>
            <map value="25"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.25.FunctionName)"/>
            <map value="26"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.26.FunctionName)"/>
            <map value="27"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.27.FunctionName)"/>
            <map value="28"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.28.FunctionName)"/>
            <map value="29"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.29.FunctionName)"/>
            <map value="30"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.30.FunctionName)"/>
            <map value="31"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.31.FunctionName)"/>
            <map value="32"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.32.FunctionName)"/>
            <map value="33"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.33.FunctionName)"/>
            <map value="34"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.34.FunctionName)"/>
            <map value="35"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.35.FunctionName)"/>
            <map value="36"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.36.FunctionName)"/>
            <map value="37"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.37.FunctionName)"/>
            <map value="38"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.38.FunctionName)"/>
            <map value="39"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.39.FunctionName)"/>
            <map value="40"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.40.FunctionName)"/>

            <!-- EnterpriseExtRootNode. -->
            <map value="42"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.42.FunctionName)"/>
            <map value="43"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.43.FunctionName)"/>
            <map value="44"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.44.FunctionName)"/>
            
            <!-- Custom Data. -->            
            <map value="46"
                 message="$(string.EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_CreateNodeInstance)"/>
            <map value="47"
                 message="$(string.EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_GetValue)"/>
            <map value="48"
                 message="$(string.EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_SetValue)"/>
            <map value="49"
                 message="$(string.EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_GetChildNodeNames)"/>
            <map value="50"
                 message="$(string.EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_Init)"/>
            <map value="51"
                 message="$(string.EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_InitRegistry)"/>
            <map value="52"
                 message="$(string.EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_GetBackupRegFilePath)"/>
            <map value="53"
                 message="$(string.EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_LoadRegistry)"/>
            <map value="54"
                 message="$(string.EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_BackupRegistry)"/>
            <map value="55"
                 message="$(string.EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_GetRegistryValueName)"/>
            
            <!-- Brightness Node. -->
            <map value="56"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.56.FunctionName)"/>            
            <map value="57"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.57.FunctionName)"/>
            <map value="58"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.58.FunctionName)"/>
            <map value="59"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.59.FunctionName)"/>
            <map value="60"
                 message="$(string.EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.60.FunctionName)"/>
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
            <data name="Prop_UInt32_1" inType="win:UInt32" map="EnterpriseExtCspsFunctionIndex" />
          </template>

          <template tid="FunctionResult">
            <data name="Prop_UInt32_1" inType="win:UInt32" map="EnterpriseExtCspsFunctionIndex" />
            <data name="Prop_UInt32_2" inType="win:UInt32" outType="xs:HexInt32" />
          </template>

          <template tid="ErrorHR">
            <data name="Prop_UInt32" inType="win:UInt32" outType="xs:HexInt32" />
          </template>

          <template tid="SingleBoolean">
            <data name="Prop_UInt32" inType="win:Boolean"/>
          </template>

          <template tid="ErrorHROneDWORD">
            <data name="Prop_UInt32_1" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="Prop_UInt32_2" inType="win:UInt32" />
          </template>
            
        </templates>

        <events>

          <!-- General Events -->
          <event value="1"
          level="win:Verbose"
          symbol="FunctionEntryPointEvent"
          template="FunctionIndex"
          message="$(string.EnterpriseExtCsps.FunctionEntryPointEventMessage)"/>

          <event value="2"
          level="win:Verbose"
          symbol="FunctionReturnValueEvent"
          template="FunctionResult"
          message="$(string.EnterpriseExtCsps.FunctionReturnValueEventEventMessage)"/>

          <!-- EnterpriseFilesystemCsp -->          
          <event value="8"
          level="win:Error"
          symbol="FileSystemNodeDeleteChildFailedEvent"
          template="ErrorHR"
          message="$(string.EnterpriseExtCsps.FileSystemNodeDeleteChildFailedEventEventMessage)"/>

          <!-- CLedAlertNode events (100-199) -->
          <event value="100"
          symbol="CLedAlertNodeHandleState"
          level="win:Informational"
          template="ErrorHROneDWORD"
          message="$(string.CLedAlertNodeHandleState)" />

          <event value="101"
          symbol="CLedAlertNodeHandleIntensity"
          level="win:Informational"
          template="ErrorHROneDWORD"
          message="$(string.CLedAlertNodeHandleIntensity)" />

          <event value="102"
          symbol="CLedAlertNodeHandlePeriod"
          level="win:Informational"
          template="ErrorHROneDWORD"
          message="$(string.CLedAlertNodeHandlePeriod)" />

          <event value="103"
          symbol="CLedAlertNodeHandleCyclecount"
          level="win:Informational"
          template="ErrorHROneDWORD"
          message="$(string.CLedAlertNodeHandleCyclecount)" />

          <event value="104"
          symbol="CLedAlertNodeHandleDutycycle"
          level="win:Informational"
          template="ErrorHROneDWORD"
          message="$(string.CLedAlertNodeHandleDutycycle)" />

          <event value="105"
          symbol="CLedAlertNodeInternalSetValue"
          level="win:Informational"
          template="ErrorHR"
          message="$(string.CLedAlertNodeInternalSetValue)" />

          <event value="106"
          symbol="CLedAlertNodeCreateNodeInstance"
          level="win:Informational"
          template="ErrorHR"
          message="$(string.CLedAlertNodeCreateNodeInstance)" />

          <event value="107"
          symbol="CLedAlertNodeAdd"
          level="win:Informational"
          template="ErrorHR"
          message="$(string.CLedAlertNodeAdd)" />

          <event value="108"
          symbol="CLedAlertNodeStoreLedAlertSettings"
          level="win:Informational"
          template="ErrorHR"
          message="$(string.CLedAlertNodeStoreLedAlertSettings)" />

          <event value="109"
          symbol="CLedAlertNodeApplyLedAlertSettings"
          level="win:Informational"
          template="ErrorHR"
          message="$(string.CLedAlertNodeApplyLedAlertSettings)" />

          <event value="110"
          symbol="CLedAlertNodeReceivedAllParams"
          level="win:Informational"
          template="SingleBoolean"
          message="$(string.CLedAlertNodeReceivedAllParams)" />

          <event value="111"
          symbol="CLedAlertNodeGetChildNodeNames"
          level="win:Informational"
          template="ErrorHR"
          message="$(string.CLedAlertNodeGetChildNodeNames)" />

          <event value="112"
          symbol="CLedAlertNodeGetValue"
          level="win:Informational"
          template="ErrorHROneDWORD"
          message="$(string.CLedAlertNodeGetValue)" />

          <event value="113"
          symbol="CLedAlertNodeSetValue"
          level="win:Informational"
          template="ErrorHR"
          message="$(string.CLedAlertNodeSetValue)" />

        </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <!-- EnterpriseFilesystemCspNode methods --> 
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.23.FunctionName"
              value="WehFileSystemNode::CreateNodeInstance"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.24.FunctionName"
              value="WehFileSystemNode::QueryInterface"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.25.FunctionName"
              value="WehFileSystemNode::Initialize"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.26.FunctionName"
              value="WehFileSystemNode::GetChildNodeNames"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.27.FunctionName"
              value="WehFileSystemNode::FindFiles"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.28.FunctionName"
              value="WehFileSystemNode::ConvertVectorToBstrArray"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.29.FunctionName"
              value="WehFileSystemNode::Add"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.30.FunctionName"
              value="WehFileSystemNode::DeleteChild"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.31.FunctionName"
              value="WehFileSystemNode::GetValue"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.32.FunctionName"
              value="WehFileSystemNode::SetValue"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.33.FunctionName"
              value="WehFileSystemNode::GetProperty"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.34.FunctionName"
              value="WehFileSystemNode::SetFileProperty"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.35.FunctionName"
              value="WehFileSystemNode::SetDirectoryProperty"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.36.FunctionName"
              value="WehFileSystemNode::GetFileProperty"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.37.FunctionName"
              value="WehFileSystemNode::GetDirectoryProperty"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.38.FunctionName"
              value="WehFileSystemNode::GetTStamp"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.39.FunctionName"
              value="WehFileSystemNode::GetFileAttributeData"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.40.FunctionName"
              value="WehFileSystemNode::SetTStamp"/>

        <!-- CEnterpriseExtRootNode methods --> 
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.42.FunctionName"
              value="CEnterpriseExtRootNode::CreateNodeInstance"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.43.FunctionName"
              value="CEnterpriseExtRootNode::GetChildNodeNames"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.44.FunctionName"
              value="CEnterpriseExtRootNode::Add"/>

        <!-- General Events -->
        <string id="EnterpriseExtCsps.FunctionReturnValueEventEventMessage"
              value="Return value from function %1. HR = %2."/>
        <string id="EnterpriseExtCsps.FunctionEntryPointEventMessage"
              value="Function entry - %1"/>

        <!-- EnterpriseFilesystemCspNode Events -->
       <string id="EnterpriseExtCsps.FileSystemNodeDeleteChildFailedEventEventMessage"
              value="Failed in WehFileSystemNode::DeleteChild() HR = %1. "/>
 
        <!-- DeviceCustomDataNode methods --> 
        <string id="EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_CreateNodeInstance"
              value="CDeviceCustomDataNode::CreateNodeInstance" />
        <string id="EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_GetValue"
              value="CDeviceCustomDataNode::GetValue" />
        <string id="EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_SetValue"
              value="CDeviceCustomDataNode::SetValue" />
        <string id="EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_GetChildNodeNames"
              value="CDeviceCustomDataNode::GetChildNodeNames" />
        <string id="EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_Init"
              value="CDeviceCustomDataNode::Init" />
        <string id="EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_InitRegistry"
              value="CDeviceCustomDataNode::InitRegistry" />
        <string id="EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_GetBackupRegFilePath"
              value="CDeviceCustomDataNode::GetBackupRegFilePath" />
        <string id="EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_LoadRegistry"
              value="CDeviceCustomDataNode::LoadRegistry" />
        <string id="EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_BackupRegistry"
              value="CDeviceCustomDataNode::BackupRegistry" />
        <string id="EnterpriseExtCsps.FunctionName.CDeviceCustomDataNode_GetRegistryValueName"
              value="CDeviceCustomDataNode::GetRegistryValueName" />
        
        <!-- CBrightnessNode methods --> 
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.56.FunctionName"
              value="CBrightnessNode::CreateNodeInstance"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.57.FunctionName"
              value="CBrightnessNode::GetChildNodeNames"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.58.FunctionName"
              value="CBrightnessNode::SetValue"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.59.FunctionName"
              value="CBrightnessNode::GetValue"/>
        <string id="EnterpriseExtCsps.EnterpriseExtCspsFunctionIndex.60.FunctionName"
              value="CBrightnessNode::GetProperty"/>


        <!-- LedAlertNode strings -->
        <string id="CLedAlertNodeHandleState"           value="CLedAlertNodeHandleState hr(=%1), state(=%2)" />
        <string id="CLedAlertNodeHandleIntensity"       value="CLedAlertNodeHandleIntensity hr(=%1), intensity(=%2)" />
        <string id="CLedAlertNodeHandlePeriod"          value="CLedAlertNodeHandlePeriod hr(=%1), period(=%2)" />
        <string id="CLedAlertNodeHandleCyclecount"      value="CLedAlertNodeHandleCyclecount hr(=%1), cyclecount(=%2)" />
        <string id="CLedAlertNodeHandleDutycycle"       value="CLedAlertNodeHandleDutycycle hr(=%1), dutycycle(=%2)" />
        <string id="CLedAlertNodeInternalSetValue"      value="CLedAlertNodeInternalSetValue (%1)" />
        <string id="CLedAlertNodeCreateNodeInstance"    value="CLedAlertNodeCreateNodeInstance (%1)" />
        <string id="CLedAlertNodeAdd"                   value="CLedAlertNodeAdd (%1)" />
        <string id="CLedAlertNodeStoreLedAlertSettings" value="CLedAlertNodeStoreLedAlertSettings (%1)" />
        <string id="CLedAlertNodeApplyLedAlertSettings" value="CLedAlertNodeApplyLedAlertSettings (%1)" />
        <string id="CLedAlertNodeReceivedAllParams"     value="CLedAlertNodeReceivedAllParams(%1)" />
        <string id="CLedAlertNodeGetChildNodeNames"     value="CLedAlertNodeGetChildNodeNames(%1)" />
        <string id="CLedAlertNodeGetValue"              value="CLedAlertNodeGetValue(hr = (%1), data = (%2)" />
        <string id="CLedAlertNodeSetValue"              value="CLedAlertNodeSetValue(%1)" />

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
