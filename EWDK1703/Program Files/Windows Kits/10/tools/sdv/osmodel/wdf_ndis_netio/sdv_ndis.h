/*  
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/

#ifndef _SDV_NDIS_H_
#define _SDV_NDIS_H_

#define READ_LOCK                       0
#define WRITE_LOCK_STATE_UNKNOWN        1
#define LOCK_STATE_ALREADY_ACQUIRED     2
#define READ_LOCK_STATE_FREE            3
#define WRITE_LOCK_STATE_FREE           4
#define WRITE_LOCK_PROMOTED_FROM_READ   5
#define LOCK_STATE_UNKNOWN              (UCHAR)-1




#ifdef NdisAcquireSpinLock
#undef NdisAcquireSpinLock
#endif
#define NdisAcquireSpinLock sdv_NdisAcquireSpinLock
VOID
sdv_NdisAcquireSpinLock(
    IN PNDIS_SPIN_LOCK  SpinLock
    );


#ifdef NdisReleaseSpinLock
#undef NdisReleaseSpinLock
#endif
#define NdisReleaseSpinLock sdv_NdisReleaseSpinLock 
VOID
sdv_NdisReleaseSpinLock(
    IN PNDIS_SPIN_LOCK  SpinLock
    );


#ifdef NdisDprAcquireSpinLock
#undef NdisDprAcquireSpinLock
#endif
#define NdisDprAcquireSpinLock sdv_NdisDprAcquireSpinLock
VOID
sdv_NdisDprAcquireSpinLock(
    IN PNDIS_SPIN_LOCK  SpinLock
    );


#ifdef NdisDprReleaseSpinLock
#undef NdisDprReleaseSpinLock
#endif
#define NdisDprReleaseSpinLock sdv_NdisDprReleaseSpinLock
VOID
sdv_NdisDprReleaseSpinLock(
    IN PNDIS_SPIN_LOCK  SpinLock
    );


#ifdef NdisAllocateMemoryWithTag
#undef NdisAllocateMemoryWithTag
#endif
#define NdisAllocateMemoryWithTag  sdv_NdisAllocateMemoryWithTag 
NDIS_STATUS
sdv_NdisAllocateMemoryWithTag(
    OUT PVOID *  VirtualAddress,
    IN  UINT     Length,
    IN  ULONG    Tag
    );
    

#ifdef NdisAllocateMemoryWithTagPriority
#undef NdisAllocateMemoryWithTagPriority
#endif
#define NdisAllocateMemoryWithTagPriority  sdv_NdisAllocateMemoryWithTagPriority 
PVOID
sdv_NdisAllocateMemoryWithTagPriority(
    IN NDIS_HANDLE  NdisHandle,
    IN UINT  Length,
    IN ULONG  Tag,
    IN EX_POOL_PRIORITY  Priority
    );


#ifdef NdisFreeMemory
#undef NdisFreeMemory
#endif    
#define NdisFreeMemory sdv_NdisFreeMemory    
VOID
sdv_NdisFreeMemory(
    IN PVOID  VirtualAddress,
    IN UINT  Length,
    IN UINT  MemoryFlags
    );
  
#ifdef NdisZeroMemory
#undef NdisZeroMemory
#endif    
#define NdisZeroMemory sdv_NdisZeroMemory
VOID
sdv_NdisZeroMemory(
    IN PVOID  Destination,
    IN ULONG  Length    
    );

#ifdef NdisMRegisterScatterGatherDma
#undef NdisMRegisterScatterGatherDma
#endif
#define NdisMRegisterScatterGatherDma sdv_NdisMRegisterScatterGatherDma    
NDIS_STATUS
sdv_NdisMRegisterScatterGatherDma(
    IN NDIS_HANDLE  MiniportAdapterHandle,
    IN PNDIS_SG_DMA_DESCRIPTION  DmaDescription,
    OUT PNDIS_HANDLE  NdisMiniportDmaHandle
    );


#ifdef NdisMDeregisterScatterGatherDma
#undef NdisMDeregisterScatterGatherDma
#endif    
#define NdisMDeregisterScatterGatherDma sdv_NdisMDeregisterScatterGatherDma
VOID
sdv_NdisMDeregisterScatterGatherDma(
    IN NDIS_HANDLE  NdisMiniportDmaHandle
    );
    

#ifdef NdisMRegisterInterruptEx
#undef NdisMRegisterInterruptEx
#endif    
#define NdisMRegisterInterruptEx sdv_NdisMRegisterInterruptEx    
NDIS_STATUS
sdv_NdisMRegisterInterruptEx(
    IN NDIS_HANDLE  MiniportAdapterHandle,
    IN NDIS_HANDLE  MiniportInterruptContext,
    IN PNDIS_MINIPORT_INTERRUPT_CHARACTERISTICS  MiniportInterruptCharacteristics,
    OUT PNDIS_HANDLE  NdisInterruptHandle
    );
    

#ifdef NdisMDeregisterInterruptEx
#undef NdisMDeregisterInterruptEx
#endif    
#define NdisMDeregisterInterruptEx sdv_NdisMDeregisterInterruptEx
VOID
sdv_NdisMDeregisterInterruptEx(
    IN NDIS_HANDLE  NdisInterruptHandle
    );


#ifdef NdisAdvanceNetBufferDataStart
#undef NdisAdvanceNetBufferDataStart
#endif
#define NdisAdvanceNetBufferDataStart sdv_NdisAdvanceNetBufferDataStart
VOID
sdv_NdisAdvanceNetBufferDataStart(
    IN PNET_BUFFER  NetBuffer,
    IN ULONG  DataOffsetDelta,
    IN  BOOLEAN  FreeMdl,
    IN  NET_BUFFER_FREE_MDL_HANDLER  FreeMdlHandler OPTIONAL
    );



#ifdef NdisAdvanceNetBufferListDataStart
#undef NdisAdvanceNetBufferListDataStart
#endif
#define NdisAdvanceNetBufferListDataStart sdv_NdisAdvanceNetBufferListDataStart
VOID
sdv_NdisAdvanceNetBufferListDataStart(
    IN PNET_BUFFER_LIST  NetBufferList,
    IN ULONG  DataOffsetDelta,
    IN BOOLEAN  FreeMdl,
    IN NET_BUFFER_FREE_MDL_HANDLER  FreeMdlHandler OPTIONAL
    );



#ifdef NdisAllocateCloneNetBufferList
#undef NdisAllocateCloneNetBufferList
#endif
#define NdisAllocateCloneNetBufferList sdv_NdisAllocateCloneNetBufferList
PNET_BUFFER_LIST
sdv_NdisAllocateCloneNetBufferList(
    IN PNET_BUFFER_LIST  OriginalNetBufferList,
    IN NDIS_HANDLE  NetBufferListPoolHandle OPTIONAL,
    IN NDIS_HANDLE  NetBufferPoolHandle OPTIONAL,
    IN ULONG  AllocateCloneFlags
    );


#ifdef NdisAllocateCloneOidRequest
#undef NdisAllocateCloneOidRequest
#endif
#define NdisAllocateCloneOidRequest sdv_NdisAllocateCloneOidRequest
NDIS_STATUS
sdv_NdisAllocateCloneOidRequest(
    IN NDIS_HANDLE  SourceHandle,
    IN PNDIS_OID_REQUEST  Request,
    IN UINT  PoolTag,
    OUT PNDIS_OID_REQUEST  *CloneRequest
    );



#ifdef NdisAllocateFragmentNetBufferList
#undef NdisAllocateFragmentNetBufferList
#endif
#define NdisAllocateFragmentNetBufferList sdv_NdisAllocateFragmentNetBufferList
PNET_BUFFER_LIST
sdv_NdisAllocateFragmentNetBufferList(
    IN PNET_BUFFER_LIST  OriginalNetBufferList,
    IN PNDIS_HANDLE  NetBufferListPoolHandle OPTIONAL,
    IN PNDIS_HANDLE  NetBufferPoolHandle OPTIONAL,
    IN ULONG  StartOffset,
    IN ULONG  MaximumLength,
    IN ULONG  DataOffsetDelta,
    IN ULONG  DataBackFill,
    IN ULONG  AllocateFragmentFlags
    );


#ifdef NdisAllocateGenericObject
#undef NdisAllocateGenericObject
#endif
#define NdisAllocateGenericObject sdv_NdisAllocateGenericObject
PNDIS_GENERIC_OBJECT
sdv_NdisAllocateGenericObject(
    IN PDRIVER_OBJECT  DriverObject OPTIONAL,
    IN ULONG  Tag,
    IN USHORT  Size
    );



#ifdef NdisAllocateIoWorkItem
#undef NdisAllocateIoWorkItem
#endif
#define NdisAllocateIoWorkItem sdv_NdisAllocateIoWorkItem
NDIS_HANDLE
sdv_NdisAllocateIoWorkItem(
    IN NDIS_HANDLE  NdisObjectHandle
    );


#ifdef NdisAllocateMdl
#undef NdisAllocateMdl
#endif
#define NdisAllocateMdl sdv_NdisAllocateMdl
PMDL
sdv_NdisAllocateMdl(
    IN  NDIS_HANDLE  NdisHandle,
    IN  PVOID  VirtualAddress,
    IN  UINT  Length
    );


#ifdef NdisAllocateNetBuffer
#undef NdisAllocateNetBuffer
#endif
#define NdisAllocateNetBuffer sdv_NdisAllocateNetBuffer
PNET_BUFFER
sdv_NdisAllocateNetBuffer(
    IN NDIS_HANDLE  PoolHandle,
    IN PMDL  MdlChain,
    IN ULONG  DataOffset,
    IN SIZE_T  DataLength
    );


#ifdef NdisAllocateNetBufferAndNetBufferList
#undef NdisAllocateNetBufferAndNetBufferList
#endif
#define NdisAllocateNetBufferAndNetBufferList sdv_NdisAllocateNetBufferAndNetBufferList
PNET_BUFFER_LIST
sdv_NdisAllocateNetBufferAndNetBufferList (
    IN NDIS_HANDLE  PoolHandle,
    IN USHORT  ContextSize,
    IN USHORT  ContextBackFill,
    IN PMDL  MdlChain,
    IN ULONG  DataOffset,
    IN SIZE_T  DataLength
    );



#ifdef NdisAllocateNetBufferList
#undef NdisAllocateNetBufferList
#endif
#define NdisAllocateNetBufferList sdv_NdisAllocateNetBufferList
PNET_BUFFER_LIST
sdv_NdisAllocateNetBufferList(
    IN NDIS_HANDLE  PoolHandle,
    IN USHORT  ContextSize,
    IN USHORT  ContextBackFill
    );



#ifdef NdisAllocateNetBufferListContext
#undef NdisAllocateNetBufferListContext
#endif
#define NdisAllocateNetBufferListContext sdv_NdisAllocateNetBufferListContext
NDIS_STATUS
sdv_NdisAllocateNetBufferListContext(
    IN PNET_BUFFER_LIST  NetBufferList,
    IN USHORT  ContextSize,
    IN USHORT  ContextBackFill,
    IN ULONG  PoolTag
    );



#ifdef NdisAllocateNetBufferListPool
#undef NdisAllocateNetBufferListPool
#endif
#define NdisAllocateNetBufferListPool sdv_NdisAllocateNetBufferListPool
NDIS_HANDLE

sdv_NdisAllocateNetBufferListPool(
    IN NDIS_HANDLE  NdisHandle,
    IN PNET_BUFFER_LIST_POOL_PARAMETERS Parameters
    );



#ifdef NdisAllocateNetBufferMdlAndData
#undef NdisAllocateNetBufferMdlAndData
#endif
#define NdisAllocateNetBufferMdlAndData sdv_NdisAllocateNetBufferMdlAndData
PNET_BUFFER
sdv_NdisAllocateNetBufferMdlAndData(
    IN  NDIS_HANDLE PoolHandle
    );



#ifdef NdisAllocateNetBufferPool
#undef NdisAllocateNetBufferPool
#endif
#define NdisAllocateNetBufferPool sdv_NdisAllocateNetBufferPool
NDIS_HANDLE
sdv_NdisAllocateNetBufferPool(
    IN NDIS_HANDLE  NdisHandle,
    IN PNET_BUFFER_POOL_PARAMETERS  Parameters
    );



#ifdef NdisAllocateReassembledNetBufferList
#undef NdisAllocateReassembledNetBufferList
#endif
#define NdisAllocateReassembledNetBufferList sdv_NdisAllocateReassembledNetBufferList
PNET_BUFFER_LIST
sdv_NdisAllocateReassembledNetBufferList(
    IN PNET_BUFFER  FragmentedNetBufferList,
    IN NDIS_HANDLE  NetBufferAndNetBufferListPoolHandle OPTIONAL,
    IN ULONG  StartOffset,
    IN ULONG  DataOffsetDelta,
    IN ULONG  DataBackFill,
    IN ULONG  AllocateReassembleFlags
    );


#ifdef NdisAllocateTimerObject
#undef NdisAllocateTimerObject
#endif
#define NdisAllocateTimerObject sdv_NdisAllocateTimerObject
NDIS_STATUS

sdv_NdisAllocateTimerObject(
    IN NDIS_HANDLE  NdisHandle,
    IN PNDIS_TIMER_CHARACTERISTICS  TimerCharacteristics,
    OUT PNDIS_HANDLE  pTimerObject
    );



#ifdef NdisCancelOidRequest
#undef NdisCancelOidRequest
#endif
#define NdisCancelOidRequest sdv_NdisCancelOidRequest
VOID

sdv_NdisCancelOidRequest(
    IN NDIS_HANDLE  NdisBindingHandle,
    IN PVOID  RequestID
    );



#ifdef NdisCancelSendNetBufferLists
#undef NdisCancelSendNetBufferLists
#endif
#define NdisCancelSendNetBufferLists sdv_NdisCancelSendNetBufferLists
VOID

sdv_NdisCancelSendNetBufferLists(
    IN NDIS_HANDLE  NdisBindingHandle,
    IN ULONG_PTR  CancelId
    );


#ifdef NdisCancelTimerObject
#undef NdisCancelTimerObject
#endif
#define NdisCancelTimerObject sdv_NdisCancelTimerObject
BOOLEAN

sdv_NdisCancelTimerObject(
    IN NDIS_HANDLE  TimerObject
    );


#ifdef NdisCompleteBindAdapterEx
#undef NdisCompleteBindAdapterEx
#endif
#define NdisCompleteBindAdapterEx sdv_NdisCompleteBindAdapterEx
VOID

sdv_NdisCompleteBindAdapterEx(
    IN NDIS_HANDLE  BindContext,
    IN NDIS_STATUS  Status
    );


#ifdef NdisCompleteNetPnPEvent
#undef NdisCompleteNetPnPEvent
#endif
#define NdisCompleteNetPnPEvent sdv_NdisCompleteNetPnPEvent
VOID

sdv_NdisCompleteNetPnPEvent(
    IN NDIS_HANDLE  NdisBindingHandle,
    IN PNET_PNP_EVENT_NOTIFICATION  NetPnPEvent,
    IN NDIS_STATUS  Status
    );


#ifdef NdisCompleteUnbindAdapterEx
#undef NdisCompleteUnbindAdapterEx
#endif
#define NdisCompleteUnbindAdapterEx sdv_NdisCompleteUnbindAdapterEx
VOID

sdv_NdisCompleteUnbindAdapterEx(
    IN NDIS_HANDLE  UnbindContext
    );


#ifdef NdisCopyFromNetBufferToNetBuffer
#undef NdisCopyFromNetBufferToNetBuffer
#endif
#define NdisCopyFromNetBufferToNetBuffer sdv_NdisCopyFromNetBufferToNetBuffer
NDIS_STATUS

sdv_NdisCopyFromNetBufferToNetBuffer(
    IN PNET_BUFFER  Destination,
    IN ULONG  DestinationOffset,
    IN ULONG  BytesToCopy,
    IN PNET_BUFFER  Source,
    IN ULONG  SourceOffset,
    OUT PULONG  BytesCopied
    );



#ifdef NdisCopyReceiveNetBufferListInfo
#undef NdisCopyReceiveNetBufferListInfo
#endif
#define NdisCopyReceiveNetBufferListInfo sdv_NdisCopyReceiveNetBufferListInfo
VOID

sdv_NdisCopyReceiveNetBufferListInfo(
    IN PNET_BUFFER_LIST  DestNetBufferList,
    IN PNET_BUFFER_LIST  SrcNetBufferList
    );



#ifdef NdisCopySendNetBufferListInfo
#undef NdisCopySendNetBufferListInfo
#endif
#define NdisCopySendNetBufferListInfo sdv_NdisCopySendNetBufferListInfo
VOID

sdv_NdisCopySendNetBufferListInfo(
    IN PNET_BUFFER_LIST  DestNetBufferList,
    IN PNET_BUFFER_LIST  SrcNetBufferList
    );



#ifdef NdisDeregisterDeviceEx
#undef NdisDeregisterDeviceEx
#endif
#define NdisDeregisterDeviceEx sdv_NdisDeregisterDeviceEx
VOID

sdv_NdisDeregisterDeviceEx(
    IN NDIS_HANDLE  NdisDeviceHandle
    );



#ifdef NdisDeregisterProtocolDriver
#undef NdisDeregisterProtocolDriver
#endif
#define NdisDeregisterProtocolDriver sdv_NdisDeregisterProtocolDriver
VOID

sdv_NdisDeregisterProtocolDriver(
    IN NDIS_HANDLE  NdisProtocolHandle
    );


#ifdef NdisEnumerateFilterModules
#undef NdisEnumerateFilterModules
#endif
#define NdisEnumerateFilterModules sdv_NdisEnumerateFilterModules
NDIS_STATUS
sdv_NdisEnumerateFilterModules (
    IN  NDIS_HANDLE  NdisHandle,
    IN  PVOID  InterfaceBuffer,
    IN  ULONG  InterfaceBufferLength,
    IN  OUT PULONG  BytesNeeded,
    IN  OUT PULONG  BytesWritten
    );



#ifdef NdisFCancelOidRequest
#undef NdisFCancelOidRequest
#endif
#define NdisFCancelOidRequest sdv_NdisFCancelOidRequest
VOID

sdv_NdisFCancelOidRequest(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN PVOID  RequestID
    );



#ifdef NdisFCancelSendNetBufferLists
#undef NdisFCancelSendNetBufferLists
#endif
#define NdisFCancelSendNetBufferLists sdv_NdisFCancelSendNetBufferLists
VOID

sdv_NdisFCancelSendNetBufferLists(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN PVOID  CancelId
    );



#ifdef NdisFDeregisterFilterDriver
#undef NdisFDeregisterFilterDriver
#endif
#define NdisFDeregisterFilterDriver sdv_NdisFDeregisterFilterDriver
VOID

sdv_NdisFDeregisterFilterDriver(
    IN NDIS_HANDLE  NdisFilterDriverHandle
    );


#ifdef NdisFDevicePnPEventNotify
#undef NdisFDevicePnPEventNotify
#endif
#define NdisFDevicePnPEventNotify sdv_NdisFDevicePnPEventNotify
VOID

sdv_NdisFDevicePnPEventNotify(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN PNET_DEVICE_PNP_EVENT  NetDevicePnPEvent
  );



#ifdef NdisFIndicateReceiveNetBufferLists
#undef NdisFIndicateReceiveNetBufferLists
#endif
#define NdisFIndicateReceiveNetBufferLists sdv_NdisFIndicateReceiveNetBufferLists
VOID

sdv_NdisFIndicateReceiveNetBufferLists(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN PNET_BUFFER_LIST  NetBufferLists,
    IN NDIS_PORT_NUMBER  PortNumber,
    IN ULONG  NumberOfNetBufferLists,
    IN ULONG  ReceiveFlags
    );



#ifdef NdisFIndicateStatus
#undef NdisFIndicateStatus
#endif
#define NdisFIndicateStatus sdv_NdisFIndicateStatus
VOID

sdv_NdisFIndicateStatus(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN PNDIS_STATUS_INDICATION  StatusIndication
    );



#ifdef NdisFNetPnPEvent
#undef NdisFNetPnPEvent
#endif
#define NdisFNetPnPEvent sdv_NdisFNetPnPEvent
NDIS_STATUS

sdv_NdisFNetPnPEvent(
    IN NDIS_HANDLE  FilterModuleContext,
    IN PNET_PNP_EVENT_NOTIFICATION  NetPnPEvent
  );



#ifdef NdisFOidRequest
#undef NdisFOidRequest
#endif
#define NdisFOidRequest sdv_NdisFOidRequest
NDIS_STATUS

sdv_NdisFOidRequest(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN PNDIS_OID_REQUEST  OidRequest
    );



#ifdef NdisFOidRequestComplete
#undef NdisFOidRequestComplete
#endif
#define NdisFOidRequestComplete sdv_NdisFOidRequestComplete
VOID

sdv_NdisFOidRequestComplete(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN PNDIS_OID_REQUEST  OidRequest,
    IN NDIS_STATUS  Status
    );


#ifdef NdisFPauseComplete
#undef NdisFPauseComplete
#endif
#define NdisFPauseComplete sdv_NdisFPauseComplete
VOID

sdv_NdisFPauseComplete(
    IN NDIS_HANDLE  NdisFilterHandle
    );



#ifdef NdisFreeCloneNetBufferList
#undef NdisFreeCloneNetBufferList
#endif
#define NdisFreeCloneNetBufferList sdv_NdisFreeCloneNetBufferList
VOID

sdv_NdisFreeCloneNetBufferList(
    IN PNET_BUFFER_LIST  CloneNetBufferList,
    IN ULONG  FreeCloneFlags
    );


#ifdef NdisFreeCloneOidRequest
#undef NdisFreeCloneOidRequest
#endif
#define NdisFreeCloneOidRequest sdv_NdisFreeCloneOidRequest
VOID

sdv_NdisFreeCloneOidRequest(
    IN NDIS_HANDLE  SourceHandle,
    IN PNDIS_OID_REQUEST  Request
    );



#ifdef NdisFreeFragmentNetBufferList
#undef NdisFreeFragmentNetBufferList
#endif
#define NdisFreeFragmentNetBufferList sdv_NdisFreeFragmentNetBufferList
VOID

sdv_NdisFreeFragmentNetBufferList(
    IN PNET_BUFFER_LIST  FragmentNetBufferList,
    IN ULONG  DataOffsetDelta,
    IN ULONG  FreeFragmentFlags
    );



#ifdef NdisFreeGenericObject
#undef NdisFreeGenericObject
#endif
#define NdisFreeGenericObject sdv_NdisFreeGenericObject
VOID

sdv_NdisFreeGenericObject(
    IN PNDIS_GENERIC_OBJECT  NdisGenericObject
    );


#ifdef NdisFreeIoWorkItem
#undef NdisFreeIoWorkItem
#endif
#define NdisFreeIoWorkItem sdv_NdisFreeIoWorkItem
VOID 

sdv_NdisFreeIoWorkItem(
    IN NDIS_HANDLE  NdisIoWorkItemHandle
    );


#ifdef NdisFreeMdl
#undef NdisFreeMdl
#endif
#define NdisFreeMdl sdv_NdisFreeMdl
VOID

sdv_NdisFreeMdl(
    IN PMDL  Mdl
    );



#ifdef NdisFreeNetBuffer
#undef NdisFreeNetBuffer
#endif
#define NdisFreeNetBuffer sdv_NdisFreeNetBuffer
VOID

sdv_NdisFreeNetBuffer(
    IN PNET_BUFFER  NetBuffer
    );



#ifdef NdisFreeNetBufferList
#undef NdisFreeNetBufferList
#endif
#define NdisFreeNetBufferList sdv_NdisFreeNetBufferList
VOID

sdv_NdisFreeNetBufferList(
    IN PNET_BUFFER_LIST  NetBufferList
    );



#ifdef NdisFreeNetBufferListContext
#undef NdisFreeNetBufferListContext
#endif
#define NdisFreeNetBufferListContext sdv_NdisFreeNetBufferListContext
VOID

sdv_NdisFreeNetBufferListContext(
    IN PNET_BUFFER_LIST  NetBufferList,
    IN USHORT  ContextSize
    );


#ifdef NdisFreeNetBufferListPool
#undef NdisFreeNetBufferListPool
#endif
#define NdisFreeNetBufferListPool sdv_NdisFreeNetBufferListPool
VOID

sdv_NdisFreeNetBufferListPool(
    IN NDIS_HANDLE  PoolHandle
    );



#ifdef NdisFreeNetBufferPool
#undef NdisFreeNetBufferPool
#endif
#define NdisFreeNetBufferPool sdv_NdisFreeNetBufferPool
VOID

sdv_NdisFreeNetBufferPool(
    IN NDIS_HANDLE  PoolHandle
    );



#ifdef NdisFreeReassembledNetBufferList
#undef NdisFreeReassembledNetBufferList
#endif
#define NdisFreeReassembledNetBufferList sdv_NdisFreeReassembledNetBufferList
VOID

sdv_NdisFreeReassembledNetBufferList(
    IN PNET_BUFFER_LIST  ReassembledNetBufferList,
    IN ULONG  DataOffsetDelta,
    IN ULONG  FreeReassembleFlags
    );


#ifdef NdisFreeTimerObject
#undef NdisFreeTimerObject
#endif
#define NdisFreeTimerObject sdv_NdisFreeTimerObject
VOID

sdv_NdisFreeTimerObject(
    IN NDIS_HANDLE  TimerObject
    );



#ifdef NdisFRegisterFilterDriver
#undef NdisFRegisterFilterDriver
#endif
#define NdisFRegisterFilterDriver sdv_NdisFRegisterFilterDriver
NDIS_STATUS

sdv_NdisFRegisterFilterDriver(
    IN PDRIVER_OBJECT  DriverObject,
    IN NDIS_HANDLE  FilterDriverContext,
    IN PNDIS_FILTER_DRIVER_CHARACTERISTICS  FilterCharacteristics,
    OUT PNDIS_HANDLE  NdisFilterDriverHandle
    );



#ifdef NdisFRestartComplete
#undef NdisFRestartComplete
#endif
#define NdisFRestartComplete sdv_NdisFRestartComplete
VOID

sdv_NdisFRestartComplete(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN NDIS_STATUS  Status
    );



#ifdef NdisFRestartFilter
#undef NdisFRestartFilter
#endif
#define NdisFRestartFilter sdv_NdisFRestartFilter
NDIS_STATUS

sdv_NdisFRestartFilter(
    IN NDIS_HANDLE  NdisFilterHandle
    );


#ifdef NdisFReturnNetBufferLists
#undef NdisFReturnNetBufferLists
#endif
#define NdisFReturnNetBufferLists sdv_NdisFReturnNetBufferLists
VOID

sdv_NdisFReturnNetBufferLists(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN PNET_BUFFER_LIST  NetBufferLists,
    IN ULONG  ReturnFlags
    );


#ifdef NdisFSendNetBufferLists
#undef NdisFSendNetBufferLists
#endif
#define NdisFSendNetBufferLists sdv_NdisFSendNetBufferLists
VOID

sdv_NdisFSendNetBufferLists(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN PNET_BUFFER_LIST  NetBufferLists,
    IN NDIS_PORT_NUMBER  PortNumber,
    IN ULONG  SendFlags
    );


#ifdef NdisFSendNetBufferListsComplete
#undef NdisFSendNetBufferListsComplete
#endif
#define NdisFSendNetBufferListsComplete sdv_NdisFSendNetBufferListsComplete
VOID

sdv_NdisFSendNetBufferListsComplete(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN PNET_BUFFER_LIST  NetBufferLists,
    IN ULONG  SendCompleteFlags
    );



#ifdef NdisFSetAttributes
#undef NdisFSetAttributes
#endif
#define NdisFSetAttributes sdv_NdisFSetAttributes
NDIS_STATUS

sdv_NdisFSetAttributes(
    IN NDIS_HANDLE  NdisFilterHandle,
    IN NDIS_HANDLE  FilterModuleContext,
    IN PNDIS_FILTER_ATTRIBUTES  FilterAttributes
    );



#ifdef NdisGetDataBuffer
#undef NdisGetDataBuffer
#endif
#define NdisGetDataBuffer sdv_NdisGetDataBuffer
PVOID
sdv_NdisGetDataBuffer(
    IN PNET_BUFFER  NetBuffer,
    IN ULONG  BytesNeeded,
    IN PVOID  Storage,
    IN UINT   AlignMultiple,
    IN UINT   AlignOffset
    );


#ifdef NdisGetMdlPhysicalArraySize
#undef NdisGetMdlPhysicalArraySize
#endif
#define NdisGetMdlPhysicalArraySize sdv_NdisGetMdlPhysicalArraySize
VOID

sdv_NdisGetMdlPhysicalArraySize
(

    IN PMDL  _Mdl,
    OUT PUINT  _ArraySize

    );


#ifdef NdisGetPoolFromNetBuffer
#undef NdisGetPoolFromNetBuffer
#endif
#define NdisGetPoolFromNetBuffer sdv_NdisGetPoolFromNetBuffer
NDIS_HANDLE

sdv_NdisGetPoolFromNetBuffer(
    IN PNET_BUFFER  NetBuffer
    );


#ifdef NdisGetPoolFromNetBufferList
#undef NdisGetPoolFromNetBufferList
#endif
#define NdisGetPoolFromNetBufferList sdv_NdisGetPoolFromNetBufferList
NDIS_HANDLE

sdv_NdisGetPoolFromNetBufferList(
    IN PNET_BUFFER_LIST  NetBufferList
    );



#ifdef NdisMAllocateNetBufferSGList
#undef NdisMAllocateNetBufferSGList
#endif
#define NdisMAllocateNetBufferSGList sdv_NdisMAllocateNetBufferSGList
NDIS_STATUS
sdv_NdisMAllocateNetBufferSGList(
    IN NDIS_HANDLE  NdisMiniportDmaHandle,
    IN PNET_BUFFER  NetBuffer,
    IN PVOID  Context,
    IN ULONG  Flags,
    IN PVOID  ScatterGatherListBuffer OPTIONAL,
    IN ULONG  ScatterGatherListBufferSize OPTIONAL
    );


#ifdef NdisMAllocateSharedMemory
#undef NdisMAllocateSharedMemory
#endif
#define NdisMAllocateSharedMemory sdv_NdisMAllocateSharedMemory
VOID 
sdv_NdisMAllocateSharedMemory(
    IN NDIS_HANDLE  MiniportAdapterHandle,
    IN ULONG  Length,
    IN BOOLEAN  Cached,
    OUT PVOID  *VirtualAddress,
    OUT PNDIS_PHYSICAL_ADDRESS  PhysicalAddress
    );



#ifdef NdisMAllocateSharedMemoryAsyncEx
#undef NdisMAllocateSharedMemoryAsyncEx
#endif
#define NdisMAllocateSharedMemoryAsyncEx sdv_NdisMAllocateSharedMemoryAsyncEx
NDIS_STATUS
sdv_NdisMAllocateSharedMemoryAsyncEx(
    IN NDIS_HANDLE  MiniportDmaHandle,
    IN ULONG  Length,
    IN BOOLEAN  Cached,
    IN PVOID  Context
    );



#ifdef NdisMDeregisterMiniportDriver
#undef NdisMDeregisterMiniportDriver
#endif
#define NdisMDeregisterMiniportDriver sdv_NdisMDeregisterMiniportDriver
VOID

sdv_NdisMDeregisterMiniportDriver(
    IN NDIS_HANDLE  NdisMiniportDriverHandle
    );



#ifdef NdisMFreeNetBufferSGList
#undef NdisMFreeNetBufferSGList
#endif
#define NdisMFreeNetBufferSGList sdv_NdisMFreeNetBufferSGList
VOID
sdv_NdisMFreeNetBufferSGList(
    IN NDIS_HANDLE  NdisMiniportDmaHandle,
    IN PSCATTER_GATHER_LIST  pSGL,
    IN PNET_BUFFER  NetBuffer
    );



#ifdef NdisMGetBusData
#undef NdisMGetBusData
#endif
#define NdisMGetBusData sdv_NdisMGetBusData
ULONG

sdv_NdisMGetBusData(
    IN NDIS_HANDLE  MiniportAdapterHandle,
    IN ULONG  WhichSpace,
    IN ULONG  Offset,
    IN PVOID  Buffer,
    IN ULONG  Length
    );


#ifdef NdisMIndicateReceiveNetBufferLists
#undef NdisMIndicateReceiveNetBufferLists
#endif
#define NdisMIndicateReceiveNetBufferLists sdv_NdisMIndicateReceiveNetBufferLists
VOID

sdv_NdisMIndicateReceiveNetBufferLists(
    IN NDIS_HANDLE  MiniportAdapterHandle,
    IN PNET_BUFFER_LIST  NetBufferLists,
    IN NDIS_PORT_NUMBER  PortNumber,
    IN ULONG  NumberOfNetBufferLists,
    IN ULONG  ReceiveFlags
    );


#ifdef NdisMIndicateStatusEx
#undef NdisMIndicateStatusEx
#endif
#define NdisMIndicateStatusEx sdv_NdisMIndicateStatusEx
VOID

sdv_NdisMIndicateStatusEx(
    IN NDIS_HANDLE  MiniportAdapterHandle,
    IN PNDIS_STATUS_INDICATION  StatusIndication
    );



#ifdef NdisMNetPnPEvent
#undef NdisMNetPnPEvent
#endif
#define NdisMNetPnPEvent sdv_NdisMNetPnPEvent
NDIS_STATUS
sdv_NdisMNetPnPEvent(
    IN  NDIS_HANDLE  MiniportAdapterHandle,
    IN  PNET_PNP_EVENT_NOTIFICATION  NetPnPEvent
    );



#ifdef NdisMOidRequestComplete
#undef NdisMOidRequestComplete
#endif
#define NdisMOidRequestComplete sdv_NdisMOidRequestComplete
VOID 

sdv_NdisMOidRequestComplete(
    IN NDIS_HANDLE  MiniportAdapterHandle,
    IN PNDIS_OID_REQUEST  OidRequest,
    IN NDIS_STATUS  Status
    );



#ifdef NdisMPauseComplete
#undef NdisMPauseComplete
#endif
#define NdisMPauseComplete sdv_NdisMPauseComplete
VOID

sdv_NdisMPauseComplete(
    IN NDIS_HANDLE  MiniportAdapterHandle
    );



#ifdef NdisMQueueDpc
#undef NdisMQueueDpc
#endif
#define NdisMQueueDpc sdv_NdisMQueueDpc
ULONG
sdv_NdisMQueueDpc(
    IN  NDIS_HANDLE  NdisInterruptHandle,
    IN  ULONG  MessageId,
    IN  ULONG  TargetProcessors,
    IN  PVOID  MiniportDpcContext
    );



#ifdef NdisMRegisterMiniportDriver
#undef NdisMRegisterMiniportDriver
#endif
#define NdisMRegisterMiniportDriver sdv_NdisMRegisterMiniportDriver
NDIS_STATUS
sdv_NdisMRegisterMiniportDriver(
    IN PDRIVER_OBJECT  DriverObject,
    IN PUNICODE_STRING  RegistryPath,
    IN NDIS_HANDLE  MiniportDriverContext,
    IN PNDIS_MINIPORT_DRIVER_CHARACTERISTICS  MiniportDriverCharacteristics,
    OUT PNDIS_HANDLE  NdisMiniportDriverHandle
    );



#ifdef NdisMRestartComplete
#undef NdisMRestartComplete
#endif
#define NdisMRestartComplete sdv_NdisMRestartComplete
VOID

sdv_NdisMRestartComplete(
    IN NDIS_HANDLE  MiniportAdapterHandle,
    IN NDIS_STATUS  Status
    );



#ifdef NdisMSendNetBufferListsComplete
#undef NdisMSendNetBufferListsComplete
#endif
#define NdisMSendNetBufferListsComplete sdv_NdisMSendNetBufferListsComplete
VOID

sdv_NdisMSendNetBufferListsComplete(
    IN NDIS_HANDLE  MiniportAdapterHandle,
    IN PNET_BUFFER_LIST  NetBufferLists,
    IN ULONG  SendCompleteFlags
    );



#ifdef NdisMSetBusData
#undef NdisMSetBusData
#endif
#define NdisMSetBusData sdv_NdisMSetBusData
ULONG

sdv_NdisMSetBusData(
    IN NDIS_HANDLE  MiniportAdapterHandle,
    IN ULONG  WhichSpace,
    IN ULONG  Offset,
    IN PVOID  Buffer,
    IN ULONG  Length
    );



#ifdef NdisMSetMiniportAttributes
#undef NdisMSetMiniportAttributes
#endif
#define NdisMSetMiniportAttributes sdv_NdisMSetMiniportAttributes
NDIS_STATUS
sdv_NdisMSetMiniportAttributes (
    IN NDIS_HANDLE  NdisMiniportAdapterHandle,
    IN PNDIS_MINIPORT_ADAPTER_ATTRIBUTES  MiniportAttributes
    );


#ifdef NdisOidRequest
#undef NdisOidRequest
#endif
#define NdisOidRequest sdv_NdisOidRequest
NDIS_STATUS
sdv_NdisOidRequest(
    IN NDIS_HANDLE  NdisBindingHandle,
    IN PNDIS_OID_REQUEST  OidRequest
    );

#ifdef NdisOpenAdapterEx
#undef NdisOpenAdapterEx
#endif
#define NdisOpenAdapterEx sdv_NdisOpenAdapterEx
NDIS_STATUS

sdv_NdisOpenAdapterEx(
    IN NDIS_HANDLE  NdisProtocolHandle,
    IN NDIS_HANDLE  ProtocolBindingContext,
    IN PNDIS_OPEN_PARAMETERS  OpenParameters,
    IN NDIS_HANDLE  BindContext,
    OUT PNDIS_HANDLE  NdisBindingHandle
    );



#ifdef NdisOpenConfigurationEx
#undef NdisOpenConfigurationEx
#endif
#define NdisOpenConfigurationEx sdv_NdisOpenConfigurationEx
NDIS_STATUS

sdv_NdisOpenConfigurationEx(
    IN PNDIS_CONFIGURATION_OBJECT  ConfigObject,
    OUT PNDIS_HANDLE  ConfigurationHandle
    );


#ifdef NdisQueryMdl
#undef NdisQueryMdl
#endif
#define NdisQueryMdl sdv_NdisQueryMdl
VOID
sdv_NdisQueryMdl(
    PMDL _Mdl, 
    PVOID _VirtualAddress, 
    PULONG _Length, 
    MM_PAGE_PRIORITY _Priority
    );



#ifdef NdisQueryMdlOffset
#undef NdisQueryMdlOffset
#endif
#define NdisQueryMdlOffset sdv_NdisQueryMdlOffset
VOID

sdv_NdisQueryMdlOffset(
    IN PMDL _Mdl,   
    OUT PUINT  _Offset,
    OUT PUINT  Length
    );



#ifdef NdisQueryNetBufferPhysicalCount
#undef NdisQueryNetBufferPhysicalCount
#endif
#define NdisQueryNetBufferPhysicalCount sdv_NdisQueryNetBufferPhysicalCount
ULONG

sdv_NdisQueryNetBufferPhysicalCount(
    IN  PNET_BUFFER  NetBuffer
    );



#ifdef NdisQueueIoWorkItem
#undef NdisQueueIoWorkItem
#endif
#define NdisQueueIoWorkItem sdv_NdisQueueIoWorkItem
VOID

sdv_NdisQueueIoWorkItem(
    IN NDIS_HANDLE  NdisIoWorkItemHandle,
    IN NDIS_IO_WORKITEM_ROUTINE  Routine,
    IN PVOID  WorkItemContext
    );


#ifdef NdisRegisterDeviceEx
#undef NdisRegisterDeviceEx
#endif
#define NdisRegisterDeviceEx sdv_NdisRegisterDeviceEx
NDIS_STATUS

sdv_NdisRegisterDeviceEx(
    IN NDIS_HANDLE  NdisHandle,
    IN PNDIS_DEVICE_OBJECT_ATTRIBUTES  DeviceObjectAttributes,
    OUT PDEVICE_OBJECT  *pDeviceObject,
    OUT PNDIS_HANDLE  NdisDeviceHandle
 );



#ifdef NdisRegisterProtocolDriver
#undef NdisRegisterProtocolDriver
#endif
#define NdisRegisterProtocolDriver sdv_NdisRegisterProtocolDriver
NDIS_STATUS

sdv_NdisRegisterProtocolDriver(
    IN NDIS_HANDLE  ProtocolDriverContext,
    IN PNDIS_PROTOCOL_DRIVER_CHARACTERISTICS  ProtocolCharacteristics,
    OUT PNDIS_HANDLE  NdisProtocolHandle
    );


#ifdef NdisRetreatNetBufferDataStart
#undef NdisRetreatNetBufferDataStart
#endif
#define NdisRetreatNetBufferDataStart sdv_NdisRetreatNetBufferDataStart
NDIS_STATUS

sdv_NdisRetreatNetBufferDataStart(
    IN PNET_BUFFER  NetBuffer,
    IN ULONG  DataOffsetDelta,
    IN ULONG  DataBackFill,
    IN NET_BUFFER_ALLOCATE_MDL_HANDLER  AllocateMdlHandler OPTIONAL
    );



#ifdef NdisRetreatNetBufferListDataStart
#undef NdisRetreatNetBufferListDataStart
#endif
#define NdisRetreatNetBufferListDataStart sdv_NdisRetreatNetBufferListDataStart
NDIS_STATUS

sdv_NdisRetreatNetBufferListDataStart(
    IN PNET_BUFFER_LIST  NetBufferList,
    IN ULONG  DataOffsetDelta,
    IN ULONG  DataBackFill,
    IN NET_BUFFER_ALLOCATE_MDL_HANDLER  AllocateMdlHandler OPTIONAL,
    IN NET_BUFFER_FREE_MDL_HANDLER  FreeMdlHandler OPTIONAL
    );


#ifdef NdisReturnNetBufferLists
#undef NdisReturnNetBufferLists
#endif
#define NdisReturnNetBufferLists sdv_NdisReturnNetBufferLists
VOID

sdv_NdisReturnNetBufferLists (
    IN NDIS_HANDLE  NdisBindingHandle,
    IN PNET_BUFFER_LIST  NetBufferLists,
    IN ULONG  ReturnFlags
    );


#ifdef NdisSendNetBufferLists
#undef NdisSendNetBufferLists
#endif
#define NdisSendNetBufferLists sdv_NdisSendNetBufferLists
VOID

sdv_NdisSendNetBufferLists(
    IN NDIS_HANDLE  NdisBindingHandle,
    IN PNET_BUFFER_LIST  NetBufferLists,
    IN NDIS_PORT_NUMBER  PortNumber,
    IN ULONG  SendFlags
    );


#ifdef NdisSetOptionalHandlers
#undef NdisSetOptionalHandlers
#endif
#define NdisSetOptionalHandlers sdv_NdisSetOptionalHandlers
NDIS_STATUS

sdv_NdisSetOptionalHandlers(
    IN NDIS_HANDLE  NdisHandle,
    IN PNDIS_DRIVER_OPTIONAL_HANDLERS  OptionalHandlers
    );


#ifdef NdisSetTimerObject
#undef NdisSetTimerObject
#endif
#define NdisSetTimerObject sdv_NdisSetTimerObject
BOOLEAN

sdv_NdisSetTimerObject(
    IN NDIS_HANDLE  TimerObject,
    IN LARGE_INTEGER  DueTime,
    IN ULONG  MillisecondsPeriod OPTIONAL,
    IN PVOID  FunctionContext OPTIONAL
    );


#ifdef NdisUnbindAdapter
#undef NdisUnbindAdapter
#endif
#define NdisUnbindAdapter sdv_NdisUnbindAdapter
NDIS_STATUS

sdv_NdisUnbindAdapter(
    IN NDIS_HANDLE  NdisBindingHandle
    );



#ifdef NetAllocateMdl
#undef NetAllocateMdl
#endif
#define NetAllocateMdl sdv_NetAllocateMdl
PMDL
  sdv_NetAllocateMdl(
    IN PULONG  BufferSize
    );



#ifdef NetFreeMdl
#undef NetFreeMdl
#endif
#define NetFreeMdl sdv_NetFreeMdl
VOID
  sdv_NetFreeMdl(
    IN  PMDL  Mdl
    );



#ifdef NdisCloseAdapterEx
#undef NdisCloseAdapterEx
#endif
#define NdisCloseAdapterEx sdv_NdisCloseAdapterEx
NDIS_STATUS

sdv_NdisCloseAdapterEx(
    IN NDIS_HANDLE  NdisBindingHandle
    );



#ifdef NdisMRegisterIoPortRange
#undef NdisMRegisterIoPortRange
#endif
#define NdisMRegisterIoPortRange sdv_NdisMRegisterIoPortRange
NDIS_STATUS
sdv_NdisMRegisterIoPortRange(
    OUT PVOID  *PortOffset,
    IN NDIS_HANDLE  MiniportAdapterHandle,
    IN UINT  InitialPort,
    IN UINT  NumberOfPorts
    );


#ifdef NDIS_LOWER_IRQL
#undef NDIS_LOWER_IRQL
#endif
#define NDIS_LOWER_IRQL sdv_NDIS_LOWER_IRQL
VOID
sdv_NDIS_LOWER_IRQL(
    IN KIRQL _OldIrql_, 
    IN KIRQL _CurIrql_
    );

#ifdef NDIS_RAISE_IRQL_TO_DISPATCH
#undef NDIS_RAISE_IRQL_TO_DISPATCH
#endif
#define NDIS_RAISE_IRQL_TO_DISPATCH sdv_NDIS_RAISE_IRQL_TO_DISPATCH
VOID
sdv_NDIS_RAISE_IRQL_TO_DISPATCH(
    OUT PKIRQL _pIrql_
    );

#ifdef NdisWaitEvent
#undef NdisWaitEvent
#endif
#define NdisWaitEvent sdv_NdisWaitEvent
BOOLEAN
sdv_NdisWaitEvent(
    IN PNDIS_EVENT  Event,
    IN UINT  MsToWait
    );

#ifdef NdisStallExecution
#undef NdisStallExecution
#endif
#define NdisStallExecution sdv_NdisStallExecution
VOID
sdv_NdisStallExecution(
    IN ULONG MicrosecondsToStall
    );

#ifdef NDIS_RELEASE_MUTEX
#undef NDIS_RELEASE_MUTEX
#endif
#define NDIS_RELEASE_MUTEX sdv_NDIS_RELEASE_MUTEX
LONG
sdv_NDIS_RELEASE_MUTEX(
	IN PRKMUTEX  Mutex
	);

#ifdef NDIS_WAIT_FOR_MUTEX
#undef NDIS_WAIT_FOR_MUTEX
#endif
#define NDIS_WAIT_FOR_MUTEX sdv_NDIS_WAIT_FOR_MUTEX
NTSTATUS 
sdv_NDIS_WAIT_FOR_MUTEX(
	IN PRKMUTEX  Mutex
	);

#ifdef NdisAcquireReadWriteLock
#undef NdisAcquireReadWriteLock
#endif
#define NdisAcquireReadWriteLock sdv_NdisAcquireReadWriteLock
VOID
sdv_NdisAcquireReadWriteLock(
    IN  PNDIS_RW_LOCK           Lock,
    IN  BOOLEAN                 fWrite,
    IN  PLOCK_STATE             LockState
    );

#ifdef NdisAllocateFromNPagedLookasideList
#undef NdisAllocateFromNPagedLookasideList
#endif
#define NdisAllocateFromNPagedLookasideList sdv_NdisAllocateFromNPagedLookasideList
PVOID
sdv_NdisAllocateFromNPagedLookasideList(
    IN PNPAGED_LOOKASIDE_LIST  Lookaside
    );

#ifdef NdisAnsiStringToUnicodeString
#undef NdisAnsiStringToUnicodeString
#endif
#define NdisAnsiStringToUnicodeString sdv_NdisAnsiStringToUnicodeString
NDIS_STATUS
sdv_NdisAnsiStringToUnicodeString(
    IN OUT PUNICODE_STRING  DestinationString,
    IN PANSI_STRING  SourceString
    );

#ifdef NdisClAddParty
#undef NdisClAddParty
#endif
#define NdisClAddParty sdv_NdisClAddParty
NDIS_STATUS
sdv_NdisClAddParty(
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  NDIS_HANDLE             ProtocolPartyContext,
    IN OUT PCO_CALL_PARAMETERS  CallParameters,
    OUT PNDIS_HANDLE            NdisPartyHandle
    );

#ifdef NdisClCloseAddressFamily
#undef NdisClCloseAddressFamily
#endif
#define NdisClCloseAddressFamily sdv_NdisClCloseAddressFamily
NDIS_STATUS
sdv_NdisClCloseAddressFamily(
    IN  NDIS_HANDLE             NdisAfHandle
    );

#ifdef NdisClCloseCall
#undef NdisClCloseCall
#endif
#define NdisClCloseCall sdv_NdisClCloseCall
NDIS_STATUS
sdv_NdisClCloseCall(
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  NDIS_HANDLE             NdisPartyHandle         OPTIONAL,
    IN  PVOID                   Buffer                  OPTIONAL,
    IN  UINT                    Size                    OPTIONAL
    );

#ifdef NdisClDeregisterSap
#undef NdisClDeregisterSap
#endif
#define NdisClDeregisterSap sdv_NdisClDeregisterSap
NDIS_STATUS
sdv_NdisClDeregisterSap(
    IN  NDIS_HANDLE             NdisSapHandle
    );

#ifdef NdisClDropParty
#undef NdisClDropParty
#endif
#define NdisClDropParty sdv_NdisClDropParty
NDIS_STATUS
sdv_NdisClDropParty(
    IN  NDIS_HANDLE             NdisPartyHandle,
    IN  PVOID                   Buffer      OPTIONAL,
    IN  UINT                    Size        OPTIONAL
    );

#ifdef NdisClGetProtocolVcContextFromTapiCallId
#undef NdisClGetProtocolVcContextFromTapiCallId
#endif
#define NdisClGetProtocolVcContextFromTapiCallId sdv_NdisClGetProtocolVcContextFromTapiCallId
NDIS_STATUS
sdv_NdisClGetProtocolVcContextFromTapiCallId(
    IN  UNICODE_STRING          TapiCallId,
    OUT PNDIS_HANDLE            ProtocolVcContext
    );

#ifdef NdisClIncomingCallComplete
#undef NdisClIncomingCallComplete
#endif
#define NdisClIncomingCallComplete sdv_NdisClIncomingCallComplete
VOID
sdv_NdisClIncomingCallComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  PCO_CALL_PARAMETERS     CallParameters
    );

#ifdef NdisClMakeCall
#undef NdisClMakeCall
#endif
#define NdisClMakeCall sdv_NdisClMakeCall
NDIS_STATUS
sdv_NdisClMakeCall(
    IN  NDIS_HANDLE             NdisVcHandle,
    IN OUT PCO_CALL_PARAMETERS  CallParameters,
    IN  NDIS_HANDLE             ProtocolPartyContext    OPTIONAL,
    OUT PNDIS_HANDLE            NdisPartyHandle         OPTIONAL
    );

#ifdef NdisClModifyCallQoS
#undef NdisClModifyCallQoS
#endif
#define NdisClModifyCallQoS sdv_NdisClModifyCallQoS
NDIS_STATUS
sdv_NdisClModifyCallQoS(
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  PCO_CALL_PARAMETERS     CallParameters
    );

#ifdef NdisClNotifyCloseAddressFamilyComplete
#undef NdisClNotifyCloseAddressFamilyComplete
#endif
#define NdisClNotifyCloseAddressFamilyComplete sdv_NdisClNotifyCloseAddressFamilyComplete
VOID
sdv_NdisClNotifyCloseAddressFamilyComplete (
    IN  NDIS_HANDLE             NdisAfHandle,
    IN  NDIS_STATUS              Status
    );

#ifdef NdisClOpenAddressFamilyEx
#undef NdisClOpenAddressFamilyEx
#endif
#define NdisClOpenAddressFamilyEx sdv_NdisClOpenAddressFamilyEx
NDIS_STATUS
sdv_NdisClOpenAddressFamilyEx (
    IN  NDIS_HANDLE             NdisBindingHandle,
    IN  PCO_ADDRESS_FAMILY      AddressFamily,
    IN  NDIS_HANDLE             ClientAfContext,
    OUT PNDIS_HANDLE            NdisAfHandle
    );

#ifdef NdisCloseConfiguration
#undef NdisCloseConfiguration
#endif
#define NdisCloseConfiguration sdv_NdisCloseConfiguration
VOID
sdv_NdisCloseConfiguration(
    IN  NDIS_HANDLE             ConfigurationHandle
    );

#ifdef NdisCloseFile
#undef NdisCloseFile
#endif
#define NdisCloseFile sdv_NdisCloseFile
VOID
sdv_NdisCloseFile(
    IN  NDIS_HANDLE             FileHandle
    );

#ifdef NdisClRegisterSap
#undef NdisClRegisterSap
#endif
#define NdisClRegisterSap sdv_NdisClRegisterSap
NDIS_STATUS
sdv_NdisClRegisterSap(
    IN  NDIS_HANDLE             NdisAfHandle,
    IN  NDIS_HANDLE             ProtocolSapContext,
    IN  PCO_SAP                 Sap,
    OUT PNDIS_HANDLE            NdisSapHandle
    );

#ifdef NdisCmActivateVc
#undef NdisCmActivateVc
#endif
#define NdisCmActivateVc sdv_NdisCmActivateVc
NDIS_STATUS
sdv_NdisCmActivateVc(
    IN  NDIS_HANDLE             NdisVcHandle,
    IN OUT PCO_CALL_PARAMETERS  CallParameters
    );

#ifdef NdisCmAddPartyComplete
#undef NdisCmAddPartyComplete
#endif
#define NdisCmAddPartyComplete sdv_NdisCmAddPartyComplete
VOID
sdv_NdisCmAddPartyComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisPartyHandle,
    IN  NDIS_HANDLE             CallMgrPartyContext OPTIONAL,
    IN  PCO_CALL_PARAMETERS     CallParameters
    );

#ifdef NdisCmCloseAddressFamilyComplete
#undef NdisCmCloseAddressFamilyComplete
#endif
#define NdisCmCloseAddressFamilyComplete sdv_NdisCmCloseAddressFamilyComplete
VOID
sdv_NdisCmCloseAddressFamilyComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisAfHandle
    );

#ifdef NdisCmCloseCallComplete
#undef NdisCmCloseCallComplete
#endif
#define NdisCmCloseCallComplete sdv_NdisCmCloseCallComplete
VOID
sdv_NdisCmCloseCallComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  NDIS_HANDLE             NdisPartyHandle OPTIONAL
    );

#ifdef NdisCmDeactivateVc
#undef NdisCmDeactivateVc
#endif
#define NdisCmDeactivateVc sdv_NdisCmDeactivateVc
NDIS_STATUS
sdv_NdisCmDeactivateVc(
    IN  NDIS_HANDLE             NdisVcHandle
    );

#ifdef NdisCmDeregisterSapComplete
#undef NdisCmDeregisterSapComplete
#endif
#define NdisCmDeregisterSapComplete sdv_NdisCmDeregisterSapComplete
VOID
sdv_NdisCmDeregisterSapComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisSapHandle
    );

#ifdef NdisCmDispatchCallConnected
#undef NdisCmDispatchCallConnected
#endif
#define NdisCmDispatchCallConnected sdv_NdisCmDispatchCallConnected
VOID
sdv_NdisCmDispatchCallConnected(
    IN  NDIS_HANDLE             NdisVcHandle
    );

#ifdef NdisCmDispatchIncomingCall
#undef NdisCmDispatchIncomingCall
#endif
#define NdisCmDispatchIncomingCall sdv_NdisCmDispatchIncomingCall
NDIS_STATUS
sdv_NdisCmDispatchIncomingCall(
    IN  NDIS_HANDLE             NdisSapHandle,
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  PCO_CALL_PARAMETERS     CallParameters
    );

#ifdef NdisCmDispatchIncomingCallQoSChange
#undef NdisCmDispatchIncomingCallQoSChange
#endif
#define NdisCmDispatchIncomingCallQoSChange sdv_NdisCmDispatchIncomingCallQoSChange
VOID
sdv_NdisCmDispatchIncomingCallQoSChange(
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  PCO_CALL_PARAMETERS     CallParameters
    );

#ifdef NdisCmDispatchIncomingCloseCall
#undef NdisCmDispatchIncomingCloseCall
#endif
#define NdisCmDispatchIncomingCloseCall sdv_NdisCmDispatchIncomingCloseCall
VOID
sdv_NdisCmDispatchIncomingCloseCall(
    IN  NDIS_STATUS             CloseStatus,
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  PVOID                   Buffer      OPTIONAL,
    IN  UINT                    Size        OPTIONAL
    );

#ifdef NdisCmDispatchIncomingDropParty
#undef NdisCmDispatchIncomingDropParty
#endif
#define NdisCmDispatchIncomingDropParty sdv_NdisCmDispatchIncomingDropParty
VOID
sdv_NdisCmDispatchIncomingDropParty(
    IN  NDIS_STATUS             DropStatus,
    IN  NDIS_HANDLE             NdisPartyHandle,
    IN  PVOID                   Buffer      OPTIONAL,
    IN  UINT                    Size        OPTIONAL
    );

#ifdef NdisCmDropPartyComplete
#undef NdisCmDropPartyComplete
#endif
#define NdisCmDropPartyComplete sdv_NdisCmDropPartyComplete
VOID
sdv_NdisCmDropPartyComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisPartyHandle
    );

#ifdef NdisCmMakeCallComplete
#undef NdisCmMakeCallComplete
#endif
#define NdisCmMakeCallComplete sdv_NdisCmMakeCallComplete
VOID
sdv_NdisCmMakeCallComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  NDIS_HANDLE             NdisPartyHandle     OPTIONAL,
    IN  NDIS_HANDLE             CallMgrPartyContext OPTIONAL,
    IN  PCO_CALL_PARAMETERS     CallParameters
    );

#ifdef NdisCmModifyCallQoSComplete
#undef NdisCmModifyCallQoSComplete
#endif
#define NdisCmModifyCallQoSComplete sdv_NdisCmModifyCallQoSComplete
VOID
sdv_NdisCmModifyCallQoSComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  PCO_CALL_PARAMETERS     CallParameters
    );

#ifdef NdisCmNotifyCloseAddressFamily
#undef NdisCmNotifyCloseAddressFamily
#endif
#define NdisCmNotifyCloseAddressFamily sdv_NdisCmNotifyCloseAddressFamily
NDIS_STATUS
sdv_NdisCmNotifyCloseAddressFamily (
    IN  NDIS_HANDLE             NdisAfHandle 
    );

#ifdef NdisCmOpenAddressFamilyComplete
#undef NdisCmOpenAddressFamilyComplete
#endif
#define NdisCmOpenAddressFamilyComplete sdv_NdisCmOpenAddressFamilyComplete
VOID
sdv_NdisCmOpenAddressFamilyComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisAfHandle,
    IN  NDIS_HANDLE             CallMgrAfContext
    );

#ifdef NdisCmRegisterAddressFamilyEx
#undef NdisCmRegisterAddressFamilyEx
#endif
#define NdisCmRegisterAddressFamilyEx sdv_NdisCmRegisterAddressFamilyEx
NDIS_STATUS
sdv_NdisCmRegisterAddressFamilyEx(
    IN  NDIS_HANDLE             NdisBindingHandle,
    IN  PCO_ADDRESS_FAMILY      AddressFamily
    );

#ifdef NdisCmRegisterSapComplete
#undef NdisCmRegisterSapComplete
#endif
#define NdisCmRegisterSapComplete sdv_NdisCmRegisterSapComplete
VOID
sdv_NdisCmRegisterSapComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisSapHandle,
    IN  NDIS_HANDLE             CallMgrSapContext
    );

#ifdef NdisCoAssignInstanceName
#undef NdisCoAssignInstanceName
#endif
#define NdisCoAssignInstanceName sdv_NdisCoAssignInstanceName
NDIS_STATUS
sdv_NdisCoAssignInstanceName(
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  PNDIS_STRING            BaseInstanceName,
    OUT PNDIS_STRING            VcInstanceName
    );

#ifdef NdisCoCreateVc
#undef NdisCoCreateVc
#endif
#define NdisCoCreateVc sdv_NdisCoCreateVc
NDIS_STATUS
sdv_NdisCoCreateVc(
    IN  NDIS_HANDLE             NdisBindingHandle,
    IN  NDIS_HANDLE             NdisAfHandle        OPTIONAL,
    IN  NDIS_HANDLE             ProtocolVcContext,
    IN OUT PNDIS_HANDLE         NdisVcHandle
    );

#ifdef NdisCoDeleteVc
#undef NdisCoDeleteVc
#endif
#define NdisCoDeleteVc sdv_NdisCoDeleteVc
NDIS_STATUS
sdv_NdisCoDeleteVc(
    IN  NDIS_HANDLE             NdisVcHandle
    );

#ifdef NdisCoGetTapiCallId
#undef NdisCoGetTapiCallId
#endif
#define NdisCoGetTapiCallId sdv_NdisCoGetTapiCallId
NDIS_STATUS
sdv_NdisCoGetTapiCallId(
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  OUT PVAR_STRING         TapiCallId
    );

#ifdef NdisCoOidRequest
#undef NdisCoOidRequest
#endif
#define NdisCoOidRequest sdv_NdisCoOidRequest
NDIS_STATUS
sdv_NdisCoOidRequest(
    IN  NDIS_HANDLE             NdisBindingHandle,
    IN  NDIS_HANDLE             NdisAfHandle    OPTIONAL,
    IN  NDIS_HANDLE             NdisVcHandle    OPTIONAL,
    IN  NDIS_HANDLE             NdisPartyHandle OPTIONAL,
    IN OUT PNDIS_OID_REQUEST    OidRequest
    );

#ifdef NdisCoOidRequestComplete
#undef NdisCoOidRequestComplete
#endif
#define NdisCoOidRequestComplete sdv_NdisCoOidRequestComplete
VOID
sdv_NdisCoOidRequestComplete(
    IN  NDIS_HANDLE             NdisAfHandle,
    IN  NDIS_HANDLE             NdisVcHandle    OPTIONAL,
    IN  NDIS_HANDLE             NdisPartyHandle OPTIONAL,
    IN  PNDIS_OID_REQUEST       OidRequest,
    IN  NDIS_STATUS             Status
    );

#ifdef NdisCoSendNetBufferLists
#undef NdisCoSendNetBufferLists
#endif
#define NdisCoSendNetBufferLists sdv_NdisCoSendNetBufferLists
VOID
sdv_NdisCoSendNetBufferLists(
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  PNET_BUFFER_LIST        NetBufferLists,
    IN  ULONG                   SendFlags
    );

#ifdef NdisDeleteNPagedLookasideList
#undef NdisDeleteNPagedLookasideList
#endif
#define NdisDeleteNPagedLookasideList sdv_NdisDeleteNPagedLookasideList
VOID
sdv_NdisDeleteNPagedLookasideList(
    IN  PNPAGED_LOOKASIDE_LIST  Lookaside
    );


#ifdef NdisEqualMemory
#undef NdisEqualMemory
#endif
#define NdisEqualMemory sdv_NdisEqualMemory
ULONG
sdv_NdisEqualMemory (
    CONST VOID  *Source1,
    CONST VOID  *Source2,
    ULONG  Length
    );

#ifdef NdisEqualString
#undef NdisEqualString
#endif
#define NdisEqualString sdv_NdisEqualString
BOOLEAN
sdv_NdisEqualString(
    IN PNDIS_STRING  String1,
    IN PNDIS_STRING  String2,
    IN BOOLEAN  CaseInsensitive
    );


#ifdef NdisEqualUnicodeString
#undef NdisEqualUnicodeString
#endif
#define NdisEqualUnicodeString sdv_NdisEqualUnicodeString
BOOLEAN
sdv_NdisEqualUnicodeString(
    IN PNDIS_STRING  String1,
    IN PNDIS_STRING  String2,
    IN BOOLEAN  CaseInSensitive
    );

#ifdef NdisAllocateSpinLock
#undef NdisAllocateSpinLock
#endif
#define NdisAllocateSpinLock sdv_NdisAllocateSpinLock
VOID
sdv_NdisAllocateSpinLock(
    PNDIS_SPIN_LOCK  SpinLock
    );

#ifdef NdisFreeSpinLock
#undef NdisFreeSpinLock
#endif
#define NdisFreeSpinLock sdv_NdisFreeSpinLock
VOID
sdv_NdisFreeSpinLock(
    IN PNDIS_SPIN_LOCK  SpinLock
    );

#ifdef NdisFreeString
#undef NdisFreeString
#endif
#define NdisFreeString sdv_NdisFreeString
VOID
sdv_NdisFreeString(
    IN NDIS_STRING  String
    );

#ifdef NdisFreeToNPagedLookasideList
#undef NdisFreeToNPagedLookasideList
#endif
#define NdisFreeToNPagedLookasideList sdv_NdisFreeToNPagedLookasideList
VOID
sdv_NdisFreeToNPagedLookasideList(
    IN PNPAGED_LOOKASIDE_LIST  Lookaside,
    IN PVOID  Entry
    );

#ifdef NdisGeneratePartialCancelId
#undef NdisGeneratePartialCancelId
#endif
#define NdisGeneratePartialCancelId sdv_NdisGeneratePartialCancelId
UCHAR
sdv_NdisGeneratePartialCancelId(
    VOID
    );

#ifdef NdisGetCurrentProcessorCounts
#undef NdisGetCurrentProcessorCounts
#endif
#define NdisGetCurrentProcessorCounts sdv_NdisGetCurrentProcessorCounts
VOID
sdv_NdisGetCurrentProcessorCounts(
    OUT PULONG                  pIdleCount,
    OUT PULONG                  pKernelAndUser,
    OUT PULONG                  pIndex
    );

/*#ifdef NdisGetDriverHandle
#undef NdisGetDriverHandle
#endif
#define NdisGetDriverHandle sdv_NdisGetDriverHandle
VOID
sdv_NdisGetDriverHandle(
    IN  NDIS_HANDLE             NdisBindingHandle,
    OUT PNDIS_HANDLE            NdisDriverHandle
    );*/

