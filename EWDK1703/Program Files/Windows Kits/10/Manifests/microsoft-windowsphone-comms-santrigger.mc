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
      <provider name="Microsoft-WindowsPhone-Comms-NabSanTrigger"
          guid="{275316DF-D30E-4565-8983-B0064C76ECAF}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_NABSANTRIGGER"
          resourceFileName="NabSanTrigger.exe"
          messageFileName="NabSanTrigger.exe">

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)"/>

          <!-- Provider-specific keywords -->
          <keyword mask="0x0000080000000000" name="SyncSelfHost" message="$(string.Keyword.SyncSelfHost)" />

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning" message="$(string.Keyword.Warning)" />
          <keyword mask="0x0000800000000000" name="StateTransition" message="$(string.Keyword.StateTransition)"/>
          
        </keywords>

        <templates>
          <!--Event Template defined for Comms Logging -->
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>
          
          <template tid="String_template">
            <data name="P1_UnicodeString" inType="win:UnicodeString"/>
          </template>
            
          <template tid="String_String_template">
            <data name="P1_UnicodeString" inType="win:UnicodeString"/>
            <data name="P2_UnicodeString" inType="win:UnicodeString"/>
          </template>
        
          <template tid="String_String_String_template">
            <data name="P1_UnicodeString" inType="win:UnicodeString"/>
            <data name="P2_UnicodeString" inType="win:UnicodeString"/>
            <data name="P3_UnicodeString" inType="win:UnicodeString"/>
          </template>
            
        </templates>
          
        <tasks>
          <task name="SanTrigger" value="1"/>
        </tasks>

        <events>
            <!-- CommsErrorTemplate is the default handling of ifErrorReturn HR logging -->
            
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
         
           <!-- SanTrigger events -->
            
            <event value="100"
                symbol="NabSanTrigger_SanHandlerStarting"
                level="win:Informational"
                message="$(string.Event.NabSanTrigger_SanHandlerStarting)" 
                keywords="StateTransition" />
              
            <event value="101"
                symbol="NabSanTrigger_SanHandlerTerminating"
                level="win:Informational"
                message="$(string.Event.NabSanTrigger_SanHandlerTerminating)" 
                keywords="StateTransition" />
              
            <event value="102"
                symbol="NabSanTrigger_NewSanMessage"
                level="win:Informational"
                message="$(string.Event.NabSanTrigger_NewSanMessage)"
                keywords="StateTransition" />
              
            <event value="103"
                symbol="NabSanTrigger_SanMessageFromServer"
                level="win:Informational"
                template="String_template"
                message="$(string.Event.NabSanTrigger_SanMessageFromServer)"
                keywords="StateTransition" />
            
            <event value="104"
                symbol="NabSanTrigger_SanApplicationFound"
                level="win:Informational"
                template="String_String_String_template"
                message="$(string.Event.NabSanTrigger_SanApplicationFound)"
                keywords="StateTransition" />
                 
            <event value="105"
                symbol="NabSanTrigger_IncomingSanTaskNotified"
                level="win:Informational"
                template="String_String_template"
                message="$(string.Event.NabSanTrigger_IncomingSanTaskNotified)"
                keywords="StateTransition" />
              
            <event value="106"
                symbol="NabSanTrigger_SanMessageContents"
                level="win:Informational"
                template="String_template"
                message="$(string.Event.NabSanTrigger_SanMessageContents)"
                keywords="SyncSelfHost" />
            
        </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Keyword.Error" 
            value="Error" />
          
        <string id="Keyword.Performance"
            value="Performance" />
          
        <string id="Keyword.SyncSelfHost" 
            value="SyncSelfHost" />

        <string id="Keyword.Warning"
            value="Warning" />

        <string id="Keyword.StateTransition"
            value="StateTransition" />

        <!-- CommsErrorMessage and CommsPropagateErrorMessage are required since we are including CommsLogging.h -->
          
        <string id="Event.CommsErrorOriginateMessage"
            value="Error: %1 Location: %2 Line Number: %3"/>
          
        <string id="Event.CommsPropagateErrorMessage"
            value="Error Propagated: %1 Location: %2 Line Number: %3"/>
        
          <!-- NabSanTrigger -->
          
        <string id="Event.NabSanTrigger_SanHandlerStarting"
            value="Nab San Trigger: Starting San Handler"/>
          
        <string id="Event.NabSanTrigger_SanHandlerTerminating"
            value="Nab San Trigger: Terminating San Handler"/>
          
        <string id="Event.NabSanTrigger_NewSanMessage"
            value="Nab San Trigger: New San Message"/>
          
        <string id="Event.NabSanTrigger_SanMessageFromServer"
            value="Nab San Trigger: San message received from Server %1"/>
          
        <string id="Event.NabSanTrigger_SanApplicationFound"
            value="Nab San Trigger: San Application Found. Product Id = %1 Notification Id = %2 Server Id = %3"/>
          
        <string id="Event.NabSanTrigger_IncomingSanTaskNotified"
            value="Nab San Trigger: IncomingMobileNetworkMessageTask Agent Notified. Product Id = %1 Notification Id = %2"/>
          
        <string id="Event.NabSanTrigger_SanMessageContents"
            value="Nab San Trigger: San Message Contents = %1"/>

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
