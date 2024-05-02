//
//    Copyright (C) Microsoft.  All rights reserved.
//

#include <ntddk.h>
#include "kdcom.h"
#include "HardwareLayer.h"

//
// This code supports the Applied Micro 88xxxx UART
// It differs from the standard 16550 in these ways:
//    * clock -- base clock is 50MHz / 16
//    * register alignment - registers are aligned on 32 bit boundaries
//

BOOLEAN
Apm88xxxxInitializePort (
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
    // Increase serial timeout and set the dividend.
    //
    
    KdSerialBaudDividend = 50000000 / 16;
    return Uart16550InitializePort(LoadOptions, DebugPort);
}

KD_HARDWARE_LAYER_DRIVER Apm88xxxxHardwareLayerDriver = {

    Apm88xxxxInitializePort,
    Uart16550PutByte,
    Uart16550GetByte,
    Uart16550DwordExpandAddress
};
