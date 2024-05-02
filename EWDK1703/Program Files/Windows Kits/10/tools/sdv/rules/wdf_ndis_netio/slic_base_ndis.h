/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/


#define NDIS_OID ULONG
#define PNDIS_OID (ULONG*)

#define DOT11_BSS_TYPE ULONG
#define dot11_BSS_type_infrastructure 1
#define dot11_BSS_type_independent 2
#define dot11_BSS_type_any 3


#define XDV_TYPE_CAST(TYPE,P) (P)

#define NdisDevicePnPEventSurpriseRemoved 3


#define XDV_NDIS_DATA_SEND(QUEUE,TIME,DATA,PORT) QUEUE = NULL
#define XDV_NDIS_DATA_RECEIVE(QUEUE,TIME,DATA,PORT) QUEUE = NULL
#define XDV_NDIS_DATA_COMPLETE(QUEUE,DATA) QUEUE = NULL
#define XDV_NDIS_DATA_QUERY_PENDING(QUEUE,TIME,PORT,BUFFER) QUEUE = NULL
#define XDV_NDIS_DATA_CLEAN

#define XDV_GET_NDIS_OID(Request) (Request->DATA)
#define XDV_DOT11_DESIRED_BSS_TYPE(OID) 0
#define XDV_CURRENT_TIME 0

#define NdisRequestQueryInformation 0
#define NdisRequestSetInformation 1

#define NDIS_STATUS_PENDING STATUS_PENDING
#define NDIS_STATUS_SUCCESS STATUS_SUCCESS
#define NDIS_STATUS_RESOURCES STATUS_INSUFFICIENT_RESOURCES
#define NDIS_STATUS_NOT_ACCEPTED 65539
#define NDIS_STATUS_REQUEST_ABORTED 3221291020
#define NDIS_STATUS_DOT11_CONNECTION_START 1073938436
#define NDIS_STATUS_DOT11_CONNECTION_COMPLETION 1073938437
#define NDIS_STATUS_DOT11_ROAMING_START 1073938438
#define NDIS_STATUS_DOT11_ROAMING_COMPLETION 1073938439
#define NDIS_STATUS_DOT11_ASSOCIATION_START 1073938434
#define NDIS_STATUS_DOT11_ASSOCIATION_COMPLETION 1073938435
#define NDIS_STATUS_DOT11_ASSOCIATION_COMPLETION_EX 1073938474
#define NDIS_STATUS_DOT11_SCAN_CONFIRM 1073938432
#define NDIS_STATUS_DOT11_LINK_QUALITY 1073938444
#define NDIS_STATUS_DOT11_DISASSOCIATION 1073938440


#define OID_PNP_SET_POWER 4244701441
#define OID_RECEIVE_FILTER_CLEAR_FILTER 66088
#define OID_TCP_TASK_IPSEC_OFFLOAD_V2_DELETE_SA 4228055555
#define OID_RECEIVE_FILTER_FREE_QUEUE 66084
#define OID_NIC_SWITCH_FREE_VF 66118
#define OID_NIC_SWITCH_DELETE_SWITCH 66105
#define OID_SWITCH_PORT_DELETE 66169
#define OID_802_3_DELETE_MULTICAST_ADDRESS 16843273
#define OID_PM_REMOVE_WOL_PATTERN 4244701451
#define OID_PM_REMOVE_PROTOCOL_OFFLOAD 4244701455
#define OID_TUNNEL_INTERFACE_RELEASE_OID 251724039
#define OID_DOT11_RESET_REQUEST 218170128
#define OID_DOT11_DESIRED_BSS_TYPE 234946943


#define OID_DOT11_CONNECT_REQUEST 234946945
#define OID_DOT11_DISCONNECT_REQUEST 234946958
#define OID_DOT11_SCAN_REQUEST 218170123

#define DOT11_ASSOC_STATUS_SUCCESS 0 


