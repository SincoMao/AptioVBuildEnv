/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    pl011.c

Abstract:

    PL011 UART serial support.

--*/


#include <ntddk.h>
#include "kdcom.h"
#include "HardwareLayer.h"

const static ULONG DEFAULT_ADDRESS_SIZE_PL011 = 8;

#define UART_DR         0x00            // Data Register
#define UART_RSR        0x04            // Receive status register (read)
#define UART_ECR        0x04            // Error clear register (write)
#define UART_FR         0x18            // Flag register (read only)
#define UART_ILPR       0x20            // IrDA low-power counter register
#define UART_IBRD       0x24            // Integer baud rate divisor register
#define UART_FBRD       0x28            // Fractional baud rate divisor register
#define UART_LCRH       0x2C            // Line Control register, HIGH byte
#define UART_CR         0x30            // Control register
#define UART_IFLS       0x34            // Interrupt FIFO level select register
#define UART_IMSC       0x38            // Interrupt mask set/clear
#define UART_RIS        0x3C            // Raw Interrrupt status
#define UART_MIS        0x40            // Masked interrupt status
#define UART_ICR        0x44            // Interrupt clear register
#define UART_DMACR      0x48            // DMA control register

#define UART_FR_TXFF    0x20            // UART_FR flag, xmit buffer full
#define UART_FR_RXFE    0x10            // UART_FR flag, receive buffer empty
#define UART_FR_BUSY    0x08            // UART_FR flag, UART busy

#define UART_DR_OE      0x800           // UART_DR flag, overrun error
#define UART_DR_BE      0x400           // UART_DR flag, break error
#define UART_DR_PE      0x200           // UART_DR flag, parity error
#define UART_DR_FE      0x100           // UART_DR flag, framing error

#define PL011_READ_REGISTER_UCHAR(a, f) \
    (UCHAR)((f) ? READ_REGISTER_ULONG((PULONG)(a)) : READ_REGISTER_UCHAR(a))

#define PL011_READ_REGISTER_USHORT(a, f) \
    (USHORT)((f) ? READ_REGISTER_ULONG((PULONG)(a)) : READ_REGISTER_USHORT(a))

#define PL011_WRITE_REGISTER_UCHAR(a, d, f) \
    ((f) ? WRITE_REGISTER_ULONG((PULONG)(a), d) : WRITE_REGISTER_UCHAR(a, d))

#define PL011_WRITE_REGISTER_USHORT(a, d, f) \
    ((f) ? WRITE_REGISTER_ULONG((PULONG)(a), d) : WRITE_REGISTER_USHORT(a, d))

VOID
PL011SetBaud (
    _In_ PCPPORT  pPort,
    const ULONG Rate
    );

BOOLEAN
PL011InitializePort (
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

    PL011SetBaud(&DebugPort->Port, DebugPort->Port.Baud);
    return TRUE;
}

BOOLEAN
SBSA32InitializePort (
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

    DebugPort->Port.Flags |= PORT_FORCE_32BIT_IO;
    PL011SetBaud(&DebugPort->Port, DebugPort->Port.Baud);
    return TRUE;
}

VOID
PL011SetBaud (
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

    BOOLEAN Force32Bit;

    UNREFERENCED_PARAMETER(Rate);

    Force32Bit = ((pPort->Flags & PORT_FORCE_32BIT_IO) != 0);

    //
    // Disable UART
    //

    PL011_WRITE_REGISTER_USHORT((PUSHORT) (pPort->Address + UART_CR), 0, Force32Bit);

    //
    // _ARM_WORKAROUND_ no way to determine reference clock frequency
    //

    //
    // Set wordlength=8bits, enable FIFO, disable parity
    //

    PL011_WRITE_REGISTER_UCHAR(pPort->Address + UART_LCRH, 0x70, Force32Bit);

    //
    // Clear all interrupts
    //

    PL011_WRITE_REGISTER_USHORT((PUSHORT) (pPort->Address + UART_IMSC) , 0x0000, Force32Bit);
    PL011_WRITE_REGISTER_USHORT((PUSHORT) (pPort->Address + UART_ICR),  0x07FF, Force32Bit);

    //
    // Enable UART, Enable Transmit and Receive
    //

    PL011_WRITE_REGISTER_USHORT((PUSHORT) (pPort->Address + UART_CR), 0x0301, Force32Bit);
}

VOID
PL011PutByte (
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

    BOOLEAN Force32Bit;

    if (*CompDbgPortsPresent == FALSE) {
        return;
    }

    Force32Bit = ((pPort->Flags & PORT_FORCE_32BIT_IO) != 0);

    //
    //  Wait for port to be free and fifo not full.
    //
    // _ARM_WORKAROUND_ modem control is not supported
    //

    while ( PL011_READ_REGISTER_USHORT((PUSHORT) (pPort->Address + UART_FR), Force32Bit) &
            (UART_FR_TXFF));

    //
    // Send the byte
    //

    PL011_WRITE_REGISTER_UCHAR(pPort->Address + UART_DR, Byte, Force32Bit);
}

_Success_(return == CP_GET_SUCCESS)
USHORT
PL011GetByte (
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

    BOOLEAN Force32Bit;
    USHORT  fsr;
    USHORT  value;

    //
    // Check to make sure the CPPORT we were passed has been initialized.
    // (The only time it won't be initialized is when the kernel debugger
    // is disabled, in which case we just return.)
    //

    if (pPort->Address == NULL) {
        return(CP_GET_NODATA);
    }

    Force32Bit = ((pPort->Flags & PORT_FORCE_32BIT_IO) != 0);
    if (*CompDbgPortsPresent == FALSE) {
        PL011SetBaud(pPort, pPort->Baud);
        *CompDbgPortsPresent = TRUE;
    }

    //
    // Get FIFO status.
    //

    fsr = PL011_READ_REGISTER_USHORT((PUSHORT)(pPort->Address + UART_FR), Force32Bit);

    //
    // Is at least one character available?
    //

    if ((fsr & UART_FR_RXFE) == 0) {

        //
        // Fetch the data byte and associated error information.
        //

        value = PL011_READ_REGISTER_USHORT((PUSHORT) (pPort->Address + UART_DR), Force32Bit);

        //
        // Check for errors.  Deliberately don't treat overrun as an error.
        //

        if ((value & (UART_DR_PE | UART_DR_FE | UART_DR_BE)) != 0) {
            *Byte = 0;
            return CP_GET_ERROR;
        }

        *Byte = value & (UCHAR)0xff;
        return CP_GET_SUCCESS;
    }

    return CP_GET_NODATA;
}

KD_HARDWARE_LAYER_DRIVER PL011HardwareLayerDriver = {

    PL011InitializePort,
    PL011PutByte,
    PL011GetByte,
    0, // no transformation while reading or writing to register
};

KD_HARDWARE_LAYER_DRIVER SBSAHardwareLayerDriver = {

    PL011InitializePort,
    PL011PutByte,
    PL011GetByte,
    0, // no transformation while reading or writing to register
};

KD_HARDWARE_LAYER_DRIVER SBSA32HardwareLayerDriver = {

    SBSA32InitializePort,
    PL011PutByte,
    PL011GetByte,
    0, // no transformation while reading or writing to register
};
