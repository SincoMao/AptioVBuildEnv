

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
     //  Get Simple I/O tests for all devices that have them. 
     //

     IWDTFActions2 Actions = Devices.GetInterfacesIfExist("SimpleIOEx");

     //
     //  Start test case 
     //

     WDTF.Log.StartTestCase("Start Simple I/O");

     //
     //  Do a litle bit of device testing. 
     //

     foreach (IWDTFSimpleIOEx2 SimpleIoEx in Actions)
        {

        SimpleIoEx.Open();
        SimpleIoEx.PerformIO();
        SimpleIoEx.Close();
        }
   
    //
    //  End test case.
    //

    WDTF.Log.EndTestCase();

    }
}