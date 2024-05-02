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
// KATO.H
//
// Definition module for the Kato constants and CKato interface
//
//******************************************************************************

#ifndef __KATO_H__
#define __KATO_H__

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
// Specify 32 bit pack size to ensure everyone creates the correct size objects
//******************************************************************************

#pragma pack(4)

//******************************************************************************
// Constants
//******************************************************************************

#define KATO_MAX_LEVEL            31
#define KATO_MAX_VERBOSITY        15
#define KATO_MAX_STRING_LENGTH  1024
#define KATO_MAX_DATA_SIZE      1024

#define KATO_FLAG_NO_WTT    0x10000000


//******************************************************************************
// Types
//******************************************************************************

typedef HANDLE HKATO;

typedef struct _KATOCALLBACKSTRUCTW {
   LPARAM  lParam;
   HKATO   hKato;
   DWORD   dwThreadID;
   DWORD   dwTickCount;
   DWORD   dwLevel;
   DWORD   dwLevelID;
   DWORD   dwVerbosity;
   LPCWSTR wszLog;
} KATOCALLBACKSTRUCTW, *LPKATOCALLBACKSTRUCTW;

typedef struct _KATOCALLBACKSTRUCTA {
   LPARAM  lParam;
   HKATO   hKato;
   DWORD   dwThreadID;
   DWORD   dwTickCount;
   DWORD   dwLevel;
   DWORD   dwLevelID;
   DWORD   dwVerbosity;
   LPCSTR  szLog;
} KATOCALLBACKSTRUCTA, *LPKATOCALLBACKSTRUCTA;

typedef BOOL (CALLBACK *LPKATOCALLBACKW)(LPKATOCALLBACKSTRUCTW);
typedef BOOL (CALLBACK *LPKATOCALLBACKA)(LPKATOCALLBACKSTRUCTA);

typedef enum _KATO_FLUSH_TYPE {
   KATO_FLUSH_ON,
   KATO_FLUSH_OFF,
   KATO_FLUSH_NOW,
} KATO_FLUSH_TYPE, *LPKATO_FLUSH_TYPE;

//******************************************************************************
// Common APIs for C and C++ interfaces
//******************************************************************************

EXTERN_C BOOL  WINAPI KatoSetServerW(_In_ LPCWSTR wszServer);
EXTERN_C BOOL  WINAPI KatoSetServerA(_In_ LPCSTR szServer);
_Success_(return == TRUE)
EXTERN_C BOOL  WINAPI KatoGetServerW(_Out_writes_opt_(nCount) LPWSTR wszServer, _In_ INT nCount);
_Success_(return == TRUE)
EXTERN_C BOOL  WINAPI KatoGetServerA(_Out_writes_opt_(nCount) LPSTR szServer, INT nCount);
EXTERN_C BOOL  WINAPI KatoSetCallbackW(_In_ LPKATOCALLBACKW lpCallbackW, _Inout_opt_ LPARAM lParam);
EXTERN_C BOOL  WINAPI KatoSetCallbackA(_In_ LPKATOCALLBACKA lpCallbackA, _Inout_opt_ LPARAM lParam);
EXTERN_C BOOL  WINAPI KatoRemoveCallbackW(_In_ LPKATOCALLBACKW lpCallbackW, _Inout_opt_ LPARAM lParam);
EXTERN_C BOOL  WINAPI KatoRemoveCallbackA(_In_ LPKATOCALLBACKA lpCallbackA, _Inout_opt_ LPARAM lParam);
EXTERN_C BOOL  WINAPI KatoFlush(_In_ KATO_FLUSH_TYPE flushType);
EXTERN_C BOOL  WINAPI KatoDebug(_In_ BOOL fODSEnabled, _In_ DWORD dwMaxLogVersbosity,
                                _In_ DWORD dwMaxCommentVersbosity, _In_ DWORD dwMaxLevel);
EXTERN_C BOOL  WINAPI KatoDebugEx(_In_ BOOL fODSEnabled, _In_ BOOL fConsoleEnabled, _In_ DWORD dwMaxLogVersbosity,
                                  _In_ DWORD dwMaxCommentVersbosity, _In_ DWORD dwMaxLevel);

EXTERN_C HKATO WINAPI KatoGetDefaultObjectEx(_In_ DWORD dwFlags);

// Legacy support: allow older code to compile with new interface.
#define KatoGetDefaultObject() KatoGetDefaultObjectEx(0)


//******************************************************************************
// APIs for C interface (C++ applications should use the CKato class)
//******************************************************************************

