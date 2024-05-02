/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    spimax311.c

Abstract:

    Serial Peripheral Interface (SPI) to Maxim 311xE UART

--*/

#include "ntddk.h"
#include "kdcom.h"
#include "HardwareLayer.h"

//
//  Declare the device registers
//

typedef struct _DW_APB_SSI_REGISTERS {
    ULONG Ctrlr0;           //  00  Control Register 0
    ULONG Ctrlr1;           //  04  Control Register 1
    ULONG Ssienr;           //  08  SSI Enable Register
    ULONG Mwcr;             //  0c  Microwire Control Register
    ULONG Ser;              //  10  Slave Enable Register
    ULONG Baudr;            //  14  Baud Rate Select
    ULONG Txftlr;           //  18  Transmit FIFO Threshold Level
    ULONG Rxftlr;           //  1c  Receive FIFO Threshold Level
    ULONG Txflr;            //  20  Transmit FIFO Level Register
    ULONG Rxflr;            //  24  Receive FIFO Level Register
    ULONG Sr;               //  28  Status Register
    ULONG Imr;              //  2c  Interrupt Mask Register
    ULONG Isr;              //  30  Interrupt Status Register
    ULONG Risr;             //  34  Raw Interrupt Status Register
    ULONG Txoicr;           //  38  Transmit FIFO Overflow Interrupt Clear
                            //      Register
    ULONG Rxoicr;           //  3c  Receive FIFO Overflow Interrupt Clear
                            //      Register
    ULONG Rxuicr;           //  40  Receive FIFO Underflow Interrupt Clear
                            //      Register
    ULONG Msticr;           //  44  Multi-Master Interrupt Clear Register
    ULONG Icr;              //  48  Interrupt Clear Register
    ULONG Dmacr;            //  4c  DMA Control Register
    ULONG Dmatdlr;          //  50  DMA Transmit Data Level
    ULONG Dmardlr;          //  54  DMA Receive Data Level
    ULONG Idr;              //  58  Identification Register
    ULONG Ssi_comp_version; //  5c  CoreKit Version ID Register
    ULONG Dr;               //  60  Data Register
} DW_APB_SSI_REGISTERS;

//
//  Define the control bits
//

#define CRTLR0_SLV_OE       ( 1 << 10 ) //  1 = Slave TXD disabled
#define CTRLR0_TMOD_TX_RX   0
#define CTRLR0_TMOD_TX      ( 1 << 8 )
#define CTRLR0_TMOD_RX      ( 2 << 8 )
#define CTRLR0_TMOD_EEPROM  ( 3 << 8 )
#define CTRLR0_SCPOL        ( 1 << 7 ) //  Serial Clock Polarity (inactive state)
#define CTRLRO_SCPH         ( 1 << 6 ) //  Serial Clock Phase (1=Start,
                                       //  0=Middle) of data bit
#define CTRLR0_FRF_MOTOROLA_SPI     0
#define CTRLR0_FRF_TEXAS_INSTRUMENTS_SSP    ( 1 << 4 )
#define CTRLR0_FRF_NATIONAL_SEMICONDUCTORS_MICROWIRE    ( 2 << 4 )
#define CTRLR0_DFS          15          //  Data frame size mask in bits

#define SSIENR_SSI_EN       1           //  1=Enabled

//
//  Define the SPI baud rate
//

#define BAUDR_MAX_RATE      2
#define BAUDR_OFF           0

//
//  Define the status register
//

#define SR_DCOL             ( 1 << 6 )  //  1 = tRANSMIT DATA COLLISION ERROR
#define SR_TXE              ( 1 << 5 )  //  1 = Transmission error
#define SR_RFF              ( 1 << 4 )  //  1 = Receive FIFO is full
#define SR_RFNE             ( 1 << 3 )  //  1 = Receive FIFO is not empty
#define SR_TFE              ( 1 << 2 )  //  1 = Transmit FIFO is empty
#define SR_TFNF             ( 1 << 1 )  //  1 = Transmit FIFO is not full
#define SR_BUSY             ( 1 << 0 )  //  1 = SPI unit is actively
                                        //      transferring data

