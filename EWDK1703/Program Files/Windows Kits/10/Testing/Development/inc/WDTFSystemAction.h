

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 8.01.0622 */
/* @@MIDL_FILE_HEADING(  ) */



/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 500
#endif

/* verify that the <rpcsal.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCSAL_H_VERSION__
#define __REQUIRED_RPCSAL_H_VERSION__ 100
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif /* __RPCNDR_H_VERSION__ */


#ifndef __wdtfsystemaction_h__
#define __wdtfsystemaction_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IConsole_FWD_DEFINED__
#define __IConsole_FWD_DEFINED__
typedef interface IConsole IConsole;

#endif 	/* __IConsole_FWD_DEFINED__ */


#ifndef __IWDTFSystemAction2_FWD_DEFINED__
#define __IWDTFSystemAction2_FWD_DEFINED__
typedef interface IWDTFSystemAction2 IWDTFSystemAction2;

#endif 	/* __IWDTFSystemAction2_FWD_DEFINED__ */


#ifndef __IWDTFInternalSystemAction2_FWD_DEFINED__
#define __IWDTFInternalSystemAction2_FWD_DEFINED__
typedef interface IWDTFInternalSystemAction2 IWDTFInternalSystemAction2;

#endif 	/* __IWDTFInternalSystemAction2_FWD_DEFINED__ */


#ifndef __Console_FWD_DEFINED__
#define __Console_FWD_DEFINED__

#ifdef __cplusplus
typedef class Console Console;
#else
typedef struct Console Console;
#endif /* __cplusplus */

#endif 	/* __Console_FWD_DEFINED__ */


#ifndef __WDTFSystemAction2_FWD_DEFINED__
#define __WDTFSystemAction2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFSystemAction2 WDTFSystemAction2;
#else
typedef struct WDTFSystemAction2 WDTFSystemAction2;
#endif /* __cplusplus */

#endif 	/* __WDTFSystemAction2_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 



#ifndef __ConsoleLib_LIBRARY_DEFINED__
#define __ConsoleLib_LIBRARY_DEFINED__

