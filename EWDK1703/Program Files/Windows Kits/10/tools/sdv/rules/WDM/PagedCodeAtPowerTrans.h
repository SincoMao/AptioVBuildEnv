#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"
#if (dopowerpagable_SDV_RESULT == SDV_PASSED || dopowerpagable_SDV_RESULT == SDV_NA)
  #define SDV_HARNESS SDV_FLAT_DISPATCH_HARNESS_WITH_SET_QUERY_POWER_IRPS_ONLY
#else
  #pragma message("SDV_NA")  
#endif
#else
#pragma message("dopowerpagable==SDV_PASSED,SDV_NA")
#endif