//
//  Define the operations
//

#define MAX311xE_WRITE_CONFIG   ( 3 << 14 )
#define MAX311xE_READ_CONFIG    ( 1 << 14 )
#define MAX311xE_WRITE_DATA     ( 2 << 14 )
#define MAX311xE_READ_DATA      0

//
//  Define the configuration register
//

#define MAX311xE_WC_FEN_BAR     ( 1 << 13 ) //  1 = FIFO Disable
#define MAX311xE_WC_SHDNI       ( 1 << 12 ) //  1 = Enter shutdown
#define MAX311xE_WC_TM_BAR      ( 1 << 11 ) //  1 = Transmit buffer empty
                                            // interrupt enabled
#define MAX311xE_WC_RM_BAR      ( 1 << 10 ) //  1 = Data available interrupt
                                            // enable
#define MAX311xE_WC_PM_BAR      ( 1 << 9 )  //  1 = Parity bit high received
                                            // interrupt enabled
#define MAX311xE_WC_RAM_BAR     ( 1 << 8 )  //  1 = Receiver-activity (shutdown
                                            // mode)/Framming-error (normal
                                            // operation) interrupt enabled
#define MAX311xE_WC_IRDA        ( 1 << 7 )  //  1 = IrDA mode is enabled
#define MAX311xE_WC_ST          ( 1 << 6 )  //  1 = Transmit two stop bits
#define MAX311xE_WC_PE          ( 1 << 5 )  //  1 = Parity enabled
#define MAX311xE_WC_L           ( 1 << 4 )  //  1 = 7 bits, 0 = 8 Bits
#define MAX311xE_WC_DIV_1       0           //  Clock divider for baud-rate
#define MAX311xE_WC_DIV_2       1
#define MAX311xE_WC_DIV_4       2
#define MAX311xE_WC_DIV_8       3
#define MAX311xE_WC_DIV_16      4
#define MAX311xE_WC_DIV_32      5
#define MAX311xE_WC_DIV_64      6
#define MAX311xE_WC_DIV_128     7
#define MAX311xE_WC_DIV_3       8
#define MAX311xE_WC_DIV_6       9
#define MAX311xE_WC_DIV_12      10
#define MAX311xE_WC_DIV_24      11
#define MAX311xE_WC_DIV_48      12
#define MAX311xE_WC_DIV_96      13
#define MAX311xE_WC_DIV_192     14
#define MAX311xE_WC_DIV_384     15

//
//  Define the read config register
//

#define MAX311xE_RC_R           ( 1 << 15 ) //  1 = Receive data available
#define MAX311xE_RC_T           ( 1 << 14 ) //  1 = Transmit buffer empty
#define MAX311xE_RC_FEN_BAR     ( 1 << 13 ) //  1 = FIFO Disable
#define MAX311xE_RC_SHDNI       ( 1 << 12 ) //  1 = Enter shutdown
#define MAX311xE_RC_TM_BAR      ( 1 << 11 ) //  1 = Transmit buffer empty
                                            //      interrupt enabled
                                            //      interrupt enabled
#define MAX311xE_RC_RM_BAR      ( 1 << 10 ) //  1 = Data available interrupt
                                            //      enable
#define MAX311xE_RC_PM_BAR      ( 1 << 9 )  //  1 = Parity bit high received
                                            //      interrupt enabled
#define MAX311xE_RC_RAM_BAR     ( 1 << 8 )  //  1 = Receiver-activity (shutdown
                                            //      mode)/Framming-error (normal
                                            //      operation) interrupt
                                            //      enabled
