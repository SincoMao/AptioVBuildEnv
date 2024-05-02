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
<!-- <?xml version="1.0" encoding="UTF-16"?> -->
<instrumentationManifest
    xmlns="http://schemas.microsoft.com/win/2004/08/events"
    xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <instrumentation>
    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-DevMgmt-NvManager"
          guid="{2C8508D3-72FE-4F2B-8314-9EA7F92856FB}"
          resourceFileName="NvManagerSVC.dll"
          messageFileName="NvManagerSVC.dll"
          symbol="MICROSOFT_WINDOWSPHONE_DEVMGMT_NVMANAGER">

        <!--No channel info necessary-->
        <channels />

        <keywords>
            <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
            <keyword name="Error"         mask="0x00000001" />
            <keyword name="Performance"   mask="0x00000002" />            
          
            <!-- Provider-specific keywords -->
            <keyword name="Debug"         mask="0x00000004" />
            <keyword name="NvManager"     mask="0x00000008" />
            <keyword name="ModemToggle"   mask="0x00000010" />
            <keyword name="RadioTimer"    mask="0x00000020" />
            <keyword name="MobileIp"      mask="0x00000040" />
            <keyword name="Nam"           mask="0x00000080" />
            <keyword name="Prl"           mask="0x00000100" />
            <keyword name="Nai"           mask="0x00000200" />
            <keyword name="Nv"            mask="0x00000400" />
            <keyword name="Efs"           mask="0x00000800" />
            <keyword name="ModemMisc"     mask="0x00001000" />
        </keywords>
        
        <tasks>
          <task name="StartService"    symbol="START_SERVICE"     value="1"/>
          <task name="StopService"     symbol="STOP_SERVICE"      value="2"/>
          <task name="WritePrl"        symbol="WRITE_PRL"         value="3"/>
          <task name="ReadPrl"         symbol="READ_PRL"          value="4"/>
          <task name="WriteNv"         symbol="WRITE_NV"          value="5"/>
          <task name="ReadNv"          symbol="READ_NV"           value="6"/>
          <task name="PutItemFile"     symbol="PUT_ITEMFILE"      value="7"/>
          <task name="PutItemFilePath" symbol="PUT_ITEMFILEPATH"  value="8"/>
          <task name="WriteDataFile"   symbol="WRITE_DATAFILE"    value="9"/>
          <task name="PutDataFile"     symbol="PUT_DATAFILE"      value="10"/>
          <task name="GetItemFile"     symbol="GET_ITEMFILE"      value="11"/>
          <task name="GetItemFilePath" symbol="GET_ITEMFILEPATH"  value="12"/>
          <task name="ReadDataFile"    symbol="READ_DATAFILE"     value="13"/>
          <task name="GetDataFile"     symbol="GET_DATAFILE"      value="14"/>
          <task name="GetFileSize"     symbol="GET_FILESIZE"      value="15"/>
          <task name="DeleteFile"      symbol="DELETE_FILE"       value="16"/>
          <task name="DeleteDirectory" symbol="DELETE_DIR"        value="17"/>
          <task name="MakeDirectory"   symbol="MAKE_DIR"          value="18"/>
          <task name="GetContents"     symbol="GET_CONTENTS"      value="19"/>
          <task name="UnlockSPC"       symbol="UNLOCK_SPC"        value="20"/>
        </tasks>
        
        <!-- Enumeration strings -->
        <maps>
          <valueMap name="ModemBand">
            <map value="0" message="$(string.Enums.MODEM_BAND_UNKNOWN)"/>
            <map value="1" message="$(string.Enums.MODEM_BAND_BC10)"/>
            <map value="2" message="$(string.Enums.MODEM_BAND_BC14)"/>
            <map value="3" message="$(string.Enums.MODEM_BAND_BC25)"/>
            <map value="4" message="$(string.Enums.MODEM_BAND_BC26)"/>
            <map value="5" message="$(string.Enums.MODEM_BAND_BC41)"/>
          </valueMap>

          <valueMap name="DirectoryEntryType">
            <map value="0" message="$(string.Enums.DIRECTORY_ENTRY_TYPE_FILE)"/>
            <map value="1" message="$(string.Enums.DIRECTORY_ENTRY_TYPE_DIRECTORY)"/>
            <map value="2" message="$(string.Enums.DIRECTORY_ENTRY_TYPE_SYMLINK)"/>
          </valueMap>

          <valueMap name="ModemFeature">
            <map value="0" message="$(string.Enums.MODEM_FEATURE_UNKNOWN)"/>
            <map value="1" message="$(string.Enums.MODEM_FEATURE_EHRPD)"/>
            <map value="2" message="$(string.Enums.MODEM_FEATURE_1XADVANCED)"/>
            <map value="3" message="$(string.Enums.MODEM_FEATURE_SO68)"/>
            <map value="4" message="$(string.Enums.MODEM_FEATURE_SO73_COP0)"/>
            <map value="5" message="$(string.Enums.MODEM_FEATURE_SO73_COP1TO7)"/>
          </valueMap>

          <valueMap name="RadioTimer">
            <map value="0" message="$(string.Enums.RADIO_TIMER_UNKNOWN)"/>
            <map value="1" message="$(string.Enums.RADIO_LTE_NEXT_SCAN)"/>
            <map value="2" message="$(string.Enums.RADIO_LTE_BSR_TIMER)"/>
            <map value="3" message="$(string.Enums.RADIO_BSR_MAX_TIME)"/>
          </valueMap>

          <valueMap name="DllReason">
            <map value="0" message="$(string.Enums.DLL_PROCESS_DETACH)"/>
            <map value="1" message="$(string.Enums.DLL_PROCESS_ATTACH)"/>
            <map value="2" message="$(string.Enums.DLL_THREAD_ATTACH)"/>
            <map value="3" message="$(string.Enums.DLL_THREAD_DETACH)"/>
          </valueMap>

          <valueMap name="ServiceStatus">
            <map value="1" message="$(string.Enums.SERVICE_STOPPED)"/>
            <map value="2" message="$(string.Enums.SERVICE_START_PENDING)"/>
            <map value="3" message="$(string.Enums.SERVICE_STOP_PENDING)"/>
            <map value="4" message="$(string.Enums.SERVICE_RUNNING)"/>
            <map value="5" message="$(string.Enums.SERVICE_CONTINUE_PENDING)"/>
            <map value="6" message="$(string.Enums.SERVICE_PAUSE_PENDING)"/>
            <map value="7" message="$(string.Enums.SERVICE_PAUSED)"/>
          </valueMap>

          <valueMap name="TrueFalseBoolean">
            <map value="0"  message="$(string.Enums.FALSE)"/>
            <map value="1"  message="$(string.Enums.TRUE)"/>
          </valueMap>

          <valueMap name="OnOffBoolean">
            <map value="0"  message="$(string.Enums.OFF)"/>
            <map value="1"  message="$(string.Enums.ON)"/>
          </valueMap>

        </maps>
        <!--Event Templates -->
        <templates>
          <template tid="HrTemplate">
            <data name="P1_HResult" inType="win:Int32" outType="win:HResult"/>
            <data name="P2_String" inType="win:AnsiString"/>
            <data name="P3_UInt32" inType="win:UInt32"/>
          </template>
          <template tid="OneString">
            <data name="Prop_UnicodeString" inType="win:UnicodeString"  outType="xs:string"/>
          </template>
          <template tid="OneHexTwoStrings">
            <data name="Prop_UnicodeString1" inType="win:UnicodeString"  outType="xs:string"/>
            <data name="Prop_HexInt32_1"     inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="Prop_UnicodeString2" inType="win:UnicodeString"  outType="xs:string"/>
          </template>
          <template tid="TwoStrings">
            <data name="Prop_UnicodeString1" inType="win:UnicodeString"  outType="xs:string"/>
            <data name="Prop_UnicodeString2" inType="win:UnicodeString"  outType="xs:string"/>
          </template>
          <template tid="OneBool">
            <data name="Prop_BOOL"          inType="win:Boolean"        outType="xs:boolean"/>
          </template>
          <template tid="OneBoolTrueFalse">
            <data name="Prop_BOOL"          inType="win:UInt32"         map="TrueFalseBoolean"/>
          </template>
          <template tid="OneBoolOnOff">
            <data name="Prop_BOOL"          inType="win:UInt32"         map="OnOffBoolean"/>
          </template>
          <template tid="BoolAndHexInt">
            <data name="Prop_BOOL"          inType="win:Boolean"        outType="xs:boolean"/>
            <data name="HResult"            inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="StringAndHResult">
            <data name="Prop_UnicodeString" inType="win:UnicodeString"  outType="xs:string"/>
            <data name="HResult"            inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="HexIntAndString">
            <data name="Prop_HexInt32"      inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="Prop_UnicodeString" inType="win:UnicodeString"  outType="xs:string"/>
          </template>
          <template tid="OneHexInt">
            <data name="Prop_HexInt32_1"    inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="TwoHexInts">
            <data name="Prop_HexInt32_1"    inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="Prop_HexInt32_2"    inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="GuidStringHexInt">
            <data name="Prop_Guid"          inType="win:GUID"           outType="xs:GUID"/>
            <data name="Prop_String"        inType="win:UnicodeString"  outType="xs:string"/>
            <data name="Prop_HexInt32"      inType="win:UInt32"         outType="win:HexInt32"/>
          </template>
          <template tid="ServiceStatus">
            <data name="status"             inType="win:UInt32"         map="ServiceStatus"/>
          </template>
          <template tid="DllReason">
            <data name="reason"             inType="win:UInt32"         map="DllReason"/>
          </template>
          <template tid="DirectoryEntry">
            <data name="type"               inType="win:UInt32"         map="DirectoryEntryType"/>
            <data name="size"               inType="win:UInt32"         outType="win:HexInt32"/>
            <data name="name"               inType="win:UnicodeString"  outType="xs:string"/>
          </template>
          <template tid="ModemFeatureBool">
            <data name="feature"            inType="win:UInt32"         map="ModemFeature"/>
            <data name="enable"             inType="win:UInt32"         map="OnOffBoolean"/>
          </template>
          <template tid="ModemBandBool">
            <data name="band"               inType="win:UInt32"         map="ModemBand"/>
            <data name="enable"             inType="win:UInt32"         map="OnOffBoolean"/>
          </template>
          <template tid="RadioTimerInt">
            <data name="timer"              inType="win:UInt32"         map="RadioTimer"/>
            <data name="value"              inType="win:UInt32"         outType="win:HexInt32"/>
          </template>

        </templates>
        <!--All the Events that can be published by this Publisher -->
        <events>
          <event value="1"
            symbol="ErrorOriginateEvent"
            level="win:Error"
            keywords="Error"
            template="HrTemplate"
            message="$(string.Event.ErrorOriginateMessage)"/>

          <!-- NVManager (300) -->
          <event value="300"
            symbol="NVMANAGER_EVENT_DLL_REASON"
            level="win:Informational"
            keywords="NvManager"
            template="DllReason"
            message="$(string.Publisher.DllReason)"/>

          <event value="301"
            symbol="NVMANAGER_EVENT_UPDATE_STATUS"
            level="win:Informational"
            keywords="NvManager"
            template="ServiceStatus"
            message="$(string.Publisher.ServiceStatus)"/>

          <!-- ModemToggle (400) -->
          <event value="400"
            symbol="MODEMTOGGLE_SETFEATURE"
            level="win:Informational"
            keywords="ModemToggle"
            template="ModemFeatureBool"
            message="$(string.Publisher.SetModemFeature)"/>

          <event value="401"
            symbol="MODEMTOGGLE_SETBAND"
            level="win:Informational"
            keywords="ModemToggle"
            template="ModemBandBool"
            message="$(string.Publisher.SetModemBand)"/>

          <event value="402"
            symbol="MODEMTOGGLE_GETFEATURE"
            level="win:Informational"
            keywords="ModemToggle"
            template="ModemFeatureBool"
            message="$(string.Publisher.GetModemFeature)"/>

          <event value="403"
            symbol="MODEMTOGGLE_GETBAND"
            level="win:Informational"
            keywords="ModemToggle"
            template="ModemBandBool"
            message="$(string.Publisher.GetModemBand)"/>

          <!-- RadioTimer (500) -->
          <event value="500"
            symbol="RADIOTIMER_SET"
            level="win:Informational"
            keywords="RadioTimer"
            template="RadioTimerInt"
            message="$(string.Publisher.SetRadioTimer)"/>

          <event value="501"
            symbol="RADIOTIMER_GET"
            level="win:Informational"
            keywords="RadioTimer"
            template="RadioTimerInt"
            message="$(string.Publisher.GetRadioTimer)"/>

          <!-- MobileIp (600) -->
          <event value="600"
            symbol="MOBILEIP_INITIALIZE"
            level="win:Informational"
            keywords="MobileIp"
            template="OneHexInt"
            message="$(string.Publisher.MobileIpInitialize)"/>

          <event value="601"
            symbol="MOBILEIP_PUTIPADDRESS"
            level="win:Informational"
            keywords="MobileIp"
            template="OneString"
            message="$(string.Publisher.MobileIpPutIpAddress)"/>

          <event value="602"
            symbol="MOBILEIP_GETIPADDRESS"
            level="win:Informational"
            keywords="MobileIp"
            template="OneString"
            message="$(string.Publisher.MobileIpGetIpAddress)"/>

          <event value="603"
            symbol="MOBILEIP_PUTNAI"
            level="win:Informational"
            keywords="MobileIp"
            template="OneString"
            message="$(string.Publisher.MobileIpPutNai)"/>

          <event value="604"
            symbol="MOBILEIP_GETNAI"
            level="win:Informational"
            keywords="MobileIp"
            template="OneString"
            message="$(string.Publisher.MobileIpGetNai)"/>

          <event value="605"
            symbol="MOBILEIP_PUTTETHEREDNAI"
            level="win:Informational"
            keywords="MobileIp"
            template="OneString"
            message="$(string.Publisher.MobileIpPutTetheredNai)"/>

          <event value="606"
            symbol="MOBILEIP_GETTETHEREDNAI"
            level="win:Informational"
            keywords="MobileIp"
            template="OneString"
            message="$(string.Publisher.MobileIpGetTetheredNai)"/>

          <event value="607"
            symbol="MOBILEIP_PUTSHAREDSECRET"
            level="win:Informational"
            keywords="MobileIp"
            template="TwoStrings"
            message="$(string.Publisher.MobileIpPutSharedSecret)"/>

          <event value="608"
            symbol="MOBILEIP_PUTPRIMARYHAIPADDRESS"
            level="win:Informational"
            keywords="MobileIp"
            template="OneString"
            message="$(string.Publisher.MobileIpPutPrimaryHAIpAddress)"/>

          <event value="609"
            symbol="MOBILEIP_GETPRIMARYHAIPADDRESS"
            level="win:Informational"
            keywords="MobileIp"
            template="OneString"
            message="$(string.Publisher.MobileIpGetPrimaryHAIpAddress)"/>

          <event value="610"
            symbol="MOBILEIP_PUTSECONDARYHAIPADDRESS"
            level="win:Informational"
            keywords="MobileIp"
            template="OneString"
            message="$(string.Publisher.MobileIpPutSecondaryHAIpAddress)"/>

          <event value="611"
            symbol="MOBILEIP_GETSECONDARYHAIPADDRESS"
            level="win:Informational"
            keywords="MobileIp"
            template="OneString"
            message="$(string.Publisher.MobileIpGetSecondaryHAIpAddress)"/>

          <event value="612"
            symbol="MOBILEIP_PUTREVERSETUNNELING"
            level="win:Informational"
            keywords="MobileIp"
            template="OneBool"
            message="$(string.Publisher.MobileIpPutReverseTunneling)"/>

          <event value="613"
            symbol="MOBILEIP_GETREVERSETUNNELING"
            level="win:Informational"
            keywords="MobileIp"
            template="OneBool"
            message="$(string.Publisher.MobileIpGetReverseTunneling)"/>

          <event value="614"
            symbol="MOBILEIP_PUTSPIHA"
            level="win:Informational"
            keywords="MobileIp"
            template="OneHexInt"
            message="$(string.Publisher.MobileIpPutSpiHA)"/>

          <event value="615"
            symbol="MOBILEIP_GETSPIHA"
            level="win:Informational"
            keywords="MobileIp"
            template="OneHexInt"
            message="$(string.Publisher.MobileIpGetSpiHA)"/>

          <event value="616"
            symbol="MOBILEIP_PUTSPIAAA"
            level="win:Informational"
            keywords="MobileIp"
            template="OneHexInt"
            message="$(string.Publisher.MobileIpPutSpiAAA)"/>

          <event value="617"
            symbol="MOBILEIP_GETSPIAAA"
            level="win:Informational"
            keywords="MobileIp"
            template="OneHexInt"
            message="$(string.Publisher.MobileIpGetSpiAAA)"/>

          <!-- Nam (700) -->
          <event value="700"
            symbol="NAM_PUTMDN"
            level="win:Informational"
            keywords="Nam"
            template="OneString"
            message="$(string.Publisher.NamPutMobDirNum)"/>

          <event value="701"
            symbol="NAM_GETMDN"
            level="win:Informational"
            keywords="Nam"
            template="OneString"
            message="$(string.Publisher.NamGetMobDirNum)"/>

          <event value="702"
            symbol="NAM_PUTMSID"
            level="win:Informational"
            keywords="Nam"
            template="OneString"
            message="$(string.Publisher.NamPutMsid)"/>

          <event value="703"
            symbol="NAM_GETMSID"
            level="win:Informational"
            keywords="Nam"
            template="OneString"
            message="$(string.Publisher.NamGetMsid)"/>

          <event value="704"
            symbol="NAM_PUTMCC"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamPutMcc)"/>

          <event value="705"
            symbol="NAM_GETMCC"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamGetMcc)"/>

          <event value="706"
            symbol="NAM_PUTIMSI_11_12"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamPutImsi_11_12)"/>

          <event value="707"
            symbol="NAM_GETIMSI_11_12"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamGetImsi_11_12)"/>

          <event value="708"
            symbol="NAM_PUTIMSIS2"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamPutImsiS2)"/>

          <event value="709"
            symbol="NAM_GETIMSIS2"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamGetImsiS2)"/>

          <event value="710"
            symbol="NAM_PUTIMSIS1"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamPutImsiS1)"/>

          <event value="711"
            symbol="NAM_GETIMSIS1"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamGetImsiS1)"/>

          <event value="712"
            symbol="NAM_PUTACCOLC"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamPutAccolc)"/>

          <event value="713"
            symbol="NAM_GETACCOLC"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamGetAccolc)"/>

          <event value="714"
            symbol="NAM_PUTMOBILETERMINALHOME"
            level="win:Informational"
            keywords="Nam"
            template="OneBoolOnOff"
            message="$(string.Publisher.NamPutMobileTerminalHome)"/>

          <event value="715"
            symbol="NAM_GETMOBILETERMINALHOME"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamGetMobileTerminalHome)"/>

          <event value="716"
            symbol="NAM_PUTMOBILETERMINALFORSID"
            level="win:Informational"
            keywords="Nam"
            template="OneBoolOnOff"
            message="$(string.Publisher.NamPutMobileTerminalForSid)"/>

          <event value="717"
            symbol="NAM_GETMOBILETERMINALFORSID"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamGetMobileTerminalForSid)"/>

          <event value="718"
            symbol="NAM_PUTMOBILETERMINALFORNID"
            level="win:Informational"
            keywords="Nam"
            template="OneBoolOnOff"
            message="$(string.Publisher.NamPutMobileTerminalForNid)"/>

          <event value="719"
            symbol="NAM_GETMOBILETERMINALFORNID"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamGetMobileTerminalForNid)"/>

          <event value="720"
            symbol="NAM_PUTSIDNIDPAIRSCOUNT"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamPutSidNidPairsCount)"/>

          <event value="721"
            symbol="NAM_GETSIDNIDPAIRSCOUNT"
            level="win:Informational"
            keywords="Nam"
            template="OneHexInt"
            message="$(string.Publisher.NamGetSidNidPairsCount)"/>

          <event value="722"
            symbol="NAM_SIDNIDPAIR"
            level="win:Informational"
            keywords="Nam"
            template="TwoHexInts"
            message="$(string.Publisher.NamSidNidPair)"/>

          <!-- EFS (750) -->
          <event value="750"
            symbol="EFS_PUTITEMFILEFROMPATH"
            level="win:Informational"
            keywords="Efs"
            template="TwoStrings"
            message="$(string.Publisher.EfsPutItemFileFromPath)"/>

          <event value="751"
            symbol="EFS_PUTITEMFILE"
            level="win:Informational"
            keywords="Efs"
            template="TwoStrings"
            message="$(string.Publisher.EfsPutItemFile)"/>

          <event value="752"
            symbol="EFS_GETITEMFILETOPATH"
            level="win:Informational"
            keywords="Efs"
            template="TwoStrings"
            message="$(string.Publisher.EfsGetItemFileToPath)"/>

          <event value="753"
            symbol="EFS_GETITEMFILE"
            level="win:Informational"
            keywords="Efs"
            template="TwoStrings"
            message="$(string.Publisher.EfsGetItemFile)"/>

          <event value="754"
            symbol="EFS_PUTDATAFILE"
            level="win:Informational"
            keywords="Efs"
            template="TwoStrings"
            message="$(string.Publisher.EfsPutDataFile)"/>

          <event value="755"
            symbol="EFS_WRITEDATAFILE"
            level="win:Informational"
            keywords="Efs"
            template="OneHexTwoStrings"
            message="$(string.Publisher.EfsWriteDataFile)"/>

          <event value="756"
            symbol="EFS_READDATAFILE"
            level="win:Informational"
            keywords="Efs"
            template="OneHexTwoStrings"
            message="$(string.Publisher.EfsReadDataFile)"/>

          <event value="757"
            symbol="EFS_GETDATAFILE"
            level="win:Informational"
            keywords="Efs"
            template="TwoStrings"
            message="$(string.Publisher.EfsGetDataFile)"/>

          <event value="758"
            symbol="EFS_GETFILESIZE"
            level="win:Informational"
            keywords="Efs"
            template="HexIntAndString"
            message="$(string.Publisher.EfsGetFileSize)"/>

          <event value="759"
            symbol="EFS_DELETEFILE"
            level="win:Informational"
            keywords="Efs"
            template="OneString"
            message="$(string.Publisher.EfsDeleteFile)"/>

          <event value="760"
            symbol="EFS_DELETEDIRECTORY"
            level="win:Informational"
            keywords="Efs"
            template="OneString"
            message="$(string.Publisher.EfsDeleteDirectory)"/>

          <event value="761"
            symbol="EFS_MAKEDIRECTORY"
            level="win:Informational"
            keywords="Efs"
            template="OneString"
            message="$(string.Publisher.EfsMakeDirectory)"/>

          <event value="762"
            symbol="EFS_DELETESUBTREE"
            level="win:Informational"
            keywords="Efs"
            template="OneString"
            message="$(string.Publisher.EfsDeleteSubtree)"/>

          <event value="763"
            symbol="EFS_GETCONTENTS"
            level="win:Informational"
            keywords="Efs"
            template="OneString"
            message="$(string.Publisher.EfsGetContents)"/>

          <event value="764"
            symbol="EFS_DIRENTRY"
            level="win:Informational"
            keywords="Efs"
            template="DirectoryEntry"
            message="$(string.Publisher.EfsDirectoryEntry)"/>

          <!-- Prl (800) -->
          <event value="800"
            symbol="PRL_WRITE"
            level="win:Informational"
            keywords="Prl"
            template="OneHexInt"
            message="$(string.Publisher.PrlWrite)"/>

          <event value="801"
            symbol="PRL_READ"
            level="win:Informational"
            keywords="Prl"
            template="OneHexInt"
            message="$(string.Publisher.PrlRead)"/>

          <!-- NV (850) -->
          <event value="850"
            symbol="NV_WRITE"
            level="win:Informational"
            keywords="Nv"
            template="HexIntAndString"
            message="$(string.Publisher.NvWrite)"/>

          <event value="851"
            symbol="NV_READ"
            level="win:Informational"
            keywords="Nv"
            template="HexIntAndString"
            message="$(string.Publisher.NvRead)"/>

          <!-- Nai (900) -->
          <event value="900"
            symbol="NAI_GETACTIVENAI"
            level="win:Informational"
            keywords="Nai"
            template="OneString"
            message="$(string.Publisher.NaiGetActiveNai)"/>
          
          <!-- Performance marker events -->
          <event value="1002"
            symbol="PERF_STARTSERVICE_BEGIN"
            task="StartService"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          
          <event value="1003"
            symbol="PERF_STARTSERVICE_END"
            task="StartService"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1004"
            symbol="PERF_STOPSERVICE_BEGIN"
            task="StopService"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1005"
            symbol="PERF_STOPSERVICE_END"
            task="StopService"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1006"
            symbol="PERF_WRITEPRL_BEGIN"
            task="WritePrl"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1007"
            symbol="PERF_WRITEPRL_END"
            task="WritePrl"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1008"
            symbol="PERF_READPRL_BEGIN"
            task="ReadPrl"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1009"
            symbol="PERF_READPRL_END"
            task="ReadPrl"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1010"
            symbol="PERF_WRITENV_BEGIN"
            task="WriteNv"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1011"
            symbol="PERF_WRITENV_END"
            task="WriteNv"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1012"
            symbol="PERF_READNV_BEGIN"
            task="ReadNv"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1013"
            symbol="PERF_READNV_END"
            task="ReadNv"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1014"
            symbol="PERF_PUT_ITEMFILE_BEGIN"
            task="PutItemFile"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1015"
            symbol="PERF_PUT_ITEMFILE_END"
            task="PutItemFile"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1016"
            symbol="PERF_PUT_DATAFILE_BEGIN"
            task="PutDataFile"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1017"
            symbol="PERF_PUT_DATAFILE_END"
            task="PutDataFile"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1018"
            symbol="PERF_PUT_ITEMFILEPATH_BEGIN"
            task="PutItemFilePath"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1019"
            symbol="PERF_PUT_ITEMFILEPATH_END"
            task="PutItemFilePath"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

          <event value="1020"
            symbol="PERF_WRITE_DATAFILE_BEGIN"
            task="WriteDataFile"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1021"
            symbol="PERF_WRITE_DATAFILE_END"
            task="WriteDataFile"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1022"
            symbol="PERF_GET_ITEMFILE_BEGIN"
            task="GetItemFile"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1023"
            symbol="PERF_GET_ITEMFILE_END"
            task="GetItemFile"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1024"
            symbol="PERF_GET_ITEMFILEPATH_BEGIN"
            task="GetItemFilePath"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1025"
            symbol="PERF_GET_ITEMFILEPATH_END"
            task="GetItemFilePath"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1026"
            symbol="PERF_READ_DATAFILE_BEGIN"
            task="ReadDataFile"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1027"
            symbol="PERF_READ_DATAFILE_END"
            task="ReadDataFile"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1028"
            symbol="PERF_GET_DATAFILE_BEGIN"
            task="GetDataFile"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1029"
            symbol="PERF_GET_DATAFILE_END"
            task="GetDataFile"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1030"
            symbol="PERF_GET_FILESIZE_BEGIN"
            task="GetFileSize"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1031"
            symbol="PERF_GET_FILESIZE_END"
            task="GetFileSize"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1032"
            symbol="PERF_DELETE_FILE_BEGIN"
            task="DeleteFile"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1033"
            symbol="PERF_DELETE_FILE_END"
            task="DeleteFile"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1034"
            symbol="PERF_DELETE_DIR_BEGIN"
            task="DeleteDirectory"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1035"
            symbol="PERF_DELETE_DIR_END"
            task="DeleteFile"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1036"
            symbol="PERF_MAKE_DIR_BEGIN"
            task="MakeDirectory"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1037"
            symbol="PERF_MAKE_DIR_END"
            task="MakeDirectory"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1038"
            symbol="PERF_GET_CONTENTS_BEGIN"
            task="GetContents"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1039"
            symbol="PERF_GET_CONTENTS_END"
            task="GetContents"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1040"
            symbol="PERF_UNLOCK_SPC_BEGIN"
            task="UnlockSPC"
            opcode="win:Start"
            level="win:Verbose"
            keywords="Performance"/>
          <event value="1041"
            symbol="PERF_UNLOCK_SPC_END"
            task="UnlockSPC"
            opcode="win:Stop"
            level="win:Verbose"
            keywords="Performance"/>

        </events>
    </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Event.ErrorOriginateMessage"                            value="Error: %1 Location: %2 Line Number: %3"/>   
        <string id="Publisher.DllReason"                                    value="DllMain: %1"/>
        <string id="Publisher.ServiceStatus"                                value="NvManagerSVC: UpdateServiceStatus: %1"/>
        
        <string id="Publisher.SetModemFeature"                              value="ModemToggle::SetFeatureState: %1 to %2"/>
        <string id="Publisher.GetModemFeature"                              value="ModemToggle::GetFeatureState: %1 is %2"/>
        <string id="Publisher.SetModemBand"                                 value="ModemToggle::SetBandState: %1 to %2"/>
        <string id="Publisher.GetModemBand"                                 value="ModemToggle::GetBandState: %1 is %2"/>

        <string id="Publisher.SetRadioTimer"                                value="RadioTimer::Set: %1 to %2"/>
        <string id="Publisher.GetRadioTimer"                                value="RadioTimer::Get: %1 is %2"/>

        <string id="Publisher.MobileIpInitialize"                           value="MobileIpProfile::Initialize: we're using profile %1"/>
        <string id="Publisher.MobileIpPutIpAddress"                         value="MobileIpProfile::put_MobileIpAddress: Mobile IP address to set is %1"/>
        <string id="Publisher.MobileIpGetIpAddress"                         value="MobileIpProfile::get_MobileIpAddress: Mobile Ip address is %1"/>
        <string id="Publisher.MobileIpPutNai"                               value="MobileIpProfile::put_NAI: NAI to set is %1"/>
        <string id="Publisher.MobileIpGetNai"                               value="MobileIpProfile::get_NAI: NAI is %1"/>
        <string id="Publisher.MobileIpPutTetheredNai"                       value="MobileIpProfile::put_TetheredNAI: Tethered NAI to set is %1"/>
        <string id="Publisher.MobileIpGetTetheredNai"                       value="MobileIpProfile::get_TetheredNAI: Tethered NAI is %1"/>
        <string id="Publisher.MobileIpPutSharedSecret"                      value="MobileIpProfile::put_SharedSecret: HA password: %1, AAA password: %2"/>
        <string id="Publisher.MobileIpPutPrimaryHAIpAddress"                value="MobileIpProfile::put_PrimaryHAIpAddress: Primary HA IP address to set is %1"/>
        <string id="Publisher.MobileIpGetPrimaryHAIpAddress"                value="MobileIpProfile::get_PrimaryHAIpAddress: Primary HA IP address is %1"/>
        <string id="Publisher.MobileIpPutSecondaryHAIpAddress"              value="MobileIpProfile::put_SecondaryHAIpAddress: Secondary HA IP address to set is %1"/>
        <string id="Publisher.MobileIpGetSecondaryHAIpAddress"              value="MobileIpProfile::get_SecondaryHAIpAddress: Secondary HA IP address is %1"/>
        <string id="Publisher.MobileIpPutReverseTunneling"                  value="MobileIpProfile::put_ReverseTunneling: Reverse Tunneling value to set is %1"/>
        <string id="Publisher.MobileIpGetReverseTunneling"                  value="MobileIpProfile::get_ReverseTunneling: Reverse Tunneling value is %1"/>
        <string id="Publisher.MobileIpPutSpiAAA"                            value="MobileIpProfile::put_SpiAAA: AAA SPI to set is %1"/>
        <string id="Publisher.MobileIpGetSpiAAA"                            value="MobileIpProfile::get_SpiAAA: AAA SPI is %1"/>
        <string id="Publisher.MobileIpPutSpiHA"                             value="MobileIpProfile::put_SpiHA: HA SPI to set is %1"/>
        <string id="Publisher.MobileIpGetSpiHA"                             value="MobileIpProfile::get_SpiHA: HA SPI is %1"/>

        <string id="Publisher.NamPutMobDirNum"                              value="Nam::put_MobDirNum: MDN to set is %1"/>
        <string id="Publisher.NamGetMobDirNum"                              value="Nam::get_MobDirNum: MDN is %1"/>
        <string id="Publisher.NamPutMsid"                                   value="Nam::put_Msid: MSID to set is %1"/>
        <string id="Publisher.NamGetMsid"                                   value="Nam::get_Msid: MSID is %1"/>
        <string id="Publisher.NamPutMcc"                                    value="Nam::put_Mcc: Encoded MCC to set is %1"/>
        <string id="Publisher.NamGetMcc"                                    value="Nam::get_Mcc: Encoded MCC is %1"/>
        <string id="Publisher.NamPutAccolc"                                 value="Nam::put_Accolc: AOC to set is %1"/>
        <string id="Publisher.NamGetAccolc"                                 value="Nam::get_Accolc: AOC is %1"/>
        <string id="Publisher.NamPutImsi_11_12"                             value="Nam::put_Imsi_11_12: Encoded IMSI 11-12 to set is %1"/>
        <string id="Publisher.NamGetImsi_11_12"                             value="Nam::get_Imsi_11_12: Encoded IMSI 11-12 is %1"/>
        <string id="Publisher.NamPutImsiS2"                                 value="Nam::put_ImsiS2: Encoded IMSI_M_S2 (MIN2) to set is %1"/>
        <string id="Publisher.NamGetImsiS2"                                 value="Nam::get_ImsiS2: Encoded IMSI_M_S2 (MIN2) is %1"/>
        <string id="Publisher.NamPutImsiS1"                                 value="Nam::put_ImsiS1: Encoded IMSI_M_S1 (MIN1) to set is %1"/>
        <string id="Publisher.NamGetImsiS1"                                 value="Nam::get_ImsiS1: Encoded IMSI_M_S1 (MIN1) is %1"/>
        <string id="Publisher.NamPutMobileTerminalHome"                     value="Nam::put_MobileTerminalHome: setting mobile terminated registration for home SID to %1"/>
        <string id="Publisher.NamGetMobileTerminalHome"                     value="Nam::get_MobileTerminalHome: mobile terminated registration for home SID is %1"/>
        <string id="Publisher.NamPutMobileTerminalForSid"                   value="Nam::put_MobileTerminalForSid: setting mobile terminated registration for foreign SID to %1"/>
        <string id="Publisher.NamGetMobileTerminalForSid"                   value="Nam::get_MobileTerminalForSid: mobile terminated registration for foreign SID is %1"/>
        <string id="Publisher.NamPutMobileTerminalForNid"                   value="Nam::put_MobileTerminalForNid: setting mobile terminated registration for foreign NID to %1"/>
        <string id="Publisher.NamGetMobileTerminalForNid"                   value="Nam::get_MobileTerminalForNid: mobile terminated registration for foreign NID is %1"/>
        <string id="Publisher.NamPutSidNidPairsCount"                       value="Nam::put_SidNidPairs: SID/NID pair count is %1"/>
        <string id="Publisher.NamGetSidNidPairsCount"                       value="Nam::get_SidNidPairs: SID/NID pair count is %1"/>
        <string id="Publisher.NamSidNidPair"                                value="SID/NID pair: SID=%1, NID=%2"/>

        <string id="Publisher.PrlWrite"                                     value="Prl::Write: size in bytes is %1"/>
        <string id="Publisher.PrlRead"                                      value="Nam::Ready: size in bytes is %1"/>

        <string id="Publisher.NvWrite"                                      value="Nv::Write: item: %1, data: %2"/>
        <string id="Publisher.NvRead"                                       value="Nv::Ready: item: %1, data: %2"/>

        <string id="Publisher.EfsPutItemFileFromPath"                       value="Efs::PutItemFileFromPath: putting item-file from %1 to %2"/>
        <string id="Publisher.EfsPutItemFile"                               value="Efs::PutItemFile: writing %1 it item-file %2"/>
        <string id="Publisher.EfsGetItemFileToPath"                         value="Efs::GetItemFileToPath: getting item-file %1 to %2"/>
        <string id="Publisher.EfsGetItemFile"                               value="Efs::GetItemFile: content of %1 is %2"/>
        <string id="Publisher.EfsPutDataFile"                               value="Efs::PutDataFile: putting data-file from %1 to %2"/>
        <string id="Publisher.EfsWriteDataFile"                             value="Efs::WriteDataFile: writing %1 at offset %2 to %3"/>
        <string id="Publisher.EfsGetDataFile"                               value="Efs::GetDataFile: getting data-file %1 to %2"/>
        <string id="Publisher.EfsReadDataFile"                              value="Efs::ReadDataFile: read %1 at offset %2 in %3"/>
        <string id="Publisher.EfsGetFileSize"                               value="Efs::GetFileSize: file size is %1 for %2"/>
        <string id="Publisher.EfsDeleteFile"                                value="Efs::DeleteFile: deleting %1"/>
        <string id="Publisher.EfsDeleteDirectory"                           value="Efs::DeleteDirectory: deleting directory %1"/>
        <string id="Publisher.EfsMakeDirectory"                             value="Efs::MakeDirectory: creating directory %1"/>
        <string id="Publisher.EfsDeleteSubtree"                             value="Efs::DeleteSubtree: deleting subtree %1"/>
        <string id="Publisher.EfsGetContents"                               value="Efs::GetContents: getting contents for directory %1"/>
        <string id="Publisher.EfsDirectoryEntry"                            value="%1: size: %2 name: %3"/>

        <string id="Publisher.NaiGetActiveNai"                              value="Nai::get_ActiveNai: active NAI is %1"/>

          <!-- the enum strings don't need localization, but ETW gives us no choice but to put them in the string table. -->
        <string id="Enums.MODEM_FEATURE_UNKNOWN"                            value="MODEM_FEATURE_UNKNOWN"/>
        <string id="Enums.MODEM_FEATURE_EHRPD"                              value="MODEM_FEATURE_EHRPD"/>
        <string id="Enums.MODEM_FEATURE_1XADVANCED"                         value="MODEM_FEATURE_1XADVANCED"/>
        <string id="Enums.MODEM_FEATURE_SO68"                               value="MODEM_FEATURE_SO68"/>
        <string id="Enums.MODEM_FEATURE_SO73_COP0"                          value="MODEM_FEATURE_SO73_COP0"/>
        <string id="Enums.MODEM_FEATURE_SO73_COP1TO7"                       value="MODEM_FEATURE_SO73_COP1TO7"/>

        <string id="Enums.DIRECTORY_ENTRY_TYPE_FILE"                        value="File"/>
        <string id="Enums.DIRECTORY_ENTRY_TYPE_DIRECTORY"                   value="Directory"/>
        <string id="Enums.DIRECTORY_ENTRY_TYPE_SYMLINK"                     value="Shortcut"/>

        <string id="Enums.MODEM_BAND_UNKNOWN"                               value="MODEM_BAND_UNKNOWN"/>
        <string id="Enums.MODEM_BAND_BC10"                                  value="MODEM_BAND_BC10"/>
        <string id="Enums.MODEM_BAND_BC14"                                  value="MODEM_BAND_BC14"/>
        <string id="Enums.MODEM_BAND_BC25"                                  value="MODEM_BAND_BC25"/>
        <string id="Enums.MODEM_BAND_BC26"                                  value="MODEM_BAND_BC26"/>
        <string id="Enums.MODEM_BAND_BC41"                                  value="MODEM_BAND_BC41"/>

        <string id="Enums.SERVICE_STOPPED"                                  value="SERVICE_STOPPED"/>
        <string id="Enums.SERVICE_START_PENDING"                            value="SERVICE_START_PENDING"/>
        <string id="Enums.SERVICE_STOP_PENDING"                             value="SERVICE_STOP_PENDING"/>
        <string id="Enums.SERVICE_RUNNING"                                  value="SERVICE_RUNNING"/>
        <string id="Enums.SERVICE_CONTINUE_PENDING"                         value="SERVICE_CONTINUE_PENDING"/>
        <string id="Enums.SERVICE_PAUSE_PENDING"                            value="SERVICE_PAUSE_PENDING"/>
        <string id="Enums.SERVICE_PAUSED"                                   value="SERVICE_PAUSED"/>
        
        <string id="Enums.DLL_PROCESS_DETACH"                               value="DLL_PROCESS_DETACH"/>
        <string id="Enums.DLL_PROCESS_ATTACH"                               value="DLL_PROCESS_ATTACH"/>
        <string id="Enums.DLL_THREAD_ATTACH"                                value="DLL_THREAD_ATTACH"/>
        <string id="Enums.DLL_THREAD_DETACH"                                value="DLL_THREAD_DETACH"/>

        <string id="Enums.RADIO_TIMER_UNKNOWN"                              value="RADIO_TIMER_UNKNOWN"/>
        <string id="Enums.RADIO_LTE_NEXT_SCAN"                              value="RADIO_LTE_NEXT_SCAN"/>
        <string id="Enums.RADIO_LTE_BSR_TIMER"                              value="RADIO_LTE_BSR_TIMER"/>
        <string id="Enums.RADIO_BSR_MAX_TIME"                               value="RADIO_BSR_MAX_TIME"/>

        <string id="Enums.FALSE"                                            value="FALSE"/>
        <string id="Enums.TRUE"                                             value="TRUE"/>
        <string id="Enums.ON"                                               value="ON"/>
        <string id="Enums.OFF"                                              value="OFF"/>
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
