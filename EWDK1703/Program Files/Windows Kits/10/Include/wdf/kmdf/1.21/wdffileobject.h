/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

_WdfVersionBuild_

Module Name:

    wdffileobject.h

Abstract:

    This header containts the Windows Driver Framework file object
    DDIs.

Environment:

    kernel mode only

Revision History:


--*/

//
// NOTE: This header is generated by stubwork.  Please make any 
//       modifications to the corresponding template files 
//       (.x or .y) and use stubwork to regenerate the header
//

#ifndef _WDFFILEOBJECT_H_
#define _WDFFILEOBJECT_H_

#ifndef WDF_EXTERN_C
  #ifdef __cplusplus
    #define WDF_EXTERN_C       extern "C"
    #define WDF_EXTERN_C_START extern "C" {
    #define WDF_EXTERN_C_END   }
  #else
    #define WDF_EXTERN_C
    #define WDF_EXTERN_C_START
    #define WDF_EXTERN_C_END
  #endif
#endif

WDF_EXTERN_C_START



#if (NTDDI_VERSION >= NTDDI_WIN2K)




//
// WDF Function: WdfFileObjectGetFileName
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
PUNICODE_STRING
(*PFN_WDFFILEOBJECTGETFILENAME)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFFILEOBJECT FileObject
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
PUNICODE_STRING
FORCEINLINE
WdfFileObjectGetFileName(
    _In_
    WDFFILEOBJECT FileObject
    )
{
    return ((PFN_WDFFILEOBJECTGETFILENAME) WdfFunctions[WdfFileObjectGetFileNameTableIndex])(WdfDriverGlobals, FileObject);
}

//
// WDF Function: WdfFileObjectGetFlags
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG
(*PFN_WDFFILEOBJECTGETFLAGS)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFFILEOBJECT FileObject
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
WdfFileObjectGetFlags(
    _In_
    WDFFILEOBJECT FileObject
    )
{
    return ((PFN_WDFFILEOBJECTGETFLAGS) WdfFunctions[WdfFileObjectGetFlagsTableIndex])(WdfDriverGlobals, FileObject);
}

//
// WDF Function: WdfFileObjectGetDevice
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
WDFDEVICE
(*PFN_WDFFILEOBJECTGETDEVICE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFFILEOBJECT FileObject
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
WDFDEVICE
FORCEINLINE
WdfFileObjectGetDevice(
    _In_
    WDFFILEOBJECT FileObject
    )
{
    return ((PFN_WDFFILEOBJECTGETDEVICE) WdfFunctions[WdfFileObjectGetDeviceTableIndex])(WdfDriverGlobals, FileObject);
}

//
// WDF Function: WdfFileObjectGetInitiatorProcessId
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG
(*PFN_WDFFILEOBJECTGETINITIATORPROCESSID)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFFILEOBJECT FileObject
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
WdfFileObjectGetInitiatorProcessId(
    _In_
    WDFFILEOBJECT FileObject
    )
{
    return ((PFN_WDFFILEOBJECTGETINITIATORPROCESSID) WdfFunctions[WdfFileObjectGetInitiatorProcessIdTableIndex])(WdfDriverGlobals, FileObject);
}

//
// WDF Function: WdfFileObjectWdmGetFileObject
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
PFILE_OBJECT
(*PFN_WDFFILEOBJECTWDMGETFILEOBJECT)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFFILEOBJECT FileObject
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
PFILE_OBJECT
FORCEINLINE
WdfFileObjectWdmGetFileObject(
    _In_
    WDFFILEOBJECT FileObject
    )
{
    return ((PFN_WDFFILEOBJECTWDMGETFILEOBJECT) WdfFunctions[WdfFileObjectWdmGetFileObjectTableIndex])(WdfDriverGlobals, FileObject);
}





#endif // (NTDDI_VERSION >= NTDDI_WIN2K)


WDF_EXTERN_C_END

#endif // _WDFFILEOBJECT_H_

