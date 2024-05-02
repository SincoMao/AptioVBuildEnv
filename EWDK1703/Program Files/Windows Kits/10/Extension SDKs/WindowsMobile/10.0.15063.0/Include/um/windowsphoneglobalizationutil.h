/*++

Copyright (c) Microsoft Corporation  All rights reserved.

File Name:

    winnls_ext.h

Abstract:

    Procedure declarations, constant definitions, and macros for
    Mango NLS Extended Compatibility.
    
    The declarations are taken from the Mango version of winnls.h.

--*/


#ifndef _WINNLS_EXTENDEDCOMPAT_EXTERNAL_
#define _WINNLS_EXTENDEDCOMPAT_EXTERNAL_

#include <winnls.h>


#ifdef __cplusplus
extern "C" {
#endif


#ifndef INVALID_TIMEZONE_ID
#define INVALID_TIMEZONE_ID 0xFFFFFFFF
#endif

/// <summary>
///     TIME_ZONE_INFORMATION_WITH_ID struct
///     To be used with GetTimeZoneList.
/// </summary>
/// <seealso>
///     TIME_ZONE_INFORMATION
/// </seealso>
typedef struct _TIME_ZONE_INFORMATION_WITH_ID {
    UINT uId;
    TIME_ZONE_INFORMATION tzi;
    WCHAR DisplayName[ 70 ];
    WCHAR ReferenceName[ 64 ];
} TIME_ZONE_INFORMATION_WITH_ID, *LPTIME_ZONE_INFORMATION_WITH_ID;


/// <summary>
///     GetTimeZoneList
///     Returns the registered list of timezones in the system
/// </summary>
/// <param name="rgTimeZoneList">
///     [OUT] TIME_ZONE_INFORMATION_WITH_ID *
///     An array of TIME_ZONE_INFORMATION_WITH_ID to be filled.
///     Caller is responsible for allocating/freeing the memory block.
///     This should NULL if cTimeZoneList == 0.
/// </param>
/// <param name="cTimeZoneList">
///     [IN] UINT
///     The number of elements to fill in rgTimeZoneList,
///     which must be allocated accordingly.
///     If set to 0, this function just returns the required # of elements
///     in the rgTimeZoneList array.
/// </param>
/// <returns>
///     UINT, size of array filled
/// </returns>
/// <remarks>
///     To be used by the Date + Time CPL, OOBE, auto time update
/// </remarks>
UINT
WINAPI
GetTimeZoneList (
    __out_opt TIME_ZONE_INFORMATION_WITH_ID *rgTimeZoneList,
    __in const UINT cTimeZoneList
);


#ifdef __cplusplus
}
#endif


#endif // _WINNLS_EXTENDEDCOMPAT_EXTERNAL_

