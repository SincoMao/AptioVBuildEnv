//---------------------------------------------------------------------------
// Microsoft Test Automation Sources
//
// Copyright 2005 Microsoft Corporation. All Rights Reserved.
//
// Tracing.h
//
// Collection: WDTF
// 
// Environment: User mode
//
// Primary Contact: WDTF Support (WDTFSupp@microsoft.com)
//
// History:
//   [Date]        -   [Status]
//   Jul 11 2005   -   Unreviewed
//   Nov 01 2005   -   Travis Martin: Refactored TLS slots to be allocated in the Tracer
//---------------------------------------------------------------------------
#pragma once

// NT headers
#include <windows.h>
#include <oleauto.h>

#include <oaidl.h>           // VARIANT
#include "WppDefs.h"


typedef LONG NTSTATUS;


#pragma warning(disable:4239)
#pragma warning(disable:4127)


//---------------------------------------------------------------------------
// Class representing per-object tracing settings
//---------------------------------------------------------------------------
class CTracingSettings
{
public:
    CTracingSettings()
        : m_enabledBits(0)
    {}

    CTracingSettings(DWORD mask)
        : m_enabledBits(mask)
    {}

    ~CTracingSettings()
    {}

    __forceinline void EnableBits(DWORD bits)
    {
        m_enabledBits |= bits;
    }

    __forceinline void DisableBits(DWORD bits)
    {
        m_enabledBits &= ~bits;
    }

    __forceinline void SetBits(DWORD bits)
    {
        m_enabledBits = bits;
    }

    __forceinline bool IsEnabled(DWORD level) const volatile
    {
        return (m_enabledBits & level) != 0;
    }

private:
    DWORD m_enabledBits;
};


//---------------------------------------------------------------------------
// Stores a pointer to current tracing context
//---------------------------------------------------------------------------
extern DWORD __g_tracingTlsSlot;

//---------------------------------------------------------------------------
// Used for trace messages indentation
//---------------------------------------------------------------------------
const char __indentSpacer[] =
"                                                                                "
"                                                                                "
"                                                                                "
"                                                                                "
"                                                                                "
"                                                                                ";

//---------------------------------------------------------------------------
// To be used only within non-WDTF EXE init routines or by the Tracer.
//---------------------------------------------------------------------------
inline BOOL TracingTlsInitialize()
{
    if (__g_tracingTlsSlot == TLS_OUT_OF_INDEXES)
    {
        __g_tracingTlsSlot = TlsAlloc();
        if (__g_tracingTlsSlot == TLS_OUT_OF_INDEXES)
        {
            // Return error: cannot allocate TLS slot
            return FALSE;
        }
    }
    return TRUE;
}

//---------------------------------------------------------------------------
// To be used only within non-WDTF EXE exit routines or by the Tracer.
//---------------------------------------------------------------------------
inline void TracingTlsFree()
{
    if (__g_tracingTlsSlot != TLS_OUT_OF_INDEXES)
    {
        TlsFree(__g_tracingTlsSlot);
        __g_tracingTlsSlot = TLS_OUT_OF_INDEXES;
    }
}


namespace TracingInternal
{
    
//---------------------------------------------------------------------------
// Used for storing current tracing settings
//---------------------------------------------------------------------------
struct TracingContext
{
    ULONG CallDepth;                                    // Current depth of internal calls
    const volatile CTracingSettings* pTracingSettings;  // Currently enabled tracing levels
};

//---------------------------------------------------------------------------
// Auto-incrementing and decrementing variable
//---------------------------------------------------------------------------
class AutoStackDepth
{
public:
    __forceinline AutoStackDepth(ULONG *pCallDepth)
        : m_pCallDepth(pCallDepth)
    {
        ASSERT(m_pCallDepth);
        if (m_pCallDepth)
        {
            ++*m_pCallDepth;
        }
    }

    __forceinline ~AutoStackDepth()
    {
        if (m_pCallDepth)
        {
            --*m_pCallDepth;
        }
    }

private:
    AutoStackDepth(AutoStackDepth& rh);
    const AutoStackDepth& operator =(AutoStackDepth& rh);

private:
    ULONG* m_pCallDepth;
};

//---------------------------------------------------------------------------
// Sets new value to a variable but saves old value and restores it on
// destrutcion
//---------------------------------------------------------------------------
template <class ValueType>
class AutoRestoredValue
{
public:
    __forceinline AutoRestoredValue(ValueType* pVar, ValueType newVal)
        : m_pVar(pVar)
        , m_oldVal()
    {
        ASSERT(m_pVar);
        if (m_pVar)
        {
            m_oldVal = *m_pVar;
            *m_pVar = newVal;
        }
    }

