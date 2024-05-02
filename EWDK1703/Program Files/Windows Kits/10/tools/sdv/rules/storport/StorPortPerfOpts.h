

/*

#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"
#if (spcreate_SDV_RESULT == SDV_FAILED && checkhwstorport_SDV_RESULT == SDV_FAILED)
  #define SDV_HARNESS SDV_SP_FLAT_HARNESS
#else
  #pragma message("SDV_NA")  
#endif
#else
#pragma message("spcreate==SDV_FAILED")
#pragma message("checkhwstorport==SDV_FAILED")
#endif


*/

#define SDV_HARNESS SDV_SP_FLAT_HARNESS
