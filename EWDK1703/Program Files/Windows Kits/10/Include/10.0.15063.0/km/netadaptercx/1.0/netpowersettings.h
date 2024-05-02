/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    NetPowerSettings.h

Abstract:

    This is the interfaces for the NetPowerSettings

Environment:

    kernel mode only

Revision History:

--*/

//
// NOTE: This header is generated by stubwork.  Please make any 
//       modifications to the corresponding template files 
//       (.x or .y) and use stubwork to regenerate the header
//

#ifndef _NETPOWERSETTINGS_H_
#define _NETPOWERSETTINGS_H_

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




//
// NET Function: NetPowerSettingsGetWakePatternCount
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG
(*PFN_NETPOWERSETTINGSGETWAKEPATTERNCOUNT)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
NetPowerSettingsGetWakePatternCount(
    _In_
    NETPOWERSETTINGS NetPowerSettings
    )
{
    return ((PFN_NETPOWERSETTINGSGETWAKEPATTERNCOUNT) NetFunctions[NetPowerSettingsGetWakePatternCountTableIndex])(NetDriverGlobals, NetPowerSettings);
}

//
// NET Function: NetPowerSettingsGetWakePatternCountForType
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG
(*PFN_NETPOWERSETTINGSGETWAKEPATTERNCOUNTFORTYPE)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    NDIS_PM_WOL_PACKET WakePatternType
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
NetPowerSettingsGetWakePatternCountForType(
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    NDIS_PM_WOL_PACKET WakePatternType
    )
{
    return ((PFN_NETPOWERSETTINGSGETWAKEPATTERNCOUNTFORTYPE) NetFunctions[NetPowerSettingsGetWakePatternCountForTypeTableIndex])(NetDriverGlobals, NetPowerSettings, WakePatternType);
}

//
// NET Function: NetPowerSettingsGetWakePattern
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
PNDIS_PM_WOL_PATTERN
(*PFN_NETPOWERSETTINGSGETWAKEPATTERN)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    ULONG Index
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
PNDIS_PM_WOL_PATTERN
FORCEINLINE
NetPowerSettingsGetWakePattern(
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    ULONG Index
    )
{
    return ((PFN_NETPOWERSETTINGSGETWAKEPATTERN) NetFunctions[NetPowerSettingsGetWakePatternTableIndex])(NetDriverGlobals, NetPowerSettings, Index);
}

//
// NET Function: NetPowerSettingsIsWakePatternEnabled
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
BOOLEAN
(*PFN_NETPOWERSETTINGSISWAKEPATTERNENABLED)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    PNDIS_PM_WOL_PATTERN NdisPmWolPattern
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
BOOLEAN
FORCEINLINE
NetPowerSettingsIsWakePatternEnabled(
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    PNDIS_PM_WOL_PATTERN NdisPmWolPattern
    )
{
    return ((PFN_NETPOWERSETTINGSISWAKEPATTERNENABLED) NetFunctions[NetPowerSettingsIsWakePatternEnabledTableIndex])(NetDriverGlobals, NetPowerSettings, NdisPmWolPattern);
}

//
// NET Function: NetPowerSettingsGetEnabledWakeUpFlags
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG
(*PFN_NETPOWERSETTINGSGETENABLEDWAKEUPFLAGS)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
NetPowerSettingsGetEnabledWakeUpFlags(
    _In_
    NETPOWERSETTINGS NetPowerSettings
    )
{
    return ((PFN_NETPOWERSETTINGSGETENABLEDWAKEUPFLAGS) NetFunctions[NetPowerSettingsGetEnabledWakeUpFlagsTableIndex])(NetDriverGlobals, NetPowerSettings);
}

//
// NET Function: NetPowerSettingsGetEnabledWakePatterns
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG
(*PFN_NETPOWERSETTINGSGETENABLEDWAKEPATTERNS)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
NetPowerSettingsGetEnabledWakePatterns(
    _In_
    NETPOWERSETTINGS NetPowerSettings
    )
{
    return ((PFN_NETPOWERSETTINGSGETENABLEDWAKEPATTERNS) NetFunctions[NetPowerSettingsGetEnabledWakePatternsTableIndex])(NetDriverGlobals, NetPowerSettings);
}

