

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for wdtfinterfaces.idl:
    Oicf, W1, Zp8, env=Win64 (32b run), target_arch=IA64 7.00.0555 
    protocol : dce , ms_ext, c_ext, robust
    error checks: allocation ref bounds_check enum stub_data 
    VC __declspec() decoration level: 
         __declspec(uuid()), __declspec(selectany), __declspec(novtable)
         DECLSPEC_UUID(), MIDL_INTERFACE()
*/
/* @@MIDL_FILE_HEADING(  ) */

#pragma warning( disable: 4049 )  /* more than 64k source lines */


/* verify that the <rpcndr.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCNDR_H_VERSION__
#define __REQUIRED_RPCNDR_H_VERSION__ 475
#endif

/* verify that the <rpcsal.h> version is high enough to compile this file*/
#ifndef __REQUIRED_RPCSAL_H_VERSION__
#define __REQUIRED_RPCSAL_H_VERSION__ 100
#endif

#include "rpc.h"
#include "rpcndr.h"

#ifndef __RPCNDR_H_VERSION__
#error this stub requires an updated version of <rpcndr.h>
#endif // __RPCNDR_H_VERSION__

#ifndef COM_NO_WINDOWS_H
#include "windows.h"
#include "ole2.h"
#endif /*COM_NO_WINDOWS_H*/

#ifndef __wdtfinterfaces_h__
#define __wdtfinterfaces_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IBogusUnreferenced_WDTFInterfaces_FWD_DEFINED__
#define __IBogusUnreferenced_WDTFInterfaces_FWD_DEFINED__
typedef interface IBogusUnreferenced_WDTFInterfaces IBogusUnreferenced_WDTFInterfaces;
#endif 	/* __IBogusUnreferenced_WDTFInterfaces_FWD_DEFINED__ */


#ifndef __ISimpleIO_Status_FWD_DEFINED__
#define __ISimpleIO_Status_FWD_DEFINED__
typedef interface ISimpleIO_Status ISimpleIO_Status;
#endif 	/* __ISimpleIO_Status_FWD_DEFINED__ */


#ifndef __ISimpleIO_MTest_FWD_DEFINED__
#define __ISimpleIO_MTest_FWD_DEFINED__
typedef interface ISimpleIO_MTest ISimpleIO_MTest;
#endif 	/* __ISimpleIO_MTest_FWD_DEFINED__ */


#ifndef __ISimpleIO_StandardStatus_FWD_DEFINED__
#define __ISimpleIO_StandardStatus_FWD_DEFINED__
typedef interface ISimpleIO_StandardStatus ISimpleIO_StandardStatus;
#endif 	/* __ISimpleIO_StandardStatus_FWD_DEFINED__ */


#ifndef __ISimpleIO_Action_FWD_DEFINED__
#define __ISimpleIO_Action_FWD_DEFINED__
typedef interface ISimpleIO_Action ISimpleIO_Action;
#endif 	/* __ISimpleIO_Action_FWD_DEFINED__ */


#ifndef __SimpleIO_StandardStatus_FWD_DEFINED__
#define __SimpleIO_StandardStatus_FWD_DEFINED__

#ifdef __cplusplus
typedef class SimpleIO_StandardStatus SimpleIO_StandardStatus;
#else
typedef struct SimpleIO_StandardStatus SimpleIO_StandardStatus;
#endif /* __cplusplus */

#endif 	/* __SimpleIO_StandardStatus_FWD_DEFINED__ */


#ifndef __SimpleIO_MTest_FWD_DEFINED__
#define __SimpleIO_MTest_FWD_DEFINED__

#ifdef __cplusplus
typedef class SimpleIO_MTest SimpleIO_MTest;
#else
typedef struct SimpleIO_MTest SimpleIO_MTest;
#endif /* __cplusplus */

#endif 	/* __SimpleIO_MTest_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


#ifndef __IBogusUnreferenced_WDTFInterfaces_INTERFACE_DEFINED__
#define __IBogusUnreferenced_WDTFInterfaces_INTERFACE_DEFINED__

/* interface IBogusUnreferenced_WDTFInterfaces */
/* [unique][helpstring][nonextensible][uuid][object] */ 


