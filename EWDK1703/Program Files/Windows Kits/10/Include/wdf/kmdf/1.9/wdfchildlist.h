/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

_WdfVersionBuild_

Module Name:

    WdfChildList.hpp

Abstract:

    This module defines the set of APIs to manipulate a WDFCHILDLIST handle.  A
    WDFCHILDLIST handle maintains a list of descriptions representing
    dynamically enumerated child devices.

Environment:

    kernel mode only

Revision History:

--*/

#ifndef _WDFCHILDLIST_1_9_H_
#define _WDFCHILDLIST_1_9_H_



#if (NTDDI_VERSION >= NTDDI_WIN2K)

typedef enum _WDF_CHILD_LIST_RETRIEVE_DEVICE_STATUS {
    WdfChildListRetrieveDeviceUndefined = 0,
    WdfChildListRetrieveDeviceSuccess,
    WdfChildListRetrieveDeviceNotYetCreated,
    WdfChildListRetrieveDeviceNoSuchDevice,
} WDF_CHILD_LIST_RETRIEVE_DEVICE_STATUS, *PWDF_CHILD_LIST_RETRIEVE_DEVICE_STATUS;

typedef enum _WDF_RETRIEVE_CHILD_FLAGS {
    WdfRetrieveUnspecified = 0x0000,
    WdfRetrievePresentChildren = 0x0001,
    WdfRetrieveMissingChildren = 0x0002,
    WdfRetrievePendingChildren = 0x0004,
    WdfRetrieveAddedChildren = (WdfRetrievePresentChildren | WdfRetrievePendingChildren),
    WdfRetrieveAllChildren = (WdfRetrievePresentChildren | WdfRetrievePendingChildren | WdfRetrieveMissingChildren),
} WDF_RETRIEVE_CHILD_FLAGS;



typedef struct _WDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER {
    //
    // Size in bytes of the entire description, including this header.
    //
    // Same value as WDF_CHILD_LIST_CONFIG::IdentificationDescriptionSize
    // Used as a sanity check.
    //
    ULONG IdentificationDescriptionSize;
}   WDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER,
  *PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER;

VOID
FORCEINLINE
WDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER_INIT(
    _Out_ PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER Header,
    _In_ ULONG IdentificationDescriptionSize
    )
{
    RtlZeroMemory(Header, IdentificationDescriptionSize);
    Header->IdentificationDescriptionSize = IdentificationDescriptionSize;
}

typedef struct _WDF_CHILD_ADDRESS_DESCRIPTION_HEADER {
    //
    // Size in bytes of the entire description, including this header.
    //
    // Same value as WDF_CHILD_LIST_CONFIG::AddressDescriptionSize
    // Used as a sanity check.
    //
    ULONG AddressDescriptionSize;
}   WDF_CHILD_ADDRESS_DESCRIPTION_HEADER,
  *PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER;

VOID
FORCEINLINE
WDF_CHILD_ADDRESS_DESCRIPTION_HEADER_INIT(
    _Out_ PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER Header,
    _In_ ULONG AddressDescriptionSize
    )
{
    RtlZeroMemory(Header, AddressDescriptionSize);
    Header->AddressDescriptionSize = AddressDescriptionSize;
}

typedef
_Function_class_(EVT_WDF_CHILD_LIST_CREATE_DEVICE)
_IRQL_requires_same_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
EVT_WDF_CHILD_LIST_CREATE_DEVICE(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription,
    _In_
    PWDFDEVICE_INIT ChildInit
    );

typedef EVT_WDF_CHILD_LIST_CREATE_DEVICE *PFN_WDF_CHILD_LIST_CREATE_DEVICE;

typedef
_Function_class_(EVT_WDF_CHILD_LIST_SCAN_FOR_CHILDREN)
_IRQL_requires_same_
_IRQL_requires_max_(PASSIVE_LEVEL)
VOID
EVT_WDF_CHILD_LIST_SCAN_FOR_CHILDREN(
    _In_
    WDFCHILDLIST ChildList
    );

typedef EVT_WDF_CHILD_LIST_SCAN_FOR_CHILDREN *PFN_WDF_CHILD_LIST_SCAN_FOR_CHILDREN;

