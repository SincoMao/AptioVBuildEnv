<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>
    <events>

      <!-- TODO:
           4. Delete the "MyKeyword" keyword, and consider adding your own keywords.
              Keywords work much like WP7 "debug zones."  They are tags that can
              be assigned to events to break them into classes.  Keyword masks are 64-bit, of
              which you may use the lower 48.  For more information on keyword definitions, see
              http://msdn.microsoft.com/en-us/library/aa382786(VS.85).aspx
           6. Delete the sample templates.  Define templates for the different kinds of data you wish to log.
              If multiple events share the same data payload, they can use the same template.
              See the Remarks section in http://msdn.microsoft.com/en-us/library/aa382774(VS.85).aspx
              for valid inType / outType combinations.
              For more complex data types, it is suggested that you use a tool like EcManGen.exe from
              the Win7 SDK to author manifests.
           7. Delete the sample events and add your own.
              For information on opcodes, see http://msdn.microsoft.com/en-us/library/aa383956(VS.85).aspx.
           8. Delete the sample strings and define strings to match your own events.
           9. To avoid spoofing, add provider security settings under
              HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\security

           ** Never log any data which should be protected for security or privacy purposes.
           -->

      <provider name="Microsoft-WindowsPhone-DuaEngineLogger"
          guid="{76AE0A4C-DB2B-4db2-93B2-E959F1668400}"
          symbol="MICROSOFT_WINDOWSPHONE_DuaEngineLogger"
          messageFileName="DuaEngine.dll"
          resourceFileName="DuaEngine.dll">

        <channels />

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are provider-specific. -->
          <keyword mask="0x0000000000000004" name="Detection" message="$(string.Keyword.Detection)" />
          <keyword mask="0x0000000000000008" name="Download" message="$(string.Keyword.Download)" />
          <keyword mask="0x0000000000000010" name="Install" message="$(string.Keyword.Install)" />
        </keywords>

        <templates>
          <template tid="tHRESULT">
            <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tString">
            <data name="szString" inType="win:UnicodeString" />
          </template>

          <template tid="tStringtString">
            <data name="szString1" inType="win:UnicodeString" />
            <data name="szString2" inType="win:UnicodeString" />
          </template>

          <template tid="tCount">
            <data name="DWORD" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <template tid="tDword">
            <data name="DWORD" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>

          <!-- Template for old DuaLogger -->
          <template tid="DuaLogEventTemplate">
            <data name="MessageString" inType="win:UnicodeString" />
          </template>

          <template tid="TraceErrorEventTemplate">
              <data name="FunctionName" inType="win:UnicodeString" />
              <data name="LineNo" inType="win:UInt32" />
              <data name="HRESULT" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tNameValuePair">
            <data name="szName" inType="win:UnicodeString" />
            <data name="szValue" inType="win:UnicodeString" />
          </template>

        </templates>
           
        <tasks>
              <task name="DUA_SVC"  value="1"/>
              <task name="DUA_DETECTION"  value="2"/>
              <task name="DUA_DOWNLOAD"  value="3"/>
              <task name="DUA_PREINSTALL"  value="4"/>
              <task name="DUA_INSTALL" value="5"/>
              <task name="DUA_POSTINSTALL"  value="6"/>
              <task name="DUA_DATAMIGRATION" value="7"/>
              <task name="DUA_POSTUPDATEUX"  value="8"/>
              <task name="USS_SCAN" value="9"/>
              <task name="USS_SCAN_DETECTION" value="10"/>
              <task name="USS_SCAN_INSTALL" value="11"/>
              <task name="USS_SCAN_DOWNLOAD" value="12"/>
              <task name="DUA_LOG_OLD" value="13"/>
              <task name="DUA_DATAMIGRATION_MIGRATOR" value="14"/>
              <task name="DUA_DATAMIGRATION_MS_MIGRATORS" value="15"/>
              <task name="DUA_DATAMIGRATION_OEM_MIGRATORS" value="16"/>
        </tasks>

        <events>
