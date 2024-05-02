<?xml version='1.0' encoding='utf-8' standalone='yes'?>

<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->


<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>
    <events>
      
      <provider name="Microsoft-WindowsPhone-VidStream"
          guid="{E1B302DD-D9BF-4F31-924D-03186A527ABE}"
          symbol="Microsoft_WindowsPhone_VidStream"
          messageFileName="vidstream.dll"
          resourceFileName="vidstream.dll">


        <channels />
          

        <keywords>


          <!-- default Windows Phone keywords -->
          <keyword mask="0x0000000000000001" name="Error" />
          <keyword mask="0x0000000000000002" name="Performance" />
          <keyword mask="0x0000000000000004" name="Debug" />


          <!-- VidStream keywords -->
          <keyword mask="0x0000000000000010" name="SurfaceQueue" />
          <keyword mask="0x0000000000000020" name="VidStreamService" />
          <keyword mask="0x0000000000000040" name="Converter" />
          <keyword mask="0x0000000000000100" name="FileSink" />
          <keyword mask="0x0000000000000200" name="UsbSink" />
          <keyword mask="0x0000000000000400" name="NullSink" />


        </keywords>


        <opcodes>


          <opcode name="BadMatch" value="11" />

          <opcode name="DeviceIoControlFailed" value="21" />
          <opcode name="GetOverlappedResultFailed" value="22" />

          <opcode name="AlreadyUp" value="31" />

          <opcode name="Surface" value="41" />

          <opcode name="Padding" value="51" />


        </opcodes>
        

        <tasks>


          <!-- DebugPrint tasks -->
          <task name="DebugPrint" value="0x1" />


          <!-- SurfaceQueue tasks -->
          <task name="SurfaceQueue_Create" value="0x11" />
          <task name="SurfaceQueue_DequeueFreeSurface" value="0x12" />
          <task name="SurfaceQueue_EnqueueWrittenSurface" value="0x13" />
          <task name="SurfaceQueue_DequeueWrittenSurface" value="0x14" />
          <task name="SurfaceQueue_EnqueueFreeSurface" value="0x15" />
          <task name="SurfaceQueue_ResetQueue" value="0x16" />
          <task name="SurfaceQueue_Destroy" value="0x17" />
          <task name="SurfaceQueue_EnqueueUnconvertedSurface" value="0x18" />
          <task name="SurfaceQueue_DequeueUnconvertedSurface" value="0x19" />


          <!-- VidStreamService tasks -->
          <task name="VidStreamService_Create" value="0x21" />
          <task name="VidStreamService_Destroy" value="0x22" />
          <task name="VidStreamService_Initialize" value="0x23" />


          <!-- Converter tasks -->
          <task name="Converter_Create" value="0x41" />
          <task name="Converter_Destroy" value="0x42" />
          <task name="Converter_ServiceThread" value="0x43" />
          <task name="Converter_ServiceThread_Convert" value="0x44" />


          <!-- FileSink tasks -->
          <task name="FileSink_Create" value="0x101" />
          <task name="FileSink_IsActive" value="0x102" />
          <task name="FileSink_Destroy" value="0x103" />
          <task name="FileSink_ServiceThread" value="0x104" />


          <!-- UsbSink tasks -->
          <task name="UsbSink_Create" value="0x201" />
          <task name="UsbSink_IsActive" value="0x202" />
          <task name="UsbSink_Destroy" value="0x203" />
          <task name="UsbSink_ServiceThread" value="0x204" />
          <task name="UsbSink_ServiceThreadWait" value="0x205" />
          <task name="UsbSink_StateChange" value="0x206" />
          <task name="UsbSink_SendSurface" value="0x207" />
          <task name="UsbSink_Initialize" value="0x208" />
          <task name="UsbSink_ARD" value="0x209" />


          <!-- NullSink tasks -->
          <task name="NullSink_Create" value="0x401" />
          <task name="NullSink_IsActive" value="0x402" />
          <task name="NullSink_Destroy" value="0x403" />
          <task name="NullSink_ServiceThread" value="0x404" />


        </tasks>


        <maps>

          <valueMap name="DriverState">
            <map value="0" message="$(string.DriverState.Invalid)" />
            <map value="1" message="$(string.DriverState.NotReady)" />
            <map value="2" message="$(string.DriverState.Ready)" />
            <map value="3" message="$(string.DriverState.D0)" />
            <map value="4" message="$(string.DriverState.Configured)" />
            <map value="5" message="$(string.DriverState.Connected)" />
            <map value="6" message="$(string.DriverState.CaptureRequested)" />
            <map value="7" message="$(string.DriverState.Capture)" />
            <map value="8" message="$(string.DriverState.Error)" />
          </valueMap>

        </maps>


        <templates>


          <template tid="int">
            <data name="i" inType="win:Int32" />
          </template>

          <template tid="bool">
            <data name="fBool" inType="win:Boolean" />
          </template>

          <template tid="hex">
            <data name="hex" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="ptr">
            <data name="ptr" inType="win:Pointer" />
          </template>

          <template tid="DriverState">
            <data name="DriverState" inType="win:UInt32" map="DriverState" />
          </template>

          <template tid="intbool">
            <data name="i"     inType="win:Int32" />
            <data name="fBool" inType="win:Boolean" />
          </template>

          <template tid="hexptr">
            <data name="hex" inType="win:UInt32" outType="win:HexInt32" />
            <data name="ptr" inType="win:Pointer" />
          </template>

          <template tid="DriverState_DriverState">
            <data name="DriverState1" inType="win:UInt32" map="DriverState" />
            <data name="DriverState2" inType="win:UInt32" map="DriverState" />
          </template>

          <template tid="ptruint64ptruint64">
            <data name="ptr"    inType="win:Pointer" />
            <data name="i"      inType="win:UInt64" />
            <data name="ptr2"   inType="win:Pointer" />
            <data name="i2"     inType="win:UInt64" />
          </template>

          <template tid="ptrptruint64">
            <data name="ptr"    inType="win:Pointer" />
            <data name="ptr2"   inType="win:Pointer" />
            <data name="i"      inType="win:UInt64" />
          </template>

          <template tid="ptruint64ptruint64bool">
            <data name="ptr"    inType="win:Pointer" />
            <data name="i"      inType="win:UInt64" />
            <data name="ptr2"   inType="win:Pointer" />
            <data name="i2"     inType="win:UInt64" />
            <data name="fBool"  inType="win:Boolean" />
          </template>

          <template tid="ptrptruintuint64">
            <data name="ptr"        inType="win:Pointer" />
            <data name="ptr2"       inType="win:Pointer" />
            <data name="u"          inType="win:UInt32" />
            <data name="i"          inType="win:UInt64" />
          </template>

          <template tid="InitParams">
            <data name="iSurfaces"      inType="win:Int32" />
            <data name="iCaptureBpp"    inType="win:Int32" />
            <data name="iOutputBpp"     inType="win:Int32" />
            <data name="iActualWidth"   inType="win:Int32" />
            <data name="iActualHeight"  inType="win:Int32" />
            <data name="iScaledWidth"   inType="win:Int32" />
            <data name="iScaledHeight"  inType="win:Int32" />
          </template>


        </templates>


        <events>


          <event value="0x11"
              symbol="DebugPrint_Int"
              keywords="Debug"
              level="win:Verbose"
              task="DebugPrint"
              template="int"
              message="$(string.DebugPrint.Int)" />

          <!-- SurfaceQueue Events -->
          <event value="0x110"
              symbol="SurfaceQueue_Create_Start"
              keywords="Performance SurfaceQueue"
              level="win:Informational"
              task="SurfaceQueue_Create"
              opcode="win:Start"
              template="intbool"
              message="$(string.SurfaceQueue.Create.Start)" />
          <event value="0x111"
              symbol="SurfaceQueue_Create_Stop"
              keywords="Performance SurfaceQueue"
              level="win:Informational"
              task="SurfaceQueue_Create"
              opcode="win:Stop"
              template="hex"
              message="$(string.SurfaceQueue.Create.Stop)" />

          <event value="0x120"
              symbol="SurfaceQueue_DequeueFreeSurface_Start"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_DequeueFreeSurface"
              opcode="win:Start"
              message="$(string.SurfaceQueue.DequeueFreeSurface.Start)" />
          <event value="0x121"
              symbol="SurfaceQueue_DequeueFreeSurface_Stop"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_DequeueFreeSurface"
              opcode="win:Stop"
              template="hexptr"
              message="$(string.SurfaceQueue.DequeueFreeSurface.Stop)" />

          <event value="0x130"
              symbol="SurfaceQueue_EnqueueWrittenSurface_Start"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_EnqueueWrittenSurface"
              opcode="win:Start"
              template="ptr"
              message="$(string.SurfaceQueue.EnqueueWrittenSurface.Start)" />
          <event value="0x131"
              symbol="SurfaceQueue_EnqueueWrittenSurface_Stop"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_EnqueueWrittenSurface"
              opcode="win:Stop"
              template="hex"
              message="$(string.SurfaceQueue.EnqueueWrittenSurface.Stop)" />
          <event value="0x132"
              symbol="SurfaceQueue_EnqueueWrittenSurface_BadMatch"
              keywords="SurfaceQueue"
              level="win:Error"
              task="SurfaceQueue_EnqueueWrittenSurface"
              opcode="BadMatch"
              template="ptruint64ptruint64bool"
              message="$(string.SurfaceQueue.EnqueueWrittenSurface.BadMatch)" />

          <event value="0x140"
              symbol="SurfaceQueue_DequeueWrittenSurface_Start"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_DequeueWrittenSurface"
              opcode="win:Start"
              message="$(string.SurfaceQueue.DequeueWrittenSurface.Start)" />
          <event value="0x141"
              symbol="SurfaceQueue_DequeueWrittenSurface_Stop"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_DequeueWrittenSurface"
              opcode="win:Stop"
              template="hexptr"
              message="$(string.SurfaceQueue.DequeueWrittenSurface.Stop)" />

          <event value="0x150"
              symbol="SurfaceQueue_EnqueueFreeSurface_Start"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_EnqueueFreeSurface"
              opcode="win:Start"
              template="ptr"
              message="$(string.SurfaceQueue.EnqueueFreeSurface.Start)" />
          <event value="0x151"
              symbol="SurfaceQueue_EnqueueFreeSurface_Stop"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_EnqueueFreeSurface"
              opcode="win:Stop"
              template="hex"
              message="$(string.SurfaceQueue.EnqueueFreeSurface.Stop)" />
          <event value="0x152"
              symbol="SurfaceQueue_EnqueueFreeSurface_BadMatch"
              keywords="SurfaceQueue"
              level="win:Error"
              task="SurfaceQueue_EnqueueFreeSurface"
              opcode="BadMatch"
              template="ptruint64ptruint64"
              message="$(string.SurfaceQueue.EnqueueFreeSurface.BadMatch)" />

          <event value="0x160"
              symbol="SurfaceQueue_ResetQueue_Start"
              keywords="Performance SurfaceQueue"
              level="win:Informational"
              task="SurfaceQueue_ResetQueue"
              opcode="win:Start"
              message="$(string.SurfaceQueue.ResetQueue.Start)" />
          <event value="0x161"
              symbol="SurfaceQueue_ResetQueue_Stop"
              keywords="Performance SurfaceQueue"
              level="win:Informational"
              task="SurfaceQueue_ResetQueue"
              opcode="win:Stop"
              message="$(string.SurfaceQueue.ResetQueue.Stop)" />

          <event value="0x170"
              symbol="SurfaceQueue_Destroy_Start"
              keywords="Performance SurfaceQueue"
              level="win:Informational"
              task="SurfaceQueue_Destroy"
              opcode="win:Start"
              message="$(string.SurfaceQueue.Destroy.Start)" />
          <event value="0x171"
              symbol="SurfaceQueue_Destroy_Stop"
              keywords="Performance SurfaceQueue"
              level="win:Informational"
              task="SurfaceQueue_Destroy"
              opcode="win:Stop"
              message="$(string.SurfaceQueue.Destroy.Stop)" />

          <event value="0x180"
              symbol="SurfaceQueue_EnqueueUnconvertedSurface_Start"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_EnqueueUnconvertedSurface"
              opcode="win:Start"
              template="ptr"
              message="$(string.SurfaceQueue.EnqueueUnconvertedSurface.Start)" />
          <event value="0x181"
              symbol="SurfaceQueue_EnqueueUnconvertedSurface_Stop"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_EnqueueUnconvertedSurface"
              opcode="win:Stop"
              template="hex"
              message="$(string.SurfaceQueue.EnqueueUnconvertedSurface.Stop)" />
          <event value="0x182"
              symbol="SurfaceQueue_EnqueueUnconvertedSurface_BadMatch"
              keywords="SurfaceQueue"
              level="win:Error"
              task="SurfaceQueue_EnqueueUnconvertedSurface"
              opcode="BadMatch"
              template="ptruint64ptruint64"
              message="$(string.SurfaceQueue.EnqueueUnconvertedSurface.BadMatch)" />

          <event value="0x190"
              symbol="SurfaceQueue_DequeueUnconvertedSurface_Start"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_DequeueUnconvertedSurface"
              opcode="win:Start"
              message="$(string.SurfaceQueue.DequeueUnconvertedSurface.Start)" />
          <event value="0x191"
              symbol="SurfaceQueue_DequeueUnconvertedSurface_Stop"
              keywords="Performance SurfaceQueue"
              level="win:Verbose"
              task="SurfaceQueue_DequeueUnconvertedSurface"
              opcode="win:Stop"
              template="hexptr"
              message="$(string.SurfaceQueue.DequeueUnconvertedSurface.Stop)" />


          <!-- VidStreamService Events -->
          <event value="0x210"
              symbol="VidStreamService_Create_Start"
              keywords="Performance VidStreamService"
              level="win:Informational"
              task="VidStreamService_Create"
              opcode="win:Start"
              message="$(string.VidStreamService.Create.Start)" />
          <event value="0x211"
              symbol="VidStreamService_Create_Stop"
              keywords="Performance VidStreamService"
              level="win:Informational"
              task="VidStreamService_Create"
              opcode="win:Stop"
              template="hex"
              message="$(string.VidStreamService.Create.Stop)" />

          <event value="0x220"
              symbol="VidStreamService_Destroy_Start"
              keywords="Performance VidStreamService"
              level="win:Informational"
              task="VidStreamService_Destroy"
              opcode="win:Start"
              message="$(string.VidStreamService.Destroy.Start)" />
          <event value="0x221"
              symbol="VidStreamService_Destroy_Stop"
              keywords="Performance VidStreamService"
              level="win:Informational"
              task="VidStreamService_Destroy"
              opcode="win:Stop"
              message="$(string.VidStreamService.Destroy.Stop)" />

          <event value="0x230"
              symbol="VidStreamService_Initialize_Start"
              keywords="Performance VidStreamService"
              level="win:Informational"
              task="VidStreamService_Initialize"
              opcode="win:Start"
              template="InitParams"
              message="$(string.VidStreamService.Initialize.Start)" />
          <event value="0x231"
              symbol="VidStreamService_Initialize_Stop"
              keywords="Performance VidStreamService"
              level="win:Informational"
              task="VidStreamService_Initialize"
              opcode="win:Stop"
              template="hex"
              message="$(string.VidStreamService.Initialize.Stop)" />


          <!-- Converter Events -->
          <event value="0x410"
              symbol="Converter_Create_Start"
              keywords="Performance Converter"
              level="win:Informational"
              task="Converter_Create"
              opcode="win:Start"
              message="$(string.Converter.Create.Start)" />
          <event value="0x411"
              symbol="Converter_Create_Stop"
              keywords="Performance Converter"
              level="win:Informational"
              task="Converter_Create"
              opcode="win:Stop"
              template="hex"
              message="$(string.Converter.Create.Stop)" />

          <event value="0x420"
              symbol="Converter_Destroy_Start"
              keywords="Performance Converter"
              level="win:Informational"
              task="Converter_Destroy"
              opcode="win:Start"
              message="$(string.Converter.Destroy.Start)" />
          <event value="0x421"
              symbol="Converter_Destroy_Stop"
              keywords="Performance Converter"
              level="win:Informational"
              task="Converter_Destroy"
              opcode="win:Stop"
              message="$(string.Converter.Destroy.Stop)" />

          <event value="0x430"
              symbol="Converter_ServiceThread_Start"
              keywords="Performance Converter"
              level="win:Informational"
              task="Converter_ServiceThread"
              opcode="win:Start"
              message="$(string.Converter.ServiceThread.Start)" />
          <event value="0x431"
              symbol="Converter_ServiceThread_Stop"
              keywords="Performance Converter"
              level="win:Informational"
              task="Converter_ServiceThread"
              opcode="win:Stop"
              template="hex"
              message="$(string.Converter.ServiceThread.Stop)" />
          <event value="0x432"
              symbol="Converter_ServiceThread_Convert_Start"
              keywords="Performance Converter"
              level="win:Verbose"
              task="Converter_ServiceThread_Convert"
              opcode="win:Start"
              template="ptrptruintuint64"
              message="$(string.Converter.ServiceThread.Convert.Start)" />
          <event value="0x433"
              symbol="Converter_ServiceThread_Convert_Stop"
              keywords="Performance Converter"
              level="win:Verbose"
              task="Converter_ServiceThread_Convert"
              opcode="win:Stop"
              message="$(string.Converter.ServiceThread.Convert.Stop)" />
          <event value="0x434"
              symbol="Converter_ServiceThread_Convert_Padding"
              keywords="Performance Converter"
              level="win:Verbose"
              task="Converter_ServiceThread_Convert"
              opcode="Padding"
              template="int"
              message="$(string.Converter.ServiceThread.Convert.Padding)" />


          <!-- FileSink Events -->
          <event value="0x1010"
              symbol="FileSink_Create_Start"
              keywords="Performance FileSink"
              level="win:Informational"
              task="FileSink_Create"
              opcode="win:Start"
              message="$(string.FileSink.Create.Start)" />
          <event value="0x1011"
              symbol="FileSink_Create_Stop"
              keywords="Performance FileSink"
              level="win:Informational"
              task="FileSink_Create"
              opcode="win:Stop"
              template="hex"
              message="$(string.FileSink.Create.Stop)" />

          <event value="0x1020"
              symbol="FileSink_IsActive"
              keywords="Performance FileSink"
              level="win:Verbose"
              task="FileSink_IsActive"
              opcode="win:Info"
              message="$(string.FileSink.IsActive)" />

          <event value="0x1030"
              symbol="FileSink_Destroy_Start"
              keywords="Performance FileSink"
              level="win:Informational"
              task="FileSink_Destroy"
              opcode="win:Start"
              message="$(string.FileSink.Destroy.Start)" />
          <event value="0x1031"
              symbol="FileSink_Destroy_Stop"
              keywords="Performance FileSink"
              level="win:Informational"
              task="FileSink_Destroy"
              opcode="win:Stop"
              message="$(string.FileSink.Destroy.Stop)" />

          <event value="0x1040"
              symbol="FileSink_ServiceThread_Start"
              keywords="Performance FileSink"
              level="win:Informational"
              task="FileSink_ServiceThread"
              opcode="win:Start"
              message="$(string.FileSink.ServiceThread.Start)" />
          <event value="0x1041"
              symbol="FileSink_ServiceThread_Stop"
              keywords="Performance FileSink"
              level="win:Informational"
              task="FileSink_ServiceThread"
              opcode="win:Stop"
              template="hex"
              message="$(string.FileSink.ServiceThread.Stop)" />


          <!-- UsbSink Events -->
          <event value="0x2010"
              symbol="UsbSink_Create_Start"
              keywords="Performance UsbSink"
              level="win:Informational"
              task="UsbSink_Create"
              opcode="win:Start"
              message="$(string.UsbSink.Create.Start)" />
          <event value="0x2011"
              symbol="UsbSink_Create_Stop"
              keywords="Performance UsbSink"
              level="win:Informational"
              task="UsbSink_Create"
              opcode="win:Stop"
              template="hex"
              message="$(string.UsbSink.Create.Stop)" />

          <event value="0x2020"
              symbol="UsbSink_IsActive"
              keywords="Performance UsbSink"
              level="win:Verbose"
              task="UsbSink_IsActive"
              opcode="win:Info"
              template="DriverState"
              message="$(string.UsbSink.IsActive)" />

          <event value="0x2030"
              symbol="UsbSink_Destroy_Start"
              keywords="Performance UsbSink"
              level="win:Informational"
              task="UsbSink_Destroy"
              opcode="win:Start"
              message="$(string.UsbSink.Destroy.Start)" />
          <event value="0x2031"
              symbol="UsbSink_Destroy_Stop"
              keywords="Performance UsbSink"
              level="win:Informational"
              task="UsbSink_Destroy"
              opcode="win:Stop"
              message="$(string.UsbSink.Destroy.Stop)" />

          <event value="0x2040"
              symbol="UsbSink_ServiceThread_Start"
              keywords="Performance UsbSink"
              level="win:Informational"
              task="UsbSink_ServiceThread"
              opcode="win:Start"
              message="$(string.UsbSink.ServiceThread.Start)" />
          <event value="0x2041"
              symbol="UsbSink_ServiceThread_Stop"
              keywords="Performance UsbSink"
              level="win:Informational"
              task="UsbSink_ServiceThread"
              opcode="win:Stop"
              template="hex"
              message="$(string.UsbSink.ServiceThread.Stop)" />

          <event value="0x2050"
              symbol="UsbSink_ServiceThreadWait_Start"
              keywords="Performance UsbSink"
              level="win:Verbose"
              task="UsbSink_ServiceThreadWait"
              opcode="win:Start"
              message="$(string.UsbSink.ServiceThreadWait.Start)" />
          <event value="0x2051"
              symbol="UsbSink_ServiceThreadWait_Stop"
              keywords="Performance UsbSink"
              level="win:Verbose"
              task="UsbSink_ServiceThreadWait"
              opcode="win:Stop"
              message="$(string.UsbSink.ServiceThreadWait.Stop)" />

          <event value="0x2060"
              symbol="UsbSink_StateChange"
              keywords="Debug UsbSink"
              level="win:Informational"
              task="UsbSink_StateChange"
              template="DriverState_DriverState"
              message="$(string.UsbSink.StateChange)" />
          <event value="0x2061"
              symbol="UsbSink_StateChange_DeviceIoControlFailed"
              keywords="Error UsbSink"
              level="win:Critical"
              task="UsbSink_StateChange"
              opcode="DeviceIoControlFailed"
              template="hex"
              message="$(string.UsbSink.StateChange.DeviceIoControlFailed)" />
          <event value="0x2062"
              symbol="UsbSink_StateChange_GetOverlappedResultFailed"
              keywords="Error UsbSink"
              level="win:Critical"
              task="UsbSink_StateChange"
              opcode="GetOverlappedResultFailed"
              template="hex"
              message="$(string.UsbSink.StateChange.GetOverlappedResultFailed)" />

          <event value="0x2070"
              symbol="UsbSink_SendSurface_Start"
              keywords="Performance UsbSink"
              level="win:Verbose"
              task="UsbSink_SendSurface"
              opcode="win:Start"
              message="$(string.UsbSink.SendSurface.Start)" />
          <event value="0x2071"
              symbol="UsbSink_SendSurface_Stop"
              keywords="Performance UsbSink"
              level="win:Verbose"
              task="UsbSink_SendSurface"
              opcode="win:Stop"
              message="$(string.UsbSink.SendSurface.Stop)" />
          <event value="0x2072"
              symbol="UsbSink_SendSurface_DeviceIoControlFailed"
              keywords="Error UsbSink"
              level="win:Critical"
              task="UsbSink_SendSurface"
              opcode="DeviceIoControlFailed"
              template="hex"
              message="$(string.UsbSink.SendSurface.DeviceIoControlFailed)" />
          <event value="0x2073"
              symbol="UsbSink_SendSurface_GetOverlappedResultFailed"
              keywords="Error UsbSink"
              level="win:Critical"
              task="UsbSink_SendSurface"
              opcode="GetOverlappedResultFailed"
              template="hex"
              message="$(string.UsbSink.SendSurface.GetOverlappedResultFailed)" />

          <event value="0x2080"
              symbol="UsbSink_Initialize_DeviceIoControlFailed"
              keywords="Error UsbSink"
              level="win:Critical"
              task="UsbSink_Initialize"
              opcode="DeviceIoControlFailed"
              template="hex"
              message="$(string.UsbSink.Initialize.DeviceIoControlFailed)" />

          <event value="0x2090"
              symbol="UsbSink_ARD_AlreadyUp"
              keywords="Error UsbSink"
              level="win:Critical"
              task="UsbSink_ARD"
              opcode="AlreadyUp"
              message="$(string.UsbSink.ARD.AlreadyUp)" />


          <!-- NullSink Events -->
          <event value="0x4010"
              symbol="NullSink_Create_Start"
              keywords="Performance NullSink"
              level="win:Informational"
              task="NullSink_Create"
              opcode="win:Start"
              message="$(string.NullSink.Create.Start)" />
          <event value="0x4011"
              symbol="NullSink_Create_Stop"
              keywords="Performance NullSink"
              level="win:Informational"
              task="NullSink_Create"
              opcode="win:Stop"
              template="hex"
              message="$(string.NullSink.Create.Stop)" />

          <event value="0x4020"
              symbol="NullSink_IsActive"
              keywords="Performance NullSink"
              level="win:Verbose"
              task="NullSink_IsActive"
              opcode="win:Info"
              message="$(string.NullSink.IsActive)" />

          <event value="0x4030"
              symbol="NullSink_Destroy_Start"
              keywords="Performance NullSink"
              level="win:Informational"
              task="NullSink_Destroy"
              opcode="win:Start"
              message="$(string.NullSink.Destroy.Start)" />
          <event value="0x4031"
              symbol="NullSink_Destroy_Stop"
              keywords="Performance NullSink"
              level="win:Informational"
              task="NullSink_Destroy"
              opcode="win:Stop"
              message="$(string.NullSink.Destroy.Stop)" />

          <event value="0x4040"
              symbol="NullSink_ServiceThread_Start"
              keywords="Performance NullSink"
              level="win:Informational"
              task="NullSink_ServiceThread"
              opcode="win:Start"
              message="$(string.NullSink.ServiceThread.Start)" />
          <event value="0x4041"
              symbol="NullSink_ServiceThread_Stop"
              keywords="Performance NullSink"
              level="win:Informational"
              task="NullSink_ServiceThread"
              opcode="win:Stop"
              template="hex"
              message="$(string.NullSink.ServiceThread.Stop)" />
          <event value="0x4042"
              symbol="NullSink_ServicesThread_Surface"
              keywords="Debug NullSink"
              level="win:Verbose"
              task="NullSink_ServiceThread"
              opcode="Surface"
              template="ptrptruint64"
              message="$(string.NullSink.ServiceThread.Surface)" />


        </events>

      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>


        <!-- DriverState strings -->
        <string id="DriverState.Invalid"    value="Invalid" />
        <string id="DriverState.NotReady"   value="NotReady" />
        <string id="DriverState.Ready"      value="Ready" />
        <string id="DriverState.D0"         value="D0" />
        <string id="DriverState.Configured" value="Configured" />
        <string id="DriverState.Connected"  value="Connected" />
        <string id="DriverState.CaptureRequested" value="CaptureRequested" />
        <string id="DriverState.Capture"    value="Capture" />
        <string id="DriverState.Error"      value="Error" />


        <!-- DebugPrint strings -->
        <string id="DebugPrint.Int" value="DebugPrint.Int - %1" />


        <!-- SurfaceQueue strings -->
        <string id="SurfaceQueue.Create.Start"
            value="SurfaceQueue - Create - Start (iSurfaces=%1; fConvert=%2)" />
        <string id="SurfaceQueue.Create.Stop"
            value="SurfaceQueue - Create - Stop (hr=%1)" />

        <string id="SurfaceQueue.DequeueFreeSurface.Start"
            value="SurfaceQueue - DequeueFreeSurface - Start" />
        <string id="SurfaceQueue.DequeueFreeSurface.Stop"
            value="SurfaceQueue - DequeueFreeSurface - Stop (hr=%1; ptr=%2)" />

        <string id="SurfaceQueue.EnqueueWrittenSurface.Start"
            value="SurfaceQueue - EnqueueWrittenSurface - Start (ptr=%1)" />
        <string id="SurfaceQueue.EnqueueWrittenSurface.Stop"
            value="SurfaceQueue - EnqueueWrittenSurface - Stop" />
        <string id="SurfaceQueue.EnqueueWrittenSurface.BadMatch"
            value=" ~~ ERR ~~ SurfaceQueue - EnqueueWrittenSurface - BadMatch (ptr=%1; id=%2; ptrQueue=%3; idQueue=%4; fConvert=%5))" />

        <string id="SurfaceQueue.DequeueWrittenSurface.Start"
            value="SurfaceQueue - DequeueWrittenSurface - Start" />
        <string id="SurfaceQueue.DequeueWrittenSurface.Stop"
            value="SurfaceQueue - DequeueWrittenSurface - Stop (hr=%1; ptr=%2)" />

        <string id="SurfaceQueue.EnqueueFreeSurface.Start"
            value="SurfaceQueue - EnqueueFreeSurface - Start (ptr=%1)" />
        <string id="SurfaceQueue.EnqueueFreeSurface.Stop"
            value="SurfaceQueue - EnqueueFreeSurface - Stop" />
        <string id="SurfaceQueue.EnqueueFreeSurface.BadMatch"
            value=" ~~ ERR ~~ SurfaceQueue - EnqueueFreeSurface - BadMatch (ptr=%1; id=%2; ptrQueue=%3; idQueue=%4)" />

        <string id="SurfaceQueue.ResetQueue.Start"
            value="SurfaceQueue - ResetQueue - Start" />
        <string id="SurfaceQueue.ResetQueue.Stop"
            value="SurfaceQueue - ResetQueue - Stop" />

        <string id="SurfaceQueue.Destroy.Start"
            value="SurfaceQueue - Destroy - Start" />
        <string id="SurfaceQueue.Destroy.Stop"
            value="SurfaceQueue - Destroy - Stop" />

        <string id="SurfaceQueue.EnqueueUnconvertedSurface.Start"
            value="SurfaceQueue - EnqueueUnconvertedSurface - Start (ptr=%1)" />
        <string id="SurfaceQueue.EnqueueUnconvertedSurface.Stop"
            value="SurfaceQueue - EnqueueUnconvertedSurface - Stop" />
        <string id="SurfaceQueue.EnqueueUnconvertedSurface.BadMatch"
            value=" ~~ ERR ~~ SurfaceQueue - EnqueueUnconvertedSurface - BadMatch (ptr=%1; id=%2; ptrQueue=%3; idQueue=%4" />

        <string id="SurfaceQueue.DequeueUnconvertedSurface.Start"
            value="SurfaceQueue - DequeueUnconvertedSurface - Start" />
        <string id="SurfaceQueue.DequeueUnconvertedSurface.Stop"
            value="SurfaceQueue - DequeueUnconvertedSurface - Stop (hr=%1; ptr=%2)" />


        <!-- VidStreamService strings -->
        <string id="VidStreamService.Create.Start"
            value="VidStreamService - Create - Start" />
        <string id="VidStreamService.Create.Stop"
            value="VidStreamService - Create - Stop (hr=%1)" />

        <string id="VidStreamService.Destroy.Start"
            value="VidStreamService - Destroy - Start" />
        <string id="VidStreamService.Destroy.Stop"
            value="VidStreamService - Destroy - Stop" />

        <string id="VidStreamService.Initialize.Start"
            value="VidStreamService - Initialize - Start (iSurfaces=%1; iCaptureBpp=%2; iOutputBpp=%3; iActualWidth=%4; iActualHeight=%5; iScaledWidth=%6; iScaledHeight=%7" />
        <string id="VidStreamService.Initialize.Stop"
            value="VidStreamService - Initialize - Stop (hr=%1)" />


        <!-- Converter strings -->
        <string id="Converter.Create.Start"
            value="Converter - Create - Start" />
        <string id="Converter.Create.Stop"
            value="Converter - Create - Stop (hr=%1)" />

        <string id="Converter.Destroy.Start"
            value="Converter - Destroy - Start" />
        <string id="Converter.Destroy.Stop"
            value="Converter - Destroy - Stop" />

        <string id="Converter.ServiceThread.Start"
            value="Converter - ServiceThread - Start" />
        <string id="Converter.ServiceThread.Stop"
            value="Converter - ServiceThread - Stop (hr=%1)" />
        <string id="Converter.ServiceThread.Convert.Start"
            value="Converter - ServiceThread - Convert - Start (pSurface=%1; pBits=%2; cbStride=%3; iFrameId=%4)" />
        <string id="Converter.ServiceThread.Convert.Stop"
            value="Converter - ServiceThread - Convert - Stop" />
        <string id="Converter.ServiceThread.Convert.Padding"
            value="Converter - ServiceThread - Convert - Padding (cb=%1)" />


        <!-- FileSink strings -->
        <string id="FileSink.Create.Start"
            value="FileSink - Create - Start" />
        <string id="FileSink.Create.Stop"
            value="FileSink - Create - Stop (hr=%1)" />

        <string id="FileSink.Destroy.Start"
            value="FileSink - Destroy - Start" />
        <string id="FileSink.Destroy.Stop"
            value="FileSink - Destroy - Stop" />

        <string id="FileSink.IsActive"
            value="FileSink - IsActive" />

        <string id="FileSink.ServiceThread.Start"
            value="FileSink - ServiceThread - Start" />
        <string id="FileSink.ServiceThread.Stop"
            value="FileSink - ServiceThread - Stop (hr=%1)" />


        <!-- UsbSink strings -->
        <string id="UsbSink.Create.Start"
            value="UsbSink - Create - Start" />
        <string id="UsbSink.Create.Stop"
            value="UsbSink - Create - Stop (hr=%1)" />

        <string id="UsbSink.Destroy.Start"
            value="UsbSink - Destroy - Start" />
        <string id="UsbSink.Destroy.Stop"
            value="UsbSink - Destroy - Stop" />

        <string id="UsbSink.IsActive"
            value="UsbSink - IsActive (state=%1)" />

        <string id="UsbSink.ServiceThread.Start"
            value="UsbSink - ServiceThread - Start" />
        <string id="UsbSink.ServiceThread.Stop"
            value="UsbSink - ServiceThread - Stop (hr=%1)" />

        <string id="UsbSink.ServiceThreadWait.Start"
            value="UsbSink - ServiceThreadWait - Start" />
        <string id="UsbSink.ServiceThreadWait.Stop"
            value="UsbSink - ServiceThreadWait - Stop" />

        <string id="UsbSink.StateChange"
            value="UsbSink - State Change from (%1) to (%2)" />
        <string id="UsbSink.StateChange.DeviceIoControlFailed"
            value="UsbSink - State Change - DeviceIoControl failed (hr=%1)" />
        <string id="UsbSink.StateChange.GetOverlappedResultFailed"
            value="UsbSink - State Change - GetOverlappedResult failed (hr=%1)" />

        <string id="UsbSink.SendSurface.Start"
            value="UsbSink - Send Surface - Start" />
        <string id="UsbSink.SendSurface.Stop"
            value="UsbSink - Send Surface - Stop" />
        <string id="UsbSink.SendSurface.DeviceIoControlFailed"
            value="UsbSink - Send Surface - DeviceIoControl failed (hr=%1)" />
        <string id="UsbSink.SendSurface.GetOverlappedResultFailed"
            value="UsbSink - Send Surface - GetOverlappedResult failed (hr=%1)" />

        <string id="UsbSink.Initialize.DeviceIoControlFailed"
            value="UsbSink - Initialize - DeviceIoControl failed (hr=%1)" />

        <string id="UsbSink.ARD.AlreadyUp"
            value="UsbSink - ARD - AlreadyUp" />


        <!-- NullSink strings -->
        <string id="NullSink.Create.Start"
            value="NullSink - Create - Start" />
        <string id="NullSink.Create.Stop"
            value="NullSink - Create - Stop (hr=%1)" />

        <string id="NullSink.Destroy.Start"
            value="NullSink - Destroy - Start" />
        <string id="NullSink.Destroy.Stop"
            value="NullSink - Destroy - Stop" />

        <string id="NullSink.IsActive"
            value="NullSink - IsActive" />

        <string id="NullSink.ServiceThread.Start"
            value="NullSink - ServiceThread - Start" />
        <string id="NullSink.ServiceThread.Stop"
            value="NullSink - ServiceThread - Stop (hr=%1)" />
        <string id="NullSink.ServiceThread.Surface"
            value="NullSink - ServiceThread - Surface (pSurface=%1; pBits=%2; iFrameId=%3)" />


      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
