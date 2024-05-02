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
<!-- <?xml version="1.0" encoding="UTF-16"?> -->
<instrumentationManifest xsi:schemaLocation="http://schemas.microsoft.com/win/2004/08/events eventman.xsd" 
                         xmlns="http://schemas.microsoft.com/win/2004/08/events" 
                         xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events" 
                         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
                         xmlns:xs="http://www.w3.org/2001/XMLSchema" 
                         xmlns:trace="http://schemas.microsoft.com/win/2004/08/events/trace">
  <instrumentation>
    <events>
      <provider name="Microsoft-WindowsPhone-WinsockSecProvider" 
                guid="{EB2A9FCD-1CD6-41E4-BBD6-3B2430CEE816}" 
                symbol="MICROSOFT_WINDOWSPHONE_WINSOCKSEC_PROVIDER" 
                resourceFileName="WinsockSec.exe" 
                messageFileName="WinsockSec.exe">

        <keywords>
          <keyword mask="0x0000000000000001" name="Error"         message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance"   message="$(string.Keyword.Performance)" />
          <keyword mask="0x0000000000000004" name="Verbose"       message="$(string.Keyword.Verbose)" />
        </keywords>

        <!--Event Templates -->
        <templates>

          <template tid="WinsockSecOneError">
            <data name="Error" inType="win:UInt32" />
          </template>

          <template tid="WinsockSecFilterInfo">
            <data name="FilterId" inType="win:UInt64" />
            <data name="FilterName" inType="win:UnicodeString" />
            <data name="FilterDesc" inType="win:UnicodeString" />
          </template>
          
        </templates>

        <events>

          <event value="1"
                 symbol="WINSOCKSEC_START"  
                 level="win:Informational" 
                 keywords="Verbose" 
                 message="$(string.WinsockSecStart)" />

          <event value="2"
                 symbol="WINSOCKSEC_STOP"
                 level="win:Informational"
                 keywords="Verbose"
                 template="WinsockSecOneError"
                 message="$(string.WinsockSecStop)" />          

          <event value="3"
                 symbol="WINSOCKSEC_FILTERS_INSTALLED"
                 level="win:Informational"
                 keywords="Verbose"
                 template="WinsockSecOneError"
                 message="$(string.WinsockSecFiltersInstalled)" />

          <event value="4"
                 symbol="WINSOCKSEC_UPDATE_REGISTRY_ACL"
                 level="win:Informational"
                 keywords="Verbose"
                 template="WinsockSecOneError"
                 message="$(string.WinsockSecUpdateRegistryAcl)" />
                 
          <event value="5"
                 symbol="WINSOCKSEC_FILTER_INFO"
                 level="win:Informational"
                 keywords="Verbose"
                 template="WinsockSecFilterInfo"
                 message="$(string.WinsockSecFilterInfo)" />
          
        </events>
        
      </provider>
    </events>
    
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>

        <string id="Keyword.Error"              value="Error" />
        <string id="Keyword.Performance"        value="Performance" />
        <string id="Keyword.Verbose"            value="Verbose" />        
        
        <string id="WinsockSecStart"              value="WinsockSec:: Started."/>
        <string id="WinsockSecStop"               value="WinsockSec:: Stop. Result [%1]"/>
        <string id="WinsockSecFiltersInstalled"   value="WinsockSec:: Install winsock filters; Result [%1]"/>
        <string id="WinsockSecUpdateRegistryAcl"  value="WinsockSec:: Update interface registry ACLs [%1]"/>
        <string id="WinsockSecFilterInfo"         value="WinsockSec:: Filter Id [%1]; Name [%2]; Desc [%3]"/>        

      </stringTable>
    </resources>
  </localization>
</instrumentationManifest>
