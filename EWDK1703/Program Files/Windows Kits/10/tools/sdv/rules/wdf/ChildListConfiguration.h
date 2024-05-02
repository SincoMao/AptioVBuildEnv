#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"
#if (dynamicbus_SDV_RESULT==SDV_FAILED)
#define SDV_HARNESS SDV_WDF_FLAT_SIMPLE_AddDevice_HARNESS
#else
  #pragma message("SDV_NA")  
#endif
#else
#pragma message("dynamicbus=SDV_FAILED")
#endif