#define MAX311xE_RC_IRDA        ( 1 << 7 )  //  1 = IrDA mode is enabled
#define MAX311xE_RC_ST          ( 1 << 6 )  //  1 = Transmit two stop bits
#define MAX311xE_RC_PE          ( 1 << 5 )  //  1 = Parity enabled
#define MAX311xE_RC_L           ( 1 << 4 )  //  1 = 7 bits, 0 = 8 Bits
#define MAX311xE_RC_DIV_1       0           //  Clock divider for baud-rate
#define MAX311xE_RC_DIV_2       1
#define MAX311xE_RC_DIV_4       2
#define MAX311xE_RC_DIV_8       3
#define MAX311xE_RC_DIV_16      4
#define MAX311xE_RC_DIV_32      5
#define MAX311xE_RC_DIV_64      6
#define MAX311xE_RC_DIV_128     7
#define MAX311xE_RC_DIV_3       8
#define MAX311xE_RC_DIV_6       9
#define MAX311xE_RC_DIV_12      10
#define MAX311xE_RC_DIV_24      11
#define MAX311xE_RC_DIV_48      12
#define MAX311xE_RC_DIV_96      13
#define MAX311xE_RC_DIV_192     14
#define MAX311xE_RC_DIV_384     15

//
//  Define the write data register
//

#define MAX311xE_WD_TE_BAR      ( 1 << 10 ) //  1 = Disable transmit
#define MAX311xE_WD_RTS_BAR     ( 1 << 9 )  //  1 = RTS active
#define MAX311xE_WD_PT          ( 1 << 8 )  //  1 = Parity bit to transmit
#define MAX311xE_WD_DATA        0xff        //  Transmit data byte

//
//  Define the read data register
//

#define MAX311xE_RD_R           ( 1 << 15 ) //  1 = Receive data available
#define MAX311xE_RD_T           ( 1 << 14 ) //  1 = Transmit buffer is empty
#define MAX311xE_RD_RA_FE       ( 1 << 10 ) //  1 = Receive-Activity (UART
                                            //      Shutdown)/Framing-Error
                                            //      (normal operation)
#define MAX311xE_RD_CTS         ( 1 << 9 )  //  1 = CTS active
#define MAX311xE_RD_PR          ( 1 << 8 )  //  Received parity bit
#define MAX311xE_RD_DATA        0xff        //  Received data byte


//
// Constants
//

//
//  Define the device select bits
//

#define SER_LED             1
#define SER_UART            2
#define SER_2MB_FLASH       4

//
// Macros
//

#define BUFFER_END(x)   ( & x [ sizeof(x) / sizeof(x[0]) ])

//
// Local Data
//

UINT16 g_SpiMax311RxBuffer [ 1024 ];
UINT16 * g_pSpiMax311RxFill;
UINT16 * g_pSpiMax311RxEmpty;
UINT16 g_SpiBaudRate;

//
// Local routines
//

UINT16
SpiSend16(
    _In_ PCPPORT pPort,
    UINT16 Value
    )

/*++

    Routine Description:

        Write a byte out to the specified com port.

    Arguments:

        pPort - Address of CPPORT object

        Value - data to emit

--*/

{
    DW_APB_SSI_REGISTERS *pSpi;

    //
    //  Locate the SPI controller.
    //

    pSpi = (DW_APB_SSI_REGISTERS *)pPort->Address;

    //
    //  Wait until the SPI is idle
    //

    while (SR_TFE != (READ_REGISTER_ULONG(&pSpi->Sr) & (SR_BUSY | SR_TFE))) {
    }

    //
    //  Remove any data not read during the previous transaction
    //

    while (0 != (READ_REGISTER_ULONG(&pSpi->Sr) & SR_RFNE)) {

        //
        //  Discard the previous transaction's data
        //

        READ_REGISTER_ULONG(&pSpi->Dr);
    }

    //
    // Disable the SPI controller by writing 0 into the Enable register.
    //

    WRITE_REGISTER_ULONG(&pSpi->Ssienr, 0);

    //
    //  Initialize the SPI controller
    //

    WRITE_REGISTER_ULONG(&pSpi->Ctrlr0,
                         CTRLR0_TMOD_TX_RX        //  Send and receive data
                       | CRTLR0_SLV_OE            //  Disable slave TxD
                       | (16 - 1));               //  16 bits per transfer

    WRITE_REGISTER_ULONG(&pSpi->Ctrlr1, 0);     //  1 transfer before stopping
    WRITE_REGISTER_ULONG(&pSpi->Baudr, g_SpiBaudRate);

    //
    // Enable the SPI controller by writing 1 into the Enable Register.
    //

    WRITE_REGISTER_ULONG(&pSpi->Ssienr, 1);

    //
    //  Select the UART
    //

    WRITE_REGISTER_ULONG(&pSpi->Ser, SER_UART);

    //
    //  Write the value to the UART
    //

    WRITE_REGISTER_ULONG(&pSpi->Dr, Value);

    //
    //  Wait until the SPI operation is complete
    //

    while ((SR_TFE | SR_RFNE) != (READ_REGISTER_ULONG(&pSpi->Sr) &
                                 (SR_BUSY | SR_TFE | SR_RFNE))) {
    }

    //
    //  Read the data value
    //

    return (UINT16)READ_REGISTER_ULONG(&pSpi->Dr);
}

