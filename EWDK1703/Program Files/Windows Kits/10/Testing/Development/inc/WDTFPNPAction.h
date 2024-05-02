

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


#ifndef __wdtfpnpaction_h__
#define __wdtfpnpaction_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IWDTFPNPAction2_FWD_DEFINED__
#define __IWDTFPNPAction2_FWD_DEFINED__
typedef interface IWDTFPNPAction2 IWDTFPNPAction2;

#endif 	/* __IWDTFPNPAction2_FWD_DEFINED__ */


#ifndef __IWDTFInternalPNPAction2_FWD_DEFINED__
#define __IWDTFInternalPNPAction2_FWD_DEFINED__
typedef interface IWDTFInternalPNPAction2 IWDTFInternalPNPAction2;

#endif 	/* __IWDTFInternalPNPAction2_FWD_DEFINED__ */


#ifndef __IWDTFPNPActions2_FWD_DEFINED__
#define __IWDTFPNPActions2_FWD_DEFINED__
typedef interface IWDTFPNPActions2 IWDTFPNPActions2;

#endif 	/* __IWDTFPNPActions2_FWD_DEFINED__ */


#ifndef __WDTFPNPAction2_FWD_DEFINED__
#define __WDTFPNPAction2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFPNPAction2 WDTFPNPAction2;
#else
typedef struct WDTFPNPAction2 WDTFPNPAction2;
#endif /* __cplusplus */

#endif 	/* __WDTFPNPAction2_FWD_DEFINED__ */


#ifndef __WDTFPNPActions2_FWD_DEFINED__
#define __WDTFPNPActions2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFPNPActions2 WDTFPNPActions2;
#else
typedef struct WDTFPNPActions2 WDTFPNPActions2;
#endif /* __cplusplus */

#endif 	/* __WDTFPNPActions2_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 



#ifndef __WDTFPNPLib_LIBRARY_DEFINED__
#define __WDTFPNPLib_LIBRARY_DEFINED__

/* library WDTFPNPLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_WDTFPNPLib;

#ifndef __IWDTFPNPAction2_INTERFACE_DEFINED__
#define __IWDTFPNPAction2_INTERFACE_DEFINED__

/* interface IWDTFPNPAction2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFPNPAction2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("57AD00E5-8CB3-4665-9A70-366764B37DBF")
    IWDTFPNPAction2 : public IWDTFAction2
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EDTSurpriseRemoveDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EDTCancelRemoveDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EDTCancelStopDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EDTTryStopDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EDTTryStopDeviceRequestNewResources( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EDTTryStopDeviceFailRestart( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE EnableDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DisableDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RescanParentDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RescanDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RestartDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RequestEjectDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RemoveDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFPNPAction2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFPNPAction2 * This,
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
            __RPC__in IWDTFPNPAction2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTSurpriseRemoveDevice )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTCancelRemoveDevice )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTCancelStopDevice )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTTryStopDevice )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTTryStopDeviceRequestNewResources )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTTryStopDeviceFailRestart )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EnableDevice )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DisableDevice )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RescanParentDevice )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RescanDevice )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RestartDevice )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RequestEjectDevice )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemoveDevice )( 
            __RPC__in IWDTFPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        END_INTERFACE
    } IWDTFPNPAction2Vtbl;

    interface IWDTFPNPAction2
    {
        CONST_VTBL struct IWDTFPNPAction2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFPNPAction2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFPNPAction2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFPNPAction2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFPNPAction2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFPNPAction2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFPNPAction2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFPNPAction2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFPNPAction2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFPNPAction2_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 

#define IWDTFPNPAction2_get_Target(This,retval)	\
    ( (This)->lpVtbl -> get_Target(This,retval) ) 

#define IWDTFPNPAction2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFPNPAction2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFPNPAction2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFPNPAction2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFPNPAction2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFPNPAction2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFPNPAction2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFPNPAction2_EDTSurpriseRemoveDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTSurpriseRemoveDevice(This,pbSuccess) ) 

#define IWDTFPNPAction2_EDTCancelRemoveDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTCancelRemoveDevice(This,pbSuccess) ) 

#define IWDTFPNPAction2_EDTCancelStopDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTCancelStopDevice(This,pbSuccess) ) 

#define IWDTFPNPAction2_EDTTryStopDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTTryStopDevice(This,pbSuccess) ) 

#define IWDTFPNPAction2_EDTTryStopDeviceRequestNewResources(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTTryStopDeviceRequestNewResources(This,pbSuccess) ) 

#define IWDTFPNPAction2_EDTTryStopDeviceFailRestart(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTTryStopDeviceFailRestart(This,pbSuccess) ) 

#define IWDTFPNPAction2_EnableDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EnableDevice(This,pbSuccess) ) 

#define IWDTFPNPAction2_DisableDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> DisableDevice(This,pbSuccess) ) 

#define IWDTFPNPAction2_RescanParentDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RescanParentDevice(This,pbSuccess) ) 

#define IWDTFPNPAction2_RescanDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RescanDevice(This,pbSuccess) ) 

#define IWDTFPNPAction2_RestartDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RestartDevice(This,pbSuccess) ) 

#define IWDTFPNPAction2_RequestEjectDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RequestEjectDevice(This,pbSuccess) ) 

#define IWDTFPNPAction2_RemoveDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RemoveDevice(This,pbSuccess) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFPNPAction2_INTERFACE_DEFINED__ */


