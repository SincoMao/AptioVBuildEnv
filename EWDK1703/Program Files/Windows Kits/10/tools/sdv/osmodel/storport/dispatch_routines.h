/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/
#include <storport.h>


#ifdef fun_SP_DRIVER_INITIALIZE
extern sp_DRIVER_INITIALIZE fun_SP_DriverEntry;
#endif




#ifdef fun_SP_HW_INITIALIZE
extern HW_INITIALIZE  fun_SP_HW_INITIALIZE; 
#endif

#ifdef fun_SP_HW_BUILDIO
extern HW_BUILDIO  fun_SP_HW_BUILDIO; 
#endif

#ifdef fun_SP_HW_STARTIO
extern HW_STARTIO  fun_SP_HW_STARTIO; 
#endif

#ifdef fun_SP_HW_INTERRUPT
extern HW_INTERRUPT  fun_SP_HW_INTERRUPT; 
#endif

#ifdef fun_SP_HW_TIMER_1
extern HW_TIMER  fun_SP_HW_TIMER_1;	/*multiple*/
#endif

#ifdef fun_SP_HW_TIMER_2
extern HW_TIMER  fun_SP_HW_TIMER_2;	/*multiple*/
#endif

#ifdef fun_SP_HW_TIMER_3
extern HW_TIMER  fun_SP_HW_TIMER_3;	/*multiple*/
#endif

#ifdef fun_SP_HW_TIMER_4
extern HW_TIMER  fun_SP_HW_TIMER_4;	/*multiple*/
#endif

#ifdef fun_SP_HW_TIMER_5
extern HW_TIMER  fun_SP_HW_TIMER_5;	/*multiple*/
#endif

#ifdef fun_SP_HW_TIMER_6
extern HW_TIMER  fun_SP_HW_TIMER_6;	/*multiple*/
#endif

#ifdef fun_SP_HW_DMA_STARTED
extern HW_DMA_STARTED  fun_SP_HW_DMA_STARTED; 
#endif

#ifdef fun_SP_HW_FIND_ADAPTER
extern HW_FIND_ADAPTER  fun_SP_HW_FIND_ADAPTER; 
#endif

#ifdef fun_SP_HW_RESET_BUS
extern HW_RESET_BUS  fun_SP_HW_RESET_BUS; 
#endif

#ifdef fun_SP_HW_ADAPTER_STATE
extern HW_ADAPTER_STATE  fun_SP_HW_ADAPTER_STATE; 
#endif

#ifdef fun_SP_HW_ADAPTER_CONTROL
extern HW_ADAPTER_CONTROL  fun_SP_HW_ADAPTER_CONTROL; 
#endif

#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_1
extern HW_PASSIVE_INITIALIZE_ROUTINE  fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_1; /*multiple*/
#endif

#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_2
extern HW_PASSIVE_INITIALIZE_ROUTINE  fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_2; /*multiple*/
#endif

#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_3
extern HW_PASSIVE_INITIALIZE_ROUTINE  fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_3; /*multiple*/
#endif

#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_4
extern HW_PASSIVE_INITIALIZE_ROUTINE  fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_4; /*multiple*/
#endif

#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_5
extern HW_PASSIVE_INITIALIZE_ROUTINE  fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_5; /*multiple*/
#endif

#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_6
extern HW_PASSIVE_INITIALIZE_ROUTINE  fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_6; /*multiple*/
#endif

#ifdef fun_SP_HW_DPC_ROUTINE_1
extern HW_DPC_ROUTINE  fun_SP_HW_DPC_ROUTINE_1; /*multiple*/
#endif

#ifdef fun_SP_HW_DPC_ROUTINE_2
extern HW_DPC_ROUTINE  fun_SP_HW_DPC_ROUTINE_2; /*multiple*/
#endif

#ifdef fun_SP_HW_DPC_ROUTINE_3
extern HW_DPC_ROUTINE  fun_SP_HW_DPC_ROUTINE_3; /*multiple*/
#endif

