<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<!--
Use of this source code is subject to the terms of the Microsoft shared
source or premium shared source license agreement under which you licensed
this source code. If you did not accept the terms of the license agreement,
you are not authorized to use this source code. For the terms of the license,
please see the license agreement between you and Microsoft or, if applicable,
see the SOURCE.RTF on your install media or the root of your tools installation.
THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
-->
<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>
    <events>

      <provider name="Microsoft-WindowsPhone-Comms-LoggingSample"
          guid="{9B9004BD-151E-4a91-94CE-1FCC7ECC7E95}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMSLOGGINGSAMPLE"
          messageFileName="LoggingSample.exe"
          resourceFileName="LoggingSample.exe">

        <!--No channel info necessary-->
        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />

          <!-- Keyword 4 is for using events from Splash via generated code - the value is irrelevant but the name is not -->
          <keyword mask="0x0000000000000004" name="Uix" message="$(string.Keyword.Uix)" />

          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000008" name="MyKeyword" message="$(string.Keyword.MyKeyword)" />

          <!-- Keyword for printf style debug tracing - the name and value are irrelevant - this is just to associate them -->
          <keyword mask="0x0000000000000100" name="debug" message="$(string.Keyword.Debug)"/>

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning" message="$(string.Keyword.Warning)"/>
          <keyword mask="0x0000800000000000" name="StateTransition" message="$(string.Keyword.StateTransition)"/>
        </keywords>

        <tasks>
          <task value="1"   name="Task1" />
          <task value="2"   name="Task2" />
        </tasks>

        <templates>

          <!-- Event Template defined for printf style debug tracing -->
          <template tid="tTraceMessage">
            <data name="Message" inType="win:Pointer"/>
          </template>

          <!-- Event Template defined for Comms Logging -->
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_AnsiString" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

          <template tid="Int_Template">
            <data name="P1_UInt32" inType="win:UInt32" />
          </template>

          <template tid="VariableArrayTemplate">
            <data name="Count" inType="win:UInt32"/>
            <data name="Array" inType="win:UInt32" count="Count"/>
          </template>

          <template tid="Bool_String_Template">
            <data name="P1_Boolean" inType="win:Boolean"/>
            <data name="P2_UnicodeString" inType="win:UnicodeString"/>
          </template>

          <template tid="Everything_Supported_For_Uix_Generated_Events_Template">
            <data name="P1_AnsiString" inType="win:AnsiString"/>
            <data name="P2_UnicodeString" inType="win:UnicodeString"/>
            <data name="P3_Int8" inType="win:Int8"/>
            <data name="P4_UInt8" inType="win:UInt8"/>
            <data name="P5_Int32" inType="win:Int32"/>
            <data name="P6_Int64" inType="win:Int64"/>
            <data name="P7_Float" inType="win:Float"/>
            <data name="P8_Double" inType="win:Double"/>
            <data name="P9_Boolean" inType="win:Boolean"/>
            <data name="P10_HexInt32" inType="win:HexInt32"/>
            <data name="P11_HexInt64" inType="win:HexInt64"/>
          </template>

          <template tid="AllTypes_Template">
            <data name="P1_AnsiString" inType="win:AnsiString"/>
            <data name="P2_UnicodeString" inType="win:UnicodeString"/>
            <data name="P3_Int8" inType="win:Int8"/>
            <data name="P4_UInt8" inType="win:UInt8"/>
            <data name="P5_Int16" inType="win:Int16"/>
            <data name="P6_UInt16" inType="win:UInt16"/>
            <data name="P7_Int32" inType="win:Int32"/>
            <data name="P8_UInt32" inType="win:UInt32"/>
            <data name="P9_Int64" inType="win:Int64"/>
            <data name="P10_UInt64" inType="win:UInt64"/>
            <data name="P11_Float" inType="win:Float"/>
            <data name="P12_Double" inType="win:Double"/>
            <data name="P13_Boolean" inType="win:Boolean"/>
            <data name="P14_Binary" inType="win:Binary" length="P8_UInt32"/>
            <data name="P15_GUID" inType="win:GUID"/>
            <data name="P16_Pointer" inType="win:Pointer"/>
            <data name="P17_FILETIME" inType="win:FILETIME"/>
            <data name="P18_SYSTEMTIME" inType="win:SYSTEMTIME"/>
            <data name="P19_SID" inType="win:SID"/>
            <data name="P20_HexInt32" inType="win:HexInt32"/>
            <data name="P21_HexInt64" inType="win:HexInt64"/>
          </template>
        </templates>

        <events>

          <!-- CommsErrorEvent and CommsErrorPropagateEvent are the default handling of 
          ifErrorReturn and ehm HR logging -->
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


          <!-- The simplest event to define is one with no data payload. -->
          <event value="100"
              symbol="MySimpleEvent"
              keywords="MyKeyword"
              level="win:Informational"
              message="$(string.Event.MySimpleEvent)" />

          <!-- Event with an argument. -->
          <event value="101"
              symbol="MySimpleEvent2"
              keywords="MyKeyword Uix"
              level="win:Informational"
              template="Int_Template"
              message="$(string.Event.MySimpleEvent2)" />

          <event value="102"
              symbol="MyArrayEvent"
              keywords="MyKeyword"
              level="win:Informational"
              template="VariableArrayTemplate"
              message="$(string.Event.MyArrayEvent)" />

          <!-- This is an error event, it has the error keyword and level. -->
          <event value="103"
              symbol="MySimpleError"
              keywords="MyKeyword Error"
              level="win:Error"
              message="$(string.Event.MyErrorEvent)" />          

          <!-- Event for use in UIX -->
          <event value="150"
              symbol="MyUixEvent"
              keywords="Uix"
              level="win:Informational"
              template="Bool_String_Template"
              message="$(string.Event.MyUixEvent)" />
          <event value="151"
              symbol="MyUixEventWithAllTypes"
              keywords=""
              level="win:Informational"
              template="Everything_Supported_For_Uix_Generated_Events_Template"
              message="$(string.Event.MyUixEventWithAllSupportedTypes)" />

          <!-- Start stop events for measuring perf with and without UIX support. -->   
          <event value="200"
              symbol="Task1_START"
              task="Task1"
              keywords="Performance"
              level="win:Informational"
              message="$(string.Event.Task1Start)" />
          <event value="201"
              symbol="Task1_STOP"
              task="Task1"
              keywords="Performance Uix"
              level="win:Informational"
              message="$(string.Event.Task1Stop)" />
          <event value="202"
              symbol="Task2_START"
              task="Task1"
              keywords="Performance Uix"
              level="win:Informational"
              template="Int_Template"
              message="$(string.Event.Task2Start)" />
          <event value="203"
              symbol="Task2_STOP"
              task="Task1"
              keywords="Performance"
              level="win:Informational"
              template="Int_Template"
              message="$(string.Event.Task2Stop)" />

          <!-- State transition events -->
          <event value="300"
              symbol="MySimpleStateTransitionEvent"
              keywords="StateTransition"
              level="win:Informational"
              message="$(string.Event.MySimpleStateTransitionEvent)" />

          <!-- Start events for printf style debug tracing -->
          <event value="10000"
              symbol="_ETWMESSAGE"
              keywords="debug"
              level="win:Verbose"
              template="tTraceMessage" />
          <event value="10001"
              symbol="_MY"
              keywords="MyKeyword"
              level="win:Verbose"
              template="tTraceMessage" />

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
        <string id="Keyword.MyKeyword"
            value="MyKeyword" />
        <string id="Keyword.Uix"
            value="Uix" />
        <string id="Keyword.Debug"
            value="Debug" />
        <string id="Keyword.Warning"
            value="Warning" />
        <string id="Keyword.StateTransition"
            value="StateTransition" />

        <string id="Event.CommsErrorOriginateMessage"
            value="Error: %1 Location: %2 Line Number: %3"/>    
        <string id="Event.CommsPropagateErrorMessage"
            value="Error Propagated: %1 Location: %2 Line Number: %3"/>

        <string id="Event.MySimpleEvent"
            value="Simple Event" />
        <string id="Event.MySimpleEvent2"
            value="Simple Event: %1" />
        <string id="Event.MyArrayEvent"
             value="Count %1: Values: %2" />
        <string id="Event.MyErrorEvent"
            value="Error Event" />
        <string id="Event.MyUixEvent"
            value="Event from splash with bool %1 and string '%2'"/>
        <string id="Event.MyUixEventWithAllSupportedTypes"
            value="Event with everything %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11"/>
        <string id="Event.MyUixEventWithAllTypes"
            value="Event with everything %1 %2 %3 %4 %5 %6 %7 %8 %9 %10 %11 %12 %13 %14 %15 %16 %17 %18 %19 %20 %21"/>
        <string id="Event.MySimpleStateTransitionEvent"
            value="Simple State Transition Event" />

        <string id="Event.Task1Start"
            value="Task 1 Start" />
        <string id="Event.Task1Stop"
            value="Task 1 Stop" />
        <string id="Event.Task2Start"
            value="Task 2 Start, value %1" />
        <string id="Event.Task2Stop"
            value="Task 2 Stop, value %1" />

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
