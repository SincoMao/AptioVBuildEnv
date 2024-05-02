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

      <!-- Here we describe the provider that uses this manifest.
           Each provider will have its own manifest. -->
      <!-- Note: messageFileName and resourceFileName are unused on Windows Mobile, but
           it is recommended that you set them to the name of the provider's DLL/EXE. -->
      <provider name="Microsoft-WindowsPhone-Shell-Controls"
          guid="{10D98D0B-8650-4F59-9718-27EA53FB2F21}"
          symbol="MICROSOFT_WINDOWSPHONE_Shell_Controls"
          messageFileName="ShellControls.dll"
          resourceFileName="ShellControls.dll">

        <keywords>
          <keyword mask="0x0000000000000001" name="Debug"/>
          <keyword mask="0x0000000000000002" name="Performance"/>
        </keywords>

        <tasks>
          <task name="Image" value="1">
            <opcodes>
              <opcode name="ImageLoading" value="11"/>
              <opcode name="ImageFailed" value="12"/>
            </opcodes>
          </task>
          <task name="Template" value="2">
            <opcodes>
              <opcode name="TemplatePropertiesChanged" value="21"/>
            </opcodes>
          </task>
        </tasks>

        <templates>
          <template tid="OneString">
            <data inType="win:UnicodeString" name="Value1"/>
          </template>
          <template tid="ImageLoad">
            <data inType="win:UnicodeString" name="uri"/>
            <data inType="win:UInt32" name="synchronous"/>
            <data inType="win:UInt32" name="maxWidth"/>
            <data inType="win:UInt32" name="maxHeight"/>
          </template>
        </templates>

        <events>
          <event value="1"
              symbol="ShellControls_LoadingImage"
              keywords="Debug"
              level="win:Verbose"
              task="Image"
              opcode="ImageLoading"
              message="$(string.String_ShellControls_LoadingImage)"
              template="ImageLoad"/>

          <event value="2"
              symbol="ShellControls_LoadingImageError"
              keywords="Debug"
              level="win:Error"
              task="Image"
              opcode="ImageLoading"
              message="$(string.String_ShellControls_LoadingImageError)"
              template="OneString"/>

          <event value="3"
              symbol="ShellControls_TemplatePropertiesChanged"
              keywords="Debug"
              level="win:Verbose"
              task="Template"
              opcode="TemplatePropertiesChanged"
              message="$(string.String_ShellControls_TemplatePropertiesChanged)"/>
        </events>
      </provider>
    </events>
  </instrumentation>
  
  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="String_ShellControls_LoadingImage"                    value="Loading image '%1', synchronous=%2, max=%3x%4"/>
        <string id="String_ShellControls_LoadingImageError"               value="Failed to load '%1'"/>
        <string id="String_ShellControls_TemplatePropertiesChanged"       value="TemplatePropertiesChanged automation event fired."/>
        
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
