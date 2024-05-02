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
            <provider name="Microsoft-WindowsPhone-Comms-BackgroundTransferService"
                guid="{c80a2212-526f-4b48-b6b4-6dd27b01f322}"
                symbol="WM_COMMS_BTS_PUBLISHER"
                resourceFileName="btserv.dll"
                messageFileName="btserv.dll">

                <!--Event Templates -->
                <templates>

                  <!--Event Template defined for Comms Logging -->
                    <template tid="CommsHrTemplate">
                        <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
                        <data name="P2_String" inType="win:AnsiString"/>
                        <data name="P3_UInt32" inType="win:UInt32"/>
                    </template>

                
                   <!-- BtServ templates. These should be organize by argument types -->
                    <template tid="Comms_BtServ_noargs">
                        <UserData>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_uint">
                        <data name="Prop_UINT_1" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_UINT_1> %1 </Prop_UINT_1>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_hexint">
                        <data name="Prop_HEXINT_1" inType="win:HexInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_HEXINT_1> %1 </Prop_HEXINT_1>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_hexint64_uint">
                        <data name="Prop_HEXINT_1" inType="win:HexInt64" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_HEXINT_1> %1 </Prop_HEXINT_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_hexint_uint_uint">
                        <data name="Prop_HEXINT_1" inType="win:HexInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_HEXINT_1> %1 </Prop_HEXINT_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                                <Prop_UINT_3> %3 </Prop_UINT_3>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_hexint_uint_uint_uint">
                        <data name="Prop_HEXINT_1" inType="win:HexInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_UINT_4" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_HEXINT_1> %1 </Prop_HEXINT_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                                <Prop_UINT_3> %3 </Prop_UINT_3>
                                <Prop_UINT_4> %4 </Prop_UINT_4>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_uint_uint">
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_UINT_1> %1 </Prop_UINT_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_uint_uint_uint">
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_UINT_1> %1 </Prop_UINT_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                                <Prop_UINT_3> %3 </Prop_UINT_3>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_uint_uint_uint_uint">
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_UINT_4" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_UINT_1> %1 </Prop_UINT_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                                <Prop_UINT_3> %3 </Prop_UINT_3>
                                <Prop_UINT_4> %4 </Prop_UINT_4>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_uint_uint_uint_uint_uint">
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_UINT_4" inType="win:UInt32" />
                        <data name="Prop_UINT_5" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_UINT_1> %1 </Prop_UINT_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                                <Prop_UINT_3> %3 </Prop_UINT_3>
                                <Prop_UINT_4> %4 </Prop_UINT_4>
                                <Prop_UINT_5> %5 </Prop_UINT_5>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_uint_uint_uint_uint_uint_uint">
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_UINT_4" inType="win:UInt32" />
                        <data name="Prop_UINT_5" inType="win:UInt32" />
                        <data name="Prop_UINT_6" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_UINT_1> %1 </Prop_UINT_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                                <Prop_UINT_3> %3 </Prop_UINT_3>
                                <Prop_UINT_4> %4 </Prop_UINT_4>
                                <Prop_UINT_5> %5 </Prop_UINT_5>
                                <Prop_UINT_6> %6 </Prop_UINT_6>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_uint_uint_uint_uint_uint_uint_uint">
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_UINT_4" inType="win:UInt32" />
                        <data name="Prop_UINT_5" inType="win:UInt32" />
                        <data name="Prop_UINT_6" inType="win:UInt32" />
                        <data name="Prop_UINT_7" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_UINT_1> %1 </Prop_UINT_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                                <Prop_UINT_3> %3 </Prop_UINT_3>
                                <Prop_UINT_4> %4 </Prop_UINT_4>
                                <Prop_UINT_5> %5 </Prop_UINT_5>
                                <Prop_UINT_6> %6 </Prop_UINT_6>
                                <Prop_UINT_7> %7 </Prop_UINT_7>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string">
                        <data name="Prop_String" inType="win:UnicodeString" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_uint">
                        <data name="Prop_String" inType="win:UnicodeString" />
                        <data name="Prop_UINT_1" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                                <Prop_UINT_1> %2 </Prop_UINT_1>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_hexint">
                        <data name="Prop_String" inType="win:UnicodeString" />
                        <data name="Prop_HEXINT_1" inType="win:HexInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                                <Prop_HEXINT_1> %2 </Prop_HEXINT_1>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_uint_uint">
                        <data name="Prop_String" inType="win:UnicodeString" />
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                                <Prop_UINT_1> %2 </Prop_UINT_1>
                                <Prop_UINT_2> %3 </Prop_UINT_2>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_uint_hexint">
                        <data name="Prop_String" inType="win:UnicodeString" />
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_HEXINT_2" inType="win:HexInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                                <Prop_UINT_1> %2 </Prop_UINT_1>
                                <Prop_HEXINT_2> %3 </Prop_HEXINT_2>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_uint_uint_uint">
                        <data name="Prop_String" inType="win:UnicodeString" />
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                                <Prop_UINT_1> %2 </Prop_UINT_1>
                                <Prop_UINT_2> %3 </Prop_UINT_2>
                                <Prop_UINT_3> %4 </Prop_UINT_3>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_hexint_uint">
                        <data name="Prop_String" inType="win:UnicodeString" />
                        <data name="Prop_HEXINT_1" inType="win:HexInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                                <Prop_HEXINT_1> %2 </Prop_HEXINT_1>
                                <Prop_UINT_2> %3 </Prop_UINT_2>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_hexint_uint_uint">
                        <data name="Prop_String" inType="win:UnicodeString" />
                        <data name="Prop_HEXINT_1" inType="win:HexInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                                <Prop_HEXINT_1> %2 </Prop_HEXINT_1>
                                <Prop_UINT_2> %3 </Prop_UINT_2>
                                <Prop_UINT_3> %4 </Prop_UINT_3>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_hexint_uint_uint_hexint_uint_guid_uint_guid_uint">
                        <data name="Prop_String" inType="win:UnicodeString" />
                        <data name="Prop_HEXINT_1" inType="win:HexInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_HEXINT_4" inType="win:HexInt32" />
                        <data name="Prop_UINT_5" inType="win:UInt32" />
                        <data name="Prop_GUID_6" inType="win:GUID" />
                        <data name="Prop_UINT_7" inType="win:UInt32" />
                        <data name="Prop_GUID_8" inType="win:GUID" />
                        <data name="Prop_UINT_9" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                                <Prop_HEXINT_1> %2 </Prop_HEXINT_1>
                                <Prop_UINT_2> %3 </Prop_UINT_2>
                                <Prop_UINT_3> %4 </Prop_UINT_3>
                                <Prop_HEXINT_4> %5 </Prop_HEXINT_4>
                                <Prop_UINT_5> %6 </Prop_UINT_5>
                                <Prop_GUID_6> %7 </Prop_GUID_6>
                                <Prop_UINT_7> %8 </Prop_UINT_7>
                                <Prop_GUID_8> %9 </Prop_GUID_8>
                                <Prop_UINT_9> %10 </Prop_UINT_9>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_hexint_uint_uint_uint">
                        <data name="Prop_String" inType="win:UnicodeString" />
                        <data name="Prop_HEXINT_1" inType="win:HexInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_UINT_4" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                                <Prop_HEXINT_1> %2 </Prop_HEXINT_1>
                                <Prop_UINT_2> %3 </Prop_UINT_2>
                                <Prop_UINT_3> %4 </Prop_UINT_3>
                                <Prop_UINT_4> %5 </Prop_UINT_4>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_hexint_hexint_uint">
                        <data name="Prop_String" inType="win:UnicodeString" />
                        <data name="Prop_HEXINT_1" inType="win:HexInt32" />
                        <data name="Prop_HEXINT_2" inType="win:HexInt32" />
                        <data name="Prop_UINT_1" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                                <Prop_HEXINT_1> %2 </Prop_HEXINT_1>
                                <Prop_HEXINT_2> %3 </Prop_HEXINT_2>
                                <Prop_UINT_1> %4 </Prop_UINT_1>
                            </printfTrace>
                        </UserData>
                    </template>
                    
                    <template tid="Comms_BtServ_string_uint_uint_uint_uint">
                        <data name="Prop_String" inType="win:UnicodeString" />
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_UINT_4" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String> %1 </Prop_String>
                                <Prop_UINT_1> %2 </Prop_UINT_1>
                                <Prop_UINT_2> %3 </Prop_UINT_2>
                                <Prop_UINT_3> %4 </Prop_UINT_3>
                                <Prop_UINT_4> %5 </Prop_UINT_4>
                            </printfTrace>
                        </UserData>
                    </template>
                  
                    <template tid="Comms_BtServ_string_string_uint_uint_uint">
                        <data name="Prop_String_1" inType="win:UnicodeString" />
                        <data name="Prop_String_2" inType="win:UnicodeString" />
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String_1> %1 </Prop_String_1>
                                <Prop_String_2> %2 </Prop_String_2>
                                <Prop_UINT_1> %3 </Prop_UINT_1>
                                <Prop_UINT_2> %4 </Prop_UINT_2>
                                <Prop_UINT_3> %5 </Prop_UINT_3>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_string_uint_uint_uint_hexint64">
                        <data name="Prop_String_1" inType="win:UnicodeString" />
                        <data name="Prop_String_2" inType="win:UnicodeString" />
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_HEXINT_1" inType="win:HexInt64" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String_1> %1 </Prop_String_1>
                                <Prop_String_2> %2 </Prop_String_2>
                                <Prop_UINT_1> %3 </Prop_UINT_1>
                                <Prop_UINT_2> %4 </Prop_UINT_2>
                                <Prop_UINT_3> %5 </Prop_UINT_3>
                                <Prop_HEXINT_1> %6 </Prop_HEXINT_1>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_string_string_string_uint_uint_uint_uint">
                        <data name="Prop_String_1" inType="win:UnicodeString" />
                        <data name="Prop_String_2" inType="win:UnicodeString" />
                        <data name="Prop_String_3" inType="win:UnicodeString" />
                        <data name="Prop_String_4" inType="win:UnicodeString" />
                        <data name="Prop_UINT_1" inType="win:UInt32" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_UINT_4" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String_1> %1 </Prop_String_1>
                                <Prop_String_2> %2 </Prop_String_2>
                                <Prop_String_3> %3 </Prop_String_3>
                                <Prop_String_4> %4 </Prop_String_4>
                                <Prop_UINT_1> %5 </Prop_UINT_1>
                                <Prop_UINT_2> %6 </Prop_UINT_2>
                                <Prop_UINT_3> %7 </Prop_UINT_3>
                                <Prop_UINT_4> %8 </Prop_UINT_4>                                
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_string_uint">
                        <data name="Prop_String_1" inType="win:UnicodeString" />
                        <data name="Prop_String_2" inType="win:UnicodeString" />
                        <data name="Prop_UINT_1" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String_1> %1 </Prop_String_1>
                                <Prop_String_2> %2 </Prop_String_2>
                                <Prop_UINT_1> %3 </Prop_UINT_1>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_string_string">
                        <data name="Prop_String_1" inType="win:UnicodeString" />
                        <data name="Prop_String_2" inType="win:UnicodeString" />
                        <data name="Prop_String_3" inType="win:UnicodeString" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String_1> %1 </Prop_String_1>
                                <Prop_String_2> %2 </Prop_String_2>
                                <Prop_String_3> %3 </Prop_String_3>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_uint_uint_uint_uint_uint">
                        <data name="Prop_String_1" inType="win:UnicodeString" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_UINT_4" inType="win:UInt32" />
                        <data name="Prop_UINT_5" inType="win:UInt32" />
                        <data name="Prop_UINT_6" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String_1> %1 </Prop_String_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                                <Prop_UINT_3> %3 </Prop_UINT_3>
                                <Prop_UINT_4> %4 </Prop_UINT_4>
                                <Prop_UINT_5> %5 </Prop_UINT_5>
                                <Prop_UINT_6> %6 </Prop_UINT_6>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_uint_uint_uint_uint_uint_uint">
                        <data name="Prop_String_1" inType="win:UnicodeString" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_UINT_4" inType="win:UInt32" />
                        <data name="Prop_UINT_5" inType="win:UInt32" />
                        <data name="Prop_UINT_6" inType="win:UInt32" />
                        <data name="Prop_UINT_7" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String_1> %1 </Prop_String_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                                <Prop_UINT_3> %3 </Prop_UINT_3>
                                <Prop_UINT_4> %4 </Prop_UINT_4>
                                <Prop_UINT_5> %5 </Prop_UINT_5>
                                <Prop_UINT_6> %6 </Prop_UINT_6>
                                <Prop_UINT_7> %7 </Prop_UINT_7>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_string_uint_uint_uint_hexint_uint_hexint_uint">
                        <data name="Prop_String_1" inType="win:UnicodeString" />
                        <data name="Prop_UINT_2" inType="win:UInt32" />
                        <data name="Prop_UINT_3" inType="win:UInt32" />
                        <data name="Prop_UINT_4" inType="win:UInt32" />
                        <data name="Prop_HEXINT_5" inType="win:HexInt32" />
                        <data name="Prop_UINT_6" inType="win:UInt32" />
                        <data name="Prop_HEXINT_7" inType="win:HexInt32" />
                        <data name="Prop_UINT_8" inType="win:UInt32" />

                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_String_1> %1 </Prop_String_1>
                                <Prop_UINT_2> %2 </Prop_UINT_2>
                                <Prop_UINT_3> %3 </Prop_UINT_3>
                                <Prop_UINT_4> %4 </Prop_UINT_4>
                                <Prop_HEXINT_5> %5 </Prop_HEXINT_5>
                                <Prop_UINT_6> %6 </Prop_UINT_6>
                                <Prop_HEXINT_7> %7 </Prop_HEXINT_7>
                                <Prop_UINT_8> %8 </Prop_UINT_8>
                            </printfTrace>
                        </UserData>
                    </template>

                    <template tid="Comms_BtServ_guid">
                        <data name="Prop_GUID_1" inType="win:GUID" />
                        <UserData>
                            <printfTrace xmlns="BtServ">
                                <Prop_GUID_1> %1 </Prop_GUID_1>
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
                  <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)"/>
                  <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)"/>

                  <!-- Provider-specific keywords -->
                  <keyword mask="0x0000000000000004" name="BtServ" message="$(string.Keyword.BtServ)"/>
                  <keyword mask="0x0000000000000008" name="BtsHttp" message="$(string.Keyword.BtsHttp)"/>

                  <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
                  <keyword mask="0x0000400000000000" name="Warning" message="$(string.Keyword.Warning)"/>
                </keywords>

                <events>

                    <!-- Standardized Errors, Warning, and Info Events -->

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

                  <!--  BTS Events -->

                    <event value="7"
                          level="win:Informational"
                          template="Comms_BtServ_noargs"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Started"
                          message="$(string.Publisher.Comms_BtServ_Started)"/>

                    <event value="8"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_hexint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_State_Change"
                          message="$(string.Publisher.Comms_BtServ_State_Change)"/>

                    <event value="9"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Transfer_Complete"
                          message="$(string.Publisher.Comms_BtServ_Transfer_Complete)"/>

                    <event value="10"
                          level="win:Informational"
                          template="Comms_BtServ_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Power_Notification"
                          message="$(string.Publisher.Comms_BtServ_Power_Notification)"/>

                    <event value="11"
                          level="win:Informational"
                          template="Comms_BtServ_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Connectivity_Notification"
                          message="$(string.Publisher.Comms_BtServ_Connectivity_Notification)"/>

                    <event value="12"
                          level="win:Informational"
                          template="Comms_BtServ_string"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Retry_Callback"
                          message="$(string.Publisher.Comms_BtServ_Retry_Callback)"/>

                    <event value="13"
                          level="win:Informational"
                          template="Comms_BtServ_uint_uint_uint_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Initial_Settings"
                          message="$(string.Publisher.Comms_BtServ_Initial_Settings)"/>

                    <event value="14"
                          level="win:Informational"
                          template="Comms_BtServ_string"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Request_Persisted"
                          message="$(string.Publisher.Comms_BtServ_Request_Persisted)"/>

                    <event value="15"
                          level="win:Informational"
                          template="Comms_BtServ_string"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Request_Deleted"
                          message="$(string.Publisher.Comms_BtServ_Request_Deleted)"/>

                    <event value="16"
                          level="win:Error"
                          template="Comms_BtServ_string_uint"
                          keywords="Error BtServ"
                          symbol="Comms_BtServ_Request_Limit_Reached"
                          message="$(string.Publisher.Comms_BtServ_Request_Limit_Reached)"/>

                    <event value="17"
                          level="win:Error"
                          template="Comms_BtServ_string_uint"
                          keywords="Error BtServ"
                          symbol="Comms_BtServ_Request_Create_Failed"
                          message="$(string.Publisher.Comms_BtServ_Request_Create_Failed)"/>

                    <event value="18"
                          level="win:Informational"
                          template="Comms_BtServ_string_string_string_string_uint_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Request_Enqueue"
                          message="$(string.Publisher.Comms_BtServ_Request_Enqueue)"/>

                    <event value="19"
                          level="win:Informational"
                          template="Comms_BtServ_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Boot_Start"
                          message="$(string.Publisher.Comms_BtServ_Boot_Start)"/>

                    <event value="20"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Read_From_Store_1"
                          message="$(string.Publisher.Comms_BtServ_Read_From_Store_1)"/>

                    <event value="21"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Read_From_Store_2"
                          message="$(string.Publisher.Comms_BtServ_Read_From_Store_2)"/>

                    <event value="22"
                          level="win:Informational"
                          template="Comms_BtServ_uint_uint_uint_uint_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Initial_Settings_2"
                          message="$(string.Publisher.Comms_BtServ_Initial_Settings_2)"/>

                    <event value="23"
                          level="win:Informational"
                          template="Comms_BtServ_noargs"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Stopped"
                          message="$(string.Publisher.Comms_BtServ_Stopped)"/>

                    <event value="24"
                          level="win:Informational"
                          template="Comms_BtServ_string_string_uint_uint_uint_hexint64"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Create_Params"
                          message="$(string.Publisher.Comms_BtServ_Create_Params)"/>

                    <event value="25"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Create_Success"
                          message="$(string.Publisher.Comms_BtServ_Create_Success)"/>

                    <event value="26"
                          level="win:Informational"
                          template="Comms_BtServ_noargs"
                          keywords="BtServ"
                          symbol="Comms_BtServ_AsyncInit_Success"
                          message="$(string.Publisher.Comms_BtServ_AsyncInit_Success)"/>

                    <event value="27"
                          level="win:Informational"
                          template="Comms_BtServ_string"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Request_Canceled"
                          message="$(string.Publisher.Comms_BtServ_Request_Canceled)"/>

                    <event value="28"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Request_Pausing"
                          message="$(string.Publisher.Comms_BtServ_Request_Pausing)"/>

                    <event value="29"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Request_Paused"
                          message="$(string.Publisher.Comms_BtServ_Request_Paused)"/>

                    <event value="30"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Request_Resuming"
                          message="$(string.Publisher.Comms_BtServ_Request_Resuming)"/>

                    <event value="31"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Request_Resumed"
                          message="$(string.Publisher.Comms_BtServ_Request_Resumed)"/>

                    <event value="32"
                          level="win:Informational"
                          template="Comms_BtServ_string_string_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_UploadFile_Copied"
                          message="$(string.Publisher.Comms_BtServ_UploadFile_Copied)"/>

                    <event value="33"
                          level="win:Informational"
                          template="Comms_BtServ_string"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Request_NoConnectivity_Limit"
                          message="$(string.Publisher.Comms_BtServ_Request_NoConnectivity_Limit)"/>

                    <event value="34"
                          level="win:Informational"
                          template="Comms_BtServ_string_string_string"
                          keywords="BtServ"
                          symbol="Comms_BtServ_MoveFile_To_Store"
                          message="$(string.Publisher.Comms_BtServ_MoveFile_To_Store)"/>

                    <event value="35"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Schedule_Retry"
                          message="$(string.Publisher.Comms_BtServ_Schedule_Retry)"/>

                    <event value="36"
                          level="win:Informational"
                          template="Comms_BtServ_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Power_Callback"
                          message="$(string.Publisher.Comms_BtServ_Power_Callback)"/>

                    <event value="37"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint_uint_hexint_uint_hexint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Update_Status"
                          message="$(string.Publisher.Comms_BtServ_Update_Status)"/>

                    <event value="38"
                          level="win:Informational"
                          template="Comms_BtServ_string_hexint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Send_Notification"
                          message="$(string.Publisher.Comms_BtServ_Send_Notification)"/>

                    <event value="39"
                          level="win:Informational"
                          template="Comms_BtServ_string_hexint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Register_Notification"
                          message="$(string.Publisher.Comms_BtServ_Register_Notification)"/>

                    <event value="40"
                          level="win:Informational"
                          template="Comms_BtServ_string_hexint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Leave_Notification"
                          message="$(string.Publisher.Comms_BtServ_Leave_Notification)"/>

                    <event value="41"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint_uint_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Pending_Abort_Notification"
                          message="$(string.Publisher.Comms_BtServ_Pending_Abort_Notification)"/>

                    <event value="42"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Abort_Notification"
                          message="$(string.Publisher.Comms_BtServ_Abort_Notification)"/>

                    <event value="43"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Send_Notification2"
                          message="$(string.Publisher.Comms_BtServ_Send_Notification2)"/>

                    <event value="44"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Notify_Aim_Create"
                          message="$(string.Publisher.Comms_BtServ_Notify_Aim_Create)"/>

                    <event value="45"
                          level="win:Informational"
                          template="Comms_BtServ_string"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Notify_Aim_Complete"
                          message="$(string.Publisher.Comms_BtServ_Notify_Aim_Complete)"/>

                    <event value="46"
                          level="win:Verbose"
                          template="Comms_BtServ_string"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Request_Destroyed"
                          message="$(string.Publisher.Comms_BtServ_Request_Destroyed)"/>

                    <event value="47"
                          level="win:Verbose"
                          template="Comms_BtServ_string"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Retry_Callback_Destroyed"
                          message="$(string.Publisher.Comms_BtServ_Retry_Callback_Destroyed)"/>

                    <event value="48"
                          level="win:Informational"
                          template="Comms_BtServ_string_uint_uint_uint_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Power_Condition"
                          message="$(string.Publisher.Comms_BtServ_Power_Condition)"/>

                    <event value="49"
                          level="win:Verbose"
                          template="Comms_BtServ_hexint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_TaskEvent_Destroyed"
                          message="$(string.Publisher.Comms_BtServ_TaskEvent_Destroyed)"/>

                    <event value="50"
                          level="win:Verbose"
                          template="Comms_BtServ_hexint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_TaskEvent_Created"
                          message="$(string.Publisher.Comms_BtServ_TaskEvent_Created)"/>

                    <event value="51"
                          level="win:Informational"
                          template="Comms_BtServ_hexint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_SelfStop_Initialized"
                          message="$(string.Publisher.Comms_BtServ_SelfStop_Initialized)"/>

                    <event value="52"
                          level="win:Informational"
                          template="Comms_BtServ_noargs"
                          keywords="BtServ"
                          symbol="Comms_BtServ_SelfStop_Running"
                          message="$(string.Publisher.Comms_BtServ_SelfStop_Running)"/>

                    <event value="53"
                          level="win:Informational"
                          template="Comms_BtServ_noargs"
                          keywords="BtServ"
                          symbol="Comms_BtServ_SelfStop_Terminated"
                          message="$(string.Publisher.Comms_BtServ_SelfStop_Terminated)"/>

                    <event value="54"
                          level="win:Informational"
                          template="Comms_BtServ_noargs"
                          keywords="BtServ"
                          symbol="Comms_BtServ_External_Stop"
                          message="$(string.Publisher.Comms_BtServ_External_Stop)"/>

                    <event value="55"
                          level="win:Informational"
                          template="Comms_BtServ_hexint64_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Read_From_Store_3"
                          message="$(string.Publisher.Comms_BtServ_Read_From_Store_3)"/>

                    <event value="56"
                          level="win:Informational"
                          template="Comms_BtServ_guid"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Foreground_ProductId"
                          message="$(string.Publisher.Comms_BtServ_Foreground_ProductId)"/>

                    <event value="57"
                          level="win:Informational"
                          template="Comms_BtServ_uint"
                          keywords="BtServ"
                          symbol="Comms_BtServ_Initial_Settings_3"
                          message="$(string.Publisher.Comms_BtServ_Initial_Settings_3)"/>

                    <event value="58"
                          level="win:Informational"
                          template="Comms_BtServ_noargs"
                          keywords="BtServ"
                          symbol="Comms_BtServ_SelfStop_Deleting_Schedule"
                          message="$(string.Publisher.Comms_BtServ_SelfStop_Deleting_Schedule)"/>

                    <event value="59"
                          level="win:Informational"
                          template="Comms_BtServ_noargs"
                          keywords="BtServ"
                          symbol="Comms_BtServ_SelfStop_Deleted_Schedule"
                          message="$(string.Publisher.Comms_BtServ_SelfStop_Deleted_Schedule)"/>

                    <!--  BTS HTTP provider Events -->

                    <event value="101"
                          level="win:Informational"
                          template="Comms_BtServ_string_hexint_uint_uint"
                          keywords="BtsHttp"
                          symbol="Comms_BtsHttp_Progress_Callback"
                          message="$(string.Publisher.BtsHttp_Progress_Callback)"/>

                    <event value="102"
                          level="win:Informational"
                          template="Comms_BtServ_string_hexint_hexint_uint"
                          keywords="BtsHttp"
                          symbol="Comms_BtsHttp_Complete_Callback"
                          message="$(string.Publisher.BtsHttp_Complete_Callback)"/>

                    <event value="103"
                          level="win:Informational"
                          template="Comms_BtServ_string_hexint_uint"
                          keywords="BtsHttp"
                          symbol="Comms_BtsHttp_Notify_Callback"
                          message="$(string.Publisher.BtsHttp_Notify_Callback)"/>

                    <event value="104"
                          level="win:Informational"
                          template="Comms_BtServ_string_hexint_uint_uint_uint"
                          keywords="BtsHttp"
                          symbol="Comms_BtsHttp_Transfer_Canceled"
                          message="$(string.Publisher.BtsHttp_Transfer_Canceled)"/>

                    <event value="105"
                          level="win:Informational"
                          template="Comms_BtServ_string_hexint_uint_uint_hexint_uint_guid_uint_guid_uint"
                          keywords="BtsHttp"
                          symbol="Comms_BtsHttp_Transfer_Enqueue"
                          message="$(string.Publisher.Comms_BtsHttp_Transfer_Enqueue)"/>

                    <event value="106"
                          level="win:Warning"
                          template="Comms_BtServ_string_hexint"
                          keywords="BtsHttp Warning"
                          symbol="Comms_BtsHttp_Zero_Total_Bytes"
                          message="$(string.Publisher.Comms_BtsHttp_Zero_Total_Bytes)"/>

                    <event value="107"
                          level="win:Informational"
                          template="Comms_BtServ_hexint"
                          keywords="BtsHttp"
                          symbol="Comms_BtsHttp_Transfer_Canceled_2"
                          message="$(string.Publisher.Comms_BtsHttp_Transfer_Canceled_2)"/>

                    <event value="108"
                          level="win:Informational"
                          template="Comms_BtServ_hexint_uint_uint_uint"
                          keywords="BtsHttp"
                          symbol="Comms_BtsHttp_Transient_Error"
                          message="$(string.Publisher.Comms_BtsHttp_Transient_Error)"/>

                    <event value="109"
                          level="win:Verbose"
                          template="Comms_BtServ_string"
                          keywords="BtsHttp"
                          symbol="Comms_BtsHttp_EDM_Context_Destroyed"
                          message="$(string.Publisher.Comms_BtsHttp_EDM_Context_Destroyed)"/>

                    <event value="110"
                          level="win:Informational"
                          template="Comms_BtServ_uint"
                          keywords="BtsHttp"
                          symbol="Comms_BtsHttp_Waiting_For_Transfers"
                          message="$(string.Publisher.Comms_BtsHttp_Waiting_For_Transfers)"/>

                    <event value="111"
                          level="win:Informational"
                          template="Comms_BtServ_string"
                          keywords="BtsHttp"
                          symbol="Comms_BtsHttp_Removed_Cache_File"
                          message="$(string.Publisher.Comms_BtsHttp_Removed_Cache_File)"/>

                    <event value="112"
                          level="win:Informational"
                          template="Comms_BtServ_hexint_uint_uint"
                          keywords="BtsHttp"
                          symbol="Comms_BtsHttp_Update_Policy"
                          message="$(string.Publisher.Comms_BtsHttp_Update_Policy)"/>
                          
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
                <string id="Keyword.BtServ" value="BtServ" />
                <string id="Keyword.BtsHttp" value="BtsHttp" />
                <string id="Keyword.Warning" value="Warning" />

                <string id="Event.CommsErrorOriginateMessage"
                    value="Error: %1 Location: %2 Line Number: %3"/>    

                <string id="Event.CommsPropagateErrorMessage"
                    value="Error Propagated: %1 Location: %2 Line Number: %3"/>

              <!-- BtServ -->             
                <string id="Publisher.Comms_BtServ_Started"
                    value="Background Transfer Service started successfully."/>

                <string id="Publisher.Comms_BtServ_State_Change"
                    value="The state of request %1 is %2, status %3."/>

                <string id="Publisher.Comms_BtServ_Transfer_Complete"
                    value="The transfer of request %1 is complete. Total bytes %2, result %3, provider status %4."/>

                <string id="Publisher.Comms_BtServ_Power_Notification"
                    value="Power state %1."/>

                <string id="Publisher.Comms_BtServ_Connectivity_Notification"
                    value="Connectivity state %1."/>

                <string id="Publisher.Comms_BtServ_Retry_Callback"
                    value="Retry callback for request %1."/>

                <string id="Publisher.Comms_BtServ_Initial_Settings"
                    value="Initial settings, max requests inrom %1, total requests inrom %2, retries %3, delay %4, upload size %5, min progress %6."/>

                <string id="Publisher.Comms_BtServ_Request_Persisted"
                    value="Request %1 persisted in store."/>

                <string id="Publisher.Comms_BtServ_Request_Deleted"
                    value="Request %1 deleted from store."/>

                <string id="Publisher.Comms_BtServ_Request_Limit_Reached"
                    value="Request %1 rejected due to limit excess, status %2."/>

                <string id="Publisher.Comms_BtServ_Request_Create_Failed"
                    value="Request %1 creation failed with status %2."/>

                <string id="Publisher.Comms_BtServ_Request_Enqueue"
                    value="Request %1 enqueue, URI %2, file %3, upload %4, verb %5, flags %6, state %7, DPU %8."/>

                <string id="Publisher.Comms_BtServ_Boot_Start"
                    value="Setting boot start to %1."/>

                <string id="Publisher.Comms_BtServ_Read_From_Store_1"
                    value="From store: Request %1, state %2, total bytes %3, current bytes %4."/>

                <string id="Publisher.Comms_BtServ_Read_From_Store_2"
                    value="From store: Request %1, http %2, status %3, retries %4, upload %5."/>

                <string id="Publisher.Comms_BtServ_Initial_Settings_2"
                    value="Max requests 3rd party %1, total requests 3rd party %2, no connectivity retries %3, non AC transfer size %4/%5, disable selfstop %6, upload size AC/WIFI %7."/>

                <string id="Publisher.Comms_BtServ_Stopped"
                    value="Background Transfer Service stopped successfully."/>

                <string id="Publisher.Comms_BtServ_Create_Params"
                    value="Request %1 create, caller SID %2, caller PID %3, creation disp %4, task ID %5, WNF request state name %6."/>

                <string id="Publisher.Comms_BtServ_Create_Success"
                    value="Request %1 create, requests %2, total requests %3."/>

                <string id="Publisher.Comms_BtServ_AsyncInit_Success"
                    value="Background Transfer Service async initialize done."/>

                <string id="Publisher.Comms_BtServ_Request_Canceled"
                    value="Request %1 canceled successfully."/>

                <string id="Publisher.Comms_BtServ_Request_Pausing"
                    value="Request %1 pause attempt, state %2, external %3, charging %4, level %5."/>

                <string id="Publisher.Comms_BtServ_Request_Paused"
                    value="Request %1 paused, state %2, status %3."/>

                <string id="Publisher.Comms_BtServ_Request_Resuming"
                    value="Request %1 resume attempt, state %2, request state %3, charging %4, level %5, reason %6."/>

                <string id="Publisher.Comms_BtServ_Request_Resumed"
                    value="Request %1 resumed, state %2."/>

                <string id="Publisher.Comms_BtServ_UploadFile_Copied"
                    value="Request %1, upload file %2, size %3 copied."/>

                <string id="Publisher.Comms_BtServ_Request_NoConnectivity_Limit"
                    value="Request %1 no connectivity retry limit, backoff retry."/>

                <string id="Publisher.Comms_BtServ_MoveFile_To_Store"
                    value="Request %1, file %2, token %3."/>

                <string id="Publisher.Comms_BtServ_Schedule_Retry"
                    value="Request %1 schedule retry, interval %2, total %3, flags %4."/>

                <string id="Publisher.Comms_BtServ_Power_Callback"
                    value="Power callback state %1, old level %2, old charging state %3."/>

                <string id="Publisher.Comms_BtServ_Update_Status"
                    value="Request %1, state %2, curBytes %3, totalBytes %4, hr %5, http %6, EDM %7, uploading %8."/>

                <string id="Publisher.Comms_BtServ_Send_Notification"
                    value="Sending notification for request %1, async %2."/>

                <string id="Publisher.Comms_BtServ_Register_Notification"
                    value="Registering notification for request %1, async %2."/>

                <string id="Publisher.Comms_BtServ_Leave_Notification"
                    value="Client leave notification for request %1, async %2."/>

                <string id="Publisher.Comms_BtServ_Pending_Abort_Notification"
                    value="Pending abort notification for request %1, async %2, hr %3, cancel %4, disconnect %5, mustabort %6, flags %7."/>

                <string id="Publisher.Comms_BtServ_Abort_Notification"
                    value="Abort notification for request %1, async %2, hr %3, cancel %4, disconnect %5, flags %6."/>

                <string id="Publisher.Comms_BtServ_Send_Notification2"
                    value="Sending notification for request %1, async %2, hr %3, cancel %4, disconnect %5, mustabort %6."/>

                <string id="Publisher.Comms_BtServ_Notify_Aim_Create"
                    value="Notified AIM of request %1 create, app disabled %2, caller PID %3."/>

                <string id="Publisher.Comms_BtServ_Notify_Aim_Complete"
                    value="Notified AIM of request %1 complete."/>

                <string id="Publisher.Comms_BtServ_Request_Destroyed"
                    value="Request %1 destroyed."/>

                <string id="Publisher.Comms_BtServ_Retry_Callback_Destroyed"
                    value="Retry callback for request %1 destroyed."/>

                <string id="Publisher.Comms_BtServ_Power_Condition"
                    value="Request %1, power condition %2, flags %3, charging %4, level %5."/>

                <string id="Publisher.Comms_BtServ_TaskEvent_Destroyed"
                    value="Task event object %1 destroyed."/>

                <string id="Publisher.Comms_BtServ_TaskEvent_Created"
                    value="Task event object %1 created."/>

                <string id="Publisher.Comms_BtServ_SelfStop_Initialized"
                    value="Service self stop set to fire after %1 secs."/>

                <string id="Publisher.Comms_BtServ_SelfStop_Running"
                    value="Service self stop executed."/>

                <string id="Publisher.Comms_BtServ_SelfStop_Terminated"
                    value="Service self stop terminated."/>

                <string id="Publisher.Comms_BtServ_SelfStop_Deleting_Schedule"
                    value="Service self stop schedule deleting."/>

                <string id="Publisher.Comms_BtServ_SelfStop_Deleted_Schedule"
                    value="Service self stop schedule deleted."/>

                <string id="Publisher.Comms_BtServ_External_Stop"
                    value="External client issued a service stop request."/>

                <string id="Publisher.Comms_BtServ_Read_From_Store_3"
                    value="From store: WNF request state name %1, connection DPU %2."/>

                <string id="Publisher.Comms_BtServ_Foreground_ProductId"
                    value="Foreground product ID from AIM %1."/>

                <string id="Publisher.Comms_BtServ_Initial_Settings_3"
                    value="Selfstop timeout %1 secs."/>
                    
                <!-- BtsHttp -->             
                <string id="Publisher.BtsHttp_Progress_Callback"
                    value="Request %1 progress, download ID %2, total bytes %3, current bytes %4."/>

                <string id="Publisher.BtsHttp_Complete_Callback"
                    value="Request %1 complete, download ID %2, HR %3, http %4."/>

                <string id="Publisher.BtsHttp_Notify_Callback"
                    value="Request %1, download ID %2, notification type %3."/>

                <string id="Publisher.BtsHttp_Transfer_Canceled"
                    value="Request %1 canceled due to size limit, download ID %2, current %3, total %4, limit %5."/>

                <string id="Publisher.Comms_BtsHttp_Transfer_Enqueue"
                    value="Request %1 enqueued to EDM, download ID %2, policy %3, max size %4, flags %5, FG %6, product ID %7, DPU %8, transfer ID %9, tag %10."/>

                <string id="Publisher.Comms_BtsHttp_Zero_Total_Bytes"
                    value="Request %1, download ID %2, zero total bytes from EDM."/>

                <string id="Publisher.Comms_BtsHttp_Transfer_Canceled_2"
                    value="Download ID %1 canceled successfully."/>

                <string id="Publisher.Comms_BtsHttp_Transient_Error"
                    value="HR %1, http %2, transient %3, retry %4."/>

                <string id="Publisher.Comms_BtsHttp_EDM_Context_Destroyed"
                    value="Request %1 EDM context destroyed."/>

                <string id="Publisher.Comms_BtsHttp_Waiting_For_Transfers"
                    value="HTTP provider waiting for %1 transfers to complete."/>

                <string id="Publisher.Comms_BtsHttp_Removed_Cache_File"
                    value="HTTP provider removed cache file for request %1."/>

                <string id="Publisher.Comms_BtsHttp_Update_Policy"
                    value="Update policy with EDM, download ID %1, policy %2, DPU %3."/>
                    
            </stringTable>
        </resources>
    </localization>
</instrumentationManifest>

