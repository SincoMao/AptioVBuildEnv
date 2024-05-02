/*  
	Copyright (c) Microsoft Corporation.  All rights reserved.
	Stub functions for Storport miniport drivers
*/


#include "scsiwmi.h"


#ifndef _SDV_SP_H_
#define _SDV_SP_H_



#ifdef  STATUS_INSUFFICIENT_RESOURCES
#undef  STATUS_INSUFFICIENT_RESOURCES
#endif
#define STATUS_INSUFFICIENT_RESOURCES    96   



#ifdef StorPortInitialize
#undef StorPortInitialize
#endif
#define StorPortInitialize sdv_StorPortInitialize
ULONG
sdv_StorPortInitialize(
    IN PVOID Argument1,
    IN PVOID Argument2,
    IN struct _HW_INITIALIZATION_DATA *HwInitializationData,
    IN PVOID HwContext
    );


#ifdef StorPortFreeDeviceBase
#undef StorPortFreeDeviceBase
#endif
#define StorPortFreeDeviceBase sdv_StorPortFreeDeviceBase
STORPORT_API
VOID
sdv_StorPortFreeDeviceBase(
    IN PVOID HwDeviceExtension,
    IN PVOID MappedAddress
    );


#ifdef StorPortGetBusData
#undef StorPortGetBusData
#endif
#define StorPortGetBusData sdv_StorPortGetBusData
STORPORT_API
ULONG
sdv_StorPortGetBusData(
    IN PVOID DeviceExtension,
    IN ULONG BusDataType,
    IN ULONG SystemIoBusNumber,
    IN ULONG SlotNumber,
    IN PVOID Buffer,
    IN ULONG Length
    );
    

#ifdef StorPortSetBusDataByOffset
#undef StorPortSetBusDataByOffset
#endif
#define StorPortSetBusDataByOffset sdv_StorPortSetBusDataByOffset
STORPORT_API
ULONG
sdv_StorPortSetBusDataByOffset(
    IN PVOID DeviceExtension,
    IN ULONG BusDataType,
    IN ULONG SystemIoBusNumber,
    IN ULONG SlotNumber,
    IN PVOID Buffer,
    IN ULONG Offset,
    IN ULONG Length
    );


#ifdef StorPortGetDeviceBase
#undef StorPortGetDeviceBase
#endif
#define StorPortGetDeviceBase sdv_StorPortGetDeviceBase
STORPORT_API
PVOID
sdv_StorPortGetDeviceBase(
    IN PVOID HwDeviceExtension,
    IN INTERFACE_TYPE BusType,
    IN ULONG SystemIoBusNumber,
    IN STOR_PHYSICAL_ADDRESS IoAddress,
    IN ULONG NumberOfBytes,
    IN BOOLEAN InIoSpace
    );


#ifdef StorPortGetLogicalUnit
#undef StorPortGetLogicalUnit
#endif
#define StorPortGetLogicalUnit sdv_StorPortGetLogicalUnit
STORPORT_API
PVOID
sdv_StorPortGetLogicalUnit(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun
    );


#ifdef StorPortGetScatterGatherList
#undef StorPortGetScatterGatherList
#endif
#define StorPortGetScatterGatherList sdv_StorPortGetScatterGatherList
STORPORT_API
PSTOR_SCATTER_GATHER_LIST
sdv_StorPortGetScatterGatherList(
    IN PVOID HwDeviceExtension,
    IN PSCSI_REQUEST_BLOCK Srb
    );

#ifdef StorPortGetPhysicalAddress
#undef StorPortGetPhysicalAddress
#endif
#define StorPortGetPhysicalAddress sdv_StorPortGetPhysicalAddress
STORPORT_API
STOR_PHYSICAL_ADDRESS
sdv_StorPortGetPhysicalAddress(
    IN PVOID HwDeviceExtension,
    IN PSCSI_REQUEST_BLOCK Srb,
    IN PVOID VirtualAddress,
    OUT ULONG *Length
    );


#ifdef StorPortGetVirtualAddress
#undef StorPortGetVirtualAddress
#endif
#define StorPortGetVirtualAddress sdv_StorPortGetVirtualAddress
STORPORT_API
PVOID
sdv_StorPortGetVirtualAddress(
    IN PVOID HwDeviceExtension,
    IN STOR_PHYSICAL_ADDRESS PhysicalAddress
    );


#ifdef StorPortGetUncachedExtension
#undef StorPortGetUncachedExtension
#endif
#define StorPortGetUncachedExtension sdv_StorPortGetUncachedExtension
STORPORT_API
PVOID
sdv_StorPortGetUncachedExtension(
    IN PVOID HwDeviceExtension,
    IN PPORT_CONFIGURATION_INFORMATION ConfigInfo,
    IN ULONG NumberOfBytes
    );


#ifdef StorPortPauseDevice
#undef StorPortPauseDevice
#endif
#define StorPortPauseDevice sdv_StorPortPauseDevice
STORPORT_API
BOOLEAN
sdv_StorPortPauseDevice(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun,
    IN ULONG Timeout
    );


#ifdef StorPortResumeDevice
#undef StorPortResumeDevice
#endif
#define StorPortResumeDevice sdv_StorPortResumeDevice
STORPORT_API
BOOLEAN
sdv_StorPortResumeDevice(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun
    );


#ifdef StorPortPause
#undef StorPortPause
#endif
#define StorPortPause sdv_StorPortPause
STORPORT_API
BOOLEAN
sdv_StorPortPause(
    IN PVOID HwDeviceExtension,
    IN ULONG Timeout
    );
    
    
#ifdef StorPortResume
#undef StorPortResume
#endif
#define StorPortResume sdv_StorPortResume
STORPORT_API
BOOLEAN
sdv_StorPortResume(
    IN PVOID HwDeviceExtension
    );


#ifdef StorPortDeviceBusy
#undef StorPortDeviceBusy
#endif
#define StorPortDeviceBusy sdv_StorPortDeviceBusy
STORPORT_API
BOOLEAN
sdv_StorPortDeviceBusy(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun,
    IN ULONG RequestsToComplete
    );


#ifdef StorPortDeviceReady
#undef StorPortDeviceReady
#endif
#define StorPortDeviceReady sdv_StorPortDeviceReady
STORPORT_API
BOOLEAN
sdv_StorPortDeviceReady(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun
    );


#ifdef StorPortBusy
#undef StorPortBusy
#endif
#define StorPortBusy sdv_StorPortBusy
STORPORT_API
BOOLEAN
sdv_StorPortBusy(
    IN PVOID HwDeviceExtension,
    IN ULONG RequestsToComplete
    );


#ifdef StorPortReady
#undef StorPortReady
#endif
#define StorPortReady sdv_StorPortReady
STORPORT_API
BOOLEAN
sdv_StorPortReady(
    IN PVOID HwDeviceExtension
    );


#ifdef StorPortSetDeviceQueueDepth
#undef StorPortSetDeviceQueueDepth
#endif
#define StorPortSetDeviceQueueDepth sdv_StorPortSetDeviceQueueDepth
STORPORT_API
BOOLEAN
sdv_StorPortSetDeviceQueueDepth(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun,
    IN ULONG Depth
    );


#ifdef StorPortLogError
#undef StorPortLogError
#endif
#define StorPortLogError sdv_StorPortLogError
STORPORT_API
VOID
sdv_StorPortLogError(
    IN PVOID HwDeviceExtension,
    IN PSCSI_REQUEST_BLOCK Srb OPTIONAL,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun,
    IN ULONG ErrorCode,
    IN ULONG UniqueId
    );


