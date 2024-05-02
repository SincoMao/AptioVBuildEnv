/*++

Copyright (c) Microsoft Corporation

Module Name:

    kdnetshareddata.h

Abstract:

    Defines the public interface for the kdnet data that is shared with its
    extensibility modules.

Author:

    Joe Ballantyne (joeball) 2-18-2012

--*/

#pragma once

#define MAC_ADDRESS_SIZE 6
#define UNDI_DEFAULT_HARDWARE_CONTEXT_SIZE ((512 + 10) * 1024)

#if defined(_AMD64_)
#define MAX_HARDWARE_CONTEXT_SIZE (160*1024*1024)
#else
#define MAX_HARDWARE_CONTEXT_SIZE (16*1024*1024)
#endif

#define TRANSMIT_ASYNC 0x80000000
#define TRANSMIT_HANDLE 0x40000000
#define HANDLE_FLAGS (TRANSMIT_ASYNC | TRANSMIT_HANDLE)

//
// The following flags are set by the KDNET extensibility module in the Flags
// field of the KDNET_SHARED_DATA structure to indicate support for optional or
// extended functionality.
//

#define KDX_LOCAL_LINK_ONLY 0x1
#define KDX_VALID_FLAGS (KDX_LOCAL_LINK_ONLY)

typedef struct _KDNET_SHARED_DATA
{
    PVOID Hardware;
    PDEBUG_DEVICE_DESCRIPTOR Device;
    PUCHAR TargetMacAddress;
    ULONG LinkSpeed;
    ULONG LinkDuplex;
    PUCHAR LinkState;
    ULONG SerialBaudRate;
    ULONG Flags;
    UCHAR RestartKdnet;
    UCHAR Reserved[3];
} KDNET_SHARED_DATA, *PKDNET_SHARED_DATA;

