

/* this ALWAYS GENERATED file contains the definitions for the interfaces */


 /* File created by MIDL compiler version 8.00.0613 */
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

#ifndef __windows2Ephone2Epersonalinformation2Eprovisioning_h__
#define __windows2Ephone2Epersonalinformation2Eprovisioning_h__

#if defined(_MSC_VER) && (_MSC_VER >= 1020)
#pragma once
#endif

/* Forward Declarations */ 

#ifndef ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_FWD_DEFINED__
#define ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_FWD_DEFINED__
typedef interface __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics;

#ifdef __cplusplus
namespace ABI {
    namespace Windows {
        namespace Phone {
            namespace PersonalInformation {
                namespace Provisioning {
                    interface IContactPartnerProvisioningManagerStatics;
                } /* end namespace */
            } /* end namespace */
        } /* end namespace */
    } /* end namespace */
} /* end namespace */

#endif /* __cplusplus */

#endif 	/* ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_FWD_DEFINED__ */


#ifndef ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_FWD_DEFINED__
#define ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_FWD_DEFINED__
typedef interface __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2 __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2;

#ifdef __cplusplus
namespace ABI {
    namespace Windows {
        namespace Phone {
            namespace PersonalInformation {
                namespace Provisioning {
                    interface IContactPartnerProvisioningManagerStatics2;
                } /* end namespace */
            } /* end namespace */
        } /* end namespace */
    } /* end namespace */
} /* end namespace */

#endif /* __cplusplus */

#endif 	/* ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_FWD_DEFINED__ */


#ifndef ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_FWD_DEFINED__
#define ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_FWD_DEFINED__
typedef interface __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics;

#ifdef __cplusplus
namespace ABI {
    namespace Windows {
        namespace Phone {
            namespace PersonalInformation {
                namespace Provisioning {
                    interface IMessagePartnerProvisioningManagerStatics;
                } /* end namespace */
            } /* end namespace */
        } /* end namespace */
    } /* end namespace */
} /* end namespace */

#endif /* __cplusplus */

#endif 	/* ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_FWD_DEFINED__ */


/* header files for imported files */
#include "inspectable.h"
#include "AsyncInfo.h"
#include "EventToken.h"
#include "Windows.Foundation.h"
#include "Windows.Phone.PersonalInformation.h"