// Construction and destruction
EXTERN_C HKATO WINAPI  KatoCreateExW(DWORD dwFlags, LPCWSTR wszName);
EXTERN_C HKATO WINAPI  KatoCreateExA(DWORD dwFlags, LPCSTR szName);
EXTERN_C BOOL  WINAPI  KatoDestroy(HKATO hKato);

// Unicode functions
EXTERN_C INT   WINAPIV KatoBeginLevelW(HKATO hKato, DWORD dwLevelID, LPCWSTR wszFormat, ...);
EXTERN_C INT   WINAPIV KatoBeginLevelVW(HKATO hKato, DWORD dwLevelID, LPCWSTR wszFormat, va_list pArgs);
EXTERN_C INT   WINAPIV KatoEndLevelW(HKATO hKato, LPCWSTR wszFormat, ...);
EXTERN_C INT   WINAPIV KatoEndLevelVW(HKATO hKato, LPCWSTR wszFormat, va_list pArgs);
EXTERN_C BOOL  WINAPIV KatoLogW(HKATO hKato, DWORD dwVerbosity, LPCWSTR wszFormat, ...);
EXTERN_C BOOL  WINAPIV KatoLogVW(HKATO hKato, DWORD dwVerbosity, LPCWSTR wszFormat, va_list pArgs);
EXTERN_C BOOL  WINAPIV KatoCommentW(HKATO hKato, DWORD dwVerbosity, LPCWSTR wszFormat, ...);
EXTERN_C BOOL  WINAPIV KatoCommentVW(HKATO hKato, DWORD dwVerbosity, LPCWSTR wszFormat, va_list pArgs);

// ASCII functions
EXTERN_C INT   WINAPIV KatoBeginLevelA(HKATO hKato, DWORD dwLevelID, LPCSTR szFormat, ...);
EXTERN_C INT   WINAPIV KatoBeginLevelVA(HKATO hKato, DWORD dwLevelID, LPCSTR szFormat, va_list pArgs);
EXTERN_C INT   WINAPIV KatoEndLevelA(HKATO hKato, LPCSTR szFormat, ...);
EXTERN_C INT   WINAPIV KatoEndLevelVA(HKATO hKato, LPCSTR szFormat, va_list pArgs);
EXTERN_C BOOL  WINAPIV KatoLogA(HKATO hKato, DWORD dwVerbosity, LPCSTR szFormat, ...);
EXTERN_C BOOL  WINAPIV KatoLogVA(HKATO hKato, DWORD dwVerbosity, LPCSTR szFormat, va_list pArgs);
EXTERN_C BOOL  WINAPIV KatoCommentA(HKATO hKato, DWORD dwVerbosity, LPCSTR szFormat, ...);
EXTERN_C BOOL  WINAPIV KatoCommentVA(HKATO hKato, DWORD dwVerbosity, LPCSTR szFormat, va_list pArgs);

// Non-string functions
EXTERN_C BOOL  WINAPI  KatoSetItemData(HKATO hKato, DWORD dwItemData);
EXTERN_C DWORD WINAPI  KatoGetItemData(HKATO hKato);
EXTERN_C BOOL  WINAPI  KatoSendSystemData(HKATO hKato, DWORD dwSystemID, LPCVOID lpcvBuffer, DWORD dwSize);
EXTERN_C DWORD WINAPI  KatoGetCurrentLevel(HKATO hKato);
EXTERN_C INT   WINAPI  KatoGetVerbosityCount(HKATO hKato, DWORD dwVerbosity, DWORD dwLevel);
EXTERN_C BOOL  WINAPI  KatoSetXML(HKATO hKato, BOOL bXML);
EXTERN_C BOOL  WINAPI  KatoSetLogsAreComments(HKATO hKato, BOOL bLogsAreComments);

//******************************************************************************
// Map function names to the correct APIs based on the UNICODE flag
//******************************************************************************

#ifdef UNICODE
   #define KATOCALLBACKSTRUCT   KATOCALLBACKSTRUCTW
   #define LPKATOCALLBACKSTRUCT LPKATOCALLBACKSTRUCTW
   #define LPKATOCALLBACK       LPKATOCALLBACKW
   #define KatoCreate(x)        KatoCreateExW(0,x)
   #define KatoSetCallback      KatoSetCallbackW
   #define KatoRemoveCallback   KatoRemoveCallbackW
   #define KatoSetServer        KatoSetServerW
   #define KatoGetServer        KatoGetServerW
   #define KatoBeginLevel       KatoBeginLevelW
   #define KatoBeginLevelV      KatoBeginLevelVW
   #define KatoEndLevel         KatoEndLevelW
   #define KatoEndLevelV        KatoEndLevelVW
   #define KatoLog              KatoLogW
   #define KatoLogV             KatoLogVW
   #define KatoComment          KatoCommentW
   #define KatoCommentV         KatoCommentVW