#ifndef __IWDTFInternalPNPAction2_INTERFACE_DEFINED__
#define __IWDTFInternalPNPAction2_INTERFACE_DEFINED__

/* interface IWDTFInternalPNPAction2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFInternalPNPAction2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("DF6B50E3-AE7F-4A0B-9738-6307AFBA00F2")
    IWDTFInternalPNPAction2 : public IWDTFPNPAction2
    {
    public:
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_IsRebootRequired( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE DIFRemoveDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFInternalPNPAction2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
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
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTSurpriseRemoveDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTCancelRemoveDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTCancelStopDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTTryStopDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTTryStopDeviceRequestNewResources )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EDTTryStopDeviceFailRestart )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *EnableDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DisableDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RescanParentDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RescanDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RestartDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RequestEjectDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RemoveDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_IsRebootRequired )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *DIFRemoveDevice )( 
            __RPC__in IWDTFInternalPNPAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        END_INTERFACE
    } IWDTFInternalPNPAction2Vtbl;

    interface IWDTFInternalPNPAction2
    {
        CONST_VTBL struct IWDTFInternalPNPAction2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFInternalPNPAction2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFInternalPNPAction2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFInternalPNPAction2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFInternalPNPAction2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFInternalPNPAction2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFInternalPNPAction2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFInternalPNPAction2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFInternalPNPAction2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFInternalPNPAction2_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 

#define IWDTFInternalPNPAction2_get_Target(This,retval)	\
    ( (This)->lpVtbl -> get_Target(This,retval) ) 

#define IWDTFInternalPNPAction2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFInternalPNPAction2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFInternalPNPAction2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFInternalPNPAction2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFInternalPNPAction2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFInternalPNPAction2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFInternalPNPAction2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFInternalPNPAction2_EDTSurpriseRemoveDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTSurpriseRemoveDevice(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_EDTCancelRemoveDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTCancelRemoveDevice(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_EDTCancelStopDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTCancelStopDevice(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_EDTTryStopDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTTryStopDevice(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_EDTTryStopDeviceRequestNewResources(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTTryStopDeviceRequestNewResources(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_EDTTryStopDeviceFailRestart(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTTryStopDeviceFailRestart(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_EnableDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EnableDevice(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_DisableDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> DisableDevice(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_RescanParentDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RescanParentDevice(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_RescanDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RescanDevice(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_RestartDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RestartDevice(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_RequestEjectDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RequestEjectDevice(This,pbSuccess) ) 

#define IWDTFInternalPNPAction2_RemoveDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RemoveDevice(This,pbSuccess) ) 


#define IWDTFInternalPNPAction2_get_IsRebootRequired(This,pbRebootRequired)	\
    ( (This)->lpVtbl -> get_IsRebootRequired(This,pbRebootRequired) ) 

#define IWDTFInternalPNPAction2_DIFRemoveDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> DIFRemoveDevice(This,pbSuccess) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFInternalPNPAction2_INTERFACE_DEFINED__ */


#ifndef __IWDTFPNPActions2_INTERFACE_DEFINED__
#define __IWDTFPNPActions2_INTERFACE_DEFINED__