EXTERN_C const IID IID_IBogusUnreferenced_WDTFInterfaces;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("AA8168CE-5F3B-49CB-A21B-BA6AACFB093E")
    IBogusUnreferenced_WDTFInterfaces : public IUnknown
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct IBogusUnreferenced_WDTFInterfacesVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IBogusUnreferenced_WDTFInterfaces * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IBogusUnreferenced_WDTFInterfaces * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IBogusUnreferenced_WDTFInterfaces * This);
        
        END_INTERFACE
    } IBogusUnreferenced_WDTFInterfacesVtbl;

    interface IBogusUnreferenced_WDTFInterfaces
    {
        CONST_VTBL struct IBogusUnreferenced_WDTFInterfacesVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IBogusUnreferenced_WDTFInterfaces_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IBogusUnreferenced_WDTFInterfaces_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IBogusUnreferenced_WDTFInterfaces_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IBogusUnreferenced_WDTFInterfaces_INTERFACE_DEFINED__ */



#ifndef __WDTFInterfacesLib_LIBRARY_DEFINED__
#define __WDTFInterfacesLib_LIBRARY_DEFINED__

/* library WDTFInterfacesLib */
/* [helpstring][version][uuid] */ 

typedef /* [public][public][uuid] */  DECLSPEC_UUID("0804BED0-BE8B-46c7-A6C2-85D4362F68B8") 
enum __MIDL___MIDL_itf_wdtfinterfaces_0000_0001_0001
    {	SimpleIO_Stopped	= 0,
	SimpleIO_Started	= ( SimpleIO_Stopped + 1 ) ,
	SimpleIO_Paused	= ( SimpleIO_Started + 1 ) ,
	SimpleIO_Stopping	= ( SimpleIO_Paused + 1 ) ,
	SimpleIO_Pausing	= ( SimpleIO_Stopping + 1 ) 
    } 	TSimpleIO_MTestState;


EXTERN_C const IID LIBID_WDTFInterfacesLib;

#ifndef __ISimpleIO_Status_INTERFACE_DEFINED__
#define __ISimpleIO_Status_INTERFACE_DEFINED__

/* interface ISimpleIO_Status */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ISimpleIO_Status;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("1EAE3EF3-9891-45B6-8074-646BE9A83038")
    ISimpleIO_Status : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE ProvideHRESULT( 
            /* [in] */ HRESULT hr) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISimpleIO_StatusVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ISimpleIO_Status * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ISimpleIO_Status * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ISimpleIO_Status * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ISimpleIO_Status * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ISimpleIO_Status * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ISimpleIO_Status * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISimpleIO_Status * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ProvideHRESULT )( 
            __RPC__in ISimpleIO_Status * This,
            /* [in] */ HRESULT hr);
        
        END_INTERFACE
    } ISimpleIO_StatusVtbl;

    interface ISimpleIO_Status
    {
        CONST_VTBL struct ISimpleIO_StatusVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISimpleIO_Status_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISimpleIO_Status_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISimpleIO_Status_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISimpleIO_Status_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ISimpleIO_Status_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ISimpleIO_Status_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ISimpleIO_Status_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ISimpleIO_Status_ProvideHRESULT(This,hr)	\
    ( (This)->lpVtbl -> ProvideHRESULT(This,hr) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISimpleIO_Status_INTERFACE_DEFINED__ */


#ifndef __ISimpleIO_MTest_INTERFACE_DEFINED__
#define __ISimpleIO_MTest_INTERFACE_DEFINED__

/* interface ISimpleIO_MTest */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ISimpleIO_MTest;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("D7FE62C4-EE6B-4A5A-B936-B3F18734ACC1")
    ISimpleIO_MTest : public IAction
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Start( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Stop( 
            /* [optional][in] */ VARIANT bAsync) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Pause( 
            /* [optional][in] */ VARIANT bAsync) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Continue( void) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Status( 
            /* [retval][out] */ __RPC__deref_out_opt ISimpleIO_Status **ppStatus) = 0;
        
        virtual /* [helpstring][propput] */ HRESULT STDMETHODCALLTYPE put_Status( 
            /* [in] */ __RPC__in_opt ISimpleIO_Status *pNewStatus) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_State( 
            /* [retval][out] */ __RPC__out TSimpleIO_MTestState *pState) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISimpleIO_MTestVtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in ISimpleIO_MTest * This,
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
            __RPC__in ISimpleIO_MTest * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Start )( 
            __RPC__in ISimpleIO_MTest * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Stop )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [optional][in] */ VARIANT bAsync);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Pause )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [optional][in] */ VARIANT bAsync);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Continue )( 
            __RPC__in ISimpleIO_MTest * This);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Status )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [retval][out] */ __RPC__deref_out_opt ISimpleIO_Status **ppStatus);
        
        /* [helpstring][propput] */ HRESULT ( STDMETHODCALLTYPE *put_Status )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [in] */ __RPC__in_opt ISimpleIO_Status *pNewStatus);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_State )( 
            __RPC__in ISimpleIO_MTest * This,
            /* [retval][out] */ __RPC__out TSimpleIO_MTestState *pState);
        
        END_INTERFACE
    } ISimpleIO_MTestVtbl;

    interface ISimpleIO_MTest
    {
        CONST_VTBL struct ISimpleIO_MTestVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISimpleIO_MTest_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define ISimpleIO_MTest_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define ISimpleIO_MTest_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define ISimpleIO_MTest_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define ISimpleIO_MTest_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define ISimpleIO_MTest_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define ISimpleIO_MTest_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define ISimpleIO_MTest_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define ISimpleIO_MTest_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 


#define ISimpleIO_MTest_Start(This)	\
    ( (This)->lpVtbl -> Start(This) ) 

#define ISimpleIO_MTest_Stop(This,bAsync)	\
    ( (This)->lpVtbl -> Stop(This,bAsync) ) 

#define ISimpleIO_MTest_Pause(This,bAsync)	\
    ( (This)->lpVtbl -> Pause(This,bAsync) ) 

#define ISimpleIO_MTest_Continue(This)	\
    ( (This)->lpVtbl -> Continue(This) ) 

#define ISimpleIO_MTest_get_Status(This,ppStatus)	\
    ( (This)->lpVtbl -> get_Status(This,ppStatus) ) 

#define ISimpleIO_MTest_put_Status(This,pNewStatus)	\
    ( (This)->lpVtbl -> put_Status(This,pNewStatus) ) 

#define ISimpleIO_MTest_get_State(This,pState)	\
    ( (This)->lpVtbl -> get_State(This,pState) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISimpleIO_MTest_INTERFACE_DEFINED__ */


#ifndef __ISimpleIO_StandardStatus_INTERFACE_DEFINED__
#define __ISimpleIO_StandardStatus_INTERFACE_DEFINED__

/* interface ISimpleIO_StandardStatus */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ISimpleIO_StandardStatus;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("FDB452FD-B099-4366-9A6A-A9F0172AF65E")
    ISimpleIO_StandardStatus : public ISimpleIO_Status
    {
    public:
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_SCount( 
            /* [retval][out] */ __RPC__out LONG *pVal) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_FCount( 
            /* [retval][out] */ __RPC__out LONG *pVal) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE AssertSuccess( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISimpleIO_StandardStatusVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ISimpleIO_StandardStatus * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ISimpleIO_StandardStatus * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ISimpleIO_StandardStatus * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ISimpleIO_StandardStatus * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ISimpleIO_StandardStatus * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ISimpleIO_StandardStatus * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISimpleIO_StandardStatus * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *ProvideHRESULT )( 
            __RPC__in ISimpleIO_StandardStatus * This,
            /* [in] */ HRESULT hr);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_SCount )( 
            __RPC__in ISimpleIO_StandardStatus * This,
            /* [retval][out] */ __RPC__out LONG *pVal);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_FCount )( 
            __RPC__in ISimpleIO_StandardStatus * This,
            /* [retval][out] */ __RPC__out LONG *pVal);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *AssertSuccess )( 
            __RPC__in ISimpleIO_StandardStatus * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            __RPC__in ISimpleIO_StandardStatus * This);
        
        END_INTERFACE
    } ISimpleIO_StandardStatusVtbl;

    interface ISimpleIO_StandardStatus
    {
        CONST_VTBL struct ISimpleIO_StandardStatusVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISimpleIO_StandardStatus_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISimpleIO_StandardStatus_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISimpleIO_StandardStatus_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISimpleIO_StandardStatus_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ISimpleIO_StandardStatus_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ISimpleIO_StandardStatus_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ISimpleIO_StandardStatus_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ISimpleIO_StandardStatus_ProvideHRESULT(This,hr)	\
    ( (This)->lpVtbl -> ProvideHRESULT(This,hr) ) 


#define ISimpleIO_StandardStatus_get_SCount(This,pVal)	\
    ( (This)->lpVtbl -> get_SCount(This,pVal) ) 

#define ISimpleIO_StandardStatus_get_FCount(This,pVal)	\
    ( (This)->lpVtbl -> get_FCount(This,pVal) ) 

#define ISimpleIO_StandardStatus_AssertSuccess(This)	\
    ( (This)->lpVtbl -> AssertSuccess(This) ) 

#define ISimpleIO_StandardStatus_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISimpleIO_StandardStatus_INTERFACE_DEFINED__ */


#ifndef __ISimpleIO_Action_INTERFACE_DEFINED__
#define __ISimpleIO_Action_INTERFACE_DEFINED__

/* interface ISimpleIO_Action */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ISimpleIO_Action;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("4C6F34CA-0007-433D-ACF5-F794B6025B78")
    ISimpleIO_Action : public IAction
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Open( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE RunIO( void) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE Close( void) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISimpleIO_ActionVtbl
    {
        BEGIN_INTERFACE
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ISimpleIO_Action * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **ppvObj,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ISimpleIO_Action * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ISimpleIO_Action * This,
            /* [retval][out] */ __RPC__out unsigned long *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ISimpleIO_Action * This,
            /* [out][idldescattr] */ __RPC__out unsigned UINT *pctinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ISimpleIO_Action * This,
            /* [in][idldescattr] */ unsigned UINT itinfo,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__deref_out_opt void **pptinfo,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ISimpleIO_Action * This,
            /* [in][idldescattr] */ __RPC__in struct GUID *riid,
            /* [in][idldescattr] */ __RPC__deref_in_opt signed char **rgszNames,
            /* [in][idldescattr] */ unsigned UINT cNames,
            /* [in][idldescattr] */ unsigned long lcid,
            /* [out][idldescattr] */ __RPC__out signed long *rgdispid,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][restricted][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            __RPC__in ISimpleIO_Action * This,
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
            __RPC__in ISimpleIO_Action * This,
            /* [in][idldescattr] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [id][funcdescattr] */ HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in ISimpleIO_Action * This,
            /* [in][idldescattr] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in][idldescattr] */ VARIANT MoreTargets,
            /* [retval][out] */ __RPC__out void *retval);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Open )( 
            __RPC__in ISimpleIO_Action * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *RunIO )( 
            __RPC__in ISimpleIO_Action * This);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *Close )( 
            __RPC__in ISimpleIO_Action * This);
        
        END_INTERFACE
    } ISimpleIO_ActionVtbl;

    interface ISimpleIO_Action
    {
        CONST_VTBL struct ISimpleIO_ActionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISimpleIO_Action_QueryInterface(This,riid,ppvObj,retval)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObj,retval) ) 

