//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
//
// Use of this source code is subject to the terms of the Microsoft
// premium shared source license agreement under which you licensed
// this source code. If you did not accept the terms of the license
// agreement, you are not authorized to use this source code.
// For the terms of the license, please see the license agreement
// signed by you and Microsoft.
// THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
//

#ifndef __STRESSUTILS_H__
#define __STRESSUTILS_H__

#include <StressLogDefs.h>


#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/* The current Mesh API version. The byte packing is such that 0x0100=1.0, 0x0201=2.01, etc */
#ifndef MESH_API_VER
    #define MESH_API_VER    (0x0100L)
#endif

// @doc STRESSUTILS SAMPLESTRESSDLL


// TODO: Doc
#define LOGZONE(space, zone)    MAKELONG(zone, space)

#define STRESS_MODULE_TERMINATE_EVENT   _T("StressModuleTerminateEvent")

#ifdef UNDER_CE
#define STRESSAPI
#else
#define STRESSAPI __cdecl
#endif


// Use a consistant locale for formatting.
#define LCID_LOGGING 0x0409


// Pass/Fail results

// @enum CESTRESS return value | Return values
enum
{
    CESTRESS_PASS = 0,      // @emem Your module's test iteration was successful.
    CESTRESS_FAIL,          // @emem The target of your testing has failed in an unexpected manner.
    CESTRESS_WARN1,         // @emem Used to indicate a problem that is most likely external to the target of your testing, but whose cause is unknown.
                            // For example, your test has lost connection to the server which returned an ambiguous error code.
    CESTRESS_WARN2,         // @emem Used to indicate a minor failure in your module, usually due to temporary, expected external circumstances.
                            // For example, your module connect connect to a server component because the server has reported that it has exceeded
                            // it's connection limit.  Or your module cannot access a resource (e.g. a file) with exclusive access rights as it is owned by another process.
    CESTRESS_ABORT,         // @emem Returning CESTRESS_ABORT will cause the harness to attempt to unload you module.
                            // Normal shutdown procedures will be followed.
    CESTRESS_COMPLETE,      // @emem Returning CESTRESS_COMPLETE is used to tell the harness
                            // that your module is done performing its test. Primarily, this
                            // will be used by checkpoint modules which test a basic feature
                            // of the device and do not need to have DoStressIteration called
                            // repeatedly for a pre-defined period of time. Basically, this
                            // is the "positive" counterpart of the CESTRESS_ABORT value.
    CESTRESS_LAST = CESTRESS_COMPLETE
};

typedef enum _MODULE_RUN_TYPE
{
    MRT_BULK,
    MRT_RESIDENT,
    MRT_CHECKPOINT,
    MRT_INITIATOR,
    MRT_FINISHER,    
    MRT_LAST = MRT_FINISHER,
    MRT_UNKNOWN = (DWORD)-1
}MODULE_RUN_TYPE;

//////////////////////////////////////////////////////////
//
// @struct STRESS_RESULTS |
// Structure used to count and record the number of iterations
// run by a stress module and the results of those iterations.
// You may use <f RecordIterationResults> to keep track of results
// and you must use <f ReportResults> to report your results to the
// harness before your module exits.
//
// @comm <nl> NOTE: A test iteration can only produce a single
// result: it either passes, fails, or produces some level of
// warning.
//
typedef struct _STRESS_RESULTS
{
    DWORD   dwModuleID;   // @field (Harness use only) Unique module identifier.
    UINT    nIterations;  // @field Number of iterations run.
    UINT    nFail;        // @field Number of iterations that failed.
    UINT    nWarn1;       // @field Number of iterations that produced level 1 (serious) warnings.
    UINT    nWarn2;       // @field Number of iterations that produced level 2 (minor) warnings.
}
STRESS_RESULTS, *PSTRESS_RESULTS;


#define MAGIC_MODULE_PARAM_VALUE    (0xFACEBEAD)

