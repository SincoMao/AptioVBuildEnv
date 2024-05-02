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
<instrumentationManifest
            xmlns="http://schemas.microsoft.com/win/2004/08/events"
            xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:Comms="http://www.w3.org/2001/XMLSchema">
  <instrumentation>

    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-Comms-CommsCSP"
          guid="{1F685704-783A-4388-920D-06D40635A6FB}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_COMMSCSP"
          resourceFileName="CommsCSP.dll"
          messageFileName="CommsCSP.dll">

        <!--Event Templates -->
        <templates>

          <!--Event Template defined for Comms Logging -->
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

          <template tid="tTraceMessage">
            <data inType="win:Pointer" name="Message" /> 
          </template>

          <template tid="String_String_template">
              <data name="Prop_String1" inType="win:UnicodeString" />
              <data name="Prop_String2" inType="win:UnicodeString"/>
          </template>

          <template tid="String_String_String_template">
              <data name="Prop_String1" inType="win:UnicodeString" />
              <data name="Prop_String2" inType="win:UnicodeString"/>
              <data name="Prop_String3" inType="win:UnicodeString"/>              
          </template>
  
          <template tid="String_String_UINT_template">
              <data name="Prop_String1" inType="win:UnicodeString" />
              <data name="Prop_String2" inType="win:UnicodeString"/>
              <data name="Prop_UINT1" inType="win:UInt32"/>
          </template>

          <template tid="UINT_template">
            <data name="Prop_UINT1" inType="win:UInt32"/>
          </template>
        </templates>

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error"/>
          <keyword mask="0x0000000000000002" name="Performance"/>

          <!-- Provider-specific keywords -->
          <keyword mask="0x0000000000000100" name="debug" message="$(string.Keyword.Debug)" />

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning" message="$(string.Keyword.Warning)"/>
        </keywords>

        <tasks>
            <task message="$(string.Task.TraceMessage)" name="tracemessage" value="10" /> 
        </tasks>

        <events>

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

          <event value="1000" 
              level="win:Verbose"          
              symbol="_ETWMESSAGE" 
              keywords="debug" 
              task="tracemessage" 
              template="tTraceMessage" />            

          <event value="2000" 
              level="win:Informational"          
              symbol="AccountsNodeGet"
              message="$(string.Event.AccountsNodeGet)"/>

          <event value="2001" 
              level="win:Informational"          
              symbol="AccountsNodeSet"
              message="$(string.Event.AccountsNodeSet)"/>

          <event value="2002" 
              level="win:Informational"          
              symbol="CallHistoryNodeGet"
              message="$(string.Event.CallHistoryNodeGet)"/>

          <event value="2003" 
              level="win:Informational"          
              symbol="CallHistoryNodeSet"
              message="$(string.Event.CallHistoryNodeSet)"/>

          <event value="2004" 
              level="win:Informational"          
              symbol="RegistryNodeGet"
              message="$(string.Event.RegistryNodeGet)"/>

          <event value="2005" 
              level="win:Informational"          
              symbol="RegistryNodeGetString"
              template="String_String_String_template"              
              message="$(string.Event.RegistryNodeGetString)"/>

          <event value="2006" 
              level="win:Informational"          
              symbol="RegistryNodeGetInt"
              template="String_String_UINT_template"              
              message="$(string.Event.RegistryNodeGetInt)"/>

          <event value="2007" 
              level="win:Informational"          
              symbol="RegistryNodeGetBlob"
              template="String_String_template"              
              message="$(string.Event.RegistryNodeGetBlob)"/>

          <event value="2008" 
              level="win:Informational"          
              symbol="RegistryNodeSetString"
              template="String_String_String_template"
              message="$(string.Event.RegistryNodeSetString)"/>

          <event value="2009" 
              level="win:Informational"          
              symbol="RegistryNodeSetInt"
              template="String_String_UINT_template"
              message="$(string.Event.RegistryNodeSetInt)"/>

          <event value="2010" 
              level="win:Informational"          
              symbol="RegistryNodeSetBlob"
              template="String_String_template"
              message="$(string.Event.RegistryNodeSetBlob)"/>

          <event value="2011" 
              level="win:Informational"          
              symbol="DelayedDbNodeGet"
              message="$(string.Event.DelayedDbNodeGet)"/>

          <event value="2012" 
              level="win:Informational"          
              symbol="DelayedDbNodeSet"
              message="$(string.Event.DelayedDbNodeSet)"/>

          <event value="2013"
              level="win:Informational"
              symbol="ItemsWithNoLineNumber"
              template="UINT_template"
              message="$(string.Event.ItemsWithNoLineNumber)"/>

          <event value="2014"
              level="win:Informational"
              symbol="ItemsWithInvalidLineNumber"
              template="UINT_template"
              message="$(string.Event.ItemsWithInvalidLineNumber)"/>

          <event value="2015" 
              level="win:Informational"          
              symbol="CallFavoriteNodeGet"
              message="$(string.Event.CallFavoriteNodeGet)"/>

          <event value="2016" 
              level="win:Informational"          
              symbol="CallFavoriteNodeSet"
              message="$(string.Event.CallFavoriteNodeSet)"/>

          <event value="2017" 
              level="win:Informational"          
              symbol="CortanaNodeGet"
              message="$(string.Event.CortanaNodeGet)"/>

          <event value="2018" 
              level="win:Informational"          
              symbol="CortanaNodeSet"
              message="$(string.Event.CortanaNodeSet)"/>
          </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <!--New Event and Trace string definitions -->
        <string id="Event.CommsErrorOriginateMessage"
            value="Error: %1 Location: %2 Line Number: %3"/>    
        <string id="Event.CommsPropagateErrorMessage"
            value="Error Propagated: %1 Location: %2 Line Number: %3"/>

        <string id="Keyword.Debug" value="Debug" />
        <string id="Keyword.Warning" value="Warning" />

        <string id="Task.TraceMessage" value="Trace" />

        <string id="Event.AccountsNodeGet"
            value="GetValue() for CommsAccountsNode"/>
        <string id="Event.AccountsNodeSet"
            value="SetValue() for CommsAccountsNode"/>

        <string id="Event.CallHistoryNodeGet"
            value="GetValue() for CallHistoryDataNode"/>
        <string id="Event.CallHistoryNodeSet"
            value="SetValue() for CallHistoryDataNode"/>

        <string id="Event.RegistryNodeGet"
            value="GetValue() for CommsRegistryNode"/>
            
        <string id="Event.RegistryNodeGetString"
            value="GetValue() for CommsRegistryNode. Key: %1, Value %2, String %3"/>

        <string id="Event.RegistryNodeGetInt"
            value="GetValue() for CommsRegistryNode. Key: %1, Value %2, Int %3"/>

        <string id="Event.RegistryNodeGetBlob"
            value="GetValue() for CommsRegistryNode. Key: %1, Value %2"/>

        <string id="Event.RegistryNodeSetString"
            value="SetValue() for CommsRegistryNode string. Key: %1, Value %2, String %3"/>

        <string id="Event.RegistryNodeSetInt"
            value="SetValue() for CommsRegistryNode string. Key: %1, Value %2, Int %3"/>

        <string id="Event.RegistryNodeSetBlob"
            value="SetValue() for CommsRegistryNode string. Key: %1, Value %2"/>

        <string id="Event.DelayedDbNodeGet"
            value="GetValue() for DelayedDBPropertiesNode"/>
        <string id="Event.DelayedDbNodeSet"
            value="SetValue() for DelayedDBPropertiesNode"/>

        <string id="Event.ItemsWithNoLineNumber"
            value="%1 Call History Items were restored with no PhoneLineId (LineNumber) defined.  Using DefaultPhoneLineId for those entries."/>
        <string id="Event.ItemsWithInvalidLineNumber"
            value="%1 Call History Items were restored with an invalid PhoneLineId (LineNumber) defined.  Using DefaultPhoneLineId for those entries."/>

        <string id="Event.CallFavoriteNodeGet"
            value="GetValue() for CallFavoriteDataNode"/>
        <string id="Event.CallFavoriteNodeSet"
            value="SetValue() for CallFavoriteDataNode"/>

        <string id="Event.CortanaNodeGet"
            value="GetValue() for CommsCortanaNode"/>
        <string id="Event.CortanaNodeSet"
            value="SetValue() for CommsCortanaNode"/>
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>

