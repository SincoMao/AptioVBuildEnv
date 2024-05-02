/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

_WdfVersionBuild_

Module Name:

    wdfdriver.h

Abstract:

    This is the interfaces for the Windows Driver Framework Driver object

Environment:

    kernel mode only

Revision History:

--*/

#ifndef _WDFDRIVER_1_9_H_
#define _WDFDRIVER_1_9_H_



#if (NTDDI_VERSION >= NTDDI_WIN2K)

typedef enum _WDF_DRIVER_INIT_FLAGS {
    WdfDriverInitNonPnpDriver = 0x00000001, //  If set, no Add Device routine is assigned.
    WdfDriverInitNoDispatchOverride = 0x00000002, //  Useful for miniports.
    WdfVerifyOn = 0x00000004, //  Controls whether WDFVERIFY macros are live.
    WdfVerifierOn = 0x00000008, //  Top level verififer flag.
} WDF_DRIVER_INIT_FLAGS;



#define WDF_TRACE_ID ('TRAC')

//
// Callbacks for FxDriver
//

typedef
_Function_class_(EVT_WDF_DRIVER_DEVICE_ADD)
_IRQL_requires_same_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
EVT_WDF_DRIVER_DEVICE_ADD(
    _In_
    WDFDRIVER Driver,
    _Inout_
    PWDFDEVICE_INIT DeviceInit
    );

typedef EVT_WDF_DRIVER_DEVICE_ADD *PFN_WDF_DRIVER_DEVICE_ADD;

typedef
_Function_class_(EVT_WDF_DRIVER_UNLOAD)
_IRQL_requires_same_
_IRQL_requires_max_(PASSIVE_LEVEL)
VOID
EVT_WDF_DRIVER_UNLOAD(
    _In_
    WDFDRIVER Driver
    );

typedef EVT_WDF_DRIVER_UNLOAD *PFN_WDF_DRIVER_UNLOAD;


//
// Used by WPP Tracing (modeled after WPP's WppTraceCallback (in km-init.tpl))
//
typedef
_Function_class_(EVT_WDF_TRACE_CALLBACK)
_IRQL_requires_same_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
EVT_WDF_TRACE_CALLBACK(
    _In_
    UCHAR   minorFunction,
    _In_opt_
    PVOID   dataPath,
    _In_
    ULONG   bufferLength,
    _Inout_updates_bytes_(bufferLength)
    PVOID   buffer,
    _In_
    PVOID   context,
    _Out_
    PULONG  size
    );

typedef EVT_WDF_TRACE_CALLBACK *PFN_WDF_TRACE_CALLBACK;

typedef struct _WDF_DRIVER_CONFIG {
    //
    // Size of this structure in bytes
    //
    ULONG Size;

    //
    // Event callbacks
    //
    PFN_WDF_DRIVER_DEVICE_ADD EvtDriverDeviceAdd;

    PFN_WDF_DRIVER_UNLOAD    EvtDriverUnload;

    //
    // Combination of WDF_DRIVER_INIT_FLAGS values
    //
    ULONG DriverInitFlags;

    //
    // Pool tag to use for all allocations made by the framework on behalf of
    // the client driver.
    //
    ULONG DriverPoolTag;

} WDF_DRIVER_CONFIG, *PWDF_DRIVER_CONFIG;

VOID
FORCEINLINE
WDF_DRIVER_CONFIG_INIT(
    _Out_ PWDF_DRIVER_CONFIG Config,
    _In_opt_ PFN_WDF_DRIVER_DEVICE_ADD EvtDriverDeviceAdd
    )
{
    RtlZeroMemory(Config, sizeof(WDF_DRIVER_CONFIG));

    Config->Size = sizeof(WDF_DRIVER_CONFIG);
    Config->EvtDriverDeviceAdd = EvtDriverDeviceAdd;
}

typedef struct _WDF_DRIVER_VERSION_AVAILABLE_PARAMS {
    //
    // Size of the structure in bytes
    //
    ULONG Size;

    //
    // Major Version requested
    //
    ULONG MajorVersion;

    //
    // Minor Version requested
    //
    ULONG MinorVersion;

} WDF_DRIVER_VERSION_AVAILABLE_PARAMS, *PWDF_DRIVER_VERSION_AVAILABLE_PARAMS;

VOID
FORCEINLINE
WDF_DRIVER_VERSION_AVAILABLE_PARAMS_INIT(
    _Out_ PWDF_DRIVER_VERSION_AVAILABLE_PARAMS Params,
    _In_ ULONG MajorVersion,
    _In_ ULONG MinorVersion
    )
{
    RtlZeroMemory(Params, sizeof(WDF_DRIVER_VERSION_AVAILABLE_PARAMS));

    Params->Size = sizeof(WDF_DRIVER_VERSION_AVAILABLE_PARAMS);
    Params->MajorVersion = MajorVersion;
    Params->MinorVersion = MinorVersion;
}

WDFDRIVER
FORCEINLINE
WdfGetDriver(
    VOID
    )
{
    return WdfDriverGlobals->Driver;
}