#ifdef NdisGetRoutineAddress
#undef NdisGetRoutineAddress
#endif
#define NdisGetRoutineAddress sdv_NdisGetRoutineAddress
PVOID
sdv_NdisGetRoutineAddress(
    IN PNDIS_STRING     NdisRoutineName
    );

#ifdef NdisGetSharedDataAlignment
#undef NdisGetSharedDataAlignment
#endif
#define NdisGetSharedDataAlignment sdv_NdisGetSharedDataAlignment
ULONG
sdv_NdisGetSharedDataAlignment(
    VOID
    );

#ifdef NdisGetVersion
#undef NdisGetVersion
#endif
#define NdisGetVersion sdv_NdisGetVersion
UINT
sdv_NdisGetVersion(
    VOID
    );

#ifdef NdisIfAddIfStackEntry
#undef NdisIfAddIfStackEntry
#endif
#define NdisIfAddIfStackEntry sdv_NdisIfAddIfStackEntry
NDIS_STATUS
sdv_NdisIfAddIfStackEntry(
    IN NET_IFINDEX          HigherLayerIfIndex,
    IN NET_IFINDEX          LowerLayerIfIndex
    );

#ifdef NdisIfAllocateNetLuidIndex
#undef NdisIfAllocateNetLuidIndex
#endif
#define NdisIfAllocateNetLuidIndex sdv_NdisIfAllocateNetLuidIndex
NDIS_STATUS
sdv_NdisIfAllocateNetLuidIndex(
    IN  NET_IFTYPE          ifType,
    OUT PUINT32             pNetLuidIndex
    );

