/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

_WdfVersionBuild_

Module Name:

    WdfString.h

Abstract:

    This is the DDI for string handles.

Environment:

    kernel mode only

Revision History:

--*/

#ifndef _WDFSTRING_1_9_H_
#define _WDFSTRING_1_9_H_



#if (NTDDI_VERSION >= NTDDI_WIN2K)



//
// WDF Function: WdfStringCreate
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFSTRINGCREATE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_opt_
    PCUNICODE_STRING UnicodeString,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES StringAttributes,
    _Out_
    WDFSTRING* String
    );

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
FORCEINLINE
WdfStringCreate(
    _In_opt_
    PCUNICODE_STRING UnicodeString,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES StringAttributes,
    _Out_
    WDFSTRING* String
    )
{
    return ((PFN_WDFSTRINGCREATE) WdfFunctions[WdfStringCreateTableIndex])(WdfDriverGlobals, UnicodeString, StringAttributes, String);
}

//
// WDF Function: WdfStringGetUnicodeString
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
VOID
(*PFN_WDFSTRINGGETUNICODESTRING)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFSTRING String,
    _Out_
    PUNICODE_STRING UnicodeString
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
VOID
FORCEINLINE
WdfStringGetUnicodeString(
    _In_
    WDFSTRING String,
    _Out_
    PUNICODE_STRING UnicodeString
    )
{
    ((PFN_WDFSTRINGGETUNICODESTRING) WdfFunctions[WdfStringGetUnicodeStringTableIndex])(WdfDriverGlobals, String, UnicodeString);
}



#endif // (NTDDI_VERSION >= NTDDI_WIN2K)


#endif // _WDFSTRING_1_9_H_