#ifdef fun_SP_HW_DPC_ROUTINE_4
extern HW_DPC_ROUTINE  fun_SP_HW_DPC_ROUTINE_4; /*multiple*/
#endif

#ifdef fun_SP_HW_DPC_ROUTINE_5
extern HW_DPC_ROUTINE  fun_SP_HW_DPC_ROUTINE_5; /*multiple*/
#endif

#ifdef fun_SP_HW_DPC_ROUTINE_6
extern HW_DPC_ROUTINE  fun_SP_HW_DPC_ROUTINE_6; /*multiple*/
#endif




#ifdef fun_SP_HW_FREE_ADAPTER_RESOURCES
extern HW_FREE_ADAPTER_RESOURCES  fun_SP_HW_FREE_ADAPTER_RESOURCES; 
#endif

#ifdef fun_SP_HW_PROCESS_SERVICE_REQUEST
extern HW_PROCESS_SERVICE_REQUEST  fun_SP_HW_PROCESS_SERVICE_REQUEST; 
#endif

#ifdef fun_SP_HW_COMPLETE_SERVICE_IRP
extern HW_COMPLETE_SERVICE_IRP  fun_SP_HW_COMPLETE_SERVICE_IRP; 
#endif

#ifdef fun_SP_HW_INITIALIZE_TRACING
extern HW_INITIALIZE_TRACING  fun_SP_HW_INITIALIZE_TRACING; 
#endif

#ifdef fun_SP_HW_CLEANUP_TRACING
extern HW_CLEANUP_TRACING  fun_SP_HW_CLEANUP_TRACING; 
#endif

#ifdef fun_SP_VIRTUAL_HW_FIND_ADAPTER
extern VIRTUAL_HW_FIND_ADAPTER  fun_SP_VIRTUAL_HW_FIND_ADAPTER; 
#endif


#ifdef fun_IO_COMPLETION_ROUTINE_1
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_1; /*multiple*/
#endif

#ifdef fun_IO_COMPLETION_ROUTINE_2
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_2; /*multiple*/
#endif

#ifdef fun_IO_COMPLETION_ROUTINE_3
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_3; /*multiple*/
#endif

#ifdef fun_IO_COMPLETION_ROUTINE_4
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_4; /*multiple*/
#endif

#ifdef fun_IO_COMPLETION_ROUTINE_5
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_5; /*multiple*/
#endif

#ifdef fun_IO_COMPLETION_ROUTINE_6
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_6; /*multiple*/
#endif

#ifdef fun_IO_COMPLETION_ROUTINE_7
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_7; /*multiple*/
#endif

#ifdef fun_IO_COMPLETION_ROUTINE_8
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_8; /*multiple*/
#endif

#ifdef fun_IO_COMPLETION_ROUTINE_9
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_9; /*multiple*/
#endif

#ifdef fun_IO_COMPLETION_ROUTINE_10
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_10; /*multiple*/
#endif

#ifdef fun_IO_COMPLETION_ROUTINE_11
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_11; /*multiple*/
#endif

#ifdef fun_IO_COMPLETION_ROUTINE_12
extern IO_COMPLETION_ROUTINE fun_IO_COMPLETION_ROUTINE_12; /*multiple*/
#endif

#ifdef fun_DRIVER_CANCEL_1
extern DRIVER_CANCEL fun_DRIVER_CANCEL_1; /*multiple*/
#endif

#ifdef fun_DRIVER_CANCEL_2
extern DRIVER_CANCEL fun_DRIVER_CANCEL_2; /*multiple*/
#endif

#ifdef fun_DRIVER_CANCEL_3
extern DRIVER_CANCEL fun_DRIVER_CANCEL_3; /*multiple*/
#endif

#ifdef fun_DRIVER_CANCEL_4
extern DRIVER_CANCEL fun_DRIVER_CANCEL_4; /*multiple*/
#endif

#ifdef fun_DRIVER_CANCEL_5
extern DRIVER_CANCEL fun_DRIVER_CANCEL_5; /*multiple*/
#endif