<!-- Common macros starting at 1-->
        <event value="1"
              symbol="DuaError"
              level="win:Error"
              template="tHRESULT"
              message="$(string.Event.DuaError)" />

        <event value="2"
              symbol="DuaInfoHR"
              level="win:Informational"
              template="tHRESULT"
              message="$(string.Event.DuaInfoHR)" />

        <event value="3"
              symbol="DuaInfoString"
              level="win:Informational"
              template="tString"
              message="$(string.Event.DuaInfoString)" />
			  
        <event value="4"
              symbol="DuaCallbackCmdLine"
              level="win:Informational"
              template="tString"
              message="$(string.Event.DuaCallbackCmdLine)" />			

        <event value="5"
              symbol="DuaCallbackUnknownCmdLine"
              level="win:Warning"
              template="tString"
              message="$(string.Event.DuaCallbackUnknownCmdLine)" />

        <event value="6"
              symbol="DuaTraceError"
              level="win:Error"
              template="TraceErrorEventTemplate"
              message="$(string.Event.DuaTraceError)" />            

  	<event value="7"
              symbol="DuaDllLoaded"
              level="win:Informational"
              template="tNameValuePair"
              message="$(string.Event.DuaDllLoaded)" />

<!-- DuaSvc macros starting at 100-->
  	<event value="100"
              symbol="DuaSvcStart"
              opcode="win:Start"
              task="DUA_SVC" 
              level="win:Informational"
              message="$(string.Event.DuaSvcStart)" />

	<event value="101"
              symbol="DuaSvcStop"
              opcode="win:Stop"
              task="DUA_SVC" 
              level="win:Informational"
              message="$(string.Event.DuaSvcStop)" />

	<event value="102"
              symbol="DuaSvcRegisterServiceError"
              level="win:Error"
              message="$(string.Event.DuaSvcRegisterServiceError)" />

	<event value="103"
              symbol="DuaSvcEngineInit"
              level="win:Informational"
              template="tHRESULT"
              message="$(string.Event.DuaSvcEngineInit)" />

<!-- Dua State Engine macros starting at 200-->
  	<event value="200"
              symbol="DuaStateEngineError"
              level="win:Error"
              template="tHRESULT"
              message="$(string.Event.DuaStateEngineError)" />

  	<event value="201"
              symbol="DuaStateEngineInformational"
              level="win:Informational"
              template="tString"
              message="$(string.Event.DuaStateEngineInformational)" />

  	<event value="202"
              symbol="DuaStateEngineWarning"
              level="win:Warning"
              template="tHRESULT"
              message="$(string.Event.DuaStateEngineWarning)" />

<!-- Dua Detection macros starting at 300-->
  	<event value="300"
              symbol="DuaDetectionError"
              level="win:Error"
              template="tHRESULT"
              task="DUA_DETECTION"
              message="$(string.Event.DuaDetectionError)" />
  	<event value="301"
              symbol="DuaStateDetectionStart"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              task="DUA_DETECTION" 
              message="$(string.Event.DuaStateDetectionStart)" />
  	<event value="302"
              symbol="DuaStateDetectionComplete"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Stop"
              task="DUA_DETECTION" 
              message="$(string.Event.DuaStateDetectionComplete)" />

<!-- Dua Download macros starting at 400-->
  	<event value="400"
              symbol="DuaDownloadError"
              level="win:Error"
              template="tHRESULT"
              task="DUA_DOWNLOAD" 
              message="$(string.Event.DuaDownloadError)" />
	<event value="401"
              symbol="DuaStateDownloadStart"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              task="DUA_DOWNLOAD" 
              message="$(string.Event.DuaStateDownloadStart)" />
  	<event value="402"
              symbol="DuaStateDownloadComplete"
              level="win:Informational"
              opcode="win:Stop"
              keywords="Performance"
              task="DUA_DOWNLOAD" 
              message="$(string.Event.DuaStateDownloadComplete)" />
  	<event value="403"
              symbol="DuaStateUpdateCompleteStart"
              level="win:Informational"
              message="$(string.Event.DuaStateUpdateCompleteStart)" />
  	<event value="404"
              symbol="DuaStateUpdateCompleteComplete"
              level="win:Informational"
              message="$(string.Event.DuaStateUpdateCompleteComplete)" />

