#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"

#if (aliaswithintimerdpc_SDV_RESULT == SDV_FAILED && aliaswithindispatch_SDV_RESULT == SDV_FAILED && purekmdfdriver_SDV_RESULT == SDV_NA&&(manualqueuedispatching_SDV_RESULT == SDV_PASSED||manualqueuedispatching_SDV_RESULT == SDV_NA))
   #define SDV_HARNESS SDV_HARNESS_PNP_DEFERRED_IO_REQUESTS
#else
  #pragma message("SDV_NA")
#endif
#else
#pragma message("aliaswithintimerdpc==SDV_FAILED")
#pragma message("aliaswithindispatch==SDV_FAILED")
#pragma message("purekmdfdriver==SDV_NA")
#pragma message("manualqueuedispatching==SDV_PASSED,SDV_NA")
#endif