#ifdef __cplusplus
extern "C"{
#endif 


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0000 */
/* [local] */ 

#ifdef __cplusplus
} /*extern "C"*/ 
#endif
#include <windows.foundation.collections.h>
#ifdef __cplusplus
extern "C" {
#endif


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0000 */
/* [local] */ 



extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0000_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0000_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2248 */




/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2248 */




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2248_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2248_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0001 */
/* [local] */ 

#ifndef DEF___FIIterator_1_HSTRING_USE
#define DEF___FIIterator_1_HSTRING_USE
#if defined(__cplusplus) && !defined(RO_NO_TEMPLATE_NAME)
} /*extern "C"*/ 
namespace ABI { namespace Windows { namespace Foundation { namespace Collections {
template <>
struct __declspec(uuid("8c304ebb-6615-50a4-8829-879ecd443236"))
IIterator<HSTRING> : IIterator_impl<HSTRING> {
static const wchar_t* z_get_rc_name_impl() {
return L"Windows.Foundation.Collections.IIterator`1<String>"; }
};
typedef IIterator<HSTRING> __FIIterator_1_HSTRING_t;
#define ____FIIterator_1_HSTRING_FWD_DEFINED__
#define __FIIterator_1_HSTRING ABI::Windows::Foundation::Collections::__FIIterator_1_HSTRING_t

/* ABI */ } /* Windows */ } /* Foundation */ } /* Collections */ }
extern "C" {
#endif //__cplusplus
#endif /* DEF___FIIterator_1_HSTRING_USE */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0001 */
/* [local] */ 




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0001_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0001_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2249 */




/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2249 */




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2249_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2249_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0002 */
/* [local] */ 

#ifndef DEF___FIIterable_1_HSTRING_USE
#define DEF___FIIterable_1_HSTRING_USE
#if defined(__cplusplus) && !defined(RO_NO_TEMPLATE_NAME)
} /*extern "C"*/ 
namespace ABI { namespace Windows { namespace Foundation { namespace Collections {
template <>
struct __declspec(uuid("e2fcc7c1-3bfc-5a0b-b2b0-72e769d1cb7e"))
IIterable<HSTRING> : IIterable_impl<HSTRING> {
static const wchar_t* z_get_rc_name_impl() {
return L"Windows.Foundation.Collections.IIterable`1<String>"; }
};
typedef IIterable<HSTRING> __FIIterable_1_HSTRING_t;
#define ____FIIterable_1_HSTRING_FWD_DEFINED__
#define __FIIterable_1_HSTRING ABI::Windows::Foundation::Collections::__FIIterable_1_HSTRING_t

/* ABI */ } /* Windows */ } /* Foundation */ } /* Collections */ }
extern "C" {
#endif //__cplusplus
#endif /* DEF___FIIterable_1_HSTRING_USE */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0002 */
/* [local] */ 




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0002_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0002_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2250 */




/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2250 */




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2250_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2250_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0003 */
/* [local] */ 

#ifndef DEF___FIVectorView_1_HSTRING_USE
#define DEF___FIVectorView_1_HSTRING_USE
#if defined(__cplusplus) && !defined(RO_NO_TEMPLATE_NAME)
} /*extern "C"*/ 
namespace ABI { namespace Windows { namespace Foundation { namespace Collections {
template <>
struct __declspec(uuid("2f13c006-a03a-5f69-b090-75a43e33423e"))
IVectorView<HSTRING> : IVectorView_impl<HSTRING> {
static const wchar_t* z_get_rc_name_impl() {
return L"Windows.Foundation.Collections.IVectorView`1<String>"; }
};
typedef IVectorView<HSTRING> __FIVectorView_1_HSTRING_t;
#define ____FIVectorView_1_HSTRING_FWD_DEFINED__
#define __FIVectorView_1_HSTRING ABI::Windows::Foundation::Collections::__FIVectorView_1_HSTRING_t

/* ABI */ } /* Windows */ } /* Foundation */ } /* Collections */ }
extern "C" {
#endif //__cplusplus
#endif /* DEF___FIVectorView_1_HSTRING_USE */

interface IInspectable;


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0003 */
/* [local] */ 





extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0003_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0003_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2251 */




/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2251 */




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2251_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2251_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0004 */
/* [local] */ 

#ifndef DEF___FIKeyValuePair_2_HSTRING_IInspectable_USE
#define DEF___FIKeyValuePair_2_HSTRING_IInspectable_USE
#if defined(__cplusplus) && !defined(RO_NO_TEMPLATE_NAME)
} /*extern "C"*/ 
namespace ABI { namespace Windows { namespace Foundation { namespace Collections {
template <>
struct __declspec(uuid("09335560-6c6b-5a26-9348-97b781132b20"))
IKeyValuePair<HSTRING,IInspectable*> : IKeyValuePair_impl<HSTRING,IInspectable*> {
static const wchar_t* z_get_rc_name_impl() {
return L"Windows.Foundation.Collections.IKeyValuePair`2<String, Object>"; }
};
typedef IKeyValuePair<HSTRING,IInspectable*> __FIKeyValuePair_2_HSTRING_IInspectable_t;
#define ____FIKeyValuePair_2_HSTRING_IInspectable_FWD_DEFINED__
#define __FIKeyValuePair_2_HSTRING_IInspectable ABI::Windows::Foundation::Collections::__FIKeyValuePair_2_HSTRING_IInspectable_t

/* ABI */ } /* Windows */ } /* Foundation */ } /* Collections */ }
extern "C" {
#endif //__cplusplus
#endif /* DEF___FIKeyValuePair_2_HSTRING_IInspectable_USE */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0004 */
/* [local] */ 




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0004_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0004_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2252 */




/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2252 */




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2252_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2252_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0005 */
/* [local] */ 

#ifndef DEF___FIIterator_1___FIKeyValuePair_2_HSTRING_IInspectable_USE
#define DEF___FIIterator_1___FIKeyValuePair_2_HSTRING_IInspectable_USE
#if defined(__cplusplus) && !defined(RO_NO_TEMPLATE_NAME)
} /*extern "C"*/ 
namespace ABI { namespace Windows { namespace Foundation { namespace Collections {
template <>
struct __declspec(uuid("5db5fa32-707c-5849-a06b-91c8eb9d10e8"))
IIterator<__FIKeyValuePair_2_HSTRING_IInspectable*> : IIterator_impl<__FIKeyValuePair_2_HSTRING_IInspectable*> {
static const wchar_t* z_get_rc_name_impl() {
return L"Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IKeyValuePair`2<String, Object>>"; }
};
typedef IIterator<__FIKeyValuePair_2_HSTRING_IInspectable*> __FIIterator_1___FIKeyValuePair_2_HSTRING_IInspectable_t;
#define ____FIIterator_1___FIKeyValuePair_2_HSTRING_IInspectable_FWD_DEFINED__
#define __FIIterator_1___FIKeyValuePair_2_HSTRING_IInspectable ABI::Windows::Foundation::Collections::__FIIterator_1___FIKeyValuePair_2_HSTRING_IInspectable_t

/* ABI */ } /* Windows */ } /* Foundation */ } /* Collections */ }
extern "C" {
#endif //__cplusplus
#endif /* DEF___FIIterator_1___FIKeyValuePair_2_HSTRING_IInspectable_USE */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0005 */
/* [local] */ 




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0005_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0005_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2253 */




/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2253 */




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2253_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2253_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0006 */
/* [local] */ 

#ifndef DEF___FIIterable_1___FIKeyValuePair_2_HSTRING_IInspectable_USE
#define DEF___FIIterable_1___FIKeyValuePair_2_HSTRING_IInspectable_USE
#if defined(__cplusplus) && !defined(RO_NO_TEMPLATE_NAME)
} /*extern "C"*/ 
namespace ABI { namespace Windows { namespace Foundation { namespace Collections {
template <>
struct __declspec(uuid("fe2f3d47-5d47-5499-8374-430c7cda0204"))
IIterable<__FIKeyValuePair_2_HSTRING_IInspectable*> : IIterable_impl<__FIKeyValuePair_2_HSTRING_IInspectable*> {
static const wchar_t* z_get_rc_name_impl() {
return L"Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IKeyValuePair`2<String, Object>>"; }
};
typedef IIterable<__FIKeyValuePair_2_HSTRING_IInspectable*> __FIIterable_1___FIKeyValuePair_2_HSTRING_IInspectable_t;
#define ____FIIterable_1___FIKeyValuePair_2_HSTRING_IInspectable_FWD_DEFINED__
#define __FIIterable_1___FIKeyValuePair_2_HSTRING_IInspectable ABI::Windows::Foundation::Collections::__FIIterable_1___FIKeyValuePair_2_HSTRING_IInspectable_t

/* ABI */ } /* Windows */ } /* Foundation */ } /* Collections */ }
extern "C" {
#endif //__cplusplus
#endif /* DEF___FIIterable_1___FIKeyValuePair_2_HSTRING_IInspectable_USE */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0006 */
/* [local] */ 




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0006_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0006_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2254 */




/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2254 */




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2254_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2254_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0007 */
/* [local] */ 

#ifndef DEF___FIMapView_2_HSTRING_IInspectable_USE
#define DEF___FIMapView_2_HSTRING_IInspectable_USE
#if defined(__cplusplus) && !defined(RO_NO_TEMPLATE_NAME)
} /*extern "C"*/ 
namespace ABI { namespace Windows { namespace Foundation { namespace Collections {
template <>
struct __declspec(uuid("bb78502a-f79d-54fa-92c9-90c5039fdf7e"))
IMapView<HSTRING,IInspectable*> : IMapView_impl<HSTRING,IInspectable*> {
static const wchar_t* z_get_rc_name_impl() {
return L"Windows.Foundation.Collections.IMapView`2<String, Object>"; }
};
typedef IMapView<HSTRING,IInspectable*> __FIMapView_2_HSTRING_IInspectable_t;
#define ____FIMapView_2_HSTRING_IInspectable_FWD_DEFINED__
#define __FIMapView_2_HSTRING_IInspectable ABI::Windows::Foundation::Collections::__FIMapView_2_HSTRING_IInspectable_t

/* ABI */ } /* Windows */ } /* Foundation */ } /* Collections */ }
extern "C" {
#endif //__cplusplus
#endif /* DEF___FIMapView_2_HSTRING_IInspectable_USE */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0007 */
/* [local] */ 




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0007_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0007_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2255 */




/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2255 */




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2255_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2255_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0008 */
/* [local] */ 

#ifndef DEF___FIIterator_1___FIMapView_2_HSTRING_IInspectable_USE
#define DEF___FIIterator_1___FIMapView_2_HSTRING_IInspectable_USE
#if defined(__cplusplus) && !defined(RO_NO_TEMPLATE_NAME)
} /*extern "C"*/ 
namespace ABI { namespace Windows { namespace Foundation { namespace Collections {
template <>
struct __declspec(uuid("53a2e825-9bf1-5083-8a7b-9d94f312dade"))
IIterator<__FIMapView_2_HSTRING_IInspectable*> : IIterator_impl<__FIMapView_2_HSTRING_IInspectable*> {
static const wchar_t* z_get_rc_name_impl() {
return L"Windows.Foundation.Collections.IIterator`1<Windows.Foundation.Collections.IMapView`2<String, Object>>"; }
};
typedef IIterator<__FIMapView_2_HSTRING_IInspectable*> __FIIterator_1___FIMapView_2_HSTRING_IInspectable_t;
#define ____FIIterator_1___FIMapView_2_HSTRING_IInspectable_FWD_DEFINED__
#define __FIIterator_1___FIMapView_2_HSTRING_IInspectable ABI::Windows::Foundation::Collections::__FIIterator_1___FIMapView_2_HSTRING_IInspectable_t

/* ABI */ } /* Windows */ } /* Foundation */ } /* Collections */ }
extern "C" {
#endif //__cplusplus
#endif /* DEF___FIIterator_1___FIMapView_2_HSTRING_IInspectable_USE */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0008 */
/* [local] */ 




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0008_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0008_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2256 */




/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2256 */




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2256_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2256_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0009 */
/* [local] */ 

#ifndef DEF___FIIterable_1___FIMapView_2_HSTRING_IInspectable_USE
#define DEF___FIIterable_1___FIMapView_2_HSTRING_IInspectable_USE
#if defined(__cplusplus) && !defined(RO_NO_TEMPLATE_NAME)
} /*extern "C"*/ 
namespace ABI { namespace Windows { namespace Foundation { namespace Collections {
template <>
struct __declspec(uuid("e1670fae-49cd-5c47-a8c8-f6fa2c650c6c"))
IIterable<__FIMapView_2_HSTRING_IInspectable*> : IIterable_impl<__FIMapView_2_HSTRING_IInspectable*> {
static const wchar_t* z_get_rc_name_impl() {
return L"Windows.Foundation.Collections.IIterable`1<Windows.Foundation.Collections.IMapView`2<String, Object>>"; }
};
typedef IIterable<__FIMapView_2_HSTRING_IInspectable*> __FIIterable_1___FIMapView_2_HSTRING_IInspectable_t;
#define ____FIIterable_1___FIMapView_2_HSTRING_IInspectable_FWD_DEFINED__
#define __FIIterable_1___FIMapView_2_HSTRING_IInspectable ABI::Windows::Foundation::Collections::__FIIterable_1___FIMapView_2_HSTRING_IInspectable_t

/* ABI */ } /* Windows */ } /* Foundation */ } /* Collections */ }
extern "C" {
#endif //__cplusplus
#endif /* DEF___FIIterable_1___FIMapView_2_HSTRING_IInspectable_USE */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0009 */
/* [local] */ 




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0009_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0009_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2257 */




/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2257 */




extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2257_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_2257_v0_0_s_ifspec;

/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0010 */
/* [local] */ 

#ifndef DEF___FIVectorView_1___FIMapView_2_HSTRING_IInspectable_USE
#define DEF___FIVectorView_1___FIMapView_2_HSTRING_IInspectable_USE
#if defined(__cplusplus) && !defined(RO_NO_TEMPLATE_NAME)
} /*extern "C"*/ 
namespace ABI { namespace Windows { namespace Foundation { namespace Collections {
template <>
struct __declspec(uuid("172a655b-b3b8-5eae-bc2e-a6a1f1708b4b"))
IVectorView<__FIMapView_2_HSTRING_IInspectable*> : IVectorView_impl<__FIMapView_2_HSTRING_IInspectable*> {
static const wchar_t* z_get_rc_name_impl() {
return L"Windows.Foundation.Collections.IVectorView`1<Windows.Foundation.Collections.IMapView`2<String, Object>>"; }
};
typedef IVectorView<__FIMapView_2_HSTRING_IInspectable*> __FIVectorView_1___FIMapView_2_HSTRING_IInspectable_t;
#define ____FIVectorView_1___FIMapView_2_HSTRING_IInspectable_FWD_DEFINED__
#define __FIVectorView_1___FIMapView_2_HSTRING_IInspectable ABI::Windows::Foundation::Collections::__FIVectorView_1___FIMapView_2_HSTRING_IInspectable_t

/* ABI */ } /* Windows */ } /* Foundation */ } /* Collections */ }
extern "C" {
#endif //__cplusplus
#endif /* DEF___FIVectorView_1___FIMapView_2_HSTRING_IInspectable_USE */
#if defined(__cplusplus)
}
#endif // defined(__cplusplus)
#include <Windows.Foundation.h>
#if !defined(__windows2Ephone2Epersonalinformation_h__)
#include <Windows.Phone.PersonalInformation.h>
#endif // !defined(__windows2Ephone2Epersonalinformation_h__)
#if !defined(__windows2Estorage2Estreams_h__)
#include <Windows.Storage.Streams.h>
#endif // !defined(__windows2Estorage2Estreams_h__)
#if defined(__cplusplus)
extern "C" {
#endif // defined(__cplusplus)
#if !defined(__cplusplus)
typedef struct __x_ABI_CWindows_CFoundation_CDateTime __x_ABI_CWindows_CFoundation_CDateTime;

#endif

#ifdef __cplusplus
namespace ABI {
namespace Windows {
namespace Phone {
namespace PersonalInformation {
class ContactStore;
} /*PersonalInformation*/
} /*Phone*/
} /*Windows*/
}
#endif





#if !defined(____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_INTERFACE_DEFINED__)
extern const __declspec(selectany) _Null_terminated_ WCHAR InterfaceName_Windows_Phone_PersonalInformation_Provisioning_IContactPartnerProvisioningManagerStatics[] = L"Windows.Phone.PersonalInformation.Provisioning.IContactPartnerProvisioningManagerStatics";
#endif /* !defined(____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_INTERFACE_DEFINED__) */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0010 */
/* [local] */ 


#ifdef __cplusplus

} /* end extern "C" */
namespace ABI {
    namespace Windows {
        namespace Foundation {
            
