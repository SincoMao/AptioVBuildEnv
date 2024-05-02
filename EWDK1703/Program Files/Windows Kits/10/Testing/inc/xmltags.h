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
// --------------------------------------------------------------------
//                                                                     
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY OF 
// ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO 
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A      
// PARTICULAR PURPOSE.                                                 
//                                                                     
// --------------------------------------------------------------------

#ifndef __XMLTAGS_H__
#define __XMLTAGS_H__

#define MAXLOGMARKUPLENGTH	56

#define	XMLRAW				0x00000002
#define XMLPURE				0x00000004

//******************************************************************************
// Define EXTERN_C
//******************************************************************************

#ifndef EXTERN_C
   #ifdef __cplusplus
      #define EXTERN_C extern "C"
   #else
      #define EXTERN_C
   #endif
#endif

//******************************************************************************
// APIs for C and C++ interfaces
//******************************************************************************
EXTERN_C
void
XMLSetKatoObject(
	HKATO	hKato
);

EXTERN_C
void
XMLClearKatoObject();

EXTERN_C
void
XMLSetLogType(
	DWORD	dwLogType
);

EXTERN_C
void
XMLFileHeader(
);

EXTERN_C
void
XMLTestSuiteHeader(
	LPCTSTR		lpszSuiteName	= NULL,
	LPCTSTR		lpszSuiteDescr	= NULL,
	int			nTests			= 0
);

EXTERN_C
void
XMLTestCaseHeaderWTest(
	DWORD		dwTestID		= 0,
	LPCWSTR		lpszTestName	= NULL,
	LPCTSTR		lpszTestPath	= NULL,
	LPCTSTR		lpszTestCmdLine	= NULL,
	DWORD		dwTestRandomSeed	= 0,
	DWORD		dwTestThreadCount	= 0
);

EXTERN_C
void
XMLTestCaseHeaderATest(
	DWORD		dwTestID		= 0,
	LPCSTR		lpszTestName	= NULL,
	LPCTSTR		lpszTestPath	= NULL,
	LPCTSTR		lpszTestCmdLine	= NULL,
	DWORD		dwTestRandomSeed	= 0,
	DWORD		dwTestThreadCount	= 0
);

EXTERN_C
void
XMLTestCaseFooterWTest(
	DWORD		dwResult		= 0,
	DWORD		dwExecutionTime	= 0,
	DWORD		dwTestID		= 0,
	LPCWSTR		lpszTestName	= NULL,
	LPCTSTR		lpszTestPath	= NULL,
	LPCTSTR		lpszTestCmdLine	= NULL,
	DWORD		dwTestRandomSeed	= 0,
	DWORD		dwTestThreadCount	= 0
);

EXTERN_C
void
XMLTestCaseFooterATest(
	DWORD		dwResult		= 0,
	DWORD		dwExecutionTime	= 0,
	DWORD		dwTestID		= 0,
	LPCSTR		lpszTestName	= NULL,
	LPCTSTR		lpszTestPath	= NULL,
	LPCTSTR		lpszTestCmdLine	= NULL,
	DWORD		dwTestRandomSeed	= 0,
	DWORD		dwTestThreadCount	= 0
);

EXTERN_C
void
XMLTestSuiteFooter(
	DWORD		dwPassed	= 0,
	DWORD		dwFailed	= 0,
	DWORD		dwSkipped	= 0,
	DWORD		dwAborted	= 0,
	DWORD		dwSuiteTime	= 0,
	DWORD		dwTestsTime	= 0
);

EXTERN_C
_Success_(return != NULL)
LPWSTR
XMLGetLogStringW(
	LPCWSTR    lpwszString,
	_Out_writes_(dwBuffSize) LPWSTR lpwszBuff,
	DWORD	dwBuffSize,
	LPVOID	id			= 0,
	DWORD	dwLevel		= 0,
	DWORD	dwLevelID	= 0,
	DWORD	dwVerbosity	= 0
);

EXTERN_C
_Success_(return != NULL)
LPSTR
XMLGetLogStringA(
	LPCSTR lpszString,
	_Out_writes_(dwBuffSize) LPSTR lpszBuff,
	DWORD	dwBuffSize,
	LPVOID	id			= 0,
	DWORD	dwLevel		= 0,
	DWORD	dwLevelID	= 0,
	DWORD	dwVerbosity	= 0
);

EXTERN_C
_Success_(return != NULL)
LPWSTR
XMLGetCommentStringW(
	LPCWSTR    lpwszString,
	_Out_writes_(dwBuffSize) LPWSTR lpwszBuff,
	DWORD	dwBuffSize,
	LPVOID	id			= 0,
	DWORD	dwLevel		= 0,
	DWORD	dwLevelID	= 0,
	DWORD	dwVerbosity	= 0
);

EXTERN_C
_Success_(return != NULL)
LPSTR
XMLGetCommentStringA(
	LPCSTR lpszString,
	_Out_writes_(dwBuffSize) LPSTR lpszBuff,
	DWORD	dwBuffSize,
	LPVOID	id			= 0,
	DWORD	dwLevel		= 0,
	DWORD	dwLevelID	= 0,
	DWORD	dwVerbosity	= 0
);

EXTERN_C
_Success_(return != NULL)
LPWSTR
XMLizeStringW(
	LPCWSTR    lpwszString,
	_Out_writes_(dwBuffSize) LPWSTR lpwszBuff,
	DWORD	dwBuffSize
);

EXTERN_C
_Success_(return != NULL)
LPSTR
XMLizeStringA(
	LPCSTR lpszString,
	_Out_writes_(dwBuffSize) LPSTR lpszBuff,
	DWORD	dwBuffSize
);

#ifdef UNICODE
	#define XMLTestCaseHeader	XMLTestCaseHeaderWTest
	#define XMLTestCaseFooter	XMLTestCaseFooterWTest
	#define XMLGetLogString		XMLGetLogStringW
	#define XMLizeString		XMLizeStringW
#else
	#define XMLTestCaseHeader	XMLTestCaseHeaderATest
	#define XMLTestCaseFooter	XMLTestCaseFooterATest
	#define XMLGetLogString		XMLGetLogStringA
	#define XMLizeString		XMLizeStringA
#endif

#endif
