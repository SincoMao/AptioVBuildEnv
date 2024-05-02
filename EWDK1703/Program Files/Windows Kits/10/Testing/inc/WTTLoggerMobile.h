//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
//
// Use of this sample source code is subject to the terms of the Microsoft
// license agreement under which you licensed this sample source code. If
// you did not accept the terms of the license agreement, you are not
// authorized to use this sample source code. For the terms of the license,
// please see the license agreement between you and Microsoft or, if applicable,
// see the LICENSE.RTF on your install media or the root of your tools installation.
// THE SAMPLE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
//
#pragma once

#include <windows.h>
#include "wttlogdef.h"
//#include "errorblob.h"

/// <topic name="WTTLoggerMobile" displayname="WTTLoggerMobile Test Logging Tool">
/// <summary>
/// Implementation of WTT logging for Windows Mobile testing.
/// </summary>
/// </topic>

/// <topic_scope tref="WTTLoggerMobile">

/// <topic name="WTTLoggerInitMacros" displayname="Initialization Macros">
/// <summary>
/// Macros that prepare the binary for WTT Logging.
/// </summary>
/// </topic>

#ifdef __cplusplus

#define WTT_LVL_USER_SKIP L"Skip"
#define WTT_LVL_USER_ABORT L"Abort"
#define WTT_LVL_USER_ERRORBLOB L"ErrorBlob"
#define WTT_LVL_USER_ABORTBLOB L"AbortBlob"
#define WTT_LVL_USER_SKIPBLOB L"SkipBlob"
#define WTT_LVL_USER_INFOBLOB L"InfoBlob"
#define WTT_DEFAULT_TRACE_LVLS_TUX L"Msg|Error|Warn|Assert|InvalidParam|Machine|TCM|Break|Bug|StartTest|EndTest|PFRollup|TraceAlways|Skip|Abort|ErrorBlob|AbortBlob|SkipBlob|InfoBlob" 

/// <summary>
///     The WTTLogger interface provides support for logging with the WTT
///     logging engine while still maintaining compatibility with the legacy
///     Tux and Kato architecture.
///     For in-depth documentation for Trace methods, see WTTLog documentation 
///     on MSDN.
/// </summary>
class WTTLoggerWithKato
{
public:
    /// <summary>
    ///     If SetKatoLogger is called with a valid CKato pointer or an HKATO handle,
    ///     the WTTLoggerWithKato will pass on certain Trace messages to the Kato object,
    ///     retaining the benefits of Kato's immediate logging. 
    /// </summary>
    /// <param name="pKato">Pointer to a CKato object or an HKATO Kato handle.</param>
    /// <remarks>
    ///     Tux-based tests *shouldn't* call this (Tux handles this for the test).
    ///
    ///     Calls to Kato will be synchronous (as if the caller called Kato directly)
    ///     and messages sent to Kato will be modified to include error information if
    ///     applicable.
    /// </remarks>
    virtual void SetKatoLogger
        (
        _In_ void * pKato
        ) = 0;

    /// <summary>
    ///     GetKatoLogger will return the CKato object associated with the logger
    ///     or NULL if there is no CKato object associated.
    /// </summary>
    /// <param name="ppKato">
    ///     Pointer that will receive the Kato object associated with this logger.
    /// </param>
    /// <remarks>
    ///     Tux-based tests *shouldn't* call this (Tux handles this for the test).
    /// </remarks>
    virtual void GetKatoLogger
        (
        _Out_ void ** ppKato
        ) = 0;

    //
    //  The following are the methods for C/C++ interfaces
    //

    virtual HRESULT CreateLogDevice
        (
        _In_ LPWSTR pwszLogDeviceName
        ) = 0;

    virtual HRESULT WrapLogDevice
        (
        _In_ LONG hDevice
        ) = 0;
        
    virtual HRESULT CloseLogDevice
        (
        ) = 0;

    virtual HRESULT Trace
        (
        _In_   DWORD   dwLevel,
        ...
        ) = 0;

