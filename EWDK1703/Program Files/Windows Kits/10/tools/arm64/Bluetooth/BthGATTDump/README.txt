Bluetooth GATT Database Viewer (BthGATTDump.exe)

The Bluetooth GATT Database Viewer tool displays the Bluetooth Device's Generic Attribue Profile information as Microsoft Windows interprets it.  Data retrieved from the device is displayed in the console in a tree like recursive manner for all the services, characteristics and descriptors present on the device.
BthGATTDump displays one attribute on each line starting with the first Service, continuing with Characteristics and Descriptors. 

GATT Services are displayed as:
[Service] Handle=<ATT Handle> Type=<Service UUID>(<Service Friendly Name), where:
-   ATT Handle – represents the Attribute handle for the service.
-   Service UUID – represents the UUID that uniquely identifies the type of service as defined by the Bluetooth SIG or device manufacturer in the case of custom services.
-   Service Friendly Name – represents the friendly name of the service if it is a Bluetooth SIG well defined service (e.g.: “Heart Rate”).

GATT Characteristics are displayed as:
[Characteristic] Handle=<ATT Handle> Type=<Characteristic UUID>(<Characteristic Friendly Name), where:
-   ATT Handle – represents the Attribute handle for the characteristic
-   Characteristic UUID – represents the UUID that uniquely identifies the type of characteristic as defined by the Bluetooth SIG or device manufacturer in the case of custom characteristics.
-   Characteristic Friendly Name - represents the friendly name of the characteristic if it is a Bluetooth SIG well defined service (e.g.: “Heart Rate Measurement”).
Following each Characteristic the Characteristic Value is displayed as:
[Value] <Characteristic Value>

GATT Descriptors are displayed as:
[Descriptor] Handle=<ATT Handle> Type=<Descriptor Type>(<Friendly Name>)
-   ATT Handle –represents the Attribute handle for the descriptor
-   Descriptor UUID – represents the UUID that uniquely identifies the type of descriptor as defined by the Bluetooth SIG or device manufacturer in the case of custom descriptors.
-   Descriptor Friendly Name - represents the friendly name of the descriptor if it is a Bluetooth SIG well defined service (e.g.: “Client Characteristic Configuration”).

To run the tool simply run BthGATTDump.exe [-v]
    v - Generates verbose output

If only one Bluetooth GATT device is paired with Windows, BthGATTDump will automatically display information for your device, when it is invoked from the command line.
If more than one device is paired with Windows, BthGATTDump will allow the user to specify the device for which information is to be displayed.

This tool is not a replacement for any portion of the Bluetooth SIG’s Qualification process or for the Microsoft Windows Logo Program.  It is provided as is to troubleshoot interactions between a device and Microsoft Windows.
