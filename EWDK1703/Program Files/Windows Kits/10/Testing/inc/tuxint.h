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
// Internal tux definitions - not to be included by tests

#pragma once
#include <tux.h>

#define TUXEXT_SHELLPROC_PROXY   "ProxyShellProc"
#define TUXEXT_TESTPROC_PROXY    "ProxyTestProc"
#define TUXEXT_INIT_PROXY        "ProxyInit"
#define TUXEXT_DEINIT_PROXY      "ProxyDeinit"

#ifdef __cplusplus
    #define TUXEXTAPI extern "C" INT WINAPI
#else
    #define TUXEXTAPI INT WINAPI
#endif

typedef struct _TUXEXTINFO  TUXEXTINFO, *PTUXEXTINFO;

typedef INT (WINAPI *PFN_SHELLPROCPROXY)(SHELLPROC, UINT, SPPARAM);
typedef INT (WINAPI *PFN_TESTPROCPROXY)(TESTPROC, UINT, TPPARAM, LPFUNCTION_TABLE_ENTRY);
typedef void (* PFN_USERMSG ) (LPCTSTR, ...);
typedef INT (* PFN_INITPROXY ) ( PTUXEXTINFO );
typedef INT (* PFN_DEINITPROXY ) ( PTUXEXTINFO );

typedef struct _TUXEXTINFO {
    HINSTANCE           hExtLib;
    LPTSTR              szExtFileName;
    LPTSTR              szArgs;
    PFN_USERMSG         pfnUserMsg;
    PFN_INITPROXY       pfnInitProxy;
    PFN_DEINITPROXY     pfnDeinitProxy;
    PFN_SHELLPROCPROXY  pfnShellProcProxy;
    PFN_TESTPROCPROXY   pfnTestProcProxy;
    DWORD               dwVerMajor;
    DWORD               dwVerMinor;
    DWORD               dwVerPrivate;
} TUXEXTINFO, *PTUXEXTINFO;

// EOF
