#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"
#if (purekmdfdriver_SDV_RESULT == SDV_NA)
  #define SDV_HARNESS SDV_WDF_FLAT_SIMPLE_HARNESS
#else
  #pragma message("SDV_NA")  
#endif
#else
#pragma message("purekmdfdriver==SDV_NA")
#endif
