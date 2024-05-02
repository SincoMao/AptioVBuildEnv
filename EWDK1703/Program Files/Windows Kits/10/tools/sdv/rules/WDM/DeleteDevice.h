#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"
  #if (checkbusdriver_SDV_RESULT == SDV_FAILED)
    #define IS_WDM_BUS_DRIVER
  #endif
  #if (checkirpmjpnp_SDV_RESULT == SDV_FAILED)
     #define SDV_HARNESS SDV_PNP_REMOVE_DEVICE_HARNESS
  #else
     #pragma message("SDV_NA")  
   #endif
#else
#pragma message("checkbusdriver==SDV_FAILED")
#pragma message("checkirpmjpnp==SDV_FAILED")
#endif

