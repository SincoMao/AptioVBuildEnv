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

      <provider name="Microsoft-WindowsPhone-Net-CellCore-MSRil"
          guid="{39e95ad8-e195-4890-b512-6dede1e2c9f1}"
          symbol="MICROSOFT_WINDOWSPHONE_NET_CELLCORE_MSRIL"
          messageFileName="NetCellcoreMSRilProviderResources.dll"
          resourceFileName="NetCellcoreMSRilProviderResources.dll">

        <channels />

        <maps>
            <valueMap name="RilCommandID">
                <map value="0x00000001" message="$(string.RilCommandID.RIL_COMMAND_INITNOTIFICATIONS)" />
                <map value="0x00000002" message="$(string.RilCommandID.RIL_COMMAND_GETNEXTNOTIFICATION)" />
                <map value="0x00000003" message="$(string.RilCommandID.RIL_COMMAND_ENABLENOTIFICATIONS)" />
                <map value="0x00000004" message="$(string.RilCommandID.RIL_COMMAND_DISABLENOTIFICATIONS)" />
                <map value="0x00000005" message="$(string.RilCommandID.RIL_COMMAND_GETDRIVERVERSION)" />
                <map value="0x00000006" message="$(string.RilCommandID.RIL_COMMAND_GETDEVCAPS)" />
                <map value="0x00000007" message="$(string.RilCommandID.RIL_COMMAND_GETDEVICEINFO)" />
                <map value="0x00000008" message="$(string.RilCommandID.RIL_COMMAND_GETEQUIPMENTSTATE)" />
                <map value="0x00000009" message="$(string.RilCommandID.RIL_COMMAND_SETEQUIPMENTSTATE)" />
                <map value="0x0000000A" message="$(string.RilCommandID.RIL_COMMAND_SETNOTIFICATIONFILTERSTATE)" />
                <map value="0x0000000B" message="$(string.RilCommandID.RIL_COMMAND_GETNOTIFICATIONFILTERSTATE)" />
                <map value="0x0000000C" message="$(string.RilCommandID.RIL_COMMAND_ENUMERATESLOTS)" />
                <map value="0x0000000D" message="$(string.RilCommandID.RIL_COMMAND_GETCARDINFO)" />
                <map value="0x0000000E" message="$(string.RilCommandID.RIL_COMMAND_SETSLOTPOWER)" />
                <map value="0x0000000F" message="$(string.RilCommandID.RIL_COMMAND_GETUICCRECORDSTATUS)" />
                <map value="0x00000010" message="$(string.RilCommandID.RIL_COMMAND_SENDRESTRICTEDUICCCMD)" />
                <map value="0x00000011" message="$(string.RilCommandID.RIL_COMMAND_WATCHUICCFILECHANGE)" />
                <map value="0x00000012" message="$(string.RilCommandID.RIL_COMMAND_GETUICCPRLID)" />
                <map value="0x00000013" message="$(string.RilCommandID.RIL_COMMAND_GETIMSI)" />
                <map value="0x00000014" message="$(string.RilCommandID.RIL_COMMAND_GETSUBSCRIBERNUMBERS)" />
                <map value="0x00000015" message="$(string.RilCommandID.RIL_COMMAND_GETUICCLOCKSTATE)" />
                <map value="0x00000016" message="$(string.RilCommandID.RIL_COMMAND_GETUICCSERVICELOCK)" />
                <map value="0x00000017" message="$(string.RilCommandID.RIL_COMMAND_VERIFYUICCLOCK)" />
                <map value="0x00000018" message="$(string.RilCommandID.RIL_COMMAND_SETUICCLOCKENABLED)" />
                <map value="0x00000019" message="$(string.RilCommandID.RIL_COMMAND_UNBLOCKUICCLOCK)" />
                <map value="0x0000001A" message="$(string.RilCommandID.RIL_COMMAND_CHANGEUICCLOCKPASSWORD)" />
                <map value="0x0000001B" message="$(string.RilCommandID.RIL_COMMAND_GETUICCAPPPERSOCHECKSTATE)" />
                <map value="0x0000001C" message="$(string.RilCommandID.RIL_COMMAND_GETPERSODEACTIVATIONSTATE)" />
                <map value="0x0000001D" message="$(string.RilCommandID.RIL_COMMAND_DEACTIVATEPERSO)" />
                <map value="0x0000001E" message="$(string.RilCommandID.RIL_COMMAND_READPHONEBOOKENTRIES)" />
                <map value="0x0000001F" message="$(string.RilCommandID.RIL_COMMAND_WRITEPHONEBOOKENTRY)" />
                <map value="0x00000020" message="$(string.RilCommandID.RIL_COMMAND_DELETEPHONEBOOKENTRY)" />
                <map value="0x00000021" message="$(string.RilCommandID.RIL_COMMAND_GETPHONEBOOKOPTIONS)" />
                <map value="0x00000022" message="$(string.RilCommandID.RIL_COMMAND_GETALLADDITIONALNUMBERSTRINGS)" />
                <map value="0x00000023" message="$(string.RilCommandID.RIL_COMMAND_GETALLEMERGENCYNUMBERS)" />
                <map value="0x00000024" message="$(string.RilCommandID.RIL_COMMAND_SETRADIOCONFIGURATION)" />
                <map value="0x00000025" message="$(string.RilCommandID.RIL_COMMAND_GETRADIOCONFIGURATION)" />
                <map value="0x00000026" message="$(string.RilCommandID.RIL_COMMAND_SETEXECUTORCONFIG)" />
                <map value="0x00000027" message="$(string.RilCommandID.RIL_COMMAND_GETEXECUTORCONFIG)" />
                <map value="0x00000028" message="$(string.RilCommandID.RIL_COMMAND_SETSYSTEMSELECTIONPREFS)" />
                <map value="0x00000029" message="$(string.RilCommandID.RIL_COMMAND_GETSYSTEMSELECTIONPREFS)" />
                <map value="0x0000002A" message="$(string.RilCommandID.RIL_COMMAND_GETOPERATORLIST)" />
                <map value="0x0000002B" message="$(string.RilCommandID.RIL_COMMAND_GETPREFERREDOPERATORLIST)" />
                <map value="0x0000002C" message="$(string.RilCommandID.RIL_COMMAND_GETCURRENTREGSTATUS)" />
                <map value="0x0000002D" message="$(string.RilCommandID.RIL_COMMAND_GETSIGNALQUALITY)" />
                <map value="0x0000002E" message="$(string.RilCommandID.RIL_COMMAND_SENDAKEY)" />
                <map value="0x0000002F" message="$(string.RilCommandID.RIL_COMMAND_SENDUICCTOOLKITCMDRESPONSE)" />
                <map value="0x00000030" message="$(string.RilCommandID.RIL_COMMAND_SENDUICCTOOLKITENVELOPE)" />
                <map value="0x00000031" message="$(string.RilCommandID.RIL_COMMAND_DIAL)" />
                <map value="0x00000032" message="$(string.RilCommandID.RIL_COMMAND_MANAGECALLS)" />
                <map value="0x00000033" message="$(string.RilCommandID.RIL_COMMAND_EMERGENCYMODECONTROL)" />
                <map value="0x00000034" message="$(string.RilCommandID.RIL_COMMAND_GETCALLFORWARDINGSETTINGS)" />
                <map value="0x00000035" message="$(string.RilCommandID.RIL_COMMAND_SETCALLFORWARDINGSTATUS)" />
                <map value="0x00000036" message="$(string.RilCommandID.RIL_COMMAND_ADDCALLFORWARDING)" />
                <map value="0x00000037" message="$(string.RilCommandID.RIL_COMMAND_REMOVECALLFORWARDING)" />
                <map value="0x00000038" message="$(string.RilCommandID.RIL_COMMAND_GETCALLBARRINGSTATUS)" />
                <map value="0x00000039" message="$(string.RilCommandID.RIL_COMMAND_SETCALLBARRINGSTATUS)" />
                <map value="0x0000003A" message="$(string.RilCommandID.RIL_COMMAND_CHANGECALLBARRINGPASSWORD)" />
                <map value="0x0000003B" message="$(string.RilCommandID.RIL_COMMAND_GETCALLWAITINGSETTINGS)" />
                <map value="0x0000003C" message="$(string.RilCommandID.RIL_COMMAND_SETCALLWAITINGSTATUS)" />
                <map value="0x0000003D" message="$(string.RilCommandID.RIL_COMMAND_GETCALLERIDSETTINGS)" />
                <map value="0x0000003E" message="$(string.RilCommandID.RIL_COMMAND_GETDIALEDIDSETTINGS)" />
                <map value="0x0000003F" message="$(string.RilCommandID.RIL_COMMAND_GETHIDECONNECTEDIDSETTINGS)" />
                <map value="0x00000040" message="$(string.RilCommandID.RIL_COMMAND_GETHIDEIDSETTINGS)" />
                <map value="0x00000041" message="$(string.RilCommandID.RIL_COMMAND_SENDFLASH)" />
                <map value="0x00000042" message="$(string.RilCommandID.RIL_COMMAND_SENDSUPSERVICEDATA)" />
                <map value="0x00000043" message="$(string.RilCommandID.RIL_COMMAND_SENDDTMF)" />
                <map value="0x00000044" message="$(string.RilCommandID.RIL_COMMAND_STARTDTMF)" />
                <map value="0x00000045" message="$(string.RilCommandID.RIL_COMMAND_STOPDTMF)" />
                <map value="0x00000046" message="$(string.RilCommandID.RIL_COMMAND_GETMSGSERVICEOPTIONS)" />
                <map value="0x00000047" message="$(string.RilCommandID.RIL_COMMAND_READMSG)" />
                <map value="0x00000048" message="$(string.RilCommandID.RIL_COMMAND_WRITEMSG)" />
                <map value="0x00000049" message="$(string.RilCommandID.RIL_COMMAND_DELETEMSG)" />
                <map value="0x0000004A" message="$(string.RilCommandID.RIL_COMMAND_GETCELLBROADCASTMSGCONFIG)" />
                <map value="0x0000004B" message="$(string.RilCommandID.RIL_COMMAND_SETCELLBROADCASTMSGCONFIG)" />
                <map value="0x0000004C" message="$(string.RilCommandID.RIL_COMMAND_GETMSGINUICCSTATUS)" />
                <map value="0x0000004D" message="$(string.RilCommandID.RIL_COMMAND_SETMSGINUICCSTATUS)" />
                <map value="0x0000004E" message="$(string.RilCommandID.RIL_COMMAND_SETMSGMEMORYSTATUS)" />
                <map value="0x0000004F" message="$(string.RilCommandID.RIL_COMMAND_SENDMSG)" />
                <map value="0x00000050" message="$(string.RilCommandID.RIL_COMMAND_GETSMSC)" />
                <map value="0x00000051" message="$(string.RilCommandID.RIL_COMMAND_SETSMSC)" />
                <map value="0x00000052" message="$(string.RilCommandID.RIL_COMMAND_GETIMSSTATUS)" />
                <map value="0x00000053" message="$(string.RilCommandID.RIL_COMMAND_GETPOSITIONINFO)" />
                <map value="0x00000054" message="$(string.RilCommandID.RIL_COMMAND_GETRADIOSTATEGROUPS)" />
                <map value="0x00000055" message="$(string.RilCommandID.RIL_COMMAND_GETRADIOSTATEDETAILS)" />
                <map value="0x00000056" message="$(string.RilCommandID.RIL_COMMAND_SETRADIOSTATEDETAILS)" />
                <map value="0x00000057" message="$(string.RilCommandID.RIL_COMMAND_RADIOSTATEPASSWORDCOMPARE)" />
                <map value="0x00000058" message="$(string.RilCommandID.RIL_COMMAND_RADIOSTATEGETPASSWORDRETRYCOUNT)" />
                <map value="0x00000059" message="$(string.RilCommandID.RIL_COMMAND_DEVSPECIFIC)" />
                <map value="0x0000005A" message="$(string.RilCommandID.RIL_COMMAND_SETRFSTATE)" />
                <map value="0x0000005B" message="$(string.RilCommandID.RIL_COMMAND_GETRFSTATE)" />
                <map value="0x0000005C" message="$(string.RilCommandID.RIL_COMMAND_GETDMPROFILECONFIGINFO)" />
                <map value="0x0000005D" message="$(string.RilCommandID.RIL_COMMAND_SETDMPROFILECONFIGINFO)" />
                <map value="0x0000005E" message="$(string.RilCommandID.RIL_COMMAND_WRITEADDITIONALNUMBERSTRING)" />
                <map value="0x0000005F" message="$(string.RilCommandID.RIL_COMMAND_DELETEADDITIONALNUMBERSTRING)" />
                <map value="0x00000060" message="$(string.RilCommandID.RIL_COMMAND_GETUICCATR)" />
                <map value="0x00000061" message="$(string.RilCommandID.RIL_COMMAND_OPENUICCLOGICALCHANNEL)" />
                <map value="0x00000062" message="$(string.RilCommandID.RIL_COMMAND_CLOSEUICCLOGICALCHANNEL)" />
                <map value="0x00000063" message="$(string.RilCommandID.RIL_COMMAND_EXCHANGEUICCAPDU)" />
                <map value="0x00000064" message="$(string.RilCommandID.RIL_COMMAND_SENDSUPSERVICEDATARESPONSE)" />
                <map value="0x00000065" message="$(string.RilCommandID.RIL_COMMAND_CANCELSUPSERVICEDATASESSION)" />
                <map value="0x00000066" message="$(string.RilCommandID.RIL_COMMAND_SETUICCTOOLKITPROFILE)" />
                <map value="0x00000067" message="$(string.RilCommandID.RIL_COMMAND_GETUICCTOOLKITPROFILE)" />
                <map value="0x00000068" message="$(string.RilCommandID.RIL_COMMAND_REGISTERUICCTOOLKITSERVICE)" />                
                <map value="0x00000069" message="$(string.RilCommandID.RIL_COMMAND_SENDMSGACK)" />
                <map value="0x0000006A" message="$(string.RilCommandID.RIL_COMMAND_CLOSEUICCLOGICALCHANNELGROUP)" />
                <map value="0x0000006B" message="$(string.RilCommandID.RIL_COMMAND_SETPREFERREDOPERATORLIST)" />
                <map value="0x0000006C" message="$(string.RilCommandID.RIL_COMMAND_GETUICCSERVICESTATE)" />
                <map value="0x0000006D" message="$(string.RilCommandID.RIL_COMMAND_SETUICCSERVICESTATE)" />
                <map value="0x0000006E" message="$(string.RilCommandID.RIL_COMMAND_GETCALLLIST)" />
                <map value="0x0000006F" message="$(string.RilCommandID.RIL_COMMAND_GETEXECUTORFOCUS)" />
                <map value="0x00000070" message="$(string.RilCommandID.RIL_COMMAND_SETEXECUTORFOCUS)" />
                <map value="0x00000071" message="$(string.RilCommandID.RIL_COMMAND_GETEMERGENCYMODE)" />
                <map value="0x00000072" message="$(string.RilCommandID.RIL_COMMAND_GETEXECUTORRFSTATE)" />
                <map value="0x00000073" message="$(string.RilCommandID.RIL_COMMAND_SETEXECUTORRFSTATE)" />
                <map value="0x00000074" message="$(string.RilCommandID.RIL_COMMAND_RESETMODEM)" />
                <map value="0x00000075" message="$(string.RilCommandID.RIL_COMMAND_CANCELGETOPERATORLIST)" />
                <map value="0x00000076" message="$(string.RilCommandID.RIL_COMMAND_AVOIDCDMASYSTEM)" />
                <map value="0x00000077" message="$(string.RilCommandID.RIL_COMMAND_SETPSMEDIACONFIGURATION)" />
                <map value="0x00000078" message="$(string.RilCommandID.RIL_COMMAND_GETPSMEDIACONFIGURATION)" />
                <map value="0x00000400" message="$(string.RilCommandID.RIL_COMMAND_ENABLEMODEMFILTERS)" />
                <map value="0x00000401" message="$(string.RilCommandID.RIL_COMMAND_DISABLEMODEMFILTERS)" />
                <map value="0x00000402" message="$(string.RilCommandID.RIL_COMMAND_STARTMODEMLOGS)" />
                <map value="0x00000403" message="$(string.RilCommandID.RIL_COMMAND_STOPMODEMLOGS)" />
                <map value="0x00000404" message="$(string.RilCommandID.RIL_COMMAND_DRAINMODEMLOGS)" />
            </valueMap>

            <valueMap name="RilNotificationID">
                <map value="0x100000FF" message="$(string.RilNotificationID.RIL_NOTIFY_OEM_MAX)" />
                <map value="0x10000100" message="$(string.RilNotificationID.RIL_NOTIFY_RADIOEQUIPMENTSTATECHANGED)" />
                <map value="0x10000101" message="$(string.RilNotificationID.RIL_NOTIFY_RADIOPRESENCECHANGED)" />
                <map value="0x10000102" message="$(string.RilNotificationID.RIL_NOTIFY_UICCFILE_DATACHANGE)" />
                <map value="0x10000103" message="$(string.RilNotificationID.RIL_NOTIFY_UICCAPP_DATACHANGE)" />
                <map value="0x10000104" message="$(string.RilNotificationID.RIL_NOTIFY_SLOTINFOCHANGED)" />
                <map value="0x10000105" message="$(string.RilNotificationID.RIL_NOTIFY_CARDAPPREMOVED)" />
                <map value="0x10000106" message="$(string.RilNotificationID.RIL_NOTIFY_CARDAPPADDED)" />
                <map value="0x10000107" message="$(string.RilNotificationID.RIL_NOTIFY_UICCLOCKSTATUS)" />
                <map value="0x10000108" message="$(string.RilNotificationID.RIL_NOTIFY_UICCAPPPERSOCHECKSTATUS)" />
                <map value="0x10000109" message="$(string.RilNotificationID.RIL_NOTIFY_PHONEBOOKENTRYDELETED)" />
                <map value="0x1000010A" message="$(string.RilNotificationID.RIL_NOTIFY_PHONEBOOKENTRYSTORED)" />
                <map value="0x1000010B" message="$(string.RilNotificationID.RIL_NOTIFY_PHONEBOOKREADYSTATE)" />
                <map value="0x1000010C" message="$(string.RilNotificationID.RIL_NOTIFY_EMERGENCYNUMBERLISTCHANGED)" />
                <map value="0x1000010D" message="$(string.RilNotificationID.RIL_NOTIFY_REGSTATUSCHANGED)" />
                <map value="0x1000010E" message="$(string.RilNotificationID.RIL_NOTIFY_LOCATIONUPDATE)" />
                <map value="0x1000010F" message="$(string.RilNotificationID.RIL_NOTIFY_NETWORKCODECHANGED)" />
                <map value="0x10000110" message="$(string.RilNotificationID.RIL_NOTIFY_PROVISION_STATUS)" />
                <map value="0x10000111" message="$(string.RilNotificationID.RIL_NOTIFY_SYSTEMPREFSCHANGED)" />
                <map value="0x10000112" message="$(string.RilNotificationID.RIL_NOTIFY_EXECUTORSTATE)" />
                <map value="0x10000113" message="$(string.RilNotificationID.RIL_NOTIFY_MANAGED_ROAMING)" />
                <map value="0x10000114" message="$(string.RilNotificationID.RIL_NOTIFY_SIGNALQUALITY)" />
                <map value="0x10000115" message="$(string.RilNotificationID.RIL_NOTIFY_NITZ)" />
                <map value="0x10000116" message="$(string.RilNotificationID.RIL_NOTIFY_UICCTOOLKITCMD)" />
                <map value="0x10000117" message="$(string.RilNotificationID.RIL_NOTIFY_CALLMODIFICATIONINFO)" />
                <map value="0x10000118" message="$(string.RilNotificationID.RIL_NOTIFY_CALLPROGRESSINFO)" />
                <map value="0x10000119" message="$(string.RilNotificationID.RIL_NOTIFY_EMERGENCYMODEENTERED)" />
                <map value="0x1000011A" message="$(string.RilNotificationID.RIL_NOTIFY_EMERGENCYMODEEXITED)" />
                <map value="0x1000011B" message="$(string.RilNotificationID.RIL_NOTIFY_CALLWAITING)" />
                <map value="0x1000011C" message="$(string.RilNotificationID.RIL_NOTIFY_DIALEDID)" />
                <map value="0x1000011D" message="$(string.RilNotificationID.RIL_NOTIFY_DISPLAY)" />
                <map value="0x1000011E" message="$(string.RilNotificationID.RIL_NOTIFY_SUPSVCINFO)" />
                <map value="0x1000011F" message="$(string.RilNotificationID.RIL_NOTIFY_SUPSERVICEDATA)" />
                <map value="0x10000120" message="$(string.RilNotificationID.RIL_NOTIFY_UNSOLICITEDSS)" />
                <map value="0x10000121" message="$(string.RilNotificationID.RIL_NOTIFY_LINECONTROL)" />
                <map value="0x10000122" message="$(string.RilNotificationID.RIL_NOTIFY_MESSAGE)" />
                <map value="0x10000123" message="$(string.RilNotificationID.RIL_NOTIFY_MESSAGE_IN_UICC)" />
                <map value="0x10000124" message="$(string.RilNotificationID.RIL_NOTIFY_IMSSTATUS)" />
                <map value="0x10000125" message="$(string.RilNotificationID.RIL_NOTIFY_ADDITIONALNUMBERSTRINGUPDATED)" />
                <map value="0x10000126" message="$(string.RilNotificationID.RIL_NOTIFY_SUPSERVICEDATATERMINATED)" />
                <map value="0x10000127" message="$(string.RilNotificationID.RIL_NOTIFY_CLEARIDLEMODETEXT)" />
                <map value="0x10000128" message="$(string.RilNotificationID.RIL_NOTIFY_MESSAGE_STORAGE_FULL)" />
                <map value="0x10000129" message="$(string.RilNotificationID.RIL_NOTIFY_TONESIGNAL)" />
                <map value="0x1000012A" message="$(string.RilNotificationID.RIL_NOTIFY_FORWARDSTARTDTMF)" />
                <map value="0x1000012B" message="$(string.RilNotificationID.RIL_NOTIFY_FORWARDSTOPDTMF)" />
                <map value="0x1000012C" message="$(string.RilNotificationID.RIL_NOTIFY_FORWARDBURSTDTMF)" />
                <map value="0x1000012D" message="$(string.RilNotificationID.RIL_NOTIFY_EXECUTORFOCUSSTATECHANGED)" />
                <map value="0x1000012E" message="$(string.RilNotificationID.RIL_NOTIFY_EXECUTORRFSTATE)" />
                <map value="0x1000012F" message="$(string.RilNotificationID.RIL_NOTIFY_MODEMRESET)" />
                <map value="0x10000130" message="$(string.RilNotificationID.RIL_NOTIFY_RADIOCONFIGURATION)" />
                <map value="0x10000131" message="$(string.RilNotificationID.RIL_NOTIFY_IMSHANDOVERATTEMPT)" />
                <map value="0x10000132" message="$(string.RilNotificationID.RIL_NOTIFY_ADDITIONALCALLERINFO)" />
                <map value="0x10000133" message="$(string.RilNotificationID.RIL_NOTIFY_MWISUMMARY)" />
                <map value="0x10000134" message="$(string.RilNotificationID.RIL_NOTIFY_MWIDETAILS)" />
                <map value="0x10000135" message="$(string.RilNotificationID.RIL_NOTIFY_IMSFAILURE)" />
            </valueMap>
        </maps>
        
        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Trace" message="$(string.Keyword.Trace)" />
        </keywords>

        <tasks>
          <task value="1" name="DriverMain" />
          <task value="2" name="MSRil" />
          <task value="3" name="Client" />
          <task value="4" name="Service" />
          <task value="5" name="ACL" />
        </tasks>

        <templates>
          <template tid="tDword">
            <data name="dwValue" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tCommandIdAndCapability">
            <data name="dwCmdIDString" inType="win:UInt32" map="RilCommandID" />
            <data name="dwCmdIDValue" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwCapability" inType="win:UInt32" outType="win:HexInt32" />            
          </template>

          <template tid="tNotificationIdAndCapability">
            <data name="dwNotificationIDStrign" inType="win:UInt32" map="RilNotificationID" />
            <data name="dwNotificationIDValue" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwValue2" inType="win:UInt32" outType="win:HexInt32" />            
          </template>

          <template tid="tLineAndDataAndNotificationId">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />            
            <data name="pData" inType="win:Pointer" />
            <data name="dwNotificationIDStrign" inType="win:UInt32" map="RilNotificationID" />
            <data name="dwNotificationIDValue" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tLineAndDataAndNotificationIdAndMax">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />            
            <data name="pData" inType="win:Pointer" />
            <data name="dwNotificationIDStrign" inType="win:UInt32" map="RilNotificationID" />
            <data name="dwNotificationIDValue" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwNotificationMax" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tLineAndDataAndNotificationIdAndCount">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />            
            <data name="pData" inType="win:Pointer" />
            <data name="dwNotificationIDStrign" inType="win:UInt32" map="RilNotificationID" />
            <data name="dwNotificationIDValue" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwNotificationRefCount" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          
          <template tid="tLineAndString">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="pData" inType="win:AnsiString" />
          </template>
          
          <template tid="tLineAndData">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="pData" inType="win:Pointer" />
          </template>

          <template tid="tLineAndError">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="dwError" inType="win:UInt32" outType="win:NTSTATUS" />
          </template>

          <template tid="tLineAndDataAndError">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="pData" inType="win:Pointer" />
            <data name="dwError" inType="win:UInt32" outType="win:NTSTATUS" />            
          </template>

          <template tid="tLineAndDatatAndPointer">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />            
            <data name="pData" inType="win:Pointer" />
            <data name="pPointer" inType="win:Pointer" />
          </template>

          <template tid="tLineAndDatatAndDword">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />            
            <data name="pData" inType="win:Pointer" />
            <data name="dwValue" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tLineAndDatatAndHex">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />            
            <data name="pData" inType="win:Pointer" />
            <data name="dwValue" inType="win:UInt32" outType="xs:HexInt32" />
          </template>
          
          <template tid="tLineAndDatatAndUint64">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />            
            <data name="pData" inType="win:Pointer" />
            <data name="requestID" inType="win:UInt64" outType="xs:unsignedLong" />
          </template>

          <template tid="tLineAndDatatAndDwordAndDword">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />            
            <data name="pData" inType="win:Pointer" />
            <data name="dwValue" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="dwValu2e" inType="win:UInt32" outType="xs:unsignedInt" />            
          </template>

          <template tid="tSmallBuffer">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />                      
            <data name="pData" inType="win:Pointer" />
            <data name="pRequest" inType="win:Pointer" />
            <data name="dwBufferSize" inType="win:UInt64" outType="xs:unsignedLong" />
            <data name="dwPacketSize" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>          

          <template tid="tDataAndValue">
            <data name="pData" inType="win:Pointer" />
            <data name="dwValue" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>          
 
          <template tid="tRILResult">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />                      
            <data name="pData" inType="win:Pointer" />
            <data name="dwError" inType="win:UInt32" outType="win:HexInt32" />
            <data name="pClient" inType="win:Pointer" />
            <data name="pClientRequestID" inType="win:Pointer" />
            <data name="dwTransactionID" inType="win:UInt32" outType="xs:HexInt32" />            
          </template>

          <template tid="tNewMaxTime">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />                      
            <data name="pData" inType="win:Pointer" />
            <data name="qwTime" inType="win:UInt64" />
            <data name="pClient" inType="win:Pointer" />
            <data name="pClientRequestID" inType="win:Pointer" />
            <data name="dwTransactionID" inType="win:UInt32" outType="xs:HexInt32" />            
          </template>

          <template tid="tCommandPacket">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />                      
            <data name="pData" inType="win:Pointer" />
            <data name="pClient" inType="win:Pointer" />
            <data name="pClientRequestID" inType="win:Pointer" />
            <data name="dwTransactionID" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="dwCommand" inType="win:UInt32" outType="xs:HexInt32"/>            
          </template>

          <template tid="tClientCleanUp">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />                      
            <data name="pData" inType="win:Pointer" />
            <data name="pClient" inType="win:Pointer" />
            <data name="pClientRequestID" inType="win:Pointer" />
            <data name="dwTransactionID" inType="win:UInt32" outType="xs:HexInt32" />            
          </template>

          <template tid="tTypeMismatchPacket">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />                      
            <data name="pData" inType="win:Pointer" />
            <data name="pClient" inType="win:Pointer" />
            <data name="dwType" inType="win:UInt32" outType="xs:unsignedInt" />                        
          </template>

          <template tid="tInvalidLengthPacket">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />                      
            <data name="pData" inType="win:Pointer" />
            <data name="pClient" inType="win:Pointer" />
            <data name="dwWrittenSize" inType="win:UInt32" outType="xs:unsignedInt" />                        
          </template>

          <template tid="tUnresponsiveClient">
            <data name="dwLine" inType="win:UInt32" outType="xs:unsignedInt" />                      
            <data name="pClient" inType="win:Pointer" />
            <data name="dwPendingPacketCount" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="dwLastSuccessfulReadRequest" inType="win:UInt32" outType="xs:unsignedInt" />            
          </template>          
          
        </templates>

        <events>

          <!-- The start/stop share a "task" and have no data payload. -->
          <!-- Note: opcode win:Info can also be associated with a task.
               Task-based events can also use templates. -->
               
          <!-- DriverMain -->
          <event value="1"
              symbol="DriverMain_Error"
              task="DriverMain"
              keywords="Error Trace"
              level="win:Critical"
              opcode="win:Info"
              template="tLineAndError"
              message="$(string.Event.DriverMain_Error)" />

          <event value="80"
              symbol="DriverMain_DriverEntry_Begin"
              task="DriverMain"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              message="$(string.Event.DriverMain_DriverEntry_Begin)" />

          <event value="81"
              symbol="DriverMain_DriverEntry_End"
              task="DriverMain"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Stop"
              message="$(string.Event.DriverMain_DriverEntry_End)" />

          <event value="82"
              symbol="DriverMain_DeviceAdd_Begin"
              task="DriverMain"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              message="$(string.Event.DriverMain_DeviceAdd_Begin)" />

          <event value="83"
              symbol="DriverMain_DeviceAdd_End"
              task="DriverMain"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Stop"
              message="$(string.Event.DriverMain_DeviceAdd_End)" />

          <event value="84"
              symbol="DriverMain_DeviceClean_Begin"
              task="DriverMain"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              message="$(string.Event.DriverMain_DeviceClean_Begin)" />

          <event value="85"
              symbol="DriverMain_DeviceClean_End"
              task="DriverMain"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Stop"
              message="$(string.Event.DriverMain_DeviceClean_End)" />
               
          <!-- MSRIL -->     
          <event value="100"
              symbol="MSRil_Error"
              task="MSRil"
              keywords="Error Trace"
              level="win:Critical"
              opcode="win:Info"
              template="tLineAndDataAndError"
              message="$(string.Event.MSRil_Error)" />

          <event value="101"
              symbol="MSRil_TypeMismatchedPacket_Error"
              task="MSRil"
              keywords="Error Trace"
              level="win:Error"
              opcode="win:Info"
              template="tTypeMismatchPacket"
              message="$(string.Event.MSRil_TypeMismatchedPacket_Error)" />

          <event value="104"
              symbol="MSRil_InvalidLengthPacket_Error"
              task="MSRil"
              keywords="Error Trace"
              level="win:Error"
              opcode="win:Info"
              template="tInvalidLengthPacket"
              message="$(string.Event.MSRil_InvalidLengthPacket_Error)" />
              

          <event value="160"
              symbol="MSRil_DataOnly_Verbose"
              task="MSRil"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tLineAndData"
              message="$(string.Event.MSRil_DataOnly_Verbose)" />

          <event value="161"
              symbol="MSRil_FileObject_Verbose"
              task="MSRil"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tLineAndDatatAndPointer"
              message="$(string.Event.MSRil_FileObject_Verbose)" />

          <event value="162"
              symbol="MSRil_Client_Verbose"
              task="MSRil"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tLineAndDatatAndPointer"
              message="$(string.Event.MSRil_Client_Verbose)" />

          <event value="180"
              symbol="MSRil_Start"
              task="MSRil"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Start"
              message="$(string.Event.MSRilStart)" />

          <event value="181"
              symbol="MSRil_Stop"
              task="MSRil"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Stop"
              message="$(string.Event.MSRilStop)" />

          <event value="182"
              symbol="MSRil_FileCleanup_Begin"
              task="DriverMain"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              template="tLineAndData"              
              message="$(string.Event.MSRil_FileCleanup_Begin)" />

          <event value="183"
              symbol="MSRil_FileCleanup_End"
              task="DriverMain"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Stop"
              template="tLineAndData"              
              message="$(string.Event.MSRil_FileCleanup_End)" />              

          <!-- CLIENT -->
          <event value="200"
              symbol="Client_Error"
              task="Client"
              keywords="Error Trace"
              level="win:Critical"
              opcode="win:Info"
              template="tLineAndDataAndError"
              message="$(string.Event.Client_Error)" />

          <event value="201"
              symbol="Client_UnresponsiveClient_Error"
              task="Client"
              keywords="Error Trace"
              level="win:Critical"
              opcode="win:Info"
              template="tUnresponsiveClient"
              message="$(string.Event.Client_UnresponsiveClient_Error)" />

          <event value="220"
              symbol="Client_InvalidNotificationEnableRequest"
              task="Client"
              keywords="Trace"
              level="win:Warning"
              opcode="win:Info"
              template="tLineAndDataAndNotificationIdAndMax"
              message="$(string.Event.Client_InvalidNotificationEnableRequest)" />

          <event value="221"
              symbol="Client_NotificationEnableRequestAclBlocked"
              task="Client"
              keywords="Trace"
              level="win:Warning"
              opcode="win:Info"
              template="tLineAndDataAndNotificationId"
              message="$(string.Event.Client_NotificationEnableRequestAclBlocked)" />

          <event value="222"
              symbol="Client_Notification_NotEnabled"
              task="Client"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tLineAndDataAndNotificationId"
              message="$(string.Event.Client_Notification_NotEnabled)" />

          <event value="240"
              symbol="Client_State_Trace"
              task="Client"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tLineAndDatatAndDword"
              message="$(string.Event.Client_State_Trace)" />

          <event value="241"
              symbol="Client_RequestComplete_With_Canceled_Trace"
              task="Client"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tLineAndDatatAndPointer"
              message="$(string.Event.Client_RequestComplete_With_Canceled_Trace)" />

          <event value="242"
              symbol="Client_RequestComplete_With_Too_Small_Trace"
              task="Client"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tSmallBuffer"
              message="$(string.Event.Client_RequestComplete_With_Too_Small_Trace)" />

          <event value="243"
              symbol="ClientNotReadyForClosing_Warning"
              task="Client"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tDataAndValue"
              message="$(string.Event.ClientNotReadyForClosing_Warning)" />

          <event value="244"
              symbol="Client_UnresponsiveClient"
              task="Client"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tUnresponsiveClient"
              message="$(string.Event.Client_UnresponsiveClient)" />
              
          <event value="245"
              symbol="Client_State_Transit"
              task="Client"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tLineAndDatatAndDwordAndDword"
              message="$(string.Event.Client_State_Transit)" />

          <event value="246"
              symbol="Client_AdvanceClosingButNotClosing"
              task="Client"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tLineAndDatatAndDword"
              message="$(string.Event.Client_AdvanceClosingButNotClosing)" />

          <event value="247"
              symbol="Client_CleanupSyncAlreadyClosed"
              task="Client"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tLineAndDatatAndDword"
              message="$(string.Event.Client_CleanupSyncAlreadyClosed)" />
              
          <event value="248"
              symbol="Client_STATUS_WDF_PAUSED"
              task="Client"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tLineAndData"
              message="$(string.Event.Client_STATUS_WDF_PAUSED)" />

          <event value="249"
              symbol="Client_Enable_Notification"
              task="Client"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tLineAndDataAndNotificationIdAndCount"
              message="$(string.Event.Client_Enable_Notification)" />
              
          <event value="260"
              symbol="Client_DataOnly_Verbose"
              task="Client"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tLineAndData"
              message="$(string.Event.Client_DataOnly_Verbose)" />

          <event value="261"
              symbol="Client_STATUS_NO_MORE_ENTRIES_Verbose"
              task="Client"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tLineAndData"
              message="$(string.Event.Client_STATUS_NO_MORE_ENTRIES_Verbose)" />
             
          <!-- SERVICE -->
          <event value="300"
              symbol="Service_Error"
              task="Service"
              keywords="Error Trace"
              level="win:Critical"
              opcode="win:Info"
              template="tLineAndDataAndError"
              message="$(string.Event.Service_Error)" />

          <event value="301"
              symbol="Service_UnexpectedPacket_Error"
              task="Service"
              keywords="Error Trace"
              level="win:Error"
              opcode="win:Info"
              template="tLineAndDatatAndPointer"
              message="$(string.Event.Service_UnexpectedPacket_Error)" />

          <event value="302"
              symbol="Service_Handshaking_Error"
              task="Service"
              keywords="Error Trace"
              level="win:Error"
              opcode="win:Info"
              template="tLineAndData"
              message="$(string.Event.Service_Handshaking_Error)" />

          <event value="303"
              symbol="Service_NoClient_Expect_This_Return_Error"
              task="Service"
              keywords="Error Trace"
              level="win:Error"
              opcode="win:Info"
              template="tLineAndDatatAndUint64"
              message="$(string.Event.Service_NoClient_Expect_This_Return_Error)" />

           <event value="304"
              symbol="Service_NoClient_Expect_This_Response_Error"
              task="Service"
              keywords="Error Trace"
              level="win:Error"
              opcode="win:Info"
              template="tLineAndDatatAndPointer"
              message="$(string.Event.Service_NoClient_Expect_This_Response_Error)" />

           <event value="305"
              symbol="Service_Invalid_Packet_Size_Error"
              task="Service"
              keywords="Error Trace"
              level="win:Error"
              opcode="win:Info"
              template="tLineAndDatatAndPointer"
              message="$(string.Event.Service_Invalid_Packet_Size_Error)" />

           <event value="306"
              symbol="Service_Invalid_GUID_Error"
              task="Service"
              keywords="Error Trace"
              level="win:Error"
              opcode="win:Info"
              template="tLineAndDatatAndPointer"
              message="$(string.Event.Service_Invalid_GUID_Error)" />
              
          <event value="320"
              symbol="Service_RIL_Result_Warning"
              task="Service"
              keywords="Trace"
              level="win:Warning"
              opcode="win:Info"
              template="tRILResult"
              message="$(string.Event.Service_RIL_Result_Warning)" />

          <event value="321"
              symbol="Service_NewMaxResponseTime_Warning"
              task="Service"
              keywords="Trace"
              level="win:Warning"
              opcode="win:Info"
              template="tNewMaxTime"
              message="$(string.Event.Service_NewMaxResponseTime_Warning)" />

          <event value="322"
              symbol="Service_LongResponseTime_Warning"
              task="Service"
              keywords="Trace"
              level="win:Warning"
              opcode="win:Info"
              template="tNewMaxTime"
              message="$(string.Event.Service_LongResponseTime_Warning)" />

          <event value="323"
              symbol="Service_NewMaxReturnTime_Warning"
              task="Service"
              keywords="Trace"
              level="win:Warning"
              opcode="win:Info"
              template="tNewMaxTime"
              message="$(string.Event.Service_NewMaxReturnTime_Warning)" />

          <event value="324"
              symbol="Service_LongReturnTime_Warning"
              task="Service"
              keywords="Trace"
              level="win:Warning"
              opcode="win:Info"
              template="tNewMaxTime"
              message="$(string.Event.Service_LongReturnTime_Warning)" />

           <event value="325"
              symbol="Service_Response_ForDeadClient_Warning"
              task="Service"
              keywords="Trace"
              level="win:Warning"
              opcode="win:Info"
              template="tLineAndDatatAndPointer"
              message="$(string.Event.Service_Response_ForDeadClient_Warning)" />

          <event value="326"
              symbol="Service_Invalid_Request_Warning"
              task="Service"
              keywords="Trace"
              level="win:Error"
              opcode="win:Info"
              template="tLineAndDatatAndDword"
              message="$(string.Event.Service_Invalid_Request_Warning)" />

          <event value="327"
              symbol="Service_Breaking_Pipe_Warning"
              task="Service"
              keywords="Trace"
              level="win:Error"
              opcode="win:Info"
              template="tLineAndData"
              message="$(string.Event.Service_Breaking_Pipe_Warning)" />

          <event value="328"
              symbol="Service_Pipe_Broken_Warning"
              task="Service"
              keywords="Trace"
              level="win:Error"
              opcode="win:Info"
              template="tLineAndData"
              message="$(string.Event.Service_Pipe_Broken_Warning)" />
              
          <event value="340"
              symbol="Service_State_Trace"
              task="Service"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tLineAndDatatAndDword"
              message="$(string.Event.Service_State_Trace)" />

           <event value="341"
              symbol="Service_Client_CleanUp_Trace"
              task="Service"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tClientCleanUp"
              message="$(string.Event.Service_Client_CleanUp_Trace)" />

           <event value="342"
              symbol="Service_Finalize_Trace"
              task="Service"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tLineAndDatatAndDword"
              message="$(string.Event.Service_Finalize_Trace)" />

          <event value="343"
              symbol="Service_State_Transit"
              task="Service"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tLineAndDatatAndDwordAndDword"
              message="$(string.Event.Service_State_Transit)" />

          <event value="344"
              symbol="Service_Command_Trace"
              task="Service"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tCommandPacket"
              message="$(string.Event.Service_Command_Trace)" />


          <event value="360"
              symbol="Service_DataOnly_Verbose"
              task="Service"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tLineAndData"
              message="$(string.Event.Service_DataOnly_Verbose)" />

          <event value="361"
              symbol="Service_Packet_Verbose"
              task="Service"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tLineAndDatatAndPointer"
              message="$(string.Event.Service_Packet_Verbose)" />

          <!-- ACL -->
          <event value="420"
              symbol="ACL_Command_Denied"
              task="ACL"
              keywords="Trace"
              level="win:Error"
              opcode="win:Info"
              template="tCommandIdAndCapability"
              message="$(string.Event.ACL_Command_Denied)" />

          <event value="421"
              symbol="ACL_Notification_Blocked"
              task="ACL"
              keywords="Trace"
              level="win:Verbose"
              opcode="win:Info"
              template="tNotificationIdAndCapability"
              message="$(string.Event.ACL_Notification_Blocked)" />
              
          <event value="461"
              symbol="ACL_Capability"
              task="ACL"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tDword"              
              message="$(string.Event.ACL_Capability)" />

          <event value="462"
              symbol="ACL_Capability_With_ClientData"
              task="ACL"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tLineAndDatatAndDword"              
              message="$(string.Event.ACL_Capability_With_ClientData)" />

          <!-- Don't use this for product -->
          <event value="999"
              symbol="GeneralTempDebuggingMessage"
              task="MSRil"
              keywords="Trace"
              level="win:Informational"
              opcode="win:Info"
              template="tLineAndString"
              message="$(string.Event.GeneralTempDebuggingMessage)" />              
           
        </events>

      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="RilCommandID.RIL_COMMAND_INITNOTIFICATIONS" value="RIL_COMMAND_INITNOTIFICATIONS" />
        <string id="RilCommandID.RIL_COMMAND_GETNEXTNOTIFICATION" value="RIL_COMMAND_GETNEXTNOTIFICATION" />
        <string id="RilCommandID.RIL_COMMAND_ENABLENOTIFICATIONS" value="RIL_COMMAND_ENABLENOTIFICATIONS" />
        <string id="RilCommandID.RIL_COMMAND_DISABLENOTIFICATIONS" value="RIL_COMMAND_DISABLENOTIFICATIONS" />
        <string id="RilCommandID.RIL_COMMAND_GETDRIVERVERSION" value="RIL_COMMAND_GETDRIVERVERSION" />
        <string id="RilCommandID.RIL_COMMAND_GETDEVCAPS" value="RIL_COMMAND_GETDEVCAPS" />
        <string id="RilCommandID.RIL_COMMAND_GETDEVICEINFO" value="RIL_COMMAND_GETDEVICEINFO" />
        <string id="RilCommandID.RIL_COMMAND_GETEQUIPMENTSTATE" value="RIL_COMMAND_GETEQUIPMENTSTATE" />
        <string id="RilCommandID.RIL_COMMAND_SETEQUIPMENTSTATE" value="RIL_COMMAND_SETEQUIPMENTSTATE" />
        <string id="RilCommandID.RIL_COMMAND_SETNOTIFICATIONFILTERSTATE" value="RIL_COMMAND_SETNOTIFICATIONFILTERSTATE" />
        <string id="RilCommandID.RIL_COMMAND_GETNOTIFICATIONFILTERSTATE" value="RIL_COMMAND_GETNOTIFICATIONFILTERSTATE" />
        <string id="RilCommandID.RIL_COMMAND_ENUMERATESLOTS" value="RIL_COMMAND_ENUMERATESLOTS" />
        <string id="RilCommandID.RIL_COMMAND_GETCARDINFO" value="RIL_COMMAND_GETCARDINFO" />
        <string id="RilCommandID.RIL_COMMAND_SETSLOTPOWER" value="RIL_COMMAND_SETSLOTPOWER" />
        <string id="RilCommandID.RIL_COMMAND_GETUICCRECORDSTATUS" value="RIL_COMMAND_GETUICCRECORDSTATUS" />
        <string id="RilCommandID.RIL_COMMAND_SENDRESTRICTEDUICCCMD" value="RIL_COMMAND_SENDRESTRICTEDUICCCMD" />
        <string id="RilCommandID.RIL_COMMAND_WATCHUICCFILECHANGE" value="RIL_COMMAND_WATCHUICCFILECHANGE" />
        <string id="RilCommandID.RIL_COMMAND_GETUICCPRLID" value="RIL_COMMAND_GETUICCPRLID" />
        <string id="RilCommandID.RIL_COMMAND_GETIMSI" value="RIL_COMMAND_GETIMSI" />
        <string id="RilCommandID.RIL_COMMAND_GETSUBSCRIBERNUMBERS" value="RIL_COMMAND_GETSUBSCRIBERNUMBERS" />
        <string id="RilCommandID.RIL_COMMAND_GETUICCLOCKSTATE" value="RIL_COMMAND_GETUICCLOCKSTATE" />
        <string id="RilCommandID.RIL_COMMAND_GETUICCSERVICELOCK" value="RIL_COMMAND_GETUICCSERVICELOCK" />
        <string id="RilCommandID.RIL_COMMAND_VERIFYUICCLOCK" value="RIL_COMMAND_VERIFYUICCLOCK" />
        <string id="RilCommandID.RIL_COMMAND_SETUICCLOCKENABLED" value="RIL_COMMAND_SETUICCLOCKENABLED" />
        <string id="RilCommandID.RIL_COMMAND_UNBLOCKUICCLOCK" value="RIL_COMMAND_UNBLOCKUICCLOCK" />
        <string id="RilCommandID.RIL_COMMAND_CHANGEUICCLOCKPASSWORD" value="RIL_COMMAND_CHANGEUICCLOCKPASSWORD" />
        <string id="RilCommandID.RIL_COMMAND_GETUICCAPPPERSOCHECKSTATE" value="RIL_COMMAND_GETUICCAPPPERSOCHECKSTATE" />
        <string id="RilCommandID.RIL_COMMAND_GETPERSODEACTIVATIONSTATE" value="RIL_COMMAND_GETPERSODEACTIVATIONSTATE" />
        <string id="RilCommandID.RIL_COMMAND_DEACTIVATEPERSO" value="RIL_COMMAND_DEACTIVATEPERSO" />
        <string id="RilCommandID.RIL_COMMAND_READPHONEBOOKENTRIES" value="RIL_COMMAND_READPHONEBOOKENTRIES" />
        <string id="RilCommandID.RIL_COMMAND_WRITEPHONEBOOKENTRY" value="RIL_COMMAND_WRITEPHONEBOOKENTRY" />
        <string id="RilCommandID.RIL_COMMAND_DELETEPHONEBOOKENTRY" value="RIL_COMMAND_DELETEPHONEBOOKENTRY" />
        <string id="RilCommandID.RIL_COMMAND_GETPHONEBOOKOPTIONS" value="RIL_COMMAND_GETPHONEBOOKOPTIONS" />
        <string id="RilCommandID.RIL_COMMAND_GETALLADDITIONALNUMBERSTRINGS" value="RIL_COMMAND_GETALLADDITIONALNUMBERSTRINGS" />
        <string id="RilCommandID.RIL_COMMAND_GETALLEMERGENCYNUMBERS" value="RIL_COMMAND_GETALLEMERGENCYNUMBERS" />
        <string id="RilCommandID.RIL_COMMAND_SETRADIOCONFIGURATION" value="RIL_COMMAND_SETRADIOCONFIGURATION" />
        <string id="RilCommandID.RIL_COMMAND_GETRADIOCONFIGURATION" value="RIL_COMMAND_GETRADIOCONFIGURATION" />
        <string id="RilCommandID.RIL_COMMAND_SETEXECUTORCONFIG" value="RIL_COMMAND_SETEXECUTORCONFIG" />
        <string id="RilCommandID.RIL_COMMAND_GETEXECUTORCONFIG" value="RIL_COMMAND_GETEXECUTORCONFIG" />
        <string id="RilCommandID.RIL_COMMAND_SETSYSTEMSELECTIONPREFS" value="RIL_COMMAND_SETSYSTEMSELECTIONPREFS" />
        <string id="RilCommandID.RIL_COMMAND_GETSYSTEMSELECTIONPREFS" value="RIL_COMMAND_GETSYSTEMSELECTIONPREFS" />
        <string id="RilCommandID.RIL_COMMAND_GETOPERATORLIST" value="RIL_COMMAND_GETOPERATORLIST" />
        <string id="RilCommandID.RIL_COMMAND_GETPREFERREDOPERATORLIST" value="RIL_COMMAND_GETPREFERREDOPERATORLIST" />
        <string id="RilCommandID.RIL_COMMAND_GETCURRENTREGSTATUS" value="RIL_COMMAND_GETCURRENTREGSTATUS" />
        <string id="RilCommandID.RIL_COMMAND_GETSIGNALQUALITY" value="RIL_COMMAND_GETSIGNALQUALITY" />
        <string id="RilCommandID.RIL_COMMAND_SENDAKEY" value="  RIL_COMMAND_SENDAKEY" />
        <string id="RilCommandID.RIL_COMMAND_SENDUICCTOOLKITCMDRESPONSE" value="RIL_COMMAND_SENDUICCTOOLKITCMDRESPONSE" />
        <string id="RilCommandID.RIL_COMMAND_SENDUICCTOOLKITENVELOPE" value="RIL_COMMAND_SENDUICCTOOLKITENVELOPE" />
        <string id="RilCommandID.RIL_COMMAND_DIAL" value="RIL_COMMAND_DIAL" />
        <string id="RilCommandID.RIL_COMMAND_MANAGECALLS" value="RIL_COMMAND_MANAGECALLS" />
        <string id="RilCommandID.RIL_COMMAND_EMERGENCYMODECONTROL" value="RIL_COMMAND_EMERGENCYMODECONTROL" />
        <string id="RilCommandID.RIL_COMMAND_GETCALLFORWARDINGSETTINGS" value="RIL_COMMAND_GETCALLFORWARDINGSETTINGS" />
        <string id="RilCommandID.RIL_COMMAND_SETCALLFORWARDINGSTATUS" value="RIL_COMMAND_SETCALLFORWARDINGSTATUS" />
        <string id="RilCommandID.RIL_COMMAND_ADDCALLFORWARDING" value="RIL_COMMAND_ADDCALLFORWARDING" />
        <string id="RilCommandID.RIL_COMMAND_REMOVECALLFORWARDING" value="RIL_COMMAND_REMOVECALLFORWARDING" />
        <string id="RilCommandID.RIL_COMMAND_GETCALLBARRINGSTATUS" value="RIL_COMMAND_GETCALLBARRINGSTATUS" />
        <string id="RilCommandID.RIL_COMMAND_SETCALLBARRINGSTATUS" value="RIL_COMMAND_SETCALLBARRINGSTATUS" />
        <string id="RilCommandID.RIL_COMMAND_CHANGECALLBARRINGPASSWORD" value="RIL_COMMAND_CHANGECALLBARRINGPASSWORD" />
        <string id="RilCommandID.RIL_COMMAND_GETCALLWAITINGSETTINGS" value="RIL_COMMAND_GETCALLWAITINGSETTINGS" />
        <string id="RilCommandID.RIL_COMMAND_SETCALLWAITINGSTATUS" value="RIL_COMMAND_SETCALLWAITINGSTATUS" />
        <string id="RilCommandID.RIL_COMMAND_GETCALLERIDSETTINGS" value="RIL_COMMAND_GETCALLERIDSETTINGS" />
        <string id="RilCommandID.RIL_COMMAND_GETDIALEDIDSETTINGS" value="RIL_COMMAND_GETDIALEDIDSETTINGS" />
        <string id="RilCommandID.RIL_COMMAND_GETHIDECONNECTEDIDSETTINGS" value="RIL_COMMAND_GETHIDECONNECTEDIDSETTINGS" />
        <string id="RilCommandID.RIL_COMMAND_GETHIDEIDSETTINGS" value="RIL_COMMAND_GETHIDEIDSETTINGS" />
        <string id="RilCommandID.RIL_COMMAND_SENDFLASH" value="RIL_COMMAND_SENDFLASH" />
        <string id="RilCommandID.RIL_COMMAND_SENDSUPSERVICEDATA" value="RIL_COMMAND_SENDSUPSERVICEDATA" />
        <string id="RilCommandID.RIL_COMMAND_SENDDTMF" value="RIL_COMMAND_SENDDTMF" />
        <string id="RilCommandID.RIL_COMMAND_STARTDTMF" value="RIL_COMMAND_STARTDTMF" />
        <string id="RilCommandID.RIL_COMMAND_STOPDTMF" value="RIL_COMMAND_STOPDTMF" />
        <string id="RilCommandID.RIL_COMMAND_GETMSGSERVICEOPTIONS" value="RIL_COMMAND_GETMSGSERVICEOPTIONS" />
        <string id="RilCommandID.RIL_COMMAND_READMSG" value="RIL_COMMAND_READMSG" />
        <string id="RilCommandID.RIL_COMMAND_WRITEMSG" value="RIL_COMMAND_WRITEMSG" />
        <string id="RilCommandID.RIL_COMMAND_DELETEMSG" value="RIL_COMMAND_DELETEMSG" />
        <string id="RilCommandID.RIL_COMMAND_GETCELLBROADCASTMSGCONFIG" value="RIL_COMMAND_GETCELLBROADCASTMSGCONFIG" />
        <string id="RilCommandID.RIL_COMMAND_SETCELLBROADCASTMSGCONFIG" value="RIL_COMMAND_SETCELLBROADCASTMSGCONFIG" />
        <string id="RilCommandID.RIL_COMMAND_GETMSGINUICCSTATUS" value="RIL_COMMAND_GETMSGINUICCSTATUS" />
        <string id="RilCommandID.RIL_COMMAND_SETMSGINUICCSTATUS" value="RIL_COMMAND_SETMSGINUICCSTATUS" />
        <string id="RilCommandID.RIL_COMMAND_SETMSGMEMORYSTATUS" value="RIL_COMMAND_SETMSGMEMORYSTATUS" />
        <string id="RilCommandID.RIL_COMMAND_SENDMSG" value="RIL_COMMAND_SENDMSG" />
        <string id="RilCommandID.RIL_COMMAND_GETSMSC" value="RIL_COMMAND_GETSMSC" />
        <string id="RilCommandID.RIL_COMMAND_SETSMSC" value="RIL_COMMAND_SETSMSC" />
        <string id="RilCommandID.RIL_COMMAND_GETIMSSTATUS" value="RIL_COMMAND_GETIMSSTATUS" />
        <string id="RilCommandID.RIL_COMMAND_GETPOSITIONINFO" value="RIL_COMMAND_GETPOSITIONINFO" />
        <string id="RilCommandID.RIL_COMMAND_GETRADIOSTATEGROUPS" value="RIL_COMMAND_GETRADIOSTATEGROUPS" />
        <string id="RilCommandID.RIL_COMMAND_GETRADIOSTATEDETAILS" value="RIL_COMMAND_GETRADIOSTATEDETAILS" />
        <string id="RilCommandID.RIL_COMMAND_SETRADIOSTATEDETAILS" value="RIL_COMMAND_SETRADIOSTATEDETAILS" />
        <string id="RilCommandID.RIL_COMMAND_RADIOSTATEPASSWORDCOMPARE" value="RIL_COMMAND_RADIOSTATEPASSWORDCOMPARE" />
        <string id="RilCommandID.RIL_COMMAND_RADIOSTATEGETPASSWORDRETRYCOUNT" value="RIL_COMMAND_RADIOSTATEGETPASSWORDRETRYCOUNT" />
        <string id="RilCommandID.RIL_COMMAND_DEVSPECIFIC" value="RIL_COMMAND_DEVSPECIFIC" />
        <string id="RilCommandID.RIL_COMMAND_SETRFSTATE" value="RIL_COMMAND_SETRFSTATE" />
        <string id="RilCommandID.RIL_COMMAND_GETRFSTATE" value="RIL_COMMAND_GETRFSTATE" />
        <string id="RilCommandID.RIL_COMMAND_GETDMPROFILECONFIGINFO" value="RIL_COMMAND_GETDMPROFILECONFIGINFO" />
        <string id="RilCommandID.RIL_COMMAND_SETDMPROFILECONFIGINFO" value="RIL_COMMAND_SETDMPROFILECONFIGINFO" />
        <string id="RilCommandID.RIL_COMMAND_WRITEADDITIONALNUMBERSTRING" value="RIL_COMMAND_WRITEADDITIONALNUMBERSTRING" />
        <string id="RilCommandID.RIL_COMMAND_DELETEADDITIONALNUMBERSTRING" value="RIL_COMMAND_DELETEADDITIONALNUMBERSTRING" />
        <string id="RilCommandID.RIL_COMMAND_GETUICCATR" value="RIL_COMMAND_GETUICCATR" />
        <string id="RilCommandID.RIL_COMMAND_OPENUICCLOGICALCHANNEL" value="RIL_COMMAND_OPENUICCLOGICALCHANNEL" />
        <string id="RilCommandID.RIL_COMMAND_CLOSEUICCLOGICALCHANNEL" value="RIL_COMMAND_CLOSEUICCLOGICALCHANNEL" />
        <string id="RilCommandID.RIL_COMMAND_EXCHANGEUICCAPDU" value="RIL_COMMAND_EXCHANGEUICCAPDU" />
        <string id="RilCommandID.RIL_COMMAND_SENDSUPSERVICEDATARESPONSE" value="RIL_COMMAND_SENDSUPSERVICEDATARESPONSE" />
        <string id="RilCommandID.RIL_COMMAND_CANCELSUPSERVICEDATASESSION" value="RIL_COMMAND_CANCELSUPSERVICEDATASESSION" />
        <string id="RilCommandID.RIL_COMMAND_SETUICCTOOLKITPROFILE" value="RIL_COMMAND_SETUICCTOOLKITPROFILE" />
        <string id="RilCommandID.RIL_COMMAND_GETUICCTOOLKITPROFILE" value="RIL_COMMAND_GETUICCTOOLKITPROFILE" />
        <string id="RilCommandID.RIL_COMMAND_REGISTERUICCTOOLKITSERVICE" value="RIL_COMMAND_REGISTERUICCTOOLKITSERVICE" />
        <string id="RilCommandID.RIL_COMMAND_SENDMSGACK" value="RIL_COMMAND_SENDMSGACK" />
        <string id="RilCommandID.RIL_COMMAND_CLOSEUICCLOGICALCHANNELGROUP" value="RIL_COMMAND_CLOSEUICCLOGICALCHANNELGROUP" />
        <string id="RilCommandID.RIL_COMMAND_SETPREFERREDOPERATORLIST" value="RIL_COMMAND_SETPREFERREDOPERATORLIST" />
        <string id="RilCommandID.RIL_COMMAND_GETUICCSERVICESTATE" value="RIL_COMMAND_GETUICCSERVICESTATE" />
        <string id="RilCommandID.RIL_COMMAND_SETUICCSERVICESTATE" value="RIL_COMMAND_SETUICCSERVICESTATE" />
        <string id="RilCommandID.RIL_COMMAND_GETCALLLIST" value="RIL_COMMAND_GETCALLLIST" />
        <string id="RilCommandID.RIL_COMMAND_GETEXECUTORFOCUS" value="RIL_COMMAND_GETEXECUTORFOCUS" />
        <string id="RilCommandID.RIL_COMMAND_SETEXECUTORFOCUS" value="RIL_COMMAND_SETEXECUTORFOCUS" />
        <string id="RilCommandID.RIL_COMMAND_GETEMERGENCYMODE" value="RIL_COMMAND_GETEMERGENCYMODE" />
        <string id="RilCommandID.RIL_COMMAND_GETEXECUTORRFSTATE" value="RIL_COMMAND_GETEXECUTORRFSTATE" />
        <string id="RilCommandID.RIL_COMMAND_SETEXECUTORRFSTATE" value="RIL_COMMAND_SETEXECUTORRFSTATE" />
        <string id="RilCommandID.RIL_COMMAND_RESETMODEM" value="RIL_COMMAND_RESETMODEM" />
        <string id="RilCommandID.RIL_COMMAND_CANCELGETOPERATORLIST" value="RIL_COMMAND_CANCELGETOPERATORLIST" />
        <string id="RilCommandID.RIL_COMMAND_AVOIDCDMASYSTEM" value="RIL_COMMAND_AVOIDCDMASYSTEM" />
        <string id="RilCommandID.RIL_COMMAND_SETPSMEDIACONFIGURATION" value="RIL_COMMAND_SETPSMEDIACONFIGURATION" />
        <string id="RilCommandID.RIL_COMMAND_GETPSMEDIACONFIGURATION" value="RIL_COMMAND_GETPSMEDIACONFIGURATION" />
        <string id="RilCommandID.RIL_COMMAND_ENABLEMODEMFILTERS" value="RIL_COMMAND_ENABLEMODEMFILTERS" />
        <string id="RilCommandID.RIL_COMMAND_DISABLEMODEMFILTERS" value="RIL_COMMAND_DISABLEMODEMFILTERS" />
        <string id="RilCommandID.RIL_COMMAND_STARTMODEMLOGS" value="RIL_COMMAND_STARTMODEMLOGS" />
        <string id="RilCommandID.RIL_COMMAND_STOPMODEMLOGS" value="RIL_COMMAND_STOPMODEMLOGS" />
        <string id="RilCommandID.RIL_COMMAND_DRAINMODEMLOGS" value="RIL_COMMAND_DRAINMODEMLOGS" />

        <string id="RilNotificationID.RIL_NOTIFY_OEM_MAX" value="RIL_NOTIFY_OEM_MAX" />
        <string id="RilNotificationID.RIL_NOTIFY_RADIOEQUIPMENTSTATECHANGED" value="RIL_NOTIFY_RADIOEQUIPMENTSTATECHANGED" />
        <string id="RilNotificationID.RIL_NOTIFY_RADIOPRESENCECHANGED" value="RIL_NOTIFY_RADIOPRESENCECHANGED" />
        <string id="RilNotificationID.RIL_NOTIFY_UICCFILE_DATACHANGE" value="RIL_NOTIFY_UICCFILE_DATACHANGE" />
        <string id="RilNotificationID.RIL_NOTIFY_UICCAPP_DATACHANGE" value="RIL_NOTIFY_UICCAPP_DATACHANGE" />
        <string id="RilNotificationID.RIL_NOTIFY_SLOTINFOCHANGED" value="RIL_NOTIFY_SLOTINFOCHANGED" />
        <string id="RilNotificationID.RIL_NOTIFY_CARDAPPREMOVED" value="RIL_NOTIFY_CARDAPPREMOVED" />
        <string id="RilNotificationID.RIL_NOTIFY_CARDAPPADDED" value="RIL_NOTIFY_CARDAPPADDED" />
        <string id="RilNotificationID.RIL_NOTIFY_UICCLOCKSTATUS" value="RIL_NOTIFY_UICCLOCKSTATUS" />
        <string id="RilNotificationID.RIL_NOTIFY_UICCAPPPERSOCHECKSTATUS" value="RIL_NOTIFY_UICCAPPPERSOCHECKSTATUS" />
        <string id="RilNotificationID.RIL_NOTIFY_PHONEBOOKENTRYDELETED" value="RIL_NOTIFY_PHONEBOOKENTRYDELETED" />
        <string id="RilNotificationID.RIL_NOTIFY_PHONEBOOKENTRYSTORED" value="RIL_NOTIFY_PHONEBOOKENTRYSTORED" />
        <string id="RilNotificationID.RIL_NOTIFY_PHONEBOOKREADYSTATE" value="RIL_NOTIFY_PHONEBOOKREADYSTATE" />
        <string id="RilNotificationID.RIL_NOTIFY_EMERGENCYNUMBERLISTCHANGED" value="RIL_NOTIFY_EMERGENCYNUMBERLISTCHANGED" />
        <string id="RilNotificationID.RIL_NOTIFY_REGSTATUSCHANGED" value="RIL_NOTIFY_REGSTATUSCHANGED" />
        <string id="RilNotificationID.RIL_NOTIFY_LOCATIONUPDATE" value="RIL_NOTIFY_LOCATIONUPDATE" />
        <string id="RilNotificationID.RIL_NOTIFY_NETWORKCODECHANGED" value="RIL_NOTIFY_NETWORKCODECHANGED" />
        <string id="RilNotificationID.RIL_NOTIFY_PROVISION_STATUS" value="RIL_NOTIFY_PROVISION_STATUS" />
        <string id="RilNotificationID.RIL_NOTIFY_SYSTEMPREFSCHANGED" value="RIL_NOTIFY_SYSTEMPREFSCHANGED" />
        <string id="RilNotificationID.RIL_NOTIFY_EXECUTORSTATE" value="RIL_NOTIFY_EXECUTORSTATE" />
        <string id="RilNotificationID.RIL_NOTIFY_MANAGED_ROAMING" value="RIL_NOTIFY_MANAGED_ROAMING" />
        <string id="RilNotificationID.RIL_NOTIFY_SIGNALQUALITY" value="RIL_NOTIFY_SIGNALQUALITY" />
        <string id="RilNotificationID.RIL_NOTIFY_NITZ" value="RIL_NOTIFY_NITZ" />
        <string id="RilNotificationID.RIL_NOTIFY_UICCTOOLKITCMD" value="RIL_NOTIFY_UICCTOOLKITCMD" />
        <string id="RilNotificationID.RIL_NOTIFY_CALLMODIFICATIONINFO" value="RIL_NOTIFY_CALLMODIFICATIONINFO" />
        <string id="RilNotificationID.RIL_NOTIFY_CALLPROGRESSINFO" value="RIL_NOTIFY_CALLPROGRESSINFO" />
        <string id="RilNotificationID.RIL_NOTIFY_EMERGENCYMODEENTERED" value="RIL_NOTIFY_EMERGENCYMODEENTERED" />
        <string id="RilNotificationID.RIL_NOTIFY_EMERGENCYMODEEXITED" value="RIL_NOTIFY_EMERGENCYMODEEXITED" />
        <string id="RilNotificationID.RIL_NOTIFY_CALLWAITING" value="RIL_NOTIFY_CALLWAITING" />
        <string id="RilNotificationID.RIL_NOTIFY_DIALEDID" value="RIL_NOTIFY_DIALEDID" />
        <string id="RilNotificationID.RIL_NOTIFY_DISPLAY" value="RIL_NOTIFY_DISPLAY" />
        <string id="RilNotificationID.RIL_NOTIFY_SUPSVCINFO" value="RIL_NOTIFY_SUPSVCINFO" />
        <string id="RilNotificationID.RIL_NOTIFY_SUPSERVICEDATA" value="RIL_NOTIFY_SUPSERVICEDATA" />
        <string id="RilNotificationID.RIL_NOTIFY_UNSOLICITEDSS" value="RIL_NOTIFY_UNSOLICITEDSS" />
        <string id="RilNotificationID.RIL_NOTIFY_LINECONTROL" value="RIL_NOTIFY_LINECONTROL" />
        <string id="RilNotificationID.RIL_NOTIFY_MESSAGE" value="RIL_NOTIFY_MESSAGE" />
        <string id="RilNotificationID.RIL_NOTIFY_MESSAGE_IN_UICC" value="RIL_NOTIFY_MESSAGE_IN_UICC" />
        <string id="RilNotificationID.RIL_NOTIFY_IMSSTATUS" value="RIL_NOTIFY_IMSSTATUS" />
        <string id="RilNotificationID.RIL_NOTIFY_ADDITIONALNUMBERSTRINGUPDATED" value="RIL_NOTIFY_ADDITIONALNUMBERSTRINGUPDATED" />
        <string id="RilNotificationID.RIL_NOTIFY_SUPSERVICEDATATERMINATED" value="RIL_NOTIFY_SUPSERVICEDATATERMINATED" />
        <string id="RilNotificationID.RIL_NOTIFY_CLEARIDLEMODETEXT" value="RIL_NOTIFY_CLEARIDLEMODETEXT" />
        <string id="RilNotificationID.RIL_NOTIFY_MESSAGE_STORAGE_FULL" value="RIL_NOTIFY_MESSAGE_STORAGE_FULL" />
        <string id="RilNotificationID.RIL_NOTIFY_TONESIGNAL" value="RIL_NOTIFY_TONESIGNAL" />
        <string id="RilNotificationID.RIL_NOTIFY_FORWARDSTARTDTMF" value="RIL_NOTIFY_FORWARDSTARTDTMF" />
        <string id="RilNotificationID.RIL_NOTIFY_FORWARDSTOPDTMF" value="RIL_NOTIFY_FORWARDSTOPDTMF" />
        <string id="RilNotificationID.RIL_NOTIFY_FORWARDBURSTDTMF" value="RIL_NOTIFY_FORWARDBURSTDTMF" />
        <string id="RilNotificationID.RIL_NOTIFY_EXECUTORFOCUSSTATECHANGED" value="RIL_NOTIFY_EXECUTORFOCUSSTATECHANGED" />
        <string id="RilNotificationID.RIL_NOTIFY_EXECUTORRFSTATE" value="RIL_NOTIFY_EXECUTORRFSTATE" />
        <string id="RilNotificationID.RIL_NOTIFY_MODEMRESET" value="RIL_NOTIFY_MODEMRESET" />
        <string id="RilNotificationID.RIL_NOTIFY_RADIOCONFIGURATION" value="RIL_NOTIFY_RADIOCONFIGURATION" />
        <string id="RilNotificationID.RIL_NOTIFY_IMSHANDOVERATTEMPT" value="RIL_NOTIFY_IMSHANDOVERATTEMPT" />
        <string id="RilNotificationID.RIL_NOTIFY_ADDITIONALCALLERINFO" value="RIL_NOTIFY_ADDITIONALCALLERINFO" />
        <string id="RilNotificationID.RIL_NOTIFY_MWISUMMARY" value="RIL_NOTIFY_MWISUMMARY" />
        <string id="RilNotificationID.RIL_NOTIFY_MWIDETAILS" value="RIL_NOTIFY_MWIDETAILS" />
        <string id="RilNotificationID.RIL_NOTIFY_IMSFAILURE" value="RIL_NOTIFY_IMSFAILURE" />

        <string id="Keyword.Error"                      value="Error" />
        <string id="Keyword.Performance"                value="Performance" />
        <string id="Keyword.Trace"                      value="Trace" />

        <!-- DriverMain -->
        <string id="Event.DriverMain_Error"                             value="[MSRIL][Line=%1] DriverMain Error=%2" />        
        <string id="Event.DriverMain_DriverEntry_Begin"                 value="[MSRIL] DriverMain DriverEntry Begin" />
        <string id="Event.DriverMain_DriverEntry_End"                   value="[MSRIL] DriverMain DriverEntry End" />
        <string id="Event.DriverMain_DeviceAdd_Begin"                   value="[MSRIL] DriverMain MSRilDeviceAdd Begin" />
        <string id="Event.DriverMain_DeviceAdd_End"                     value="[MSRIL] DriverMain MSRilDeviceAdd End" />
        <string id="Event.DriverMain_DeviceClean_Begin"                 value="[MSRIL] DriverMain MSRilCleanupDevice Begin" />
        <string id="Event.DriverMain_DeviceClean_End"                   value="[MSRIL] DriverMain MSRilCleanupDevice End" />

        <!-- MSRil -->
        <string id="Event.MSRilStart"                                   value="[MSRIL] MSRil Start" />
        <string id="Event.MSRilStop"                                    value="[MSRIL] MSRil Stop" />

        <string id="Event.MSRil_Error"                                  value="[MSRIL][Line=%1] MSRil=%2 Error=%3" />        
        <string id="Event.MSRil_TypeMismatchedPacket_Error"             value="[MSRIL][Line=%1] MSRil=%2 Client=%3 Error: Mismatched packet type (Type=%4)" />
        <string id="Event.MSRil_InvalidLengthPacket_Error"              value="[MSRIL][Line=%1] MSRil=%2 Client=%3 Error: Invalid Length packet (WriteSize=%4)" />
        
        <string id="Event.MSRil_DataOnly_Verbose"                       value="[MSRIL][Line=%1] MSRil=%2" />
        <string id="Event.MSRil_FileObject_Verbose"                     value="[MSRIL][Line=%1] MSRil=%2 FileObject=%3" />
        <string id="Event.MSRil_Client_Verbose"                         value="[MSRIL][Line=%1] MSRil=%2 Client=%3" />        

        <string id="Event.MSRil_FileCleanup_Begin"                      value="[MSRIL][Line=%1] MSRil MSRilFileCleanup Begin Client=%2" />
        <string id="Event.MSRil_FileCleanup_End"                        value="[MSRIL][Line=%1] MSRil MSRilFileCleanup End Client=%2" />
        
        
        <!-- Client -->        
        <string id="Event.Client_Error"                                 value="[MSRIL][Line=%1] Client=%2 Error=%3" />   
        <string id="Event.Client_UnresponsiveClient"                    value="[MSRIL][Line=%1] Trace: Unresponsive check: Client=%2, Pending unread payload size=%3, Last successful read happened %4 ms ago." />
        <string id="Event.Client_UnresponsiveClient_Error"              value="[MSRIL][Line=%1] Error: Unresponsive Client=%2, Pending unread payload size=%3, Last successful read happened %4 ms ago." />
        
        <string id="Event.ClientNotReadyForClosing_Warning"             value="[MSRIL] Client=%1 Not ready to enter CLIENT_STATE_CLOSED. (PendingWriteRequestCount=%2)" />
        <string id="Event.Client_InvalidNotificationEnableRequest"      value="[MSRIL] Client=%1 Invalid notification enable request. (notification=%2=%3) (RIL_NOTIFY_COUNT=%4)" />
        <string id="Event.Client_NotificationEnableRequestAclBlocked"   value="[MSRIL] Client=%1 notification enable request, but blocked by ACL. (notification=%2=%3)" />
        <string id="Event.Client_Notification_NotEnabled"               value="[MSRIL] Client=%1 notification is not enabled. (notification=%2=%3)" />
        
        <string id="Event.Client_State_Trace"                           value="[MSRIL][Line=%1] Client=%2 State=%3" />
        <string id="Event.Client_RequestComplete_With_Canceled_Trace"   value="[MSRIL][Line=%1] Client=%2 a request[%3] is completed with STATUS_CANCELLED" />
        <string id="Event.Client_RequestComplete_With_Too_Small_Trace"  value="[MSRIL][Line=%1] Client=%2 a request[%3] is completed with STATUS_BUFFER_TOO_SMALL. BufferSize=%4 PacketSize=%5" />
        <string id="Event.Client_State_Transit"                         value="[MSRIL][Line=%1] Client=%2 Change State=%3 to %4" />
        <string id="Event.Client_AdvanceClosingButNotClosing"           value="[MSRIL][Line=%1] Client=%2 ClientAdvanceClosingStateIfNeededSync: Client state(=%3) is not closing, so returns." />
        <string id="Event.Client_CleanupSyncAlreadyClosed"              value="[MSRIL][Line=%1] Client=%2 ClientCleanupSync: Client is already closed, so returns." />        
        <string id="Event.Client_STATUS_WDF_PAUSED"                     value="[MSRIL][Line=%1] Client=%2 WdfIoQueueRetrieveNextRequest returns STATUS_WDF_PAUSED" />
        <string id="Event.Client_Enable_Notification"                   value="[MSRIL][Line=%1] Client=%2 Notification[%3=%4] is enabled [RefCount=%5]" />

        <string id="Event.Client_DataOnly_Verbose"                      value="[MSRIL][Line=%1] Client=%2" />
        <string id="Event.Client_STATUS_NO_MORE_ENTRIES_Verbose"        value="[MSRIL][Line=%1] Client=%2 WdfIoQueueRetrieveNextRequest returns STATUS_NO_MORE_ENTRIES" />
        

        <!-- Service -->
        <string id="Event.Service_Error"                                 value="[MSRIL][Line=%1] Service=%2 Error=%3" />        
        <string id="Event.Service_NoClient_Expect_This_Return_Error"     value="[MSRIL][Line=%1] Service=%2 No client is expecting this return. (TransactionId=%3)" />
        <string id="Event.Service_NoClient_Expect_This_Response_Error"   value="[MSRIL][Line=%1] Service=%2 No client is expecting this response. (UsersContext=%3)" />
        <string id="Event.Service_UnexpectedPacket_Error"                value="[MSRIL][Line=%1] Service=%2 Error: Unexpected packet. Packet=%3 " />        
        <string id="Event.Service_Handshaking_Error"                     value="[MSRIL][Line=%1] Service=%2 Error: Handshaking failed" />
        <string id="Event.Service_Invalid_Packet_Size_Error"             value="[MSRIL][Line=%1] Service=%2 Error: Invalid response packet size. Packet=%3 " />
        <string id="Event.Service_Invalid_GUID_Error"                    value="[MSRIL][Line=%1] Service=%2 Error: Invalid GUID. Packet=%3 " />        
        
        <string id="Event.Service_Invalid_Request_Warning"               value="[MSRIL][Line=%1] Service=%2 Warning: Write request comes in invalid state=%3" />
        <string id="Event.Service_RIL_Result_Warning"                    value="[MSRIL][Line=%1] Service=%2 Warning: RIL_RESULT_ERROR/Error=%3, Client=%4, UsersContext=%5, TransactionID=%6" />
        <string id="Event.Service_NewMaxResponseTime_Warning"            value="[MSRIL][Line=%1] Service=%2 New Max ResponseTime=%3 ms: Client=0x%4, UsersContext=%5, TransactionID=%6" />
        <string id="Event.Service_LongResponseTime_Warning"              value="[MSRIL][Line=%1] Service=%2 Request packet is responded after %3 ms: Client=0x%4, UsersContext=%5, TransactionID=%6" />
        <string id="Event.Service_NewMaxReturnTime_Warning"              value="[MSRIL][Line=%1] Service=%2 New Max ReturnTime=%3 ms: Client=0x%4, WdfRequest=%5, TransactionID=%6" />
        <string id="Event.Service_LongReturnTime_Warning"                value="[MSRIL][Line=%1] Service=%2 Request packet is returned after %3 ms: Client=0x%4, WdfRequest=%5, TransactionID=%6" />
        <string id="Event.Service_Response_ForDeadClient_Warning"        value="[MSRIL][Line=%1] Service=%2 Response for a dead client. (TransactionId=%3)" />
        <string id="Event.Service_Breaking_Pipe_Warning"                 value="[MSRIL][Line=%1] Service=%2 Breaking Pipe." /> 
        <string id="Event.Service_Pipe_Broken_Warning"                   value="[MSRIL][Line=%1] Service=%2 Pipe is broken." />

        <string id="Event.Service_State_Trace"                           value="[MSRIL][Line=%1] Service=%2 State=%3" />
        <string id="Event.Service_Client_CleanUp_Trace"                  value="[MSRIL][Line=%1] Service=%2 Client=%3 Client is closing. Set it NULL for (UsersContext=%4) and (TransactionId=%5)" />     
        <string id="Event.Service_Finalize_Trace"                        value="[MSRIL][Line=%1] Service=%2 Service is finalizing PendingRequestCount=%3" />        
        <string id="Event.Service_State_Transit"                         value="[MSRIL][Line=%1] Service=%2 Change State=%3 to %4" />
        <string id="Event.Service_Command_Trace"                         value="[MSRIL][Line=%1] Service=%2 Command packet: Client=%3, UsersContext=%4, TransactionID=%5, CommandID=%6" />
        
        <string id="Event.Service_Packet_Verbose"                        value="[MSRIL][Line=%1] Service=%2 Packet=%3" />
        <string id="Event.Service_DataOnly_Verbose"                      value="[MSRIL][Line=%1] Service=%2" />

        <!-- ACL -->
        <string id="Event.ACL_Capability"                                value="[ACL] MSRilFileCreate: GetClientCapabilities returns=%1" />
        <string id="Event.ACL_Capability_With_ClientData"                value="[ACL] MSRilFileCreate:[Line=%1] Client=%2 GetClientCapabilities returns=%3" />
        
        <string id="Event.ACL_Command_Denied"                            value="[ACL] MSRilWrite: Command[%1=%2] is not allowed due to ACL Capability[=%3]" />
        <string id="Event.ACL_Notification_Blocked"                      value="[ACL] ClientQueuePacketSync: Notification[%1=%2] is blocked due to ACL Capability[=%3]" />

        <!-- Don't use this for product -->
        <string id="Event.GeneralTempDebuggingMessage"                   value="[Line=%1] DebugMessage=%2" />
                
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
