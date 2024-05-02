

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

#ifndef __bluetoothconnectionmanager_h__
#define __bluetoothconnectionmanager_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef __IBtRadioController_FWD_DEFINED__
#define __IBtRadioController_FWD_DEFINED__
typedef interface IBtRadioController IBtRadioController;

#endif 	/* __IBtRadioController_FWD_DEFINED__ */


#ifndef __IBtCommandCallback_FWD_DEFINED__
#define __IBtCommandCallback_FWD_DEFINED__
typedef interface IBtCommandCallback IBtCommandCallback;

#endif 	/* __IBtCommandCallback_FWD_DEFINED__ */


#ifndef __IBtConnectionObserver_FWD_DEFINED__
#define __IBtConnectionObserver_FWD_DEFINED__
typedef interface IBtConnectionObserver IBtConnectionObserver;

#endif 	/* __IBtConnectionObserver_FWD_DEFINED__ */


#ifndef __IBtConnectionObserverCallback_FWD_DEFINED__
#define __IBtConnectionObserverCallback_FWD_DEFINED__
typedef interface IBtConnectionObserverCallback IBtConnectionObserverCallback;

#endif 	/* __IBtConnectionObserverCallback_FWD_DEFINED__ */


#ifndef __IBtConnectionObserverCallback2_FWD_DEFINED__
#define __IBtConnectionObserverCallback2_FWD_DEFINED__
typedef interface IBtConnectionObserverCallback2 IBtConnectionObserverCallback2;

#endif 	/* __IBtConnectionObserverCallback2_FWD_DEFINED__ */


#ifndef __IBtPairingRequest_FWD_DEFINED__
#define __IBtPairingRequest_FWD_DEFINED__
typedef interface IBtPairingRequest IBtPairingRequest;

#endif 	/* __IBtPairingRequest_FWD_DEFINED__ */


#ifndef __IBtPairingRequestCallback_FWD_DEFINED__
#define __IBtPairingRequestCallback_FWD_DEFINED__
typedef interface IBtPairingRequestCallback IBtPairingRequestCallback;

#endif 	/* __IBtPairingRequestCallback_FWD_DEFINED__ */


#ifndef __IBtIncomingPairingCallback_FWD_DEFINED__
#define __IBtIncomingPairingCallback_FWD_DEFINED__
typedef interface IBtIncomingPairingCallback IBtIncomingPairingCallback;

#endif 	/* __IBtIncomingPairingCallback_FWD_DEFINED__ */


#ifndef __BtConnectionManager_FWD_DEFINED__
#define __BtConnectionManager_FWD_DEFINED__

#ifdef __cplusplus
typedef class BtConnectionManager BtConnectionManager;
#else
typedef struct BtConnectionManager BtConnectionManager;
#endif /* __cplusplus */

#endif 	/* __BtConnectionManager_FWD_DEFINED__ */


#ifndef __IBtConnectionObserverCallback2_FWD_DEFINED__
#define __IBtConnectionObserverCallback2_FWD_DEFINED__
typedef interface IBtConnectionObserverCallback2 IBtConnectionObserverCallback2;

#endif 	/* __IBtConnectionObserverCallback2_FWD_DEFINED__ */


/* header files for imported files */
#include "oaidl.h"
#include "ocidl.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_bluetoothconnectionmanager_0000_0000 */
/* [local] */ 

#pragma region Application Family
#if WINAPI_FAMILY_PARTITION(WINAPI_PARTITION_PHONE_APP)
typedef enum BLUETOOTH_RADIO_STATE BLUETOOTH_RADIO_STATE;

typedef enum INQUIRY_MODE INQUIRY_MODE;

typedef enum DISCOVERY_MODE DISCOVERY_MODE;

typedef enum BLUETOOTH_DEVICE_STATE BLUETOOTH_DEVICE_STATE;

typedef enum BLUETOOTH_CONNECTION_STATE BLUETOOTH_CONNECTION_STATE;









typedef enum AuthenticationRequirements AuthenticationRequirements;

#if NEVER
typedef 
enum AUTHENTICATION_REQUIREMENTS
    {
        x	= 0
    } 	AUTHENTICATION_REQUIREMENTS;

typedef INT_PTR MIDL_PVOID;

typedef INT_PTR MIDL_HANDLE;

typedef UINT_PTR SOCKET;

typedef ULONGLONG BTH_ADDR;