#define SDV_NDIS_CALLBACKS \
 fun_DriverEntry,\
 SDV_NDIS_Miniport_Basic,\
 SDV_NDIS_Device_functions,\
 SDV_NDIS_WORK_ITEMS,\
 SDV_NDIS_ISRS,\
 SDV_NDIS_DPC_ISRS,\
 SDV_NDIS_ENABLE_INTERRUPT,\
 SDV_NDIS_DISABLE_INTERRUPT,\
 SDV_NDIS_SYNCHRONIZE_INTERRUPT,\
 SDV_NDIS_MESSAGE_ISRS,\
 SDV_NDIS_MESSAGE_DPCS_ISRS,\
 SDV_NDIS_ENABLE_MESSAGE_INTERRUPT,\
 SDV_NDIS_DISABLE_MESSAGE_INTERRUPT,\
 SDV_NDIS_SYNCHRONIZE_MESSAGE_INTERRUPT,\
 SDV_NDIS_TIMER_FUNCTIONS,\
 SDV_NDIS_OID_REQUEST_FUNCTIONS,\
 SDV_NDIS_CO_MINIPORT_FUNCTIONS,\
 SDV_NDIS_LWF_FUNCTIONS,\
 SDV_NDIS_INTERFACE_FUNCTIONS,\
 SDV_NDIS_PROTOCOL_FUNCTIONS_COMPLETE

#define SDV_NDIS_Miniport_Basic \
 fun_MINIPORT_RESET,\
 fun_MINIPORT_PAUSE,\
 fun_MINIPORT_RESTART,\
 fun_MINIPORT_INITIALIZE,\
 fun_MINIPORT_HALT,\
 fun_MINIPORT_OID_REQUEST,\
 fun_MINIPORT_SHUTDOWN,\
 fun_MINIPORT_DEVICE_PNP_EVENT_NOTIFY,\
 fun_MINIPORT_CANCEL_SEND,\
 fun_MINIPORT_CHECK_FOR_HANG,\
 SDV_NDIS_MINIPORT_CANCEL_OID_REQUEST,\
 fun_MINIPORT_SEND_NET_BUFFER_LISTS,\
 fun_MINIPORT_RETURN_NET_BUFFER_LISTS,\
 fun_MINIPORT_UNLOAD,\
 fun_MINIPORT_SET_OPTIONS,\
 fun_MINIPORT_PROCESS_SG_LIST,\
 fun_MINIPORT_ALLOCATE_SHARED_MEM_COMPLETE

#define SDV_NDIS_Device_functions \
 fun_MINIPORT_ADD_DEVICE,\
 fun_MINIPORT_START_DEVICE,\
 fun_MINIPORT_REMOVE_DEVICE,\
 fun_MINIPORT_FILTER_RESOURCE_REQUIREMENTS

#define SDV_NDIS_MINIPORT_CANCEL_OID_REQUEST \
 fun_MINIPORT_CANCEL_OID_REQUEST_1,\
 fun_MINIPORT_CANCEL_OID_REQUEST_2,\
 fun_MINIPORT_CANCEL_OID_REQUEST_3,\
 fun_MINIPORT_CANCEL_OID_REQUEST_4,\
 fun_MINIPORT_CANCEL_OID_REQUEST_5,\
 fun_MINIPORT_CANCEL_OID_REQUEST_6
 
#define SDV_NDIS_WORK_ITEMS \
 fun_NDIS_IO_WORKITEM_FUNCTION_1,\
 fun_NDIS_IO_WORKITEM_FUNCTION_2,\
 fun_NDIS_IO_WORKITEM_FUNCTION_3,\
 fun_NDIS_IO_WORKITEM_FUNCTION_4,\
 fun_NDIS_IO_WORKITEM_FUNCTION_5,\
 fun_NDIS_IO_WORKITEM_FUNCTION_6

#define SDV_NDIS_ISRS \
 fun_MINIPORT_ISR_1,\
 fun_MINIPORT_ISR_2,\
 fun_MINIPORT_ISR_3,\
 fun_MINIPORT_ISR_4,\
 fun_MINIPORT_ISR_5,\
 fun_MINIPORT_ISR_6
 
#define SDV_NDIS_DPC_ISRS \
 fun_MINIPORT_INTERRUPT_DPC_1,\
 fun_MINIPORT_INTERRUPT_DPC_2,\
 fun_MINIPORT_INTERRUPT_DPC_3,\
 fun_MINIPORT_INTERRUPT_DPC_4,\
 fun_MINIPORT_INTERRUPT_DPC_5,\
 fun_MINIPORT_INTERRUPT_DPC_6
 
#define SDV_NDIS_ENABLE_INTERRUPT \
 fun_MINIPORT_ENABLE_INTERRUPT_1,\
 fun_MINIPORT_ENABLE_INTERRUPT_2,\
 fun_MINIPORT_ENABLE_INTERRUPT_3,\
 fun_MINIPORT_ENABLE_INTERRUPT_4,\
 fun_MINIPORT_ENABLE_INTERRUPT_5,\
 fun_MINIPORT_ENABLE_INTERRUPT_6
 
