

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


#ifndef __wdtfdriverpackageaction_h__
#define __wdtfdriverpackageaction_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IWDTFDriverPackageAction2_FWD_DEFINED__
#define __IWDTFDriverPackageAction2_FWD_DEFINED__
typedef interface IWDTFDriverPackageAction2 IWDTFDriverPackageAction2;

#endif 	/* __IWDTFDriverPackageAction2_FWD_DEFINED__ */


#ifndef __IWDTFInternalDriverPackageAction2_FWD_DEFINED__
#define __IWDTFInternalDriverPackageAction2_FWD_DEFINED__
typedef interface IWDTFInternalDriverPackageAction2 IWDTFInternalDriverPackageAction2;

#endif 	/* __IWDTFInternalDriverPackageAction2_FWD_DEFINED__ */


#ifndef __WDTFDriverPackage2_FWD_DEFINED__
#define __WDTFDriverPackage2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFDriverPackage2 WDTFDriverPackage2;
#else
typedef struct WDTFDriverPackage2 WDTFDriverPackage2;
#endif /* __cplusplus */

#endif 	/* __WDTFDriverPackage2_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 



#ifndef __WDTFDriverPackageLib_LIBRARY_DEFINED__
#define __WDTFDriverPackageLib_LIBRARY_DEFINED__

/* library WDTFDriverPackageLib */
/* [helpstring][version][uuid] */ 


EXTERN_C const IID LIBID_WDTFDriverPackageLib;

#ifndef __IWDTFDriverPackageAction2_INTERFACE_DEFINED__
#define __IWDTFDriverPackageAction2_INTERFACE_DEFINED__