typedef struct _MODULE_PARAMS1
{
    DWORD   dwDuration;         // @field Requested duration of the module.
    DWORD   dwLoggingZones;     // @field Specifies the logging zones enbabled for this run.
    UINT    uVerbosity;         // @field Specifies the logging verbosity level for this run.
    UINT    uHarnessLogLevel;   // @field Specifies the logging level used by the harness.
    UINT    uBreakLevel;        // @field (harness use only) Specifies the level of action to take on failure.
    UINT    iSlot;              // @field (harness use only) Indicates the slot used for reporting pass/fail info.
    LPTSTR  tszServer;          // @field (MacCallan only) The name or address of a test server for the module to communicate with.
    LPTSTR  tszReserved;        // @field (harness use only) Reserved
    LPTSTR  tszUser;            // @field Module specific command line params as read from stressme.ini.
}
MODULE_PARAMS1, *PMODULE_PARAMS1;

//////////////////////////////////////////////////////////
//
// @struct MODULE_PARAMS |
// Structure containing information passed to the module
// by the stress harness on the module's command line.
// Use the <f ParseCmdLine_WinMain> or <f ParseCmdLine_wmain>
// functions to retrieve this info from the command line.
// This struct should then immediately be used to initialize
// the stress utilities using <f InitializeStressUtils>.
//
typedef struct _MODULE_PARAMS
{
    // Version 1.0 fields
    DWORD   dwDuration;         // @field Requested duration of the module.
    DWORD   dwLoggingZones;     // @field Specifies the logging zones enbabled for this run.
    UINT    uVerbosity;         // @field Specifies the logging verbosity level for this run.
    UINT    uHarnessLogLevel;   // @field Specifies the logging level used by the harness.
    UINT    uBreakLevel;        // @field (harness use only) Specifies the level of action to take on failure.
    UINT    iSlot;              // @field (harness use only) Indicates the slot used for reporting pass/fail info.
    LPTSTR  tszServer;          // @field (MacCallan only) The name or address of a test server for the module to communicate with.
    LPTSTR  tszReserved;        // @field (harness use only) Reserved
    LPTSTR  tszUser;            // @field Module specific command line params as read from stressme.ini.

    // Version 2.0 fields
    DWORD   dwMagic;            // @Special token for determining if the later members are valid
    DWORD   dwSize;             // @field The size in bytes of the data structure
    DWORD   dwClientId;         // @field The unique ID of the client that launched the module
    DWORD   dwModuleId;         // @field The unique ID of the module from the mix
    DWORD   dwTestId;           // @field The unique ID of the module instance assigned by the client
    DWORD   dwRunType;          // @field The MODULE_RUN_TYPE info for this run
}
MODULE_PARAMS, *PMODULE_PARAMS;

//////////////////////////////////////////////////////////
//
// @struct ITERATION_INFO |
// Structure containing information about a test thread iteration.
// Passed (via the LPVOID param) to DoStressIteration( ) in DLL
// modules.
//
typedef struct _ITERATION_INFO
{
    UINT    cbSize;             // @field Size in bytes of this structure.
    int     index;              // @field Zero-based index of the calling thread.  Useful for indexing arrays of per-thread data.
    int     iteration;          // @field The number of this particular iteration (in the context of the calling thread only).
}
ITERATION_INFO, *PITERATION_INFO;


//////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////

#define MQI_FEATURE_UNSUPPORTED (0x00000001L)   // The feature being tested is not supported on this device
#define MQI_FILE_NOT_FOUND      (0x00000002L)   // A file needed by the module was not found on this device

typedef struct _MODULE_QUERY_INFO
{
    DWORD   dwSize;             // @field Size in bytes of this structure
    DWORD   dwFlags;            // @field One of the MQI_ constants defined above
}MODULE_QUERY_INFO,*PMODULE_QUERY_INFO;

typedef HRESULT (*LPQUERYMODULEINFOPROC)(PMODULE_QUERY_INFO);

