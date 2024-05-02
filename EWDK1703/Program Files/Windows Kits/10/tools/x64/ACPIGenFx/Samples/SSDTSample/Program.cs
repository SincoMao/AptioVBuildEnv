using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//
// Add Reference to AcpiGenFx in VS->Project->Add Reference->Navigate to folder and
// select AcpiGenFx.dll.
//

//
// Project->SSDTSample properties->Build->Target Platform-> Change this the correct version of AcpiGenFx.dll
//

using AutoAcpi;

namespace SSDTSample
{
    class Program
    {
        static void Main(string[] args)
        {

            //
            // Creating platform definition and intializing it with relevant information.
            // CreateArmPlatform and Createx86Platform produces same DSDT but some platform
            // specific information in FADT and other firmware tables will get generated
            // to the specifc platform.
            //

            x86Platform platform = Platforms.Createx86Platform(
          //ArmPlatform Platform = Platforms.CreateArmPlatform(
                OEMID: "MSFT",
                OEMTableID: "EDK2",
                CreatorID: "MSFT",
                Revision: 1,
                FileName: "SSDT"
                );

            //
            // Tell the frame work that this is an SSDT table.
            //

            platform.SSDT = true;

            //
            // Add sensor device to the SSDT.
            //

            var sensor = platform.AddGenericDevice("ADXL", "ACPI\\ADXL345Acc", 1);

            //
            // Add Resources to the sensor device.
            //

            sensor.AddI2CSerialBus(
                SlaveAddress: 0x1d, 
                Mode: SlaveMode.ControllerInitiated, 
                ConnectionSpeed: 400000,
                addressmode: AddressMode._7Bit, 
                controllername: "I2C1"
                );

            platform.WriteAsl();

        }
    }
}
