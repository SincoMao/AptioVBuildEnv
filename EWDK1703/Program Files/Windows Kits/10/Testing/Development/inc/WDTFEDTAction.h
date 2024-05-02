

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


#ifndef __wdtfedtaction_h__
#define __wdtfedtaction_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IWDTFEnhancedDeviceTestSupportAction2_FWD_DEFINED__
#define __IWDTFEnhancedDeviceTestSupportAction2_FWD_DEFINED__
typedef interface IWDTFEnhancedDeviceTestSupportAction2 IWDTFEnhancedDeviceTestSupportAction2;

#endif 	/* __IWDTFEnhancedDeviceTestSupportAction2_FWD_DEFINED__ */


#ifndef __IWDTFEnhancedDeviceTestSupportActions2_FWD_DEFINED__
#define __IWDTFEnhancedDeviceTestSupportActions2_FWD_DEFINED__
typedef interface IWDTFEnhancedDeviceTestSupportActions2 IWDTFEnhancedDeviceTestSupportActions2;

#endif 	/* __IWDTFEnhancedDeviceTestSupportActions2_FWD_DEFINED__ */


#ifndef __WDTFEnhancedDeviceTestSupportAction2_FWD_DEFINED__
#define __WDTFEnhancedDeviceTestSupportAction2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFEnhancedDeviceTestSupportAction2 WDTFEnhancedDeviceTestSupportAction2;
#else
typedef struct WDTFEnhancedDeviceTestSupportAction2 WDTFEnhancedDeviceTestSupportAction2;
#endif /* __cplusplus */

#endif 	/* __WDTFEnhancedDeviceTestSupportAction2_FWD_DEFINED__ */


#ifndef __WDTFEnhancedDeviceTestSupportActions2_FWD_DEFINED__
#define __WDTFEnhancedDeviceTestSupportActions2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFEnhancedDeviceTestSupportActions2 WDTFEnhancedDeviceTestSupportActions2;
#else
typedef struct WDTFEnhancedDeviceTestSupportActions2 WDTFEnhancedDeviceTestSupportActions2;
#endif /* __cplusplus */

#endif 	/* __WDTFEnhancedDeviceTestSupportActions2_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 



#ifndef __WDTFEDTActionLib_LIBRARY_DEFINED__
#define __WDTFEDTActionLib_LIBRARY_DEFINED__