/* interface IWDTFPNPActions2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFPNPActions2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("326F9F9D-1AC2-40EE-BFD6-60026E002E50")
    IWDTFPNPActions2 : public IWDTFActionsCustom2
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE EDTSurpriseRemoveDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EDTCancelRemoveDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EDTCancelStopDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EDTTryStopDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EDTTryStopDeviceRequestNewResources( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EDTTryStopDeviceFailRestart( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EnableDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE DisableDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RescanParentDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RescanDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RestartDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RequestEjectDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RemoveDevice( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFPNPActions2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFPNPActions2 * This,
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
            __RPC__in IWDTFPNPActions2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][hidden][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [in][idldescattr] */ signed long Index,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFAction2 **retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out signed long *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Add )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [in][idldescattr] */ __RPC__in_opt IWDTFAction2 *pAction,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Remove )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [in][idldescattr] */ __RPC__in_opt IWDTFAction2 *pAction,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        HRESULT ( STDMETHODCALLTYPE *EDTSurpriseRemoveDevice )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        HRESULT ( STDMETHODCALLTYPE *EDTCancelRemoveDevice )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        HRESULT ( STDMETHODCALLTYPE *EDTCancelStopDevice )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        HRESULT ( STDMETHODCALLTYPE *EDTTryStopDevice )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        HRESULT ( STDMETHODCALLTYPE *EDTTryStopDeviceRequestNewResources )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        HRESULT ( STDMETHODCALLTYPE *EDTTryStopDeviceFailRestart )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        HRESULT ( STDMETHODCALLTYPE *EnableDevice )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired);
        
        HRESULT ( STDMETHODCALLTYPE *DisableDevice )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired);
        
        HRESULT ( STDMETHODCALLTYPE *RescanParentDevice )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        HRESULT ( STDMETHODCALLTYPE *RescanDevice )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        HRESULT ( STDMETHODCALLTYPE *RestartDevice )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        HRESULT ( STDMETHODCALLTYPE *RequestEjectDevice )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        HRESULT ( STDMETHODCALLTYPE *RemoveDevice )( 
            __RPC__in IWDTFPNPActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbSuccess);
        
        END_INTERFACE
    } IWDTFPNPActions2Vtbl;

    interface IWDTFPNPActions2
    {
        CONST_VTBL struct IWDTFPNPActions2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFPNPActions2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFPNPActions2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFPNPActions2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFPNPActions2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFPNPActions2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFPNPActions2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFPNPActions2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFPNPActions2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFPNPActions2_get__NewEnum(This,retval)	\
    ( (This)->lpVtbl -> get__NewEnum(This,retval) ) 

#define IWDTFPNPActions2_get_Item(This,Index,retval)	\
    ( (This)->lpVtbl -> get_Item(This,Index,retval) ) 

#define IWDTFPNPActions2_get_Count(This,retval)	\
    ( (This)->lpVtbl -> get_Count(This,retval) ) 

#define IWDTFPNPActions2_Add(This,pAction,retval)	\
    ( (This)->lpVtbl -> Add(This,pAction,retval) ) 

#define IWDTFPNPActions2_Remove(This,pAction,retval)	\
    ( (This)->lpVtbl -> Remove(This,pAction,retval) ) 

#define IWDTFPNPActions2_Clear(This,retval)	\
    ( (This)->lpVtbl -> Clear(This,retval) ) 

#define IWDTFPNPActions2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFPNPActions2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFPNPActions2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFPNPActions2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFPNPActions2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFPNPActions2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFPNPActions2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFPNPActions2_EDTSurpriseRemoveDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTSurpriseRemoveDevice(This,pbSuccess) ) 

#define IWDTFPNPActions2_EDTCancelRemoveDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTCancelRemoveDevice(This,pbSuccess) ) 

#define IWDTFPNPActions2_EDTCancelStopDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTCancelStopDevice(This,pbSuccess) ) 

#define IWDTFPNPActions2_EDTTryStopDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTTryStopDevice(This,pbSuccess) ) 

#define IWDTFPNPActions2_EDTTryStopDeviceRequestNewResources(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTTryStopDeviceRequestNewResources(This,pbSuccess) ) 

#define IWDTFPNPActions2_EDTTryStopDeviceFailRestart(This,pbSuccess)	\
    ( (This)->lpVtbl -> EDTTryStopDeviceFailRestart(This,pbSuccess) ) 

#define IWDTFPNPActions2_EnableDevice(This,pbRebootRequired)	\
    ( (This)->lpVtbl -> EnableDevice(This,pbRebootRequired) ) 

#define IWDTFPNPActions2_DisableDevice(This,pbRebootRequired)	\
    ( (This)->lpVtbl -> DisableDevice(This,pbRebootRequired) ) 

#define IWDTFPNPActions2_RescanParentDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RescanParentDevice(This,pbSuccess) ) 

#define IWDTFPNPActions2_RescanDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RescanDevice(This,pbSuccess) ) 

#define IWDTFPNPActions2_RestartDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RestartDevice(This,pbSuccess) ) 

#define IWDTFPNPActions2_RequestEjectDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RequestEjectDevice(This,pbSuccess) ) 

#define IWDTFPNPActions2_RemoveDevice(This,pbSuccess)	\
    ( (This)->lpVtbl -> RemoveDevice(This,pbSuccess) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFPNPActions2_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_WDTFPNPAction2;

#ifdef __cplusplus

class DECLSPEC_UUID("B8D74985-4EB9-46AA-B2ED-DD2D918849DF")
WDTFPNPAction2;
#endif

EXTERN_C const CLSID CLSID_WDTFPNPActions2;

#ifdef __cplusplus

class DECLSPEC_UUID("C0B6C572-D37D-47CC-A89D-E6B9E0852764")
WDTFPNPActions2;
#endif
#endif /* __WDTFPNPLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