typedef
_Function_class_(EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_COPY)
_IRQL_requires_same_
_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_COPY(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER SourceIdentificationDescription,
    _Out_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER DestinationIdentificationDescription
    );

typedef EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_COPY *PFN_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_COPY;

typedef
_Function_class_(EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_DUPLICATE)
_IRQL_requires_same_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_DUPLICATE(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER SourceIdentificationDescription,
    _Out_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER DestinationIdentificationDescription
    );

typedef EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_DUPLICATE *PFN_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_DUPLICATE;

typedef
_Function_class_(EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_COMPARE)
_IRQL_requires_same_
_IRQL_requires_max_(DISPATCH_LEVEL)
BOOLEAN
EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_COMPARE(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER FirstIdentificationDescription,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER SecondIdentificationDescription
    );

typedef EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_COMPARE *PFN_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_COMPARE;

typedef
_Function_class_(EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_CLEANUP)
_IRQL_requires_same_
_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_CLEANUP(
    _In_
    WDFCHILDLIST ChildList,
    _Out_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription
    );

typedef EVT_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_CLEANUP *PFN_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_CLEANUP;

typedef
_Function_class_(EVT_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_COPY)
_IRQL_requires_same_
_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
EVT_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_COPY(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER SourceAddressDescription,
    _Out_
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER DestinationAddressDescription
    );

typedef EVT_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_COPY *PFN_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_COPY;

typedef
_Function_class_(EVT_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_DUPLICATE)
_IRQL_requires_same_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
EVT_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_DUPLICATE(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER SourceAddressDescription,
    _Out_
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER DestinationAddressDescription
    );

typedef EVT_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_DUPLICATE *PFN_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_DUPLICATE;

typedef
_Function_class_(EVT_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_CLEANUP)
_IRQL_requires_same_
_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
EVT_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_CLEANUP(
    _In_
    WDFCHILDLIST ChildList,
    _Inout_
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER AddressDescription
    );

typedef EVT_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_CLEANUP *PFN_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_CLEANUP;

typedef
_Function_class_(EVT_WDF_CHILD_LIST_DEVICE_REENUMERATED)
_IRQL_requires_same_
_IRQL_requires_max_(DISPATCH_LEVEL)
BOOLEAN
EVT_WDF_CHILD_LIST_DEVICE_REENUMERATED(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    WDFDEVICE OldDevice,
    _In_
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER OldAddressDescription,
    _Out_
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER NewAddressDescription
    );

typedef EVT_WDF_CHILD_LIST_DEVICE_REENUMERATED *PFN_WDF_CHILD_LIST_DEVICE_REENUMERATED;

typedef struct _WDF_CHILD_RETRIEVE_INFO {
    //
    // Size of the structure in bytes
    //
    ULONG Size;

    //
    // Must be a valid pointer when passed in, copied into upon success
    //
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription;

    //
    // Optional pointer when passed in, copied into upon success
    //
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER AddressDescription;

    //
    // Status of the returned device
    //
    WDF_CHILD_LIST_RETRIEVE_DEVICE_STATUS Status;

    //
    // If provided, will be used for searching through the list of devices
    // instead of the default list ID compare function
    //
    PFN_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_COMPARE EvtChildListIdentificationDescriptionCompare;

} WDF_CHILD_RETRIEVE_INFO, *PWDF_CHILD_RETRIEVE_INFO;

VOID
FORCEINLINE
WDF_CHILD_RETRIEVE_INFO_INIT(
    _Out_ PWDF_CHILD_RETRIEVE_INFO Info,
    _In_ PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription
    )
{
    RtlZeroMemory(Info, sizeof(WDF_CHILD_RETRIEVE_INFO));

    Info->Size = sizeof(WDF_CHILD_RETRIEVE_INFO);
    Info->IdentificationDescription = IdentificationDescription;
}

