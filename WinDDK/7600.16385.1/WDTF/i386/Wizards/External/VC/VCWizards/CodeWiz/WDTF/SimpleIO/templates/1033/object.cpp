// [!output IMPL_FILE] : Implementation of [!output CLASS_NAME]

#include "stdafx.h"

#include "[!output HEADER_FILE]"

[!if TRACING]
// Include product of pre-processing Tracing Macros used in this implementation
#include "[!output TRACE_MACRO_HEADER]"
[!endif]


//---------------------------------------------------------------------------
// Initialize this instance of [!output CLASS_NAME]
//
// Remarks:
//   This method is called by ATL once when an instance of this coclass is 
// created. This is analagous to a constructor, except that a failure HRESULT
// can be returned if you are unable to initialize for some reason.
//---------------------------------------------------------------------------
HRESULT
[!output CLASS_NAME]::FinalConstruct()
{
[!if TRACING]
    TraceMethodEntry(WDTF, "void");
[!endif]

[!if FREE_THREADED_MARSHALER]
    [!output METHOD_RETURN]CoCreateFreeThreadedMarshaler(
        GetControllingUnknown(), &m_pUnkMarshaler.p));

[!else]
    [!output METHOD_RETURN]S_OK);
[!endif]
}

//---------------------------------------------------------------------------
// Uninitialize this instance of [!output CLASS_NAME]
//
// Remarks:
//   This method is called by ATL once when the final consumer of this coclass
// has called Release(). This is analagous to a destructor, you must not fail
// this operation.
//---------------------------------------------------------------------------
void
[!output CLASS_NAME]::FinalRelease()
{
[!if TRACING]
    TraceMethodEntry(WDTF, "void");
[!endif]

[!if FREE_THREADED_MARSHALER]
    m_pUnkMarshaler.Release();

[!endif]
[!if TRACING]
    MethodReturnVoid(WDTF);
[!endif]
}



//
// [!output CLASS_NAME] Internal Utility Methods
//

// TODO: Add any helper methods needed here.


//
// IAction Method
//

//---------------------------------------------------------------------------
// Attach to an ITarget in preparation for testing.
//
// Remarks:
//   This method is called once by WDTF itself in order to ask this object to 
// be ready to act on the pMainTarget in the way specified by the WDTF interface
// being implemented.
//   For ISimpleIO_Action, this means that WDTF is asking this object to be
// ready to act on the pMainTarget when Open(), RunIO(), and Close() are called
// by the user.
//   As part of this request, this method should return a failing HRESULT if
// this object does not support the provided pMainTarget.
//
// Note:
//   The MoreTargets parameter should be ignored in this version of WDTF.
//---------------------------------------------------------------------------
STDMETHODIMP [!output CLASS_NAME]::SetTarget(ITarget* pMainTarget, VARIANT MoreTargets)
{
[!if TRACING]
    TraceCOMEntry(WDTF, "pMainTarget = %p, MoreTargets = %!VARIANT!", pMainTarget, MoreTargets);
[!endif]

    if(pMainTarget == NULL)
    {
        [!output COM_RETURN]E_POINTER);
    }
    // m_pTarget is a CComPtr which performs automatic refcounting.
    m_pTarget = pMainTarget;


    //
    // Save off the SymbolicLink, it is often helpful for opening the device
    //
    HRESULT hr = m_pTarget->GetValue(CComBSTR(L"SymbolicLink"), &m_SymbolicLink);
    if(FAILED(hr) || m_SymbolicLink.vt != VT_BSTR)
    {
        [!output COM_RETURN]hr);
    }

    //
    // TODO: Perform your checks to see if your implementation is compatible with the target
    //

    // This completely fake example will only function when the SymbolicLink starts with 's' :)
    if(m_SymbolicLink.bstrVal[0] != L's')
    {
        [!output COM_RETURN]E_FAIL);
    }

    [!output COM_RETURN]S_OK);
}



//
// ISimpleIO_Action Methods
//

//---------------------------------------------------------------------------
// Open the ITarget for testing with this ISimpleIO_Action.
//
// Remarks:
//   This method should attempt to open the ITarget for testing, if it is
// unable to do so, return a failing HRESULT. You should do what makes sense 
// for your ITarget type. Perhaps this means you should open a handle to 
// it with CreateFile(). Perhaps it means that you initialize a context structure
// so that you can keep track of an ongoing test case. 
// In the event of an error please provide an actionable description for it.
//
// Note:
//   This method should fail if the SimpleIO is already open.
//---------------------------------------------------------------------------
STDMETHODIMP [!output CLASS_NAME]::Open()
{
[!if TRACING]
    TraceCOMEntry(WDTF, "void");
[!endif]

    // Check if already open
    if(bOpened)
    {
        [!output REPORT_ERROR]Already Open."[!output REPORT_ERROR_MID]);
    }

    //
    // TODO: Open the ITarget for testing
    /*
    if(m_hDevice == INVALID_HANDLE_VALUE)
    {
[!if TRACING]
        COMReportError(WDTF, HRESULT_FROM_WIN32(GetLastError()), "Opening File!");
[!else]
        return AtlReportError(GetObjectCLSID(), L"Error Opening File!", GUID_NULL, HRESULT_FROM_WIN32(GetLastError()));
[!endif]
    }
    */
    
    bOpened = true;
    [!output COM_RETURN]S_OK);
}

//---------------------------------------------------------------------------
// Close the ITarget in this ISimpleIO_Action.
//
// Remarks:
//   This method should close your previously opened test context. Please clear
// your context even if you must report a failing HRESULT. There are only a few 
// (if any) cases where an error on close actually makes sense.
// You should revert whatever operation you performed in Open(). Perhaps this 
// means you should close your previously opened handle with CloseHandle().
// In the event of an error please provide an actionable description for it.
//
// Note:
//   This method should fail if the ISimpleIO_Action is already closed or has
// never been opened.
//---------------------------------------------------------------------------
STDMETHODIMP [!output CLASS_NAME]::Close()
{
[!if TRACING]
    TraceCOMEntry(WDTF, "void");
[!endif]

    // Check if already closed
    if(!bOpened)
    {
        [!output REPORT_ERROR]Already Closed."[!output REPORT_ERROR_MID]);
    }
    bOpened = false;

    // 
    // TODO: Close your connection to your ITarget.
    //


    [!output COM_RETURN]S_OK);
}


//---------------------------------------------------------------------------
// Perform a simple input and/or output operation on the target, then verify
// that the operation(s) completed correctly.
//
// Remarks:
// In the event of an error please provide an actionable description for it.
//
// Note:
//   This method should fail if the ISimpleIO_Action is currently closed.
//---------------------------------------------------------------------------
STDMETHODIMP [!output CLASS_NAME]::RunIO()
{
[!if TRACING]
    TraceCOMEntry(WDTF, "void");
[!endif]

    if(!bOpened)
    {
        [!output REPORT_ERROR]Not Yet Opened."[!output REPORT_ERROR_MID]);
    }
    
    //
    // TODO: Run small part of test, verify result. Use COMReportError() to error out.
    //
    /*
    if(fail)
    {
        [!output REPORT_ERROR]SimpleTest failed for x Reason"[!output REPORT_ERROR_MID]);
    }
    */

    // No errors reported, returning
    [!output COM_RETURN]S_OK);
}
