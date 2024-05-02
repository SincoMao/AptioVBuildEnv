#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"
#if (purekmdfdriver_SDV_RESULT == SDV_NA && (manualqueuedispatching_SDV_RESULT == SDV_PASSED||manualqueuedispatching_SDV_RESULT == SDV_NA))
   #define SDV_HARNESS SDV_HARNESS_PNP_DEFERRED_IO_REQUESTS
#else
  #pragma message("SDV_NA")  
#endif
#else
#pragma message("purekmdfdriver==SDV_NA")
#pragma message("manualqueuedispatching==SDV_PASSED,SDV_NA")
#endif
