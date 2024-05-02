/*++

Copyright (c) Microsoft Corporation

Module Name:

    HardwareLayer.h

Abstract:

    This header file declares shared function and function pointer definitions
    that needs to be implemented by hardware layers for serial debugging

Author:

    Sanjay Shah (sanjshah)  - 5/11/2010

--*/

#pragma once

extern ULONG KdSerialBaudDividend;

typedef struct _DEBUG_PORT {
    CPPORT Port;
    ULONG  PortId;
} DEBUG_PORT, *PDEBUG_PORT;

typedef
BOOLEAN
(*PFN_HARDWARE_LAYER_INITIALIZE) (
    _In_opt_ _Null_terminated_ PCHAR LoadOptions,
    _In_ PDEBUG_PORT DebugDevice
    );

typedef
VOID
(*PFN_HARDWARE_LAYER_PUT_BYTE) (
    _In_ PCPPORT  pPort,
    const UCHAR Byte,
    _Inout_ BOOLEAN *CompDbgPortsPresent
    );

typedef
_Success_(return == CP_GET_SUCCESS)
USHORT
(*PFN_HARDWARE_LAYER_GET_BYTE) (
    _In_ PCPPORT  pPort,
    _Out_ PUCHAR Byte,
    _Inout_ BOOLEAN *CompDbgPortsPresent
    );

typedef
PUCHAR
(*PFN_HARDWARE_LAYER_REGISTER_ADDRESS) (
    _In_ PUCHAR Address
    );

typedef struct _KD_HARDWARE_LAYER_DRIVER {
    PFN_HARDWARE_LAYER_INITIALIZE       pHardwareLayerInitializePort;
    PFN_HARDWARE_LAYER_PUT_BYTE         pHardwareLayerPutByte;
    PFN_HARDWARE_LAYER_GET_BYTE         pHardwareLayerGetByte;
    PFN_HARDWARE_LAYER_REGISTER_ADDRESS pHardwareLayerRegisterAddress;
} KD_HARDWARE_LAYER_DRIVER, *PKD_HARDWARE_LAYER_DRIVER;

extern KD_HARDWARE_LAYER_DRIVER MSM8x60HardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER MSM8974HardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER OmapHardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER PL011HardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER NvidiaHardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER Uart16550HardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER SpiMax311HardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER Apm88xxxxHardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER Sam5250HardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER UsifHardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER MX6HardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER SBSA32HardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER SBSAHardwareLayerDriver;
extern KD_HARDWARE_LAYER_DRIVER Bcm2835HardwareLayerDriver;

extern ULONG gKdSerialDriverCount;
extern PKD_HARDWARE_LAYER_DRIVER gKdSerialDrivers[];
extern PKD_HARDWARE_LAYER_DRIVER gHardwareLayerDriver;

NTSTATUS
KdSetAccessType (
    CM_RESOURCE_TYPE Type
    );

CM_RESOURCE_TYPE
KdGetAccessType (
    VOID
    );

typedef
VOID
(*PFN_HARDWARE_WRITE_UCHAR) (
    IN PUCHAR Address,
    IN UCHAR  Value
    );

typedef
UCHAR
(*PFN_HARDWARE_READ_UCHAR) (
    IN PUCHAR Address
    );

extern PFN_HARDWARE_WRITE_UCHAR HardwareWriteUchar;
extern PFN_HARDWARE_READ_UCHAR  HardwareReadUchar;

VOID
Uart16550PutByte (
    _In_ PCPPORT  pPort,
    const UCHAR Byte,
    _Inout_ BOOLEAN *CompDbgPortsPresent
    );

_Success_(return == CP_GET_SUCCESS)
USHORT
Uart16550GetByte (
    _In_ PCPPORT pPort,
    _Out_ PUCHAR Byte,
    _Inout_ BOOLEAN *CompDbgPortsPresent
    );

BOOLEAN
Uart16550InitializePort (
    _In_opt_ _Null_terminated_ PCHAR LoadOptions,
    _In_ PDEBUG_PORT DebugPort
    );

VOID
Uart16550SetBaud (
    _In_ PCPPORT  pPort,
    const ULONG Rate
    );

PUCHAR
Uart16550DwordExpandAddress (
    _In_ PUCHAR Address
    );

UCHAR
ReadLsr (
    _In_ PCPPORT Port,
    UCHAR   waiting,
    _Inout_ BOOLEAN *CompDbgPortsPresent
    );

VOID
SpiMax311SetBaud(
    _In_ PCPPORT pPort,
    const ULONG Rate
    );
