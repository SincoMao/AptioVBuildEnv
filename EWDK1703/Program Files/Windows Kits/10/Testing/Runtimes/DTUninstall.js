/*
Copyright (c) 2011 Microsoft Corporation.  All Rights Reserved.
Driver Test Service Uninstall Script
*/

// Connect to WMI
var shell = WScript.CreateObject("WScript.Shell");
var logPath = shell.ExpandEnvironmentStrings("%TEMP%\\DTUninstall.log");
var fso = new ActiveXObject("Scripting.FileSystemObject");
var logFile = fso.CreateTextFile(logPath);
    
logFile.WriteLine("Connect to WMI...");
var wmiConnect = "winmgmts:{impersonationLevel=impersonate, (Shutdown)}!\\\\.\\root\\cimv2";
var wmiService = GetObject(wmiConnect);

// Delete local WDKRemoteUser
var localComputer = GetObject("WinNT://.");
localComputer.Delete("User", "wdkremoteuser");
logFile.WriteLine("User deleted");

// Get the OS object
var osCollection = wmiService.ExecQuery("Select * from Win32_OperatingSystem");

// Go through each OS object
for (var enumOs = new Enumerator(osCollection);
        !enumOs.atEnd();
        enumOs.moveNext()) {
    // Force logoff any users
    var os = enumOs.item();
    os.Win32Shutdown(6);
    logFile.WriteLine("Reboot initiated");
}
logFile.Close();


WScript.Quit(0);
