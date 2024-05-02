

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


#ifndef __IWDTFTarget2_FWD_DEFINED__
#define __IWDTFTarget2_FWD_DEFINED__
typedef interface IWDTFTarget2 IWDTFTarget2;

#endif 	/* __IWDTFTarget2_FWD_DEFINED__ */


#ifndef __IWDTFTargets2_FWD_DEFINED__
#define __IWDTFTargets2_FWD_DEFINED__
typedef interface IWDTFTargets2 IWDTFTargets2;

#endif 	/* __IWDTFTargets2_FWD_DEFINED__ */


#ifndef __IWDTF2_FWD_DEFINED__
#define __IWDTF2_FWD_DEFINED__
typedef interface IWDTF2 IWDTF2;

#endif 	/* __IWDTF2_FWD_DEFINED__ */


#ifndef __IWDTFAction2_FWD_DEFINED__
#define __IWDTFAction2_FWD_DEFINED__
typedef interface IWDTFAction2 IWDTFAction2;

#endif 	/* __IWDTFAction2_FWD_DEFINED__ */


#ifndef __IWDTFActions2_FWD_DEFINED__
#define __IWDTFActions2_FWD_DEFINED__
typedef interface IWDTFActions2 IWDTFActions2;

#endif 	/* __IWDTFActions2_FWD_DEFINED__ */


#ifndef __IWDTFActionsCustom2_FWD_DEFINED__
#define __IWDTFActionsCustom2_FWD_DEFINED__
typedef interface IWDTFActionsCustom2 IWDTFActionsCustom2;

#endif 	/* __IWDTFActionsCustom2_FWD_DEFINED__ */


#ifndef __IWDTFStrings2_FWD_DEFINED__
#define __IWDTFStrings2_FWD_DEFINED__
typedef interface IWDTFStrings2 IWDTFStrings2;

#endif 	/* __IWDTFStrings2_FWD_DEFINED__ */


#ifndef __IWDTFNumbers2_FWD_DEFINED__
#define __IWDTFNumbers2_FWD_DEFINED__
typedef interface IWDTFNumbers2 IWDTFNumbers2;

#endif 	/* __IWDTFNumbers2_FWD_DEFINED__ */


#ifndef __IWDTFLongNumbers2_FWD_DEFINED__
#define __IWDTFLongNumbers2_FWD_DEFINED__
typedef interface IWDTFLongNumbers2 IWDTFLongNumbers2;

#endif 	/* __IWDTFLongNumbers2_FWD_DEFINED__ */


#ifndef __IWDTFInternalTarget2_FWD_DEFINED__
#define __IWDTFInternalTarget2_FWD_DEFINED__
typedef interface IWDTFInternalTarget2 IWDTFInternalTarget2;

#endif 	/* __IWDTFInternalTarget2_FWD_DEFINED__ */


#ifndef __IWDTFSystemDepot2_FWD_DEFINED__
#define __IWDTFSystemDepot2_FWD_DEFINED__
typedef interface IWDTFSystemDepot2 IWDTFSystemDepot2;

#endif 	/* __IWDTFSystemDepot2_FWD_DEFINED__ */


#ifndef __IWDTFDeviceDepot2_FWD_DEFINED__
#define __IWDTFDeviceDepot2_FWD_DEFINED__
typedef interface IWDTFDeviceDepot2 IWDTFDeviceDepot2;

#endif 	/* __IWDTFDeviceDepot2_FWD_DEFINED__ */


#ifndef __IWDTFLOG2_FWD_DEFINED__
#define __IWDTFLOG2_FWD_DEFINED__
typedef interface IWDTFLOG2 IWDTFLOG2;

#endif 	/* __IWDTFLOG2_FWD_DEFINED__ */


#ifndef __IWDTFCONFIG2_FWD_DEFINED__
#define __IWDTFCONFIG2_FWD_DEFINED__
typedef interface IWDTFCONFIG2 IWDTFCONFIG2;

#endif 	/* __IWDTFCONFIG2_FWD_DEFINED__ */


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


#ifndef __WDTFActions2_FWD_DEFINED__
#define __WDTFActions2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFActions2 WDTFActions2;
#else
typedef struct WDTFActions2 WDTFActions2;
#endif /* __cplusplus */

#endif 	/* __WDTFActions2_FWD_DEFINED__ */


#ifndef __MatchEventSource_FWD_DEFINED__
#define __MatchEventSource_FWD_DEFINED__

#ifdef __cplusplus
typedef class MatchEventSource MatchEventSource;
#else
typedef struct MatchEventSource MatchEventSource;
#endif /* __cplusplus */

#endif 	/* __MatchEventSource_FWD_DEFINED__ */


#ifndef __WDTFStrings2_FWD_DEFINED__
#define __WDTFStrings2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFStrings2 WDTFStrings2;
#else
typedef struct WDTFStrings2 WDTFStrings2;
#endif /* __cplusplus */

#endif 	/* __WDTFStrings2_FWD_DEFINED__ */


#ifndef __WDTFNumbers2_FWD_DEFINED__
#define __WDTFNumbers2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFNumbers2 WDTFNumbers2;
#else
typedef struct WDTFNumbers2 WDTFNumbers2;
#endif /* __cplusplus */

#endif 	/* __WDTFNumbers2_FWD_DEFINED__ */


#ifndef __WDTFLongNumbers2_FWD_DEFINED__
#define __WDTFLongNumbers2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFLongNumbers2 WDTFLongNumbers2;
#else
typedef struct WDTFLongNumbers2 WDTFLongNumbers2;
#endif /* __cplusplus */

#endif 	/* __WDTFLongNumbers2_FWD_DEFINED__ */


#ifndef __WDTF2_FWD_DEFINED__
#define __WDTF2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTF2 WDTF2;
#else
typedef struct WDTF2 WDTF2;
#endif /* __cplusplus */

#endif 	/* __WDTF2_FWD_DEFINED__ */


#ifndef __WDTFLOG2_FWD_DEFINED__
#define __WDTFLOG2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFLOG2 WDTFLOG2;
#else
typedef struct WDTFLOG2 WDTFLOG2;
#endif /* __cplusplus */

#endif 	/* __WDTFLOG2_FWD_DEFINED__ */


#ifndef __WDTFCONFIG2_FWD_DEFINED__
#define __WDTFCONFIG2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFCONFIG2 WDTFCONFIG2;
#else
typedef struct WDTFCONFIG2 WDTFCONFIG2;
#endif /* __cplusplus */

#endif 	/* __WDTFCONFIG2_FWD_DEFINED__ */


#ifndef __WDTFTargets2_FWD_DEFINED__
#define __WDTFTargets2_FWD_DEFINED__

#ifdef __cplusplus
typedef class WDTFTargets2 WDTFTargets2;
#else
typedef struct WDTFTargets2 WDTFTargets2;
#endif /* __cplusplus */

#endif 	/* __WDTFTargets2_FWD_DEFINED__ */


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
            _COM_Outptr_  void **ppvObject);
        
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
    {
        Trace0_Off	= 0,
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
            _COM_Outptr_  void **ppvObject);
        
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
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
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
            _COM_Outptr_  void **ppvObject);
        
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
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
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
            _COM_Outptr_  void **ppvObject);
        
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
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
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
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
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
            _COM_Outptr_  void **ppvObject);
        
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
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
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
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
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