#ifdef StorPortCompleteRequest
#undef StorPortCompleteRequest
#endif
#define StorPortCompleteRequest sdv_StorPortCompleteRequest
STORPORT_API
VOID
sdv_StorPortCompleteRequest(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun,
    IN UCHAR SrbStatus
    );


#ifdef StorPortStallExecution
#undef StorPortStallExecution
#endif
#define StorPortStallExecution sdv_StorPortStallExecution
STORPORT_API
VOID
sdv_StorPortStallExecution(
    IN ULONG Delay
    );


#ifdef StorPortSynchronizeAccess
#undef StorPortSynchronizeAccess
#endif
#define StorPortSynchronizeAccess sdv_StorPortSynchronizeAccess
STORPORT_API
BOOLEAN
sdv_StorPortSynchronizeAccess(
    IN PVOID HwDeviceExtension,
    IN PSTOR_SYNCHRONIZED_ACCESS SynchronizedAccessRoutine,
    IN PVOID Context
    );


#ifdef StorPortReadPortUchar
#undef StorPortReadPortUchar
#endif
#define StorPortReadPortUchar sdv_StorPortReadPortUchar
STORPORT_API
UCHAR
sdv_StorPortReadPortUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Port
    );


#ifdef StorPortReadPortUshort
#undef StorPortReadPortUshort
#endif
#define StorPortReadPortUshort sdv_StorPortReadPortUshort
STORPORT_API
USHORT
sdv_StorPortReadPortUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Port
    );


#ifdef StorPortReadPortUlong
#undef StorPortReadPortUlong
#endif
#define StorPortReadPortUlong sdv_StorPortReadPortUlong
STORPORT_API
ULONG
sdv_StorPortReadPortUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Port
    );


#ifdef StorPortReadPortBufferUchar
#undef StorPortReadPortBufferUchar
#endif
#define StorPortReadPortBufferUchar sdv_StorPortReadPortBufferUchar
STORPORT_API
VOID
sdv_StorPortReadPortBufferUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Port,
    IN PUCHAR Buffer,
    IN ULONG  Count
    );


#ifdef StorPortReadPortBufferUshort
#undef StorPortReadPortBufferUshort
#endif
#define StorPortReadPortBufferUshort sdv_StorPortReadPortBufferUshort
STORPORT_API
VOID
sdv_StorPortReadPortBufferUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Port,
    IN PUSHORT Buffer,
    IN ULONG Count
    );


#ifdef StorPortReadPortBufferUlong
#undef StorPortReadPortBufferUlong
#endif
#define StorPortReadPortBufferUlong sdv_StorPortReadPortBufferUlong
STORPORT_API
VOID
sdv_StorPortReadPortBufferUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Port,
    IN PULONG Buffer,
    IN ULONG Count
    );


#ifdef StorPortReadRegisterUchar
#undef StorPortReadRegisterUchar
#endif
#define StorPortReadRegisterUchar sdv_StorPortReadRegisterUchar
STORPORT_API
UCHAR
sdv_StorPortReadRegisterUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Register
    );


#ifdef StorPortReadRegisterUshort
#undef StorPortReadRegisterUshort
#endif
#define StorPortReadRegisterUshort sdv_StorPortReadRegisterUshort
STORPORT_API
USHORT
sdv_StorPortReadRegisterUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Register
    );


#ifdef StorPortReadRegisterUlong
#undef StorPortReadRegisterUlong
#endif
#define StorPortReadRegisterUlong sdv_StorPortReadRegisterUlong
STORPORT_API
ULONG
sdv_StorPortReadRegisterUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Register
    );


#ifdef StorPortReadRegisterBufferUchar
#undef StorPortReadRegisterBufferUchar
#endif
#define StorPortReadRegisterBufferUchar sdv_StorPortReadRegisterBufferUchar
STORPORT_API
VOID
sdv_StorPortReadRegisterBufferUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Register,
    IN PUCHAR Buffer,
    IN ULONG  Count
    );


#ifdef StorPortReadRegisterBufferUshort
#undef StorPortReadRegisterBufferUshort
#endif
#define StorPortReadRegisterBufferUshort sdv_StorPortReadRegisterBufferUshort
STORPORT_API
VOID
sdv_StorPortReadRegisterBufferUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Register,
    IN PUSHORT Buffer,
    IN ULONG Count
    );


#ifdef StorPortReadRegisterBufferUlong
#undef StorPortReadRegisterBufferUlong
#endif
#define StorPortReadRegisterBufferUlong sdv_StorPortReadRegisterBufferUlong
STORPORT_API
VOID
sdv_StorPortReadRegisterBufferUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Register,
    IN PULONG Buffer,
    IN ULONG Count
    );


#ifdef StorPortWritePortUchar
#undef StorPortWritePortUchar
#endif
#define StorPortWritePortUchar sdv_StorPortWritePortUchar
STORPORT_API
VOID
sdv_StorPortWritePortUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Port,
    IN UCHAR Value
    );


#ifdef StorPortWritePortUshort
#undef StorPortWritePortUshort
#endif
#define StorPortWritePortUshort sdv_StorPortWritePortUshort
STORPORT_API
VOID
sdv_StorPortWritePortUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Port,
    IN USHORT Value
    );


#ifdef StorPortWritePortUlong
#undef StorPortWritePortUlong
#endif
#define StorPortWritePortUlong sdv_StorPortWritePortUlong
STORPORT_API
VOID
sdv_StorPortWritePortUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Port,
    IN ULONG Value
    );


#ifdef StorPortWritePortBufferUchar
#undef StorPortWritePortBufferUchar
#endif
#define StorPortWritePortBufferUchar sdv_StorPortWritePortBufferUchar
STORPORT_API
VOID
sdv_StorPortWritePortBufferUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Port,
    IN PUCHAR Buffer,
    IN ULONG  Count
    );


#ifdef StorPortWritePortBufferUshort
#undef StorPortWritePortBufferUshort
#endif
#define StorPortWritePortBufferUshort sdv_StorPortWritePortBufferUshort
STORPORT_API
VOID
sdv_StorPortWritePortBufferUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Port,
    IN PUSHORT Buffer,
    IN ULONG Count
    );


#ifdef StorPortWritePortBufferUlong
#undef StorPortWritePortBufferUlong
#endif
#define StorPortWritePortBufferUlong sdv_StorPortWritePortBufferUlong
STORPORT_API
VOID
sdv_StorPortWritePortBufferUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Port,
    IN PULONG Buffer,
    IN ULONG Count
    );


#ifdef StorPortWriteRegisterUchar
#undef StorPortWriteRegisterUchar
#endif
#define StorPortWriteRegisterUchar sdv_StorPortWriteRegisterUchar
STORPORT_API
VOID
sdv_StorPortWriteRegisterUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Register,
    IN UCHAR Value
    );


#ifdef StorPortWriteRegisterUshort
#undef StorPortWriteRegisterUshort
#endif
#define StorPortWriteRegisterUshort sdv_StorPortWriteRegisterUshort
STORPORT_API
VOID
sdv_StorPortWriteRegisterUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Register,
    IN USHORT Value
    );


#ifdef StorPortWriteRegisterUlong
#undef StorPortWriteRegisterUlong
#endif
#define StorPortWriteRegisterUlong sdv_StorPortWriteRegisterUlong
STORPORT_API
VOID
sdv_StorPortWriteRegisterUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Register,
    IN ULONG Value
    );


