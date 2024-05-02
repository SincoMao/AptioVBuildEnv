/*++

Copyright (c) Microsoft Corporation. All rights reserved.

Module Name:

    Wdfrequest.h

Environment:

    user mode

NOTE: This header is generated by stubwork.

      To modify contents, add or remove <shared> or <umdf>
      tags in the corresponding .x and .y template files.

--*/

#pragma once

#ifndef WDF_EXTERN_C
  #ifdef __cplusplus
    #define WDF_EXTERN_C       extern "C"
    #define WDF_EXTERN_C_START extern "C" {
    #define WDF_EXTERN_C_END   }
  #else
    #define WDF_EXTERN_C
    #define WDF_EXTERN_C_START
    #define WDF_EXTERN_C_END
  #endif
#endif

WDF_EXTERN_C_START

typedef enum _WDF_REQUEST_TYPE {
    WdfRequestTypeCreate = 0x0,
    WdfRequestTypeCreateNamedPipe = 0x1,
    WdfRequestTypeClose = 0x2,
    WdfRequestTypeRead = 0x3,
    WdfRequestTypeWrite = 0x4,
    WdfRequestTypeQueryInformation = 0x5,
    WdfRequestTypeSetInformation = 0x6,
    WdfRequestTypeQueryEA = 0x7,
    WdfRequestTypeSetEA = 0x8,
    WdfRequestTypeFlushBuffers = 0x9,
    WdfRequestTypeQueryVolumeInformation = 0xa,
    WdfRequestTypeSetVolumeInformation = 0xb,
    WdfRequestTypeDirectoryControl = 0xc,
    WdfRequestTypeFileSystemControl = 0xd,
    WdfRequestTypeDeviceControl = 0xe,
    WdfRequestTypeDeviceControlInternal = 0xf,
    WdfRequestTypeShutdown = 0x10,
    WdfRequestTypeLockControl = 0x11,
    WdfRequestTypeCleanup = 0x12,
    WdfRequestTypeCreateMailSlot = 0x13,
    WdfRequestTypeQuerySecurity = 0x14,
    WdfRequestTypeSetSecurity = 0x15,
    WdfRequestTypePower = 0x16,
    WdfRequestTypeSystemControl = 0x17,
    WdfRequestTypeDeviceChange = 0x18,
    WdfRequestTypeQueryQuota = 0x19,
    WdfRequestTypeSetQuota = 0x1A,
    WdfRequestTypePnp = 0x1B,
    WdfRequestTypeOther =0x1C,
    WdfRequestTypeUsb = 0x40,
    WdfRequestTypeNoFormat = 0xFF,
    WdfRequestTypeMax,
} WDF_REQUEST_TYPE;


typedef enum _WDF_REQUEST_REUSE_FLAGS {
    WDF_REQUEST_REUSE_NO_FLAGS = 0x00000000,
    WDF_REQUEST_REUSE_SET_NEW_IRP = 0x00000001,
} WDF_REQUEST_REUSE_FLAGS;


// 
// This defines the actions to take on a request
// in EvtIoStop.
// 
typedef enum _WDF_REQUEST_STOP_ACTION_FLAGS {
    WdfRequestStopActionInvalid = 0,
    WdfRequestStopActionSuspend = 0x01, //  Device is being suspended
    WdfRequestStopActionPurge = 0x2, //  Device/queue is being removed
    WdfRequestStopRequestCancelable = 0x10000000, //  This bit is set if the request is marked cancelable
} WDF_REQUEST_STOP_ACTION_FLAGS;


typedef enum _WDF_REQUEST_SEND_OPTIONS_FLAGS {
    WDF_REQUEST_SEND_OPTION_TIMEOUT = 0x00000001,
    WDF_REQUEST_SEND_OPTION_SYNCHRONOUS = 0x00000002,
    WDF_REQUEST_SEND_OPTION_IGNORE_TARGET_STATE = 0x00000004,
    WDF_REQUEST_SEND_OPTION_SEND_AND_FORGET = 0x00000008,
    WDF_REQUEST_SEND_OPTION_IMPERSONATE_CLIENT = 0x00010000,
    WDF_REQUEST_SEND_OPTION_IMPERSONATION_IGNORE_FAILURE = 0x00020000,
} WDF_REQUEST_SEND_OPTIONS_FLAGS;