VOID
SpiMax311SetBaud(
    _In_ PCPPORT pPort,
    const ULONG Rate
    )

/*++

    Routine Description:

        Set the UART baud rate

    Arguments:

        pPort - address of port object

        Rate - baud rate  (CP_BD_150 ... CP_BD_19200)

--*/

{
    UINT16 ConfigValue;

    //
    //  Select the baud rate
    //

    switch (Rate) {
    case 230400:
        ConfigValue = MAX311xE_WC_DIV_1;
        break;

    default:
    case 115200:
        ConfigValue = MAX311xE_WC_DIV_2;
        break;

    case 76800:
        ConfigValue = MAX311xE_WC_DIV_3;
        break;

    case 57600:
        ConfigValue = MAX311xE_WC_DIV_4;
        break;

    case 38400:
        ConfigValue = MAX311xE_WC_DIV_6;
        break;

    case 28800:
        ConfigValue = MAX311xE_WC_DIV_8;
        break;

    case 19200:
        ConfigValue = MAX311xE_WC_DIV_12;
        break;

    case 14400:
        ConfigValue = MAX311xE_WC_DIV_16;
        break;

    case 9600:
        ConfigValue = MAX311xE_WC_DIV_24;
        break;

    case 7200:
        ConfigValue = MAX311xE_WC_DIV_32;
        break;

    case 4800:
        ConfigValue = MAX311xE_WC_DIV_48;
        break;

    case 3600:
        ConfigValue = MAX311xE_WC_DIV_64;
        break;

    case 2400:
        ConfigValue = MAX311xE_WC_DIV_96;
        break;

    case 1800:
        ConfigValue = MAX311xE_WC_DIV_128;
        break;

    case 1200:
        ConfigValue = MAX311xE_WC_DIV_192;
        break;

    case 600:
        ConfigValue = MAX311xE_WC_DIV_384;
        break;
    }

    //
    //  Initialize the UART to 8-bits, no parity, 1 stop bit
    //

    ConfigValue |= MAX311xE_WRITE_CONFIG;
    SpiSend16 (pPort, ConfigValue);
}

BOOLEAN
SpiMax311InitializePort(
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

    DW_APB_SSI_REGISTERS * pSpi;
    ULONG SpiBaudRate;

    UNREFERENCED_PARAMETER(LoadOptions);

    //
    //  Discard any previous receive data
    //

    g_pSpiMax311RxEmpty = &g_SpiMax311RxBuffer[0];
    g_pSpiMax311RxFill = g_pSpiMax311RxEmpty;

    //
    //  Remember the SPI data rate
    //

    pSpi = (DW_APB_SSI_REGISTERS*)DebugPort->Port.Address;
    SpiBaudRate = pSpi->Baudr;
    if (g_SpiBaudRate == 0) {
        g_SpiBaudRate = (UINT16)SpiBaudRate;
    }

    //
    //  Initialize the UART
    //

    SpiMax311SetBaud(&DebugPort->Port, DebugPort->Port.Baud);
    return TRUE;
}

