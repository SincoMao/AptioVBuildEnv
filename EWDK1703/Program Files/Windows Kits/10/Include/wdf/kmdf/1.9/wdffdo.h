/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

_WdfVersionBuild_

Module Name:

    WdfFdo.h

Abstract:

    This is the interface to the FDO functionality in the framework.  This also
    covers filters.

Environment:

    kernel mode only

Revision History:

--*/

#ifndef _WDFFDO_1_9_H_
#define _WDFFDO_1_9_H_



#if (NTDDI_VERSION >= NTDDI_WIN2K)



typedef
_Function_class_(EVT_WDF_DEVICE_FILTER_RESOURCE_REQUIREMENTS)
_IRQL_requires_same_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
EVT_WDF_DEVICE_FILTER_RESOURCE_REQUIREMENTS(
    _In_
    WDFDEVICE Device,
    _In_
    WDFIORESREQLIST IoResourceRequirementsList
    );

typedef EVT_WDF_DEVICE_FILTER_RESOURCE_REQUIREMENTS *PFN_WDF_DEVICE_FILTER_RESOURCE_REQUIREMENTS;

typedef
_Function_class_(EVT_WDF_DEVICE_REMOVE_ADDED_RESOURCES)
_IRQL_requires_same_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
EVT_WDF_DEVICE_REMOVE_ADDED_RESOURCES(
    _In_
    WDFDEVICE Device,
    _In_
    WDFCMRESLIST ResourcesRaw,
    _In_
    WDFCMRESLIST ResourcesTranslated
    );

typedef EVT_WDF_DEVICE_REMOVE_ADDED_RESOURCES *PFN_WDF_DEVICE_REMOVE_ADDED_RESOURCES;

typedef struct _WDF_FDO_EVENT_CALLBACKS {
    //
    // Size of this structure in bytes
    //
    ULONG Size;

    PFN_WDF_DEVICE_FILTER_RESOURCE_REQUIREMENTS EvtDeviceFilterAddResourceRequirements;

    PFN_WDF_DEVICE_FILTER_RESOURCE_REQUIREMENTS EvtDeviceFilterRemoveResourceRequirements;

    PFN_WDF_DEVICE_REMOVE_ADDED_RESOURCES EvtDeviceRemoveAddedResources;

} WDF_FDO_EVENT_CALLBACKS, *PWDF_FDO_EVENT_CALLBACKS;

VOID
FORCEINLINE
WDF_FDO_EVENT_CALLBACKS_INIT(
    _Out_ PWDF_FDO_EVENT_CALLBACKS Callbacks
    )
{
    RtlZeroMemory(Callbacks, sizeof(WDF_FDO_EVENT_CALLBACKS));
    Callbacks->Size = sizeof(WDF_FDO_EVENT_CALLBACKS);
}

//
// WDF Function: WdfFdoInitWdmGetPhysicalDevice
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
PDEVICE_OBJECT
(*PFN_WDFFDOINITWDMGETPHYSICALDEVICE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    PWDFDEVICE_INIT DeviceInit
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
PDEVICE_OBJECT
FORCEINLINE
WdfFdoInitWdmGetPhysicalDevice(
    _In_
    PWDFDEVICE_INIT DeviceInit
    )
{
    return ((PFN_WDFFDOINITWDMGETPHYSICALDEVICE) WdfFunctions[WdfFdoInitWdmGetPhysicalDeviceTableIndex])(WdfDriverGlobals, DeviceInit);
}

//
// WDF Function: WdfFdoInitOpenRegistryKey
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFFDOINITOPENREGISTRYKEY)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    PWDFDEVICE_INIT DeviceInit,
    _In_
    ULONG DeviceInstanceKeyType,
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
WdfFdoInitOpenRegistryKey(
    _In_
    PWDFDEVICE_INIT DeviceInit,
    _In_
    ULONG DeviceInstanceKeyType,
    _In_
    ACCESS_MASK DesiredAccess,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES KeyAttributes,
    _Out_
    WDFKEY* Key
    )
{
    return ((PFN_WDFFDOINITOPENREGISTRYKEY) WdfFunctions[WdfFdoInitOpenRegistryKeyTableIndex])(WdfDriverGlobals, DeviceInit, DeviceInstanceKeyType, DesiredAccess, KeyAttributes, Key);
}