/* interface IWDTFDriverPackageAction2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFDriverPackageAction2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("36061CAE-C5E0-4D55-A012-0F666A2B80A4")
    IWDTFDriverPackageAction2 : public IWDTFAction2
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetPackageInfFileName( 
            /* [in] */ __RPC__in BSTR pDriverPackageInfFileName) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_InfFileName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ClassGuid( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_ClassName( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Provider( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Version( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Date( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_CatalogFile( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_HasCatalog( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_IsImported( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbImported) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_DigitalSigner( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_IsDigitalSigned( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_IsDigitalSignerTrusted( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetQueryForDeviceUsingPackage( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pSDEL) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetQueryForDeviceThatCanUsePackage( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pSDEL) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Compare( 
            /* [in] */ __RPC__in_opt IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsIdentical) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFDriverPackageAction2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
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
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetPackageInfFileName )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [in] */ __RPC__in BSTR pDriverPackageInfFileName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_InfFileName )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ClassGuid )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ClassName )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Provider )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Date )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CatalogFile )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HasCatalog )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsImported )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbImported);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DigitalSigner )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsDigitalSigned )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsDigitalSignerTrusted )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetQueryForDeviceUsingPackage )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pSDEL);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetQueryForDeviceThatCanUsePackage )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pSDEL);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Compare )( 
            __RPC__in IWDTFDriverPackageAction2 * This,
            /* [in] */ __RPC__in_opt IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsIdentical);
        
        END_INTERFACE
    } IWDTFDriverPackageAction2Vtbl;

    interface IWDTFDriverPackageAction2
    {
        CONST_VTBL struct IWDTFDriverPackageAction2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFDriverPackageAction2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFDriverPackageAction2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFDriverPackageAction2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFDriverPackageAction2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFDriverPackageAction2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFDriverPackageAction2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFDriverPackageAction2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFDriverPackageAction2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFDriverPackageAction2_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 

#define IWDTFDriverPackageAction2_get_Target(This,retval)	\
    ( (This)->lpVtbl -> get_Target(This,retval) ) 

#define IWDTFDriverPackageAction2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFDriverPackageAction2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFDriverPackageAction2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFDriverPackageAction2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFDriverPackageAction2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFDriverPackageAction2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFDriverPackageAction2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFDriverPackageAction2_SetPackageInfFileName(This,pDriverPackageInfFileName)	\
    ( (This)->lpVtbl -> SetPackageInfFileName(This,pDriverPackageInfFileName) ) 

#define IWDTFDriverPackageAction2_get_InfFileName(This,pVal)	\
    ( (This)->lpVtbl -> get_InfFileName(This,pVal) ) 

#define IWDTFDriverPackageAction2_get_ClassGuid(This,pVal)	\
    ( (This)->lpVtbl -> get_ClassGuid(This,pVal) ) 

#define IWDTFDriverPackageAction2_get_ClassName(This,pVal)	\
    ( (This)->lpVtbl -> get_ClassName(This,pVal) ) 

#define IWDTFDriverPackageAction2_get_Provider(This,pVal)	\
    ( (This)->lpVtbl -> get_Provider(This,pVal) ) 

#define IWDTFDriverPackageAction2_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IWDTFDriverPackageAction2_get_Date(This,pVal)	\
    ( (This)->lpVtbl -> get_Date(This,pVal) ) 

#define IWDTFDriverPackageAction2_get_CatalogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_CatalogFile(This,pVal) ) 

#define IWDTFDriverPackageAction2_get_HasCatalog(This,pbVal)	\
    ( (This)->lpVtbl -> get_HasCatalog(This,pbVal) ) 

#define IWDTFDriverPackageAction2_get_IsImported(This,pbImported)	\
    ( (This)->lpVtbl -> get_IsImported(This,pbImported) ) 

#define IWDTFDriverPackageAction2_get_DigitalSigner(This,pVal)	\
    ( (This)->lpVtbl -> get_DigitalSigner(This,pVal) ) 

#define IWDTFDriverPackageAction2_get_IsDigitalSigned(This,pbVal)	\
    ( (This)->lpVtbl -> get_IsDigitalSigned(This,pbVal) ) 

#define IWDTFDriverPackageAction2_get_IsDigitalSignerTrusted(This,pbVal)	\
    ( (This)->lpVtbl -> get_IsDigitalSignerTrusted(This,pbVal) ) 

#define IWDTFDriverPackageAction2_GetQueryForDeviceUsingPackage(This,pSDEL)	\
    ( (This)->lpVtbl -> GetQueryForDeviceUsingPackage(This,pSDEL) ) 

#define IWDTFDriverPackageAction2_GetQueryForDeviceThatCanUsePackage(This,pSDEL)	\
    ( (This)->lpVtbl -> GetQueryForDeviceThatCanUsePackage(This,pSDEL) ) 

#define IWDTFDriverPackageAction2_Compare(This,pDp,pbIsIdentical)	\
    ( (This)->lpVtbl -> Compare(This,pDp,pbIsIdentical) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFDriverPackageAction2_INTERFACE_DEFINED__ */


#ifndef __IWDTFInternalDriverPackageAction2_INTERFACE_DEFINED__
#define __IWDTFInternalDriverPackageAction2_INTERFACE_DEFINED__

/* interface IWDTFInternalDriverPackageAction2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFInternalDriverPackageAction2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("B1B7EA58-3AE2-4F81-926D-EFA7C3F9122B")
    IWDTFInternalDriverPackageAction2 : public IWDTFDriverPackageAction2
    {
    public:
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_InfFileNamePath( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][id][propput] */ HRESULT STDMETHODCALLTYPE put_InfFileNamePath( 
            /* [in] */ __RPC__in BSTR pVal) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_HardwareIDs( 
            /* [retval][out] */ __RPC__deref_out_opt /* external definition not present */ IWDTFStrings2 **pStrings) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFInternalDriverPackageAction2Vtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
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
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][propget][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out BOOLEAN *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out HRESULT *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *retval);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetPackageInfFileName )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [in] */ __RPC__in BSTR pDriverPackageInfFileName);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_InfFileName )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ClassGuid )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_ClassName )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Provider )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Version )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Date )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_CatalogFile )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HasCatalog )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsImported )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbImported);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_DigitalSigner )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsDigitalSigned )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_IsDigitalSignerTrusted )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetQueryForDeviceUsingPackage )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pSDEL);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetQueryForDeviceThatCanUsePackage )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pSDEL);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Compare )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [in] */ __RPC__in_opt IWDTFDriverPackageAction2 *pDp,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsIdentical);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_InfFileNamePath )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][id][propput] */ HRESULT ( STDMETHODCALLTYPE *put_InfFileNamePath )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [in] */ __RPC__in BSTR pVal);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_HardwareIDs )( 
            __RPC__in IWDTFInternalDriverPackageAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt /* external definition not present */ IWDTFStrings2 **pStrings);
        
        END_INTERFACE
    } IWDTFInternalDriverPackageAction2Vtbl;

    interface IWDTFInternalDriverPackageAction2
    {
        CONST_VTBL struct IWDTFInternalDriverPackageAction2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFInternalDriverPackageAction2_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define IWDTFInternalDriverPackageAction2_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define IWDTFInternalDriverPackageAction2_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define IWDTFInternalDriverPackageAction2_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define IWDTFInternalDriverPackageAction2_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define IWDTFInternalDriverPackageAction2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define IWDTFInternalDriverPackageAction2_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define IWDTFInternalDriverPackageAction2_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define IWDTFInternalDriverPackageAction2_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 

#define IWDTFInternalDriverPackageAction2_get_Target(This,retval)	\
    ( (This)->lpVtbl -> get_Target(This,retval) ) 

#define IWDTFInternalDriverPackageAction2_EnableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This,retval) ) 

#define IWDTFInternalDriverPackageAction2_DisableObjectErrorLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This,retval) ) 

#define IWDTFInternalDriverPackageAction2_EnableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This,retval) ) 

#define IWDTFInternalDriverPackageAction2_DisableObjectLogging(This,retval)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This,retval) ) 

#define IWDTFInternalDriverPackageAction2_IsStatusSuccess(This,retval)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,retval) ) 

#define IWDTFInternalDriverPackageAction2_GetStatus(This,retval)	\
    ( (This)->lpVtbl -> GetStatus(This,retval) ) 

#define IWDTFInternalDriverPackageAction2_GetStatusString(This,retval)	\
    ( (This)->lpVtbl -> GetStatusString(This,retval) ) 


#define IWDTFInternalDriverPackageAction2_SetPackageInfFileName(This,pDriverPackageInfFileName)	\
    ( (This)->lpVtbl -> SetPackageInfFileName(This,pDriverPackageInfFileName) ) 

#define IWDTFInternalDriverPackageAction2_get_InfFileName(This,pVal)	\
    ( (This)->lpVtbl -> get_InfFileName(This,pVal) ) 

#define IWDTFInternalDriverPackageAction2_get_ClassGuid(This,pVal)	\
    ( (This)->lpVtbl -> get_ClassGuid(This,pVal) ) 

#define IWDTFInternalDriverPackageAction2_get_ClassName(This,pVal)	\
    ( (This)->lpVtbl -> get_ClassName(This,pVal) ) 

#define IWDTFInternalDriverPackageAction2_get_Provider(This,pVal)	\
    ( (This)->lpVtbl -> get_Provider(This,pVal) ) 

#define IWDTFInternalDriverPackageAction2_get_Version(This,pVal)	\
    ( (This)->lpVtbl -> get_Version(This,pVal) ) 

#define IWDTFInternalDriverPackageAction2_get_Date(This,pVal)	\
    ( (This)->lpVtbl -> get_Date(This,pVal) ) 

#define IWDTFInternalDriverPackageAction2_get_CatalogFile(This,pVal)	\
    ( (This)->lpVtbl -> get_CatalogFile(This,pVal) ) 

#define IWDTFInternalDriverPackageAction2_get_HasCatalog(This,pbVal)	\
    ( (This)->lpVtbl -> get_HasCatalog(This,pbVal) ) 

#define IWDTFInternalDriverPackageAction2_get_IsImported(This,pbImported)	\
    ( (This)->lpVtbl -> get_IsImported(This,pbImported) ) 

#define IWDTFInternalDriverPackageAction2_get_DigitalSigner(This,pVal)	\
    ( (This)->lpVtbl -> get_DigitalSigner(This,pVal) ) 

#define IWDTFInternalDriverPackageAction2_get_IsDigitalSigned(This,pbVal)	\
    ( (This)->lpVtbl -> get_IsDigitalSigned(This,pbVal) ) 

#define IWDTFInternalDriverPackageAction2_get_IsDigitalSignerTrusted(This,pbVal)	\
    ( (This)->lpVtbl -> get_IsDigitalSignerTrusted(This,pbVal) ) 

#define IWDTFInternalDriverPackageAction2_GetQueryForDeviceUsingPackage(This,pSDEL)	\
    ( (This)->lpVtbl -> GetQueryForDeviceUsingPackage(This,pSDEL) ) 

#define IWDTFInternalDriverPackageAction2_GetQueryForDeviceThatCanUsePackage(This,pSDEL)	\
    ( (This)->lpVtbl -> GetQueryForDeviceThatCanUsePackage(This,pSDEL) ) 

#define IWDTFInternalDriverPackageAction2_Compare(This,pDp,pbIsIdentical)	\
    ( (This)->lpVtbl -> Compare(This,pDp,pbIsIdentical) ) 


#define IWDTFInternalDriverPackageAction2_get_InfFileNamePath(This,pVal)	\
    ( (This)->lpVtbl -> get_InfFileNamePath(This,pVal) ) 

#define IWDTFInternalDriverPackageAction2_put_InfFileNamePath(This,pVal)	\
    ( (This)->lpVtbl -> put_InfFileNamePath(This,pVal) ) 

#define IWDTFInternalDriverPackageAction2_get_HardwareIDs(This,pStrings)	\
    ( (This)->lpVtbl -> get_HardwareIDs(This,pStrings) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFInternalDriverPackageAction2_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_WDTFDriverPackage2;

#ifdef __cplusplus

class DECLSPEC_UUID("0D7237E6-930F-4682-AD0A-52EBFFD3AEE3")
WDTFDriverPackage2;
#endif
#endif /* __WDTFDriverPackageLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