typedef struct _WDF_CHILD_LIST_CONFIG {
    //
    // Size of this structure in bytes
    //
    ULONG Size;

    //
    // The size in bytes of an identificaiton description to be used with the
    // created WDFCHILDLIST handle
    //
    ULONG IdentificationDescriptionSize;

    //
    // Optional size in bytes of an address description to be used with the
    // created WDFCHILDLIST handle.
    //
    ULONG AddressDescriptionSize;

    //
    // Required callback to be invoked when a description on the device list
    // needs to be converted into a real WDFDEVICE handle.
    //
    PFN_WDF_CHILD_LIST_CREATE_DEVICE EvtChildListCreateDevice;

    //
    // Optional callback to be invoked when the device list needs to be
    // rescanned.  This function will be called after the device has entered D0
    // and been fully initialized but before I/O has started.
    //
    PFN_WDF_CHILD_LIST_SCAN_FOR_CHILDREN EvtChildListScanForChildren;

    //
    // Optional callback to be invoked when an identification description needs
    // to be copied from one location to another.
    //
    // If left NULL, RtlCopyMemory will be used to copy the description.
    //
    PFN_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_COPY EvtChildListIdentificationDescriptionCopy;

    //
    // Optional callback to be invoked when an identification description needs
    // to be duplicated.  As opposed to EvtChildListIdentificationDescriptionCopy,
    // EvtChildListIdentificationDescriptionDuplicate can fail.
    //
    PFN_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_DUPLICATE EvtChildListIdentificationDescriptionDuplicate;

    //
    // Optional callback to be invoked when an identification description needs
    // to be cleaned up.  This function should *NOT* free the description passed
    // to it, just free any associated resources.
    //
    PFN_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_CLEANUP EvtChildListIdentificationDescriptionCleanup;

    //
    // Optional callback to be invoked when an identification description needs
    // to be compared with another identificaiton description.
    //
    // If left NULL, RtlCompareMemory will be used to compare the two
    // descriptions.
    //
    PFN_WDF_CHILD_LIST_IDENTIFICATION_DESCRIPTION_COMPARE EvtChildListIdentificationDescriptionCompare;

    //
    // Optional callback to be invoked when an address description needs
    // to be copied from one location to another.
    //
    // If left NULL, RtlCopyMemory will be used to copy the description.
    //
    PFN_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_COPY EvtChildListAddressDescriptionCopy;

    //
    // Optional callback to be invoked when an address description needs to be
    // duplicated.  As opposed to EvtChildListAddressDescriptionCopy,
    // EvtChildListAddressDescriptionDuplicate can fail.
    //
    PFN_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_DUPLICATE EvtChildListAddressDescriptionDuplicate;

    //
    // Optional callback to be invoked when an address description needs to be
    // cleaned up.  This function should *NOT* free the description passed to
    // it, just free any associated resources.
    //
    PFN_WDF_CHILD_LIST_ADDRESS_DESCRIPTION_CLEANUP EvtChildListAddressDescriptionCleanup;

    //
    // If provided, will be called when the child's stack requests that the
    // child be reenumerated.  Returning TRUE allows for the reenumeration to
    // proceed.  FALSE will no reenumerate the stack.
    //
    PFN_WDF_CHILD_LIST_DEVICE_REENUMERATED EvtChildListDeviceReenumerated;

} WDF_CHILD_LIST_CONFIG, *PWDF_CHILD_LIST_CONFIG;

VOID
FORCEINLINE
WDF_CHILD_LIST_CONFIG_INIT(
    _Out_ PWDF_CHILD_LIST_CONFIG Config,
    _In_  ULONG IdentificationDescriptionSize,
    _In_  PFN_WDF_CHILD_LIST_CREATE_DEVICE EvtChildListCreateDevice
    )
{
    RtlZeroMemory(Config, sizeof(WDF_CHILD_LIST_CONFIG));

    Config->Size = sizeof(WDF_CHILD_LIST_CONFIG);
    Config->IdentificationDescriptionSize = IdentificationDescriptionSize;
    Config->EvtChildListCreateDevice = EvtChildListCreateDevice;
}

