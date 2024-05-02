<!-- <?xml version="1.0" encoding="UTF-16"?> -->
<instrumentationManifest
            xmlns="http://schemas.microsoft.com/win/2004/08/events"
            xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:Comms="http://www.w3.org/2001/XMLSchema">
  <instrumentation>

    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-Comms-CommonUtils"
          guid="{21F1F21B-C2F6-47d0-BAFC-5B75A86F5343}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMS_COMMONUTILS"
          resourceFileName="CommonUtils"
          messageFileName="CommonUtils">

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error"/>
          <keyword mask="0x0000000000000002" name="Performance"/>

          <!-- Provider-specific keywords -->
          <keyword mask="0x0000000000000004" name="Debug" />
          <keyword mask="0x0000000000000008" name="PSA" />

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning"/>
        </keywords>

        <tasks>
          <task name="tracemessage" message="$(string.Task.TraceMessage)" value="19" />
        </tasks>

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

          <!-- Specifc templates -->
          <template tid="Comms_snutils_noargs">              
          </template>

          <template tid="Comms_snutils_hex">
            <data name="Prop_UInt32" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="Comms_snutils_string">
             <data name="Prop_String" inType="win:UnicodeString" />
          </template>

          <template tid="Comms_snutils_string_hex">
            <data name="Prop_String" inType="win:UnicodeString" />
            <data name="Prop_UInt32" inType="win:UInt32" outType="win:HexInt32"/>
          </template>


        </templates>

        <!--All the Events that can be published by this Publisher -->

        <events>

          <!-- Comms standard error events -->
          <event value="1" level="win:Error" template="CommsHrTemplate" symbol="CommsErrorOriginateEvent" keywords="Error" message="$(string.Event.CommsErrorOriginateMessage)"/>
          <event value="2" level="win:Warning" template="CommsHrTemplate" symbol="CommsErrorPropagateEvent" keywords="Warning" message="$(string.Event.CommsPropagateErrorMessage)"/>
          <event value="3" level="win:Verbose" template="tTraceMessage" symbol="_ETWMESSAGE" keywords="Debug" task="tracemessage"/>

          <!-- PSA -->
          <event value="1000"
               level="win:Error"
               template="Comms_snutils_hex"
               keywords="PSA"
               symbol="PSA_FailedToLoadServiceFromReg"
               message="$(string.Publisher.PSA_FailedToLoadServiceFromReg)"/>

          <event value="1001"
               level="win:Warning"
               template="CommsHrTemplate"
               keywords="PSA Warning"
               symbol="PSA_FailedToLoadServiceById"
               message="$(string.Publisher.PSA_FailedToLoadServiceById)"/>

           <event value="1002"
              level="win:Warning"
              template="Comms_snutils_noargs"
              keywords="PSA Warning"
              symbol="PSA_ServiceInvalidNoId"
              message="$(string.Publisher.PSA_ServiceInvalidNoId)"/>

           <event value="1003"
              level="win:Warning"
              template="Comms_snutils_string"
              keywords="PSA Warning"
              symbol="PSA_ServiceInvalidNoName"
              message="$(string.Publisher.PSA_ServiceInvalidNoName)"/>

           <event value="1004"
              level="win:Warning"
              template="Comms_snutils_string"
              keywords="PSA Warning"
              symbol="PSA_ServiceInvalidNoNetworkSourceId"
              message="$(string.Publisher.PSA_ServiceInvalidNoNetworkSourceId)"/>
            
           <event value="1005"
             level="win:Warning"
             template="Comms_snutils_string"
             keywords="PSA Warning"
             symbol="PSA_ServiceInvalidNoIcons"
             message="$(string.Publisher.PSA_ServiceInvalidNoIcons)"/>

           <event value="1006"
             level="win:Warning"
             template="Comms_snutils_string"
             keywords="PSA Warning"
             symbol="PSA_ServiceInvalidNoScenarios"
             message="$(string.Publisher.PSA_ServiceInvalidNoScenarios)"/>

           <event value="1007"
             level="win:Error"
             template="Comms_snutils_string"
             keywords="PSA"
             symbol="PSA_ServiceFailedOnRead"
             message="$(string.Publisher.PSA_ServiceFailedOnRead)"/>

           <event value="1008"
             level="win:Warning"
             template="Comms_snutils_string"
             keywords="PSA Warning"
             symbol="PSA_ServiceFailedOnWrite"
             message="$(string.Publisher.PSA_ServiceFailedOnWrite)"/>

           <event value="1009"
             level="win:Warning"
             template="Comms_snutils_string_hex"
             keywords="PSA Warning"
             symbol="PSA_FailedToWriteServiceToReg"
             message="$(string.Publisher.PSA_FailedToWriteServiceToReg)"/>

           <event value="1010"
             level="win:Warning"
             template="Comms_snutils_string"
             keywords="PSA Warning"
             symbol="PSA_ServiceInvalidState"
             message="$(string.Publisher.PSA_ServiceInvalidState)"/>

            <event value="1011"
             level="win:Informational"
             template="Comms_snutils_string"
             keywords="PSA"
             symbol="PSA_MarketChangeDetected"
             message="$(string.Publisher.PSA_MarketChangeDetected)"/>
            
        </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <!--This is how event data can be used as part of Message String -->

        <string id="Event.CommsErrorOriginateMessage"
            value="Error: %1 Location: %2 Line Number: %3"/>
        <string id="Event.CommsPropagateErrorMessage"
            value="Error Propagated: %1 Location: %2 Line Number: %3"/>
        <string id="Task.TraceMessage"
            value="Trace"/>

        <!-- PSA strings-->
        <string
            id="Publisher.PSA_FailedToLoadServiceFromReg"
            value="Failed to read one of the services from registry (HRESULT = 0x%1)"/>
        <string 
            id="Publisher.PSA_FailedToLoadServiceById"
            value="Failed to read one of the services from registry (HRESULT: %1 Location: %2 Line Number: %3)"/>
        <string
            id="Publisher.PSA_ServiceInvalidNoId"
            value="Service with no id is invalid"/>        
        <string
            id="Publisher.PSA_ServiceInvalidNoName"
            value="Service '%1' has no name and is invalid"/>
        <string
            id="Publisher.PSA_ServiceInvalidNoNetworkSourceId"
            value="Service '%1' has no network source id and is invalid"/>
        <string
            id="Publisher.PSA_ServiceInvalidNoIcons"
            value="Service '%1' has no icons and is invalid"/>
        <string
            id="Publisher.PSA_ServiceInvalidNoScenarios"
            value="Service '%1' has no scenarios and is invalid"/>
        <string
            id="Publisher.PSA_ServiceFailedOnRead"
            value="Service '%1' failed validation after it was read from registry. This usually indicates registry is corrupted"/>
        <string
            id="Publisher.PSA_ServiceFailedOnWrite"
            value="Service '%1' failed validation before it was written to registry"/>
        <string
            id="Publisher.PSA_FailedToWriteServiceToReg"
            value="Failed to write service %1 to registry (HRESULT = 0x%2)"/>
        <string
            id="Publisher.PSA_ServiceInvalidState"
            value="Service '%1' has invalid state"/>
        <string
           id="Publisher.PSA_MarketChangeDetected"
           value="Market change was detected, new market '%1'"/>

      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>