//
// WDF Function: WdfFdoInitQueryProperty
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFFDOINITQUERYPROPERTY)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    PWDFDEVICE_INIT DeviceInit,
    _In_
    DEVICE_REGISTRY_PROPERTY DeviceProperty,
    _In_
    ULONG BufferLength,
    _Out_writes_bytes_all_opt_(BufferLength)
    PVOID PropertyBuffer,
    _Out_
    PULONG ResultLength
    );

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
FORCEINLINE
WdfFdoInitQueryProperty(
    _In_
    PWDFDEVICE_INIT DeviceInit,
    _In_
    DEVICE_REGISTRY_PROPERTY DeviceProperty,
    _In_
    ULONG BufferLength,
    _Out_writes_bytes_all_opt_(BufferLength)
    PVOID PropertyBuffer,
    _Out_
    PULONG ResultLength
    )
{
    return ((PFN_WDFFDOINITQUERYPROPERTY) WdfFunctions[WdfFdoInitQueryPropertyTableIndex])(WdfDriverGlobals, DeviceInit, DeviceProperty, BufferLength, PropertyBuffer, ResultLength);
}

//
// WDF Function: WdfFdoInitAllocAndQueryProperty
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFFDOINITALLOCANDQUERYPROPERTY)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    PWDFDEVICE_INIT DeviceInit,
    _In_
    DEVICE_REGISTRY_PROPERTY DeviceProperty,
    _In_
    _Strict_type_match_
    POOL_TYPE PoolType,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES PropertyMemoryAttributes,
    _Out_
    WDFMEMORY* PropertyMemory
    );

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
FORCEINLINE
WdfFdoInitAllocAndQueryProperty(
    _In_
    PWDFDEVICE_INIT DeviceInit,
    _In_
    DEVICE_REGISTRY_PROPERTY DeviceProperty,
    _In_
    _Strict_type_match_
    POOL_TYPE PoolType,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES PropertyMemoryAttributes,
    _Out_
    WDFMEMORY* PropertyMemory
    )
{
    return ((PFN_WDFFDOINITALLOCANDQUERYPROPERTY) WdfFunctions[WdfFdoInitAllocAndQueryPropertyTableIndex])(WdfDriverGlobals, DeviceInit, DeviceProperty, PoolType, PropertyMemoryAttributes, PropertyMemory);
}

//
// WDF Function: WdfFdoInitSetEventCallbacks
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
VOID
(*PFN_WDFFDOINITSETEVENTCALLBACKS)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    PWDFDEVICE_INIT DeviceInit,
    _In_
    PWDF_FDO_EVENT_CALLBACKS FdoEventCallbacks
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
VOID
FORCEINLINE
WdfFdoInitSetEventCallbacks(
    _In_
    PWDFDEVICE_INIT DeviceInit,
    _In_
    PWDF_FDO_EVENT_CALLBACKS FdoEventCallbacks
    )
{
    ((PFN_WDFFDOINITSETEVENTCALLBACKS) WdfFunctions[WdfFdoInitSetEventCallbacksTableIndex])(WdfDriverGlobals, DeviceInit, FdoEventCallbacks);
}

//
// WDF Function: WdfFdoInitSetFilter
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
VOID
(*PFN_WDFFDOINITSETFILTER)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    PWDFDEVICE_INIT DeviceInit
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
VOID
FORCEINLINE
WdfFdoInitSetFilter(
    _In_
    PWDFDEVICE_INIT DeviceInit
    )
{
    ((PFN_WDFFDOINITSETFILTER) WdfFunctions[WdfFdoInitSetFilterTableIndex])(WdfDriverGlobals, DeviceInit);
}

//
// WDF Function: WdfFdoInitSetDefaultChildListConfig
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
VOID
(*PFN_WDFFDOINITSETDEFAULTCHILDLISTCONFIG)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _Inout_
    PWDFDEVICE_INIT DeviceInit,
    _In_
    PWDF_CHILD_LIST_CONFIG Config,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES DefaultChildListAttributes
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
VOID
FORCEINLINE
WdfFdoInitSetDefaultChildListConfig(
    _Inout_
    PWDFDEVICE_INIT DeviceInit,
    _In_
    PWDF_CHILD_LIST_CONFIG Config,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES DefaultChildListAttributes
    )
{
    ((PFN_WDFFDOINITSETDEFAULTCHILDLISTCONFIG) WdfFunctions[WdfFdoInitSetDefaultChildListConfigTableIndex])(WdfDriverGlobals, DeviceInit, Config, DefaultChildListAttributes);
}

