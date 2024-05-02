

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 7.00.0555 */
/* Compiler settings for wdtf.idl:
    Oicf, W1, Zp8, env=Win64 (32b run), target_arch=AMD64 7.00.0555 
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

#ifndef __wdtf_h__
#define __wdtf_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IBogusUnreferenced_FWD_DEFINED__
#define __IBogusUnreferenced_FWD_DEFINED__
typedef interface IBogusUnreferenced IBogusUnreferenced;
#endif 	/* __IBogusUnreferenced_FWD_DEFINED__ */


#ifndef __ITracing_FWD_DEFINED__
#define __ITracing_FWD_DEFINED__
typedef interface ITracing ITracing;
#endif 	/* __ITracing_FWD_DEFINED__ */


#ifndef __IAction_FWD_DEFINED__
#define __IAction_FWD_DEFINED__
typedef interface IAction IAction;
#endif 	/* __IAction_FWD_DEFINED__ */


#ifndef __ITracer_FWD_DEFINED__
#define __ITracer_FWD_DEFINED__
typedef interface ITracer ITracer;
#endif 	/* __ITracer_FWD_DEFINED__ */


#ifndef __ITarget_FWD_DEFINED__
#define __ITarget_FWD_DEFINED__
typedef interface ITarget ITarget;
#endif 	/* __ITarget_FWD_DEFINED__ */


#ifndef __ITargets_FWD_DEFINED__
#define __ITargets_FWD_DEFINED__
typedef interface ITargets ITargets;
#endif 	/* __ITargets_FWD_DEFINED__ */


#ifndef __IDeviceDepot_FWD_DEFINED__
#define __IDeviceDepot_FWD_DEFINED__
typedef interface IDeviceDepot IDeviceDepot;
#endif 	/* __IDeviceDepot_FWD_DEFINED__ */


#ifndef __ISystemDepot_FWD_DEFINED__
#define __ISystemDepot_FWD_DEFINED__
typedef interface ISystemDepot ISystemDepot;
#endif 	/* __ISystemDepot_FWD_DEFINED__ */


#ifndef __IWDTF_FWD_DEFINED__
#define __IWDTF_FWD_DEFINED__
typedef interface IWDTF IWDTF;
#endif 	/* __IWDTF_FWD_DEFINED__ */


#ifndef ___IDeviceDepotEvents_FWD_DEFINED__
#define ___IDeviceDepotEvents_FWD_DEFINED__
typedef interface _IDeviceDepotEvents _IDeviceDepotEvents;
#endif 	/* ___IDeviceDepotEvents_FWD_DEFINED__ */


#ifndef __IMatchEventSource_FWD_DEFINED__
#define __IMatchEventSource_FWD_DEFINED__
typedef interface IMatchEventSource IMatchEventSource;
#endif 	/* __IMatchEventSource_FWD_DEFINED__ */


#ifndef __IMatchEvents_FWD_DEFINED__
#define __IMatchEvents_FWD_DEFINED__
typedef interface IMatchEvents IMatchEvents;
#endif 	/* __IMatchEvents_FWD_DEFINED__ */


#ifndef __Tracer_FWD_DEFINED__
#define __Tracer_FWD_DEFINED__

#ifdef __cplusplus
typedef class Tracer Tracer;
#else
typedef struct Tracer Tracer;
#endif /* __cplusplus */

#endif 	/* __Tracer_FWD_DEFINED__ */


#ifndef __WDTF_FWD_DEFINED__
#define __WDTF_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTF WDTF;
#else
typedef struct WDTF WDTF;
#endif /* __cplusplus */

#endif 	/* __WDTF_FWD_DEFINED__ */


#ifndef __Targets_FWD_DEFINED__
#define __Targets_FWD_DEFINED__

#ifdef __cplusplus
typedef class Targets Targets;
#else
typedef struct Targets Targets;
#endif /* __cplusplus */