    virtual HRESULT TraceV
        (
        _In_   DWORD   dwLevel,
        _In_   va_list VarArgs
        ) = 0;
        
    virtual HRESULT TraceEx
        (
        _In_  DWORD  dwLevel,
        _In_  DWORD  dwPriority,
        _In_  LPWSTR pwszUserXML,
        ...
        ) = 0;

    virtual HRESULT TraceExV
        (
        _In_   DWORD   dwLevel,
        _In_   DWORD   dwPriority,
        _In_   LPWSTR  pwszUserXML,
        _In_   va_list VarArgs
        ) = 0;
        
    virtual HRESULT TraceMsg
        (
        _In_   LPWSTR  pwszUserDefinedLevel,        
        _In_   DWORD   dwPriority,
        ...
        ) = 0;
    
    virtual HRESULT TraceMsgV
        (
        _In_   LPWSTR  pwszUserDefinedLevel,        
        _In_   DWORD   dwPriority,
        _In_   va_list VarArgs
        ) = 0;
    
    virtual HRESULT TraceMachineInfo
        (
        _In_   LPWSTR  pwszUserData
        ) = 0;
    
    virtual HRESULT UserDefinedTrace
        (
        _In_  LPCWSTR pcwszUserLevel,
        _In_  DWORD   dwBaseLevel,
        _In_  DWORD   dwPriority,
        ...
        ) = 0;

    virtual HRESULT UserDefinedTraceV
        (
        _In_  LPCWSTR pcwszUserLevel,
        _In_  DWORD   dwBaseLevel,
        _In_  DWORD   dwPriority,
        _In_  va_list VarArgs
        ) = 0;
        
    virtual HRESULT UserDefinedTraceEx
        (
        _In_  LPCWSTR pcwszUserLevel,
        _In_  DWORD   dwBaseLevel,
        _In_  DWORD   dwPriority,
        _In_  LPWSTR  pwszUserXML,
        ...
        ) = 0;

    virtual HRESULT UserDefinedTraceExV
        (
        _In_  LPCWSTR pcwszUserLevel,
        _In_  DWORD   dwBaseLevel,
        _In_  DWORD   dwPriority,
        _In_  LPWSTR  pwszUserXML,
        _In_  va_list VarArgs
        ) = 0;


    virtual HRESULT StartTest
        (
        _In_   LPWSTR   pwszTestName // Name of the test case
        ) = 0;

    virtual HRESULT EndTest
        (
        _In_   LPWSTR   pwszTestName, // Name of the test case
        _In_   DWORD    dwResult,     // test result
        _In_   LPWSTR   pwszRepro    // repro line
        ) = 0;

    virtual HRESULT Assert
        (
        _In_  BOOL   fCondition,
        _In_  LPWSTR pwszFile,
        _In_  UINT   uiLine,
        _In_  LPWSTR pwszAssertMsg
        ) = 0;

    //
    //  Check result
    //
    virtual HRESULT CheckResult
        (
        _In_  DWORD        dwResultToCheck,  // a 32-bit result to be checked
        _In_  DWORD        dwResultType,     // the type of the result NTStatus\HRESULT\Win32\BOOL
        _In_  LPWSTR       pwszFile,         // filename
        _In_  ULONG        ulLine,           // line number
        _In_  LPWSTR       pwszErrMsg       // Addtional User supplied error message
        ) = 0;

    virtual HRESULT CheckResultEx
        (
        _In_  DWORD        dwResultToCheck,
        _In_  DWORD        dwResultType,
        _In_  DWORD        dwTargetResult,
        _In_  DWORD        dwTargetResultType,
        _In_  LPWSTR       pwszFile,
        _In_  ULONG        ulLine,
        _In_  LPWSTR       pwszErrMsg
        ) = 0;

    virtual HRESULT SetDeviceOption
        (   
        _In_  LPWSTR pwszDeviceName,
        _In_  LPWSTR pwszDeviceOptions
        ) = 0;

    //
    //  Add / Remove expected errors
    //