// Request cancel is called if a request that has been marked cancelable is cancelled
typedef
_Function_class_(EVT_WDF_REQUEST_CANCEL)
_IRQL_requires_same_
_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
EVT_WDF_REQUEST_CANCEL(
    _In_
    WDFREQUEST Request
    );

typedef EVT_WDF_REQUEST_CANCEL *PFN_WDF_REQUEST_CANCEL;


//
// This parameters structure allows general access to a requests parameters
//
typedef struct _WDF_REQUEST_PARAMETERS {

    USHORT Size;

    UCHAR MinorFunction;

    WDF_REQUEST_TYPE Type;

    //
    // The following user parameters are based on the service that is being
    // invoked.  Drivers and file systems can determine which set to use based
    // on the above major and minor function codes.
    //
    union {

        //
        // System service parameters for:  Create
        //

        struct {
            PIO_SECURITY_CONTEXT SecurityContext;
            ULONG Options;
            USHORT POINTER_ALIGNMENT FileAttributes;
            USHORT ShareAccess;
            ULONG POINTER_ALIGNMENT EaLength;
        } Create;


        //
        // System service parameters for:  Read
        //

        struct {
            size_t Length;
            ULONG POINTER_ALIGNMENT Key;
            LONGLONG DeviceOffset;
        } Read;

        //
        // System service parameters for:  Write
        //

        struct {
            size_t Length;
            ULONG POINTER_ALIGNMENT Key;
            LONGLONG DeviceOffset;
        } Write;

        //
        // System service parameters for:  Device Control
        //
        // Note that the user's output buffer is stored in the UserBuffer field
        // and the user's input buffer is stored in the SystemBuffer field.
        //

        struct {
            size_t OutputBufferLength;
            size_t POINTER_ALIGNMENT InputBufferLength;
            ULONG POINTER_ALIGNMENT IoControlCode;
            PVOID Type3InputBuffer;
        } DeviceIoControl;

        struct {
            PVOID Arg1;
            PVOID  Arg2;
            ULONG POINTER_ALIGNMENT IoControlCode;
            PVOID Arg4;
        } Others;

    } Parameters;

} WDF_REQUEST_PARAMETERS, *PWDF_REQUEST_PARAMETERS;

VOID
FORCEINLINE
WDF_REQUEST_PARAMETERS_INIT(
    _Out_ PWDF_REQUEST_PARAMETERS Parameters
    )
{
    RtlZeroMemory(Parameters, sizeof(WDF_REQUEST_PARAMETERS));

    Parameters->Size = sizeof(WDF_REQUEST_PARAMETERS);
}

typedef struct _WDF_USB_REQUEST_COMPLETION_PARAMS *PWDF_USB_REQUEST_COMPLETION_PARAMS;

typedef struct _WDF_REQUEST_COMPLETION_PARAMS {
    //
    // Size of the structure in bytes
    //
    ULONG Size;

    WDF_REQUEST_TYPE Type;

    IO_STATUS_BLOCK IoStatus;

    union {
        struct {
            WDFMEMORY Buffer;
            size_t Length;
            size_t Offset;
        } Write;

        struct {
            WDFMEMORY Buffer;
            size_t Length;
            size_t Offset;
        } Read;

        struct {
            ULONG IoControlCode;

            struct {
                WDFMEMORY Buffer;
                size_t Offset;
            } Input;

            struct {
                WDFMEMORY Buffer;
                size_t Offset;
                size_t Length;
            } Output;
        } Ioctl;

        struct {
            union {
                PVOID Ptr;
                ULONG_PTR Value;
            } Argument1;
            union {
                PVOID Ptr;
                ULONG_PTR Value;
            } Argument2;
            union {
                PVOID Ptr;
                ULONG_PTR Value;
            } Argument3;
            union {
                PVOID Ptr;
                ULONG_PTR Value;
            } Argument4;
        } Others;

        struct {
            PWDF_USB_REQUEST_COMPLETION_PARAMS Completion;
        } Usb;
    } Parameters;

} WDF_REQUEST_COMPLETION_PARAMS, *PWDF_REQUEST_COMPLETION_PARAMS;

