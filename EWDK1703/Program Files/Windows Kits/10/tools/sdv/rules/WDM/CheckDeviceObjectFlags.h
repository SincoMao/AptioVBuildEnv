#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"
#if (checkbusdriver_SDV_RESULT == SDV_FAILED)
    #define SDV_DEVICE_FLAGS
    #define IS_WDM_BUS_DRIVER
    #define SDV_HARNESS SDV_PNP_HARNESS_SMALL
#else
    #pragma message("SDV_NA")  
#endif

#else
#pragma message("checkbusdriver==SDV_FAILED")
#endif
