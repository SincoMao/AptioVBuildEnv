@if (1 == 0) @end /*
@cscript.exe /E:jscript /nologo "%~f0" "%~dp0" %*
@goto :eof
*/

// Copyright (c) Microsoft Corporation. All rights reserved.
//
// Remarks:
//   This script installs the WDTF Visual C++ Application/Code Wizards.
// Once they are installed, re-open Visual C++ and create a new Visual C++ "WDTF" project.
//
// Usage: "InstallWizard.cmd"
//
// Pre-conditions:
//   You must have Visual C++ 2008 installed.
//
//

var oShell = new ActiveXObject("WScript.Shell");

var strVCPath = "";


// Find where Visual C++ 2008 is installed
try
{
    strVCPath = oShell.RegRead("HKLM\\SOFTWARE\\Microsoft\\VisualStudio\\SxS\\VC7\\9.0");
}
catch(e)
{
    oShell.Popup("Visual C++ 2008 does not appear to be installed, please install it before running this installer.",
                 0, "Error Installing WDTF Visual C++ Application/Code Wizards",
                 16);
    WScript.Quit(1);
}

try
{
    strVCPath = oShell.RegRead("HKLM\\SOFTWARE\\Wow6432Node\\Microsoft\\VisualStudio\\SxS\\VC7\\9.0");
}
catch(e)
{
    // Ignore failure case (we're probably just running on a 32bit machine.
}

// Copy the files to strVCPath
try
{
    var oExecXCopy = oShell.Exec("XCOPY \"" + WScript.Arguments(0) + "VC\" \"" + strVCPath + "\" /E /Y /R /I /F");
}
catch(e)
{
    WScript.Echo("Error executing XCOPY: #(" + e.number + ") - " + e.description);
    WScript.Quit(2);
}


while(oExecXCopy.Status == 0)
{
    while (!oExecXCopy.StdOut.AtEndOfStream)
    {
        WScript.StdOut.Write(oExecXCopy.StdOut.Read(1));
    }
    
    WScript.Sleep(100);
}
while (!oExecXCopy.StdOut.AtEndOfStream)
{
    WScript.StdOut.Write(oExecXCopy.StdOut.Read(1));
}


oShell.Popup("Installation of WDTF Visual C++ Application/Code Wizards Complete. You should see at least 50 total files copied.",
             0, "Installation Complete.",
             0);