VOID
FORCEINLINE
WDF_REQUEST_COMPLETION_PARAMS_INIT(
    _Out_ PWDF_REQUEST_COMPLETION_PARAMS Params
    )
{
    RtlZeroMemory(Params, sizeof(WDF_REQUEST_COMPLETION_PARAMS));
    Params->Size = sizeof(WDF_REQUEST_COMPLETION_PARAMS);
    Params->Type = WdfRequestTypeNoFormat;
}

typedef
_Function_class_(EVT_WDF_REQUEST_COMPLETION_ROUTINE)
_IRQL_requires_same_
VOID
EVT_WDF_REQUEST_COMPLETION_ROUTINE(
    _In_
    WDFREQUEST Request,
    _In_
    WDFIOTARGET Target,
    _In_
    PWDF_REQUEST_COMPLETION_PARAMS Params,
    _In_
    WDFCONTEXT Context
    );

typedef EVT_WDF_REQUEST_COMPLETION_ROUTINE *PFN_WDF_REQUEST_COMPLETION_ROUTINE;

/*++

Routine Description:
    Clears out the internal state of the irp, which includes, but is not limited
    to:
    a)  Any internal allocations for the previously formatted request
    b)  The completion routine and its context
    c)  The request's intended i/o target
    d)  All of the internal IRP's stack locations

Arguments:
    Request - The request to be reused.

    ReuseParams - Parameters controlling the reuse of the request, see comments
        for each field in the structure for usage

Return Value:
    None

  --*/

typedef struct _WDF_REQUEST_REUSE_PARAMS {
    //
    // Size of this structure in bytes
    //
    ULONG Size;

    //
    // Bit field combination of WDF_REQUEST_REUSE_Xxx values
    //
    ULONG Flags;

    //
    // The new status of the request.
    //
    NTSTATUS Status;

    //
    // New PIRP  to be contained in the WDFREQUEST.   Setting a new PIRP value
    // is only valid for WDFREQUESTs created by WdfRequestCreateFromIrp where
    // RequestFreesIrp == FALSE.  No other WDFREQUESTs (presented by the
    // I/O queue for instance) may have their IRPs changed.
    //
    PIRP NewIrp;

} WDF_REQUEST_REUSE_PARAMS, *PWDF_REQUEST_REUSE_PARAMS;

VOID
FORCEINLINE
WDF_REQUEST_REUSE_PARAMS_INIT(
    _Out_ PWDF_REQUEST_REUSE_PARAMS Params,
    _In_ ULONG Flags,
    _In_ NTSTATUS Status
    )
{
    RtlZeroMemory(Params, sizeof(WDF_REQUEST_REUSE_PARAMS));

    Params->Size = sizeof(WDF_REQUEST_REUSE_PARAMS);
    Params->Flags = Flags;
    Params->Status = Status;
}

VOID
FORCEINLINE
WDF_REQUEST_REUSE_PARAMS_SET_NEW_IRP(
    _Inout_ PWDF_REQUEST_REUSE_PARAMS Params,
    _In_ PIRP NewIrp
    )
{
    Params->Flags |= WDF_REQUEST_REUSE_SET_NEW_IRP;
    Params->NewIrp = NewIrp;
}

typedef struct _WDF_REQUEST_SEND_OPTIONS {
    //
    // Size of the structure in bytes
    //
    ULONG Size;

    //
    // Bit field combination of values from the WDF_REQUEST_SEND_OPTIONS_FLAGS
    // enumeration
    //
    ULONG Flags;

    //
    // Valid when WDF_REQUEST_SEND_OPTION_TIMEOUT is set
    //
    LONGLONG Timeout;

} WDF_REQUEST_SEND_OPTIONS, *PWDF_REQUEST_SEND_OPTIONS;

VOID
FORCEINLINE
WDF_REQUEST_SEND_OPTIONS_INIT(
    _Out_ PWDF_REQUEST_SEND_OPTIONS Options,
    _In_ ULONG Flags
    )
{
    RtlZeroMemory(Options, sizeof(WDF_REQUEST_SEND_OPTIONS));
    Options->Size = sizeof(WDF_REQUEST_SEND_OPTIONS);
    Options->Flags = Flags;
}

