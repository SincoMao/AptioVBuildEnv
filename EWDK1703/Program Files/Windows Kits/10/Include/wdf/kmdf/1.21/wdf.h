/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    wdf.h

Abstract:

    Main header file for Windows Driver Frameworks

Environment:

    kernel mode only

Revision History:

--*/

//
// NOTE: This header is generated by stubwork.  Please make any 
//       modifications to the corresponding template files 
//       (.x or .y) and use stubwork to regenerate the header
//

#ifndef _WDF_H_
#define _WDF_H_

#ifndef WDF_EXTERN_C
  #ifdef __cplusplus
    #define WDF_EXTERN_C       extern "C"
    #define WDF_EXTERN_C_START extern "C" {
    #define WDF_EXTERN_C_END   }
  #else
    #define WDF_EXTERN_C
    #define WDF_EXTERN_C_START
    #define WDF_EXTERN_C_END
  #endif
#endif

WDF_EXTERN_C_START



#ifndef _Dispatch_type_
#include <driverspecs.h>
#endif





//
// Rename WdfFunctions to match version number. Build issues relating to
// unresolved externals of WdfFunctions or WdfFunctions_XXXXX indicate
// multiple WDF versions are being included. Ensure WDF version of all input
// binaries match to resolve.
//
#define WdfFunctions WdfFunctions_01021

typedef VOID (*WDFFUNC) (VOID);
extern const WDFFUNC *WdfFunctions;
extern WDFFUNC WdfDriverMiniportUnloadOverride;

_Analysis_mode_(KMDF_INCLUDED)

// Basic definitions
#include "wdftypes.h"
#include "wdfglobals.h"
#include "wdffuncenum.h"
#include "wdfstatus.h"
#include "wdfassert.h"
#include "wdfverifier.h"
#include "wdfpool.h"

// generic object
#include "wdfobject.h"

// Synchronization
#include "wdfsync.h"

#include "wdfcore.h"

#include "wdfdriver.h"

// Objects
#include "WdfQueryInterface.h"
#include "wdfmemory.h"
#include "wdfchildlist.h"
#include "wdffileobject.h"
#include "wdfdevice.h"
#include "wdfcollection.h"
#include "wdfdpc.h"
#include "wdftimer.h"
#include "wdfworkitem.h"
#include "wdfinterrupt.h"
#include "wdfresource.h"

// I/O
#include "wdfrequest.h"
#include "wdfiotarget.h"
#include "wdfio.h"

// particular device types
#include "wdffdo.h"
#include "wdfpdo.h"
#include "wdfcontrol.h"

#include "WdfWMI.h"

#include "wdfstring.h"
#include "wdfregistry.h"

// Dma
#include "wdfDmaEnabler.h"
#include "wdfDmaTransaction.h"
#include "wdfCommonBuffer.h"

#include "wdfbugcodes.h"
#include "wdfroletypes.h"
#include "wdfhwaccess.h"




WDF_EXTERN_C_END

#endif // _WDF_H_