<!-- Dua Install macros starting at 500-->
  	<event value="500"
              symbol="DuaInstallError"
              level="win:Error"
              template="tHRESULT"
              task="DUA_INSTALL" 
              message="$(string.Event.DuaInstallError)" />
  	<event value="501"
              symbol="DuaStatePreInstallStart"
              level="win:Informational"
              opcode="win:Start"
              task="DUA_PREINSTALL"
              message="$(string.Event.DuaStatePreInstallStart)" />
  	<event value="502"
              symbol="DuaStatePreInstallComplete"
              level="win:Informational"
              opcode="win:Stop"
              task="DUA_PREINSTALL"
              message="$(string.Event.DuaStatePreInstallComplete)" />
  	<event value="503"
              symbol="DuaCommitStart"
              level="win:Informational"
              opcode="win:Start"
              task="DUA_INSTALL"
              message="$(string.Event.DuaCommitStart)" />
  	<event value="504"
              symbol="DuaStateInstallStart"
              level="win:Informational"
              task="DUA_INSTALL"
              opcode="win:Start"
              message="$(string.Event.DuaStateInstallStart)" />
  	<event value="505"
              symbol="DuaStateInstallComplete"
              level="win:Informational"
              opcode="win:Stop"
              task="DUA_INSTALL"
              message="$(string.Event.DuaStateInstallComplete)" />
  	<event value="506"
              symbol="DuaStatePostInstallStart"
              level="win:Informational"
              task="DUA_POSTINSTALL"
              opcode="win:Start"
              message="$(string.Event.DuaStatePostInstallStart)" />
  	<event value="507"
              symbol="DuaStatePostInstallComplete"
              level="win:Informational"
              opcode="win:Stop"
              task="DUA_POSTINSTALL"
              message="$(string.Event.DuaStatePostInstallComplete)" />
  	<event value="508"
              symbol="DuaUssUpdateAvailable"
              level="win:Informational"
              task="DUA_INSTALL"
              message="$(string.Event.DuaUssUpdateAvailable)" />

