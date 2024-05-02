<?xml version="1.0" encoding="utf-8"?>
<instrumentationManifest xmlns="http://schemas.microsoft.com/win/2004/08/events" xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <instrumentation>
    <events>
      <!-- Provides ETW events for all the EnterpriseAppMgmt components -->
      <provider name="Microsoft-WindowsPhone-EnterpriseAppMgmt" guid="{F4E559CD-6639-46E0-93F8-2AC9D6D33976}" symbol="MICROSOFT_WINDOWSPHONE_ENTERPRISEAPPMGMT" messageFileName="ETWEnterpriseAppMgmtResources.dll" resourceFileName="ETWEnterpriseAppMgmtResources.dll">
        <channels />
        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <!-- Other keywords are EnterpriseAppMgmt specific. -->
          <keyword mask="0x0000000000000010" name="EnterpriseAppMgmtSvc" message="$(string.Keyword.EnterpriseAppMgmtSvc)" />
          <keyword mask="0x0000000000000020" name="EnterpriseAppDB" message="$(string.Keyword.EnterpriseAppDB)" />
          <keyword mask="0x0000000000000040" name="EnterpriseAppMgmtCSP" message="$(string.Keyword.EnterpriseAppMgmtCSP)" />
          <keyword mask="0x0000000000000080" name="EnterpriseValidation" message="$(string.Keyword.EnterpriseValidation)" />
          <keyword mask="0x0000000000000100" name="EnterpriseInstall" message="$(string.Keyword.EnterpriseInstall)" />
          <keyword mask="0x0000000000000200" name="Debug" message="$(string.Keyword.Debug)" />
          <keyword mask="0x0000000000000400" name="EnterpriseDeployment" message="$(string.Keyword.EnterpriseDeployment)" />
        </keywords>
        <!-- Task have an event-pairs which have a start/stop semantics (used by post-processing tools) -->
        <tasks>
          <task value="1" name="EnterpriseAppMgmtSvc" />
          <!-- Service Start/Stop task  -->
          <task value="2" name="EnterpriseAppMgmtSvcApi" />
          <!-- Svc API Begin/End task  -->
          <task value="3" name="EnterpriseAppMgmtCSPApi" />
          <!-- CSP Begin/End task -->
          <task value="4" name="EnterpriseValidation" />
          <!-- Start and Stop of the EnterpriseValidation task -->
          <task value="5" name="EnterpriseInstall" />
          <!-- Start and Stop of the EnterpriseInstall.exe -->
          <task value="6" name="tracemessage" message="$(string.Task.TraceMessage)" />
          <!-- Generic Trace Messages -->
          <task value="7" name="EnterpriseDeploymentAPI" />
          <!-- WinRT API Begin/End task -->
        </tasks>
        <templates>
          <template tid="tString">
            <data name="LoggingString" inType="win:UnicodeString" />
          </template>
          <template tid="tStringAndHr">
            <data name="LoggingString" inType="win:UnicodeString" />
            <data name="LoggingHr" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="tStringAndString">
            <data name="LoggingString1" inType="win:UnicodeString" />
            <data name="LoggingString2" inType="win:UnicodeString" />
          </template>
          <template tid="tRequestIdAndStateAndHrAndPercent">
            <data name="Requestid" inType="win:GUID" outType="xs:GUID" />
            <data name="State" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="LoggingHr" inType="win:UInt32" outType="win:HexInt32" />
            <data name="PercentComplete" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="tEnterpriseIdAndValidationState">
            <data name="EnterpriseId" inType="win:GUID" outType="xs:GUID" />
            <data name="ValidationState" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="tTraceMessage">
            <data inType="win:Pointer" name="Message" />
          </template>
          <template tid="tUInt32">
            <data name="p1" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template__p0_GUID_Default">
            <data name="p0" inType="win:GUID" />
          </template>
          <template tid="Template" />
          <template tid="Template__p0_UInt32_HexInt32">
            <data name="p0" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_UInt32_HexInt32__p1_UInt32_HexInt32">
            <data name="p0" inType="win:UInt32" outType="win:HexInt32" />
            <data name="p1" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_UInt32_unsignedInt__p1_UInt32_unsignedInt__p2_UInt32_HexInt32">
            <data name="p0" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_Boolean_Default__p2_Boolean_Default">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:Boolean" />
            <data name="p2" inType="win:Boolean" />
          </template>
          <template tid="Template__p0_Boolean_Default__p1_Boolean_Default">
            <data name="p0" inType="win:Boolean" />
            <data name="p1" inType="win:Boolean" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_UnicodeString_Default__p2_UnicodeString_Default__p3_GUID_Default__p4_UnicodeString_Default">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UnicodeString" />
            <data name="p2" inType="win:UnicodeString" />
            <data name="p3" inType="win:GUID" />
            <data name="p4" inType="win:UnicodeString" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_UnicodeString_Default__p2_UInt32_HexInt32">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UnicodeString" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_UInt32_unsignedInt__p1_UInt32_unsignedInt">
            <data name="p0" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p1" inType="win:UInt32" outType="xs:unsignedInt" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_UInt32_HexInt32">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_UnicodeString_Default">
            <data name="p0" inType="win:UnicodeString" />
          </template>
          <template tid="Template__p0_UInt32_unsignedInt__p1_UnicodeString_Default">
            <data name="p0" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p1" inType="win:UnicodeString" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_GUID_Default">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:GUID" />
          </template>
          <template tid="Template__p0_UInt32_unsignedInt__p1_GUID_Default__p2_GUID_Default">
            <data name="p0" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p1" inType="win:GUID" />
            <data name="p2" inType="win:GUID" />
          </template>
          <template tid="Template__p0_UnicodeString_Default__p1_GUID_Default">
            <data name="p0" inType="win:UnicodeString" />
            <data name="p1" inType="win:GUID" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_GUID_Default__p2_UInt32_HexInt32">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:GUID" />
            <data name="p2" inType="win:UInt32" outType="win:HexInt32" />
          </template>
          <template tid="Template__p0_GUID_Default__p1_UnicodeString_Default">
            <data name="p0" inType="win:GUID" />
            <data name="p1" inType="win:UnicodeString" />
          </template>
          <template tid="Template__p0_UnicodeString_Default__p1_UInt32_unsignedInt__p2_GUID_Default__p3_GUID_Default__p4_UnicodeString_Default__p5_UnicodeString_Default">
            <data name="p0" inType="win:UnicodeString" />
            <data name="p1" inType="win:UInt32" outType="xs:unsignedInt" />
            <data name="p2" inType="win:GUID" />
            <data name="p3" inType="win:GUID" />
            <data name="p4" inType="win:UnicodeString" />
            <data name="p5" inType="win:UnicodeString" />
          </template>
          <template tid="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32">
            <data name="p0" inType="win:UnicodeString" />
            <data name="p1" inType="win:UInt32" outType="win:HexInt32" />
          </template>
        </templates>
        <events>
          <!-- Component:EnterpriseAppMgmtSvc:1000 -->
          <event value="1000" opcode="win:Info" level="win:Verbose" symbol="EnterpriseAppMgmtSvcPublishingWNFState" message="$(string.EnterpriseAppMgmtSvc.PublishingWNFState)" template="Template__p0_GUID_Default" />
          <event value="1001" symbol="EnterpriseAppMgmtSvcError" keywords="EnterpriseAppMgmtSvc Error" level="win:Error" template="tStringAndHr" message="$(string.Event.EnterpriseAppMgmtSvcError)" />
          <event value="1002" symbol="EnterpriseAppMgmtSvcStart" task="EnterpriseAppMgmtSvc" opcode="win:Start" keywords="EnterpriseAppMgmtSvc" level="win:Warning" message="$(string.Event.EnterpriseAppMgmtSvcStarted)" />
          <event value="1003" symbol="EnterpriseAppMgmtSvcStopped" task="EnterpriseAppMgmtSvc" opcode="win:Stop" keywords="EnterpriseAppMgmtSvc" level="win:Warning" message="$(string.Event.EnterpriseAppMgmtSvcStopped)" />
          <event value="1004" symbol="EnterpriseAppMgmtSvcApiBegin" task="EnterpriseAppMgmtSvcApi" opcode="win:Start" keywords="EnterpriseAppMgmtSvc" level="win:Verbose" template="tString" message="$(string.Event.EnterpriseAppMgmtSvcApiBegin)" />
          <event value="1005" symbol="EnterpriseAppMgmtSvcApiEnd" task="EnterpriseAppMgmtSvcApi" opcode="win:Stop" keywords="EnterpriseAppMgmtSvc" level="win:Verbose" template="tStringAndHr" message="$(string.Event.EnterpriseAppMgmtSvcApiEnd)" />
          <event value="1006" symbol="EnterpriseAppMgmtSvcInterfaceDestructed" keywords="EnterpriseAppMgmtSvc" level="win:Informational" template="tString" message="$(string.Event.EnterpriseAppMgmtSvcInterfaceDestructed)" />
          <event value="1007" symbol="EnterpriseAppMgmtSvcXapDownloadedButNotEnrolled" keywords="EnterpriseAppMgmtSvc" level="win:Warning" template="tStringAndString" message="$(string.Event.EnterpriseAppMgmtSvcXapDownloadedButNotEnrolled)" />
          <event value="1008" symbol="EnterpriseAppMgmtXapRequestAlreadyInProgress" keywords="EnterpriseAppMgmtSvc" level="win:Error" template="tString" message="$(string.Event.EnterpriseAppMgmtXapRequestAlreadyInProgress)" />
          <event value="1009" symbol="EnterpriseAppMgmtSvcXapStateChange" keywords="EnterpriseAppMgmtSvc" level="win:Informational" template="tRequestIdAndStateAndHrAndPercent" message="$(string.Event.EnterpriseAppMgmtSvcXapStateChange)" />
          <event value="1010" symbol="EnterpriseAppMgmtSvcEnrollmentUpdated" keywords="EnterpriseAppMgmtSvc" level="win:Informational" template="tEnterpriseIdAndValidationState" message="$(string.Event.EnterpriseAppMgmtSvcEnrollmentUpdated)" />
          <event value="1011" symbol="EnterpriseAppMgmtSvcCoGetSharedServiceId" keywords="EnterpriseAppMgmtSvc" level="win:Informational" template="tUInt32" message="$(string.Event.EnterpriseAppMgmtSvcCoGetSharedServiceId)" />
          <event value="1012" symbol="EnterpriseAppMgmtSvcCoAddRefSharedService" keywords="EnterpriseAppMgmtSvc" level="win:Verbose" template="tUInt32" message="$(string.Event.EnterpriseAppMgmtSvcCoAddRefSharedService)" />
          <event value="1013" symbol="EnterpriseAppMgmtSvcCoReleaseSharedService" keywords="EnterpriseAppMgmtSvc" level="win:Verbose" template="tUInt32" message="$(string.Event.EnterpriseAppMgmtSvcCoReleaseSharedService)" />
          <event value="1014" opcode="win:Info" level="win:Informational" symbol="EnterpriseAppMgmtSvcPolicyRun" message="$(string.EnterpriseAppMgmtSvc.PolicyRun)" template="Template" />
          <event value="1015" opcode="win:Info" level="win:Informational" symbol="EnterpriseAppMgmtSvcAppxInstall" message="$(string.EnterpriseAppMgmtSvc.AppxInstall)" template="Template__p0_UnicodeString_Default__p1_GUID_Default" />
          <event value="1016" opcode="win:Info" level="win:Informational" symbol="EnterpriseAppMgmtSvcEnrollmentCompleted" message="$(string.EnterpriseAppMgmtSvc.EnrollmentCompleted)" template="Template__p0_GUID_Default" />
          <event value="1017" opcode="win:Info" level="win:Verbose" symbol="EnterpriseAppMgmtSvcClearEntryFromProductId" message="$(string.EnterpriseAppMgmtSvc.ClearEntryFromProductId)" template="Template__p0_GUID_Default__p1_GUID_Default__p2_UInt32_HexInt32" />
          <event value="1018" opcode="win:Info" level="win:Verbose" symbol="EnterpriseAppMgmtSvcClearEntryFromEnterpriseId" message="$(string.EnterpriseAppMgmtSvc.ClearEntryFromEnterpriseId)" template="Template__p0_GUID_Default__p1_GUID_Default__p2_UInt32_HexInt32" />
          <event value="1019" opcode="win:Info" level="win:Informational" symbol="EnterpriseAppMgmtSvcUnenrollQueued" message="$(string.EnterpriseAppMgmtSvc.UnenrollQueued)" template="Template__p0_GUID_Default" />
          <event value="1020" opcode="win:Info" level="win:Informational" symbol="EnterpriseAppMgmtSvcUnenrollComplete" message="$(string.EnterpriseAppMgmtSvc.UnenrollComplete)" template="Template__p0_GUID_Default" />
          <event value="1021" opcode="win:Info" level="win:Error" symbol="EnterpriseAppMgmtSvcTransferAlreadyExists" message="$(string.EnterpriseAppMgmtSvc.TransferAlreadyExists)" template="Template__p0_GUID_Default__p1_UnicodeString_Default" />
          <event value="1022" opcode="win:Info" level="win:Informational" symbol="EnterpriseAppMgmtSvcEnterpriseAppManagerInstalledApplicationInfo" message="$(string.EnterpriseAppMgmtSvc.EnterpriseAppManagerInstalledApplicationInfo)" template="Template__p0_GUID_Default" />
          <event value="1023" opcode="win:Info" level="win:Informational" symbol="EnterpriseAppMgmtSvcProcessInstallFile" message="$(string.EnterpriseAppMgmtSvc.ProcessInstallFile)" template="Template__p0_UnicodeString_Default__p1_UInt32_unsignedInt__p2_GUID_Default__p3_GUID_Default__p4_UnicodeString_Default__p5_UnicodeString_Default" />
          <!-- Component:EnterpriseAppDB:2000 -->
          <event value="2001" symbol="EnterpriseAppDBError" keywords="EnterpriseAppDB Error" level="win:Error" template="tStringAndHr" message="$(string.Event.EnterpriseAppDBError)" />
          <event value="2002" symbol="EnterpriseAppDBWarning" keywords="EnterpriseAppDB" level="win:Warning" template="tStringAndHr" message="$(string.Event.EnterpriseAppDBWarning)" />
          <!-- Component:EnterpriseAppMgmtCSP:3000 -->
          <event value="3001" symbol="EnterpriseAppMgmtCSPError" keywords="EnterpriseAppMgmtCSP Error" level="win:Error" template="tStringAndHr" message="$(string.Event.EnterpriseAppMgmtCSPError)" />
          <event value="3002" symbol="EnterpriseAppMgmtCSPApiBegin" task="EnterpriseAppMgmtCSPApi" opcode="win:Start" keywords="EnterpriseAppMgmtCSP" level="win:Informational" template="tString" message="$(string.Event.EnterpriseAppMgmtCSPApiBegin)" />
          <event value="3003" symbol="EnterpriseAppMgmtCSPApiEnd" task="EnterpriseAppMgmtCSPApi" opcode="win:Stop" keywords="EnterpriseAppMgmtCSP" level="win:Informational" template="tStringAndHr" message="$(string.Event.EnterpriseAppMgmtCSPApiEnd)" />
          <event value="3004" opcode="win:Info" level="win:Verbose" symbol="EnterpriseCSPCEnterpriseAppMgmtCSPGetNode" message="$(string.EnterpriseCSP.CEnterpriseAppMgmtCSPGetNode)" template="Template__p0_UInt32_unsignedInt__p1_UnicodeString_Default" />
          <event value="3005" opcode="win:Info" level="win:Informational" symbol="EnterpriseCSPCEnterpriseAppMgmtDownloadCSPLeafNode" message="$(string.EnterpriseCSP.CEnterpriseAppMgmtDownloadCSPLeafNode)" template="Template__p0_GUID_Default__p1_GUID_Default" />
          <event value="3006" opcode="win:Info" level="win:Informational" symbol="EnterpriseCSPInnerChildDeleteChild" message="$(string.EnterpriseCSP.InnerChildDeleteChild)" template="Template__p0_UInt32_unsignedInt__p1_GUID_Default__p2_GUID_Default" />
          <event value="3007" opcode="win:Info" level="win:Informational" symbol="EnterpriseCSPCEnterpriseAppMgmtUninstallCSPLeafNode" message="$(string.EnterpriseCSP.CEnterpriseAppMgmtUninstallCSPLeafNode)" template="Template__p0_GUID_Default__p1_GUID_Default" />
          <!-- Component:EnterpriseValidation:4000 -->
          <event value="4001" symbol="EnterpriseValidationError" keywords="EnterpriseValidation Error" level="win:Error" template="tStringAndHr" message="$(string.Event.EnterpriseValidationError)" />
          <event value="4002" symbol="EnterpriseValidationStart" task="EnterpriseValidation" opcode="win:Start" keywords="EnterpriseValidation" level="win:Informational" message="$(string.Event.EnterpriseValidationStarted)" />
          <event value="4003" symbol="EnterpriseValidationStopped" task="EnterpriseValidation" opcode="win:Stop" keywords="EnterpriseValidation" level="win:Informational" message="$(string.Event.EnterpriseValidationStopped)" />
          <!-- Component:EnterpriseInstall:5000 -->
          <event value="5001" symbol="EnterpriseInstallError" keywords="EnterpriseInstall Error" level="win:Error" template="tStringAndHr" message="$(string.Event.EnterpriseInstallError)" />
          <event value="5002" symbol="EnterpriseInstallStart" task="EnterpriseInstall" opcode="win:Start" keywords="EnterpriseInstall" level="win:Informational" message="$(string.Event.EnterpriseInstallStarted)" />
          <event value="5003" symbol="EnterpriseInstallStopped" task="EnterpriseInstall" opcode="win:Stop" keywords="EnterpriseInstall" level="win:Informational" message="$(string.Event.EnterpriseInstallStopped)" />
          <!-- Component:EnterpriseGeneric:6000 -->
          <event value="6001" symbol="_ETWMESSAGE" task="tracemessage" keywords="Debug" template="tTraceMessage" />
          <!-- Component:EnterpriseWinRT:7000 -->
          <event value="7001" symbol="EnterpriseDeploymentError" keywords="EnterpriseDeployment Error" level="win:Error" template="tStringAndHr" message="$(string.Event.EnterpriseDeploymentError)" />
          <event value="7002" symbol="EnterpriseDeploymentApiBegin" task="EnterpriseDeploymentAPI" opcode="win:Start" keywords="EnterpriseAppMgmtSvc" level="win:Informational" template="tString" message="$(string.Event.EnterpriseDeploymentApiBegin)" />
          <event value="7003" symbol="EnterpriseDeploymentApiEnd" task="EnterpriseDeploymentAPI" opcode="win:Stop" keywords="EnterpriseAppMgmtSvc" level="win:Informational" template="tStringAndHr" message="$(string.Event.EnterpriseDeploymentApiEnd)" />
          <!-- Component:PolicyManager:8000 -->
          <event value="7004" opcode="win:Info" level="win:Informational" symbol="PolicyDatabaseInitialize" message="$(string.PolicyDatabase.Initialize)" template="Template__p0_UInt32_HexInt32" />
          <event value="7005" opcode="win:Info" level="win:Informational" symbol="PolicyManagerStart" message="$(string.PolicyManager.Start)" template="Template__p0_UInt32_HexInt32" />
          <event value="7006" opcode="win:Info" level="win:Informational" symbol="PolicyManagerClose" message="$(string.PolicyManager.Close)" template="Template__p0_UInt32_HexInt32" />
          <event value="7007" opcode="win:Info" level="win:Informational" symbol="PolicyManagerRun" message="$(string.PolicyManager.Run)" template="Template__p0_UInt32_HexInt32__p1_UInt32_HexInt32" />
          <event value="7008" opcode="win:Info" level="win:Informational" symbol="PolicyManagerNoPolicy" message="$(string.PolicyManager.NoPolicy)" template="Template" />
          <event value="7009" opcode="win:Info" level="win:Informational" symbol="PolicyManagerAfterRunLoadPolicy" message="$(string.PolicyManager.AfterRunLoadPolicy)" template="Template__p0_UInt32_unsignedInt__p1_UInt32_unsignedInt__p2_UInt32_HexInt32" />
          <event value="7010" opcode="win:Info" level="win:Verbose" symbol="PolicyManagerQueryApp" message="$(string.PolicyManager.QueryApp)" template="Template__p0_GUID_Default__p1_Boolean_Default__p2_Boolean_Default" />
          <event value="7011" opcode="win:Info" level="win:Verbose" symbol="PolicyManagerEnableApp" message="$(string.PolicyManager.EnableApp)" template="Template__p0_GUID_Default__p1_UInt32_HexInt32" />
          <event value="7012" opcode="win:Info" level="win:Verbose" symbol="PolicyManagerDisableApp" message="$(string.PolicyManager.DisableApp)" template="Template__p0_GUID_Default__p1_UInt32_HexInt32" />
          <event value="7013" opcode="win:Info" level="win:Informational" symbol="PolicyManagerApplyPolicyForFirstPartyExperiences" message="$(string.PolicyManager.ApplyPolicyForFirstPartyExperiences)" template="Template__p0_Boolean_Default__p1_Boolean_Default" />
          <event value="7014" opcode="win:Info" level="win:Informational" symbol="EntUnitApps" message="$(string.Ent.UnitApps)" template="Template__p0_GUID_Default__p1_UnicodeString_Default__p2_UnicodeString_Default__p3_GUID_Default__p4_UnicodeString_Default" />
          <event value="7015" opcode="win:Info" level="win:Informational" symbol="EntUnitProps" message="$(string.Ent.UnitProps)" template="Template__p0_Boolean_Default__p1_Boolean_Default" />
          <event value="7016" opcode="win:Info" level="win:Informational" symbol="EntUnitDisable" message="$(string.Ent.UnitDisable)" template="Template" />
          <event value="7017" opcode="win:Info" level="win:Verbose" symbol="PolicyManagerEnterpriseCheckIfAppIsAllowed" message="$(string.PolicyManager.EnterpriseCheckIfAppIsAllowed)" template="Template__p0_GUID_Default__p1_UnicodeString_Default__p2_UInt32_HexInt32" />
          <event value="7018" opcode="win:Info" level="win:Warning" symbol="PolicyManagerSkippingOldPolicyVersion" message="$(string.PolicyManager.SkippingOldPolicyVersion)" template="Template__p0_UInt32_unsignedInt__p1_UInt32_unsignedInt" />
          <event value="7019" opcode="win:Info" level="win:Verbose" symbol="PolicyManagerSkipInRomApp" message="$(string.PolicyManager.SkipInRomApp)" template="Template__p0_GUID_Default" />
          <event value="7020" opcode="win:Info" level="win:Verbose" symbol="PolicyManagerSkipSettingsApp" message="$(string.PolicyManager.SkipSettingsApp)" template="Template__p0_GUID_Default" />
          <!-- Component:Generic:10000 -->
          <event value="7021" opcode="win:Info" level="win:Error" symbol="UnmanagedEnterpriseCPLUnableToInitializeEnterprise" message="$(string.UnmanagedEnterpriseCPL.UnableToInitializeEnterprise)" template="Template__p0_GUID_Default__p1_UInt32_HexInt32" />
          <event value="7022" opcode="win:Info" level="win:Error" symbol="UnmanagedEnterpriseCPLUnknownEnrollmentState" message="$(string.UnmanagedEnterpriseCPL.UnknownEnrollmentState)" template="Template__p0_GUID_Default__p1_UInt32_HexInt32" />
          <event value="7023" opcode="win:Info" level="win:Error" symbol="UnmanagedEnterpriseCPLUnableToCreateAsyncOperation" message="$(string.UnmanagedEnterpriseCPL.UnableToCreateAsyncOperation)" template="Template__p0_UInt32_HexInt32" />
          <event value="7024" opcode="win:Info" level="win:Error" symbol="UnmanagedEnterpriseCPLEnterpriseWorkersError" message="$(string.UnmanagedEnterpriseCPL.EnterpriseWorkersError)" template="Template__p0_UInt32_HexInt32" />
          <event value="7025" opcode="win:Info" level="win:Informational" symbol="UnmanagedEnterpriseCPLUserCancelledUnenrollment" message="$(string.UnmanagedEnterpriseCPL.UserCancelledUnenrollment)" template="Template" />
          <event value="7026" opcode="win:Info" level="win:Informational" symbol="UnmanagedEnterpriseCPLUserCancelledEnrollment" message="$(string.UnmanagedEnterpriseCPL.UserCancelledEnrollment)" template="Template" />
          <event value="7027" opcode="win:Info" level="win:Error" symbol="EnterpriseInstallationInvalidFile" message="$(string.EnterpriseInstallation.InvalidFile)" template="Template__p0_UInt32_HexInt32" />
          <event value="7028" opcode="win:Info" level="win:Error" symbol="EnterpriseInstallationInvalidFileCannotFindToken" message="$(string.EnterpriseInstallation.InvalidFileCannotFindToken)" template="Template__p0_UInt32_HexInt32" />
          <event value="7029" opcode="win:Info" level="win:Error" symbol="PolicyManagerPolicyLoadError" message="$(string.PolicyManager.PolicyLoadError)" template="Template__p0_UnicodeString_Default" />
          <event value="7030" opcode="win:Info" level="win:Error" symbol="EnterpriseAetXmlLoadFailure" message="$(string.Enterprise.AetXmlLoadFailure)" template="Template__p0_UnicodeString_Default__p1_UInt32_HexInt32" />
        </events>
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <!-- Keywords -->
        <string id="Keyword.Error" value="Error" />
        <string id="Keyword.Performance" value="Performance" />
        <string id="Keyword.EnterpriseAppMgmtSvc" value="EnterpriseAppMgmtSvc" />
        <string id="Keyword.EnterpriseAppDB" value="EnterpriseAppDB" />
        <string id="Keyword.EnterpriseAppMgmtCSP" value="EnterpriseAppMgmtCSP" />
        <string id="Keyword.EnterpriseValidation" value="EnterpriseValidation" />
        <string id="Keyword.EnterpriseInstall" value="EnterpriseInstall" />
        <string id="Keyword.Debug" value="Debug" />
        <string id="Keyword.EnterpriseDeployment" value="EnterpriseDeployment" />
        <!-- EnterpriseAppMgmtSvc -->
        <string id="EnterpriseAppMgmtSvc.ProcessInstallFile" value="Enterprise File Info: %1, Type = %2, %3, %4, %5, %6" />
        <string id="EnterpriseAppMgmtSvc.EnterpriseAppManagerInstalledApplicationInfo" value="EnterpriseAppManager::InstalledApplicationInfo - ProductID = %1" />
        <string id="EnterpriseAppMgmtSvc.TransferAlreadyExists" value="BTS already has a request for %1 - %2" />
        <string id="EnterpriseAppMgmtSvc.UnenrollComplete" value="Completed unenrollment of %1" />
        <string id="EnterpriseAppMgmtSvc.UnenrollQueued" value="Queued unenrollment of %1" />
        <string id="EnterpriseAppMgmtSvc.ClearEntryFromEnterpriseId" value="Clearing request %1 for enterprise %2 - %3" />
        <string id="EnterpriseAppMgmtSvc.ClearEntryFromProductId" value="Clearing request %1 for productId %2 - %3" />
        <string id="EnterpriseAppMgmtSvc.EnrollmentCompleted" value="Enrolled enterprise %1" />
        <string id="EnterpriseAppMgmtSvc.AppxInstall" value="Starting APPX install: %1 - %2" />
        <string id="EnterpriseAppMgmtSvc.PolicyRun" value="Running policy manager from service" />
        <string id="EnterpriseAppMgmtSvc.PublishingWNFState" value="Publishing WNF state for enrollment: %1" />
        <string id="Event.EnterpriseAppMgmtSvcError" value="EnterpriseAppMgmtSvc Error [%1] with HResult = [%2]" />
        <string id="Event.EnterpriseAppMgmtSvcStarted" value="EnterpriseAppMgmtSvc Started" />
        <string id="Event.EnterpriseAppMgmtSvcStopped" value="EnterpriseAppMgmtSvc Stopped" />
        <string id="Event.EnterpriseAppMgmtSvcApiBegin" value="EnterpriseAppMgmtSvc [%1] Begin" />
        <string id="Event.EnterpriseAppMgmtSvcApiEnd" value="EnterpriseAppMgmtSvc [%1] End with HResult = [%2]" />
        <string id="Event.EnterpriseAppMgmtSvcInterfaceDestructed" value="EnterpriseAppMgmtSvc Interface [%1] has been destructed" />
        <string id="Event.EnterpriseAppMgmtSvcXapDownloadedButNotEnrolled" value="XAP with ProductId [%1] has been downloaded, but the  Enterprise [%2] has not yet been validated" />
        <string id="Event.EnterpriseAppMgmtXapRequestAlreadyInProgress" value="Unable to queue XAP request because ProductId [%1] is already queued for installation (need to cancel existing request or wait for it to finish before queuing another request with same ProductId)." />
        <string id="Event.EnterpriseAppMgmtSvcXapStateChange" value="XAP request [%1] State Change [%2], HR: [%3], Percent Complete: [%4]." />
        <string id="Event.EnterpriseAppMgmtSvcEnrollmentUpdated" value="Enrollment [%1], Validation State: [%2]." />
        <string id="Event.EnterpriseAppMgmtSvcCoGetSharedServiceId" value="CoGetSharedServiceId returned Id of [%1]." />
        <string id="Event.EnterpriseAppMgmtSvcCoAddRefSharedService" value="CoAddRefSharedService returned refCount [%1]." />
        <string id="Event.EnterpriseAppMgmtSvcCoReleaseSharedService" value="CoReleaseSharedService returned refCount [%1]." />
        <!-- EnterpriseAppDB -->
        <string id="Event.EnterpriseAppDBError" value="EnterpriseAppDB Error [%1] with HResult = [%2]" />
        <string id="Event.EnterpriseAppDBWarning" value="EnterpriseAppDB Warning [%1] with HResult = [%2]" />
        <!-- EnterpriseAppMgmtCSP -->
        <string id="Event.EnterpriseAppMgmtCSPError" value="EnterpriseAppMgmtCSP Error [%1] with HResult = [%2]" />
        <string id="Event.EnterpriseAppMgmtCSPApiBegin" value="EnterpriseAppMgmtCSP [%1] Begin" />
        <string id="Event.EnterpriseAppMgmtCSPApiEnd" value="EnterpriseAppMgmtCSP [%1] End with HResult = [%2]" />
        <string id="EnterpriseCSP.CEnterpriseAppMgmtCSPGetNode" value="CEnterpriseAppMgmtCSPGetNode: Count (%1) - %2" />
        <string id="EnterpriseCSP.CEnterpriseAppMgmtDownloadCSPLeafNode" value="Starting install: %1 - %2" />
        <string id="EnterpriseCSP.InnerChildDeleteChild" value="Initiating Uninstall: type = %1 - %2, %3" />
        <string id="EnterpriseCSP.CEnterpriseAppMgmtUninstallCSPLeafNode" value="Initiating Uninstall: %1, %2" />
        <!-- EnterpriseValidation -->
        <string id="Event.EnterpriseValidationError" value="EnterpriseValidation Error [%1] with HResult = [%2]" />
        <string id="Event.EnterpriseValidationStarted" value="EnterpriseValidation Started" />
        <string id="Event.EnterpriseValidationStopped" value="EnterpriseValidation Stopped" />
        <!-- EnterpriseInstall -->
        <string id="Event.EnterpriseInstallError" value="EnterpriseInstall Error [%1] with HResult = [%2]" />
        <string id="Event.EnterpriseInstallStarted" value="EnterpriseInstall Started" />
        <string id="Event.EnterpriseInstallStopped" value="EnterpriseInstall Stopped" />
        <!-- EnterpriseWinRT -->
        <string id="Event.EnterpriseDeploymentError" value="EnterpriseDeployment Error [%1] with HResult = [%2]" />
        <string id="Event.EnterpriseDeploymentApiBegin" value="EnterpriseDeployment [%1] Begin" />
        <string id="Event.EnterpriseDeploymentApiEnd" value="EnterpriseDeployment [%1] End with HResult = [%2]" />
        <!-- PolicyManager -->
        <string id="PolicyDatabase.Initialize" value="PolicyDatabaseInitialize: %1" />
        <string id="PolicyManager.Start" value="StartPolicyManager: %1" />
        <string id="PolicyManager.Close" value="ClosePolicyManager: %1" />
        <string id="PolicyManager.Run" value="PolicyManager: AllowDenyList = %1, FirstPartyExperiences = %2" />
        <string id="PolicyManager.NoPolicy" value="PolicyManager: No policy to apply" />
        <string id="PolicyManager.AfterRunLoadPolicy" value="PolicyManager loaded policy: Type = %1, Version = %2, HR = %3" />
        <string id="PolicyManager.QueryApp" value="PolicyManager Found app: %1 - Disabled = %2, Uninstallable = %3" />
        <string id="PolicyManager.EnableApp" value="PolicyManager enable app: %1 - %2" />
        <string id="PolicyManager.DisableApp" value="PolicyManager disable app: %1 - %2" />
        <string id="PolicyManager.ApplyPolicyForFirstPartyExperiences" value="PolicyManagerApplyPolicyForFirstPartyExperiences: Store enabled = %1, IE enabled = %2" />
        <string id="PolicyManager.EnterpriseCheckIfAppIsAllowed" value="EnterpriseCheckIfAppIsAllowed: %1, %2, HR = %3" />
        <string id="PolicyManager.SkippingOldPolicyVersion" value="The loaded policy is out of date: lastAppliedVersion - %1, newVersion - %2" />
        <string id="PolicyManager.SkipInRomApp" value="Not touching %1 because it is an IN_ROM app" />
        <string id="PolicyManager.SkipSettingsApp" value="Not touching %1 because it is a settings app" />
        <string id="PolicyManager.PolicyLoadError" value="Unable to load the enterprise policy: Parse Error - %1" />
        <!-- Generic -->
        <string id="Task.TraceMessage" value="Trace" />
        <string id="Ent.UnitApps" value="Found app: %1 - %2 - %3 (%4 - %5)" />
        <string id="Ent.UnitProps" value="Found app: %1 - %2" />
        <string id="Ent.UnitDisable" value="Disable app" />
        <string id="UnmanagedEnterpriseCPL.UnableToInitializeEnterprise" value="Failed to initialize enterprise. Enterprise Id: '%1', Error code: '%2'." />
        <string id="UnmanagedEnterpriseCPL.UnknownEnrollmentState" value="DetermineEnterpriseStatus - Cannot figure out enterprise status since unexpected value of ENTERPRISE_APP_ENROLLMENT_STATE found. Enterprise Id: '%1', ENTERPRISE_APP_ENROLLMENT_STATE value: '%2'." />
        <string id="UnmanagedEnterpriseCPL.UnableToCreateAsyncOperation" value="UnenrollAsync - Error during initialization of UnenrollOperation, error code: %1." />
        <string id="UnmanagedEnterpriseCPL.EnterpriseWorkersError" value="Unable to create threadpool or unable to submit workitem into threadpool. Error code: %1." />
        <string id="UnmanagedEnterpriseCPL.UserCancelledUnenrollment" value="DoUnenrollAsync - User cancelled unenrollment of the enterprise." />
        <string id="UnmanagedEnterpriseCPL.UserCancelledEnrollment" value="DoEnrollAsync - User cancelled enrollment of the enterprise." />
        <string id="EnterpriseInstallation.InvalidFile" value="EnrollEnterpriseFromUri invalid enterprise enrollment file. Error code: %1" />
        <string id="EnterpriseInstallation.InvalidFileCannotFindToken" value="EnrollEnterpriseFromUri invalid enterprise enrollment file. Cannot find enrollment token. Error code: %1" />
        <string id="Enterprise.AetXmlLoadFailure" value="Failed to load AET token: %1 - %2" />
      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>