//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
//
// Use of this source code is subject to the terms of the Microsoft
// premium shared source license agreement under which you licensed
// this source code. If you did not accept the terms of the license
// agreement, you are not authorized to use this source code.
// For the terms of the license, please see the license agreement
// signed by you and Microsoft.
// THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
//

#pragma once

#include <d3d11.h>
#include <dxgi.h>

MIDL_INTERFACE("72a784c5-b7f1-4434-b2b3-7a70408c63cd")
ICameraCapturePreviewSink : public IUnknown
{
    IFACEMETHOD_(void,OnFrameAvailable)(
        DXGI_FORMAT format,
        UINT width,
        UINT height,
        _In_ BYTE* pixels) =0;
};

MIDL_INTERFACE("35a05fbc-b7e7-4549-ba12-8352b0aaa475")
ICameraCaptureDeviceNative : public IUnknown
{
    IFACEMETHOD(SetPreviewSink)(_In_ ICameraCapturePreviewSink* pSink) =0;
    IFACEMETHOD(SetPreviewFormat)(DXGI_FORMAT format) =0;
    IFACEMETHOD(GetPreviewBufferTexture)(_In_ ID3D11Texture2D* pTexture) =0;
    
    IFACEMETHOD(SetDevice)(
        _In_ ID3D11Device* pDevice,
        _In_ ID3D11DeviceContext* pContext) =0;
};

MIDL_INTERFACE("f6b9163c-112b-4da1-a4f7-470272aeedd0")
ICameraCaptureSampleSink : public IUnknown
{
    IFACEMETHOD_(void,OnSampleAvailable)(
        ULONGLONG hnsPresentationTime,
        ULONGLONG hnsSampleDuration,
        DWORD cbSample,
        _In_ BYTE* pSample) =0;
};

MIDL_INTERFACE("3d6e0d5a-9ce0-466f-8310-774d8ad04185")
IAudioVideoCaptureDeviceNative : public IUnknown
{
    IFACEMETHOD(SetAudioSampleSink)(_In_ ICameraCaptureSampleSink* pSink) =0;
    IFACEMETHOD(SetVideoSampleSink)(_In_ ICameraCaptureSampleSink* pSink) =0;
};

MIDL_INTERFACE("291d7549-2d90-4bea-95a1-234722e246cc")
ICameraCaptureFrameNative : public IUnknown
{
    IFACEMETHOD(MapBuffer)(_Out_ DWORD* pcbBuffer, _Outptr_ BYTE** pBuffer) =0;
    IFACEMETHOD(UnmapBuffer)() =0;
};