#ifdef NdisIfDeleteIfStackEntry
#undef NdisIfDeleteIfStackEntry
#endif
#define NdisIfDeleteIfStackEntry sdv_NdisIfDeleteIfStackEntry
VOID
sdv_NdisIfDeleteIfStackEntry(
    IN NET_IFINDEX          HigherLayerIfIndex,
    IN NET_IFINDEX          LowerLayerIfIndex
    );

#ifdef NdisIfDeregisterInterface
#undef NdisIfDeregisterInterface
#endif
#define NdisIfDeregisterInterface sdv_NdisIfDeregisterInterface
VOID
sdv_NdisIfDeregisterInterface(
    IN NET_IFINDEX          ifIndex
    );

#ifdef NdisIfDeregisterProvider
#undef NdisIfDeregisterProvider
#endif
#define NdisIfDeregisterProvider sdv_NdisIfDeregisterProvider
VOID
sdv_NdisIfDeregisterProvider(
    IN NDIS_HANDLE          NdisProviderHandle
    );

#ifdef NdisIfFreeNetLuidIndex
#undef NdisIfFreeNetLuidIndex
#endif
#define NdisIfFreeNetLuidIndex sdv_NdisIfFreeNetLuidIndex
NDIS_STATUS
sdv_NdisIfFreeNetLuidIndex(
    IN NET_IFTYPE           ifType,
    IN UINT32               NetLuidIndex
    );

