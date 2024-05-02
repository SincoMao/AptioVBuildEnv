

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;
using Microsoft.WDTF;


   class SimpleIoSample
   {
        static void Main(string[] args)
        {


        String DeviceQuery = "IsDevice";
           
        //
        //  Process args 
        //         


        if (args.Length < 1)        
        {

        Console.WriteLine(" No Params\n" );
                 
        }
        else
        {

            String Param = args[0].ToString().ToUpper(new CultureInfo("en-US", false));

            switch (Param)
                {
                     case "/DQ:":
                        DeviceQuery = args[1].ToString();;
                        break;
                            
                }
                  
        }



     //
     //   Create WDTF Object 
     //
 
     IWDTF2 WDTF = new WDTF2Class();

     //
     //  Query for devices.
     //

     IWDTFTargets2 Devices = WDTF.DeviceDepot.Query(DeviceQuery);
     
    //
    //  Return if query didn't return any devices
    //
    
    if (Devices.Count == 0) return;
     

     //
     //  Get EDT interface
     //

     IWDTFEnhancedDeviceTestSupportActions2 Edt = (IWDTFEnhancedDeviceTestSupportActions2)Devices.GetInterfacesIfExist("EDT");


     //
     //  Enable EDT support 
     //

     Edt.Enable();

     //
     //  Start test case 
     //

     WDTF.Log.StartTestCase(" Perfrom PNP Surpise remove");


     //
     //  Get PNP interface
     //

     IWDTFPNPActions2 Pnp = (IWDTFPNPActions2)Devices.GetInterfacesIfExist("PNP");


     //
     //  Perfrom PNP Surpise remove
     //


    Pnp.EDTSurpriseRemoveDevice();
    Pnp.RestartDevice();

   
    //
    //  End test case.
    //

    WDTF.Log.EndTestCase();

    }
}