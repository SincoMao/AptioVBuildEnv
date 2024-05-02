/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    sam5250.c

Abstract:

    Samsung 5250 UART serial support.

--*/


#include <ntddk.h>
#include "kdcom.h"
#include "HardwareLayer.h"

#define ULCON           0x00
#define UCON            0x04
#define UFCON           0x08
#define UTRSTAT         0x10
#define UERSTAT         0x14
#define UFSTAT          0x18
#define UTXH            0x20
#define URXH            0x24
#define UINTP           0x30
#define UINTM           0x38

#define UFSTAT_TXFE     (1 << 24)
#define UTRSTAT_RXFE    (1 <<  0)

#define UERSTAT_OE      (1 << 0)
#define UERSTAT_PE      (1 << 1)
#define UERSTAT_FE      (1 << 2)
#define UERSTAT_BE      (1 << 3)

VOID
Sam5250SetBaud (
    _In_ PCPPORT  pPort,
    const ULONG Rate
    );

BOOLEAN
Sam5250InitializePort (
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

    UNREFERENCED_PARAMETER(LoadOptions);

    Sam5250SetBaud(&DebugPort->Port, DebugPort->Port.Baud);
    return TRUE;
}

VOID
Sam5250SetBaud (
    _In_ PCPPORT  pPort,
    const ULONG Rate
    )

/*++


    Routine Description:

        Set the baud rate for the port and record it in the port object.

    Arguments:

        pPort - address of port object

        Rate - baud rate  (CP_BD_150 ... CP_BD_56000)
--*/

{

    UNREFERENCED_PARAMETER(Rate);

    //
    // Disable UART
    //

    WRITE_REGISTER_ULONG((PULONG) (pPort->Address + UCON), 0);

    //
    // _ARM_WORKAROUND_ no way to determine reference clock frequency
    //

    //
    // Set wordlength=8bits, enable FIFO, disable parity
    //

    WRITE_REGISTER_ULONG((PULONG) (pPort->Address + ULCON), 0x3); // 8bit/disable parity.
    WRITE_REGISTER_ULONG((PULONG) (pPort->Address + UFCON), 0x1); // fifo enable.

    //
    // Clear all interrupts
    //

    WRITE_REGISTER_ULONG((PULONG) (pPort->Address + UINTM), 0xf); // Mask all interrupt.
    WRITE_REGISTER_ULONG((PULONG) (pPort->Address + UINTP), 0xf); // Clear all interrupt.

    //
    // Enable UART, Enable Transmit and Receive
    //

    WRITE_REGISTER_ULONG((PULONG) (pPort->Address + UCON), 0x5); // Transmit Mode: 01, Receive Mode: 01.
}

VOID
Sam5250PutByte (
    _In_ PCPPORT  pPort,
    const UCHAR Byte,
    _Inout_ const BOOLEAN *CompDbgPortsPresent
    )

/*++

    Routine Description:

        Write a byte out to the specified com port.

    Arguments:

        pPort - Address of CPPORT object

        Byte - data to emit

--*/

{
    if (*CompDbgPortsPresent == FALSE) {
        return;
    }

    //
    //  Wait for port to be free and fifo not full.
    //
    // _ARM_WORKAROUND_ modem control is not supported
    //

    while ( READ_REGISTER_ULONG((PULONG) (pPort->Address + UFSTAT) ) & (UFSTAT_TXFE) );

    //
    // Send the byte
    //

    WRITE_REGISTER_ULONG((PULONG) (pPort->Address + UTXH), (ULONG) Byte );
}

_Success_(return == CP_GET_SUCCESS)
USHORT
Sam5250GetByte (
    _In_ PCPPORT  pPort,
    _Out_ PUCHAR Byte,
    _Inout_ BOOLEAN *CompDbgPortsPresent
    )

/*++

    Routine Description:

        Fetch a byte and return it.

    Arguments:

        pPort - address of port object that describes hw port

        Byte - address of variable to hold the result

        WaitForByte - flag indicates wait for byte or not.

    Return Value:

        CP_GET_SUCCESS if data returned.

        CP_GET_NODATA if no data available, but no error.

        CP_GET_ERROR if error (overrun, parity, etc.)

--*/

{
    ULONG fsr;
    ULONG err;
    ULONG value;

    //
    // Check to make sure the CPPORT we were passed has been initialized.
    // (The only time it won't be initialized is when the kernel debugger
    // is disabled, in which case we just return.)
    //

    if (pPort->Address == NULL) {
        return(CP_GET_NODATA);
    }

    if (*CompDbgPortsPresent == FALSE) {
        Sam5250SetBaud(pPort, pPort->Baud);
        *CompDbgPortsPresent = TRUE;
    }

    //
    // Get FIFO status.
    //

    fsr = READ_REGISTER_ULONG((PULONG)(pPort->Address + UTRSTAT));

    //
    // Is at least one character available?
    //

    if (fsr & UTRSTAT_RXFE) {

        //
        // Fetch the data byte and associated error information.
        //

        value = READ_REGISTER_ULONG((PULONG) (pPort->Address + URXH));

        //
        // Check for errors.  Deliberately don't treat overrun as an error.
        //

        err = READ_REGISTER_ULONG((PULONG) (pPort->Address + UERSTAT));

        if (err & (UERSTAT_PE | UERSTAT_FE | UERSTAT_BE)) {
            *Byte = 0;
            return CP_GET_ERROR;
        }

        *Byte = value & (UCHAR)0xff;
        return CP_GET_SUCCESS;
    }

    return CP_GET_NODATA;
}

KD_HARDWARE_LAYER_DRIVER Sam5250HardwareLayerDriver = {

    Sam5250InitializePort,
    Sam5250PutByte,
    Sam5250GetByte,
    0, // no transformation while reading or writing to register
};
