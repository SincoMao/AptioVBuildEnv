<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<!--
Use of this source code is subject to the terms of the Microsoft shared
source or premium shared source license agreement under which you licensed
this source code. If you did not accept the terms of the license agreement,
you are not authorized to use this source code. For the terms of the license,
please see the license agreement between you and Microsoft or, if applicable,
see the SOURCE.RTF on your install media or the root of your tools installation.
THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
-->

<instrumentationManifest
  xmlns="http://schemas.microsoft.com/win/2004/08/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation 
    xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    
    <events xmlns="http://schemas.microsoft.com/win/2004/08/events">

      <provider 
        name="Microsoft-WindowsPhone-CuiInterop"
        guid="{16b56e53-6337-4148-9114-c8d7383c8151}" 
        resourceFileName="CuiInterop.dll" 
        messageFileName="CuiInterop.dll"
        symbol="MICROSOFT_WINDOWSPHONE_CUIINTEROP">
             
        <keywords>

          <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
          <keyword mask="0x0000000000000001" name="Error"
              message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance"
              message="$(string.Keyword.Performance)" />
              
          <!-- CuiInterop related keywords -->
          <keyword mask="0x0000000000000004" name="CuiInteropOperation"
              message="$(string.Keyword.CuiInteropOperation)" />

        </keywords>
        

        <templates>
          <template tid="tid_Operation">
            <data inType="win:AnsiString" name="Function"/>
            <data inType="win:Int32"      name="Line"/>
            <data inType="win:AnsiString" name="Expression"/>
          </template>

          
          <template tid="tid_Failure">
            <data inType="win:AnsiString" name="Expression"/>
            <data inType="win:HexInt32" name="Result"/>          
          </template>
          
        </templates>
        

        <events>
          <event value="100"
              symbol="CuiInteropOperation"
              keywords="CuiInteropOperation"
              level="win:Error"
              template="tid_Operation"
              message="$(string.CuiInteropOperation)"              
              />
              
          <event value="101"
              symbol="CuiInteropError"
              keywords="Error"
              level="win:Error"
              template="tid_Failure"
              message="$(string.CuiInteropFailure)"
              />
        </events>
        
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
      
        <!-- Keywords -->
        <string id="Keyword.Error"                    value="Error" />
        <string id="Keyword.Performance"              value="Performance" />
        <string id="Keyword.CuiInteropOperation"      value="Operation" />
      
        <string id="EventProviderName" value="Microsoft-WindowsPhone-CuiInterop" />
        <string id="CuiInteropFailure" value="FAILED(hr=%2): %1" />
        <string id="CuiInteropOperation" value="%1(%2): %3" />
        
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>