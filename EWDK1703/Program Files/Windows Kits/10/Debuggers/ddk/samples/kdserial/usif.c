/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    usif.c

Abstract:

    Intel Sofia UART serial support.

Author:

    Dejun Qian (dejun.qian) Aug. 2014

--*/


#include <ntddk.h>
#include "kdcom.h"
#include "HardwareLayer.h"

#define USIF_FIFO_STAT          0x00000044    // FIFO status register
#define USIF_FIFO_STAT_TXFFS    0x00FF0000    // TX filled FIFO stages
#define USIF_FIFO_STAT_RXFFS    0x000000FF    // RX filled FIFO stages
#define USIF_TXD                0x00040000    // Transmisson data register
#define USIF_RXD                0x00080000    // Reception data register


VOID
UsifSetBaud (
    _In_ PCPPORT  pPort,
    const ULONG Rate
    );

BOOLEAN
UsifInitializePort (
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

    UsifSetBaud(&DebugPort->Port, DebugPort->Port.Baud);
    return TRUE;
}

VOID
UsifSetBaud (
    _In_ PCPPORT  pPort,
    const ULONG Rate
    )

/*++


    Routine Description:

        Set the baud rate for the port and record it in the port object.

    Arguments:

        pPort - address of port object

        Rate - baud rate  ( Only support CP_BD_115200)
--*/

{

    UNREFERENCED_PARAMETER(pPort);
    UNREFERENCED_PARAMETER(Rate);

}

VOID
UsifPutByte (
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

        CompDbgPortsPresent - Boolean, if Dbg port is present
--*/

{
    if (*CompDbgPortsPresent == FALSE) {
        return;
    }

    //
    //  Wait for port to be free and fifo not full.
    //

    while ( READ_REGISTER_ULONG((PULONG) (pPort->Address + USIF_FIFO_STAT) ) & (USIF_FIFO_STAT_TXFFS) );

    //
    // Send the byte
    //

    WRITE_REGISTER_ULONG((PULONG) (pPort->Address + USIF_TXD), (ULONG) Byte );
}

_Success_(return == CP_GET_SUCCESS)
USHORT
UsifGetByte (
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
    ULONG Stat;
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
        UsifSetBaud(pPort, pPort->Baud);
        *CompDbgPortsPresent = TRUE;
    }

    //
    // Get FIFO status.
    //

    Stat = READ_REGISTER_ULONG((PULONG)(pPort->Address + USIF_FIFO_STAT));

    //
    // Is at least one character available?
    //

    if (Stat & USIF_FIFO_STAT_RXFFS) {

        //
        // Fetch the data byte.
        //

		value = READ_REGISTER_ULONG((PULONG) (pPort->Address + USIF_RXD));

        *Byte = value & (UCHAR)0xff;
        return CP_GET_SUCCESS;
    }

    return CP_GET_NODATA;
}

KD_HARDWARE_LAYER_DRIVER UsifHardwareLayerDriver = {

    UsifInitializePort,
    UsifPutByte,
    UsifGetByte,
    0, // no transformation while reading or writing to register
};
