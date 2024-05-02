@if (1 == 0) @end /*
@cscript.exe //E:JScript //nologo "%~f0" "%~dp0" %*
@goto :eof
*/
// Copyright (c) Microsoft Corporation. All rights reserved.
//
// Remarks:
//   This script copies the Windows Device Testing Framework to a test machine. Then
// it registers the framework with the local system.
//
// Usage: "InstallWDTF.cmd [/InstallPath:"<InstallPath>"] [options]"
//
//        <InstallPath>    - Defaults to "%SystemDrive%\WDTF". Be sure to encase in double-quotes
//                           to accomodate paths that contain spaces.
//
// Options:
//        /NoRegister      - Does not run "redist\RegisterWDTF.exe" after all files have been copied.
//
//        /NoSampleScripts - Won't copy the "SampleScripts" directory.
//
//        /jobs            - Causes the "Jobs" directory to be copied as well.
//
//        /UnitTest        - Causes the "UnitTest" directory to be copied as well.
//
// Pre-conditions:
//   None.
//
//




var oShell = new ActiveXObject("WScript.Shell");

// Whole script is encased in Try/Catch
try
{
    var strRunPath = WScript.Arguments(0);

    var strInstallPath = "%SystemDrive%\\WDTF\\";

    var bAutomaticMode = false;

    if(WScript.Arguments.Named.Exists("InstallPath"))
    {
        strInstallPath = HackSlash(WScript.Arguments.Named("InstallPath")) + "\\";
        bAutomaticMode = true;
    }
    else
    {

        var BtnCode = oShell.Popup("This script is about to install the Windows Device Testing Framework from \"" +
                                   HackSlash(strRunPath) + "\" and to \"" + HackSlash(strInstallPath) + "\". Is this OK? " + 
                                   "This message box will remain for 1 minute before" +
                                   " defaulting to 'Yes'." , 60, "Confirm WDTF Installation Path:", 4 + 32)
        switch(BtnCode)
        {
           case 6:
           case -1:
              break;
           case 7:
              WScript.Quit(1);
              break;
        }

    }

    XCopy(strRunPath + "redist", strInstallPath + "redist");
    Copy(strRunPath + "InstallWDTF.cmd", strInstallPath);

    if(WScript.Arguments.Named.Exists("Jobs"))
    {
        XCopy(strRunPath + "Jobs", strInstallPath + "Jobs");
    }

    if(!WScript.Arguments.Named.Exists("NoSampleScripts"))
    {
        XCopy(strRunPath + "SampleScripts", strInstallPath + "SampleScripts");
    }

    if(WScript.Arguments.Named.Exists("UnitTest"))
    {
        XCopy(strRunPath + "UnitTest", strInstallPath + "UnitTest");
    }

    if(!WScript.Arguments.Named.Exists("NoRegister"))
    {
        try
        {
            var oExecRegister = oShell.Exec("\"" + strInstallPath + "redist\\RegisterWDTF.exe\"");
        }
        catch(e)
        {
            throw new Error(e.number, "Error executing RegisterWDTF.exe: " + e.description);
        }


        while(oExecRegister.Status == 0)
        {
            while (!oExecRegister.StdOut.AtEndOfStream)
            {
                WScript.StdOut.Write(oExecRegister.StdOut.Read(1));
            }
        
            WScript.Sleep(100);
        }
        while (!oExecRegister.StdOut.AtEndOfStream)
        {
            WScript.StdOut.Write(oExecRegister.StdOut.Read(1));
        }
        

        if(oExecRegister.ExitCode != 0)
        {
            throw new Error(oExecRegister.ExitCode, "RegisterWDTF.exe failed to register WDTF for use. See output for more details.");
        }
    }
}
catch(e)
{
    if (!bAutomaticMode)
    {
        oShell.Popup("Installation of WDTF failed. Error Code: " + e.number + "\nDescription: " + e.description,
             0, "WDTF Installation FAILED!",
             16);
    }
    else
    {
        WScript.StdOut.Write("Installation of WDTF failed. Error Code: " + e.number + "\nDescription: " + e.description);
    }
    WScript.Quit(1);
             
}

if(!bAutomaticMode)
{
    oShell.Popup("Installation of WDTF is Complete.",
                 600, "WDTF Installation",
                 0);
                 
    WScript.Quit(0);
}


//
// This method is used to copy a whole directory (including subdirectories).
//
function XCopy(strFrom, strTo)
{
    try
    {
        var oExecXCopy = oShell.Exec("XCOPY \"" + strFrom + "\" \"" + strTo + "\" /E /Y /R /F /I");
    }
    catch(e)
    {
        throw new Error(e.number, "XCopy(\"" + strFrom + "\", \"" + strTo + "\") -> " + e.description);
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
}


//
// This method is used to copy a single file
//
function Copy(strFrom, strTo)
{
    try
    {
        var oExecCopy = oShell.Exec("XCOPY /Y \"" + strFrom + "\" \"" + strTo + "\"");
    }
    catch(e)
    {
        throw new Error(e.number, "Copy(\"" + strFrom + "\", \"" + strTo + "\") -> " + e.description);
    }


    while(oExecCopy.Status == 0)
    {
        WScript.Sleep(100);
    }
}


//
// If strPath has a terminate slash,
// HackSlash removes it and returns the result
//
function HackSlash(strPath)
{
    var len = strPath.length;
    if (len > 0 && strPath.charAt(len-1) == '\\')
    {
        return(strPath.substr(0, len-1));
    }
    return strPath;
}