//
// NET Function: NetPowerSettingsGetEnabledProtocolOffloads
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG
(*PFN_NETPOWERSETTINGSGETENABLEDPROTOCOLOFFLOADS)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
NetPowerSettingsGetEnabledProtocolOffloads(
    _In_
    NETPOWERSETTINGS NetPowerSettings
    )
{
    return ((PFN_NETPOWERSETTINGSGETENABLEDPROTOCOLOFFLOADS) NetFunctions[NetPowerSettingsGetEnabledProtocolOffloadsTableIndex])(NetDriverGlobals, NetPowerSettings);
}

//
// NET Function: NetPowerSettingsGetEnabledMediaSpecificWakeUpEvents
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG
(*PFN_NETPOWERSETTINGSGETENABLEDMEDIASPECIFICWAKEUPEVENTS)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
NetPowerSettingsGetEnabledMediaSpecificWakeUpEvents(
    _In_
    NETPOWERSETTINGS NetPowerSettings
    )
{
    return ((PFN_NETPOWERSETTINGSGETENABLEDMEDIASPECIFICWAKEUPEVENTS) NetFunctions[NetPowerSettingsGetEnabledMediaSpecificWakeUpEventsTableIndex])(NetDriverGlobals, NetPowerSettings);
}

//
// NET Function: NetPowerSettingsGetProtocolOffloadCount
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG
(*PFN_NETPOWERSETTINGSGETPROTOCOLOFFLOADCOUNT)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
NetPowerSettingsGetProtocolOffloadCount(
    _In_
    NETPOWERSETTINGS NetPowerSettings
    )
{
    return ((PFN_NETPOWERSETTINGSGETPROTOCOLOFFLOADCOUNT) NetFunctions[NetPowerSettingsGetProtocolOffloadCountTableIndex])(NetDriverGlobals, NetPowerSettings);
}

//
// NET Function: NetPowerSettingsGetProtocolOffloadCountForType
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG
(*PFN_NETPOWERSETTINGSGETPROTOCOLOFFLOADCOUNTFORTYPE)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    NDIS_PM_PROTOCOL_OFFLOAD_TYPE ProtocolOffloadType
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
NetPowerSettingsGetProtocolOffloadCountForType(
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    NDIS_PM_PROTOCOL_OFFLOAD_TYPE ProtocolOffloadType
    )
{
    return ((PFN_NETPOWERSETTINGSGETPROTOCOLOFFLOADCOUNTFORTYPE) NetFunctions[NetPowerSettingsGetProtocolOffloadCountForTypeTableIndex])(NetDriverGlobals, NetPowerSettings, ProtocolOffloadType);
}

//
// NET Function: NetPowerSettingsGetProtocolOffload
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
PNDIS_PM_PROTOCOL_OFFLOAD
(*PFN_NETPOWERSETTINGSGETPROTOCOLOFFLOAD)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    ULONG Index
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
PNDIS_PM_PROTOCOL_OFFLOAD
FORCEINLINE
NetPowerSettingsGetProtocolOffload(
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    ULONG Index
    )
{
    return ((PFN_NETPOWERSETTINGSGETPROTOCOLOFFLOAD) NetFunctions[NetPowerSettingsGetProtocolOffloadTableIndex])(NetDriverGlobals, NetPowerSettings, Index);
}

//
// NET Function: NetPowerSettingsIsProtocolOffloadEnabled
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
BOOLEAN
(*PFN_NETPOWERSETTINGSISPROTOCOLOFFLOADENABLED)(
    _In_
    PNET_DRIVER_GLOBALS DriverGlobals,
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    PNDIS_PM_PROTOCOL_OFFLOAD NdisProtocolOffload
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
BOOLEAN
FORCEINLINE
NetPowerSettingsIsProtocolOffloadEnabled(
    _In_
    NETPOWERSETTINGS NetPowerSettings,
    _In_
    PNDIS_PM_PROTOCOL_OFFLOAD NdisProtocolOffload
    )
{
    return ((PFN_NETPOWERSETTINGSISPROTOCOLOFFLOADENABLED) NetFunctions[NetPowerSettingsIsProtocolOffloadEnabledTableIndex])(NetDriverGlobals, NetPowerSettings, NdisProtocolOffload);
}



WDF_EXTERN_C_END

#endif // _NETPOWERSETTINGS_H_

