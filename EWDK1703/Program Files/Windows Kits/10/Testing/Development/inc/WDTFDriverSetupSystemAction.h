

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


#ifndef __wdtfdriversetupsystemaction_h__
#define __wdtfdriversetupsystemaction_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IWDTFDriverSetupSystemAction2_FWD_DEFINED__
#define __IWDTFDriverSetupSystemAction2_FWD_DEFINED__
typedef interface IWDTFDriverSetupSystemAction2 IWDTFDriverSetupSystemAction2;

#endif 	/* __IWDTFDriverSetupSystemAction2_FWD_DEFINED__ */


#ifndef __IWDTFInternalDriverSetupSystemAction2_FWD_DEFINED__
#define __IWDTFInternalDriverSetupSystemAction2_FWD_DEFINED__
typedef interface IWDTFInternalDriverSetupSystemAction2 IWDTFInternalDriverSetupSystemAction2;

#endif 	/* __IWDTFInternalDriverSetupSystemAction2_FWD_DEFINED__ */


#ifndef __WDTFDriverSetupSystemAction2_FWD_DEFINED__
#define __WDTFDriverSetupSystemAction2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFDriverSetupSystemAction2 WDTFDriverSetupSystemAction2;
#else
typedef struct WDTFDriverSetupSystemAction2 WDTFDriverSetupSystemAction2;
#endif /* __cplusplus */

#endif 	/* __WDTFDriverSetupSystemAction2_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 



#ifndef __WDTFDriverSetupSystemActionLib_LIBRARY_DEFINED__
#define __WDTFDriverSetupSystemActionLib_LIBRARY_DEFINED__

/* library WDTFDriverSetupSystemActionLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_WDTFDriverSetupSystemActionLib;

#ifndef __IWDTFDriverSetupSystemAction2_INTERFACE_DEFINED__
#define __IWDTFDriverSetupSystemAction2_INTERFACE_DEFINED__

/* interface IWDTFDriverSetupSystemAction2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFDriverSetupSystemAction2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("1E16523D-DC4C-4E82-A243-139771969158")
    IWDTFDriverSetupSystemAction2 : public IWDTFAction2
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ClearTriageLogs( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SnapTriageLogs( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE ImportDriverPackage( 
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RemoveDriverPackage( 
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IsImported( 
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *bRet) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE RescanAllDevices( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *bRet) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE WaitNoPendingInstallEvents( 
            LONG dwTimeout,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pNoMoreEvents) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFDriverSetupSystemAction2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
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
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ClearTriageLogs )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SnapTriageLogs )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ImportDriverPackage )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RemoveDriverPackage )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *IsImported )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *bRet);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RescanAllDevices )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *bRet);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *WaitNoPendingInstallEvents )( 
            __RPC__in IWDTFDriverSetupSystemAction2 * This,
            LONG dwTimeout,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pNoMoreEvents);
        
        END_INTERFACE
    } IWDTFDriverSetupSystemAction2Vtbl;

    interface IWDTFDriverSetupSystemAction2
    {
        CONST_VTBL struct IWDTFDriverSetupSystemAction2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFDriverSetupSystemAction2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFDriverSetupSystemAction2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFDriverSetupSystemAction2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFDriverSetupSystemAction2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFDriverSetupSystemAction2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFDriverSetupSystemAction2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFDriverSetupSystemAction2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFDriverSetupSystemAction2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFDriverSetupSystemAction2_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 

#define IWDTFDriverSetupSystemAction2_get_Target(This,retval)	\
    ( (This)->lpVtbl -> get_Target(This,retval) ) 

#define IWDTFDriverSetupSystemAction2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFDriverSetupSystemAction2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFDriverSetupSystemAction2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFDriverSetupSystemAction2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFDriverSetupSystemAction2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFDriverSetupSystemAction2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFDriverSetupSystemAction2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFDriverSetupSystemAction2_ClearTriageLogs(This)	\
    ( (This)->lpVtbl -> ClearTriageLogs(This) ) 

#define IWDTFDriverSetupSystemAction2_SnapTriageLogs(This)	\
    ( (This)->lpVtbl -> SnapTriageLogs(This) ) 

#define IWDTFDriverSetupSystemAction2_ImportDriverPackage(This,pDp)	\
    ( (This)->lpVtbl -> ImportDriverPackage(This,pDp) ) 

#define IWDTFDriverSetupSystemAction2_RemoveDriverPackage(This,pDp)	\
    ( (This)->lpVtbl -> RemoveDriverPackage(This,pDp) ) 

#define IWDTFDriverSetupSystemAction2_IsImported(This,pDp,bRet)	\
    ( (This)->lpVtbl -> IsImported(This,pDp,bRet) ) 

#define IWDTFDriverSetupSystemAction2_RescanAllDevices(This,bRet)	\
    ( (This)->lpVtbl -> RescanAllDevices(This,bRet) ) 

#define IWDTFDriverSetupSystemAction2_WaitNoPendingInstallEvents(This,dwTimeout,pNoMoreEvents)	\
    ( (This)->lpVtbl -> WaitNoPendingInstallEvents(This,dwTimeout,pNoMoreEvents) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFDriverSetupSystemAction2_INTERFACE_DEFINED__ */


