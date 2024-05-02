//---------------------------------------------------------------------------
// Microsoft Test Automation Sources
//
// Copyright 2005 Microsoft Corporation. All Rights Reserved.
//
// COMTracing.h
//
// Collection: WDTF
// 
// Environment: User mode
//
// Primary Contact: WDTF Support (WDTFSupp@microsoft.com)
//
// History:
//   [Date]        -   [Status]
//   Jul 11 2005   -   Reviewed
//---------------------------------------------------------------------------
#pragma once


#ifndef ASSERT
#define ASSERT _ASSERTE
#endif


#include "Tracing.h"

#include "atlcom.h"
#include "atlcoll.h"


// This implements ITracing for any ATL COM object.
//
// Set pszTraceLevelPath via your (class's constructor's initializer list) to 
// point to where you have your TraceLevel value stored ie: HKCR\<pszTraceLevelPath>\. 
//
// However, if you have your TraceLevel value in the HKCR\CLSID\<*pCLSID>\ key,
// you may leave pszTraceLevelPath as NULL. This is not optimal, because having 
// the user find that key is hard.
template<const CLSID * pCLSID, class T, const IID* piid = &__uuidof(T)>
class IDispatchImplWithTracing :
    public IDispatchImpl<T, piid>
{
public:
    IDispatchImplWithTracing(PCWSTR pszTraceLevelPath = NULL) :
        m_pTracer(NULL),
        m_TraceLevelPath(pszTraceLevelPath)
    {
        HRESULT hr = CoCreateInstance(__uuidof(Tracer),
                                      NULL,
                                      CLSCTX_INPROC_SERVER,
                                      __uuidof(ITracer),
                                      (void**)&m_pTracer);
        if(FAILED(hr))
        {
            ASSERT(!"Tracer object could not be created");
            return;
        }

        // Set the global TLS slot.
        // The Tracer is a singleton and should return only one
        // TLS slot per-process
        hr = m_pTracer->GetTlsSlot(&__g_tracingTlsSlot);

        if(FAILED(hr))
        {
            ASSERT(!"TLS Slot could not be retrieved from Tracer Singleton");
            return;
        }

        SetTraceLevel(Trace_Default);
    }
    ~IDispatchImplWithTracing()
    {
        if(m_pTracer != NULL)
        {
            m_pTracer->Release();
            m_pTracer = NULL;
        }
    }

    STDMETHOD(SetTraceLevel)(TTraceLevel Level)
    {
        HRESULT hr = S_OK;

        if(m_pTracer != NULL)
        {
            DWORD dwBits = 0;
            
            if(m_TraceLevelPath != NULL)
            {
                hr = m_pTracer->GetBitsForLevel(m_TraceLevelPath, Level, &dwBits);
            }
            else
            {
                hr = m_pTracer->GetBits(*pCLSID, Level, &dwBits);
            }
            if(hr == S_OK)
            {
                m_TracingSettings.SetBits(dwBits);
            }
        }
        return S_OK;
    }

//
// Tracing Settings
//
protected:
    CTracingSettings m_TracingSettings;

//
// Properties
//
private:
    ITracer* m_pTracer;

    CComBSTR m_TraceLevelPath;
};

