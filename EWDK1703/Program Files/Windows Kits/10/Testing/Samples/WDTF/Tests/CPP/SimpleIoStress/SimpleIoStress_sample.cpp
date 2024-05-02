//------------------------------------------------------------------------------
//
// Copyright (C) 2011 Microsoft Corporation. All Rights Reserved.
//
// Project: C++ Sample for using SimpleIOStressEx
//
//
//------------------------------------------------------------------------------

//
//  Include 
//

#include "windows.h"
#include <atlbase.h>
#include <atlcom.h>
#include <atlstr.h>
#include <atlsafe.h>
#include <stdlib.h>
#include <conio.h>


#include "ts_ARG_TOKEN.h"

#import  <WDTF.tlb>
#include "WDTF.h"
#include "WDTFInterfaces.h"




#define WCE(x) \
hr = (x);\
if(FAILED(hr)) \
    { \
    wprintf(L"ERROR %s 0x%lx \n", L#x , hr); \
    CoUninitialize();\
    return hr; \
    }\

void
Help(
    void)
    {
    wprintf(L" C++ Sample for SimpleIOStressEx.\n");
    wprintf(L"\n");
    wprintf(L" SimpleIoStress_sample [/DQ: sdel]");
    }
    


int __cdecl wmain(int argc, PCWSTR *argv)
    {

    //
    //   Locals 
    //

    CARG_TOKEN ArgToken (argc-1,&(argv[1]));
    HRESULT hr;
    CString psDq = L"IsDevice";
        
    //
    //  Process args
    //

    if(ArgToken.Comp(L"/?"))
        {
        Help();
        return ERROR_INVALID_PARAMETER;
        }

    
    if (ArgToken.Comp(L"/DQ:"))
        {

        if(!ArgToken.Next())
            {
            wprintf(L" No value for /DQ: \n" );
            return ERROR_INVALID_PARAMETER;
            }

        psDq = psDq + L" AND " + ArgToken.GetAsString();

        }
    


    //
    //  Init WDTF 
    //

    WCE(  CoInitializeEx(NULL, COINIT_MULTITHREADED) );

    {

    CComPtr<IWDTF2> pWDTF;
    WCE(  pWDTF.CoCreateInstance(__uuidof(WDTF2)) )


    //
    //  Get Log object
    //

    CComPtr<IWDTFLOG2> pLog;
    WCE(  pWDTF->get_Log(&pLog) );

    //
    //  Get DeviceDepot object
    //

    CComPtr<IWDTFDeviceDepot2> pDeviceDepot;
    WCE(  pWDTF->get_DeviceDepot(&pDeviceDepot) );

    //
    //  Query for devices
    //

    CComPtr<IWDTFTargets2> pTargets;
    WCE(  pDeviceDepot->Query( CComBSTR(psDq) ,&pTargets) );
    
    //
    // If no target devices are found then exit test. 
    //
    LONG lTargetsCount = 0;
    WCE(pTargets->get_Count(&lTargetsCount));
    if (lTargetsCount <= 0) 
    {
      return 0;
    }    
  

    //
    //  Get Simple I/O Stress tests for devices
    //

    CComPtr<IWDTFActions2> pActions;
    WCE(  pTargets->GetInterfacesIfExist( CComBSTR(L"SimpleIOStressEx") , CComVariant(), CComVariant(), &pActions));

    CComPtr<IWDTFSimpleIOStressActions2> pSimpleIoStress;
    WCE( pActions->QueryInterface(&pSimpleIoStress));


    //
    // Start test case 
    //

    pLog->StartTestCase( CComBSTR(L"Start Device I/O") );

    //
    //  Start I/O 
    //

    VARIANT_BOOL bIOResult;

    WCE( pSimpleIoStress->Start(&bIOResult) );

    //
    //  Wait a bit 
    //

    Sleep(10000);

    //
    //  Stop I/O 
    //

    WCE( pSimpleIoStress->Stop(&bIOResult) );

    //
    // End Test Case 
    //

    pLog->EndTestCase();


    }

    CoUninitialize();

    return 0;
    }

