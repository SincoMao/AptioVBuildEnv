

DeviceQuery = "IsPhantom='false'"


if WScript.Arguments.Named.Exists("DQ") then 

    DeviceQuery = DeviceQuery & " AND " & WScript.Arguments.Named("DQ")

End if



'
' Create WDTF object
'


Set WDTF = WScript.CreateObject("WDTF2.WDTF")

'
'  Query DeviceDepot for most devices.
'


Set DeviceCollection = WDTF.DeviceDepot.Query(DeviceQuery) ' 


'
'   Enumerate device in DeviceCollection
'

For Each Device In DeviceCollection


    '
    ' Output info on found device
    '

    WDTF.Log.OutputInfo "DeviceID:     " & Device.GetValueString("DEVICEID")
    WDTF.Log.OutputInfo "DisplayName:  " & Device.GetValue("DisplayName")
    WDTF.Log.OutputInfo "SymbolicLink: " & Device.GetValue("SymbolicLink")
    WDTF.Log.OutputInfo "Class:        " & Device.GetValue("class")
    WDTF.Log.OutputInfo "Status        " & Device.GetValue("StatusString")

    Set Drivers = Device.GetValueStrings("DriverNames")
    WDTF.Log.OutputInfo "Drivers:" 
    For Each Driver  In Drivers 
       WDTF.Log.OutputInfo " " & Driver
    Next


    If Device.Eval("Class='Volume'") then 

       WDTF.Log.OutputInfo  "Volume Info: DriveLetter: " & Device.GetValue("volume::DriveLetter") 

       WDTF.Log.OutputInfo  "Volume Info: ExtentDiskNumbers"

       Set Des = Device.GetValueNumbers("volume::ExtentDiskNumbers")

       WDTF.Log.OutputInfo "Output " & Des.Count & " Numbers"

       For Each De  In Des 
         WDTF.Log.OutputInfo " " & De
       Next
     
    End if

    
    WScript.Echo ""
    WScript.Echo ""

Next


WScript.Echo "Found " & DeviceCollection.Count & " devices"



