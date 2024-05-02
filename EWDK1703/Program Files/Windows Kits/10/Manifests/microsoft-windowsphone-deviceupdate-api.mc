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

            <!--** Never log any data which should be protected for security or privacy purposes.-->

            <provider name="Microsoft-WindowsPhone-DeviceUpdate-Api"
              guid="{E1C8A31C-3515-4B88-99E6-745A74B72939}"
              symbol="MICROSOFT_WINDOWSPHONE_DeviceUpdate_Api"
              messageFileName="DuApi.dll"
              resourceFileName="DuApi.dll">

                <channels />

                <keywords>
                    <!-- Keywords 1 and 2 are defined by WinPhone best practices. -->
                    <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
                    <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
                    <!-- Other keywords are provider-specific. -->
                </keywords>


                <templates>

                </templates>


                <events>

                </events>

            </provider>
        </events>
    </instrumentation>


    <localization>
        <resources culture="en-US">
            <stringTable>

                <string id="Keyword.Error"                                          value="Error" />
                <string id="Keyword.Performance"                                    value="Performance" />

            </stringTable>
        </resources>
    </localization>

</instrumentationManifest>