#ifdef StorPortWriteRegisterBufferUchar
#undef StorPortWriteRegisterBufferUchar
#endif
#define StorPortWriteRegisterBufferUchar sdv_StorPortWriteRegisterBufferUchar
STORPORT_API
VOID
sdv_StorPortWriteRegisterBufferUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Register,
    IN PUCHAR Buffer,
    IN ULONG  Count
    );


#ifdef StorPortWriteRegisterBufferUshort
#undef StorPortWriteRegisterBufferUshort
#endif
#define StorPortWriteRegisterBufferUshort sdv_StorPortWriteRegisterBufferUshort
STORPORT_API
VOID
sdv_StorPortWriteRegisterBufferUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Register,
    IN PUSHORT Buffer,
    IN ULONG Count
    );


#ifdef StorPortWriteRegisterBufferUlong
#undef StorPortWriteRegisterBufferUlong
#endif
#define StorPortWriteRegisterBufferUlong sdv_StorPortWriteRegisterBufferUlong
STORPORT_API
VOID
sdv_StorPortWriteRegisterBufferUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Register,
    IN PULONG Buffer,
    IN ULONG Count
    );


#ifdef StorPortMoveMemory
#undef StorPortMoveMemory
#endif
#define StorPortMoveMemory sdv_StorPortMoveMemory
STORPORT_API
VOID
sdv_StorPortMoveMemory(
    IN PVOID WriteBuffer,
    IN PVOID ReadBuffer,
    IN ULONG Length
    );


#ifdef StorPortConvertUlongToPhysicalAddress
#undef StorPortConvertUlongToPhysicalAddress
#endif
#define StorPortConvertUlongToPhysicalAddress sdv_StorPortConvertUlongToPhysicalAddress
STORPORT_API
STOR_PHYSICAL_ADDRESS
sdv_StorPortConvertUlongToPhysicalAddress(
    ULONG_PTR UlongAddress
    );


#ifdef StorPortConvertPhysicalAddressToUlong
#undef StorPortConvertPhysicalAddressToUlong
#endif
#define StorPortConvertPhysicalAddressToUlong sdv_StorPortConvertPhysicalAddressToUlong
STORPORT_API
ULONG
sdv_StorPortConvertPhysicalAddressToUlong(
    STOR_PHYSICAL_ADDRESS Address
    );


#ifdef StorPortQuerySystemTime
#undef StorPortQuerySystemTime
#endif
#define StorPortQuerySystemTime sdv_StorPortQuerySystemTime
STORPORT_API
VOID
sdv_StorPortQuerySystemTime(
    OUT PLARGE_INTEGER CurrentTime
    );


#ifdef StorPortAllocateRegistryBuffer
#undef StorPortAllocateRegistryBuffer
#endif
#define StorPortAllocateRegistryBuffer sdv_StorPortAllocateRegistryBuffer
STORPORT_API
PUCHAR
sdv_StorPortAllocateRegistryBuffer(
    IN PVOID HwDeviceExtension,
    IN PULONG Length
    );


#ifdef StorPortFreeRegistryBuffer
#undef StorPortFreeRegistryBuffer
#endif
#define StorPortFreeRegistryBuffer sdv_StorPortFreeRegistryBuffer
STORPORT_API
VOID
sdv_StorPortFreeRegistryBuffer(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Buffer
    );


#ifdef StorPortRegistryRead
#undef StorPortRegistryRead
#endif
#define StorPortRegistryRead sdv_StorPortRegistryRead
BOOLEAN
sdv_StorPortRegistryRead(
    IN PVOID HwDeviceExtension,
    IN PUCHAR ValueName,
    IN ULONG Global,
    IN ULONG Type,
    IN PUCHAR Buffer,
    IN PULONG BufferLength
    );


#ifdef StorPortRegistryWrite
#undef StorPortRegistryWrite
#endif
#define StorPortRegistryWrite sdv_StorPortRegistryWrite
STORPORT_API
BOOLEAN
sdv_StorPortRegistryWrite(
    IN PVOID HwDeviceExtension,
    IN PUCHAR ValueName,
    IN ULONG Global,
    IN ULONG Type,
    IN PUCHAR Buffer,
    IN ULONG BufferLength
    );

#ifdef StorPortValidateRange
#undef StorPortValidateRange
#endif
#define StorPortValidateRange sdv_StorPortValidateRange
__drv_preferredFunction("(see documentation)", "Obsolete")
STORPORT_API
BOOLEAN
sdv_StorPortValidateRange(
    IN PVOID HwDeviceExtension,
    IN INTERFACE_TYPE BusType,
    IN ULONG SystemIoBusNumber,
    IN STOR_PHYSICAL_ADDRESS IoAddress,
    IN ULONG NumberOfBytes,
    IN BOOLEAN InIoSpace
    );


#ifdef StorPortDebugPrint
#undef StorPortDebugPrint
#endif
#define StorPortDebugPrint sdv_StorPortDebugPrint
STORPORT_API
VOID
sdv_StorPortDebugPrint(
    ULONG DebugPrintLevel,
    PCCHAR DebugMessage,
    ...
    );

/*
	t-anseyf
	Added to make the SpinLockDpc rule work.
	Edit: nevermind, doesn't work yet.

#ifdef KeAcquireSpinLockRaiseToDpc
#undef KeAcquireSpinLockRaiseToDpc
#endif
#define KeAcquireSpinLockRaiseToDpc sdv_KeAcquireSpinLockRaiseToDpc
VOID
sdv_KeAcquireSpinLockRaiseToDpc(
    IN PKSPIN_LOCK SpinLock );

/*





/*
TdiRegisterPnPHandlers
TdiDeregisterPnPHandlers
*/

/*#ifdef TDI_STATUS_BAD_VERSION
#undef TDI_STATUS_BAD_VERSION
#endif
#define  TDI_STATUS_BAD_VERSION             1000

#ifdef TDI_STATUS_BAD_CHARACTERISTICS
#undef TDI_STATUS_BAD_CHARACTERISTICS 
#endif
#define  TDI_STATUS_BAD_CHARACTERISTICS     1001

#ifdef TdiRegisterPnPHandlers
#undef TdiRegisterPnPHandlers
#endif
#define TdiRegisterPnPHandlers sdv_TdiRegisterPnPHandlers
NTSTATUS
sdv_TdiRegisterPnPHandlers(
    IN PTDI_CLIENT_INTERFACE_INFO ClientInterfaceInfo,
    IN ULONG InterfaceInfoSize,
    OUT HANDLE *BindingHandle
    );


#ifdef TdiDeregisterPnPHandlers
#undef TdiDeregisterPnPHandlers
#endif
#define TdiDeregisterPnPHandlers sdv_TdiDeregisterPnPHandlers
NTSTATUS
sdv_TdiDeregisterPnPHandlers(
    IN HANDLE BindingHandle
    );
*/
/*
#ifdef WskRegister
#undef WskRegister
#endif
#define WskRegister sdv_WskRegister
NTSTATUS
WskRegister(    
    __in PWSK_CLIENT_NPI WskClientNpi,    
    __out PWSK_REGISTRATION WskRegistration
    );
*/


#define	__sdv_save_request sdv_save_request
void sdv_save_request(void *r);
#define	__sdv_retrieve_request sdv_retrieve_request
void sdv_retrieve_request(void *r);


