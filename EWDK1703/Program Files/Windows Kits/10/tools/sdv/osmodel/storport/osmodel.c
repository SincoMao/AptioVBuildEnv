/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/

/* ..\wdm\harness-copyright.c begin */
/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/

/*

Module Name:
    
    SDV harness


Abstract:
    
    Functions as representation of Windows OS for SDV.  It boots the 
    device driver and puts it into various states via its entry 
    DriverEntry routine and dispatch routines, etc.


Environment:

    Symbolic execution in Static Driver Verifier.

*/
/* ..\wdm\harness-copyright.c end */

/* ..\wdm\malloc.c begin */
/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/

char * malloc(int);


char sdv_alloc_dummy;

char* malloc(
    int i
    )
{
    return &sdv_alloc_dummy;
}/* ..\wdm\malloc.c end */

/* ..\wdm\slic_data.c begin */
/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/


#if defined(_NTIFS_INCLUDED_) || defined(SDV_Include_NTIFS)
#include <ntifs.h>
#include <ntdddisk.h>
#elif defined(_NTDDK_) || defined(SDV_Include_NTDDK)
#include <ntddk.h>
#include <ntdddisk.h>
#else
#include <wdm.h>
#include <ntdddisk.h>
#endif




#include <slic_types_macros.h>


#include "dispatch_routines.h"
#include "sdv_stubs.h"

#ifdef SDV_RULE_NULLCHECK
BOOLEAN sdv_rule_NullCheck = TRUE;
#else
BOOLEAN sdv_rule_NullCheck = FALSE;
#endif    


BOOLEAN sdv_dpc_io_registered = FALSE;

BOOLEAN sdv_apc_disabled = FALSE;



IRP sdv_ControllerIrp;
PIRP sdv_ControllerPirp = &sdv_ControllerIrp; 

IRP sdv_StartIoIrp;
PIRP sdv_StartIopirp = &sdv_StartIoIrp; 


IRP sdv_PowerIrp;
PIRP sdv_power_irp = &sdv_PowerIrp; 


IRP sdv_harnessIrp;
PIRP sdv_irp = &sdv_harnessIrp; 


IO_STACK_LOCATION sdv_harnessStackLocation;
IO_STACK_LOCATION sdv_harnessStackLocation_next;

IRP sdv_other_harnessIrp;
PIRP sdv_other_irp = &sdv_other_harnessIrp;
IO_STACK_LOCATION sdv_other_harnessStackLocation;
IO_STACK_LOCATION sdv_other_harnessStackLocation_next;

IRP sdv_IoMakeAssociatedIrp_harnessIrp;
PIRP sdv_IoMakeAssociatedIrp_irp = &sdv_IoMakeAssociatedIrp_harnessIrp;
IO_STACK_LOCATION sdv_IoMakeAssociatedIrp_harnessStackLocation;
IO_STACK_LOCATION sdv_IoMakeAssociatedIrp_harnessStackLocation_next;

IRP sdv_IoBuildDeviceIoControlRequest_harnessIrp;
PIRP sdv_IoBuildDeviceIoControlRequest_irp = &sdv_IoBuildDeviceIoControlRequest_harnessIrp;
IO_STACK_LOCATION sdv_IoBuildDeviceIoControlRequest_harnessStackLocation;
IO_STACK_LOCATION sdv_IoBuildDeviceIoControlRequest_harnessStackLocation_next;
IO_STATUS_BLOCK sdv_harness_IoBuildDeviceIoControlRequest_IoStatusBlock;
PIO_STATUS_BLOCK sdv_IoBuildDeviceIoControlRequest_IoStatusBlock=&sdv_harness_IoBuildDeviceIoControlRequest_IoStatusBlock;





IRP sdv_IoBuildSynchronousFsdRequest_harnessIrp;
PIRP sdv_IoBuildSynchronousFsdRequest_irp = &sdv_IoBuildSynchronousFsdRequest_harnessIrp;
IO_STACK_LOCATION sdv_IoBuildSynchronousFsdRequest_harnessStackLocation;
IO_STACK_LOCATION sdv_IoBuildSynchronousFsdRequest_harnessStackLocation_next;
IO_STATUS_BLOCK sdv_harness_IoBuildSynchronousFsdRequest_IoStatusBlock;
PIO_STATUS_BLOCK sdv_IoBuildSynchronousFsdRequest_IoStatusBlock=&sdv_harness_IoBuildSynchronousFsdRequest_IoStatusBlock;


IRP sdv_IoBuildAsynchronousFsdRequest_harnessIrp;
PIRP sdv_IoBuildAsynchronousFsdRequest_irp = &sdv_IoBuildAsynchronousFsdRequest_harnessIrp;
IO_STACK_LOCATION sdv_IoBuildAsynchronousFsdRequest_harnessStackLocation;
IO_STACK_LOCATION sdv_IoBuildAsynchronousFsdRequest_harnessStackLocation_next;
IO_STATUS_BLOCK sdv_harness_IoBuildAsynchronousFsdRequest_IoStatusBlock;
PIO_STATUS_BLOCK sdv_IoBuildAsynchronousFsdRequest_IoStatusBlock=&sdv_harness_IoBuildAsynchronousFsdRequest_IoStatusBlock;



IRP sdv_IoInitializeIrp_harnessIrp;
PIRP sdv_IoInitializeIrp_irp = &sdv_IoInitializeIrp_harnessIrp;
IO_STACK_LOCATION sdv_IoInitializeIrp_harnessStackLocation;
IO_STACK_LOCATION sdv_IoInitializeIrp_harnessStackLocation_next;


int sdv_harnessDeviceExtension_val;
int sdv_harnessDeviceExtension_two_val;


PVOID sdv_harnessDeviceExtension;
PVOID sdv_harnessDeviceExtension_two;




int sdv_io_create_device_called = 0;

int sdv_context_val ;
PVOID sdv_context;
int sdv_start_info_val ;
ULONG_PTR sdv_start_info;
int sdv_end_info_val ;
ULONG_PTR sdv_end_info;


/* SDV OS Model IRQL Stack:

The OS Model contains a Bounded IRQL Stack.

The Bounded IRQL Stack should only be changed in OS Model DDIs and
only using 1) the operation SDV_IRQL_PUSH for pushing onto the stack
and 2) SDV_IRQL_POP and SDV_IRQL_POPTO for popping from the stack.

The stack is used in a number of rules that specify proper stack
behaviour for pairs of DDIs such as for example KeAcquireSpinLock and
KeReleaseSpinLock.

Pushing is used in the OS Model when a DDI sets/increases the IRQL to
a new and weakly higher IRQL.  An example of such a DDI is
KeAcquireSpinLock.

Popping is used in the OS Model when a DDI restores/lowers the IRQL to
a new and weakly lower IRQL.  An example of such a DDI is
KeReleaseSpinLock.

The stack is represented by the global variables sdv_irql_current,
sdv_irql_previous, sdv_irql_previous_2, sdv_irql_previous_3, sdv_irql_previous_4 and sdv_irql_previous_5.
sdv_irql_current is considered the top of the stack, sdv_irql_previous
is the second element of the stack and so on.

The stack is bounded.  Currently to height three.  This means that the
OS Model will not correctly capture the meaning of more than three
pushes to the stack.  Certain rules that check proper stack behaviour
takes this into account by counting current depth of the stack.

*/

/* Global IRQL stack, 6 levels high: */
KIRQL sdv_irql_current = PASSIVE_LEVEL;
KIRQL sdv_irql_previous = PASSIVE_LEVEL;
KIRQL sdv_irql_previous_2 = PASSIVE_LEVEL;
KIRQL sdv_irql_previous_3 = PASSIVE_LEVEL;
KIRQL sdv_irql_previous_4 = PASSIVE_LEVEL;
KIRQL sdv_irql_previous_5 = PASSIVE_LEVEL;

int sdv_maskedEflags = 0;

struct _KDPC sdv_kdpc_val;
struct _KDPC * sdv_kdpc;

PKDPC sdv_pkdpc;

struct _KDPC sdv_kdpc_val3;
struct _KDPC * sdv_kdpc3 = &sdv_kdpc_val3;


int sdv_DpcContext;
PVOID sdv_pDpcContext;

int sdv_IoDpcContext;
PVOID sdv_pIoDpcContext;

int sdv_IoCompletionContext;
PVOID sdv_pIoCompletionContext;


PVOID sdv_pv1;
PVOID sdv_pv2;
PVOID sdv_pv3;

DRIVER_OBJECT sdv_driver_object;

DEVICE_OBJECT sdv_devobj_fdo;
PDEVICE_OBJECT sdv_p_devobj_fdo = &sdv_devobj_fdo;


BOOLEAN sdv_inside_init_entrypoint = FALSE;



DEVICE_OBJECT sdv_devobj_pdo;
PDEVICE_OBJECT sdv_p_devobj_pdo = &sdv_devobj_pdo;


DEVICE_OBJECT sdv_devobj_child_pdo;
PDEVICE_OBJECT sdv_p_devobj_child_pdo = &sdv_devobj_child_pdo;


int sdv_kinterrupt_val;
struct _KINTERRUPT *sdv_kinterrupt = (struct _KINTERRUPT *) &sdv_kinterrupt_val;

int sdv_MapRegisterBase_val;
PVOID sdv_MapRegisterBase = (PVOID) &sdv_MapRegisterBase_val;



BOOLEAN sdv_invoke_on_success = FALSE;


BOOLEAN sdv_invoke_on_error = FALSE;


BOOLEAN sdv_invoke_on_cancel = FALSE;


#if (NTDDI_VERSION >= NTDDI_WIN8)

PO_FX_DEVICE sdv_fx_dev_object;
PPO_FX_DEVICE p_sdv_fx_dev_object = &sdv_fx_dev_object;
#endif


PVOID sdv_PoRuntime_Context;
PVOID sdv_PoRuntime_InBuffer;
PVOID sdv_PoRuntime_OutBuffer;
BOOLEAN sdv_PoRuntime_Active;
BOOLEAN sdv_PoRuntime_Suspended;
BOOLEAN sdv_PoRuntime_PowerRequired;
ULONG sdv_PoRuntime_Component;
ULONG sdv_PoRuntime_State;
PVOID sdv_PoRuntime_DeviceContext;
LPCGUID sdv_PoRuntime_PowerControlCode;
SIZE_T sdv_PoRuntime_InBufferSize;
SIZE_T sdv_PoRuntime_OutBufferSize;
PSIZE_T sdv_PoRuntime_BytesReturned;
/* ..\wdm\slic_data.c end */

/* ..\wdm\harness-parts.c begin */
#define SDV_IS_FLAT_SIMPLE_HARNESS() \
    ( \
        SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS \
    )


#define SDV_FLAT_SIMPLE_HARNESS() \
    ( \
       SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_COMPLETION_NO_CANCEL \
    )

#define SDV_FLAT_SIMPLE_HARNESS() \
    ( \
       SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_COMPLETION_NO_CANCEL || \
	   SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_NO_DEVICE_IRPS || \
	   SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_COMPLETION_ONLY || \
	   SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_NO_CANCEL || \
	   SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_PNP_POWER_IRPS || \
	   SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_WMI_ONLY \
    )



#define SDV_IS_FLAT_HARNESS() \
    ( \
        SDV_HARNESS==SDV_FLAT_DISPATCH_HARNESS || \
        SDV_HARNESS==SDV_FLAT_DISPATCH_STARTIO_HARNESS || \
        SDV_HARNESS==SDV_FLAT_HARNESS || \
        SDV_IS_FLAT_SIMPLE_HARNESS() \
    )

#define SDV_IS_XFLAT_HARNESS_CANCEL() \
    ( \
        SDV_HARNESS==SDV_XFLAT_HARNESS_CANCEL || \
        SDV_HARNESS==SDV_XFLAT_SIMPLE_HARNESS_CANCEL \
    )

#if SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_COMPLETION_NO_CANCEL
	#define SDV_FLAT_HARNESS_MODIFIER_NO_DRIVER_CANCEL
	#define SDV_HARNESS_COMPLETION_ROUTINE
	#define SDV_NO_DEBUGGER_ATTACHED_OR_ENABLED
#endif

#if SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_NO_CANCEL
	#define SDV_FLAT_HARNESS_MODIFIER_NO_DRIVER_CANCEL
	#define SDV_NO_DEBUGGER_ATTACHED_OR_ENABLED
#endif


#if SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_NO_DEVICE_IRPS
  #define SDV_FLAT_HARNESS_NO_DPC
  #define SDV_FLAT_HARNESS_NO_ISR
  #define SDV_FLAT_HARNESS_NO_KE_DPC
  #define SDV_FLAT_HARNESS_NO_KE_WORK_ITEMS 
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_DEVICE_CONTROL
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_INTERNAL_DEVICE_CONTROL
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_READ
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_WRITE
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_POWER
  #define SDV_HARNESS_COMPLETION_ROUTINE
#endif


#if SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_COMPLETION_ONLY
  #define SDV_FLAT_HARNESS_NO_DPC
  #define SDV_FLAT_HARNESS_NO_ISR
  #define SDV_FLAT_HARNESS_NO_KE_DPC
  #define SDV_FLAT_HARNESS_NO_KE_WORK_ITEMS 
  #define SDV_HARNESS_COMPLETION_ROUTINE
#endif

#if SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_PNP_POWER_IRPS
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_CLEANUP
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_CREATE
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_DEVICE_CONTROL
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_FLUSH_BUFFERS
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_FLUSH_BUFFER
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_INTERNAL_DEVICE_CONTROL
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_LOCK_CONTROL
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_QUERY_INFORMATION
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_READ
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_SET_INFORMATION
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_SHUTDOWN
  #define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_WRITE
#endif


#if SDV_HARNESS==SDV_FLAT_SIMPLE_HARNESS_WITH_WMI_ONLY
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_CLEANUP
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_CREATE
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_DEVICE_CONTROL
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_FLUSH_BUFFERS
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_FLUSH_BUFFER
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_INTERNAL_DEVICE_CONTROL
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_LOCK_CONTROL
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_QUERY_INFORMATION
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_READ
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_SET_INFORMATION
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_WRITE
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_PNP
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_POWER
	#define SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_SHUTDOWN
    #define SDV_HARNESS_COMPLETION_ROUTINE
#endif

#define SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION()\
sdv_harnessStackLocation_next.CompletionRoutine=NULL;\
sdv_other_harnessStackLocation_next.CompletionRoutine=NULL;\
sdv_harnessStackLocation.CompletionRoutine=NULL;\


#define SDV_MACRO_COPYCURRENTIRPSTACKLOCATIONTONEXT(arg1)\
    if (arg1 == &sdv_harnessIrp) {\
        sdv_harnessStackLocation_next.MinorFunction =\
            sdv_harnessStackLocation.MinorFunction;\
        sdv_harnessStackLocation_next.MajorFunction =\
            sdv_harnessStackLocation.MajorFunction;\
    }\
    if (arg1 == &sdv_other_harnessIrp) {\
        sdv_other_harnessStackLocation_next.MinorFunction =\
            sdv_other_harnessStackLocation.MinorFunction;\
        sdv_other_harnessStackLocation_next.MajorFunction =\
            sdv_other_harnessStackLocation.MajorFunction;\
    }\

#define SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(arg1)\
(arg1->Tail.Overlay.CurrentStackLocation)\

#define SDV_MACRO_STUB_CANCEL_BEGIN(arg1)\
IoAcquireCancelSpinLock(&(arg1->CancelIrql))\

#define SDV_MACRO_STUB_CANCEL_END(arg1)\
arg1->CancelRoutine=NULL\


VOID 
sdv_SetIrpMinorFunctionNonBusDriver(
    PIRP pirp
    );
    
PIO_STACK_LOCATION
sdv_SetPowerRequestIrpMinorFunction(
    PIRP pirp
    );


VOID
sdv_SetIrpMinorFunctionBusDriver(
    PIRP pirp
    );


VOID
sdv_SetMajorFunction(
    PIRP pirp,
    UCHAR fun
    );

VOID
sdv_SetPowerIrpMinorFunction(
    PIRP pirp
    );
    
VOID
sdv_SetPowerIrpMinorFunctionSetPower(
    PIRP pirp
    );

VOID
sdv_SetStatus(
    PIRP pirp
    );


NTSTATUS
sdv_DoNothing(
    );

NTSTATUS         
sdv_RunDispatchFunction(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS         
sdv_RunDispatchWrite(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS         
sdv_RunDispatchRead(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS         
sdv_RunDispatchInternalDeviceControl(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS         
sdv_RunDispatchDeviceControl(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS         
sdv_RunDispatchCreate(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS         
sdv_RunDispatchClose(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS 
sdv_RunDispatchPower(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS 
sdv_RunDispatchPnp(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );


NTSTATUS         
sdv_RunDispatchSystemControl(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );




NTSTATUS         
sdv_RunDispatchShutdown(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );



NTSTATUS         
sdv_RunDispatchCleanup(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );



VOID         
sdv_RunCancelFunction(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );



NTSTATUS 
sdv_RunSurpriseRemoveDevice(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );


NTSTATUS 
sdv_RunRemoveDevice(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );


NTSTATUS 
sdv_RunQueryRemoveDevice(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );
    
NTSTATUS         
sdv_RunQueryDeviceRelations(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS 
sdv_RunQueryCapRequirements(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );
    
NTSTATUS 
sdv_RunResRequirements(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS 
sdv_RunQueryDeviceState(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS 
sdv_RunQueryPowerUp(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );
    
NTSTATUS 
sdv_RunQueryPowerUpDevice(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );


NTSTATUS 
sdv_RunQueryPowerDown(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS 
sdv_RunSetPowerUpDevice(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS 
sdv_RunSetPowerUp(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

NTSTATUS 
sdv_RunSetPowerDown(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

PIRP             
sdv_MakeAbstractIrp(PIRP pirp
    );


PIRP             
sdv_MakeStartDeviceIrp(PIRP pirp
    );


PIRP             
sdv_MakeRemoveDeviceIrp(PIRP pirp
    );

LONG
SdvMakeChoice();

LONG
SdvKeepChoice();

/*POWER_STATE
sdv_Make_POWER_STATE();*/

VOID
sdv_RunStartIo(
    PDEVICE_OBJECT po, 
    PIRP pirp
    );

void
sdv_RunExQueueWorkItems(
    PWORKER_THREAD_ROUTINE WorkerRoutine,
    PVOID Context
    );

void
sdv_RunIoQueueWorkItems(
    IN PIO_WORKITEM IoWorkItem,
    IN PIO_WORKITEM_ROUTINE WorkerRoutine,
    IN WORK_QUEUE_TYPE QueueType,
    IN PVOID Context
    );

void
sdv_RunIoQueueWorkItemsEx(
    IN PIO_WORKITEM IoWorkItem,
    IN PIO_WORKITEM_ROUTINE_EX WorkerRoutine,
    IN WORK_QUEUE_TYPE QueueType,
    IN PVOID Context
    );

NTSTATUS
sdv_RunIoCompletionRoutines(
    __in PDEVICE_OBJECT DeviceObject, 
    __in PIRP Irp, 
    __in_opt PVOID Context,
    BOOLEAN* Completion_Routine_Called
    );


BOOLEAN
sdv_RunPowerCompletionRoutines(
    IN PDEVICE_OBJECT DeviceObject,
    IN UCHAR MinorFunction,
    IN POWER_STATE PowerState,
    IN PVOID Context,
    IN PIO_STATUS_BLOCK IoStatus,
    PREQUEST_POWER_COMPLETE CompletionFunction
    );



VOID
sdv_RunISRRoutines(
    struct _KINTERRUPT *ki, 
    PVOID pv1
    );

VOID
sdv_RunKeDpcRoutines(
    struct _KDPC *kdpc, 
    PVOID pDpcContext, 
    PVOID pv2, 
    PVOID pv3
    );
    
VOID
sdv_RunIoDpcRoutines(
    IN PKDPC  Dpc,    
    IN struct _DEVICE_OBJECT  *DeviceObject,    
    IN struct _IRP  *Irp,    
    IN PVOID  Context
    );

BOOLEAN
sdv_RunKSynchronizeRoutines(
    PKSYNCHRONIZE_ROUTINE SynchronizeRoutine,
    PVOID  Context
    );


VOID
sdv_RunUnload(
    PDRIVER_OBJECT pdrivo
    );

NTSTATUS sdv_RunAddDevice(
    PDRIVER_OBJECT p1,
    PDEVICE_OBJECT p2
    );

/*NTSTATUS sdv_RunDriverentry(
    _DRIVER_OBJECT  *DriverObject,
    PUNICODE_STRING  RegistryPath
    );*/

BOOLEAN 
sdv_CheckDispatchRoutines(
    );

BOOLEAN 
sdv_CheckStartIoRoutines(
    );

BOOLEAN 
sdv_CheckDpcRoutines(
    );

BOOLEAN 
sdv_CheckIsrRoutines(
    );

BOOLEAN 
sdv_CheckCancelRoutines(
    );

BOOLEAN 
sdv_CheckCancelRoutines1(
    );


BOOLEAN 
sdv_CheckIoDpcRoutines(
    );

BOOLEAN 
sdv_IoCompletionRoutines(
    );

BOOLEAN 
sdv_CheckWorkerRoutines(
    );

BOOLEAN 
sdv_CheckAddDevice(
    );

BOOLEAN 
sdv_CheckIrpMjPnp(
    );

BOOLEAN 
sdv_CheckIrpMjPower(
    );


BOOLEAN 
sdv_CheckDriverUnload(
    );



VOID SdvExit();

VOID SdvAssume(int e);

VOID SdvAssumeSoft(int e);





int sdv_start_irp_already_issued = 0;
int sdv_remove_irp_already_issued = 0;
int sdv_Io_Removelock_release_wait_returned = 0;


int sdv_compFset = 0;

BOOLEAN
sdv_isr_dummy (
    IN struct _KINTERRUPT * Interrupt,
    IN PVOID ServiceContext
    )
{
    return FALSE;
}

PKSERVICE_ROUTINE  sdv_isr_routine = sdv_isr_dummy;




VOID
sdv_dpc_dummy (
    IN struct _KDPC * Dpc,
    IN PVOID DeferredContext,
    IN PVOID SystemArgument1,
    IN PVOID SystemArgument2
    )
{
}

PKDEFERRED_ROUTINE  sdv_ke_dpc=sdv_dpc_dummy;

BOOLEAN sdv_dpc_ke_registered=FALSE;



VOID
sdv_io_dpc_dummy (
    IN PKDPC  Dpc,    
    IN struct _DEVICE_OBJECT  *DeviceObject,    
    IN struct _IRP  *Irp,    
    IN PVOID  Context
    )
{
}

PIO_DPC_ROUTINE  sdv_io_dpc=sdv_io_dpc_dummy;

/* Operations on the global IRQL stack: */

/*
   SDV_IRQL_PUSH(new_irql):
     Change to new_irql IRQL, pushing old levels on the stack
*/

#define SDV_IRQL_PUSH(new_irql) \
    sdv_irql_previous_5 = sdv_irql_previous_4; \
    sdv_irql_previous_4 = sdv_irql_previous_3; \
    sdv_irql_previous_3 = sdv_irql_previous_2; \
    sdv_irql_previous_2 = sdv_irql_previous; \
    sdv_irql_previous = sdv_irql_current; \
    sdv_irql_current = new_irql

/*
   SDV_IRQL_POP():
     Change to previous IRQL, popping it from the stack
*/

#define SDV_IRQL_POP() \
    sdv_irql_current = sdv_irql_previous; \
    sdv_irql_previous = sdv_irql_previous_2; \
    sdv_irql_previous_2 = sdv_irql_previous_3; \
    sdv_irql_previous_3 = sdv_irql_previous_4; \
    sdv_irql_previous_4 = sdv_irql_previous_5

/*
   SDV_IRQL_POPTO(new_irql):
     Change to new_irql IRQL,
     popping (and ignoring) an IRQL from the stack
*/

#define SDV_IRQL_POPTO(new_irql) \
    sdv_irql_current = new_irql; \
    sdv_irql_previous = sdv_irql_previous_2; \
    sdv_irql_previous_2 = sdv_irql_previous_3; \
    sdv_irql_previous_3 = sdv_irql_previous_4; \
    sdv_irql_previous_4 = sdv_irql_previous_5
    

VOID sdv_Trap ( VOID ) { ; }


VOID
sdv_NullDereferenceTrap (
    PVOID p
    )
{
  if ( p == 0 ) { sdv_Trap();  }
}



#define SDV_MAIN_INIT()\
		SdvAssume(sdv_harnessDeviceExtension != 0);\
    SdvAssume(sdv_harnessDeviceExtension_two != 0);\
    sdv_devobj_pdo.DeviceExtension = sdv_harnessDeviceExtension;\
    sdv_devobj_fdo.DeviceExtension = sdv_harnessDeviceExtension_two;\
    sdv_irp->Tail.Overlay.CurrentStackLocation = &sdv_harnessStackLocation;\
    sdv_other_irp->Tail.Overlay.CurrentStackLocation = &sdv_other_harnessStackLocation
    


VOID 
sdv_SetPowerIrpMinorFunction(
    PIRP pirp
    )  
/*

Routine Description:

    Sets the MN IRP fields to the possible values.  

Arguments:

    pirp - The IRP to set.

Notes:
    Note how we're using non-determinism here with "x" and "y".  "x", for
    example, could take on any value.

*/
{
    PIO_STACK_LOCATION r = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    LONG x = SdvMakeChoice();
    LONG y = SdvMakeChoice();

    switch (x) {
        case 0:
        r->MinorFunction = IRP_MN_SET_POWER;
        switch (y) {
            case 0:
            r->Parameters.Power.Type = SystemPowerState;
            break;

            case 1:
            default:
            r->Parameters.Power.Type = DevicePowerState;
            break;
        }
              break;

        case 1:
        r->MinorFunction = IRP_MN_QUERY_POWER;
        switch (y) {

            case 0:
            r->Parameters.Power.Type = SystemPowerState;
            break;

            case 1:
            default:
            r->Parameters.Power.Type = DevicePowerState;
            break;
        }
        break;


        case 2:
        r->MinorFunction = IRP_MN_POWER_SEQUENCE;
        break;      


        case 3:
        default:
        r->MinorFunction = IRP_MN_WAIT_WAKE;
        break;
        }
}



VOID 
sdv_SetPowerIrpMinorFunctionSetPower(
    PIRP pirp
    )  
/*

Routine Description:

    Sets the MN IRP fields to the possible values.  

Arguments:

    pirp - The IRP to set.

Notes:
    Note how we're using non-determinism here with "x" and "y".  "x", for
    example, could take on any value.

*/
{
    PIO_STACK_LOCATION r = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    LONG nd_state = SdvMakeChoice();
    r->MinorFunction = IRP_MN_SET_POWER;
    r->Parameters.Power.Type = SystemPowerState;
    switch (nd_state)
    { 
      case 0:
      r->Parameters.Power.State.SystemState=PowerSystemWorking;
      break;
      case 1:
      r->Parameters.Power.State.SystemState=PowerSystemSleeping1;
      break;
      case 2:
      r->Parameters.Power.State.SystemState=PowerSystemSleeping2;
      break;
      case 3:
      r->Parameters.Power.State.SystemState=PowerSystemSleeping3;
      break;
      case 4:
      r->Parameters.Power.State.SystemState=PowerSystemHibernate;
      break;
      case 5:
      r->Parameters.Power.State.SystemState=PowerSystemShutdown;
      break;
      default:
      r->Parameters.Power.State.SystemState=PowerSystemMaximum;
      break;
    }
}





PIRP 
sdv_MakeRemoveDeviceIrp(PIRP pirp
    )
{
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);

    ps->MajorFunction = IRP_MJ_PNP;
    ps->MinorFunction = IRP_MN_REMOVE_DEVICE;
    pirp->CancelRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_SetStatus(pirp);

    return pirp;
}




PIRP 
sdv_MakeStartDeviceIrp(PIRP pirp
    )
{
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);

    ps->MajorFunction = IRP_MJ_PNP;
    ps->MinorFunction = IRP_MN_START_DEVICE;
    pirp->CancelRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_SetStatus(pirp);

    return pirp;
}



VOID
sdv_SetMajorFunction(
    PIRP pirp,
    UCHAR fun
    )
{

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = fun;   

}




VOID 
sdv_SetStatus(
    PIRP pirp
    )
{
    LONG choice = SdvMakeChoice();

    switch(choice) {
        case 0:
            pirp->IoStatus.Status = STATUS_NOT_SUPPORTED;
            break;
        case 1:
        default:
            pirp->IoStatus.Status = STATUS_SUCCESS;
            break;
    }
}


        

NTSTATUS 
sdv_DoNothing(
    )
{
    return STATUS_UNSUCCESSFUL;
}





LONG 
SdvMakeChoice(
    )
/*

Routine Description:

    Non-deterministically chooses a value and returns it:
    to full cl we return 0, but then assignment x = SdvKeepChoice
    is eliminated - so that x remains uninitialized

Arguments:

Notes:
    Note how we're using non-determinism here:  "x" can be any value.

    If you wanted to take this harness and actually execute it, you need
    to implement the non-determinism.  Changing this function would be a
    start, but you would also need to change the places where IRPs and other
    types are non-deterministically choosen.

*/
{
    return 0;
}

LONG 
SdvKeepChoice(
    )
/*

Routine Description:

    Non-deterministically chooses a value and returns it:
    to full cl we return 0, but then assignment x = SdvMakeChoice
    is eliminated - so that x remains uninitialized

Arguments:

Notes:
    Note how we're using non-determinism here:  "x" can be any value.

    If you wanted to take this harness and actually execute it, you need
    to implement the non-determinism.  Changing this function would be a
    start, but you would also need to change the places where IRPs and other
    types are non-deterministically choosen.

*/
{
    return 0;
}

/*POWER_STATE
sdv_Make_POWER_STATE(
    )
{
  POWER_STATE x;
  int y = SdvMakeChoice();
  switch(y) {
    case 1 : x.SystemState = SdvMakeChoice(); break;
    default: x.DeviceState = SdvMakeChoice(); break;
  }
  return x;
}*/


NTSTATUS 
sdv_RunDispatchFunction(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_CREATE" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    
    int x = SdvMakeChoice();
    UCHAR minor_function = (UCHAR) SdvKeepChoice();

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    sdv_end_info = sdv_start_info = (ULONG_PTR) pirp->IoStatus.Information;
 
    sdv_SetStatus(pirp);

    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    


    ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    
    sdv_dpc_io_registered = FALSE;
    
    sdv_stub_dispatch_begin();

    switch (x) { 

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_CLEANUP
        case IRP_MJ_CLEANUP:
        ps->MajorFunction = IRP_MJ_CLEANUP;
#ifdef fun_IRP_MJ_CLEANUP
        status = fun_IRP_MJ_CLEANUP(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_CLOSE
        case IRP_MJ_CLOSE:
        ps->MajorFunction = IRP_MJ_CLOSE;
#ifdef fun_IRP_MJ_CLOSE
        status = fun_IRP_MJ_CLOSE(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_CREATE
        case IRP_MJ_CREATE:
        ps->MajorFunction = IRP_MJ_CREATE;
#ifdef fun_IRP_MJ_CREATE
        status = fun_IRP_MJ_CREATE(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_DEVICE_CONTROL
        case IRP_MJ_DEVICE_CONTROL:
        ps->MajorFunction = IRP_MJ_DEVICE_CONTROL;
#ifdef fun_IRP_MJ_DEVICE_CONTROL
        status = fun_IRP_MJ_DEVICE_CONTROL(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_FILE_SYSTEM_CONTROL
        case IRP_MJ_FILE_SYSTEM_CONTROL:
        ps->MajorFunction = IRP_MJ_FILE_SYSTEM_CONTROL;
#ifdef fun_IRP_MJ_FILE_SYSTEM_CONTROL
        status = fun_IRP_MJ_FILE_SYSTEM_CONTROL(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_FLUSH_BUFFERS
        case IRP_MJ_FLUSH_BUFFERS:
        ps->MajorFunction = IRP_MJ_FLUSH_BUFFERS;
#ifdef fun_IRP_MJ_FLUSH_BUFFERS
        status = fun_IRP_MJ_FLUSH_BUFFERS(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_INTERNAL_DEVICE_CONTROL
        case IRP_MJ_INTERNAL_DEVICE_CONTROL:
        ps->MajorFunction = IRP_MJ_INTERNAL_DEVICE_CONTROL;
#ifdef fun_IRP_MJ_INTERNAL_DEVICE_CONTROL
        status = fun_IRP_MJ_INTERNAL_DEVICE_CONTROL(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
           sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
           sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif


#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_LOCK_CONTROL
        case IRP_MJ_LOCK_CONTROL:
              ps->MajorFunction = IRP_MJ_LOCK_CONTROL;
#ifdef fun_IRP_MJ_LOCK_CONTROL
        status = fun_IRP_MJ_LOCK_CONTROL(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_QUERY_INFORMATION
        case IRP_MJ_QUERY_INFORMATION:
        ps->MajorFunction = IRP_MJ_QUERY_INFORMATION;
#ifdef fun_IRP_MJ_QUERY_INFORMATION
        status = fun_IRP_MJ_QUERY_INFORMATION(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_READ
        case IRP_MJ_READ:
        ps->MajorFunction = IRP_MJ_READ;
#ifdef fun_IRP_MJ_READ
        status = fun_IRP_MJ_READ(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_SET_INFORMATION
        case IRP_MJ_SET_INFORMATION:
        ps->MajorFunction = IRP_MJ_SET_INFORMATION;
#ifdef fun_IRP_MJ_SET_INFORMATION
        status = fun_IRP_MJ_SET_INFORMATION(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_SYSTEM_CONTROL
        case IRP_MJ_SYSTEM_CONTROL:
        ps->MajorFunction = IRP_MJ_SYSTEM_CONTROL;
#ifdef fun_IRP_MJ_SYSTEM_CONTROL
        status = fun_IRP_MJ_SYSTEM_CONTROL(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_WRITE
        case IRP_MJ_WRITE:
        ps->MajorFunction = IRP_MJ_WRITE;
#ifdef fun_IRP_MJ_WRITE
        status = fun_IRP_MJ_WRITE(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_PNP
        case IRP_MJ_PNP:
        ps->MajorFunction = IRP_MJ_PNP;


 
        if (ps->MinorFunction == IRP_MN_START_DEVICE) 
        {
            SdvAssume(!sdv_start_irp_already_issued);
        }

        if (ps->MinorFunction == IRP_MN_CANCEL_REMOVE_DEVICE) 
	{
	   SdvAssume(!sdv_remove_irp_already_issued);
	}
	if (ps->MinorFunction == IRP_MN_REMOVE_DEVICE) 
	{
            sdv_remove_irp_already_issued = 1;
#ifdef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_PNP_MN_REMOVE_DEVICE
            SdvExit();
#endif
        }

#ifdef fun_IRP_MJ_PNP
        
#ifdef SDV_NON_BUS_MN_FUNCTIONS
        sdv_SetIrpMinorFunctionNonBusDriver(pirp);
#endif

#ifdef SDV_FLAT_HARNESS_MODIFIER_IRP_MJ_PNP_WITH_IRP_MN_QUERY_DEVICE_RELATIONS
     sdv_SetIrpMinorFunctionBusDriver(pirp);
#endif


#ifdef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_PNP_WITH_IRP_MN_QUERY
    SdvAssume(ps->MinorFunction != IRP_MN_QUERY_INTERFACE);
    SdvAssume(ps->MinorFunction != IRP_MN_QUERY_STOP_DEVICE);
    SdvAssume(ps->MinorFunction != IRP_MN_QUERY_REMOVE_DEVICE);
#endif


#ifdef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_PNP_WITH_IRP_MN_START_DEVICE
    SdvAssume(ps->MinorFunction != IRP_MN_START_DEVICE);
#endif

        status = fun_IRP_MJ_PNP(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if ((SDV_HARNESS==SDV_PNP_HARNESS)||(SDV_HARNESS==SDV_POWER_DOWN_PNP_HARNESS_HARNESS)||(SDV_HARNESS==SDV_SMALL_START_SEQUENCE_HARNESS))
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif

#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_POWER
        case IRP_MJ_POWER:
        ps->MajorFunction = IRP_MJ_POWER;
        
#ifdef fun_IRP_MJ_POWER
#ifndef SDV_FLAT_HARNESS_MODIFIER_IRP_MJ_POWER_WITH_MN_FUNCTIONS
        sdv_SetPowerIrpMinorFunction(pirp);
#endif
#ifdef SDV_FLAT_HARNESS_MODIFIER_IRP_MJ_POWER_WITH_IRP_MN_SET_POWER
       sdv_SetPowerIrpMinorFunctionSetPower(pirp);
#endif

        status = fun_IRP_MJ_POWER(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if ((SDV_HARNESS==SDV_PNP_HARNESS)||(SDV_HARNESS==SDV_POWER_DOWN_PNP_HARNESS_HARNESS)||(SDV_HARNESS==SDV_SMALL_START_SEQUENCE_HARNESS))
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif


#ifndef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_SHUTDOWN
        case IRP_MJ_SHUTDOWN:
        ps->MajorFunction = IRP_MJ_SHUTDOWN;
#ifdef fun_IRP_MJ_SHUTDOWN
        status = fun_IRP_MJ_SHUTDOWN(po,pirp);
        #if ( SDV_IS_XFLAT_HARNESS_CANCEL() )
            sdv_RunCancelFunction(po,pirp);
        #endif
        #if (SDV_HARNESS==SDV_PNP_HARNESS)
            sdv_RunISRRoutines(sdv_kinterrupt,sdv_pDpcContext);
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,sdv_pv1,sdv_pv2);
            sdv_RunIoDpcRoutines(sdv_kdpc,po,pirp,sdv_pIoDpcContext);
        #endif
#else
        status = sdv_DoNothing();
#endif
        break;
#endif


        default:
        status = sdv_DoNothing();
        break;
    }
    
    sdv_stub_dispatch_end(status,pirp);

    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
    return status;
}




NTSTATUS 
sdv_RunDispatchPnp(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_PNP" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    
    
    UCHAR minor_function = (UCHAR) SdvKeepChoice();

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
    sdv_SetStatus(pirp);

    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    


    ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    
    sdv_dpc_io_registered = FALSE;
    
    sdv_stub_dispatch_begin();
    ps->MajorFunction = IRP_MJ_PNP;
 
    if (ps->MinorFunction == IRP_MN_START_DEVICE) 
    {
        SdvAssume(!sdv_start_irp_already_issued);
    }

    if (ps->MinorFunction == IRP_MN_CANCEL_REMOVE_DEVICE) 
	{
	   SdvAssume(!sdv_remove_irp_already_issued);
	}
	if (ps->MinorFunction == IRP_MN_REMOVE_DEVICE) 
	{
            sdv_remove_irp_already_issued = 1;
#ifdef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_PNP_MN_REMOVE_DEVICE
            SdvExit();
#endif
    }

#ifdef fun_IRP_MJ_PNP
        
#ifdef SDV_NON_BUS_MN_FUNCTIONS
        sdv_SetIrpMinorFunctionNonBusDriver(pirp);
#endif

#ifdef SDV_FLAT_HARNESS_MODIFIER_IRP_MJ_PNP_WITH_IRP_MN_QUERY_DEVICE_RELATIONS
     sdv_SetIrpMinorFunctionBusDriver(pirp);
#endif


#ifdef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_PNP_WITH_IRP_MN_QUERY
    SdvAssume(ps->MinorFunction != IRP_MN_QUERY_INTERFACE);
    SdvAssume(ps->MinorFunction != IRP_MN_QUERY_STOP_DEVICE);
    SdvAssume(ps->MinorFunction != IRP_MN_QUERY_REMOVE_DEVICE);
#endif 


#ifdef SDV_FLAT_HARNESS_MODIFIER_NO_IRP_MJ_PNP_WITH_IRP_MN_START_DEVICE
    SdvAssume(ps->MinorFunction != IRP_MN_START_DEVICE);
#endif 

        status = fun_IRP_MJ_PNP(po,pirp);

#endif
    sdv_stub_dispatch_end(status,pirp);
    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
    return status;
}





NTSTATUS 
sdv_RunDispatchPower(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_POWER" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
        
    UCHAR minor_function = (UCHAR) SdvKeepChoice();
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
 
    sdv_SetStatus(pirp);

    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    


    ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    
    sdv_dpc_io_registered = FALSE;
    
    sdv_stub_dispatch_begin();
    ps->MajorFunction = IRP_MJ_POWER;
    
#ifdef fun_IRP_MJ_POWER
#ifndef SDV_FLAT_HARNESS_MODIFIER_IRP_MJ_POWER_WITH_MN_FUNCTIONS
        sdv_SetPowerIrpMinorFunction(pirp);
#endif
#ifdef SDV_FLAT_HARNESS_MODIFIER_IRP_MJ_POWER_WITH_IRP_MN_SET_POWER
       sdv_SetPowerIrpMinorFunctionSetPower(pirp);
#endif
        status = fun_IRP_MJ_POWER(po,pirp);
#endif
    
    sdv_stub_dispatch_end(status,pirp);
    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
    return status;
}










NTSTATUS 
sdv_RunDispatchWrite(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_WRITE" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    UCHAR minor_function = (UCHAR) SdvKeepChoice();
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
    sdv_SetStatus(pirp);
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;

	ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_dpc_io_registered = FALSE;
    sdv_stub_dispatch_begin();
    ps->MajorFunction = IRP_MJ_WRITE;
#ifdef fun_IRP_MJ_WRITE
        status = fun_IRP_MJ_WRITE(po,pirp);
#endif

    sdv_stub_dispatch_end(status,pirp);

    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
		return status;
}



NTSTATUS 
sdv_RunDispatchRead(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_READ" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    
	/* Valid Minor function codes for file system and filter drivers

	
		IRP_MN_COMPLETE
		 
		IRP_MN_COMPLETE_MDL
		 
		IRP_MN_COMPLETE_MDL_DPC
		 
		IRP_MN_COMPRESSED
		 
		IRP_MN_DPC
		 
		IRP_MN_MDL
		 
		IRP_MN_MDL_DPC
		 
		IRP_MN_NORMAL

    */

    UCHAR minor_function = (UCHAR) SdvKeepChoice();
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
    sdv_SetStatus(pirp);
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;

	ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_dpc_io_registered = FALSE;
    sdv_stub_dispatch_begin();
    ps->MajorFunction = IRP_MJ_READ;
#ifdef fun_IRP_MJ_READ
        status = fun_IRP_MJ_READ(po,pirp);
#endif

    sdv_stub_dispatch_end(status,pirp);
    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
		return status;
}



NTSTATUS 
sdv_RunDispatchInternalDeviceControl(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_INTERNAL_DEVICE_CONTROL" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    UCHAR minor_function = (UCHAR) SdvKeepChoice();
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
    sdv_SetStatus(pirp);
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;

	ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_dpc_io_registered = FALSE;
    sdv_stub_dispatch_begin();
    ps->MajorFunction = IRP_MJ_INTERNAL_DEVICE_CONTROL;
#ifdef fun_IRP_MJ_INTERNAL_DEVICE_CONTROL
        status = fun_IRP_MJ_INTERNAL_DEVICE_CONTROL(po,pirp);
#endif

    sdv_stub_dispatch_end(status,pirp);
    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
    return status;
}


NTSTATUS 
sdv_RunDispatchDeviceControl(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_DEVICE_CONTROL" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    UCHAR minor_function = (UCHAR) SdvKeepChoice();
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
    sdv_SetStatus(pirp);
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;

	ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_dpc_io_registered = FALSE;
    sdv_stub_dispatch_begin();
    ps->MajorFunction = IRP_MJ_DEVICE_CONTROL;
#ifdef fun_IRP_MJ_DEVICE_CONTROL
        status = fun_IRP_MJ_DEVICE_CONTROL(po,pirp);
#endif

    sdv_stub_dispatch_end(status,pirp);
    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
    return status;
}



NTSTATUS 
sdv_RunDispatchCreate(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_CREATE" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    UCHAR minor_function = (UCHAR) SdvKeepChoice();
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
    sdv_SetStatus(pirp);
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;

	ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_dpc_io_registered = FALSE;
    sdv_stub_dispatch_begin();
    ps->MajorFunction = IRP_MJ_CREATE;
#ifdef fun_IRP_MJ_CREATE
        status = fun_IRP_MJ_CREATE(po,pirp);
#endif

    sdv_stub_dispatch_end(status,pirp);
    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
    return status;
}


NTSTATUS 
sdv_RunDispatchClose(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_CLOSE" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    UCHAR minor_function = (UCHAR) SdvKeepChoice();
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
    sdv_SetStatus(pirp);
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;

	ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_dpc_io_registered = FALSE;
    sdv_stub_dispatch_begin();
    ps->MajorFunction = IRP_MJ_CLOSE;
#ifdef fun_IRP_MJ_CLOSE
        status = fun_IRP_MJ_CLOSE(po,pirp);
#endif

    sdv_stub_dispatch_end(status,pirp);
    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
		return status;
}


NTSTATUS 
sdv_RunDispatchSystemControl(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_SYSTEM_CONTROL" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    UCHAR minor_function = (UCHAR) SdvKeepChoice();
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
    sdv_SetStatus(pirp);
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;

	ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_dpc_io_registered = FALSE;
    sdv_stub_dispatch_begin();
    ps->MajorFunction = IRP_MJ_SYSTEM_CONTROL;
#ifdef fun_IRP_MJ_SYSTEM_CONTROL
        status = fun_IRP_MJ_SYSTEM_CONTROL(po,pirp);
#endif

    sdv_stub_dispatch_end(status,pirp);
    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
    return status;
}




NTSTATUS 
sdv_RunDispatchShutdown(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_SHUTDOWN" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    UCHAR minor_function = (UCHAR) SdvKeepChoice();
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
    sdv_SetStatus(pirp);
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;

	ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_dpc_io_registered = FALSE;
    sdv_stub_dispatch_begin();
    ps->MajorFunction = IRP_MJ_SHUTDOWN;
#ifdef fun_IRP_MJ_SHUTDOWN
        status = fun_IRP_MJ_SHUTDOWN(po,pirp);
#endif

    sdv_stub_dispatch_end(status,pirp);
    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
    return status;
}





NTSTATUS 
sdv_RunDispatchCleanup(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate dispatch function, and then applies it to the
    IRP argument.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_CLEANUP" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    UCHAR minor_function = (UCHAR) SdvKeepChoice();
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    pirp->PendingReturned = 0;
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
    sdv_SetStatus(pirp);
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;

	ps->MinorFunction = minor_function;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_dpc_io_registered = FALSE;
    sdv_stub_dispatch_begin();
    ps->MajorFunction = IRP_MJ_CLEANUP;
#ifdef fun_IRP_MJ_CLEANUP
        status = fun_IRP_MJ_CLEANUP(po,pirp);
#endif

    sdv_stub_dispatch_end(status,pirp);
    sdv_end_info = (ULONG_PTR) (pirp->IoStatus.Information);
    return status;
}




VOID 
sdv_RunCancelFunction(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

    Finds the appropriate Cancel function for the IRP, and then call that 
    cancelation routine in the driver.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we have no return value for this function.

Notes:
    
    We will execute the correct Cancel routine for the driver.
    The Cancel routine is set by calling IoSetCancelationRoutine on the Irp.
    After the Cancelation routine has pirp->CancelRoutine should be set to NULL
    This is done in SDV_MACRO_STUB_CANCEL_END;.

*/
{
   
#ifdef fun_DRIVER_CANCEL_1    
    if(pirp->CancelRoutine!=0&&pirp->CancelRoutine==fun_DRIVER_CANCEL_1)
	{
	  SDV_MACRO_STUB_CANCEL_BEGIN(pirp);
	  pirp->Cancel = TRUE;
	  fun_DRIVER_CANCEL_1(po, pirp);
	  pirp->Cancel = FALSE;
	  SDV_MACRO_STUB_CANCEL_END(pirp);
	}
#endif
#ifdef fun_DRIVER_CANCEL_2    
    if(pirp->CancelRoutine!=0&&pirp->CancelRoutine==fun_DRIVER_CANCEL_2)
	{
	  SDV_MACRO_STUB_CANCEL_BEGIN(pirp);
	  pirp->Cancel = TRUE;
	  fun_DRIVER_CANCEL_2(po, pirp);
	  pirp->Cancel = FALSE;
	  SDV_MACRO_STUB_CANCEL_END(pirp);
	}
#endif
#ifdef fun_DRIVER_CANCEL_3    
    if(pirp->CancelRoutine!=0&&pirp->CancelRoutine==fun_DRIVER_CANCEL_3)
	{
	  SDV_MACRO_STUB_CANCEL_BEGIN(pirp);
	  pirp->Cancel = TRUE;
	  fun_DRIVER_CANCEL_3(po, pirp);
	  pirp->Cancel = FALSE;
	  SDV_MACRO_STUB_CANCEL_END(pirp);
	}
#endif
#ifdef fun_DRIVER_CANCEL_4    
    if(pirp->CancelRoutine!=0&&pirp->CancelRoutine==fun_DRIVER_CANCEL_4)
	{
	  SDV_MACRO_STUB_CANCEL_BEGIN(pirp);
	  pirp->Cancel = TRUE;
	  fun_DRIVER_CANCEL_4(po, pirp);
	  pirp->Cancel = FALSE;
	  SDV_MACRO_STUB_CANCEL_END(pirp);
	}
#endif
#ifdef fun_DRIVER_CANCEL_5    
    if(pirp->CancelRoutine!=0&&pirp->CancelRoutine==fun_DRIVER_CANCEL_5)
	{
	  SDV_MACRO_STUB_CANCEL_BEGIN(pirp);
	  pirp->Cancel = TRUE;
	  fun_DRIVER_CANCEL_5(po, pirp);
	  pirp->Cancel = FALSE;
	  SDV_MACRO_STUB_CANCEL_END(pirp);
	}
#endif
#ifdef fun_DRIVER_CANCEL_6    
    if(pirp->CancelRoutine!=0&&pirp->CancelRoutine==fun_DRIVER_CANCEL_6)
	{
	  SDV_MACRO_STUB_CANCEL_BEGIN(pirp);
	  pirp->Cancel = TRUE;
	  fun_DRIVER_CANCEL_6(po, pirp);
	  pirp->Cancel = FALSE;
	  SDV_MACRO_STUB_CANCEL_END(pirp);
	}
#endif
#ifdef fun_DRIVER_CANCEL_7    
    if(pirp->CancelRoutine!=0&&pirp->CancelRoutine==fun_DRIVER_CANCEL_7)
	{
	  SDV_MACRO_STUB_CANCEL_BEGIN(pirp);
	  pirp->Cancel = TRUE;
	  fun_DRIVER_CANCEL_7(po, pirp);
	  pirp->Cancel = FALSE;
	  SDV_MACRO_STUB_CANCEL_END(pirp);
	}
#endif
}








BOOLEAN
sdv_RunPowerCompletionRoutines(
    IN PDEVICE_OBJECT DeviceObject,
    IN UCHAR MinorFunction,
    IN POWER_STATE PowerState,
    IN PVOID Context,
    IN PIO_STATUS_BLOCK IoStatus,
    PREQUEST_POWER_COMPLETE CompletionFunction
    )
    
/*

Routine Description:

    Finds the appropriate power completion function for the IRP, and then calls that 
    power completion routine in the driver.

Arguments:

    DeviceObject       - pointer to a device object.
    MinorFunction      - IRP_MN_SET_POWER,IRP_MN_QUERY_POWER or IRP_MN_WAIT_WAKE
	  PowerState         - Devive or System Power State determined by driver in Call to PoRequestPowerIrp.    
    Context            - context pointer.
    IoStatus           - IoStatus block associated with power Irp
    CompletionFunction - PowerCompletion routine passed to PoRequestPowerIrp.

Return value:

    we have no return value for this function.

Notes:
    
    We will execute the correct power completion routine for the driver.
    Completion routine us set by calling PoRequestPowerIrp.
    

*/
{
BOOLEAN CompletionFunction_run=FALSE;
#ifdef fun_REQUEST_POWER_COMPLETE_1
if(CompletionFunction == fun_REQUEST_POWER_COMPLETE_1)
{
    sdv_stub_power_completion_begin();
    fun_REQUEST_POWER_COMPLETE_1(DeviceObject,MinorFunction,PowerState,Context,IoStatus);   
    SDV_IRQL_POP();
    CompletionFunction_run=TRUE;
}
#endif
#ifdef fun_REQUEST_POWER_COMPLETE_2
if(CompletionFunction == fun_REQUEST_POWER_COMPLETE_2)
{
    sdv_stub_power_completion_begin();
    fun_REQUEST_POWER_COMPLETE_2(DeviceObject,MinorFunction,PowerState,Context,IoStatus);   
    SDV_IRQL_POP();
    CompletionFunction_run=TRUE;
}
#endif
#ifdef fun_REQUEST_POWER_COMPLETE_3
if(CompletionFunction == fun_REQUEST_POWER_COMPLETE_3)
{
    sdv_stub_power_completion_begin();
    fun_REQUEST_POWER_COMPLETE_3(DeviceObject,MinorFunction,PowerState,Context,IoStatus);   
    SDV_IRQL_POP();
    CompletionFunction_run=TRUE;
}
#endif
#ifdef fun_REQUEST_POWER_COMPLETE_4
if(CompletionFunction == fun_REQUEST_POWER_COMPLETE_4)
{
    sdv_stub_power_completion_begin();
    fun_REQUEST_POWER_COMPLETE_4(DeviceObject,MinorFunction,PowerState,Context,IoStatus);   
    SDV_IRQL_POP();
    CompletionFunction_run=TRUE;
}
#endif
#ifdef fun_REQUEST_POWER_COMPLETE_5
if(CompletionFunction == fun_REQUEST_POWER_COMPLETE_5)
{
    sdv_stub_power_completion_begin();
    fun_REQUEST_POWER_COMPLETE_5(DeviceObject,MinorFunction,PowerState,Context,IoStatus);   
    SDV_IRQL_POP();
    CompletionFunction_run=TRUE;
}
#endif
#ifdef fun_REQUEST_POWER_COMPLETE_6
if(CompletionFunction == fun_REQUEST_POWER_COMPLETE_6)
{
    sdv_stub_power_completion_begin();
    fun_REQUEST_POWER_COMPLETE_6(DeviceObject,MinorFunction,PowerState,Context,IoStatus);   
    SDV_IRQL_POP();
    CompletionFunction_run=TRUE;
}
#endif
#ifdef fun_REQUEST_POWER_COMPLETE_7
if(CompletionFunction == fun_REQUEST_POWER_COMPLETE_7)
{
    sdv_stub_power_completion_begin();
    fun_REQUEST_POWER_COMPLETE_7(DeviceObject,MinorFunction,PowerState,Context,IoStatus);   
    SDV_IRQL_POP();
    CompletionFunction_run=TRUE;
}
#endif
#ifdef fun_REQUEST_POWER_COMPLETE_8
if(CompletionFunction == fun_REQUEST_POWER_COMPLETE_8)
{
    sdv_stub_power_completion_begin();
    fun_REQUEST_POWER_COMPLETE_8(DeviceObject,MinorFunction,PowerState,Context,IoStatus);   
    SDV_IRQL_POP();
    CompletionFunction_run=TRUE;
}
#endif
#ifdef fun_REQUEST_POWER_COMPLETE_9
if(CompletionFunction == fun_REQUEST_POWER_COMPLETE_9)
{
    sdv_stub_power_completion_begin();
    fun_REQUEST_POWER_COMPLETE_9(DeviceObject,MinorFunction,PowerState,Context,IoStatus);   
    SDV_IRQL_POP();
    CompletionFunction=TRUE;
}
#endif
#ifdef fun_REQUEST_POWER_COMPLETE_10
if(CompletionFunction == fun_REQUEST_POWER_COMPLETE_10)
{
    sdv_stub_power_completion_begin();
    fun_REQUEST_POWER_COMPLETE_10(DeviceObject,MinorFunction,PowerState,Context,IoStatus);   
    SDV_IRQL_POP();
    CompletionFunction_run=TRUE;
}
#endif
return CompletionFunction_run;
}


void
sdv_RunIoQueueWorkItems(
    IN PIO_WORKITEM IoWorkItem,
    IN PIO_WORKITEM_ROUTINE WorkerRoutine,
    IN WORK_QUEUE_TYPE QueueType,
    IN PVOID Context
    )
/*

Routine Description:

    Finds the appropriate worker routine for the workitem, and then calls that 
    routine in the driver.

Arguments:

    IoWorkItem - IO Work Item object.
	  WorkerRoutine - pointer to the work item routine.    
    WORK_QUEUE_TYPE - Queue type that stipulates the type of system worker thread to run the work item on.
    Context - driver specific information for the workitem.

Return value:

    we have no return value for this function.

Notes:
    
    
    The worker routine is set by calling IoQueueWorkItem.
    

*/

{
  
  #ifdef fun_IO_WORKITEM_ROUTINE_1
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_1)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_1(sdv_p_devobj_fdo,Context);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_2
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_2)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_2(sdv_p_devobj_fdo,Context);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_3
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_3)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_3(sdv_p_devobj_fdo,Context);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_4
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_4)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_4(sdv_p_devobj_fdo,Context);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_5
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_5)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_5(sdv_p_devobj_fdo,Context);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_6
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_6)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_6(sdv_p_devobj_fdo,Context);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_7
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_7)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_7(sdv_p_devobj_fdo,Context);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_8
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_8)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_8(sdv_p_devobj_fdo,Context);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_9
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_9)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_9(sdv_p_devobj_fdo,Context);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_10
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_10)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_10(sdv_p_devobj_fdo,Context);  
      SDV_IRQL_POP();
  }
  #endif
}


void
sdv_RunExQueueWorkItems(
    PWORKER_THREAD_ROUTINE WorkerRoutine,
    PVOID Context
    )
/*

Routine Description:

    Finds the appropriate worker routine for the workitem, and then calls that 
    routine in the driver.

Arguments:

	  WorkerRoutine - pointer to the work item routine.    
    Context - driver specific information for the workitem.

Return value:

    we have no return value for this function.

Notes:
    
    
    The worker routine is set by calling ExInitializeWorkItem.
    

*/

{
  
  #ifdef fun_WORKER_THREAD_ROUTINE_1
  if(WorkerRoutine == fun_WORKER_THREAD_ROUTINE_1)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_WORKER_THREAD_ROUTINE_1(Context);  
      SDV_IRQL_POP();
  }
  #endif

  #ifdef fun_WORKER_THREAD_ROUTINE_2
  if(WorkerRoutine == fun_WORKER_THREAD_ROUTINE_2)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_WORKER_THREAD_ROUTINE_2(Context);  
      SDV_IRQL_POP();
  }
  #endif

  #ifdef fun_WORKER_THREAD_ROUTINE_3
  if(WorkerRoutine == fun_WORKER_THREAD_ROUTINE_3)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_WORKER_THREAD_ROUTINE_3(Context);  
      SDV_IRQL_POP();
  }
  #endif

  #ifdef fun_WORKER_THREAD_ROUTINE_4
  if(WorkerRoutine == fun_WORKER_THREAD_ROUTINE_4)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_WORKER_THREAD_ROUTINE_4(Context);  
      SDV_IRQL_POP();
  }
  #endif

  #ifdef fun_WORKER_THREAD_ROUTINE_5
  if(WorkerRoutine == fun_WORKER_THREAD_ROUTINE_5)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_WORKER_THREAD_ROUTINE_5(Context);  
      SDV_IRQL_POP();
  }
  #endif

  #ifdef fun_WORKER_THREAD_ROUTINE_6
  if(WorkerRoutine == fun_WORKER_THREAD_ROUTINE_6)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_WORKER_THREAD_ROUTINE_6(Context);  
      SDV_IRQL_POP();
  }
  #endif
  
}










NTSTATUS
sdv_RunIoCompletionRoutines(
    __in PDEVICE_OBJECT DeviceObject, 
    __in PIRP Irp, 
    __in_opt PVOID Context,
    BOOLEAN* Completion_Routine_Called
    )
/*

Routine Description:

    Finds the appropriate completion function for the IRP, and then calls that 
    completion routine in the driver.

Arguments:

    DeviceObject - pointer to a device object.
	po - pointer to the device object.    
    Context - context pointer.

Return value:

    we have no return value for this function.

Notes:
    
    We will execute the correct completion routine for the driver.
    The completion routine is set by calling IoSetConpletionRoutine on the Irp.
    

*/
{
PIO_STACK_LOCATION irpsp;    
NTSTATUS Status;
irpsp = sdv_IoGetNextIrpStackLocation(Irp);
Status=STATUS_SUCCESS;
#ifdef fun_IO_COMPLETION_ROUTINE_1
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_1)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_1(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
#ifdef fun_IO_COMPLETION_ROUTINE_2
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_2)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_2(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
#ifdef fun_IO_COMPLETION_ROUTINE_3
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_3)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_3(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
#ifdef fun_IO_COMPLETION_ROUTINE_4
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_4)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_4(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
#ifdef fun_IO_COMPLETION_ROUTINE_5
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_5)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_5(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
#ifdef fun_IO_COMPLETION_ROUTINE_6
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_6)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_6(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
#ifdef fun_IO_COMPLETION_ROUTINE_7
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_7)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_7(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
#ifdef fun_IO_COMPLETION_ROUTINE_8
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_8)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_8(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
#ifdef fun_IO_COMPLETION_ROUTINE_9
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_9)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_9(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
#ifdef fun_IO_COMPLETION_ROUTINE_10
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_10)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_10(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
#ifdef fun_IO_COMPLETION_ROUTINE_11
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_11)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_11(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
#ifdef fun_IO_COMPLETION_ROUTINE_12
if(irpsp->CompletionRoutine == fun_IO_COMPLETION_ROUTINE_12)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    Status=fun_IO_COMPLETION_ROUTINE_12(DeviceObject,Irp,Context);  
    SDV_IRQL_POP();
    *Completion_Routine_Called=TRUE;
}
#endif
return Status;
}


void
sdv_RunIoQueueWorkItemsEx(
    IN PIO_WORKITEM IoWorkItem,
    IN PIO_WORKITEM_ROUTINE_EX WorkerRoutine,
    IN WORK_QUEUE_TYPE QueueType,
    IN PVOID Context
    )
/*

Routine Description:

    Finds the appropriate worker routine for the workitem, and then calls that 
    routine in the driver.

Arguments:

    IoWorkItem - IO Work Item object.
	  WorkerRoutine - pointer to the work item routine.    
    WORK_QUEUE_TYPE - Queue type that stipulates the type of system worker thread to run the work item on.
    Context - driver specific information for the workitem.

Return value:

    we have no return value for this function.

Notes:
    
    
    The worker routine is set by calling IoQueueWorkItemEx.
    

*/

{
  PVOID  IoObject=(PVOID)sdv_p_devobj_fdo;
  #ifdef fun_IO_WORKITEM_ROUTINE_EX_1
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_EX_1)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_EX_1(IoObject,Context,IoWorkItem);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_EX_2
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_EX_2)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_EX_2(IoObject,Context,IoWorkItem);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_EX_3
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_EX_3)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_EX_3(IoObject,Context,IoWorkItem);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_EX_3
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_EX_3)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_EX_3(IoObject,Context,IoWorkItem);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_EX_4
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_EX_4)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_EX_4(IoObject,Context,IoWorkItem);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_EX_5
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_EX_5)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_EX_5(IoObject,Context,IoWorkItem);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_EX_6
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_EX_6)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_EX_6(IoObject,Context,IoWorkItem);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_EX_7
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_EX_7)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_EX_7(IoObject,Context,IoWorkItem);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_EX_8
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_EX_8)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_EX_8(IoObject,Context,IoWorkItem);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_EX_9
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_EX_9)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_EX_9(IoObject,Context,IoWorkItem);  
      SDV_IRQL_POP();
  }
  #endif
  #ifdef fun_IO_WORKITEM_ROUTINE_EX_10
  if(WorkerRoutine == fun_IO_WORKITEM_ROUTINE_EX_10)
  {
      SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_IO_WORKITEM_ROUTINE_EX_10(IoObject,Context,IoWorkItem);  
      SDV_IRQL_POP();
  }
  #endif
}


VOID
sdv_RunISRRoutines(
    struct _KINTERRUPT *ki, 
    PVOID pv1
    )
/*

Routine Description:

    Finds the appropriate ISR function and then calls that 
    ISR routine in the driver.

Arguments:

    ki - Points to the Interrupt object for this device.
	  pv1 - Context.    
    
Return value:

    we have no return value for this function.

Notes:
    
    We will execute the correct ISR routine for the driver.
    The ISR routine is set by calling IoConnectInterrupt function.
    

*/
{
#ifdef fun_KSERVICE_ROUTINE_1
       if(sdv_isr_routine==fun_KSERVICE_ROUTINE_1)
       {
           SDV_IRQL_PUSH(SDV_DIRQL);
           fun_KSERVICE_ROUTINE_1(ki, pv1);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KSERVICE_ROUTINE_2
       if(sdv_isr_routine==fun_KSERVICE_ROUTINE_2)
       {
           SDV_IRQL_PUSH(SDV_DIRQL);
           fun_KSERVICE_ROUTINE_2(ki, pv1);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KSERVICE_ROUTINE_3
       if(sdv_isr_routine==fun_KSERVICE_ROUTINE_3)
       {
           SDV_IRQL_PUSH(SDV_DIRQL);
           fun_KSERVICE_ROUTINE_3(ki, pv1);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KSERVICE_ROUTINE_4
       if(sdv_isr_routine==fun_KSERVICE_ROUTINE_4)
       {
           SDV_IRQL_PUSH(SDV_DIRQL);
           fun_KSERVICE_ROUTINE_4(ki, pv1);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KSERVICE_ROUTINE_5
       if(sdv_isr_routine==fun_KSERVICE_ROUTINE_5)
       {
           SDV_IRQL_PUSH(SDV_DIRQL);
           fun_KSERVICE_ROUTINE_5(ki, pv1);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KSERVICE_ROUTINE_6
       if(sdv_isr_routine==fun_KSERVICE_ROUTINE_6)
       {
           SDV_IRQL_PUSH(SDV_DIRQL);
           fun_KSERVICE_ROUTINE_6(ki, pv1);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif

}


VOID
sdv_RunKeDpcRoutines(
    IN struct _KDPC *kdpc, 
    IN PVOID pDpcContext, 
    IN PVOID pv2, 
    IN PVOID pv3
    )
/*

Routine Description:

    Finds the appropriate Dpc function and then calls that 
    Dpc routine in the driver.

Arguments:

    kdpc - Pointer to the KDPC structure for the DPC object.
	  pDpcContext -  Caller-supplied pointer to driver-defined context information that was specified in a previous call to KeInitializeDpc.
	  pv2 -  Caller-supplied pointer to driver-supplied information that was specified in a previous call to KeInsertQueueDpc.  
	  pv3 -  Caller-supplied pointer to driver-supplied information that was specified in a previous call to KeInsertQueueDpc.
    
Return value:

    we have no return value for this function.

Notes:
    
    We will execute the correct DPC routine for the driver.

*/
{
#ifdef fun_KDEFERRED_ROUTINE_1
       if(kdpc->DeferredRoutine==fun_KDEFERRED_ROUTINE_1&&sdv_dpc_ke_registered)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_KDEFERRED_ROUTINE_1(kdpc,pDpcContext,sdv_pv2,sdv_pv3);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KDEFERRED_ROUTINE_2
       if(kdpc->DeferredRoutine==fun_KDEFERRED_ROUTINE_2&&sdv_dpc_ke_registered)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_KDEFERRED_ROUTINE_2(kdpc,pDpcContext,sdv_pv2,sdv_pv3);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KDEFERRED_ROUTINE_3
       if(kdpc->DeferredRoutine==fun_KDEFERRED_ROUTINE_3&&sdv_dpc_ke_registered)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_KDEFERRED_ROUTINE_3(kdpc,pDpcContext,sdv_pv2,sdv_pv3);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KDEFERRED_ROUTINE_4
       if(kdpc->DeferredRoutine==fun_KDEFERRED_ROUTINE_4&&sdv_dpc_ke_registered)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_KDEFERRED_ROUTINE_4(kdpc,pDpcContext,sdv_pv2,sdv_pv3);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KDEFERRED_ROUTINE_5
       if(kdpc->DeferredRoutine==fun_KDEFERRED_ROUTINE_5&&sdv_dpc_ke_registered)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_KDEFERRED_ROUTINE_5(kdpc,pDpcContext,sdv_pv2,sdv_pv3);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KDEFERRED_ROUTINE_6
       if(kdpc->DeferredRoutine==fun_KDEFERRED_ROUTINE_6&&sdv_dpc_ke_registered)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_KDEFERRED_ROUTINE_6(kdpc,pDpcContext,sdv_pv2,sdv_pv3);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KDEFERRED_ROUTINE_7
       if(kdpc->DeferredRoutine==fun_KDEFERRED_ROUTINE_7&&sdv_dpc_ke_registered)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_KDEFERRED_ROUTINE_7(kdpc,pDpcContext,sdv_pv2,sdv_pv3);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KDEFERRED_ROUTINE_8
       if(kdpc->DeferredRoutine==fun_KDEFERRED_ROUTINE_8&&sdv_dpc_ke_registered)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_KDEFERRED_ROUTINE_8(kdpc,pDpcContext,sdv_pv2,sdv_pv3);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_KDEFERRED_ROUTINE_9
       if(kdpc->DeferredRoutine==fun_KDEFERRED_ROUTINE_9&&sdv_dpc_ke_registered)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_KDEFERRED_ROUTINE_9(kdpc,pDpcContext,sdv_pv2,sdv_pv3);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
}




VOID
sdv_RunIoDpcRoutines(
    IN PKDPC  Dpc,    
    IN struct _DEVICE_OBJECT  *DeviceObject,    
    IN struct _IRP  *Irp,    
    IN PVOID  Context
    )
/*

Routine Description:

    Finds the appropriate Dpc function and then calls that 
    Dpc routine in the driver.

Arguments:

    dpc          -  Pointer to the KDPC structure for the DPC object.
	  DeviceObject -  Caller-supplied pointer to a DEVICE_OBJECT structure. This is the device object for the target device, previously created by the driver's AddDevice routine
	  Irp          -  Caller-supplied pointer to an IRP structure that describes the I/O operation. 
	  Context      -  Caller-supplied pointer to driver-defined context information, specified in a previous call to IoRequestDpc.
    
Return value:

    we have no return value for this function.

Notes:
    
    We will execute the correct IO DPC routine for the driver.

*/
{
#ifdef fun_IO_DPC_ROUTINE_1
if(sdv_io_dpc==fun_IO_DPC_ROUTINE_1&&sdv_dpc_io_registered)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    fun_IO_DPC_ROUTINE_1(Dpc,DeviceObject,Irp,Context); 
    SDV_IRQL_POPTO(PASSIVE_LEVEL);
}
#endif 
#ifdef fun_IO_DPC_ROUTINE_2
if(sdv_io_dpc==fun_IO_DPC_ROUTINE_2&&sdv_dpc_io_registered)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    fun_IO_DPC_ROUTINE_2(Dpc,DeviceObject,Irp,Context); 
    SDV_IRQL_POPTO(PASSIVE_LEVEL);
}
#endif 
#ifdef fun_IO_DPC_ROUTINE_3
if(sdv_io_dpc==fun_IO_DPC_ROUTINE_3&&sdv_dpc_io_registered)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    fun_IO_DPC_ROUTINE_3(Dpc,DeviceObject,Irp,Context); 
    SDV_IRQL_POPTO(PASSIVE_LEVEL);
}
#endif 
#ifdef fun_IO_DPC_ROUTINE_4
if(sdv_io_dpc==fun_IO_DPC_ROUTINE_4&&sdv_dpc_io_registered)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    fun_IO_DPC_ROUTINE_4(Dpc,DeviceObject,Irp,Context); 
    SDV_IRQL_POPTO(PASSIVE_LEVEL);
}
#endif 
#ifdef fun_IO_DPC_ROUTINE_5
if(sdv_io_dpc==fun_IO_DPC_ROUTINE_5&&sdv_dpc_io_registered)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    fun_IO_DPC_ROUTINE_5(Dpc,DeviceObject,Irp,Context); 
    SDV_IRQL_POPTO(PASSIVE_LEVEL);
}
#endif 
#ifdef fun_IO_DPC_ROUTINE_6
if(sdv_io_dpc==fun_IO_DPC_ROUTINE_6&&sdv_dpc_io_registered)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    fun_IO_DPC_ROUTINE_6(Dpc,DeviceObject,Irp,Context); 
    SDV_IRQL_POPTO(PASSIVE_LEVEL);
}
#endif 
}


BOOLEAN
sdv_RunKSynchronizeRoutines(
    PKSYNCHRONIZE_ROUTINE SynchronizeRoutine,
    PVOID  Context
    )
/*

Routine Description:

    Finds the appropriate KSYNCHRONIZE function and then calls that 
    KSYNCHRONIZE routine in the driver.

Arguments:

    Context      -  Caller-supplied pointer to driver-defined context information, specified in a previous call to KeSynchronizeExecution.
    
Return value:

    we have FALSE in case no KSYNCHRONIZE declared otherwise will return value from KSYNCHRONIZE routine.

Notes:
    
    We will execute the correct KSYNCHRONIZE routine for the driver.

*/
{

#ifdef fun_KSYNCHRONIZE_ROUTINE_1
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_1)
{
    return fun_KSYNCHRONIZE_ROUTINE_1(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_2
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_2)
{
    return fun_KSYNCHRONIZE_ROUTINE_2(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_3
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_3)
{
    return fun_KSYNCHRONIZE_ROUTINE_3(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_4
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_4)
{
    return fun_KSYNCHRONIZE_ROUTINE_4(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_5
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_5)
{
    return fun_KSYNCHRONIZE_ROUTINE_5(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_6
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_6)
{
    return fun_KSYNCHRONIZE_ROUTINE_6(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_7
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_7)
{
    return fun_KSYNCHRONIZE_ROUTINE_7(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_8
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_8)
{
    return fun_KSYNCHRONIZE_ROUTINE_8(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_9
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_9)
{
    return fun_KSYNCHRONIZE_ROUTINE_9(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_10
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_10)
{
    return fun_KSYNCHRONIZE_ROUTINE_10(Context); 
}
#endif 

#ifdef fun_KSYNCHRONIZE_ROUTINE_11
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_11)
{
    return fun_KSYNCHRONIZE_ROUTINE_11(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_12
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_12)
{
    return fun_KSYNCHRONIZE_ROUTINE_12(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_13
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_13)
{
    return fun_KSYNCHRONIZE_ROUTINE_13(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_14
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_14)
{
    return fun_KSYNCHRONIZE_ROUTINE_14(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_15
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_15)
{
    return fun_KSYNCHRONIZE_ROUTINE_15(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_16
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_16)
{
    return fun_KSYNCHRONIZE_ROUTINE_16(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_17
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_17)
{
    return fun_KSYNCHRONIZE_ROUTINE_17(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_18
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_18)
{
    return fun_KSYNCHRONIZE_ROUTINE_18(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_19
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_19)
{
    return fun_KSYNCHRONIZE_ROUTINE_19(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_20
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_20)
{
    return fun_KSYNCHRONIZE_ROUTINE_20(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_21
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_21)
{
    return fun_KSYNCHRONIZE_ROUTINE_21(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_22
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_22)
{
    return fun_KSYNCHRONIZE_ROUTINE_22(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_23
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_23)
{
    return fun_KSYNCHRONIZE_ROUTINE_23(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_24
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_24)
{
    return fun_KSYNCHRONIZE_ROUTINE_24(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_25
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_25)
{
    return fun_KSYNCHRONIZE_ROUTINE_25(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_26
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_26)
{
    return fun_KSYNCHRONIZE_ROUTINE_26(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_27
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_27)
{
    return fun_KSYNCHRONIZE_ROUTINE_27(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_28
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_28)
{
    return fun_KSYNCHRONIZE_ROUTINE_28(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_29
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_29)
{
    return fun_KSYNCHRONIZE_ROUTINE_29(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_30
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_30)
{
    return fun_KSYNCHRONIZE_ROUTINE_30(Context); 
}
#endif 

#ifdef fun_KSYNCHRONIZE_ROUTINE_31
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_31)
{
    return fun_KSYNCHRONIZE_ROUTINE_31(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_32
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_32)
{
    return fun_KSYNCHRONIZE_ROUTINE_32(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_33
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_33)
{
    return fun_KSYNCHRONIZE_ROUTINE_33(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_34
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_34)
{
    return fun_KSYNCHRONIZE_ROUTINE_34(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_35
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_35)
{
    return fun_KSYNCHRONIZE_ROUTINE_35(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_36
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_36)
{
    return fun_KSYNCHRONIZE_ROUTINE_36(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_37
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_37)
{
    return fun_KSYNCHRONIZE_ROUTINE_37(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_38
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_38)
{
    return fun_KSYNCHRONIZE_ROUTINE_38(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_39
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_39)
{
    return fun_KSYNCHRONIZE_ROUTINE_39(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_40
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_40)
{
    return fun_KSYNCHRONIZE_ROUTINE_40(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_41
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_41)
{
    return fun_KSYNCHRONIZE_ROUTINE_41(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_42
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_42)
{
    return fun_KSYNCHRONIZE_ROUTINE_42(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_43
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_43)
{
    return fun_KSYNCHRONIZE_ROUTINE_43(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_44
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_44)
{
    return fun_KSYNCHRONIZE_ROUTINE_44(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_45
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_45)
{
    return fun_KSYNCHRONIZE_ROUTINE_45(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_46
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_46)
{
    return fun_KSYNCHRONIZE_ROUTINE_46(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_47
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_47)
{
    return fun_KSYNCHRONIZE_ROUTINE_47(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_48
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_48)
{
    return fun_KSYNCHRONIZE_ROUTINE_48(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_49
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_49)
{
    return fun_KSYNCHRONIZE_ROUTINE_49(Context); 
}
#endif 
#ifdef fun_KSYNCHRONIZE_ROUTINE_50
if(SynchronizeRoutine==fun_KSYNCHRONIZE_ROUTINE_50)
{
    return fun_KSYNCHRONIZE_ROUTINE_50(Context); 
}
#endif 
return FALSE;
}



NTSTATUS 
sdv_RunQueryDeviceRelations(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Call PNP dispatch with IRP_MN_QUERY_DEVICE_RELATIONS

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    

*/
{
    NTSTATUS status=STATUS_SUCCESS;
    long type_choice = SdvMakeChoice();
    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    sdv_end_info = sdv_start_info = (ULONG_PTR) (pirp->IoStatus.Information);
    sdv_SetStatus(pirp);
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->MinorFunction = IRP_MN_QUERY_DEVICE_RELATIONS;
    ps->MajorFunction = IRP_MJ_PNP;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
#ifdef BUS_RELATIONS
    switch(type_choice)
    {
    case 0:
      ps->Parameters.QueryDeviceRelations.Type  = BusRelations;
      break;
    case 0:
      ps->Parameters.QueryDeviceRelations.Type  = TargetDeviceRelation;
      break;
    default:
      ps->Parameters.QueryDeviceRelations.Type  = EjectionRelations;  
      break;
    }
#else
    ps->Parameters.QueryDeviceRelations.Type  = RemovalRelations;
#endif

#ifdef fun_IRP_MJ_PNP
        status = fun_IRP_MJ_PNP(po,pirp);
#endif

	return status;
}


NTSTATUS 
sdv_RunStartDevice(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the start device function

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

Notes:
    
    We're interacting with SDV meta-data here.  If "fun_IRP_MJ_CREATE" is
    defined in the meta-data, then we're calling it.  Otherwise: we call
    the sdv_DoNothing() function.

*/
{
    NTSTATUS status=STATUS_SUCCESS;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = IRP_MJ_PNP;
    ps->MinorFunction = IRP_MN_START_DEVICE;
    pirp->IoStatus.Status = STATUS_SUCCESS;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    
    sdv_SetStatus(pirp);
    sdv_start_irp_already_issued = 1;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();

    sdv_stub_dispatch_begin();
   
    #ifdef fun_IRP_MJ_PNP
        status = fun_IRP_MJ_PNP(po,pirp);
    #endif
    sdv_stub_dispatch_end(status,pirp);

    return status;
}


NTSTATUS 
sdv_RunRemoveDevice(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the remove device function

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status=STATUS_SUCCESS;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = IRP_MJ_PNP;
    ps->MinorFunction = IRP_MN_REMOVE_DEVICE;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    
    sdv_stub_dispatch_begin();


    sdv_SetStatus(pirp);

    
   
    #ifdef fun_IRP_MJ_PNP
        status = fun_IRP_MJ_PNP(po,pirp);
    #endif
    sdv_stub_dispatch_end(status,pirp);

    return status;

}


NTSTATUS 
sdv_RunQueryCapRequirements(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the IRP_MN_QUERY_CAPABILITIES irp thru the driver
   The PnP manager sends this IRP to get the capabilities of a device

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = IRP_MJ_PNP;
    ps->MinorFunction = IRP_MN_QUERY_CAPABILITIES;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_stub_dispatch_begin();
    sdv_SetStatus(pirp);
   
    #ifdef fun_IRP_MJ_PNP
        status = fun_IRP_MJ_PNP(po,pirp);
    #endif
    sdv_stub_dispatch_end(status,pirp);

    return status;

}


NTSTATUS 
sdv_RunQueryRemoveDevice(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the IRP_MN_QUERY_REMOVE_DEVICE irp thru the driver

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = IRP_MJ_PNP;
    ps->MinorFunction = IRP_MN_QUERY_REMOVE_DEVICE;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_SetStatus(pirp);
   
    #ifdef fun_IRP_MJ_PNP
        status = fun_IRP_MJ_PNP(po,pirp);
    #endif
    return status;

}



NTSTATUS 
sdv_RunSurpriseRemoveDevice(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the IRP_MN_SURPRISE_REMOVAL irp thru the driver

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = IRP_MJ_PNP;
    ps->MinorFunction =IRP_MN_SURPRISE_REMOVAL;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_SetStatus(pirp);
   
    #ifdef fun_IRP_MJ_PNP
        status = fun_IRP_MJ_PNP(po,pirp);
    #endif
    return status;

}


NTSTATUS 
sdv_RunResRequirements(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the IRP_MN_FILTER_RESOURCE_REQUIREMENTS irp thru the driver
   The PnP manager sends this IRP to a device stack so the function driver can adjust the resources required by the device.
   BUS driver should not handle this IRP.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = IRP_MJ_PNP;
    ps->MinorFunction = IRP_MN_FILTER_RESOURCE_REQUIREMENTS;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_SetStatus(pirp);
   
    #ifdef fun_IRP_MJ_PNP
        status = fun_IRP_MJ_PNP(po,pirp);
    #endif
    return status;

}



NTSTATUS 
sdv_RunQueryDeviceState(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the IRP_MN_QUERY_DEVICE_STATE irp thru the driver
   No MSDN documentation on this Irp.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = IRP_MJ_PNP;
    ps->MinorFunction = IRP_MN_QUERY_PNP_DEVICE_STATE;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    sdv_SetStatus(pirp);
   
    #ifdef fun_IRP_MJ_PNP
        status = fun_IRP_MJ_PNP(po,pirp);
    #endif
    return status;

}



NTSTATUS 
sdv_RunQueryPowerUp(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the IRP_MN_QUERY_POWER irp thru the driver
   This IRP queries a device to determine whether the system power state or the device power state can be changed.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = IRP_MJ_POWER;
    ps->MinorFunction = IRP_MN_QUERY_POWER;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    ps->Parameters.Power.Type = SystemPowerState;
    sdv_SetStatus(pirp);
    ps->Parameters.Power.State.SystemState=PowerSystemWorking;
    #ifdef fun_IRP_MJ_POWER
        status = fun_IRP_MJ_POWER(po,pirp);
    #endif
    return status;

}


NTSTATUS 
sdv_RunQueryPowerUpDevice(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the IRP_MN_QUERY_POWER irp thru the driver
   This IRP queries a device to determine whether the system power state or the device power state can be changed.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = IRP_MJ_POWER;
    ps->MinorFunction = IRP_MN_QUERY_POWER;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    ps->Parameters.Power.Type = DevicePowerState;
    sdv_SetStatus(pirp);
    ps->Parameters.Power.State.DeviceState=PowerDeviceD0;
    #ifdef fun_IRP_MJ_POWER
        status = fun_IRP_MJ_POWER(po,pirp);
    #endif
    return status;

}




NTSTATUS 
sdv_RunQueryPowerDown(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the IRP_MN_SET_POWER irp thru the driver
   This IRP queries a device to determine whether the system power state or the device power state can be changed.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    LONG nd_state = SdvMakeChoice();
    ps->MajorFunction = IRP_MJ_POWER;
    ps->MinorFunction = IRP_MN_QUERY_POWER;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    ps->Parameters.Power.Type = SystemPowerState;
    sdv_SetStatus(pirp);
    switch (nd_state)
    { 
      case 0:
      ps->Parameters.Power.State.SystemState=PowerSystemSleeping1;
      break;
      case 1:
      ps->Parameters.Power.State.SystemState=PowerSystemSleeping2;
      break;
      case 2:
      ps->Parameters.Power.State.SystemState=PowerSystemSleeping3;
      break;
      case 3:
      ps->Parameters.Power.State.SystemState=PowerSystemHibernate;
      break;
      case 4:
      ps->Parameters.Power.State.SystemState=PowerSystemShutdown;
      break;
      default:
      ps->Parameters.Power.State.SystemState=PowerSystemMaximum;
      break;
    }
       
    #ifdef fun_IRP_MJ_POWER
        status = fun_IRP_MJ_POWER(po,pirp);
    #endif
    return status;

}



NTSTATUS 
sdv_RunSetPowerUp(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the IRP_MN_SET_POWER irp thru the driver
   This IRP notifies a driver of a change to the system power state or sets the device power state for a device.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = IRP_MJ_POWER;
    ps->MinorFunction = IRP_MN_SET_POWER;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    ps->Parameters.Power.Type = SystemPowerState;
    sdv_SetStatus(pirp);
    ps->Parameters.Power.State.SystemState=PowerSystemWorking;
    #ifdef fun_IRP_MJ_POWER
        status = fun_IRP_MJ_POWER(po,pirp);
    #endif
    return status;

}


NTSTATUS 
sdv_RunSetPowerDown(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the IRP_MN_SET_POWER irp thru the driver
   This IRP notifies a driver of a change to the system power state or sets the device power state for a device.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    LONG nd_state = SdvMakeChoice();
    ps->MajorFunction = IRP_MJ_POWER;
    ps->MinorFunction = IRP_MN_SET_POWER;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    ps->Parameters.Power.Type = SystemPowerState;
    sdv_SetStatus(pirp);
    switch (nd_state)
    { 
      case 0:
      ps->Parameters.Power.State.SystemState=PowerSystemSleeping1;
      break;
      case 1:
      ps->Parameters.Power.State.SystemState=PowerSystemSleeping2;
      break;
      case 2:
      ps->Parameters.Power.State.SystemState=PowerSystemSleeping3;
      break;
      case 3:
      ps->Parameters.Power.State.SystemState=PowerSystemHibernate;
      break;
      case 4:
      ps->Parameters.Power.State.SystemState=PowerSystemShutdown;
      break;
      default:
      ps->Parameters.Power.State.SystemState=PowerSystemMaximum;
      break;
    }
    
    #ifdef fun_IRP_MJ_POWER
        status = fun_IRP_MJ_POWER(po,pirp);
    #endif
    return status;

}


NTSTATUS 
sdv_RunSetPowerUpDevice(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
/*

Routine Description:

   Run the IRP_MN_SET_POWER irp thru the driver
   This IRP notifies a driver of a change to the system power state or sets the device power state for a device.

Arguments:

    po - pointer to the device object.    
    pirp - pointer to the irp that we're using.

Return value:

    we're passing the dispatch's return value back.

*/
{

    NTSTATUS status;

    PIO_STACK_LOCATION ps = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    ps->MajorFunction = IRP_MJ_POWER;
    ps->MinorFunction = IRP_MN_SET_POWER;
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    ps->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
    ps->Parameters.Power.Type = DevicePowerState;
    sdv_SetStatus(pirp);
    ps->Parameters.Power.State.DeviceState=PowerDeviceD0;
    #ifdef fun_IRP_MJ_POWER
        status = fun_IRP_MJ_POWER(po,pirp);
    #endif
    return status;

}


VOID
sdv_RunStartIo(
    PDEVICE_OBJECT po, 
    PIRP pirp
    )
{
    sdv_stub_startio_begin();
#ifdef fun_DriverStartIo
    pirp->CancelRoutine = NULL;
    pirp->Cancel = FALSE;
    fun_DriverStartIo(po, pirp);
#else
    sdv_DoNothing();
#endif
    sdv_stub_startio_end();
}


VOID
sdv_RunUnload(
    PDRIVER_OBJECT pdrivo
    )
{
#ifdef fun_DriverUnload
    fun_DriverUnload(pdrivo);
#else
    sdv_DoNothing();
#endif
}



BOOLEAN
sdv_CheckDispatchRoutines()
{
#if defined(fun_IRP_MJ_CLEANUP) || \
	defined(fun_IRP_MJ_CLOSE) || \
	defined(fun_IRP_MJ_CREATE) ||\
	defined(fun_IRP_MJ_DEVICE_CONTROL) || \
	defined(fun_IRP_MJ_FILE_SYSTEM_CONTROL) || \
	defined(fun_IRP_MJ_FLUSH_BUFFERS) || \
	defined(fun_IRP_MJ_INTERNAL_DEVICE_CONTROL) || \
	defined(fun_IRP_MJ_LOCK_CONTROL) || \
	defined(fun_IRP_MJ_QUERY_INFORMATION) || \
	defined(fun_IRP_MJ_READ) || \
	defined(fun_IRP_MJ_SET_INFORMATION) || \
	defined(fun_IRP_MJ_SYSTEM_CONTROL) || \
	defined(fun_IRP_MJ_WRITE) || \
	defined(fun_IRP_MJ_PNP) || \
	defined(fun_IRP_MJ_POWER) 

	return TRUE;
#else
    return FALSE;
#endif
}

BOOLEAN
sdv_CheckStartIoRoutines()
{
#if defined(fun_DriverStartIo)
	return TRUE;
#else
    return FALSE;
#endif
}



BOOLEAN
sdv_CheckDpcRoutines()
{
#if defined(fun_KDEFERRED_ROUTINE_1) || \
	defined(fun_KDEFERRED_ROUTINE_2) || \
	defined(fun_KDEFERRED_ROUTINE_3) || \
	defined(fun_KDEFERRED_ROUTINE_4) || \
	defined(fun_KDEFERRED_ROUTINE_5) || \
	defined(fun_KDEFERRED_ROUTINE_6) || \
	defined(fun_KDEFERRED_ROUTINE_7) || \
	defined(fun_KDEFERRED_ROUTINE_8) || \
	defined(fun_KDEFERRED_ROUTINE_9) 
	return TRUE;
#else
    return FALSE;
#endif
}



BOOLEAN
sdv_CheckIsrRoutines()
{
#if defined(fun_KSERVICE_ROUTINE_1) || \
	defined(fun_KSERVICE_ROUTINE_2) || \
	defined(fun_KSERVICE_ROUTINE_3) ||\
	defined(fun_KSERVICE_ROUTINE_4) || \
	defined(fun_KSERVICE_ROUTINE_5) || \
	defined(fun_KSERVICE_ROUTINE_6) 
	return TRUE;
#else
    return FALSE;
#endif
}



BOOLEAN
sdv_CheckCancelRoutines()
{
#if defined(fun_DRIVER_CANCEL_1) || \
	defined(fun_DRIVER_CANCEL_2) || \
	defined(fun_DRIVER_CANCEL_3) || \
	defined(fun_DRIVER_CANCEL_4) || \
	defined(fun_DRIVER_CANCEL_5) || \
	defined(fun_DRIVER_CANCEL_6) || \
	defined(fun_DRIVER_CANCEL_7)
	return TRUE;
#else
    return FALSE;
#endif
}






BOOLEAN
sdv_CheckCancelRoutines1()
{
#if defined(fun_DRIVER_CANCEL_1) && \
	!defined(fun_DRIVER_CANCEL_2) && \
	!defined(fun_DRIVER_CANCEL_3) && \
	!defined(fun_DRIVER_CANCEL_4) && \
	!defined(fun_DRIVER_CANCEL_5) && \
	!defined(fun_DRIVER_CANCEL_6) && \
	!defined(fun_DRIVER_CANCEL_7) 
	return TRUE;
#else
    return FALSE;
#endif
}


BOOLEAN
sdv_CheckIoDpcRoutines()
{
#if defined(fun_IO_DPC_ROUTINE_1) || \
	defined(fun_IO_DPC_ROUTINE_2) || \
	defined(fun_IO_DPC_ROUTINE_3) ||\
	defined(fun_IO_DPC_ROUTINE_4) || \
	defined(fun_IO_DPC_ROUTINE_5) || \
	defined(fun_IO_DPC_ROUTINE_6) 
	return TRUE;
#else
    return FALSE;
#endif
}


BOOLEAN
sdv_IoCompletionRoutines()
{
#if defined(fun_IO_COMPLETION_ROUTINE_1) || \
	defined(fun_IO_COMPLETION_ROUTINE_2) || \
	defined(fun_IO_COMPLETION_ROUTINE_3) ||\
	defined(fun_IO_COMPLETION_ROUTINE_4) || \
	defined(fun_IO_COMPLETION_ROUTINE_5) || \
	defined(fun_IO_COMPLETION_ROUTINE_6) 
	return TRUE;
#else
    return FALSE;
#endif
}


BOOLEAN
sdv_CheckWorkerRoutines()
{
#if defined(fun_WORKER_THREAD_ROUTINE_1) || \
	defined(fun_WORKER_THREAD_ROUTINE_2) || \
	defined(fun_WORKER_THREAD_ROUTINE_3) ||\
	defined(fun_WORKER_THREAD_ROUTINE_4) || \
	defined(fun_WORKER_THREAD_ROUTINE_5) || \
	defined(fun_WORKER_THREAD_ROUTINE_6) 
	return TRUE;
#else
    return FALSE;
#endif
}


BOOLEAN
sdv_CheckAddDevice()
{
#if defined(fun_AddDevice)  
	return TRUE;
#else
    return FALSE;
#endif
}


BOOLEAN
sdv_CheckIrpMjPnp()
{
#if defined(fun_IRP_MJ_PNP) 
	return TRUE;
#else
    return FALSE;
#endif
}



BOOLEAN
sdv_CheckIrpMjPower()
{
#if defined(fun_IRP_MJ_POWER) 
	return TRUE;
#else
    return FALSE;
#endif
}


BOOLEAN
sdv_CheckDriverUnload()
{
#if defined(fun_DriverUnload)
	return TRUE;
#else
    return FALSE;
#endif
}



NTSTATUS sdv_RunAddDevice(
    PDRIVER_OBJECT p1,
    PDEVICE_OBJECT p2
    )
{

    NTSTATUS status=STATUS_SUCCESS;
    sdv_stub_add_begin();
#ifdef fun_AddDevice
    status = fun_AddDevice(p1,p2);
#endif
    sdv_stub_add_end();
    return status;
}



/*NTSTATUS sdv_RunDriverentry(
    _DRIVER_OBJECT  *DriverObject,
    PUNICODE_STRING  RegistryPath
    )
{

   NTSTATUS status;
    sdv_stub_driver_entry_begin();
    status = fun_DriverEntry(&DriverObject, &RegistryPath);
    sdv_stub_driver_entry_begin();
    return status;
}*/



VOID 
sdv_SetIrpMinorFunctionNonBusDriver(
    PIRP pirp
    )  
{
    PIO_STACK_LOCATION r = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    LONG x = SdvMakeChoice();
    
    switch (x) 
    {
        case 0:
        r->MinorFunction = IRP_MN_STOP_DEVICE;
        break;
        case 1:
        r->MinorFunction = IRP_MN_CANCEL_STOP_DEVICE;
        break;
#ifdef SDV_NO_MN_REMOVE_DEVICE 
        case 2:
        r->MinorFunction = IRP_MN_CANCEL_REMOVE_DEVICE;
        break;      
        case 3:
        r->MinorFunction = IRP_MN_SURPRISE_REMOVAL;
        break;           
#endif
        default:
        r->MinorFunction = IRP_MN_DEVICE_USAGE_NOTIFICATION;
        break;
    }

}

PIO_STACK_LOCATION
sdv_SetPowerRequestIrpMinorFunction(
    PIRP pirp
    )  

/*Routine Description:

    Sets the MN IRP fields to the possible values.  

Arguments:

    pirp - The IRP to set.

Notes:
     If IRP_MN_SET_POWER || IRP_MN_QUERY_POWER then this is a SystemPowerState.
     If IRP_MN_WAIT_WAKE then this is a DevicePowerState.
*/
{
    PIO_STACK_LOCATION r = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    LONG nd_minor = SdvMakeChoice();
    LONG nd_state_system_power1 = SdvMakeChoice();
    LONG nd_state_system_power2 = SdvMakeChoice();
    LONG nd_state_device_power1 = SdvMakeChoice();
       
    switch (nd_minor) 
    {
        case 0:
        switch (nd_state_system_power1)
        { 
          case 0:
          r->Parameters.Power.State.SystemState=PowerSystemWorking;
          break;
          case 1:
          r->Parameters.Power.State.SystemState=PowerSystemSleeping1;
          break;
          case 2:
          r->Parameters.Power.State.SystemState=PowerSystemSleeping2;
          break;
          case 3:
          r->Parameters.Power.State.SystemState=PowerSystemSleeping3;
          break;
          case 4:
          r->Parameters.Power.State.SystemState=PowerSystemHibernate;
          break;
          case 5:
          r->Parameters.Power.State.SystemState=PowerSystemShutdown;
          break;
          default:
          r->Parameters.Power.State.SystemState=PowerSystemMaximum;
          break;
        }
        r->MinorFunction = IRP_MN_QUERY_POWER;
        r->Parameters.Power.Type = SystemPowerState;
        break;
        case 1:
        switch (nd_state_system_power2)
        { 
          case 0:
          r->Parameters.Power.State.SystemState=PowerSystemWorking;
          break;
          case 1:
          r->Parameters.Power.State.SystemState=PowerSystemSleeping1;
          break;
          case 2:
          r->Parameters.Power.State.SystemState=PowerSystemSleeping2;
          break;
          case 3:
          r->Parameters.Power.State.SystemState=PowerSystemSleeping3;
          break;
          case 4:
          r->Parameters.Power.State.SystemState=PowerSystemHibernate;
          break;
          case 5:
          r->Parameters.Power.State.SystemState=PowerSystemShutdown;
          break;
          default:
          r->Parameters.Power.State.SystemState=PowerSystemMaximum;
          break;
        }
        r->MinorFunction = IRP_MN_SET_POWER;
        r->Parameters.Power.Type = SystemPowerState;
        break; 
        default:
        switch (nd_state_device_power1)
        { 
          case 0:
          r->Parameters.Power.State.DeviceState=PowerDeviceD0;
          break;
          case 1:
          r->Parameters.Power.State.DeviceState=PowerDeviceD1;
          break;
          case 2:
          r->Parameters.Power.State.DeviceState=PowerDeviceD3;
          break;
          default:
          r->Parameters.Power.State.DeviceState=PowerDeviceMaximum;
          break;
        }
        r->MinorFunction = IRP_MN_WAIT_WAKE;
        r->Parameters.Power.Type =DevicePowerState;
        break;
    }
    return r;
}


VOID 
sdv_SetIrpMinorFunctionBusDriver(
    PIRP pirp
    )  
{
    PIO_STACK_LOCATION r = SDV_MACRO_IOGETCURRENTIRPSTACKLOCATION(pirp);
    r->MinorFunction = IRP_MN_QUERY_DEVICE_RELATIONS;
    r->Parameters.QueryDeviceRelations.Type  = BusRelations;
    r->CompletionRoutine = NULL;
    SDV_MACRO_CLEAR_IRP_STACKLOCATIONS_COMPLETION();
}


VOID SdvAssume(int e)
/*
Routine Description:
    Acts like an ASSERT, but halts analysis if the assert fails.
*/
{
  if (!e) SdvExit();
}


VOID SdvAssumeSoft(int e)
/*
Routine Description:
   Acts like an SdvAssume.   
*/
{
  if (!e) SdvExit();
}

void assume ( int a )
{
}




/* 
    Disable for SdvExit: C4717: recursive on all control paths,
    function will cause runtime stack overflow.

    This is correctly flagged by the compiler, and would be a serious
    issue if the harness was to be executed rather than simulated.

    However in this case, this is per design in order to simulate
    non-progress:
*/
#pragma warning(disable:4717)

VOID SdvExit() 
/*

Routine Description:

    Acts like "exit()" within the context of model checking.

Notes:
    Since SdvExit contributes no extra reachable states, this serves as a
    dead-end of sorts to tools based on reachabilitity analysis.

*/
{ 
      SdvAssume( 0 );	
      SdvExit();

    /* Enable after SdvExit: C4717: */
    #pragma warning(default:4717)
}

/* ..\wdm\harness-parts.c end */

/* ..\wdm\ntddk-io.c begin */
/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/



typedef struct _IO_WORKITEM *PIO_WORKITEM;

typedef
VOID
(*PIO_WORKITEM_ROUTINE) (
    IN PDEVICE_OBJECT DeviceObject,
    IN PVOID Context
    );

typedef
VOID
(*PIO_WORKITEM_ROUTINE_EX) (
    IN PVOID IoObject,
    IN PVOID Context,
    IN PIO_WORKITEM IoWorkItem
    );

typedef struct _IO_WORKITEM {
    WORK_QUEUE_ITEM WorkItem;
    PIO_WORKITEM_ROUTINE_EX Routine;
    PVOID IoObject;
    PVOID Context;
    ULONG Type;
#if DBG
    ULONG Size;
#endif
} IO_WORKITEM;



DEVICE_OBJECT sdv_devobj_top;
PDEVICE_OBJECT sdv_p_devobj_top = &sdv_devobj_top;

#ifdef SDV_Include_NTDDK
CONTROLLER_OBJECT sdv_IoCreateController_CONTROLLER_OBJECT;
#endif

KEVENT sdv_IoCreateNotificationEvent_KEVENT;
KEVENT sdv_IoCreateSynchronizationEvent_KEVENT;
DEVICE_OBJECT sdv_IoGetDeviceObjectPointer_DEVICE_OBJECT;
DEVICE_OBJECT sdv_IoGetDeviceToVerify_DEVICE_OBJECT;
DMA_ADAPTER sdv_IoGetDmaAdapter_DMA_ADAPTER;
GENERIC_MAPPING sdv_IoGetFileObjectGenericMapping_GENERIC_MAPPING;
DEVICE_OBJECT sdv_IoGetRelatedDeviceObject_DEVICE_OBJECT;
struct _DRIVE_LAYOUT_INFORMATION_EX sdv_IoReadPartitionTableEx_DRIVE_LAYOUT_INFORMATION_EX;




NTKERNELAPI
VOID
IoAcquireCancelSpinLock(
    OUT PKIRQL p_old_irql
    )
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    *p_old_irql = sdv_irql_previous;
}

_IRQL_requires_max_(DISPATCH_LEVEL)
NTKERNELAPI
NTSTATUS
NTAPI
IoAcquireRemoveLockEx(
    IN PIO_REMOVE_LOCK RemoveLock,
    IN OPTIONAL PVOID Tag,
    IN PCSTR File,
    IN ULONG Line,
    IN ULONG RemlockSize
    )
{
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_UNSUCCESSFUL;break;
        default: 
            if (sdv_Io_Removelock_release_wait_returned) 
            {
                return STATUS_DELETE_PENDING;
            }
            else 
            {
	              return STATUS_SUCCESS;
            }
			break;
    }
}

_IRQL_requires_max_(DISPATCH_LEVEL)
NTKERNELAPI
NTSTATUS
NTAPI
sdv_IoAcquireRemoveLock(
    IN PIO_REMOVE_LOCK RemoveLock,
    IN OPTIONAL PVOID Tag
    )
{
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_UNSUCCESSFUL;break;
        default: 
            if (sdv_Io_Removelock_release_wait_returned) 
            {
                return STATUS_DELETE_PENDING;
            }
            else 
            {
	              return STATUS_SUCCESS;
            }
			break;
    }
}


NTKERNELAPI
VOID
sdv_IoAdjustPagingPathCount(
    IN PLONG Count,
    IN BOOLEAN Increment
    )
{
}

NTKERNELAPI
NTSTATUS
sdv_IoAllocateAdapterChannel(
    IN PADAPTER_OBJECT AdapterObject,
    IN PDEVICE_OBJECT DeviceObject,
    IN ULONG NumberOfMapRegisters,
    IN PDRIVER_CONTROL ExecutionRoutine,
    IN PVOID Context
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_INSUFFICIENT_RESOURCES;break;
    }
}
#ifdef SDV_Include_NTDDK
NTKERNELAPI
VOID
IoAllocateController(
    IN PCONTROLLER_OBJECT ControllerObject,
    IN PDEVICE_OBJECT DeviceObject,
    IN PDRIVER_CONTROL ExecutionRoutine,
    IN PVOID Context
    )
{
#ifdef SDV_HARNESS_DRIVER_CONTROL_ROUTINE
	sdv_stub_driver_control_begin();
#ifdef fun_DRIVER_CONTROL
    fun_DRIVER_CONTROL(DeviceObject,sdv_ControllerPirp,sdv_MapRegisterBase,Context);
#else
    sdv_DoNothing();
#endif
    sdv_stub_driver_control_end();
#endif
}
#endif


NTKERNELAPI
NTSTATUS
IoAllocateDriverObjectExtension(
    IN PDRIVER_OBJECT DriverObject,
    IN PVOID ClientIdentificationAddress,
    IN ULONG DriverObjectExtensionSize,
    OUT PVOID *DriverObjectExtension
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_INSUFFICIENT_RESOURCES;break;
        default: return STATUS_OBJECT_NAME_COLLISION;break;
    }
}

NTKERNELAPI
PVOID
IoAllocateErrorLogEntry(
    IN PVOID IoObject,
    IN UCHAR EntrySize
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return malloc(1);break;
        default: return NULL;break;
    }
}

NTKERNELAPI
PIRP
IoAllocateIrp(
    IN CCHAR StackSize,
    IN BOOLEAN ChargeQuota
    )
{
    PIO_STACK_LOCATION irpSp;
    int choice = SdvMakeChoice();
    switch (choice)
	  {
        case 0: 
            sdv_other_irp->PendingReturned=0;
            irpSp = IoGetNextIrpStackLocation(sdv_other_irp);
            irpSp->CompletionRoutine = NULL;
            sdv_compFset = 0;
            return sdv_other_irp;
            break;
        default: return NULL;break;
    }

}

NTKERNELAPI
PMDL
IoAllocateMdl(
    IN PVOID VirtualAddress,
    IN ULONG Length,
    IN BOOLEAN SecondaryBuffer,
    IN BOOLEAN ChargeQuota,
    IN OUT PIRP Irp OPTIONAL
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return (PMDL) malloc(1);break;
        default: return NULL;break;
    }
}

PIO_WORKITEM
IoAllocateWorkItem(
    IN PDEVICE_OBJECT DeviceObject
    )
{
    int choice = SdvMakeChoice();
    PIO_WORKITEM ioWorkItem = (PIO_WORKITEM)malloc(1);
    switch (choice) 
    {
      case 0:
	  SdvAssume(ioWorkItem != NULL);
	  ioWorkItem->WorkItem.List.Flink = NULL;
		
          return ioWorkItem;
      break;
      default:

          return NULL;
      break;

    }
}

VOID
sdv_IoAssignArcName(
    IN PUNICODE_STRING ArcName,
    IN PUNICODE_STRING DeviceName
    )
{
}

NTKERNELAPI
NTSTATUS
IoAssignResources(
    IN PUNICODE_STRING RegistryPath,
    IN PUNICODE_STRING DriverClassName OPTIONAL,
    IN PDRIVER_OBJECT DriverObject,
    IN PDEVICE_OBJECT DeviceObject OPTIONAL,
    IN PIO_RESOURCE_REQUIREMENTS_LIST RequestedResources,
    IN OUT PCM_RESOURCE_LIST *AllocatedResources
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoAttachDevice(
    IN PDEVICE_OBJECT SourceDevice,
    IN PUNICODE_STRING TargetDevice,
    OUT PDEVICE_OBJECT *AttachedDevice
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_INVALID_PARAMETER;break;
        case 2: return STATUS_OBJECT_TYPE_MISMATCH;break;
        case 3: return STATUS_OBJECT_NAME_INVALID;break;
        default: return STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

NTKERNELAPI
NTSTATUS
IoAttachDeviceByPointer(
    IN PDEVICE_OBJECT SourceDevice,
    IN PDEVICE_OBJECT TargetDevice
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
PDEVICE_OBJECT
IoAttachDeviceToDeviceStack(
    IN PDEVICE_OBJECT SourceDevice,
    IN PDEVICE_OBJECT TargetDevice
    )
{
    if (TargetDevice == sdv_p_devobj_pdo) {
        return TargetDevice;
    } else {
        return NULL;
    }
}

NTKERNELAPI
PIRP
IoBuildAsynchronousFsdRequest(
    IN ULONG MajorFunction,
    IN PDEVICE_OBJECT DeviceObject,
    IN OUT PVOID Buffer OPTIONAL,
    IN ULONG Length OPTIONAL,
    IN PLARGE_INTEGER StartingOffset OPTIONAL,
    IN PIO_STATUS_BLOCK IoStatusBlock OPTIONAL
    )
{

    int choice = SdvMakeChoice();
    if(IoStatusBlock!=NULL)
    {
        IoStatusBlock = sdv_IoBuildAsynchronousFsdRequest_IoStatusBlock;
    }
    switch (choice) 
    {
        case 0:
            sdv_IoBuildAsynchronousFsdRequest_irp->PendingReturned=1;
            sdv_IoBuildAsynchronousFsdRequest_irp->Tail.Overlay.CurrentStackLocation->MajorFunction=(UCHAR) MajorFunction;
	    sdv_IoBuildAsynchronousFsdRequest_harnessStackLocation_next.MajorFunction = (UCHAR) MajorFunction;
	    if(IoStatusBlock!=NULL)
	    {
	        IoStatusBlock->Status = STATUS_SUCCESS;
                sdv_IoBuildAsynchronousFsdRequest_IoStatusBlock->Status = STATUS_SUCCESS;
                sdv_IoBuildAsynchronousFsdRequest_IoStatusBlock=IoStatusBlock;
	    }
	    return sdv_IoBuildAsynchronousFsdRequest_irp;
	    break;
	    default:
	    if(IoStatusBlock!=NULL)
	    {
                 IoStatusBlock->Status=STATUS_UNSUCCESSFUL;
                 sdv_IoBuildAsynchronousFsdRequest_IoStatusBlock->Status=STATUS_UNSUCCESSFUL;
                 sdv_IoBuildAsynchronousFsdRequest_IoStatusBlock=IoStatusBlock;
	    }
	    return NULL;
	    break;
    }
}

NTKERNELAPI
PIRP
IoBuildDeviceIoControlRequest(
    IN ULONG IoControlCode,
    IN PDEVICE_OBJECT DeviceObject,
    IN PVOID InputBuffer OPTIONAL,
    IN ULONG InputBufferLength,
    OUT PVOID OutputBuffer OPTIONAL,
    IN ULONG OutputBufferLength,
    IN BOOLEAN InternalDeviceIoControl,
    IN PKEVENT Event,
    OUT PIO_STATUS_BLOCK IoStatusBlock
    )
{
    int choice = SdvMakeChoice();
    
    
    switch (choice) 
    {

    case 0:
        if(InternalDeviceIoControl)
        {
            sdv_IoBuildDeviceIoControlRequest_irp->Tail.Overlay.CurrentStackLocation->MajorFunction=IRP_MJ_INTERNAL_DEVICE_CONTROL;
            sdv_IoBuildDeviceIoControlRequest_harnessStackLocation_next.MajorFunction=IRP_MJ_INTERNAL_DEVICE_CONTROL;
        }
        else
        {
            sdv_IoBuildDeviceIoControlRequest_irp->Tail.Overlay.CurrentStackLocation->MajorFunction=IRP_MJ_DEVICE_CONTROL;
            sdv_IoBuildDeviceIoControlRequest_harnessStackLocation_next.MajorFunction=IRP_MJ_DEVICE_CONTROL;
        }
        sdv_IoBuildDeviceIoControlRequest_irp->PendingReturned=1;
        sdv_IoBuildDeviceIoControlRequest_IoStatusBlock->Status=STATUS_SUCCESS;
        IoStatusBlock->Status=STATUS_SUCCESS;
        sdv_IoBuildDeviceIoControlRequest_IoStatusBlock=IoStatusBlock;
        return sdv_IoBuildDeviceIoControlRequest_irp;
        break;
    default:
        sdv_IoBuildDeviceIoControlRequest_IoStatusBlock->Status=STATUS_UNSUCCESSFUL;
        IoStatusBlock->Status=STATUS_UNSUCCESSFUL;
        sdv_IoBuildDeviceIoControlRequest_IoStatusBlock=IoStatusBlock;
        return NULL;
        break;

    }
}

NTKERNELAPI
VOID
IoBuildPartialMdl(
    IN PMDL SourceMdl,
    IN OUT PMDL TargetMdl,
    IN PVOID VirtualAddress,
    IN ULONG Length
    )
{
}

NTKERNELAPI
PIRP
IoBuildSynchronousFsdRequest(
    IN ULONG MajorFunction,
    IN PDEVICE_OBJECT DeviceObject,
    IN OUT PVOID Buffer OPTIONAL,
    IN ULONG Length OPTIONAL,
    IN PLARGE_INTEGER StartingOffset OPTIONAL,
    IN PKEVENT Event,
    OUT PIO_STATUS_BLOCK IoStatusBlock
    )
{
    
    int choice = SdvMakeChoice();
    
    switch (choice) 
    {

    case 0:
        sdv_IoBuildSynchronousFsdRequest_irp->Tail.Overlay.CurrentStackLocation->MajorFunction=(UCHAR) MajorFunction;
        sdv_IoBuildSynchronousFsdRequest_harnessStackLocation_next.MajorFunction = (UCHAR) MajorFunction;
        IoStatusBlock->Status = STATUS_SUCCESS;
        sdv_IoBuildSynchronousFsdRequest_IoStatusBlock=STATUS_SUCCESS;
        sdv_IoBuildSynchronousFsdRequest_IoStatusBlock=IoStatusBlock;
        sdv_IoBuildSynchronousFsdRequest_irp->PendingReturned=1;
        return sdv_IoBuildSynchronousFsdRequest_irp;
        break;
    default:
        sdv_IoBuildSynchronousFsdRequest_irp->PendingReturned=0;
        IoStatusBlock->Status =STATUS_UNSUCCESSFUL;
        sdv_IoBuildSynchronousFsdRequest_IoStatusBlock=STATUS_UNSUCCESSFUL;
        sdv_IoBuildSynchronousFsdRequest_IoStatusBlock=IoStatusBlock;
        return NULL;
        break;

    }
}

NTKERNELAPI
NTSTATUS
FASTCALL
IofCallDriver(
    IN PDEVICE_OBJECT DeviceObject,
    IN OUT PIRP Irp
    )
{
    int choice;
    BOOLEAN completion_routine_called=FALSE;
    NTSTATUS status;
    choice= SdvMakeChoice();
    status=STATUS_PENDING;
    switch (choice) 
    {
      case 0:
      Irp->IoStatus.Status = STATUS_SUCCESS;
      Irp->PendingReturned = 0;
      if(sdv_IoBuildDeviceIoControlRequest_irp==Irp)
      {
        sdv_IoBuildDeviceIoControlRequest_IoStatusBlock->Status=STATUS_SUCCESS;
      }
      if(sdv_IoBuildSynchronousFsdRequest_irp==Irp)
      {
        sdv_IoBuildSynchronousFsdRequest_IoStatusBlock->Status=STATUS_SUCCESS;
      }
	  if(sdv_IoBuildAsynchronousFsdRequest_irp==Irp)
      {
        sdv_IoBuildAsynchronousFsdRequest_IoStatusBlock->Status=STATUS_SUCCESS;
      }
      #ifdef SDV_HARNESS_COMPLETION_ROUTINE
      if(sdv_invoke_on_success&&sdv_compFset)
      { 
          sdv_RunIoCompletionRoutines(sdv_p_devobj_fdo, Irp, sdv_context,&completion_routine_called);
      }
      #endif
      break;
      case 1:
      Irp->IoStatus.Status = STATUS_CANCELLED;
      Irp->PendingReturned = 0;
      if(sdv_IoBuildDeviceIoControlRequest_irp==Irp)
      {
        sdv_IoBuildDeviceIoControlRequest_IoStatusBlock->Status=STATUS_CANCELLED;
      }
      if(sdv_IoBuildSynchronousFsdRequest_irp==Irp)
      {
        sdv_IoBuildSynchronousFsdRequest_IoStatusBlock->Status=STATUS_CANCELLED;
      }
	  if(sdv_IoBuildAsynchronousFsdRequest_irp==Irp)
      {
        sdv_IoBuildAsynchronousFsdRequest_IoStatusBlock->Status=STATUS_CANCELLED;
      }
      #ifdef SDV_HARNESS_COMPLETION_ROUTINE
      if(sdv_invoke_on_cancel&&sdv_compFset)
      {
          sdv_RunIoCompletionRoutines(sdv_p_devobj_fdo, Irp, sdv_context,&completion_routine_called);
      }
      #endif
      break;
      case 3:
      Irp->IoStatus.Status = STATUS_PENDING;
      Irp->PendingReturned = 1;
      if(sdv_IoBuildDeviceIoControlRequest_irp==Irp)
      {
        sdv_IoBuildDeviceIoControlRequest_IoStatusBlock->Status=STATUS_PENDING;
      }
      if(sdv_IoBuildSynchronousFsdRequest_irp==Irp)
      {
        sdv_IoBuildSynchronousFsdRequest_IoStatusBlock->Status=STATUS_PENDING;
      }
      if(sdv_IoBuildAsynchronousFsdRequest_irp==Irp)
      {
        sdv_IoBuildAsynchronousFsdRequest_IoStatusBlock->Status=STATUS_PENDING;
      }
      #ifdef SDV_HARNESS_COMPLETION_ROUTINE
      if(sdv_compFset)
      {
          sdv_RunIoCompletionRoutines(sdv_p_devobj_fdo, Irp, sdv_context,&completion_routine_called);
      }
      #endif
      break;
      default:
      Irp->IoStatus.Status = STATUS_UNSUCCESSFUL;
      Irp->PendingReturned = 0;
      if(sdv_IoBuildDeviceIoControlRequest_irp==Irp)
      {
        sdv_IoBuildDeviceIoControlRequest_IoStatusBlock->Status=STATUS_UNSUCCESSFUL;
      }
      if(sdv_IoBuildSynchronousFsdRequest_irp==Irp)
      {
        sdv_IoBuildSynchronousFsdRequest_IoStatusBlock->Status=STATUS_UNSUCCESSFUL;
      }
      if(sdv_IoBuildAsynchronousFsdRequest_irp==Irp)
      {
        sdv_IoBuildAsynchronousFsdRequest_IoStatusBlock->Status=STATUS_UNSUCCESSFUL;
      }
      #ifdef SDV_HARNESS_COMPLETION_ROUTINE
      if(sdv_invoke_on_error&&sdv_compFset)
      {
          sdv_RunIoCompletionRoutines(sdv_p_devobj_fdo, Irp, sdv_context,&completion_routine_called);
      }
      #endif
      break;
   }
   return status;
}


NTKERNELAPI
NTSTATUS
sdv_IoCallDriver(
    IN PDEVICE_OBJECT DeviceObject,
    IN OUT PIRP Irp
    )
{
    return IofCallDriver(DeviceObject,Irp);
}



NTKERNELAPI
BOOLEAN
IoCancelIrp(
    IN PIRP Irp
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return FALSE;break;
        default: return TRUE;break;
    }
}

NTKERNELAPI
NTSTATUS
IoCheckShareAccess(
    IN ACCESS_MASK DesiredAccess,
    IN ULONG DesiredShareAccess,
    IN OUT PFILE_OBJECT FileObject,
    IN OUT PSHARE_ACCESS ShareAccess,
    IN BOOLEAN Update
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_SHARING_VIOLATION;break;
    }
}

VOID
FASTCALL
IofCompleteRequest(
    IN PIRP pirp,
    IN CCHAR PriorityBoost
    )
{
}

VOID
sdv_IoCompleteRequest(
    IN PIRP pirp,
    IN CCHAR PriorityBoost
    )
{
}



VOID
sdv_IofCompleteRequest(
    IN PIRP pirp,
    IN CCHAR PriorityBoost
    )
{
}


NTKERNELAPI
NTSTATUS
IoConnectInterrupt(
    OUT PKINTERRUPT *InterruptObject,
    IN PKSERVICE_ROUTINE ServiceRoutine,
    IN PVOID ServiceContext,
    IN PKSPIN_LOCK SpinLock OPTIONAL,
    IN ULONG Vector,
    IN KIRQL Irql,
    IN KIRQL SynchronizeIrql,
    IN KINTERRUPT_MODE InterruptMode,
    IN BOOLEAN ShareVector,
    IN KAFFINITY ProcessorEnableMask,
    IN BOOLEAN FloatingSave
    )
{
    int choice = SdvMakeChoice();
    sdv_isr_routine = ServiceRoutine;
    sdv_pDpcContext = ServiceContext;
    switch (choice) 
    {
        case 0: 
#ifdef SDV_RUN_KE_ISR_ROUTINES
        sdv_RunISRRoutines(InterruptObject,ServiceContext);
#endif
                 return STATUS_SUCCESS;
                 break;
        case 1: return STATUS_INVALID_PARAMETER;break;
        default: return STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

VOID   
IoDisconnectInterrupt(
    IN PKINTERRUPT  InterruptObject
    )
{
    sdv_isr_routine = sdv_isr_dummy;
    sdv_pDpcContext = &sdv_DpcContext;
    
}

#if WINVER >= 0x0600
NTKERNELAPI
NTSTATUS
IoConnectInterruptEx(
    IN OUT PIO_CONNECT_INTERRUPT_PARAMETERS Parameters
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_INVALID_DEVICE_REQUEST;break;
        case 3: return STATUS_INVALID_PARAMETER;break;
        case 4: return STATUS_INVALID_PARAMETER_1;break;
        case 5: return STATUS_INVALID_PARAMETER_10;break;
        default: return STATUS_NOT_FOUND;break;
    }
}
#endif

FORCEINLINE
VOID
sdv_IoCopyCurrentIrpStackLocationToNext(
    IN PIRP pirp
    )
{
   SDV_MACRO_COPYCURRENTIRPSTACKLOCATIONTONEXT(pirp)
}

#ifdef SDV_Include_NTDDK
NTKERNELAPI
PCONTROLLER_OBJECT
IoCreateController(
    IN ULONG Size
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return &sdv_IoCreateController_CONTROLLER_OBJECT;break;
        default: return NULL;break;
    }
}
#endif

NTKERNELAPI
NTSTATUS
IoCreateDevice(
    IN PDRIVER_OBJECT DriverObject,
    IN ULONG DeviceExtensionSize,
    IN PUNICODE_STRING DeviceName OPTIONAL,
    IN DEVICE_TYPE DeviceType,
    IN ULONG DeviceCharacteristics,
    IN BOOLEAN Exclusive,
    OUT PDEVICE_OBJECT *DeviceObject
    )
{

    int choice = SdvMakeChoice();
    sdv_io_create_device_called++;

    switch (choice) 
    {
        case 0: 
            if(sdv_inside_init_entrypoint)
            {
                sdv_p_devobj_fdo->Flags = DO_DEVICE_INITIALIZING;
                (*DeviceObject) = sdv_p_devobj_fdo; 
            }
            else
            {
                sdv_p_devobj_child_pdo->Flags = DO_DEVICE_INITIALIZING;
                (*DeviceObject) = sdv_p_devobj_child_pdo; 
            }
            return STATUS_SUCCESS;break;
        case 1: (*DeviceObject) = NULL; return STATUS_UNSUCCESSFUL;break;
        case 2: (*DeviceObject) = NULL; return STATUS_INSUFFICIENT_RESOURCES;break;
        default: (*DeviceObject) = NULL; return STATUS_OBJECT_NAME_COLLISION;break;
    }
}

NTSTATUS
WdmlibIoCreateDeviceSecure(
    __in     PDRIVER_OBJECT      DriverObject,
    __in     ULONG               DeviceExtensionSize,
    __in_opt PUNICODE_STRING     DeviceName,
    __in     DEVICE_TYPE         DeviceType,
    __in     ULONG               DeviceCharacteristics,
    __in     BOOLEAN             Exclusive,
    __in     PCUNICODE_STRING    DefaultSDDLString,
    __in_opt LPCGUID             DeviceClassGuid,
    __out    PDEVICE_OBJECT     *DeviceObject
    )
{

    int choice = SdvMakeChoice();
    sdv_io_create_device_called++;

    switch (choice) {
        case 0: (*DeviceObject) = sdv_p_devobj_fdo; return STATUS_SUCCESS;break;
        case 1: (*DeviceObject) = NULL; return STATUS_UNSUCCESSFUL;break;
        case 2: (*DeviceObject) = NULL; return STATUS_INSUFFICIENT_RESOURCES;break;
        default: (*DeviceObject) = NULL; return STATUS_OBJECT_NAME_COLLISION;break;
    }
}


NTSTATUS
sdv_IoCreateDeviceSecure(
  __in      PDRIVER_OBJECT DriverObject,
  __in      ULONG DeviceExtensionSize,
  __in_opt  PUNICODE_STRING DeviceName,
  __in      DEVICE_TYPE DeviceType,
  __in      ULONG DeviceCharacteristics,
  __in      BOOLEAN Exclusive,
  __in      PCUNICODE_STRING DefaultSDDLString,
  __in_opt  LPCGUID DeviceClassGuid,
  __out     PDEVICE_OBJECT *DeviceObject
)
{

    int choice = SdvMakeChoice();

    sdv_io_create_device_called++;

    switch (choice) 
    {
        case 0: 
            if(sdv_inside_init_entrypoint)
            {
                sdv_p_devobj_fdo->Flags = DO_DEVICE_INITIALIZING;
                (*DeviceObject) = sdv_p_devobj_fdo; 
            }
            else
            {
                sdv_p_devobj_child_pdo->Flags = DO_DEVICE_INITIALIZING;
                (*DeviceObject) = sdv_p_devobj_child_pdo; 
            }
            return STATUS_SUCCESS;
        break;
        case 1: (*DeviceObject) = NULL; return STATUS_UNSUCCESSFUL;break;
        case 2: (*DeviceObject) = NULL; return STATUS_INSUFFICIENT_RESOURCES;break;
        default: (*DeviceObject) = NULL; return STATUS_OBJECT_NAME_COLLISION;break;
    }
}



NTKERNELAPI
NTSTATUS
IoCreateFile(
    OUT PHANDLE FileHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    IN PLARGE_INTEGER AllocationSize OPTIONAL,
    IN ULONG FileAttributes,
    IN ULONG ShareAccess,
    IN ULONG Disposition,
    IN ULONG CreateOptions,
    IN PVOID EaBuffer OPTIONAL,
    IN ULONG EaLength,
    IN CREATE_FILE_TYPE CreateFileType,
    IN PVOID ExtraCreateParameters OPTIONAL,
    IN ULONG Options
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
PKEVENT
IoCreateNotificationEvent(
    IN PUNICODE_STRING EventName,
    OUT PHANDLE EventHandle
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return &sdv_IoCreateNotificationEvent_KEVENT;break;
        default: return NULL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoCreateSymbolicLink(
    IN PUNICODE_STRING SymbolicLinkName,
    IN PUNICODE_STRING DeviceName
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
PKEVENT
IoCreateSynchronizationEvent(
    IN PUNICODE_STRING EventName,
    OUT PHANDLE EventHandle
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return &sdv_IoCreateSynchronizationEvent_KEVENT;break;
        default: return NULL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoCreateUnprotectedSymbolicLink(
    IN PUNICODE_STRING SymbolicLinkName,
    IN PUNICODE_STRING DeviceName
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSTATUS
sdv_IoCsqInitialize(
    IN PIO_CSQ Csq,
    IN PIO_CSQ_INSERT_IRP CsqInsertIrp,
    IN PIO_CSQ_REMOVE_IRP CsqRemoveIrp,
    IN PIO_CSQ_PEEK_NEXT_IRP CsqPeekNextIrp,
    IN PIO_CSQ_ACQUIRE_LOCK CsqAcquireLock,
    IN PIO_CSQ_RELEASE_LOCK CsqReleaseLock,
    IN PIO_CSQ_COMPLETE_CANCELED_IRP CsqCompleteCanceledIrp
    )
{
    Csq->CsqInsertIrp = CsqInsertIrp;
    Csq->CsqRemoveIrp = CsqRemoveIrp;
    Csq->CsqPeekNextIrp = CsqPeekNextIrp;
    Csq->CsqAcquireLock = CsqAcquireLock;
    Csq->CsqReleaseLock = CsqReleaseLock;
    Csq->CsqCompleteCanceledIrp = CsqCompleteCanceledIrp;
    Csq->ReservePointer = NULL;

    Csq->Type = IO_TYPE_CSQ;

    return STATUS_SUCCESS;
}

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
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

VOID
sdv_IoCsqInsertIrp(
    IN PIO_CSQ Csq,
    IN PIRP pirp,
    IN PIO_CSQ_IRP_CONTEXT Context
    )
{
    Csq->CsqInsertIrp(Csq, pirp);
    IoMarkIrpPending(pirp);
}

NTSTATUS
sdv_IoCsqInsertIrpEx(
    IN PIO_CSQ Csq,
    IN PIRP pirp,
    IN PIO_CSQ_IRP_CONTEXT Context,
    IN PVOID InsertContext
    )
{
    NTSTATUS status;

    PIO_CSQ_INSERT_IRP_EX func;

    func = (PIO_CSQ_INSERT_IRP_EX)Csq->CsqInsertIrp;

    status = func(Csq, pirp, InsertContext);

    if (!NT_SUCCESS(status)) {
        return status;
    }
    IoMarkIrpPending(pirp);

    return status;
}

NTKERNELAPI
PIRP
sdv_IoCsqRemoveIrp(
    IN PIO_CSQ Csq,
    IN PIO_CSQ_IRP_CONTEXT Context
    )
{

    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return (PIRP) malloc(1);break;
        default: return NULL;break;
    }
}



PIRP sicrni;


PIRP
sdv_IoCsqRemoveNextIrp(
    IN PIO_CSQ Csq,
    IN PVOID PeekContext
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: 
		return sicrni; break;
        default: return NULL;break;
    }
}

NTKERNELAPI
VOID
sdv_IoDeassignArcName(
    IN PUNICODE_STRING ArcName
    )
{
}

#ifdef SDV_Include_NTDDK
NTKERNELAPI
VOID
IoDeleteController(
    IN PCONTROLLER_OBJECT ControllerObject
    )
{
}
#endif

NTKERNELAPI
VOID
IoDeleteDevice(
    IN PDEVICE_OBJECT DeviceObject
    )
{
}

NTKERNELAPI
NTSTATUS
IoDeleteSymbolicLink(
    IN PUNICODE_STRING SymbolicLinkName
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
VOID
IoDetachDevice(
        IN OUT PDEVICE_OBJECT TargetDevice
    )
{
}

#if WINVER >= 0x0600
NTKERNELAPI
VOID
IoDisconnectInterruptEx(
    IN OUT PIO_DISCONNECT_INTERRUPT_PARAMETERS Parameters
    )
{
}
#endif

NTKERNELAPI
BOOLEAN
sdv_IoFlushAdapterBuffers(
    IN PADAPTER_OBJECT AdapterObject,
    IN PMDL Mdl,
    IN PVOID MapRegisterBase,
    IN PVOID CurrentVa,
    IN ULONG Length,
    IN BOOLEAN WriteToDevice
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return FALSE;break;
        default: return TRUE;break;
    }
}

NTKERNELAPI
BOOLEAN
IoForwardIrpSynchronously(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp 
    )
{
    int choice = SdvMakeChoice();
    switch (choice) 
    {

    case 0:
        Irp->IoStatus.Status = STATUS_SUCCESS;
        Irp->PendingReturned = 0;
        return TRUE;break;
    default:
        Irp->IoStatus.Status = STATUS_UNSUCCESSFUL;
        Irp->PendingReturned = 0;
        return FALSE;break;
    }
}

NTKERNELAPI
VOID
sdv_IoFreeAdapterChannel(
    IN PADAPTER_OBJECT AdapterObject
    )
{
}

#ifdef SDV_Include_NTDDK
NTKERNELAPI
VOID
IoFreeController(
    IN PCONTROLLER_OBJECT ControllerObject
    )
{
}
#endif

NTKERNELAPI
VOID
IoFreeErrorLogEntry(
    PVOID ElEntry
    )
{
}

NTKERNELAPI
VOID
IoFreeIrp(
    IN PIRP pirp
    )
{
}

VOID 
sdv_IoFreeMapRegisters(
    IN PADAPTER_OBJECT AdapterObject,
    IN PVOID MapRegisterBase,
    IN ULONG NumberOfMapRegisters
    )
{
}

NTKERNELAPI
VOID
IoFreeMdl(
    IN PMDL Mdl
    )
{
}

VOID
IoFreeWorkItem(
    IN PIO_WORKITEM IoWorkItem
    )
{
}

NTKERNELAPI
PDEVICE_OBJECT
IoGetAttachedDeviceReference(
    IN PDEVICE_OBJECT DeviceObject
    )
{
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return sdv_p_devobj_top;break;
        default: return DeviceObject;break;
    }
    return &sdv_devobj_top;
}

NTKERNELAPI
NTSTATUS
IoGetBootDiskInformation(
    IN OUT PBOOTDISK_INFORMATION BootDiskInformation,
    IN ULONG Size
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_INVALID_PARAMETER;break;
        default: return STATUS_TOO_LATE;break;
    }
}

#if defined(SDV_Include_NTIFS) || defined(SDV_Include_NTDDK)

NTKERNELAPI
PCONFIGURATION_INFORMATION
IoGetConfigurationInformation(
    VOID
    )
{
    return (PCONFIGURATION_INFORMATION) malloc(1);
}
#endif

PIO_STACK_LOCATION
sdv_IoGetCurrentIrpStackLocation(
    IN PIRP pirp
    )
{
    return (pirp->Tail.Overlay.CurrentStackLocation);
}

NTKERNELAPI
PEPROCESS
IoGetCurrentProcess(
    VOID
    )
{
    PEPROCESS p = (PEPROCESS) malloc(1);
    return p;
}

NTKERNELAPI
NTSTATUS
NTAPI
IoGetDeviceInterfaceAlias(
    IN PUNICODE_STRING SymbolicLinkName,
    IN CONST GUID *AliasInterfaceClassGuid,
    OUT PUNICODE_STRING AliasSymbolicLinkName
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_OBJECT_NAME_NOT_FOUND;break;
        case 3: return STATUS_OBJECT_PATH_NOT_FOUND;break;
        default: return STATUS_INVALID_HANDLE;break;
    }
}

NTKERNELAPI
NTSTATUS
NTAPI
IoGetDeviceInterfaces(
    IN CONST GUID *InterfaceClassGuid,
    IN PDEVICE_OBJECT PhysicalDeviceObject OPTIONAL,
    IN ULONG Flags,
    OUT PWSTR *SymbolicLinkList
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: SdvAssume(*SymbolicLinkList != NULL);  
                return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_INVALID_DEVICE_REQUEST;break;
    }
}

NTKERNELAPI
NTSTATUS
IoGetDeviceObjectPointer(
    IN PUNICODE_STRING ObjectName,
    IN ACCESS_MASK DesiredAccess,
    OUT PFILE_OBJECT *FileObject,
    OUT PDEVICE_OBJECT *DeviceObject
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: *DeviceObject = &sdv_IoGetDeviceObjectPointer_DEVICE_OBJECT;
                return STATUS_SUCCESS;break;
        case 1: return STATUS_OBJECT_TYPE_MISMATCH;break;
        case 2: return STATUS_INVALID_PARAMETER;break;
        case 3: return STATUS_PRIVILEGE_NOT_HELD;break;
        case 4: return STATUS_INSUFFICIENT_RESOURCES;break;
        default: return STATUS_OBJECT_NAME_INVALID;break;
    }
}

NTKERNELAPI
NTSTATUS
IoGetDeviceProperty(
    IN PDEVICE_OBJECT DeviceObject,
    IN DEVICE_REGISTRY_PROPERTY DeviceProperty,
    IN ULONG BufferLength,
    OUT PVOID PropertyBuffer,
    OUT PULONG ResultLength
    )
{
    ULONG L = SdvKeepChoice();
    if ( L <= 0 ) {
        switch ( L ) {
            case 0: return STATUS_UNSUCCESSFUL;break;
            case -1: return STATUS_INVALID_PARAMETER_2;break;
            default: return STATUS_INVALID_DEVICE_REQUEST;break;
        }
    } else if ( L <= BufferLength ) {
        *ResultLength = L;
        return STATUS_SUCCESS;
    } else {
        *ResultLength = L;
        return STATUS_BUFFER_TOO_SMALL;
    }
}

NTKERNELAPI
PDEVICE_OBJECT
IoGetDeviceToVerify(
    PETHREAD Thread
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return NULL;break;
        default: return &sdv_IoGetDeviceToVerify_DEVICE_OBJECT;break;
    }
}

NTKERNELAPI
VOID
IoSetDeviceToVerify(
    PETHREAD Thread,
    PDEVICE_OBJECT DeviceObject
    )
{
}


NTKERNELAPI
PDMA_ADAPTER
IoGetDmaAdapter(
    IN PDEVICE_OBJECT PhysicalDeviceObject,
    IN PDEVICE_DESCRIPTION DeviceDescription,
    IN OUT PULONG NumberOfMapRegisters
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return NULL;break;
        default: return &sdv_IoGetDmaAdapter_DMA_ADAPTER;break;
    }
}

PVOID igdoe;

NTKERNELAPI
PVOID
IoGetDriverObjectExtension(
    IN PDRIVER_OBJECT DriverObject,
    IN PVOID ClientIdentificationAddress
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
	case 0: 
		return igdoe; break;
        default: return NULL;break;
    }
}

NTKERNELAPI
PGENERIC_MAPPING
IoGetFileObjectGenericMapping(
    VOID
    )
{
    return &sdv_IoGetFileObjectGenericMapping_GENERIC_MAPPING;
}

NTKERNELAPI
ULONG
sdv_IoGetFunctionCodeFromCtlCode(
    IN ULONG ControlCode
    )
{
    ULONG res;
    res = SdvKeepChoice();
    return res;
}

NTKERNELAPI
PVOID
IoGetInitialStack(
    VOID
    )
{
    return malloc(1);
}

PIO_STACK_LOCATION
sdv_IoGetNextIrpStackLocation(
    IN PIRP pirp
    )
{
    if (pirp == &sdv_harnessIrp) {
        return &sdv_harnessStackLocation_next;
    } else if (pirp == &sdv_other_harnessIrp) {
        return &sdv_other_harnessStackLocation_next;
    } else {
        return &sdv_harnessStackLocation;
    }
}

NTKERNELAPI
PDEVICE_OBJECT
IoGetRelatedDeviceObject(
    IN PFILE_OBJECT FileObject
    )
{
    return &sdv_IoGetRelatedDeviceObject_DEVICE_OBJECT;
}

NTKERNELAPI
ULONG_PTR
sdv_IoGetRemainingStackSize(
    VOID
    )
{
    ULONG_PTR l = SdvKeepChoice();
    return l;
}

NTKERNELAPI
VOID
IoGetStackLimits(
    OUT PULONG_PTR LowLimit,
    OUT PULONG_PTR HighLimit
    )
{
}

VOID
sdv_IoInitializeDpcRequest(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIO_DPC_ROUTINE DpcRoutine
    )
{
    sdv_io_dpc = DpcRoutine;
}

NTKERNELAPI
VOID
IoInitializeIrp(
    IN OUT PIRP Irp,
    IN USHORT PacketSize,
    IN CCHAR StackSize
    )
{
	*Irp = *sdv_IoInitializeIrp_irp;
}

NTKERNELAPI
VOID
sdv_IoInitializeRemoveLock(
    IN PIO_REMOVE_LOCK Lock,
    IN ULONG AllocateTag,
    IN ULONG MaxLockedMinutes,
    IN ULONG HighWatermark
    )
{
}


NTKERNELAPI
NTSTATUS
IoInitializeTimer(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIO_TIMER_ROUTINE TimerRoutine,
    IN PVOID Context
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

VOID
IoInitializeWorkItem(
    IN PVOID IoObject,
    IN PIO_WORKITEM IoWorkItem
    )
{
}

NTKERNELAPI
VOID
IoInvalidateDeviceRelations(
    IN PDEVICE_OBJECT DeviceObject,
    IN DEVICE_RELATION_TYPE Type
    )
{
}

NTKERNELAPI
VOID
IoInvalidateDeviceState(
    IN PDEVICE_OBJECT PhysicalDeviceObject
    )
{
}

NTKERNELAPI
BOOLEAN
IoIs32bitProcess(
    IN PIRP Irp OPTIONAL
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return FALSE;break;
        default: return TRUE;break;
    }
}

NTKERNELAPI
BOOLEAN
sdv_IoIsErrorUserInduced(
    IN NTSTATUS Status
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return FALSE;break;
        default: return TRUE;break;
    }
}

NTKERNELAPI
BOOLEAN
IoIsWdmVersionAvailable(
    IN UCHAR MajorVersion,
    IN UCHAR MinorVersion
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return FALSE;break;
        default: return TRUE;break;
    }
}

NTKERNELAPI
PIRP
IoMakeAssociatedIrp(
    IN PIRP pirp,
    IN CCHAR StackSize
    )
{
    int choice = SdvMakeChoice();
    switch (choice) 
	{
		case 0:
			sdv_IoMakeAssociatedIrp_irp->Tail.Overlay.CurrentStackLocation->MajorFunction=pirp->Tail.Overlay.CurrentStackLocation->MajorFunction;
			sdv_IoMakeAssociatedIrp_irp->IoStatus=pirp->IoStatus;
			return sdv_IoMakeAssociatedIrp_irp;
			break;
        default: 
			return NULL;
			break;
    }
}

NTKERNELAPI
PHYSICAL_ADDRESS
sdv_IoMapTransfer(
    IN PADAPTER_OBJECT AdapterObject,
    IN PMDL Mdl,
    IN PVOID MapRegisterBase,
    IN PVOID CurrentVa,
    IN OUT PULONG Length,
    IN BOOLEAN WriteToDevice
    )
{
    PHYSICAL_ADDRESS l;
    l.QuadPart = (LONGLONG) SdvKeepChoice();
    return l;
}

VOID
sdv_IoMarkIrpPending(
    IN OUT PIRP pirp
    )
{
}

NTKERNELAPI
NTSTATUS
IoOpenDeviceInterfaceRegistryKey(
    IN PUNICODE_STRING SymbolicLinkName,
    IN ACCESS_MASK DesiredAccess,
    OUT PHANDLE DeviceInterfaceKey
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_OBJECT_NAME_NOT_FOUND;break;
        case 3: return STATUS_OBJECT_PATH_NOT_FOUND;break;
        default: return STATUS_INVALID_PARAMETER;break;
    }
}

NTKERNELAPI
NTSTATUS
IoOpenDeviceRegistryKey(
    IN PDEVICE_OBJECT DeviceObject,
    IN ULONG DevInstKeyType,
    IN ACCESS_MASK DesiredAccess,
    OUT PHANDLE DevInstRegKey
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_INVALID_PARAMETER;break;
        default: return STATUS_INVALID_DEVICE_REQUEST;break;
    }
}

#ifdef SDV_Include_NTDDK
NTKERNELAPI
NTSTATUS
IoQueryDeviceDescription(
    IN PINTERFACE_TYPE BusType OPTIONAL,
    IN PULONG BusNumber OPTIONAL,
    IN PCONFIGURATION_TYPE ControllerType OPTIONAL,
    IN PULONG ControllerNumber OPTIONAL,
    IN PCONFIGURATION_TYPE PeripheralType OPTIONAL,
    IN PULONG PeripheralNumber OPTIONAL,
    IN PIO_QUERY_DEVICE_ROUTINE CalloutRoutine,
    IN PVOID Context
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}
#endif

NTKERNELAPI
VOID
IoQueueWorkItem(
    IN PIO_WORKITEM IoWorkItem,
    IN PIO_WORKITEM_ROUTINE WorkerRoutine,
    IN WORK_QUEUE_TYPE QueueType,
    IN PVOID Context
    )
{
  #ifdef SDV_HARNESS_QUEUE_WORK_ITEMS_ROUTINE
      sdv_RunIoQueueWorkItems(IoWorkItem,WorkerRoutine,QueueType,Context);
  #endif
}

NTKERNELAPI
VOID
IoQueueWorkItemEx(
    IN PIO_WORKITEM IoWorkItem,
    IN PIO_WORKITEM_ROUTINE_EX WorkerRoutine,
    IN WORK_QUEUE_TYPE QueueType,
    IN PVOID Context
    )
{
  #ifdef SDV_HARNESS_QUEUE_WORK_ITEMS_ROUTINE_EX
      sdv_RunIoQueueWorkItemsEx(IoWorkItem,WorkerRoutine,QueueType,Context);
  #endif

}

NTKERNELAPI
VOID
IoRaiseHardError(
    IN PIRP Irp,
    IN PVPB Vpb OPTIONAL,
    IN PDEVICE_OBJECT RealDeviceObject
    )
{
}

NTKERNELAPI
BOOLEAN
IoRaiseInformationalHardError(
    IN NTSTATUS ErrorStatus,
    IN PUNICODE_STRING String OPTIONAL,
    IN PKTHREAD Thread OPTIONAL
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return FALSE;break;
        default: return TRUE;break;
    }
}

#ifdef SDV_Include_NTDDK
NTKERNELAPI
VOID
IoRegisterBootDriverReinitialization(
    IN PDRIVER_OBJECT DriverObject,
    IN PDRIVER_REINITIALIZE DriverReinitializationRoutine,
    IN PVOID Context
    )
{
}
#endif


NTKERNELAPI
NTSTATUS
NTAPI
IoRegisterDeviceInterface(
    IN PDEVICE_OBJECT PhysicalDeviceObject,
    IN CONST GUID *InterfaceClassGuid,
    IN PUNICODE_STRING ReferenceString, OPTIONAL
    OUT PUNICODE_STRING SymbolicLinkName
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: SdvAssume(SymbolicLinkName->Buffer != NULL);
                return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_INVALID_DEVICE_REQUEST;break;
    }
}

#ifdef SDV_Include_NTDDK
NTKERNELAPI
VOID
IoRegisterDriverReinitialization(
    IN PDRIVER_OBJECT DriverObject,
    IN PDRIVER_REINITIALIZE DriverReinitializationRoutine,
    IN PVOID Context
    )
{
}
#endif
NTKERNELAPI
NTSTATUS
IoRegisterLastChanceShutdownNotification(
    IN PDEVICE_OBJECT DeviceObject
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoRegisterPlugPlayNotification(
    IN IO_NOTIFICATION_EVENT_CATEGORY EventCategory,
    IN ULONG EventCategoryFlags,
    IN PVOID EventCategoryData OPTIONAL,
    IN PDRIVER_OBJECT DriverObject,
    IN PDRIVER_NOTIFICATION_CALLBACK_ROUTINE CallbackRoutine,
    IN PVOID Context,
    OUT PVOID *NotificationEntry
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoRegisterShutdownNotification(
    IN PDEVICE_OBJECT DeviceObject
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
VOID
IoReleaseCancelSpinLock(
    IN KIRQL new_irql
    )
{
    SDV_IRQL_POPTO(new_irql);
}


NTKERNELAPI
VOID
NTAPI
IoReleaseRemoveLockEx(
     PIO_REMOVE_LOCK RemoveLock,
     PVOID       Tag, 
     ULONG           RemlockSize 
    )
{
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTKERNELAPI
VOID
NTAPI
IoReleaseRemoveLockAndWaitEx(
     PIO_REMOVE_LOCK RemoveLock,
     PVOID       Tag,
     ULONG           RemlockSize 
    )
{
}

VOID
sdv_IoReleaseRemoveLockEx(
     PIO_REMOVE_LOCK RemoveLock,
     PVOID       Tag, 
     ULONG           RemlockSize 
    )
{
}

VOID
sdv_IoReleaseRemoveLockAndWaitEx(
     PIO_REMOVE_LOCK RemoveLock,
     PVOID       Tag,
     ULONG           RemlockSize 
    )
{
    sdv_Io_Removelock_release_wait_returned = 1;
}

VOID
sdv_IoReleaseRemoveLockAndWait(
    IN PIO_REMOVE_LOCK RemoveLock,
    IN PVOID Tag
    )
{
    sdv_Io_Removelock_release_wait_returned = 1;
}

NTKERNELAPI
VOID
IoRemoveShareAccess(
    IN PFILE_OBJECT FileObject,
    IN OUT PSHARE_ACCESS ShareAccess
    )
{
}

NTKERNELAPI
NTSTATUS
IoReportDetectedDevice(
    IN PDRIVER_OBJECT DriverObject,
    IN INTERFACE_TYPE LegacyBusType,
    IN ULONG BusNumber,
    IN ULONG SlotNumber,
    IN PCM_RESOURCE_LIST ResourceList,
    IN PIO_RESOURCE_REQUIREMENTS_LIST ResourceRequirements OPTIONAL,
    IN BOOLEAN ResourceAssigned,
    IN OUT PDEVICE_OBJECT *DeviceObject
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoReportResourceForDetection(
    IN PDRIVER_OBJECT DriverObject,
    IN PCM_RESOURCE_LIST DriverList OPTIONAL,
    IN ULONG DriverListSize OPTIONAL,
    IN PDEVICE_OBJECT DeviceObject OPTIONAL,
    IN PCM_RESOURCE_LIST DeviceList OPTIONAL,
    IN ULONG DeviceListSize OPTIONAL,
    OUT PBOOLEAN ConflictDetected
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_CONFLICTING_ADDRESSES;break;
    }
}

NTKERNELAPI
NTSTATUS
IoReportResourceUsage(
    IN PUNICODE_STRING DriverClassName OPTIONAL,
    IN PDRIVER_OBJECT DriverObject,
    IN PCM_RESOURCE_LIST DriverList OPTIONAL,
    IN ULONG DriverListSize OPTIONAL,
    IN PDEVICE_OBJECT DeviceObject,
    IN PCM_RESOURCE_LIST DeviceList OPTIONAL,
    IN ULONG DeviceListSize OPTIONAL,
    IN BOOLEAN OverrideConflict,
    OUT PBOOLEAN ConflictDetected
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoReportTargetDeviceChange(
    IN PDEVICE_OBJECT PhysicalDeviceObject,
    IN PVOID NotificationStructure
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_INVALID_DEVICE_REQUEST;break;
    }
}

NTKERNELAPI
NTSTATUS
IoReportTargetDeviceChangeAsynchronous(
    IN PDEVICE_OBJECT PhysicalDeviceObject,
    IN PVOID NotificationStructure,
    IN PDEVICE_CHANGE_COMPLETE_CALLBACK Callback OPTIONAL,
    IN PVOID Context OPTIONAL
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_INVALID_DEVICE_REQUEST;break;
    }
}

NTKERNELAPI
VOID
IoRequestDeviceEject(
    IN PDEVICE_OBJECT PhysicalDeviceObject
    )
{
}

NTKERNELAPI
VOID
sdv_IoRequestDpc(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp,
    IN PVOID Context
    )
{
    sdv_dpc_io_registered = TRUE;
#ifdef SDV_RUN_KE_DPC_ROUTINES           
    sdv_RunIoDpcRoutines(Context,DeviceObject,Irp,Context);
#endif            

}


NTKERNELAPI
VOID
IoReuseIrp(
    IN OUT PIRP Irp,
    IN NTSTATUS Status
    )
{
    Irp->IoStatus.Status=Status;
}

PDRIVER_CANCEL
sdv_IoSetCancelRoutine(
    IN PIRP pirp,
    IN PDRIVER_CANCEL CancelRoutine
    )
{
    
    PDRIVER_CANCEL r = (PDRIVER_CANCEL) pirp->CancelRoutine;
    pirp->CancelRoutine = CancelRoutine;
    return r;
}

NTKERNELAPI
VOID
sdv_IoSetCompletionRoutine(
    IN PIRP pirp,
    IN PIO_COMPLETION_ROUTINE CompletionRoutine,
    IN PVOID Context,
    IN BOOLEAN InvokeOnSuccess,
    IN BOOLEAN InvokeOnError,
    IN BOOLEAN InvokeOnCancel
    )
{
    PIO_STACK_LOCATION irpSp;
    irpSp = IoGetNextIrpStackLocation(pirp);
    irpSp->CompletionRoutine = CompletionRoutine;
    sdv_compFset = 1;
    sdv_context = Context;
    sdv_invoke_on_success = InvokeOnSuccess;
    sdv_invoke_on_error = InvokeOnError;
    sdv_invoke_on_cancel = InvokeOnCancel;

}

NTKERNELAPI
NTSTATUS
IoSetCompletionRoutineEx(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp,
    IN PIO_COMPLETION_ROUTINE CompletionRoutine,
    IN PVOID Context,
    IN BOOLEAN InvokeOnSuccess,
    IN BOOLEAN InvokeOnError,
    IN BOOLEAN InvokeOnCancel
    )
{
    PIO_STACK_LOCATION irpSp;
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: 
           irpSp = IoGetNextIrpStackLocation(Irp);
           irpSp->CompletionRoutine = CompletionRoutine;
           sdv_compFset = 1;
           sdv_context = Context;
           sdv_invoke_on_success = InvokeOnSuccess;
           sdv_invoke_on_error = InvokeOnError;
           sdv_invoke_on_cancel = InvokeOnCancel;
 	   return STATUS_SUCCESS;
	   break;
        default: return STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

NTKERNELAPI
NTSTATUS
IoSetDeviceInterfaceState(
    IN PUNICODE_STRING SymbolicLinkName,
    IN BOOLEAN Enable
    )
{
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_INVALID_DEVICE_REQUEST;break;
        case 2: return STATUS_INSUFFICIENT_RESOURCES;break;
        case 3: return STATUS_BUFFER_TOO_SMALL;break;
        case 4: return STATUS_OBJECT_NAME_NOT_FOUND;break;
        default: return STATUS_OBJECT_NAME_EXISTS;break;
    }
}

NTKERNELAPI
VOID
IoSetHardErrorOrVerifyDevice(
    IN PIRP Irp,
    IN PDEVICE_OBJECT DeviceObject
    )
{
}

NTKERNELAPI
VOID
sdv_IoSetNextIrpStackLocation(
    IN OUT PIRP Irp
    )
{
}

NTKERNELAPI
VOID
IoSetShareAccess(
    IN ACCESS_MASK DesiredAccess,
    IN ULONG DesiredShareAccess,
    IN OUT PFILE_OBJECT FileObject,
    OUT PSHARE_ACCESS ShareAccess
    )
{
}

VOID
IoSetStartIoAttributes(
    IN PDEVICE_OBJECT DeviceObject,
    IN BOOLEAN DeferredStartIo,
    IN BOOLEAN NonCancelable
    )
{
}

NTKERNELAPI
NTSTATUS
IoSetSystemPartition(
    PUNICODE_STRING VolumeNameString
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
BOOLEAN
IoSetThreadHardErrorMode(
    IN BOOLEAN EnableHardErrors
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return FALSE;break;
        default: return TRUE;break;
    }
}

NTKERNELAPI
USHORT
sdv_IoSizeOfIrp(
    IN CCHAR StackSize
    )
{
    USHORT l = (USHORT) SdvKeepChoice();
    return l;
}

NTKERNELAPI
ULONG
sdv_IoSizeofWorkItem(
    VOID
    )
{
    ULONG l = SdvKeepChoice();
    return l;
}

FORCEINLINE
VOID
sdv_IoSkipCurrentIrpStackLocation(
    IN PIRP pirp
    )
{
    SDV_MACRO_COPYCURRENTIRPSTACKLOCATIONTONEXT(pirp)
}

NTKERNELAPI
VOID
IoStartNextPacket(
    IN PDEVICE_OBJECT DeviceObject,
    IN BOOLEAN Cancelable
    )
{
#ifdef SDV_HARNESS_DRIVERSTARTIO_ROUTINE
	sdv_stub_startio_begin();
#ifdef fun_DriverStartIo
    sdv_StartIopirp->CancelRoutine = NULL;
    sdv_StartIopirp->Cancel = FALSE;
    fun_DriverStartIo(DeviceObject, sdv_StartIopirp);
#else
    sdv_DoNothing();
#endif
    sdv_stub_startio_end();
#endif
}

VOID 
IoStartNextPacketByKey(
    IN PDEVICE_OBJECT DeviceObject,
    IN BOOLEAN Cancelable,
    IN ULONG Key
    )
{

}

NTKERNELAPI
VOID
IoStartPacket(
    IN PDEVICE_OBJECT DeviceObject,
    IN PIRP Irp,
    IN PULONG Key OPTIONAL,
    IN PDRIVER_CANCEL CancelFunction OPTIONAL
    )
{
#ifdef SDV_HARNESS_DRIVERSTARTIO_ROUTINE
	sdv_stub_startio_begin();
#ifdef fun_DriverStartIo
    sdv_StartIopirp->CancelRoutine = CancelFunction;
    sdv_StartIopirp->Cancel = FALSE;
    fun_DriverStartIo(DeviceObject, Irp);
#else
    sdv_DoNothing();
#endif
    sdv_stub_startio_end();
#endif
}

NTKERNELAPI
VOID
IoStartTimer(
    IN PDEVICE_OBJECT DeviceObject
    )
{
}

NTKERNELAPI
VOID
IoStopTimer(
    IN PDEVICE_OBJECT DeviceObject
    )
{
}

VOID
IoUninitializeWorkItem(
    IN PIO_WORKITEM IoWorkItem
    )
{
}

NTKERNELAPI
NTSTATUS
IoUnregisterPlugPlayNotification(
    IN PVOID NotificationEntry
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
VOID
IoUnregisterShutdownNotification(
    IN PDEVICE_OBJECT DeviceObject
    )
{
}

NTKERNELAPI
VOID
IoUpdateShareAccess(
    IN PFILE_OBJECT FileObject,
    IN OUT PSHARE_ACCESS ShareAccess
    )
{
}

NTSTATUS
IoValidateDeviceIoControlAccess(
    IN PIRP pirp,
    IN ULONG RequiredAccess
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_ACCESS_DENIED;break;
        default: return STATUS_INVALID_PARAMETER;break;
    }
}

NTKERNELAPI
NTSTATUS
IoVerifyPartitionTable(
    IN PDEVICE_OBJECT DeviceObject,
    IN BOOLEAN FixErrors
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_DISK_CORRUPT_ERROR;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoVolumeDeviceToDosName(
    IN PVOID VolumeDeviceObject,
    OUT PUNICODE_STRING DosName
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoWMIAllocateInstanceIds(
    IN GUID *Guid,
    IN ULONG InstanceCount,
    OUT ULONG *FirstInstanceId
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

NTKERNELAPI
NTSTATUS
IoWMIDeviceObjectToInstanceName(
    IN PVOID DataBlockObject,
    IN PDEVICE_OBJECT DeviceObject,
    OUT PUNICODE_STRING InstanceName
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_WMI_INSTANCE_NOT_FOUND;break;
    }
}

NTKERNELAPI
ULONG
sdv_IoWMIDeviceObjectToProviderId(
    IN PDEVICE_OBJECT DeviceObject
    )
{
    ULONG l = SdvKeepChoice();
    return l;
}

NTKERNELAPI
NTSTATUS
IoWMIExecuteMethod(
    IN PVOID DataBlockObject,
    IN PUNICODE_STRING InstanceName,
    IN ULONG MethodId,
    IN ULONG InBufferSize,
    IN OUT PULONG OutBufferSize,
    IN OUT PUCHAR InOutBuffer
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_WMI_GUID_NOT_FOUND;break;
        case 3: return STATUS_WMI_INSTANCE_NOT_FOUND;break;
        case 4: return STATUS_WMI_ITEMID_NOT_FOUND;break;
        default: return STATUS_BUFFER_TOO_SMALL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoWMIHandleToInstanceName(
    IN PVOID DataBlockObject,
    IN HANDLE FileHandle,
    OUT PUNICODE_STRING InstanceName
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_WMI_INSTANCE_NOT_FOUND;break;
    }
}

NTKERNELAPI
NTSTATUS
IoWMIOpenBlock(
    IN GUID *DataBlockGuid,
    IN ULONG DesiredAccess,
    OUT PVOID *DataBlockObject
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoWMIQueryAllData(
    IN PVOID DataBlockObject,
    IN OUT ULONG *InOutBufferSize,
    OUT PVOID OutBuffer
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_WMI_GUID_NOT_FOUND;break;
        default: return STATUS_BUFFER_TOO_SMALL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoWMIQueryAllDataMultiple(
    IN PVOID *DataBlockObjectList,
    IN ULONG ObjectCount,
    IN OUT ULONG *InOutBufferSize,
    OUT PVOID OutBuffer
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_BUFFER_TOO_SMALL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoWMIQuerySingleInstance(
    IN PVOID DataBlockObject,
    IN PUNICODE_STRING InstanceName,
    IN OUT ULONG *InOutBufferSize,
    OUT PVOID OutBuffer
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_WMI_GUID_NOT_FOUND;break;
        case 3: return STATUS_WMI_INSTANCE_NOT_FOUND;break;
        default: return STATUS_BUFFER_TOO_SMALL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoWMIQuerySingleInstanceMultiple(
    IN PVOID *DataBlockObjectList,
    IN PUNICODE_STRING InstanceNames,
    IN ULONG ObjectCount,
    IN OUT ULONG *InOutBufferSize,
    OUT PVOID OutBuffer
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_BUFFER_TOO_SMALL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoWMIRegistrationControl(
    IN PDEVICE_OBJECT DeviceObject,
    IN ULONG Action
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_INVALID_PARAMETER;break;
    }
}

#if WINVER > 0x0500
NTKERNELAPI
NTSTATUS
IoWMISetNotificationCallback(
    IN PVOID Object,
    IN WMI_NOTIFICATION_CALLBACK Callback,
    IN PVOID Context
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}
#endif

#if WINVER > 0x0500
NTKERNELAPI
NTSTATUS
IoWMISetSingleInstance(
    IN PVOID DataBlockObject,
    IN PUNICODE_STRING InstanceName,
    IN ULONG Version,
    IN ULONG ValueBufferSize,
    IN PVOID ValueBuffer
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_WMI_GUID_NOT_FOUND;break;
        case 3: return STATUS_WMI_INSTANCE_NOT_FOUND;break;
        case 4: return STATUS_WMI_READ_ONLY;break;
        default: return STATUS_WMI_SET_FAILURE;break;
    }
}
#endif

#if WINVER > 0x0500
NTKERNELAPI
NTSTATUS
IoWMISetSingleItem(
    IN PVOID DataBlockObject,
    IN PUNICODE_STRING InstanceName,
    IN ULONG DataItemId,
    IN ULONG Version,
    IN ULONG ValueBufferSize,
    IN PVOID ValueBuffer
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_WMI_GUID_NOT_FOUND;break;
        case 3: return STATUS_WMI_INSTANCE_NOT_FOUND;break;
        case 4: return STATUS_WMI_ITEMID_NOT_FOUND;break;
        case 5: return STATUS_WMI_READ_ONLY;break;
        default: return STATUS_WMI_SET_FAILURE;break;
    }
}
#endif

NTKERNELAPI
NTSTATUS
IoWMISuggestInstanceName(
    IN PDEVICE_OBJECT PhysicalDeviceObject OPTIONAL,
    IN PUNICODE_STRING SymbolicLinkName OPTIONAL,
    IN BOOLEAN CombineNames,
    OUT PUNICODE_STRING SuggestedInstanceName
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_INSUFFICIENT_RESOURCES;break;
        default: return STATUS_NO_MEMORY;break;
    }
}

NTKERNELAPI
NTSTATUS
IoWMIWriteEvent(
    IN PVOID WnodeEventItem
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_BUFFER_OVERFLOW;break;
        default: return STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

NTKERNELAPI
VOID
IoWriteErrorLogEntry(
    IN PVOID ElEntry
    )
{
}




NTKERNELAPI
NTSTATUS
IoAttachDeviceToDeviceStackSafe(
    IN PDEVICE_OBJECT SourceDevice,
    IN PDEVICE_OBJECT TargetDevice,
    IN OUT PDEVICE_OBJECT *AttachedToDeviceObject 
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_NO_SUCH_DEVICE;break;
    }
}



NTKERNELAPI
NTSTATUS
IoCheckEaBufferValidity(
    IN PFILE_FULL_EA_INFORMATION EaBuffer,
    IN ULONG EaLength,
    OUT PULONG ErrorOffset
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_EA_LIST_INCONSISTENT;break;
    }
}






NTKERNELAPI
NTSTATUS
IoCreateFileSpecifyDeviceObjectHint(
    OUT PHANDLE FileHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    IN PLARGE_INTEGER AllocationSize OPTIONAL,
    IN ULONG FileAttributes,
    IN ULONG ShareAccess,
    IN ULONG Disposition,
    IN ULONG CreateOptions,
    IN PVOID EaBuffer OPTIONAL,
    IN ULONG EaLength,
    IN CREATE_FILE_TYPE CreateFileType,
    IN PVOID ExtraCreateParameters OPTIONAL,
    IN ULONG Options,
    IN PVOID DeviceObject
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_INVALID_DEVICE_OBJECT_PARAMETER;break;
        case 3: return STATUS_MOUNT_POINT_NOT_RESOLVED;break;
        default: return STATUS_OBJECT_PATH_SYNTAX_BAD;break;
    }
}




NTKERNELAPI
NTSTATUS
IoEnumerateDeviceObjectList(
    IN PDRIVER_OBJECT DriverObject,
    IN PDEVICE_OBJECT *DeviceObjectList,
    IN ULONG DeviceObjectListSize,
    OUT PULONG ActualNumberDeviceObjects
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_BUFFER_TOO_SMALL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoEnumerateRegisteredFiltersList(
    IN PDRIVER_OBJECT *DriverObjectList,
    IN ULONG DriverObjectListSize,
    OUT PULONG ActualNumberDriverObjects
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_BUFFER_TOO_SMALL;break;
    }
}





NTKERNELAPI
NTSTATUS
IoGetDiskDeviceObject(
    IN PDEVICE_OBJECT FileSystemDeviceObject,
    OUT PDEVICE_OBJECT *DeviceObject
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_INVALID_PARAMETER;break;
        case 1: return STATUS_VOLUME_DISMOUNTED;break;
        default: return STATUS_SUCCESS;break;
    }
}




NTKERNELAPI
NTSTATUS
IoGetRequestorSessionId(
    IN PIRP Irp,
    OUT PULONG pSessionId
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}









NTKERNELAPI
NTSTATUS
IoQueryFileDosDeviceName(
    IN PFILE_OBJECT FileObject,
    OUT POBJECT_NAME_INFORMATION *ObjectNameInformation
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_INSUFFICIENT_RESOURCES;break;
    }
}










NTKERNELAPI
NTSTATUS
IoSetFileOrigin(
    IN PFILE_OBJECT FileObject,
    IN BOOLEAN Remote
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_INVALID_PARAMETER_MIX;break;
    }
}







NTKERNELAPI
NTSTATUS
IoVerifyVolume(
    IN PDEVICE_OBJECT DeviceObject,
    IN BOOLEAN AllowRawMount
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_INSUFFICIENT_RESOURCES;break;
        case 2: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_WRONG_VOLUME;break;
    }
}






#if WINVER > 0x0500
NTKERNELAPI
NTSTATUS
IoCreateDisk(
    IN PDEVICE_OBJECT DeviceObject,
    IN PCREATE_DISK Disk
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}
#endif

#if WINVER > 0x0500
#ifdef SDV_Include_NTDDK
NTKERNELAPI
NTSTATUS
IoReadDiskSignature(
    IN PDEVICE_OBJECT DeviceObject,
    IN ULONG BytesPerSector,
    OUT PDISK_SIGNATURE Signature
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_DISK_CORRUPT_ERROR;break;
    }
}
#endif
#endif

#if WINVER > 0x0500
DECLSPEC_DEPRECATED_DDK
#endif
NTKERNELAPI
NTSTATUS
#if WINVER > 0x0500
FASTCALL
#endif
IoReadPartitionTable(
    IN PDEVICE_OBJECT DeviceObject,
    IN ULONG SectorSize,
    IN BOOLEAN ReturnRecognizedPartitions,
    OUT struct _DRIVE_LAYOUT_INFORMATION **PartitionBuffer
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoReadPartitionTableEx(
    IN PDEVICE_OBJECT DeviceObject,
    IN struct _DRIVE_LAYOUT_INFORMATION_EX **PartitionBuffer
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: *PartitionBuffer=&sdv_IoReadPartitionTableEx_DRIVE_LAYOUT_INFORMATION_EX;
                return STATUS_SUCCESS;
				break;
        default: *PartitionBuffer=NULL;
                 return STATUS_UNSUCCESSFUL;
				 break;
    }
}

#if WINVER > 0x0500
DECLSPEC_DEPRECATED_DDK
#endif
NTKERNELAPI
NTSTATUS
#if WINVER > 0x0500
FASTCALL
#endif
IoSetPartitionInformation(
    IN PDEVICE_OBJECT DeviceObject,
    IN ULONG SectorSize,
    IN ULONG PartitionNumber,
    IN ULONG PartitionType
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTKERNELAPI
NTSTATUS
IoSetPartitionInformationEx(
    IN PDEVICE_OBJECT DeviceObject,
    IN ULONG PartitionNumber,
    IN struct _SET_PARTITION_INFORMATION_EX *PartitionInfo
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

#if WINVER > 0x0500
DECLSPEC_DEPRECATED_DDK
#endif
NTKERNELAPI
NTSTATUS
#if WINVER > 0x0500
FASTCALL
#endif
IoWritePartitionTable(
    IN PDEVICE_OBJECT DeviceObject,
    IN ULONG SectorSize,
    IN ULONG SectorsPerTrack,
    IN ULONG NumberOfHeads,
    IN struct _DRIVE_LAYOUT_INFORMATION *PartitionBuffer
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_DEVICE_NOT_READY;break;
        default: return STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

NTKERNELAPI
NTSTATUS
IoWritePartitionTableEx(
    IN PDEVICE_OBJECT DeviceObject,
    IN struct _DRIVE_LAYOUT_INFORMATION_EX *PartitionBuffer
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_DEVICE_NOT_READY;break;
        default: return STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

VOID IoAcquireVpbSpinLock(
  __out  PKIRQL Irql
)
{
   *Irql=sdv_irql_current;
    
}

VOID IoReleaseVpbSpinLock(
  __in  KIRQL Irql
)
{
   SDV_IRQL_POPTO(Irql);
}

NTKERNELAPI
VOID
NTAPI
IoInitializeRemoveLockEx(
     PIO_REMOVE_LOCK Lock,
     ULONG  AllocateTag, 
     ULONG  MaxLockedMinutes, 
     ULONG  HighWatermark, 
     ULONG  RemlockSize 
    )
{
}


NTSTATUS
IoGetDeviceNumaNode (
     PDEVICE_OBJECT Pdo,
     PUSHORT NodeNumber
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}


#ifdef DEVPROPKEY_DEFINED
NTSTATUS
IoGetDevicePropertyData (
     PDEVICE_OBJECT     Pdo,
     const DEVPROPKEY   *PropertyKey,
     LCID               Lcid,
     ULONG        Flags,
     ULONG              Size,
     PVOID             Data,
     PULONG            RequiredSize,
     PDEVPROPTYPE      Type
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}
#endif

_IRQL_requires_max_(PASSIVE_LEVEL)
_Must_inspect_result_
NTKERNELAPI
NTSTATUS
NTAPI
IoReplacePartitionUnit (
     PDEVICE_OBJECT TargetPdo,
     PDEVICE_OBJECT SparePdo,
     ULONG Flags
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

#ifdef DEVPROPKEY_DEFINED
NTSTATUS
IoSetDevicePropertyData (
     PDEVICE_OBJECT     Pdo,
     const DEVPROPKEY   *PropertyKey,
     LCID               Lcid,
     ULONG              Flags,
     DEVPROPTYPE        Type,
     ULONG              Size,
     PVOID          Data
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}
#endif
NTSTATUS
IoUnregisterPlugPlayNotificationEx(
     PVOID NotificationEntry
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}


VOID
IoSetShareAccessEx(
      ACCESS_MASK DesiredAccess,
      ULONG DesiredShareAccess,
     PFILE_OBJECT FileObject,
     PSHARE_ACCESS ShareAccess,
     PBOOLEAN WritePermission
    )
{
}


/* ..\wdm\ntddk-io.c end */

/* ..\wdm\ntddk-rtl.c begin */
/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/

NTSYSAPI
NTSTATUS
NTAPI
RtlAnsiStringToUnicodeString(
    PUNICODE_STRING DestinationString,
    PANSI_STRING SourceString,
    BOOLEAN AllocateDestinationString
    )
{
    int x = SdvMakeChoice();
    switch (x) {
        case 0: 
            DestinationString->Length = SourceString->Length;
            if ( AllocateDestinationString == TRUE ) 
            {
                DestinationString->Buffer = malloc(1); 
                int m = SdvKeepChoice(); 
                SdvAssume (SourceString->Length <= m);
                DestinationString->MaximumLength = m;
                return STATUS_SUCCESS;                  
            } 
            else 
            {
                return STATUS_SUCCESS;
            }
            break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
VOID
NTAPI
RtlAssert(
    PVOID FailedAssertion,
    PVOID FileName,
    ULONG LineNumber,
    PCHAR Message
    ) 
{
}

NTSYSAPI                                            
NTSTATUS                                            
NTAPI                                               
RtlCharToInteger(                                  
    PCSZ String,                                    
    ULONG Base,                                     
    PULONG Value                                    
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_INVALID_PARAMETER;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
RtlCheckRegistryKey(
    IN ULONG RelativeTo,
    IN PWSTR Path
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_INVALID_PARAMETER;break;
    }
}

NTSYSAPI
SIZE_T
NTAPI
RtlCompareMemory(
    const VOID *Source1,
    const VOID *Source2,
    SIZE_T Length
    )
{
    SIZE_T r = SdvKeepChoice();
    return r;
}

NTSYSAPI
VOID
NTAPI
RtlCopyMemory32(
   VOID UNALIGNED *Destination,
   CONST VOID UNALIGNED *Source,
   ULONG Length
   ) 
{  
}

VOID 
RtlCopyMemory(
			IN VOID UNALIGNED  *Destination,
			IN CONST VOID UNALIGNED  *Source,
			IN SIZE_T  Length
		)
{
}


NTSYSAPI
NTSTATUS
NTAPI
RtlCreateRegistryKey(
    IN ULONG RelativeTo,
    IN PWSTR Path
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
RtlCreateSecurityDescriptor(
    PSECURITY_DESCRIPTOR SecurityDescriptor,
    ULONG Revision
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNKNOWN_REVISION;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
RtlDeleteRegistryValue(
    IN ULONG RelativeTo,
    IN PCWSTR Path,
    IN PCWSTR ValueName
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
ULONG
NTAPI
RtlFindLastBackwardRunClear(
    IN PRTL_BITMAP BitMapHeader,
    IN ULONG FromIndex,
    IN PULONG StartingRunIndex
    )
{
    ULONG r = SdvKeepChoice();
    return r;
}

NTSYSAPI
CCHAR
NTAPI
RtlFindLeastSignificantBit(
    IN ULONGLONG Set
    )
{
    CCHAR r = (CCHAR) SdvKeepChoice();
    return r;
}

NTSYSAPI
CCHAR
NTAPI
RtlFindMostSignificantBit(
    IN ULONGLONG Set
    )
{
    CCHAR r = (CCHAR) SdvKeepChoice();
    return r;
}

NTSYSAPI
VOID
NTAPI
RtlFreeAnsiString(
    PANSI_STRING AnsiString
    ) 
{  
}

NTSYSAPI
VOID
NTAPI
RtlFreeUnicodeString(
    PUNICODE_STRING UnicodeString
    ) 
{ 
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
RtlGetVersion(
    OUT PRTL_OSVERSIONINFOW lpVersionInformation
    )
{
    return STATUS_SUCCESS;
}

NTSYSAPI
NTSTATUS
NTAPI
RtlGUIDFromString(
    IN PUNICODE_STRING GuidString,
    OUT GUID* Guid
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
VOID
NTAPI
RtlInitAnsiString(
    PANSI_STRING DestinationString,
    PCSZ SourceString
    ) 
{  
}

NTSYSAPI
VOID
NTAPI
RtlInitString(
    PSTRING DestinationString,
    PCSZ SourceString
    ) 
{  
}

NTSYSAPI
VOID
NTAPI
RtlInitUnicodeString(
    IN OUT PUNICODE_STRING DestinationString,
    IN PCWSTR SourceString
    ) 
{  
    /* 
        Disable for RtlInitUnicodeString: C4090: '=' : different
        'const' qualifiers.
      
        This is correctly flagged by the compiler, and would be a serious
        issue if the harness was to be executed rather than simulated.

        However, in this case this is per design in order to simulate
        copy of data:
    */
    #pragma warning(disable:4090)

    if (DestinationString) 
    {
        DestinationString->Buffer = SourceString;
	DestinationString->Length = 100;
	
    }
    if ( SourceString == NULL)
    {
        DestinationString->Length = 0;
        DestinationString->MaximumLength = 0;
    }
     /* Enable after RtlInitUnicodeString: C4090: */
   #pragma warning(default:4090)
}

NTSYSAPI
NTSTATUS
NTAPI
RtlInitUnicodeStringEx(
    IN OUT PUNICODE_STRING DestinationString,
    IN PCWSTR SourceString
    ) 
{  
    /* 
        Disable for RtlInitUnicodeString: C4090: '=' : different
        'const' qualifiers.
      
        This is correctly flagged by the compiler, and would be a serious
        issue if the harness was to be executed rather than simulated.

        However, in this case this is per design in order to simulate
        copy of data:
    */
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_NAME_TOO_LONG;break;
        default: 
        #pragma warning(disable:4090)
        if (DestinationString) 
        {
            DestinationString->Buffer = SourceString;
        
        }
        /* Enable after RtlInitUnicodeString: C4090: */
        #pragma warning(default:4090)
        return STATUS_SUCCESS;
        break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
RtlInt64ToUnicodeString(
    IN ULONGLONG Value,
    IN ULONG Base OPTIONAL,
    IN OUT PUNICODE_STRING String
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {

        case 0: return STATUS_SUCCESS;break;
#ifdef SLAM_PRECISE_STATUS
        case 1: return STATUS_BUFFER_OVERFLOW ;break;
        case 2: return STATUS_INVALID_PARAMETER ;break;
#else
        default: return STATUS_UNSUCCESSFUL;break;
#endif
    }
}

NTSYSAPI
NTSTATUS
NTAPI
RtlIntegerToUnicodeString(
    ULONG Value,
    ULONG Base,
    PUNICODE_STRING String
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {

        case 0: return STATUS_SUCCESS;break;
#ifdef SLAM_PRECISE_STATUS
        case 1: return STATUS_BUFFER_OVERFLOW ;break;
        case 2: return STATUS_INVALID_PARAMETER ;break;
#else
        default: return STATUS_UNSUCCESSFUL;break;
#endif
    }
}

NTSYSAPI
ULONG
NTAPI
RtlLengthSecurityDescriptor(
    PSECURITY_DESCRIPTOR SecurityDescriptor
    )
{
    ULONG r = SdvKeepChoice();
    return r;
}

NTSYSAPI
VOID
NTAPI
RtlMapGenericMask(
    PACCESS_MASK AccessMask,
    PGENERIC_MAPPING GenericMapping
    ) 
{  
}

NTSYSAPI
VOID
NTAPI
sdv_RtlMoveMemory(
    VOID UNALIGNED *Destination,
    CONST VOID UNALIGNED *Source,
    SIZE_T Length
    ) 
{
}

NTSYSAPI
NTSTATUS
NTAPI
sdv_RtlQueryRegistryValues(
    IN ULONG RelativeTo,
    IN PCWSTR Path,
    IN PRTL_QUERY_REGISTRY_TABLE QueryTable,
    IN PVOID Context,
    IN PVOID Environment OPTIONAL
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
#ifdef SLAM_PRECISE_STATUS
        case 1: return STATUS_INVALID_PARAMETER;break;
        case 2: return STATUS_OBJECT_NAME_NOT_FOUND;break;
#endif
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
RtlSetDaclSecurityDescriptor(
    PSECURITY_DESCRIPTOR SecurityDescriptor,
    BOOLEAN DaclPresent,
    PACL Dacl,
    BOOLEAN DaclDefaulted
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNKNOWN_REVISION;break;
        default: return STATUS_INVALID_SECURITY_DESCR;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
RtlStringFromGUID(
    IN REFGUID Guid,
    OUT PUNICODE_STRING GuidString
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_NO_MEMORY;break;
    }
}

ULONG
FASTCALL
RtlU_longByteSwap(
    IN ULONG Source
    )
{
    ULONG r = SdvKeepChoice();
    return r;
}

ULONGLONG
FASTCALL
RtlU_longlongByteSwap(
    IN ULONGLONG Source
    )
{
    ULONGLONG r = SdvKeepChoice();
    return r;
}

USHORT
FASTCALL
RtlU_shortByteSwap(
    IN USHORT Source
    )
{
    USHORT r = (USHORT) SdvKeepChoice();
    return r;
}

NTSYSAPI
CHAR
NTAPI
RtlUpperChar(
    CHAR Character
    )
{
    CHAR r = (CHAR) SdvKeepChoice();
    return r;
}

NTSYSAPI
BOOLEAN
NTAPI
RtlValidRelativeSecurityDescriptor(
    IN PSECURITY_DESCRIPTOR SecurityDescriptorInput,
    IN ULONG SecurityDescriptorLength,
    IN SECURITY_INFORMATION RequiredInformation
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return FALSE;
            break;
        default:
            return TRUE;
            break;
    }
}

NTSYSAPI
BOOLEAN
NTAPI
RtlValidSecurityDescriptor(
    PSECURITY_DESCRIPTOR SecurityDescriptor
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return FALSE;
            break;
        default:
            return TRUE;
            break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
_Must_inspect_result_
NTSYSAPI
NTSTATUS
NTAPI
RtlVerifyVersionInfo(
    IN PRTL_OSVERSIONINFOEXW VersionInfo,
    IN ULONG TypeMask,
    IN ULONGLONG  ConditionMask
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_INVALID_PARAMETER ;break;
        default: return STATUS_REVISION_MISMATCH ;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
RtlVolumeDeviceToDosName(
    IN  PVOID           VolumeDeviceObject,
    OUT PUNICODE_STRING DosName
    )
{
    return STATUS_SUCCESS;
}

NTSYSAPI
ULONG
NTAPI
RtlWalkFrameChain(
    OUT PVOID *Callers,
    IN ULONG Count,
    IN ULONG Flags
    ) 
{ 
    ULONG r = SdvKeepChoice(); 
    return r; 
}

NTSYSAPI
NTSTATUS
NTAPI
RtlWriteRegistryValue(
    IN ULONG RelativeTo,
    IN PCWSTR Path,
    IN PCWSTR ValueName,
    IN ULONG ValueType,
    IN PVOID ValueData,
    IN ULONG ValueLength
    )
{
    NTSTATUS r = SdvMakeChoice();
    switch (r) {
        case 0: return STATUS_SUCCESS;break;
#ifdef SLAM_PRECISE_STATUS
        case 1: return STATUS_ACCESS_DENIED;break;
        case 2: return STATUS_INVALID_HANDLE;break;
        case 3: return STATUS_INVALID_PARAMETER;break;
        case 4: return STATUS_NO_MEMORY;break;
        case 5: return STATUS_BUFFER_TOO_SMALL;break;
        case 6: return STATUS_INVALID_SID;break;
        case 7: return STATUS_BUFFER_OVERFLOW;break;
#endif
        default: return STATUS_UNSUCCESSFUL;break;
  }
}

NTSYSAPI
VOID
NTAPI
sdv_RtlZeroMemory(
    VOID UNALIGNED *Destination,
    SIZE_T Length
    ) 
{
}

NTSTATUS
RtlULongLongToULong(
    __in ULONGLONG ullOperand,
    __out ULONG* pulResult)
{
 
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_INTEGER_OVERFLOW;break;
        default:return STATUS_SUCCESS;	break;
    }
}

BOOLEAN
NTAPI
RtlCreateUnicodeString(
    __out __drv_at(DestinationString->Buffer, __drv_allocatesMem(Mem))
        PUNICODE_STRING DestinationString,
    __in_z PCWSTR SourceString
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return FALSE;
            break;
        default:
            return TRUE;
            break;
    }
}

NTSTATUS
NTAPI
RtlDowncaseUnicodeString(
    __drv_when(AllocateDestinationString, __out __drv_at(DestinationString->Buffer, __drv_allocatesMem(Mem)))
    __drv_when(!AllocateDestinationString, __inout)
        PUNICODE_STRING DestinationString,
    __in PCUNICODE_STRING SourceString,
    __in BOOLEAN AllocateDestinationString
    )
{
 
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_INTEGER_OVERFLOW;break;
        default:return STATUS_SUCCESS;	break;
    }
}


NTSTATUS
NTAPI
RtlDuplicateUnicodeString(
    __in ULONG Flags,
    __in PCUNICODE_STRING StringIn,
    __out __drv_at(StringOut->Buffer, __drv_allocatesMem(Mem))
        PUNICODE_STRING StringOut
    )
{
 
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_INTEGER_OVERFLOW;break;
        default:return STATUS_SUCCESS;	break;
    }
}


NTSYSAPI
NTSTATUS
NTAPI
RtlOemStringToCountedUnicodeString(
    __drv_when(AllocateDestinationString, __out __drv_at(DestinationString->Buffer, __drv_allocatesMem(Mem)))
    __drv_when(!AllocateDestinationString, __inout)
        PUNICODE_STRING DestinationString,
    __in PCOEM_STRING SourceString,
    __in BOOLEAN AllocateDestinationString
    )
{
 
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_INTEGER_OVERFLOW;break;
        default:return STATUS_SUCCESS;	break;
    }
}


NTSYSAPI
NTSTATUS
NTAPI
RtlOemStringToUnicodeString(
    __drv_when(AllocateDestinationString, __out __drv_at(DestinationString->Buffer, __drv_allocatesMem(Mem)))
    __drv_when(!AllocateDestinationString, __inout)
        PUNICODE_STRING DestinationString,
    __in PCOEM_STRING SourceString,
    __in BOOLEAN AllocateDestinationString
    )
{
 
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_INTEGER_OVERFLOW;break;
        default:return STATUS_SUCCESS;	break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
RtlUnicodeStringToAnsiString(
    __drv_when(AllocateDestinationString, __out __drv_at(DestinationString->Buffer, __drv_allocatesMem(Mem)))
    __drv_when(!AllocateDestinationString, __inout)
        PANSI_STRING DestinationString,
    __in PCUNICODE_STRING SourceString,
    __in BOOLEAN AllocateDestinationString
    )
{
 
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_INTEGER_OVERFLOW;break;
        default:return STATUS_SUCCESS;	break;
    }
}


NTSYSAPI
NTSTATUS
NTAPI
RtlUnicodeStringToCountedOemString(
    __drv_when(AllocateDestinationString, __out __drv_at(DestinationString->Buffer, __drv_allocatesMem(Mem)))
    __drv_when(!AllocateDestinationString, __inout)
        POEM_STRING DestinationString,
    __in PCUNICODE_STRING SourceString,
    __in BOOLEAN AllocateDestinationString
    )
{
 
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_INTEGER_OVERFLOW;break;
        default:return STATUS_SUCCESS;	break;
    }
}



NTSYSAPI
NTSTATUS
NTAPI
RtlUnicodeStringToOemString(
    __drv_when(AllocateDestinationString, __out __drv_at(DestinationString->Buffer, __drv_allocatesMem(Mem)))
    __drv_when(!AllocateDestinationString, __inout)
        POEM_STRING DestinationString,
    __in PCUNICODE_STRING SourceString,
    __in BOOLEAN AllocateDestinationString
    )
{
 
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_INTEGER_OVERFLOW;break;
        default:return STATUS_SUCCESS;	break;
    }
}




NTSYSAPI
NTSTATUS
NTAPI
RtlUpcaseUnicodeString(
    __drv_when(AllocateDestinationString, __out __drv_at(DestinationString->Buffer, __drv_allocatesMem(Mem)))
    __drv_when(!AllocateDestinationString, __inout)
        PUNICODE_STRING DestinationString,
    __in PCUNICODE_STRING SourceString,
    __in BOOLEAN AllocateDestinationString
    )
{
 
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_INTEGER_OVERFLOW;break;
        default:return STATUS_SUCCESS;	break;
    }
}



__checkReturn
NTSYSAPI
NTSTATUS
NTAPI
RtlUpcaseUnicodeStringToCountedOemString(
    __drv_when(AllocateDestinationString, __out __drv_at(DestinationString->Buffer, __drv_allocatesMem(Mem)))
    __drv_when(!AllocateDestinationString, __inout)
        POEM_STRING DestinationString,
    __in PCUNICODE_STRING SourceString,
    __in BOOLEAN AllocateDestinationString
    )
{
 
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_INTEGER_OVERFLOW;break;
        default:return STATUS_SUCCESS;	break;
    }
}


__checkReturn
NTSYSAPI
NTSTATUS
NTAPI
RtlUpcaseUnicodeStringToOemString(
    __drv_when(AllocateDestinationString, __out __drv_at(DestinationString->Buffer, __drv_allocatesMem(Mem)))
    __drv_when(!AllocateDestinationString, __inout)
        POEM_STRING DestinationString,
    __in PCUNICODE_STRING SourceString,
    __in BOOLEAN AllocateDestinationString
    )
{
 
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_INTEGER_OVERFLOW;break;
        default:return STATUS_SUCCESS;	break;
    }
}








/* ..\wdm\ntddk-rtl.c end */

/* ..\wdm\ntddk-zw.c begin */
/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/





NTSTATUS
ZwCancelTimer(
    IN HANDLE TimerHandle,
    OUT PBOOLEAN CurrentState OPTIONAL
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: return STATUS_SUCCESS;break;
#ifdef SLAM_PRECISE_STATUS
        case 1: return STATUS_OBJECT_TYPE_MISMATCH;break;
        case 2: return STATUS_ACCESS_DENIED;break;
        case 3: return STATUS_INVALID_HANDLE;break;
#endif
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwClose(
    IN HANDLE Handle
    )
{
    /*int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_INVALID_HANDLE;break;
        default: return STATUS_HANDLE_NOT_CLOSABLE;break;
    }*/
    return STATUS_SUCCESS;
}

NTSYSAPI
NTSTATUS
NTAPI
ZwCreateDirectoryObject(
    OUT PHANDLE DirectoryHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_ACCESS_DENIED;break;
        case 3: return STATUS_ACCESS_VIOLATION;break;
        default: return STATUS_DATATYPE_MISALIGNMENT;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwCreateFile(
    OUT PHANDLE FileHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    IN PLARGE_INTEGER AllocationSize OPTIONAL,
    IN ULONG FileAttributes,
    IN ULONG ShareAccess,
    IN ULONG CreateDisposition,
    IN ULONG CreateOptions,
    IN PVOID EaBuffer OPTIONAL,
    IN ULONG EaLength
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwCreateKey(
    OUT PHANDLE KeyHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes,
    IN ULONG TitleIndex,
    IN PUNICODE_STRING Class OPTIONAL,
    IN ULONG CreateOptions,
    OUT PULONG Disposition OPTIONAL
    )
{
    
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: 
        *KeyHandle = (PHANDLE) malloc(4);
        return STATUS_SUCCESS;
        break;
        #ifdef SLAM_PRECISE_STATUS
        case 1: *KeyHandle = NULL;return STATUS_OBJECT_NAME_NOT_FOUND;break;
        case 2: *KeyHandle = NULL;return STATUS_INVALID_PARAMETER;break;
        case 3: *KeyHandle = NULL;return STATUS_BUFFER_TOO_SMALL;break;
        case 4: *KeyHandle = NULL;return STATUS_TOO_LATE;break;
        case 5: *KeyHandle = NULL;return STATUS_INVALID_PARAMETER_4;break;
        case 6: *KeyHandle = NULL;return STATUS_OBJECT_TYPE_MISMATCH;break;
        case 7: *KeyHandle = NULL;return STATUS_ACCESS_DENIED;break;
        case 8: *KeyHandle = NULL;return STATUS_INVALID_HANDLE;break;
        case 9: *KeyHandle = NULL;return STATUS_TOO_LATE;break;
        #endif
        default: 
            *KeyHandle = NULL;
            return STATUS_UNSUCCESSFUL;break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
_Must_inspect_result_
NTSYSAPI
NTSTATUS
NTAPI
ZwCreateSection(
    OUT PHANDLE SectionHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
    IN PLARGE_INTEGER MaximumSize OPTIONAL,
    IN ULONG SectionPageProtection,
    IN ULONG AllocationAttributes,
    IN HANDLE FileHandle OPTIONAL
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_FILE_LOCK_CONFLICT;break;
        case 3: return STATUS_INVALID_FILE_FOR_SECTION;break;
        case 4: return STATUS_INVALID_PAGE_PROTECTION;break;
        case 5: return STATUS_MAPPED_FILE_SIZE_ZERO;break;
        default: return STATUS_SECTION_TOO_BIG;break;
    }
}

NTSTATUS
ZwCreateTimer(
    OUT PHANDLE TimerHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes OPTIONAL,
    IN TIMER_TYPE TimerType
    )
{
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        #ifdef SLAM_PRECISE_STATUS
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_INVALID_PARAMETER_4;break;
        case 2: return STATUS_INSUFFICIENT_RESOURCES;break;
        case 3: return STATUS_PRIVILEGE_NOT_HELD;break;
        case 4: return STATUS_OBJECT_NAME_INVALID;break;
        case 5: return STATUS_INSUFFICIENT_RESOURCES;break;
        case 6: return STATUS_INVALID_SID;break;
        case 7: return STATUS_INVALID_ACL;break;
        case 8: return STATUS_UNKNOWN_REVISION;break;
        #endif
        default: return STATUS_INVALID_PARAMETER;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwDeleteKey(
    IN HANDLE KeyHandle
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_ACCESS_DENIED;break;
        default: return STATUS_INVALID_HANDLE;break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwDeleteValueKey(
    IN HANDLE KeyHandle,
    IN PUNICODE_STRING ValueName
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwEnumerateKey(
    IN HANDLE KeyHandle,
    IN ULONG Index,
    IN KEY_INFORMATION_CLASS KeyInformationClass,
    OUT PVOID KeyInformation,
    IN ULONG Length,
    OUT PULONG ResultLength
    )
{
    ULONG L = SdvKeepChoice();
    if ( L <= 0 ) {
        switch ( L ) {
            case 0: return STATUS_INVALID_PARAMETER;break;
            case -1: return STATUS_UNSUCCESSFUL;break;
            default: return STATUS_NO_MORE_ENTRIES;break;
        }
    } 
    else if ( L == Length && Length!=0) 
    {
        *ResultLength = L;
        return STATUS_SUCCESS;
    }
    else if ( L > Length ) 
    {
        *ResultLength = L;
        return STATUS_BUFFER_OVERFLOW;
    } 
    else 
    {
        *ResultLength = L;
        return STATUS_BUFFER_TOO_SMALL;
    }

}

NTSYSAPI
NTSTATUS
NTAPI
ZwEnumerateValueKey(
    IN HANDLE KeyHandle,
    IN ULONG Index,
    IN KEY_VALUE_INFORMATION_CLASS KeyValueInformationClass,
    OUT PVOID KeyValueInformation,
    IN ULONG Length,
    OUT PULONG ResultLength
    )
{
    ULONG L = SdvKeepChoice();
    if ( L <= 0 ) {
        switch ( L ) {
            case 0: return STATUS_INVALID_PARAMETER;break;
            case -1: return STATUS_UNSUCCESSFUL;break;
            default: return STATUS_NO_MORE_ENTRIES;break;
        }
    } 
    else if ( L == Length && Length!=0) 
    {
        *ResultLength = L;
        return STATUS_SUCCESS;
    }
    else if ( L > Length ) 
    {
        *ResultLength = L;
        return STATUS_BUFFER_OVERFLOW;
    } 
    else 
    {
        *ResultLength = L;
        return STATUS_BUFFER_TOO_SMALL;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwFlushKey(
    IN HANDLE KeyHandle
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwMakeTemporaryObject(
    IN HANDLE Handle
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwMapViewOfSection(
    IN HANDLE SectionHandle,
    IN HANDLE ProcessHandle,
    IN OUT PVOID *BaseAddress,
    IN ULONG_PTR ZeroBits,
    IN SIZE_T CommitSize,
    IN OUT PLARGE_INTEGER SectionOffset OPTIONAL,
    IN OUT PSIZE_T ViewSize,
    IN SECTION_INHERIT InheritDisposition,
    IN ULONG AllocationType,
    IN ULONG Win32Protect
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_CONFLICTING_ADDRESSES;break;
        case 3: return STATUS_INVALID_PAGE_PROTECTION;break;
        default: return STATUS_SECTION_PROTECTION;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwOpenFile(
    OUT PHANDLE FileHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    IN ULONG ShareAccess,
    IN ULONG OpenOptions
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwOpenKey(
    OUT PHANDLE KeyHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes
    )
{
    int choice = SdvMakeChoice();
    
    switch (choice) 
    {
        case 0: 
        *KeyHandle = (PHANDLE) malloc(4);
        return STATUS_SUCCESS;
        break;
        #ifdef SLAM_PRECISE_STATUS
        case 1: *KeyHandle = NULL;return STATUS_TOO_LATE;break;
        case 2: *KeyHandle = NULL;return STATUS_INVALID_PARAMETER_4;break;
        case 3: *KeyHandle = NULL;return STATUS_INVALID_PARAMETER;break;
        case 4: *KeyHandle = NULL;return STATUS_INSUFFICIENT_RESOURCES;break;
        case 5: *KeyHandle = NULL;return STATUS_OBJECT_PATH_SYNTAX_BAD;break;
        case 6: *KeyHandle = NULL;return STATUS_NO_MEMORY;break;
        case 7: *KeyHandle = NULL;return STATUS_INVALID_INFO_CLASS;break;
        #endif
        default: 
            *KeyHandle = NULL;
            return STATUS_PRIVILEGE_NOT_HELD;break;
    }
    
}

NTSYSAPI
NTSTATUS
NTAPI
ZwOpenSection(
    OUT PHANDLE SectionHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_ACCESS_DENIED;break;
        default: return STATUS_INVALID_HANDLE;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwOpenSymbolicLinkObject(
    OUT PHANDLE LinkHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSTATUS
ZwOpenTimer(
    OUT PHANDLE TimerHandle,
    IN ACCESS_MASK DesiredAccess,
    IN POBJECT_ATTRIBUTES ObjectAttributes
    )
{

    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: *TimerHandle = (PHANDLE) malloc(4);return STATUS_SUCCESS;break;
        #ifdef SLAM_PRECISE_STATUS
        case 1: *TimerHandle = NULL;return STATUS_INSUFFICIENT_RESOURCES;break;
        case 2: *TimerHandle = NULL;return STATUS_OBJECT_NAME_INVALID;break;
        case 3: *TimerHandle = NULL;return STATUS_OBJECT_PATH_SYNTAX_BAD;break;
        case 4: *TimerHandle = NULL;return STATUS_OBJECT_TYPE_MISMATCH;break;
        case 5: *TimerHandle = NULL;return STATUS_OBJECT_NAME_NOT_FOUND;break;
        case 6: *TimerHandle = NULL;return STATUS_OBJECT_NAME_INVALID;break;
        case 7: *TimerHandle = NULL;return OBJ_NAME_PATH_SEPARATOR;break;
        case 8: *TimerHandle = NULL;return STATUS_NO_MEMORY;break;
        case 9: *TimerHandle = NULL;return STATUS_INVALID_SID;break;
        case 10: *TimerHandle = NULL;return STATUS_INVALID_ACL;break;
        case 11: *TimerHandle = NULL;return STATUS_UNKNOWN_REVISION;break;
        case 12: *TimerHandle = NULL;return STATUS_REPARSE;break;
        case 13: *TimerHandle = NULL;return STATUS_REPARSE_OBJECT;break;
        #endif
        default: *TimerHandle = NULL;return STATUS_INVALID_PARAMETER;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwQueryInformationFile(
    IN HANDLE FileHandle,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    OUT PVOID FileInformation,
    IN ULONG Length,
    IN FILE_INFORMATION_CLASS FileInformationClass
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwQueryKey(
    IN HANDLE KeyHandle,
    IN KEY_INFORMATION_CLASS KeyInformationClass,
    OUT PVOID KeyInformation,
    IN ULONG Length,
    OUT PULONG ResultLength
    )
{
    ULONG L = SdvKeepChoice();
    if ( L <= 0 ) {
        switch ( L ) {
            case 0: return STATUS_INVALID_PARAMETER;break;
            default: return STATUS_UNSUCCESSFUL;break;
        }
    } 
    else if ( L == Length && Length!=0) 
    {
        *ResultLength = L;
        return STATUS_SUCCESS;
    }
    else if ( L > Length ) 
    {
        *ResultLength = L;
        return STATUS_BUFFER_OVERFLOW;
    } 
    else 
    {
        *ResultLength = L;
        return STATUS_BUFFER_TOO_SMALL;
    }

        
}

NTSYSAPI
NTSTATUS
NTAPI
ZwQuerySymbolicLinkObject(
    IN HANDLE LinkHandle,
    IN OUT PUNICODE_STRING LinkTarget,
    OUT PULONG ReturnedLength OPTIONAL
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_BUFFER_TOO_SMALL;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwQueryValueKey(
    IN HANDLE KeyHandle,
    IN PUNICODE_STRING ValueName,
    IN KEY_VALUE_INFORMATION_CLASS KeyValueInformationClass,
    OUT PVOID KeyValueInformation,
    IN ULONG Length,
    OUT PULONG ResultLength
    )
{
    /* 
      This model for ZwQueryValueKey has a custom body that supports a
      common pattern in drivers: To initially call ZwQueryValueKey
      with Length==0 in order to determine a ResultLenght x, then
      allocate this amount x of memory and thereafter make a
      subsequent call to ZwQueryValueKey with new Length==x.  In the
      first case the driver can assume that STATUS_SUCCESS is not
      returned.
    */
    ULONG L = SdvKeepChoice();
    if ( L <= 0 ) {
        switch ( L ) {
            case 0: return STATUS_INVALID_PARAMETER;break;
            default: return STATUS_UNSUCCESSFUL;break;
        }
    } 
    else if ( L == Length && Length!=0) 
    {
        *ResultLength = L;
        return STATUS_SUCCESS;
    }
    else if ( L > Length ) 
    {
        *ResultLength = L;
        return STATUS_BUFFER_OVERFLOW;
    } 
    else 
    {
        *ResultLength = L;
        return STATUS_BUFFER_TOO_SMALL;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwReadFile(
    IN HANDLE FileHandle,
    IN HANDLE Event OPTIONAL,
    IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
    IN PVOID ApcContext OPTIONAL,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    OUT PVOID Buffer,
    IN ULONG Length,
    IN PLARGE_INTEGER ByteOffset OPTIONAL,
    IN PULONG Key OPTIONAL
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwSetInformationFile(
    IN HANDLE FileHandle,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    IN PVOID FileInformation,
    IN ULONG Length,
    IN FILE_INFORMATION_CLASS FileInformationClass
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

#if defined(SDV_Include_NTIFS) || defined(SDV_Include_NTDDK)
NTSYSAPI
NTSTATUS
NTAPI
ZwSetInformationThread(
    IN HANDLE ThreadHandle,
    IN THREADINFOCLASS ThreadInformationClass,
    IN PVOID ThreadInformation,
    IN ULONG ThreadInformationLength
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_INFO_LENGTH_MISMATCH;break;
        default: return STATUS_INVALID_PARAMETER;break;
    }
}


NTSTATUS
ZwSetTimer(
    IN HANDLE TimerHandle,
    IN PLARGE_INTEGER DueTime,
    IN PTIMER_APC_ROUTINE TimerApcRoutine OPTIONAL,
    IN PVOID TimerContext OPTIONAL,
    IN BOOLEAN WakeTimer,
    IN LONG Period OPTIONAL,
    OUT PBOOLEAN PreviousState OPTIONAL
    )
{
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_SUCCESS;break;
        #ifdef SLAM_PRECISE_STATUS
        case 1: return STATUS_INVALID_PARAMETER_6;break;
        case 2: return STATUS_TIMER_RESUME_IGNORED;break;
        case 3: return STATUS_OBJECT_TYPE_MISMATCH;break;
        case 4: return STATUS_ACCESS_DENIED;break;
        case 5: return STATUS_INVALID_HANDLE;break;
        case 6: return STATUS_UNSUCCESSFUL;break;
        case 7: return STATUS_INVALID_PARAMETER;break;
        case 8: return STATUS_INSUFFICIENT_RESOURCES;break;
        #endif
        default: return STATUS_INSUFFICIENT_RESOURCES;break;
    }
}
#endif

NTSYSAPI
NTSTATUS
NTAPI
ZwSetValueKey(
    IN HANDLE KeyHandle,
    IN PUNICODE_STRING ValueName,
    IN ULONG TitleIndex OPTIONAL,
    IN ULONG Type,
    IN PVOID Data,
    IN ULONG DataSize
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        case 2: return STATUS_ACCESS_DENIED;break;
        default: return STATUS_INVALID_HANDLE;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwUnmapViewOfSection(
    IN HANDLE ProcessHandle,
    IN PVOID BaseAddress
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_UNSUCCESSFUL;break;
        default: return STATUS_INVALID_PARAMETER;break;
    }
}

NTSYSAPI
NTSTATUS
NTAPI
ZwWriteFile(
    IN HANDLE FileHandle,
    IN HANDLE Event OPTIONAL,
    IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
    IN PVOID ApcContext OPTIONAL,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    IN PVOID Buffer,
    IN ULONG Length,
    IN PLARGE_INTEGER ByteOffset OPTIONAL,
    IN PULONG Key OPTIONAL
    )
{
    int choice = SdvMakeChoice();
    switch (choice) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}



_When_(Timeout == NULL, _IRQL_requires_max_(APC_LEVEL))
_When_(Timeout->QuadPart != 0, _IRQL_requires_max_(APC_LEVEL))
_When_(Timeout->QuadPart == 0, _IRQL_requires_max_(DISPATCH_LEVEL))
NTSYSAPI
NTSTATUS
NTAPI
ZwWaitForSingleObject(
  __in      HANDLE Handle,
  __in      BOOLEAN Alertable,
  __in_opt  PLARGE_INTEGER Timeout
)
{
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return STATUS_ACCESS_DENIED;break;
        case 2: return STATUS_ALERTED;break;
        case 3: return STATUS_INVALID_HANDLE;break;
        case 4: return STATUS_SUCCESS;break;
        case 5: return STATUS_USER_APC;break;
        default: return STATUS_TIMEOUT;break;
    }
}








_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwAllocateLocallyUniqueId(
     PLUID Luid
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
_When_(return==0, __drv_allocatesMem(Region))
NTSYSAPI
NTSTATUS
NTAPI
ZwAllocateVirtualMemory(
     HANDLE ProcessHandle,
     PVOID *BaseAddress,
     ULONG_PTR ZeroBits,
     PSIZE_T RegionSize,
     ULONG AllocationType,
     ULONG Protect
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwCommitComplete (
     HANDLE            EnlistmentHandle,
     PLARGE_INTEGER TmVirtualClock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwCommitEnlistment (
     HANDLE EnlistmentHandle,
     PLARGE_INTEGER TmVirtualClock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwCommitTransaction (
     HANDLE  TransactionHandle,
     BOOLEAN Wait
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwCreateEnlistment (
     PHANDLE EnlistmentHandle,
     ACCESS_MASK DesiredAccess,
     HANDLE ResourceManagerHandle,
     HANDLE TransactionHandle,
     POBJECT_ATTRIBUTES ObjectAttributes,
     ULONG CreateOptions,
     NOTIFICATION_MASK NotificationMask,
     PVOID EnlistmentKey
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: *EnlistmentHandle = (PHANDLE) malloc(4);return STATUS_SUCCESS; break;
        default:*EnlistmentHandle = NULL; return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwCreateEvent (
     PHANDLE EventHandle,
     ACCESS_MASK DesiredAccess,
     POBJECT_ATTRIBUTES ObjectAttributes,
     EVENT_TYPE EventType,
     BOOLEAN InitialState
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: *EventHandle = (PHANDLE) malloc(4);return STATUS_SUCCESS; break;
        default: *EventHandle = NULL;return STATUS_UNSUCCESSFUL; break;
    }
}

NTSTATUS
ZwCreateKeyTransacted(
     PHANDLE KeyHandle,
     ACCESS_MASK DesiredAccess,
     POBJECT_ATTRIBUTES ObjectAttributes,
     ULONG TitleIndex,
     PUNICODE_STRING Class,
     ULONG CreateOptions,
     HANDLE TransactionHandle,
     PULONG Disposition
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: 
            *KeyHandle = (PHANDLE) malloc(4);
            return STATUS_SUCCESS; break;
        default: 
            *KeyHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwCreateResourceManager (
     PHANDLE ResourceManagerHandle,
     ACCESS_MASK DesiredAccess,
     HANDLE TmHandle,
     LPGUID ResourceManagerGuid,
     POBJECT_ATTRIBUTES ObjectAttributes,
     ULONG CreateOptions,
     PUNICODE_STRING Description
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0:*ResourceManagerHandle = (PHANDLE) malloc(4); return STATUS_SUCCESS; break;
        default:*ResourceManagerHandle = NULL; return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwCreateTransactionManager (
     PHANDLE TmHandle,
     ACCESS_MASK DesiredAccess,
     POBJECT_ATTRIBUTES ObjectAttributes,
     PUNICODE_STRING LogFileName,
     ULONG CreateOptions,
     ULONG CommitStrength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0:*TmHandle = (PHANDLE) malloc(4); return STATUS_SUCCESS; break;
        default:*TmHandle = NULL; return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwDeleteFile(
     POBJECT_ATTRIBUTES ObjectAttributes
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwDeviceIoControlFile(
     HANDLE FileHandle,
     HANDLE Event,
     PIO_APC_ROUTINE ApcRoutine,
     PVOID ApcContext,
     PIO_STATUS_BLOCK IoStatusBlock,
     ULONG IoControlCode,
     PVOID InputBuffer,
     ULONG InputBufferLength,
     PVOID OutputBuffer,
     ULONG OutputBufferLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwDisplayString(
     PUNICODE_STRING String
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwDuplicateObject(
     HANDLE SourceProcessHandle,
     HANDLE SourceHandle,
     HANDLE TargetProcessHandle,
     PHANDLE TargetHandle,
     ACCESS_MASK DesiredAccess,
     ULONG HandleAttributes,
     ULONG Options
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}


_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwEnumerateTransactionObject (
     HANDLE            RootObjectHandle,
         KTMOBJECT_TYPE    QueryType,
     PKTMOBJECT_CURSOR ObjectCursor,
         ULONG             ObjectCursorLength,
        PULONG            ReturnLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

NTSTATUS
ZwFlushBuffersFile(
     HANDLE FileHandle,
     PIO_STATUS_BLOCK IoStatusBlock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
_When_(return==0, __drv_freesMem(Region))
NTSYSAPI
NTSTATUS
NTAPI
ZwFreeVirtualMemory(
     HANDLE ProcessHandle,
     PVOID *BaseAddress,
     PSIZE_T RegionSize,
     ULONG FreeType
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwFsControlFile(
     HANDLE FileHandle,
     HANDLE Event,
     PIO_APC_ROUTINE ApcRoutine,
     PVOID ApcContext,
     PIO_STATUS_BLOCK IoStatusBlock,
     ULONG FsControlCode,
     PVOID InputBuffer,
     ULONG InputBufferLength,
     PVOID OutputBuffer,
     ULONG OutputBufferLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwGetNotificationResourceManager (
     HANDLE             ResourceManagerHandle,
     PTRANSACTION_NOTIFICATION TransactionNotification,
     ULONG              NotificationLength,
     PLARGE_INTEGER         Timeout,
     PULONG                    ReturnLength,
     ULONG                          Asynchronous,
     ULONG_PTR                  AsynchronousContext
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwLoadDriver(
     PUNICODE_STRING DriverServiceName
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwLockFile(
     HANDLE FileHandle,
     HANDLE Event,
     PIO_APC_ROUTINE ApcRoutine,
     PVOID ApcContext,
     PIO_STATUS_BLOCK IoStatusBlock,
     PLARGE_INTEGER ByteOffset,
     PLARGE_INTEGER Length,
     ULONG Key,
     BOOLEAN FailImmediately,
     BOOLEAN ExclusiveLock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwNotifyChangeKey(
     HANDLE KeyHandle,
     HANDLE Event,
     PIO_APC_ROUTINE ApcRoutine,
     PVOID ApcContext,
     PIO_STATUS_BLOCK IoStatusBlock,
     ULONG CompletionFilter,
     BOOLEAN WatchTree,
     PVOID Buffer,
     ULONG BufferSize,
     BOOLEAN Asynchronous
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

NTSTATUS
ZwNotifyChangeMultipleKeys(
     HANDLE MasterKeyHandle,
     ULONG Count,
     OBJECT_ATTRIBUTES SubordinateObjects[],
     HANDLE Event,
     PIO_APC_ROUTINE ApcRoutine,
     PVOID ApcContext,
     PIO_STATUS_BLOCK IoStatusBlock,
     ULONG CompletionFilter,
     BOOLEAN WatchTree,
     PVOID Buffer,
     ULONG BufferSize,
     BOOLEAN Asynchronous
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwOpenDirectoryObject(
     PHANDLE DirectoryHandle,
     ACCESS_MASK DesiredAccess,
     POBJECT_ATTRIBUTES ObjectAttributes
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwOpenEnlistment (
     PHANDLE EnlistmentHandle,
     ACCESS_MASK DesiredAccess,
     HANDLE RmHandle,
     LPGUID EnlistmentGuid,
     POBJECT_ATTRIBUTES ObjectAttributes
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwOpenEvent (
     PHANDLE EventHandle,
     ACCESS_MASK DesiredAccess,
     POBJECT_ATTRIBUTES ObjectAttributes
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: 
            *EventHandle = (PHANDLE) malloc(4);
            return STATUS_SUCCESS; break;
        default: 
            *EventHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwOpenKeyEx(
     PHANDLE KeyHandle,
     ACCESS_MASK DesiredAccess,
     POBJECT_ATTRIBUTES ObjectAttributes,
     ULONG OpenOptions
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: 
            *KeyHandle = (PHANDLE) malloc(4);
            return STATUS_SUCCESS; break;
        default: 
            *KeyHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwOpenKeyTransacted(
     PHANDLE KeyHandle,
     ACCESS_MASK DesiredAccess,
     POBJECT_ATTRIBUTES ObjectAttributes,
     HANDLE TransactionHandle
    ) 
{
    int choice = SdvMakeChoice();
    

    switch (choice)
    {
        case 0: 
            *KeyHandle = (PHANDLE) malloc(4);    
            return STATUS_SUCCESS; break;
        default: 
            *KeyHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwOpenKeyTransactedEx(
     PHANDLE KeyHandle,
     ACCESS_MASK DesiredAccess,
     POBJECT_ATTRIBUTES ObjectAttributes,
     ULONG OpenOptions,
     HANDLE TransactionHandle
    ) 
{
    int choice = SdvMakeChoice();
    

    switch (choice)
    {
        case 0: 
            *KeyHandle = (PHANDLE) malloc(4);        
            return STATUS_SUCCESS; break;
        default: 
            *KeyHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwOpenProcess (
     PHANDLE ProcessHandle,
     ACCESS_MASK DesiredAccess,
     POBJECT_ATTRIBUTES ObjectAttributes,
     PCLIENT_ID ClientId
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: 
            *ProcessHandle = (PHANDLE) malloc(4);        
            return STATUS_SUCCESS; break;
        default: 
            *ProcessHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwOpenProcessTokenEx(
     HANDLE ProcessHandle,
     ACCESS_MASK DesiredAccess,
     ULONG HandleAttributes,
     PHANDLE TokenHandle
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: 
            *TokenHandle = (PHANDLE) malloc(4);        
            return STATUS_SUCCESS; break;
        default: 
            *TokenHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwOpenResourceManager (
     PHANDLE ResourceManagerHandle,
     ACCESS_MASK DesiredAccess,
     HANDLE TmHandle,
     LPGUID ResourceManagerGuid,
     POBJECT_ATTRIBUTES ObjectAttributes
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: 
            *ResourceManagerHandle = (PHANDLE) malloc(4);        
            return STATUS_SUCCESS; break;
        default: 
            *ResourceManagerHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwOpenThreadTokenEx(
     HANDLE ThreadHandle,
     ACCESS_MASK DesiredAccess,
     BOOLEAN OpenAsSelf,
     ULONG HandleAttributes,
     PHANDLE TokenHandle
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: 
            *TokenHandle = (PHANDLE) malloc(4);        
            return STATUS_SUCCESS; break;
        default: 
            *TokenHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }

}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwOpenTransactionManager (
     PHANDLE TmHandle,
     ACCESS_MASK DesiredAccess,
     POBJECT_ATTRIBUTES ObjectAttributes,
     PUNICODE_STRING LogFileName,
     LPGUID TmIdentity,
     ULONG OpenOptions
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: 
            *TmHandle = (PHANDLE) malloc(4);        
            return STATUS_SUCCESS; break;
        default: 
            *TmHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwPowerInformation(
     POWER_INFORMATION_LEVEL InformationLevel,
     PVOID InputBuffer,
     ULONG InputBufferLength,
     PVOID OutputBuffer,
     ULONG OutputBufferLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwPrepareComplete (
     HANDLE            EnlistmentHandle,
     PLARGE_INTEGER TmVirtualClock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwPrepareEnlistment (
     HANDLE EnlistmentHandle,
     PLARGE_INTEGER TmVirtualClock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwPrePrepareComplete (
     HANDLE            EnlistmentHandle,
     PLARGE_INTEGER TmVirtualClock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwPrePrepareEnlistment (
     HANDLE EnlistmentHandle,
     PLARGE_INTEGER TmVirtualClock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwQueryDirectoryFile(
     HANDLE FileHandle,
     HANDLE Event,
     PIO_APC_ROUTINE ApcRoutine,
     PVOID ApcContext,
     PIO_STATUS_BLOCK IoStatusBlock,
     PVOID FileInformation,
     ULONG Length,
     FILE_INFORMATION_CLASS FileInformationClass,
     BOOLEAN ReturnSingleEntry,
     PUNICODE_STRING FileName,
     BOOLEAN RestartScan
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: 
            return STATUS_SUCCESS; break;
        default: 
            return STATUS_UNSUCCESSFUL; break;
    }
}
NTSTATUS
ZwQueryEaFile (
     HANDLE FileHandle,
     PIO_STATUS_BLOCK IoStatusBlock,
     PVOID Buffer,
     ULONG Length,
     BOOLEAN ReturnSingleEntry,
     PVOID EaList,
     ULONG EaListLength,
     PULONG EaIndex,
     BOOLEAN RestartScan
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwQueryFullAttributesFile(
     POBJECT_ATTRIBUTES ObjectAttributes,
     PFILE_NETWORK_OPEN_INFORMATION FileInformation
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwQueryInformationEnlistment (
     HANDLE EnlistmentHandle,
     ENLISTMENT_INFORMATION_CLASS EnlistmentInformationClass,
     PVOID EnlistmentInformation,
     ULONG EnlistmentInformationLength,
     PULONG ReturnLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwQueryInformationResourceManager (
     HANDLE ResourceManagerHandle,
     RESOURCEMANAGER_INFORMATION_CLASS ResourceManagerInformationClass,
     PVOID ResourceManagerInformation,
     ULONG ResourceManagerInformationLength,
     PULONG ReturnLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}


_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwQueryInformationTransactionManager (
     HANDLE TransactionManagerHandle,
     TRANSACTIONMANAGER_INFORMATION_CLASS TransactionManagerInformationClass,
     PVOID TransactionManagerInformation,
     ULONG TransactionManagerInformationLength,
     PULONG ReturnLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

NTSTATUS
ZwQueryMultipleValueKey(
     HANDLE KeyHandle,
     PKEY_VALUE_ENTRY ValueEntries,
     ULONG EntryCount,
     PVOID ValueBuffer,
     PULONG BufferLength,
     PULONG RequiredBufferLength
    ) 
{
    ULONG L = SdvKeepChoice();
    if ( L <= 0 ) {
        switch ( L ) {
            case 0: return STATUS_INVALID_PARAMETER;break;
            default: return STATUS_UNSUCCESSFUL;break;
        }
    } 
    else if ( L == RequiredBufferLength && BufferLength!=0) 
    {
        *RequiredBufferLength = L;
        return STATUS_SUCCESS;
    }
    else if ( L > BufferLength ) 
    {
        *RequiredBufferLength = L;
        return STATUS_BUFFER_OVERFLOW;
    } 
    else 
    {
        *RequiredBufferLength = L;
        return STATUS_BUFFER_TOO_SMALL;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwQuerySecurityObject(
     HANDLE Handle,
     SECURITY_INFORMATION SecurityInformation,
     PSECURITY_DESCRIPTOR SecurityDescriptor,
     ULONG Length,
     PULONG LengthNeeded
    ) 
{
    ULONG L = SdvKeepChoice();
    if ( L <= 0 ) {
        switch ( L ) {
            case 0: return STATUS_ACCESS_DENIED;break;
            case -1: return STATUS_INVALID_HANDLE;break;
            default: return STATUS_OBJECT_TYPE_MISMATCH;break;
        }
    } 
    else if ( L == Length && Length!=0) 
    {
        *LengthNeeded = L;
        return STATUS_SUCCESS;
    }
    else 
    {
        *LengthNeeded = L;
        return STATUS_BUFFER_TOO_SMALL;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwQueryVolumeInformationFile(
     HANDLE FileHandle,
     PIO_STATUS_BLOCK IoStatusBlock,
     PVOID FsInformation,
     ULONG Length,
     FS_INFORMATION_CLASS FsInformationClass
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwReadOnlyEnlistment (
     HANDLE            EnlistmentHandle,
     PLARGE_INTEGER TmVirtualClock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwRecoverEnlistment (
     HANDLE EnlistmentHandle,
     PVOID EnlistmentKey
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwRecoverTransactionManager (
     HANDLE TransactionManagerHandle
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwRenameKey(
     HANDLE           KeyHandle,
     PUNICODE_STRING  NewName
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

NTSYSCALLAPI
NTSTATUS
NTAPI
ZwRollbackComplete (
     HANDLE            EnlistmentHandle,
     PLARGE_INTEGER TmVirtualClock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwRollbackEnlistment (
     HANDLE EnlistmentHandle,
     PLARGE_INTEGER TmVirtualClock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwRollbackTransaction (
     HANDLE  TransactionHandle,
     BOOLEAN Wait
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwRollforwardTransactionManager (
     HANDLE TransactionManagerHandle,
     PLARGE_INTEGER TmVirtualClock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

NTSTATUS
ZwSetEaFile (
     HANDLE FileHandle,
     PIO_STATUS_BLOCK IoStatusBlock,
     PVOID Buffer,
     ULONG Length
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwSetInformationEnlistment (
     HANDLE EnlistmentHandle,
     ENLISTMENT_INFORMATION_CLASS EnlistmentInformationClass,
     PVOID EnlistmentInformation,
     ULONG EnlistmentInformationLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwSetInformationKey(
     HANDLE KeyHandle,
     KEY_SET_INFORMATION_CLASS KeySetInformationClass,
     PVOID KeySetInformation,
     ULONG KeySetInformationLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwSetInformationResourceManager (
     HANDLE ResourceManagerHandle,
     RESOURCEMANAGER_INFORMATION_CLASS ResourceManagerInformationClass,
     PVOID ResourceManagerInformation,
     ULONG ResourceManagerInformationLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}


_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwSetInformationTransactionManager (
     HANDLE TmHandle,
     TRANSACTIONMANAGER_INFORMATION_CLASS TransactionManagerInformationClass,
     PVOID TransactionManagerInformation,
     ULONG TransactionManagerInformationLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwSetQuotaInformationFile(
     HANDLE FileHandle,
     PIO_STATUS_BLOCK IoStatusBlock,
     PVOID Buffer,
     ULONG Length
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwSetSecurityObject(
     HANDLE Handle,
     SECURITY_INFORMATION SecurityInformation,
     PSECURITY_DESCRIPTOR SecurityDescriptor
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

#if defined(SDV_Include_NTIFS) || defined(SDV_Include_NTDDK)
NTSTATUS
ZwSetTimerEx (
     HANDLE TimerHandle,
     TIMER_SET_INFORMATION_CLASS TimerSetInformationClass,
     PVOID TimerSetInformation,
     ULONG TimerSetInformationLength
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}
#endif

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwSetVolumeInformationFile(
     HANDLE FileHandle,
     PIO_STATUS_BLOCK IoStatusBlock,
     PVOID FsInformation,
     ULONG Length,
     FS_INFORMATION_CLASS FsInformationClass
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSCALLAPI
NTSTATUS
NTAPI
ZwSinglePhaseReject (
     HANDLE            EnlistmentHandle,
     PLARGE_INTEGER TmVirtualClock
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwTerminateProcess (
     HANDLE ProcessHandle,
     NTSTATUS ExitStatus
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwUnloadDriver(
     PUNICODE_STRING DriverServiceName
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSYSAPI
NTSTATUS
NTAPI
ZwUnlockFile(
     HANDLE FileHandle,
     PIO_STATUS_BLOCK IoStatusBlock,
     PLARGE_INTEGER ByteOffset,
     PLARGE_INTEGER Length,
     ULONG Key
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

NTSTATUS
NTAPI
ZwCreateTransaction (
    __out PHANDLE TransactionHandle,
    __in ACCESS_MASK DesiredAccess,
    __in_opt POBJECT_ATTRIBUTES ObjectAttributes,
    __in_opt LPGUID Uow,
    __in_opt HANDLE TmHandle,
    __in_opt ULONG CreateOptions,
    __in_opt ULONG IsolationLevel,
    __in_opt ULONG IsolationFlags,
    __in_opt PLARGE_INTEGER Timeout,
    __in_opt PUNICODE_STRING Description
    )
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: 
            *TransactionHandle = (PHANDLE) malloc(4);        
            return STATUS_SUCCESS; break;
        default: 
            *TransactionHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }
}

NTSTATUS
NTAPI
ZwOpenTransaction (
    __out PHANDLE TransactionHandle,
    __in ACCESS_MASK DesiredAccess,
    __in_opt POBJECT_ATTRIBUTES ObjectAttributes,
    __in LPGUID Uow,
    __in_opt HANDLE TmHandle
    )
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: 
            *TransactionHandle = (PHANDLE) malloc(4);        
            return STATUS_SUCCESS; break;
        default: 
            *TransactionHandle = NULL;
            return STATUS_UNSUCCESSFUL; break;
    }
}
    
NTSTATUS
NTAPI
ZwQueryInformationTransaction (
    __in HANDLE TransactionHandle,
    __in TRANSACTION_INFORMATION_CLASS TransactionInformationClass,
    __out_bcount(TransactionInformationLength) PVOID TransactionInformation,
    __in ULONG TransactionInformationLength,
    __out_opt PULONG ReturnLength
    )
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}
  
NTSTATUS
NTAPI
ZwSetInformationTransaction (
    __in HANDLE TransactionHandle,
    __in TRANSACTION_INFORMATION_CLASS TransactionInformationClass,
    __in PVOID TransactionInformation,
    __in ULONG TransactionInformationLength
    )
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}   

NTSYSAPI
NTSTATUS
NTAPI
ZwFlushVirtualMemory(
    __in HANDLE ProcessHandle,
    __inout PVOID *BaseAddress,
    __inout PSIZE_T RegionSize,
    __out PIO_STATUS_BLOCK IoStatus
    )
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }

}


NTSYSAPI
NTSTATUS
NTAPI
ZwSetEvent (
    __in HANDLE EventHandle,
    __out_opt PLONG PreviousState
    )
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }

}

#ifdef SDV_Include_NTDDK
NTSTATUS 
ZwQueryInformationProcess(
  HANDLE ProcessHandle,
  PROCESSINFOCLASS ProcessInformationClass,
  PVOID ProcessInformation,
  ULONG ProcessInformationLength,
  PULONG ReturnLength
)
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}
#endif

/* ..\wdm\ntddk-ke.c begin */
/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/

#if WINVER > 0x0500
_DECL_HAL_KE_IMPORT
VOID
FASTCALL
KeAcquireInStackQueuedSpinLock(
    IN PKSPIN_LOCK SpinLock,
    IN PKLOCK_QUEUE_HANDLE LockHandle
    ) 
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
}
#endif

#if WINVER > 0x0500
NTKERNELAPI
VOID
FASTCALL
KeAcquireInStackQueuedSpinLockAtDpcLevel(
    IN PKSPIN_LOCK SpinLock,
    IN PKLOCK_QUEUE_HANDLE LockHandle
    ) 
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
}
#endif

#if WINVER > 0x0500
NTKERNELAPI
VOID
FASTCALL
KeAcquireInStackQueuedSpinLockForDpc(
    IN PKSPIN_LOCK SpinLock,
    IN PKLOCK_QUEUE_HANDLE LockHandle
    ) 
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
}
#endif

KIRQL
KeAcquireInterruptSpinLock(
    IN PKINTERRUPT Interrupt
    )
{
    SDV_IRQL_PUSH(SDV_DIRQL);
    return sdv_irql_previous;
}

VOID
sdv_KeAcquireSpinLock(
    IN PKSPIN_LOCK SpinLock,
    OUT PKIRQL p_old_irql
    ) 
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    (*p_old_irql) = sdv_irql_previous;
}


VOID
sdv_KeAcquireSpinLockAtDpcLevel(
    IN PKSPIN_LOCK  SpinLock
    ) 
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
}


NTKERNELAPI
KIRQL
KeAcquireSpinLockRaiseToDpc(
    IN PKSPIN_LOCK SpinLock
    ) 
{ 
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    return sdv_irql_previous;
}

NTKERNELAPI
DECLSPEC_NORETURN
VOID
NTAPI
KeBugCheck (
    __in ULONG BugCheckCode
    )
{
    /* Simulate bug check by stopping verification: */
    SdvExit();
}

NTKERNELAPI
DECLSPEC_NORETURN
VOID
NTAPI
KeBugCheckEx(
    __in ULONG BugCheckCode,
    __in ULONG_PTR BugCheckParameter1,
    __in ULONG_PTR BugCheckParameter2,
    __in ULONG_PTR BugCheckParameter3,
    __in ULONG_PTR BugCheckParameter4
    )
{
    /* Simulate bug check by stopping verification: */
    SdvExit();
}

NTKERNELAPI
VOID
KeClearEvent(
    __inout PRKEVENT Event
    ) 
{
    Event->Header.SignalState = 0;
    return;
}

NTKERNELAPI                                         
NTSTATUS                                            
KeDelayExecutionThread(                            
    IN KPROCESSOR_MODE WaitMode,                    
    IN BOOLEAN Alertable,                           
    IN PLARGE_INTEGER Interval                      
    )
{
    int x = SdvMakeChoice();
    switch (x) {
        case 0: return STATUS_SUCCESS;break;
#ifdef SLAM_PRECISE_STATUS
        case 1: return STATUS_ALERTED;break;
		case 2: return STATUS_USER_APC;break;
#endif
        default: return STATUS_UNSUCCESSFUL;break;

  }
}

NTKERNELAPI
VOID
KeEnterCriticalRegion(
    VOID
    )
{
}

NTKERNELAPI
VOID
sdv_KeFlushIoBuffers(
    IN PMDL Mdl,
    IN BOOLEAN ReadOperation,
    IN BOOLEAN DmaOperation
    )
{
}


NTHALAPI
KIRQL
sdv_KeGetCurrentIrql(void) 
{
    return sdv_irql_current;
}


NTKERNELAPI
VOID
KeInitializeDpc(
    PRKDPC Dpc,
    PKDEFERRED_ROUTINE DeferredRoutine,
    PVOID DeferredContext
    ) 
{
   Dpc->DeferredRoutine = DeferredRoutine;
}

NTKERNELAPI
VOID
KeInitializeThreadedDpc(
    PRKDPC Dpc,
    PKDEFERRED_ROUTINE DeferredRoutine,
    PVOID DeferredContext
    ) 
{
   Dpc->DeferredRoutine = DeferredRoutine;
}


NTKERNELAPI
VOID
KeInitializeEvent(
    OUT PRKEVENT Event,
    IN EVENT_TYPE Type,
    IN BOOLEAN State
    )
{ 
     Event->Header.Type = (UCHAR)Type;
     Event->Header.Signalling = FALSE;
     Event->Header.Size = sizeof(KEVENT) / sizeof(LONG);
     Event->Header.SignalState = State;
}

NTKERNELAPI
BOOLEAN
KeInsertByKeyDeviceQueue(
    IN PKDEVICE_QUEUE DeviceQueue,
    IN PKDEVICE_QUEUE_ENTRY DeviceQueueEntry,
    IN ULONG SortKey
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return FALSE;
            break;
        default:
            return TRUE;
            break;
    }
}

NTKERNELAPI
BOOLEAN
KeInsertDeviceQueue(
    IN PKDEVICE_QUEUE DeviceQueue,
    IN PKDEVICE_QUEUE_ENTRY DeviceQueueEntry
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return FALSE;
            break;
        default:
            return TRUE;
            break;
    }
}

NTKERNELAPI
BOOLEAN
KeInsertQueueDpc(
    OUT PRKDPC Dpc,
    IN PVOID SystemArgument1,
    IN PVOID SystemArgument2
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return FALSE;
            break;
        default:
            sdv_kdpc3=Dpc;
            sdv_dpc_ke_registered=TRUE;
#ifdef SDV_RUN_KE_DPC_ROUTINES           
            sdv_RunKeDpcRoutines(sdv_kdpc3,sdv_pDpcContext,SystemArgument1,SystemArgument2);
#endif            
            return TRUE;
            break;
    }
}
NTKERNELAPI
VOID
KeLeaveCriticalRegion(
    VOID
    )
{
}

_IRQL_requires_max_(HIGH_LEVEL)
#if defined(_ARM_)
NTHALAPI
VOID
#else
_DECL_HAL_KE_IMPORT
VOID
FASTCALL
#endif
KfLowerIrql (
    _In_ _IRQL_restores_ _Notliteral_ KIRQL NewIrql
    ) 
{ 
    SDV_IRQL_POPTO(NewIrql);
}

VOID
sdv_KeLowerIrql (
         KIRQL NewIrql
   )
{
    SDV_IRQL_POPTO(NewIrql);
}



NTKERNELAPI
LONG
KePulseEvent(
    IN PRKEVENT Event,
    IN KPRIORITY Increment,
    IN BOOLEAN Wait
    )
{
    LONG l = SdvKeepChoice();
    Event->Header.SignalState = 0;
    return l;
}

VOID
sdv_KeRaiseIrql(
    IN KIRQL new_irql,
    OUT PKIRQL p_old_irql
    ) 
{  
    SDV_IRQL_PUSH(new_irql);
    *p_old_irql = sdv_irql_previous;
}


KIRQL
sdv_KeRaiseIrqlToDpcLevel(
    VOID
    ) 
{ 
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    return sdv_irql_previous;
}

KIRQL
sdv_KeRaiseIrqlToSynchLevel(
    VOID
    ) 
{ 
    KIRQL r = (KIRQL) SdvMakeChoice(); 
    return r; 
}

NTKERNELAPI
LONG
KeReadStateEvent(
    IN PRKEVENT Event
    )
{
    LONG l = SdvKeepChoice();
    return l;
}

#if WINVER > 0x0500
_DECL_HAL_KE_IMPORT
VOID
FASTCALL
KeReleaseInStackQueuedSpinLock(
    IN PKLOCK_QUEUE_HANDLE LockHandle
    ) 
{
    SDV_IRQL_POP();
}
#endif

#if WINVER > 0x0500
NTKERNELAPI
VOID
FASTCALL
KeReleaseInStackQueuedSpinLockForDpc(
    IN PKLOCK_QUEUE_HANDLE LockHandle
    ) 
{
    SDV_IRQL_POP();
}
#endif

#if WINVER > 0x0500
NTKERNELAPI
VOID
FASTCALL
KeReleaseInStackQueuedSpinLockFromDpcLevel(
    IN PKLOCK_QUEUE_HANDLE LockHandle
    ) 
{
    SDV_IRQL_POP();
}
#endif

VOID
KeReleaseInterruptSpinLock(
    IN PKINTERRUPT Interrupt,
    IN KIRQL old_irql
    )
{
    SDV_IRQL_POPTO(old_irql);
}

NTKERNELAPI
LONG
KeReleaseSemaphore(
    IN PRKSEMAPHORE Semaphore,
    IN KPRIORITY Increment,
    IN LONG Adjustment,
    IN BOOLEAN Wait
    ) 
{
    LONG r = SdvKeepChoice(); 
    return r;
}


VOID
sdv_KeReleaseSpinLock(
    IN PKSPIN_LOCK  SpinLock,
    IN KIRQL  new_irql
    ) 
{
    SDV_IRQL_POPTO(new_irql);
}

sdv_ExReleaseSpinLock(
    IN PKSPIN_LOCK  SpinLock,
    IN KIRQL  new_irql
    ) 
{
    SDV_IRQL_POPTO(new_irql);
}

VOID
sdv_KeReleaseSpinLockFromDpcLevel(
    IN PKSPIN_LOCK  SpinLock
    ) 
{
    SDV_IRQL_POP();
}


NTKERNELAPI
LONG
KeResetEvent(
    IN PRKEVENT Event
    ) 
{
    LONG OldState;
    OldState = Event->Header.SignalState;
    Event->Header.SignalState = 0;
    return OldState;
}

NTKERNELAPI
LONG
KeSetEvent(
    IN PRKEVENT Event,
    IN KPRIORITY Increment,
    IN BOOLEAN Wait
    ) 
{
    LONG OldState;
    OldState = Event->Header.SignalState;
    Event->Header.SignalState = 1;
    return OldState;
}

BOOLEAN
KeSynchronizeExecution(
    PKINTERRUPT Interrupt,
    PKSYNCHRONIZE_ROUTINE SynchronizeRoutine,
    PVOID SynchronizeContext
    )
{
    BOOLEAN b;

    /* SynchronizeRoutine must be non-null.  Check anyhow. */
    /*if ( SynchronizeRoutine == NULL )
    {
        return FALSE;
    }*/
#ifdef SDV_HARNESS_RUN_KSYNC_ROUTINES
    SDV_IRQL_PUSH(SDV_DIRQL);
    b=sdv_RunKSynchronizeRoutines(SynchronizeRoutine,SynchronizeContext);
    SDV_IRQL_POP();
#else
    b=OneOfTwoBOOLEAN();
#endif
    return b;
}

NTKERNELAPI
NTSTATUS
KeWaitForMultipleObjects(
    IN ULONG Count,
    IN PVOID Object[],
    IN WAIT_TYPE WaitType,
    IN KWAIT_REASON WaitReason,
    IN KPROCESSOR_MODE WaitMode,
    IN BOOLEAN Alertable,
    IN PLARGE_INTEGER Timeout OPTIONAL,
    IN PKWAIT_BLOCK WaitBlockArray OPTIONAL
    )  
{
    int x = SdvMakeChoice();
      
    switch (x) { 
        case 0: return STATUS_SUCCESS;break;
#ifdef SLAM_PRECISE_STATUS
        case 1: return STATUS_ALERTED;break;
        case 2: return STATUS_USER_APC;break;
        
#else
        default: return STATUS_TIMEOUT;break;
#endif
    }
}

NTKERNELAPI
NTSTATUS
KeWaitForSingleObject(
    IN PVOID Object,
    IN KWAIT_REASON WaitReason,
    IN KPROCESSOR_MODE WaitMode,
    IN BOOLEAN Alertable,
    IN PLARGE_INTEGER Timeout OPTIONAL
    )
{

    int x = SdvMakeChoice();
    if(Timeout==NULL)
    {
        return STATUS_SUCCESS;
    }
    switch (x) 
    {
        case 0: return STATUS_TIMEOUT;break;
#ifdef SLAM_PRECISE_STATUS
        case 1: return STATUS_ALERTED;break;
        case 2: return STATUS_USER_APC;break;
#else
        default: return STATUS_SUCCESS;break;
#endif
    }
}

NTSTATUS sdv_KeWaitForMutexObject(
  __in      PVOID Mutex,
  __in      KWAIT_REASON WaitReason,
  __in      KPROCESSOR_MODE WaitMode,
  __in      BOOLEAN Alertable,
  __in_opt  PLARGE_INTEGER Timeout
)
{

    int x = SdvMakeChoice();
    if(Timeout==NULL)
    {
        return STATUS_SUCCESS;
    }
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
#ifdef SLAM_PRECISE_STATUS
        case 1: return STATUS_ALERTED;break;
        case 2: return STATUS_USER_APC;break;
        default: return STATUS_TIMEOUT;break;
#else
        default: return STATUS_TIMEOUT;break;
#endif
    }
}





BOOLEAN  
FASTCALL
KeTryToAcquireSpinLockAtDpcLevel(
    IN PKSPIN_LOCK  SpinLock)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return FALSE;
            break;
        default:
            SDV_IRQL_PUSH(DISPATCH_LEVEL);
            return TRUE;
            break;
    }
}


VOID 
FASTCALL
KeReleaseSpinLockForDpc(
  __inout  PKSPIN_LOCK SpinLock,
  __in     KIRQL OldIrql
)
{
    SDV_IRQL_POPTO(OldIrql);
}

KIRQL 
FASTCALL
KeAcquireSpinLockForDpc(
  __inout  PKSPIN_LOCK SpinLock
)
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    return sdv_irql_previous;
}

LONG KeReleaseMutex(
  __inout  PRKMUTEX Mutex,
  __in     BOOLEAN Wait
)
{
    return 0;
}

VOID 
FASTCALL
KeAcquireGuardedMutex(
  __inout  PKGUARDED_MUTEX Mutex
)
{

}
VOID 
FASTCALL
KeAcquireGuardedMutexUnsafe(
  __inout  PKGUARDED_MUTEX FastMutex
)
{

}
VOID KeEnterGuardedRegion(void)
{

}
VOID 
FASTCALL
KeInitializeGuardedMutex(
  __out  PKGUARDED_MUTEX Mutex
)
{

}

VOID KeInitializeMutex(
  __out  PRKMUTEX Mutex,
  __in   ULONG Level
)
{

}

VOID KeInitializeSemaphore(
  __out  PRKSEMAPHORE Semaphore,
  __in   LONG Count,
  __in   LONG Limit
)
{

}

NTKERNELAPI
VOID
NTAPI
sdv_KeInitializeSpinLock(
  __out  PKSPIN_LOCK SpinLock
)
{
    *SpinLock = 0;
    return;
}

VOID KeLeaveGuardedRegion(void)
{

}
LONG KeReadStateMutex(
  __in  PRKMUTEX Mutex
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return 1;
            break;
        default:
            return 0;
            break;
    }
}
LONG KeReadStateSemaphore(
  __in  PRKSEMAPHORE Semaphore
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return 1;
            break;
        default:
            return 0;
            break;
    }

}
VOID 
FASTCALL
KeReleaseGuardedMutex(
  __inout  PKGUARDED_MUTEX Mutex
)
{

}
VOID 
FASTCALL
KeReleaseGuardedMutexUnsafe(
  __inout  PKGUARDED_MUTEX FastMutex
)
{

}

BOOLEAN 
FASTCALL
KeTestSpinLock(
  __in  PKSPIN_LOCK SpinLock
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }

}
BOOLEAN 
FASTCALL
KeTryToAcquireGuardedMutex(
  __inout  PKGUARDED_MUTEX Mutex
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}

BOOLEAN KeRemoveEntryDeviceQueue(
  __inout  PKDEVICE_QUEUE DeviceQueue,
  __inout  PKDEVICE_QUEUE_ENTRY DeviceQueueEntry
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}

#if defined (_X86_)
NTSTATUS KeSaveFloatingPointState(
  __out  PKFLOATING_SAVE FloatSave
)
{
    int x = SdvMakeChoice();

    switch (x) {
        case 0: return STATUS_SUCCESS;break;
        case 1: return STATUS_ILLEGAL_FLOAT_CONTEXT;break;
        case 2: return STATUS_INSUFFICIENT_RESOURCES;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}
#endif

BOOLEAN KeSetTimer(
  __inout   PKTIMER Timer,
  __in      LARGE_INTEGER DueTime,
  __in_opt  PKDPC Dpc
)
{
   LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}

BOOLEAN KeSetTimerEx(
  __inout   PKTIMER Timer,
  __in      LARGE_INTEGER DueTime,
  __in      LONG Period,
  __in_opt  PKDPC Dpc
)
{
   LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}

BOOLEAN KeAreAllApcsDisabled(void)
{
   LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}

BOOLEAN KeAreApcsDisabled(void)
{
   LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }

}
NTSTATUS KeDeregisterNmiCallback(
  __in  PVOID Handle
)
{
    int x = SdvMakeChoice();

    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_INVALID_HANDLE;break;
    }
}

PVOID KeRegisterNmiCallback(
  __in      PNMI_CALLBACK CallbackRoutine,
  __in_opt  PVOID Context
)
{
    int choice = SdvMakeChoice();
    PVOID p;
    switch (choice) 
    {
        case 0: p= (PVOID) malloc(1);
                return p;
                break;
        default:return NULL;
                break;
    }

}

KAFFINITY KeQueryActiveProcessors(void)
{
     return (KAFFINITY)SdvKeepChoice();

}

PKDEVICE_QUEUE_ENTRY KeRemoveByKeyDeviceQueue(
  __inout  PKDEVICE_QUEUE DeviceQueue,
  __in     ULONG SortKey
)
{
    int choice = SdvMakeChoice();
    PKDEVICE_QUEUE_ENTRY p;
    switch (choice) 
    {
        case 0: p= (PKDEVICE_QUEUE_ENTRY) malloc(1);
                return p;
                break;
        default:return NULL;
                break;
    }
}


PKDEVICE_QUEUE_ENTRY KeRemoveDeviceQueue(
  __inout  PKDEVICE_QUEUE DeviceQueue
)
{
    return NULL;
}

BOOLEAN KeCancelTimer(
  __inout  PKTIMER Timer
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}

VOID KeInitializeDeviceQueue(
  __out  PKDEVICE_QUEUE DeviceQueue
)
{
    PKDEVICE_QUEUE x = malloc(1);
    *DeviceQueue = *x;
}


VOID KeInitializeTimer(
  __out  PKTIMER Timer
)
{

}

VOID KeInitializeTimerEx(
  __out  PKTIMER Timer,
  __in   TIMER_TYPE Type
)
{
}


BOOLEAN KeReadStateTimer(
  __in  PKTIMER Timer
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}

NTKERNELAPI
VOID
FASTCALL
KefReleaseSpinLockFromDpcLevel (
    __inout __deref __drv_releasesExclusiveResource(KeSpinLockType)
    PKSPIN_LOCK SpinLock
    )
{
    SDV_IRQL_POP();
}


NTKERNELAPI
VOID
FASTCALL
KefAcquireSpinLockAtDpcLevel (
    __inout __deref __drv_acquiresExclusiveResource(KeSpinLockType)
    PKSPIN_LOCK SpinLock
    )
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
}


VOID
FASTCALL
KfReleaseSpinLock (
    __inout __deref __drv_releasesExclusiveResource(KeSpinLockType)
    PKSPIN_LOCK SpinLock,
    __in __drv_restoresIRQL KIRQL NewIrql
    )
{
    SDV_IRQL_POPTO(NewIrql); 
}


KIRQL
FASTCALL
KfAcquireSpinLock (
    __inout __deref __drv_acquiresExclusiveResource(KeSpinLockType)
    PKSPIN_LOCK SpinLock
    )
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    return  sdv_irql_previous;
}




BOOLEAN KeRemoveQueueDpc(
  __inout  PRKDPC Dpc
)
{
  int x = SdvMakeChoice();
  switch (x) 
  {
        case 0: return TRUE;break;
        default:return  FALSE;break;
  }
}


VOID KeFlushQueuedDpcs(void)
{
}

#if defined (_X86_)
KIRQL
FASTCALL
KfRaiseIrql (
    __in KIRQL NewIrql
    )
{
    SDV_IRQL_PUSH(NewIrql);
    return sdv_irql_previous;
}
#endif

ULONG 
  sdv_KeGetCurrentProcessorNumber(VOID)
{
  return (ULONG) SdvKeepChoice();
}


LOGICAL
FASTCALL
KeTryToAcquireQueuedSpinLock (
    KSPIN_LOCK_QUEUE_NUMBER Number,
    PKIRQL OldIrql
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return FALSE;
            break;
        default:
            SDV_IRQL_PUSH(DISPATCH_LEVEL);
            (*OldIrql) = sdv_irql_previous;
            return TRUE;
            break;
    }

}

VOID
FASTCALL
KeReleaseQueuedSpinLock (
     KSPIN_LOCK_QUEUE_NUMBER Number,
     KIRQL OldIrql
    )
{
    SDV_IRQL_POPTO(OldIrql);
}

LONG
KeReleaseMutant (
     PRKMUTANT Mutant,
     KPRIORITY Increment,
     BOOLEAN Abandoned,
     BOOLEAN Wait
    )
{
    return (LONG)SdvKeepChoice();
}

KIRQL
FASTCALL
KeAcquireQueuedSpinLock (
      
     KSPIN_LOCK_QUEUE_NUMBER Number
    )
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    return sdv_irql_previous;
}

KPRIORITY
KeQueryPriorityThread (
     PKTHREAD Thread
    ) 
{
    return (LONG)SdvKeepChoice();
}

ULONG
KeQueryRuntimeThread (
     PKTHREAD Thread,
     PULONG UserTime
    ) 
{
    return (ULONG)SdvKeepChoice();
}

VOID
KeRevertToUserAffinityThreadEx (
     KAFFINITY Affinity
    ) 
{
}

VOID
KeSetSystemAffinityThread (
     KAFFINITY Affinity
    ) 
{
}

VOID
KeSetSystemGroupAffinityThread (
     PGROUP_AFFINITY Affinity,
     PGROUP_AFFINITY PreviousAffinity
    ) 
{
}

NTKERNELAPI
VOID
KeInitializeMutant (
    __out PRKMUTANT Mutant,
    __in BOOLEAN InitialOwner
    )
{
}

#if defined(_M_AMD64)

__forceinline
PKTHREAD
sdv_KeGetCurrentThread (
    VOID
    )

{
    return (PKTHREAD)malloc(4);
}

#endif

#if defined(_M_IX86) || defined(_M_ARM)

NTSYSAPI
PKTHREAD
NTAPI
sdv_KeGetCurrentThread(
    VOID
    )
{
    return (PKTHREAD)malloc(4);
}

#endif

/* ..\wdm\ntddk-mm.c begin */
/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/

NTKERNELAPI
PVOID
MmAllocateContiguousMemory(
    IN SIZE_T NumberOfBytes,
    IN PHYSICAL_ADDRESS HighestAcceptableAddress
    ) 
{
    PVOID p;
    if(NumberOfBytes>0)
    {
       p=(PVOID)malloc(NumberOfBytes);
    }
    else
    {
        p=NULL;
    }
}

ULONG
sdv_MmGetMdlByteCount(
    IN PMDL Mdl
     )
{
    /* Suppress C4311: 'type cast' : pointer truncation .
       This is acceptable as the OS Model will not be executed:*/
    #pragma warning(disable:4305)
    ULONG x = ((ULONG)malloc(1));
    #pragma warning(default:4305)
    return  x;
}

ULONG
sdv_MmGetMdlByteOffset (
    IN PMDL Mdl
    )
{
    /* Suppress C4311: 'type cast' : pointer truncation .
       This is acceptable as the OS Model will not be executed:*/
    #pragma warning(disable:4305)
    ULONG x = ((ULONG)malloc(1));
    #pragma warning(default:4305)
    return x;
}


PPFN_NUMBER
sdv_MmGetMdlPfnArray(
    IN PMDL Mdl
    )
{
	PPFN_NUMBER x=(PPFN_NUMBER) malloc(1);
	return x;
}


PVOID
sdv_MmGetMdlVirtualAddress(
    IN PMDL Mdl
     )
{
	PVOID x= (PVOID) malloc(1); 
	return x;
}

PVOID
sdv_MmGetSystemAddressForMdlSafe(
     IN PMDL MDL,
     IN MM_PAGE_PRIORITY PRIORITY
     ) 
{
    int choice = SdvMakeChoice();
    PVOID p;
    switch (choice) 
    {
        case 0: p= (PVOID) malloc(1);
                return p;
                break;
        default:return NULL;
                break;
    }
}
PVOID
sdv_MmLockPagableCodeSection(
    IN PVOID  AddressWithinSection
    ) 
{
    return(AddressWithinSection);
}

NTKERNELAPI
VOID
MmLockPagableSectionByHandle(
    IN PVOID ImageSectionHandle
    )
{
}

int sdv_MmMapIoSpace_int=0;  

NTKERNELAPI
PVOID
MmMapIoSpace(
    IN PHYSICAL_ADDRESS PhysicalAddress,
    IN SIZE_T NumberOfBytes,
    IN MEMORY_CACHING_TYPE CacheType
    )
{
    return (PVOID) &sdv_MmMapIoSpace_int;
}

NTKERNELAPI
PVOID
MmMapLockedPages(
    IN PMDL MemoryDescriptorList,
    IN KPROCESSOR_MODE AccessMode
    ) 
{
	PVOID r= (PVOID) malloc(1);
	return r;
}

NTKERNELAPI
PVOID
sdv_MmMapLockedPagesSpecifyCache(
     IN PMDL MemoryDescriptorList,
     IN KPROCESSOR_MODE AccessMode,
     IN MEMORY_CACHING_TYPE CacheType,
     IN PVOID BaseAddress,
     IN ULONG BugCheckOnFailure,
     IN ULONG Priority
     ) 
{
	PVOID r= (PVOID) malloc(1);
	return r;
}


NTKERNELAPI
PVOID
MmPageEntireDriver(
    IN PVOID AddressWithinSection
    )
{
	PVOID p= (PVOID) malloc(1);
	return p;
}

VOID
sdv_MmPrepareMdlForReuse(
    IN PMDL Mdl
    )
{
}

NTKERNELAPI
VOID
MmResetDriverPaging(
    IN PVOID AddressWithinSection
    )
{
}

NTKERNELAPI
VOID
MmUnlockPagableImageSection(
    IN PVOID ImageSectionHandle
    )
{
}

ULONG MmDoesFileHaveUserWritableReferences(
  __in  PSECTION_OBJECT_POINTERS SectionPointer
)
{
    return (ULONG)SdvKeepChoice();
}

PVOID MmLockPagableDataSection(
  __in  PVOID AddressWithinSection
)
{
  PVOID r= (PVOID) malloc(1);
	return r;
}

PVOID MmMapLockedPagesWithReservedMapping(
  __in  PVOID MappingAddress,
  __in  ULONG PoolTag,
  __in  PMDLX MemoryDescriptorList,
  __in  MEMORY_CACHING_TYPE CacheType
)
{
    LONG choice = SdvMakeChoice();
    PVOID p;
    switch (choice) 
    {
        case 0: p= (PVOID) malloc(1);
                return p;
                break;
        default:return NULL;
                break;
    }
}

VOID MmProbeAndLockPages(
  __inout  PMDLX MemoryDescriptorList,
  __in     KPROCESSOR_MODE AccessMode,
  __in     LOCK_OPERATION Operation
)
{
}

NTKERNELAPI
VOID
MmProbeAndLockProcessPages (
    __inout PMDL MemoryDescriptorList,
    __in PEPROCESS Process,
    __in KPROCESSOR_MODE AccessMode,
    __in LOCK_OPERATION Operation
    )
{
}

VOID MmUnlockPages(
  __inout  PMDLX MemoryDescriptorList
)
{
}

VOID MmUnmapLockedPages(
  __in  PVOID BaseAddress,
  __in  PMDL MemoryDescriptorList
)
{
}

VOID MmFreeContiguousMemory(
  __in  PVOID BaseAddress
)
{

}

PVOID MmAllocateNonCachedMemory(
  __in  SIZE_T NumberOfBytes
)
{
    LONG choice = SdvMakeChoice();
    PVOID p;
    switch (choice) 
    {
        case 0: p= (PVOID) malloc(1);
                return p;
                break;
        default:return NULL;
                break;
    }
}

PMDL MmAllocatePagesForMdl(
  __in  PHYSICAL_ADDRESS LowAddress,
  __in  PHYSICAL_ADDRESS HighAddress,
  __in  PHYSICAL_ADDRESS SkipBytes,
  __in  SIZE_T TotalBytes
)
{
    LONG choice = SdvMakeChoice();
    PMDL p;
    switch (choice) 
    {
        case 0: p= (PMDL) malloc(1);
                return p;
                break;
        default:return NULL;
                break;
    }
}

HANDLE MmSecureVirtualMemory(
  __in  PVOID Address,
  __in  SIZE_T Size,
  __in  ULONG ProbeMode
)
{
    LONG choice = SdvMakeChoice();
    HANDLE p;
    switch (choice) 
    {
        case 0: p= (HANDLE) malloc(1);
                return p;
                break;
        default:return NULL;
                break;
    }
}

VOID MmFreeNonCachedMemory(
  __in  PVOID BaseAddress,
  __in  SIZE_T NumberOfBytes
)
{
}

VOID MmFreePagesFromMdl(
  __in  PMDLX MemoryDescriptorList
)
{
}

VOID MmUnsecureVirtualMemory(
  __in  HANDLE SecureHandle
)
{
}

#ifdef SDV_Include_NTDDK
NTSTATUS
MmAddPhysicalMemory (
     PPHYSICAL_ADDRESS StartAddress,
     PLARGE_INTEGER NumberOfBytes
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}
#endif

NTSTATUS
MmCreateMirror (
    void
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

#ifdef SDV_Include_NTDDK

PPHYSICAL_MEMORY_RANGE
MmGetPhysicalMemoryRanges (
    void
    ) 
{
    return (PPHYSICAL_MEMORY_RANGE)malloc(1);
}

#endif
PVOID
MmGetSystemRoutineAddress (
     PUNICODE_STRING SystemRoutineName
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return (PVOID)malloc(1); break;
        default: return NULL; break;
    }
}


NTSTATUS
MmRemovePhysicalMemory (
     PPHYSICAL_ADDRESS StartAddress,
     PLARGE_INTEGER NumberOfBytes
    ) 
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return STATUS_SUCCESS; break;
        default: return STATUS_UNSUCCESSFUL; break;
    }
}

PVOID MmAllocateContiguousMemorySpecifyCache(
  __in      SIZE_T NumberOfBytes,
  __in      PHYSICAL_ADDRESS LowestAcceptableAddress,
  __in      PHYSICAL_ADDRESS HighestAcceptableAddress,
  __in_opt  PHYSICAL_ADDRESS BoundaryAddressMultiple,
  __in      MEMORY_CACHING_TYPE CacheType
)
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return (PVOID)malloc(1); break;
        default: return NULL; break;
    }
}

PMDL MmAllocatePagesForMdlEx(
  __in  PHYSICAL_ADDRESS LowAddress,
  __in  PHYSICAL_ADDRESS HighAddress,
  __in  PHYSICAL_ADDRESS SkipBytes,
  __in  SIZE_T TotalBytes,
  __in  MEMORY_CACHING_TYPE CacheType,
  __in  ULONG Flags
)
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return (PMDL)malloc(1); break;
        default: return NULL; break;
    }

}


PMDL MmCreateMdl(
    IN PMDL  MemoryDescriptorList  OPTIONAL,
    IN PVOID  Base,
    IN SIZE_T  Length
    )
{
    int choice = SdvMakeChoice();
    switch (choice)
    {
        case 0: return (PMDL)malloc(1); break;
        default: return NULL; break;
    }

}

VOID MmUnmapIoSpace(
  __in  PVOID BaseAddress,
  __in  SIZE_T NumberOfBytes
)
{
}


/*void * sdv_memcpy(
   void *dest,
   const void *src,
   size_t count 
)
{
    return dest;
}*/

/* ..\wdm\ntddk-mm.c end */

/* ..\wdm\ntddk-ex.c begin */
/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/


VOID 
sdv_ExQueueWorkItem(
  PWORK_QUEUE_ITEM WorkItem,
  WORK_QUEUE_TYPE QueueType
)
{
#ifdef SDV_HARNESS_QUEUE_WORK_ITEMS_ROUTINE
      sdv_RunExQueueWorkItems(WorkItem->WorkerRoutine,WorkItem->Parameter);
#endif
}

NTKERNELAPI
VOID
FASTCALL
ExAcquireFastMutex(
    IN PFAST_MUTEX FastMutex
    ) 
{  
    SDV_IRQL_PUSH(APC_LEVEL);
}

NTKERNELAPI
VOID
FASTCALL
ExAcquireFastMutexUnsafe(
    IN PFAST_MUTEX  FastMutex
    ) 
{
}

VOID ExReleaseResourceForThreadLite(
  __inout  PERESOURCE Resource,
  __in     ERESOURCE_THREAD ResourceThreadId
)
{
}


NTKERNELAPI
BOOLEAN
ExAcquireResourceExclusiveLite(
    IN PERESOURCE Resource,
    IN BOOLEAN Wait
    ) 
{ 
    if (Wait) { return TRUE; }
    else {
        LONG choice = SdvMakeChoice();
        switch(choice) 
        {
            case 0:
                return FALSE;
                break;
            default:
                return TRUE;
                break;
        }
        
    };
}

NTKERNELAPI
BOOLEAN
ExAcquireResourceSharedLite(
    IN PERESOURCE Resource,
    IN BOOLEAN Wait
    ) 
{
    if (Wait) { return TRUE; }
    else {
        LONG choice = SdvMakeChoice();
        switch(choice) 
        {
            case 0:
                return FALSE;
                break;
            default:
                return TRUE;
                break;
        }
    };
}

NTKERNELAPI
BOOLEAN
ExAcquireSharedStarveExclusive(
    IN PERESOURCE Resource,
    IN BOOLEAN Wait
    ) 
{ 
    if (Wait) { return TRUE; }
    else {
        LONG choice = SdvMakeChoice();
        switch(choice) 
        {
            case 0:
                return FALSE;
                break;
            default:
                return TRUE;
                break;
        }
    };
}

NTKERNELAPI
BOOLEAN
ExAcquireSharedWaitForExclusive(
    IN PERESOURCE Resource,
    IN BOOLEAN Wait
    ) 
{ 
    if (Wait) { return TRUE; }
    else {
        LONG choice = SdvMakeChoice();
        switch(choice) 
        {
            case 0:
                return FALSE;
                break;
            default:
                return TRUE;
                break;
        }
    };
}

NTKERNELAPI
PVOID
ExAllocatePool(
    IN POOL_TYPE PoolType,
    IN SIZE_T NumberOfBytes
    ) 
{ 
  int x = SdvMakeChoice();
  switch (x) 
  {
  case 0: return (PVOID)malloc(NumberOfBytes);break;
      default: return NULL;break;
  }
    
}

NTKERNELAPI
PVOID
sdv_ExAllocatePoolWithQuota(
    POOL_TYPE PoolType,
    SIZE_T NumberOfBytes
    )
{
  int x = SdvMakeChoice();
  switch (x) 
  {
  case 0: return (PVOID)malloc(NumberOfBytes);break;
      default: return NULL;break;
  }
}

NTKERNELAPI
PVOID
sdv_ExAllocatePoolWithQuotaTag(
    POOL_TYPE PoolType,
    SIZE_T NumberOfBytes,
    ULONG Tag
    )
{
  int x = SdvMakeChoice();
  switch (x) 
  {
  case 0: return (PVOID)malloc(NumberOfBytes);break;
      default: return NULL;break;
  }
}

NTKERNELAPI
PVOID
NTAPI
ExAllocatePoolWithTag(
    IN POOL_TYPE PoolType,
    IN SIZE_T NumberOfBytes,
    IN ULONG Tag
    ) 
{
  int x = SdvMakeChoice();
  switch (x) 
  {
  case 0: return (PVOID)malloc(NumberOfBytes);break;
      default: return NULL;break;
  }
}

NTKERNELAPI
PVOID
NTAPI
ExAllocatePoolWithTagPriority(
    IN POOL_TYPE PoolType,
    IN SIZE_T NumberOfBytes,
    IN ULONG Tag,
    IN EX_POOL_PRIORITY Priority
    )
{
  int x = SdvMakeChoice();
  switch (x) 
  {
  case 0: return (PVOID)malloc(NumberOfBytes);break;

      default: return NULL;break;
  }
}

NTKERNELAPI
NTSTATUS
ExCreateCallback(
    OUT PCALLBACK_OBJECT *CallbackObject,
    IN POBJECT_ATTRIBUTES ObjectAttributes,
    IN BOOLEAN Create,
    IN BOOLEAN AllowMultipleCallbacks
    ) 
{ 
    int x = SdvMakeChoice();
    switch (x) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}


NTKERNELAPI
VOID sdv_ExFreePool(PVOID P)
{
}


NTKERNELAPI
NTSTATUS
ExDeleteResourceLite(
    IN PERESOURCE Resource
    ) 
{ 
    int x = SdvMakeChoice();
    if (x) 
    {
        return STATUS_SUCCESS;
    } 
    else 
    {
        return STATUS_UNSUCCESSFUL;
    }
}

VOID
sdv_ExInitializeFastMutex(
    IN PFAST_MUTEX FastMutex
    )
{
}

NTKERNELAPI
NTSTATUS
ExInitializeResourceLite(
    IN PERESOURCE Resource
    ) 
{ 
    int x = SdvMakeChoice();
    if (x) {
        return STATUS_SUCCESS;
    } else {
        return STATUS_UNSUCCESSFUL;
    } 
}

NTKERNELAPI
NTSTATUS
sdv_ExInitializeResource(
    IN PERESOURCE Resource
    ) 
{ 
    int x = SdvMakeChoice();
    if (x) {
        return STATUS_SUCCESS;
    } else {
        return STATUS_UNSUCCESSFUL;
    }
}

NTKERNELAPI
PLIST_ENTRY
FASTCALL
sdv_ExInterlockedInsertHeadList(
    IN PLIST_ENTRY ListHead,
    IN PLIST_ENTRY ListEntry,
    IN PKSPIN_LOCK Lock
    )
{
  PLIST_ENTRY p;
  int x = SdvMakeChoice();
  switch (x) 
  {
        case 0: 
            return p = (PLIST_ENTRY)malloc(1);
        default:
            return p = NULL;
  }

}

PLIST_ENTRY sdv_ExInterlockedRemoveHeadList(
  __inout  PLIST_ENTRY ListHead,
  __inout  PKSPIN_LOCK Lock
)
{
  PLIST_ENTRY p;
  int x = SdvMakeChoice();
  #ifdef SDV_RULE_NULLCHECK
    sdv_rule_NullCheck = TRUE;
  #else
    sdv_rule_NullCheck = FALSE;
  #endif 
  switch (x) 
  {
        case 0: 
            return p = (PLIST_ENTRY)malloc(1);
        default:
            SdvAssume(!sdv_rule_NullCheck); 
            return p = NULL;
  }

}



NTKERNELAPI
PSINGLE_LIST_ENTRY
FASTCALL
sdv_ExInterlockedPushEntryList(
    IN PSINGLE_LIST_ENTRY ListHead,
    IN PSINGLE_LIST_ENTRY ListEntry,
    IN PKSPIN_LOCK Lock
    )
{
  PSINGLE_LIST_ENTRY p;
  int x = SdvMakeChoice();
  switch (x) 
  {
        case 0: return p=(PSINGLE_LIST_ENTRY)malloc(1);break;
        default:return  p=NULL;break;
  }
}

PSINGLE_LIST_ENTRY sdv_ExInterlockedPopEntryList(
  __inout  PSINGLE_LIST_ENTRY ListHead,
  __inout  PKSPIN_LOCK Lock
)
{
  PSINGLE_LIST_ENTRY p;
  int x = SdvMakeChoice();
  switch (x) 
  {
        case 0: return p=(PSINGLE_LIST_ENTRY)malloc(1);break;
        default:return  p=NULL;break;
  }
}



PLIST_ENTRY
FASTCALL
ExfInterlockedInsertHeadList(
    IN PLIST_ENTRY ListHead,
    IN PLIST_ENTRY ListEntry,
    IN PKSPIN_LOCK Lock
    ) 
{
  PLIST_ENTRY p;
  int x = SdvMakeChoice();
  switch (x) 
  {
            case 0: return p=(PLIST_ENTRY)malloc(sizeof(LIST_ENTRY));break;
        default:return  p=NULL;break;
  }
}

NTKERNELAPI
PLIST_ENTRY
FASTCALL
ExfInterlockedInsertTailList(
    IN PLIST_ENTRY ListTail,
    IN PLIST_ENTRY ListEntry,
    IN PKSPIN_LOCK Lock
    ) 
{
  PLIST_ENTRY p;
  int x = SdvMakeChoice();
  switch (x) 
  {
    case 0: return p=(PLIST_ENTRY)malloc(sizeof(LIST_ENTRY));break;
  default:return  p=NULL;break;
  }
}


PLIST_ENTRY sdv_ExInterlockedInsertTailList(
  __inout  PLIST_ENTRY ListHead,
  __inout  PLIST_ENTRY ListEntry,
  __inout  PKSPIN_LOCK Lock
)
{
  PLIST_ENTRY p;
  int x = SdvMakeChoice();
  switch (x) 
  {
        case 0: return p=(PLIST_ENTRY)malloc(1);break;
        default:return  p=NULL;break;
  }
}


NTKERNELAPI
PSINGLE_LIST_ENTRY
FASTCALL
ExfInterlockedPushEntryList(
    IN PSINGLE_LIST_ENTRY ListHead,
    IN PSINGLE_LIST_ENTRY ListEntry,
    IN PKSPIN_LOCK Lock
    )
{
  PSINGLE_LIST_ENTRY p;
  PSINGLE_LIST_ENTRY ple;
  int x = SdvMakeChoice();
  switch (x) 
  {
  case 0: ple = (PSINGLE_LIST_ENTRY)malloc(sizeof(SINGLE_LIST_ENTRY));return ple; break;
  default:return  p=NULL;break;
  }
}

NTKERNELAPI
DECLSPEC_NORETURN
VOID
ExRaiseAccessViolation (
    VOID
    )
{
    /* As SDV does not support SEH: Stop verification: */
    /* This is unsound but is useful for suppressing false defects */ 
    SdvExit();
}

NTKERNELAPI
DECLSPEC_NORETURN
VOID
ExRaiseDatatypeMisalignment (
    VOID
    )
{
    /* As SDV does not support SEH: Stop verification: */
    /* This is unsound but is useful for suppressing false defects */ 
    SdvExit();
}

NTKERNELAPI
DECLSPEC_NORETURN
VOID
NTAPI
ExRaiseStatus (
    __in NTSTATUS Status
    )
{
    /* As SDV does not support SEH: Stop verification: */
    /* This is unsound but is useful for suppressing false defects */ 
    SdvExit();
}

NTKERNELAPI
NTSTATUS
ExReinitializeResourceLite(
    IN PERESOURCE Resource
    ) 
{ 
    return STATUS_SUCCESS; 
}

NTKERNELAPI
VOID
FASTCALL
ExReleaseFastMutex(
    IN PFAST_MUTEX FastMutex
    ) 
{  
    SDV_IRQL_POP();
}

NTKERNELAPI
VOID
FASTCALL
ExReleaseFastMutexUnsafe(
    IN PFAST_MUTEX  FastMutex
    ) 
{
}
    

NTKERNELAPI
VOID
FASTCALL
ExReleaseResourceLite(
    IN PERESOURCE Resource    
    ) 
{
}

NTHALAPI
BOOLEAN
FASTCALL
ExTryToAcquireFastMutex(
    IN PFAST_MUTEX FastMutex
    ) 
{ 
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return FALSE;
            break;
        default:
            return TRUE;
            break;
    }
}


#ifdef SDV_Include_NTDDK
NTKERNELAPI
NTSTATUS
ExUuidCreate(
    UUID *Uuid
    ) 
{ 
    int x = SdvMakeChoice();
    switch (x) {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_RETRY;break;
    }
}
#endif 

PVOID
sdv_ExAllocateFromNPagedLookasideList(
    __inout PNPAGED_LOOKASIDE_LIST Lookaside
    )
{
  int x = SdvMakeChoice();
  switch (x) 
  {
      case 0: return malloc(1);break;
      default: return NULL;break;
  }
}

BOOLEAN
FASTCALL
ExAcquireRundownProtection (
     __inout PEX_RUNDOWN_REF RunRef
     )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }

}

BOOLEAN
FASTCALL
ExAcquireRundownProtectionCacheAware (
     __inout PEX_RUNDOWN_REF_CACHE_AWARE RunRefCacheAware
     )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }

}

BOOLEAN
FASTCALL
ExAcquireRundownProtectionCacheAwareEx (
     __inout PEX_RUNDOWN_REF_CACHE_AWARE RunRefCacheAware,
     __in ULONG Count
     )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}


BOOLEAN
FASTCALL
ExAcquireRundownProtectionEx
(
     __inout PEX_RUNDOWN_REF RunRef,
     __in ULONG Count
     )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}


VOID
FASTCALL
ExReleaseRundownProtection (
     __inout PEX_RUNDOWN_REF RunRef
     )
{
    
}


VOID
FASTCALL
ExReleaseRundownProtectionEx (
     __inout PEX_RUNDOWN_REF RunRef,
     __in ULONG Count
     )
{
    
}

VOID ExConvertExclusiveToSharedLite(
  __inout  PERESOURCE Resource
)
{
    
}

NTKERNELAPI
PVOID
ExEnterCriticalRegionAndAcquireResourceExclusive (
    __inout PERESOURCE Resource
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return malloc(1);
            break;
    }
}

PVOID
ExEnterCriticalRegionAndAcquireResourceShared (
    __inout PERESOURCE Resource
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return malloc(1);
            break;
    }

}

PVOID
ExEnterCriticalRegionAndAcquireSharedWaitForExclusive (
    __inout PERESOURCE Resource
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return malloc(1);
            break;
    }

}

ULONG ExGetExclusiveWaiterCount(
  __in  PERESOURCE Resource
)
{
    return (ULONG)SdvKeepChoice();
}

ULONG ExGetSharedWaiterCount(
  __in  PERESOURCE Resource
)
{
   return (ULONG)SdvKeepChoice();
}

BOOLEAN ExIsResourceAcquiredExclusiveLite(
  __in  PERESOURCE Resource
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}

BOOLEAN sdv_ExIsResourceAcquiredExclusive(
  __in  PERESOURCE Resource
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}


ULONG
ExIsResourceAcquiredSharedLite (
    __in PERESOURCE Resource
    )
{
    return (ULONG)SdvKeepChoice();
}


ULONG
sdv_ExIsResourceAcquiredLite (
    __in PERESOURCE Resource
    )
{
    return (ULONG)SdvKeepChoice();
}


VOID
FASTCALL
ExReleaseResourceAndLeaveCriticalRegion(
    __inout PERESOURCE Resource
    )
{

}


VOID
FASTCALL
ExReleaseRundownProtectionCacheAware (
     __inout PEX_RUNDOWN_REF_CACHE_AWARE RunRefCacheAware
     )
{

}


VOID
FASTCALL
ExReleaseRundownProtectionCacheAwareEx (
     __inout PEX_RUNDOWN_REF_CACHE_AWARE RunRef,
     __in ULONG Count
     )
{

}

VOID
FASTCALL
ExWaitForRundownProtectionRelease (
     __inout PEX_RUNDOWN_REF RunRef
     )
{

}


VOID
FASTCALL
ExWaitForRundownProtectionReleaseCacheAware (
     __inout PEX_RUNDOWN_REF_CACHE_AWARE RunRef
     )
{

}

VOID 
sdv_ExFreeToPagedLookasideList(
  __inout  PPAGED_LOOKASIDE_LIST Lookaside,
  __in     PVOID Entry
)
{
}

PVOID 
sdv_ExAllocateFromPagedLookasideList(
  __inout  PPAGED_LOOKASIDE_LIST Lookaside
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return malloc(1);
            break;
    }
}

BOOLEAN ExIsProcessorFeaturePresent(
  __in  ULONG ProcessorFeature
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }

}

VOID ExDeletePagedLookasideList(
  __inout  PPAGED_LOOKASIDE_LIST Lookaside
)
{
}

VOID ExInitializePagedLookasideList(
  __out     PPAGED_LOOKASIDE_LIST Lookaside,
  __in_opt  PALLOCATE_FUNCTION Allocate,
  __in_opt  PFREE_FUNCTION Free,
  __in      ULONG Flags,
  __in      SIZE_T Size,
  __in      ULONG Tag,
  __in      USHORT Depth
)
{
    PPAGED_LOOKASIDE_LIST x = malloc(1);
    *Lookaside = *x;
}

PVOID ExRegisterCallback(
  __inout   PCALLBACK_OBJECT CallbackObject,
  __in      PCALLBACK_FUNCTION CallbackFunction,
  __in_opt  PVOID CallbackContext
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return (PVOID)malloc(1);
            break;
    }

}

VOID ExUnregisterCallback(
  __inout  PVOID CbRegistration
)
{

}

ULONG ExSetTimerResolution(
  __in  ULONG DesiredTime,
  __in  BOOLEAN SetResolution
)
{
    return DesiredTime;
}

NTKERNELAPI
LONGLONG
FASTCALL
ExfInterlockedCompareExchange64 (
    __inout __drv_interlocked LONGLONG volatile *Destination,
    __in PLONGLONG ExChange,
    __in PLONGLONG Comperand
    )
{
  ULONGLONG r = SdvKeepChoice();
}

LONGLONG ExInterlockedCompareExchange64(
  __inout  PLONGLONG Destination,
  __in     PLONGLONG Exchange,
  __in     PLONGLONG Comparand,
  __in     PKSPIN_LOCK Lock
)
{
  ULONGLONG r = SdvKeepChoice();
}
    




VOID ExSetResourceOwnerPointer(
  __inout  PERESOURCE Resource,
  __in     PVOID OwnerPointer
)
{
}


VOID ExSetResourceOwnerPointerEx(
  __inout  PERESOURCE Resource,
  __in     PVOID OwnerPointer,
  __in     ULONG Flags
)
{
}

PSINGLE_LIST_ENTRY 
FASTCALL
ExfInterlockedPopEntryList(
  __inout  PSINGLE_LIST_ENTRY ListHead,
  __inout  PKSPIN_LOCK Lock
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return (PVOID)malloc(1);
            break;
    }
}


PLIST_ENTRY 
FASTCALL
ExfInterlockedRemoveHeadList(
  __inout  PLIST_ENTRY ListHead,
  __inout  PKSPIN_LOCK Lock
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return (PVOID)malloc(1);
            break;
    }
}

LARGE_INTEGER ExInterlockedAddLargeInteger(
  __inout  PLARGE_INTEGER Addend,
  __in     LARGE_INTEGER Increment,
  __inout  PKSPIN_LOCK Lock
)
{

}



/*BOOLEAN ExIsResourceAcquired(
  IN PERESOURCE  Resource
)
{
  LONG choice = SdvMakeChoice();
  switch(choice) 
  {
      case 0:
          return TRUE;
          break;
      default:
          return FALSE;
          break;
  }
}*/

/*BOOLEAN ExIsResourceAcquiredShared(
  IN PERESOURCE  Resource
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}*/


PSLIST_ENTRY sdv_ExInterlockedPushEntrySList(
  __inout  PSLIST_HEADER ListHead,
  __inout  PSLIST_ENTRY ListEntry,
  __inout  PKSPIN_LOCK Lock
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return (PVOID)malloc(1);
            break;
    }
}

PSLIST_ENTRY sdv_ExInterlockedPopEntrySList(
  __inout  PSLIST_HEADER ListHead,
  __inout  PKSPIN_LOCK Lock
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return (PVOID)malloc(1);
            break;
    }
}

VOID sdv_ExReleaseResourceForThread(
  IN PERESOURCE  Resource,
  IN ERESOURCE_THREAD  ResourceThreadId
)
{
}

BOOLEAN sdv_ExIsResourceAcquiredShared(
  IN PERESOURCE  Resource
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}

BOOLEAN sdv_ExIsResourceAcquired(
  IN PERESOURCE  Resource
)
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }

}

VOID
sdv_ExAcquireSpinLockAtDpcLevel(
    IN PKSPIN_LOCK  SpinLock
    ) 
{
}



VOID
sdv_ExAcquireSpinLock(
    IN PKSPIN_LOCK SpinLock,
    OUT PKIRQL p_old_irql
    ) 
{
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
    (*p_old_irql) = sdv_irql_previous;
}

VOID sdv_ExReleaseSpinLockFromDpcLevel(
  __inout  PKSPIN_LOCK SpinLock
)
{
    
}

NTKERNELAPI
PSLIST_ENTRY
ExpInterlockedPushEntrySList (
    __inout PSLIST_HEADER ListHead,
    __inout __drv_aliasesMem PSLIST_ENTRY ListEntry
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return (PVOID)malloc(1);
            break;
    }
}

#if ((!POOL_NX_OPTIN) && (!POOL_NX_OPTIN_AUTO))

NTKERNELAPI
PSLIST_ENTRY
ExpInterlockedFlushSList (
    __inout PSLIST_HEADER ListHead
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return (PVOID)malloc(1);
            break;
    }
}
#endif


#if !defined(_X86_)
NTKERNELAPI
PSLIST_ENTRY
FASTCALL
sdv_ExInterlockedFlushSList(
     __inout PSLIST_HEADER ListHead
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return (PVOID)malloc(1);
            break;
    }
}
#else
NTKERNELAPI
PSLIST_ENTRY
FASTCALL
ExInterlockedFlushSList(
     __inout PSLIST_HEADER ListHead
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return NULL;
            break;
        default:
            return (PVOID)malloc(1);
            break;
    }
}
#endif


BOOLEAN
FASTCALL
ExiTryToAcquireFastMutex(
    __inout __deref __drv_acquiresExclusiveResource(FastMutexType)
    PFAST_MUTEX FastMutex
    )
{
    LONG choice = SdvMakeChoice();
    switch(choice) 
    {
        case 0:
            return TRUE;
            break;
        default:
            return FALSE;
            break;
    }
}

VOID
FASTCALL
ExiReleaseFastMutex(
    __inout __deref __drv_releasesExclusiveResource(FastMutexType)
    __inout PFAST_MUTEX FastMutex
    )
{
}

VOID
FASTCALL
ExiAcquireFastMutex(
    __inout __deref __drv_acquiresExclusiveResource(FastMutexType)
    PFAST_MUTEX FastMutex
    )
{
}


NTKERNELAPI
VOID
ExDeleteLookasideListEx (
    __inout PLOOKASIDE_LIST_EX Lookaside
    )
{
}

NTKERNELAPI
VOID
ExDeleteNPagedLookasideList (
    __inout PNPAGED_LOOKASIDE_LIST Lookaside
    )
{
}

NTKERNELAPI
VOID
ExFreePoolWithTag(
    __in __drv_freesMem(Mem) PVOID P,
    __in ULONG Tag
    )
{
}

NTKERNELAPI
NTSTATUS
ExInitializeLookasideListEx (
    __out PLOOKASIDE_LIST_EX Lookaside,
    __in_opt PALLOCATE_FUNCTION_EX Allocate,
    __in_opt PFREE_FUNCTION_EX Free,
    __in POOL_TYPE PoolType,
    __in ULONG Flags,
    __in SIZE_T Size,
    __in ULONG Tag,
    __in USHORT Depth
    )
{
    int x = SdvMakeChoice();
    switch (x) 
    {
        case 0: return STATUS_SUCCESS;break;
        default: return STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

#if ((!POOL_NX_OPTIN) && (!POOL_NX_OPTIN_AUTO))
NTKERNELAPI
VOID
ExInitializeNPagedLookasideList (
    PNPAGED_LOOKASIDE_LIST Lookaside,
    PALLOCATE_FUNCTION Allocate,
    PFREE_FUNCTION Free,
    ULONG Flags,
    SIZE_T Size,
    ULONG Tag,
    USHORT Depth
    )
{
}
#endif 

#if !POOL_NX_OPTOUT && (POOL_NX_OPTIN || POOL_NX_OPTIN_AUTO)


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
    )
{
    /*ExInitializeNPagedLookasideList(Lookaside,
                                    Allocate,
                                    Free,
#if POOL_NX_OPTIN_AUTO
                                    Flags | POOL_NX_ALLOCATION,
#else
                                    Flags | (ULONG) ExDefaultNonPagedPoolType,
#endif
                                    Size,
                                    Tag,
                                    Depth);*/
}

#endif


/* ..\wdm\ntddk-ex.c end */

/* ..\wdm\ntddk-misc.c begin */
/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/

PCHAR sdv_containing_record(
    IN PCHAR Address,
	IN ULONG_PTR FieldOffset
    )
{
    PCHAR record = Address - FieldOffset;
    return record;
}

VOID
NTAPI
DbgBreakPoint(
    VOID
    )
{
}

NTSYSAPI
VOID
NTAPI
DbgBreakPointWithStatus(
    IN ULONG Status
    )
{
}

VOID
sdv_InitializeObjectAttributes(
     OUT POBJECT_ATTRIBUTES p,
     IN PUNICODE_STRING n,
     IN ULONG a,
     IN HANDLE r,
     IN PSECURITY_DESCRIPTOR s
     )
{
}

NTKERNELAPI
LONG
FASTCALL
sdv_InterlockedDecrement(
    IN LONG volatile *Addend
    )
{
    (*Addend)--;
    return *Addend;
}

NTKERNELAPI
LONG
FASTCALL
sdv_InterlockedIncrement(
    IN LONG volatile *Addend
    )
{
    (*Addend)++;
    return *Addend;
}

NTKERNELAPI
VOID
NTAPI
ProbeForRead(
    IN CONST VOID *Address,
    IN SIZE_T Length,
    IN ULONG Alignment
    )
{
}

NTKERNELAPI
VOID
NTAPI
ProbeForWrite (
    IN PVOID Address,
    IN SIZE_T Length,
    IN ULONG Alignment
    )
{
}

ULONGLONG
NTAPI
VerSetConditionMask(
        IN  ULONGLONG   ConditionMask,
        IN  ULONG   TypeMask,
        IN  UCHAR   Condition
    )
{
    ULONGLONG r = SdvKeepChoice();
    return r;
}



BOOLEAN sdv_NT_ERROR (
    NTSTATUS Status
    )
{
    return (Status <= 0xFFFFFFFF && Status >= 0xC0000000 ); 
}

NTSTATUS
EtwWrite(    
    __in REGHANDLE  RegHandle,    
    __in PCEVENT_DESCRIPTOR  EventDescriptor,    
    __in_opt LPCGUID  ActivityId,    
    __in ULONG  UserDataCount,    
    __in_opt PEVENT_DATA_DESCRIPTOR  UserData
    )
{
    int choice;
    if(RegHandle==NULL)
    {
        return STATUS_INVALID_HANDLE;
    }
    else if(UserDataCount>128)
    {
        return STATUS_INVALID_PARAMETER;
    }
    else 
    {
        if(ActivityId!=NULL)
        {
            choice = SdvMakeChoice();
            switch (choice) 
            {
                case 0: return STATUS_SUCCESS;break;
                default: return STATUS_NO_MEMORY;break;
            }
        }
        else
        {
            return STATUS_SUCCESS;
        }
    }
}

NTSTATUS
EtwWriteEndScenario(
    IN REGHANDLE RegHandle,
    IN PCEVENT_DESCRIPTOR EventDescriptor,
    IN LPCGUID ActivityId,
    IN ULONG UserDataCount,
    IN OPTIONAL PEVENT_DATA_DESCRIPTOR UserData
    )

{
    int choice;
    if(RegHandle==NULL)
    {
        return STATUS_INVALID_HANDLE;
    }
    else if(UserDataCount>128)
    {
        return STATUS_INVALID_PARAMETER;
    }
    else 
    {
        if(ActivityId!=NULL)
        {
            choice = SdvMakeChoice();
            switch (choice) 
            {
                case 0: return STATUS_SUCCESS;break;
                default: return STATUS_NO_MEMORY;break;
            }
        }
        else
        {
            return STATUS_SUCCESS;
        }
    }
}

NTKERNELAPI
NTSTATUS
EtwWriteStartScenario(
    IN REGHANDLE RegHandle,
    IN PCEVENT_DESCRIPTOR EventDescriptor,
    IN OUT LPGUID ActivityId,
    IN ULONG UserDataCount,
    IN OPTIONAL PEVENT_DATA_DESCRIPTOR UserData
    )

{
    int choice;
    if(RegHandle==NULL)
    {
        return STATUS_INVALID_HANDLE;
    }
    else if(UserDataCount>128)
    {
        return STATUS_INVALID_PARAMETER;
    }
    else 
    {
        if(ActivityId!=NULL)
        {
            choice = SdvMakeChoice();
            switch (choice) 
            {
                case 0: return STATUS_SUCCESS;break;
                default: return STATUS_NO_MEMORY;break;
            }
        }
        else
        {
            return STATUS_SUCCESS;
        }
    }
}


FORCEINLINE
BOOLEAN   
sdv_RemoveEntryList(    
    IN PLIST_ENTRY  Entry
    )
{
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }
}

BOOLEAN   
sdv_IsListEmpty(
    IN PLIST_ENTRY  ListHead    
    )
{
    int choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }
}

NTKERNELAPI
PSLIST_ENTRY
FASTCALL
sdv_InterlockedPopEntrySList (
    __inout PSLIST_HEADER ListHead
    )
{
  PVOID p;
  int x = SdvMakeChoice();
  switch (x) 
  {
        case 0: return p=(PVOID)malloc(1);break;
        default:return  p=NULL;break;
  }
}



NTKERNELAPI
PSLIST_ENTRY
sdv_InterlockedPushEntrySList (
    PSLIST_HEADER ListHead,
    PSLIST_ENTRY ListEntry
    )
{
  PVOID p;
  int x = SdvMakeChoice();
  switch (x) 
  {
        case 0: return p=(PVOID)malloc(1);break;
        default:return  p=NULL;break;
  }
}

LONG sdv_InterlockedCompareExchangeAcquire(
  __inout  LONG volatile *Destination,
  __in     LONG Exchange,
  __in     LONG Comparand
)
{
    return (LONG)SdvKeepChoice();
}


NTSTATUS EtwUnregister(
  __in  REGHANDLE RegHandle
)
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0:return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}


NTSTATUS EtwRegister(
  __in      LPCGUID ProviderId,
  __in_opt  PETWENABLECALLBACK EnableCallback,
  __in_opt  PVOID CallbackContext,
  __out     PREGHANDLE RegHandle
)
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0:return STATUS_INVALID_PARAMETER;break;
        case 1:return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}


NTSTATUS
NTAPI
NtCreateFile (
    __out PHANDLE FileHandle,
    __in ACCESS_MASK DesiredAccess,
    __in POBJECT_ATTRIBUTES ObjectAttributes,
    __out PIO_STATUS_BLOCK IoStatusBlock,
    __in_opt PLARGE_INTEGER AllocationSize,
    __in ULONG FileAttributes,
    __in ULONG ShareAccess,
    __in ULONG CreateDisposition,
    __in ULONG CreateOptions,
    __in_bcount_opt(EaLength) PVOID EaBuffer,
    __in ULONG EaLength
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0:return STATUS_INVALID_PARAMETER;break;
        case 1:return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSTATUS
NTAPI
NtReadFile (
    __in HANDLE FileHandle,
    __in_opt HANDLE Event,
    __in_opt PIO_APC_ROUTINE ApcRoutine,
    __in_opt PVOID ApcContext,
    __out PIO_STATUS_BLOCK IoStatusBlock,
    __out_bcount(Length) PVOID Buffer,
    __in ULONG Length,
    __in_opt PLARGE_INTEGER ByteOffset,
    __in_opt PULONG Key
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0:return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}

NTSTATUS
NTAPI
NtWriteFile (
    __in HANDLE FileHandle,
    __in_opt HANDLE Event,
    __in_opt PIO_APC_ROUTINE ApcRoutine,
    __in_opt PVOID ApcContext,
    __out PIO_STATUS_BLOCK IoStatusBlock,
    __in_bcount(Length) PVOID Buffer,
    __in ULONG Length,
    __in_opt PLARGE_INTEGER ByteOffset,
    __in_opt PULONG Key
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0:return STATUS_SUCCESS;break;
        default: return STATUS_UNSUCCESSFUL;break;
    }
}
    
BOOLEAN sdv_AbnormalTermination(VOID)
{
    return FALSE;
}


__forceinline
ULONG64
sdv_READ_REGISTER_ULONG64(
    volatile ULONG64 *Register
    )
{
    return *Register;
}

__forceinline
VOID
sdv_READ_REGISTER_BUFFER_ULONG64 (
    volatile ULONG64 *Register,
    _Out_writes_all_(Count) PULONG64 Buffer,
    ULONG Count
    )
{
    ULONG64 x = SdvMakeChoice();
    *Buffer = x;
    return;
}

__forceinline
VOID
sdv_WRITE_REGISTER_ULONG64 (
    volatile ULONG64 *Register,
    ULONG64 Value
    )
{

    *Register = Value;
    return;
}
/* ..\wdm\ntddk-misc.c end */

/* sp-harness-parts.c begin */
#include "storport.h"
#include "scsiwmi.h"


int notused_4p_DeviceExtension;
PVOID sdv_DeviceExtension=(PVOID) &notused_4p_DeviceExtension;

int notused_4p_hwDeviceExtension;
PVOID sdv_HwDeviceExtension=(PVOID) &notused_4p_hwDeviceExtension;

PUNICODE_STRING hregistry_path;
PDRIVER_OBJECT hp_driver;

PUNICODE_STRING hregistry_path;
PDRIVER_OBJECT hp_driver;

int notused_4srb;
PSCSI_REQUEST_BLOCK sdv_srb = (PSCSI_REQUEST_BLOCK) (& notused_4srb);


int notused_4hwctx;
PVOID sdv_HwContext = (PVOID) &notused_4hwctx;

int notused_4ctx;
PVOID sdv_Context = (PVOID) &notused_4ctx;

int notused_4ArgStr;
PCHAR sdv_ArgumentString = (PCHAR) &notused_4ArgStr;

int notused_4busInfo;
PVOID sdv_BusInformation = (PVOID) &notused_4busInfo;

int notused_4cfgInfo;
PPORT_CONFIGURATION_INFORMATION sdv_ConfigInfo = (PPORT_CONFIGURATION_INFORMATION) &notused_4cfgInfo;

int notused_4again;
PBOOLEAN sdv_Again = (PBOOLEAN) &notused_4again;

int notused_4pathId, notused_4pathId1;
PVOID sdv_PathId = (PVOID ) (& notused_4pathId);
PVOID sdv_PathId1 = (PVOID ) (& notused_4pathId1);

BOOLEAN sdv_SaveState;

SCSI_ADAPTER_CONTROL_TYPE sdv_ControlType;

int notused_4parm;
PVOID sdv_Param = (PVOID) (&notused_4parm);

int notused_4dpc;
PSTOR_DPC sdv_Dpc = (PSTOR_DPC)(&notused_4dpc);

int notused_4sysarg, notused_4sysarg2;
PVOID sdv_SysArg = (PVOID) (&notused_4sysarg);
PVOID sdv_SysArg2 = (PVOID) (&notused_4sysarg2);

int notused_4arg, notused_4arg2;
PVOID sdv_Arg = (PVOID) (&notused_4arg);
PVOID sdv_Arg2 = (PVOID) (&notused_4arg2);

int notused_4irp;
PIRP sdv_Irp = (PIRP)(&notused_4irp);

int notused_4lowerDev;
PVOID sdv_LowerDevice = (PVOID) (&notused_4lowerDev);

int notused_4CurrentMiniportDev;
PVOID sdv_CurrentMiniportDevice = (PVOID) (&notused_4CurrentMiniportDev);

int notused_4CurrentMiniportIrp;
PVOID sdv_CurrentMiniportIrp = (PVOID) (&notused_4CurrentMiniportIrp);

int notused_4ScatterGatherList;
PSTOR_SCATTER_GATHER_LIST sdv_ScatterGatherList=(PSTOR_SCATTER_GATHER_LIST) (&notused_4ScatterGatherList);


int notused_HwAddress;
PVOID sdv_HwAddress = (PVOID) (&notused_HwAddress);

int notused_Worker;
PVOID sdv_Worker = (PVOID) (&notused_Worker);





NTSTATUS ntstatus;

ULONG sdv_hwstatus;

ULONG sdv_MessageId;

SHORT sdv_HwAddressType;




#define SDV_IS_LIFECYCLE_HARNESS() \
    ( \
        SDV_HARNESS==SDV_SP_HW_BASIC_LIFECYCLE \
    )














/* sp-harness-parts.c end */

/* sp-harness-simple.c begin */



#if (SDV_HARNESS==SDV_SP_FLAT_HARNESS || SDV_HARNESS==SDV_SP_FLAT_HARNESS_NO_HWINIT)


void sdv_main ()
{

  int choice = SdvMakeChoice();
  
  switch (choice)
  {
    #if (SDV_HARNESS==SDV_SP_FLAT_HARNESS)
        #if defined(fun_SP_HW_INITIALIZE)
        case 0:
            fun_SP_HW_INITIALIZE(sdv_DeviceExtension);
         break;
        #endif
    #endif
      
#ifndef sp_createharness

    #ifdef fun_DriverEntry
    case 1:
      fun_DriverEntry(hp_driver, hregistry_path);
    break;
    #endif


    #ifdef fun_SP_DriverEntry 
    case 100:
      __analysis_assume((hp_driver!=NULL)&&(hregistry_path!=NULL));
      fun_SP_DriverEntry(hp_driver, hregistry_path);
    break;
    #endif


    #ifdef fun_SP_HW_BUILDIO 
    case 2:
#ifdef NO_SRB_WMI
		SdvAssume(sdv_srb->Function != SRB_FUNCTION_WMI);
#endif
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_DUMP_POINTERS);
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_FREE_DUMP_POINTERS);
      fun_SP_HW_BUILDIO(sdv_DeviceExtension, sdv_srb);
    break;
    #endif
    
    #ifdef fun_SP_HW_STARTIO  
    case 3:
#ifdef NO_SRB_WMI
		SdvAssume(sdv_srb->Function != SRB_FUNCTION_WMI);
#endif
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_DUMP_POINTERS);
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_FREE_DUMP_POINTERS);
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    #endif
    
    #ifdef fun_SP_HW_INTERRUPT
    case 4:
      fun_SP_HW_INTERRUPT(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_1
    case 5:
      fun_SP_HW_TIMER_1(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_2
    case 63:
      fun_SP_HW_TIMER_2(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_3
    case 64:
      fun_SP_HW_TIMER_3(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_4
    case 65:
      fun_SP_HW_TIMER_4(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_5
    case 66:
      fun_SP_HW_TIMER_5(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_6
    case 67:
      fun_SP_HW_TIMER_6(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_DMA_STARTED
    case 7:
      fun_SP_HW_DMA_STARTED(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_FIND_ADAPTER
    case 8:
    SdvAssume(sdv_ConfigInfo->VirtualDevice == FALSE);
    __analysis_assume((sdv_ArgumentString!="dump=1")&&(sdv_ArgumentString!="ntldr=1"));
    Choice_Non_CrashMode();
    fun_SP_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation, 
                             sdv_ArgumentString, sdv_ConfigInfo, sdv_Again);
    sdv_CheckConfig(sdv_ConfigInfo);
	sdv_CheckVirtual(sdv_ConfigInfo);
	break;
    #endif
    
    #ifdef fun_SP_HW_RESET_BUS
    case 9:
      fun_SP_HW_RESET_BUS(sdv_DeviceExtension, sdv_PathId);
    break;
    #endif
    
    #ifdef fun_SP_HW_ADAPTER_STATE
    case 10:
      fun_SP_HW_ADAPTER_STATE(sdv_DeviceExtension, sdv_Context, sdv_SaveState);
    break;
    #endif
    
    #ifdef fun_SP_HW_ADAPTER_CONTROL
    case 11:
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, sdv_ControlType, sdv_Param);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_1
    case 12:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_1(sdv_DeviceExtension);
    break;
    #endif

    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_2
    case 13:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_2(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_3
    case 14:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_3(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_4
    case 15:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_4(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_5
    case 16:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_5(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_6
    case 17:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_6(sdv_DeviceExtension);
    break;
    #endif
#ifndef NO_fun_SP_HW_DPC_ROUTINE  
    #ifdef fun_SP_HW_DPC_ROUTINE_1
    case 18:
      fun_SP_HW_DPC_ROUTINE_1(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif  
    
    #ifdef fun_SP_HW_DPC_ROUTINE_2
    case 19:
      fun_SP_HW_DPC_ROUTINE_2(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_3
    case 20:
      fun_SP_HW_DPC_ROUTINE_3(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_4
    case 21:
      fun_SP_HW_DPC_ROUTINE_4(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_5
    case 22:
      fun_SP_HW_DPC_ROUTINE_5(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_6
    case 23:
      fun_SP_HW_DPC_ROUTINE_6(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
#endif
 

    #ifdef fun_SP_HW_FREE_ADAPTER_RESOURCES
    case 24:
      fun_SP_HW_FREE_ADAPTER_RESOURCES(sdv_DeviceExtension);
    break;
    #endif 
    
    #ifdef fun_SP_HW_PROCESS_SERVICE_REQUEST
    case 25:
      fun_SP_HW_PROCESS_SERVICE_REQUEST(sdv_DeviceExtension, sdv_Irp);
    break;
    #endif 
    
    #ifdef fun_SP_HW_COMPLETE_SERVICE_IRP
    case 26:
      fun_SP_HW_COMPLETE_SERVICE_IRP(sdv_DeviceExtension);
    break;
    #endif 
    
    #ifdef fun_SP_HW_INITIALIZE_TRACING
    case 27:
      fun_SP_HW_INITIALIZE_TRACING(sdv_Arg, sdv_Arg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_CLEANUP_TRACING
    case 28:
      fun_SP_HW_CLEANUP_TRACING(sdv_Arg);
    break;
    #endif 
    
    #ifdef fun_SP_VIRTUAL_HW_FIND_ADAPTER
    case 29:
		fun_SP_VIRTUAL_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation, sdv_LowerDevice, 
                                      sdv_ArgumentString, sdv_ConfigInfo, sdv_Again);
		sdv_CheckConfig(sdv_ConfigInfo);
		sdv_CheckVirtual(sdv_ConfigInfo);	
    break;
    #endif 
    
#ifndef NO_fun_DRIVER_CANCEL    
    #ifdef fun_DRIVER_CANCEL_1
    case 44:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_1(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_2
    case 45:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_2(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_3
    case 46:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_3(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_4
    case 47:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_4(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_5
    case 48:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_5(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_6
    case 49:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_6(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_7
    case 50:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_7(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif

#endif

#ifndef NO_fun_IO_COMPLETION 
    
    #ifdef fun_IO_COMPLETION_ROUTINE_1
    case 51:
        
        fun_IO_COMPLETION_ROUTINE_1(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif

    #ifdef fun_IO_COMPLETION_ROUTINE_2
    case 52:
        
        fun_IO_COMPLETION_ROUTINE_2(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_3
    case 53:
        
        fun_IO_COMPLETION_ROUTINE_3(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_4
    case 54:
        
        fun_IO_COMPLETION_ROUTINE_4(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_5
    case 55:
        
        fun_IO_COMPLETION_ROUTINE_5(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_6
    case 56:
        
        fun_IO_COMPLETION_ROUTINE_6(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_7
    case 57:
        
        fun_IO_COMPLETION_ROUTINE_7(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_8
    case 58:
        
        fun_IO_COMPLETION_ROUTINE_8(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_9
    case 59:
        
        fun_IO_COMPLETION_ROUTINE_9(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_10
    case 60:
        
        fun_IO_COMPLETION_ROUTINE_10(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_11
    case 61:
        
        fun_IO_COMPLETION_ROUTINE_11(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_12
    case 62:
        
        fun_IO_COMPLETION_ROUTINE_12(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif

#endif
#endif
    
    #ifdef fun_HW_STATE_CHANGE_1
    case 63:
        fun_HW_STATE_CHANGE_1(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
 
 
    #ifdef fun_HW_STATE_CHANGE_2
    case 64:
        fun_HW_STATE_CHANGE_2(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
    
    #ifdef fun_HW_STATE_CHANGE_3
    case 65:
        fun_HW_STATE_CHANGE_3(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
 
 
    #ifdef fun_HW_STATE_CHANGE_4
    case 66:
        fun_HW_STATE_CHANGE_4(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif

    #ifdef fun_HW_STATE_CHANGE_5
    case 67:
        fun_HW_STATE_CHANGE_5(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
 
 
    #ifdef fun_HW_STATE_CHANGE_6
    case 68:
        fun_HW_STATE_CHANGE_6(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
    
    #ifdef fun_HW_MESSAGE_SIGNALED_INTERRUPT_ROUTINE
    case 69:
        fun_HW_MESSAGE_SIGNALED_INTERRUPT_ROUTINE(sdv_DeviceExtension,sdv_MessageId);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_1
    case 70:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_1(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_2
    case 71:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_2(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_3
    case 72:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_3(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_4
    case 73:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_4(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_5
    case 74:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_5(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_6
    case 75:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_6(sdv_DeviceExtension,sdv_Context);
    break;
    #endif

    #ifdef fun_HW_WORKITEM_1
    case 76:
      
      fun_HW_WORKITEM_1(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_2
    case 77:
      
      fun_HW_WORKITEM_2(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_3
    case 78:
      
      fun_HW_WORKITEM_3(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_4
    case 79
      
      fun_HW_WORKITEM_4(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_5
    case 80:
      
      fun_HW_WORKITEM_5(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_6
    case 81:
      
      fun_HW_WORKITEM_6(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_SP_POST_SCATTER_GATHER_EXECUTE
    case 83:
      fun_SP_POST_SCATTER_GATHER_EXECUTE(&sdv_CurrentMiniportDevice,&sdv_Irp,sdv_ScatterGatherList,sdv_Context);
    break;
    #endif
    
  } 
}
#endif


#if SDV_HARNESS==SDV_SP_FLAT_TEST


void sdv_main ()
{


}
#endif

/* sp-harness-simple.c end */

/* sp-harness-small.c begin */


#if SDV_HARNESS==SDV_SP_FLAT_DUPLEX_HARNESS

void sdv_is_half_duplex(){}

void sdv_main ()
{

  ULONG uret;
  int choice = SdvMakeChoice();
 
  switch (choice){
      
    #ifdef fun_SP_HW_FIND_ADAPTER
    case 0:
      __analysis_assume((sdv_ArgumentString!="dump=1")&&(sdv_ArgumentString!="ntldr=1"));
      Choice_Non_CrashMode();
      uret = fun_SP_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation, 
                                        sdv_ArgumentString, sdv_ConfigInfo, sdv_Again);
      if(uret==SP_RETURN_FOUND)
      {
        if(sdv_ConfigInfo->SynchronizationModel==StorSynchronizeHalfDuplex)
        {
            sdv_is_half_duplex();
        }
      }
    break;
    #endif
    
    #ifdef fun_SP_VIRTUAL_HW_FIND_ADAPTER
    case 1:
      Choice_Non_CrashMode();
      uret = fun_SP_VIRTUAL_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation,
                                                 sdv_LowerDevice, sdv_ArgumentString, 
                                                 sdv_ConfigInfo, sdv_Again);
      if(uret==SP_RETURN_FOUND)
      {
        if(sdv_ConfigInfo->SynchronizationModel==StorSynchronizeHalfDuplex)
        {
            sdv_is_half_duplex();
        }
      }
    break;
    #endif 
  }
}

#endif



#if SDV_HARNESS==SDV_SP_FLAT_RETVAL_HARNESS


void sdv_main ()
{

  int choice = SdvMakeChoice();

  
  switch (choice){
      
    #ifdef fun_SP_HW_FIND_ADAPTER
    case 0:
      __analysis_assume(sdv_ArgumentString!="dump=1");
      Choice_Non_CrashMode();
      fun_SP_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation, 
                             sdv_ArgumentString, sdv_ConfigInfo, sdv_Again);
    break;
    #endif
    
    #ifdef fun_SP_VIRTUAL_HW_FIND_ADAPTER
    case 1:
      Choice_Non_CrashMode();
      fun_SP_VIRTUAL_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation,
                                      sdv_LowerDevice, sdv_ArgumentString, 
                                      sdv_ConfigInfo, sdv_Again);
    break;
    #endif 
  }
}

#endif

#if SDV_HARNESS==SDV_SP_FIND_STARTIO


void sdv_main ()
{

  int choice = SdvMakeChoice();
  ULONG uret;
  
  #ifdef fun_SP_HW_FIND_ADAPTER
  __analysis_assume(sdv_ArgumentString!="dump=1");
  Choice_Non_CrashMode();
  uret = fun_SP_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation,sdv_ArgumentString, sdv_ConfigInfo, sdv_Again);
  SdvAssume(uret==SP_RETURN_FOUND);
  #endif
  #ifdef fun_SP_VIRTUAL_HW_FIND_ADAPTER
  uret=fun_SP_VIRTUAL_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation,sdv_LowerDevice, sdv_ArgumentString,sdv_ConfigInfo, sdv_Again);
  SdvAssume(uret==SP_RETURN_FOUND);
  #endif   
  
  switch (choice)
  {
      
    #ifdef fun_SP_HW_STARTIO  
    case 0:
      sdv_srb->Function = SRB_FUNCTION_EXECUTE_SCSI;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    
    case 1:
      sdv_srb->Function = SRB_FUNCTION_IO_CONTROL;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    
    case 2:
      sdv_srb->Function = SRB_FUNCTION_FLUSH;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    
    
    case 3:
      sdv_srb->Function = SRB_FUNCTION_PNP;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    
    case 4:
      sdv_srb->Function = SRB_FUNCTION_POWER;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    
    case 5:
      sdv_srb->Function = SRB_FUNCTION_RESET_BUS;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    
    case 6:
      sdv_srb->Function = SRB_FUNCTION_RESET_DEVICE;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    
    case 7:
      sdv_srb->Function = SRB_FUNCTION_RESET_LOGICAL_UNIT;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    
    case 8:
      sdv_srb->Function = SRB_FUNCTION_SHUTDOWN;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    
    #endif 
  }
}

#endif

#if SDV_HARNESS==SDV_SP_FLAT_MINIMAL_STARTIO


void sdv_main ()
{

  int choice = SdvMakeChoice();
   
  switch (choice)
  {
      
    #ifdef fun_SP_HW_STARTIO  
    case 0:
      sdv_srb->Function = SRB_FUNCTION_EXECUTE_SCSI;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
        
    case 1:
      sdv_srb->Function = SRB_FUNCTION_FLUSH;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    #endif 
  }
}

#endif


#if SDV_HARNESS==SDV_SP_FLAT_ADAPTER_HARNESS


void sdv_main ()
{
       
    #ifdef fun_SP_HW_ADAPTER_CONTROL 
        
        fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, sdv_ControlType, sdv_Param);
    #endif 
}

#endif

/* sp-harness-small.c end */

/* sp-harness-flat-irql.c begin */

#if SDV_HARNESS==SDV_SP_FLAT_IRQL_HARNESS



#ifdef sdv_sp_changeIrql

KIRQL sdv_irql_enter = PASSIVE_LEVEL;

#define SDV_IRQL_ENTER(enter_irql) (sdv_irql_enter = enter_irql)

#else
#define SDV_IRQL_ENTER(enter_irql)


#endif
    

#define DIRQL 26
    

void Choice_Dispatch()
{
	int irql = SdvMakeChoice();
    switch(irql)
    {
    case 0:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      break;
    case 1:
      SDV_IRQL_ENTER(APC_LEVEL);SDV_IRQL_PUSH(APC_LEVEL);
      break;
    default:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      break;
    }
}


void sdv_main ()
{

  int choice = SdvMakeChoice();
  
  switch (choice){
    #if defined(fun_SP_HW_INITIALIZE)
    case 0:
      SDV_IRQL_ENTER(DIRQL);SDV_IRQL_PUSH(DIRQL);
      fun_SP_HW_INITIALIZE(sdv_DeviceExtension);
    break;
    #endif

    #ifdef fun_DriverEntry
    case 1:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_DriverEntry(hp_driver, hregistry_path);
    break;
    #endif

    #ifdef fun_SP_DriverEntry
    case 2:
      __analysis_assume((hp_driver!=NULL)&&(hregistry_path!=NULL));
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_DriverEntry(hp_driver, hregistry_path);
    break;
    #endif
    

    #ifdef fun_SP_HW_BUILDIO 
    case 3:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      #ifdef NO_SRB_WMI
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_WMI);
      #endif
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_DUMP_POINTERS);
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_FREE_DUMP_POINTERS);
      fun_SP_HW_BUILDIO(sdv_DeviceExtension, sdv_srb);
    break;
    #endif
    
    #ifdef fun_SP_HW_STARTIO  
    case 4:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      #ifdef NO_SRB_WMI
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_WMI);
      #endif
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_DUMP_POINTERS);
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_FREE_DUMP_POINTERS);
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    #endif
    
    #ifdef fun_SP_HW_INTERRUPT
    case 5:
      SDV_IRQL_ENTER(DIRQL);SDV_IRQL_PUSH(DIRQL);
      fun_SP_HW_INTERRUPT(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_1
    case 6:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_1(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_2
    case 7:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_2(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_3
    case 8:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_3(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_4
    case 9:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_4(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_5
    case 10:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_5(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_6
    case 11:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_6(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_DMA_STARTED
    case 12:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_DMA_STARTED(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_FIND_ADAPTER
    case 13:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      __analysis_assume((sdv_ArgumentString!="dump=1")&&(sdv_ArgumentString!="ntldr=1"));
      Choice_Non_CrashMode();
      fun_SP_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation, 
                             sdv_ArgumentString, sdv_ConfigInfo, sdv_Again);
    break;
    #endif
    
    #ifdef fun_SP_HW_RESET_BUS
    case 14:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_RESET_BUS(sdv_DeviceExtension, sdv_PathId);
    break;
    #endif
    
    #ifdef fun_SP_HW_ADAPTER_STATE
    case 15:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_ADAPTER_STATE(sdv_DeviceExtension, sdv_Context, sdv_SaveState);
    break;
    #endif
    
    #ifdef fun_SP_HW_ADAPTER_CONTROL
    case 16:
      SDV_IRQL_ENTER(DIRQL);SDV_IRQL_PUSH(DIRQL);
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension,ScsiRestartAdapter, sdv_Param);
    break;
    
    case 17:
      SDV_IRQL_ENTER(DIRQL);SDV_IRQL_PUSH(DIRQL);
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension,ScsiStopAdapter, sdv_Param);
    break;
    
    case 18:
      Choice_Dispatch();
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, ScsiAdapterPower, sdv_Param);
    break;

    case 19:
      Choice_Dispatch();
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, ScsiAdapterPoFxPowerRequired, sdv_Param);
    break;

    case 20:
      Choice_Dispatch();
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, ScsiAdapterPoFxPowerActive, sdv_Param);
    break;

    case 21:
      Choice_Dispatch();
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, ScsiAdapterPoFxPowerSetFState, sdv_Param);
    break;

    case 22:
      Choice_Dispatch();
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, ScsiAdapterPoFxPowerControl, sdv_Param);
    break;

    case 23:
      Choice_Dispatch();
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, ScsiAdapterPrepareForBusReScan, sdv_Param);
    break;

    case 24:
      Choice_Dispatch();
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, ScsiAdapterSystemPowerHints, sdv_Param);
    break;
    
    case 25:
      SdvAssume(sdv_ControlType!=ScsiStopAdapter &&
                sdv_ControlType!=ScsiRestartAdapter && 
                sdv_ControlType!=ScsiAdapterPower  &&
                sdv_ControlType!=ScsiAdapterPoFxPowerRequired  &&
                sdv_ControlType!=ScsiAdapterPoFxPowerActive  &&
                sdv_ControlType!=ScsiAdapterPoFxPowerSetFState  &&
                sdv_ControlType!=ScsiAdapterPoFxPowerControl  &&
                sdv_ControlType!=ScsiAdapterPrepareForBusReScan  &&
                sdv_ControlType!=ScsiAdapterSystemPowerHints);
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, sdv_ControlType, sdv_Param);
    break;
    
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_1
    case 26:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_1(sdv_DeviceExtension);
    break;
    #endif

    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_2
    case 27:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_2(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_3
    case 28:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_3(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_4
    case 29:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_4(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_5
    case 30:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_5(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_6
    case 31:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_6(sdv_DeviceExtension);
    break;
    #endif
  
    #ifdef fun_SP_HW_DPC_ROUTINE_1
    case 32:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_DPC_ROUTINE_1(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif  
    
    #ifdef fun_SP_HW_DPC_ROUTINE_2
    case 33:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_DPC_ROUTINE_2(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_3
    case 34:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_DPC_ROUTINE_3(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_4
    case 35:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_DPC_ROUTINE_4(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_5
    case 36:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_DPC_ROUTINE_5(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_6
    case 37:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_DPC_ROUTINE_6(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 

 

    #ifdef fun_SP_HW_FREE_ADAPTER_RESOURCES
    case 38:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_FREE_ADAPTER_RESOURCES(sdv_DeviceExtension);
    break;
    #endif 
    
    #ifdef fun_SP_HW_PROCESS_SERVICE_REQUEST
    case 39:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_PROCESS_SERVICE_REQUEST(sdv_DeviceExtension, sdv_Irp);
    break;
    #endif 
    
    #ifdef fun_SP_HW_COMPLETE_SERVICE_IRP
    case 40:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_COMPLETE_SERVICE_IRP(sdv_DeviceExtension);
    break;
    #endif 
    
    #ifdef fun_SP_HW_INITIALIZE_TRACING
    case 41:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_INITIALIZE_TRACING(sdv_Arg, sdv_Arg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_CLEANUP_TRACING
    case 42:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      fun_SP_HW_CLEANUP_TRACING(sdv_Arg);
    break;
    #endif 
    
    #ifdef fun_SP_VIRTUAL_HW_FIND_ADAPTER
    case 43:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      Choice_Non_CrashMode();
      fun_SP_VIRTUAL_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation, 
                                      sdv_LowerDevice, sdv_ArgumentString, sdv_ConfigInfo, sdv_Again);
    break;
    #endif 
    
    
    #ifdef fun_DRIVER_CANCEL_1
    case 44:
       Choice_Dispatch();
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_1(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_2
    case 45:
       Choice_Dispatch();
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_2(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_3
    case 46:
       Choice_Dispatch();
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_3(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_4
    case 47:
       Choice_Dispatch();
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_4(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_5
    case 48:
       Choice_Dispatch();
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_5(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_6
    case 49:
       Choice_Dispatch();
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_6(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_7
    case 50:
       Choice_Dispatch();
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_7(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif

    
    #ifdef fun_IO_COMPLETION_ROUTINE_1
    case 51:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_1(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif

    #ifdef fun_IO_COMPLETION_ROUTINE_2
    case 52:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_2(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_3
    case 53:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_3(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_4
    case 54:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_4(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_5
    case 55:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_5(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_6
    case 56:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_6(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_7
    case 57:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_7(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_8
    case 58:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_8(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_9
    case 59:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_9(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_10
    case 60:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_10(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_11
    case 61:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_11(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_12
    case 62:
        Choice_Dispatch();
        fun_IO_COMPLETION_ROUTINE_12(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
 
    #ifdef fun_HW_STATE_CHANGE_1
    case 63:
        SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
        fun_HW_STATE_CHANGE_1(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
 
 
    #ifdef fun_HW_STATE_CHANGE_2
    case 64:
        SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
        fun_HW_STATE_CHANGE_2(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
    
    #ifdef fun_HW_STATE_CHANGE_3
    case 65:
        SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
        fun_HW_STATE_CHANGE_3(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
 
 
    #ifdef fun_HW_STATE_CHANGE_4
    case 66:
        SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
        fun_HW_STATE_CHANGE_4(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif

    #ifdef fun_HW_STATE_CHANGE_5
    case 67:
        SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
        fun_HW_STATE_CHANGE_5(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
 
 
    #ifdef fun_HW_STATE_CHANGE_6
    case 68:
        SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
        fun_HW_STATE_CHANGE_6(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
    
    
    #ifdef fun_HW_MESSAGE_SIGNALED_INTERRUPT_ROUTINE
    case 69:
        SDV_IRQL_ENTER(DIRQL);SDV_IRQL_PUSH(DIRQL);
        fun_HW_MESSAGE_SIGNALED_INTERRUPT_ROUTINE(sdv_DeviceExtension,sdv_MessageId);
    break;
    #endif
    
    
    #ifdef fun_SP_HW_TIMER_EX_1
    case 70:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_1(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_2
    case 71:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_2(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_3
    case 72:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_3(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_4
    case 73:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_4(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_5
    case 74:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_5(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_6
    case 75:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_6(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
        
    #ifdef fun_HW_WORKITEM_1
    case 76:
      Choice_Dispatch();
      fun_HW_WORKITEM_1(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_2
    case 77:
      Choice_Dispatch();
      fun_HW_WORKITEM_2(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_3
    case 78:
      Choice_Dispatch();
      fun_HW_WORKITEM_3(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_4
    case 79:
      Choice_Dispatch();
      fun_HW_WORKITEM_4(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_5
    case 80:
      Choice_Dispatch();
      fun_HW_WORKITEM_5(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_6
    case 81:
      Choice_Dispatch();
      fun_HW_WORKITEM_6(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_SP_POST_SCATTER_GATHER_EXECUTE
    case 82:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_POST_SCATTER_GATHER_EXECUTE(&sdv_CurrentMiniportDevice,&sdv_Irp,sdv_ScatterGatherList,sdv_Context);
    break;
    #endif
    
  } 
}

#endif



/* sp-harness-flat-irql.c end */

/* sp-harness-basic-lifecycle.c begin */

#define SDV_RUN_HW_DPC
#define SDV_RUN_HW_PASSIVE_INITIALIZE_ROUTINE

#define SDV_RUN_HW_TIMER

#if SDV_HARNESS==SDV_SP_HW_BASIC_LIFECYCLE

/*
1.	Call DriverEntry
2.	Call HwFindAdapter, check return status is SP_RETURN_FOUND
3.	Call HwInitialize, if StorPortEnablePassiveInitialization is called, then call that function. Both should return TRUE
4.	The setup for the adapter should be done.
5.	Call BuildIo with guarded Srb.
a.	If return Status is FALSE, check that the Srb has been completed by the end of the harness. There is a possibility BuildIo could queue up a Dpc to do that as well. Exit.
b.	If return Status is TRUE, call StartIo with the same Srb.
*/



#ifdef sdv_sp_changeIrql

KIRQL sdv_irql_enter = PASSIVE_LEVEL;

#define SDV_IRQL_ENTER(enter_irql) (sdv_irql_enter = enter_irql)

#else
#define SDV_IRQL_ENTER(enter_irql)


#endif
    

#define DIRQL 26
    

void Choice_Dispatch()
{
	int irql = SdvMakeChoice();
    switch(irql)
    {
    case 0:
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      break;
    case 1:
      SDV_IRQL_ENTER(APC_LEVEL);SDV_IRQL_PUSH(APC_LEVEL);
      break;
    default:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      break;
    }
}


void sdv_main ()
{
  
  ULONG ustatus;
  BOOLEAN returnvalue;
  int choice = SdvMakeChoice();
   

  #ifdef fun_SP_DriverEntry
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      __analysis_assume((hp_driver!=NULL)&&(hregistry_path!=NULL));
      ustatus=fun_SP_DriverEntry(hp_driver, hregistry_path);
      SdvAssume (NT_SUCCESS(ustatus));
  #endif
  
  
  #ifdef fun_SP_HW_FIND_ADAPTER
      SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
      __analysis_assume((sdv_ArgumentString!="dump=1")&&(sdv_ArgumentString!="ntldr=1"));
      Choice_Non_CrashMode();
      ustatus=fun_SP_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation, 
                             sdv_ArgumentString, sdv_ConfigInfo, sdv_Again);
      SdvAssume (SP_RETURN_FOUND==ustatus);
  #endif
  
  #ifdef fun_SP_HW_INITIALIZE
      SDV_IRQL_ENTER(DIRQL);SDV_IRQL_PUSH(DIRQL);
      returnvalue=fun_SP_HW_INITIALIZE(sdv_DeviceExtension);
      SdvAssume (returnvalue==TRUE);
  #endif
   
  
  switch (choice)
  {
    #ifdef fun_SP_HW_BUILDIO 
    case 1:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      #ifdef NO_SRB_WMI
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_WMI);
      #endif
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_DUMP_POINTERS);
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_FREE_DUMP_POINTERS);
      returnvalue=fun_SP_HW_BUILDIO(sdv_DeviceExtension, sdv_srb);
	  #ifdef fun_SP_HW_STARTIO
	  if(returnvalue)
	  {
		  SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
		  #ifdef NO_SRB_WMI
		  SdvAssume(sdv_srb->Function != SRB_FUNCTION_WMI);
		  #endif
		  SdvAssume(sdv_srb->Function != SRB_FUNCTION_DUMP_POINTERS);
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_FREE_DUMP_POINTERS);
		  fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
		  
	  }
      #endif
    break;
    #endif
    #ifdef fun_SP_HW_INTERRUPT
    case 4:
      SDV_IRQL_ENTER(DIRQL);SDV_IRQL_PUSH(DIRQL);
      fun_SP_HW_INTERRUPT(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_RESET_BUS
    case 9:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_RESET_BUS(sdv_DeviceExtension, sdv_PathId);
    break;
    #endif
           
    #ifdef fun_SP_HW_ADAPTER_CONTROL
    case 11:
      SDV_IRQL_PUSH(DIRQL);
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension,ScsiRestartAdapter, sdv_Param);
    break;
    
    case 63:
      SDV_IRQL_PUSH(DIRQL);
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension,ScsiStopAdapter, sdv_Param);
    break;
    
    case 64:
      SdvAssume(sdv_ControlType!=ScsiStopAdapter&&sdv_ControlType!=ScsiRestartAdapter);
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, sdv_ControlType, sdv_Param);
    break;
    
    #endif
  } 
}

#endif



/* sp-harness-basic-lifecycle.c end */

/* sp-harness-hw-startio.c begin */

#if SDV_HARNESS==SDV_SP_FLAT_HW_STARTIO_HARNESS

void sdv_is_half_duplex(){}

void sdv_main ()
{

  ULONG uret;
  int choice = SdvMakeChoice();
  sdv_srb->DataTransferLength = 10;
  
  
  #ifdef NO_SRB_WMI
		SdvAssume(sdv_srb->Function != SRB_FUNCTION_WMI);
  #endif
  SdvAssume(sdv_srb->Function != SRB_FUNCTION_DUMP_POINTERS);
  SdvAssume(sdv_srb->Function != SRB_FUNCTION_FREE_DUMP_POINTERS);
  switch (choice)
  {
    #ifdef fun_SP_HW_STARTIO  
    case 1:
    
    #ifdef SDV_SRB_FUNCTION_EXECUTE_SCSI
      sdv_srb->Function = SRB_FUNCTION_EXECUTE_SCSI;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    #endif
    break;
    
    case 2:
    
    #ifdef SDV_SRB_FUNCTION_IO_CONTROL
      sdv_srb->Function = SRB_FUNCTION_IO_CONTROL;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 3:
    
    #ifdef SDV_SRB_FUNCTION_RECEIVE_EVENT
      sdv_srb->Function = SRB_FUNCTION_RECEIVE_EVENT;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
    #endif
    break;
    
    case 4:
    
    #ifdef SDV_SRB_FUNCTION_RELEASE_QUEUE
      sdv_srb->Function = SRB_FUNCTION_RELEASE_QUEUE;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 5:
    
    #ifdef SDV_SRB_FUNCTION_ATTACH_DEVICE
      sdv_srb->Function = SRB_FUNCTION_ATTACH_DEVICE;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 6:
    
    #ifdef SDV_SRB_FUNCTION_RELEASE_DEVICE
      sdv_srb->Function = SRB_FUNCTION_RELEASE_DEVICE;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 7:
    
    #ifdef SDV_SRB_FUNCTION_SHUTDOWN
      sdv_srb->Function = SRB_FUNCTION_SHUTDOWN;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 8:
    
    #ifdef SDV_SRB_FUNCTION_FLUSH
      sdv_srb->Function = SRB_FUNCTION_FLUSH;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 9:
    
    #ifdef SDV_SRB_FUNCTION_ABORT_COMMAND
      sdv_srb->Function = SRB_FUNCTION_ABORT_COMMAND;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 10:
    
    #ifdef SDV_SRB_FUNCTION_RELEASE_RECOVERY
      sdv_srb->Function = SRB_FUNCTION_RELEASE_RECOVERY;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 11:
    
    #ifdef SDV_SRB_FUNCTION_RESET_BUS
      sdv_srb->Function = SRB_FUNCTION_RESET_BUS;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 12:
    
    #ifdef SDV_SRB_FUNCTION_RESET_DEVICE
      sdv_srb->Function = SRB_FUNCTION_RESET_DEVICE;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 13:
    
    #ifdef SDV_SRB_FUNCTION_TERMINATE_IO
      sdv_srb->Function = SRB_FUNCTION_TERMINATE_IO;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 14:
    
    #ifdef SDV_SRB_FUNCTION_FLUSH_QUEUE
      sdv_srb->Function = SRB_FUNCTION_FLUSH_QUEUE;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 15:
    
    #ifdef SDV_SRB_FUNCTION_REMOVE_DEVICE
      sdv_srb->Function = SRB_FUNCTION_REMOVE_DEVICE;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 16:
    
    #ifdef SDV_SRB_FUNCTION_LOCK_QUEUE
      sdv_srb->Function = SRB_FUNCTION_LOCK_QUEUE;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    
    case 17:
    
    #ifdef SDV_SRB_FUNCTION_UNLOCK_QUEUE
      sdv_srb->Function = SRB_FUNCTION_UNLOCK_QUEUE;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 18:
    
    #ifdef SDV_SRB_FUNCTION_RESET_LOGICAL_UNIT
      sdv_srb->Function = SRB_FUNCTION_RESET_LOGICAL_UNIT;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 19:
    
    #ifdef SDV_SRB_FUNCTION_SET_LINK_TIMEOUT
      sdv_srb->Function = SRB_FUNCTION_SET_LINK_TIMEOUT;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 20:
    
    #ifdef SDV_SRB_FUNCTION_LINK_TIMEOUT_OCCURRED
      sdv_srb->Function = SRB_FUNCTION_LINK_TIMEOUT_OCCURRED;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 21:
    
    #ifdef SDV_SRB_FUNCTION_LINK_TIMEOUT_COMPLETE
      sdv_srb->Function = SRB_FUNCTION_LINK_TIMEOUT_COMPLETE;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 22:
    
    #ifdef SDV_SRB_FUNCTION_POWER
      sdv_srb->Function = SRB_FUNCTION_POWER;
    
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 23:
    
    #ifdef SDV_SRB_FUNCTION_PNP
      sdv_srb->Function = SRB_FUNCTION_PNP;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    
    /*case 24:
    
    #ifdef SDV_SRB_FUNCTION_DUMP_POINTERS
      sdv_srb->Function = SRB_FUNCTION_EXECUTE_SCSI;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    case 25:
    
    #ifdef SDV_SRB_FUNCTION_DUMP_POINTERS
      sdv_srb->Function = SRB_FUNCTION_FREE_DUMP_POINTERS;
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
      
      
    #endif
    break;
    
    */
    
    #endif

    
  }
}

#endif
/* sp-harness-hw-startio.c end */

/* sp-harness-iflat.c begin */



#if (SDV_HARNESS==SDV_SP_IFLAT_HARNESS)


void sdv_main ()
{

  int choice = SdvMakeChoice();
  ULONG ustatus;

#ifdef fun_SP_HW_FIND_ADAPTER
    SdvAssume(sdv_ConfigInfo->VirtualDevice == FALSE);
    __analysis_assume((sdv_ArgumentString!="dump=1")&&(sdv_ArgumentString!="ntldr=1"));
    Choice_Non_CrashMode();
    ustatus=fun_SP_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation, 
                             sdv_ArgumentString, sdv_ConfigInfo, sdv_Again);
    sdv_CheckConfig(sdv_ConfigInfo);
	sdv_CheckVirtual(sdv_ConfigInfo);
	SdvAssume (SP_RETURN_FOUND==ustatus);
#endif
  
  
  switch (choice)
  {
    #if (SDV_HARNESS==SDV_SP_FLAT_HARNESS)
        #if defined(fun_SP_HW_INITIALIZE)
        case 0:
            fun_SP_HW_INITIALIZE(sdv_DeviceExtension);
         break;
        #endif
    #endif
      
#ifndef sp_createharness

    #ifdef fun_DriverEntry
    case 1:
      fun_DriverEntry(hp_driver, hregistry_path);
    break;
    #endif


    #ifdef fun_SP_DriverEntry 
    case 100:
      __analysis_assume((hp_driver!=NULL)&&(hregistry_path!=NULL));
      fun_SP_DriverEntry(hp_driver, hregistry_path);
    break;
    #endif


    #ifdef fun_SP_HW_BUILDIO 
    case 2:
#ifdef NO_SRB_WMI
		SdvAssume(sdv_srb->Function != SRB_FUNCTION_WMI);
#endif
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_DUMP_POINTERS);
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_FREE_DUMP_POINTERS);
      fun_SP_HW_BUILDIO(sdv_DeviceExtension, sdv_srb);
    break;
    #endif
    
    #ifdef fun_SP_HW_STARTIO  
    case 3:
#ifdef NO_SRB_WMI
		SdvAssume(sdv_srb->Function != SRB_FUNCTION_WMI);
#endif
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_DUMP_POINTERS);
      SdvAssume(sdv_srb->Function != SRB_FUNCTION_FREE_DUMP_POINTERS);
      fun_SP_HW_STARTIO(sdv_DeviceExtension, sdv_srb);
    break;
    #endif
    
    #ifdef fun_SP_HW_INTERRUPT
    case 4:
      fun_SP_HW_INTERRUPT(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_1
    case 5:
      fun_SP_HW_TIMER_1(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_2
    case 63:
      fun_SP_HW_TIMER_2(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_3
    case 64:
      fun_SP_HW_TIMER_3(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_4
    case 65:
      fun_SP_HW_TIMER_4(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_5
    case 66:
      fun_SP_HW_TIMER_5(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_TIMER_6
    case 67:
      fun_SP_HW_TIMER_6(sdv_DeviceExtension);
    break;
    #endif
    #ifdef fun_SP_HW_DMA_STARTED
    case 7:
      fun_SP_HW_DMA_STARTED(sdv_DeviceExtension);
    break;
    #endif

    #ifdef fun_SP_HW_RESET_BUS
    case 9:
      fun_SP_HW_RESET_BUS(sdv_DeviceExtension, sdv_PathId);
    break;
    #endif
    
    #ifdef fun_SP_HW_ADAPTER_STATE
    case 10:
      fun_SP_HW_ADAPTER_STATE(sdv_DeviceExtension, sdv_Context, sdv_SaveState);
    break;
    #endif
    
    #ifdef fun_SP_HW_ADAPTER_CONTROL
    case 11:
      fun_SP_HW_ADAPTER_CONTROL(sdv_DeviceExtension, sdv_ControlType, sdv_Param);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_1
    case 12:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_1(sdv_DeviceExtension);
    break;
    #endif

    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_2
    case 13:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_2(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_3
    case 14:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_3(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_4
    case 15:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_4(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_5
    case 16:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_5(sdv_DeviceExtension);
    break;
    #endif
    
    #ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_6
    case 17:
      fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_6(sdv_DeviceExtension);
    break;
    #endif
#ifndef NO_fun_SP_HW_DPC_ROUTINE  
    #ifdef fun_SP_HW_DPC_ROUTINE_1
    case 18:
      fun_SP_HW_DPC_ROUTINE_1(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif  
    
    #ifdef fun_SP_HW_DPC_ROUTINE_2
    case 19:
      fun_SP_HW_DPC_ROUTINE_2(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_3
    case 20:
      fun_SP_HW_DPC_ROUTINE_3(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_4
    case 21:
      fun_SP_HW_DPC_ROUTINE_4(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_5
    case 22:
      fun_SP_HW_DPC_ROUTINE_5(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_DPC_ROUTINE_6
    case 23:
      fun_SP_HW_DPC_ROUTINE_6(sdv_Dpc, sdv_HwDeviceExtension, sdv_SysArg, sdv_SysArg2);
    break;
    #endif 
#endif
 

    #ifdef fun_SP_HW_FREE_ADAPTER_RESOURCES
    case 24:
      fun_SP_HW_FREE_ADAPTER_RESOURCES(sdv_DeviceExtension);
    break;
    #endif 
    
    #ifdef fun_SP_HW_PROCESS_SERVICE_REQUEST
    case 25:
      fun_SP_HW_PROCESS_SERVICE_REQUEST(sdv_DeviceExtension, sdv_Irp);
    break;
    #endif 
    
    #ifdef fun_SP_HW_COMPLETE_SERVICE_IRP
    case 26:
      fun_SP_HW_COMPLETE_SERVICE_IRP(sdv_DeviceExtension);
    break;
    #endif 
    
    #ifdef fun_SP_HW_INITIALIZE_TRACING
    case 27:
      fun_SP_HW_INITIALIZE_TRACING(sdv_Arg, sdv_Arg2);
    break;
    #endif 
    
    #ifdef fun_SP_HW_CLEANUP_TRACING
    case 28:
      fun_SP_HW_CLEANUP_TRACING(sdv_Arg);
    break;
    #endif 
    
    #ifdef fun_SP_VIRTUAL_HW_FIND_ADAPTER
    case 29:
		fun_SP_VIRTUAL_HW_FIND_ADAPTER(sdv_DeviceExtension, sdv_HwContext, sdv_BusInformation, sdv_LowerDevice, 
                                      sdv_ArgumentString, sdv_ConfigInfo, sdv_Again);
		sdv_CheckConfig(sdv_ConfigInfo);
		sdv_CheckVirtual(sdv_ConfigInfo);	
    break;
    #endif 
    
#ifndef NO_fun_DRIVER_CANCEL    
    #ifdef fun_DRIVER_CANCEL_1
    case 44:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_1(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_2
    case 45:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_2(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_3
    case 46:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_3(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_4
    case 47:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_4(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_5
    case 48:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_5(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_6
    case 49:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_6(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif
    
    #ifdef fun_DRIVER_CANCEL_7
    case 50:     
       
       SDV_MACRO_STUB_CANCEL_BEGIN(sdv_irp);
		   fun_DRIVER_CANCEL_7(sdv_p_devobj_fdo, sdv_irp);
		   SDV_MACRO_STUB_CANCEL_END(sdv_irp);
    break;
    #endif

#endif

#ifndef NO_fun_IO_COMPLETION 
    
    #ifdef fun_IO_COMPLETION_ROUTINE_1
    case 51:
        
        fun_IO_COMPLETION_ROUTINE_1(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif

    #ifdef fun_IO_COMPLETION_ROUTINE_2
    case 52:
        
        fun_IO_COMPLETION_ROUTINE_2(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_3
    case 53:
        
        fun_IO_COMPLETION_ROUTINE_3(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_4
    case 54:
        
        fun_IO_COMPLETION_ROUTINE_4(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_5
    case 55:
        
        fun_IO_COMPLETION_ROUTINE_5(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_6
    case 56:
        
        fun_IO_COMPLETION_ROUTINE_6(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_7
    case 57:
        
        fun_IO_COMPLETION_ROUTINE_7(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_8
    case 58:
        
        fun_IO_COMPLETION_ROUTINE_8(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_9
    case 59:
        
        fun_IO_COMPLETION_ROUTINE_9(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_10
    case 60:
        
        fun_IO_COMPLETION_ROUTINE_10(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_11
    case 61:
        
        fun_IO_COMPLETION_ROUTINE_11(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif
    
    #ifdef fun_IO_COMPLETION_ROUTINE_12
    case 62:
        
        fun_IO_COMPLETION_ROUTINE_12(sdv_p_devobj_fdo,sdv_irp,sdv_pv2);  
	  break;
    #endif

#endif
#endif
    
    #ifdef fun_HW_STATE_CHANGE_1
    case 63:
        fun_HW_STATE_CHANGE_1(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
 
 
    #ifdef fun_HW_STATE_CHANGE_2
    case 64:
        fun_HW_STATE_CHANGE_2(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
    
    #ifdef fun_HW_STATE_CHANGE_3
    case 65:
        fun_HW_STATE_CHANGE_3(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
 
 
    #ifdef fun_HW_STATE_CHANGE_4
    case 66:
        fun_HW_STATE_CHANGE_4(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif

    #ifdef fun_HW_STATE_CHANGE_5
    case 67:
        fun_HW_STATE_CHANGE_5(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
 
 
    #ifdef fun_HW_STATE_CHANGE_6
    case 68:
        fun_HW_STATE_CHANGE_6(sdv_DeviceExtension,sdv_HwContext,sdv_HwAddressType,sdv_HwAddress,sdv_hwstatus);
    break;
    #endif
    
    #ifdef fun_HW_MESSAGE_SIGNALED_INTERRUPT_ROUTINE
    case 69:
        fun_HW_MESSAGE_SIGNALED_INTERRUPT_ROUTINE(sdv_DeviceExtension,sdv_MessageId);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_1
    case 70:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_1(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_2
    case 71:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_2(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_3
    case 72:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_3(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_4
    case 73:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_4(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_5
    case 74:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_5(sdv_DeviceExtension,sdv_Context);
    break;
    #endif
    
    #ifdef fun_SP_HW_TIMER_EX_6
    case 75:
      SDV_IRQL_ENTER(DISPATCH_LEVEL);SDV_IRQL_PUSH(DISPATCH_LEVEL);
      fun_SP_HW_TIMER_EX_6(sdv_DeviceExtension,sdv_Context);
    break;
    #endif

    #ifdef fun_HW_WORKITEM_1
    case 76:
      
      fun_HW_WORKITEM_1(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_2
    case 77:
      
      fun_HW_WORKITEM_2(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_3
    case 78:
      
      fun_HW_WORKITEM_3(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_4
    case 79
      
      fun_HW_WORKITEM_4(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_5
    case 80:
      
      fun_HW_WORKITEM_5(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_HW_WORKITEM_6
    case 81:
      
      fun_HW_WORKITEM_6(sdv_DeviceExtension,sdv_Context,sdv_Worker);
    break;
    #endif
    
    #ifdef fun_SP_POST_SCATTER_GATHER_EXECUTE
    case 83:
      fun_SP_POST_SCATTER_GATHER_EXECUTE(&sdv_CurrentMiniportDevice,&sdv_Irp,sdv_ScatterGatherList,sdv_Context);
    break;
    #endif
    
  } 
}
#endif
/* sp-harness-iflat.c end */

/* sp_sdv_stubs.c begin */
/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/


#ifndef DIRQL
#define DIRQL 26
#endif


VOID Choice_Non_CrashMode()
{
#if (NTDDI_VERSION>=NTDDI_WIN8)
    sdv_ConfigInfo->DumpMode=0;
#endif
}


void __cdecl main() 
{
    sdv_main();
}

void sdv_do_paged_code_check() { }



ULONG
sdv_StorPortInitialize(
    IN PVOID Argument1,
    IN PVOID Argument2,
    IN struct _HW_INITIALIZATION_DATA *HwInitializationData,
    IN PVOID HwContext
    )
{
    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return STATUS_UNSUCCESSFUL;
          break;
        case 1: 
          return STATUS_INVALID_PARAMETER;
          break;
        case 2: 
          return STATUS_REVISION_MISMATCH;
          break;
        case 3: 
          return STATUS_NO_MEMORY;
          break;
        default: 
          return STOR_STATUS_SUCCESS;  
          break;
    }  
}

STORPORT_API
VOID
sdv_StorPortFreeDeviceBase(
    IN PVOID HwDeviceExtension,
    IN PVOID MappedAddress
    ){}



STORPORT_API
ULONG
sdv_StorPortGetBusData(
    IN PVOID DeviceExtension,
    IN ULONG BusDataType,
    IN ULONG SystemIoBusNumber,
    IN ULONG SlotNumber,
    IN PVOID Buffer,
    IN ULONG Length
    )
{
    LONG x = SdvMakeChoice();
    LONG bytes_config = SdvKeepChoice();
    if(BusDataType==PCIConfiguration)
    {
     switch (x) 
     { 
        case 0: 
          return 0;
          break;
        case 1:
          return (ULONG) bytes_config;
          break;
        default: 
          return 2;  
          break;
      }  
    }
    else
    {
      return (ULONG) bytes_config;
    }
}

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
    )
{
    return (ULONG) SdvKeepChoice();
}

STORPORT_API
PVOID
sdv_StorPortGetDeviceBase(
    IN PVOID HwDeviceExtension,
    IN INTERFACE_TYPE BusType,
    IN ULONG SystemIoBusNumber,
    IN STOR_PHYSICAL_ADDRESS IoAddress,
    IN ULONG NumberOfBytes,
    IN BOOLEAN InIoSpace
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return (PVOID) malloc(1);break;
        default: return NULL;break;
    }  
}

STORPORT_API
PVOID
sdv_StorPortGetLogicalUnit(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return (PVOID) malloc(1);break;
        default: return NULL;break;
    }  
}

STORPORT_API
PSTOR_SCATTER_GATHER_LIST
sdv_StorPortGetScatterGatherList(
    IN PVOID HwDeviceExtension,
    IN PSCSI_REQUEST_BLOCK Srb
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return (PSTOR_SCATTER_GATHER_LIST) malloc(1);break;
        default: return NULL;break;
    }  
}

STORPORT_API
STOR_PHYSICAL_ADDRESS
sdv_StorPortGetPhysicalAddress(
    IN PVOID HwDeviceExtension,
    IN PSCSI_REQUEST_BLOCK Srb,
    IN PVOID VirtualAddress,
    OUT ULONG *Length
    )
{
    STOR_PHYSICAL_ADDRESS *y;
    LONG choice = SdvMakeChoice();
    ULONG x = (ULONG)SdvKeepChoice();
    switch (choice) 
    {
        case 0: 
            *Length = x;
            y = malloc(1);
            return *y;
            break;
        default: 
            *Length = 0;
            y = malloc(1);
            y->QuadPart = 0;
            return *y; 
            break;
    }
}

STORPORT_API
PVOID
sdv_StorPortGetVirtualAddress(
    IN PVOID HwDeviceExtension,
    IN STOR_PHYSICAL_ADDRESS PhysicalAddress
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return (PVOID) malloc(1);break;
        default: return NULL;break;
    }  
}

STORPORT_API
PVOID
sdv_StorPortGetUncachedExtension(
    IN PVOID HwDeviceExtension,
    IN PPORT_CONFIGURATION_INFORMATION ConfigInfo,
    IN ULONG NumberOfBytes
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return (PVOID) malloc(1);break;
        default: return NULL;break;
    }  
}

STORPORT_API
BOOLEAN
sdv_StorPortPauseDevice(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun,
    IN ULONG Timeout
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

STORPORT_API
BOOLEAN
sdv_StorPortResumeDevice(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

STORPORT_API
BOOLEAN
sdv_StorPortPause(
    IN PVOID HwDeviceExtension,
    IN ULONG Timeout
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

STORPORT_API
BOOLEAN
sdv_StorPortResume(
    IN PVOID HwDeviceExtension
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

STORPORT_API
BOOLEAN
sdv_StorPortDeviceBusy(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun,
    IN ULONG RequestsToComplete
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

STORPORT_API
BOOLEAN
sdv_StorPortDeviceReady(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

STORPORT_API
BOOLEAN
sdv_StorPortBusy(
    IN PVOID HwDeviceExtension,
    IN ULONG RequestsToComplete
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

STORPORT_API
BOOLEAN
sdv_StorPortReady(
    IN PVOID HwDeviceExtension
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

STORPORT_API
BOOLEAN
sdv_StorPortSetDeviceQueueDepth(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun,
    IN ULONG Depth
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}




VOID StorPortNotification(
    IN SCSI_NOTIFICATION_TYPE NotificationType,
    IN PVOID HwDeviceExtension,
    PVOID Src_pvoid,
    ...
)

{
   PSCSI_REQUEST_BLOCK Srb;
   PHW_TIMER HwTimerRoutine;

   if(NotificationType==RequestComplete)
   {
       Srb=(PSCSI_REQUEST_BLOCK)Src_pvoid;
       sdv_SrbStatusPending( Srb );
       #ifdef STORPORTNOTIFICATION_DATALENGTH_CHECK
           sdv_SrbStatusSuccess(Srb);
	   sdv_SrbDataLengthTheSame(Srb);
       #endif
    }
    else if(NotificationType==RequestTimerCall)
    {
       if(Src_pvoid!=NULL)
       {
	         HwTimerRoutine=(PHW_TIMER)Src_pvoid;
#if SDV_IS_LIFECYCLE_HARNESS()
           run_HwTimerRoutines(HwDeviceExtension,HwTimerRoutine);
#endif
           sdv_CheckTimer();
       }
    }
}


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
    ){}

STORPORT_API
VOID
sdv_StorPortCompleteRequest(
    IN PVOID HwDeviceExtension,
    IN UCHAR PathId,
    IN UCHAR TargetId,
    IN UCHAR Lun,
    IN UCHAR SrbStatus
    ){}

STORPORT_API
VOID
sdv_StorPortStallExecution(
    IN ULONG Delay
    ){}

STORPORT_API
BOOLEAN
sdv_StorPortSynchronizeAccess(
    IN PVOID HwDeviceExtension,
    IN PSTOR_SYNCHRONIZED_ACCESS SynchronizedAccessRoutine,
    IN PVOID Context
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

STORPORT_API
UCHAR
sdv_StorPortReadPortUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Port
    )
{
    return (UCHAR) SdvKeepChoice();
}

STORPORT_API
USHORT
sdv_StorPortReadPortUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Port
    )
{
    return (USHORT) SdvKeepChoice();
}

STORPORT_API
ULONG
sdv_StorPortReadPortUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Port
    )
{
    return (ULONG) SdvKeepChoice();
}

STORPORT_API
VOID
sdv_StorPortReadPortBufferUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Port,
    IN PUCHAR Buffer,
    IN ULONG  Count
    ){}

STORPORT_API
VOID
sdv_StorPortReadPortBufferUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Port,
    IN PUSHORT Buffer,
    IN ULONG Count
    ){}

STORPORT_API
VOID
sdv_StorPortReadPortBufferUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Port,
    IN PULONG Buffer,
    IN ULONG Count
    ){}

STORPORT_API
UCHAR
sdv_StorPortReadRegisterUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Register
    )
{
    return (UCHAR) SdvKeepChoice();
}

STORPORT_API
USHORT
sdv_StorPortReadRegisterUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Register
    )
{
    return (USHORT) SdvKeepChoice();
}

STORPORT_API
ULONG
sdv_StorPortReadRegisterUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Register
    )
{
    return (ULONG) SdvKeepChoice();
}

STORPORT_API
VOID
sdv_StorPortReadRegisterBufferUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Register,
    IN PUCHAR Buffer,
    IN ULONG  Count
    ){}

STORPORT_API
VOID
sdv_StorPortReadRegisterBufferUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Register,
    IN PUSHORT Buffer,
    IN ULONG Count
    ){}

STORPORT_API
VOID
sdv_StorPortReadRegisterBufferUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Register,
    IN PULONG Buffer,
    IN ULONG Count
    ){}

STORPORT_API
VOID
sdv_StorPortWritePortUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Port,
    IN UCHAR Value
    ){}

STORPORT_API
VOID
sdv_StorPortWritePortUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Port,
    IN USHORT Value
    ){}

STORPORT_API
VOID
sdv_StorPortWritePortUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Port,
    IN ULONG Value
    ){}

STORPORT_API
VOID
sdv_StorPortWritePortBufferUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Port,
    IN PUCHAR Buffer,
    IN ULONG  Count
    ){}

STORPORT_API
VOID
sdv_StorPortWritePortBufferUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Port,
    IN PUSHORT Buffer,
    IN ULONG Count
    ){}

STORPORT_API
VOID
sdv_StorPortWritePortBufferUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Port,
    IN PULONG Buffer,
    IN ULONG Count
    ){}

STORPORT_API
VOID
sdv_StorPortWriteRegisterUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Register,
    IN UCHAR Value
    ){}

STORPORT_API
VOID
sdv_StorPortWriteRegisterUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Register,
    IN USHORT Value
    ){}

STORPORT_API
VOID
sdv_StorPortWriteRegisterUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Register,
    IN ULONG Value
    ){}

STORPORT_API
VOID
sdv_StorPortWriteRegisterBufferUchar(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Register,
    IN PUCHAR Buffer,
    IN ULONG  Count
    ){}

STORPORT_API
VOID
sdv_StorPortWriteRegisterBufferUshort(
    IN PVOID HwDeviceExtension,
    IN PUSHORT Register,
    IN PUSHORT Buffer,
    IN ULONG Count
    ){}

STORPORT_API
VOID
sdv_StorPortWriteRegisterBufferUlong(
    IN PVOID HwDeviceExtension,
    IN PULONG Register,
    IN PULONG Buffer,
    IN ULONG Count
    ){}

STORPORT_API
VOID
sdv_StorPortMoveMemory(
    IN PVOID WriteBuffer,
    IN PVOID ReadBuffer,
    IN ULONG Length
    ){}

STOR_PHYSICAL_ADDRESS sdv_StorPortConvertUlongToPhysicalAddress_retVal;
STORPORT_API
STOR_PHYSICAL_ADDRESS
sdv_StorPortConvertUlongToPhysicalAddress(
    ULONG_PTR UlongAddress
    )
{
    return sdv_StorPortConvertUlongToPhysicalAddress_retVal;  
}

STORPORT_API
ULONG
sdv_StorPortConvertPhysicalAddressToUlong(
    STOR_PHYSICAL_ADDRESS Address
    )
{
    return (ULONG) SdvKeepChoice();
}

STORPORT_API
VOID
sdv_StorPortQuerySystemTime(
    OUT PLARGE_INTEGER CurrentTime
    )
{
     PLARGE_INTEGER x = malloc(1); 
     *CurrentTime = *x;
}

STORPORT_API
PUCHAR
sdv_StorPortAllocateRegistryBuffer(
    IN PVOID HwDeviceExtension,
    IN PULONG Length
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0:
          return (PUCHAR) malloc(1);
          break;
        default:
          return NULL;
          break;
    }  
}


STORPORT_API
VOID
sdv_StorPortFreeRegistryBuffer(
    IN PVOID HwDeviceExtension,
    IN PUCHAR Buffer
    ){}

BOOLEAN
sdv_StorPortRegistryRead(
    IN PVOID HwDeviceExtension,
    IN PUCHAR ValueName,
    IN ULONG Global,
    IN ULONG Type,
    IN PUCHAR Buffer,
    IN PULONG BufferLength
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

STORPORT_API
BOOLEAN
sdv_StorPortRegistryWrite(
    IN PVOID HwDeviceExtension,
    IN PUCHAR ValueName,
    IN ULONG Global,
    IN ULONG Type,
    IN PUCHAR Buffer,
    IN ULONG BufferLength
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

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
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: return TRUE;break;
        default: return FALSE;break;
    }  
}

STORPORT_API
VOID
sdv_StorPortDebugPrint(
    ULONG DebugPrintLevel,
    PCCHAR DebugMessage,
    ...
    ){}
    



ULONG32
sdv_ComputeCRC32(
    PUCHAR Buffer,
    PUCHAR PaddingBuffer,
    ULONG  Length
    ){
    return (ULONG32)SdvKeepChoice();     
}


VOID
sdv_SaveSystemProcess(
    VOID
    ){}


VOID
sdv_AttachToSystemProcess(
    VOID
    ){}


VOID
sdv_DetachFromSystemProcess(
    VOID
    ){}



USHORT 
sdv_AsciiStringToWideCharString(
    __out_ecount(MaxChars) PWCHAR Dest,
    __in  PUCHAR Src,
    IN  USHORT MaxChars
    )
{
    LONG choice = SdvMakeChoice();
    WCHAR x = (WCHAR)SdvKeepChoice();
    if ((Src == NULL) || (Dest == NULL)) 
    {
        return 0;
    }
    else
    {
      switch(choice) 
      {
          case 0:
              *Dest = (WCHAR)0;
              return 0;
              break;
          default:
              *Dest = x;
              return (USHORT)SdvKeepChoice(); 
              break;
      }
    }
    
}



USHORT
sdv_WideCharStringToAsciiString(
    __out_ecount(MaxChars) PUCHAR Dest,
    __in  PWCHAR Src,
    IN  USHORT MaxChars
    )
{
    LONG choice = SdvMakeChoice();
    WCHAR x = (WCHAR)SdvKeepChoice();
    if ((Src == NULL) || (Dest == NULL)) 
    {
        return 0;
    }
    else
    {
      switch(choice) 
      {
          case 0:
              *Dest = (WCHAR)0;
              return 0;
              break;
          default:
              *Dest = x;
              return (USHORT)SdvKeepChoice(); 
              break;
      }
    }
}


ULONG 
sdv_WCharArrayToUTF8Array(
    __out_ecount(MaxChars) PUCHAR Dest,
    __in  PWSTR Src,
    IN  LONG  MaxChars
    )
{
    UCHAR x = (UCHAR)SdvKeepChoice();
    if ((Src == UNICODE_NULL)) 
    {
        return 0;
    }
    else
    {
        *Dest = x;
        return (ULONG)SdvKeepChoice(); 
    }
}


ULONG 
sdv_WCharToUTF8(
    __in  WCHAR  WChar,
    __out_ecount(BufferSize) PUCHAR UTF8Array,
    IN  ULONG  BufferSize
    )
{
    UCHAR x = (UCHAR)SdvKeepChoice();
     if ((WChar == UNICODE_NULL)) 
    {
        return 0;
    }
    else
    {
        *UTF8Array = x;
        return (ULONG)SdvKeepChoice(); 
    }
    
}


BOOLEAN
sdv_GetValueForKey(
    __in_ecount(Length) PUCHAR KeyValuePairs,
    IN LONG Length,
    __in PSTR SearchKey,
    __out PUCHAR *Value
    )
{
    LONG choice = SdvMakeChoice();
    UCHAR x = (UCHAR)SdvKeepChoice();
    switch (choice) 
    {
        case 0: 
          *Value = x;
          return TRUE;
        break;
        default: 
          *Value = NULL;
          return FALSE;
        break;
    }      
}


BOOLEAN
sdv_IsSearchKey(
    __in PSTR KeyValuePairs,
    __in PSTR SearchKey,
    __out PUCHAR *Value
    )
{
    UCHAR x = (UCHAR)SdvKeepChoice();
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: 
          *Value = x;
          return TRUE;
        break;
        default: 
          *Value = NULL;
          return FALSE;
        break;
    }      
}


BOOLEAN
sdv_CompareKeys(
    __in PUCHAR KeyValuePairs,
    __in PUCHAR SearchKey,
    __out PUCHAR *Value
    )
{
    LONG choice = SdvMakeChoice();
    UCHAR x = (UCHAR)SdvKeepChoice();
    switch (choice) 
    {
        case 0: 
          *Value = x;
          return TRUE;
        break;
        default: 
          *Value = NULL;
          return FALSE;
        break;
    }      
}


PUCHAR 
sdv_GetNextValueFromList(
    __in PSTR ValueList,
    __out_ecount(RetBuffSize) PUCHAR RetBuff,
    LONG RetBuffSize
    )
{
    UCHAR x = (UCHAR)SdvKeepChoice();
    *RetBuff = x;
    return (PUCHAR)malloc(1); 
}

/*ISCSI_TRANSPORT_ADDRESS sdv_GetAddressAndPortNumber_IScsiAddress;
NTSTATUS
sdv_GetAddressAndPortNumber(
    __in PUCHAR AddressBuffer,
    IN ULONG  AddressBufferSize,
    OUT PISCSI_TRANSPORT_ADDRESS IScsiAddress
    )
{    
    LONG x = SdvMakeChoice();
    *IScsiAddress = sdv_GetAddressAndPortNumber_IScsiAddress;
    switch (x) 
    { 
        case 0: 
          return STATUS_UNSUCCESSFUL;
          break;
        default: 
          return STOR_STATUS_SUCCESS;  
          break;
    }
}  

CHAP_ENCODING sdv_GetCHAPChallenge_CHAPEncoding;
BOOLEAN
sdv_GetCHAPChallenge(
    __in_ecount(BinStringLen) PUCHAR BinString,
    __in ULONG  BinStringLen,
    __out_ecount(*ChallengeLength) PUCHAR Challenge,
    IN OUT PULONG ChallengeLength,
    OUT    PCHAP_ENCODING CHAPEncoding
    )
{
    LONG choice = SdvMakeChoice();
    *Challenge = (UCHAR)SdvKeepChoice();
    *ChallengeLength = (ULONG)SdvKeepChoice();
    *CHAPEncoding = sdv_GetCHAPChallenge_CHAPEncoding;
    switch (choice) 
    {
        case 0: 
          return TRUE;
        break;
        default: 
          return FALSE;
        break;
    }      
}


BOOLEAN
sdv_GetCHAPResponse(
    __in_ecount(BinStringLen) PUCHAR BinString,
    __in ULONG  BinStringLen,
    __out_ecount(*ResponseLength) PUCHAR Response,
    IN OUT PULONG ResponseLength
    )
{
    LONG choice = SdvMakeChoice();
    *ResponseLength = (UCHAR)SdvKeepChoice();
    *ResponseLength = (ULONG)SdvKeepChoice();
    switch (choice) 
    {
        case 0: 
          return TRUE;
        break;
        default: 
          return FALSE;
        break;
    }      
}
*/

BOOLEAN
sdv_DecodeHexString(
    __in_ecount(BinStringLen) PUCHAR BinString,
    __in ULONG  BinStringLen,
    __out_ecount(HexStringLen) PUCHAR HexString,
    ULONG  HexStringLen,
    PULONG ByteCount
    )
{
    LONG choice = SdvMakeChoice();
    UCHAR x = (UCHAR)SdvKeepChoice();
    *HexString = x;
    switch (choice) 
    {
        case 0: 
          return TRUE;
        break;
        default: 
          return FALSE;
        break;
    }      
}


BOOLEAN
sdv_DecodeB64String(
    __in_ecount(BinStringLen) PUCHAR BinString,
    __in ULONG  BinStringLen,
    __out_ecount(Base64StringLen) PUCHAR Base64String,
    ULONG  Base64StringLen,
    PULONG ByteCount
    )
{
    LONG choice = SdvMakeChoice();
    UCHAR x = (UCHAR)SdvKeepChoice();
    *Base64String = x;
    switch (choice) 
    {
        case 0: 
          return TRUE;
        break;
        default: 
          return FALSE;
        break;
    }      
}


VOID
sdv_ConvertToHexString(
    __in_ecount(InputStringLen) PUCHAR InputString,
    __in ULONG  InputStringLen,
    __out_ecount(BinaryStringLen) PUCHAR BinaryString,
    ULONG  BinaryStringLen,
    PULONG OutputLen
    )
{
    LONG choice = SdvMakeChoice();
    ULONG x = (ULONG)SdvKeepChoice();
    UCHAR y = (UCHAR)SdvKeepChoice();
    if (BinaryStringLen == 0 || BinaryString == NULL)
    {
        *OutputLen = 0;
        return;
    }

    if (InputStringLen == 0 || 
        InputString == NULL ||
        BinaryStringLen < 3)
    {
        *OutputLen = 0;
        *BinaryString = '\0';  
        return;
    }
    switch (choice) 
    {
        case 0: 
          *OutputLen = 0;
          *BinaryString = '\0';  
        break;
        default: 
          *OutputLen=x;
          *BinaryString = y;
        break;
    }     
    
}
    

VOID
sdv_ConvertToBase64String(
    __in_ecount(InputStringLen) PUCHAR InputString,
    __in ULONG  InputStringLen,
    __out_ecount(BinaryStringLen) PUCHAR BinaryString,
    ULONG  BinaryStringLen,
    PULONG OutputLen
    )
{
    LONG choice = SdvMakeChoice();
    ULONG x = (ULONG)SdvKeepChoice();
    UCHAR y = (UCHAR)SdvKeepChoice();
    if (BinaryStringLen == 0 || BinaryString == NULL)
    {
        *OutputLen = 0;
        return;
    }

    if (InputStringLen == 0 || 
        InputString == NULL ||
        BinaryStringLen < 3)
    {
        *OutputLen = 0;
        *BinaryString = '\0';  
        return;
    }
    switch (choice) 
    {
        case 0: 
          *OutputLen = 0;
          *BinaryString = '\0';  
        break;
        default: 
          *OutputLen = x;
          *BinaryString = y;
        break;
    }     
}


BOOLEAN
sdv_GetBinaryForAscii(
    __in UCHAR HexChar,
    __out PUCHAR OutChar
    )
{
    LONG choice = SdvMakeChoice();
    UCHAR x = (UCHAR)SdvKeepChoice();
    switch (choice) 
    {
        case 0: 
          *OutChar = NULL;
          return FALSE;
        break;
        default: 
          *OutChar = x;
          return TRUE;
        break;
    }     
}



UCHAR
sdv_GetAsciiForBinary(
    UCHAR BinaryChar
    )
{
    return (UCHAR)SdvKeepChoice();
}



VOID
sdv_AsciiStringToBinary(
    __in IN PSTR AscsiiString,
    __out_ecount(*BinaryStringLen) PUCHAR BinaryString,
    OUT PULONG BinaryStringLen
    )
{
    UCHAR x = (UCHAR)SdvKeepChoice();
    ULONG y = (ULONG)SdvKeepChoice();
    *BinaryString = x;
    *BinaryStringLen = y;
}


UCHAR 
sdv_GetB64Value(
    UCHAR EncodedChar
    )
{
    return (UCHAR)SdvKeepChoice();
}



NTSTATUS
sdv_AllocateMdlAndIrp(
    IN PVOID Buffer,
    IN ULONG BufferLen,
    IN CCHAR StackSize,
    IN BOOLEAN NonPagedPool,
    OUT PIRP *Irp,
    OUT PMDL *Mdl
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: 
          *Irp = NULL;
          *Mdl = NULL;
          return STATUS_INSUFFICIENT_RESOURCES;
        break;
        default: 
          *Irp = (PIRP)malloc(1);
          *Mdl = (PMDL)malloc(1);
          return STOR_STATUS_SUCCESS;
        break;
    }     
    
}



VOID
sdv_FreeMdlAndIrp(
    IN PMDL Mdl,
    IN PIRP Irp,
    BOOLEAN UnlockPages
    )
{

    if (Irp == NULL) {
        return;
    }
}


/*ULONG
sdv_GetAuthMethodValue(
    IN ISCSI_AUTH_METHOD AuthMethod,
    __out PUCHAR *AuthMethodValue
    )
{
    *AuthMethodValue = (UCHAR)SdvKeepChoice();
    return (ULONG)SdvKeepChoice();
}*/


ULONG
sdv_GetDigestTypeValue(
    IN ULONG DigestType,
    __out PUCHAR *DigestTypeValue
    )
{
    UCHAR x = (UCHAR)SdvKeepChoice();
    *DigestTypeValue = x;
    return (ULONG)SdvKeepChoice();
}


PUCHAR
sdv_GetDecimalValue(
    IN ULONG  Value,
    IN ULONG  ValueBufferSize,
    __out_ecount(ValueBufferSize) PUCHAR ValueBuffer,
    OUT PULONG OutBufferSize
    )
{
    if (OutBufferSize)
    {
        *OutBufferSize = 0;
        *ValueBuffer = 0;
        return NULL;
    }
    else
    {
        UCHAR x = (UCHAR)SdvKeepChoice();
        ULONG y = (ULONG)SdvKeepChoice();
        *ValueBuffer = x;
        *OutBufferSize = y;
        return (PUCHAR)malloc(1);
    }
}




PUCHAR
sdv_GetBooleanValue(
    IN ULONG  Value,
    IN ULONG  ValueBufferSize,
    __out_ecount(ValueBufferSize) PUCHAR ValueBuffer,
    OUT PULONG OutBufferSize
    )
{

    if (OutBufferSize)
    {
        *OutBufferSize = 0;
        *ValueBuffer = NULL;
        return NULL;
    }
    else
    {
        UCHAR x = (UCHAR)SdvKeepChoice();
        ULONG y = (ULONG)SdvKeepChoice();
        *ValueBuffer = x;
        *OutBufferSize = y;
        return (PUCHAR)malloc(1);
    }
    
}


ULONG
sdv_StringToNumeral(
    __in PSTR Buffer
    )
{
    return (ULONG)SdvKeepChoice();
}


/*VOID
sdv_InitializeQueue(
    IN PREQUEST_QUEUE_ELEMENT RequestQueueElement,
    IN PKERNEL_REQUEST_CALLBACK CallBackRoutine,
    IN PVOID RequestContext
    ){}


PIRP
sdv_CleanupQueue(
    IN PREQUEST_QUEUE_ELEMENT RequestQueueElement
    )
{
    return (PIRP)malloc(1);
}



NTSTATUS
sdv_ProcessKernelRequest(
    IN PREQUEST_QUEUE_ELEMENT RequestQueueElement,
    IN PITARGET_REQUEST_PACKET RequestPacket
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: 
          return STATUS_PENDING;
        break;
        default: 
          return STOR_STATUS_SUCCESS;
        break;
    }     
}


VOID
sdv_ProcessQueuedRequests(
    IN PREQUEST_QUEUE_ELEMENT RequestQueueElement,
    IN PIRP TargetServiceIrp
    ){}


BOOLEAN
RemoveQueuedRequest(
    IN PREQUEST_QUEUE_ELEMENT RequestQueueElement,
    IN PITARGET_REQUEST_PACKET RequestPacket
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0: 
          return TRUE;
        break;
        default: 
          return FALSE;
        break;
    }     
}*/


/*NTSTATUS
sdv_TdiRegisterPnPHandlers(
    IN PTDI_CLIENT_INTERFACE_INFO ClientInterfaceInfo,
    IN ULONG InterfaceInfoSize,
    OUT HANDLE *BindingHandle
    );*/



/*NTSTATUS
sdv_TdiRegisterPnPHandlers(
    IN PTDI_CLIENT_INTERFACE_INFO ClientInterfaceInfo,
    IN ULONG InterfaceInfoSize,
    OUT HANDLE *BindingHandle
    )
{
        
    LONG x = SdvMakeChoice();
    *BindingHandle = NULL;
    switch (x) 
    { 
        case 0: 
          return TDI_STATUS_BAD_VERSION;
          break;
        case 1: 
          return TDI_STATUS_BAD_CHARACTERISTICS;
          break;
        case 2: 
          return STATUS_INSUFFICIENT_RESOURCES;
          break;
        default: 
          *BindingHandle = (HANDLE)malloc(1);
          return STOR_STATUS_SUCCESS;  
          break;
    } 
    
    
    
}


NTSTATUS
sdv_TdiDeregisterPnPHandlers(
    IN HANDLE BindingHandle
    )
{

    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return STATUS_INSUFFICIENT_RESOURCES;
          break;
        case 1: 
          return STATUS_NETWORK_BUSY;
          break;
        default: 
          return STOR_STATUS_SUCCESS;  
          break;
    } 
}*/



/*
NTSTATUS
WskRegister(    
    __in PWSK_CLIENT_NPI WskClientNpi,    
    __out PWSK_REGISTRATION WskRegistration
    )
{
    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return STATUS_UNSUCCESSFUL;
          break;
        default: 
          return STOR_STATUS_SUCCESS;  
          break;
    }  
}

*/

/*
	t-anseyf
	The following changes were added for new StorPort SDV rules.
*/

STORPORT_API
ULONG
FORCEINLINE
sdv_StorPortAcquireMSISpinLock(
    PVOID HwDeviceExtension,
    ULONG MessageId,
    PULONG OldIrql
    )
{

	int choice = SdvMakeChoice();

	if (! HwDeviceExtension)
		return STOR_STATUS_INVALID_PARAMETER;

	switch(choice) {
	case 0:
		sdv_CheckMSILock(sdv_ConfigInfo);
    SDV_IRQL_PUSH(DIRQL);
    (*OldIrql) = sdv_irql_previous;
		return STOR_STATUS_SUCCESS;
	default:
		return STOR_STATUS_NOT_IMPLEMENTED;
	}
}

STORPORT_API
VOID
FORCEINLINE
sdv_StorPortAcquireSpinLock(
    __in PVOID DeviceExtension,
    __in STOR_SPINLOCK SpinLock,
    __in PVOID LockContext,
    __inout __deref __drv_acquiresExclusiveResource(LockHandle)
    PSTOR_LOCK_HANDLE LockHandle
    )
{
	
    SDV_IRQL_PUSH(DISPATCH_LEVEL);
}

STORPORT_API
VOID
FORCEINLINE
sdv_StorPortReleaseSpinLock(
	IN PVOID  HwDeviceExtension,
    IN PSTOR_LOCK_HANDLE   LockHandle ) {

    SDV_IRQL_POPTO(PASSIVE_LEVEL);
}

STORPORT_API
FORCEINLINE
ULONG
sdv_StorPortAllocatePool(
	IN PVOID  HwDeviceExtension,
    IN ULONG  NumberOfBytes,
    IN ULONG  Tag,
    OUT PVOID  *BufferPointer
    )
{
	int choice = SdvMakeChoice();

	switch(choice) {
	case 0:
		*BufferPointer = malloc(1);
		return STOR_STATUS_SUCCESS;
		break;
	default:
		*BufferPointer = NULL;
		return STOR_STATUS_INSUFFICIENT_RESOURCES;
		break;
	}

	
	/*
		Add non-determinism for other return types.
	*/
}

/*
	t-anseyf:
	Reason for being so explicit in the following code
	is to help trace paths using the SDV viewer.
*/
BOOLEAN sdv_CheckConfig(PPORT_CONFIGURATION_INFORMATION sdv_ConfigInfo) {
	if ( (sdv_ConfigInfo->MaximumTransferLength != SP_UNINITIALIZED_VALUE) &&
		(sdv_ConfigInfo->NumberOfPhysicalBreaks != SP_UNINITIALIZED_VALUE) )
		return TRUE;
	return FALSE;
}

BOOLEAN sdv_CheckMSILock(PPORT_CONFIGURATION_INFORMATION sdv_ConfigInfo) {
	if (sdv_ConfigInfo->InterruptSynchronizationMode == InterruptSynchronizePerMessage)
		return TRUE;
	return FALSE;
}

BOOLEAN sdv_CheckVirtual(PPORT_CONFIGURATION_INFORMATION sdv_ConfigInfo) {
	if (sdv_ConfigInfo->VirtualDevice)
		return TRUE;
	return FALSE;
}

BOOLEAN sdv_SrbStatusPending(PSCSI_REQUEST_BLOCK Srb) {
	if (Srb->SrbStatus == SRB_STATUS_PENDING)
		return TRUE;
	return FALSE;
}

BOOLEAN sdv_CheckTimer() 
{
#if defined(fun_SP_HW_TIMER_1) || defined(fun_SP_HW_TIMER_2)|| defined(fun_SP_HW_TIMER_3)|| defined(fun_SP_HW_TIMER_4)|| defined(fun_SP_HW_TIMER_5)|| defined(fun_SP_HW_TIMER_6)
	return TRUE;
#else
	return FALSE;
#endif
}

/*
t-anseyf
Following is Jakob's code added to sdv_stubs.c in the sdv_breakpoint change pack.
Commented out for
SDV: unsupported feature: Important: File "<DriverPath>\sdv\check\<RuleName>\sdv-harness.c", line 15508, function: "slic_e
rror": Function name cannot be slic_error: slic_error

void slic_error() { };

__forceinline
sdv___sdv_breakpoint (
    )
{
    slic_error();
}

__forceinline
sdv___sdv_breakpoint_conditional (
    BOOLEAN condition
    )
{
    if(condition) slic_error();
}

*/
BOOLEAN sdv_SrbStatusSuccess(PSCSI_REQUEST_BLOCK Srb) 
{
	if (Srb->SrbStatus == SRB_STATUS_SUCCESS||Srb->SrbStatus == STOR_STATUS_SUCCESS||Srb->SrbStatus == 1)
	{
		return TRUE;
  }
  else 
  {
    return FALSE;
  }
}

BOOLEAN sdv_SrbDataLengthTheSame(PSCSI_REQUEST_BLOCK Srb) 
{
	if (Srb->DataTransferLength!=10)
		return TRUE;
	return FALSE;
}


BOOLEAN
FORCEINLINE
sdv_StorPortEnablePassiveInitialization(
    __in PVOID DeviceExtension,
    __in PHW_PASSIVE_INITIALIZE_ROUTINE HwPassiveInitializeRoutine
    )
{
        
#if SDV_IS_LIFECYCLE_HARNESS()
BOOLEAN return_value=TRUE;
#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_1
if(HwPassiveInitializeRoutine == fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_1)
{
    SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
    return_value=fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_1(DeviceExtension);   
    SDV_IRQL_POP();
}
#endif
#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_2
if(HwPassiveInitializeRoutine == fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_2)
{
    SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
    return_value=fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_2(DeviceExtension);   
    SDV_IRQL_POP();
}
#endif
#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_3
if(HwPassiveInitializeRoutine == fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_3)
{
    SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
    return_value=fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_3(DeviceExtension);   
    SDV_IRQL_POP();
}
#endif
#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_4
if(HwPassiveInitializeRoutine == fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_4)
{
    SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
    return_value=fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_4(DeviceExtension);   
    SDV_IRQL_POP();
}
#endif
#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_5
if(HwPassiveInitializeRoutine == fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_5)
{
    SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
    return_value=fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_5(DeviceExtension);   
    SDV_IRQL_POP();
}
#endif
#ifdef fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_6
if(HwPassiveInitializeRoutine == fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_6)
{
    SDV_IRQL_ENTER(PASSIVE_LEVEL);SDV_IRQL_PUSH(PASSIVE_LEVEL);
    return_value=fun_SP_HW_PASSIVE_INITIALIZE_ROUTINE_6(DeviceExtension);   
    SDV_IRQL_POP();
}
#endif
#else
  int choice = SdvMakeChoice();

	switch(choice) 
	{
	case 0:
	  return TRUE;
		break;
	default:
		return FALSE;
		break;
	}
#endif
}


VOID
FORCEINLINE
sdv_StorPortInitializeDpc(
    __in PVOID DeviceExtension,
    __out PSTOR_DPC StorDpc,
    __in PHW_DPC_ROUTINE HwDpcRoutine
    )
{
    StorDpc->Dpc.DeferredRoutine = HwDpcRoutine;
}


BOOLEAN
FORCEINLINE
sdv_StorPortIssueDpc(
    __in PVOID DeviceExtension,
    __in PSTOR_DPC StorDpc,
    __in PVOID SystemArgument1,
    __in PVOID SystemArgument2
    )
{
  int choice = SdvMakeChoice();
	switch(choice) 
	{
	case 0:
	  #if SDV_IS_LIFECYCLE_HARNESS()
	  #ifdef fun_SP_HW_DPC_ROUTINE_1
	  if(StorDpc->Dpc.DeferredRoutine == fun_SP_HW_DPC_ROUTINE_1)
	  {
	      fun_SP_HW_DPC_ROUTINE_1(StorDpc,DeviceExtension,SystemArgument1,SystemArgument2);
	  }
	  #endif
	  #ifdef fun_SP_HW_DPC_ROUTINE_2
	  else if(StorDpc->Dpc.DeferredRoutine == fun_SP_HW_DPC_ROUTINE_2)
	  {
	      fun_SP_HW_DPC_ROUTINE_2(StorDpc,DeviceExtension,SystemArgument1,SystemArgument2);
	  }
	  #endif
	  #ifdef fun_SP_HW_DPC_ROUTINE_3
	  else if(StorDpc->Dpc.DeferredRoutine == fun_SP_HW_DPC_ROUTINE_3)
	  {
	      fun_SP_HW_DPC_ROUTINE_3(StorDpc,DeviceExtension,SystemArgument1,SystemArgument2);
	  }
	  #endif
	  #ifdef fun_SP_HW_DPC_ROUTINE_4
	  else if(StorDpc->Dpc.DeferredRoutine == fun_SP_HW_DPC_ROUTINE_4)
	  {
	      fun_SP_HW_DPC_ROUTINE_4(StorDpc,DeviceExtension,SystemArgument1,SystemArgument2);
	  }
	  #endif
	  #ifdef fun_SP_HW_DPC_ROUTINE_5
	  else if(StorDpc->Dpc.DeferredRoutine == fun_SP_HW_DPC_ROUTINE_5)
	  {
	      fun_SP_HW_DPC_ROUTINE_5(StorDpc,DeviceExtension,SystemArgument1,SystemArgument2);
	  }
	  #endif
	  #ifdef fun_SP_HW_DPC_ROUTINE_6
	  else if(StorDpc->Dpc.DeferredRoutine == fun_SP_HW_DPC_ROUTINE_6)
	  {
	      fun_SP_HW_DPC_ROUTINE_6(StorDpc,DeviceExtension,SystemArgument1,SystemArgument2);
	  }
	  #endif
		#endif
		return TRUE;
		break;
	default:
		return FALSE;
		break;
	}

}


VOID
sdv_RunHwDpcRoutines(
    IN struct _KDPC *dpc, 
    IN PVOID HwDeviceExtension, 
    IN PVOID SystemArgument1, 
    IN PVOID SystemArgument2
    )
/*

Routine Description:

    Finds the appropriate Dpc function and then calls that 
    Dpc routine in the driver.

Arguments:

    dpc - Pointer to the KDPC structure for the DPC object.
	  HwDeviceExtension -  Caller-supplied pointer to driver-defined context information that was specified in a previous call to KeInitializeDpc.
	  SystemArgument1 -  Caller-supplied pointer to driver-supplied information that was specified in a previous call to KeInsertQueueDpc.  
	  SystemArgument1 -  Caller-supplied pointer to driver-supplied information that was specified in a previous call to KeInsertQueueDpc.
    
Return value:

    we have no return value for this function.

Notes:
    
    We will execute the correct DPC routine for the driver.

*/
{
#ifdef fun_SP_HW_DPC_ROUTINE_1
       if(dpc->DeferredRoutine==fun_SP_HW_DPC_ROUTINE_1)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_SP_HW_DPC_ROUTINE_1(dpc,HwDeviceExtension,SystemArgument1,SystemArgument2);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_SP_HW_DPC_ROUTINE_2
       if(dpc->DeferredRoutine==fun_SP_HW_DPC_ROUTINE_2)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_SP_HW_DPC_ROUTINE_2(dpc,HwDeviceExtension,SystemArgument1,SystemArgument2);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_SP_HW_DPC_ROUTINE_3
       if(dpc->DeferredRoutine==fun_SP_HW_DPC_ROUTINE_3)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_SP_HW_DPC_ROUTINE_3(dpc,HwDeviceExtension,SystemArgument1,SystemArgument2);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_SP_HW_DPC_ROUTINE_4
       if(dpc->DeferredRoutine==fun_SP_HW_DPC_ROUTINE_4)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_SP_HW_DPC_ROUTINE_4(dpc,HwDeviceExtension,SystemArgument1,SystemArgument2);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_SP_HW_DPC_ROUTINE_5
       if(dpc->DeferredRoutine==fun_SP_HW_DPC_ROUTINE_5)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_SP_HW_DPC_ROUTINE_5(dpc,HwDeviceExtension,SystemArgument1,SystemArgument2);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
#ifdef fun_SP_HW_DPC_ROUTINE_6
       if(dpc->DeferredRoutine==fun_SP_HW_DPC_ROUTINE_6)
       {
           SDV_IRQL_PUSH(DISPATCH_LEVEL);
           fun_SP_HW_DPC_ROUTINE_6(dpc,HwDeviceExtension,SystemArgument1,SystemArgument2);
           SDV_IRQL_POPTO(PASSIVE_LEVEL);
       }
#endif
}
    
   
#if (NTDDI_VERSION >= NTDDI_WIN8)


BOOLEAN sdv_ScsiPortWmiDispatchFunction(
  PSCSI_WMILIB_CONTEXT WmiLibInfo,
  UCHAR MinorFunction,
  PVOID DeviceContext,
  PSCSIWMI_REQUEST_CONTEXT RequestContext,
  PVOID DataPath,
  ULONG BufferSize,
  PVOID Buffer
)
{
    #ifdef NO_SRB_WMI
        SdvAssume(FALSE);
    #else
    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return TRUE;
          break;
        default: 
          return FALSE;  
          break;
    } 
    #endif
}


ULONG 
sdv_ScsiPortWmiGetReturnSize(
  PSCSIWMI_REQUEST_CONTEXT RequestContext
)
{
    #ifdef NO_SRB_WMI
        SdvAssume(FALSE);
    #else
    LONG bytes_returned = SdvKeepChoice();
    return (ULONG) bytes_returned;
    #endif
    
}

UCHAR 
sdv_ScsiPortWmiGetReturnStatus(
  PSCSIWMI_REQUEST_CONTEXT RequestContext
)
{
    #ifdef NO_SRB_WMI
        SdvAssume(FALSE);
    #else
    return (UCHAR)SdvKeepChoice();
    #endif
}

VOID sdv_ScsiPortWmiPostProcess(
  PSCSIWMI_REQUEST_CONTEXT RequestContext,
  UCHAR SrbStatus,
  ULONG BufferUsed
)
{
    #ifdef NO_SRB_WMI
        SdvAssume(FALSE);
    #endif
}


ULONG
FORCEINLINE
sdv_StorPortRequestTimer(
    PVOID HwDeviceExtension,
    PVOID TimerHandle,
    PHW_TIMER_EX TimerCallback,
    PVOID CallbackContext,
    ULONGLONG TimerValue,
    ULONGLONG TolerableDelay
    )
{
   if ((HwDeviceExtension == NULL) || (TimerHandle == NULL) ||(TimerCallback == NULL) ) 
   {
       return STOR_STATUS_INVALID_PARAMETER;
   }                                 
   else
   {
       #if SDV_IS_LIFECYCLE_HARNESS()
           run_HwTimerExRoutines(HwDeviceExtension,TimerCallback,CallbackContext);
       #endif
       return STOR_STATUS_SUCCESS;
   }
}


VOID run_HwTimerExRoutines(
  PVOID DeviceExtension,
  PHW_TIMER_EX HwTimerExRoutine,
  PVOID CallbackContext
)
{
#ifdef fun_SP_HW_TIMER_EX_1
       if(HwTimerExRoutine==fun_SP_HW_TIMER_EX_1)
       {
           fun_SP_HW_TIMER_EX_1(DeviceExtension,CallbackContext);

       }
#endif

#ifdef fun_SP_HW_TIMER_EX_2
       if(HwTimerExRoutine==fun_SP_HW_TIMER_EX_2)
       {
           fun_SP_HW_TIMER_EX_2(DeviceExtension,CallbackContext);
       }
#endif

#ifdef fun_SP_HW_TIMER_EX_3
       if(HwTimerExRoutine==fun_SP_HW_TIMER_EX_3)
       {
           fun_SP_HW_TIMER_EX_3(DeviceExtension,CallbackContext);
       }
#endif

#ifdef fun_SP_HW_TIMER_EX_4
       if(HwTimerExRoutine==fun_SP_HW_TIMER_EX_4)
       {
           fun_SP_HW_TIMER_EX_4(DeviceExtension,CallbackContext);
       }
#endif

#ifdef fun_SP_HW_TIMER_EX_5
       if(HwTimerExRoutine==fun_SP_HW_TIMER_EX_5)
       {
           fun_SP_HW_TIMER_EX_5(DeviceExtension,CallbackContext);
       }
#endif

#ifdef fun_SP_HW_TIMER_EX_6
       if(HwTimerExRoutine==fun_SP_HW_TIMER_EX_6)
       {
           fun_SP_HW_TIMER_EX_6(DeviceExtension,CallbackContext);
       }
#endif

}



#endif


VOID run_HwTimerRoutines(
  PVOID DeviceExtension,
  PHW_TIMER HwTimerRoutine
)
{
#ifdef fun_SP_HW_TIMER_1
       if(HwTimerRoutine==fun_SP_HW_TIMER_1)
       {
           fun_SP_HW_TIMER_1(DeviceExtension);
       }
#endif
#ifdef fun_SP_HW_TIMER_2
       if(HwTimerRoutine==fun_SP_HW_TIMER_2)
       {
           fun_SP_HW_TIMER_2(DeviceExtension);
       }
#endif
#ifdef fun_SP_HW_TIMER_3
       if(HwTimerRoutine==fun_SP_HW_TIMER_3)
       {
           fun_SP_HW_TIMER_3(DeviceExtension);
       }
#endif
#ifdef fun_SP_HW_TIMER_4
       if(HwTimerRoutine==fun_SP_HW_TIMER_4)
       {
           fun_SP_HW_TIMER_4(DeviceExtension);
       }
#endif
#ifdef fun_SP_HW_TIMER_5
       if(HwTimerRoutine==fun_SP_HW_TIMER_5)
       {
           fun_SP_HW_TIMER_5(DeviceExtension);
       }
#endif
#ifdef fun_SP_HW_TIMER_6
       if(HwTimerRoutine==fun_SP_HW_TIMER_6)
       {
           fun_SP_HW_TIMER_6(DeviceExtension);
       }
#endif

}

ULONG
FORCEINLINE
sdv_StorPortMarkDumpMemory(
    PVOID HwDeviceExtension,
    PVOID Address,
    ULONG_PTR Length,
    ULONG Flags
    )
{

    LONG x = SdvMakeChoice();
    SdvAssume(FALSE);
    switch (x) 
    { 
        case 0: 
          return STOR_STATUS_UNSUCCESSFUL;;
          break;
        default: 
          return STOR_STATUS_SUCCESS;  
          break;
    } 
}


STORPORT_API
ULONG
StorPortExtendedFunction(
    STORPORT_FUNCTION_CODE FunctionCode,
    PVOID HwDeviceExtension,
    ...
    )
{
    LONG x = SdvMakeChoice();
    if(FunctionCode==ExtFunctionMarkDumpMemory)
    {
        SdvAssume(FALSE);
    }
    switch (x) 
    { 
        case 0: 
          return STOR_STATUS_UNSUCCESSFUL;;
          break;
        default: 
          return STOR_STATUS_SUCCESS;  
          break;
    } 

}

FORCEINLINE BOOLEAN
sdv_ScsiGetTotalSenseByteCountIndicated (
   PVOID SenseInfoBuffer,
   UCHAR SenseInfoBufferLength,
   UCHAR *TotalByteCountIndicated
   )
{
    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return TRUE;
          break;
        default: 
          return FALSE;  
          break;
    } 
}

   
   
FORCEINLINE BOOLEAN
sdv_ScsiGetFixedSenseKeyAndCodes (
   PVOID SenseInfoBuffer,
   UCHAR SenseInfoBufferLength,
   PUCHAR SenseKey,
   PUCHAR AdditionalSenseCode,
   PUCHAR AdditionalSenseCodeQualifier
   )
{
    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return TRUE;
          break;
        default: 
          return FALSE;  
          break;
    } 
}


   
FORCEINLINE BOOLEAN
sdv_ScsiGetDescriptorSenseKeyAndCodes (
   PVOID SenseInfoBuffer,
   UCHAR SenseInfoBufferLength,
   PUCHAR SenseKey,
   PUCHAR AdditionalSenseCode,
   PUCHAR AdditionalSenseCodeQualifier
   )
{
    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return TRUE;
          break;
        default: 
          return FALSE;  
          break;
    } 
}

   
FORCEINLINE BOOLEAN
sdv_ScsiGetSenseDescriptor(
   PVOID SenseInfoBuffer,
   UCHAR SenseInfoBufferLength,
   PVOID *DescriptorBuffer,
   UCHAR *DescriptorBufferLength
   )
{
    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return TRUE;
          break;
        default: 
          return FALSE;  
          break;
    } 
}



FORCEINLINE BOOLEAN
sdv_ScsiValidateInformationSenseDescriptor(
    PVOID DescriptorBuffer,
    UCHAR DescriptorBufferLength
    )
{
    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return TRUE;
          break;
        default: 
          return FALSE;  
          break;
    } 
}

    
    
    
FORCEINLINE BOOLEAN
sdv_ScsiValidateBlockCommandSenseDescriptor(
    PVOID DescriptorBuffer,
    UCHAR DescriptorBufferLength
    )
{
    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return TRUE;
          break;
        default: 
          return FALSE;  
          break;
    } 
}



FORCEINLINE BOOLEAN
sdv_ScsiConvertToFixedSenseFormat(
    PVOID SenseInfoBuffer,
    UCHAR SenseInfoBufferLength,
    PVOID OutBuffer,
    UCHAR OutBufferLength
    )
{
    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return TRUE;
          break;
        default: 
          return FALSE;  
          break;
    } 
}


FORCEINLINE BOOLEAN
sdv_ScsiGetNextSenseDescriptorByType (
    PVOID Buffer,
    UCHAR BufferLength,
    PUCHAR TypeList,    
    ULONG TypeListCount,
    PUCHAR OutType,
    PVOID *OutBuffer,
    UCHAR *OutBufferLength
)
{
    LONG x = SdvMakeChoice();
    switch (x) 
    { 
        case 0: 
          return TRUE;
          break;
        default: 
          return FALSE;  
          break;
    } 
}




   
ULONG
FORCEINLINE
sdv_StorPortFreePool(
    PVOID HwDeviceExtension,
    PVOID BufferPointer
    )
{
    if (BufferPointer == NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortAllocateMdl(
    PVOID HwDeviceExtension,
    PVOID BufferPointer,
    ULONG NumberOfBytes,
    PVOID *Mdl
    )
{
    LONG choice = SdvMakeChoice();
    if ((BufferPointer == NULL)||(*Mdl==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    if ( sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
        
    switch (choice) 
    {
        case 0:  *Mdl=malloc(1);
                 return STOR_STATUS_SUCCESS;break;
        default: *Mdl=NULL;
                 return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}


ULONG
FORCEINLINE
sdv_StorPortFreeMdl(
    PVOID HwDeviceExtension,
    __drv_freesMem(Mem) _Post_invalid_ PVOID Mdl
    )
{
    if (Mdl == NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    return STOR_STATUS_SUCCESS;
}


ULONG
FORCEINLINE
sdv_StorPortBuildMdlForNonPagedPool(
    PVOID HwDeviceExtension,
    PVOID Mdl
    )
{
    if (Mdl == NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortGetSystemAddress(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    _Outptr_ PVOID *SystemAddress
    )
{
    LONG choice = SdvMakeChoice();
    if (*SystemAddress==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
        
    switch (choice) 
    {
        case 0:  *SystemAddress=malloc(1);
                 return STOR_STATUS_SUCCESS;break;
        default: *SystemAddress=NULL;
                 return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

#if (NTDDI_VERSION >= NTDDI_WIN8)

ULONG
FORCEINLINE
sdv_StorPortGetOriginalMdl(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    _Outptr_ PVOID *Mdl
    )
{
    if (*Mdl==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    *Mdl=malloc(1);
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortCompleteServiceIrp(
    PVOID HwDeviceExtension,
    PVOID Irp
    )
{
    if (Irp==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    return STOR_STATUS_SUCCESS;
}



ULONG
FORCEINLINE
sdv_StorPortGetDeviceObjects(
    PVOID HwDeviceExtension,
    _Outptr_ PVOID *AdapterDeviceObject,
    _Outptr_ PVOID *PhysicalDeviceObject,
    _Outptr_ PVOID *LowerDeviceObject
    )
{
    if (HwDeviceExtension==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    *AdapterDeviceObject=malloc(1);
    *PhysicalDeviceObject=malloc(1);
    *LowerDeviceObject=malloc(1);
    return STOR_STATUS_SUCCESS;
}
    
    
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
    )
{
    LONG choice = SdvMakeChoice();
    if (HwDeviceExtension==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    
    switch (choice) 
    {
        case 0:
                 #if SDV_IS_LIFECYCLE_HARNESS()
                 #ifdef fun_SP_POST_SCATTER_GATHER_EXECUTE
                 if(fun_SP_POST_SCATTER_GATHER_EXECUTE==ExecutionRoutine)
                 {
                     fun_SP_POST_SCATTER_GATHER_EXECUTE(&sdv_CurrentMiniportDevice,&sdv_CurrentMiniportIrp,sdv_ScatterGatherList,Context);
                 }
                 #endif
                 #endif
                 return STOR_STATUS_SUCCESS;break;
        case 1:  return STOR_STATUS_BUFFER_TOO_SMALL;break;
        default: return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

ULONG
FORCEINLINE
sdv_StorPortPutScatterGatherList(
    PVOID HwDeviceExtension,
    PSTOR_SCATTER_GATHER_LIST ScatterGatherList,
    BOOLEAN WriteToDevice
    )
{
    if (HwDeviceExtension==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortReleaseMSISpinLock(
    PVOID HwDeviceExtension,
    ULONG MessageId,
    ULONG OldIrql
    )
{
    if (HwDeviceExtension==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    SDV_IRQL_POPTO(OldIrql);
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortGetMSIInfo(
    PVOID HwDeviceExtension,
    ULONG MessageId,
    PMESSAGE_INTERRUPT_INFORMATION InterruptInfo
    )
{
    if ((HwDeviceExtension==NULL)||(InterruptInfo==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortInitializePerfOpts(
    PVOID HwDeviceExtension,
    BOOLEAN Query,
    PPERF_CONFIGURATION_DATA PerfConfigData
    )
{
    LONG choice = SdvMakeChoice();
    if (PerfConfigData==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    switch (choice) 
    {
        case 0:  return STOR_STATUS_SUCCESS;break;
        case 1:  return STOR_STATUS_UNSUCCESSFUL;break;
        default: return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

ULONG
FORCEINLINE
sdv_StorPortGetStartIoPerfParams(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    PSTARTIO_PERFORMANCE_PARAMETERS StartIoPerfParams
    )
{
    if ((Srb==NULL)||(StartIoPerfParams==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortLogSystemEvent(
    PVOID HwDeviceExtension,
    PSTOR_LOG_EVENT_DETAILS LogDetails,
    PULONG MaximumSize
    )
{
    LONG choice = SdvMakeChoice();
    if ((HwDeviceExtension==NULL)||(LogDetails==NULL)||(MaximumSize==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    switch (choice) 
    {
        case 0:  return STOR_STATUS_SUCCESS;break;
        case 1:  return STOR_STATUS_INVALID_BUFFER_SIZE;break;
        default: return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

ULONG
FORCEINLINE
sdv_StorPortGetCurrentProcessorNumber (
    PVOID HwDeviceExtension,
    PPROCESSOR_NUMBER ProcNumber
    )
{
    if ((ProcNumber==NULL) || (HwDeviceExtension==NULL))
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    PPROCESSOR_NUMBER x=malloc(1);
    *ProcNumber=*x;
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortGetGroupAffinity (
    PVOID HwDeviceExtension,
    USHORT GroupNumber,
    PKAFFINITY GroupAffinityMask
    )
{
    LONG choice = SdvMakeChoice();
    KAFFINITY x = (KAFFINITY)SdvKeepChoice();
    if ((GroupAffinityMask==NULL)||(HwDeviceExtension==NULL))
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    switch (choice) 
    {
        case 0:  *GroupAffinityMask=x;
                 return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_UNSUCCESSFUL;break;
    }
}

ULONG
FORCEINLINE
sdv_StorPortGetActiveGroupCount (
    PVOID HwDeviceExtension,
    PUSHORT NumberGroups
    )
{
    USHORT x = (USHORT)SdvKeepChoice();
    *NumberGroups = x;
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortGetNodeAffinity (
    PVOID HwDeviceExtension,
    ULONG NodeNumber,
    PGROUP_AFFINITY NodeAffinityMask
    )
{
    if ((NodeAffinityMask==NULL)||(NodeAffinityMask>65535)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    PGROUP_AFFINITY x=malloc(1);
    *NodeAffinityMask=*x;
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortGetActiveNodeCount (
    PVOID HwDeviceExtension,
    PULONG NumberNodes
    )
{
    ULONG x = (ULONG)SdvKeepChoice();
    if ((HwDeviceExtension==NULL)||(NumberNodes==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    *NumberNodes=x;
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortGetHighestNodeNumber (
    PVOID HwDeviceExtension,
    PULONG HighestNode
    )
{
    ULONG x = (ULONG)SdvKeepChoice();
    
    if ((HwDeviceExtension==NULL)||(HighestNode==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    
    *HighestNode=x;
    return STOR_STATUS_SUCCESS;
}

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
sdv_StorPortGetLogicalProcessorRelationship (
    PVOID HwDeviceExtension,
    PPROCESSOR_NUMBER ProcessorNumber,
    LOGICAL_PROCESSOR_RELATIONSHIP RelationshipType,
    PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX Information,
    PULONG Length
    )
{
    LONG choice = SdvMakeChoice();
    ULONG x = (ULONG)SdvKeepChoice();
    if ((HwDeviceExtension==NULL)||(ProcessorNumber==NULL)||(Information==NULL)||(Length==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    
    switch (choice) 
    {
        case 0:  *Length=x;   
                 PSYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX y = malloc(1);              
                 *Information=*y;
                 return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_BUFFER_TOO_SMALL;break;
    }
}

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
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0:  *BufferPointer=(PVOID)SdvKeepChoice();
                 return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

ULONG
FORCEINLINE
sdv_StorPortFreeContiguousMemorySpecifyCache (
    PVOID HwDeviceExtension,
    PVOID BaseAddress,
    SIZE_T NumberOfBytes,
    MEMORY_CACHING_TYPE CacheType
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0:  return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

ULONG
FORCEINLINE
sdv_StorPortSetPowerSettingNotificationGuids (
    PVOID  HwDeviceExtension,
    ULONG  GuidCount,
    LPGUID Guid
    )
{
    LONG choice = SdvMakeChoice();
    switch (choice) 
    {
        case 0:  return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

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
    )
{
    LONG choice = SdvMakeChoice();
    ULONG x = (ULONG)SdvKeepChoice();
    if ((HwDeviceExtension==NULL)||(InputBuffer==NULL)||(OutputBuffer==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    switch (choice) 
    {
        case 0:  *BytesReturned=x;
                 return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
    
}

ULONG
FORCEINLINE
sdv_StorPortGetActivityIdSrb(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    LPGUID ActivityId
    )
{
    LONG choice = SdvMakeChoice();
    if (Srb==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    switch (choice) 
    {
        case 0:  return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_UNSUCCESSFUL;break;
    }
}

ULONG
FORCEINLINE
sdv_StorPortGetDataInBufferMdl(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    _Outptr_ PVOID* Mdl
    )
{
    if (Mdl==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    *Mdl=(PVOID)(SdvKeepChoice());
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortGetDataInBufferSystemAddress(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    _Outptr_ PVOID* SystemAddress
    )
{
    LONG choice = SdvMakeChoice();
    if (SystemAddress==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    *SystemAddress=NULL;
    switch (choice) 
    {
        case 0:  *SystemAddress=(PVOID)(SdvKeepChoice());
                 return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

ULONG
FORCEINLINE
sdv_StorPortGetDataInBufferScatterGatherList(
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    _Outptr_ PSTOR_SCATTER_GATHER_LIST* SgList
    )
{
    if (SgList==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    *SgList=malloc(1);
    return STOR_STATUS_SUCCESS;
}


ULONG
FORCEINLINE
sdv_StorPortSetUnitAttributes(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    STOR_UNIT_ATTRIBUTES Attributes
    )
{
    if (Address==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
sdv_StorPortQueryPerformanceCounter(
    PVOID HwDeviceExtension,
    PLARGE_INTEGER PerformanceFrequency,
    PLARGE_INTEGER PerformanceCounter
    )
{
    if (PerformanceCounter==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    PLARGE_INTEGER x = malloc(1);
    PLARGE_INTEGER y = malloc(1);
    *PerformanceCounter=*x;
    if (PerformanceFrequency != NULL)
    {
        *PerformanceFrequency=*y;
    }
    return STOR_STATUS_SUCCESS;
}

ULONG
FORCEINLINE
StorPortGetSystemPortNumber(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address
    )
{
    LONG choice = SdvMakeChoice();
    if (Address==NULL) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    switch (choice) 
    {
        case 0:  PSTOR_ADDRESS x = malloc(1);
                 *Address=*x;
                 return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_INVALID_DEVICE_STATE;break;
    }
    
}

#endif



FORCEINLINE
LONG
sdv_InterlockedAnd (
    LONG volatile *Target,
    LONG Set
    )
{
   return SdvKeepChoice();
}


FORCEINLINE
LONG
sdv_InterlockedOr (
    LONG volatile *Target,
    LONG Set
    )
{
   return SdvKeepChoice();
}

ULONG
FORCEINLINE
sdv_StorPortGetRequestInfo (
    PVOID HwDeviceExtension,
    PSCSI_REQUEST_BLOCK Srb,
    PSTOR_REQUEST_INFO RequestInfo
    )
{
    
    if ((Srb == NULL) || (RequestInfo == NULL)) 
    {
        return STOR_STATUS_INVALID_PARAMETER;
    }
    PSTOR_REQUEST_INFO x = malloc(1);
    *RequestInfo=*x;
    return STOR_STATUS_SUCCESS;
}




_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
sdv_StorPortInitializeWorker(
    PVOID HwDeviceExtension,
    PVOID *Worker
    )
{
    LONG choice = SdvMakeChoice();
    if ((HwDeviceExtension==NULL)||(Worker==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    switch (choice) 
    {
        case 0:  *Worker=(PVOID)(SdvKeepChoice());
                 return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
sdv_StorPortQueueWorkItem(
    PVOID HwDeviceExtension,
    PHW_WORKITEM WorkItemCallback,
    PVOID Worker,
    PVOID Context
    )
{
    LONG choice = SdvMakeChoice();
    if ((HwDeviceExtension==NULL)||(Worker==NULL)||(WorkItemCallback==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    switch (choice) 
    {
        case 0:  
                 #if SDV_IS_LIFECYCLE_HARNESS()
                     run_HwWorkItemRoutines(WorkItemCallback,HwDeviceExtension,Context,Worker);
                 #endif
                 return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_BUSY;break;
    }
}

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
sdv_StorPortFreeWorker(
    PVOID HwDeviceExtension,
    PVOID Worker
    )
{
    LONG choice = SdvMakeChoice();
    if ((HwDeviceExtension==NULL)||(Worker==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    switch (choice) 
    {
        case 0:  return STOR_STATUS_SUCCESS;break;
        case 1:  return STOR_STATUS_UNSUCCESSFUL;break;
        default: return STOR_STATUS_BUSY;break;
    }
}

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
sdv_StorPortInitializeTimer(
    PVOID HwDeviceExtension,
    PVOID *TimerHandle
    )
{
    LONG choice = SdvMakeChoice();
    if ((HwDeviceExtension==NULL)||(TimerHandle==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    switch (choice) 
    {
        case 0:  *TimerHandle=malloc(1);
                 return STOR_STATUS_SUCCESS;break;
        case 1:  *TimerHandle=NULL;
                 return STOR_STATUS_UNSUCCESSFUL;break;
        default: *TimerHandle=NULL;
                 return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}


_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
sdv_StorPortFreeTimer(
    PVOID HwDeviceExtension,
    PVOID TimerHandle
    )
{
    LONG choice = SdvMakeChoice();
    if ((HwDeviceExtension==NULL)||(TimerHandle==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return  STOR_STATUS_INVALID_IRQL;
    }
    switch (choice) 
    {
        case 0:  return STOR_STATUS_SUCCESS;break;
        case 1:  return STOR_STATUS_UNSUCCESSFUL;break;
        default: return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
    }
}



#if (NTDDI_VERSION >= NTDDI_WIN8)

ULONG
FORCEINLINE
sdv_StorPortStateChangeDetected(
    PVOID HwDeviceExtension,
    ULONG ChangedEntity,
    PSTOR_ADDRESS Address,
    ULONG Attributes,
    PHW_STATE_CHANGE HwStateChange,
    PVOID HwStateChangeContext
    )
{
    LONG choice = SdvMakeChoice();
    if ((HwDeviceExtension==NULL)||(Address==NULL)||(HwStateChange==NULL)) 
    {
        return  STOR_STATUS_INVALID_PARAMETER;
    }
    switch (choice) 
    {
        case 0:  
                 #if SDV_IS_LIFECYCLE_HARNESS()
                     run_HwStateChangeRoutines(HwStateChange,HwDeviceExtension,HwStateChangeContext,Address);
                 #endif
                 return STOR_STATUS_SUCCESS;break;
        default: return STOR_STATUS_UNSUCCESSFUL;break;
    }
}



#endif



ULONG
FORCEINLINE
sdv_StorPortInitializeSListHead(
    PVOID HwDeviceExtension,
    PSTOR_SLIST_HEADER SListHead
    )
{
#if (NTDDI_VERSION >= NTDDI_WIN8)

    if (SListHead==NULL) 
    {
        return STOR_STATUS_INVALID_PARAMETER;
    } 
    else 
    {
        PSTOR_SLIST_HEADER x = malloc(1); 
        *SListHead = *x;
        return STOR_STATUS_SUCCESS;
    }
#else
    UNREFERENCED_PARAMETER(HwDeviceExtension);
    UNREFERENCED_PARAMETER(SListHead);
#endif

    return STOR_STATUS_NOT_IMPLEMENTED;
}

ULONG
FORCEINLINE
sdv_StorPortInterlockedFlushSList(
    PVOID HwDeviceExtension,
    PSTOR_SLIST_HEADER SListHead,
    PSTOR_SLIST_ENTRY *Result
    )
{
    ULONG Status = STOR_STATUS_NOT_IMPLEMENTED;


#if (NTDDI_VERSION >= NTDDI_WIN8)

    if ((Result) && (SListHead)) 
    {
        PSTOR_SLIST_HEADER x = malloc(1);
        *SListHead=*x;
        *Result=malloc(1);
        return STOR_STATUS_SUCCESS;
    } 
    else 
    {
        Status = STOR_STATUS_INVALID_PARAMETER;
    }

#else
    UNREFERENCED_PARAMETER(HwDeviceExtension);
    UNREFERENCED_PARAMETER(SListHead);
    UNREFERENCED_PARAMETER(Result);
#endif

    return Status;
}

ULONG
FORCEINLINE
sdv_StorPortInterlockedPopEntrySList(
    PVOID HwDeviceExtension,
    PSTOR_SLIST_HEADER SListHead,
    PSTOR_SLIST_ENTRY *Result
    )
{
    ULONG Status = STOR_STATUS_NOT_IMPLEMENTED;

#if (NTDDI_VERSION >= NTDDI_WIN8)

    if ((Result) && (SListHead)) 
    {
        PSTOR_SLIST_HEADER x=malloc(1);
        *SListHead=*x;
        *Result=malloc(1);
        return STOR_STATUS_SUCCESS;
    } 
    else 
    {
        Status = STOR_STATUS_INVALID_PARAMETER;
    }

#else
    UNREFERENCED_PARAMETER(HwDeviceExtension);
    UNREFERENCED_PARAMETER(SListHead);
    UNREFERENCED_PARAMETER(Result);
#endif

    return Status;
}

ULONG
FORCEINLINE
sdv_StorPortInterlockedPushEntrySList(
    PVOID HwDeviceExtension,
    PSTOR_SLIST_HEADER SListHead,
    PSTOR_SLIST_ENTRY SListEntry,
    PSTOR_SLIST_ENTRY *Result
    )
#pragma warning (suppress: 28194) 
{
    ULONG Status = STOR_STATUS_NOT_IMPLEMENTED;


#if (NTDDI_VERSION >= NTDDI_WIN8)

    if ((Result) && (SListHead) && (SListEntry)) 
    {
        PSTOR_SLIST_HEADER x = malloc(1);
        PSTOR_SLIST_ENTRY y = malloc(1);
        *SListHead = *x;
        *SListEntry = *y;
        *Result = malloc(1);
        return STOR_STATUS_SUCCESS;
    } 
    else 
    {
        Status = STOR_STATUS_INVALID_PARAMETER;
    }

#else
    UNREFERENCED_PARAMETER(HwDeviceExtension);
    UNREFERENCED_PARAMETER(SListHead);
    UNREFERENCED_PARAMETER(SListEntry);
    UNREFERENCED_PARAMETER(Result);
#endif

    return Status;
}

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
sdv_StorPortQueryDepthSList(
    PVOID HwDeviceExtension,
    PSTOR_SLIST_HEADER SListHead,
    PSHORT Result
    )
{
    ULONG Status = STOR_STATUS_NOT_IMPLEMENTED;


#if (NTDDI_VERSION >= NTDDI_WIN8)
    SHORT x = SdvKeepChoice();
    if ((Result) && (SListHead)) 
    {
        *Result=x;
        PSTOR_SLIST_HEADER y = malloc(1);
        *SListHead=*y;
        return STOR_STATUS_SUCCESS;
    } 
    else 
    {
        Status = STOR_STATUS_INVALID_PARAMETER;
    }

#else
    UNREFERENCED_PARAMETER(HwDeviceExtension);
    UNREFERENCED_PARAMETER(SListHead);
    UNREFERENCED_PARAMETER(Result);
#endif

    return Status;
}

#if (NTDDI_VERSION >= NTDDI_WIN8)

#if defined(_WIN64)

ULONG64
FORCEINLINE
sdv_StorPortReadRegisterUlong64(
    PVOID HwDeviceExtension,
    volatile PULONG64 Register
    )
{
    return (ULONG64)SdvKeepChoice();
}

VOID
FORCEINLINE
sdv_StorPortReadRegisterBufferUlong64(
    PVOID HwDeviceExtension,
    PULONG64 Register,
    PULONG64 Buffer,
    ULONG Count
    )
{
    ULONG64 x = (ULONG64)SdvKeepChoice();
    if(Buffer==NULL)
    {
        return STOR_STATUS_INVALID_PARAMETER;
    }
    *Buffer = x;
    return STOR_STATUS_SUCCESS;
}
   
VOID
FORCEINLINE
sdv_StorPortWriteRegisterUlong64(
    PVOID HwDeviceExtension,
    volatile PULONG64 Register,
    ULONG64 Value
    )
{
    return STOR_STATUS_SUCCESS;
}
   
VOID
FORCEINLINE
sdv_StorPortWriteRegisterBufferUlong64(
    PVOID HwDeviceExtension,
    PULONG64 Register,
    PULONG64 Buffer,
    ULONG Count
    )
{
    if(Buffer==NULL)
    {
        return STOR_STATUS_INVALID_PARAMETER;
    }
    return STOR_STATUS_SUCCESS;
}  
#endif

_IRQL_requires_max_(PASSIVE_LEVEL)
ULONG
FORCEINLINE
sdv_StorPortInitializePoFxPower(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    PSTOR_POFX_DEVICE Device,
    PBOOLEAN D3ColdEnabled
)
{
    LONG x = SdvMakeChoice();
    if (sdv_irql_current > PASSIVE_LEVEL) 
    {
        return STOR_STATUS_INVALID_IRQL;
    } 
    if (Device == NULL) 
    {
        return STOR_STATUS_INVALID_PARAMETER;
    }
    switch (x) 
    { 
      case 0:return STATUS_UNSUCCESSFUL;break;
      case 1:return STOR_STATUS_INSUFFICIENT_RESOURCES;break;
      default: return STOR_STATUS_SUCCESS;break;
    }
}

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
sdv_StorPortPoFxActivateComponent(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    PSCSI_REQUEST_BLOCK Srb,
    ULONG Component,
    ULONG Flags
)
{
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return STOR_STATUS_INVALID_IRQL;
    } 
    if (Flags != 0) 
    {
        return STOR_STATUS_INVALID_PARAMETER;
    }
    return STOR_STATUS_SUCCESS;
}

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
sdv_StorPortPoFxIdleComponent(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    PSCSI_REQUEST_BLOCK Srb,
    ULONG Component,
    ULONG Flags
)
{
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return STOR_STATUS_INVALID_IRQL;
    } 
    if (Flags != 0) 
    {
        return STOR_STATUS_INVALID_PARAMETER;
    }
    return STOR_STATUS_SUCCESS;
}

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
SDV_StorPortPoFxSetComponentLatency(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    ULONG Component,
    ULONGLONG Latency
)
{
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return STOR_STATUS_INVALID_IRQL;
    } 
    if (Address == NULL) 
    {
        return STOR_STATUS_INVALID_PARAMETER;
    }
    return STOR_STATUS_SUCCESS;
}

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
sdv_StorPortPoFxSetComponentResidency(
    PVOID HwDeviceExtension,
    PSTOR_ADDRESS Address,
    ULONG Component,
    ULONGLONG Residency
)
{
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return STOR_STATUS_INVALID_IRQL;
    } 
    if (Address == NULL) 
    {
        return STOR_STATUS_INVALID_PARAMETER;
    }
    return STOR_STATUS_SUCCESS;
}

_IRQL_requires_max_(DISPATCH_LEVEL)
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
)
{
    LONG x = SdvMakeChoice();
    if (sdv_irql_current > DISPATCH_LEVEL) 
    {
        return STOR_STATUS_INVALID_IRQL;
    } 
    if (Address == NULL) 
    {
        return STOR_STATUS_INVALID_PARAMETER;
    }
    switch (x)
    {
        case 0:  return STOR_STATUS_SUCCESS; break;
        default: return STATUS_INSUFFICIENT_RESOURCES; break;
    }
}

#endif


VOID run_HwWorkItemRoutines(
  PHW_WORKITEM WorkItemCallback,
  PVOID DeviceExtension,
  PVOID Context,
  PVOID Worker
)
{
#ifdef fun_HW_WORKITEM_1
       if(WorkItemCallback==fun_HW_WORKITEM_1)
       {
           fun_HW_WORKITEM_1(DeviceExtension,Context,Worker);
       }
#endif
#ifdef fun_HW_WORKITEM_2
       if(WorkItemCallback==fun_HW_WORKITEM_2)
       {
           fun_HW_WORKITEM_2(DeviceExtension,Context,Worker);
       }
#endif
#ifdef fun_HW_WORKITEM_3
       if(WorkItemCallback==fun_HW_WORKITEM_3)
       {
           fun_HW_WORKITEM_3(DeviceExtension,Context,Worker);
       }
#endif
#ifdef fun_HW_WORKITEM_4
       if(WorkItemCallback==fun_HW_WORKITEM_4)
       {
           fun_HW_WORKITEM_4(DeviceExtension,Context,Worker);
       }
#endif
#ifdef fun_HW_WORKITEM_5
       if(WorkItemCallback==fun_HW_WORKITEM_5)
       {
           fun_HW_WORKITEM_5(DeviceExtension,Context,Worker);
       }
#endif
#ifdef fun_HW_WORKITEM_6
       if(WorkItemCallback==fun_HW_WORKITEM_6)
       {
           fun_HW_WORKITEM_6(DeviceExtension,Context,Worker);
       }
#endif
}

VOID run_HwStateChangeRoutines(
  PHW_STATE_CHANGE HwStateChangeCallback,
  PVOID DeviceExtension,
  PVOID Context,
  PVOID Address
)
{
#ifdef fun_HW_STATE_CHANGE_1
     if(HwStateChangeCallback==fun_HW_STATE_CHANGE_1)
     {
         fun_HW_STATE_CHANGE_1(HwStateChangeCallback,Context,sdv_HwAddressType,Address,sdv_hwstatus);
     }
#endif
#ifdef fun_HW_STATE_CHANGE_2
     if(HwStateChangeCallback==fun_HW_STATE_CHANGE_2)
     {
         fun_HW_STATE_CHANGE_2(HwStateChangeCallback,Context,sdv_HwAddressType,Address,sdv_hwstatus);
     }
#endif

#ifdef fun_HW_STATE_CHANGE_3
     if(HwStateChangeCallback==fun_HW_STATE_CHANGE_3)
     {
         fun_HW_STATE_CHANGE_3(HwStateChangeCallback,Context,sdv_HwAddressType,Address,sdv_hwstatus);
     }
#endif

#ifdef fun_HW_STATE_CHANGE_4
     if(HwStateChangeCallback==fun_HW_STATE_CHANGE_4)
     {
         fun_HW_STATE_CHANGE_4(HwStateChangeCallback,Context,sdv_HwAddressType,Address,sdv_hwstatus);
     }
#endif

#ifdef fun_HW_STATE_CHANGE_5
     if(HwStateChangeCallback==fun_HW_STATE_CHANGE_5)
     {
         fun_HW_STATE_CHANGE_5(HwStateChangeCallback,Context,sdv_HwAddressType,Address,sdv_hwstatus);
     }
#endif

#ifdef fun_HW_STATE_CHANGE_6
     if(HwStateChangeCallback==fun_HW_STATE_CHANGE_6)
     {
         fun_HW_STATE_CHANGE_6(HwStateChangeCallback,Context,sdv_HwAddressType,Address,sdv_hwstatus);
     }
#endif

}
/* sp_sdv_stubs.c end */

