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
  xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <instrumentation>
    <events>
      <provider
        name="Microsoft-WindowsPhone-MTFBrowserDS-Provider"
        guid="{E74286F0-C3AD-4b5e-8B0B-461336D56682}"
        symbol="BERP_MTFBrowserDS"
        messageFileName="MTFBrowserDS.dll"
        resourceFileName="MTFBrowserDS.dll">
        <keywords>
          <keyword mask="0x0000000000000001" name="Debug"/>
          <keyword mask="0x0000000000000002" name="Performance"/>
        </keywords>
        <tasks>
          <task name="PERF_MTFBROWSERDS_HISTORYDS_GETCANDIDATES"         value="1"/>
          <task name="PERF_MTFBROWSERDS_PREVIOUSLYTYPEDDS_GETCANDIDATES" value="2"/>
          <task name="PERF_MTFBROWSERDS_FAVORITESDS_GETCANDIDATES"       value="3"/>
          <task name="PERF_MTFBROWSERDS_ONLINEURLSDS_GETCANDIDATES"      value="4"/>
        </tasks>
        <events>
          <event value="1" symbol="PERF_MTFBROWSERDS_HISTORYDS_GETCANDIDATES_BEGIN"          task="PERF_MTFBROWSERDS_HISTORYDS_GETCANDIDATES"          opcode="win:Start" level="win:Informational" keywords="Performance"/>
          <event value="2" symbol="PERF_MTFBROWSERDS_HISTORYDS_GETCANDIDATES_END"            task="PERF_MTFBROWSERDS_HISTORYDS_GETCANDIDATES"          opcode="win:Stop"  level="win:Informational" keywords="Performance"/>
          <event value="3" symbol="PERF_MTFBROWSERDS_PREVIOUSLYTYPEDDS_GETCANDIDATES_BEGIN"  task="PERF_MTFBROWSERDS_PREVIOUSLYTYPEDDS_GETCANDIDATES"  opcode="win:Start" level="win:Informational" keywords="Performance"/>
          <event value="4" symbol="PERF_MTFBROWSERDS_PREVIOUSLYTYPEDDS_GETCANDIDATES_END"    task="PERF_MTFBROWSERDS_PREVIOUSLYTYPEDDS_GETCANDIDATES"  opcode="win:Stop"  level="win:Informational" keywords="Performance"/>
          <event value="5" symbol="PERF_MTFBROWSERDS_FAVORITESDS_GETCANDIDATES_BEGIN"        task="PERF_MTFBROWSERDS_FAVORITESDS_GETCANDIDATES"        opcode="win:Start" level="win:Informational" keywords="Performance"/>
          <event value="6" symbol="PERF_MTFBROWSERDS_FAVORITESDS_GETCANDIDATES_END"          task="PERF_MTFBROWSERDS_FAVORITESDS_GETCANDIDATES"        opcode="win:Stop"  level="win:Informational" keywords="Performance"/>
          <event value="7" symbol="PERF_MTFBROWSERDS_ONLINEURLSDS_GETCANDIDATES_BEGIN"       task="PERF_MTFBROWSERDS_ONLINEURLSDS_GETCANDIDATES"       opcode="win:Start" level="win:Informational" keywords="Performance"/>
          <event value="8" symbol="PERF_MTFBROWSERDS_ONLINEURLSDS_GETCANDIDATES_END"         task="PERF_MTFBROWSERDS_ONLINEURLSDS_GETCANDIDATES"       opcode="win:Stop"  level="win:Informational" keywords="Performance"/>
        </events>

      </provider>
      </events>
    </instrumentation>
</instrumentationManifest>
