#include <ntddk.h>
#include "kdcom.h"
#include "HardwareLayer.h"

#define MX6_UCR1_UARTEN       (1 << 0)
#define MX6_UCR2_TXEN         (1 << 2)
#define MX6_UCR2_RXEN         (1 << 1)
#define MX6_USR1_TRDY         (1 << 13)
#define MX6_USR2_RDR          (1 << 0)
#define MX6_RXD_CHARRDY       (1 << 15)
#define MX6_RXD_ERR           (1 << 14)
#define MX6_RXD_DATA_MASK     0xff
#define MX6_UFCR_TXTL_MAX     32
#define MX6_UFCR_TXTL_MASK    0x3F
#define MX6_UFCR_TXTL_SHIFT   10

#include <pshpack1.h>

typedef struct _MX6_UART_REGISTERS {
    ULONG Rxd;                  // 0x00: UART Receiver Register
    ULONG reserved1[15];
    ULONG Txd;                  // 0x40: UART Transmitter Register
    ULONG reserved2[15];
    ULONG Ucr1;                 // 0x80: UART Control Register 1
    ULONG Ucr2;                 // 0x84: UART Control Register 2
    ULONG Ucr3;                 // 0x88: UART Control Register 3
    ULONG Ucr4;                 // 0x8C: UART Control Register 4
    ULONG Ufcr;                 // 0x90: UART FIFO Control Register
    ULONG Usr1;                 // 0x94: UART Status Register 1
    ULONG Usr2;                 // 0x98: UART Status Register 2
    ULONG Uesc;                 // 0x9C: UART Escape Character Register
    ULONG Utim;                 // 0xA0: UART Escape Timer Register
    ULONG Ubir;                 // 0xA4: UART BRM Incremental Register
    ULONG reserved3;
    ULONG Ubrc;                 // 0xAC: UART Baud Rate Count Register
    ULONG Onems;                // 0xB0: UART One Millisecond Register
    ULONG Uts;                  // 0xB4: UART Test Register
    ULONG Umcr;                 // 0xB8: UART RS-485 Mode Control Register
} MX6_UART_REGISTERS, *PMX6_UART_REGISTERS;

#include <poppack.h> // pshpack1.h

C_ASSERT(FIELD_OFFSET(MX6_UART_REGISTERS, Umcr) == 0xB8);

static
NTSTATUS
MX6InitHardware (
    __in volatile MX6_UART_REGISTERS* RegistersPtr
    );


BOOLEAN
MX6InitializePort (
    _In_opt_ _Null_terminated_ PCHAR LoadOptions,
    _In_ PDEBUG_PORT DebugPort
    )

/*++

Routine Description:

    Initializes the debug port module.

Arguments:

    LoadOptions - Supplies a pointer to the load options string.

    DebugPort - Supplies debug port structure.

--*/

{

    NTSTATUS Status;

    UNREFERENCED_PARAMETER(LoadOptions);

    Status = MX6InitHardware((MX6_UART_REGISTERS*)DebugPort->Port.Address);

    return NT_SUCCESS(Status);
}


VOID
MX6SetBaud (
    _In_ PCPPORT  PortPtr,
    _In_ const ULONG Rate
    )

/*++

Routine Description:

    This routine configures a UART device to use the specified baudrate.
    This routine is currently a no-op because we rely on UEFI to configure
    the baud rate.

Arguments:

    PortPtr - Supplies the UART device to configure.

    Rate - Supplies the requested baud rate (in kbps).

Return Value:

    None.

--*/

{

    UNREFERENCED_PARAMETER(PortPtr);
    UNREFERENCED_PARAMETER(Rate);

    return;
}


VOID
MX6PutByte (
    _In_ PCPPORT  PortPtr,
    _In_ const UCHAR Byte,
    _In_ const BOOLEAN* IsCompDbgPortsPresentPtr
    )

/*++

    Routine Description:

        Write a byte out to the specified COM port

    Arguments:

        PortPtr - address of port object that describes hw port

        Byte - data to emit

        IsCompDbgPortsPresentPtr - TRUE if Dbg port is present

--*/