VOID
SpiMax311BufferRxData (
    UINT16 Value
    )

/*++

    Routine Description:

        Place a receive character into the RX buffer

    Arguments:

        Value - Value to buffer

    Return Value:

        None.

--*/

{
    UINT16 * pRxEmpty;
    UINT16 * pRxFill;
    UINT16 * pRxNextFill;
    UINT16 * pBufferEnd;

    //
    //  A receive character is available
    //  Buffer this character for a later receive operation
    //

    pRxFill = g_pSpiMax311RxFill;
    pRxEmpty = g_pSpiMax311RxEmpty;

    //
    //  Wrap the pointer when it reaches the end
    //

    pRxNextFill = &pRxFill[1];
    pBufferEnd = BUFFER_END(g_SpiMax311RxBuffer);
    if (pBufferEnd <= pRxNextFill) {
        pRxNextFill = &g_SpiMax311RxBuffer[0];
    }

    if (pRxEmpty != pRxNextFill) {
        //
        //  Save the value in the receive buffer
        //

        *pRxFill = Value;

        //
        //  Wrap the pointer when it reaches the end
        //

        g_pSpiMax311RxFill = pRxNextFill;
    }
}


BOOLEAN
SpiMax311RxReady(
    _In_ PCPPORT pPort
    )

/*++

    Routine Description:

        Determine if a byte of data has been received

    Arguments:

        pPort - address of port object that describes hw port

    Return Value:

        True if a data byte is available.

--*/

{
    UINT16 Value;

    //
    //  Buffer any receive data
    //

    for (;;) {

        //
        //  Get the receive buffer status from the UART.
        //

        Value = MAX311xE_READ_DATA;
        Value = SpiSend16 (pPort, Value);

        //
        //  Exit the loop if no receive data
        //

        if (0 == (Value & MAX311xE_RD_R)) {
            break;
        }

        //
        //  Buffer any receive data
        //

        SpiMax311BufferRxData (Value);
    }

    //
    //  Determine if there is a received character waiting in the buffer.
    //

    return (g_pSpiMax311RxFill != g_pSpiMax311RxEmpty);
}

_Success_(return == TRUE)
BOOLEAN
SpiMax311RxChar(
    _Out_ PUCHAR pCharacter
    )

/*++

    Routine Description:

        Reads a data byte from the UART

    Arguments:

        pCharacter - address of the buffer to receive the data byte

    Return Value:

        True if a data byte was successfully received, false if a receive
        error occurred.

--*/

{
    UINT16 * pRxEmpty;
    UINT16 * pBufferEnd;
    UINT16 Value;
    BOOLEAN bSuccess;

    //
    //  Empty the receive buffer first
    //

    if (g_pSpiMax311RxEmpty != g_pSpiMax311RxFill) {
        //
        //  Get the next value from the receive buffer
        //

        pRxEmpty = g_pSpiMax311RxEmpty;
        pBufferEnd = BUFFER_END(g_SpiMax311RxBuffer);
        Value = *pRxEmpty++;
        *pCharacter = (UCHAR)Value;

        //
        //  Wrap the pointer when it reaches the end
        //

        if (pBufferEnd <= pRxEmpty) {
            pRxEmpty = &g_SpiMax311RxBuffer[0];
        }

        g_pSpiMax311RxEmpty = pRxEmpty;

        //
        //  Return unsuccessfully if any errors are indicated
        //

        bSuccess = (0 == (Value & MAX311xE_RD_RA_FE));
        return bSuccess;
    }

    //
    //  No data available
    //

    return FALSE;
}


BOOLEAN
SpiMax311TxEmpty(
    _In_ PCPPORT pPort
    )

/*++

    Routine Description:

        Determine if the transmit buffer is empty

    Arguments:

        pPort - address of port object that describes hw port

    Return Value:

        True if the transmit buffer is empty

--*/

