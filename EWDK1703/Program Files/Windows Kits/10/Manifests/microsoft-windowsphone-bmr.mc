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

      <!-- Here we describe the provider that uses this manifest.
           Each provider will have its own manifest. -->
      
      <!-- Note: messageFileName and resourceFileName should be set to the name of the
           provider's DLL/EXE. -->
      <provider name="Microsoft-WindowsPhone-BMR"
          guid="{9B84AB3F-5B1A-4395-8636-3521D7E472A4}"
          symbol="MICROSOFT_WINDOWSPHONE_BMR"
          messageFileName="BMRETW.lib"
          resourceFileName="BMRETW.lib">

        <!-- NOTE: It is no longer necessary to declare which channels your provider writes to -->
        <channels />
        

        <!-- Keywords work much like Windows Phone "debug zones."  They are tags that can 
             be assigned to events to break them into classes.  Keyword masks are 64-bit, of
             which you may use the lower 48.  For more information on keyword definitions, see 
             http://msdn.microsoft.com/en-us/library/aa382786(VS.85).aspx -->

        <!-- Keywords for Microsoft-WindowsPhone-BMR -->
        <keywords>
          <keyword mask="0x0000000000000001" name="Error" />
          <keyword mask="0x0000000000000002" name="Performance" />
          <keyword mask="0x0000000000000004" name="Engine" />
          <keyword mask="0x0000000000000008" name="BmrCpl" />
        </keywords>
        

        <tasks>
          <task name="BMR_TRACE_INFO"         value="100"/>
          <task name="BMR_TRACE_WARN"         value="101"/>
          <task name="BMR_TRACE_ERROR"        value="102"/>
          <task name="BMR_TRACE_HR"           value="200"/>
          <task name="BMR_TRACE_PERFORMANCE"  value="300"/>
          <task name="BMR_TRACE_COUNT"        value="400"/>
          <task name="CLOUDSTORAGECPL"        value="500"/>
          <task name="METADATA_STORE_SESSION" value="2000">
            <opcodes>
              <opcode name="Begin"	          value="11"/>
              <opcode name="End" 	          value="12"/>
              <opcode name="Rollback"         value="13"/>
              <opcode name="Commit"           value="14"/>
              <opcode name="Store"            value="15"/>
              <opcode name="Delete"           value="16"/>
              <opcode name="Undo"             value="17"/>
              <opcode name="Cleanup"          value="18"/>
            </opcodes>
          </task>
          <task name="METADATA_STORE_LKG"     value="2001">
            <opcodes>                         
              <opcode name="LoadUnit"         value="19"/>
              <opcode name="LoadUnits"        value="10"/>
              <opcode name="GetCollectionIds" value="21"/>
              <opcode name="DeleteStore"      value="22"/>
            </opcodes>
          </task>
          <task name="METADATA_STORE"         value="2002"/>
          <task name="TRANSFER"               value="3000">
            <opcodes>                         
              <opcode name="SendReceive"      value="23"/>
              <opcode name="Cancel"           value="24"/>
              <opcode name="Status"           value="25"/>
            </opcodes>
          </task>
          <task name="ENGINE_OPERATION"       value="4001">
            <opcodes>
              <opcode name="Request"          value="41"/>
              <opcode name="Prepare"          value="42"/>
              <opcode name="Transport"        value="43"/>
              <opcode name="CommitApply"      value="44"/>
              <opcode name="Complete"         value="45"/>
            </opcodes>
          </task>
          <task name="ENGINE_SERVER"          value="4002"/>
          <task name="ENGINE_TRANSPORT"       value="4003"/>
          <task name="ENGINE_THREAD"          value="4004"/>
          <task name="ENGINE_SERVICE"         value="4005">
            <opcodes>
              <opcode name="Informational"    value="99"/>
            </opcodes>
          </task>
          <task name="SH"                     value="5000"/>
          <task name="SH_READ_UNIT"           value="5001"/>
          <task name="SH_READ_SETTING"        value="5002"/>
          <task name="SH_WRITE_UNIT"          value="5003"/>
          <task name="SH_WRITE_SETTING"       value="5004"/>
          <task name="CS_READ"                value="6000">
            <opcodes>
                <opcode name="Collection"     value="46"/>
                <opcode name="Unit"           value="47"/>
            </opcodes>
          </task>
          <task name="CS_WRITE"               value="6002">
            <opcodes>
                <opcode name="GetCollection"  value="48"/>
                <opcode name="GetUnit"        value="49"/>
                <opcode name="SetCollection"  value="50"/>
                <opcode name="SetUnit"        value="51"/>
            </opcodes>
          </task>
          <task name="BMRCPL"                 value="7001">
            <opcodes>
              <opcode name="Operation"        value="71"/>
              <opcode name="Callback"         value="72"/>
              <opcode name="General"          value="73"/>
            </opcodes>
          </task>
          <task name="XMLPARSER"              value="8000"/>
          <task name="PROFILEPARSER"          value="9000"/>
        </tasks>

        <maps>
            <valueMap name="EngineBackupCollectResult">
                <map value="1" message="$(string.BMR.ENGINE.BACKUP.COLLECT.RESULT.ADD.NEW)" />
                <map value="2" message="$(string.BMR.ENGINE.BACKUP.COLLECT.RESULT.ADD.FORCED)" />
                <map value="3" message="$(string.BMR.ENGINE.BACKUP.COLLECT.RESULT.ADD.CHANGED)" />
                <map value="4" message="$(string.BMR.ENGINE.BACKUP.COLLECT.RESULT.ADD.ANYWAY)" />
                <map value="5" message="$(string.BMR.ENGINE.BACKUP.COLLECT.RESULT.ADD.DELETE)" />
                <map value="6" message="$(string.BMR.ENGINE.BACKUP.COLLECT.RESULT.SKIP.NOTTIER0)" />
                <map value="7" message="$(string.BMR.ENGINE.BACKUP.COLLECT.RESULT.SKIP.NOCHANGE)" />
                <map value="8" message="$(string.BMR.ENGINE.BACKUP.COLLECT.RESULT.FAIL.DELETE)" />
                <map value="9" message="$(string.BMR.ENGINE.BACKUP.COLLECT.RESULT.FAIL.COLLECT)" />
                <map value="10" message="$(string.BMR.ENGINE.RESTORE.COLLECT.RESULT.ADD.UNIT)" />
                <map value="11" message="$(string.BMR.ENGINE.RESTORE.COLLECT.RESULT.ADD.COLLECTION)" />
                <map value="12" message="$(string.BMR.ENGINE.RESTORE.COLLECT.RESULT.SKIP.PAYLOAD1)" />
                <map value="13" message="$(string.BMR.ENGINE.RESTORE.COLLECT.RESULT.SKIP.PAYLOAD2)" />
            </valueMap>
            
            <valueMap name="DeleteBackupType">
                <map value="0" message="$(string.BMR.ENGINE.DELETE.TYPE.ALL)" />
                <map value="1" message="$(string.BMR.ENGINE.DELETE.TYPE.APPS)" />
            </valueMap>
            
            <valueMap name="BackupEngineStateMap">
                <map value="0" message="$(string.BMR.ENGINE.BACKUP.COMPLETE)" />
                <map value="1" message="$(string.BMR.ENGINE.BACKUP.NEEDED)" />
                <map value="2" message="$(string.BMR.ENGINE.BACKUP.RUNNING)" />
            </valueMap>

            <valueMap name="EngineRequestResult">
                <map value="1" message="$(string.BMR.ENGINE.REQUEST.FAIL.INVALID.LIVEID.FLAG)" />
                <map value="2" message="$(string.BMR.ENGINE.REQUEST.FAIL.TIMEBOUND.RESTORE.NOT.SUPPORTED)" />
                <map value="3" message="$(string.BMR.ENGINE.REQUEST.FAIL.INVALID.NOOP.FLAG)" />
                <map value="4" message="$(string.BMR.ENGINE.REQUEST.FAIL.DEVICEINFORMATION.RESTORE.NOT.SUPPORTED)" />
                <map value="5" message="$(string.BMR.ENGINE.REQUEST.FAIL.WINDOWSPHONE.DISABLED)" />
                <map value="6" message="$(string.BMR.ENGINE.REQUEST.FAIL.LIVEID.NOT.AVAILABLE)" />
                <map value="7" message="$(string.BMR.ENGINE.REQUEST.FAIL.TIMEBOUND.RESTORE.QUEUED)" />
                <map value="8" message="$(string.BMR.ENGINE.REQUEST.SUCCESS.BOUND.EXISTING.TASK)" />
                <map value="9" message="$(string.BMR.ENGINE.REQUEST.SUCCESS.CREATE.NEW.TASK)" />
                <map value="10" message="$(string.BMR.ENGINE.REQUEST.SUCCESS.REMOVE.TASK.DELETED)" />
                <map value="11" message="$(string.BMR.ENGINE.REQUEST.SUCCESS.REMOVE.TASK.KEPT)" />
                <map value="12" message="$(string.BMR.ENGINE.REQUEST.SUCCESS.TASK.COMPLETED)" />
            </valueMap>

            <valueMap name="EngineRequestOperation">
                <map value="0" message="$(string.BMR.ENGINE.REQUEST.OPERATION.NONE)" />
                <map value="1" message="$(string.BMR.ENGINE.REQUEST.OPERATION.DOWNLOAD)" />
                <map value="2" message="$(string.BMR.ENGINE.REQUEST.OPERATION.UPLOAD)" />
                <map value="3" message="$(string.BMR.ENGINE.REQUEST.OPERATION.LOCALDELETE)" />
                <map value="4" message="$(string.BMR.ENGINE.REQUEST.OPERATION.REMOTEDELETE)" />
            </valueMap>

            <valueMap name="EngineSessionResult">
                <map value="1" message="$(string.BMR.ENGINE.SESSION.EMPTY)" />
                <map value="2" message="$(string.BMR.ENGINE.SESSION.CANCEL.PENDING.CONFLICT)" />
                <map value="3" message="$(string.BMR.ENGINE.SESSION.URGENT.COMPLETE)" />
                <map value="4" message="$(string.BMR.ENGINE.SESSION.TIMEBOUND.QUEUED)" />
                <map value="5" message="$(string.BMR.ENGINE.SESSION.TIMEBOUND.COMPLETE)" />
                <map value="6" message="$(string.BMR.ENGINE.SESSION.TIMEBOUND.PENDING)" />
            </valueMap>

            <valueMap name="EngineSyncState">
                <map value="0" message="$(string.BMR.ENGINE.SYNC.STATE.NONE)" />
                <map value="1" message="$(string.BMR.ENGINE.SYNC.STATE.PENDING)" />
                <map value="2" message="$(string.BMR.ENGINE.SYNC.STATE.RUNNING)" />
                <map value="3" message="$(string.BMR.ENGINE.SYNC.STATE.CANCELLED)" />
                <map value="4" message="$(string.BMR.ENGINE.SYNC.STATE.COMPLETE)" />
                <map value="5" message="$(string.BMR.ENGINE.SYNC.STATE.RUNNING.PREPARE)" />
                <map value="6" message="$(string.BMR.ENGINE.SYNC.STATE.RUNNING.TRANSPORT)" />
                <map value="7" message="$(string.BMR.ENGINE.SYNC.STATE.RUNNING.FINISH)" />
                <map value="9" message="$(string.BMR.ENGINE.SYNC.STATE.RUNNING.COMPLETE)" />
            </valueMap>

            <valueMap name="DeviceProfileAttributes">
                <map value="0" message="$(string.BMR.CONFIG.DEVICE.PROFILE.DIFFERENT)" />
                <map value="1" message="$(string.BMR.CONFIG.DEVICE.PROFILE.VIRTUAL)" />
                <map value="2" message="$(string.BMR.CONFIG.DEVICE.PROFILE.CURRENT)" />
            </valueMap>

            <valueMap name="CallbackSyncState">
                <map value="0" message="$(string.BMR.CALLBACK.SYNC.STATE.NONE)" />
                <map value="1" message="$(string.BMR.CALLBACK.SYNC.STATE.CANCEL.ALLOWED)" />
                <map value="2" message="$(string.BMR.CALLBACK.SYNC.STATE.CANCEL.NOT.ALLOWED)" />
            </valueMap>

            <valueMap name="SyncStateFlags">
                <map value="0" message="$(string.BMR.SYNC.STATE.FLAGS.NONE)" />
                <map value="1" message="$(string.BMR.SYNC.STATE.FLAGS.ENABLED)" />
                <map value="2" message="$(string.BMR.SYNC.STATE.FLAGS.DISABLED)" />
            </valueMap>

            <bitMap name="EngineRequestFlags">
                <map value="0x00000001" message="$(string.BMR.REQUEST.FLAG.ALLOW_SYNC_ON_PAID_CONNECTION)" />
                <map value="0x00000002" message="$(string.BMR.REQUEST.FLAG.UNDEFINED)" />
                <map value="0x00000004" message="$(string.BMR.REQUEST.FLAG.TIMEBOUND)" />
                <map value="0x00000008" message="$(string.BMR.REQUEST.FLAG.NO_STATUS)" />
                <map value="0x00000010" message="$(string.BMR.REQUEST.FLAG.PAYLOAD1)" />
                <map value="0x00000020" message="$(string.BMR.REQUEST.FLAG.PAYLOAD2)" />
                <map value="0x00000040" message="$(string.BMR.REQUEST.FLAG.TIER0)" />
                <map value="0x00000080" message="$(string.BMR.REQUEST.FLAG.HEART_BEAT_ON_NOOP)" />
                <map value="0x00000100" message="$(string.BMR.REQUEST.FLAG.FORCE)" />
                <map value="0x00000200" message="$(string.BMR.REQUEST.FLAG.NOOP)" />
                <map value="0x00000400" message="$(string.BMR.REQUEST.FLAG.UNDEFINED)" />
                <map value="0x00000800" message="$(string.BMR.REQUEST.FLAG.UNDEFINED)" />
                <map value="0x00100000" message="$(string.BMR.REQUEST.FLAG.LIVEID)" />
                <map value="0x00200000" message="$(string.BMR.REQUEST.FLAG.SERVER_DATA_LOSS)" />
                <map value="0x00400000" message="$(string.BMR.REQUEST.FLAG.COMPLETED)" />
                <map value="0x00800000" message="$(string.BMR.REQUEST.FLAG.PENDING)" />
                <map value="0x01000000" message="$(string.BMR.REQUEST.FLAG.DEVICEINFORMATION)" />
                <map value="0x02000000" message="$(string.BMR.REQUEST.FLAG.CANCEL_NOT_ALLOWED)" />
                <map value="0x04000000" message="$(string.BMR.REQUEST.FLAG.CURRENT_DEVICE)" />
            </bitMap>

            <valueMap name="XmlNodeType">
                <map value="0"  message="$(string.BMR.XML.NODETYPE.NONE)" />
                <map value="1"  message="$(string.BMR.XML.NODETYPE.ELEMENT)" />
                <map value="2"  message="$(string.BMR.XML.NODETYPE.ATTRIBUTE)" />
                <map value="3"  message="$(string.BMR.XML.NODETYPE.TEXT)" />
                <map value="4"  message="$(string.BMR.XML.NODETYPE.CDATA)" />
                <map value="7"  message="$(string.BMR.XML.NODETYPE.PROCESSINGINSTRUCTION)" />
                <map value="8"  message="$(string.BMR.XML.NODETYPE.COMMENT)" />
                <map value="10" message="$(string.BMR.XML.NODETYPE.DOCUMENTTYPE)" />
                <map value="13" message="$(string.BMR.XML.NODETYPE.WHITESPACE)" />
                <map value="15" message="$(string.BMR.XML.NODETYPE.ENDELEMENT)" />
                <map value="17" message="$(string.BMR.XML.NODETYPE.XMLDECLARATION)" />
            </valueMap>
            
            <valueMap name="ProfileParserState">
                <map value="0"  message="$(string.BMR.PROFILEPARSER.STATE.RESPONSEHEADER)" />
                <map value="1"  message="$(string.BMR.PROFILEPARSER.STATE.NAMESPACE)" />
                <map value="2"  message="$(string.BMR.PROFILEPARSER.STATE.DEVICEHEADER)" />
                <map value="3"  message="$(string.BMR.PROFILEPARSER.STATE.DEVICEPROPERTIES)" />
                <map value="4"  message="$(string.BMR.PROFILEPARSER.STATE.DEVICEFOOTER)" />
                <map value="5"  message="$(string.BMR.PROFILEPARSER.STATE.RESPONSEFOOTER)" />
            </valueMap>
        </maps>

        <!-- Event Templates -->
        <!-- Here we define the data payloads that may be written with events.
             If multiple events share the same data payload, they can use the same template.
             See the Remarks section in http://msdn.microsoft.com/en-us/library/aa382774(VS.85).aspx
             for valid inType / outType combinations.
             For more complex data types, it is suggested that you use a tool like EcManGen.exe from
             the Win7 SDK to author manifests.
             The "%" values noted here are for user convenience, when referencing the stringTable below.
             Never log any data which should be protected for security or privacy purposes. -->

        <templates>
          <template tid="String">
            <!--%1--> <data name="psz"                  inType="win:UnicodeString" />
          </template>

          <template tid="StringString">
            <!--%1--> <data name="psz1"                 inType="win:UnicodeString" />
            <!--%2--> <data name="psz2"                 inType="win:UnicodeString" />
          </template>
          
          <template tid="Dword">
            <!--%1--> <data name="dw"                   inType="win:UInt32" />
          </template>
          
          <template tid="Hr">
            <!--%1--> <data name="hr"                   inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="HrString">
            <!--%1--> <data name="hr"                   inType="win:UInt32" outType="win:HexInt32" />
            <!--%2--> <data name="psz"                  inType="win:UnicodeString" />
          </template>

          <template tid="PrintfMessage">
            <!--%1--> <data name="Message"              inType="win:Pointer" />
          </template>

          <template tid="Pointer">
            <!--%1--> <data name="Pointer"              inType="win:Pointer" />
          </template>

          <template tid="PointerString">
            <!--%1--> <data name="Pointer"              inType="win:Pointer" />
            <!--%2--> <data name="Name"                 inType="win:UnicodeString" />
          </template>

          <template tid="BooleanString">
            <!--%1--> <data name="Boolean"              inType="win:UInt32" outType="win:HexInt32" />
            <!--%2--> <data name="String"               inType="win:UnicodeString" />
          </template>

          <template tid="GuidHr">
            <!--%1--> <data name="Guid"                 inType="win:GUID" />
            <!--%2--> <data name="Hr"                   inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="DwordHr">
            <!--%1--> <data name="Dword"                inType="win:UInt32" />
            <!--%2--> <data name="Hr"                   inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="DwordBoolean">
            <!--%1--> <data name="Dword"                inType="win:UInt32" />
            <!--%2--> <data name="Boolean"              inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="DeleteBackupTypeHr">
            <!--%1--> <data name="deletebackuptype"     inType="win:UInt32" map="DeleteBackupType" />
            <!--%2--> <data name="hr"                   inType="win:UInt32" outType="win:HexInt32" />
          </template>
         
          <template tid="BackupEngineState">
            <!--%1--> <data name="BackupEngineState"    inType="win:UInt32" map="BackupEngineStateMap" />
            <!--%2--> <data name="BackupTime"           inType="win:FILETIME" outType="win:DateTimeCultureInsensitive" />
            <!--%3--> <data name="CurrentCollection"    inType="win:UInt32" />
            <!--%4--> <data name="NumberOfCollections"  inType="win:UInt32" />
          </template>
          
          <template tid="BackupEngineStateCollectionName">
            <!--%1--> <data name="BackupEngineState"    inType="win:UInt32" map="BackupEngineStateMap" />
            <!--%2--> <data name="BackupTime"           inType="win:FILETIME" outType="win:DateTimeCultureInsensitive" />
            <!--%3--> <data name="CollectionName"       inType="win:UnicodeString" />
            <!--%4--> <data name="CurrentCollection"    inType="win:UInt32" />
            <!--%5--> <data name="NumberOfCollections"  inType="win:UInt32" />
          </template>
  
 
          <template tid="TransferProfile">
            <!--%1--> <data name="Guid"                 inType="win:GUID" />
            <!--%2--> <data name="ProfileName"          inType="win:UnicodeString" />
            <!--%3--> <data name="TimeboundMinutes"     inType="win:UInt32" />
            <!--%4--> <data name="TargetPath"           inType="win:UnicodeString" />
            <!--%5--> <data name="UserIdentity"         inType="win:Boolean" />
            <!--%6--> <data name="CellAllowed"          inType="win:Boolean" />
            <!--%7--> <data name="BatteryAllowed"       inType="win:Boolean" />
            <!--%8--> <data name="Size"                 inType="win:UInt32" />
          </template>
          
          <template tid="TransferTimeboundStatus">
            <!--%1--> <data name="Guid"                 inType="win:GUID" />
            <!--%2--> <data name="Hr"                   inType="win:UInt32" outType="win:HexInt32" />
            <!--%3--> <data name="Pending"              inType="win:Boolean" />
            <!--%4--> <data name="Time"                 inType="win:SYSTEMTIME" outType="win:DateTimeCultureInsensitive" />
            <!--%5--> <data name="DcpHttpStatus"        inType="win:UInt32" />
            <!--%6--> <data name="PartnerHttpStatus"    inType="win:UInt32" />
          </template>
          
          <template tid="TransferUrgentStatus">
            <!--%1--> <data name="Guid"                 inType="win:GUID" />
            <!--%2--> <data name="Hr"                   inType="win:UInt32" outType="win:HexInt32" />
            <!--%4--> <data name="Uploaded"             inType="win:UInt32" />
            <!--%4--> <data name="TotalUpload"          inType="win:UInt32" />
            <!--%4--> <data name="Downloaded"           inType="win:UInt32" />
            <!--%4--> <data name="TotalDownload"        inType="win:UInt32" />
            <!--%5--> <data name="DcpHttpStatus"        inType="win:UInt32" />
            <!--%6--> <data name="PartnerHttpStatus"    inType="win:UInt32" />
          </template>
          
          <template tid="Guid">
            <!--%1--> <data name="guid" inType="win:GUID" />
          </template>

          <template tid="EngineBackupCollectInfo">
            <!--%1--> <data name="CollectionId"         inType="win:UnicodeString" />
            <!--%2--> <data name="UnitId"               inType="win:UnicodeString" />
            <!--%3--> <data name="Result"               inType="win:UInt32" map="EngineBackupCollectResult"/>
          </template>

          <template tid="EngineBackupCollectError">
            <!--%1--> <data name="CollectionId"         inType="win:UnicodeString" />
            <!--%2--> <data name="UnitId"               inType="win:UnicodeString" />
            <!--%3--> <data name="Result"               inType="win:UInt32" map="EngineBackupCollectResult"/>
            <!--%4--> <data name="Hr"                   inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="EngineSessionStatus">
            <!--%1--> <data name="FactoryId"            inType="win:UnicodeString" />
            <!--%2--> <data name="Operation"            inType="win:UInt32" map="EngineRequestOperation"/>
            <!--%3--> <data name="Flags"                inType="win:UInt32" map="EngineRequestFlags" />
            <!--%4--> <data name="Status"               inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="EngineRequestError">
            <!--%1--> <data name="CollectionId"         inType="win:UnicodeString" />
            <!--%2--> <data name="Operation"            inType="win:UInt32" map="EngineRequestOperation"/>
            <!--%3--> <data name="Flags"                inType="win:UInt32" map="EngineRequestFlags" />
            <!--%4--> <data name="Result"               inType="win:UInt32" map="EngineRequestResult"/>
          </template>

          <template tid="EngineTask">
            <!--%1--> <data name="CollectionId"         inType="win:UnicodeString" />
            <!--%2--> <data name="Operation"            inType="win:UInt32" map="EngineRequestOperation"/>
            <!--%3--> <data name="Flags"                inType="win:UInt32" map="EngineRequestFlags" />
          </template>

          <template tid="EngineTransport">
            <!--%1--> <data name="FactoryId"            inType="win:UnicodeString" />
            <!--%2--> <data name="Flags"                inType="win:UInt32" map="EngineRequestFlags" />
            <!--%3--> <data name="Operation"            inType="win:UInt32" map="EngineRequestOperation"/>
            <!--%4--> <data name="Size"                 inType="win:UInt32"/>
          </template>

          <template tid="EnginePayloadStatus">
            <!--%1--> <data name="FactoryId"            inType="win:UnicodeString" />
            <!--%2--> <data name="Size"                 inType="win:UInt32"/>
            <!--%3--> <data name="Status"               inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="EngineUnitStatus">
            <!--%1--> <data name="FactoryId"            inType="win:UnicodeString" />
            <!--%2--> <data name="CollectionId"         inType="win:UnicodeString" />
            <!--%3--> <data name="UnitId"               inType="win:UnicodeString" />
            <!--%4--> <data name="Status"               inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="EngineUnitInfo">
            <!--%1--> <data name="FactoryId"            inType="win:UnicodeString" />
            <!--%2--> <data name="CollectionId"         inType="win:UnicodeString" />
            <!--%3--> <data name="UnitId"               inType="win:UnicodeString" />
          </template>

          <template tid="EngineSessionInfo">
            <!--%1--> <data name="FactoryId"            inType="win:UnicodeString" />
            <!--%2--> <data name="Operation"            inType="win:UInt32" map="EngineRequestOperation"/>
            <!--%3--> <data name="Result"               inType="win:UInt32" map="EngineSessionResult" />
          </template>

          <template tid="EngineStateInfo">
            <!--%1--> <data name="CollectionId"         inType="win:UnicodeString" />
            <!--%2--> <data name="Operation"            inType="win:UInt32" map="EngineRequestOperation"/>
            <!--%3--> <data name="Flags"                inType="win:UInt32" map="EngineRequestFlags" />
            <!--%4--> <data name="FromState"            inType="win:UInt32" map="EngineSyncState" />
            <!--%5--> <data name="ToState"              inType="win:UInt32" map="EngineSyncState" />
          </template>

          <template tid="EngineProgressInfo">
            <!--%1--> <data name="Original Progress"    inType="win:UInt32"/>
            <!--%2--> <data name="Converted Progress"   inType="win:UInt32"/>
            <!--%3--> <data name="Status"               inType="win:UInt32" outType="win:HexInt32" />
            <!--%4--> <data name="State"                inType="win:UInt32" map="CallbackSyncState" />
            <!--%5--> <data name="Completed"            inType="win:Boolean"  outType="xs:boolean" />
          </template>

          <template tid="EngineBoolean">
            <!--%1--> <data name="Boolean"              inType="win:Boolean"  outType="xs:boolean" />
          </template>

          <template tid="EngineLogSyncInfo">
            <!--%1--> <data name="CollectionId"         inType="win:UnicodeString" />
            <!--%2--> <data name="Operation"            inType="win:UInt32" map="EngineRequestOperation"/>
            <!--%3--> <data name="Flags"                inType="win:UInt32" map="EngineRequestFlags" />
            <!--%4--> <data name="Status"               inType="win:UInt32" outType="win:HexInt32" />
            <!--%5--> <data name="FailedState"          inType="win:UInt32" map="EngineSyncState" />
            <!--%6--> <data name="TotalTime"            inType="win:UInt32" />
            <!--%7--> <data name="TransportTime"        inType="win:UInt32" />
            <!--%8--> <data name="TotalSize"            inType="win:UInt32" />
            <!--%9--> <data name="TotalCollections"     inType="win:UInt32" />
            <!--%10--> <data name="TotalUnits"          inType="win:UInt32" />
            <!--%11--> <data name="FinishedUnits"       inType="win:UInt32" />
            <!--%12--> <data name="FailedUnits"         inType="win:UInt32" />
            <!--%13--> <data name="FailedUnitId"        inType="win:UnicodeString" />
          </template>

          <template tid="EngineLastKnownGoodSyncTime">
            <!--%1--> <data name="TimeStamp"            inType="win:SYSTEMTIME"  outType="win:DateTimeCultureInsensitive" />
          </template>

          <template tid="EngineLastSyncStatus">
            <!--%1--> <data name="TimeStamp"            inType="win:SYSTEMTIME"  outType="win:DateTimeCultureInsensitive" />
            <!--%2--> <data name="Status"               inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="DeviceProfile">
            <!--%1--> <data name="Id"                   inType="win:UnicodeString" />
            <!--%2--> <data name="FriendlyName"         inType="win:UnicodeString" />
            <!--%3--> <data name="Make"                 inType="win:UnicodeString" />
            <!--%4--> <data name="Model"                inType="win:UnicodeString" />
            <!--%5--> <data name="Attributes"           inType="win:UInt32" map="DeviceProfileAttributes" />
            <!--%6--> <data name="Size"                 inType="win:UInt32" />
            <!--%7--> <data name="ModifiedTime"         inType="win:FILETIME"  outType="win:DateTimeCultureInsensitive" />
            <!--%8--> <data name="Valid"                inType="win:Boolean"  outType="xs:boolean" />
          </template>

          <template tid="EngineSyncStatus">
            <!--%1--> <data name="Result"               inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="EngineSyncStateFlags">
            <!--%1--> <data name="State"                inType="win:UInt32" map="SyncStateFlags" />
          </template>

          <template tid="NodeType">
            <!--%1--> <data name="Type"                 inType="win:UInt32" map="XmlNodeType" />
            <!--%2--> <data name="Error"                inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="NodeTypeComparison">
            <!--%1--> <data name="TypeExpected"         inType="win:UInt32" map="XmlNodeType" />
            <!--%2--> <data name="TypeActual"           inType="win:UInt32" map="XmlNodeType" />
            <!--%3--> <data name="Error"                inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="NodeNameOrValue">
            <!--%1--> <data name="Type"                 inType="win:UInt32" map="XmlNodeType" />
            <!--%2--> <data name="NameOrValue"          inType="win:UnicodeString" />
            <!--%3--> <data name="ParentNodeName"       inType="win:UnicodeString" />
            <!--%4--> <data name="Error"                inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="NodeNameOrValueComparison">
            <!--%1--> <data name="Type"                 inType="win:UInt32" map="XmlNodeType" />
            <!--%2--> <data name="NameOrValueExpected"  inType="win:UnicodeString" />
            <!--%3--> <data name="NameOrValueActual"    inType="win:UnicodeString" />
            <!--%4--> <data name="ParentNodeName"       inType="win:UnicodeString" />
            <!--%5--> <data name="Error"                inType="win:UInt32" outType="win:HexInt32" />
          </template>
          
          <template tid="ProfileParserStateChange">
            <!--%1--> <data name="OldState"             inType="win:UInt32" map="ProfileParserState" />
            <!--%2--> <data name="NewState"             inType="win:UInt32" map="ProfileParserState" />
          </template>

        </templates>


        <!-- MyProvider Events -->
        <!-- Here we define the events that this provider writes.
             For information on opcodes, see http://msdn.microsoft.com/en-us/library/aa383956(VS.85).aspx. -->
        <events>

            <!-- BMR_TRACE_INFO -->
            <event value="100"
              symbol="BMR_TRACE_INFO"
              task="BMR_TRACE_INFO"
              keywords="Error"
              template="String"
              level="win:Informational"
              message="$(string.BMR.INFO)" />

            <!-- BMR_TRACE_WARN -->
            <event value="101"
              symbol="BMR_TRACE_WARN"
              task="BMR_TRACE_WARN"
              keywords="Error"
              template="String"
              level="win:Warning"
              message="$(string.BMR.WARN)" />

            <!-- BMR_TRACE_ERROR -->
            <event value="102"
              symbol="BMR_TRACE_ERROR"
              task="BMR_TRACE_ERROR"
              keywords="Error"
              template="HrString"
              level="win:Error"
              message="$(string.BMR.ERROR)" />

            <!-- BMR_TRACE_ORIGINALHR -->
            <event value="200"
              symbol="BMR_TRACE_HR"
              task="BMR_TRACE_HR"
              keywords="Error"
              template="Hr"
              level="win:Error"
              message="$(string.BMR.HR)" />

            <!-- BMR_TRACE_PERFORMANCE -->
            <event value="300"
              symbol="BMR_TRACE_PERFORMANCE"
              task="BMR_TRACE_PERFORMANCE"
              keywords="Performance"
              template="String"
              level="win:Verbose"
              message="$(string.BMR.PERFORMANCE)" />

            <!-- BMR_TRACE_COUNT -->
            <event value="400"
              symbol="BMR_TRACE_COUNT"
              task="BMR_TRACE_COUNT"
              keywords="Error"
              template="Dword"
              level="win:Informational"
              message="$(string.BMR.COUNT)" />
              
            <event value="500"
              symbol="CLOUDSTORAGECPL_GET_UPLOAD_STATE_WARNING"
              version="0"
              level="win:Warning"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_GET_UPLOAD_STATE_WARNING.500)"/>

            <event value="501"
              symbol="CLOUDSTORAGECPL_SET_UPLOAD_STATE_WARNING"
              version="0"
              level="win:Warning"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_SET_UPLOAD_STATE_WARNING.501)"/>

            <event value="502"
              symbol="CLOUDSTORAGECPL_SET_UPLOADED_ITEMS_WARNING"
              version="0"
              level="win:Warning"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_SET_UPLOADED_ITEMS_WARNING.502)"/>

            <event value="503"
              symbol="CLOUDSTORAGECPL_GET_UPLOADED_ITEMS_WARNING"
              version="0"
              level="win:Warning"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_GET_UPLOADED_ITEMS_WARNING.503)"/>

            <event value="504"
              symbol="CLOUDSTORAGECPL_SET_UPLOAD_USER_SELECTION_WARNING"
              version="0"
              level="win:Warning"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_SET_UPLOAD_USER_SELECTION_WARNING.504)"/>

            <event value="505"
              symbol="CLOUDSTORAGECPL_GET_UPLOAD_USER_SELECTION_WARNING"
              version="0"
              level="win:Warning"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_GET_UPLOAD_USER_SELECTION_WARNING.505)"/>

            <event value="506"
              symbol="CLOUDSTORAGECPL_GET_TOAST_NOTIFICATION_STATE_WARNING"
              version="0"
              level="win:Warning"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_GET_TOAST_NOTIFICATION_STATE_WARNING.506)"/>

            <event value="507"
              symbol="CLOUDSTORAGECPL_SET_TOAST_NOTIFICATION_STATE_WARNING"
              version="0"
              level="win:Warning"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_SET_TOAST_NOTIFICATION_STATE_WARNING.507)"/>

            <event value="508"
              symbol="CLOUDSTORAGECPL_READ_APPLICATION_STATE_FROM_REGISTRY_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_READ_APPLICATION_STATE_FROM_REGISTRY_ERROR.508)"/>

            <event value="510"
              symbol="CLOUDSTORAGECPL_START_QUERY_BACKUPS_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_START_QUERY_BACKUPS_ERROR.510)"/>

            <event value="513"
              symbol="CLOUDSTORAGECPL_QUERY_BACKUPS_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_QUERY_BACKUPS_ERROR.513)"/>

            <event value="514"
              symbol="CLOUDSTORAGECPL_GET_LAST_BACKUP_DATE_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_GET_LAST_BACKUP_DATE_ERROR.514)"/>

            <event value="515"
              symbol="CLOUDSTORAGECPL_GET_BACKUPS_COUNT_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_GET_BACKUPS_COUNT_ERROR.515)"/>

            <event value="516"
              symbol="CLOUDSTORAGECPL_START_UPLOAD_INFO"
              version="0"
              level="win:Informational"
              task="CLOUDSTORAGECPL"
              message="$(string.CLOUDSTORAGECPL_START_UPLOAD_INFO.516)"/>

            <event value="517"
              symbol="CLOUDSTORAGECPL_START_MEDIA_UPLOAD_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_START_MEDIA_UPLOAD_ERROR.517)"/>

            <event value="518"
              symbol="CLOUDSTORAGECPL_START_TEXT_UPLOAD_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_START_TEXT_UPLOAD_ERROR.518)"/>

            <event value="519"
              symbol="CLOUDSTORAGECPL_RUN_UPLOADMEDIA_STARTED_INFO"
              version="0"
              level="win:Informational"
              task="CLOUDSTORAGECPL"
              message="$(string.CLOUDSTORAGECPL_RUN_UPLOADMEDIA_STARTED_INFO.519)"/>

            <event value="520"
              symbol="CLOUDSTORAGECPL_UPLOADMEDIA_FINISHED_INFO"
              version="0"
              level="win:Informational"
              task="CLOUDSTORAGECPL"
              message="$(string.CLOUDSTORAGECPL_UPLOADMEDIA_FINISHED_INFO.520)"/>

            <event value="521"
              symbol="CLOUDSTORAGECPL_UPLOADMEDIA_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_UPLOADMEDIA_ERROR.521)"/>

            <event value="522"
              symbol="CLOUDSTORAGECPL_UPLOADTEXT_STARTED_INFO"
              version="0"
              level="win:Informational"
              task="CLOUDSTORAGECPL"
              message="$(string.CLOUDSTORAGECPL_UPLOADTEXT_STARTED_INFO.522)"/>

            <event value="523"
              symbol="CLOUDSTORAGECPL_UPLOADTEXT_FINISHED_INFO"
              version="0"
              level="win:Informational"
              task="CLOUDSTORAGECPL"
              message="$(string.CLOUDSTORAGECPL_UPLOADTEXT_FINISHED_INFO.523)"/>

            <event value="524"
              symbol="CLOUDSTORAGECPL_UPLOADTEXT_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_UPLOADTEXT_ERROR.524)"/>

            <event value="525"
              symbol="CLOUDSTORAGECPL_GET_TOTAL_ITEMS_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_GET_TOTAL_ITEMS_ERROR.525)"/>

            <event value="526"
              symbol="CLOUDSTORAGECPL_ENABLE_PHOTOS_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_ENABLE_PHOTOS_ERROR.526)"/>

            <event value="527"
              symbol="CLOUDSTORAGECPL_ENABLE_TEXT_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_ENABLE_TEXT_ERROR.527)"/>

            <event value="528"
              symbol="CLOUDSTORAGECPL_GET_CONVERSATIONS_ENABLED_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_GET_CONVERSATIONS_ENABLED_ERROR.528)"/>

            <event value="529"
              symbol="CLOUDSTORAGECPL_INITIALIZE_PHOTOS_ERROR"
              version="0"
              level="win:Error"
              task="CLOUDSTORAGECPL"
              template="Hr"
              message="$(string.CLOUDSTORAGECPL_INITIALIZE_PHOTOS_ERROR.529)"/>

            <!-- METADATA_STORE_START -->
            <event value="2000"
              symbol="METADATA_STORE_START"
              task="METADATA_STORE_LKG"
              opcode="win:Start"
              keywords="Error"
              template="String"
              level="win:Informational"
              message="$(string.BMR.METADATASTORE.ROOT)" />

            <!-- METADATA_STORE_STOP -->
            <event value="2001"
              symbol="METADATA_STORE_STOP"
              task="METADATA_STORE_LKG"
              opcode="win:Stop"
              keywords="Error"
              template="String"
              level="win:Informational"
              message="$(string.BMR.METADATASTORE.ROOT)" />

            <!-- METADATA_STORE_BEGINSESSION -->
            <event value="2002"
              symbol="METADATA_STORE_BEGINSESSION"
              task="METADATA_STORE_SESSION"
              opcode="Begin"
              keywords="Error"
              template="Dword"
              level="win:Informational"
              message="$(string.BMR.METADATASTORE.SESSION)" />

            <!-- METADATA_STORE_ENDSESSION -->
            <event value="2003"
              symbol="METADATA_STORE_ENDSESSION"
              task="METADATA_STORE_SESSION"
              opcode="End"
              keywords="Error"
              template="Dword"
              level="win:Informational"
              message="$(string.BMR.METADATASTORE.SESSION)" />

            <!-- METADATA_STORE_ROLLBACKSESSION -->
            <event value="2004"
              symbol="METADATA_STORE_ROLLBACKSESSION"
              task="METADATA_STORE_SESSION"
              opcode="Rollback"
              keywords="Error"
              template="Dword"
              level="win:Informational"
              message="$(string.BMR.METADATASTORE.SESSION)" />

            <!-- METADATA_STORE_COMMITSESSION_START -->
            <event value="2005"
              symbol="METADATA_STORE_COMMITSESSION_START"
              task="METADATA_STORE_SESSION"
              opcode="Commit"
              keywords="Performance"
              level="win:Informational"
              message="$(string.BMR.METADATASTORE.START)"/>

            <!-- METADATA_STORE_COMMITSESSION -->
            <event value="2006"
              symbol="METADATA_STORE_COMMITSESSION"
              task="METADATA_STORE_SESSION"
              opcode="Commit"
              keywords="Error"
              template="Dword"
              level="win:Informational"
              message="$(string.BMR.METADATASTORE.SESSION)" />

            <!-- METADATA_STORE_COMMITSESSION_MESSAGE -->
            <event value="2007"
              symbol="METADATA_STORE_COMMITSESSION_MESSAGE"
              task="METADATA_STORE_SESSION"
              opcode="Commit"
              keywords="Error"
              template="PrintfMessage"
              level="win:Verbose"/>

            <!-- METADATA_STORE_COMMITSESSION_STOP -->
            <event value="2008"
              symbol="METADATA_STORE_COMMITSESSION_STOP"
              task="METADATA_STORE_SESSION"
              opcode="Commit"
              keywords="Performance"
              level="win:Informational"
              message="$(string.BMR.METADATASTORE.STOP)"/>

            <!-- METADATA_STORE_STOREUNIT -->
            <event value="2009"
              symbol="METADATA_STORE_STOREUNIT"
              task="METADATA_STORE_SESSION"
              opcode="Store"
              keywords="Error"
              template="PrintfMessage"
              level="win:Informational"/>

            <!-- METADATA_STORE_CLEANUP -->
            <event value="2011"
              symbol="METADATA_STORE_CLEANUP"
              task="METADATA_STORE_SESSION"
              opcode="Cleanup"
              keywords="Error"
              level="win:Informational"/>

            <!-- METADATA_STORE_LOADUNIT_START -->
            <event value="2012"
              symbol="METADATA_STORE_LOADUNIT_START"
              task="METADATA_STORE_LKG"
              opcode="LoadUnit"
              keywords="Performance"
              level="win:Informational"
              message="$(string.BMR.METADATASTORE.START)"/>

            <!-- METADATA_STORE_LOADUNIT -->
            <event value="2013"
              symbol="METADATA_STORE_LOADUNIT"
              task="METADATA_STORE_LKG"
              opcode="LoadUnit"
              keywords="Error"
              template="PrintfMessage"
              level="win:Informational"/>

            <!-- METADATA_STORE_LOADUNIT_STOP -->
            <event value="2015"
              symbol="METADATA_STORE_LOADUNIT_STOP"
              task="METADATA_STORE_LKG"
              opcode="LoadUnit"
              keywords="Performance"
              level="win:Informational"
              message="$(string.BMR.METADATASTORE.STOP)"/>

            <!-- METADATA_STORE_LOADUNITS -->
            <event value="2016"
              symbol="METADATA_STORE_LOADUNITS"
              task="METADATA_STORE_LKG"
              opcode="LoadUnits"
              keywords="Error"
              template="PrintfMessage"
              level="win:Informational"/>

            <!-- METADATA_STORE_GETCOLLECTIONIDS -->
            <event value="2017"
              symbol="METADATA_STORE_GETCOLLECTIONIDS"
              task="METADATA_STORE_LKG"
              opcode="GetCollectionIds"
              keywords="Error"
              level="win:Informational"/>

            <!-- METADATA_STORE_GETCOLLECTIONIDS_MESSAGE -->
            <event value="2018"
              symbol="METADATA_STORE_GETCOLLECTIONIDS_MESSAGE"
              task="METADATA_STORE_LKG"
              opcode="GetCollectionIds"
              keywords="Error"
              template="PrintfMessage"
              level="win:Verbose"/>

            <!-- METADATA_STORE_DELETESTORE -->
            <event value="2019"
              symbol="METADATA_STORE_DELETESTORE"
              task="METADATA_STORE_LKG"
              opcode="DeleteStore"
              keywords="Error"
              template="String"
              level="win:Informational"
              message="$(string.BMR.METADATASTORE.ROOT)" />

            <!-- METADATA_STORE_WARNING -->
            <event value="2020"
              symbol="METADATA_STORE_WARNING"
              task="METADATA_STORE"
              keywords="Error"
              template="PrintfMessage"
              level="win:Warning"/>

            <!-- METADATA_STORE_DELETEUNIT -->
            <event value="2021"
              symbol="METADATA_STORE_DELETEUNIT"
              task="METADATA_STORE_SESSION"
              opcode="Delete"
              keywords="Error"
              template="PrintfMessage"
              level="win:Informational"/>

            <!-- METADATA_STORE_CANCELUNIT -->
            <event value="2022"
              symbol="METADATA_STORE_CANCELUNIT"
              task="METADATA_STORE_SESSION"
              opcode="Undo"
              keywords="Error"
              template="PrintfMessage"
              level="win:Informational"/>
            
            <!-- TRANSFER_PROFILE -->
            <event value="3000"
              symbol="TRANSFER_PROFILE"
              task="TRANSFER"
              opcode="SendReceive"
              keywords="Error"
              template="TransferProfile"
              level="win:Informational"
              message="$(string.BMR.TRANSFER.PROFILE)"/>

            <!-- TRANSFER_CANCEL -->
            <event value="3001"
              symbol="TRANSFER_CANCEL"
              task="TRANSFER"
              opcode="Cancel"
              keywords="Error"
              template="Guid"
              level="win:Informational"
              message="$(string.BMR.TRANSFER.CANCEL)"/>
            
            <!-- TRANSFER_TIMEBOUND_STATUS_OK -->
            <event value="3002"
              symbol="TRANSFER_TIMEBOUND_STATUS_OK"
              task="TRANSFER"
              opcode="Status"
              keywords="Error"
              template="TransferTimeboundStatus"
              level="win:Informational"
              message="$(string.BMR.TRANSFER.TIMEBOUNDSTATUS)"/>
              
            <!-- TRANSFER_TIMEBOUND_STATUS_ERROR -->
            <event value="3003"
              symbol="TRANSFER_TIMEBOUND_STATUS_ERROR"
              task="TRANSFER"
              opcode="Status"
              keywords="Error"
              template="TransferTimeboundStatus"
              level="win:Error"
              message="$(string.BMR.TRANSFER.TIMEBOUNDSTATUS)"/>
              
            <!-- TRANSFER_URGENT_ONPROGRESS -->
            <event value="3004"
              symbol="TRANSFER_URGENT_ONPROGRESS"
              task="TRANSFER"
              opcode="Status"
              keywords="Error"
              template="TransferUrgentStatus"
              level="win:Verbose"
              message="$(string.BMR.TRANSFER.URGENTONPROGRESS)"/>
              
            <!-- TRANSFER_URGENT_ONCOMPLETE_OK -->
            <event value="3005"
              symbol="TRANSFER_URGENT_ONCOMPLETE_OK"
              task="TRANSFER"
              opcode="Status"
              keywords="Error"
              template="TransferUrgentStatus"
              level="win:Informational"
              message="$(string.BMR.TRANSFER.URGENTONCOMPLETE)"/>
              
            <!-- TRANSFER_URGENT_ONCOMPLETE_ERROR -->
            <event value="3006"
              symbol="TRANSFER_URGENT_ONCOMPLETE_ERROR"
              task="TRANSFER"
              opcode="Status"
              keywords="Error"
              template="TransferUrgentStatus"
              level="win:Error"
              message="$(string.BMR.TRANSFER.URGENTONCOMPLETE)"/>
              
            <!-- TRANSFER_WARNING_REQUEST_NOT_FOUND -->
            <event value="3007"
              symbol="TRANSFER_WARNING_REQUEST_NOT_FOUND"
              task="TRANSFER"
              keywords="Error"
              template="Guid"
              level="win:Warning"
              message="$(string.BMR.TRANSFER.REQUESTNOTFOUND)"/>
              
            <!-- TRANSFER_WARNING_SERVER_QUOTA_WARNING -->
            <event value="3008"
              symbol="TRANSFER_WARNING_SERVER_QUOTA_WARNING"
              task="TRANSFER"
              keywords="Error"
              level="win:Warning"
              message="$(string.BMR.TRANSFER.QUOTAWARNING)"/>
              
            <!-- TRANSFER_WARNING_DESTRUCT_REQUESTS_PENDING -->
            <event value="3009"
              symbol="TRANSFER_WARNING_DESTRUCT_REQUESTS_PENDING"
              task="TRANSFER"
              keywords="Error"
              template="Dword"
              level="win:Warning"
              message="$(string.BMR.TRANSFER.DESTRUCT.REQUESTS.PENDING)"/>
              
            <!-- TRANSFER_WARNING_DESTRUCT_REQUESTS_COMPLETE -->
            <event value="3010"
              symbol="TRANSFER_WARNING_DESTRUCT_REQUESTS_COMPLETE"
              task="TRANSFER"
              keywords="Error"
              level="win:Warning"
              message="$(string.BMR.TRANSFER.DESTRUCT.REQUESTS.COMPLETE)"/>
              
            <!-- TRANSFER_INFO_DESTRUCT_START -->
            <event value="3011"
              symbol="TRANSFER_INFO_DESTRUCT_START"
              task="TRANSFER"
              keywords="Error"
              level="win:Informational"
              message="$(string.BMR.TRANSFER.DESTRUCT.START)"/>
              
            <!-- TRANSFER_INFO_DESTRUCT_COMPLETE -->
            <event value="3012"
              symbol="TRANSFER_INFO_DESTRUCT_COMPLETE"
              task="TRANSFER"
              keywords="Error"
              level="win:Informational"
              message="$(string.BMR.TRANSFER.DESTRUCT.COMPLETE)"/>
              
            <!-- TRANSFER_INFO_ONCOMPLETE_CALLBACK_RETURN -->
            <event value="3013"
              symbol="TRANSFER_INFO_ONCOMPLETE_CALLBACK_RETURN"
              task="TRANSFER"
              keywords="Error"
              level="win:Informational"
              message="$(string.BMR.TRANSFER.ONCOMPLETE.CALLBACK.RETURN)"/>
              
            <!-- TRANSFER_INFO_ONCOMPLETE_FINISH -->
            <event value="3014"
              symbol="TRANSFER_INFO_ONCOMPLETE_FINISH"
              task="TRANSFER"
              keywords="Error"
              level="win:Informational"
              message="$(string.BMR.TRANSFER.ONCOMPLETE.FINISH)"/>

            <event value="3041"
              symbol="SERVICE_BMRSVC_START"
              task="ENGINE_SERVICE"
              opcode="win:Start"
              keywords="Performance Engine"
              level="win:Informational"/>

            <event value="3042"
              symbol="SERVICE_BMRSVC_STOP"
              task="ENGINE_SERVICE"
              opcode="win:Stop"
              keywords="Performance Engine Error"
              level="win:Informational"/>

            <event value="3043"
              symbol="SERVICE_BMRSVC_STOP_COM"
              task="ENGINE_SERVICE"
              opcode="Informational"
              keywords="Error Engine"
              level="win:Informational"
              message="$(string.BMR.SERVICE.STOP.COM)"/>

            <event value="3044"
              symbol="CONFIG_SET_STATE"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="EngineSyncStateFlags"
              level="win:Informational"
              message="$(string.BMR.CONFIG.SET.STATE)"/>

            <event value="3045"
              symbol="SYNC_CANCEL"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="EngineSyncStatus"
              level="win:Informational"
              message="$(string.BMR.SYNC.CANCEL)"/>

            <event value="3046"
              symbol="SYNC_SUBSCRIBE"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="EngineSyncStatus"
              level="win:Informational"
              message="$(string.BMR.SYNC.SUBSCRIBE)"/>

            <event value="3047"
              symbol="ENGINE_OBJECT_CONSTRUCTED"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="PointerString"
              level="win:Verbose"
              message="$(string.BMR.OBJECT.CONSTRUCTED)"/>

            <event value="3048"
              symbol="ENGINE_OBJECT_DESTRUCTED"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="PointerString"
              level="win:Verbose"
              message="$(string.BMR.OBJECT.DESTRUCTED)"/>

            <event value="4000"
              symbol="ENGINE_BACKUP_COLLECT_INFO"
              task="ENGINE_OPERATION"
              opcode="Prepare"
              keywords="Error Engine"
              template="EngineBackupCollectInfo"
              level="win:Informational"
              message="$(string.BMR.ENGINE.BACKUP.COLLECT.INFO)"/>

            <event value="4001"
              symbol="ENGINE_BACKUP_COLLECT_ERROR"
              task="ENGINE_OPERATION"
              opcode="Prepare"
              keywords="Error Engine"
              template="EngineBackupCollectError"
              level="win:Warning"
              message="$(string.BMR.ENGINE.BACKUP.COLLECT.ERROR)"/>

            <event value="4002"
              symbol="ENGINE_REQUEST_ERROR"
              task="ENGINE_OPERATION"
              opcode="Request"
              keywords="Error Engine"
              template="EngineRequestError"
              level="win:Warning"
              message="$(string.BMR.ENGINE.REQUEST.ERROR)"/>

            <event value="4003"
              symbol="ENGINE_REQUEST_INFO"
              task="ENGINE_OPERATION"
              opcode="Request"
              keywords="Error Engine"
              template="EngineRequestError"
              level="win:Informational"
              message="$(string.BMR.ENGINE.REQUEST.INFO)"/>

            <event value="4004"
              symbol="ENGINE_TASK_START"
              task="ENGINE_OPERATION"
              opcode="win:Start"
              keywords="Performance Engine"
              template="EngineTask"
              level="win:Informational"/>

            <event value="4005"
              symbol="ENGINE_TASK_STOP"
              task="ENGINE_OPERATION"
              opcode="win:Stop"
              keywords="Performance Engine"
              template="EngineTask"
              level="win:Informational"/>

            <event value="4006"
              symbol="ENGINE_TRANSPORT_START"
              task="ENGINE_TRANSPORT"
              opcode="win:Start"
              keywords="Performance Engine"
              template="EngineTransport"
              level="win:Informational"/>

            <event value="4007"
              symbol="ENGINE_TRANSPORT_STOP"
              task="ENGINE_TRANSPORT"
              opcode="win:Stop"
              keywords="Performance Engine"
              template="EngineTransport"
              level="win:Informational"/>

            <event value="4008"
              symbol="ENGINE_RESTORE_COLLECT_INFO"
              task="ENGINE_OPERATION"
              opcode="Prepare"
              keywords="Error Engine"
              template="EngineBackupCollectInfo"
              level="win:Informational"
              message="$(string.BMR.ENGINE.RESTORE.COLLECT.INFO)"/>

            <event value="4009"
              symbol="ENGINE_RESTORE_APPLY_ERROR"
              task="ENGINE_OPERATION"
              opcode="CommitApply"
              keywords="Error Engine"
              template="EnginePayloadStatus"
              level="win:Warning"
              message="$(string.BMR.ENGINE.RESTORE.APPLY.ERROR)"/>

            <event value="4010"
              symbol="ENGINE_RESTORE_APPLY_UNIT_ERROR"
              task="ENGINE_OPERATION"
              opcode="CommitApply"
              keywords="Error Engine"
              template="EngineUnitStatus"
              level="win:Warning"
              message="$(string.BMR.ENGINE.RESTORE.APPLY.UNIT.ERROR)"/>

            <event value="4011"
              symbol="ENGINE_RESTORE_APPLY_UNIT_INFO"
              task="ENGINE_OPERATION"
              opcode="CommitApply"
              keywords="Error Engine"
              template="EngineUnitInfo"
              level="win:Informational"
              message="$(string.BMR.ENGINE.RESTORE.APPLY.UNIT.INFO)"/>

            <event value="4012"
              symbol="ENGINE_BACKUP_UPLOAD_INFO"
              task="ENGINE_OPERATION"
              opcode="Transport"
              keywords="Error Engine"
              template="EnginePayloadStatus"
              level="win:Informational"
              message="$(string.BMR.ENGINE.BACKUP.UPLOAD.INFO)"/>

            <event value="4013"
              symbol="ENGINE_BACKUP_COMMIT_INFO"
              task="ENGINE_OPERATION"
              opcode="CommitApply"
              keywords="Error Engine"
              template="EnginePayloadStatus"
              level="win:Informational"
              message="$(string.BMR.ENGINE.BACKUP.COMMIT.INFO)"/>

            <event value="4014"
              symbol="ENGINE_BACKUP_UPLOAD_UNIT_ERROR"
              task="ENGINE_OPERATION"
              opcode="Transport"
              keywords="Error Engine"
              template="EngineUnitStatus"
              level="win:Warning"
              message="$(string.BMR.ENGINE.BACKUP.UPLOAD.UNIT.ERROR)"/>

            <event value="4015"
              symbol="ENGINE_OPERATION_DELETED"
              task="ENGINE_OPERATION"
              opcode="CommitApply"
              keywords="Error Engine"
              template="EngineSessionStatus"
              level="win:Informational"
              message="$(string.BMR.ENGINE.OPERATION.DELETED)"/>

            <event value="4016"
              symbol="ENGINE_OPERATION_CANCELLED"
              task="ENGINE_OPERATION"
              opcode="CommitApply"
              keywords="Error Engine"
              template="EngineSessionStatus"
              level="win:Informational"
              message="$(string.BMR.ENGINE.OPERATION.CANCELLED)"/>

            <event value="4017"
              symbol="ENGINE_SESSION_INFO"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="EngineSessionInfo"
              level="win:Informational"
              message="$(string.BMR.ENGINE.SESSION.INFO)"/>

            <event value="4018"
              symbol="ENGINE_SERVER_DATA_LOSS_ERROR"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              level="win:Warning"
              message="$(string.BMR.ENGINE.SERVER.DATA.LOSS.ERROR)"/>

            <event value="4019"
              symbol="ENGINE_STATE_INFO"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="EngineStateInfo"
              level="win:Informational"
              message="$(string.BMR.ENGINE.STATE.INFO)"/>

            <event value="4020"
              symbol="ENGINE_CALLBACK_PROGRESS_INFO"
              task="ENGINE_OPERATION"
              opcode="Transport"
              keywords="Error Engine"
              template="EngineProgressInfo"
              level="win:Verbose"
              message="$(string.BMR.ENGINE.CALLBACK.PROGRESS.INFO)"/>

            <event value="4021"
              symbol="ENGINE_HEARTBEAT"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="EngineBoolean"
              level="win:Informational"
              message="$(string.BMR.ENGINE.HEARTBEAT)"/>

            <event value="4022"
              symbol="ENGINE_CLEANUP"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              level="win:Informational"
              message="$(string.BMR.ENGINE.CLEANUP)"/>

            <event value="4023"
              symbol="ENGINE_THREAD_START"
              task="ENGINE_THREAD"
              opcode="win:Start"
              keywords="Performance Engine"
              level="win:Informational"/>

            <event value="4024"
              symbol="ENGINE_THREAD_STOP"
              task="ENGINE_THREAD"
              opcode="win:Stop"
              keywords="Performance Engine"
              level="win:Informational"/>

            <event value="4025"
              symbol="ENGINE_LOG_SYNC"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="EngineLogSyncInfo"
              level="win:Informational"
              message="$(string.BMR.ENGINE.LOG.SYNC)"/>

            <event value="4026"
              symbol="CONFIG_SET_LAST_KNOWN_GOOD_SYNC_TIME"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="EngineLastKnownGoodSyncTime"
              level="win:Informational"
              message="$(string.BMR.CONFIG.SET.LAST.KNOWN.GOOD.SYNC.TIME)"/>

            <event value="4027"
              symbol="CONFIG_SET_LAST_SYNC_STATUS"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="EngineLastSyncStatus"
              level="win:Informational"
              message="$(string.BMR.CONFIG.SET.LAST.SYNC.STATUS)"/>

            <event value="4028"
              symbol="CONFIG_CLEAR_LAST_SYNC_STATUS"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              level="win:Informational"
              message="$(string.BMR.CONFIG.CLEAR.LAST.SYNC.STATUS)"/>

            <event value="4029"
              symbol="CONFIG_CLEAR_LAST_KNOWN_GOOD_SYNC_TIME"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              level="win:Informational"
              message="$(string.BMR.CONFIG.CLEAR.LAST.KNOWN.GOOD.SYNC.TIME)"/>

            <event value="4030"
              symbol="CONFIG_DEVICE_PROFILE"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="DeviceProfile"
              level="win:Informational"
              message="$(string.BMR.CONFIG.DEVICE.PROFILE)"/>

            <event value="4031"
              symbol="SERVICE_COM_SERVER_START"
              task="ENGINE_SERVER"
              opcode="win:Start"
              keywords="Performance Engine"
              level="win:Informational"/>

            <event value="4032"
              symbol="SERVICE_COM_SERVER_STOP"
              task="ENGINE_SERVER"
              opcode="win:Stop"
              keywords="Performance Engine"
              level="win:Informational"/>

            <event value="4033"
              symbol="ENGINE_GLOBAL_MUTEX_ACQUIRING"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              level="win:Informational"
              message="$(string.BMR.ENGINE.GLOBAL.MUTEX.ACQUIRING)"/>

            <event value="4034"
              symbol="ENGINE_GLOBAL_MUTEX_ACQUIRED"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="Hr"
              level="win:Informational"
              message="$(string.BMR.ENGINE.GLOBAL.MUTEX.ACQUIRED)"/>

            <event value="4035"
              symbol="ENGINE_GLOBAL_MUTEX_RELEASED"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              level="win:Informational"
              message="$(string.BMR.ENGINE.GLOBAL.MUTEX.RELEASED)"/>

            <event value="4036"
              symbol="ENGINE_SET_LAST_CELL_ALLOWED_SYNC_TIME"
              task="ENGINE_OPERATION"
              opcode="Complete"
              keywords="Error Engine"
              template="EngineLastKnownGoodSyncTime"
              level="win:Informational"
              message="$(string.BMR.ENGINE.SET.LAST.CELL.ALLOWED.SYNC.TIME)"/>

            <event value="4037"
              symbol="ENGINE_RESTORE_STORE_METADATAUNIT_ERROR"
              task="ENGINE_OPERATION"
              opcode="CommitApply"
              keywords="Error Engine"
              template="EngineUnitStatus"
              level="win:Warning"
              message="$(string.BMR.ENGINE.RESTORE.STORE.METADATAUNIT.ERROR)"/>

            <event value="4038"
              symbol="ENGINE_RESTORE_COMMIT_INFO"
              task="ENGINE_OPERATION"
              opcode="CommitApply"
              keywords="Error Engine"
              template="EnginePayloadStatus"
              level="win:Informational"
              message="$(string.BMR.ENGINE.RESTORE.COMMIT.INFO)"/>

            <event value="5000"
              symbol="SH_COLLECTION_START"
              task="SH"
              keywords="Performance"
              opcode="win:Start"
              level="win:Informational"
              template="String"
              message="$(string.BMR.SETTINGCOLLECTION)"/>

            <event value="5001"
              symbol="SH_COLLECTION_STOP"
              task="SH"
              keywords="Performance"
              opcode="win:Stop"
              level="win:Informational"/>

            <event value="5002"
              symbol="SH_READ_UNIT_START"
              task="SH_READ_UNIT"
              keywords="Performance"
              opcode="win:Start"
              level="win:Informational"
              template="String"
              message="$(string.BMR.SETTINGUNIT)"/>
              
            <event value="5003"
              symbol="SH_READ_UNIT_STOP"
              task="SH_READ_UNIT"
              keywords="Performance"
              opcode="win:Stop"
              level="win:Informational"/>

            <event value="5004"
              symbol="SH_READ_SETTING_START"
              task="SH_READ_SETTING"
              keywords="Performance"
              opcode="win:Start"
              level="win:Informational"
              template="StringString"
              message="$(string.BMR.SETTING)"/>
              
            <event value="5005"
              symbol="SH_READ_SETTING_STOP"
              task="SH_READ_SETTING"
              keywords="Performance"
              opcode="win:Stop"
              level="win:Informational"/>

            <event value="5006"
              symbol="SH_READ_SETTING_UNIT_ERROR"
              task="SH_READ_UNIT"
              keywords="Error"
              level="win:Error"
              template="Hr"
              message="$(string.BMR.HR)"/>
              
            <event value="5007"
              symbol="SH_READ_SETTING_ERROR"
              task="SH_READ_SETTING"
              keywords="Error"
              level="win:Error"
              template="Hr"
              message="$(string.BMR.HR)"/>

            <event value="5008"
              symbol="SH_READ_SETTING_UNIT_WARNING"
              task="SH_READ_UNIT"
              keywords="Error"
              level="win:Warning"
              template="Hr"
              message="$(string.BMR.HR)"/>
              
            <event value="5009"
              symbol="SH_READ_SETTING_WARNING"
              task="SH_READ_SETTING"
              keywords="Error"
              level="win:Warning"
              template="Hr"
              message="$(string.BMR.HR)"/>

            <event value="5010"
              symbol="SH_WRITE_UNIT_START"
              task="SH_WRITE_UNIT"
              keywords="Performance"
              opcode="win:Start"
              level="win:Informational"
              template="String"
              message="$(string.BMR.SETTINGUNIT)"/>
              
            <event value="5011"
              symbol="SH_WRITE_UNIT_STOP"
              task="SH_WRITE_UNIT"
              keywords="Performance"
              opcode="win:Stop"
              level="win:Informational"/>

            <event value="5012"
              symbol="SH_WRITE_SETTING_START"
              task="SH_WRITE_SETTING"
              keywords="Performance"
              opcode="win:Start"
              level="win:Informational"
              template="StringString"
              message="$(string.BMR.SETTING)"/>
              
            <event value="5013"
              symbol="SH_WRITE_SETTING_STOP"
              task="SH_WRITE_SETTING"
              keywords="Performance"
              opcode="win:Stop"
              level="win:Informational"/>

            <event value="5014"
              symbol="SH_WRITE_SETTING_UNIT_ERROR"
              task="SH_WRITE_UNIT"
              keywords="Error"
              level="win:Error"
              template="Hr"
              message="$(string.BMR.HR)"/>
              
            <event value="5015"
              symbol="SH_WRITE_SETTING_ERROR"
              task="SH_WRITE_SETTING"
              keywords="Error"
              level="win:Error"
              template="Hr"
              message="$(string.BMR.HR)"/>

            <event value="5016"
              symbol="SH_WRITE_SETTING_UNIT_WARNING"
              task="SH_WRITE_UNIT"
              keywords="Error"
              level="win:Warning"
              template="Hr"
              message="$(string.BMR.HR)"/>
              
            <event value="5017"
              symbol="SH_WRITE_SETTING_WARNING"
              task="SH_WRITE_SETTING"
              keywords="Error"
              level="win:Warning"
              template="Hr"
              message="$(string.BMR.HR)"/>

            <event value="5018"
              symbol="SH_COLLECTION_ERROR"
              task="SH"
              keywords="Error"
              level="win:Error"
              template="Hr"
              message="$(string.BMR.HR)"/>

            <event value="5019"
              symbol="SH_READ_SETTING_WILDCARD"
              task="SH_READ_SETTING"
              keywords="Performance"
              level="win:Informational"
              template="String"
              message="$(string.BMR.SETTINGNAME)"/>

            <event value="6000"
              symbol="CS_WRITE_COLLECTION_GET"
              task="CS_WRITE"
              opcode="GetCollection"
              keywords="Performance"
              level="win:Informational"
              template="String"
              message="$(string.BMR.SETTINGCOLLECTION)"/>

            <event value="6001"
              symbol="CS_WRITE_UNIT_GET"
              task="CS_WRITE"
              opcode="GetUnit"
              keywords="Performance"
              level="win:Informational"
              template="String"
              message="$(string.BMR.SETTINGUNIT)"/>
              
            <event value="6002"
              symbol="CS_WRITE_COLLECTION_SET"
              task="CS_WRITE"
              opcode="SetCollection"
              keywords="Performance"
              level="win:Informational"
              template="String"
              message="$(string.BMR.SETTINGCOLLECTION)"/>

            <event value="6003"
              symbol="CS_WRITE_UNIT_SET"
              task="CS_WRITE"
              opcode="SetUnit"
              keywords="Performance"
              level="win:Informational"
              template="String"
              message="$(string.BMR.SETTINGUNIT)"/>
            
            <event value="6004"
              symbol="CS_READ_COLLECTION"
              task="CS_READ"
              opcode="Collection"
              keywords="Performance"
              level="win:Informational"
              template="String"
              message="$(string.BMR.SETTINGCOLLECTION)"/>

            <event value="6005"
              symbol="CS_READ_UNIT"
              task="CS_READ"
              opcode="Unit"
              keywords="Performance"
              level="win:Informational"
              template="String"
              message="$(string.BMR.SETTINGUNIT)"/>

            <event value="7001"
              symbol="BMRCPL_OBJECT_CONSTRUCTED"
              task="BMRCPL"
              opcode="General"
              keywords="Error BmrCpl"
              template="PointerString"
              level="win:Verbose"
              message="$(string.BMR.OBJECT.CONSTRUCTED)"/>

            <event value="7002"
              symbol="BMRCPL_OBJECT_DESTRUCTED"
              task="BMRCPL"
              opcode="General"
              keywords="Error BmrCpl"
              template="PointerString"
              level="win:Verbose"
              message="$(string.BMR.OBJECT.DESTRUCTED)"/>

            <event value="7003"
              symbol="BMRCPL_DLL_UNLOAD"
              task="BMRCPL"
              opcode="General"
              keywords="Error BmrCpl"
              template="String"
              level="win:Verbose"
              message="$(string.BMR.DLL.UNLOAD)"/>

            <event value="7004"
              symbol="BMRCPL_DLL_CAN_UNLOAD_NOW"
              task="BMRCPL"
              opcode="General"
              keywords="Error BmrCpl"
              template="BooleanString"
              level="win:Verbose"
              message="$(string.BMR.DLL.CAN.UNLOAD.NOW)"/>

            <event value="7010"
              symbol="BMRCPL_REQUEST_UNLOAD"
              task="BMRCPL"
              opcode="Operation"
              keywords="Error BmrCpl"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.REQUEST.UNLOAD)"/>

            <event value="7011"
              symbol="BMRCPL_REQUEST_BACKUP"
              task="BMRCPL"
              opcode="Operation"
              keywords="Error BmrCpl"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.REQUEST.BACKUP)"/>

            <event value="7012"
              symbol="BMRCPL_REQUEST_DELETE"
              task="BMRCPL"
              opcode="Operation"
              keywords="Error BmrCpl"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.REQUEST.DELETE)"/>

            <event value="7013"
              symbol="BMRCPL_REQUEST_CANCEL"
              task="BMRCPL"
              opcode="Operation"
              keywords="Error BmrCpl"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.REQUEST.CANCEL)"/>

            <event value="7015"
              symbol="BMRCPL_START_BACKUP"
              task="BMRCPL"
              opcode="Operation"
              version="1"
              keywords="Error BmrCpl"
              template="Dword"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.START.BACKUP)"/>

            <event value="7016"
              symbol="BMRCPL_START_WPS_DELETE"
              task="BMRCPL"
              opcode="Operation"
              keywords="Error BmrCpl"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.START.WPS.DELETE)"/>

            <event value="7017"
              symbol="BMRCPL_CANCEL"
              task="BMRCPL"
              opcode="Operation"
              version="1"
              keywords="Error BmrCpl"
              template="Dword"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.CANCEL)"/>

            <event value="7018"
              symbol="BMRCPL_IN_PROGRESS"
              task="BMRCPL"
              opcode="Operation"
              version="1"
              keywords="Error BmrCpl"
              template="DwordHr"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.IN.PROGRESS)"/>

            <event value="7019"
              symbol="BMRCPL_PROGRESS_HANDLER"
              task="BMRCPL"
              opcode="Callback"
              version="1"
              keywords="Error BmrCpl"
              template="DwordBoolean"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.PROGRESS.HANDLER)"/>

            <event value="7020"
              symbol="BMRCPL_BACKUP_COMPLETE"
              task="BMRCPL"
              opcode="Callback"
              version="1"
              keywords="Error BmrCpl"
              template="Hr"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.BACKUP.COMPLETE)"/>

            <event value="7021"
              symbol="BMRCPL_COOKIE_STORED"
              task="BMRCPL"
              opcode="Operation"
              version="1"
              keywords="Error BmrCpl"
              template="Dword"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.COOKIE.STORED)"/>

            <event value="7022"
              symbol="BMRCPL_COOKIE_REMOVED"
              task="BMRCPL"
              opcode="Operation"
              version="1"
              keywords="Error BmrCpl"
              template="Dword"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.COOKIE.REMOVED)"/>

            <event value="7023"
              symbol="BMRCPL_DELETE_COMPLETE"
              task="BMRCPL"
              opcode="Callback"
              version="0"
              keywords="Error BmrCpl"
              template="DeleteBackupTypeHr"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.DELETE.COMPLETE)"/>
            
            <event value="7024"
              symbol="BMRCPL_BACKUP_STATUS_CHANGED"
              task="BMRCPL"
              opcode="Callback"
              version="1"
              keywords="Error BmrCpl"
              template="BackupEngineState"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.BACKUP.STATUS.CHANGED)"/>

            <event value="7025"
              symbol="BMRCPL_BACKUP_STATUS_CHANGED_NAME"
              task="BMRCPL"
              opcode="Callback"
              version="1"
              keywords="Error BmrCpl"
              template="BackupEngineStateCollectionName"
              level="win:Informational"
              message="$(string.BMR.BMRCPL.BACKUP.STATUS.CHANGED.COLLECTION.NAME)"/>

            <event value="8000"
              symbol="XML_NODETYPE_ERROR"
              task="XMLPARSER"
              keywords="Error"
              template="NodeType"
              level="win:Error"
              message="$(string.BMR.XML.NODETYPE.ERROR)"/>

            <event value="8001"
              symbol="XML_NODETYPE_COMPARISON_ERROR"
              task="XMLPARSER"
              keywords="Error"
              template="NodeTypeComparison"
              level="win:Error"
              message="$(string.BMR.XML.NODETYPE.COMPARISON.ERROR)"/>

            <event value="8002"
              symbol="XML_NODENAME_ERROR"
              task="XMLPARSER"
              keywords="Error"
              template="NodeNameOrValue"
              level="win:Error"
              message="$(string.BMR.XML.NODENAME.ERROR)"/>

            <event value="8003"
              symbol="XML_NODENAME_COMPARISON_ERROR"
              task="XMLPARSER"
              keywords="Error"
              template="NodeNameOrValueComparison"
              level="win:Error"
              message="$(string.BMR.XML.NODENAME.COMPARISON.ERROR)"/>

            <event value="8004"
              symbol="XML_NODEVALUE_ERROR"
              task="XMLPARSER"
              keywords="Error"
              template="NodeNameOrValue"
              level="win:Error"
              message="$(string.BMR.XML.NODEVALUE.ERROR)"/>

            <event value="8005"
              symbol="XML_NODEVALUE_COMPARISON_ERROR"
              task="XMLPARSER"
              keywords="Error"
              template="NodeNameOrValueComparison"
              level="win:Error"
              message="$(string.BMR.XML.NODEVALUE.COMPARISON.ERROR)"/>

            <event value="9000"
              symbol="PROFILEPARSER_MISSINGDEVICEID_ERROR"
              task="PROFILEPARSER"
              keywords="Error"
              template="Hr"
              level="win:Error"
              message="$(string.BMR.PROFILEPARSER.MISSINGDEVICEID.ERROR)"/>

            <event value="9001"
              symbol="PROFILEPARSER_DUPLICATEDEVICEID_ERROR"
              task="PROFILEPARSER"
              keywords="Error"
              template="Hr"
              level="win:Error"
              message="$(string.BMR.PROFILEPARSER.DUPLICATEDEVICEID.ERROR)"/>
              
            <event value="9002"
              symbol="PROFILEPARSER_STATE_CHANGE"
              task="PROFILEPARSER"
              keywords="Error"
              template="ProfileParserStateChange"
              level="win:Informational"
              message="$(string.BMR.PROFILEPARSER.STATECHANGE)"/>
              
        </events>

      </provider>
    </events>
  </instrumentation>

  <!-- Localizable strings for the MyProvider Events -->
  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="BMR.INFO"               value="INFO: %1" />
        <string id="BMR.WARN"               value="WARNING: %1" />
        <string id="BMR.ERROR"              value="ERROR: hr=[%1], %2" />
        <string id="BMR.HR"                 value="ERROR: hr=[%1]" />
        <string id="BMR.PERFORMANCE"        value="PERFORMANCE: %1" />
        <string id="BMR.COUNT"              value="COUNT: %1" />
        <string id="BMR.SETTING"            value="Setting Name: [%1] Path: [%2]" />
        <string id="BMR.SETTINGNAME"        value="Setting Name: [%1]" />
        <string id="BMR.SETTINGUNIT"        value="Setting Unit: [%1]" />
        <string id="BMR.SETTINGCOLLECTION"  value="Setting Collection: [%1]" />

        <string id="BMR.METADATASTORE.START"        value="Start"/>
        <string id="BMR.METADATASTORE.STOP"         value="Stop"/>
        <string id="BMR.METADATASTORE.ROOT"         value="Root: %1"/>
        <string id="BMR.METADATASTORE.SESSION"      value="SessionId: %1"/>
        
        <string id="BMR.TRANSFER.PROFILE"           value="JobId[%1] ProfileName[%2] TimeboundMinutes[%3] TargetPath[%4] UserIdentity[%5] CellAllowed[%6] BatteryAllowed[%7] Size[%8]"/>
        <string id="BMR.TRANSFER.CANCEL"            value="JobId[%1]"/>
        <string id="BMR.TRANSFER.TIMEBOUNDSTATUS"   value="Timebound Status: JobId[%1] Hresult[%2] Pending[%3] Time[%4] DcpHttpStatus[%5] PartnerHttpStatus[%6]"/>
        <string id="BMR.TRANSFER.URGENTONPROGRESS"  value="Urgent Progress: JobId[%1] Hresult[%2] Uploaded[%3] TotalUpload[%4] Downloaded[%5] TotalDownload[%6] DcpHttpStatus[%7] PartnerHttpStatus[%8]"/>
        <string id="BMR.TRANSFER.URGENTONCOMPLETE"  value="Urgent Complete: JobId[%1] Hresult[%2] Uploaded[%3] TotalUpload[%4] Downloaded[%5] TotalDownload[%6] DcpHttpStatus[%7] PartnerHttpStatus[%8]"/>
        <string id="BMR.TRANSFER.REQUESTNOTFOUND"   value="Request [%1] not found"/>
        <string id="BMR.TRANSFER.QUOTAWARNING"      value="Server returned quota warning"/>
        <string id="BMR.TRANSFER.ONCOMPLETE.FINISH" value="Completion callback exiting"/>
        <string id="BMR.TRANSFER.ONCOMPLETE.CALLBACK.RETURN" value="OnComplete callback returns"/>
        <string id="BMR.TRANSFER.DESTRUCT.REQUESTS.PENDING"  value="Destructing with [%1] pending requests"/>
        <string id="BMR.TRANSFER.DESTRUCT.REQUESTS.COMPLETE" value="Wait for pending requests while destructing complete"/>
        <string id="BMR.TRANSFER.DESTRUCT.START"    value="Destructor entering"/>
        <string id="BMR.TRANSFER.DESTRUCT.COMPLETE" value="Destructor exiting"/>
        
        <string id="BMR.ENGINE.BACKUP.COLLECT.RESULT.ADD.NEW" value="Added as new"/>
        <string id="BMR.ENGINE.BACKUP.COLLECT.RESULT.ADD.FORCED" value="Added as forced"/>
        <string id="BMR.ENGINE.BACKUP.COLLECT.RESULT.ADD.CHANGED" value="Added as changed"/>
        <string id="BMR.ENGINE.BACKUP.COLLECT.RESULT.ADD.ANYWAY" value="Added anyway"/>
        <string id="BMR.ENGINE.BACKUP.COLLECT.RESULT.ADD.DELETE" value="Added as deleted"/>
        <string id="BMR.ENGINE.BACKUP.COLLECT.RESULT.SKIP.NOTTIER0" value="Skipped since not Tier 0"/>
        <string id="BMR.ENGINE.BACKUP.COLLECT.RESULT.SKIP.NOCHANGE" value="Skipped since no change"/>
        <string id="BMR.ENGINE.BACKUP.COLLECT.RESULT.FAIL.DELETE" value="Failed to delete"/>
        <string id="BMR.ENGINE.BACKUP.COLLECT.RESULT.FAIL.COLLECT" value="Failed to collecte"/>
        <string id="BMR.ENGINE.RESTORE.COLLECT.RESULT.ADD.UNIT" value="Added per unit"/>
        <string id="BMR.ENGINE.RESTORE.COLLECT.RESULT.ADD.COLLECTION" value="Added per collection"/>
        <string id="BMR.ENGINE.RESTORE.COLLECT.RESULT.SKIP.PAYLOAD1" value="Skipped since not payload1"/>
        <string id="BMR.ENGINE.RESTORE.COLLECT.RESULT.SKIP.PAYLOAD2" value="Skipped since not payload2"/>
        
        <string id="BMR.ENGINE.DELETE.TYPE.ALL" value="Delete entire backup" />
        <string id="BMR.ENGINE.DELETE.TYPE.APPS" value="Delete app data only" />
        
        <string id="BMR.ENGINE.BACKUP.COLLECT.INFO" value="Collected setting unit [%1-%2] for backup as [%3]" />
        <string id="BMR.ENGINE.BACKUP.COLLECT.ERROR" value="Failed collecting setting unit [%1-%2] for backup as [%3] with error code [%4]" />

        <string id="BMR.ENGINE.REQUEST.OPERATION.NONE" value="None"/>
        <string id="BMR.ENGINE.REQUEST.OPERATION.DOWNLOAD" value="Download"/>
        <string id="BMR.ENGINE.REQUEST.OPERATION.UPLOAD" value="Upload"/>
        <string id="BMR.ENGINE.REQUEST.OPERATION.LOCALDELETE" value="Delete local metadata store"/>
        <string id="BMR.ENGINE.REQUEST.OPERATION.REMOTEDELETE" value="Delete remote backup"/>

        <string id="BMR.ENGINE.BACKUP.COMPLETE" value="Backup Complete" />
        <string id="BMR.ENGINE.BACKUP.NEEDED" value="Backup Needed" />
        <string id="BMR.ENGINE.BACKUP.RUNNING" value="Backup Running" />
        
        <string id="BMR.ENGINE.REQUEST.FAIL.INVALID.LIVEID.FLAG" value="there exists an invalid liveid flag"/>
        <string id="BMR.ENGINE.REQUEST.FAIL.TIMEBOUND.RESTORE.NOT.SUPPORTED" value="timebound restore is not supported"/>
        <string id="BMR.ENGINE.REQUEST.FAIL.INVALID.NOOP.FLAG" value="there exists an invalid noop flag"/>
        <string id="BMR.ENGINE.REQUEST.FAIL.DEVICEINFORMATION.RESTORE.NOT.SUPPORTED" value="device information restore is not supported"/>
        <string id="BMR.ENGINE.REQUEST.FAIL.WINDOWSPHONE.DISABLED" value="windows phone backup and restore is disabled"/>
        <string id="BMR.ENGINE.REQUEST.FAIL.LIVEID.NOT.AVAILABLE" value="liveid is not signed up"/>
        <string id="BMR.ENGINE.REQUEST.FAIL.TIMEBOUND.RESTORE.QUEUED" value="timebound restore is queued already"/>
        <string id="BMR.ENGINE.REQUEST.SUCCESS.BOUND.EXISTING.TASK" value="received and bound with an existing task"/>
        <string id="BMR.ENGINE.REQUEST.SUCCESS.CREATE.NEW.TASK" value="received and created a new task"/>
        <string id="BMR.ENGINE.REQUEST.SUCCESS.REMOVE.TASK.DELETED" value="removed and task is deleted"/>
        <string id="BMR.ENGINE.REQUEST.SUCCESS.REMOVE.TASK.KEPT" value="removed and task is kept"/>
        <string id="BMR.ENGINE.REQUEST.SUCCESS.TASK.COMPLETED" value="task is completed"/>

        <string id="BMR.ENGINE.REQUEST.ERROR" value="Request id[%1] operation[%2] flags[%3] fails because [%4]." />
        <string id="BMR.ENGINE.REQUEST.INFO" value="Request id[%1] operation[%2] flags[%3] result[%4]." />

        <string id="BMR.ENGINE.RESTORE.COLLECT.INFO" value="Collect setting unit [%1-%2] for restore as [%3]" />

        <string id="BMR.ENGINE.RESTORE.APPLY.ERROR" value="Failed applying setting factory [%1] of size [%2] for restore with error code [%3]." />
        <string id="BMR.ENGINE.RESTORE.APPLY.UNIT.ERROR" value="Failed applying setting unit [%1-%2-%3] for restore with error code [%4]." />
        <string id="BMR.ENGINE.RESTORE.APPLY.UNIT.INFO" value="Applied setting unit [%1-%2-%3] for restore." />
        <string id="BMR.ENGINE.BACKUP.UPLOAD.UNIT.ERROR" value="Failed uploading setting unit [%1-%2-%3] for backup with error code [%4]." />

        <string id="BMR.ENGINE.RESTORE.STORE.METADATAUNIT.ERROR" value="Failed saving metadata setting unit [%1-%2-%3] for restore with error code [%4]." />
        <string id="BMR.ENGINE.RESTORE.COMMIT.INFO" value="Commit payload [%1] of size [%2] for restore with status [%3]." />

        <string id="BMR.ENGINE.BACKUP.UPLOAD.INFO" value="Uploading payload [%1] of size [%2] for backup with status [%3]." />
        <string id="BMR.ENGINE.BACKUP.COMMIT.INFO" value="Commit payload [%1] of size [%2] for backup with status [%3]." />

        <string id="BMR.ENGINE.OPERATION.DELETED" value="Deleted session id[%1] operation[%2] flags[%3] with status [%4]." />
        <string id="BMR.ENGINE.OPERATION.CANCELLED" value="Cancelled session id[%1] operation[%2] flags[%3] with status [%4]." />

        <string id="BMR.ENGINE.SESSION.EMPTY" value="Empty" />
        <string id="BMR.ENGINE.SESSION.CANCEL.PENDING.CONFLICT" value="Cancel pending conflict" />
        <string id="BMR.ENGINE.SESSION.URGENT.COMPLETE" value="Urgent completed" />
        <string id="BMR.ENGINE.SESSION.TIMEBOUND.QUEUED" value="Timebound queued" />
        <string id="BMR.ENGINE.SESSION.TIMEBOUND.COMPLETE" value="Timebound completed" />
        <string id="BMR.ENGINE.SESSION.TIMEBOUND.PENDING" value="Timebound pending" />

        <string id="BMR.ENGINE.SESSION.INFO" value="Session id[%1] operation[%2] has been completed as [%3]." />
        <string id="BMR.ENGINE.SERVER.DATA.LOSS.ERROR" value="Server data loss is detected." />

        <string id="BMR.ENGINE.STATE.INFO" value="Session id[%1] operation[%2] flags[%3] has moved from state [%4] to state [%5]." />
        <string id="BMR.ENGINE.CALLBACK.PROGRESS.INFO" value="Callback original-progress[%1] converted-progress[%2] status[%3] state[%4] completed[%5]." />

        <string id="BMR.ENGINE.SYNC.STATE.NONE" value="None" />
        <string id="BMR.ENGINE.SYNC.STATE.PENDING" value="Pending" />
        <string id="BMR.ENGINE.SYNC.STATE.RUNNING" value="Running" />
        <string id="BMR.ENGINE.SYNC.STATE.CANCELLED" value="Cancelled" />
        <string id="BMR.ENGINE.SYNC.STATE.COMPLETE" value="Complete" />
        <string id="BMR.ENGINE.SYNC.STATE.RUNNING.PREPARE" value="Running.Prepare" />
        <string id="BMR.ENGINE.SYNC.STATE.RUNNING.TRANSPORT" value="Running.Transport" />
        <string id="BMR.ENGINE.SYNC.STATE.RUNNING.FINISH" value="Running.Finish" />
        <string id="BMR.ENGINE.SYNC.STATE.RUNNING.COMPLETE" value="Running.Finish.Complete" />

        <string id="BMR.ENGINE.HEARTBEAT" value="Send heartbeat with LiveId [%1]." />
        <string id="BMR.ENGINE.CLEANUP" value="Proceed a cleanup." />

        <string id="BMR.ENGINE.LOG.SYNC" value="Write a SQM log tracing for id[%1].operation[%2] flags[%3] status[%4] failedState[%5] totalTime[%6] transportTime[%7] totalSize[%8] totalCollections[%9] totalUnits[%10] finishedUnits[%11] failedUnits[%12] failedUnitId[%13]" />

        <string id="BMR.CONFIG.SET.LAST.KNOWN.GOOD.SYNC.TIME" value="Set last known good backup timestamp [%1]." />
        <string id="BMR.CONFIG.SET.LAST.SYNC.STATUS" value="Set last backup time [%1].status[%2]" />
        <string id="BMR.CONFIG.CLEAR.LAST.SYNC.STATUS" value="Clear last backup status" />
        <string id="BMR.CONFIG.CLEAR.LAST.KNOWN.GOOD.SYNC.TIME" value="Clear last known good backup timestamp" />
        <string id="BMR.CONFIG.SET.STATE" value="Set BMR state[%1]" />

        <string id="BMR.CONFIG.DEVICE.PROFILE.DIFFERENT" value="Different" />
        <string id="BMR.CONFIG.DEVICE.PROFILE.VIRTUAL" value="Virtual" />
        <string id="BMR.CONFIG.DEVICE.PROFILE.CURRENT" value="Current" />
        <string id="BMR.CONFIG.DEVICE.PROFILE" value="DeviceProfile: id[%1] name[%2] make[%3] model[%4] attributes[%5] size[%6] modifiedtime[%7] valid[%8]" />

        <string id="BMR.CALLBACK.SYNC.STATE.NONE" value="None" />
        <string id="BMR.CALLBACK.SYNC.STATE.CANCEL.ALLOWED" value="Cancel allowed" />
        <string id="BMR.CALLBACK.SYNC.STATE.CANCEL.NOT.ALLOWED" value="Cancel not allowed" />

        <string id="BMR.SYNC.STATE.FLAGS.NONE" value="None" />
        <string id="BMR.SYNC.STATE.FLAGS.ENABLED" value="Enabled" />
        <string id="BMR.SYNC.STATE.FLAGS.DISABLED" value="Disabled" />

        <string id="BMR.SYNC.CANCEL" value="Request cancelled [%1]" />
        <string id="BMR.SYNC.SUBSCRIBE" value="Request subscribed [%1]" />

        <string id="BMR.SERVICE.STOP.COM" value="Service stopped by COM" />

        <string id="BMR.OBJECT.CONSTRUCTED" value="Object constructed [%1] [%2]" />
        <string id="BMR.OBJECT.DESTRUCTED" value="Object destructed [%1] [%2]" />

        <string id="BMR.DLL.UNLOAD" value="Dll unloaded [%1]" />
        <string id="BMR.DLL.CAN.UNLOAD.NOW" value="Dll can unload now [%1] [%2]" />

        <string id="BMR.BMRCPL.REQUEST.UNLOAD" value="Request to unload" />
        <string id="BMR.BMRCPL.REQUEST.BACKUP" value="Request to backup" />
        <string id="BMR.BMRCPL.REQUEST.DELETE" value="Request to delete" />
        <string id="BMR.BMRCPL.REQUEST.CANCEL" value="Request to cancel" />

        <string id="BMR.BMRCPL.START.BACKUP" value="Backup operation started with cookie[%1]" />
        <string id="BMR.BMRCPL.START.WPS.DELETE" value="Started WPS backup delete" />
        <string id="BMR.BMRCPL.CANCEL" value="Cancel operation started with cookie[%1]" />
        <string id="BMR.BMRCPL.IN.PROGRESS" value="Operation is in progress with cookie[%1] status[%2]" />
        <string id="BMR.BMRCPL.COOKIE.STORED" value="Operation cookie[%1] is stored" />
        <string id="BMR.BMRCPL.COOKIE.REMOVED" value="Operation cookie[%1] is removed" />

        <string id="BMR.BMRCPL.PROGRESS.HANDLER" value="Operation progress handler [%1] forwarding[%2]" />
        <string id="BMR.BMRCPL.BACKUP.COMPLETE" value="Backup completed with result [%1]" />
        <string id="BMR.BMRCPL.BACKUP.STATUS.CHANGED" value="Backup status changed with status [%1] at time [%2] for collection [%3] out of [%4] collections" />
        <string id="BMR.BMRCPL.BACKUP.STATUS.CHANGED.COLLECTION.NAME" value="Backup status changed with status [%1] at time [%2] for collection [%3] ([%4] out of [%5] collections)" />
        <string id="BMR.BMRCPL.DELETE.COMPLETE" value="Delete backup of type [%1] completed with result [%2]" />

        <string id="BMR.ENGINE.GLOBAL.MUTEX.ACQUIRING" value="Acquiring the global mutex ..." />
        <string id="BMR.ENGINE.GLOBAL.MUTEX.ACQUIRED" value="The global mutex is acquired [%1]." />
        <string id="BMR.ENGINE.GLOBAL.MUTEX.RELEASED" value="The global mutex is released." />

        <string id="BMR.ENGINE.SET.LAST.CELL.ALLOWED.SYNC.TIME" value="Set last cell allowed backup timestamp [%1]." />

        <string id="BMR.REQUEST.FLAG.ALLOW_SYNC_ON_PAID_CONNECTION" value="CELL" />
        <string id="BMR.REQUEST.FLAG.TIMEBOUND" value="TIMEBOUND" />
        <string id="BMR.REQUEST.FLAG.NO_STATUS" value="NOSTATUS" />
        <string id="BMR.REQUEST.FLAG.PAYLOAD1" value="PAYLOAD1" />
        <string id="BMR.REQUEST.FLAG.PAYLOAD2" value="PAYLOAD2" />
        <string id="BMR.REQUEST.FLAG.TIER0" value="TIER0" />
        <string id="BMR.REQUEST.FLAG.HEART_BEAT_ON_NOOP" value="HEARTBEAT" />
        <string id="BMR.REQUEST.FLAG.FORCE" value="FORCE" />
        <string id="BMR.REQUEST.FLAG.NOOP" value="NOOP" />
        <string id="BMR.REQUEST.FLAG.LIVEID" value="LIVEID" />
        <string id="BMR.REQUEST.FLAG.SERVER_DATA_LOSS" value="DATALOSS" />
        <string id="BMR.REQUEST.FLAG.COMPLETED" value="COMPLETED" />
        <string id="BMR.REQUEST.FLAG.PENDING" value="PENDING" />
        <string id="BMR.REQUEST.FLAG.DEVICEINFORMATION" value="DEVICEINFORMATION" />
        <string id="BMR.REQUEST.FLAG.CANCEL_NOT_ALLOWED" value="NOCANCEL" />
        <string id="BMR.REQUEST.FLAG.CURRENT_DEVICE" value="CURRENTDEVICE" />
        <string id="BMR.REQUEST.FLAG.UNDEFINED" value="UNDEFINED" />

        <string id="BMR.XML.NODETYPE.NONE" value="XMLNODETYPE_NONE" />
        <string id="BMR.XML.NODETYPE.ELEMENT" value="XMLNODETYPE_ELEMENT" />
        <string id="BMR.XML.NODETYPE.ATTRIBUTE" value="XMLNODETYPE_ATTRIBUTE" />
        <string id="BMR.XML.NODETYPE.TEXT" value="XMLNODETYPE_TEXT" />
        <string id="BMR.XML.NODETYPE.CDATA" value="XMLNODETYPE_CDATA" />
        <string id="BMR.XML.NODETYPE.PROCESSINGINSTRUCTION" value="XMLNODETYPE_PROCESSINGINSTRUCTION" />
        <string id="BMR.XML.NODETYPE.COMMENT" value="XMLNODETYPE_COMMENT" />
        <string id="BMR.XML.NODETYPE.DOCUMENTTYPE" value="XMLNODETYPE_DOCUMENTTYPE" />
        <string id="BMR.XML.NODETYPE.WHITESPACE" value="XMLNODETYPE_WHITESPACE" />
        <string id="BMR.XML.NODETYPE.ENDELEMENT" value="XMLNODETYPE_ENDELEMENT" />
        <string id="BMR.XML.NODETYPE.XMLDECLARATION" value="XMLNODETYPE_XMLDECLARATION" />
        
        <string id="BMR.PROFILEPARSER.STATE.RESPONSEHEADER" value="PROFILE_PARSE_STATE_RESPONSEHEADER" />
        <string id="BMR.PROFILEPARSER.STATE.NAMESPACE" value="PROFILE_PARSE_STATE_NAMESPACE" />
        <string id="BMR.PROFILEPARSER.STATE.DEVICEHEADER" value="PROFILE_PARSE_STATE_DEVICEHEADER" />
        <string id="BMR.PROFILEPARSER.STATE.DEVICEPROPERTIES" value="PROFILE_PARSE_STATE_DEVICEPROPERTIES" />
        <string id="BMR.PROFILEPARSER.STATE.DEVICEFOOTER" value="PROFILE_PARSE_STATE_DEVICEFOOTER" />
        <string id="BMR.PROFILEPARSER.STATE.RESPONSEFOOTER" value="PROFILE_PARSE_STATE_RESPONSEFOOTER" />

        <string id="BMR.XML.NODETYPE.ERROR" value="Unexpected XML Node Type[%1] [hr = %2]" />
        <string id="BMR.XML.NODETYPE.COMPARISON.ERROR" value="Unexpected XML Node Type: Expected [%1] Actual [%2] [hr = %3]" />
        <string id="BMR.XML.NODENAME.ERROR" value="Unexpected %1 Name[%2] (Parent[%3]), Error[%4]" />
        <string id="BMR.XML.NODENAME.COMPARISON.ERROR" value="Unexpected %1 Name: Expected[%2] Actual[%3] (Parent[%4]) [hr = %5]" />
        <string id="BMR.XML.NODEVALUE.ERROR" value="Unexpected %1 Value[%2] (Parent[%3]) [hr = %4]" />
        <string id="BMR.XML.NODEVALUE.COMPARISON.ERROR" value="Unexpected %1 Value: Expected[%2] Actual[%3] (Parent[%4]) [hr = %5]" />

        <string id="BMR.PROFILEPARSER.MISSINGDEVICEID.ERROR" value="DeviceId was not found or was empty. [hr = %1]" />
        <string id="BMR.PROFILEPARSER.DUPLICATEDEVICEID.ERROR" value="DeviceId was found more than once. [hr = %1]" />
        <string id="BMR.PROFILEPARSER.STATECHANGE" value="Parser state change [%1]->[%2]" />

        <string id="CLOUDSTORAGECPL_INITIALIZE_PHOTOS_ERROR.529" value="Failed to initialize photos. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_GET_CONVERSATIONS_ENABLED_ERROR.528" value="Failed to check if conversations is enabled. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_ENABLE_TEXT_ERROR.527" value="Failed to enable text backup. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_ENABLE_PHOTOS_ERROR.526" value="Failed to enable photos backup. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_GET_TOTAL_ITEMS_ERROR.525" value="Failed to get total upload items. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_UPLOADTEXT_ERROR.524" value="Failed to upload text. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_UPLOADTEXT_FINISHED_INFO.523" value="Finished text upload."/>
        <string id="CLOUDSTORAGECPL_UPLOADTEXT_STARTED_INFO.522" value="Starting the text upload."/>
        <string id="CLOUDSTORAGECPL_UPLOADMEDIA_ERROR.521" value="Failed to upload media. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_UPLOADMEDIA_FINISHED_INFO.520" value="Finished media upload."/>
        <string id="CLOUDSTORAGECPL_RUN_UPLOADMEDIA_STARTED_INFO.519" value="Starting the media upload."/>
        <string id="CLOUDSTORAGECPL_START_TEXT_UPLOAD_ERROR.518" value="Failed to create thread for text upload. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_START_MEDIA_UPLOAD_ERROR.517" value="Failed to create thread for media upload. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_START_UPLOAD_INFO.516" value="Creating threads for media/text upload."/>
        <string id="CLOUDSTORAGECPL_GET_BACKUPS_COUNT_ERROR.515" value="Failed to get the backups count. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_GET_LAST_BACKUP_DATE_ERROR.514" value="Failed to get the last backup date. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_QUERY_BACKUPS_ERROR.513" value="Failed to query backups. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_START_QUERY_BACKUPS_ERROR.510" value="Failed to create thread for backups query. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_READ_APPLICATION_STATE_FROM_REGISTRY_ERROR.508" value="Failed to read application state from registry."/>
        <string id="CLOUDSTORAGECPL_SET_TOAST_NOTIFICATION_STATE_WARNING.507" value="Couldn't set the toast notification state. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_GET_TOAST_NOTIFICATION_STATE_WARNING.506" value="Couldn't get the toast notification state. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_GET_UPLOAD_USER_SELECTION_WARNING.505" value="Couldn't get user's upload selection. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_SET_UPLOAD_USER_SELECTION_WARNING.504" value="Couldn't set user's upload selection. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_GET_UPLOADED_ITEMS_WARNING.503" value="Couldn't get the uploaded items. hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_SET_UPLOADED_ITEMS_WARNING.502" value="Couldn't set the uploaded items.  hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_SET_UPLOAD_STATE_WARNING.501" value="Couldn't set upload state: hr=[%1]"/>
        <string id="CLOUDSTORAGECPL_GET_UPLOAD_STATE_WARNING.500" value="Failed to read media upload state. hr=[%1]"/>
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