{

    volatile MX6_UART_REGISTERS* RegistersPtr;
    ULONG Usr1Reg;

    RegistersPtr = (MX6_UART_REGISTERS*)PortPtr->Address;

    if (*IsCompDbgPortsPresentPtr == FALSE) {
        return;
    }

    //
    // Wait for the transmit interface to be ready (TRDY bit HIGH)
    //

    do {
        Usr1Reg = READ_REGISTER_ULONG(&RegistersPtr->Usr1);
    } while ((Usr1Reg & MX6_USR1_TRDY) == 0);

    //
    // Send the byte
    //

    WRITE_REGISTER_ULONG(&RegistersPtr->Txd, Byte);

    return;
}


USHORT
MX6GetByte (
    _In_ PCPPORT  PortPtr,
    _Out_ PUCHAR BytePtr,
    _Inout_ BOOLEAN *IsCompDbgPortsPresentPtr
    )

/*++

    Routine Description:

        Fetch a byte and return it.

    Arguments:

        PortPtr - address of port object that describes hw port

        BytePtr - address of variable to hold the result

        IsCompDbgPortsPresentPtr - TRUE if Dbg port is present

    Return Value:

        CP_GET_SUCCESS if data returned.

        CP_GET_NODATA if no data available, but no error.

        CP_GET_ERROR if error (overrun, parity, etc.)

--*/

{

    volatile MX6_UART_REGISTERS* RegistersPtr;
    ULONG RxdReg;

    RegistersPtr = (MX6_UART_REGISTERS*)PortPtr->Address;

    if (RegistersPtr == NULL) {
        return CP_GET_NODATA;
    }

    if (*IsCompDbgPortsPresentPtr == FALSE) {
        MX6InitHardware(RegistersPtr);
        *IsCompDbgPortsPresentPtr = TRUE;
    }

    //
    // Read an entry from the RX FIFO
    //

    RxdReg = READ_REGISTER_ULONG(&RegistersPtr->Rxd);

    //
    // Check if the entry is valid (i.e. was a byte actually received)
    //

    if ((RxdReg & MX6_RXD_CHARRDY) == 0) {
        return CP_GET_NODATA;
    }

    //
    // Check if an error occurred
    //

    if ((RxdReg & MX6_RXD_ERR) != 0) {
        return CP_GET_ERROR;
    }

    //
    // Mask off the data and return it
    //

    *BytePtr = (UCHAR)(RxdReg & MX6_RXD_DATA_MASK);

    return CP_GET_SUCCESS;
}

NTSTATUS
MX6InitHardware (
    __in volatile MX6_UART_REGISTERS* RegistersPtr
    )

/*++

Routine Description:

    This routine ensures the hardware has been initialized by previous
    boot stages and applies configuration required by this module.

Arguments:

    RegistersPtr - Base address of a UART device.

Return Value:

    STATUS_SUCCESS when successful
    STATUS_INVALID_DEVICE_STATE the serial port was not initialized by firmware

--*/

{

    ULONG Ucr1Reg;
    ULONG Ucr2Reg;
    ULONG UfcrReg;

    //
    // Verify UART is enabled. UEFI should have enabled the UART.
    //

    Ucr1Reg = READ_REGISTER_ULONG(&RegistersPtr->Ucr1);
    if ((Ucr1Reg & MX6_UCR1_UARTEN) == 0) {
        return STATUS_INVALID_DEVICE_STATE;
    }

    //
    // Verify transmitter and receiver are enabled. These must be enabled
    // or else writing to the RXD and TXD registers will cause a bus error.
    //

    Ucr2Reg = READ_REGISTER_ULONG(&RegistersPtr->Ucr2);
    if (((Ucr2Reg & MX6_UCR2_TXEN) == 0) ||
        ((Ucr2Reg & MX6_UCR2_RXEN) == 0)) {

        return STATUS_INVALID_DEVICE_STATE;
    }

    //
    // Configure transmitter trigger level to maximum.
    //

    UfcrReg = READ_REGISTER_ULONG(&RegistersPtr->Ufcr);
    UfcrReg = (UfcrReg & ~MX6_UFCR_TXTL_MASK) |
              (MX6_UFCR_TXTL_MAX << MX6_UFCR_TXTL_SHIFT);

    WRITE_REGISTER_ULONG(&RegistersPtr->Ufcr, UfcrReg);

    return STATUS_SUCCESS;
}


KD_HARDWARE_LAYER_DRIVER MX6HardwareLayerDriver = {

    MX6InitializePort,
    MX6PutByte,
    MX6GetByte,
    0, // no transformation while reading or writing to register
};