//
// WDF Function: WdfDriverCreate
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFDRIVERCREATE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    PDRIVER_OBJECT DriverObject,
    _In_
    PCUNICODE_STRING RegistryPath,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES DriverAttributes,
    _In_
    PWDF_DRIVER_CONFIG DriverConfig,
    _Out_opt_
    WDFDRIVER* Driver
    );

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
FORCEINLINE
WdfDriverCreate(
    _In_
    PDRIVER_OBJECT DriverObject,
    _In_
    PCUNICODE_STRING RegistryPath,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES DriverAttributes,
    _In_
    PWDF_DRIVER_CONFIG DriverConfig,
    _Out_opt_
    WDFDRIVER* Driver
    )
{
    return ((PFN_WDFDRIVERCREATE) WdfFunctions[WdfDriverCreateTableIndex])(WdfDriverGlobals, DriverObject, RegistryPath, DriverAttributes, DriverConfig, Driver);
}

//
// WDF Function: WdfDriverGetRegistryPath
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
PWSTR
(*PFN_WDFDRIVERGETREGISTRYPATH)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDRIVER Driver
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
PWSTR
FORCEINLINE
WdfDriverGetRegistryPath(
    _In_
    WDFDRIVER Driver
    )
{
    return ((PFN_WDFDRIVERGETREGISTRYPATH) WdfFunctions[WdfDriverGetRegistryPathTableIndex])(WdfDriverGlobals, Driver);
}

//
// WDF Function: WdfDriverWdmGetDriverObject
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
PDRIVER_OBJECT
(*PFN_WDFDRIVERWDMGETDRIVEROBJECT)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDRIVER Driver
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
PDRIVER_OBJECT
FORCEINLINE
WdfDriverWdmGetDriverObject(
    _In_
    WDFDRIVER Driver
    )
{
    return ((PFN_WDFDRIVERWDMGETDRIVEROBJECT) WdfFunctions[WdfDriverWdmGetDriverObjectTableIndex])(WdfDriverGlobals, Driver);
}

//
// WDF Function: WdfDriverOpenParametersRegistryKey
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFDRIVEROPENPARAMETERSREGISTRYKEY)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDRIVER Driver,
    _In_
    ACCESS_MASK DesiredAccess,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES KeyAttributes,
    _Out_
    WDFKEY* Key
    );

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
FORCEINLINE
WdfDriverOpenParametersRegistryKey(
    _In_
    WDFDRIVER Driver,
    _In_
    ACCESS_MASK DesiredAccess,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES KeyAttributes,
    _Out_
    WDFKEY* Key
    )
{
    return ((PFN_WDFDRIVEROPENPARAMETERSREGISTRYKEY) WdfFunctions[WdfDriverOpenParametersRegistryKeyTableIndex])(WdfDriverGlobals, Driver, DesiredAccess, KeyAttributes, Key);
}

//
// WDF Function: WdfWdmDriverGetWdfDriverHandle
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
WDFDRIVER
(*PFN_WDFWDMDRIVERGETWDFDRIVERHANDLE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    PDRIVER_OBJECT DriverObject
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
WDFDRIVER
FORCEINLINE
WdfWdmDriverGetWdfDriverHandle(
    _In_
    PDRIVER_OBJECT DriverObject
    )
{
    return ((PFN_WDFWDMDRIVERGETWDFDRIVERHANDLE) WdfFunctions[WdfWdmDriverGetWdfDriverHandleTableIndex])(WdfDriverGlobals, DriverObject);
}

//
// WDF Function: WdfDriverRegisterTraceInfo
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFDRIVERREGISTERTRACEINFO)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    PDRIVER_OBJECT DriverObject,
    _In_
    PFN_WDF_TRACE_CALLBACK EvtTraceCallback,
    _In_
    PVOID ControlBlock
    );

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
FORCEINLINE
WdfDriverRegisterTraceInfo(
    _In_
    PDRIVER_OBJECT DriverObject,
    _In_
    PFN_WDF_TRACE_CALLBACK EvtTraceCallback,
    _In_
    PVOID ControlBlock
    )
{
    return ((PFN_WDFDRIVERREGISTERTRACEINFO) WdfFunctions[WdfDriverRegisterTraceInfoTableIndex])(WdfDriverGlobals, DriverObject, EvtTraceCallback, ControlBlock);
}

//
// WDF Function: WdfDriverRetrieveVersionString
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFDRIVERRETRIEVEVERSIONSTRING)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDRIVER Driver,
    _In_
    WDFSTRING String
    );

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
FORCEINLINE
WdfDriverRetrieveVersionString(
    _In_
    WDFDRIVER Driver,
    _In_
    WDFSTRING String
    )
{
    return ((PFN_WDFDRIVERRETRIEVEVERSIONSTRING) WdfFunctions[WdfDriverRetrieveVersionStringTableIndex])(WdfDriverGlobals, Driver, String);
}

//
// WDF Function: WdfDriverIsVersionAvailable
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
BOOLEAN
(*PFN_WDFDRIVERISVERSIONAVAILABLE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDRIVER Driver,
    _In_
    PWDF_DRIVER_VERSION_AVAILABLE_PARAMS VersionAvailableParams
    );

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
BOOLEAN
FORCEINLINE
WdfDriverIsVersionAvailable(
    _In_
    WDFDRIVER Driver,
    _In_
    PWDF_DRIVER_VERSION_AVAILABLE_PARAMS VersionAvailableParams
    )
{
    return ((PFN_WDFDRIVERISVERSIONAVAILABLE) WdfFunctions[WdfDriverIsVersionAvailableTableIndex])(WdfDriverGlobals, Driver, VersionAvailableParams);
}



#endif // (NTDDI_VERSION >= NTDDI_WIN2K)


#endif // _WDFDRIVER_1_9_H_