void sdv_io_read_begin();
void sdv_io_read_end();
void sdv_io_write_begin();
void sdv_io_write_end();
void sdv_io_default_begin();
void sdv_io_default_end();
void sdv_device_control_begin();
void sdv_device_control_end();
void sdv_internal_device_control_begin();
void sdv_internal_device_control_end();

#endif


/*
	t-anseyf
	Added for the StorPortFindAdapter SLIC rule.
*/
BOOLEAN sdv_CheckConfig(PPORT_CONFIGURATION_INFORMATION sdv_ConfigInfo);

/*
	t-anseyf
	Added for the StorPortMSILock SLIC rule.
*/
BOOLEAN sdv_CheckMSILock(PPORT_CONFIGURATION_INFORMATION sdv_ConfigInfo);

#ifdef StorPortAcquireSpinLock 
#undef StorPortAcquireSpinLock 
#endif
#define StorPortAcquireSpinLock sdv_StorPortAcquireSpinLock
VOID
FORCEINLINE
sdv_StorPortAcquireSpinLock(
    __in PVOID DeviceExtension,
    __in STOR_SPINLOCK SpinLock,
    __in PVOID LockContext,
    __inout __deref __drv_acquiresExclusiveResource(LockHandle)
    PSTOR_LOCK_HANDLE LockHandle
    );

#ifdef StorPortAllocatePool
#undef StorPortAllocatePool
#endif
#define StorPortAllocatePool sdv_StorPortAllocatePool
STORPORT_API
FORCEINLINE
ULONG
sdv_StorPortAllocatePool(
	IN PVOID  HwDeviceExtension,
    IN ULONG  NumberOfBytes,
    IN ULONG  Tag,
    OUT PVOID  *BufferPointer
    );

BOOLEAN sdv_CheckTimer();

/*
	t-anseyf
	Added for the StorPortVirtualDevice SLIC rule.
*/
BOOLEAN sdv_CheckVirtual(PPORT_CONFIGURATION_INFORMATION sdv_ConfigInfo);

/*
	t-anseyf
	Added for the StorPortStatusPending SLIC rule.
*/
BOOLEAN sdv_SrbStatusPending(PSCSI_REQUEST_BLOCK Srb);

/*
	t-anseyf
	Following is Jakob's code added to sdv-wdm.h in the sdv_breakpoint change pack.
*/
#ifdef __sdv_breakpoint
#undef __sdv_breakpoint
#endif
#define __sdv_breakpoint sdv___sdv_breakpoint
__forceinline
sdv___sdv_breakpoint (
    );

#ifdef __sdv_breakpoint_conditional
#undef __sdv_breakpoint_conditional
#endif
#define __sdv_breakpoint_conditional sdv___sdv_breakpoint_conditional
__forceinline
sdv___sdv_breakpoint_conditional (
    BOOLEAN condition
    );

#ifdef StorPortReleaseSpinLock
#undef StorPortReleaseSpinLock
#endif
#define StorPortReleaseSpinLock sdv_StorPortReleaseSpinLock
STORPORT_API
VOID
FORCEINLINE
sdv_StorPortReleaseSpinLock(
	IN PVOID  HwDeviceExtension,
    IN PSTOR_LOCK_HANDLE 
    );

   
#ifdef StorPortEnablePassiveInitialization
#undef StorPortEnablePassiveInitialization
#endif
#define StorPortEnablePassiveInitialization sdv_StorPortEnablePassiveInitialization

BOOLEAN
FORCEINLINE
sdv_StorPortEnablePassiveInitialization(
    __in PVOID DeviceExtension,
    __in PHW_PASSIVE_INITIALIZE_ROUTINE HwPassiveInitializeRoutine
    );

#ifdef StorPortInitializeDpc
#undef StorPortInitializeDpc
#endif
#define StorPortInitializeDpc sdv_StorPortInitializeDpc


VOID
FORCEINLINE
sdv_StorPortInitializeDpc(
    __in PVOID DeviceExtension,
    __out PSTOR_DPC Dpc,
    __in PHW_DPC_ROUTINE HwDpcRoutine
    );

#ifdef StorPortIssueDpc
#undef StorPortIssueDpc
#endif
#define StorPortIssueDpc sdv_StorPortIssueDpc

BOOLEAN
FORCEINLINE
sdv_StorPortIssueDpc(
    __in PVOID DeviceExtension,
    __in PSTOR_DPC Dpc,
    __in PVOID SystemArgument1,
    __in PVOID SystemArgument2
    );
    
    
#ifdef ScsiPortWmiDispatchFunction
#undef ScsiPortWmiDispatchFunction
#endif
#define ScsiPortWmiDispatchFunction sdv_ScsiPortWmiDispatchFunction
    
BOOLEAN sdv_ScsiPortWmiDispatchFunction(
  PSCSI_WMILIB_CONTEXT WmiLibInfo,
  UCHAR MinorFunction,
  PVOID DeviceContext,
  PSCSIWMI_REQUEST_CONTEXT RequestContext,
  PVOID DataPath,
  ULONG BufferSize,
  PVOID Buffer
);


#ifdef ScsiPortWmiGetReturnSize
#undef ScsiPortWmiGetReturnSize
#endif
#define ScsiPortWmiGetReturnSize sdv_ScsiPortWmiGetReturnSize

ULONG sdv_ScsiPortWmiGetReturnSize(
  PSCSIWMI_REQUEST_CONTEXT RequestContext
);

#ifdef ScsiPortWmiGetReturnStatus
#undef ScsiPortWmiGetReturnStatus
#endif
#define ScsiPortWmiGetReturnStatus sdv_ScsiPortWmiGetReturnStatus

UCHAR sdv_ScsiPortWmiGetReturnStatus(
  PSCSIWMI_REQUEST_CONTEXT RequestContext
);

#ifdef ScsiPortWmiPostProcess
#undef ScsiPortWmiPostProcess
#endif
#define ScsiPortWmiPostProcess sdv_ScsiPortWmiPostProcess

VOID sdv_ScsiPortWmiPostProcess(
  PSCSIWMI_REQUEST_CONTEXT RequestContext,
  UCHAR SrbStatus,
  ULONG BufferUsed
);


#if (NTDDI_VERSION >= NTDDI_WIN8)

#ifdef StorPortStateChangeDetected
#undef StorPortStateChangeDetected
#endif
#define StorPortStateChangeDetected sdv_StorPortStateChangeDetected

ULONG
FORCEINLINE
sdv_StorPortStateChangeDetected(
    PVOID HwDeviceExtension,
    ULONG ChangedEntity,
    PSTOR_ADDRESS Address,
    ULONG Attributes,
    PHW_STATE_CHANGE HwStateChange,
    PVOID HwStateChangeContext
    );
    
#ifdef StorPortRequestTimer
#undef StorPortRequestTimer
#endif
#define StorPortRequestTimer sdv_StorPortRequestTimer

ULONG
FORCEINLINE
sdv_StorPortRequestTimer(
    PVOID HwDeviceExtension,
    PVOID TimerHandle,
    PHW_TIMER_EX TimerCallback,
    PVOID CallbackContext,
    ULONGLONG TimerValue,
    ULONGLONG TolerableDelay
    );

    

#endif

VOID
sdv_RunHwDpcRoutines(
    struct _KDPC *kdpc, 
    PVOID pDpcContext, 
    PVOID pv2, 
    PVOID pv3
    );


BOOLEAN sdv_SrbStatusSuccess(PSCSI_REQUEST_BLOCK Srb);

