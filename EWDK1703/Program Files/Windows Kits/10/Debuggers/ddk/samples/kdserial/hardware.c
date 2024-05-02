/*++

Copyright (c) Microsoft Corporation

Module Name:

    hardware.c

Abstract:

    This file defines the global hardware layer function entry points.

--*/

#include <ntddk.h>
#include "kdcom.h"
#include "HardwareLayer.h"

#define ARRAY_SIZE(array) (sizeof(array) / sizeof(array[0]))

PKD_HARDWARE_LAYER_DRIVER gHardwareLayerDriver;
PKD_HARDWARE_LAYER_DRIVER gKdSerialDrivers[] = {
    &Uart16550HardwareLayerDriver, // Uart16550HardwareLayerDriver = 0
    &Uart16550HardwareLayerDriver, // Uart16550HardwareLayerDriver = 1
    &SpiMax311HardwareLayerDriver, // SpiMax311HardwareLayerDriver = 2
    &PL011HardwareLayerDriver, // PL011HardwareLayerDriver = 3
    &MSM8x60HardwareLayerDriver, // MSM8x60HardwareLayerDriver = 4
    &NvidiaHardwareLayerDriver, // NvidiaHardwareLayerDriver = 5
    &OmapHardwareLayerDriver, // OmapHardwareLayerDriver = 6
    NULL, // UEFI debug protocol = 7
    &Apm88xxxxHardwareLayerDriver, // Apm88xxxxHardwareLayerDriver = 8
    &MSM8974HardwareLayerDriver, // MSM8974HardwareLayerDriver = 9
    &Sam5250HardwareLayerDriver, // Sam5250HardwareLayerDriver = 10
    &UsifHardwareLayerDriver,  // UsifHardwareLayerDriver = 11
    &MX6HardwareLayerDriver, // MX6HardwareLayerDriver = 12
    &SBSA32HardwareLayerDriver, // SBSA32HardwareLayerDriver = 13
    &SBSAHardwareLayerDriver, // SBSAHardwareLayerDriver = 14
    NULL, // ARM DCC = 15
    &Bcm2835HardwareLayerDriver // &Bcm2835HardwareLayerDriver = 16
    };

ULONG gKdSerialDriverCount = ARRAY_SIZE(gKdSerialDrivers);
