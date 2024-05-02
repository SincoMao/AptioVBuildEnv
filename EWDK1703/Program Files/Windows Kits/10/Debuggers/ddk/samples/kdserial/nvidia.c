//
//    Copyright (C) Microsoft.  All rights reserved.
//

#include <ntddk.h>
#include "kdcom.h"
#include "HardwareLayer.h"

//
// This code supports the Nvidia 16550 variation found in their SoCs.
// It differs from the standard 16550 in these ways:
//    * timing -- therefore the timeouts have been increased
//    * register alignment - registers are aligned on 32 bit boundaries
//
// In addition, this implementation does not configure the baud rate.
//

BOOLEAN
NvidiaInitializePort (
    _In_opt_ _Null_terminated_ PCHAR LoadOptions,
    _In_ PDEBUG_PORT DebugPort
    )

/*++

Routine Description:

    Fill in the com port port object, set the initial baud rate,
    turn on the hardware.

Arguments:

    LoadOptions - Supplies a pointer to the load options string.

    DebugPort - Supplies debug port structure.

--*/

{

    //
    // Clear the dividend to 0, which disables baud rate setting.
    //

    KdSerialBaudDividend = 0;
    return Uart16550InitializePort(LoadOptions, DebugPort);
}

KD_HARDWARE_LAYER_DRIVER NvidiaHardwareLayerDriver = {

    NvidiaInitializePort,
    Uart16550PutByte,
    Uart16550GetByte,
    Uart16550DwordExpandAddress
};

