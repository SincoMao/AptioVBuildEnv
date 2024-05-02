#ifndef SDV_PRE_RUN
#include "..\..\sdv-pre-results.h"

#if (pre_isminiport_SDV_RESULT == SDV_FAILED&&pre_nokmdfdispatch_SDV_RESULT == SDV_FAILED)
  #define SDV_MP_FLAG 1  
#else
  #define SDV_MP_FLAG 0
#endif

#if (pre_isprotocol_SDV_RESULT == SDV_FAILED&&pre_nokmdfdispatch_SDV_RESULT == SDV_FAILED)
  #define SDV_PROT_FLAG 1  
#else
  #define SDV_PROT_FLAG 0
#endif

#if  (pre_islwf_SDV_RESULT == SDV_FAILED&&pre_nokmdfdispatch_SDV_RESULT == SDV_FAILED)
  #define SDV_LWF_FLAG 1
#else
  #define SDV_LWF_FLAG 0
#endif  

#if  ((SDV_MP_FLAG == 0) && (SDV_PROT_FLAG == 0) && (SDV_LWF_FLAG == 0))
  #pragma message("SDV_NA")
#else
  #define Set_Harness
#endif 

#else
#pragma message("pre_isminiport==SDV_FAILED")
#pragma message("pre_isprotocol==SDV_FAILED")
#pragma message("pre_islwf==SDV_FAILED")
#pragma message("pre_nokmdfdispatch==SDV_FAILED")
#endif