typedef struct _WDF_CHILD_LIST_ITERATOR {
    //
    // Size of this structure in bytes
    //
    ULONG Size;

    //
    // What type of devices to return, see WDF_RETRIEVE_CHILD_FLAGS for
    // flag values
    //
    //
    ULONG Flags;

    //
    // For internal use, treat this field as opaque
    //
    PVOID Reserved[4];

} WDF_CHILD_LIST_ITERATOR, *PWDF_CHILD_LIST_ITERATOR;

VOID
FORCEINLINE
WDF_CHILD_LIST_ITERATOR_INIT(
    _Out_ PWDF_CHILD_LIST_ITERATOR Iterator,
    _In_ ULONG Flags
    )
{
    RtlZeroMemory(Iterator, sizeof(WDF_CHILD_LIST_ITERATOR));

    Iterator->Size = sizeof(WDF_CHILD_LIST_ITERATOR);
    Iterator->Flags = Flags;
}

//
// WDF Function: WdfChildListCreate
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFCHILDLISTCREATE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFDEVICE Device,
    _In_
    PWDF_CHILD_LIST_CONFIG Config,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES ChildListAttributes,
    _Out_
    WDFCHILDLIST* ChildList
    );

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
FORCEINLINE
WdfChildListCreate(
    _In_
    WDFDEVICE Device,
    _In_
    PWDF_CHILD_LIST_CONFIG Config,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES ChildListAttributes,
    _Out_
    WDFCHILDLIST* ChildList
    )
{
    return ((PFN_WDFCHILDLISTCREATE) WdfFunctions[WdfChildListCreateTableIndex])(WdfDriverGlobals, Device, Config, ChildListAttributes, ChildList);
}

//
// WDF Function: WdfChildListGetDevice
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
WDFDEVICE
(*PFN_WDFCHILDLISTGETDEVICE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
WDFDEVICE
FORCEINLINE
WdfChildListGetDevice(
    _In_
    WDFCHILDLIST ChildList
    )
{
    return ((PFN_WDFCHILDLISTGETDEVICE) WdfFunctions[WdfChildListGetDeviceTableIndex])(WdfDriverGlobals, ChildList);
}

//
// WDF Function: WdfChildListRetrievePdo
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
WDFDEVICE
(*PFN_WDFCHILDLISTRETRIEVEPDO)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList,
    _Inout_
    PWDF_CHILD_RETRIEVE_INFO RetrieveInfo
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFDEVICE
FORCEINLINE
WdfChildListRetrievePdo(
    _In_
    WDFCHILDLIST ChildList,
    _Inout_
    PWDF_CHILD_RETRIEVE_INFO RetrieveInfo
    )
{
    return ((PFN_WDFCHILDLISTRETRIEVEPDO) WdfFunctions[WdfChildListRetrievePdoTableIndex])(WdfDriverGlobals, ChildList, RetrieveInfo);
}

//
// WDF Function: WdfChildListRetrieveAddressDescription
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFCHILDLISTRETRIEVEADDRESSDESCRIPTION)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription,
    _Inout_
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER AddressDescription
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfChildListRetrieveAddressDescription(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription,
    _Inout_
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER AddressDescription
    )
{
    return ((PFN_WDFCHILDLISTRETRIEVEADDRESSDESCRIPTION) WdfFunctions[WdfChildListRetrieveAddressDescriptionTableIndex])(WdfDriverGlobals, ChildList, IdentificationDescription, AddressDescription);
}

//
// WDF Function: WdfChildListBeginScan
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFCHILDLISTBEGINSCAN)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfChildListBeginScan(
    _In_
    WDFCHILDLIST ChildList
    )
{
    ((PFN_WDFCHILDLISTBEGINSCAN) WdfFunctions[WdfChildListBeginScanTableIndex])(WdfDriverGlobals, ChildList);
}

//
// WDF Function: WdfChildListEndScan
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFCHILDLISTENDSCAN)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfChildListEndScan(
    _In_
    WDFCHILDLIST ChildList
    )
{
    ((PFN_WDFCHILDLISTENDSCAN) WdfFunctions[WdfChildListEndScanTableIndex])(WdfDriverGlobals, ChildList);
}

