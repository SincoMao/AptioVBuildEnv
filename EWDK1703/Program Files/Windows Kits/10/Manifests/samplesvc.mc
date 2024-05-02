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
       <!--Publisher Info -->
       <provider name="Microsoft-WindowsMobile-SampleSvc" 
                    guid="{5E26F568-1BCD-4315-ABB0-0D8F7C4C1D83}" 
                    symbol="MICROSOFT_WINDOWSMOBILE_SAMPLESVC" 
                    resourceFileName="samplesvc.dll" 
                    messageFileName="samplesvc.dll">
    
        <!--Channel to which this Publisher can publish -->
        <channels>
         <channel chid="samplesvcdebug" 
                            name="Microsoft-WindowsMobile-Samplesvc" 
                            type="Debug" 
                            symbol="MICROSOFT_WINDOWSMOBILE_SAMPLESVCDEBUG" 
                            enabled="true"/>
        </channels>
        
        <!--Keywords for TaskModel Name Space, Note: it is 64bit value -->
        <keywords>
            <keyword name="API" mask="0x00000001" />
        </keywords>
    
        <!--Event Templates -->
        <templates>
            <template tid="PIDMessage">
                <data name="PID" inType="win:UInt32" outType="win:HexInt32" />
                <data name="Message" inType="win:UnicodeString" />
                <UserData>
                    <ExecManLogEvent xmlns="em">
                        <PID> %1 </PID>
                        <Message> %2 </Message>
                    </ExecManLogEvent>
                </UserData>
            </template>
            <template tid="FrameworkMessage">
                <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
                <data name="State" inType="win:UInt32" outType="win:HexInt32" />
                <UserData>
                    <ExecManLogEvent xmlns="em">
                        <State> %1 </State>
                        <HRESULT> %2 </HRESULT>
                    </ExecManLogEvent>
                </UserData>
            </template>
            <template tid="AnErrorMsg">
                <data name="Message" inType="win:UnicodeString" />
                <data name="Errocode" inType="win:UInt32" outType="win:HexInt32" />
                <UserData>
                    <ExecManLogEvent xmlns="em">
                        <Message> %1 </Message>
                        <Errocode> %2 </Errocode>
                    </ExecManLogEvent>
                </UserData>
            </template>
            
        </templates>
        
        <!--All the Tasks that can be published by this Publisher -->
        <tasks>
            <task name="SS_PrintRPC" value="1"/>
        </tasks>
    
        <!--Events -->
        <events>
          <event value="1"
                        level="win:Informational"
                        template="PIDMessage"
                        channel="samplesvcdebug"
                        keywords="API"
                        symbol="LogToPrint"
                        task="SS_PrintRPC"
                        opcode="win:Info"
                        message="$(string.SampleSvc.PIDMessage)"/>
                        
          <event value="2"    
                        level="win:Informational"
                        template="FrameworkMessage"
                        channel="samplesvcdebug"
                        keywords="API"
                        symbol="EngineState"
                        task="SS_PrintRPC"
                        opcode="win:Info"
                        message="$(string.SampleSvc.FrameworkMessage)"/>
                
          <event value="3"    
                        level="win:Error"
                        template="AnErrorMsg"
                        channel="samplesvcdebug"
                        keywords="API"
                        symbol="ErrorMsg"
                        task="SS_PrintRPC"
                        opcode="win:Info"
                        message="$(string.SampleSvc.FrameworkMessage)"/>
        </events>
    
       </provider>
    
      </events>
    
     </instrumentation>
    
     <localization>
        <resources culture="en-US">
            <!--Strings -->
            <stringTable>
                <string id="SampleSvc.PIDMessage"
                    value="Server (PID: [%1]) got message: %2"/>
                <string id="SampleSvc.FrameworkMessage"
                    value="Framework State: %1, HRESULT: %2"/>
                <string id="SampleSvc.AnErrorMsg"
                    value="%1 Error#: %2"/>
            </stringTable>
        </resources>
    </localization>
</instrumentationManifest>

