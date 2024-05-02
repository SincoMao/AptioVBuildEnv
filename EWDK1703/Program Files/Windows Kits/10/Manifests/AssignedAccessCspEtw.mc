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
            <provider name="Microsoft-WindowsPhone-AssignedAccessCsp-Provider"
                guid="{597A490A-5D95-4471-A839-01D7263F139D}"
                symbol="WP_AssignedAccessCsp_PROVIDER"
                messageFileName="AssignedAccessCsp.dll"
                resourceFileName="AssignedAccessCsp.dll">

                <maps>
                    <valueMap name="AssignedAccessCspFunctionIndex">
                        <!-- Please append new function entry to the end. Don't change the function index. -->
                        <!-- Please also add the new function name to corresponding string id. -->
                        <map value="1"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.1.FunctionName)"/>
                        <map value="2"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.2.FunctionName)"/>
                        <map value="3"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.3.FunctionName)"/>
                        <map value="4"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.4.FunctionName)"/>
                        <map value="5"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.5.FunctionName)"/>
                        <map value="6"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.6.FunctionName)"/>
                        <map value="7"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.7.FunctionName)"/>
                        <map value="8"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.8.FunctionName)"/>
                        <map value="9"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.9.FunctionName)"/>
                        <map value="10"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.10.FunctionName)"/>
                        <map value="11"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.11.FunctionName)"/>
                        <map value="12"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.12.FunctionName)"/>
                        <map value="13"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.13.FunctionName)"/>
                        <map value="14"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.14.FunctionName)"/>
                        <map value="15"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.15.FunctionName)"/>
                        <map value="16"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.16.FunctionName)"/>
                        <map value="17"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.17.FunctionName)"/>
                        <map value="18"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.18.FunctionName)"/>
                        <map value="19"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.19.FunctionName)"/>
                        <map value="20"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.20.FunctionName)"/>
                        <map value="21"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.21.FunctionName)"/>
                        <map value="22"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.22.FunctionName)"/>
                        <map value="23"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.23.FunctionName)"/>
                        <map value="24"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.24.FunctionName)"/>
                        <map value="25"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.25.FunctionName)"/>
                        <map value="26"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.26.FunctionName)"/>
                        <map value="27"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.27.FunctionName)"/>
                        <map value="28"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.28.FunctionName)"/>
                        <map value="29"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.29.FunctionName)"/>
                        <map value="30"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.30.FunctionName)"/>
                        <map value="31"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.31.FunctionName)"/>
                        <map value="32"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.32.FunctionName)"/>
                        <map value="33"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.33.FunctionName)"/>
                        <map value="34"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.34.FunctionName)"/>
                        <map value="35"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.35.FunctionName)"/>
                        <map value="36"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.36.FunctionName)"/>
                        <map value="37"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.37.FunctionName)"/>
                        <map value="38"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.38.FunctionName)"/>
                        <map value="39"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.39.FunctionName)"/>
                        <map value="40"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.40.FunctionName)"/>
                        <map value="41"
                             message="$(string.AssignedAccessCsp.AssignedAccessCspFunctionIndex.41.FunctionName)"/>

                        <!-- Please append new function entry to the end. Don't change the function index. -->
                    </valueMap>
                </maps>

                <templates>

                    <template tid="SingleDWORD">
                        <data name="Prop_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
                    </template>

                    <template tid="TwoDWORD">
                        <data name="Prop1_UInt32" inType="win:UInt32" outType="xs:HexInt32" />
                        <data name="Prop2_UInt32" inType="win:UInt32" outType="xs:HexInt32" />
                    </template>

                    <template tid="ThreeDWORD">
                        <data name="Prop1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
                        <data name="Prop2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
                        <data name="Prop3_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
                    </template>

                    <template tid="SingleStringSingleDWORD">
                        <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string" />
                        <data name="Prop_UInt32" inType="win:UInt32" outType="xs:HexInt32" />
                    </template>

                    <template tid="SingleString">
                        <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string" />
                    </template>

                    <template tid="FunctionIndex">
                        <data name="Prop_UInt32_1" inType="win:UInt32" map="AssignedAccessCspFunctionIndex" />
                    </template>

                    <template tid="FunctionResult">
                        <data name="Prop_UInt32_1" inType="win:UInt32" map="AssignedAccessCspFunctionIndex" />
                        <data name="Prop_UInt32_2" inType="win:UInt32" outType="xs:HexInt32" />
                    </template>

                    <template tid="ErrorHR">
                        <data name="Prop_UInt32" inType="win:UInt32" outType="xs:HexInt32" />
                    </template>
                </templates>

                <events>

                    <event value="1"
                    level="win:Verbose"
                    symbol="FunctionEntryPointEvent"
                    template="FunctionIndex"
                    message="$(string.AssignedAccessCsp.FunctionEntryPointEventMessage)"/>

                    <event value="2"
                    level="win:Verbose"
                    symbol="FunctionReturnValueEvent"
                    template="FunctionResult"
                    message="$(string.AssignedAccessCsp.FunctionReturnValueEventEventMessage)"/>

                    <event value="3"
                    level="win:Error"
                    symbol="WEHSvcIsEnterprisePersistedBackupDataExistFailedEvent"
                    template="ErrorHR"
                    message="$(string.AssignedAccessCsp.WEHSvcIsEnterprisePersistedBackupDataExistFailedEventMessage)"/>

                    <event value="4"
                    level="win:Error"
                    symbol="WEHCSPHelperExecuteFailedEvent"
                    template="TwoDWORD"
                    message="$(string.AssignedAccessCsp.WEHCSPHelperExecuteFailedEventMessage)"/>

                    <event value="5"
                    level="win:Error"
                    symbol="SetUserDefaultUILanguageFailedEvent"
                    template="TwoDWORD"
                    message="$(string.AssignedAccessCsp.SetUserDefaultUILanguageFailedEventMessage)"/>

                    <event value="6"
                    level="win:Error"
                    symbol="WEHSvcSMBDownloadFileFailedEvent"
                    template="ErrorHR"
                    message="$(string.AssignedAccessCsp.WEHSvcSMBDownloadFileFailedEventMessage)"/>

                    <event value="7"
                    level="win:Error"
                    symbol="WEHCSPHelperExecuteFailedToSetBGEvent"
                    template="SingleStringSingleDWORD"
                    message="$(string.AssignedAccessCsp.WEHCSPHelperExecuteFailedToSetBGEventMessage)"/>
                    
                    <event value="8"
                    level="win:Error"
                    symbol="WEHSvcRestoreEnterprisePersistedDataEvent"
                    template="ErrorHR"
                    message="$(string.AssignedAccessCsp.WEHSvcRestoreEnterprisePersistedDataEventMessage)"/>

                </events>
            </provider>
        </events>
    </instrumentation>

    <localization>
        <resources culture="en-US">
            <stringTable>

                <!-- CAssignedAccessRootNode Methods --> 
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.1.FunctionName"
                      value="CAssignedAccessRootNode::CreateNodeInstance"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.2.FunctionName"
                      value="CAssignedAccessRootNode::GetChildNodeNames"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.3.FunctionName"
                      value="CAssignedAccessRootNode::Add"/>

                <!-- CDeviceClockNode Methods --> 
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.4.FunctionName"
                      value="CDeviceClockNode::CreateNodeInstance"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.5.FunctionName"
                      value="CDeviceClockNode::GetValue"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.6.FunctionName"
                      value="CDeviceClockNode::SetValue"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.7.FunctionName"
                      value="CDeviceClockNode::GetChildNodeNames"/>

                <!-- CDeviceLocaleNode Methods --> 
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.8.FunctionName"
                      value="CDeviceLocaleNode::CreateNodeInstance"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.9.FunctionName"
                      value="CDeviceLocaleNode::GetValue"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.10.FunctionName"
                      value="CDeviceLocaleNode::SetValue"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.11.FunctionName"
                      value="CDeviceLocaleNode::GetChildNodeNames"/>

                <!-- CDeviceThemeNode Methods --> 
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.12.FunctionName"
                      value="CDeviceThemeNode::CreateNodeInstance"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.13.FunctionName"
                      value="CDeviceThemeNode::ComputeColorRegValueURI"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.14.FunctionName"
                      value="CDeviceThemeNode::InitializeRegistry"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.15.FunctionName"
                      value="CDeviceThemeNode::DeSerialize"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.16.FunctionName"
                      value="CDeviceThemeNode::Serialize"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.17.FunctionName"
                      value="CDeviceThemeNode::GetValue"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.18.FunctionName"
                      value="CDeviceThemeNode::SetValue"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.19.FunctionName"
                      value="CDeviceThemeNode::GetChildNodeNames"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.20.FunctionName"
                      value="CDeviceThemeNode::GetProperty"/>

                <!-- CLockdownNode Methods --> 
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.21.FunctionName"
                      value="ApplyLockdownFromPath"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.22.FunctionName"
                      value="CLockdownNode::CreateNodeInstance"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.23.FunctionName"
                      value="CLockdownNode::Serialize"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.24.FunctionName"
                      value="CLockdownNode::SetValue"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.25.FunctionName"
                      value="CLockdownNode::GetChildNodeNames"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.26.FunctionName"
                      value="CLockdownNode::DeleteChild"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.27.FunctionName"
                      value="CLockdownNode::Add"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.28.FunctionName"
                      value="CLockdownNode::GetValue"/>

                <!-- CLockScreenBackgroundNode Methods --> 
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.29.FunctionName"
                      value="CLockScreenBackgroundNode::CreateNodeInstance"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.30.FunctionName"
                      value="CLockScreenBackgroundNode::Add"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.31.FunctionName"
                      value="CLockScreenBackgroundNode::DeSerialize"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.32.FunctionName"
                      value="CLockScreenBackgroundNode::Serialize"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.33.FunctionName"
                      value="CLockScreenBackgroundNode::AppendFileVersionNumber"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.34.FunctionName"
                      value="CLockScreenBackgroundNode::GetFileVersionNumber"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.35.FunctionName"
                      value="CLockScreenBackgroundNode::GetValue"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.36.FunctionName"
                      value="CLockScreenBackgroundNode::SetValue"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.37.FunctionName"
                      value="CLockScreenBackgroundNode::GetChildNodeNames"/>

                <!-- CPersistDataNode Methods --> 
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.38.FunctionName"
                      value="CPersistDataNode::CreateNodeInstance"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.39.FunctionName"
                      value="CPersistDataNode::GetChildNodeNames"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.40.FunctionName"
                      value="CPersistDataNode::GetValue"/>
                <string id="AssignedAccessCsp.AssignedAccessCspFunctionIndex.41.FunctionName"
                      value="CPersistDataNode::SetValue"/>


                <string id="AssignedAccessCsp.FunctionReturnValueEventEventMessage"
                      value="Return value from function %1. HR = %2."/>
                <string id="AssignedAccessCsp.FunctionEntryPointEventMessage"
                      value="Function entry - %1"/>

                <string id="AssignedAccessCsp.WEHSvcBackupEnterprisePersistedDataFailedEventMessage"
                      value="WEHSvcBackupEnterprisePersistedData failed with error code HR = %1."/>
                <string id="AssignedAccessCsp.WEHSvcDeleteEnterprisePersistedBackupDataEventMessage"
                      value="WEHSvcDeleteEnterprisePersistedBackupDataEventMessage failed with error code HR = %1."/>
                <string id="AssignedAccessCsp.WEHSvcIsEnterprisePersistedBackupDataExistFailedEventMessage"
                      value="WEHSvcIsEnterprisePersistedBackupDataExist failed with error code HR = %1."/>
                <string id="AssignedAccessCsp.WEHCSPHelperExecuteFailedEventMessage"
                      value="WEHCSPHelperExecute failed to set timezone : %2 with error code HR = %1."/>
                <string id="AssignedAccessCsp.SetUserDefaultUILanguageFailedEventMessage"
                      value="SetUserDefaultUILanguage failed to set langId : %2 with error code HR = %1."/>
                <string id="AssignedAccessCsp.WEHSvcSMBDownloadFileFailedEventMessage"
                      value="WEHSvcSMBDownloadFile failed with error code HR = %1."/>
                <string id="AssignedAccessCsp.WEHCSPHelperExecuteFailedToSetBGEventMessage"
                      value="WEHCSPHelperExecute failed to set lockscreen background with command line : %1 and error code HR = %2."/>
                <string id="AssignedAccessCsp.WEHSvcRestoreEnterprisePersistedDataEventMessage"
                      value="WEHSvcRestoreEnterprisePersistedDataEventMessage failed with error code HR = %1."/>
                

            </stringTable>
        </resources>
    </localization>

</instrumentationManifest>