BOOLEAN sdv_SrbDataLengthTheSame(PSCSI_REQUEST_BLOCK Srb);


VOID run_HwTimerRoutines(
  PVOID DeviceExtension,
  PHW_TIMER HwTimerRoutine
);

VOID run_HwTimerExRoutines(
  PVOID DeviceExtension,
  PHW_TIMER_EX HwTimerExRoutine,
  PVOID CallbackContext
);



PCHAR sdv_containing_record(
    IN PCHAR Address,
	IN ULONG_PTR FieldOffset
    );



/*#ifdef FIELD_OFFSET
#undef FIELD_OFFSET
#endif
#define FIELD_OFFSET(Type,Field) sdv_FIELD_OFFSET(Field)

LONG sdv_FIELD_OFFSET(
  PCHAR Field
);


#ifdef RTL_FIELD_SIZE
#undef RTL_FIELD_SIZE
#endif
#define RTL_FIELD_SIZE(Type,Field) sdv_RTL_FIELD_SIZE(Field)

LONG RTL_FIELD_SIZE(
  PCHAR Field
);

#ifdef RTL_SIZEOF_THROUGH_FIELD
#undef RTL_SIZEOF_THROUGH_FIELD
#endif
#define RTL_SIZEOF_THROUGH_FIELD(Type,Field) sdv_RTL_SIZEOF_THROUGH_FIELD(Field)

LONG RTL_SIZEOF_THROUGH_FIELD(
  PCHAR Field
);

#ifdef RTL_CONTAINS_FIELD
#undef RTL_CONTAINS_FIELD
#endif
#define RTL_CONTAINS_FIELD(Struct,Type,Field) sdv_RTL_CONTAINS_FIELD(Struct,Field)

BOOLEAN sdv_RTL_CONTAINS_FIELD(
  PVOID Struct,
  PCHAR Field
);
*/


#ifdef ScsiGetTotalSenseByteCountIndicated
#undef ScsiGetTotalSenseByteCountIndicated
#endif
#define ScsiGetTotalSenseByteCountIndicated sdv_ScsiGetTotalSenseByteCountIndicated

FORCEINLINE BOOLEAN
sdv_ScsiGetTotalSenseByteCountIndicated (
   PVOID SenseInfoBuffer,
   UCHAR SenseInfoBufferLength,
   UCHAR *TotalByteCountIndicated
   );
   
#ifdef ScsiGetFixedSenseKeyAndCodes
#undef ScsiGetFixedSenseKeyAndCodes
#endif
#define ScsiGetFixedSenseKeyAndCodes sdv_ScsiGetFixedSenseKeyAndCodes
   
FORCEINLINE BOOLEAN
sdv_ScsiGetFixedSenseKeyAndCodes (
    PVOID SenseInfoBuffer,
    UCHAR SenseInfoBufferLength,
    PUCHAR SenseKey,
    PUCHAR AdditionalSenseCode,
    PUCHAR AdditionalSenseCodeQualifier
   );

#ifdef ScsiGetDescriptorSenseKeyAndCodes
#undef ScsiGetDescriptorSenseKeyAndCodes
#endif
#define ScsiGetDescriptorSenseKeyAndCodes sdv_ScsiGetDescriptorSenseKeyAndCodes
   
FORCEINLINE BOOLEAN
sdv_ScsiGetDescriptorSenseKeyAndCodes (
    PVOID SenseInfoBuffer,
    UCHAR SenseInfoBufferLength,
    PUCHAR SenseKey,
    PUCHAR AdditionalSenseCode,
    PUCHAR AdditionalSenseCodeQualifier
   );


#ifdef ScsiGetDescriptorSenseKeyAndCodes
#undef ScsiGetDescriptorSenseKeyAndCodes
#endif
#define ScsiGetDescriptorSenseKeyAndCodes sdv_ScsiGetDescriptorSenseKeyAndCodes

   
FORCEINLINE BOOLEAN
ScsiGetSenseDescriptor(
   PVOID SenseInfoBuffer,
   UCHAR SenseInfoBufferLength,
   PVOID *DescriptorBuffer,
   UCHAR *DescriptorBufferLength
   );

#ifdef ScsiValidateInformationSenseDescriptor
#undef ScsiValidateInformationSenseDescriptor
#endif
#define ScsiValidateInformationSenseDescriptor sdv_ScsiValidateInformationSenseDescriptor

FORCEINLINE BOOLEAN
sdv_ScsiValidateInformationSenseDescriptor(
    PVOID DescriptorBuffer,
    UCHAR DescriptorBufferLength
    );
    
    
#ifdef ScsiValidateInformationSenseDescriptor
#undef ScsiValidateInformationSenseDescriptor
#endif
#define ScsiValidateInformationSenseDescriptor sdv_ScsiValidateInformationSenseDescriptor
    
FORCEINLINE BOOLEAN
sdv_ScsiValidateBlockCommandSenseDescriptor(
    PVOID DescriptorBuffer,
    UCHAR DescriptorBufferLength
    );

#ifdef ScsiConvertToFixedSenseFormat
#undef ScsiConvertToFixedSenseFormat
#endif
#define ScsiConvertToFixedSenseFormat sdv_ScsiConvertToFixedSenseFormat

FORCEINLINE BOOLEAN
sdv_ScsiConvertToFixedSenseFormat(
    PVOID SenseInfoBuffer,
    UCHAR SenseInfoBufferLength,
    PVOID OutBuffer,
    UCHAR OutBufferLength
    );

#ifdef ScsiGetNextSenseDescriptorByType
#undef ScsiGetNextSenseDescriptorByType
#endif
#define ScsiGetNextSenseDescriptorByType sdv_ScsiGetNextSenseDescriptorByType

FORCEINLINE BOOLEAN
sdv_ScsiGetNextSenseDescriptorByType (
    PVOID Buffer,
    UCHAR BufferLength,
    PUCHAR TypeList,    
    ULONG TypeListCount,
    PUCHAR OutType,
    PVOID *OutBuffer,
    UCHAR *OutBufferLength
);

#ifdef StorPortExtendedFunction
#undef StorPortExtendedFunction
#endif
#define StorPortExtendedFunction sdv_StorPortExtendedFunction

STORPORT_API
ULONG
sdv_StorPortExtendedFunction(
    STORPORT_FUNCTION_CODE FunctionCode,
    PVOID HwDeviceExtension,
    ...
    );

#ifdef StorPortFreePool
#undef StorPortFreePool
#endif
#define StorPortFreePool sdv_StorPortFreePool
   
ULONG
FORCEINLINE
StorPortFreePool(
    PVOID HwDeviceExtension,
    PVOID BufferPointer
    );
    
#ifdef StorPortAllocateMdl
#undef StorPortAllocateMdl
#endif
#define StorPortAllocateMdl sdv_StorPortAllocateMdl

ULONG
FORCEINLINE
StorPortAllocateMdl(
    PVOID HwDeviceExtension,
    PVOID BufferPointer,
    ULONG NumberOfBytes,
    PVOID *Mdl
    );

#ifdef StorPortFreeMdl
#undef StorPortFreeMdl
#endif
#define StorPortFreeMdl sdv_StorPortFreeMdl

ULONG
FORCEINLINE
sdv_StorPortFreeMdl(
    PVOID HwDeviceExtension,
    PVOID Mdl
    );

#ifdef StorPortBuildMdlForNonPagedPool
#undef StorPortBuildMdlForNonPagedPool
#endif
#define StorPortBuildMdlForNonPagedPool sdv_StorPortBuildMdlForNonPagedPool

