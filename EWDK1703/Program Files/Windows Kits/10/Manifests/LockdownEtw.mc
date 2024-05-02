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
            <provider name="Microsoft-WindowsPhone-LockdownImplProvider"
                guid="{3A7141B9-56E9-4854-A68C-F7D24F2B6FC5}"
                symbol="MICROSOFT_WINDOWSPHONE_LOCKDOWNIMPLPROVIDER"
                messageFileName="WindowsEmbeddedDeviceLockdownProfile.dll"
                resourceFileName="WindowsEmbeddedDeviceLockdownProfile.dll">

                <keywords>
                    <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
                    <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
                    <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
                    <keyword mask="0x0000000000000004" name="Lockdown" message="$(string.Keyword.Lockdown)" />
                    <keyword mask="0x0000000000000008" name="FuncCall" message="$(string.Keyword.FuncCall)" />
                    <keyword mask="0x0000000000000010" name="Xml" message="$(string.Keyword.Xml)" />
                    <keyword mask="0x0000000000000020" name="Apps" message="$(string.LockdownType.Apps)" />
                    <keyword mask="0x0000000000000040" name="Buttons" message="$(string.LockdownType.Buttons)" />
                    <keyword mask="0x0000000000000080" name="Settings" message="$(string.LockdownType.Settings)" />
                </keywords>

                <tasks>
                    <task value="1" name="FuncCallEvent"/>
                    <task value="2" name="ApplyLockdownTask" />
                </tasks>

                <maps>
                    <valueMap name="LockdownImplFunctionIndex" symbol="LOCKDOWN_FUNC">
                        <!-- AppsLockdownImpl, [1,100) -->
                        <map value="1"
                             message="$(string.LockdownImpl.FunctionName.1)"/>
                        <map value="2"
                             message="$(string.LockdownImpl.FunctionName.2)"/>
                        <map value="3"
                             symbol="_APP_INITIALIZE"
                             message="$(string.LockdownImpl.FunctionName.3)"/>
                        <map value="4"
                             message="$(string.LockdownImpl.FunctionName.4)"/>
                        <map value="5"
                             message="$(string.LockdownImpl.FunctionName.5)"/>
                        <map value="6"
                             symbol="_APP_EXECUTE"
                             message="$(string.LockdownImpl.FunctionName.6)"/>
                        <map value="7"
                             message="$(string.LockdownImpl.FunctionName.7)"/>
                        <map value="8"
                             message="$(string.LockdownImpl.FunctionName.8)"/>
                        <map value="9"
                             message="$(string.LockdownImpl.FunctionName.9)"/>
                        <map value="10"
                             message="$(string.LockdownImpl.FunctionName.10)"/>
                        <map value="11"
                             message="$(string.LockdownImpl.FunctionName.11)"/>
                        <map value="12"
                             message="$(string.LockdownImpl.FunctionName.12)"/>
                        <map value="13"
                             message="$(string.LockdownImpl.FunctionName.13)"/>
                        <map value="14"
                             message="$(string.LockdownImpl.FunctionName.14)"/>
                        <map value="15"
                             message="$(string.LockdownImpl.FunctionName.15)"/>
                        <map value="16"
                             message="$(string.LockdownImpl.FunctionName.16)"/>
                        <map value="17"
                             message="$(string.LockdownImpl.FunctionName.17)"/>
                        <map value="18"
                             message="$(string.LockdownImpl.FunctionName.18)"/>
                        <map value="19"
                             message="$(string.LockdownImpl.FunctionName.19)"/>
                        <map value="20"
                             message="$(string.LockdownImpl.FunctionName.20)"/>
                        <map value="21"
                             message="$(string.LockdownImpl.FunctionName.21)"/>
                        <map value="22"
                             message="$(string.LockdownImpl.FunctionName.22)"/>
                        <map value="23"
                             symbol="_APP_COMPOSEAUTORUNCFG"
                             message="$(string.LockdownImpl.FunctionName.23)"/>
                        <map value="24"
                             symbol="_APP_PINTOSTART"
                             message="$(string.LockdownImpl.FunctionName.24)"/>
                        <map value="25"
                             symbol="_APP_LAUNCHAPP"
                             message="$(string.LockdownImpl.FunctionName.25)"/>
                        <map value="26"
                             symbol="_APP_GETAUTORUNNAPP"
                             message="$(string.LockdownImpl.FunctionName.26)"/>
                        <map value="27"
                             symbol="_APP_FINDTILE"
                             message="$(string.LockdownImpl.FunctionName.27)"/>
                        <map value="28"
                             symbol="_CONSTRUCT_APPLOCKER_SYNCML"
                             message="$(string.LockdownImpl.FunctionName.28)"/>
                        <map value="29"
                             symbol="_CONSTRUCT_APPLOCKER_FILEPUBLISHERRULE"
                             message="$(string.LockdownImpl.FunctionName.29)"/>
                        <map value="30"
                             symbol="_OBTAIN_PRODUCTNAME"
                             message="$(string.LockdownImpl.FunctionName.30)"/>
                        <map value="31"
                             symbol="_SET_APPLOCKER_POLICY_TROUGH_POLICYMANAGER"
                             message="$(string.LockdownImpl.FunctionName.31)"/>
                        <map value="32"
                             symbol="_CONSTRUCT_APPLOCKER_RULECOLLECTION"
                             message="$(string.LockdownImpl.FunctionName.32)"/>
                        <map value="33"
                             symbol="_ADD_APPLOCKER_POLICY_NODE_TROUGH_POLICYMANAGER"
                             message="$(string.LockdownImpl.FunctionName.33)"/>
                        <map value="34"
                             symbol="_INTERNAL_APP_INITIALIZE"
                             message="$(string.LockdownImpl.FunctionName.34)"/>
                        <map value="35"
                             symbol="_ADD_TO_APPLOCKER_FILEPUBLISHERRULES"
                             message="$(string.LockdownImpl.FunctionName.35)"/>
                        <map value="36"
                             symbol="_APP_EXECUTE_STARTMENU_TILES_LOCKDOWN"
                             message="$(string.LockdownImpl.FunctionName.36)"/>
                        <map value="37"
                             message="$(string.LockdownImpl.FunctionName.37)"/>
                        <map value="38"
                             message="$(string.LockdownImpl.FunctionName.38)"/>
                        <map value="39"
                             message="$(string.LockdownImpl.FunctionName.39)"/>
                        <map value="40"
                             message="$(string.LockdownImpl.FunctionName.40)"/>
                        <map value="41"
                             message="$(string.LockdownImpl.FunctionName.41)"/>
                        <map value="42"
                             message="$(string.LockdownImpl.FunctionName.42)"/>
                        <map value="43"
                             message="$(string.LockdownImpl.FunctionName.43)"/>
                        <map value="44"
                             message="$(string.LockdownImpl.FunctionName.44)"/>
                        <map value="45"
                             message="$(string.LockdownImpl.FunctionName.45)"/>
                        <map value="46"
                             message="$(string.LockdownImpl.FunctionName.46)"/>
                        <map value="47"
                             message="$(string.LockdownImpl.FunctionName.47)"/>
                        <map value="48"
                             message="$(string.LockdownImpl.FunctionName.48)"/>
                        <map value="49"
                             message="$(string.LockdownImpl.FunctionName.49)"/>
                        <map value="50"
                             message="$(string.LockdownImpl.FunctionName.50)"/>
                        <map value="51"
                             message="$(string.LockdownImpl.FunctionName.51)"/>
                        <map value="52"
                             message="$(string.LockdownImpl.FunctionName.52)"/>

                        <!-- ButtonLockdownImpl, [100,200) -->
                        <map value="100"
                             message="$(string.LockdownImpl.FunctionName.100)"/>
                        <map value="101"
                             message="$(string.LockdownImpl.FunctionName.101)"/>
                        <map value="102"
                             message="$(string.LockdownImpl.FunctionName.102)"/>
                        <map value="103"
                             message="$(string.LockdownImpl.FunctionName.103)"/>

                        <!-- CSPRunnerLockdownCommand, [200,300) -->
                        <map value="200"
                             message="$(string.LockdownImpl.FunctionName.200)"/>

                        <!-- LockdownCommandChain, [300,400) -->
                        <map value="300"
                             message="$(string.LockdownImpl.FunctionName.300)"/>
                        <map value="301"
                             message="$(string.LockdownImpl.FunctionName.301)"/>
                        <map value="302"
                             message="$(string.LockdownImpl.FunctionName.302)"/>
                        <map value="303"
                             message="$(string.LockdownImpl.FunctionName.303)"/>
                        <map value="304"
                             message="$(string.LockdownImpl.FunctionName.304)"/>
                        <map value="305"
                             message="$(string.LockdownImpl.FunctionName.305)"/>
                        <map value="306"
                             message="$(string.LockdownImpl.FunctionName.306)"/>
                        <map value="307"
                             message="$(string.LockdownImpl.FunctionName.307)"/>
                        <map value="308"
                             message="$(string.LockdownImpl.FunctionName.308)"/>
                        <map value="309"
                             message="$(string.LockdownImpl.FunctionName.309)"/>
                        <map value="310"
                             message="$(string.LockdownImpl.FunctionName.310)"/>
                        <map value="311"
                             symbol="_SETLOCKDOWNFLAGS"
                             message="$(string.LockdownImpl.FunctionName.311)"/>
                        <map value="312"
                             symbol="_REMOVETARGETLOCKDOWNPROFILE"
                             message="$(string.LockdownImpl.FunctionName.312)"/>
                        <map value="313"
                             symbol="_REMOVELOCKDOWNFLAGS"
                             message="$(string.LockdownImpl.FunctionName.313)"/>
                        <map value="314"
                             symbol="_GETTARGETLOCKDOWNPROFILE"
                             message="$(string.LockdownImpl.FunctionName.314)"/>
                        <map value="315"
                             symbol="_SETTARGETLOCKDOWNPROFILE"
                             message="$(string.LockdownImpl.FunctionName.315)"/>
                        <map value="316"
                             symbol="_SETLOCKDOWNPROFILEINFO"
                             message="$(string.LockdownImpl.FunctionName.316)"/>
                        <map value="317"
                             symbol="_CREATELOCKDOWNXMLDOC"
                             message="$(string.LockdownImpl.FunctionName.317)"/>
                        <map value="318"
                             symbol="_ADDROLEINLOCKDOWNXML"
                             message="$(string.LockdownImpl.FunctionName.318)"/>
                        <map value="319"
                             symbol="_SAVEXML"
                             message="$(string.LockdownImpl.FunctionName.319)"/>
                        <map value="320"
                             symbol="_LOADEX"
                             message="$(string.LockdownImpl.FunctionName.320)"/>
                        <map value="321"
                             symbol="_REMOTEGETXMLPATH"
                             message="$(string.LockdownImpl.FunctionName.321)"/>
                        <map value="322"
                             symbol="_TAKESNAPSHOT"
                             message="$(string.LockdownImpl.FunctionName.322)"/>
                        <map value="323"
                             symbol="_FORMATPROFILE"
                             message="$(string.LockdownImpl.FunctionName.323)"/>
                        <map value="324"
                             symbol="_GETBUTTONTOGGLES"
                             message="$(string.LockdownImpl.FunctionName.324)"/>
                        <map value="325"
                             symbol="_SETBUTTONTOGGLES"
                             message="$(string.LockdownImpl.FunctionName.325)"/>
                        <map value="326"
                             symbol="_GETSNAPSHOTLOCKDOWNPROFILE"
                             message="$(string.LockdownImpl.FunctionName.326)"/>
                        <map value="327"
                             symbol="_SETSNAPSHOTLOCKDOWNPROFILE"
                             message="$(string.LockdownImpl.FunctionName.327)"/>
                        <map value="328"
                             symbol="_APPLYALLOWTASKSWITCHERPOLICY"
                             message="$(string.LockdownImpl.FunctionName.328)"/>
                        <map value="329"
                             symbol="_SETLOCKDOWNBUTTONFLAGS"
                             message="$(string.LockdownImpl.FunctionName.329)"/>
                        <map value="330"
                             symbol="_REMOVELOCKDOWNBUTTONFLAGS"
                             message="$(string.LockdownImpl.FunctionName.330)"/>
                        <map value="331"
                             symbol="_ADDPROFILENODETOXML"
                             message="$(string.LockdownImpl.FunctionName.331)"/>
                        <map value="332"
                             symbol="_REMOVEAPPLOCKERPROFILE"
                             message="$(string.LockdownImpl.FunctionName.332)"/>

                        <!-- MenuLockdownCommand, [400,500) -->
                        <map value="400"
                             message="$(string.LockdownImpl.FunctionName.400)"/>
                        <map value="401"
                             message="$(string.LockdownImpl.FunctionName.401)"/>

                        <!-- NotificationsLockdownCommand, [500,600) -->
                        <map value="500"
                             message="$(string.LockdownImpl.FunctionName.500)"/>
                        <map value="501"
                             message="$(string.LockdownImpl.FunctionName.501)"/>

                        <!-- SettingsLockdownCommand, [600,700) -->
                        <map value="600"
                             message="$(string.LockdownImpl.FunctionName.600)"/>
                        <map value="601"
                             message="$(string.LockdownImpl.FunctionName.601)"/>
                        <map value="602"
                             message="$(string.LockdownImpl.FunctionName.602)"/>
                        <map value="603"
                             message="$(string.LockdownImpl.FunctionName.603)"/>
                        <map value="604"
                             message="$(string.LockdownImpl.FunctionName.604)"/>
                        <map value="605"
                             symbol="_ENABLE_SETTINGS_IN_HIVE"
                             message="$(string.LockdownImpl.FunctionName.605)"/>
                        <map value="606"
                             symbol="_SET_SETTINGSPAGE_REGISTRYKEYS"
                             message="$(string.LockdownImpl.FunctionName.606)"/>
                        <map value="607"
                             symbol="_SET_SETTINGSPAGE_REGISTRYKEY"
                             message="$(string.LockdownImpl.FunctionName.607)"/>
                        <map value="608"
                             symbol="_POPULATE_ALL_SETTINGSPAGE_REGISTRYKEYS_AS_DISABLED"
                             message="$(string.LockdownImpl.FunctionName.608)"/>
                        <map value="609"
                             symbol="_LOAD_QUICK_ACTION_DEPENDENCIES"
                             message="$(string.LockdownImpl.FunctionName.609)"/>
                        <map value="610"
                             symbol="_POPULATE_QUICK_ACTION_DEPENDENCIES"
                             message="$(string.LockdownImpl.FunctionName.610)"/>

                        <!-- StartScreenModeLockdownCommand, [700,800) -->
                        <map value="700"
                             message="$(string.LockdownImpl.FunctionName.700)"/>
                        <map value="701"
                             message="$(string.LockdownImpl.FunctionName.701)"/>
                        <map value="702"
                             message="$(string.LockdownImpl.FunctionName.702)"/>

                        <!-- TilesLockdownCommand [800, 900) -->
                        <map value="800"
                             symbol="_TILES_INIT"
                             message="$(string.LockdownImpl.FunctionName.TilesLockdownCommand_Initialize)"/>
                        <map value="801"
                             symbol="_TILES_EXECUTE"
                             message="$(string.LockdownImpl.FunctionName.TilesLockdownCommand_Execute)"/>

                        <!-- WifiLockdownCommand, [1000,1100) -->
                        <map value="1000"
                             symbol="_WIFI_INIT"
                             message="$(string.LockdownImpl.FunctionName.WifiLockdownCommand_Initialize)"/>
                        <map value="1001"
                             symbol="_WIFI_EXECUTE"
                             message="$(string.LockdownImpl.FunctionName.WifiLockdownCommand_Execute)"/>                             
                             
                        <!--WEHLockdown.cpp (functions LockdownMgrXXX), [1100,1200)-->
                        <map value="1101"
                             symbol="_SET_LOCKDOWN_WNF"
                             message="$(string.LockdownImpl.FunctionName.1101)"/>
                        
                        <!--AppsLockdownImpl2.cpp, [1200,1300)-->
                        <map value="1200"
                             symbol="_APPSLOCKDOWNIMPL2_CREATE_INSTANCE"
                             message="$(string.LockdownImpl.FunctionName.1200)"/>
                        <map value="1201"
                             symbol="_APPSLOCKDOWNIMPL2_VALIDATE_AND_PROCESS_START_SCREEN_TILE_CONFIG"
                             message="$(string.LockdownImpl.FunctionName.1201)"/>
                        <map value="1202"
                             symbol="_APPSLOCKDOWNIMPL2_GET_TILE_SIZE_FROM_SIZE_NODE"
                             message="$(string.LockdownImpl.FunctionName.1202)"/>
                        <map value="1203"
                             symbol="_APPSLOCKDOWNIMPL2_GET_TEXT_NODE_VALUE_LONG"
                             message="$(string.LockdownImpl.FunctionName.1203)"/>
                        <map value="1204"
                             symbol="_APPSLOCKDOWNIMPL2_INITIALIZE"
                             message="$(string.LockdownImpl.FunctionName.1204)"/>
                        <map value="1205"
                             symbol="_APPSLOCKDOWNIMPL2_IMPORT_XML"
                             message="$(string.LockdownImpl.FunctionName.1205)"/>
                        <map value="1206"
                             message="$(string.LockdownImpl.FunctionName.1206)"/>
                        <map value="1207"
                             symbol="_APPSLOCKDOWNIMPL2_EXECUTE_STARTMENU_TILES_LOCKDOWN"
                             message="$(string.LockdownImpl.FunctionName.1207)"/>
                        <map value="1208"
                             symbol="_APPSLOCKDOWNIMPL2_EXECUTE"
                             message="$(string.LockdownImpl.FunctionName.1208)"/>
                        <map value="1209"
                             symbol="_APPSLOCKDOWNIMPL2_PIN_APP_TO_START_IF_NEEDED"
                             message="$(string.LockdownImpl.FunctionName.1209)"/>
                        <map value="1210"
                             symbol="_APPSLOCKDOWNIMPL2_CREATE_CURATED_TILE_COLLECTION"
                             message="$(string.LockdownImpl.FunctionName.1210)"/>
                        <map value="1211"
                             symbol="_APPSLOCKDOWNIMPL2_SWITCH_TO_CURATED_TILE_COLLECTION"
                             message="$(string.LockdownImpl.FunctionName.1211)"/>
                        <map value="1212"
                             symbol="_APPSLOCKDOWNIMPL2_EXECUTE_API_ACTIONS"
                             message="$(string.LockdownImpl.FunctionName.1212)"/>
                        <map value="1213"
                             symbol="_APPSLOCKDOWNIMPL2_LAUNCH_AUTO_RUN_SESSION"
                             message="$(string.LockdownImpl.FunctionName.1213)"/>
                        <map value="1214"
                             symbol="_APPSLOCKDOWNIMPL2_SNAPSHOT"
                             message="$(string.LockdownImpl.FunctionName.1214)"/>
                        <map value="1215"
                             symbol="_APPSLOCKDOWNIMPL2_DO_LAUNCH_AUTORUN_SESSION"
                             message="$(string.LockdownImpl.FunctionName.1215)"/>
                        <map value="1216"
                             symbol="_APPSLOCKDOWNIMPL2_GET_AUTORUN_APPLICATION"
                             message="$(string.LockdownImpl.FunctionName.1216)"/>
                        <map value="1217"
                             symbol="_APPSLOCKDOWNIMPL2_LAUNCH_APPLICATION"
                             message="$(string.LockdownImpl.FunctionName.1217)"/>
                    </valueMap>

                    <valueMap name="LockdownCommandPhaseMap" symbol="LOCKDOWN_CMD">
                        <map value="1"
                             symbol="_SELECT"
                             message="$(string.LockdownCommandPhaseSelect)"
                             />
                        <map value="2"
                             symbol="_INIT"
                             message="$(string.LockdownCommandPhaseInit)"
                             />
                        <map value="3"
                             symbol="_EXEC"
                             message="$(string.LockdownCommandPhaseExec)"
                             />
                        <map value="4"
                             symbol="_APIEXEC"
                             message="$(string.LockdownCommandPhaseApiExec)"
                             />
                    </valueMap>

                    <valueMap name="AppsLockdownEventTypeMap" symbol="APPS_LOCKDOWN_EVENT">
                        <map value="1"
                             symbol="_PACMAN_CALL_RETURN"
                             message="$(string.AppsLockdown.PacmanCallReturn)"
                             />
                        <map value="2"
                             symbol="_SHELL_CALL_FAILURE"
                             message="$(string.AppsLockdown.ShellCallFailure)"
                             />
                        <map value="3"
                             symbol="_POLICYMANAGER_CALL_FAILURE"
                             message="$(string.AppsLockdown.PolicyManagerCallFailure)"
                             />
                        <map value="4"
                             symbol="_DPU_CALL_FAILURE"
                             message="$(string.AppsLockdown.DPUCallFailure)"
                             />
                        <map value="6"
                             symbol="_SNAPSHOT_NO_APP"
                             message="$(string.AppsLockdown.SnapshotNoApp)"
                             />
                        <map value="7"
                             symbol="_HUBPOSITION_NOT_INITIALIZED"
                             message="$(string.AppsLockdown.HubpositionNotInitialized)"
                             />
                        <map value="101"
                             symbol="_RETRIEVE_APP_OR_TILE"
                             message="$(string.AppsLockdown.RetrieveAppOrTile)"
                             />
                        <map value="102"
                             symbol="_NOTIFICATION"
                             message="$(string.AppsLockdown.Notification)"
                             />
                        <map value="103"
                             symbol="_AUTORUNAPP"
                             message="$(string.AppsLockdown.AutoRunApp)"
                             />
                        <map value="104"
                             symbol="_PINTOSTART"
                             message="$(string.AppsLockdown.PinToStart)"
                             />
                        <map value="105"
                             symbol="_APPS_SORTED"
                             message="$(string.AppsLockdown.AppsSorted)"
                            />
                        <map value="106"
                              symbol="_ENUMERATE_APPS"
                              message="$(string.AppsLockdown.EnumerateApps)"
                            />
                        <map value="107"
                             symbol="_LOCATION_UNINITIALIZED"
                             message="$(string.AppsLockdown.LocationUninitialized)"
                           />
                        <map value="108"
                             symbol="_OBTAIN_PRODUCTNAME_FOR_APPLOCKER"
                             message="$(string.AppsLockdown.ObtainProductName)"
                             />
                        <map value="301"
                             symbol="_OTHER"
                             message="$(string.AppsLockdown.OtherEvent)"
                             />
                    </valueMap>

                    <valueMap name="ButtonLockdownEventTypeMap" symbol="BUTTON_LOCKDOWN_EVENT">
                        <map value="1"
                             symbol="_LOCK_BUTTONS"
                             message="$(string.ButtonLockdown.LockButtonsEvent)"/>
                        <map value="2"
                             symbol="_REMAP_BUTTONS"
                             message="$(string.ButtonLockdown.RemapButtonsEvent)"/>
                        <map value="3"
                             symbol="_REGKEY"
                             message="$(string.ButtonLockdown.RegKeyEvent)"/>
                        <map value ="301"
                             symbol="_OTHER"
                             message="$(string.ButtonLockdown.OtherEvent)"/>
                    </valueMap>

                    <valueMap name="SettingsLockdownEventTypeMap" symbol="SETTINGS_LOCKDOWN_EVENT">
                        <map value="1"
                             symbol="_REGKEY"
                             message="$(string.SettingsLockdown.RegKeyEvent)"/>
                        <map value="301"
                             symbol="_OTHER"
                             message="$(string.SettingsLockdown.OtherEvent)"/>
                        <map value="302"
                             symbol="_ACTION_CENTER"
                             message="$(string.SettingsLockdown.ActionCenterEvent)"/>
                    </valueMap>

                    <valueMap name="LockdownTypeMap" symbol="LOCKDOWN_TYPE">
                        <map value="1"
                             symbol="_APPS"
                             message="$(string.LockdownType.Apps)"
                             />
                        <map value="2"
                             symbol="_BUTTONS"
                             message="$(string.LockdownType.Buttons)"
                             />
                        <map value="3"
                             symbol="_CSPRUNNER"
                             message="$(string.LockdownType.CSPRunner)"
                             />
                        <map value="4"
                             symbol="_MENU"
                             message="$(string.LockdownType.Menu)"
                             />
                        <map value="5"
                             symbol="_NOTIFICATIONS"
                             message="$(string.LockdownType.Notifications)"
                             />
                        <map value="6"
                             symbol="_SETTINGS"
                             message="$(string.LockdownType.Settings)"
                             />
                        <map value="7"
                             symbol="_STARTSCREEN"
                             message="$(string.LockdownType.StartScreen)"
                             />
                        <map value="8"
                             symbol="_TILES"
                             message="$(string.LockdownType.Tiles)"
                             />
                    </valueMap>
                    <valueMap name="HubTypeMap" symbol="HUB_TYPE">
                        <map value="1"
                             symbol="_START"
                             message="$(string.PMHubType.Start)">
                        </map>
                        <map value="2"
                             symbol="_APPLIST"
                             message="$(string.PMHubType.AppList)">
                        </map>
                        <map value="3"
                             symbol="_INVALID"
                             message="$(string.PMHubType.Invalid)">
                        </map>
                    </valueMap>
                </maps>

                <templates>

                    <template tid="FunctionEntry">
                        <data name="FuncId" inType="win:UInt32" map="LockdownImplFunctionIndex" />
                    </template>

                    <template tid="FunctionExit">
                        <data name="FuncId" inType="win:UInt32" map="LockdownImplFunctionIndex" />
                        <data name="FuncHr" inType="win:UInt32" outType="xs:HexInt32" />
                    </template>

                    <template tid="HResultTemplate">
                        <data name="HResult" inType="win:Int32" outType="win:HResult" />
                    </template>

                    <template tid="UnsignedInt32Template">
                        <data name="Data" inType="win:UInt32"/>
                    </template>

                    <template tid="AppLaunchTemplate">
                        <data name="IsModern" inType="win:Boolean" />
                        <data name="URIorAUMID" inType="win:UnicodeString" />
                        <data name="Parameters" inType="win:UnicodeString" />
                    </template>

                    <template tid="ApplyLockdownTemplate">
                        <data name="ProfileId" inType="win:GUID" />
                        <data name="FromAPI" inType="win:Boolean" />
                    </template>

                    <template tid="LockdownCommandTemplate">
                        <data name="NodeName" inType="win:UnicodeString" />
                        <data name="Phase" inType="win:UInt8" map="LockdownCommandPhaseMap" />
                        <data name="HResult" inType="win:Int32" outType="win:HResult" />
                    </template>

                    <template tid="IfFailedLog">
                        <data name="FileName" inType="win:AnsiString" />
                        <data name="FunctionName" inType="win:AnsiString" />
                        <data name="LineNumber" inType="win:Int32" />
                        <data name="ErrorCode" inType="win:Int32" outType="win:HResult" />
                    </template>

                    <template tid="AppsLockdownEventTemplate">
                        <data name="AppsLockdownEventType" inType="win:UInt32" map="AppsLockdownEventTypeMap"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
                    </template>

                    <template tid="AppsLockdownEventWithProductIDTemplate">
                        <data name="AppsLockdownEventType" inType="win:UInt32" map="AppsLockdownEventTypeMap"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
                        <data name="ProductID" inType="win:GUID" outType="xs:GUID" />
                    </template>

                    <template tid="IsAppTileCollidedTemplate">
                        <data name="ProductID" inType="win:GUID" outType="xs:GUID"/>
                        <data name="IsCollided" inType="win:Boolean" outType="xs:boolean"/>
                    </template>

                    <template tid="TilePositionTemplate">
                        <data name="ProductID" inType="win:GUID" outType="xs:GUID"/>
                        <data name="X" inType="win:Int32" outType="xs:int"/>
                        <data name="Y" inType="win:Int32" outType="xs:int"/>
                    </template>

                    <template tid="HubTypeTemplate">
                        <data name="HubType" inType="win:UInt32" map="HubTypeMap"/>
                    </template>

                    <template tid="TryCommitTileWithHubTypeTemplate">
                        <data name="HubType" inType="win:UInt32" map="HubTypeMap"/>
                        <data name="ProductID" inType="win:GUID" outType="xs:GUID"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
                        <data name="AttemptNumber" inType="win:UInt32" outType="xs:unsignedInt"/>
                    </template>

                    <template tid="TryCommitTileTemplate">
                        <data name="ProductID" inType="win:GUID" outType="xs:GUID"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
                        <data name="AttemptNumber" inType="win:UInt32" outType="xs:unsignedInt"/>
                    </template>

                    <template tid="CommitTileResultWithHubTypeTemplate">
                        <data name="HubType" inType="win:UInt32" map="HubTypeMap"/>
                        <data name="ProductID" inType="win:GUID" outType="xs:GUID"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
                    </template>

                    <template tid="CommitTileResultTemplate">
                        <data name="ProductID" inType="win:GUID" outType="xs:GUID"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
                    </template>

                    <template tid="FindTileResultTemplate">
                        <data name="ProductID" inType="win:GUID" outType="xs:GUID"/>
                        <data name="TileID" inType="win:UnicodeString" outType="xs:string"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
                    </template>


                    <template tid="ButtonLockdownEventTemplate">
                        <data name="ButtonLockdownEventType" inType="win:UInt32" map="ButtonLockdownEventTypeMap"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult" />
                    </template>

                    <template tid="SettingsLockdownEventTemplate">
                        <data name="SettingsLockdownEventType" inType="win:UInt32" map="SettingsLockdownEventTypeMap"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult" />
                    </template>

                    <template tid="SettingsLockdownEventWithNameTemplate">
                        <data name="SettingsLockdownEventType" inType="win:UInt32" map="SettingsLockdownEventTypeMap"/>
                        <data name="SettingsName" inType="win:UnicodeString" outType="xs:string"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult" />
                    </template>

                    <template tid="LockdownXmlValidationErrorTemplate">
                        <data name="LockdownType" inType="win:UInt32" map="LockdownTypeMap"/>
                        <data name="NodeName" inType="win:UnicodeString" outType="xs:string" />
                        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
                    </template>

                    <template tid="LockdownXmlValidationErrorWithValueTemplate">
                        <data name="LockdownType" inType="win:UInt32" map="LockdownTypeMap"/>
                        <data name="NodeName" inType="win:UnicodeString" outType="xs:string"/>
                        <data name="NodeValue" inType="win:UnicodeString" outType="xs:string"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
                    </template>

                    <template tid="FoundToastEntryTemplate">
                        <data name="AppUserModelId" inType="win:UnicodeString" />
                        <data name="AppType" inType="win:UInt32" />
                        <data name="IsEnabled" inType="win:Boolean" />
                    </template>

                    <template tid="WpnCallFailedTemplate">
                        <data name="HResult" inType="win:Int32" outType="win:HResult" />
                        <data name="AppUserModelId" inType="win:UnicodeString" />
                    </template>

                    <template tid="LockdownXmlRetrieveValueFailureTemplate">
                        <data name="LockdownType" inType="win:UInt32" map="LockdownTypeMap" />
                        <data name="NodePath" inType="win:UnicodeString" outType="xs:string"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
                    </template>

                    <template tid="RegistryTemplate">
                        <data name="Action" inType="win:UnicodeString" outType="xs:string"/>
                        <data name="Result" inType="win:UInt32"/>
                        <data name="Data" inType="win:UnicodeString" outType="xs:string"/>
                    </template>

                    <template tid="CuratedTileCollectionTemplate">
                        <data name="Action" inType="win:UnicodeString" outType="xs:string"/>
                        <data name="CollectionName" inType="win:UnicodeString" outType="xs:string"/>
                        <data name="HResult" inType="win:Int32" outType="win:HResult"/>
                    </template>

                </templates>

                <events>

                    <event value="1"
                    symbol="LockdownFuncEntryPointEvent"
                    level="win:Verbose"
                    task="FuncCallEvent"
                    opcode="win:Start"
                    keywords="FuncCall"
                    template="FunctionEntry"
                    message="$(string.Lockdown.FunctionEntryPointEventMessage)"/>

                    <event value="2"
                    symbol="LockdownFuncReturnValueEvent"
                    level="win:Verbose"
                    task="FuncCallEvent"
                    opcode="win:Stop"
                    keywords="FuncCall"
                    template="FunctionExit"
                    message="$(string.Lockdown.FunctionReturnValueEventEventMessage)"/>

                    <event
                        value="3"
                        symbol="LockdownLaunchApp"
                        level="win:Informational"
                        keywords="Lockdown"
                        template="AppLaunchTemplate"
                        message="$(string.Lockdown.LaunchAppMessage)"/>

                    <event
                        value="4"
                        symbol="ApplyLockdownStart"
                        level="win:Informational"
                        task="ApplyLockdownTask"
                        opcode="win:Start"
                        keywords="Lockdown Performance"
                        template="ApplyLockdownTemplate"
                        message="$(string.Lockdown.ApplyLockdownStart)"/>

                    <event
                        value="5"
                        symbol="ApplyLockdownCommand"
                        level="win:Informational"
                        task="ApplyLockdownTask"
                        opcode="win:Info"
                        keywords="Lockdown"
                        template="LockdownCommandTemplate"
                        message="$(string.Lockdown.ApplyLockdownCommand)"/>

                    <event
                        value="6"
                        symbol="ApplyLockdownCommandFailed"
                        level="win:Error"
                        task="ApplyLockdownTask"
                        opcode="win:Info"
                        keywords="Lockdown Error"
                        template="LockdownCommandTemplate"
                        message="$(string.Lockdown.ApplyLockdownCommandFailed)"/>

                    <event
                        value="7"
                        symbol="ApplyLockdownStop"
                        level="win:Informational"
                        task="ApplyLockdownTask"
                        opcode="win:Stop"
                        keywords="Lockdown Performance"
                        template="HResultTemplate"
                        message="$(string.Lockdown.ApplyLockdownStop)"/>

                    <event
                        value="8"
                        symbol="AppsLockdownCriticalEvent"
                        level="win:Critical"
                        keywords="Apps Lockdown"
                        template="AppsLockdownEventTemplate"
                        message="$(string.Lockdown.AppsLockdownEventMessage)"/>

                    <event
                        value="9"
                        symbol="AppsLockdownErrorEvent"
                        level="win:Error"
                        keywords="Apps Lockdown"
                        template="AppsLockdownEventTemplate"
                        message="$(string.Lockdown.AppsLockdownEventMessage)"/>

                    <event
                        value="10"
                        symbol="AppsLockdownWarningEvent"
                        level="win:Warning"
                        keywords="Apps Lockdown"
                        template="AppsLockdownEventTemplate"
                        message="$(string.Lockdown.AppsLockdownEventMessage)"/>

                    <event
                        value="11"
                        symbol="AppsLockdownInformationalEvent"
                        level="win:Informational"
                        keywords="Apps Lockdown"
                        template="AppsLockdownEventTemplate"
                        message="$(string.Lockdown.AppsLockdownEventMessage)"/>


                    <event
                        value="12"
                        symbol="AppsLockdownVerboseEvent"
                        level="win:Verbose"
                        keywords="Apps Lockdown"
                        template="AppsLockdownEventTemplate"
                        message="$(string.Lockdown.AppsLockdownEventMessage)"/>

                    <event
                        value="13"
                        symbol="AppsLockdownCriticalEventWithProductID"
                        level="win:Critical"
                        keywords="Apps Lockdown"
                        template="AppsLockdownEventWithProductIDTemplate"
                        message="$(string.Lockdown.AppsLockdownEventMessageWithProductID)"/>

                    <event
                        value="14"
                        symbol="AppsLockdownErrorEventWithProductID"
                        level="win:Error"
                        keywords="Apps Lockdown"
                        template="AppsLockdownEventWithProductIDTemplate"
                        message="$(string.Lockdown.AppsLockdownEventMessageWithProductID)"/>

                    <event
                        value="15"
                        symbol="AppsLockdownWarningEventWithProductID"
                        level="win:Warning"
                        keywords="Apps Lockdown"
                        template="AppsLockdownEventWithProductIDTemplate"
                        message="$(string.Lockdown.AppsLockdownEventMessageWithProductID)"/>

                    <event
                        value="16"
                        symbol="AppsLockdownInformationalEventWithProductID"
                        level="win:Informational"
                        keywords="Apps Lockdown"
                        template="AppsLockdownEventWithProductIDTemplate"
                        message="$(string.Lockdown.AppsLockdownEventMessageWithProductID)"/>

                    <event
                        value="17"
                        symbol="AppsLockdownVerboseEventWithProductID"
                        level="win:Verbose"
                        keywords="Apps Lockdown"
                        template="AppsLockdownEventWithProductIDTemplate"
                        message="$(string.Lockdown.AppsLockdownEventMessageWithProductID)"/>

                    <event
                        value="20"
                        symbol="FoundToastEntry"
                        level="win:Verbose"
                        keywords="Lockdown"
                        template="FoundToastEntryTemplate"
                        message="$(string.Lockdown.FoundToastEntry)"/>

                    <event
                        value="21"
                        symbol="WpnCallFailed"
                        level="win:Warning"
                        template="WpnCallFailedTemplate"
                        message="$(string.Lockdown.WpnCallFailed)"/>

                    <event
                        value="23"
                        symbol="LockdownNotificationsFailed"
                        level="win:Warning"
                        keywords="Error"
                        template="HResultTemplate"
                        message="$(string.Lockdown.LockdownNotificationsFailed)"/>

                    <event
                        value="24"
                        symbol="CoCreateCSyncMLDPUFailed"
                        level="win:Error"
                        keywords="Error"
                        template="HResultTemplate"
                        message="$(string.Lockdown.CoCreateCSyncMLDPUFailed)"/>

                    <event
                        value="25"
                        symbol="CSyncMLDPUInitializeFailed"
                        level="win:Error"
                        keywords="Error"
                        template="HResultTemplate"
                        message="$(string.Lockdown.CSyncMLDPUInitializeFailed)"/>

                    <event
                        value="26"
                        symbol="ThemeSaveStartMenuScreenSizeFailed"
                        level="win:Error"
                        keywords="Error"
                        template="HResultTemplate"
                        message="$(string.Lockdown.ThemeSaveStartMenuScreenSizeFailed)"/>

                    <event
                        value="27"
                        symbol="PublishScreenSizeWnfStateFailed"
                        level="win:Warning"
                        keywords="Error"
                        template="HResultTemplate"
                        message="$(string.Lockdown.PublishScreenSizeWnfStateFailed)"/>

                    <event
                        value="28"
                        symbol="NotificationsLockdownCommandInitializeFailed"
                        level="win:Error"
                        keywords="Error"
                        template="HResultTemplate"
                        message="$(string.Lockdown.NotificationsLockdownCommandInitializeFailed)"/>

                    <event
                        value="29"
                        symbol="NotificationsLockdownCommandExecuteFailed"
                        level="win:Error"
                        keywords="Error"
                        template="HResultTemplate"
                        message="$(string.Lockdown.NotificationsLockdownCommandExecuteFailed)"/>

                    <event
                        value="33"
                        symbol="CSPRunnerFailedToGetChildNode"
                        level="win:Warning"
                        template="HResultTemplate"
                        message="$(string.Lockdown.CSPRunnerFailedToGetChildNode)"/>

                    <event
                        value="34"
                        symbol="IsAppTileCollidedEvent"
                        level="win:Verbose"
                        template="IsAppTileCollidedTemplate"
                        message="$(string.Lockdown.IsAppTileCollided)"/>

                    <event
                        value="35"
                        symbol="TilePositionDetermined"
                        level="win:Verbose"
                        template="TilePositionTemplate"
                        message="$(string.Lockdown.TilePositionDeterminedMessage)"/>

                    <event
                        value="36"
                        symbol="DoneRemovingTilesFromHub"
                        level="win:Verbose"
                        template="HubTypeTemplate"
                        message="$(string.Lockdown.DoneRemovingTilesFromHub)"/>

                    <event
                        value="37"
                        symbol="TryCommitTile"
                        level="win:Verbose"
                        template="TryCommitTileTemplate"
                        message="$(string.Lockdown.TryCommitTile)"/>

                    <event
                        value="38"
                        symbol="TryCommitTileWithHubType"
                        level="win:Verbose"
                        template="TryCommitTileWithHubTypeTemplate"
                        message="$(string.Lockdown.TryCommitTileWithHubType)"/>

                    <event
                        value="39"
                        symbol="CommitTileFails"
                        level="win:Error"
                        template="CommitTileResultTemplate"
                        message="$(string.Lockdown.CommitTileReturns)"/>

                    <event
                        value="40"
                        symbol="CommitTileFailsWithHubType"
                        level="win:Error"
                        template="CommitTileResultWithHubTypeTemplate"
                        message="$(string.Lockdown.CommitTileReturnsWithHubType)"/>

                    <event
                        value="41"
                        symbol="CommitTileReturns"
                        level="win:Verbose"
                        template="CommitTileResultTemplate"
                        message="$(string.Lockdown.CommitTileReturns)"/>

                    <event
                        value="42"
                        symbol="CommitTileReturnsWithHubType"
                        level="win:Verbose"
                        template="CommitTileResultWithHubTypeTemplate"
                        message="$(string.Lockdown.CommitTileReturnsWithHubType)"/>

                    <event
                        value="43"
                        symbol="TileNotFound"
                        level="win:Warning"
                        template="FindTileResultTemplate"
                        message="$(string.Lockdown.TileNotFound)"/>

                    <event
                        value="44"
                        symbol="LockdownIfFailedLog"
                        level="win:Critical"
                        keywords="Error"
                        template="IfFailedLog"
                        message="$(string.Lockdown.IfFailedLogMessage)"
                />

                    <event
                        value="45"
                        symbol="LockdownIfFailedLogWarning"
                        level="win:Warning"
                        keywords="Lockdown"
                        template="IfFailedLog"
                        message="$(string.Lockdown.IfFailedLogWarningMessage)"
                />

                    <event
                        value="46"
                        symbol="SkipSnapshotDefaultProfileExists"
                        level="win:Informational"
                        keywords="Lockdown"
                        message="$(string.Lockdown.SkipSnapshotDefaultProfileExistsMessage)"
                />

                    <event
                        value="47"
                        symbol="FoundTurnedOffToastEntry"
                        level="win:Verbose"
                        keywords="Lockdown"
                        template="FoundToastEntryTemplate"
                        message="$(string.Lockdown.FoundTurnedOffToastEntry)"/>
                    
                    <event
                        value="48"
                        symbol="IsTileLocationLowerCount"
                        level="win:Verbose"
                        keywords="Lockdown"
                        template="UnsignedInt32Template"
                        message="$(string.Lockdown.IsTileLocationLowerCount)"/>
                    
                    <event
                        value="101"
                        symbol="ButtonLockdownErrorEvent"
                        level="win:Error"
                        keywords="Buttons Lockdown"
                        template="ButtonLockdownEventTemplate"
                        message="$(string.Lockdown.ButtonLockdownEventMessage)"/>

                    <event
                        value="102"
                        symbol="ButtonLockdownWarningEvent"
                        level="win:Warning"
                        keywords="Buttons Lockdown"
                        template="ButtonLockdownEventTemplate"
                        message="$(string.Lockdown.ButtonLockdownEventMessage)"/>

                    <event
                        value="201"
                        symbol="SettingsLockdownErrorEvent"
                        level="win:Error"
                        keywords="Settings Lockdown"
                        template="SettingsLockdownEventTemplate"
                        message="$(string.Lockdown.SettingsLockdownEventMessage)"/>

                    <event
                        value="202"
                        symbol="SettingsLockdownWarningEvent"
                        level="win:Warning"
                        keywords="Settings Lockdown"
                        template="SettingsLockdownEventTemplate"
                        message="$(string.Lockdown.SettingsLockdownEventMessage)"/>

                    <event
                        value ="203"
                        symbol="SettingsLockdownWarningEventWithName"
                        level="win:Warning"
                        keywords="Settings Lockdown"
                        template="SettingsLockdownEventWithNameTemplate"
                        message="$(string.Lockdown.SettingsLockdownEventMessageWithName)"/>

                    <event
                        value="801"
                        symbol="LockdownXmlValidationError"
                        level="win:Error"
                        keywords="Lockdown Xml"
                        template="LockdownXmlValidationErrorTemplate"
                        message="$(string.Lockdown.XmlValidationErrorMessage)"/>

                    <event
                        value="802"
                        symbol="LockdownXmlValidationErrorWithValue"
                        level="win:Error"
                        keywords="Lockdown Xml"
                        template="LockdownXmlValidationErrorWithValueTemplate"
                        message="$(string.Lockdown.XmlValidationErrorMessageWithValue)" />

                    <event
                        value="803"
                        symbol="LockdownXmlRetrieveValueError"
                        level="win:Error"
                        keywords="Lockdown Xml"
                        template="LockdownXmlRetrieveValueFailureTemplate"
                        message="$(string.Lockdown.XmlRetrieveValueFailureMessage)" />

                    <event
                        value="804"
                        symbol="LockdownXmlRetrieveValueWarning"
                        level="win:Warning"
                        keywords="Lockdown Xml"
                        template="LockdownXmlRetrieveValueFailureTemplate"
                        message="$(string.Lockdown.XmlRetrieveValueFailureMessage)" />

                    <event
                        value="805"
                        symbol="RegistryOperationResult"
                        level="win:Warning"
                        template="RegistryTemplate"
                        message="$(string.Lockdown.RegistryOperationMessage)" />
                    
                    <event
                        value="806"
                        symbol="CuratedTileCollectionOperation"
                        level="win:Warning"
                        template="CuratedTileCollectionTemplate"
                        message="$(string.Lockdown.CuratedTileCollectionMessage)" />
                    
                </events>
            </provider>
        </events>
    </instrumentation>

    <localization>
        <resources culture="en-US">
            <stringTable>

                <string id="Keyword.Error" value="Error" />
                <string id="Keyword.Performance" value="Performance" />
                <string id="Keyword.Lockdown" value="Lockdown" />
                <string id="Keyword.FuncCall" value="Function Calls" />
                <string id="Keyword.Xml" value="Xml"/>
                <string id="Keyword.Buttons" value="Buttons"/>
                <string id="Keyword.Settings" value="Settings"/>
                <string id="LockdownType.Apps" value="Apps"/>
                <string id="LockdownType.Buttons" value="Buttons"/>
                <string id="LockdownType.CSPRunner" value="CSPRunner"/>
                <string id="LockdownType.Menu" value="Menu"/>
                <string id="LockdownType.Notifications" value="Notifications"/>
                <string id="LockdownType.Settings" value="Settings"/>
                <string id="LockdownType.StartScreen" value="StartScreen"/>
                <string id="LockdownType.Tiles" value="Tiles"/>
                <string id="PMHubType.Start" value="StartScreen" />
                <string id="PMHubType.AppList" value="AppList"/>
                <string id="PMHubType.Invalid" value="Invalid"/>

                <string id="Lockdown.FunctionEntryPointEventMessage"
                      value="Function entry - %1"/>
                <string id="Lockdown.FunctionReturnValueEventEventMessage"
                      value="Return value from function %1. HR = %2."/>
                <string id="Lockdown.LaunchAppMessage"
                      value="Launching autorun application. Modern=%1 Uri/AppId=%2 Parameters=%3"/>
                <string id="Lockdown.AppsLockdownEventMessage"
                      value="AppsLockdown Event. Type=%1, Status=%2"/>
                <string id="Lockdown.AppsLockdownEventMessageWithProductID"
                      value="AppsLockdown Event. Type=%1, Status=%2, ProductID=%3"/>
                <string id="Lockdown.ButtonLockdownEventMessage"
                      value="ButtonsLockdown Event. Type=%1, Status=%2"/>
                <string id="Lockdown.SettingsLockdownEventMessage"
                      value="SettingsLockdown Event. Type=%1, Status=%2"/>
                <string id="Lockdown.SettingsLockdownEventMessageWithName"
                      value="SettingsLockdown Event. Type=%1, SettingName=%2, Status=%3"/>
                <string id="Lockdown.XmlValidationErrorMessage"
                      value="Xml Validation Error. LockdownType=%1, NodeName=%2, Status=%3"/>
                <string id="Lockdown.XmlValidationErrorMessageWithValue"
                      value="Xml Validation Error. LockdownType=%1, NodeName=%2, NodeValue=%3, Status=%4"/>
                <string id="Lockdown.XmlRetrieveValueFailureMessage"
                      value="Retrieving value from an xPath fails. LockdownType=%1, NodePath=%2, Status=%3"/>
                <string id="Lockdown.ApplyLockdownStart"
                      value="Applying Lockdown Role: %1, API:%2" />
                <string id="Lockdown.ApplyLockdownCommand"
                      value="Running Lockdown Command (%1) Phase:%2 Status:%3" />
                <string id="Lockdown.ApplyLockdownCommandFailed"
                      value="Lockdown Command (%1) Failed Phase:%2 Status:%3" />
                <string id="Lockdown.ApplyLockdownStop"
                      value="Finished applying lockdown, Status:%1" />
                <string id="Lockdown.AppsLockdownError"
                      value="An Error occured during Apps lockdown, Status:%1" />
                <string id="Lockdown.IfFailedLogMessage"
                      value="HResult failed in File: %1 ,Function: %2 Line: %3 ,HResult = %4."/>
                <string id="Lockdown.IfFailedLogWarningMessage"
                      value="Warning - HResult failed in File: %1 ,Function: %2 Line: %3 ,HResult = %4."/>
                <string id="Lockdown.SkipSnapshotDefaultProfileExistsMessage"
                      value="Skipping Snapshot because default profile exists."/>
                <string id="Lockdown.FoundToastEntry"
                      value="Found toast aumid=%1, AppType: %2, IsEnabled: %3" />
                <string id="Lockdown.FoundTurnedOffToastEntry"
                      value="Found turned off toast aumid=%1, AppType: %2, IsEnabled: %3" />
                <string id="Lockdown.WpnCallFailed"
                      value="Call to Wpn failed (%2) failed %1" />
                <string id="Lockdown.LockdownNotificationsFailed"
                      value="ClearAndLockdownNotifications failed, error = %1" />

                <string id="LockdownCommandPhaseSelect"
                      value="SelectNode" />
                <string id="LockdownCommandPhaseInit"
                      value="Initialize" />
                <string id="LockdownCommandPhaseExec"
                      value="Execute" />
                <string id="LockdownCommandPhaseApiExec"
                      value="ApiExecute" />

                <string id="Lockdown.CoCreateCSyncMLDPUFailed"
                      value="Failed to CoCreateInstance CSyncMLDPU object with errorcode = %1" />
                <string id="Lockdown.CSyncMLDPUInitializeFailed"
                      value="Failed to Initialize CSyncMLDPU object with errorcode = %1" />

                <string id="Lockdown.ThemeSaveStartMenuScreenSizeFailed"
                      value="ThemeSaveStartMenuScreenSizeFailed failed to set start menu screen size with errorcode = %1" />
                <string id="Lockdown.PublishScreenSizeWnfStateFailed"
                      value="PublishScreenSizeWnfState failed with errorcode = %1" />

                <string id="Lockdown.NotificationsLockdownCommandInitializeFailed"
                      value="NotificationsLockdownCommand::Initialize failed with errorcode = %1" />
                <string id="Lockdown.NotificationsLockdownCommandExecuteFailed"
                      value="NotificationsLockdownCommand::Execute failed with errorcode = %1" />

                <string id="Lockdown.CSPRunnerFailedToGetChildNode"
                      value="In CSPRunnerLockdownCommand::Execute() failed to get child nodes of TopLevelNodes with errorcode = %1" />
                <string id="Lockdown.IsAppTileCollided"
                      value="The Tile for App:%1 has collision:%2"/>
                <string id="Lockdown.TilePositionDeterminedMessage"
                      value="App %1 Tile position to be pinned is X:%2, Y:%3"/>
                <string id="Lockdown.DoneRemovingTilesFromHub"
                      value="Done removing tiles from the hub: %1"/>
                <string id="Lockdown.TryCommitTile"
                      value="Trying to commit tile. Product ID: %1, result: %2, attempt: %3"/>
                <string id="Lockdown.TryCommitTileWithHubType"
                      value="Trying to commit tile from hub: %1, product ID: %2, result: %3, attempt: %4"/>
                <string id="Lockdown.CommitTileReturns"
                      value="Commit tile returns. Product ID: %1, result: %2"/>
                <string id="Lockdown.CommitTileReturnsWithHubType"
                      value="Commit tile returns. Hub: %1, product ID: %2, result: %3"/>
                <string id="Lockdown.TileNotFound"
                      value="The following tile can not be found. Product ID: %1, tile ID: %2, result: %3"/>

                <string id="Lockdown.IsTileLocationLowerCount"
                      value="Is_TileLocation_Lower has been invoked %1 times"/>


                <!-- AppsLockdownImpl, [1,100) -->
                <string id="LockdownImpl.FunctionName.1"
                      value="AppsLockdownImpl::CreateInstance"/>
                <string id="LockdownImpl.FunctionName.2"
                      value="AppsLockdownImpl::ValidateAndProcessStartScreenTileConfig"/>
                <string id="LockdownImpl.FunctionName.3"
                      value="AppsLockdownImpl::Initialize"/>
                <string id="LockdownImpl.FunctionName.4"
                      value="AppsLockdownImpl::DisableAllNotifications"/>
                <string id="LockdownImpl.FunctionName.5"
                      value="AppsLockdownImpl::SetNotificationsAndToasts"/>
                <string id="LockdownImpl.FunctionName.6"
                      value="AppsLockdownImpl::Execute"/>
                <string id="LockdownImpl.FunctionName.7"
                      value="AppsLockdownImpl::SetCortanaPolicy"/>
                <string id="LockdownImpl.FunctionName.8"
                      value="AppsLockdownImpl::SetCortanaPolicyThroughPolicyManager"/>
                <string id="LockdownImpl.FunctionName.9"
                      value="AppsLockdownImpl::ConstructCortanaSyncML"/>
                <string id="LockdownImpl.FunctionName.10"
                      value="AppsLockdownImpl::TryPinTiles"/>
                <string id="LockdownImpl.FunctionName.11"
                      value="AppsLockdownImpl::PinCollidedTiles"/>
                <string id="LockdownImpl.FunctionName.12"
                      value="AppsLockdownImpl::ExecuteApiActions"/>
                <string id="LockdownImpl.FunctionName.13"
                      value="AppsLockdownImpl::SetDefaultSession"/>
                <string id="LockdownImpl.FunctionName.14"
                      value="AppsLockdownImpl::ClearBackstack"/>
                <string id="LockdownImpl.FunctionName.15"
                      value="AppsLockdownImpl::LaunchAutoRunSession"/>
                <string id="LockdownImpl.FunctionName.16"
                      value="AppsLockdownImpl::LaunchKioskModernApplication"/>
                <string id="LockdownImpl.FunctionName.17"
                      value="AppsLockdownImpl::FindDefaultProductTile"/>
                <string id="LockdownImpl.FunctionName.18"
                      value="AppsLockdownImpl::RemoveAllTiles"/>
                <string id="LockdownImpl.FunctionName.19"
                      value="AppsLockdownImpl::RemoveAllTilesFromHub"/>
                <string id="LockdownImpl.FunctionName.20"
                      value="AppsLockdownImpl::InitializePacMan"/>
                <string id="LockdownImpl.FunctionName.21"
                      value="AppsLockdownImpl::PinTile"/>
                <string id="LockdownImpl.FunctionName.22"
                      value="AppsLockdownImpl::CommitTile"/>
                <string id="LockdownImpl.FunctionName.23"
                      value="AppsLockdownImpl::ComposeAutoRunConfig"/>
                <string id="LockdownImpl.FunctionName.24"
                      value="AppsLockdownImpl::PinAppToStartIfNeeded"/>
                <string id="LockdownImpl.FunctionName.25"
                      value="LaunchApplication"/>
                <string id="LockdownImpl.FunctionName.26"
                      value="GetAutoRunApplication"/>
                <string id="LockdownImpl.FunctionName.27"
                        value="FindProductTile"/>
                <string id="LockdownImpl.FunctionName.28"
                      value="ConstructAppLockerSyncML"/>
                <string id="LockdownImpl.FunctionName.29"
                      value="ConstructAppLockerFilePublisherRule"/>
                <string id="LockdownImpl.FunctionName.30"
                        value="ObtainProductName"/>
                <string id="LockdownImpl.FunctionName.31"
                      value="SetAppLockerPolicyThroughPolicyManager"/>
                <string id="LockdownImpl.FunctionName.32"
                        value="ConstructAppLockerRuleCollection"/>
                <string id="LockdownImpl.FunctionName.33"
                      value="AddAppLockerPolicyNodeThroughPolicyManager"/>
                <string id="LockdownImpl.FunctionName.34"
                      value="InitializeInternalApps"/>
                <string id="LockdownImpl.FunctionName.35"
                      value="AddToAppLockerFilePublisherRules"/>
                <string id="LockdownImpl.FunctionName.36"
                      value="AppsLockdownImpl::ExecuteStartMenuTilesLockdown"/>
                <string id="LockdownImpl.FunctionName.37"
                     value="AppsLockdownImpl::GetToastAllowedAppIds"/>
                <string id="LockdownImpl.FunctionName.38"
                     value="AppsLockdownImpl::ClearAndLockdownNotifications"/>
                <string id="LockdownImpl.FunctionName.39"
                     value="AppsLockdownImpl::SetWpnToastSetting"/>
                <string id="LockdownImpl.FunctionName.40"
                     value="AppsLockdownImpl::ObtainProductName"/>
                <string id="LockdownImpl.FunctionName.41"
                     value="AppsLockdownImpl::Snapshot_2_Params"/>
                <string id="LockdownImpl.FunctionName.42"
                     value="AppsLockdownImpl::Snapshot_3_Params"/>
                <string id="LockdownImpl.FunctionName.43"
                     value="AppsLockdownImpl::SnapshotNotifications"/>
                <string id="LockdownImpl.FunctionName.44"
                     value="AppsLockdownImpl::PrepareXmlApplicationElement"/>
                <string id="LockdownImpl.FunctionName.45"
                     value="AppsLockdownImpl::DoLaunchAutoRunSession"/>
                <string id="LockdownImpl.FunctionName.46"
                     value="AppsLockdownImpl::ConfigureKioskMode"/>
                <string id="LockdownImpl.FunctionName.47"
                     value="AppsLockdownImpl::CreateTile"/>
                <string id="LockdownImpl.FunctionName.48"
                     value="Is_TileLocation_Lower"/>
                <string id="LockdownImpl.FunctionName.49"
                     value="AppsLockdownImpl::UpdateGridMap"/>
                <string id="LockdownImpl.FunctionName.50"
                     value="AppsLockdownImpl::IsCollided"/>
                <string id="LockdownImpl.FunctionName.51"
                     value="AppsLockdownImpl::PrepareXmlAppsElement"/>
                <string id="LockdownImpl.FunctionName.52"
                     value="AppsLockdownImpl::ImportXML"/>
                <!-- AppsLockdown event type strings -->
                <string id="AppsLockdown.PacmanCallReturn"
                      value="Pacman call returns during AppsLockdown"/>
                <string id="AppsLockdown.ShellCallFailure"
                      value="AppsLockdown Shell call returns failure"/>
                <string id="AppsLockdown.PolicyManagerCallFailure"
                      value="PolicyManager call returns failure during AppsLockdown"/>
                <string id="AppsLockdown.DPUCallFailure"
                      value="DPU call returns failure during AppsLockdown"/>
                <string id="AppsLockdown.RetrieveAppOrTile"
                      value="Retrieving app or tile during Appslockdown "/>
                <string id="AppsLockdown.ObtainProductName"
                      value="Obtain the ProductName in AppLocker format "/>
                <string id="AppsLockdown.Notification"
                      value="Processing notification setting fails during Appslockdown"/>
                <string id="AppsLockdown.AutoRunApp"
                      value="Processing AutoRunApp setting fails during Appslockdown"/>
                <string id="AppsLockdown.PinToStart"
                      value="Processing pinning tile to start fails during Appslockdown, this tile will not be pinned to the start screen."/>
                <string id="AppsLockdown.AppsSorted"
                      value="Apps are sorted at this point"/>
                <string id="AppsLockdown.EnumerateApps"
                      value="Enumerating Apps"/>
                <string id="AppsLockdown.LocationUninitialized"
                      value="Tile location is uninitialized when unpacked"/>
                <string id="AppsLockdown.OtherEvent"
                      value="Other event occurs during Appslockdown"/>
                <string id="AppsLockdown.SnapshotNoApp"
                        value="No apps to take snapshot"/>
                <string id="AppsLockdown.HubpositionNotInitialized"
                        value="Hubposition Not Initialized during snapshot"/>

                <!-- ButtonLockdownImpl, [100,200) -->
                <string id="LockdownImpl.FunctionName.100"
                      value="ButtonLockdownImpl::ApplyRegistrySettings"/>
                <string id="LockdownImpl.FunctionName.101"
                      value="ButtonLockdownImpl::CreateInstance"/>
                <string id="LockdownImpl.FunctionName.102"
                      value="ButtonLockdownImpl::Remap_UpdateStateUsingXMLNodeForButtonAndEvents"/>
                <string id="LockdownImpl.FunctionName.103"
                      value="ButtonLockdownImpl::UpdateRegistryMapUsingXMLNodeForSubKeyWithFunction"/>
                <string id="ButtonLockdown.LockButtonsEvent"
                      value="A failure occurs when trying to lock buttons"/>
                <string id="ButtonLockdown.RemapButtonsEvent"
                      value="A failure occurs when trying to remap buttons"/>
                <string id="ButtonLockdown.RegKeyEvent"
                      value="RegKey operation returns failure during buttons lockdown"/>
                <string id="ButtonLockdown.OtherEvent"
                      value="Other event occurs during ButtonLockdown"/>

                <!-- CSPRunnerLockdownCommand, [200,300) -->
                <string id="LockdownImpl.FunctionName.200"
                      value="CSPRunnerLockdownCommand::Execute"/>

                <!-- LockdownCommandChain, [300,400) -->
                <string id="LockdownImpl.FunctionName.300"
                      value="LockdownXMLHandler::GetLockdownXmlPath"/>
                <string id="LockdownImpl.FunctionName.301"
                      value="LockdownXMLHandler::LoadLockdownXml"/>
                <string id="LockdownImpl.FunctionName.302"
                      value="LockdownXMLHandler::LoadLockdownXmlFromPath"/>
                <string id="LockdownImpl.FunctionName.303"
                      value="LockdownXMLHandler::GetSupportedLockdownProfiles"/>
                <string id="LockdownImpl.FunctionName.304"
                      value="LockdownCommandChain::GetCurrentLockdownProfile"/>
                <string id="LockdownImpl.FunctionName.305"
                      value="LockdownXMLHandler::GetLockdownProfileInformation"/>
                <string id="LockdownImpl.FunctionName.306"
                      value="LockdownCommandChain::ApplyLockdownProfileAsync"/>
                <string id="LockdownImpl.FunctionName.307"
                      value="LockdownXMLHandler::SelectProfileNode"/>
                <string id="LockdownImpl.FunctionName.308"
                      value="LockdownCommandChain::InitializeCommandForCurrentProfile"/>
                <string id="LockdownImpl.FunctionName.309"
                      value="LockdownCommandChain::InitializeCommandForProfile"/>
                <string id="LockdownImpl.FunctionName.310"
                      value="ConvertXsBooleanToBool"/>
                <string id="LockdownImpl.FunctionName.311"
                      value="LockdownCommandChain::SetLockdownFlags"/>
                <string id="LockdownImpl.FunctionName.312"
                      value="LockdownCommandChain::RemoveTargetLockdownProfile"/>
                <string id="LockdownImpl.FunctionName.313"
                      value="LockdownCommandChain::RemoveLockdownFlags"/>
                <string id="LockdownImpl.FunctionName.314"
                      value="LockdownCommandChain::GetTargetLockdownProfile"/>
                <string id="LockdownImpl.FunctionName.315"
                      value="LockdownCommandChain::SetTargetLockdownProfile"/>
                <string id="LockdownImpl.FunctionName.316"
                      value="LockdownXMLHandler::SetLockdownProfileInformation"/>
                <string id="LockdownImpl.FunctionName.317"
                      value="LockdownXMLHandler::CreateLockdownXmlDoc"/>
                <string id="LockdownImpl.FunctionName.318"
                      value="LockdownXMLHandler::AddRoleInLockdownXML"/>
                <string id="LockdownImpl.FunctionName.319"
                      value="LockdownXMLHandler::SaveXML"/>
                <string id="LockdownImpl.FunctionName.320"
                      value="LockdownXMLHandler::LoadEx"/>
                <string id="LockdownImpl.FunctionName.321"
                      value="LockdownRemoteXMLHandler::GetLockdownXmlPath"/>
                <string id="LockdownImpl.FunctionName.322"
                      value="LockdownXMLHandler::TakeSnapshot"/>
                <string id="LockdownImpl.FunctionName.323"
                      value="LockdownXMLHandler::FormatProfile"/>
                <string id="LockdownImpl.FunctionName.324"
                      value="LockdownXMLHandler::GetButtonToggles"/>
                <string id="LockdownImpl.FunctionName.325"
                      value="LockdownXMLHandler::SetButtonToggles"/>
                <string id="LockdownImpl.FunctionName.326"
                      value="LockdownCommandChain::GetSnapshotLockdownProfile"/>
                <string id="LockdownImpl.FunctionName.327"
                      value="LockdownCommandChain::SetSnapshotLockdownProfile"/>
                <string id="LockdownImpl.FunctionName.328"
                      value="LockdownCommandChain::ApplyTaskSwitcherPolicy"/>
                <string id="LockdownImpl.FunctionName.329"
                      value="LockdownCommandChain::SetLockdownButtonFlags"/>
                <string id="LockdownImpl.FunctionName.330"
                      value="LockdownCommandChain::RemoveLockdownButtonFlags"/>
                <string id="LockdownImpl.FunctionName.331"
                      value="LockdownCommandChain::AddProfileNodeToXml"/>
                <string id="LockdownImpl.FunctionName.332"
                      value="LockdownCommandChain::RemoveApplockerProfile"/>

                <!-- MenuLockdownCommand, [400,500) -->
                <string id="LockdownImpl.FunctionName.400"
                      value="MenuLockdownCommand::Execute"/>
                <string id="LockdownImpl.FunctionName.401"
                      value="MenuLockdownCommand::Initialize"/>

                <!-- NotificationsLockdownCommand, [500,600) -->
                <string id="LockdownImpl.FunctionName.500"
                      value="NotificationsLockdownCommand::Execute"/>
                <string id="LockdownImpl.FunctionName.501"
                      value="NotificationsLockdownCommand::Initialize"/>

                <!-- SettingsLockdownCommand, [600,700) -->
                <string id="LockdownImpl.FunctionName.600"
                      value="SettingsLockdownCommand::CacheSettingsPivotRegistryKeyFromGUID"/>
                <string id="LockdownImpl.FunctionName.601"
                      value="SettingsLockdownCommand::DisableAllSettingsUnderKeyAndCacheHandle"/>
                <string id="LockdownImpl.FunctionName.602"
                      value="SettingsLockdownCommand::Execute"/>
                <string id="LockdownImpl.FunctionName.603"
                      value="SettingsLockdownCommand::Initialize"/>
                <string id="LockdownImpl.FunctionName.604"
                      value="SettingsLockdownCommand::LockdownSettingsListForPivotGUID"/>
                <string id="LockdownImpl.FunctionName.605"
                      value="SettingsLockdownCommand::EnableSettingInHiveUnderKey"/>
                <string id="LockdownImpl.FunctionName.606"
                      value="SettingsLockdownCommand::SetSettingsPageRegistryKeys"/>
                <string id="LockdownImpl.FunctionName.607"
                      value="SettingsLockdownCommand::SetSettingsPageRegistryKey"/>
                <string id="LockdownImpl.FunctionName.608"
                      value="SettingsLockdownCommand::PopulateAllSettingsPageRegistryKeysAsDisabled"/>
                <string id="LockdownImpl.FunctionName.609"
                      value="SettingsLockdownCommand::LoadQuickActionDependencies"/>
                <string id="LockdownImpl.FunctionName.610"
                      value="SettingsLockdownCommand::PopulateQuickActionDependentGroupAndPage"/>

                <string id="SettingsLockdown.RegKeyEvent"
                        value="Regkey operation returns failure during settings lockdown"/>
                <string id="SettingsLockdown.OtherEvent"
                        value="Other event occurs failure during settings lockdown"/>
                <string id="SettingsLockdown.ActionCenterEvent"
                        value="Event occurs failure during action center lockdown"/>


                <!-- SettingsLockdownCommand, [700,800) -->
                <string id="LockdownImpl.FunctionName.700"
                      value="StartScreenModeLockdownCommand::Initialize"/>
                <string id="LockdownImpl.FunctionName.701"
                      value="StartScreenModeLockdownCommand::Execute"/>
                <string id="LockdownImpl.FunctionName.702"
                      value="StartScreenModeLockdownCommand::PublishScreenSizeWnfState"/>

                <string id="LockdownImpl.FunctionName.TilesLockdownCommand_Initialize"
                      value="TilesLockdownCommand::Initialize"/>
                <string id="LockdownImpl.FunctionName.TilesLockdownCommand_Execute"
                      value="TilesLockdownCommand::Execute"/>

                <!-- WifiLockdownCommand, [1000,1100) -->
                <string id="LockdownImpl.FunctionName.WifiLockdownCommand_Initialize"
                      value="WifiLockdownCommand::Initialize"/>
                <string id="LockdownImpl.FunctionName.WifiLockdownCommand_Execute"
                      value="WifiLockdownCommand::Execute"/>

                <!--WEHLockdown.cpp, [1100,1200)-->
                <string id="LockdownImpl.FunctionName.1100"
                      value="LockDownMgrApplyProfile"/>
                <string id="LockdownImpl.FunctionName.1101"
                      value="LockdownMgrSetLockdownWnf"/>

                <!--AppsLockdownImpl2.cpp, [1200,1300)-->
                <string id="LockdownImpl.FunctionName.1200"
                      value="AppsLockdownImpl2::CreateInstance"/>
                <string id="LockdownImpl.FunctionName.1201"
                      value="AppsLockdownImpl2::ValidateAndProcessStartScreenTileConfig"/>
                <string id="LockdownImpl.FunctionName.1202"
                      value="AppsLockdownImpl2::GetTileSizeFromSizeNode"/>
                <string id="LockdownImpl.FunctionName.1203"
                      value="AppsLockdownImpl2::GetTextNodeValueLong"/>
                <string id="LockdownImpl.FunctionName.1204"
                      value="AppsLockdownImpl2::Initialize"/>
                <string id="LockdownImpl.FunctionName.1205"
                      value="AppsLockdownImpl2::ImportXML"/>
                <string id="LockdownImpl.FunctionName.1206"
                      value="AppsLockdownImpl2::DeleteAllTileCollectionsFromLastXml"/>
                <string id="LockdownImpl.FunctionName.1207"
                      value="AppsLockdownImpl2::ExecuteStartMenuTilesLockdown"/>
                <string id="LockdownImpl.FunctionName.1208"
                      value="AppsLockdownImpl2::Execute"/>
                <string id="LockdownImpl.FunctionName.1209"
                      value="AppsLockdownImpl2::PinAppToStartIfNeeded"/>
                <string id="LockdownImpl.FunctionName.1210"
                      value="AppsLockdownImpl2::CreateCuratedTileCollection"/>
                <string id="LockdownImpl.FunctionName.1211"
                      value="AppsLockdownImpl2::SwitchToCuratedTileCollection"/>
                <string id="LockdownImpl.FunctionName.1212"
                      value="AppsLockdownImpl2::ExecuteApiActions"/>
                <string id="LockdownImpl.FunctionName.1213"
                      value="AppsLockdownImpl2::LaunchAutoRunSession"/>
                <string id="LockdownImpl.FunctionName.1214"
                      value="AppsLockdownImpl2::Snapshot"/>
                <string id="LockdownImpl.FunctionName.1215"
                      value="AppsLockdownImpl2::DoLaunchAutoRunSession"/>
                <string id="LockdownImpl.FunctionName.1216"
                      value="AppsLockdownImpl2::GetAutoRunApplication"/>
                <string id="LockdownImpl.FunctionName.1217"
                      value="AppsLockdownImpl2::LaunchApplication"/>
                <string id="Lockdown.RegistryOperationMessage"
                      value="%1 with return code %2 and data %3"/>
                <string id="Lockdown.CuratedTileCollectionMessage"
                      value="%1 curated tile collection %2 with return code %3"/>
            </stringTable>
        </resources>
    </localization>

</instrumentationManifest>
