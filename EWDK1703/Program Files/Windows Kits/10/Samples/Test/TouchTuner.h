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

typedef struct _TOUCH_TUNER_ENTRY_PARAMS
{
    ULONG       cbSize;
    HANDLE      hTouchDriver;
    HANDLE      hExitEvent;
    PVOID       reserved;        // for internal use only
} TOUCH_TUNER_ENTRY_PARAMS, *PTOUCH_TUNER_ENTRY_PARAMS;

#define TOUCH_TUNER_ENTRY_PROC  "TouchTunerEntry"

extern "C" ULONG 
TouchTunerEntry(
    _In_ PTOUCH_TUNER_ENTRY_PARAMS pParams
    );

typedef ULONG (WINAPI *PTOUCHTUNERENTRY)(PTOUCH_TUNER_ENTRY_PARAMS);

//
// This GUID is used to access the touch self-test virtual device from user-mode
//

DEFINE_GUID (GUID_TOUCH_SELFTEST_INTERFACE, 
    0x1ED875DA, 0xD851, 0x42BE, 0x9D, 0xFD, 0x52, 0x7D, 0x97, 0x17, 0x81, 0x47);

#define TOUCH_TEST_BUFFER_CTL_CODE(id)  \
    CTL_CODE(FILE_DEVICE_KEYBOARD, (id), METHOD_BUFFERED, FILE_ANY_ACCESS)

#define IOCTL_TOUCH_SELFTEST_READ   TOUCH_TEST_BUFFER_CTL_CODE(100)
#define IOCTL_TOUCH_SELFTEST_WRITE  TOUCH_TEST_BUFFER_CTL_CODE(101)
#define IOCTL_TOUCH_SELFTEST_MODE   TOUCH_TEST_BUFFER_CTL_CODE(102)


typedef struct _TOUCH_TEST_I2C_HEADER
{
    UCHAR AddressLength;
    UCHAR Address;
    ULONG RequestedTransferLength;
} TOUCH_TEST_I2C_HEADER;

#define MAX_READ_BYTES                      (2048)
#define MAX_WRITE_BYTES                     (MAX_READ_BYTES)

#define FILENAME_CONFIG                     (L"touchtunerconfig.txt")