#define ISimpleIO_Action_AddRef(This,retval)	\
    ( (This)->lpVtbl -> AddRef(This,retval) ) 

#define ISimpleIO_Action_Release(This,retval)	\
    ( (This)->lpVtbl -> Release(This,retval) ) 

#define ISimpleIO_Action_GetTypeInfoCount(This,pctinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo,retval) ) 

#define ISimpleIO_Action_GetTypeInfo(This,itinfo,lcid,pptinfo,retval)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,itinfo,lcid,pptinfo,retval) ) 

#define ISimpleIO_Action_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgdispid,retval) ) 

#define ISimpleIO_Action_Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval)	\
    ( (This)->lpVtbl -> Invoke(This,dispidMember,riid,lcid,wFlags,pdispparams,pvarResult,pexcepinfo,puArgErr,retval) ) 

#define ISimpleIO_Action_SetTraceLevel(This,Level,retval)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level,retval) ) 

#define ISimpleIO_Action_SetTarget(This,pMainTarget,MoreTargets,retval)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets,retval) ) 


#define ISimpleIO_Action_Open(This)	\
    ( (This)->lpVtbl -> Open(This) ) 

#define ISimpleIO_Action_RunIO(This)	\
    ( (This)->lpVtbl -> RunIO(This) ) 

#define ISimpleIO_Action_Close(This)	\
    ( (This)->lpVtbl -> Close(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISimpleIO_Action_INTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_SimpleIO_StandardStatus;

#ifdef __cplusplus

class DECLSPEC_UUID("ED05EF76-09A9-4409-90CA-C5D0711CA057")
SimpleIO_StandardStatus;
#endif

EXTERN_C const CLSID CLSID_SimpleIO_MTest;

#ifdef __cplusplus

class DECLSPEC_UUID("5EAE59BE-6946-44B7-A7B3-1D59811B246A")
SimpleIO_MTest;
#endif
#endif /* __WDTFInterfacesLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