{
    UINT16 Value;

    //
    //  Buffer any receive data
    //

    for (;;) {

        //
        //  Get the transmit buffer status from the UART.
        //

        Value = MAX311xE_READ_DATA;
        Value = SpiSend16(pPort, Value);

        //
        //  Exit the loop if no receive data
        //

        if (0 == (Value & MAX311xE_RD_R)) {
            break;
        }

        //
        //  Buffer any receive data
        //

        SpiMax311BufferRxData ( Value );
    }

    //
    //  Determine if there is space in the transmit buffer.
    //

    return (0 != (Value & MAX311xE_RD_T));
}


BOOLEAN
SpiMax311ClearToSend(
    _In_ PCPPORT pPort
    )

/*++

    Routine Description:

        Determine if clear to send (CTS) is set

    Arguments:

        pPort - address of port object that describes hw port

    Return Value:

        True if clear to send is set

--*/

{
    BOOLEAN bClearToSend;
    UINT16 Value;

    //
    //  Buffer any receive data
    //

    for (;;) {

        //
        //  Get the transmit buffer status from the UART.
        //

        Value = MAX311xE_READ_DATA;
        Value = SpiSend16(pPort, Value);

        //
        //  Exit the loop if no receive data
        //

        if (0 == (Value & MAX311xE_RD_R)) {
            break;
        }

        //
        //  Buffer any receive data
        //

        SpiMax311BufferRxData(Value);
    }

    //
    //  Determine if it is clear to send transmit data
    //

    bClearToSend = (0 != (Value & MAX311xE_RD_CTS));
    return bClearToSend;
}


VOID
SpiMax311TxChar(
    _In_ PCPPORT pPort,
    UCHAR Character
    )

/*++

    Routine Description:

        Loads the transmit buffer with a character to send

    Arguments:

        pPort - address of port object that describes hw port

        Character - data byte to send

--*/

{
    UINT16 Value;

    //
    //  The transmitter buffer is now clear, send the character
    //

    Value = MAX311xE_WRITE_DATA | (UINT16) Character;
    Value = SpiSend16(pPort, Value);

    //
    //  Buffer any receive data
    //

    for (;;) {

        //
        //  Exit the loop if no receive data
        //

        if (0 == (Value & MAX311xE_RD_R)) {
            break;
        }

        //
        //  Buffer any receive data
        //

        SpiMax311BufferRxData(Value);

        //
        //  Get the receive buffer status from the UART.
        //

        Value = MAX311xE_READ_DATA;
        Value = SpiSend16(pPort, Value);
    }
}

_Success_(return == CP_GET_SUCCESS)
USHORT
SpiMax311GetByte(
    _In_ PCPPORT pPort,
    _Out_ PUCHAR  Byte,
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
    UNREFERENCED_PARAMETER(CompDbgPortsPresent);

    //
    //  Check to make sure the CPPORT we were passed has been initialized.
    //  (The only time it won't be initialized is when the kernel debugger
    //  is disabled, in which case we just return.)
    //

    if (NULL == pPort->Address) {
        return CP_GET_NODATA;
    }

    //
    //  Determine if any receive data is available
    //

    if (SpiMax311RxReady(pPort)) {

        //
        //  Get the data byte and check for errors
        //

        if (SpiMax311RxChar(Byte)) {

            //
            //  Data byte received successfully.
            //

            return CP_GET_SUCCESS;
        }

        //
        //  Data byte error
        //

        return CP_GET_ERROR;
    }

    //
    //  No data available
    //

    return CP_GET_NODATA;
}

VOID
SpiMax311PutByte(
    _In_ PCPPORT pPort,
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
    UNREFERENCED_PARAMETER(CompDbgPortsPresent);

    //
    //  Wait for the port to be not busy.
    //

    while (!SpiMax311TxEmpty(pPort)) {
    }

    //
    //  Send the data byte
    //

    SpiMax311TxChar(pPort, Byte);
}

KD_HARDWARE_LAYER_DRIVER SpiMax311HardwareLayerDriver = {
    SpiMax311InitializePort,
    SpiMax311PutByte,
    SpiMax311GetByte,
    0, // no transformation while reading or writing to register
};