#define ITarget_GetInterface(This,WDTFInterfaceName,Args,MonikerSuffix,ppInterface)	\
    ( (This)->lpVtbl -> GetInterface(This,WDTFInterfaceName,Args,MonikerSuffix,ppInterface) ) 

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
            _COM_Outptr_  void **ppvObject);
        
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
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
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
            _COM_Outptr_  void **ppvObject);
        
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
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
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
            _COM_Outptr_  void **ppvObject);
        
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
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
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
            _COM_Outptr_  void **ppvObject);
        
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
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
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
            _COM_Outptr_  void **ppvObject);
        
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
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
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
            _COM_Outptr_  void **ppvObject);
        
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
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
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
            _COM_Outptr_  void **ppvObject);
        
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
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
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


#ifndef __IWDTFTarget2_INTERFACE_DEFINED__
#define __IWDTFTarget2_INTERFACE_DEFINED__

/* interface IWDTFTarget2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFTarget2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("90882A46-106B-4BA9-BB22-C4C416663F24")
    IWDTFTarget2 : public ITracing
    {
    public:
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_WDTF( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTF2 **ppWDTF) = 0;
        
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
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFAction2 **ppInterface) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetRelations( 
            /* [in] */ __RPC__in BSTR RelationSDEL,
            /* [in] */ __RPC__in BSTR MatchSDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTargets2 **ppRelations) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE HasContext( 
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE HasInterface( 
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetValueString( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetValueStrings( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFStrings2 **ppValues) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetValueNumber( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out LONG *pValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetValueNumbers( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFNumbers2 **ppValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetValueLongNumber( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out LONGLONG *pValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetValueLongNumbers( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFLongNumbers2 **ppValue) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetValueBool( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pValue) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFTarget2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFTarget2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFTarget2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFTarget2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFTarget2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ TTraceLevel Level);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_WDTF )( 
            __RPC__in IWDTFTarget2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTF2 **ppWDTF);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Type )( 
            __RPC__in IWDTFTarget2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Context )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__out VARIANT *pVal);
        
        /* [helpstring][propput][id] */ HRESULT ( STDMETHODCALLTYPE *put_Context )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [in] */ VARIANT newVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Eval )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValue )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT *pValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetInterface )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFAction2 **ppInterface);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetRelations )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR RelationSDEL,
            /* [in] */ __RPC__in BSTR MatchSDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTargets2 **ppRelations);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *HasContext )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *HasInterface )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueString )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueStrings )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFStrings2 **ppValues);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueNumber )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out LONG *pValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueNumbers )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFNumbers2 **ppValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueLongNumber )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out LONGLONG *pValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueLongNumbers )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFLongNumbers2 **ppValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueBool )( 
            __RPC__in IWDTFTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pValue);
        
        END_INTERFACE
    } IWDTFTarget2Vtbl;

    interface IWDTFTarget2
    {
        CONST_VTBL struct IWDTFTarget2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFTarget2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFTarget2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFTarget2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFTarget2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFTarget2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFTarget2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFTarget2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFTarget2_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IWDTFTarget2_get_WDTF(This,ppWDTF)	\
    ( (This)->lpVtbl -> get_WDTF(This,ppWDTF) ) 

#define IWDTFTarget2_get_Type(This,pVal)	\
    ( (This)->lpVtbl -> get_Type(This,pVal) ) 

#define IWDTFTarget2_get_Context(This,Tag,pVal)	\
    ( (This)->lpVtbl -> get_Context(This,Tag,pVal) ) 

#define IWDTFTarget2_put_Context(This,Tag,newVal)	\
    ( (This)->lpVtbl -> put_Context(This,Tag,newVal) ) 

#define IWDTFTarget2_Eval(This,SDEL,pResult)	\
    ( (This)->lpVtbl -> Eval(This,SDEL,pResult) ) 

#define IWDTFTarget2_GetValue(This,SDEL,pValue)	\
    ( (This)->lpVtbl -> GetValue(This,SDEL,pValue) ) 

#define IWDTFTarget2_GetInterface(This,WDTFInterfaceName,Args,MonikerSuffix,ppInterface)	\
    ( (This)->lpVtbl -> GetInterface(This,WDTFInterfaceName,Args,MonikerSuffix,ppInterface) ) 

#define IWDTFTarget2_GetRelations(This,RelationSDEL,MatchSDEL,ppRelations)	\
    ( (This)->lpVtbl -> GetRelations(This,RelationSDEL,MatchSDEL,ppRelations) ) 

#define IWDTFTarget2_HasContext(This,Tag,pResult)	\
    ( (This)->lpVtbl -> HasContext(This,Tag,pResult) ) 

#define IWDTFTarget2_HasInterface(This,WDTFInterfaceName,Args,MonikerSuffix,pResult)	\
    ( (This)->lpVtbl -> HasInterface(This,WDTFInterfaceName,Args,MonikerSuffix,pResult) ) 

#define IWDTFTarget2_GetValueString(This,SDEL,pValue)	\
    ( (This)->lpVtbl -> GetValueString(This,SDEL,pValue) ) 

#define IWDTFTarget2_GetValueStrings(This,SDEL,ppValues)	\
    ( (This)->lpVtbl -> GetValueStrings(This,SDEL,ppValues) ) 

#define IWDTFTarget2_GetValueNumber(This,SDEL,pValue)	\
    ( (This)->lpVtbl -> GetValueNumber(This,SDEL,pValue) ) 

#define IWDTFTarget2_GetValueNumbers(This,SDEL,ppValue)	\
    ( (This)->lpVtbl -> GetValueNumbers(This,SDEL,ppValue) ) 

#define IWDTFTarget2_GetValueLongNumber(This,SDEL,pValue)	\
    ( (This)->lpVtbl -> GetValueLongNumber(This,SDEL,pValue) ) 

#define IWDTFTarget2_GetValueLongNumbers(This,SDEL,ppValue)	\
    ( (This)->lpVtbl -> GetValueLongNumbers(This,SDEL,ppValue) ) 

#define IWDTFTarget2_GetValueBool(This,SDEL,pValue)	\
    ( (This)->lpVtbl -> GetValueBool(This,SDEL,pValue) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFTarget2_INTERFACE_DEFINED__ */


#ifndef __IWDTFTargets2_INTERFACE_DEFINED__
#define __IWDTFTargets2_INTERFACE_DEFINED__

/* interface IWDTFTargets2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFTargets2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("AB89B3CC-ECEC-44CC-939F-BA5309FAAF66")
    IWDTFTargets2 : public ITracing
    {
    public:
        virtual /* [hidden][helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **ppTarget) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out LONG *pVal) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_WDTF( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTF2 **ppWDTF) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Add( 
            /* [in] */ __RPC__in_opt IWDTFTarget2 *pTarget) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Remove( 
            /* [in] */ __RPC__in_opt IWDTFTarget2 *pTarget) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Eval( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Query( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTargets2 **ppTargets) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QuerySingle( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **ppTarget) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetInterfacesIfExist( 
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT MoreTargets,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFActions2 **ppInterface) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetInterfaces( 
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT MoreTargets,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFActions2 **ppInterface) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE GetRelations( 
            /* [in] */ __RPC__in BSTR RelationSDEL,
            /* [in] */ __RPC__in BSTR MatchSDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTargets2 **ppRelations) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFTargets2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFTargets2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFTargets2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFTargets2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFTargets2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ TTraceLevel Level);
        
        /* [hidden][helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IWDTFTargets2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **ppTarget);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IWDTFTargets2 * This,
            /* [retval][out] */ __RPC__out LONG *pVal);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_WDTF )( 
            __RPC__in IWDTFTargets2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTF2 **ppWDTF);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Add )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ __RPC__in_opt IWDTFTarget2 *pTarget);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Remove )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ __RPC__in_opt IWDTFTarget2 *pTarget);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            __RPC__in IWDTFTargets2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Eval )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Query )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTargets2 **ppTargets);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *QuerySingle )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **ppTarget);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetInterfacesIfExist )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT MoreTargets,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFActions2 **ppInterface);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetInterfaces )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT MoreTargets,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFActions2 **ppInterface);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetRelations )( 
            __RPC__in IWDTFTargets2 * This,
            /* [in] */ __RPC__in BSTR RelationSDEL,
            /* [in] */ __RPC__in BSTR MatchSDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTargets2 **ppRelations);
        
        END_INTERFACE
    } IWDTFTargets2Vtbl;

    interface IWDTFTargets2
    {
        CONST_VTBL struct IWDTFTargets2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFTargets2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFTargets2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFTargets2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFTargets2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFTargets2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFTargets2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFTargets2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFTargets2_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IWDTFTargets2_get__NewEnum(This,ppNewEnum)	\
    ( (This)->lpVtbl -> get__NewEnum(This,ppNewEnum) ) 

#define IWDTFTargets2_get_Item(This,Index,ppTarget)	\
    ( (This)->lpVtbl -> get_Item(This,Index,ppTarget) ) 

#define IWDTFTargets2_get_Count(This,pVal)	\
    ( (This)->lpVtbl -> get_Count(This,pVal) ) 

#define IWDTFTargets2_get_WDTF(This,ppWDTF)	\
    ( (This)->lpVtbl -> get_WDTF(This,ppWDTF) ) 

#define IWDTFTargets2_Add(This,pTarget)	\
    ( (This)->lpVtbl -> Add(This,pTarget) ) 

#define IWDTFTargets2_Remove(This,pTarget)	\
    ( (This)->lpVtbl -> Remove(This,pTarget) ) 

#define IWDTFTargets2_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IWDTFTargets2_Eval(This,SDEL,pResult)	\
    ( (This)->lpVtbl -> Eval(This,SDEL,pResult) ) 

#define IWDTFTargets2_Query(This,SDEL,ppTargets)	\
    ( (This)->lpVtbl -> Query(This,SDEL,ppTargets) ) 

#define IWDTFTargets2_QuerySingle(This,SDEL,ppTarget)	\
    ( (This)->lpVtbl -> QuerySingle(This,SDEL,ppTarget) ) 

#define IWDTFTargets2_GetInterfacesIfExist(This,WDTFInterfaceName,MoreTargets,MonikerSuffix,ppInterface)	\
    ( (This)->lpVtbl -> GetInterfacesIfExist(This,WDTFInterfaceName,MoreTargets,MonikerSuffix,ppInterface) ) 

#define IWDTFTargets2_GetInterfaces(This,WDTFInterfaceName,MoreTargets,MonikerSuffix,ppInterface)	\
    ( (This)->lpVtbl -> GetInterfaces(This,WDTFInterfaceName,MoreTargets,MonikerSuffix,ppInterface) ) 

#define IWDTFTargets2_GetRelations(This,RelationSDEL,MatchSDEL,ppRelations)	\
    ( (This)->lpVtbl -> GetRelations(This,RelationSDEL,MatchSDEL,ppRelations) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFTargets2_INTERFACE_DEFINED__ */


#ifndef __IWDTF2_INTERFACE_DEFINED__
#define __IWDTF2_INTERFACE_DEFINED__

/* interface IWDTF2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTF2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("27E87F97-5523-4C23-AE15-E082A3CB4BCE")
    IWDTF2 : public IDispatch
    {
    public:
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_DeviceDepot( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTFDeviceDepot2 **pVal) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_SystemDepot( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTFSystemDepot2 **pVal) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_Log( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTFLOG2 **ppLog) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_Config( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTFCONFIG2 **ppConfig) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTF2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTF2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTF2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTF2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTF2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTF2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTF2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTF2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_DeviceDepot )( 
            __RPC__in IWDTF2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFDeviceDepot2 **pVal);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_SystemDepot )( 
            __RPC__in IWDTF2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFSystemDepot2 **pVal);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Log )( 
            __RPC__in IWDTF2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFLOG2 **ppLog);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Config )( 
            __RPC__in IWDTF2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFCONFIG2 **ppConfig);
        
        END_INTERFACE
    } IWDTF2Vtbl;

    interface IWDTF2
    {
        CONST_VTBL struct IWDTF2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTF2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTF2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTF2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTF2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTF2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTF2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTF2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTF2_get_DeviceDepot(This,pVal)	\
    ( (This)->lpVtbl -> get_DeviceDepot(This,pVal) ) 

#define IWDTF2_get_SystemDepot(This,pVal)	\
    ( (This)->lpVtbl -> get_SystemDepot(This,pVal) ) 

#define IWDTF2_get_Log(This,ppLog)	\
    ( (This)->lpVtbl -> get_Log(This,ppLog) ) 

#define IWDTF2_get_Config(This,ppConfig)	\
    ( (This)->lpVtbl -> get_Config(This,ppConfig) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTF2_INTERFACE_DEFINED__ */


#ifndef __IWDTFAction2_INTERFACE_DEFINED__
#define __IWDTFAction2_INTERFACE_DEFINED__

/* interface IWDTFAction2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFAction2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("1ABC1EB4-4ADD-4A19-9E13-236FE42768FB")
    IWDTFAction2 : public IAction
    {
    public:
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_Target( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **ppTarget) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EnableObjectErrorLogging( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE DisableObjectErrorLogging( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE EnableObjectLogging( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE DisableObjectLogging( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE IsStatusSuccess( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetStatus( 
            /* [retval][out] */ __RPC__out HRESULT *pResult) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetStatusString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pResult) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFAction2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFAction2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFAction2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFAction2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFAction2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFAction2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFAction2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFAction2 * This,
            /* [in] */ TTraceLevel Level);
        
        HRESULT ( STDMETHODCALLTYPE *SetTarget )( 
            __RPC__in IWDTFAction2 * This,
            /* [in] */ __RPC__in_opt ITarget *pMainTarget,
            /* [optional][in] */ VARIANT MoreTargets);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Target )( 
            __RPC__in IWDTFAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **ppTarget);
        
        HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFAction2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFAction2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFAction2 * This,
            /* [retval][out] */ __RPC__out HRESULT *pResult);
        
        HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFAction2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pResult);
        
        END_INTERFACE
    } IWDTFAction2Vtbl;

    interface IWDTFAction2
    {
        CONST_VTBL struct IWDTFAction2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFAction2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFAction2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFAction2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFAction2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFAction2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFAction2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFAction2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFAction2_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IWDTFAction2_SetTarget(This,pMainTarget,MoreTargets)	\
    ( (This)->lpVtbl -> SetTarget(This,pMainTarget,MoreTargets) ) 


#define IWDTFAction2_get_Target(This,ppTarget)	\
    ( (This)->lpVtbl -> get_Target(This,ppTarget) ) 

#define IWDTFAction2_EnableObjectErrorLogging(This)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This) ) 

#define IWDTFAction2_DisableObjectErrorLogging(This)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This) ) 

#define IWDTFAction2_EnableObjectLogging(This)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This) ) 

#define IWDTFAction2_DisableObjectLogging(This)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This) ) 

#define IWDTFAction2_IsStatusSuccess(This,pResult)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,pResult) ) 

#define IWDTFAction2_GetStatus(This,pResult)	\
    ( (This)->lpVtbl -> GetStatus(This,pResult) ) 

#define IWDTFAction2_GetStatusString(This,pResult)	\
    ( (This)->lpVtbl -> GetStatusString(This,pResult) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFAction2_INTERFACE_DEFINED__ */


#ifndef __IWDTFActions2_INTERFACE_DEFINED__
#define __IWDTFActions2_INTERFACE_DEFINED__

/* interface IWDTFActions2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFActions2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("F5F76D45-79F4-426B-B112-5316C80C9B93")
    IWDTFActions2 : public ITracing
    {
    public:
        virtual /* [hidden][helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFAction2 **ppAction) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out LONG *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Add( 
            /* [in] */ __RPC__in_opt IWDTFAction2 *pAction) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Remove( 
            /* [in] */ __RPC__in_opt IWDTFAction2 *pAction) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Clear( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnableObjectErrorLogging( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DisableObjectErrorLogging( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnableObjectLogging( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DisableObjectLogging( void) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFActions2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFActions2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFActions2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFActions2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFActions2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFActions2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFActions2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFActions2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFActions2 * This,
            /* [in] */ TTraceLevel Level);
        
        /* [hidden][helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IWDTFActions2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IWDTFActions2 * This,
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFAction2 **ppAction);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IWDTFActions2 * This,
            /* [retval][out] */ __RPC__out LONG *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Add )( 
            __RPC__in IWDTFActions2 * This,
            /* [in] */ __RPC__in_opt IWDTFAction2 *pAction);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Remove )( 
            __RPC__in IWDTFActions2 * This,
            /* [in] */ __RPC__in_opt IWDTFAction2 *pAction);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            __RPC__in IWDTFActions2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFActions2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFActions2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFActions2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFActions2 * This);
        
        END_INTERFACE
    } IWDTFActions2Vtbl;

    interface IWDTFActions2
    {
        CONST_VTBL struct IWDTFActions2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFActions2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFActions2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFActions2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFActions2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFActions2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFActions2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFActions2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFActions2_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IWDTFActions2_get__NewEnum(This,ppNewEnum)	\
    ( (This)->lpVtbl -> get__NewEnum(This,ppNewEnum) ) 

#define IWDTFActions2_get_Item(This,Index,ppAction)	\
    ( (This)->lpVtbl -> get_Item(This,Index,ppAction) ) 

#define IWDTFActions2_get_Count(This,pVal)	\
    ( (This)->lpVtbl -> get_Count(This,pVal) ) 

#define IWDTFActions2_Add(This,pAction)	\
    ( (This)->lpVtbl -> Add(This,pAction) ) 

#define IWDTFActions2_Remove(This,pAction)	\
    ( (This)->lpVtbl -> Remove(This,pAction) ) 

#define IWDTFActions2_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IWDTFActions2_EnableObjectErrorLogging(This)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This) ) 

#define IWDTFActions2_DisableObjectErrorLogging(This)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This) ) 

#define IWDTFActions2_EnableObjectLogging(This)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This) ) 

#define IWDTFActions2_DisableObjectLogging(This)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFActions2_INTERFACE_DEFINED__ */


#ifndef __IWDTFActionsCustom2_INTERFACE_DEFINED__
#define __IWDTFActionsCustom2_INTERFACE_DEFINED__

/* interface IWDTFActionsCustom2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFActionsCustom2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("5435AEF8-E855-4C9C-AB35-7722C4EBD26D")
    IWDTFActionsCustom2 : public IWDTFActions2
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE IsStatusSuccess( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetStatus( 
            /* [retval][out] */ __RPC__out HRESULT *pResult) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetStatusString( 
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pResult) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFActionsCustom2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFActionsCustom2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFActionsCustom2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFActionsCustom2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [in] */ TTraceLevel Level);
        
        /* [hidden][helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFAction2 **ppAction);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [retval][out] */ __RPC__out LONG *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Add )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [in] */ __RPC__in_opt IWDTFAction2 *pAction);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Remove )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [in] */ __RPC__in_opt IWDTFAction2 *pAction);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Clear )( 
            __RPC__in IWDTFActionsCustom2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFActionsCustom2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFActionsCustom2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFActionsCustom2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFActionsCustom2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *IsStatusSuccess )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        HRESULT ( STDMETHODCALLTYPE *GetStatus )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [retval][out] */ __RPC__out HRESULT *pResult);
        
        HRESULT ( STDMETHODCALLTYPE *GetStatusString )( 
            __RPC__in IWDTFActionsCustom2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pResult);
        
        END_INTERFACE
    } IWDTFActionsCustom2Vtbl;

    interface IWDTFActionsCustom2
    {
        CONST_VTBL struct IWDTFActionsCustom2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFActionsCustom2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFActionsCustom2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFActionsCustom2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFActionsCustom2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFActionsCustom2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFActionsCustom2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFActionsCustom2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFActionsCustom2_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IWDTFActionsCustom2_get__NewEnum(This,ppNewEnum)	\
    ( (This)->lpVtbl -> get__NewEnum(This,ppNewEnum) ) 

#define IWDTFActionsCustom2_get_Item(This,Index,ppAction)	\
    ( (This)->lpVtbl -> get_Item(This,Index,ppAction) ) 

#define IWDTFActionsCustom2_get_Count(This,pVal)	\
    ( (This)->lpVtbl -> get_Count(This,pVal) ) 

#define IWDTFActionsCustom2_Add(This,pAction)	\
    ( (This)->lpVtbl -> Add(This,pAction) ) 

#define IWDTFActionsCustom2_Remove(This,pAction)	\
    ( (This)->lpVtbl -> Remove(This,pAction) ) 

#define IWDTFActionsCustom2_Clear(This)	\
    ( (This)->lpVtbl -> Clear(This) ) 

#define IWDTFActionsCustom2_EnableObjectErrorLogging(This)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This) ) 

#define IWDTFActionsCustom2_DisableObjectErrorLogging(This)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This) ) 

#define IWDTFActionsCustom2_EnableObjectLogging(This)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This) ) 

#define IWDTFActionsCustom2_DisableObjectLogging(This)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This) ) 


#define IWDTFActionsCustom2_IsStatusSuccess(This,pResult)	\
    ( (This)->lpVtbl -> IsStatusSuccess(This,pResult) ) 

#define IWDTFActionsCustom2_GetStatus(This,pResult)	\
    ( (This)->lpVtbl -> GetStatus(This,pResult) ) 

#define IWDTFActionsCustom2_GetStatusString(This,pResult)	\
    ( (This)->lpVtbl -> GetStatusString(This,pResult) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFActionsCustom2_INTERFACE_DEFINED__ */


#ifndef __IWDTFStrings2_INTERFACE_DEFINED__
#define __IWDTFStrings2_INTERFACE_DEFINED__

/* interface IWDTFStrings2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFStrings2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("C7DF0A7B-AC75-4F0A-9CF6-F0A5E054B2DC")
    IWDTFStrings2 : public ITracing
    {
    public:
        virtual /* [hidden][helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pString) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out LONG *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Add( 
            /* [in] */ __RPC__in BSTR pString) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Remove( 
            /* [in] */ LONG Index) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFStrings2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFStrings2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFStrings2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFStrings2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFStrings2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFStrings2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFStrings2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFStrings2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFStrings2 * This,
            /* [in] */ TTraceLevel Level);
        
        /* [hidden][helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IWDTFStrings2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IWDTFStrings2 * This,
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pString);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IWDTFStrings2 * This,
            /* [retval][out] */ __RPC__out LONG *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Add )( 
            __RPC__in IWDTFStrings2 * This,
            /* [in] */ __RPC__in BSTR pString);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Remove )( 
            __RPC__in IWDTFStrings2 * This,
            /* [in] */ LONG Index);
        
        END_INTERFACE
    } IWDTFStrings2Vtbl;

    interface IWDTFStrings2
    {
        CONST_VTBL struct IWDTFStrings2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFStrings2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFStrings2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFStrings2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFStrings2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFStrings2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFStrings2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFStrings2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFStrings2_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IWDTFStrings2_get__NewEnum(This,ppNewEnum)	\
    ( (This)->lpVtbl -> get__NewEnum(This,ppNewEnum) ) 

#define IWDTFStrings2_get_Item(This,Index,pString)	\
    ( (This)->lpVtbl -> get_Item(This,Index,pString) ) 

#define IWDTFStrings2_get_Count(This,pVal)	\
    ( (This)->lpVtbl -> get_Count(This,pVal) ) 

#define IWDTFStrings2_Add(This,pString)	\
    ( (This)->lpVtbl -> Add(This,pString) ) 

#define IWDTFStrings2_Remove(This,Index)	\
    ( (This)->lpVtbl -> Remove(This,Index) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFStrings2_INTERFACE_DEFINED__ */


#ifndef __IWDTFNumbers2_INTERFACE_DEFINED__
#define __IWDTFNumbers2_INTERFACE_DEFINED__

/* interface IWDTFNumbers2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFNumbers2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("7BC4F2C6-B126-4348-9CED-E0EA79564DA4")
    IWDTFNumbers2 : public ITracing
    {
    public:
        virtual /* [hidden][helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__out LONG *pNumber) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out LONG *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Add( 
            /* [in] */ LONG Number) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Remove( 
            /* [in] */ LONG Index) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFNumbers2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFNumbers2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFNumbers2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFNumbers2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFNumbers2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFNumbers2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFNumbers2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFNumbers2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFNumbers2 * This,
            /* [in] */ TTraceLevel Level);
        
        /* [hidden][helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IWDTFNumbers2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IWDTFNumbers2 * This,
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__out LONG *pNumber);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IWDTFNumbers2 * This,
            /* [retval][out] */ __RPC__out LONG *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Add )( 
            __RPC__in IWDTFNumbers2 * This,
            /* [in] */ LONG Number);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Remove )( 
            __RPC__in IWDTFNumbers2 * This,
            /* [in] */ LONG Index);
        
        END_INTERFACE
    } IWDTFNumbers2Vtbl;

    interface IWDTFNumbers2
    {
        CONST_VTBL struct IWDTFNumbers2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFNumbers2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFNumbers2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFNumbers2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFNumbers2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFNumbers2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFNumbers2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFNumbers2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFNumbers2_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IWDTFNumbers2_get__NewEnum(This,ppNewEnum)	\
    ( (This)->lpVtbl -> get__NewEnum(This,ppNewEnum) ) 

#define IWDTFNumbers2_get_Item(This,Index,pNumber)	\
    ( (This)->lpVtbl -> get_Item(This,Index,pNumber) ) 

#define IWDTFNumbers2_get_Count(This,pVal)	\
    ( (This)->lpVtbl -> get_Count(This,pVal) ) 

#define IWDTFNumbers2_Add(This,Number)	\
    ( (This)->lpVtbl -> Add(This,Number) ) 

#define IWDTFNumbers2_Remove(This,Index)	\
    ( (This)->lpVtbl -> Remove(This,Index) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFNumbers2_INTERFACE_DEFINED__ */


#ifndef __IWDTFLongNumbers2_INTERFACE_DEFINED__
#define __IWDTFLongNumbers2_INTERFACE_DEFINED__

/* interface IWDTFLongNumbers2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFLongNumbers2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("9167FC3A-CDD5-46D2-AC03-F370A3072321")
    IWDTFLongNumbers2 : public ITracing
    {
    public:
        virtual /* [hidden][helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__out LONGLONG *pNumber) = 0;
        
        virtual /* [helpstring][propget] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out LONG *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Add( 
            /* [in] */ LONGLONG Number) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Remove( 
            /* [in] */ LONG Index) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFLongNumbers2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFLongNumbers2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFLongNumbers2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFLongNumbers2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFLongNumbers2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFLongNumbers2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFLongNumbers2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFLongNumbers2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFLongNumbers2 * This,
            /* [in] */ TTraceLevel Level);
        
        /* [hidden][helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IWDTFLongNumbers2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IWDTFLongNumbers2 * This,
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__out LONGLONG *pNumber);
        
        /* [helpstring][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IWDTFLongNumbers2 * This,
            /* [retval][out] */ __RPC__out LONG *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Add )( 
            __RPC__in IWDTFLongNumbers2 * This,
            /* [in] */ LONGLONG Number);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Remove )( 
            __RPC__in IWDTFLongNumbers2 * This,
            /* [in] */ LONG Index);
        
        END_INTERFACE
    } IWDTFLongNumbers2Vtbl;

    interface IWDTFLongNumbers2
    {
        CONST_VTBL struct IWDTFLongNumbers2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFLongNumbers2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFLongNumbers2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFLongNumbers2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFLongNumbers2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFLongNumbers2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFLongNumbers2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFLongNumbers2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFLongNumbers2_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IWDTFLongNumbers2_get__NewEnum(This,ppNewEnum)	\
    ( (This)->lpVtbl -> get__NewEnum(This,ppNewEnum) ) 

#define IWDTFLongNumbers2_get_Item(This,Index,pNumber)	\
    ( (This)->lpVtbl -> get_Item(This,Index,pNumber) ) 

#define IWDTFLongNumbers2_get_Count(This,pVal)	\
    ( (This)->lpVtbl -> get_Count(This,pVal) ) 

#define IWDTFLongNumbers2_Add(This,Number)	\
    ( (This)->lpVtbl -> Add(This,Number) ) 

#define IWDTFLongNumbers2_Remove(This,Index)	\
    ( (This)->lpVtbl -> Remove(This,Index) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFLongNumbers2_INTERFACE_DEFINED__ */


#ifndef __IWDTFInternalTarget2_INTERFACE_DEFINED__
#define __IWDTFInternalTarget2_INTERFACE_DEFINED__

/* interface IWDTFInternalTarget2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFInternalTarget2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("83FF9C30-6DDC-43B0-AA67-4529AC386C10")
    IWDTFInternalTarget2 : public IWDTFTarget2
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE InternalGetInterfaceVer1( 
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IAction **ppInterface) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE InternalGetInterfaceVer2( 
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFAction2 **ppInterface) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE InternalGetRelations( 
            /* [in] */ __RPC__in BSTR RelationSDEL,
            /* [in] */ __RPC__in BSTR MatchSDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTargets2 **ppRelations) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFInternalTarget2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFInternalTarget2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFInternalTarget2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFInternalTarget2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ TTraceLevel Level);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_WDTF )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTF2 **ppWDTF);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Type )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pVal);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Context )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__out VARIANT *pVal);
        
        /* [helpstring][propput][id] */ HRESULT ( STDMETHODCALLTYPE *put_Context )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [in] */ VARIANT newVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Eval )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValue )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT *pValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetInterface )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFAction2 **ppInterface);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetRelations )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR RelationSDEL,
            /* [in] */ __RPC__in BSTR MatchSDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTargets2 **ppRelations);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *HasContext )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR Tag,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *HasInterface )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pResult);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueString )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt BSTR *pValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueStrings )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFStrings2 **ppValues);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueNumber )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out LONG *pValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueNumbers )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFNumbers2 **ppValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueLongNumber )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out LONGLONG *pValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueLongNumbers )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFLongNumbers2 **ppValue);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *GetValueBool )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pValue);
        
        HRESULT ( STDMETHODCALLTYPE *InternalGetInterfaceVer1 )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IAction **ppInterface);
        
        HRESULT ( STDMETHODCALLTYPE *InternalGetInterfaceVer2 )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR WDTFInterfaceName,
            /* [optional][in] */ VARIANT Args,
            /* [optional][in] */ VARIANT MonikerSuffix,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFAction2 **ppInterface);
        
        HRESULT ( STDMETHODCALLTYPE *InternalGetRelations )( 
            __RPC__in IWDTFInternalTarget2 * This,
            /* [in] */ __RPC__in BSTR RelationSDEL,
            /* [in] */ __RPC__in BSTR MatchSDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTargets2 **ppRelations);
        
        END_INTERFACE
    } IWDTFInternalTarget2Vtbl;

    interface IWDTFInternalTarget2
    {
        CONST_VTBL struct IWDTFInternalTarget2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFInternalTarget2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFInternalTarget2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFInternalTarget2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFInternalTarget2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFInternalTarget2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFInternalTarget2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFInternalTarget2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFInternalTarget2_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IWDTFInternalTarget2_get_WDTF(This,ppWDTF)	\
    ( (This)->lpVtbl -> get_WDTF(This,ppWDTF) ) 

#define IWDTFInternalTarget2_get_Type(This,pVal)	\
    ( (This)->lpVtbl -> get_Type(This,pVal) ) 

#define IWDTFInternalTarget2_get_Context(This,Tag,pVal)	\
    ( (This)->lpVtbl -> get_Context(This,Tag,pVal) ) 

#define IWDTFInternalTarget2_put_Context(This,Tag,newVal)	\
    ( (This)->lpVtbl -> put_Context(This,Tag,newVal) ) 

#define IWDTFInternalTarget2_Eval(This,SDEL,pResult)	\
    ( (This)->lpVtbl -> Eval(This,SDEL,pResult) ) 

#define IWDTFInternalTarget2_GetValue(This,SDEL,pValue)	\
    ( (This)->lpVtbl -> GetValue(This,SDEL,pValue) ) 

#define IWDTFInternalTarget2_GetInterface(This,WDTFInterfaceName,Args,MonikerSuffix,ppInterface)	\
    ( (This)->lpVtbl -> GetInterface(This,WDTFInterfaceName,Args,MonikerSuffix,ppInterface) ) 

#define IWDTFInternalTarget2_GetRelations(This,RelationSDEL,MatchSDEL,ppRelations)	\
    ( (This)->lpVtbl -> GetRelations(This,RelationSDEL,MatchSDEL,ppRelations) ) 

#define IWDTFInternalTarget2_HasContext(This,Tag,pResult)	\
    ( (This)->lpVtbl -> HasContext(This,Tag,pResult) ) 

#define IWDTFInternalTarget2_HasInterface(This,WDTFInterfaceName,Args,MonikerSuffix,pResult)	\
    ( (This)->lpVtbl -> HasInterface(This,WDTFInterfaceName,Args,MonikerSuffix,pResult) ) 

#define IWDTFInternalTarget2_GetValueString(This,SDEL,pValue)	\
    ( (This)->lpVtbl -> GetValueString(This,SDEL,pValue) ) 

#define IWDTFInternalTarget2_GetValueStrings(This,SDEL,ppValues)	\
    ( (This)->lpVtbl -> GetValueStrings(This,SDEL,ppValues) ) 

#define IWDTFInternalTarget2_GetValueNumber(This,SDEL,pValue)	\
    ( (This)->lpVtbl -> GetValueNumber(This,SDEL,pValue) ) 

#define IWDTFInternalTarget2_GetValueNumbers(This,SDEL,ppValue)	\
    ( (This)->lpVtbl -> GetValueNumbers(This,SDEL,ppValue) ) 

#define IWDTFInternalTarget2_GetValueLongNumber(This,SDEL,pValue)	\
    ( (This)->lpVtbl -> GetValueLongNumber(This,SDEL,pValue) ) 

#define IWDTFInternalTarget2_GetValueLongNumbers(This,SDEL,ppValue)	\
    ( (This)->lpVtbl -> GetValueLongNumbers(This,SDEL,ppValue) ) 

#define IWDTFInternalTarget2_GetValueBool(This,SDEL,pValue)	\
    ( (This)->lpVtbl -> GetValueBool(This,SDEL,pValue) ) 


#define IWDTFInternalTarget2_InternalGetInterfaceVer1(This,WDTFInterfaceName,Args,MonikerSuffix,ppInterface)	\
    ( (This)->lpVtbl -> InternalGetInterfaceVer1(This,WDTFInterfaceName,Args,MonikerSuffix,ppInterface) ) 

#define IWDTFInternalTarget2_InternalGetInterfaceVer2(This,WDTFInterfaceName,Args,MonikerSuffix,ppInterface)	\
    ( (This)->lpVtbl -> InternalGetInterfaceVer2(This,WDTFInterfaceName,Args,MonikerSuffix,ppInterface) ) 

#define IWDTFInternalTarget2_InternalGetRelations(This,RelationSDEL,MatchSDEL,ppRelations)	\
    ( (This)->lpVtbl -> InternalGetRelations(This,RelationSDEL,MatchSDEL,ppRelations) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFInternalTarget2_INTERFACE_DEFINED__ */


#ifndef __IWDTFSystemDepot2_INTERFACE_DEFINED__
#define __IWDTFSystemDepot2_INTERFACE_DEFINED__

/* interface IWDTFSystemDepot2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFSystemDepot2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("ABA723E6-AB7D-4A77-BF93-D35ED7D1611A")
    IWDTFSystemDepot2 : public ITracing
    {
    public:
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_WDTF( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTF2 **ppWDTF) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_ThisSystem( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **pVal) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFSystemDepot2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFSystemDepot2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFSystemDepot2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFSystemDepot2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFSystemDepot2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFSystemDepot2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFSystemDepot2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFSystemDepot2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFSystemDepot2 * This,
            /* [in] */ TTraceLevel Level);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_WDTF )( 
            __RPC__in IWDTFSystemDepot2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTF2 **ppWDTF);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_ThisSystem )( 
            __RPC__in IWDTFSystemDepot2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **pVal);
        
        END_INTERFACE
    } IWDTFSystemDepot2Vtbl;

    interface IWDTFSystemDepot2
    {
        CONST_VTBL struct IWDTFSystemDepot2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFSystemDepot2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFSystemDepot2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFSystemDepot2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFSystemDepot2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFSystemDepot2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFSystemDepot2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFSystemDepot2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFSystemDepot2_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IWDTFSystemDepot2_get_WDTF(This,ppWDTF)	\
    ( (This)->lpVtbl -> get_WDTF(This,ppWDTF) ) 

#define IWDTFSystemDepot2_get_ThisSystem(This,pVal)	\
    ( (This)->lpVtbl -> get_ThisSystem(This,pVal) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFSystemDepot2_INTERFACE_DEFINED__ */


#ifndef __IWDTFDeviceDepot2_INTERFACE_DEFINED__
#define __IWDTFDeviceDepot2_INTERFACE_DEFINED__

/* interface IWDTFDeviceDepot2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFDeviceDepot2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("501E6CC4-4C6B-4B84-9F7B-B3FF7C2CE690")
    IWDTFDeviceDepot2 : public ITracing
    {
    public:
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_WDTF( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTF2 **ppWDTF) = 0;
        
        virtual /* [hidden][helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get__NewEnum( 
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum) = 0;
        
        virtual /* [helpstring][id][propget] */ HRESULT STDMETHODCALLTYPE get_Item( 
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **ppTarget) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_Count( 
            /* [retval][out] */ __RPC__out LONG *pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE Query( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTargets2 **ppTargets) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_RootDevice( 
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **pVal) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE QuerySingle( 
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **ppTarget) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFDeviceDepot2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFDeviceDepot2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFDeviceDepot2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFDeviceDepot2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *SetTraceLevel )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [in] */ TTraceLevel Level);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_WDTF )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTF2 **ppWDTF);
        
        /* [hidden][helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get__NewEnum )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IUnknown **ppNewEnum);
        
        /* [helpstring][id][propget] */ HRESULT ( STDMETHODCALLTYPE *get_Item )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [in] */ LONG Index,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **ppTarget);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_Count )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [retval][out] */ __RPC__out LONG *pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *Query )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTargets2 **ppTargets);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_RootDevice )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **pVal);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *QuerySingle )( 
            __RPC__in IWDTFDeviceDepot2 * This,
            /* [in] */ __RPC__in BSTR SDEL,
            /* [retval][out] */ __RPC__deref_out_opt IWDTFTarget2 **ppTarget);
        
        END_INTERFACE
    } IWDTFDeviceDepot2Vtbl;

    interface IWDTFDeviceDepot2
    {
        CONST_VTBL struct IWDTFDeviceDepot2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFDeviceDepot2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFDeviceDepot2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFDeviceDepot2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFDeviceDepot2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFDeviceDepot2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFDeviceDepot2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFDeviceDepot2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFDeviceDepot2_SetTraceLevel(This,Level)	\
    ( (This)->lpVtbl -> SetTraceLevel(This,Level) ) 


#define IWDTFDeviceDepot2_get_WDTF(This,ppWDTF)	\
    ( (This)->lpVtbl -> get_WDTF(This,ppWDTF) ) 

#define IWDTFDeviceDepot2_get__NewEnum(This,ppNewEnum)	\
    ( (This)->lpVtbl -> get__NewEnum(This,ppNewEnum) ) 

#define IWDTFDeviceDepot2_get_Item(This,Index,ppTarget)	\
    ( (This)->lpVtbl -> get_Item(This,Index,ppTarget) ) 

#define IWDTFDeviceDepot2_get_Count(This,pVal)	\
    ( (This)->lpVtbl -> get_Count(This,pVal) ) 

#define IWDTFDeviceDepot2_Query(This,SDEL,ppTargets)	\
    ( (This)->lpVtbl -> Query(This,SDEL,ppTargets) ) 

#define IWDTFDeviceDepot2_get_RootDevice(This,pVal)	\
    ( (This)->lpVtbl -> get_RootDevice(This,pVal) ) 

#define IWDTFDeviceDepot2_QuerySingle(This,SDEL,ppTarget)	\
    ( (This)->lpVtbl -> QuerySingle(This,SDEL,ppTarget) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFDeviceDepot2_INTERFACE_DEFINED__ */


#ifndef __IWDTFLOG2_INTERFACE_DEFINED__
#define __IWDTFLOG2_INTERFACE_DEFINED__

/* interface IWDTFLOG2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFLOG2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("C5CEAA1E-878B-45C3-8E5C-EDDC5A36CC79")
    IWDTFLOG2 : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE StartTestCase( 
            /* [in] */ __RPC__in BSTR sTestCaseName) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EndTestCase( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OutputInfo( 
            /* [in] */ __RPC__in BSTR sInfoString) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE OutputError( 
            /* [in] */ __RPC__in BSTR sErrorString) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFLOG2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFLOG2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFLOG2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFLOG2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFLOG2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFLOG2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFLOG2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFLOG2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *StartTestCase )( 
            __RPC__in IWDTFLOG2 * This,
            /* [in] */ __RPC__in BSTR sTestCaseName);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EndTestCase )( 
            __RPC__in IWDTFLOG2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OutputInfo )( 
            __RPC__in IWDTFLOG2 * This,
            /* [in] */ __RPC__in BSTR sInfoString);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *OutputError )( 
            __RPC__in IWDTFLOG2 * This,
            /* [in] */ __RPC__in BSTR sErrorString);
        
        END_INTERFACE
    } IWDTFLOG2Vtbl;

    interface IWDTFLOG2
    {
        CONST_VTBL struct IWDTFLOG2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFLOG2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFLOG2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFLOG2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFLOG2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFLOG2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFLOG2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFLOG2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFLOG2_StartTestCase(This,sTestCaseName)	\
    ( (This)->lpVtbl -> StartTestCase(This,sTestCaseName) ) 

#define IWDTFLOG2_EndTestCase(This)	\
    ( (This)->lpVtbl -> EndTestCase(This) ) 

#define IWDTFLOG2_OutputInfo(This,sInfoString)	\
    ( (This)->lpVtbl -> OutputInfo(This,sInfoString) ) 

#define IWDTFLOG2_OutputError(This,sErrorString)	\
    ( (This)->lpVtbl -> OutputError(This,sErrorString) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFLOG2_INTERFACE_DEFINED__ */


#ifndef __IWDTFCONFIG2_INTERFACE_DEFINED__
#define __IWDTFCONFIG2_INTERFACE_DEFINED__

/* interface IWDTFCONFIG2 */
/* [unique][helpstring][nonextensible][dual][uuid][object] */ 


EXTERN_C const IID IID_IWDTFCONFIG2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("6B6EA9DC-7100-4450-8540-5E19828FDDCC")
    IWDTFCONFIG2 : public IDispatch
    {
    public:
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnableObjectLogging( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DisableObjectLogging( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IsObjectLoggingEnabled( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsEnabled) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE EnableObjectErrorLogging( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE DisableObjectErrorLogging( void) = 0;
        
        virtual /* [helpstring][id] */ HRESULT STDMETHODCALLTYPE IsObjectErrorLoggingEnabled( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsEnabled) = 0;
        
        virtual /* [helpstring][propput][id] */ HRESULT STDMETHODCALLTYPE put_TestModeVerify( 
            /* [in] */ VARIANT_BOOL bTestModeVerify) = 0;
        
        virtual /* [helpstring][propget][id] */ HRESULT STDMETHODCALLTYPE get_TestModeVerify( 
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbTestModeVerify) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IWDTFCONFIG2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IWDTFCONFIG2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IWDTFCONFIG2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IWDTFCONFIG2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfoCount )( 
            __RPC__in IWDTFCONFIG2 * This,
            /* [out] */ __RPC__out UINT *pctinfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetTypeInfo )( 
            __RPC__in IWDTFCONFIG2 * This,
            /* [in] */ UINT iTInfo,
            /* [in] */ LCID lcid,
            /* [out] */ __RPC__deref_out_opt ITypeInfo **ppTInfo);
        
        HRESULT ( STDMETHODCALLTYPE *GetIDsOfNames )( 
            __RPC__in IWDTFCONFIG2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [size_is][in] */ __RPC__in_ecount_full(cNames) LPOLESTR *rgszNames,
            /* [range][in] */ __RPC__in_range(0,16384) UINT cNames,
            /* [in] */ LCID lcid,
            /* [size_is][out] */ __RPC__out_ecount_full(cNames) DISPID *rgDispId);
        
        /* [local] */ HRESULT ( STDMETHODCALLTYPE *Invoke )( 
            IWDTFCONFIG2 * This,
            /* [annotation][in] */ 
            _In_  DISPID dispIdMember,
            /* [annotation][in] */ 
            _In_  REFIID riid,
            /* [annotation][in] */ 
            _In_  LCID lcid,
            /* [annotation][in] */ 
            _In_  WORD wFlags,
            /* [annotation][out][in] */ 
            _In_  DISPPARAMS *pDispParams,
            /* [annotation][out] */ 
            _Out_opt_  VARIANT *pVarResult,
            /* [annotation][out] */ 
            _Out_opt_  EXCEPINFO *pExcepInfo,
            /* [annotation][out] */ 
            _Out_opt_  UINT *puArgErr);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectLogging )( 
            __RPC__in IWDTFCONFIG2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectLogging )( 
            __RPC__in IWDTFCONFIG2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *IsObjectLoggingEnabled )( 
            __RPC__in IWDTFCONFIG2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsEnabled);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *EnableObjectErrorLogging )( 
            __RPC__in IWDTFCONFIG2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *DisableObjectErrorLogging )( 
            __RPC__in IWDTFCONFIG2 * This);
        
        /* [helpstring][id] */ HRESULT ( STDMETHODCALLTYPE *IsObjectErrorLoggingEnabled )( 
            __RPC__in IWDTFCONFIG2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbIsEnabled);
        
        /* [helpstring][propput][id] */ HRESULT ( STDMETHODCALLTYPE *put_TestModeVerify )( 
            __RPC__in IWDTFCONFIG2 * This,
            /* [in] */ VARIANT_BOOL bTestModeVerify);
        
        /* [helpstring][propget][id] */ HRESULT ( STDMETHODCALLTYPE *get_TestModeVerify )( 
            __RPC__in IWDTFCONFIG2 * This,
            /* [retval][out] */ __RPC__out VARIANT_BOOL *pbTestModeVerify);
        
        END_INTERFACE
    } IWDTFCONFIG2Vtbl;

    interface IWDTFCONFIG2
    {
        CONST_VTBL struct IWDTFCONFIG2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IWDTFCONFIG2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IWDTFCONFIG2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IWDTFCONFIG2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IWDTFCONFIG2_GetTypeInfoCount(This,pctinfo)	\
    ( (This)->lpVtbl -> GetTypeInfoCount(This,pctinfo) ) 

#define IWDTFCONFIG2_GetTypeInfo(This,iTInfo,lcid,ppTInfo)	\
    ( (This)->lpVtbl -> GetTypeInfo(This,iTInfo,lcid,ppTInfo) ) 

#define IWDTFCONFIG2_GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId)	\
    ( (This)->lpVtbl -> GetIDsOfNames(This,riid,rgszNames,cNames,lcid,rgDispId) ) 

#define IWDTFCONFIG2_Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr)	\
    ( (This)->lpVtbl -> Invoke(This,dispIdMember,riid,lcid,wFlags,pDispParams,pVarResult,pExcepInfo,puArgErr) ) 


#define IWDTFCONFIG2_EnableObjectLogging(This)	\
    ( (This)->lpVtbl -> EnableObjectLogging(This) ) 

#define IWDTFCONFIG2_DisableObjectLogging(This)	\
    ( (This)->lpVtbl -> DisableObjectLogging(This) ) 

#define IWDTFCONFIG2_IsObjectLoggingEnabled(This,pbIsEnabled)	\
    ( (This)->lpVtbl -> IsObjectLoggingEnabled(This,pbIsEnabled) ) 

#define IWDTFCONFIG2_EnableObjectErrorLogging(This)	\
    ( (This)->lpVtbl -> EnableObjectErrorLogging(This) ) 

#define IWDTFCONFIG2_DisableObjectErrorLogging(This)	\
    ( (This)->lpVtbl -> DisableObjectErrorLogging(This) ) 

#define IWDTFCONFIG2_IsObjectErrorLoggingEnabled(This,pbIsEnabled)	\
    ( (This)->lpVtbl -> IsObjectErrorLoggingEnabled(This,pbIsEnabled) ) 

#define IWDTFCONFIG2_put_TestModeVerify(This,bTestModeVerify)	\
    ( (This)->lpVtbl -> put_TestModeVerify(This,bTestModeVerify) ) 

#define IWDTFCONFIG2_get_TestModeVerify(This,pbTestModeVerify)	\
    ( (This)->lpVtbl -> get_TestModeVerify(This,pbTestModeVerify) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IWDTFCONFIG2_INTERFACE_DEFINED__ */


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

EXTERN_C const CLSID CLSID_WDTFActions2;

#ifdef __cplusplus

class DECLSPEC_UUID("240FA08C-1D70-40CB-BDB3-2CC41A45496B")
WDTFActions2;
#endif

EXTERN_C const CLSID CLSID_MatchEventSource;

#ifdef __cplusplus

class DECLSPEC_UUID("2C9AF7D6-2589-4413-A2BA-9926EBCFD67C")
MatchEventSource;
#endif

EXTERN_C const CLSID CLSID_WDTFStrings2;

#ifdef __cplusplus

class DECLSPEC_UUID("B43FF7F1-629C-4DE5-9559-1D09E0A07037")
WDTFStrings2;
#endif

EXTERN_C const CLSID CLSID_WDTFNumbers2;

#ifdef __cplusplus

class DECLSPEC_UUID("0E770B12-7221-4A5D-86EE-77310A5506BB")
WDTFNumbers2;
#endif

EXTERN_C const CLSID CLSID_WDTFLongNumbers2;

#ifdef __cplusplus

class DECLSPEC_UUID("A2FD15D7-64F0-4080-AABD-884380202022")
WDTFLongNumbers2;
#endif

EXTERN_C const CLSID CLSID_WDTF2;

#ifdef __cplusplus

class DECLSPEC_UUID("0D972387-817B-46E7-913F-E9993FF401EB")
WDTF2;
#endif

EXTERN_C const CLSID CLSID_WDTFLOG2;

#ifdef __cplusplus

class DECLSPEC_UUID("2236B1F3-4A33-48C2-B22C-A1F93A626F05")
WDTFLOG2;
#endif

EXTERN_C const CLSID CLSID_WDTFCONFIG2;

#ifdef __cplusplus

class DECLSPEC_UUID("26CC4211-A9A6-4E5C-A30D-3C659BB4CDC9")
WDTFCONFIG2;
#endif

EXTERN_C const CLSID CLSID_WDTFTargets2;

#ifdef __cplusplus

class DECLSPEC_UUID("9663A00A-5B72-4810-9014-C77108062949")
WDTFTargets2;
#endif
#endif /* __WDTFLib_LIBRARY_DEFINED__ */

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


