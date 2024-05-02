/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/

#ifndef _SDV_NTDDK_CONTEXT_

#ifndef _SDV_WDM_H_
#define _SDV_WDM_H_

#define _SDV_NTDDK_H_

#ifndef NTDDI_WIN8
#define NTDDI_WIN8                          0x06020000
#endif

#ifdef __cplusplus
extern "C" {
#endif


#undef _DECL_HAL_KE_IMPORT
#define _DECL_HAL_KE_IMPORT

#undef DECLSPEC_IMPORT
#define DECLSPEC_IMPORT

#undef NTAPI
#define NTAPI __stdcall

#undef NTSYSAPI
#define NTSYSAPI

#undef NTKERNELAPI
#define NTKERNELAPI

#undef NTHALAPI
#define NTHALAPI

/* Turn of warnings that does not make sense for SDV: */

/* Disable warnings about unitialized variables: */
#pragma warning(disable:4700)

/* Disable warnings about inconsistent dll linkage: */
#pragma warning(disable:4273)

/* Disable warnings about unreferenced formal parameters: */
#pragma warning(disable:4100)

/* Disable warnings about formal parameter different from declaration: */
#pragma warning(disable:4028)



#if WINVER <= 0x0500
#endif


#include "sdv_layer_functions.h"







BOOLEAN
sdv_NT_ERROR(IN NTSTATUS Status);  

#ifdef NT_ERROR
#undef NT_ERROR
#endif
#define NT_ERROR(arg1) \
( \
sdv_NT_ERROR(arg1) \
)





#ifdef RtlCopyMemory
#undef RtlCopyMemory
#endif
#define RtlCopyMemory sdv_RtlCopyMemory
VOID 
RtlCopyMemory(
IN VOID UNALIGNED  *Destination,
IN CONST VOID UNALIGNED  *Source,
IN SIZE_T  Length
);




#ifdef IoAdjustPagingPathCount
#undef IoAdjustPagingPathCount
#endif
#define IoAdjustPagingPathCount sdv_IoAdjustPagingPathCount
VOID
sdv_IoAdjustPagingPathCount(
    IN PLONG Count,
    IN BOOLEAN Increment
    );

#ifdef IoAllocateAdapterChannel
#undef IoAllocateAdapterChannel
#endif
#define IoAllocateAdapterChannel sdv_IoAllocateAdapterChannel
NTSTATUS
sdv_IoAllocateAdapterChannel(
    IN PADAPTER_OBJECT AdapterObject,
    IN PDEVICE_OBJECT DeviceObject,
    IN ULONG NumberOfMapRegisters,
    IN PDRIVER_CONTROL ExecutionRoutine,
    IN PVOID Context
    );

#ifdef IoAssignArcName
#undef IoAssignArcName
#endif
#define IoAssignArcName sdv_IoAssignArcName
VOID
sdv_IoAssignArcName(
    IN PUNICODE_STRING ArcName,
    IN PUNICODE_STRING DeviceName
    );

#ifdef IoCallDriver
#undef IoCallDriver
#endif
#define IoCallDriver sdv_IoCallDriver
NTKERNELAPI
NTSTATUS
sdv_IoCallDriver(
    IN PDEVICE_OBJECT DeviceObject,
    IN OUT PIRP Irp
    );


#ifdef IoCompleteRequest
#undef IoCompleteRequest
#endif
#define IoCompleteRequest sdv_IoCompleteRequest
VOID sdv_IoCompleteRequest(
  __in  PIRP Irp,
  __in  CCHAR PriorityBoost
);


#ifdef IoCopyCurrentIrpStackLocationToNext
#undef IoCopyCurrentIrpStackLocationToNext
#endif
#define IoCopyCurrentIrpStackLocationToNext sdv_IoCopyCurrentIrpStackLocationToNext
FORCEINLINE
VOID
sdv_IoCopyCurrentIrpStackLocationToNext(
    IN PIRP pirp
    );

#ifdef IoDeassignArcName
#undef IoDeassignArcName
#endif
#define IoDeassignArcName sdv_IoDeassignArcName
VOID
sdv_IoDeassignArcName(
    IN PUNICODE_STRING ArcName
    );

#ifdef IoFlushAdapterBuffers
#undef IoFlushAdapterBuffers
#endif
#define IoFlushAdapterBuffers sdv_IoFlushAdapterBuffers
BOOLEAN
sdv_IoFlushAdapterBuffers(
    IN PADAPTER_OBJECT AdapterObject,
    IN PMDL Mdl,
    IN PVOID MapRegisterBase,
    IN PVOID CurrentVa,
    IN ULONG Length,
    IN BOOLEAN WriteToDevice
    );

#ifdef IoFreeAdapterChannel
#undef IoFreeAdapterChannel
#endif
#define IoFreeAdapterChannel sdv_IoFreeAdapterChannel
VOID
sdv_IoFreeAdapterChannel(
    IN PADAPTER_OBJECT AdapterObject
    );

#ifdef IoFreeMapRegisters
#undef IoFreeMapRegisters
#endif
#define IoFreeMapRegisters sdv_IoFreeMapRegisters
VOID
sdv_IoFreeMapRegisters(
    IN PADAPTER_OBJECT AdapterObject,
    IN PVOID MapRegisterBase,
    IN ULONG NumberOfMapRegisters
    );

#ifdef IoGetCurrentIrpStackLocation
#undef IoGetCurrentIrpStackLocation
#endif
#define IoGetCurrentIrpStackLocation sdv_IoGetCurrentIrpStackLocation
PIO_STACK_LOCATION
sdv_IoGetCurrentIrpStackLocation(
    IN PIRP pirp
    );

#ifdef IoGetFunctionCodeFromCtlCode
#undef IoGetFunctionCodeFromCtlCode
#endif
#define IoGetFunctionCodeFromCtlCode sdv_IoGetFunctionCodeFromCtlCode
ULONG
sdv_IoGetFunctionCodeFromCtlCode(
    IN ULONG ControlCode
    );

#ifdef IoGetNextIrpStackLocation
#undef IoGetNextIrpStackLocation
#endif
#define IoGetNextIrpStackLocation sdv_IoGetNextIrpStackLocation
PIO_STACK_LOCATION
sdv_IoGetNextIrpStackLocation(
    IN PIRP pirp
    );

#ifdef IoGetRemainingStackSize
#undef IoGetRemainingStackSize
#endif
#define IoGetRemainingStackSize sdv_IoGetRemainingStackSize
ULONG_PTR
sdv_IoGetRemainingStackSize(
    VOID
    );

#ifdef IoInitializeDpcRequest
#undef IoInitializeDpcRequest
#endif
#define IoInitializeDpcRequest sdv_IoInitializeDpcRequest
VOID
sdv_IoInitializeDpcRequest(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIO_DPC_ROUTINE DpcRoutine
    );

#ifdef IoInitializeRemoveLock
#undef IoInitializeRemoveLock
#endif
#define IoInitializeRemoveLock sdv_IoInitializeRemoveLock
VOID
sdv_IoInitializeRemoveLock(
    IN PIO_REMOVE_LOCK Lock,
    IN ULONG AllocateTag,
    IN ULONG MaxLockedMinutes,
    IN ULONG HighWatermark
    );

#ifdef IoIsErrorUserInduced
#undef IoIsErrorUserInduced
#endif
#define IoIsErrorUserInduced sdv_IoIsErrorUserInduced
BOOLEAN
sdv_IoIsErrorUserInduced(
    IN NTSTATUS Status
    );

#ifdef IoMapTransfer
#undef IoMapTransfer
#endif
#define IoMapTransfer sdv_IoMapTransfer
PHYSICAL_ADDRESS
sdv_IoMapTransfer(
    IN PADAPTER_OBJECT AdapterObject,
    IN PMDL Mdl,
    IN PVOID MapRegisterBase,
    IN PVOID CurrentVa,
    IN OUT PULONG Length,
    IN BOOLEAN WriteToDevice
    );

#ifdef IoMarkIrpPending
#undef IoMarkIrpPending
#endif
#define IoMarkIrpPending sdv_IoMarkIrpPending
VOID
sdv_IoMarkIrpPending(
    IN OUT PIRP pirp
    );

#ifdef IoRequestDpc
#undef IoRequestDpc
#endif
#define IoRequestDpc sdv_IoRequestDpc
VOID
sdv_IoRequestDpc(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp,
    IN PVOID Context
    );

    

#ifdef IoSetCancelRoutine
#undef IoSetCancelRoutine
#endif
#define IoSetCancelRoutine sdv_IoSetCancelRoutine
PDRIVER_CANCEL
sdv_IoSetCancelRoutine(
    IN PIRP pirp,
    IN PDRIVER_CANCEL CancelRoutine
    );

#ifdef IoSetCompletionRoutine
#undef IoSetCompletionRoutine
#endif
#define IoSetCompletionRoutine sdv_IoSetCompletionRoutine
VOID
sdv_IoSetCompletionRoutine(
    IN PIRP pirp,
    IN PIO_COMPLETION_ROUTINE CompletionRoutine,
    IN PVOID Context,
    IN BOOLEAN InvokeOnSuccess,
    IN BOOLEAN InvokeOnError,
    IN BOOLEAN InvokeOnCancel
    );

/*#ifdef IoSetCompletionRoutineEx
#undef IoSetCompletionRoutineEx
#endif
#define IoSetCompletionRoutineEx sdv_IoSetCompletionRoutineEx
NTSTATUS
sdv_IoSetCompletionRoutineEx(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp,
    IN PIO_COMPLETION_ROUTINE CompletionRoutine,
    IN PVOID Context,
    IN BOOLEAN InvokeOnSuccess,
    IN BOOLEAN InvokeOnError,
    IN BOOLEAN InvokeOnCancel
    );*/

#ifdef IoSetNextIrpStackLocation
#undef IoSetNextIrpStackLocation
#endif
#define IoSetNextIrpStackLocation sdv_IoSetNextIrpStackLocation
VOID
sdv_IoSetNextIrpStackLocation(
    IN OUT PIRP Irp
    );

#ifdef IoSizeOfIrp
#undef IoSizeOfIrp
#endif
#define IoSizeOfIrp sdv_IoSizeOfIrp
USHORT
sdv_IoSizeOfIrp(
    IN CCHAR StackSize
    );

#ifdef IoSizeofWorkItem
#undef IoSizeofWorkItem
#endif
#define IoSizeofWorkItem sdv_IoSizeofWorkItem
ULONG
sdv_IoSizeofWorkItem(
    VOID
    );

#ifdef IoSkipCurrentIrpStackLocation
#undef IoSkipCurrentIrpStackLocation
#endif
#define IoSkipCurrentIrpStackLocation sdv_IoSkipCurrentIrpStackLocation
FORCEINLINE
VOID
sdv_IoSkipCurrentIrpStackLocation(
    IN PIRP pirp
    );

#ifdef IoWMIDeviceObjectToProviderId
#undef IoWMIDeviceObjectToProviderId
#endif
#define IoWMIDeviceObjectToProviderId sdv_IoWMIDeviceObjectToProviderId
ULONG
sdv_IoWMIDeviceObjectToProviderId(
    IN PDEVICE_OBJECT DeviceObject
    );



#ifdef KeFlushIoBuffers
#undef KeFlushIoBuffers
#endif
#define KeFlushIoBuffers sdv_KeFlushIoBuffers
NTKERNELAPI
VOID
sdv_KeFlushIoBuffers(
    IN PMDL Mdl,
    IN BOOLEAN ReadOperation,
    IN BOOLEAN DmaOperation
    );

#ifdef KeRaiseIrql
#undef KeRaiseIrql
#endif
#define KeRaiseIrql sdv_KeRaiseIrql
VOID
sdv_KeRaiseIrql(
    IN KIRQL NewIrql,
    OUT PKIRQL OldIrql
    );
    
#ifdef BSDV_SOURCE
#ifdef KfRaiseIrql
#undef KfRaiseIrql
#endif
#define KfRaiseIrql sdv_KfRaiseIrql
KIRQL
FASTCALL
sdv_KfRaiseIrql(
    IN KIRQL NewIrql
    );
#endif


#ifdef KeLowerIrql
#undef KeLowerIrql
#endif
#define KeLowerIrql sdv_KeLowerIrql
VOID sdv_KeLowerIrql(
  __in  KIRQL NewIrql
);




#if defined (_AMD64_)
#ifdef KeLowerIrql
#undef KeLowerIrql
#endif
#define KeLowerIrql sdv_KeLowerIrql
__forceinline
VOID
sdv_KeLowerIrql (
         KIRQL NewIrql
   );
#endif


#ifdef KeGetCurrentIrql
#undef KeGetCurrentIrql
#endif
#define KeGetCurrentIrql sdv_KeGetCurrentIrql
NTHALAPI
KIRQL
sdv_KeGetCurrentIrql(
    void
    );

/*#ifdef KeWaitForMultipleObjects
#undef KeWaitForMultipleObjects
#endif
#define KeWaitForMultipleObjects sdv_KeWaitForMultipleObjects
NTSTATUS
sdv_KeWaitForMultipleObjects(
    IN ULONG Count,
    IN PVOID Object[],
    IN WAIT_TYPE WaitType,
    IN KWAIT_REASON WaitReason,
    IN KPROCESSOR_MODE WaitMode,
    IN BOOLEAN Alertable,
    IN PLARGE_INTEGER Timeout OPTIONAL,
    IN PKWAIT_BLOCK WaitBlockArray OPTIONAL
    );*/

#ifdef KeWaitForMutexObject
#undef KeWaitForMutexObject
#endif
#define KeWaitForMutexObject sdv_KeWaitForMutexObject
NTSTATUS sdv_KeWaitForMutexObject(
  __in      PVOID Mutex,
  __in      KWAIT_REASON WaitReason,
  __in      KPROCESSOR_MODE WaitMode,
  __in      BOOLEAN Alertable,
  __in_opt  PLARGE_INTEGER Timeout
);

#ifdef KeReleaseSpinLockFromDpcLevel
#undef KeReleaseSpinLockFromDpcLevel
#endif
#define KeReleaseSpinLockFromDpcLevel sdv_KeReleaseSpinLockFromDpcLevel
VOID
sdv_KeReleaseSpinLockFromDpcLevel(
    IN PKSPIN_LOCK SpinLock
    );

#ifdef KeAcquireSpinLock
#undef KeAcquireSpinLock
#endif
#define KeAcquireSpinLock sdv_KeAcquireSpinLock
VOID
sdv_KeAcquireSpinLock(
    IN PKSPIN_LOCK SpinLock,
    OUT PKIRQL OldIrql
    );




#ifdef KeStallExecutionProcessor
#undef KeStallExecutionProcessor
#endif
#define KeStallExecutionProcessor(a) SdvAssume(TRUE)
VOID SdvAssume(int e);



#ifdef ExInitializeFastMutex
#undef ExInitializeFastMutex
#endif
#define ExInitializeFastMutex sdv_ExInitializeFastMutex
VOID
sdv_ExInitializeFastMutex(
    IN PFAST_MUTEX FastMutex
    );



/*#ifdef ExAcquireFastMutex
#undef ExAcquireFastMutex
#endif
#define ExAcquireFastMutex sdv_ExAcquireFastMutex
NTHALAPI
VOID
FASTCALL
sdv_ExAcquireFastMutex(
    IN PFAST_MUTEX FastMutex
    );*/

/*#ifdef ExReleaseFastMutex
#undef ExReleaseFastMutex
#endif
#define ExReleaseFastMutex sdv_ExReleaseFastMutex
NTHALAPI
VOID
FASTCALL
sdv_ExReleaseFastMutex(
    IN PFAST_MUTEX FastMutex
    );*/

/*#ifdef ExTryToAcquireFastMutex
#undef ExTryToAcquireFastMutex
#endif
#define ExTryToAcquireFastMutex sdv_ExTryToAcquireFastMutex
NTHALAPI
BOOLEAN
FASTCALL
sdv_ExTryToAcquireFastMutex(
    IN PFAST_MUTEX FastMutex
    );*/

/*#ifdef ExAllocatePool
#undef ExAllocatePool
#endif
#define ExAllocatePool sdv_ExAllocatePool
NTKERNELAPI
PVOID
sdv_ExAllocatePool(
    IN POOL_TYPE PoolType,
    IN SIZE_T NumberOfBytes
    );*/

/*#ifdef ExAllocatePoolWithTag
#undef ExAllocatePoolWithTag
#endif
#define ExAllocatePoolWithTag sdv_ExAllocatePoolWithTag
NTKERNELAPI
PVOID
sdv_ExAllocatePoolWithTag(
    IN POOL_TYPE PoolType,
    IN SIZE_T NumberOfBytes,
    IN ULONG Tag
    );*/
    



#ifdef ExAllocatePoolWithQuotaTag
#undef ExAllocatePoolWithQuotaTag
#endif
#define ExAllocatePoolWithQuotaTag sdv_ExAllocatePoolWithQuotaTag
NTKERNELAPI
PVOID
sdv_ExAllocatePoolWithQuotaTag(
    POOL_TYPE PoolType,
    SIZE_T NumberOfBytes,
    ULONG Tag
    );

#ifdef ExAllocatePoolWithQuota
#undef ExAllocatePoolWithQuota
#endif
#define ExAllocatePoolWithQuota sdv_ExAllocatePoolWithQuota
NTKERNELAPI
PVOID
sdv_ExAllocatePoolWithQuota(
    POOL_TYPE PoolType,
    SIZE_T NumberOfBytes
    );
    
    
    



#ifdef ExInterlockedInsertHeadList
#undef ExInterlockedInsertHeadList
#endif
#define ExInterlockedInsertHeadList sdv_ExInterlockedInsertHeadList
NTKERNELAPI
PLIST_ENTRY
FASTCALL
sdv_ExInterlockedInsertHeadList(
    IN PLIST_ENTRY ListHead,
    IN PLIST_ENTRY ListEntry,
    IN PKSPIN_LOCK Lock
    );

#ifdef ExInterlockedInsertTailList
#undef ExInterlockedInsertTailList
#endif
#define ExInterlockedInsertTailList sdv_ExInterlockedInsertTailList
NTKERNELAPI
PLIST_ENTRY
sdv_ExInterlockedInsertTailList(
    IN PLIST_ENTRY ListHead,
    IN PLIST_ENTRY ListEntry,
    IN PKSPIN_LOCK Lock
    );

#ifdef ExInterlockedPushEntryList
#undef ExInterlockedPushEntryList
#endif
#define ExInterlockedPushEntryList sdv_ExInterlockedPushEntryList
NTKERNELAPI
PSINGLE_LIST_ENTRY
FASTCALL
sdv_ExInterlockedPushEntryList(
    IN PSINGLE_LIST_ENTRY ListHead,
    IN PSINGLE_LIST_ENTRY ListEntry,
    IN PKSPIN_LOCK Lock
    );


#ifdef RtlMoveMemory
#undef RtlMoveMemory
#endif
#define RtlMoveMemory sdv_RtlMoveMemory
NTSYSAPI
VOID
NTAPI
sdv_RtlMoveMemory(
    VOID UNALIGNED *Destination,
    CONST VOID UNALIGNED *Source,
    SIZE_T Length
    );

#ifdef RtlZeroMemory
#undef RtlZeroMemory
#endif
#define RtlZeroMemory sdv_RtlZeroMemory
NTSYSAPI
VOID
NTAPI
sdv_RtlZeroMemory(
    VOID UNALIGNED *Destination,
    SIZE_T Length
    );



#ifdef MmGetMdlByteCount
#undef MmGetMdlByteCount
#endif
#define MmGetMdlByteCount sdv_MmGetMdlByteCount
ULONG
sdv_MmGetMdlByteCount(
    IN PMDL Mdl
    );

#ifdef MmGetMdlByteOffset
#undef MmGetMdlByteOffset
#endif
#define MmGetMdlByteOffset sdv_MmGetMdlByteOffset
ULONG
sdv_MmGetMdlByteOffset(
    IN PMDL Mdl
    );

#ifdef MmGetMdlPfnArray
#undef MmGetMdlPfnArray
#endif
#define MmGetMdlPfnArray sdv_MmGetMdlPfnArray
PPFN_NUMBER
sdv_MmGetMdlPfnArray(
    IN PMDL Mdl
    );

#ifdef MmGetMdlVirtualAddress
#undef MmGetMdlVirtualAddress
#endif
#define MmGetMdlVirtualAddress sdv_MmGetMdlVirtualAddress
PVOID
sdv_MmGetMdlVirtualAddress(
    IN PMDL Mdl
    );

#ifdef MmGetSystemAddressForMdlSafe
#undef MmGetSystemAddressForMdlSafe
#endif
#define MmGetSystemAddressForMdlSafe sdv_MmGetSystemAddressForMdlSafe
PVOID
sdv_MmGetSystemAddressForMdlSafe(
    IN PMDL MDL,
    IN MM_PAGE_PRIORITY PRIORITY
    );

#ifdef MmLockPagableCodeSection
#undef MmLockPagableCodeSection
#endif
#define MmLockPagableCodeSection sdv_MmLockPagableCodeSection
PVOID
sdv_MmLockPagableCodeSection(
    IN PVOID AddressWithinSection
    );

#ifdef MmPrepareMdlForReuse
#undef MmPrepareMdlForReuse
#endif
#define MmPrepareMdlForReuse sdv_MmPrepareMdlForReuse
VOID
sdv_MmPrepareMdlForReuse(
    IN PMDL Mdl
    );


#ifdef ObReferenceObject
#undef ObReferenceObject
#endif
#define ObReferenceObject sdv_ObReferenceObject
LONG_PTR
sdv_ObReferenceObject(
    IN PVOID Object
    );

#ifdef ObDereferenceObject
#undef ObDereferenceObject
#endif
#define ObDereferenceObject sdv_ObDereferenceObject
LONG_PTR
sdv_ObDereferenceObject(
    IN PVOID Object
    );

#ifdef InitializeObjectAttributes
#undef InitializeObjectAttributes
#endif
#define InitializeObjectAttributes sdv_InitializeObjectAttributes
VOID
sdv_InitializeObjectAttributes(
    OUT POBJECT_ATTRIBUTES p,
    IN PUNICODE_STRING n,
    IN ULONG a,
    IN HANDLE r,
    IN PSECURITY_DESCRIPTOR s
    );


#ifdef ObDereferenceObjectWithTag
#undef ObDereferenceObjectWithTag
#endif
#define ObDereferenceObjectWithTag sdv_ObDereferenceObjectWithTag
VOID sdv_ObDereferenceObjectWithTag(
  __in  PVOID Object,
  __in  ULONG Tag
);


#ifdef ObReferenceObjectWithTag
#undef ObReferenceObjectWithTag
#endif
#define ObReferenceObjectWithTag sdv_ObReferenceObjectWithTag
VOID sdv_ObReferenceObjectWithTag(
  __in  PVOID Object,
  __in  ULONG Tag
);






/*#ifdef PoCallDriver
#undef PoCallDriver
#endif
#define PoCallDriver sdv_PoCallDriver
NTSTATUS
sdv_PoCallDriver(
    IN PDEVICE_OBJECT DeviceObject,
    IN OUT PIRP Irp
    );*/




void sdv_do_paged_code_check();

#undef PAGED_CODE
#define PAGED_CODE() sdv_do_paged_code_check();


void sdv_do_assert_check(int i);

#undef ASSERT
#if DBG
#define ASSERT(e) sdv_do_assert_check(e);
#else
#define ASSERT(e) ((void) 0)
#endif

#undef NT_ASSERT
#ifdef DBG
#define NT_ASSERT(e) sdv_do_assert_check(e);
#else
#define NT_ASSERT(e) ((void) 0)
#endif

#define NT_VERIFY     NT_ASSERT

/* 
Turn the generic __analysis_assume / _Analysis_assume_ into a call to
SdvAssumeSoft.

For more information about __analysis_assume/_Analysis_assume_ see:
MSDN Library > Development Tools and Languages > Visual Studio Team
System > Team Edition for Developers > Writing Quality Code >
Detecting and Correcting C/C++ Code Defects > How to: Specify
Additional Code Information.

*/
VOID SdvAssumeSoft(int e);

#ifdef __analysis_assume
#undef __analysis_assume
#endif
#define __analysis_assume(e) SdvAssume(e);

#ifdef _Analysis_assume_
#undef _Analysis_assume_
#endif
#define _Analysis_assume_(e) SdvAssumeSoft(e);

#define SDV_MACRO_PASS

#undef CONTAINING_RECORD
#define CONTAINING_RECORD(address, type, field)  ((type *) sdv_containing_record((PCHAR)address  ,  (ULONG_PTR)(&((type *)0)->field)  ))


PCHAR sdv_containing_record(
    IN PCHAR Address,
	IN ULONG_PTR FieldOffset
    );

#ifdef InterlockedIncrement
#undef InterlockedIncrement
#endif
#define InterlockedIncrement sdv_InterlockedIncrement
NTKERNELAPI
LONG
FASTCALL
sdv_InterlockedIncrement(
    IN LONG volatile *Addend
    );

#ifdef InterlockedDecrement
#undef InterlockedDecrement
#endif
#define InterlockedDecrement sdv_InterlockedDecrement
NTKERNELAPI
LONG
FASTCALL
sdv_InterlockedDecrement(
    IN LONG volatile *Addend
    );


/*#ifdef KeTryToAcquireSpinLockAtDpcLevel
#undef KeTryToAcquireSpinLockAtDpcLevel
#endif
#define KeTryToAcquireSpinLockAtDpcLevel sdv_KeTryToAcquireSpinLockAtDpcLevel
BOOLEAN  
sdv_KeTryToAcquireSpinLockAtDpcLevel(
    IN PKSPIN_LOCK  SpinLock    
    );*/
    
/*#ifdef ExReleaseResourceLite
#undef ExReleaseResourceLite
#endif
#define ExReleaseResourceLite sdv_ExReleaseResourceLite
NTKERNELAPI
VOID
FASTCALL
sdv_ExReleaseResourceLite(
    IN PERESOURCE Resource    
    );*/

#ifdef InsertTailList
#undef InsertTailList
#endif
#define InsertTailList sdv_InsertTailList
VOID
sdv_InsertTailList(
    PLIST_ENTRY ListHead,
    PLIST_ENTRY Entry
    );

#ifdef RemoveEntryList
#undef RemoveEntryList
#endif
#define RemoveEntryList sdv_RemoveEntryList
FORCEINLINE
BOOLEAN   
sdv_RemoveEntryList(    
    IN PLIST_ENTRY  Entry
    );

#ifdef IsListEmpty
#undef IsListEmpty
#endif
#define IsListEmpty sdv_IsListEmpty
BOOLEAN   
sdv_IsListEmpty(
    IN PLIST_ENTRY  ListHead    
    );

#ifdef ExInterlockedPopEntryList
#undef ExInterlockedPopEntryList
#endif
#define ExInterlockedPopEntryList sdv_ExInterlockedPopEntryList
PSINGLE_LIST_ENTRY sdv_ExInterlockedPopEntryList(
  __inout  PSINGLE_LIST_ENTRY ListHead,
  __inout  PKSPIN_LOCK Lock
);


#ifdef ExAllocateFromNPagedLookasideList
#undef ExAllocateFromNPagedLookasideList
#endif
#define ExAllocateFromNPagedLookasideList sdv_ExAllocateFromNPagedLookasideList
PVOID
sdv_ExAllocateFromNPagedLookasideList(
    __inout PNPAGED_LOOKASIDE_LIST Lookaside
    );

#ifdef KeInitializeSpinLock
#undef KeInitializeSpinLock
#endif
#define KeInitializeSpinLock sdv_KeInitializeSpinLock
NTKERNELAPI
VOID
NTAPI
sdv_KeInitializeSpinLock (
    __out PKSPIN_LOCK SpinLock
    );




#ifdef ExReleaseResourceForThread
#undef ExReleaseResourceForThread
#endif
#define ExReleaseResourceForThread sdv_ExReleaseResourceForThread
VOID sdv_ExReleaseResourceForThread(
  IN PERESOURCE  Resource,
  IN ERESOURCE_THREAD  ResourceThreadId
);

#ifdef ExIsResourceAcquiredShared
#undef ExIsResourceAcquiredShared
#endif
#define ExIsResourceAcquiredShared sdv_ExIsResourceAcquiredShared
BOOLEAN sdv_ExIsResourceAcquiredShared(
  IN PERESOURCE  Resource
);

#ifdef ExIsResourceAcquired
#undef ExIsResourceAcquired
#endif
#define ExIsResourceAcquired sdv_ExIsResourceAcquired
BOOLEAN sdv_ExIsResourceAcquired(
  IN PERESOURCE  Resource
);

#ifdef ExIsResourceAcquiredExclusive
#undef ExIsResourceAcquiredExclusive
#endif
#define ExIsResourceAcquiredExclusive sdv_ExIsResourceAcquiredExclusive 
BOOLEAN sdv_ExIsResourceAcquiredExclusive(
  IN PERESOURCE  Resource
);

#ifdef ExInitializeResource
#undef ExInitializeResource
#endif
#define ExInitializeResource sdv_ExInitializeResource 
NTSTATUS sdv_ExInitializeResource(
  IN PERESOURCE  Resource
);
#ifdef ExAllocateFromPagedLookasideList
#undef ExAllocateFromPagedLookasideList
#endif
#define ExAllocateFromPagedLookasideList sdv_ExAllocateFromPagedLookasideList
PVOID 
sdv_ExAllocateFromPagedLookasideList(
  __inout  PPAGED_LOOKASIDE_LIST Lookaside
);


#ifdef ExFreeToPagedLookasideList
#undef ExFreeToPagedLookasideList
#endif
#define ExFreeToPagedLookasideList sdv_ExFreeToPagedLookasideList
VOID 
sdv_ExFreeToPagedLookasideList(
  __inout  PPAGED_LOOKASIDE_LIST Lookaside,
  __in     PVOID Entry
);

/*#ifdef KeRaiseIrqlToDpcLevel
#undef KeRaiseIrqlToDpcLevel
#endif
#define KeRaiseIrqlToDpcLevel sdv_KeRaiseIrqlToDpcLevel
KIRQL 
sdv_KeRaiseIrqlToDpcLevel(void);*/

/*#ifdef KeSaveFloatingPointState
#undef KeSaveFloatingPointState
#endif
#define KeSaveFloatingPointState sdv_KeSaveFloatingPointState
NTSTATUS sdv_KeSaveFloatingPointState(
  __out  PKFLOATING_SAVE FloatSave
);*/



#ifdef ExInterlockedCompareExchange64
#undef ExInterlockedCompareExchange64
#endif
#define ExInterlockedCompareExchange64 sdv_ExInterlockedCompareExchange64
NTKERNELAPI
LONGLONG
sdv_ExInterlockedCompareExchange64(
  __inout  PLONGLONG Destination,
  __in     PLONGLONG Exchange,
  __in     PLONGLONG Comparand,
  __in     PKSPIN_LOCK Lock
);


#ifdef ExInterlockedInsertTailList
#undef ExInterlockedInsertTailList
#endif
#define ExInterlockedInsertTailList sdv_ExInterlockedInsertTailList
PLIST_ENTRY sdv_ExInterlockedInsertTailList(
  __inout  PLIST_ENTRY ListHead,
  __inout  PLIST_ENTRY ListEntry,
  __inout  PKSPIN_LOCK Lock
);




#ifdef ExInterlockedPopEntrySList
#undef ExInterlockedPopEntrySList
#endif
#define ExInterlockedPopEntrySList sdv_ExInterlockedPopEntrySList
PSLIST_ENTRY sdv_ExInterlockedPopEntrySList(
  __inout  PSLIST_HEADER ListHead,
  __inout  PKSPIN_LOCK Lock
);




#ifdef ExInterlockedPushEntrySList
#undef ExInterlockedPushEntrySList
#endif
#define ExInterlockedPushEntrySList sdv_ExInterlockedPushEntrySList
PSLIST_ENTRY sdv_ExInterlockedPushEntrySList(
  __inout  PSLIST_HEADER ListHead,
  __inout  PSLIST_ENTRY ListEntry,
  __inout  PKSPIN_LOCK Lock
);


#ifdef ExInterlockedRemoveHeadList
#undef ExInterlockedRemoveHeadList
#endif
#define ExInterlockedRemoveHeadList sdv_ExInterlockedRemoveHeadList
PLIST_ENTRY sdv_ExInterlockedRemoveHeadList(
  __inout  PLIST_ENTRY ListHead,
  __inout  PKSPIN_LOCK Lock
);


#ifdef InterlockedCompareExchangeAcquire
#undef InterlockedCompareExchangeAcquire
#endif
#define InterlockedCompareExchangeAcquire sdv_InterlockedCompareExchangeAcquire
LONG sdv_InterlockedCompareExchangeAcquire(
  __inout  LONG volatile *Destination,
  __in     LONG Exchange,
  __in     LONG Comparand
);


#ifdef ExAcquireSpinLock
#undef ExAcquireSpinLock
#endif
#define ExAcquireSpinLock sdv_ExAcquireSpinLock
VOID
sdv_ExAcquireSpinLock(
    IN PKSPIN_LOCK SpinLock,
    OUT PKIRQL p_old_irql
    );

#ifdef ExReleaseSpinLock
#undef ExReleaseSpinLock
#endif
#define ExReleaseSpinLock sdv_ExReleaseSpinLock
sdv_ExReleaseSpinLock(
    IN PKSPIN_LOCK  SpinLock,
    IN KIRQL  new_irql
    );



#ifdef ExReleaseSpinLockFromDpcLevel
#undef ExReleaseSpinLockFromDpcLevel
#endif
#define ExReleaseSpinLockFromDpcLevel sdv_ExReleaseSpinLockFromDpcLevel
VOID sdv_ExReleaseSpinLockFromDpcLevel(
  __inout  PKSPIN_LOCK SpinLock
);


#ifdef KeAcquireSpinLockAtDpcLevel
#undef KeAcquireSpinLockAtDpcLevel
#endif
#define KeAcquireSpinLockAtDpcLevel sdv_KeAcquireSpinLockAtDpcLevel
VOID
sdv_KeAcquireSpinLockAtDpcLevel(
    IN PKSPIN_LOCK SpinLock
    );

#ifdef ExIsResourceAcquiredLite
#undef ExIsResourceAcquiredLite
#endif
#define ExIsResourceAcquiredLite sdv_ExIsResourceAcquiredLite 
ULONG sdv_ExIsResourceAcquiredLite(
  __in  PERESOURCE Resource
);


#ifdef ExAcquireSpinLockAtDpcLevel
#undef ExAcquireSpinLockAtDpcLevel
#endif
#define ExAcquireSpinLockAtDpcLevel sdv_ExAcquireSpinLockAtDpcLevel
VOID
sdv_ExAcquireSpinLockAtDpcLevel(IN PKSPIN_LOCK  SpinLock);


/*#ifdef KeMemoryBarrierWithoutFence
#undef KeMemoryBarrierWithoutFence
#endif
#define KeMemoryBarrierWithoutFence sdv__ReadWriteBarrier*/


#ifdef KeReleaseSpinLock
#undef KeReleaseSpinLock
#endif
#define KeReleaseSpinLock sdv_KeReleaseSpinLock
VOID sdv_KeReleaseSpinLock(
  __inout  PKSPIN_LOCK SpinLock,
  __in     KIRQL NewIrql
);



#ifdef IoAcquireRemoveLock
#undef IoAcquireRemoveLock
#endif
#define IoAcquireRemoveLock sdv_IoAcquireRemoveLock
_IRQL_requires_max_(DISPATCH_LEVEL)
NTKERNELAPI
NTSTATUS
NTAPI
sdv_IoAcquireRemoveLock(
  __in      PIO_REMOVE_LOCK RemoveLock,
  __in_opt  PVOID Tag
);

#ifdef IoReleaseRemoveLock
#undef IoReleaseRemoveLock
#endif
#define IoReleaseRemoveLock sdv_IoReleaseRemoveLock
VOID sdv_IoReleaseRemoveLock(
  __in  PIO_REMOVE_LOCK RemoveLock,
  __in  PVOID Tag
);

#ifdef IoReleaseRemoveLockAndWait
#undef IoReleaseRemoveLockAndWait
#endif
#define IoReleaseRemoveLockAndWait sdv_IoReleaseRemoveLockAndWait
VOID
sdv_IoReleaseRemoveLockAndWait(
    IN PIO_REMOVE_LOCK RemoveLock,
    IN PVOID Tag
    );


#ifdef ExInterlockedPopEntrySList
#undef ExInterlockedPopEntrySList
#endif
#define ExInterlockedPopEntrySList sdv_ExInterlockedPopEntrySList
PSLIST_ENTRY
sdv_ExInterlockedPopEntrySList (
    __inout PSLIST_HEADER ListHead,
    PKSPIN_LOCK Lock
    );

#ifdef ExInterlockedPushEntrySList
#undef ExInterlockedPushEntrySList
#endif
#define ExInterlockedPushEntrySList sdv_ExInterlockedPushEntrySList
PSLIST_ENTRY
sdv_ExInterlockedPushEntrySList (
     PSLIST_HEADER ListHead,
     PSLIST_ENTRY ListEntry,
     PKSPIN_LOCK Lock
    );


#ifdef InterlockedPushEntrySList
#undef InterlockedPushEntrySList
#endif
#define InterlockedPushEntrySList sdv_InterlockedPushEntrySList
NTKERNELAPI
PSLIST_ENTRY
sdv_InterlockedPushEntrySList (
    PSLIST_HEADER ListHead,
    PSLIST_ENTRY ListEntry
    );

#ifdef InterlockedPopEntrySList
#undef InterlockedPopEntrySList
#endif
#define InterlockedPopEntrySList sdv_InterlockedPopEntrySList
NTKERNELAPI
PSLIST_ENTRY
FASTCALL
sdv_InterlockedPopEntrySList (
    __inout PSLIST_HEADER ListHead
    );


#ifdef HalAllocateCommonBuffer
#undef HalAllocateCommonBuffer
#endif
#define HalAllocateCommonBuffer sdv_HalAllocateCommonBuffer

FORCEINLINE
PVOID
sdv_HalAllocateCommonBuffer(
    __in PDMA_ADAPTER DmaAdapter,
    __in ULONG Length,
    __out PPHYSICAL_ADDRESS LogicalAddress,
    __in BOOLEAN CacheEnabled
    );

#ifdef HalFreeCommonBuffer
#undef HalFreeCommonBuffer
#endif
#define HalFreeCommonBuffer sdv_HalFreeCommonBuffer
FORCEINLINE
VOID
sdv_HalFreeCommonBuffer(
    __in PDMA_ADAPTER DmaAdapter,
    __in ULONG Length,
    __in PHYSICAL_ADDRESS LogicalAddress,
    __in PVOID VirtualAddress,
    __in BOOLEAN CacheEnabled
    );

#ifdef ExFreePool
#undef ExFreePool
#endif
#define ExFreePool sdv_ExFreePool
VOID sdv_ExFreePool(
  __in  PVOID P
);

#if !defined(_X86_)
#ifdef ExInterlockedFlushSList
#undef ExInterlockedFlushSList
#endif
#define ExInterlockedFlushSList sdv_ExInterlockedFlushSList
NTKERNELAPI
PSLIST_ENTRY
FASTCALL
sdv_ExInterlockedFlushSList(
     __inout PSLIST_HEADER ListHead
    );
#endif

/*#ifdef memcpy
#undef memcpy
#endif
#define memcpy sdv_memcpy
void * sdv_memcpy(
   void *dest,
   const void *src,
   size_t count 
);*/

/*#ifdef ExInterlockedFlushSList
#undef ExInterlockedFlushSList
#endif
#define ExInterlockedFlushSList sdv_ExInterlockedFlushSList
NTKERNELAPI
PSLIST_ENTRY
FASTCALL
sdv_ExInterlockedFlushSList(
     __inout PSLIST_HEADER ListHead
    );*/


/*#ifdef ExInitializeNPagedLookasideList
#undef ExInitializeNPagedLookasideList
#endif
#define ExInitializeNPagedLookasideList sdv_ExInitializeNPagedLookasideList

NTKERNELAPI
VOID
sdv_ExInitializeNPagedLookasideList (
    PNPAGED_LOOKASIDE_LIST Lookaside,
    PALLOCATE_FUNCTION Allocate,
    PFREE_FUNCTION Free,
    ULONG Flags,
    SIZE_T Size,
    ULONG Tag,
    USHORT Depth
    );*/




#ifdef ExInitializeNPagedLookasideList_NXPoolOptIn
#undef ExInitializeNPagedLookasideList_NXPoolOptIn
#endif
#define ExInitializeNPagedLookasideList_NXPoolOptIn sdv_ExInitializeNPagedLookasideList_NXPoolOptIn

FORCEINLINE
VOID
sdv_ExInitializeNPagedLookasideList_NXPoolOptIn (
    PNPAGED_LOOKASIDE_LIST Lookaside,
    PALLOCATE_FUNCTION Allocate,
    PFREE_FUNCTION Free,
    ULONG Flags,
    SIZE_T Size,
    ULONG Tag,
    USHORT Depth
    );


#ifdef IoCsqInitialize
#undef IoCsqInitialize
#endif
#define IoCsqInitialize sdv_IoCsqInitialize

NTSTATUS
sdv_IoCsqInitialize(
    IN PIO_CSQ Csq,
    IN PIO_CSQ_INSERT_IRP CsqInsertIrp,
    IN PIO_CSQ_REMOVE_IRP CsqRemoveIrp,
    IN PIO_CSQ_PEEK_NEXT_IRP CsqPeekNextIrp,
    IN PIO_CSQ_ACQUIRE_LOCK CsqAcquireLock,
    IN PIO_CSQ_RELEASE_LOCK CsqReleaseLock,
    IN PIO_CSQ_COMPLETE_CANCELED_IRP CsqCompleteCanceledIrp
    );



#ifdef IoCsqInitializeEx
#undef IoCsqInitializeEx
#endif
#define IoCsqInitializeEx sdv_IoCsqInitializeEx

NTKERNELAPI
NTSTATUS
sdv_IoCsqInitializeEx(
    IN PIO_CSQ Csq,
    IN PIO_CSQ_INSERT_IRP_EX CsqInsertIrp,
    IN PIO_CSQ_REMOVE_IRP CsqRemoveIrp,
    IN PIO_CSQ_PEEK_NEXT_IRP CsqPeekNextIrp,
    IN PIO_CSQ_ACQUIRE_LOCK CsqAcquireLock,
    IN PIO_CSQ_RELEASE_LOCK CsqReleaseLock,
    IN PIO_CSQ_COMPLETE_CANCELED_IRP CsqCompleteCanceledIrp 
    );



#ifdef IoCsqInsertIrp
#undef IoCsqInsertIrp
#endif
#define IoCsqInsertIrp sdv_IoCsqInsertIrp

VOID
sdv_IoCsqInsertIrp(
    IN PIO_CSQ Csq,
    IN PIRP pirp,
    IN PIO_CSQ_IRP_CONTEXT Context
    );



#ifdef IoCsqInsertIrpEx
#undef IoCsqInsertIrpEx
#endif
#define IoCsqInsertIrpEx sdv_IoCsqInsertIrpEx

NTSTATUS
sdv_IoCsqInsertIrpEx(
    IN PIO_CSQ Csq,
    IN PIRP pirp,
    IN PIO_CSQ_IRP_CONTEXT Context,
    IN PVOID InsertContext
    );

#ifdef IoCsqRemoveIrp
#undef IoCsqRemoveIrp
#endif
#define IoCsqRemoveIrp sdv_IoCsqRemoveIrp

NTKERNELAPI
PIRP
sdv_IoCsqRemoveIrp(
    IN PIO_CSQ Csq,
    IN PIO_CSQ_IRP_CONTEXT Context
    );


#ifdef IoCsqRemoveNextIrp
#undef IoCsqRemoveNextIrp
#endif
#define IoCsqRemoveNextIrp sdv_IoCsqRemoveNextIrp

PIRP
sdv_IoCsqRemoveNextIrp(
    IN PIO_CSQ Csq,
    IN PVOID PeekContext
    );

#ifdef RtlQueryRegistryValues
#undef RtlQueryRegistryValues
#endif
#define RtlQueryRegistryValues sdv_RtlQueryRegistryValues

NTSYSAPI
NTSTATUS
NTAPI
sdv_RtlQueryRegistryValues(
    IN ULONG RelativeTo,
    IN PCWSTR Path,
    IN PRTL_QUERY_REGISTRY_TABLE QueryTable,
    IN PVOID Context,
    IN PVOID Environment OPTIONAL
    );

#ifdef ExQueueWorkItem
#undef ExQueueWorkItem
#endif
#define ExQueueWorkItem sdv_ExQueueWorkItem

VOID 
sdv_ExQueueWorkItem(
    PWORK_QUEUE_ITEM WorkItem,
    WORK_QUEUE_TYPE QueueType
);


#ifdef MmMapLockedPagesSpecifyCache
#undef MmMapLockedPagesSpecifyCache
#endif
#define MmMapLockedPagesSpecifyCache sdv_MmMapLockedPagesSpecifyCache

NTKERNELAPI
PVOID
sdv_MmMapLockedPagesSpecifyCache(
     IN PMDL MemoryDescriptorList,
     IN KPROCESSOR_MODE AccessMode,
     IN MEMORY_CACHING_TYPE CacheType,
     IN PVOID BaseAddress,
     IN ULONG BugCheckOnFailure,
     IN ULONG Priority
     );








#ifdef DbgBreakPoint
#undef DbgBreakPoint
#endif
#define DbgBreakPoint sdv_DbgBreakPoint


__analysis_noreturn
VOID
NTAPI
DbgBreakPoint(
    VOID
    );

#if (NTDDI_VERSION >= NTDDI_WIN8)

#ifdef PoFxRegisterDevice
#undef PoFxRegisterDevice
#endif
#define PoFxRegisterDevice sdv_PoFxRegisterDevice


NTKERNELAPI
NTSTATUS
sdv_PoFxRegisterDevice (
    PDEVICE_OBJECT Pdo,
    PPO_FX_DEVICE Device,
    POHANDLE *Handle
    );


#ifdef PoFxStartDevicePowerManagement
#undef PoFxStartDevicePowerManagement
#endif
#define PoFxStartDevicePowerManagement sdv_PoFxStartDevicePowerManagement


NTKERNELAPI
VOID
sdv_PoFxStartDevicePowerManagement(
    POHANDLE Handle
    );

#ifdef PoFxUnregisterDevice
#undef PoFxUnregisterDevice
#endif
#define PoFxUnregisterDevice sdv_PoFxUnregisterDevice


NTKERNELAPI
VOID
sdv_PoFxUnregisterDevice(
    POHANDLE Handle
    );


#ifdef PoFxActivateComponent
#undef PoFxActivateComponent
#endif
#define PoFxActivateComponent sdv_PoFxActivateComponent


NTKERNELAPI
VOID
sdv_PoFxActivateComponent (
    POHANDLE Handle,
    ULONG Component,
    ULONG Flags
    );

#ifdef PoFxIdleComponent
#undef PoFxIdleComponent
#endif
#define PoFxIdleComponent sdv_PoFxIdleComponent


NTKERNELAPI
VOID
sdv_PoFxIdleComponent (
    POHANDLE Handle,
    ULONG Component,
    ULONG Flags
    );


#ifdef PoFxSetComponentLatency
#undef PoFxSetComponentLatency
#endif
#define PoFxSetComponentLatency sdv_PoFxSetComponentLatency


NTKERNELAPI
VOID
sdv_PoFxSetComponentLatency (
    POHANDLE Handle,
    ULONG Component,
    ULONGLONG Latency
    );

#ifdef PoFxSetComponentResidency
#undef PoFxSetComponentResidency
#endif
#define PoFxSetComponentResidency sdv_PoFxSetComponentResidency


NTKERNELAPI
VOID
sdv_PoFxSetComponentResidency (
    POHANDLE Handle,
    ULONG Component,
    ULONGLONG Residency
    );



#ifdef PoFxSetComponentWake
#undef PoFxSetComponentWake
#endif
#define PoFxSetComponentWake sdv_PoFxSetComponentWake


NTKERNELAPI
VOID
sdv_PoFxSetComponentWake (
    POHANDLE Handle,
    ULONG Component,
    BOOLEAN WakeHint
    );



#ifdef PoFxReportDevicePoweredOn
#undef PoFxReportDevicePoweredOn
#endif
#define PoFxReportDevicePoweredOn sdv_PoFxReportDevicePoweredOn



NTKERNELAPI
VOID
sdv_PoFxReportDevicePoweredOn(
    POHANDLE Handle
    );

#ifdef PoFxCompleteIdleState
#undef PoFxCompleteIdleState
#endif
#define PoFxCompleteIdleState sdv_PoFxCompleteIdleState

NTKERNELAPI
VOID
sdv_PoFxCompleteIdleState (
    POHANDLE Handle,
    ULONG Component
    );



#ifdef PoFxPowerControl
#undef PoFxPowerControl
#endif
#define PoFxPowerControl sdv_PoFxPowerControl

NTKERNELAPI
NTSTATUS
sdv_PoFxPowerControl (
    POHANDLE Handle,
    LPCGUID PowerControlCode,
    PVOID InBuffer,
    SIZE_T InBufferSize,
    PVOID OutBuffer,
    SIZE_T OutBufferSize,
    PSIZE_T BytesReturned
    );


#ifdef PoFxNotifySurprisePowerOn
#undef PoFxNotifySurprisePowerOn
#endif
#define PoFxNotifySurprisePowerOn sdv_PoFxNotifySurprisePowerOn


NTKERNELAPI
VOID
sdv_PoFxNotifySurprisePowerOn(
      PDEVICE_OBJECT Pdo
     );


#ifdef PoFxSetDeviceIdleTimeout
#undef PoFxSetDeviceIdleTimeout
#endif
#define PoFxSetDeviceIdleTimeout sdv_PoFxSetDeviceIdleTimeout


NTKERNELAPI
VOID
sdv_PoFxSetDeviceIdleTimeout (
    POHANDLE Handle,
    ULONGLONG IdleTimeout
    );

#ifdef PoFxCompleteIdleCondition
#undef PoFxCompleteIdleCondition
#endif
#define PoFxCompleteIdleCondition sdv_PoFxCompleteIdleCondition


NTKERNELAPI
VOID
sdv_PoFxCompleteIdleCondition (
    POHANDLE Handle,
    ULONG Component
    );

#ifdef PoFxCompleteDevicePowerNotRequired
#undef PoFxCompleteDevicePowerNotRequired
#endif
#define PoFxCompleteDevicePowerNotRequired sdv_PoFxCompleteDevicePowerNotRequired



NTKERNELAPI
VOID
sdv_PoFxCompleteDevicePowerNotRequired (
    POHANDLE Handle
    );

#endif

#ifdef AbnormalTermination
#undef AbnormalTermination
#endif
#define AbnormalTermination sdv_AbnormalTermination

BOOLEAN sdv_AbnormalTermination(VOID);

#ifdef KeGetCurrentThread
#undef KeGetCurrentThread
#endif
#define KeGetCurrentThread sdv_KeGetCurrentThread


#ifdef READ_REGISTER_ULONG64
#undef READ_REGISTER_ULONG64
#endif
#define READ_REGISTER_ULONG64 sdv_READ_REGISTER_ULONG64

__forceinline
ULONG64
sdv_READ_REGISTER_ULONG64(
    volatile ULONG64 *Register
    );

#ifdef READ_REGISTER_BUFFER_ULONG64
#undef READ_REGISTER_BUFFER_ULONG64
#endif
#define READ_REGISTER_BUFFER_ULONG64 sdv_READ_REGISTER_BUFFER_ULONG64

__forceinline
VOID
sdv_READ_REGISTER_BUFFER_ULONG64 (
    volatile ULONG64 *Register,
    _Out_writes_all_(Count) PULONG64 Buffer,
    ULONG Count
    );

#ifdef WRITE_REGISTER_ULONG64
#undef WRITE_REGISTER_ULONG64
#endif
#define WRITE_REGISTER_ULONG64 sdv_WRITE_REGISTER_ULONG64

__forceinline
VOID
sdv_WRITE_REGISTER_ULONG64 (
    volatile ULONG64 *Register,
    ULONG64 Value
    );

#if defined(_M_AMD64)

__forceinline
PKTHREAD
sdv_KeGetCurrentThread (
    VOID
    );

#endif

#if defined(_M_IX86) || defined(_M_ARM)

NTSYSAPI
PKTHREAD
NTAPI
sdv_KeGetCurrentThread(
    VOID
    );
#endif


#ifdef KeGetCurrentProcessorNumber
#undef KeGetCurrentProcessorNumber
#endif
#define KeGetCurrentProcessorNumber sdv_KeGetCurrentProcessorNumber
ULONG
sdv_KeGetCurrentProcessorNumber(
    VOID
    );

#ifdef __cplusplus
}
#endif

#endif

#endif
