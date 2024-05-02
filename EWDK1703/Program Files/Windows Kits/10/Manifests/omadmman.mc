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
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-OmaDm-Client-Provider"
          guid="{3B9602FF-E09B-4C6C-BC19-1A3DFA8F2250}"
          symbol="WP_OMADM_CLIENT_PROVIDER"
          resourceFileName="EnterpriseEtw.dll"
          messageFileName="EnterpriseEtw.dll">

        <maps>
          <valueMap name="OMADMClientFunctionIndex">
              <!-- Please append new function entry to the end. Don't change the function index. -->
              <!-- Please also add the new funciton name to corresponding string id. -->
              <map value="1" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.1.FunctionName)"/>
              <map value="2" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.2.FunctionName)"/>
              <map value="3" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.3.FunctionName)"/>
              <map value="4" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.4.FunctionName)"/>
              <map value="5" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.5.FunctionName)"/>
              <map value="6" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.6.FunctionName)"/>
              <map value="7" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.7.FunctionName)"/>
              <map value="8" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.8.FunctionName)"/>
              <map value="9" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.9.FunctionName)"/>
              <map value="10" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.10.FunctionName)"/>
              <map value="11" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.11.FunctionName)"/>
              <map value="12" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.12.FunctionName)"/>
              <map value="13" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.13.FunctionName)"/>
              <map value="14" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.14.FunctionName)"/>
              <map value="15" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.15.FunctionName)"/>
              <map value="16" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.16.FunctionName)"/>
              <map value="17" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.17.FunctionName)"/>
              <map value="18" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.18.FunctionName)"/>
              <map value="19" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.19.FunctionName)"/>
              <map value="20" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.20.FunctionName)"/>
              <map value="21" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.21.FunctionName)"/>
              <map value="22" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.22.FunctionName)"/>
              <map value="23" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.23.FunctionName)"/>
              <map value="24" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.24.FunctionName)"/>
              <map value="25" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.25.FunctionName)"/>
              <map value="26" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.26.FunctionName)"/>
              <map value="27" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.27.FunctionName)"/>
              <map value="28" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.28.FunctionName)"/>
              <map value="29" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.29.FunctionName)"/>
              <map value="30" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.30.FunctionName)"/>
              <map value="31" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.31.FunctionName)"/>
              <map value="32" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.32.FunctionName)"/>
              <map value="33" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.33.FunctionName)"/>
              <map value="34" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.34.FunctionName)"/>
              <map value="35" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.35.FunctionName)"/>
              <map value="36" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.36.FunctionName)"/>
              <map value="37" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.37.FunctionName)"/>
              <map value="38" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.38.FunctionName)"/>
              <map value="39" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.39.FunctionName)"/>
              <map value="40" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.40.FunctionName)"/>
              <map value="41" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.41.FunctionName)"/>
              <map value="42" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.42.FunctionName)"/>
              <map value="43" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.43.FunctionName)"/>
              <map value="44" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.44.FunctionName)"/>
              <map value="45" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.45.FunctionName)"/>
              <map value="46" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.46.FunctionName)"/>
              <map value="47" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.47.FunctionName)"/>
              <map value="48" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.48.FunctionName)"/>
              <map value="49" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.49.FunctionName)"/>
              <map value="50" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.50.FunctionName)"/>
              <map value="51" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.51.FunctionName)"/>
              <map value="52" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.52.FunctionName)"/>
              <map value="53" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.53.FunctionName)"/>
              <map value="54" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.54.FunctionName)"/>
              <map value="55" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.55.FunctionName)"/>
              <map value="56" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.56.FunctionName)"/>
              <map value="57" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.57.FunctionName)"/>
              <map value="58" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.58.FunctionName)"/>
              <map value="59" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.59.FunctionName)"/>
              <map value="60" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.60.FunctionName)"/>
              <map value="61" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.61.FunctionName)"/>
              <map value="62" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.62.FunctionName)"/>
              <map value="63" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.63.FunctionName)"/>
              <map value="64" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.64.FunctionName)"/>
              <map value="65" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.65.FunctionName)"/>
              <map value="66" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.66.FunctionName)"/>
              <map value="67" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.67.FunctionName)"/>
              <map value="68" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.68.FunctionName)"/>
              <map value="69" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.69.FunctionName)"/>
              <map value="70" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.70.FunctionName)"/>
              <map value="71" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.71.FunctionName)"/>
              <map value="72" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.72.FunctionName)"/>
              <map value="73" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.73.FunctionName)"/>
              <map value="74" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.74.FunctionName)"/>
              <map value="75" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.75.FunctionName)"/>
              <map value="76" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.76.FunctionName)"/>
              <map value="77" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.77.FunctionName)"/>
              <map value="78" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.78.FunctionName)"/>
              <map value="79" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.79.FunctionName)"/>
              <map value="80" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.80.FunctionName)"/>
              <map value="81" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.81.FunctionName)"/>
              <map value="82" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.82.FunctionName)"/>
              <map value="83" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.83.FunctionName)"/>
              <map value="84" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.84.FunctionName)"/>
              <map value="85" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.85.FunctionName)"/>
              <map value="86" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.86.FunctionName)"/>
              <map value="87" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.87.FunctionName)"/>
              <map value="88" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.88.FunctionName)"/>
              <map value="89" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.89.FunctionName)"/>
              <map value="90" 
                   message="$(string.OmaDmClient.map.OMADMClientFunctionIndex.90.FunctionName)"/>

              <!-- Please append new function entry to the end. Don't change the function index. -->
          </valueMap>
        </maps>

        <!--Event Templates -->
        <templates>

          <template tid="SingleDWORD">
            <data name="Prop_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="SingleDWORDAndString">
            <data name="Prop_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="TwoDWORDs">
            <data name="Prop_UInt32_1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Prop_UInt32_2" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="ThreeDWORDs">
            <data name="Prop_UInt32_1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Prop_UInt32_2" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Prop_UInt32_3" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="SingleString">
            <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="TwoStrings">
            <data name="Prop_UnicodeString_1" inType="win:UnicodeString" outType="xs:string" />
            <data name="Prop_UnicodeString_2" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="ThreeStrings">
            <data name="Prop_UnicodeString_1" inType="win:UnicodeString" outType="xs:string" />
            <data name="Prop_UnicodeString_2" inType="win:UnicodeString" outType="xs:string" />
            <data name="Prop_UnicodeString_3" inType="win:UnicodeString" outType="xs:string" />
          </template>
          
          <template tid="FunctionIndex">
            <data name="Prop_UInt32_1" inType="win:UInt32" map="OMADMClientFunctionIndex" />
          </template>

          <template tid="FunctionResult">
            <data name="Prop_UInt32_1" inType="win:UInt32" map="OMADMClientFunctionIndex" />
            <data name="Prop_UInt32_2" inType="win:UInt32" outType="xs:HexInt32" />
          </template>

          <template tid="SingleStringSingleDWORD">
            <data name="Prop_AnsiString" inType="win:AnsiString" outType="xs:string" />
            <data name="Prop_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          
        </templates>

        <keywords>
          <keyword mask="0x0000000000000001" name="Debug"/>
          <keyword mask="0x0000000000000002" name="Performance"/>
        </keywords>

        <tasks>
          <task name="TIME_WBXML_ENCODE_MARKER" value="1"/>
          <task name="TIME_WBXML_DECODE_MARKER" value="2"/>
          <task name="TIME_FROM_ALERT_ACCEPTANCE_TO_USER_FEEDBACK_MARKER" value="3"/>
          <task name="TIME_FROM_INITIATION_ACCEPTANCE_TO_USER_FEEDBACK_MARKER" value="4"/>
          <task name="RAM_FROM_SESSION_INIT_TO_COMPLETION_MARKER" value="5"/>
          <task name="TIME_FROM_SESSION_INIT_TO_COMPLETION_MARKER" value="6"/>
        </tasks>

        <events>

          <event value="7"
              level="win:Informational"
              template="SingleString"
              symbol="OmaDmInformationalTrace"/>

          <event value="8"
              level="win:Error"
              template="SingleString"
              symbol="OmaDmErrorTrace"/>

          <event value="9"
              level="win:Warning"
              template="SingleString"
              symbol="OmaDmWarningTrace"/>

          <event value="10"
              level="win:Verbose"
              template="SingleString"
              symbol="OmaDmVerboseTrace"
              message="$(string.OmaDmClient.OmaDmXmlVerboseTrace)"/>

          <event value="100"
             symbol="TIME_WBXML_ENCODE_MARKER_START"
             task="TIME_WBXML_ENCODE_MARKER"
             level="win:Informational"
             opcode="win:Start"
             keywords="Performance"/>
          
          <event value="101"
              symbol="TIME_WBXML_ENCODE_MARKER_STOP"
              task="TIME_WBXML_ENCODE_MARKER"
              level="win:Informational"
              opcode="win:Stop"
              keywords="Performance"/>
          
          <event value="102"
             symbol="TIME_WBXML_DECODE_MARKER_START"
             task="TIME_WBXML_DECODE_MARKER"
             level="win:Informational"
             opcode="win:Start"
             keywords="Performance"/>
          
          <event value="103"
              symbol="TIME_WBXML_DECODE_MARKER_STOP"
              task="TIME_WBXML_DECODE_MARKER"
              level="win:Informational"
              opcode="win:Stop"
              keywords="Performance"/>
          
          <event value="104"
             symbol="TIME_FROM_ALERT_ACCEPTANCE_TO_USER_FEEDBACK_MARKER_START"
             task="TIME_FROM_ALERT_ACCEPTANCE_TO_USER_FEEDBACK_MARKER"
             level="win:Informational"
             opcode="win:Start"
             keywords="Performance"/>
          
          <event value="105"
              symbol="TIME_FROM_ALERT_ACCEPTANCE_TO_USER_FEEDBACK_MARKER_STOP"
              task="TIME_FROM_ALERT_ACCEPTANCE_TO_USER_FEEDBACK_MARKER"
              level="win:Informational"
              opcode="win:Stop"
              keywords="Performance"/>
          
          <event value="106"
             symbol="TIME_FROM_INITIATION_ACCEPTANCE_TO_USER_FEEDBACK_MARKER_START"
             task="TIME_FROM_INITIATION_ACCEPTANCE_TO_USER_FEEDBACK_MARKER"
             level="win:Informational"
             opcode="win:Start"
             keywords="Performance"/>
          
          <event value="107"
              symbol="TIME_FROM_INITIATION_ACCEPTANCE_TO_USER_FEEDBACK_MARKER_STOP"
              task="TIME_FROM_INITIATION_ACCEPTANCE_TO_USER_FEEDBACK_MARKER"
              level="win:Informational"
              opcode="win:Stop"
              keywords="Performance"/>
          
          <event value="108"
             symbol="RAM_FROM_SESSION_INIT_TO_COMPLETION_MARKER_START"
             template="SingleDWORD"
             task="RAM_FROM_SESSION_INIT_TO_COMPLETION_MARKER"
             level="win:Informational"
             opcode="win:Start"
             keywords="Performance"/>
          
          <event value="109"
              symbol="RAM_FROM_SESSION_INIT_TO_COMPLETION_MARKER_STOP"
              template="SingleDWORD"
              task="RAM_FROM_SESSION_INIT_TO_COMPLETION_MARKER"
              level="win:Informational"
              opcode="win:Stop"
              keywords="Performance"/>
          
          <event value="110"
             symbol="TIME_FROM_SESSION_INIT_TO_COMPLETION_MARKER_START"
             task="TIME_FROM_SESSION_INIT_TO_COMPLETION_MARKER"
             level="win:Informational"
             opcode="win:Start"
             keywords="Performance"/>
          
          <event value="111"
              symbol="TIME_FROM_SESSION_INIT_TO_COMPLETION_MARKER_STOP"
              task="TIME_FROM_SESSION_INIT_TO_COMPLETION_MARKER"
              level="win:Informational"
              opcode="win:Stop"
              keywords="Performance"/>

          <event value="200"
              level="win:Informational"
              symbol="SessionAbortReceivedEvent"
              message="$(string.OmaDmClient.SessionAbortReceivedEventMessage)"/>

          <event value="201"
              level="win:Informational"
              symbol="PRLOrStateRegKeyChangeEvent"
              message="$(string.OmaDmClient.PRLOrStateRegKeyChangeEventMessage)"/>

          <event value="202"
              level="win:Informational"
              symbol="PRLRegKeyChangeEvent"
              message="$(string.OmaDmClient.PRLRegKeyChangeEventMessage)"/>

          <event value="203"
              level="win:Informational"
              symbol="ActivationStateRegKeyChangeEvent"
              message="$(string.OmaDmClient.ActivationStateRegKeyChangeEventMessage)"/>

          <event value="204"
              level="win:Error"
              symbol="CantNotifyWaitingThreadEvent"
              message="$(string.OmaDmClient.CantNotifyWaitingThreadEventMessage)"/>

          <event value="205"
              level="win:Informational"
              symbol="BackingOffEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.BackingOffEventMessage)"/>

          <event value="206"
              level="win:Informational"
              symbol="CertificateStoreDoesntExistEvent"
              message="$(string.OmaDmClient.CertificateStoreDoesntExistEventMessage)"/>

          <event value="207"
              level="win:Error"
              symbol="SessionAbortTooManyServerAuthFailuresEvent"
              message="$(string.OmaDmClient.SessionAbortTooManyServerAuthFailuresEventMessage)"/>

          <event value="208"
              level="win:Error"
              symbol="SessionAbortToRetryServerAuthFailuresEvent"
              template="TwoDWORDs"
              message="$(string.OmaDmClient.SessionAbortToRetryServerAuthFailuresEventMessage)"/>

          <event value="209"
              level="win:Error"
              symbol="SessionAbortToRetryClientAuthFailuresEvent"
              template="TwoDWORDs"
              message="$(string.OmaDmClient.SessionAbortToRetryClientAuthFailuresEventMessage)"/>

          <event value="210"
              level="win:Error"
              symbol="SessionAbortTooManyClientAuthFailuresEvent"
              message="$(string.OmaDmClient.SessionAbortTooManyClientAuthFailuresEventMessage)"/>

          <event value="211"
              level="win:Error"
              symbol="SessionAbortNotMeetingProviderRequirementsEvent"
              message="$(string.OmaDmClient.SessionAbortNotMeetingProviderRequirementsEventMessage)"/>

          <event value="212"
              level="win:Error"
              symbol="InvalidServerSyncHdrEvent"
              message="$(string.OmaDmClient.InvalidServerSyncHdrEventMessage)"/>

          <event value="213"
              level="win:Warning"
              symbol="RetryTransmissionInvalidServerSyncHdrEvent"
              template="TwoDWORDs"
              message="$(string.OmaDmClient.RetryTransmissionInvalidServerSyncHdrEventMessage)"/>

          <event value="214"
              level="win:Error"
              symbol="InvalidAccountParameterEvent"
              template="TwoDWORDs"
              message="$(string.OmaDmClient.InvalidAccountParameterEventMessage)"/>

          <event value="215"
              level="win:Error"
              symbol="InvalidAccountDataEvent"
              message="$(string.OmaDmClient.InvalidAccountDataEventMessage)"/>

          <event value="216"
              level="win:Error"
              symbol="UnsupportedEncodingTypeEvent"
              template="SingleString"
              message="$(string.OmaDmClient.UnsupportedEncodingTypeEventMessage)"/>

          <event value="217"
              level="win:Informational"
              symbol="SuccessfulXmlToWbxmlConversionEvent"
              message="$(string.OmaDmClient.SuccessfulXmlToWbxmlConversionEventMessage)"/>

          <event value="218"
              level="win:Error"
              symbol="FailedXmlToWbxmlConversionEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.FailedXmlToWbxmlConversionEventMessage)"/>

          <event value="219"
              level="win:Informational"
              symbol="ClientProtocolVersionEvent"
              template="SingleString"
              message="$(string.OmaDmClient.ClientProtocolVersionEventMessage)"/>

          <event value="220"
              level="win:Informational"
              symbol="SuccessfulSyncBodyParsingEvent"
              message="$(string.OmaDmClient.SuccessfulSyncBodyParsingEventMessage)"/>

          <event value="221"
              level="win:Error"
              symbol="FailedSyncBodyParsingEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.FailedSyncBodyParsingEventMessage)"/>

          <event value="222"
              level="win:Informational"
              symbol="SuccesfulSyncHdrParsingEvent"
              message="$(string.OmaDmClient.SuccesfulSyncHdrParsingEventMessage)"/>

          <event value="223"
              level="win:Error"
              symbol="FailedSyncHdrParsingEvent"
               template="SingleDWORD"
              message="$(string.OmaDmClient.FailedSyncHdrParsingEventMessage)"/>

          <event value="224"
              level="win:Informational"
              symbol="SuccessfulWbxmlToXmlConversionEvent"
              message="$(string.OmaDmClient.SuccessfulWbxmlToXmlConversionEventMessage)"/>

          <event value="225"
              level="win:Error"
              symbol="FailedWbxmlToXmlConversionEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.FailedWbxmlToXmlConversionEventMessage)"/>

          <event value="226"
              level="win:Error"
              symbol="FailedToAuthenticateServerEvent"
              message="$(string.OmaDmClient.FailedToAuthenticateServerEventMessage)"/>

          <event value="227"
              level="win:Informational"
              symbol="SuccessfulServerAuthenticationEvent"
              message="$(string.OmaDmClient.SuccessfulServerAuthenticationEventMessage)"/>

          <event value="228"
              level="win:Informational"
              symbol="ServerNonceSavedSuccessfullyEvent"
              message="$(string.OmaDmClient.ServerNonceSavedSuccessfullyEventMessage)"/>

          <event value="229"
              level="win:Informational"
              symbol="SubscribingToPRLStateChangesEvent"
              message="$(string.OmaDmClient.SubscribingToPRLStateChangesEventMessage)"/>

          <event value="230"
              level="win:Error"
              symbol="ClientInitiatedSessionMissingInfoEvent"
              message="$(string.OmaDmClient.ClientInitiatedSessionMissingInfoEventMessage)"/>

          <event value="231"
              level="win:Error"
              symbol="PrematureSessionAbortEvent"
              message="$(string.OmaDmClient.PrematureSessionAbortEventMessage)"/>

          <event value="232"
              level="win:Informational"
              symbol="SessionCompletedNormallyEvent"
              message="$(string.OmaDmClient.SessionCompletedNormallyEventMessage)"/>

          <event value="233"
              level="win:Informational"
              symbol="WaitingForCSPProcessingCompletedEvent"
              message="$(string.OmaDmClient.WaitingForCSPProcessingCompletedEventMessage)"/>

          <event value="234"
              level="win:Informational"
              symbol="TurningRadioOffEvent"
              message="$(string.OmaDmClient.TurningRadioOffEventMessage)"/>

          <event value="235"
              level="win:Informational"
              symbol="TurningRadioOnEvent"
              message="$(string.OmaDmClient.TurningRadioOnEventMessage)"/>

          <event value="236"
              level="win:Informational"
              symbol="RadioStateChangeCompletedEvent"
              message="$(string.OmaDmClient.RadioStateChangeCompletedEventMessage)"/>

          <event value="237"
              level="win:Error"
              symbol="ErrorGettingHeapUsageEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.ErrorGettingHeapUsageEventMessage)"/>

          <event value="238"
              level="win:Informational"
              symbol="AttemptingToFindReferencedCertEvent"
              message="$(string.OmaDmClient.AttemptingToFindReferencedCertEventMessage)"/>

          <event value="239"
              level="win:Informational"
              symbol="ReferencedCertFoundEvent"
              message="$(string.OmaDmClient.ReferencedCertFoundEventMessage)"/>

          <event value="240"
              level="win:Informational"
              symbol="ReferencedCertNotFoundEvent"
              message="$(string.OmaDmClient.ReferencedCertNotFoundEventMessage)"/>

          <event value="241"
              level="win:Informational"
              symbol="ClientCertRequiredEvent"
              message="$(string.OmaDmClient.ClientCertRequiredEventMessage)"/>

          <event value="242"
              level="win:Warning"
              symbol="ClientCertMissingEvent"
              message="$(string.OmaDmClient.ClientCertMissingEventMessage)"/>

          <event value="243"
              level="win:Warning"
              symbol="DataTransmissionFailureEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.DataTransmissionFailureEventMessage)"/>

          <event value="244"
              level="win:Informational"
              symbol="AirplaneModeDetectedEvent"
              message="$(string.OmaDmClient.AirplaneModeDetectedEventMessage)"/>

          <event value="245"
              level="win:Informational"
              symbol="LeavingAirplaneModeEvent"
              message="$(string.OmaDmClient.LeavingAirplaneModeEventMessage)"/>

          <event value="246"
              level="win:Informational"
              symbol="PackageSuccessfullySentEvent"
              message="$(string.OmaDmClient.PackageSuccessfullySentEventMessage)"/>

          <event value="247"
              level="win:Warning"
              symbol="ConnectionNotReadyEvent"
              message="$(string.OmaDmClient.ConnectionNotReadyEventMessage)"/>

          <event value="248"
              level="win:Warning"
              symbol="DataTransmissionRetriableEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.DataTransmissionRetriableEventMessage)"/>

          <event value="249"
              level="win:Error"
              symbol="DataTransmissionNotRetriableEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.DataTransmissionNotRetriableEventMessage)"/>

          <event value="250"
              level="win:Error"
              symbol="DataTransmissionExceedsMaxEvent"
              template="TwoDWORDs"
              message="$(string.OmaDmClient.DataTransmissionExceedsMaxEventMessage)"/>

          <event value="251"
              level="win:Informational"
              symbol="ConnectionRetryReasonEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.ConnectionRetryReasonEventMessage)"/>

          <event value="252"
              level="win:Error"
              symbol="ConnectionNotReadyToConnectEvent"
              message="$(string.OmaDmClient.ConnectionNotReadyToConnectEventMessage)"/>

          <event value="253"
              level="win:Error"
              symbol="FailedToOpenHTTPRequestEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.FailedToOpenHTTPRequestEventMessage)"/>

          <event value="254"
              level="win:Verbose"
              template="SingleString"
              symbol="HTTPHeadersSentEvent"/>

          <event value="255"
              level="win:Error"
              symbol="HTTPRequestSendFailedEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.HTTPRequestSendFailedEventMessage)"/>

          <event value="256"
              level="win:Informational"
              symbol="HTTPRequestSendSuccessEvent"/>

          <event value="257"
              level="win:Informational"
              symbol="HTTPSuccessCodeEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.HTTPSuccessCodeEventMessage)"/>

          <event value="258"
              level="win:Warning"
              symbol="HTTPRetriableCodeEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.HTTPRetriableCodeEventMessage)"/>

          <event value="259"
              level="win:Error"
              symbol="HTTPNonRetriableCodeEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.HTTPNonRetriableCodeEventMessage)"/>

          <event value="260"
              level="win:Verbose"
              template="SingleString"
              symbol="ContentTypeHeaderEvent"
              message="$(string.OmaDmClient.ContentTypeHeaderEventMessage)"/>

          <event value="261"
              level="win:Error"
              template="SingleString"
              symbol="UnexpectedContentTypeHeaderEvent"
              message="$(string.OmaDmClient.UnexpectedContentTypeHeaderEventMessage)"/>

          <event value="262"
              level="win:Verbose"
              template="SingleString"
              symbol="ContentLengthHeaderEvent"
              message="$(string.OmaDmClient.ContentLengthHeaderEventMessage)"/>

          <event value="263"
              level="win:Informational"
              symbol="ContentLengthHeaderNotFoundEvent"
              message="$(string.OmaDmClient.ContentLengthHeaderNotFoundEventMessage)"/>

          <event value="264"
              level="win:Error"
              symbol="ErrorGettingContentLengthHeaderEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.ErrorGettingContentLengthHeaderEventMessage)"/>

          <event value="265"
              level="win:Error"
              symbol="SessionAbort407Event"
              message="$(string.OmaDmClient.SessionAbort407EventMessage)"/>

          <event value="266"
              level="win:Verbose"
              symbol="IgnoreOpeningElementEvent"
              template="ThreeStrings"
              message="$(string.OmaDmClient.IgnoreOpeningElementEventMessage)"/>

          <event value="267"
              level="win:Verbose"
              symbol="ParsingOpeningElementEvent"
              template="ThreeStrings"
              message="$(string.OmaDmClient.ParsingOpeningElementEventMessage)"/>

          <event value="268"
              level="win:Error"
              symbol="FailedParsingOpeningElementEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.FailedParsingOpeningElementEventMessage)"/>

          <event value="269"
              level="win:Verbose"
              symbol="IgnoreClosingElementEvent"
              template="ThreeStrings"
              message="$(string.OmaDmClient.IgnoreClosingElementEventMessage)"/>

          <event value="270"
              level="win:Verbose"
              symbol="ParsingClosingElementEvent"
              template="ThreeStrings"
              message="$(string.OmaDmClient.ParsingClosingElementEventMessage)"/>

          <event value="271"
              level="win:Error"
              symbol="FailedParsingClosingElementEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.FailedParsingClosingElementEventMessage)"/>

          <event value="272"
              level="win:Error"
              symbol="FailedProcessingElementContentEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.FailedProcessingElementContentEventMessage)"/>

          <event value="273"
              level="win:Error"
              symbol="FailedParsingElementContentEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.FailedParsingElementContentEventMessage)"/>

          <event value="274"
              level="win:Verbose"
              symbol="IgnoringElementContentEvent"
              template="SingleDWORDAndString"
              message="$(string.OmaDmClient.IgnoringElementContentEventMessage)"/>

          <event value="275"
              level="win:Informational"
              symbol="NewTriggerNotificationEvent"
              message="$(string.OmaDmClient.NewTriggerNotificationEventMessage)"/>

          <event value="276"
              level="win:Error"
              symbol="NoTargetLocUriEvent"
              template="TwoStrings"
              message="$(string.OmaDmClient.NoTargetLocUriEventMessage)"/>

          <event value="277"
              level="win:Error"
              symbol="SessionIdMismatchEvent"
              template="TwoDWORDs"
              message="$(string.OmaDmClient.SessionIdMismatchEventMessage)"/>

          <event value="278"
              level="win:Error"
              symbol="FirstMessageIdMismatchEvent"
              template="SingleDWORD"
              message="$(string.OmaDmClient.FirstMessageIdMismatchEventMessage)"/>

          <event value="279"
              level="win:Error"
              symbol="ServerMessageIncorrectSequenceEvent"
              template="TwoDWORDs"
              message="$(string.OmaDmClient.ServerMessageIncorrectSequenceEventMessage)"/>

          <event value="280"
              level="win:Error"
              symbol="ServerVerNotSupportedEvent"
              template="TwoStrings"
              message="$(string.OmaDmClient.ServerVerNotSupportedEventMessage)"/>

          <event value="281"
              level="win:Error"
              symbol="ServerVerErrorEvent"
              template="TwoStrings"
              message="$(string.OmaDmClient.ServerVerErrorEventMessage)"/>

          <event value="282"
              level="win:Verbose"
              symbol="ServerWbxmlResponseEvent"
              message="$(string.OmaDmClient.ServerWbxmlResponseMessage)"/>

          <event value="283"
              level="win:Verbose"
              symbol="ServerRawDataResponseEvent"
              message="$(string.OmaDmClient.ServerRawDataResponseMessage)"/>

          <event value="284"
              level="win:Verbose"
              symbol="ServerXmlResponseEvent"
              message="$(string.OmaDmClient.ServerXmlResponseMessage)"/>

          <event value="285"
              level="win:Verbose"
              symbol="XmlForServerEvent"
              message="$(string.OmaDmClient.XmlForServerMessage)"/>

          <event value="286"
              level="win:Verbose"
              symbol="WbxmlForServerEvent"
              message="$(string.OmaDmClient.WbxmlForServerMessage)"/>

          <event value="287"
              level="win:Error"
              symbol="InvalidUserAgentEvent"
              template="TwoStrings"
              message="$(string.OmaDmClient.InvalidUserAgentMessage)"/>

          <event value="288"
              level="win:Informational"
              symbol="SessionAbortEvent"
              message="$(string.OmaDmClient.SessionAbortEventMessage)"/>

          <event value="289"
              level="win:Error"
              symbol="UserRejectedSessionInitiationEvent"
              message="$(string.OmaDmClient.UserRejectedSessionInitiationEventMessage)"/>

          <event value="290"
              level="win:Informational"
              symbol="SubscribeToRoamingNotifyEvent"
              message="$(string.OmaDmClient.SubscribeToRoamingNotifyEventMessage)"/>

          <event value="291"
              level="win:Informational"
              symbol="SessionAbortedOnRoamingEvent"
              message="$(string.OmaDmClient.SessionAbortedOnRoamingEventMessage)"/>

          <event value="292"
              level="win:Verbose"
              symbol="OmaDmClientFunctionReturnValueEvent"
              template="FunctionResult"
              message="$(string.OmaDmClient.FunctionReturnValueEventEventMessage)"/>

          <event value="293"
              level="win:Verbose"
              symbol="OmaDmClientFunctionEntryPointEvent"
              template="FunctionIndex"
              message="$(string.OmaDmClient.FunctionEntryPointEventMessage)"/>

          <event value="294"
              level="win:Informational"
              symbol="SessionUsingDataSense"
              template="ThreeDWORDs"
              message="$(string.OmaDmClient.SessionUsingDataSense)"/>

          <event value="295"
              level="win:Informational"
              symbol="SessionNotUsingDataSense"
              template="SingleDWORD"
              message="$(string.OmaDmClient.SessionNotUsingDataSense)"/>

          <event value="296"
              level="win:Error"
              symbol="InformUserFailCreateActionDialogThread"
              template="SingleDWORD"
              message="$(string.OmaDmClient.InformUserFailCreateActionDialogThreadMessage)"/>

          <event value="297"
              level="win:Error"
              symbol="InformUserADEventThreadError"
              template="TwoDWORDs"
              message="$(string.OmaDmClient.InformUserADEventThreadErrorMessage)"/>

          <event value="298"
              level="win:Informational"
              symbol="VerifyServerCredsPrimaryNonce"
              message="$(string.OmaDmClient.VerifyServerCredsPrimaryNonceMessage)"/>

          <event value="299"
              level="win:Informational"
              symbol="VerifyServerCredsSecondaryNonce"
              message="$(string.OmaDmClient.VerifyServerCredsSecondaryNonceMessage)"/>

          <event value="300"
              level="win:Informational"
              symbol="VerifyServerCredsFailMatchHmacServerUsername"
              message="$(string.OmaDmClient.VerifyServerCredsFailMatchHmacServerUsernameMessage)"/>

          <event value="301"
              level="win:Informational"
              symbol="VerifyServerCredsFailMatchHmacCreds"
              template="TwoStrings"
              message="$(string.OmaDmClient.VerifyServerCredsFailMatchHmacCredsMessage)"/>

          <event value="302"
              level="win:Informational"
              symbol="VerifyServerCredsHmacCredsInfo"
              template="TwoStrings"
              message="$(string.OmaDmClient.VerifyServerCredsHmacCredsInfoMessage)"/>

          <event value="303"
              level="win:Informational"
              symbol="SessionSaveNextNonce"
              message="$(string.OmaDmClient.SessionSaveNextNonceMessage)"/>

          <event value="304"
              level="win:Error"
              symbol="SessionAbort401Event"
              message="$(string.OmaDmClient.SessionAbort401EventMessage)"/>

          <event value="305"
              level="win:Error"
              symbol="DataTransmissionDNSResolutionFailure"
              message="$(string.OmaDmClient.DataTransmissionDNSResolutionFailureEventMessage)"/>

          <event value="306"
              level="win:Error"
              symbol="PDCFailure"
              template="SingleStringSingleDWORD"
              message="$(string.OmaDmClient.PDCFailureEventMessage)"/>

          <event value="307"
              level="win:Informational"
              symbol="PDCSuccess"
              template="SingleStringSingleDWORD"
              message="$(string.OmaDmClient.PDCSuccessEventMessage)"/>

        </events>

      </provider>
      
      <provider name="Microsoft-WindowsPhone-EnrollmentClient-Provider"
        guid="{F36F2574-AC04-4A3D-8263-B97DA864B0BC}"
        symbol="WP_ENROLLMENT_CLIENT_PROVIDER"
        messageFileName="EnterpriseEtw.dll"
        resourceFileName="EnterpriseEtw.dll">

        <templates>
          <template tid="SingleString">
            <data name="Message" inType="win:UnicodeString" outType="xs:string"/>
          </template>

          <template tid="SingleStringAndDWORD">
            <data name="Message" inType="win:UnicodeString" outType="xs:string"/>
            <data name="ReturnCode" inType="win:UInt32" outType="xs:unsignedInt"/>
          </template>

          <template tid="SingleDWORD">
            <data name="ReturnCode" inType="win:UInt32" outType="xs:unsignedInt"/>
          </template>

          <template tid="TwoDWORDs">
            <data name="ReturnCode1" inType="win:UInt32" outType="xs:unsignedInt"/>
            <data name="ReturnCode2" inType="win:UInt32" outType="xs:unsignedInt"/>
          </template>

          <template tid="TwoStringsAndDWORD">
            <data name="Message1" inType="win:UnicodeString" outType="xs:string"/>
            <data name="Message2" inType="win:UnicodeString" outType="xs:string"/>
            <data name="ReturnCode" inType="win:UInt32" outType="xs:unsignedInt"/>
          </template>

          <template tid="FourDWORDsAndString">
            <data name="DWORD1" inType="win:UInt32" outType="xs:unsignedInt"/>
            <data name="DWORD2" inType="win:UInt32" outType="xs:unsignedInt"/>
            <data name="DWORD3" inType="win:UInt32" outType="xs:unsignedInt"/>
            <data name="DWORD4" inType="win:UInt32" outType="xs:unsignedInt"/>
            <data name="Message" inType="win:UnicodeString" outType="xs:string"/>
          </template>
        </templates>

        <events>
          <event value="1"
              level="win:Informational"
              symbol="EnrollmentClientStartedEvent"
              message="$(string.EnrollmentClient.EnrollmentClientStartedEventMessage)"/>

          <event value="2"
              level="win:Informational"
              symbol="EnrollmentClientCommandLineEvent"
              template="TwoStringsAndDWORD"
              message="$(string.EnrollmentClient.EnrollmentClientCommandLineEventMessage)"/>

          <event value="3"
              level="win:Informational"
              symbol="OmaDmSessionStartedEvent"
              template="SingleStringAndDWORD"
              message="$(string.EnrollmentClient.OmaDmSessionStartedEventMessage)"/>

          <event value="4"
              level="win:Error"
              symbol="StoringPasswordInVaultFailedEvent"
              template="SingleDWORD"
              message="$(string.EnrollmentClient.StoringPasswordInVaultFailedEventMessage)"/>

          <event value="5"
              level="win:Error"
              symbol="StartingEnrollmentFailedEvent"
              template="SingleDWORD"
              message="$(string.EnrollmentClient.StartingEnrollmentFailedEventMessage)"/>

          <event value="6"
              level="win:Informational"
              symbol="WaitForEnrollmentToFinishEvent"
              message="$(string.EnrollmentClient.WaitForEnrollmentToFinishEventMessage)"/>

          <event value="7"
              level="win:Error"
              symbol="RemovingPasswordFromVaultFailedEvent"
              template="SingleDWORD"
              message="$(string.EnrollmentClient.RemovingPasswordFromVaultFailedEventMessage)"/>

          <event value="8"
              level="win:Error"
              symbol="OpeningVaultFailedEvent"
              template="SingleDWORD"
              message="$(string.EnrollmentClient.OpeningVaultFailedEventMessage)"/>

          <event value="9"
              level="win:Error"
              symbol="ClosingVaultFailedEvent"
              template="SingleDWORD"
              message="$(string.EnrollmentClient.ClosingVaultFailedEventMessage)"/>

          <event value="10"
              level="win:Verbose"
              symbol="EnrollmentCallbackStatusEvent"
              template="TwoDWORDs"
              message="$(string.EnrollmentClient.EnrollmentCallbackStatusEventMessage)"/>

          <event value="11"
              level="win:Verbose"
              symbol="UnenrollmentCallbackStatusEvent"
              template="TwoDWORDs"
              message="$(string.EnrollmentClient.UnenrollmentCallbackStatusEventMessage)"/>

          <event value="12"
              level="win:Informational"
              symbol="EnrollmentClientStoppedEvent"
              template="SingleDWORD"
              message="$(string.EnrollmentClient.EnrollmentClientStoppedEventMessage)"/>
        </events>
      </provider>

    </events>

  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <!--This is how event data can be used as part of Message String -->

        <!--Maps string definitions -->
        <!--  Function Index  -->
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.1.FunctionName"
              value="CSyncMLSession::InitSession"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.2.FunctionName"
              value="CSyncMLSession::ReleaseWinInetHandles"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.3.FunctionName"
              value="CSyncMLSession::InternalInitSession"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.4.FunctionName"
              value="CSyncMLSession::StoreServerLastTime"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.5.FunctionName"
              value="CSyncMLSession::ReloadAccountInfo"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.6.FunctionName"
              value="CSyncMLSession::RunSyncMLSession"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.7.FunctionName"
              value="CSyncMLSession::LogMemoryStatus"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.8.FunctionName"
              value="CSyncMLSession::SendPackage"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.9.FunctionName"
              value="CSyncMLSession::WaitOnReadyToRetryConnect"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.10.FunctionName"
              value="CSyncMLSession::SendData"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.11.FunctionName"
              value="CSyncMLSession::InitializeWinInet"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.12.FunctionName"
              value="CSyncMLSession::GetServerData"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.13.FunctionName"
              value="CSyncMLSession::ProcessDPUResults"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.14.FunctionName"
              value="CSyncMLSession::HandleElementContent"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.15.FunctionName"
              value="CSyncMLSession::characters"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.16.FunctionName"
              value="CSyncMLSession::GetNodeData"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.17.FunctionName"
              value="CSyncMLSession::GetDevInfoData"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.18.FunctionName"
              value="CSyncMLSession::CreatePackage1"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.19.FunctionName"
              value="CSyncMLSession::SetPackageParts"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.20.FunctionName"
              value="CSyncMLSession::CreateResultsSMSMsg"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.21.FunctionName"
              value="CSyncMLSession::VerifySyncHdrData"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.22.FunctionName"
              value="CSyncMLSession::UpdateServerAuthState"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.23.FunctionName"
              value="CSyncMLSession::SwapServerNonces"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.24.FunctionName"
              value="CSyncMLSession::VerifyServerCreds"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.25.FunctionName"
              value="CSyncMLSession::TranslateServerData"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.26.FunctionName"
              value="CSyncMLSession::ProcessSyncHdr"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.27.FunctionName"
              value="CSyncMLSession::ProcessSyncBody"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.28.FunctionName"
              value="CSyncMLSession::ExtractSyncBody"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.29.FunctionName"
              value="CSyncMLSession::PreProcessConnURI"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.30.FunctionName"
              value="CSyncMLSession::SetClientVersion"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.31.FunctionName"
              value="CSyncMLSession::SaveProtoVer"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.32.FunctionName"
              value="CSyncMLSession::ClearUseDefaultNonceFlag"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.33.FunctionName"
              value="CSyncMLSession::BuildUpPackage"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.34.FunctionName"
              value="CSyncMLSession::LoadInitiationIDs"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.35.FunctionName"
              value="CSyncMLSession::NotifySessionState"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.36.FunctionName"
              value="CSyncMLSession::NotifySessionResult"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.37.FunctionName"
              value="CSyncMLSession::NotifyAlertStatuses"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.38.FunctionName"
              value="CSyncMLSession::GenerateClientAlertXml"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.39.FunctionName"
              value="CSyncMLSession::ValidateAcctParameters"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.40.FunctionName"
              value="CSyncMLSession::ValidateAcctParam"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.41.FunctionName"
              value="CSyncMLSession::HandleFailurePackage"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.42.FunctionName"
              value="CSyncMLSession::HandleClientAuthFailure"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.43.FunctionName"
              value="CSyncMLSession::HandleServerAuthFailure"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.44.FunctionName"
              value="CSyncMLSession::FormulateResponseToServer"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.45.FunctionName"
              value="CSyncMLSession::GetSslClientCert"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.46.FunctionName"
              value="CSyncMLSession::ClearAcctData"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.47.FunctionName"
              value="CSyncMLSession::GetSslClientCertReference"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.48.FunctionName"
              value="CSyncMLSession::FindReferencedCert"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.49.FunctionName"
              value="CSyncMLSession::GetFirstSslClientCertStore"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.50.FunctionName"
              value="CSyncMLSession::GetNextSslClientCertStore"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.51.FunctionName"
              value="CSyncMLSession::ParseSslClientCertSearchCriteria"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.52.FunctionName"
              value="CSyncMLSession::ParseSslClientCertSubjectCriteria"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.53.FunctionName"
              value="CSyncMLSession::ParseSslClientCertStoresCriteria"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.54.FunctionName"
              value="CSyncMLSession::ParseStoreInfo"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.55.FunctionName"
              value="CSyncMLSession::TransferStoreNames"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.56.FunctionName"
              value="CSyncMLSession::SaveSslClientCertReference"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.57.FunctionName"
              value="CSyncMLSession::GenerateCertID"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.58.FunctionName"
              value="CSyncMLSession::ValidateCertSubject"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.59.FunctionName"
              value="CSyncMLSession::ShouldBoostConnectionPriority"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.60.FunctionName"
              value="CSyncMLSession::GetAdvancedActivationProxySetting"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.61.FunctionName"
              value="CSyncMLSession::CreateAdvancedUserAgent"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.62.FunctionName"
              value="CSyncMLSession::GetUserPermission"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.63.FunctionName"
              value="CSyncMLSession::InformUser"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.64.FunctionName"
              value="CSyncMLSession::InformUserADThreadProc"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.65.FunctionName"
              value="CSyncMLSession::CreateCred"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.66.FunctionName"
              value="CSyncMLSession::GetCredForBasic"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.67.FunctionName"
              value="CSyncMLSession::GetCredForHMAC"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.68.FunctionName"
              value="CSyncMLSession::GetCredForMD5"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.69.FunctionName"
              value="CSyncMLSession::CalcHMACCredHashWorker"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.70.FunctionName"
              value="CSyncMLSession::CalcMD5CredHash"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.71.FunctionName"
              value="CSyncMLSession::HashFromUnicode"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.72.FunctionName"
              value="CSyncMLSession::SaveNextNonce"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.73.FunctionName"
              value="CSyncMLSession::GenerateNewNonce"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.74.FunctionName"
              value="ConnMgrNotificationWrapper::ConnMgrNotificationWrapper"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.75.FunctionName"
              value="ConnMgrNotificationWrapper::~ConnMgrNotificationWrapper"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.76.FunctionName"
              value="ConnMgrNotificationWrapper::Init"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.77.FunctionName"
              value="ConnMgrNotificationWrapper::Close"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.78.FunctionName"
              value="ConnMgrNotificationWrapper::GetRetryReason"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.79.FunctionName"
              value="ConnMgrNotificationWrapper::ProcessNotifications"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.80.FunctionName"
              value="ConnMgrNotificationWrapper::WaitForNotifications"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.81.FunctionName"
              value="CmdLineFileName"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.82.FunctionName"
              value="WinMain"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.83.FunctionName"
              value="ReadBoundedDwordRegValue"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.84.FunctionName"
              value="GetProcessMemorySize"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.85.FunctionName"
              value="LogInvalidUserAgentToken"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.86.FunctionName"
              value="RegDeleteModelessUIKeyValue"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.87.FunctionName"
              value="CSyncMLSession::startElement"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.88.FunctionName"
              value="CSyncMLSession::endElement"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.89.FunctionName"
              value="ReAllocPtr"/>
        <string id="OmaDmClient.map.OMADMClientFunctionIndex.90.FunctionName"
              value="StartSession"/>

        <!--New Event and Trace string definitions -->
        <string id="OmaDmClient.SessionAbortReceivedEventMessage"
            value="Session abort notification received."/>
        <string id="OmaDmClient.PRLOrStateRegKeyChangeEventMessage"
            value="CDMA PRL or Activation State registry key has changed."/>
        <string id="OmaDmClient.PRLRegKeyChangeEventMessage"
            value="CDMA PRL registry key has changed."/>
        <string id="OmaDmClient.ActivationStateRegKeyChangeEventMessage"
            value="CDMA Activation state registry key has changed."/>
        <string id="OmaDmClient.CantNotifyWaitingThreadEventMessage"
            value="Can't notify the waiting thread about radio mode change."/>
        <string id="OmaDmClient.BackingOffEventMessage"
            value="Backing off for %1 milliseconds."/>
        <string id="OmaDmClient.CertificateStoreDoesntExistEventMessage"
            value="Certificate store doesn't exist. Exiting early."/>
        <string id="OmaDmClient.SessionAbortTooManyServerAuthFailuresEventMessage"
            value="Aborting session due to server auth failure after max retry attempts."/>
        <string id="OmaDmClient.SessionAbortToRetryServerAuthFailuresEventMessage"
            value="About to retry transmission (attempt %1/%2) due to server authentication failure."/>
        <string id="OmaDmClient.SessionAbortToRetryClientAuthFailuresEventMessage"
            value="About to retry transmission (attempt %1/%2) due to client authentication failure."/>
        <string id="OmaDmClient.SessionAbortTooManyClientAuthFailuresEventMessage"
            value="Aborting session due to client auth failure after max retry attempts."/>
        <string id="OmaDmClient.SessionAbortNotMeetingProviderRequirementsEventMessage"
            value="Aborting session due to client auth failure after not meeting provider specific requirements."/>
        <string id="OmaDmClient.InvalidServerSyncHdrEventMessage"
            value="Aborting session due to invalid server SyncHdr after max retry attempts."/>
        <string id="OmaDmClient.RetryTransmissionInvalidServerSyncHdrEventMessage"
            value="About to retry transmission (attempt %1/%2) due to invalid server SyncHdr."/>
        <string id="OmaDmClient.InvalidAccountParameterEventMessage"
            value="Invalid account parameter (param index = %1; appauth index = %1)."/>
        <string id="OmaDmClient.InvalidAccountDataEventMessage"
            value="Invalid account data. Server ID, role, address, server pw, and server nonce must have been set."/>
        <string id="OmaDmClient.UnsupportedEncodingTypeEventMessage"
            value="Unsupported encoding type (%1)."/>
        <string id="OmaDmClient.SuccessfulXmlToWbxmlConversionEventMessage"
            value="Successful XML->WBXML conversion."/>
        <string id="OmaDmClient.FailedXmlToWbxmlConversionEventMessage"
             value="Failed XML->WBXML conversion (%1)."/>
        <string id="OmaDmClient.ClientProtocolVersionEventMessage"
             value="Client is now set to use protocol version %1."/>
        <string id="OmaDmClient.SuccessfulSyncBodyParsingEventMessage"
             value="Successfully parsed server's SyncBody."/>
        <string id="OmaDmClient.FailedSyncBodyParsingEventMessage"
             value="Failed to process server package's SyncBody (%1)"/>
        <string id="OmaDmClient.SuccesfulSyncHdrParsingEventMessage"
             value="Successfully parsed server's SyncHdr."/>
        <string id="OmaDmClient.FailedSyncHdrParsingEventMessage"
             value="Failed to parse SyncHdr (%1)."/>
        <string id="OmaDmClient.SuccessfulWbxmlToXmlConversionEventMessage"
            value="Successful WBXML->XML conversion."/>
        <string id="OmaDmClient.FailedWbxmlToXmlConversionEventMessage"
             value="Failed WBXML->XML conversion (%1)."/>
        <string id="OmaDmClient.FailedToAuthenticateServerEventMessage"
             value="Failed to authenticate the server."/>
        <string id="OmaDmClient.SuccessfulServerAuthenticationEventMessage"
             value="Authenticated the server successfully."/>
        <string id="OmaDmClient.ServerNonceSavedSuccessfullyEventMessage"
             value="New server nonce saved successfully."/>
        <string id="OmaDmClient.SubscribingToPRLStateChangesEventMessage"
             value="Subscribing to CDMA PRL/State registry key changes."/>
        <string id="OmaDmClient.ClientInitiatedSessionMissingInfoEventMessage"
             value="Client-initiated session has no initiation information. Exiting."/>
        <string id="OmaDmClient.PrematureSessionAbortEventMessage"
             value="DM session aborted prematurely."/>
        <string id="OmaDmClient.SessionCompletedNormallyEventMessage"
             value="OMA-DM session completed normally."/>
        <string id="OmaDmClient.WaitingForCSPProcessingCompletedEventMessage"
             value="Waiting for CSP processing to be complete."/>
        <string id="OmaDmClient.TurningRadioOffEventMessage"
             value="Turning the radio off."/>
        <string id="OmaDmClient.TurningRadioOnEventMessage"
             value="Turning the radio on."/>
        <string id="OmaDmClient.RadioStateChangeCompletedEventMessage"
             value="Radio state change completed."/>
        <string id="OmaDmClient.ErrorGettingHeapUsageEventMessage"
             value="Not able to get process' heap usage. Error = %1."/>
        <string id="OmaDmClient.AttemptingToFindReferencedCertEventMessage"
             value="Attempting to find referenced cert."/>
        <string id="OmaDmClient.ReferencedCertFoundEventMessage"
             value="Found referenced cert."/>
        <string id="OmaDmClient.ReferencedCertNotFoundEventMessage"
             value="Referenced cert not found (which is OK)."/>
        <string id="OmaDmClient.ClientCertRequiredEventMessage"
             value="Data transmission requires client cert authentication."/>
        <string id="OmaDmClient.ClientCertMissingEventMessage"
             value="No client cert to authenticate client with."/>
        <string id="OmaDmClient.DataTransmissionFailureEventMessage"
             value="Data transmission failed with retriable error = %1."/>
        <string id="OmaDmClient.AirplaneModeDetectedEventMessage"
             value="Airplane mode detected. Waiting for it to end."/>
        <string id="OmaDmClient.LeavingAirplaneModeEventMessage"
             value="Leaving airplane mode."/>
        <string id="OmaDmClient.PackageSuccessfullySentEventMessage"
             value="Package successfully sent."/>
        <string id="OmaDmClient.ConnectionNotReadyEventMessage"
             value="Connection is not ready. Will retry when ready."/>
        <string id="OmaDmClient.DataTransmissionRetriableEventMessage"
             value="Data transmission failure is retriable (%1)."/>
        <string id="OmaDmClient.DataTransmissionNotRetriableEventMessage"
             value="Data transmission failure is not retriable (%1)."/>
        <string id="OmaDmClient.DataTransmissionExceedsMaxEventMessage"
             value="Number of data transmission attempts (%1) exceeds max (%2)."/>
        <string id="OmaDmClient.ConnectionRetryReasonEventMessage"
             value="Connection retry reason: %1."/>
        <string id="OmaDmClient.ConnectionNotReadyToConnectEventMessage"
             value="Connection is still not ready to connect after waiting."/>
        <string id="OmaDmClient.FailedToOpenHTTPRequestEventMessage"
             value="Failed opening an HTTP request to the server (%1)."/>
        <string id="OmaDmClient.HTTPHeadersSentEventMessage"
             value="Additional headers sent to server = %1."/>
        <string id="OmaDmClient.HTTPRequestSendFailedEventMessage"
             value="Failed sending an HTTP request to the server %1."/>
        <string id="OmaDmClient.HTTPRequestSendSuccessEventMessage"
             value="Successfully sent data to server."/>
        <string id="OmaDmClient.HTTPSuccessCodeEventMessage"
              value="Server returned success HTTP status code (%1)."/>
        <string id="OmaDmClient.HTTPRetriableCodeEventMessage"
              value="Server returned retriable HTTP status code (%1)."/>
        <string id="OmaDmClient.HTTPNonRetriableCodeEventMessage"
              value="Server returned nonretriable HTTP status code (%1)."/>
        <string id="OmaDmClient.ContentTypeHeaderEventMessage"
              value="Server package's Content-Type header = %1."/>
        <string id="OmaDmClient.UnexpectedContentTypeHeaderEventMessage"
              value="Server returned unexpected Content-Type header (%1)."/>
        <string id="OmaDmClient.ContentLengthHeaderEventMessage"
              value="Server package's Content-Length header = %1."/>
        <string id="OmaDmClient.ContentLengthHeaderNotFoundEventMessage"
              value="Server package's Content-Length header was not found."/>
        <string id="OmaDmClient.ErrorGettingContentLengthHeaderEventMessage"
              value="Error returned querying for server package's Content-Length header = %1."/>
        <string id="OmaDmClient.SessionAbort407EventMessage"
              value="Aborting session due to server Status code of 407."/>
        <string id="OmaDmClient.IgnoreOpeningElementEventMessage"
              value="Ignoring opening element (%1, %2, %3)."/>
        <string id="OmaDmClient.ParsingOpeningElementEventMessage"
              value="Parsing opening element (%1, %2, %3)."/>
        <string id="OmaDmClient.FailedParsingOpeningElementEventMessage"
              value="Failed to parse opening element (%1)."/>
        <string id="OmaDmClient.IgnoreClosingElementEventMessage"
              value="Ignoring closing element (%1, %2, %3)."/>
        <string id="OmaDmClient.ParsingClosingElementEventMessage"
              value="Parsing closing element (%1, %2, %3)."/>
        <string id="OmaDmClient.FailedParsingClosingElementEventMessage"
              value="Failed to parse closing element (%1)."/>
        <string id="OmaDmClient.FailedProcessingElementContentEventMessage"
              value="Failed to process element contents (%1)."/>
        <string id="OmaDmClient.FailedParsingElementContentEventMessage"
              value="Failed to parse element contents (%1)."/>
        <string id="OmaDmClient.IgnoringElementContentEventMessage"
              value="Ignoring element contents (%1 characters, '%2')."/>
        <string id="OmaDmClient.NewTriggerNotificationEventMessage"
              value="New trigger notification processing."/>
        <string id="OmaDmClient.NoTargetLocUriEventMessage"
              value="Server did not send a Target LocURI (%1) matching the device's ID (%2)."/>
        <string id="OmaDmClient.SessionIdMismatchEventMessage"
              value="Server's session ID (%1) does not match value expected (%2)."/>
        <string id="OmaDmClient.FirstMessageIdMismatchEventMessage"
              value="First server message ID MUST start at 1 (server sent %1)."/>
        <string id="OmaDmClient.ServerMessageIncorrectSequenceEventMessage"
              value="Server message ID is not monotonically increasing (old = %1; new = %2)."/>
        <string id="OmaDmClient.ServerVerNotSupportedEventMessage"
              value="Server's VerDTD (%1) or VerProto (%2) is not supported."/>
        <string id="OmaDmClient.ServerVerErrorEventMessage"
              value="Server did not specify VerDTD (%1) or VerProto (%2)."/>
        <string id="OmaDmClient.ServerWbxmlResponseMessage"
              value="Server response (WBXML) ="/>
        <string id="OmaDmClient.ServerRawDataResponseMessage"
              value="Server response (raw data) ="/>
        <string id="OmaDmClient.ServerXmlResponseMessage"
              value="Server response (XML) = "/>
        <string id="OmaDmClient.XmlForServerMessage"
              value="XML for server ="/>
        <string id="OmaDmClient.WbxmlForServerMessage"
              value="WBXML for server ="/>
        <string id="OmaDmClient.InvalidUserAgentMessage"
              value="Token (%1) representing (%2) part of User-Agent string is invalid."/>
        <string id="OmaDmClient.SessionAbortEventMessage"
              value="Aborting OMA-DM session execution, likely due to user cancellation."/>
        <string id="OmaDmClient.UserRejectedSessionInitiationEventMessage"
              value="User rejected session initiation."/>
        <string id="OmaDmClient.SubscribeToRoamingNotifyEventMessage"
              value="Subscribe to roaming status registry notification."/>
        <string id="OmaDmClient.SessionAbortedOnRoamingEventMessage"
              value="Session aborted due to roaming."/>
        <string id="OmaDmClient.FunctionReturnValueEventEventMessage"
              value="Return value from function %1. HR = %2."/>
        <string id="OmaDmClient.FunctionEntryPointEventMessage"
              value="Function entry - %1"/>
        <string id="OmaDmClient.SessionNotUsingDataSense"
              value="OMA-DM session is not using Data Sense: Initiation origin (%1)."/>
        <string id="OmaDmClient.SessionUsingDataSense"
              value="OMA-DM session is using Data Sense: hresult (%1), Initiation origin (%2), data sense plan usage state (%3)."/>
        <string id="OmaDmClient.InformUserFailCreateActionDialogThreadMessage"
              value="Inform User failed to create action dialog event thread : hresult (%1)."/>
        <string id="OmaDmClient.InformUserADEventThreadErrorMessage"
              value="Inform User event thread terminated due to error. HResult=%1, Line number: %2."/>
        <string id="OmaDmClient.VerifyServerCredsPrimaryNonceMessage"
              value="VerifyServerCreds uses primary nonce. Nonce="/>
        <string id="OmaDmClient.VerifyServerCredsSecondaryNonceMessage"
              value="VerifyServerCreds uses secondary nonce. Nonce="/>
        <string id="OmaDmClient.VerifyServerCredsFailMatchHmacServerUsernameMessage"
              value="VerifyServerCreds failed to verify server username with the username form HTTP header."/>
        <string id="OmaDmClient.VerifyServerCredsFailMatchHmacCredsMessage"
              value="VerifyServerCreds failed to match HMAC credentials. Creds from header=%1 Creds calculated=%2"/>
        <string id="OmaDmClient.VerifyServerCredsHmacCredsInfoMessage"
              value="VerifyServerCreds credential info from header. Server username=%1 Server PW=%2"/>
        <string id="OmaDmClient.SessionSaveNextNonceMessage"
              value="OMA-DM session is saving next nonce. Nonce="/>
        <string id="OmaDmClient.SessionAbort401EventMessage"
              value="Aborting session due to server Status code of 401."/>
        <string id="OmaDmClient.DataTransmissionDNSResolutionFailureEventMessage"
             value="DNS Resolution failed.."/>
        <string id="OmaDmClient.OmaDmXmlVerboseTrace"
            value="DMTrace: %1"/>
        <string id="OmaDmClient.PDCFailureEventMessage"
            value="OMA-DM PDC activity (%1) failed with NTERROR (%2)"/>
        <string id="OmaDmClient.PDCSuccessEventMessage"
            value="OMA-DM PDC activity (%1) succeeded with pdchandle (%2)"/>

        <string id="EnrollmentClient.EnrollmentClientStartedEventMessage"
            value="Enrollment client executable is starting."/>
        <string id="EnrollmentClient.EnrollmentClientCommandLineEventMessage"
            value="GetCommandLine() = (%1), lpCmdLine = (%2), hr = (%3)."/>
        <string id="EnrollmentClient.OmaDmSessionStartedEventMessage"
            value="OMA-DM session for server (%1) was started and it returned (%2)."/>
        <string id="EnrollmentClient.EnrollmentClientStoppedEventMessage"
            value="Enrollment client executable is finishing with hr = (%1)."/>
        <string id="EnrollmentClient.StoringPasswordInVaultFailedEventMessage"
            value="Storing password in vault failed with hr = (%1)."/>
        <string id="EnrollmentClient.StartingEnrollmentFailedEventMessage"
            value="Starting the enrollment sequence failed with hr = (%1)."/>
        <string id="EnrollmentClient.WaitForEnrollmentToFinishEventMessage"
            value="Waiting for the enrollment/unenrollment sequence to finish."/>
        <string id="EnrollmentClient.RemovingPasswordFromVaultFailedEventMessage"
            value="Removing the password from vault failed with hr = (%1)."/>
        <string id="EnrollmentClient.OpeningVaultFailedEventMessage"
            value="Opening the vault failed with hr = (%1)."/>
        <string id="EnrollmentClient.ClosingVaultFailedEventMessage"
            value="Closing the vault failed with hr = (%1)."/>
        <string id="EnrollmentClient.EnrollmentCallbackStatusEventMessage"
            value="Enrollment step (%1) has a status (%2)."/>
        <string id="EnrollmentClient.UnenrollmentCallbackStatusEventMessage"
            value="Unenrollment step (%1) has a status (%2)."/>
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
