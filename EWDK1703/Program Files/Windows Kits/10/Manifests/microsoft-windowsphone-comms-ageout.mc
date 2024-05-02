<!-- <?xml version="1.0" encoding="UTF-16"?> -->
<instrumentationManifest
            xmlns="http://schemas.microsoft.com/win/2004/08/events"
            xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            xmlns:Comms="http://www.w3.org/2001/XMLSchema">
  <instrumentation>

    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-Comms-AgeOut"
          guid="{2FF2C0ED-4161-4fa6-A694-099ACBACC88F}"
          symbol="WM_COMMS_AGEOUT_PUBLISHER"
          resourceFileName="ageout.dll"
          messageFileName="ageout.dll">

        <!--Event Templates -->
        <templates>

          <!--Event Template defined for Comms Logging -->
          <template tid="CommsHrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>

          <template tid="AGEOUT_UInt32">
            <data name="Prop_UInt32" inType="win:UInt32" />
          </template>
            
        </templates>

        <!--All the Events that can be published by this Publisher -->

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error"/>
          <keyword mask="0x0000000000000002" name="Performance"/>

          <!-- Provider-specific keywords -->
          <keyword mask="0x0000000000000004" name="AgeOut"/>

          <!-- Comms wide keywords; note that mask bit can only be one of the low 48 bits -->
          <keyword mask="0x0000400000000000" name="Warning"/>
        </keywords>


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
              level="win:Informational"
              template="AGEOUT_UInt32"
              symbol="Next_Scheduled_Time"
              message="$(string.Event.Next_Scheduled_Time)"
              keywords="AgeOut"/>

          <event value="1001"
              level="win:Informational"
              symbol="Thread_Exiting"
              message="$(string.Event.Thread_Exiting)"
              keywords="AgeOut"/>

          <event value="1002"
              level="win:Informational"
              symbol="Low_Storage_Received"
              message="$(string.Event.Low_Storage_Received)"
              keywords="AgeOut"/>

          <event value="1003"
              level="win:Informational"
              symbol="Wait_Interval_Elapsed"
              message="$(string.Event.Wait_Interval_Elapsed)"
              keywords="AgeOut"/>

          <event value="1004"
              level="win:Informational"
              template="AGEOUT_UInt32"
              symbol="Got_Battery_State"
              message="$(string.Event.Got_Battery_State)"
              keywords="AgeOut"/>

          <event value="1005"
              level="win:Informational"
              template="AGEOUT_UInt32"
              symbol="Constructor_Set_Previous"
              message="$(string.Event.Constructor_Set_Previous)"
              keywords="AgeOut"/>

          <event value="1006"
              level="win:Informational"
              symbol="AgeOut_Complete"
              message="$(string.Event.AgeOut_Complete)"
              keywords="AgeOut"/>

          <event value="1007"
              level="win:Informational"
              template="AGEOUT_UInt32"
              symbol="Are_Conditions_Met"
              message="$(string.Event.Are_Conditions_Met)"
              keywords="AgeOut"/>

          <event value="2000"
              level="win:Informational"
              symbol="AgeOutDraftMessagesIn"
              message="$(string.Event.AgeOutDraftMessagesInString)"
              keywords="AgeOut"/>

          <event value="2001"
              level="win:Informational"
              symbol="AgeOutDraftMessagesOut"
              message="$(string.Event.AgeOutDraftMessagesOutString)"
              keywords="AgeOut"/>

          <event value="2002"
              level="win:Informational"
              symbol="AgeOutDraftMessagesOutDelete"
              message="$(string.Event.AgeOutDraftMessagesDeleteString)"
              keywords="AgeOut"/>

        </events>

      </provider>

    </events>

  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Event.CommsErrorOriginateMessage"
            value="Error: %1 Location: %2 Line Number: %3"/>    
        <string id="Event.CommsPropagateErrorMessage"
            value="Error Propagated: %1 Location: %2 Line Number: %3"/>
        <string id="Event.Next_Scheduled_Time"
            value="Next scheduled run in %1 minutes"/>
        <string id="Event.Thread_Exiting"
            value="AgeOut thread exiting"/>
        <string id="Event.Low_Storage_Received"
            value="Low storage notification received"/>
        <string id="Event.Wait_Interval_Elapsed"
            value="Time-out interval elapsed"/>
        <string id="Event.Got_Battery_State"
            value="Got Battery State %1"/>
        <string id="Event.Constructor_Set_Previous"
            value="Constructor setting preivous run time, fAggressive: %1"/>
        <string id="Event.AgeOut_Complete"
            value="AgeOut completed processing"/>
        <string id="Event.Are_Conditions_Met"
            value="Conditions Met: %1"/>
        <string id="Event.AgeOutDraftMessagesInString"
            value="AgeOutDraftMessages - In"/>
        <string id="Event.AgeOutDraftMessagesOutString"
            value="AgeOutDraftMessagesOut"/>
        <string id="Event.AgeOutDraftMessagesDeleteString"
            value="AgeOutDraftMessagesDelete"/>

      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>

