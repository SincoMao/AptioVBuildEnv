
#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"

#if ((manualqueuedispatching_SDV_RESULT == SDV_PASSED||manualqueuedispatching_SDV_RESULT == SDV_NA))
    #define SDV_HARNESS SDV_WDF_FLAT_SIMPLE_IO_HARNESS
#else
  #pragma message("SDV_NA")
#endif
#else
#pragma message("manualqueuedispatching==SDV_PASSED,SDV_NA")
#endif