            typedef struct DateTime DateTime;
            
        } /* end namespace */
    } /* end namespace */
} /* end namespace */

extern "C" { 
#endif









extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0010_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0010_v0_0_s_ifspec;

#ifndef ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_INTERFACE_DEFINED__
#define ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_INTERFACE_DEFINED__

/* interface __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics */
/* [uuid][object] */ 



/* interface ABI::Windows::Phone::PersonalInformation::Provisioning::IContactPartnerProvisioningManagerStatics */
/* [uuid][object] */ 


EXTERN_C const IID IID___x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics;

#if defined(__cplusplus) && !defined(CINTERFACE)
    } /* end extern "C" */
    namespace ABI {
        namespace Windows {
            namespace Phone {
                namespace PersonalInformation {
                    namespace Provisioning {
                        
                        MIDL_INTERFACE("C0D79A21-01AF-4FD3-98CD-B3D656DE15F4")
                        IContactPartnerProvisioningManagerStatics : public IInspectable
                        {
                        public:
                            virtual HRESULT STDMETHODCALLTYPE AssociateNetworkAccountAsync( 
                                /* [in] */ __RPC__in_opt ABI::Windows::Phone::PersonalInformation::IContactStore *store,
                                /* [in] */ __RPC__in HSTRING networkName,
                                /* [in] */ __RPC__in HSTRING networkAccountId,
                                /* [out][retval] */ __RPC__deref_out_opt ABI::Windows::Foundation::IAsyncAction **result) = 0;
                            
                            virtual HRESULT STDMETHODCALLTYPE ImportVcardToSystemAsync( 
                                /* [in] */ __RPC__in_opt ABI::Windows::Storage::Streams::IInputStream *stream,
                                /* [out][retval] */ __RPC__deref_out_opt ABI::Windows::Foundation::IAsyncAction **result) = 0;
                            
                        };

                        extern const __declspec(selectany) IID & IID_IContactPartnerProvisioningManagerStatics = __uuidof(IContactPartnerProvisioningManagerStatics);

                        
                    }  /* end namespace */
                }  /* end namespace */
            }  /* end namespace */
        }  /* end namespace */
    }  /* end namespace */
    extern "C" { 
    
#else 	/* C style interface */

    typedef struct __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStaticsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetIids )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics * This,
            /* [out] */ __RPC__out ULONG *iidCount,
            /* [size_is][size_is][out] */ __RPC__deref_out_ecount_full_opt(*iidCount) IID **iids);
        
        HRESULT ( STDMETHODCALLTYPE *GetRuntimeClassName )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics * This,
            /* [out] */ __RPC__deref_out_opt HSTRING *className);
        
        HRESULT ( STDMETHODCALLTYPE *GetTrustLevel )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics * This,
            /* [out] */ __RPC__out TrustLevel *trustLevel);
        
        HRESULT ( STDMETHODCALLTYPE *AssociateNetworkAccountAsync )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics * This,
            /* [in] */ __RPC__in_opt __x_ABI_CWindows_CPhone_CPersonalInformation_CIContactStore *store,
            /* [in] */ __RPC__in HSTRING networkName,
            /* [in] */ __RPC__in HSTRING networkAccountId,
            /* [out][retval] */ __RPC__deref_out_opt __x_ABI_CWindows_CFoundation_CIAsyncAction **result);
        
        HRESULT ( STDMETHODCALLTYPE *ImportVcardToSystemAsync )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics * This,
            /* [in] */ __RPC__in_opt __x_ABI_CWindows_CStorage_CStreams_CIInputStream *stream,
            /* [out][retval] */ __RPC__deref_out_opt __x_ABI_CWindows_CFoundation_CIAsyncAction **result);
        
        END_INTERFACE
    } __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStaticsVtbl;

    interface __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics
    {
        CONST_VTBL struct __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStaticsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_GetIids(This,iidCount,iids)	\
    ( (This)->lpVtbl -> GetIids(This,iidCount,iids) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_GetRuntimeClassName(This,className)	\
    ( (This)->lpVtbl -> GetRuntimeClassName(This,className) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_GetTrustLevel(This,trustLevel)	\
    ( (This)->lpVtbl -> GetTrustLevel(This,trustLevel) ) 


#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_AssociateNetworkAccountAsync(This,store,networkName,networkAccountId,result)	\
    ( (This)->lpVtbl -> AssociateNetworkAccountAsync(This,store,networkName,networkAccountId,result) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_ImportVcardToSystemAsync(This,stream,result)	\
    ( (This)->lpVtbl -> ImportVcardToSystemAsync(This,stream,result) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0011 */
/* [local] */ 

#if !defined(____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_INTERFACE_DEFINED__)
extern const __declspec(selectany) _Null_terminated_ WCHAR InterfaceName_Windows_Phone_PersonalInformation_Provisioning_IContactPartnerProvisioningManagerStatics2[] = L"Windows.Phone.PersonalInformation.Provisioning.IContactPartnerProvisioningManagerStatics2";
#endif /* !defined(____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_INTERFACE_DEFINED__) */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0011 */
/* [local] */ 



extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0011_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0011_v0_0_s_ifspec;

#ifndef ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_INTERFACE_DEFINED__
#define ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_INTERFACE_DEFINED__

/* interface __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2 */
/* [uuid][object] */ 



/* interface ABI::Windows::Phone::PersonalInformation::Provisioning::IContactPartnerProvisioningManagerStatics2 */
/* [uuid][object] */ 


EXTERN_C const IID IID___x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2;

#if defined(__cplusplus) && !defined(CINTERFACE)
    } /* end extern "C" */
    namespace ABI {
        namespace Windows {
            namespace Phone {
                namespace PersonalInformation {
                    namespace Provisioning {
                        
                        MIDL_INTERFACE("C26155F7-55ED-475D-9334-C5D484C30F1A")
                        IContactPartnerProvisioningManagerStatics2 : public IInspectable
                        {
                        public:
                            virtual HRESULT STDMETHODCALLTYPE AssociateSocialNetworkAccountAsync( 
                                /* [in] */ __RPC__in_opt ABI::Windows::Phone::PersonalInformation::IContactStore *store,
                                /* [in] */ __RPC__in HSTRING networkName,
                                /* [in] */ __RPC__in HSTRING networkAccountId,
                                /* [out][retval] */ __RPC__deref_out_opt ABI::Windows::Foundation::IAsyncAction **result) = 0;
                            
                        };

                        extern const __declspec(selectany) IID & IID_IContactPartnerProvisioningManagerStatics2 = __uuidof(IContactPartnerProvisioningManagerStatics2);

                        
                    }  /* end namespace */
                }  /* end namespace */
            }  /* end namespace */
        }  /* end namespace */
    }  /* end namespace */
    extern "C" { 
    
#else 	/* C style interface */

    typedef struct __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2Vtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2 * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2 * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2 * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetIids )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2 * This,
            /* [out] */ __RPC__out ULONG *iidCount,
            /* [size_is][size_is][out] */ __RPC__deref_out_ecount_full_opt(*iidCount) IID **iids);
        
        HRESULT ( STDMETHODCALLTYPE *GetRuntimeClassName )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2 * This,
            /* [out] */ __RPC__deref_out_opt HSTRING *className);
        
        HRESULT ( STDMETHODCALLTYPE *GetTrustLevel )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2 * This,
            /* [out] */ __RPC__out TrustLevel *trustLevel);
        
        HRESULT ( STDMETHODCALLTYPE *AssociateSocialNetworkAccountAsync )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2 * This,
            /* [in] */ __RPC__in_opt __x_ABI_CWindows_CPhone_CPersonalInformation_CIContactStore *store,
            /* [in] */ __RPC__in HSTRING networkName,
            /* [in] */ __RPC__in HSTRING networkAccountId,
            /* [out][retval] */ __RPC__deref_out_opt __x_ABI_CWindows_CFoundation_CIAsyncAction **result);
        
        END_INTERFACE
    } __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2Vtbl;

    interface __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2
    {
        CONST_VTBL struct __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2Vtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_GetIids(This,iidCount,iids)	\
    ( (This)->lpVtbl -> GetIids(This,iidCount,iids) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_GetRuntimeClassName(This,className)	\
    ( (This)->lpVtbl -> GetRuntimeClassName(This,className) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_GetTrustLevel(This,trustLevel)	\
    ( (This)->lpVtbl -> GetTrustLevel(This,trustLevel) ) 


#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_AssociateSocialNetworkAccountAsync(This,store,networkName,networkAccountId,result)	\
    ( (This)->lpVtbl -> AssociateSocialNetworkAccountAsync(This,store,networkName,networkAccountId,result) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIContactPartnerProvisioningManagerStatics2_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0012 */
/* [local] */ 

#if !defined(____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_INTERFACE_DEFINED__)
extern const __declspec(selectany) _Null_terminated_ WCHAR InterfaceName_Windows_Phone_PersonalInformation_Provisioning_IMessagePartnerProvisioningManagerStatics[] = L"Windows.Phone.PersonalInformation.Provisioning.IMessagePartnerProvisioningManagerStatics";
#endif /* !defined(____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_INTERFACE_DEFINED__) */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0012 */
/* [local] */ 



extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0012_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0012_v0_0_s_ifspec;

#ifndef ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_INTERFACE_DEFINED__
#define ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_INTERFACE_DEFINED__

/* interface __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics */
/* [uuid][object] */ 



/* interface ABI::Windows::Phone::PersonalInformation::Provisioning::IMessagePartnerProvisioningManagerStatics */
/* [uuid][object] */ 


EXTERN_C const IID IID___x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics;

#if defined(__cplusplus) && !defined(CINTERFACE)
    } /* end extern "C" */
    namespace ABI {
        namespace Windows {
            namespace Phone {
                namespace PersonalInformation {
                    namespace Provisioning {
                        
                        MIDL_INTERFACE("8A1B0850-73C5-457C-BC59-ED7D615C05A4")
                        IMessagePartnerProvisioningManagerStatics : public IInspectable
                        {
                        public:
                            virtual HRESULT STDMETHODCALLTYPE ImportSmsToSystemAsync( 
                                /* [in] */ boolean incoming,
                                /* [in] */ boolean read,
                                /* [in] */ __RPC__in HSTRING body,
                                /* [in] */ __RPC__in HSTRING sender,
                                /* [in] */ __RPC__in_opt __FIVectorView_1_HSTRING *recipients,
                                /* [in] */ ABI::Windows::Foundation::DateTime deliveryTime,
                                /* [out][retval] */ __RPC__deref_out_opt ABI::Windows::Foundation::IAsyncAction **action) = 0;
                            
                            virtual HRESULT STDMETHODCALLTYPE ImportMmsToSystemAsync( 
                                /* [in] */ boolean incoming,
                                /* [in] */ boolean read,
                                /* [in] */ __RPC__in HSTRING subject,
                                /* [in] */ __RPC__in HSTRING sender,
                                /* [in] */ __RPC__in_opt __FIVectorView_1_HSTRING *recipients,
                                /* [in] */ ABI::Windows::Foundation::DateTime deliveryTime,
                                /* [in] */ __RPC__in_opt __FIVectorView_1___FIMapView_2_HSTRING_IInspectable *attachments,
                                /* [out][retval] */ __RPC__deref_out_opt ABI::Windows::Foundation::IAsyncAction **action) = 0;
                            
                        };

                        extern const __declspec(selectany) IID & IID_IMessagePartnerProvisioningManagerStatics = __uuidof(IMessagePartnerProvisioningManagerStatics);

                        
                    }  /* end namespace */
                }  /* end namespace */
            }  /* end namespace */
        }  /* end namespace */
    }  /* end namespace */
    extern "C" { 
    
#else 	/* C style interface */

    typedef struct __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStaticsVtbl
    {
        BEGIN_INTERFACE
        
        HRESULT ( STDMETHODCALLTYPE *QueryInterface )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics * This,
            /* [in] */ __RPC__in REFIID riid,
            /* [annotation][iid_is][out] */ 
            _COM_Outptr_  void **ppvObject);
        
        ULONG ( STDMETHODCALLTYPE *AddRef )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics * This);
        
        ULONG ( STDMETHODCALLTYPE *Release )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics * This);
        
        HRESULT ( STDMETHODCALLTYPE *GetIids )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics * This,
            /* [out] */ __RPC__out ULONG *iidCount,
            /* [size_is][size_is][out] */ __RPC__deref_out_ecount_full_opt(*iidCount) IID **iids);
        
        HRESULT ( STDMETHODCALLTYPE *GetRuntimeClassName )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics * This,
            /* [out] */ __RPC__deref_out_opt HSTRING *className);
        
        HRESULT ( STDMETHODCALLTYPE *GetTrustLevel )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics * This,
            /* [out] */ __RPC__out TrustLevel *trustLevel);
        
        HRESULT ( STDMETHODCALLTYPE *ImportSmsToSystemAsync )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics * This,
            /* [in] */ boolean incoming,
            /* [in] */ boolean read,
            /* [in] */ __RPC__in HSTRING body,
            /* [in] */ __RPC__in HSTRING sender,
            /* [in] */ __RPC__in_opt __FIVectorView_1_HSTRING *recipients,
            /* [in] */ __x_ABI_CWindows_CFoundation_CDateTime deliveryTime,
            /* [out][retval] */ __RPC__deref_out_opt __x_ABI_CWindows_CFoundation_CIAsyncAction **action);
        
        HRESULT ( STDMETHODCALLTYPE *ImportMmsToSystemAsync )( 
            __RPC__in __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics * This,
            /* [in] */ boolean incoming,
            /* [in] */ boolean read,
            /* [in] */ __RPC__in HSTRING subject,
            /* [in] */ __RPC__in HSTRING sender,
            /* [in] */ __RPC__in_opt __FIVectorView_1_HSTRING *recipients,
            /* [in] */ __x_ABI_CWindows_CFoundation_CDateTime deliveryTime,
            /* [in] */ __RPC__in_opt __FIVectorView_1___FIMapView_2_HSTRING_IInspectable *attachments,
            /* [out][retval] */ __RPC__deref_out_opt __x_ABI_CWindows_CFoundation_CIAsyncAction **action);
        
        END_INTERFACE
    } __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStaticsVtbl;

    interface __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics
    {
        CONST_VTBL struct __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStaticsVtbl *lpVtbl;
    };

    

