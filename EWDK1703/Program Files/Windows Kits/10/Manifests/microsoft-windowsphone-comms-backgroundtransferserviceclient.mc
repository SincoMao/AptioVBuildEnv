<?xml version="1.0"?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->

<instrumentationManifest
            xmlns="http://schemas.microsoft.com/win/2004/08/events"
            xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:Comms="http://www.w3.org/2001/XMLSchema">
    <instrumentation>

        <events>
            <!--Publisher Info -->
            <provider name="Microsoft-WindowsPhone-Comms-BackgroundTransferServiceClient"
                guid="{3aaead8c-c647-49d7-bd04-548449a63644}"
                symbol="WM_COMMS_BTS_CLIENT_PUBLISHER"
                resourceFileName="btscli.dll"
                messageFileName="btscli.dll">

                <!--Event Templates -->
                <templates>

                  <!--Event Template defined for Comms Logging -->
                    <template tid="CommsHrTemplate">
                        <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
                        <data name="P2_String" inType="win:AnsiString"/>
                        <data name="P3_UInt32" inType="win:UInt32"/>
                    </template>


                    <template tid="Comms_BtsCli_noargs">
                        <UserData>
                        </UserData>
                    </template>

                    <template tid="Comms_BtsCli_hexint">
                        <data name="Prop_HexInt32_1" inType="win:HexInt32"/>

                        <UserData>
                            <printfTrace xmlns="BtsCli">
                                <Prop_HexInt32_1> %1 </Prop_HexInt32_1>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtsCli_hexint_hexint">
                        <data name="Prop_HexInt32_1" inType="win:HexInt32"/>
                        <data name="Prop_HexInt32_2" inType="win:HexInt32"/>

                        <UserData>
                            <printfTrace xmlns="BtsCli">
                                <Prop_HexInt32_1> %1 </Prop_HexInt32_1>
                                <Prop_HexInt32_2> %2 </Prop_HexInt32_2>                                
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtsCli_hexint_string">
                        <data name="Prop_HexInt32_1" inType="win:HexInt32"/>
                        <data name="Prop_String" inType="win:UnicodeString" />

                        <UserData>
                            <printfTrace xmlns="BtsCli">
                                <Prop_HexInt32_1> %1 </Prop_HexInt32_1>
                                <Prop_String> %2 </Prop_String>                                
                            </printfTrace>
                        </UserData>
                    </template>

                </templates>

                <!--All the Events that can be published by this Publisher -->

                <!--New custom log level definition for 'Debug' level events -->

                <levels>
                    <level
                       name="Comms:Debug"
                       symbol="COMMSLEVEL_DEBUG"
                       value="16"/>
                </levels>

                <keywords>
                  <!-- Keywords 1 and 2 are defined by WM best practices.  Every
                       event should be tagged with at least one of these keywords. -->
                  <keyword mask="0x0000000000000001" name="Error"/>
                  <keyword mask="0x0000000000000002" name="Performance"/>

                  <!-- Provider-specific keywords -->
                  <keyword mask="0x0000000000000004" name="BtsCli"/>

                  <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
                  <keyword mask="0x0000400000000000" name="Warning"/>
                </keywords>

                <events>

                    <!-- CommsErrorTemplate is the default handling of IF_FAIL HR logging -->
                    <event value="1"
                          level="win:Error"
                          template="CommsHrTemplate"
                          symbol="CommsErrorOriginateEvent"
                          message="$(string.Event.CommsErrorOriginateMessage)"
                          keywords="Error"/>

                    <event value="2"
                          level="win:Warning"
                          template="CommsHrTemplate"
                          symbol="CommsErrorPropagateEvent"
                          message="$(string.Event.CommsPropagateErrorMessage)"
                          keywords="Warning"/>

                  <!--  BTS Client Events -->

                    <event value="20"
                          level="win:Informational"
                          template="Comms_BtsCli_hexint"
                          keywords="BtsCli"
                          symbol="Comms_BtsCli_Request_Created"
                          message="$(string.Publisher.Comms_BtsCli_Request_Created)"/>

                    <event value="21"
                          level="win:Informational"
                          template="Comms_BtsCli_hexint"
                          keywords="BtsCli"
                          symbol="Comms_BtsCli_Request_Closed"
                          message="$(string.Publisher.Comms_BtsCli_Request_Closed)"/>

                    <event value="22"
                          level="win:Informational"
                          template="Comms_BtsCli_hexint_string"
                          keywords="BtsCli"
                          symbol="Comms_BtsCli_Creating_File"
                          message="$(string.Publisher.Comms_BtsCli_Creating_File)"/>

                    <event value="23"
                          level="win:Informational"
                          template="Comms_BtsCli_hexint_hexint"
                          keywords="BtsCli"
                          symbol="Comms_BtsCli_Notify_Callback"
                          message="$(string.Publisher.Comms_BtsCli_Notify_Callback)"/>

                    <event value="24"
                          level="win:Informational"
                          template="Comms_BtsCli_hexint_hexint"
                          keywords="BtsCli"
                          symbol="Comms_BtsCli_Notify_Cleanup"
                          message="$(string.Publisher.Comms_BtsCli_Notify_Cleanup)"/>

                    <event value="25"
                          level="win:Informational"
                          template="Comms_BtsCli_hexint"
                          keywords="BtsCli"
                          symbol="Comms_BtsCli_Notify_Canceled"
                          message="$(string.Publisher.Comms_BtsCli_Notify_Canceled)"/>

                    <event value="26"
                          level="win:Informational"
                          template="Comms_BtsCli_hexint_hexint"
                          keywords="BtsCli"
                          symbol="Comms_BtsCli_Notify_Created"
                          message="$(string.Publisher.Comms_BtsCli_Notify_Created)"/>

                    <event value="27"
                          level="win:Informational"
                          template="Comms_BtsCli_noargs"
                          keywords="BtsCli"
                          symbol="Comms_BtsCli_Pause_Notification"
                          message="$(string.Publisher.Comms_BtsCli_Pause_Notification)"/>

                    <event value="28"
                          level="win:Informational"
                          template="Comms_BtsCli_noargs"
                          keywords="BtsCli"
                          symbol="Comms_BtsCli_Resume_Notification"
                          message="$(string.Publisher.Comms_BtsCli_Resume_Notification)"/>

                    <event value="29"
                          level="win:Verbose"
                          template="Comms_BtsCli_hexint"
                          keywords="BtsCli"
                          symbol="Comms_BtsCli_Request_Destroyed"
                          message="$(string.Publisher.Comms_BtsCli_Request_Destroyed)"/>

                    <event value="30"
                          level="win:Verbose"
                          template="Comms_BtsCli_hexint"
                          keywords="BtsCli"
                          symbol="Comms_BtsCli_Notify_Destroyed"
                          message="$(string.Publisher.Comms_BtsCli_Notify_Destroyed)"/>                          
                   
                </events>

            </provider>

        </events>

    </instrumentation>

    <localization>
        <resources culture="en-US">
            <stringTable>
                <!--This is how event data can be used as part of Message String -->

                <string id="Keyword.Error" value="Error" />
                <string id="Keyword.Performance" value="Performance" />

                <string id="Event.CommsErrorOriginateMessage"
                    value="Error: %1 Location: %2 Line Number: %3"/>    
                <string id="Event.CommsPropagateErrorMessage"
                    value="Error Propagated: %1 Location: %2 Line Number: %3"/>


              <!-- BTS Client -->             

                <string id="Publisher.Comms_BtsCli_Request_Created"
                    value="Request %1 created."/>

                <string id="Publisher.Comms_BtsCli_Request_Closed"
                    value="Request %1 closed."/>

                <string id="Publisher.Comms_BtsCli_Creating_File"
                    value="Request %1, file %2."/>

                <string id="Publisher.Comms_BtsCli_Notify_Callback"
                    value="Notify callback %1, flags %2."/>

                <string id="Publisher.Comms_BtsCli_Notify_Cleanup"
                    value="Notify cleanup %1, flags %2."/>

                <string id="Publisher.Comms_BtsCli_Notify_Canceled"
                    value="Notify canceled %1."/>

                <string id="Publisher.Comms_BtsCli_Notify_Created"
                    value="Notify created, request %1, notify %2."/>

                <string id="Publisher.Comms_BtsCli_Pause_Notification"
                    value="Taskhost pause notification."/>

                <string id="Publisher.Comms_BtsCli_Resume_Notification"
                    value="Taskhost resume notification."/>

                <string id="Publisher.Comms_BtsCli_Request_Destroyed"
                    value="Request %1 destroyed."/>

                <string id="Publisher.Comms_BtsCli_Notify_Destroyed"
                    value="Notify %1 destroyed."/>

            </stringTable>
        </resources>
    </localization>
</instrumentationManifest>

