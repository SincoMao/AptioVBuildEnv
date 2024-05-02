/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    uart16550.c

Abstract:

    Standard 16550 UART serial support.

--*/

#include <ntddk.h>
#include "kdcom.h"
#include "HardwareLayer.h"

ULONG KdSerialBaudDividend = CLOCK_RATE;
const static ULONG DEFAULT_ADDRESS_SIZE_UART16550 = 8;

UCHAR KdCompDbgErrorCount = 0;

BOOLEAN
Uart16550InitializePort (
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

    //
    // Disable all uart interrupts.
    //

    HardwareWriteUchar(DebugPort->Port.Address + COM_IEN, 0);
    Uart16550SetBaud(&DebugPort->Port, DebugPort->Port.Baud);

    //
    // Enable the FIFO.
    //

    HardwareWriteUchar(DebugPort->Port.Address + COM_FCR, FC_ENABLE);

    //
    // Assert DTR, RTS.
    //

    HardwareWriteUchar(DebugPort->Port.Address + COM_MCR, MC_DTRRTS);
    return TRUE;
}

VOID
Uart16550SetBaud (
    _In_ PCPPORT  pPort,
    const ULONG Rate
    )

/*++

    Routine Description:

        Set the baud rate for the port and record it in the port object.

    Arguments:

        pPort - address of port object

        Rate - baud rate 

--*/

{
    if (KdSerialBaudDividend != 0) {

        //
        // Compute the divsor
        //

        const ULONG DivisorLatch = KdSerialBaudDividend / Rate;
        UCHAR   Lcr;

        //
        // set the divisor latch access bit (DLAB) in the line control reg
        //

        Lcr = HardwareReadUchar(pPort->Address + COM_LCR);
        Lcr |= LC_DLAB;
        HardwareWriteUchar(pPort->Address + COM_LCR, Lcr);
        HardwareWriteUchar(pPort->Address + COM_DLM,
                           (UCHAR)((DivisorLatch >> 8) & 0xff));

        HardwareWriteUchar(pPort->Address, (UCHAR)(DivisorLatch & 0xff));
        HardwareWriteUchar(pPort->Address + COM_LCR, 3);
    }
}

UCHAR
ReadLsr (
    _In_ PCPPORT Port,
    UCHAR   waiting,
    _Inout_ BOOLEAN *CompDbgPortsPresent
    )

/*++

    Routine Description:

        Read LSR byte from specified port.  If HAL owns port & display
        it will also cause a debug status to be kept up to date.

        Handles entering & exiting modem control mode for debugger.

    Arguments:

        Port - Address of CPPORT
        
        CompDbgPortsPresent - Boolean, if Dbg port is present

    Returns:

        Byte read from port

--*/
{
    const static UCHAR DBG_ACCEPTABLE_ERRORS = 25;

    UCHAR   lsr, msr;

    lsr = HardwareReadUchar(Port->Address + COM_LSR);

    //
    // Check to see if the port still exists.
    //

    if (lsr == SERIAL_LSR_NOT_PRESENT) {
        KdCompDbgErrorCount += 1;
        if (KdCompDbgErrorCount >= DBG_ACCEPTABLE_ERRORS) {
            *CompDbgPortsPresent = FALSE;
            KdCompDbgErrorCount = 0;
        }

        return SERIAL_LSR_NOT_PRESENT;
    }

    if (lsr & waiting) {
        return lsr;
    }

    msr = HardwareReadUchar(Port->Address + COM_MSR);
    return lsr;
}

VOID
Uart16550PutByte (
    _In_ PCPPORT  pPort,
    const UCHAR Byte,
    _Inout_ BOOLEAN *CompDbgPortsPresent
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

    if (CompDbgPortsPresent == FALSE) {
        return;
    }

    //
    //  Wait for port to not be busy
    //

    while (!(ReadLsr(pPort, COM_OUTRDY, CompDbgPortsPresent) &COM_OUTRDY)) ;

    //
    // Send the byte
    //

    HardwareWriteUchar(pPort->Address + COM_DAT, Byte);
}

_Success_(return == CP_GET_SUCCESS)
USHORT
Uart16550GetByte (
    _In_ PCPPORT pPort,
    _Out_ PUCHAR Byte,
    _Inout_ BOOLEAN *CompDbgPortsPresent
    )

/*++

    Routine Description:

        Fetch a byte and return it.

    Arguments:

        pPort - address of port object that describes hw port

        Byte - address of variable to hold the result

    Return Value:

        CP_GET_SUCCESS if data returned.

        CP_GET_NODATA if no data available, but no error.

        CP_GET_ERROR if error (overrun, parity, etc.)

--*/

{
    UCHAR   lsr;
    UCHAR   value;

    //
    //  Make sure DTR and CTS are set
    //
    //  (What does CTS have to do with reading from a full duplex line???)
    //


    //
    // Check to make sure the CPPORT we were passed has been initialized.
    // (The only time it won't be initialized is when the kernel debugger
    // is disabled, in which case we just return.)
    //

    if (pPort->Address == NULL) {
        return(CP_GET_NODATA);
    }

    if (*CompDbgPortsPresent == FALSE) {
        if (ReadLsr(pPort, COM_DATRDY, CompDbgPortsPresent) == 
            SERIAL_LSR_NOT_PRESENT) {

            return(CP_GET_NODATA);

        } else {
            Uart16550SetBaud(pPort, pPort->Baud);
            *CompDbgPortsPresent = TRUE;
        }
    }

    lsr = ReadLsr(pPort, COM_DATRDY, CompDbgPortsPresent);
    if (lsr == SERIAL_LSR_NOT_PRESENT) {
        return(CP_GET_NODATA);
    }

    if ((lsr & COM_DATRDY) == COM_DATRDY) {

        //
        // Check for errors
        //

        if (lsr & (COM_FE | COM_PE | COM_OE)) {
            *Byte = 0;
            return(CP_GET_ERROR);
        }

        //
        // fetch the byte
        //

        value = HardwareReadUchar(pPort->Address + COM_DAT);
        *Byte = value & (UCHAR)0xff;
        return CP_GET_SUCCESS;
    }

    ReadLsr (pPort, 0, CompDbgPortsPresent);
    return CP_GET_NODATA;
}

PUCHAR
Uart16550DwordExpandAddress (
    _In_ PUCHAR Address
    )

/*++

    Routine Description:

        Adjust final address for systems where each register is
        aligned to a DWORD boundary. This is not used in the standard
        case, but is commonly used for memory-mapped UARTs.

    Arguments:

        Address - incoming address

    Return Value:
    
        Adjusted address.

--*/

{
    //
    // Correct for 32 bit aligned registers
    //

    return (PUCHAR) ((((ULONG_PTR)Address & ~(ULONG_PTR)0x1f) +
                      ((ULONG_PTR)Address & 0x7)*4));
}

KD_HARDWARE_LAYER_DRIVER Uart16550HardwareLayerDriver = {

    Uart16550InitializePort,
    Uart16550PutByte,
    Uart16550GetByte,
#if defined(_ARM_) || defined(_ARM64_)
    Uart16550DwordExpandAddress // expand to DWORD boundaries for ARM devices
#else
    0  // otherwise, no transformation by default
#endif
};