//
// WDF Function: WdfFdoQueryForInterface
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFFDOQUERYFORINTERFACE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDEVICE Fdo,
    _In_
    LPCGUID InterfaceType,
    _Out_
    PINTERFACE Interface,
    _In_
    USHORT Size,
    _In_
    USHORT Version,
    _In_opt_
    PVOID InterfaceSpecificData
    );

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
FORCEINLINE
WdfFdoQueryForInterface(
    _In_
    WDFDEVICE Fdo,
    _In_
    LPCGUID InterfaceType,
    _Out_
    PINTERFACE Interface,
    _In_
    USHORT Size,
    _In_
    USHORT Version,
    _In_opt_
    PVOID InterfaceSpecificData
    )
{
    return ((PFN_WDFFDOQUERYFORINTERFACE) WdfFunctions[WdfFdoQueryForInterfaceTableIndex])(WdfDriverGlobals, Fdo, InterfaceType, Interface, Size, Version, InterfaceSpecificData);
}

//
// WDF Function: WdfFdoGetDefaultChildList
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
WDFCHILDLIST
(*PFN_WDFFDOGETDEFAULTCHILDLIST)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDEVICE Fdo
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
WDFCHILDLIST
FORCEINLINE
WdfFdoGetDefaultChildList(
    _In_
    WDFDEVICE Fdo
    )
{
    return ((PFN_WDFFDOGETDEFAULTCHILDLIST) WdfFunctions[WdfFdoGetDefaultChildListTableIndex])(WdfDriverGlobals, Fdo);
}

//
// WDF Function: WdfFdoAddStaticChild
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFFDOADDSTATICCHILD)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDEVICE Fdo,
    _In_
    WDFDEVICE Child
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfFdoAddStaticChild(
    _In_
    WDFDEVICE Fdo,
    _In_
    WDFDEVICE Child
    )
{
    return ((PFN_WDFFDOADDSTATICCHILD) WdfFunctions[WdfFdoAddStaticChildTableIndex])(WdfDriverGlobals, Fdo, Child);
}

//
// WDF Function: WdfFdoLockStaticChildListForIteration
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFFDOLOCKSTATICCHILDLISTFORITERATION)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDEVICE Fdo
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfFdoLockStaticChildListForIteration(
    _In_
    WDFDEVICE Fdo
    )
{
    ((PFN_WDFFDOLOCKSTATICCHILDLISTFORITERATION) WdfFunctions[WdfFdoLockStaticChildListForIterationTableIndex])(WdfDriverGlobals, Fdo);
}

//
// WDF Function: WdfFdoRetrieveNextStaticChild
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
WDFDEVICE
(*PFN_WDFFDORETRIEVENEXTSTATICCHILD)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDEVICE Fdo,
    _In_opt_
    WDFDEVICE PreviousChild,
    _In_
    ULONG Flags
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFDEVICE
FORCEINLINE
WdfFdoRetrieveNextStaticChild(
    _In_
    WDFDEVICE Fdo,
    _In_opt_
    WDFDEVICE PreviousChild,
    _In_
    ULONG Flags
    )
{
    return ((PFN_WDFFDORETRIEVENEXTSTATICCHILD) WdfFunctions[WdfFdoRetrieveNextStaticChildTableIndex])(WdfDriverGlobals, Fdo, PreviousChild, Flags);
}

//
// WDF Function: WdfFdoUnlockStaticChildListFromIteration
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFFDOUNLOCKSTATICCHILDLISTFROMITERATION)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDEVICE Fdo
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfFdoUnlockStaticChildListFromIteration(
    _In_
    WDFDEVICE Fdo
    )
{
    ((PFN_WDFFDOUNLOCKSTATICCHILDLISTFROMITERATION) WdfFunctions[WdfFdoUnlockStaticChildListFromIterationTableIndex])(WdfDriverGlobals, Fdo);
}



#endif // (NTDDI_VERSION >= NTDDI_WIN2K)


#endif // _WDFFDO_1_9_H_