#ifdef NdisIfGetInterfaceIndexFromNetLuid
#undef NdisIfGetInterfaceIndexFromNetLuid
#endif
#define NdisIfGetInterfaceIndexFromNetLuid sdv_NdisIfGetInterfaceIndexFromNetLuid
NDIS_STATUS
sdv_NdisIfGetInterfaceIndexFromNetLuid(
    IN  NET_LUID            NetLuid,
    OUT PNET_IFINDEX        pIfIndex
    );

#ifdef NdisIfGetNetLuidFromInterfaceIndex
#undef NdisIfGetNetLuidFromInterfaceIndex
#endif
#define NdisIfGetNetLuidFromInterfaceIndex sdv_NdisIfGetNetLuidFromInterfaceIndex
NDIS_STATUS
sdv_NdisIfGetNetLuidFromInterfaceIndex(
    IN  NET_IFINDEX         ifIndex,
    OUT PNET_LUID           pNetLuid
    );

#ifdef NdisIfQueryBindingIfIndex
#undef NdisIfQueryBindingIfIndex
#endif
#define NdisIfQueryBindingIfIndex sdv_NdisIfQueryBindingIfIndex
NDIS_STATUS
sdv_NdisIfQueryBindingIfIndex(
    IN  NDIS_HANDLE         NdisBindingHandle,
    OUT PNET_IFINDEX        pBoundIfIndex,
    OUT PNET_LUID           pBoundIfNetLuid,
    OUT PNET_IFINDEX        pLowestIfIndex,
    OUT PNET_LUID           pLowestIfNetLuid
    );