ULONG
FORCEINLINE
sdv_StorPortBuildMdlForNonPagedPool(
    PVOID HwDeviceExtension,
    PVOID Mdl
    );
    
#ifdef StorPortGetSystemAddress
#undef StorPortGetSystemAddress
#endif
#define StorPortGetSystemAddress sdv_StorPortGetSystemAddress

ULONG
FORCEINLINE
sdv_StorPortGetSystemAddress(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    PVOID *SystemAddress
    );


#if (NTDDI_VERSION >= NTDDI_WIN8)

#ifdef StorPortGetOriginalMdl
#undef StorPortGetOriginalMdl
#endif
#define StorPortGetOriginalMdl sdv_StorPortGetOriginalMdl

ULONG
FORCEINLINE
sdv_StorPortGetOriginalMdl(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    PVOID *Mdl
    );

#ifdef StorPortCompleteServiceIrp
#undef StorPortCompleteServiceIrp
#endif
#define StorPortCompleteServiceIrp sdv_StorPortCompleteServiceIrp

ULONG
FORCEINLINE
sdv_StorPortCompleteServiceIrp(
    PVOID HwDeviceExtension,
    PVOID Irp
    );


#ifdef StorPortGetDeviceObjects
#undef StorPortGetDeviceObjects
#endif
#define StorPortGetDeviceObjects sdv_StorPortGetDeviceObjects

ULONG
FORCEINLINE
sdv_StorPortGetDeviceObjects(
    PVOID HwDeviceExtension,
    PVOID *AdapterDeviceObject,
    PVOID *PhysicalDeviceObject,
    PVOID *LowerDeviceObject
    );
    
#ifdef StorPortBuildScatterGatherList
#undef StorPortBuildScatterGatherList
#endif
#define StorPortBuildScatterGatherList sdv_StorPortBuildScatterGatherList
    
ULONG
FORCEINLINE
sdv_StorPortBuildScatterGatherList(
    PVOID HwDeviceExtension,
    PVOID Mdl,
     PVOID CurrentVa,
    ULONG Length,
    PPOST_SCATTER_GATHER_EXECUTE ExecutionRoutine,
    PVOID Context,
    BOOLEAN WriteToDevice,
    PVOID ScatterGatherBuffer,
    ULONG ScatterGatherBufferLength
    );
    
#ifdef StorPortPutScatterGatherList
#undef StorPortPutScatterGatherList
#endif
#define StorPortPutScatterGatherList sdv_StorPortPutScatterGatherList

ULONG
FORCEINLINE
sdv_StorPortPutScatterGatherList(
    PVOID HwDeviceExtension,
    PSTOR_SCATTER_GATHER_LIST ScatterGatherList,
    BOOLEAN WriteToDevice
    );

#ifdef StorPortAcquireMSISpinLock
#undef StorPortAcquireMSISpinLock
#endif
#define StorPortAcquireMSISpinLock sdv_StorPortAcquireMSISpinLock

ULONG
FORCEINLINE
sdv_StorPortAcquireMSISpinLock(
    PVOID HwDeviceExtension,
    ULONG MessageId,
    PULONG OldIrql
    );

#ifdef StorPortReleaseMSISpinLock
#undef StorPortReleaseMSISpinLock
#endif
#define StorPortReleaseMSISpinLock sdv_StorPortReleaseMSISpinLock

ULONG
FORCEINLINE
sdv_StorPortReleaseMSISpinLock(
    PVOID HwDeviceExtension,
    ULONG MessageId,
    ULONG OldIrql
    );

#ifdef StorPortGetMSIInfo
#undef StorPortGetMSIInfo
#endif
#define StorPortGetMSIInfo sdv_StorPortGetMSIInfo

ULONG
FORCEINLINE
sdv_StorPortGetMSIInfo(
    PVOID HwDeviceExtension,
    ULONG MessageId,
    PMESSAGE_INTERRUPT_INFORMATION InterruptInfo
    );

#ifdef StorPortInitializePerfOpts
#undef StorPortInitializePerfOpts
#endif
#define StorPortInitializePerfOpts sdv_StorPortInitializePerfOpts

ULONG
FORCEINLINE
sdv_StorPortInitializePerfOpts(
    PVOID HwDeviceExtension,
    BOOLEAN Query,
    PPERF_CONFIGURATION_DATA PerfConfigData
    );

#ifdef StorPortGetStartIoPerfParams
#undef StorPortGetStartIoPerfParams
#endif
#define StorPortGetStartIoPerfParams sdv_StorPortGetStartIoPerfParams

ULONG
FORCEINLINE
sdv_StorPortGetStartIoPerfParams(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    PSTARTIO_PERFORMANCE_PARAMETERS StartIoPerfParams
    );

#ifdef StorPortLogSystemEvent
#undef StorPortLogSystemEvent
#endif
#define StorPortLogSystemEvent sdv_StorPortLogSystemEvent

ULONG
FORCEINLINE
sdv_StorPortLogSystemEvent(
    PVOID HwDeviceExtension,
    PSTOR_LOG_EVENT_DETAILS LogDetails,
    PULONG MaximumSize
    );

#ifdef StorPortGetCurrentProcessorNumber
#undef StorPortGetCurrentProcessorNumber
#endif
#define StorPortGetCurrentProcessorNumber sdv_StorPortGetCurrentProcessorNumber

ULONG
FORCEINLINE
sdv_StorPortGetCurrentProcessorNumber (
    PVOID HwDeviceExtension,
    PPROCESSOR_NUMBER ProcNumber
    );

#ifdef StorPortGetGroupAffinity
#undef StorPortGetGroupAffinity
#endif
#define StorPortGetGroupAffinity sdv_StorPortGetGroupAffinity

ULONG
FORCEINLINE
sdv_StorPortGetGroupAffinity (
    PVOID HwDeviceExtension,
    USHORT GroupNumber,
    PKAFFINITY GroupAffinityMask
    );

#ifdef StorPortGetActiveGroupCount
#undef StorPortGetActiveGroupCount
#endif
#define StorPortGetActiveGroupCount sdv_StorPortGetActiveGroupCount

ULONG
FORCEINLINE
sdv_StorPortGetActiveGroupCount (
    PVOID HwDeviceExtension,
    PUSHORT NumberGroups
    );

#ifdef StorPortGetNodeAffinity
#undef StorPortGetNodeAffinity
#endif
#define StorPortGetNodeAffinity sdv_StorPortGetNodeAffinity

ULONG
FORCEINLINE
sdv_StorPortGetNodeAffinity (
    PVOID HwDeviceExtension,
    ULONG NodeNumber,
    PGROUP_AFFINITY NodeAffinityMask
    );

#ifdef StorPortGetActiveNodeCount
#undef StorPortGetActiveNodeCount
#endif
#define StorPortGetActiveNodeCount sdv_StorPortGetActiveNodeCount

ULONG
FORCEINLINE
sdv_StorPortGetActiveNodeCount (
    PVOID HwDeviceExtension,
    PULONG NumberNodes
    );
    
    
#ifdef StorPortGetHighestNodeNumber
#undef StorPortGetHighestNodeNumber
#endif
#define StorPortGetHighestNodeNumber sdv_StorPortGetHighestNodeNumber

ULONG
FORCEINLINE
sdv_StorPortGetHighestNodeNumber (
    PVOID HwDeviceExtension,
    PULONG HighestNode
    );

