

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


#ifndef __wdtfsimulatedbatterysystemaction_h__
#define __wdtfsimulatedbatterysystemaction_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IWDTFSimulatedBatterySystemAction_FWD_DEFINED__
#define __IWDTFSimulatedBatterySystemAction_FWD_DEFINED__
typedef interface IWDTFSimulatedBatterySystemAction IWDTFSimulatedBatterySystemAction;

#endif 	/* __IWDTFSimulatedBatterySystemAction_FWD_DEFINED__ */


#ifndef __WDTFSimulatedBatterySystemAction_FWD_DEFINED__
#define __WDTFSimulatedBatterySystemAction_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFSimulatedBatterySystemAction WDTFSimulatedBatterySystemAction;
#else
typedef struct WDTFSimulatedBatterySystemAction WDTFSimulatedBatterySystemAction;
#endif /* __cplusplus */

#endif 	/* __WDTFSimulatedBatterySystemAction_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 



#ifndef __WDTFSimulatedBatterySystemActionLib_LIBRARY_DEFINED__
#define __WDTFSimulatedBatterySystemActionLib_LIBRARY_DEFINED__

/* library WDTFSimulatedBatterySystemActionLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_WDTFSimulatedBatterySystemActionLib;

#ifndef __IWDTFSimulatedBatterySystemAction_INTERFACE_DEFINED__
#define __IWDTFSimulatedBatterySystemAction_INTERFACE_DEFINED__

/* interface IWDTFSimulatedBatterySystemAction */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFSimulatedBatterySystemAction;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("953FA710-F78D-4974-B54C-9D22C6E64605")
    IWDTFSimulatedBatterySystemAction : public IWDTFAction2
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EnableSimulatedBattery( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DisableSimulatedBattery( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EnableRealBatteries( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DisableRealBatteries( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetSimulatedBatteryToAC( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetSimulatedBatteryToDC( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE SetSimulatedBatteryChargePercentage( 
            /* [in] */ ULONG Percent,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFSimulatedBatterySystemActionVtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
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
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EnableSimulatedBattery )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DisableSimulatedBattery )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EnableRealBatteries )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DisableRealBatteries )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetSimulatedBatteryToAC )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetSimulatedBatteryToDC )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *SetSimulatedBatteryChargePercentage )( 
            __RPC__in IWDTFSimulatedBatterySystemAction * This,
            /* [in] */ ULONG Percent,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        END_INTERFACE
    } IWDTFSimulatedBatterySystemActionVtbl;

    interface IWDTFSimulatedBatterySystemAction
    {
        CONST_VTBL struct IWDTFSimulatedBatterySystemActionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFSimulatedBatterySystemAction_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFSimulatedBatterySystemAction_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFSimulatedBatterySystemAction_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFSimulatedBatterySystemAction_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFSimulatedBatterySystemAction_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFSimulatedBatterySystemAction_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFSimulatedBatterySystemAction_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFSimulatedBatterySystemAction_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFSimulatedBatterySystemAction_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 

#define IWDTFSimulatedBatterySystemAction_get_Target(This,retval)	\
    ( (This)->lpVtbl -> get_Target(This,retval) ) 

#define IWDTFSimulatedBatterySystemAction_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFSimulatedBatterySystemAction_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFSimulatedBatterySystemAction_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFSimulatedBatterySystemAction_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFSimulatedBatterySystemAction_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFSimulatedBatterySystemAction_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFSimulatedBatterySystemAction_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFSimulatedBatterySystemAction_EnableSimulatedBattery(This,pbSuccess)	\
    ( (This)->lpVtbl -> EnableSimulatedBattery(This,pbSuccess) ) 

#define IWDTFSimulatedBatterySystemAction_DisableSimulatedBattery(This,pbSuccess)	\
    ( (This)->lpVtbl -> DisableSimulatedBattery(This,pbSuccess) ) 

#define IWDTFSimulatedBatterySystemAction_EnableRealBatteries(This,pbSuccess)	\
    ( (This)->lpVtbl -> EnableRealBatteries(This,pbSuccess) ) 

#define IWDTFSimulatedBatterySystemAction_DisableRealBatteries(This,pbSuccess)	\
    ( (This)->lpVtbl -> DisableRealBatteries(This,pbSuccess) ) 

#define IWDTFSimulatedBatterySystemAction_SetSimulatedBatteryToAC(This,pbSuccess)	\
    ( (This)->lpVtbl -> SetSimulatedBatteryToAC(This,pbSuccess) ) 

#define IWDTFSimulatedBatterySystemAction_SetSimulatedBatteryToDC(This,pbSuccess)	\
    ( (This)->lpVtbl -> SetSimulatedBatteryToDC(This,pbSuccess) ) 

#define IWDTFSimulatedBatterySystemAction_SetSimulatedBatteryChargePercentage(This,Percent,pbSuccess)	\
    ( (This)->lpVtbl -> SetSimulatedBatteryChargePercentage(This,Percent,pbSuccess) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFSimulatedBatterySystemAction_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_WDTFSimulatedBatterySystemAction;

#ifdef __cplusplus

class DECLSPEC_UUID("E4F9B389-F570-4C5F-9CBE-DCFA81A771D3")
WDTFSimulatedBatterySystemAction;
#endif
#endif /* __WDTFSimulatedBatterySystemActionLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