    virtual HRESULT AddErrorToErrorList
        (
        _In_  DWORD   dwErrorToAdd,           // a 32-bit result to be added
        _In_  DWORD   dwErrorType,            // the type of the result
        _In_  DWORD   dwErrorList             // The error list to add
        ) = 0;

    virtual HRESULT RemoveErrorFromErrorList
        (
        _In_  DWORD   dwErrorToRemove,        // a 32-bit error to be removed
        _In_  DWORD   dwErrorType,            // the type of the error
        _In_  DWORD   dwErrorList             // The error list to clear
        ) = 0;

    virtual HRESULT ClearErrorList
        (
        _In_  DWORD   dwErrorList,            // The error list to clear
        _In_  DWORD   dwErrorType             // the type of the error
        ) = 0;
    
    //
    //  Set context
    //

    virtual HRESULT SetContext
        (
        _In_  LPWSTR pwszCurrentContext,
        _In_  LPWSTR pwszParentContext
        ) = 0;
        
    virtual HRESULT ClearContext
        (
        _In_  LPWSTR pwszCurrentContext,
        _In_  LPWSTR pwszParentContext
        ) = 0;

    //---------------------------------------------------------------------------
    // Name: StartTestEx
    //
    // Generate a start test trace
    //
    // Arguments:
    //  pwszTUID           [_In_ ][LPWSTR] -- test GUID or ID
    //  pwszTestName       [_In_ ][LPWSTR] -- test name of the test
    //  dwTestType         [_In_ ][DWORD]  -- test case type
    //  pwszParentTUID     [_In_ ][LPWSTR] -- test GUID
    //  pwszParentTestName [_In_ ][LPWSTR] -- test name of the parent test
    //
    // Returns:
    //  HRESULT
    //
    //---------------------------------------------------------------------------

    virtual HRESULT    StartTestEx
        (
        _In_  LPWSTR  pwszTUID,
        _In_  LPWSTR  pwszTestName,
        _In_  DWORD   dwTestType,
        _In_  LPWSTR  pwszParentTUID,
        _In_  LPWSTR  pwszParentTestName
        ) = 0;
        
    //---------------------------------------------------------------------------
    // Name: EndTestEx
    //
    // Generate an end test trace
    //
    // Arguments:
    //  dwResult           [_In_ ][DWORD]  -- test result
    //  pwszTUID           [_In_ ][LPWSTR] -- test GUID or ID
    //  pwszTestName       [_In_ ][LPWSTR] -- test name of the test
    //  pwszParentTUID     [_In_ ][LPWSTR] -- test GUID
    //  pwszParentTestName [_In_ ][LPWSTR] -- test name of the parent test
    //
    // Returns:
    //  HRESULT
    //
    //---------------------------------------------------------------------------

    virtual HRESULT EndTestEx
        (
        _In_  DWORD  dwResult,
        _In_  LPWSTR pwszTUID,
        _In_  LPWSTR pwszTestName,
        _In_  LPWSTR pwszParentTUID,
        _In_  LPWSTR pwszParentTestName
        ) = 0;
        
    //---------------------------------------------------------------------------
    // Name: StartTestWithResID
    //
    // Generate a start test trace with resource ID
    //
    // Arguments:
    //  uiResID            [_In_ ][UINT]   -- resource ID
    //
    // Returns:
    //  HRESULT
    //
    //---------------------------------------------------------------------------

    virtual HRESULT    StartTestWithResID
        (
        _In_   UINT    uiResID
        ) = 0;
        
    //---------------------------------------------------------------------------
    // Name: EndTestWithResID
    //
    // Generate an end test trace with Resource ID
    //
    // Arguments:
    //  uiResID            [_In_ ][UINT]   -- resource ID
    //  dwResult           [_In_ ][DWORD]  -- test result
    //  pwszRepro          [_In_ ][LPWSTR] -- repro line
    //
    // Returns:
    //  HRESULT
    //
    //---------------------------------------------------------------------------

    virtual HRESULT EndTestWithResID
        (
        _In_  UINT   uiResID,
        _In_  DWORD  dwResult,
        _In_  LPWSTR pwszRepro
        ) = 0;

