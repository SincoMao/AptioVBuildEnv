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
// Project->DSDTSample properties->Build->Target Platform-> Change this the correct version of AcpiGenFx.dll
//

using AutoAcpi;

namespace Samples
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

            //ArmPlatform Platform = Platforms.CreateArmPlatform(
            x86Platform Platform = Platforms.Createx86Platform(
                OEMID: "MSFT",
                OEMTableID: "EDK2",
                CreatorID: "MSFT",
                Revision: 1, FileName: "DSDT"
                );

            //
            // Set PSCI bit - This is only Avaialble for Arm platforms
            //
            // Platform.PSCISupported = true;

            #region PROC
            Register reg0_1, reg0_2, reg0_3;
            Processor CPU0 = Platform.AddProcessor("CPU0", 0);
            reg0_1 = new Register(RegisterType.SystemIO, 8, 0, 0x161);
            CPU0.AddCState(1, 20, 1000, reg0_1); // C1 State
            reg0_2 = new Register(RegisterType.SystemIO, 8, 0, 0x162);
            CPU0.AddCState(2, 40, 750, reg0_2);  // C2 State
            reg0_3 = new Register(RegisterType.SystemIO, 8, 0, 0x163);
            CPU0.AddCState(3, 60, 500, reg0_3);  // C3 State

            Processor CPU1 = Platform.AddProcessor("CPU1", 1);
            Register reg1_1, reg1_2, reg1_3;
            reg1_1 = new Register(RegisterType.SystemIO, 8, 0, 0x164);
            CPU1.AddCState(1, 20, 1000, reg1_1); // C1 State
            reg1_2 = new Register(RegisterType.SystemIO, 8, 0, 0x165);
            CPU1.AddCState(2, 40, 750, reg1_2);  // C2 State
            reg1_3 = new Register(RegisterType.SystemIO, 8, 0, 0x166);
            CPU1.AddCState(3, 60, 500, reg1_3);  // C3 State

            Processor CPU2 = Platform.AddProcessor("CPU2", 2);
            Register reg2_1, reg2_2, reg2_3;
            reg2_1 = new Register(RegisterType.SystemIO, 8, 0, 0x167);
            CPU2.AddCState(1, 20, 1000, reg2_1); // C1 State
            reg2_2 = new Register(RegisterType.SystemIO, 8, 0, 0x168);
            CPU2.AddCState(2, 40, 750, reg2_2);  // C2 State
            reg2_3 = new Register(RegisterType.SystemIO, 8, 0, 0x169);
            CPU2.AddCState(3, 60, 500, reg2_3);  // C3 State


            Processor CPU3 = Platform.AddProcessor("CPU3", 3);
            Register reg3_1, reg3_2, reg3_3;
            reg3_1 = new Register(RegisterType.SystemIO, 8, 0, 0x16a);
            CPU3.AddCState(1, 20, 1000, reg3_1); // C1 State
            reg3_2 = new Register(RegisterType.SystemIO, 8, 0, 0x16b);
            CPU3.AddCState(2, 40, 750, reg3_2);  // C2 State
            reg3_3 = new Register(RegisterType.SystemIO, 8, 0, 0x16c);
            CPU3.AddCState(3, 60, 500, reg3_3);  // C3 State

            Platform.AddProcessorAggregator("AGR0");

            //
            // ADD Low Power Idle States to the Platform - only on X86 Socs
            //

            Platform.AddLowPowerIdleState(0, 0x100000, 0xffff000, reg0_1);
            Platform.AddLowPowerIdleState(1, 0x100000, 0xffff000, reg1_2);
            Platform.AddLowPowerIdleState(2, 0x100000, 0xffff000, reg2_3);
            Platform.AddLowPowerIdleState(3, 0x100000, 0xffff000, reg3_1);

            #endregion

            #region UsbDebug

            //
            // This Sections how to add USB Contoller to DSDT and generating DBG2 Table.
            //

            XhciUsbController usb1 = Platform.AddXhciUsbController("USB1", "XHCICONT", 0);
            usb1.Description = "USB Controller with Debug Support";
            
            //
            // Add Resources to the USB Contoller. 
            //

            Memory32Fixed mem = usb1.AddMemory32Fixed(true, 0xf9000000, 0xfffff, "");
            usb1.AddMemory32Fixed(true, 0xf7000000, 0xfffff, "");
            usb1.AddInterrupt(InterruptType.Level, InterruptActiveLevel.ActiveHigh, SharingLevel.Shared, 0x8);
            usb1.AddInterrupt(InterruptType.Level, InterruptActiveLevel.ActiveHigh, SharingLevel.Shared, 0x9);
            
            //
            // Will mark the usb controller supports Debugging and automatically generate Dbg2 table
            //

            usb1.DebugEnabled = true; 
            mem.DebugAccessSize = DebugAccessSize.DWordAccess;

            //
            // Will Add dependencies based on the provider info. In this Example
            // USB controller have dependencies to PEP and GPIO Controller.
            //

            usb1.ProviderName = "PEP0,GPI0";

            #endregion UsbDebug

            #region DebugDevices

            //
            // This section shows how to add UART debug devices to DSDT.
            //

            SerialPort sp0 = Platform.AddSerialPort(SerialPortType.PL011UART, "UART", "HID3123", 4);
            sp0.DebugEnabled = true;
            sp0.AddMemory32Fixed(true, 0xf9000000, 0xfffff, "");
            sp0.AddMemory32Fixed(true, 0xf7000000, 0xfffff, "");
            sp0.AddInterrupt(InterruptType.Level, InterruptActiveLevel.ActiveHigh, SharingLevel.Shared, 0x8);
            sp0.AddInterrupt(InterruptType.Level, InterruptActiveLevel.ActiveHigh, SharingLevel.Shared, 0x9);
            
            //
            // This section shows how to add Serial debug devices to DSDT.
            //

            SerialPort sp1 = Platform.AddSerialPort(SerialPortType.Serial, "NSP0", "HID3123", 8);
            sp1.AddDebugMemory32Fixed(true, 0xf123a, 0x123, "MEM", DebugAccessSize.DWordAccess, 0x1, 0x1);
            sp1.AddInterrupt(InterruptType.Level, InterruptActiveLevel.ActiveHigh, SharingLevel.Shared, 0x8);
            sp1.AddInterrupt(InterruptType.Level, InterruptActiveLevel.ActiveHigh, SharingLevel.Shared, 0x9);

            //
            // This section shows how to add KDNET debug device to DSDT.
            //

            KDNet2Usb kdp = Platform.AddKDNet2Usb("KDO0", "HID12331", 0, 0x1234);
            kdp.DebugEnabled = true;

            #endregion DebugDevices

            #region UsbDeviceTree

            //
            // This Sections how to add USB Contoller to DSDT and adding child devices to Usb Controller.
            //

            EhciUsbController usb2 = Platform.AddEhciUsbController("USB2", "EHCICONT", 0);
            usb2.Description = "USB Controller without Debug Support";

            //
            // Add dependency info and resources to the controller.
            //

            usb2.ProviderName = "PEP0";
            usb2.AddMemory32Fixed(true, 0xf8000000, 0xaf, "");
            usb2.AddInterrupt(InterruptType.Level, InterruptActiveLevel.ActiveHigh, SharingLevel.Shared, 0x10);
            usb2.AddGPIOInterrupt(InterruptType.Edge, InterruptActiveLevel.ActiveHigh, SharingLevel.Exclusive, PinConfiguration.Up, 0, 0x32, "GPI0");

            //
            // Adding USB Wake Information.
            //

            usb2.S0W = DeviceState.D3hot;

            //
            // Add USB Hub and add 2 Children to the Hub.
            //

            UsbDevice rhub = usb2.AddUsbDevice("DEV1", 0);
            rhub.AddUsbDevice("DEV2", 2);
            rhub.AddUsbDevice("DEV3", 3);

            #endregion UsbDeviceTree

            #region ButtonArray

            //
            // This sections shows how to add buttons used in windows platforms to DSDT.
            // Button Array supports adding buttons like Windows Home button, Back button,
            // Vol +/-, Power button, Rotation Lock, Search Button etc.,
            //

            ButtonArrayDevice btn = Platform.AddButtonArrayDevice("BTN1", "BTNDEV", 0);
            btn.AddPowerButton(10, "GPI0", PinConfiguration.Up);
            btn.AddSearchButton(11, "GPI0", PinConfiguration.Down);
            btn.AddVolumeDownButton(12, "GPI0", PinConfiguration.Down);

            #endregion ButtonArray

            #region PEP

            //
            // This sections how how to add Pep device to DSDT. This section also demostrates 
            // how to use packages and implement static functions.
            //

            Package p, p1;// p2;
            PEPDevice pep0 = Platform.AddPepDevice("PEP0", "PEPDEV", 0);

            //
            // Add Resources to the PEP device.
            //

            pep0.AddInterrupt(InterruptType.Edge, InterruptActiveLevel.ActiveHigh, SharingLevel.Exclusive, 0x12);
            pep0.AddInterrupt(InterruptType.Edge, InterruptActiveLevel.ActiveHigh, SharingLevel.Exclusive, 0x13);
            pep0.AddInterrupt(InterruptType.Edge, InterruptActiveLevel.ActiveHigh, SharingLevel.Exclusive, 0x14);
            pep0.AddInterrupt(InterruptType.Edge, InterruptActiveLevel.ActiveHigh, SharingLevel.Exclusive, 0x15);
            pep0.AddMemory32Fixed(true, 0xfc428000, 0x4000, "");

            //
            // Implement a method which returns Package(s).
            //

            pep0.AddMethod("CINF").Value = (p = new Package());
                p.add(p1 = new Package());
                    p1.add("\\\\_SB_.CPU0");
                    p1.add(0x10);
                p.add(p1 = new Package());
                    p1.add("\\\\_SB_.CPU1");
                    p1.add(0x11);
                p.add(p1 = new Package());
                    p1.add("\\\\_SB_.CPU2");
                    p1.add(0x12);
                p.add(p1 = new Package());
                    p1.add("\\\\_SB_.CPU3");
                    p1.add(0x13);

            //
            // Shows how to implement a method which reurns a static Integer.
            //

            pep0.AddMethod("PINF").Value = 4;

            //
            // Shows how to implement a method which return byte array.
            //

            pep0.AddMethod("RINF").Value = new Byte[] { 0x10, 0x20, 0x30, 0x40 };

            //
            // Shows how to implement a method which returns string.
            //

            pep0.AddMethod("SINF").Value = "TEST_PEP";

            #endregion PEP

            #region TZ

            //
            // This section shows how to implement Thermal Zones.
            //

            ThermalZone tz = Platform.AddThermalZone("TZ0_");
            tz.ThermalConstant1_TC1 = 1;
            tz.ThermalConstant2_TC2 = 2;
            tz.ThermalSamplingPeriod_TSP = 0xa;
            tz.ThermalZonePollingPeriod_TZP = 0;
            tz.ThermalZoneDevices_TZD = "CPU0,CPU1,CPU2,CPU3";
            tz.PassiveCoolingValue_PSV = 0xe60;

            #endregion TZ

            #region RTC

            //
            // This section shows how to implement Acpi Time and Alarm device.
            //

            RTCDevice rtc = Platform.AddRTCDevice("RTCD");

            #endregion RTC

            #region GpioController

            //
            // This section shows how to add GPIO Controller to DSDT.
            //

            GpioController gpc = Platform.AddGpioController("GPI0", "GPIOCONT", 0);

            //
            // Add dependency information. GPIO Controller depends on PEP in this example.
            //

            gpc.ProviderName = "PEP0";

            //
            // Add resources to the GPIO Controller.
            //

            gpc.AddMemory32Fixed(true, 0xfd510000, 0x2000, "");
            gpc.AddInterrupt(InterruptType.Level, InterruptActiveLevel.ActiveHigh, SharingLevel.Shared, 0x16);

            #endregion GpioController

            #region SdController

            //
            // This section shows how to add SD Controller to DSDT.
            //

            SdHostController sd = Platform.AddSdHostController("SDC1", "SDCHOST", 0);
            sd.ProviderName = "PEP0";

            #endregion SdController

            #region Battery
            
            //
            // This section shows how to add Battery to DSDT.
            //

            BatteryDevice bat = Platform.AddBatteryDevice("BAT1", 1);
            bat.ThermalLimit = 10;

            #endregion Battery

            #region DisplaySensor

            //
            // This section shows how to add Display sensor to DSDT.
            //

            DisplaySensor dis = Platform.AddDisplaySensor("DISP", "DISPSENS");
            dis.ProviderName = "PEP0";

            #endregion DisplaySensor

            #region ACAdapter

            //
            // This section shows how to add AC Adapter to DSDT.
            //

            ACAdapter ac = Platform.AddACAdapter("ACA");

            #endregion ACAdapter

            #region HidI2c

            //
            // This section shows how to add HID I2C Device to DSDT.
            // In this case its an ATML touch device.
            //

            HidOverI2C hid = Platform.AddHidI2CDevice("TCH", "ATML1000", 1);
            hid.AddI2CSerialBus(0xf, SlaveMode.ControllerInitiated, 0xffff, AddressMode._7Bit, "I2C1");

            #endregion HidI2c

            #region I2CController

            //
            // This section shows how to add I2C Controller to DSDT.
            //

            I2CController i2c = Platform.AddI2CController("I2C1", "I2CCONTR", 0);
            i2c.AddMemory32Fixed(true, 0xf9999000, 0x400, "");
            i2c.AddInterrupt(InterruptType.Level, InterruptActiveLevel.ActiveHigh, SharingLevel.Exclusive, 40);

            #endregion I2CController

            #region GenericDevice
            
            //
            // This section shows how to add a generic device. Generic devices can be 
            // flexible and can be used to replace any type of internally supported devices
            // in the framework.
            //

            GenericDevice Gen1 = Platform.AddGenericDevice("GEN1", "ABC123", "", 0);
            GenericDevice Gen2 = Gen1.AddGenericDevice("GEN2", "ABC123", "", 1);

            #endregion GenericDevice

            #region Firmware

            //
            // MADT: Generates a MADT table for Arm Version
            //

            // Platform.MadtBaseAddress = 0xEFC213;
            // Platform.AddInterruptControler(CPU0, InterruptType.Edge, 0, 2, 15, 0x1D4F, 0x34DFCD);
            // Platform.AddInterruptControler(CPU1, InterruptType.Edge, 3, 2, 17, 0x52DE, 0x12DCEE);
            // Platform.AddInterruptExtender(0xCD312, 0xFCC234, 13);

            //
            // Madt Table for X86 Soc
            //

            Platform.MadtBaseAddress = 0xEFC213;
            Platform.AddInterruptController(CPU0, 0);
            Platform.AddInterruptController(CPU1, 2);
            Platform.AddInterruptExtender(5, 0xFA23, 7);


            //
            // GTDT: Generates a GTDT table.
            //

            Timers timers = Platform.AddTimers(InterruptType.Edge, 0x1242FE);
            timers.ConfigureTimer(TimerType.PL1, InterruptType.Edge, InterruptActiveLevel.ActiveLow, 10);
            timers.ConfigureTimer(TimerType.NPL1, InterruptType.Edge, InterruptActiveLevel.ActiveLow, 5);
            timers.ConfigureTimer(TimerType.VT, InterruptType.Level, InterruptActiveLevel.ActiveLow, 11);
            timers.ConfigureTimer(TimerType.NPL2, InterruptType.Edge, InterruptActiveLevel.ActiveLow, 21);

            //
            // CSRT: Creates an Entry into DSDT aswell as generate a CSRT Table.
            //

            Byte[] info = { 0x00, 0x10, 0x20, 0x30, 0x40, 0x50, 0x60 };
            CoreSystemDevice core = Platform.AddCoreSystemDevice("ABC1", "MSFT123", 2, 1, info);
            core.AddTimerCoreSystemResource(1, info);

            #endregion

            //
            // Generates firmware tables.
            //

            Platform.WriteAsl();
        }
    }
}