#else
#include <BluetoothAPIs.h>
typedef void* MIDL_PVOID;
typedef HANDLE MIDL_HANDLE;
#define E_NOT_READY HRESULT_FROM_WIN32(ERROR_NOT_READY)
#define E_NOT_AUTHENTICATED HRESULT_FROM_WIN32(ERROR_NOT_AUTHENTICATED)
#endif

enum BLUETOOTH_RADIO_STATE
    {
        BRS_UNKNOWN	= 0,
        BRS_NO_HARDWARE	= ( BRS_UNKNOWN + 1 ) ,
        BRS_DISABLED	= ( BRS_NO_HARDWARE + 1 ) ,
        BRS_ENABLING	= ( BRS_DISABLED + 1 ) ,
        BRS_ENABLED	= ( BRS_ENABLING + 1 ) ,
        BRS_DISABLING	= ( BRS_ENABLED + 1 ) 
    } ;

enum INQUIRY_MODE
    {
        IM_NONE	= 0,
        IM_LIMITED	= ( IM_NONE + 1 ) ,
        IM_GENERAL	= ( IM_LIMITED + 1 ) 
    } ;

enum DISCOVERY_MODE
    {
        DM_NONE	= 0,
        DM_GENERAL	= ( DM_NONE + 1 ) ,
        DM_LIMITED	= ( DM_GENERAL + 1 ) 
    } ;

enum BLUETOOTH_DEVICE_STATE
    {
        BDS_NOT_VISIBLE	= 0,
        BDS_VISIBLE	= ( BDS_NOT_VISIBLE + 1 ) ,
        BDS_PAIRED	= ( BDS_VISIBLE + 1 ) ,
        BDS_PAIRING	= ( BDS_PAIRED + 1 ) ,
        BDS_CONNECTING	= ( BDS_PAIRING + 1 ) ,
        BDS_CONNECTED	= ( BDS_CONNECTING + 1 ) ,
        BDS_DISCONNECTING	= ( BDS_CONNECTED + 1 ) ,
        BDS_UNPAIRING	= ( BDS_DISCONNECTING + 1 ) 
    } ;

enum BLUETOOTH_CONNECTION_STATE
    {
        BCS_DISCONNECTED	= 0,
        BCS_CONNECTING	= ( BCS_DISCONNECTED + 1 ) ,
        BCS_CONNECTED	= ( BCS_CONNECTING + 1 ) ,
        BCS_DISCONNECTING	= ( BCS_CONNECTED + 1 ) 
    } ;

enum AuthenticationRequirements
    {
        MITMProtectionNotRequired	= 0,
        MITMProtectionRequired	= ( MITMProtectionNotRequired + 1 ) ,
        MITMProtectionNotRequiredBonding	= ( MITMProtectionRequired + 1 ) ,
        MITMProtectionRequiredBonding	= ( MITMProtectionNotRequiredBonding + 1 ) ,
        MITMProtectionNotRequiredGeneralBonding	= ( MITMProtectionRequiredBonding + 1 ) ,
        MITMProtectionRequiredGeneralBonding	= ( MITMProtectionNotRequiredGeneralBonding + 1 ) ,
        MITMProtectionNotDefined	= 255
    } ;
#pragma deprecated(IBtRadioController) // Please use Windows.Devices.Enumeration, Windows.Devices.Bluetooth and Windows.Devices.Radios namespaces.


extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0000_v0_0_s_ifspec;

#ifndef __IBtRadioController_INTERFACE_DEFINED__
#define __IBtRadioController_INTERFACE_DEFINED__