<!-- USS Scan macros starting at 700-->
  	<event value="700"
              symbol="UssScanInfoString"
              level="win:Informational"
              template="tString"
              task="USS_SCAN" 
              message="$(string.Event.UssScanInfoString)" />
  	<event value="701"
              symbol="UssScanStarted"
              level="win:Informational"
              template="tDword"
              opcode="win:Start"
              task="USS_SCAN" 
              message="$(string.Event.UssScanStarted)" />
  	<event value="702"
              symbol="UssScanSucceeded"
              level="win:Informational"
              opcode="win:Stop"
              task="USS_SCAN" 
              message="$(string.Event.UssScanSucceeded)" />
  	<event value="703"
              symbol="UssScanFailed"
              level="win:Error"
              template="tHRESULT"
              opcode="win:Stop"
              task="USS_SCAN" 
              message="$(string.Event.UssScanFailed)" />
  	<event value="704"
              symbol="UssScanDetectionStarted"
              level="win:Informational"
              opcode="win:Start"
              task="USS_SCAN_DETECTION" 
              message="$(string.Event.UssScanDetectionStarted)" />
  	<event value="705"
              symbol="UssScanDetectionSucceeded"
              level="win:Informational"
              opcode="win:Stop"
              task="USS_SCAN_DETECTION" 
              message="$(string.Event.UssScanDetectionSucceeded)" />
  	<event value="706"
              symbol="UssScanDetectionFailed"
              level="win:Error"
              template="tHRESULT"
              opcode="win:Stop"
              task="USS_SCAN_DETECTION" 
              message="$(string.Event.UssScanDetectionFailed)" />
  	<event value="707"
              symbol="UssScanUpdateDetected"
              level="win:Informational"
              task="USS_SCAN_DETECTION" 
              message="$(string.Event.UssScanUpdateDetected)" />
  	<event value="708"
              symbol="UssScanUpdateNotDetected"
              level="win:Informational"
              task="USS_SCAN_DETECTION" 
              message="$(string.Event.UssScanUpdateNotDetected)" />
  	<event value="709"
              symbol="UssScanInstallStarted"
              level="win:Informational"
              opcode="win:Start"
              task="USS_SCAN_INSTALL" 
              message="$(string.Event.UssScanInstallStarted)" />
  	<event value="710"
              symbol="UssScanInstallSucceeded"
              level="win:Informational"
              opcode="win:Stop"
              task="USS_SCAN_INSTALL" 
              message="$(string.Event.UssScanInstallSucceeded)" />
  	<event value="711"
              symbol="UssScanInstallFailed"
              level="win:Error"
              template="tHRESULT"
              opcode="win:Stop"
              task="USS_SCAN_INSTALL"
              message="$(string.Event.UssScanInstallFailed)" />
  	<event value="712"
              symbol="UssScanDownloadStarted"
              template="tStringtString"
              level="win:Informational"
              opcode="win:Start"
              task="USS_SCAN_DOWNLOAD"
              message="$(string.Event.UssScanDownloadStarted)" />
  	<event value="713"
              symbol="UssScanDownloadSucceeded"
              level="win:Informational"
              opcode="win:Stop"
              task="USS_SCAN_DOWNLOAD"
              message="$(string.Event.UssScanDownloadSucceeded)" />
  	<event value="714"
              symbol="UssScanDownloadFailed"
              level="win:Error"
              opcode="win:Stop"
              template="tHRESULT"
              task="USS_SCAN_DOWNLOAD"
              message="$(string.Event.UssScanDownloadFailed)" />

