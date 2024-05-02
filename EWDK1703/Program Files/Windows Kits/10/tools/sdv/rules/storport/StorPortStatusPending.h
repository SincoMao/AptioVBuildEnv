

/*

#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"
#if (spcreate_SDV_RESULT == SDV_FAILED && checkhwstorport_SDV_RESULT == SDV_FAILED)
  #define STORPORTNOTIFICATION_RequestComplete
  #define SDV_HARNESS SDV_SP_FLAT_HARNESS
#else
  #pragma message("SDV_NA")  
#endif
#else
#pragma message("spcreate==SDV_FAILED")
#pragma message("checkhwstorport==SDV_FAILED")
#endif

*/

#define SDV_HARNESS SDV_SP_IFLAT_HARNESS
#define STORPORTNOTIFICATION_RequestComplete
#define NO_fun_SP_HW_DPC_ROUTINE
#define NO_fun_DRIVER_CANCEL 
#define NO_fun_IO_COMPLETION 
#define NO_SRB_WMI