#endif 	/* __Targets_FWD_DEFINED__ */


#ifndef __MatchEventSource_FWD_DEFINED__
#define __MatchEventSource_FWD_DEFINED__

#ifdef __cplusplus
typedef class MatchEventSource MatchEventSource;
#else
typedef struct MatchEventSource MatchEventSource;
#endif /* __cplusplus */

#endif 	/* __MatchEventSource_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_wdtf_0000_0000 */
/* [local] */ 







extern RPC_IF_HANDLE __MIDL_itf_wdtf_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_wdtf_0000_0000_v0_0_s_ifspec;

#ifndef __IBogusUnreferenced_INTERFACE_DEFINED__
#define __IBogusUnreferenced_INTERFACE_DEFINED__

/* interface IBogusUnreferenced */
/* [unique][helpstring][nonextensible][uuid][object] */ 


EXTERN_C const IID IID_IBogusUnreferenced;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("544A0C59-315A-45a3-A391-5CE3E7798613")
    IBogusUnreferenced : public IUnknown
    {
    public:
    };
    
#else 	/* C style interface */

    typedef struct IBogusUnreferencedVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IBogusUnreferenced * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IBogusUnreferenced * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IBogusUnreferenced * This);
        
        END_INTERFACE
    } IBogusUnreferencedVtbl;

    interface IBogusUnreferenced
    {
        CONST_VTBL struct IBogusUnreferencedVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IBogusUnreferenced_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IBogusUnreferenced_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IBogusUnreferenced_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IBogusUnreferenced_INTERFACE_DEFINED__ */



#ifndef __WDTFLib_LIBRARY_DEFINED__
#define __WDTFLib_LIBRARY_DEFINED__

/* library WDTFLib */
/* [helpstring][version][uuid] */ 

typedef /* [public][public][public][public][uuid] */  DECLSPEC_UUID("548DD0B0-70EA-4fa0-9251-A28DA88291ED") 
enum __MIDL___MIDL_itf_wdtf_0000_0001_0001
    {	Trace0_Off	= 0,
	Trace1_Low	= 1,
	Trace2_Medium	= 2,
	Trace3_High	= 3,
	Trace4_All	= 4,
	Trace5_Custom	= 5,
	Trace6_Custom	= 6,
	Trace7_Custom	= 7,
	Trace8_Custom	= 8,
	Trace_Default	= 9
    } 	TTraceLevel;


EXTERN_C const IID LIBID_WDTFLib;

#ifndef __ITracing_INTERFACE_DEFINED__
#define __ITracing_INTERFACE_DEFINED__

/* interface ITracing */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ITracing;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("B11605F7-2C8C-4EF2-87C0-10010079AF58")
    ITracing : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE SetTraceLevel( 
            /* [in] */ TTraceLevel Level) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITracingVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITracing * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITracing * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITracing * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITracing * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITracing * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITracing * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITracing * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in ITracing * This,
            /* [in] */ TTraceLevel Level);
        
        END_INTERFACE
    } ITracingVtbl;

    interface ITracing
    {
        CONST_VTBL struct ITracingVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITracing_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITracing_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITracing_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITracing_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITracing_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITracing_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITracing_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITracing_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITracing_INTERFACE_DEFINED__ */


#ifndef __IAction_INTERFACE_DEFINED__
#define __IAction_INTERFACE_DEFINED__

/* interface IAction */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IAction;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("163C58BE-DAFF-48B1-B1BC-F0D735CF3BF1")
    IAction : public ITracing
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE SetTarget( 
            /* [in] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in] */ VARIANT MoreTargets) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IActionVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IAction * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IAction * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IAction * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IAction * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IAction * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IAction * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IAction * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IAction * This,
            /* [in] */ TTraceLevel Level);
        
        HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IAction * This,
            /* [in] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in] */ VARIANT MoreTargets);
        
        END_INTERFACE
    } IActionVtbl;

    interface IAction
    {
        CONST_VTBL struct IActionVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IAction_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IAction_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IAction_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IAction_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IAction_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IAction_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IAction_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IAction_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IAction_SetTarget(This,pMainTarget,MoreTargets)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IAction_INTERFACE_DEFINED__ */


#ifndef __ITracer_INTERFACE_DEFINED__
#define __ITracer_INTERFACE_DEFINED__

/* interface ITracer */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ITracer;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("11682262-FB33-4CFB-9250-0577DAA9A8BF")
    ITracer : public IDispatch
    {
    public:
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetBits( 
            /* [in] */ CLSID ClassID,
            /* [in] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out DWORD *pBits) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetTlsSlot( 
            /* [retval][out] */ __RPC__out DWORD *pSlot) = 0;
        
        virtual /* [helpstring] */ HRESULT STDMETHODCALLTYPE GetBitsForLevel( 
            /* [in] */ __RPC__in BSTR TraceLevelPath,
            /* [in] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out DWORD *pBits) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITracerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITracer * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITracer * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITracer * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITracer * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITracer * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITracer * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITracer * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetBits )( 
            __RPC__in ITracer * This,
            /* [in] */ CLSID ClassID,
            /* [in] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out DWORD *pBits);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetTlsSlot )( 
            __RPC__in ITracer * This,
            /* [retval][out] */ __RPC__out DWORD *pSlot);
        
        /* [helpstring] */ HRESULT ( STDMETHODCALLTYPE *GetBitsForLevel )( 
            __RPC__in ITracer * This,
            /* [in] */ __RPC__in BSTR TraceLevelPath,
            /* [in] */ TTraceLevel Level,
            /* [retval][out] */ __RPC__out DWORD *pBits);
        
        END_INTERFACE
    } ITracerVtbl;

    interface ITracer
    {
        CONST_VTBL struct ITracerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITracer_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITracer_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITracer_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITracer_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITracer_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITracer_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITracer_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITracer_GetBits(This,ClassID,Level,pBits)	\
    ( (This)->lpVtbl -> GetBits(This,ClassID,Level,pBits) ) 

#define ITracer_GetTlsSlot(This,pSlot)	\
    ( (This)->lpVtbl -> GetTlsSlot(This,pSlot) ) 

#define ITracer_GetBitsForLevel(This,TraceLevelPath,Level,pBits)	\
    ( (This)->lpVtbl -> GetBitsForLevel(This,TraceLevelPath,Level,pBits) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITracer_INTERFACE_DEFINED__ */


#ifndef __ITarget_INTERFACE_DEFINED__
#define __ITarget_INTERFACE_DEFINED__

/* interface ITarget */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ITarget;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("258E9C41-29B7-4A66-87DB-23342246438D")
    ITarget : public ITracing
    {
    public:
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_WDTF( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTF **ppWDTF) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_Type( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_Context( 
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__out VARIANT *pVal) = 0;
        
        virtual /* [helpstring][propput][id] */ HRESULT STDMETHODCALLTYPE put_Context( 
            /* [in] */ __RPC__in BSTR Tag,
            /* [in] */ VARIANT newVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Eval( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetValue( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT *pValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetInterface( 
            /* [in] */ __RPC__in BSTR ProgID,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IAction **ppInterface) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetRelations( 
            /* [in] */ __RPC__in BSTR RelationSDEL,
            /* [in] */ __RPC__in BSTR MatchSDEL,
            /* [retval][out] */ __RPC__deref_out_opt ITargets **ppRelations) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITargetVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITarget * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITarget * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITarget * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITarget * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITarget * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITarget * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITarget * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in ITarget * This,
            /* [in] */ TTraceLevel Level);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_WDTF )( 
            __RPC__in ITarget * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTF **ppWDTF);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Type )( 
            __RPC__in ITarget * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Context )( 
            __RPC__in ITarget * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__out VARIANT *pVal);
        
        /* [helpstring][propput][id] */ HRESULT ( STDMETHODCALLTYPE *put_Context )( 
            __RPC__in ITarget * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [in] */ VARIANT newVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Eval )( 
            __RPC__in ITarget * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValue )( 
            __RPC__in ITarget * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT *pValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetInterface )( 
            __RPC__in ITarget * This,
            /* [in] */ __RPC__in BSTR ProgID,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IAction **ppInterface);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetRelations )( 
            __RPC__in ITarget * This,
            /* [in] */ __RPC__in BSTR RelationSDEL,
            /* [in] */ __RPC__in BSTR MatchSDEL,
            /* [retval][out] */ __RPC__deref_out_opt ITargets **ppRelations);
        
        END_INTERFACE
    } ITargetVtbl;

    interface ITarget
    {
        CONST_VTBL struct ITargetVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITarget_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITarget_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITarget_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITarget_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITarget_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITarget_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITarget_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITarget_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define ITarget_get_WDTF(This,ppWDTF)	\
    ( (This)->lpVtbl -> get_WDTF(This,ppWDTF) ) 

#define ITarget_get_Type(This,pVal)	\
    ( (This)->lpVtbl -> get_Type(This,pVal) ) 

#define ITarget_get_Context(This,Tag,pVal)	\
    ( (This)->lpVtbl -> get_Context(This,Tag,pVal) ) 

#define ITarget_put_Context(This,Tag,newVal)	\
    ( (This)->lpVtbl -> put_Context(This,Tag,newVal) ) 

#define ITarget_Eval(This,SDEL,pResult)	\
    ( (This)->lpVtbl -> Eval(This,SDEL,pResult) ) 

#define ITarget_GetValue(This,SDEL,pValue)	\
    ( (This)->lpVtbl -> GetValue(This,SDEL,pValue) ) 

#define ITarget_GetInterface(This,ProgID,Args,MonikerSuffix,ppInterface)	\
    ( (This)->lpVtbl -> GetInterface(This,ProgID,Args,MonikerSuffix,ppInterface) ) 

#define ITarget_GetRelations(This,RelationSDEL,MatchSDEL,ppRelations)	\
    ( (This)->lpVtbl -> GetRelations(This,RelationSDEL,MatchSDEL,ppRelations) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITarget_INTERFACE_DEFINED__ */


#ifndef __ITargets_INTERFACE_DEFINED__
#define __ITargets_INTERFACE_DEFINED__

/* interface ITargets */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ITargets;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("F5F76D45-79F4-426B-B112-E316C80C9B93")
    ITargets : public ITracing
    {
    public:
        virtual /* [hidden][helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt ITarget **ppTarget) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out LONG *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Add( 
            /* [in] */ __RPC__in_opt ITarget *pTarget) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Remove( 
            /* [in] */ __RPC__in_opt ITarget *pTarget) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Query( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt ITargets **ppTargets) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ITargetsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ITargets * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ITargets * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ITargets * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ITargets * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ITargets * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ITargets * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ITargets * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in ITargets * This,
            /* [in] */ TTraceLevel Level);
        
        /* [hidden][helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in ITargets * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in ITargets * This,
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt ITarget **ppTarget);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in ITargets * This,
            /* [retval][out] */ __RPC__out LONG *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Add )( 
            __RPC__in ITargets * This,
            /* [in] */ __RPC__in_opt ITarget *pTarget);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Remove )( 
            __RPC__in ITargets * This,
            /* [in] */ __RPC__in_opt ITarget *pTarget);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            __RPC__in ITargets * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Query )( 
            __RPC__in ITargets * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt ITargets **ppTargets);
        
        END_INTERFACE
    } ITargetsVtbl;

    interface ITargets
    {
        CONST_VTBL struct ITargetsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ITargets_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ITargets_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ITargets_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ITargets_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ITargets_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ITargets_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ITargets_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ITargets_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define ITargets_get__NewEnum(This,ppNewEnum)	\
    ( (This)->lpVtbl -> get__NewEnum(This,ppNewEnum) ) 

#define ITargets_get_Item(This,Index,ppTarget)	\
    ( (This)->lpVtbl -> get_Item(This,Index,ppTarget) ) 

#define ITargets_get_Count(This,pVal)	\
    ( (This)->lpVtbl -> get_Count(This,pVal) ) 

#define ITargets_Add(This,pTarget)	\
    ( (This)->lpVtbl -> Add(This,pTarget) ) 

#define ITargets_Remove(This,pTarget)	\
    ( (This)->lpVtbl -> Remove(This,pTarget) ) 

#define ITargets_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define ITargets_Query(This,SDEL,ppTargets)	\
    ( (This)->lpVtbl -> Query(This,SDEL,ppTargets) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ITargets_INTERFACE_DEFINED__ */


#ifndef __IDeviceDepot_INTERFACE_DEFINED__
#define __IDeviceDepot_INTERFACE_DEFINED__

/* interface IDeviceDepot */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IDeviceDepot;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("39F87079-4FB8-48F6-B8DE-E6DD04001673")
    IDeviceDepot : public ITracing
    {
    public:
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_WDTF( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTF **ppWDTF) = 0;
        
        virtual /* [hidden][helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt ITarget **ppTarget) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out LONG *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Query( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt ITargets **ppTargets) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_RootDevice( 
            /* [retval][out] */ __RPC__deref_out_opt ITarget **pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetMatchEventSource( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IMatchEventSource **ppMatchEventSource) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE UpdateAndReportMatches( void) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_QueryRemoveEventEnabled( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal) = 0;
        
        virtual /* [helpstring][propput][id] */ HRESULT STDMETHODCALLTYPE put_QueryRemoveEventEnabled( 
            /* [in] */ VARIANT_BOOL newVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IDeviceDepotVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IDeviceDepot * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IDeviceDepot * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IDeviceDepot * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IDeviceDepot * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IDeviceDepot * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IDeviceDepot * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IDeviceDepot * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IDeviceDepot * This,
            /* [in] */ TTraceLevel Level);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_WDTF )( 
            __RPC__in IDeviceDepot * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTF **ppWDTF);
        
        /* [hidden][helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IDeviceDepot * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IDeviceDepot * This,
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt ITarget **ppTarget);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IDeviceDepot * This,
            /* [retval][out] */ __RPC__out LONG *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Query )( 
            __RPC__in IDeviceDepot * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt ITargets **ppTargets);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_RootDevice )( 
            __RPC__in IDeviceDepot * This,
            /* [retval][out] */ __RPC__deref_out_opt ITarget **pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetMatchEventSource )( 
            __RPC__in IDeviceDepot * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IMatchEventSource **ppMatchEventSource);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *UpdateAndReportMatches )( 
            __RPC__in IDeviceDepot * This);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_QueryRemoveEventEnabled )( 
            __RPC__in IDeviceDepot * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pVal);
        
        /* [helpstring][propput][id] */ HRESULT ( STDMETHODCALLTYPE *put_QueryRemoveEventEnabled )( 
            __RPC__in IDeviceDepot * This,
            /* [in] */ VARIANT_BOOL newVal);
        
        END_INTERFACE
    } IDeviceDepotVtbl;

    interface IDeviceDepot
    {
        CONST_VTBL struct IDeviceDepotVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IDeviceDepot_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IDeviceDepot_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IDeviceDepot_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IDeviceDepot_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IDeviceDepot_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IDeviceDepot_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IDeviceDepot_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IDeviceDepot_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IDeviceDepot_get_WDTF(This,ppWDTF)	\
    ( (This)->lpVtbl -> get_WDTF(This,ppWDTF) ) 

#define IDeviceDepot_get__NewEnum(This,ppNewEnum)	\
    ( (This)->lpVtbl -> get__NewEnum(This,ppNewEnum) ) 

#define IDeviceDepot_get_Item(This,Index,ppTarget)	\
    ( (This)->lpVtbl -> get_Item(This,Index,ppTarget) ) 

#define IDeviceDepot_get_Count(This,pVal)	\
    ( (This)->lpVtbl -> get_Count(This,pVal) ) 

#define IDeviceDepot_Query(This,SDEL,ppTargets)	\
    ( (This)->lpVtbl -> Query(This,SDEL,ppTargets) ) 

#define IDeviceDepot_get_RootDevice(This,pVal)	\
    ( (This)->lpVtbl -> get_RootDevice(This,pVal) ) 

#define IDeviceDepot_GetMatchEventSource(This,SDEL,ppMatchEventSource)	\
    ( (This)->lpVtbl -> GetMatchEventSource(This,SDEL,ppMatchEventSource) ) 

#define IDeviceDepot_UpdateAndReportMatches(This)	\
    ( (This)->lpVtbl -> UpdateAndReportMatches(This) ) 

#define IDeviceDepot_get_QueryRemoveEventEnabled(This,pVal)	\
    ( (This)->lpVtbl -> get_QueryRemoveEventEnabled(This,pVal) ) 

#define IDeviceDepot_put_QueryRemoveEventEnabled(This,newVal)	\
    ( (This)->lpVtbl -> put_QueryRemoveEventEnabled(This,newVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IDeviceDepot_INTERFACE_DEFINED__ */


#ifndef __ISystemDepot_INTERFACE_DEFINED__
#define __ISystemDepot_INTERFACE_DEFINED__

/* interface ISystemDepot */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_ISystemDepot;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("0F4DA66C-DAF7-421F-AE88-736C0701FDD2")
    ISystemDepot : public ITracing
    {
    public:
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_WDTF( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTF **ppWDTF) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_ThisSystem( 
            /* [retval][out] */ __RPC__deref_out_opt ITarget **pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct ISystemDepotVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in ISystemDepot * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in ISystemDepot * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in ISystemDepot * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in ISystemDepot * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in ISystemDepot * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in ISystemDepot * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            ISystemDepot * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in ISystemDepot * This,
            /* [in] */ TTraceLevel Level);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_WDTF )( 
            __RPC__in ISystemDepot * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTF **ppWDTF);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_ThisSystem )( 
            __RPC__in ISystemDepot * This,
            /* [retval][out] */ __RPC__deref_out_opt ITarget **pVal);
        
        END_INTERFACE
    } ISystemDepotVtbl;

    interface ISystemDepot
    {
        CONST_VTBL struct ISystemDepotVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define ISystemDepot_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define ISystemDepot_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define ISystemDepot_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define ISystemDepot_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define ISystemDepot_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define ISystemDepot_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define ISystemDepot_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define ISystemDepot_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define ISystemDepot_get_WDTF(This,ppWDTF)	\
    ( (This)->lpVtbl -> get_WDTF(This,ppWDTF) ) 

#define ISystemDepot_get_ThisSystem(This,pVal)	\
    ( (This)->lpVtbl -> get_ThisSystem(This,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __ISystemDepot_INTERFACE_DEFINED__ */


#ifndef __IWDTF_INTERFACE_DEFINED__
#define __IWDTF_INTERFACE_DEFINED__

/* interface IWDTF */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTF;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("09AFFB31-8C4F-4EBA-B7B2-1887890EA18D")
    IWDTF : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Destroy( void) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_DeviceDepot( 
            /* [retval][out] */ __RPC__deref_out_opt IDeviceDepot **pVal) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_SystemDepot( 
            /* [retval][out] */ __RPC__deref_out_opt ISystemDepot **pVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IWDTFVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTF * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTF * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTF * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTF * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTF * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTF * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTF * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Destroy )( 
            __RPC__in IWDTF * This);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_DeviceDepot )( 
            __RPC__in IWDTF * This,
            /* [retval][out] */ __RPC__deref_out_opt IDeviceDepot **pVal);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_SystemDepot )( 
            __RPC__in IWDTF * This,
            /* [retval][out] */ __RPC__deref_out_opt ISystemDepot **pVal);
        
        END_INTERFACE
    } IWDTFVtbl;

    interface IWDTF
    {
        CONST_VTBL struct IWDTFVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTF_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTF_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTF_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTF_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTF_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTF_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTF_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTF_Destroy(This)	\
    ( (This)->lpVtbl -> Destroy(This) ) 

#define IWDTF_get_DeviceDepot(This,pVal)	\
    ( (This)->lpVtbl -> get_DeviceDepot(This,pVal) ) 

#define IWDTF_get_SystemDepot(This,pVal)	\
    ( (This)->lpVtbl -> get_SystemDepot(This,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTF_INTERFACE_DEFINED__ */


#ifndef ___IDeviceDepotEvents_DISPINTERFACE_DEFINED__
#define ___IDeviceDepotEvents_DISPINTERFACE_DEFINED__

/* dispinterface _IDeviceDepotEvents */
/* [helpstring][uuid] */ 


EXTERN_C const IID DIID__IDeviceDepotEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)

    MIDL_INTERFACE("37795E2D-7459-41D1-8F3A-1D9C6B5038EF")
    _IDeviceDepotEvents : public IDispatch
    {
    };
    
#else 	/* C style interface */

    typedef struct _IDeviceDepotEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in _IDeviceDepotEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in _IDeviceDepotEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in _IDeviceDepotEvents * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in _IDeviceDepotEvents * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in _IDeviceDepotEvents * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in _IDeviceDepotEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            _IDeviceDepotEvents * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } _IDeviceDepotEventsVtbl;

    interface _IDeviceDepotEvents
    {
        CONST_VTBL struct _IDeviceDepotEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define _IDeviceDepotEvents_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define _IDeviceDepotEvents_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define _IDeviceDepotEvents_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define _IDeviceDepotEvents_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define _IDeviceDepotEvents_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define _IDeviceDepotEvents_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define _IDeviceDepotEvents_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */


#endif 	/* ___IDeviceDepotEvents_DISPINTERFACE_DEFINED__ */


#ifndef __IMatchEventSource_INTERFACE_DEFINED__
#define __IMatchEventSource_INTERFACE_DEFINED__

/* interface IMatchEventSource */
/* [object][helpstring][uuid] */ 


EXTERN_C const IID IID_IMatchEventSource;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("E46102AB-83F4-4B1C-B55B-C8D89C26093D")
    IMatchEventSource : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Start( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Destroy( void) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_WDTF( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTF **ppWDTF) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_SDEL( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_Context( 
            /* [retval][out] */ __RPC__out VARIANT *pVal) = 0;
        
        virtual /* [helpstring][propput][id] */ HRESULT STDMETHODCALLTYPE put_Context( 
            /* [in] */ VARIANT newVal) = 0;
        
    };
    
#else 	/* C style interface */

    typedef struct IMatchEventSourceVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IMatchEventSource * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IMatchEventSource * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IMatchEventSource * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IMatchEventSource * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IMatchEventSource * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IMatchEventSource * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IMatchEventSource * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Start )( 
            __RPC__in IMatchEventSource * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Destroy )( 
            __RPC__in IMatchEventSource * This);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_WDTF )( 
            __RPC__in IMatchEventSource * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTF **ppWDTF);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_SDEL )( 
            __RPC__in IMatchEventSource * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Context )( 
            __RPC__in IMatchEventSource * This,
            /* [retval][out] */ __RPC__out VARIANT *pVal);
        
        /* [helpstring][propput][id] */ HRESULT ( STDMETHODCALLTYPE *put_Context )( 
            __RPC__in IMatchEventSource * This,
            /* [in] */ VARIANT newVal);
        
        END_INTERFACE
    } IMatchEventSourceVtbl;

    interface IMatchEventSource
    {
        CONST_VTBL struct IMatchEventSourceVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMatchEventSource_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMatchEventSource_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMatchEventSource_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMatchEventSource_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IMatchEventSource_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IMatchEventSource_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IMatchEventSource_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IMatchEventSource_Start(This)	\
    ( (This)->lpVtbl -> Start(This) ) 

#define IMatchEventSource_Destroy(This)	\
    ( (This)->lpVtbl -> Destroy(This) ) 

#define IMatchEventSource_get_WDTF(This,ppWDTF)	\
    ( (This)->lpVtbl -> get_WDTF(This,ppWDTF) ) 

#define IMatchEventSource_get_SDEL(This,pVal)	\
    ( (This)->lpVtbl -> get_SDEL(This,pVal) ) 

#define IMatchEventSource_get_Context(This,pVal)	\
    ( (This)->lpVtbl -> get_Context(This,pVal) ) 

#define IMatchEventSource_put_Context(This,newVal)	\
    ( (This)->lpVtbl -> put_Context(This,newVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IMatchEventSource_INTERFACE_DEFINED__ */


#ifndef __IMatchEvents_DISPINTERFACE_DEFINED__
#define __IMatchEvents_DISPINTERFACE_DEFINED__

/* dispinterface IMatchEvents */
/* [helpstring][uuid] */ 


EXTERN_C const IID DIID_IMatchEvents;

#if defined(__cplusplus) && !defined(CINTERFACE)

    MIDL_INTERFACE("9E953703-0337-4E6E-A0E2-642A2F44E9E6")
    IMatchEvents : public IDispatch
    {
    };
    
#else 	/* C style interface */

    typedef struct IMatchEventsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IMatchEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            __RPC__deref_out  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IMatchEvents * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IMatchEvents * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IMatchEvents * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IMatchEvents * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IMatchEvents * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IMatchEvents * This,
            /* [in] */ DISPID dispIdMember,
            /* [in] */ REFIID riid,
            /* [in] */ LCID lcid,
            /* [in] */ WORD wFlags,
            /* [out][in] */ DISPPARAMS *pDispParams,
            /* [out] */ VARIANT *pVarResult,
            /* [out] */ EXCEPINFO *pExcepInfo,
            /* [out] */ UINT *puArgErr);
        
        END_INTERFACE
    } IMatchEventsVtbl;

    interface IMatchEvents
    {
        CONST_VTBL struct IMatchEventsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IMatchEvents_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IMatchEvents_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IMatchEvents_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IMatchEvents_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IMatchEvents_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IMatchEvents_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IMatchEvents_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */


#endif 	/* __IMatchEvents_DISPINTERFACE_DEFINED__ */


EXTERN_C const CLSID CLSID_Tracer;

#ifdef __cplusplus

class DECLSPEC_UUID("140F2286-3B39-4DE1-AF94-E083DEEA6BB9")
Tracer;
#endif

EXTERN_C const CLSID CLSID_WDTF;

#ifdef __cplusplus

class DECLSPEC_UUID("28EE5F0B-97D8-4A59-BAC8-A8A80E11F56B")
WDTF;
#endif

EXTERN_C const CLSID CLSID_Targets;

#ifdef __cplusplus

class DECLSPEC_UUID("485785D3-8820-4C3D-A532-4C0F66392A30")
Targets;
#endif

EXTERN_C const CLSID CLSID_MatchEventSource;

#ifdef __cplusplus

class DECLSPEC_UUID("2C9AF7D6-2589-4413-A2BA-9926EBCFD67C")
MatchEventSource;
#endif
#endif /* __WDTFLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


