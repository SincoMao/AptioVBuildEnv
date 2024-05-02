

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


#ifndef __wdtfdriversetupdeviceaction_h__
#define __wdtfdriversetupdeviceaction_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IWDTFDriverSetupAction2_FWD_DEFINED__
#define __IWDTFDriverSetupAction2_FWD_DEFINED__
typedef interface IWDTFDriverSetupAction2 IWDTFDriverSetupAction2;

#endif 	/* __IWDTFDriverSetupAction2_FWD_DEFINED__ */


#ifndef __IWDTFDriverSetupActions2_FWD_DEFINED__
#define __IWDTFDriverSetupActions2_FWD_DEFINED__
typedef interface IWDTFDriverSetupActions2 IWDTFDriverSetupActions2;

#endif 	/* __IWDTFDriverSetupActions2_FWD_DEFINED__ */


#ifndef __WDTFDriverSetupAction2_FWD_DEFINED__
#define __WDTFDriverSetupAction2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFDriverSetupAction2 WDTFDriverSetupAction2;
#else
typedef struct WDTFDriverSetupAction2 WDTFDriverSetupAction2;
#endif /* __cplusplus */

#endif 	/* __WDTFDriverSetupAction2_FWD_DEFINED__ */


#ifndef __WDTFDriverSetupActions2_FWD_DEFINED__
#define __WDTFDriverSetupActions2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFDriverSetupActions2 WDTFDriverSetupActions2;
#else
typedef struct WDTFDriverSetupActions2 WDTFDriverSetupActions2;
#endif /* __cplusplus */

#endif 	/* __WDTFDriverSetupActions2_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 



#ifndef __WDTFDriverSetupActionLib_LIBRARY_DEFINED__
#define __WDTFDriverSetupActionLib_LIBRARY_DEFINED__

/* library WDTFDriverSetupActionLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_WDTFDriverSetupActionLib;

#ifndef __IWDTFDriverSetupAction2_INTERFACE_DEFINED__
#define __IWDTFDriverSetupAction2_INTERFACE_DEFINED__

/* interface IWDTFDriverSetupAction2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFDriverSetupAction2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("18475180-97D6-4F74-AF7B-83299DE855AF")
    IWDTFDriverSetupAction2 : public IWDTFAction2
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE UpdateDriver( 
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbReboot) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE UnInstallDriverPermanently( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbReboot) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFDriverSetupAction2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
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
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        HRESULT ( STDMETHODCALLTYPE *UpdateDriver )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbReboot);
        
        HRESULT ( STDMETHODCALLTYPE *UnInstallDriverPermanently )( 
            __RPC__in IWDTFDriverSetupAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbReboot);
        
        END_INTERFACE
    } IWDTFDriverSetupAction2Vtbl;

    interface IWDTFDriverSetupAction2
    {
        CONST_VTBL struct IWDTFDriverSetupAction2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFDriverSetupAction2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFDriverSetupAction2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFDriverSetupAction2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFDriverSetupAction2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFDriverSetupAction2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFDriverSetupAction2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFDriverSetupAction2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFDriverSetupAction2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFDriverSetupAction2_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 

#define IWDTFDriverSetupAction2_get_Target(This,retval)	\
    ( (This)->lpVtbl -> get_Target(This,retval) ) 

#define IWDTFDriverSetupAction2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFDriverSetupAction2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFDriverSetupAction2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFDriverSetupAction2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFDriverSetupAction2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFDriverSetupAction2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFDriverSetupAction2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFDriverSetupAction2_UpdateDriver(This,pDp,pbReboot)	\
    ( (This)->lpVtbl -> UpdateDriver(This,pDp,pbReboot) ) 

#define IWDTFDriverSetupAction2_UnInstallDriverPermanently(This,pbReboot)	\
    ( (This)->lpVtbl -> UnInstallDriverPermanently(This,pbReboot) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFDriverSetupAction2_INTERFACE_DEFINED__ */


#ifndef __IWDTFDriverSetupActions2_INTERFACE_DEFINED__
#define __IWDTFDriverSetupActions2_INTERFACE_DEFINED__

/* interface IWDTFDriverSetupActions2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFDriverSetupActions2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("B505B2B5-0199-4746-A1F9-6E50105C47D1")
    IWDTFDriverSetupActions2 : public IWDTFActionsCustom2
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE UpdateDriver( 
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbReboot) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE UnInstallDriverPermanently( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbReboot) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFDriverSetupActions2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
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
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][hidden][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [in][idldescattr] */ signed long Index,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFAction2 **retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__out signed long *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Add )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [in][idldescattr] */ __RPC__in_opt IWDTFAction2 *pAction,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Remove )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [in][idldescattr] */ __RPC__in_opt IWDTFAction2 *pAction,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        HRESULT ( STDMETHODCALLTYPE *UpdateDriver )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbReboot);
        
        HRESULT ( STDMETHODCALLTYPE *UnInstallDriverPermanently )( 
            __RPC__in IWDTFDriverSetupActions2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbReboot);
        
        END_INTERFACE
    } IWDTFDriverSetupActions2Vtbl;

    interface IWDTFDriverSetupActions2
    {
        CONST_VTBL struct IWDTFDriverSetupActions2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFDriverSetupActions2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFDriverSetupActions2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFDriverSetupActions2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFDriverSetupActions2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFDriverSetupActions2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFDriverSetupActions2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFDriverSetupActions2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFDriverSetupActions2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFDriverSetupActions2_get__NewEnum(This,retval)	\
    ( (This)->lpVtbl -> get__NewEnum(This,retval) ) 

#define IWDTFDriverSetupActions2_get_Item(This,Index,retval)	\
    ( (This)->lpVtbl -> get_Item(This,Index,retval) ) 

#define IWDTFDriverSetupActions2_get_Count(This,retval)	\
    ( (This)->lpVtbl -> get_Count(This,retval) ) 

#define IWDTFDriverSetupActions2_Add(This,pAction,retval)	\
    ( (This)->lpVtbl -> Add(This,pAction,retval) ) 

#define IWDTFDriverSetupActions2_Remove(This,pAction,retval)	\
    ( (This)->lpVtbl -> Remove(This,pAction,retval) ) 

#define IWDTFDriverSetupActions2_Clear(This,retval)	\
    ( (This)->lpVtbl -> Clear(This,retval) ) 

#define IWDTFDriverSetupActions2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFDriverSetupActions2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFDriverSetupActions2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFDriverSetupActions2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFDriverSetupActions2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFDriverSetupActions2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFDriverSetupActions2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFDriverSetupActions2_UpdateDriver(This,pDp,pbReboot)	\
    ( (This)->lpVtbl -> UpdateDriver(This,pDp,pbReboot) ) 

#define IWDTFDriverSetupActions2_UnInstallDriverPermanently(This,pbReboot)	\
    ( (This)->lpVtbl -> UnInstallDriverPermanently(This,pbReboot) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFDriverSetupActions2_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_WDTFDriverSetupAction2;

#ifdef __cplusplus

class DECLSPEC_UUID("0FA57208-5100-4CD6-955C-FE69F8898973")
WDTFDriverSetupAction2;
#endif

EXTERN_C const CLSID CLSID_WDTFDriverSetupActions2;

#ifdef __cplusplus

class DECLSPEC_UUID("CA3D2EED-743D-40BC-9EE5-8768F0EBCFC1")
WDTFDriverSetupActions2;
#endif
#endif /* __WDTFDriverSetupActionLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