    __forceinline ~AutoRestoredValue()
    {
        if (m_pVar)
        {
            *m_pVar = m_oldVal;
        }
    }

private:
    AutoRestoredValue(AutoRestoredValue& rh);
    const AutoRestoredValue& operator =(AutoRestoredValue& rh);

private:
    ValueType* m_pVar;
    ValueType m_oldVal;
};

//---------------------------------------------------------------------------
// Auto-pointer stored in TLS
//---------------------------------------------------------------------------
template <class Pointee, bool autoDelete>
class AutoTlsPtr
{
public:
    __forceinline AutoTlsPtr()
        : m_dwSlotIndex(TLS_OUT_OF_INDEXES)
    {
    }

    __forceinline AutoTlsPtr(Pointee* pCtx, DWORD dwSlotIndex)
        : m_dwSlotIndex(dwSlotIndex)
    {
        TlsSetValue(m_dwSlotIndex, pCtx);
    }

    __forceinline ~AutoTlsPtr()
    {
        if (m_dwSlotIndex != TLS_OUT_OF_INDEXES)
        {
            LPVOID pCtx = TlsGetValue(m_dwSlotIndex);
            if (pCtx)
            {
                if (autoDelete)
                {
                    delete static_cast<Pointee*>(pCtx);
                }
                TlsSetValue(m_dwSlotIndex, NULL);
            }
        }
    }

    // Copy-ctor and assignment operator transfer ownership to the destination
    __forceinline AutoTlsPtr(AutoTlsPtr& other)
        : m_dwSlotIndex(other.m_dwSlotIndex)
    {
        other.m_dwSlotIndex = TLS_OUT_OF_INDEXES;
    }

    __forceinline const AutoTlsPtr& operator =(AutoTlsPtr& other)
    {
        if (this != &other)
        {
            m_dwSlotIndex = other.m_dwSlotIndex;
            other.m_dwSlotIndex = TLS_OUT_OF_INDEXES;
        }
        return *this;
    }

private:
    DWORD m_dwSlotIndex;
};

}; // namespace TracingInternal

//---------------------------------------------------------------------------
// This macro declares global variable that will store TLS index for
// tracing context pointer.
//---------------------------------------------------------------------------
#define DECLARE_TRACING_TLS    DWORD __g_tracingTlsSlot = TLS_OUT_OF_INDEXES;


#pragma warning(disable:4239)    

//---------------------------------------------------------------------------
// This macro should be used at entry point for a WDTF object that has its
// own tracing settings (WDTF COM component or internal object).
// It reads pointer to Tracing context structure stored in the TLS.
// If the slot contains NULL pointer a new TracingContext is created and 
// auto-deleted on function exit. An object is created that increments
// CallDepth and auto-decrements it on function exit. pTracingSetting is set
// to the specified value and auto-restored to the previous value on exit.
// TODO: check result of TLS reads and writes (not like to happen if the 
// allocation was successful)
//---------------------------------------------------------------------------
#define OVERRIDE_TRACING_SETTINGS(pSettings) \
    TracingInternal::TracingContext* __pCtx = \
        (TracingInternal::TracingContext*)TlsGetValue(__g_tracingTlsSlot); \
    TracingInternal::AutoTlsPtr<TracingInternal::TracingContext, false> __autoTlsPtr; \
    TracingInternal::TracingContext __ctx; \
    if (!__pCtx) \
    { \
        __pCtx = &__ctx; \
        __pCtx->CallDepth = 0; \
        __pCtx->pTracingSettings = NULL; \
        __autoTlsPtr = TracingInternal::AutoTlsPtr<TracingInternal::TracingContext, false> \
            (__pCtx, __g_tracingTlsSlot); \
    } \
    TracingInternal::AutoStackDepth __autoStackDepth(&__pCtx->CallDepth); \
    TracingInternal::AutoRestoredValue<const volatile CTracingSettings*> \
        __autoSettingsPtr(&__pCtx->pTracingSettings, pSettings); \
    ASSERT(__pCtx->pTracingSettings);

