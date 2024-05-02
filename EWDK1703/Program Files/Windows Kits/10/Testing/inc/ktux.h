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
// ----------------------------------------------------------------------------
//******************************************************************************
//
// KTUX.H
//
// Definitions of KTux types, structures, and messages.
//
//******************************************************************************

#ifndef __KTUX_H__
#define __KTUX_H__

#include "tux.h"
#include "kato.h"

#define KTUX_DLL  TEXT("KTux.DLL")
//
// InKernelMode -- check if we are running in k-mode or not
//
__inline BOOL InKernelMode() {
      return (int) InKernelMode < 0;
}

#define KTUX_IOCTL_NOACTION      0
#define KTUX_IOCTL_PING          1
#define KTUX_IOCTL_SHELLMSG      2
#define KTUX_IOCTL_TESTMSG       3
#define KTUX_IOCTL_KATOINIT      4
#define KTUX_IOCTL_SETDEBUG      5
#define KTUX_IOCTL_INIT          6
#define KTUX_IOCTL_DEINIT        7

#define KTUX_PING                0xABABABAB
#define KTUX_PONG                0xEFEFEFEF
#define KTUX_PINGFAIL            0xFFFFFFFF

#define MSG_TYPE_SPM             0x1
#define MSG_TYPE_TPM             0x2

typedef struct _LIST {
    LPVOID  addr;
    struct _LIST *next;
} LIST, *PLIST;

typedef union {
   SPS_LOAD_DLL                  spsldll;
   SPS_SHELL_INFO                spssinfo;
   SPS_REGISTER                  spsreg;
   SPS_EXCEPTION                 spsexcept;
   SPS_BEGIN_TEST                spsbegin;
   SPS_END_TEST                  spsend;
   SPS_STABILITY_INFO            spsstab;
   TPS_EXECUTE                   tpsexec;
   TPS_QUERY_THREAD_COUNT        tpsqthrdcnt;
} KTUX_MSG_STRUCT_ALL; 

typedef struct _KTUXMSG {
   DWORD                         type;
   UINT                          uMsg;
   KTUX_MSG_STRUCT_ALL           param;
   DWORD                         paramSize;
   LPFUNCTION_TABLE_ENTRY        lpFTE;
} KTUXMSG, *PKTUXMSG;

typedef struct _KATOARGS {
    TCHAR                        szKatoServer[ 32 ];
    DWORD                        nListing;
    HANDLE                       hFileLog;
    BOOL                         fLogToDebugger;
    BOOL                         fConsoleEnabled;
    BOOL                         fEnableODS;
    LPKATOCALLBACKA              pfnKatoCallback;
} KATOARGS, *PKATOARGS;
#endif // __KTUX_H__