#ifdef COBJMACROS


#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_QueryInterface(This,riid,ppvObject)	\
    ( (This)->lpVtbl -> QueryInterface(This,riid,ppvObject) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_AddRef(This)	\
    ( (This)->lpVtbl -> AddRef(This) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_Release(This)	\
    ( (This)->lpVtbl -> Release(This) ) 


#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_GetIids(This,iidCount,iids)	\
    ( (This)->lpVtbl -> GetIids(This,iidCount,iids) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_GetRuntimeClassName(This,className)	\
    ( (This)->lpVtbl -> GetRuntimeClassName(This,className) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_GetTrustLevel(This,trustLevel)	\
    ( (This)->lpVtbl -> GetTrustLevel(This,trustLevel) ) 


#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_ImportSmsToSystemAsync(This,incoming,read,body,sender,recipients,deliveryTime,action)	\
    ( (This)->lpVtbl -> ImportSmsToSystemAsync(This,incoming,read,body,sender,recipients,deliveryTime,action) ) 

#define __x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_ImportMmsToSystemAsync(This,incoming,read,subject,sender,recipients,deliveryTime,attachments,action)	\
    ( (This)->lpVtbl -> ImportMmsToSystemAsync(This,incoming,read,subject,sender,recipients,deliveryTime,attachments,action) ) 

#endif /* COBJMACROS */


#endif 	/* C style interface */




#endif 	/* ____x_ABI_CWindows_CPhone_CPersonalInformation_CProvisioning_CIMessagePartnerProvisioningManagerStatics_INTERFACE_DEFINED__ */


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0013 */
/* [local] */ 

#ifndef RUNTIMECLASS_Windows_Phone_PersonalInformation_Provisioning_ContactPartnerProvisioningManager_DEFINED
#define RUNTIMECLASS_Windows_Phone_PersonalInformation_Provisioning_ContactPartnerProvisioningManager_DEFINED
extern const __declspec(selectany) _Null_terminated_ WCHAR RuntimeClass_Windows_Phone_PersonalInformation_Provisioning_ContactPartnerProvisioningManager[] = L"Windows.Phone.PersonalInformation.Provisioning.ContactPartnerProvisioningManager";
#endif
#ifndef RUNTIMECLASS_Windows_Phone_PersonalInformation_Provisioning_MessagePartnerProvisioningManager_DEFINED
#define RUNTIMECLASS_Windows_Phone_PersonalInformation_Provisioning_MessagePartnerProvisioningManager_DEFINED
extern const __declspec(selectany) _Null_terminated_ WCHAR RuntimeClass_Windows_Phone_PersonalInformation_Provisioning_MessagePartnerProvisioningManager[] = L"Windows.Phone.PersonalInformation.Provisioning.MessagePartnerProvisioningManager";
#endif


/* interface __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0013 */
/* [local] */ 



extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0013_v0_0_c_ifspec;
extern RPC_IF_HANDLE __MIDL_itf_windows2Ephone2Epersonalinformation2Eprovisioning_0000_0013_v0_0_s_ifspec;

/* Additional Prototypes for ALL interfaces */

unsigned long             __RPC_USER  HSTRING_UserSize(     __RPC__in unsigned long *, unsigned long            , __RPC__in HSTRING * ); 
unsigned char * __RPC_USER  HSTRING_UserMarshal(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in HSTRING * ); 
unsigned char * __RPC_USER  HSTRING_UserUnmarshal(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out HSTRING * ); 
void                      __RPC_USER  HSTRING_UserFree(     __RPC__in unsigned long *, __RPC__in HSTRING * ); 

unsigned long             __RPC_USER  HSTRING_UserSize64(     __RPC__in unsigned long *, unsigned long            , __RPC__in HSTRING * ); 
unsigned char * __RPC_USER  HSTRING_UserMarshal64(  __RPC__in unsigned long *, __RPC__inout_xcount(0) unsigned char *, __RPC__in HSTRING * ); 
unsigned char * __RPC_USER  HSTRING_UserUnmarshal64(__RPC__in unsigned long *, __RPC__in_xcount(0) unsigned char *, __RPC__out HSTRING * ); 
void                      __RPC_USER  HSTRING_UserFree64(     __RPC__in unsigned long *, __RPC__in HSTRING * ); 

/* end of Additional Prototypes */

#ifdef __cplusplus
}
#endif

#endif


