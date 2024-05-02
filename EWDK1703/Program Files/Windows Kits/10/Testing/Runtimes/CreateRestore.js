/*
Copyright (c) 2011 Microsoft Corporation.  All Rights Reserved.
Driver Test Service System Restore Point Creation Script
*/

// Initialize
var shell = WScript.CreateObject("WScript.Shell");
var logPath = shell.ExpandEnvironmentStrings("%SystemDrive%\\DriverTest\\Logs\\CreateRestorePoint.log");
var fso = new ActiveXObject("Scripting.FileSystemObject");
var logFile = fso.CreateTextFile(logPath);
var result = 0;

var wmi = GetObject("winmgmts:{impersonationLevel=impersonate}!\\\\.\\root\\default");
var collection = wmi.ExecQuery("select * from SystemRestore");
for (var enumPoint = new Enumerator(collection);
    !enumPoint.atEnd();
    enumPoint.moveNext()) {
    var restorePoint = enumPoint.item();
    if (null != restorePoint) {
        logFile.WriteLine("Restore Point: " + restorePoint.Description + ": " + restorePoint.SequenceNumber.toString());
    }
}

// Connect to WMI
logFile.WriteLine("Connect to WMI");
var wmiConnect = "winmgmts:{impersonationLevel=impersonate, (Shutdown)}!\\\\.\\root\\default:SystemRestore";

try {
    var wmiRestore = GetObject(wmiConnect);
    
    // Create the restore point
    logFile.WriteLine("Create provisioning system restore point");
    result = wmiRestore.CreateRestorePoint("Driver Test System Restore", 0, 100);

    if (0 == result) {
        // Create file name
        var now = new Date();
        var dateString = "Key-" + now.getUTCFullYear() + now.getUTCMonth() + now.getUTCDate() + now.getUTCHours() + now.getUTCMinutes() + now.getUTCSeconds() + now.getUTCMilliseconds();
        var keyName = "HKLM\\Software\\Microsoft\\Windows Kits\\WDK\\DriverTestRestore\\" + dateString + "\\";
        logFile.WriteLine("Registry Key: " + keyName);

        // Create registry entries for restore point
        shell.RegWrite(keyName, "");
        shell.RegWrite(keyName + "Year", now.getUTCFullYear(), "REG_SZ");
        shell.RegWrite(keyName + "Month", now.getUTCMonth(), "REG_SZ");
        shell.RegWrite(keyName + "Date", now.getUTCDate(), "REG_SZ");
        shell.RegWrite(keyName + "Hours", now.getUTCHours(), "REG_SZ");
        shell.RegWrite(keyName + "Minutes", now.getUTCMinutes(), "REG_SZ");
        shell.RegWrite(keyName + "Seconds", now.getUTCSeconds(), "REG_SZ");

        // End the restore point
        result = wmiRestore.CreateRestorePoint("Driver Test System Restore", 0, 101);

        if (0 == result) {
            logFile.WriteLine("Successfully create the system restore point");
        }
        else {
            logFile.WriteLine("Failed to create the system restore point.  Error Code: " + result.toString());
        }
    }
    else {
        logFile.WriteLine("Failed to create the system restore point.  Error code: " + result.toString());
    }
} catch (e) {
    result = e.number;
    logFile.WriteLine("Failed to create the system restore point");
    logFile.WriteLine("Error code: " + result.toString());
    logFile.WriteLine("Error message: " + e.description);
}

logFile.Write("Exit code: " + result.toString());
logFile.Close();

WScript.Quit(result);
