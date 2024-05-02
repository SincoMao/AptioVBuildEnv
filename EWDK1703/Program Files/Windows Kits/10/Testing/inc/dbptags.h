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
//******************************************************************************
//
// DBPTAGS.H
//
// Definition module for the DB Parse Tags emitting functions
//
//******************************************************************************

#ifndef __DBPTAGS_H__
#define __DBPTAGS_H__
#include "kato.h"

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
// Constants
//******************************************************************************

#define DBPRESULT_SKIP      2
#define DBPRESULT_PASS      3
#define DBPRESULT_FAIL      4
#define DBPRESULT_ABORT     5

//******************************************************************************
// APIs for C and C++ interfaces
//******************************************************************************

EXTERN_C VOID   DBPTSetKatoObject(HKATO hKato);
EXTERN_C VOID   DBPTClearKatoObject();
EXTERN_C VOID   DBPTBeginTestGroup(LONG lTestGroupID);
EXTERN_C VOID   DBPTBeginTestCase(LONG lTestCaseID);
EXTERN_C VOID   DBPTEndTestCase(INT nResult);
EXTERN_C VOID   DBPTEndTestGroup(VOID);

#endif // __DBPTAGS_H__