<!-- Dua Data Migration macros starting at 800-->
        <!-- Migration Manager events -->
  	<event value="800"
              symbol="DuaDataMigrationError"
              level="win:Error"
              template="tHRESULT"
              task="DUA_DATAMIGRATION"
              message="$(string.Event.DuaDataMigrationError)" />
  	<event value="801"
              symbol="DuaDataMigrationStart"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              task="DUA_DATAMIGRATION" 
              message="$(string.Event.DuaDataMigrationStart)" />
  	<event value="802"
              symbol="DuaDataMigrationComplete"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Stop"
              task="DUA_DATAMIGRATION" 
              message="$(string.Event.DuaDataMigrationComplete)" />
	<event value="803"
              symbol="DuaDataMigrationRestartCount"
              level="win:Informational"
              template="tCount"
              task="DUA_DATAMIGRATION" 
              message="$(string.Event.DuaDataMigrationRestartCount)" />
	<event value="804"
              symbol="DuaDataMigrationRestartLimitReached"
              level="win:Error"
              template="tCount"
              task="DUA_DATAMIGRATION" 
              message="$(string.Event.DuaDataMigrationRestartLimitReached)" />
	<event value="805"
              symbol="DuaDataMigrationAlreadyCompleted"
              template="tHRESULT"
              level="win:Informational"
              task="DUA_DATAMIGRATION"
              message="$(string.Event.DuaDataMigrationAlreadyCompleted)" />
	<event value="806"
              symbol="DuaDataMigrationMsMigratorsStart"
              template="tCount"
              level="win:Informational"
              opcode="win:Start"
              task="DUA_DATAMIGRATION_MS_MIGRATORS"
              message="$(string.Event.DuaDataMigrationMsMigratorsStart)" />
	<event value="807"
              symbol="DuaDataMigrationMsMigratorsComplete"
              level="win:Informational"
              opcode="win:Stop"
              task="DUA_DATAMIGRATION_MS_MIGRATORS"
              message="$(string.Event.DuaDataMigrationMsMigratorsComplete)" />
	<event value="808"
              symbol="DuaDataMigrationOemMigratorsStart"
              template="tCount"
              level="win:Informational"
              opcode="win:Start"
              task="DUA_DATAMIGRATION_OEM_MIGRATORS"
              message="$(string.Event.DuaDataMigrationOemMigratorsStart)" />
	<event value="809"
              symbol="DuaDataMigrationOemMigratorsComplete"
              level="win:Informational"
              opcode="win:Stop"
              task="DUA_DATAMIGRATION_OEM_MIGRATORS"
              message="$(string.Event.DuaDataMigrationOemMigratorsComplete)" />
  	<event value="810"
              symbol="DuaDataMigrationMsMigratorsFailed"
              template="tHRESULT"
              level="win:Error"
              task="DUA_DATAMIGRATION_MS_MIGRATORS" 
              message="$(string.Event.DuaDataMigrationMsMigratorsFailed)" />
  	<event value="811"
              symbol="DuaDataMigrationOemMigratorsFailed"
              template="tHRESULT"
              level="win:Error"
              task="DUA_DATAMIGRATION_OEM_MIGRATORS" 
              message="$(string.Event.DuaDataMigrationOemMigratorsFailed)" />

        <!-- Migrator events -->
	<event value="820"
              symbol="DuaDataMigrationMigratorAlreadyCompleted"
              template="tHRESULT"
              level="win:Informational"
              task="DUA_DATAMIGRATION_MIGRATOR"
              message="$(string.Event.DuaDataMigrationMigratorAlreadyCompleted)" />
	<event value="821"
              symbol="DuaDataMigrationMigratorTimeoutFatal"
              level="win:Error"
              task="DUA_DATAMIGRATION_MIGRATOR"
              message="$(string.Event.DuaDataMigrationMigratorTimeoutFatal)" />
	<event value="822"
              symbol="DuaDataMigrationMigratorTimeoutNonfatal"
              level="win:Informational"
              task="DUA_DATAMIGRATION_MIGRATOR"
              message="$(string.Event.DuaDataMigrationMigratorTimeoutNonfatal)" />
  	<event value="823"
              symbol="DuaDataMigrationMigratorStart"
              keywords="Performance"
              template="tString"
              level="win:Informational"
              opcode="win:Start"
              task="DUA_DATAMIGRATION_MIGRATOR"
              message="$(string.Event.DuaDataMigrationMigratorStart)" />
  	<event value="824"
              symbol="DuaDataMigrationMigratorComplete"
              keywords="Performance"
              template="tString"
              level="win:Informational"
              opcode="win:Stop"
              task="DUA_DATAMIGRATION_MIGRATOR" 
              message="$(string.Event.DuaDataMigrationMigratorComplete)" />
  	<event value="825"
              symbol="DuaDataMigrationMigratorFailedToStart"
              template="tHRESULT"
              level="win:Error"
              task="DUA_DATAMIGRATION_MIGRATOR" 
              message="$(string.Event.DuaDataMigrationMigratorFailedToStart)" />
    <event value="826"
              symbol="DuaDataMigrationMigratorCreationFailed"
              template="tHRESULT"
              level="win:Error"
              task="DUA_DATAMIGRATION_MIGRATOR" 
              message="$(string.Event.DuaDataMigrationMigratorCreationFailed)" />
    <event value="827"
              symbol="DuaDataMigrationMigratorIgnoringFailure"
              template="tHRESULT"
              level="win:Warning"
              task="DUA_DATAMIGRATION_MIGRATOR" 
              message="$(string.Event.DuaDataMigrationMigratorIgnoringFailure)" />
    <event value="828"
              symbol="DuaDataMigrationMigratorInitialize"
              level="win:Informational"
              task="DUA_DATAMIGRATION_MIGRATOR" 
              message="$(string.Event.DuaDataMigrationMigratorInitialize)" />

        <!-- Migrator scheduler events -->
	<event value="840"
              symbol="DuaDataMigrationMigrationScheduled"
              level="win:Informational"
              message="$(string.Event.DuaDataMigrationMigrationScheduled)" />
	<event value="841"
              symbol="DuaDataMigrationMigrationCancelled"
              level="win:Informational"
              message="$(string.Event.DuaDataMigrationMigrationCancelled)" />

        <!-- Migrator utility events -->
        <event value="850"
              symbol="DuaDataMigrationMigratorUtilityError"
              level="win:Error"
              template="tString"
              message="$(string.Event.DuaDataMigrationMigratorUtilityMessage)" />
        <event value="851"
              symbol="DuaDataMigrationMigratorUtilityWarning"
              level="win:Warning"
              template="tString"
              message="$(string.Event.DuaDataMigrationMigratorUtilityMessage)" />
        <event value="852"
              symbol="DuaDataMigrationMigratorUtilityInfo"
              level="win:Informational"
              template="tString"
              message="$(string.Event.DuaDataMigrationMigratorUtilityMessage)" />
        <event value="853"
              symbol="DuaDataMigrationMigratorUtilityTrace"
              level="win:Verbose"
              template="tString"
              message="$(string.Event.DuaDataMigrationMigratorUtilityMessage)" />

        <!-- Provisioner events -->

        <!-- Dua Post Update UX macros starting at 900-->
  	<event value="900"
              symbol="DuaPostUpdateUXError"
              level="win:Error"
              template="tHRESULT"
              task="DUA_POSTUPDATEUX"
              message="$(string.Event.DuaPostUpdateUXError)" />
  	<event value="901"
              symbol="DuaPostUpdateUXStart"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Start"
              task="DUA_POSTUPDATEUX" 
              message="$(string.Event.DuaPostUpdateUXStart)" />
  	<event value="902"
              symbol="DuaPostUpdateUXComplete"
              keywords="Performance"
              level="win:Informational"
              opcode="win:Stop"
              task="DUA_POSTUPDATEUX" 
              message="$(string.Event.DuaPostUpdateUXComplete)" />

        <!-- Dua Core Migrator macros starting at 1000-->
 	<event value="1000"
              symbol="DuaCoreMigratorError"
              level="win:Error"
              template="tHRESULT"
              message="$(string.Event.DuaCoreMigratorError)" />