#ifdef fun_DRIVER_CANCEL_6
extern DRIVER_CANCEL fun_DRIVER_CANCEL_6; /*multiple*/
#endif

#ifdef fun_DRIVER_CANCEL_7
extern DRIVER_CANCEL fun_DRIVER_CANCEL_7; /*multiple*/
#endif


#ifdef fun_HW_WORKITEM_1
extern HW_WORKITEM fun_HW_WORKITEM_1; /*multiple*/
#endif

#ifdef fun_HW_WORKITEM_2
extern HW_WORKITEM fun_HW_WORKITEM_2; /*multiple*/
#endif

#ifdef fun_HW_WORKITEM_3
extern HW_WORKITEM fun_HW_WORKITEM_3; /*multiple*/
#endif

#ifdef fun_HW_WORKITEM_4
extern HW_WORKITEM fun_HW_WORKITEM_4; /*multiple*/
#endif

#ifdef fun_HW_WORKITEM_5
extern HW_WORKITEM fun_HW_WORKITEM_5; /*multiple*/
#endif

#ifdef fun_HW_WORKITEM_6
extern HW_WORKITEM fun_HW_WORKITEM_6; /*multiple*/
#endif



#ifdef fun_HW_STATE_CHANGE_1
extern HW_STATE_CHANGE fun_HW_STATE_CHANGE_1; /*multiple*/
#endif

#ifdef fun_HW_STATE_CHANGE_2
extern HW_STATE_CHANGE fun_HW_STATE_CHANGE_2; /*multiple*/
#endif

#ifdef fun_HW_STATE_CHANGE_3
extern HW_STATE_CHANGE fun_HW_STATE_CHANGE_3; /*multiple*/
#endif

#ifdef fun_HW_STATE_CHANGE_4
extern HW_STATE_CHANGE fun_HW_STATE_CHANGE_4; /*multiple*/
#endif

#ifdef fun_HW_STATE_CHANGE_5
extern HW_STATE_CHANGE fun_HW_STATE_CHANGE_5; /*multiple*/
#endif

#ifdef fun_HW_STATE_CHANGE_6
extern HW_STATE_CHANGE fun_HW_STATE_CHANGE_6; /*multiple*/
#endif


#ifdef fun_HW_TRACING_ENABLED
extern HW_TRACING_ENABLED fun_HW_TRACING_ENABLED;
#endif


#ifdef fun_HW_MESSAGE_SIGNALED_INTERRUPT_ROUTINE
extern HW_MESSAGE_SIGNALED_INTERRUPT_ROUTINE fun_HW_MESSAGE_SIGNALED_INTERRUPT_ROUTINE;
#endif 

#ifdef fun_SP_HW_TIMER_EX_1
extern HW_TIMER_EX  fun_SP_HW_TIMER_EX_1;	/*multiple*/
#endif

#ifdef fun_SP_HW_TIMER_EX_2
extern HW_TIMER_EX  fun_SP_HW_TIMER_EX_2;	/*multiple*/
#endif

#ifdef fun_SP_HW_TIMER_EX_3
extern HW_TIMER_EX  fun_SP_HW_TIMER_EX_3;	/*multiple*/
#endif

#ifdef fun_SP_HW_TIMER_EX_4
extern HW_TIMER_EX  fun_SP_HW_TIMER_EX_4;	/*multiple*/
#endif

#ifdef fun_SP_HW_TIMER_EX_5
extern HW_TIMER_EX  fun_SP_HW_TIMER_EX_5;	/*multiple*/
#endif

#ifdef fun_SP_HW_TIMER_EX_6
extern HW_TIMER_EX  fun_SP_HW_TIMER_EX_6;	/*multiple*/
#endif

#ifdef fun_SP_HW_UNIT_CONTROL
extern HW_UNIT_CONTROL  fun_SP_HW_UNIT_CONTROL;
#endif

#ifdef fun_SP_POST_SCATTER_GATHER_EXECUTE
extern POST_SCATTER_GATHER_EXECUTE  fun_SP_POST_SCATTER_GATHER_EXECUTE;
#endif

