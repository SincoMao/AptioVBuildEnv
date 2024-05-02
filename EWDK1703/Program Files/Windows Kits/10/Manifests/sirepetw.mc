<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation. All rights reserved.
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
<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>
    <events>
      
      <provider name="Microsoft-WindowsPhone-ToolConnectivity-Sirep"
          guid="{1E1D83B7-D071-4344-B6F9-0C9A4989D62F}"
          symbol="Microsoft_WindowsMobile_ToolConnectivity_Sirep"
          messageFileName="SirepServer.exe"
          resourceFileName="SirepServer.exe">

        <channels>

          <importChannel chid="Application" name="Application" />

          <channel name="Microsoft-WindowsPhone-ToolConnectivity-Analytic"
              chid="TCAnalytic"
              type="Analytic"
              symbol="Microsoft_WindowsPhone_ToolConnectivity_Analytic"
              enabled="false"
              value="17" />

        </channels>
        

        <!-- Keywords work much like Windows Mobile "debug zones."  They are tags that can 
             be assigned to events to break them into classes. Keyword masks are 64-bit, of
             which you may use the lower 48. For more information on keyword definitions, see 
             http://msdn.microsoft.com/en-us/library/aa382786(VS.85).aspx -->

        <keywords>
          <!-- Standard Windows Phone keywords dictated by best practices. -->
          <keyword mask="0x0000000000000001" name="Error" />
          <keyword mask="0x0000000000000002" name="Performance" />

          <!-- Server keywords -->
          <keyword mask="0x0000000000000004" name="Service" />
          <keyword mask="0x0000000000000008" name="Setup" />
          <keyword mask="0x0000000000000010" name="Shutdown" />
          <keyword mask="0x0000000000000020" name="Client" />
          <keyword mask="0x0000000000000040" name="Transaction" />
          <keyword mask="0x0000000000000080" name="State" />
          <keyword mask="0x0000000000000100" name="Broadcaster" />
          <keyword mask="0x0000000000000200" name="Echo" />
          <keyword mask="0x0000000000000400" name="Debug" />

          <!-- SirepPipe keywords -->
          <keyword mask="0x0000000000000800" name="Trace" />

          <!-- Client keywords -->
          <keyword mask="0x0000000000010000" name="InternalError" />
          <keyword mask="0x0000000000020000" name="PublicApiMisuse" />
          <keyword mask="0x0000000000040000" name="KeyInformation" />
          <keyword mask="0x0000000000080000" name="TransactionTrace" />
          <keyword mask="0x0000000000100000" name="FunctionTrace" />
          <keyword mask="0x0000000000200000" name="PublicApiTrace" />
          <keyword mask="0x0000000000400000" name="NetworkTrace" />
        </keywords>


        <!-- Tasks are used with opcodes win:Start and win:Stop to link start and stop events from
             the same task together. -->
        <tasks>

          <!-- SirepPipe tasks-->
          <task name="Communication" value="1"/>
          <task name="Threading" value="2"/>

          <!-- SirepClient tasks-->
          <task name="Task.FunctionCall" value="10"/>
        </tasks>

        <maps>
          <valueMap name="VariantBoolType">
            <map value="0x0000" message="$(string.Map.VariantBoolType.False)"/>
            <map value="0xffff" message="$(string.Map.VariantBoolType.True)"/>
          </valueMap>
        </maps>

        <!-- Event Templates -->
        <!-- Here we define the data payloads that may be written with events.
               If multiple events share the same data payload, they can use the same template.
               See the Remarks section in http://msdn.microsoft.com/en-us/library/aa382774(VS.85).aspx
               for valid inType / outType combinations.
               The "%" values noted here are for user convenience, when referencing the stringTable below. -->

        <templates>

          <!-- Server templates-->
          <template tid="Template.HResult">
            <!--%1--> <data name="hrResult" inType="win:Int32" outType="win:HResult" />
          </template>

          <template tid="Template.StringOnly">
            <!--%1--> <data name="szString" inType="win:UnicodeString" />
          </template>

          <template tid="Template.AnsiStringOnly">
            <!--%1--> <data name="szString" inType="win:AnsiString" />
          </template>

          <template tid="Template.StringAndHResult">
            <!--%1--> <data name="szString" inType="win:UnicodeString" />
            <!--%2--> <data name="hrResult" inType="win:Int32" outType="win:HResult" />
          </template>

          <template tid="Template.Win32Result">
            <!--%1--> <data name="dwWin32Result" inType="win:UInt32" outType="win:Win32Error" />
          </template>

          <template tid="Template.FunctionNameAndFileLineNumber">
            <!--%1--> <data name="szFunctionName" inType="win:AnsiString" />
            <!--%2--> <data name="nFileLineNumber" inType="win:Int32" />
          </template>

          <template tid="Template.IPv4Address">
            <!--%1--> <data name="ulIPv4Address" inType="win:UInt32" outType="win:IPv4" />
          </template>

          <template tid="Template.NoArgs">
          </template>

          <template tid="Template.Dword">
            <!--1--> <data name="dWord" inType="win:UInt32" />
          </template>

          <template tid="Template.TwoDwords">
            <!--1--> <data name="Value1" inType="win:UInt32" />
            <!--2--> <data name="Value2" inType="win:UInt32" />
          </template>

          <template tid="Template.ThreeDwords">
            <!--%1--> <data name="Value1" inType="win:UInt32" />
            <!--%2--> <data name="Value2" inType="win:UInt32" />
            <!--%3--> <data name="Value3" inType="win:UInt32" />
          </template>

          <template tid="Template.UInt32">
            <!--%1--> <data name="uint" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="Template.Integer">
            <!--%1--> <data name="Int32" inType="win:Int32" />
          </template>

          <template tid="Template.BroadcastData">
            <data name="MAC" inType="win:UnicodeString" />
            <data name="IP" inType="win:UnicodeString" />
          </template>


          <!-- SirepPipe templates-->
          <template tid="tUInt32">
            <data name="Value" inType="win:UInt32" />
          </template>

          <template tid="tUInt32Hex">
            <data name="Value" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tUInt64">
            <data name="Value" inType="win:UInt64" />
          </template>

          <template tid="tPointer">
            <data name="Value" inType="win:Pointer" />
          </template>

          <template tid="tUnicodeString">
            <data name="Value" inType="win:UnicodeString" />
          </template>

          <template tid="tThreeUInt32">
            <data name="Value1" inType="win:UInt32" />
            <data name="Value2" inType="win:UInt32" />
            <data name="Value3" inType="win:UInt32" />
          </template>
          
          <template tid="tTwoUnicodeStrings">
            <data name="Value1" inType="win:UnicodeString" />
            <data name="Value2" inType="win:UnicodeString" />
          </template>

          <template tid="tBindAttempt">
            <data name="IPAddress" inType="win:UInt32" outType="win:HexInt32" />
            <data name="Port" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tPipeAndTwoSizes">
            <data name="Pipe" inType="win:UInt64" />
            <data name="ReceivedSize" inType="win:UInt32" />
            <data name="ExpectedSize" inType="win:UInt32" />
          </template>

          <template tid="tRecvFromSizes">
            <data name="Socket" inType="win:UInt64" />
            <data name="ReceivedSize" inType="win:UInt32" />
            <data name="ExpectedSize" inType="win:UInt32" />
            <data name="FromAddressSize" inType="win:UInt32" />
          </template>

          <template tid="tWaitForTwoHandles">
            <data name="Handle1" inType="win:UInt64" />
            <data name="Handle2" inType="win:UInt64" />
            <data name="HandleCount" inType="win:UInt32" />
          </template>

          <template tid="tXYZFloat">
            <data name="X" inType="win:Float" />
            <data name="Y" inType="win:Float" />
            <data name="Z" inType="win:Float" />
          </template>

          <template tid="tTwoDouble">
            <data name="Value1" inType="win:Double" />
            <data name="Value2" inType="win:Double" />
          </template>

          <template tid="tSocketClose">
            <data name="Value1" inType="win:Double" />
            <data name="Value2" inType="win:Int32" />
          </template>

          <template tid="tSendingPacket">
            <data name="Type" inType="win:UInt32" />
            <data name="DataSize" inType="win:UInt32" />
            <data name="SendSize" inType="win:UInt32" />
            <data name="Timeout" inType="win:UInt32" />
          </template>

          <template tid="tSendingPacketNoTimeout">
            <data name="Type" inType="win:UInt32" />
            <data name="DataSize" inType="win:UInt32" />
            <data name="SendSize" inType="win:UInt32" />
          </template>
          
          <template tid="tReceivedPacket">
            <data name="Type" inType="win:UInt32" />
            <data name="DataSize" inType="win:UInt32" />
          </template>

          <template tid="tSizeAndTimeout">
            <data name="Bytes" inType="win:UInt32" />
            <data name="Timeout" inType="win:UInt32" />
          </template>

          <template tid="tTimeoutAndHresult">
            <data name="Timeout" inType="win:UInt32" />
            <data name="HRESULT" inType="win:Int32" outType="win:HResult" />
          </template>

          <!-- SirepClient templates-->

          <template tid="Template.UInt64">
            <data name="ullNumber2" inType="win:UInt64" />
          </template>

          <template tid="Template.AnsiString">
            <data name="szString2" inType="win:AnsiString" />
          </template>

          <template tid="Template.UnicodeString">
            <data name="wcszString2" inType="win:UnicodeString" />
          </template>

          <template tid="Template.AnsiString.UInt32">
            <data name="szString2" inType="win:AnsiString" />
            <data name="ulNumber2" inType="win:UInt32" />
          </template>

          <template tid="Template.AnsiString.DWord.UnicodeString">
            <data name="szString2" inType="win:AnsiString" />
            <data name="dwValue" inType="win:UInt32" outType="win:HexInt32" />
            <data name="wcszString3" inType="win:UnicodeString" />
          </template>

          <template tid="Template.AnsiString.UInt32.VariantBool">
            <data name="szString2" inType="win:AnsiString" />
            <data name="ulNumber2" inType="win:UInt32" />
            <data name="usBool" inType="win:UInt16" map="VariantBoolType" />
          </template>

          <template tid="Template.AnsiString.AnsiString">
            <data name="szString2" inType="win:AnsiString" />
            <data name="szString3" inType="win:AnsiString" />
          </template>

          <template tid="Template.AnsiString.UnicodeString">
            <data name="szString2" inType="win:AnsiString" />
            <data name="wcszString3" inType="win:UnicodeString" />
          </template>

          <template tid="Template.HResult.HResult">
            <data name="hrResult1" inType="win:Int32" outType="win:HResult" />
            <data name="hrResult2" inType="win:Int32" outType="win:HResult" />
          </template>

          <template tid="Template.AnsiString.HResult">
            <data name="szString2" inType="win:AnsiString" />
            <data name="hrResult" inType="win:Int32" outType="win:HResult" />
          </template>

          <template tid="Template.AnsiString.HResult.AnsiString">
            <data name="szString2" inType="win:AnsiString" />
            <data name="hrResult" inType="win:Int32" outType="win:HResult" />
            <data name="szString3" inType="win:AnsiString" />
          </template>

          <template tid="Template.AnsiString.HResult.UnicodeString">
            <data name="szString2" inType="win:AnsiString" />
            <data name="hrResult" inType="win:Int32" outType="win:HResult" />
            <data name="wcszString3" inType="win:UnicodeString" />
          </template>

          <template tid="Template.AnsiString.IPv4AddressInNetOrder">
            <data name="szString2" inType="win:AnsiString" />
            <data name="ulIPv4AddressInNetOrder" inType="win:UInt32" outType="win:IPv4" />
          </template>

          <template tid="Template.AnsiString.AnsiString.HResult">
            <data name="szString2" inType="win:AnsiString" />
            <data name="szString3" inType="win:AnsiString" />
            <data name="hrResult" inType="win:Int32" outType="win:HResult" />
          </template>

          <template tid="Template.AnsiString.UInt32.AnsiString.HResult">
            <data name="szString2" inType="win:AnsiString" />
            <data name="ulNumber2" inType="win:UInt32" />
            <data name="szString3" inType="win:AnsiString" />
            <data name="hrResult" inType="win:Int32" outType="win:HResult" />
          </template>

          <template tid="Template.AnsiString.AnsiString.AnsiString.UInt32.UInt32">
            <data name="szString2" inType="win:AnsiString" />
            <data name="szString3" inType="win:AnsiString" />
            <data name="szString4" inType="win:AnsiString" />
            <data name="ulNumber2" inType="win:UInt32" />
            <data name="ulNumber3" inType="win:UInt32" />
          </template>

          <template tid="Template.AnsiString.Endpoint.Endpoint">

            <data name="szString2" inType="win:AnsiString" />

            <data name="epEndpoint1_bIsNull" inType="win:Boolean" />
            <data name="epEndpoint1_wcszIpAddress" inType="win:UnicodeString" />
            <data name="epEndpoint1_usSirepPort" inType="win:UInt16" />
            <data name="epEndpoint1_usEchoPort" inType="win:UInt16" />

            <data name="epEndppoint2_bIsNull" inType="win:Boolean" />
            <data name="epEndppoint2_wcszIpAddress" inType="win:UnicodeString" />
            <data name="epEndppoint2_usSirepPort" inType="win:UInt16" />
            <data name="epEndppoint2_usEchoPort" inType="win:UInt16" />

          </template>

          <template tid="Template.AnsiString.HResult.FileInfox">

            <data name="szString2" inType="win:AnsiString" />

            <data name="hrResult" inType="win:Int32" outType="win:HResult" />

            <data name="fiFileInfo_bIsNull" inType="win:Boolean" />
            <data name="fiFileInfo_dwFileAttributes" inType="win:UInt32" outType="win:HexInt32" />
            <data name="fiFileInfo_cbFileSize" inType="win:Int64" />
            <data name="fiFileInfo_ullCreationTime" inType="win:UInt64" />
            <data name="fiFileInfo_ullLastAccessTime" inType="win:UInt64" />
            <data name="fiFileInfo_ullLastWriteTime" inType="win:UInt64" />

          </template>

          <template tid="Template.AnsiString.HResult.DWord">

            <data name="szString2" inType="win:AnsiString" />

            <data name="hrResult" inType="win:Int32" outType="win:HResult" />
            <data name="dwValue" inType="win:UInt32" outType="win:HexInt32" />

          </template>


          <template tid="Template.AnsiString.UInt32.UInt32">

            <data name="szString2" inType="win:AnsiString" />

            <data name="dw1" inType="win:UInt32" />
            <data name="dw2" inType="win:UInt32" />

          </template>

          <template tid="Template.AnsiString.HResult.UInt64">

            <data name="szString2" inType="win:AnsiString" />

            <data name="hrResult" inType="win:Int32" outType="win:HResult" />
            <data name="ullNumber2" inType="win:UInt64" />

          </template>

          <template tid="Template.AnsiString.HResult.VariantBool">

            <data name="szString2" inType="win:AnsiString" />

            <data name="hrResult" inType="win:Int32" outType="win:HResult" />
            <data name="usBool" inType="win:UInt16" map="VariantBoolType" />

          </template>

          <template tid="Template.SirepClient.PublicApiTrace.Enter.SirepPutFile">

            <data name="szFunctionName" inType="win:AnsiString" />

            <data name="dwTimeoutInMilliseconds" inType="win:UInt32" />
            <data name="usAsync" inType="win:UInt16" map="VariantBoolType" />
            <data name="wcszSourceFullPath" inType="win:UnicodeString" />
            <data name="wcszDestinationFullPath" inType="win:UnicodeString" />
            <data name="usOverwrite" inType="win:UInt16" map="VariantBoolType" />

          </template>

          <template tid="Template.SirepClient.PublicApiTrace.Enter.SirepLaunch">

            <data name="szFunctionName" inType="win:AnsiString" />

            <data name="wcszCommand" inType="win:UnicodeString" />
            <data name="wcszCommandArguments" inType="win:UnicodeString" />
            <data name="dwLaunchFlags" inType="win:UInt32" outType="win:HexInt32" />

          </template>

          <template tid="Template.SirepClient.PublicApiTrace.Enter.SirepGetFile">

            <data name="szFunctionName" inType="win:AnsiString" />

            <data name="dwTimeoutInMilliseconds" inType="win:UInt32" />
            <data name="wcszSourceFullPath" inType="win:UnicodeString" />
            <data name="wcszDestinationFullPath" inType="win:UnicodeString" />
            <data name="usOverwrite" inType="win:UInt16" map="VariantBoolType" />

          </template>

          <template tid="Template.SirepClient.PublicApiTrace.Enter.LaunchWithOutput">

            <data name="szFunctionName" inType="win:AnsiString" />

            <data name="dwTimeoutInMilliseconds" inType="win:UInt32" />
            <data name="wcszCommand" inType="win:UnicodeString" />
            <data name="wcszArguments" inType="win:UnicodeString" />
            <data name="wcszWorkingFolder" inType="win:UnicodeString" />
            <data name="dwLaunchFlags" inType="win:UInt32" outType="win:HexInt32" />
            <data name="bOutputCallbackProvided" inType="win:Boolean" />

          </template>

          <template tid="Template.SirepClient.PublicApiTrace.Enter.CreateProcess">

            <data name="szFunctionName" inType="win:AnsiString" />

            <data name="wcszCommand" inType="win:UnicodeString" />
            <data name="wcszCommandArguments" inType="win:UnicodeString" />
            <data name="wcszWorkingFolder" inType="win:UnicodeString" />
            <data name="dwLaunchFlags" inType="win:UInt32" outType="win:HexInt32" />

          </template>

          <template tid="Template.CodePathAndHresult">
            <data name="CodePath" inType="win:UInt32" />
            <data name="HRESULT" inType="win:Int32" outType="win:HResult" />
          </template>

          <template tid="Template.SirepClient.CodePathAndPointer">
            <data name="CodePath" inType="win:UInt32" />
            <data name="Value" inType="win:Pointer" />
          </template>

          <template tid="Template.SirepClient.CodePathAndWin32Error">
            <data name="CodePath" inType="win:UInt32" />
            <data name="ErrorCode" inType="win:UInt32" outType="win:Win32Error" />
          </template>
          
        </templates>


        <opcodes>
          <!--SirepPipe Opcodes -->
          <opcode value="101"
                  name="SocketoptFailed"
                  symbol="OPCODE_SOCKETOPTFAILED"
                  message="$(string.Opcode.SocketoptFailed)"/>

          <opcode value="102"
                  name="RecvFailed"
                  symbol="OPCODE_RECVFAILED"
                  message="$(string.Opcode.RecvFailed)"/>

          <opcode value="103"
                  name="ReceivedPipeGuid"
                  symbol="OPCODE_RECEIVEDPIPEGUID"
                  message="$(string.Opcode.ReceivedPipeGuid)"/>

          <opcode value="104"
                  name="PipeGuidMatch"
                  symbol="OPCODE_PIPEGUIDMATCH"
                  message="$(string.Opcode.PipeGuidMatch)"/>

          <opcode value="106"
                  name="NoMatchingPipe"
                  symbol="OPCODE_NOMATCHINGPIPE"
                  message="$(string.Opcode.NoMatchingPipe)"/>

          <opcode value="107"
                  name="LoadLibraryFailed"
                  symbol="OPCODE_LOADLIBRARYFAILED"
                  message="$(string.Opcode.LoadLibraryFailed)"/>

          <opcode value="109"
                  name="SendAcknowledgementFailed"
                  symbol="OPCODE_SENDACKNOWLEDGEMENTFAILED"
                  message="$(string.Opcode.SendAcknowledgementFailed)"/>

          <opcode value="110"
                  name="CreateThreadFailed"
                  symbol="OPCODE_CREATETHREADFAILED"
                  message="$(string.Opcode.CreateThreadFailed)"/>

          <opcode value="111"
                  name="BindAttempt"
                  symbol="OPCODE_BINDATTEMPT"
                  message="$(string.Opcode.BindAttempt)"/>

          <opcode value="112"
                  name="BindRetryFailed"
                  symbol="OPCODE_BINDRETRYFAILED"
                  message="$(string.Opcode.BindRetryFailed)"/>

          <opcode value="113"
                  name="BindFatalError"
                  symbol="OPCODE_BINDFATALERROR"
                  message="$(string.Opcode.BindFatalError)"/>

          <opcode value="114"
                  name="ListenFailed"
                  symbol="OPCODE_LISTENFAILED"
                  message="$(string.Opcode.ListenFailed)"/>

          <opcode value="115"
                  name="AcceptFailed"
                  symbol="OPCODE_ACCEPTFAILED"
                  message="$(string.Opcode.AcceptFailed)"/>

          <opcode value="116"
                  name="AcceptSuccess"
                  symbol="OPCODE_ACCEPTSUCCESS"
                  message="$(string.Opcode.AcceptSuccess)"/>

          <opcode value="117"
                  name="ReceiveCommandFailed"
                  symbol="OPCODE_RECEIVECOMMANDFAILED"
                  message="$(string.Opcode.ReceiveCommandFailed)"/>

          <opcode value="124"
                  name="ReceivedData"
                  symbol="OPCODE_RECEIVEDDATA"
                  message="$(string.Opcode.ReceivedData)"/>

          <opcode value="125"
                  name="SendFailed"
                  symbol="OPCODE_SENDFAILED"
                  message="$(string.Opcode.SendFailed)"/>

          <opcode value="126"
                  name="SentData"
                  symbol="OPCODE_SENTDATA"
                  message="$(string.Opcode.SentData)"/>

          <opcode value="127"
                  name="WSACreateEventFailed"
                  symbol="OPCODE_WSACREATEEVENTFAILED"
                  message="$(string.Opcode.WSACreateEventFailed)"/>

          <opcode value="128"
                  name="WSAEventSelectFailed"
                  symbol="OPCODE_WSAEVENTSELECTFAILED"
                  message="$(string.Opcode.WSAEventSelectFailed)"/>

          <opcode value="129"
                  name="WaitForThreadReservation"
                  symbol="OPCODE_WAITFORTHREADRESERVATION"
                  message="$(string.Opcode.WaitForThreadReservation)"/>

          <opcode value="130"
                  name="WaitResultValue"
                  symbol="OPCODE_WAITRESULTVALUE"
                  message="$(string.Opcode.WaitResultValue)"/>

          <opcode value="131"
                  name="ReleaseThreadReservation"
                  symbol="OPCODE_RELEASETHREADRESERVATION"
                  message="$(string.Opcode.ReleaseThreadReservation)"/>

          <opcode value="132"
                  name="WaitForWSAEventSelect"
                  symbol="OPCODE_WSAEVENTSELECT"
                  message="$(string.Opcode.WaitForWSAEventSelect)"/>

          <opcode value="133"
                  name="WSAEnumNetworkEventsFailed"
                  symbol="OPCODE_WSAENUMNETWORKEVENTSFAILED"
                  message="$(string.Opcode.WSAEnumNetworkEventsFailed)"/>

          <opcode value="141"
                  name="ConnectFailed"
                  symbol="OPCODE_CONNECTFAILED"
                  message="$(string.Opcode.ConnectFailed)"/>

          <opcode value="142"
                  name="RecvFromFailed"
                  symbol="OPCODE_RECVFROMFAILED"
                  message="$(string.Opcode.RecvFromFailed)"/>

          <opcode value="143"
                  name="RecvFromSizes"
                  symbol="OPCODE_RECVFROMSIZES"
                  message="$(string.Opcode.RecvFromSizes)"/>

          <opcode value="144"
                  name="SocketClose"
                  symbol="OPCODE_SOCKETCLOSE"
                  message="$(string.Opcode.SocketClose)"/>

          <opcode value="153"
                  name="ProcessShutDown"
                  symbol="OPCODE_PROCESSSHUTDOWN"
                  message="$(string.Opcode.ProcessShutDown)"/>

          <opcode value="154"
                  name="PipeThreadStart"
                  symbol="OPCODE_PIPETHREADSTART"
                  message="$(string.Opcode.PipeThreadStart)"/>

          <opcode value="155"
                  name="PipeThreadFinished"
                  symbol="OPCODE_PIPETHREADFINISHED"
                  message="$(string.Opcode.PipeThreadFinished)"/>

          <opcode value="156"
                  name="SendingPacket"
                  symbol="OPCODE_SENDINGPACKET"
                  message="$(string.Opcode.SendingPacket)"/>

          <opcode value="157"
                  name="ReceivedPacket"
                  symbol="OPCODE_RECEIVEDPACKET"
                  message="$(string.Opcode.ReceivedPacket)"/>

          <opcode value="158"
                  name="ReceivePacketFailed"
                  symbol="OPCODE_RECEIVEPACKETFAILED"
                  message="$(string.Opcode.ReceivePacketFailed)"/>

          <opcode value="159"
                  name="SendPacketFailed"
                  symbol="OPCODE_SENDPACKETFAILED"
                  message="$(string.Opcode.SendPacketFailed)"/>

          <opcode value="160"
                  name="ReceivingPacket"
                  symbol="OPCODE_RECEIVINGPACKET"
                  message="$(string.Opcode.ReceivingPacket)"/>

          <opcode value="161"
                  name="PipeReceiving"
                  symbol="OPCODE_PIPERECEIVING"
                  message="$(string.Opcode.PipeReceiving)"/>

          <opcode value="162"
                  name="PipeReceived"
                  symbol="OPCODE_PIPERECEIVED"
                  message="$(string.Opcode.PipeReceived)"/>

          <opcode value="163"
                  name="PipeReceiveFailed"
                  symbol="OPCODE_PIPERECEIVEFAILED"
                  message="$(string.Opcode.PipeReceiveFailed)"/>

          <opcode value="164"
                  name="PipeSending"
                  symbol="OPCODE_PIPESENDING"
                  message="$(string.Opcode.PipeSending)"/>

          <opcode value="165"
                  name="PipeSent"
                  symbol="OPCODE_PIPESENT"
                  message="$(string.Opcode.PipeSent)"/>

          <opcode value="166"
                  name="PipeSendFailed"
                  symbol="OPCODE_PIPESENDFAILED"
                  message="$(string.Opcode.PipeSendFailed)"/>

          <opcode value="167"
                  name="SendPacketSucceeded"
                  symbol="OPCODE_SENDPACKETSUCCEEDED"
                  message="$(string.Opcode.SendPacketSucceeded)"/>

          <opcode value="168"
                  name="SendingHresult"
                  symbol="OPCODE_SENDINGHRESULT"
                  message="$(string.Opcode.SendingHresult)"/>

          <opcode value="169"
                  name="SendHresultFailed"
                  symbol="OPCODE_SENDHRESULTFAILED"
                  message="$(string.Opcode.SendHresultFailed)"/>

          <opcode value="170"
                  name="SendHresultSucceeded"
                  symbol="OPCODE_SENDHRESULTSUCCEEDED"
                  message="$(string.Opcode.SendHresultSucceeded)"/>

          <opcode value="171"
                  name="ReceivingHresult"
                  symbol="OPCODE_RECEIVINGHRESULT"
                  message="$(string.Opcode.ReceivingHresult)"/>

          <opcode value="172"
                  name="ReceiveHresultFailed"
                  symbol="OPCODE_RECEIVEHRESULTFAILED"
                  message="$(string.Opcode.ReceiveHresultFailed)"/>

          <opcode value="173"
                  name="ReceiveHresultSucceeded"
                  symbol="OPCODE_RECEIVEHRESULTSUCCEEDED"
                  message="$(string.Opcode.ReceiveHresultSucceeded)"/>

          <opcode value="174"
                  name="ReceiveHresultIncorrect"
                  symbol="OPCODE_RECEIVEHRESULTINCORRECT"
                  message="$(string.Opcode.ReceiveHresultIncorrect)"/>

          <opcode value="175"
                  name="SetNoDelayFailed"
                  symbol="OPCODE_SETNODELAYFAILED"
                  message="$(string.Opcode.SetNoDelayFailed)"/>

          <opcode value="176"
                  name="SendingHresultNoTimeout"
                  symbol="OPCODE_SENDINGHRESULTNOTIMEOUT"
                  message="$(string.Opcode.SendingHresultNoTimeout)"/>

          <opcode value="177"
                  name="SendingPacketNoTimeout"
                  symbol="OPCODE_SENDINGPACKETNOTIMEOUT"
                  message="$(string.Opcode.SendingPacketNoTimeout)"/>

          <opcode value="178"
                  name="ReceivingHresultNoTimeout"
                  symbol="OPCODE_RECEIVINGHRESULTNOTIMEOUT"
                  message="$(string.Opcode.ReceivingHresultNoTimeout)"/>

          <opcode value="179"
                  name="PipeReceivingNoTimeout"
                  symbol="OPCODE_PIPERECEIVINGNOTIMEOUT"
                  message="$(string.Opcode.PipeReceivingNoTimeout)"/>

          <opcode value="180"
                  name="PipeSendingNoTimeout"
                  symbol="OPCODE_PIPESENDINGNOTIMEOUT"
                  message="$(string.Opcode.PipeSendingNoTimeout)"/>

          <opcode value="182"
                  name="SendingHresultSOK"
                  symbol="OPCODE_SENDINGHRESULTSOK"
                  message="$(string.Opcode.SendingHresultSOK)"/>

          <opcode value="183"
                  name="SendingHresultNoTimeoutSOK"
                  symbol="OPCODE_SENDINGHRESULTNOTIMEOUTSOK"
                  message="$(string.Opcode.SendingHresultNoTimeoutSOK)"/>

          <opcode value="184"
                  name="ReceiveHresultSucceededSOK"
                  symbol="OPCODE_RECEIVEHRESULTSUCCEEDEDSOK"
                  message="$(string.Opcode.ReceiveHresultSucceededSOK)"/>


          <!-- SirepClient Opcodes -->
          <opcode value="10"
                  name="ClientSirepConnectFailed"
                  symbol="OPCODE_CLIENTSIREPCONNECTFAILED"
                  message="$(string.Opcode.ClientSirepConnectFailed)"/>

          <opcode value="11"
                  name="ClientSirepConnectProtocolAlreadyCreated"
                  symbol="OPCODE_CLIENTSIREPCONNECTPROTOCOLALREADYCREATED"
                  message="$(string.Opcode.ClientSirepConnectProtocolAlreadyCreated)"/>

          <opcode value="12"
                  name="ClientSirepConnectProtocolDetected"
                  symbol="OPCODE_CLIENTSIREPCONNECTPROTOCOLDETECTED"
                  message="$(string.Opcode.ClientSirepConnectProtocolDetected)"/>

          <opcode value="13"
                  name="SetSendReceiveTimeoutEnter"
                  symbol="OPCODE_SETSENDRECEIVETIMEOUTENTER"
                  message="$(string.Opcode.SetSendReceiveTimeoutEnter)"/>

          <opcode value="14"
                  name="SetSendReceiveTimeoutExit"
                  symbol="OPCODE_SETSENDRECEIVETIMEOUTEXIT"
                  message="$(string.Opcode.SetSendReceiveTimeoutExit)"/>

          <opcode value="15"
                  name="DestroyingPipes"
                  symbol="OPCODE_DESTROYINGPIPES"
                  message="$(string.Opcode.DestroyingPipes)"/>

          <opcode value="16"
                  name="Protocol2InitialSetupStart"
                  symbol="OPCODE_PROTOCOL2INITIALSETUPSTART"
                  message="$(string.Opcode.Protocol2InitialSetupStart)"/>

          <opcode value="17"
                  name="Protocol2InitialSetupFailed"
                  symbol="OPCODE_PROTOCOL2INITIALSETUPFAILED"
                  message="$(string.Opcode.Protocol2InitialSetupFailed)"/>

          <opcode value="18"
                  name="CreatedEvent"
                  symbol="OPCODE_CREATEDEVENT"
                  message="$(string.Opcode.CreatedEvent)"/>

          <opcode value="19"
                  name="Protocol2InitialSetupCreatedPipe"
                  symbol="OPCODE_PROTOCOL2INITIALSETUPCREATEDPIPE"
                  message="$(string.Opcode.Protocol2InitialSetupCreatedPipe)"/>

          <opcode value="20"
                  name="Protocol2InitialSetupFinished"
                  symbol="OPCODE_PROTOCOL2INITIALSETUPFINISHED"
                  message="$(string.Opcode.Protocol2InitialSetupFinished)"/>

          <opcode value="21"
                  name="Protocol2SirepConnectAlreadyConnected"
                  symbol="OPCODE_PROTOCOL2SIREPCONNECTALREADYCONNECTED"
                  message="$(string.Opcode.Protocol2SirepConnectAlreadyConnected)"/>

          <opcode value="22"
                  name="Protocol2SirepConnectFailed"
                  symbol="OPCODE_PROTOCOL2SIREPCONNECTFAILED"
                  message="$(string.Opcode.Protocol2SirepConnectFailed)"/>

          <opcode value="23"
                  name="Protocol2DisconnectingPipe"
                  symbol="OPCODE_PROTOCOL2DISCONNECTINGPIPE"
                  message="$(string.Opcode.Protocol2DisconnectingPipe)"/>

          <opcode value="24"
                  name="Protocol2SirepDisconnectAlreadyDisconnected"
                  symbol="OPCODE_PROTOCOL2SIREPDISCONNECTALREADYDISCONNECTED"
                  message="$(string.Opcode.Protocol2SirepDisconnectAlreadyDisconnected)"/>

          <opcode value="25"
                  name="SettingEvent"
                  symbol="OPCODE_SETTINGEVENT"
                  message="$(string.Opcode.SettingEvent)"/>

          <opcode value="26"
                  name="Protocol2SirepDisconnectFailed"
                  symbol="OPCODE_PROTOCOL2SIREPDISCONNECTFAILED"
                  message="$(string.Opcode.Protocol2SirepDisconnectFailed)"/>

          <opcode value="27"
                  name="ResettingEvent"
                  symbol="OPCODE_RESETTINGEVENT"
                  message="$(string.Opcode.ResettingEvent)"/>

          <opcode value="28"
                  name="Protocol2ExecuteFailed"
                  symbol="OPCODE_PROTOCOL2EXECUTEFAILED"
                  message="$(string.Opcode.Protocol2ExecuteFailed)"/>

          <opcode value="29"
                  name="Protocol2ExecuteFinished"
                  symbol="OPCODE_PROTOCOL2EXECUTEFINISHED"
                  message="$(string.Opcode.Protocol2ExecuteFinished)"/>

          <opcode value="30"
                  name="Protocol2ExecuteTextCallback"
                  symbol="OPCODE_PROTOCOL2EXECUTETEXTCALLBACK"
                  message="$(string.Opcode.Protocol2ExecuteTextCallback)"/>

          <opcode value="31"
                  name="Protocol2CheckPingFailed"
                  symbol="OPCODE_PROTOCOL2CHECKPINGFAILED"
                  message="$(string.Opcode.Protocol2CheckPingFailed)"/>

          <opcode value="32"
                  name="Protocol2SirepPingConnecting"
                  symbol="OPCODE_PROTOCOL2SIREPPINGCONNECTING"
                  message="$(string.Opcode.Protocol2SirepPingConnecting)"/>

          <opcode value="33"
                  name="Protocol2SirepPingSucceeded"
                  symbol="OPCODE_PROTOCOL2SIREPPINGSUCCEEDED"
                  message="$(string.Opcode.Protocol2SirepPingSucceeded)"/>

          <opcode value="34"
                  name="Protocol2SirepPingFailed"
                  symbol="OPCODE_PROTOCOL2SIREPPINGFAILED"
                  message="$(string.Opcode.Protocol2SirepPingFailed)"/>

          <opcode value="35"
                  name="Protocol2SirepPutFileFailed"
                  symbol="OPCODE_PROTOCOL2SIREPPUTFILEFAILED"
                  message="$(string.Opcode.Protocol2SirepPutFileFailed)"/>

          <opcode value="36"
                  name="Protocol2SirepPutFileSucceeded"
                  symbol="OPCODE_PROTOCOL2SIREPPUTFILESUCCEEDED"
                  message="$(string.Opcode.Protocol2SirepPutFileSucceeded)"/>

          <opcode value="37"
                  name="Protocol2SirepGetFileFailed"
                  symbol="OPCODE_PROTOCOL2SIREPGETFILEFAILED"
                  message="$(string.Opcode.Protocol2SirepGetFileFailed)"/>

          <opcode value="38"
                  name="Protocol2SirepWriteFileFailed"
                  symbol="OPCODE_PROTOCOL2SIREPWRITEFILEFAILED"
                  message="$(string.Opcode.Protocol2SirepWriteFileFailed)"/>

          <opcode value="39"
                  name="Protocol2SirepGetDeviceInfoFailed"
                  symbol="OPCODE_PROTOCOL2SIREPGETDEVICEINFOFAILED"
                  message="$(string.Opcode.Protocol2SirepGetDeviceInfoFailed)"/>

          <opcode value="40"
                  name="Protocol2SirepGetFileInfoFailed"
                  symbol="OPCODE_PROTOCOL2SIREPGETFILEINFOFAILED"
                  message="$(string.Opcode.Protocol2SirepGetFileInfoFailed)"/>

          <opcode value="41"
                  name="Protocol2SirepCheckTimeRemainingFailed"
                  symbol="OPCODE_PROTOCOL2SIREPCHECKTIMEREMAININGFAILED"
                  message="$(string.Opcode.Protocol2SirepCheckTimeRemainingFailed)"/>

          <opcode value="42"
                  name="Protocol2SirepConnecting"
                  symbol="OPCODE_PROTOCOL2SIREPCONNECTING"
                  message="$(string.Opcode.Protocol2SirepConnecting)"/>

          <opcode value="43"
                  name="SocketCreated"
                  symbol="OPCODE_SOCKETCREATED"
                  message="$(string.Opcode.SocketCreated)"/>

          <opcode value="44"
                  name="ConnectCall"
                  symbol="OPCODE_CONNECTCALL"
                  message="$(string.Opcode.ConnectCall)"/>

          <opcode value="45"
                  name="ConnectSuccess"
                  symbol="OPCODE_CONNECTSUCCESS"
                  message="$(string.Opcode.ConnectSuccess)"/>

          <opcode value="46"
                  name="PipeConnectFailed"
                  symbol="OPCODE_PIPECONNECTFAILED"
                  message="$(string.Opcode.PipeConnectFailed)"/>

          <opcode value="60"
                  name="_SirepClient_PublicApiMisuse_WithHResultAndMessage"
                  symbol="OPCODE__SIREPCLIENT_PUBLICAPIMISUSE_WITHHRESULTANDMESSAGE"
                  message="$(string.Opcode.PublicApiMisuse)"/>

          <opcode value="61"
                  name="_SirepClient_PublicApiMisuse_NotSupported"
                  symbol="OPCODE__SIREPCLIENT_PUBLICAPIMISUSE_NOTSUPPORTED"
                  message="$(string.Opcode.PublicApiMisuse)"/>

          <opcode value="62"
                  name="_SirepClient_PublicApiMisuse_ReturningFailureHResultFromOnLaunchOutput"
                  symbol="OPCODE__SIREPCLIENT_PUBLICAPIMISUSE_RETURNINGFAILUREHRESULTFROMONLAUNCHOUTPUT"/>

          <opcode value="63"
                  name="SirepInitializeNotSupported"
                  symbol="OPCODE_SIREPINITIALIZENOTSUPPORTED"/>

          <opcode value="64"
                  name="Protocol1SirepConnectAlreadyConnected"
                  symbol="OPCODE_PROTOCOL1SIREPCONNECTALREADYCONNECTED"
                  message="$(string.Opcode.Protocol1SirepConnectAlreadyConnected)"/>

          <opcode value="65"
                  name="ReceivingPacketNoTimeout"
                  symbol="OPCODE_RECEIVINGPACKETNOTIMEOUT"
                  message="$(string.Opcode.ReceivingPacketNoTimeout)"/>

          <opcode value="66"
                  name="GetFileSizeExFailed"
                  symbol="OPCODE_GETFILESIZEEXFAILED"
                  message="$(string.Opcode.GetFileSizeExFailed)"/>

          <opcode value="67"
                  name="WSAStartupFailed"
                  symbol="OPCODE_WSASTARTUPFAILED"
                  message="$(string.Opcode.WSAStartupFailed)"/>

          <opcode value="68"
                  name="WSACleanupFailed"
                  symbol="OPCODE_WSACLEANUPFAILED"
                  message="$(string.Opcode.WSACleanupFailed)"/>

          
          <!-- Sirep Server Opcodes -->
          <opcode value="80"
                  name="PeekNamedPipeFailed"
                  symbol="OPCODE_PEEKNAMEDPIPEFAILED"
                  message="$(string.Opcode.PeekNamedPipeFailed)"/>

          <opcode value="81"
                  name="ReadChildPipeFailed"
                  symbol="OPCODE_READCHILDPIPEFAILED"
                  message="$(string.Opcode.ReadChildPipeFailed)"/>

          <opcode value="82"
                  name="CheckLaunchParametersFailed"
                  symbol="OPCODE_CHECKLAUNCHPARAMETERSFAILED"
                  message="$(string.Opcode.CheckLaunchParametersFailed)"/>

          <opcode value="83"
                  name="LaunchWithOutputFailed"
                  symbol="OPCODE_LAUNCHWITHOUTPUTFAILED"
                  message="$(string.Opcode.LaunchWithOutputFailed)"/>

          <opcode value="84"
                  name="CheckLaunchStringFailed"
                  symbol="OPCODE_CHECKLAUNCHSTRINGFAILED"
                  message="$(string.Opcode.CheckLaunchStringFailed)"/>

          <opcode value="85"
                  name="LaunchWithStringsFailed"
                  symbol="OPCODE_LAUNCHWITHSTRINGSFAILED"
                  message="$(string.Opcode.LaunchWithStringsFailed)"/>

          <opcode value="86"
                  name="BroadcastData"
                  symbol="OPCODE_BROADCASTDATA"
                  message="$(string.Opcode.BroadcastData)"/>

          <opcode value="87"
                  name="CreatingProcess"
                  symbol="OPCODE_CREATINGPROCESS"
                  message="$(string.Opcode.CreatingProcess)"/>

          <opcode value="88"
                  name="CreatingDestinationFile"
                  symbol="OPCODE_CREATINGDESTINATIONFILE"
                  message="$(string.Opcode.CreatingDestinationFile)"/>

          <opcode value="89"
                  name="OpeningSourceFile"
                  symbol="OPCODE_OPENINGSOURCEFILE"
                  message="$(string.Opcode.OpeningSourceFile)"/>

          <opcode value="90"
                  name="ShellIsReady"
                  symbol="OPCODE_SHELLISREADY"
                  message="$(string.Opcode.ShellIsReady)"/>

          <opcode value="91"
                  name="ShellIsNotReady"
                  symbol="OPCODE_SHELLISNOTREADY"
                  message="$(string.Opcode.ShellIsNotReady)"/>

          <opcode value="92"
                  name="VirtualAllocFailed"
                  symbol="OPCODE_VIRTUALALLOCFAILED"
                  message="$(string.Opcode.VirtualAllocFailed)"/>

          <opcode value="93"
                  name="PutFileOnDeviceFailed"
                  symbol="OPCODE_PUTFILEONDEVICEFAILED"
                  message="$(string.Opcode.PutFileOnDeviceFailed)"/>

          <opcode value="94"
                  name="CreatePipeFailed"
                  symbol="OPCODE_CREATEPIPEFAILED"
                  message="$(string.Opcode.CreatePipeFailed)"/>

          <opcode value="95"
                  name="CreateEventFailed"
                  symbol="OPCODE_CREATEEVENTFAILED"
                  message="$(string.Opcode.CreateEventFailed)"/>

          <opcode value="96"
                  name="SetHandleInformationFailed"
                  symbol="OPCODE_SETHANDLEINFORMATIONFAILED"
                  message="$(string.Opcode.SetHandleInformationFailed)"/>

          <opcode value="97"
                  name="FormatSpecialPathWFailed"
                  symbol="OPCODE_FORMATSPECIALPATHWFAILED"
                  message="$(string.Opcode.FormatSpecialPathWFailed)"/>

          <opcode value="98"
                  name="IsPermittedPathWFailed"
                  symbol="OPCODE_ISPERMITTEDPATHWFAILED"
                  message="$(string.Opcode.IsPermittedPathWFailed)"/>

          <opcode value="99"
                  name="CreateProcessInChamberFailed"
                  symbol="OPCODE_CREATEPROCESSINCHAMBERFAILED"
                  message="$(string.Opcode.CreateProcessInChamberFailed)"/>

          <opcode value="100"
                  name="FindFirstFileFailed"
                  symbol="OPCODE_FINDFIRSTFILEFAILED"
                  message="$(string.Opcode.FindFirstFileFailed)"/>

          <opcode value="201"
                  name="GetFileInformation"
                  symbol="OPCODE_GETFILEINFORMATION"
                  message="$(string.Opcode.GetFileInformation)"/>
          
        </opcodes>


        <!-- SirepServer Events -->
        <!-- Here we define the events that this provider writes.
             For information on opcodes, see http://msdn.microsoft.com/en-us/library/aa383956(VS.85).aspx. -->
        <events>

          <!--SirepServer Errors-->
          <event value="1001"
                 symbol="SirepServer_ErrorOpeningSingletonMutex"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorOpeningSingletonMutex)" />

          <event value="1002"
                 symbol="SirepServer_ErrorAcquiringSingletonMutex"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorAcquiringSingletonMutex)" />

          <event value="1003"
                 symbol="SirepServer_ErrorSettingUpConnectionDeadEvent"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorSettingUpConnectionDeadEvent)" />

          <event value="1004"
                 symbol="SirepServer_ErrorSubscribingToConnectionStateChanges"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorSubscribingToConnectionStateChanges)" />

          <event value="1005"
                 symbol="SirepServer_ErrorGettingConnectionState"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorGettingConnectionState)" />

          <event value="1006"
                 symbol="SirepServer_ErrorStartingWinsock"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorStartingWinsock)" />

          <event value="1007"
                 symbol="SirepServer_ErrorCreatingListenerSocket"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorCreatingListenerSocket)" />

          <event value="1008"
                 symbol="SirepServer_ErrorBindingListenerSocket"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorBindingListenerSocket)" />

          <event value="1009"
                 symbol="SirepServer_ErrorListeningOnListenerSocket"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorListeningOnListenerSocket)" />

          <event value="1010"
                 symbol="SirepServer_ErrorCreatingListenerEvent"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorCreatingListenerEvent)" />

          <event value="1011"
                 symbol="SirepServer_ErrorSelectingOnListenerSocket"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorSelectingOnListenerSocket)" />

          <event value="1012"
                 symbol="SirepServer_ErrorWaitingForMultiInControlLoop"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorWaitingForMultiInControlLoop)" />

          <event value="1013"
                 symbol="SirepServer_ErrorEnumeratingListenerNetworkEvents"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorEnumeratingListenerNetworkEvents)" />

          <event value="1014"
                 symbol="SirepServer_ListenerSocketClosedPrematurely"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ListenerSocketClosedPrematurely)" />

          <event value="1015"
                 symbol="SirepServer_AsyncErrorAcceptingClient"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.AsyncErrorAcceptingClient)" />

          <event value="1016"
                 symbol="SirepServer_UnexpectedErrorAcceptingClient"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.UnexpectedErrorAcceptingClient)" />

          <event value="1017"
                 symbol="SirepServer_ErrorCreatingClientEvent"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorCreatingClientEvent)" />

          <event value="1018"
                 symbol="SirepServer_ErrorSelectingOnClientSocket"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorSelectingOnClientSocket)" />

          <event value="1019"
                 symbol="SirepServer_ErrorCreatingClientHandler"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorCreatingClientHandler)" />

          <event value="1020"
                 symbol="SirepServer_ErrorCheckingDevLock"
                 channel="TCAnalytic"
                 keywords="Debug"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorCheckingDevLock)" />

          <event value="1021"
                 symbol="SirepServer_ErrorEnumeratingClientNetworkEvents"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorEnumeratingClientNetworkEvents)" />

          <event value="1022"
                 symbol="SirepServer_ErrorOnClientWriteEvent"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorOnClientWriteEvent)" />

          <event value="1023"
                 symbol="SirepServer_ErrorOnClientReadEvent"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorOnClientReadEvent)" />

          <event value="1024"
                 symbol="SirepServer_ErrorOnSend"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorOnSend)" />

          <event value="1025"
                 symbol="SirepServer_ErrorOnReceive"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorOnReceive)" />

          <event value="1026"
                 symbol="SirepServer_ErrorStartingNBThread"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorStartingNBThread)" />

          <event value="1028"
                 symbol="SirepServer_ErrorSettingUpShutdownServicesEvent"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorSettingUpShutdownServicesEvent)" />

          <event value="1029"
                 symbol="SirepServer_ErrorJoiningNameBroadcaster"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorJoiningNameBroadcaster)" />
          
          <event value="1030"
                 symbol="SirepServer_ErrorNameBroadcasterStuckMayBe"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Error"
                 message="$(string.SirepServer.ErrorNameBroadcasterStuckMayBe)" />

          <event value="1031"
                 symbol="SirepServer_ErrorStartingESThread"
                 channel="TCAnalytic"
                 keywords="Echo"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorStartingESThread)" />

          <event value="1032"
                 symbol="SirepServer_ErrorEchoServiceStuckMayBe"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Error"
                 message="$(string.SirepServer.ErrorEchoServiceStuckMayBe)" />

          <event value="1033"
                 symbol="SirepServer_ErrorJoiningEchoService"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorJoiningEchoService)" />

          <event value="1034"
                 symbol="SirepServer_ErrorSettingUpShutdownGlobalEvent"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorSettingUpShutdownGlobalEvent)" />

          <event value="1035"
                 symbol="SirepServer_ErrorEchoServiceTCPStuckMayBe"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Error"
                 message="$(string.SirepServer.ErrorEchoServiceTCPStuckMayBe)" />

          <event value="1036"
                 symbol="SirepServer_ErrorJoiningEchoServiceTCP"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorJoiningEchoServiceTCP)" />

          <event value="1037"
                 symbol="SirepServer_ErrorStartingESTCPThread"
                 channel="TCAnalytic"
                 keywords="Echo"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorStartingESTCPThread)" />

          <event value="1038"
                 symbol="SirepServer_ErrorInitializingNBThread"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorInitializingNBThread)" />

          <event value="1039"
                 symbol="SirepServer_ErrorStoppingNBThread"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorStoppingNBThread)" />

          <event value="1040"
                 symbol="SirepServer_GetSockNameErrorWhileAcceptingClient"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.GetSockNameErrorWhileAcceptingClient)" />

          <event value="1041"
                 symbol="SirepServer_ErrorWriteFileFailureOnPutFile"
                 channel="TCAnalytic"
                 keywords="Transaction"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorWriteFileFailureOnPutFile)" />

          <event value="1042"
                 symbol="SirepServer_ErrorReadFileFailureOnGetFile"
                 channel="TCAnalytic"
                 keywords="Transaction"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorReadFileFailureOnGetFile)" />

          <event value="1043"
                 symbol="SirepServer_ErrorGetFileSizeFailureOnGetFile"
                 channel="TCAnalytic"
                 keywords="Transaction"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorGetFileSizeFailureOnGetFile)" />

          <event value="1044"
                 symbol="SirepServer_ErrorCreateProcessFailedOnBL"
                 channel="TCAnalytic"
                 keywords="Transaction"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorCreateProcessFailedOnBL)" />

          <event value="1045"
                 symbol="SirepServer_ErrorSvcRegisterHandlerFailed"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorSvcRegisterHandlerFailed)" />

          <event value="1046"
                 symbol="SirepServer_ErrorShutdownReceivedButEventHandleIsNull"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorShutdownReceivedButEventHandleIsNull)" />

          <event value="1047"
                 symbol="SirepServer_ErrorSetEventFailedOnSvcControlShutdown"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorSetEventFailedOnSvcControlShutdown)" />

          <event value="1048"
                 symbol="SirepServer_ErrorControllerNFOnSvcControlShutdown"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorControllerNFOnSvcControlShutdown)" />

          <event value="1049"
                 symbol="SirepServer_ErrorSetServiceStatusFailed"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorSetServiceStatusFailed)" />

          <event value="1050"
                 symbol="SirepServer_ErrorStartDispatcherFailed"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorStartDispatcherFailed)" />

          <event value="1051"
                 symbol="SirepServer_ErrorRegOpenKeyOnSvcParamFailed"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorRegOpenKeyOnSvcParamFailed)" />

          <event value="1052"
                 symbol="SirepServer_ErrorMallocOnSvcParamFailed"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorMallocOnSvcParamFailed)" />

          <event value="1053"
                 symbol="SirepServer_ErrorRegQueryValueOnSvcParamFailed"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorRegQueryValueOnSvcParamFailed)" />

          <event value="1054"
                 symbol="SirepServer_ErrorRegQueryValueNMSZOnSvcParamFailed"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorRegQueryValueNMSZOnSvcParamFailed)" />

          <event value="1055"
                 symbol="SirepServer_ErrorFeedIPsOnSvcParamFailed"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorFeedIPsOnSvcParamFailed)" />

          <event value="1056"
                 symbol="SirepServer_ErrorFeedIPsOnNBThread"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorFeedIPsOnNBThread)" />

          <event value="1057"
                 symbol="SirepServer_ErrorStartingSvcThread"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorStartingSvcThread)" />

          <event value="1058"
                 symbol="SirepServer_ErrorRegisteringStopHandler"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorRegisteringStopHandler)" />

          <event value="1059"
                 symbol="Broadcaster_ErrorCreatingSocket"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.ErrorCreatingSocket)" />

          <event value="1060"
                 symbol="SirepServer_WSAControllerNotCreated"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.NoArgs"
                 message="$(string.SirepServer.WSAControllerNotCreated)" />

          <event value="1061"
                 symbol="SirepServer_WSAControllerFailInitialize"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.WSAControllerFailInitialize)" />

          <event value="1062"
                 symbol="SirepServer_NameBroadcastExceedBufferSize"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Error"
                 template="Template.NoArgs"
                 message="$(string.SirepServer.NameBroadcastExceedBufferSize)" />

          <event value="1063"
                 symbol="SirepServer_GetMACAddressFailure"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Error"
                 template="Template.Win32Result"
                 message="$(string.SirepServer.GetMACAddressFailure)" />

          <event value="1064"
                 symbol="SirepServer_InitializeWSAFailed"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.InitializeWSAFailed)" />

          <event value="1065"
                 symbol="SirepServer_UninitializeWSAFailed"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.UninitializeWSAFailed)" />

          <event value="1066"
                 symbol="SirepServer_WSARunFailed"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.WSARunFailed)" />

          <event value="1067"
                 symbol="SirepServer_BroadcastSendToFailed"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Error"
                 template="Template.Win32Result"
                 message="$(string.SirepServer.BroadcastSendToFailed)" />

          <event value="1068"
                 symbol="SirepServer_BroadcastSocketFailed"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Error"
                 template="Template.Win32Result"
                 message="$(string.SirepServer.BroadcastSocketFailed)" />

          <event value="1069"
                 symbol="PeekNamedPipeFailed"
                 opcode="PeekNamedPipeFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.Win32Result"
                 message="$(string.SirepServer.PeekNamedPipeFailed)" />

          <event value="1070"
                 symbol="ReadChildPipeFailed"
                 opcode="ReadChildPipeFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.Win32Result"
                 message="$(string.SirepServer.ReadChildPipeFailed)" />

          <event value="1071"
                 symbol="CheckLaunchParametersFailed"
                 opcode="CheckLaunchParametersFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepServer.CheckLaunchParametersFailed)" />

          <event value="1072"
                 symbol="LaunchWithOutputFailed"
                 opcode="LaunchWithOutputFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepServer.LaunchWithOutputFailed)" />

          <event value="1073"
                 symbol="CheckLaunchStringFailed"
                 opcode="CheckLaunchStringFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.ThreeDwords"
                 message="$(string.SirepServer.CheckLaunchStringFailed)" />

          <event value="1074"
                 symbol="LaunchWithStringsFailed"
                 opcode="LaunchWithStringsFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepServer.LaunchWithStringsFailed)" />

          <event value="1075"
                 symbol="BroadcastData"
                 opcode="BroadcastData"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="Template.BroadcastData"
                 message="$(string.SirepServer.BroadcastData)" />

          <event value="1076"
                 symbol="CreatingProcess"
                 opcode="CreatingProcess"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tTwoUnicodeStrings"
                 message="$(string.SirepServer.CreatingProcess)" />

          <event value="1077"
                 symbol="CreatingDestinationFile"
                 opcode="CreatingDestinationFile"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUnicodeString"
                 message="$(string.SirepServer.CreatingDestinationFile)" />

          <event value="1078"
                 symbol="OpeningSourceFile"
                 opcode="OpeningSourceFile"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUnicodeString"
                 message="$(string.SirepServer.OpeningSourceFile)" />

          <event value="1079"
                 symbol="ShellIsReady"
                 opcode="ShellIsReady"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepServer.ShellIsReady)" />

          <event value="1080"
                 symbol="ShellIsNotReady"
                 opcode="ShellIsNotReady"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 message="$(string.SirepServer.ShellIsNotReady)" />

          <event value="1081"
                 symbol="VirtualAllocFailed"
                 opcode="VirtualAllocFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.VirtualAllocFailed)" />

          <event value="1082"
                 symbol="PutFileOnDeviceFailed"
                 opcode="PutFileOnDeviceFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepServer.PutFileOnDeviceFailed)" />

          <event value="1083"
                 symbol="CreatePipeFailed"
                 opcode="CreatePipeFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.CreatePipeFailed)" />

          <event value="1084"
                 symbol="CreateEventFailed"
                 opcode="CreateEventFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.Win32Result"
                 message="$(string.SirepServer.CreateEventFailed)" />

          <event value="1085"
                 symbol="SetHandleInformationFailed"
                 opcode="SetHandleInformationFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.SetHandleInformationFailed)" />

          <event value="1086"
                 symbol="FormatSpecialPathWFailed"
                 opcode="FormatSpecialPathWFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.FormatSpecialPathWFailed)" />

          <event value="1087"
                 symbol="IsPermittedPathWFailed"
                 opcode="IsPermittedPathWFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.IsPermittedPathWFailed)" />

          <event value="1088"
                 symbol="CreateProcessInChamberFailed"
                 opcode="CreateProcessInChamberFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.HResult"
                 message="$(string.SirepServer.CreateProcessInChamberFailed)" />

          <event value="1089"
                 symbol="FindFirstFileFailed"
                 opcode="FindFirstFileFailed"
                 task="Communication"
                 keywords="Error"
                 channel="TCAnalytic"
                 level="win:Error"
                 template="Template.StringAndHResult"
                 message="$(string.SirepServer.FindFirstFileFailed)" />

          <event value="1090"
                 symbol="GetFileInformation"
                 opcode="GetFileInformation"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUnicodeString"
                 message="$(string.SirepServer.GetFileInformation)" />
          
          <!--SirepServer Warnings-->

          <event value="2001"
                 symbol="SirepServer_WarningClientBrokeProtocol"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Warning"
                 template="Template.FunctionNameAndFileLineNumber"
                 message="$(string.SirepServer.WarningClientBrokeProtocol)" />

          <event value="2002"
                 symbol="SirepServer_WarningClientClosedUncleanly"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Warning"
                 template="Template.HResult"
                 message="$(string.SirepServer.WarningClientClosedUncleanly)" />

          <event value="2003"
                 symbol="SirepServer_WarningRejectingClientTooBusy"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Warning"
                 message="$(string.SirepServer.WarningRejectingClientTooBusy)" />

          <event value="2004"
                 symbol="SirepServer_WarningRejectingClientUnsupportedType"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Warning"
                 message="$(string.SirepServer.WarningRejectingClientUnsupportedType)" />

          <event value="2005"
                 symbol="SirepServer_WarningRejectingClientAddressNotProvided"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Warning"
                 message="$(string.SirepServer.WarningRejectingClientAddressNotProvided)" />

          <event value="2006"
                 symbol="SirepServer_WarningRejectedIncomingInterface"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Warning"
                 template="Template.IPv4Address"
                 message="$(string.SirepServer.WarningRejectedIncomingInterface)" />

          <event value="2007"
                 symbol="SirepServer_SuitableMACUnfound"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Warning"
                 template="Template.NoArgs"
                 message="$(string.SirepServer.SuitableMACUnfound)" />

          <event value="2008"
                 symbol="SirepServer_WarningSendDeviceBroadcast"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Warning"
                 template="Template.Win32Result"
                 message="$(string.SirepServer.WarningSendDeviceBroadcast)" />

          <event value="2009"
                 symbol="SirepServer_WarningOSShutdown"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Warning"
                 template="Template.NoArgs"
                 message="$(string.SirepServer.WarningOSShutdown)" />

          <event value="2010"
                 symbol="SirepServer_WarningSocketShutdownCallFailed"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Warning"
                 template="Template.HResult"
                 message="$(string.SirepServer.WarningSocketShutdownCallFailed)" />

          <event value="2011"
                 symbol="SirepServer_WarningCloseSocketCallFailed"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Warning"
                 template="Template.HResult"
                 message="$(string.SirepServer.WarningCloseSocketCallFailed)" />

          <event value="2012"
                 symbol="SirepServer_WarningServiceStoppingDuringChildProcWait"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Warning"
                 message="$(string.SirepServer.WarningServiceStoppingDuringChildProcWait)" />

          <event value="2013"
                 symbol="SirepServer_WarningChildProcWaitFailed"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Warning"
                 template="tUInt32"
                 message="$(string.SirepServer.WarningChildProcWaitFailed)" />


          <!--SirepServer Info-->

          <event value="3001"
                 symbol="SirepServer_ProdProcessStarted"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Informational"
                 message="$(string.SirepServer.ProdProcessStarted)" />

          <event value="3002"
                 symbol="SirepServer_ProdProcessExited"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Informational"
                 template="Template.HResult"
                 message="$(string.SirepServer.ProdProcessExited)" />

          <event value="3003"
                 symbol="SirepServer_InfoCallingCreateProcessOnBL"
                 channel="TCAnalytic"
                 keywords="Transaction"
                 level="win:Informational"
                 template="Template.StringOnly"
                 message="$(string.SirepServer.InfoCallingCreateProcessOnBL)" />

          <event value="3004"
                 symbol="SirepServer_InfoCreateProcessSucceededOnBL"
                 channel="TCAnalytic"
                 keywords="Transaction"
                 level="win:Informational"
                 template="Template.UInt32"
                 message="$(string.SirepServer.InfoCreateProcessSucceededOnBL)" />

          <event value="3005"
                 symbol="SirepServer_InfoProcessTerminatedOnBL"
                 channel="TCAnalytic"
                 keywords="Transaction"
                 level="win:Informational"
                 template="Template.HResult"
                 message="$(string.SirepServer.InfoProcessTerminatedOnBL)" />

          <event value="3006"
                 symbol="SirepServer_InfoSvcFinishedInitialization"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Informational"
                 template="Template.HResult"
                 message="$(string.SirepServer.InfoSvcFinishedInitialization)" />

          <event value="3007"
                 symbol="SirepServer_InfoSvcFinishedRunning"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Informational"
                 template="Template.HResult"
                 message="$(string.SirepServer.InfoSvcFinishedRunning)" />

          <event value="3008"
                 symbol="SirepServer_InfoReceivedServiceControl"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Informational"
                 template="Template.HResult"
                 message="$(string.SirepServer.InfoReceivedServiceControl)" />

          <event value="3009"
                 symbol="SirepServer_InfoReportStatus"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Informational"
                 template="Template.ThreeDwords"
                 message="$(string.SirepServer.InfoReportStatus)" />

          <event value="3010"
                 symbol="SirepServer_InfoSvcFinishedUninitialize"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Informational"
                 template="Template.HResult"
                 message="$(string.SirepServer.InfoSvcFinishedUninitialize)" />

          <event value="3011"
                 symbol="SirepServer_InfoSvcParamListenAddressesNotFound"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Informational"
                 template="Template.HResult"
                 message="$(string.SirepServer.InfoSvcParamListenAddressesNotFound)" />

          <event value="3012"
                 symbol="SirepServer_RegisteredSvcCtrlHandler"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Informational"
                 template="Template.StringOnly"
                 message="$(string.SirepServer.RegisteredSvcCtrlHandler)" />

          <event value="3013"
                 symbol="SirepServer_ProcessPacketOnPutStart"
                 channel="TCAnalytic"
                 keywords="Transaction"
                 level="win:Informational"
                 template="Template.Dword"
                 message="$(string.SirepServer.ProcessPacketOnPutStart)" />

          <event value="3014"
                 symbol="SirepServer_ProcessPacketOnPutEnd"
                 channel="TCAnalytic"
                 keywords="Transaction"
                 level="win:Informational"
                 template="Template.Dword"
                 message="$(string.SirepServer.ProcessPacketOnPutEnd)" />

          <event value="3015"
                 symbol="SirepServer_ProcessPacketOnGetStart"
                 channel="TCAnalytic"
                 keywords="Transaction"
                 level="win:Informational"
                 template="Template.Dword"
                 message="$(string.SirepServer.ProcessPacketOnGetStart)" />

          <event value="3016"
                 symbol="SirepServer_ProcessPacketOnGetEnd"
                 channel="TCAnalytic"
                 keywords="Transaction"
                 level="win:Informational"
                 template="Template.Dword"
                 message="$(string.SirepServer.ProcessPacketOnGetEnd)" />

          <event value="3017"
                 symbol="SirepServer_SetEventOnSvcControlShutdown"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Informational"
                 template="Template.NoArgs"
                 message="$(string.SirepServer.SetEventOnSvcControlShutdown)" />

          <event value="3018"
                 symbol="SirepServer_ShutdownDuringGetMACAddress"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Informational"
                 template="Template.NoArgs"
                 message="$(string.SirepServer.ShutdownDuringGetMACAddress)" />

          <event value="3019"
                 symbol="SirepServer_InitializeWSA"
                 channel="TCAnalytic"
                 keywords="Setup"
                 level="win:Informational"
                 template="Template.NoArgs"
                 message="$(string.SirepServer.InitializeWSA)" />

          <event value="3020"
                 symbol="SirepServer_UninitializeWSA"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Informational"
                 template="Template.NoArgs"
                 message="$(string.SirepServer.UninitializeWSA)" />

          <event value="3021"
                 symbol="SirepServer_WSAConnectionDiedCallback"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Informational"
                 template="Template.TwoDwords"
                 message="$(string.SirepServer.WSAConnectionDiedCallback)" />

          <event value="3022"
                 symbol="SirepServer_StoppingServiceThreads"
                 channel="TCAnalytic"
                 keywords="Shutdown"
                 level="win:Informational"
                 template="Template.NoArgs"
                 message="$(string.SirepServer.StoppingServiceThreads)" />

          <event value="3023"
                 symbol="SirepServer_TestProcessStarted"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Informational"
                 message="$(string.SirepServer.TestProcessStarted)" />

          <event value="3024"
                 symbol="SirepServer_TestProcessExited"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Informational"
                 template="Template.HResult"
                 message="$(string.SirepServer.TestProcessExited)" />

          <event value="3025"
                 symbol="SirepServer_InfoSvcStopping"
                 channel="TCAnalytic"
                 keywords="Service"
                 level="win:Informational"
                 template="Template.HResult"
                 message="$(string.SirepServer.InfoSvcStopping)" />

          <!--SirepServer Verbose-->

          <event value="4001"
                 symbol="SirepServer_WSASend"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Verbose"
                 template="Template.Integer"
                 message="$(string.SirepServer.WSASend)" />

          <event value="4002"
                 symbol="SirepServer_WSAReceive"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Verbose"
                 template="Template.Integer"
                 message="$(string.SirepServer.WSAReceive)" />

          <event value="4003"
                 symbol="SirepServer_WSARun"
                 channel="TCAnalytic"
                 keywords="Client"
                 level="win:Verbose"
                 template="Template.NoArgs"
                 message="$(string.SirepServer.WSARun)" />

          <event value="4004"
                 symbol="SirepServer_GetAdapterForMACAdressFirst"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Verbose"
                 template="Template.Win32Result"
                 message="$(string.SirepServer.GetAdapterForMACAdressFirst)" />

          <event value="4005"
                 symbol="SirepServer_GetAdapterForMACAdressSecond"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Verbose"
                 template="Template.Win32Result"
                 message="$(string.SirepServer.GetAdapterForMACAdressSecond)" />

          <event value="4006"
                 symbol="SirepServer_GetAdapterForMACAdressFinal"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Verbose"
                 template="Template.Win32Result"
                 message="$(string.SirepServer.GetAdapterForMACAdressFinal)" />

          <event value="4007"
                 symbol="SirepServer_NameBroadCasterGetMACAddress"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Verbose"
                 template="Template.Win32Result"
                 message="$(string.SirepServer.NameBroadCasterGetMACAddress)" />

          <event value="4008"
                 symbol="SirepServer_ShutdownWhileSendingBroadcast"
                 channel="TCAnalytic"
                 keywords="Broadcaster"
                 level="win:Verbose"
                 template="Template.NoArgs"
                 message="$(string.SirepServer.ShutdownWhileSendingBroadcast)" />

          <!--SirepPipe events-->
          <event value="101"
                 symbol="SocketoptFailed"
                 opcode="SocketoptFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.SocketoptFailed)"/>

          <event value="102"
                 symbol="RecvFailed"
                 opcode="RecvFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.SirepClient.CodePathAndWin32Error"
                 message="$(string.SirepPipe.RecvFailed)"/>

          <event value="103"
                 symbol="ReceivedPipeGuid"
                 opcode="ReceivedPipeGuid"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.ReceivedPipeGuid)"/>

          <event value="104"
                 symbol="PipeGuidMatch"
                 opcode="PipeGuidMatch"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.PipeGuidMatch)"/>

          <event value="107"
                 symbol="LoadLibraryFailed"
                 opcode="LoadLibraryFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.LoadLibraryFailed)"/>

          <event value="109"
                 symbol="SendAcknowledgementFailed"
                 opcode="SendAcknowledgementFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.SendAcknowledgementFailed)"/>

          <event value="110"
                 symbol="CreateThreadFailed"
                 opcode="CreateThreadFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.CreateThreadFailed)"/>

          <event value="111"
                 symbol="BindAttempt"
                 opcode="BindAttempt"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tBindAttempt"
                 message="$(string.SirepPipe.BindAttempt)"/>

          <event value="112"
                 symbol="BindRetryFailed"
                 opcode="BindRetryFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.BindRetryFailed)"/>

          <event value="113"
                 symbol="BindFatalError"
                 opcode="BindFatalError"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.BindFatalError)"/>

          <event value="114"
                 symbol="ListenFailed"
                 opcode="ListenFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.ListenFailed)"/>

          <event value="115"
                 symbol="AcceptFailed"
                 opcode="AcceptFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.ListenFailed)"/>

          <event value="116"
                 symbol="AcceptSuccess"
                 opcode="AcceptSuccess"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.AcceptSuccess)"/>

          <event value="117"
                 symbol="ReceiveCommandFailed"
                 opcode="ReceiveCommandFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.ReceiveCommandFailed)"/>

          <event value="124"
                 symbol="ReceivedData"
                 opcode="ReceivedData"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tPipeAndTwoSizes"
                 message="$(string.SirepPipe.ReceivedData)"/>

          <event value="125"
                 symbol="SendFailed"
                 opcode="SendFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.SirepClient.CodePathAndWin32Error"
                 message="$(string.SirepPipe.SendFailed)"/>

          <event value="126"
                 symbol="SentData"
                 opcode="SentData"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tPipeAndTwoSizes"
                 message="$(string.SirepPipe.SentData)"/>

          <event value="127"
                 symbol="WSACreateEventFailed"
                 opcode="WSACreateEventFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.WSACreateEventFailed)"/>

          <event value="128"
                 symbol="WSAEventSelectFailed"
                 opcode="WSAEventSelectFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.WSAEventSelectFailed)"/>

          <event value="129"
                 symbol="WaitForThreadReservation"
                 opcode="WaitForThreadReservation"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tWaitForTwoHandles"
                 message="$(string.SirepPipe.WaitForThreadReservation)"/>

          <event value="130"
                 symbol="WaitResultValue"
                 opcode="WaitResultValue"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.WaitResultValue)"/>

          <event value="131"
                 symbol="ReleaseThreadReservation"
                 opcode="ReleaseThreadReservation"
                 task="Threading"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUInt64"
                 message="$(string.SirepPipe.ReleaseThreadReservation)"/>

          <event value="132"
                 symbol="WaitForWSAEventSelect"
                 opcode="WaitForWSAEventSelect"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tWaitForTwoHandles"
                 message="$(string.SirepPipe.WaitForWSAEventSelect)"/>

          <event value="133"
                 symbol="WSAEnumNetworkEventsFailed"
                 opcode="WSAEnumNetworkEventsFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.WSAEnumNetworkEventsFailed)"/>

          <event value="141"
                 symbol="ConnectFailed"
                 opcode="ConnectFailed"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="Template.Win32Result"
                 message="$(string.SirepPipe.ConnectFailed)"/>

          <event value="142"
                 symbol="RecvFromFailed"
                 opcode="RecvFromFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.RecvFromFailed)"/>

          <event value="143"
                 symbol="RecvFromSizes"
                 opcode="RecvFromSizes"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tRecvFromSizes"
                 message="$(string.SirepPipe.RecvFromSizes)"/>

          <event value="144"
                 symbol="SocketClose"
                 opcode="SocketClose"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tSocketClose"
                 message="$(string.SirepPipe.SocketClose)"/>

          <event value="153"
                 symbol="ProcessShutDown"
                 opcode="ProcessShutDown"
                 task="Threading"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.ProcessShutDown)"/>

          <event value="154"
                 symbol="PipeThreadStart"
                 opcode="PipeThreadStart"
                 task="Threading"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.PipeThreadStart)"/>

          <event value="155"
                 symbol="PipeThreadFinished"
                 opcode="PipeThreadFinished"
                 task="Threading"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.PipeThreadFinished)"/>

          <event value="156"
                 symbol="SendingPacket"
                 opcode="SendingPacket"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tSendingPacket"
                 message="$(string.SirepPipe.SendingPacket)"/>

          <event value="157"
                 symbol="ReceivedPacket"
                 opcode="ReceivedPacket"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tReceivedPacket"
                 message="$(string.SirepPipe.ReceivedPacket)"/>

          <event value="158"
                 symbol="ReceivePacketFailed"
                 opcode="ReceivePacketFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.HResult"
                 message="$(string.SirepPipe.ReceivePacketFailed)"/>

          <event value="159"
                 symbol="SendPacketFailed"
                 opcode="SendPacketFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.HResult"
                 message="$(string.SirepPipe.SendPacketFailed)"/>

          <event value="160"
                 symbol="ReceivingPacket"
                 opcode="ReceivingPacket"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tSizeAndTimeout"
                 message="$(string.SirepPipe.ReceivingPacket)"/>

          <event value="161"
                 symbol="PipeReceiving"
                 opcode="PipeReceiving"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="Template.TwoDwords"
                 message="$(string.SirepPipe.PipeReceiving)"/>

          <event value="162"
                 symbol="PipeReceived"
                 opcode="PipeReceived"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.PipeReceived)"/>

          <event value="163"
                 symbol="PipeReceiveFailed"
                 opcode="PipeReceiveFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.HResult"
                 message="$(string.SirepPipe.PipeReceiveFailed)"/>

          <event value="164"
                 symbol="PipeSending"
                 opcode="PipeSending"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tSizeAndTimeout"
                 message="$(string.SirepPipe.PipeSending)"/>

          <event value="165"
                 symbol="PipeSent"
                 opcode="PipeSent"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.PipeSent)"/>

          <event value="166"
                 symbol="PipeSendFailed"
                 opcode="PipeSendFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.HResult"
                 message="$(string.SirepPipe.PipeSendFailed)"/>

          <event value="167"
                 symbol="SendPacketSucceeded"
                 opcode="SendPacketSucceeded"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.SendPacketSucceeded)"/>

          <event value="168"
                 symbol="SendingHresult"
                 opcode="SendingHresult"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tTimeoutAndHresult"
                 message="$(string.SirepPipe.SendingHresult)"/>

          <event value="169"
                 symbol="SendHresultFailed"
                 opcode="SendHresultFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.HResult"
                 message="$(string.SirepPipe.SendHresultFailed)"/>

          <event value="170"
                 symbol="SendHresultSucceeded"
                 opcode="SendHresultSucceeded"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.SendHresultSucceeded)"/>

          <event value="171"
                 symbol="ReceivingHresult"
                 opcode="ReceivingHresult"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.ReceivingHresult)"/>

          <event value="172"
                 symbol="ReceiveHresultFailed"
                 opcode="ReceiveHresultFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.HResult"
                 message="$(string.SirepPipe.ReceiveHresultFailed)"/>

          <event value="173"
                 symbol="ReceiveHresultSucceeded"
                 opcode="ReceiveHresultSucceeded"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="Template.HResult"
                 message="$(string.SirepPipe.ReceiveHresultSucceeded)"/>

          <event value="174"
                 symbol="ReceiveHresultIncorrect"
                 opcode="ReceiveHresultIncorrect"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.TwoDwords"
                 message="$(string.SirepPipe.ReceiveHresultIncorrect)"/>

          <event value="175"
                 symbol="SetNoDelayFailed"
                 opcode="SetNoDelayFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.Win32Result"
                 message="$(string.SirepPipe.SetNoDelayFailed)"/>

          <event value="176"
                 symbol="SendingHresultNoTimeout"
                 opcode="SendingHresultNoTimeout"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="Template.HResult"
                 message="$(string.SirepPipe.SendingHresultNoTimeout)"/>

          <event value="177"
                 symbol="SendingPacketNoTimeout"
                 opcode="SendingPacketNoTimeout"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tSendingPacketNoTimeout"
                 message="$(string.SirepPipe.SendingPacketNoTimeout)"/>

          <event value="178"
                 symbol="ReceivingPacketNoTimeout"
                 opcode="ReceivingPacketNoTimeout"
                 task="Communication"
                 keywords="Trace"
                 level="win:Verbose"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.ReceivingPacketNoTimeout)"/>

          <event value="179"
                 symbol="ReceivingHresultNoTimeout"
                 opcode="ReceivingHresultNoTimeout"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.ReceivingHresultNoTimeout)"/>

          <event value="180"
                 symbol="PipeReceivingNoTimeout"
                 opcode="PipeReceivingNoTimeout"
                 task="Communication"
                 keywords="Trace"
                 level="win:Verbose"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.PipeReceivingNoTimeout)"/>

          <event value="181"
                 symbol="PipeSendingNoTimeout"
                 opcode="PipeSendingNoTimeout"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.PipeSendingNoTimeout)"/>

          <event value="182"
                 symbol="SendingHresultSOK"
                 opcode="SendingHresultSOK"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepPipe.SendingHresultSOK)"/>

          <event value="183"
                 symbol="SendingHresultNoTimeoutSOK"
                 opcode="SendingHresultNoTimeoutSOK"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.SendingHresultNoTimeoutSOK)"/>

          <event value="184"
                 symbol="ReceiveHresultSucceededSOK"
                 opcode="ReceiveHresultSucceededSOK"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepPipe.ReceiveHresultSucceededSOK)"/>

          <!--SirepClient Events-->
          
          <!-- SirepClient InternalError (1000-1999)

                  These events are for logging internal errors that are generally unexpected and often can't be recovered
                  from. Some examples may include running out of memory, external APIs like winsock not initializing,
                  etc. Some (very, very few) of these events may indicate a bug in this code, but typically, bug
                  conditions should be marked with debug assertions rather than ETW events. These events may sometimes
                  indicate a bug in external dependencies that aren't behaving as spec'ed.

          -->

          <event
            value="1000"
            symbol="_SirepClient_InternalError_WithHResultAndMessage"
            keywords="InternalError Error"
            level="win:Critical"
            template="Template.AnsiString.AnsiString.HResult"
            message="$(string.SirepClient.InternalError.WithHResultAndMessage)"
            />


          <!-- SirepClient PublicApiMisuse (2000-2999)

                  These events are for logging errors that are expected if and only if external callers misuse the
                  public API. These events should not indicate a bug in this code, but likely indicate a bug in
                  the code of external callers.

          -->

          <event
            value="20000"
            symbol="_SirepClient_PublicApiMisuse_WithHResultAndMessage"
            opcode="_SirepClient_PublicApiMisuse_WithHResultAndMessage"
            keywords="PublicApiMisuse Error"
            level="win:Error"
            template="Template.AnsiString.AnsiString.HResult"
            message="$(string.SirepClient.PublicApiMisuse.WithHResultAndMessage)"
            />

          <event
            value="20001"
            symbol="_SirepClient_PublicApiMisuse_NotSupported"
            opcode="_SirepClient_PublicApiMisuse_NotSupported"
            keywords="PublicApiMisuse Error"
            level="win:Error"
            template="Template.AnsiString"
            message="$(string.SirepClient.PublicApiMisuse.NotSupported)"
            />

          <event
            value="20002"
            symbol="_SirepClient_PublicApiMisuse_ReturningFailureHResultFromOnLaunchOutput"
            opcode="_SirepClient_PublicApiMisuse_ReturningFailureHResultFromOnLaunchOutput"
            keywords="PublicApiMisuse Error"
            level="win:Error"
            template="Template.AnsiString.HResult"
            message="$(string.SirepClient.PublicApiMisuse.ReturningFailureHResultFromOnLaunchOutput)"
            />

          <event
            value="20003"
            symbol="SirepInitializeNotSupported"
            opcode="SirepInitializeNotSupported"
            keywords="PublicApiMisuse Error"
            level="win:Error"
            message="$(string.SirepClient.PublicApiMisuse.SirepInitializeNotSupported)"
            />

          <!-- SirepClient KeyInformation (3000-3999)

                  These events are for logging key information which doesn't indicate a problem, but is important for
                  getting a good idea of what's going on. These events will often be on-by-default, so they should
                  not be too frequent.

          -->

          <event
            value="30000"
            symbol="_SirepClient_KeyInformation_SettingClientSideClientIdentifier"
            keywords="Trace"
            level="win:Informational"
            template="Template.UnicodeString"
            message="$(string.SirepClient.KeyInformation.SettingClientSideClientIdentifier)"
            />

          <event
            value="30001"
            symbol="_SirepClient_KeyInformation_SettingServerSideClientIdentifier"
            keywords="Trace"
            level="win:Informational"
            template="Template.UInt64"
            message="$(string.SirepClient.KeyInformation.SettingServerSideClientIdentifier)"
            />

          <event
            value="30002"
            symbol="_SirepClient_KeyInformation_ConnectedSuccessfully"
            keywords="Trace"
            level="win:Informational"
            message="$(string.SirepClient.KeyInformation.ConnectedSuccessfully)"
            />

          <event
            value="30003"
            symbol="_SirepClient_KeyInformation_DisconnectedSuccessfully"
            keywords="Trace"
            level="win:Informational"
            message="$(string.SirepClient.KeyInformation.DisconnectedSuccessfully)"
            />

          <event
            value="30004"
            symbol="_SirepClient_KeyInformation_IgnoringDisconnectRequestSinceWeAreNotConnected"
            keywords="Trace"
            level="win:Informational"
            message="$(string.SirepClient.KeyInformation.IgnoringDisconnectRequestSinceWeAreNotConnected)"
            />

          <event
            value="30005"
            symbol="_SirepClient_KeyInformation_TranslatingErrorResult"
            keywords="Trace"
            level="win:Informational"
            template="Template.HResult.HResult"
            message="$(string.SirepClient.KeyInformation.TranslatingErrorResult)"
            />


          <!-- SirepClient TransactionTrace (4000-4999)

                  These events are for logging key information about Sirep transactions such as arguments being
                  bundled up, return values, and intermediate transaciton states.

          -->

          <event
            value="40000"
            symbol="_SirepClient_TransactionTrace_FlushingPendingSend"
            keywords="Trace"
            level="win:Informational"
            template="Template.UInt32"
            message="$(string.SirepClient.TransactionTrace.FlushingPendingSend)"
            />

          <event
            value="40001"
            symbol="_SirepClient_TransactionTrace_SendingPacket"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.AnsiString.AnsiString.UInt32.UInt32"
            message="$(string.SirepClient.TransactionTrace.SendingPacket)"
            />

          <event
            value="40002"
            symbol="_SirepClient_TransactionTrace_SentPacketSuccessfully"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.AnsiString.AnsiString.UInt32.UInt32"
            message="$(string.SirepClient.TransactionTrace.SentPacketSuccessfully)"
            />

          <event
            value="40003"
            symbol="_SirepClient_TransactionTrace_ReceivedPacketSuccessfully"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.AnsiString.AnsiString.UInt32.UInt32"
            message="$(string.SirepClient.TransactionTrace.ReceivedPacketSuccessfully)"
            />

          <!-- NOTE: "Intermediate" packet events will use the same templates and messages as regular packets, but be at a higher level for filtering. -->
          <event
            value="40004"
            symbol="_SirepClient_TransactionTrace_SendingIntermediatePacket"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.AnsiString.AnsiString.UInt32.UInt32"
            message="$(string.SirepClient.TransactionTrace.SendingPacket)"
            />

          <event
            value="40005"
            symbol="_SirepClient_TransactionTrace_SentIntermediatePacketSuccessfully"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.AnsiString.AnsiString.UInt32.UInt32"
            message="$(string.SirepClient.TransactionTrace.SentPacketSuccessfully)"
            />

          <event
            value="40006"
            symbol="_SirepClient_TransactionTrace_ReceivedIntermediatePacketSuccessfully"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.AnsiString.AnsiString.UInt32.UInt32"
            message="$(string.SirepClient.TransactionTrace.ReceivedPacketSuccessfully)"
            />

          <event
            value="40007"
            symbol="_SirepClient_TransactionTrace_ReceivedTransactionFailureFromServer"
            keywords="Trace"
            level="win:Warning"
            template="Template.AnsiString.UInt32.AnsiString.HResult"
            message="$(string.SirepClient.TransactionTrace.ReceivedTransactionFailureFromServer)"
            />

          <event
            value="40008"
            symbol="_SirepClient_TransactionTrace_CompletedSuccessfully"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.UInt32"
            message="$(string.SirepClient.TransactionTrace.CompletedSuccessfully)"
            />

          <event
            value="40009"
            symbol="_SirepClient_TransactionTrace_TimedOut"
            keywords="Trace"
            level="win:Warning"
            template="Template.AnsiString.UInt32"
            message="$(string.SirepClient.TransactionTrace.TimedOut)"
            />


          <!-- SirepClient FunctionTrace (5000-5999)

                  These events are for tracing the execution of functions which are interesting enough
                  that we may want to trace their execution on some occasion but aren't interesting
                  enough to warrant KeyInformation events.

          -->

          <event
            value="5000"
            symbol="_SirepClient_FunctionTrace_Enter_Params_None"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.FunctionTrace.Enter.Params.None)"
            />

          <event
            value="5001"
            symbol="_SirepClient_FunctionTrace_Enter_Params_UnicodeString"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.UnicodeString"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.FunctionTrace.Enter.Params.UnicodeString)"
            />

          <event
            value="5002"
            symbol="_SirepClient_FunctionTrace_Enter_Params_TimeoutInMilliseconds"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.UInt32"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.FunctionTrace.Enter.Params.TimeoutInMilliseconds)"
            />

          <event
            value="5003"
            symbol="_SirepClient_FunctionTrace_Enter_Params_TimeoutInMilliseconds_VariantBool"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.UInt32.VariantBool"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.FunctionTrace.Enter.Params.TimeoutInMilliseconds.VariantBool)"
            />

          <event
            value="5004"
            symbol="_SirepClient_FunctionTrace_Exit_Return_None"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.FunctionTrace.Exit.Return.None)"
            />

          <event
            value="5005"
            symbol="_SirepClient_FunctionTrace_Exit_Return_HResult"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.HResult"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.FunctionTrace.Exit.Return.HResult)"
            />

          <event
            value="5006"
            symbol="_SirepClient_FunctionTrace_Exit_Return_HResult_AnsiString"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.HResult.AnsiString"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.FunctionTrace.Exit.Return.HResult.AnsiString)"
            />

          <event
            value="5007"
            symbol="_SirepClient_FunctionTrace_Exit_Return_IPv4AddressInNetOrder"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.IPv4AddressInNetOrder"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.FunctionTrace.Exit.Return.IPv4AddressInNetOrder)"
            />

          <event
            value="5008"
            symbol="_SirepClient_FunctionTrace_Exit_Throw_HResult"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.HResult"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.FunctionTrace.Exit.Throw.HResult)"
            />

          <!-- SirepClient PublicApiTrace (6000-6999)

                  These events are for tracing the calls to and results from most (if not all) public APIs.

          -->

          <event
            value="6000"
            symbol="_SirepClient_PublicApiTrace_Enter_Params_None"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.Params.None)"
            />

          <event
            value="6001"
            symbol="_SirepClient_PublicApiTrace_Enter_Params_AnsiString"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.AnsiString"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.Params.AnsiString)"
            />

          <event
            value="6002"
            symbol="_SirepClient_PublicApiTrace_Enter_Params_UnicodeString"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.UnicodeString"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.Params.UnicodeString)"
            />

          <event
            value="6003"
            symbol="_SirepClient_PublicApiTrace_Enter_Params_TimeoutInMilliseconds_VariantBool"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.UInt32.VariantBool"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.Params.TimeoutInMilliseconds.VariantBool)"
            />

          <event
            value="6004"
            symbol="_SirepClient_PublicApiTrace_Enter_Params_LocalEndpoint_RemoteEndpoint"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.Endpoint.Endpoint"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.Params.LocalEndpoint.RemoteEndpoint)"
            />

          <event
            value="6005"
            symbol="_SirepClient_PublicApiTrace_Enter_SirepPutFile"
            keywords="Trace"
            level="win:Informational"
            template="Template.SirepClient.PublicApiTrace.Enter.SirepPutFile"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.SirepPutFile)"
            />

          <event
            value="6006"
            symbol="_SirepClient_PublicApiTrace_Enter_SirepLaunch"
            keywords="Trace"
            level="win:Informational"
            template="Template.SirepClient.PublicApiTrace.Enter.SirepLaunch"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.SirepLaunch)"
            />

          <event
            value="6007"
            symbol="_SirepClient_PublicApiTrace_Enter_SirepGetFile"
            keywords="Trace"
            level="win:Informational"
            template="Template.SirepClient.PublicApiTrace.Enter.SirepGetFile"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.SirepGetFile)"
            />

          <event
            value="6008"
            symbol="_SirepClient_PublicApiTrace_Enter_LaunchWithOutput"
            keywords="Trace"
            level="win:Informational"
            template="Template.SirepClient.PublicApiTrace.Enter.LaunchWithOutput"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.LaunchWithOutput)"
            />

          <event
            value="6009"
            symbol="_SirepClient_PublicApiTrace_Enter_CreateProcess"
            keywords="Trace"
            level="win:Informational"
            template="Template.SirepClient.PublicApiTrace.Enter.CreateProcess"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.CreateProcess)"
            />

          <event
            value="6010"
            symbol="_SirepClient_PublicApiTrace_Enter_Params_TimeoutInMilliseconds"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.UInt32"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.Params.TimeoutInMilliseconds)"
            />

          <event
            value="6011"
            symbol="_SirepClient_PublicApiTrace_Exit_Return_HResult"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.HResult"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.PublicApiTrace.Exit.Return.HResult)"
            />

          <event
            value="6012"
            symbol="_SirepClient_PublicApiTrace_Exit_Return_HResult_AnsiString"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.HResult.AnsiString"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.PublicApiTrace.Exit.Return.HResult.AnsiString)"
            />

          <event
            value="6013"
            symbol="_SirepClient_PublicApiTrace_Exit_Return_HResult_UnicodeString"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.HResult.UnicodeString"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.PublicApiTrace.Exit.Return.HResult.UnicodeString)"
            />

          <event
            value="6014"
            symbol="_SirepClient_PublicApiTrace_Exit_Return_HResult_FileInfox"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.HResult.FileInfox"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.PublicApiTrace.Exit.Return.HResult.FileInfox)"
            />

          <event
            value="6015"
            symbol="_SirepClient_PublicApiTrace_Exit_Return_HResult_DWord"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.HResult.DWord"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.PublicApiTrace.Exit.Return.HResult.DWord)"
            />

          <event
            value="6016"
            symbol="_SirepClient_PublicApiTrace_Exit_Return_HResult_UInt64"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.HResult.UInt64"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.PublicApiTrace.Exit.Return.HResult.UInt64)"
            />

          <event
            value="6017"
            symbol="_SirepClient_PublicApiTrace_Exit_Return_HResult_VariantBool"
            keywords="Trace"
            level="win:Informational"
            template="Template.AnsiString.HResult.VariantBool"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.PublicApiTrace.Exit.Return.HResult.VariantBool)"
            />

          <event
            value="6018"
            symbol="_SirepClient_PublicApiTrace_Callback_OnLaunchOutput"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.DWord.UnicodeString"
            task="Task.FunctionCall"
            opcode="win:Stop"
            message="$(string.SirepClient.PublicApiTrace.Callback.OnLaunchOutput)"
            />

          <event
            value="6019"
            symbol="_SirepClient_PublicApiTrace_Enter_Params_DWord_DWord"
            keywords="Trace"
            level="win:Verbose"
            template="Template.AnsiString.UInt32.UInt32"
            task="Task.FunctionCall"
            opcode="win:Start"
            message="$(string.SirepClient.PublicApiTrace.Enter.Params.UInt32.UInt32)"
            />

          
          <event value="6030"
                 symbol="ClientSirepConnectFailed"
                 opcode="ClientSirepConnectFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.ClientSirepConnectFailed)"/>

          <event value="6031"
                 symbol="ClientSirepConnectProtocolAlreadyCreated"
                 opcode="ClientSirepConnectProtocolAlreadyCreated"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.ClientSirepConnectProtocolAlreadyCreated)"/>

          <event value="6032"
                 symbol="ClientSirepConnectProtocolDetected"
                 opcode="ClientSirepConnectProtocolDetected"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.ClientSirepConnectProtocolDetected)"/>

          <event value="6033"
                 symbol="SetSendReceiveTimeoutEnter"
                 opcode="SetSendReceiveTimeoutEnter"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepClient.SetSendReceiveTimeoutEnter)"/>

          <event value="6034"
                 symbol="SetSendReceiveTimeoutExit"
                 opcode="SetSendReceiveTimeoutExit"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepClient.SetSendReceiveTimeoutExit)"/>

          <event value="6035"
                 symbol="DestroyingPipes"
                 opcode="DestroyingPipes"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.DestroyingPipes)"/>

          <event value="6036"
                 symbol="Protocol2InitialSetupStart"
                 opcode="Protocol2InitialSetupStart"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.Protocol2InitialSetupStart)"/>

          <event value="6037"
                 symbol="Protocol2InitialSetupFailed"
                 opcode="Protocol2InitialSetupFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.Protocol2InitialSetupFailed)"/>

          <event value="6038"
                 symbol="CreatedEvent"
                 opcode="CreatedEvent"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tPointer"
                 message="$(string.SirepClient.CreatedEvent)"/>

          <event value="6039"
                 symbol="Protocol2InitialSetupCreatedPipe"
                 opcode="Protocol2InitialSetupCreatedPipe"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tPointer"
                 message="$(string.SirepClient.Protocol2InitialSetupCreatedPipe)"/>

          <event value="6040"
                 symbol="Protocol2InitialSetupFinished"
                 opcode="Protocol2InitialSetupFinished"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.Protocol2InitialSetupFinished)"/>

          <event value="6041"
                 symbol="Protocol2SirepConnectAlreadyConnected"
                 opcode="Protocol2SirepConnectAlreadyConnected"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.Protocol2SirepConnectAlreadyConnected)"/>

          <event value="6042"
                 symbol="Protocol2SirepConnectFailed"
                 opcode="Protocol2SirepConnectFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.Protocol2SirepConnectFailed)"/>

          <event value="6043"
                 symbol="Protocol2DisconnectingPipe"
                 opcode="Protocol2DisconnectingPipe"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tPointer"
                 message="$(string.SirepClient.Protocol2DisconnectingPipe)"/>

          <event value="6044"
                 symbol="Protocol2SirepDisconnectAlreadyDisconnected"
                 opcode="Protocol2SirepDisconnectAlreadyDisconnected"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.Protocol2SirepDisconnectAlreadyDisconnected)"/>

          <event value="6045"
                 symbol="SettingEvent"
                 opcode="SettingEvent"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tPointer"
                 message="$(string.SirepClient.SettingEvent)"/>

          <event value="6046"
                 symbol="Protocol2SirepDisconnectFailed"
                 opcode="Protocol2SirepDisconnectFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.Protocol2SirepDisconnectFailed)"/>

          <event value="6047"
                 symbol="ResettingEvent"
                 opcode="ResettingEvent"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tPointer"
                 message="$(string.SirepClient.ResettingEvent)"/>
          
          <event value="6048"
                 symbol="Protocol2ExecuteFailed"
                 opcode="Protocol2ExecuteFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.Protocol2ExecuteFailed)"/>

          <event value="6049"
                 symbol="Protocol2ExecuteFinished"
                 opcode="Protocol2ExecuteFinished"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepClient.Protocol2ExecuteFinished)"/>

          <event value="6050"
                 symbol="Protocol2ExecuteTextCallback"
                 opcode="Protocol2ExecuteTextCallback"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.Protocol2ExecuteTextCallback)"/>

          <event value="6051"
                 symbol="Protocol2CheckPingFailed"
                 opcode="Protocol2CheckPingFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.Protocol2CheckPingFailed)"/>

          <event value="6052"
                 symbol="Protocol2SirepPingConnecting"
                 opcode="Protocol2SirepPingConnecting"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="Template.SirepClient.CodePathAndPointer"
                 message="$(string.SirepClient.Protocol2SirepPingConnecting)"/>

          <event value="6053"
                 symbol="Protocol2SirepPingSucceeded"
                 opcode="Protocol2SirepPingSucceeded"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.Protocol2SirepPingSucceeded)"/>

          <event value="6054"
                 symbol="Protocol2SirepPingFailed"
                 opcode="Protocol2SirepPingFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.Protocol2SirepPingFailed)"/>

          <event value="6055"
                 symbol="Protocol2SirepPutFileFailed"
                 opcode="Protocol2SirepPutFileFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.Protocol2SirepPutFileFailed)"/>

          <event value="6056"
                 symbol="Protocol2SirepPutFileSucceeded"
                 opcode="Protocol2SirepPutFileSucceeded"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.Protocol2SirepPutFileSucceeded)"/>

          <event value="6057"
                 symbol="Protocol2SirepGetFileFailed"
                 opcode="Protocol2SirepGetFileFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.Protocol2SirepGetFileFailed)"/>

          <event value="6058"
                 symbol="Protocol2SirepWriteFileFailed"
                 opcode="Protocol2SirepWriteFileFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tUInt32Hex"
                 message="$(string.SirepClient.Protocol2SirepWriteFileFailed)"/>

          <event value="6059"
                 symbol="Protocol2SirepGetDeviceInfoFailed"
                 opcode="Protocol2SirepGetDeviceInfoFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.Protocol2SirepGetDeviceInfoFailed)"/>

          <event value="6060"
                 symbol="Protocol2SirepGetFileInfoFailed"
                 opcode="Protocol2SirepGetFileInfoFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.Protocol2SirepGetFileInfoFailed)"/>

          <event value="6061"
                 symbol="Protocol2SirepCheckTimeRemainingFailed"
                 opcode="Protocol2SirepCheckTimeRemainingFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="tThreeUInt32"
                 message="$(string.SirepClient.Protocol2SirepCheckTimeRemainingFailed)"/>

          <event value="6062"
                 symbol="Protocol2SirepConnecting"
                 opcode="Protocol2SirepConnecting"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.Protocol2SirepConnecting)"/>

          <event value="6063"
                 symbol="SocketCreated"
                 opcode="SocketCreated"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tPointer"
                 message="$(string.SirepClient.SocketCreated)"/>

          <event value="6064"
                 symbol="ConnectCall"
                 opcode="ConnectCall"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 template="tUInt32"
                 message="$(string.SirepClient.ConnectCall)"/>

          <event value="6065"
                 symbol="ConnectSuccess"
                 opcode="ConnectSuccess"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.ConnectSuccess)"/>

          <event value="6066"
                 symbol="PipeConnectFailed"
                 opcode="PipeConnectFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.CodePathAndHresult"
                 message="$(string.SirepClient.PipeConnectFailed)"/>

          <event value="6067"
                 symbol="Protocol1SirepConnectAlreadyConnected"
                 opcode="Protocol1SirepConnectAlreadyConnected"
                 task="Communication"
                 keywords="Trace"
                 level="win:Informational"
                 channel="TCAnalytic"
                 message="$(string.SirepClient.Protocol1SirepConnectAlreadyConnected)"/>

          <event value="6068"
                 symbol="GetFileSizeExFailed"
                 opcode="GetFileSizeExFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.HResult"
                 message="$(string.SirepClient.GetFileSizeExFailed)"/>

          <event value="6069"
                 symbol="WSAStartupFailed"
                 opcode="WSAStartupFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.Win32Result"
                 message="$(string.SirepClient.WSAStartupFailed)"/>

          <event value="6070"
                 symbol="WSACleanupFailed"
                 opcode="WSACleanupFailed"
                 task="Communication"
                 keywords="Error"
                 level="win:Error"
                 channel="TCAnalytic"
                 template="Template.Win32Result"
                 message="$(string.SirepClient.WSACleanupFailed)"/>

          
          <!-- SirepClient NetworkTrace (7000-7999)

                  These events are for tracing the packets being sent to and received from network APIs.

          -->

        </events>

      </provider>
    </events>
  </instrumentation>

  <!-- Localizable strings for the MyProvider Events -->
  <localization>
    <resources culture="en-US">
      <stringTable>

        <!-- These definitions describe how to print each Server event in a user-friendly way. -->

        <string id="SirepServer.ErrorOpeningSingletonMutex"                 value="Error opening singleton mutex. Result = %1." />
        <string id="SirepServer.ErrorAcquiringSingletonMutex"               value="Error acquiring singleton mutex. Result = %1." />
        <string id="SirepServer.ErrorSettingUpConnectionDeadEvent"          value="Error setting up connection dead event. Result = %1." />
        <string id="SirepServer.ErrorSubscribingToConnectionStateChanges"   value="Error subscribing to connection state changes. Result = %1." />
        <string id="SirepServer.ErrorGettingConnectionState"                value="Error getting connection state. Result = %1." />
        <string id="SirepServer.ErrorStartingWinsock"                       value="Error starting Winsock. Result = %1." />
        <string id="SirepServer.ErrorCreatingListenerSocket"                value="Error creating listener socket. Result = %1." />
        <string id="SirepServer.ErrorBindingListenerSocket"                 value="Error binding listener socket. Result = %1." />
        <string id="SirepServer.ErrorListeningOnListenerSocket"             value="Error listening on listener socket. Result = %1." />
        <string id="SirepServer.ErrorCreatingListenerEvent"                 value="Error creating listener network event. Result = %1." />
        <string id="SirepServer.ErrorSelectingOnListenerSocket"             value="Error selecting on listener socket. Result = %1." />
        <string id="SirepServer.ErrorWaitingForMultiInControlLoop"          value="Error waiting for multiple objects in control loop. Result = %1." />
        <string id="SirepServer.ErrorEnumeratingListenerNetworkEvents"      value="Error enumerating network events on listener socket. Result = %1." />
        <string id="SirepServer.ListenerSocketClosedPrematurely"            value="Listener socket closed prematurely. Result = %1." />
        <string id="SirepServer.AsyncErrorAcceptingClient"                  value="Asynchronous error accepting client connection. Result = %1." />
        <string id="SirepServer.UnexpectedErrorAcceptingClient"             value="Unexpected error accepting client connection. Result = %1." />
        <string id="SirepServer.ErrorCreatingClientEvent"                   value="Error creating client network event. Result = %1." />
        <string id="SirepServer.ErrorSelectingOnClientSocket"               value="Error selecting on client socket. Result = %1." />
        <string id="SirepServer.ErrorCreatingClientHandler"                 value="Error creating client handler. Result = %1." />
        <string id="SirepServer.ErrorCheckingDevLock"                       value="Error checking DevLock. Result = %1." />
        <string id="SirepServer.ErrorEnumeratingClientNetworkEvents"        value="Error enumerating network events on client socket. Result = %1." />
        <string id="SirepServer.ErrorOnClientWriteEvent"                    value="Error on client write event. Result = %1." />
        <string id="SirepServer.ErrorOnClientReadEvent"                     value="Error on client read event. Result = %1." />
        <string id="SirepServer.ErrorOnSend"                                value="Error sending data. Result = %1." />
        <string id="SirepServer.ErrorOnReceive"                             value="Error receiving data. Result = %1." />
        <string id="SirepServer.ErrorStartingNBThread"                      value="Error starting Name Broadcaster thread. Result = %1." />
        <string id="SirepServer.ErrorSettingUpShutdownServicesEvent"        value="Error setting up Shutdown Services event. Result = %1." />
        <string id="SirepServer.ErrorSettingUpShutdownGlobalEvent"          value="Error setting up Shutdown global event. Result = %1." />
        <string id="SirepServer.ErrorJoiningNameBroadcaster"                value="Error joining Name Broadcaster. Result = %1." />
        <string id="SirepServer.ErrorNameBroadcasterStuckMayBe"             value="No response from Name Broadcaster thread on shutdown event." />
        <string id="SirepServer.ErrorStartingESThread"                      value="Error starting Echo Service thread. Result = %1." />
        <string id="SirepServer.ErrorEchoServiceStuckMayBe"                 value="No response from Echo Service thread on shutdown event." />
        <string id="SirepServer.ErrorJoiningEchoService"                    value="Error joining Echo Service. Result = %1." />
        <string id="SirepServer.ErrorEchoServiceTCPStuckMayBe"              value="No response from Echo TCP Service thread on shutdown event." />
        <string id="SirepServer.ErrorJoiningEchoServiceTCP"                 value="Error joining Echo TCP Service. Result = %1." />
        <string id="SirepServer.ErrorStartingESTCPThread"                   value="Error starting Echo TCP Service thread. Result = %1." />
        <string id="SirepServer.ErrorInitializingNBThread"                  value="Error initializing Name Broadcaster thread. Result = %1." />
        <string id="SirepServer.ErrorStoppingNBThread"                      value="Error stopping Name Broadcaster thread. Result = %1." />
        <string id="SirepServer.GetSockNameErrorWhileAcceptingClient"       value="Unexpected error from getsockname() during accepting client connection. Result = %1." />
        <string id="SirepServer.ErrorWriteFileFailureOnPutFile"             value="PutFile: WriteFile() failure,  Result = %1." />
        <string id="SirepServer.ErrorReadFileFailureOnGetFile"              value="GetFile: ReadFile() failure,  Result = %1." />
        <string id="SirepServer.ErrorGetFileSizeFailureOnGetFile"           value="GetFile: GetFileSize() failure,  Result = %1." />
        <string id="SirepServer.ErrorCreateProcessFailedOnBL"               value="BL: CreateProcessW() failure,  Result = %1." />
        <string id="SirepServer.ErrorSvcRegisterHandlerFailed"              value="Service RegisterHandler failure, Result = %1." />
        <string id="SirepServer.ErrorShutdownReceivedButEventHandleIsNull"  value="Error: Shutdown control received, but event handle is null. %1." />
        <string id="SirepServer.ErrorSetEventFailedOnSvcControlShutdown"    value="Error: SetEvent() failed while raising Shutdown event. %1." />
        <string id="SirepServer.ErrorControllerNFOnSvcControlShutdown"      value="Error: Shutdown control received, but ControllerWSA not allocated yet. %1." />
        <string id="SirepServer.ErrorSetServiceStatusFailed"                value="Error: SetServiceStatus() failure, Result = %1. Service will be terminated abnormally." />
        <string id="SirepServer.ErrorStartDispatcherFailed"                 value="Error: StartServiceCtrlDispatcher() failure, Result = %1." />
        <string id="SirepServer.ErrorRegOpenKeyOnSvcParamFailed"            value="Error: RegOpenKeyEx() failure on Reading Svc Params, Result = %1." />
        <string id="SirepServer.ErrorMallocOnSvcParamFailed"                value="Error: malloc() failure on Reading Svc Params, Result = %1." />
        <string id="SirepServer.ErrorRegQueryValueOnSvcParamFailed"         value="Error: RegQueryValueEx() failure on Reading Svc Params, Result = %1." />
        <string id="SirepServer.ErrorRegQueryValueNMSZOnSvcParamFailed"     value="Error: RegQueryValueEx() failure on Reading Svc Params, Value is not REG_MULTI_SZ type, Result = %1." />
        <string id="SirepServer.ErrorFeedIPsOnSvcParamFailed"               value="Error: Error selecting the listening interfaces on Reading Svc Params, Result = %1." />
        <string id="SirepServer.ErrorFeedIPsOnNBThread"                     value="Error: Error selecting the listening interfaces on Name Broadcaster thread, Result = %1." />
        <string id="SirepServer.ErrorStartingSvcThread"                     value="Error: Starting Svc Thread, Result = %1." />
        <string id="SirepServer.ErrorRegisteringStopHandler"                value="Error: Registering Stop Handler, Result = %1." />
        <string id="SirepServer.WSAControllerNotCreated"                    value="Failed to allocate mem for WSA controller." />
        <string id="SirepServer.WSAControllerFailInitialize"                value="Failed to initialize WSA controller, Result = %1." />
        <string id="SirepServer.NameBroadcastExceedBufferSize"              value="NameBroadcasterThread: Device broadcast name exceeded buffer!" />
        <string id="SirepServer.GetMACAddressFailure"                       value="NameBroadcasterThread: GetMACAddress() failed, Result = %1" />
        <string id="SirepServer.InitializeWSAFailed"                        value="Initialization of WSA failed, hr = %1" />
        <string id="SirepServer.UninitializeWSAFailed"                      value="Uninitialization of WSA failed, hr = %1" />
        <string id="SirepServer.WSARunFailed"                               value="Exception was thrown when trying to start WSA control loop, Result = %1" />
        <string id="SirepServer.BroadcastSendToFailed"                      value="During broadcast sendto failed, err = %1" />
        <string id="SirepServer.BroadcastSocketFailed"                      value="During broadcast socket() failed, err = %1" />
        <string id="SirepServer.ErrorCreatingSocket"                        value="Broadcaster::BroadcasterThread(): socket() failed. Result = %1." />
        <string id="SirepServer.PeekNamedPipeFailed"                        value="PeekNamedPipe failed, err = %1" />
        <string id="SirepServer.ReadChildPipeFailed"                        value="ReadFile from child pipe failed, err = %1" />
        <string id="SirepServer.CheckLaunchParametersFailed"                value="CheckLaunchParameters failed on code path %1, HRESULT = %2" />
        <string id="SirepServer.LaunchWithOutputFailed"                     value="LaunchWithOutput failed on code path %1, HRESULT = %2" />
        <string id="SirepServer.CheckLaunchStringFailed"                    value="CheckLaunchStringFailed failed on code path %1, Value1 = %2, Value2 = %3" />
        <string id="SirepServer.LaunchWithStringsFailed"                    value="SirepLaunchWithOutputCapturedStrings failed on code path %1, HRESULT = %2" />
        <string id="SirepServer.BroadcastData"                              value="Broadcasting MAC = %1, IP = %2" />
        <string id="SirepServer.CreatingProcess"                            value="Starting process = ~%1~, current directory = ~%2~" />
        <string id="SirepServer.CreatingDestinationFile"                    value="Creating destination file: %1" />
        <string id="SirepServer.OpeningSourceFile"                          value="Opening source file: %1" />
        <string id="SirepServer.ShellIsReady"                               value="Shell is ready" />
        <string id="SirepServer.ShellIsNotReady"                            value="Shell is NOT ready" />
        <string id="SirepServer.VirtualAllocFailed"                         value="VirtualAlloc failed, HRESULT = %1" />
        <string id="SirepServer.PutFileOnDeviceFailed"                      value="PutFileOnDevice failed on code path %1, HRESULT = %2" />
        <string id="SirepServer.CreatePipeFailed"                           value="CreatePipe failed, HRESULT = %1" />
        <string id="SirepServer.CreateEventFailed"                          value="CreateEvent failed, error = %1" />
        <string id="SirepServer.SetHandleInformationFailed"                 value="SetHandleInformation failed, HRESULT = %1" />
        <string id="SirepServer.FormatSpecialPathWFailed"                   value="FormatSpecialPathW failed, HRESULT = %1" />
        <string id="SirepServer.IsPermittedPathWFailed"                     value="IsPermittedPathW failed, HRESULT = %1" />
        <string id="SirepServer.CreateProcessInChamberFailed"               value="CreateProcessInChamber failed, HRESULT = %1" />
        <string id="SirepServer.FindFirstFileFailed"                        value="FindFirstFile (%1) failed, HRESULT = %2" />
        <string id="SirepServer.GetFileInformation"                         value="GetFileInformation file: %1" />

        <!-- Server warnings messages -->

        <string id="SirepServer.WarningClientBrokeProtocol"                 value="A client has broken protocol and cannot be serviced further. Break detected in method '%1' at file line %2." />
        <string id="SirepServer.WarningClientClosedUncleanly"               value="A client has closed in an unclean way. Result = %1." />
        <string id="SirepServer.WarningRejectingClientTooBusy"              value="Rejecting client, because all client slots are in use." />
        <string id="SirepServer.WarningRejectingClientUnsupportedType"      value="Rejecting client of a presumably unsupported type." />
        <string id="SirepServer.WarningRejectingClientAddressNotProvided"   value="Rejecting client, because no address was provided." />
        <string id="SirepServer.WarningRejectedIncomingInterface"           value="Rejecting client, because it showed up from an unallowed interface (IP Address = %1." />
        <string id="SirepServer.SuitableMACUnfound"                         value="Name broadcaster: Unable to find suitable MAC address, retrying" />
        <string id="SirepServer.WarningSendDeviceBroadcast"                 value="Name Broadcaster: Error sending broadcast for device, Result = %1" />
        <string id="SirepServer.WarningOSShutdown"                          value="Operating System is shutting down!" />
        <string id="SirepServer.WarningSocketShutdownCallFailed"            value="shutdown() call on socket failed, Result = %1" />
        <string id="SirepServer.WarningCloseSocketCallFailed"               value="closesocket() call failed, Result = %1" />
        <string id="SirepServer.WarningServiceStoppingDuringChildProcWait"  value="Wait on child process ignored, service is found stopping." />
        <string id="SirepServer.WarningChildProcWaitFailed"                 value="Wait failed on child process, Result = %1" />


        <!-- Server informational messages -->

        <string id="SirepServer.ProdProcessStarted"                         value="ProdSirep Process started." />
        <string id="SirepServer.ProdProcessExited"                          value="ProdSirep Process exited. Result = %1." />
        <string id="SirepServer.TestProcessStarted"                         value="TestSirep Process started." />
        <string id="SirepServer.TestProcessExited"                          value="TestSirep Process exited. Result = %1." />
        <string id="SirepServer.InfoCallingCreateProcessOnBL"               value="BL: Going to call CreateProcessW(%1)." />
        <string id="SirepServer.InfoCreateProcessSucceededOnBL"             value="BL: CreateProcessW() succeeded, Result = %1." />
        <string id="SirepServer.InfoProcessTerminatedOnBL"                  value="BL: Process terminated successfully, Result = %1." />
        <string id="SirepServer.InfoSvcFinishedInitialization"              value="Service initialization finished succcessfully." />
        <string id="SirepServer.InfoSvcFinishedRunning"                     value="Service finished running, Result = %1." />
        <string id="SirepServer.InfoReceivedServiceControl"                 value="Service control info received, Control code = %1." />
        <string id="SirepServer.InfoReportStatus"                           value="Sirep Service Status: SvcState = %1, ExitCode = %2, WaitHint = %3." />
        <string id="SirepServer.InfoSvcFinishedUninitialize"                value="Service finished uninitializing, Result = %1." />
        <string id="SirepServer.InfoSvcParamListenAddressesNotFound"        value="Service param: ListenAddresses not specified, Result = %1." />
        <string id="SirepServer.RegisteredSvcCtrlHandler"                   value="Service control handler register. Service name is %1." />
        <string id="SirepServer.ProcessPacketOnPutStart"                    value="Start of process packet put, packet size = %1" />
        <string id="SirepServer.ProcessPacketOnPutEnd"                      value="End of process packet put, packet size = %1" />
        <string id="SirepServer.ProcessPacketOnGetStart"                    value="Start of process packet get, packet size = %1" />
        <string id="SirepServer.ProcessPacketOnGetEnd"                      value="End of process packet get, packet size = $1" />
        <string id="SirepServer.SetEventOnSvcControlShutdown"               value="Service shutdown event was set." />
        <string id="SirepServer.ShutdownDuringGetMACAddress"                value="NameBroadcasterThread: GetMACAddress() detected shutdown." />
        <string id="SirepServer.InitializeWSA"                              value="Starting initialization of WSA." />
        <string id="SirepServer.UninitializeWSA"                            value="Starting uninitialization of WSA." />
        <string id="SirepServer.WSAConnectionDiedCallback"                  value="The WSA connection died callback was executed, state = %1, is connected = %2" />
        <string id="SirepServer.StoppingServiceThreads"                     value="Stopping WSA controller service threads." />
        <string id="SirepServer.InfoSvcStopping"                            value="Service stopping, Result = %1." />

        <!-- Server verbose messages -->

        <string id="SirepServer.WSASend"                                    value="WSA send, packet size = %1" />
        <string id="SirepServer.WSAReceive"                                 value="WSA receive, packet size = %1" />
        <string id="SirepServer.WSARun"                                     value="Starting control loop for WSA processing." />
        <string id="SirepServer.GetAdapterForMACAdressFirst"                value="First attempt to get adapter address return value = %1" />
        <string id="SirepServer.GetAdapterForMACAdressSecond"               value="Second attempt to get adapter address return value = %1" />
        <string id="SirepServer.GetAdapterForMACAdressFinal"                value="Final value from call of retrieving adapter address value = %1" />
        <string id="SirepServer.NameBroadCasterGetMACAddress"               value="Return value from name broadcaster when getting MAC address, value = %1" />
        <string id="SirepServer.ShutdownWhileSendingBroadcast"              value="Name Broadcaster: SendBroadcastForDevice() deteced shutdown." />

        <!-- SirepPipe events -->

        <string id="SirepPipe.SocketoptFailed"
            value="setsockopt failed, error = %1"/>

        <string id="SirepPipe.RecvFailed"
            value="recv failed on code path = %1, error = %2"/>

        <string id="SirepPipe.ReceivedPipeGuid"
            value="Received pipe GUID value"/>

        <string id="SirepPipe.PipeGuidMatch"
            value="Request matches Sirep pipe GUID"/>

        <string id="SirepPipe.PipeAlreadyConnected"
            value="Pipe is already connected"/>

        <string id="SirepPipe.NoMatchingPipe"
            value="No matching pipe for received GUID value"/>

        <string id="SirepPipe.LoadLibraryFailed"
            value="LoadLibrary failed, error = %1"/>

        <string id="SirepPipe.SendAcknowledgementFailed"
            value="Failed to send Acknowledgement"/>

        <string id="SirepPipe.CreateThreadFailed"
            value="CreateThread failed, error = %1"/>

        <string id="SirepPipe.BindAttempt"
            value="Binding IP address=  %1, port = %2"/>

        <string id="SirepPipe.BindRetryFailed"
            value="All bind attempts failed"/>

        <string id="SirepPipe.BindFatalError"
            value="bind fatal error = %1"/>

        <string id="SirepPipe.ListenFailed"
            value="listen failed, error = %1"/>

        <string id="SirepPipe.AcceptSuccess"
            value="Accepted connection"/>

        <string id="SirepPipe.ReceiveCommandFailed"
            value="Failed to receive command, error = %1"/>

        <string id="SirepPipe.ReceivedData"
            value="Received data: pipe = %1, ReceivedSize = %2, ExpectedSize = %3"/>

        <string id="SirepPipe.SendFailed"
            value="send failed on code path = %1, error = %2"/>

        <string id="SirepPipe.SentData"
            value="Sent data: pipe = %1, SentSize = %2, ExpectedSize = %3"/>

        <string id="SirepPipe.WSACreateEventFailed"
            value="WSACreateEvent failed, error = %1"/>

        <string id="SirepPipe.WSAEventSelectFailed"
            value="WSAEventSelect failed, error = %1"/>

        <string id="SirepPipe.WaitForThreadReservation"
            value="Waiting: Semaphore = %1, Event = %2, HandleCount = %3"/>

        <string id="SirepPipe.WaitResultValue"
            value="Wait result = %1"/>

        <string id="SirepPipe.ReleaseThreadReservation"
            value="Release thread reservation, semaphore = %1"/>

        <string id="SirepPipe.WaitForWSAEventSelect"
            value="Waiting: SelectEvent = %1, ShutdownEvent = %2"/>

        <string id="SirepPipe.WSAEnumNetworkEventsFailed"
            value="WSAEnumNetworkEvents failed, error = %1"/>

        <string id="SirepPipe.ConnectFailed"
            value="connect failed, error = %1"/>

        <string id="SirepPipe.RecvFromFailed"
            value="WSARecvFrom failed, error = %1"/>

        <string id="SirepPipe.RecvFromSizes"
            value="Received datagram: socket = %1, ReceivedSize = %2, ExpectedSize = %3, HostAddressSize = %4"/>

        <string id="SirepPipe.SocketClose"
            value="Socket Close: socket = %1, error code = %2"/>

        <string id="SirepPipe.ProcessShutDown"
            value="Service process shutting down"/>

        <string id="SirepPipe.PipeThreadStart"
            value="Pipe service thread start"/>

        <string id="SirepPipe.PipeThreadFinished"
            value="Pipe service thread finished"/>

        <string id="SirepPipe.SendingPacket"
            value="Sending Sirep packet type = %1, DataSize = %2, BytesToSend = %3, Timeout = %4"/>

        <string id="SirepPipe.ReceivedPacket"
            value="Received Sirep packet type = %1, DataSize = %2"/>

        <string id="SirepPipe.ReceivePacketFailed"
            value="Receive Sirep packet failed, HRESULT = %1"/>

        <string id="SirepPipe.SendPacketFailed"
            value="Send Sirep packet failed, HRESULT = %1"/>

        <string id="SirepPipe.ReceivingPacket"
            value="Receiving Sirep packet: BytesToReceive = %1, timeout = %2"/>

        <string id="SirepPipe.PipeReceiving"
            value="Receiving data: size = %1, timeout = %2"/>

        <string id="SirepPipe.PipeReceived"
            value="Received data successfully"/>

        <string id="SirepPipe.PipeReceiveFailed"
            value="Receive failed, HRESULT = %1"/>

        <string id="SirepPipe.PipeSending"
            value="Sending data: size = %1, timeout = %2"/>

        <string id="SirepPipe.PipeSent"
            value="Data sent successfully"/>

        <string id="SirepPipe.PipeSendFailed"
            value="Send failed, HRESULT = %1"/>

        <string id="SirepPipe.SendPacketSucceeded"
            value="Sirep packet sent successfully"/>

        <string id="SirepPipe.SendingHresult"
            value="Sending HRESULT packet: Timeout = %1, value = %2"/>

        <string id="SirepPipe.SendHresultFailed"
            value="Sending HRESULT packet failed, HRESULT = %1"/>

        <string id="SirepPipe.SendHresultSucceeded"
            value="HRESULT packet sent successfully"/>

        <string id="SirepPipe.ReceivingHresult"
            value="Receiving HRESULT packet: timeout = %1"/>

        <string id="SirepPipe.ReceiveHresultFailed"
            value="Receiving HRESULT packet failed, HRESULT = %1"/>

        <string id="SirepPipe.ReceiveHresultSucceeded"
                value="Received HRESULT value = %1"/>

        <string id="SirepPipe.ReceiveHresultIncorrect"
            value="Receiving malformed HRESULT packet: type = %1, DataSize = %2"/>

        <string id="SirepPipe.SetNoDelayFailed"
            value="Failed to set TCP_NODELAY option, error = %1"/>

        <string id="SirepPipe.SendingHresultNoTimeout"
            value="Sending HRESULT packet: Timeout = INFINITE, value = %1"/>

        <string id="SirepPipe.SendingPacketNoTimeout"
            value="Sending Sirep packet type = %1, DataSize = %2, BytesToSend = %3, Timeout = INFINITE"/>

        <string id="SirepPipe.ReceivingPacketNoTimeout"
            value="Receiving Sirep packet: BytesToReceive = %1, Timeout = INFINITE"/>

        <string id="SirepPipe.ReceivingHresultNoTimeout"
            value="Receiving HRESULT packet, Timeout = INFINITE"/>

        <string id="SirepPipe.PipeReceivingNoTimeout"
            value="Receiving data: BytesToReceive = %1, Timeout = INFINITE"/>

        <string id="SirepPipe.PipeSendingNoTimeout"
            value="Sending data: BytesToSend = %1, Timeout = INFINITE"/>

        <string id="SirepPipe.SendingHresultSOK"
            value="Sending HRESULT packet: timeout = %1, value = S_OK"/>

        <string id="SirepPipe.SendingHresultNoTimeoutSOK"
            value="Sending HRESULT packet: Timeout = INFINITE, value = S_OK"/>

        <string id="SirepPipe.ReceiveHresultSucceededSOK"
                value="Received HRESULT value = S_OK"/>

        
        <!-- SirepPipe opcodes -->

        <string id="Opcode.SocketoptFailed"
            value="socketopt failed"/>

        <string id="Opcode.RecvFailed"
            value="recv failed"/>

        <string id="Opcode.ReceivedPipeGuid"
            value="Received pipe GUID"/>

        <string id="Opcode.PipeGuidMatch"
            value="Matched pipe GUID"/>

        <string id="Opcode.NoMatchingPipe"
            value="GUID doesn't match any pipe"/>

        <string id="Opcode.LoadLibraryFailed"
            value="LoadLibrary failed"/>

        <string id="Opcode.SendAcknowledgementFailed"
            value="Failed to send acknowledgement"/>

        <string id="Opcode.CreateThreadFailed"
            value="CreateThread failed"/>

        <string id="Opcode.BindAttempt"
            value="bind attempt"/>

        <string id="Opcode.BindRetryFailed"
            value="Failed all bind attempts"/>

        <string id="Opcode.BindFatalError"
            value="bind fatal error"/>

        <string id="Opcode.ListenFailed"
            value="listen failed"/>

        <string id="Opcode.AcceptFailed"
            value="accept failed"/>

        <string id="Opcode.AcceptSuccess"
            value="Accepted connection"/>

        <string id="Opcode.ReceiveCommandFailed"
            value="Failed to receive command"/>

        <string id="Opcode.ReceivedData"
            value="Received data"/>

        <string id="Opcode.SendFailed"
            value="send failed"/>

        <string id="Opcode.SentData"
            value="Sent data"/>

        <string id="Opcode.WSACreateEventFailed"
            value="WSACreateEvent failed"/>

        <string id="Opcode.WSAEventSelectFailed"
            value="WSAEventSelect failed"/>

        <string id="Opcode.WaitForThreadReservation"
            value="Wait for thread reservation"/>

        <string id="Opcode.WaitResultValue"
            value="Wait result"/>

        <string id="Opcode.ReleaseThreadReservation"
            value="Release thread reservation"/>

        <string id="Opcode.WaitForWSAEventSelect"
            value="Wait for WSAEventSelect"/>

        <string id="Opcode.WSAEnumNetworkEventsFailed"
            value="WSAEnumNetworkEvents failed"/>

        <string id="Opcode.ConnectFailed"
            value="connect failed"/>

        <string id="Opcode.RecvFromFailed"
            value="WSARecvFrom failed"/>

        <string id="Opcode.RecvFromSizes"
            value="Received datagram"/>

        <string id="Opcode.SocketClose"
          value="Socket Close"/>

        <string id="Opcode.ProcessShutDown"
            value="Service shutting down"/>

        <string id="Opcode.PipeThreadStart"
            value="Pipe thread start"/>

        <string id="Opcode.PipeThreadFinished"
            value="Pipe thread finished"/>

        <string id="Opcode.IpRefreshResult"
            value="IP refresh result"/>

        <string id="Opcode.SendingPacket"
            value="Sending packet"/>

        <string id="Opcode.ReceivedPacket"
            value="Received packet"/>

        <string id="Opcode.ReceivePacketFailed"
            value="Receive packet failed"/>

        <string id="Opcode.SendPacketFailed"
            value="Send packet failed"/>

        <string id="Opcode.ReceivingPacket"
            value="Receiving packet"/>

        <string id="Opcode.PipeReceiving"
            value="Receiving data"/>

        <string id="Opcode.PipeReceived"
            value="Received data"/>

        <string id="Opcode.PipeReceiveFailed"
            value="Receive failed"/>

        <string id="Opcode.PipeSending"
            value="Sending data"/>

        <string id="Opcode.PipeSent"
            value="Data sent"/>

        <string id="Opcode.PipeSendFailed"
            value="Send failed"/>

        <string id="Opcode.SendPacketSucceeded"
            value="Sirep packet sent"/>

        <string id="Opcode.SendingHresult"
            value="Sending HRESULT packet"/>

        <string id="Opcode.SendHresultFailed"
            value="Sending HRESULT packet failed"/>

        <string id="Opcode.SendHresultSucceeded"
            value="HRESULT packet sent"/>

        <string id="Opcode.ReceivingHresult"
            value="Receiving HRESULT packet"/>

        <string id="Opcode.ReceiveHresultFailed"
            value="Receiving HRESULT packet failed"/>

        <string id="Opcode.ReceiveHresultSucceeded"
            value="Received HRESULT"/>

        <string id="Opcode.ReceiveHresultIncorrect"
            value="Received malformed HRESULT"/>

        <string id="Opcode.SetNoDelayFailed"
            value="Failed to set TCP_NODELAY"/>

        <string id="Opcode.SendingHresultNoTimeout"
            value="Sending HRESULT packet"/>

        <string id="Opcode.SendingPacketNoTimeout"
            value="Sending packet"/>

        <string id="Opcode.ReceivingPacketNoTimeout"
            value="Receiving packet"/>

        <string id="Opcode.ReceivingHresultNoTimeout"
            value="Receiving HRESULT packet"/>

        <string id="Opcode.PipeReceivingNoTimeout"
            value="Receiving data"/>

        <string id="Opcode.PipeSendingNoTimeout"
            value="Sending data"/>

        <string id="Opcode.SendingHresultSOK"
            value="Sending HRESULT packet"/>

        <string id="Opcode.SendingHresultNoTimeoutSOK"
            value="Sending HRESULT packet"/>

        <string id="Opcode.ReceiveHresultSucceededSOK"
            value="Received HRESULT"/>



        <!-- SirepClient events -->
        <string id="Map.VariantBoolType.False"                                                                  value="false" />
        <string id="Map.VariantBoolType.True"                                                                   value="true" />

        <string id="SirepClient.InternalError.WithHResultAndMessage"                                            value="An internal error was detected in function '%1'. Error message = '%2'. Result = '%3'." />

        <string id="SirepClient.PublicApiMisuse.WithHResultAndMessage"                                          value="The public API '%1' has been misused. Error message = '%2'. Result = '%3'." />
        <string id="SirepClient.PublicApiMisuse.NotSupported"                                                   value="The public API '%1' is not supported and should not be called." />
        <string id="SirepClient.PublicApiMisuse.ReturningFailureHResultFromOnLaunchOutput"                      value="A launch output callback '%1' returned failure, which is not supported. Callback result = '%2'." />
        <string id="SirepClient.PublicApiMisuse.SirepInitializeNotSupported"                                    value="Unsupported API called: SirepInitialize. SirepInitializeWithEndpoints is the replacement API." />


        <string id="SirepClient.KeyInformation.SettingClientSideClientIdentifier"                               value="Setting or changing client-side client identifier to '%1'." />
        <string id="SirepClient.KeyInformation.SettingServerSideClientIdentifier"                               value="Setting or changing server-side client identifier to '%1'." />
        <string id="SirepClient.KeyInformation.ConnectedSuccessfully"                                           value="The main client connection has been connected successfully." />
        <string id="SirepClient.KeyInformation.DisconnectedSuccessfully"                                        value="The main client connection has been disconnected successfully." />
        <string id="SirepClient.KeyInformation.IgnoringDisconnectRequestSinceWeAreNotConnected"                 value="Ignoring disconnect request because the main connection is not connected." />
        <string id="SirepClient.KeyInformation.TranslatingErrorResult"                                          value="An error result is being translated from '%1' to '%2'." />

        <string id="SirepClient.TransactionTrace.FlushingPendingSend"                                           value="A pending send for transaction cookie '%1' is being flushed." />
        <string id="SirepClient.TransactionTrace.SendingPacket"                                                 value="Sending packet. Transaction = '%1'. Type = '%2'. SubType = '%3'. Transaction cookie = '%4'. Size in bytes = '%5'." />
        <string id="SirepClient.TransactionTrace.SentPacketSuccessfully"                                        value="Sent packet successfully. Transaction = '%1'. Type = '%2'. SubType = '%3'. Transaction cookie = '%4'. Size in bytes = '%5'." />
        <string id="SirepClient.TransactionTrace.ReceivedPacketSuccessfully"                                    value="Received packet successfully. Transaction = '%1'. Type = '%2'. SubType = '%3'. Transaction cookie = '%4'. Size in bytes = '%5'." />
        <string id="SirepClient.TransactionTrace.ReceivedTransactionFailureFromServer"                          value="Received transaction failure from SirepServer. Transaction = '%1'. Transaction cookie = '%2'. Client-side message = '%3'. Server-side result = '%4'." />
        <string id="SirepClient.TransactionTrace.CompletedSuccessfully"                                         value="Transaction completed successfully. Transaction = '%1'. Transaction cookie = '%2'." />
        <string id="SirepClient.TransactionTrace.TimedOut"                                                      value="Transaction timed out. Transaction = '%1'. Transaction cookie = '%2'." />

        <string id="SirepClient.FunctionTrace.Enter.Params.None"                                                value="Entering function '%1'." />
        <string id="SirepClient.FunctionTrace.Enter.Params.UnicodeString"                                       value="Entering function '%1'. String = '%2'." />
        <string id="SirepClient.FunctionTrace.Enter.Params.TimeoutInMilliseconds"                               value="Entering function '%1'. Timeout = '%2'." />
        <string id="SirepClient.FunctionTrace.Enter.Params.TimeoutInMilliseconds.VariantBool"                   value="Entering function '%1'. Timeout = '%2'. VariantBool = '%3'." />

        <string id="SirepClient.FunctionTrace.Exit.Return.None"                                                 value="Exiting function '%1'." />
        <string id="SirepClient.FunctionTrace.Exit.Return.HResult"                                              value="Exiting function '%1'. Return result = '%2'." />
        <string id="SirepClient.FunctionTrace.Exit.Return.HResult.AnsiString"                                   value="Exiting function '%1'. Return result = '%2'. Output string = '%3'." />
        <string id="SirepClient.FunctionTrace.Exit.Return.IPv4AddressInNetOrder"                                value="Exiting function '%1'. Return IPv4 address = '%2'." />

        <string id="SirepClient.FunctionTrace.Exit.Throw.HResult"                                               value="Exiting function '%1' via throw. Exception result = '%2'." />

        <string id="SirepClient.PublicApiTrace.Enter.Params.None"                                               value="API start: '%1'." />
        <string id="SirepClient.PublicApiTrace.Enter.Params.AnsiString"                                         value="API start: '%1'. String = '%2'." />
        <string id="SirepClient.PublicApiTrace.Enter.Params.UnicodeString"                                      value="API start: '%1'. String = '%2'." />
        <string id="SirepClient.PublicApiTrace.Enter.Params.TimeoutInMilliseconds.VariantBool"                  value="API start: '%1'. Timeout = '%2'. VariantBool = '%3'." />
        <string id="SirepClient.PublicApiTrace.Enter.Params.LocalEndpoint.RemoteEndpoint"                       value="API start: '%1'. LocalEndpoint: (Is null = '%2'. IP address = '%3'. Sirep port = '%4'. Echo port = '%5'.)  RemoteEndpoint: (Is null = '%6'. IP address = '%7'. Sirep port = '%8'. Echo port = '%9'.)" />
        <string id="SirepClient.PublicApiTrace.Enter.SirepPutFile"                                              value="API start: '%1'. Timeout = '%2'. Async = '%3'. SourcePath = '%4'. DestinationPath = '%5'. Overwrite = '%6'." />
        <string id="SirepClient.PublicApiTrace.Enter.SirepLaunch"                                               value="API start: '%1'. Command param = '%2'. Command = '%3'. LaunchFlags = '%4'." />
        <string id="SirepClient.PublicApiTrace.Enter.SirepGetFile"                                              value="API start: '%1'. Timeout = '%2'. SourcePath = '%3'. DestinationPath = '%4'. Overwrite = '%5'." />
        <string id="SirepClient.PublicApiTrace.Enter.LaunchWithOutput"                                          value="API start: '%1'. Timeout = '%2'. Command param = '%3'. Command = '%4'. WorkingDirectory = '%5'. LaunchFlags = '%6'. Provided output callback param = '%7'." />
        <string id="SirepClient.PublicApiTrace.Enter.CreateProcess"                                             value="API start: '%1'. Command param = '%2'. Command = '%3'. WorkingDirectory = '%4'. LaunchFlags = '%5'." />
        <string id="SirepClient.PublicApiTrace.Enter.Params.TimeoutInMilliseconds"                              value="API start: '%1'. Timeout = '%2'." />
        <string id="SirepClient.PublicApiTrace.Enter.Params.UInt32.UInt32"                                      value="API start: '%1'. Keep Alive Timeout in msec param = '%2', Keep Alive Interval in msec param = '%3'." />

        <string id="SirepClient.PublicApiTrace.Exit.Return.HResult"                                             value="API exit: '%1'. Return result = '%2'." />
        <string id="SirepClient.PublicApiTrace.Exit.Return.HResult.AnsiString"                                  value="API exit: '%1'. Return result = '%2'. Output string = '%3'." />
        <string id="SirepClient.PublicApiTrace.Exit.Return.HResult.UnicodeString"                               value="API exit: '%1'. Return result = '%2'. Output string = '%3'." />
        <string id="SirepClient.PublicApiTrace.Exit.Return.HResult.FileInfox"                                   value="API exit: '%1'. Return result = '%2'. Output file info: (Is null = '%3'. File attributes = '%4'. Creation time = '%5'. Last access time = '%6'. Last write time = '%7'.)" />
        <string id="SirepClient.PublicApiTrace.Exit.Return.HResult.DWord"                                       value="API exit: '%1'. Return result = '%2'. Output DWORD = '%3'." />
        <string id="SirepClient.PublicApiTrace.Exit.Return.HResult.UInt64"                                      value="API exit: '%1'. Return result = '%2'. Output number = '%3'." />
        <string id="SirepClient.PublicApiTrace.Exit.Return.HResult.VariantBool"                                 value="API exit: '%1'. Return result = '%2'. Output VariantBool = '%3'." />

        <string id="SirepClient.PublicApiTrace.Callback.OnLaunchOutput"                                         value="Making launch output callback '%1'. Flag = '%2'. Message = '%3'." />

        <!-- SirepClient events -->
        
        <string id="SirepClient.ClientSirepConnectFailed"
            value="ClientSirepConnect failed on code path = %1, HRESULT = %2"/>

        <string id="SirepClient.ClientSirepConnectProtocolAlreadyCreated"
            value="ClientSirepConnect: Protocol object already created"/>

        <string id="SirepClient.ClientSirepConnectProtocolDetected"
            value="ClientSirepConnect: Protocol detected"/>

        <string id="SirepClient.SetSendReceiveTimeoutEnter"
            value="SetSendReceiveTimeout has been called"/>

        <string id="SirepClient.SetSendReceiveTimeoutExit"
            value="SetSendReceiveTimeout exit, HRESULT = %1"/>

        <string id="SirepClient.DestroyingPipes"
            value="Destroying communication pipes"/>

        <string id="SirepClient.Protocol2InitialSetupStart"
            value="Protocol2 initial setup starting"/>

        <string id="SirepClient.Protocol2InitialSetupFailed"
            value="Protocol2 initial setup failed, HRESULT = %1"/>

        <string id="SirepClient.CreatedEvent"
            value="Created event, handle = %1"/>

        <string id="SirepClient.Protocol2InitialSetupCreatedPipe"
            value="Created communication pipe, handle = %1"/>

        <string id="SirepClient.Protocol2InitialSetupFinished"
            value="Protocol2 initial setup finished"/>

        <string id="SirepClient.Protocol2SirepConnectAlreadyConnected"
            value="Protocol2 already connected"/>

        <string id="SirepClient.Protocol2SirepConnectFailed"
            value="Protocol2 connect failed on code path = %1, HRESULT = %2"/>

        <string id="SirepClient.Protocol2DisconnectingPipe"
            value="Disconnecting pipe = %1"/>

        <string id="SirepClient.Protocol2SirepDisconnectAlreadyDisconnected"
            value="Client is already disconnected"/>

        <string id="SirepClient.SettingEvent"
            value="Setting event %1"/>

        <string id="SirepClient.Protocol2SirepDisconnectFailed"
            value="Disconnect failed on code path = %1, HRESULT = %2"/>

        <string id="SirepClient.ResettingEvent"
            value="Resetting event %1"/>

        <string id="SirepClient.Protocol2ExecuteFailed"
            value="Child process execute failed on code path = %1, HRESULT = %2"/>

        <string id="SirepClient.Protocol2ExecuteFinished"
            value="Child process exited with code = %1"/>

        <string id="SirepClient.Protocol2ExecuteTextCallback"
            value="Text callback start"/>

        <string id="SirepClient.Protocol2CheckPingFailed"
            value="CheckPing failed on code path = %1, HRESULT = %2"/>

        <string id="SirepClient.Protocol2SirepPingConnecting"
            value="Ping connecting to Server"/>

        <string id="SirepClient.Protocol2SirepPingSucceeded"
            value="SirepPing success"/>

        <string id="SirepClient.Protocol2SirepPingFailed"
            value="SirepPing failed on code path = %1, HRESULT = %2"/>

        <string id="SirepClient.Protocol2SirepPutFileFailed"
            value="PutFile failed on code path = %1, HRESULT = %2"/>

        <string id="SirepClient.Protocol2SirepPutFileSucceeded"
            value="PutFile succeeded"/>

        <string id="SirepClient.Protocol2SirepGetFileFailed"
            value="GetFile failed on code path = %1, HRESULT = %2"/>

        <string id="SirepClient.Protocol2SirepWriteFileFailed"
            value="WriteFile failed, HRESULT = %1"/>

        <string id="SirepClient.Protocol2SirepGetDeviceInfoFailed"
            value="GetDeviceInfo failed on code path = %1, HRESULT = %2"/>

        <string id="SirepClient.Protocol2SirepGetFileInfoFailed"
            value="GetFileInfo failed on code path = %1, HRESULT = %2"/>

        <string id="SirepClient.Protocol2SirepCheckTimeRemainingFailed"
            value="CheckTimeRemaining failed: TickCountStart = %1, TickCountDelta = %2, TickCountTimeoutDelta = %3"/>

        <string id="SirepClient.Protocol2SirepConnecting"
            value="Protocol2 start connecting"/>

        <string id="SirepClient.SocketCreated"
            value="Created socket = %1"/>

        <string id="SirepClient.ConnectCall"
            value="Connecting to Server IP address = %1"/>

        <string id="SirepClient.ConnectSuccess"
            value="Connected successfully"/>

        <string id="SirepClient.PipeConnectFailed"
            value="Failed to connect pipe on code path = %1, HRESULT = %2"/>

        <string id="SirepClient.Protocol1SirepConnectAlreadyConnected"
            value="Protocol1 already connected"/>

        <string id="SirepClient.GetFileSizeExFailed"
            value="GetFileSizeExFailed failed, HRESULT = %1"/>

        <string id="SirepClient.WSAStartupFailed"
            value="WSAStartup failed, error = %1"/>

        <string id="SirepClient.WSACleanupFailed"
            value="WSACleanup failed, error = %1"/>

        
        <!-- SirepClient opcodes -->

        <string id="Opcode.ClientSirepConnectFailed"
            value="ClientSirepConnect failed"/>

        <string id="Opcode.ClientSirepConnectProtocolAlreadyCreated"
            value="Protocol object already created"/>

        <string id="Opcode.ClientSirepConnectProtocolDetected"
            value="Protocol detected"/>

        <string id="Opcode.SetSendReceiveTimeoutEnter"
            value="SetSendReceiveTimeout start"/>

        <string id="Opcode.SetSendReceiveTimeoutExit"
            value="SetSendReceiveTimeout exit"/>

        <string id="Opcode.DestroyingPipes"
            value="Destroying pipes"/>

        <string id="Opcode.Protocol2InitialSetupStart"
            value="Protocol2 setup"/>

        <string id="Opcode.Protocol2InitialSetupFailed"
            value="Protocol2 setup failed"/>

        <string id="Opcode.CreatedEvent"
            value="Created event"/>

        <string id="Opcode.Protocol2InitialSetupCreatedPipe"
            value="Created pipe"/>

        <string id="Opcode.Protocol2InitialSetupFinished"
            value="Protocol2 setup finished"/>

        <string id="Opcode.Protocol2SirepConnectAlreadyConnected"
            value="Protocol2 already connected"/>

        <string id="Opcode.Protocol2SirepConnectFailed"
            value="Protocol2 connect failed"/>

        <string id="Opcode.Protocol2DisconnectingPipe"
            value="Disconnecting pipe"/>

        <string id="Opcode.Protocol2SirepDisconnectAlreadyDisconnected"
            value="Already disconnected"/>

        <string id="Opcode.SettingEvent"
            value="SetEvent"/>

        <string id="Opcode.Protocol2SirepDisconnectFailed"
            value="Disconnect failed"/>

        <string id="Opcode.ResettingEvent"
            value="ResetEvent"/>

        <string id="Opcode.Protocol2ExecuteFailed"
            value="Execute failed"/>

        <string id="Opcode.Protocol2ExecuteFinished"
            value="Child process exit"/>

        <string id="Opcode.Protocol2ExecuteTextCallback"
            value="Callback start"/>

        <string id="Opcode.Protocol2CheckPingFailed"
            value="Check ping failed"/>

        <string id="Opcode.Protocol2SirepPingConnecting"
            value="Ping connecting"/>

        <string id="Opcode.Protocol2SirepPingSucceeded"
            value="SirepPing success"/>

        <string id="Opcode.Protocol2SirepPingFailed"
            value="SirepPing failed"/>

        <string id="Opcode.Protocol2SirepPutFileFailed"
            value="PutFile failed"/>

        <string id="Opcode.Protocol2SirepPutFileSucceeded"
            value="PutFile success"/>

        <string id="Opcode.Protocol2SirepGetFileFailed"
            value="GetFile failed"/>

        <string id="Opcode.Protocol2SirepWriteFileFailed"
            value="WriteFile failed"/>

        <string id="Opcode.Protocol2SirepGetDeviceInfoFailed"
            value="GetDeviceInfo failed"/>

        <string id="Opcode.Protocol2SirepGetFileInfoFailed"
            value="GetFileInfo failed"/>

        <string id="Opcode.Protocol2SirepCheckTimeRemainingFailed"
            value="CheckTimeRemaining failed"/>

        <string id="Opcode.Protocol2SirepConnecting"
            value="Protocol2 connecting"/>

        <string id="Opcode.SocketCreated"
            value="Created socket"/>

        <string id="Opcode.ConnectCall"
            value="Connecting to Server"/>

        <string id="Opcode.ConnectSuccess"
            value="Connected"/>

        <string id="Opcode.PipeConnectFailed"
            value="Failed to connect pipe"/>

        <string id="Opcode.PublicApiMisuse"
            value="Public API misuse" />

        <string id="Opcode.Protocol1SirepConnectAlreadyConnected"
            value="Protocol1 already connected"/>

        <string id="Opcode.GetFileSizeExFailed"
            value="GetFileSizeEx failed"/>

        <string id="Opcode.WSAStartupFailed"
            value="WSAStartup failed"/>

        <string id="Opcode.WSACleanupFailed"
            value="WSACleanup failed"/>
        
        
        <!-- Sirep Server opcodes -->

        <string id="Opcode.PeekNamedPipeFailed"
            value="PeekNamedPipe failed"/>

        <string id="Opcode.ReadChildPipeFailed"
            value="ReadFile from child pipe failed"/>

        <string id="Opcode.CheckLaunchParametersFailed"
            value="CheckLaunchParameters failed"/>

        <string id="Opcode.LaunchWithOutputFailed"
            value="LaunchWithOutput failed"/>

        <string id="Opcode.CheckLaunchStringFailed"
            value="CheckLaunchString failed"/>

        <string id="Opcode.LaunchWithStringsFailed"
            value="SirepLaunchWithOutputCapturedStrings failed"/>

        <string id="Opcode.BroadcastData"
            value="Broadcast2"/>

        <string id="Opcode.CreatingProcess"
            value="Creating process"/>

        <string id="Opcode.CreatingDestinationFile"
            value="Creating file"/>

        <string id="Opcode.OpeningSourceFile"
            value="Opening file"/>

        <string id="Opcode.ShellIsReady"
            value="Shell ready"/>

        <string id="Opcode.ShellIsNotReady"
            value="Shell NOT ready"/>

        <string id="Opcode.VirtualAllocFailed"
            value="VirtualAllocFailed failed"/>

        <string id="Opcode.PutFileOnDeviceFailed"
            value="PutFileOnDeviceFailed failed"/>

        <string id="Opcode.CreatePipeFailed"
            value="CreatePipe failed"/>

        <string id="Opcode.CreateEventFailed"
            value="CreateEvent failed"/>

        <string id="Opcode.SetHandleInformationFailed"
            value="SetHandleInformation failed"/>

        <string id="Opcode.FormatSpecialPathWFailed"
            value="FormatSpecialPathW failed"/>

        <string id="Opcode.IsPermittedPathWFailed"
            value="IsPermittedPathW failed"/>
        
        <string id="Opcode.CreateProcessInChamberFailed"
            value="CreateProcessInChamber failed"/>

        <string id="Opcode.FindFirstFileFailed"
            value="FindFirstFile failed"/>

        <string id="Opcode.GetFileInformation"
            value="GetFileInformation"/>

      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
