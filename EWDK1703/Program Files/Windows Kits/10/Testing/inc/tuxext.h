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
// TUXEXT.H
//
// Definitions of Tux types, structures, and messages for all TUX Extentions
// that must be shared with testcases or test binaries that depend on those
// extentions.
//
//******************************************************************************

#pragma once

//
// note tux.h includes windows.h
// tux extentions can ideally just include this file and get all
// needed system and tux headers pulled in for them.
//

#include <tux.h>
#include <tuxint.h>

//
// New or EXTENEDED structures, and values follow.  These are only valid if the
// associated Tux Extention is loaded and active.
//

//******************************************************************************
//***** EXT ShellProc() Message values
//******************************************************************************



//******************************************************************************
//***** EXT TestProc() Message values
//******************************************************************************
// you can add new TestProc messages that are unique in value below to support
// new TuxExt.

#define TPM_PREPARE              103
#define TPM_CLEANUP              104



//******************************************************************************
//***** EXT TestProc() Return values
//******************************************************************************




//******************************************************************************
//***** EXT ShellProc() Structures
//******************************************************************************



//******************************************************************************
//**** EXT TestProc() Structures
//******************************************************************************

// TestProc() Structure for TPM_PREPARE and TPM_CLEANUP
// same as TPM_EXECUTE but can be expanded/changed later
typedef struct _TPS_PREP {
   DWORD dwRandomSeed;
   DWORD dwThreadCount;
   DWORD dwThreadNumber;
} TPS_PREP, *LPTPS_PREP;

