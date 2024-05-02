//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
//
// Use of this source code is subject to the terms of the Microsoft shared
// source or premium shared source license agreement under which you licensed
// this source code. If you did not accept the terms of the license agreement,
// you are not authorized to use this source code. For the terms of the license,
// please see the license agreement between you and Microsoft or, if applicable,
// see the SOURCE.RTF on your install media or the root of your tools installation.
// THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
//

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

/*
    Default         - Default audio device.
    Communications  - Device preferred for VoIP applications.
*/
enum AudioDeviceRole { Default=0, Communications };

/*
Arguments
    AudioDeviceRole - Device role, either Default or Communications

Remarks -
    Returns the ID for the default capture device for the specified role; nullptr if device was not found.
    Free the returned string with CoTaskMemFree.
*/
STDAPI_(LPCWSTR) GetDefaultAudioCaptureId(_In_ AudioDeviceRole role);

/*
Arguments
    AudioDeviceRole - Device role, either Default or Communications

Remarks -
    Returns the ID for the default render device for the specified role; nullptr if device was not found.
    Free the returned string with CoTaskMemFree.
*/
STDAPI_(LPCWSTR) GetDefaultAudioRenderId(_In_ AudioDeviceRole role);

/*
Arguments
    PCWSTR  - Device ID obtained from GetDefaultAudioRenderId/GetDefaultAudioCaptureId API
    REFIID  - IID of the interface requested.
    void**  - Ptr to receive the interface ptr

Remarks -
    This method finds the endpoint based on the device ID and returns the IAudioClient2 interface.
*/
STDAPI ActivateAudioInterface(_In_ PCWSTR deviceId, _In_ REFIID iid, _Deref_out_ void** ppInterface);

#ifdef __cplusplus
}
#endif
