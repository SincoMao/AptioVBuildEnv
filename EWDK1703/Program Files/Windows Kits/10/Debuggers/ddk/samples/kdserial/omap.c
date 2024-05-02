/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    omap.c

Abstract:

    TI OMAP serial support.

--*/

// TODO: This can probably use the newly parameterized Uart16550 directly.

#include <ntddk.h>
#include "kdcom.h"
#include "HardwareLayer.h"

const static ULONG DEFAULT_ADDRESS_SIZE_OMAP = 8;

#define FC_CLEAR_RECEIVE         0x02
#define FC_CLEAR_TRANSMIT        0x04
#define LC_DATA_SIZE             0x03

#define COM_IER     COM_IEN
#define COM_EFR     COM_FCR
#define COM_MDR1    0x8

#undef  CLOCK_RATE
#define CLOCK_RATE 2995200ul

VOID
OmapSetBaud (
    _In_ PCPPORT  pPort
    );

BOOLEAN
OmapInitializePort (
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
    // SetBaud Rate
    //

    OmapSetBaud(&DebugPort->Port);

    //
    // Put in operational mode.
    //

    HardwareWriteUchar(DebugPort->Port.Address + COM_LCR,
              HardwareReadUchar(DebugPort->Port.Address + COM_LCR) & ~LC_DLAB);

    //
    // Disable device interrupts
    //

    HardwareWriteUchar(DebugPort->Port.Address + COM_IEN, 0);

    //
    // Reset and disable the FIFO queue.
    //

    HardwareWriteUchar(DebugPort->Port.Address + COM_FCR,
                       FC_CLEAR_TRANSMIT | FC_CLEAR_RECEIVE);

    //
    // Configure the Modem Control Register.  Disabled device interrupts,
    // turn off loopback.
    //

    HardwareWriteUchar(DebugPort->Port.Address + COM_MCR,
                       HardwareReadUchar(DebugPort->Port.Address + COM_MCR) & 
                       MC_DTRRTS);

    //
    // Initialize the Modem Control Register.  Indicate to the device that
    // we are able to send and receive data.
    //

    HardwareWriteUchar(DebugPort->Port.Address + COM_MCR, MC_DTRRTS);

    //
    // Enable the FIFO queues.
    //

    HardwareWriteUchar(DebugPort->Port.Address + COM_FCR, FC_ENABLE);
    return TRUE;
}

VOID
OmapSetBaud (
    _In_ PCPPORT  Port
    )

/*++

    Routine Description:

        Set the baud rate for the port and record it in the port object.

    Arguments:

        Port - address of port object

--*/

{

    PUCHAR BaseAddress;
    ULONG DivisorLatch;
    UCHAR Enhanced;

    BaseAddress = Port->Address;

    //
    // Disable UART
    //

    HardwareWriteUchar(BaseAddress + COM_MDR1, 0x7);

    //
    // Set register configuration mode B
    //

    HardwareWriteUchar(BaseAddress + COM_LCR, 0xBF);

    //
    // Set enhanced mode
    //

    Enhanced = HardwareReadUchar(BaseAddress + COM_EFR);
    HardwareWriteUchar(BaseAddress + COM_EFR,
                       Enhanced | (1 << 4));

    //
    // switch to operational mode
    //

    HardwareWriteUchar(BaseAddress + COM_LCR, 0);

    //
    // clear sleep mode
    //

    HardwareWriteUchar(BaseAddress + COM_IER, 0);

    //
    // Set register configuration mode B
    //

    HardwareWriteUchar(BaseAddress + COM_LCR, 0xBF);

    //
    // compute the divsor
    //
    DivisorLatch = CLOCK_RATE / 115200;

    //
    // Write the divisor latch value to DLL and DLM.
    //

    HardwareWriteUchar(BaseAddress + COM_DLM, (UCHAR)((DivisorLatch >> 8) & 0xff));
    HardwareWriteUchar(BaseAddress + COM_DLL, (UCHAR)(DivisorLatch & 0xff));

    //
    // Restore enhanced mode
    //

    HardwareWriteUchar(BaseAddress + COM_EFR, Enhanced);

    //
    // Reset the Line Control Register.
    //

    HardwareWriteUchar(BaseAddress + COM_LCR, LC_DATA_SIZE);

    //
    // Enable UART
    //

    HardwareWriteUchar(BaseAddress + COM_MDR1, 0);
}


_Success_(return == CP_GET_SUCCESS)
USHORT
OmapGetByte (
    _In_ PCPPORT Port,
    _Out_ PUCHAR Byte,
    _Inout_ BOOLEAN *CompDbgPortsPresent
    )

/*++

    Routine Description:

        Fetch a byte and return it.

    Arguments:

        Port - address of port object that describes hw port

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
    // Check to make sure the CPPORT we were passed has been initialized.
    // (The only time it won't be initialized is when the kernel debugger
    // is disabled, in which case we just return.)
    //

    if (Port->Address == NULL) {
        return(CP_GET_NODATA);
    }

    if (*CompDbgPortsPresent == FALSE) {
        if (ReadLsr(Port, COM_DATRDY, CompDbgPortsPresent) ==
            SERIAL_LSR_NOT_PRESENT) {

            return(CP_GET_NODATA);

        } else {
            OmapSetBaud(Port);
            *CompDbgPortsPresent = TRUE;
        }
    }

    lsr = ReadLsr(Port, COM_DATRDY, CompDbgPortsPresent);
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

        value = HardwareReadUchar(Port->Address + COM_DAT);
        *Byte = value & (UCHAR)0xff;
        return CP_GET_SUCCESS;
    }

    ReadLsr (Port, 0, CompDbgPortsPresent);
    return CP_GET_NODATA;
}

PUCHAR
OmapTransformRegisterAddress(
    _In_ PUCHAR Address
    )
{
    //
    // Correct for OMAP layout of registers
    //

    return  (PUCHAR) (((ULONG_PTR) Address & 0xFFFFFF00) | 
                      ((((ULONG_PTR) Address & 0xFF)) * 4));
}

KD_HARDWARE_LAYER_DRIVER OmapHardwareLayerDriver = {

    OmapInitializePort,
    Uart16550PutByte,               // share implementation from 16550
    OmapGetByte,
    OmapTransformRegisterAddress
};