#ifdef NdisIfRegisterInterface
#undef NdisIfRegisterInterface
#endif
#define NdisIfRegisterInterface sdv_NdisIfRegisterInterface
NDIS_STATUS
sdv_NdisIfRegisterInterface(
    IN NDIS_HANDLE          NdisProviderHandle,
    IN NET_LUID             NetLuid,
    IN NDIS_HANDLE          ProviderIfContext,
    IN PNET_IF_INFORMATION  pIfInfo,
    OUT PNET_IFINDEX        pfIndex
    );

#ifdef NdisIfRegisterProvider
#undef NdisIfRegisterProvider
#endif
#define NdisIfRegisterProvider sdv_NdisIfRegisterProvider
NDIS_STATUS
sdv_NdisIfRegisterProvider(
    IN  PNDIS_IF_PROVIDER_CHARACTERISTICS   ProviderCharacteristics,
    IN  NDIS_HANDLE                         IfProviderContext,
    OUT PNDIS_HANDLE                        pNdisIfProviderHandle
    );

#ifdef NdisIMAssociateMiniport
#undef NdisIMAssociateMiniport
#endif
#define NdisIMAssociateMiniport sdv_NdisIMAssociateMiniport
VOID
sdv_NdisIMAssociateMiniport(
    IN  NDIS_HANDLE         DriverHandle,
    IN  NDIS_HANDLE         ProtocolHandle
    );

