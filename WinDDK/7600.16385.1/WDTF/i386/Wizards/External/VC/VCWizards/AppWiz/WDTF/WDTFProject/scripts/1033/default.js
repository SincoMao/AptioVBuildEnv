// Copyright (c) Microsoft Corporation. All rights reserved.

// Called by PREPROCESS_FUNCTION in VC\VCProjects\WDTFWiz.vsz
function CheckWDTFProjectName(selProj, selObj)
{
    var strProjectName = wizard.FindSymbol("PROJECT_NAME");
    if (strProjectName.toLowerCase() == "compreg")
    {
        var L_NameNotAllowed_Text = "This project name is not allowed. Please chose another one."
        wizard.ReportError(L_NameNotAllowed_Text);
        return false;
    }
    return true;
}

function OnFinish(selProj, selObj)
{
    try
    {
        var strTemplatePath    = wizard.FindSymbol("TEMPLATES_PATH");
        var strProjectPath     = wizard.FindSymbol("PROJECT_PATH");
        var strProjectName     = wizard.FindSymbol("PROJECT_NAME");
        var bAttributed        = wizard.FindSymbol("ATTRIBUTED");
        var bTracing           = wizard.FindSymbol("SUPPORT_TRACING");
        
        wizard.AddSymbol("SAFE_PROJECT_APPID_NAME", wizard.FindSymbol("SAFE_PROJECT_IDENTIFIER_NAME"));
        wizard.AddSymbol("SAFE_IDL_NAME", CreateASCIIName(wizard.FindSymbol("PROJECT_NAME")));
        selProj = CreateProject(strProjectName, strProjectPath);
        
        AddConfigurations(selProj, strProjectName);

        SetupFilters(selProj);
        selProj.Object.keyword = "AtlProj";

        AddFilesToProjectWithInfFile(selProj, strProjectName);
        
        wizard.RenderTemplate(strTemplatePath + "\\WDTFInterfaces.idl", "WDTFInterfaces.idl");
        wizard.RenderTemplate(strTemplatePath + "\\WDTFInterfaces.h",   "WDTFInterfaces.h");        
        wizard.RenderTemplate(strTemplatePath + "\\WDTFInterfaces.tlb", "WDTFInterfaces.tlb", true);
        wizard.RenderTemplate(strTemplatePath + "\\WDTF.idl",           "WDTF.idl");
        wizard.RenderTemplate(strTemplatePath + "\\WDTF.h",             "WDTF.h");
        wizard.RenderTemplate(strTemplatePath + "\\WDTF.tlb",           "WDTF.tlb", true);

        if(bTracing)
        {
            wizard.RenderTemplate(strTemplatePath + "\\COMTracing.h",       "COMTracing.h");
            wizard.RenderTemplate(strTemplatePath + "\\Tracing.h",          "Tracing.h");
            wizard.RenderTemplate(strTemplatePath + "\\WppDefs.h",          "WppDefs.h");
            wizard.RenderTemplate(strTemplatePath + "\\CustomWpp.ini",      "CustomWpp.ini");
            wizard.RenderTemplate(strTemplatePath + "\\VSTraceWpp.js",      "VSTraceWpp.js");
            
            var oBuildTools = selProj.Object.AddFilter("Build Tools");
            if (oBuildTools)
            {
                oBuildTools.AddFile("VSTraceWpp.js");
            }
        }
        
        var oWDTFHeaders = selProj.Object.AddFilter("WDTF Headers");
        if (oWDTFHeaders)
        {
            oWDTFHeaders.AddFile("WDTFInterfaces.idl");
            oWDTFHeaders.AddFile("WDTFInterfaces.h");
            oWDTFHeaders.AddFile("WDTFInterfaces.tlb");
            oWDTFHeaders.AddFile("WDTF.idl");
            oWDTFHeaders.AddFile("WDTF.h");
            oWDTFHeaders.AddFile("WDTF.tlb");
            
            if(bTracing)
            {
                oWDTFHeaders.AddFile("COMTracing.h");
                oWDTFHeaders.AddFile("Tracing.h");
                oWDTFHeaders.AddFile("WppDefs.h");
                oWDTFHeaders.AddFile("CustomWpp.ini");
            }
        }
                

        var L_strGenerated_Text = "Generated Files";
        var strIdlName = wizard.FindSymbol("SAFE_IDL_NAME");
        if (!bAttributed)
        {
            var strMIDLHeader = strProjectPath + "\\" + strIdlName + ".h";
            wizard.RenderTemplate(strTemplatePath + "\\root.h", strMIDLHeader, true);

            var strMIDL_IFile = strProjectPath + "\\" + strIdlName + "_i.c";
            wizard.RenderTemplate(strTemplatePath + "\\root_i.c", strMIDL_IFile, true);

            var oGeneratedFiles = selProj.Object.AddFilter(L_strGenerated_Text);
            if (oGeneratedFiles)
            {
                oGeneratedFiles.SourceControlFiles = false;
                oGeneratedFiles.AddFile(strMIDLHeader);
                oGeneratedFiles.AddFile(strMIDL_IFile);
            }
            else
            {
                selProj.Object.AddFile(strMIDLHeader);
                selProj.Object.AddFile(strMIDL_IFile);
            }
        }

        SetPchSettings(selProj, strProjectName);

        selProj.Object.Save();

        var bMergeProxy = wizard.FindSymbol("MERGE_PROXY_STUB");
        if (!bMergeProxy)
        {
            var strDefFile = strProjectPath + "\\" + strProjectName + "ps.def";
            var str_PFile;
            var str_IFile;

            if (bAttributed)
            {
                str_PFile = strProjectPath + "\\_" + strIdlName + "_p.c";
                str_IFile = strProjectPath + "\\_" + strIdlName + "_i.c";
            }
            else
            {
                str_PFile = strProjectPath + "\\" + strIdlName + "_p.c";
                str_IFile = strProjectPath + "\\" + strIdlName + "_i.c";
            }

            strProjectName += "PS";
            wizard.AddSymbol("CLOSE_SOLUTION", false);
            var oPSProj = CreateProject(strProjectName, strProjectPath);

            SetPSConfigurations(oPSProj, selProj);

            var strSrcFilter = wizard.FindSymbol("SOURCE_FILTER");
            var L_Source_Text = "Source Files";
            var group = oPSProj.Object.AddFilter(L_Source_Text);
            group.Filter = strSrcFilter;

            oPSProj.Object.keyword = "AtlPSProj";

            wizard.RenderTemplate(strTemplatePath + "\\rootps.def", strDefFile);
            oPSProj.Object.AddFile(strDefFile);
            var oGeneratedFiles = oPSProj.Object.AddFilter(L_strGenerated_Text);
            if (oGeneratedFiles)
            {
                oGeneratedFiles.SourceControlFiles = false;
                oGeneratedFiles.AddFile(str_IFile);
                oGeneratedFiles.AddFile(str_PFile);
                oGeneratedFiles.AddFile(strProjectPath + "\\dlldata.c");
            }
            else
            {
                oPSProj.Object.AddFile(str_IFile);
                oPSProj.Object.AddFile(str_PFile);
                oPSProj.Object.AddFile(strProjectPath + "\\dlldata.c");
            }

            oPSProj.Object.Save();
        }

        // expand main project node, highlight it
        //
        strProjectName    = wizard.FindSymbol("PROJECT_NAME");
        var oHier = wizard.dte.Windows.Item(vsWindowKindSolutionExplorer).Object;
        var oHISolution = oHier.UIHierarchyItems(1);
        var oHIProjMain;
        for (nHI=1; nHI<=oHISolution.UIHierarchyItems.Count; nHI++)
        {
            if ( oHISolution.UIHierarchyItems(nHI).name == strProjectName )
            {
                oHIProjMain = oHISolution.UIHierarchyItems(nHI);
                break;
            }
        }
        if (oHIProjMain)
        {
            oHIProjMain.UIHierarchyItems.Expanded = true;
            oHIProjMain.Select(vsUISelectionTypeSelect);
        }
    }
    catch(e)
    {
        if (e.description.length != 0)
            SetErrorInfo(e);
        return e.number
    }
}