#else
   #define KATOCALLBACKSTRUCT   KATOCALLBACKSTRUCTA
   #define LPKATOCALLBACKSTRUCT LPKATOCALLBACKSTRUCTA
   #define LPKATOCALLBACK       LPKATOCALLBACKA
   #define KatoCreate(x)        KatoCreateExA(0,x)
   #define KatoSetCallback      KatoSetCallbackA
   #define KatoRemoveCallback   KatoRemoveCallbackA
   #define KatoSetServer        KatoSetServerA
   #define KatoGetServer        KatoGetServerA
   #define KatoBeginLevel       KatoBeginLevelA
   #define KatoBeginLevelV      KatoBeginLevelVA
   #define KatoEndLevel         KatoEndLevelA
   #define KatoEndLevelV        KatoEndLevelVA
   #define KatoLog              KatoLogA
   #define KatoLogV             KatoLogVA
   #define KatoComment          KatoCommentA
   #define KatoCommentV         KatoCommentVA
#endif

//******************************************************************************
// CKato - Interface for C++ applications
//******************************************************************************

#ifdef __cplusplus

class CKato {
public:
   // Unicode functions
   virtual INT  WINAPIV BeginLevel (DWORD dwLevelID, LPCWSTR wszFormat, ...) = 0;
   virtual INT  WINAPI  BeginLevelV(DWORD dwLevelID, LPCWSTR wszFormat, va_list pArgs) = 0;
   virtual INT  WINAPIV EndLevel (LPCWSTR wszFormat, ...) = 0;
   virtual INT  WINAPI  EndLevelV(LPCWSTR wszFormat, va_list pArgs) = 0;
   virtual BOOL WINAPIV Log (DWORD dwVerbosity, LPCWSTR wszFormat, ...) = 0;
   virtual BOOL WINAPI  LogV(DWORD dwVerbosity, LPCWSTR wszFormat, va_list pArgs) = 0;
   virtual BOOL WINAPIV Comment (DWORD dwVerbosity, LPCWSTR wszFormat, ...) = 0;
   virtual BOOL WINAPI  CommentV(DWORD dwVerbosity, LPCWSTR wszFormat, va_list pArgs) = 0;

   // ASCII functions
   virtual INT  WINAPIV BeginLevel (DWORD dwLevelID, LPCSTR szFormat, ...) = 0;
   virtual INT  WINAPI  BeginLevelV(DWORD dwLevelID, LPCSTR szFormat, va_list pArgs) = 0;
   virtual INT  WINAPIV EndLevel (LPCSTR szFormat, ...) = 0;
   virtual INT  WINAPI  EndLevelV(LPCSTR szFormat, va_list pArgs) = 0;
   virtual BOOL WINAPIV Log (DWORD dwVerbosity, LPCSTR szFormat, ...) = 0;
   virtual BOOL WINAPI  LogV(DWORD dwVerbosity, LPCSTR szFormat, va_list pArgs) = 0;
   virtual BOOL WINAPIV Comment (DWORD dwVerbosity, LPCSTR szFormat, ...) = 0;
   virtual BOOL WINAPI  CommentV(DWORD dwVerbosity, LPCSTR szFormat, va_list pArgs) = 0;

   // Non-string functions
   virtual BOOL  WINAPI SetItemData(DWORD dwItemData) = 0;
   virtual DWORD WINAPI GetItemData(VOID) = 0;
   virtual BOOL  WINAPI SendSystemData(DWORD dwSystemID, LPCVOID lpcvBuffer, DWORD dwSize) = 0;
   virtual DWORD WINAPI GetCurrentLevel(VOID) = 0;
   virtual INT   WINAPI GetVerbosityCount(DWORD dwVerbosity, DWORD dwLevel = -1) = 0;
   virtual BOOL  WINAPI SetXML(BOOL bXML) = 0;
   virtual BOOL  WINAPI SetLogsAreComments(BOOL bLogsAreComments) = 0;
};

#endif // __cplusplus

#pragma pack() // restore packing size to previous state

#endif // __KATO_H__