#ifdef NdisIMCancelInitializeDeviceInstance
#undef NdisIMCancelInitializeDeviceInstance
#endif
#define NdisIMCancelInitializeDeviceInstance sdv_NdisIMCancelInitializeDeviceInstance
NDIS_STATUS
sdv_NdisIMCancelInitializeDeviceInstance(
    IN  NDIS_HANDLE             DriverHandle,
    IN  PNDIS_STRING            DeviceInstance
    );

#ifdef NdisIMDeInitializeDeviceInstance
#undef NdisIMDeInitializeDeviceInstance
#endif
#define NdisIMDeInitializeDeviceInstance sdv_NdisIMDeInitializeDeviceInstance
NDIS_STATUS
sdv_NdisIMDeInitializeDeviceInstance(
    IN  NDIS_HANDLE             NdisMiniportHandle
    );

#ifdef NdisIMGetBindingContext
#undef NdisIMGetBindingContext
#endif
#define NdisIMGetBindingContext sdv_NdisIMGetBindingContext
NDIS_HANDLE
sdv_NdisIMGetBindingContext(
    IN  NDIS_HANDLE             NdisBindingHandle
    );

#ifdef NdisIMInitializeDeviceInstanceEx
#undef NdisIMInitializeDeviceInstanceEx
#endif
#define NdisIMInitializeDeviceInstanceEx sdv_NdisIMInitializeDeviceInstanceEx
NDIS_STATUS
sdv_NdisIMInitializeDeviceInstanceEx(
    IN  NDIS_HANDLE             DriverHandle,
    IN  PNDIS_STRING            DriverInstance,
    IN  NDIS_HANDLE             DeviceContext   OPTIONAL
    );

#ifdef NdisInitAnsiString
#undef NdisInitAnsiString
#endif
#define NdisInitAnsiString sdv_NdisInitAnsiString
VOID
sdv_NdisInitAnsiString(
    IN OUT PANSI_STRING  DestinationString,
    IN PCSTR  SourceString
    );

#ifdef NdisInitializeListHead
#undef NdisInitializeListHead
#endif
#define NdisInitializeListHead sdv_NdisInitializeListHead
VOID
sdv_NdisInitializeListHead(
    IN  PLIST_ENTRY ListHead
    );

#ifdef NdisInitializeNPagedLookasideList
#undef NdisInitializeNPagedLookasideList
#endif
#define NdisInitializeNPagedLookasideList sdv_NdisInitializeNPagedLookasideList
VOID
sdv_NdisInitializeNPagedLookasideList(
    IN PNPAGED_LOOKASIDE_LIST  Lookaside,
    IN PALLOCATE_FUNCTION  Allocate  OPTIONAL,
    IN PFREE_FUNCTION  Free  OPTIONAL,
    IN ULONG  Flags,
    IN ULONG  Size,
    IN ULONG  Tag,
    IN USHORT  Depth
    );


#ifdef NdisInitializeSListHead
#undef NdisInitializeSListHead
#endif
#define NdisInitializeSListHead sdv_NdisInitializeSListHead
VOID 
sdv_NdisInitializeSListHead(
    IN PSLIST_HEADER  SListHead
    );

#ifdef NdisInitializeString
#undef NdisInitializeString
#endif
#define NdisInitializeString sdv_NdisInitializeString
VOID
sdv_NdisInitializeString(
    OUT PNDIS_STRING    Destination,
    IN  PUCHAR          Source
    );

#ifdef NdisInitUnicodeString
#undef NdisInitUnicodeString
#endif
#define NdisInitUnicodeString sdv_NdisInitUnicodeString
VOID
sdv_NdisInitUnicodeString(
    IN OUT PNDIS_STRING  DestinationString,
    IN PCWSTR  SourceString
    ); 
  
#ifdef NdisInterlockedAddUlong
#undef NdisInterlockedAddUlong
#endif
#define NdisInterlockedAddUlong sdv_NdisInterlockedAddUlong
VOID
sdv_NdisInterlockedAddUlong(
    IN PULONG  Addend,
    IN ULONG  Increment,
    IN PNDIS_SPIN_LOCK  SpinLock
    );

#ifdef NdisInterlockedDecrement
#undef NdisInterlockedDecrement
#endif
#define NdisInterlockedDecrement sdv_NdisInterlockedDecrement
LONG
sdv_NdisInterlockedDecrement(
    IN PLONG  Addend
    );

#ifdef NdisInterlockedInsertHeadList
#undef NdisInterlockedInsertHeadList
#endif
#define NdisInterlockedInsertHeadList sdv_NdisInterlockedInsertHeadList
PLIST_ENTRY
sdv_NdisInterlockedInsertHeadList(
    IN PLIST_ENTRY  ListHead,
    IN PLIST_ENTRY  ListEntry,
    IN PNDIS_SPIN_LOCK  SpinLock
    );

#ifdef NdisInterlockedInsertTailList
#undef NdisInterlockedInsertTailList
#endif
#define NdisInterlockedInsertTailList sdv_NdisInterlockedInsertTailList
PLIST_ENTRY
sdv_NdisInterlockedInsertTailList(
    IN PLIST_ENTRY  ListHead,
    IN PLIST_ENTRY  ListEntry,
    IN PNDIS_SPIN_LOCK  SpinLock
    );

#ifdef NdisInterlockedPopEntrySList
#undef NdisInterlockedPopEntrySList
#endif
#define NdisInterlockedPopEntrySList sdv_NdisInterlockedPopEntrySList
PSINGLE_LIST_ENTRY
sdv_NdisInterlockedPopEntrySList(
    IN PSLIST_HEADER  ListHead,
    IN PKSPIN_LOCK  Lock
    );

#ifdef NdisInterlockedPushEntrySList
#undef NdisInterlockedPushEntrySList
#endif
#define NdisInterlockedPushEntrySList sdv_NdisInterlockedPushEntrySList
PSINGLE_LIST_ENTRY
sdv_NdisInterlockedPushEntrySList(
    IN PSLIST_HEADER  ListHead,
    IN PSINGLE_LIST_ENTRY  ListEntry,
    IN PKSPIN_LOCK  Lock
    );

#ifdef NdisInterlockedRemoveHeadList
#undef NdisInterlockedRemoveHeadList
#endif
#define NdisInterlockedRemoveHeadList sdv_NdisInterlockedRemoveHeadList
PLIST_ENTRY
sdv_NdisInterlockedRemoveHeadList(
    IN PLIST_ENTRY  ListHead,
    IN PNDIS_SPIN_LOCK  SpinLock
    );

#ifdef NdisMapFile
#undef NdisMapFile
#endif
#define NdisMapFile sdv_NdisMapFile
VOID
sdv_NdisMapFile(
    OUT PNDIS_STATUS            Status,
    OUT PVOID *                 MappedBuffer,
    IN  NDIS_HANDLE             FileHandle
    );

#ifdef NdisMCmActivateVc
#undef NdisMCmActivateVc
#endif
#define NdisMCmActivateVc sdv_NdisMCmActivateVc
NDIS_STATUS
sdv_NdisMCmActivateVc(
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  PCO_CALL_PARAMETERS     CallParameters
    );

#ifdef NdisMCmAddPartyComplete
#undef NdisMCmAddPartyComplete
#endif
#define NdisMCmAddPartyComplete sdv_NdisMCmAddPartyComplete
VOID
sdv_NdisMCmAddPartyComplete(
    IN NDIS_STATUS  Status,
    IN NDIS_HANDLE  NdisPartyHandle,
    IN NDIS_HANDLE  CallMgrPartyContext  OPTIONAL,
    IN PCO_CALL_PARAMETERS  CallParameters
    );

#ifdef NdisMCmCloseAddressFamilyComplete
#undef NdisMCmCloseAddressFamilyComplete
#endif
#define NdisMCmCloseAddressFamilyComplete sdv_NdisMCmCloseAddressFamilyComplete
VOID
sdv_NdisMCmCloseAddressFamilyComplete(
    IN NDIS_STATUS  Status,
    IN NDIS_HANDLE  NdisAfHandle
    );

#ifdef NdisMCmCloseCallComplete
#undef NdisMCmCloseCallComplete
#endif
#define NdisMCmCloseCallComplete sdv_NdisMCmCloseCallComplete
VOID
sdv_NdisMCmCloseCallComplete(
    IN NDIS_STATUS  Status,
    IN NDIS_HANDLE  NdisVcHandle,
    IN NDIS_HANDLE  NdisPartyHandle  OPTIONAL
    );

#ifdef NdisMCmCreateVc
#undef NdisMCmCreateVc
#endif
#define NdisMCmCreateVc sdv_NdisMCmCreateVc
NDIS_STATUS
sdv_NdisMCmCreateVc(
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  NDIS_HANDLE             NdisAfHandle,
    IN  NDIS_HANDLE             MiniportVcContext,
    OUT PNDIS_HANDLE            NdisVcHandle
    );

#ifdef NdisMCmDeactivateVc
#undef NdisMCmDeactivateVc
#endif
#define NdisMCmDeactivateVc sdv_NdisMCmDeactivateVc
NDIS_STATUS
sdv_NdisMCmDeactivateVc(
    IN  NDIS_HANDLE             NdisVcHandle
    );

#ifdef NdisMCmDeleteVc
#undef NdisMCmDeleteVc
#endif
#define NdisMCmDeleteVc sdv_NdisMCmDeleteVc
NDIS_STATUS
sdv_NdisMCmDeleteVc(
    IN  NDIS_HANDLE             NdisVcHandle
    );

#ifdef NdisMCmDeregisterSapComplete
#undef NdisMCmDeregisterSapComplete
#endif
#define NdisMCmDeregisterSapComplete sdv_NdisMCmDeregisterSapComplete
VOID
sdv_NdisMCmDeregisterSapComplete(
    IN NDIS_STATUS  Status,
    IN NDIS_HANDLE  NdisSapHandle
    );

#ifdef NdisMCmDispatchCallConnected
#undef NdisMCmDispatchCallConnected
#endif
#define NdisMCmDispatchCallConnected sdv_NdisMCmDispatchCallConnected
VOID
sdv_NdisMCmDispatchCallConnected(
    IN NDIS_HANDLE  NdisVcHandle
    );

#ifdef NdisMCmDispatchIncomingCall
#undef NdisMCmDispatchIncomingCall
#endif
#define NdisMCmDispatchIncomingCall sdv_NdisMCmDispatchIncomingCall
NDIS_STATUS
sdv_NdisMCmDispatchIncomingCall(
    IN NDIS_HANDLE  NdisSapHandle,
    IN NDIS_HANDLE  NdisVcHandle,
    IN PCO_CALL_PARAMETERS  CallParameters
    );

#ifdef NdisMCmDispatchIncomingCallQoSChange
#undef NdisMCmDispatchIncomingCallQoSChange
#endif
#define NdisMCmDispatchIncomingCallQoSChange sdv_NdisMCmDispatchIncomingCallQoSChange
VOID
NdisMCmDispatchIncomingCallQoSChange(
    IN NDIS_HANDLE  NdisVcHandle,
    IN PCO_CALL_PARAMETERS  CallParameters
    );

#ifdef NdisMCmDispatchIncomingCloseCall
#undef NdisMCmDispatchIncomingCloseCall
#endif
#define NdisMCmDispatchIncomingCloseCall sdv_NdisMCmDispatchIncomingCloseCall
VOID
sdv_NdisMCmDispatchIncomingCloseCall(
    IN NDIS_STATUS  CloseStatus,
    IN NDIS_HANDLE  NdisVcHandle,
    IN PVOID  Buffer  OPTIONAL,
    IN UINT  Size
    );

#ifdef NdisMCmDispatchIncomingDropParty
#undef NdisMCmDispatchIncomingDropParty
#endif
#define NdisMCmDispatchIncomingDropParty sdv_NdisMCmDispatchIncomingDropParty
VOID
sdv_NdisMCmDispatchIncomingDropParty(
    IN NDIS_STATUS  DropStatus,
    IN NDIS_HANDLE  NdisPartyHandle,
    IN PVOID  Buffer  OPTIONAL,
    IN UINT  Size
    );

#ifdef NdisMCmDropPartyComplete
#undef NdisMCmDropPartyComplete
#endif
#define NdisMCmDropPartyComplete sdv_NdisMCmDropPartyComplete
VOID
sdv_NdisMCmDropPartyComplete(
    IN NDIS_STATUS  Status,
    IN NDIS_HANDLE  NdisPartyHandle
    );

#ifdef NdisMCmMakeCallComplete
#undef NdisMCmMakeCallComplete
#endif
#define NdisMCmMakeCallComplete sdv_NdisMCmMakeCallComplete
VOID
sdv_NdisMCmMakeCallComplete(
    IN NDIS_STATUS  Status,
    IN NDIS_HANDLE  NdisVcHandle,
    IN NDIS_HANDLE  NdisPartyHandle  OPTIONAL,
    IN NDIS_HANDLE  CallMgrPartyContext  OPTIONAL,
    IN PCO_CALL_PARAMETERS  CallParameters
    );

#ifdef NdisMCmModifyCallQoSComplete
#undef NdisMCmModifyCallQoSComplete
#endif
#define NdisMCmModifyCallQoSComplete sdv_NdisMCmModifyCallQoSComplete
VOID
sdv_NdisMCmModifyCallQoSComplete(
    IN NDIS_STATUS  Status,
    IN NDIS_HANDLE  NdisVcHandle,
    IN PCO_CALL_PARAMETERS  CallParameters
    );