<!-- Temp events for old DuaLogger-->
        <event value="1101"
              level="win:Error"
              template="tString"
              symbol="DUA_ERROR_EVENT"
              task="DUA_LOG_OLD"
              message="$(string.Event.DuaLogEvent)" />
        <event value="1102"
              level="win:Warning"
              template="tString"
              task="DUA_LOG_OLD"
              symbol="DUA_WARN_EVENT"
              message="$(string.Event.DuaLogEvent)" />
        <event value="1103"
              level="win:Informational"
              template="tString"
              symbol="DUA_INFO_EVENT"
              task="DUA_LOG_OLD"
              message="$(string.Event.DuaLogEvent)" />
        <event value="1104"
              level="win:Verbose"
              template="tString"
              symbol="DUA_TRACE_EVENT"
              task="DUA_LOG_OLD"
              message="$(string.Event.DuaLogEvent)" />
        </events>
      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="Keyword.Error"                        value="Error" />
        <string id="Keyword.Performance"                  value="Performance" />
        <string id="Keyword.Detection"                    value="Detection" />
        <string id="Keyword.Download"                     value="Download" />
        <string id="Keyword.Install"                      value="Install" />

<!-- Common Macro-->
        <string id="Event.DuaError"                       value="HR=%1" />
        <string id="Event.DuaInfoHR"                      value="Info! HR=%1" />
        <string id="Event.DuaInfoString"                  value="Info! %1" />
        <string id="Event.DuaCallbackCmdLine"             value="DuaCallback cmdline = %1" />
        <string id="Event.DuaCallbackUnknownCmdLine"      value="DuaCallback unknown cmdline = %1" />
        <string id="Event.DuaTraceError"                  value="%1 @ Line:%2 returned HR=%3" />
        <string id="Event.DuaDllLoaded"                   value="DLL loaded: %1=%2" />
		