#define SDV_NDIS_DISABLE_INTERRUPT \
 fun_MINIPORT_DISABLE_INTERRUPT_1,\
 fun_MINIPORT_DISABLE_INTERRUPT_2,\
 fun_MINIPORT_DISABLE_INTERRUPT_3,\
 fun_MINIPORT_DISABLE_INTERRUPT_4,\
 fun_MINIPORT_DISABLE_INTERRUPT_5,\
 fun_MINIPORT_DISABLE_INTERRUPT_6
 
#define SDV_NDIS_SYNCHRONIZE_INTERRUPT \
 fun_MINIPORT_SYNCHRONIZE_INTERRUPT_1,\
 fun_MINIPORT_SYNCHRONIZE_INTERRUPT_2,\
 fun_MINIPORT_SYNCHRONIZE_INTERRUPT_3,\
 fun_MINIPORT_SYNCHRONIZE_INTERRUPT_4,\
 fun_MINIPORT_SYNCHRONIZE_INTERRUPT_5,\
 fun_MINIPORT_SYNCHRONIZE_INTERRUPT_6
 
#define SDV_NDIS_MESSAGE_ISRS \
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_1,\
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_2,\
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_3,\
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_4,\
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_5,\
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_6
 
#define SDV_NDIS_MESSAGE_DPCS_ISRS \
 fun_MINIPORT_MESSAGE_INTERRUPT_DPC_1,\
 fun_MINIPORT_MESSAGE_INTERRUPT_DPC_2,\
 fun_MINIPORT_MESSAGE_INTERRUPT_DPC_3,\
 fun_MINIPORT_MESSAGE_INTERRUPT_DPC_4,\
 fun_MINIPORT_MESSAGE_INTERRUPT_DPC_5,\
 fun_MINIPORT_MESSAGE_INTERRUPT_DPC_6
 

#define SDV_NDIS_ENABLE_MESSAGE_INTERRUPT \
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_1,\
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_2,\
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_3,\
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_4,\
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_5,\
 fun_MINIPORT_ENABLE_MESSAGE_INTERRUPT_6

#define SDV_NDIS_DISABLE_MESSAGE_INTERRUPT \
 fun_MINIPORT_DISABLE_MESSAGE_INTERRUPT_1,\
 fun_MINIPORT_DISABLE_MESSAGE_INTERRUPT_2,\
 fun_MINIPORT_DISABLE_MESSAGE_INTERRUPT_3,\
 fun_MINIPORT_DISABLE_MESSAGE_INTERRUPT_4,\
 fun_MINIPORT_DISABLE_MESSAGE_INTERRUPT_5,\
 fun_MINIPORT_DISABLE_MESSAGE_INTERRUPT_6



#define SDV_NDIS_SYNCHRONIZE_MESSAGE_INTERRUPT \
 fun_MINIPORT_SYNCHRONIZE_MESSAGE_INTERRUPT_1,\
 fun_MINIPORT_SYNCHRONIZE_MESSAGE_INTERRUPT_2,\
 fun_MINIPORT_SYNCHRONIZE_MESSAGE_INTERRUPT_3,\
 fun_MINIPORT_SYNCHRONIZE_MESSAGE_INTERRUPT_4,\
 fun_MINIPORT_SYNCHRONIZE_MESSAGE_INTERRUPT_5,\
 fun_MINIPORT_SYNCHRONIZE_MESSAGE_INTERRUPT_6



#define SDV_NDIS_TIMER_FUNCTIONS \
 fun_NDIS_TIMER_FUNCTION_1,\
 fun_NDIS_TIMER_FUNCTION_2,\
 fun_NDIS_TIMER_FUNCTION_3,\
 fun_NDIS_TIMER_FUNCTION_4,\
 fun_NDIS_TIMER_FUNCTION_5,\
 fun_NDIS_TIMER_FUNCTION_6,\
 fun_NDIS_TIMER_FUNCTION_7,\
 fun_NDIS_TIMER_FUNCTION_8,\
 fun_NDIS_TIMER_FUNCTION_9,\
 fun_NDIS_TIMER_FUNCTION_10,\
 fun_NDIS_TIMER_FUNCTION_11,\
 fun_NDIS_TIMER_FUNCTION_12,\
 fun_NDIS_TIMER_FUNCTION_13,\
 fun_NDIS_TIMER_FUNCTION_14,\
 fun_NDIS_TIMER_FUNCTION_15,\
 fun_NDIS_TIMER_FUNCTION_16,\
 fun_NDIS_TIMER_FUNCTION_17,\
 fun_NDIS_TIMER_FUNCTION_18,\
 fun_NDIS_TIMER_FUNCTION_19,\
 fun_NDIS_TIMER_FUNCTION_20,\
 fun_NDIS_TIMER_FUNCTION_21,\
 fun_NDIS_TIMER_FUNCTION_22,\
 fun_NDIS_TIMER_FUNCTION_23,\
 fun_NDIS_TIMER_FUNCTION_24