/* interface IBtRadioController */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IBtRadioController;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("bb431756-4878-46c3-a8fc-ec95ff2df54d")
    IBtRadioController : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE EnableBluetoothRadio( 
            /* [in] */ BOOLEAN enable,
            /* [in] */ __RPC__in_opt IBtCommandCallback *callback,
            /* [in] */ MIDL_PVOID context) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetInquiryMode( 
            /* [in] */ INQUIRY_MODE inquiryMode) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetDiscoveryMode( 
            /* [in] */ DISCOVERY_MODE disocveryMode) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE CreatePairingRequest( 
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ __RPC__in_opt IBtPairingRequestCallback *callback,
            /* [out] */ __RPC__deref_out_opt IBtPairingRequest **pairingRequest) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE UnpairDevice( 
            /* [in] */ BTH_ADDR bluetoothAddress) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ConnectDevice( 
            /* [in] */ BTH_ADDR bluetoothAddress) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE DisconnectDevice( 
            /* [in] */ BTH_ADDR bluetoothAddress) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RegisterForIncomingPairing( 
            /* [in] */ __RPC__in_opt IBtIncomingPairingCallback *callback) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE UnregisterForIncomingPairing( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ReservedForInternalUseOnly1( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE GetBluetoothAddress( 
            /* [out] */ __RPC__out BTH_ADDR *bluetoothAddress) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Shutdown( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SynchronousShutdown( 
            DWORD timeout) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IBtRadioControllerVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IBtRadioController * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IBtRadioController * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IBtRadioController * This);
        
        HRESULT ( STDMETHODCALLTYPE *EnableBluetoothRadio )( 
            __RPC__in IBtRadioController * This,
            /* [in] */ BOOLEAN enable,
            /* [in] */ __RPC__in_opt IBtCommandCallback *callback,
            /* [in] */ MIDL_PVOID context);
        
        HRESULT ( STDMETHODCALLTYPE *SetInquiryMode )( 
            __RPC__in IBtRadioController * This,
            /* [in] */ INQUIRY_MODE inquiryMode);
        
        HRESULT ( STDMETHODCALLTYPE *SetDiscoveryMode )( 
            __RPC__in IBtRadioController * This,
            /* [in] */ DISCOVERY_MODE disocveryMode);
        
        HRESULT ( STDMETHODCALLTYPE *CreatePairingRequest )( 
            __RPC__in IBtRadioController * This,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ __RPC__in_opt IBtPairingRequestCallback *callback,
            /* [out] */ __RPC__deref_out_opt IBtPairingRequest **pairingRequest);
        
        HRESULT ( STDMETHODCALLTYPE *UnpairDevice )( 
            __RPC__in IBtRadioController * This,
            /* [in] */ BTH_ADDR bluetoothAddress);
        
        HRESULT ( STDMETHODCALLTYPE *ConnectDevice )( 
            __RPC__in IBtRadioController * This,
            /* [in] */ BTH_ADDR bluetoothAddress);
        
        HRESULT ( STDMETHODCALLTYPE *DisconnectDevice )( 
            __RPC__in IBtRadioController * This,
            /* [in] */ BTH_ADDR bluetoothAddress);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterForIncomingPairing )( 
            __RPC__in IBtRadioController * This,
            /* [in] */ __RPC__in_opt IBtIncomingPairingCallback *callback);
        
        HRESULT ( STDMETHODCALLTYPE *UnregisterForIncomingPairing )( 
            __RPC__in IBtRadioController * This);
        
        HRESULT ( STDMETHODCALLTYPE *ReservedForInternalUseOnly1 )( 
            __RPC__in IBtRadioController * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetBluetoothAddress )( 
            __RPC__in IBtRadioController * This,
            /* [out] */ __RPC__out BTH_ADDR *bluetoothAddress);
        
        HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            __RPC__in IBtRadioController * This);
        
        HRESULT ( STDMETHODCALLTYPE *SynchronousShutdown )( 
            __RPC__in IBtRadioController * This,
            DWORD timeout);
        
        END_INTERFACE
    } IBtRadioControllerVtbl;

    interface IBtRadioController
    {
        CONST_VTBL struct IBtRadioControllerVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IBtRadioController_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IBtRadioController_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IBtRadioController_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IBtRadioController_EnableBluetoothRadio(This,enable,callback,context)	\
    ( (This)->lpVtbl -> EnableBluetoothRadio(This,enable,callback,context) ) 

#define IBtRadioController_SetInquiryMode(This,inquiryMode)	\
    ( (This)->lpVtbl -> SetInquiryMode(This,inquiryMode) ) 

#define IBtRadioController_SetDiscoveryMode(This,disocveryMode)	\
    ( (This)->lpVtbl -> SetDiscoveryMode(This,disocveryMode) ) 

#define IBtRadioController_CreatePairingRequest(This,bluetoothAddress,callback,pairingRequest)	\
    ( (This)->lpVtbl -> CreatePairingRequest(This,bluetoothAddress,callback,pairingRequest) ) 

#define IBtRadioController_UnpairDevice(This,bluetoothAddress)	\
    ( (This)->lpVtbl -> UnpairDevice(This,bluetoothAddress) ) 

#define IBtRadioController_ConnectDevice(This,bluetoothAddress)	\
    ( (This)->lpVtbl -> ConnectDevice(This,bluetoothAddress) ) 

#define IBtRadioController_DisconnectDevice(This,bluetoothAddress)	\
    ( (This)->lpVtbl -> DisconnectDevice(This,bluetoothAddress) ) 

#define IBtRadioController_RegisterForIncomingPairing(This,callback)	\
    ( (This)->lpVtbl -> RegisterForIncomingPairing(This,callback) ) 

#define IBtRadioController_UnregisterForIncomingPairing(This)	\
    ( (This)->lpVtbl -> UnregisterForIncomingPairing(This) ) 

#define IBtRadioController_ReservedForInternalUseOnly1(This)	\
    ( (This)->lpVtbl -> ReservedForInternalUseOnly1(This) ) 

#define IBtRadioController_GetBluetoothAddress(This,bluetoothAddress)	\
    ( (This)->lpVtbl -> GetBluetoothAddress(This,bluetoothAddress) ) 

#define IBtRadioController_Shutdown(This)	\
    ( (This)->lpVtbl -> Shutdown(This) ) 

#define IBtRadioController_SynchronousShutdown(This,timeout)	\
    ( (This)->lpVtbl -> SynchronousShutdown(This,timeout) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IBtRadioController_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_bluetoothconnectionmanager_0000_0001 */
/* [local] */ 

#pragma deprecated(IBtCommandCallback) // Please use Windows.Devices.Enumeration, Windows.Devices.Bluetooth and Windows.Devices.Radios namespaces.


extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0001_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0001_v0_0_s_ifspec;

#ifndef __IBtCommandCallback_INTERFACE_DEFINED__
#define __IBtCommandCallback_INTERFACE_DEFINED__

/* interface IBtCommandCallback */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IBtCommandCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("0eba760c-c48d-4811-b4c4-8ce879b201b1")
    IBtCommandCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE CommandCompleted( 
            /* [in] */ MIDL_PVOID context,
            /* [in] */ HRESULT error) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IBtCommandCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IBtCommandCallback * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IBtCommandCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IBtCommandCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *CommandCompleted )( 
            __RPC__in IBtCommandCallback * This,
            /* [in] */ MIDL_PVOID context,
            /* [in] */ HRESULT error);
        
        END_INTERFACE
    } IBtCommandCallbackVtbl;

    interface IBtCommandCallback
    {
        CONST_VTBL struct IBtCommandCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IBtCommandCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IBtCommandCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IBtCommandCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IBtCommandCallback_CommandCompleted(This,context,error)	\
    ( (This)->lpVtbl -> CommandCompleted(This,context,error) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IBtCommandCallback_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_bluetoothconnectionmanager_0000_0002 */
/* [local] */ 

#pragma deprecated(IBtConnectionObserver) // Please use Windows.Devices.Enumeration, Windows.Devices.Bluetooth, Windows.Devices.Radios and Windows.Devices.Bluetooth.Advertisement namespaces.


extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0002_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0002_v0_0_s_ifspec;

#ifndef __IBtConnectionObserver_INTERFACE_DEFINED__
#define __IBtConnectionObserver_INTERFACE_DEFINED__

/* interface IBtConnectionObserver */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IBtConnectionObserver;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("83c91970-1d3d-48e3-859f-436eb34f34fd")
    IBtConnectionObserver : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE RegisterCallback( 
            /* [in] */ __RPC__in_opt IBtConnectionObserverCallback *callback,
            /* [out] */ __RPC__out INT_PTR *registrationHandle) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE UnregisterCallback( 
            /* [in] */ INT_PTR registrationHandle) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE Shutdown( void) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IBtConnectionObserverVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IBtConnectionObserver * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IBtConnectionObserver * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IBtConnectionObserver * This);
        
        HRESULT ( STDMETHODCALLTYPE *RegisterCallback )( 
            __RPC__in IBtConnectionObserver * This,
            /* [in] */ __RPC__in_opt IBtConnectionObserverCallback *callback,
            /* [out] */ __RPC__out INT_PTR *registrationHandle);
        
        HRESULT ( STDMETHODCALLTYPE *UnregisterCallback )( 
            __RPC__in IBtConnectionObserver * This,
            /* [in] */ INT_PTR registrationHandle);
        
        HRESULT ( STDMETHODCALLTYPE *Shutdown )( 
            __RPC__in IBtConnectionObserver * This);
        
        END_INTERFACE
    } IBtConnectionObserverVtbl;

    interface IBtConnectionObserver
    {
        CONST_VTBL struct IBtConnectionObserverVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IBtConnectionObserver_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IBtConnectionObserver_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IBtConnectionObserver_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IBtConnectionObserver_RegisterCallback(This,callback,registrationHandle)	\
    ( (This)->lpVtbl -> RegisterCallback(This,callback,registrationHandle) ) 

#define IBtConnectionObserver_UnregisterCallback(This,registrationHandle)	\
    ( (This)->lpVtbl -> UnregisterCallback(This,registrationHandle) ) 

#define IBtConnectionObserver_Shutdown(This)	\
    ( (This)->lpVtbl -> Shutdown(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IBtConnectionObserver_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_bluetoothconnectionmanager_0000_0003 */
/* [local] */ 

#pragma deprecated(IBtConnectionObserverCallback) // Please use Windows.Devices.Enumeration, Windows.Devices.Bluetooth and Windows.Devices.Radios namespaces.


extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0003_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0003_v0_0_s_ifspec;

#ifndef __IBtConnectionObserverCallback_INTERFACE_DEFINED__
#define __IBtConnectionObserverCallback_INTERFACE_DEFINED__

/* interface IBtConnectionObserverCallback */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IBtConnectionObserverCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("3d6da6ca-8b2d-4c38-bbd9-7b2c53105423")
    IBtConnectionObserverCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE RadioStateChanged( 
            /* [in] */ BLUETOOTH_RADIO_STATE state) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE RemoteDeviceChanged( 
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ BLUETOOTH_DEVICE_STATE deviceState,
            /* [in] */ DWORD classOfDevice,
            /* [in] */ __RPC__in LPCWSTR deviceName) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ProfileConnectionChanged( 
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ __RPC__in REFGUID guidProfile,
            /* [in] */ BLUETOOTH_CONNECTION_STATE connectionState) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE InitializationComplete( void) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IBtConnectionObserverCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IBtConnectionObserverCallback * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IBtConnectionObserverCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IBtConnectionObserverCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *RadioStateChanged )( 
            __RPC__in IBtConnectionObserverCallback * This,
            /* [in] */ BLUETOOTH_RADIO_STATE state);
        
        HRESULT ( STDMETHODCALLTYPE *RemoteDeviceChanged )( 
            __RPC__in IBtConnectionObserverCallback * This,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ BLUETOOTH_DEVICE_STATE deviceState,
            /* [in] */ DWORD classOfDevice,
            /* [in] */ __RPC__in LPCWSTR deviceName);
        
        HRESULT ( STDMETHODCALLTYPE *ProfileConnectionChanged )( 
            __RPC__in IBtConnectionObserverCallback * This,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ __RPC__in REFGUID guidProfile,
            /* [in] */ BLUETOOTH_CONNECTION_STATE connectionState);
        
        HRESULT ( STDMETHODCALLTYPE *InitializationComplete )( 
            __RPC__in IBtConnectionObserverCallback * This);
        
        END_INTERFACE
    } IBtConnectionObserverCallbackVtbl;

    interface IBtConnectionObserverCallback
    {
        CONST_VTBL struct IBtConnectionObserverCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IBtConnectionObserverCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IBtConnectionObserverCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IBtConnectionObserverCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IBtConnectionObserverCallback_RadioStateChanged(This,state)	\
    ( (This)->lpVtbl -> RadioStateChanged(This,state) ) 

#define IBtConnectionObserverCallback_RemoteDeviceChanged(This,bluetoothAddress,deviceState,classOfDevice,deviceName)	\
    ( (This)->lpVtbl -> RemoteDeviceChanged(This,bluetoothAddress,deviceState,classOfDevice,deviceName) ) 

#define IBtConnectionObserverCallback_ProfileConnectionChanged(This,bluetoothAddress,guidProfile,connectionState)	\
    ( (This)->lpVtbl -> ProfileConnectionChanged(This,bluetoothAddress,guidProfile,connectionState) ) 

#define IBtConnectionObserverCallback_InitializationComplete(This)	\
    ( (This)->lpVtbl -> InitializationComplete(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IBtConnectionObserverCallback_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_bluetoothconnectionmanager_0000_0004 */
/* [local] */ 

#pragma deprecated(IBtConnectionObserverCallback) // Please use Windows.Devices.Bluetooth.Advertisement namespace.


extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0004_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0004_v0_0_s_ifspec;

#ifndef __IBtConnectionObserverCallback2_INTERFACE_DEFINED__
#define __IBtConnectionObserverCallback2_INTERFACE_DEFINED__

/* interface IBtConnectionObserverCallback2 */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IBtConnectionObserverCallback2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("cbbc9044-eed8-49bd-bd3a-887ad84ac3f5")
    IBtConnectionObserverCallback2 : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE SignalStrengthChanged( 
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ INT32 signalStrength) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE AdvertisingDataChanged( 
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ UINT32 dataSize,
            /* [in] */ __RPC__in const BYTE *data) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IBtConnectionObserverCallback2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IBtConnectionObserverCallback2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IBtConnectionObserverCallback2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IBtConnectionObserverCallback2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *SignalStrengthChanged )( 
            __RPC__in IBtConnectionObserverCallback2 * This,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ INT32 signalStrength);
        
        HRESULT ( STDMETHODCALLTYPE *AdvertisingDataChanged )( 
            __RPC__in IBtConnectionObserverCallback2 * This,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ UINT32 dataSize,
            /* [in] */ __RPC__in const BYTE *data);
        
        END_INTERFACE
    } IBtConnectionObserverCallback2Vtbl;

    interface IBtConnectionObserverCallback2
    {
        CONST_VTBL struct IBtConnectionObserverCallback2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IBtConnectionObserverCallback2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IBtConnectionObserverCallback2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IBtConnectionObserverCallback2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IBtConnectionObserverCallback2_SignalStrengthChanged(This,bluetoothAddress,signalStrength)	\
    ( (This)->lpVtbl -> SignalStrengthChanged(This,bluetoothAddress,signalStrength) ) 

#define IBtConnectionObserverCallback2_AdvertisingDataChanged(This,bluetoothAddress,dataSize,data)	\
    ( (This)->lpVtbl -> AdvertisingDataChanged(This,bluetoothAddress,dataSize,data) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IBtConnectionObserverCallback2_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_bluetoothconnectionmanager_0000_0005 */
/* [local] */ 

#pragma deprecated(IBtPairingRequest) // Please use Windows.Devices.Enumeration and Windows.Devices.Bluetooth namespaces.


extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0005_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0005_v0_0_s_ifspec;

#ifndef __IBtPairingRequest_INTERFACE_DEFINED__
#define __IBtPairingRequest_INTERFACE_DEFINED__

/* interface IBtPairingRequest */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IBtPairingRequest;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("eb7c310f-c408-43fe-98e6-4b9bae958c41")
    IBtPairingRequest : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE StartPairing( 
            /* [in] */ AuthenticationRequirements requirements,
            /* [in] */ MIDL_PVOID oobData) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE SetPin( 
            /* [in] */ INT32 pinSize,
            /* [in] */ __RPC__in BYTE *pin) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE AcceptPairing( void) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE FailAuthentication( void) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IBtPairingRequestVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IBtPairingRequest * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IBtPairingRequest * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IBtPairingRequest * This);
        
        HRESULT ( STDMETHODCALLTYPE *StartPairing )( 
            __RPC__in IBtPairingRequest * This,
            /* [in] */ AuthenticationRequirements requirements,
            /* [in] */ MIDL_PVOID oobData);
        
        HRESULT ( STDMETHODCALLTYPE *SetPin )( 
            __RPC__in IBtPairingRequest * This,
            /* [in] */ INT32 pinSize,
            /* [in] */ __RPC__in BYTE *pin);
        
        HRESULT ( STDMETHODCALLTYPE *AcceptPairing )( 
            __RPC__in IBtPairingRequest * This);
        
        HRESULT ( STDMETHODCALLTYPE *FailAuthentication )( 
            __RPC__in IBtPairingRequest * This);
        
        END_INTERFACE
    } IBtPairingRequestVtbl;

    interface IBtPairingRequest
    {
        CONST_VTBL struct IBtPairingRequestVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IBtPairingRequest_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IBtPairingRequest_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IBtPairingRequest_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IBtPairingRequest_StartPairing(This,requirements,oobData)	\
    ( (This)->lpVtbl -> StartPairing(This,requirements,oobData) ) 

#define IBtPairingRequest_SetPin(This,pinSize,pin)	\
    ( (This)->lpVtbl -> SetPin(This,pinSize,pin) ) 

#define IBtPairingRequest_AcceptPairing(This)	\
    ( (This)->lpVtbl -> AcceptPairing(This) ) 

#define IBtPairingRequest_FailAuthentication(This)	\
    ( (This)->lpVtbl -> FailAuthentication(This) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IBtPairingRequest_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_bluetoothconnectionmanager_0000_0006 */
/* [local] */ 

#pragma deprecated(IBtPairingRequestCallback) // Please use Windows.Devices.Enumeration and Windows.Devices.Bluetooth namespaces.


extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0006_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0006_v0_0_s_ifspec;

#ifndef __IBtPairingRequestCallback_INTERFACE_DEFINED__
#define __IBtPairingRequestCallback_INTERFACE_DEFINED__

/* interface IBtPairingRequestCallback */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IBtPairingRequestCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("263d4058-d9aa-42d6-8efe-da3ab89ec514")
    IBtPairingRequestCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetPin( 
            /* [in] */ BTH_ADDR bluetoothAddress) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ShowPasskey( 
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ INT32 passkeySize,
            /* [in] */ __RPC__in BYTE *passkey) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE CompareNumber( 
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ INT32 number) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE OutgoingPairingCompleted( 
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ HRESULT error) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IBtPairingRequestCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IBtPairingRequestCallback * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IBtPairingRequestCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IBtPairingRequestCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetPin )( 
            __RPC__in IBtPairingRequestCallback * This,
            /* [in] */ BTH_ADDR bluetoothAddress);
        
        HRESULT ( STDMETHODCALLTYPE *ShowPasskey )( 
            __RPC__in IBtPairingRequestCallback * This,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ INT32 passkeySize,
            /* [in] */ __RPC__in BYTE *passkey);
        
        HRESULT ( STDMETHODCALLTYPE *CompareNumber )( 
            __RPC__in IBtPairingRequestCallback * This,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ INT32 number);
        
        HRESULT ( STDMETHODCALLTYPE *OutgoingPairingCompleted )( 
            __RPC__in IBtPairingRequestCallback * This,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ HRESULT error);
        
        END_INTERFACE
    } IBtPairingRequestCallbackVtbl;

    interface IBtPairingRequestCallback
    {
        CONST_VTBL struct IBtPairingRequestCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IBtPairingRequestCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IBtPairingRequestCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IBtPairingRequestCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IBtPairingRequestCallback_GetPin(This,bluetoothAddress)	\
    ( (This)->lpVtbl -> GetPin(This,bluetoothAddress) ) 

#define IBtPairingRequestCallback_ShowPasskey(This,bluetoothAddress,passkeySize,passkey)	\
    ( (This)->lpVtbl -> ShowPasskey(This,bluetoothAddress,passkeySize,passkey) ) 

#define IBtPairingRequestCallback_CompareNumber(This,bluetoothAddress,number)	\
    ( (This)->lpVtbl -> CompareNumber(This,bluetoothAddress,number) ) 

#define IBtPairingRequestCallback_OutgoingPairingCompleted(This,bluetoothAddress,error)	\
    ( (This)->lpVtbl -> OutgoingPairingCompleted(This,bluetoothAddress,error) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IBtPairingRequestCallback_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_bluetoothconnectionmanager_0000_0007 */
/* [local] */ 

#pragma deprecated(IBtIncomingPairingCallback) // Please use Windows.Devices.Enumeration and Windows.Devices.Bluetooth namespaces.


extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0007_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0007_v0_0_s_ifspec;

#ifndef __IBtIncomingPairingCallback_INTERFACE_DEFINED__
#define __IBtIncomingPairingCallback_INTERFACE_DEFINED__

/* interface IBtIncomingPairingCallback */
/* [unique][uuid][object] */ 


EXTERN_C const IID IID_IBtIncomingPairingCallback;

#if defined(__cplusplus) && !defined(CINTERFACE)
    
    MIDL_INTERFACE("22ed687a-b533-4479-9462-8a464ba11ebf")
    IBtIncomingPairingCallback : public IUnknown
    {
    public:
        virtual HRESULT STDMETHODCALLTYPE GetPin( 
            /* [in] */ __RPC__in_opt IBtPairingRequest *request,
            /* [in] */ BTH_ADDR bluetoothAddress) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE ShowPasskey( 
            /* [in] */ __RPC__in_opt IBtPairingRequest *request,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ INT32 passkeySize,
            /* [in] */ __RPC__in BYTE *passkey) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE CompareNumber( 
            /* [in] */ __RPC__in_opt IBtPairingRequest *request,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ INT32 number) = 0;
        
        virtual HRESULT STDMETHODCALLTYPE IncomingJustWorks( 
            /* [in] */ __RPC__in_opt IBtPairingRequest *request,
            /* [in] */ BTH_ADDR bluetoothAddress) = 0;
        
    };
    
    
#else 	/* C style interface */

    typedef struct IBtIncomingPairingCallbackVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in IBtIncomingPairingCallback * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in IBtIncomingPairingCallback * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in IBtIncomingPairingCallback * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetPin )( 
            __RPC__in IBtIncomingPairingCallback * This,
            /* [in] */ __RPC__in_opt IBtPairingRequest *request,
            /* [in] */ BTH_ADDR bluetoothAddress);
        
        HRESULT ( STDMETHODCALLTYPE *ShowPasskey )( 
            __RPC__in IBtIncomingPairingCallback * This,
            /* [in] */ __RPC__in_opt IBtPairingRequest *request,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ INT32 passkeySize,
            /* [in] */ __RPC__in BYTE *passkey);
        
        HRESULT ( STDMETHODCALLTYPE *CompareNumber )( 
            __RPC__in IBtIncomingPairingCallback * This,
            /* [in] */ __RPC__in_opt IBtPairingRequest *request,
            /* [in] */ BTH_ADDR bluetoothAddress,
            /* [in] */ INT32 number);
        
        HRESULT ( STDMETHODCALLTYPE *IncomingJustWorks )( 
            __RPC__in IBtIncomingPairingCallback * This,
            /* [in] */ __RPC__in_opt IBtPairingRequest *request,
            /* [in] */ BTH_ADDR bluetoothAddress);
        
        END_INTERFACE
    } IBtIncomingPairingCallbackVtbl;

    interface IBtIncomingPairingCallback
    {
        CONST_VTBL struct IBtIncomingPairingCallbackVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define IBtIncomingPairingCallback_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define IBtIncomingPairingCallback_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define IBtIncomingPairingCallback_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define IBtIncomingPairingCallback_GetPin(This,request,bluetoothAddress)	\
    ( (This)->lpVtbl -> GetPin(This,request,bluetoothAddress) ) 

#define IBtIncomingPairingCallback_ShowPasskey(This,request,bluetoothAddress,passkeySize,passkey)	\
    ( (This)->lpVtbl -> ShowPasskey(This,request,bluetoothAddress,passkeySize,passkey) ) 

#define IBtIncomingPairingCallback_CompareNumber(This,request,bluetoothAddress,number)	\
    ( (This)->lpVtbl -> CompareNumber(This,request,bluetoothAddress,number) ) 

#define IBtIncomingPairingCallback_IncomingJustWorks(This,request,bluetoothAddress)	\
    ( (This)->lpVtbl -> IncomingJustWorks(This,request,bluetoothAddress) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* __IBtIncomingPairingCallback_INTERFACE_DEFINED__ */



#ifndef __BtConnectionManager_LIBRARY_DEFINED__
#define __BtConnectionManager_LIBRARY_DEFINED__

/* library BtConnectionManager */
/* [uuid] */ 



EXTERN_C const IID LIBID_BtConnectionManager;

EXTERN_C const CLSID CLSID_BtConnectionManager;

#ifdef __cplusplus

class DECLSPEC_UUID("101c5b9f-c6f7-41c4-815b-69aac1eca0a9")
BtConnectionManager;
#endif
#endif /* __BtConnectionManager_LIBRARY_DEFINED__ */

/* interface __MIDL_itf_bluetoothconnectionmanager_0000_0009 */
/* [local] */ 

#endif /* WINAPI_FAMILY_PARTITION(WINAPI_PARTITION_PHONE_APP) */
#pragma endregion


extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0009_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_bluetoothconnectionmanager_0000_0009_v0_0_s_ifspec;

/* Additional Prototypes for ALL interfaces */

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