VOID
FORCEINLINE
WDF_REQUEST_SEND_OPTIONS_SET_TIMEOUT(
    _Inout_ PWDF_REQUEST_SEND_OPTIONS Options,
    _In_ LONGLONG Timeout
    )
{
    Options->Flags |= WDF_REQUEST_SEND_OPTION_TIMEOUT;
    Options->Timeout = Timeout;
}

typedef enum _WDF_REQUEST_FORWARD_OPTIONS_FLAGS {
    WDF_REQUEST_FORWARD_OPTION_SEND_AND_FORGET = 0x00000001
} WDF_REQUEST_FORWARD_OPTIONS_FLAGS;

typedef struct _WDF_REQUEST_FORWARD_OPTIONS {
    //
    // Size of the structure in bytes
    //
    ULONG Size;

    //
    // Bit field combination of values from the WDF_REQUEST_FORWARD_OPTIONS_FLAGS
    // enumeration
    //
    ULONG Flags;  
} WDF_REQUEST_FORWARD_OPTIONS, *PWDF_REQUEST_FORWARD_OPTIONS;


//
// Default REquest forward initialization macro
//
VOID
FORCEINLINE
WDF_REQUEST_FORWARD_OPTIONS_INIT(
    _Out_ PWDF_REQUEST_FORWARD_OPTIONS  ForwardOptions
    )
{
    RtlZeroMemory(ForwardOptions, sizeof(WDF_REQUEST_FORWARD_OPTIONS));

    ForwardOptions->Size = sizeof(WDF_REQUEST_FORWARD_OPTIONS);
    ForwardOptions->Flags |= WDF_REQUEST_FORWARD_OPTION_SEND_AND_FORGET;
}



typedef
_Function_class_(EVT_WDF_REQUEST_IMPERSONATE)
_IRQL_requires_same_
_IRQL_requires_max_(PASSIVE_LEVEL)
VOID
EVT_WDF_REQUEST_IMPERSONATE(
    _In_
    WDFREQUEST Request,
    _In_opt_
    PVOID Context
    );

typedef EVT_WDF_REQUEST_IMPERSONATE *PFN_WDF_REQUEST_IMPERSONATE;


//
// WDF Function: WdfRequestCreate
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTCREATE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES RequestAttributes,
    _In_opt_
    WDFIOTARGET IoTarget,
    _Out_
    WDFREQUEST* Request
    );

// 
// Declarations
// 

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestCreate(
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES RequestAttributes,
    _In_opt_
    WDFIOTARGET IoTarget,
    _Out_
    WDFREQUEST* Request
    )
{
    return ((PFN_WDFREQUESTCREATE) WdfFunctions[WdfRequestCreateTableIndex])(WdfDriverGlobals, RequestAttributes, IoTarget, Request);
}


//
// WDF Function: WdfRequestGetRequestorProcessId
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG
(*PFN_WDFREQUESTGETREQUESTORPROCESSID)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG
FORCEINLINE
WdfRequestGetRequestorProcessId(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTGETREQUESTORPROCESSID) WdfFunctions[WdfRequestGetRequestorProcessIdTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestReuse
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTREUSE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    PWDF_REQUEST_REUSE_PARAMS ReuseParams
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestReuse(
    _In_
    WDFREQUEST Request,
    _In_
    PWDF_REQUEST_REUSE_PARAMS ReuseParams
    )
{
    return ((PFN_WDFREQUESTREUSE) WdfFunctions[WdfRequestReuseTableIndex])(WdfDriverGlobals, Request, ReuseParams);
}


//
// WDF Function: WdfRequestChangeTarget
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTCHANGETARGET)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    WDFIOTARGET IoTarget
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestChangeTarget(
    _In_
    WDFREQUEST Request,
    _In_
    WDFIOTARGET IoTarget
    )
{
    return ((PFN_WDFREQUESTCHANGETARGET) WdfFunctions[WdfRequestChangeTargetTableIndex])(WdfDriverGlobals, Request, IoTarget);
}


