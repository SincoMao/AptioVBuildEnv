#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"
#if (fdodriver_SDV_RESULT == SDV_FAILED && notpowerpolicyowner_SDV_RESULT == SDV_PASSED && purekmdfdriver_SDV_RESULT == SDV_NA)
   #define SDV_HARNESS SDV_HARNESS_PNP_DEFERRED_IO_REQUESTS
#else
  #pragma message("SDV_NA")  
#endif
#else
#pragma message("fdodriver==SDV_FAILED")
#pragma message("notpowerpolicyowner==SDV_PASSED")
#pragma message("purekmdfdriver==SDV_NA")
#endif
