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
//******************************************************************************
//
// TUX.H
//
// Definitions of Tux types, structures, and messages.
//
//******************************************************************************

#ifndef __TUX_H__
#define __TUX_H__

#include <windows.h>

//******************************************************************************
//***** Function Types
//******************************************************************************

// Forward declaration of LPFUNCTION_TABLE_ENTRY
typedef struct _FUNCTION_TABLE_ENTRY *LPFUNCTION_TABLE_ENTRY;

// Define our ShellProc Param and TestProc Param types
typedef LPARAM  SPPARAM;
typedef LPDWORD TPPARAM;

// Shell and Test message handling procs
typedef INT (WINAPI *SHELLPROC)(UINT uMsg, SPPARAM spParam);
typedef INT (WINAPI *TESTPROC )(UINT uMsg, TPPARAM tpParam, LPFUNCTION_TABLE_ENTRY lpFTE);

// SHELLPROCAPI and TESTPROCAPI
#ifdef __cplusplus
#define SHELLPROCAPI extern "C" INT __declspec(dllexport) WINAPI
#else
#define SHELLPROCAPI INT __declspec(dllexport) WINAPI
#endif
#define TESTPROCAPI  INT WINAPI

//******************************************************************************
//***** Function Table Entry Structure
//******************************************************************************

typedef struct _FUNCTION_TABLE_ENTRY {
   LPCTSTR  lpDescription; // description of test
   UINT     uDepth;        // depth of item in tree hierarchy
   DWORD    dwUserData;    // user defined data that will be passed to TestProc at runtime
   DWORD    dwUniqueID;    // uniquely identifies the test - used in loading/saving scripts
   TESTPROC lpTestProc;    // pointer to TestProc function to be called for this test
} FUNCTION_TABLE_ENTRY, *LPFUNCTION_TABLE_ENTRY;

//******************************************************************************
//***** ShellProc() Message values
//******************************************************************************

#define SPM_LOAD_DLL			   1
#define SPM_UNLOAD_DLL			   2
#define SPM_START_SCRIPT		   3
#define SPM_STOP_SCRIPT 		   4
#define SPM_BEGIN_DLL 			   5
#define SPM_END_DLL			       6
#define SPM_SHELL_INFO			   7
#define SPM_REGISTER			   8
#define SPM_EXCEPTION			   9
#define SPM_BEGIN_TEST			  10
#define SPM_END_TEST			  11
#define	SPM_STABILITY_INIT		  12
#define SPM_SETUP_GROUP			  13
#define SPM_TEARDOWN_GROUP		  14

//******************************************************************************
//***** ShellProc() Return values
//******************************************************************************

#define SPR_NOT_HANDLED            0
#define SPR_HANDLED                1
#define SPR_SKIP                   2
#define SPR_FAIL                   3

//******************************************************************************
//***** TestProc() Message values
//******************************************************************************

#define TPM_EXECUTE              101
#define TPM_QUERY_THREAD_COUNT   102

//******************************************************************************
//***** TestProc() Return values
//******************************************************************************

// TPR_HANDLED and TPR_NOT_HANDLED should be used for test messages other
// than TPM_EXECUTE (i.e. TPR_QUERY_THREAD_COUNT)
#define TPR_NOT_HANDLED            0
#define TPR_HANDLED                1

// A TPM_EXECUTE TestProc message must return one of the following
#define TPR_SKIP                   2
#define TPR_PASS                   3
#define TPR_FAIL                   4
#define TPR_ABORT                  5

//******************************************************************************
//***** Tux Exe process exit code
//******************************************************************************

#define	TXEC_GET_FAILS(exitCode)			((int) (HIWORD((DWORD) exitCode)))
#define	TXEC_GET_SKIPS(exitCode)			((int) (HIBYTE(LOWORD((DWORD) exitCode))))
#define	TXEC_GET_ABORTS(exitCode)			((int) (LOBYTE(LOWORD((DWORD) exitCode))))

// Note: we always clear the high bit so that the
// exit code will not be mistaken for an exception (0xC000....)
// by GetExitCodeProcess().

#define	TXEC_SET_FAILS(exitCode, fails)		((int) ((exitCode & 0x0000FFFF) | ((fails & 0x7FFF) << 16)))
#define	TXEC_SET_SKIPS(exitCode, skips)		((int) ((exitCode & 0x7FFF00FF) | ((skips & 0xFF) << 8)))
#define	TXEC_SET_ABORTS(exitCode, aborts)	((int) ((exitCode & 0x7FFFFF00) | (aborts & 0xFF)))

#define	MAKE_TXEC(f, s, a)					((int) (0x7FFFFFFF & MAKELONG(MAKEWORD(a,s),f)))


//******************************************************************************
//***** ShellProc() Structures
//******************************************************************************