/* library WDTFEDTActionLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_WDTFEDTActionLib;

#ifndef __IWDTFEnhancedDeviceTestSupportAction2_INTERFACE_DEFINED__
#define __IWDTFEnhancedDeviceTestSupportAction2_INTERFACE_DEFINED__

/* interface IWDTFEnhancedDeviceTestSupportAction2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFEnhancedDeviceTestSupportAction2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("85874C6E-7806-4CFD-BBDA-3FDBD3A8A675")
    IWDTFEnhancedDeviceTestSupportAction2 : public IWDTFAction2
    {
    public:
        virtual /* [helpstring][propput][id] */ HRESULT STDMETHODCALLTYPE put_SkipRestart( 
            /* [in] */ VARIANT_BOOL bSkipRestart) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Enable( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Disable( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IsEnabled( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbEnabled) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IsRebootRequired( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFEnhancedDeviceTestSupportAction2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
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
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        /* [helpstring][propput][id] */ HRESULT ( STDMETHODCALLTYPE *put_SkipRestart )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [in] */ VARIANT_BOOL bSkipRestart);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Enable )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Disable )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *IsEnabled )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbEnabled);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *IsRebootRequired )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired);
        
        END_INTERFACE
    } IWDTFEnhancedDeviceTestSupportAction2Vtbl;

    interface IWDTFEnhancedDeviceTestSupportAction2
    {
        CONST_VTBL struct IWDTFEnhancedDeviceTestSupportAction2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFEnhancedDeviceTestSupportAction2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_get_Target(This,retval)	\
    ( (This)->lpVtbl -> get_Target(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFEnhancedDeviceTestSupportAction2_put_SkipRestart(This,bSkipRestart)	\
    ( (This)->lpVtbl -> put_SkipRestart(This,bSkipRestart) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_Enable(This,pbRebootRequired)	\
    ( (This)->lpVtbl -> Enable(This,pbRebootRequired) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_Disable(This,pbRebootRequired)	\
    ( (This)->lpVtbl -> Disable(This,pbRebootRequired) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_IsEnabled(This,pbEnabled)	\
    ( (This)->lpVtbl -> IsEnabled(This,pbEnabled) ) 

#define IWDTFEnhancedDeviceTestSupportAction2_IsRebootRequired(This,pbRebootRequired)	\
    ( (This)->lpVtbl -> IsRebootRequired(This,pbRebootRequired) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFEnhancedDeviceTestSupportAction2_INTERFACE_DEFINED__ */


#ifndef __IWDTFEnhancedDeviceTestSupportActions2_INTERFACE_DEFINED__
#define __IWDTFEnhancedDeviceTestSupportActions2_INTERFACE_DEFINED__

/* interface IWDTFEnhancedDeviceTestSupportActions2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFEnhancedDeviceTestSupportActions2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("42B60B75-1EA3-483D-A596-B96ABDFE1FCB")
    IWDTFEnhancedDeviceTestSupportActions2 : public IWDTFActionsCustom2
    {
    public:
        virtual /* [helpstring][propput][id] */ HRESULT STDMETHODCALLTYPE put_SkipRestart( 
            /* [in] */ VARIANT_BOOL bSkipRestart) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Enable( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Disable( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IsEnabled( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbEnabled) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IsRebootRequired( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFEnhancedDeviceTestSupportActions2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
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
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][hidden][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [in][idldescattr] */ signed long Index,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFAction2 **retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out signed long *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Add )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [in][idldescattr] */ __RPC__in_opt IWDTFAction2 *pAction,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Remove )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [in][idldescattr] */ __RPC__in_opt IWDTFAction2 *pAction,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        /* [helpstring][propput][id] */ HRESULT ( STDMETHODCALLTYPE *put_SkipRestart )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [in] */ VARIANT_BOOL bSkipRestart);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Enable )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Disable )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *IsEnabled )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbEnabled);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *IsRebootRequired )( 
            __RPC__in IWDTFEnhancedDeviceTestSupportActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbRebootRequired);
        
        END_INTERFACE
    } IWDTFEnhancedDeviceTestSupportActions2Vtbl;

    interface IWDTFEnhancedDeviceTestSupportActions2
    {
        CONST_VTBL struct IWDTFEnhancedDeviceTestSupportActions2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFEnhancedDeviceTestSupportActions2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_get__NewEnum(This,retval)	\
    ( (This)->lpVtbl -> get__NewEnum(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_get_Item(This,Index,retval)	\
    ( (This)->lpVtbl -> get_Item(This,Index,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_get_Count(This,retval)	\
    ( (This)->lpVtbl -> get_Count(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_Add(This,pAction,retval)	\
    ( (This)->lpVtbl -> Add(This,pAction,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_Remove(This,pAction,retval)	\
    ( (This)->lpVtbl -> Remove(This,pAction,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_Clear(This,retval)	\
    ( (This)->lpVtbl -> Clear(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFEnhancedDeviceTestSupportActions2_put_SkipRestart(This,bSkipRestart)	\
    ( (This)->lpVtbl -> put_SkipRestart(This,bSkipRestart) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_Enable(This,pbRebootRequired)	\
    ( (This)->lpVtbl -> Enable(This,pbRebootRequired) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_Disable(This,pbRebootRequired)	\
    ( (This)->lpVtbl -> Disable(This,pbRebootRequired) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_IsEnabled(This,pbEnabled)	\
    ( (This)->lpVtbl -> IsEnabled(This,pbEnabled) ) 

#define IWDTFEnhancedDeviceTestSupportActions2_IsRebootRequired(This,pbRebootRequired)	\
    ( (This)->lpVtbl -> IsRebootRequired(This,pbRebootRequired) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFEnhancedDeviceTestSupportActions2_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_WDTFEnhancedDeviceTestSupportAction2;

#ifdef __cplusplus

class DECLSPEC_UUID("F6694E02-5AD0-476D-BD2D-43F7E5D10AF6")
WDTFEnhancedDeviceTestSupportAction2;
#endif

EXTERN_C const CLSID CLSID_WDTFEnhancedDeviceTestSupportActions2;

#ifdef __cplusplus

class DECLSPEC_UUID("0438C02B-EB9C-4E42-81AD-407F6CD6CDE1")
WDTFEnhancedDeviceTestSupportActions2;
#endif
#endif /* __WDTFEDTActionLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