#ifdef NdisMCmNotifyCloseAddressFamily
#undef NdisMCmNotifyCloseAddressFamily
#endif
#define NdisMCmNotifyCloseAddressFamily sdv_NdisMCmNotifyCloseAddressFamily
NDIS_STATUS
sdv_NdisMCmNotifyCloseAddressFamily(
    IN NDIS_HANDLE  NdisAfHandle
    );

#ifdef NdisMCmOidRequest
#undef NdisMCmOidRequest
#endif
#define NdisMCmOidRequest sdv_NdisMCmOidRequest
NDIS_STATUS
sdv_NdisMCmOidRequest(
    IN  NDIS_HANDLE             NdisAfHandle,
    IN  NDIS_HANDLE             NdisVcHandle    OPTIONAL,
    IN  NDIS_HANDLE             NdisPartyHandle OPTIONAL,
    IN OUT PNDIS_OID_REQUEST    NdisRequest
    );

#ifdef NdisMCmOidRequestComplete
#undef NdisMCmOidRequestComplete
#endif
#define NdisMCmOidRequestComplete sdv_NdisMCmOidRequestComplete
VOID
sdv_NdisMCmOidRequestComplete(
    IN NDIS_HANDLE  NdisAfHandle,
    IN NDIS_HANDLE  NdisVcHandle  OPTIONAL,
    IN NDIS_HANDLE  NdisPartyHandle  OPTIONAL,
    IN PNDIS_OID_REQUEST  OidRequest,
    IN NDIS_STATUS  Status
    );

#ifdef NdisMCmOpenAddressFamilyComplete
#undef NdisMCmOpenAddressFamilyComplete
#endif
#define NdisMCmOpenAddressFamilyComplete sdv_NdisMCmOpenAddressFamilyComplete
VOID
sdv_NdisMCmOpenAddressFamilyComplete(
    IN NDIS_STATUS  Status,
    IN NDIS_HANDLE  NdisAfHandle,
    IN NDIS_HANDLE  CallMgrAfContext
    );

#ifdef NdisMCmRegisterAddressFamilyEx
#undef NdisMCmRegisterAddressFamilyEx
#endif
#define NdisMCmRegisterAddressFamilyEx sdv_NdisMCmRegisterAddressFamilyEx
NDIS_STATUS
sdv_NdisMCmRegisterAddressFamilyEx(
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  PCO_ADDRESS_FAMILY      AddressFamily
    );

#ifdef NdisMCmRegisterSapComplete
#undef NdisMCmRegisterSapComplete
#endif
#define NdisMCmRegisterSapComplete sdv_NdisMCmRegisterSapComplete
VOID
sdv_NdisMCmRegisterSapComplete(
    IN NDIS_STATUS  Status,
    IN NDIS_HANDLE  NdisSapHandle,
    IN NDIS_HANDLE  CallMgrSapContext
    );

#ifdef NdisMCoActivateVcComplete
#undef NdisMCoActivateVcComplete
#endif
#define NdisMCoActivateVcComplete sdv_NdisMCoActivateVcComplete
VOID
sdv_NdisMCoActivateVcComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisVcHandle,
    IN  PCO_CALL_PARAMETERS     CallParameters
    );

#ifdef NdisMCoDeactivateVcComplete
#undef NdisMCoDeactivateVcComplete
#endif
#define NdisMCoDeactivateVcComplete sdv_NdisMCoDeactivateVcComplete
VOID
sdv_NdisMCoDeactivateVcComplete(
    IN  NDIS_STATUS             Status,
    IN  NDIS_HANDLE             NdisVcHandle
    );

#ifdef NdisMCoIndicateReceiveNetBufferLists
#undef NdisMCoIndicateReceiveNetBufferLists
#endif
#define NdisMCoIndicateReceiveNetBufferLists sdv_NdisMCoIndicateReceiveNetBufferLists
VOID
sdv_NdisMCoIndicateReceiveNetBufferLists(
    IN NDIS_HANDLE          NdisVcHandle,
    IN PNET_BUFFER_LIST     NetBufferLists,
    IN ULONG                NumberOfNetBufferLists,
    IN ULONG                CoReceiveFlags
    );

#ifdef NdisMCoIndicateStatusEx
#undef NdisMCoIndicateStatusEx
#endif
#define NdisMCoIndicateStatusEx sdv_NdisMCoIndicateStatusEx
VOID
sdv_NdisMCoIndicateStatusEx(
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  NDIS_HANDLE             NdisVcHandle    OPTIONAL,
    IN  PNDIS_STATUS_INDICATION StatusIndication
    );

#ifdef NdisMCompleteDmaTransfer
#undef NdisMCompleteDmaTransfer
#endif
#define NdisMCompleteDmaTransfer sdv_NdisMCompleteDmaTransfer
VOID
sdv_NdisMCompleteDmaTransfer(
    OUT PNDIS_STATUS  Status,
    IN NDIS_HANDLE  MiniportDmaHandle,
    IN PNDIS_BUFFER  Buffer,
    IN ULONG  Offset,
    IN ULONG  Length,
    IN BOOLEAN  WriteToDevice
    );




#ifdef NdisMCoOidRequestComplete
#undef NdisMCoOidRequestComplete
#endif
#define NdisMCoOidRequestComplete sdv_NdisMCoOidRequestComplete
VOID
sdv_NdisMCoOidRequestComplete(
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  NDIS_HANDLE             NdisMiniportVcHandle,
    IN  PNDIS_OID_REQUEST       Request,
    IN  NDIS_STATUS             Status
    );

#ifdef NdisMCoSendNetBufferListsComplete
#undef NdisMCoSendNetBufferListsComplete
#endif
#define NdisMCoSendNetBufferListsComplete sdv_NdisMCoSendNetBufferListsComplete
VOID
sdv_NdisMCoSendNetBufferListsComplete(
    IN NDIS_HANDLE          NdisVcHandle,
    IN PNET_BUFFER_LIST     NetBufferLists,
    IN ULONG                SendCompleteFlags
    );

#ifdef NdisMCreateLog
#undef NdisMCreateLog
#endif
#define NdisMCreateLog sdv_NdisMCreateLog
NDIS_STATUS
sdv_NdisMCreateLog(
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  UINT                    Size,
    OUT PNDIS_HANDLE            LogHandle
    );

#ifdef NdisMDeregisterDmaChannel
#undef NdisMDeregisterDmaChannel
#endif
#define NdisMDeregisterDmaChannel sdv_NdisMDeregisterDmaChannel
VOID
sdv_NdisMDeregisterDmaChannel(
    IN  NDIS_HANDLE             MiniportDmaHandle
    );

#ifdef NdisMDeregisterIoPortRange
#undef NdisMDeregisterIoPortRange
#endif
#define NdisMDeregisterIoPortRange sdv_NdisMDeregisterIoPortRange
VOID
sdv_NdisMDeregisterIoPortRange(
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  UINT                    InitialPort,
    IN  UINT                    NumberOfPorts,
    IN  PVOID                   PortOffset
    );

#ifdef NdisMFlushLog
#undef NdisMFlushLog
#endif
#define NdisMFlushLog sdv_NdisMFlushLog
VOID
sdv_NdisMFlushLog(
    IN  NDIS_HANDLE             LogHandle
    );

#ifdef NdisMFreePort
#undef NdisMFreePort
#endif
#define NdisMFreePort sdv_NdisMFreePort
NDIS_STATUS
sdv_NdisMFreePort(
    IN  NDIS_HANDLE                     NdisMiniportHandle,
    IN  NDIS_PORT_NUMBER                PortNumber
    );

#ifdef NdisMFreeSharedMemory
#undef NdisMFreeSharedMemory
#endif
#define NdisMFreeSharedMemory sdv_NdisMFreeSharedMemory
VOID
sdv_NdisMFreeSharedMemory(
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  ULONG                   Length,
    IN  BOOLEAN                 Cached,
    IN  PVOID                   VirtualAddress,
    IN  NDIS_PHYSICAL_ADDRESS   PhysicalAddress
    );

#ifdef NdisMGetDeviceProperty
#undef NdisMGetDeviceProperty
#endif
#define NdisMGetDeviceProperty sdv_NdisMGetDeviceProperty
VOID
sdv_NdisMGetDeviceProperty(
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN OUT PDEVICE_OBJECT *     PhysicalDeviceObject        OPTIONAL,
    IN OUT PDEVICE_OBJECT *     FunctionalDeviceObject      OPTIONAL,
    IN OUT PDEVICE_OBJECT *     NextDeviceObject            OPTIONAL,
    IN OUT PCM_RESOURCE_LIST *  AllocatedResources          OPTIONAL,
    IN OUT PCM_RESOURCE_LIST *  AllocatedResourcesTranslated OPTIONAL
    );

#ifdef NdisMGetDmaAlignment
#undef NdisMGetDmaAlignment
#endif
#define NdisMGetDmaAlignment sdv_NdisMGetDmaAlignment
ULONG
sdv_NdisMGetDmaAlignment(
    IN  NDIS_HANDLE MiniportAdapterHandle
    );

#ifdef NdisMMapIoSpace
#undef NdisMMapIoSpace
#endif
#define NdisMMapIoSpace sdv_NdisMMapIoSpace
NDIS_STATUS
sdv_NdisMMapIoSpace(
    OUT PVOID *                 VirtualAddress,
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  NDIS_PHYSICAL_ADDRESS   PhysicalAddress,
    IN  UINT                    Length
    );

#ifdef NdisMQueryAdapterInstanceName
#undef NdisMQueryAdapterInstanceName
#endif
#define NdisMQueryAdapterInstanceName sdv_NdisMQueryAdapterInstanceName
NDIS_STATUS
sdv_NdisMQueryAdapterInstanceName(
    OUT PNDIS_STRING            pAdapterInstanceName,
    IN  NDIS_HANDLE             MiniportHandle
    );

#ifdef NdisMReadDmaCounter
#undef NdisMReadDmaCounter
#endif
#define NdisMReadDmaCounter sdv_NdisMReadDmaCounter
ULONG
sdv_NdisMReadDmaCounter(
    IN  NDIS_HANDLE             MiniportDmaHandle
    );

#ifdef NdisMRegisterDmaChannel
#undef NdisMRegisterDmaChannel
#endif
#define NdisMRegisterDmaChannel sdv_NdisMRegisterDmaChannel
NDIS_STATUS
sdv_NdisMRegisterDmaChannel(
    OUT PNDIS_HANDLE            MiniportDmaHandle,
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  UINT                    DmaChannel,
    IN  BOOLEAN                 Dma32BitAddresses,
    IN  PNDIS_DMA_DESCRIPTION   DmaDescription,
    IN  ULONG                   MaximumLength
    );

#ifdef NdisMRemoveMiniport
#undef NdisMRemoveMiniport
#endif
#define NdisMRemoveMiniport sdv_NdisMRemoveMiniport
NDIS_STATUS
sdv_NdisMRemoveMiniport(
    IN  NDIS_HANDLE             MiniportHandle
    );

#ifdef NdisMResetComplete
#undef NdisMResetComplete
#endif
#define NdisMResetComplete sdv_NdisMResetComplete
VOID
sdv_NdisMResetComplete(
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  NDIS_STATUS             Status,
    IN  BOOLEAN                 AddressingReset
    );

#ifdef NdisMSetupDmaTransfer
#undef NdisMSetupDmaTransfer
#endif
#define NdisMSetupDmaTransfer sdv_NdisMSetupDmaTransfer
VOID
sdv_NdisMSetupDmaTransfer(
    OUT PNDIS_STATUS  Status,
    IN NDIS_HANDLE  MiniportDmaHandle,
    IN PNDIS_BUFFER  Buffer,
    IN ULONG  Offset,
    IN ULONG  Length,
    IN BOOLEAN  WriteToDevice
    );

#ifdef NdisMSleep
#undef NdisMSleep
#endif
#define NdisMSleep sdv_NdisMSleep
VOID
sdv_NdisMSleep(
    IN  ULONG                   MicrosecondsToSleep
    );

#ifdef NdisMUnmapIoSpace
#undef NdisMUnmapIoSpace
#endif
#define NdisMUnmapIoSpace sdv_NdisMUnmapIoSpace
VOID
sdv_NdisMUnmapIoSpace(
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  PVOID                   VirtualAddress,
    IN  UINT                    Length
    );

/*#ifdef NdisMUpdateSharedMemory
#undef NdisMUpdateSharedMemory
#endif
#define NdisMUpdateSharedMemory sdv_NdisMUpdateSharedMemory
VOID
sdv_NdisMUpdateSharedMemory(
    IN  NDIS_HANDLE             MiniportAdapterHandle,
    IN  ULONG                   Length,
    IN  PVOID                   VirtualAddress,
    IN  NDIS_PHYSICAL_ADDRESS   PhysicalAddress
    );*/

#ifdef NdisMWriteLogData
#undef NdisMWriteLogData
#endif
#define NdisMWriteLogData sdv_NdisMWriteLogData
NDIS_STATUS
sdv_NdisMWriteLogData(
    IN  NDIS_HANDLE             LogHandle,
    IN  PVOID                   LogBuffer,
    IN  UINT                    LogBufferSize
    );

#ifdef NdisOpenConfigurationKeyByIndex
#undef NdisOpenConfigurationKeyByIndex
#endif
#define NdisOpenConfigurationKeyByIndex sdv_NdisOpenConfigurationKeyByIndex
VOID
sdv_NdisOpenConfigurationKeyByIndex(
    OUT PNDIS_STATUS            Status,
    IN  NDIS_HANDLE             ConfigurationHandle,
    IN  ULONG                   Index,
    OUT PNDIS_STRING            KeyName,
    OUT PNDIS_HANDLE            KeyHandle
    );

#ifdef NdisOpenConfigurationKeyByName
#undef NdisOpenConfigurationKeyByName
#endif
#define NdisOpenConfigurationKeyByName sdv_NdisOpenConfigurationKeyByName
VOID
sdv_NdisOpenConfigurationKeyByName(
    OUT PNDIS_STATUS            Status,
    IN  NDIS_HANDLE             ConfigurationHandle,
    IN  PNDIS_STRING            SubKeyName,
    OUT PNDIS_HANDLE            SubKeyHandle
    );

