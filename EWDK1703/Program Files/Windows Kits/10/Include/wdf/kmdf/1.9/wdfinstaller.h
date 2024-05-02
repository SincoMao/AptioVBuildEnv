/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

_WdfVersionBuild_

Module Name:

    WdfInstaller.h

Abstract:

    Contains prototypes for the WDF installer support.

Author:

Environment:

    kernel mode only

Revision History:

--*/

#ifndef _WDFINSTALLER_1_9_H_
#define _WDFINSTALLER_1_9_H_



#if (NTDDI_VERSION >= NTDDI_WIN2K)



typedef struct _WDF_COINSTALLER_INSTALL_OPTIONS {
    ULONG  Size;
    BOOL   ShowRebootPrompt;
} WDF_COINSTALLER_INSTALL_OPTIONS, *PWDF_COINSTALLER_INSTALL_OPTIONS;

VOID
FORCEINLINE
WDF_COINSTALLER_INSTALL_OPTIONS_INIT(
    _Out_ PWDF_COINSTALLER_INSTALL_OPTIONS ClientOptions
    )
{
    RtlZeroMemory(ClientOptions, sizeof(WDF_COINSTALLER_INSTALL_OPTIONS));

    ClientOptions->Size = sizeof(WDF_COINSTALLER_INSTALL_OPTIONS);
}


//----------------------------------------------------------------------------
// To be called before (your) WDF driver is installed.
//----------------------------------------------------------------------------
ULONG
WINAPI
WdfPreDeviceInstall(
    _In_ LPCWSTR  InfPath,
    _In_opt_ LPCWSTR  InfSectionName
    );

typedef
ULONG
(WINAPI *PFN_WDFPREDEVICEINSTALL)(
    _In_ LPCWSTR  InfPath,
    _In_opt_ LPCWSTR  InfSectionName
    );

ULONG
WINAPI
WdfPreDeviceInstallEx(
    _In_ LPCWSTR  InfPath,
    _In_opt_ LPCWSTR  InfSectionName,
    _In_ PWDF_COINSTALLER_INSTALL_OPTIONS ClientOptions
    );

typedef
ULONG
(WINAPI *PFN_WDFPREDEVICEINSTALLEX)(
    _In_ LPCWSTR  InfPath,
    _In_opt_ LPCWSTR  InfSectionName,
    _In_ PWDF_COINSTALLER_INSTALL_OPTIONS ClientOptions
    );

//----------------------------------------------------------------------------
// To be called after (your) WDF driver is installed.
//----------------------------------------------------------------------------
ULONG
WINAPI
WdfPostDeviceInstall(
    _In_ LPCWSTR  InfPath,
    _In_opt_ LPCWSTR  InfSectionName
    );

typedef
ULONG
(WINAPI *PFN_WDFPOSTDEVICEINSTALL)(
    _In_ LPCWSTR  InfPath,
    _In_opt_ LPCWSTR  InfSectionName
    );

//----------------------------------------------------------------------------
// To be called before (your) WDF driver is removed.
//----------------------------------------------------------------------------
ULONG
WINAPI
WdfPreDeviceRemove(
    _In_ LPCWSTR  InfPath,
    _In_opt_ LPCWSTR  InfSectionName

    );

typedef
ULONG
(WINAPI *PFN_WDFPREDEVICEREMOVE)(
    _In_ LPCWSTR  InfPath,
    _In_opt_ LPCWSTR  InfSectionName
    );

//----------------------------------------------------------------------------
// To be called after (your) WDF driver is removed.
//----------------------------------------------------------------------------
ULONG
WINAPI
WdfPostDeviceRemove(
    _In_ LPCWSTR  InfPath,
    _In_opt_ LPCWSTR  InfSectionName
    );

typedef
ULONG
(WINAPI *PFN_WDFPOSTDEVICEREMOVE)(
    _In_ LPCWSTR  InfPath,
    _In_opt_ LPCWSTR  InfSectionName

    );



#endif // (NTDDI_VERSION >= NTDDI_WIN2K)


#endif // _WDFINSTALLER_1_9_H_