#define SDV_NDIS_OID_REQUEST_FUNCTIONS \
 fun_MINIPORT_DIRECT_OID_REQUEST,\
 fun_MINIPORT_CANCEL_DIRECT_OID_REQUEST

#define SDV_NDIS_CO_MINIPORT_FUNCTIONS \
 fun_MINIPORT_CO_ACTIVATE_VC,\
 fun_MINIPORT_CO_CREATE_VC,\
 fun_MINIPORT_CO_DEACTIVATE_VC,\
 fun_MINIPORT_CO_DELETE_VC,\
 fun_MINIPORT_CO_OID_REQUEST,\
 fun_MINIPORT_CO_SEND_NET_BUFFER_LISTS

#define SDV_NDIS_LWF_FUNCTIONS \
 fun_FILTER_ATTACH,\
 fun_FILTER_CANCEL_DIRECT_OID_REQUEST,\
 fun_FILTER_CANCEL_OID_REQUEST,\
 fun_FILTER_CANCEL_SEND_NET_BUFFER_LISTS,\
 fun_FILTER_DETACH,\
 fun_FILTER_DEVICE_PNP_EVENT_NOTIFY,\
 fun_FILTER_DIRECT_OID_REQUEST,\
 fun_FILTER_DIRECT_OID_REQUEST_COMPLETE,\
 fun_FILTER_DRIVER_UNLOAD,\
 fun_FILTER_NET_PNP_EVENT,\
 fun_FILTER_OID_REQUEST,\
 fun_FILTER_OID_REQUEST_COMPLETE,\
 fun_FILTER_PAUSE,\
 fun_FILTER_RECEIVE_NET_BUFFER_LISTS,\
 fun_FILTER_RESTART,\
 fun_FILTER_RETURN_NET_BUFFER_LISTS,\
 fun_FILTER_SEND_NET_BUFFER_LISTS,\
 fun_FILTER_SEND_NET_BUFFER_LISTS_COMPLETE,\
 fun_FILTER_SET_MODULE_OPTIONS,\
 fun_FILTER_SET_OPTIONS,\
 fun_FILTER_STATUS

#define SDV_NDIS_PROTOCOL_FUNCTIONS_COMPLETE \
 SDV_NDIS_PROTOCOL_FUNCTIONS,\
 SDV_NDIS_PROTOCOL_CL_FUNCTIONS,\
 SDV_NDIS_PROTOCOL_CM_FUNCTIONS,\
 SDV_NDIS_PROTOCOL_CO_FUNCTIONS

#define SDV_NDIS_PROTOCOL_FUNCTIONS \
 fun_PROTOCOL_BIND_ADAPTER_EX,\
 fun_PROTOCOL_CLOSE_ADAPTER_COMPLETE_EX,\
 fun_PROTOCOL_DIRECT_OID_REQUEST_COMPLETE,\
 fun_PROTOCOL_NET_PNP_EVENT,\
 fun_PROTOCOL_OID_REQUEST_COMPLETE,\
 fun_PROTOCOL_OPEN_ADAPTER_COMPLETE_EX,\
 fun_PROTOCOL_RECEIVE_NET_BUFFER_LISTS,\
 fun_PROTOCOL_SEND_NET_BUFFER_LISTS_COMPLETE,\
 fun_PROTOCOL_SET_OPTIONS,\
 fun_PROTOCOL_STATUS_EX,\
 fun_PROTOCOL_UNBIND_ADAPTER_EX,\
 fun_PROTOCOL_UNINSTALL,\
 fun_PROTOCOL_UNLOAD
 