/* library ConsoleLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_ConsoleLib;

#ifndef __IConsole_INTERFACE_DEFINED__
#define __IConsole_INTERFACE_DEFINED__

/* interface IConsole */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IConsole;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("B158F4C0-FF92-43E4-8941-6BC686B88199")
    IConsole : public IAction
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Lock( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE LogOff( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE CriticalLogOff( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Shutdown( 
            /* [in] */ LONG TimeOutInSeconds) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE CriticalShutdown( 
            /* [in] */ LONG TimeOutInSeconds) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Reboot( 
            /* [in] */ LONG TimeOutInSeconds) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE CriticalReboot( 
            /* [in] */ LONG TimeOutInSeconds) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE AbortShutdown( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetWakeTimer( 
            LONG WakeTimeInSec) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Standby( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE CriticalStandby( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Hibernate( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE CriticalHibernate( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Sleep( 
            /* [in] */ LONG WakeTimeInSeconds,
            /* [in] */ LONG SleepState) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SleepEx( 
            /* [in] */ LONG WakeTimeInSeconds,
            /* [in] */ LONG SleepState,
            /* [in] */ VARIANT_BOOL bCritical) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE QuickSleep( 
            /* [in] */ LONG SleepState) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE ResetDisplayIdleTimer( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE ResetSystemIdleTimer( void) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_PasswordProtectScreenSaver( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_PasswordProtectScreenSaver( 
            /* [in] */ VARIANT_BOOL bNewVal) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_PasswordProtectSleep( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_PasswordProtectSleep( 
            /* [in] */ VARIANT_BOOL bNewVal) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_DisableWakeEvents( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_DisableWakeEvents( 
            /* [in] */ VARIANT_BOOL bNewVal) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_ResetOnHibernate( 
            /* [in] */ VARIANT_BOOL bNewVal) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_DozeAfterAutoWake( 
            /* [in] */ VARIANT_BOOL bNewVal) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_DisplayRequired( 
            /* [in] */ VARIANT_BOOL bNewVal) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_SystemRequired( 
            /* [in] */ VARIANT_BOOL bNewVal) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsStandbySupported( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsS1Supported( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsS2Supported( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsS3Supported( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsHibernateSupported( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsHybridSleepSupported( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetFirstSleepState( 
            /* [retval][out] */ __RPC__out LONG *pSleepState) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetNextSleepState( 
            /* [retval][out] */ __RPC__out LONG *pSleepState) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetSleepStateInfo( 
            /* [in] */ LONG WakeTimeInMinutes,
            /* [in] */ LONG SleepState) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetSleepStateInfoEx( 
            /* [in] */ LONG WakeTimeInSeconds,
            /* [in] */ LONG SleepState) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetSleepState( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EnableAutoWakeIfPossible( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE IsRtcWakeSupported( 
            /* [in] */ LONG SleepState,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DebugBreak( 
            /* [in] */ __RPC__in BSTR MsgReason) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DebugBreakIfPresent( 
            /* [in] */ __RPC__in BSTR MsgReason) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DebugPrint( 
            /* [in] */ __RPC__in BSTR Msg) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SimulateUserKeyPress( void) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_WakeTimerReason( 
            /* [in] */ __RPC__in BSTR MsgReason) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_PowerRequestReason( 
            /* [in] */ __RPC__in BSTR MsgReason) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IConsoleVtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IConsole * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IConsole * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IConsole * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IConsole * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IConsole * This,
            /* [in][idldescattr] */ signed long dispidMember,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [in][idldescattr] */ unsigned short wFlags,
            /* [in][idldescattr] */ __RPC__in struct DISPPARAMS *pdispparams,
            /* [out][idldescattr] */ __RPC__out VARIANT *pvarResult,
            /* [out][idldescattr] */ __RPC__out struct EXCEPINFO *pexcepinfo,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *puArgErr,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IConsole * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IConsole * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Lock )( 
            __RPC__in IConsole * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *LogOff )( 
            __RPC__in IConsole * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *CriticalLogOff )( 
            __RPC__in IConsole * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            __RPC__in IConsole * This,
            /* [in] */ LONG TimeOutInSeconds);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *CriticalShutdown )( 
            __RPC__in IConsole * This,
            /* [in] */ LONG TimeOutInSeconds);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Reboot )( 
            __RPC__in IConsole * This,
            /* [in] */ LONG TimeOutInSeconds);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *CriticalReboot )( 
            __RPC__in IConsole * This,
            /* [in] */ LONG TimeOutInSeconds);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *AbortShutdown )( 
            __RPC__in IConsole * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetWakeTimer )( 
            __RPC__in IConsole * This,
            LONG WakeTimeInSec);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Standby )( 
            __RPC__in IConsole * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *CriticalStandby )( 
            __RPC__in IConsole * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Hibernate )( 
            __RPC__in IConsole * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *CriticalHibernate )( 
            __RPC__in IConsole * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            __RPC__in IConsole * This,
            /* [in] */ LONG WakeTimeInSeconds,
            /* [in] */ LONG SleepState);
        
        HRESULT ( STDMETHODCALLTYPE *SleepEx )( 
            __RPC__in IConsole * This,
            /* [in] */ LONG WakeTimeInSeconds,
            /* [in] */ LONG SleepState,
            /* [in] */ VARIANT_BOOL bCritical);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *QuickSleep )( 
            __RPC__in IConsole * This,
            /* [in] */ LONG SleepState);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ResetDisplayIdleTimer )( 
            __RPC__in IConsole * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ResetSystemIdleTimer )( 
            __RPC__in IConsole * This);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PasswordProtectScreenSaver )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PasswordProtectScreenSaver )( 
            __RPC__in IConsole * This,
            /* [in] */ VARIANT_BOOL bNewVal);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_PasswordProtectSleep )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PasswordProtectSleep )( 
            __RPC__in IConsole * This,
            /* [in] */ VARIANT_BOOL bNewVal);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DisableWakeEvents )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_DisableWakeEvents )( 
            __RPC__in IConsole * This,
            /* [in] */ VARIANT_BOOL bNewVal);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_ResetOnHibernate )( 
            __RPC__in IConsole * This,
            /* [in] */ VARIANT_BOOL bNewVal);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_DozeAfterAutoWake )( 
            __RPC__in IConsole * This,
            /* [in] */ VARIANT_BOOL bNewVal);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_DisplayRequired )( 
            __RPC__in IConsole * This,
            /* [in] */ VARIANT_BOOL bNewVal);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_SystemRequired )( 
            __RPC__in IConsole * This,
            /* [in] */ VARIANT_BOOL bNewVal);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsStandbySupported )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsS1Supported )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsS2Supported )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsS3Supported )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsHibernateSupported )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsHybridSleepSupported )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetFirstSleepState )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out LONG *pSleepState);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetNextSleepState )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out LONG *pSleepState);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetSleepStateInfo )( 
            __RPC__in IConsole * This,
            /* [in] */ LONG WakeTimeInMinutes,
            /* [in] */ LONG SleepState);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetSleepStateInfoEx )( 
            __RPC__in IConsole * This,
            /* [in] */ LONG WakeTimeInSeconds,
            /* [in] */ LONG SleepState);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetSleepState )( 
            __RPC__in IConsole * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EnableAutoWakeIfPossible )( 
            __RPC__in IConsole * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsRtcWakeSupported )( 
            __RPC__in IConsole * This,
            /* [in] */ LONG SleepState,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DebugBreak )( 
            __RPC__in IConsole * This,
            /* [in] */ __RPC__in BSTR MsgReason);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DebugBreakIfPresent )( 
            __RPC__in IConsole * This,
            /* [in] */ __RPC__in BSTR MsgReason);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DebugPrint )( 
            __RPC__in IConsole * This,
            /* [in] */ __RPC__in BSTR Msg);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SimulateUserKeyPress )( 
            __RPC__in IConsole * This);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_WakeTimerReason )( 
            __RPC__in IConsole * This,
            /* [in] */ __RPC__in BSTR MsgReason);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_PowerRequestReason )( 
            __RPC__in IConsole * This,
            /* [in] */ __RPC__in BSTR MsgReason);
        
        END_INTERFACE
    } IConsoleVtbl;

    interface IConsole
    {
        CONST_VTBL struct IConsoleVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IConsole_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IConsole_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IConsole_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IConsole_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IConsole_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IConsole_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IConsole_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IConsole_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IConsole_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 


#define IConsole_Lock(This)	\
    ( (This)->lpVtbl -> Lock(This) ) 

#define IConsole_LogOff(This)	\
    ( (This)->lpVtbl -> LogOff(This) ) 

#define IConsole_CriticalLogOff(This)	\
    ( (This)->lpVtbl -> CriticalLogOff(This) ) 

#define IConsole_Shutdown(This,TimeOutInSeconds)	\
    ( (This)->lpVtbl -> Shutdown(This,TimeOutInSeconds) ) 

#define IConsole_CriticalShutdown(This,TimeOutInSeconds)	\
    ( (This)->lpVtbl -> CriticalShutdown(This,TimeOutInSeconds) ) 

#define IConsole_Reboot(This,TimeOutInSeconds)	\
    ( (This)->lpVtbl -> Reboot(This,TimeOutInSeconds) ) 

#define IConsole_CriticalReboot(This,TimeOutInSeconds)	\
    ( (This)->lpVtbl -> CriticalReboot(This,TimeOutInSeconds) ) 

#define IConsole_AbortShutdown(This)	\
    ( (This)->lpVtbl -> AbortShutdown(This) ) 

#define IConsole_SetWakeTimer(This,WakeTimeInSec)	\
    ( (This)->lpVtbl -> SetWakeTimer(This,WakeTimeInSec) ) 

#define IConsole_Standby(This)	\
    ( (This)->lpVtbl -> Standby(This) ) 

#define IConsole_CriticalStandby(This)	\
    ( (This)->lpVtbl -> CriticalStandby(This) ) 

#define IConsole_Hibernate(This)	\
    ( (This)->lpVtbl -> Hibernate(This) ) 

#define IConsole_CriticalHibernate(This)	\
    ( (This)->lpVtbl -> CriticalHibernate(This) ) 

#define IConsole_Sleep(This,WakeTimeInSeconds,SleepState)	\
    ( (This)->lpVtbl -> Sleep(This,WakeTimeInSeconds,SleepState) ) 

#define IConsole_SleepEx(This,WakeTimeInSeconds,SleepState,bCritical)	\
    ( (This)->lpVtbl -> SleepEx(This,WakeTimeInSeconds,SleepState,bCritical) ) 

#define IConsole_QuickSleep(This,SleepState)	\
    ( (This)->lpVtbl -> QuickSleep(This,SleepState) ) 

#define IConsole_ResetDisplayIdleTimer(This)	\
    ( (This)->lpVtbl -> ResetDisplayIdleTimer(This) ) 

#define IConsole_ResetSystemIdleTimer(This)	\
    ( (This)->lpVtbl -> ResetSystemIdleTimer(This) ) 

#define IConsole_get_PasswordProtectScreenSaver(This,pVal)	\
    ( (This)->lpVtbl -> get_PasswordProtectScreenSaver(This,pVal) ) 

#define IConsole_put_PasswordProtectScreenSaver(This,bNewVal)	\
    ( (This)->lpVtbl -> put_PasswordProtectScreenSaver(This,bNewVal) ) 

#define IConsole_get_PasswordProtectSleep(This,pVal)	\
    ( (This)->lpVtbl -> get_PasswordProtectSleep(This,pVal) ) 

#define IConsole_put_PasswordProtectSleep(This,bNewVal)	\
    ( (This)->lpVtbl -> put_PasswordProtectSleep(This,bNewVal) ) 

#define IConsole_get_DisableWakeEvents(This,pVal)	\
    ( (This)->lpVtbl -> get_DisableWakeEvents(This,pVal) ) 

#define IConsole_put_DisableWakeEvents(This,bNewVal)	\
    ( (This)->lpVtbl -> put_DisableWakeEvents(This,bNewVal) ) 

#define IConsole_put_ResetOnHibernate(This,bNewVal)	\
    ( (This)->lpVtbl -> put_ResetOnHibernate(This,bNewVal) ) 

#define IConsole_put_DozeAfterAutoWake(This,bNewVal)	\
    ( (This)->lpVtbl -> put_DozeAfterAutoWake(This,bNewVal) ) 

#define IConsole_put_DisplayRequired(This,bNewVal)	\
    ( (This)->lpVtbl -> put_DisplayRequired(This,bNewVal) ) 

#define IConsole_put_SystemRequired(This,bNewVal)	\
    ( (This)->lpVtbl -> put_SystemRequired(This,bNewVal) ) 

#define IConsole_get_IsStandbySupported(This,pVal)	\
    ( (This)->lpVtbl -> get_IsStandbySupported(This,pVal) ) 

#define IConsole_get_IsS1Supported(This,pVal)	\
    ( (This)->lpVtbl -> get_IsS1Supported(This,pVal) ) 

#define IConsole_get_IsS2Supported(This,pVal)	\
    ( (This)->lpVtbl -> get_IsS2Supported(This,pVal) ) 

#define IConsole_get_IsS3Supported(This,pVal)	\
    ( (This)->lpVtbl -> get_IsS3Supported(This,pVal) ) 

#define IConsole_get_IsHibernateSupported(This,pVal)	\
    ( (This)->lpVtbl -> get_IsHibernateSupported(This,pVal) ) 

#define IConsole_get_IsHybridSleepSupported(This,pVal)	\
    ( (This)->lpVtbl -> get_IsHybridSleepSupported(This,pVal) ) 

#define IConsole_GetFirstSleepState(This,pSleepState)	\
    ( (This)->lpVtbl -> GetFirstSleepState(This,pSleepState) ) 

#define IConsole_GetNextSleepState(This,pSleepState)	\
    ( (This)->lpVtbl -> GetNextSleepState(This,pSleepState) ) 

#define IConsole_SetSleepStateInfo(This,WakeTimeInMinutes,SleepState)	\
    ( (This)->lpVtbl -> SetSleepStateInfo(This,WakeTimeInMinutes,SleepState) ) 

#define IConsole_SetSleepStateInfoEx(This,WakeTimeInSeconds,SleepState)	\
    ( (This)->lpVtbl -> SetSleepStateInfoEx(This,WakeTimeInSeconds,SleepState) ) 

#define IConsole_SetSleepState(This)	\
    ( (This)->lpVtbl -> SetSleepState(This) ) 

#define IConsole_EnableAutoWakeIfPossible(This,pVal)	\
    ( (This)->lpVtbl -> EnableAutoWakeIfPossible(This,pVal) ) 

#define IConsole_IsRtcWakeSupported(This,SleepState,pVal)	\
    ( (This)->lpVtbl -> IsRtcWakeSupported(This,SleepState,pVal) ) 

#define IConsole_DebugBreak(This,MsgReason)	\
    ( (This)->lpVtbl -> DebugBreak(This,MsgReason) ) 

#define IConsole_DebugBreakIfPresent(This,MsgReason)	\
    ( (This)->lpVtbl -> DebugBreakIfPresent(This,MsgReason) ) 

#define IConsole_DebugPrint(This,Msg)	\
    ( (This)->lpVtbl -> DebugPrint(This,Msg) ) 

#define IConsole_SimulateUserKeyPress(This)	\
    ( (This)->lpVtbl -> SimulateUserKeyPress(This) ) 

#define IConsole_put_WakeTimerReason(This,MsgReason)	\
    ( (This)->lpVtbl -> put_WakeTimerReason(This,MsgReason) ) 

#define IConsole_put_PowerRequestReason(This,MsgReason)	\
    ( (This)->lpVtbl -> put_PowerRequestReason(This,MsgReason) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IConsole_INTERFACE_DEFINED__ */


#ifndef __IWDTFSystemAction2_INTERFACE_DEFINED__
#define __IWDTFSystemAction2_INTERFACE_DEFINED__

/* interface IWDTFSystemAction2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFSystemAction2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("9B04B9DD-F15C-42F1-A227-4BE9D29AFEE1")
    IWDTFSystemAction2 : public IWDTFAction2
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetFirstSleepState( 
            /* [retval][out] */ __RPC__out LONG *pnSleepState) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetNextSleepState( 
            /* [retval][out] */ __RPC__out LONG *pnSleepState) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Sleep( 
            /* [in] */ LONG nSleepState) = 0;
        
        virtual /* [propput] */ HRESULT STDMETHODCALLTYPE put_SleepWakeTimeInSeconds( 
            /* [in] */ LONG nWakeTimeInSeconds) = 0;
        
        virtual /* [propget] */ HRESULT STDMETHODCALLTYPE get_SleepWakeTimeInSeconds( 
            /* [retval][out] */ __RPC__out LONG *pnWakeTimeInSeconds) = 0;
        
        virtual /* [propput] */ HRESULT STDMETHODCALLTYPE put_Critical( 
            /* [in] */ VARIANT_BOOL bCritical) = 0;
        
        virtual /* [propget] */ HRESULT STDMETHODCALLTYPE get_Critical( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbCritical) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RebootRestart( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RebootRestartWithContext( 
            /* [in] */ __RPC__in BSTR psContextName) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_IsRestarted( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsRestarted) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE IsRestartedWithContext( 
            /* [in] */ __RPC__in BSTR psContextName,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsRestarted) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetRestartedContextData( 
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *ppsContextData) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE HasRestartedContextData( 
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetRestartContextData( 
            /* [in] */ __RPC__in BSTR Tag,
            /* [in] */ __RPC__in BSTR psContextData) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_RestartCount( 
            /* [retval][out] */ __RPC__out LONG *pnRestartCount) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ConnectedStandby( 
            /* [in] */ LONG TimeInMs) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EnterConnectedStandby( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ExitConnectedStandby( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE PowerTracingStartByFile( 
            /* [in] */ __RPC__in BSTR EventFilePath) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE PowerTracingStart( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE PowerTracingEnd( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE PowerAnalyzeTraceByFile( 
            /* [in] */ __RPC__in BSTR EventFilePath) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE PowerAnalyzeTraceByFileByTime( 
            /* [in] */ __RPC__in BSTR EventFilePath,
            /* [in] */ ULONGLONG ullAnalyzeStartTimeStamp,
            /* [in] */ ULONGLONG ullAnalyzeStopTimeStamp) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFSystemAction2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in][idldescattr] */ signed long dispidMember,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [in][idldescattr] */ unsigned short wFlags,
            /* [in][idldescattr] */ __RPC__in struct DISPPARAMS *pdispparams,
            /* [out][idldescattr] */ __RPC__out VARIANT *pvarResult,
            /* [out][idldescattr] */ __RPC__out struct EXCEPINFO *pexcepinfo,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *puArgErr,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetFirstSleepState )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out LONG *pnSleepState);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetNextSleepState )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out LONG *pnSleepState);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ LONG nSleepState);
        
        /* [propput] */ HRESULT ( STDMETHODCALLTYPE *put_SleepWakeTimeInSeconds )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ LONG nWakeTimeInSeconds);
        
        /* [propget] */ HRESULT ( STDMETHODCALLTYPE *get_SleepWakeTimeInSeconds )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out LONG *pnWakeTimeInSeconds);
        
        /* [propput] */ HRESULT ( STDMETHODCALLTYPE *put_Critical )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ VARIANT_BOOL bCritical);
        
        /* [propget] */ HRESULT ( STDMETHODCALLTYPE *get_Critical )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbCritical);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RebootRestart )( 
            __RPC__in IWDTFSystemAction2 * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RebootRestartWithContext )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ __RPC__in BSTR psContextName);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsRestarted )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsRestarted);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsRestartedWithContext )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ __RPC__in BSTR psContextName,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsRestarted);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetRestartedContextData )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *ppsContextData);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *HasRestartedContextData )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetRestartContextData )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [in] */ __RPC__in BSTR psContextData);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RestartCount )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [retval][out] */ __RPC__out LONG *pnRestartCount);
        
        HRESULT ( STDMETHODCALLTYPE *ConnectedStandby )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ LONG TimeInMs);
        
        HRESULT ( STDMETHODCALLTYPE *EnterConnectedStandby )( 
            __RPC__in IWDTFSystemAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *ExitConnectedStandby )( 
            __RPC__in IWDTFSystemAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *PowerTracingStartByFile )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ __RPC__in BSTR EventFilePath);
        
        HRESULT ( STDMETHODCALLTYPE *PowerTracingStart )( 
            __RPC__in IWDTFSystemAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *PowerTracingEnd )( 
            __RPC__in IWDTFSystemAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *PowerAnalyzeTraceByFile )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ __RPC__in BSTR EventFilePath);
        
        HRESULT ( STDMETHODCALLTYPE *PowerAnalyzeTraceByFileByTime )( 
            __RPC__in IWDTFSystemAction2 * This,
            /* [in] */ __RPC__in BSTR EventFilePath,
            /* [in] */ ULONGLONG ullAnalyzeStartTimeStamp,
            /* [in] */ ULONGLONG ullAnalyzeStopTimeStamp);
        
        END_INTERFACE
    } IWDTFSystemAction2Vtbl;

    interface IWDTFSystemAction2
    {
        CONST_VTBL struct IWDTFSystemAction2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFSystemAction2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFSystemAction2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFSystemAction2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFSystemAction2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFSystemAction2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFSystemAction2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFSystemAction2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFSystemAction2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFSystemAction2_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 

#define IWDTFSystemAction2_get_Target(This,retval)	\
    ( (This)->lpVtbl -> get_Target(This,retval) ) 

#define IWDTFSystemAction2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFSystemAction2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFSystemAction2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFSystemAction2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFSystemAction2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFSystemAction2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFSystemAction2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFSystemAction2_GetFirstSleepState(This,pnSleepState)	\
    ( (This)->lpVtbl -> GetFirstSleepState(This,pnSleepState) ) 

#define IWDTFSystemAction2_GetNextSleepState(This,pnSleepState)	\
    ( (This)->lpVtbl -> GetNextSleepState(This,pnSleepState) ) 

#define IWDTFSystemAction2_Sleep(This,nSleepState)	\
    ( (This)->lpVtbl -> Sleep(This,nSleepState) ) 

#define IWDTFSystemAction2_put_SleepWakeTimeInSeconds(This,nWakeTimeInSeconds)	\
    ( (This)->lpVtbl -> put_SleepWakeTimeInSeconds(This,nWakeTimeInSeconds) ) 

#define IWDTFSystemAction2_get_SleepWakeTimeInSeconds(This,pnWakeTimeInSeconds)	\
    ( (This)->lpVtbl -> get_SleepWakeTimeInSeconds(This,pnWakeTimeInSeconds) ) 

#define IWDTFSystemAction2_put_Critical(This,bCritical)	\
    ( (This)->lpVtbl -> put_Critical(This,bCritical) ) 

#define IWDTFSystemAction2_get_Critical(This,pbCritical)	\
    ( (This)->lpVtbl -> get_Critical(This,pbCritical) ) 

#define IWDTFSystemAction2_RebootRestart(This)	\
    ( (This)->lpVtbl -> RebootRestart(This) ) 

#define IWDTFSystemAction2_RebootRestartWithContext(This,psContextName)	\
    ( (This)->lpVtbl -> RebootRestartWithContext(This,psContextName) ) 

#define IWDTFSystemAction2_get_IsRestarted(This,pbIsRestarted)	\
    ( (This)->lpVtbl -> get_IsRestarted(This,pbIsRestarted) ) 

#define IWDTFSystemAction2_IsRestartedWithContext(This,psContextName,pbIsRestarted)	\
    ( (This)->lpVtbl -> IsRestartedWithContext(This,psContextName,pbIsRestarted) ) 

#define IWDTFSystemAction2_GetRestartedContextData(This,Tag,ppsContextData)	\
    ( (This)->lpVtbl -> GetRestartedContextData(This,Tag,ppsContextData) ) 

#define IWDTFSystemAction2_HasRestartedContextData(This,Tag,pResult)	\
    ( (This)->lpVtbl -> HasRestartedContextData(This,Tag,pResult) ) 

#define IWDTFSystemAction2_SetRestartContextData(This,Tag,psContextData)	\
    ( (This)->lpVtbl -> SetRestartContextData(This,Tag,psContextData) ) 

#define IWDTFSystemAction2_get_RestartCount(This,pnRestartCount)	\
    ( (This)->lpVtbl -> get_RestartCount(This,pnRestartCount) ) 

#define IWDTFSystemAction2_ConnectedStandby(This,TimeInMs)	\
    ( (This)->lpVtbl -> ConnectedStandby(This,TimeInMs) ) 

#define IWDTFSystemAction2_EnterConnectedStandby(This)	\
    ( (This)->lpVtbl -> EnterConnectedStandby(This) ) 

#define IWDTFSystemAction2_ExitConnectedStandby(This)	\
    ( (This)->lpVtbl -> ExitConnectedStandby(This) ) 

#define IWDTFSystemAction2_PowerTracingStartByFile(This,EventFilePath)	\
    ( (This)->lpVtbl -> PowerTracingStartByFile(This,EventFilePath) ) 

#define IWDTFSystemAction2_PowerTracingStart(This)	\
    ( (This)->lpVtbl -> PowerTracingStart(This) ) 

#define IWDTFSystemAction2_PowerTracingEnd(This)	\
    ( (This)->lpVtbl -> PowerTracingEnd(This) ) 

#define IWDTFSystemAction2_PowerAnalyzeTraceByFile(This,EventFilePath)	\
    ( (This)->lpVtbl -> PowerAnalyzeTraceByFile(This,EventFilePath) ) 

#define IWDTFSystemAction2_PowerAnalyzeTraceByFileByTime(This,EventFilePath,ullAnalyzeStartTimeStamp,ullAnalyzeStopTimeStamp)	\
    ( (This)->lpVtbl -> PowerAnalyzeTraceByFileByTime(This,EventFilePath,ullAnalyzeStartTimeStamp,ullAnalyzeStopTimeStamp) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFSystemAction2_INTERFACE_DEFINED__ */


#ifndef __IWDTFInternalSystemAction2_INTERFACE_DEFINED__
#define __IWDTFInternalSystemAction2_INTERFACE_DEFINED__

/* interface IWDTFInternalSystemAction2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFInternalSystemAction2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("4180A858-8E1E-4304-83F6-9744AE9675F6")
    IWDTFInternalSystemAction2 : public IWDTFSystemAction2
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE KernelCrashTest( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE KernelCrash( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE KernelCrashRestart( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE KernelCrashRestartWithContext( 
            /* [in] */ __RPC__in BSTR psContext) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE KernelDebugBreak( 
            /* [in] */ __RPC__in BSTR MsgReason) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFInternalSystemAction2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in][idldescattr] */ signed long dispidMember,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [in][idldescattr] */ unsigned short wFlags,
            /* [in][idldescattr] */ __RPC__in struct DISPPARAMS *pdispparams,
            /* [out][idldescattr] */ __RPC__out VARIANT *pvarResult,
            /* [out][idldescattr] */ __RPC__out struct EXCEPINFO *pexcepinfo,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *puArgErr,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetFirstSleepState )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out LONG *pnSleepState);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetNextSleepState )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out LONG *pnSleepState);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Sleep )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ LONG nSleepState);
        
        /* [propput] */ HRESULT ( STDMETHODCALLTYPE *put_SleepWakeTimeInSeconds )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ LONG nWakeTimeInSeconds);
        
        /* [propget] */ HRESULT ( STDMETHODCALLTYPE *get_SleepWakeTimeInSeconds )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out LONG *pnWakeTimeInSeconds);
        
        /* [propput] */ HRESULT ( STDMETHODCALLTYPE *put_Critical )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ VARIANT_BOOL bCritical);
        
        /* [propget] */ HRESULT ( STDMETHODCALLTYPE *get_Critical )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbCritical);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RebootRestart )( 
            __RPC__in IWDTFInternalSystemAction2 * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RebootRestartWithContext )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ __RPC__in BSTR psContextName);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsRestarted )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsRestarted);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *IsRestartedWithContext )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ __RPC__in BSTR psContextName,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsRestarted);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetRestartedContextData )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *ppsContextData);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *HasRestartedContextData )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetRestartContextData )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [in] */ __RPC__in BSTR psContextData);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_RestartCount )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [retval][out] */ __RPC__out LONG *pnRestartCount);
        
        HRESULT ( STDMETHODCALLTYPE *ConnectedStandby )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ LONG TimeInMs);
        
        HRESULT ( STDMETHODCALLTYPE *EnterConnectedStandby )( 
            __RPC__in IWDTFInternalSystemAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *ExitConnectedStandby )( 
            __RPC__in IWDTFInternalSystemAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *PowerTracingStartByFile )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ __RPC__in BSTR EventFilePath);
        
        HRESULT ( STDMETHODCALLTYPE *PowerTracingStart )( 
            __RPC__in IWDTFInternalSystemAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *PowerTracingEnd )( 
            __RPC__in IWDTFInternalSystemAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *PowerAnalyzeTraceByFile )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ __RPC__in BSTR EventFilePath);
        
        HRESULT ( STDMETHODCALLTYPE *PowerAnalyzeTraceByFileByTime )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ __RPC__in BSTR EventFilePath,
            /* [in] */ ULONGLONG ullAnalyzeStartTimeStamp,
            /* [in] */ ULONGLONG ullAnalyzeStopTimeStamp);
        
        HRESULT ( STDMETHODCALLTYPE *KernelCrashTest )( 
            __RPC__in IWDTFInternalSystemAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *KernelCrash )( 
            __RPC__in IWDTFInternalSystemAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *KernelCrashRestart )( 
            __RPC__in IWDTFInternalSystemAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *KernelCrashRestartWithContext )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ __RPC__in BSTR psContext);
        
        HRESULT ( STDMETHODCALLTYPE *KernelDebugBreak )( 
            __RPC__in IWDTFInternalSystemAction2 * This,
            /* [in] */ __RPC__in BSTR MsgReason);
        
        END_INTERFACE
    } IWDTFInternalSystemAction2Vtbl;

    interface IWDTFInternalSystemAction2
    {
        CONST_VTBL struct IWDTFInternalSystemAction2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFInternalSystemAction2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFInternalSystemAction2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFInternalSystemAction2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFInternalSystemAction2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFInternalSystemAction2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFInternalSystemAction2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFInternalSystemAction2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFInternalSystemAction2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFInternalSystemAction2_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 

#define IWDTFInternalSystemAction2_get_Target(This,retval)	\
    ( (This)->lpVtbl -> get_Target(This,retval) ) 

#define IWDTFInternalSystemAction2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFInternalSystemAction2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFInternalSystemAction2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFInternalSystemAction2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFInternalSystemAction2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFInternalSystemAction2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFInternalSystemAction2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFInternalSystemAction2_GetFirstSleepState(This,pnSleepState)	\
    ( (This)->lpVtbl -> GetFirstSleepState(This,pnSleepState) ) 

#define IWDTFInternalSystemAction2_GetNextSleepState(This,pnSleepState)	\
    ( (This)->lpVtbl -> GetNextSleepState(This,pnSleepState) ) 

#define IWDTFInternalSystemAction2_Sleep(This,nSleepState)	\
    ( (This)->lpVtbl -> Sleep(This,nSleepState) ) 

#define IWDTFInternalSystemAction2_put_SleepWakeTimeInSeconds(This,nWakeTimeInSeconds)	\
    ( (This)->lpVtbl -> put_SleepWakeTimeInSeconds(This,nWakeTimeInSeconds) ) 

#define IWDTFInternalSystemAction2_get_SleepWakeTimeInSeconds(This,pnWakeTimeInSeconds)	\
    ( (This)->lpVtbl -> get_SleepWakeTimeInSeconds(This,pnWakeTimeInSeconds) ) 

#define IWDTFInternalSystemAction2_put_Critical(This,bCritical)	\
    ( (This)->lpVtbl -> put_Critical(This,bCritical) ) 

#define IWDTFInternalSystemAction2_get_Critical(This,pbCritical)	\
    ( (This)->lpVtbl -> get_Critical(This,pbCritical) ) 

#define IWDTFInternalSystemAction2_RebootRestart(This)	\
    ( (This)->lpVtbl -> RebootRestart(This) ) 

#define IWDTFInternalSystemAction2_RebootRestartWithContext(This,psContextName)	\
    ( (This)->lpVtbl -> RebootRestartWithContext(This,psContextName) ) 

#define IWDTFInternalSystemAction2_get_IsRestarted(This,pbIsRestarted)	\
    ( (This)->lpVtbl -> get_IsRestarted(This,pbIsRestarted) ) 

#define IWDTFInternalSystemAction2_IsRestartedWithContext(This,psContextName,pbIsRestarted)	\
    ( (This)->lpVtbl -> IsRestartedWithContext(This,psContextName,pbIsRestarted) ) 

#define IWDTFInternalSystemAction2_GetRestartedContextData(This,Tag,ppsContextData)	\
    ( (This)->lpVtbl -> GetRestartedContextData(This,Tag,ppsContextData) ) 

#define IWDTFInternalSystemAction2_HasRestartedContextData(This,Tag,pResult)	\
    ( (This)->lpVtbl -> HasRestartedContextData(This,Tag,pResult) ) 

#define IWDTFInternalSystemAction2_SetRestartContextData(This,Tag,psContextData)	\
    ( (This)->lpVtbl -> SetRestartContextData(This,Tag,psContextData) ) 

#define IWDTFInternalSystemAction2_get_RestartCount(This,pnRestartCount)	\
    ( (This)->lpVtbl -> get_RestartCount(This,pnRestartCount) ) 

#define IWDTFInternalSystemAction2_ConnectedStandby(This,TimeInMs)	\
    ( (This)->lpVtbl -> ConnectedStandby(This,TimeInMs) ) 

#define IWDTFInternalSystemAction2_EnterConnectedStandby(This)	\
    ( (This)->lpVtbl -> EnterConnectedStandby(This) ) 

#define IWDTFInternalSystemAction2_ExitConnectedStandby(This)	\
    ( (This)->lpVtbl -> ExitConnectedStandby(This) ) 

#define IWDTFInternalSystemAction2_PowerTracingStartByFile(This,EventFilePath)	\
    ( (This)->lpVtbl -> PowerTracingStartByFile(This,EventFilePath) ) 

#define IWDTFInternalSystemAction2_PowerTracingStart(This)	\
    ( (This)->lpVtbl -> PowerTracingStart(This) ) 

#define IWDTFInternalSystemAction2_PowerTracingEnd(This)	\
    ( (This)->lpVtbl -> PowerTracingEnd(This) ) 

#define IWDTFInternalSystemAction2_PowerAnalyzeTraceByFile(This,EventFilePath)	\
    ( (This)->lpVtbl -> PowerAnalyzeTraceByFile(This,EventFilePath) ) 

#define IWDTFInternalSystemAction2_PowerAnalyzeTraceByFileByTime(This,EventFilePath,ullAnalyzeStartTimeStamp,ullAnalyzeStopTimeStamp)	\
    ( (This)->lpVtbl -> PowerAnalyzeTraceByFileByTime(This,EventFilePath,ullAnalyzeStartTimeStamp,ullAnalyzeStopTimeStamp) ) 


#define IWDTFInternalSystemAction2_KernelCrashTest(This)	\
    ( (This)->lpVtbl -> KernelCrashTest(This) ) 

#define IWDTFInternalSystemAction2_KernelCrash(This)	\
    ( (This)->lpVtbl -> KernelCrash(This) ) 

#define IWDTFInternalSystemAction2_KernelCrashRestart(This)	\
    ( (This)->lpVtbl -> KernelCrashRestart(This) ) 

#define IWDTFInternalSystemAction2_KernelCrashRestartWithContext(This,psContext)	\
    ( (This)->lpVtbl -> KernelCrashRestartWithContext(This,psContext) ) 

#define IWDTFInternalSystemAction2_KernelDebugBreak(This,MsgReason)	\
    ( (This)->lpVtbl -> KernelDebugBreak(This,MsgReason) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFInternalSystemAction2_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_Console;

#ifdef __cplusplus

class DECLSPEC_UUID("23440924-1AB0-41F2-A732-B75069E5C823")
Console;
#endif

EXTERN_C const CLSID CLSID_WDTFSystemAction2;

#ifdef __cplusplus

class DECLSPEC_UUID("D30E1E07-AA39-4086-A7E6-9245FBD0A730")
WDTFSystemAction2;
#endif
#endif /* __ConsoleLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


