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
       <provider name="Microsoft-WindowsMobile-WPAutobrightSvc" 
                    guid="{F8BC21F6-223C-47A8-BB3E-1BF1E7E959F7}" 
                    symbol="MICROSOFT_WINDOWSMOBILE_WPAUTOBRIGHTSVC" 
                    resourceFileName="wpabsvc.dll" 
                    messageFileName="wpabsvc.dll">
    
        <!--Channel is not needed, removed -->
        <channels />
        
        <!--Keywords for TaskModel Name Space, Note: it is 64bit value -->
        <keywords>
            <keyword name="Error" mask="0x00000001" message="$(string.Keyword.Error)" />
            <keyword name="Performance" mask="0x00000002" message="$(string.Keyword.Performance)" />
            <keyword name="Debug" mask="0x00000004" message="$(string.Keyword.Debug)" />
        </keywords>
    
        <!--Event Templates -->
        <templates>
            <template tid="ErrorMsg">
                <data name="PID" inType="win:UInt32" outType="win:HexInt32" />
                <data name="State" inType="win:UInt32" outType="win:HexInt32" />
                <data name="Message" inType="win:UnicodeString" />
                <data name="HR" inType="win:UInt32" outType="win:HexInt32" />
                <UserData>
                    <ExecManLogEvent xmlns="em">
                        <PID> %1 </PID>
                        <State> %2 </State>
                        <Message> %3 </Message>
                        <HR> %4 </HR>
                    </ExecManLogEvent>
                </UserData>
            </template>
            <template tid="FrameworkMsg">
                <data name="State" inType="win:UInt32" outType="win:HexInt32" />
                <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
                <UserData>
                    <ExecManLogEvent xmlns="em">
                        <State> %1 </State>
                        <HRESULT> %2 </HRESULT>
                    </ExecManLogEvent>
                </UserData>
            </template>
            <template tid="PublishMsg">
                <data name="State" inType="win:UInt32" outType="win:HexInt32" />
                <data name="Message" inType="win:UnicodeString" />
                <data name="HR" inType="win:UInt32" outType="win:HexInt32" />
                <data name="Data" inType="win:UInt32" outType="win:HexInt32" />
                <UserData>
                    <ExecManLogEvent xmlns="em">
                        <State> %1 </State>
                        <Message> %2 </Message>
                        <HR> %3 </HR>
                        <Data> %4 </Data>
                    </ExecManLogEvent>
                </UserData>
            </template>

        </templates>
        
        <!--All the Tasks that can be published by this Publisher -->
        <!-- Tasks are not needed, so not included -->
        
        <!--Events -->
        <events>
          <event value="1"
                        level="win:Error"
                        template="ErrorMsg"
                        keywords="Error"
                        symbol="ErrorMsg"
                        opcode="win:Info"
                        message="$(string.WPAutobrightSvc.ErrorMsg)"/>
                        
          <event value="2"    
                        level="win:Informational"
                        template="FrameworkMsg"
                        keywords="Debug"
                        symbol="EngineState"
                        opcode="win:Info"
                        message="$(string.WPAutobrightSvc.EngineState)"/>

          <event value="3"
                         level="win:Informational"
                         template="PublishMsg"
                         keywords="Debug"
                         symbol="Publish"
                         opcode="win:Info"
                         message="$(string.WPAutobrightSvc.Publish)"/>

        </events>
    
       </provider>
    
      </events>
    
     </instrumentation>
    
     <localization>
        <resources culture="en-US">
            <!--Strings -->
            <stringTable>
                <string id="Keyword.Error"              value="Error" />
                <string id="Keyword.Performance"        value="Performance" />
                <string id="Keyword.Debug"              value="Debug" />

                <string id="WPAutobrightSvc.ErrorMsg"
                    value="Adaptive Brightness Service: PID: %1, State: %2, Message: %3, HRESULT: %4"/>
                <string id="WPAutobrightSvc.EngineState"
                    value="AB Framework State: %1, HRESULT: %2"/>
                <string id="WPAutobrightSvc.Publish"
                    value="AB Status: %1, Message: %2, HRESULT: %3, Data: %4"/>
            </stringTable>
        </resources>
    </localization>
</instrumentationManifest>

