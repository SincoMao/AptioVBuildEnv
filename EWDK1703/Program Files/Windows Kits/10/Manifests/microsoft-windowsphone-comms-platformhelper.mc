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

      <provider name="Microsoft-WindowsPhone-Comms-PlatformHelper"
          guid="{0f2b3869-4c77-4a50-b443-55e5d34422cc}"
          symbol="MICROSOFT_WINDOWSPHONE_COMMSPlatformHelper"
          messageFileName="CommsPlatformHelperUtil.dll"
          resourceFileName="CommsPlatformHelperUtil.dll">

          <!--No channel info necessary-->
        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword name="Warning" mask="0x0000400000000000" message="$(string.Keyword.Warning)" />
          <keyword name="StateTransition" mask="0x0000800000000000" message="$(string.Keyword.StateTransition)"/>
        </keywords>

        <tasks>
          <task value="1" name="Task1" />
          <task value="2" name="Task2" />
        </tasks>

        <maps>
          <valueMap name="PlatformHelperWatchdogs">
            <map value="0" message="$(string.Enums.WorkQueueTimeout)"/>
          </valueMap>
        </maps>

        <templates>

          <!--Event Template defined for Comms Logging -->
          <template tid="CommsErrorTemplate">
            <data name="P1_HexInt32" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>
          
          <!--Template for failure to remove a directory-->
          <template tid="DirOpFailedTemplate">
            <data name="err" inType="win:HexInt32"/>
            <data name="path" inType="win:UnicodeString"/>
          </template>

          <!--Template for Critical Section events-->
          <template tid="CommsCs_CriticalSection_Error_template">
              <data name="P1_CriticalSection_Name" inType="win:AnsiString" />
              <data name="P2_TimeHeld" inType="win:UInt64" />
              <data name="P3_LockContext" inType="win:AnsiString" />
              <data name="P4_LockCount" inType="win:UInt64" />
          </template>
          
          <template tid="OperationTimedOut">
            <data name="OperationId"         inType="win:UInt32"    map="PlatformHelperWatchdogs"/>
            <data name="OperationContext" inType="win:AnsiString"   outType="xs:string"/>
            <data name="OperationTimeout" inType="win:UInt32"       outType="xs:unsignedInt"/>
            <data name="ElapsedTime"    inType="win:UInt32"         outType="xs:unsignedInt"/>
          </template>
          
          <template tid="OperationTimedOutComplete">
            <data name="OperationId"         inType="win:UInt32"    map="PlatformHelperWatchdogs"/>
            <data name="OperationContext"    inType="win:AnsiString" outType="xs:string"/>
            <data name="OperationActualTime" inType="win:UInt32"    outType="xs:unsignedInt"/>
          </template>
            
        </templates>

        <events>

          <!-- CommsErrorOriginateEvent and CommsErrorPropagateEvent are the default handling of 
          ifErrorReturn and ehm HR logging -->
          <event value="1"
              level="win:Error"
              template="CommsErrorTemplate"
              symbol="CommsErrorOriginateEvent"
              message="$(string.Event.CommsErrorOriginateMessage)"
              keywords="Error"/>

          <event value="2"
              level="win:Warning"
              template="CommsErrorTemplate"
              symbol="CommsErrorPropagateEvent"
              message="$(string.Event.CommsPropagateErrorMessage)"
              keywords="Warning"/>

          <event value="3"
              level="win:Error"
              template="DirOpFailedTemplate"
              symbol="DirOpFailed"
              message="$(string.Event.DirOpFailedMessage)"
              keywords="Error"/>
            
          <!-- Start Critical Section Events -->
          <event value="4"
              level="win:Warning"
              template="CommsCs_CriticalSection_Error_template"
              symbol="CriticalSection_LockHeld_ForExtended_Period"
              message="$(string.Event.CriticalSection_LockHeld_ForExtended_Period)"
              keywords="StateTransition"/>

          <event value="10"
              symbol="OperationTimedOut"
              keywords="Error"
              level="win:Error"
              template="OperationTimedOut"
              message="$(string.Event.OperationTimedOut)"/>

          <event value="11"
              symbol="OperationTimedOutComplete"
              keywords="Error"
              level="win:Error"
              template="OperationTimedOutComplete"
              message="$(string.Event.OperationTimedOutComplete)"/>

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
        <string id="Keyword.Warning"
            value="Warning" />
        <string id="Keyword.StateTransition"
            value="StateTransition" />

        <string id="Event.CommsErrorOriginateMessage"
          value="Error: HRESULT: %1 Location: %2 Line Number: %3"/>
        <string id="Event.CommsPropagateErrorMessage"
          value="Error Propagated: HRESULT: %1 Location: %2 Line Number: %3"/>

        <string id="Event.DirOpFailedMessage"
            value="Directory operation on %1 failed, HRESULT(%2)"/>

        <string id="Event.CriticalSection_LockHeld_ForExtended_Period"
            value="Critical Section %1 was held for %2 ms. Currently in context %3 with lock count %4" />
        
        <string id="Event.OperationTimedOut" 
            value='OperationWatchdog: "%1" timed out.  Context: %2.  Timeout value: %3ms.  Still waiting after: %4ms.'/>
        <string id="Event.OperationTimedOutComplete"
            value='OperationWatchdog: "%1" completed.  Context: %2.  Actual time: %3ms'/>
        
        <string id="Enums.WorkQueueTimeout" value="WorkQueueTimeout"/>
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
