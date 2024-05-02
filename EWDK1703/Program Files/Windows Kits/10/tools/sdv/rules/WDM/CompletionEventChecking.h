
#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"
#if (iocompletion_SDV_RESULT == SDV_FAILED)
   #define SDV_HARNESS SDV_FLAT_SIMPLE_HARNESS
#else
  #pragma message("SDV_NA")  
#endif
#else
#pragma message("iocompletion==SDV_FAILED")
#endif