#define SDV_NDIS_PROTOCOL_CL_FUNCTIONS \
 fun_PROTOCOL_CL_ADD_PARTY_COMPLETE,\
 fun_PROTOCOL_CL_CALL_CONNECTED,\
 fun_PROTOCOL_CL_CLOSE_AF_COMPLETE,\
 fun_PROTOCOL_CL_CLOSE_CALL_COMPLETE,\
 fun_PROTOCOL_CL_DEREGISTER_SAP_COMPLETE,\
 fun_PROTOCOL_CL_DROP_PARTY_COMPLETE,\
 fun_PROTOCOL_CL_INCOMING_CALL,\
 fun_PROTOCOL_CL_INCOMING_CALL_QOS_CHANGE,\
 fun_PROTOCOL_CL_INCOMING_CLOSE_CALL,\
 fun_PROTOCOL_CL_INCOMING_DROP_PARTY,\
 fun_PROTOCOL_CL_MAKE_CALL_COMPLETE,\
 fun_PROTOCOL_CL_MODIFY_CALL_QOS_COMPLETE,\
 fun_PROTOCOL_CL_NOTIFY_CLOSE_AF,\
 fun_PROTOCOL_CL_OPEN_AF_COMPLETE,\
 fun_PROTOCOL_CL_OPEN_AF_COMPLETE_EX


#define SDV_NDIS_PROTOCOL_CM_FUNCTIONS \
 fun_PROTOCOL_CM_ACTIVATE_VC_COMPLETE,\
 fun_PROTOCOL_CM_ADD_PARTY,\
 fun_PROTOCOL_CM_CLOSE_AF,\
 fun_PROTOCOL_CM_CLOSE_CALL,\
 fun_PROTOCOL_CM_DEACTIVATE_VC_COMPLETE,\
 fun_PROTOCOL_CM_DEREGISTER_SAP,\
 fun_PROTOCOL_CM_DROP_PARTY,\
 fun_PROTOCOL_CM_INCOMING_CALL_COMPLETE,\
 fun_PROTOCOL_CM_MAKE_CALL,\
 fun_PROTOCOL_CM_MODIFY_QOS_CALL,\
 fun_PROTOCOL_CM_NOTIFY_CLOSE_AF_COMPLETE,\
 fun_PROTOCOL_CM_OPEN_AF,\
 fun_PROTOCOL_CM_REG_SAP

#define SDV_NDIS_INTERFACE_FUNCTIONS \
 fun_IF_QUERY_OBJECT_1,\
 fun_IF_QUERY_OBJECT_2,\
 fun_IF_QUERY_OBJECT_3,\
 fun_IF_QUERY_OBJECT_4,\
 fun_IF_QUERY_OBJECT_5,\
 fun_IF_QUERY_OBJECT_6,\
 fun_IF_SET_OBJECT_1,\
 fun_IF_SET_OBJECT_2,\
 fun_IF_SET_OBJECT_3,\
 fun_IF_SET_OBJECT_4,\
 fun_IF_SET_OBJECT_5,\
 fun_IF_SET_OBJECT_6

#define SDV_NDIS_PROTOCOL_CO_FUNCTIONS \
 fun_PROTOCOL_CO_AF_REGISTER_NOTIFY,\
 fun_PROTOCOL_CO_CREATE_VC,\
 fun_PROTOCOL_CO_DELETE_VC,\
 fun_PROTOCOL_CO_OID_REQUEST,\
 fun_PROTOCOL_CO_OID_REQUEST_COMPLETE,\
 fun_PROTOCOL_CO_RECEIVE_NET_BUFFER_LISTS,\
 fun_PROTOCOL_CO_SEND_NET_BUFFER_LISTS_COMPLETE,\
 fun_PROTOCOL_CO_STATUS_EX

#define SDV_NDIS_MINIPORT_HOT_DATA_PATH \
 SDV_NDIS_MINIPORT_SEND_DATA_PATH,\
 SDV_NDIS_MINIPORT_RECEIVE_DATA_PATH,\
 SDV_NDIS_MINIPORT_OID_HANDLERS
  
#define SDV_NDIS_LWF_HOT_DATA_PATH \
 SDV_NDIS_LWF_SEND_DATA_PATH,\
 SDV_NDIS_LWF_RECEIVE_DATA_PATH,\
 SDV_NDIS_LWF_OID_HANDLERS
 
#define SDV_NDIS_PROTOCOL_HOT_DATA_PATH \
 SDV_NDIS_PROTOCOL_SEND_DATA_PATH,\
 SDV_NDIS_PROTOCOL_RECEIVE_DATA_PATH
  
 
#define SDV_NDIS_MINIPORT_SEND_DATA_PATH \
 fun_MINIPORT_SEND_NET_BUFFER_LISTS,\
 fun_MINIPORT_CO_SEND_NET_BUFFER_LISTS
  
