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
<!-- <?xml version="1.0" encoding="UTF-16"?> -->
<instrumentationManifest
            xmlns="http://schemas.microsoft.com/win/2004/08/events"
            xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
            xmlns:xs="http://www.w3.org/2001/XMLSchema">
            
  <instrumentation>
    <events>
      <!--Publisher Info -->
      <provider name="Microsoft-WindowsPhone-CspWwan"
          guid="{578CD504-6DE5-4373-BBDB-84074AEEA257}"
          symbol="WINDOWSPHONE_EVENTLOG_CSPWWAN_PUBLISHER"
          resourceFileName="CmCspWwan.dll"
          messageFileName="CmCspWwan.dll">

        <!--Dont need to specify channels in Apollo -->
        <channels />

        <!--Kewords for ConnMgr Name Space -->
        
        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error"       message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Info"        message="$(string.Keyword.Info)" />
          <keyword mask="0x0000000000000008" name="Verbose"        message="$(string.Keyword.Verbose)" />
        </keywords>
        
        <!-- Keeping the mappings from CmServiceETW.man -->

        <!--Value to string maps for enumeration values -->
        <maps>
          <valueMap name="Result">
            <map value="0"     message="$(string.Result.CMRE_SUCCESS)" />
            <map value="13000" message="$(string.Result.CMRE_INVALID_REQUIREMENTS)" />
            <map value="13001" message="$(string.Result.CMRE_INVALID_PREFERENCES)" />
            <map value="13002" message="$(string.Result.CMRE_INVALID_SESSION)" />
            <map value="13003" message="$(string.Result.CMRE_INVALID_CONNECTION)" />
            <map value="13004" message="$(string.Result.CMRE_INVALID_CONNECTION_TYPE)" />
            <map value="13005" message="$(string.Result.CMRE_INVALID_DEVICE)" />
            <map value="13006" message="$(string.Result.CMRE_INVALID_PARAMETER)" />
            <map value="13007" message="$(string.Result.CMRE_INVALID_VERSION)" />
            <map value="13008" message="$(string.Result.CMRE_INVALID_HOST)" />
            <map value="13009" message="$(string.Result.CMRE_INCONSISTENT_CONFIGURATION)" />
            <map value="13010" message="$(string.Result.CMRE_INSUFFICIENT_BUFFER)" />
            <map value="13011" message="$(string.Result.CMRE_CONNECTION_ITERATION_NOT_STARTED)" />
            <map value="13012" message="$(string.Result.CMRE_NO_CONNECTIONS)" />
            <map value="13013" message="$(string.Result.CMRE_HOST_ADDRESS_ITERATION_NOT_STARTED)" />
            <map value="13014" message="$(string.Result.CMRE_NO_HOST_ADDRESSES)" />
            <map value="13015" message="$(string.Result.CMRE_CONNECTION_ACQUIRE_FAILED)" />
            <map value="13016" message="$(string.Result.CMRE_CONNECTION_RESOURCE_CONFLICT)" />
            <map value="13017" message="$(string.Result.CMRE_CONNECTION_ALREADY_ACQUIRED)" />
            <map value="13018" message="$(string.Result.CMRE_CONNECTION_NOT_ACQUIRED)" />
            <map value="13019" message="$(string.Result.CMRE_CONNECTION_NOT_RELEASED)" />
            <map value="13020" message="$(string.Result.CMRE_CONNECTION_RELEASE_FAILED)" />
            <map value="13021" message="$(string.Result.CMRE_CONNECTION_ALREADY_EXISTS)" />
            <map value="13022" message="$(string.Result.CMRE_CONNECTION_DOES_NOT_EXIST)" />
            <map value="13023" message="$(string.Result.CMRE_CONNECTION_AUTHENTICATION_FAILED)" />
            <map value="13024" message="$(string.Result.CMRE_NOT_ALLOWED)" />
            <map value="13025" message="$(string.Result.CMRE_NO_NOTIFICATIONS)" />
            <map value="13026" message="$(string.Result.CMRE_NO_POLICIES)" />
            <map value="13027" message="$(string.Result.CMRE_OUT_OF_MEMORY)" />
            <map value="13028" message="$(string.Result.CMRE_PENDING)" />
            <map value="13029" message="$(string.Result.CMRE_ACCESS_DENIED)" />
            <map value="13030" message="$(string.Result.CMRE_NOT_SUPPORTED)" />
            <map value="13031" message="$(string.Result.CMRE_NOT_IMPLEMENTED)" />
            <map value="13032" message="$(string.Result.CMRE_UNEXPECTED)" />
            <map value="13033" message="$(string.Result.CMRE_NOT_INITIALIZED)" />
            <map value="13034" message="$(string.Result.CMRE_CONNECTION_FAILED_TO_ASSOCIATE)" />
            <map value="13035" message="$(string.Result.CMRE_CONNECTION_IP_NOT_FOUND)" />
            <map value="13036" message="$(string.Result.CMRE_SERVICE_UNAVAILABLE)" />
          </valueMap>

          <valueMap name="WwanActivationState">
              <map value="0" message="$(string.WwanActivationState.WwanActivationStateUnknown)" />
              <map value="1" message="$(string.WwanActivationState.WwanActivationStateActivated)" />
              <map value="2" message="$(string.WwanActivationState.WwanActivationStateActivating)" />
              <map value="3" message="$(string.WwanActivationState.WwanActivationStateDeactivated)" />
              <map value="4" message="$(string.WwanActivationState.WwanActivationStateDeactivating)" />
          </valueMap>

          <valueMap name="WwanResultCode">
              <map value="0"    message="$(string.WwanResultCode.WwanResultSuccess)" />
              <map value="1"    message="$(string.WwanResultCode.WwanResultSuccessPartial)" />
              <map value="2"    message="$(string.WwanResultCode.WwanResultFailure)" />
              <map value="3"    message="$(string.WwanResultCode.WwanResultNoSim)" />
              <map value="4"    message="$(string.WwanResultCode.WwanResultBadSim)" />
              <map value="5"    message="$(string.WwanResultCode.WwanResultSimRejected)" />
              <map value="6"    message="$(string.WwanResultCode.WwanResultNotInitialized)" />
              <map value="7"    message="$(string.WwanResultCode.WwanResultSubsidyLocked)" />
              <map value="8"    message="$(string.WwanResultCode.WwanResultPinLocked)" />
              <map value="9"    message="$(string.WwanResultCode.WwanResultPukLocked)" />
              <map value="10"   message="$(string.WwanResultCode.WwanResultPin2Locked)" />
              <map value="11"   message="$(string.WwanResultCode.WwanResultPuk2Locked)" />
              <map value="12"   message="$(string.WwanResultCode.WwanResultNetworkPwdLocked)" />
              <map value="13"   message="$(string.WwanResultCode.WwanResultDevicePwdLocked)" />
              <map value="14"   message="$(string.WwanResultCode.WwanResultWrongPassword)" />
              <map value="15"   message="$(string.WwanResultCode.WwanResultPasswordIgnored)" />
              <map value="16"   message="$(string.WwanResultCode.WwanResultRegistrationDenied)" />
              <map value="17"   message="$(string.WwanResultCode.WwanResultNoProvidersFound)" />
              <map value="18"   message="$(string.WwanResultCode.WwanResultNoActiveProvider)" />
              <map value="19"   message="$(string.WwanResultCode.WwanResultNotAttached)" />
              <map value="20"   message="$(string.WwanResultCode.WwanResultMaxActivatedContexts)" />
              <map value="21"   message="$(string.WwanResultCode.WwanResultInvalidContextState)" />
              <map value="22"   message="$(string.WwanResultCode.WwanResultServiceUnavailable)" />
              <map value="23"   message="$(string.WwanResultCode.WwanResultServerNotResponding)" />
              <map value="24"   message="$(string.WwanResultCode.WwanResultRemoteDisconnection)" />
              <map value="25"   message="$(string.WwanResultCode.WwanResultInvalidActivationString)" />
          </valueMap>

          <valueMap name="ConnectionState">
              <map value="0"    message="$(string.ConnectionState.CMCS_DISCONNECTED)" />
              <map value="1"    message="$(string.ConnectionState.CMCS_DISCONNECTED_UNAVAILABLE)" />
              <map value="2"    message="$(string.ConnectionState.CMCS_DISCONNECTED_DISABLED)" />
              <map value="100"  message="$(string.ConnectionState.CMCS_CONNECTING)" />
              <map value="101"  message="$(string.ConnectionState.CMCS_CONNECTING_ASSOCIATING)" />
              <map value="102"  message="$(string.ConnectionState.CMCS_CONNECTING_AUTHENTICATING)" />
              <map value="103"  message="$(string.ConnectionState.CMCS_CONNECTING_WAITING_FOR_IP)" />
              <map value="200"  message="$(string.ConnectionState.CMCS_CONNECTED)" />
              <map value="300"  message="$(string.ConnectionState.CMCS_SUSPENDED)" />
              <map value="400"  message="$(string.ConnectionState.CMCS_DISCONNECTING)" />
          </valueMap>            

          <valueMap name="WwanReadyStateCode">
              <map value="0"    message="$(string.WwanReadyStateCode.WwanReadyStateOff)" />
              <map value="1"    message="$(string.WwanReadyStateCode.WwanReadyStateInitialized)" />
              <map value="2"    message="$(string.WwanReadyStateCode.WwanReadyStateSimNotInserted)" />
              <map value="3"    message="$(string.WwanReadyStateCode.WwanReadyStateBadSim)" />
              <map value="4"    message="$(string.WwanReadyStateCode.WwanReadyStateFailure)" />
              <map value="5"    message="$(string.WwanReadyStateCode.WwanReadyStateNotActivated)" />
              <map value="6"    message="$(string.WwanReadyStateCode.WwanReadyStateDeviceLocked)" />
           </valueMap>                  
     
          <valueMap name="WwanRegistrationStateCode">
              <map value="0"    message="$(string.WwanRegistrationStateCode.WwanRegisterStateUnknown)" />
              <map value="1"    message="$(string.WwanRegistrationStateCode.WwanRegisterStateDeregistered)" />
              <map value="2"    message="$(string.WwanRegistrationStateCode.WwanRegisterStateSearching)" />
              <map value="3"    message="$(string.WwanRegistrationStateCode.WwanRegisterStateHome)" />
              <map value="4"    message="$(string.WwanRegistrationStateCode.WwanRegisterStateRoaming)" />
              <map value="5"    message="$(string.WwanRegistrationStateCode.WwanRegisterStatePartner)" />
              <map value="6"    message="$(string.WwanRegistrationStateCode.WwanRegisterStateDenied)" />
           </valueMap>                  
     
          <valueMap name="WwanPacketServiceStateCode">
              <map value="0"    message="$(string.WwanPacketServiceStateCode.WwanPacketServiceStateUnknown)" />
              <map value="1"    message="$(string.WwanPacketServiceStateCode.WwanPacketServiceStateAttaching)" />
              <map value="2"    message="$(string.WwanPacketServiceStateCode.WwanPacketServiceStateAttached)" />
              <map value="3"    message="$(string.WwanPacketServiceStateCode.WwanPacketServiceStateDetaching)" />
              <map value="4"    message="$(string.WwanPacketServiceStateCode.WwanPacketServiceStateDetached)" />
          </valueMap>        

          <valueMap name="WwanActivationStateCode">
              <map value="0"    message="$(string.WwanActivationStateCode.WwanActivationStateUnknown)" />
              <map value="1"    message="$(string.WwanActivationStateCode.WwanActivationStateActivated)" />
              <map value="2"    message="$(string.WwanActivationStateCode.WwanActivationStateActivating)" />
              <map value="3"    message="$(string.WwanActivationStateCode.WwanActivationStateDeactivated)" />
              <map value="4"    message="$(string.WwanActivationStateCode.WwanActivationStateDeactivating)" />
          </valueMap>        
      
        </maps>

        <!--Event Templates-->
        <templates>

          <template tid="Template_WwanConnection">
            <data name="Prop_ConnectionName" inType="win:UnicodeString" />
            <data name="Prop_ConnectionState" inType="win:UInt16" map="ConnectionState" />
            <data name="Prop_AccessString" inType="win:UnicodeString" />
            <data name="Prop_ContextId" inType="win:UInt32"/>
            <data name="Prop_Result" inType="win:UInt32" map="Result"/>
          </template>

          <template tid="Template_WwanIndication">
               <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
              <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
              <data name="Prop_ContextId" inType="win:UInt32"/>
              <data name="Prop_WwanResultCode" inType="win:UInt32" map="WwanResultCode"/>
              <data name="Prop_WwanActivationState" inType="win:UInt32" map="WwanActivationState"/>
          </template>            

          <template tid="Template_ContextActivateDeactivate">
            <data name="Prop_RequestId" inType="win:UInt32"/>
          </template>

          <template tid="Template_WwanString">
           <data name="Prop_WwanString" inType="win:UnicodeString"/>
          </template>

          <template tid="tDecimal">
            <data name="dwCode" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tDecimalAndHex">
            <data name="dwCode1" inType="win:UInt32" outType="win:unsignedInt" />
            <data name="dwCode2" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="t2HexAnd2Decimal">
            <data name="hex1" inType="win:UInt32" outType="win:HexInt32" />
            <data name="hex2" inType="win:UInt32" outType="win:HexInt32" />
            <data name="decimal1" inType="win:UInt32" outType="win:unsignedInt" />
            <data name="decimal2" inType="win:UInt32" outType="win:unsignedInt" />
          </template>
                    
          <template tid="tHexAndUnicodeString">
            <data name="dwCode2"  inType="win:UInt32" outType="win:HexInt32" />
            <data name="szString" inType="win:UnicodeString" />
          </template>

          <template tid="tUnicodeString">
            <data name="szString" inType="win:UnicodeString" />
          </template>

          <template tid="tUnicodeStringAnd2Decimal">
            <data name="conn"    inType="win:UnicodeString" />
            <data name="dec1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="dec2" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

         <template tid="tAnsiStringAndDecimal">
            <data name="szString"    inType="win:AnsiString" />
            <data name="dec1" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          
          <template tid="tProviderAddConn">
            <data name="name" inType="win:UnicodeString" />
            <data name="connType"    inType="win:UnicodeString" />
            <data name="OEMConnId"  inType="win:GUID" outType="xs:GUID" />
            <data name="apnString" inType="win:UnicodeString" />
            <data name="iptype" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="option"  inType="win:UInt32" outType="win:HexInt32" />
            <data name="authType" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="RmCtl" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="apnID" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="execID" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="slotAff" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
                   
          <template tid="tProviderConnecting">
            <data name="dwCode2"  inType="win:UInt32" outType="win:HexInt32" />
            <data name="szString" inType="win:UnicodeString" />
            <data name="execID" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tProviderCompConn">
            <data name="name" inType="win:UnicodeString" />
            <data name="dec1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="dec2" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="connType"    inType="win:UnicodeString" />
            <data name="OEMConnId"  inType="win:GUID" outType="xs:GUID" />
            <data name="apnString" inType="win:UnicodeString" />
            <data name="iptype" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="option"  inType="win:UInt32" outType="win:HexInt32" />
            <data name="authType" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="RmCtl" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="apnID" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tProviderUpdateConn">
            <data name="name" inType="win:UnicodeString" />
            <data name="ConnIdOld"  inType="win:GUID" outType="xs:GUID" />
            <data name="ConnIdNew"  inType="win:GUID" outType="xs:GUID" />
            <data name="apnStringOld" inType="win:UnicodeString" />
            <data name="apnStringNew" inType="win:UnicodeString" />
            <data name="iptypeOld" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="iptypeNew" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="optionOld"  inType="win:UInt32" outType="win:HexInt32" />
            <data name="optionNew"  inType="win:UInt32" outType="win:HexInt32" />
            <data name="venableOld" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="venableNew" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="RmCtlOld" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="RmCtlNew" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="apnIDOld" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="apnIDNew" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="needDisconnect" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

         <template tid="tProviderGetConnConfig">
            <data name="name" inType="win:UnicodeString" />
            <data name="apnString" inType="win:UnicodeString" />
            <data name="OEMConnId"  inType="win:GUID" outType="xs:GUID" />
            <data name="result"  inType="win:UInt32" outType="win:HexInt32" />
         </template>

          <template tid="tProviderGetConnInfo">
            <data name="name" inType="win:UnicodeString" />
            <data name="adapter" inType="win:UnicodeString" />
            <data name="state" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tProviderAddCompConnUnknownType">
            <data name="name" inType="win:UnicodeString" />
            <data name="UnknownConnType"  inType="win:GUID" outType="xs:GUID" />
            <data name="apnString" inType="win:UnicodeString" />
            <data name="OEMConnId"  inType="win:GUID" outType="xs:GUID" />
          </template>

          <template tid="t3UnicodeStringAndHex">
            <data name="szString1" inType="win:UnicodeString" />
            <data name="szString2" inType="win:UnicodeString" />
            <data name="szString3" inType="win:UnicodeString" />
            <data name="hex"  inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tUnicodeStringAndDecimal">
            <data name="szString" inType="win:UnicodeString" />
            <data name="state" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tPacketServiceState">
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="uStatus" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="uNwError" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="State" inType="win:UInt32" outType="xs:unsignedInt" map="WwanPacketServiceStateCode" />
            <data name="DataClass" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="AvailClasses" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="ExpSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="execID" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tRegisterState">
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="uStatus" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="uNwError" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="State" inType="win:UInt32" outType="xs:unsignedInt" map="WwanRegistrationStateCode"  />
            <data name="Mode" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="CellClass" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="PID" inType="win:UnicodeString" />
            <data name="PNAME" inType="win:UnicodeString" />
            <data name="RTXT" inType="win:UnicodeString" />
            <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="ExpSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="execID" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tContextState">
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="uStatus" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="uNwError" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="State" inType="win:UInt32" outType="xs:unsignedInt" map="WwanActivationStateCode" />
            <data name="ConnID" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="IPType" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Voice" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="ExpSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="execID" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tRadioState">
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="uStatus" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="HwRadioState" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="SwRadioState" inType="win:UInt32" outType="xs:unsignedInt" />            
            <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="ExpSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="execID" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tReadyInfo">
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="ReadyState" inType="win:UInt32" outType="xs:unsignedInt" map="WwanReadyStateCode" />
            <data name="EmergencyMode" inType="win:UInt32" outType="xs:unsignedInt" />            
            <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="ExpSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="execID" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          
          <template tid="tDeviceCaps">
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="uStatus" inType="win:UInt32" outType="xs:HexInt32" />       
            <data name="DeviceType" inType="win:UInt32" outType="xs:unsignedInt" />    
            <data name="CellClass" inType="win:UInt32" outType="xs:unsignedInt" />    
            <data name="VoiceClass" inType="win:UInt32" outType="xs:unsignedInt" />    
            <data name="SimClass" inType="win:UInt32" outType="xs:unsignedInt" />    
            <data name="Dataclass" inType="win:UInt32" outType="xs:HexInt32" />    
            <data name="GsmBandClass" inType="win:UInt32" outType="xs:HexInt32" />    
            <data name="CdmaBandClass" inType="win:UInt32" outType="xs:HexInt32" />    
            <data name="SmsCaps" inType="win:UInt32" outType="xs:HexInt32" />    
            <data name="ControlCaps" inType="win:UInt32" outType="xs:HexInt32" />    
            <data name="MaxActivatedContexts" inType="win:UInt32" outType="xs:unsignedInt" />    
            <data name="AuthAlgoCaps" inType="win:UInt32" outType="xs:HexInt32" />         
            <data name="ID" inType="win:UnicodeString" />    
            <data name="Model" inType="win:UnicodeString" />    
            <data name="Manufacturer" inType="win:UnicodeString" />    
            <data name="FirmwareInfo" inType="win:UnicodeString" />    
            <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="ExpSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="execID" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          
          <template tid="tPacketServiceUpdate">
            <data name="ExecId" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="PSState" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="PSState2" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="DataClass" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="DataClass2" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
          </template>

           <template tid="tSuspensionStateUpdate">
            <data name="ExecutorId" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="SuspState" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="SuspState2" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
          </template>

           <template tid="tOidQueryRequest">
            <data name="oidstring" inType="win:UnicodeString" />
            <data name="oid" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="len" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

           <template tid="tOidQueryRequestWithCommandId">
            <data name="oidstring" inType="win:UnicodeString" />
            <data name="oid" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="commandidstring" inType="win:UnicodeString" />
            <data name="commandid" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="len" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tWPDSCommandSet">
            <data name="commandID" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="PlSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tOpaqueCmdSet">
            <data name="DSguid" inType="win:GUID" outType="xs:GUID" />
            <data name="commandID" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="PlSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tConnectSetRequest">
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="cmnd" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="ConnID" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="apn" inType="win:UnicodeString" />    
           <data name="IPType" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Auth" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tDataDormancyHintSet">
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="hint" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="PlSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

           <template tid="tOmadmConfigSet">
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="apn" inType="win:UnicodeString" />    
            <data name="fEnabled" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="iptype" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="OemConnId" inType="win:GUID" outType="xs:GUID" />
            <data name="roaming" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="PlSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

         <template tid="tEhrpdV6ConfigSet">
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="fEnabled" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="apn" inType="win:UnicodeString" />    
           <data name="Rev" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="Sz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="PlSz" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="TotalSz" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
            
          <template tid="tL2CommandSet">
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="profileIndex" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="cost" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="dataLen" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
            
           <template tid="tNDISAdapter">
            <data name="adapter"    inType="win:AnsiString" />
            <data name="desc" inType="win:UnicodeString" />    
            <data name="type" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="operstatus" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="IPv4Enabled" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="DHCPv4" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="IPv6Enabled" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="v6OtherStateful" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

           <template tid="tNDISAddress">
            <data name="address" inType="win:UnicodeString" />    
            <data name="PrefixLen" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="prefixOrig" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="suffixOrig" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="DADState" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="VLT" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="PLT" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="LLT" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tRequestId">
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
          </template>

          <template tid="tHexWithRequestId">
            <data name="error" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
          </template>

          <template tid="tDevice">
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
          </template>

          <template tid="tDeviceUint">
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="len" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tDeviceHex">
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="len" inType="win:UInt32" outType="xs:HexInt32" />
          </template>

          <template tid="tDeviceRequestUint">
            <data name="deviceid" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="devguid" inType="win:GUID" outType="xs:GUID" />
            <data name="reqidHigh32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="reqidLow32" inType="win:UInt32" outType="xs:HexInt32" />
            <data name="len" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>


        </templates>

        <!--All the Events that can be published by this Publisher -->
        <events>

          <event value="100"
              level="win:Informational"
              template="Template_WwanConnection"
              keywords="Info"
              symbol="CSPWWAN_CONNECT"
              message="$(string.ConnectConnection)" />

          <event value="101"
              level="win:Informational"
              template="Template_WwanConnection"
              keywords="Info"
              symbol="CSPWWAN_DISCONNECT"
              message="$(string.DisconnectConnection)" />

          <event value="102"
              level="win:Informational"
              template="Template_WwanIndication"
              keywords="Info"
              symbol="CSPWWAN_WWAN_INDICATION"
              message="$(string.WwanIndication)" />

          <event value="300"
              level="win:Informational"
              template="Template_ContextActivateDeactivate"
              keywords="Info"
              symbol="CSPWWAN_ACTIVATE_CONTEXT"
              message="$(string.ActivateContext)" />

          <event value="301"
              level="win:Informational"
              template="Template_ContextActivateDeactivate"
              keywords="Info"
              symbol="CSPWWAN_DEACTIVATE_CONTEXT"
              message="$(string.DeactivateContext)" />

         <event value="400"
            level="win:Error"
            template="Template_WwanString"
            keywords="Error"
            symbol="CSPWWAN_ERROR_STRING"
            message="$(string.ErrorWwanString)" />
            
         <event value="401"
            level="win:Informational"
            template="Template_WwanString"
            keywords="Info"
            symbol="CSPWWAN_INFO_STRING"
            message="$(string.InfoWwanString)" />
            
         <event value="402"
            level="win:Verbose"
            template="Template_WwanString"
            keywords="Verbose"
            symbol="CSPWWAN_VERBOSE_STRING"
            message="$(string.VerboseWwanString)" />

         <!--500 and above events -->
         
         <event value="500"
            level="win:Informational"
            template="tDecimal"
            keywords="Info"
            symbol="_CmCspInitialized"
            message="$(string.Event.CmCspInitialized)" />

         <event value="501"
            level="win:Informational"
            keywords="Info"
            symbol="_CmCspDeinitialized"
            message="$(string.Event.CmCspDeinitialized)" />

         <event value="502"
            level="win:Error"
            template="tDecimal"
            keywords="Info"
            symbol="_CmCspConnectErr"
            message="$(string.Event.CmCspConnectErr)" />

         <event value="503"
            level="win:Error"
            template="tDecimal"
            keywords="Info"
            symbol="_CmCspDisconnectErr"
            message="$(string.Event.CmCspDisconnectErr)" />

         <event value="504"
            level="win:Warning"
            keywords="Info"
            symbol="_CmCspCancelPendingConnect"
            message="$(string.Event.CmCspCancelPendingConnect)" />

         <event value="505"
            level="win:Error"
            template="tDecimal"
            keywords="Info"
            symbol="_CmCspGetConnectionInfoErr"
            message="$(string.Event.CmCspGetConnectionInfoErr)" />

         <event value="506"
            level="win:Warning"
            keywords="Info"
            symbol="_CmCspClaimConnection"
            message="$(string.Event.CmCspClaimConnection)" />

         <event value="507"
            level="win:Warning"
            keywords="Info"
            symbol="_CmCspGetTypeSpecificInfo"
            message="$(string.Event.CmCspGetTypeSpecificInfo)" />

         <event value="508"
            level="win:Informational"
            template="tProviderConnecting"
            keywords="Info"
            symbol="_ProviderConnecting"
            message="$(string.Event.ProviderConnecting)" />
 
         <event value="509"
            level="win:Informational"
            template="tUnicodeString"
            keywords="Info"
            symbol="_ProviderDisconnecting"
            message="$(string.Event.ProviderDisconnecting)" />
 
         <event value="510"
            level="win:Informational"
            template="tProviderAddConn"
            keywords="Info"
            symbol="_ProviderAddConn"
            message="$(string.Event.ProviderAddConn)" />

         <event value="511"
            level="win:Informational"
            template="tProviderUpdateConn"
            keywords="Info"
            symbol="_ProviderUpdateConn"
            message="$(string.Event.ProviderUpdateConn)" />

         <event value="512"
            level="win:Informational"
            template="tUnicodeString"
            keywords="Info"
            symbol="_ProviderDeleting"
            message="$(string.Event.ProviderDeleting)" />

          <event value="513"
            level="win:Informational"
            template="tProviderGetConnConfig"
            keywords="Info"
            symbol="_ProviderGetConn"
            message="$(string.Event.ProviderGetConn)" />

           <event value="514"
            level="win:Informational"
            template="tProviderGetConnInfo"
            keywords="Info"
            symbol="_ProviderGetConnInfo"
            message="$(string.Event.ProviderGetConnInfo)" />
       
           <event value="515"
            level="win:Informational"
            template="t3UnicodeStringAndHex"
            keywords="Info"
            symbol="_ProviderGetResource"
            message="$(string.Event.ProviderGetResource)" />

          <event value="517"
            level="win:Informational"
            template="tUnicodeStringAndDecimal"
            keywords="Info"
            symbol="_ProviderSendStatusNotif"
            message="$(string.Event.ProviderSendStatusNotif)" />
       
          <event value="518"
            level="win:Informational"
            template="tUnicodeStringAnd2Decimal"
            keywords="Info"
            symbol="_ProviderSendCharacterNotif"
            message="$(string.Event.ProviderSendCharacterNotif)" />
       
          <event value="519"
            level="win:Informational"
            template="tUnicodeStringAndDecimal"
            keywords="Info"
            symbol="_ProviderSendNotif"
            message="$(string.Event.ProviderSendNotif)" />

          <event value="520"
            level="win:Warning"
            template="tDecimal"
            keywords="Info"
            symbol="_CheckInitializeDeviceList"
            message="$(string.Event.CheckInitializeDeviceList)" />

          <event value="521"
            level="win:Error"
            template="t2HexAnd2Decimal"
            keywords="Info"
            symbol="_OidSetInvalidDataLenPointer"
            message="$(string.Event.OidSetInvalidDataLenPointer)" />

          <event value="522"
            level="win:Error"
            template="tDecimal"
            keywords="Error"
            symbol="_ConnInfoAuthTypeError"
            message="$(string.Event.ConnInfoAuthTypeError)" />

         <event value="523"
            level="win:Informational"
            template="tDecimal"
            keywords="Info"
            symbol="_ProviderSendAsyncInitCompNotif"
            message="$(string.Event.ProviderSendAsyncInitCompNotif)" />
            
          <event value="600"
            level="win:Informational"
            template="tPacketServiceState"
            keywords="Info"
            symbol="_PacketServiceState"
            message="$(string.Event.PacketServiceState)" />

          <event value="601"
            level="win:Informational"
            template="tRadioState"
            keywords="Info"
            symbol="_RadioState"
            message="$(string.Event.RadioState)" />

          <event value="602"
            level="win:Informational"
            template="tContextState"
            keywords="Info"
            symbol="_ContextState"
            message="$(string.Event.ContextState)" />

          <event value="603"
            level="win:Informational"
            template="tRegisterState"
            keywords="Info"
            symbol="_RegisterState"
            message="$(string.Event.RegisterState)" />

          <event value="604"
            level="win:Informational"
            template="tReadyInfo"
            keywords="Info"
            symbol="_ReadyInfo"
            message="$(string.Event.ReadyInfo)" />

          <event value="605"
            level="win:Informational"
            template="tDeviceCaps"
            keywords="Info"
            symbol="_DeviceCaps"
            message="$(string.Event.DeviceCaps)" />

          <event value="620"
            level="win:Informational"
            template="tOidQueryRequest"
            keywords="Info"
            symbol="_OidQueryRequest"
            message="$(string.Event.OidQueryRequest)" />

          <event value="621"
            level="win:Informational"
            template="tOidQueryRequest"
            keywords="Info"
            symbol="_OtherOidSetRequest"
            message="$(string.Event.OtherOidSetRequest)" />

           <event value="622"
            level="win:Informational"
            template="tWPDSCommandSet"
            keywords="Info"
            symbol="_WPDSCommandSet"
            message="$(string.Event.WPDSCommandSet)" />

          <event value="623"
            level="win:Informational"
            template="tOpaqueCmdSet"
            keywords="Info"
            symbol="_OpaqueCmdSet"
            message="$(string.Event.OpaqueCmdSet)" />

          <event value="624"
            level="win:Informational"
            template="tConnectSetRequest"
            keywords="Info"
            symbol="_ConnectSetRequest"
            message="$(string.Event.ConnectSetRequest)" />

          <event value="625"
            level="win:Informational"
            template="tDataDormancyHintSet"
            keywords="Info"
            symbol="_DataDormancyHintSet"
            message="$(string.Event.DataDormancyHintSet)" />

          <event value="626"
            level="win:Informational"
            template="tDataDormancyHintSet"
            keywords="Info"
            symbol="_ActivationOptionSet"
            message="$(string.Event.ActivationOptionSet)" />

          <event value="627"
            level="win:Informational"
            template="tOmadmConfigSet"
            keywords="Info"
            symbol="_OmadmConfigSet"
            message="$(string.Event.OmadmConfigSet)" />

          <event value="628"
            level="win:Informational"
            template="tEhrpdV6ConfigSet"
            keywords="Info"
            symbol="_EhrpdV6ConfigSet"
            message="$(string.Event.EhrpdV6ConfigSet)" />

         <event value="629"
            level="win:Informational"
            template="tUnicodeStringAndDecimal"
            keywords="Info"
            symbol="_ProviderEnableConn"
            message="$(string.Event.ProviderEnableConn)" />

         <event value="630"
            level="win:Error"
            template="tUnicodeStringAnd2Decimal"
            keywords="Info"
            symbol="_ProviderEnableConnFailed"
            message="$(string.Event.ProviderEnableConnFailed)" />
            
         <event value="631"
            level="win:Informational"
            template="tProviderCompConn"
            keywords="Info"
            symbol="_ProviderCompConn"
            message="$(string.Event.ProviderCompConn)" />

        <event value="632"
            level="win:Informational"
            template="tL2CommandSet"
            keywords="Info"
            symbol="_L2CommandSet"
            message="$(string.Event.L2CommandSet)" />
        
         <event value="650"
            level="win:Informational"
            template="tDecimalAndHex"
            keywords="Info"
            symbol="_CharacteristicSent"
            message="$(string.Event.CharacteristicSent)" />
         <event value="651"
            level="win:Informational"
            template="tPacketServiceUpdate"
            keywords="Info"
            symbol="_PacketServiceUpdate"
            message="$(string.Event.PacketServiceUpdate)" />
         <event value="652"
            level="win:Informational"
            template="tDecimal"
            keywords="Info"
            symbol="_IpAddrEventHandler"
            message="$(string.Event.IpAddrEventHandler)" />
         <event value="653"
            level="win:Informational"
            template="tUnicodeStringAnd2Decimal"
            keywords="Info"
            symbol="_ATTEMPTINGCONNECT"
            message="$(string.Event.ATTEMPTINGCONNECT)" />  
         <event value="654"
            level="win:Informational"
            template="tNDISAdapter"
            keywords="Info"
            symbol="_NDISAdapterInfo"
            message="$(string.Event.NDISAdapter)" />
         <event value="655"
            level="win:Verbose"
            template="tNDISAdapter"
            keywords="Info"
            symbol="_NDISAdapterVerbose"
            message="$(string.Event.NDISAdapter)" />
        <event value="656"
            level="win:Informational"
            template="tNDISAddress"
            keywords="Info"
            symbol="_NDISAddressInfo"
            message="$(string.Event.NDISAddress)" />
         <event value="657"
            level="win:Verbose"
            template="tNDISAddress"
            keywords="Info"
            symbol="_NDISAddressVerbose"
            message="$(string.Event.NDISAddress)" />
        <event value="658"
            level="win:Informational"
            template="tAnsiStringAndDecimal"
            keywords="Info"
            symbol="_LookForIPAddr"
            message="$(string.Event.LookForIPAddr)" />
        <event value="659"
            level="win:Informational"
            template="tUnicodeString"
            keywords="Info"
            symbol="_FoundValidIPAddr"
            message="$(string.Event.FoundValidIPAddr)" />
        <event value="660"
            level="win:Informational"
            template="tDecimal"
            keywords="Info"
            symbol="_ConnectionStateFindIP"
            message="$(string.Event.ConnectionStateFindIP)" />
         <event value="661"
            level="win:Informational"
            template="tPacketServiceUpdate"
            keywords="Info"
            symbol="_RegistrationStateUpdate"
            message="$(string.Event.RegistrationStateUpdate)" />
         <event value="662"
            level="win:Informational"
            template="tSuspensionStateUpdate"
            keywords="Info"
            symbol="_SuspensionStateUpdate"
            message="$(string.Event.SuspensionStateUpdate)" />
          <event value="663"
            level="win:Informational"
            template="tOidQueryRequestWithCommandId"
            keywords="Info"
            symbol="_OidQueryRequestWithCommandId"
            message="$(string.Event.OidQueryRequestWithCommandId)" />
         <event value="664"
            level="win:Error"
            template="tRequestId"
            keywords="Info"
            symbol="_RequestTimedOut"
            message="$(string.Event.RequestTimedOut)" />
         <event value="665"
            level="win:Informational"
            keywords="Info"
            symbol="_RequestManagerConstructor"
            message="$(string.Event.RequestManagerConstructor)" />
         <event value="666"
            level="win:Informational"
            keywords="Info"
            symbol="_RequestManagerDestructor"
            message="$(string.Event.RequestManagerDestructor)" />
         <event value="667"
            level="win:Error"
            keywords="Info"
            symbol="_AddRequestFailOOM"
            message="$(string.Event.AddRequestFailOOM)" />
         <event value="668"
            level="win:Error"
            template="tHexWithRequestId"
            keywords="Info"
            symbol="_AddRequestFailStartTimer"
            message="$(string.Event.AddRequestFailStartTimer)" />
         <event value="669"
            level="win:Informational"
            template="tHexWithRequestId"
            keywords="Info"
            symbol="_AddRequest"
            message="$(string.Event.AddRequest)" />
         <event value="670"
            level="win:Informational"
            template="tHexWithRequestId"
            keywords="Info"
            symbol="_RemoveRequest"
            message="$(string.Event.RemoveRequest)" />
         <event value="671"
            level="win:Error"
            template="tRequestId"
            keywords="Info"
            symbol="_RequestRemoveFailedToFind"
            message="$(string.Event.RequestRemoveFailedToFind)" />
         <event value="672"
            level="win:Error"
            template="tHexWithRequestId"
            keywords="Info"
            symbol="_RequestRemoveStopTimerFailed"
            message="$(string.Event.RequestRemoveStopTimerFailed)" />
         <event value="673"
            level="win:Informational"
            template="tUnicodeStringAndDecimal"
            keywords="Info"
            symbol="_ProviderEnableConnSucceeded"
            message="$(string.Event.ProviderEnableConnSucceeded)" />
         <event value="674"
            level="win:Informational"
            template="tHexWithRequestId"
            keywords="Info"
            symbol="_SetNetworkQuietMode"
            message="$(string.Event.SetNetworkQuietMode)" />
         <event value="675"
            level="win:Error"
            template="tHexWithRequestId"
            keywords="Info"
            symbol="_SetNetworkQuietModeFailStartTimer"
            message="$(string.Event.SetNetworkQuietModeFailStartTimer)" />
         <event value="676"
            level="win:Informational"
            template="tRequestId"
            keywords="Info"
            symbol="_DormancyHintTimerTimedOut"
            message="$(string.Event.DormancyHintTimerTimedOut)" />
         <event value="677"
            level="win:Error"
            template="tRequestId"
            keywords="Info"
            symbol="_DormancyHintTimerTimedOutSetDormancyStateFailed"
            message="$(string.Event.DormancyHintTimerTimedOutSetDormancyStateFailed)" />
         <event value="678"
            level="win:Error"
            template="tHexWithRequestId"
            keywords="Info"
            symbol="_SetNetworkQuietModeAlreadyInMode"
            message="$(string.Event.SetNetworkQuietModeAlreadyInMode)" />
         <event value="679"
            level="win:Error"
            template="tRequestId"
            keywords="Info"
            symbol="_DormancyHintTimerTimedOutPendingRequest"
            message="$(string.Event.DormancyHintTimerTimedOutPendingRequest)" />
         <event value="680"
            level="win:Error"
            keywords="Info"
            symbol="_ReleaseAOACRefForInitNoRequestIdArray"
            message="$(string.Event.ReleaseAOACRefForInitNoRequestIdArray)" />
         <event value="681"
            level="win:Informational"
            template="tDeviceRequestUint"
            keywords="Info"
            symbol="_AcquireAOACRef"
            message="$(string.Event.AcquireAOACRef)" />
         <event value="682"
            level="win:Informational"
            template="tDeviceUint"
            keywords="Info"
            symbol="_AcquireAOACRefNoAOAC"
            message="$(string.Event.AcquireAOACRefNoAOAC)" />
         <event value="683"
            level="win:Error"
            template="tDeviceHex"
            keywords="Info"
            symbol="_AcquireAOACRefFailedAcquire"
            message="$(string.Event.AcquireAOACRefFailedAcquire)" />
         <event value="684"
            level="win:Informational"
            template="tDeviceUint"
            keywords="Info"
            symbol="_AcquireAOACRefSucceeded"
            message="$(string.Event.AcquireAOACRefSucceeded)" />
         <event value="685"
            level="win:Error"
            template="tDevice"
            keywords="Info"
            symbol="_ReleaseAOACRefNotAOAC"
            message="$(string.Event.ReleaseAOACRefNotAOAC)" />
         <event value="686"
            level="win:Error"
            template="tDevice"
            keywords="Info"
            symbol="_ReleaseAOACRefAlready0"
            message="$(string.Event.ReleaseAOACRefAlready0)" />
         <event value="687"
            level="win:Informational"
            template="tDeviceRequestUint"
            keywords="Info"
            symbol="_ReleaseAOACRef"
            message="$(string.Event.ReleaseAOACRef)" />
         <event value="688"
            level="win:Informational"
            template="tDevice"
            keywords="Info"
            symbol="_ReleaseAOACRefHandleInvalid"
            message="$(string.Event.ReleaseAOACRefHandleInvalid)" />
         <event value="689"
            level="win:Error"
            template="tDeviceHex"
            keywords="Info"
            symbol="_ReleaseAOACRefFailed"
            message="$(string.Event.ReleaseAOACRefFailed)" />
         <event value="690"
            level="win:Informational"
            template="tDeviceUint"
            keywords="Info"
            symbol="_ReleaseAOACRefSucceed"
            message="$(string.Event.ReleaseAOACRefSucceed)" />
         <event value="691"
            level="win:Informational"
            template="tDeviceHex"
            keywords="Info"
            symbol="_NewDeviceFound"
            message="$(string.Event.NewDeviceFound)" />
         <event value="692"
            level="win:Informational"
            template="tProviderAddCompConnUnknownType"
            keywords="Info"
            symbol="_ProviderCompConnUnknownType"
            message="$(string.Event.ProviderCompConnUnknownType)" />
         <event value="693"
            level="win:Informational"
            template="tProviderAddCompConnUnknownType"
            keywords="Info"
            symbol="_ProviderAddConnUnknownType"
            message="$(string.Event.ProviderAddConnUnknownType)" />
        </events>
      </provider>
    </events>
  </instrumentation>
  
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Keyword.Error"          value="Error" />
        <string id="Keyword.Performance"    value="Performance" />
        <string id="Keyword.Info"           value="Information" />
        <string id="Keyword.Verbose"	      value="Verbose" />

        <string id="ConnectConnection"      value="CspWwan::Connect - Connection Name[%1]; Connection State[%2]; AccessString[%3]; ContextId[%4]; Result[%5]" />
        <string id="DisconnectConnection"   value="CspWwan::Disconnect - Connection Name[%1]; Connection State[%2]; AccessString[%3]; ContextId[%4]; Result[%5]" />
        <string id="WwanIndication"         value="CspWwan::WwanIndication - RequestID[%1-%2]; ContextId[%3]; WwanResult[%4]; WwanActivationState[%5]" />          
        <string id="ActivateContext"        value="CspWwan::ActivateContext - RequestId[%1]" />
        <string id="DeactivateContext"      value="CspWwan::DeactivateContext - RequestId[%1]" />
        <string id="VerboseWwanString"      value="CspWwan VERBOSE:: %1" />
        <string id="InfoWwanString"         value="CspWwan INFO:: %1" />
        <string id="ErrorWwanString"        value="CspWwan ERROR:: %1" />
        
        <string id="Result.CMRE_SUCCESS"                            value="CMRE_SUCCESS" />
        <string id="Result.CMRE_INVALID_REQUIREMENTS"               value="CMRE_INVALID_REQUIREMENTS" />
        <string id="Result.CMRE_INVALID_PREFERENCES"                value="CMRE_INVALID_PREFERENCES" />
        <string id="Result.CMRE_INVALID_SESSION"                    value="CMRE_INVALID_SESSION" />
        <string id="Result.CMRE_INVALID_CONNECTION"                 value="CMRE_INVALID_CONNECTION" />
        <string id="Result.CMRE_INVALID_CONNECTION_TYPE"            value="CMRE_INVALID_CONNECTION_TYPE" />
        <string id="Result.CMRE_INVALID_DEVICE"                     value="CMRE_INVALID_DEVICE" />
        <string id="Result.CMRE_INVALID_PARAMETER"                  value="CMRE_INVALID_PARAMETER" />
        <string id="Result.CMRE_INVALID_VERSION"                    value="CMRE_INVALID_VERSION" />
        <string id="Result.CMRE_INVALID_HOST"                       value="CMRE_INVALID_HOST" />
        <string id="Result.CMRE_INCONSISTENT_CONFIGURATION"         value="CMRE_INCONSISTENT_CONFIGURATION" />
        <string id="Result.CMRE_INSUFFICIENT_BUFFER"                value="CMRE_INSUFFICIENT_BUFFER" />
        <string id="Result.CMRE_CONNECTION_ITERATION_NOT_STARTED"   value="CMRE_CONNECTION_ITERATION_NOT_STARTED" />
        <string id="Result.CMRE_NO_CONNECTIONS"                     value="CMRE_NO_CONNECTIONS" />
        <string id="Result.CMRE_HOST_ADDRESS_ITERATION_NOT_STARTED" value="CMRE_HOST_ADDRESS_ITERATION_NOT_STARTED" />
        <string id="Result.CMRE_NO_HOST_ADDRESSES"                  value="CMRE_NO_HOST_ADDRESSES" />
        <string id="Result.CMRE_CONNECTION_ACQUIRE_FAILED"          value="CMRE_CONNECTION_ACQUIRE_FAILED" />
        <string id="Result.CMRE_CONNECTION_RESOURCE_CONFLICT"       value="CMRE_CONNECTION_RESOURCE_CONFLICT" />
        <string id="Result.CMRE_CONNECTION_ALREADY_ACQUIRED"        value="CMRE_CONNECTION_ALREADY_ACQUIRED" />
        <string id="Result.CMRE_CONNECTION_NOT_ACQUIRED"            value="CMRE_CONNECTION_NOT_ACQUIRED" />
        <string id="Result.CMRE_CONNECTION_NOT_RELEASED"            value="CMRE_CONNECTION_NOT_RELEASED" />
        <string id="Result.CMRE_CONNECTION_RELEASE_FAILED"          value="CMRE_CONNECTION_RELEASE_FAILED" />
        <string id="Result.CMRE_CONNECTION_ALREADY_EXISTS"          value="CMRE_CONNECTION_ALREADY_EXISTS" />
        <string id="Result.CMRE_CONNECTION_DOES_NOT_EXIST"          value="CMRE_CONNECTION_DOES_NOT_EXIST" />
        <string id="Result.CMRE_CONNECTION_AUTHENTICATION_FAILED"   value="CMRE_CONNECTION_AUTHENTICATION_FAILED" />
        <string id="Result.CMRE_NOT_ALLOWED"                        value="CMRE_NOT_ALLOWED" />
        <string id="Result.CMRE_NO_NOTIFICATIONS"                   value="CMRE_NO_NOTIFICATIONS" />
        <string id="Result.CMRE_NO_POLICIES"                        value="CMRE_NO_POLICIES" />
        <string id="Result.CMRE_OUT_OF_MEMORY"                      value="CMRE_OUT_OF_MEMORY" />
        <string id="Result.CMRE_PENDING"                            value="CMRE_PENDING" />
        <string id="Result.CMRE_ACCESS_DENIED"                      value="CMRE_ACCESS_DENIED" />
        <string id="Result.CMRE_NOT_SUPPORTED"                      value="CMRE_NOT_SUPPORTED" />
        <string id="Result.CMRE_NOT_IMPLEMENTED"                    value="CMRE_NOT_IMPLEMENTED" />
        <string id="Result.CMRE_UNEXPECTED"                         value="CMRE_UNEXPECTED" />
        <string id="Result.CMRE_NOT_INITIALIZED"                    value="CMRE_NOT_INITIALIZED" />
        <string id="Result.CMRE_CONNECTION_FAILED_TO_ASSOCIATE"     value="CMRE_CONNECTION_FAILED_TO_ASSOCIATE" />
        <string id="Result.CMRE_CONNECTION_IP_NOT_FOUND"            value="CMRE_CONNECTION_IP_NOT_FOUND" />
        <string id="Result.CMRE_SERVICE_UNAVAILABLE"                value="CMRE_SERVICE_UNAVAILABLE" />

        <string id="WwanActivationState.WwanActivationStateUnknown"      value="WwanActivationStateUnknown" />
        <string id="WwanActivationState.WwanActivationStateActivating"   value="WwanActivationStateActivating" />
        <string id="WwanActivationState.WwanActivationStateActivated"    value="WwanActivationStateActivated" />
        <string id="WwanActivationState.WwanActivationStateDeactivating" value="WwanActivationStateDeactivating" />
        <string id="WwanActivationState.WwanActivationStateDeactivated"  value="WwanActivationStateDeactivated" />

        <string id="WwanResultCode.WwanResultSuccess"                   value="WwanResultSuccess" />
        <string id="WwanResultCode.WwanResultSuccessPartial"            value="WwanResultSuccessPartial" />
        <string id="WwanResultCode.WwanResultFailure"                   value="WwanResultFailure" />
        <string id="WwanResultCode.WwanResultNoSim"                     value="WwanResultNoSim" />
        <string id="WwanResultCode.WwanResultBadSim"                    value="WwanResultBadSim" />
        <string id="WwanResultCode.WwanResultSimRejected"               value="WwanResultSimRejected" />
        <string id="WwanResultCode.WwanResultNotInitialized"            value="WwanResultNotInitialized" />
        <string id="WwanResultCode.WwanResultSubsidyLocked"             value="WwanResultSubsidyLocked" />
        <string id="WwanResultCode.WwanResultPinLocked"                 value="WwanResultPinLocked" />
        <string id="WwanResultCode.WwanResultPukLocked"                 value="WwanResultPukLocked" />
        <string id="WwanResultCode.WwanResultPin2Locked"                value="WwanResultPin2Locked" />
        <string id="WwanResultCode.WwanResultPuk2Locked"                value="WwanResultPuk2Locked" />
        <string id="WwanResultCode.WwanResultNetworkPwdLocked"          value="WwanResultNetworkPwdLocked" />
        <string id="WwanResultCode.WwanResultDevicePwdLocked"           value="WwanResultDevicePwdLocked" />
        <string id="WwanResultCode.WwanResultWrongPassword"             value="WwanResultWrongPassword" />
        <string id="WwanResultCode.WwanResultPasswordIgnored"           value="WwanResultPasswordIgnored" />
        <string id="WwanResultCode.WwanResultRegistrationDenied"        value="WwanResultRegistrationDenied" />
        <string id="WwanResultCode.WwanResultNoProvidersFound"          value="WwanResultNoProvidersFound" />
        <string id="WwanResultCode.WwanResultNoActiveProvider"          value="WwanResultNoActiveProvider" />
        <string id="WwanResultCode.WwanResultNotAttached"               value="WwanResultNotAttached" />
        <string id="WwanResultCode.WwanResultMaxActivatedContexts"      value="WwanResultMaxActivatedContexts" />
        <string id="WwanResultCode.WwanResultInvalidContextState"       value="WwanResultInvalidContextState" />
        <string id="WwanResultCode.WwanResultServiceUnavailable"        value="WwanResultServiceUnavailable" />
        <string id="WwanResultCode.WwanResultServerNotResponding"       value="WwanResultServerNotResponding" />
        <string id="WwanResultCode.WwanResultRemoteDisconnection"       value="WwanResultRemoteDisconnection" />
        <string id="WwanResultCode.WwanResultInvalidActivationString"   value="WwanResultInvalidActivationString" />

        <string id="ConnectionState.CMCS_DISCONNECTED"              value="CMCS_DISCONNECTED" />
        <string id="ConnectionState.CMCS_DISCONNECTED_UNAVAILABLE"  value="CMCS_DISCONNECTED_UNAVAILABLE" />
        <string id="ConnectionState.CMCS_DISCONNECTED_DISABLED"     value="CMCS_DISCONNECTED_DISABLED" />
        <string id="ConnectionState.CMCS_CONNECTING"                value="CMCS_CONNECTING" />
        <string id="ConnectionState.CMCS_CONNECTING_ASSOCIATING"    value="CMCS_CONNECTING_ASSOCIATING" />
        <string id="ConnectionState.CMCS_CONNECTING_AUTHENTICATING" value="CMCS_CONNECTING_AUTHENTICATING" />
        <string id="ConnectionState.CMCS_CONNECTING_WAITING_FOR_IP" value="CMCS_CONNECTING_WAITING_FOR_IP" />
        <string id="ConnectionState.CMCS_CONNECTED"                 value="CMCS_CONNECTED" />
        <string id="ConnectionState.CMCS_SUSPENDED"                 value="CMCS_SUSPENDED" />
        <string id="ConnectionState.CMCS_DISCONNECTING"             value="CMCS_DISCONNECTING" />

        <string id="Event.CmCspInitialized"             value="[CspWwan] CmCspInitialized [%1]" />
        <string id="Event.CmCspDeinitialized"             value="[CspWwan] CmCspDeinitialized" />
        <string id="Event.CmCspConnectErr"             value="[CspWwan] CmCspConnect Error [%1]" />
        <string id="Event.CmCspDisconnectErr"             value="[CspWwan] CmCspDisconnect Error [%1]" />
        <string id="Event.CmCspCancelPendingConnect"             value="[CspWwan] CmCspCancelPendingConnect is unsupported" />
        <string id="Event.CmCspGetConnectionInfoErr"             value="[CspWwan] CmCspGetConnectionInfo Error (%1)" />
        <string id="Event.CmCspClaimConnection"             value="[CspWwan] CmCspClaimConnection is unsupported" />
        <string id="Event.CmCspGetTypeSpecificInfo"             value="[CspWwan] CmCspGetTypeSpecificInfo is unsupported" />

        <string id="Event.ProviderConnecting"             value="[CspWwan] ProviderConnecting [%2] on Resource %1 ExecID %3" />
        <string id="Event.ProviderDisconnecting"             value="[CspWwan] ProviderDisconnecting [%1]" />
        <string id="Event.ProviderDeleting"             value="[CspWwan] ProviderDeleting [%1]" />
        <string id="Event.ProviderAddConn"             value="[CspWwan] ProviderAddConn [%1] ConnType(%2) OEMConnId %3 APN %4 NetProt %5 Option %6 Auth %7 RmCtl %8 apnID %9 Exec %10 Slot %11" />
        <string id="Event.ProviderEnableConn"            value="[CspWwan] ProviderEnableConn [%1] fEnable %2" />             
        <string id="Event.ProviderEnableConnSucceeded"   value="[CspWwan] ProviderEnableConn [%1] fEnable %2 Succeeded" />
        <string id="Event.ProviderEnableConnFailed"      value="[CspWwan] ProviderEnableConn [%1] fEnable %2 Failed (Result %3)" />
        <string id="Event.ProviderCompConn"             value="[CspWwan] ProviderCompConn [%1] fSameType %2 fSameInfo %3 ( ConnType(%4) OEMConnId %5 APN %6 NetProt %7 Option %8 Auth %9 RmCtl %10 apnID %11)" />             
        <string id="Event.ProviderUpdateConn"             value="[CspWwan] ProviderUpdateConn [%1] ConnId %2->%3 APN %4->%5 NetProt %6->%7 Option %8->%9 Auth %10->%11 RmCtl %12->%13 apnID %14->%15 fNeedDisconnet %16" />
        <string id="Event.ProviderGetConn"             value="[CspWwan] ProviderGetConn [%1] APN %2 OEMConnId %3 CMResult %4" />             
        <string id="Event.ProviderGetConnInfo"             value="[CspWwan] ProviderGetConnInfo [%1] Adapter %2  State %3" />             
        <string id="Event.ProviderGetResource"             value="[CspWwan] ProviderGetResource [%1] ConnType(%2) ResourceID(%3)  hResource %4" />             
        <string id="Event.ProviderSendStatusNotif"           value="[CspWwan] ProviderSendStatusNotif [%1] State %2" />             
        <string id="Event.ProviderSendCharacterNotif"      value="[CspWwan] ProviderSendCharacterNotif [%1] CharacterType %2 Val %3" />             
        <string id="Event.ProviderSendAsyncInitCompNotif"      value="[CspWwan] ProviderSendAsyncInitCompNotif iState %1" />             
        <string id="Event.ProviderSendNotif"                    value="[CspWwan] ProviderSendNotif [%1] NotifType %2" />             
        <string id="Event.CheckInitializeDeviceList"          value="[CspWwan] Re-enumerating wwan devices (currently known %1)" />             
        <string id="Event.ProviderAddConnUnknownType"         value="[CspWwan] ProviderAddConn [%1] with unknown type %2 APN %3 OEMConnId %4. Rejected ..." />             
        <string id="Event.ProviderCompConnUnknownType"        value="[CspWwan] ProviderCompConn [%1] against unknown type %2 APN %3 OEMConnId %4. Rejected ..." />             

        <string id="Event.RegisterState"                          value="[CspWwan] MP %1-->WWAN_REGISTER_STATE(ReqID %2-%3) uStatus %4 uNwError %5 State %6 Mode %7 CellClass %8 ProviderID [%9] ProviderName [%10] RoamingText [%11] (Rev %12 Sz %13 TotalSz %14 Exp Sz %15) Exec %16" />
        <string id="Event.PacketServiceState"                 value="[CspWwan] MP %1-->WWAN_PACKET_SERVICE(ReqID %2-%3) uStatus %4 uNwError %5 State %6 DataClass %7 AvailClasses %8 (Rev %9 Sz %10 TotalSz %11 Exp Sz %12) Exec %13" />
        <string id="Event.ContextState"                          value="[CspWwan] MP %1-->WWAN_CONTEXT_STATE(ReqID %2-%3) uStatus %4 uNwError %5 State %6 ConnID %7 IPType %8 Voice %9 (Rev %10 Sz %11 TotalSz %12 Exp Sz %13) Exec %14" />
        <string id="Event.RadioState"                             value="[CspWwan] MP %1-->WWAN_RADIO_STATE(ReqID %2-%3) uStatus %4 HwRadioState %5 SwRadioState %6 (Rev %7 Sz %8 TotalSz %9 Exp Sz %10) Exec %11" />
        <string id="Event.ReadyInfo"                              value="[CspWwan] MP %1-->WWAN_READY_INFO(ReqID %2-%3) ReadyState %4 EmergencyMode %5 (Rev %6 Sz %7 TotalSz %8 Exp Sz %9)  Exec %10" />
        <string id="Event.DeviceCaps"                            value="[CspWwan] MP %1-->WWAN_DEVICE_CAPS(ReqID %2-%3) uStatus %4 DeviceType %5 CellClass %6 VoiceClass %7 SimClass %8 Dataclass %9 GsmBandClass %10 CdmaBandClass %11 SmsCaps %12 ControlCaps %13 MaxActivatedContexts %14 AuthAlgoCaps %15 ID %16 Model %17 Manufacturer %18 FirmwareInfo %19 (Rev %20 Sz %21 TotalSz %22 Exp Sz %23) Exec %24" />

        <string id="Event.OidQueryRequest"                    value="[CspWwan] %1 (%2) Query-->MP [%3] %4 ReqID %5-%6 TotalSz %7" />             
        <string id="Event.OidQueryRequestWithCommandId"       value="[CspWwan] %1 (%2) Command Id %3 (%4) Query-->MP [%5] %6 ReqID %7-%8 TotalSz %9" />
        <string id="Event.OtherOidSetRequest"                value="[CspWwan] %1 (%2) Set-->MP [%3] %4 ReqID %5-%6 TotalSz %7" />
        <string id="Event.WPDSCommandSet"                 value="[CspWwan] WP-DS Command %1 Set-->MP [%2] %3 ReqID %4-%5 (Rev %6 sz %7 PLSize %8 TotalSz %9)" />             
        <string id="Event.OpaqueCmdSet"                       value="[CspWwan] Opaque-DS {%1} Command %2 Set-->MP [%3] %4 ReqID %5-%6 (Rev %7 sz %8 PLSize %9 TotalSz %10)" />             
        <string id="Event.ConnectSetRequest"                 value="[CspWwan] OID_WWAN_CONNECT Set-->MP [%1] %2 ReqID %3-%4 Cmnd %5 ConnID %6 APN %7 IPType %8 Auth %9 (Rev %10 Sz %11 TotalSz %12)" />
        <string id="Event.DataDormancyHintSet"             value="[CspWwan] WP-DS DataDormancyHint Set -->MP [%1] %2 ReqID %3-%4 Hint %5 (Rev %6 sz %7 PLSize %8 TotalSz %9)" />             
        <string id="Event.ActivationOptionSet"                 value="[CspWwan] WP-DS ActivationOption Set-->MP [%1] %2 ReqID %3-%4 Option %5 (Rev %6 Sz %7 PLSize %8 TotalSz %9)" />             
        <string id="Event.OmadmConfigSet"                    value="[CspWwan] WP-DS DMConfig Set-->MP [%1] %2 ReqID %3-%4 APNString %5, fEnabled %6, ipType %7, OEMConnectionId %8, roaming %9 (Rev %10 Sz %11 PLSize %12 TotalSz %13)" />             
        <string id="Event.EhrpdV6ConfigSet"                   value="[CspWwan] WP-DS eHRPD IPv6 config Set-->MP [%1] %2 ReqID %3-%4 fEnable %5 APN [%6] (Rev %7 Sz %8 PLSize %9 TotalSz %10)" />
        <string id="Event.L2CommandSet"                   value="[CspWwan] L2 Profile config Set-->MP [%1] %2 ReqID %3-%4 Profile Index %5 Cost %6 OID Data Length %7" />


        <string id="Event.SetNetworkQuietMode"                   value="[CspWwan] SetNetworkQuietMode %1, using (ReqID %2-%3)" />
        <string id="Event.SetNetworkQuietModeAlreadyInMode"      value="[CspWwan] SetNetworkQuietMode: already in mode %1 (ReqID %2-%3)" />
        <string id="Event.SetNetworkQuietModeFailStartTimer"     value="[CspWwan] SetNetworkQuietMode failed to start timer Error %1, (ReqID %2-%3)" />
        <string id="Event.DormancyHintTimerTimedOut"             value="[CspWwan] DormancyHintTimer TimedOut sending Dormancy Hint (ReqID %1-%2)" />
        <string id="Event.DormancyHintTimerTimedOutPendingRequest"            value="[CspWwan] DormancyHintTimer sending another hint, but still waitng (ReqID %1-%2)" />
        <string id="Event.DormancyHintTimerTimedOutSetDormancyStateFailed"    value="[CspWwan] DormancyHintTimer Set Dormancy Hint Failed (ReqID %1-%2)" />

        <string id="Event.CharacteristicSent"                   value="[CspWwan] Characteristic Sent: KBITPS [%1] DataClass [%2]" />             
        <string id="Event.PacketServiceUpdate"               value="[CspWwan] PacketServiceUpdate:     ExecId %1 PSState %2-->%3  DataClass %4-->%5 (ReqID %6-%7)" />
        <string id="Event.RegistrationStateUpdate"           value="[CspWwan] RegistrationStateUpdate: ExecId %1 RegState %2-->%3 CellClass %4-->%5 (ReqID %6-%7)" />
        <string id="Event.IpAddrEventHandler"                 value="[CspWwan] IpAddrController::EventHandler for address family %1" />             
        <string id="Event.ATTEMPTINGCONNECT"             value="[CspWwan] Connection [%1]: -ATTEMPTING CONNECT- [WifiTether=%2 Prov=%3]" />             
        <string id="Event.NDISAdapter"                           value="[CspWwan] Adapter %1 (%2): type=%3 operstatus=%4 IPv4Enabled=%5 DHCPv4=%6 IPv6Enabled=%7 v6OtherStateful=%8" />             
        <string id="Event.NDISAddress"                           value="[CspWwan]   Unicast address %1 (PrefixLen=%2 prefixOrig=%3 suffixOrig=%4 DADState=%5 VLT=%6 PLT=%7 LLT=%8)" />             
        <string id="Event.LookForIPAddr"                         value="[CspWwan] Found adapter %1 in address table, looking for addresses of AF %2." />             
        <string id="Event.FoundValidIPAddr"                     value="[CspWwan] Found valid address [%1]" />             
        <string id="Event.ConnectionStateFindIP"              value="[CspWwan] ConnectionState::FindAdapterIpAddress -- activeIPType %1" />             
        <string id="Event.OidSetInvalidDataLenPointer"     value="[CspWwan] CheckSetOidDataLen Error with OID %1 set data pointer %2 Length %3 MinLength %4" />
        <string id="Event.ConnInfoAuthTypeError"              value="[CspWwan] WwanContextEx_t::GetConnInfoAuthTypeFromWwan -- invalid AuthType error%1" />
        <string id="Event.SuspensionStateUpdate"               value="[CspWwan] SuspensionStateUpdate: ExecutorId %1 SuspState %2-->%3 (ReqID %4-%5)" />

        <string id="Event.RequestTimedOut"               value="[CspWwan] Request Timed Out (ReqID %1-%2)" />
        <string id="Event.RequestManagerConstructor"               value="[CspWwan] Request Manager Constructor" />
        <string id="Event.RequestManagerDestructor"               value="[CspWwan] Request Manager Destructor" />
        <string id="Event.AddRequestFailOOM"               value="[CspWwan] Request Manager Add request fail: our of memory" />
        <string id="Event.AddRequest"               value="[CspWwan] Request Manager Add request device %1, (ReqID %2-%3)" />
        <string id="Event.RemoveRequest"               value="[CspWwan] Request Manager Remove request device %1, (ReqID %2-%3)" />
        <string id="Event.RequestRemoveFailedToFind"               value="[CspWwan] Request Manager Remove request (ReqID %1-%2) failed to find the ReqID" />
        <string id="Event.RequestRemoveStopTimerFailed"               value="[CspWwan] Request Manager Remove request failed to stop timer %1 (ReqID %2-%3)" />
        <string id="Event.AddRequestFailStartTimer"               value="[CspWwan] Request Manager Add Request failed to stop timer %1 (ReqID %2-%3)" />
        <string id="Event.ReleaseAOACRefForInitNoRequestIdArray"      value="[CspWwan] ReleaseAOACRefForInit: failed to find m_RequestIdArrayForInit" />
        <string id="Event.AcquireAOACRef"                             value="[CspWwan] AcquireAOACRef: [%1] %2 ReqID %3-%4 Ref count is %5 after acquire" />
        <string id="Event.AcquireAOACRefNoAOAC"                       value="[CspWwan] AcquireAOACRef: [%1] %2 doesn't support AOAC, Ref Count is %3" />
        <string id="Event.AcquireAOACRefFailedAcquire"                value="[CspWwan] AcquireAOACRef: [%1] %2 failed AOAC acquisition (0x%3)" />
        <string id="Event.AcquireAOACRefSucceeded"                    value="[CspWwan] AcquireAOACRef: [%1] %2 support AOAC, Ref Count is %3" />
        <string id="Event.ReleaseAOACRefNotAOAC"                      value="[CspWwan] ReleaseAOACRef: [%1] %2 not AOAC compliant" />
        <string id="Event.ReleaseAOACRefAlready0"                     value="[CspWwan] ReleaseAOACRef: [%1] %2 Ref Count is already 0" />
        <string id="Event.ReleaseAOACRef"                             value="[CspWwan] ReleaseAOACRef: [%1] %2 ReqID %3-%4 Ref count is %5 after release" />
        <string id="Event.ReleaseAOACRefHandleInvalid"                value="[CspWwan] ReleaseAOACRef: [%1] %2 invalid handle" />
        <string id="Event.ReleaseAOACRefFailed"                       value="[CspWwan] ReleaseAOACRef: [%1] %2 failed AOAC Release (0x%3)" />
        <string id="Event.ReleaseAOACRefSucceed"                      value="[CspWwan] ReleaseAOACRef: [%1] %2 released, Ref Count is %3" />
        <string id="Event.NewDeviceFound"                             value="[CspWwan] InitializeDeviceList: new device [%1] %2, has null terminator: %3" />

        <string id="WwanReadyStateCode.WwanReadyStateOff"                                     value=":Off" />
        <string id="WwanReadyStateCode.WwanReadyStateInitialized"                            value=":Initialized" />
        <string id="WwanReadyStateCode.WwanReadyStateSimNotInserted"                   value=":SimNotInserted" />
        <string id="WwanReadyStateCode.WwanReadyStateBadSim"                              value=":BadSim" />
        <string id="WwanReadyStateCode.WwanReadyStateFailure"                               value=":Failure" />
        <string id="WwanReadyStateCode.WwanReadyStateNotActivated"                       value=":NotActivated" />
        <string id="WwanReadyStateCode.WwanReadyStateDeviceLocked"                      value=":DeviceLocked" />

        <string id="WwanRegistrationStateCode.WwanRegisterStateUnknown"                   value=":UnKnown" />
        <string id="WwanRegistrationStateCode.WwanRegisterStateDeregistered"              value=":Deregistered" />
        <string id="WwanRegistrationStateCode.WwanRegisterStateSearching"                   value=":Searching" />
        <string id="WwanRegistrationStateCode.WwanRegisterStateHome"                        value=":Home" />
        <string id="WwanRegistrationStateCode.WwanRegisterStateRoaming"                   value=":Roaming" />
        <string id="WwanRegistrationStateCode.WwanRegisterStatePartner"                     value=":Partner" />
        <string id="WwanRegistrationStateCode.WwanRegisterStateDenied"                      value=":Denied" />

        <string id="WwanPacketServiceStateCode.WwanPacketServiceStateUnknown"                   value=":UnKnown" />
        <string id="WwanPacketServiceStateCode.WwanPacketServiceStateAttaching"                   value=":Attaching" />
        <string id="WwanPacketServiceStateCode.WwanPacketServiceStateAttached"                   value=":Attached" />
        <string id="WwanPacketServiceStateCode.WwanPacketServiceStateDetaching"                   value=":Detaching" />
        <string id="WwanPacketServiceStateCode.WwanPacketServiceStateDetached"                   value=":Detached" />

        <string id="WwanActivationStateCode.WwanActivationStateUnknown"                   value=":UnKnown" />
        <string id="WwanActivationStateCode.WwanActivationStateActivated"                   value=":Activated" />
        <string id="WwanActivationStateCode.WwanActivationStateActivating"                   value=":Activating" />
        <string id="WwanActivationStateCode.WwanActivationStateDeactivated"                   value=":Deactivated" />
        <string id="WwanActivationStateCode.WwanActivationStateDeactivating"                   value=":Deactivating" />



      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>


