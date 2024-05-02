<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<!--
Copyright (c) Microsoft Corporation.  All rights reserved.
-->
<!--
Use of this source code is subject to the terms of the Microsoft
premium shared source license agreement under which you licensed
this source code. If you did not accept the terms of the license
agreement, you are not authorized to use this source code.
For the terms of the license, please see the license agreement
signed by you and Microsoft.
THE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
-->

<instrumentationManifest
    xmlns="http://schemas.microsoft.com/win/2004/08/events" 
    xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"    
    >
    <instrumentation>
        <events>
            <provider name="Microsoft-WindowsPhone-ZmfDownload"
                      guid="{665A38F4-1F03-4961-B03B-DB863B517206}"
                      symbol="MICROSOFT_WINDOWSPHONE_ZMFDOWNLOAD"
                      messageFileName="zmf_service.dll"
                      resourceFileName="zmf_service.dll">
                <channels/>
                <keywords>
                    <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
                    <keyword mask="0x0000000000000001" name="Error" />
                    <keyword mask="0x0000000000000002" name="Performance" />
                    <!-- ZmfDownload-specific keywords -->
                    <keyword mask="0x0000000000000004" name="Download" />
                </keywords>
                <templates>
                    <template tid="DownloadCompleteTemplate">
                        <data name="downloadId" 
                              inType="win:UInt32" outType="win:HexInt32"/>
                        <data name="url" 
                              inType="win:UnicodeString"/>
                        <data name="httpStatus"
                              inType="win:UInt32"/>
                        <data name="hresult"
                              inType="win:UInt32" outType="win:HexInt32"/>
                        <data name="productId"
                              inType="win:GUID"/>
                        <data name="taskId"
                              inType="win:GUID"/>
                        <data name="bytesUploaded"
                              inType="win:UInt32"/>
                        <data name="bytesDownloaded"
                              inType="win:UInt32"/>
                        <data name="contentLength"
                              inType="win:UInt32"/>
                        <data name="policyConditionSpecified"
                              inType="win:UInt32" outType="win:HexInt32"/>
                        <data name="policyConditionUsed"
                              inType="win:UInt32" outType="win:HexInt32"/>
                        <data name="mediaKey"
                              inType="win:UnicodeString"/>
                        <data name="flags"
                              inType="win:UInt32" outType="win:HexInt32"/>
                    </template>
                </templates>
                <events>
                    <event value="1001"
                           keywords="Download"
                           symbol="ZmfDownloadComplete"
                           level="win:Informational"
                           template="DownloadCompleteTemplate"
                           message="$(string.ZmfDownload.DownloadComplete)"/>
                </events>
            </provider>
        </events>
    </instrumentation>
    <localization>
        <resources culture="en-US">
            <stringTable>
                <string id="ZmfDownload.DownloadComplete"   value="DownloadComplete %1 status=%3 bytes=%4: %2"/>
            </stringTable>
        </resources>
    </localization>
</instrumentationManifest>


