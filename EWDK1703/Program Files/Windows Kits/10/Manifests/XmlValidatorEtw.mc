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
      <provider name="Microsoft-WindowsPhone-WEHXMLValidator-Provider"
          guid="{1F8EC715-A6DF-4043-B5BB-73445F10FA72}"
          symbol="WP_WEHXMLValidator_PROVIDER"
          messageFileName="WEHXMLValidatorEtw.mc"
          resourceFileName="WEHXMLValidatoreng.rc">

        <maps>
          <valueMap name="WEHXMLValidatorFunctionIndex">
            <!-- Please append new function entry to the end. Don't change the function index. -->
            <!-- Please also add the new function name to corresponding string id. -->
            <map value="1"
                 message="$(string.WEHXMLValidator.WEHXMLValidatorFunctionIndex.1.FunctionName)"/>
           
              <!-- Please append new function entry to the end. Don't change the function index. -->
          </valueMap>
        </maps>

        <templates>

          <template tid="SingleDWORD">
            <data name="Prop_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="TwoDWORD">
            <data name="Prop1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Prop2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="ThreeDWORD">
            <data name="Prop1_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Prop2_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Prop3_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="SingleStringSingleDWORD">
            <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string" />
            <data name="Prop_UInt32" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="SingleString">
            <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="FunctionIndex">
            <data name="Prop_UInt32_1" inType="win:UInt32" map="WEHXMLValidatorFunctionIndex" />
          </template>

          <template tid="FunctionResult">
            <data name="Prop_UInt32_1" inType="win:UInt32" map="WEHXMLValidatorFunctionIndex" />
            <data name="Prop_UInt32_2" inType="win:UInt32" outType="xs:HexInt32" />
          </template>

          <template tid="SingleStringThreeDWORD">
            <data name="Prop_UnicodeString" inType="win:UnicodeString" outType="xs:string" />
            <data name="Prop_UInt32_1" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="Prop_UInt32_2" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Prop_UInt32_3" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

        </templates>

        <events>

          <event value="1"
          level="win:Verbose"
          symbol="FunctionEntryPointEvent"
          template="FunctionIndex"
          message="$(string.WEHXMLValidator.FunctionEntryPointEventMessage)"/>

          <event value="2"
          level="win:Verbose"
          symbol="FunctionReturnValueEvent"
          template="FunctionResult"
          message="$(string.WEHXMLValidator.FunctionReturnValueEventEventMessage)"/>

          <event value="4"
              level="win:Error"
              template="SingleStringThreeDWORD"
              symbol="XmlValidatorError"
              message="$(string.WEHXMLValidator.XmlValidatorErrorMessage)"/>

        

      </events>
      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="WEHXMLValidator.FunctionReturnValueEventEventMessage"
              value="Return value from function %1. HR = %2."/>
        <string id="WEHXMLValidator.FunctionEntryPointEventMessage"
              value="Function entry - %1"/>

        <string id="WEHXMLValidator.WEHXMLValidatorFunctionIndex.1.FunctionName"
              value="XmlValidator::ValidateXml"/>
        <string id="WEHXMLValidator.XmlValidatorErrorMessage"
              value="Xml validation failed with error : (%1) with a hr value of (%2) at line : (%3) at position (%4)"/>       

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