//---------------------------------------------------------------------------
// This macro should be used at entry point of any internal function or
// method of an object that does not have its own tracing settings.
// It reads from the pointer to Tracing context structure stored in the TLS.
// If the slot contains a NULL pointer a new TracingContext is created and 
// auto-deleted on function exit. An object is created that increments
// CallDepth and auto-decrements it on function exit.
//---------------------------------------------------------------------------
#define USE_DEFAULT_TRACING_SETTINGS \
    TracingInternal::TracingContext* __pCtx = \
        (TracingInternal::TracingContext*)TlsGetValue(__g_tracingTlsSlot); \
    TracingInternal::AutoTlsPtr<TracingInternal::TracingContext, false> __autoTlsPtr; \
    TracingInternal::TracingContext __ctx; \
    volatile CTracingSettings __settings; \
    if (!__pCtx) \
    { \
        __pCtx = &__ctx; \
        __pCtx->CallDepth = 0; \
        __pCtx->pTracingSettings = &__settings; \
        __autoTlsPtr = TracingInternal::AutoTlsPtr<TracingInternal::TracingContext, false> \
            (__pCtx, __g_tracingTlsSlot); \
    } \
    TracingInternal::AutoStackDepth __autoStackDepth(&__pCtx->CallDepth); \
    ASSERT(__pCtx->pTracingSettings);

    
    
//---------------------------------------------------------------------------
// VARIANT-related stuff
//---------------------------------------------------------------------------
#define WPP_LOGVARIANT(Variant)   \
    WPP_LOGPAIR(2,(&Variant.vt)) \
    WPP_LOGPAIR(4,(unsigned long*)ulong2lvalue(LengthOF(Variant))) \
    WPP_LOGPAIR((LengthOF(Variant)),(AddressOF(Variant)))

struct ulong2lvalue
{
    unsigned long value;
    explicit ulong2lvalue(unsigned long l) : value(l) {}
    operator unsigned long*() {return &value;}
};

__forceinline unsigned long LengthOF(const VARIANT& variant)
{
    if (variant.vt & VT_ARRAY)
    {    
        return 0;
    }
    else
    {
        switch(variant.vt)
        {
        case VT_EMPTY:
                return 0;
        case VT_EMPTY | VT_BYREF:
            return 0;
        case VT_UI1:
            return sizeof(variant.bVal); 
        case VT_UI1 | VT_BYREF:
            return sizeof(variant.pbVal); 
        case VT_UI2:
            return sizeof(variant.uiVal); 
        case VT_UI2 | VT_BYREF:
            return sizeof(variant.puiVal);
        case VT_UI4:
            return sizeof(variant.ulVal);
        case VT_UI4 | VT_BYREF:
            return sizeof(variant.pulVal);
        case VT_UI8:
            return sizeof(variant.ullVal);
        case VT_UI8 | VT_BYREF:
            return sizeof(variant.pullVal);
        case VT_UINT:
            return sizeof(variant.uintVal);
        case VT_UINT | VT_BYREF:
            return sizeof(variant.puintVal);
        case VT_INT:
            return sizeof(variant.intVal);
        case VT_INT | VT_BYREF:
            return sizeof(variant.pintVal);
        case VT_I1:
            return sizeof(variant.cVal);
        case VT_I1 | VT_BYREF:
            return sizeof(variant.pcVal);
        case VT_I2:
            return sizeof(variant.iVal);
        case VT_I2 | VT_BYREF:
            return sizeof(variant.piVal);
        case VT_I4:
            return sizeof(variant.lVal);
        case VT_I4 | VT_BYREF:
            return sizeof(variant.plVal);
        case VT_I8:
            return sizeof(variant.llVal);
        case VT_I8 | VT_BYREF:
            return sizeof(variant.pllVal);
        case VT_R4:
            return sizeof(variant.fltVal);
        case VT_R4 | VT_BYREF:
            return sizeof(variant.pfltVal);
        case VT_R8:
            return sizeof(variant.dblVal);
        case VT_R8 | VT_BYREF:
            return sizeof(variant.pdblVal);
        case VT_CY:
            return sizeof(variant.cyVal);
        case VT_CY | VT_BYREF:
            return sizeof(variant.pcyVal);
        case VT_BSTR:
            return SysStringByteLen(variant.bstrVal);
        case VT_BSTR | VT_BYREF:
            return sizeof(variant.pbstrVal);
        case VT_DECIMAL:
            return sizeof(variant.decVal);
        case VT_DECIMAL | VT_BYREF:
            return sizeof(variant.pdecVal);
        case VT_NULL:
            return 0;
        case VT_NULL | VT_BYREF:
            return 0;
        case VT_ERROR:
            return sizeof(variant.scode);
        case VT_ERROR | VT_BYREF:
            return sizeof(variant.pscode);
        case VT_BOOL:
            return sizeof(variant.boolVal);
        case VT_BOOL | VT_BYREF:
            return sizeof(variant.pboolVal);
        case VT_DATE:
            return sizeof(variant.date);
        case VT_DATE | VT_BYREF:
            return sizeof(variant.pdate);
        case VT_DISPATCH:
            return sizeof(variant.pdispVal);
        case VT_DISPATCH | VT_BYREF:
            return sizeof(variant.ppdispVal);
        case VT_VARIANT:
            return 0;
        case VT_VARIANT | VT_BYREF:
            return sizeof(variant.pvarVal);
        case VT_UNKNOWN:
            return sizeof(variant.punkVal);
        case VT_UNKNOWN | VT_BYREF:
            return sizeof(variant.ppunkVal);
        default:
            return 0;
        }
    }
}

