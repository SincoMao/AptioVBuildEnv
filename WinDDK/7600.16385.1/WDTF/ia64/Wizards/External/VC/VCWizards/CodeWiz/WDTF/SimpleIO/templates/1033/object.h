// [!output HEADER_FILE] : Declaration of the [!output CLASS_NAME]

#pragma once
#include "resource.h"       // main symbols


[!if !ATTRIBUTED]
#include "[!output SAFE_IDL_NAME].h"
[!endif]

[!if THREADING_SINGLE || THREADING_APARTMENT || THREADING_BOTH]

#if defined(_WIN32_WCE) && !defined(_CE_DCOM) && !defined(_CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA)
#error "Single-threaded COM objects are not properly supported on Windows CE platform, such as the Windows Mobile platforms that do not include full DCOM support. Define _CE_ALLOW_SINGLE_THREADED_OBJECTS_IN_MTA to force ATL to support creating single-thread COM object's and allow use of it's single-threaded COM object implementations. The threading model in your rgs file was set to 'Free' as that is the only threading model supported in non DCOM Windows CE platforms."
#endif
[!endif]
[!if THREADING_NEUTRAL]
#ifdef _WIN32_WCE
#error "Neutral-threaded COM objects are not supported on Windows CE."
#endif
[!endif]


// [!output CLASS_NAME]

[!if ATTRIBUTED]
[
    coclass,
    default([!output INTERFACE_NAME]),
[!if THREADING_SINGLE]
    threading(single),
[!endif]
[!if THREADING_APARTMENT]
    threading(apartment),
[!endif]
[!if THREADING_BOTH]
    threading(both),
[!endif]
[!if THREADING_FREE]
    threading(free),
[!endif]
[!if THREADING_NEUTRAL]
    threading(neutral),
[!endif]
[!if SUPPORT_ERROR_INFO]
    support_error_info("[!output INTERFACE_NAME]"),
[!endif]
[!if CONNECTION_POINTS]
    event_source(com),
[!endif]
[!if AGGREGATION_NO]
    aggregatable(never),
[!endif]
[!if AGGREGATION_ONLY]
    aggregatable(always),
[!endif]
    vi_progid("WDTF.[!output VERSION_INDEPENDENT_PROGID]"),
    progid("WDTF.[!output PROGID]"),
    version(1.0),
    uuid("[!output CLSID_REGISTRY_FORMAT]"),
    helpstring("[!output TYPE_NAME]")
]
[!endif]
class ATL_NO_VTABLE [!output CLASS_NAME] :
[!if ATTRIBUTED]
[!if OBJECT_WITH_SITE]
    public IObjectWithSiteImpl<[!output CLASS_NAME]>,
[!endif]
    public [!output INTERFACE_NAME]
[!else]
[!if THREADING_SINGLE]
    public CComObjectRootEx<CComSingleThreadModel>,
[!endif]
[!if THREADING_APARTMENT]
    public CComObjectRootEx<CComSingleThreadModel>,
[!endif]
[!if THREADING_FREE]
    public CComObjectRootEx<CComMultiThreadModel>,
[!endif]
[!if THREADING_BOTH]
    public CComObjectRootEx<CComMultiThreadModel>,
[!endif]
[!if THREADING_NEUTRAL]
    public CComObjectRootEx<CComMultiThreadModel>,
[!endif]
    public CComCoClass<[!output CLASS_NAME], &CLSID_[!output COCLASS]>,
[!if SUPPORT_ERROR_INFO]
    public ISupportErrorInfoImpl<&__uuidof([!output INTERFACE_NAME])>,
[!endif]
[!if OBJECT_WITH_SITE]
    public IObjectWithSiteImpl<[!output CLASS_NAME]>,
[!endif]
[!if TRACING]
    public IDispatchImplWithTracing<&CLSID_[!output COCLASS], [!output INTERFACE_NAME]>
[!else]
    public IDispatchImpl<[!output INTERFACE_NAME], &__uuidof([!output INTERFACE_NAME])>
[!endif]
[!endif]
{
public:
    [!output CLASS_NAME]() :
        IDispatchImplWithTracing(L"WDTFActions.1\\Device\\SimpleIO\\[!output COCLASS]")
    {
        bOpened = false;
[!if FREE_THREADED_MARSHALER]
        m_pUnkMarshaler = NULL;
[!endif]
    }
    ~[!output CLASS_NAME]()
    {
[!if FREE_THREADED_MARSHALER]
        m_pUnkMarshaler = NULL;
[!endif]
    }
    HRESULT FinalConstruct();
    void FinalRelease();

[!if !ATTRIBUTED]
    DECLARE_REGISTRY_RESOURCEID([!output RGS_ID])
[!endif]

[!if AGGREGATION_NO]
    DECLARE_NOT_AGGREGATABLE([!output CLASS_NAME])
[!endif]

    BEGIN_COM_MAP([!output CLASS_NAME])
        COM_INTERFACE_ENTRY(IDispatch)
        COM_INTERFACE_ENTRY(ISupportErrorInfo)
        COM_INTERFACE_ENTRY(IAction)
        COM_INTERFACE_ENTRY(ISimpleIO_Action)
        COM_INTERFACE_ENTRY([!output INTERFACE_NAME])
[!if FREE_THREADED_MARSHALER]
        COM_INTERFACE_ENTRY_AGGREGATE(IID_IMarshal, m_pUnkMarshaler.p)
[!endif]
    END_COM_MAP()

    DECLARE_PROTECT_FINAL_CONSTRUCT()
[!if FREE_THREADED_MARSHALER]
    DECLARE_GET_CONTROLLING_UNKNOWN()

    CComPtr<IUnknown> m_pUnkMarshaler;
[!endif]


//
// Constants
//
private:


//
// Internal Utility Methods
//
private:


//
// IAction Methods
//
public:
[!if !TRACING]
    STDMETHOD(SetTraceLevel)(TTraceLevel TraceLevel)
    {
        // You chose not to use tracing, this means it could be harder to debug your code.
        // Don't return a failure, because users don't expect it to fail.
        return S_OK;
    }
[!endif]
    STDMETHOD(SetTarget)(ITarget* pMainTarget, VARIANT MoreTargets);

//
// ISimpleIO_Action Methods
//
public:
    STDMETHOD(Open)();
    STDMETHOD(Close)();
    STDMETHOD(RunIO)();

//
// Members
//
private:
    CComPtr<ITarget> m_pTarget;  // Hold a reference to the target of this implementation

    CComVariant m_SymbolicLink;  // The symbolic link for the device

    bool bOpened;                // Is the SimpleIO currently open?
};

[!if !ATTRIBUTED]
OBJECT_ENTRY_AUTO(__uuidof([!output COCLASS]), [!output CLASS_NAME])
[!endif]