function SetFileProperties(projfile, strName)
{
    return false;
}

function GetTargetName(strName, strProjectName, strResPath, strHelpPath)
{
    try
    {
        var strTarget = strName;

        if (strName == "readme.txt")
            strTarget = "ReadMe.txt";
        if (strName == "resource.h")
            strTarget = "Resource.h";

        if (strName.substr(0, 4) == "root")
        {
            if (strName == "root.idl")
            {
                var strProjectName = wizard.FindSymbol("SAFE_IDL_NAME");
                strTarget = strProjectName + ".idl";
            }
            else
            {
                strTarget = strProjectName + strName.substr(4);
            }
        }
        return strTarget;
    }
    catch(e)
    {
        throw e;
    }
}

function SetPSConfigurations(oProj, oMainProj)
{
    try
    {
        oConfigs = oProj.Object.Configurations;
        bSupportComPlus = wizard.FindSymbol("SUPPORT_COMPLUS");

        for (var nCntr = 1; nCntr <= oConfigs.Count; nCntr++)
        {
            var oConfig = oConfigs(nCntr);
            var bDebug = false;
            if (-1 != oConfig.Name.indexOf("Debug"))
                bDebug = true;

            oConfig.ConfigurationType = typeDynamicLibrary;
            oConfig.CharacterSet = charSetUNICODE;
            var oCLTool = oConfig.Tools("VCCLCompilerTool");

            var strDefines = oCLTool.PreprocessorDefinitions;
            if (strDefines != "") strDefines += ";";
            strDefines += GetPlatformDefine(oConfig);
            strDefines += "_WIN32_WINNT=0x0500;REGISTER_PROXY_DLL";
            if (bDebug)
            {
                strDefines += ";_DEBUG";
                oCLTool.RuntimeLibrary = rtMultiThreadedDebugDLL;
            }
            else
            {
                strDefines += ";NDEBUG";
                oCLTool.RuntimeLibrary = rtMultiThreadedDLL;
                oCLTool.Optimization = optimizeMaxSpeed;
            }
            oConfig.IntermediateDirectory = "$(ConfigurationName)PS";
            oConfig.OutputDirectory = "$(ConfigurationName)PS";
            oCLTool.PreprocessorDefinitions = strDefines;

            var oLinkTool = oConfig.Tools("VCLinkerTool");
            oLinkTool.AdditionalDependencies = "kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib";

            if (bSupportComPlus)
                oLinkTool.AdditionalDependencies += " ole32.lib advapi32.lib comsvcs.lib";

            oLinkTool.ModuleDefinitionFile = oProj.Name + ".def";

            if (!bDebug)
            {
                oLinkTool.EnableCOMDATFolding = optFolding;
                oLinkTool.OptimizeReferences = optReferences;
            }

            oLinkTool.RegisterOutput = false;

            var oPreBuildTool = oConfig.Tools("VCPreBuildEventTool");
            var strCommand = "if exist dlldata.c goto :END\r\n";
            var L_Echo1_Text = "echo Error: MIDL will not generate DLLDATA.C unless you have at least 1 interface in the main project.\r\n";
            strCommand += L_Echo1_Text;
            strCommand += "Exit 1\r\n";
            strCommand += ":END\r\n";
            oPreBuildTool.CommandLine = strCommand;
            var L_Echo2_Text = "Checking for required files";
            oPreBuildTool.Description = L_Echo2_Text;
        }

        // exclude from Solution build
        var oSolBuild = dte.Solution.SolutionBuild;
        var oSolConfigs = oSolBuild.SolutionConfigurations;
        for (var nCntr = 1; nCntr <= oSolConfigs.Count; nCntr++)
        {
            var oSolContexts = oSolConfigs(nCntr).SolutionContexts;
            for (var nCntr2 = 1; nCntr2 <= oSolContexts.Count; nCntr2++)
            {
                var oSolContext = oSolContexts(nCntr2);
                if (oSolContext.ProjectName == oProj.UniqueName)
                    oSolContext.ShouldBuild = false;
            }
        }

        // add main project to build dependency list
        oSolBuild.BuildDependencies(oProj.UniqueName).AddProject(oMainProj.UniqueName);
    }
    catch(e)
    {
        throw e;
    }
}