//
// WDF Function: WdfRequestFormatRequestUsingCurrentType
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFREQUESTFORMATREQUESTUSINGCURRENTTYPE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfRequestFormatRequestUsingCurrentType(
    _In_
    WDFREQUEST Request
    )
{
    ((PFN_WDFREQUESTFORMATREQUESTUSINGCURRENTTYPE) WdfFunctions[WdfRequestFormatRequestUsingCurrentTypeTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestSend
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
_When_(Options->Flags & WDF_REQUEST_SEND_OPTION_SYNCHRONOUS == 0, _Must_inspect_result_)
WDFAPI
BOOLEAN
(*PFN_WDFREQUESTSEND)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    WDFIOTARGET Target,
    _In_opt_
    PWDF_REQUEST_SEND_OPTIONS Options
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
_When_(Options->Flags & WDF_REQUEST_SEND_OPTION_SYNCHRONOUS == 0, _Must_inspect_result_)
BOOLEAN
FORCEINLINE
WdfRequestSend(
    _In_
    WDFREQUEST Request,
    _In_
    WDFIOTARGET Target,
    _In_opt_
    PWDF_REQUEST_SEND_OPTIONS Options
    )
{
    return ((PFN_WDFREQUESTSEND) WdfFunctions[WdfRequestSendTableIndex])(WdfDriverGlobals, Request, Target, Options);
}


//
// WDF Function: WdfRequestGetStatus
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTGETSTATUS)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestGetStatus(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTGETSTATUS) WdfFunctions[WdfRequestGetStatusTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestMarkCancelable
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFREQUESTMARKCANCELABLE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    PFN_WDF_REQUEST_CANCEL EvtRequestCancel
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfRequestMarkCancelable(
    _In_
    WDFREQUEST Request,
    _In_
    PFN_WDF_REQUEST_CANCEL EvtRequestCancel
    )
{
    ((PFN_WDFREQUESTMARKCANCELABLE) WdfFunctions[WdfRequestMarkCancelableTableIndex])(WdfDriverGlobals, Request, EvtRequestCancel);
}


//
// WDF Function: WdfRequestMarkCancelableEx
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTMARKCANCELABLEEX)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    PFN_WDF_REQUEST_CANCEL EvtRequestCancel
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestMarkCancelableEx(
    _In_
    WDFREQUEST Request,
    _In_
    PFN_WDF_REQUEST_CANCEL EvtRequestCancel
    )
{
    return ((PFN_WDFREQUESTMARKCANCELABLEEX) WdfFunctions[WdfRequestMarkCancelableExTableIndex])(WdfDriverGlobals, Request, EvtRequestCancel);
}


//
// WDF Function: WdfRequestUnmarkCancelable
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTUNMARKCANCELABLE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestUnmarkCancelable(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTUNMARKCANCELABLE) WdfFunctions[WdfRequestUnmarkCancelableTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestIsCanceled
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
BOOLEAN
(*PFN_WDFREQUESTISCANCELED)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
BOOLEAN
FORCEINLINE
WdfRequestIsCanceled(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTISCANCELED) WdfFunctions[WdfRequestIsCanceledTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestCancelSentRequest
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
BOOLEAN
(*PFN_WDFREQUESTCANCELSENTREQUEST)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
BOOLEAN
FORCEINLINE
WdfRequestCancelSentRequest(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTCANCELSENTREQUEST) WdfFunctions[WdfRequestCancelSentRequestTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestIsFrom32BitProcess
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(APC_LEVEL)
WDFAPI
BOOLEAN
(*PFN_WDFREQUESTISFROM32BITPROCESS)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_Must_inspect_result_
_IRQL_requires_max_(APC_LEVEL)
BOOLEAN
FORCEINLINE
WdfRequestIsFrom32BitProcess(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTISFROM32BITPROCESS) WdfFunctions[WdfRequestIsFrom32BitProcessTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestSetCompletionRoutine
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFREQUESTSETCOMPLETIONROUTINE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_opt_
    PFN_WDF_REQUEST_COMPLETION_ROUTINE CompletionRoutine,
    _In_opt_ __drv_aliasesMem
    WDFCONTEXT CompletionContext
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfRequestSetCompletionRoutine(
    _In_
    WDFREQUEST Request,
    _In_opt_
    PFN_WDF_REQUEST_COMPLETION_ROUTINE CompletionRoutine,
    _In_opt_ __drv_aliasesMem
    WDFCONTEXT CompletionContext
    )
{
    ((PFN_WDFREQUESTSETCOMPLETIONROUTINE) WdfFunctions[WdfRequestSetCompletionRoutineTableIndex])(WdfDriverGlobals, Request, CompletionRoutine, CompletionContext);
}


//
// WDF Function: WdfRequestGetCompletionParams
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFREQUESTGETCOMPLETIONPARAMS)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _Out_
    PWDF_REQUEST_COMPLETION_PARAMS Params
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfRequestGetCompletionParams(
    _In_
    WDFREQUEST Request,
    _Out_
    PWDF_REQUEST_COMPLETION_PARAMS Params
    )
{
    ((PFN_WDFREQUESTGETCOMPLETIONPARAMS) WdfFunctions[WdfRequestGetCompletionParamsTableIndex])(WdfDriverGlobals, Request, Params);
}


//
// WDF Function: WdfRequestAllocateTimer
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTALLOCATETIMER)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestAllocateTimer(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTALLOCATETIMER) WdfFunctions[WdfRequestAllocateTimerTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestComplete
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFREQUESTCOMPLETE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    NTSTATUS Status
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfRequestComplete(
    _In_
    WDFREQUEST Request,
    _In_
    NTSTATUS Status
    )
{
    ((PFN_WDFREQUESTCOMPLETE) WdfFunctions[WdfRequestCompleteTableIndex])(WdfDriverGlobals, Request, Status);
}


//
// WDF Function: WdfRequestCompleteWithInformation
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFREQUESTCOMPLETEWITHINFORMATION)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    NTSTATUS Status,
    _In_
    ULONG_PTR Information
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfRequestCompleteWithInformation(
    _In_
    WDFREQUEST Request,
    _In_
    NTSTATUS Status,
    _In_
    ULONG_PTR Information
    )
{
    ((PFN_WDFREQUESTCOMPLETEWITHINFORMATION) WdfFunctions[WdfRequestCompleteWithInformationTableIndex])(WdfDriverGlobals, Request, Status, Information);
}


//
// WDF Function: WdfRequestGetParameters
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFREQUESTGETPARAMETERS)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _Out_
    PWDF_REQUEST_PARAMETERS Parameters
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfRequestGetParameters(
    _In_
    WDFREQUEST Request,
    _Out_
    PWDF_REQUEST_PARAMETERS Parameters
    )
{
    ((PFN_WDFREQUESTGETPARAMETERS) WdfFunctions[WdfRequestGetParametersTableIndex])(WdfDriverGlobals, Request, Parameters);
}


//
// WDF Function: WdfRequestRetrieveInputMemory
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTRETRIEVEINPUTMEMORY)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _Out_
    WDFMEMORY* Memory
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestRetrieveInputMemory(
    _In_
    WDFREQUEST Request,
    _Out_
    WDFMEMORY* Memory
    )
{
    return ((PFN_WDFREQUESTRETRIEVEINPUTMEMORY) WdfFunctions[WdfRequestRetrieveInputMemoryTableIndex])(WdfDriverGlobals, Request, Memory);
}


//
// WDF Function: WdfRequestRetrieveOutputMemory
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTRETRIEVEOUTPUTMEMORY)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _Out_
    WDFMEMORY* Memory
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestRetrieveOutputMemory(
    _In_
    WDFREQUEST Request,
    _Out_
    WDFMEMORY* Memory
    )
{
    return ((PFN_WDFREQUESTRETRIEVEOUTPUTMEMORY) WdfFunctions[WdfRequestRetrieveOutputMemoryTableIndex])(WdfDriverGlobals, Request, Memory);
}


//
// WDF Function: WdfRequestRetrieveInputBuffer
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTRETRIEVEINPUTBUFFER)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    size_t MinimumRequiredLength,
    _Outptr_result_bytebuffer_(*Length)
    PVOID* Buffer,
    _Out_opt_
    size_t* Length
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestRetrieveInputBuffer(
    _In_
    WDFREQUEST Request,
    _In_
    size_t MinimumRequiredLength,
    _Outptr_result_bytebuffer_(*Length)
    PVOID* Buffer,
    _Out_opt_
    size_t* Length
    )
{
    return ((PFN_WDFREQUESTRETRIEVEINPUTBUFFER) WdfFunctions[WdfRequestRetrieveInputBufferTableIndex])(WdfDriverGlobals, Request, MinimumRequiredLength, Buffer, Length);
}