// ShellProc() Structure for SPM_LOAD_DLL message
typedef struct _SPS_LOAD_DLL {
   BOOL fUnicode;  // Set to true if your Dll is UNICODE
   TCHAR szPathName[MAX_PATH];
   TCHAR szFileName[MAX_PATH];
} SPS_LOAD_DLL, *LPSPS_LOAD_DLL;


// ShellProc() Structure for SPM_STABILITY_INIT message
typedef struct _SPS_STABILITY_INFO
{
	DWORD	dwSize;		// size of the structure in bytes
	HINSTANCE hInstance;
	LPCTSTR	lpszCmd;  		// Command line arguments for stability harness
}
SPS_STABILITY_INFO, *LPSPS_STABILITY_INFO;


// ShellProc() Structure for SPM_SHELL_INFO message
typedef struct _SPS_SHELL_INFO {
   HINSTANCE hInstance;     // Instance handle of shell.
   HWND      hWnd;          // Main window handle of shell (currently set to NULL).
   HINSTANCE hLib;          // Test Dll instance handle.
   HANDLE    hevmTerminate; // Manual event that is set by Tux to inform all
                            // tests to shutdown (currently not used).
   BOOL      fUsingServer;  // Set if Tux is connected to Tux Server.
   LPCTSTR   szDllCmdLine;  // Command line arguments for test DLL.
   BOOL		 fXML;
} SPS_SHELL_INFO, *LPSPS_SHELL_INFO;

// ShellProc() Structure for SPM_REGISTER message
typedef struct _SPS_REGISTER {
   LPFUNCTION_TABLE_ENTRY lpFunctionTable;
} SPS_REGISTER, *LPSPS_REGISTER;

// ShellProc() Structure for SPM_SETUP_GROUP message
typedef struct _SPS_SETUP_GROUP {
   LPFUNCTION_TABLE_ENTRY lpFTE;
} SPS_SETUP_GROUP, *LPSPS_SETUP_GROUP;

// ShellProc() Structure for SPM_TEARDOWN_GROUP message
typedef struct _SPS_TEARDOWN_GROUP {
   LPFUNCTION_TABLE_ENTRY lpFTE;
   DWORD                  dwGroupTestsSkipped;
   DWORD                  dwGroupTestsPassed;
   DWORD                  dwGroupTestsFailed;
   DWORD                  dwGroupTestsAborted;
   DWORD                  dwGroupExecutionTime;
} SPS_TEARDOWN_GROUP, *LPSPS_TEARDOWN_GROUP;

// ShellProc() Structure for SPM_BEGIN_TEST message
typedef struct _SPS_BEGIN_TEST {
   LPFUNCTION_TABLE_ENTRY lpFTE;
   DWORD                  dwRandomSeed;
   DWORD                  dwThreadCount;
} SPS_BEGIN_TEST, *LPSPS_BEGIN_TEST;

// ShellProc() Structure for SPM_END_TEST message
typedef struct _SPS_END_TEST {
   LPFUNCTION_TABLE_ENTRY lpFTE;
   DWORD                  dwResult;
   DWORD                  dwRandomSeed;
   DWORD                  dwThreadCount;
   DWORD                  dwExecutionTime;
} SPS_END_TEST, *LPSPS_END_TEST;

// ShellProc() Structure for SPM_EXCEPTION message
typedef struct _SPS_EXCEPTION {
   LPFUNCTION_TABLE_ENTRY lpFTE;
   DWORD                  dwExceptionCode;
   EXCEPTION_POINTERS    *lpExceptionPointers;
   DWORD                  dwExceptionFilter;
   UINT                   uMsg;
} SPS_EXCEPTION, *LPSPS_EXCEPTION;


//******************************************************************************
//***** TestProc() Structures
//******************************************************************************

// TestProc() Structure for TPM_EXECUTE message
typedef struct _TPS_EXECUTE {
   DWORD dwRandomSeed;
   DWORD dwThreadCount;
   DWORD dwThreadNumber;
} TPS_EXECUTE, *LPTPS_EXECUTE;

// TestProc() Structure for TPM_QUERY_THREAD_COUNT message
typedef struct _TPS_QUERY_THREAD_COUNT {
   DWORD dwThreadCount;
} TPS_QUERY_THREAD_COUNT, *LPTPS_QUERY_THREAD_COUNT;

//******************************************************************************
//***** Old constants defined for compatibility - DO NOT USE THESE CONSTANTS!!!
//******************************************************************************

#define SPM_START_TESTS   SPM_BEGIN_GROUP
#define SPM_STOP_TESTS    SPM_END_GROUP
#define SHELLINFO         SPS_SHELL_INFO
#define LPSHELLINFO       LPSPS_SHELL_INFO
#define SPF_UNICODE       0x00010000

// These have been re-named SPM_BEGIN_DLL and SPM_END_DLL.
#define SPM_BEGIN_GROUP 		   5
#define SPM_END_GROUP			   6

#endif //__TUX_H__

