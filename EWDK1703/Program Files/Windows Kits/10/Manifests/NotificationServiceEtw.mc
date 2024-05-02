<!-- <?xml version="1.0" encoding="UTF-16"?> -->
<instrumentationManifest xmlns="http://schemas.microsoft.com/win/2004/08/events"
            xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
            xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <instrumentation>
        <events xmlns="http://schemas.microsoft.com/win/2004/08/events">
            <provider name="Microsoft-WindowsPhone-NotificationService"
            guid="{4F386063-EF17-4629-863C-D71597AF743D}"
            symbol="MICROSOFT_WINDOWSPHONE_NOTIFICATIONSERVICE"
            messageFileName="NotificationService.dll"
            resourceFileName="NotificationService.dll">
                <keywords>
                    <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
                    <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
                    <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
                    <keyword mask="0x0000000000000004" name="Debug" message="$(string.Keyword.Debug)" />
                    <keyword mask="0x0000000000000010" name="Information" message="$(string.Keyword.Information)" />
                </keywords>
                <tasks>
                    <task value="1" name="LogTrace" />
                    <task value="101" name="NotificationServiceInitialize" />
                    <task value="102" name="NotificationServiceInitializeFailed" />
                    <task value="103" name="NotificationServiceUninitialize" />
                    <task value="104" name="NotificationServiceUninitializeFailed" />
                    <task value="105" name="NotificationServiceRegisterClassFactoryCallbackFailed" />
                    <task value="106" name="NotificationServiceRevokeClassFactoryCallbackFailed" />
                    <task value="107" name="NotificationServicePreShutdownCallback" />
                    <task value="108" name="NotificationServicePreShutdownCallbackFailed" />
                </tasks>
                <events>
                    <!-- Debug logging -->
                    <event value="1"
                        symbol="Debug_Trace_Verbose"
                        level="win:Verbose"
                        task="LogTrace"
                        template="Template_Debug_Trace"
                        keywords="Debug"
                        opcode="win:Info"
                        message="$(string.Format.Debug.Trace)" />

                    <!-- Specific logging -->
                    <event value="101"
                          symbol="NotificationService_Initialize"
                          level="win:Informational"
                          task="NotificationServiceInitialize"
                          template="Template_String"
                          keywords="Information"
                          opcode="win:Info"
                          message="$(string.Format.ServiceInitialize)" />
                    <event value="102"
                          symbol="NotificationService_Initialize_Failed"
                          level="win:Error"
                          task="NotificationServiceInitializeFailed"
                          template="Template_HResult"
                          keywords="Error"
                          opcode="win:Info"
                          message="$(string.Format.ServiceInitializeFailed)" />
                    <event value="103"
                          symbol="NotificationService_Uninitialize"
                          level="win:Informational"
                          task="NotificationServiceUninitialize"
                          template="Template_String"
                          keywords="Information"
                          opcode="win:Info"
                          message="$(string.Format.ServiceUninitialize)" />
                    <event value="104"
                          symbol="NotificationService_Uninitialize_Failed"
                          level="win:Error"
                          task="NotificationServiceUninitializeFailed"
                          template="Template_HResult"
                          keywords="Error"
                          opcode="win:Info"
                          message="$(string.Format.ServiceUninitializeFailed)" />
                    <event value="105"
                          symbol="NotificationService_RegisterClassFactoryCallback_Failed"
                          level="win:Error"
                          task="NotificationServiceRegisterClassFactoryCallbackFailed"
                          template="Template_HResult"
                          keywords="Error"
                          opcode="win:Info"
                          message="$(string.Format.RegisterClassFactoryCallbackFailed)" />
                    <event value="106"
                          symbol="NotificationService_RevokeClassFactoryCallback_Failed"
                          level="win:Error"
                          task="NotificationServiceRevokeClassFactoryCallbackFailed"
                          template="Template_HResult"
                          keywords="Error"
                          opcode="win:Info"
                          message="$(string.Format.RevokeClassFactoryCallbackFailed)" />
                    <event value="107"
                          symbol="NotificationService_PreShutdownCallback"
                          level="win:Informational"
                          task="NotificationServicePreShutdownCallback"
                          template="Template_String"
                          keywords="Information"
                          opcode="win:Info"
                          message="$(string.Format.PreShutdownCallback)" />
                    <event value="108"
                          symbol="NotificationService_PreShutdownCallback_Failed"
                          level="win:Error"
                          task="NotificationServicePreShutdownCallbackFailed"
                          template="Template_HResult"
                          keywords="Error"
                          opcode="win:Info"
                          message="$(string.Format.PreShutdownCallbackFailed)" />
                </events>
                <templates>
                    <template tid="Template_String">
                        <data name="p1_String" inType="win:UnicodeString" outType="xs:string" />
                    </template>
                    <template tid="Template_HResult">
                        <data name="p1_Hr" inType="win:UInt32" outType="win:HexInt32" />
                    </template>
                    <template tid="Template_Int">
                        <data name="p1_Int" inType="win:UInt32" outType="xs:unsignedInt" />
                    </template>
                    <template tid="Template_String_HResult">
                        <data name="p1_String" inType="win:UnicodeString" outType="xs:string" />
                        <data name="p2_Hr" inType="win:UInt32" outType="win:HexInt32" />
                    </template>
                    <template tid="Template_Debug_Trace">
                        <data name="Function" inType="win:UnicodeString" />
                        <data name="Line" inType="win:UInt32" />
                        <data name="ErrorMessage" inType="win:UnicodeString" />
                    </template>
                </templates>
            </provider>
        </events>
    </instrumentation>
    <localization>
        <resources culture="en-US">
            <stringTable>
              <string id="Keyword.Error" value="Error"/>
              <string id="Keyword.Performance" value="Performance"/>
              <string id="Keyword.Debug" value="Debug"/>
              <string id="Keyword.Verbose" value="Verbose"/>
              <string id="Keyword.Information" value="Information"/>
              <string id="Keyword.Warning" value="Warning"/>
              <string id="Format.Debug.Trace" value="[NotificationService]: [%1 (%2): %3]%n" />
              <string id="Format.ServiceInitialize" value="[NotificationService]: [%1]%n" />
              <string id="Format.ServiceInitializeFailed" value="[NotificationService]: ServiceInitialize failed, hr = [%1]%n" />
              <string id="Format.ServiceUninitialize" value="[NotificationService]: [%1]%n" />
              <string id="Format.ServiceUninitializeFailed" value="[NotificationService]: ServiceUninitialize failed, hr = [%1]%n" />
              <string id="Format.RegisterClassFactoryCallbackFailed" value="[NotificationService]: RegisterClassFactoryCallback failed, hr = [%1]%n" />
              <string id="Format.RevokeClassFactoryCallbackFailed" value="[NotificationService]: RevokeClassFactoryCallback failed, hr = [%1]%n" />
              <string id="Format.PreShutdownCallback" value="[NotificationService]: [%1]%n" />
              <string id="Format.PreShutdownCallbackFailed" value="[NotificationService]: PreShutdownCallback failed, hr = [%1]%n" />
            </stringTable>
        </resources>
    </localization>
</instrumentationManifest>
