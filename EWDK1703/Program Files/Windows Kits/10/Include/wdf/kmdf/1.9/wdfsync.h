/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

_WdfVersionBuild_

Module Name:

    wdfsync.h

Abstract:

    This module contains contains the Windows Driver Framework synchronization
    DDIs.

Environment:

    kernel mode only

Revision History:


--*/

#ifndef _WDFSYNC_1_9_H_
#define _WDFSYNC_1_9_H_



#if (NTDDI_VERSION >= NTDDI_WIN2K)



//
// WDF Function: WdfObjectAcquireLock
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFOBJECTACQUIRELOCK)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    _Requires_lock_not_held_(_Curr_)
    _Acquires_lock_(_Curr_)
    WDFOBJECT Object
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfObjectAcquireLock(
    _In_
    _Requires_lock_not_held_(_Curr_)
    _Acquires_lock_(_Curr_)
    WDFOBJECT Object
    )
{
    ((PFN_WDFOBJECTACQUIRELOCK) WdfFunctions[WdfObjectAcquireLockTableIndex])(WdfDriverGlobals, Object);
}

//
// WDF Function: WdfObjectReleaseLock
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFOBJECTRELEASELOCK)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    _Requires_lock_held_(_Curr_)
    _Releases_lock_(_Curr_)
    WDFOBJECT Object
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfObjectReleaseLock(
    _In_
    _Requires_lock_held_(_Curr_)
    _Releases_lock_(_Curr_)
    WDFOBJECT Object
    )
{
    ((PFN_WDFOBJECTRELEASELOCK) WdfFunctions[WdfObjectReleaseLockTableIndex])(WdfDriverGlobals, Object);
}

//
// WDF Function: WdfWaitLockCreate
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFWAITLOCKCREATE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES LockAttributes,
    _Out_
    WDFWAITLOCK* Lock
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfWaitLockCreate(
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES LockAttributes,
    _Out_
    WDFWAITLOCK* Lock
    )
{
    return ((PFN_WDFWAITLOCKCREATE) WdfFunctions[WdfWaitLockCreateTableIndex])(WdfDriverGlobals, LockAttributes, Lock);
}

//
// WDF Function: WdfWaitLockAcquire
//
typedef
_When_(Timeout != 0, _Must_inspect_result_)
_When_(Timeout == 0, _IRQL_requires_max_(PASSIVE_LEVEL))
_When_(Timeout != 0 && *Timeout == 0, _IRQL_requires_max_(DISPATCH_LEVEL))
_When_(Timeout != 0 && *Timeout != 0, _IRQL_requires_max_(PASSIVE_LEVEL))
WDFAPI
NTSTATUS
(*PFN_WDFWAITLOCKACQUIRE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFWAITLOCK Lock,
    _In_opt_
    PLONGLONG Timeout
    );

_When_(Timeout != 0, _Must_inspect_result_)
_When_(Timeout == 0, _IRQL_requires_max_(PASSIVE_LEVEL))
_When_(Timeout != 0 && *Timeout == 0, _IRQL_requires_max_(DISPATCH_LEVEL))
_When_(Timeout != 0 && *Timeout != 0, _IRQL_requires_max_(PASSIVE_LEVEL))
NTSTATUS
FORCEINLINE
WdfWaitLockAcquire(
    _In_
    WDFWAITLOCK Lock,
    _In_opt_
    PLONGLONG Timeout
    )
{
    return ((PFN_WDFWAITLOCKACQUIRE) WdfFunctions[WdfWaitLockAcquireTableIndex])(WdfDriverGlobals, Lock, Timeout);
}

//
// WDF Function: WdfWaitLockRelease
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFWAITLOCKRELEASE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    WDFWAITLOCK Lock
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfWaitLockRelease(
    _In_
    WDFWAITLOCK Lock
    )
{
    ((PFN_WDFWAITLOCKRELEASE) WdfFunctions[WdfWaitLockReleaseTableIndex])(WdfDriverGlobals, Lock);
}

//
// WDF Function: WdfSpinLockCreate
//
typedef
_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
NTSTATUS
(*PFN_WDFSPINLOCKCREATE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES SpinLockAttributes,
    _Out_
    WDFSPINLOCK* SpinLock
    );

_Must_inspect_result_
_IRQL_requires_max_(DISPATCH_LEVEL)
NTSTATUS
FORCEINLINE
WdfSpinLockCreate(
    _In_opt_
    PWDF_OBJECT_ATTRIBUTES SpinLockAttributes,
    _Out_
    WDFSPINLOCK* SpinLock
    )
{
    return ((PFN_WDFSPINLOCKCREATE) WdfFunctions[WdfSpinLockCreateTableIndex])(WdfDriverGlobals, SpinLockAttributes, SpinLock);
}

//
// WDF Function: WdfSpinLockAcquire
//
typedef
_IRQL_raises_(DISPATCH_LEVEL)
_IRQL_requires_max_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFSPINLOCKACQUIRE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    _IRQL_saves_
    _Requires_lock_not_held_(_Curr_)
    _Acquires_lock_(_Curr_)
    WDFSPINLOCK SpinLock
    );

_IRQL_raises_(DISPATCH_LEVEL)
_IRQL_requires_max_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfSpinLockAcquire(
    _In_
    _IRQL_saves_
    _Requires_lock_not_held_(_Curr_)
    _Acquires_lock_(_Curr_)
    WDFSPINLOCK SpinLock
    )
{
    ((PFN_WDFSPINLOCKACQUIRE) WdfFunctions[WdfSpinLockAcquireTableIndex])(WdfDriverGlobals, SpinLock);
}

//
// WDF Function: WdfSpinLockRelease
//
typedef
_IRQL_requires_max_(DISPATCH_LEVEL)
_IRQL_requires_min_(DISPATCH_LEVEL)
WDFAPI
VOID
(*PFN_WDFSPINLOCKRELEASE)(
    _In_
    PWDF_DRIVER_GLOBALS DriverGlobals,
    _In_
    _IRQL_restores_
    _Requires_lock_held_(_Curr_)
    _Releases_lock_(_Curr_)
    WDFSPINLOCK SpinLock
    );

_IRQL_requires_max_(DISPATCH_LEVEL)
_IRQL_requires_min_(DISPATCH_LEVEL)
VOID
FORCEINLINE
WdfSpinLockRelease(
    _In_
    _IRQL_restores_
    _Requires_lock_held_(_Curr_)
    _Releases_lock_(_Curr_)
    WDFSPINLOCK SpinLock
    )
{
    ((PFN_WDFSPINLOCKRELEASE) WdfFunctions[WdfSpinLockReleaseTableIndex])(WdfDriverGlobals, SpinLock);
}



#endif // (NTDDI_VERSION >= NTDDI_WIN2K)


#endif // _WDFSYNC_1_9_H_
