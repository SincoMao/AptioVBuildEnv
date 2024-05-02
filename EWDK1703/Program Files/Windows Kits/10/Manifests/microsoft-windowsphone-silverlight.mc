<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<instrumentationManifest
            xmlns="http://schemas.microsoft.com/win/2004/08/events"
            xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
            xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <instrumentation>
        <events>
            <!-- Silverlight Mobile instrumentation -->
            <provider name="Microsoft-WindowsPhone-Silverlight"
                guid="{AA087E0E-0B35-4e28-8F3A-440C3F51EEF1}"
                symbol="SL_ETW_PROVIDER"
                resourceFileName="agcore.dll"
                messageFileName="agcore.dll"
                message="$(string.Provider.Name)">

                <keywords>
                    <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
                    <keyword mask="0x0000000000000004" name="DevPlatCircular" message="$(string.Keyword.DevPlatCircular)" />
                </keywords>

                <tasks>
                    <!-- Please try to keep this list ordered. -->
                    <!-- Tasks for component SILVERLIGHT (1 - 100) -->
                    <task name="Parse" value="1"/>
                    <task name="Raster" value="2"/>
                    <task name="Draw" value="3"/>
                    <task name="Present" value="4"/>
                    <task name="CLRStartup" value="5"/>
                    <task name="CLRShutdown" value="6"/>
                    <task name="ControlShutdown" value="7"/>
                    <task name="MediaDrawFrame" value="8"/>
                    <task name="MediaDroppedFrame" value="9"/>
                    <task name="VideoSampleRequest" value="10"/>
                    <task name="AudioSampleRequest" value="11"/>
                    <task name="VideoQueueSize" value="12"/>
                    <task name="MediaRenderCallback" value="13"/>
                    <task name="MediaBuffering" value="14"/>
                    <task name="ControlStartup" value="15"/>
                    <task name="PutRootVisual" value="16"/>
                    <task name="LoadNpctrlDll" value="17"/>
                    <task name="PutSource" value="18"/>
                    <task name="ImageDecode" value="19"/>
                    <task name="DecodeJpg" value="20"/>
                    <task name="SetValueManaged" value="21"/>
                    <task name="SetValueNative" value="22"/>
                    <task name="DownloadRequest" value="23"/>
                    <task name="MediaSampleAdded" value="24"/>
                    <task name="SeadragonDecode" value="25"/>
                    <task name="SeadragonTileDownloaded" value="26"/>
                    <task name="SeadragonBrushGenerate" value="27"/>
                    <task name="SeadragonRasterizeFrame" value="28"/>
                    <task name="SeadragonImageResolved" value="29"/>
                    <task name="ApplicationStartup" value="30"/>
                    <task name="DRMIndiv" value="31"/>
                    <task name="DRMLicenseAcquisition" value="32"/>
                    <task name="MediaRenderAudio" value="33"/>
                    <task name="Databinding" value="34"/>
                    <task name="ExtendedDatagridScroll" value="35"/>
                    <task name="MediaLogRequest" value="36"/>
                    <task name="CurrentAudioTimestamp" value="37"/>
                    <task name="CurrentVideoTimestamp" value="38"/>
                    <task name="AudioLatency" value="39"/>
                    <task name="MouseUp" value="40"/>
                    <task name="MouseDown" value="41"/>
                    <task name="Layout" value="42"/>
                    <task name="Render" value="43"/>
                    <task name="D3DCompile" value="44"/>
                    <task name="HwRender" value="45"/>
                    <task name="HwPresent" value="46"/>
                    <task name="ScriptCallback" value="47"/>
                    <task name="CLRCallback" value="48"/>
                    <task name="TickManagerPause" value="49"/>
                    <task name="TickManagerResume" value="50"/>
                    <task name="CompositorPause" value="51"/>
                    <task name="CompositorResume" value="52"/>
                    <task name="TickPost" value="53"/>
                    <task name="DispatcherTimerStart" value="54"/>
                    <task name="DispatcherTimerStop" value="55"/>
                    <task name="TickProcess" value="56"/>
                    <task name="TickDelayedForInput" value="57"/>
                    <task name="WM7VideoFrameReady" value="58"/>
                    <task name="WM7VideoFrameReleased" value="59"/>
                    <task name="WM7VideoFrameAdvance" value="60"/>
                    <task name="WM7VideoDroppedFrames" value="61"/>
                    <task name="MediaDrawFrameOldOrEmpty" value="62"/>
                    <task name="Seadragon4Download" value="63"/>
                    <task name="SplashScreenDrawn" value="64" />
                    <task name="CompositorCreation" value="65" />
                    <task name="ControlInitialize" value="66" />
                    <task name="WM7Gesture" value="67"/>
                    <task name="WM7ProcessGesture" value="68"/>
                    <task name="WM7GestureMoreData" value="69"/>
                    <task name="WM7VideoFrameAdvanceToGpu" value="75"/>
                    <task name="WM7VideoRegisterVideoSurfaces" value="76"/>
                    <task name="WM7VideoHasDirtySurfaces" value="77"/>
                    <task name="WM7VideoGetNextPresentTime" value="78"/>
                    <task name="WM7VideoClockStart" value="79"/>
                    <task name="WM7VideoClockStop" value="80"/>
                    <task name="WM7VideoFramePresentedEvent" value="81"/>
                    <task name="WM7VideoProviderStarving" value="82"/>
                    <task name="WM7VideoProviderAssert" value="83"/>
                    <task name="ParseObjectElement" value="84" />
                    <task name="ParsePropertyElement" value="85" />
                    <task name="StoryboardBegin" value="86" />
                    <task name="StoryboardPause" value="87" />
                    <task name="StoryboardResume" value="88" />
                    <task name="StoryboardStop" value="89" />
                    <task name="StoryboardEnd" value="90" />
                    <task name="PerFrameCallback" value="91" />
                    <task name="ApplicationStarting" value="92" />
                    <task name="ApplicationStarted" value="93" />
                    <task name="ApplicationLoadComponent" value="94" />
                    <task name="ApplicationConstructed" value="95" />
                    <task name="NewRenderList" value="96" />
                    <task name="LoadAppManifest" value="97" />
                    <task name="FirstUserDraw" value="98" />

                    <!-- Tasks that could likely be deprecated soon -->
                    <task name="FirstRaster" value="99"/>
                    <task name="Information" value="100"/>
                    <task name="CLRConvertValue" value="101"/>
                    <task name="CLRObjectLifetime" value="102"/>
                    <task name="ControlInPlaceDeact" value="103"/>
                    <task name="WinRender" value="104"/>
                    <!-- End deprecated task list -->

                    <!-- RasterizationBand Task -->
                   <task name="RasterizationBand" value="105"/>

                    <task name="Measure" value ="200"/>
                    <task name="Arrange" value="201"/>
                    <task name="CoreServicesCreate" value="202"/>
                    <task name="GraphicsDeviceClear" value="203"/>
                    <task name="CreateTexture" value="204" />
                    <task name="DestroyTexture" value="205" />
                    <task name="CreateManagedPeer" value="206" />
                    <task name="DirectManipulationMessage" value ="207"/>
                    <task name="DirectManpultationServer" value="208"/>
                    <task name="DirectManipulationClient" value="209"/>
                    <task name="DirectManipulationStarted" value="210"/>
                    <task name="DirectManipulationDelta" value="211" />
                    <task name="DirectManipulationCompleted" value="212" />
                    <task name="NativeScrollViewerHeight" value="213"/>
                    <task name="NativeScrollViewerTransform" value="214"/>
                    <task name="VSPRealizedHeight" value="215"/>
                    <task name="VSPOffset" value="216"/>
                    <task name="Popup" value="217" />
                    <task name="MessageBox" value="218" />
                    <task name="RasterizedFullScreenCache" value="219" />
                    <task name="ThreadCreate" value="220" />
                    <task name="ProfilerSample" value="221" />
                    <task name="TouchFirstDown" value="222" />
                    <task name="TouchAllUp" value="223" />
                    <task name="GestureStart" value="224" />
                    <task name="GestureType" value="225" />
                    <task name="GestureTarget" value="226" />
                    <task name="XBFGenerationFailure" value="227" />
                    <task name="XBFGenerationSuccess" value="228" />
                    <task name="XBFLoadFailure" value="229" />
                    <task name="XBFLoadSuccess" value="230" />
                    <task name="XamlValidatorFailure" value="231" />

                    <task name="D3DCreate" value="300" />
                    <task name="D3DInitializeDevice" value="301" />
                    <task name="D3DInitializeDx" value="302" />
                    <task name="D3DReleaseDx" value="303" />
                    <task name="D3DResize" value="304" />
                    <task name="D3DCreateTexture" value="305" />
                    <task name="D3DCreateTextureFromExistingTexture" value="306" />
                    <task name="D3DSetTransforms" value="307" />
                    <task name="D3DDrawTriangleStrip" value="308" />
                    <task name="D3DDrawIndexedTriangleStrip" value="309" />
                    <task name="D3DSetTexture" value="310" />
                    <task name="D3DSetRenderTarget" value="311" />
                    <task name="D3DClear" value="312" />
                    <task name="D3DSetVertexFormat" value="313" />
                    <task name="DirectRenderingBegin" value="316" />
                    <task name="DirectRenderingEnd" value="317" />

                    <task name="WpMediaMsg" value="359"/>

                    <task name="HybridDrawBegin" value="400" />
                    <task name="HybridDrawEnd" value="401" />
                    <task name="HybridInitializeBegin" value="402" />
                    <task name="HybridInitializeEnd" value="403" />
                    <task name="HybridDestroyBegin" value="404" />
                    <task name="HybridDestroyEnd" value="405" />
                    <task name="HybridSendDataBegin" value="406" />
                    <task name="HybridSendDataEnd" value="407" />
                    <task name="HybridClearD3DDeviceBegin" value="408" />
                    <task name="HybridClearD3DDeviceEnd" value="409" />
                    <task name="ManagedInputManipulationBegin" value="410" />
                    <task name="ManagedInputManipulationEnd" value="411" />
                    <task name="MSSGetSample" value="412" />
                    <task name="MSSSetupDecryptor" value="413" />
                </tasks>

                <channels>
                    <channel chid="Silverlight"
                        name="Silverlight"
                        type="Operational"
                        symbol="SL_ETW_CHANNEL"
                        enabled="true"
                        value="150" />
                </channels>

                <!-- Event Templates -->
                <templates>
                    <template tid="SimpleEvent">
                    </template>
                    <template tid="Boolean">
                        <data inType="win:UInt8" name="value"/>
                    </template>
                    <template tid="WM7VideoFrame">
                        <data inType="win:UInt16" name="FrameIndex"/>
                        <data inType="win:UInt32" name="TargetTimeMs"/>
                        <data inType="win:Int32" name="FramesReady"/>
                        <data inType="win:Int32" name="GpuFrames"/>
                    </template>
                    <template tid="HwRenderStop">
                    	<data inType="win:UInt32" name="FPS"/>
                    	<data inType="win:UInt32" name="CompositionID"/>
                    </template>
                    <template tid="WM7VideoDroppedFrames">
                        <data inType="win:UInt16" name="Count"/>
                        <data inType="win:UInt16" name="IndicesMask"/>
                    </template>
                    <template tid="WM7VideoRegisterVideoSurfaces">
                        <data inType="win:UInt32" name="Count"/>
                        <data inType="win:UInt32" name="FourCC"/>
                    </template>
                    <template tid="WM7VideoHasDirtySurfaces">
                        <data inType="win:UInt32" name="TargetTimeMs"/>
                        <data inType="win:UInt8" name="HasDirty"/>
                    </template>
                    <template tid="WM7VideoGetNextPresentTime">
                        <data inType="win:UInt32" name="NextTimeMs"/>
                        <data inType="win:Int32" name="FrameIndex"/>
                    </template>
                    <template tid="WM7VideoProviderAssert">
                        <data inType="win:UnicodeString" name="AssertExp"/>
                        <data inType="win:UnicodeString" name="File"/>
                        <data inType="win:Int32" name="Line"/>
                    </template>
                    <template tid="WM7VideoFramePresented">
                        <data inType="win:Int64" name="OriginalQPC"/>
                    </template>
                    <template tid="StoryboardBeginAction">
                        <data inType="win:Pointer" name="ObjectID" />
                        <data inType="win:Pointer" name="TargetObjectID" />
                    </template>
                    <template tid="ObjectIDPayloadEvent">
                        <data inType="win:Pointer" name="ObjectID" />
                    </template>
                    <template tid="StringPayloadEvent">
                        <data inType="win:UnicodeString" name="StringPayload" />
                    </template>
                    <template tid="CreateTextureEvent">
                    	<data inType="win:Pointer" name="ObjectID"/>
                    	<data inType="win:UInt32" name="Width"/>
                    	<data inType="win:UInt32" name="Height"/>
                    </template>
                    <template tid="DestroyTextureEvent">
                    	<data inType="win:Pointer" name="ObjectID"/>
                    </template>
                    <template tid="Float">
                        <data inType="win:Float" name="Value"/>
                    </template>
                    <template tid="NativeScrollViewerTransformEvent">
                        <data inType="win:Float" name="Initial"/>
                        <data inType="win:Float" name="Final"/>
                    </template>
                    <template tid="ProfilerSampleInfoEvent">
                        <data inType="win:UInt64" name="FirstPendingMessageEnd"/>
                        <data inType="win:UInt32" name="TotalCompletedMessageTime"/>
                        <data inType="win:UInt32" name="NMessages"/>                        
                        <data inType="win:UInt64" name="LastMessageStart"/>
                    </template>
                    <template tid="RawTouchInfo">
                        <data inType="win:Int32" name="PointX"/>
                        <data inType="win:Int32" name="PointY"/>
                    </template>
                    <template tid="GestureInfo">
                        <data inType="win:Pointer" name="Target"/>
                        <data inType="win:Pointer" name="Source"/>                        
                    </template>
                    <template tid="UInt32">
                        <data inType="win:UInt32" name="Value"/>
                    </template>                    
                    <template tid="XamlErrorEvent">
                        <data inType="win:UnicodeString" name="ResourcePath"/>
                        <data inType="win:UInt32" name="LineNumber"/>
                        <data inType="win:UInt32" name="LinePosition"/>
                        <data inType="win:UInt32" name="ErrorCode"/>
                        <data inType="win:UnicodeString" name="ErrorMessage"/>
                    </template>
                    <template tid="MSSGetSample">
                        <data name="CurrentTick" inType="win:UInt32" outType="xs:unsignedInt"/>
                    </template>
                    <template tid="MSSSetupDecryptorBegin">
                        <data name="CurrentTick" inType="win:UInt32" outType="xs:unsignedInt"/>
                    </template>
                    <template tid="MSSSetupDecryptorEnd">
                        <data name="CurrentTick" inType="win:UInt32" outType="xs:unsignedInt"/>
                    </template>
                </templates>

                <!-- Event Definitions -->
                <events>
                    <event value="1"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_FirstRasterEvent"
                        task="FirstRaster"
                        opcode="win:Info"
                        message="$(string.Event.FirstRaster.Info)"
                        />
                    <event value="2"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_RasterBeginEvent"
                        task="Raster"
                        opcode="win:Start"
                        message="$(string.Event.Raster.Start)"
                        />
                    <event value="3"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="Raster"
                        opcode="win:Stop"
                        symbol="SL_RasterEndEvent"
                        message="$(string.Event.Raster.Stop)"
                        />
                    <event value="4"
                        level="win:Informational"
                        template="StringPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_ParseBeginEvent"
                        task="Parse"
                        opcode="win:Start"
                        message="$(string.Event.Parse.Start)"
                        />
                    <event value="5"
                        level="win:Informational"
                        template="StringPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_ParseEndEvent"
                        task="Parse"
                        opcode="win:Stop"
                        message="$(string.Event.Parse.Stop)"
                        />
                    <event value="6"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MediaRenderCallbackEvent"
                        task="MediaRenderCallback"
                        opcode="win:Info"
                        message="$(string.Event.MediaRenderCallback.Info)"
                        />
                    <event value="7"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_PresentBeginEvent"
                        task="Present"
                        opcode="win:Start"
                        message="$(string.Event.Present.Start)"
                        />
                    <event value="8"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_PresentEndEvent"
                        task="Present"
                        opcode="win:Stop"
                        message="$(string.Event.Present.Stop)"
                        />
                    <event value="9"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MediaDrawFrameEvent"
                        task="MediaDrawFrame"
                        opcode="win:Info"
                        message="$(string.Event.MediaDrawFrame.Info)"
                        />
                    <event value="10"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MediaBufferingBeginEvent"
                        task="MediaBuffering"
                        opcode="win:Start"
                        message="$(string.Event.MediaBuffering.Start)"
                        />
                    <event value="11"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MediaBufferingEndEvent"
                        task="MediaBuffering"
                        opcode="win:Stop"
                        message="$(string.Event.MediaBuffering.Stop)"
                        />
                    <event value="12"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MediaDroppedFrameEvent"
                        task="MediaDroppedFrame"
                        opcode="win:Info"
                        message="$(string.Event.MediaDroppedFrame.Info)"
                        />
                    <event value="13"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_InformationEvent"
                        task="Information"
                        opcode="win:Info"
                        message="$(string.Event.Information.Info)"
                        />
                    <event value="14"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ClrStartupBeginEvent"
                        task="CLRStartup"
                        opcode="win:Start"
                        message="$(string.Event.CLRStartup.Start)"
                        />
                    <event value="15"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ClrStartupEndEvent"
                        task="CLRStartup"
                        opcode="win:Stop"
                        message="$(string.Event.CLRStartup.Stop)"
                        />
                    <event value="16"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ClrShutdownBeginEvent"
                        task="CLRShutdown"
                        opcode="win:Start"
                        message="$(string.Event.CLRShutdown.Start)"
                        />
                    <event value="17"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ClrShutdownEndEvent"
                        task="CLRShutdown"
                        opcode="win:Stop"
                        message="$(string.Event.CLRShutdown.Stop)"
                        />
                    <event value="18"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ClrConvertValueEvent"
                        task="CLRConvertValue"
                        opcode="win:Info"
                        message="$(string.Event.CLRConvertValue.Info)"
                        />
                    <event value="19"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ClrObjectLifetimeEvent"
                        task="CLRObjectLifetime"
                        opcode="win:Info"
                        message="$(string.Event.CLRObjectLifetime.Info)"
                        />
                    <event value="20"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ControlShutdownBeginEvent"
                        task="ControlShutdown"
                        opcode="win:Start"
                        message="$(string.Event.ControlShutdown.Start)"
                        />
                    <event value="21"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ControlShutdownEndEvent"
                        task="ControlShutdown"
                        opcode="win:Stop"
                        message="$(string.Event.ControlShutdown.Stop)"
                        />
                    <event value="22"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ControlStartupEvent"
                        task="ControlStartup"
                        opcode="win:Info"
                        message="$(string.Event.ControlStartup.Info)"
                        />
                    <event value="23"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ControlInPlaceBeginEvent"
                        task="ControlInPlaceDeact"
                        opcode="win:Start"
                        message="$(string.Event.ControlInPlaceDeact.Start)"
                        />
                    <event value="24"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ControlInPlaceEndEvent"
                        task="ControlInPlaceDeact"
                        opcode="win:Stop"
                        message="$(string.Event.ControlInPlaceDeact.Stop)"
                        />
                    <event value="25"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_PutRootVisualBeginEvent"
                        task="PutRootVisual"
                        opcode="win:Start"
                        message="$(string.Event.PutRootVisual.Start)"
                        />
                    <event value="26"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_PutRootVisualEndEvent"
                        task="PutRootVisual"
                        opcode="win:Stop"
                        message="$(string.Event.PutRootVisual.Stop)"
                        />
                    <event value="27"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_NpCtrlLoadDllEvent"
                        task="LoadNpctrlDll"
                        opcode="win:Info"
                        message="$(string.Event.LoadNpctrlDll.Info)"
                        />
                    <event value="28"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_CoreDrawBeginEvent"
                        task="Draw"
                        opcode="win:Start"
                        message="$(string.Event.Draw.Start)"
                        />
                    <event value="29"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_CoreDrawEndEvent"
                        task="Draw"
                        opcode="win:Stop"
                        message="$(string.Event.Draw.Stop)"
                        />
                    <event value="30"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_WinRenderEvent"
                        task="WinRender"
                        opcode="win:Info"
                        message="$(string.Event.WinRender.Info)"
                        />
                    <event value="31"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_PutSourceBeginEvent"
                        task="PutSource"
                        opcode="win:Start"
                        message="$(string.Event.PutSource.Start)"
                        />
                    <event value="32"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_PutSourceEndEvent"
                        task="PutSource"
                        opcode="win:Stop"
                        message="$(string.Event.PutSource.Stop)"
                        />
                    <event value="33"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_SetValueManagedBeginEvent"
                        task="SetValueManaged"
                        opcode="win:Start"
                        message="$(string.Event.SetValueManaged.Start)"
                        />
                    <event value="34"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_SetValueManagedEndEvent"
                        task="SetValueManaged"
                        opcode="win:Stop"
                        message="$(string.Event.SetValueManaged.Stop)"
                        />
                    <event value="35"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_SetValueNativeBeginEvent"
                        task="SetValueNative"
                        opcode="win:Start"
                        message="$(string.Event.SetValueNative.Start)"
                        />
                    <event value="36"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_SetValueNativeEndEvent"
                        task="SetValueNative"
                        opcode="win:Stop"
                        message="$(string.Event.SetValueNative.Stop)"
                        />
                    <event value="37"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DownloadRequestEvent"
                        task="PutSource"
                        opcode="win:Info"
                        message="$(string.Event.PutSource.Info)"
                        />
                    <event value="38"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MediaSampleAddedEvent"
                        task="MediaSampleAdded"
                        opcode="win:Info"
                        message="$(string.Event.MediaSampleAdded.Info)"
                        />
                    <event value="39"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_SeaDragonDecodeEvent"
                        task="SeadragonDecode"
                        opcode="win:Info"
                        message="$(string.Event.SeadragonDecode.Info)"
                        />
                    <event value="40"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_SeaDragonTileDownloadedEvent"
                        task="SeadragonTileDownloaded"
                        opcode="win:Info"
                        message="$(string.Event.SeadragonTileDownloaded.Info)"
                        />
                    <event value="41"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_SeaDragonRasterizeFrameEvent"
                        task="SeadragonRasterizeFrame"
                        opcode="win:Info"
                        message="$(string.Event.SeadragonRasterizeFrame.Info)"
                        />
                    <event value="42"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_SeaDragonBrushGenerateEvent"
                        task="SeadragonBrushGenerate"
                        opcode="win:Info"
                        message="$(string.Event.SeadragonBrushGenerate.Info)"
                        />
                    <event value="43"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_SeaDragonImageResolvedEvent"
                        task="SeadragonImageResolved"
                        opcode="win:Info"
                        message="$(string.Event.SeadragonImageResolved.Info)"
                        />
                    <event value="44"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ApplicationStartupEvent"
                        task="ApplicationStartup"
                        opcode="win:Info"
                        message="$(string.Event.ApplicationStartup.Info)"
                        />
                    <event value="45"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DrmIndivBeginEvent"
                        task="DRMIndiv"
                        opcode="win:Start"
                        message="$(string.Event.DRMIndiv.Start)"
                        />
                    <event value="46"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DrmIndivEndEvent"
                        task="DRMIndiv"
                        opcode="win:Stop"
                        message="$(string.Event.DRMIndiv.Stop)"
                        />
                    <event value="47"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DrmLicenseAquisitionBeginEvent"
                        task="DRMLicenseAcquisition"
                        opcode="win:Start"
                        message="$(string.Event.DRMLicenseAcquisition.Start)"
                        />
                    <event value="48"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DrmLicenseAquisitionEndEvent"
                        task="DRMLicenseAcquisition"
                        opcode="win:Stop"
                        message="$(string.Event.DRMLicenseAcquisition.Stop)"
                        />
                    <event value="49"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MediaRenderAudioEvent"
                        task="MediaRenderAudio"
                        opcode="win:Info"
                        message="$(string.Event.MediaRenderAudio.Info)"
                        />
                    <event value="50"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MediaLogRequestedEvent"
                        task="MediaLogRequest"
                        opcode="win:Info"
                        message="$(string.Event.MediaLogRequest.Info)"
                        />
                    <event value="51"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DatabindingBeginEvent"
                        task="Databinding"
                        opcode="win:Start"
                        message="$(string.Event.Databinding.Start)"
                        />
                    <event value="52"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DatabindingEndEvent"
                        task="Databinding"
                        opcode="win:Stop"
                        message="$(string.Event.Databinding.Stop)"
                        />
                    <event value="53"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DataGridScrollEvent"
                        task="ExtendedDatagridScroll"
                        opcode="win:Info"
                        message="$(string.Event.ExtendedDatagridScroll.Info)"
                        />
                    <event value="54"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_AudioSampleRequestedBeginEvent"
                        task="AudioSampleRequest"
                        opcode="win:Start"
                        message="$(string.Event.AudioSampleRequest.Start)"
                        />
                    <event value="55"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_AudioSampleRequestedEndEvent"
                        task="AudioSampleRequest"
                        opcode="win:Stop"
                        message="$(string.Event.AudioSampleRequest.Stop)"
                        />
                    <event value="56"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_VideoSampleRequestedBeginEvent"
                        task="VideoSampleRequest"
                        opcode="win:Start"
                        message="$(string.Event.VideoSampleRequest.Start)"
                        />
                    <event value="57"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_VideoSampleRequestedEndEvent"
                        task="VideoSampleRequest"
                        opcode="win:Stop"
                        message="$(string.Event.VideoSampleRequest.Stop)"
                        />
                    <event value="58"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_VideoCurrectAudioTimestampEvent"
                        task="CurrentAudioTimestamp"
                        opcode="win:Info"
                        message="$(string.Event.CurrentAudioTimestamp.Info)"
                        />
                    <event value="59"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_VideoQueueSizeEvent"
                        task="VideoQueueSize"
                        opcode="win:Info"
                        message="$(string.Event.VideoQueueSize.Info)"
                        />
                    <event value="60"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_VideoTimeStampEvent"
                        task="CurrentVideoTimestamp"
                        opcode="win:Info"
                        message="$(string.Event.CurrentVideoTimestamp.Info)"
                        />
                    <event value="61"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_AudioLatencyEvent"
                        task="AudioLatency"
                        opcode="win:Info"
                        message="$(string.Event.AudioLatency.Info)"
                        />
                    <event value="62"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ImageDecodeJpegBeginEvent"
                        task="DecodeJpg"
                        opcode="win:Start"
                        message="$(string.Event.DecodeJpg.Start)"
                        />
                    <event value="63"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ImageDecodeJpegEndEvent"
                        task="DecodeJpg"
                        opcode="win:Stop"
                        message="$(string.Event.DecodeJpg.Stop)"
                        />
                    <event value="64"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ImageDecodeBeginEvent"
                        task="ImageDecode"
                        opcode="win:Start"
                        message="$(string.Event.ImageDecode.Start)"
                        />
                    <event value="65"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ImageDecodeEndEvent"
                        task="ImageDecode"
                        opcode="win:Stop"
                        message="$(string.Event.ImageDecode.Stop)"
                        />
                    <event value="66"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MouseDownEvent"
                        task="MouseDown"
                        opcode="win:Info"
                        message="$(string.Event.MouseDown.Info)"
                        />
                    <event value="67"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MouseUpEvent"
                        task="MouseUp"
                        opcode="win:Info"
                        message="$(string.Event.MouseUp.Info)"
                        />
                    <event value="68"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_LayoutBeginEvent"
                        task="Layout"
                        opcode="win:Start"
                        message="$(string.Event.Layout.Start)"
                        />
                    <event value="69"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_LayoutEndEvent"
                        task="Layout"
                        opcode="win:Stop"
                        message="$(string.Event.Layout.Stop)"
                        />
                    <event value="70"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_RenderBeginEvent"
                        task="Render"
                        opcode="win:Start"
                        message="$(string.Event.Render.Start)"
                        />
                    <event value="71"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_RenderEndEvent"
                        task="Render"
                        opcode="win:Stop"
                        message="$(string.Event.Render.Stop)"
                        />
                    <event value="72"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DCompileBeginEvent"
                        task="D3DCompile"
                        opcode="win:Start"
                        message="$(string.Event.D3DCompile.Start)"
                        />
                    <event value="73"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DCompileEndEvent"
                        task="D3DCompile"
                        opcode="win:Stop"
                        message="$(string.Event.D3DCompile.Stop)"
                                />
                    <event value="74"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HwRenderBeginEvent"
                        task="HwRender"
                        opcode="win:Start"
                        message="$(string.Event.HwRender.Start)"
                        />
                    <event value="75"
                        level="win:Informational"
                        template="HwRenderStop"
                        channel="Silverlight"
                        symbol="SL_HwRenderEndEvent"
                        task="HwRender"
                        opcode="win:Stop"
                        message="$(string.Event.HwRender.Stop)"
                                />
                    <event value="76"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HwPresentBeginEvent"
                        task="HwPresent"
                        opcode="win:Start"
                        message="$(string.Event.HwPresent.Start)"
                        />
                    <event value="77"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HwPresentEndEvent"
                        task="HwPresent"
                        opcode="win:Stop"
                        message="$(string.Event.HwPresent.Stop)"
                                />
                    <event value="78"
                        level="win:Informational"
                        template="StringPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_ScriptCallbackBeginEvent"
                        task="ScriptCallback"
                        opcode="win:Start"
                        message="$(string.Event.ScriptCallback.Start)"
                        />
                    <event value="79"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ScriptCallbackEndEvent"
                        task="ScriptCallback"
                        opcode="win:Stop"
                        message="$(string.Event.ScriptCallback.Stop)"
                                />
                    <event value="80"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_CLRCallbackBeginEvent"
                        task="CLRCallback"
                        opcode="win:Start"
                        message="$(string.Event.CLRCallback.Start)"
                        />
                    <event value="81"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_CLRCallbackEndEvent"
                        task="CLRCallback"
                        opcode="win:Stop"
                        message="$(string.Event.CLRCallback.Stop)"
                        />
                    <event value="82"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_TickManagerPauseEvent"
                        task="TickManagerPause"
                        opcode="win:Info"
                        message="$(string.Event.TickManagerPause.Info)"
                        />
                    <event value="83"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_TickManagerResumeEvent"
                        task="TickManagerResume"
                        opcode="win:Info"
                        message="$(string.Event.TickManagerResume.Info)"
                        />
                    <event value="84"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_CompositorPauseEvent"
                        task="CompositorPause"
                        opcode="win:Info"
                        message="$(string.Event.CompositorPause.Info)"
                        />
                    <event value="85"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_CompositorResumeEvent"
                        task="CompositorResume"
                        opcode="win:Info"
                        message="$(string.Event.CompositorResume.Info)"
                        />
                    <event value="86"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_TickPostEvent"
                        task="TickPost"
                        opcode="win:Info"
                        message="$(string.Event.TickPost.Info)"
                        />
                    <event value="87"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DispatcherTimerStartEvent"
                        task="DispatcherTimerStart"
                        opcode="win:Info"
                        message="$(string.Event.DispatcherTimerStart.Info)"
                        />
                    <event value="88"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DispatcherTimerStopEvent"
                        task="DispatcherTimerStop"
                        opcode="win:Info"
                        message="$(string.Event.DispatcherTimerStop.Info)"
                        />
                    <event value="89"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_TickProcessBeginEvent"
                        task="TickProcess"
                        opcode="win:Start"
                        message="$(string.Event.TickProcess.Start)"
                        />
                    <event value="90"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_TickProcessEndEvent"
                        task="TickProcess"
                        opcode="win:Stop"
                        message="$(string.Event.TickProcess.Stop)"
                                />
                    <event value="91"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_TickDelayedForInputEvent"
                        task="TickDelayedForInput"
                        opcode="win:Info"
                        message="$(string.Event.TickDelayedForInput.Info)"
                                />
                    <event value="92"
                        level="win:Informational"
                        template="WM7VideoFrame"
                        channel="Silverlight"
                        symbol="SL_WM7VideoFrameReadyEvent"
                        task="WM7VideoFrameReady"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoFrameReady.Info)"
                                />
                    <event value="93"
                        level="win:Informational"
                        template="WM7VideoFrame"
                        channel="Silverlight"
                        symbol="SL_WM7VideoFrameReleasedEvent"
                        task="WM7VideoFrameReleased"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoFrameReleased.Info)"
                                />
                    <event value="94"
                        level="win:Informational"
                        template="WM7VideoFrame"
                        channel="Silverlight"
                        symbol="SL_WM7VideoFrameAdvanceEvent"
                        task="WM7VideoFrameAdvance"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoFrameAdvance.Info)"
                                />
                    <event value="95"
                        level="win:Informational"
                        template="WM7VideoDroppedFrames"
                        channel="Silverlight"
                        symbol="SL_WM7VideoDroppedFramesEvent"
                        task="WM7VideoDroppedFrames"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoDroppedFrames.Info)"
                                />
                    <event value="96"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MediaDrawFrameOldOrEmptyEvent"
                        task="MediaDrawFrameOldOrEmpty"
                        opcode="win:Info"
                        message="$(string.Event.MediaDrawFrameOldOrEmpty.Info)"
                        />
                    <event value="97"
                          level="win:Verbose"
                          template="SimpleEvent"
                          channel="Silverlight"
                          symbol="SL_Seadragon4DownloadBeginEvent"
                          task="Seadragon4Download"
                          opcode="win:Start"
                          message="$(string.Event.Seadragon4Download.Start)"
                          />
                    <event value="98"
                          level="win:Verbose"
                          template="SimpleEvent"
                          channel="Silverlight"
                          symbol="SL_Seadragon4DownloadEndEvent"
                          task="Seadragon4Download"
                          opcode="win:Stop"
                          message="$(string.Event.Seadragon4Download.Stop)"
                          />
                    <event value="99" 
                        level="win:Informational" 
                        template="SimpleEvent" 
                        channel="Silverlight" 
                        symbol="SL_SplashScreenDrawnEvent" 
                        task="SplashScreenDrawn" 
                        opcode="win:Info" 
                        message="$(string.Event.SplashScreenDrawn.Info)" 
                        />
                    <event value="100" 
                        level="win:Informational" 
                        template="SimpleEvent" 
                        channel="Silverlight" 
                        symbol="SL_CompositorCreationBeginEvent" 
                        task="CompositorCreation" 
                        opcode="win:Start" 
                        message="$(string.Event.CompositorCreation.Start)" 
                        />
                    <event value="101" 
                        level="win:Informational" 
                        template="SimpleEvent" 
                        channel="Silverlight" 
                        symbol="SL_CompositorCreationEndEvent" 
                        task="CompositorCreation" 
                        opcode="win:Stop" 
                        message="$(string.Event.CompositorCreation.Stop)" 
                        />
                    <event value="102" 
                        level="win:Informational" 
                        template="SimpleEvent" 
                        channel="Silverlight" 
                        symbol="SL_ControlInitializeBeginEvent" 
                        task="ControlInitialize" 
                        opcode="win:Start" 
                        message="$(string.Event.ControlInitialize.Start)" 
                        />
                    <event value="103" 
                        level="win:Informational" 
                        template="SimpleEvent" 
                        channel="Silverlight" 
                        symbol="SL_ControlInitializeEndEvent" 
                        task="ControlInitialize" 
                        opcode="win:Stop" 
                        message="$(string.Event.ControlInitialize.Stop)" 
                        />
                    <event value="104"
                            level="win:Verbose"
                            template="SimpleEvent"
                            channel="Silverlight"
                            symbol="SL_WM7GestureBeginEvent"
                            task="WM7Gesture"
                            opcode="win:Start"
                            message="$(string.Event.WM7Gesture.Start)"
                            />
                    <event value="105"
                            level="win:Verbose"
                            template="SimpleEvent"
                            channel="Silverlight"
                            symbol="SL_WM7GestureEndEvent"
                            task="WM7Gesture"
                            opcode="win:Stop"
                            message="$(string.Event.WM7Gesture.Stop)"
                            />
                    <event value="106"
                            level="win:Verbose"
                            template="SimpleEvent"
                            channel="Silverlight"
                            symbol="SL_WM7ProcessGestureBeginEvent"
                            task="WM7ProcessGesture"
                            opcode="win:Start"
                            message="$(string.Event.WM7ProcessGesture.Start)"
                            />
                    <event value="107"
                            level="win:Verbose"
                            template="SimpleEvent"
                            channel="Silverlight"
                            symbol="SL_WM7ProcessGestureEndEvent"
                            task="WM7ProcessGesture"
                            opcode="win:Stop"
                            message="$(string.Event.WM7ProcessGesture.Stop)"
                            />
                    <event value="108"
                            level="win:Informational"
                            template="SimpleEvent"
                            channel="Silverlight"
                            symbol="SL_WM7GestureMoreDataEvent"
                            task="WM7GestureMoreData"
                            opcode="win:Info"
                            message="$(string.Event.WM7GestureMoreData.Info)"
                            />
                    <event value="114"
                        level="win:Informational"
                        template="WM7VideoFrame"
                        channel="Silverlight"
                        symbol="SL_WM7VideoFrameAdvanceToGpuEvent"
                        task="WM7VideoFrameAdvanceToGpu"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoFrameAdvanceToGpu.Info)"
                                />
                    <event value="115"
                        level="win:Informational"
                        template="WM7VideoRegisterVideoSurfaces"
                        channel="Silverlight"
                        symbol="SL_WM7VideoRegisterVideoSurfacesEvent"
                        task="WM7VideoRegisterVideoSurfaces"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoRegisterVideoSurfaces.Info)"
                                />
                    <event value="116"
                        level="win:Informational"
                        template="WM7VideoHasDirtySurfaces"
                        channel="Silverlight"
                        symbol="SL_WM7VideoHasDirtySurfacesEvent"
                        task="WM7VideoHasDirtySurfaces"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoHasDirtySurfaces.Info)"
                                />
                    <event value="117"
                        level="win:Informational"
                        template="WM7VideoGetNextPresentTime"
                        channel="Silverlight"
                        symbol="SL_WM7VideoGetNextPresentTimeEvent"
                        task="WM7VideoGetNextPresentTime"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoGetNextPresentTime.Info)"
                                />
                    <event value="118"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_WM7VideoClockStartEvent"
                        task="WM7VideoClockStart"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoClockStart.Info)"
                                />
                    <event value="119"
                        level="win:Informational"
                        template="Boolean"
                        channel="Silverlight"
                        symbol="SL_WM7VideoClockStopEvent"
                        task="WM7VideoClockStop"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoClockStop.Info)"
                                />
                    <event value="120"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_WM7VideoProviderStarvingEvent"
                        task="WM7VideoProviderStarving"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoProviderStarving.Info)"
                                />
                    <event value="121"
                        level="win:Informational"
                        template="WM7VideoProviderAssert"
                        channel="Silverlight"
                        symbol="SL_WM7VideoProviderAssertEvent"
                        task="WM7VideoProviderAssert"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoProviderAssert.Info)"
                                />
                    <event value="122"
                        level="win:Informational"
                        template="WM7VideoFramePresented"
                        channel="Silverlight"
                        symbol="SL_WM7VideoFramePresentedEvent"
                        task="WM7VideoFramePresentedEvent"
                        opcode="win:Info"
                        message="$(string.Event.WM7VideoFramePresentedEvent.Info)"
                                />
                    <event value="123"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ParseObjectElementBeginEvent"
                        task="ParseObjectElement"
                        opcode="win:Start"
                        message="$(string.Event.ParseObjectElement.Start)"
                        />
                    <event value="124"
                        level="win:Verbose"
                        template="ObjectIDPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_ParseObjectElementEndEvent"
                        task="ParseObjectElement"
                        opcode="win:Stop"
                        message="$(string.Event.ParseObjectElement.Stop)"
                        />
                    <event value="125"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ParsePropertyElementBeginEvent"
                        task="ParsePropertyElement"
                        opcode="win:Start"
                        message="$(string.Event.ParsePropertyElement.Start)"
                        />
                    <event value="126"
                        level="win:Verbose"
                        template="StringPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_ParsePropertyElementEndEvent"
                        task="ParsePropertyElement"
                        opcode="win:Stop"
                        message="$(string.Event.ParsePropertyElement.Stop)"
                        />
                    <event value="127"
                        level="win:Informational"
                        template="StoryboardBeginAction"
                        channel="Silverlight"
                        symbol="SL_StoryboardBeginEvent"
                        task="StoryboardBegin"
                        opcode="win:Info"
                        message="$(string.Event.StoryboardBegin.Info)"
                        />
                    <event value="128"
                        level="win:Informational"
                        template="ObjectIDPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_StoryboardPauseEvent"
                        task="StoryboardPause"
                        opcode="win:Info"
                        message="$(string.Event.StoryboardPause.Info)"
                        />
                    <event value="129"
                        level="win:Informational"
                        template="ObjectIDPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_StoryboardResumeEvent"
                        task="StoryboardResume"
                        opcode="win:Info"
                        message="$(string.Event.StoryboardResume.Info)"
                        />
                    <event value="130"
                        level="win:Informational"
                        template="ObjectIDPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_StoryboardStopEvent"
                        task="StoryboardStop"
                        opcode="win:Info"
                        message="$(string.Event.StoryboardStop.Info)"
                        />
                    <event value="131"
                        level="win:Informational"
                        template="ObjectIDPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_StoryboardEndEvent"
                        task="StoryboardEnd"
                        opcode="win:Info"
                        message="$(string.Event.StoryboardEnd.Info)"
                        />
                    <event value="132"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_PerFrameCallbackBeginEvent"
                        task="PerFrameCallback"
                        opcode="win:Start"
                        message="$(string.Event.PerFrameCallback.Start)"
                        />
                    <event value="133"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_PerFrameCallbackEndEvent"
                        task="PerFrameCallback"
                        opcode="win:Stop"
                        message="$(string.Event.PerFrameCallback.Stop)"
                        />
                    <event value="134"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ApplicationStartingEvent"
                        task="ApplicationStarting"
                        opcode="win:Info"
                        message="$(string.Event.ApplicationStarting.Info)"
                        />
                    <event value="135"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ApplicationStartedEvent"
                        task="ApplicationStarted"
                        opcode="win:Info"
                        message="$(string.Event.ApplicationStarted.Info)"
                        />
                    <event value="136"
                        level="win:Informational"
                        template="StringPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_ApplicationLoadComponentBeginEvent"
                        task="ApplicationLoadComponent"
                        opcode="win:Start"
                        message="$(string.Event.ApplicationLoadComponent.Start)"
                        />
                    <event value="137"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ApplicationLoadComponentEndEvent"
                        task="ApplicationLoadComponent"
                        opcode="win:Stop"
                        message="$(string.Event.ApplicationLoadComponent.Stop)"
                        />
                    <event value="138"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ApplicationConstructedEvent"
                        task="ApplicationConstructed"
                        opcode="win:Info"
                        message="$(string.Event.ApplicationConstructed.Info)"
                        />
                    <event value="139"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_NewRenderListBeginEvent"
                        task="NewRenderList"
                        opcode="win:Start"
                        message="$(string.Event.NewRenderList.Start)"
                        />
                    <event value="140"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_NewRenderListEndEvent"
                        task="NewRenderList"
                        opcode="win:Stop"
                        message="$(string.Event.NewRenderList.Stop)"
                        />
                    <event value="141"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_LoadAppManifestBeginEvent"
                        task="LoadAppManifest"
                        opcode="win:Start"
                        message="$(string.Event.LoadAppManifest.Start)"
                        />
                    <event value="142"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_LoadAppManifestEndEvent"
                        task="LoadAppManifest"
                        opcode="win:Stop"
                        message="$(string.Event.LoadAppManifest.Stop)"
                        />
                    <event value="143"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_FirstUserDrawEvent"
                        task="FirstUserDraw"
                        opcode="win:Info"
                        message="$(string.Event.FirstUserDraw.Info)"
                        />
                    <event value="144"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MeasureBeginEvent"
                        task="Measure"
                        opcode="win:Start"
                        message="$(string.Event.Measure.Start)"
                        />
                    <event value="145"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MeasureEndEvent"
                        task="Measure"
                        opcode="win:Stop"
                        message="$(string.Event.Measure.Stop)"
                        />
                    <event value="146"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ArrangeBeginEvent"
                        task="Arrange"
                        opcode="win:Start"
                        message="$(string.Event.Arrange.Start)"
                        />
                    <event value="147"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ArrangeEndEvent"
                        task="Arrange"
                        opcode="win:Stop"
                        message="$(string.Event.Arrange.Stop)"
                        />
                    <event value="148"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_CoreServicesCreateBeginEvent"
                        task="CoreServicesCreate"
                        opcode="win:Start"
                        message="$(string.Event.CoreServicesCreate.Start)"
                        />
                    <event value="149"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_CoreServicesCreateEndEvent"
                        task="CoreServicesCreate"
                        opcode="win:Stop"
                        message="$(string.Event.CoreServicesCreate.Stop)"
                        />
                    <event value="150"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_GraphicsDeviceClearBeginEvent"
                        task="GraphicsDeviceClear"
                        opcode="win:Start"
                        message="$(string.Event.GraphicsDeviceClear.Start)"
                        />
                    <event value="151"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_GraphicsDeviceClearEndEvent"
                        task="GraphicsDeviceClear"
                        opcode="win:Stop"
                        message="$(string.Event.GraphicsDeviceClear.Stop)"
                        />
                    <event value="152"
                        level="win:Informational"
                        template="CreateTextureEvent"
                        channel="Silverlight"
                        symbol="SL_CreateTextureEvent"
                        task="CreateTexture"
                        opcode="win:Info"
                        message="$(string.Event.CreateTexture.Info)"
                        />
                    <event value="153"
                        level="win:Informational"
                        template="DestroyTextureEvent"
                        channel="Silverlight"
                        symbol="SL_DestroyTextureEvent"
                        task="DestroyTexture"
                        opcode="win:Info"
                        message="$(string.Event.DestroyTexture.Info)"
                        />
                    <event value="154"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DirectManipulationMessageBeginEvent"
                        task="DirectManipulationMessage"
                        opcode="win:Start"
                        message="$(string.Event.DirectManipulationMessage.Start)"
                        />
                    <event value="155"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DirectManipulationMessageEndEvent"
                        task="DirectManipulationMessage"
                        opcode="win:Stop"
                        message="$(string.Event.DirectManipulationMessage.Stop)"
                        />
                    <event value="156"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DirectManpultationServerBeginEvent"
                        task="DirectManpultationServer"
                        opcode="win:Start"
                        message="$(string.Event.DirectManpultationServer.Start)"
                        />
                    <event value="157"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DirectManpultationServerEndEvent"
                        task="DirectManpultationServer"
                        opcode="win:Stop"
                        message="$(string.Event.DirectManpultationServer.Stop)"
                        />
                    <event value="158"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DirectManipulationClientBeginEvent"
                        task="DirectManipulationClient"
                        opcode="win:Start"
                        message="$(string.Event.DirectManipulationClient.Start)"
                        />
                    <event value="159"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DirectManipulationClientEndEvent"
                        task="DirectManipulationStarted"
                        opcode="win:Stop"
                        message="$(string.Event.DirectManipulationStarted.Stop)"
                        />
                    <event value="160"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DirectManipulationStarted"
                        task="DirectManipulationStarted"
                        opcode="win:Start"
                        message="$(string.Event.DirectManipulationStarted.Start)"
                        />
                    <event value="161"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DirectManipulationDelta"
                        task="DirectManipulationDelta"
                        opcode="win:Info"
                        message="$(string.Event.DirectManipulationDelta.Info)"
                        />
                    <event value="162"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DirectManipulationCompleted"
                        task="DirectManipulationCompleted"
                        opcode="win:Stop"
                        message="$(string.Event.DirectManipulationCompleted.Stop)"
                        />
                    <event value="163"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DCreateBeginEvent"
                        task="D3DCreate"
                        opcode="win:Start"
                        message="$(string.Event.D3DCreate.Start)"
                        />
                    <event value="164"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DCreate"
                        opcode="win:Stop"
                        symbol="SL_D3DCreateEndEvent"
                        message="$(string.Event.D3DCreate.Stop)"
                        />
                    <event value="165"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DInitializeDeviceBeginEvent"
                        task="D3DInitializeDevice"
                        opcode="win:Start"
                        message="$(string.Event.D3DInitializeDevice.Start)"
                        />
                    <event value="166"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DInitializeDevice"
                        opcode="win:Stop"
                        symbol="SL_D3DInitializeDeviceEndEvent"
                        message="$(string.Event.D3DInitializeDevice.Stop)"
                        />
                    <event value="167"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DInitializeDxBeginEvent"
                        task="D3DInitializeDx"
                        opcode="win:Start"
                        message="$(string.Event.D3DInitializeDx.Start)"
                        />
                    <event value="168"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DInitializeDx"
                        opcode="win:Stop"
                        symbol="SL_D3DInitializeDxEndEvent"
                        message="$(string.Event.D3DInitializeDx.Stop)"
                        />
                    <event value="169"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DReleaseDxBeginEvent"
                        task="D3DReleaseDx"
                        opcode="win:Start"
                        message="$(string.Event.D3DReleaseDx.Start)"
                        />
                    <event value="170"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DReleaseDx"
                        opcode="win:Stop"
                        symbol="SL_D3DReleaseDxEndEvent"
                        message="$(string.Event.D3DReleaseDx.Stop)"
                        />
                    <event value="171"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DResizeBeginEvent"
                        task="D3DResize"
                        opcode="win:Start"
                        message="$(string.Event.D3DResize.Start)"
                        />
                    <event value="172"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DResize"
                        opcode="win:Stop"
                        symbol="SL_D3DResizeEndEvent"
                        message="$(string.Event.D3DResize.Stop)"
                        />
                    <event value="173"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DCreateTextureBeginEvent"
                        task="D3DCreateTexture"
                        opcode="win:Start"
                        message="$(string.Event.D3DCreateTexture.Start)"
                        />
                    <event value="174"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DCreateTexture"
                        opcode="win:Stop"
                        symbol="SL_D3DCreateTextureEndEvent"
                        message="$(string.Event.D3DCreateTexture.Stop)"
                        />
                    <event value="175"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DCreateTextureFromExistingTextureBeginEvent"
                        task="D3DCreateTextureFromExistingTexture"
                        opcode="win:Start"
                        message="$(string.Event.D3DCreateTextureFromExistingTexture.Start)"
                        />
                    <event value="176"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DCreateTextureFromExistingTexture"
                        opcode="win:Stop"
                        symbol="SL_D3DCreateTextureFromExistingTextureEndEvent"
                        message="$(string.Event.D3DCreateTextureFromExistingTexture.Stop)"
                        />
                    <event value="177"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DSetTransformsBeginEvent"
                        task="D3DSetTransforms"
                        opcode="win:Start"
                        message="$(string.Event.D3DSetTransforms.Start)"
                        />
                    <event value="178"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DSetTransforms"
                        opcode="win:Stop"
                        symbol="SL_D3DSetTransformsEndEvent"
                        message="$(string.Event.D3DSetTransforms.Stop)"
                        />
                    <event value="179"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DDrawTriangleStripBeginEvent"
                        task="D3DDrawTriangleStrip"
                        opcode="win:Start"
                        message="$(string.Event.D3DDrawTriangleStrip.Start)"
                        />
                    <event value="180"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DDrawTriangleStrip"
                        opcode="win:Stop"
                        symbol="SL_D3DDrawTriangleStripEndEvent"
                        message="$(string.Event.D3DDrawTriangleStrip.Stop)"
                        />
                    <event value="181"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DDrawIndexedTriangleStripBeginEvent"
                        task="D3DDrawIndexedTriangleStrip"
                        opcode="win:Start"
                        message="$(string.Event.D3DDrawIndexedTriangleStrip.Start)"
                        />
                    <event value="182"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DDrawIndexedTriangleStrip"
                        opcode="win:Stop"
                        symbol="SL_D3DDrawIndexedTriangleStripEndEvent"
                        message="$(string.Event.D3DDrawIndexedTriangleStrip.Stop)"
                        />
                    <event value="183"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DSetTextureBeginEvent"
                        task="D3DSetTexture"
                        opcode="win:Start"
                        message="$(string.Event.D3DSetTexture.Start)"
                        />
                    <event value="184"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DSetTexture"
                        opcode="win:Stop"
                        symbol="SL_D3DSetTextureEndEvent"
                        message="$(string.Event.D3DSetTexture.Stop)"
                        />
                    <event value="185"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DSetRenderTargetBeginEvent"
                        task="D3DSetRenderTarget"
                        opcode="win:Start"
                        message="$(string.Event.D3DSetRenderTarget.Start)"
                        />
                    <event value="186"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DSetRenderTarget"
                        opcode="win:Stop"
                        symbol="SL_D3DSetRenderTargetEndEvent"
                        message="$(string.Event.D3DSetRenderTarget.Stop)"
                        />
                    <event value="187"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DClearBeginEvent"
                        task="D3DClear"
                        opcode="win:Start"
                        message="$(string.Event.D3DClear.Start)"
                        />
                    <event value="188"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DClear"
                        opcode="win:Stop"
                        symbol="SL_D3DClearEndEvent"
                        message="$(string.Event.D3DClear.Stop)"
                        />
                    <event value="189"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_D3DSetVertexFormatBeginEvent"
                        task="D3DSetVertexFormat"
                        opcode="win:Start"
                        message="$(string.Event.D3DSetVertexFormat.Start)"
                        />
                    <event value="190"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        task="D3DSetVertexFormat"
                        opcode="win:Stop"
                        symbol="SL_D3DSetVertexFormatEndEvent"
                        message="$(string.Event.D3DSetVertexFormat.Stop)"
                        />
                    <event value="195"
                        level="win:Informational"
                        template="Float"
                        channel="Silverlight"
                        symbol="SL_NativeScrollViewerHeight"
                        task="NativeScrollViewerHeight"
                        opcode="win:Info"
                        message="$(string.Event.NativeScrollViewerHeight.Info)"
                        />
                    <event value="196"
                        level="win:Informational"
                        template="NativeScrollViewerTransformEvent"
                        channel="Silverlight"
                        symbol="SL_NativeScrollViewerTransform"
                        task="NativeScrollViewerTransform"
                        opcode="win:Info"
                        message="$(string.Event.NativeScrollViewerTransform.Info)"
                        />
                    <event value="197"
                        level="win:Informational"
                        template="StringPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_VSPRealizedHeight"
                        task="VSPRealizedHeight"
                        opcode="win:Info"
                        message="$(string.Event.VSPRealizedHeight.Info)"
                        />
                    <event value="198"
                        level="win:Informational"
                        template="StringPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_VSPOffset"
                        task="VSPOffset"
                        opcode="win:Info"
                        message="$(string.Event.VSPOffset.Info)"
                        />
                    <event value="199"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_PopupBeginEvent"
                        task="Popup"
                        opcode="win:Start"
                        message="$(string.Event.Popup.Start)"
                        />
                    <event value="200"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_PopupEndEvent"
                        task="Popup"
                        opcode="win:Stop"
                        message="$(string.Event.Popup.Stop)"
                        />
                    <event value="201"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MessageBoxBeginEvent"
                        task="MessageBox"
                        opcode="win:Start"
                        message="$(string.Event.MessageBox.Start)"
                        />
                    <event value="202"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_MessageBoxEndEvent"
                        task="MessageBox"
                        opcode="win:Stop"
                        message="$(string.Event.MessageBox.Stop)"
                        />
                    <event value="203"
                        level="win:Verbose"
                        template="ObjectIDPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_RasterizedFullScreenCache"
                        task="RasterizedFullScreenCache"
                        opcode="win:Info"
                        message="$(string.Event.RasterizedFullScreenCache.Info)"
                        />
                    <event value="204"
                        level="win:Verbose"
                        template="ObjectIDPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_ThreadCreate"
                        task="ThreadCreate"
                        opcode="win:Info"
                        message="$(string.Event.ThreadCreate.Info)"
                        />
                    <event value="205"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DirectRenderingBeginEvent"
                        task="DirectRenderingBegin"
                        opcode="win:Info"
                        message="$(string.Event.DirectRenderingBegin.Info)"
                        />
                    <event value="206"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_DirectRenderingEndEvent"
                        task="DirectRenderingEnd"
                        opcode="win:Info"
                        message="$(string.Event.DirectRenderingEnd.Info)"
                        />
                    <event value="207"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HybridDrawBeginEvent"
                        task="HybridDrawBegin"
                        opcode="win:Start"
                        message="$(string.Event.HybridDrawBegin.Start)"
                        />
                    <event value="208"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HybridDrawEndEvent"
                        task="HybridDrawEnd"
                        opcode="win:Stop"
                        message="$(string.Event.HybridDrawEnd.Stop)"
                        />
                    <event value="209"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HybridInitializeBegin"
                        task="HybridInitializeBegin"
                        opcode="win:Start"
                        message="$(string.Event.HybridInitializeBegin.Start)"
                        />
                    <event value="210"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HybridInitializeEnd"
                        task="HybridInitializeEnd"
                        opcode="win:Stop"
                        message="$(string.Event.HybridInitializeEnd.Stop)"
                        />
                    <event value="211"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HybridDestroyBegin"
                        task="HybridDestroyBegin"
                        opcode="win:Start"
                        message="$(string.Event.HybridDestroyBegin.Start)"
                        />
                    <event value="212"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HybridDestroyEnd"
                        task="HybridDestroyEnd"
                        opcode="win:Stop"
                        message="$(string.Event.HybridDestroyEnd.Stop)"
                        />
                    <event value="213"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HybridSendDataBegin"
                        task="HybridSendDataBegin"
                        opcode="win:Start"
                        message="$(string.Event.HybridSendDataBegin.Start)"
                        />
                    <event value="214"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HybridSendDataEnd"
                        task="HybridSendDataEnd"
                        opcode="win:Stop"
                        message="$(string.Event.HybridSendDataEnd.Stop)"
                        />
                    <event value="215"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HybridClearD3DDeviceBegin"
                        task="HybridClearD3DDeviceBegin"
                        opcode="win:Start"
                        message="$(string.Event.HybridClearD3DDeviceBegin.Start)"
                        />
                    <event value="216"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_HybridClearD3DDeviceEnd"
                        task="HybridClearD3DDeviceEnd"
                        opcode="win:Stop"
                        message="$(string.Event.HybridClearD3DDeviceEnd.Stop)"
                        />
                    <event value="217"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ManagedInputManipulationBegin"
                        task="ManagedInputManipulationBegin"
                        opcode="win:Start"
                        message="$(string.Event.ManagedInputManipulationBegin.Start)"
                        />
                    <event value="218"
                        level="win:Informational"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_ManagedInputManipulationEnd"
                        task="ManagedInputManipulationEnd"
                        opcode="win:Stop"
                        message="$(string.Event.ManagedInputManipulationEnd.Stop)"
                        />
                    <event value="219"
                        level="win:Verbose"
                        template="RawTouchInfo"
                        channel="Silverlight"
                        symbol="SL_TouchFirstDown"
                        task="TouchFirstDown"
                        opcode="win:Info"
                        message="$(string.Event.TouchFirstDown.Info)"
                        />
                    <event value="220"
                        level="win:Verbose"
                        template="RawTouchInfo"
                        channel="Silverlight"
                        symbol="SL_TouchAllUp"
                        task="TouchAllUp"
                        opcode="win:Info"
                        message="$(string.Event.TouchAllUp.Info)"
                        />
                    <event value="221"
                        level="win:Verbose"
                        template="UInt32"
                        channel="Silverlight"
                        symbol="SL_GestureStart"
                        task="GestureStart"
                        opcode="win:Info"
                        message="$(string.Event.GestureStart.Info)"
                        />
                    <event value="222"
                        level="win:Verbose"
                        template="UInt32"
                        channel="Silverlight"
                        symbol="SL_GestureType"
                        task="GestureType"
                        opcode="win:Info"
                        message="$(string.Event.GestureType.Info)"
                        />               
                    <event value="223"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_GestureTargetStart"
                        task="GestureTarget"
                        opcode="win:Start"
                        message="$(string.Event.GestureTarget.Info)"
                        />
                    <event value="224"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_GestureTarget"
                        task="GestureTarget"
                        opcode="win:Info"
                        message="$(string.Event.GestureTarget.Info)"
                        />
                    <event value="225"
                        level="win:Verbose"
                        template="SimpleEvent"
                        channel="Silverlight"
                        symbol="SL_GestureTargetEnd"
                        task="GestureTarget"
                        opcode="win:Stop"
                        message="$(string.Event.GestureTarget.Info)"
                        />
                    <event value="226"
                        level="win:Verbose"
                        template="ProfilerSampleInfoEvent"
                        channel="Silverlight"
                        symbol="SL_ProfilerSampleUI"
                        task="ProfilerSample"
                        opcode="win:Info"
                        message="$(string.Event.ProfilerSample.Info)"                        
                        />
                    <event value="228"
                        level="win:Warning"
                        template="XamlErrorEvent"
                        channel="Silverlight"
                        symbol="SL_XBFGenerationFailure"
                        task="XBFGenerationFailure"
                        opcode="win:Info"
                        message="$(string.Event.XBFGenerationFailure.Info)"
                        />
                    <event value="229"
                        level="win:Informational"
                        template="XamlErrorEvent"
                        channel="Silverlight"
                        symbol="SL_XBFGenerationSuccess"
                        task="XBFGenerationSuccess"
                        opcode="win:Info"
                        message="$(string.Event.XBFGenerationSuccess.Info)"
                        />
                    <event value="230"
                        level="win:Warning"
                        template="XamlErrorEvent"
                        channel="Silverlight"
                        symbol="SL_XBFLoadFailure"
                        task="XBFLoadFailure"
                        opcode="win:Info"
                        message="$(string.Event.XBFLoadFailure.Info)"
                        />
                    <event value="231"
                        level="win:Informational"
                        template="XamlErrorEvent"
                        channel="Silverlight"
                        symbol="SL_XBFLoadSuccess"
                        task="XBFLoadSuccess"
                        opcode="win:Info"
                        message="$(string.Event.XBFLoadSuccess.Info)"
                        />
                    <event value="232"
                        level="win:Warning"
                        template="XamlErrorEvent"
                        channel="Silverlight"
                        symbol="SL_XamlValidatorFailure"
                        task="XamlValidatorFailure"
                        opcode="win:Info"
                        message="$(string.Event.XamlValidatorFailure.Info)"
                        />
                    <event value="233"
                        level="win:Informational"
                        template="MSSGetSample"
                        channel="Silverlight"
                        symbol="SL_MSSGetSample"
                        task="MSSGetSample"
                        keywords="Performance"
                        opcode="win:Info"
                        message="$(string.Event.MSSGetSample.Info)"
                        />
                    <event value="234"
                        level="win:Informational"
                        template="MSSSetupDecryptorBegin"
                        channel="Silverlight"
                        symbol="SL_MSSSetupDecryptorBegin"
                        task="MSSSetupDecryptor"
                        keywords="Performance"
                        opcode="win:Info"
                        message="$(string.Event.MSSSetupDecryptorBegin.Info)"
                        />
                    <event value="235"
                        level="win:Informational"
                        template="MSSSetupDecryptorEnd"
                        channel="Silverlight"
                        symbol="SL_MSSSetupDecryptorEnd"
                        task="MSSSetupDecryptor"
                        keywords="Performance"
                        opcode="win:Info"
                        message="$(string.Event.MSSSetupDecryptorEnd.Info)"
                        />
                    <event value="236"
                        level="win:Informational"
                        template="StringPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_WpMediaMsgInfo"
                        task="WpMediaMsg"
                        opcode="win:Info"
                        message="$(string.Event.WpMediaMsg.Info)"
                        />
                    <event value="237"
                        level="win:Verbose"
                        template="StringPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_WpMediaMsgVerbose"
                        task="WpMediaMsg"
                        opcode="win:Info"
                        message="$(string.Event.WpMediaMsg.Info)"
                        />
                    <event value="238"
                        level="win:Error"
                        template="StringPayloadEvent"
                        channel="Silverlight"
                        symbol="SL_WpMediaMsgError"
                        task="WpMediaMsg"
                        keywords="DevPlatCircular"
                        opcode="win:Info"
                        message="$(string.Event.WpMediaMsg.Info)"
                        />
                   <event value="239"
                       level="win:Verbose"
                       template="SimpleEvent"
                       channel="Silverlight"
                       symbol="SL_RasterizationBandBeginEvent"
                       task="RasterizationBand"
                       opcode="win:Start"
                       message="$(string.Event.RasterizationBand.Start)"
                       />
                   <event value="240"
                      level="win:Verbose"
                      template="SimpleEvent"
                      channel="Silverlight"
                      task="RasterizationBand"
                      opcode="win:Stop"
                      symbol="SL_RasterizationBandEndEvent"
                      message="$(string.Event.RasterizationBand.Stop)"
                      />
                  </events>
            </provider>
        </events>
    </instrumentation>

    <localization>

        <!--Table of event format strings-->
        <resources culture="en-US">
            <stringTable>
                <string id="Provider.Name" value="Microsoft-WindowsPhone-Silverlight" />

                <string id="Keyword.Performance" value="Performance" />
                <string id="Keyword.DevPlatCircular" value="DevPlat Circular" />

                <string id="Event.FirstRaster.Info" value="Silverlight/FirstRaster" />
                <string id="Event.Raster.Start" value="Silverlight/Raster/Start" />
                <string id="Event.Raster.Stop" value="Silverlight/Raster/Stop" />
                <string id="Event.Parse.Start" value="Silverlight/Parse/Start" />
                <string id="Event.Parse.Stop" value="Silverlight/Parse/Stop" />
                <string id="Event.MediaRenderCallback.Info" value="Silverlight/MediaRenderCallback" />
                <string id="Event.Present.Start" value="Silverlight/Present/Start" />
                <string id="Event.Present.Stop" value="Silverlight/Present/Stop" />
                <string id="Event.MediaDrawFrame.Info" value="Silverlight/MediaDrawFrame" />
                <string id="Event.MediaBuffering.Start" value="Silverlight/MediaBuffering/Start" />
                <string id="Event.MediaBuffering.Stop" value="Silverlight/MediaBuffering/Stop" />
                <string id="Event.MediaDroppedFrame.Info" value="Silverlight/MediaDroppedFrame" />
                <string id="Event.Information.Info" value="Silverlight/Information" />
                <string id="Event.CLRStartup.Start" value="Silverlight/CLRStartup/Start" />
                <string id="Event.CLRStartup.Stop" value="Silverlight/CLRStartup/Stop" />
                <string id="Event.CLRShutdown.Start" value="Silverlight/CLRShutdown/Start" />
                <string id="Event.CLRShutdown.Stop" value="Silverlight/CLRShutdown/Stop" />
                <string id="Event.CLRConvertValue.Info" value="Silverlight/CLRConvertValue" />
                <string id="Event.CLRObjectLifetime.Info" value="Silverlight/CLRObjectLifetime" />
                <string id="Event.ControlShutdown.Start" value="Silverlight/ControlShutdown/Start" />
                <string id="Event.ControlShutdown.Stop" value="Silverlight/ControlShutdown/Stop" />
                <string id="Event.ControlStartup.Info" value="Silverlight/ControlStartup" />
                <string id="Event.ControlInPlaceDeact.Start" value="Silverlight/ControlInPlaceDeact/Start" />
                <string id="Event.ControlInPlaceDeact.Stop" value="Silverlight/ControlInPlaceDeact/Stop" />
                <string id="Event.PutRootVisual.Start" value="Silverlight/PutRootVisual/Start" />
                <string id="Event.PutRootVisual.Stop" value="Silverlight/PutRootVisual/Stop" />
                <string id="Event.LoadNpctrlDll.Info" value="Silverlight/LoadNpctrlDll" />
                <string id="Event.Draw.Start" value="Silverlight/Draw/Start" />
                <string id="Event.Draw.Stop" value="Silverlight/Draw/Stop" />
                <string id="Event.WinRender.Info" value="Silverlight/WinRender" />
                <string id="Event.PutSource.Start" value="Silverlight/PutSource/Start" />
                <string id="Event.PutSource.Stop" value="Silverlight/PutSource/Stop" />
                <string id="Event.SetValueManaged.Start" value="Silverlight/SetValueManaged/Start" />
                <string id="Event.SetValueManaged.Stop" value="Silverlight/SetValueManaged/Stop" />
                <string id="Event.SetValueNative.Start" value="Silverlight/SetValueNative/Start" />
                <string id="Event.SetValueNative.Stop" value="Silverlight/SetValueNative/Stop" />
                <string id="Event.PutSource.Info" value="Silverlight/PutSource" />
                <string id="Event.MediaSampleAdded.Info" value="Silverlight/MediaSampleAdded" />
                <string id="Event.SeadragonDecode.Info" value="Silverlight/SeadragonDecode" />
                <string id="Event.SeadragonTileDownloaded.Info" value="Silverlight/SeadragonTileDownloaded" />
                <string id="Event.SeadragonRasterizeFrame.Info" value="Silverlight/SeadragonRasterizeFrame" />
                <string id="Event.SeadragonBrushGenerate.Info" value="Silverlight/SeadragonBrushGenerate" />
                <string id="Event.SeadragonImageResolved.Info" value="Silverlight/SeadragonImageResolved" />
                <string id="Event.ApplicationStartup.Info" value="Silverlight/ApplicationStartup" />
                <string id="Event.DRMIndiv.Start" value="Silverlight/DRMIndiv/Start" />
                <string id="Event.DRMIndiv.Stop" value="Silverlight/DRMIndiv/Stop" />
                <string id="Event.DRMLicenseAcquisition.Start" value="Silverlight/DRMLicenseAcquisition/Start" />
                <string id="Event.DRMLicenseAcquisition.Stop" value="Silverlight/DRMLicenseAcquisition/Stop" />
                <string id="Event.MediaRenderAudio.Info" value="Silverlight/MediaRenderAudio" />
                <string id="Event.MediaLogRequest.Info" value="Silverlight/MediaLogRequest" />
                <string id="Event.Databinding.Start" value="Silverlight/Databinding/Start" />
                <string id="Event.Databinding.Stop" value="Silverlight/Databinding/Stop" />
                <string id="Event.ExtendedDatagridScroll.Info" value="Silverlight/ExtendedDatagridScroll" />
                <string id="Event.AudioSampleRequest.Start" value="Silverlight/AudioSampleRequest/Start" />
                <string id="Event.AudioSampleRequest.Stop" value="Silverlight/AudioSampleRequest/Stop" />
                <string id="Event.VideoSampleRequest.Start" value="Silverlight/VideoSampleRequest/Start" />
                <string id="Event.VideoSampleRequest.Stop" value="Silverlight/VideoSampleRequest/Stop" />
                <string id="Event.CurrentAudioTimestamp.Info" value="Silverlight/CurrentAudioTimestamp" />
                <string id="Event.VideoQueueSize.Info" value="Silverlight/VideoQueueSize" />
                <string id="Event.CurrentVideoTimestamp.Info" value="Silverlight/CurrentVideoTimestamp" />
                <string id="Event.AudioLatency.Info" value="Silverlight/AudioLatency" />
                <string id="Event.DecodeJpg.Start" value="Silverlight/DecodeJpg/Start" />
                <string id="Event.DecodeJpg.Stop" value="Silverlight/DecodeJpg/Stop" />
                <string id="Event.ImageDecode.Start" value="Silverlight/ImageDecode/Start" />
                <string id="Event.ImageDecode.Stop" value="Silverlight/ImageDecode/Stop" />
                <string id="Event.MouseDown.Info" value="Silverlight/MouseDown" />
                <string id="Event.MouseUp.Info" value="Silverlight/MouseUp" />
                <string id="Event.Layout.Start" value="Silverlight/Layout/Start" />
                <string id="Event.Layout.Stop" value="Silverlight/Layout/Stop" />
                <string id="Event.Render.Start" value="Silverlight/Render/Start" />
                <string id="Event.Render.Stop" value="Silverlight/Render/Stop" />
                <string id="Event.D3DCompile.Start" value="Silverlight/D3DCompile/Start" />
                <string id="Event.D3DCompile.Stop" value="Silverlight/D3DCompile/Stop" />
                <string id="Event.HwRender.Start" value="Silverlight/HwRender/Start" />
                <string id="Event.HwRender.Stop" value="Silverlight/HwRender/Stop" />
                <string id="Event.HwPresent.Start" value="Silverlight/HwPresent/Start" />
                <string id="Event.HwPresent.Stop" value="Silverlight/HwPresent/Stop" />
                <string id="Event.ScriptCallback.Start" value="Silverlight/ScriptCallback/Start" />
                <string id="Event.ScriptCallback.Stop" value="Silverlight/ScriptCallback/Stop" />
                <string id="Event.CLRCallback.Start" value="Silverlight/CLRCallback/Start" />
                <string id="Event.CLRCallback.Stop" value="Silverlight/CLRCallback/Stop" />
                <string id="Event.TickManagerPause.Info" value="Silverlight/TickManagerPause" />
                <string id="Event.TickManagerResume.Info" value="Silverlight/TickManagerResume" />
                <string id="Event.CompositorPause.Info" value="Silverlight/CompositorPause" />
                <string id="Event.CompositorResume.Info" value="Silverlight/CompositorResume" />
                <string id="Event.TickPost.Info" value="Silverlight/TickPost" />
                <string id="Event.DispatcherTimerStart.Info" value="Silverlight/DispatcherTimerStart" />
                <string id="Event.DispatcherTimerStop.Info" value="Silverlight/DispatcherTimerStop" />
                <string id="Event.TickProcess.Start" value="Silverlight/TickProcess/Start" />
                <string id="Event.TickProcess.Stop" value="Silverlight/TickProcess/Stop" />
                <string id="Event.TickDelayedForInput.Info" value="Silverlight/TickDelayedForInput" />
                <string id="Event.WM7VideoFrameReady.Info" value="Silverlight/WM7VideoFrameReady" />
                <string id="Event.WM7VideoFrameReleased.Info" value="Silverlight/WM7VideoFrameReleased" />
                <string id="Event.WM7VideoFrameAdvance.Info" value="Silverlight/WM7VideoFrameAdvance" />
                <string id="Event.WM7VideoDroppedFrames.Info" value="Silverlight/WM7VideoDroppedFrames" />
                <string id="Event.MediaDrawFrameOldOrEmpty.Info" value="Silverlight/MediaDrawFrameOldOrEmpty" />
                <string id="Event.Seadragon4Download.Start" value="Silverlight/Seadragon4Download/Start" />
                <string id="Event.Seadragon4Download.Stop" value="Silverlight/Seadragon4Download/Stop" />
                <string id="Event.SplashScreenDrawn.Info" value="Silverlight/SplashScreenDrawn" />
                <string id="Event.CompositorCreation.Start" value="Silverlight/CompositorCreation/Start" />
                <string id="Event.CompositorCreation.Stop" value="Silverlight/CompositorCreation/Stop" />
                <string id="Event.ControlInitialize.Start" value="Silverlight/ControlInitialize/Start" />
                <string id="Event.ControlInitialize.Stop" value="Silverlight/ControlInitialize/Stop" />
                <string id="Event.WM7Gesture.Start" value="Silverlight/WM7Gesture/Start" />
                <string id="Event.WM7Gesture.Stop" value="Silverlight/WM7Gesture/Stop" />
                <string id="Event.WM7ProcessGesture.Start" value="Silverlight/WM7ProcessGesture/Start" />
                <string id="Event.WM7ProcessGesture.Stop" value="Silverlight/WM7ProcessGesture/Stop" />
                <string id="Event.WM7GestureMoreData.Info" value="Silverlight/WM7GestureMoreData" />
                <string id="Event.WM7VideoFrameAdvanceToGpu.Info" value="Silverlight/WM7VideoFrameAdvanceToGpu" />
                <string id="Event.WM7VideoRegisterVideoSurfaces.Info" value="Silverlight/WM7VideoRegisterVideoSurfaces" />
                <string id="Event.WM7VideoHasDirtySurfaces.Info" value="Silverlight/WM7VideoHasDirtySurfaces" />
                <string id="Event.WM7VideoGetNextPresentTime.Info" value="Silverlight/WM7VideoGetNextPresentTime" />
                <string id="Event.WM7VideoClockStart.Info" value="Silverlight/WM7VideoClockStart" />
                <string id="Event.WM7VideoClockStop.Info" value="Silverlight/WM7VideoClockStop" />
                <string id="Event.WM7VideoProviderStarving.Info" value="Silverlight/WM7VideoProviderStarving" />
                <string id="Event.WM7VideoProviderAssert.Info" value="Silverlight/WM7VideoProviderAssert" />
                <string id="Event.WM7VideoFramePresentedEvent.Info" value="Silverlight/WM7VideoFramePresentedEvent" />
                <string id="Event.WpMediaMsg.Info" value="Silverlight/WpMediaMsg" />
                <string id="Event.ParseObjectElement.Start" value="Silverlight/ParseObjectElement/Start" />
                <string id="Event.ParseObjectElement.Stop" value="Silverlight/ParseObjectElement/Stop" />
                <string id="Event.ParsePropertyElement.Start" value="Silverlight/ParsePropertyElement/Start" />
                <string id="Event.ParsePropertyElement.Stop" value="Silverlight/ParsePropertyElement/Stop" />
                <string id="Event.StoryboardBegin.Info" value="Silverlight/StoryboardBegin" />
                <string id="Event.StoryboardPause.Info" value="Silverlight/StoryboardPause" />
                <string id="Event.StoryboardResume.Info" value="Silverlight/StoryboardResume" />
                <string id="Event.StoryboardStop.Info" value="Silverlight/StoryboardStop" />
                <string id="Event.StoryboardEnd.Info" value="Silverlight/StoryboardEnd" />
                <string id="Event.PerFrameCallback.Start" value="Silverlight/PerFrameCallback/Start" />
                <string id="Event.PerFrameCallback.Stop" value="Silverlight/PerFrameCallback/Stop" />
                <string id="Event.ApplicationStarting.Info" value="Silverlight/ApplicationStarting" />
                <string id="Event.ApplicationStarted.Info" value="Silverlight/ApplicationStarted" />
                <string id="Event.ApplicationLoadComponent.Start" value="Silverlight/ApplicationLoadComponent/Start" />
                <string id="Event.ApplicationLoadComponent.Stop" value="Silverlight/ApplicationLoadComponent/Stop" />
                <string id="Event.ApplicationConstructed.Info" value="Silverlight/ApplicationConstructed" />
                <string id="Event.NewRenderList.Start" value="Silverlight/NewRenderList/Start" />
                <string id="Event.NewRenderList.Stop" value="Silverlight/NewRenderList/Stop" />
                <string id="Event.LoadAppManifest.Start" value="Silverlight/LoadAppManifest/Start" />
                <string id="Event.LoadAppManifest.Stop" value="Silverlight/LoadAppManifest/Stop" />
                <string id="Event.FirstUserDraw.Info" value="Silverlight/FirstUserDraw" />
                <string id="Event.Measure.Start" value="Silverlight/Measure/Start" />
                <string id="Event.Measure.Stop" value="Silverlight/Measure/Stop" />
                <string id="Event.Arrange.Start" value="Silverlight/Arrange/Start" />
                <string id="Event.Arrange.Stop" value="Silverlight/Arrange/Stop" />
                <string id="Event.CoreServicesCreate.Start" value="Silverlight/CoreServicesCreate/Start" />
                <string id="Event.CoreServicesCreate.Stop" value="Silverlight/CoreServicesCreate/Stop" />
                <string id="Event.GraphicsDeviceClear.Start" value="Silverlight/GraphicsDeviceClear/Start" />
                <string id="Event.GraphicsDeviceClear.Stop" value="Silverlight/GraphicsDeviceClear/Stop" />
                <string id="Event.CreateTexture.Info" value="Silverlight/CreateTexture" />
                <string id="Event.DestroyTexture.Info" value="Silverlight/DestroyTexture" />
                <string id="Event.DirectManipulationMessage.Start" value="Silverlight/DirectManipulationMessage/Start" />
                <string id="Event.DirectManipulationMessage.Stop" value="Silverlight/DirectManipulationMessage/Stop" />
                <string id="Event.DirectManpultationServer.Start" value="Silverlight/DirectManpultationServer/Start" />
                <string id="Event.DirectManpultationServer.Stop" value="Silverlight/DirectManpultationServer/Stop" />
                <string id="Event.DirectManipulationClient.Start" value="Silverlight/DirectManipulationClient/Start" />
                <string id="Event.DirectManipulationStarted.Stop" value="Silverlight/DirectManipulationStarted/Stop" />
                <string id="Event.DirectManipulationStarted.Start" value="Silverlight/DirectManipulationStarted/Start" />
                <string id="Event.DirectManipulationDelta.Info" value="Silverlight/DirectManipulationDelta" />
                <string id="Event.DirectManipulationCompleted.Stop" value="Silverlight/DirectManipulationCompleted/Stop" />
                <string id="Event.D3DCreate.Start" value="Silverlight/D3DCreate/Start" />
                <string id="Event.D3DCreate.Stop" value="Silverlight/D3DCreate/Stop" />
                <string id="Event.D3DInitializeDevice.Start" value="Silverlight/D3DInitializeDevice/Start" />
                <string id="Event.D3DInitializeDevice.Stop" value="Silverlight/D3DInitializeDevice/Stop" />
                <string id="Event.D3DInitializeDx.Start" value="Silverlight/D3DInitializeDx/Start" />
                <string id="Event.D3DInitializeDx.Stop" value="Silverlight/D3DInitializeDx/Stop" />
                <string id="Event.D3DReleaseDx.Start" value="Silverlight/D3DReleaseDx/Start" />
                <string id="Event.D3DReleaseDx.Stop" value="Silverlight/D3DReleaseDx/Stop" />
                <string id="Event.D3DResize.Start" value="Silverlight/D3DResize/Start" />
                <string id="Event.D3DResize.Stop" value="Silverlight/D3DResize/Stop" />
                <string id="Event.D3DCreateTexture.Start" value="Silverlight/D3DCreateTexture/Start" />
                <string id="Event.D3DCreateTexture.Stop" value="Silverlight/D3DCreateTexture/Stop" />
                <string id="Event.D3DCreateTextureFromExistingTexture.Start" value="Silverlight/D3DCreateTextureFromExistingTexture/Start" />
                <string id="Event.D3DCreateTextureFromExistingTexture.Stop" value="Silverlight/D3DCreateTextureFromExistingTexture/Stop" />
                <string id="Event.D3DSetTransforms.Start" value="Silverlight/D3DSetTransforms/Start" />
                <string id="Event.D3DSetTransforms.Stop" value="Silverlight/D3DSetTransforms/Stop" />
                <string id="Event.D3DDrawTriangleStrip.Start" value="Silverlight/D3DDrawTriangleStrip/Start" />
                <string id="Event.D3DDrawTriangleStrip.Stop" value="Silverlight/D3DDrawTriangleStrip/Stop" />
                <string id="Event.D3DDrawIndexedTriangleStrip.Start" value="Silverlight/D3DDrawIndexedTriangleStrip/Start" />
                <string id="Event.D3DDrawIndexedTriangleStrip.Stop" value="Silverlight/D3DDrawIndexedTriangleStrip/Stop" />
                <string id="Event.D3DSetTexture.Start" value="Silverlight/D3DSetTexture/Start" />
                <string id="Event.D3DSetTexture.Stop" value="Silverlight/D3DSetTexture/Stop" />
                <string id="Event.D3DSetRenderTarget.Start" value="Silverlight/D3DSetRenderTarget/Start" />
                <string id="Event.D3DSetRenderTarget.Stop" value="Silverlight/D3DSetRenderTarget/Stop" />
                <string id="Event.D3DClear.Start" value="Silverlight/D3DClear/Start" />
                <string id="Event.D3DClear.Stop" value="Silverlight/D3DClear/Stop" />
                <string id="Event.D3DSetVertexFormat.Start" value="Silverlight/D3DSetVertexFormat/Start" />
                <string id="Event.D3DSetVertexFormat.Stop" value="Silverlight/D3DSetVertexFormat/Stop" />
                <string id="Event.D3DSetTextureForScaler.Start" value="Silverlight/D3DSetTextureForScaler/Start" />
                <string id="Event.D3DSetTextureForScaler.Stop" value="Silverlight/D3DSetTextureForScaler/Stop" />
                <string id="Event.D3DSetScalerParams.Start" value="Silverlight/D3DSetScalerParams/Start" />
                <string id="Event.D3DSetScalerParams.Stop" value="Silverlight/D3DSetScalerParams/Stop" />
                <string id="Event.NativeScrollViewerHeight.Info" value="Silverlight/NativeScrollViewerHeight" />
                <string id="Event.NativeScrollViewerTransform.Info" value="Silverlight/NativeScrollViewerTransform" />
                <string id="Event.VSPRealizedHeight.Info" value="Silverlight/VSPRealizedHeight" />
                <string id="Event.VSPOffset.Info" value="Silverlight/VSPOffset" />
                <string id="Event.Popup.Start" value="Silverlight/Popup/Start" />
                <string id="Event.Popup.Stop" value="Silverlight/Popup/Stop" />
                <string id="Event.MessageBox.Start" value="Silverlight/MessageBox/Start" />
                <string id="Event.MessageBox.Stop" value="Silverlight/MessageBox/Stop" />
                <string id="Event.RasterizedFullScreenCache.Info" value="Silverlight/RasterizedFullScreenCache" />
                <string id="Event.ThreadCreate.Info" value="Silverlight/ThreadCreate" />
                <string id="Event.DirectRenderingBegin.Info" value="Silverlight/DirectRenderingBegin" />
                <string id="Event.DirectRenderingEnd.Info" value="Silverlight/DirectRenderingEnd" />
                <string id="Event.HybridDrawBegin.Start" value="Silverlight/HybridDraw/Start" />
                <string id="Event.HybridDrawEnd.Stop" value="Silverlight/HybridDraw/Stop" />
                <string id="Event.HybridInitializeBegin.Start" value="Silverlight/HybridInitialize/Start" />
                <string id="Event.HybridInitializeEnd.Stop" value="Silverlight/HybridInitialize/Stop" />
                <string id="Event.HybridDestroyBegin.Start" value="Silverlight/HybridDestroy/Start" />
                <string id="Event.HybridDestroyEnd.Stop" value="Silverlight/HybridDestroy/Stop" />
                <string id="Event.HybridSendDataBegin.Start" value="Silverlight/HybridSendData/Start" />
                <string id="Event.HybridSendDataEnd.Stop" value="Silverlight/HybridSendData/Stop" />
                <string id="Event.HybridClearD3DDeviceBegin.Start" value="Silverlight/HybridClearD3DDevice/Start" />
                <string id="Event.HybridClearD3DDeviceEnd.Stop" value="Silverlight/HybridClearD3DDevice/Stop" />
                <string id="Event.ManagedInputManipulationBegin.Start" value="Silverlight/ManagedInputManipulation/Start" />
                <string id="Event.ManagedInputManipulationEnd.Stop" value="Silverlight/ManagedInputManipulation/Stop" />
                <string id="Event.ProfilerSample.Info" value="Silverlight/ProfilerSample" />
                <string id="Event.TouchFirstDown.Info" value="Silverlight/TouchFirstDown" />
                <string id="Event.TouchAllUp.Info" value="Silverlight/TouchAllUp" />
                <string id="Event.GestureStart.Info" value="Silverlight/GestureStart" />
                <string id="Event.GestureType.Info" value="Silverlight/GestureType" />
                <string id="Event.GestureTarget.Info" value="Silverlight/GestureTarget" />                
                <string id="Event.XBFGenerationFailure.Info" value="Silverlight/XBFGenerationFailure" />
                <string id="Event.XBFGenerationSuccess.Info" value="Silverlight/XBFGenerationSuccess" />
                <string id="Event.XBFLoadFailure.Info" value="Silverlight/XBFLoadFailure" />
                <string id="Event.XBFLoadSuccess.Info" value="Silverlight/XBFLoadSuccess" />
                <string id="Event.XamlValidatorFailure.Info" value="Silverlight/XamlValidatorFailure" />
                <string id="Event.MSSGetSample.Info" value="Silverlight/MSSGetSample %1" />
                <string id="Event.MSSSetupDecryptorBegin.Info" value="Silverlight/MSSSetupDecryptorBegin %1" />
                <string id="Event.MSSSetupDecryptorEnd.Info" value="Silverlight/MSSSetupDecryptorEnd %1" />
                <string id="Event.RasterizationBand.Start" value="Silverlight/RasterizationBand/Start" />
                <string id="Event.RasterizationBand.Stop" value="Silverlight/RasterizationBand/Stop" />
           </stringTable>
        </resources>
    </localization>
</instrumentationManifest>
