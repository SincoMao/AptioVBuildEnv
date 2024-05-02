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
      <provider name="Microsoft-WindowsPhone-Net-Qualcomm-WmRil"
          guid="{3EAC74CB-EEAF-49A9-BE3A-906188621192}"
          symbol="MICROSOFT_WINDOWSPHONE_NET_QUALCOMM_WMRIL"
          messageFileName="Microsoft-WindowsPhone-Net-Qualcomm-WmRil-res.dll"
          resourceFileName="Microsoft-WindowsPhone-Net-Qualcomm-WmRil-res.dll">

        <channels />

        <levels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Tracing" message="$(string.Keyword.Tracing)" />
        </keywords>

        <!-- These are based on our original zone concept, but feel free to extend -->
        <tasks>
          <task value="1" name="TaskDriver" />
          <task value="2" name="TaskMemory" />
          <task value="3" name="TaskDms" />
          <task value="4" name="TaskUim" />
          <task value="5" name="TaskNetwork" />
          <task value="6" name="TaskCall" />
          <task value="7" name="TaskSupsvc" />
          <task value="8" name="TaskPhonebook" />
          <task value="9" name="TaskCat" />
          <task value="10" name="TaskSms" />
          <task value="11" name="TaskApperso" />
          <task value="12" name="TaskSar" />
          <task value="13" name="TaskIms" />
          <task value="14" name="TaskMisc" />
        </tasks>

        <opcodes />

        <maps>
          <bitMap name="RIL_SYSTEMTYPE">
            <map value="0x0" message="$(string.RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_NONE)"/>
            <map value="0x1" message="$(string.RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_1XRTT)"/>
            <map value="0x2" message="$(string.RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_EVDO)"/>
            <map value="0x4" message="$(string.RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_GSM)"/>
            <map value="0x8" message="$(string.RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_UMTS)"/>
            <map value="0x10" message="$(string.RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_LTE)"/>
            <map value="0x20" message="$(string.RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_TDSCDMA)"/>
          </bitMap>

          <valueMap name="RIL_HRESULT">
            <map value="0x81000001" message="$(string.RIL_RESULT.RIL_E_PHONEFAILURE)" />
            <map value="0x81000002" message="$(string.RIL_RESULT.RIL_E_NOCONNECTION)" />
            <map value="0x81000003" message="$(string.RIL_RESULT.RIL_E_LINKRESERVED)" />
            <map value="0x81000004" message="$(string.RIL_RESULT.RIL_E_OPNOTALLOWED)" />
            <map value="0x81000005" message="$(string.RIL_RESULT.RIL_E_OPNOTSUPPORTED)" />
            <map value="0x81000006" message="$(string.RIL_RESULT.RIL_E_UICCNOTINSERTED)" />
            <map value="0x81000007" message="$(string.RIL_RESULT.RIL_E_UICCFAILURE)" />
            <map value="0x81000008" message="$(string.RIL_RESULT.RIL_E_UICCBUSY)" />
            <map value="0x81000009" message="$(string.RIL_RESULT.RIL_E_UICCWRONG)" />
            <map value="0x8100000a" message="$(string.RIL_RESULT.RIL_E_INCORRECTPASSWORD)" />
            <map value="0x8100000b" message="$(string.RIL_RESULT.RIL_E_MEMORYFULL)" />
            <map value="0x8100000c" message="$(string.RIL_RESULT.RIL_E_INVALIDINDEX)" />
            <map value="0x8100000d" message="$(string.RIL_RESULT.RIL_E_NOTFOUND)" />
            <map value="0x8100000e" message="$(string.RIL_RESULT.RIL_E_MEMORYFAILURE)" />
            <map value="0x8100000f" message="$(string.RIL_RESULT.RIL_E_TEXTSTRINGTOOLONG)" />
            <map value="0x81000010" message="$(string.RIL_RESULT.RIL_E_INVALIDTEXTSTRING)" />
            <map value="0x81000011" message="$(string.RIL_RESULT.RIL_E_DIALSTRINGTOOLONG)" />
            <map value="0x81000012" message="$(string.RIL_RESULT.RIL_E_INVALIDDIALSTRING)" />
            <map value="0x81000013" message="$(string.RIL_RESULT.RIL_E_NONETWORKSVC)" />
            <map value="0x81000014" message="$(string.RIL_RESULT.RIL_E_NETWORKTIMEOUT)" />
            <map value="0x81000015" message="$(string.RIL_RESULT.RIL_E_EMERGENCYONLY)" />
            <map value="0x81000016" message="$(string.RIL_RESULT.RIL_E_TELEMATICIWUNSUPPORTED)" />
            <map value="0x81000017" message="$(string.RIL_RESULT.RIL_E_SMTYPE0UNSUPPORTED)" />
            <map value="0x81000018" message="$(string.RIL_RESULT.RIL_E_CANTREPLACEMSG)" />
            <map value="0x81000019" message="$(string.RIL_RESULT.RIL_E_PROTOCOLIDERROR)" />
            <map value="0x8100001a" message="$(string.RIL_RESULT.RIL_E_DCSUNSUPPORTED)" />
            <map value="0x8100001b" message="$(string.RIL_RESULT.RIL_E_MSGCLASSUNSUPPORTED)" />
            <map value="0x8100001c" message="$(string.RIL_RESULT.RIL_E_DCSERROR)" />
            <map value="0x8100001d" message="$(string.RIL_RESULT.RIL_E_CMDCANTBEACTIONED)" />
            <map value="0x8100001e" message="$(string.RIL_RESULT.RIL_E_CMDUNSUPPORTED)" />
            <map value="0x8100001f" message="$(string.RIL_RESULT.RIL_E_CMDERROR)" />
            <map value="0x81000020" message="$(string.RIL_RESULT.RIL_E_MSGBODYHEADERERROR)" />
            <map value="0x81000021" message="$(string.RIL_RESULT.RIL_E_SCBUSY)" />
            <map value="0x81000022" message="$(string.RIL_RESULT.RIL_E_NOSCSUBSCRIPTION)" />
            <map value="0x81000023" message="$(string.RIL_RESULT.RIL_E_SCSYSTEMFAILURE)" />
            <map value="0x81000024" message="$(string.RIL_RESULT.RIL_E_INVALIDADDRESS)" />
            <map value="0x81000025" message="$(string.RIL_RESULT.RIL_E_DESTINATIONBARRED)" />
            <map value="0x81000026" message="$(string.RIL_RESULT.RIL_E_REJECTEDDUPLICATE)" />
            <map value="0x81000027" message="$(string.RIL_RESULT.RIL_E_VPFUNSUPPORTED)" />
            <map value="0x81000028" message="$(string.RIL_RESULT.RIL_E_VPUNSUPPORTED)" />
            <map value="0x81000029" message="$(string.RIL_RESULT.RIL_E_UICCMSGSTORAGEFULL)" />
            <map value="0x8100002a" message="$(string.RIL_RESULT.RIL_E_NOUICCMSGSTORAGE)" />
            <map value="0x8100002b" message="$(string.RIL_RESULT.RIL_E_UICCTOOLKITBUSY)" />
            <map value="0x8100002c" message="$(string.RIL_RESULT.RIL_E_UICCDOWNLOADERROR)" />
            <map value="0x8100002d" message="$(string.RIL_RESULT.RIL_E_MSGSVCRESERVED)" />
            <map value="0x8100002e" message="$(string.RIL_RESULT.RIL_E_INVALIDMSGPARAM)" />
            <map value="0x8100002f" message="$(string.RIL_RESULT.RIL_E_INVALIDSCADDRESS)" />
            <map value="0x81000030" message="$(string.RIL_RESULT.RIL_E_UNASSIGNEDNUMBER)" />
            <map value="0x81000031" message="$(string.RIL_RESULT.RIL_E_MSGBARREDBYOPERATOR)" />
            <map value="0x81000032" message="$(string.RIL_RESULT.RIL_E_MSGCALLBARRED)" />
            <map value="0x81000033" message="$(string.RIL_RESULT.RIL_E_MSGXFERREJECTED)" />
            <map value="0x81000034" message="$(string.RIL_RESULT.RIL_E_DESTINATIONOUTOFSVC)" />
            <map value="0x81000035" message="$(string.RIL_RESULT.RIL_E_UNIDENTIFIEDSUBCRIBER)" />
            <map value="0x81000036" message="$(string.RIL_RESULT.RIL_E_SVCUNSUPPORTED)" />
            <map value="0x81000037" message="$(string.RIL_RESULT.RIL_E_UNKNOWNSUBSCRIBER)" />
            <map value="0x81000038" message="$(string.RIL_RESULT.RIL_E_NETWKOUTOFORDER)" />
            <map value="0x81000039" message="$(string.RIL_RESULT.RIL_E_NETWKTEMPFAILURE)" />
            <map value="0x8100003a" message="$(string.RIL_RESULT.RIL_E_CONGESTION)" />
            <map value="0x8100003b" message="$(string.RIL_RESULT.RIL_E_RESOURCESUNAVAILABLE)" />
            <map value="0x8100003c" message="$(string.RIL_RESULT.RIL_E_SVCNOTSUBSCRIBED)" />
            <map value="0x8100003d" message="$(string.RIL_RESULT.RIL_E_SVCNOTIMPLEMENTED)" />
            <map value="0x8100003e" message="$(string.RIL_RESULT.RIL_E_INVALIDMSGREFERENCE)" />
            <map value="0x8100003f" message="$(string.RIL_RESULT.RIL_E_INVALIDMSG)" />
            <map value="0x81000040" message="$(string.RIL_RESULT.RIL_E_INVALIDMANDATORYINFO)" />
            <map value="0x81000041" message="$(string.RIL_RESULT.RIL_E_MSGTYPEUNSUPPORTED)" />
            <map value="0x81000042" message="$(string.RIL_RESULT.RIL_E_ICOMPATIBLEMSG)" />
            <map value="0x81000043" message="$(string.RIL_RESULT.RIL_E_INFOELEMENTUNSUPPORTED)" />
            <map value="0x81000044" message="$(string.RIL_RESULT.RIL_E_PROTOCOLERROR)" />
            <map value="0x81000045" message="$(string.RIL_RESULT.RIL_E_NETWORKERROR)" />
            <map value="0x81000046" message="$(string.RIL_RESULT.RIL_E_MESSAGINGERROR)" />
            <map value="0x81000047" message="$(string.RIL_RESULT.RIL_E_NOTREADY)" />
            <map value="0x81000048" message="$(string.RIL_RESULT.RIL_E_TIMEDOUT)" />
            <map value="0x81000049" message="$(string.RIL_RESULT.RIL_E_CANCELLED)" />
            <map value="0x8100004a" message="$(string.RIL_RESULT.RIL_E_NONOTIFYCALLBACK)" />
            <map value="0x8100004b" message="$(string.RIL_RESULT.RIL_E_OPFMTUNAVAILABLE)" />
            <map value="0x8100004c" message="$(string.RIL_RESULT.RIL_E_NORESPONSETODIAL)" />
            <map value="0x8100004d" message="$(string.RIL_RESULT.RIL_E_SECURITYFAILURE)" />
            <map value="0x8100004e" message="$(string.RIL_RESULT.RIL_E_RADIOFAILEDINIT)" />
            <map value="0x8100004f" message="$(string.RIL_RESULT.RIL_E_DRIVERINITFAILED)" />
            <map value="0x81000050" message="$(string.RIL_RESULT.RIL_E_RADIONOTPRESENT)" />
            <map value="0x81000051" message="$(string.RIL_RESULT.RIL_E_RADIOOFF)" />
            <map value="0x81000052" message="$(string.RIL_RESULT.RIL_E_ILLEGALMS)" />
            <map value="0x81000053" message="$(string.RIL_RESULT.RIL_E_ILLEGALME)" />
            <map value="0x81000054" message="$(string.RIL_RESULT.RIL_E_GPRSSERVICENOTALLOWED)" />
            <map value="0x81000055" message="$(string.RIL_RESULT.RIL_E_PLMNNOTALLOWED)" />
            <map value="0x81000056" message="$(string.RIL_RESULT.RIL_E_LOCATIONAREANOTALLOWED)" />
            <map value="0x81000057" message="$(string.RIL_RESULT.RIL_E_ROAMINGNOTALLOWEDINTHISLOCATIONAREA)" />
            <map value="0x81000058" message="$(string.RIL_RESULT.RIL_E_SERVICEOPTIONNOTSUPPORTED)" />
            <map value="0x81000059" message="$(string.RIL_RESULT.RIL_E_REQUESTEDSERVICEOPTIONNOTSUBSCRIBED)" />
            <map value="0x8100005a" message="$(string.RIL_RESULT.RIL_E_SERVICEOPTIONTEMPORARILYOUTOFORDER)" />
            <map value="0x8100005b" message="$(string.RIL_RESULT.RIL_E_PDPAUTHENTICATIONFAILURE)" />
            <map value="0x8100005c" message="$(string.RIL_RESULT.RIL_E_INVALIDMOBILECLASS)" />
            <map value="0x8100005d" message="$(string.RIL_RESULT.RIL_E_UNSPECIFIEDGPRSERROR)" />
            <map value="0x8100005e" message="$(string.RIL_RESULT.RIL_E_RADIOREBOOTED)" />
            <map value="0x8100005f" message="$(string.RIL_RESULT.RIL_E_INVALIDCONTEXTSTATE)" />
            <map value="0x81000060" message="$(string.RIL_RESULT.RIL_E_MAXCONTEXTS)" />
            <map value="0x81000061" message="$(string.RIL_RESULT.RIL_E_SYNCHRONOUS_DATA_UNAVAILABLE)" />
            <map value="0x81000062" message="$(string.RIL_RESULT.RIL_E_FDNRESTRICT)" />
            <map value="0x81000063" message="$(string.RIL_RESULT.RIL_E_INVALIDASYNCCOMMANDRESPONSE)" />
            <map value="0x81000064" message="$(string.RIL_RESULT.RIL_E_INCOMPATIBLEPROXYDRIVER)" />
            <map value="0x81000065" message="$(string.RIL_RESULT.RIL_E_INVALIDDRIVERVERSION)" />
            <map value="0x81000066" message="$(string.RIL_RESULT.RIL_E_USIMCALLMODIFIED)" />
            <map value="0x81000067" message="$(string.RIL_RESULT.RIL_E_PASSWORDMISMATCH)" />
            <map value="0x81000068" message="$(string.RIL_RESULT.RIL_E_INVALIDCONTEXTACTIVATIONSTRING)" />
            <map value="0x81000069" message="$(string.RIL_RESULT.RIL_E_UICCAPPINACCESSIBLE)" />
            <map value="0x8100006a" message="$(string.RIL_RESULT.RIL_E_UICCPINREQUIRED)" />
            <map value="0x8100006b" message="$(string.RIL_RESULT.RIL_E_UICCPUKREQUIRED)" />
            <map value="0x8100006c" message="$(string.RIL_RESULT.RIL_E_UICCPUKBLOCKED)" />
            <map value="0x8100006d" message="$(string.RIL_RESULT.RIL_E_EXECUTORNOTREADY)" />
            <map value="0x8100006e" message="$(string.RIL_RESULT.RIL_E_INVALIDUICCKEYREF)" />
            <map value="0x8100006f" message="$(string.RIL_RESULT.RIL_E_UICCINACTIVE)" />
            <map value="0x81000070" message="$(string.RIL_RESULT.RIL_E_PERSOPUKREQUIRED)" />
            <map value="0x81000071" message="$(string.RIL_RESULT.RIL_E_PERSOPUKBLOCKED)" />
            <map value="0x81000072" message="$(string.RIL_RESULT.RIL_E_PERSOCHECKFAILED)" />
            <map value="0x81000073" message="$(string.RIL_RESULT.RIL_E_INVALIDUICCPATH)" />
            <map value="0x81000074" message="$(string.RIL_RESULT.RIL_E_IMSTEMPFAILURE)" />
            <map value="0x81000075" message="$(string.RIL_RESULT.RIL_E_UICCNOTREADY)" />
            <map value="0x81000076" message="$(string.RIL_RESULT.RIL_E_UICCPOWEROFF)" />
            <map value="0x81000077" message="$(string.RIL_RESULT.RIL_E_CALLISACTIVE)" />
            <map value="0x81000078" message="$(string.RIL_RESULT.RIL_E_USIMCALLBLOCKED)" />
            <map value="0x81000079" message="$(string.RIL_RESULT.RIL_E_UICCADMRESTRICTED)" />
            <map value="0x8100007a" message="$(string.RIL_RESULT.RIL_E_DMSERVICENOTREADY)" />
            <map value="0x8100007b" message="$(string.RIL_RESULT.RIL_E_DMGETCONFIGFAILED)" />
            <map value="0x8100007c" message="$(string.RIL_RESULT.RIL_E_DMCOMMITFAILED)" />
          </valueMap>

          <valueMap name="RIL_Notification">
            <map value="0x10000100" message="$(string.RIL_Notification.RADIOEQUIPMENTSTATECHANGED)" />
            <map value="0x10000101" message="$(string.RIL_Notification.RADIOPRESENCECHANGED)" />
            <map value="0x10000102" message="$(string.RIL_Notification.UICCFILE_DATACHANGE)" />
            <map value="0x10000103" message="$(string.RIL_Notification.UICCAPP_DATACHANGE)" />
            <map value="0x10000104" message="$(string.RIL_Notification.SLOTINFOCHANGED)" />
            <map value="0x10000105" message="$(string.RIL_Notification.CARDAPPREMOVED)" />
            <map value="0x10000106" message="$(string.RIL_Notification.CARDAPPADDED)" />
            <map value="0x10000107" message="$(string.RIL_Notification.UICCLOCKSTATUS)" />
            <map value="0x10000108" message="$(string.RIL_Notification.UICCAPPPERSOCHECKSTATUS)" />
            <map value="0x10000109" message="$(string.RIL_Notification.PHONEBOOKENTRYDELETED)" />
            <map value="0x1000010a" message="$(string.RIL_Notification.PHONEBOOKENTRYSTORED)" />
            <map value="0x1000010b" message="$(string.RIL_Notification.PHONEBOOKREADYSTATE)" />
            <map value="0x1000010c" message="$(string.RIL_Notification.EMERGENCYNUMBERLISTCHANGED)" />
            <map value="0x1000010d" message="$(string.RIL_Notification.REGSTATUSCHANGED)" />
            <map value="0x1000010e" message="$(string.RIL_Notification.LOCATIONUPDATE)" />
            <map value="0x1000010f" message="$(string.RIL_Notification.NETWORKCODECHANGED)" />
            <map value="0x10000110" message="$(string.RIL_Notification.PROVISION_STATUS)" />
            <map value="0x10000111" message="$(string.RIL_Notification.SYSTEMPREFSCHANGED)" />
            <map value="0x10000112" message="$(string.RIL_Notification.EXECUTORSTATE)" />
            <map value="0x10000113" message="$(string.RIL_Notification.MANAGED_ROAMING)" />
            <map value="0x10000114" message="$(string.RIL_Notification.SIGNALQUALITY)" />
            <map value="0x10000115" message="$(string.RIL_Notification.NITZ)" />
            <map value="0x10000116" message="$(string.RIL_Notification.UICCTOOLKITCMD)" />
            <map value="0x10000117" message="$(string.RIL_Notification.CALLMODIFICATIONINFO)" />
            <map value="0x10000118" message="$(string.RIL_Notification.CALLPROGRESSINFO)" />
            <map value="0x10000119" message="$(string.RIL_Notification.EMERGENCYMODEENTERED)" />
            <map value="0x1000011a" message="$(string.RIL_Notification.EMERGENCYMODEEXITED)" />
            <map value="0x1000011b" message="$(string.RIL_Notification.CALLWAITING)" />
            <map value="0x1000011c" message="$(string.RIL_Notification.DIALEDID)" />
            <map value="0x1000011d" message="$(string.RIL_Notification.DISPLAY)" />
            <map value="0x1000011e" message="$(string.RIL_Notification.SUPSVCINFO)" />
            <map value="0x1000011f" message="$(string.RIL_Notification.SUPSERVICEDATA)" />
            <map value="0x10000120" message="$(string.RIL_Notification.UNSOLICITEDSS)" />
            <map value="0x10000121" message="$(string.RIL_Notification.LINECONTROL)" />
            <map value="0x10000122" message="$(string.RIL_Notification.MESSAGE)" />
            <map value="0x10000123" message="$(string.RIL_Notification.MESSAGE_IN_UICC)" />
            <map value="0x10000124" message="$(string.RIL_Notification.IMSSTATUS)" />
            <map value="0x10000125" message="$(string.RIL_Notification.ADDITIONALNUMBERSTRINGUPDATED)" />
            <map value="0x10000126" message="$(string.RIL_Notification.SUPSERVICEDATATERMINATED)" />
            <map value="0x10000127" message="$(string.RIL_Notification.CLEARIDLEMODETEXT)" />
            <map value="0x10000128" message="$(string.RIL_Notification.MESSAGE_STORAGE_FULL)" />
            <map value="0x10000129" message="$(string.RIL_Notification.TONESIGNAL)" />
            <map value="0x1000012a" message="$(string.RIL_Notification.FORWARDSTARTDTMF)" />
            <map value="0x1000012b" message="$(string.RIL_Notification.FORWARDSTOPDTMF)" />
            <map value="0x1000012c" message="$(string.RIL_Notification.FORWARDBURSTDTMF)" />
            <map value="0x1000012D" message="$(string.RIL_Notification.EXECUTORFOCUSSTATECHANGED)" />
            <map value="0x1000012E" message="$(string.RIL_Notification.EXECUTORRFSTATE)" />
            <map value="0x1000012F" message="$(string.RIL_Notification.MODEMRESET)" />
            <map value="0x10000130" message="$(string.RIL_Notification.RADIOCONFIGURATION)" />
            <map value="0x10000131" message="$(string.RIL_Notification.IMSHANDOVERATTEMPT)" />
          </valueMap>

          <valueMap name="QmiMessage">
            <map value="0x00000000" message="$(string.QmiMessage.QMI_DMS_RESET)" />
            <map value="0x00000001" message="$(string.QmiMessage.QMI_DMS_SET_EVENT_REPORT)" />
            <map value="0x00000020" message="$(string.QmiMessage.QMI_DMS_GET_DEVICE_CAP)" />
            <map value="0x00000021" message="$(string.QmiMessage.QMI_DMS_GET_DEVICE_MFR)" />
            <map value="0x00000022" message="$(string.QmiMessage.QMI_DMS_GET_DEVICE_MODEL_ID)" />
            <map value="0x00000023" message="$(string.QmiMessage.QMI_DMS_GET_DEVICE_REV_ID)" />
            <map value="0x00000024" message="$(string.QmiMessage.QMI_DMS_GET_MSISDN)" />
            <map value="0x00000025" message="$(string.QmiMessage.QMI_DMS_GET_DEVICE_SERIAL_NUMBERS)" />
            <map value="0x00000026" message="$(string.QmiMessage.QMI_DMS_GET_POWER_STATE)" />
            <map value="0x00000027" message="$(string.QmiMessage.QMI_DMS_UIM_SET_PIN_PROTECTION)" />
            <map value="0x00000028" message="$(string.QmiMessage.QMI_DMS_UIM_VERIFY_PIN)" />
            <map value="0x00000029" message="$(string.QmiMessage.QMI_DMS_UIM_UNBLOCK_PIN)" />
            <map value="0x0000002A" message="$(string.QmiMessage.QMI_DMS_UIM_CHANGE_PIN)" />
            <map value="0x0000002B" message="$(string.QmiMessage.QMI_DMS_UIM_GET_PIN_STATUS)" />
            <map value="0x0000002C" message="$(string.QmiMessage.QMI_DMS_GET_DEVICE_HARDWARE_REV)" />
            <map value="0x0000002D" message="$(string.QmiMessage.QMI_DMS_GET_OPERATING_MODE)" />
            <map value="0x0000002E" message="$(string.QmiMessage.QMI_DMS_SET_OPERATING_MODE)" />
            <map value="0x0000002F" message="$(string.QmiMessage.QMI_DMS_GET_TIME)" />
            <map value="0x00000030" message="$(string.QmiMessage.QMI_DMS_GET_PRL_VER)" />
            <map value="0x00000031" message="$(string.QmiMessage.QMI_DMS_GET_ACTIVATION_STATE)" />
            <map value="0x00000032" message="$(string.QmiMessage.QMI_DMS_ACTIVATE_AUTOMATIC)" />
            <map value="0x00000033" message="$(string.QmiMessage.QMI_DMS_ACTIVATE_MANUAL)" />
            <map value="0x00000034" message="$(string.QmiMessage.QMI_DMS_GET_USER_LOCK_STATE)" />
            <map value="0x00000035" message="$(string.QmiMessage.QMI_DMS_SET_USER_LOCK_STATE)" />
            <map value="0x00000036" message="$(string.QmiMessage.QMI_DMS_SET_USER_LOCK_CODE)" />
            <map value="0x00000037" message="$(string.QmiMessage.QMI_DMS_READ_USER_DATA)" />
            <map value="0x00000038" message="$(string.QmiMessage.QMI_DMS_WRITE_USER_DATA)" />
            <map value="0x00000039" message="$(string.QmiMessage.QMI_DMS_READ_ERI_FILE)" />
            <map value="0x0000003A" message="$(string.QmiMessage.QMI_DMS_RESTORE_FACTORY_DEFAULTS)" />
            <map value="0x0000003B" message="$(string.QmiMessage.QMI_DMS_VALIDATE_SERVICE_PROGRAMMING_CODE)" />
            <map value="0x0000003C" message="$(string.QmiMessage.QMI_DMS_UIM_GET_ICCID)" />
            <map value="0x00000040" message="$(string.QmiMessage.QMI_DMS_UIM_GET_CK_STATUS)" />
            <map value="0x00000041" message="$(string.QmiMessage.QMI_DMS_UIM_SET_CK_PROTECTION)" />
            <map value="0x00000042" message="$(string.QmiMessage.QMI_DMS_UIM_UNBLOCK_CK)" />
            <map value="0x00000043" message="$(string.QmiMessage.QMI_DMS_UIM_GET_IMSI)" />
            <map value="0x00000044" message="$(string.QmiMessage.QMI_DMS_UIM_GET_STATE)" />
            <map value="0x00000045" message="$(string.QmiMessage.QMI_DMS_GET_BAND_CAPABILITY)" />
            <map value="0x00000046" message="$(string.QmiMessage.QMI_DMS_GET_FACTORY_SKU)" />
            <map value="0x0000004B" message="$(string.QmiMessage.QMI_DMS_SET_TIME)" />
            <map value="0x0000004D" message="$(string.QmiMessage.QMI_DMS_GET_ALT_NET_CONFIG)" />
            <map value="0x0000004E" message="$(string.QmiMessage.QMI_DMS_SET_ALT_NET_CONFIG)" />
            <map value="0x00000051" message="$(string.QmiMessage.QMI_DMS_GET_SW_VERSION)" />
            <map value="0x00000052" message="$(string.QmiMessage.QMI_DMS_SET_SPC)" />
            <map value="0x00000053" message="$(string.QmiMessage.QMI_DMS_GET_CURRENT_PRL_INFO)" />

            <map value="0x01000000" message="$(string.QmiMessage.QMI_NAS_RESET)" />
            <map value="0x01000001" message="$(string.QmiMessage.QMI_NAS_ABORT)" />
            <map value="0x01000002" message="$(string.QmiMessage.QMI_NAS_SET_EVENT_REPORT)" />
            <map value="0x01000003" message="$(string.QmiMessage.QMI_NAS_INDICATION_REGISTER)" />
            <map value="0x01000020" message="$(string.QmiMessage.QMI_NAS_GET_SIGNAL_STRENGTH)" />
            <map value="0x01000021" message="$(string.QmiMessage.QMI_NAS_PERFORM_NETWORK_SCAN)" />
            <map value="0x01000022" message="$(string.QmiMessage.QMI_NAS_INITIATE_NETWORK_REGISTER)" />
            <map value="0x01000023" message="$(string.QmiMessage.QMI_NAS_INITIATE_ATTACH)" />
            <map value="0x01000024" message="$(string.QmiMessage.QMI_NAS_GET_SERVING_SYSTEM)" />
            <map value="0x01000025" message="$(string.QmiMessage.QMI_NAS_GET_HOME_NETWORK)" />
            <map value="0x01000026" message="$(string.QmiMessage.QMI_NAS_GET_PREFERRED_NETWORKS)" />
            <map value="0x01000027" message="$(string.QmiMessage.QMI_NAS_SET_PREFERRED_NETWORKS)" />
            <map value="0x01000028" message="$(string.QmiMessage.QMI_NAS_GET_FORBIDDEN_NETWORKS)" />
            <map value="0x01000029" message="$(string.QmiMessage.QMI_NAS_SET_FORBIDDEN_NETWORKS)" />
            <map value="0x0100002A" message="$(string.QmiMessage.QMI_NAS_SET_TECHNOLOGY_PREFERENCE)" />
            <map value="0x0100002B" message="$(string.QmiMessage.QMI_NAS_GET_TECHNOLOGY_PREFERENCE)" />
            <map value="0x0100002C" message="$(string.QmiMessage.QMI_NAS_GET_ACCOLC)" />
            <map value="0x0100002D" message="$(string.QmiMessage.QMI_NAS_SET_ACCOLC)" />
            <map value="0x0100002E" message="$(string.QmiMessage.QMI_NAS_GET_NETWORK_SYSTEM_PREFERENCE_)" />
            <map value="0x0100002F" message="$(string.QmiMessage.QMI_NAS_GET_DEVICE_CONFIG)" />
            <map value="0x01000030" message="$(string.QmiMessage.QMI_NAS_SET_DEVICE_CONFIG)" />
            <map value="0x01000031" message="$(string.QmiMessage.QMI_NAS_GET_RF_BAND_INFO)" />
            <map value="0x01000032" message="$(string.QmiMessage.QMI_NAS_GET_AN_AAA_STATUS)" />
            <map value="0x01000033" message="$(string.QmiMessage.QMI_NAS_SET_SYSTEM_SELECTION_PREFERENCE)" />
            <map value="0x01000034" message="$(string.QmiMessage.QMI_NAS_GET_SYSTEM_SELECTION_PREFERENCE)" />
            <map value="0x01000037" message="$(string.QmiMessage.QMI_NAS_SET_DDTM_PREFERENCE)" />
            <map value="0x01000038" message="$(string.QmiMessage.QMI_NAS_DDTM)" />
            <map value="0x01000039" message="$(string.QmiMessage.QMI_NAS_GET_OPERATOR_NAME_DATA)" />
            <map value="0x0100003A" message="$(string.QmiMessage.QMI_NAS_OPERATOR_NAME_DATA)" />
            <map value="0x0100003B" message="$(string.QmiMessage.QMI_NAS_GET_CSP_PLMN_MODE_BIT)" />
            <map value="0x0100003C" message="$(string.QmiMessage.QMI_NAS_CSP_PLMN_MODE_BIT)" />
            <map value="0x0100003D" message="$(string.QmiMessage.QMI_NAS_UPDATE_AKEY)" />
            <map value="0x0100003E" message="$(string.QmiMessage.QMI_NAS_GET_3GPP2_SUBSCRIPTION_INFO)" />
            <map value="0x0100003F" message="$(string.QmiMessage.QMI_NAS_SET_3GPP2_SUBSCRIPTION_INFO)" />
            <map value="0x01000040" message="$(string.QmiMessage.QMI_NAS_GET_MOB_CAI_REV)" />
            <map value="0x01000041" message="$(string.QmiMessage.QMI_NAS_GET_RTRE_CONFIG)" />
            <map value="0x01000042" message="$(string.QmiMessage.QMI_NAS_SET_RTRE_CONFIG)" />
            <map value="0x01000043" message="$(string.QmiMessage.QMI_NAS_GET_CELL_LOCATION_INFO)" />
            <map value="0x01000044" message="$(string.QmiMessage.QMI_NAS_GET_PLMN_NAME)" />
            <map value="0x01000045" message="$(string.QmiMessage.QMI_NAS_BIND_SUBSCRIPTION)" />
            <map value="0x01000046" message="$(string.QmiMessage.QMI_NAS_MANAGED_ROAMING)" />
            <map value="0x01000047" message="$(string.QmiMessage.QMI_NAS_DUAL_STANDBY_PREF_IND)" />
            <map value="0x01000048" message="$(string.QmiMessage.QMI_NAS_SUBSCRIPTION_INFO)" />
            <map value="0x01000049" message="$(string.QmiMessage.QMI_NAS_GET_MODE_PREF)" />
            <map value="0x0100004B" message="$(string.QmiMessage.QMI_NAS_DUAL_STANDBY_PREF)" />
            <map value="0x0100004C" message="$(string.QmiMessage.QMI_NAS_NETWORK_TIME)" />
            <map value="0x0100004D" message="$(string.QmiMessage.QMI_NAS_GET_SYS_INFO)" />
            <map value="0x0100004E" message="$(string.QmiMessage.QMI_NAS_SYS_INFO)" />
            <map value="0x0100004F" message="$(string.QmiMessage.QMI_NAS_GET_SIG_INFO)" />
            <map value="0x01000050" message="$(string.QmiMessage.QMI_NAS_CONFIG_SIG_INFO)" />
            <map value="0x01000051" message="$(string.QmiMessage.QMI_NAS_SIG_INFO)" />
            <map value="0x01000052" message="$(string.QmiMessage.QMI_NAS_GET_ERR_RATE)" />
            <map value="0x01000053" message="$(string.QmiMessage.QMI_NAS_ERR_RATE)" />
            <map value="0x01000054" message="$(string.QmiMessage.QMI_NAS_HDR_SESSION_CLOSE)" />
            <map value="0x01000055" message="$(string.QmiMessage.QMI_NAS_HDR_UATI_UPDATE)" />
            <map value="0x01000056" message="$(string.QmiMessage.QMI_NAS_GET_HDR_SUBTYPE)" />
            <map value="0x01000057" message="$(string.QmiMessage.QMI_NAS_GET_HDR_COLOR_CODE)" />
            <map value="0x01000058" message="$(string.QmiMessage.QMI_NAS_GET_CURRENT_ACQ_SYS_MODE)" />
            <map value="0x01000059" message="$(string.QmiMessage.QMI_NAS_SET_RX_DIVERSITY)" />
            <map value="0x0100005A" message="$(string.QmiMessage.QMI_NAS_GET_TX_RX_INFO)" />
            <map value="0x0100005B" message="$(string.QmiMessage.QMI_NAS_UPDATE_AKEY_EXT)" />
            <map value="0x0100005C" message="$(string.QmiMessage.QMI_NAS_GET_DUAL_STANDBY_PREF)" />
            <map value="0x0100005D" message="$(string.QmiMessage.QMI_NAS_DETACH_LTE)" />
            <map value="0x0100005E" message="$(string.QmiMessage.QMI_NAS_BLOCK_LTE_PLMN)" />
            <map value="0x0100005F" message="$(string.QmiMessage.QMI_NAS_UNBLOCK_LTE_PLMN)" />
            <map value="0x01000060" message="$(string.QmiMessage.QMI_NAS_RESET_LTE_PLMN_BLOCKING)" />
            <map value="0x01000061" message="$(string.QmiMessage.QMI_NAS_CURRENT_PLMN_NAME)" />
            <map value="0x01000062" message="$(string.QmiMessage.QMI_NAS_CONFIG_EMBMS)" />
            <map value="0x01000063" message="$(string.QmiMessage.QMI_NAS_GET_EMBMS_STATUS)" />
            <map value="0x01000064" message="$(string.QmiMessage.QMI_NAS_EMBMS_STATUS)" />
            <map value="0x01000065" message="$(string.QmiMessage.QMI_NAS_GET_CDMA_POSITION_INFO)" />
            <map value="0x01000066" message="$(string.QmiMessage.QMI_NAS_RF_BAND_INFO)" />
            <map value="0x01000067" message="$(string.QmiMessage.QMI_NAS_FORCE_NETWORK_SEARCH)" />
            <map value="0x01000068" message="$(string.QmiMessage.QMI_NAS_NETWORK_REJECT)" />
            <map value="0x01000069" message="$(string.QmiMessage.QMI_NAS_GET_MANAGED_ROAMING_CONFIG)" />
            <map value="0x0100006A" message="$(string.QmiMessage.QMI_NAS_RTRE_CONFIG)" />

            <map value="0x02000000" message="$(string.QmiMessage.QMI_WMS_RESET)" />
            <map value="0x02000001" message="$(string.QmiMessage.QMI_WMS_SET_EVENT_REPORT)" />
            <map value="0x02000020" message="$(string.QmiMessage.QMI_WMS_RAW_SEND)" />
            <map value="0x02000021" message="$(string.QmiMessage.QMI_WMS_RAW_WRITE)" />
            <map value="0x02000022" message="$(string.QmiMessage.QMI_WMS_RAW_READ)" />
            <map value="0x02000023" message="$(string.QmiMessage.QMI_WMS_MODIFY_TAG)" />
            <map value="0x02000024" message="$(string.QmiMessage.QMI_WMS_DELETE)" />
            <map value="0x02000030" message="$(string.QmiMessage.QMI_WMS_GET_MESSAGE_PROTOCOL)" />
            <map value="0x02000031" message="$(string.QmiMessage.QMI_WMS_LIST_MESSAGES)" />
            <map value="0x02000032" message="$(string.QmiMessage.QMI_WMS_SET_ROUTES)" />
            <map value="0x02000033" message="$(string.QmiMessage.QMI_WMS_GET_ROUTES)" />
            <map value="0x02000034" message="$(string.QmiMessage.QMI_WMS_GET_SMSC_ADDRESS)" />
            <map value="0x02000035" message="$(string.QmiMessage.QMI_WMS_SET_SMSC_ADDRESS)" />
            <map value="0x02000036" message="$(string.QmiMessage.QMI_WMS_GET_STORE_MAX_SIZE)" />
            <map value="0x02000037" message="$(string.QmiMessage.QMI_WMS_SEND_ACK)" />
            <map value="0x02000038" message="$(string.QmiMessage.QMI_WMS_SET_RETRY_PERIOD)" />
            <map value="0x02000039" message="$(string.QmiMessage.QMI_WMS_SET_RETRY_INTERVAL)" />
            <map value="0x0200003A" message="$(string.QmiMessage.QMI_WMS_SET_DC_DISCONNECT_TIMER)" />
            <map value="0x0200003B" message="$(string.QmiMessage.QMI_WMS_SET_MEMORY_STATUS)" />
            <map value="0x0200003C" message="$(string.QmiMessage.QMI_WMS_SET_BROADCAST_ACTIVATION)" />
            <map value="0x0200003D" message="$(string.QmiMessage.QMI_WMS_SET_BROADCAST_CONFIG)" />
            <map value="0x0200003E" message="$(string.QmiMessage.QMI_WMS_GET_BROADCAST_CONFIG)" />
            <map value="0x0200003F" message="$(string.QmiMessage.QMI_WMS_MEMORY_FULL)" />
            <map value="0x02000040" message="$(string.QmiMessage.QMI_WMS_GET_DOMAIN_PREF)" />
            <map value="0x02000041" message="$(string.QmiMessage.QMI_WMS_SET_DOMAIN_PREF)" />
            <map value="0x02000042" message="$(string.QmiMessage.QMI_WMS_SEND_FROM_MEM_STORE)" />
            <map value="0x02000043" message="$(string.QmiMessage.QMI_WMS_GET_MESSAGE_WAITING)" />
            <map value="0x02000044" message="$(string.QmiMessage.QMI_WMS_MESSAGE_WAITING)" />
            <map value="0x02000045" message="$(string.QmiMessage.QMI_WMS_SET_PRIMARY_CLIENT)" />
            <map value="0x02000046" message="$(string.QmiMessage.QMI_WMS_SMSC_ADDRESS)" />
            <map value="0x02000047" message="$(string.QmiMessage.QMI_WMS_INDICATION_REGISTER)" />
            <map value="0x02000048" message="$(string.QmiMessage.QMI_WMS_GET_TRANSPORT_LAYER_INFO)" />
            <map value="0x02000049" message="$(string.QmiMessage.QMI_WMS_TRANSPORT_LAYER_INFO)" />
            <map value="0x0200004A" message="$(string.QmiMessage.QMI_WMS_GET_TRANSPORT_NW_REG_INFO)" />
            <map value="0x0200004B" message="$(string.QmiMessage.QMI_WMS_TRANSPORT_NW_REG_INFO)" />
            <map value="0x0200004C" message="$(string.QmiMessage.QMI_WMS_BIND_SUBSCRIPTION)" />
            <map value="0x0200004D" message="$(string.QmiMessage.QMI_WMS_GET_INDICATION_REGISTER)" />
            <map value="0x0200004E" message="$(string.QmiMessage.QMI_WMS_GET_SMS_PARAMETERS)" />
            <map value="0x0200004F" message="$(string.QmiMessage.QMI_WMS_SET_SMS_PARAMETERS)" />
            <map value="0x02000050" message="$(string.QmiMessage.QMI_WMS_CALL_STATUS)" />
            <map value="0x02000051" message="$(string.QmiMessage.QMI_WMS_GET_DOMAIN_PREF_CONFIG)" />
            <map value="0x02000052" message="$(string.QmiMessage.QMI_WMS_SET_DOMAIN_PREF_CONFIG)" />
            <map value="0x02000053" message="$(string.QmiMessage.QMI_WMS_GET_RETRY_PERIOD)" />
            <map value="0x02000054" message="$(string.QmiMessage.QMI_WMS_GET_RETRY_INTERVAL)" />
            <map value="0x02000055" message="$(string.QmiMessage.QMI_WMS_GET_DC_DISCONNECT_TIMER)" />
            <map value="0x02000056" message="$(string.QmiMessage.QMI_WMS_GET_MEMORY_STATUS)" />
            <map value="0x02000057" message="$(string.QmiMessage.QMI_WMS_GET_PRIMARY_CLIENT)" />
            <map value="0x02000058" message="$(string.QmiMessage.QMI_WMS_GET_SUBSCRIPTION_BINDING)" />

            <map value="0x03000003" message="$(string.QmiMessage.QMI_VOICE_INDICATION_REGISTER)" />
            <map value="0x03000020" message="$(string.QmiMessage.QMI_VOICE_DIAL_CALL)" />
            <map value="0x03000021" message="$(string.QmiMessage.QMI_VOICE_END_CALL)" />
            <map value="0x03000022" message="$(string.QmiMessage.QMI_VOICE_ANSWER_CALL)" />
            <map value="0x03000024" message="$(string.QmiMessage.QMI_VOICE_GET_CALL_INFO)" />
            <map value="0x03000025" message="$(string.QmiMessage.QMI_VOICE_OTASP_STATUS)" />
            <map value="0x03000026" message="$(string.QmiMessage.QMI_VOICE_INFO_REC)" />
            <map value="0x03000027" message="$(string.QmiMessage.QMI_VOICE_SEND_FLASH)" />
            <map value="0x03000028" message="$(string.QmiMessage.QMI_VOICE_BURST_DTMF)" />
            <map value="0x03000029" message="$(string.QmiMessage.QMI_VOICE_START_CONT_DTMF)" />
            <map value="0x0300002A" message="$(string.QmiMessage.QMI_VOICE_STOP_CONT_DTMF)" />
            <map value="0x0300002B" message="$(string.QmiMessage.QMI_VOICE_DTMF)" />
            <map value="0x0300002C" message="$(string.QmiMessage.QMI_VOICE_SET_PREFERRED_PRIVACY)" />
            <map value="0x0300002D" message="$(string.QmiMessage.QMI_VOICE_PRIVACY)" />
            <map value="0x0300002E" message="$(string.QmiMessage.QMI_VOICE_ALL_CALL_STATUS)" />
            <map value="0x0300002F" message="$(string.QmiMessage.QMI_VOICE_GET_ALL_CALL_INFO)" />
            <map value="0x03000031" message="$(string.QmiMessage.QMI_VOICE_MANAGE_CALLS)" />
            <map value="0x03000032" message="$(string.QmiMessage.QMI_VOICE_SUPS_NOTIFICATION)" />
            <map value="0x03000033" message="$(string.QmiMessage.QMI_VOICE_SET_SUPS_SERVICE)" />
            <map value="0x03000034" message="$(string.QmiMessage.QMI_VOICE_GET_CALL_WAITING)" />
            <map value="0x03000035" message="$(string.QmiMessage.QMI_VOICE_GET_CALL_BARRING)" />
            <map value="0x03000036" message="$(string.QmiMessage.QMI_VOICE_GET_CLIP)" />
            <map value="0x03000037" message="$(string.QmiMessage.QMI_VOICE_GET_CLIR)" />
            <map value="0x03000038" message="$(string.QmiMessage.QMI_VOICE_GET_CALL_FORWARDING)" />
            <map value="0x03000039" message="$(string.QmiMessage.QMI_VOICE_SET_CALL_BARRING_PASSWORD)" />
            <map value="0x0300003A" message="$(string.QmiMessage.QMI_VOICE_ORIG_USSD)" />
            <map value="0x0300003B" message="$(string.QmiMessage.QMI_VOICE_ANSWER_USSD)" />
            <map value="0x0300003C" message="$(string.QmiMessage.QMI_VOICE_CANCEL_USSD)" />
            <map value="0x0300003D" message="$(string.QmiMessage.QMI_VOICE_USSD_RELEASE)" />
            <map value="0x0300003E" message="$(string.QmiMessage.QMI_VOICE_USSD)" />
            <map value="0x0300003F" message="$(string.QmiMessage.QMI_VOICE_UUS)" />
            <map value="0x03000040" message="$(string.QmiMessage.QMI_VOICE_SET_CONFIG)" />
            <map value="0x03000041" message="$(string.QmiMessage.QMI_VOICE_GET_CONFIG)" />
            <map value="0x03000042" message="$(string.QmiMessage.QMI_VOICE_SUPS)" />
            <map value="0x03000043" message="$(string.QmiMessage.QMI_VOICE_ORIG_USSD_NO_WAIT)" />
            <map value="0x03000044" message="$(string.QmiMessage.QMI_VOICE_BIND_SUBSCRIPTION)" />
            <map value="0x03000045" message="$(string.QmiMessage.QMI_VOICE_ALS_SET_LINE_SWITCHING)" />
            <map value="0x03000046" message="$(string.QmiMessage.QMI_VOICE_ALS_SELECT_LINE)" />
            <map value="0x03000047" message="$(string.QmiMessage.QMI_VOICE_AOC_RESET_ACM)" />
            <map value="0x03000048" message="$(string.QmiMessage.QMI_VOICE_AOC_SET_ACMMAX)" />
            <map value="0x03000049" message="$(string.QmiMessage.QMI_VOICE_AOC_GET_CALL_METER_INFO)" />
            <map value="0x0300004A" message="$(string.QmiMessage.QMI_VOICE_AOC_LOW_FUNDS)" />
            <map value="0x0300004B" message="$(string.QmiMessage.QMI_VOICE_GET_COLP)" />
            <map value="0x0300004C" message="$(string.QmiMessage.QMI_VOICE_GET_COLR)" />
            <map value="0x0300004D" message="$(string.QmiMessage.QMI_VOICE_GET_CNAP)" />
            <map value="0x0300004E" message="$(string.QmiMessage.QMI_VOICE_MANAGE_IP_CALLS)" />
            <map value="0x0300004F" message="$(string.QmiMessage.QMI_VOICE_ALS_GET_LINE_SWITCHING_STATUS)" />
            <map value="0x03000050" message="$(string.QmiMessage.QMI_VOICE_ALS_GET_SELECTED_LINE)" />
            <map value="0x03000051" message="$(string.QmiMessage.QMI_VOICE_MODIFIED)" />
            <map value="0x03000052" message="$(string.QmiMessage.QMI_VOICE_MODIFY_ACCEPT)" />
            <map value="0x03000053" message="$(string.QmiMessage.QMI_VOICE_SPEECH_CODEC_INFO)" />
            <map value="0x03000054" message="$(string.QmiMessage.QMI_VOICE_HANDOVER)" />

            <map value="0x04000000" message="$(string.QmiMessage.QMI_CAT_RESET)" />
            <map value="0x04000001" message="$(string.QmiMessage.QMI_CAT_SET_EVENT_REPORT)" />
            <map value="0x04000020" message="$(string.QmiMessage.QMI_CAT_GET_SERVICE_STATE)" />
            <map value="0x04000021" message="$(string.QmiMessage.QMI_CAT_SEND_TR)" />
            <map value="0x04000022" message="$(string.QmiMessage.QMI_CAT_SEND_ENVELOPE_CMD)" />
            <map value="0x04000023" message="$(string.QmiMessage.QMI_CAT_GET_EVENT_REPORT)" />
            <map value="0x04000024" message="$(string.QmiMessage.QMI_CAT_SEND_DECODED_TR)" />
            <map value="0x04000025" message="$(string.QmiMessage.QMI_CAT_SEND_DECODED_ENVELOPE_CMD)" />
            <map value="0x04000026" message="$(string.QmiMessage.QMI_CAT_EVENT_CONFIRMATION)" />
            <map value="0x04000027" message="$(string.QmiMessage.QMI_CAT_SCWS_OPEN_CHANNEL)" />
            <map value="0x04000028" message="$(string.QmiMessage.QMI_CAT_SCWS_CLOSE_CHANNEL)" />
            <map value="0x04000029" message="$(string.QmiMessage.QMI_CAT_SCWS_SEND_DATA)" />
            <map value="0x0400002A" message="$(string.QmiMessage.QMI_CAT_SCWS_DATA_AVAILABLE)" />
            <map value="0x0400002B" message="$(string.QmiMessage.QMI_CAT_SCWS_CHANNEL_STATUS)" />
            <map value="0x0400002C" message="$(string.QmiMessage.QMI_CAT_GET_TERMINAL_PROFILE)" />
            <map value="0x0400002D" message="$(string.QmiMessage.QMI_CAT_SET_CONFIGURATION)" />
            <map value="0x0400002E" message="$(string.QmiMessage.QMI_CAT_GET_CONFIGURATION)" />

            <map value="0x05000000" message="$(string.QmiMessage.QMI_UIM_RESET)" />
            <map value="0x05000020" message="$(string.QmiMessage.QMI_UIM_READ_TRANSPARENT)" />
            <map value="0x05000021" message="$(string.QmiMessage.QMI_UIM_READ_RECORD)" />
            <map value="0x05000022" message="$(string.QmiMessage.QMI_UIM_WRITE_TRANSPARENT)" />
            <map value="0x05000023" message="$(string.QmiMessage.QMI_UIM_WRITE_RECORD)" />
            <map value="0x05000024" message="$(string.QmiMessage.QMI_UIM_GET_FILE_ATTRIBUTES)" />
            <map value="0x05000025" message="$(string.QmiMessage.QMI_UIM_SET_PIN_PROTECTION)" />
            <map value="0x05000026" message="$(string.QmiMessage.QMI_UIM_VERIFY_PIN)" />
            <map value="0x05000027" message="$(string.QmiMessage.QMI_UIM_UNBLOCK_PIN)" />
            <map value="0x05000028" message="$(string.QmiMessage.QMI_UIM_CHANGE_PIN)" />
            <map value="0x05000029" message="$(string.QmiMessage.QMI_UIM_DEPERSONALIZATION)" />
            <map value="0x0500002A" message="$(string.QmiMessage.QMI_UIM_REFRESH_REGISTER)" />
            <map value="0x0500002B" message="$(string.QmiMessage.QMI_UIM_REFRESH_OK)" />
            <map value="0x0500002C" message="$(string.QmiMessage.QMI_UIM_REFRESH_COMPLETE)" />
            <map value="0x0500002D" message="$(string.QmiMessage.QMI_UIM_REFRESH_GET_LAST_EVENT)" />
            <map value="0x0500002E" message="$(string.QmiMessage.QMI_UIM_EVENT_REG)" />
            <map value="0x0500002F" message="$(string.QmiMessage.QMI_UIM_GET_CARD_STATUS)" />
            <map value="0x05000030" message="$(string.QmiMessage.QMI_UIM_POWER_DOWN)" />
            <map value="0x05000031" message="$(string.QmiMessage.QMI_UIM_POWER_UP)" />
            <map value="0x05000032" message="$(string.QmiMessage.QMI_UIM_STATUS_CHANGEV01)" />
            <map value="0x05000033" message="$(string.QmiMessage.QMI_UIM_REFRESHV01)" />
            <map value="0x05000034" message="$(string.QmiMessage.QMI_UIM_AUTHENTICATE)" />
            <map value="0x05000035" message="$(string.QmiMessage.QMI_UIM_CLOSE_SESSION)" />
            <map value="0x05000036" message="$(string.QmiMessage.QMI_UIM_GET_SERVICE_STATUS)" />
            <map value="0x05000037" message="$(string.QmiMessage.QMI_UIM_SET_SERVICE_STATUS)" />
            <map value="0x05000038" message="$(string.QmiMessage.QMI_UIM_CHANGE_PROVISIONING_SESSION)" />
            <map value="0x05000039" message="$(string.QmiMessage.QMI_UIM_GET_LABEL)" />
            <map value="0x0500003A" message="$(string.QmiMessage.QMI_UIM_GET_CONFIGURATION)" />
            <map value="0x0500003B" message="$(string.QmiMessage.QMI_UIM_SEND_APDU)" />
            <map value="0x0500003C" message="$(string.QmiMessage.QMI_UIM_SAP_CONNECTION)" />
            <map value="0x0500003D" message="$(string.QmiMessage.QMI_UIM_SAP_REQUEST)" />
            <map value="0x0500003E" message="$(string.QmiMessage.QMI_UIM_SAP_CONNECTIONV01)" />
            <map value="0x0500003F" message="$(string.QmiMessage.QMI_UIM_LOGICAL_CHANNEL)" />
            <map value="0x05000040" message="$(string.QmiMessage.QMI_UIM_SUBSCRIPTION_OK)" />
            <map value="0x05000041" message="$(string.QmiMessage.QMI_UIM_GET_ATR)" />
            <map value="0x05000042" message="$(string.QmiMessage.QMI_UIM_OPEN_LOGICAL_CHANNEL)" />
            <map value="0x05000043" message="$(string.QmiMessage.QMI_UIM_SESSION_CLOSEDV01)" />

            <map value="0x06000001" message="$(string.QmiMessage.QMI_PBM_INDICATION_REGISTER)" />
            <map value="0x06000002" message="$(string.QmiMessage.QMI_PBM_GET_PB_CAPABILITIES)" />
            <map value="0x06000003" message="$(string.QmiMessage.QMI_PBM_GET_ALL_PB_CAPABILITIES)" />
            <map value="0x06000004" message="$(string.QmiMessage.QMI_PBM_READ_RECORDS)" />
            <map value="0x06000005" message="$(string.QmiMessage.QMI_PBM_WRITE_RECORD)" />
            <map value="0x06000006" message="$(string.QmiMessage.QMI_PBM_DELETE_RECORD)" />
            <map value="0x06000007" message="$(string.QmiMessage.QMI_PBM_DELETE_ALL_PB_RECORDS)" />
            <map value="0x06000008" message="$(string.QmiMessage.QMI_PBM_SEARCH_RECORDS)" />
            <map value="0x06000009" message="$(string.QmiMessage.QMI_PBM_RECORD_UPDATE)" />
            <map value="0x0600000A" message="$(string.QmiMessage.QMI_PBM_REFRESH)" />
            <map value="0x0600000B" message="$(string.QmiMessage.QMI_PBM_PB_READY)" />
            <map value="0x0600000C" message="$(string.QmiMessage.QMI_PBM_EMERGENCY_LIST)" />
            <map value="0x0600000D" message="$(string.QmiMessage.QMI_PBM_ALL_PB_INIT_DONE)" />
            <map value="0x0600000E" message="$(string.QmiMessage.QMI_PBM_GET_EMERGENCY_LIST)" />
            <map value="0x0600000F" message="$(string.QmiMessage.QMI_PBM_GET_ALL_GROUPS)" />
            <map value="0x06000010" message="$(string.QmiMessage.QMI_PBM_SET_GROUP_INFO)" />
            <map value="0x06000011" message="$(string.QmiMessage.QMI_PBM_GET_PB_STATE)" />
            <map value="0x06000012" message="$(string.QmiMessage.QMI_PBM_READ_ALL_HIDDEN_RECORDS)" />
            <map value="0x06000013" message="$(string.QmiMessage.QMI_PBM_HIDDEN_RECORD_STATUS)" />
            <map value="0x06000014" message="$(string.QmiMessage.QMI_PBM_GET_NEXT_EMPTY_RECORD_ID)" />
            <map value="0x06000015" message="$(string.QmiMessage.QMI_PBM_GET_NEXT_NON_EMPTY_RECORD_ID)" />
            <map value="0x06000016" message="$(string.QmiMessage.QMI_PBM_GET_ALL_AAS)" />
            <map value="0x06000017" message="$(string.QmiMessage.QMI_PBM_SET_AAS)" />
            <map value="0x06000018" message="$(string.QmiMessage.QMI_PBM_AAS_UPDATE)" />
            <map value="0x06000019" message="$(string.QmiMessage.QMI_PBM_GAS_UPDATE)" />
            <map value="0x0600001A" message="$(string.QmiMessage.QMI_PBM_BIND_SUBSCRIPTION)" />
            <map value="0x0600001B" message="$(string.QmiMessage.QMI_PBM_GET_SUBSCRIPTION_BINDING)" />
            <map value="0x0600001C" message="$(string.QmiMessage.QMI_PBM_READ_PBSET_CAPS)" />

            <map value="0x07000001" message="$(string.QmiMessage.QMI_SAR_RF_SET_STATE)" />
            <map value="0x07000002" message="$(string.QmiMessage.QMI_SAR_RF_GET_STATE)" />

            <map value="0x08000020" message="$(string.QmiMessage.QMI_IMS_SETTINGS_SET_SIP_CONFIG)" />
            <map value="0x08000021" message="$(string.QmiMessage.QMI_IMS_SETTINGS_SET_REG_MGR_CONFIG)" />
            <map value="0x08000022" message="$(string.QmiMessage.QMI_IMS_SETTINGS_SET_SMS_CONFIG)" />
            <map value="0x08000023" message="$(string.QmiMessage.QMI_IMS_SETTINGS_SET_USER_CONFIG)" />
            <map value="0x08000024" message="$(string.QmiMessage.QMI_IMS_SETTINGS_SET_VOIP_CONFIG)" />
            <map value="0x08000025" message="$(string.QmiMessage.QMI_IMS_SETTINGS_GET_SIP_CONFIG)" />
            <map value="0x08000026" message="$(string.QmiMessage.QMI_IMS_SETTINGS_GET_REG_MGR_CONFIG)" />
            <map value="0x08000027" message="$(string.QmiMessage.QMI_IMS_SETTINGS_GET_SMS_CONFIG)" />
            <map value="0x08000028" message="$(string.QmiMessage.QMI_IMS_SETTINGS_GET_USER_CONFIG)" />
            <map value="0x08000029" message="$(string.QmiMessage.QMI_IMS_SETTINGS_GET_VOIP_CONFIG)" />
            <map value="0x0800002A" message="$(string.QmiMessage.QMI_IMS_SETTINGS_CONFIG_IND_REG)" />
            <map value="0x0800002B" message="$(string.QmiMessage.QMI_IMS_SETTINGS_SIP_CONFIG)" />
            <map value="0x0800002C" message="$(string.QmiMessage.QMI_IMS_SETTINGS_REG_MGR_CONFIG)" />
            <map value="0x0800002D" message="$(string.QmiMessage.QMI_IMS_SETTINGS_SMS_CONFIG)" />
            <map value="0x0800002E" message="$(string.QmiMessage.QMI_IMS_SETTINGS_USER_CONFIG)" />
            <map value="0x0800002F" message="$(string.QmiMessage.QMI_IMS_SETTINGS_VOIP_CONFIG)" />
            <map value="0x08000030" message="$(string.QmiMessage.QMI_IMS_SETTINGS_SET_PRESENCE_CONFIG)" />
            <map value="0x08000031" message="$(string.QmiMessage.QMI_IMS_SETTINGS_GET_PRESENCE_CONFIG)" />
            <map value="0x08000032" message="$(string.QmiMessage.QMI_IMS_SETTINGS_PRESENCE_CONFIG)" />
            <map value="0x08000033" message="$(string.QmiMessage.QMI_IMS_SETTINGS_SET_MEDIA_CONFIG)" />
            <map value="0x08000034" message="$(string.QmiMessage.QMI_IMS_SETTINGS_GET_MEDIA_CONFIG)" />
            <map value="0x08000035" message="$(string.QmiMessage.QMI_IMS_SETTINGS_MEDIA_CONFIG)" />
          </valueMap>

          <valueMap name="CommandName">
            <map value="0x00000001" message="$(string.CommandName.RIL_COMMAND_INITNOTIFICATIONS)" />
            <map value="0x00000002" message="$(string.CommandName.RIL_COMMAND_GETNEXTNOTIFICATION)" />
            <map value="0x00000003" message="$(string.CommandName.RIL_COMMAND_ENABLENOTIFICATIONS)" />
            <map value="0x00000004" message="$(string.CommandName.RIL_COMMAND_DISABLENOTIFICATIONS)" />
            <map value="0x00000005" message="$(string.CommandName.RIL_COMMAND_GETDRIVERVERSION)" />
            <map value="0x00000006" message="$(string.CommandName.RIL_COMMAND_GETDEVCAPS)" />
            <map value="0x00000007" message="$(string.CommandName.RIL_COMMAND_GETDEVICEINFO)" />
            <map value="0x00000008" message="$(string.CommandName.RIL_COMMAND_GETEQUIPMENTSTATE)" />
            <map value="0x00000009" message="$(string.CommandName.RIL_COMMAND_SETEQUIPMENTSTATE)" />
            <map value="0x0000000a" message="$(string.CommandName.RIL_COMMAND_SETNOTIFICATIONFILTERSTATE)" />
            <map value="0x0000000b" message="$(string.CommandName.RIL_COMMAND_GETNOTIFICATIONFILTERSTATE)" />
            <map value="0x0000000c" message="$(string.CommandName.RIL_COMMAND_ENUMERATESLOTS)" />
            <map value="0x0000000d" message="$(string.CommandName.RIL_COMMAND_GETCARDINFO)" />
            <map value="0x0000000e" message="$(string.CommandName.RIL_COMMAND_SETSLOTPOWER)" />
            <map value="0x0000000f" message="$(string.CommandName.RIL_COMMAND_GETUICCRECORDSTATUS)" />
            <map value="0x00000010" message="$(string.CommandName.RIL_COMMAND_SENDRESTRICTEDUICCCMD)" />
            <map value="0x00000011" message="$(string.CommandName.RIL_COMMAND_WATCHUICCFILECHANGE)" />
            <map value="0x00000012" message="$(string.CommandName.RIL_COMMAND_GETUICCPRLID)" />
            <map value="0x00000013" message="$(string.CommandName.RIL_COMMAND_GETIMSI)" />
            <map value="0x00000014" message="$(string.CommandName.RIL_COMMAND_GETSUBSCRIBERNUMBERS)" />
            <map value="0x00000015" message="$(string.CommandName.RIL_COMMAND_GETUICCLOCKSTATE)" />
            <map value="0x00000016" message="$(string.CommandName.RIL_COMMAND_GETUICCSERVICELOCK)" />
            <map value="0x00000017" message="$(string.CommandName.RIL_COMMAND_VERIFYUICCLOCK)" />
            <map value="0x00000018" message="$(string.CommandName.RIL_COMMAND_SETUICCLOCKENABLED)" />
            <map value="0x00000019" message="$(string.CommandName.RIL_COMMAND_UNBLOCKUICCLOCK)" />
            <map value="0x0000001a" message="$(string.CommandName.RIL_COMMAND_CHANGEUICCLOCKPASSWORD)" />
            <map value="0x0000001b" message="$(string.CommandName.RIL_COMMAND_GETUICCAPPPERSOCHECKSTATE)" />
            <map value="0x0000001c" message="$(string.CommandName.RIL_COMMAND_GETPERSODEACTIVATIONSTATE)" />
            <map value="0x0000001d" message="$(string.CommandName.RIL_COMMAND_DEACTIVATEPERSO)" />
            <map value="0x0000001e" message="$(string.CommandName.RIL_COMMAND_READPHONEBOOKENTRIES)" />
            <map value="0x0000001f" message="$(string.CommandName.RIL_COMMAND_WRITEPHONEBOOKENTRY)" />
            <map value="0x00000020" message="$(string.CommandName.RIL_COMMAND_DELETEPHONEBOOKENTRY)" />
            <map value="0x00000021" message="$(string.CommandName.RIL_COMMAND_GETPHONEBOOKOPTIONS)" />
            <map value="0x00000022" message="$(string.CommandName.RIL_COMMAND_GETALLADDITIONALNUMBERSTRINGS)" />
            <map value="0x00000023" message="$(string.CommandName.RIL_COMMAND_GETALLEMERGENCYNUMBERS)" />
            <map value="0x00000024" message="$(string.CommandName.RIL_COMMAND_SETRADIOCONFIGURATION)" />
            <map value="0x00000025" message="$(string.CommandName.RIL_COMMAND_GETRADIOCONFIGURATION)" />
            <map value="0x00000026" message="$(string.CommandName.RIL_COMMAND_SETEXECUTORCONFIG)" />
            <map value="0x00000027" message="$(string.CommandName.RIL_COMMAND_GETEXECUTORCONFIG)" />
            <map value="0x00000028" message="$(string.CommandName.RIL_COMMAND_SETSYSTEMSELECTIONPREFS)" />
            <map value="0x00000029" message="$(string.CommandName.RIL_COMMAND_GETSYSTEMSELECTIONPREFS)" />
            <map value="0x0000002a" message="$(string.CommandName.RIL_COMMAND_GETOPERATORLIST)" />
            <map value="0x0000002b" message="$(string.CommandName.RIL_COMMAND_GETPREFERREDOPERATORLIST)" />
            <map value="0x0000002c" message="$(string.CommandName.RIL_COMMAND_GETCURRENTREGSTATUS)" />
            <map value="0x0000002d" message="$(string.CommandName.RIL_COMMAND_GETSIGNALQUALITY)" />
            <map value="0x0000002f" message="$(string.CommandName.RIL_COMMAND_SENDUICCTOOLKITCMDRESPONSE)" />
            <map value="0x00000030" message="$(string.CommandName.RIL_COMMAND_SENDUICCTOOLKITENVELOPE)" />
            <map value="0x00000031" message="$(string.CommandName.RIL_COMMAND_DIAL)" />
            <map value="0x00000032" message="$(string.CommandName.RIL_COMMAND_MANAGECALLS)" />
            <map value="0x00000033" message="$(string.CommandName.RIL_COMMAND_EMERGENCYMODECONTROL)" />
            <map value="0x00000034" message="$(string.CommandName.RIL_COMMAND_GETCALLFORWARDINGSETTINGS)" />
            <map value="0x00000035" message="$(string.CommandName.RIL_COMMAND_SETCALLFORWARDINGSTATUS)" />
            <map value="0x00000036" message="$(string.CommandName.RIL_COMMAND_ADDCALLFORWARDING)" />
            <map value="0x00000037" message="$(string.CommandName.RIL_COMMAND_REMOVECALLFORWARDING)" />
            <map value="0x00000038" message="$(string.CommandName.RIL_COMMAND_GETCALLBARRINGSTATUS)" />
            <map value="0x00000039" message="$(string.CommandName.RIL_COMMAND_SETCALLBARRINGSTATUS)" />
            <map value="0x0000003a" message="$(string.CommandName.RIL_COMMAND_CHANGECALLBARRINGPASSWORD)" />
            <map value="0x0000003b" message="$(string.CommandName.RIL_COMMAND_GETCALLWAITINGSETTINGS)" />
            <map value="0x0000003c" message="$(string.CommandName.RIL_COMMAND_SETCALLWAITINGSTATUS)" />
            <map value="0x0000003d" message="$(string.CommandName.RIL_COMMAND_GETCALLERIDSETTINGS)" />
            <map value="0x0000003e" message="$(string.CommandName.RIL_COMMAND_GETDIALEDIDSETTINGS)" />
            <map value="0x0000003f" message="$(string.CommandName.RIL_COMMAND_GETHIDECONNECTEDIDSETTINGS)" />
            <map value="0x00000040" message="$(string.CommandName.RIL_COMMAND_GETHIDEIDSETTINGS)" />
            <map value="0x00000041" message="$(string.CommandName.RIL_COMMAND_SENDFLASH)" />
            <map value="0x00000042" message="$(string.CommandName.RIL_COMMAND_SENDSUPSERVICEDATA)" />
            <map value="0x00000043" message="$(string.CommandName.RIL_COMMAND_SENDDTMF)" />
            <map value="0x00000044" message="$(string.CommandName.RIL_COMMAND_STARTDTMF)" />
            <map value="0x00000045" message="$(string.CommandName.RIL_COMMAND_STOPDTMF)" />
            <map value="0x00000046" message="$(string.CommandName.RIL_COMMAND_GETMSGSERVICEOPTIONS)" />
            <map value="0x00000047" message="$(string.CommandName.RIL_COMMAND_READMSG)" />
            <map value="0x00000048" message="$(string.CommandName.RIL_COMMAND_WRITEMSG)" />
            <map value="0x00000049" message="$(string.CommandName.RIL_COMMAND_DELETEMSG)" />
            <map value="0x0000004a" message="$(string.CommandName.RIL_COMMAND_GETCELLBROADCASTMSGCONFIG)" />
            <map value="0x0000004b" message="$(string.CommandName.RIL_COMMAND_SETCELLBROADCASTMSGCONFIG)" />
            <map value="0x0000004c" message="$(string.CommandName.RIL_COMMAND_GETMSGINUICCSTATUS)" />
            <map value="0x0000004d" message="$(string.CommandName.RIL_COMMAND_SETMSGINUICCSTATUS)" />
            <map value="0x0000004e" message="$(string.CommandName.RIL_COMMAND_SETMSGMEMORYSTATUS)" />
            <map value="0x0000004f" message="$(string.CommandName.RIL_COMMAND_SENDMSG)" />
            <map value="0x00000050" message="$(string.CommandName.RIL_COMMAND_GETSMSC)" />
            <map value="0x00000051" message="$(string.CommandName.RIL_COMMAND_SETSMSC)" />
            <map value="0x00000052" message="$(string.CommandName.RIL_COMMAND_GETIMSSTATUS)" />
            <map value="0x00000053" message="$(string.CommandName.RIL_COMMAND_GETPOSITIONINFO)" />
            <map value="0x00000054" message="$(string.CommandName.RIL_COMMAND_GETRADIOSTATEGROUPS)" />
            <map value="0x00000055" message="$(string.CommandName.RIL_COMMAND_GETRADIOSTATEDETAILS)" />
            <map value="0x00000056" message="$(string.CommandName.RIL_COMMAND_SETRADIOSTATEDETAILS)" />
            <map value="0x00000057" message="$(string.CommandName.RIL_COMMAND_RADIOSTATEPASSWORDCOMPARE)" />
            <map value="0x00000058" message="$(string.CommandName.RIL_COMMAND_RADIOSTATEGETPASSWORDRETRYCOUNT)" />
            <map value="0x00000059" message="$(string.CommandName.RIL_COMMAND_DEVSPECIFIC)" />
            <map value="0x0000005a" message="$(string.CommandName.RIL_COMMAND_SETRFSTATE)" />
            <map value="0x0000005b" message="$(string.CommandName.RIL_COMMAND_GETRFSTATE)" />
            <map value="0x0000005c" message="$(string.CommandName.RIL_COMMAND_GETDMPROFILECONFIGINFO)" />
            <map value="0x0000005d" message="$(string.CommandName.RIL_COMMAND_SETDMPROFILECONFIGINFO)" />
            <map value="0x0000005e" message="$(string.CommandName.RIL_COMMAND_WRITEADDITIONALNUMBERSTRING)" />
            <map value="0x0000005f" message="$(string.CommandName.RIL_COMMAND_DELETEADDITIONALNUMBERSTRING)" />
            <map value="0x00000060" message="$(string.CommandName.RIL_COMMAND_GETUICCATR)" />
            <map value="0x00000061" message="$(string.CommandName.RIL_COMMAND_OPENUICCLOGICALCHANNEL)" />
            <map value="0x00000062" message="$(string.CommandName.RIL_COMMAND_CLOSEUICCLOGICALCHANNEL)" />
            <map value="0x00000063" message="$(string.CommandName.RIL_COMMAND_EXCHANGEUICCAPDU)" />
            <map value="0x00000064" message="$(string.CommandName.RIL_COMMAND_SENDSUPSERVICEDATARESPONSE)" />
            <map value="0x00000065" message="$(string.CommandName.RIL_COMMAND_CANCELSUPSERVICEDATASESSION)" />
            <map value="0x00000066" message="$(string.CommandName.RIL_COMMAND_SETUICCTOOLKITPROFILE)" />
            <map value="0x00000067" message="$(string.CommandName.RIL_COMMAND_GETUICCTOOLKITPROFILE)" />
            <map value="0x00000068" message="$(string.CommandName.RIL_COMMAND_REGISTERUICCTOOLKITSERVICE)" />
            <map value="0x00000069" message="$(string.CommandName.RIL_COMMAND_SENDMSGACK)" />
            <map value="0x0000006A" message="$(string.CommandName.RIL_COMMAND_CLOSEUICCLOGICALCHANNELGROUP)" />
            <map value="0x0000006B" message="$(string.CommandName.RIL_COMMAND_SETPREFERREDOPERATORLIST)" />
            <map value="0x0000006C" message="$(string.CommandName.RIL_COMMAND_GETUICCSERVICESTATE)" />
            <map value="0x0000006D" message="$(string.CommandName.RIL_COMMAND_SETUICCSERVICESTATE)" />
            <map value="0x0000006E" message="$(string.CommandName.RIL_COMMAND_GETCALLLIST)" />
            <map value="0x0000006F" message="$(string.CommandName.RIL_COMMAND_GETEXECUTORFOCUS)" />
            <map value="0x00000070" message="$(string.CommandName.RIL_COMMAND_SETEXECUTORFOCUS)" />
            <map value="0x00000071" message="$(string.CommandName.RIL_COMMAND_GETEMERGENCYMODE)" />
            <map value="0x00000072" message="$(string.CommandName.RIL_COMMAND_GETEXECUTORRFSTATE)" />
            <map value="0x00000073" message="$(string.CommandName.RIL_COMMAND_SETEXECUTORRFSTATE)" />
            <map value="0x00000074" message="$(string.CommandName.RIL_COMMAND_RESETMODEM)" />
            <map value="0x00000075" message="$(string.CommandName.RIL_COMMAND_CANCELGETOPERATORLIST)" />
            <map value="0x00000076" message="$(string.CommandName.RIL_COMMAND_AVOIDCDMASYSTEM)" />
            <map value="0x00000077" message="$(string.CommandName.RIL_COMMAND_SETPSMEDIACONFIGURATION)" />
            <map value="0x00000078" message="$(string.CommandName.RIL_COMMAND_GETPSMEDIACONFIGURATION)" />
            <map value="0x10000001" message="$(string.CommandName.INTERNAL_COMMAND_CARDABSENTDETECTION)" />
            <map value="0x10000002" message="$(string.CommandName.INTERNAL_COMMAND_GETSUBSCRIBERNUMBERS)" />
            <map value="0x10000003" message="$(string.CommandName.INTERNAL_COMMAND_MSSRCOMPLETE)" />
            <map value="0x10000004" message="$(string.CommandName.INTERNAL_COMMAND_QUITECBM)" />
            <map value="0x10000005" message="$(string.CommandName.INTERNAL_COMMAND_SETEXECUTORCONFIG)" />
            <map value="0x10000006" message="$(string.CommandName.INTERNAL_COMMAND_SETSLOTPOWER)" />
            <map value="0x10000007" message="$(string.CommandName.INTERNAL_COMMAND_UPDATEUICCAPPAPPERSOCHECKSTATE)" />
            <map value="0x10000008" message="$(string.CommandName.INTERNAL_COMMAND_VERIFYUICCLOCK)" />
            <map value="0x10000009" message="$(string.CommandName.INTERNAL_COMMAND_WAITUNTILUIMSERVICESTATESBECOMESAME)" />
          </valueMap>

          <bitMap name="RilExecutorFlag">
            <map value="0x1" message="$(string.RilExecutorFlag.ENABLED)"/>
            <map value="0x2" message="$(string.RilExecutorFlag.HIGHPRIORITY)"/>
          </bitMap>

          <bitMap name="RilPersoLockSupportCaps">
            <map value="0x1" message="$(string.RilPersoLockSupportCaps.NET)"/>
            <map value="0x2" message="$(string.RilPersoLockSupportCaps.NETSUB)"/>
            <map value="0x4" message="$(string.RilPersoLockSupportCaps.SP)"/>
            <map value="0x8" message="$(string.RilPersoLockSupportCaps.CORP)"/>
            <map value="0x10" message="$(string.RilPersoLockSupportCaps.USIM)"/>
            <map value="0x20" message="$(string.RilPersoLockSupportCaps.2_NETTYPE1)"/>
            <map value="0x40" message="$(string.RilPersoLockSupportCaps.2_NETTYPE2)"/>
            <map value="0x80" message="$(string.RilPersoLockSupportCaps.2_HRPD)"/>
            <map value="0x100" message="$(string.RilPersoLockSupportCaps.2_SP)"/>
            <map value="0x200" message="$(string.RilPersoLockSupportCaps.2_CORP)"/>
            <map value="0x400" message="$(string.RilPersoLockSupportCaps.2_UIM)"/>
          </bitMap>

          <valueMap name="PBInfoParamMask">
            <map value="0x1" message="$(string.PBInfoParamMask.USED)"/>
            <map value="0x2" message="$(string.PBInfoParamMask.TOTAL)"/>
            <map value="0x4" message="$(string.PBInfoParamMask.ADDRESSLENGTH)"/>
            <map value="0x8" message="$(string.PBInfoParamMask.TEXTLENGTH)"/>
            <map value="0x10" message="$(string.PBInfoParamMask.MAXANR)"/>
            <map value="0x20" message="$(string.PBInfoParamMask.MAXANRLENGTH)"/>
            <map value="0x40" message="$(string.PBInfoParamMask.MAXAASTEXTLENGTH)"/>
            <map value="0x80" message="$(string.PBInfoParamMask.USEDAAS)"/>
            <map value="0x100" message="$(string.PBInfoParamMask.TOTALAAS)"/>
            <map value="0x200" message="$(string.PBInfoParamMask.MAXEMAILS)"/>
            <map value="0x400" message="$(string.PBInfoParamMask.MAXEMAILLENGTH)"/>
            <map value="0x800" message="$(string.PBInfoParamMask.MAXGROUPS)"/>
            <map value="0x1000" message="$(string.PBInfoParamMask.MAXGASLENGTH)"/>
            <map value="0x2000" message="$(string.PBInfoParamMask.USEDGAS)"/>
            <map value="0x4000" message="$(string.PBInfoParamMask.TOTALGAS)"/>
            <map value="0x8000" message="$(string.PBInfoParamMask.MAXSNELENGTH)"/>
            <map value="0xffff" message="$(string.PBInfoParamMask.ALL)"/>
          </valueMap>

          <valueMap name="RILUICCAPPPERSOCHECKSTATUSSTATE">
            <map value="0x0" message="$(string.RILUICCAPPPERSOCHECKSTATUSSTATE.RIL_PERSOCHECKSTATE_NOTREADY)"/>
            <map value="0x1" message="$(string.RILUICCAPPPERSOCHECKSTATUSSTATE.RIL_PERSOCHECKSTATE_PASS)"/>
            <map value="0x3" message="$(string.RILUICCAPPPERSOCHECKSTATUSSTATE.RIL_PERSOCHECKSTATE_FAIL)"/>
          </valueMap>

          <valueMap name="UserApplicationSelection">
            <map value="0x00" message="$(string.UserApplicationSelection.Disabled)" />
            <map value="0x01" message="$(string.UserApplicationSelection.Enabled)" />
          </valueMap>

          <valueMap name="AppOrModemProcessorPersonalization">
            <map value="0x00" message="$(string.AppOrModemProcessorPersonalization.APPerso)" />
            <map value="0x01" message="$(string.AppOrModemProcessorPersonalization.MPPerso)" />
          </valueMap>

          <valueMap name="QmiVoiceCallDirection">
            <map value="0x01" message="$(string.QmiVoiceCallDirection.MO)" />
            <map value="0x02" message="$(string.QmiVoiceCallDirection.MT)" />
          </valueMap>

          <valueMap name="3GPPTone">
            <map value="0x01" message="$(string.3GPPTone.RIL_3GPPTONE_TONEOFF)" />
            <map value="0x02" message="$(string.3GPPTone.RIL_3GPPTONE_RINGBACK)" />
            <map value="0x03" message="$(string.3GPPTone.RIL_3GPPTONE_BUSY)" />
            <map value="0x04" message="$(string.3GPPTone.RIL_3GPPTONE_CONGESTION)" />
            <map value="0x05" message="$(string.3GPPTone.RIL_3GPPTONE_AUTHENTICATIONFAILURE)" />
            <map value="0x06" message="$(string.3GPPTone.RIL_3GPPTONE_NUMBERUNOBTAINABLE)" />
            <map value="0x07" message="$(string.3GPPTone.RIL_3GPPTONE_CALLDROPPED)" />
          </valueMap>

          <valueMap name="3GPP2Tone">
            <map value="0x01" message="$(string.3GPP2Tone.RIL_3GPP2TONE_TONEOFF)" />
            <map value="0x02" message="$(string.3GPP2Tone.RIL_3GPP2TONE_DIAL)" />
            <map value="0x03" message="$(string.3GPP2Tone.RIL_3GPP2TONE_RINGBACK)" />
            <map value="0x04" message="$(string.3GPP2Tone.RIL_3GPP2TONE_INTERCEPT)" />
            <map value="0x05" message="$(string.3GPP2Tone.RIL_3GPP2TONE_ABRVINTERCEPT)" />
            <map value="0x06" message="$(string.3GPP2Tone.RIL_3GPP2TONE_REORDER)" />
            <map value="0x07" message="$(string.3GPP2Tone.RIL_3GPP2TONE_ABRVREORDER)" />
            <map value="0x08" message="$(string.3GPP2Tone.RIL_3GPP2TONE_BUSY)" />
            <map value="0x09" message="$(string.3GPP2Tone.RIL_3GPP2TONE_CONFIRM)" />
            <map value="0x0a" message="$(string.3GPP2Tone.RIL_3GPP2TONE_ANSWER)" />
            <map value="0x0b" message="$(string.3GPP2Tone.RIL_3GPP2TONE_CALLWAITING)" />
            <map value="0x0c" message="$(string.3GPP2Tone.RIL_3GPP2TONE_PIP)" />
          </valueMap>

          <valueMap name="QmiUimCardState">
            <map value="0x00" message="$(string.QmiUimCardState.Absent)" />
            <map value="0x01" message="$(string.QmiUimCardState.Present)" />
            <map value="0x02" message="$(string.QmiUimCardState.Error)" />
          </valueMap>

          <valueMap name="QmiUimCardError">
            <map value="0x00" message="$(string.QmiUimCardError.Unknown)" />
            <map value="0x01" message="$(string.QmiUimCardError.Power_Down)" />
            <map value="0x02" message="$(string.QmiUimCardError.Poll_Error)" />
            <map value="0x03" message="$(string.QmiUimCardError.No_ATR_Received)" />
            <map value="0x04" message="$(string.QmiUimCardError.Volt_Mismatch)" />
            <map value="0x05" message="$(string.QmiUimCardError.Parity_Error)" />
            <map value="0x06" message="$(string.QmiUimCardError.Possibly_Removed)" />
            <map value="0x07" message="$(string.QmiUimCardError.Sim_Technical_Problems)" />
          </valueMap>

          <valueMap name="QmiUimPinState">
            <map value="0x00" message="$(string.QmiUimPinState.Unknown)" />
            <map value="0x01" message="$(string.QmiUimPinState.Enabled_Not_Verified)" />
            <map value="0x02" message="$(string.QmiUimPinState.Enabled_Verified)" />
            <map value="0x03" message="$(string.QmiUimPinState.Disabled)" />
            <map value="0x04" message="$(string.QmiUimPinState.Blocked)" />
            <map value="0x05" message="$(string.QmiUimPinState.Permanently_Blocked)" />
          </valueMap>

          <valueMap name="QmiUimAppType">
            <map value="0x00" message="$(string.QmiUimAppType.UNKNOWN)" />
            <map value="0x01" message="$(string.QmiUimAppType.SIM)" />
            <map value="0x02" message="$(string.QmiUimAppType.USIM)" />
            <map value="0x03" message="$(string.QmiUimAppType.RUIM)" />
            <map value="0x04" message="$(string.QmiUimAppType.CSIM)" />
            <map value="0x05" message="$(string.QmiUimAppType.ISIM)" />
          </valueMap>

          <valueMap name="QmiUimAppState">
            <map value="0x00" message="$(string.QmiUimAppState.Unknown)" />
            <map value="0x01" message="$(string.QmiUimAppState.Detected)" />
            <map value="0x02" message="$(string.QmiUimAppState.Pin1_or_Upin_Required)" />
            <map value="0x03" message="$(string.QmiUimAppState.Puk1_or_Puk_Required)" />
            <map value="0x04" message="$(string.QmiUimAppState.Person_Check_Required)" />
            <map value="0x05" message="$(string.QmiUimAppState.Pin1_Permanently_Blocked)" />
            <map value="0x06" message="$(string.QmiUimAppState.Illegal)" />
            <map value="0x07" message="$(string.QmiUimAppState.Ready)" />
          </valueMap>

          <valueMap name="QmiUimPersoState">
            <map value="0x00" message="$(string.QmiUimPersoState.UNKNOWN_V01)" />
            <map value="0x01" message="$(string.QmiUimPersoState.IN_PROGRESS_V01)" />
            <map value="0x02" message="$(string.QmiUimPersoState.READY_V01)" />
            <map value="0x03" message="$(string.QmiUimPersoState.CODE_REQ_V01)" />
            <map value="0x04" message="$(string.QmiUimPersoState.PUK_REQ_V01)" />
            <map value="0x05" message="$(string.QmiUimPersoState.PERMANENTLY_BLOCKED_V01)" />
          </valueMap>

          <valueMap name="QmiUimPersoFeatureStatus">
            <map value="0x00" message="$(string.QmiUimPersoFeatureStatus.Gw_Network)" />
            <map value="0x01" message="$(string.QmiUimPersoFeatureStatus.Gw_Network_Subset)" />
            <map value="0x02" message="$(string.QmiUimPersoFeatureStatus.Gw_Service_Provider)" />
            <map value="0x03" message="$(string.QmiUimPersoFeatureStatus.Gw_Corporate)" />
            <map value="0x04" message="$(string.QmiUimPersoFeatureStatus.Gw_UIM)" />
            <map value="0x05" message="$(string.QmiUimPersoFeatureStatus.1X_Network_Type1)" />
            <map value="0x06" message="$(string.QmiUimPersoFeatureStatus.1X_Network_Type2)" />
            <map value="0x07" message="$(string.QmiUimPersoFeatureStatus.1x_HRPD)" />
            <map value="0x08" message="$(string.QmiUimPersoFeatureStatus.1x_Service_Provider)" />
            <map value="0x09" message="$(string.QmiUimPersoFeatureStatus.1x_Corporate)" />
            <map value="0x10" message="$(string.QmiUimPersoFeatureStatus.1x_RUIM)" />
            <map value="0x11" message="$(string.QmiUimPersoFeatureStatus.Unknown)" />
          </valueMap>

          <valueMap name="QmiUimUpinReplacedState">
            <map value="0x00" message="$(string.QmiUimUpinReplacedState.Pin1_Used)" />
            <map value="0x01" message="$(string.QmiUimUpinReplacedState.Upin_Replaces_Pin1)" />
          </valueMap>

          <valueMap name="UimSessionType">
            <map value="0x00" message="$(string.UimSessionType.PRIMARY_GW_V01)" />
            <map value="0x01" message="$(string.UimSessionType.PRIMARY_1X_V01)" />
            <map value="0x02" message="$(string.UimSessionType.SECONDARY_GW_V01)" />
            <map value="0x03" message="$(string.UimSessionType.SECONDARY_1X_V01)" />
            <map value="0x04" message="$(string.UimSessionType.NONPROVISIONING_SLOT_1_V01)" />
            <map value="0x05" message="$(string.UimSessionType.NONPROVISIONING_SLOT_2_V01)" />
            <map value="0x06" message="$(string.UimSessionType.CARD_ON_SLOT_1_V01)" />
            <map value="0x07" message="$(string.UimSessionType.CARD_ON_SLOT_2_V01)" />
            <map value="0x08" message="$(string.UimSessionType.CHANNEL_ID_SLOT_1_V01)" />
            <map value="0x09" message="$(string.UimSessionType.CHANNEL_ID_SLOT_2_V01)" />
          </valueMap>

          <valueMap name="IOCTLStateType">
            <map value="0x00" message="$(string.IOCTLStateType.StateInitial)" />
            <map value="0x01" message="$(string.IOCTLStateType.StateUnbindingWaitingForInternalInd)" />
            <map value="0x02" message="$(string.IOCTLStateType.StateBindingWaitingForInternalInd)" />
          </valueMap>

          <valueMap name="InternalIndicationType">
            <map value="0x00" message="$(string.InternalIndicationType.UIMCardStatus)" />
            <map value="0x01" message="$(string.InternalIndicationType.EmergencyModeExited)" />
            <map value="0x03" message="$(string.InternalIndicationType.SystemSelectionPrefs)" />
            <map value="0x04" message="$(string.InternalIndicationType.PBMRecordStored)" />
            <map value="0x05" message="$(string.InternalIndicationType.PBMRecordDeleted)" />
            <map value="0x06" message="$(string.InternalIndicationType.3GPP2EFSPNFileChanged)" />
            <map value="0x07" message="$(string.InternalIndicationType.OperatingModeChanged)" />
            <map value="0x08" message="$(string.InternalIndicationType.PrlInitCompleted)" />
            <map value="0x09" message="$(string.InternalIndicationType.PBMAASUpdated)" />
            <map value="0x10" message="$(string.InternalIndicationType.APPersoActivatedFeaturesUpdated)" />
            <map value="0x11" message="$(string.InternalIndicationType.APPersoPersoCheckStateUpdated)" />
            <map value="0x12" message="$(string.InternalIndicationType.UICCRefreshCommandOccured)" />
            <map value="0x13" message="$(string.InternalIndicationType.SubscriberNumbersRetrieved)" />
            <map value="0x14" message="$(string.InternalIndicationType.ExternalUSSDIndicationArrived)" />
            <map value="0x15" message="$(string.InternalIndicationType.FirstOpenChannelReceived)" />
          </valueMap>

          <valueMap name="RTREControlValueEnum">
            <map value="0x01" message="$(string.RTREControlValueEnum.RUIM_ONLY_V01)" />
            <map value="0x02" message="$(string.RTREControlValueEnum.INTERNAL_SETTINGS_ONLY_V01)" />
            <map value="0x03" message="$(string.RTREControlValueEnum.RUIM_IF_AVAIL_V01)" />
            <map value="0x04" message="$(string.RTREControlValueEnum.GSM_ON_1X_V01)" />
          </valueMap>

          <valueMap name="SlotStateEnum">
            <map value="0x01" message="$(string.SlotStateEnum.Off_Empty)" />
            <map value="0x02" message="$(string.SlotStateEnum.Off)" />
            <map value="0x03" message="$(string.SlotStateEnum.Empty)" />
            <map value="0x04" message="$(string.SlotStateEnum.Not_Ready)" />
            <map value="0x05" message="$(string.SlotStateEnum.Active)" />
            <map value="0x06" message="$(string.SlotStateEnum.Error)" />
          </valueMap>

          <valueMap name="RilUiccAppType">
            <map value="0x01" message="$(string.RilUiccAppType.UNKNOWN)" />
            <map value="0x02" message="$(string.RilUiccAppType.MF)" />
            <map value="0x03" message="$(string.RilUiccAppType.MF_SIM)" />
            <map value="0x04" message="$(string.RilUiccAppType.MF_RUIM)" />
            <map value="0x05" message="$(string.RilUiccAppType.USIM)" />
            <map value="0x06" message="$(string.RilUiccAppType.CSIM)" />
            <map value="0x07" message="$(string.RilUiccAppType.ISIM)" />
          </valueMap>

          <valueMap name="RilUiccRecordType">
            <map value="0x00" message="$(string.RilUiccRecordType.Unknown)" />
            <map value="0x01" message="$(string.RilUiccRecordType.Transparent)" />
            <map value="0x02" message="$(string.RilUiccRecordType.Cyclic)" />
            <map value="0x03" message="$(string.RilUiccRecordType.Linear)" />
            <map value="0x04" message="$(string.RilUiccRecordType.Bertlv)" />
            <map value="0x05" message="$(string.RilUiccRecordType.Master)" />
            <map value="0x06" message="$(string.RilUiccRecordType.Dedicated)" />
          </valueMap>

          <valueMap name="RilUiccFileType">
            <map value="0x00" message="$(string.RilUiccFileType.TRANSPARENT_V01)" />
            <map value="0x01" message="$(string.RilUiccFileType.CYCLIC_V01)" />
            <map value="0x02" message="$(string.RilUiccFileType.LINEAR_FIXED_V01)" />
            <map value="0x03" message="$(string.RilUiccFileType.DEDICATED_FILE_V01)" />
            <map value="0x04" message="$(string.RilUiccFileType.MASTER_FILE_V01)" />
          </valueMap>

          <valueMap name="UimAccessConditionType">
            <map value="0x00" message="$(string.UimAccessConditionType.ALWAYS_V01)" />
            <map value="0x01" message="$(string.UimAccessConditionType.NEVER_V01)" />
            <map value="0x02" message="$(string.UimAccessConditionType.AND_COND_V01)" />
            <map value="0x03" message="$(string.UimAccessConditionType.OR_COND_V01)" />
            <map value="0x04" message="$(string.UimAccessConditionType.SINGLE_COND_V01)" />
          </valueMap>

          <valueMap name="RilAccessConditionType">
            <map value="0x00" message="$(string.RilAccessConditionType.ALW)" />
            <map value="0x01" message="$(string.RilAccessConditionType.PIN1)" />
            <map value="0x02" message="$(string.RilAccessConditionType.PIN2)" />
            <map value="0x03" message="$(string.RilAccessConditionType.RFU3)" />
            <map value="0x04" message="$(string.RilAccessConditionType.RFU4)" />
            <map value="0x05" message="$(string.RilAccessConditionType.ADM5)" />
            <map value="0x06" message="$(string.RilAccessConditionType.ADM6)" />
            <map value="0x07" message="$(string.RilAccessConditionType.NEV)" />
          </valueMap>

          <valueMap name="RilUiccChannelGroup">
            <map value="0x1" message="$(string.RilUiccChannelGroup.NFC)" />
          </valueMap>

          <valueMap name="PinIdType">
            <map value="0x01" message="$(string.PinIdType.PIN_1_V01)" />
            <map value="0x02" message="$(string.PinIdType.PIN_2_V01)" />
            <map value="0x03" message="$(string.PinIdType.UNIVERSAL_V01)" />
            <map value="0x04" message="$(string.PinIdType.HIDDEN_KEY_V01)" />
          </valueMap>

          <valueMap name="ResultType">
            <map value="0x00" message="$(string.ResultType.SUCCESS_V01)" />
            <map value="0x01" message="$(string.ResultType.FAILURE_V01)" />
          </valueMap>

          <valueMap name="PinStateType">
            <map value="0x00" message="$(string.PinStateType.UNKNOWN_V01)" />
            <map value="0x01" message="$(string.PinStateType.ENABLED_NOT_VERIFIED_V01)" />
            <map value="0x02" message="$(string.PinStateType.ENABLED_VERIFIED_V01)" />
            <map value="0x03" message="$(string.PinStateType.DISABLED_V01)" />
            <map value="0x04" message="$(string.PinStateType.BLOCKED_V01)" />
            <map value="0x05" message="$(string.PinStateType.PERMANENTLY_BLOCKED_V01)" />
          </valueMap>

          <valueMap name="RilPersoFeatureType">
            <map value="0x1"   message="$(string.RilPersoFeatureType.Network)" />
            <map value="0x2"   message="$(string.RilPersoFeatureType.Network_Subset)" />
            <map value="0x4"   message="$(string.RilPersoFeatureType.Service_Provider)" />
            <map value="0x8"   message="$(string.RilPersoFeatureType.Corporate)" />
            <map value="0x10"  message="$(string.RilPersoFeatureType.USIM)" />
            <map value="0x20"  message="$(string.RilPersoFeatureType.2_Network_Type1)" />
            <map value="0x40"  message="$(string.RilPersoFeatureType.2_Network_Type2)" />
            <map value="0x80"  message="$(string.RilPersoFeatureType.2_HRPD)" />
            <map value="0x100" message="$(string.RilPersoFeatureType.2_Service_Provider)" />
            <map value="0x200" message="$(string.RilPersoFeatureType.2_Corporate)" />
            <map value="0x400" message="$(string.RilPersoFeatureType.2_UIM)" />
          </valueMap>

          <valueMap name="RilPersoDeactivationState">
            <map value="0x1" message="$(string.RilPersoDeactivationState.READY)" />
            <map value="0x2" message="$(string.RilPersoDeactivationState.CK_REQUIRED)" />
            <map value="0x3" message="$(string.RilPersoDeactivationState.PUK_REQUIRED)" />
            <map value="0x4" message="$(string.RilPersoDeactivationState.PUK_BLOCKED)" />
          </valueMap>

          <valueMap name="PbmSessionType">
            <map value="0x00" message="$(string.PbmSessionType.GW_PRIMARY_V01)" />
            <map value="0x01" message="$(string.PbmSessionType.1X_PRIMARY_V01)" />
            <map value="0x02" message="$(string.PbmSessionType.GW_SECONDARY_V01)" />
            <map value="0x03" message="$(string.PbmSessionType.1X_SECONDARY_V01)" />
            <map value="0x04" message="$(string.PbmSessionType.NON_PROVISIONING_SLOT1_V01)" />
            <map value="0x05" message="$(string.PbmSessionType.NON_PROVISIONING_SLOT2_V01)" />
            <map value="0x06" message="$(string.PbmSessionType.GLOBAL_PB_SLOT1_V01)" />
            <map value="0x07" message="$(string.PbmSessionType.GLOBAL_PB_SLOT2_V01)" />
          </valueMap>

          <valueMap name="StoreLocEnum">
            <map value="0x0" message="$(string.StoreLocEnum.UNKNOWN)" />
            <map value="0x1" message="$(string.StoreLocEnum.UICCFIXDIALING)" />
            <map value="0x2" message="$(string.StoreLocEnum.OWNNUMBERS)" />
            <map value="0x4" message="$(string.StoreLocEnum.UICCPHONEBOOK)" />
            <map value="0x8" message="$(string.StoreLocEnum.UICCSERVICEDIALING)" />
          </valueMap>

          <valueMap name="PbTypeEnum">
            <map value="0x01" message="$(string.PbTypeEnum.ADN_V01)" />
            <map value="0x02" message="$(string.PbTypeEnum.FDN_V01)" />
            <map value="0x04" message="$(string.PbTypeEnum.MSISDN_V01)" />
            <map value="0x08" message="$(string.PbTypeEnum.MBDN_V01)" />
            <map value="0x10" message="$(string.PbTypeEnum.SDN_V01)" />
            <map value="0x20" message="$(string.PbTypeEnum.BDN_V01)" />
            <map value="0x40" message="$(string.PbTypeEnum.LND_V01)" />
            <map value="0x80" message="$(string.PbTypeEnum.MBN_V01)" />
          </valueMap>

          <valueMap name="PbmNumType">
            <map value="0x00" message="$(string.PbmNumType.UNKNOWN_V01)" />
            <map value="0x01" message="$(string.PbmNumType.INTERNATIONAL_V01)" />
            <map value="0x02" message="$(string.PbmNumType.NATIONAL_V01)" />
            <map value="0x03" message="$(string.PbmNumType.NETWORK_SPECIFIC_V01)" />
            <map value="0x04" message="$(string.PbmNumType.DEDICATED_ACCESS_V01)" />
          </valueMap>

          <valueMap name="RilNumType">
            <map value="0x0" message="$(string.RilNumType.UNKNOWN)" />
            <map value="0x1" message="$(string.RilNumType.INTERNATIONAL)" />
            <map value="0x2" message="$(string.RilNumType.NATIONAL)" />
            <map value="0x3" message="$(string.RilNumType.NETWKSPECIFIC)" />
            <map value="0x4" message="$(string.RilNumType.SUBSCRIBER)" />
            <map value="0x5" message="$(string.RilNumType.ALPHANUM)" />
            <map value="0x6" message="$(string.RilNumType.ABBREV)" />
            <map value="0x7" message="$(string.RilNumType.IP)" />
            <map value="0x8" message="$(string.RilNumType.EMAIL)" />
          </valueMap>

          <valueMap name="PbmNumPlan">
            <map value="0x00" message="$(string.PbmNumPlan.UNKNOWN_V01)" />
            <map value="0x01" message="$(string.PbmNumPlan.ISDN_V01)" />
            <map value="0x02" message="$(string.PbmNumPlan.DATA_V01)" />
            <map value="0x03" message="$(string.PbmNumPlan.TELEX_V01)" />
            <map value="0x04" message="$(string.PbmNumPlan.NATIONAL_V01)" />
            <map value="0x05" message="$(string.PbmNumPlan.PRIVATE_V01)" />
          </valueMap>

          <valueMap name="RilNumPlan">
            <map value="0x0" message="$(string.RilNumPlan.UNKNOWN)" />
            <map value="0x1" message="$(string.RilNumPlan.TELEPHONE)" />
            <map value="0x2" message="$(string.RilNumPlan.DATA)" />
            <map value="0x3" message="$(string.RilNumPlan.TELEX)" />
            <map value="0x4" message="$(string.RilNumPlan.NATIONAL)" />
            <map value="0x5" message="$(string.RilNumPlan.PRIVATE)" />
            <map value="0x6" message="$(string.RilNumPlan.ERMES)" />
          </valueMap>

          <valueMap name="PbmAASOperationEnum">
            <map value="0x0" message="$(string.PbmAASOperationEnum.ADD_V01)" />
            <map value="0x1" message="$(string.PbmAASOperationEnum.MODIFY_V01)" />
            <map value="0x2" message="$(string.PbmAASOperationEnum.DELETE_V01)" />
          </valueMap>

          <valueMap name="RilPBAnsOperation">
            <map value="0x0" message="$(string.RilPBAnsOperation.ANSADDED)" />
            <map value="0x1" message="$(string.RilPBAnsOperation.ANSMODIFIED)" />
            <map value="0x2" message="$(string.RilPBAnsOperation.ANSDELETED)" />
          </valueMap>

          <valueMap name="UimRefreshMode">
            <map value="0x00" message="$(string.UimRefreshMode.RESET_V01)" />
            <map value="0x01" message="$(string.UimRefreshMode.INIT_V01)" />
            <map value="0x02" message="$(string.UimRefreshMode.INIT_FCN_V01)" />
            <map value="0x03" message="$(string.UimRefreshMode.FCN_V01)" />
            <map value="0x04" message="$(string.UimRefreshMode.INIT_FULL_FCN_V01)" />
            <map value="0x05" message="$(string.UimRefreshMode.APP_RESET_V01)" />
            <map value="0x06" message="$(string.UimRefreshMode.3G_RESET_V01)" />
          </valueMap>

          <valueMap name="UimRefreshStage">
            <map value="0x00" message="$(string.UimRefreshStage.WAIT_FOR_OK_V01)" />
            <map value="0x01" message="$(string.UimRefreshStage.START_V01)" />
            <map value="0x02" message="$(string.UimRefreshStage.END_WITH_SUCCESS_V01)" />
            <map value="0x03" message="$(string.UimRefreshStage.END_WITH_FAILURE_V01)" />
          </valueMap>

          <valueMap name="RilUiccAppDataChange">
            <map value="0x00" message="$(string.RilUiccAppDataChange.MSISDN)" />
            <map value="0x01" message="$(string.RilUiccAppDataChange.MBDN)" />
            <map value="0x02" message="$(string.RilUiccAppDataChange.EF_CSP_PLMN_UNSET)" />
            <map value="0x03" message="$(string.RilUiccAppDataChange.EF_CSP_PLMN_SET)" />
            <map value="0x04" message="$(string.RilUiccAppDataChange.ESNME)" />
          </valueMap>

          <valueMap name="APPersoNotificationMsgEnum">
            <map value="0x01" message="$(string.APPersoNotificationMsgEnum.PersoCheckState)" />
            <map value="0x02" message="$(string.APPersoNotificationMsgEnum.DePersoState)" />
          </valueMap>

          <valueMap name="RilMsgType">
            <map value="0x10001" message="$(string.RilMsgType.RIL_MSGTYPE_IN_DELIVER)" />
            <map value="0x10002" message="$(string.RilMsgType.RIL_MSGTYPE_IN_STATUS)" />
            <map value="0x10008" message="$(string.RilMsgType.RIL_MSGTYPE_IN_IS637STATUS)" />
            <map value="0x10020" message="$(string.RilMsgType.RIL_MSGTYPE_IN_CDMADELIVER)" />
            <map value="0x20001" message="$(string.RilMsgType.RIL_MSGTYPE_OUT_SUBMIT)" />
            <map value="0x20020" message="$(string.RilMsgType.RIL_MSGTYPE_OUT_CDMASUBMIT)" />
            <map value="0x20002" message="$(string.RilMsgType.RIL_MSGTYPE_BC_GENERAL)" />
          </valueMap>

          <valueMap name="SMSFormat">
            <map value="0x01" message="$(string.SMSFormat.3GPP)" />
            <map value="0x02" message="$(string.SMSFormat.3GPP2)" />
          </valueMap>

          <valueMap name="WmsMessageMode">
            <map value="0x00" message="$(string.WmsMessageMode.CDMA)" />
            <map value="0x02" message="$(string.WmsMessageMode.GW)" />
          </valueMap>

          <valueMap name="RilMsgEncoding">
            <map value="0x02" message="$(string.RilMsgEncoding.7BITASCII)" />
            <map value="0x03" message="$(string.RilMsgEncoding.UNICODE)" />
            <map value="0x04" message="$(string.RilMsgEncoding.7BITGSM)" />
            <map value="0x05" message="$(string.RilMsgEncoding.8BITGSM)" />
            <map value="0x06" message="$(string.RilMsgEncoding.OCTET)" />
            <map value="0x07" message="$(string.RilMsgEncoding.IA5)" />
          </valueMap>

          <valueMap name="RilMsgPriority">
            <map value="0x01" message="$(string.RilMsgPriority.NORMAL)" />
            <map value="0x02" message="$(string.RilMsgPriority.HIGH)" />
            <map value="0x03" message="$(string.RilMsgPriority.URGENT)" />
            <map value="0x04" message="$(string.RilMsgPriority.EMERGENCY)" />
          </valueMap>

          <valueMap name="RilMsgPrivacy">
            <map value="0x01" message="$(string.RilMsgPrivacy.NOTRESTRICTED)" />
            <map value="0x02" message="$(string.RilMsgPrivacy.RESTRICTED)" />
            <map value="0x03" message="$(string.RilMsgPrivacy.CONFIDENTIAL)" />
            <map value="0x04" message="$(string.RilMsgPrivacy.SECRET)" />
          </valueMap>

          <valueMap name="WmsTeleservice">
            <map value="0x1000" message="$(string.WmsTeleservice.CMT_91)" />
            <map value="0x1001" message="$(string.WmsTeleservice.CPT_95)" />
            <map value="0x1002" message="$(string.WmsTeleservice.CMT_95)" />
            <map value="0x1003" message="$(string.WmsTeleservice.VMN_95)" />
            <map value="0x1004" message="$(string.WmsTeleservice.WAP)" />
            <map value="0x1005" message="$(string.WmsTeleservice.WEMT)" />
            <map value="0x1006" message="$(string.WmsTeleservice.SCPT)" />
            <map value="0x1007" message="$(string.WmsTeleservice.CATPT)" />
            <map value="0x1008" message="$(string.WmsTeleservice.GSM1x_01)" />
            <map value="0x1009" message="$(string.WmsTeleservice.GSM1x_02)" />
            <map value="0x100A" message="$(string.WmsTeleservice.GSM1x_03)" />
            <map value="0x100B" message="$(string.WmsTeleservice.GSM1x_04)" />
            <map value="0x100C" message="$(string.WmsTeleservice.GSM1x_05)" />
            <map value="0x100D" message="$(string.WmsTeleservice.GSM1x_06)" />
            <map value="0x100E" message="$(string.WmsTeleservice.GSM1x_07)" />
            <map value="0x100F" message="$(string.WmsTeleservice.GSM1x_08)" />
            <map value="0x1010" message="$(string.WmsTeleservice.GSM1x_09)" />
            <map value="0x1011" message="$(string.WmsTeleservice.GSM1x_10)" />
            <map value="0x1092" message="$(string.WmsTeleservice.IMSST)" />
            <map value="0xFDED" message="$(string.WmsTeleservice.SELFREG)" />
            <map value="0x10000" message="$(string.WmsTeleservice.IS91_PAGE)" />
            <map value="0x20000" message="$(string.WmsTeleservice.IS91_VOICE_MAIL)" />
            <map value="0x30000" message="$(string.WmsTeleservice.IS91_SHORT_MESSAGE)" />
            <map value="0x40000" message="$(string.WmsTeleservice.MWI)" />
            <map value="0x50000" message="$(string.WmsTeleservice.BROADCAST)" />
            <map value="0x0FFFFFFF" message="$(string.WmsTeleservice.UNKNOWN)" />
          </valueMap>

          <valueMap name="RilMsgDcsIndication">
            <map value="0x01" message="$(string.RilMsgDcsIndication.VOICEMAIL)" />
            <map value="0x02" message="$(string.RilMsgDcsIndication.FAX)" />
            <map value="0x03" message="$(string.RilMsgDcsIndication.EMAIL)" />
            <map value="0x04" message="$(string.RilMsgDcsIndication.OTHER)" />
          </valueMap>

          <valueMap name="RilMsgDcsMsgClass">
            <map value="0x01" message="$(string.RilMsgDcsMsgClass.MSGCLASS_0)" />
            <map value="0x02" message="$(string.RilMsgDcsMsgClass.MSGCLASS_1)" />
            <map value="0x03" message="$(string.RilMsgDcsMsgClass.MSGCLASS_2)" />
            <map value="0x04" message="$(string.RilMsgDcsMsgClass.MSGCLASS_3)" />
          </valueMap>

          <valueMap name="RilMsgDcsType">
            <map value="0x01" message="$(string.RilMsgDcsType.GENERAL)" />
            <map value="0x02" message="$(string.RilMsgDcsType.MSGWAIT)" />
            <map value="0x03" message="$(string.RilMsgDcsType.MSGCLASS)" />
            <map value="0x04" message="$(string.RilMsgDcsType.LANGUAGE)" />
          </valueMap>

          <valueMap name="RilMsgVPFormat">
            <map value="0x00" message="$(string.RilMsgVPFormat.NONE)" />
            <map value="0x01" message="$(string.RilMsgVPFormat.RELATIVE)" />
            <map value="0x02" message="$(string.RilMsgVPFormat.ENHANCED)" />
            <map value="0x03" message="$(string.RilMsgVPFormat.ABSOLUTE)" />
          </valueMap>

          <valueMap name="RilSubAddrType">
            <map value="0x01" message="$(string.RilSubAddrType.NSAP)" />
            <map value="0x02" message="$(string.RilSubAddrType.USER)" />
          </valueMap>

          <valueMap name="WmsSubAddrType">
            <map value="0x00" message="$(string.WmsSubAddrType.NSAP)" />
            <map value="0x01" message="$(string.WmsSubAddrType.USER_SPECIFIED)" />
            <map value="0x02" message="$(string.WmsSubAddrType.UNKNOWN)" />
          </valueMap>

          <valueMap name="SourceType">
            <map value="0x00" message="$(string.SourceType.QMI)" />
            <map value="0x01" message="$(string.SourceType.APPerso)" />
          </valueMap>

          <valueMap name="QmiWMSMessageReq">
            <map value="0x0000" message="$(string.QmiWMSMessageReq.ResetReq)" />
            <map value="0x0001" message="$(string.QmiWMSMessageReq.SetEventReportReq)" />
            <map value="0x0020" message="$(string.QmiWMSMessageReq.RawSendReq)" />
            <map value="0x0021" message="$(string.QmiWMSMessageReq.RawWriteReq)" />
            <map value="0x0022" message="$(string.QmiWMSMessageReq.RawReadReq)" />
            <map value="0x0023" message="$(string.QmiWMSMessageReq.ModifyTagReq)" />
            <map value="0x0024" message="$(string.QmiWMSMessageReq.DeleteReq)" />
            <map value="0x0030" message="$(string.QmiWMSMessageReq.GetMsgProtocolReq)" />
            <map value="0x0031" message="$(string.QmiWMSMessageReq.ListMsgsReq)" />
            <map value="0x0032" message="$(string.QmiWMSMessageReq.SetRoutesReq)" />
            <map value="0x0033" message="$(string.QmiWMSMessageReq.GetRoutesReq)" />
            <map value="0x0034" message="$(string.QmiWMSMessageReq.GetSMSCAddrReq)" />
            <map value="0x0035" message="$(string.QmiWMSMessageReq.SetSMSCAddrReq)" />
            <map value="0x0036" message="$(string.QmiWMSMessageReq.GetStoreMaxSizeReq)" />
            <map value="0x0037" message="$(string.QmiWMSMessageReq.SendAckReq)" />
            <map value="0x0038" message="$(string.QmiWMSMessageReq.SetRetryPeriodReq)" />
            <map value="0x0039" message="$(string.QmiWMSMessageReq.SetRetryIntervalReq)" />
            <map value="0x003A" message="$(string.QmiWMSMessageReq.SetDCDisconnectTimerReq)" />
            <map value="0x003B" message="$(string.QmiWMSMessageReq.SetMemoryStatusReq)" />
            <map value="0x003C" message="$(string.QmiWMSMessageReq.SetBCActivationReq)" />
            <map value="0x003D" message="$(string.QmiWMSMessageReq.SetBCConfigReq)" />
            <map value="0x003E" message="$(string.QmiWMSMessageReq.GetBCConfigReq)" />
            <map value="0x0040" message="$(string.QmiWMSMessageReq.GetDomainPrefReq)" />
            <map value="0x0041" message="$(string.QmiWMSMessageReq.SetDomainPrefReq)" />
            <map value="0x0042" message="$(string.QmiWMSMessageReq.SendFromMemStoreReq)" />
            <map value="0x0043" message="$(string.QmiWMSMessageReq.GetMsgWaitingReq)" />
            <map value="0x0045" message="$(string.QmiWMSMessageReq.SetPrimaryClientReq)" />
            <map value="0x0047" message="$(string.QmiWMSMessageReq.IndRegReq)" />
            <map value="0x0048" message="$(string.QmiWMSMessageReq.GetTLInfoReq)" />
            <map value="0x004A" message="$(string.QmiWMSMessageReq.GetTransportNWRegInfoReq)" />
            <map value="0x004C" message="$(string.QmiWMSMessageReq.BindSubscriptionReq)" />
            <map value="0x004D" message="$(string.QmiWMSMessageReq.GetIndRegReq)" />
            <map value="0x004E" message="$(string.QmiWMSMessageReq.GetSMSParamsReq)" />
            <map value="0x004F" message="$(string.QmiWMSMessageReq.SetSMSParamsReq)" />
          </valueMap>

          <valueMap name="QmiWMSMessageResp">
            <map value="0x0000" message="$(string.QmiWMSMessageResp.ResetResp)" />
            <map value="0x0001" message="$(string.QmiWMSMessageResp.SetEventReportResp)" />
            <map value="0x0020" message="$(string.QmiWMSMessageResp.RawSendResp)" />
            <map value="0x0021" message="$(string.QmiWMSMessageResp.RawWriteResp)" />
            <map value="0x0022" message="$(string.QmiWMSMessageResp.RawReadResp)" />
            <map value="0x0023" message="$(string.QmiWMSMessageResp.ModifyTagResp)" />
            <map value="0x0024" message="$(string.QmiWMSMessageResp.DeleteResp)" />
            <map value="0x0030" message="$(string.QmiWMSMessageResp.GetMsgProtocolResp)" />
            <map value="0x0031" message="$(string.QmiWMSMessageResp.ListMsgsResp)" />
            <map value="0x0032" message="$(string.QmiWMSMessageResp.SetRoutesResp)" />
            <map value="0x0033" message="$(string.QmiWMSMessageResp.GetRoutesResp)" />
            <map value="0x0034" message="$(string.QmiWMSMessageResp.GetSMSCAddrResp)" />
            <map value="0x0035" message="$(string.QmiWMSMessageResp.SetSMSCAddrResp)" />
            <map value="0x0036" message="$(string.QmiWMSMessageResp.GetStoreMaxSizeResp)" />
            <map value="0x0037" message="$(string.QmiWMSMessageResp.SendAckResp)" />
            <map value="0x0038" message="$(string.QmiWMSMessageResp.SetRetryPeriodResp)" />
            <map value="0x0039" message="$(string.QmiWMSMessageResp.SetRetryIntervalResp)" />
            <map value="0x003A" message="$(string.QmiWMSMessageResp.SetDCDisconnectTimerResp)" />
            <map value="0x003B" message="$(string.QmiWMSMessageResp.SetMemoryStatusResp)" />
            <map value="0x003C" message="$(string.QmiWMSMessageResp.SetBCActivationResp)" />
            <map value="0x003D" message="$(string.QmiWMSMessageResp.SetBCConfigResp)" />
            <map value="0x003E" message="$(string.QmiWMSMessageResp.GetBCConfigResp)" />
            <map value="0x0040" message="$(string.QmiWMSMessageResp.GetDomainPrefResp)" />
            <map value="0x0041" message="$(string.QmiWMSMessageResp.SetDomainPrefResp)" />
            <map value="0x0042" message="$(string.QmiWMSMessageResp.SendFromMemStoreResp)" />
            <map value="0x0043" message="$(string.QmiWMSMessageResp.GetMsgWaitingResp)" />
            <map value="0x0045" message="$(string.QmiWMSMessageResp.SetPrimaryClientResp)" />
            <map value="0x0047" message="$(string.QmiWMSMessageResp.IndRegResp)" />
            <map value="0x0048" message="$(string.QmiWMSMessageResp.GetTLInfoResp)" />
            <map value="0x004A" message="$(string.QmiWMSMessageResp.GetTransportNWRegInfoResp)" />
            <map value="0x004C" message="$(string.QmiWMSMessageResp.BindSubscriptionResp)" />
            <map value="0x004D" message="$(string.QmiWMSMessageResp.GetIndRegResp)" />
            <map value="0x004E" message="$(string.QmiWMSMessageResp.GetSMSParamsResp)" />
            <map value="0x004F" message="$(string.QmiWMSMessageResp.SetSMSParamsResp)" />
          </valueMap>

          <valueMap name="QmiWMSMessageInd">
            <map value="0x0001" message="$(string.QmiWMSMessageInd.EventReportInd)" />
            <map value="0x003F" message="$(string.QmiWMSMessageInd.MemFullInd)" />
            <map value="0x0044" message="$(string.QmiWMSMessageInd.MessageWaitingInd)" />
            <map value="0x0046" message="$(string.QmiWMSMessageInd.SMSCAddrInd)" />
            <map value="0x0049" message="$(string.QmiWMSMessageInd.TLInfoInd)" />
            <map value="0x004B" message="$(string.QmiWMSMessageInd.NWRegInfoInd)" />
            <map value="0x0050" message="$(string.QmiWMSMessageInd.CallStatusInd)" />
          </valueMap>
          <valueMap name="QmiServiceType">
            <map value="0x00" message="$(string.QmiServiceType.QMIDMSService)" />
            <map value="0x01" message="$(string.QmiServiceType.QMINASService)" />
            <map value="0x02" message="$(string.QmiServiceType.QMIWMSService)" />
            <map value="0x03" message="$(string.QmiServiceType.QMIVoiceService)" />
            <map value="0x04" message="$(string.QmiServiceType.QMICATService)" />
            <map value="0x05" message="$(string.QmiServiceType.QMIUIMService)" />
            <map value="0x06" message="$(string.QmiServiceType.QMIPBMService)" />
            <map value="0x07" message="$(string.QmiServiceType.QMISARService)" />
            <map value="0x08" message="$(string.QmiServiceType.QMIIMSService)" />
          </valueMap>

          <valueMap name="WmsMessageFormat">
            <map value="0x00" message="$(string.WmsMessageFormat.CDMA)" />
            <map value="0x06" message="$(string.WmsMessageFormat.GWPP)" />
            <map value="0x07" message="$(string.WmsMessageFormat.GWBC)" />
            <map value="0x08" message="$(string.WmsMessageFormat.MWI)" />
          </valueMap>

          <valueMap name="GeoScope">
            <map value="0x00" message="$(string.GeoScope.NONE)" />
            <map value="0x01" message="$(string.GeoScope.CELL_IMMEDIATE)" />
            <map value="0x02" message="$(string.GeoScope.LOCATIONAREA)" />
            <map value="0x03" message="$(string.GeoScope.PLMN)" />
            <map value="0x04" message="$(string.GeoScope.CELL)" />
          </valueMap>

          <valueMap name="TLParamID">
            <map value="0x00" message="$(string.TLParamID.TeleserviceID)" />
            <map value="0x01" message="$(string.TLParamID.BCSrvCategory)" />
            <map value="0x02" message="$(string.TLParamID.OrigAddr)" />
            <map value="0x03" message="$(string.TLParamID.OrigSubAddr)" />
            <map value="0x04" message="$(string.TLParamID.DestAddr)" />
            <map value="0x05" message="$(string.TLParamID.DestSubAddr)" />
            <map value="0x06" message="$(string.TLParamID.BearerReplyOption)" />
            <map value="0x07" message="$(string.TLParamID.CauseCodes)" />
            <map value="0x08" message="$(string.TLParamID.BearerData)" />
          </valueMap>

          <valueMap name="TLMessageType">
            <map value="0x00" message="$(string.TLMessageType.PointToPoint)" />
            <map value="0x01" message="$(string.TLMessageType.BroadCast)" />
            <map value="0x02" message="$(string.TLMessageType.Ack)" />
          </valueMap>

          <valueMap name="BDParamID">
            <map value="0x00" message="$(string.BDParamID.BDMsgID)" />
            <map value="0x01" message="$(string.BDParamID.BDUserData)" />
            <map value="0x02" message="$(string.BDParamID.BDUserResp)" />
            <map value="0x03" message="$(string.BDParamID.BDMCTime)" />
            <map value="0x04" message="$(string.BDParamID.BDValidityAbs)" />
            <map value="0x05" message="$(string.BDParamID.BDValidityRel)" />
            <map value="0x06" message="$(string.BDParamID.BDDeliveryAbs)" />
            <map value="0x07" message="$(string.BDParamID.BDDeliveryRel)" />
            <map value="0x08" message="$(string.BDParamID.BDPriority)" />
            <map value="0x09" message="$(string.BDParamID.BDPrivacy)" />
            <map value="0x0A" message="$(string.BDParamID.BDReplyOption)" />
            <map value="0x0B" message="$(string.BDParamID.BDNumOfMessages)" />
            <map value="0x0C" message="$(string.BDParamID.BDAlert)" />
            <map value="0x0D" message="$(string.BDParamID.BDLanguage)" />
            <map value="0x0E" message="$(string.BDParamID.BDCallback)" />
            <map value="0x0F" message="$(string.BDParamID.BDDisplayIndex)" />
            <map value="0x10" message="$(string.BDParamID.BDMultipleUserData)" />
            <map value="0x11" message="$(string.BDParamID.BDDepositIndex)" />
            <map value="0x12" message="$(string.BDParamID.BDSCPTData)" />
            <map value="0x13" message="$(string.BDParamID.BDSCPTResult)" />
            <map value="0x14" message="$(string.BDParamID.BDDeliveryStatus)" />
            <map value="0x55" message="$(string.BDParamID.BDIPAddress)" />
            <map value="0x56" message="$(string.BDParamID.BDRSNNoNotify)" />
            <map value="0x57" message="$(string.BDParamID.BDESN)" />
          </valueMap>

          <valueMap name="WmsEncoding">
            <map value="0x00" message="$(string.WmsEncoding.OCTET)" />
            <map value="0x01" message="$(string.WmsEncoding.IS91EP)" />
            <map value="0x02" message="$(string.WmsEncoding.ASCII)" />
            <map value="0x03" message="$(string.WmsEncoding.IA5)" />
            <map value="0x04" message="$(string.WmsEncoding.UNICODE)" />
            <map value="0x05" message="$(string.WmsEncoding.SHIFT_JIS)" />
            <map value="0x06" message="$(string.WmsEncoding.KOREAN)" />
            <map value="0x07" message="$(string.WmsEncoding.LATIN_HEBREW)" />
            <map value="0x08" message="$(string.WmsEncoding.LATIN)" />
            <map value="0x09" message="$(string.WmsEncoding.GSM_7_BIT_DEFAULT)" />
          </valueMap>

          <valueMap name="WmsMsgProtocol">
            <map value="0x00" message="$(string.WmsMsgProtocol.CDMA)" />
            <map value="0x01" message="$(string.WmsMsgProtocol.WCDMA)" />
          </valueMap>

          <valueMap name="RilWarningType">
            <map value="0x00" message="$(string.RilWarningType.EARTHQUAKE)" />
            <map value="0x01" message="$(string.RilWarningType.TSUNAMI)" />
            <map value="0x02" message="$(string.RilWarningType.EARTHQUAKETSUNAMI)" />
            <map value="0x03" message="$(string.RilWarningType.TEST)" />
            <map value="0x04" message="$(string.RilWarningType.OTHER)" />
            <map value="0x05" message="$(string.RilWarningType.RESERVED)" />
          </valueMap>

          <valueMap name="WmsETWSNotifType">
            <map value="0x00" message="$(string.WmsETWSNotifType.PRIMARY)" />
            <map value="0x01" message="$(string.WmsETWSNotifType.SECONDARY_GSM)" />
            <map value="0x02" message="$(string.WmsETWSNotifType.SECONDARY_UMTS)" />
          </valueMap>

          <valueMap name="QmiNasServiceStatus">
            <map value="0x00" message="$(string.QmiNasServiceStatus.NoService)" />
            <map value="0x01" message="$(string.QmiNasServiceStatus.Limited)" />
            <map value="0x02" message="$(string.QmiNasServiceStatus.ServiceAvailable)" />
            <map value="0x03" message="$(string.QmiNasServiceStatus.LimitedRegional)" />
            <map value="0x04" message="$(string.QmiNasServiceStatus.PowerSave)" />
          </valueMap>

          <valueMap name="QmiNasPreferredDataPath">
            <map value="0x00" message="$(string.QmiNasPreferredDataPath.NotPreferred)" />
            <map value="0x01" message="$(string.QmiNasPreferredDataPath.Preferred)" />
          </valueMap>

          <valueMap name="QmiNasServiceDomain">
            <map value="0x00" message="$(string.QmiNasServiceDomain.NoService)" />
            <map value="0x01" message="$(string.QmiNasServiceDomain.CSOnly)" />
            <map value="0x02" message="$(string.QmiNasServiceDomain.PSOnly)" />
            <map value="0x03" message="$(string.QmiNasServiceDomain.CSPS)" />
            <map value="0x04" message="$(string.QmiNasServiceDomain.Camped)" />
          </valueMap>

          <valueMap name="QmiNasRoamStatus">
            <map value="0x00" message="$(string.QmiNasRoamStatus.Off)" />
            <map value="0x01" message="$(string.QmiNasRoamStatus.On)" />
            <map value="0x02" message="$(string.QmiNasRoamStatus.Blink)" />
            <map value="0x03" message="$(string.QmiNasRoamStatus.OutOfNeighborhood)" />
            <map value="0x04" message="$(string.QmiNasRoamStatus.OutOfBuilding)" />
            <map value="0x05" message="$(string.QmiNasRoamStatus.PrefSys)" />
            <map value="0x06" message="$(string.QmiNasRoamStatus.AvailSys)" />
            <map value="0x07" message="$(string.QmiNasRoamStatus.AlliancePartner)" />
            <map value="0x08" message="$(string.QmiNasRoamStatus.PremiumPartner)" />
            <map value="0x09" message="$(string.QmiNasRoamStatus.FullService)" />
            <map value="0x0A" message="$(string.QmiNasRoamStatus.PartialService)" />
            <map value="0x0B" message="$(string.QmiNasRoamStatus.BannerOn)" />
            <map value="0x0C" message="$(string.QmiNasRoamStatus.BannerOff)" />
          </valueMap>

          <valueMap name="QmiNasHdrActiveProtocol">
            <map value="0x00" message="$(string.QmiNasHdrActiveProtocol.None)" />
            <map value="0x02" message="$(string.QmiNasHdrActiveProtocol.Rel0)" />
            <map value="0x03" message="$(string.QmiNasHdrActiveProtocol.RelA)" />
            <map value="0x04" message="$(string.QmiNasHdrActiveProtocol.RelB)" />
          </valueMap>

          <valueMap name="QmiNasHsCallStatus">
            <map value="0x00" message="$(string.QmiNasHsCallStatus.HsdpaHsupaUnsupported)" />
            <map value="0x01" message="$(string.QmiNasHsCallStatus.HsdpaSupported)" />
            <map value="0x02" message="$(string.QmiNasHsCallStatus.HsupaSupported)" />
            <map value="0x03" message="$(string.QmiNasHsCallStatus.HsdpaHsupaSupported)" />
            <map value="0x04" message="$(string.QmiNasHsCallStatus.HsdpaPlusSupported)" />
            <map value="0x05" message="$(string.QmiNasHsCallStatus.HsdpaPlusHsupaSupported)" />
            <map value="0x06" message="$(string.QmiNasHsCallStatus.DualCellHsdpaPlusSupported)" />
            <map value="0x07" message="$(string.QmiNasHsCallStatus.DualCellHsdpaPlusHsupaSupported)" />
            <map value="0x08" message="$(string.QmiNasHsCallStatus.DualCellHsdpaPlus64QamHsupaSupported)" />
            <map value="0x09" message="$(string.QmiNasHsCallStatus.DualCellHsdpaPlus64QamSupported)" />
          </valueMap>

          <valueMap name="UiccServiceEnum">
            <map value="0x01" message="$(string.UiccServiceEnum.FDN)" />
            <map value="0x02" message="$(string.UiccServiceEnum.BDN)" />
            <map value="0x03" message="$(string.UiccServiceEnum.ACL)" />
          </valueMap>

          <valueMap name="UiccServiceStateEnum">
            <map value="0x00" message="$(string.UiccServiceStateEnum.NotAvailable)" />
            <map value="0x01" message="$(string.UiccServiceStateEnum.Disabled)" />
            <map value="0x02" message="$(string.UiccServiceStateEnum.Enabled)" />
          </valueMap>

          <valueMap name="UiccKeyRefEnum">
            <map value="0x00" message="$(string.UiccKeyRefEnum.ALW)" />
            <map value="0x01" message="$(string.UiccKeyRefEnum.PIN1)" />
            <map value="0x10" message="$(string.UiccKeyRefEnum.UPIN)" />
            <map value="0x81" message="$(string.UiccKeyRefEnum.PIN2)" />
            <map value="0xff" message="$(string.UiccKeyRefEnum.NEV)" />
          </valueMap>

        </maps>


        <templates>
          <!-- Use this template if the event has no user data -->
          <template tid="tEmpty" />

          <template tid="tDriverVersion">
            <data name="IHVRILMajorVersion" inType="win:UInt16" />
            <data name="WMRILVersion" inType="win:UInt8" />
            <data name="CISubmissionCount" inType="win:UInt8" />
            <data name="BranchPatchNumber" inType="win:UInt8" />
          </template>


          <template tid="tSystemType">
            <data name="Day" inType="win:UInt32" map="RIL_SYSTEMTYPE" />
          </template>

          <template tid="tAnsiStringAndSystemType">
            <data name="szString" inType="win:AnsiString" />
            <data name="Day" inType="win:UInt32" map="RIL_SYSTEMTYPE" />
          </template>

          <template tid="tWord">
            <data name="wCode" inType="win:UInt16" outType="win:HexInt16" />
          </template>

          <template tid="tDword">
            <data name="dwCode" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="t2Dwords">
            <data name="dwCode1" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwCode2" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="t2WordsAnd2Dwords">
            <data name="wCode1" inType="win:UInt16" outType="win:HexInt16" />
            <data name="wCode2" inType="win:UInt16" outType="win:HexInt16" />
            <data name="dwCode3" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwCode4" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tUInt8">
            <data name="dwCode" inType="win:UInt8" />
          </template>

          <template tid="t2UInt8">
            <data name="dwCode1" inType="win:UInt8" />
            <data name="dwCode2" inType="win:UInt8" />
          </template>

          <template tid="tUInt16">
            <data name="dwCode1" inType="win:UInt16" />
          </template>

          <template tid="t2UInt16">
            <data name="dwCode1" inType="win:UInt16" />
            <data name="dwCode2" inType="win:UInt16" />
          </template>

          <template tid="tUInt32">
            <data name="dwCode" inType="win:UInt32" />
          </template>

          <template tid="t2UInt32">
            <data name="dwCode1" inType="win:UInt32" />
            <data name="dwCode2" inType="win:UInt32" />
          </template>

          <template tid="t3UInt32">
            <data name="dwCode1" inType="win:UInt32" />
            <data name="dwCode2" inType="win:UInt32" />
            <data name="dwCode3" inType="win:UInt32" />
          </template>

          <template tid="t4UInt32">
            <data name="dwCode1" inType="win:UInt32" />
            <data name="dwCode2" inType="win:UInt32" />
            <data name="dwCode3" inType="win:UInt32" />
            <data name="dwCode4" inType="win:UInt32" />
          </template>

          <template tid="t6UInt32">
            <data name="dwCode1" inType="win:UInt32" />
            <data name="dwCode2" inType="win:UInt32" />
            <data name="dwCode3" inType="win:UInt32" />
            <data name="dwCode4" inType="win:UInt32" />
            <data name="dwCode5" inType="win:UInt32" />
            <data name="dwCode6" inType="win:UInt32" />
          </template>

          <template tid="t3UInt32AndUnicodeString">
            <data name="dwCode1" inType="win:UInt32" />
            <data name="dwCode2" inType="win:UInt32" />
            <data name="dwCode3" inType="win:UInt32" />
            <data name="szString" inType="win:UnicodeString" />
          </template>

          <template tid="tUInt8AndtUInt32">
            <data name="dwCode1" inType="win:UInt8" />
            <data name="dwCode2" inType="win:UInt32" />
          </template>

          <template tid="tAnsiAndUInt32">
            <data name="szString" inType="win:AnsiString" />
            <data name="dwCode" inType="win:UInt32" />
          </template>

          <template tid="tUnicodeAndUInt32">
            <data name="szString" inType="win:UnicodeString" />
            <data name="dwCode" inType="win:UInt32" />
          </template>

          <template tid="tBoolean">
            <data name="boolValue" inType="win:Boolean" />
          </template>

          <template tid="t2Boolean">
            <data name="boolValue1" inType="win:Boolean" />
            <data name="boolValue2" inType="win:Boolean" />
          </template>

          <template tid="tClientIdPayloadSize">
            <data name="Client id" inType="win:UInt32" />
            <data name="Payload size" inType="win:UInt32" />
          </template>

          <template tid="tCmdIdandHRESULT">
            <data name="Command id" inType="win:UInt32" />
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" map="RIL_HRESULT"/>
          </template>

          <template tid="tCmdIdandHRESULTandCause">
            <data name="Command id" inType="win:UInt32" />
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" map="RIL_HRESULT"/>
            <data name="Cause" inType="win:UInt32" />
          </template>

          <template tid="tBroadcastNotification">
            <data name="Notification" inType="win:UInt32" outType="win:HexInt32" map="RIL_Notification"/>
            <data name="Payload size" inType="win:UInt32" />
          </template>

          <template tid="tQmiMessage">
            <data name="QMI Message" inType="win:UInt32" map="QmiMessage"/>
          </template>

          <template tid="tCommandName">
            <data name="Command" inType="win:UInt32" map="CommandName"/>
          </template>

          <template tid="tMsgWaitingIndication">
            <data name="Msg_Wait_Ind" inType="win:UInt32" map="RilMsgDcsIndication" />
          </template>

          <template tid="tMsgDcsMsgClass">
            <data name="Msg_Class" inType="win:UInt32" map="RilMsgDcsMsgClass" />
          </template>

          <template tid="tMsgDcsType">
            <data name="Msg_Type" inType="win:UInt32" map="RilMsgDcsType" />
          </template>

          <template tid="tRilMsgVPFormat">
            <data name="Msg_VPFormat" inType="win:UInt32" map="RilMsgVPFormat" />
          </template>

          <template tid="tSubAddrAddressParams">
            <data name="wszAddress" inType="win:UnicodeString"  length="256" />
            <data name="Number_Of_Digits" inType="win:UInt8" />
            <data name="dwParams" inType="win:UInt32"  outType="win:HexInt32" />
          </template>

          <template tid="tRilSubAddrParams">
            <data name="cbSize" inType="win:UInt32" />
            <data name="dwType" inType="win:UInt32" map="RilSubAddrType" />
          </template>

          <template tid="tWmsTeleservice">
            <data name="teleservice" inType="win:UInt32" map="WmsTeleservice" />
          </template>

          <template tid="tRilMsgEncoding">
            <data name="encoding" inType="win:UInt32" map="RilMsgEncoding" />
          </template>

          <template tid="tSrvIDAndMsgID">
            <data name="serviceID" inType="win:UInt32" map="QmiServiceType" />
            <data name="dwMessageID" inType="win:UInt32" map="QmiWMSMessageInd" />
          </template>

          <template tid="tSourceType">
            <data name="sourceID" inType="win:UInt32" map="SourceType" />
          </template>

          <template tid="tWmsMessageMode">
            <data name="WmsMessageMode" inType="win:UInt32" map="WmsMessageMode" />
          </template>

          <template tid="tSubscriptionAndMessageMode">
            <data name="dwCode" inType="win:UInt32" outType="win:HexInt32" />
            <data name="WmsMessageMode" inType="win:UInt32" map="WmsMessageMode" />
          </template>

          <template tid="tQmiWmsMessageReq">
            <data name="QmiWmsMessageReq" inType="win:UInt32" map="QmiWMSMessageReq" />
          </template>

          <template tid="tMessageFormat">
            <data name="WmsMessageFormat" inType="win:UInt32" map="WmsMessageFormat" />
          </template>

          <template tid="tRilAddrParams">
            <data name="cbSize" inType="win:UInt32" />
            <data name="RilNumType" inType="win:UInt32" map="RilNumType" />
            <data name="RilNumPlan" inType="win:UInt32" map="RilNumPlan" />
          </template>

          <template tid="tRilTimeParams">
            <data name="Year" inType="win:UInt16" />
            <data name="Month" inType="win:UInt16" />
            <data name="DayOfWeek" inType="win:UInt16" />
            <data name="Day" inType="win:UInt16" />
            <data name="Hour" inType="win:UInt16" />
            <data name="Minute" inType="win:UInt16" />
            <data name="Second" inType="win:UInt16" />
          </template>

          <template tid="tGwBcPageHeader">
            <data name="SerialNumber" inType="win:UInt32" />
            <data name="GeoScope" inType="win:UInt32" map="GeoScope"/>
            <data name="MsgCode" inType="win:UInt32" />
            <data name="UpdateNumber" inType="win:UInt32" />
            <data name="MessageID" inType="win:UInt32" />
            <data name="PageNumber" inType="win:UInt32" />
            <data name="TotalPages" inType="win:UInt32" />
          </template>

          <template tid="tTLParamIDAndMsgLength">
            <data name="ParamID" inType="win:UInt32" map="TLParamID"/>
            <data name="paramLen" inType="win:UInt8" />
            <data name="RawMsgDataLen" inType="win:UInt8" />
          </template>

          <template tid="tTLParamID">
            <data name="ParamID" inType="win:UInt32" map="TLParamID"/>
          </template>

          <template tid="tTLParamIDAndParamLen">
            <data name="ParamID" inType="win:UInt32" map="TLParamID"/>
            <data name="paramLen" inType="win:UInt8" />
          </template>

          <template tid="tSubAddrParams">
            <data name="cbSize" inType="win:UInt32" />
            <data name="dwParams" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwType" inType="win:UInt32"  map="WmsSubAddrType"/>
            <data name="wszAddress" inType="win:UnicodeString" />
          </template>

          <template tid="tTLMessageType">
            <data name="MessageType" inType="win:UInt32" map="TLMessageType"/>
          </template>

          <template tid="tBDParams">
            <data name="BDParamID" inType="win:UInt32" map="BDParamID"/>
            <data name="pos" inType="win:UInt8" />
            <data name="BDParmLen" inType="win:UInt8" />
          </template>

          <template tid="tBDParamID">
            <data name="BDParamID" inType="win:UInt32" map="BDParamID"/>
          </template>

          <template tid="tBDParamIDAndParamLen">
            <data name="BDParamID" inType="win:UInt32" map="BDParamID"/>
            <data name="parmLen" inType="win:UInt8" />
          </template>

          <template tid="tBDInvalidParamLen">
            <data name="BDParamID" inType="win:UInt32" map="BDParamID"/>
            <data name="ParamLen" inType="win:UInt8" />
            <data name="BDLength" inType="win:UInt8" />
          </template>

          <template tid="tWmsEncoding">
            <data name="WmsEncoding" inType="win:UInt32" map="WmsEncoding"/>
          </template>

          <template tid="tIncorrectBDParams">
            <data name="MessageType" inType="win:UInt32" map="TLMessageType"/>
            <data name="ServiceID" inType="win:UInt32" />
            <data name="dwParams" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tBuildMsgAck">
            <data name="TxnID" inType="win:UInt32" />
            <data name="MessageMode" inType="win:UInt32" map="WmsMsgProtocol" />
            <data name="Success" inType="win:UInt8" />
          </template>

          <template tid="tETWSPriMsgParams">
            <data name="SerialNumber" inType="win:UInt32" />
            <data name="GeoScope" inType="win:UInt32" map="GeoScope"/>
            <data name="MsgCode" inType="win:UInt32" />
            <data name="UpdateNumber" inType="win:UInt32" />
            <data name="MessageID" inType="win:UInt32" />
            <data name="WarningType" inType="win:UInt32" map="RilWarningType" />
            <data name="EmerUserAlert" inType="win:Boolean" />
            <data name="MsgPopUp" inType="win:Boolean" />
          </template>

          <template tid="tWmsETWSNotifType">
            <data name="WmsETWSNotifType" inType="win:UInt32" map="WmsETWSNotifType" />
          </template>

          <template tid="tETWSSecMsgParams">
            <data name="SerialNumber" inType="win:UInt32" />
            <data name="GeoScope" inType="win:UInt32" map="GeoScope"/>
            <data name="MsgCode" inType="win:UInt32" />
            <data name="UpdateNumber" inType="win:UInt32" />
            <data name="MessageID" inType="win:UInt32" />
            <data name="WarningType" inType="win:UInt32" map="RilWarningType" />
            <data name="EmerUserAlert" inType="win:Boolean" />
            <data name="MsgPopUp" inType="win:Boolean" />
            <data name="PageNumber" inType="win:UInt32" />
            <data name="TotalPages" inType="win:UInt32" />
          </template>

          <template tid="tRilMsgPriority">
            <data name="RilMsgPriority" inType="win:UInt32" map="RilMsgPriority" />
          </template>

          <template tid="tRilMsgPrivacy">
            <data name="RilMsgPrivacy" inType="win:UInt32" map="RilMsgPrivacy" />
          </template>

          <template tid="tParamTLIDAndMsgLength">
            <data name="TLParamID" inType="win:UInt32" map="TLParamID" />
            <data name="parmLen" inType="win:UInt8" />
            <data name="DataLen" inType="win:UInt32" />
          </template>

          <template tid="tCallCreated">
            <data name="RIL call id" inType="win:UInt32" />
            <data name="Modem call id" inType="win:UInt32" />
            <data name="Direction" inType="win:UInt32" map="QmiVoiceCallDirection" />
            <data name="Is alien call" inType="win:Int32" />
            <data name="Needs RCMI" inType="win:Int32" />
          </template>

          <template tid="tQmiVoiceAllCallStatusInd">
            <data name="call_info_len" inType="win:UInt32" />
            <struct name="call_info" count="call_info_len">
              <data name="call_id" inType="win:UInt32" />
              <data name="call_state" inType="win:Int32" />
              <data name="call_type" inType="win:Int32" />
              <data name="direction" inType="win:Int32" />
              <data name="mode" inType="win:Int32" />
              <data name="is_mpty" inType="win:UInt32" />
              <data name="als" inType="win:Int32" />
            </struct>
            <data name="remote_party_number_valid" inType="win:UInt8" />
            <data name="remote_party_number_len" inType="win:UInt32" />
            <struct name="remote_party_number" count="remote_party_number_len">
              <data name="call_id" inType="win:UInt32" />
              <data name="number_pi" inType="win:Int32" />
              <data name="number_len" inType="win:UInt32" />
              <data name="number" inType="win:AnsiString" length="84"/>
            </struct>
            <data name="call_end_reason_valid" inType="win:UInt8" />
            <data name="call_end_reason_len" inType="win:UInt32" />
            <struct name="call_end_reason" count="call_end_reason_len">
              <data name="call_id" inType="win:UInt32" />
              <data name="call_end_reason" inType="win:UInt32" />
            </struct>
          </template>

          <template tid="tCPINotification">
            <data name="dwParams" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwID" inType="win:UInt32" />
            <data name="dwDirection" inType="win:Int32" />
            <data name="dwStatus" inType="win:Int32" />
            <data name="dwMultiparty" inType="win:Int32" />
            <data name="fAlienCall" inType="win:Int32" />
            <struct name="raAddress">
              <data name="cbSize" inType="win:UInt32" />
              <data name="dwParams" inType="win:UInt32" outType="win:HexInt32" />
              <data name="dwType" inType="win:Int32" />
              <data name="dwNumPlan" inType="win:Int32" />
              <data name="wszAddress" inType="win:UnicodeString"  length="256"/>
            </struct>
            <data name="dwDisconnectInitiator" inType="win:Int32" />
            <data name="dwDisconnectReason" inType="win:Int32" />
            <data name="dwDisconnectGroup" inType="win:Int32" />
            <data name="Cause code union" inType="win:Binary" length="8" />
          </template>

          <template tid="t3GPPTone">
            <data name="GPP Tone" inType="win:UInt32" map="3GPPTone"/>
          </template>

          <template tid="t3GPP2Tone">
            <data name="GPP2 Tone" inType="win:UInt32" map="3GPP2Tone"/>
          </template>

          <template tid="tDwordAndAnsiString">
            <data name="dwErrorCode" inType="win:UInt32" outType="win:HexInt32" />
            <data name="szString" inType="win:AnsiString" />
          </template>

          <template tid="tUnicodeString">
            <data name="szString" inType="win:UnicodeString" />
          </template>

          <template tid="tAnsiString">
            <data name="szString" inType="win:AnsiString" />
          </template>

          <template tid="t2AnsiString">
            <data name="szString1" inType="win:AnsiString" />
            <data name="szString2" inType="win:AnsiString" />
          </template>

          <template tid="tUnicodeStringAndUInt32">
            <data name="szString" inType="win:UnicodeString" />
            <data name="dwCode" inType="win:UInt32" />
          </template>

          <template tid="tAnsiStringAndDword">
            <data name="szString" inType="win:AnsiString" />
            <data name="dwCode" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tAnsiStringAndUnicodeString">
            <data name="szString1" inType="win:AnsiString" />
            <data name="szString2" inType="win:UnicodeString" />
          </template>

          <template tid="tFixedSizeByteArray">
            <data name="buffer" inType="win:UInt8" count="128"/>
          </template>

          <template tid="tVariableSizeByteArray">
            <data name="cbSize" inType="win:UInt32" />
            <data name="buffer" inType="win:UInt8" count="cbSize"/>
          </template>

          <template tid="tUserAppSelectionAndPersoSelection">
            <data name="user_application_selection" inType="win:UInt8" map="UserApplicationSelection" />
            <data name="perso_selection" inType="win:UInt8" map="AppOrModemProcessorPersonalization" />
          </template>

          <template tid="tCardStatus_CARDSTATUS_AppIndexInfo">
            <data name="index_dw_pri" inType="win:UInt16" outType="win:HexInt16" />
            <data name="index_1x_pri" inType="win:UInt16" outType="win:HexInt16" />
            <data name="index_gw_sec" inType="win:UInt16" outType="win:HexInt16" />
            <data name="index_1x_sec" inType="win:UInt16" outType="win:HexInt16" />
          </template>

          <template tid="tCardStatus_CARDINFO_CardState_CardError">
            <data name="card_state" inType="win:UInt32" map="QmiUimCardState" />
            <data name="card_error" inType="win:UInt32" map="QmiUimCardError" />
          </template>

          <template tid="tCardStatus_CARDINFO_Upin">
            <data name="pin_state" inType="win:UInt32" map="QmiUimPinState" />
            <data name="pin_retries" inType="win:UInt8" />
            <data name="puk_retries" inType="win:UInt8" />
          </template>

          <template tid="tCardStatus_APPINFO_AppType_AppState_PersoState_PersoFeature_PersoRetries_PersoUnblockRetires">
            <data name="app_index" inType="win:UInt32" />
            <data name="appTypeStr" inType="win:UInt32" map="QmiUimAppType" />
            <data name="appTypeInt" inType="win:UInt32" />
            <data name="appStateStr" inType="win:UInt32" map="QmiUimAppState" />
            <data name="appStateInt" inType="win:UInt32" />
            <data name="persoStateStr" inType="win:UInt32" map="QmiUimPersoState" />
            <data name="persoStateInt" inType="win:UInt32" />
            <data name="persoFeatureStr" inType="win:UInt32" map="QmiUimPersoFeatureStatus" />
            <data name="persoFeatureInt" inType="win:UInt32" />
            <data name="perso_retries" inType="win:UInt8" />
            <data name="perso_unblock_retires" inType="win:UInt8" />
          </template>

          <template tid="tCardStatus_APPINFO_Aid">
            <data name="aid_value_len" inType="win:UInt32" />
            <data name="aid_value" inType="win:Binary" length="aid_value_len" />
          </template>

          <template tid="tCardStatus_APPINFO_UPINState_PIN1Info_PIN2Info">
            <data name="app_info_upinStr" inType="win:UInt32" map="QmiUimUpinReplacedState" />
            <data name="app_info_upinInt" inType="win:UInt32" />
            <data name="pin1_pin_stateStr" inType="win:UInt32" map="QmiUimPinState" />
            <data name="pin1_pin_stateInt" inType="win:UInt32" />
            <data name="pin1_pin_retries" inType="win:UInt8" />
            <data name="pin1_puk_retries" inType="win:UInt8" />
            <data name="pin2_pin_stateStr" inType="win:UInt32" map="QmiUimPinState" />
            <data name="pin2_pin_stateInt" inType="win:UInt32" />
            <data name="pin2_pin_retries" inType="win:UInt8" />
            <data name="pin2_puk_retries" inType="win:UInt8" />
          </template>

          <template tid="tUiccLockStatusChangeMsg">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwKeyRef" inType="win:UInt32" />
            <data name="oldPINState" inType="win:UInt32" />
            <data name="newPINState" inType="win:UInt32" />
            <data name="oldPINRetries" inType="win:UInt32" />
            <data name="newPINRetries" inType="win:UInt32" />
            <data name="oldPUKRetries" inType="win:UInt32" />
            <data name="newPUKRetries" inType="win:UInt32" />
          </template>

          <template tid="tUiccAppPersoCheckStatusChangeMsg">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwOldPersoCheckState" inType="win:UInt32" map="RILUICCAPPPERSOCHECKSTATUSSTATE" />
            <data name="dwNewPersoCheckState" inType="win:UInt32" map="RILUICCAPPPERSOCHECKSTATUSSTATE" />
            <data name="dwOldPersoFailingFeature" inType="win:UInt32"  map="QmiUimPersoFeatureStatus" />
            <data name="dwNewPersoFailingFeature" inType="win:UInt32"  map="QmiUimPersoFeatureStatus"/>
          </template>

          <template tid="tSetExecutorConfig_InputParams_hUiccApps">
            <data name="dwExecutor" inType="win:UInt32" />
            <data name="dwNumApps" inType="win:UInt32" />
            <data name="lphUiccApps0" inType="win:UInt32" outType="win:HexInt32" />
            <data name="lphUiccApps1" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tRadio_NewBindingInfo">
            <data name="radioType" inType="win:AnsiString"/>
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="sessionTypeStr" inType="win:UInt32" map="UimSessionType"/>
            <data name="sessionTypeInt" inType="win:UInt32" />
          </template>

          <template tid="tNewBindingInfo_VirtualRUIM">
            <data name="ExecutorIndex" inType="win:Int32" />
            <data name="VirtualRUIMhUiccApp" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tNewBindingInfo_hUiccApp_SessionType">
            <data name="ExecutorIndex" inType="win:Int32" />
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="sessionTypeStr" inType="win:UInt32" map="UimSessionType"/>
            <data name="sessionTypeInt" inType="win:UInt32" />
          </template>

          <template tid="tBindingIndex_IoctlState_hUiccApp">
            <data name="FunctionName" inType="win:AnsiString"/>
            <data name="currUnbindingIndex" inType="win:UInt32" />
            <data name="IOCTLStateStr" inType="win:UInt32" map="IOCTLStateType"/>
            <data name="IOCTLStateInt" inType="win:UInt32" />
          </template>

          <template tid="tProcessInternalInd">
            <data name="currentStateStr" inType="win:UInt32" map="IOCTLStateType"/>
            <data name="currentStateInt" inType="win:UInt32" />
          </template>

          <template tid="tProcessInternalIndData">
            <data name="internalIndicationStr" inType="win:UInt32" map="InternalIndicationType"/>
            <data name="internalIndicationInt" inType="win:UInt32" />
          </template>

          <template tid="tRTREControlValue">
            <data name="m_RTREControlStr" inType="win:UInt32" map="RTREControlValueEnum"/>
            <data name="m_RTREControlInt" inType="win:UInt32" />
          </template>

          <template tid="tSlotState">
            <data name="slotIndex" inType="win:UInt32" />
            <data name="SlotStatestr" inType="win:UInt32" map="SlotStateEnum"/>
            <data name="SlotStateInt" inType="win:UInt32" />
          </template>

          <template tid="tAppFound">
            <data name="RILAppIndex" inType="win:UInt32" />
            <data name="slotId" inType="win:UInt32" />
            <data name="appTypeString" inType="win:UInt32" map="QmiUimAppType"/>
          </template>

          <template tid="thUiccApp_AppType">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="appTypeStr" inType="win:UInt32" map="RilUiccAppType"/>
            <data name="appTypeInt" inType="win:UInt32" />
          </template>

          <template tid="tRilAppId">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="appIdLen" inType="win:UInt32" />
            <data name="appId" inType="win:UInt8" outType="win:HexInt8" count="appIdLen"/>
          </template>

          <template tid="tRilAppName">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="appNameLen" inType="win:UInt32" />
            <data name="appName" inType="win:AnsiString"/>
          </template>

          <template tid="tPinRef">
            <data name="pinRef0" inType="win:UInt8" outType="win:HexInt8" />
            <data name="pinRef1" inType="win:UInt8" outType="win:HexInt8"/>
          </template>

          <template tid="tGetUiccRecordStatus">
            <data name="itemCount" inType="win:UInt32" />
            <data name="recordTypeStr" inType="win:UInt32" map="RilUiccRecordType"/>
            <data name="recordTypeInt" inType="win:UInt32" />
            <data name="size" inType="win:UInt32" />
          </template>

          <template tid="tFilePathToConvert">
            <data name="RilFilePathLen" inType="win:UInt32" />
            <data name="RilFilePath" inType="win:UInt16" outType="win:HexInt16" count="RilFilePathLen"/>
          </template>

          <template tid="tFileType_RecordType">
            <data name="fileTypeStr" inType="win:UInt32" map="RilUiccFileType"/>
            <data name="fileTypeInt" inType="win:UInt32" />
            <data name="recordTypeStr" inType="win:UInt32" map="RilUiccRecordType"/>
            <data name="recordTypeInt" inType="win:UInt32" />
          </template>

          <template tid="tOperation_UIMAccessCond_RILAccessCond">
            <data name="operation" inType="win:UnicodeString" />
            <data name="UimAccessConditionStr" inType="win:UInt32" map="UimAccessConditionType"/>
            <data name="UimAccessConditionInt" inType="win:UInt32" />
            <data name="RilAccessConditionStr" inType="win:UInt32" map="RilAccessConditionType"/>
            <data name="RilAccessConditionInt" inType="win:UInt32" />
          </template>

          <template tid="tOperationNotIncluded">
            <data name="operation" inType="win:UnicodeString" />
            <data name="UimAccessConditionStr" inType="win:UInt32" map="UimAccessConditionType"/>
            <data name="UimAccessConditionInt" inType="win:UInt32" />
            <data name="securityMask" inType="win:UInt16" outType="win:HexInt16" />
          </template>

          <template tid="tByteDump">
            <data name="Length" inType="win:UInt32" />
            <data name="ByteDump" inType="win:UInt8" outType="win:HexInt8" count="Length"/>
          </template>

          <template tid="tCardResult">
            <data name="sw1" inType="win:UInt8" outType="win:HexInt8" />
            <data name="sw2" inType="win:UInt8" outType="win:HexInt8"/>
          </template>

          <template tid="tMcc_Imsi1112_ImsiS2_ImsiS1">
            <data name="MCC" inType="win:AnsiString" />
            <data name="IMSI_11_12" inType="win:AnsiString" />
            <data name="IMSI_S2" inType="win:AnsiString" />
            <data name="IMSI_S1" inType="win:AnsiString" />
          </template>

          <template tid="tImsiValue">
            <data name="len" inType="win:UInt32" />
            <data name="IMSI" inType="win:AnsiString"/>
          </template>

          <template tid="tImsiValue_ProcessGWIMSI">
            <data name="len" inType="win:UInt32" />
            <data name="wszImsi" inType="win:UnicodeString"/>
          </template>

          <template tid="tMcc_Imsi1112_Digits1112_S2_S1Second3Digits_S1Last3Digits">
            <data name="MCC" inType="win:AnsiString" />
            <data name="Digits_11_12" inType="win:AnsiString" />
            <data name="S2" inType="win:AnsiString" />
            <data name="S1_Second3Digits" inType="win:AnsiString" />
            <data name="S1_Last3Digits" inType="win:AnsiString" />
          </template>

          <template tid="tSlotIndex_ATR_Len">
            <data name="dwSlotIndex" inType="win:UInt32" />
            <data name="atr_value_len" inType="win:UInt32" />
            <data name="ATR" inType="win:UInt8" outType="win:HexInt8" count="atr_value_len"/>
          </template>

          <template tid="tCloseUiccLogicalChannelGroup_InputParams">
            <data name="dwSlotIndex" inType="win:UInt32" />
            <data name="ChannelGroupStr" inType="win:UInt32" map="RilUiccChannelGroup"/>
            <data name="ChannelGroupInt" inType="win:UInt32" />
          </template>

          <template tid="tCouldNotFindChannelForGroup">
            <data name="ChannelGroupStr" inType="win:UInt32" map="RilUiccChannelGroup" />
            <data name="ChannelGroupInt" inType="win:UInt32" />
          </template>

          <template tid="tValidStateReqForPinType">
            <data name="PINIDStr" inType="win:UInt32" map="PinIdType"/>
            <data name="PINIDInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="rilAppTypeStr" inType="win:UInt32" map="RilUiccAppType"/>
            <data name="rilAppTypeInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tGetUiccLockStateResp">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="dwKeyRef" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="dwLockState" inType="win:UInt32" />
            <data name="dwVerifyAttemptsLeft" inType="win:UInt32" />
            <data name="dwUnblockAttemptsLeft" inType="win:UInt32" />
          </template>

          <template tid="tQMIResp_Result_Error">
            <data name="Result" inType="win:UInt32" map="ResultType" />
            <data name="ErrorStr" inType="win:UnicodeString" />
            <data name="ErrorInt" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tPinState_PinRetryNo_PUKRetryNo">
            <data name="ExpectedPINStateStr" inType="win:UInt32" map="PinStateType" />
            <data name="ExpectedPINStateInt" inType="win:UInt32" />
            <data name="ExpectedPINRetryNum" inType="win:UInt32" />
            <data name="ExpectedPUKRetryNum" inType="win:UInt32" />
          </template>

          <template tid="tPinState">
            <data name="ExpectedPINStateStr" inType="win:UInt32" map="PinStateType" />
            <data name="ExpectedPINStateInt" inType="win:UInt32" />
          </template>

          <template tid="tValidKeyRef">
            <data name="dwKeyRef" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="RilAppTypeStr" inType="win:UInt32" map="RilUiccAppType" />
            <data name="RilAppTypeInt" inType="win:UInt32" />
          </template>

          <template tid="tPersoFeature_CKRetries_PUKRetries">
            <data name="rilPersoFeatureStr" inType="win:UInt32" map="RilPersoFeatureType" />
            <data name="rilPersoFeatureInt" inType="win:UInt32" />
            <data name="dwNumCKAttemptsLeft" inType="win:UInt32" />
            <data name="dwNumPUKAttemptsLeft" inType="win:UInt32" />
          </template>

          <template tid="tPersoFeature_PersoState_CKRetries_PUKRetries">
            <data name="rilPersoFeatureStr" inType="win:UInt32" map="RilPersoFeatureType" />
            <data name="rilPersoFeatureInt" inType="win:UInt32" />
            <data name="dwDePersoStateStr" inType="win:UInt32" map="RilPersoDeactivationState" />
            <data name="dwDePersoStateInt" inType="win:UInt32" />
            <data name="dwNumCKAttemptsLeft" inType="win:UInt32" />
            <data name="dwNumPUKAttemptsLeft" inType="win:UInt32" />
          </template>

          <template tid="tResponseBlob_ExecutorConfig">
            <data name="dwExecutor" inType="win:UInt32" />
            <data name="dwFlags" inType="win:UInt32" map="RilExecutorFlag" />
            <data name="dwNumApps" inType="win:UInt32" />
            <data name="lphUiccApps0" inType="win:UInt32" outType="win:HexInt32" />
            <data name="lphUiccApps1" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tSupportedFacilities">
            <data name="dwSupportedFacilities" inType="win:UInt32" map="RilPersoLockSupportCaps" />
          </template>

          <template tid="tResult_Huiccapp_PbmSession">
            <data name="result" inType="win:UnicodeString" />
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="pbmSessionStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="pbmSessionInt" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tStoreLoc_PbType">
            <data name="StoreLocStr" inType="win:UInt32" map="StoreLocEnum"/>
            <data name="StoreLocInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="PBMPbTypeStr" inType="win:UInt32" map="PbTypeEnum"/>
            <data name="PBMPbTypeInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tReadRecordsReqParams">
            <data name="pbmSessionTypeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="pbmSessionTypeInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="pb_type" inType="win:UInt16" />
            <data name="record_start_id" inType="win:UInt16" />
            <data name="record_end_id" inType="win:UInt16" />
          </template>

          <template tid="tRcvdReadInd_SessionType_PbType">
            <data name="pbmSessionTypeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="pbmSessionTypeInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="pb_type" inType="win:UInt16" />
          </template>

          <template tid="tPbmNumType_RilNumType">
            <data name="PbmNumTypeStr" inType="win:UInt32" map="PbmNumType"/>
            <data name="PbmNumTypeInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="RilNumTypeStr" inType="win:UInt32" map="RilNumType"/>
            <data name="RilNumTypeInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tPbmNumPlan_RilNumPlan">
            <data name="PbmNumPlanStr" inType="win:UInt32" map="PbmNumPlan"/>
            <data name="PbmNumPlanInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="RilNumPlanStr" inType="win:UInt32" map="RilNumPlan"/>
            <data name="RilNumPlanInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tInputParams">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwStoreLocationStr" inType="win:UInt32" map="StoreLocEnum"/>
            <data name="dwStoreLocationInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="dwStartIndex" inType="win:UInt32" />
            <data name="dwEndIndex" inType="win:UInt32" />
          </template>

          <template tid="tWrite_InputParams">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwStoreLocationStr" inType="win:UInt32" map="StoreLocEnum"/>
            <data name="dwStoreLocationInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tDelete_InputParams">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwStoreLocationStr" inType="win:UInt32" map="StoreLocEnum"/>
            <data name="dwStoreLocationInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="dwIndex" inType="win:UInt32" />
          </template>

          <template tid="tCallingDelRecReq">
            <data name="pb_typeStr" inType="win:UInt32" map="PbTypeEnum"/>
            <data name="pb_typeInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="session_typeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="session_typeInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="record_id" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tCapabilitiesReqParams">
            <data name="session_typeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="session_typeInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="pb_typeStr" inType="win:UInt32" map="PbTypeEnum"/>
            <data name="pb_typeInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tGetPBOptions_PBIParams">
            <data name="dwParams" inType="win:UInt32" map="PBInfoParamMask"/>
          </template>

          <template tid="tWriteAddnNumStr_InputParams">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwNumId" inType="win:UInt32" />
            <data name="wszText" inType="win:UnicodeString" />
          </template>

          <template tid="tSetAASReqData">
            <data name="session_typeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="session_typeInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="operationStr" inType="win:UInt32" map="PbmAASOperationEnum"/>
            <data name="operationInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="aas_id" inType="win:UInt32" />
            <data name="alpha" inType="win:UnicodeString" />
          </template>

          <template tid="tIndicationData">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwOpTypeStr" inType="win:UInt32" map="RilPBAnsOperation"/>
            <data name="dwOpTypeInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="dwNumId" inType="win:UInt32" />
          </template>

          <template tid="tSetAASReqData_DelAddnNumStr">
            <data name="session_typeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="session_typeInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="operationStr" inType="win:UInt32" map="PbmAASOperationEnum"/>
            <data name="operationInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="aas_id" inType="win:UInt32" />
          </template>

          <template tid="tCardNumForSession">
            <data name="emer_nums_len" inType="win:UInt32" />
            <data name="session_typeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="session_typeInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tSessionType_StoreLocBitMask">
            <data name="session_typeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="session_typeInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="dwStoreLocationStr" inType="win:UInt32" map="StoreLocEnum"/>
            <data name="dwStoreLocationInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tSlotStateChanged">
            <data name="currRILSlotStateStr" inType="win:UInt32" map="SlotStateEnum"/>
            <data name="currRILSlotStateInt" inType="win:UInt32" />
            <data name="newRILSlotStateStr" inType="win:UInt32" map="SlotStateEnum"/>
            <data name="newRILSlotStateInt" inType="win:UInt32" />
            <data name="slotId" inType="win:UInt32" />
          </template>

          <template tid="tReportStateUimService">
            <data name="primaryGWQMIProvIndex" inType="win:UInt16" outType="win:HexInt16"/>
            <data name="primary1XQMIProvIndex" inType="win:UInt16" outType="win:HexInt16"/>
            <data name="secondaryGWQMIProvIndex" inType="win:UInt16" outType="win:HexInt16"/>
            <data name="secondary1XQMIProvIndex" inType="win:UInt16" outType="win:HexInt16"/>
            <data name="numSlots" inType="win:UInt32" />
            <data name="CardListSize" inType="win:UInt32" />
          </template>

          <template tid="tLen_Id_Path">
            <data name="path_len" inType="win:UInt32" />
            <data name="file_id" inType="win:UInt16" outType="win:HexInt16"/>
            <data name="path" inType="win:UInt8" outType="win:HexInt8" count="path_len"/>
          </template>

          <template tid="tQmiFilePath_WmrilFilePath">
            <data name="QmiUimPathLen" inType="win:UInt32" />
            <data name="QmiUimPath" inType="win:UInt8" outType="win:HexInt8" count="QmiUimPathLen"/>
            <data name="RilFilePathLen" inType="win:UInt32" />
            <data name="RilFilePath" inType="win:UInt16" outType="win:HexInt16" count="RilFilePathLen"/>
          </template>

          <template tid="tRefreshMode_Stage_Session_NumFiles">
            <data name="modeStr" inType="win:UInt32" map="UimRefreshMode"/>
            <data name="modeInt" inType="win:UInt32" />
            <data name="stageStr" inType="win:UInt32" map="UimRefreshStage"/>
            <data name="stageInt" inType="win:UInt32" />
            <data name="session_typeStr" inType="win:UInt32" map="UimSessionType"/>
            <data name="session_typeInt" inType="win:UInt32"  />
            <data name="NumOfFiles" inType="win:UInt32" />
          </template>

          <template tid="tRefreshFile_Id_PathLen_Path">
            <data name="RefreshFile" inType="win:UInt32" />
            <data name="RefreshFileId" inType="win:UInt16" outType="win:HexInt16"/>
            <data name="RefFilePathLen" inType="win:UInt32" />
            <data name="RefFilePath" inType="win:UInt8" outType="win:HexInt8" count="RefFilePathLen"/>
          </template>

          <template tid="tCardStateForSlot">
            <data name="slotId" inType="win:UInt32" />
            <data name="CardStateStr" inType="win:UInt32" map="QmiUimCardState"/>
            <data name="CardStateInt" inType="win:UInt32" />
          </template>

          <template tid="tCardState_CardError_RilSlotState_Slot">
            <data name="QMICardStateStr" inType="win:UInt32" map="QmiUimCardState"/>
            <data name="QMICardStateInt" inType="win:UInt32" />
            <data name="CardErrorStr" inType="win:UInt32" map="QmiUimCardError"/>
            <data name="CardErrorInt" inType="win:UInt32" />
            <data name="RILSlotStateStr" inType="win:UInt32" map="SlotStateEnum"/>
            <data name="RILSlotStateInt" inType="win:UInt32"  />
            <data name="slotId" inType="win:UInt32" />
          </template>

          <template tid="tCardSlot_FromState_ToState">
            <data name="slotId" inType="win:UInt32" />
            <data name="FromQMICardStateStr" inType="win:UInt32" map="QmiUimCardState"/>
            <data name="FromQMICardStateInt" inType="win:UInt32" />
            <data name="ToQMICardStateStr" inType="win:UInt32" map="QmiUimCardState"/>
            <data name="ToQMICardStateInt" inType="win:UInt32" />
          </template>

          <template tid="tCardSlot_FromError_ToError">
            <data name="slotId" inType="win:UInt32" />
            <data name="FromCardErrorStr" inType="win:UInt32" map="QmiUimCardError"/>
            <data name="FromCardErrorInt" inType="win:UInt32" />
            <data name="ToCardErrorStr" inType="win:UInt32" map="QmiUimCardError"/>
            <data name="ToCardErrorInt" inType="win:UInt32" />
          </template>

          <template tid="tAddAppToAppList">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="AppName" inType="win:AnsiString" />
            <data name="AppNameLength" inType="win:UInt32" />
          </template>

          <template tid="tCardStateDifferent">
            <data name="QMICardState1Str" inType="win:UInt32" map="QmiUimCardState"/>
            <data name="QMICardState1Int" inType="win:UInt32" />
            <data name="QMICardState2Str" inType="win:UInt32" map="QmiUimCardState"/>
            <data name="QMICardState2Int" inType="win:UInt32" />
          </template>

          <template tid="tCardErrorCodeDifferent">
            <data name="CardError1Str" inType="win:UInt32" map="QmiUimCardError"/>
            <data name="CardError1Int" inType="win:UInt32" />
            <data name="CardError2Str" inType="win:UInt32" map="QmiUimCardError"/>
            <data name="CardError2Int" inType="win:UInt32" />
          </template>

          <template tid="tIccidDifferent">
            <data name="LENGTH_ICCID" inType="win:UInt32" />
            <data name="ICCID" inType="win:UInt8" outType="win:HexInt8" count="LENGTH_ICCID"/>
            <data name="ICCIDFromComparedCard" inType="win:UInt8" outType="win:HexInt8" count="LENGTH_ICCID"/>
          </template>

          <template tid="tCardClassReportState">
            <data name="slotId" inType="win:UInt32" />
            <data name="QMICardStateStr" inType="win:UInt32" map="QmiUimCardState"/>
            <data name="QMICardStateInt" inType="win:UInt32" />
            <data name="CardErrorStr" inType="win:UInt32" map="QmiUimCardError"/>
            <data name="CardErrorInt" inType="win:UInt32" />
          </template>

          <template tid="tPinClassConstructor">
            <data name="PinIdStr" inType="win:UInt32" map="PinIdType"/>
            <data name="PinIdInt" inType="win:UInt32" />
            <data name="PinStateStr" inType="win:UInt32" map="PinStateType"/>
            <data name="PinStateInt" inType="win:UInt32" />
            <data name="m_PINretries" inType="win:UInt32" />
            <data name="m_PUKretries" inType="win:UInt32" />
          </template>

          <template tid="tSetPinState">
            <data name="PinIdStr" inType="win:UInt32" map="PinIdType"/>
            <data name="PinIdInt" inType="win:UInt32" />
            <data name="FromPinStateStr" inType="win:UInt32" map="PinStateType"/>
            <data name="FromPinStateInt" inType="win:UInt32" />
            <data name="ToPinStateStr" inType="win:UInt32" map="PinStateType"/>
            <data name="ToPinStateInt" inType="win:UInt32" />
          </template>

          <template tid="tSetPINretries">
            <data name="PinIdStr" inType="win:UInt32" map="PinIdType"/>
            <data name="PinIdInt" inType="win:UInt32" />
            <data name="retries1" inType="win:UInt32" />
            <data name="retries2" inType="win:UInt32" />
          </template>

          <template tid="tGetPINstate">
            <data name="PinIdStr" inType="win:UInt32" map="PinIdType"/>
            <data name="PinIdInt" inType="win:UInt32" />
            <data name="PinStateStr" inType="win:UInt32" map="PinStateType"/>
            <data name="PinStateInt" inType="win:UInt32" />
          </template>

          <template tid="tProvisioningApplicationClassConstructor">
            <data name="QMIAppTypeStr" inType="win:UInt32" map="QmiUimAppType"/>
            <data name="QMIAppTypeInt" inType="win:UInt32" />
            <data name="AppStateStr" inType="win:UInt32" map="QmiUimAppState"/>
            <data name="AppStateInt" inType="win:UInt32" />
            <data name="slotID" inType="win:UInt32" />
            <data name="QMIAppIndex" inType="win:UInt32" />
          </template>

          <template tid="tFailsOnPersoCheckMP">
            <data name="MPPersoFeatureFailedOnPersoCheckStr" inType="win:UInt32" map="QmiUimPersoFeatureStatus"/>
            <data name="MPPersoFeatureFailedOnPersoCheckInt" inType="win:UInt32" />
          </template>

          <template tid="tFailsOnPersoCheckAP">
            <data name="APPersoFeatureFailedOnPersoCheckStr" inType="win:UInt32" map="QmiUimPersoFeatureStatus"/>
            <data name="APPersoFeatureFailedOnPersoCheckInt" inType="win:UInt32" />
          </template>

          <template tid="tBroadcastPersoCheckStatus">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="PersoCheckStateStr" inType="win:UInt32" map="RILUICCAPPPERSOCHECKSTATUSSTATE"/>
            <data name="PersoCheckStateInt" inType="win:UInt32" />
            <data name="PersoFeatureStr" inType="win:UInt32" map="RilPersoFeatureType"/>
            <data name="PersoFeatureInt" inType="win:UInt32" />
          </template>

          <template tid="tSetSessionTypeAndExecutor">
            <data name="SessionType" inType="win:UInt32" map="UimSessionType"/>
            <data name="dwSubscriptionIdx" inType="win:UInt32" />
          </template>

          <template tid="tAppState_Ready_SendNotif">
            <data name="AppStateStr" inType="win:UInt32" map="QmiUimAppState"/>
            <data name="fReady" inType="win:UInt32" />
            <data name="fSendAppReadyStateNotification" inType="win:UInt32" />
          </template>

          <template tid="tAppRefFilesId_PathLen_Path">
            <data name="fileId" inType="win:UInt16" outType="win:HexInt16" />
            <data name="pathLen" inType="win:UInt32" />
            <data name="path" inType="win:UInt8" outType="win:HexInt8" count="pathLen" />
          </template>

          <template tid="tRilNotifyUiccappDatachange">
            <data name="DataChangeStr" inType="win:UInt32" map="RilUiccAppDataChange"/>
            <data name="DataChangeInt" inType="win:UInt32" />
          </template>

          <template tid="tAppTypeCompare">
            <data name="rilAppType1Str" inType="win:UInt32" map="RilUiccAppType"/>
            <data name="rilAppType1Int" inType="win:UInt32" />
            <data name="rilAppType2Str" inType="win:UInt32" map="RilUiccAppType"/>
            <data name="rilAppType2Int" inType="win:UInt32" />
          </template>

          <template tid="tAidCompare">
            <data name="AidLen" inType="win:UInt32" />
            <data name="Aid1" inType="win:UInt8" outType="win:HexInt8" count="AidLen" />
            <data name="Aid2" inType="win:UInt8" outType="win:HexInt8" count="AidLen" />
          </template>

          <template tid="tQmiAppStateCompare">
            <data name="AppState1Str" inType="win:UInt32" map="QmiUimAppState"/>
            <data name="AppState1Int" inType="win:UInt32" />
            <data name="AppState2Str" inType="win:UInt32" map="QmiUimAppState"/>
            <data name="AppState2Int" inType="win:UInt32" />
          </template>

          <template tid="tCompareMppersoApperso">
            <data name="MPPersoCheckState1Str" inType="win:UInt32" map="RILUICCAPPPERSOCHECKSTATUSSTATE"/>
            <data name="MPPersoCheckState1Int" inType="win:UInt32" />
            <data name="MPPersoCheckState2Str" inType="win:UInt32" map="RILUICCAPPPERSOCHECKSTATUSSTATE"/>
            <data name="MPPersoCheckState2Int" inType="win:UInt32" />
          </template>

          <template tid="tCompareMppersoAppersoWhenPersoFails">
            <data name="MPPersoFeatureFailedOnPersoCheck1Str" inType="win:UInt32" map="QmiUimPersoFeatureStatus"/>
            <data name="MPPersoFeatureFailedOnPersoCheck1Int" inType="win:UInt32" />
            <data name="MPPersoFeatureFailedOnPersoCheck2Str" inType="win:UInt32" map="QmiUimPersoFeatureStatus"/>
            <data name="MPPersoFeatureFailedOnPersoCheck2Int" inType="win:UInt32" />
          </template>

          <template tid="tProvAppClass_ReportState">
            <data name="QMIAppIndex" inType="win:UInt32" />
            <data name="QMIAppTypeStr" inType="win:UInt32" map="QmiUimAppType"/>
            <data name="QMIAppTypeInt" inType="win:UInt32" />
            <data name="AppStateStr" inType="win:UInt32" map="QmiUimAppState"/>
            <data name="AppStateInt" inType="win:UInt32" />
            <data name="aidLen" inType="win:UInt32" />
            <data name="MPPersoCheckStateStr" inType="win:UInt32" map="RILUICCAPPPERSOCHECKSTATUSSTATE"/>
            <data name="MPPersoCheckStateInt" inType="win:UInt32" />
            <data name="isPinUsed" inType="win:UInt32" />
          </template>

          <template tid="tRegisteredForExtInd">
            <data name="MessageIDStr" inType="win:UInt32" map="APPersoNotificationMsgEnum"/>
            <data name="MessageIDInt" inType="win:UInt32" />
          </template>

          <template tid="tUnexpectedQmiService">
            <data name="serviceIDStr" inType="win:UInt32" map="QmiServiceType"/>
            <data name="serviceIDInt" inType="win:UInt32" />
          </template>

          <template tid="tNumInstancesPbReadyInfo">
            <data name="phonebook_ready_info_len" inType="win:UInt32" />
            <data name="sessionTypeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="sessionTypeInt" inType="win:UInt32" />
            <data name="isPinUsed" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tPbmRefInd_SessionType_PbType_Status">
            <data name="sessionTypeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="sessionTypeInt" inType="win:UInt32" />
            <data name="pb_type" inType="win:UInt16" outType="win:HexInt16"/>
            <data name="status" inType="win:UInt32" />
          </template>

          <template tid="tPbmReadyInd_SessionType_PbType">
            <data name="sessionTypeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="sessionTypeInt" inType="win:UInt32" />
            <data name="pb_type" inType="win:UInt16" outType="win:HexInt16"/>
          </template>

          <template tid="tPbmRecordUpdateInd_SessionType_PbType_Operation_RecId">
            <data name="sessionTypeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="sessionTypeInt" inType="win:UInt32" />
            <data name="pb_type" inType="win:UInt16" outType="win:HexInt16"/>
            <data name="operationStr" inType="win:UInt32" map="PbmAASOperationEnum"/>
            <data name="operationInt" inType="win:UInt32" />
            <data name="record_id" inType="win:UInt16" />
          </template>

          <template tid="tPbmAasUpdateInd_SessionType_Operation_AasId_AlphaLen">
            <data name="sessionTypeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="sessionTypeInt" inType="win:UInt32" />
            <data name="operationStr" inType="win:UInt32" map="PbmAASOperationEnum"/>
            <data name="operationInt" inType="win:UInt32" />
            <data name="aas_id" inType="win:UInt8" />
            <data name="alpha_len" inType="win:UInt32" />
          </template>

          <template tid="tPbmSessionType">
            <data name="sessionTypeStr" inType="win:UInt32" map="PbmSessionType"/>
            <data name="sessionTypeInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tQmiNasSysInfoInd">
            <data name="cdma_srv_status_info_valid" inType="win:UInt8" />
            <struct name="cdma_srv_status_info" count="1">
              <data name="srv_status" inType="win:UInt32" map="QmiNasServiceStatus" />
              <data name="is_pref_data_path" inType="win:UInt32" map="QmiNasPreferredDataPath" />
            </struct>
            <data name="hdr_srv_status_info_valid" inType="win:UInt8" />
            <struct name="hdr_srv_status_info" count="1">
              <data name="srv_status" inType="win:UInt32" map="QmiNasServiceStatus" />
              <data name="is_pref_data_path" inType="win:UInt32" map="QmiNasPreferredDataPath" />
            </struct>
            <data name="gsm_srv_status_info_valid" inType="win:UInt8" />
            <struct name="gsm_srv_status_info" count="1">
              <data name="srv_status" inType="win:UInt32" map="QmiNasServiceStatus" />
              <data name="true_srv_status" inType="win:UInt32" map="QmiNasServiceStatus" />
              <data name="is_pref_data_path" inType="win:UInt32" map="QmiNasPreferredDataPath" />
            </struct>
            <data name="wcdma_srv_status_info_valid" inType="win:UInt8" />
            <struct name="wcdma_srv_status_info" count="1">
              <data name="srv_status" inType="win:UInt32" map="QmiNasServiceStatus" />
              <data name="true_srv_status" inType="win:UInt32" map="QmiNasServiceStatus" />
              <data name="is_pref_data_path" inType="win:UInt32" map="QmiNasPreferredDataPath" />
            </struct>
            <data name="lte_srv_status_info_valid" inType="win:UInt8" />
            <struct name="lte_srv_status_info" count="1">
              <data name="srv_status" inType="win:UInt32" map="QmiNasServiceStatus" />
              <data name="true_srv_status" inType="win:UInt32" map="QmiNasServiceStatus" />
              <data name="is_pref_data_path" inType="win:UInt32" map="QmiNasPreferredDataPath" />
            </struct>
            <data name="tdscdma_srv_status_info_valid" inType="win:UInt8" />
            <struct name="tdscdma_srv_status_info" count="1">
              <data name="srv_status" inType="win:UInt32" map="QmiNasServiceStatus" />
              <data name="true_srv_status" inType="win:UInt32" map="QmiNasServiceStatus" />
              <data name="is_pref_data_path" inType="win:UInt32" map="QmiNasPreferredDataPath" />
            </struct>
          </template>

          <template tid="tSMSFormat">
            <data name="format" inType="win:UInt32" map="SMSFormat"/>
          </template>
          <template tid="tQmiNasCommonSysInfo">
            <data name="srv_domain_valid" inType="win:UInt8" />
            <data name="srv_domain" inType="win:UInt32" map="QmiNasServiceDomain" />
            <data name="srv_capability_valid" inType="win:UInt8" />
            <data name="srv_capability" inType="win:UInt32" map="QmiNasServiceDomain" />
            <data name="roam_status_valid" inType="win:UInt8" />
            <data name="roam_status" inType="win:UInt32" map="QmiNasRoamStatus" />
          </template>

          <template tid="tQmiNasCdmaHdrSysInfo">
            <data name="srv_domain_valid" inType="win:UInt8" />
            <data name="is_sys_prl_match" inType="win:UInt8" />
          </template>

          <template tid="tQmiNasCdmaSysInfo">
            <data name="cdma_sys_id_valid" inType="win:UInt8" />
            <data name="cdma_sys_id.sid" inType="win:UInt16" />
            <data name="cdma_sys_id.nid" inType="win:UInt16" />
            <data name="network_id_valid" inType="win:UInt8" />
            <data name="mcc" inType="win:AnsiString" length="3"/>
            <data name="mnc" inType="win:AnsiString" length="3"/>
          </template>

          <template tid="tQmiNasHdrSysInfo">
            <data name="hdr_active_prot_valid" inType="win:UInt8" />
            <data name="hdr_active_prot" inType="win:UInt32" map="QmiNasHdrActiveProtocol" />
          </template>

          <template tid="tQmiNas3gppSysInfo">
            <data name="lac_valid" inType="win:UInt8" />
            <data name="lac" inType="win:UInt16" />
            <data name="cell_id_valid" inType="win:UInt8" />
            <data name="cell_id" inType="win:UInt32" />
            <data name="reg_reject_info_valid" inType="win:UInt8" />
            <data name="reg_reject_info.rej_cause" inType="win:UInt8" />
            <data name="network_id_valid" inType="win:UInt8" />
            <data name="mcc" inType="win:AnsiString" length="3"/>
            <data name="mnc" inType="win:AnsiString" length="3"/>
          </template>

          <template tid="tQmiNasGsmSysInfo">
            <data name="egprs_supp_valid" inType="win:UInt8" />
            <data name="egprs_supp" inType="win:UInt8" />
          </template>

          <template tid="tQmiNasWcdmaSysInfo">
            <data name="hs_call_status_valid" inType="win:UInt8" />
            <data name="hs_call_status" inType="win:UInt32" map="QmiNasHsCallStatus" />
            <data name="hs_ind_valid" inType="win:UInt8" />
            <data name="hs_ind" inType="win:UInt32" map="QmiNasHsCallStatus" />
          </template>

          <template tid="tQmiNasLteSysInfo">
            <data name="tac_valid" inType="win:UInt8" />
            <data name="tac" inType="win:UInt16" />
          </template>

          <template tid="tQmiNasTdscdmaSysInfo">
            <data name="hs_call_status_valid" inType="win:UInt8" />
            <data name="hs_call_status" inType="win:UInt32" map="QmiNasHsCallStatus" />
            <data name="hs_ind_valid" inType="win:UInt8" />
            <data name="hs_ind" inType="win:UInt32" map="QmiNasHsCallStatus" />
          </template>

          <template tid="tQmiNasNetworkTimeInd">
            <struct name="universal_time" count="1">
              <data name="year" inType="win:UInt32" />
              <data name="month" inType="win:UInt32" />
              <data name="day" inType="win:UInt32" />
              <data name="hour" inType="win:UInt32" />
              <data name="minute" inType="win:UInt32" />
              <data name="second" inType="win:UInt32" />
              <data name="day_of_week" inType="win:UInt32" />
            </struct>
            <data name="time_zone_valid" inType="win:UInt8" />
            <data name="time_zone" inType="win:UInt8" />
            <data name="daylt_sav_adj_valid" inType="win:UInt8" />
            <data name="daylt_sav_adj" inType="win:UInt8" />
          </template>

          <template tid="tGetUiccService_InputParams">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwServiceStr" inType="win:UInt32" map="UiccServiceEnum"/>
            <data name="dwServiceInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tGetUiccServiceState_Response">
            <data name="dwServiceStr" inType="win:UInt32" map="UiccServiceEnum"/>
            <data name="dwServiceInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="dwServiceStateStr" inType="win:UInt32" map="UiccServiceStateEnum"/>
            <data name="dwServiceStateInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tSetUiccService_InputParams">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwServiceStr" inType="win:UInt32" map="UiccServiceEnum"/>
            <data name="dwServiceInt" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="fEnable" inType="win:Boolean" />
          </template>

          <template tid="tGetUiccServiceLock_Response">
            <data name="hUiccApp" inType="win:UInt32" outType="win:HexInt32" />
            <data name="dwKeyRefStr" inType="win:UInt32" map="UiccKeyRefEnum"/>
            <data name="dwKeyRefInt" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

        </templates>

        <!-- These events are grouped around tasks, defined above

             level:
                win:Critical      (1)
                win:Error         (2)
                win:Warning       (3)
                win:Informational (4)
                win:Verbose       (5)
        -->

        <events>
          <!-- Miscellaneous 1-999 -->
          <event value="1"
              symbol="WmRil_ErrorSz"
              task="TaskMisc"
              keywords="Error"
              level="win:Error"
              template="tUnicodeString"
              message="$(string.Event.WmRil_ErrorSz)" />

          <!-- DRIVER 1000-1999 -->

          <event value="1005"
              symbol="WmRil_DriverVersion"
              task="TaskDriver"
              keywords="Tracing"
              level="win:Informational"
              template="tDriverVersion"
              message="$(string.Event.WmRil_DriverVersion)" />

          <event value="1008"
              symbol="WmRil_DriverSendOKResponse"
              task="TaskDriver"
              keywords="Tracing"
              level="win:Informational"
              template="tClientIdPayloadSize"
              message="$(string.Event.WmRil_DriverSendOKResponse)" />

          <event value="1009"
              symbol="WmRil_DriverSendErrorResponse"
              task="TaskDriver"
              keywords="Error"
              level="win:Error"
              template="tCmdIdandHRESULT"
              message="$(string.Event.WmRil_DriverSendErrorResponse)" />

          <event value="1010"
              symbol="WmRil_DriverSendErrorResponseWithCause"
              task="TaskDriver"
              keywords="Error"
              level="win:Error"
              template="tCmdIdandHRESULTandCause"
              message="$(string.Event.WmRil_DriverSendErrorResponseWithCause)" />

          <event value="1011"
              symbol="WmRil_DriverBroadcastNotification"
              task="TaskDriver"
              keywords="Tracing"
              level="win:Informational"
              template="tBroadcastNotification"
              message="$(string.Event.WmRil_DriverBroadcastNotification)" />

          <event value="1012"
              symbol="WmRil_DriverExecutingCommand"
              task="TaskDriver"
              keywords="Tracing"
              level="win:Informational"
              template="tCommandName"
              message="$(string.Event.WmRil_DriverExecutingCommand)" />

          <event value="1013"
              symbol="WmRil_DriverCleanupCommand"
              task="TaskDriver"
              keywords="Tracing"
              level="win:Informational"
              template="tCommandName"
              message="$(string.Event.WmRil_DriverCleanupCommand)" />

          <event value="1030"
              symbol="WmRil_DriverSendSyncQmiRequest"
              task="TaskDriver"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiMessage"
              message="$(string.Event.WmRil_DriverSendSyncQmiRequest)" />

          <event value="1031"
              symbol="WmRil_DriverSendAsyncQmiRequest"
              task="TaskDriver"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiMessage"
              message="$(string.Event.WmRil_DriverSendAsyncQmiRequest)" />

          <event value="1032"
              symbol="WmRil_DriverQmiIndicationArrived"
              task="TaskDriver"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiMessage"
              message="$(string.Event.WmRil_DriverQmiIndicationArrived)" />

          <event value="1033"
              symbol="WmRil_DriverMssrComplete"
              task="TaskDriver"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_DriverMssrComplete)" />

          <event value="1034"
              symbol="WmRil_DriverMssrProcessPendingCommand"
              task="TaskDriver"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiAndUInt32"
              message="$(string.Event.WmRil_DriverMssrProcessPendingCommand)" />

          <!-- MEMORY 2000-2999 -->

          <!-- DMS 3000-3999 -->
          <event value="3000"
              symbol="WmRil_Device"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiStringAndDword"
              message="$(string.Event.WmRil_Device)" />

          <event value="3001"
              symbol="WmRil_DeviceEquipmentStateGet"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_DeviceEquipmentStateGet)" />

          <event value="3002"
              symbol="WmRil_DeviceEquipmentState"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_DeviceEquipmentState)" />

          <event value="3003"
              symbol="WmRil_DeviceEquipmentStateSameAsCurrent"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_DeviceEquipmentStateSameAsCurrent)" />

          <event value="3004"
              symbol="WmRil_DeviceEquipmentStateShutdown"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_DeviceEquipmentStateShutdown)" />

          <event value="3005"
              symbol="WmRil_DeviceEquipmentStateInternalChange"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_DeviceEquipmentStateInternalChange)" />

          <event value="3006"
              symbol="WmRil_DeviceEquipmentStateInternalPRLInitComplete"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_DeviceEquipmentStateInternalPRLInitComplete)" />

          <event value="3007"
              symbol="WmRil_DeviceEquipmentStateFromModem"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_DeviceEquipmentStateFromModem)" />

          <event value="3008"
              symbol="WmRil_DevicePRLInitCompleted"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_DevicePRLInitCompleted)" />

          <event value="3009"
              symbol="WmRil_DeviceSupportedSystemTypes"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_DeviceSupportedSystemTypes)" />

          <event value="3010"
              symbol="WmRil_DeviceRadioType"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_DeviceRadioType)" />

          <event value="3011"
              symbol="WmRil_DeviceSystemType"
              task="TaskDms"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_DeviceSystemType)" />

          <!-- UIM 4000-4999 -->
          <event value="4000"
              symbol="WmRil_Card"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiStringAndDword"
              message="$(string.Event.WmRil_Card)" />

          <event value="4001"
              symbol="WmRil_UimUserAppSelectionAndPersoSelection"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUserAppSelectionAndPersoSelection"
              message="$(string.Event.WmRil_UimUserAppSelectionAndPersoSelection)" />

          <event value="4002"
              symbol="WmRil_UimCardStatus_CARDSTATUS_AppIndexInfo"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardStatus_CARDSTATUS_AppIndexInfo"
              message="$(string.Event.WmRil_UimCardStatus_CARDSTATUS_AppIndexInfo)" />

          <event value="4003"
              symbol="WmRil_UimCardStatus_CARDSTATUS_CardInfoLen"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimCardStatus_CARDSTATUS_CardInfoLen)" />

          <event value="4004"
              symbol="WmRil_UimCardStatus_CARDSTATUS_CardIndex"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimCardStatus_CARDSTATUS_CardIndex)" />

          <event value="4005"
              symbol="WmRil_UimCardStatus_CARDINFO_CardState_CardError"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardStatus_CARDINFO_CardState_CardError"
              message="$(string.Event.WmRil_UimCardStatus_CARDINFO_CardState_CardError)" />

          <event value="4006"
              symbol="WmRil_UimCardStatus_CARDINFO_Upin"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardStatus_CARDINFO_Upin"
              message="$(string.Event.WmRil_UimCardStatus_CARDINFO_Upin)" />

          <event value="4007"
              symbol="WmRil_UimCardStatus_APPINFO_Len"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimCardStatus_APPINFO_Len)" />

          <event value="4008"
              symbol="WmRil_UimCardStatus_APPINFO_AppType_AppState_PersoState_PersoFeature_PersoRetries_PersoUnblockRetires"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardStatus_APPINFO_AppType_AppState_PersoState_PersoFeature_PersoRetries_PersoUnblockRetires"
              message="$(string.Event.WmRil_UimCardStatus_APPINFO_AppType_AppState_PersoState_PersoFeature_PersoRetries_PersoUnblockRetires)" />

          <event value="4009"
              symbol="WmRil_UimCardStatus_APPINFO_Aid"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardStatus_APPINFO_Aid"
              message="$(string.Event.WmRil_UimCardStatus_APPINFO_Aid)" />

          <event value="4010"
              symbol="WmRil_UimCardStatus_APPINFO_UPINState_PIN1Info_PIN2Info"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardStatus_APPINFO_UPINState_PIN1Info_PIN2Info"
              message="$(string.Event.WmRil_UimCardStatus_APPINFO_UPINState_PIN1Info_PIN2Info)" />

          <event value="4011"
              symbol="WmRil_UimSz"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiString"
              message="$(string.Event.WmRil_UimSz)" />

          <event value="4012"
              symbol="WmRil_UimSzDw"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiStringAndDword"
              message="$(string.Event.WmRil_UimSzDw)" />

          <event value="4013"
              symbol="WmRil_UimRegisteredForCardStatusInd"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimRegisteredForCardStatusInd)" />

          <event value="4014"
              symbol="WmRil_UimAddedCardInfoForSlot"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimAddedCardInfoForSlot)" />

          <event value="4015"
              symbol="WmRil_UimAddedVirtualRUIMCardInfoForSlot"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimAddedVirtualRUIMCardInfoForSlot)" />

          <event value="4016"
              symbol="WmRil_UimPrintAppName"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiString"
              message="$(string.Event.WmRil_UimPrintAppName)" />

          <event value="4017"
              symbol="WmRil_UimUiccLockStatusBroadcasted"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUiccLockStatusChangeMsg"
              message="$(string.Event.WmRil_UimUiccLockStatusBroadcasted)" />

          <event value="4018"
              symbol="WmRil_UimUiccAppPersoStatusBroadcasted"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUiccAppPersoCheckStatusChangeMsg"
              message="$(string.Event.WmRil_UimUiccAppPersoStatusBroadcasted)" />

          <event value="4019"
              symbol="WmRil_UimSetExecutorConfig_InputParams_hUiccApps"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSetExecutorConfig_InputParams_hUiccApps"
              message="$(string.Event.WmRil_UimSetExecutorConfig_InputParams_hUiccApps)" />

          <event value="4020"
              symbol="WmRil_UimUnbinding_Starts"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimUnbinding_Starts)" />

          <event value="4021"
              symbol="WmRil_UimBinding_Starts"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimBinding_Starts)" />

          <event value="4022"
              symbol="WmRil_UimRadio_NewBindingInfo"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tRadio_NewBindingInfo"
              message="$(string.Event.WmRil_UimRadio_NewBindingInfo)" />

          <event value="4023"
              symbol="WmRil_UimNewBindingInfo_VirtualRUIM"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tNewBindingInfo_VirtualRUIM"
              message="$(string.Event.WmRil_UimNewBindingInfo)" />

          <event value="4024"
              symbol="WmRil_UimNewBindingInfo_hUiccApp_SessionType"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tNewBindingInfo_hUiccApp_SessionType"
              message="$(string.Event.WmRil_UimNewBindingInfo)" />

          <event value="4025"
              symbol="WmRil_UimOldBinding"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tNewBindingInfo_hUiccApp_SessionType"
              message="$(string.Event.WmRil_UimOldBinding)" />

          <event value="4026"
              symbol="WmRil_UimOldVirtualBinding"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tNewBindingInfo_VirtualRUIM"
              message="$(string.Event.WmRil_UimOldVirtualBinding)" />

          <event value="4027"
              symbol="WmRil_UIMBindingIndex_IoctlState_hUiccApp"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tBindingIndex_IoctlState_hUiccApp"
              message="$(string.Event.WmRil_UIMBindingIndex_IoctlState_hUiccApp)" />

          <event value="4028"
              symbol="WmRil_UimProcessInternalInd"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tProcessInternalInd"
              message="$(string.Event.WmRil_UimProcessInternalInd)" />

          <event value="4029"
              symbol="WmRil_UimUnbindingConfirmed"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimUnbindingConfirmed)" />

          <event value="4030"
              symbol="WmRil_UimAppInUnknownState"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimAppInUnknownState)" />

          <event value="4031"
              symbol="WmRil_UimBindingConfirmed"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tNewBindingInfo_hUiccApp_SessionType"
              message="$(string.Event.WmRil_UimBindingConfirmed)" />

          <event value="4032"
              symbol="WmRil_UimSimActivationStart"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimSimActivationStart)" />

          <event value="4033"
              symbol="WmRil_UimProcessInternalIndData"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tProcessInternalIndData"
              message="$(string.Event.WmRil_UimProcessInternalIndData)" />

          <event value="4034"
              symbol="WmRil_UimSendProvStatus_Started"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimSendProvStatus_Started)" />

          <event value="4035"
              symbol="WmRil_UimUnhandledInternalInd"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimUnhandledInternalInd)" />

          <event value="4036"
              symbol="WmRil_UimIMSI_MProgrammed"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimIMSI_MProgrammed)" />

          <event value="4037"
              symbol="WmRil_UimIMSI_MNotProgrammed"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimIMSI_MNotProgrammed)" />

          <event value="4038"
              symbol="WmRil_UimMCC_MNC"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiString"
              message="$(string.Event.WmRil_UimMCC_MNC)" />

          <event value="4039"
              symbol="WmRil_UimNotVenderSpecificCard"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimNotVenderSpecificCard)" />

          <event value="4040"
              symbol="WmRil_UimVenderSpecificCard"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimVenderSpecificCard)" />

          <event value="4041"
              symbol="WmRil_Uim4GCard"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_Uim4GCard)" />

          <event value="4042"
              symbol="WmRil_UimNot4GCard"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimNot4GCard)" />

          <event value="4043"
              symbol="WmRil_UimSendProvStatus_Needed"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimSendProvStatus_Needed)" />

          <event value="4044"
              symbol="WmRil_UimSendProvStatus_BIP_Success"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimSendProvStatus_BIP_Success)" />

          <event value="4045"
              symbol="WmRil_UimSendProvStatus_Failure_End"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimSendProvStatus_Failure_End)" />

          <event value="4046"
              symbol="WmRil_UimMDM_From_CSIM"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tByteDump"
              message="$(string.Event.WmRil_UimMDM_From_CSIM)" />

          <event value="4047"
              symbol="WmRil_UimMDN_NonZero"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimMDN_NonZero)" />

          <event value="4048"
              symbol="WmRil_UimMDN_AllZero"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimMDN_AllZero)" />

          <event value="4049"
              symbol="WmRil_UimNumUiccCardSlots"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimNumUiccCardSlots)" />

          <event value="4050"
              symbol="WmRil_UimSlotState"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSlotState"
              message="$(string.Event.WmRil_UimSlotState)" />

          <event value="4051"
              symbol="WmRil_UimSlotState_ObtainedSuccess"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimSlotState_ObtainedSuccess)" />

          <event value="4052"
              symbol="WmRil_UimGetCardInfoForSlot"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimGetCardInfoForSlot)" />

          <event value="4053"
              symbol="WmRil_UimICCIDNotAvailableAtSlot"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimICCIDNotAvailableAtSlot)" />

          <event value="4054"
              symbol="WmRil_UimAppFound"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tAppFound"
              message="$(string.Event.WmRil_UimAppFound)" />

          <event value="4055"
              symbol="WmRil_UimAppNotFound"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_UimAppNotFound)" />

          <event value="4056"
              symbol="WmRil_UimHuiccapp_Apptype"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="thUiccApp_AppType"
              message="$(string.Event.WmRil_UimHuiccapp_Apptype)" />

          <event value="4057"
              symbol="WmRil_UimRilAppId"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tRilAppId"
              message="$(string.Event.WmRil_UimRilAppId)" />

          <event value="4058"
              symbol="WmRil_UimRilAppName"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tRilAppName"
              message="$(string.Event.WmRil_UimRilAppName)" />

          <event value="4059"
              symbol="WmRil_UimPinReferences"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tPinRef"
              message="$(string.Event.WmRil_UimPinReferences)" />

          <event value="4060"
              symbol="WmRil_UimGotCardInfoSuccess"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimGotCardInfoSuccess)" />

          <event value="4061"
              symbol="WmRil_UimSysResponseSuccess"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimSysResponseSuccess)" />

          <event value="4062"
              symbol="WmRil_UimEf_ICCID_Read_Copied"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimEf_ICCID_Read_Copied)" />

          <event value="4063"
              symbol="WmRil_UimGetUiccRecordStatus"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tGetUiccRecordStatus"
              message="$(string.Event.WmRil_UimGetUiccRecordStatus)" />

          <event value="4064"
              symbol="WmRil_UimFilePathToConvert"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tFilePathToConvert"
              message="$(string.Event.WmRil_UimFilePathToConvert)" />

          <event value="4065"
              symbol="WmRil_UimFileType_RecordType"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tFileType_RecordType"
              message="$(string.Event.WmRil_UimFileType_RecordType)" />

          <event value="4066"
              symbol="WmRil_UimOperation_UIMAccessCond_RILAccessCond"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tOperation_UIMAccessCond_RILAccessCond"
              message="$(string.Event.WmRil_UimOperation_UIMAccessCond_RILAccessCond)" />

          <event value="4067"
              symbol="WmRIl_UimOperationNotIncluded"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tOperationNotIncluded"
              message="$(string.Event.WmRIl_UimOperationNotIncluded)" />

          <event value="4068"
              symbol="WmRil_UimPinReference"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tByteDump"
              message="$(string.Event.WmRil_UimPinReference)" />

          <event value="4069"
              symbol="WmRil_UimCardResult"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardResult"
              message="$(string.Event.WmRil_UimCardResult)" />

          <event value="4070"
              symbol="WmRil_UimFileLen_Response"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tByteDump"
              message="$(string.Event.WmRil_UimFileLen_Response)" />

          <event value="4071"
              symbol="WmRil_UimFileRefreshSuccess"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimFileRefreshSuccess)" />

          <event value="4072"
              symbol="WmRil_UimHuiccApp"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimHuiccApp)" />

          <event value="4073"
              symbol="WmRil_UimSendQmiReq"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimSendQmiReq)" />

          <event value="4074"
              symbol="WmRil_UimTrueImsiPresent"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimTrueImsiPresent)" />

          <event value="4075"
              symbol="WmRil_UimTrueImsiNotPresent"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimTrueImsiNotPresent)" />

          <event value="4076"
              symbol="WmRil_UimMcc_Imsi1112_ImsiS2_ImsiS1"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tMcc_Imsi1112_ImsiS2_ImsiS1"
              message="$(string.Event.WmRil_UimMcc_Imsi1112_ImsiS2_ImsiS1)" />

          <event value="4077"
              symbol="WmRil_UimImsiValue"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tImsiValue"
              message="$(string.Event.WmRil_UimImsiValue)" />

          <event value="4078"
              symbol="WmRil_UimImsiMccValue"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimImsiMccValue)" />

          <event value="4079"
              symbol="WmRil_UimImsiValue_ProcessGWIMSI"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tImsiValue_ProcessGWIMSI"
              message="$(string.Event.WmRil_UimImsiValue_ProcessGWIMSI)" />

          <event value="4080"
              symbol="WmRil_UimImsiMccValue_ProcessGWIMSI"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimImsiMccValue_ProcessGWIMSI)" />

          <event value="4081"
              symbol="WmRil_UimMcc_Imsi1112_Digits1112_S2_S1Second3Digits_S1Last3Digits"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tMcc_Imsi1112_Digits1112_S2_S1Second3Digits_S1Last3Digits"
              message="$(string.Event.WmRil_UimMcc_Imsi1112_Digits1112_S2_S1Second3Digits_S1Last3Digits)" />

          <event value="4082"
              symbol="WmRil_UimClass1_Imsi_Len"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimClass1_Imsi_Len)" />

          <event value="4083"
              symbol="WmRil_UimImsi_Len"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUnicodeStringAndUInt32"
              message="$(string.Event.WmRil_UimImsi_Len)" />

          <event value="4084"
              symbol="WmRil_UimImsiMcc_ImsiMnc"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_UimImsiMcc_ImsiMnc)" />

          <event value="4085"
              symbol="WmRil_UimImsiT_NotProgrammed"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimImsiT_NotProgrammed)" />

          <event value="4086"
              symbol="WmRil_UimContent_Len"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tByteDump"
              message="$(string.Event.WmRil_UimContent_Len)" />

          <event value="4087"
              symbol="WmRil_UimSlotIndex_ATR_Len"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSlotIndex_ATR_Len"
              message="$(string.Event.WmRil_UimSlotIndex_ATR_Len)" />

          <event value="4088"
              symbol="WmRil_UimGetUiccATR_SlotIndex"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimGetUiccATR_SlotIndex)" />

          <event value="4089"
              symbol="WmRil_UimCardFoundAtSlot"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimCardFoundAtSlot)" />

          <event value="4090"
              symbol="WmRil_UimGetCardInfoForSlot_OpenUiccLogicalChannel"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimGetCardInfoForSlot_OpenUiccLogicalChannel)" />

          <event value="4091"
              symbol="WmRil_UimSelectAIDResp"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tByteDump"
              message="$(string.Event.WmRil_UimSelectAIDResp)" />

          <event value="4092"
              symbol="WmRil_UimOpenLogicalChannell_Success"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_UimOpenLogicalChannell_Success)" />

          <event value="4093"
              symbol="WmRil_UimOpenUiccLogicalChannel_InputParams"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_UimOpenUiccLogicalChannel_InputParams)" />

          <event value="4094"
              symbol="WmRil_UimSendReqToCloseChannel"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_UimSendReqToCloseChannel)" />

          <event value="4095"
              symbol="WmRil_UimCloseUiccLogicalChannel_InputParams"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_UimCloseUiccLogicalChannel_InputParams)" />

          <event value="4096"
              symbol="WmRil_UimCloseUiccLogicalChannelGroup_InputParams"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCloseUiccLogicalChannelGroup_InputParams"
              message="$(string.Event.WmRil_UimCloseUiccLogicalChannelGroup_InputParams)" />

          <event value="4097"
              symbol="WmRil_UimCouldNotFindChannelForGroup"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCouldNotFindChannelForGroup"
              message="$(string.Event.WmRil_UimCouldNotFindChannelForGroup)" />

          <event value="4098"
              symbol="WmRil_UimNoMoreChannelForGroup"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCouldNotFindChannelForGroup"
              message="$(string.Event.WmRil_UimNoMoreChannelForGroup)" />

          <event value="4099"
              symbol="WmRil_UimCardInfoForSlot_ExchangeUiccAPDU"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimCardInfoForSlot_ExchangeUiccAPDU)" />

          <event value="4100"
              symbol="WmRil_UimSendReqToExchange"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_UimSendReqToExchange)" />

          <event value="4101"
              symbol="WmRil_UimExchangeAPDU_InputParams"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_UimExchangeAPDU_InputParams)" />

          <event value="4102"
              symbol="WmRil_UimValidStateReqForPinType"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tValidStateReqForPinType"
              message="$(string.Event.WmRil_UimValidStateReqForPinType)" />

          <event value="4103"
              symbol="WmRil_UimGetUiccLockStateResp"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tGetUiccLockStateResp"
              message="$(string.Event.WmRil_UimGetUiccLockStateResp)" />

          <event value="4104"
              symbol="WmRil_UimQMIResp_Result_Error"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tQMIResp_Result_Error"
              message="$(string.Event.WmRil_UimQMIResp_Result_Error)" />

          <event value="4105"
              symbol="WmRil_UimPinState_PinRetryNo_PUKRetryNo"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tPinState_PinRetryNo_PUKRetryNo"
              message="$(string.Event.WmRil_UimPinState_PinRetryNo_PUKRetryNo)" />

          <event value="4106"
              symbol="WmRil_UimPinState"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tPinState"
              message="$(string.Event.WmRil_UimPinState)" />

          <event value="4107"
              symbol="WmRil_UimValidKeyRef"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tValidKeyRef"
              message="$(string.Event.WmRil_UimValidKeyRef)" />

          <event value="4108"
              symbol="WmRil_UimQMIResult_Error"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tQMIResp_Result_Error"
              message="$(string.Event.WmRil_UimQMIResult_Error)" />

          <event value="4109"
              symbol="WmRil_UimPinState_PinRetryNum_PUKRetryNum"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tPinState_PinRetryNo_PUKRetryNo"
              message="$(string.Event.WmRil_UimPinState_PinRetryNum_PUKRetryNum)" />

          <event value="4110"
              symbol="WmRil_UimExpectedPinState"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tPinState"
              message="$(string.Event.WmRil_UimExpectedPinState)" />

          <event value="4111"
              symbol="WmRil_UimPersoFeature_CKRetries_PUKRetries"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tPersoFeature_CKRetries_PUKRetries"
              message="$(string.Event.WmRil_UimPersoFeature_CKRetries_PUKRetries)" />

          <event value="4112"
              symbol="WmRil_UimPersoFeature_PersoState_CKRetries_PUKRetries"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tPersoFeature_PersoState_CKRetries_PUKRetries"
              message="$(string.Event.WmRil_UimPersoFeature_PersoState_CKRetries_PUKRetries)" />

          <event value="4113"
              symbol="WmRil_UimWaitForUimStatusChangeInd"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimWaitForUimStatusChangeInd)" />

          <event value="4114"
              symbol="WmRil_UimPersoFeature_CKRetries_PUKRetries_DeactivatePerso"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tPersoFeature_CKRetries_PUKRetries"
              message="$(string.Event.WmRil_UimPersoFeature_CKRetries_PUKRetries_DeactivatePerso)" />

          <event value="4115"
              symbol="WmRil_UimRegisterForInternalInd"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimRegisterForInternalInd)" />

          <event value="4116"
              symbol="WmRil_UimWaitForUimStatusChangeInd_DeactivatePerso"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimWaitForUimStatusChangeInd_DeactivatePerso)" />

          <event value="4117"
              symbol="WmRil_UimResponseBlob_ExecutorConfig"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tResponseBlob_ExecutorConfig"
              message="$(string.Event.WmRil_UimResponseBlob_ExecutorConfig)" />

          <event value="4118"
              symbol="WmRil_UimSupportedFacilities"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSupportedFacilities"
              message="$(string.Event.WmRil_UimSupportedFacilities)" />

          <event value="4119"
              symbol="WmRil_UimFailedReadActSeq"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimFailedReadActSeq)" />

          <event value="4120"
              symbol="WmRil_UimRcvdQmiStatusChangeInd"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimRcvdQmiStatusChangeInd)" />

          <event value="4121"
              symbol="WmRil_UimCreateInternalIndForCard"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimCreateInternalIndForCard)" />

          <event value="4122"
              symbol="WmRil_UimSlotStateChanged"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSlotStateChanged"
              message="$(string.Event.WmRil_UimSlotStateChanged)" />

          <event value="4123"
              symbol="WmRil_UimRegisterRefreshCardSlot1"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimRegisterRefreshCardSlot1)" />

          <event value="4124"
              symbol="WmRil_UimRegisterRefreshCardSlot2"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimRegisterRefreshCardSlot2)" />

          <event value="4125"
              symbol="WmRil_UimRegisterRefreshCardSlot1Succeeded"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimRegisterRefreshCardSlot1Succeeded)" />

          <event value="4126"
              symbol="WmRil_UimRegisterRefreshCardSlot2Succeeded"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimRegisterRefreshCardSlot2Succeeded)" />

          <event value="4127"
              symbol="WmRil_UimResetCardInfoForSlot"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimResetCardInfoForSlot)" />

          <event value="4128"
              symbol="WmRil_UimSentSlotInfoChangeNotif_SlotState"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSlotState"
              message="$(string.Event.WmRil_UimSentSlotInfoChangeNotif_SlotState)" />

          <event value="4129"
              symbol="WmRil_UimSentSlotInfoChangeNotif_SlotState_2"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSlotState"
              message="$(string.Event.WmRil_UimSentSlotInfoChangeNotif_SlotState_2)" />

          <event value="4130"
              symbol="WmRil_UimReportStateUimService"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tReportStateUimService"
              message="$(string.Event.WmRil_UimReportStateUimService)" />

          <event value="4131"
              symbol="WmRil_UimLen_Id_Path"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tLen_Id_Path"
              message="$(string.Event.WmRil_UimLen_Id_Path)" />

          <event value="4132"
              symbol="WmRil_UimQmiFilePath_WmrilFilePath"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiFilePath_WmrilFilePath"
              message="$(string.Event.WmRil_UimQmiFilePath_WmrilFilePath)" />

          <event value="4133"
              symbol="WmRil_UimCurrentAppHandleCounter"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimCurrentAppHandleCounter)" />

          <event value="4134"
              symbol="WmRil_UimCardFoundForSlot_GetNexthUiccApp"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimCardFoundForSlot_GetNexthUiccApp)" />

          <event value="4135"
              symbol="WmRil_UimRefreshMode_Stage_Session_NumFiles"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tRefreshMode_Stage_Session_NumFiles"
              message="$(string.Event.WmRil_UimRefreshMode_Stage_Session_NumFiles)" />

          <event value="4136"
              symbol="WmRil_UimRefreshFile_Id_PathLen_Path"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tRefreshFile_Id_PathLen_Path"
              message="$(string.Event.WmRil_UimRefreshFile_Id_PathLen_Path)" />

          <event value="4137"
              symbol="WmRil_UimUiccResetRefreshSuccess"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimUiccResetRefreshSuccess)" />

          <event value="4138"
              symbol="WmRil_UimUiccRefCmdOccured_MsgSentSuccess"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimUiccRefCmdOccured_MsgSentSuccess)" />

          <event value="4139"
              symbol="WmRil_UimPutCardAbsentDetectionInHead"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimPutCardAbsentDetectionInHead)" />

          <event value="4140"
              symbol="WmRil_UimCreatedInsertInternalWaitUntilStatesBecomeSameCmd"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimCreatedInsertInternalWaitUntilStatesBecomeSameCmd)" />

          <event value="4141"
              symbol="WmRil_UimCreatedSetexecutorconfig"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimCreatedSetexecutorconfig)" />

          <event value="4142"
              symbol="WmRil_UimCardStateForSlot"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardStateForSlot"
              message="$(string.Event.WmRil_UimCardStateForSlot)" />

          <event value="4143"
              symbol="WmRil_UimVerifyUICCLockDone"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimVerifyUICCLockDone)" />

          <event value="4144"
              symbol="WmRil_UimServiceMssrRecoveryDone"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimServiceMssrRecoveryDone)" />

          <event value="4145"
              symbol="WmRil_UimSlotNums"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t4UInt32"
              message="$(string.Event.WmRil_UimSlotNums)" />

          <event value="4146"
              symbol="WmRil_UimpCardBeforeMSSRNotAvailable"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimpCardBeforeMSSRNotAvailable)" />

          <event value="4147"
              symbol="WmRil_UimpCardAfterMSSRNotAvailable"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimpCardAfterMSSRNotAvailable)" />

          <event value="4148"
              symbol="WmRil_UimAllCardsSame"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimAllCardsSame)" />

          <event value="4149"
              symbol="WmRil_UimpCardBeforeMSSRorpCardAfterMSSRNotAvailable"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimpCardBeforeMSSRorpCardAfterMSSRNotAvailable)" />

          <event value="4150"
              symbol="WmRil_UimAllCardsSameBefNAfterMssr"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimAllCardsSameBefNAfterMssr)" />

          <event value="4151"
              symbol="WmRil_UimCreatedSetSlotPower"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimCreatedSetSlotPower)" />

          <event value="4152"
              symbol="WmRil_UimCreatedInternalVerifyUICCEncryptedPINLockCmd"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimCreatedInternalVerifyUICCEncryptedPINLockCmd)" />

          <event value="4153"
              symbol="WmRil_UimCardState_CardError_RilSlotState_Slot"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardState_CardError_RilSlotState_Slot"
              message="$(string.Event.WmRil_UimCardState_CardError_RilSlotState_Slot)" />

          <event value="4154"
              symbol="WmRil_UimCardSlot_FromState_ToState"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardSlot_FromState_ToState"
              message="$(string.Event.WmRil_UimCardSlot_FromState_ToState)" />

          <event value="4155"
              symbol="WmRil_UimCardSlot_FromError_ToError"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardSlot_FromError_ToError"
              message="$(string.Event.WmRil_UimCardSlot_FromError_ToError)" />

          <event value="4156"
              symbol="WmRil_UimSetNumApps"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t3UInt32"
              message="$(string.Event.WmRil_UimSetNumApps)" />

          <event value="4157"
              symbol="WmRil_UimAddAppToAppList"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tAddAppToAppList"
              message="$(string.Event.WmRil_UimAddAppToAppList)" />

          <event value="4158"
              symbol="WmRil_UimAddedAppInfoToAppList"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimAddedAppInfoToAppList)" />

          <event value="4159"
              symbol="WmRil_UimSentRilNotifyCardAppAdded"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimSentRilNotifyCardAppAdded)" />

          <event value="4160"
              symbol="WmRil_UimSentRilNotifyCardAppRemoved"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimSentRilNotifyCardAppRemoved)" />

          <event value="4161"
              symbol="WmRil_UimhUiccAppInOldAndNewAppList"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimhUiccAppInOldAndNewAppList)" />

          <event value="4162"
              symbol="WmRil_UimhUiccAppInOldNotInNewAppList_SentNotify"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimhUiccAppInOldNotInNewAppList_SentNotify)" />

          <event value="4163"
              symbol="WmRil_UimOneAppInNewAndOldList"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimOneAppInNewAndOldList)" />

          <event value="4164"
              symbol="WmRil_UimOneAppInNewNotInOldList"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_UimOneAppInNewNotInOldList)" />

          <event value="4165"
              symbol="WmRil_UimEF_ICCIDFileReadAndStoreSuccess"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tByteDump"
              message="$(string.Event.WmRil_UimEF_ICCIDFileReadAndStoreSuccess)" />

          <event value="4166"
              symbol="WmRil_UimCardStateDifferent"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardStateDifferent"
              message="$(string.Event.WmRil_UimCardStateDifferent)" />

          <event value="4167"
              symbol="WmRil_UimCardErrorCodeDifferent"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardErrorCodeDifferent"
              message="$(string.Event.WmRil_UimCardErrorCodeDifferent)" />

          <event value="4168"
              symbol="WmRil_UimOneIccidAvailable"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimOneIccidAvailable)" />

          <event value="4169"
              symbol="WmRil_UimIccidDifferent"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tIccidDifferent"
              message="$(string.Event.WmRil_UimIccidDifferent)" />

          <event value="4170"
              symbol="WmRil_UimNumAppsDiff"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_UimNumAppsDiff)" />

          <event value="4171"
              symbol="WmRil_UimAppListSizeDiff"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_UimAppListSizeDiff)" />

          <event value="4172"
              symbol="WmRil_UimOneAppIsNull"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimOneAppIsNull)" />

          <event value="4173"
              symbol="WmRil_UimCardClassReportState"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCardClassReportState"
              message="$(string.Event.WmRil_UimCardClassReportState)" />

          <event value="4174"
              symbol="WmRil_UimPinClassConstructor"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tPinClassConstructor"
              message="$(string.Event.WmRil_UimPinClassConstructor)" />

          <event value="4175"
              symbol="WmRil_UimSetPinState"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSetPinState"
              message="$(string.Event.WmRil_UimSetPinState)" />

          <event value="4176"
              symbol="WmRil_UimSetPINretries"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSetPINretries"
              message="$(string.Event.WmRil_UimSetPINretries)" />

          <event value="4177"
              symbol="WmRil_UimSetPUKretries"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSetPINretries"
              message="$(string.Event.WmRil_UimSetPUKretries)" />

          <event value="4178"
              symbol="WmRil_UimGetPINstate"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tGetPINstate"
              message="$(string.Event.WmRil_UimGetPINstate)" />

          <event value="4179"
              symbol="WmRil_UimPinClassReportState"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tPinClassConstructor"
              message="$(string.Event.WmRil_UimPinClassReportState)" />

          <event value="4180"
              symbol="WmRil_UimProvisioningApplicationClassConstructor"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tProvisioningApplicationClassConstructor"
              message="$(string.Event.WmRil_UimProvisioningApplicationClassConstructor)" />

          <event value="4181"
              symbol="WmRil_UimFailsOnPersoCheckMP"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tFailsOnPersoCheckMP"
              message="$(string.Event.WmRil_UimFailsOnPersoCheckMP)" />

          <event value="4182"
              symbol="WmRil_UimFailsOnPersoCheckAP"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tFailsOnPersoCheckAP"
              message="$(string.Event.WmRil_UimFailsOnPersoCheckAP)" />

          <event value="4183"
              symbol="WmRil_UimBroadcastPersoCheckStatus"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tBroadcastPersoCheckStatus"
              message="$(string.Event.WmRil_UimBroadcastPersoCheckStatus)" />

          <event value="4184"
              symbol="WmRil_UimSetSessionTypeAndExecutor"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSetSessionTypeAndExecutor"
              message="$(string.Event.WmRil_UimSetSessionTypeAndExecutor)" />

          <event value="4188"
              symbol="WmRil_UimAppRefFilesId_PathLen_Path"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tAppRefFilesId_PathLen_Path"
              message="$(string.Event.WmRil_UimAppRefFilesId_PathLen_Path)" />

          <event value="4189"
              symbol="WmRil_UimRilNotifyUiccappDatachange"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tRilNotifyUiccappDatachange"
              message="$(string.Event.WmRil_UimRilNotifyUiccappDatachange)" />

          <event value="4190"
              symbol="WmRil_UimFileRefFilesId_PathLen_Path"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tAppRefFilesId_PathLen_Path"
              message="$(string.Event.WmRil_UimFileRefFilesId_PathLen_Path)" />

          <event value="4191"
              symbol="WmRil_UimRilNotifyUiccFileDatachange"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tWord"
              message="$(string.Event.WmRil_UimRilNotifyUiccFileDatachange)" />

          <event value="4192"
              symbol="WmRil_UimEFSPNFileReadCopied"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimEFSPNFileReadCopied)" />

          <event value="4193"
              symbol="WmRil_Uim3GPP2_EFSPNFileChangeNotif"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_Uim3GPP2_EFSPNFileChangeNotif)" />

          <event value="4194"
              symbol="WmRil_UimEF_CSP_PLMN_Setting"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_UimEF_CSP_PLMN_Setting)" />

          <event value="4195"
              symbol="WmRil_UimHUiccAppCompare"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2Dwords"
              message="$(string.Event.WmRil_UimHUiccAppCompare)" />

          <event value="4196"
              symbol="WmRil_UimAppTypeCompare"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tAppTypeCompare"
              message="$(string.Event.WmRil_UimAppTypeCompare)" />

          <event value="4197"
              symbol="WmRil_UimAidLengthCompare"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2Dwords"
              message="$(string.Event.WmRil_UimAidLengthCompare)" />

          <event value="4198"
              symbol="WmRil_UimAidCompare"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tAidCompare"
              message="$(string.Event.WmRil_UimAidCompare)" />

          <event value="4199"
              symbol="WmRil_UimAppLengthCompare"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2Dwords"
              message="$(string.Event.WmRil_UimAppLengthCompare)" />

          <event value="4200"
              symbol="WmRil_UimAppNamesCompare"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="t2AnsiString"
              message="$(string.Event.WmRil_UimAppNamesCompare)" />

          <event value="4201"
              symbol="WmRil_UimIsUpinUsedDifferent"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimIsUpinUsedDifferent)" />

          <event value="4202"
              symbol="WmRil_UimQmiAppStateCompare"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiAppStateCompare"
              message="$(string.Event.WmRil_UimQmiAppStateCompare)" />

          <event value="4203"
              symbol="WmRil_UimCompareMppersoApperso"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCompareMppersoApperso"
              message="$(string.Event.WmRil_UimCompareMppersoApperso)" />

          <event value="4204"
              symbol="WmRil_UimCompareMppersoAppersoWhenPersoFails"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tCompareMppersoAppersoWhenPersoFails"
              message="$(string.Event.WmRil_UimCompareMppersoAppersoWhenPersoFails)" />

          <event value="4205"
              symbol="WmRil_UimProvAppClass_ReportState"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tProvAppClass_ReportState"
              message="$(string.Event.WmRil_UimProvAppClass_ReportState)" />

          <event value="4206"
              symbol="WmRil_WaitForCardStatusInternalInd"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WaitForCardStatusInternalInd)" />

          <event value="4207"
              symbol="WmRil_GetIMSIProcessInternalIndData"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tProcessInternalIndData"
              message="$(string.Event.WmRil_GetIMSIProcessInternalIndData)" />

          <event value="4208"
              symbol="WmRil_WaitForCardStatusInternalInd2"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WaitForCardStatusInternalInd2)" />

          <event value="4209"
              symbol="WmRil_GetUiccServiceState_InputParams"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tGetUiccService_InputParams"
              message="$(string.Event.WmRil_GetUiccServiceState_InputParams)" />

          <event value="4210"
              symbol="WmRil_GetUiccServiceState_Response"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tGetUiccServiceState_Response"
              message="$(string.Event.WmRil_GetUiccServiceState_Response)" />

          <event value="4211"
              symbol="WmRil_InternalVerifyUiccLock_SendInternalIndPINVerification"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_InternalVerifyUiccLock_SendInternalIndPINVerification)" />

          <event value="4212"
              symbol="WmRil_SetUiccServiceState_InputParams"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tSetUiccService_InputParams"
              message="$(string.Event.WmRil_SetUiccServiceState_InputParams)" />

          <event value="4213"
              symbol="WmRil_SetUiccServiceState_InternalVerifyUICCLockCmd"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_SetUiccServiceState_InternalVerifyUICCLockCmd)" />

          <event value="4214"
              symbol="WmRil_GetUiccServiceLock_InputParams"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tGetUiccService_InputParams"
              message="$(string.Event.WmRil_GetUiccServiceLock_InputParams)" />

          <event value="4215"
              symbol="WmRil_GetUiccServiceLock_Response"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tGetUiccServiceLock_Response"
              message="$(string.Event.WmRil_GetUiccServiceLock_Response)" />

          <event value="4216"
              symbol="WmRil_UimInvalidCmdDataBlob"
              task="TaskUim"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_UimInvalidCmdDataBlob)" />

          <!-- Network 5000-5999 -->
          <event value="5000"
              symbol="WmRil_NetworkSz"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiString"
              message="$(string.Event.WmRil_NetworkSz)" />

          <event value="5001"
              symbol="WmRil_NetworkSzDw"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiStringAndDword"
              message="$(string.Event.WmRil_NetworkSzDw)" />

          <event value="5002"
              symbol="WmRil_NetworkSzSz"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiStringAndUnicodeString"
              message="$(string.Event.WmRil_NetworkSzSz)" />

          <event value="5003"
              symbol="WmRil_NetworkEriUnknown"
              task="TaskNetwork"
              keywords="Error"
              level="win:Warning"
              template="tDword"
              message="$(string.Event.WmRil_NetworkEriUnknown)" />

          <event value="5004"
              symbol="WmRil_NetworkUnknownCharEncoding"
              task="TaskNetwork"
              keywords="Error"
              level="win:Warning"
              template="tDword"
              message="$(string.Event.WmRil_NetworkUnknownCharEncoding)" />

          <event value="5005"
              symbol="WmRil_NetworkRoamIdNotFound"
              task="TaskNetwork"
              keywords="Error"
              level="win:Warning"
              template="tDword"
              message="$(string.Event.WmRil_NetworkRoamIdNotFound)" />

          <event value="5006"
              symbol="WmRil_NetworkConfigSigInfoFailed"
              task="TaskNetwork"
              keywords="Error"
              level="win:Warning"
              message="$(string.Event.WmRil_NetworkConfigSigInfoFailed)" />

          <event value="5007"
              symbol="WmRil_NetworkSystemType"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiStringAndSystemType"
              message="$(string.Event.WmRil_NetworkSystemType)" />

          <event value="5008"
              symbol="WmRil_NetworkRTREControlValue"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tRTREControlValue"
              message="$(string.Event.WmRil_NetworkRTREControlValue)" />

          <event value="5009"
              symbol="WmRil_NetworkQmiNasSysInfoInd"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiNasSysInfoInd"
              message="$(string.Event.WmRil_NetworkQmiNasSysInfoInd)" />

          <event value="5010"
              symbol="WmRil_NetworkQmiNasCommonSysInfo"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiNasCommonSysInfo"
              message="$(string.Event.WmRil_NetworkQmiNasCommonSysInfo)" />

          <event value="5011"
              symbol="WmRil_NetworkQmiNasCdmaHdrSysInfo"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiNasCdmaHdrSysInfo"
              message="$(string.Event.WmRil_NetworkQmiNasCdmaHdrSysInfo)" />

          <event value="5012"
              symbol="WmRil_NetworkQmiNasCdmaSysInfo"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiNasCdmaSysInfo"
              message="$(string.Event.WmRil_NetworkQmiNasCdmaSysInfo)" />

          <event value="5013"
              symbol="WmRil_NetworkQmiNasHdrSysInfo"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiNasHdrSysInfo"
              message="$(string.Event.WmRil_NetworkQmiNasHdrSysInfo)" />

          <event value="5014"
              symbol="WmRil_NetworkQmiNas3gppSysInfo"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiNas3gppSysInfo"
              message="$(string.Event.WmRil_NetworkQmiNas3gppSysInfo)" />

          <event value="5015"
              symbol="WmRil_NetworkQmiNasGsmSysInfo"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiNasGsmSysInfo"
              message="$(string.Event.WmRil_NetworkQmiNasGsmSysInfo)" />

          <event value="5016"
              symbol="WmRil_NetworkQmiNasWcdmaSysInfo"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiNasWcdmaSysInfo"
              message="$(string.Event.WmRil_NetworkQmiNasWcdmaSysInfo)" />

          <event value="5017"
              symbol="WmRil_NetworkQmiNasLteSysInfo"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiNasLteSysInfo"
              message="$(string.Event.WmRil_NetworkQmiNasLteSysInfo)" />

          <event value="5018"
              symbol="WmRil_NetworkQmiNasTdscdmaSysInfo"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiNasTdscdmaSysInfo"
              message="$(string.Event.WmRil_NetworkQmiNasTdscdmaSysInfo)" />

          <event value="5019"
              symbol="WmRil_NetworkQmiNasNetworkTimeInd"
              task="TaskNetwork"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiNasNetworkTimeInd"
              message="$(string.Event.WmRil_NetworkQmiNasNetworkTimeInd)" />


          <!-- Call 6000-6999 -->
          <event value="6000"
              symbol="WmRil_CallSzDw"
              task="TaskCall"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiStringAndDword"
              message="$(string.Event.WmRil_CallSzDw)" />

          <event value="6001"
              symbol="WmRil_CallSzSz"
              task="TaskCall"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiStringAndUnicodeString"
              message="$(string.Event.WmRil_CallSzSz)" />

          <event value="6002"
              symbol="WmRil_CallQmiVoiceAllCallStatusInd"
              task="TaskCall"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiVoiceAllCallStatusInd"
              message="$(string.Event.WmRil_CallQmiVoiceAllCallStatusInd)" />

          <event value="6003"
              symbol="WmRil_CallCallCreated"
              task="TaskCall"
              keywords="Tracing"
              level="win:Informational"
              template="tCallCreated"
              message="$(string.Event.WmRil_CallCallCreated)" />

          <event value="6004"
              symbol="WmRil_CallCPIBroadcasted"
              task="TaskCall"
              keywords="Tracing"
              level="win:Informational"
              template="tCPINotification"
              message="$(string.Event.WmRil_CallCPIBroadcasted)" />
          
          <event value="6005"
              symbol="WmRil_Call3GPPTone"
              task="TaskCall"
              keywords="Tracing"
              level="win:Informational"
              template="t3GPPTone"
              message="$(string.Event.WmRil_Call3GPPTone)" />

          <event value="6006"
              symbol="WmRil_Call3GPP2Tone"
              task="TaskCall"
              keywords="Tracing"
              level="win:Informational"
              template="t3GPP2Tone"
              message="$(string.Event.WmRil_Call3GPP2Tone)" />

          <!-- SUPSVC 7000-7999 -->

          <!-- PHONEBOOK 8000-8999 -->
          <event value="8000"
              symbol="WmRil_PhonebookGetUiccLockState_InputParams"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2Dwords"
              message="$(string.Event.WmRil_PhonebookGetUiccLockState_InputParams)" />

          <event value="8001"
              symbol="WmRil_PhonebookStoreLocCaps"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_PhonebookStoreLocCaps)" />

          <event value="8002"
              symbol="WmRil_PhonebookMaxRecReadCaps"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_PhonebookMaxRecReadCaps)" />

          <event value="8003"
              symbol="WmRil_PhonebookResult_Huiccapp_PbmSession"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tResult_Huiccapp_PbmSession"
              message="$(string.Event.WmRil_PhonebookResult_Huiccapp_PbmSession)" />

          <event value="8004"
              symbol="WmRil_PhonebookUnsupportedStoreLoc"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookUnsupportedStoreLoc)" />

          <event value="8005"
              symbol="WmRil_PhonebookStoreLoc_PbType"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tStoreLoc_PbType"
              message="$(string.Event.WmRil_PhonebookStoreLoc_PbType)" />

          <event value="8006"
              symbol="WmRil_PhonebookReadRecordsReqParams"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tReadRecordsReqParams"
              message="$(string.Event.WmRil_PhonebookReadRecordsReqParams)" />

          <event value="8007"
              symbol="WmRil_PhonebookNumOfRecordsReq_Expected"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2Dwords"
              message="$(string.Event.WmRil_PhonebookNumOfRecordsReq_Expected)" />

          <event value="8008"
              symbol="WmRil_PhonebookAllRecordsEmptySendResp"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookAllRecordsEmptySendResp)" />

          <event value="8009"
              symbol="WmRil_PhonebookInvalidNumOfRecords"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_PhonebookInvalidNumOfRecords)" />

          <event value="8010"
              symbol="WmRil_PhonebookRcvdReadInd_SessionType_PbType"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tRcvdReadInd_SessionType_PbType"
              message="$(string.Event.WmRil_PhonebookRcvdReadInd_SessionType_PbType)" />

          <event value="8011"
              symbol="WmRil_PhonebookPbType_StoreLoc"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tStoreLoc_PbType"
              message="$(string.Event.WmRil_PhonebookPbType_StoreLoc)" />

          <event value="8012"
              symbol="WmRil_PhonebookHuiccappFromSession"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tResult_Huiccapp_PbmSession"
              message="$(string.Event.WmRil_PhonebookHuiccappFromSession)" />

          <event value="8013"
              symbol="WmRil_PhonebookSeqNum_RecordInstanceLen"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2Dwords"
              message="$(string.Event.WmRil_PhonebookSeqNum_RecordInstanceLen)" />

          <event value="8014"
              symbol="WmRil_PhonebookPbmRecId_RilRecId"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2Dwords"
              message="$(string.Event.WmRil_PhonebookPbmRecId_RilRecId)" />

          <event value="8015"
              symbol="WmRil_PhonebookSecondName"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookSecondName)" />

          <event value="8016"
              symbol="WmRil_PhonebookGroupId"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookGroupId)" />

          <event value="8017"
              symbol="WmRil_PhonebookAdditionalNumber"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookAdditionalNumber)" />

          <event value="8018"
              symbol="WmRil_PhonebookEmail"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookEmail)" />

          <event value="8019"
              symbol="WmRil_PhonebookSecondNamePresent"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookSecondNamePresent)" />

          <event value="8020"
              symbol="WmRil_PhonebookNoSeconeName"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_PhonebookNoSeconeName)" />

          <event value="8021"
              symbol="WmRil_PhonebookAddnNumberPresent"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookAddnNumberPresent)" />

          <event value="8022"
              symbol="WmRil_PhonebookNoAddnNum"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookNoAddnNum)" />

          <event value="8023"
              symbol="WmRil_PhonebookRecId_AddnNumCount"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2Dwords"
              message="$(string.Event.WmRil_PhonebookRecId_AddnNumCount)" />

          <event value="8024"
              symbol="WmRil_PhonebookNoAddnNumForRec"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_PhonebookNoAddnNumForRec)" />

          <event value="8025"
              symbol="WmRil_PhonebookGrpIdsPresent_RecID_Count"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_PhonebookGrpIdsPresent_RecID_Count)" />

          <event value="8026"
              symbol="WmRil_PhonebookNoGrpIds"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_PhonebookNoGrpIds)" />

          <event value="8027"
              symbol="WmRil_PhoneboolEmailAddrPresent_RecId_Count"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_PhoneboolEmailAddrPresent_RecId_Count)" />

          <event value="8028"
              symbol="WmRil_PhonebookNoEmailAddrFound"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_PhonebookNoEmailAddrFound)" />

          <event value="8029"
              symbol="WmRil_PhonebookPbmNumType_RilNumType"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tPbmNumType_RilNumType"
              message="$(string.Event.WmRil_PhonebookPbmNumType_RilNumType)" />

          <event value="8030"
              symbol="WmRil_PhonebookPbmNumPlan_RilNumPlan"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tPbmNumPlan_RilNumPlan"
              message="$(string.Event.WmRil_PhonebookPbmNumPlan_RilNumPlan)" />

          <event value="8031"
              symbol="WmRil_PhonebookInputParams"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tInputParams"
              message="$(string.Event.WmRil_PhonebookInputParams)" />

          <event value="8032"
              symbol="WmRil_PhonebookWrite_InputParams"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tWrite_InputParams"
              message="$(string.Event.WmRil_PhonebookWrite_InputParams)" />

          <event value="8033"
              symbol="WmRil_PhonebookRilRecId_PbmRecId_PbmFromRil"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_PhonebookRilRecId_PbmRecId_PbmFromRil)" />

          <event value="8034"
              symbol="WmRil_PhonebookSendResp"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookSendResp)" />

          <event value="8035"
              symbol="WmRil_PhonebookNotCorrectInd"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookNotCorrectInd)" />

          <event value="8036"
              symbol="WmRil_PhonebookSendResp_ProcessIntInd"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookSendResp_ProcessIntInd)" />

          <event value="8037"
              symbol="WmRil_PhonebookRilNumType_PbmNumType"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tPbmNumType_RilNumType"
              message="$(string.Event.WmRil_PhonebookRilNumType_PbmNumType)" />

          <event value="8038"
              symbol="WmRil_PhonebookRilNumPlan_PbmNumPlan"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tPbmNumPlan_RilNumPlan"
              message="$(string.Event.WmRil_PhonebookRilNumPlan_PbmNumPlan)" />

          <event value="8039"
              symbol="WmRil_PhonebookDelete_InputParams"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tDelete_InputParams"
              message="$(string.Event.WmRil_PhonebookDelete_InputParams)" />

          <event value="8040"
              symbol="WmRil_PhonebookCallingDelRecReq"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tCallingDelRecReq"
              message="$(string.Event.WmRil_PhonebookCallingDelRecReq)" />

          <event value="8041"
              symbol="WmRil_PhonebookSendResp_DelPbkEntry"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookSendResp_DelPbkEntry)" />

          <event value="8042"
              symbol="WmRil_PhonebookCapabilitiesReqParams"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tCapabilitiesReqParams"
              message="$(string.Event.WmRil_PhonebookCapabilitiesReqParams)" />

          <event value="8043"
              symbol="WmRil_PhonebookGetPBOptions_TotalRec_UsedRec_MaxAddrLen_MaxTextLen"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t4UInt32"
              message="$(string.Event.WmRil_PhonebookGetPBOptions_TotalRec_UsedRec_MaxAddrLen_MaxTextLen)" />

          <event value="8044"
              symbol="WmRil_PhonebookGetPBOptions_MaxAddnNum_MaxAddnNumLen"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_PhonebookGetPBOptions_MaxAddnNum_MaxAddnNumLen)" />

          <event value="8045"
              symbol="WmRil_PhonebookGetPBOptions_MaxAASStrLen_UsedAASRec_TotalAASRec"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t3UInt32"
              message="$(string.Event.WmRil_PhonebookGetPBOptions_MaxAASStrLen_UsedAASRec_TotalAASRec)" />

          <event value="8046"
              symbol="WmRil_PhonebookGetPBOptions_MaxEmails_MaxEmailLen"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_PhonebookGetPBOptions_MaxEmails_MaxEmailLen)" />

          <event value="8047"
              symbol="WmRil_PhonebookGetPBOptions_MaxGroups"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_PhonebookGetPBOptions_MaxGroups)" />

          <event value="8048"
              symbol="WmRil_PhonebookGetPBOptions_MaxGASStrLen_UsedGASRec_TotalGASRec"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t3UInt32"
              message="$(string.Event.WmRil_PhonebookGetPBOptions_MaxGASStrLen_UsedGASRec_TotalGASRec)" />

          <event value="8049"
              symbol="WmRil_PhonebookGetPBOptions_MaxSecondNameStrLen"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_PhonebookGetPBOptions_MaxSecondNameStrLen)" />

          <event value="8050"
              symbol="WmRil_PhonebookGetPBOptions_PBIParams"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tGetPBOptions_PBIParams"
              message="$(string.Event.WmRil_PhonebookGetPBOptions_PBIParams)" />

          <event value="8051"
              symbol="WmRil_PhonebookGetPBOptions_InputParams"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tWrite_InputParams"
              message="$(string.Event.WmRil_PhonebookGetPBOptions_InputParams)" />

          <event value="8052"
              symbol="WmRil_PhonebookGetAllAddnNumStr_InputParams"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_PhonebookGetAllAddnNumStr_InputParams)" />

          <event value="8053"
              symbol="WmRil_PhonebookNoAASData"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookNoAASData)" />

          <event value="8054"
              symbol="WmRil_PhonebookAASEntry_Size_NumId_AAS"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t3UInt32AndUnicodeString"
              message="$(string.Event.WmRil_PhonebookAASEntry_Size_NumId_AAS)" />

          <event value="8055"
              symbol="WmRil_PhonebookTotalSize_NumAAS"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_PhonebookTotalSize_NumAAS)" />

          <event value="8056"
              symbol="WmRil_PhonebookSendEmptyListInResp"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_PhonebookSendEmptyListInResp)" />

          <event value="8057"
              symbol="WmRil_PhonebookWriteAddnNumStr_InputParams"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tWriteAddnNumStr_InputParams"
              message="$(string.Event.WmRil_PhonebookWriteAddnNumStr_InputParams)" />

          <event value="8058"
              symbol="WmRil_PhonebookSetAASReqData"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tSetAASReqData"
              message="$(string.Event.WmRil_PhonebookSetAASReqData)" />

          <event value="8059"
              symbol="WmRil_PhonebookIndicationData"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tIndicationData"
              message="$(string.Event.WmRil_PhonebookIndicationData)" />

          <event value="8060"
              symbol="WmRil_PhonebookNotCorrectInd_WriteAddnNumStr"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookNotCorrectInd_WriteAddnNumStr)" />

          <event value="8061"
              symbol="WmRil_PhonebookSendResp_WriteAddnNumStr"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookSendResp_WriteAddnNumStr)" />

          <event value="8062"
              symbol="WmRil_PhonebookSendResp_WriteAddnNumStr_ProcessResp"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookSendResp_WriteAddnNumStr_ProcessResp)" />

          <event value="8063"
              symbol="WmRil_PhonebookDelAddnNumStr_InputParams"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2Dwords"
              message="$(string.Event.WmRil_PhonebookDelAddnNumStr_InputParams)" />

          <event value="8064"
              symbol="WmRil_PhonebookSetAASReqData_DelAddnNumStr"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tSetAASReqData_DelAddnNumStr"
              message="$(string.Event.WmRil_PhonebookSetAASReqData_DelAddnNumStr)" />

          <event value="8065"
              symbol="WmRil_PhonebookIndicationData_DelAddnNumStr"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tIndicationData"
              message="$(string.Event.WmRil_PhonebookIndicationData_DelAddnNumStr)" />

          <event value="8066"
              symbol="WmRil_PhonebookNotCorrectInd_DelAddnNumStr"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookNotCorrectInd_DelAddnNumStr)" />

          <event value="8067"
              symbol="WmRil_PhonebookSendResp_DelAddnNumStr"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookSendResp_DelAddnNumStr)" />

          <event value="8068"
              symbol="WmRil_PhonebookSendResp_DelAddnNumStr_ProcessResp"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookSendResp_DelAddnNumStr_ProcessResp)" />

          <event value="8069"
              symbol="WmRil_PhonebookHardcodedEmergencyNosPresent"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_PhonebookHardcodedEmergencyNosPresent)" />

          <event value="8070"
              symbol="WmRil_PhonebookAddedEmergNumToList"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiString"
              message="$(string.Event.WmRil_PhonebookAddedEmergNumToList)" />

          <event value="8071"
              symbol="WmRil_PhonebookNVEmergencyNosPresent"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_PhonebookNVEmergencyNosPresent)" />

          <event value="8072"
              symbol="WmRil_PhonebookCardEmergencyNosPresent"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_PhonebookCardEmergencyNosPresent)" />

          <event value="8073"
              symbol="WmRil_PhonebookCardNumForSession"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tCardNumForSession"
              message="$(string.Event.WmRil_PhonebookCardNumForSession)" />

          <event value="8074"
              symbol="WmRil_PhonebookNetworkEmergencyNosPresent"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_PhonebookNetworkEmergencyNosPresent)" />

          <event value="8075"
              symbol="WmRil_PhonebookNetworkNumForSession"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tCardNumForSession"
              message="$(string.Event.WmRil_PhonebookNetworkNumForSession)" />

          <event value="8076"
              symbol="WmRil_PhonebookPbmEmergCat"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_PhonebookPbmEmergCat)" />

          <event value="8077"
              symbol="WmRil_PhonebookFoundDupEmergNum"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookFoundDupEmergNum)" />

          <event value="8079"
              symbol="WmRil_PhonebookTotalSize_NoEmergNum"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_PhonebookTotalSize_NoEmergNum)" />

          <event value="8080"
              symbol="WmRil_PhonebookReportState"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t6UInt32"
              message="$(string.Event.WmRil_PhonebookReportState)" />

          <event value="8081"
              symbol="WmRil_PhonebookSessionType_StoreLocBitMask"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tSessionType_StoreLocBitMask"
              message="$(string.Event.WmRil_PhonebookSessionType_StoreLocBitMask)" />

          <event value="8082"
              symbol="WmRil_PhonebookNumId_Text"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUnicodeStringAndUInt32"
              message="$(string.Event.WmRil_PhonebookNumId_Text)" />

          <event value="8083"
              symbol="WmRil_PhonebookPBMAlphaTag_RilAASTag"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiStringAndUnicodeString"
              message="$(string.Event.WmRil_PhonebookPBMAlphaTag_RilAASTag)" />

          <event value="8084"
              symbol="WmRil_PhonebookNoUpdateListEmpty"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookNoUpdateListEmpty)" />

          <event value="8085"
              symbol="WmRil_PhonebookAddingNewEntryAASList"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUnicodeStringAndUInt32"
              message="$(string.Event.WmRil_PhonebookAddingNewEntryAASList)" />

          <event value="8086"
              symbol="WmRil_PhonebookModifiedEntryAASList"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUnicodeStringAndUInt32"
              message="$(string.Event.WmRil_PhonebookModifiedEntryAASList)" />

          <event value="8087"
              symbol="WmRil_PhonebookDeletingEntryAASList"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_PhonebookDeletingEntryAASList)" />

          <event value="8088"
              symbol="WmRil_PhonebookIndRegReq_RegMask"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_PhonebookIndRegReq_RegMask)" />

          <event value="8089"
              symbol="WmRil_PhonebookIndRegRespRegMask"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_PhonebookIndRegRespRegMask)" />

          <event value="8090"
              symbol="WmRil_PhonebookRegSuccessForPbEvents"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookRegSuccessForPbEvents)" />

          <event value="8091"
              symbol="WmRil_PhonebookUnexpectedIndication"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUnicodeStringAndUInt32"
              message="$(string.Event.WmRil_PhonebookUnexpectedIndication)" />

          <event value="8092"
              symbol="WmRil_PhonebookUnexpectedQmiService"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUnexpectedQmiService"
              message="$(string.Event.WmRil_PhonebookUnexpectedQmiService)" />

          <event value="8093"
              symbol="WmRil_PhonebookNumInstancesPbReadyInfo"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tNumInstancesPbReadyInfo"
              message="$(string.Event.WmRil_PhonebookNumInstancesPbReadyInfo)" />

          <event value="8094"
              symbol="WmRil_PhonebookPbmRefInd_SessionType_PbType_Status"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tPbmRefInd_SessionType_PbType_Status"
              message="$(string.Event.WmRil_PhonebookPbmRefInd_SessionType_PbType_Status)" />

          <event value="8095"
              symbol="WmRil_PhonebookPbmRefIndIgnore"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookPbmRefIndIgnore)" />

          <event value="8096"
              symbol="WmRil_PhonebookPbmReadyInd_SessionType_PbType"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tPbmReadyInd_SessionType_PbType"
              message="$(string.Event.WmRil_PhonebookPbmReadyInd_SessionType_PbType)" />

          <event value="8097"
              symbol="WmRil_PhonebookPbmRecordUpdateInd_SessionType_PbType_Operation_RecId"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tPbmRecordUpdateInd_SessionType_PbType_Operation_RecId"
              message="$(string.Event.WmRil_PhonebookPbmRecordUpdateInd_SessionType_PbType_Operation_RecId)" />

          <event value="8098"
              symbol="WmRil_PhonebookPbmAasUpdateInd_SessionType_Operation_AasId_AlphaLen"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tPbmAasUpdateInd_SessionType_Operation_AasId_AlphaLen"
              message="$(string.Event.WmRil_PhonebookPbmAasUpdateInd_SessionType_Operation_AasId_AlphaLen)" />

          <event value="8099"
              symbol="WmRil_PhonebookAlphaTag"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tUnicodeString"
              message="$(string.Event.WmRil_PhonebookAlphaTag)" />

          <event value="8100"
              symbol="WmRil_PhonebookStorelocBitMask"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tWord"
              message="$(string.Event.WmRil_PhonebookStorelocBitMask)" />

          <event value="8101"
              symbol="WmRil_PhonebookStorelocBitMask_Old"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_PhonebookStorelocBitMask_Old)" />

          <event value="8102"
              symbol="WmRil_PhonebookStorelocBitMask_New"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_PhonebookStorelocBitMask_New)" />

          <event value="8103"
              symbol="WmRil_PhonebookNoNewEntryAdded"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookNoNewEntryAdded)" />

          <event value="8104"
              symbol="WmRil_PhonebookSendPbReadyState"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookSendPbReadyState)" />

          <event value="8105"
              symbol="WmRil_PhonebookClearingAASList"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tPbmSessionType"
              message="$(string.Event.WmRil_PhonebookClearingAASList)" />

          <event value="8106"
              symbol="WmRil_PhonebookPbType_StoreLocMask_SLBitMask_tempSLBitMask"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="t2WordsAnd2Dwords"
              message="$(string.Event.WmRil_PhonebookPbType_StoreLocMask_SLBitMask_tempSLBitMask)" />

          <event value="8107"
              symbol="WmRil_PhonebookUpdateSessionInfoReqIgnored"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookUpdateSessionInfoReqIgnored)" />

          <event value="8108"
              symbol="WmRil_PhonebookNoMatchingEntryFound_SetAASList"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tPbmSessionType"
              message="$(string.Event.WmRil_PhonebookNoMatchingEntryFound_SetAASList)" />

          <event value="8109"
              symbol="WmRil_PhonebookNoMatchingSessionInList_GetAASList"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookNoMatchingSessionInList_GetAASList)" />

          <event value="8110"
              symbol="WmRil_PhonebookADNCapabilityNotPresent_SessionType"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tPbmSessionType"
              message="$(string.Event.WmRil_PhonebookADNCapabilityNotPresent_SessionType)" />

          <event value="8111"
              symbol="WmRil_PhonebookUpdateADNCapCahce"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookUpdateADNCapCahce)" />

          <event value="8112"
              symbol="WmRil_PhonebookADNCapPresent"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookADNCapPresent)" />

          <event value="8113"
              symbol="WmRil_PhonebookNoMatchingSession_GetADNCapsInfo"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookNoMatchingSession_GetADNCapsInfo)" />

          <event value="8114"
              symbol="WmRil_PhonebookNoMatchingSession_SetADNCapsInfo"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookNoMatchingSession_SetADNCapsInfo)" />

          <event value="8115"
              symbol="WmRil_PhonebookDelete_InternalVerifyUICCLockCmd"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_PhonebookDelete_InternalVerifyUICCLockCmd)" />

          <event value="8116"
              symbol="WmRil_Phonebook_InternalVerifyUICCLockCmd"
              task="TaskPhonebook"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_Phonebook_InternalVerifyUICCLockCmd)" />

          <!-- CAT 9000-9999 -->
          <event value="9000"
              symbol="WmRil_CatSzDw"
              task="TaskCat"
              keywords="Tracing"
              level="win:Informational"
              template="tAnsiStringAndDword"
              message="$(string.Event.WmRil_CatSzDw)" />

          <!-- SMS 10000-10999 -->

          <event value="10000"
              symbol="WmRil_WMSSendMsgID"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSSendMsgID)" />

          <event value="10001"
              symbol="WmRil_WMSSendMsgIMSFirst"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tSMSFormat"
              message="$(string.Event.WmRil_WMSSendMsgIMSFirst)" />

          <event value="10002"
              symbol="WmRil_WMSSendMsgIMSSecond"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tSMSFormat"
              message="$(string.Event.WmRil_WMSSendMsgIMSSecond)" />

          <event value="10003"
              symbol="WmRil_WMSHuiccAppMatch"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSHuiccAppMatch)" />

          <event value="10004"
              symbol="WmRil_WMSRilMsgParameters"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t3UInt32"
              message="$(string.Event.WmRil_WMSRilMsgParameters)" />

          <event value="10005"
              symbol="WmRil_WMSMsgLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSMsgLength)" />

          <event value="10006"
              symbol="WmRil_WMSMsgID"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSMsgID)" />

          <event value="10007"
              symbol="WmRil_WMSHdrLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSHdrLength)" />

          <event value="10008"
              symbol="WmRil_WMSHdrBytesDecoded"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSHdrBytesDecoded)" />

          <event value="10009"
              symbol="WmRil_WMSMsgEncoding"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tRilMsgEncoding"
              message="$(string.Event.WmRil_WMSMsgEncoding)" />

          <event value="10010"
              symbol="WmRil_WMSDataLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSDataLength)" />

          <event value="10011"
              symbol="WmRil_WMSMsgPriority"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tRilMsgPriority"
              message="$(string.Event.WmRil_WMSMsgPriority)" />

          <event value="10012"
              symbol="WmRil_WMSMsgPrivacy"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tRilMsgPrivacy"
              message="$(string.Event.WmRil_WMSMsgPrivacy)" />

          <event value="10013"
              symbol="WmRil_WMSAckRequests"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2Boolean"
              message="$(string.Event.WmRil_WMSAckRequests)" />

          <event value="10014"
              symbol="WmRil_WMSAddrParams"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t3UInt32"
              message="$(string.Event.WmRil_WMSAddrParams)" />

          <event value="10015"
              symbol="WmRil_WMSAddrParamNotPresent"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSAddrParamNotPresent)" />

          <event value="10016"
              symbol="WmRil_WMSAddrLenError"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSAddrLenError)" />

          <event value="10017"
              symbol="WmRil_WMSInvalidAddrLen"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSInvalidAddrLen)" />

          <event value="10018"
              symbol="WmRil_WMSConvertTCharStrToCharStrFailed"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSConvertTCharStrToCharStrFailed)" />

          <event value="10019"
              symbol="WmRil_WMSAddress"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tSubAddrAddressParams"
              message="$(string.Event.WmRil_WMSAddress)" />

          <event value="10020"
              symbol="WmRil_WMSInvalidMsgMode"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tWmsTeleservice"
              message="$(string.Event.WmRil_WMSInvalidMsgMode)" />

          <event value="10021"
              symbol="WmRil_WMSInvalidMessageLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSInvalidMessageLength)" />

          <event value="10022"
              symbol="WmRil_WMSTeleservice"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tWmsTeleservice"
              message="$(string.Event.WmRil_WMSTeleservice)" />

          <event value="10023"
              symbol="WmRil_WMSMissingBCSrvCategory"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMissingBCSrvCategory)" />

          <event value="10024"
              symbol="WmRil_WMSSubAddrParams"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tRilSubAddrParams"
              message="$(string.Event.WmRil_WMSSubAddrParams)" />

          <event value="10025"
              symbol="WmRil_WMSSubAddrParamNotPresent"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSSubAddrParamNotPresent)" />

          <event value="10026"
              symbol="WmRil_WMSInvalidSubAddrType"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSInvalidSubAddrType)" />

          <event value="10027"
              symbol="WmRil_WMSNoHashAtStartInSubAddr"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSNoHashAtStartInSubAddr)" />

          <event value="10028"
              symbol="WmRil_WMSInvalidSubAddrLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSInvalidSubAddrLength)" />

          <event value="10029"
              symbol="WmRil_WMSSubAddrLengthZero"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSSubAddrLengthZero)" />

          <event value="10030"
              symbol="WmRil_WMSSubAddrLengthMax"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSSubAddrLengthMax)" />

          <event value="10031"
              symbol="WmRil_WMSSubAddrStrConversionFailed"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSSubAddrStrConversionFailed)" />

          <event value="10032"
              symbol="WmRil_WMSSubAddrLengthFailed"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSSubAddrLengthFailed)" />

          <event value="10033"
              symbol="WmRil_WMSSubAddrByteConversionFailed"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSSubAddrByteConversionFailed)" />

          <event value="10034"
              symbol="WmRil_WMSSubAddrParamMissing"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSSubAddrParamMissing)" />

          <event value="10035"
              symbol="WmRil_WMSSubAddrAddressParams"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tSubAddrAddressParams"
              message="$(string.Event.WmRil_WMSSubAddrAddressParams)" />

          <event value="10036"
              symbol="WmRil_WMSInvalidBDLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSInvalidBDLength)" />

          <event value="10037"
              symbol="WmRil_WMSInvalidParamSize"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSInvalidParamSize)" />

          <event value="10038"
              symbol="WmRil_WMSInvalidRilMsgType"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSInvalidRilMsgType)" />

          <event value="10039"
              symbol="WmRil_WMSSMSCStringConversionFailed"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSSMSCStringConversionFailed)" />

          <event value="10040"
              symbol="WmRil_WMSInvalidSMSCLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSInvalidSMSCLength)" />

          <event value="10041"
              symbol="WmRil_WMSInvalidValidityFormat"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tRilMsgVPFormat"
              message="$(string.Event.WmRil_WMSInvalidValidityFormat)" />

          <event value="10042"
              symbol="WmRil_WMSDCSType"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tMsgDcsType"
              message="$(string.Event.WmRil_WMSDCSType)" />

          <event value="10043"
              symbol="WmRil_WMSMsgClass"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tMsgDcsMsgClass"
              message="$(string.Event.WmRil_WMSMsgClass)" />

          <event value="10044"
              symbol="WmRil_WMSMsgWaitingindication"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tMsgWaitingIndication"
              message="$(string.Event.WmRil_WMSMsgWaitingindication)" />

          <event value="10045"
              symbol="WmRil_WMSRelativeInvalidYear"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSRelativeInvalidYear)" />

          <event value="10046"
              symbol="WmRil_WMSRelativeInvalidMonth"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSRelativeInvalidMonth)" />

          <event value="10047"
              symbol="WmRil_WMSRelativeInvalidDay"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSRelativeInvalidDay)" />

          <event value="10048"
              symbol="WmRil_WMSRelativeInvalidHour"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSRelativeInvalidHour)" />

          <event value="10049"
              symbol="WmRil_WMSRelativeInvalidMinute"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSRelativeInvalidMinute)" />

          <event value="10050"
              symbol="WmRil_WMSAbsoluteInvalidYear"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSAbsoluteInvalidYear)" />

          <event value="10051"
              symbol="WmRil_WMSAbsoluteInvalidMonth"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSAbsoluteInvalidMonth)" />
			
          <event value="10052"
              symbol="WmRil_WMSAbsoluteInvalidDay"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSAbsoluteInvalidDay)" />

          <event value="10053"
              symbol="WmRil_WMSAbsoluteInvalidHour"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSAbsoluteInvalidHour)" />

          <event value="10054"
              symbol="WmRil_WMSAbsoluteInvalidMinute"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSAbsoluteInvalidMinute)" />

          <event value="10055"
              symbol="WmRil_WMSAbsoluteInvalidSecond"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSAbsoluteInvalidSecond)" />

          <event value="10056"
              symbol="WmRil_WMSInvalidMsgHdrLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_WMSInvalidMsgHdrLength)" />
			
          <event value="10057"
              symbol="WmRil_WMSZeroMessageLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSZeroMessageLength)" />

          <event value="10058"
              symbol="WmRil_WMSMaxMessageLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMaxMessageLength)" />

          <event value="10059"
              symbol="WmRil_WMSNullPointerToUDH"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSNullPointerToUDH)" />

          <event value="10060"
              symbol="WmRil_WMSUDHLengthMorethanUD"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt8"
              message="$(string.Event.WmRil_WMSUDHLengthMorethanUD)" />

          <event value="10061"
              symbol="WmRil_WMSZeroHeaders"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSZeroHeaders)" />

          <event value="10062"
              symbol="WmRil_WMSNumberOfHeaders"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSNumberOfHeaders)" />

          <!-- MT Side Events-->
          <event value="10063"
              symbol="WmRil_WMSSourceID"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tSourceType"
              message="$(string.Event.WmRil_WMSSourceID)" />

          <event value="10064"
              symbol="WmRil_WMSServiceIDAndMessageID"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tSrvIDAndMsgID"
              message="$(string.Event.WmRil_WMSServiceIDAndMessageID)" />

          <event value="10065"
              symbol="WmRil_WMSMismatchBlobSizeAndWMSEvtRptInd"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_WMSMismatchBlobSizeAndWMSEvtRptInd)" />

          <event value="10066"
              symbol="WmRil_WMSMTSMSStoreUIM"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMTSMSStoreUIM)" />

          <event value="10067"
              symbol="WmRil_WMSMessageModeInvalid"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMessageModeInvalid)" />

          <event value="10068"
              symbol="WmRil_WMSInvalidSubscriptionIndex"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tDword"
              message="$(string.Event.WmRil_WMSInvalidSubscriptionIndex)" />

          <event value="10069"
              symbol="WmRil_WMSInvalidWMSMessageMode"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tWmsMessageMode"
              message="$(string.Event.WmRil_WMSInvalidWMSMessageMode)" />

          <event value="10070"
              symbol="WmRil_WMSFailFindinghUiccApp"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tSubscriptionAndMessageMode"
              message="$(string.Event.WmRil_WMSFailFindinghUiccApp)" />

          <event value="10071"
              symbol="WmRil_WMSMTSMSStoreNV"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMTSMSStoreNV)" />

          <event value="10072"
              symbol="WmRil_WMSNVStorageIndex"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSNVStorageIndex)" />

          <event value="10073"
              symbol="WmRil_WMSNVInvalidMsgMode"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSNVInvalidMsgMode)" />

          <event value="10074"
              symbol="WmRil_WMSNVRawReadRequestFailed"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiWmsMessageReq"
              message="$(string.Event.WmRil_WMSNVRawReadRequestFailed)" />

          <event value="10075"
              symbol="WmRil_WMSNVRespError"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tQMIResp_Result_Error"
              message="$(string.Event.WmRil_WMSNVRespError)" />

          <event value="10076"
              symbol="WmRil_WMSMTSMSFormat"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tQmiWmsMessageReq"
              message="$(string.Event.WmRil_WMSMTSMSFormat)" />

          <event value="10077"
              symbol="WmRil_WMSMTInvalidSMSCOffset"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTInvalidSMSCOffset)" />

          <event value="10078"
              symbol="WmRil_WMSMTSMSDeliver"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMTSMSDeliver)" />

          <event value="10079"
              symbol="WmRil_WMSMTSMSStatusReport"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMTSMSStatusReport)" />

          <event value="10080"
              symbol="WmRil_WMSMTInvalidMsgType"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMTInvalidMsgType)" />

          <event value="10081"
              symbol="WmRil_WMSMTAddrLenLong"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTAddrLenLong)" />

          <event value="10082"
              symbol="WmRil_WMSMTExceedsNumOfDigits"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTExceedsNumOfDigits)" />

          <event value="10083"
              symbol="WmRil_WMSMTDecodedAddrTooLong"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt16"
              message="$(string.Event.WmRil_WMSMTDecodedAddrTooLong)" />

          <event value="10084"
              symbol="WmRil_WMSMTRilAddrNumberParams"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tRilAddrParams"
              message="$(string.Event.WmRil_WMSMTRilAddrNumberParams)" />

          <event value="10085"
              symbol="WmRil_WMSMTRilAddrParams"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUnicodeAndUInt32"
              message="$(string.Event.WmRil_WMSMTRilAddrParams)" />

          <event value="10086"
              symbol="WmRil_WMSMTDCS"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTDCS)" />

          <event value="10087"
              symbol="WmRil_WMSMTDCSAlphabet"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSMTDCSAlphabet)" />

          <event value="10088"
              symbol="WmRil_WMSMTDeliverInvalidByteStream"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMTDeliverInvalidByteStream)" />

          <event value="10089"
              symbol="WmRil_WMSMTInvalidBCDDigit"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTInvalidBCDDigit)" />

          <event value="10090"
              symbol="WmRil_WMSMTInvalidMonth"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt16"
              message="$(string.Event.WmRil_WMSMTInvalidMonth)" />

          <event value="10091"
              symbol="WmRil_WMSMTInvalidDay"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt16"
              message="$(string.Event.WmRil_WMSMTInvalidDay)" />

          <event value="10092"
              symbol="WmRil_WMSMTInvalidHour"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt16"
              message="$(string.Event.WmRil_WMSMTInvalidHour)" />

          <event value="10093"
              symbol="WmRil_WMSMTInvalidMinute"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt16"
              message="$(string.Event.WmRil_WMSMTInvalidMinute)" />

          <event value="10094"
              symbol="WmRil_WMSMTInvalidSecond"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt16"
              message="$(string.Event.WmRil_WMSMTInvalidSecond)" />

          <event value="10095"
              symbol="WmRil_WMSMTTimeStamp"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tRilTimeParams"
              message="$(string.Event.WmRil_WMSMTTimeStamp)" />

          <event value="10096"
              symbol="WmRil_WMSMTZeroUDLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMTZeroUDLength)" />

          <event value="10097"
              symbol="WmRil_WMSMTInvalidUDLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTInvalidUDLength)" />

          <event value="10098"
              symbol="WmRil_WMSMTUDHMoreThanUD"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt8"
              message="$(string.Event.WmRil_WMSMTUDHMoreThanUD)" />

          <event value="10099"
              symbol="WmRil_WMSMTMessageLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt16"
              message="$(string.Event.WmRil_WMSMTMessageLength)" />

          <event value="10100"
              symbol="WmRil_WMSMTStatusInvalidByteStream"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMTStatusInvalidByteStream)" />

          <event value="10101"
              symbol="WmRil_WMSBCInvalidDataLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tMessageFormat"
              message="$(string.Event.WmRil_WMSBCInvalidDataLength)" />

          <event value="10102"
              symbol="WmRil_WMSBCInvalidPageNumber"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_WMSBCInvalidPageNumber)" />

          <event value="10103"
              symbol="WmRil_WMSBCPageHeaderParams"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tGwBcPageHeader"
              message="$(string.Event.WmRil_WMSBCPageHeaderParams)" />

          <event value="10104"
              symbol="WmRil_WMSBCInvalidMessageLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt16"
              message="$(string.Event.WmRil_WMSBCInvalidMessageLength)" />

          <event value="10105"
              symbol="WmRil_WMSBCParams"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_WMSBCParams)" />

          <event value="10106"
              symbol="WmRil_WMSMTInvalidMessageLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSMTInvalidMessageLength)" />

          <event value="10107"
              symbol="WmRil_WMSMTInvalidMessageType"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTInvalidMessageType)" />

          <event value="10108"
              symbol="WmRil_WMSMTMessageType"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tTLMessageType"
              message="$(string.Event.WmRil_WMSMTMessageType)" />

          <event value="10109"
              symbol="WmRil_WMSMTIncorrectDecodedMsgSize"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSMTIncorrectDecodedMsgSize)" />

          <event value="10110"
              symbol="WmRil_WMSMTParamIDExceedsMsgSize"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tParamTLIDAndMsgLength"
              message="$(string.Event.WmRil_WMSMTParamIDExceedsMsgSize)" />

          <event value="10111"
              symbol="WmRil_WMSMTDupParamID"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tTLParamID"
              message="$(string.Event.WmRil_WMSMTDupParamID)" />

          <event value="10112"
              symbol="WmRil_WMSMTTeleservice"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSMTTeleservice)" />

          <event value="10113"
              symbol="WmRil_WMSMTBadParamLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tTLParamIDAndParamLen"
              message="$(string.Event.WmRil_WMSMTBadParamLength)" />

          <event value="10114"
              symbol="WmRil_WMSMTServiceID"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSMTServiceID)" />

          <event value="10115"
              symbol="WmRil_WMSMTSubAddrInvalidDigits"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTSubAddrInvalidDigits)" />

          <event value="10116"
              symbol="WmRil_WMSMTSubAddrInvalidDecodedAddr"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt16"
              message="$(string.Event.WmRil_WMSMTSubAddrInvalidDecodedAddr)" />

          <event value="10117"
              symbol="WmRil_WMSMTSubAddrParams"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tSubAddrParams"
              message="$(string.Event.WmRil_WMSMTSubAddrParams)" />

          <event value="10118"
              symbol="WmRil_WMSMTInvalidBearerDataLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8AndtUInt32"
              message="$(string.Event.WmRil_WMSMTInvalidBearerDataLength)" />

          <event value="10119"
              symbol="WmRil_WMSMTInvalidParmID"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tTLParamID"
              message="$(string.Event.WmRil_WMSMTInvalidParmID)" />

          <event value="10120"
              symbol="WmRil_WMSMTMandatoryParamsMissing"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tTLMessageType"
              message="$(string.Event.WmRil_WMSMTMandatoryParamsMissing)" />

          <event value="10121"
              symbol="WmRil_WMSMTMWINumberOfMessages"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSMTMWINumberOfMessages)" />

          <event value="10122"
              symbol="WmRil_WMSMTInvalidBDLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTInvalidBDLength)" />

          <event value="10123"
              symbol="WmRil_WMSMTInvalidDecodedBDLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tBDParams"
              message="$(string.Event.WmRil_WMSMTInvalidDecodedBDLength)" />

          <event value="10124"
              symbol="WmRil_WMSMTBDDupParamID"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tBDParamID"
              message="$(string.Event.WmRil_WMSMTBDDupParamID)" />

          <event value="10125"
              symbol="WmRil_WMSMTInvalidBDParamLen"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tBDInvalidParamLen"
              message="$(string.Event.WmRil_WMSMTInvalidBDParamLen)" />

          <event value="10126"
              symbol="WmRil_WMSMTInvalidSCTS"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt16"
              message="$(string.Event.WmRil_WMSMTInvalidSCTS)" />

          <event value="10127"
              symbol="WmRil_WMSMTInvalidNumberOfMessages"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTInvalidNumberOfMessages)" />

          <event value="10128"
              symbol="WmRil_WMSMTNumberOfMessages"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSMTNumberOfMessages)" />

          <event value="10129"
              symbol="WmRil_WMSMTUnsupportedParamID"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tBDParamIDAndParamLen"
              message="$(string.Event.WmRil_WMSMTUnsupportedParamID)" />

          <event value="10130"
              symbol="WmRil_WMSMTInvalidBDMessageType"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMTInvalidBDMessageType)" />

          <event value="10131"
              symbol="WmRil_WMSMTEncodingType"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tWmsEncoding"
              message="$(string.Event.WmRil_WMSMTEncodingType)" />

          <event value="10132"
              symbol="WmRil_WMSMTNumberOfDigits"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTNumberOfDigits)" />

          <event value="10133"
              symbol="WmRil_WMSMTInvalidBDUserData"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSMTInvalidBDUserData)" />

          <event value="10134"
              symbol="WmRil_WMSMTUDHPresent"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tBoolean"
              message="$(string.Event.WmRil_WMSMTUDHPresent)" />

          <event value="10135"
              symbol="WmRil_WMSMTUDHLMoreThanUDH"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt8"
              message="$(string.Event.WmRil_WMSMTUDHLMoreThanUDH)" />

          <event value="10136"
              symbol="WmRil_WMSMTHeaderParams"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt8"
              message="$(string.Event.WmRil_WMSMTHeaderParams)" />

          <event value="10137"
              symbol="WmRil_WMSMTInvalidTLMsgType"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tIncorrectBDParams"
              message="$(string.Event.WmRil_WMSMTInvalidTLMsgType)" />

          <event value="10138"
              symbol="WmRil_WMSCAMERecordType"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSCAMERecordType)" />

          <event value="10139"
              symbol="WmRil_WMSInvalidCMAEDataLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSInvalidCMAEDataLength)" />

          <event value="10140"
              symbol="WmRil_WMSInvalidCMAERecord"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSInvalidCMAERecord)" />

          <event value="10141"
              symbol="WmRil_WMSCMAERecordLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSCMAERecordLength)" />

          <event value="10142"
              symbol="WmRil_WMSInvalidCMAERecordLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSInvalidCMAERecordLength)" />

          <event value="10143"
              symbol="WmRil_WMSZeroCMAERecords"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSZeroCMAERecords)" />

          <event value="10144"
              symbol="WmRil_WMSCMAERecord0NotFound"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSCMAERecord0NotFound)" />

          <event value="10145"
              symbol="WmRil_WMSMTInvalidRawMsgFormat"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tMessageFormat"
              message="$(string.Event.WmRil_WMSMTInvalidRawMsgFormat)" />

          <event value="10146"
              symbol="WmRil_WMSNofityMsgInUICC"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSNofityMsgInUICC)" />

          <event value="10147"
              symbol="WmRil_WMSNotifyMessageonNV"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSNotifyMessageonNV)" />

          <event value="10148"
              symbol="WmRil_WMSInvalidSMSStoreLoc"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSInvalidSMSStoreLoc)" />

          <event value="10149"
              symbol="WmRil_WMSMTMessage"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSMTMessage)" />

          <event value="10150"
              symbol="WmRil_WMSMTMessageFormat"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tMessageFormat"
              message="$(string.Event.WmRil_WMSMTMessageFormat)" />

          <event value="10151"
              symbol="WmRil_WMSNoIMShUiccApp"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSNoIMShUiccApp)" />

          <event value="10152"
              symbol="WmRil_WMSTransactionID"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSTransactionID)" />

          <event value="10153"
              symbol="WmRil_WMSNotifyMTMessage"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSNotifyMTMessage)" />

          <event value="10154"
              symbol="WmRil_WMSNoNotification"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tMessageFormat"
              message="$(string.Event.WmRil_WMSNoNotification)" />

          <event value="10155"
              symbol="WmRil_WMSTLAckNotRequested"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSTLAckNotRequested)" />

          <event value="10156"
              symbol="WmRil_WMSNoAckForAckIndicator"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSNoAckForAckIndicator)" />

          <event value="10157"
              symbol="WmRil_WMSBuildAckInfo"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tBuildMsgAck"
              message="$(string.Event.WmRil_WMSBuildAckInfo)" />

          <event value="10158"
              symbol="WmRil_WMSQMIResultError"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tQMIResp_Result_Error"
              message="$(string.Event.WmRil_WMSQMIResultError)" />

          <event value="10159"
              symbol="WmRil_WMSETWSMessage"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_WMSETWSMessage)" />

          <event value="10160"
              symbol="WmRil_WMSInvalidETWSMsgLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSInvalidETWSMsgLength)" />

          <event value="10161"
              symbol="WmRil_WMSInvalidETWSPriMessageID"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSInvalidETWSPriMessageID)" />

          <event value="10162"
              symbol="WmRil_WMSInvalidETWSPriDataLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSInvalidETWSPriDataLength)" />

          <event value="10163"
              symbol="WmRil_WMSETWSPriMsgParams"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tETWSPriMsgParams"
              message="$(string.Event.WmRil_WMSETWSPriMsgParams)" />

          <event value="10164"
              symbol="WmRil_WMSInvalidSecETWSMsgDataLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt32"
              message="$(string.Event.WmRil_WMSInvalidSecETWSMsgDataLength)" />

          <event value="10165"
              symbol="WmRil_WMSSecETWSMsgInvalidPageNumber"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="t2UInt32"
              message="$(string.Event.WmRil_WMSSecETWSMsgInvalidPageNumber)" />

          <event value="10166"
              symbol="WmRil_WMSSecETWSMsgInvalidMsgInfoLength"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tUInt8"
              message="$(string.Event.WmRil_WMSSecETWSMsgInvalidMsgInfoLength)" />

          <event value="10167"
              symbol="WmRil_WMSInvalidETWSMessageType"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tWmsETWSNotifType"
              message="$(string.Event.WmRil_WMSInvalidETWSMessageType)" />

          <event value="10168"
              symbol="WmRil_WMSETWSSecMsgParams"
              task="TaskSms"
              keywords="Tracing"
              level="win:Informational"
              template="tETWSSecMsgParams"
              message="$(string.Event.WmRil_WMSETWSSecMsgParams)" />

          <!-- APPERSO 11000-11999 -->
          <event value="11000"
              symbol="WmRil_APPersoCreatedUpdateUiccAPPersoCheckStateInternalCmd"
              task="TaskApperso"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_APPersoCreatedUpdateUiccAPPersoCheckStateInternalCmd)" />

          <event value="11001"
              symbol="WmRil_APPersoCallingUnregisterNotifyFnCb"
              task="TaskApperso"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_APPersoCallingUnregisterNotifyFnCb)" />

          <event value="11002"
              symbol="WmRil_APPersoExportedFuncsLoadedSuccess"
              task="TaskApperso"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_APPersoExportedFuncsLoadedSuccess)" />

          <event value="11003"
              symbol="WmRil_APPersoRegisteredForExtInd"
              task="TaskApperso"
              keywords="Tracing"
              level="win:Informational"
              template="tRegisteredForExtInd"
              message="$(string.Event.WmRil_APPersoRegisteredForExtInd)" />

          <event value="11004"
              symbol="WmRil_APPersoAPPersoActivatedFeaturesUpdatedSent"
              task="TaskApperso"
              keywords="Tracing"
              level="win:Informational"
              template="tEmpty"
              message="$(string.Event.WmRil_APPersoAPPersoActivatedFeaturesUpdatedSent)" />

          <event value="11005"
              symbol="WmRil_APPersoPersoFeature_CKRetries_PUKRetries"
              task="TaskApperso"
              keywords="Tracing"
              level="win:Informational"
              template="tPersoFeature_CKRetries_PUKRetries"
              message="$(string.Event.WmRil_APPersoPersoFeature_CKRetries_PUKRetries)" />

          <!-- SAR 12000-12999 -->

          <!-- IMS 13000-13999 -->

        </events>

      </provider>
    </events>
  </instrumentation>

  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Keyword.Error"                                            value="Error" />
        <string id="Keyword.Performance"                                      value="Performance" />
        <string id="Keyword.Tracing"                                          value="Tracing" />

        <string id="RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_NONE"                       value="RIL_SYSTEMTYPE_NONE" />
        <string id="RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_1XRTT"                      value="RIL_SYSTEMTYPE_1XRTT" />
        <string id="RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_EVDO"                       value="RIL_SYSTEMTYPE_EVDO" />
        <string id="RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_GSM"                        value="RIL_SYSTEMTYPE_GSM" />
        <string id="RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_UMTS"                       value="RIL_SYSTEMTYPE_UMTS" />
        <string id="RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_LTE"                        value="RIL_SYSTEMTYPE_LTE" />
        <string id="RIL_SYSTEMTYPE.RIL_SYSTEMTYPE_TDSCDMA"                    value="RIL_SYSTEMTYPE_TDSCDMA" />

        <string id="RIL_RESULT.RIL_E_PHONEFAILURE"                      value="RIL_E_PHONEFAILURE" />
        <string id="RIL_RESULT.RIL_E_NOCONNECTION"                      value="RIL_E_NOCONNECTION" />
        <string id="RIL_RESULT.RIL_E_LINKRESERVED"                      value="RIL_E_LINKRESERVED" />
        <string id="RIL_RESULT.RIL_E_OPNOTALLOWED"                      value="RIL_E_OPNOTALLOWED" />
        <string id="RIL_RESULT.RIL_E_OPNOTSUPPORTED"                    value="RIL_E_OPNOTSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_UICCNOTINSERTED"                   value="RIL_E_UICCNOTINSERTED" />
        <string id="RIL_RESULT.RIL_E_UICCFAILURE"                       value="RIL_E_UICCFAILURE" />
        <string id="RIL_RESULT.RIL_E_UICCBUSY"                          value="RIL_E_UICCBUSY" />
        <string id="RIL_RESULT.RIL_E_UICCWRONG"                         value="RIL_E_UICCWRONG" />
        <string id="RIL_RESULT.RIL_E_INCORRECTPASSWORD"                 value="RIL_E_INCORRECTPASSWORD" />
        <string id="RIL_RESULT.RIL_E_MEMORYFULL"                        value="RIL_E_MEMORYFULL" />
        <string id="RIL_RESULT.RIL_E_INVALIDINDEX"                      value="RIL_E_INVALIDINDEX" />
        <string id="RIL_RESULT.RIL_E_NOTFOUND"                          value="RIL_E_NOTFOUND" />
        <string id="RIL_RESULT.RIL_E_MEMORYFAILURE"                     value="RIL_E_MEMORYFAILURE" />
        <string id="RIL_RESULT.RIL_E_TEXTSTRINGTOOLONG"                 value="RIL_E_TEXTSTRINGTOOLONG" />
        <string id="RIL_RESULT.RIL_E_INVALIDTEXTSTRING"                 value="RIL_E_INVALIDTEXTSTRING" />
        <string id="RIL_RESULT.RIL_E_DIALSTRINGTOOLONG"                 value="RIL_E_DIALSTRINGTOOLONG" />
        <string id="RIL_RESULT.RIL_E_INVALIDDIALSTRING"                 value="RIL_E_INVALIDDIALSTRING" />
        <string id="RIL_RESULT.RIL_E_NONETWORKSVC"                      value="RIL_E_NONETWORKSVC" />
        <string id="RIL_RESULT.RIL_E_NETWORKTIMEOUT"                    value="RIL_E_NETWORKTIMEOUT" />
        <string id="RIL_RESULT.RIL_E_EMERGENCYONLY"                     value="RIL_E_EMERGENCYONLY" />
        <string id="RIL_RESULT.RIL_E_TELEMATICIWUNSUPPORTED"            value="RIL_E_TELEMATICIWUNSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_SMTYPE0UNSUPPORTED"                value="RIL_E_SMTYPE0UNSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_CANTREPLACEMSG"                    value="RIL_E_CANTREPLACEMSG" />
        <string id="RIL_RESULT.RIL_E_PROTOCOLIDERROR"                   value="RIL_E_PROTOCOLIDERROR" />
        <string id="RIL_RESULT.RIL_E_DCSUNSUPPORTED"                    value="RIL_E_DCSUNSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_MSGCLASSUNSUPPORTED"               value="RIL_E_MSGCLASSUNSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_DCSERROR"                          value="RIL_E_DCSERROR" />
        <string id="RIL_RESULT.RIL_E_CMDCANTBEACTIONED"                 value="RIL_E_CMDCANTBEACTIONED" />
        <string id="RIL_RESULT.RIL_E_CMDUNSUPPORTED"                    value="RIL_E_CMDUNSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_CMDERROR"                          value="RIL_E_CMDERROR" />
        <string id="RIL_RESULT.RIL_E_MSGBODYHEADERERROR"                value="RIL_E_MSGBODYHEADERERROR" />
        <string id="RIL_RESULT.RIL_E_SCBUSY"                            value="RIL_E_SCBUSY" />
        <string id="RIL_RESULT.RIL_E_NOSCSUBSCRIPTION"                  value="RIL_E_NOSCSUBSCRIPTION" />
        <string id="RIL_RESULT.RIL_E_SCSYSTEMFAILURE"                   value="RIL_E_SCSYSTEMFAILURE" />
        <string id="RIL_RESULT.RIL_E_INVALIDADDRESS"                    value="RIL_E_INVALIDADDRESS" />
        <string id="RIL_RESULT.RIL_E_DESTINATIONBARRED"                 value="RIL_E_DESTINATIONBARRED" />
        <string id="RIL_RESULT.RIL_E_REJECTEDDUPLICATE"                 value="RIL_E_REJECTEDDUPLICATE" />
        <string id="RIL_RESULT.RIL_E_VPFUNSUPPORTED"                    value="RIL_E_VPFUNSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_VPUNSUPPORTED"                     value="RIL_E_VPUNSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_UICCMSGSTORAGEFULL"                value="RIL_E_UICCMSGSTORAGEFULL" />
        <string id="RIL_RESULT.RIL_E_NOUICCMSGSTORAGE"                  value="RIL_E_NOUICCMSGSTORAGE" />
        <string id="RIL_RESULT.RIL_E_UICCTOOLKITBUSY"                   value="RIL_E_UICCTOOLKITBUSY" />
        <string id="RIL_RESULT.RIL_E_UICCDOWNLOADERROR"                 value="RIL_E_UICCDOWNLOADERROR" />
        <string id="RIL_RESULT.RIL_E_MSGSVCRESERVED"                    value="RIL_E_MSGSVCRESERVED" />
        <string id="RIL_RESULT.RIL_E_INVALIDMSGPARAM"                   value="RIL_E_INVALIDMSGPARAM" />
        <string id="RIL_RESULT.RIL_E_INVALIDSCADDRESS"                  value="RIL_E_INVALIDSCADDRESS" />
        <string id="RIL_RESULT.RIL_E_UNASSIGNEDNUMBER"                  value="RIL_E_UNASSIGNEDNUMBER" />
        <string id="RIL_RESULT.RIL_E_MSGBARREDBYOPERATOR"               value="RIL_E_MSGBARREDBYOPERATOR" />
        <string id="RIL_RESULT.RIL_E_MSGCALLBARRED"                     value="RIL_E_MSGCALLBARRED" />
        <string id="RIL_RESULT.RIL_E_MSGXFERREJECTED"                   value="RIL_E_MSGXFERREJECTED" />
        <string id="RIL_RESULT.RIL_E_DESTINATIONOUTOFSVC"               value="RIL_E_DESTINATIONOUTOFSVC" />
        <string id="RIL_RESULT.RIL_E_UNIDENTIFIEDSUBCRIBER"             value="RIL_E_UNIDENTIFIEDSUBCRIBER" />
        <string id="RIL_RESULT.RIL_E_SVCUNSUPPORTED"                    value="RIL_E_SVCUNSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_UNKNOWNSUBSCRIBER"                 value="RIL_E_UNKNOWNSUBSCRIBER" />
        <string id="RIL_RESULT.RIL_E_NETWKOUTOFORDER"                   value="RIL_E_NETWKOUTOFORDER" />
        <string id="RIL_RESULT.RIL_E_NETWKTEMPFAILURE"                  value="RIL_E_NETWKTEMPFAILURE" />
        <string id="RIL_RESULT.RIL_E_CONGESTION"                        value="RIL_E_CONGESTION" />
        <string id="RIL_RESULT.RIL_E_RESOURCESUNAVAILABLE"              value="RIL_E_RESOURCESUNAVAILABLE" />
        <string id="RIL_RESULT.RIL_E_SVCNOTSUBSCRIBED"                  value="RIL_E_SVCNOTSUBSCRIBED" />
        <string id="RIL_RESULT.RIL_E_SVCNOTIMPLEMENTED"                 value="RIL_E_SVCNOTIMPLEMENTED" />
        <string id="RIL_RESULT.RIL_E_INVALIDMSGREFERENCE"               value="RIL_E_INVALIDMSGREFERENCE" />
        <string id="RIL_RESULT.RIL_E_INVALIDMSG"                        value="RIL_E_INVALIDMSG" />
        <string id="RIL_RESULT.RIL_E_INVALIDMANDATORYINFO"              value="RIL_E_INVALIDMANDATORYINFO" />
        <string id="RIL_RESULT.RIL_E_MSGTYPEUNSUPPORTED"                value="RIL_E_MSGTYPEUNSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_ICOMPATIBLEMSG"                    value="RIL_E_ICOMPATIBLEMSG" />
        <string id="RIL_RESULT.RIL_E_INFOELEMENTUNSUPPORTED"            value="RIL_E_INFOELEMENTUNSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_PROTOCOLERROR"                     value="RIL_E_PROTOCOLERROR" />
        <string id="RIL_RESULT.RIL_E_NETWORKERROR"                      value="RIL_E_NETWORKERROR" />
        <string id="RIL_RESULT.RIL_E_MESSAGINGERROR"                    value="RIL_E_MESSAGINGERROR" />
        <string id="RIL_RESULT.RIL_E_NOTREADY"                          value="RIL_E_NOTREADY" />
        <string id="RIL_RESULT.RIL_E_TIMEDOUT"                          value ="RIL_E_TIMEDOUT" />
        <string id="RIL_RESULT.RIL_E_CANCELLED"                         value="RIL_E_CANCELLED" />
        <string id="RIL_RESULT.RIL_E_NONOTIFYCALLBACK"                  value="RIL_E_NONOTIFYCALLBACK" />
        <string id="RIL_RESULT.RIL_E_OPFMTUNAVAILABLE"                  value="RIL_E_OPFMTUNAVAILABLE" />
        <string id="RIL_RESULT.RIL_E_NORESPONSETODIAL"                  value="RIL_E_NORESPONSETODIAL" />
        <string id="RIL_RESULT.RIL_E_SECURITYFAILURE"                   value="RIL_E_SECURITYFAILURE" />
        <string id="RIL_RESULT.RIL_E_RADIOFAILEDINIT"                   value="RIL_E_RADIOFAILEDINIT" />
        <string id="RIL_RESULT.RIL_E_DRIVERINITFAILED"                  value="RIL_E_DRIVERINITFAILED" />
        <string id="RIL_RESULT.RIL_E_RADIONOTPRESENT"                   value="RIL_E_RADIONOTPRESENT" />
        <string id="RIL_RESULT.RIL_E_RADIOOFF"                          value="RIL_E_RADIOOFF" />
        <string id="RIL_RESULT.RIL_E_ILLEGALMS"                         value="RIL_E_ILLEGALMS" />
        <string id="RIL_RESULT.RIL_E_ILLEGALME"                         value="RIL_E_ILLEGALME" />
        <string id="RIL_RESULT.RIL_E_GPRSSERVICENOTALLOWED"             value="RIL_E_GPRSSERVICENOTALLOWED" />
        <string id="RIL_RESULT.RIL_E_PLMNNOTALLOWED"                    value="RIL_E_PLMNNOTALLOWED" />
        <string id="RIL_RESULT.RIL_E_LOCATIONAREANOTALLOWED"            value="RIL_E_LOCATIONAREANOTALLOWED" />
        <string id="RIL_RESULT.RIL_E_ROAMINGNOTALLOWEDINTHISLOCATIONAREA"       value="RIL_E_ROAMINGNOTALLOWEDINTHISLOCATIONAREA" />
        <string id="RIL_RESULT.RIL_E_SERVICEOPTIONNOTSUPPORTED"         value="RIL_E_SERVICEOPTIONNOTSUPPORTED" />
        <string id="RIL_RESULT.RIL_E_REQUESTEDSERVICEOPTIONNOTSUBSCRIBED"       value="RIL_E_REQUESTEDSERVICEOPTIONNOTSUBSCRIBED" />
        <string id="RIL_RESULT.RIL_E_SERVICEOPTIONTEMPORARILYOUTOFORDER"        value="RIL_E_SERVICEOPTIONTEMPORARILYOUTOFORDER" />
        <string id="RIL_RESULT.RIL_E_PDPAUTHENTICATIONFAILURE"          value="RIL_E_PDPAUTHENTICATIONFAILURE" />
        <string id="RIL_RESULT.RIL_E_INVALIDMOBILECLASS"                value="RIL_E_INVALIDMOBILECLASS" />
        <string id="RIL_RESULT.RIL_E_UNSPECIFIEDGPRSERROR"              value="RIL_E_UNSPECIFIEDGPRSERROR" />
        <string id="RIL_RESULT.RIL_E_RADIOREBOOTED"                     value="RIL_E_RADIOREBOOTED" />
        <string id="RIL_RESULT.RIL_E_INVALIDCONTEXTSTATE"               value="RIL_E_INVALIDCONTEXTSTATE" />
        <string id="RIL_RESULT.RIL_E_MAXCONTEXTS"                       value="RIL_E_MAXCONTEXTS" />
        <string id="RIL_RESULT.RIL_E_SYNCHRONOUS_DATA_UNAVAILABLE"      value="RIL_E_SYNCHRONOUS_DATA_UNAVAILABLE" />
        <string id="RIL_RESULT.RIL_E_FDNRESTRICT"                       value="RIL_E_FDNRESTRICT" />
        <string id="RIL_RESULT.RIL_E_INVALIDASYNCCOMMANDRESPONSE"       value="RIL_E_INVALIDASYNCCOMMANDRESPONSE" />
        <string id="RIL_RESULT.RIL_E_INCOMPATIBLEPROXYDRIVER"           value="RIL_E_INCOMPATIBLEPROXYDRIVER" />
        <string id="RIL_RESULT.RIL_E_INVALIDDRIVERVERSION"              value="RIL_E_INVALIDDRIVERVERSION" />
        <string id="RIL_RESULT.RIL_E_USIMCALLMODIFIED"                  value="RIL_E_USIMCALLMODIFIED" />
        <string id="RIL_RESULT.RIL_E_PASSWORDMISMATCH"                  value="RIL_E_PASSWORDMISMATCH" />
        <string id="RIL_RESULT.RIL_E_INVALIDCONTEXTACTIVATIONSTRING"    value="RIL_E_INVALIDCONTEXTACTIVATIONSTRING" />
        <string id="RIL_RESULT.RIL_E_UICCAPPINACCESSIBLE"               value="RIL_E_UICCAPPINACCESSIBLE" />
        <string id="RIL_RESULT.RIL_E_UICCPINREQUIRED"                   value="RIL_E_UICCPINREQUIRED" />
        <string id="RIL_RESULT.RIL_E_UICCPUKREQUIRED"                   value="RIL_E_UICCPUKREQUIRED" />
        <string id="RIL_RESULT.RIL_E_UICCPUKBLOCKED"                    value="RIL_E_UICCPUKBLOCKED" />
        <string id="RIL_RESULT.RIL_E_EXECUTORNOTREADY"                  value="RIL_E_EXECUTORNOTREADY" />
        <string id="RIL_RESULT.RIL_E_INVALIDUICCKEYREF"                 value="RIL_E_INVALIDUICCKEYREF" />
        <string id="RIL_RESULT.RIL_E_UICCINACTIVE"                      value="RIL_E_UICCINACTIVE" />
        <string id="RIL_RESULT.RIL_E_PERSOPUKREQUIRED"                  value="RIL_E_PERSOPUKREQUIRED" />
        <string id="RIL_RESULT.RIL_E_PERSOPUKBLOCKED"                   value="RIL_E_PERSOPUKBLOCKED" />
        <string id="RIL_RESULT.RIL_E_PERSOCHECKFAILED"                  value="RIL_E_PERSOCHECKFAILED" />
        <string id="RIL_RESULT.RIL_E_INVALIDUICCPATH"                   value="RIL_E_INVALIDUICCPATH" />
        <string id="RIL_RESULT.RIL_E_IMSTEMPFAILURE"                    value="RIL_E_IMSTEMPFAILURE" />
        <string id="RIL_RESULT.RIL_E_UICCNOTREADY"                      value="RIL_E_UICCNOTREADY" />
        <string id="RIL_RESULT.RIL_E_UICCPOWEROFF"                      value="RIL_E_UICCPOWEROFF" />
        <string id="RIL_RESULT.RIL_E_CALLISACTIVE"                      value="RIL_E_CALLISACTIVE" />
        <string id="RIL_RESULT.RIL_E_USIMCALLBLOCKED"                   value="RIL_E_USIMCALLBLOCKED" />
        <string id="RIL_RESULT.RIL_E_UICCADMRESTRICTED"                 value="RIL_E_UICCADMRESTRICTED" />
        <string id="RIL_RESULT.RIL_E_DMSERVICENOTREADY"                 value="RIL_E_DMSERVICENOTREADY" />
        <string id="RIL_RESULT.RIL_E_DMGETCONFIGFAILED"                 value="RIL_E_DMGETCONFIGFAILED" />
        <string id="RIL_RESULT.RIL_E_DMCOMMITFAILED"                    value="RIL_E_DMCOMMITFAILED" />

        <string id="QmiMessage.QMI_DMS_RESET"                           value="QMI_DMS_RESET" />
        <string id="QmiMessage.QMI_DMS_SET_EVENT_REPORT"                value="QMI_DMS_SET_EVENT_REPORT" />
        <string id="QmiMessage.QMI_DMS_GET_DEVICE_CAP"                  value="QMI_DMS_GET_DEVICE_CAP" />
        <string id="QmiMessage.QMI_DMS_GET_DEVICE_MFR"                  value="QMI_DMS_GET_DEVICE_MFR" />
        <string id="QmiMessage.QMI_DMS_GET_DEVICE_MODEL_ID"             value="QMI_DMS_GET_DEVICE_MODEL_ID" />
        <string id="QmiMessage.QMI_DMS_GET_DEVICE_REV_ID"               value="QMI_DMS_GET_DEVICE_REV_ID" />
        <string id="QmiMessage.QMI_DMS_GET_MSISDN"                      value="QMI_DMS_GET_MSISDN" />
        <string id="QmiMessage.QMI_DMS_GET_DEVICE_SERIAL_NUMBERS"       value="QMI_DMS_GET_DEVICE_SERIAL_NUMBERS" />
        <string id="QmiMessage.QMI_DMS_GET_POWER_STATE"                 value="QMI_DMS_GET_POWER_STATE" />
        <string id="QmiMessage.QMI_DMS_UIM_SET_PIN_PROTECTION"          value="QMI_DMS_UIM_SET_PIN_PROTECTION" />
        <string id="QmiMessage.QMI_DMS_UIM_VERIFY_PIN"                  value="QMI_DMS_UIM_VERIFY_PIN" />
        <string id="QmiMessage.QMI_DMS_UIM_UNBLOCK_PIN"                 value="QMI_DMS_UIM_UNBLOCK_PIN" />
        <string id="QmiMessage.QMI_DMS_UIM_CHANGE_PIN"                  value="QMI_DMS_UIM_CHANGE_PIN" />
        <string id="QmiMessage.QMI_DMS_UIM_GET_PIN_STATUS"              value="QMI_DMS_UIM_GET_PIN_STATUS" />
        <string id="QmiMessage.QMI_DMS_GET_DEVICE_HARDWARE_REV"         value="QMI_DMS_GET_DEVICE_HARDWARE_REV" />
        <string id="QmiMessage.QMI_DMS_GET_OPERATING_MODE"              value="QMI_DMS_GET_OPERATING_MODE" />
        <string id="QmiMessage.QMI_DMS_SET_OPERATING_MODE"              value="QMI_DMS_SET_OPERATING_MODE" />
        <string id="QmiMessage.QMI_DMS_GET_TIME"                        value="QMI_DMS_GET_TIME" />
        <string id="QmiMessage.QMI_DMS_GET_PRL_VER"                     value="QMI_DMS_GET_PRL_VER" />
        <string id="QmiMessage.QMI_DMS_GET_ACTIVATION_STATE"            value="QMI_DMS_GET_ACTIVATION_STATE" />
        <string id="QmiMessage.QMI_DMS_ACTIVATE_AUTOMATIC"              value="QMI_DMS_ACTIVATE_AUTOMATIC" />
        <string id="QmiMessage.QMI_DMS_ACTIVATE_MANUAL"                 value="QMI_DMS_ACTIVATE_MANUAL" />
        <string id="QmiMessage.QMI_DMS_GET_USER_LOCK_STATE"             value="QMI_DMS_GET_USER_LOCK_STATE" />
        <string id="QmiMessage.QMI_DMS_SET_USER_LOCK_STATE"             value="QMI_DMS_SET_USER_LOCK_STATE" />
        <string id="QmiMessage.QMI_DMS_SET_USER_LOCK_CODE"              value="QMI_DMS_SET_USER_LOCK_CODE" />
        <string id="QmiMessage.QMI_DMS_READ_USER_DATA"                  value="QMI_DMS_READ_USER_DATA" />
        <string id="QmiMessage.QMI_DMS_WRITE_USER_DATA"                 value="QMI_DMS_WRITE_USER_DATA" />
        <string id="QmiMessage.QMI_DMS_READ_ERI_FILE"                   value="QMI_DMS_READ_ERI_FILE" />
        <string id="QmiMessage.QMI_DMS_RESTORE_FACTORY_DEFAULTS"        value="QMI_DMS_RESTORE_FACTORY_DEFAULTS" />
        <string id="QmiMessage.QMI_DMS_VALIDATE_SERVICE_PROGRAMMING_CODE" value="QMI_DMS_VALIDATE_SERVICE_PROGRAMMING_CODE" />
        <string id="QmiMessage.QMI_DMS_UIM_GET_ICCID"                   value="QMI_DMS_UIM_GET_ICCID" />
        <string id="QmiMessage.QMI_DMS_UIM_GET_CK_STATUS"               value="QMI_DMS_UIM_GET_CK_STATUS" />
        <string id="QmiMessage.QMI_DMS_UIM_SET_CK_PROTECTION"           value="QMI_DMS_UIM_SET_CK_PROTECTION" />
        <string id="QmiMessage.QMI_DMS_UIM_UNBLOCK_CK"                  value="QMI_DMS_UIM_UNBLOCK_CK" />
        <string id="QmiMessage.QMI_DMS_UIM_GET_IMSI"                    value="QMI_DMS_UIM_GET_IMSI" />
        <string id="QmiMessage.QMI_DMS_UIM_GET_STATE"                   value="QMI_DMS_UIM_GET_STATE" />
        <string id="QmiMessage.QMI_DMS_GET_BAND_CAPABILITY"             value="QMI_DMS_GET_BAND_CAPABILITY" />
        <string id="QmiMessage.QMI_DMS_GET_FACTORY_SKU"                 value="QMI_DMS_GET_FACTORY_SKU" />
        <string id="QmiMessage.QMI_DMS_SET_TIME"                        value="QMI_DMS_SET_TIME" />
        <string id="QmiMessage.QMI_DMS_GET_ALT_NET_CONFIG"              value="QMI_DMS_GET_ALT_NET_CONFIG" />
        <string id="QmiMessage.QMI_DMS_SET_ALT_NET_CONFIG"              value="QMI_DMS_SET_ALT_NET_CONFIG" />
        <string id="QmiMessage.QMI_DMS_GET_SW_VERSION"                  value="QMI_DMS_GET_SW_VERSION" />
        <string id="QmiMessage.QMI_DMS_SET_SPC"                         value="QMI_DMS_SET_SPC" />
        <string id="QmiMessage.QMI_DMS_GET_CURRENT_PRL_INFO"            value="QMI_DMS_GET_CURRENT_PRL_INFO" />
        <string id="QmiMessage.QMI_NAS_RESET"                           value="QMI_NAS_RESET" />
        <string id="QmiMessage.QMI_NAS_ABORT"                           value="QMI_NAS_ABORT" />
        <string id="QmiMessage.QMI_NAS_SET_EVENT_REPORT"                value="QMI_NAS_SET_EVENT_REPORT" />
        <string id="QmiMessage.QMI_NAS_INDICATION_REGISTER"             value="QMI_NAS_INDICATION_REGISTER" />
        <string id="QmiMessage.QMI_NAS_GET_SIGNAL_STRENGTH"             value="QMI_NAS_GET_SIGNAL_STRENGTH" />
        <string id="QmiMessage.QMI_NAS_PERFORM_NETWORK_SCAN"            value="QMI_NAS_PERFORM_NETWORK_SCAN" />
        <string id="QmiMessage.QMI_NAS_INITIATE_NETWORK_REGISTER"       value="QMI_NAS_INITIATE_NETWORK_REGISTER" />
        <string id="QmiMessage.QMI_NAS_INITIATE_ATTACH"                 value="QMI_NAS_INITIATE_ATTACH" />
        <string id="QmiMessage.QMI_NAS_GET_SERVING_SYSTEM"              value="QMI_NAS_GET_SERVING_SYSTEM" />
        <string id="QmiMessage.QMI_NAS_GET_HOME_NETWORK"                value="QMI_NAS_GET_HOME_NETWORK" />
        <string id="QmiMessage.QMI_NAS_GET_PREFERRED_NETWORKS"          value="QMI_NAS_GET_PREFERRED_NETWORKS" />
        <string id="QmiMessage.QMI_NAS_SET_PREFERRED_NETWORKS"          value="QMI_NAS_SET_PREFERRED_NETWORKS" />
        <string id="QmiMessage.QMI_NAS_GET_FORBIDDEN_NETWORKS"          value="QMI_NAS_GET_FORBIDDEN_NETWORKS" />
        <string id="QmiMessage.QMI_NAS_SET_FORBIDDEN_NETWORKS"          value="QMI_NAS_SET_FORBIDDEN_NETWORKS" />
        <string id="QmiMessage.QMI_NAS_SET_TECHNOLOGY_PREFERENCE"       value="QMI_NAS_SET_TECHNOLOGY_PREFERENCE" />
        <string id="QmiMessage.QMI_NAS_GET_TECHNOLOGY_PREFERENCE"       value="QMI_NAS_GET_TECHNOLOGY_PREFERENCE" />
        <string id="QmiMessage.QMI_NAS_GET_ACCOLC"                      value="QMI_NAS_GET_ACCOLC" />
        <string id="QmiMessage.QMI_NAS_SET_ACCOLC"                      value="QMI_NAS_SET_ACCOLC" />
        <string id="QmiMessage.QMI_NAS_GET_NETWORK_SYSTEM_PREFERENCE_"  value="QMI_NAS_GET_NETWORK_SYSTEM_PREFERENCE_" />
        <string id="QmiMessage.QMI_NAS_GET_DEVICE_CONFIG"               value="QMI_NAS_GET_DEVICE_CONFIG" />
        <string id="QmiMessage.QMI_NAS_SET_DEVICE_CONFIG"               value="QMI_NAS_SET_DEVICE_CONFIG" />
        <string id="QmiMessage.QMI_NAS_GET_RF_BAND_INFO"                value="QMI_NAS_GET_RF_BAND_INFO" />
        <string id="QmiMessage.QMI_NAS_GET_AN_AAA_STATUS"               value="QMI_NAS_GET_AN_AAA_STATUS" />
        <string id="QmiMessage.QMI_NAS_SET_SYSTEM_SELECTION_PREFERENCE" value="QMI_NAS_SET_SYSTEM_SELECTION_PREFERENCE" />
        <string id="QmiMessage.QMI_NAS_GET_SYSTEM_SELECTION_PREFERENCE" value="QMI_NAS_GET_SYSTEM_SELECTION_PREFERENCE" />
        <string id="QmiMessage.QMI_NAS_SET_DDTM_PREFERENCE"             value="QMI_NAS_SET_DDTM_PREFERENCE" />
        <string id="QmiMessage.QMI_NAS_DDTM"                            value="QMI_NAS_DDTM" />
        <string id="QmiMessage.QMI_NAS_GET_OPERATOR_NAME_DATA"          value="QMI_NAS_GET_OPERATOR_NAME_DATA" />
        <string id="QmiMessage.QMI_NAS_OPERATOR_NAME_DATA"              value="QMI_NAS_OPERATOR_NAME_DATA" />
        <string id="QmiMessage.QMI_NAS_GET_CSP_PLMN_MODE_BIT"           value="QMI_NAS_GET_CSP_PLMN_MODE_BIT" />
        <string id="QmiMessage.QMI_NAS_CSP_PLMN_MODE_BIT"               value="QMI_NAS_CSP_PLMN_MODE_BIT" />
        <string id="QmiMessage.QMI_NAS_UPDATE_AKEY"                     value="QMI_NAS_UPDATE_AKEY" />
        <string id="QmiMessage.QMI_NAS_GET_3GPP2_SUBSCRIPTION_INFO"     value="QMI_NAS_GET_3GPP2_SUBSCRIPTION_INFO" />
        <string id="QmiMessage.QMI_NAS_SET_3GPP2_SUBSCRIPTION_INFO"     value="QMI_NAS_SET_3GPP2_SUBSCRIPTION_INFO" />
        <string id="QmiMessage.QMI_NAS_GET_MOB_CAI_REV"                 value="QMI_NAS_GET_MOB_CAI_REV" />
        <string id="QmiMessage.QMI_NAS_GET_RTRE_CONFIG"                 value="QMI_NAS_GET_RTRE_CONFIG" />
        <string id="QmiMessage.QMI_NAS_SET_RTRE_CONFIG"                 value="QMI_NAS_SET_RTRE_CONFIG" />
        <string id="QmiMessage.QMI_NAS_GET_CELL_LOCATION_INFO"          value="QMI_NAS_GET_CELL_LOCATION_INFO" />
        <string id="QmiMessage.QMI_NAS_GET_PLMN_NAME"                   value="QMI_NAS_GET_PLMN_NAME" />
        <string id="QmiMessage.QMI_NAS_BIND_SUBSCRIPTION"               value="QMI_NAS_BIND_SUBSCRIPTION" />
        <string id="QmiMessage.QMI_NAS_MANAGED_ROAMING"                 value="QMI_NAS_MANAGED_ROAMING" />
        <string id="QmiMessage.QMI_NAS_DUAL_STANDBY_PREF_IND"           value="QMI_NAS_DUAL_STANDBY_PREF_IND" />
        <string id="QmiMessage.QMI_NAS_SUBSCRIPTION_INFO"               value="QMI_NAS_SUBSCRIPTION_INFO" />
        <string id="QmiMessage.QMI_NAS_GET_MODE_PREF"                   value="QMI_NAS_GET_MODE_PREF" />
        <string id="QmiMessage.QMI_NAS_DUAL_STANDBY_PREF"               value="QMI_NAS_DUAL_STANDBY_PREF" />
        <string id="QmiMessage.QMI_NAS_NETWORK_TIME"                    value="QMI_NAS_NETWORK_TIME" />
        <string id="QmiMessage.QMI_NAS_GET_SYS_INFO"                    value="QMI_NAS_GET_SYS_INFO" />
        <string id="QmiMessage.QMI_NAS_SYS_INFO"                        value="QMI_NAS_SYS_INFO" />
        <string id="QmiMessage.QMI_NAS_GET_SIG_INFO"                    value="QMI_NAS_GET_SIG_INFO" />
        <string id="QmiMessage.QMI_NAS_CONFIG_SIG_INFO"                 value="QMI_NAS_CONFIG_SIG_INFO" />
        <string id="QmiMessage.QMI_NAS_SIG_INFO"                        value="QMI_NAS_SIG_INFO" />
        <string id="QmiMessage.QMI_NAS_GET_ERR_RATE"                    value="QMI_NAS_GET_ERR_RATE" />
        <string id="QmiMessage.QMI_NAS_ERR_RATE"                        value="QMI_NAS_ERR_RATE" />
        <string id="QmiMessage.QMI_NAS_HDR_SESSION_CLOSE"               value="QMI_NAS_HDR_SESSION_CLOSE" />
        <string id="QmiMessage.QMI_NAS_HDR_UATI_UPDATE"                 value="QMI_NAS_HDR_UATI_UPDATE" />
        <string id="QmiMessage.QMI_NAS_GET_HDR_SUBTYPE"                 value="QMI_NAS_GET_HDR_SUBTYPE" />
        <string id="QmiMessage.QMI_NAS_GET_HDR_COLOR_CODE"              value="QMI_NAS_GET_HDR_COLOR_CODE" />
        <string id="QmiMessage.QMI_NAS_GET_CURRENT_ACQ_SYS_MODE"        value="QMI_NAS_GET_CURRENT_ACQ_SYS_MODE" />
        <string id="QmiMessage.QMI_NAS_SET_RX_DIVERSITY"                value="QMI_NAS_SET_RX_DIVERSITY" />
        <string id="QmiMessage.QMI_NAS_GET_TX_RX_INFO"                  value="QMI_NAS_GET_TX_RX_INFO" />
        <string id="QmiMessage.QMI_NAS_UPDATE_AKEY_EXT"                 value="QMI_NAS_UPDATE_AKEY_EXT" />
        <string id="QmiMessage.QMI_NAS_GET_DUAL_STANDBY_PREF"           value="QMI_NAS_GET_DUAL_STANDBY_PREF" />
        <string id="QmiMessage.QMI_NAS_DETACH_LTE"                      value="QMI_NAS_DETACH_LTE" />
        <string id="QmiMessage.QMI_NAS_BLOCK_LTE_PLMN"                  value="QMI_NAS_BLOCK_LTE_PLMN" />
        <string id="QmiMessage.QMI_NAS_UNBLOCK_LTE_PLMN"                value="QMI_NAS_UNBLOCK_LTE_PLMN" />
        <string id="QmiMessage.QMI_NAS_RESET_LTE_PLMN_BLOCKING"         value="QMI_NAS_RESET_LTE_PLMN_BLOCKING" />
        <string id="QmiMessage.QMI_NAS_CURRENT_PLMN_NAME"               value="QMI_NAS_CURRENT_PLMN_NAME" />
        <string id="QmiMessage.QMI_NAS_CONFIG_EMBMS"                    value="QMI_NAS_CONFIG_EMBMS" />
        <string id="QmiMessage.QMI_NAS_GET_EMBMS_STATUS"                value="QMI_NAS_GET_EMBMS_STATUS" />
        <string id="QmiMessage.QMI_NAS_EMBMS_STATUS"                    value="QMI_NAS_EMBMS_STATUS" />
        <string id="QmiMessage.QMI_NAS_GET_CDMA_POSITION_INFO"          value="QMI_NAS_GET_CDMA_POSITION_INFO" />
        <string id="QmiMessage.QMI_NAS_RF_BAND_INFO"                    value="QMI_NAS_RF_BAND_INFO" />
        <string id="QmiMessage.QMI_NAS_FORCE_NETWORK_SEARCH"            value="QMI_NAS_FORCE_NETWORK_SEARCH" />
        <string id="QmiMessage.QMI_NAS_NETWORK_REJECT"                  value="QMI_NAS_NETWORK_REJECT" />
        <string id="QmiMessage.QMI_NAS_GET_MANAGED_ROAMING_CONFIG"      value="QMI_NAS_GET_MANAGED_ROAMING_CONFIG" />
        <string id="QmiMessage.QMI_NAS_RTRE_CONFIG"                     value="QMI_NAS_RTRE_CONFIG" />
        <string id="QmiMessage.QMI_WMS_RESET"                           value="QMI_WMS_RESET" />
        <string id="QmiMessage.QMI_WMS_SET_EVENT_REPORT"                value="QMI_WMS_SET_EVENT_REPORT" />
        <string id="QmiMessage.QMI_WMS_RAW_SEND"                        value="QMI_WMS_RAW_SEND" />
        <string id="QmiMessage.QMI_WMS_RAW_WRITE"                       value="QMI_WMS_RAW_WRITE" />
        <string id="QmiMessage.QMI_WMS_RAW_READ"                        value="QMI_WMS_RAW_READ" />
        <string id="QmiMessage.QMI_WMS_MODIFY_TAG"                      value="QMI_WMS_MODIFY_TAG" />
        <string id="QmiMessage.QMI_WMS_DELETE"                          value="QMI_WMS_DELETE" />
        <string id="QmiMessage.QMI_WMS_GET_MESSAGE_PROTOCOL"            value="QMI_WMS_GET_MESSAGE_PROTOCOL" />
        <string id="QmiMessage.QMI_WMS_LIST_MESSAGES"                   value="QMI_WMS_LIST_MESSAGES" />
        <string id="QmiMessage.QMI_WMS_SET_ROUTES"                      value="QMI_WMS_SET_ROUTES" />
        <string id="QmiMessage.QMI_WMS_GET_ROUTES"                      value="QMI_WMS_GET_ROUTES" />
        <string id="QmiMessage.QMI_WMS_GET_SMSC_ADDRESS"                value="QMI_WMS_GET_SMSC_ADDRESS" />
        <string id="QmiMessage.QMI_WMS_SET_SMSC_ADDRESS"                value="QMI_WMS_SET_SMSC_ADDRESS" />
        <string id="QmiMessage.QMI_WMS_GET_STORE_MAX_SIZE"              value="QMI_WMS_GET_STORE_MAX_SIZE" />
        <string id="QmiMessage.QMI_WMS_SEND_ACK"                        value="QMI_WMS_SEND_ACK" />
        <string id="QmiMessage.QMI_WMS_SET_RETRY_PERIOD"                value="QMI_WMS_SET_RETRY_PERIOD" />
        <string id="QmiMessage.QMI_WMS_SET_RETRY_INTERVAL"              value="QMI_WMS_SET_RETRY_INTERVAL" />
        <string id="QmiMessage.QMI_WMS_SET_DC_DISCONNECT_TIMER"         value="QMI_WMS_SET_DC_DISCONNECT_TIMER" />
        <string id="QmiMessage.QMI_WMS_SET_MEMORY_STATUS"               value="QMI_WMS_SET_MEMORY_STATUS" />
        <string id="QmiMessage.QMI_WMS_SET_BROADCAST_ACTIVATION"        value="QMI_WMS_SET_BROADCAST_ACTIVATION" />
        <string id="QmiMessage.QMI_WMS_SET_BROADCAST_CONFIG"            value="QMI_WMS_SET_BROADCAST_CONFIG" />
        <string id="QmiMessage.QMI_WMS_GET_BROADCAST_CONFIG"            value="QMI_WMS_GET_BROADCAST_CONFIG" />
        <string id="QmiMessage.QMI_WMS_MEMORY_FULL"                     value="QMI_WMS_MEMORY_FULL" />
        <string id="QmiMessage.QMI_WMS_GET_DOMAIN_PREF"                 value="QMI_WMS_GET_DOMAIN_PREF" />
        <string id="QmiMessage.QMI_WMS_SET_DOMAIN_PREF"                 value="QMI_WMS_SET_DOMAIN_PREF" />
        <string id="QmiMessage.QMI_WMS_SEND_FROM_MEM_STORE"             value="QMI_WMS_SEND_FROM_MEM_STORE" />
        <string id="QmiMessage.QMI_WMS_GET_MESSAGE_WAITING"             value="QMI_WMS_GET_MESSAGE_WAITING" />
        <string id="QmiMessage.QMI_WMS_MESSAGE_WAITING"                 value="QMI_WMS_MESSAGE_WAITING" />
        <string id="QmiMessage.QMI_WMS_SET_PRIMARY_CLIENT"              value="QMI_WMS_SET_PRIMARY_CLIENT" />
        <string id="QmiMessage.QMI_WMS_SMSC_ADDRESS"                    value="QMI_WMS_SMSC_ADDRESS" />
        <string id="QmiMessage.QMI_WMS_INDICATION_REGISTER"             value="QMI_WMS_INDICATION_REGISTER" />
        <string id="QmiMessage.QMI_WMS_GET_TRANSPORT_LAYER_INFO"        value="QMI_WMS_GET_TRANSPORT_LAYER_INFO" />
        <string id="QmiMessage.QMI_WMS_TRANSPORT_LAYER_INFO"            value="QMI_WMS_TRANSPORT_LAYER_INFO" />
        <string id="QmiMessage.QMI_WMS_GET_TRANSPORT_NW_REG_INFO"       value="QMI_WMS_GET_TRANSPORT_NW_REG_INFO" />
        <string id="QmiMessage.QMI_WMS_TRANSPORT_NW_REG_INFO"           value="QMI_WMS_TRANSPORT_NW_REG_INFO" />
        <string id="QmiMessage.QMI_WMS_BIND_SUBSCRIPTION"               value="QMI_WMS_BIND_SUBSCRIPTION" />
        <string id="QmiMessage.QMI_WMS_GET_INDICATION_REGISTER"         value="QMI_WMS_GET_INDICATION_REGISTER" />
        <string id="QmiMessage.QMI_WMS_GET_SMS_PARAMETERS"              value="QMI_WMS_GET_SMS_PARAMETERS" />
        <string id="QmiMessage.QMI_WMS_SET_SMS_PARAMETERS"              value="QMI_WMS_SET_SMS_PARAMETERS" />
        <string id="QmiMessage.QMI_WMS_CALL_STATUS"                     value="QMI_WMS_CALL_STATUS" />
        <string id="QmiMessage.QMI_WMS_GET_DOMAIN_PREF_CONFIG"          value="QMI_WMS_GET_DOMAIN_PREF_CONFIG" />
        <string id="QmiMessage.QMI_WMS_SET_DOMAIN_PREF_CONFIG"          value="QMI_WMS_SET_DOMAIN_PREF_CONFIG" />
        <string id="QmiMessage.QMI_WMS_GET_RETRY_PERIOD"                value="QMI_WMS_GET_RETRY_PERIOD" />
        <string id="QmiMessage.QMI_WMS_GET_RETRY_INTERVAL"              value="QMI_WMS_GET_RETRY_INTERVAL" />
        <string id="QmiMessage.QMI_WMS_GET_DC_DISCONNECT_TIMER"         value="QMI_WMS_GET_DC_DISCONNECT_TIMER" />
        <string id="QmiMessage.QMI_WMS_GET_MEMORY_STATUS"               value="QMI_WMS_GET_MEMORY_STATUS" />
        <string id="QmiMessage.QMI_WMS_GET_PRIMARY_CLIENT"              value="QMI_WMS_GET_PRIMARY_CLIENT" />
        <string id="QmiMessage.QMI_WMS_GET_SUBSCRIPTION_BINDING"        value="QMI_WMS_GET_SUBSCRIPTION_BINDING" />
        <string id="QmiMessage.QMI_VOICE_INDICATION_REGISTER"           value="QMI_VOICE_INDICATION_REGISTER" />
        <string id="QmiMessage.QMI_VOICE_DIAL_CALL"                     value="QMI_VOICE_DIAL_CALL" />
        <string id="QmiMessage.QMI_VOICE_END_CALL"                      value="QMI_VOICE_END_CALL" />
        <string id="QmiMessage.QMI_VOICE_ANSWER_CALL"                   value="QMI_VOICE_ANSWER_CALL" />
        <string id="QmiMessage.QMI_VOICE_GET_CALL_INFO"                 value="QMI_VOICE_GET_CALL_INFO" />
        <string id="QmiMessage.QMI_VOICE_OTASP_STATUS"                  value="QMI_VOICE_OTASP_STATUS" />
        <string id="QmiMessage.QMI_VOICE_INFO_REC"                      value="QMI_VOICE_INFO_REC" />
        <string id="QmiMessage.QMI_VOICE_SEND_FLASH"                    value="QMI_VOICE_SEND_FLASH" />
        <string id="QmiMessage.QMI_VOICE_BURST_DTMF"                    value="QMI_VOICE_BURST_DTMF" />
        <string id="QmiMessage.QMI_VOICE_START_CONT_DTMF"               value="QMI_VOICE_START_CONT_DTMF" />
        <string id="QmiMessage.QMI_VOICE_STOP_CONT_DTMF"                value="QMI_VOICE_STOP_CONT_DTMF" />
        <string id="QmiMessage.QMI_VOICE_DTMF"                          value="QMI_VOICE_DTMF" />
        <string id="QmiMessage.QMI_VOICE_SET_PREFERRED_PRIVACY"         value="QMI_VOICE_SET_PREFERRED_PRIVACY" />
        <string id="QmiMessage.QMI_VOICE_PRIVACY"                       value="QMI_VOICE_PRIVACY" />
        <string id="QmiMessage.QMI_VOICE_ALL_CALL_STATUS"               value="QMI_VOICE_ALL_CALL_STATUS" />
        <string id="QmiMessage.QMI_VOICE_GET_ALL_CALL_INFO"             value="QMI_VOICE_GET_ALL_CALL_INFO" />
        <string id="QmiMessage.QMI_VOICE_MANAGE_CALLS"                  value="QMI_VOICE_MANAGE_CALLS" />
        <string id="QmiMessage.QMI_VOICE_SUPS_NOTIFICATION"             value="QMI_VOICE_SUPS_NOTIFICATION" />
        <string id="QmiMessage.QMI_VOICE_SET_SUPS_SERVICE"              value="QMI_VOICE_SET_SUPS_SERVICE" />
        <string id="QmiMessage.QMI_VOICE_GET_CALL_WAITING"              value="QMI_VOICE_GET_CALL_WAITING" />
        <string id="QmiMessage.QMI_VOICE_GET_CALL_BARRING"              value="QMI_VOICE_GET_CALL_BARRING" />
        <string id="QmiMessage.QMI_VOICE_GET_CLIP"                      value="QMI_VOICE_GET_CLIP" />
        <string id="QmiMessage.QMI_VOICE_GET_CLIR"                      value="QMI_VOICE_GET_CLIR" />
        <string id="QmiMessage.QMI_VOICE_GET_CALL_FORWARDING"           value="QMI_VOICE_GET_CALL_FORWARDING" />
        <string id="QmiMessage.QMI_VOICE_SET_CALL_BARRING_PASSWORD"     value="QMI_VOICE_SET_CALL_BARRING_PASSWORD" />
        <string id="QmiMessage.QMI_VOICE_ORIG_USSD"                     value="QMI_VOICE_ORIG_USSD" />
        <string id="QmiMessage.QMI_VOICE_ANSWER_USSD"                   value="QMI_VOICE_ANSWER_USSD" />
        <string id="QmiMessage.QMI_VOICE_CANCEL_USSD"                   value="QMI_VOICE_CANCEL_USSD" />
        <string id="QmiMessage.QMI_VOICE_USSD_RELEASE"                  value="QMI_VOICE_USSD_RELEASE" />
        <string id="QmiMessage.QMI_VOICE_USSD"                          value="QMI_VOICE_USSD" />
        <string id="QmiMessage.QMI_VOICE_UUS"                           value="QMI_VOICE_UUS" />
        <string id="QmiMessage.QMI_VOICE_SET_CONFIG"                    value="QMI_VOICE_SET_CONFIG" />
        <string id="QmiMessage.QMI_VOICE_GET_CONFIG"                    value="QMI_VOICE_GET_CONFIG" />
        <string id="QmiMessage.QMI_VOICE_SUPS"                          value="QMI_VOICE_SUPS" />
        <string id="QmiMessage.QMI_VOICE_ORIG_USSD_NO_WAIT"             value="QMI_VOICE_ORIG_USSD_NO_WAIT" />
        <string id="QmiMessage.QMI_VOICE_BIND_SUBSCRIPTION"             value="QMI_VOICE_BIND_SUBSCRIPTION" />
        <string id="QmiMessage.QMI_VOICE_ALS_SET_LINE_SWITCHING"        value="QMI_VOICE_ALS_SET_LINE_SWITCHING" />
        <string id="QmiMessage.QMI_VOICE_ALS_SELECT_LINE"               value="QMI_VOICE_ALS_SELECT_LINE" />
        <string id="QmiMessage.QMI_VOICE_AOC_RESET_ACM"                 value="QMI_VOICE_AOC_RESET_ACM" />
        <string id="QmiMessage.QMI_VOICE_AOC_SET_ACMMAX"                value="QMI_VOICE_AOC_SET_ACMMAX" />
        <string id="QmiMessage.QMI_VOICE_AOC_GET_CALL_METER_INFO"       value="QMI_VOICE_AOC_GET_CALL_METER_INFO" />
        <string id="QmiMessage.QMI_VOICE_AOC_LOW_FUNDS"                 value="QMI_VOICE_AOC_LOW_FUNDS" />
        <string id="QmiMessage.QMI_VOICE_GET_COLP"                      value="QMI_VOICE_GET_COLP" />
        <string id="QmiMessage.QMI_VOICE_GET_COLR"                      value="QMI_VOICE_GET_COLR" />
        <string id="QmiMessage.QMI_VOICE_GET_CNAP"                      value="QMI_VOICE_GET_CNAP" />
        <string id="QmiMessage.QMI_VOICE_MANAGE_IP_CALLS"               value="QMI_VOICE_MANAGE_IP_CALLS" />
        <string id="QmiMessage.QMI_VOICE_ALS_GET_LINE_SWITCHING_STATUS" value="QMI_VOICE_ALS_GET_LINE_SWITCHING_STATUS" />
        <string id="QmiMessage.QMI_VOICE_ALS_GET_SELECTED_LINE"         value="QMI_VOICE_ALS_GET_SELECTED_LINE" />
        <string id="QmiMessage.QMI_VOICE_MODIFIED"                      value="QMI_VOICE_MODIFIED" />
        <string id="QmiMessage.QMI_VOICE_MODIFY_ACCEPT"                 value="QMI_VOICE_MODIFY_ACCEPT" />
        <string id="QmiMessage.QMI_VOICE_SPEECH_CODEC_INFO"             value="QMI_VOICE_SPEECH_CODEC_INFO" />
        <string id="QmiMessage.QMI_VOICE_HANDOVER"                      value="QMI_VOICE_HANDOVER" />
        <string id="QmiMessage.QMI_CAT_RESET"                           value="QMI_CAT_RESET" />
        <string id="QmiMessage.QMI_CAT_SET_EVENT_REPORT"                value="QMI_CAT_SET_EVENT_REPORT" />
        <string id="QmiMessage.QMI_CAT_GET_SERVICE_STATE"               value="QMI_CAT_GET_SERVICE_STATE" />
        <string id="QmiMessage.QMI_CAT_SEND_TR"                         value="QMI_CAT_SEND_TR" />
        <string id="QmiMessage.QMI_CAT_SEND_ENVELOPE_CMD"               value="QMI_CAT_SEND_ENVELOPE_CMD" />
        <string id="QmiMessage.QMI_CAT_GET_EVENT_REPORT"                value="QMI_CAT_GET_EVENT_REPORT" />
        <string id="QmiMessage.QMI_CAT_SEND_DECODED_TR"                 value="QMI_CAT_SEND_DECODED_TR" />
        <string id="QmiMessage.QMI_CAT_SEND_DECODED_ENVELOPE_CMD"       value="QMI_CAT_SEND_DECODED_ENVELOPE_CMD" />
        <string id="QmiMessage.QMI_CAT_EVENT_CONFIRMATION"              value="QMI_CAT_EVENT_CONFIRMATION" />
        <string id="QmiMessage.QMI_CAT_SCWS_OPEN_CHANNEL"               value="QMI_CAT_SCWS_OPEN_CHANNEL" />
        <string id="QmiMessage.QMI_CAT_SCWS_CLOSE_CHANNEL"              value="QMI_CAT_SCWS_CLOSE_CHANNEL" />
        <string id="QmiMessage.QMI_CAT_SCWS_SEND_DATA"                  value="QMI_CAT_SCWS_SEND_DATA" />
        <string id="QmiMessage.QMI_CAT_SCWS_DATA_AVAILABLE"             value="QMI_CAT_SCWS_DATA_AVAILABLE" />
        <string id="QmiMessage.QMI_CAT_SCWS_CHANNEL_STATUS"             value="QMI_CAT_SCWS_CHANNEL_STATUS" />
        <string id="QmiMessage.QMI_CAT_GET_TERMINAL_PROFILE"            value="QMI_CAT_GET_TERMINAL_PROFILE" />
        <string id="QmiMessage.QMI_CAT_SET_CONFIGURATION"               value="QMI_CAT_SET_CONFIGURATION" />
        <string id="QmiMessage.QMI_CAT_GET_CONFIGURATION"               value="QMI_CAT_GET_CONFIGURATION" />
        <string id="QmiMessage.QMI_UIM_RESET"                           value="QMI_UIM_RESET" />
        <string id="QmiMessage.QMI_UIM_READ_TRANSPARENT"                value="QMI_UIM_READ_TRANSPARENT" />
        <string id="QmiMessage.QMI_UIM_READ_RECORD"                     value="QMI_UIM_READ_RECORD" />
        <string id="QmiMessage.QMI_UIM_WRITE_TRANSPARENT"               value="QMI_UIM_WRITE_TRANSPARENT" />
        <string id="QmiMessage.QMI_UIM_WRITE_RECORD"                    value="QMI_UIM_WRITE_RECORD" />
        <string id="QmiMessage.QMI_UIM_GET_FILE_ATTRIBUTES"             value="QMI_UIM_GET_FILE_ATTRIBUTES" />
        <string id="QmiMessage.QMI_UIM_SET_PIN_PROTECTION"              value="QMI_UIM_SET_PIN_PROTECTION" />
        <string id="QmiMessage.QMI_UIM_VERIFY_PIN"                      value="QMI_UIM_VERIFY_PIN" />
        <string id="QmiMessage.QMI_UIM_UNBLOCK_PIN"                     value="QMI_UIM_UNBLOCK_PIN" />
        <string id="QmiMessage.QMI_UIM_CHANGE_PIN"                      value="QMI_UIM_CHANGE_PIN" />
        <string id="QmiMessage.QMI_UIM_DEPERSONALIZATION"               value="QMI_UIM_DEPERSONALIZATION" />
        <string id="QmiMessage.QMI_UIM_REFRESH_REGISTER"                value="QMI_UIM_REFRESH_REGISTER" />
        <string id="QmiMessage.QMI_UIM_REFRESH_OK"                      value="QMI_UIM_REFRESH_OK" />
        <string id="QmiMessage.QMI_UIM_REFRESH_COMPLETE"                value="QMI_UIM_REFRESH_COMPLETE" />
        <string id="QmiMessage.QMI_UIM_REFRESH_GET_LAST_EVENT"          value="QMI_UIM_REFRESH_GET_LAST_EVENT" />
        <string id="QmiMessage.QMI_UIM_EVENT_REG"                       value="QMI_UIM_EVENT_REG" />
        <string id="QmiMessage.QMI_UIM_GET_CARD_STATUS"                 value="QMI_UIM_GET_CARD_STATUS" />
        <string id="QmiMessage.QMI_UIM_POWER_DOWN"                      value="QMI_UIM_POWER_DOWN" />
        <string id="QmiMessage.QMI_UIM_POWER_UP"                        value="QMI_UIM_POWER_UP" />
        <string id="QmiMessage.QMI_UIM_STATUS_CHANGEV01"                value="QMI_UIM_STATUS_CHANGEV01" />
        <string id="QmiMessage.QMI_UIM_REFRESHV01"                      value="QMI_UIM_REFRESHV01" />
        <string id="QmiMessage.QMI_UIM_AUTHENTICATE"                    value="QMI_UIM_AUTHENTICATE" />
        <string id="QmiMessage.QMI_UIM_CLOSE_SESSION"                   value="QMI_UIM_CLOSE_SESSION" />
        <string id="QmiMessage.QMI_UIM_GET_SERVICE_STATUS"              value="QMI_UIM_GET_SERVICE_STATUS" />
        <string id="QmiMessage.QMI_UIM_SET_SERVICE_STATUS"              value="QMI_UIM_SET_SERVICE_STATUS" />
        <string id="QmiMessage.QMI_UIM_CHANGE_PROVISIONING_SESSION"     value="QMI_UIM_CHANGE_PROVISIONING_SESSION" />
        <string id="QmiMessage.QMI_UIM_GET_LABEL"                       value="QMI_UIM_GET_LABEL" />
        <string id="QmiMessage.QMI_UIM_GET_CONFIGURATION"               value="QMI_UIM_GET_CONFIGURATION" />
        <string id="QmiMessage.QMI_UIM_SEND_APDU"                       value="QMI_UIM_SEND_APDU" />
        <string id="QmiMessage.QMI_UIM_SAP_CONNECTION"                  value="QMI_UIM_SAP_CONNECTION" />
        <string id="QmiMessage.QMI_UIM_SAP_REQUEST"                     value="QMI_UIM_SAP_REQUEST" />
        <string id="QmiMessage.QMI_UIM_SAP_CONNECTIONV01"               value="QMI_UIM_SAP_CONNECTIONV01" />
        <string id="QmiMessage.QMI_UIM_LOGICAL_CHANNEL"                 value="QMI_UIM_LOGICAL_CHANNEL" />
        <string id="QmiMessage.QMI_UIM_SUBSCRIPTION_OK"                 value="QMI_UIM_SUBSCRIPTION_OK" />
        <string id="QmiMessage.QMI_UIM_GET_ATR"                         value="QMI_UIM_GET_ATR" />
        <string id="QmiMessage.QMI_UIM_OPEN_LOGICAL_CHANNEL"            value="QMI_UIM_OPEN_LOGICAL_CHANNEL" />
        <string id="QmiMessage.QMI_UIM_SESSION_CLOSEDV01"               value="QMI_UIM_SESSION_CLOSEDV01" />
        <string id="QmiMessage.QMI_PBM_INDICATION_REGISTER"             value="QMI_PBM_INDICATION_REGISTER" />
        <string id="QmiMessage.QMI_PBM_GET_PB_CAPABILITIES"             value="QMI_PBM_GET_PB_CAPABILITIES" />
        <string id="QmiMessage.QMI_PBM_GET_ALL_PB_CAPABILITIES"         value="QMI_PBM_GET_ALL_PB_CAPABILITIES" />
        <string id="QmiMessage.QMI_PBM_READ_RECORDS"                    value="QMI_PBM_READ_RECORDS" />
        <string id="QmiMessage.QMI_PBM_WRITE_RECORD"                    value="QMI_PBM_WRITE_RECORD" />
        <string id="QmiMessage.QMI_PBM_DELETE_RECORD"                   value="QMI_PBM_DELETE_RECORD" />
        <string id="QmiMessage.QMI_PBM_DELETE_ALL_PB_RECORDS"           value="QMI_PBM_DELETE_ALL_PB_RECORDS" />
        <string id="QmiMessage.QMI_PBM_SEARCH_RECORDS"                  value="QMI_PBM_SEARCH_RECORDS" />
        <string id="QmiMessage.QMI_PBM_RECORD_UPDATE"                   value="QMI_PBM_RECORD_UPDATE" />
        <string id="QmiMessage.QMI_PBM_REFRESH"                         value="QMI_PBM_REFRESH" />
        <string id="QmiMessage.QMI_PBM_PB_READY"                        value="QMI_PBM_PB_READY" />
        <string id="QmiMessage.QMI_PBM_EMERGENCY_LIST"                  value="QMI_PBM_EMERGENCY_LIST" />
        <string id="QmiMessage.QMI_PBM_ALL_PB_INIT_DONE"                value="QMI_PBM_ALL_PB_INIT_DONE" />
        <string id="QmiMessage.QMI_PBM_GET_EMERGENCY_LIST"              value="QMI_PBM_GET_EMERGENCY_LIST" />
        <string id="QmiMessage.QMI_PBM_GET_ALL_GROUPS"                  value="QMI_PBM_GET_ALL_GROUPS" />
        <string id="QmiMessage.QMI_PBM_SET_GROUP_INFO"                  value="QMI_PBM_SET_GROUP_INFO" />
        <string id="QmiMessage.QMI_PBM_GET_PB_STATE"                    value="QMI_PBM_GET_PB_STATE" />
        <string id="QmiMessage.QMI_PBM_READ_ALL_HIDDEN_RECORDS"         value="QMI_PBM_READ_ALL_HIDDEN_RECORDS" />
        <string id="QmiMessage.QMI_PBM_HIDDEN_RECORD_STATUS"            value="QMI_PBM_HIDDEN_RECORD_STATUS" />
        <string id="QmiMessage.QMI_PBM_GET_NEXT_EMPTY_RECORD_ID"        value="QMI_PBM_GET_NEXT_EMPTY_RECORD_ID" />
        <string id="QmiMessage.QMI_PBM_GET_NEXT_NON_EMPTY_RECORD_ID"    value="QMI_PBM_GET_NEXT_NON_EMPTY_RECORD_ID" />
        <string id="QmiMessage.QMI_PBM_GET_ALL_AAS"                     value="QMI_PBM_GET_ALL_AAS" />
        <string id="QmiMessage.QMI_PBM_SET_AAS"                         value="QMI_PBM_SET_AAS" />
        <string id="QmiMessage.QMI_PBM_AAS_UPDATE"                      value="QMI_PBM_AAS_UPDATE" />
        <string id="QmiMessage.QMI_PBM_GAS_UPDATE"                      value="QMI_PBM_GAS_UPDATE" />
        <string id="QmiMessage.QMI_PBM_BIND_SUBSCRIPTION"               value="QMI_PBM_BIND_SUBSCRIPTION" />
        <string id="QmiMessage.QMI_PBM_GET_SUBSCRIPTION_BINDING"        value="QMI_PBM_GET_SUBSCRIPTION_BINDING" />
        <string id="QmiMessage.QMI_PBM_READ_PBSET_CAPS"                 value="QMI_PBM_READ_PBSET_CAPS" />
        <string id="QmiMessage.QMI_SAR_RF_SET_STATE"                    value="QMI_SAR_RF_SET_STATE" />
        <string id="QmiMessage.QMI_SAR_RF_GET_STATE"                    value="QMI_SAR_RF_GET_STATE" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_SET_SIP_CONFIG"         value="QMI_IMS_SETTINGS_SET_SIP_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_SET_REG_MGR_CONFIG"     value="QMI_IMS_SETTINGS_SET_REG_MGR_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_SET_SMS_CONFIG"         value="QMI_IMS_SETTINGS_SET_SMS_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_SET_USER_CONFIG"        value="QMI_IMS_SETTINGS_SET_USER_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_SET_VOIP_CONFIG"        value="QMI_IMS_SETTINGS_SET_VOIP_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_GET_SIP_CONFIG"         value="QMI_IMS_SETTINGS_GET_SIP_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_GET_REG_MGR_CONFIG"     value="QMI_IMS_SETTINGS_GET_REG_MGR_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_GET_SMS_CONFIG"         value="QMI_IMS_SETTINGS_GET_SMS_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_GET_USER_CONFIG"        value="QMI_IMS_SETTINGS_GET_USER_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_GET_VOIP_CONFIG"        value="QMI_IMS_SETTINGS_GET_VOIP_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_CONFIG_IND_REG"         value="QMI_IMS_SETTINGS_CONFIG_IND_REG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_SIP_CONFIG"             value="QMI_IMS_SETTINGS_SIP_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_REG_MGR_CONFIG"         value="QMI_IMS_SETTINGS_REG_MGR_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_SMS_CONFIG"             value="QMI_IMS_SETTINGS_SMS_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_USER_CONFIG"            value="QMI_IMS_SETTINGS_USER_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_VOIP_CONFIG"            value="QMI_IMS_SETTINGS_VOIP_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_SET_PRESENCE_CONFIG"    value="QMI_IMS_SETTINGS_SET_PRESENCE_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_GET_PRESENCE_CONFIG"    value="QMI_IMS_SETTINGS_GET_PRESENCE_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_PRESENCE_CONFIG"        value="QMI_IMS_SETTINGS_PRESENCE_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_SET_MEDIA_CONFIG"       value="QMI_IMS_SETTINGS_SET_MEDIA_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_GET_MEDIA_CONFIG"       value="QMI_IMS_SETTINGS_GET_MEDIA_CONFIG" />
        <string id="QmiMessage.QMI_IMS_SETTINGS_MEDIA_CONFIG"           value="QMI_IMS_SETTINGS_MEDIA_CONFIG" />

        <string id="CommandName.RIL_COMMAND_INITNOTIFICATIONS"                 value="RIL_COMMAND_INITNOTIFICATIONS" />
        <string id="CommandName.RIL_COMMAND_GETNEXTNOTIFICATION"               value="RIL_COMMAND_GETNEXTNOTIFICATION" />
        <string id="CommandName.RIL_COMMAND_ENABLENOTIFICATIONS"               value="RIL_COMMAND_ENABLENOTIFICATIONS" />
        <string id="CommandName.RIL_COMMAND_DISABLENOTIFICATIONS"              value="RIL_COMMAND_DISABLENOTIFICATIONS" />
        <string id="CommandName.RIL_COMMAND_GETDRIVERVERSION"                  value="RIL_COMMAND_GETDRIVERVERSION" />
        <string id="CommandName.RIL_COMMAND_GETDEVCAPS"                        value="RIL_COMMAND_GETDEVCAPS" />
        <string id="CommandName.RIL_COMMAND_GETDEVICEINFO"                     value="RIL_COMMAND_GETDEVICEINFO" />
        <string id="CommandName.RIL_COMMAND_GETEQUIPMENTSTATE"                 value="RIL_COMMAND_GETEQUIPMENTSTATE" />
        <string id="CommandName.RIL_COMMAND_SETEQUIPMENTSTATE"                 value="RIL_COMMAND_SETEQUIPMENTSTATE" />
        <string id="CommandName.RIL_COMMAND_SETNOTIFICATIONFILTERSTATE"        value="RIL_COMMAND_SETNOTIFICATIONFILTERSTATE" />
        <string id="CommandName.RIL_COMMAND_GETNOTIFICATIONFILTERSTATE"        value="RIL_COMMAND_GETNOTIFICATIONFILTERSTATE" />
        <string id="CommandName.RIL_COMMAND_ENUMERATESLOTS"                    value="RIL_COMMAND_ENUMERATESLOTS" />
        <string id="CommandName.RIL_COMMAND_GETCARDINFO"                       value="RIL_COMMAND_GETCARDINFO" />
        <string id="CommandName.RIL_COMMAND_SETSLOTPOWER"                      value="RIL_COMMAND_SETSLOTPOWER" />
        <string id="CommandName.RIL_COMMAND_GETUICCRECORDSTATUS"               value="RIL_COMMAND_GETUICCRECORDSTATUS" />
        <string id="CommandName.RIL_COMMAND_SENDRESTRICTEDUICCCMD"             value="RIL_COMMAND_SENDRESTRICTEDUICCCMD" />
        <string id="CommandName.RIL_COMMAND_WATCHUICCFILECHANGE"               value="RIL_COMMAND_WATCHUICCFILECHANGE" />
        <string id="CommandName.RIL_COMMAND_GETUICCPRLID"                      value="RIL_COMMAND_GETUICCPRLID" />
        <string id="CommandName.RIL_COMMAND_GETIMSI"                           value="RIL_COMMAND_GETIMSI" />
        <string id="CommandName.RIL_COMMAND_GETSUBSCRIBERNUMBERS"              value="RIL_COMMAND_GETSUBSCRIBERNUMBERS" />
        <string id="CommandName.RIL_COMMAND_GETUICCLOCKSTATE"                  value="RIL_COMMAND_GETUICCLOCKSTATE" />
        <string id="CommandName.RIL_COMMAND_GETUICCSERVICELOCK"                value="RIL_COMMAND_GETUICCSERVICELOCK" />
        <string id="CommandName.RIL_COMMAND_VERIFYUICCLOCK"                    value="RIL_COMMAND_VERIFYUICCLOCK" />
        <string id="CommandName.RIL_COMMAND_SETUICCLOCKENABLED"                value="RIL_COMMAND_SETUICCLOCKENABLED" />
        <string id="CommandName.RIL_COMMAND_UNBLOCKUICCLOCK"                   value="RIL_COMMAND_UNBLOCKUICCLOCK" />
        <string id="CommandName.RIL_COMMAND_CHANGEUICCLOCKPASSWORD"            value="RIL_COMMAND_CHANGEUICCLOCKPASSWORD" />
        <string id="CommandName.RIL_COMMAND_GETUICCAPPPERSOCHECKSTATE"         value="RIL_COMMAND_GETUICCAPPPERSOCHECKSTATE" />
        <string id="CommandName.RIL_COMMAND_GETPERSODEACTIVATIONSTATE"         value="RIL_COMMAND_GETPERSODEACTIVATIONSTATE" />
        <string id="CommandName.RIL_COMMAND_DEACTIVATEPERSO"                   value="RIL_COMMAND_DEACTIVATEPERSO" />
        <string id="CommandName.RIL_COMMAND_READPHONEBOOKENTRIES"              value="RIL_COMMAND_READPHONEBOOKENTRIES" />
        <string id="CommandName.RIL_COMMAND_WRITEPHONEBOOKENTRY"               value="RIL_COMMAND_WRITEPHONEBOOKENTRY" />
        <string id="CommandName.RIL_COMMAND_DELETEPHONEBOOKENTRY"              value="RIL_COMMAND_DELETEPHONEBOOKENTRY" />
        <string id="CommandName.RIL_COMMAND_GETPHONEBOOKOPTIONS"               value="RIL_COMMAND_GETPHONEBOOKOPTIONS" />
        <string id="CommandName.RIL_COMMAND_GETALLADDITIONALNUMBERSTRINGS"     value="RIL_COMMAND_GETALLADDITIONALNUMBERSTRINGS" />
        <string id="CommandName.RIL_COMMAND_GETALLEMERGENCYNUMBERS"            value="RIL_COMMAND_GETALLEMERGENCYNUMBERS" />
        <string id="CommandName.RIL_COMMAND_SETRADIOCONFIGURATION"             value="RIL_COMMAND_SETRADIOCONFIGURATION" />
        <string id="CommandName.RIL_COMMAND_GETRADIOCONFIGURATION"             value="RIL_COMMAND_GETRADIOCONFIGURATION" />
        <string id="CommandName.RIL_COMMAND_SETEXECUTORCONFIG"                 value="RIL_COMMAND_SETEXECUTORCONFIG" />
        <string id="CommandName.RIL_COMMAND_GETEXECUTORCONFIG"                 value="RIL_COMMAND_GETEXECUTORCONFIG" />
        <string id="CommandName.RIL_COMMAND_SETSYSTEMSELECTIONPREFS"           value="RIL_COMMAND_SETSYSTEMSELECTIONPREFS" />
        <string id="CommandName.RIL_COMMAND_GETSYSTEMSELECTIONPREFS"           value="RIL_COMMAND_GETSYSTEMSELECTIONPREFS" />
        <string id="CommandName.RIL_COMMAND_GETOPERATORLIST"                   value="RIL_COMMAND_GETOPERATORLIST" />
        <string id="CommandName.RIL_COMMAND_GETPREFERREDOPERATORLIST"          value="RIL_COMMAND_GETPREFERREDOPERATORLIST" />
        <string id="CommandName.RIL_COMMAND_GETCURRENTREGSTATUS"               value="RIL_COMMAND_GETCURRENTREGSTATUS" />
        <string id="CommandName.RIL_COMMAND_GETSIGNALQUALITY"                  value="RIL_COMMAND_GETSIGNALQUALITY" />
        <string id="CommandName.RIL_COMMAND_SENDUICCTOOLKITCMDRESPONSE"        value="RIL_COMMAND_SENDUICCTOOLKITCMDRESPONSE" />
        <string id="CommandName.RIL_COMMAND_SENDUICCTOOLKITENVELOPE"           value="RIL_COMMAND_SENDUICCTOOLKITENVELOPE" />
        <string id="CommandName.RIL_COMMAND_DIAL"                              value="RIL_COMMAND_DIAL" />
        <string id="CommandName.RIL_COMMAND_MANAGECALLS"                       value="RIL_COMMAND_MANAGECALLS" />
        <string id="CommandName.RIL_COMMAND_EMERGENCYMODECONTROL"              value="RIL_COMMAND_EMERGENCYMODECONTROL" />
        <string id="CommandName.RIL_COMMAND_GETCALLFORWARDINGSETTINGS"         value="RIL_COMMAND_GETCALLFORWARDINGSETTINGS" />
        <string id="CommandName.RIL_COMMAND_SETCALLFORWARDINGSTATUS"           value="RIL_COMMAND_SETCALLFORWARDINGSTATUS" />
        <string id="CommandName.RIL_COMMAND_ADDCALLFORWARDING"                 value="RIL_COMMAND_ADDCALLFORWARDING" />
        <string id="CommandName.RIL_COMMAND_REMOVECALLFORWARDING"              value="RIL_COMMAND_REMOVECALLFORWARDING" />
        <string id="CommandName.RIL_COMMAND_GETCALLBARRINGSTATUS"              value="RIL_COMMAND_GETCALLBARRINGSTATUS" />
        <string id="CommandName.RIL_COMMAND_SETCALLBARRINGSTATUS"              value="RIL_COMMAND_SETCALLBARRINGSTATUS" />
        <string id="CommandName.RIL_COMMAND_CHANGECALLBARRINGPASSWORD"         value="RIL_COMMAND_CHANGECALLBARRINGPASSWORD" />
        <string id="CommandName.RIL_COMMAND_GETCALLWAITINGSETTINGS"            value="RIL_COMMAND_GETCALLWAITINGSETTINGS" />
        <string id="CommandName.RIL_COMMAND_SETCALLWAITINGSTATUS"              value="RIL_COMMAND_SETCALLWAITINGSTATUS" />
        <string id="CommandName.RIL_COMMAND_GETCALLERIDSETTINGS"               value="RIL_COMMAND_GETCALLERIDSETTINGS" />
        <string id="CommandName.RIL_COMMAND_GETDIALEDIDSETTINGS"               value="RIL_COMMAND_GETDIALEDIDSETTINGS" />
        <string id="CommandName.RIL_COMMAND_GETHIDECONNECTEDIDSETTINGS"        value="RIL_COMMAND_GETHIDECONNECTEDIDSETTINGS" />
        <string id="CommandName.RIL_COMMAND_GETHIDEIDSETTINGS"                 value="RIL_COMMAND_GETHIDEIDSETTINGS" />
        <string id="CommandName.RIL_COMMAND_SENDFLASH"                         value="RIL_COMMAND_SENDFLASH" />
        <string id="CommandName.RIL_COMMAND_SENDSUPSERVICEDATA"                value="RIL_COMMAND_SENDSUPSERVICEDATA" />
        <string id="CommandName.RIL_COMMAND_SENDDTMF"                          value="RIL_COMMAND_SENDDTMF" />
        <string id="CommandName.RIL_COMMAND_STARTDTMF"                         value="RIL_COMMAND_STARTDTMF" />
        <string id="CommandName.RIL_COMMAND_STOPDTMF"                          value="RIL_COMMAND_STOPDTMF" />
        <string id="CommandName.RIL_COMMAND_GETMSGSERVICEOPTIONS"              value="RIL_COMMAND_GETMSGSERVICEOPTIONS" />
        <string id="CommandName.RIL_COMMAND_READMSG"                           value="RIL_COMMAND_READMSG" />
        <string id="CommandName.RIL_COMMAND_WRITEMSG"                          value="RIL_COMMAND_WRITEMSG" />
        <string id="CommandName.RIL_COMMAND_DELETEMSG"                         value="RIL_COMMAND_DELETEMSG" />
        <string id="CommandName.RIL_COMMAND_GETCELLBROADCASTMSGCONFIG"         value="RIL_COMMAND_GETCELLBROADCASTMSGCONFIG" />
        <string id="CommandName.RIL_COMMAND_SETCELLBROADCASTMSGCONFIG"         value="RIL_COMMAND_SETCELLBROADCASTMSGCONFIG" />
        <string id="CommandName.RIL_COMMAND_GETMSGINUICCSTATUS"                value="RIL_COMMAND_GETMSGINUICCSTATUS" />
        <string id="CommandName.RIL_COMMAND_SETMSGINUICCSTATUS"                value="RIL_COMMAND_SETMSGINUICCSTATUS" />
        <string id="CommandName.RIL_COMMAND_SETMSGMEMORYSTATUS"                value="RIL_COMMAND_SETMSGMEMORYSTATUS" />
        <string id="CommandName.RIL_COMMAND_SENDMSG"                           value="RIL_COMMAND_SENDMSG" />
        <string id="CommandName.RIL_COMMAND_GETSMSC"                           value="RIL_COMMAND_GETSMSC" />
        <string id="CommandName.RIL_COMMAND_SETSMSC"                           value="RIL_COMMAND_SETSMSC" />
        <string id="CommandName.RIL_COMMAND_GETIMSSTATUS"                      value="RIL_COMMAND_GETIMSSTATUS" />
        <string id="CommandName.RIL_COMMAND_GETPOSITIONINFO"                   value="RIL_COMMAND_GETPOSITIONINFO" />
        <string id="CommandName.RIL_COMMAND_GETRADIOSTATEGROUPS"               value="RIL_COMMAND_GETRADIOSTATEGROUPS" />
        <string id="CommandName.RIL_COMMAND_GETRADIOSTATEDETAILS"              value="RIL_COMMAND_GETRADIOSTATEDETAILS" />
        <string id="CommandName.RIL_COMMAND_SETRADIOSTATEDETAILS"              value="RIL_COMMAND_SETRADIOSTATEDETAILS" />
        <string id="CommandName.RIL_COMMAND_RADIOSTATEPASSWORDCOMPARE"         value="RIL_COMMAND_RADIOSTATEPASSWORDCOMPARE" />
        <string id="CommandName.RIL_COMMAND_RADIOSTATEGETPASSWORDRETRYCOUNT"   value="RIL_COMMAND_RADIOSTATEGETPASSWORDRETRYCOUNT" />
        <string id="CommandName.RIL_COMMAND_DEVSPECIFIC"                       value="RIL_COMMAND_DEVSPECIFIC" />
        <string id="CommandName.RIL_COMMAND_SETRFSTATE"                        value="RIL_COMMAND_SETRFSTATE" />
        <string id="CommandName.RIL_COMMAND_GETRFSTATE"                        value="RIL_COMMAND_GETRFSTATE" />
        <string id="CommandName.RIL_COMMAND_GETDMPROFILECONFIGINFO"            value="RIL_COMMAND_GETDMPROFILECONFIGINFO" />
        <string id="CommandName.RIL_COMMAND_SETDMPROFILECONFIGINFO"            value="RIL_COMMAND_SETDMPROFILECONFIGINFO" />
        <string id="CommandName.RIL_COMMAND_WRITEADDITIONALNUMBERSTRING"       value="RIL_COMMAND_WRITEADDITIONALNUMBERSTRING" />
        <string id="CommandName.RIL_COMMAND_DELETEADDITIONALNUMBERSTRING"      value="RIL_COMMAND_DELETEADDITIONALNUMBERSTRING" />
        <string id="CommandName.RIL_COMMAND_GETUICCATR"                        value="RIL_COMMAND_GETUICCATR" />
        <string id="CommandName.RIL_COMMAND_OPENUICCLOGICALCHANNEL"            value="RIL_COMMAND_OPENUICCLOGICALCHANNEL" />
        <string id="CommandName.RIL_COMMAND_CLOSEUICCLOGICALCHANNEL"           value="RIL_COMMAND_CLOSEUICCLOGICALCHANNEL" />
        <string id="CommandName.RIL_COMMAND_EXCHANGEUICCAPDU"                  value="RIL_COMMAND_EXCHANGEUICCAPDU" />
        <string id="CommandName.RIL_COMMAND_SENDSUPSERVICEDATARESPONSE"        value="RIL_COMMAND_SENDSUPSERVICEDATARESPONSE" />
        <string id="CommandName.RIL_COMMAND_CANCELSUPSERVICEDATASESSION"       value="RIL_COMMAND_CANCELSUPSERVICEDATASESSION" />
        <string id="CommandName.RIL_COMMAND_SETUICCTOOLKITPROFILE"             value="RIL_COMMAND_SETUICCTOOLKITPROFILE" />
        <string id="CommandName.RIL_COMMAND_GETUICCTOOLKITPROFILE"             value="RIL_COMMAND_GETUICCTOOLKITPROFILE" />
        <string id="CommandName.RIL_COMMAND_REGISTERUICCTOOLKITSERVICE"        value="RIL_COMMAND_REGISTERUICCTOOLKITSERVICE" />
        <string id="CommandName.RIL_COMMAND_SENDMSGACK"                        value="RIL_COMMAND_SENDMSGACK" />
        <string id="CommandName.RIL_COMMAND_CLOSEUICCLOGICALCHANNELGROUP"      value="RIL_COMMAND_CLOSEUICCLOGICALCHANNELGROUP" />
        <string id="CommandName.RIL_COMMAND_SETPREFERREDOPERATORLIST"          value="RIL_COMMAND_SETPREFERREDOPERATORLIST" />
        <string id="CommandName.RIL_COMMAND_GETUICCSERVICESTATE"               value="RIL_COMMAND_GETUICCSERVICESTATE" />
        <string id="CommandName.RIL_COMMAND_SETUICCSERVICESTATE"               value="RIL_COMMAND_SETUICCSERVICESTATE" />
        <string id="CommandName.RIL_COMMAND_GETCALLLIST"                       value="RIL_COMMAND_GETCALLLIST" />
        <string id="CommandName.RIL_COMMAND_GETEXECUTORFOCUS"                  value="RIL_COMMAND_GETEXECUTORFOCUS" />
        <string id="CommandName.RIL_COMMAND_SETEXECUTORFOCUS"                  value="RIL_COMMAND_SETEXECUTORFOCUS" />
        <string id="CommandName.RIL_COMMAND_GETEMERGENCYMODE"                  value="RIL_COMMAND_GETEMERGENCYMODE" />
        <string id="CommandName.RIL_COMMAND_GETEXECUTORRFSTATE"                value="RIL_COMMAND_GETEXECUTORRFSTATE" />
        <string id="CommandName.RIL_COMMAND_SETEXECUTORRFSTATE"                value="RIL_COMMAND_SETEXECUTORRFSTATE" />
        <string id="CommandName.RIL_COMMAND_RESETMODEM"                        value="RIL_COMMAND_RESETMODEM" />
        <string id="CommandName.RIL_COMMAND_CANCELGETOPERATORLIST"             value="RIL_COMMAND_CANCELGETOPERATORLIST" />
        <string id="CommandName.RIL_COMMAND_AVOIDCDMASYSTEM"                   value="RIL_COMMAND_AVOIDCDMASYSTEM" />
        <string id="CommandName.RIL_COMMAND_SETPSMEDIACONFIGURATION"           value="RIL_COMMAND_SETPSMEDIACONFIGURATION" />
        <string id="CommandName.RIL_COMMAND_GETPSMEDIACONFIGURATION"           value="RIL_COMMAND_GETPSMEDIACONFIGURATION" />

        <string id="CommandName.INTERNAL_COMMAND_CARDABSENTDETECTION"          value="INTERNAL_COMMAND_CARDABSENTDETECTION" />
        <string id="CommandName.INTERNAL_COMMAND_GETSUBSCRIBERNUMBERS"         value="INTERNAL_COMMAND_GETSUBSCRIBERNUMBERS" />
        <string id="CommandName.INTERNAL_COMMAND_MSSRCOMPLETE"                 value="INTERNAL_COMMAND_MSSRCOMPLETE" />
        <string id="CommandName.INTERNAL_COMMAND_QUITECBM"                     value="INTERNAL_COMMAND_QUITECBM" />
        <string id="CommandName.INTERNAL_COMMAND_SETEXECUTORCONFIG"            value="INTERNAL_COMMAND_SETEXECUTORCONFIG" />
        <string id="CommandName.INTERNAL_COMMAND_SETSLOTPOWER"                 value="INTERNAL_COMMAND_SETSLOTPOWER" />
        <string id="CommandName.INTERNAL_COMMAND_UPDATEUICCAPPAPPERSOCHECKSTATE" value="INTERNAL_COMMAND_UPDATEUICCAPPAPPERSOCHECKSTATE" />
        <string id="CommandName.INTERNAL_COMMAND_VERIFYUICCLOCK"               value="INTERNAL_COMMAND_VERIFYUICCLOCK" />
        <string id="CommandName.INTERNAL_COMMAND_WAITUNTILUIMSERVICESTATESBECOMESAME" value="INTERNAL_COMMAND_WAITUNTILUIMSERVICESTATESBECOMESAME" />

        <string id="RIL_Notification.RADIOEQUIPMENTSTATECHANGED"               value="RIL_NOTIFY_RADIOEQUIPMENTSTATECHANGED" />
        <string id="RIL_Notification.RADIOPRESENCECHANGED"                     value="RIL_NOTIFY_RADIOPRESENCECHANGED" />
        <string id="RIL_Notification.UICCFILE_DATACHANGE"                      value="RIL_NOTIFY_UICCFILE_DATACHANGE" />
        <string id="RIL_Notification.UICCAPP_DATACHANGE"                       value="RIL_NOTIFY_UICCAPP_DATACHANGE" />
        <string id="RIL_Notification.SLOTINFOCHANGED"                          value="RIL_NOTIFY_SLOTINFOCHANGED" />
        <string id="RIL_Notification.CARDAPPREMOVED"                           value="RIL_NOTIFY_CARDAPPREMOVED" />
        <string id="RIL_Notification.CARDAPPADDED"                             value="RIL_NOTIFY_CARDAPPADDED" />
        <string id="RIL_Notification.UICCLOCKSTATUS"                           value="RIL_NOTIFY_UICCLOCKSTATUS" />
        <string id="RIL_Notification.UICCAPPPERSOCHECKSTATUS"                  value="RIL_NOTIFY_UICCAPPPERSOCHECKSTATUS" />
        <string id="RIL_Notification.PHONEBOOKENTRYDELETED"                    value="RIL_NOTIFY_PHONEBOOKENTRYDELETED" />
        <string id="RIL_Notification.PHONEBOOKENTRYSTORED"                     value="RIL_NOTIFY_PHONEBOOKENTRYSTORED" />
        <string id="RIL_Notification.PHONEBOOKREADYSTATE"                      value="RIL_NOTIFY_PHONEBOOKREADYSTATE" />
        <string id="RIL_Notification.EMERGENCYNUMBERLISTCHANGED"               value="RIL_NOTIFY_EMERGENCYNUMBERLISTCHANGED" />
        <string id="RIL_Notification.REGSTATUSCHANGED"                         value="RIL_NOTIFY_REGSTATUSCHANGED" />
        <string id="RIL_Notification.LOCATIONUPDATE"                           value="RIL_NOTIFY_LOCATIONUPDATE" />
        <string id="RIL_Notification.NETWORKCODECHANGED"                       value="RIL_NOTIFY_NETWORKCODECHANGED" />
        <string id="RIL_Notification.PROVISION_STATUS"                         value="RIL_NOTIFY_PROVISION_STATUS" />
        <string id="RIL_Notification.SYSTEMPREFSCHANGED"                       value="RIL_NOTIFY_SYSTEMPREFSCHANGED" />
        <string id="RIL_Notification.EXECUTORSTATE"                            value="RIL_NOTIFY_EXECUTORSTATE" />
        <string id="RIL_Notification.MANAGED_ROAMING"                          value="RIL_NOTIFY_MANAGED_ROAMING" />
        <string id="RIL_Notification.SIGNALQUALITY"                            value="RIL_NOTIFY_SIGNALQUALITY" />
        <string id="RIL_Notification.NITZ"                                     value="RIL_NOTIFY_NITZ" />
        <string id="RIL_Notification.UICCTOOLKITCMD"                           value="RIL_NOTIFY_UICCTOOLKITCMD" />
        <string id="RIL_Notification.CALLMODIFICATIONINFO"                     value="RIL_NOTIFY_CALLMODIFICATIONINFO" />
        <string id="RIL_Notification.CALLPROGRESSINFO"                         value="RIL_NOTIFY_CALLPROGRESSINFO" />
        <string id="RIL_Notification.EMERGENCYMODEENTERED"                     value="RIL_NOTIFY_EMERGENCYMODEENTERED" />
        <string id="RIL_Notification.EMERGENCYMODEEXITED"                      value="RIL_NOTIFY_EMERGENCYMODEEXITED" />
        <string id="RIL_Notification.CALLWAITING"                              value="RIL_NOTIFY_CALLWAITING" />
        <string id="RIL_Notification.DIALEDID"                                 value="RIL_NOTIFY_DIALEDID" />
        <string id="RIL_Notification.DISPLAY"                                  value="RIL_NOTIFY_DISPLAY" />
        <string id="RIL_Notification.SUPSVCINFO"                               value="RIL_NOTIFY_SUPSVCINFO" />
        <string id="RIL_Notification.SUPSERVICEDATA"                           value="RIL_NOTIFY_SUPSERVICEDATA" />
        <string id="RIL_Notification.UNSOLICITEDSS"                            value="RIL_NOTIFY_UNSOLICITEDSS" />
        <string id="RIL_Notification.LINECONTROL"                              value="RIL_NOTIFY_LINECONTROL" />
        <string id="RIL_Notification.MESSAGE"                                  value="RIL_NOTIFY_MESSAGE" />
        <string id="RIL_Notification.MESSAGE_IN_UICC"                          value="RIL_NOTIFY_MESSAGE_IN_UICC" />
        <string id="RIL_Notification.IMSSTATUS"                                value="RIL_NOTIFY_IMSSTATUS" />
        <string id="RIL_Notification.ADDITIONALNUMBERSTRINGUPDATED"            value="RIL_NOTIFY_ADDITIONALNUMBERSTRINGUPDATED" />
        <string id="RIL_Notification.SUPSERVICEDATATERMINATED"                 value="RIL_NOTIFY_SUPSERVICEDATATERMINATED" />
        <string id="RIL_Notification.CLEARIDLEMODETEXT"                        value="RIL_NOTIFY_CLEARIDLEMODETEXT" />
        <string id="RIL_Notification.MESSAGE_STORAGE_FULL"                     value="RIL_NOTIFY_MESSAGE_STORAGE_FULL" />
        <string id="RIL_Notification.TONESIGNAL"                               value="RIL_NOTIFY_TONESIGNAL" />
        <string id="RIL_Notification.FORWARDSTARTDTMF"                         value="RIL_NOTIFY_FORWARDSTARTDTMF" />
        <string id="RIL_Notification.FORWARDSTOPDTMF"                          value="RIL_NOTIFY_FORWARDSTOPDTMF" />
        <string id="RIL_Notification.FORWARDBURSTDTMF"                         value="RIL_NOTIFY_FORWARDBURSTDTMF" />
        <string id="RIL_Notification.EXECUTORFOCUSSTATECHANGED"                value="RIL_NOTIFY_EXECUTORFOCUSSTATECHANGED" />
        <string id="RIL_Notification.EXECUTORRFSTATE"                          value="RIL_NOTIFY_EXECUTORRFSTATE" />
        <string id="RIL_Notification.MODEMRESET"                               value="RIL_NOTIFY_MODEMRESET" />
        <string id="RIL_Notification.RADIOCONFIGURATION"                       value="RIL_NOTIFY_RADIOCONFIGURATION" />
        <string id="RIL_Notification.IMSHANDOVERATTEMPT"                       value="RIL_NOTIFY_IMSHANDOVERATTEMPT" />

        <string id="RILUICCAPPPERSOCHECKSTATUSSTATE.RIL_PERSOCHECKSTATE_NOTREADY"     value="RIL_PERSOCHECKSTATE_NOTREADY"/>
        <string id="RILUICCAPPPERSOCHECKSTATUSSTATE.RIL_PERSOCHECKSTATE_PASS"         value="RIL_PERSOCHECKSTATE_PASS"/>
        <string id="RILUICCAPPPERSOCHECKSTATUSSTATE.RIL_PERSOCHECKSTATE_FAIL"         value="RIL_PERSOCHECKSTATE_FAIL"/>

        <string id="RilMsgType.RIL_MSGTYPE_IN_DELIVER"                               value="RIL_MSGTYPE_IN_DELIVER" />
        <string id="RilMsgType.RIL_MSGTYPE_IN_STATUS"                                value="RIL_MSGTYPE_IN_STATUS" />
        <string id="RilMsgType.RIL_MSGTYPE_OUT_SUBMIT"                               value="RIL_MSGTYPE_OUT_SUBMIT" />
        <string id="RilMsgType.RIL_MSGTYPE_OUT_CDMASUBMIT"                           value="RIL_MSGTYPE_OUT_CDMASUBMIT" />
        <string id="RilMsgType.RIL_MSGTYPE_IN_CDMADELIVER"                           value="RIL_MSGTYPE_IN_CDMADELIVER" />
        <string id="RilMsgType.RIL_MSGTYPE_IN_IS637STATUS"                           value="RIL_MSGTYPE_IN_IS637STATUS" />
        <string id="RilMsgType.RIL_MSGTYPE_BC_GENERAL"                               value="RIL_MSGTYPE_BC_GENERAL" />


        <string id="UserApplicationSelection.Disabled"                  value="Disabled"/>
        <string id="UserApplicationSelection.Enabled"                   value="Enabled"/>

        <string id="AppOrModemProcessorPersonalization.APPerso"         value="Modem will handle ME personalization." />
        <string id="AppOrModemProcessorPersonalization.MPPerso"         value="Application Processor will handle ME personalization." />

        <string id="QmiVoiceCallDirection.MO"                           value="Mobile Originated" />
        <string id="QmiVoiceCallDirection.MT"                           value="Mobile Terminated" />

        
        <string id="3GPPTone.RIL_3GPPTONE_TONEOFF"                      value="OFF" />
        <string id="3GPPTone.RIL_3GPPTONE_RINGBACK"                     value="RINGBACK" />
        <string id="3GPPTone.RIL_3GPPTONE_BUSY"                         value="BUSY" />
        <string id="3GPPTone.RIL_3GPPTONE_CONGESTION"                   value="CONGESTION" />
        <string id="3GPPTone.RIL_3GPPTONE_AUTHENTICATIONFAILURE"        value="AUTHENTICATIONFAILURE" />
        <string id="3GPPTone.RIL_3GPPTONE_NUMBERUNOBTAINABLE"           value="NUMBERUNOBTAINABLE" />
        <string id="3GPPTone.RIL_3GPPTONE_CALLDROPPED"                  value="CALLDROPPED" />
        
        <string id="3GPP2Tone.RIL_3GPP2TONE_TONEOFF"                    value="OFF" />
        <string id="3GPP2Tone.RIL_3GPP2TONE_DIAL"                       value="DIAL" />
        <string id="3GPP2Tone.RIL_3GPP2TONE_RINGBACK"                   value="RINGBACK" />
        <string id="3GPP2Tone.RIL_3GPP2TONE_INTERCEPT"                  value="INTERCEPT" />
        <string id="3GPP2Tone.RIL_3GPP2TONE_ABRVINTERCEPT"              value="ABRVINTERCEPT" />
        <string id="3GPP2Tone.RIL_3GPP2TONE_REORDER"                    value="REORDER" />
        <string id="3GPP2Tone.RIL_3GPP2TONE_ABRVREORDER"                value="ABRVREORDER" />
        <string id="3GPP2Tone.RIL_3GPP2TONE_BUSY"                       value="BUSY" />
        <string id="3GPP2Tone.RIL_3GPP2TONE_CONFIRM"                    value="CONFIRM" />
        <string id="3GPP2Tone.RIL_3GPP2TONE_ANSWER"                     value="ANSWER" />
        <string id="3GPP2Tone.RIL_3GPP2TONE_CALLWAITING"                value="CALLWAITING" />
        <string id="3GPP2Tone.RIL_3GPP2TONE_PIP"                        value="PIP" />

        <string id="QmiUimCardState.Absent"                             value="UIM_CARD_STATE_ABSENT_V01" />
        <string id="QmiUimCardState.Present"                            value="UIM_CARD_STATE_PRESENT_V01" />
        <string id="QmiUimCardState.Error"                              value="UIM_CARD_STATE_ERROR_V01" />

        <string id="QmiUimCardError.Unknown"                            value="UIM_CARD_ERROR_CODE_UNKNOWN_V01" />
        <string id="QmiUimCardError.Power_Down"                         value="UIM_CARD_ERROR_CODE_POWER_DOWN_V01" />
        <string id="QmiUimCardError.Poll_Error"                         value="UIM_CARD_ERROR_CODE_POLL_ERROR_V01" />
        <string id="QmiUimCardError.No_ATR_Received"                    value="UIM_CARD_ERROR_CODE_NO_ATR_RECEIVED_V01" />
        <string id="QmiUimCardError.Volt_Mismatch"                      value="UIM_CARD_ERROR_CODE_VOLT_MISMATCH_V01" />
        <string id="QmiUimCardError.Parity_Error"                       value="UIM_CARD_ERROR_CODE_PARITY_ERROR_V01" />
        <string id="QmiUimCardError.Possibly_Removed"                   value="UIM_CARD_ERROR_CODE_POSSIBLY_REMOVED_V01" />
        <string id="QmiUimCardError.Sim_Technical_Problems"             value="UIM_CARD_ERROR_CODE_SIM_TECHNICAL_PROBLEMS_V01" />

        <string id="QmiUimPinState.Unknown"                             value="UIM_PIN_STATE_UNKNOWN_V01" />
        <string id="QmiUimPinState.Enabled_Not_Verified"                value="UIM_PIN_STATE_ENABLED_NOT_VERIFIED_V01" />
        <string id="QmiUimPinState.Enabled_Verified"                    value="UIM_PIN_STATE_ENABLED_VERIFIED_V01" />
        <string id="QmiUimPinState.Disabled"                            value="UIM_PIN_STATE_DISABLED_V01" />
        <string id="QmiUimPinState.Blocked"                             value="UIM_PIN_STATE_BLOCKED_V01" />
        <string id="QmiUimPinState.Permanently_Blocked"                 value="UIM_PIN_STATE_PERMANENTLY_BLOCKED_V01" />

        <string id="QmiUimAppType.UNKNOWN"                              value="UIM_APP_TYPE_UNKNOWN_V01" />
        <string id="QmiUimAppType.SIM"                                  value="UIM_APP_TYPE_SIM_V01" />
        <string id="QmiUimAppType.USIM"                                 value="UIM_APP_TYPE_USIM_V01" />
        <string id="QmiUimAppType.RUIM"                                 value="UIM_APP_TYPE_RUIM_V01" />
        <string id="QmiUimAppType.CSIM"                                 value="UIM_APP_TYPE_CSIM_V01" />
        <string id="QmiUimAppType.ISIM"                                 value="UIM_APP_TYPE_ISIM_V01" />

        <string id="QmiUimAppState.Unknown"                             value="UIM_APP_STATE_UNKNOWN_V01" />
        <string id="QmiUimAppState.Detected"                            value="UIM_APP_STATE_DETECTED_V01" />
        <string id="QmiUimAppState.Pin1_or_Upin_Required"               value="UIM_APP_STATE_PIN1_OR_UPIN_REQ_V01" />
        <string id="QmiUimAppState.Puk1_or_Puk_Required"                value="UIM_APP_STATE_PUK1_OR_PUK_REQ_V01" />
        <string id="QmiUimAppState.Person_Check_Required"               value="UIM_APP_STATE_PERSON_CHECK_REQ_V01" />
        <string id="QmiUimAppState.Pin1_Permanently_Blocked"            value="UIM_APP_STATE_PIN1_PERM_BLOCKED_V01" />
        <string id="QmiUimAppState.Illegal"                             value="UIM_APP_STATE_ILLEGAL_V01" />
        <string id="QmiUimAppState.Ready"                               value="UIM_APP_STATE_READY_V01" />

        <string id="QmiUimPersoState.UNKNOWN_V01"                       value="UIM_PERSO_STATE_UNKNOWN_V01" />
        <string id="QmiUimPersoState.IN_PROGRESS_V01"                   value="UIM_PERSO_STATE_IN_PROGRESS_V01" />
        <string id="QmiUimPersoState.READY_V01"                         value="UIM_PERSO_STATE_READY_V01" />
        <string id="QmiUimPersoState.CODE_REQ_V01"                      value="UIM_PERSO_STATE_CODE_REQ_V01" />
        <string id="QmiUimPersoState.PUK_REQ_V01"                       value="UIM_PERSO_STATE_PUK_REQ_V01" />
        <string id="QmiUimPersoState.PERMANENTLY_BLOCKED_V01"           value="UIM_PERSO_STATE_PERMANENTLY_BLOCKED_V01" />

        <string id="QmiUimPersoFeatureStatus.Gw_Network"                value="UIM_PERSO_FEATURE_STATUS_GW_NETWORK_V01" />
        <string id="QmiUimPersoFeatureStatus.Gw_Network_Subset"         value="UIM_PERSO_FEATURE_STATUS_GW_NETWORK_SUBSET_V01" />
        <string id="QmiUimPersoFeatureStatus.Gw_Service_Provider"       value="UIM_PERSO_FEATURE_STATUS_GW_SERVICE_PROVIDER_V01" />
        <string id="QmiUimPersoFeatureStatus.Gw_Corporate"              value="UIM_PERSO_FEATURE_STATUS_GW_CORPORATE_V01" />
        <string id="QmiUimPersoFeatureStatus.Gw_UIM"                    value="UIM_PERSO_FEATURE_STATUS_GW_UIM_V01" />
        <string id="QmiUimPersoFeatureStatus.1X_Network_Type1"          value="UIM_PERSO_FEATURE_STATUS_1X_NETWORK_TYPE_1_V01" />
        <string id="QmiUimPersoFeatureStatus.1X_Network_Type2"          value="UIM_PERSO_FEATURE_STATUS_1X_NETWORK_TYPE_2_V01" />
        <string id="QmiUimPersoFeatureStatus.1x_HRPD"                   value="UIM_PERSO_FEATURE_STATUS_1X_HRPD_V01" />
        <string id="QmiUimPersoFeatureStatus.1x_Service_Provider"       value="UIM_PERSO_FEATURE_STATUS_1X_SERVICE_PROVIDER_V01" />
        <string id="QmiUimPersoFeatureStatus.1x_Corporate"              value="UIM_PERSO_FEATURE_STATUS_1X_CORPORATE_V01" />
        <string id="QmiUimPersoFeatureStatus.1x_RUIM"                   value="UIM_PERSO_FEATURE_STATUS_1X_RUIM_V01" />
        <string id="QmiUimPersoFeatureStatus.Unknown"                   value="UIM_PERSO_FEATURE_STATUS_UNKNOWN_V01" />

        <string id="QmiUimUpinReplacedState.Pin1_Used"                  value="UIM_UNIV_PIN_PIN1_USED_V01" />
        <string id="QmiUimUpinReplacedState.Upin_Replaces_Pin1"         value="UIM_UNIV_PIN_UPIN_REPLACES_PIN1_V01" />

        <string id="UimSessionType.PRIMARY_GW_V01"                      value="UIM_SESSION_TYPE_PRIMARY_GW_V01" />
        <string id="UimSessionType.PRIMARY_1X_V01"                      value="UIM_SESSION_TYPE_PRIMARY_1X_V01" />
        <string id="UimSessionType.SECONDARY_GW_V01"                    value="UIM_SESSION_TYPE_SECONDARY_GW_V01" />
        <string id="UimSessionType.SECONDARY_1X_V01"                    value="UIM_SESSION_TYPE_SECONDARY_1X_V01" />
        <string id="UimSessionType.NONPROVISIONING_SLOT_1_V01"          value="UIM_SESSION_TYPE_NONPROVISIONING_SLOT_1_V01" />
        <string id="UimSessionType.NONPROVISIONING_SLOT_2_V01"          value="UIM_SESSION_TYPE_NONPROVISIONING_SLOT_2_V01" />
        <string id="UimSessionType.CARD_ON_SLOT_1_V01"                  value="UIM_SESSION_TYPE_CARD_ON_SLOT_1_V01" />
        <string id="UimSessionType.CARD_ON_SLOT_2_V01"                  value="UIM_SESSION_TYPE_CARD_ON_SLOT_2_V01" />
        <string id="UimSessionType.CHANNEL_ID_SLOT_1_V01"               value="UIM_SESSION_TYPE_CHANNEL_ID_SLOT_1_V01" />
        <string id="UimSessionType.CHANNEL_ID_SLOT_2_V01"               value="UIM_SESSION_TYPE_CHANNEL_ID_SLOT_2_V01" />

        <string id="IOCTLStateType.StateInitial"                          value="StateInitial" />
        <string id="IOCTLStateType.StateUnbindingWaitingForInternalInd"   value="StateUnbindingWaitingForInternalInd" />
        <string id="IOCTLStateType.StateBindingWaitingForInternalInd"     value="StateBindingWaitingForInternalInd" />

        <string id="InternalIndicationType.UIMCardStatus"                   value="InternalIndicationUIMCardStatus" />
        <string id="InternalIndicationType.EmergencyModeExited"             value="InternalIndicationEmergencyModeExited" />
        <string id="InternalIndicationType.SystemSelectionPrefs"            value="InternalIndicationSystemSelectionPrefs" />
        <string id="InternalIndicationType.PBMRecordStored"                 value="InternalIndicationPBMRecordStored" />
        <string id="InternalIndicationType.PBMRecordDeleted"                value="InternalIndicationPBMRecordDeleted" />
        <string id="InternalIndicationType.3GPP2EFSPNFileChanged"           value="InternalIndication3GPP2EFSPNFileChanged" />
        <string id="InternalIndicationType.OperatingModeChanged"            value="InternalIndicationOperatingModeChanged" />
        <string id="InternalIndicationType.PrlInitCompleted"                value="InternalIndicationPrlInitCompleted" />
        <string id="InternalIndicationType.PBMAASUpdated"                   value="InternalIndicationPBMAASUpdated" />
        <string id="InternalIndicationType.APPersoActivatedFeaturesUpdated" value="InternalIndicationAPPersoActivatedFeaturesUpdated" />
        <string id="InternalIndicationType.APPersoPersoCheckStateUpdated"   value="InternalIndicationAPPersoPersoCheckStateUpdated" />
        <string id="InternalIndicationType.UICCRefreshCommandOccured"       value="InternalIndicationUICCRefreshCommandOccured" />
        <string id="InternalIndicationType.SubscriberNumbersRetrieved"      value="InternalIndicationSubscriberNumbersRetrieved" />
        <string id="InternalIndicationType.ExternalUSSDIndicationArrived"   value="InternalIndicationExternalUSSDIndicationArrived" />
        <string id="InternalIndicationType.FirstOpenChannelReceived"        value="InternalIndicationFirstOpenChannelReceived" />

        <string id="RTREControlValueEnum.RUIM_ONLY_V01"                 value="NAS_RTRE_CFG_RUIM_ONLY_V01" />
        <string id="RTREControlValueEnum.INTERNAL_SETTINGS_ONLY_V01"    value="NAS_RTRE_CFG_INTERNAL_SETTINGS_ONLY_V01" />
        <string id="RTREControlValueEnum.RUIM_IF_AVAIL_V01"             value="NAS_RTRE_CFG_RUIM_IF_AVAIL_V01" />
        <string id="RTREControlValueEnum.GSM_ON_1X_V01"                 value="NAS_RTRE_CFG_GSM_ON_1X_V01" />

        <string id="SlotStateEnum.Off_Empty"                            value="RIL_UICCSLOT_OFF_EMPTY" />
        <string id="SlotStateEnum.Off"                                  value="RIL_UICCSLOT_OFF" />
        <string id="SlotStateEnum.Empty"                                value="RIL_UICCSLOT_EMPTY" />
        <string id="SlotStateEnum.Not_Ready"                            value="RIL_UICCSLOT_NOT_READY" />
        <string id="SlotStateEnum.Active"                               value="RIL_UICCSLOT_ACTIVE" />
        <string id="SlotStateEnum.Error"                                value="RIL_UICCSLOT_ERROR" />

        <string id="RilUiccAppType.UNKNOWN"                             value="RIL_UICCAPPTYPE_UNKNOWN" />
        <string id="RilUiccAppType.MF"                                  value="RIL_UICCAPPTYPE_MF" />
        <string id="RilUiccAppType.MF_SIM"                              value="RIL_UICCAPPTYPE_MF_SIM" />
        <string id="RilUiccAppType.MF_RUIM"                             value="RIL_UICCAPPTYPE_MF_RUIM" />
        <string id="RilUiccAppType.USIM"                                value="RIL_UICCAPPTYPE_USIM" />
        <string id="RilUiccAppType.CSIM"                                value="RIL_UICCAPPTYPE_CSIM" />
        <string id="RilUiccAppType.ISIM"                                value="RIL_UICCAPPTYPE_ISIM" />

        <string id="RilUiccRecordType.Unknown"                          value="RIL_UICCRECORDTYPE_UNKNOWN" />
        <string id="RilUiccRecordType.Transparent"                      value="RIL_UICCRECORDTYPE_TRANSPARENT" />
        <string id="RilUiccRecordType.Cyclic"                           value="RIL_UICCRECORDTYPE_CYCLIC" />
        <string id="RilUiccRecordType.Linear"                           value="RIL_UICCRECORDTYPE_LINEAR" />
        <string id="RilUiccRecordType.Bertlv"                           value="RIL_UICCRECORDTYPE_BERTLV" />
        <string id="RilUiccRecordType.Master"                           value="RIL_UICCRECORDTYPE_MASTER" />
        <string id="RilUiccRecordType.Dedicated"                        value="RIL_UICCRECORDTYPE_DEDICATED" />

        <string id="RilUiccFileType.TRANSPARENT_V01"                    value="UIM_FILE_TYPE_TRANSPARENT_V01" />
        <string id="RilUiccFileType.CYCLIC_V01"                         value="UIM_FILE_TYPE_CYCLIC_V01" />
        <string id="RilUiccFileType.LINEAR_FIXED_V01"                   value="UIM_FILE_TYPE_LINEAR_FIXED_V01" />
        <string id="RilUiccFileType.DEDICATED_FILE_V01"                 value="UIM_FILE_TYPE_DEDICATED_FILE_V01" />
        <string id="RilUiccFileType.MASTER_FILE_V01"                    value="UIM_FILE_TYPE_MASTER_FILE_V01" />

        <string id="UimAccessConditionType.ALWAYS_V01"                  value="UIM_SEC_CONDITION_ALWAYS_V01" />
        <string id="UimAccessConditionType.NEVER_V01"                   value="UIM_SEC_CONDITION_NEVER_V01" />
        <string id="UimAccessConditionType.AND_COND_V01"                value="UIM_SEC_CONDITION_AND_COND_V01" />
        <string id="UimAccessConditionType.OR_COND_V01"                 value="UIM_SEC_CONDITION_OR_COND_V01" />
        <string id="UimAccessConditionType.SINGLE_COND_V01"             value="UIM_SEC_CONDITION_SINGLE_COND_V01" />

        <string id="RilAccessConditionType.ALW"                         value="RIL_UICCFILEACCESSCONDITION_ALW" />
        <string id="RilAccessConditionType.PIN1"                        value="RIL_UICCFILEACCESSCONDITION_PIN1" />
        <string id="RilAccessConditionType.PIN2"                        value="RIL_UICCFILEACCESSCONDITION_PIN2" />
        <string id="RilAccessConditionType.RFU3"                        value="RIL_UICCFILEACCESSCONDITION_RFU3" />
        <string id="RilAccessConditionType.RFU4"                        value="RIL_UICCFILEACCESSCONDITION_RFU4" />
        <string id="RilAccessConditionType.ADM5"                        value="RIL_UICCFILEACCESSCONDITION_ADM5" />
        <string id="RilAccessConditionType.ADM6"                        value="RIL_UICCFILEACCESSCONDITION_ADM6" />
        <string id="RilAccessConditionType.NEV"                         value="RIL_UICCFILEACCESSCONDITION_NEV" />

        <string id="RilUiccChannelGroup.NFC"                            value="RIL_UICCCHANNELGROUP_NFC" />

        <string id="PinIdType.PIN_1_V01"                                value="UIM_PIN_ID_PIN_1_V01" />
        <string id="PinIdType.PIN_2_V01"                                value="UIM_PIN_ID_PIN_2_V01" />
        <string id="PinIdType.UNIVERSAL_V01"                            value="UIM_PIN_ID_UNIVERSAL_V01" />
        <string id="PinIdType.HIDDEN_KEY_V01"                           value="UIM_PIN_ID_HIDDEN_KEY_V01" />

        <string id="ResultType.SUCCESS_V01"                             value="QMI_RESULT_SUCCESS_V01" />
        <string id="ResultType.FAILURE_V01"                             value="QMI_RESULT_FAILURE_V01" />

        <string id="PinStateType.UNKNOWN_V01"                           value="UIM_PIN_STATE_UNKNOWN_V01" />
        <string id="PinStateType.ENABLED_NOT_VERIFIED_V01"              value="UIM_PIN_STATE_ENABLED_NOT_VERIFIED_V01" />
        <string id="PinStateType.ENABLED_VERIFIED_V01"                  value="UIM_PIN_STATE_ENABLED_VERIFIED_V01" />
        <string id="PinStateType.DISABLED_V01"                          value="UIM_PIN_STATE_DISABLED_V01" />
        <string id="PinStateType.BLOCKED_V01"                           value="UIM_PIN_STATE_BLOCKED_V01" />
        <string id="PinStateType.PERMANENTLY_BLOCKED_V01"               value="UIM_PIN_STATE_PERMANENTLY_BLOCKED_V01" />

        <string id="RilPersoFeatureType.Network"                        value="RIL_PERSOFEATURE_3GPP_NET"/>
        <string id="RilPersoFeatureType.Network_Subset"                 value="RIL_PERSOFEATURE_3GPP_NETSUB"/>
        <string id="RilPersoFeatureType.Service_Provider"               value="RIL_PERSOFEATURE_3GPP_SP"/>
        <string id="RilPersoFeatureType.Corporate"                      value="RIL_PERSOFEATURE_3GPP_CORP"/>
        <string id="RilPersoFeatureType.USIM"                           value="RIL_PERSOFEATURE_3GPP_USIM"/>
        <string id="RilPersoFeatureType.2_Network_Type1"                value="RIL_PERSOFEATURE_3GPP2_NETTYPE1"/>
        <string id="RilPersoFeatureType.2_Network_Type2"                value="RIL_PERSOFEATURE_3GPP2_NETTYPE2"/>
        <string id="RilPersoFeatureType.2_HRPD"                         value="RIL_PERSOFEATURE_3GPP2_HRPD"/>
        <string id="RilPersoFeatureType.2_Service_Provider"             value="RIL_PERSOFEATURE_3GPP2_SP"/>
        <string id="RilPersoFeatureType.2_Corporate"                    value="RIL_PERSOFEATURE_3GPP2_CORP"/>
        <string id="RilPersoFeatureType.2_UIM"                          value="RIL_PERSOFEATURE_3GPP2_UIM"/>

        <string id="RilPersoDeactivationState.READY"                    value="RIL_DEPERSOSTATE_READY" />
        <string id="RilPersoDeactivationState.CK_REQUIRED"              value="RIL_DEPERSOSTATE_CK_REQUIRED" />
        <string id="RilPersoDeactivationState.PUK_REQUIRED"             value="RIL_DEPERSOSTATE_PUK_REQUIRED" />
        <string id="RilPersoDeactivationState.PUK_BLOCKED"              value="RIL_DEPERSOSTATE_PUK_BLOCKED" />

        <string id="RilExecutorFlag.ENABLED"                            value="RIL_EXECUTORFLAG_ENABLED" />
        <string id="RilExecutorFlag.HIGHPRIORITY"                       value="RIL_EXECUTORFLAG_HIGHPRIORITY" />

        <string id="RilPersoLockSupportCaps.NET"                        value="RIL_CAPS_PERSOFEATURE_3GPP_NET"/>
        <string id="RilPersoLockSupportCaps.NETSUB"                     value="RIL_CAPS_PERSOFEATURE_3GPP_NETSUB"/>
        <string id="RilPersoLockSupportCaps.SP"                         value="RIL_CAPS_PERSOFEATURE_3GPP_SP"/>
        <string id="RilPersoLockSupportCaps.CORP"                       value="RIL_CAPS_PERSOFEATURE_3GPP_CORP"/>
        <string id="RilPersoLockSupportCaps.USIM"                       value="RIL_CAPS_PERSOFEATURE_3GPP_USIM"/>
        <string id="RilPersoLockSupportCaps.2_NETTYPE1"                 value="RIL_CAPS_PERSOFEATURE_3GPP2_NETTYPE1"/>
        <string id="RilPersoLockSupportCaps.2_NETTYPE2"                 value="RIL_CAPS_PERSOFEATURE_3GPP2_NETTYPE2"/>
        <string id="RilPersoLockSupportCaps.2_HRPD"                     value="RIL_CAPS_PERSOFEATURE_3GPP2_HRPD"/>
        <string id="RilPersoLockSupportCaps.2_SP"                       value="RIL_CAPS_PERSOFEATURE_3GPP2_SP"/>
        <string id="RilPersoLockSupportCaps.2_CORP"                     value="RIL_CAPS_PERSOFEATURE_3GPP2_CORP"/>
        <string id="RilPersoLockSupportCaps.2_UIM"                      value="RIL_CAPS_PERSOFEATURE_3GPP2_UIM"/>

        <string id="PbmSessionType.GW_PRIMARY_V01"                      value="PBM_SESSION_TYPE_GW_PRIMARY_V01" />
        <string id="PbmSessionType.1X_PRIMARY_V01"                      value="PBM_SESSION_TYPE_1X_PRIMARY_V01" />
        <string id="PbmSessionType.GW_SECONDARY_V01"                    value="PBM_SESSION_TYPE_GW_SECONDARY_V01" />
        <string id="PbmSessionType.1X_SECONDARY_V01"                    value="PBM_SESSION_TYPE_1X_SECONDARY_V01" />
        <string id="PbmSessionType.NON_PROVISIONING_SLOT1_V01"          value="PBM_SESSION_TYPE_NON_PROVISIONING_SLOT1_V01" />
        <string id="PbmSessionType.NON_PROVISIONING_SLOT2_V01"          value="PBM_SESSION_TYPE_NON_PROVISIONING_SLOT2_V01" />
        <string id="PbmSessionType.GLOBAL_PB_SLOT1_V01"                 value="PBM_SESSION_TYPE_GLOBAL_PB_SLOT1_V01" />
        <string id="PbmSessionType.GLOBAL_PB_SLOT2_V01"                 value="PBM_SESSION_TYPE_GLOBAL_PB_SLOT2_V01" />

        <string id="StoreLocEnum.UNKNOWN"                               value="RIL_PBLOC_UNKNOWN" />
        <string id="StoreLocEnum.UICCFIXDIALING"                        value="RIL_PBLOC_UICCFIXDIALING" />
        <string id="StoreLocEnum.OWNNUMBERS"                            value="RIL_PBLOC_OWNNUMBERS" />
        <string id="StoreLocEnum.UICCPHONEBOOK"                         value="RIL_PBLOC_UICCPHONEBOOK" />
        <string id="StoreLocEnum.UICCSERVICEDIALING"                    value="RIL_PBLOC_UICCSERVICEDIALING" />

        <string id="PbTypeEnum.ADN_V01"                                 value="PBM_PB_TYPE_ADN_V01" />
        <string id="PbTypeEnum.FDN_V01"                                 value="PBM_PB_TYPE_FDN_V01" />
        <string id="PbTypeEnum.MSISDN_V01"                              value="PBM_PB_TYPE_MSISDN_V01" />
        <string id="PbTypeEnum.MBDN_V01"                                value="PBM_PB_TYPE_MBDN_V01" />
        <string id="PbTypeEnum.SDN_V01"                                 value="PBM_PB_TYPE_SDN_V01" />
        <string id="PbTypeEnum.BDN_V01"                                 value="PBM_PB_TYPE_BDN_V01" />
        <string id="PbTypeEnum.LND_V01"                                 value="PBM_PB_TYPE_LND_V01" />
        <string id="PbTypeEnum.MBN_V01"                                 value="PBM_PB_TYPE_MBN_V01" />

        <string id="PbmNumType.UNKNOWN_V01"                             value="PBM_NUM_TYPE_UNKNOWN_V01"/>
        <string id="PbmNumType.INTERNATIONAL_V01"                       value="PBM_NUM_TYPE_INTERNATIONAL_V01"/>
        <string id="PbmNumType.NATIONAL_V01"                            value="PBM_NUM_TYPE_NATIONAL_V01"/>
        <string id="PbmNumType.NETWORK_SPECIFIC_V01"                    value="PBM_NUM_TYPE_NETWORK_SPECIFIC_V01"/>
        <string id="PbmNumType.DEDICATED_ACCESS_V01"                    value="PBM_NUM_TYPE_DEDICATED_ACCESS_V01"/>

        <string id="RilNumType.UNKNOWN"                                 value="RIL_ADDRTYPE_UNKNOWN" />
        <string id="RilNumType.INTERNATIONAL"                           value="RIL_ADDRTYPE_INTERNATIONAL" />
        <string id="RilNumType.NATIONAL"                                value="RIL_ADDRTYPE_NATIONAL" />
        <string id="RilNumType.NETWKSPECIFIC"                           value="RIL_ADDRTYPE_NETWKSPECIFIC" />
        <string id="RilNumType.SUBSCRIBER"                              value="RIL_ADDRTYPE_SUBSCRIBER" />
        <string id="RilNumType.ALPHANUM"                                value="RIL_ADDRTYPE_ALPHANUM" />
        <string id="RilNumType.ABBREV"                                  value="RIL_ADDRTYPE_ABBREV" />
        <string id="RilNumType.IP"                                      value="RIL_ADDRTYPE_IP" />
        <string id="RilNumType.EMAIL"                                   value="RIL_ADDRTYPE_EMAIL" />

        <string id="PbmNumPlan.UNKNOWN_V01"                             value="PBM_NUM_PLAN_UNKNOWN_V01" />
        <string id="PbmNumPlan.ISDN_V01"                                value="PBM_NUM_PLAN_ISDN_V01" />
        <string id="PbmNumPlan.DATA_V01"                                value="PBM_NUM_PLAN_DATA_V01" />
        <string id="PbmNumPlan.TELEX_V01"                               value="PBM_NUM_PLAN_TELEX_V01" />
        <string id="PbmNumPlan.NATIONAL_V01"                            value="PBM_NUM_PLAN_NATIONAL_V01" />
        <string id="PbmNumPlan.PRIVATE_V01"                             value="PBM_NUM_PLAN_PRIVATE_V01" />

        <string id="RilNumPlan.UNKNOWN"                                 value="RIL_NUMPLAN_UNKNOWN" />
        <string id="RilNumPlan.TELEPHONE"                               value="RIL_NUMPLAN_TELEPHONE" />
        <string id="RilNumPlan.DATA"                                    value="RIL_NUMPLAN_DATA" />
        <string id="RilNumPlan.TELEX"                                   value="RIL_NUMPLAN_TELEX" />
        <string id="RilNumPlan.NATIONAL"                                value="RIL_NUMPLAN_NATIONAL" />
        <string id="RilNumPlan.PRIVATE"                                 value="RIL_NUMPLAN_PRIVATE" />
        <string id="RilNumPlan.ERMES"                                   value="RIL_NUMPLAN_ERMES" />

        <string id="PBInfoParamMask.USED"                               value="RIL_PARAM_PBI_USED" />
        <string id="PBInfoParamMask.TOTAL"                              value="RIL_PARAM_PBI_TOTAL" />
        <string id="PBInfoParamMask.ADDRESSLENGTH"                      value="RIL_PARAM_PBI_ADDRESSLENGTH" />
        <string id="PBInfoParamMask.TEXTLENGTH"                         value="RIL_PARAM_PBI_TEXTLENGTH" />
        <string id="PBInfoParamMask.MAXANR"                             value="RIL_PARAM_PBI_MAXANR" />
        <string id="PBInfoParamMask.MAXANRLENGTH"                       value="RIL_PARAM_PBI_MAXANRLENGTH" />
        <string id="PBInfoParamMask.MAXAASTEXTLENGTH"                   value="RIL_PARAM_PBI_MAXAASTEXTLENGTH" />
        <string id="PBInfoParamMask.USEDAAS"                            value="RIL_PARAM_PBI_USEDAAS" />
        <string id="PBInfoParamMask.TOTALAAS"                           value="RIL_PARAM_PBI_TOTALAAS" />
        <string id="PBInfoParamMask.MAXEMAILS"                          value="RIL_PARAM_PBI_MAXEMAILS" />
        <string id="PBInfoParamMask.MAXEMAILLENGTH"                     value="RIL_PARAM_PBI_MAXEMAILLENGTH" />
        <string id="PBInfoParamMask.MAXGROUPS"                          value="RIL_PARAM_PBI_MAXGROUPS" />
        <string id="PBInfoParamMask.MAXGASLENGTH"                       value="RIL_PARAM_PBI_MAXGASLENGTH" />
        <string id="PBInfoParamMask.USEDGAS"                            value="RIL_PARAM_PBI_USEDGAS" />
        <string id="PBInfoParamMask.TOTALGAS"                           value="RIL_PARAM_PBI_TOTALGAS" />
        <string id="PBInfoParamMask.MAXSNELENGTH"                       value="RIL_PARAM_PBI_MAXSNELENGTH" />
        <string id="PBInfoParamMask.ALL"                                value="RIL_PARAM_PBI_ALL" />

        <string id="PbmAASOperationEnum.ADD_V01"                        value="PBM_AAS_OPERATION_ADD_V01" />
        <string id="PbmAASOperationEnum.MODIFY_V01"                     value="PBM_AAS_OPERATION_MODIFY_V01" />
        <string id="PbmAASOperationEnum.DELETE_V01"                     value="PBM_AAS_OPERATION_DELETE_V01" />

        <string id="RilPBAnsOperation.ANSADDED"                         value="RIL_PHONEBOOK_ANSADDED" />
        <string id="RilPBAnsOperation.ANSMODIFIED"                      value="RIL_PHONEBOOK_ANSMODIFIED" />
        <string id="RilPBAnsOperation.ANSDELETED"                       value="RIL_PHONEBOOK_ANSDELETED" />

        <string id="UimRefreshMode.RESET_V01"                           value="UIM_REFRESH_MODE_RESET_V01" />
        <string id="UimRefreshMode.INIT_V01"                            value="UIM_REFRESH_MODE_INIT_V01" />
        <string id="UimRefreshMode.INIT_FCN_V01"                        value="UIM_REFRESH_MODE_INIT_FCN_V01" />
        <string id="UimRefreshMode.FCN_V01"                             value="UIM_REFRESH_MODE_FCN_V01" />
        <string id="UimRefreshMode.INIT_FULL_FCN_V01"                   value="UIM_REFRESH_MODE_INIT_FULL_FCN_V01" />
        <string id="UimRefreshMode.APP_RESET_V01"                       value="UIM_REFRESH_MODE_APP_RESET_V01" />
        <string id="UimRefreshMode.3G_RESET_V01"                        value="UIM_REFRESH_MODE_3G_RESET_V01" />

        <string id="UimRefreshStage.WAIT_FOR_OK_V01"                    value="UIM_REFRESH_STAGE_WAIT_FOR_OK_V01" />
        <string id="UimRefreshStage.START_V01"                          value="UIM_REFRESH_STAGE_START_V01" />
        <string id="UimRefreshStage.END_WITH_SUCCESS_V01"               value="UIM_REFRESH_STAGE_END_WITH_SUCCESS_V01" />
        <string id="UimRefreshStage.END_WITH_FAILURE_V01"               value="UIM_REFRESH_STAGE_END_WITH_FAILURE_V01" />

        <string id="RilUiccAppDataChange.MSISDN"                        value="RIL_UICCAPP_DATACHANGE_MSISDN" />
        <string id="RilUiccAppDataChange.MBDN"                          value="RIL_UICCAPP_DATACHANGE_MBDN" />
        <string id="RilUiccAppDataChange.EF_CSP_PLMN_UNSET"             value="RIL_UICCAPP_DATACHANGE_EF_CSP_PLMN_UNSET" />
        <string id="RilUiccAppDataChange.EF_CSP_PLMN_SET"               value="RIL_UICCAPP_DATACHANGE_EF_CSP_PLMN_SET" />
        <string id="RilUiccAppDataChange.ESNME"                         value="RIL_UICCAPP_DATACHANGE_ESNME" />

        <string id="APPersoNotificationMsgEnum.PersoCheckState"         value="PersoCheckState" />
        <string id="APPersoNotificationMsgEnum.DePersoState"            value="DePersoState" />

        <string id="SMSFormat.3GPP"                                     value="RIL_SMSFORMAT_3GPP" />
        <string id="SMSFormat.3GPP2"                                    value="RIL_SMSFORMAT_3GPP2" />

        <string id="RilMsgEncoding.7BITASCII"                           value="RIL_MSGCODING_7BITASCII" />
        <string id="RilMsgEncoding.UNICODE"                             value="RIL_MSGCODING_UNICODE" />
        <string id="RilMsgEncoding.7BITGSM"                             value="RIL_MSGCODING_7BITGSM" />
        <string id="RilMsgEncoding.8BITGSM"                             value="RIL_MSGCODING_8BITGSM" />
        <string id="RilMsgEncoding.OCTET"                               value="RIL_MSGCODING_OCTET" />
        <string id="RilMsgEncoding.IA5"                                 value="RIL_MSGCODING_IA5" />

        <string id="RilMsgPriority.NORMAL"                              value="RIL_MSGPRIORITY_NORMAL" />
        <string id="RilMsgPriority.HIGH"                                value="RIL_MSGPRIORITY_HIGH" />
        <string id="RilMsgPriority.URGENT"                              value="RIL_MSGPRIORITY_URGENT" />
        <string id="RilMsgPriority.EMERGENCY"                           value="RIL_MSGPRIORITY_EMERGENCY" />

        <string id="RilMsgPrivacy.NOTRESTRICTED"                        value="RIL_MSGPRIVACYCLASS_NOTRESTRICTED" />
        <string id="RilMsgPrivacy.RESTRICTED"                           value="RIL_MSGPRIVACYCLASS_RESTRICTED" />
        <string id="RilMsgPrivacy.CONFIDENTIAL"                         value="RIL_MSGPRIVACYCLASS_CONFIDENTIAL" />
        <string id="RilMsgPrivacy.SECRET"                               value="RIL_MSGPRIVACYCLASS_SECRET" />

        <string id="WmsTeleservice.CMT_91"                              value="TELESERVICE_CMT_91" />
        <string id="WmsTeleservice.CPT_95"                              value="TELESERVICE_CPT_95" />
        <string id="WmsTeleservice.CMT_95"                              value="TELESERVICE_CMT_95" />
        <string id="WmsTeleservice.VMN_95"                              value="TELESERVICE_VMN_95" />
        <string id="WmsTeleservice.WAP"                                 value="TELESERVICE_WAP" />
        <string id="WmsTeleservice.WEMT"                                value="TELESERVICE_WEMT" />
        <string id="WmsTeleservice.SCPT"                                value="TELESERVICE_SCPT" />
        <string id="WmsTeleservice.CATPT"                               value="TELESERVICE_CATPT" />
        <string id="WmsTeleservice.GSM1x_01"                            value="TELESERVICE_GSM1x_01" />
        <string id="WmsTeleservice.GSM1x_02"                            value="TELESERVICE_GSM1x_02" />
        <string id="WmsTeleservice.GSM1x_03"                            value="TELESERVICE_GSM1x_03" />
        <string id="WmsTeleservice.GSM1x_04"                            value="TELESERVICE_GSM1x_04" />
        <string id="WmsTeleservice.GSM1x_05"                            value="TELESERVICE_GSM1x_05" />
        <string id="WmsTeleservice.GSM1x_06"                            value="TELESERVICE_GSM1x_06" />
        <string id="WmsTeleservice.GSM1x_07"                            value="TELESERVICE_GSM1x_07" />
        <string id="WmsTeleservice.GSM1x_08"                            value="TELESERVICE_GSM1x_08" />
        <string id="WmsTeleservice.GSM1x_09"                            value="TELESERVICE_GSM1x_09" />
        <string id="WmsTeleservice.GSM1x_10"                            value="TELESERVICE_GSM1x_10" />
        <string id="WmsTeleservice.IMSST"                               value="TELESERVICE_IMSST" />
        <string id="WmsTeleservice.SELFREG"                             value="TELESERVICE_SELFREG" />
        <string id="WmsTeleservice.IS91_PAGE"                           value="TELESERVICE_IS91_PAGE" />
        <string id="WmsTeleservice.IS91_VOICE_MAIL"                     value="TELESERVICE_IS91_VOICE_MAIL" />
        <string id="WmsTeleservice.IS91_SHORT_MESSAGE"                  value="TELESERVICE_IS91_SHORT_MESSAGE" />
        <string id="WmsTeleservice.MWI"                                 value="TELESERVICE_MWI" />
        <string id="WmsTeleservice.BROADCAST"                           value="TELESERVICE_BROADCAST" />
        <string id="WmsTeleservice.UNKNOWN"                             value="TELESERVICE_UNKNOWN" />

        <string id="RilMsgDcsIndication.VOICEMAIL"                      value="RIL_DCSINDICATION_VOICEMAIL" />
        <string id="RilMsgDcsIndication.FAX"                            value="RIL_DCSINDICATION_FAX" />
        <string id="RilMsgDcsIndication.EMAIL"                          value="RIL_DCSINDICATION_EMAIL" />
        <string id="RilMsgDcsIndication.OTHER"                          value="RIL_DCSINDICATION_OTHER" />

        <string id="RilMsgDcsMsgClass.MSGCLASS_0"                       value="RIL_DCSMSGCLASS_0" />
        <string id="RilMsgDcsMsgClass.MSGCLASS_1"                       value="RIL_DCSMSGCLASS_1" />
        <string id="RilMsgDcsMsgClass.MSGCLASS_2"                       value="RIL_DCSMSGCLASS_2" />
        <string id="RilMsgDcsMsgClass.MSGCLASS_3"                       value="RIL_DCSMSGCLASS_3" />

        <string id="RilMsgDcsType.GENERAL"                              value="RIL_DCSTYPE_GENERAL" />
        <string id="RilMsgDcsType.MSGWAIT"                              value="RIL_DCSTYPE_MSGWAIT" />
        <string id="RilMsgDcsType.MSGCLASS"                             value="RIL_DCSTYPE_MSGCLASS" />
        <string id="RilMsgDcsType.LANGUAGE"                             value="RIL_DCSTYPE_LANGUAGE" />

        <string id="RilMsgVPFormat.NONE"                                value="RIL_MSGVP_NONE" />
        <string id="RilMsgVPFormat.RELATIVE"                            value="RIL_MSGVP_RELATIVE" />
        <string id="RilMsgVPFormat.ENHANCED"                            value="RIL_MSGVP_ENHANCED" />
        <string id="RilMsgVPFormat.ABSOLUTE"                            value="RIL_MSGVP_ABSOLUTE" />

        <string id="RilSubAddrType.NSAP"                                value="RIL_SUBADDRTYPE_NSAP" />
        <string id="RilSubAddrType.USER"                                value="RIL_SUBADDRTYPE_USER" />

        <string id="WmsSubAddrType.NSAP"                                value="SUBADDRESS_NSAP" />
        <string id="WmsSubAddrType.USER_SPECIFIED"                      value="SUBADDRESS_USER_SPECIFIED" />
        <string id="WmsSubAddrType.UNKNOWN"                             value="SUBADDRESS_UNKNOWN" />

        <string id="WmsMessageMode.CDMA"                                value="MESSAGE_MODE_CDMA" />
        <string id="WmsMessageMode.GW"                                  value="MESSAGE_MODE_GW" />

        <string id="SourceType.QMI"                                     value="SourceTypeQMI" />
        <string id="SourceType.APPerso"                                 value="SourceTypeAPPerso" />

        <string id="QmiWMSMessageReq.ResetReq"                          value="QMI_WMS_RESET_REQ_V01" />
        <string id="QmiWMSMessageReq.SetEventReportReq"                 value="QMI_WMS_SET_EVENT_REPORT_REQ_V01" />
        <string id="QmiWMSMessageReq.RawSendReq"                        value="QMI_WMS_RAW_SEND_REQ_V01" />
        <string id="QmiWMSMessageReq.RawWriteReq"                       value="QMI_WMS_RAW_WRITE_REQ_V01" />
        <string id="QmiWMSMessageReq.RawReadReq"                        value="QMI_WMS_RAW_READ_REQ_V01" />
        <string id="QmiWMSMessageReq.ModifyTagReq"                      value="QMI_WMS_MODIFY_TAG_REQ_V01" />
        <string id="QmiWMSMessageReq.DeleteReq"                         value="QMI_WMS_DELETE_REQ_V01" />
        <string id="QmiWMSMessageReq.GetMsgProtocolReq"                 value="QMI_WMS_GET_MESSAGE_PROTOCOL_REQ_V01" />
        <string id="QmiWMSMessageReq.ListMsgsReq"                       value="QMI_WMS_LIST_MESSAGES_REQ_V01" />
        <string id="QmiWMSMessageReq.SetRoutesReq"                      value="QMI_WMS_SET_ROUTES_REQ_V01" />
        <string id="QmiWMSMessageReq.GetRoutesReq"                      value="QMI_WMS_GET_ROUTES_REQ_V01" />
        <string id="QmiWMSMessageReq.GetSMSCAddrReq"                    value="QMI_WMS_GET_SMSC_ADDRESS_REQ_V01" />
        <string id="QmiWMSMessageReq.SetSMSCAddrReq"                    value="QMI_WMS_SET_SMSC_ADDRESS_REQ_V01" />
        <string id="QmiWMSMessageReq.GetStoreMaxSizeReq"                value="QMI_WMS_GET_STORE_MAX_SIZE_REQ_V01" />
        <string id="QmiWMSMessageReq.SendAckReq"                        value="QMI_WMS_SEND_ACK_REQ_V01" />
        <string id="QmiWMSMessageReq.SetRetryPeriodReq"                 value="QMI_WMS_SET_RETRY_PERIOD_REQ_V01" />
        <string id="QmiWMSMessageReq.SetRetryIntervalReq"               value="QMI_WMS_SET_RETRY_INTERVAL_REQ_V01" />
        <string id="QmiWMSMessageReq.SetDCDisconnectTimerReq"           value="QMI_WMS_SET_DC_DISCONNECT_TIMER_REQ_V01" />
        <string id="QmiWMSMessageReq.SetMemoryStatusReq"                value="QMI_WMS_SET_MEMORY_STATUS_REQ_V01" />
        <string id="QmiWMSMessageReq.SetBCActivationReq"                value="QMI_WMS_SET_BROADCAST_ACTIVATION_REQ_V01" />
        <string id="QmiWMSMessageReq.SetBCConfigReq"                    value="QMI_WMS_SET_BROADCAST_CONFIG_REQ_V01" />
        <string id="QmiWMSMessageReq.GetBCConfigReq"                    value="QMI_WMS_GET_BROADCAST_CONFIG_REQ_V01" />
        <string id="QmiWMSMessageReq.GetDomainPrefReq"                  value="QMI_WMS_GET_DOMAIN_PREF_REQ_V01" />
        <string id="QmiWMSMessageReq.SetDomainPrefReq"                  value="QMI_WMS_SET_DOMAIN_PREF_REQ_V01" />
        <string id="QmiWMSMessageReq.SendFromMemStoreReq"               value="QMI_WMS_SEND_FROM_MEM_STORE_REQ_V01" />
        <string id="QmiWMSMessageReq.GetMsgWaitingReq"                  value="QMI_WMS_GET_MESSAGE_WAITING_REQ_V01" />
        <string id="QmiWMSMessageReq.SetPrimaryClientReq"               value="QMI_WMS_SET_PRIMARY_CLIENT_REQ_V01" />
        <string id="QmiWMSMessageReq.IndRegReq"                         value="QMI_WMS_INDICATION_REGISTER_REQ_V01" />
        <string id="QmiWMSMessageReq.GetTLInfoReq"                      value="QMI_WMS_GET_TRANSPORT_LAYER_INFO_REQ_V01" />
        <string id="QmiWMSMessageReq.GetTransportNWRegInfoReq"          value="QMI_WMS_GET_TRANSPORT_NW_REG_INFO_REQ_V01" />
        <string id="QmiWMSMessageReq.BindSubscriptionReq"               value="QMI_WMS_BIND_SUBSCRIPTION_REQ_V01" />
        <string id="QmiWMSMessageReq.GetIndRegReq"                      value="QMI_WMS_GET_INDICATION_REGISTER_REQ_V01" />
        <string id="QmiWMSMessageReq.GetSMSParamsReq"                   value="QMI_WMS_GET_SMS_PARAMETERS_REQ_V01" />
        <string id="QmiWMSMessageReq.SetSMSParamsReq"                   value="QMI_WMS_SET_SMS_PARAMETERS_REQ_V01" />

        <string id="QmiWMSMessageResp.ResetResp"                        value="QMI_WMS_RESET_RESP_V01" />
        <string id="QmiWMSMessageResp.SetEventReportResp"               value="QMI_WMS_SET_EVENT_REPORT_RESP_V01" />
        <string id="QmiWMSMessageResp.RawSendResp"                      value="QMI_WMS_RAW_SEND_RESP_V01" />
        <string id="QmiWMSMessageResp.RawWriteResp"                     value="QMI_WMS_RAW_WRITE_RESP_V01" />
        <string id="QmiWMSMessageResp.RawReadResp"                      value="QMI_WMS_RAW_READ_RESP_V01" />
        <string id="QmiWMSMessageResp.ModifyTagResp"                    value="QMI_WMS_MODIFY_TAG_RESP_V01" />
        <string id="QmiWMSMessageResp.DeleteResp"                       value="QMI_WMS_DELETE_RESP_V01" />
        <string id="QmiWMSMessageResp.GetMsgProtocolResp"               value="QMI_WMS_GET_MESSAGE_PROTOCOL_RESP_V01" />
        <string id="QmiWMSMessageResp.ListMsgsResp"                     value="QMI_WMS_LIST_MESSAGES_RESP_V01" />
        <string id="QmiWMSMessageResp.SetRoutesResp"                    value="QMI_WMS_SET_ROUTES_RESP_V01" />
        <string id="QmiWMSMessageResp.GetRoutesResp"                    value="QMI_WMS_GET_ROUTES_RESP_V01" />
        <string id="QmiWMSMessageResp.GetSMSCAddrResp"                  value="QMI_WMS_GET_SMSC_ADDRESS_RESP_V01" />
        <string id="QmiWMSMessageResp.SetSMSCAddrResp"                  value="QMI_WMS_SET_SMSC_ADDRESS_RESP_V01" />
        <string id="QmiWMSMessageResp.GetStoreMaxSizeResp"              value="QMI_WMS_GET_STORE_MAX_SIZE_RESP_V01" />
        <string id="QmiWMSMessageResp.SendAckResp"                      value="QMI_WMS_SEND_ACK_RESP_V01" />
        <string id="QmiWMSMessageResp.SetRetryPeriodResp"               value="QMI_WMS_SET_RETRY_PERIOD_RESP_V01" />
        <string id="QmiWMSMessageResp.SetRetryIntervalResp"             value="QMI_WMS_SET_RETRY_INTERVAL_RESP_V01" />
        <string id="QmiWMSMessageResp.SetDCDisconnectTimerResp"         value="QMI_WMS_SET_DC_DISCONNECT_TIMER_RESP_V01" />
        <string id="QmiWMSMessageResp.SetMemoryStatusResp"              value="QMI_WMS_SET_MEMORY_STATUS_RESP_V01" />
        <string id="QmiWMSMessageResp.SetBCActivationResp"              value="QMI_WMS_SET_BROADCAST_ACTIVATION_RESP_V01" />
        <string id="QmiWMSMessageResp.SetBCConfigResp"                  value="QMI_WMS_SET_BROADCAST_CONFIG_RESP_V01" />
        <string id="QmiWMSMessageResp.GetBCConfigResp"                  value="QMI_WMS_GET_BROADCAST_CONFIG_RESP_V01" />
        <string id="QmiWMSMessageResp.GetDomainPrefResp"                value="QMI_WMS_GET_DOMAIN_PREF_RESP_V01" />
        <string id="QmiWMSMessageResp.SetDomainPrefResp"                value="QMI_WMS_SET_DOMAIN_PREF_RESP_V01" />
        <string id="QmiWMSMessageResp.SendFromMemStoreResp"             value="QMI_WMS_SEND_FROM_MEM_STORE_RESP_V01" />
        <string id="QmiWMSMessageResp.GetMsgWaitingResp"                value="QMI_WMS_GET_MESSAGE_WAITING_RESP_V01" />
        <string id="QmiWMSMessageResp.SetPrimaryClientResp"             value="QMI_WMS_SET_PRIMARY_CLIENT_RESP_V01" />
        <string id="QmiWMSMessageResp.IndRegResp"                       value="QMI_WMS_INDICATION_REGISTER_RESP_V01" />
        <string id="QmiWMSMessageResp.GetTLInfoResp"                    value="QMI_WMS_GET_TRANSPORT_LAYER_INFO_RESP_V01" />
        <string id="QmiWMSMessageResp.GetTransportNWRegInfoResp"        value="QMI_WMS_GET_TRANSPORT_NW_REG_INFO_RESP_V01" />
        <string id="QmiWMSMessageResp.BindSubscriptionResp"             value="QMI_WMS_BIND_SUBSCRIPTION_RESP_V01" />
        <string id="QmiWMSMessageResp.GetIndRegResp"                    value="QMI_WMS_GET_INDICATION_REGISTER_RESP_V01" />
        <string id="QmiWMSMessageResp.GetSMSParamsResp"                 value="QMI_WMS_GET_SMS_PARAMETERS_RESP_V01" />
        <string id="QmiWMSMessageResp.SetSMSParamsResp"                 value="QMI_WMS_SET_SMS_PARAMETERS_RESP_V01" />

        <string id="QmiServiceType.QMIDMSService"                       value="QMI DMS" />
        <string id="QmiServiceType.QMINASService"                       value="QMI NAS" />
        <string id="QmiServiceType.QMIWMSService"                       value="QMI WMS" />
        <string id="QmiServiceType.QMIVoiceService"                     value="QMI Voice" />
        <string id="QmiServiceType.QMICATService"                       value="QMI CAT" />
        <string id="QmiServiceType.QMIUIMService"                       value="QMI UIM" />
        <string id="QmiServiceType.QMIPBMService"                       value="QMI PBM" />
        <string id="QmiServiceType.QMISARService"                       value="QMI SAR" />
        <string id="QmiServiceType.QMIIMSService"                       value="QMI IMS" />

        <string id="QmiNasServiceStatus.NoService"                      value="No Service" />
        <string id="QmiNasServiceStatus.Limited"                        value="Limited Service" />
        <string id="QmiNasServiceStatus.ServiceAvailable"               value="Service Available" />
        <string id="QmiNasServiceStatus.LimitedRegional"                value="Limited Regional" />
        <string id="QmiNasServiceStatus.PowerSave"                      value="Power Save" />

        <string id="QmiNasPreferredDataPath.NotPreferred"               value="Not Preferred" />
        <string id="QmiNasPreferredDataPath.Preferred"                  value="Preferred" />

        <string id="QmiNasServiceDomain.NoService"                      value="No Service" />
        <string id="QmiNasServiceDomain.CSOnly"                         value="CS Only" />
        <string id="QmiNasServiceDomain.PSOnly"                         value="PS Only" />
        <string id="QmiNasServiceDomain.CSPS"                           value="CS PS" />
        <string id="QmiNasServiceDomain.Camped"                         value="Camped" />

        <string id="QmiNasRoamStatus.Off"                               value="Off" />
        <string id="QmiNasRoamStatus.On"                                value="On" />
        <string id="QmiNasRoamStatus.Blink"                             value="Blink" />
        <string id="QmiNasRoamStatus.OutOfNeighborhood"                 value="Out Of Neighborhood" />
        <string id="QmiNasRoamStatus.OutOfBuilding"                     value="Out Of Building" />
        <string id="QmiNasRoamStatus.PrefSys"                           value="Preferred System" />
        <string id="QmiNasRoamStatus.AvailSys"                          value="Available System" />
        <string id="QmiNasRoamStatus.AlliancePartner"                   value="Alliance Partner" />
        <string id="QmiNasRoamStatus.PremiumPartner"                    value="Premium Partner" />
        <string id="QmiNasRoamStatus.FullService"                       value="Full Service" />
        <string id="QmiNasRoamStatus.PartialService"                    value="Partial Service" />
        <string id="QmiNasRoamStatus.BannerOn"                          value="Banner On" />
        <string id="QmiNasRoamStatus.BannerOff"                         value="Banner Off" />

        <string id="QmiNasHdrActiveProtocol.None"                       value="None" />
        <string id="QmiNasHdrActiveProtocol.Rel0"                       value="Rel 0" />
        <string id="QmiNasHdrActiveProtocol.RelA"                       value="Rel A" />
        <string id="QmiNasHdrActiveProtocol.RelB"                       value="Rel B" />

        <string id="QmiNasHsCallStatus.HsdpaHsupaUnsupported"                value="HSDPA and HSUPA are unsupported" />
        <string id="QmiNasHsCallStatus.HsdpaSupported"                       value="HSDPA is supported" />
        <string id="QmiNasHsCallStatus.HsupaSupported"                       value="HSUPA is supported" />
        <string id="QmiNasHsCallStatus.HsdpaHsupaSupported"                  value="HSDPA and HSUPA are supported" />
        <string id="QmiNasHsCallStatus.HsdpaPlusSupported"                   value="HSDPA+ is supported" />
        <string id="QmiNasHsCallStatus.HsdpaPlusHsupaSupported"              value="HSDPA+ and HSUPA are supported" />
        <string id="QmiNasHsCallStatus.DualCellHsdpaPlusSupported"           value="Dual-cell HSDPA+ is supported" />
        <string id="QmiNasHsCallStatus.DualCellHsdpaPlusHsupaSupported"      value="Dual-cell HSDPA+ and HSUPA are supported" />
        <string id="QmiNasHsCallStatus.DualCellHsdpaPlus64QamHsupaSupported" value="Dual-cell HSDPA+, 64 QAM, and HSUPA are supported" />
        <string id="QmiNasHsCallStatus.DualCellHsdpaPlus64QamSupported"      value="Dual-cell HSDPA+, 64 QAM, are supported" />

        <string id="QmiWMSMessageInd.EventReportInd"                    value="QMI_WMS_EVENT_REPORT_IND_V01" />
        <string id="QmiWMSMessageInd.MemFullInd"                        value="QMI_WMS_MEMORY_FULL_IND_V01" />
        <string id="QmiWMSMessageInd.MessageWaitingInd"                 value="QMI_WMS_MESSAGE_WAITING_IND_V01" />
        <string id="QmiWMSMessageInd.SMSCAddrInd"                       value="QMI_WMS_SMSC_ADDRESS_IND_V01" />
        <string id="QmiWMSMessageInd.TLInfoInd"                         value="QMI_WMS_TRANSPORT_LAYER_INFO_IND_V01" />
        <string id="QmiWMSMessageInd.NWRegInfoInd"                      value="QMI_WMS_TRANSPORT_NW_REG_INFO_IND_V01" />
        <string id="QmiWMSMessageInd.CallStatusInd"                     value="QMI_WMS_CALL_STATUS_IND_V01" />

        <string id="WmsMessageFormat.CDMA"                              value="WMS_MESSAGE_FORMAT_CDMA_V01" />
        <string id="WmsMessageFormat.GWPP"                              value="WMS_MESSAGE_FORMAT_GW_PP_V01" />
        <string id="WmsMessageFormat.GWBC"                              value="WMS_MESSAGE_FORMAT_GW_BC_V01" />
        <string id="WmsMessageFormat.MWI"                               value="WMS_MESSAGE_FORMAT_MWI_V01" />

        <string id="GeoScope.NONE"                                      value="RIL_GEOSCOPE_NONE" />
        <string id="GeoScope.CELL_IMMEDIATE"                            value="RIL_GEOSCOPE_CELL_IMMEDIATE" />
        <string id="GeoScope.LOCATIONAREA"                              value="RIL_GEOSCOPE_LOCATIONAREA" />
        <string id="GeoScope.PLMN"                                      value="RIL_GEOSCOPE_PLMN" />
        <string id="GeoScope.CELL"                                      value="RIL_GEOSCOPE_CELL" />

        <string id="TLParamID.TeleserviceID"                            value="TL_TELESERVICE_ID" />
        <string id="TLParamID.BCSrvCategory"                            value="TL_BC_SRV_CATEGORY" />
        <string id="TLParamID.OrigAddr"                                 value="TL_ORIG_ADDRESS" />
        <string id="TLParamID.OrigSubAddr"                              value="TL_ORIG_SUBADDRESS" />
        <string id="TLParamID.DestAddr"                                 value="TL_DEST_ADDRESS" />
        <string id="TLParamID.DestSubAddr"                              value="TL_DEST_SUBADDRESS" />
        <string id="TLParamID.BearerReplyOption"                        value="TL_BEARER_REPLY_OPTION" />
        <string id="TLParamID.CauseCodes"                               value="TL_CAUSE_CODES" />
        <string id="TLParamID.BearerData"                               value="TL_BEARER_DATA" />

        <string id="TLMessageType.PointToPoint"                         value="TL_TYPE_POINT_TO_POINT" />
        <string id="TLMessageType.BroadCast"                            value="TL_TYPE_BROADCAST" />
        <string id="TLMessageType.Ack"                                  value="TL_TYPE_ACK" />

        <string id="BDParamID.BDMsgID"                                  value="BD_MSG_ID" />
        <string id="BDParamID.BDUserData"                               value="BD_USER_DATA" />
        <string id="BDParamID.BDUserResp"                               value="BD_USER_RESP" />
        <string id="BDParamID.BDMCTime"                                 value="BD_MC_TIME" />
        <string id="BDParamID.BDValidityAbs"                            value="BD_VALID_ABS" />
        <string id="BDParamID.BDValidityRel"                            value="BD_VALID_REL" />
        <string id="BDParamID.BDDeliveryAbs"                            value="BD_DEFER_ABS" />
        <string id="BDParamID.BDDeliveryRel"                            value="BD_DEFER_REL" />
        <string id="BDParamID.BDPriority"                               value="BD_PRIORITY" />
        <string id="BDParamID.BDPrivacy"                                value="BD_PRIVACY" />
        <string id="BDParamID.BDReplyOption"                            value="BD_REPLY_OPTION" />
        <string id="BDParamID.BDNumOfMessages"                          value="BD_NUM_OF_MSGS" />
        <string id="BDParamID.BDAlert"                                  value="BD_ALERT" />
        <string id="BDParamID.BDLanguage"                               value="BD_LANGUAGE" />
        <string id="BDParamID.BDCallback"                               value="BD_CALLBACK" />
        <string id="BDParamID.BDDisplayIndex"                           value="BD_DISPLAY_MODE" />
        <string id="BDParamID.BDMultipleUserData"                       value="BD_MULTIPLE_USER_DATA" />
        <string id="BDParamID.BDDepositIndex"                           value="BD_DEPOSIT_INDEX" />
        <string id="BDParamID.BDSCPTData"                               value="BD_SCPT_DATA" />
        <string id="BDParamID.BDSCPTResult"                             value="BD_SCPT_RESULT" />
        <string id="BDParamID.BDDeliveryStatus"                         value="BD_DELIVERY_STATUS" />
        <string id="BDParamID.BDIPAddress"                              value="BD_IP_ADDRESS" />
        <string id="BDParamID.BDRSNNoNotify"                            value="BD_RSN_NO_NOTIFY" />
        <string id="BDParamID.BDESN"                                    value="BD_ESN" />

        <string id="WmsEncoding.OCTET"                                  value="ENCODING_OCTET" />
        <string id="WmsEncoding.IS91EP"                                 value="ENCODING_IS91EP" />
        <string id="WmsEncoding.ASCII"                                  value="ENCODING_ASCII" />
        <string id="WmsEncoding.IA5"                                    value="ENCODING_IA5" />
        <string id="WmsEncoding.UNICODE"                                value="ENCODING_UNICODE" />
        <string id="WmsEncoding.SHIFT_JIS"                              value="ENCODING_SHIFT_JIS" />
        <string id="WmsEncoding.KOREAN"                                 value="ENCODING_KOREAN" />
        <string id="WmsEncoding.LATIN_HEBREW"                           value="ENCODING_LATIN_HEBREW" />
        <string id="WmsEncoding.LATIN"                                  value="ENCODING_LATIN" />
        <string id="WmsEncoding.GSM_7_BIT_DEFAULT"                      value="ENCODING_GSM_7_BIT_DEFAULT" />

        <string id="WmsMsgProtocol.CDMA"                                value="WMS_MESSAGE_PROTOCOL_CDMA_V01" />
        <string id="WmsMsgProtocol.WCDMA"                               value="WMS_MESSAGE_PROTOCOL_WCDMA_V01" />

        <string id="RilWarningType.EARTHQUAKE"                          value="RIL_WARNINGTYPE_EARTHQUAKE" />
        <string id="RilWarningType.TSUNAMI"                             value="RIL_WARNINGTYPE_TSUNAMI" />
        <string id="RilWarningType.EARTHQUAKETSUNAMI"                   value="RIL_WARNINGTYPE_EARTHQUAKETSUNAMI" />
        <string id="RilWarningType.TEST"                                value="RIL_WARNINGTYPE_TEST" />
        <string id="RilWarningType.OTHER"                               value="RIL_WARNINGTYPE_OTHER" />
        <string id="RilWarningType.RESERVED"                            value="RIL_WARNINGTYPE_RESERVED" />

        <string id="WmsETWSNotifType.PRIMARY"                           value="WMS_ETWS_NOTIFICATION_TYPE_PRIMARY_V01" />
        <string id="WmsETWSNotifType.SECONDARY_GSM"                     value="WMS_ETWS_NOTIFICATION_TYPE_SECONDARY_GSM_V01" />
        <string id="WmsETWSNotifType.SECONDARY_UMTS"                    value="WMS_ETWS_NOTIFICATION_TYPE_SECONDARY_UMTS_V01" />

        <string id="UiccServiceEnum.FDN"                                value="RIL_UICCOPERATION_SERVICE_FDN" />
        <string id="UiccServiceEnum.BDN"                                value="RIL_UICCOPERATION_SERVICE_BDN" />
        <string id="UiccServiceEnum.ACL"                                value="RIL_UICCOPERATION_SERVICE_ACL" />

        <string id="UiccServiceStateEnum.NotAvailable"                  value="RIL_UICCSERVICESTATE_NOTAVAILABLE" />
        <string id="UiccServiceStateEnum.Disabled"                      value="RIL_UICCSERVICESTATE_DISABLED" />
        <string id="UiccServiceStateEnum.Enabled"                       value="RIL_UICCSERVICESTATE_ENABLED" />

        <string id="UiccKeyRefEnum.ALW"                                 value="RIL_UICCKEYREF_ALW" />
        <string id="UiccKeyRefEnum.PIN1"                                value="RIL_UICCKEYREF_PIN1" />
        <string id="UiccKeyRefEnum.UPIN"                                value="RIL_UICCKEYREF_UPIN" />
        <string id="UiccKeyRefEnum.PIN2"                                value="RIL_UICCKEYREF_PIN2" />
        <string id="UiccKeyRefEnum.NEV"                                 value="RIL_UICCKEYREF_NEV" />

        <string id="Event.WmRil_ErrorSz"                                value="[WmRil::Error]%1" />
        <string id="Event.WmRil_DriverVersion"                          value="[WmRil::Driver]Version = %1.%2.%3.%4" />
        <string id="Event.WmRil_DriverSendOKResponse"                   value="[WmRil::Driver]SendOKResponse: RIL cmd ID = %1, Payload size = %2" />
        <string id="Event.WmRil_DriverSendErrorResponse"                value="[WmRil::Driver]SendErrorResponse: RIL cmd ID = %1, hr = %2" />
        <string id="Event.WmRil_DriverSendErrorResponseWithCause"       value="[WmRil::Driver]SendErrorResponse: RIL cmd ID = %1, hr = %2, cause = %3" />
        <string id="Event.WmRil_DriverBroadcastNotification"            value="[WmRil::Driver]Broadcasted %1" />
        <string id="Event.WmRil_DriverSendSyncQmiRequest"               value="[WmRil::Driver]Sending Sync QMI request Message %1_REQ" />
        <string id="Event.WmRil_DriverSendAsyncQmiRequest"              value="[WmRil::Driver]Sending Async QMI request Message %1_REQ" />
        <string id="Event.WmRil_DriverQmiIndicationArrived"             value="[WmRil::Driver]QMI indication %1_IND arrived" />
        <string id="Event.WmRil_DriverMssrComplete"                     value="[WmRil::Driver]MSSR Complete" />
        <string id="Event.WmRil_DriverMssrProcessPendingCommand"        value="[WmRil::Driver]MSSR pending command: %1, %2" />
        <string id="Event.WmRil_DriverExecutingCommand"                 value="[WmRil::Driver]Executing command %1" />
        <string id="Event.WmRil_DriverCleanupCommand"                   value="[WmRil::Driver]Command %1 cleaned up" />
        <string id="Event.WmRil_Device"                                 value="[WmRil::Device]%1 : %2" />
        <string id="Event.WmRil_DeviceEquipmentStateGet"                      value="[WmRil::DMS]Device Equipment State currently: %1" />
        <string id="Event.WmRil_DeviceEquipmentState"                         value="[WmRil::DMS]Device Equipment State changing to: %1" />
        <string id="Event.WmRil_DeviceEquipmentStateSameAsCurrent"            value="[WmRil::DMS]Setting Device Equipment State same as current: %1" />
        <string id="Event.WmRil_DeviceEquipmentStateShutdown"                 value="[WmRil::DMS]Entering shutdown state: %1" />
        <string id="Event.WmRil_DeviceEquipmentStateInternalChange"           value="[WmRil::DMS]Received internal Equipment State Changed event: %1" />
        <string id="Event.WmRil_DeviceEquipmentStateInternalPRLInitComplete"  value="[WmRil::DMS]Received internal PRL Init Complete event: %1" />
        <string id="Event.WmRil_DeviceEquipmentStateFromModem"                value="[WmRil::DMS]Device Equipment State from modem: %1" />
        <string id="Event.WmRil_DevicePRLInitCompleted"                       value="[WmRil::DMS]PRL Init completed" />
        <string id="Event.WmRil_DeviceSupportedSystemTypes"                   value="[WmRil::DMS]Supported system types: %1" />
        <string id="Event.WmRil_DeviceRadioType"                              value="[WmRil::DMS]Radio Type: %1" />
        <string id="Event.WmRil_DeviceSystemType"                             value="[WmRil::DMS]System Type: %1" />
        <string id="Event.WmRil_CallSzDw"                               value="[WmRil::Call]%1 : %2" />
        <string id="Event.WmRil_CallSzSz"                               value="[WmRil::Call]%1 : %2" />
        <string id="Event.WmRil_CallQmiVoiceAllCallStatusInd"           value="[WmRil::Call]QMI_VOICE_ALL_CALL_STATUS_IND arrives" />
        <string id="Event.WmRil_CallCallCreated"                        value="[WmRil::Call]%3 Call created." />
        <string id="Event.WmRil_CallCPIBroadcasted"                     value="[WmRil::Call]Broadcasted RIL_NOTIFY_CALLPROGRESSINFO" />
        <string id="Event.WmRil_Call3GPPTone"                           value="[WmRil::Call]3GPP Tone = %1" />
        <string id="Event.WmRil_Call3GPP2Tone"                          value="[WmRil::Call]3GPP2 Tone = %1" />
        <string id="Event.WmRil_NetworkSz"                              value="[WmRil::Network]%1" />
        <string id="Event.WmRil_NetworkSzDw"                            value="[WmRil::Network]%1 : %2" />
        <string id="Event.WmRil_NetworkSzSz"                            value="[WmRil::Network]%1 : %2" />
        <string id="Event.WmRil_NetworkEriUnknown"                      value="[WmRil::Network]ERI Algorithm unknown: %1" />
        <string id="Event.WmRil_NetworkUnknownCharEncoding"             value="[WmRil::Network]Unknown char encoding (%1), no known handler" />
        <string id="Event.WmRil_NetworkRoamIdNotFound"                  value="[WmRil::Network]Roaming Indication Id not found in ERI table: %1" />
        <string id="Event.WmRil_NetworkConfigSigInfoFailed"             value="[WmRil::Network]Config Sig Info didn't complete successfully" />
        <string id="Event.WmRil_NetworkSystemType"                      value="[WmRil::Network]%1 system types (%2)" />
        <string id="Event.WmRil_NetworkRTREControlValue"                value="[WmRil::Network]NetworkServiceClass::IsNVProvisioning: RTRE control value is %1(%2)" />
        <string id="Event.WmRil_NetworkQmiNasSysInfoInd"                value="[WmRil::Network]Received QMI_NAS_SYS_INFO_IND" />
        <string id="Event.WmRil_NetworkQmiNasCommonSysInfo"             value="[WmRil::Network]nas_common_sys_info" />
        <string id="Event.WmRil_NetworkQmiNasCdmaHdrSysInfo"            value="[WmRil::Network]cdma_hdr_sys_info" />
        <string id="Event.WmRil_NetworkQmiNasCdmaSysInfo"               value="[WmRil::Network]cdma_sys_info" />
        <string id="Event.WmRil_NetworkQmiNasHdrSysInfo"                value="[WmRil::Network]hdr_sys_info" />
        <string id="Event.WmRil_NetworkQmiNas3gppSysInfo"               value="[WmRil::Network]3gpp_sys_info" />
        <string id="Event.WmRil_NetworkQmiNasGsmSysInfo"                value="[WmRil::Network]gsm_sys_info" />
        <string id="Event.WmRil_NetworkQmiNasWcdmaSysInfo"              value="[WmRil::Network]wcdma_sys_info" />
        <string id="Event.WmRil_NetworkQmiNasLteSysInfo"                value="[WmRil::Network]lte_sys_info" />
        <string id="Event.WmRil_NetworkQmiNasTdscdmaSysInfo"            value="[WmRil::Network]tdscdma_sys_info" />
        <string id="Event.WmRil_NetworkQmiNasNetworkTimeInd"            value="[WmRil::Network]Received QMI_NAS_NETWORK_TIME_IND" />


        <string id="Event.WmRil_Card"                                   value="[WmRil::Card]%1 : %2" />
        <string id="Event.WmRil_CatSzDw"                                value="[WmRil::CAT]%1 : %2" />
        <string id="Event.WmRil_UimSz"                                  value="[WmRil::UIM]%1" />
        <string id="Event.WmRil_UimSzDw"                                value="[WmRil::UIM]%1 : %2" />

        <string id="Event.WmRil_UimUserAppSelectionAndPersoSelection"   value="[WmRil::UIM]UIMServiceClass::DetectUserAppSelectionAndMPPersoEnabled: User Application Selection = %1 and Perso Selection = %2" />
        <string id="Event.WmRil_UimRegisteredForCardStatusInd"          value="[WmRil::UIM]UIMServiceClass::RegisterForCardStatusIndication: Successfully registered for QMI UIM Card Status Indication" />
        <string id="Event.WmRil_UimAddedCardInfoForSlot"                value="[WmRil::UIM]UIMServiceClass::GetAndParseCardStatus: Added card information for slot %1 in the list of cards" />
        <string id="Event.WmRil_UimAddedVirtualRUIMCardInfoForSlot"     value="[WmRil::UIM]UIMServiceClass::AddVirtualRUIMSlotAndApp: Added virtual RUIM card information for slot %1 in the list of cards" />
        <string id="Event.WmRil_UimPrintAppName"                        value="[WmRil::UIM]ProvisioningApplicationClass::GetAppNameFromQMIAndStore: Application name: %1" />
        <string id="Event.WmRil_UimUiccLockStatusBroadcasted"           value="[WmRil::UIM]ProvisioningApplicationClass::CompareAppInfoToSendSecurityNotification: Broadcasted RIL_NOTIFY_UICCLOCKSTATUS: hUiccApp: %1; dwKeyRef: %2; Old PIN State: %3; New PIN State: %4; Old PIN Retires: %5; New PIN retires: %6 Old PUK retires: %7; New PUK retires: %8" />
        <string id="Event.WmRil_UimUiccAppPersoStatusBroadcasted"       value="[WmRil::UIM]ProvisioningApplicationClass::CompareAppInfoToSendSecurityNotification: Broadcasted RIL_NOTIFY_UICCAPPPERSOCHECKSTATUS: hUiccApp: %1; Old Perso Check State %2; New Perso Check State %3; Old Failing Perso Feature %4, New Failing Perso Feature %5" />

        <string id="Event.WmRil_UimCardStatus_CARDSTATUS_AppIndexInfo"             value="[WmRil::UIM]UIMServiceClass::PrintQMICardStatus: Primary GW app (card+appindex) = %1, Primary 1X app (card+appindex) = %2, Secondary GW app (card+appindex) = %3, Secondary 1X app (card+appindex) = %4" />
        <string id="Event.WmRil_UimCardStatus_CARDSTATUS_CardInfoLen"              value="[WmRil::UIM]UIMServiceClass::PrintQMICardStatus: card_info_len %1" />
        <string id="Event.WmRil_UimCardStatus_CARDSTATUS_CardIndex"                value="[WmRil::UIM]UIMServiceClass::PrintQMICardStatus: card Slot Number = %1" />
        <string id="Event.WmRil_UimCardStatus_CARDINFO_CardState_CardError"        value="[WmRil::UIM]UIMServiceClass::PrintQMICardStatus: card_state %1, error_code %2" />
        <string id="Event.WmRil_UimCardStatus_CARDINFO_Upin"            value="[WmRil::UIM]UIMServiceClass::PrintQMICardStatus: upin info: %1" />
        <string id="Event.WmRil_UimCardStatus_APPINFO_Len"              value="[WmRil::UIM]UIMServiceClass::PrintQMICardStatus: app_info_len %1" />
        <string id="Event.WmRil_UimCardStatus_APPINFO_AppType_AppState_PersoState_PersoFeature_PersoRetries_PersoUnblockRetires"             value="[WmRil::UIM]UIMServiceClass::PrintQMICardStatus: app[%1], app_type %2(%3), app_state %4(%5), perso_state %6(%7), perso_feature %8(%9), perso_retries %10, perso_unblock_retries %11" />
        <string id="Event.WmRil_UimCardStatus_APPINFO_Aid"               value="[WmRil::UIM]UIMServiceClass::PrintQMICardStatus:  aid: %1" />
        <string id="Event.WmRil_UimCardStatus_APPINFO_UPINState_PIN1Info_PIN2Info"               value="[WmRil::UIM]UIMServiceClass::PrintQMICardStatus: univ_pin: %1(%2); pin1 state: %3(%4), pin1 pin retries: %5, pin1 puk state: %6; pin2 state: %7(%8), pin2 pin retries: %9, pin2 puk state: %10" />

        <string id="Event.WmRil_UimSetExecutorConfig_InputParams_hUiccApps"        value="[WmRil::UIM]SetExecutorConfigBaseClass::ValidateAndInitParams: SetExecutorConfig input parameters: dwExecutor = %1, NumApps = %2, hUiccApps[0] = %3, hUiccApps[1] = %4" />
        <string id="Event.WmRil_UimUnbinding_Starts"               value="[WmRil::Uim]SetExecutorConfigBaseClass::Execute: Unbinding Starts" />
        <string id="Event.WmRil_UimBinding_Starts"                 value="[WmRil::Uim]SetExecutorConfigBaseClass::Execute: Binding Starts" />
        <string id="Event.WmRil_UimRadio_NewBindingInfo"           value="[WmRil::Uim]SetExecutorConfigBaseClass::ValidateOnSingleRadioType: %1 radio type: New binding 0 with hUiccApp %2 and Session type %3(%4)" />
        <string id="Event.WmRil_UimNewBindingInfo"                 value="[WmRil::Uim]SetExecutorConfigBaseClass::ValidateOnMm1xCSFBSvLTERadioType: MM/1xCSFB/SVLTE radio type: New binding %1" />
        <string id="Event.WmRil_UimOldBinding"                     value="[WmRil::Uim]SetExecutorConfigBaseClass::RetrieveOldBinding: Old binding %1 with hUiccApp %2 and Session type %3(%4)" />
        <string id="Event.WmRil_UimOldVirtualBinding"              value="[WmRil::Uim]SetExecutorConfigBaseClass::RetrieveOldBinding: Old virtual RUIM binding %1 with hUiccApp %2" />
        <string id="Event.WmRil_UIMBindingIndex_IoctlState_hUiccApp"     value="[WmRil::Uim]%1 Current binding index %2, m_state = %3(%4)" />
        <string id="Event.WmRil_UimProcessInternalInd"             value="[WmRil::Uim]SetExecutorConfigBaseClass::ProcessInternalIndication: Process internal Indication %1(%2)" />
        <string id="Event.WmRil_UimUnbindingConfirmed"             value="[WmRil::Uim]SetExecutorConfigBaseClass::ProcessInternalIndication: Unbinding on hUiccApp %1 is confirmed" />
        <string id="Event.WmRil_UimAppInUnknownState"              value="[WmRil::Uim]SetExecutorConfigBaseClass::ProcessInternalIndication: Application is still in UNKNOWN state" />
        <string id="Event.WmRil_UimBindingConfirmed"               value="[WmRil::Uim]SetExecutorConfigBaseClass::ProcessInternalIndication: Binding on hUiccApp %2 is confirmed; executor = %1, SessionType = %3(%4)" />
        <string id="Event.WmRil_UimSimActivationStart"             value="[WmRil::Uim]SetExecutorConfigBaseClass::ProcessInternalIndication: SIM activation start" />
        <string id="Event.WmRil_UimProcessInternalIndData"         value="[WmRil::Uim]UIMServiceClass::ProcessInternalIndication: Received internal indication %1(%2)" />
        <string id="Event.WmRil_UimSendProvStatus_Started"         value="[WmRil::Uim]UIMServiceClass::ProcessInternalIndication: Send RIL_PROVISIONSTAT_BIP_STARTED" />
        <string id="Event.WmRil_UimUnhandledInternalInd"           value="[WmRil::Uim]UIMServiceClass::ProcessInternalIndication: Unhandled internal indication!" />
        <string id="Event.WmRil_UimIMSI_MProgrammed"               value="[WmRil::Uim]UIMServiceClass::CheckIMSIMProgrammed: CSIM IMSI_M is programmed" />
        <string id="Event.WmRil_UimIMSI_MNotProgrammed"            value="[WmRil::Uim]UIMServiceClass::CheckIMSIMProgrammed: CSIM IMSI_M is NOT programmed" />
        <string id="Event.WmRil_UimMCC_MNC"                        value="[WmRil::Uim]UIMServiceClass::CardIsNonAct4GCardSendProvStatus: MCC MNC string is %1" />
        <string id="Event.WmRil_UimNotVenderSpecificCard"          value="[WmRil::Uim]UIMServiceClass::CardIsNonAct4GCardSendProvStatus: This is NOT vendor specific card" />
        <string id="Event.WmRil_UimVenderSpecificCard"             value="[WmRil::Uim]UIMServiceClass::CardIsNonAct4GCardSendProvStatus: This is vendor specific card" />
        <string id="Event.WmRil_Uim4GCard"                         value="[WmRil::Uim]UIMServiceClass::CardIsNonAct4GCardSendProvStatus: This is the 4G card" />
        <string id="Event.WmRil_UimNot4GCard"                      value="[WmRil::Uim]UIMServiceClass::CardIsNonAct4GCardSendProvStatus: This is NOT the 4G card" />
        <string id="Event.WmRil_UimSendProvStatus_Needed"          value="[WmRil::Uim]UIMServiceClass::CardIsNonAct4GCardSendProvStatus: Send RIL_PROVISIONSTAT_NEEDED" />
        <string id="Event.WmRil_UimSendProvStatus_BIP_Success"     value="[WmRil::Uim]UIMServiceClass::ProcessRefreshInd: Send RIL_PROVISIONSTAT_BIP_SUCCESS" />
        <string id="Event.WmRil_UimSendProvStatus_Failure_End"     value="[WmRil::Uim]UIMServiceClass::ProcessRefreshInd: Send RIL_PROVISIONSTAT_FAILURE_END" />
        <string id="Event.WmRil_UimMDM_From_CSIM"                  value="[WmRil::Uim]UIMServiceClass::CheckIMSIMAndMDNAfterActivation: MDN read from CSIM: %2" />
        <string id="Event.WmRil_UimMDN_NonZero"                    value="[WmRil::Uim]UIMServiceClass::CheckIMSIMAndMDNAfterActivation: MDN is non zero" />
        <string id="Event.WmRil_UimMDN_AllZero"                    value="[WmRil::Uim]UIMServiceClass::CheckIMSIMAndMDNAfterActivation: MDN is all zero" />
        <string id="Event.WmRil_UimNumUiccCardSlots"               value="[WmRil::Uim]EnumerateSlotsClass::Execute: Number of UICC card slots" />
        <string id="Event.WmRil_UimSlotState"                      value="[WmRil::Uim]EnumerateSlotsClass::Execute: Slot state for slot %1: %2(%3)" />
        <string id="Event.WmRil_UimSlotState_ObtainedSuccess"      value="[WmRil::Uim]EnumerateSlotsClass::Execute: Slot state for all slots obtained successfully." />
        <string id="Event.WmRil_UimGetCardInfoForSlot"             value="[WmRil::Uim]GetCardInfoClass::Execute: Getting card info for slot index %1" />
        <string id="Event.WmRil_UimICCIDNotAvailableAtSlot"        value="[WmRil::Uim]GetCardInfoClass::Execute: ICCID is not available at slot %1" />
        <string id="Event.WmRil_UimAppFound"                       value="[WmRil::Uim]CardClass::FindApp: Found application at index %1 for the card at slot %2.  App type = %3" />
        <string id="Event.WmRil_UimAppNotFound"                    value="[WmRil::Uim]CardClass::FindApp: Did not find application at index %1 for the card at slot %2" />
        <string id="Event.WmRil_UimHuiccapp_Apptype"               value="[WmRil::Uim]ProvisioningApplicationClass::FillAppInfo: hUiccApp = %1, AppType = %2(%3)" />
        <string id="Event.WmRil_UimRilAppId"                       value="[WmRil::Uim]ProvisioningApplicationClass::FillAppInfo: hUiccApp = %1, app id length = %2, app id = %3" />
        <string id="Event.WmRil_UimRilAppName"                     value="[WmRil::Uim]ProvisioningApplicationClass::FillAppInfo: hUiccApp = %1, app name length = %2, app name = %3" />
        <string id="Event.WmRil_UimPinReferences"                  value="[WmRil::Uim]ProvisioningApplicationClass::FillAppInfo: The PIN references for this application: %1, %2" />
        <string id="Event.WmRil_UimGotCardInfoSuccess"             value="[WmRil::Uim]GetCardInfoClass::Execute: Card info for slot index %1 obtained successfully." />
        <string id="Event.WmRil_UimSysResponseSuccess"             value="[WmRil::Uim]GetCardInfoClass::GetICCIDFile: Serving system response successful" />
        <string id="Event.WmRil_UimEf_ICCID_Read_Copied"           value="[WmRil::Uim]GetCardInfoClass::GetICCIDFile: EF_ICCID file read and copied successfully." />
        <string id="Event.WmRil_UimGetUiccRecordStatus"            value="[WmRil::Uim]GetUiccRecordStatusClass::Execute: R:RIL_GETUICCRECORDSTATUS(dwItemCount = %1, dwRecordType = %2(%3), dwSize = %4)" />
        <string id="Event.WmRil_UimFilePathToConvert"              value="[WmRil::Uim]UIMServiceClass::ValidateAndSetUIMFileID: WMRIL file path to convert = %2" />
        <string id="Event.WmRil_UimFileType_RecordType"            value="[WmRil::Uim]GetUiccRecordStatusClass::TranslateUIMFileTypeToRilUiccRecordType: FileType = %1(%2), RecordType = %3(%4)" />
        <string id="Event.WmRil_UimOperation_UIMAccessCond_RILAccessCond"          value="[WmRil::Uim]GetUiccRecordStatusClass::FillInFileLockStatus: %1 operation: UIM AccessCondition = %2(%3), RILAccessCondition = %4(%5)" />
        <string id="Event.WmRIl_UimOperationNotIncluded"           value="[WmRil::Uim]GetUiccRecordStatusClass::FillInFileLockStatus: %1 operation: %2(%3) not included in RILUICCFILELOCKSTATUS response. Unsupported UIM security mask %4 does not have a matching RIL_UICCFILEACCESSCONDITION_XXX" />
        <string id="Event.WmRil_UimPinReference"                   value="[WmRil::Uim]GetUiccRecordStatusClass::FillInFileLockStatus:                  PIN reference: %2" />
        <string id="Event.WmRil_UimCardResult"                     value="[WmRil::Uim]CardClass::CheckStatusWords: Card result sw1 = %1, sw2 = %2" />
        <string id="Event.WmRil_UimFileLen_Response"               value="[WmRil::Uim]SendRestrictedUiccCmdClass::ProcessResponse: file reading lenth = %1, Response = %2" />
        <string id="Event.WmRil_UimFileRefreshSuccess"             value="[WmRil::Uim]WatchUiccFileChangeClass::Execute: File refresh completed successfully" />
        <string id="Event.WmRil_UimHuiccApp"                       value="[WmRil::Uim]GetIMSIClass::ValidateAndInitParams: hUiccApp in the input param is %1" />
        <string id="Event.WmRil_UimSendQmiReq"                     value="[WmRil::Uim]GetIMSICGetIMSIClass::GetIMSIFromNV: Sending a NAS_GET_3GPP2_SUBSCRIPTION_INFO_REQ" />
        <string id="Event.WmRil_UimTrueImsiPresent"                value="[WmRil::Uim]GetIMSICGetIMSIClass::GetIMSIFromNV: QMI_NAS_GET_3GPP2_SUBSCRIPTION_INFO_RESP True IMSI TLV present" />
        <string id="Event.WmRil_UimTrueImsiNotPresent"             value="[WmRil::Uim]GetIMSICGetIMSIClass::GetIMSIFromNV: QMI_NAS_GET_3GPP2_SUBSCRIPTION_INFO_RESP True IMSI TLV not present. Min based IMSI TLV present" />
        <string id="Event.WmRil_UimMcc_Imsi1112_ImsiS2_ImsiS1"     value="[WmRil::Uim]GetIMSICGetIMSIClass::GetIMSIFromNV: MCC = %1, IMSI_11_12 = %2, IMSI_S2 = %3, IMSI_S1 = %4" />
        <string id="Event.WmRil_UimImsiValue"                      value="[WmRil::Uim]GetIMSICGetIMSIClass::GetIMSIFromNV: IMSI string length (including ending NULL character) = %1, IMSI = %2" />
        <string id="Event.WmRil_UimImsiMccValue"                   value="[WmRil::Uim]GetIMSICGetIMSIClass::GetIMSIFromNV: IMSI MCC DWORD value: %1" />
        <string id="Event.WmRil_UimImsiValue_ProcessGWIMSI"        value="[WmRil::Uim]GetIMSIClass::ProcessGWIMSI: IMSI string length (including ending NULL character) = %1, IMSI = %2" />
        <string id="Event.WmRil_UimImsiMccValue_ProcessGWIMSI"     value="[WmRil::Uim]GetIMSIClass::ProcessGWIMSI: IMSI MCC DWORD value: %1" />
        <string id="Event.WmRil_UimMcc_Imsi1112_Digits1112_S2_S1Second3Digits_S1Last3Digits"     value="[WmRil::Uim]GetIMSIClass::ProcessCDMAIMSI: MCC = %1, Digits_11_12 = %2, S2 = %3, S1_Second3Digits = %4, S1_Last3Digits = %5" />
        <string id="Event.WmRil_UimClass1_Imsi_Len"                value="[WmRil::Uim]GetIMSIClass::ProcessCDMAIMSI: CLASS 1 IMSI with length = %1" />
        <string id="Event.WmRil_UimImsi_Len"                       value="[WmRil::Uim]GetIMSIClass::ProcessCDMAIMSI: IMSI = %1, length = %2" />
        <string id="Event.WmRil_UimImsiMcc_ImsiMnc"                value="[WmRil::Uim]GetIMSIClass::ProcessCDMAIMSI: IMSI MCC DWORD value: %1.  IMSI MNC DWORD value: %2" />
        <string id="Event.WmRil_UimImsiT_NotProgrammed"            value="[WmRil::Uim]GetIMSIClass::GetIMSIFromCard: IMSI_T is not programmed" />
        <string id="Event.WmRil_UimContent_Len"                    value="[WmRil::Uim]GetIMSIClass::SendReqToUIMAndValidateResult: content Length = %1, Content = %2(See Details)" />
        <string id="Event.WmRil_WaitForCardStatusInternalInd"      value="[WmRil::Uim]GetIMSIClass::Execute: Wait for card status internal indication to check the perso state" />
        <string id="Event.WmRil_GetIMSIProcessInternalIndData"     value="[WmRil::Uim]GetIMSIClass::ProcessInternalIndication: Received internal indication %1(%2)" />
        <string id="Event.WmRil_WaitForCardStatusInternalInd2"     value="[WmRil::Uim]GetIMSIClass::ProcessInternalIndication: Wait for card status internal indication to check the perso state" />
        <string id="Event.WmRil_UimSlotIndex_ATR_Len"              value="[WmRil::Uim]GetUiccATRClass::ProcessResponse: Card on slot %1's ATR: , length = %2, ATR = %3" />
        <string id="Event.WmRil_UimGetUiccATR_SlotIndex"           value="[WmRil::Uim]GetUiccATRClass::ValidateAndInitParams: GetUiccATR input params: slot index = %1" />
        <string id="Event.WmRil_UimCardFoundAtSlot"                value="[WmRil::Uim]UIMServiceClass::FindCard: Found card for slot %1 in the list of cards" />
        <string id="Event.WmRil_UimGetCardInfoForSlot_OpenUiccLogicalChannel"                    value="[WmRil::Uim]OpenUiccLogicalChannelClass::Execute: Getting card info for slot index %1" />
        <string id="Event.WmRil_UimSelectAIDResp"                  value="[WmRil::Uim]OpenUiccLogicalChannelClass::ProcessResponse: SelectAIDResponse: length = %1, Response = %2" />
        <string id="Event.WmRil_UimOpenLogicalChannell_Success"    value="[WmRil::Uim]OpenUiccLogicalChannelClass::ProcessResponse: Successfully open a logical channel with WMRIL channel id %1, QMI channel id %2" />
        <string id="Event.WmRil_UimOpenUiccLogicalChannel_InputParams"                           value="[WmRil::Uim]OpenUiccLogicalChannelClass::ValidateAndInitParams: OpenUiccLogicalChannel input params: slot index = %1, app id length = %2" />
        <string id="Event.WmRil_UimSendReqToCloseChannel"          value="[WmRil::Uim]CloseUiccLogicalChannelClass::Execute: Send request to close a logical channel with WMRIL channel id %1, QMI channel id %2" />
        <string id="Event.WmRil_UimCloseUiccLogicalChannel_InputParams"                          value="[WmRil::Uim]CloseUiccLogicalChannelClass::ValidateAndInitParams: CloseUiccLogicalChannel input params: slot index = %1, WMRIL logical channel id = %2" />
        <string id="Event.WmRil_UimCloseUiccLogicalChannelGroup_InputParams"                     value="[WmRil::Uim]CloseUiccLogicalChannelGroupClass::ValidateAndInitParams: CloseUiccLogicalChannelGroup input params: slot index = %1, Channel group = %2(%3)" />
        <string id="Event.WmRil_UimCouldNotFindChannelForGroup"    value="[WmRil::Uim]CardClass::DeleteOneLogicalChannelFromGroup: Could not find a channel assoicated with the channel group = %1(%2)" />
        <string id="Event.WmRil_UimNoMoreChannelForGroup"          value="[WmRil::Uim]CloseUiccLogicalChannelGroupClass::CloseOneLogicalChannelFromGroup: No more logical channel assoicated with the channel group = %1(%2)" />
        <string id="Event.WmRil_UimCardInfoForSlot_ExchangeUiccAPDU"                          value="[WmRil::Uim]ExchangeUiccAPDUClass::Execute: Getting card info for slot index %1" />
        <string id="Event.WmRil_UimSendReqToExchange"              value="[WmRil::Uim]ExchangeUiccAPDUClass::Execute: Send request to exchange APDU with WMRIL channel id %1, QMI channel id %2" />
        <string id="Event.WmRil_UimExchangeAPDU_InputParams"       value="[WmRil::Uim]ExchangeUiccAPDUClass::ValidateAndInitParams: ExchangeAPDU input params: slot index = %1, WMRIL logical channel id = %2" />
        <string id="Event.WmRil_UimValidStateReqForPinType"        value="[WmRil::Uim]GetUICCLockStateClass::Execute: Valid state Request for PIN type = %1(%2), appType = %3(%4)" />
        <string id="Event.WmRil_UimGetUiccLockStateResp"           value="[WmRil::Uim]GetUICCLockStateClass::Execute: GetUICCLockState resp:UICC Lock App = %1, UICC Lock KeyRef = %2, LockState = %3, PinRetriesCount = %4, PUKRetriesCount = %5" />
        <string id="Event.WmRil_UimQMIResp_Result_Error"           value="[WmRil::Uim]SetUiccLockEnabledClass::ProcessResponse: QMI Result = %1, Expected Error = %2(%3)" />
        <string id="Event.WmRil_UimPinState_PinRetryNo_PUKRetryNo" value="[WmRil::Uim]SetUiccLockEnabledClass::ProcessResponse: Expected PIN state = %1(%2), Expected PIN retry number = %3, Expected PUK retry number = %4" />
        <string id="Event.WmRil_UimPinState"                       value="[WmRil::Uim]SetUiccLockEnabledClass::ProcessResponse: Expected PIN state = %1(%2)" />
        <string id="Event.WmRil_UimValidKeyRef"                    value="[WmRil::Uim]ChangeUiccLockPasswordClass::Execute: Valid KeyRef = %1, for AppType = %2(%3)" />
        <string id="Event.WmRil_UimQMIResult_Error"                value="[WmRil::Uim]ChangeUiccLockPasswordClass::ProcessResponse: QMI Result = %1, Expected Error = %2(%3)" />
        <string id="Event.WmRil_UimPinState_PinRetryNum_PUKRetryNum"                             value="[WmRil::Uim]ChangeUiccLockPasswordClass::ProcessResponse: Expected PIN state = %1(%2), Expected PIN retry number = %3, Expected PUK retry number = %4" />
        <string id="Event.WmRil_UimExpectedPinState"               value="[WmRil::Uim]ChangeUiccLockPasswordClass::ProcessResponse: Expected PIN state = %1(%2)" />
        <string id="Event.WmRil_UimPersoFeature_CKRetries_PUKRetries"                            value="[WmRil::Uim]GetPersoDeactivationStateClass::Execute: Perso State for perso feature = %1(%2), has CK retries = %3, PUK retries = %4" />
        <string id="Event.WmRil_UimPersoFeature_PersoState_CKRetries_PUKRetries"                 value="[WmRil::Uim]GetPersoDeactivationStateClass::Execute: Perso feature = %1(%2), Perso State = %3(%4), has CK retries = %5, PUK retries = %6" />
        <string id="Event.WmRil_UimWaitForUimStatusChangeInd"      value="[WmRil::Uim]DeactivatePersoClass::Execute: Need to wait for UIM STATUS CHANGE IND after sucessful deperso attempt" />
        <string id="Event.WmRil_UimPersoFeature_CKRetries_PUKRetries_DeactivatePerso"            value="[WmRil::Uim]DeactivatePersoClass::Execute: Perso State for perso feature = %1(%2), has CK retries = %3, PUK retries = %4" />
        <string id="Event.WmRil_UimRegisterForInternalInd"         value="[WmRil::Uim]DeactivatePersoClass::Execute: Need to wait for UIM_CARD_STATUS_CHANGE_IND notification after sucessful deperso attempt" />
        <string id="Event.WmRil_UimWaitForUimStatusChangeInd_DeactivatePerso"                    value="[WmRil::Uim]DeactivatePersoClass::ProcessInternalIndication: Need to wait for UIM STATUS CHANGE IND notification after sucessful deperso attempt" />
        <string id="Event.WmRil_UimResponseBlob_ExecutorConfig"    value="[WmRil::Uim]GetExecutorConfigClass::Execute: Current executor configuration for executor %1: Flags = %2, Number of apps = %3, hUiccApps[0] = %4, hUiccApps[1] = %5" />
        <string id="Event.WmRil_UimSupportedFacilities"            value="[WmRil::Uim]GetDevCapsClass::GetPersoLockSupport: dwSupportedFacilities =%1" />
        <string id="Event.WmRil_UimFailedReadActSeq"               value="[WmRil::Uim]UIMServiceClass::InitializeCommon: Failed to read ActSeq registry key" />
        <string id="Event.WmRil_UimRcvdQmiStatusChangeInd"         value="[WmRil::Uim]UIMServiceClass::ProcessUimStatusChangeInd: Received QMI_UIM_STATUS_CHANGE_IND" />
        <string id="Event.WmRil_UimCreateInternalIndForCard"       value="[WmRil::Uim]UIMServiceClass::ProcessUimStatusChangeInd: Creating internal indication for the card status ind" />
        <string id="Event.WmRil_UimSlotStateChanged"               value="[WmRil::Uim]UIMServiceClass::CompareAndSyncCardState: slot state changed: current RIL slot state is %1(%2) and new RIL slot state is %3(%4) on slot %5" />
        <string id="Event.WmRil_UimRegisterRefreshCardSlot1"                     value="[WmRil::Uim]UIMServiceClass::RegisterForCardRefresh: Registering for refresh for session type UIM_SESSION_TYPE_CARD_ON_SLOT_1_V01" />
        <string id="Event.WmRil_UimRegisterRefreshCardSlot2"                     value="[WmRil::Uim]UIMServiceClass::RegisterForCardRefresh: Registering for refresh for session type UIM_SESSION_TYPE_CARD_ON_SLOT_2_V01" />
        <string id="Event.WmRil_UimRegisterRefreshCardSlot1Succeeded"            value="[WmRil::Uim]UIMServiceClass::RegisterForCardRefresh: Refresh registration for session type UIM_SESSION_TYPE_CARD_ON_SLOT_1_V01 succeeded" />
        <string id="Event.WmRil_UimRegisterRefreshCardSlot2Succeeded"            value="[WmRil::Uim]UIMServiceClass::RegisterForCardRefresh: Refresh registration for session type UIM_SESSION_TYPE_CARD_ON_SLOT_2_V01 succeeded" />
        <string id="Event.WmRil_UimResetCardInfoForSlot"           value="[WmRil::Uim]UIMServiceClass::SimulateUiccCardReset: Resetting card info for slot index %1" />
        <string id="Event.WmRil_UimSentSlotInfoChangeNotif_SlotState"            value="[WmRil::Uim]UIMServiceClass::SimulateUiccCardReset: Sent RIL_NOTIFY_SLOTINFOCHANGED notification. RIL slot state is %2(%3) at slot %1" />
        <string id="Event.WmRil_UimSentSlotInfoChangeNotif_SlotState_2"          value="[WmRil::Uim]UIMServiceClass::SendSlotInfoChangedNotification: Sent RIL_NOTIFY_SLOTINFOCHANGED notification. RIL slot state is %2(%3) at slot %1" />
        <string id="Event.WmRil_UimReportStateUimService"          value="[WmRil::Uim]UIMServiceClass::ReportState: Primary GW app (card+appindex) = %1, Primary 1X app (card+appindex) = %2, Secondary GW app (card+appindex) = %3, Secondary 1X app (card+appindex) = %4, Num slots = %5, Card list has %6 items" />
        <string id="Event.WmRil_UimLen_Id_Path"                    value="[WmRil::Uim]UIMServiceClass::ValidateAndSetUIMFileID: QMI UIM path len = %1, file id = %2, file path = %3(See Details)" />
        <string id="Event.WmRil_UimQmiFilePath_WmrilFilePath"      value="[WmRil::Uim]UIMServiceClass::ConvertUIMRefreshFileIDInfoToRilFileIDInfo: QMI UIM msg path len = %1, QMI UIM file path = %2(See Details), Eqivalent WMRIL path len = %3, Equivalent WMRIL file path = %4(See Details)" />
        <string id="Event.WmRil_UimCurrentAppHandleCounter"        value="[WmRil::Uim]UIMServiceClass::GetNexthUiccApp: The current app handle counter is %1" />
        <string id="Event.WmRil_UimCardFoundForSlot_GetNexthUiccApp"             value="[WmRil::Uim]UIMServiceClass::GetNexthUiccApp: Found card for slot %1 in the list of cards" />
        <string id="Event.WmRil_UimRefreshMode_Stage_Session_NumFiles"           value="[WmRil::Uim]UIMServiceClass::ProcessRefreshInd: refresh mode %1(%2), refresh stage %3(%4), refresh session %5(%6), refresh number of files %7" />
        <string id="Event.WmRil_UimRefreshFile_Id_PathLen_Path"    value="[WmRil::Uim]UIMServiceClass::ProcessRefreshInd: refresh file %1, file id %2, file path len = %3, File Path = %4(See Details)" />
        <string id="Event.WmRil_UimUiccResetRefreshSuccess"        value="[WmRil::Uim]UIMServiceClass::ProcessRefreshInd: UICC Reset REFRESH event on slot %1 completed successfully." />
        <string id="Event.WmRil_UimUiccRefCmdOccured_MsgSentSuccess"             value="[WmRil::Uim]UIMServiceClass::SendUICCRefreshCommandOccuredInternalInd: UICCRefreshCommandOccured internal indication message sent successfully." />
        <string id="Event.WmRil_UimPutCardAbsentDetectionInHead"   value="[WmRil::Uim]UIMServiceClass::ReInitialize: Created and put CardAbsentDetection internal command in the head of processing queue." />
        <string id="Event.WmRil_UimCreatedInsertInternalWaitUntilStatesBecomeSameCmd"  value="[WmRil::Uim]UIMServiceClass::InsertInternalWaitUntilStatesBecomeSameCmd: Created and queued InsertInternalWaitUntilStatesBecomeSameCmd internal command." />
        <string id="Event.WmRil_UimCreatedSetexecutorconfig"       value="[WmRil::Uim]UIMServiceClass::InsertInternalSetExecutorConfigCmds: Created and queued setexecutorconfig internal command." />
        <string id="Event.WmRil_UimCardStateForSlot"               value="[WmRil::Uim]UIMServiceClass::IsAnyCardStateAbsent: slot (%1) card state is still %2(%3)" />
        <string id="Event.WmRil_UimVerifyUICCLockDone"             value="[WmRil::Uim]UIMServiceClass::SendInternalCommandOKResponse: Internal VerifyUICCLock is done" />
        <string id="Event.WmRil_UimServiceMssrRecoveryDone"        value="[WmRil::Uim]UIMServiceClass::SendInternalCommandOKResponse: UIM service MSSR recovery is done" />
        <string id="Event.WmRil_UimSlotNums"                       value="[WmRil::Uim]UIMServiceClass::CompareCardsDuringMSSR: m_numPhysicalSlots (%1) != m_MSSRnumPhysicalSlots (%2) or m_numSlots (%3) != m_MSSRnumSlots (%4)" />
        <string id="Event.WmRil_UimpCardBeforeMSSRNotAvailable"    value="[WmRil::Uim]UIMServiceClass::CompareCardsDuringMSSR: pCardBeforeMSSR is not available" />
        <string id="Event.WmRil_UimpCardAfterMSSRNotAvailable"     value="[WmRil::Uim]UIMServiceClass::CompareCardsDuringMSSR: pCardAfterMSSR is not available" />
        <string id="Event.WmRil_UimAllCardsSame"                   value="[WmRil::Uim]UIMServiceClass::CompareCardsDuringMSSR: All cards are same before and after MSSR" />
        <string id="Event.WmRil_UimpCardBeforeMSSRorpCardAfterMSSRNotAvailable"  value="[WmRil::Uim]UIMServiceClass::CompareStatesDuringMSSR: pCardBeforeMSSR or pCardAfterMSSR is not avaialbe" />
        <string id="Event.WmRil_UimAllCardsSameBefNAfterMssr"      value="[WmRil::Uim]UIMServiceClass::CompareStatesDuringMSSR: All card states are same before and after MSSR" />
        <string id="Event.WmRil_UimCreatedSetSlotPower"            value="[WmRil::Uim]UIMServiceClass::InsertInternalSetSlotPowerCmds: Created and queued setslotpower internal command." />
        <string id="Event.WmRil_UimCreatedInternalVerifyUICCEncryptedPINLockCmd" value="[WmRil::Uim]UIMServiceClass::InsertInternalVerifyUICCLockCmds: Created and queued InternalVerifyUICCLockCmd internal command." />
        <string id="Event.WmRil_UimCardState_CardError_RilSlotState_Slot"        value="[WmRil::Uim]CardClass::CardClass: Card in Card State %1(%2) with Card Error Code %3(%4) and RIL slot state %5(%6) for slot %7" />
        <string id="Event.WmRil_UimCardSlot_FromState_ToState"     value="[WmRil::Uim]CardClass::SetCardState: Card in slot %1 changed from %2(%3) to %4(%5)" />
        <string id="Event.WmRil_UimCardSlot_FromError_ToError"     value="[WmRil::Uim]CardClass::SetCardError: Card in slot %1 changed from %2(%3) to %4(%5)" />
        <string id="Event.WmRil_UimSetNumApps"                     value="[WmRil::Uim]CardClass::SetNumApps: The number of apps in card in slot %1 changed from %2 to %3" />
        <string id="Event.WmRil_UimAddAppToAppList"                value="[WmRil::Uim]CardClass::AddAppToAppList: The application name of App (%1) is %2 (length = %3)" />
        <string id="Event.WmRil_UimAddedAppInfoToAppList"          value="[WmRil::Uim]CardClass::AddToAppList: Added app information to m_AppList (hUiccApp = %1)" />
        <string id="Event.WmRil_UimSentRilNotifyCardAppAdded"      value="[WmRil::Uim]CardClass::AddToAppList: Sent RIL_NOTIFY_CARDAPPADDED for hUiccApp %1" />
        <string id="Event.WmRil_UimSentRilNotifyCardAppRemoved"    value="[WmRil::Uim]CardClass::RemoveAllApps: Sent RIL_NOTIFY_CARDAPPREMOVED for hUiccApp %1" />
        <string id="Event.WmRil_UimhUiccAppInOldAndNewAppList"     value="[WmRil::Uim]CardClass::FindNewAndRemovedApps: hUiccApp %1 is in old app list and is also in new app list" />
        <string id="Event.WmRil_UimhUiccAppInOldNotInNewAppList_SentNotify"      value="[WmRil::Uim]CardClass::FindNewAndRemovedApps: hUiccApp %1 is in old app list but not in new app list. Sent RIL_NOTIFY_CARDAPPREMOVED for hUiccApp %1" />
        <string id="Event.WmRil_UimOneAppInNewAndOldList"          value="[WmRil::Uim]CardClass::FindNewAndRemovedApps: One app is in new app list and also in old app list: hUiccApp %1" />
        <string id="Event.WmRil_UimOneAppInNewNotInOldList"        value="[WmRil::Uim]CardClass::FindNewAndRemovedApps: One app is in new app list but not in old app list: hUiccApp %1" />
        <string id="Event.WmRil_UimEF_ICCIDFileReadAndStoreSuccess"              value="[WmRil::Uim]CardClass::GetICCIDFromQMIAndStore: EF_ICCID file read and store successfully. Length = %1, m_ICCID = %2(See Details)" />
        <string id="Event.WmRil_UimCardStateDifferent"             value="[WmRil::Uim]CardClass::CompareCardDuringMSSR: card state %1(%2) is different for compared card state %3(%4)" />
        <string id="Event.WmRil_UimCardErrorCodeDifferent"         value="[WmRil::Uim]CardClass::CompareCardDuringMSSR: card error code %1(%2) is different for compared card error code %3(%4)" />
        <string id="Event.WmRil_UimOneIccidAvailable"              value="[WmRil::Uim]CardClass::CompareCardDuringMSSR: One ICCID is avilable while the other does not have it" />
        <string id="Event.WmRil_UimIccidDifferent"                 value="[WmRil::Uim]CardClass::CompareCardDuringMSSR: ICCIDs are different. Length = %1; ICCID 1 = %2(See Details), ICCID 2 = %3(See Details)" />
        <string id="Event.WmRil_UimNumAppsDiff"                    value="[WmRil::Uim]CardClass::CompareCardDuringMSSR: number of apps %1 is different for compared card's number of apps %2" />
        <string id="Event.WmRil_UimAppListSizeDiff"                value="[WmRil::Uim]CardClass::CompareCardDuringMSSR: app list size %1 is different for compared card's app list size %2" />
        <string id="Event.WmRil_UimOneAppIsNull"                   value="[WmRil::Uim]CardClass::CompareCardDuringMSSR: One of app at %1 is NULL" />
        <string id="Event.WmRil_UimCardClassReportState"           value="[WmRil::Uim]CardClass::ReportState: SlotId = %1, CardState = %2(%3), CardError = %4(%5)" />
        <string id="Event.WmRil_UimPinClassConstructor"            value="[WmRil::Uim]PINClass::PINClass: Constructed %1(%2), %3(%4), PIN retries %5, PUK retries %6" />
        <string id="Event.WmRil_UimSetPinState"                    value="[WmRil::Uim]PINClass::SetPINstate: %1(%2) is changing from %3(%4) to %5(%6)" />
        <string id="Event.WmRil_UimSetPINretries"                  value="[WmRil::Uim]PINClass::SetPINretries: %1(%2) PIN retries changed from %3 to %4" />
        <string id="Event.WmRil_UimSetPUKretries"                  value="[WmRil::Uim]PINClass::SetPUKretries:%1(%2) PUK retries changed from %3 to %4" />
        <string id="Event.WmRil_UimGetPINstate"                    value="[WmRil::Uim]PINClass::GetPINstate: %1(%2) is in %3(%4)" />
        <string id="Event.WmRil_UimPinClassReportState"            value="[WmRil::Uim]PINClass::ReportState: %1(%2) %3(%4) has %5 PIN retries left and %6 PUK retries left" />
        <string id="Event.WmRil_UimProvisioningApplicationClassConstructor"      value="[WmRil::Uim]ProvisioningApplicationClass::ProvisioningApplicationClass: Constructed %1(%2), in %3(%4) at slot %5, index %6" />
        <string id="Event.WmRil_UimFailsOnPersoCheckMP"            value="[WmRil::Uim]ProvisioningApplicationClass::GetCurrMPPersoFeatureFailedOnPersoCheck: %1(%2) fails on perso check" />
        <string id="Event.WmRil_UimFailsOnPersoCheckAP"            value="[WmRil::Uim]ProvisioningApplicationClass::GetCurrAPPersoFeatureFailedOnPersoCheck: %1(%2) fails on perso check" />
        <string id="Event.WmRil_UimBroadcastPersoCheckStatus"      value="[WmRil::Uim]ProvisioningApplicationClass::BroadcastPersoCheckStatusExternalInd: RIL_NOTIFY_UICCAPPPERSOCHECKSTATUS hUiccApp = %1, perso check state %2(%3), perso feature %4(%5)" />
        <string id="Event.WmRil_UimSetSessionTypeAndExecutor"      value="[WmRil::Uim]ProvisioningApplicationClass::SetSessionTypeAndExecutor: Session type is %1 and subscriptin index is %2" />
        <string id="Event.WmRil_UimAppRefFilesId_PathLen_Path"     value="[WmRil::Uim]ProvisioningApplicationClass::SendUiccAppDataChangeNotification: AppRefreshFiles id = %1, path_len = %2, Path = %3(See Details)" />
        <string id="Event.WmRil_UimRilNotifyUiccappDatachange"     value="[WmRil::Uim]ProvisioningApplicationClass::BroadcastUiccAppDataChangeNotification: RIL_NOTIFY_UICCAPP_DATACHANGE: data change %1(%2)" />
        <string id="Event.WmRil_UimFileRefFilesId_PathLen_Path"    value="[WmRil::Uim]ProvisioningApplicationClass::SendUiccFileDataChangeNotification: FileRefreshFiles id = %1, path_len = %2, Path = %3(See Details)" />
        <string id="Event.WmRil_UimRilNotifyUiccFileDatachange"    value="[WmRil::Uim]ProvisioningApplicationClass::BroadcastUiccFileDataChangeNotification: RIL_NOTIFY_UICCFILE_DATACHANGE notification: file id = %1" />
        <string id="Event.WmRil_UimEFSPNFileReadCopied"            value="[WmRil::Uim]ProvisioningApplicationClass::Send3GPP2EFSPNFileChangeInternalIndication: EF-SPN file read and copied successfully." />
        <string id="Event.WmRil_Uim3GPP2_EFSPNFileChangeNotif"     value="[WmRil::Uim]ProvisioningApplicationClass::Send3GPP2EFSPNFileChangeInternalIndication: 3GPP2 EF-SPN file change internal notification sent successfully." />
        <string id="Event.WmRil_UimEF_CSP_PLMN_Setting"            value="[WmRil::Uim]ProvisioningApplicationClass::GetCSPPLMNSetting: EF_CSP PLMN setting is %1" />
        <string id="Event.WmRil_UimHUiccAppCompare"                value="[WmRil::Uim]ProvisioningApplicationClass::CompareAppDuringMSSR: app's hUiccApp %1 is different for compared app's hUiccApp %2" />
        <string id="Event.WmRil_UimAppTypeCompare"                 value="[WmRil::Uim]ProvisioningApplicationClass::CompareAppDuringMSSR: app's RIL app type %1(%2) is different for compared app's RIL app type %3(%4)" />
        <string id="Event.WmRil_UimAidLengthCompare"               value="[WmRil::Uim]ProvisioningApplicationClass::CompareAppDuringMSSR: app's aid length %1 is different for compared app's aid length %2" />
        <string id="Event.WmRil_UimAidCompare"                     value="[WmRil::Uim]ProvisioningApplicationClass::CompareAppDuringMSSR: aid are different. Aid Length = %1; aid is = %2(See Details), compared aid is = %3(See Details)" />
        <string id="Event.WmRil_UimAppLengthCompare"               value="[WmRil::Uim]ProvisioningApplicationClass::CompareAppDuringMSSR: app's app name length %1 is different for compared app's app nmae length %2" />
        <string id="Event.WmRil_UimAppNamesCompare"                value="[WmRil::Uim]ProvisioningApplicationClass::CompareAppDuringMSSR: app names are different. App Name is = %1, Compared App Name = %2" />
        <string id="Event.WmRil_UimIsUpinUsedDifferent"            value="[WmRil::Uim]ProvisioningApplicationClass::CompareAppDuringMSSR: IsUPINUsed is different on two apps" />
        <string id="Event.WmRil_UimQmiAppStateCompare"             value="[WmRil::Uim]ProvisioningApplicationClass::CompareStatesDuringMSSR: app's QMI app state %1(%2) is different from compared app's QMI app state %3(%4)" />
        <string id="Event.WmRil_UimCompareMppersoApperso"          value="[WmRil::Uim]ProvisioningApplicationClass::CompareStatesDuringMSSR: app' MPPerso check state %1(%2) is different from compared app's MPPerso check state %3(%4)" />
        <string id="Event.WmRil_UimCompareMppersoAppersoWhenPersoFails"          value="[WmRil::Uim]ProvisioningApplicationClass::CompareStatesDuringMSSR: app' MPPerso feature %1(%2) is different from compared app's MPPerso feature %3(%4) when perso check fails" />
        <string id="Event.WmRil_UimProvAppClass_ReportState"       value="[WmRil::Uim]ProvisioningApplicationClass::ReportState: App index %1, AppType = %2, AppState = %3, AidLen = %4, Perso Check State = %5, isUPINused = %6" />
        <string id="Event.WmRil_UimInvalidCmdDataBlob"             value="[WmRil::Uim]SendRestrictedUiccCmdClass::WriteBinary: Invalid command data blob" />
        <string id="Event.WmRil_GetUiccServiceState_InputParams"   value="[WmRil::Uim]GetUiccServiceStateClass::InitParams: GetUiccServiceState input params: hUiccApp = %1, Service = %2(%3)" />
        <string id="Event.WmRil_GetUiccServiceState_Response"      value="[WmRil::Uim]GetUiccServiceStateClass::Execute: GetUiccServiceInfo resp: Service = %1(%2), FDN status %3(%4)" />
        <string id="Event.WmRil_InternalVerifyUiccLock_SendInternalIndPINVerification"    value="[WmRil::Uim]InternalVerifyUICCLockClass::SendInternalIndication: Send InternalIndicationPINVerification" />
        <string id="Event.WmRil_SetUiccServiceState_InputParams"   value="[WmRil::Uim]SetUiccServiceStateClass::InitParams: SetUiccServiceState input params: hUiccApp = %1, Service = %2(%3), fEnable = %4" />
        <string id="Event.WmRil_SetUiccServiceState_InternalVerifyUICCLockCmd"            value="[WmRil::Uim]SetUiccServiceStateClass::Execute: Created and queued InternalVerifyUICCLockCmd internal command" />
        <string id="Event.WmRil_GetUiccServiceLock_InputParams"    value="[WmRil::Uim]GetUiccServiceLockClass::InitParams: GetUiccServiceLock input params: hUiccApp = %1, Service = %2(%3)" />
        <string id="Event.WmRil_GetUiccServiceLock_Response"       value="[WmRil::Uim]GetUiccServiceLockClass::Execute: GetUiccServiceLock resp: hUiccApp = %1, keyRef = %2(%3)" />

        <string id="Event.WmRil_APPersoCreatedUpdateUiccAPPersoCheckStateInternalCmd"  value="[WmRil::APPerso]ProvisioningApplicationClass::CompareAppInfoToSendSecurityNotification: Created and queued UpdateUiccAPPersoCheckState internal command." />
        <string id="Event.WmRil_APPersoCallingUnregisterNotifyFnCb"              value="[WmRil::APPerso]APPersoServiceClass::~APPersoServiceClass: Calling APPerso_UnRegisterNotificationCallback to unregister the notification callback function." />
        <string id="Event.WmRil_APPersoExportedFuncsLoadedSuccess"               value="[WmRil::APPerso]APPersoServiceClass::LoadExportedFunctionAddresses: Successfully loaded exported functions from APPerso.dll" />
        <string id="Event.WmRil_APPersoRegisteredForExtInd"                      value="[WmRil::APPerso]APPersoServiceClass::RegisterForExternalIndication: Registered for APPerso external indication %1(%2)" />
        <string id="Event.WmRil_APPersoAPPersoActivatedFeaturesUpdatedSent"      value="[WmRil::APPerso]APPersoServiceClass::ProcessAPPersoDePersoInd: APPersoActivatedFeaturesUpdated internal indication message sent successfully." />
        <string id="Event.WmRil_APPersoPersoFeature_CKRetries_PUKRetries"        value="[WmRil::APPerso]APPersoServiceClass::GetAPPersoDeactivationState: APPerso State for perso feature %1(%2) has CK retries = %3, PUK retries = %4" />

        <string id="Event.WmRil_PhonebookGetUiccLockState_InputParams"           value="[WmRil::Phonebook]GetUICCLockStateClass::ValidateAndInitParams: GetUICCLockState input params: hUiccApp = %1, dwKeyRef = %2" />
        <string id="Event.WmRil_PhonebookStoreLocCaps"             value="[WmRil::Phonebook]GetDevCapsClass::GetPBStoreLocations: PB STORELOC CAPS" />
        <string id="Event.WmRil_PhonebookMaxRecReadCaps"           value="[WmRil::Phonebook]GetDevCapsClass::GetPBMaxRead: PB MAX REC READ CAPS" />
        <string id="Event.WmRil_PhonebookResult_Huiccapp_PbmSession"             value="[WmRil::Phonebook]PhonebookServiceClass::GetSessionFromHUiccApp: Result = %1, hUiccApp = %2, PBM Session = %3(%4)" />
        <string id="Event.WmRil_PhonebookUnsupportedStoreLoc"      value="[WmRil::Phonebook]PhonebookServiceClass::MapStoreLocToPBMPBType: Unsupported Store Location" />
        <string id="Event.WmRil_PhonebookStoreLoc_PbType"          value="[WmRil::Phonebook]PhonebookServiceClass::MapStoreLocToPBMPBType: RIL Phonebook Store Loc = %1(%2), PBMPbType = %3(%4)" />
        <string id="Event.WmRil_PhonebookReadRecordsReqParams"     value="[WmRil::Phonebook]ReadPhonebookEntriesClass::Execute: QMI_PBM_READ_RECORDS_REQ params: session_type = %1(%2), PB_type = %3, PBM StartIndex = %4, PBM EndIndex = %5" />
        <string id="Event.WmRil_PhonebookNumOfRecordsReq_Expected" value="[WmRil::Phonebook]ReadPhonebookEntriesClass::Execute: num of records requested = %1, num_of_records expected in Ind = %2" />
        <string id="Event.WmRil_PhonebookAllRecordsEmptySendResp"  value="[WmRil::Phonebook]ReadPhonebookEntriesClass::Execute: As all records are empty, sending a response now" />
        <string id="Event.WmRil_PhonebookInvalidNumOfRecords"      value="[WmRil::Phonebook]ReadPhonebookEntriesClass::Execute: As all records are empty, sending a response nowInvalid num of records = %1 returned in QMI_PBM_READ_RECORDS_RESP" />
        <string id="Event.WmRil_PhonebookRcvdReadInd_SessionType_PbType"         value="[WmRil::Phonebook]ReadPhonebookEntriesClass::ProcessRecordReadInd: Received QMI_PBM_RECORD_READ_IND. Session_type = %1(%2), Pb_type = %3" />
        <string id="Event.WmRil_PhonebookPbType_StoreLoc"          value="[WmRil::Phonebook]PhonebookServiceClass::MapPBMPBTypeToStoreLoc: RIL Phonebook Store Loc = %1(%2), PBMPbType = %3(%4)" />
        <string id="Event.WmRil_PhonebookHuiccappFromSession"      value="[WmRil::Phonebook]PhonebookServiceClass::GetHUiccAppFromSession: Result = %1, hUiccApp = %2, PBM Session = %3(%4)" />
        <string id="Event.WmRil_PhonebookSeqNum_RecordInstanceLen" value="[WmRil::Phonebook]ReadPhonebookEntriesClass::ProcessRecordReadInd: Seq num in Ind = %1, record_instances_len in Ind = %2" />
        <string id="Event.WmRil_PhonebookPbmRecId_RilRecId"        value="[WmRil::Phonebook]PhonebookServiceClass::GetRilRecIdFromPBMRecId: PBM Rec ID = %1, RIL Rec ID = %2" />
        <string id="Event.WmRil_PhonebookSecondName"               value="[WmRil::Phonebook]ReadPhonebookEntriesClass::ProcessRecordReadInd: Second Name Info TLV present" />
        <string id="Event.WmRil_PhonebookGroupId"                  value="[WmRil::Phonebook]ReadPhonebookEntriesClass::ProcessRecordReadInd: Group ID Info TLV present" />
        <string id="Event.WmRil_PhonebookAdditionalNumber"         value="[WmRil::Phonebook]ReadPhonebookEntriesClass::ProcessRecordReadInd: Additional Number Info TLV present" />
        <string id="Event.WmRil_PhonebookEmail"                    value="[WmRil::Phonebook]ReadPhonebookEntriesClass::ProcessRecordReadInd: Email Info TLV present" />
        <string id="Event.WmRil_PhonebookSecondNamePresent"        value="[WmRil::Phonebook]ReadPhonebookEntriesClass::GetSecondName: Second name present for this record" />
        <string id="Event.WmRil_PhonebookNoSeconeName"             value="[WmRil::Phonebook]ReadPhonebookEntriesClass::GetSecondName: No Second Name for this record PBM RecID = %1" />
        <string id="Event.WmRil_PhonebookAddnNumberPresent"        value="[WmRil::Phonebook]ReadPhonebookEntriesClass::GetAddNumList: Additional number present for this record" />
        <string id="Event.WmRil_PhonebookNoAddnNum"                value="[WmRil::Phonebook]ReadPhonebookEntriesClass::GetAddNumList: No Additional number tag ID" />
        <string id="Event.WmRil_PhonebookRecId_AddnNumCount"       value="[WmRil::Phonebook]ReadPhonebookEntriesClass::GetAddNumList: PBM RecID = %1, Additional Num count = %2" />
        <string id="Event.WmRil_PhonebookNoAddnNumForRec"          value="[WmRil::Phonebook]ReadPhonebookEntriesClass::GetAddNumList: No Additional Number for this record PBM RecID = %1" />
        <string id="Event.WmRil_PhonebookGrpIdsPresent_RecID_Count"              value="[WmRil::Phonebook]ReadPhonebookEntriesClass::GetGrpIdList: Group IDs present for this record. PBM RecID = %1, GrpID count = %2" />
        <string id="Event.WmRil_PhonebookNoGrpIds"                 value="[WmRil::Phonebook]ReadPhonebookEntriesClass::GetGrpIdList: No Grp IDs found for this record PBM RecID = %1" />
        <string id="Event.WmRil_PhoneboolEmailAddrPresent_RecId_Count"           value="[WmRil::Phonebook]ReadPhonebookEntriesClass::GetEmailList: Email addresses present for this record. PBM RecID = %1, Email count = %2" />
        <string id="Event.WmRil_PhonebookNoEmailAddrFound"         value="[WmRil::Phonebook]ReadPhonebookEntriesClass::GetEmailList: No Email Address found for this record PBM RecID = %1" />
        <string id="Event.WmRil_PhonebookPbmNumType_RilNumType"    value="[WmRil::Phonebook]PhonebookServiceClass::MapPBMNumTypeToRilNumType: PBMNumType = %1(%2), RilNumType = %3(%4)" />
        <string id="Event.WmRil_PhonebookPbmNumPlan_RilNumPlan"    value="[WmRil::Phonebook]PhonebookServiceClass::MapPBMNumPlanToRilNumPlan: PBMNumPlan = %1(%2), RilNumPlan = %3(%4)" />
        <string id="Event.WmRil_PhonebookInputParams"              value="[WmRil::Phonebook]ReadPhonebookEntriesClass::ValidateAndInitParams: ReadPhoneBookEntries input params: hUiccApp = %1, StoreLoc = %2(%3), StartIndex = %4, EndIndex = %5" />
        <string id="Event.WmRil_PhonebookWrite_InputParams"        value="[WmRil::Phonebook]WritePhoneBookEntryClass::ValidateAndInitParams: WritePhoneBookEntry input params: hUiccApp = %1, StoreLoc = %2(%3)" />
        <string id="Event.WmRil_PhonebookRilRecId_PbmRecId_PbmFromRil"           value="[WmRil::Phonebook]PhonebookServiceClass::GetPBMRecIdFromRilRecId: RIL Rec ID = %1, PBM Rec ID = %2" />
        <string id="Event.WmRil_PhonebookSendResp"                 value="[WmRil::Phonebook]WritePhoneBookEntryClass::ProcessResponse: Sending response" />
        <string id="Event.WmRil_PhonebookNotCorrectInd"            value="[WmRil::Phonebook]WritePhoneBookEntryClass::ProcessInternalIndication: This is not the correct indication command is waiting for. Re-register for the internal indication" />
        <string id="Event.WmRil_PhonebookSendResp_ProcessIntInd"   value="[WmRil::Phonebook]WritePhoneBookEntryClass::ProcessInternalIndication: Sending response" />
        <string id="Event.WmRil_Phonebook_InternalVerifyUICCLockCmd"             value="[WmRil::Phonebook]WritePhoneBookEntryClass::Execute: Created and queued InternalVerifyUICCLockCmd internal command" />
        <string id="Event.WmRil_PhonebookRilNumType_PbmNumType"    value="[WmRil::Phonebook]PhonebookServiceClass::MapRilNumTypeToPBMNumType: PBMNumType = %1(%2), RilNumType = %3(%4)" />
        <string id="Event.WmRil_PhonebookRilNumPlan_PbmNumPlan"    value="[WmRil::Phonebook]PhonebookServiceClass::MapRilNumPlanToPBMNumPlan: PBMNumPlan = %1(%2), RilNumPlan = %3(%4)" />
        <string id="Event.WmRil_PhonebookDelete_InputParams"       value="[WmRil::Phonebook]DeletePhoneBookEntryClass::ValidateAndInitParams: DeletePhoneBookEntry input params: hUiccApp = %1, StoreLoc = %2(%3), Index = %4" />
        <string id="Event.WmRil_PhonebookCallingDelRecReq"         value="[WmRil::Phonebook]DeletePhoneBookEntryClass::Execute: Calling QMI_PBM_DELETE_RECORD_REQ with params: PbType = %1(%2), session = %3(%4), PBMRecId = %5" />
        <string id="Event.WmRil_PhonebookSendResp_DelPbkEntry"     value="[WmRil::Phonebook]DeletePhoneBookEntryClass::ValidateIndDataAndSendResponse: Sending response" />
        <string id="Event.WmRil_PhonebookDelete_InternalVerifyUICCLockCmd"       value="[WmRil::Phonebook]DeletePhoneBookEntryClass::Execute: Created and queued InternalVerifyUICCLockCmd internal command" />
        <string id="Event.WmRil_PhonebookCapabilitiesReqParams"    value="[WmRil::Phonebook]GetPhonebookOptionsClass::Execute: QMI_PBM_GET_PB_CAPABILITIES_REQ params: session_type = %1(%2), PB_type = %1(%2)" />
        <string id="Event.WmRil_PhonebookGetPBOptions_TotalRec_UsedRec_MaxAddrLen_MaxTextLen"    value="[WmRil::Phonebook]GetPhonebookOptionsClass::Execute: GetPhoneBookOptions resp:Total records, Used records, MaxAddressLen, MaxTextLen" />
        <string id="Event.WmRil_PhonebookGetPBOptions_MaxAddnNum_MaxAddnNumLen"  value="[WmRil::Phonebook]GetPhonebookOptionsClass::Execute: GetPhoneBookOptions resp:Max Additional Num, Max Additional NumLen" />
        <string id="Event.WmRil_PhonebookGetPBOptions_MaxAASStrLen_UsedAASRec_TotalAASRec"       value="[WmRil::Phonebook]GetPhonebookOptionsClass::Execute: GetPhoneBookOptions resp:Max AAS String Len, Used AAS records, Total AAS records" />
        <string id="Event.WmRil_PhonebookGetPBOptions_MaxEmails_MaxEmailLen"     value="[WmRil::Phonebook]GetPhonebookOptionsClass::Execute: GetPhoneBookOptions resp:Max Num of Emails, Max Email Len" />
        <string id="Event.WmRil_PhonebookGetPBOptions_MaxGroups"                 value="[WmRil::Phonebook]GetPhonebookOptionsClass::Execute: GetPhoneBookOptions resp:Max Num of groups" />
        <string id="Event.WmRil_PhonebookGetPBOptions_MaxGASStrLen_UsedGASRec_TotalGASRec"       value="[WmRil::Phonebook]GetPhonebookOptionsClass::Execute: GetPhoneBookOptions resp:Max GAS String Len, Used GAS records, Total GAS records" />
        <string id="Event.WmRil_PhonebookGetPBOptions_MaxSecondNameStrLen"       value="[WmRil::Phonebook]GetPhonebookOptionsClass::Execute: GetPhoneBookOptions resp:Max Second Name String Len" />
        <string id="Event.WmRil_PhonebookGetPBOptions_PBIParams"                 value="[WmRil::Phonebook]GetPhonebookOptionsClass::Execute: PhoneBookInfoParamMask = %1" />
        <string id="Event.WmRil_PhonebookGetPBOptions_InputParams"               value="[WmRil::Phonebook]GetPhonebookOptionsClass::ValidateAndInitParams: GetPhonebookOptions input params: hUiccApp = %1, StoreLoc = %2(%3)" />
        <string id="Event.WmRil_PhonebookGetAllAddnNumStr_InputParams"           value="[WmRil::Phonebook]GetAllAdditionalNumberStringsClass::ValidateAndInitParams: GetAllAdditionalNumberStringsClass input params: hUiccApp" />
        <string id="Event.WmRil_PhonebookNoAASData"                value="[WmRil::Phonebook]GetAllAdditionalNumberStringsClass::Execute: QMI_PBM_GET_ALL_AAS_RESP has no AAS data" />
        <string id="Event.WmRil_PhonebookAASEntry_Size_NumId_AAS"  value="[WmRil::Phonebook]GetAllAdditionalNumberStringsClass::SendResponse: AAS Entry #, size, dwNumId, AAS" />
        <string id="Event.WmRil_PhonebookTotalSize_NumAAS"         value="[WmRil::Phonebook]GetAllAdditionalNumberStringsClass::SendResponse: Total size, num of AAS" />
        <string id="Event.WmRil_PhonebookSendEmptyListInResp"      value="[WmRil::Phonebook]GetAllAdditionalNumberStringsClass::SendEmptyListResponse: Sending an empty list in the response with total size, num of AAS" />
        <string id="Event.WmRil_PhonebookWriteAddnNumStr_InputParams"            value="[WmRil::Phonebook]WriteAdditionalNumberStringClass::ValidateAndInitParams: WriteAdditionalNumberString input params: hUiccApp = %1, NumId = %2, AAS tag = %3" />
        <string id="Event.WmRil_PhonebookSetAASReqData"            value="[WmRil::Phonebook]WriteAdditionalNumberStringClass::Execute: Set AAS Request data: Session = %1(%2), OpType = %3(%4), AASID = %5, AAS = %6" />
        <string id="Event.WmRil_PhonebookIndicationData"           value="[WmRil::Phonebook]WriteAdditionalNumberStringClass::ProcessInternalIndication: Indication data: hUiccApp = %1, OpType = %2(%3), NumId = %4" />
        <string id="Event.WmRil_PhonebookNotCorrectInd_WriteAddnNumStr"          value="[WmRil::Phonebook]WriteAdditionalNumberStringClass::ProcessInternalIndication: This is not the correct indication, re-register for the internal indication" />
        <string id="Event.WmRil_PhonebookSendResp_WriteAddnNumStr"               value="[WmRil::Phonebook]WriteAdditionalNumberStringClass::ProcessInternalIndication: Sending response" />
        <string id="Event.WmRil_PhonebookSendResp_WriteAddnNumStr_ProcessResp"   value="[WmRil::Phonebook]WriteAdditionalNumberStringClass::ProcessResponse: Sending response" />
        <string id="Event.WmRil_PhonebookDelAddnNumStr_InputParams"              value="[WmRil::Phonebook]DeleteAdditionalNumberStringClass::ValidateAndInitParams: hUiccApp, NumId" />
        <string id="Event.WmRil_PhonebookSetAASReqData_DelAddnNumStr"            value="[WmRil::Phonebook]DeleteAdditionalNumberStringClass::Execute: Set AAS Request data: Session = %1(%2), OpType = %3(%4), AASID = %5" />
        <string id="Event.WmRil_PhonebookIndicationData_DelAddnNumStr"           value="[WmRil::Phonebook]DeleteAdditionalNumberStringClass::ProcessInternalIndication: Indication data: hUiccApp = %1, OpType = %2(%3), NumId = %4" />
        <string id="Event.WmRil_PhonebookNotCorrectInd_DelAddnNumStr"            value="[WmRil::Phonebook]DeleteAdditionalNumberStringClass::ProcessInternalIndication: This is not the correct indication, re-register for the internal indication" />
        <string id="Event.WmRil_PhonebookSendResp_DelAddnNumStr"                 value="[WmRil::Phonebook]DeleteAdditionalNumberStringClass::ProcessInternalIndication: Sending response" />
        <string id="Event.WmRil_PhonebookSendResp_DelAddnNumStr_ProcessResp"     value="[WmRil::Phonebook]DeleteAdditionalNumberStringClass::ProcessResponse: Sending response" />
        <string id="Event.WmRil_PhonebookHardcodedEmergencyNosPresent"           value="[WmRil::Phonebook]GetAllEmergencyNumbersClass::Execute: %1 hardcoded emergency numbers are present" />
        <string id="Event.WmRil_PhonebookAddedEmergNumToList"      value="[WmRil::Phonebook]GetAllEmergencyNumbersClass::Execute: Successfully added a hardcoded emergency num to the list: %1" />
        <string id="Event.WmRil_PhonebookNVEmergencyNosPresent"    value="[WmRil::Phonebook]GetAllEmergencyNumbersClass::Execute: %1 NV emergency numbers are present" />
        <string id="Event.WmRil_PhonebookCardEmergencyNosPresent"  value="[WmRil::Phonebook]GetAllEmergencyNumbersClass::Execute: %1 card session emergency numbers are present" />
        <string id="Event.WmRil_PhonebookCardNumForSession"        value="[WmRil::Phonebook]GetAllEmergencyNumbersClass::Execute: %1 card emergency numbers are present for session = %2(%3)" />
        <string id="Event.WmRil_PhonebookNetworkEmergencyNosPresent"             value="[WmRil::Phonebook]GetAllEmergencyNumbersClass::Execute: %1 network session emergency numbers are present" />
        <string id="Event.WmRil_PhonebookNetworkNumForSession"     value="[WmRil::Phonebook]GetAllEmergencyNumbersClass::Execute: %1 network emergency numbers are present for session = %2(%3)" />
        <string id="Event.WmRil_PhonebookPbmEmergCat"              value="[WmRil::Phonebook]GetAllEmergencyNumbersClass::AddEmergNumToList: PBM emergency cat" />
        <string id="Event.WmRil_PhonebookFoundDupEmergNum"         value="[WmRil::Phonebook]GetAllEmergencyNumbersClass::AddEmergNumToList: Found duplicate Emerg num in the list, ignore the current one" />
        <string id="Event.WmRil_PhonebookTotalSize_NoEmergNum"     value="[WmRil::Phonebook]GetAllEmergencyNumbersClass::SendResponse: Total size = %1, num of emergency numbers =%2 " />
        <string id="Event.WmRil_PhonebookReportState"              value="[WmRil::Phonebook]ADNCapsInfoClass::ReportState: isEFADNPresent, maxGrp, maxAddNum, maxEmail, isEFSNEPresent, issEFAASPresent " />
        <string id="Event.WmRil_PhonebookSessionType_StoreLocBitMask"            value="[WmRil::Phonebook]PBSessionInfoClass::ReportState: PBM session type = %1(%2), StoreLocBitMask = %3(%4) " />
        <string id="Event.WmRil_PhonebookNumId_Text"               value="[WmRil::Phonebook]PBSessionInfoClass::ReportState: wszText, dwNumId " />
        <string id="Event.WmRil_PhonebookPBMAlphaTag_RilAASTag"    value="[WmRil::Phonebook]PBSessionInfoClass::SetAASList: Copied the PBM alpha tag = %1 to RIL AAS tag = %2 " />
        <string id="Event.WmRil_PhonebookNoUpdateListEmpty"        value="[WmRil::Phonebook]PBSessionInfoClass::UpdateAASList: NO Update to the list as the list is empty " />
        <string id="Event.WmRil_PhonebookAddingNewEntryAASList"    value="[WmRil::Phonebook]PBSessionInfoClass::UpdateAASList: Adding a new entry to the AAS List with: alpha, NumId  " />
        <string id="Event.WmRil_PhonebookModifiedEntryAASList"     value="[WmRil::Phonebook]PBSessionInfoClass::UpdateAASList: Modified an entry in the AAS List with data: new alpha, NumId  " />
        <string id="Event.WmRil_PhonebookDeletingEntryAASList"     value="[WmRil::Phonebook]PBSessionInfoClass::UpdateAASList: Deleting an entry with NumId = %1 from the AAS list " />
        <string id="Event.WmRil_PhonebookIndRegReq_RegMask"        value="[WmRil::Phonebook]PhonebookServiceClass::Initialize: QMI_PBM_INDICATION_REGISTER_REQ reg_mask = %1 " />
        <string id="Event.WmRil_PhonebookIndRegRespRegMask"        value="[WmRil::Phonebook]PhonebookServiceClass::Initialize: reg_mask in QMI_PBM_INDICATION_REGISTER_RESP = %1 " />
        <string id="Event.WmRil_PhonebookRegSuccessForPbEvents"    value="[WmRil::Phonebook]PhonebookServiceClass::Initialize: Registered successfully for PHONEBOOK EVENTS " />
        <string id="Event.WmRil_PhonebookUnexpectedIndication"     value="[WmRil::Phonebook]PhonebookServiceClass::ProcessExternalIndication: Unexpected indication %1(%2) " />
        <string id="Event.WmRil_PhonebookUnexpectedQmiService"     value="[WmRil::Phonebook]PhonebookServiceClass::ProcessExternalIndication: Unexpected QMI service %1(%2) " />
        <string id="Event.WmRil_PhonebookNumInstancesPbReadyInfo"  value="[WmRil::Phonebook]PhonebookServiceClass::ProcessAllPBInitDoneInd: Num of instances of PBReadyInfo = %1, Session type = %2(%3), pb_bit_mask = %4 " />
        <string id="Event.WmRil_PhonebookPbmRefInd_SessionType_PbType_Status"    value="[WmRil::Phonebook]PhonebookServiceClass::ProcessPBRefreshInd: Received QMI_PBM_REFRESH_IND. Session_type =%1(%2), pb_type=%3, status=%4 " />
        <string id="Event.WmRil_PhonebookPbmRefIndIgnore"          value="[WmRil::Phonebook]PhonebookServiceClass::ProcessPBRefreshInd: PBM_REFRESH_IND ignore, invalid refresh status " />
        <string id="Event.WmRil_PhonebookPbmReadyInd_SessionType_PbType"         value="[WmRil::Phonebook]PhonebookServiceClass::ProcessPBReadyInd: Received QMI_PBM_PB_READY_IND. Session_type =%1(%2), pb_type =%3 " />
        <string id="Event.WmRil_PhonebookPbmRecordUpdateInd_SessionType_PbType_Operation_RecId"         value="[WmRil::Phonebook]PhonebookServiceClass::ProcessRecordUpdateInd: Received QMI_PBM_RECORD_UPDATE_IND_V01. Session_type =%1(%2), pb_type =%3, Operation =%4(%5), record_id =%6 " />
        <string id="Event.WmRil_PhonebookPbmAasUpdateInd_SessionType_Operation_AasId_AlphaLen"          value="[WmRil::Phonebook]PhonebookServiceClass::ProcessAASUpdateInd: Received QMI_PBM_AAS_UPDATE_IND_V01. Session_type =%1(%2), Operation =%3(%4), aas_id =%5, alpha_len =%6 " />
        <string id="Event.WmRil_PhonebookAlphaTag"                 value="[WmRil::Phonebook]PhonebookServiceClass::ProcessAASUpdateInd: Alpha tag = %1 " />
        <string id="Event.WmRil_PhonebookStorelocBitMask"          value="[WmRil::Phonebook]PhonebookServiceClass::AddPBMSessionInfo: Calculated value of storeloc bit mask: %1 " />
        <string id="Event.WmRil_PhonebookStorelocBitMask_Old"      value="[WmRil::Phonebook]PhonebookServiceClass::AddPBMSessionInfo: session found in the list: old_bit_mask = %1 " />
        <string id="Event.WmRil_PhonebookStorelocBitMask_New"      value="[WmRil::Phonebook]PhonebookServiceClass::AddPBMSessionInfo: Bit mask of the entry is updated, mask = %1 " />
        <string id="Event.WmRil_PhonebookNoNewEntryAdded"          value="[WmRil::Phonebook]PhonebookServiceClass::AddPBMSessionInfo: No New Entry added as no matching hUiccApp found " />
        <string id="Event.WmRil_PhonebookSendPbReadyState"         value="[WmRil::Phonebook]PhonebookServiceClass::AddPBMSessionInfo: send a RIL_NOTIFY_PHONEBOOKREADYSTATE " />
        <string id="Event.WmRil_PhonebookClearingAASList"          value="[WmRil::Phonebook]PhonebookServiceClass::AddPBMSessionInfo: Clearing the AAS list for the session = %1(%2) " />
        <string id="Event.WmRil_PhonebookPbType_StoreLocMask_SLBitMask_tempSLBitMask"       value="[WmRil::Phonebook]PhonebookServiceClass::AddPBMSessionInfo: PB type =%1,StoreLocmask =%2,StoreLocBitMask =%3,tempStoreLocBitMask =%4 " />
        <string id="Event.WmRil_PhonebookUpdateSessionInfoReqIgnored"            value="[WmRil::Phonebook]PhonebookServiceClass::AddPBMSessionInfo: Update session info request ignored. No matching entry found in the list " />
        <string id="Event.WmRil_PhonebookNoMatchingEntryFound_SetAASList"        value="[WmRil::Phonebook]PhonebookServiceClass::SetAASList: no matching entry found in the list for the session = %1(%2) " />
        <string id="Event.WmRil_PhonebookNoMatchingSessionInList_GetAASList"     value="[WmRil::Phonebook]PhonebookServiceClass::GetAASList: No matching session in the list " />
        <string id="Event.WmRil_PhonebookADNCapabilityNotPresent_SessionType"    value="[WmRil::Phonebook]PhonebookServiceClass::GetADNCapsInfo: ADN capability not present in the phonebook service cache, send a QMI_PBM_GET_PB_CAPS. QMI_PBM_GET_PB_CAPABILITIES_REQ params: session_type =%1(%2) " />
        <string id="Event.WmRil_PhonebookUpdateADNCapCahce"        value="[WmRil::Phonebook]PhonebookServiceClass::GetADNCapsInfo: Updating the ADN capability cache " />
        <string id="Event.WmRil_PhonebookADNCapPresent"            value="[WmRil::Phonebook]PhonebookServiceClass::GetADNCapsInfo: ADN capability already present in the phonebook service cache " />
        <string id="Event.WmRil_PhonebookNoMatchingSession_GetADNCapsInfo"       value="[WmRil::Phonebook]PhonebookServiceClass::GetADNCapsInfo: No matching session in the list " />
        <string id="Event.WmRil_PhonebookNoMatchingSession_SetADNCapsInfo"       value="[WmRil::Phonebook]PhonebookServiceClass::SetADNCapsInfo: No matching session in the list " />

        <!-- WMS String IDs and Values -->

        <!-- MO SMS -->
        <string id="Event.WmRil_WMSSendMsgID"                      value="[WmRil::Wms]SendMsgClass::Execute: Processing RIL Command ID = %1 " />
        <string id="Event.WmRil_WMSSendMsgIMSFirst"                value="[WmRil::Wms]SendMsgClass::DetermineIMSRetryStatus: First-time IMS send - Format: %1 " />
        <string id="Event.WmRil_WMSSendMsgIMSSecond"               value="[WmRil::Wms]SendMsgClass::DetermineIMSRetryStatus: Second-time IMS send - Format: %1 " />
        <string id="Event.WmRil_WMSHuiccAppMatch"                  value="[WmRil::Wms]SendMsgClass::ValidateISIMhUiccApp: User-provided hUiccApp matches " />
        <string id="Event.WmRil_WMSRilMsgParameters"               value="[WmRil::Wms]SMSServiceClass::ConvertRILMESSAGEToQMIRawMsg: RilMsg.dwParams: %1, RilMsg.dwType: %2, RilMsg.dwFlags: %3 " />
        <string id="Event.WmRil_WMSMsgLength"                      value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRawMessage: Message Length: %1 " />
        <string id="Event.WmRil_WMSMsgID"                          value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRawMessage: Message ID: %1 " />
        <string id="Event.WmRil_WMSHdrLength"                      value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRawMessage: Header Length: %1 " />
        <string id="Event.WmRil_WMSHdrBytesDecoded"                value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRawMessage: UDH Bytes Decoded: %1 " />
        <string id="Event.WmRil_WMSMsgEncoding"                    value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRawMessage: Message Encoding: %1 " />
        <string id="Event.WmRil_WMSDataLength"                     value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRawMessage: User Data Length: %1 " />
        <string id="Event.WmRil_WMSMsgPriority"                    value="[WmRil::Wms]SMSServiceClass::ConvertRILPriorityToRawPriority: Message Priority: %1 " />
        <string id="Event.WmRil_WMSMsgPrivacy"                     value="[WmRil::Wms]SMSServiceClass::ConvertRILPrivacyToRawPrivacy: Message Privacy: %1 " />
        <string id="Event.WmRil_WMSAckRequests"                    value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRawMessage: Delivery Ack: %1, User Ack: %2 " />
        <string id="Event.WmRil_WMSAddrParams"                     value="[WmRil::Wms]SMSServiceClass::ConvertRILAddressToRawAddress: RilAddress cbSize: %1, dwType: %2, dwNumPlan: %3 " />
        <string id="Event.WmRil_WMSAddrParamNotPresent"            value="[WmRil::Wms]SMSServiceClass::ConvertRILAddressToRawAddress: Address Param marked as not available " />
        <string id="Event.WmRil_WMSAddrLenError"                   value="[WmRil::Wms]SMSServiceClass::ConvertRILAddressToRawAddress: StringCchLengthW Failed " />
        <string id="Event.WmRil_WMSInvalidAddrLen"                 value="[WmRil::Wms]SMSServiceClass::ConvertRILAddressToRawAddress: Address Length exceeds Maximum Address Length: %1 " />
        <string id="Event.WmRil_WMSConvertTCharStrToCharStrFailed" value="[WmRil::Wms]SMSServiceClass::ConvertRILAddressToRawAddress: ConvertTCharStrToCharStr returned false " />
        <string id="Event.WmRil_WMSAddress"                        value="[WmRil::Wms]SMSServiceClass::ConvertRILAddressToRawAddress: wszAddress=%1, numlen: %2, dwParams: %3 " />
        <string id="Event.WmRil_WMSInvalidMsgMode"                 value="[WmRil::Wms]SMSServiceClass::ConvertRILAddressToRawAddress: Unexpected message mode: %1 " />
        <string id="Event.WmRil_WMSInvalidMessageLength"           value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRawMessage: Encoded data has too many bytes " />
        <string id="Event.WmRil_WMSTeleservice"                    value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTADataToRawMessage: Teleservice: %1 " />
        <string id="Event.WmRil_WMSMissingBCSrvCategory"           value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTADataToRawMessage: Service Category is missing for BC Message " />
        <string id="Event.WmRil_WMSSubAddrParams"                  value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: RilSubAddress cbSize: %1, dwType: %2 " />
        <string id="Event.WmRil_WMSSubAddrParamNotPresent"         value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: SubAddress type was not provided " />
        <string id="Event.WmRil_WMSInvalidSubAddrType"             value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: Invalid Sub Address Type " />
        <string id="Event.WmRil_WMSNoHashAtStartInSubAddr"         value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: SubAddress should start with # " />
        <string id="Event.WmRil_WMSInvalidSubAddrLength"           value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: Unable to determine Sub Address length " />
        <string id="Event.WmRil_WMSSubAddrLengthZero"              value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: SubAddress length is zero " />
        <string id="Event.WmRil_WMSSubAddrLengthMax"               value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: SubAddr length exceeds max: %1 " />
        <string id="Event.WmRil_WMSSubAddrStrConversionFailed"     value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: String conversion failed " />
        <string id="Event.WmRil_WMSSubAddrLengthFailed"            value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: Failed to get the length of the number string " />
        <string id="Event.WmRil_WMSSubAddrByteConversionFailed"    value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: No bytes were converted to DTMF " />
        <string id="Event.WmRil_WMSSubAddrParamMissing"            value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: Sub Address param is missing " />
        <string id="Event.WmRil_WMSSubAddrAddressParams"           value="[WmRil::Wms]SMSServiceClass::ConvertRILSubAddressToRawSubAddress: wszSubAddress=%1, numlen: %2, dwParams: %3 " />
        <string id="Event.WmRil_WMSInvalidBDLength"                value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTADataToRawMessage: Invalid BD len: %1 " />
        <string id="Event.WmRil_WMSInvalidParamSize"               value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTADataToRawMessage: Invalid parm size: %1 " />
        <string id="Event.WmRil_WMSInvalidRilMsgType"              value="[WmRil::Wms]SMSServiceClass::ConvertRILMESSAGEToQMIRawMsg: Invalid type in RIL Message " />
        <string id="Event.WmRil_WMSSMSCStringConversionFailed"     value="[WmRil::Wms]SMSServiceClass::ConvertTPDUDataToRawMessage: SMSC String Conversion Failed " />
        <string id="Event.WmRil_WMSInvalidSMSCLength"              value="[WmRil::Wms]SMSServiceClass::ConvertTPDUDataToRawMessage: SMSC length is too long: %1 " />
        <string id="Event.WmRil_WMSInvalidValidityFormat"          value="[WmRil::Wms]SMSServiceClass::ConvertValidityFormatToRawValidityFormat: Received unknown validity format: %1 " />
        <string id="Event.WmRil_WMSDCSType"                        value="[WmRil::Wms]SMSServiceClass::ConvertRILDCSToRawDCS: DCS type: %1 " />
        <string id="Event.WmRil_WMSMsgClass"                       value="[WmRil::Wms]SMSServiceClass::ConvertRILDCSToRawDCS: Msg Class: %1 " />
        <string id="Event.WmRil_WMSMsgWaitingindication"           value="[WmRil::Wms]SMSServiceClass::ConvertRILDCSToRawDCS: Message Waiting Indication: %1 " />
        <string id="Event.WmRil_WMSRelativeInvalidYear"            value="[WmRil::Wms]SMSServiceClass::ConvertRelativeTimeToRawMessage: Year is invalid: %1 " />
        <string id="Event.WmRil_WMSRelativeInvalidMonth"           value="[WmRil::Wms]SMSServiceClass::ConvertRelativeTimeToRawMessage: Month is invalid: %1 " />
        <string id="Event.WmRil_WMSRelativeInvalidDay"             value="[WmRil::Wms]SMSServiceClass::ConvertRelativeTimeToRawMessage: Day is invalid: %1 " />
        <string id="Event.WmRil_WMSRelativeInvalidHour"            value="[WmRil::Wms]SMSServiceClass::ConvertRelativeTimeToRawMessage: Hour is invalid: %1 " />
        <string id="Event.WmRil_WMSRelativeInvalidMinute"          value="[WmRil::Wms]SMSServiceClass::ConvertRelativeTimeToRawMessage: Minute is invalid: %1 " />
        <string id="Event.WmRil_WMSAbsoluteInvalidYear"            value="[WmRil::Wms]SMSServiceClass::ConvertTimestampToRawMessage: Year is invalid: %1 " />
        <string id="Event.WmRil_WMSAbsoluteInvalidMonth"           value="[WmRil::Wms]SMSServiceClass::ConvertTimestampToRawMessage: Month is invalid: %1 " />
        <string id="Event.WmRil_WMSAbsoluteInvalidDay"             value="[WmRil::Wms]SMSServiceClass::ConvertTimestampToRawMessage: Day is invalid: %1 " />
        <string id="Event.WmRil_WMSAbsoluteInvalidHour"            value="[WmRil::Wms]SMSServiceClass::ConvertTimestampToRawMessage: Hour is invalid: %1 " />
        <string id="Event.WmRil_WMSAbsoluteInvalidMinute"          value="[WmRil::Wms]SMSServiceClass::ConvertTimestampToRawMessage: Minute is invalid: %1 " />
        <string id="Event.WmRil_WMSAbsoluteInvalidSecond"          value="[WmRil::Wms]SMSServiceClass::ConvertTimestampToRawMessage: Second is invalid: %1 " />
        <string id="Event.WmRil_WMSInvalidMsgHdrLength"            value="[WmRil::Wms]SMSServiceClass::ConvertUserDataToRawUserData: Invalid Length, Msg: %1, Hdr: %2 " />
        <string id="Event.WmRil_WMSZeroMessageLength"              value="[WmRil::Wms]SMSServiceClass::ConvertRILMsgBodyToUserData: Message Body is empty " />
        <string id="Event.WmRil_WMSMaxMessageLength"               value="[WmRil::Wms]SMSServiceClass::ConvertRILMsgBodyToUserData: Message Body exceeds maximum length: %1 " />
        <string id="Event.WmRil_WMSNullPointerToUDH"               value="[WmRil::Wms]SMSServiceClass::DecodeUserDataHeader: Null Pointer Assignment " />
        <string id="Event.WmRil_WMSUDHLengthMorethanUD"            value="[WmRil::Wms]SMSServiceClass::DecodeUserDataHeader: UDHL(%1) exceeds UD length(%2) or max length " />
        <string id="Event.WmRil_WMSZeroHeaders"                    value="[WmRil::Wms]SMSServiceClass::EncodeUserDataHeader: Number of Headers is zero " />
        <string id="Event.WmRil_WMSNumberOfHeaders"                value="[WmRil::Wms]SMSServiceClass::EncodeGWUserData: Number of Headers: %1 " />

        <!-- MT SMS -->
        <string id="Event.WmRil_WMSSourceID"                        value="[WmRil::Wms]SMSServiceClass::ProcessExternalIndication: Unexpected sourceID: %1 " />
        <string id="Event.WmRil_WMSServiceIDAndMessageID"           value="[WmRil::Wms]SMSServiceClass::ProcessExternalIndication: ServiceID: %1, MessageID: %2 " />
        <string id="Event.WmRil_WMSMismatchBlobSizeAndWMSEvtRptInd" value="[WmRil::Wms]SMSServiceClass::ProcessWmsEventReportInd: Blob size (%1) does not match WmsEvtRptInd size (%2) " />
        <string id="Event.WmRil_WMSMTSMSStoreUIM"                   value="[WmRil::Wms]SMSServiceClass::HandleStoreAndNotifyMessagesOnUim: MT message stored on UIM " />
        <string id="Event.WmRil_WMSMessageModeInvalid"              value="[WmRil::Wms]SMSServiceClass::HandleStoreAndNotifyMessagesOnUim: Message mode invalid, cannot determine hUiccApp " />
        <string id="Event.WmRil_WMSInvalidSubscriptionIndex"        value="[WmRil::Wms]UIMServiceClass::GethUiccAppFromSubscriptionIdxAndWMSMsgMode: Invalid subscription index: %1 " />
        <string id="Event.WmRil_WMSInvalidWMSMessageMode"           value="[WmRil::Wms]UIMServiceClass::GethUiccAppFromSubscriptionIdxAndWMSMsgMode: Invalid wms message mode: %1 " />
        <string id="Event.WmRil_WMSFailFindinghUiccApp"             value="[WmRil::Wms]UIMServiceClass::GethUiccAppFromSubscriptionIdxAndWMSMsgMode: Fail to find hUiccApp from subscription index %1 and wms msg mode: %2 " />
        <string id="Event.WmRil_WMSMTSMSStoreNV"                    value="[WmRil::Wms]SMSServiceClass::HandleStoreAndNotifyMessagesOnNv: MT message stored on NV - likely voicemail indicator " />
        <string id="Event.WmRil_WMSNVStorageIndex"                  value="[WmRil::Wms]SMSServiceClass::HandleStoreAndNotifyMessagesOnNv: Storage Index: %1 " />
        <string id="Event.WmRil_WMSNVInvalidMsgMode"                value="[WmRil::Wms]SMSServiceClass::HandleStoreAndNotifyMessagesOnNv: Message mode invalid, cannot call raw read " />
        <string id="Event.WmRil_WMSNVRawReadRequestFailed"          value="[WmRil::Wms]SMSServiceClass::HandleStoreAndNotifyMessagesOnNv: Failed to send: %1 " />
        <string id="Event.WmRil_WMSNVRespError"                     value="[WmRil::Wms]SMSServiceClass::HandleStoreAndNotifyMessagesOnNv: QMI Result = %1,  Error = %2(%3) " />
        <string id="Event.WmRil_WMSMTSMSFormat"                     value="[WmRil::Wms]SMSServiceClass::ConvertQMIMessageToRILMESSAGE: Raw Message Format: %1 " />
        <string id="Event.WmRil_WMSMTInvalidSMSCOffset"             value="[WmRil::Wms]SMSServiceClass::ConvertQMIMessageToRILMESSAGE: SMSC offset is greater than MESSAGE LENGTH MAX, offset: %1 " />
        <string id="Event.WmRil_WMSMTSMSDeliver"                    value="[WmRil::Wms]SMSServiceClass::ConvertQMIMessageToRILMESSAGE: SMS-DELIVER " />
        <string id="Event.WmRil_WMSMTSMSStatusReport"               value="[WmRil::Wms]SMSServiceClass::ConvertQMIMessageToRILMESSAGE: SMS-STATUS-REPORT " />
        <string id="Event.WmRil_WMSMTInvalidMsgType"                value="[WmRil::Wms]SMSServiceClass::ConvertQMIMessageToRILMESSAGE: Invalid Type in MT Cases " />
        <string id="Event.WmRil_WMSMTAddrLenLong"                   value="[WmRil::Wms]SMSServiceClass::ConvertRawAddressToRILAddress: Addr len too long: %1 " />
        <string id="Event.WmRil_WMSMTExceedsNumOfDigits"            value="[WmRil::Wms]SMSServiceClass::ConvertRawAddressToRILAddress: Number of Digits of Addr exceeds max limit: %1 " />
        <string id="Event.WmRil_WMSMTDecodedAddrTooLong"            value="[WmRil::Wms]SMSServiceClass::ConvertRawAddressToRILAddress: Decoding: Address too long: %1 > %2 " />
        <string id="Event.WmRil_WMSMTRilAddrNumberParams"           value="[WmRil::Wms]SMSServiceClass::ConvertRawAddressToRILAddress: cbSize: %1, numberType: %2, numberPlan: %3 " />
        <string id="Event.WmRil_WMSMTRilAddrParams"                 value="[WmRil::Wms]SMSServiceClass::ConvertRawAddressToRILAddress: wszAddress: %1, dwParams: %2 " />
        <string id="Event.WmRil_WMSMTDCS"                           value="[WmRil::Wms]SMSServiceClass::ConvertRawDCSToRILDCS: DCS: %1 " />
        <string id="Event.WmRil_WMSMTDCSAlphabet"                   value="[WmRil::Wms]SMSServiceClass::ConvertRawAlphabetToRILAlphabet: DCS Alphabet: %1 " />
        <string id="Event.WmRil_WMSMTDeliverInvalidByteStream"      value="[WmRil::Wms]SMSServiceClass::ConvertGWPPDeliverToRILMESSAGE: pos+7 is greater than MESSAGE LENGTH MAX " />
        <string id="Event.WmRil_WMSMTInvalidBCDDigit"               value="[WmRil::Wms]Util::ConvertBCDToINT: Invalid BCD digit: %1 " />
        <string id="Event.WmRil_WMSMTInvalidMonth"                  value="[WmRil::Wms]SMSServiceClass::ConvertRawTimeToRILTime: Month is invalid: %1 " />
        <string id="Event.WmRil_WMSMTInvalidDay"                    value="[WmRil::Wms]SMSServiceClass::ConvertRawTimeToRILTime: Day is invalid: %1 " />
        <string id="Event.WmRil_WMSMTInvalidHour"                   value="[WmRil::Wms]SMSServiceClass::ConvertRawTimeToRILTime: Hour is invalid: %1 " />
        <string id="Event.WmRil_WMSMTInvalidMinute"                 value="[WmRil::Wms]SMSServiceClass::ConvertRawTimeToRILTime: Minute is invalid: %1 " />
        <string id="Event.WmRil_WMSMTInvalidSecond"                 value="[WmRil::Wms]SMSServiceClass::ConvertRawTimeToRILTime: Second is invalid: %1 " />
        <string id="Event.WmRil_WMSMTTimeStamp"                     value="[WmRil::Wms]SMSServiceClass::ConvertRawTimeToRILTime: Year: %1, Month: %2, DayOfWeek: %3, Day: %4, Hour: %5, Minute: %6, Second: %7 " />
        <string id="Event.WmRil_WMSMTZeroUDLength"                  value="[WmRil::Wms]SMSServiceClass::DecodeGWUserData: UD Length is zero " />
        <string id="Event.WmRil_WMSMTInvalidUDLength"               value="[WmRil::Wms]SMSServiceClass::DecodeGWUserData: User Data Length: %1 > Max value " />
        <string id="Event.WmRil_WMSMTUDHMoreThanUD"                 value="[WmRil::Wms]SMSServiceClass::DecodeGWUserData: User Data Header Length: %1 > Total UD Length: %2 " />
        <string id="Event.WmRil_WMSMTMessageLength"                 value="[WmRil::Wms]SMSServiceClass::DecodeGWUserData: Message Length = %1, smLength = %2 " />
        <string id="Event.WmRil_WMSMTStatusInvalidByteStream"       value="[WmRil::Wms]SMSServiceClass::ConvertGWPPStatusToRILMESSAGE: pos+14 is greater than MESSAGE LENGTH MAX " />
        <string id="Event.WmRil_WMSBCInvalidDataLength"             value="[WmRil::Wms]SMSServiceClass::ConvertGWBCToRILMESSAGE: Data Length (%1) is less than GW_CB_PAGE_SIZE or (Data Length less than GW_CB_PAGE_HEADER_LEN) " />
        <string id="Event.WmRil_WMSBCInvalidPageNumber"             value="[WmRil::Wms]SMSServiceClass::ConvertGWBCPageHeaderToRILMESSAGE: Invalid GW CB, page number greater than total pages, (%1 greater than %2) " />
        <string id="Event.WmRil_WMSBCPageHeaderParams"              value="[WmRil::Wms]SMSServiceClass::ConvertGWBCPageHeaderToRILMESSAGE: Serial #: %1, Geo Scope: %2, Msg Code: %3, Update #: %4, Msg ID: %5, Page #: %6, Total Pages: %7 " />
        <string id="Event.WmRil_WMSBCInvalidMessageLength"          value="[WmRil::Wms]SMSServiceClass::ConvertGWBCToRILMESSAGE: messageLength: %1 exceeds GW BC Max " />
        <string id="Event.WmRil_WMSBCParams"                        value="[WmRil::Wms]SMSServiceClass::ConvertGWBCToRILMESSAGE: RilMsg.dwParams: %1, cchMsgLength: %2 " />
        <string id="Event.WmRil_WMSMTInvalidMessageLength"          value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Invalid Message Length: %1 " />
        <string id="Event.WmRil_WMSMTInvalidMessageType"            value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Invalid Message Type: %1" />
        <string id="Event.WmRil_WMSMTMessageType"                   value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Message type: %1 " />
        <string id="Event.WmRil_WMSMTIncorrectDecodedMsgSize"       value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Decoding: Msg size: %1 incorrect" />
        <string id="Event.WmRil_WMSMTParamIDExceedsMsgSize"         value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Parameter (ID = %1) with len: %2 extends beyond msg size %3" />
        <string id="Event.WmRil_WMSMTDupParamID"                    value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Duplicate Parameter ID: %1" />
        <string id="Event.WmRil_WMSMTTeleservice"                   value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Telservice ID: %1" />
        <string id="Event.WmRil_WMSMTBadParamLength"                value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Bad Param length: %2 for Param: %1" />
        <string id="Event.WmRil_WMSMTServiceID"                     value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Service ID: %1" />
        <string id="Event.WmRil_WMSMTSubAddrInvalidDigits"          value="[WmRil::Wms]SMSServiceClass::ConvertRawSubAddressToRILSubAddress: SubAddress digits number too big: %1 " />
        <string id="Event.WmRil_WMSMTSubAddrInvalidDecodedAddr"     value="[WmRil::Wms]SMSServiceClass::ConvertRawSubAddressToRILSubAddress: Decoding: SubAddress too long: %1 > %2 " />
        <string id="Event.WmRil_WMSMTSubAddrParams"                 value="[WmRil::Wms]SMSServiceClass::ConvertRawSubAddressToRILSubAddress: cbSize: %1, dwParams: %2, dwType: %3, wszAddress: %4 " />
        <string id="Event.WmRil_WMSMTInvalidBearerDataLength"       value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Decoding: Bearer data len: %1 extends beyond msg size: %2 " />
        <string id="Event.WmRil_WMSMTInvalidParmID"                 value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Decoding: Invalid parm ID: %1 " />
        <string id="Event.WmRil_WMSMTMandatoryParamsMissing"        value="[WmRil::Wms]SMSServiceClass::ConvertCDMAOTAToRILMESSAGE: Mandatory Params Missing for %1 " />
        <string id="Event.WmRil_WMSMTMWINumberOfMessages"           value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRILMESSAGE: MWI format, dwNumMsgs: %1 " />
        <string id="Event.WmRil_WMSMTInvalidBDLength"               value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRILMESSAGE: Message is too short: %1 " />
        <string id="Event.WmRil_WMSMTInvalidDecodedBDLength"        value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRILMESSAGE: Parameter (id=%1) position (%2) extends beyond BD size (%3) " />
        <string id="Event.WmRil_WMSMTBDDupParamID"                  value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRILMESSAGE: Duplicate Parameter ID: %1 " />
        <string id="Event.WmRil_WMSMTInvalidBDParamLen"             value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRILMESSAGE: Decoding: Param ID: %1, Param Len: %2, BD Len: %3 " />
        <string id="Event.WmRil_WMSMTInvalidSCTS"                   value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRILMESSAGE: pos + rawMsgPosition + 7 is greater than WMS_MESSAGE_LENGTH_MAX_V01(255) " />
        <string id="Event.WmRil_WMSMTInvalidNumberOfMessages"       value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRILMESSAGE: Param out of Range: %1 " />
        <string id="Event.WmRil_WMSMTNumberOfMessages"              value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRILMESSAGE: Number of Messages: %1 " />
        <string id="Event.WmRil_WMSMTUnsupportedParamID"            value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRILMESSAGE: Unsupported Param ID: %1, Param Len: %2 " />
        <string id="Event.WmRil_WMSMTInvalidBDMessageType"          value="[WmRil::Wms]SMSServiceClass::ConvertBearerDataToRILMESSAGE: Invalid BD Message Type " />
        <string id="Event.WmRil_WMSMTEncodingType"                  value="[WmRil::Wms]SMSServiceClass::ConvertUserDataToRILMESSAGE: Encoding Type: %1 " />
        <string id="Event.WmRil_WMSMTNumberOfDigits"                value="[WmRil::Wms]SMSServiceClass::ConvertUserDataToRILMESSAGE: Number Of Digits in User Data: %1 " />
        <string id="Event.WmRil_WMSMTInvalidBDUserData"             value="[WmRil::Wms]SMSServiceClass::ConvertUserDataToRILMESSAGE: Decoding: BD user data too big. len: %1 " />
        <string id="Event.WmRil_WMSMTUDHPresent"                    value="[WmRil::Wms]SMSServiceClass::ConvertUserDataToRILMESSAGE: User Data Header present: %1 " />
        <string id="Event.WmRil_WMSMTUDHLMoreThanUDH"               value="[WmRil::Wms]SMSServiceClass::DecodeCDMAUserDataHeader: User Data Header Length: %1 is more than User Data Length: %2" />
        <string id="Event.WmRil_WMSMTHeaderParams"                  value="[WmRil::Wms]SMSServiceClass::DecodeCDMAUserDataHeader: Header Length: %1, Number of Headers: %2" />
        <string id="Event.WmRil_WMSMTInvalidTLMsgType"              value="[WmRil::Wms]SMSServiceClass::ConvertUserDataToRILMESSAGE: We should not be here. tlMsgType: %1, serviceID: %2, dwParams: %3" />
        <string id="Event.WmRil_WMSCAMERecordType"                  value="[WmRil::Wms]SMSServiceClass::DecodeCDMACMASUserData: CMAE Record Type: %1 detected " />
        <string id="Event.WmRil_WMSInvalidCMAEDataLength"           value="[WmRil::Wms]SMSServiceClass::DecodeCDMACMASUserData: CMAE Record Type 0 has invalid data length: %1 " />
        <string id="Event.WmRil_WMSInvalidCMAERecord"               value="[WmRil::Wms]SMSServiceClass::DecodeCDMACMASUserData: Invalid CMAE Record Type: %1 " />
        <string id="Event.WmRil_WMSCMAERecordLength"                value="[WmRil::Wms]SMSServiceClass::DecodeCDMACMASUserData: CMAE Record Length: %1 " />
        <string id="Event.WmRil_WMSInvalidCMAERecordLength"         value="[WmRil::Wms]SMSServiceClass::DecodeCDMACMASUserData: Invalid CMAE Record Length: %1 " />
        <string id="Event.WmRil_WMSZeroCMAERecords"                 value="[WmRil::Wms]SMSServiceClass::DecodeCDMACMASUserData: No records found as part of the CMAS message " />
        <string id="Event.WmRil_WMSCMAERecord0NotFound"             value="[WmRil::Wms]SMSServiceClass::DecodeCDMACMASUserData: CMAE Record 0 Not Found " />
        <string id="Event.WmRil_WMSMTInvalidRawMsgFormat"           value="[WmRil::Wms]SMSServiceClass::ConvertQMIMessageToRILMESSAGE: Invalid Message Format: %1 " />
        <string id="Event.WmRil_WMSNofityMsgInUICC"                 value="[WmRil::Wms]SMSServiceClass::HandleStoreAndNotifyMessagesOnUim: Notify RIL_NOTIFY_MESSAGE_IN_UICC " />
        <string id="Event.WmRil_WMSNotifyMessageonNV"               value="[WmRil::Wms]SMSServiceClass::HandleStoreAndNotifyMessagesOnNv: Notify RIL_NOTIFY_MESSAGE " />
        <string id="Event.WmRil_WMSInvalidSMSStoreLoc"              value="[WmRil::Wms]SMSServiceClass::ProcessWmsEventReportInd: Unknown SMS storage location " />
        <string id="Event.WmRil_WMSMTMessage"                       value="[WmRil::Wms]SMSServiceClass::HandleTransferRouteMessages: Transfer route MT message valid " />
        <string id="Event.WmRil_WMSMTMessageFormat"                 value="[WmRil::Wms]SMSServiceClass::HandleTransferRouteMessages: Message Format: %1" />
        <string id="Event.WmRil_WMSNoIMShUiccApp"                   value="[WmRil::Wms]SMSServiceClass::HandleTransferRouteMessages: Cannot determine IMS hUiccApp; dropping message " />
        <string id="Event.WmRil_WMSTransactionID"                   value="[WmRil::Wms]SMSServiceClass::HandleTransferRouteMessages: Received transaction_id: %1 " />
        <string id="Event.WmRil_WMSNotifyMTMessage"                 value="[WmRil::Wms]SMSServiceClass::HandleTransferRouteMessages: Notify RIL_NOTIFY_MESSAGE " />
        <string id="Event.WmRil_WMSNoNotification"                  value="[WmRil::Wms]SMSServiceClass::HandleTransferRouteMessages: Not currently sending notification for type: %1 " />
        <string id="Event.WmRil_WMSTLAckNotRequested"               value="[WmRil::Wms]SMSServiceClass::SendMsgAck: In CDMA and TL Ack not requested " />
        <string id="Event.WmRil_WMSNoAckForAckIndicator"            value="[WmRil::Wms]SMSServiceClass::SendMsgAck: ACK not needed to be sent by control point " />
        <string id="Event.WmRil_WMSBuildAckInfo"                    value="[WmRil::Wms]SMSServiceClass::BuildMsgAck: Txn ID: %1, Message Mode: %2, Success: %3 " />
        <string id="Event.WmRil_WMSQMIResultError"                  value="[WmRil::Wms]SMSServiceClass::SendMsgAck: QMI Result = %1 (%2),  Error = %3 " />
        <string id="Event.WmRil_WMSETWSMessage"                     value="[WmRil::Wms]SMSServiceClass::HandleETWSMessage: ETWS Message valid " />
        <string id="Event.WmRil_WMSInvalidETWSMsgLength"            value="[WmRil::Wms]SMSServiceClass::ConvertQMIETWSMessageToRILMessage: Data Length: %1 is more than ETWS Max Message Length " />
        <string id="Event.WmRil_WMSInvalidETWSPriMessageID"         value="[WmRil::Wms]SMSServiceClass::ConvertQMIETWSMessageToRILMessage: Invalid ETWS Message ID: %1 " />
        <string id="Event.WmRil_WMSInvalidETWSPriDataLength"        value="[WmRil::Wms]SMSServiceClass::ConvertQMIETWSMessageToRILMessage: Data length(%1) should be either 6 or 56 " />
        <string id="Event.WmRil_WMSETWSPriMsgParams"                value="[WmRil::Wms]SMSServiceClass::ConvertQMIETWSMessageToRILMessage: Serial #: %1, Geo Scope: %2, Msg Code: %3, Update #: %4, Msg ID: %5, Warning Type: %6, Emergency User Alert: %7, Message Pop Up: %8 " />
        <string id="Event.WmRil_WMSInvalidSecETWSMsgDataLength"     value="[WmRil::Wms]SMSServiceClass::ConvertQMIETWSMessageToRILMessage: Invalid input Data Length: %1 " />
        <string id="Event.WmRil_WMSSecETWSMsgInvalidPageNumber"     value="[WmRil::Wms]SMSServiceClass::ConvertQMIETWSMessageToRILMessage: Invalid GW CB, page number > total pages, %1 > %2 " />
        <string id="Event.WmRil_WMSSecETWSMsgInvalidMsgInfoLength"  value="[WmRil::Wms]SMSServiceClass::ConvertQMIETWSMessageToRILMessage: Invalid Message Information Length: %1 " />
        <string id="Event.WmRil_WMSInvalidETWSMessageType"          value="[WmRil::Wms]SMSServiceClass::ConvertQMIETWSMessageToRILMessage: Invalid ETWS Notification Type: %1 " />
        <string id="Event.WmRil_WMSETWSSecMsgParams"                value="[WmRil::Wms]SMSServiceClass::ConvertQMIETWSMessageToRILMessage: Serial #: %1, Geo Scope: %2, Msg Code: %3, Update #: %4, Msg ID: %5, Warning Type: %6, Emergency User Alert: %7, Message Pop Up: %8, Page #: %9, Total Pages: %10 " />
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