#ifdef NdisOpenFile
#undef NdisOpenFile
#endif
#define NdisOpenFile sdv_NdisOpenFile
VOID
sdv_NdisOpenFile(
    OUT PNDIS_STATUS            Status,
    OUT PNDIS_HANDLE            FileHandle,
    OUT PUINT                   FileLength,
    IN  PNDIS_STRING            FileName,
    IN  NDIS_PHYSICAL_ADDRESS   HighestAcceptableAddress
    );

#ifdef NdisQueryAdapterInstanceName
#undef NdisQueryAdapterInstanceName
#endif
#define NdisQueryAdapterInstanceName sdv_NdisQueryAdapterInstanceName
NDIS_STATUS
sdv_NdisQueryAdapterInstanceName(
    OUT PNDIS_STRING    pAdapterInstanceName,
    IN  NDIS_HANDLE     NdisBindingHandle
    );

#ifdef NdisQueryDepthSList
#undef NdisQueryDepthSList
#endif
#define NdisQueryDepthSList sdv_NdisQueryDepthSList
USHORT
sdv_NdisQueryDepthSList(
    IN PSLIST_HEADER  SListHead
    );


#ifdef NdisReadConfiguration
#undef NdisReadConfiguration
#endif
#define NdisReadConfiguration sdv_NdisReadConfiguration
VOID
sdv_NdisReadConfiguration(
    OUT PNDIS_STATUS            Status,
    OUT PNDIS_CONFIGURATION_PARAMETER *ParameterValue,
    IN  NDIS_HANDLE             ConfigurationHandle,
    IN  PNDIS_STRING            Keyword,
    IN  NDIS_PARAMETER_TYPE     ParameterType
    );

#ifdef NdisReadNetworkAddress
#undef NdisReadNetworkAddress
#endif
#define NdisReadNetworkAddress sdv_NdisReadNetworkAddress
VOID
sdv_NdisReadNetworkAddress(
    OUT PNDIS_STATUS            Status,
    OUT PVOID *                 NetworkAddress,
    OUT PUINT                   NetworkAddressLength,
    IN  NDIS_HANDLE             ConfigurationHandle
    );

#ifdef NdisReEnumerateProtocolBindings
#undef NdisReEnumerateProtocolBindings
#endif
#define NdisReEnumerateProtocolBindings sdv_NdisReEnumerateProtocolBindings
VOID
sdv_NdisReEnumerateProtocolBindings(
    IN  NDIS_HANDLE             NdisProtocolHandle
    );

#ifdef NdisReleaseReadWriteLock
#undef NdisReleaseReadWriteLock
#endif
#define NdisReleaseReadWriteLock sdv_NdisReleaseReadWriteLock
VOID
sdv_NdisReleaseReadWriteLock(
    IN  PNDIS_RW_LOCK           Lock,
    IN  PLOCK_STATE             LockState
    );

#ifdef NdisResetEvent
#undef NdisResetEvent
#endif
#define NdisResetEvent sdv_NdisResetEvent
VOID
sdv_NdisResetEvent(
    IN  PNDIS_EVENT             Event
);

#ifdef NdisSetEvent
#undef NdisSetEvent
#endif
#define NdisSetEvent sdv_NdisSetEvent
VOID
sdv_NdisSetEvent(
    IN  PNDIS_EVENT             Event
);

#ifdef NdisSystemProcessorCount
#undef NdisSystemProcessorCount
#endif
#define NdisSystemProcessorCount sdv_NdisSystemProcessorCount
CCHAR
sdv_NdisSystemProcessorCount(
    VOID
    );

#ifdef NdisUnicodeStringToAnsiString
#undef NdisUnicodeStringToAnsiString
#endif
#define NdisUnicodeStringToAnsiString sdv_NdisUnicodeStringToAnsiString
NDIS_STATUS
sdv_NdisUnicodeStringToAnsiString(
    IN OUT PANSI_STRING  DestinationString,
    IN PUNICODE_STRING  SourceString
    );

#ifdef NdisUnmapFile
#undef NdisUnmapFile
#endif
#define NdisUnmapFile sdv_NdisUnmapFile
VOID
sdv_NdisUnmapFile(
    IN  NDIS_HANDLE             FileHandle
    );

#ifdef NdisUpcaseUnicodeString
#undef NdisUpcaseUnicodeString
#endif
#define NdisUpcaseUnicodeString sdv_NdisUpcaseUnicodeString
NTSTATUS
sdv_NdisUpcaseUnicodeString(
    OUT PUNICODE_STRING  DestinationString,  
    IN PUNICODE_STRING  SourceString
    );

#ifdef NdisWriteConfiguration
#undef NdisWriteConfiguration
#endif
#define NdisWriteConfiguration sdv_NdisWriteConfiguration
VOID
sdv_NdisWriteConfiguration(
    OUT PNDIS_STATUS            Status,
    IN  NDIS_HANDLE             ConfigurationHandle,
    IN  PNDIS_STRING            Keyword,
    IN  PNDIS_CONFIGURATION_PARAMETER ParameterValue
    );

#ifdef NdisWriteErrorLogEntry
#undef NdisWriteErrorLogEntry
#endif
#define NdisWriteErrorLogEntry sdv_NdisWriteErrorLogEntry
VOID __cdecl
sdv_NdisWriteErrorLogEntry(
    IN  NDIS_HANDLE             NdisAdapterHandle,
    IN  NDIS_ERROR_CODE         ErrorCode,
    IN  ULONG                   NumberOfErrorValues,
    ...
    );

#ifdef NdisWriteEventLogEntry
#undef NdisWriteEventLogEntry
#endif
#define NdisWriteEventLogEntry sdv_NdisWriteEventLogEntry
NDIS_STATUS
sdv_NdisWriteEventLogEntry(
    IN  PVOID                   LogHandle,
    IN  NDIS_STATUS             EventCode,
    IN  ULONG                   UniqueEventValue,
    IN  USHORT                  NumStrings,
    IN  PVOID                   StringsList    OPTIONAL,
    IN  ULONG                   DataSize,
    IN  PVOID                   Data           OPTIONAL
    );

#ifdef NdisReadPortBufferUchar
#undef NdisReadPortBufferUchar
#endif
#define NdisReadPortBufferUchar sdv_NdisReadPortBufferUchar
VOID
  sdv_NdisReadPortBufferUchar(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    OUT PUCHAR  Buffer,
    IN ULONG  Length
    );

#ifdef NdisWritePortBufferUchar
#undef NdisWritePortBufferUchar
#endif
#define NdisWritePortBufferUchar sdv_NdisWritePortBufferUchar
VOID
  sdv_NdisWritePortBufferUchar(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    IN PUCHAR  Buffer,
    IN ULONG  Length
    );

#ifdef NdisReadPortBufferUlong
#undef NdisReadPortBufferUlong
#endif
#define NdisReadPortBufferUlong sdv_NdisReadPortBufferUlong
VOID
  sdv_NdisReadPortBufferUlong(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    OUT PULONG  Buffer,
    IN ULONG  Length
    );

#ifdef NdisWritePortBufferUlong
#undef NdisWritePortBufferUlong
#endif
#define NdisWritePortBufferUlong sdv_NdisWritePortBufferUlong
VOID
  sdv_NdisWritePortBufferUlong(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    IN PULONG  Buffer,
    IN ULONG  Length
    );

#ifdef NdisReadPortBufferUshort
#undef NdisReadPortBufferUshort
#endif
#define NdisReadPortBufferUshort sdv_NdisReadPortBufferUshort
VOID
  sdv_NdisReadPortBufferUshort(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    OUT PUSHORT  Buffer,
    IN ULONG  Length
    );

#ifdef NdisWritePortBufferUshort
#undef NdisWritePortBufferUshort
#endif
#define NdisWritePortBufferUshort sdv_NdisWritePortBufferUshort
VOID
  sdv_NdisWritePortBufferUshort(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    IN PUSHORT  Buffer,
    IN ULONG  Length
    );
    
#ifdef NdisReadPortUchar
#undef NdisReadPortUchar
#endif
#define NdisReadPortUchar sdv_NdisReadPortUchar
VOID
  sdv_NdisReadPortUchar(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    OUT PUCHAR  Data
    );
    
#ifdef NdisWritePortUchar
#undef NdisWritePortUchar
#endif
#define NdisWritePortUchar sdv_NdisWritePortUchar
VOID
  sdv_NdisWritePortUchar(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    IN UCHAR  Data
    );

#ifdef NdisReadPortUlong
#undef NdisReadPortUlong
#endif
#define NdisReadPortUlong sdv_NdisReadPortUlong
VOID
  sdv_NdisReadPortUlong(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    OUT PULONG  Data
    );
    
#ifdef NdisWritePortUlong
#undef NdisWritePortUlong
#endif
#define NdisWritePortUlong sdv_NdisWritePortUlong
VOID
  NdisWritePortUlong(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    IN ULONG  Data
    );

#ifdef NdisReadPortUshort
#undef NdisReadPortUshort
#endif
#define NdisReadPortUshort sdv_NdisReadPortUshort
VOID
  sdv_NdisReadPortUshort(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    OUT PUSHORT  Data
    );
    

#ifdef NdisWritePortUshort
#undef NdisWritePortUshort
#endif
#define NdisWritePortUshort sdv_NdisWritePortUshort
VOID
  sdv_NdisWritePortUshort(
    IN NDIS_HANDLE  NdisAdapterHandle,
    IN ULONG  Port,
    IN USHORT  Data
    );




#ifdef NDIS_CURRENT_IRQL
#undef NDIS_CURRENT_IRQL
#endif
#define NDIS_CURRENT_IRQL sdv_NDIS_CURRENT_IRQL
KIRQL
sdv_NDIS_CURRENT_IRQL(
    VOID
    );

#ifdef NdisMSynchronizeWithInterruptEx
#undef NdisMSynchronizeWithInterruptEx
#endif
#define NdisMSynchronizeWithInterruptEx sdv_NdisMSynchronizeWithInterruptEx
BOOLEAN  
sdv_NdisMSynchronizeWithInterruptEx(    
    NDIS_HANDLE  NdisInterruptHandle,    
    ULONG  MessageId,    
    PVOID  SynchronizeFunction,    
    PVOID  SynchronizeContext    
    ); 

#ifdef NdisInterlockedAddLargeStatistic
#undef NdisInterlockedAddLargeStatistic
#endif
#define NdisInterlockedAddLargeStatistic sdv_NdisInterlockedAddLargeStatistic

VOID sdv_NdisInterlockedAddLargeStatistic(
  __in  PLARGE_INTEGER Addend,
  __in  ULONG Increment
);

#ifdef NdisInterlockedIncrement
#undef NdisInterlockedIncrement
#endif
#define NdisInterlockedIncrement sdv_NdisInterlockedIncrement

LONG
sdv_NdisInterlockedIncrement(
    IN PLONG  Addend
    );
    
#ifdef NdisInterlockedPopEntryList
#undef NdisInterlockedPopEntryList
#endif
#define NdisInterlockedPopEntryList sdv_NdisInterlockedPopEntryList

PSINGLE_LIST_ENTRY
sdv_NdisInterlockedPopEntryList(
    IN PSLIST_HEADER  ListHead,
    IN PKSPIN_LOCK  Lock
    );

#ifdef NdisInterlockedFlushSList
#undef NdisInterlockedFlushSList
#endif
#define NdisInterlockedFlushSList sdv_NdisInterlockedFlushSList

PSLIST_ENTRY
sdv_NdisInterlockedFlushSList(
     __inout PSLIST_HEADER ListHead
    );

#ifdef NdisInterlockedPushEntryList
#undef NdisInterlockedPushEntryList
#endif
#define NdisInterlockedPushEntryList sdv_NdisInterlockedPushEntryList

PSINGLE_LIST_ENTRY
sdv_NdisInterlockedPushEntryList(
    IN PSLIST_HEADER  ListHead,
    IN PSINGLE_LIST_ENTRY  ListEntry,
    IN PKSPIN_LOCK  Lock
    );

#if NDIS_SUPPORT_NDIS620

#ifdef NdisAcquireRWLockRead
#undef NdisAcquireRWLockRead
#endif
#define NdisAcquireRWLockRead sdv_NdisAcquireRWLockRead

EXPORT
VOID
sdv_NdisAcquireRWLockRead(
    _In_  PNDIS_RW_LOCK_EX Lock,
    _Out_ _IRQL_saves_ PLOCK_STATE_EX   LockState,
    _In_  UCHAR            Flags
    );


#ifdef NdisAcquireRWLockWrite
#undef NdisAcquireRWLockWrite
#endif
#define NdisAcquireRWLockWrite sdv_NdisAcquireRWLockWrite

EXPORT
VOID
sdv_NdisAcquireRWLockWrite(
    _In_  PNDIS_RW_LOCK_EX Lock,
    _Out_ _IRQL_saves_ PLOCK_STATE_EX   LockState,
    _In_  UCHAR            Flags
    );


#ifdef NdisReleaseRWLock
#undef NdisReleaseRWLock
#endif
#define NdisReleaseRWLock sdv_NdisReleaseRWLock

EXPORT
VOID
sdv_NdisReleaseRWLock(
    _In_ PNDIS_RW_LOCK_EX Lock,
    _In_ _IRQL_restores_ PLOCK_STATE_EX   LockState
    );

#ifdef NdisAllocateSharedMemory
#undef NdisAllocateSharedMemory
#endif
#define NdisAllocateSharedMemory sdv_NdisAllocateSharedMemory

NDIS_STATUS 
sdv_NdisAllocateSharedMemory(
  _In_    NDIS_HANDLE                    NdisHandle,
  _In_    PNDIS_SHARED_MEMORY_PARAMETERS SharedMemoryParameters,
  _Inout_ PNDIS_HANDLE                   pAllocationHandle
);
   
#ifdef NdisFreeSharedMemory
#undef NdisFreeSharedMemory
#endif
#define NdisFreeSharedMemory sdv_NdisFreeSharedMemory

VOID 
sdv_NdisFreeSharedMemory(
  _In_ NDIS_HANDLE NdisHandle,
  _In_ NDIS_HANDLE AllocationHandle
);

#endif






#define	__sdv_save_adapter_context sdv_save_context_area

#define	__sdv_save_context_area sdv_save_context_area
void 
sdv_save_context_area(
    VOID ** c
    );
    
NDIS_STATUS
sdv_NDIS_DoNothing(
);
#endif