#define SDV_NDIS_LWF_SEND_DATA_PATH \
 fun_FILTER_SEND_NET_BUFFER_LISTS,\
 fun_FILTER_SEND_NET_BUFFER_LISTS_COMPLETE
 
#define SDV_NDIS_PROTOCOL_SEND_DATA_PATH \
 fun_PROTOCOL_SEND_NET_BUFFER_LISTS_COMPLETE,\
 fun_PROTOCOL_CO_SEND_NET_BUFFER_LISTS_COMPLETE
 

#define SDV_NDIS_MINIPORT_RECEIVE_DATA_PATH \
 fun_MINIPORT_RETURN_NET_BUFFER_LISTS
  
#define SDV_NDIS_LWF_RECEIVE_DATA_PATH \
 fun_FILTER_SEND_NET_BUFFER_LISTS,\
 fun_FILTER_RECEIVE_NET_BUFFER_LISTS,\
 fun_FILTER_RETURN_NET_BUFFER_LISTS
  
#define SDV_NDIS_PROTOCOL_RECEIVE_DATA_PATH \
 fun_PROTOCOL_RECEIVE_NET_BUFFER_LISTS,\
 fun_PROTOCOL_CO_RECEIVE_NET_BUFFER_LISTS
  


#define SDV_NDIS_MINIPORT_OID_HANDLERS \
 fun_MINIPORT_OID_REQUEST,\
 fun_MINIPORT_CO_OID_REQUEST,\
 fun_MINIPORT_DIRECT_OID_REQUEST

#define SDV_NDIS_LWF_OID_HANDLERS \
 fun_FILTER_DIRECT_OID_REQUEST,\
 fun_FILTER_DIRECT_OID_REQUEST_COMPLETE,\
 fun_FILTER_OID_REQUEST_COMPLETE,\
 fun_FILTER_OID_REQUEST



#define SDV_NDIS_MINIPORT_CANCEL_HANDLERS \
 fun_MINIPORT_CANCEL_SEND,\
 fun_MINIPORT_CANCEL_OID_REQUEST_1,\
 fun_MINIPORT_CANCEL_OID_REQUEST_2,\
 fun_MINIPORT_CANCEL_OID_REQUEST_3,\
 fun_MINIPORT_CANCEL_OID_REQUEST_4,\
 fun_MINIPORT_CANCEL_OID_REQUEST_5,\
 fun_MINIPORT_CANCEL_OID_REQUEST_6,\
 fun_MINIPORT_CANCEL_DIRECT_OID_REQUEST
 
#define SDV_NDIS_LWF_CANCEL_HANDLERS \
 fun_FILTER_CANCEL_DIRECT_OID_REQUEST,\
 fun_FILTER_CANCEL_OID_REQUEST,\
 fun_FILTER_CANCEL_SEND_NET_BUFFER_LISTS
 
#define SDV_NDIS_GENERIC_MEMORY_ALLOCATORS \
 NdisAllocateCloneNetBufferList,\
 NdisAllocateNetBufferAndNetBufferList,\
 NdisAllocateFragmentNetBufferList,\
 NdisAllocateNetBufferList,\
 NdisAllocateNetBufferListPool,\
 NdisAllocateNetBufferMdlAndData,\
 NdisAllocateNetBufferPool,\
 NdisAllocateReassembledNetBufferList,\
 NdisAllocateFromNPagedLookasideList,\
 NdisAllocateGenericObject,\
 NdisAllocateMdl,\
 NdisAllocateMemoryWithTagPriority,\
 NdisAllocateNetBuffer,\
 NdisMAllocateSharedMemoryAsyncEx,\
 NdisMMapIoSpace,\
 NdisMAllocateSharedMemory
 
#define NDIS_STATUS_FAILURE     (-1073741823)

#define NDIS_SUCCESS(Status)    (Status == NDIS_STATUS_SUCCESS)
#define NDIS_PENDING(Status)    (Status == NDIS_STATUS_PENDING)
#define NDIS_FAILURE(Status)    (Status == NDIS_STATUS_FAILURE)
#define NDIS_OK(Status)         (Status >= 0)

#define NdisShutdownPowerOff 	0
#define NdisShutdownBugCheck	1

#define NDIS_STATUS_INVALID_OID                 -1073676265
#define NDIS_STATUS_NOT_SUPPORTED               -1073741637

#define NDIS_INTERMEDIATE_DRIVER                1