<!-- DuaSvc String-->
        <string id="Event.DuaSvcStart"                    value="DuSvc Started" />
        <string id="Event.DuaSvcStop"                     value="DuSvc Stopped" />
        <string id="Event.DuaSvcRegisterServiceError"     value="RegisterServiceCrtlHandlerEx failed" />
        <string id="Event.DuaSvcEngineInit"               value="Engine returned hr=%1" />

<!-- DuaStateEngine String-->
        <string id="Event.DuaStateEngineError"            value="State Engine Error: HR=%1" />
        <string id="Event.DuaStateEngineWarning"          value="State Engine Warning: HR=%1" />
        <string id="Event.DuaStateEngineInformational"    value="State Engine Info: %1" />

<!-- Dua Detection String-->
        <string id="Event.DuaDetectionError"              value="Detection Error: HR=%1" />
        <string id="Event.DuaStateDetectionStart"         value="DuaStateDetection Started" />
        <string id="Event.DuaStateDetectionComplete"      value="DuaStateDetection Completed" />

<!-- Dua Download String-->
        <string id="Event.DuaDownloadError"               value="Download Error: HR=%1" />
        <string id="Event.DuaStateDownloadStart"          value="DuaStateDownload Started" />
        <string id="Event.DuaStateDownloadComplete"       value="DuaStateDownload Completed" />
        <string id="Event.DuaStateUpdateCompleteStart"    value="DuaStateUpdateComplete Started" />
        <string id="Event.DuaStateUpdateCompleteComplete" value="DuaStateUpdateComplete Completed" />

<!-- Dua Install String-->
        <string id="Event.DuaInstallError"                value="Installation Error: HR=%1" />
        <string id="Event.DuaStatePreInstallStart"        value="DuaStatePreInstall Started" />
        <string id="Event.DuaStatePreInstallComplete"     value="DuaStatePreInstall Completed" />
        <string id="Event.DuaCommitStart"                 value="DuaCommit Started" />
        <string id="Event.DuaStateInstallStart"           value="DuaStateInstall Started" />
        <string id="Event.DuaStateInstallComplete"        value="DuaStateInstall Completed" />
        <string id="Event.DuaStatePostInstallStart"       value="DuaStatePostInstall Started" />
        <string id="Event.DuaStatePostInstallComplete"    value="DuaStatePostInstall Completed" />
        <string id="Event.DuaUssUpdateAvailable"          value="USS update available" />

<!-- USS Scan String-->
        <string id="Event.UssScanInfoString"              value="%1" />
        <string id="Event.UssScanStarted"                 value="UssScan started: type=%1" />
        <string id="Event.UssScanSucceeded"               value="UssScan succeeded" />
        <string id="Event.UssScanFailed"                  value="UssScan failed: HR=%1" />
        <string id="Event.UssScanDetectionStarted"        value="UssScan detection started" />
        <string id="Event.UssScanDetectionSucceeded"      value="UssScan detection succeeded" />
        <string id="Event.UssScanDetectionFailed"         value="UssScan detection failed: HR=%1" />
        <string id="Event.UssScanUpdateDetected"          value="UssScan update detected" />
        <string id="Event.UssScanUpdateNotDetected"       value="UssScan update not detected" />
        <string id="Event.UssScanInstallStarted"          value="UssScan install started" />
        <string id="Event.UssScanInstallSucceeded"        value="UssScan install succeeded" />
        <string id="Event.UssScanInstallFailed"           value="UssScan install failed: HR=%1" />
        <string id="Event.UssScanDownloadStarted"         value="UssScan download started: URL=%1, path=%2" />
        <string id="Event.UssScanDownloadSucceeded"       value="UssScan download succeded" />
        <string id="Event.UssScanDownloadFailed"          value="UssScan download failed: HR=%1" />