//
// WDF Function: WdfChildListBeginIteration
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFCHILDLISTBEGINITERATION)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_LIST_ITERATOR Iterator
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfChildListBeginIteration(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_LIST_ITERATOR Iterator
    )
{
    ((PFN_WDFCHILDLISTBEGINITERATION) WdfFunctions[WdfChildListBeginIterationTableIndex])(WdfDriverGlobals, ChildList, Iterator);
}

//
// WDF Function: WdfChildListRetrieveNextDevice
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFCHILDLISTRETRIEVENEXTDEVICE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_LIST_ITERATOR Iterator,
    _Out_
    WDFDEVICE* Device,
    _Inout_opt_
    PWDF_CHILD_RETRIEVE_INFO Info
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfChildListRetrieveNextDevice(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_LIST_ITERATOR Iterator,
    _Out_
    WDFDEVICE* Device,
    _Inout_opt_
    PWDF_CHILD_RETRIEVE_INFO Info
    )
{
    return ((PFN_WDFCHILDLISTRETRIEVENEXTDEVICE) WdfFunctions[WdfChildListRetrieveNextDeviceTableIndex])(WdfDriverGlobals, ChildList, Iterator, Device, Info);
}

//
// WDF Function: WdfChildListEndIteration
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFCHILDLISTENDITERATION)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_LIST_ITERATOR Iterator
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfChildListEndIteration(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_LIST_ITERATOR Iterator
    )
{
    ((PFN_WDFCHILDLISTENDITERATION) WdfFunctions[WdfChildListEndIterationTableIndex])(WdfDriverGlobals, ChildList, Iterator);
}

//
// WDF Function: WdfChildListAddOrUpdateChildDescriptionAsPresent
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFCHILDLISTADDORUPDATECHILDDESCRIPTIONASPRESENT)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription,
    _In_opt_
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER AddressDescription
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfChildListAddOrUpdateChildDescriptionAsPresent(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription,
    _In_opt_
    PWDF_CHILD_ADDRESS_DESCRIPTION_HEADER AddressDescription
    )
{
    return ((PFN_WDFCHILDLISTADDORUPDATECHILDDESCRIPTIONASPRESENT) WdfFunctions[WdfChildListAddOrUpdateChildDescriptionAsPresentTableIndex])(WdfDriverGlobals, ChildList, IdentificationDescription, AddressDescription);
}

//
// WDF Function: WdfChildListUpdateChildDescriptionAsMissing
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFCHILDLISTUPDATECHILDDESCRIPTIONASMISSING)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfChildListUpdateChildDescriptionAsMissing(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription
    )
{
    return ((PFN_WDFCHILDLISTUPDATECHILDDESCRIPTIONASMISSING) WdfFunctions[WdfChildListUpdateChildDescriptionAsMissingTableIndex])(WdfDriverGlobals, ChildList, IdentificationDescription);
}

//
// WDF Function: WdfChildListUpdateAllChildDescriptionsAsPresent
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFCHILDLISTUPDATEALLCHILDDESCRIPTIONSASPRESENT)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfChildListUpdateAllChildDescriptionsAsPresent(
    _In_
    WDFCHILDLIST ChildList
    )
{
    ((PFN_WDFCHILDLISTUPDATEALLCHILDDESCRIPTIONSASPRESENT) WdfFunctions[WdfChildListUpdateAllChildDescriptionsAsPresentTableIndex])(WdfDriverGlobals, ChildList);
}

//
// WDF Function: WdfChildListRequestChildEject
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
BOOLEAN
(*PFN_WDFCHILDLISTREQUESTCHILDEJECT)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
BOOLEAN
FORCEINLINE
WdfChildListRequestChildEject(
    _In_
    WDFCHILDLIST ChildList,
    _In_
    PWDF_CHILD_IDENTIFICATION_DESCRIPTION_HEADER IdentificationDescription
    )
{
    return ((PFN_WDFCHILDLISTREQUESTCHILDEJECT) WdfFunctions[WdfChildListRequestChildEjectTableIndex])(WdfDriverGlobals, ChildList, IdentificationDescription);
}



#endif // (NTDDI_VERSION >= NTDDI_WIN2K)


#endif // _WDFCHILDLIST_1_9_H_
