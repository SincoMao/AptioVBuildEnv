// Copyright (c) Microsoft Corporation. All rights reserved.
// Script for WDTF SimpleIO Implementation

function OnFinish(selProj, selObj)
{
	var oCM;
	try
	{
		var bTracing		= wizard.FindSymbol("TRACING");

        var strCOMReturn      = "return(";
        var strMethodReturn   = "return(";
        var strReportError    = "return AtlReportError(GetObjectCLSID(), \"Error ";
        var strReportErrorMid = ", GUID_NULL, E_FAIL";
        if(bTracing)
        {
            strCOMReturn      = "COMReturn(WDTF, ";
            strMethodReturn   = "MethodReturnHRESULT(WDTF, ";
            strReportError    = "COMReportError(WDTF, E_FAIL, \"";
            strReportErrorMid = "";        
        }
        wizard.AddSymbol("COM_RETURN",       strCOMReturn);
        wizard.AddSymbol("METHOD_RETURN",    strMethodReturn);
        wizard.AddSymbol("REPORT_ERROR",     strReportError);
        wizard.AddSymbol("REPORT_ERROR_MID", strReportErrorMid);
        
        
		oCM	= selProj.CodeModel;

		var strShortName = wizard.FindSymbol("SHORT_NAME");
		var L_TRANSACTION_Text = "Add WDTF SimpleIO Implementation ";
		oCM.StartTransaction(L_TRANSACTION_Text + strShortName);

		var bDLL;
		if (typeDynamicLibrary == selProj.Object.Configurations(1).ConfigurationType)
			bDLL = true;
		else
			bDLL = false;
		wizard.AddSymbol("DLL_APP", bDLL);

		var strProjectName		= wizard.FindSymbol("PROJECT_NAME");
		wizard.AddSymbol("SAFE_IDL_NAME", CreateASCIIName(wizard.FindSymbol("PROJECT_NAME")));
		var strProjectPath		= wizard.FindSymbol("PROJECT_PATH");
		var strTemplatePath		= wizard.FindSymbol("TEMPLATES_PATH");
		var strUpperShortName		= CreateASCIIName(strShortName.toUpperCase());
		var strInterfaceName		= wizard.FindSymbol("INTERFACE_NAME");
		wizard.AddSymbol("UPPER_SHORT_NAME", strUpperShortName);
		var strVIProgID			= wizard.FindSymbol("VERSION_INDEPENDENT_PROGID");
		wizard.AddSymbol("PROGID", strVIProgID.substr(0,37) + ".1");
		var bConnectionPoint		= wizard.FindSymbol("CONNECTION_POINTS");
 		var strClassName		= wizard.FindSymbol("CLASS_NAME");
		var strHeaderFile		= wizard.FindSymbol("HEADER_FILE");
		var strImplFile			= wizard.FindSymbol("IMPL_FILE");
		var strCoClass			= wizard.FindSymbol("COCLASS");
		var bAttributed			= wizard.FindSymbol("ATTRIBUTED");

		var strProjectRC		= GetProjectFile(selProj, "RC", true, false);

		// Create necessary GUIDS
		CreateGUIDs();

		if (!bAttributed)
		{
			// Get LibName
			wizard.AddSymbol("LIB_NAME", oCM.IDLLibraries(1).Name);

			// Get LibID
			var oUuid = oCM.IDLLibraries(1).Attributes.Find("uuid");
			if (oUuid)
				wizard.AddSymbol("LIBID_REGISTRY_FORMAT", oUuid.Value);

			// Get typelib version
			var oVersion = oCM.IDLLibraries(1).Attributes.Find("version");
			if (oVersion)
			{
				var aryMajorMinor = oVersion.Value.split('.');
				for (var nCntr=0; nCntr<aryMajorMinor.length; nCntr++)
				{
					if (nCntr == 0)
						wizard.AddSymbol("TYPELIB_VERSION_MAJOR", aryMajorMinor[nCntr]);
					else
						wizard.AddSymbol("TYPELIB_VERSION_MINOR", aryMajorMinor[nCntr]);
				}
			}

			// Get AppID
			var strAppID = wizard.GetAppID();
			if (strAppID.length > 0)
			{
				wizard.AddSymbol("APPID_EXIST", true);
				wizard.AddSymbol("APPID_REGISTRY_FORMAT", strAppID);
			}

			// add RGS file resource
			var strRGSFile = GetUniqueFileName(strProjectPath, CreateASCIIName(strShortName) + ".rgs");
			var strRGSDCOMFile = GetUniqueFileName(strProjectPath, CreateASCIIName(strShortName + "DCOM") + ".rgs");
			var strRGSID = "IDR_" + strUpperShortName;
			var strRGSDCOMID = "IDR_" + strUpperShortName + "DCOM";

			RenderAddTemplate(wizard, "object.rgs", strRGSFile, false, false);
			
			var oResHelper = wizard.ResourceHelper;
			oResHelper.OpenResourceFile(strProjectRC);

			var strSymbolValue = oResHelper.AddResource(strRGSID, strProjectPath + strRGSFile, "REGISTRY");
			if (strSymbolValue == null) return;				
			wizard.AddSymbol("RGS_ID", strSymbolValue.split("=").shift());

			oResHelper.CloseResourceFile();
            
			// Render objco.idl and insert into strProject.idl
			AddCoclassFromFile(oCM, "objco.idl");
			
			// Don't do this for SimpleIO (because we are merely implementing an existing interface)
			//SetMergeProxySymbol(selProj);
		}

		// Add header
		RenderAddTemplate(wizard, "object.h", strHeaderFile, selObj, true);

		// Add CPP
		RenderAddTemplate(wizard, "object.cpp", strImplFile, selObj, false);

		oCM.CommitTransaction();
				
		var newClass = oCM.Classes.Find(strClassName);
		if(newClass)
			newClass.StartPoint.TryToShow(vsPaneShowTop);		
	}
	catch(e)
	{
		if (oCM)
			oCM.AbortTransaction();

		if (e.description.length != 0)
			SetErrorInfo(e);
		return e.number
	}
}

function CreateGUIDs()
{
	try
	{
		// create CLSID
		var strRawGUID = wizard.CreateGuid();
		var strFormattedGUID = wizard.FormatGuid(strRawGUID, 0);
		wizard.AddSymbol("CLSID_REGISTRY_FORMAT", strFormattedGUID);
		strRawGUID = wizard.CreateGuid();
		strFormattedGUID = wizard.FormatGuid(strRawGUID, 0);
		wizard.AddSymbol("UUID_REGISTRY_FORMAT", strFormattedGUID);
	}
	catch(e)
	{
		throw e;
	}
}
