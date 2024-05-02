// Copyright (c) Microsoft Corporation. All rights reserved.
//
// Remarks:
//   This script is useful for using the WDK's WPP tracing infrastructure within a
// Visual C++ project. It must be run as a pre-build event with the following command line:
//      "CScript.exe VSTraceWpp.js $(InputFileName)"
// It then parses the *.vcproj file for all *.cpp files and runs the WPP pre-processor
// on them, generating *.tmh files for each.
//   Set the %LATEST_DDK_BIN% environment variable to override this 
// script's 'locate-the-WDK' logic.
//
// Pre-conditions:
//   You must have the WDK Build Environment installed.
//
//


if (WScript.Arguments.length == 0)
{
    WScript.Echo("Missing Project File command line argument.");
    WScript.Quit(1);
}
var szProjFile = WScript.Arguments(0);


var xmlDoc = new ActiveXObject("Msxml2.DOMDocument.3.0");

if (xmlDoc.load(szProjFile) == false)
{
    WScript.Echo(szProjFile + "(" + xmlDoc.parseError.line + ") : Error parsing Project File: " + xmlDoc.parseError.reason);
    WScript.Quit(2);
}

xmlDoc.setProperty("SelectionLanguage", "XPath");
var cppFileNodes = xmlDoc.selectNodes("/VisualStudioProject/Files/Filter/File[substring(@RelativePath, string-length(@RelativePath)-3) = '.cpp']/@RelativePath");

if(cppFileNodes.length == 0)
{
    WScript.Echo("Warning: Project contained no *.cpp files for pre-processing.");
}

var szCppFileNames = " ";
for(var i = 0; i < cppFileNodes.length; i++)
{
    szCppFileNames = szCppFileNames + " " + cppFileNodes.item(i).text;
}

var oShell = new ActiveXObject("WScript.Shell");


var strWDKBinPath = oShell.ExpandEnvironmentStrings("%LATEST_DDK_BIN%");


if(strWDKBinPath == "" || strWDKBinPath == "%LATEST_DDK_BIN%")
{
    var strSystemDrive = oShell.ExpandEnvironmentStrings("%SYSTEMDRIVE%");
    if(strSystemDrive != "%SYSTEMDRIVE%")
    {
        // Enumerate the directories under strSystemDrive\\WinDDK
        var fso, folderWDK, buildsWDK;
        fso = new ActiveXObject("Scripting.FileSystemObject");
        folderWDK = fso.GetFolder(strSystemDrive + "\\WinDDK");
        buildsWDK = new Enumerator(folderWDK.SubFolders);
        
        var highestBuild = 0;
        
        for(; !buildsWDK.atEnd(); buildsWDK.moveNext())
        {
            var build = parseInt(buildsWDK.item().Name);
            
            if(highestBuild == 0)
            {
                highestBuild = buildsWDK.item().Name;
            }
            else if(buildsWDK.item().Name==build && build > highestBuild)
            {
                highestBuild = build;
            }
        }
        if(highestBuild != 0)
        {
            strWDKBinPath = strSystemDrive + "\\WinDDK\\" + highestBuild + "\\bin";
        }
    }
}

if(strWDKBinPath == "" || strWDKBinPath == "%LATEST_DDK_BIN%")
{    
    WScript.Echo("The WDK does not appear to be installed, please install it to the default location before building.");
    WScript.Quit(3);
}

WScript.Echo("Found WDK at: " + strWDKBinPath);

var szCommandLine = strWDKBinPath + "\\x86\\tracewpp.exe" + szCppFileNames + " -cfgdir:" + strWDKBinPath + "\\wppconfig\\rev1 -scan:WppDefs.h -ini:CustomWpp.ini";
WScript.Echo("Executing Commandline: " + szCommandLine);

try
{
    var oExecTraceWpp = oShell.Exec(szCommandLine);
}
catch(e)
{
    WScript.Echo("Error executing TraceWpp.exe: #(" + e.number + ") - " + e.description);
    WScript.Quit(5);
}

while(oExecTraceWpp.Status == 0)
{
    while (!oExecTraceWpp.StdOut.AtEndOfStream)
    {
        WScript.StdOut.Write(oExecTraceWpp.StdOut.Read(1));
    }

    WScript.Sleep(100);
}
while (!oExecTraceWpp.StdOut.AtEndOfStream)
{
    WScript.StdOut.Write(oExecTraceWpp.StdOut.Read(1));
}

WScript.Quit(oExecTraceWpp.ExitCode);