#ifndef __IWDTFInternalDriverSetupSystemAction2_INTERFACE_DEFINED__
#define __IWDTFInternalDriverSetupSystemAction2_INTERFACE_DEFINED__

/* interface IWDTFInternalDriverSetupSystemAction2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFInternalDriverSetupSystemAction2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("72F2CF57-F3AF-4430-970E-37D798135BFA")
    IWDTFInternalDriverSetupSystemAction2 : public IWDTFDriverSetupSystemAction2
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CreateRootEnumeratedDevice( 
            __RPC__in BSTR ClassGuid,
            __RPC__in BSTR ClassName,
            __RPC__in BSTR hwid,
            /* [retval][out] */ __RPC__deref_out_opt /* external definition not present */ IWDTFTarget2 **ppTarget) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE CreateRootEnumeratedDevicesFromPackage( 
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__deref_out_opt /* external definition not present */ IWDTFTargets2 **ppTargets) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFInternalDriverSetupSystemAction2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
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
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ClearTriageLogs )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SnapTriageLogs )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *ImportDriverPackage )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RemoveDriverPackage )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *IsImported )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *bRet);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *RescanAllDevices )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *bRet);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *WaitNoPendingInstallEvents )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            LONG dwTimeout,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pNoMoreEvents);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CreateRootEnumeratedDevice )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            __RPC__in BSTR ClassGuid,
            __RPC__in BSTR ClassName,
            __RPC__in BSTR hwid,
            /* [retval][out] */ __RPC__deref_out_opt /* external definition not present */ IWDTFTarget2 **ppTarget);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *CreateRootEnumeratedDevicesFromPackage )( 
            __RPC__in IWDTFInternalDriverSetupSystemAction2 * This,
            /* [in] */ __RPC__in /* external definition not present */ IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__deref_out_opt /* external definition not present */ IWDTFTargets2 **ppTargets);
        
        END_INTERFACE
    } IWDTFInternalDriverSetupSystemAction2Vtbl;

    interface IWDTFInternalDriverSetupSystemAction2
    {
        CONST_VTBL struct IWDTFInternalDriverSetupSystemAction2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFInternalDriverSetupSystemAction2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_get_Target(This,retval)	\
    ( (This)->lpVtbl -> get_Target(This,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFInternalDriverSetupSystemAction2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFInternalDriverSetupSystemAction2_ClearTriageLogs(This)	\
    ( (This)->lpVtbl -> ClearTriageLogs(This) ) 

#define IWDTFInternalDriverSetupSystemAction2_SnapTriageLogs(This)	\
    ( (This)->lpVtbl -> SnapTriageLogs(This) ) 

#define IWDTFInternalDriverSetupSystemAction2_ImportDriverPackage(This,pDp)	\
    ( (This)->lpVtbl -> ImportDriverPackage(This,pDp) ) 

#define IWDTFInternalDriverSetupSystemAction2_RemoveDriverPackage(This,pDp)	\
    ( (This)->lpVtbl -> RemoveDriverPackage(This,pDp) ) 

#define IWDTFInternalDriverSetupSystemAction2_IsImported(This,pDp,bRet)	\
    ( (This)->lpVtbl -> IsImported(This,pDp,bRet) ) 

#define IWDTFInternalDriverSetupSystemAction2_RescanAllDevices(This,bRet)	\
    ( (This)->lpVtbl -> RescanAllDevices(This,bRet) ) 

#define IWDTFInternalDriverSetupSystemAction2_WaitNoPendingInstallEvents(This,dwTimeout,pNoMoreEvents)	\
    ( (This)->lpVtbl -> WaitNoPendingInstallEvents(This,dwTimeout,pNoMoreEvents) ) 


#define IWDTFInternalDriverSetupSystemAction2_CreateRootEnumeratedDevice(This,ClassGuid,ClassName,hwid,ppTarget)	\
    ( (This)->lpVtbl -> CreateRootEnumeratedDevice(This,ClassGuid,ClassName,hwid,ppTarget) ) 

#define IWDTFInternalDriverSetupSystemAction2_CreateRootEnumeratedDevicesFromPackage(This,pDp,ppTargets)	\
    ( (This)->lpVtbl -> CreateRootEnumeratedDevicesFromPackage(This,pDp,ppTargets) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFInternalDriverSetupSystemAction2_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_WDTFDriverSetupSystemAction2;

#ifdef __cplusplus

class DECLSPEC_UUID("238C0AEB-1DFC-4575-AAF3-C67FE15C1819")
WDTFDriverSetupSystemAction2;
#endif
#endif /* __WDTFDriverSetupSystemActionLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