var nNumConfigs = 2;

var astrConfigName = new Array();
astrConfigName[0] = "Debug";
astrConfigName[1] = "Release";

var astrConfigDir = new Array();
astrConfigDir[0] = "Debug";
astrConfigDir[1] = "Release";

var astrDefines = new Array();
astrDefines[0] = "_WINDOWS;_DEBUG";
astrDefines[1] = "_WINDOWS;NDEBUG";

var anCRT = new Array();
anCRT[0] = rtMultiThreadedDebugDLL;
anCRT[1] = rtMultiThreadedDLL;

function AddConfigurations(proj, strProjectName)
{
    try
    {
        var nCntr;
        for (nCntr = 0; nCntr < nNumConfigs; nCntr++)
        {
        
            var bTracing   = wizard.FindSymbol("SUPPORT_TRACING");
        
            var strIdlName = wizard.FindSymbol("SAFE_IDL_NAME");
            // check if Debug
            var bDebug = false;
            if (-1 != astrConfigName[nCntr].search("Debug"))
                bDebug = true;

            var config = proj.Object.Configurations(astrConfigName[nCntr]);

            // add configuration if it doesn't exist
            if (!config)
            {
                proj.Object.AddConfiguration(astrConfigName[nCntr]);
                config = proj.Object.Configurations(astrConfigName[nCntr]);
            }


            // set output directories
            config.IntermediateDirectory = '$(ConfigurationName)';
            config.OutputDirectory = '$(ConfigurationName)';

            // set configuration type
            var bAppTypeDLL = wizard.FindSymbol("DLL_APP");
            if (bAppTypeDLL)
                config.ConfigurationType = typeDynamicLibrary;

            config.ATLMinimizesCRunTimeLibraryUsage = false;
            config.UseOfATL = useATLDynamic;
            config.CharacterSet = charSetUNICODE;

            // Compiler settings
            var CLTool = config.Tools("VCCLCompilerTool");

            CLTool.UsePrecompiledHeader = pchUseUsingSpecific;
            CLTool.WarningLevel = WarningLevel_3;
            CLTool.Detect64BitPortabilityProblems = true;
            if (bDebug)
            {
                if(bTracing)
                {
                    CLTool.DebugInformationFormat = debugEnabled;
                }
                else
                {
                    CLTool.DebugInformationFormat = debugEditAndContinue;
                }
            
                CLTool.MinimalRebuild = true;
                CLTool.BasicRuntimeChecks = runtimeBasicCheckAll;
                CLTool.Optimization = optimizeDisabled;
            }
            else
            {
                CLTool.DebugInformationFormat = debugEnabled;
                CLTool.Optimization = optimizeMaxSpeed;
            }

            var bAttributed        = wizard.FindSymbol("ATTRIBUTED");
            var bMFC               = wizard.FindSymbol("SUPPORT_MFC");
            var bMergeProxy        = wizard.FindSymbol("MERGE_PROXY_STUB");
            var bSupportComPlus    = wizard.FindSymbol("SUPPORT_COMPLUS");
            var bSupportComponentRegistrar = wizard.FindSymbol("SUPPORT_COMPONENT_REGISTRAR");

            var strDefines = CLTool.PreprocessorDefinitions;
            if (strDefines != "") strDefines += ";";
            strDefines += GetPlatformDefine(config);
            strDefines += astrDefines[nCntr];
            if (bAppTypeDLL)
                strDefines += ";_USRDLL";
            if (bAttributed)
                strDefines += ";_ATL_ATTRIBUTES";
            if (bMFC)
                config.UseOfMFC = useMfcDynamic;
            if (bMergeProxy && bSupportComponentRegistrar)
                strDefines += ";_MERGE_PROXYSTUB";
            CLTool.PreprocessorDefinitions = strDefines;
            CLTool.RuntimeLibrary = anCRT[nCntr];
            
            // PRE-Build event, if needed, for tracing
            if(bTracing)
            {
                var PreBuildTool = config.Tools("VCPreBuildEventTool");
                
                PreBuildTool.Description = "Run WPP tracing pre-processor.";
                PreBuildTool.CommandLine = "CScript.exe VSTraceWpp.js $(InputFileName)";
            }

            // MIDL settings
            var MidlTool = config.Tools("VCMidlTool");
            MidlTool.MkTypLibCompatible = false;
            if (IsPlatformWin32(config))
                MidlTool.TargetEnvironment = midlTargetWin32;

            if (bDebug)
                MidlTool.PreprocessorDefinitions = "_DEBUG";
            else
                MidlTool.PreprocessorDefinitions = "NDEBUG";

            MidlTool.HeaderFileName = strIdlName + ".h";
            MidlTool.InterfaceIdentifierFileName = strIdlName + "_i.c";
            MidlTool.ProxyFileName = strIdlName + "_p.c";
            MidlTool.GenerateStublessProxies = true;
            MidlTool.TypeLibraryName = "$(IntDir)/" + strIdlName + ".tlb";
            MidlTool.DLLDataFileName = "";
            //no_robust
            MidlTool.ValidateParameters = false;

            // Resource settings
            var RCTool = config.Tools("VCResourceCompilerTool");
            RCTool.Culture = wizard.FindSymbol("LCID");
            RCTool.AdditionalIncludeDirectories = "$(IntDir)";
            if (bDebug)
                RCTool.PreprocessorDefinitions = "_DEBUG";
            else
                RCTool.PreprocessorDefinitions = "NDEBUG";

            // Linker settings
            var LinkTool = config.Tools("VCLinkerTool");
            LinkTool.SubSystem = subSystemWindows;
            LinkTool.IgnoreImportLibrary = true;
            LinkTool.TargetMachine = machineX86;

            if (bAppTypeDLL && !bAttributed)
            {
                var strDefFile = ".\\" + strProjectName + ".def";
                LinkTool.ModuleDefinitionFile = strDefFile;
            }
            if (bSupportComPlus)
                LinkTool.AdditionalDependencies += " comsvcs.lib";

            if (bAttributed)
                LinkTool.MergedIDLBaseFileName = "_" + strIdlName + ".idl";

            LinkTool.GenerateDebugInformation = true;
            if (bDebug)
                LinkTool.LinkIncremental = linkIncrementalYes;
            else
            {
                LinkTool.LinkIncremental = linkIncrementalNo;
                LinkTool.EnableCOMDATFolding = optFolding;
                LinkTool.OptimizeReferences = optReferences;
            }


            if (bAppTypeDLL)
            {
                LinkTool.RegisterOutput = false;
            }
            else
            {
                var PostBuildTool = config.Tools("VCPostBuildEventTool");
                var L_PerformingRegistration2_Text = "Performing registration";
                PostBuildTool.Description = L_PerformingRegistration2_Text;
                PostBuildTool.CommandLine = "\"$(TargetPath)\" /RegServer";
            }

        }
    }
    catch(e)
    {
        throw e;
    }
}

function SetPchSettings(proj, strProjectName)
{
    try
    {
        var files = proj.Object.Files;
        var fStdafx = files("StdAfx.cpp");
        var bAttributed = wizard.FindSymbol("ATTRIBUTED");

        var nCntr;
        for (nCntr = 0; nCntr < nNumConfigs; nCntr++)
        {
            var config = fStdafx.FileConfigurations(astrConfigName[nCntr]);
            config.Tool.UsePrecompiledHeader = pchCreateUsingSpecific;

            if (!bAttributed)
            {
                var strIdlName = wizard.FindSymbol("SAFE_IDL_NAME");
                var fProject_i = files(strIdlName + "_i.c");
                config = fProject_i.FileConfigurations(astrConfigName[nCntr]);
                config.Tool.UsePrecompiledHeader = pchNone;

                if (wizard.FindSymbol("MERGE_PROXY_STUB"))
                {
                    file = files("dlldatax.c");
                    config = file.FileConfigurations(astrConfigName[nCntr]);
                    config.Tool.UsePrecompiledHeader = pchNone;
                }
            }
        }
    }
    catch(e)
    {
        throw e;
    }
}