// Init and Command line
BOOL STRESSAPI InitializeStressUtils (LPCTSTR tszModuleName, DWORD dwDefaultLoggingZones, MODULE_PARAMS* pmp);
BOOL STRESSAPI ParseCmdLine_WinMain (_In_ LPTSTR tszCmdLine, _Out_ MODULE_PARAMS* pmp);
BOOL STRESSAPI ParseCmdLine_wmain (_In_ int argc, _In_reads_(argc) LPWSTR* argv, _Out_ MODULE_PARAMS* pmp);

// Duration
BOOL CheckTime (DWORD dwDuration, DWORD dwStartTime);

// Results reporting
void RecordIterationResults (STRESS_RESULTS* pRes, UINT ret);
BOOL STRESSAPI ReportResults (STRESS_RESULTS* pRes);
void STRESSAPI AddResults (STRESS_RESULTS* pDest, STRESS_RESULTS* pSrc);

// Logging
void STRESSAPI LogEx (DWORD dwLevel, DWORD dwSubzone, const TCHAR *tszFormat, ...);
void STRESSAPI Log (DWORD dwLevel, const TCHAR *tszFormat, ...);
void STRESSAPI LogAbort (const TCHAR *tszFormat, ...);
void STRESSAPI LogFail (const TCHAR *tszFormat, ...);
void STRESSAPI LogWarn1 (const TCHAR *tszFormat, ...);
void STRESSAPI LogWarn2 (const TCHAR *tszFormat, ...);
void STRESSAPI LogComment (const TCHAR *tszFormat, ...);
void STRESSAPI LogVerbose (const TCHAR *tszFormat, ...);
void STRESSAPI LogAll (const TCHAR *tszFormat, ...);
void STRESSAPI LogInternal (DWORD dwLevel, const TCHAR *tszFormat, ...);
void STRESSAPI LogAlways(const TCHAR *tszFormat, ...);

// Misc
LONG STRESSAPI GetRunningModuleCount (HANDLE hInst);
void STRESSAPI RandomSeed (DWORD dwSeed);
DWORD STRESSAPI GetRandomNumber (DWORD dwRandMax);
DWORD GetRandomRange (DWORD dwRandMin, DWORD dwRandMax);

// User Command line Parsing
_Success_(return > 0)
int  InitUserCmdLineUtils(_In_ LPTSTR tszUserCommandLine, _Outptr_result_buffer_(return) LPTSTR *pargv[]);
void User_SetOptionChars (_In_ int NumChars, _In_reads_(NumChars) TCHAR *CharArray);
void User_StrictOptionsOnly (BOOL bStrict);
BOOL User_WasOption (LPCTSTR pszOption);
BOOL User_GetOption (_In_ LPCTSTR pszOption, _Out_ LPTSTR *ppszArgument);
BOOL User_GetOptionAsInt (LPCTSTR pszOption, int *piArgument);
BOOL User_GetOptionAsDWORD (LPCTSTR pszOption, DWORD *pdwArgument);

HANDLE WINAPI StressUtils_CreateFile(LPCTSTR lpFileName,
                                     DWORD dwDesiredAccess,
                                     DWORD dwShareMode,
                                     LPSECURITY_ATTRIBUTES lpSecurityAttributes,
                                     DWORD dwCreationDisposition,
                                     DWORD dwFlagsAndAttributes,
                                     HANDLE hTemplateFile);

BOOL WINAPI StressUtils_CreateProcess(LPCTSTR lpApplicationName,
                                      LPCTSTR lpCommandLine,
                                      LPSECURITY_ATTRIBUTES lpProcessAttributes,
                                      LPSECURITY_ATTRIBUTES lpThreadAttributes,
                                      BOOL bInheritHandles,
                                      DWORD dwCreationFlags,
                                      LPVOID lpEnvironment,
                                      _In_ LPTSTR lpCurrentDirectory,
                                      LPSTARTUPINFO lpStartupInfo,
                                      LPPROCESS_INFORMATION lpProcessInformation);

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif // __STRESSUTILS_H__