    //---------------------------------------------------------------------------
    // Name: EnableTraceLevels
    //
    // Enable a set of trace levels
    //
    // Arguments:
    //  pwszTraceLevels    [_In_ ][LPWSTR] -- trace levels
    //
    // Returns:
    //  HRESULT
    //
    //---------------------------------------------------------------------------

    virtual HRESULT EnableTraceLevels
        (
        _In_  LPWSTR pwszTraceLevels
        ) = 0;
    
    //---------------------------------------------------------------------------
    // Name: DisableTraceLevels
    //
    // Enable a set of trace levels
    //
    // Arguments:
    //  pwszTraceLevels    [_In_ ][LPWSTR] -- trace levels
    //
    // Returns:
    //  HRESULT
    //
    //---------------------------------------------------------------------------

    virtual HRESULT DisableTraceLevels
        (
        _In_  LPWSTR pwszTraceLevels
        ) = 0;
    
    //---------------------------------------------------------------------------
    // Name: SetDeviceTraceLevel
    //
    // Set the trace levels of a device topology
    //
    // Arguments:
    //  dwTraceLvl    [_In_ ][DWORD] -- trace levels
    //
    // Returns:
    //  HRESULT
    //
    //---------------------------------------------------------------------------

    virtual HRESULT SetDeviceTraceLevel
        (
        _In_  DWORD  dwTraceLvl
        ) = 0;
    
    //---------------------------------------------------------------------------
    // Name: CWTTLogger::SetDeviceTracePriority
    //
    // Set the trace priority of a device topology
    //
    // Arguments:
    //  dwTracePri    [_In_ ][DWORD] -- trace priority
    //
    // Returns:
    //  HRESULT
    //
    //---------------------------------------------------------------------------

    virtual HRESULT SetDeviceTracePriority
        (
        _In_  DWORD  dwTracePri
        ) = 0;

    //---------------------------------------------------------------------------
    // Name: GetPFRollupStats
    //
    // Get the current pass/fail statistics
    //
    // Arguments:
    //  pWTTPFStats [_In_ ][PWTTLOGROLLUPINFO] -- PF statitics
    //
    // Returns:
    //  HRESULT
    //
    //---------------------------------------------------------------------------

    virtual HRESULT GetPFRollupStats
        (
        _In_  PWTTLOGROLLUPINFO pWTTPFStats
        ) = 0;

};  // WTTLoggerWithKato

extern WTTLoggerWithKato * g_pWTTLogger;

// Items useful for dynamically loading the WTTLoggerMobile APIs
typedef HRESULT (WINAPI * PFNWTTLogMobileCreateDefault)(LPCWSTR, WTTLoggerWithKato **);
typedef HRESULT (WINAPI * PFNWTTLogMobileCleanupDefault)();
#ifdef UNDER_CE
// GetProcAddress takes wchar on CE
const WCHAR szWTTLogMobileCreateDefault[] = L"WTTLogMobileCreateDefault";
const WCHAR szWTTLogMobileCleanupDefault[] = L"WTTLogMobileCleanupDefault";
#else // ! UNDER_CE
// GetProcAddress on NT always takes a char string instead of a wchar string
const char szWTTLogMobileCreateDefault[] = "WTTLogMobileCreateDefault";
const char szWTTLogMobileCleanupDefault[] = "WTTLogMobileCleanupDefault";
#endif

extern "C" HRESULT WINAPI WTTLogMobileWrap(
    LONG hDevice,
    WTTLoggerWithKato ** ppLogger);

extern "C" HRESULT WINAPI WTTLogMobileCreate(
    LPCWSTR wszLogDeviceName,
    WTTLoggerWithKato ** ppLogger);

extern "C" HRESULT WINAPI WTTLogMobileCreateDefault(
    LPCWSTR wszLogDeviceName,
    WTTLoggerWithKato ** ppLogger);

extern "C" HRESULT WINAPI WTTLogMobileCleanupDefault();

#endif // cplusplus

/// </topic_scope> //WTTLoggerMobile