#ifdef StorPortGetLogicalProcessorRelationship
#undef StorPortGetLogicalProcessorRelationship
#endif
#define StorPortGetLogicalProcessorRelationship sdv_StorPortGetLogicalProcessorRelationship


ULONG
FORCEINLINE
sdv_StorPortGetLogicalProcessorRelationship (
    PVOID HwDeviceExtension,
    PPROCESSOR_NUMBER ProcessorNumber,
    LOGICAL_PROCESSOR_RELATIONSHIP RelationshipType,
    PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX Information,
    PULONG Length
    );

#ifdef StorPortAllocateContiguousMemorySpecifyCacheNode
#undef StorPortAllocateContiguousMemorySpecifyCacheNode
#endif
#define StorPortAllocateContiguousMemorySpecifyCacheNode sdv_StorPortAllocateContiguousMemorySpecifyCacheNode



ULONG
FORCEINLINE
sdv_StorPortAllocateContiguousMemorySpecifyCacheNode (
    PVOID HwDeviceExtension,
    SIZE_T NumberOfBytes,
    PHYSICAL_ADDRESS LowestAcceptableAddress,
    PHYSICAL_ADDRESS HighestAcceptableAddress,
    PHYSICAL_ADDRESS BoundaryAddressMultiple,
    MEMORY_CACHING_TYPE CacheType,
    NODE_REQUIREMENT PreferredNode,
    PVOID* BufferPointer
    );

#ifdef StorPortFreeContiguousMemorySpecifyCache
#undef StorPortFreeContiguousMemorySpecifyCache
#endif
#define StorPortFreeContiguousMemorySpecifyCache sdv_StorPortFreeContiguousMemorySpecifyCache


ULONG
FORCEINLINE
sdv_StorPortFreeContiguousMemorySpecifyCache (
    PVOID HwDeviceExtension,
    PVOID BaseAddress,
    SIZE_T NumberOfBytes,
    MEMORY_CACHING_TYPE CacheType
    );

#ifdef StorPortSetPowerSettingNotificationGuids
#undef StorPortSetPowerSettingNotificationGuids
#endif
#define StorPortSetPowerSettingNotificationGuids sdv_StorPortSetPowerSettingNotificationGuids

ULONG
FORCEINLINE
sdv_StorPortSetPowerSettingNotificationGuids (
     PVOID  HwDeviceExtension,
     ULONG  GuidCount,
     LPGUID Guid
    );

#ifdef StorPortInvokeAcpiMethod
#undef StorPortInvokeAcpiMethod
#endif
#define StorPortInvokeAcpiMethod sdv_StorPortInvokeAcpiMethod

ULONG
FORCEINLINE
sdv_StorPortInvokeAcpiMethod (
     PVOID HwDeviceExtension,
     PSTOR_ADDRESS Address,
     ULONG MethodName,
     PVOID InputBuffer,
     ULONG InputBufferLength,
     PVOID OutputBuffer,
     ULONG OutputBufferLength,
     PULONG BytesReturned
    );

#ifdef StorPortGetActivityIdSrb
#undef StorPortGetActivityIdSrb
#endif
#define StorPortGetActivityIdSrb sdv_StorPortGetActivityIdSrb

ULONG
FORCEINLINE
sdv_StorPortGetActivityIdSrb(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    LPGUID ActivityId
    );

#ifdef StorPortGetDataInBufferMdl
#undef StorPortGetDataInBufferMdl
#endif
#define StorPortGetDataInBufferMdl sdv_StorPortGetDataInBufferMdl

ULONG
FORCEINLINE
sdv_StorPortGetDataInBufferMdl(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    PVOID* Mdl
    );
    
    
#ifdef StorPortGetDataInBufferSystemAddress
#undef StorPortGetDataInBufferSystemAddress
#endif
#define StorPortGetDataInBufferSystemAddress sdv_StorPortGetDataInBufferSystemAddress

ULONG
FORCEINLINE
sdv_StorPortGetDataInBufferSystemAddress(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    PVOID* SystemAddress
    );

#ifdef StorPortGetDataInBufferScatterGatherList
#undef StorPortGetDataInBufferScatterGatherList
#endif
#define StorPortGetDataInBufferScatterGatherList sdv_StorPortGetDataInBufferScatterGatherList

ULONG
FORCEINLINE
sdv_StorPortGetDataInBufferScatterGatherList(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    PSTOR_SCATTER_GATHER_LIST* SgList
    );

#ifdef StorPortMarkDumpMemory
#undef StorPortMarkDumpMemory
#endif
#define StorPortMarkDumpMemory sdv_StorPortMarkDumpMemory

ULONG
FORCEINLINE
sdv_StorPortMarkDumpMemory(
    PVOID HwDeviceExtension,
    PVOID Address,
    ULONG_PTR Length,
    ULONG Flags
    );

#ifdef StorPortSetUnitAttributes
#undef StorPortSetUnitAttributes
#endif
#define StorPortSetUnitAttributes sdv_StorPortSetUnitAttributes

ULONG
FORCEINLINE
sdv_StorPortSetUnitAttributes(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    STOR_UNIT_ATTRIBUTES Attributes
    );

#ifdef StorPortQueryPerformanceCounter
#undef StorPortQueryPerformanceCounter
#endif
#define StorPortQueryPerformanceCounter sdv_StorPortQueryPerformanceCounter

ULONG
FORCEINLINE
sdv_StorPortQueryPerformanceCounter(
    PVOID HwDeviceExtension,
    PLARGE_INTEGER PerformanceFrequency,
    PLARGE_INTEGER PerformanceCounter
    );


#ifdef StorPortGetSystemPortNumber
#undef StorPortGetSystemPortNumber
#endif
#define StorPortGetSystemPortNumber sdv_StorPortGetSystemPortNumber

ULONG
FORCEINLINE
sdv_StorPortGetSystemPortNumber(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address
    );

#endif

#ifdef InterlockedAnd
#undef InterlockedAnd
#endif
#define InterlockedAnd sdv_InterlockedAnd

FORCEINLINE
LONG
sdv_InterlockedAnd (
    LONG volatile *Target,
    LONG Set
    );

#ifdef InterlockedOr
#undef InterlockedOr
#endif
#define InterlockedOr sdv_InterlockedOr

FORCEINLINE
LONG
sdv_InterlockedOr (
    LONG volatile *Target,
    LONG Set
    );       
    
#ifdef StorPortGetRequestInfo
#undef StorPortGetRequestInfo
#endif
#define StorPortGetRequestInfo sdv_StorPortGetRequestInfo

ULONG
FORCEINLINE
sdv_StorPortGetRequestInfo (
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    PSTOR_REQUEST_INFO RequestInfo
    );



#ifdef StorPortInitializeWorker
#undef StorPortInitializeWorker
#endif
#define StorPortInitializeWorker sdv_StorPortInitializeWorker

ULONG
FORCEINLINE
sdv_StorPortInitializeWorker(
    PVOID HwDeviceExtension,
    PVOID *Worker
    );

#ifdef StorPortQueueWorkItem
#undef StorPortQueueWorkItem
#endif
#define StorPortQueueWorkItem sdv_StorPortQueueWorkItem

ULONG
FORCEINLINE
sdv_StorPortQueueWorkItem(
    PVOID HwDeviceExtension,
    PHW_WORKITEM WorkItemCallback,
    PVOID Worker,
    PVOID Context
    );

#ifdef StorPortFreeWorker
#undef StorPortFreeWorker
#endif
#define StorPortFreeWorker sdv_StorPortFreeWorker

