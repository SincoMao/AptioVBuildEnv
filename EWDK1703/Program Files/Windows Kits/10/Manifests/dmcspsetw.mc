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
      <provider name="Microsoft-WindowsPhone-DeviceLockCsp-Provider"
          guid="{A4562A9A-2673-4784-89D5-556719DDA07E}"
          symbol="MICROSOFT_WINDOWSPHONE_DEVICELOCKCSP_PROVIDER"
          messageFileName="dmcsps.dll"
          resourceFileName="dmcsps.dll">

        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Debug" message="$(string.Keyword.Debug)" />
        </keywords>

        <templates>
          <template tid="SingleAnsiString">
            <data name="Message" inType="win:AnsiString" outType="xs:string"/>
          </template>
          
          <template tid="SingleAnsiStringAndDWORD">
            <data name="Message" inType="win:AnsiString" outType="xs:string"/>
            <data name="ReturnCode" inType="win:UInt32" outType="xs:unsignedInt"/>
          </template>
          
          <template tid="SingleStringAndDWORD">
            <data name="Message" inType="win:UnicodeString" outType="xs:string"/>
            <data name="Value" inType="win:UInt32" outType="xs:unsignedInt"/>
          </template>
          
          <template tid="TwoStringsAndDWORD">
            <data name="Message1" inType="win:UnicodeString" outType="xs:string"/>
            <data name="Messag2" inType="win:UnicodeString" outType="xs:string"/>
            <data name="Value" inType="win:UInt32" outType="xs:unsignedInt"/>
          </template>
        </templates>

        <events>
          <!-- Events for error return -->      
          <event value="1"
              keywords="Debug"
              level="win:Verbose"
              symbol="DeviceLockCsp_EnteringScopeEvent"
              template="SingleAnsiString"
              message="$(string.DeviceLockCsp.EnteringScopeEventMessage)"/>

          <event value="2"
              keywords="Debug"
              level="win:Verbose"
              symbol="DeviceLockCsp_LeavingScopeEvent"
              template="SingleAnsiString"
              message="$(string.DeviceLockCsp.LeavingScopeEventMessage)"/>

          <event value="3"
              keywords="Debug"
              level="win:Verbose"
              symbol="DeviceLockCsp_LeavingScopeWithResultEvent"
              template="SingleAnsiStringAndDWORD"
              message="$(string.DeviceLockCsp.LeavingScopeWithResultEventMessage)"/>
              
          <event value="4"
              keywords="Debug"
              level="win:Warning"
              symbol="DeviceLockCsp_LeavingScopeWithFailedResultEvent"
              template="SingleAnsiStringAndDWORD"
              message="$(string.DeviceLockCsp.LeavingScopeWithResultEventMessage)"/>
              
          <event value="5"
              keywords="Debug"
              level="win:Informational"
              symbol="DeviceLockCsp_SetProviderPolicyValue"
              template="TwoStringsAndDWORD"
              message="$(string.DeviceLockCsp.SetProviderPolicyValue)"/>

          <event value="6"
              keywords="Debug"
              level="win:Informational"
              symbol="DeviceLockCsp_GetDevicePolicyValue"
              template="SingleStringAndDWORD"
              message="$(string.DeviceLockCsp.GetDevicePolicyValue)"/>
              
        </events>
      </provider>
      <provider name="Microsoft-WindowsPhone-NodeCacheCsp-Provider"
            guid="{79ECB2AE-3F73-4D6E-8717-CAC7804A1A61}"
            symbol="MICROSOFT_WINDOWSPHONE_NODECACHECSP_PROVIDER"
            messageFileName="dmcsps.dll"
            resourceFileName="dmcsps.dll">

            <channels />

            <keywords>
                <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
                <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
                <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
                <!-- Other keywords are provider-specific. -->
                <keyword mask="0x0000000000000004" name="Debug" message="$(string.Keyword.Debug)" />
            </keywords>

            <templates>
                <template tid="SingleAnsiString">
                    <data name="Message" inType="win:AnsiString" outType="xs:string"/>
                </template>

                <template tid="SingleAnsiStringAndDWORD">
                    <data name="Message" inType="win:AnsiString" outType="xs:string"/>
                    <data name="ReturnCode" inType="win:UInt32" outType="xs:unsignedInt"/>
                </template>
            </templates>

            <events>
                <!-- Events for error return -->
                <event value="1"
                    keywords="Debug"
                    level="win:Verbose"
                    symbol="NodeCacheCsp_EnteringScopeEvent"
                    template="SingleAnsiString"
                    message="$(string.NodeCacheCsp.EnteringScopeEventMessage)"/>

                <event value="2"
                    keywords="Debug"
                    level="win:Verbose"
                    symbol="NodeCacheCsp_LeavingScopeEvent"
                    template="SingleAnsiString"
                    message="$(string.NodeCacheCsp.LeavingScopeEventMessage)"/>

                <event value="3"
                    keywords="Debug"
                    level="win:Verbose"
                    symbol="NodeCacheCsp_LeavingScopeWithResultEvent"
                    template="SingleAnsiStringAndDWORD"
                    message="$(string.NodeCacheCsp.LeavingScopeWithResultEventMessage)"/>

                <event value="4"
                    keywords="Debug"
                    level="win:Warning"
                    symbol="NodeCacheCsp_LeavingScopeWithFailedResultEvent"
                    template="SingleAnsiStringAndDWORD"
                    message="$(string.NodeCacheCsp.LeavingScopeWithResultEventMessage)"/>
            </events>
        </provider>
        <provider name="Microsoft-WindowsPhone-DMClientCsp-Provider"
            guid="{DE8FD7AD-1891-4B17-83B3-B3F915437044}"
            symbol="MICROSOFT_WINDOWSPHONE_DMCLIENTCSP_PROVIDER"
            messageFileName="dmcsps.dll"
            resourceFileName="dmcsps.dll">

            <channels />

            <keywords>
                <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
                <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
                <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
                <!-- Other keywords are provider-specific. -->
                <keyword mask="0x0000000000000004" name="Debug" message="$(string.Keyword.Debug)" />
            </keywords>

            <templates>
                <template tid="SingleAnsiString">
                    <data name="Message" inType="win:AnsiString" outType="xs:string"/>
                </template>

                <template tid="SingleAnsiStringAndDWORD">
                    <data name="Message" inType="win:AnsiString" outType="xs:string"/>
                    <data name="ReturnCode" inType="win:UInt32" outType="xs:unsignedInt"/>
                </template>

                <template tid="SingleHrValue">
                    <data inType="win:HexInt32" name="hr" />
                </template>

                <template tid="SingleString">
                    <data inType="win:UnicodeString" name="szString" />
                </template>

                <template tid="GenericFailureDetail">
                    <data inType="win:AnsiString" outType="xs:string" name="FileName" />
                    <data inType="win:AnsiString" outType="xs:string" name="FunctionName" />
                    <data inType="win:UInt32" outType="xs:unsignedInt" name="Line" />
                    <data inType="win:HexInt32" name="hr" />
                </template>
                
            </templates>

            <events>
                <!-- Events for error return -->
                <event value="1"
                    keywords="Debug"
                    level="win:Verbose"
                    symbol="DMClientCsp_EnteringScopeEvent"
                    template="SingleAnsiString"
                    message="$(string.DMClientCsp.EnteringScopeEventMessage)"/>

                <event value="2"
                    keywords="Debug"
                    level="win:Verbose"
                    symbol="DMClientCsp_LeavingScopeEvent"
                    template="SingleAnsiString"
                    message="$(string.DMClientCsp.LeavingScopeEventMessage)"/>

                <event value="3"
                    keywords="Debug"
                    level="win:Verbose"
                    symbol="DMClientCsp_LeavingScopeWithResultEvent"
                    template="SingleAnsiStringAndDWORD"
                    message="$(string.DMClientCsp.LeavingScopeWithResultEventMessage)"/>

                <event value="4"
                    keywords="Debug"
                    level="win:Warning"
                    symbol="DMClientCsp_LeavingScopeWithFailedResultEvent"
                    template="SingleAnsiStringAndDWORD"
                    message="$(string.DMClientCsp.LeavingScopeWithResultEventMessage)"/>

                <event symbol="PushGenericFailure"
                    value="5"
                    version="0"
                    level="win:Warning"
                    opcode="win:Info"
                    template="GenericFailureDetail"
                    keywords="Debug "
                    message="$(string.Push.GenericFailure)">
                </event>

                <event symbol="PushChannelCouldNotBeAcquired"
                    value="6"
                    version="0"
                    level="win:Warning"
                    opcode="win:Info"
                    template="SingleHrValue"
                    keywords="Debug "
                    message="$(string.Push.FailedChannel)">
                </event>

                <event symbol="PushChannelAcquired"
                    value="7"
                    version="0"
                    level="win:Informational"
                    opcode="win:Info"
                    template="SingleString"
                    keywords="Debug "
                    message="$(string.Push.Channel)">
                </event>

            </events>
        </provider>
        <provider name="Microsoft-WindowsPhone-FileSystemCSP"
            guid="{3C02A457-0FDF-494d-BBAA-B055F9F57ABA}"
            symbol="MICROSOFT_WINDOWSPHONE_FILESYSTEMCSP"
            messageFileName="dmcsps.dll"
            resourceFileName="dmcsps.dll">

            <channels />

            <keywords>
                <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
                <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
                <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
                <!-- Other keywords are provider-specific. -->
                <keyword mask="0x0000000000000004" name="Debug" message="$(string.Keyword.Debug)" />
            </keywords>

            <templates>

                <template tid="tHRESULT">
                    <data name="dwHRESULT" inType="win:UInt32" outType="win:HexInt32" />
                </template>

                <template tid="tStringHRESULT">
                    <data name="szString" inType="win:UnicodeString" />
                    <data name="dwHRESULT" inType="win:UInt32" outType="win:HexInt32" />
                </template>

            </templates>

            <events>

                <!-- Events for error return -->
                <event value="100"
                    symbol="FileSystemNode_CreateInstance"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_CreateInstance)" />
                <event value="101"
                    symbol="FileSystemNode_QueryInterface"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_QueryInterface)" />
                <event value="102"
                    symbol="FileSystemNode_Initialize"
                    keywords="Error"
                    level="win:Error"
                    template="tStringHRESULT"
                    message="$(string.Event.FileSystemNode_Initialize)" />
                <event value="103"
                    symbol="FileSystemNode_GetChildNodeNames"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_GetChildNodeNames)" />
                <event value="104"
                    symbol="FileSystemNode_FindFiles"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_FindFiles)" />
                <event value="105"
                    symbol="FileSystemNode_FindDrives"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_FindDrives)" />
                <event value="106"
                    symbol="FileSystemNode_ConvertVectorToBstrArray"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_ConvertVectorToBstrArray)" />
                <event value="107"
                    symbol="FileSystemNode_Add"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_Add)" />
                <event value="108"
                    symbol="FileSystemNode_DeleteChild"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_DeleteChild)" />
                <event value="109"
                    symbol="FileSystemNode_GetValue"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_GetValue)" />
                <event value="110"
                    symbol="FileSystemNode_SetValue"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_SetValue)" />
                <event value="111"
                    symbol="FileSystemNode_GetProperty"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_GetProperty)" />
                <event value="112"
                    symbol="FileSystemNode_SetFileProperty"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_SetFileProperty)" />
                <event value="113"
                    symbol="FileSystemNode_SetDirectoryProperty"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_SetDirectoryProperty)" />
                <event value="114"
                    symbol="FileSystemNode_GetFileProperty"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_GetFileProperty)" />
                <event value="115"
                    symbol="FileSystemNode_GetDirectoryProperty"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_GetDirectoryProperty)" />
                <event value="116"
                    symbol="FileSystemNode_GetTStamp"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_GetTStamp)" />
                <event value="117"
                    symbol="FileSystemNode_ReplaceEnvironmentVariable"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_ReplaceEnvironmentVariable)" />
                <event value="118"
                    symbol="FileSystemNode_GetFileAttributeData"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_GetFileAttributeData)" />
                <event value="119"
                    symbol="FileSystemNode_SetTStamp"
                    keywords="Error"
                    level="win:Error"
                    template="tHRESULT"
                    message="$(string.Event.FileSystemNode_SetTStamp)" />
            </events>
        </provider>
        <provider name="Microsoft-WindowsPhone-LegacyCSP" guid="{11AACCDB-304E-4F53-9677-8F18B07B65E6}" symbol="MICROSOFT_WINDOWSPHONE_LEGACYCSP" resourceFileName="dmcsps.dll" messageFileName="dmcsps.dll">
            <events>
                <event symbol="CSPProcessor_HandleCharacteristic" value="0" version="0" level="win:Verbose" template="StrStrDwordDwordHr" keywords="Debug " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.1.message)">
                </event>
                <event symbol="CSPProcessor_EndCharacteristic" value="1" version="0" level="win:Verbose" opcode="win:Start" template="StrDwordDwordDwordHr" keywords="Debug " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.0.message)">
                </event>
                <event symbol="CSPProcessor_HandleCharacteristicQuery" value="3" version="0" level="win:Verbose" template="StrStrDwordDwordHr" keywords="Debug " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.3.message)">
                </event>
                <event symbol="CSPProcessor_HandleNoCharacteristic" value="4" version="0" level="win:Verbose" template="StrStrDwordDwordHr" keywords="Debug " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.4.message)">
                </event>
                <event symbol="CSPProcessor_HandleParm" value="5" version="0" level="win:Verbose" template="StrStrStrDwordDwordHr" keywords="Debug " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.5.message)">
                </event>
                <event symbol="CSPProcessor_HandleParmQuery" value="6" version="0" level="win:Verbose" template="StrStrDwordDwordHr" keywords="Debug " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.6.message)">
                </event>
                <event symbol="CSPProcessor_HandleNoParm" value="7" version="0" level="win:Verbose" template="StrStrDwordDwordHr" keywords="Debug " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.7.message)">
                </event>
                <event symbol="LegacyCSP_AddRef" value="8" version="0" level="win:Verbose" template="DwordLong" keywords="Refcount_Debugging " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.8.message)">
                </event>
                <event symbol="LegacyCSP_Release" value="9" version="0" level="win:Verbose" template="DwordLong" keywords="Refcount_Debugging " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.9.message)">
                </event>
                <event symbol="CLegacyCSPNode_AddRef" value="10" version="0" level="win:Verbose" template="DwordLong" keywords="Refcount_Debugging " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.10.message)">
                </event>
                <event symbol="CLegacyCSPNode_Release" value="11" version="0" level="win:Verbose" template="DwordLong" keywords="Refcount_Debugging " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.11.message)">
                </event>
                <event symbol="CLegacyCSPRootNode_Dtor" value="12" version="0" level="win:Error" template="Hr" keywords="Debug Error " message="$(string.Microsoft-WindowsPhone-LegacyCSP.event.12.message)">
                </event>
            </events>
            <levels>
            </levels>
            <opcodes>
            </opcodes>
            <keywords>
                <keyword name="Error" mask="0x1" message="$(string.Microsoft-WindowsPhone-LegacyCSP.keyword.Error.message)">
                </keyword>
                <keyword name="Performance" mask="0x2" message="$(string.Microsoft-WindowsPhone-LegacyCSP.keyword.Performance.message)">
                </keyword>
                <keyword name="Debug" mask="0x4" message="$(string.Microsoft-WindowsPhone-LegacyCSP.keyword.Debug.message)">
                </keyword>
                <keyword name="Refcount_Debugging" mask="0x8" message="$(string.Microsoft-WindowsPhone-LegacyCSP.keyword.Refcount_Debugging.message)">
                </keyword>
            </keywords>
            <templates>
                <template tid="StrStrDwordDwordHr">
                    <data name="Str1" inType="win:UnicodeString" outType="xs:string">
                    </data>
                    <data name="Str2" inType="win:UnicodeString" outType="xs:string">
                    </data>
                    <data name="Dword1" inType="win:HexInt64" outType="win:HexInt64">
                    </data>
                    <data name="Dword2" inType="win:HexInt64" outType="win:HexInt64">
                    </data>
                    <data name="Hr" inType="win:Int32" outType="win:HResult">
                    </data>
                </template>
                <template tid="StrDwordDwordDwordHr">
                    <data name="Str1" inType="win:UnicodeString" outType="xs:string">
                    </data>
                    <data name="Dword1" inType="win:HexInt64" outType="win:HexInt64">
                    </data>
                    <data name="Dword2" inType="win:HexInt64" outType="win:HexInt64">
                    </data>
                    <data name="Dword3" inType="win:HexInt64" outType="win:HexInt64">
                    </data>
                    <data name="Hr" inType="win:Int32" outType="win:HResult">
                    </data>
                </template>
                <template tid="Hr">
                    <data name="Hr" inType="win:Int32" outType="win:HResult">
                    </data>
                </template>
                <template tid="StrStrStrDwordDwordHr">
                    <data name="Str1" inType="win:UnicodeString" outType="xs:string">
                    </data>
                    <data name="Str2" inType="win:UnicodeString" outType="xs:string">
                    </data>
                    <data name="Str3" inType="win:UnicodeString" outType="xs:string">
                    </data>
                    <data name="Dword1" inType="win:HexInt64" outType="win:HexInt64">
                    </data>
                    <data name="Dword2" inType="win:HexInt64" outType="win:HexInt64">
                    </data>
                    <data name="Hr" inType="win:Int32" outType="win:HResult">
                    </data>
                </template>
                <template tid="DwordLong">
                    <data name="Dword1" inType="win:HexInt32" outType="win:HexInt32">
                    </data>
                    <data name="Long1" inType="win:Int32" outType="xs:int">
                    </data>
                </template>
            </templates>
        </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
      
        <string id="Keyword.Error"              value="Error" />
        <string id="Keyword.Performance"        value="Performance" />
        <string id="Keyword.Debug"              value="Debug" />

        <string id="DeviceLockCsp.EnteringScopeEventMessage"
              value="Entering %1."/>
              
        <string id="DeviceLockCsp.LeavingScopeEventMessage"
              value="Leaving  %1."/>
              
        <string id="DeviceLockCsp.LeavingScopeWithResultEventMessage"
              value="Leaving  %1 with result (%2)."/>
              
        <string id="DeviceLockCsp.SetProviderPolicyValue"
              value="Set provider %1 policy %2 to %3."/>
              
        <string id="DeviceLockCsp.GetDevicePolicyValue"
              value="Device policy %1 is %2."/>

        <string id="NodeCacheCsp.EnteringScopeEventMessage"
              value="Entering %1."/>

        <string id="NodeCacheCsp.LeavingScopeEventMessage"
              value="Leaving  %1."/>

        <string id="NodeCacheCsp.LeavingScopeWithResultEventMessage"
              value="Leaving  %1 with result (%2)."/>
        <string id="DMClientCsp.EnteringScopeEventMessage"
              value="Entering %1."/>

        <string id="DMClientCsp.LeavingScopeEventMessage"
              value="Leaving  %1."/>

        <string id="DMClientCsp.LeavingScopeWithResultEventMessage"
              value="Leaving  %1 with result (%2)."/>
        <string id="Event.FileSystemNode_CreateInstance"        value="FileSystemNode::CreateInstance returned %1." />
        <string id="Event.FileSystemNode_QueryInterface"        value="FileSystemNode::QueryInterface returned %1." />
        <string id="Event.FileSystemNode_Initialize"            value="FileSystemNode::Initialize(%1) returned %2." />
        <string id="Event.FileSystemNode_GetChildNodeNames"     value="FileSystemNode::GetChildNodeNames returned %1." />
        <string id="Event.FileSystemNode_FindFiles"             value="FileSystemNode::FindFiles returned %1." />
        <string id="Event.FileSystemNode_FindDrives"            value="FileSystemNode::FindDrives returned %1." />
        <string id="Event.FileSystemNode_ConvertVectorToBstrArray"      value="FileSystemNode::ConvertVectorToBstrArray returned %1." />
        <string id="Event.FileSystemNode_Add"                   value="FileSystemNode::Add returned %1." />
        <string id="Event.FileSystemNode_DeleteChild"           value="FileSystemNode::DeleteChild returned %1." />
        <string id="Event.FileSystemNode_GetValue"              value="FileSystemNode::GetValue returned %1." />
        <string id="Event.FileSystemNode_SetValue"              value="FileSystemNode::SetValue returned %1." />
        <string id="Event.FileSystemNode_GetProperty"           value="FileSystemNode::GetProperty returned %1." />
        <string id="Event.FileSystemNode_SetFileProperty"       value="FileSystemNode::SetFileProperty returned %1." />
        <string id="Event.FileSystemNode_SetDirectoryProperty"  value="FileSystemNode::SetDirectoryProperty returned %1." />
        <string id="Event.FileSystemNode_GetFileProperty"       value="FileSystemNode::GetFileProperty returned %1." />
        <string id="Event.FileSystemNode_GetDirectoryProperty"  value="FileSystemNode::GetDirectoryProperty returned %1." />
        <string id="Event.FileSystemNode_GetTStamp"             value="FileSystemNode::GetTStamp returned %1." />
        <string id="Event.FileSystemNode_ReplaceEnvironmentVariable"    value="FileSystemNode::ReplaceEnvironmentVariable returned %1." />
        <string id="Event.FileSystemNode_GetFileAttributeData"  value="FileSystemNode::GetFileAttributeData returned %1." />
        <string id="Event.FileSystemNode_SetTStamp"             value="FileSystemNode::SetTStamp returned %1." />
        <string id="Microsoft-WindowsPhone-LegacyCSP.keyword.Refcount_Debugging.message" value="Refcount_Debugging">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.keyword.Performance.message" value="Performance">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.keyword.Error.message" value="Error">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.keyword.Debug.message" value="Debug">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.9.message" value="LegacyCSP: %1 Release %2">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.8.message" value="LegacyCSP: %1 AddRef %2">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.7.message" value="CSPProcessor HandleNoParm: base='%1' node='%2' data='%3' flags='%4' hr='%5'">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.6.message" value="CSPProcessor HandleParmQuery: base='%1' node='%2' data='%3' flags='%4' hr='%5'">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.5.message" value="CSPProcessor HandleParm: base='%1' node='%2' value='%3' data='%4' flags='%5' hr='%6'">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.4.message" value="CSPProcessor HandleNoCharacteristic: base='%1' node='%2' data='%3' flags='%4' hr='%5'">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.3.message" value="CSPProcessor HandleCharacteristicQuery: base='%1' node='%2' data='%3' flags='%4' hr='%5'">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.2.message" value="CSPProcessor EndCharacteristic: hr='%1'">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.12.message" value="~CLegacyCSPRootNode: EndProcessing Failed. hr=%1">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.11.message" value="LegacyNode: %1 Release %2">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.10.message" value="LegacyNode: %1 AddRef %2">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.1.message" value="CSPProcessor HandleCharacteristic: base='%1' node='%2' data='%3' flags='%4' hr='%5'">
        </string>
        <string id="Microsoft-WindowsPhone-LegacyCSP.event.0.message" value="CSPProcessor EndCharacteristic: base='%1' data='%2' data2='%3' flags='%4' hr='%5'">
        </string>
        <string id="Push.GenericFailure" value="A generic failure occured in MDM Push - File: %1 Func: %2 Line: %3 HR: %4.">
        </string>
        <string id="Push.FailedChannel" value="A push channel could not be acquired. HR: %1.">
        </string>
        <string id="Push.Channel" value="A push channel has been acquired. URI: %1.">
        </string>
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>