<!-- Dua Data Migration String-->
        <string id="Event.DuaDataMigrationError"                      value="Data Migration Error: HR=%1" />
        <string id="Event.DuaDataMigrationStart"                      value="DuaDataMigration Started" />
        <string id="Event.DuaDataMigrationComplete"                   value="DuaDataMigration Completed" />
        <string id="Event.DuaDataMigrationRestartCount"               value="Data migration restart: count=%1" />
        <string id="Event.DuaDataMigrationRestartLimitReached"        value="Data migration restart limit reached: count=%1" />
        <string id="Event.DuaDataMigrationAlreadyCompleted"           value="Data migraion completed on a previous reboot: HR=%1" />

        <string id="Event.DuaDataMigrationMsMigratorsStart"           value="MS migrators started: count=%1" />
        <string id="Event.DuaDataMigrationMsMigratorsComplete"        value="MS migrators completed" />
        <string id="Event.DuaDataMigrationMsMigratorsFailed"          value="MS migrators failed: HR=%1" />
        <string id="Event.DuaDataMigrationOemMigratorsStart"          value="OEM migrators started: count=%1" />
        <string id="Event.DuaDataMigrationOemMigratorsComplete"       value="OEM migrators completed" />
        <string id="Event.DuaDataMigrationOemMigratorsFailed"         value="OEM migrators failed: HR=%1" />
        <string id="Event.DuaDataMigrationMigratorAlreadyCompleted"   value="Migrator completed on a previous reboot: HR=%1" />
        <string id="Event.DuaDataMigrationMigratorTimeoutFatal"       value="Migrator timeout with fatal flag set" />
        <string id="Event.DuaDataMigrationMigratorTimeoutNonfatal"    value="Migrator timeout with fatal flag not set" />
        <string id="Event.DuaDataMigrationMigratorStart"              value="Migrator started: name=%1" />
        <string id="Event.DuaDataMigrationMigratorComplete"           value="Migrator completed: name=%1" />
        <string id="Event.DuaDataMigrationMigratorFailedToStart"      value="Migrator failed to start: HR=%1" />
        <string id="Event.DuaDataMigrationMigratorCreationFailed"     value="Migrator creation failed: HR=%1" />
        <string id="Event.DuaDataMigrationMigratorIgnoringFailure"    value="Ignoring Migrator::Run failure: HR=%1" />
        <string id="Event.DuaDataMigrationMigratorInitialize"         value="Migrator::InitializeMigrator()" />

        <string id="Event.DuaDataMigrationMigrationScheduled"         value="Data migration scheduled" />
        <string id="Event.DuaDataMigrationMigrationCancelled"         value="Data migration cancelled" />

        <string id="Event.DuaDataMigrationMigratorUtilityMessage"     value="Data migrator: %1" />

<!-- Dua Post Update UX String-->
        <string id="Event.DuaPostUpdateUXError"           value="Post Update UX Error: HR=%1" />
        <string id="Event.DuaPostUpdateUXStart"           value="DuaPostUpdateUX Started" />
        <string id="Event.DuaPostUpdateUXComplete"        value="DuaPostUpdateUX Completed" />

<!-- Core Migration String-->
        <string id="Event.DuaCoreMigratorError"           value="Core Migrator Error: HR=%1" />

<!-- Temp String for old DuaLogger -->
        <string id="Event.DuaLogEvent"   value="%1" />
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