ULONG
FORCEINLINE
sdv_StorPortFreeWorker(
    PVOID HwDeviceExtension,
    PVOID Worker
    );

#ifdef StorPortInitializeTimer
#undef StorPortInitializeTimer
#endif
#define StorPortInitializeTimer sdv_StorPortInitializeTimer

ULONG
FORCEINLINE
sdv_StorPortInitializeTimer(
    PVOID HwDeviceExtension,
    PVOID *TimerHandle
    );

#ifdef StorPortFreeTimer
#undef StorPortFreeTimer
#endif
#define StorPortFreeTimer sdv_StorPortFreeTimer

ULONG
FORCEINLINE
sdv_StorPortFreeTimer(
    PVOID HwDeviceExtension,
    PVOID TimerHandle
    );



#ifdef StorPortInitializeSListHead
#undef StorPortInitializeSListHead
#endif
#define StorPortInitializeSListHead sdv_StorPortInitializeSListHead

ULONG
FORCEINLINE
sdv_StorPortInitializeSListHead(
    PVOID HwDeviceExtension,
    PSTOR_SLIST_HEADER SListHead
    );

#ifdef StorPortInterlockedFlushSList
#undef StorPortInterlockedFlushSList
#endif
#define StorPortInterlockedFlushSList sdv_StorPortInterlockedFlushSList

ULONG
FORCEINLINE
sdv_StorPortInterlockedFlushSList(
    PVOID HwDeviceExtension,
    PSTOR_SLIST_HEADER SListHead,
    PSTOR_SLIST_ENTRY *Result
    );

#ifdef StorPortInterlockedPopEntrySList
#undef StorPortInterlockedPopEntrySList
#endif
#define StorPortInterlockedPopEntrySList sdv_StorPortInterlockedPopEntrySList

ULONG
FORCEINLINE
sdv_StorPortInterlockedPopEntrySList(
    PVOID HwDeviceExtension,
    PSTOR_SLIST_HEADER SListHead,
    PSTOR_SLIST_ENTRY *Result
    );

#ifdef StorPortInterlockedPushEntrySList
#undef StorPortInterlockedPushEntrySList
#endif
#define StorPortInterlockedPushEntrySList sdv_StorPortInterlockedPushEntrySList

ULONG
FORCEINLINE
sdv_StorPortInterlockedPushEntrySList(
    PVOID HwDeviceExtension,
    PSTOR_SLIST_HEADER SListHead,
    PSTOR_SLIST_ENTRY SListEntry,
    PSTOR_SLIST_ENTRY *Result
    );

#ifdef StorPortQueryDepthSList
#undef StorPortQueryDepthSList
#endif
#define StorPortQueryDepthSList sdv_StorPortQueryDepthSList

ULONG
FORCEINLINE
sdv_StorPortQueryDepthSList(
    PVOID HwDeviceExtension,
    PSTOR_SLIST_HEADER SListHead,
    PSHORT Result
    );

#if (NTDDI_VERSION >= NTDDI_WIN8)

#if defined(_WIN64)

#ifdef StorPortReadRegisterUlong64
#undef StorPortReadRegisterUlong64
#endif
#define StorPortReadRegisterUlong64 sdv_StorPortReadRegisterUlong64

ULONG64
FORCEINLINE
sdv_StorPortReadRegisterUlong64(
    PVOID HwDeviceExtension,
    volatile PULONG64 Register
    );

#ifdef StorPortReadRegisterBufferUlong64
#undef StorPortReadRegisterBufferUlong64
#endif
#define StorPortReadRegisterBufferUlong64 sdv_StorPortReadRegisterBufferUlong64

VOID
FORCEINLINE
sdv_StorPortReadRegisterBufferUlong64(
    PVOID HwDeviceExtension,
    PULONG64 Register,
    PULONG64 Buffer,
    ULONG Count
    );

#ifdef StorPortWriteRegisterUlong64
#undef StorPortWriteRegisterUlong64
#endif
#define StorPortWriteRegisterUlong64 sdv_StorPortWriteRegisterUlong64
   
VOID
FORCEINLINE
sdv_StorPortWriteRegisterUlong64(
    PVOID HwDeviceExtension,
    volatile PULONG64 Register,
    ULONG64 Value
    );

#ifdef StorPortWriteRegisterBufferUlong64
#undef StorPortWriteRegisterBufferUlong64
#endif
#define StorPortWriteRegisterBufferUlong64 sdv_StorPortWriteRegisterBufferUlong64
  
VOID
FORCEINLINE
sdv_StorPortWriteRegisterBufferUlong64(
    PVOID HwDeviceExtension,
    PULONG64 Register,
    PULONG64 Buffer,
    ULONG Count
    );    
    
#endif

#ifdef StorPortInitializePoFxPower
#undef StorPortInitializePoFxPower
#endif
#define StorPortInitializePoFxPower sdv_StorPortInitializePoFxPower

ULONG
FORCEINLINE
sdv_StorPortInitializePoFxPower(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    PSTOR_POFX_DEVICE Device,
    PBOOLEAN D3ColdEnabled
);

#ifdef StorPortPoFxActivateComponent
#undef StorPortPoFxActivateComponent
#endif
#define StorPortPoFxActivateComponent sdv_StorPortPoFxActivateComponent

ULONG
FORCEINLINE
sdv_StorPortPoFxActivateComponent(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    PSCSI_REQUEST_BLOCK Srb,
    ULONG Component,
    ULONG Flags
);

#ifdef StorPortPoFxIdleComponent
#undef StorPortPoFxIdleComponent
#endif
#define StorPortPoFxIdleComponent sdv_StorPortPoFxIdleComponent

ULONG
FORCEINLINE
sdv_StorPortPoFxIdleComponent(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    PSCSI_REQUEST_BLOCK Srb,
    ULONG Component,
    ULONG Flags
);

#ifdef StorPortPoFxSetComponentLatency
#undef StorPortPoFxSetComponentLatency
#endif
#define StorPortPoFxSetComponentLatency sdv_StorPortPoFxSetComponentLatency

ULONG
FORCEINLINE
sdv_StorPortPoFxSetComponentLatency(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    ULONG Component,
    ULONGLONG Latency
);

#ifdef StorPortPoFxSetComponentResidency
#undef StorPortPoFxSetComponentResidency
#endif
#define StorPortPoFxSetComponentResidency sdv_StorPortPoFxSetComponentResidency

ULONG
FORCEINLINE
sdv_StorPortPoFxSetComponentResidency(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    ULONG Component,
    ULONGLONG Residency
);

#ifdef StorPortPoFxPowerControl
#undef StorPortPoFxPowerControl
#endif
#define StorPortPoFxPowerControl sdv_StorPortPoFxPowerControl

ULONG
FORCEINLINE
sdv_StorPortPoFxPowerControl(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    LPCGUID PowerControlCode,
    PVOID InBuffer,
    SIZE_T InBufferSize,
    PVOID OutBuffer,
    SIZE_T OutBufferSize,
    PSIZE_T BytesReturned
);

#endif


VOID run_HwWorkItemRoutines(
  PHW_WORKITEM WorkItemCallback,
  PVOID DeviceExtension,
  PVOID Context,
  PVOID Worker
);

VOID run_HwStateChangeRoutines(
  PHW_STATE_CHANGE HwStateChangeCallback,
  PVOID DeviceExtension,
  PVOID Context,
  PVOID Address
);

VOID Choice_Non_CrashMode();
