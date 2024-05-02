<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<!--
Use of this source code is subject to the terms of the Microsoft
premium shared source license agreement under which you licensed
this source code. If you did not accept the terms of the license
agreement, you are not authorized to use this source code.
For the terms of the license, please see the license agreement
signed by you and Microsoft.
THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
-->
<!-- <?xml version="1.0" encoding="UTF-16"?> -->
<instrumentationManifest
    xmlns="http://schemas.microsoft.com/win/2004/08/events"
    xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    
    <instrumentation>
        <events xmlns="http://schemas.microsoft.com/win/2004/08/events">
            <provider 
                name="Unknown-Classic" 
                guid="{42695762-ea50-497a-9068-5cbbb35e0b95}" 
                symbol="Unknown_Classic" 
                resourceFileName="foo.dll" 
                messageFileName="foo.dll"
                >

                <tasks>
                    <task name="WNF"                         value="1" />
                </tasks>

                <opcodes>
                    <opcode name="PERFINFO_LOG_TYPE_WNF_SUBSCRIBE"    value="32" />
                    <opcode name="PERFINFO_LOG_TYPE_WNF_UNSUBSCRIBE"    value="33" />
                    <opcode name="PERFINFO_LOG_TYPE_WNF_CALLBACK"    value="34" />
                    <opcode name="PERFINFO_LOG_TYPE_WNF_PUBLISH"    value="35" />
                    <opcode name="PERFINFO_LOG_TYPE_WNF_NAME_SUB_RUNDOWN"    value="36" />
                </opcodes>

                <templates>
                    <template tid="SubscribeType">
                        <data name="WNF1" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="WNF2" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="Sub" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="NameSub" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="Callback" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="RefCount" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="DeliveryFlags" inType="win:UInt32" outType="win:HexInt32" />
                    </template>
                    
                    <template tid="CallbackType">
                        <data name="WNF1" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="WNF2" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="Sub" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="NameSub" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="Callback" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="Change" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="DeliveryFlags" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="Return" inType="win:UInt32" outType="win:HexInt32" />
                    </template>
                    
                    <template tid="PublishType">
                        <data name="WNF1" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="WNF2" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="DataLen" inType="win:UInt32" outType="win:HexInt32" />
                    </template>
                    
                    <template tid="RundownType">
                        <data name="WNF1" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="WNF2" inType="win:UInt32" outType="win:HexInt32" />
                        <data name="NameSub" inType="win:UInt32" outType="win:HexInt32" />
                    </template>

                </templates>

        
                <events>
                    <event 
                        value="0"    
                        level="win:LogAlways"
                        template="SubscribeType"
                        symbol="unused0"
                        task="WNF"
                        opcode="PERFINFO_LOG_TYPE_WNF_SUBSCRIBE"
                        message="$(string.Sub)"
                        version="2"
                        />

                    <event 
                        value="1"
                        level="win:LogAlways"
                        template="SubscribeType"
                        symbol="unused1"
                        task="WNF"
                        opcode="PERFINFO_LOG_TYPE_WNF_UNSUBSCRIBE"
                        message="$(string.UnSub)"
                        version="2"
                        />

                    <event 
                        value="2"
                        level="win:LogAlways"
                        template="CallbackType"
                        symbol="unused2"
                        task="WNF"
                        opcode="PERFINFO_LOG_TYPE_WNF_CALLBACK"
                        message="$(string.Callback)"
                        version="2"
                        />

                    <event 
                        value="3"
                        level="win:LogAlways"
                        template="PublishType"
                        symbol="unused3"
                        task="WNF"
                        opcode="PERFINFO_LOG_TYPE_WNF_PUBLISH"
                        message="$(string.Pub)"
                        version="2"
                        />

                    <event
                        value="4"
                        level="win:LogAlways"
                        template="RundownType"
                        symbol="unused4"
                        task="WNF"
                        opcode="PERFINFO_LOG_TYPE_WNF_NAME_SUB_RUNDOWN"
                        message="$(string.NameRundown)"
                        version="2"
                        />


                </events>
            </provider>
        </events>
    </instrumentation>

    <localization>
        <resources culture="en-US">
            <stringTable>
                <string id="Sub" value="Subscription WNF %1 %2 Subscription ptr %3 NameSub ptr %4 Callback ptr %5 Refcount %6 DeliveryFlags %7"/>
                <string id="UnSub" value="Unsubscription WNF %1 %2 Subscription ptr %3 NameSub ptr %4 Callback ptr %5 Refcount %6 DeliveryFlags %7"/>
                <string id="Callback" value="Callback WNF %1 %2 Subscription ptr %3 NameSub ptr %4 Callback ptr %5 Changestamp %6 Return %7"/>
                <string id="Pub" value="Publish WNF %1 %2 DataLength %3"/>
                <string id="NameRundown" value="Name Subscription Rundown WNF %1 %2 NameSub ptr %3"/>

            </stringTable>
        </resources>
    </localization>
</instrumentationManifest>

