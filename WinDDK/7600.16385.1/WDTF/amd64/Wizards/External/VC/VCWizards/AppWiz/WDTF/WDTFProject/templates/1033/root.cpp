[!if DLL_APP]
// [!output PROJECT_NAME].cpp : Implementation of DLL Exports.
[!else]
// [!output PROJECT_NAME].cpp : Implementation of WinMain
[!endif]

[!if SUPPORT_COMPLUS]
//
// Note: COM+ 1.0 Information:
//      Please remember to run Microsoft Transaction Explorer to install the component(s).
//      Registration is not done by default. 
[!endif]

#include "stdafx.h"
#include "resource.h"
[!if !ATTRIBUTED]
#include "[!output SAFE_IDL_NAME].h"
[!endif]
[!if SUPPORT_COMPONENT_REGISTRAR]
#include "compreg.h"
[!endif]
[!if MERGE_PROXY_STUB]
#include "dlldatax.h"
[!endif]

[!if SUPPORT_TRACING]
// Include product of pre-processing Tracing Macros used in this file
#include "[!output PROJECT_NAME].tmh"

[!endif]
[!if ATTRIBUTED]
[!if DLL_APP]

// The module attribute causes DllMain, DllRegisterServer and DllUnregisterServer to be automatically implemented for you
[ module(dll, uuid = "{[!output LIBID_REGISTRY_FORMAT]}", 
         name = "[!output SAFE_PROJECT_IDENTIFIER_NAME]", 
         helpstring = "[!output PROJECT_NAME] 1.0 Type Library",
         resource_name = "IDR_[!output UPPER_CASE_SAFE_PROJECT_IDENTIFIER_NAME]"[!if SUPPORT_COMPONENT_REGISTRAR], 
         custom = { "a817e7a1-43fa-11d0-9e44-00aa00b6770a", "{[!output COMPREG_REGISTRY_FORMAT]}"}[!endif]) ]
class [!output SAFE_ATL_MODULE_NAME]
{
public:
// Override CAtlDllModuleT members
};

[!endif]
[!if EXE_APP]

// The module attribute causes WinMain to be automatically implemented for you
[ module(exe, uuid = "{[!output LIBID_REGISTRY_FORMAT]}", 
         name = "[!output SAFE_PROJECT_IDENTIFIER_NAME]", 
         helpstring = "[!output PROJECT_NAME] 1.0 Type Library",
         resource_name = "IDR_[!output UPPER_CASE_SAFE_PROJECT_IDENTIFIER_NAME]") ]
class [!output SAFE_ATL_MODULE_NAME]
{
public:
// Override CAtlExeModuleT members
};
         
[!endif]
[!if SERVICE_APP]

// The module attribute causes WinMain to be automatically implemented for you
[ module(SERVICE, uuid = "{[!output LIBID_REGISTRY_FORMAT]}", 
         name = "[!output SAFE_PROJECT_IDENTIFIER_NAME]", 
         helpstring = "[!output PROJECT_NAME] 1.0 Type Library", 
         resource_name="IDS_SERVICENAME") ]
class [!output SAFE_ATL_MODULE_NAME]
{
public:
    HRESULT InitializeSecurity() throw()
    {
        // TODO : Call CoInitializeSecurity and provide the appropriate security settings for 
        // your service
        // Suggested - PKT Level Authentication, 
        // Impersonation Level of RPC_C_IMP_LEVEL_IDENTIFY 
        // and an appropiate Non NULL Security Descriptor.

        return S_OK;
    }
};

[!endif]
[!else]
[!if DLL_APP]

class [!output SAFE_ATL_MODULE_NAME] : public CAtlDllModuleT< [!output SAFE_ATL_MODULE_NAME] >
[!endif]
[!if EXE_APP]

class [!output SAFE_ATL_MODULE_NAME] : public CAtlExeModuleT< [!output SAFE_ATL_MODULE_NAME] >
[!endif]
[!if SERVICE_APP]
#include <stdio.h>

class [!output SAFE_ATL_MODULE_NAME] : public CAtlServiceModuleT< [!output SAFE_ATL_MODULE_NAME], IDS_SERVICENAME >
[!endif]
{
public :
    DECLARE_LIBID(LIBID_[!output LIB_NAME]Lib)
    DECLARE_REGISTRY_APPID_RESOURCEID(IDR_[!output UPPER_CASE_SAFE_PROJECT_IDENTIFIER_NAME], "{[!output APPID_REGISTRY_FORMAT]}")
[!if SERVICE_APP]
    HRESULT InitializeSecurity() throw()
    {
        // TODO : Call CoInitializeSecurity and provide the appropriate security settings for 
        // your service
        // Suggested - PKT Level Authentication, 
        // Impersonation Level of RPC_C_IMP_LEVEL_IDENTIFY 
        // and an appropiate Non NULL Security Descriptor.

        return S_OK;
    }
[!endif]    
};

[!if SUPPORT_TRACING]
DECLARE_TRACING_TLS;

[!endif]
[!output SAFE_ATL_MODULE_NAME] _AtlModule;

[!if DLL_APP]
[!if SUPPORT_MFC]
class [!output SAFE_MFC_APP_NAME] : public CWinApp
{
public:

// Overrides
    virtual BOOL InitInstance();
    virtual int ExitInstance();