__forceinline const char* AddressOF(const VARIANT& variant)
{
       if (variant.vt & VT_ARRAY)
    {    
        return (const char*)&variant;
    }
    else
    {
        switch(variant.vt)
        {
        case VT_EMPTY:
            return (const char*)&variant;
        case VT_EMPTY | VT_BYREF:
            return (const char*)&variant;
        case VT_UI1:
            return (const char*)&(variant.bVal); 
        case VT_UI1 | VT_BYREF:
            return (const char*)&(variant.pbVal); 
        case VT_UI2:
            return (const char*)&(variant.uiVal); 
        case VT_UI2 | VT_BYREF:
            return (const char*)&(variant.puiVal);
        case VT_UI4:
            return (const char*)&(variant.ulVal);
        case VT_UI4 | VT_BYREF:
            return (const char*)&(variant.pulVal);
        case VT_UI8:
            return (const char*)&(variant.ullVal);
        case VT_UI8 | VT_BYREF:
            return (const char*)&(variant.pullVal);
        case VT_UINT:
            return (const char*)&(variant.uintVal);
        case VT_UINT | VT_BYREF:
            return (const char*)&(variant.puintVal);
        case VT_INT:
            return (const char*)&(variant.intVal);
        case VT_INT | VT_BYREF:
            return (const char*)&(variant.pintVal);
        case VT_I1:
            return (const char*)&(variant.cVal);
        case VT_I1 | VT_BYREF:
            return (const char*)&(variant.pcVal);
        case VT_I2:
            return (const char*)&(variant.iVal);
        case VT_I2 | VT_BYREF:
            return (const char*)&(variant.piVal);
        case VT_I4:
            return (const char*)&(variant.lVal);
        case VT_I4 | VT_BYREF:
            return (const char*)&(variant.plVal);
        case VT_I8:
            return (const char*)&(variant.llVal);
        case VT_I8 | VT_BYREF:
            return (const char*)&(variant.pllVal);
        case VT_R4:
            return (const char*)&(variant.fltVal);
        case VT_R4 | VT_BYREF:
            return (const char*)&(variant.pfltVal);
        case VT_R8:
            return (const char*)&(variant.dblVal);
        case VT_R8 | VT_BYREF:
            return (const char*)&(variant.pdblVal);
        case VT_CY:
            return (const char*)&(variant.cyVal);
        case VT_CY | VT_BYREF:
            return (const char*)&(variant.pcyVal);
        case VT_BSTR:
            return (const char*)variant.bstrVal;
        case VT_BSTR | VT_BYREF:
            return (const char*)&(variant.pbstrVal);
        case VT_DECIMAL:
            return (const char*)&(variant.decVal);
        case VT_DECIMAL | VT_BYREF:
            return (const char*)&(variant.pdecVal);
        case VT_NULL:
            return (const char*)&variant;
        case VT_NULL | VT_BYREF:
            return (const char*)&variant;
        case VT_ERROR:
            return (const char*)&(variant.scode);
        case VT_ERROR | VT_BYREF:
            return (const char*)&(variant.pscode);
        case VT_BOOL:
            return (const char*)&(variant.boolVal);
        case VT_BOOL | VT_BYREF:
            return (const char*)&(variant.pboolVal);
        case VT_DATE:
            return (const char*)&(variant.date);
        case VT_DATE | VT_BYREF:
            return (const char*)&(variant.pdate);
        case VT_DISPATCH:
            return (const char*)&(variant.pdispVal);
        case VT_DISPATCH | VT_BYREF:
            return (const char*)&(variant.ppdispVal);
        case VT_VARIANT:
            return (const char*)&variant;
        case VT_VARIANT | VT_BYREF:
            return (const char*)&(variant.pvarVal);
        case VT_UNKNOWN:
            return (const char*)&(variant.punkVal);
        case VT_UNKNOWN | VT_BYREF:
            return (const char*)&(variant.ppunkVal);
        default:
            return (const char*)&variant;
        }
    }
}

