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

      <!--To avoid spoofing, add provider security settings under
          HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\security

          ** Never log any data which should be protected for security or privacy purposes.
          -->

      <provider name="Microsoft-WindowsPhone-SQLCEETWProvider"
          guid="{44CCC985-1749-4B09-83CC-5A312B5A4F29}"
          symbol="WINDOWSPHONE_SQLCE_ETW_PROVIDER"
          resourceFileName="sqlcese35.dll"
          messageFileName="sqlcese35.dll">

        <channels />


        <!--Keyword masks are 64-bit, of which the lower 48 bits may be used.
            For more information on keyword definitions, please see
            http://msdn.microsoft.com/en-us/library/aa382786(VS.85).aspx
            -->
        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="SQLCE_CRITICAL" message="$(string.Keyword.SQLCE_CRITICAL)" />
          <keyword mask="0x0000000000000008" name="SQLCE_ERROR" message="$(string.Keyword.SQLCE_ERROR)" />
          <keyword mask="0x0000000000000010" name="SQLCE_FLUSH" message="$(string.Keyword.SQLCE_FLUSH)" />
          <keyword mask="0x0000000000000020" name="DEBUG" message="$(string.Keyword.DEBUG)" />
        </keywords>

        <tasks>         
	  <task value="1"   name="NULLFlush" />
          <task value="2"   name="NULLFlush_End" />
          <task value="3"   name="VolumeGrowth" />
          <task value="5"   name="FlushComplete" />
          <task value="6"   name="ShrinkEnd" />
          <task value="7"   name="LogicalBufferCorruption" />
          <task value="8"   name="CommittedCorruption" />
          <task value="9"   name="LockedPageCorruption" />
          <task value="10"  name="PhysicalCorruption" />
          <task value="11"  name="LogicalCorrupt" />
          <task value="13"  name="WorkerThreadFailed" />
          <task value="14"  name="FlushSignalFailed" />
          <task value="15"  name="DatabaseReindexed" />
          <task value="16"  name="IdleViolation" />
          <task value="17"  name="DatabaseOpenedInChamber" />
        </tasks>


        <!--Templates may be shard across multiple events, if they share the same data payload.
            For valid inType / outType combinations, please see the Remarks section in 
            http://msdn.microsoft.com/en-us/library/aa382774(VS.85).aspx
            For more complex data types, please use a tool like EcManGen.exe from the Win7 SDK
            to author manifests
            -->
        <templates>
          <template tid="StringLogErrorTemplate">
            <data name="hrMajor" inType="win:Int32" outType="win:HResult" />
            <data name="hrMinor" inType="win:Int32" outType="win:HResult" />
          </template>

          <template tid="NullFlush">
          </template>

          <template tid="NULL_Flush_End">
            <data name="TimeTaken" inType="win:UInt64" outType="xs:unsignedLong" />
          </template>

          <template tid="Volume_Growth">
            <data name="FileGrowth" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="FinalSize" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="VolumeName" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="Flush_Complete">
            <data name="FlushTime" inType="win:UInt64" outType="xs:unsignedLong" />
            <data name="TotalFlushSizeKB" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="CurrentPayloadKB" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="FileSizeKB" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="FileName" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="Shrink_End">
            <data name="FileReducedKB" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="FileSizeKB" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="FileName" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="LogicalBufferCorruption">
            <data name="PageIDCache" inType="win:UInt32" outType="win:HexInt32" />
            <data name="CachePage" inType="win:UInt32" outType="win:HexInt32" />
            <data name="PhyscalPage" inType="win:UInt32" outType="win:HexInt32" />
            <data name="FileName" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="CommittedCorruption">
            <data name="FileName" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="LockedPageCorruption">
            <data name="FileName" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="PhysicalCorruption">
            <data name="iPage" inType="win:UInt32" outType="win:HexInt32" />
            <data name="PageID" inType="win:UInt32" outType="win:HexInt32" />
            <data name="FileName" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="LogicalCorruption">
            <data name="iPage" inType="win:UInt32" outType="win:HexInt32" />
            <data name="Exp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="Act" inType="win:UInt32" outType="win:HexInt32" />
            <data name="FileName" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="DBReindexTemplate">       
            <data name="DBFile" inType="win:UnicodeString" outType="xs:string" />
            <data name="OldSize" inType="win:UInt32" outType="win:HexInt32" />
            <data name="CurrSize" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="WorkerThreadFailure">
            <data name="LastError" inType="win:Int32"/>
          </template>

          <template tid="WorkerThreadAbandonedMutexException">
            <data name="EventIndex" inType="win:Int32"/>
          </template>

          <template tid="ScheduleFlushSignalFailed">
            <data name="LastError" inType="win:Int32"/>
          </template>

          <template tid="UnmappedErrorCode">
            <data name="LastError" inType="win:Int32"/>
          </template>

          <template tid="Idle_Violation">
            <data name="FileName" inType="win:UnicodeString" outType="xs:string" />
          </template>

          <template tid="DBChamberSIDProcess">       
            <data name="DBFile" inType="win:UnicodeString" outType="xs:string" />
            <data name="ChamberSID" inType="win:UnicodeString" outType="xs:string" />
            <data name="ProcessID" inType="win:UInt32" outType="win:HexInt32" />
          </template>

         <template tid="DBChamberSIDProcessFailed">       
            <data name="DBFile" inType="win:UnicodeString" outType="xs:string" />
            <data name="HResult" inType="win:UInt32" outType="win:HexInt32" />
            <data name="ProcessID" inType="win:UInt32" outType="win:HexInt32" />
          </template>
        </templates>


        <events>
          <event symbol="SQLCE_ERROR_EVENT"
                 value="101"
                 level="win:Error"
                 template="StringLogErrorTemplate"
                 keywords="SQLCE_ERROR"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.101.message)">
          </event>

          <event symbol="SQLCE_FLUSH_EVENT"
                 value="103"
                 level="win:Informational"
                 template="StringLogErrorTemplate"
                 keywords="SQLCE_FLUSH"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.103.message)">
          </event>

          <event symbol="SQLCE_CRITICAL_EVENT"
                 value="104"
                 level="win:Critical"
                 template="StringLogErrorTemplate"
                 keywords="SQLCE_CRITICAL"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.104.message)">
          </event>

          <event symbol="NULL_Flush"
                 value="1"
                 level="win:Error"
                 task="NULLFlush"
                 template="NullFlush"
                 keywords="SQLCE_FLUSH"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.1.message)">
          </event>

          <event symbol="NULL_Flush_End"
                 value="2"
                 level="win:Error"
                 task="NULLFlush_End"
                 template="NULL_Flush_End"
                 keywords="SQLCE_FLUSH"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.2.message)">
          </event>

          <event symbol="Volume_Growth"
                 value="3"
                 level="win:Warning"
                 task="VolumeGrowth"
                 template="Volume_Growth"
                 keywords="SQLCE_FLUSH"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.3.message)">
          </event>

          <event symbol="Flush_Complete"
                 value="5"
                 level="win:Warning"
                 task="FlushComplete"
                 template="Flush_Complete"
                 keywords="SQLCE_FLUSH"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.5.message)">
          </event>

          <event symbol="Shrink_End"
                 value="6"
                 level="win:Warning"
                 task="ShrinkEnd"
                 template="Shrink_End"
                 keywords="SQLCE_FLUSH"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.6.message)">
          </event>

          <event symbol="Logical_Buffer_Corruption"
                 value="7"
                 level="win:Error"
                 task="LogicalBufferCorruption"
                 template="LogicalBufferCorruption"
                 keywords="SQLCE_CRITICAL"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.7.message)">
          </event>

          <event symbol="Committed_Corruption"
                 value="8"
                 level="win:Error"
                 task="CommittedCorruption"
                 template="CommittedCorruption"
                 keywords="SQLCE_CRITICAL"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.8.message)">
          </event>

          <event symbol="Locked_Page_Corruption"
                 value="9"
                 level="win:Error"
                 task="LockedPageCorruption"
                 template="LockedPageCorruption"
                 keywords="SQLCE_CRITICAL"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.9.message)">
          </event>

          <event symbol="Physical_Corruption"
                 value="10"
                 level="win:Error"
                 task="PhysicalCorruption"
                 template="PhysicalCorruption"
                 keywords="SQLCE_CRITICAL"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.10.message)">
          </event>

          <event symbol="Logical_Corruption"
                 value="11"
                 level="win:Error"
                 task="LogicalCorrupt"
                 template="LogicalCorruption"
                 keywords="SQLCE_CRITICAL"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.11.message)">
          </event>

          <event symbol="Worker_Thread_Failure_AbandonedMutexException"
                 value="13"
                 level="win:Error"
                 task="WorkerThreadFailed"
                 template="WorkerThreadAbandonedMutexException"
                 keywords="SQLCE_ERROR"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.13.message)">
          </event>

          <event symbol="Worker_Thread_Failure_Error"
                 value="14"
                 level="win:Error"
                 task="WorkerThreadFailed"
                 template="WorkerThreadFailure"
                 keywords="SQLCE_ERROR"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.14.message)">
          </event>

          <event symbol="ScheduleFlush_EventSignalling_Failed"
                 value="15"
                 level="win:Error"
                 task="FlushSignalFailed"
                 template="ScheduleFlushSignalFailed"
                 keywords="SQLCE_ERROR"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.15.message)">
          </event>

          <event symbol="Error_UnknownError"
                 value="16"
                 level="win:Error"
                 keywords="SQLCE_ERROR"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.16.message)">
          </event>

          <event symbol="Error_UnmappedError"
                 value="17"
                 level="win:Error"
                 template="UnmappedErrorCode"
                 keywords="SQLCE_ERROR"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.17.message)">
          </event>

	  <event symbol="Database_Reindexed"
                 value="18"
                 level="win:Error"
                 task="DatabaseReindexed"
                 template="DBReindexTemplate"
                 keywords="SQLCE_ERROR"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.18.message)">
          </event>

	  <event symbol="Idle_Violation"
                 value="19"
                 level="win:Error"
                 task="IdleViolation"
                 template="Idle_Violation"
                 keywords="SQLCE_ERROR"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.19.message)">
          </event>

	  <event symbol="Database_Opened_In_Chamber"
                 value="20"
                 level="win:Error"
                 task="DatabaseOpenedInChamber"
                 template="DBChamberSIDProcess"
                 keywords="SQLCE_ERROR"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.20.message)">
          </event>

	  <event symbol="Database_Opened_In_Chamber_Failed"
                 value="21"
                 level="win:Error"
                 task="DatabaseOpenedInChamber"
                 template="DBChamberSIDProcessFailed"
                 keywords="SQLCE_ERROR"
                 message="$(string.Microsoft-WindowsPhone-SQLCEETWProvider.event.21.message)">
          </event>
        </events>

      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>
        <!-- Defined by WindowsPhone best practice -->
        <string id="Keyword.Error"                                                value="Error" />
        <string id="Keyword.Performance"                                          value="Performance" />

        <!-- Define my own keywords here -->
        <string id="Keyword.SQLCE_CRITICAL"                                       value="SQLCE_CRITICAL" />
        <string id="Keyword.SQLCE_ERROR"                                          value="SQLCE_ERROR" />
        <string id="Keyword.SQLCE_FLUSH"                                          value="SQLCE_FLUSH" />
        <string id="Keyword.DEBUG"                                                value="DEBUG" />
        <string id="level.LogAlways"                                              value="Log Always" />
        <string id="level.Informational"                                          value="Information" />
        <string id="level.Error"                                                  value="Error" />
        <string id="level.Critical"                                               value="Critical" />
        <string id="channel.System"                                               value="System" />
        <string id="channel.Application"                                          value="Application" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.9.message"     value="SQLCE - Logical Corruption in Vol- %1 : in locked page" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.8.message"     value="SQLCE - Logical Corruption in Vol- %1 : in Page-Info array" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.7.message"     value="SQLCE - Logical Corruption in Vol- %4 :in PageId cache - idPage=%1, cache=%2, actual=%3" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.6.message"     value="Vol-%3,FileShrunkBy- %1 KB, FinalSize- %2 KB" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.5.message"     value="%4 Flush Time - %1 msec, TotalPayload - %2 KB, CurrentPayload - %3 KB, FileSize - %4 KB" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.3.message"     value="Vol-%3, FileGrowth-%1 KB, FinalSize-%2 KB" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.2.message"     value="Flush with NULL completed. Time taken: %1" />        
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.12.message"    value="Volume %1 is using system reserve" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.13.message"    value="Worker Thread main loop hit abandoned mutex exception on event with index: %1" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.14.message"    value="Worker Thread main loop failed with error: %1" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.15.message"    value="Schedule Flush event signalling failed with error: %1" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.16.message"    value="OS did not set last error" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.17.message"    value="Unmapped Error Code: %1" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.11.message"    value="SQLCE - Logical Corruption in Vol - %4 : iPage=%1, exp=%2, act=%3" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.104.message"   value="SQLCE (Corrupt): [%1] %n " />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.103.message"   value="SQLCE (Flush): [%1] %n" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.101.message"   value="SQLCE (Error): [hrMaj:%1,hrMin:%2] %n" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.100.message"   value="SQLCE : DBName [%1]| CorruptionType: [%2]|PageId: [%3]" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.10.message"    value="SQLCE - Physical Corruption in Vol - %3 : iPage=%1, pageid=%2" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.1.message"     value="Flush with NULL called." />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.18.message"    value="DB File %1 reindexed, oldsize-%2, currentsize-%3." />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.19.message"    value="File %1 flushed when device was idle" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.20.message"    value="Database %1 was opened by Process %3 in Chamber %2" />
        <string id="Microsoft-WindowsPhone-SQLCEETWProvider.event.21.message"    value="Database %1 opened by Process %3 in Chamber Failed with hr %2" />
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>