//
// WDF Function: WdfRequestRetrieveOutputBuffer
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTRETRIEVEOUTPUTBUFFER)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    size_t MinimumRequiredSize,
    _Outptr_result_bytebuffer_(*Length)
    PVOID* Buffer,
    _Out_opt_
    size_t* Length
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestRetrieveOutputBuffer(
    _In_
    WDFREQUEST Request,
    _In_
    size_t MinimumRequiredSize,
    _Outptr_result_bytebuffer_(*Length)
    PVOID* Buffer,
    _Out_opt_
    size_t* Length
    )
{
    return ((PFN_WDFREQUESTRETRIEVEOUTPUTBUFFER) WdfFunctions[WdfRequestRetrieveOutputBufferTableIndex])(WdfDriverGlobals, Request, MinimumRequiredSize, Buffer, Length);
}


//
// WDF Function: WdfRequestSetInformation
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFREQUESTSETINFORMATION)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    ULONG_PTR Information
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfRequestSetInformation(
    _In_
    WDFREQUEST Request,
    _In_
    ULONG_PTR Information
    )
{
    ((PFN_WDFREQUESTSETINFORMATION) WdfFunctions[WdfRequestSetInformationTableIndex])(WdfDriverGlobals, Request, Information);
}


//
// WDF Function: WdfRequestGetInformation
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
ULONG_PTR
(*PFN_WDFREQUESTGETINFORMATION)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
ULONG_PTR
FORCEINLINE
WdfRequestGetInformation(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTGETINFORMATION) WdfFunctions[WdfRequestGetInformationTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestGetFileObject
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
WDFFILEOBJECT
(*PFN_WDFREQUESTGETFILEOBJECT)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
WDFFILEOBJECT
FORCEINLINE
WdfRequestGetFileObject(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTGETFILEOBJECT) WdfFunctions[WdfRequestGetFileObjectTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestGetRequestorMode
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
KPROCESSOR_MODE
(*PFN_WDFREQUESTGETREQUESTORMODE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
KPROCESSOR_MODE
FORCEINLINE
WdfRequestGetRequestorMode(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTGETREQUESTORMODE) WdfFunctions[WdfRequestGetRequestorModeTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestForwardToIoQueue
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTFORWARDTOIOQUEUE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    WDFQUEUE DestinationQueue
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestForwardToIoQueue(
    _In_
    WDFREQUEST Request,
    _In_
    WDFQUEUE DestinationQueue
    )
{
    return ((PFN_WDFREQUESTFORWARDTOIOQUEUE) WdfFunctions[WdfRequestForwardToIoQueueTableIndex])(WdfDriverGlobals, Request, DestinationQueue);
}


//
// WDF Function: WdfRequestGetIoQueue
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
WDFQUEUE
(*PFN_WDFREQUESTGETIOQUEUE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
WDFQUEUE
FORCEINLINE
WdfRequestGetIoQueue(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTGETIOQUEUE) WdfFunctions[WdfRequestGetIoQueueTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestRequeue
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTREQUEUE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestRequeue(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTREQUEUE) WdfFunctions[WdfRequestRequeueTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestStopAcknowledge
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFREQUESTSTOPACKNOWLEDGE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    BOOLEAN Requeue
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfRequestStopAcknowledge(
    _In_
    WDFREQUEST Request,
    _In_
    BOOLEAN Requeue
    )
{
    ((PFN_WDFREQUESTSTOPACKNOWLEDGE) WdfFunctions[WdfRequestStopAcknowledgeTableIndex])(WdfDriverGlobals, Request, Requeue);
}


//
// WDF Function: WdfRequestImpersonate
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTIMPERSONATE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel,
    _In_
    PFN_WDF_REQUEST_IMPERSONATE EvtRequestImpersonate,
    _In_opt_
    PVOID Context
    );

_Must_inspect_result_
_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestImpersonate(
    _In_
    WDFREQUEST Request,
    _In_
    SECURITY_IMPERSONATION_LEVEL ImpersonationLevel,
    _In_
    PFN_WDF_REQUEST_IMPERSONATE EvtRequestImpersonate,
    _In_opt_
    PVOID Context
    )
{
    return ((PFN_WDFREQUESTIMPERSONATE) WdfFunctions[WdfRequestImpersonateTableIndex])(WdfDriverGlobals, Request, ImpersonationLevel, EvtRequestImpersonate, Context);
}


//
// WDF Function: WdfRequestIsFromUserModeDriver
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
BOOLEAN
(*PFN_WDFREQUESTISFROMUSERMODEDRIVER)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
BOOLEAN
FORCEINLINE
WdfRequestIsFromUserModeDriver(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTISFROMUSERMODEDRIVER) WdfFunctions[WdfRequestIsFromUserModeDriverTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestSetUserModeDriverInitiatedIo
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
VOID
(*PFN_WDFREQUESTSETUSERMODEDRIVERINITIATEDIO)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    BOOLEAN IsUserModeDriverInitiated
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
VOID
FORCEINLINE
WdfRequestSetUserModeDriverInitiatedIo(
    _In_
    WDFREQUEST Request,
    _In_
    BOOLEAN IsUserModeDriverInitiated
    )
{
    ((PFN_WDFREQUESTSETUSERMODEDRIVERINITIATEDIO) WdfFunctions[WdfRequestSetUserModeDriverInitiatedIoTableIndex])(WdfDriverGlobals, Request, IsUserModeDriverInitiated);
}


//
// WDF Function: WdfRequestGetUserModeDriverInitiatedIo
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
BOOLEAN
(*PFN_WDFREQUESTGETUSERMODEDRIVERINITIATEDIO)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
BOOLEAN
FORCEINLINE
WdfRequestGetUserModeDriverInitiatedIo(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTGETUSERMODEDRIVERINITIATEDIO) WdfFunctions[WdfRequestGetUserModeDriverInitiatedIoTableIndex])(WdfDriverGlobals, Request);
}


//
// WDF Function: WdfRequestSetActivityId
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
VOID
(*PFN_WDFREQUESTSETACTIVITYID)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _In_
    LPGUID ActivityId
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
VOID
FORCEINLINE
WdfRequestSetActivityId(
    _In_
    WDFREQUEST Request,
    _In_
    LPGUID ActivityId
    )
{
    ((PFN_WDFREQUESTSETACTIVITYID) WdfFunctions[WdfRequestSetActivityIdTableIndex])(WdfDriverGlobals, Request, ActivityId);
}


//
// WDF Function: WdfRequestRetrieveActivityId
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFREQUESTRETRIEVEACTIVITYID)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request,
    _Out_
    LPGUID ActivityId
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
NTSTATUS
FORCEINLINE
WdfRequestRetrieveActivityId(
    _In_
    WDFREQUEST Request,
    _Out_
    LPGUID ActivityId
    )
{
    return ((PFN_WDFREQUESTRETRIEVEACTIVITYID) WdfFunctions[WdfRequestRetrieveActivityIdTableIndex])(WdfDriverGlobals, Request, ActivityId);
}


//
// WDF Function: WdfRequestGetEffectiveIoType
//
typedef
_IRQL_requires_max_(PASSIVE_LEVEL)
WDFAPI
WDF_DEVICE_IO_TYPE
(*PFN_WDFREQUESTGETEFFECTIVEIOTYPE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFREQUEST Request
    );

_IRQL_requires_max_(PASSIVE_LEVEL)
WDF_DEVICE_IO_TYPE
FORCEINLINE
WdfRequestGetEffectiveIoType(
    _In_
    WDFREQUEST Request
    )
{
    return ((PFN_WDFREQUESTGETEFFECTIVEIOTYPE) WdfFunctions[WdfRequestGetEffectiveIoTypeTableIndex])(WdfDriverGlobals, Request);
}

WDF_EXTERN_C_END