    DECLARE_MESSAGE_MAP()
};

BEGIN_MESSAGE_MAP([!output SAFE_MFC_APP_NAME], CWinApp)
END_MESSAGE_MAP()

[!output SAFE_MFC_APP_NAME] theApp;

BOOL [!output SAFE_MFC_APP_NAME]::InitInstance()
{
[!if SUPPORT_TRACING]
    WPP_INIT_TRACING(L"WDTF.[!output PROJECT_NAME]");

[!endif]
[!if MERGE_PROXY_STUB]
#ifdef _MERGE_PROXYSTUB
    if (!PrxDllMain(m_hInstance, DLL_PROCESS_ATTACH, NULL))
        return FALSE;
#endif
[!endif]
    return CWinApp::InitInstance();
}

int [!output SAFE_MFC_APP_NAME]::ExitInstance()
{
[!if SUPPORT_TRACING]
    WPP_CLEANUP();
[!endif]
    return CWinApp::ExitInstance();
}
[!else]

#ifdef _MANAGED
#pragma managed(push, off)
#endif

// DLL Entry Point
extern "C" BOOL WINAPI DllMain(HINSTANCE hInstance, DWORD dwReason, LPVOID lpReserved)
{
    hInstance;

    switch (dwReason)
    {
    case DLL_PROCESS_ATTACH:
[!if SUPPORT_TRACING]
        WPP_INIT_TRACING(L"WDTF.[!output PROJECT_NAME]");
[!endif]
        break;
    case DLL_PROCESS_DETACH:
[!if SUPPORT_TRACING]
        WPP_CLEANUP();
[!endif]
        break;
    }

[!if MERGE_PROXY_STUB]
#ifdef _MERGE_PROXYSTUB
    if (!PrxDllMain(hInstance, dwReason, lpReserved))
        return FALSE;
#endif
[!endif]
    hInstance;
    return _AtlModule.DllMain(dwReason, lpReserved); 
}

#ifdef _MANAGED
#pragma managed(pop)
#endif


[!endif]


// Used to determine whether the DLL can be unloaded by OLE
STDAPI DllCanUnloadNow(void)
{
[!if MERGE_PROXY_STUB]
#ifdef _MERGE_PROXYSTUB
    HRESULT hr = PrxDllCanUnloadNow();
    if (hr != S_OK)
        return hr;
#endif
[!endif]
[!if SUPPORT_MFC]
    AFX_MANAGE_STATE(AfxGetStaticModuleState());
    return (AfxDllCanUnloadNow()==S_OK && _AtlModule.GetLockCount()==0) ? S_OK : S_FALSE;
[!else]
    return _AtlModule.DllCanUnloadNow();
[!endif]
}


// Returns a class factory to create an object of the requested type
STDAPI DllGetClassObject(REFCLSID rclsid, REFIID riid, LPVOID* ppv)
{
[!if MERGE_PROXY_STUB]
#ifdef _MERGE_PROXYSTUB
    if (PrxDllGetClassObject(rclsid, riid, ppv) == S_OK)
        return S_OK;
#endif
[!endif]
    return _AtlModule.DllGetClassObject(rclsid, riid, ppv);
}


// DllRegisterServer - Adds entries to the system registry
STDAPI DllRegisterServer(void)
{
    // registers object, typelib and all interfaces in typelib
    HRESULT hr = _AtlModule.DllRegisterServer();
[!if MERGE_PROXY_STUB]
#ifdef _MERGE_PROXYSTUB
    if (FAILED(hr))
        return hr;
    hr = PrxDllRegisterServer();
#endif
[!endif]
    return hr;
}


// DllUnregisterServer - Removes entries from the system registry
STDAPI DllUnregisterServer(void)
{
    HRESULT hr = _AtlModule.DllUnregisterServer();
[!if MERGE_PROXY_STUB]
#ifdef _MERGE_PROXYSTUB
    if (FAILED(hr))
        return hr;
    hr = PrxDllRegisterServer();
    if (FAILED(hr))
        return hr;
    hr = PrxDllUnregisterServer();
#endif
[!endif]
    return hr;
}
[!endif]

[!if EXE_APP]

//
extern "C" int WINAPI _tWinMain(HINSTANCE /*hInstance*/, HINSTANCE /*hPrevInstance*/, 
                                LPTSTR /*lpCmdLine*/, int nShowCmd)
{
[!if SUPPORT_TRACING]
    WPP_INIT_TRACING(L"WDTF.[!output PROJECT_NAME]");

[!endif]
    int retVal = _AtlModule.WinMain(nShowCmd);

[!if SUPPORT_TRACING]
    WPP_CLEANUP();

[!endif]
    return retVal;
}

[!endif]
[!if SERVICE_APP]

//
extern "C" int WINAPI _tWinMain(HINSTANCE /*hInstance*/, HINSTANCE /*hPrevInstance*/, 
                                LPTSTR /*lpCmdLine*/, int nShowCmd)
{
[!if SUPPORT_TRACING]
    WPP_INIT_TRACING(L"WDTF.[!output PROJECT_NAME]");

[!endif]
    int retVal = _AtlModule.WinMain(nShowCmd);

[!if SUPPORT_TRACING]
    WPP_CLEANUP();

[!endif]
    return retVal;
}

[!endif]
[!endif]