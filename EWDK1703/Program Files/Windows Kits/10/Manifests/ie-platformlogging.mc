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

  <instrumentation>
    <events>
      
      <!-- Here we describe the provider that uses this manifest.
           Each provider will have its own manifest. -->
      <provider
        name="Microsoft-WindowsPhone-IE-WebBrowserControl-Provider"
        guid="{A88D74DF-2241-49fc-9D3D-2881FDAD14BB}"
        symbol="BERP_WebBrowserControl"
        messageFileName="SpWebBrowserControl.dll"
        resourceFileName="SpWebBrowserControl.dll">
        <keywords>
          <keyword mask="0x0000000000000001" name="Debug"/>
          <keyword mask="0x0000000000000002" name="Performance"/>
          <keyword mask="0x0000000000000004" name="primarynav"/>
          <keyword mask="0x0000000000000008" name="input" />
          <keyword mask="0x0000000000000010" name="rendering" />
          <keyword mask="0x0000000000000020" name="ResponseTime" />
          <keyword mask="0x0000000000000040" name="DocumentThreadPump" />
          <!-- WARNING: the "SelfHost" keyword must be used judiciously (very
               sparingly) as it goes into the device-wide shared circular
               buffer logging file uploaded by Watson/UIF -->
          <keyword mask="0x0000000000000080" name="SelfHost" />
          <keyword mask="0x0000000000000100" name="VTab" />
          <keyword mask="0x0000000000000200" name="GestureNavigation" />
          <keyword mask="0x0000000000000400" name="DocState" />
        </keywords>
        <templates>
          <template tid="GenericString">
            <data name="String1" inType="win:UnicodeString" />
          </template>
          <template tid="GenericUInt32">
            <data inType="win:UInt32" name="UnsignedInteger"/>
          </template>
          <template tid="GenericUInt32x2">
            <data inType="win:UInt32" name="UnsignedInteger1"/>
            <data inType="win:UInt32" name="UnsignedInteger2"/>
          </template>
          <template tid="NavigationBeginInfo">
            <data name="URL" inType="win:UnicodeString" />
            <data name="VTabID" inType="win:UInt32" />
            <data name="VTabType" inType="win:UInt32" />
            <data name="IsHiddenVTab" inType="win:UInt32" />
            <data name="SuspendLevel" inType="win:UInt32" />
          </template>
          <template tid="NavigationEndInfo">
            <data name="VTabID" inType="win:UInt32" />
            <data name="IsHiddenVTab" inType="win:UInt32" />
            <data name="SuspendLevel" inType="win:UInt32" />
            <data name="DocumentCompleted" inType="win:UInt32" />
          </template>
          <template tid="DocSuspendInfo">
            <data name="VTabID" inType="win:UInt32" />
            <data name="VTabType" inType="win:UInt32" />
            <data name="IsHiddenVTab" inType="win:UInt32" />
            <data name="TargetSuspendLevel" inType="win:UInt32" />
            <data name="ShouldSuspendTimer" inType="win:UInt32" />
          </template>
          <template tid="DocVisibilityInfo">
            <data name="VTabID" inType="win:UInt32" />
            <data name="VTabType" inType="win:UInt32" />
            <data name="IsHiddenVTab" inType="win:UInt32" />
            <data name="SuspendLevel" inType="win:UInt32" />
            <data name="TargetVisibility" inType="win:UInt32" />
          </template>
          <template tid="DocIdleViolationInfo">
            <data name="VTabID" inType="win:UInt32" />
            <data name="VTabType" inType="win:UInt32" />
            <data name="IsHiddenVTab" inType="win:UInt32" />
            <data name="SuspendLevel" inType="win:UInt32" />
            <data name="PauseOnLock" inType="win:UInt32" />
            <data name="URL" inType="win:UnicodeString" />
          </template>
          <template tid="WindowMessage">
            <data name="HWND" inType="win:Pointer" />
            <data name="Message" inType="win:UInt32" />
            <data name="WParam" inType="win:UInt32" />
            <data name="LParam" inType="win:UInt32" />
          </template>
          <template tid="SuspendedTimerInfo">
            <data name="HWND" inType="win:Pointer" />
            <data name="WParam" inType="win:UInt32" />
            <data name="LParam" inType="win:UInt32" />
            <data name="SuspendState" inType="win:UInt32" />
            <data name="DocumentState" inType="win:UInt32" />
          </template>
          <template tid="DebugConsoleWrite">
            <data name="Source" inType="win:UnicodeString" />
            <data name="Level" inType="win:UnicodeString" />
            <data name="MessageId" inType="win:UInt32" />
            <data name="MessageText" inType="win:UnicodeString" />
          </template>
          <template tid="DebugConsoleWriteWithUrl">
            <data name="Source" inType="win:UnicodeString" />
            <data name="Level" inType="win:UnicodeString" />
            <data name="MessageId" inType="win:UInt32" />
            <data name="MessageText" inType="win:UnicodeString" />
            <data name="FileUrl" inType="win:UnicodeString" />
          </template>
          <template tid="DebugConsoleWriteWithUrlAndLine">
            <data name="Source" inType="win:UnicodeString" />
            <data name="Level" inType="win:UnicodeString" />
            <data name="MessageId" inType="win:UInt32" />
            <data name="MessageText" inType="win:UnicodeString" />
            <data name="FileUrl" inType="win:UnicodeString" />
            <data name="Line" inType="win:UInt32" />
          </template>
          <template tid="DebugConsoleWriteWithUrlLineAndColumn">
            <data name="Source" inType="win:UnicodeString" />
            <data name="Level" inType="win:UnicodeString" />
            <data name="MessageId" inType="win:UInt32" />
            <data name="MessageText" inType="win:UnicodeString" />
            <data name="FileUrl" inType="win:UnicodeString" />
            <data name="Line" inType="win:UInt32" />
            <data name="Column" inType="win:UInt32" />
          </template>
          <template tid="HangDetected">
            <data name="ProcessId" inType="win:Int32"/>
          </template>
        </templates>
        <tasks>
          <task name="PERF_CDOCUMENTHOST_GETWINDOWCONTEXT"                            symbol="PERF_CDOCUMENTHOST_GETWINDOWCONTEXT_TASK"                             value="1"/>
          <task name="PERF_CDOCUMENTHOST_SHOWSELECTCONTROL"                           symbol="PERF_CDOCUMENTHOST_SHOWSELECTCONTROL_TASK"                            value="2"/>
          <task name="PERF_CDOCUMENTHOST_INITIALIZE"                                  symbol="PERF_CDOCUMENTHOST_INITIALIZE_TASK"                                   value="3"/>
          <task name="PERF_CDOCUMENTHOST_UNINITIALIZE"                                symbol="PERF_CDOCUMENTHOST_UNINITIALIZE_TASK"                                 value="4"/>
          <task name="PERF_CDOCUMENTHOST_NAVIGATEBACKWARD"                            symbol="PERF_CDOCUMENTHOST_NAVIGATEBACKWARD_TASK"                             value="5"/>
          <task name="PERF_CDOCUMENTHOST_NAVIGATEFORWARD"                             symbol="PERF_CDOCUMENTHOST_NAVIGATEFORWARD_TASK"                              value="6"/>
          <task name="PERF_CDOCUMENTHOST_STOPNAVIGATION"                              symbol="PERF_CDOCUMENTHOST_STOPNAVIGATION_TASK"                               value="7"/>
          <task name="PERF_CDOCUMENTHOST_REFRESH"                                     symbol="PERF_CDOCUMENTHOST_REFRESH_TASK"                                      value="8"/>
          <task name="PERF_CDOCUMENTHOST_DIAGTRACK_PAGELOAD"                          symbol="PERF_CDOCUMENTHOST_DIAGTRACK_PAGELOAD_TASK"                           value="9"/>
          <task name="PERF_CDOCUMENTHOST_NAVIGATETO"                                  symbol="PERF_CDOCUMENTHOST_NAVIGATETO_TASK"                                   value="10"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE"                 symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_TASK"                  value="11"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE"               symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_TASK"                value="12"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN"                  symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN_TASK"                   value="13"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE"               symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE_TASK"                value="14"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE"               symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_TASK"                value="15"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR"                  symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_TASK"                   value="16"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED"             symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_TASK"              value="17"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW"                      symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW_TASK"                       value="18"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE"               symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_TASK"                value="19"/>
          <task name="PERF_CDOCUMENTHOST_ONCONTEXTMENU"                               symbol="PERF_CDOCUMENTHOST_ONCONTEXTMENU_TASK"                                value="20"/>
          <task name="PERF_CDOCUMENTHOST_ONSHOWMESSAGE"                               symbol="PERF_CDOCUMENTHOST_ONSHOWMESSAGE_TASK"                                value="21"/>
          <task name="PERF_CDOCUMENTHOST_ONSETSECURELOCKICON"                         symbol="PERF_CDOCUMENTHOST_ONSETSECURELOCKICON_TASK"                          value="22"/>
          <task name="PERF_CDOCUMENTHOST_ONSETPHISHINGFILTERSTATUS"                   symbol="PERF_CDOCUMENTHOST_ONSETPHISHINGFILTERSTATUS_TASK"                    value="23"/>
          <task name="PERF_CDOCUMENTHOST_ONTITLECHANGE"                               symbol="PERF_CDOCUMENTHOST_ONTITLECHANGE_TASK"                                value="24"/>
          <task name="PERF_CDOCUMENTHOST_FINDONPAGE"                                  symbol="PERF_CDOCUMENTHOST_FINDONPAGE_TASK"                                   value="25"/>
          <task name="PERF_CDOCUMENTHOST_FINDNEXTONPAGE"                              symbol="PERF_CDOCUMENTHOST_FINDNEXTONPAGE_TASK"                               value="26"/>
          <task name="PERF_CDOCUMENTHOST_FINDPREVIOUSONPAGE"                          symbol="PERF_CDOCUMENTHOST_FINDPREVIOUSONPAGE_TASK"                           value="27"/>
          <task name="PERF_CDOCUMENTHOST_CLEARFINDONPAGE"                             symbol="PERF_CDOCUMENTHOST_CLEARFINDONPAGE_TASK"                              value="28"/>
          <task name="PERF_CDOCUMENTTHREAD_IDLE"                                      symbol="PERF_CDOCUMENTTHREAD_IDLE_TASK"                                       value="29"/>
          <task name="PERF_CDOCUMENTTHREAD_CREATEEXTENSIONS"                          symbol="PERF_CDOCUMENTTHREAD_CREATEEXTENSIONS_TASK"                           value="30"/>
          <task name="PERF_CDOCUMENTTHREAD_DESTROYEXTENSIONS"                         symbol="PERF_CDOCUMENTTHREAD_DESTROYEXTENSIONS_TASK"                          value="31"/>
          <task name="PERF_CDOCUMENTTHREAD_THREADPROC"                                symbol="PERF_CDOCUMENTTHREAD_THREADPROC_TASK"                                 value="32"/>
          <task name="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL"                             symbol="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL_TASK"                              value="33"/>
          <task name="PERF_CDOCUMENTHOST_SETDOCVISIBILITY"                            symbol="PERF_CDOCUMENTHOST_SETDOCVISIBILITY_TASK"                             value="34"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED"               symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_TASK"                value="35"/>
      <!--<task name="PERF_TESTHOOKS_DOCUMENTIDLE"                                    symbol="PERF_TESTHOOKS_DOCUMENTIDLE_TASK"                                     value="36"/>-->
          <task name="PERF_CDOCUMENTHREAD_BUSY"                                       symbol="PERF_CDOCUMENTHREAD_BUSY_TASK"                                        value="37"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_TOPLEVEL"        symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_TOPLEVEL_TASK"         value="38"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_TOPLEVEL"      symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_TOPLEVEL_TASK"       value="39"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_TOPLEVEL"      symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_TOPLEVEL_TASK"       value="40"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_TOPLEVEL"         symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_TOPLEVEL_TASK"          value="41"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_TOPLEVEL"    symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_TOPLEVEL_TASK"     value="42"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_TOPLEVEL"      symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_TOPLEVEL_TASK"       value="43"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_TOPLEVEL"      symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_TOPLEVEL_TASK"       value="44"/>
          <task name="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADSTART"                   symbol="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADSTART_TASK"                    value="45"/>
          <task name="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADCOMPLETE"                symbol="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADCOMPLETE_TASK"                 value="46"/>
          <task name="PERF_CDOCUMENTHOST_IDLETIMER"                                   symbol="PERF_CDOCUMENTHOST_IDLETIMER_TASK"                                    value="47"/>
      <!--<task name="PERF_SURFACEPROVIDER_GETTILES"                                  symbol="PERF_SURFACEPROVIDER_GETTILES_TASK"                                   value="48"/>-->
      <!--<task name="PERF_CDOCUMENTTHREAD_D3DDEVICEEVENT"                            symbol="PERF_CDOCUMENTTHREAD_D3DDEVICEEVENT_TASK"                             value="49"/>-->
          <task name="PERF_CDOCUMENTTHREAD_INTERRUPTTASK"                             symbol="PERF_CDOCUMENTTHREAD_INTERRUPTTASK_TASK"                              value="50"/>
          <task name="PERF_CDOCUMENTTHREAD_NORMALTASK"                                symbol="PERF_CDOCUMENTTHREAD_NORMALTASK_TASK"                                 value="51"/>
          <task name="PERF_CDOCUMENTTHREAD_XOTASK"                                    symbol="PERF_CDOCUMENTTHREAD_XOTASK_TASK"                                     value="52"/>
          <task name="PERF_CDOCUMENTTHREAD_GWESTASK"                                  symbol="PERF_CDOCUMENTTHREAD_GWESTASK_TASK"                                   value="53"/>
      <!--<task name="PERF_CDOCUMENTTHREAD_RENDERTASK"                                symbol="PERF_CDOCUMENTTHREAD_RENDERTASK_TASK"                                 value="54"/>-->
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_XO"              symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_XO_TASK"               value="55"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_XO"            symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_XO_TASK"             value="56"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN_XO"               symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN_XO_TASK"                value="57"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE_XO"            symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE_XO_TASK"             value="58"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_XO"            symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_XO_TASK"             value="59"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_XO"               symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_XO_TASK"                value="60"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_XO"          symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_XO_TASK"           value="61"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW_XO"                   symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW_XO_TASK"                    value="62"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_XO"            symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_XO_TASK"             value="63"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_XO"            symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_XO_TASK"             value="64"/>
      <!--<task name="PERF_VISIBLE_CONTENT_AREA"                                      symbol="PERF_VISIBLE_CONTENT_AREA_TASK"                                       value="65"/>-->
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH"          symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_TASK"           value="66"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_TOPLEVEL" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_TOPLEVEL_TASK"  value="67"/>
          <task name="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_XO"       symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_XO_TASK"        value="68"/>
          <task name="PERF_WORDSELECT_TAP"                                            symbol="PERF_WORDSELECT_TAP_TASK"                                             value="69"/>
          <task name="PERF_WORDSELECT_EXTEND"                                         symbol="PERF_WORDSELECT_EXTEND_TASK"                                          value="70"/>
          <task name="PERF_WORDSELECT_CLEAR"                                          symbol="PERF_WORDSELECT_CLEAR_TASK"                                           value="71"/>
      <!--<task name="PERF_TILEMANAGER_CREATE"                                        symbol="PERF_TILEMANAGER_CREATE_TASK"                                         value="72"/>-->
          <task name="PERF_HANGDETECTIONMANAGER_CREATE"                               symbol="PERF_HANGDETECTIONMANAGER_CREATE_TASK"                                value="73"/>
          <task name="PERF_DEBUGENDPOINT_REGISTERCONTROL"                             symbol="PERF_DEBUGENDPOINT_REGISTERCONTROL_TASK"                              value="74"/>
          <task name="PERF_ADAPTER_INITIALIZE"                                        symbol="PERF_ADAPTER_INITIALIZE_TASK"                                         value="75"/>
          <task name="PERF_CWORDSELECT_INITIALIZE"                                    symbol="PERF_CWORDSELECT_INITIALIZE_TASK"                                     value="76"/>
          <task name="PERF_CHIGHLIGHT_INITIALIZE"                                     symbol="PERF_CHIGHLIGHT_INITIALIZE_TASK"                                      value="77"/>
      <!--<task name="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL"                             symbol="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL_TASK"                              value="78"/>-->
          <task name="PERF_CDOCUMENTHOST_CREATEWINDOW"                                symbol="PERF_CDOCUMENTHOST_CREATEWINDOW_TASK"                                 value="79"/>
          <task name="PERF_CDOCUMENTHOST_CREATE_CPROGRESSLOGIC"                       symbol="PERF_CDOCUMENTHOST_CREATE_CPROGRESSLOGIC_TASK"                        value="80"/>
          <task name="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMDOWNLOADNOTIFY"           symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMDOWNLOADNOTIFY_TASK"            value="81"/>
          <task name="PERF_CDOCUMENTHOST_CREATE_CAUTHENTICATE"                        symbol="PERF_CDOCUMENTHOST_CREATE_CAUTHENTICATE_TASK"                         value="82"/>
          <task name="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUI"                   symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUI_TASK"                    value="83"/>
          <task name="PERF_CDOCUMENTHOST_CREATE_EXTERNALDISPATCH"                     symbol="PERF_CDOCUMENTHOST_CREATE_EXTERNALDISPATCH_TASK"                      value="84"/>          
          <task name="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMNAVIGATIONEVENTSINK"      symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMNAVIGATIONEVENTSINK_TASK"       value="85"/>
          <task name="PERF_CDOCUMENTHOST_CREATE_INTERNETSECURITYMANAGER"              symbol="PERF_CDOCUMENTHOST_CREATE_INTERNETSECURITYMANAGER_TASK"               value="86"/>
          <task name="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUIPRIV"               symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUIPRIV_TASK"                value="87"/>
          <task name="PERF_CDOCUMENTHOST_DOVERB_INPLACEACTIVATE"                      symbol="PERF_CDOCUMENTHOST_DOVERB_INPLACEACTIVATE_TASK"                       value="88"/>
      <!--<task name="PERF_CDOCUMENTHOST_CREATE_CDOCUMENTD3D"                         symbol="PERF_CDOCUMENTHOST_CREATE_CDOCUMENTD3D_TASK"                          value="89"/>-->
          <task name="PERF_CDOCUMENTHOST_CREATE_CCARET"                               symbol="PERF_CDOCUMENTHOST_CREATE_CCARET_TASK"                                value="90"/>
          <task name="PERF_WEBPLATFORMDOWNLOADNOTIFY_SHOULDDOWNLOAD"                  symbol="PERF_WEBPLATFORMDOWNLOADNOTIFY_SHOULDDOWNLOAD_TASK"                   value="91"/>
          <task name="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMPHISHINGFILTER"           symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMPHISHINGFILTER_TASK"            value="92"/>
          <task name="PERF_SUSPENDHELPER_SUSPEND"                                     symbol="PERF_SUSPENDHELPER_SUSPEND_TASK"                                      value="93"/>
          <task name="PERF_SUSPENDHELPER_RELEASED3DRESOURCES"                         symbol="PERF_SUSPENDHELPER_RELEASED3DRESOURCES_TASK"                          value="94"/>
          <task name="PERF_MODULEREFERENCETHREAD_EXITTHREAD"                          symbol="PERF_MODULEREFERENCETHREAD_EXITTHREAD_TASK"                           value="95"/>
          <task name="PERF_MODULEREFERENCE_SLEEPTHREAD"                               symbol="PERF_MODULEREFERENCE_SLEEPTHREAD_TASK"                                value="96"/>
          <task name="PERF_CDOCUMENTTHREAD_DESTROY"                                   symbol="PERF_CDOCUMENTTHREAD_DESTROY_TASK"                                    value="97"/>
          <task name="PERF_CDOCUMENTTHREAD_EXITMAINMESSAGELOOP"                       symbol="PERF_CDOCUMENTTHREAD_EXITMAINMESSAGELOOP_TASK"                        value="98"/>
          <task name="PERF_CDOCUMENTTHREAD_DRAINGWESQUEUE"                            symbol="PERF_CDOCUMENTTHREAD_DRAINGWESQUEUE_TASK"                             value="99"/>
          <task name="PERF_CDOCUMENTTHREAD_RESUMETHREAD"                              symbol="PERF_CDOCUMENTTHREAD_RESUMETHREAD_TASK"                               value="100"/>
          <task name="PERF_CFIRSTRENDERCOMPLETEREGISTRATION_ONRENDERCOMPLETE"         symbol="PERF_CFIRSTRENDERCOMPLETEREGISTRATION_ONRENDERCOMPLETE_TASK"          value="101"/>
          <task name="PERF_WEBBROWSERADAPTERCORE_HIDETRANSITIONLAYER"                 symbol="PERF_WEBBROWSERADAPTERCORE_HIDETRANSITIONLAYER_TASK"                  value="102"/>
          <task name="PERF_CDOCUMENTTHREAD_IDLE_VIOLATION"                            symbol="PERF_CDOCUMENTTHREAD_IDLE_VIOLATION_TASK"                             value="103"/>

          <task name="DEBUG_CDOCUMENTHOST_NAVIGATETO"                                 symbol="DEBUG_CDOCUMENTHOST_NAVIGATETO_TASK"                                  value="1000"/>
          <task name="DEBUG_CDOCUMENTHOST_BEFORENAVIGATE"                             symbol="DEBUG_CDOCUMENTHOST_BEFORENAVIGATE_TASK"                              value="1001"/>
          <task name="DEBUG_CDOCUMENTHOST_TIMER"                                      symbol="DEBUG_CDOCUMENTHOST_TIMER_TASK"                                       value="1002"/>

          <!-- Touch, gestures, and keyboard -->
          <task name="INPUT_SPINPUTADAPTER_GESTURESESSION"                            symbol="INPUT_SPINPUTADAPTER_GESTURESESSION_TASK"                             value="3000" />
          <task name="INPUT_CDOCUMENTHOST_HITTEST"                                    symbol="INPUT_CDOCUMENTHOST_HITTEST_TASK"                                     value="3001" />
          <task name="INPUT_SPINPUTADAPTER_KEY"                                       symbol="INPUT_SPINPUTADAPTER_KEY_TASK"                                        value="3002" />
          <task name="INPUT_CDOCUMENTHOST_ANIMATEELEMENT"                             symbol="INPUT_CDOCUMENTHOST_ANIMATEELEMENT_TASK"                              value="3003" />
          <task name="INPUT_INPUTADAPTER_PCP"                                         symbol="INPUT_INPUTADAPTER_PCP_TASK"                                          value="3004" />
          <task name="INPUT_SPINPUTADAPTER_KEYCHAR"                                   symbol="INPUT_SPINPUTADAPTER_KEYCHAR_TASK"                                    value="3005"/>
          <task name="INPUT_SPINPUTADAPTER_TAP"                                       symbol="INPUT_SPINPUTADAPTER_TAP_TASK"                                        value="3006"/>
          <task name="INPUT_SPINPUTADAPTER_SHORTHOLD"                                 symbol="INPUT_SPINPUTADAPTER_SHORTHOLD_TASK"                                  value="3007"/>
          <task name="INPUT_SPINPUTADAPTER_HOLD"                                      symbol="INPUT_SPINPUTADAPTER_HOLD_TASK"                                       value="3008"/>
          <task name="INPUT_SPINPUTADAPTER_DOUBLETAP"                                 symbol="INPUT_SPINPUTADAPTER_DOUBLETAP_TASK"                                  value="3009"/>
          <task name="INPUT_SPINPUTADAPTER_ONTAP"                                     symbol="INPUT_SPINPUTADAPTER_ONTAP_TASK"                                      value="3010"/>
          <task name="INPUT_SPINPUTADAPTER_ONDOUBLETAP"                               symbol="INPUT_SPINPUTADAPTER_ONDOUBLETAP_TASK"                                value="3011"/>
          <task name="INPUT_SPINPUTADAPTER_ONPINCHSTRETCH"                            symbol="INPUT_SPINPUTADAPTER_ONPINCHSTRETCH_TASK"                             value="3012"/>
          <task name="INPUT_SPINPUTADAPTER_ONFLICK"                                   symbol="INPUT_SPINPUTADAPTER_ONFLICK_TASK"                                    value="3013"/>
          <task name="INPUT_SPINPUTADAPTER_ONDRAG"                                    symbol="INPUT_SPINPUTADAPTER_ONDRAG_TASK"                                     value="3014"/>
          <task name="INPUT_SPWEBBROWSERADAPTER_PROCESSZOOMANDSCROLL"                 symbol="INPUT_SPWEBBROWSERADAPTER_PROCESSZOOMANDSCROLL_TASK"                  value="3015"/>
          <task name="INPUT_CELEMENTANIMATIONSTATE_SCHEDULESCROLL"                    symbol="INPUT_CELEMENTANIMATIONSTATE_SCHEDULESCROLL_TASK"                     value="3016"/>
          <task name="INPUT_CHIGHLIGHT_SHOW"                                          symbol="INPUT_CHIGHLIGHT_SHOW_TASK"                                           value="3017"/>
          <task name="INPUT_CHIGHLIGHT_HIDE"                                          symbol="INPUT_CHIGHLIGHT_HIDE_TASK"                                           value="3018"/>

          <!-- VTab -->
          <task name="VTAB_SUSPENDING"                                                symbol="VTAB_SUSPENDING_TASK"                                                 value="3500"/>
          <task name="VTAB_RESUMED"                                                   symbol="VTAB_RESUMED_TASK"                                                    value="3501"/>
          <task name="VTAB_ADDVTAB"                                                   symbol="VTAB_ADDVTAB_TASK"                                                    value="3502"/>
          <task name="VTAB_CLOSEVTAB"                                                 symbol="VTAB_CLOSEVTAB_TASK"                                                  value="3503"/>
          <task name="VTAB_NAVIGATETOVTAB"                                            symbol="VTAB_NAVIGATETOVTAB_TASK"                                             value="3504"/>
          <task name="VTAB_SWITCHVTAB"                                                symbol="VTAB_SWITCHVTAB_TASK"                                                 value="3505"/>
          <task name="VTAB_LOWMEMORY"                                                 symbol="VTAB_LOWMENORY_TASK"                                                  value="3506"/>
          <task name="VTAB_DOCTHREAD_SUSPENDING"                                      symbol="VTAB_DOCTHREAD_SUSPENDING_TASK"                                       value="3507"/>
          <task name="VTAB_DOCTHREAD_RESUMED"                                         symbol="VTAB_DOCTHREAD_RESUMED_TASK"                                          value="3508"/>

          <!-- GestureNavigation -->
          <task name="PERF_GESTURENAVIGATION_CAPTURESCREENSHOT"                       symbol="PERF_GESTURENAVIGATION_CAPTURESCREENSHOT_TASK"                        value="3200"/>
          <task name="PERF_GESTURENAVIGATION_SCREENSHOTCOMPRESSION"                   symbol="PERF_GESTURENAVIGATION_SCREENSHOTCOMPRESSION_TASK"                    value="3201"/>                              

          <!-- Rendering -->
      <!--<task name="RENDER_UPDATE_TILE"                                             symbol="RENDER_UPDATE_TILE_TASK"                                              value="4000"/>-->
      <!--<task name="RENDER_CLEAR_TILE"                                              symbol="RENDER_CLEAR_TILE_TASK"                                               value="4001"/>-->
      <!--<task name="ON_RENDER_EVENT_COMPLETE"                                       symbol="ON_RENDER_EVENT_COMPLETE_TASK"                                        value="4002"/>-->
      <!--<task name="RENDER_SYNC_TICK"                                               symbol="RENDER_SYNC_TICK_TASK"                                                value="4003"/>-->

          <!-- managed WebBrowser control -->
          <task name="PERF_AGCONTROL_INSTANTIATED"                                    symbol="PERF_AGCONTROL_INSTANTIATED_TASK"                                     value="5000"/>
          <task name="PERF_AGCONTROL_RESUME"                                          symbol="PERF_AGCONTROL_RESUME_TASK"                                           value="5001"/>

          <!-- Retail messages -->
          <task name="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITE"                       symbol="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITE_TASK"                        value="6000"/>
          <task name="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURL"                symbol="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURL_TASK"                 value="6001"/>
          <task name="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURLANDLINE"         symbol="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURLANDLINE_TASK"          value="6002"/>
          <task name="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURLLINEANDCOLUMN"   symbol="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURLLINEANDCOLUMN_TASK"    value="6003"/>
          <task name="RETAIL_BROWSERCONTROL_HANGDETECTED"                             symbol="RETAIL_BROWSERCONTROL_HANGDETECTED_TASK"                              value="6004"/>
        </tasks>
        <events>
          <!-- opcode="win:Start/win:Stop" -->
          <event value="1" symbol="PERF_CDOCUMENTHOST_GETWINDOWCONTEXT_BEGIN" task="PERF_CDOCUMENTHOST_GETWINDOWCONTEXT" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="2" symbol="PERF_CDOCUMENTHOST_GETWINDOWCONTEXT_END" task="PERF_CDOCUMENTHOST_GETWINDOWCONTEXT" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="3" symbol="PERF_CDOCUMENTHOST_SHOWSELECTCONTROL_BEGIN" task="PERF_CDOCUMENTHOST_SHOWSELECTCONTROL" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="4" symbol="PERF_CDOCUMENTHOST_SHOWSELECTCONTROL_END" task="PERF_CDOCUMENTHOST_SHOWSELECTCONTROL" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="5" symbol="PERF_CDOCUMENTHOST_INITIALIZE_BEGIN" task="PERF_CDOCUMENTHOST_INITIALIZE" opcode="win:Start" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="6" symbol="PERF_CDOCUMENTHOST_INITIALIZE_END" task="PERF_CDOCUMENTHOST_INITIALIZE" opcode="win:Stop" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="7" symbol="PERF_CDOCUMENTHOST_UNINITIALIZE_BEGIN" task="PERF_CDOCUMENTHOST_UNINITIALIZE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="8" symbol="PERF_CDOCUMENTHOST_UNINITIALIZE_END" task="PERF_CDOCUMENTHOST_UNINITIALIZE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="9" symbol="PERF_CDOCUMENTHOST_NAVIGATEBACKWARD_BEGIN" task="PERF_CDOCUMENTHOST_NAVIGATEBACKWARD" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="10" symbol="PERF_CDOCUMENTHOST_NAVIGATEBACKWARD_END" task="PERF_CDOCUMENTHOST_NAVIGATEBACKWARD" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="11" symbol="PERF_CDOCUMENTHOST_NAVIGATEFORWARD_BEGIN" task="PERF_CDOCUMENTHOST_NAVIGATEFORWARD" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="12" symbol="PERF_CDOCUMENTHOST_NAVIGATEFORWARD_END" task="PERF_CDOCUMENTHOST_NAVIGATEFORWARD" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="13" symbol="PERF_CDOCUMENTHOST_STOPNAVIGATION_BEGIN" task="PERF_CDOCUMENTHOST_STOPNAVIGATION" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="14" symbol="PERF_CDOCUMENTHOST_STOPNAVIGATION_END" task="PERF_CDOCUMENTHOST_STOPNAVIGATION" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="15" symbol="PERF_CDOCUMENTHOST_REFRESH_BEGIN" task="PERF_CDOCUMENTHOST_REFRESH" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="16" symbol="PERF_CDOCUMENTHOST_REFRESH_END" task="PERF_CDOCUMENTHOST_REFRESH" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="17" symbol="PERF_CDOCUMENTHOST_DIAGTRACK_PAGELOAD_BEGIN" task="PERF_CDOCUMENTHOST_DIAGTRACK_PAGELOAD" template="NavigationBeginInfo" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="18" symbol="PERF_CDOCUMENTHOST_DIAGTRACK_PAGELOAD_END" task="PERF_CDOCUMENTHOST_DIAGTRACK_PAGELOAD" template="NavigationEndInfo" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="19" symbol="PERF_CDOCUMENTHOST_NAVIGATETO_BEGIN" task="PERF_CDOCUMENTHOST_NAVIGATETO" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="20" symbol="PERF_CDOCUMENTHOST_NAVIGATETO_END" task="PERF_CDOCUMENTHOST_NAVIGATETO" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="21" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="22" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="23" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="24" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="25" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="26" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="27" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="28" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="29" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="30" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="31" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="32" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="33" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="34" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="35" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="36" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="37" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="38" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="39" symbol="PERF_CDOCUMENTHOST_ONCONTEXTMENU_BEGIN" task="PERF_CDOCUMENTHOST_ONCONTEXTMENU" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="40" symbol="PERF_CDOCUMENTHOST_ONCONTEXTMENU_END" task="PERF_CDOCUMENTHOST_ONCONTEXTMENU" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="41" symbol="PERF_CDOCUMENTHOST_ONSHOWMESSAGE_BEGIN" task="PERF_CDOCUMENTHOST_ONSHOWMESSAGE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="42" symbol="PERF_CDOCUMENTHOST_ONSHOWMESSAGE_END" task="PERF_CDOCUMENTHOST_ONSHOWMESSAGE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="43" symbol="PERF_CDOCUMENTHOST_ONSETSECURELOCKICON_BEGIN" task="PERF_CDOCUMENTHOST_ONSETSECURELOCKICON" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="44" symbol="PERF_CDOCUMENTHOST_ONSETSECURELOCKICON_END" task="PERF_CDOCUMENTHOST_ONSETSECURELOCKICON" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="45" symbol="PERF_CDOCUMENTHOST_ONSETPHISHINGFILTERSTATUS_BEGIN" task="PERF_CDOCUMENTHOST_ONSETPHISHINGFILTERSTATUS" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="46" symbol="PERF_CDOCUMENTHOST_ONSETPHISHINGFILTERSTATUS_END" task="PERF_CDOCUMENTHOST_ONSETPHISHINGFILTERSTATUS" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="47" symbol="PERF_CDOCUMENTHOST_ONTITLECHANGE_BEGIN" task="PERF_CDOCUMENTHOST_ONTITLECHANGE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="48" symbol="PERF_CDOCUMENTHOST_ONTITLECHANGE_END" task="PERF_CDOCUMENTHOST_ONTITLECHANGE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="49" symbol="PERF_CDOCUMENTHOST_FINDONPAGE_BEGIN" task="PERF_CDOCUMENTHOST_FINDONPAGE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="50" symbol="PERF_CDOCUMENTHOST_FINDONPAGE_END" task="PERF_CDOCUMENTHOST_FINDONPAGE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="51" symbol="PERF_CDOCUMENTHOST_FINDNEXTONPAGE_BEGIN" task="PERF_CDOCUMENTHOST_FINDNEXTONPAGE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="52" symbol="PERF_CDOCUMENTHOST_FINDNEXTONPAGE_END" task="PERF_CDOCUMENTHOST_FINDNEXTONPAGE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="53" symbol="PERF_CDOCUMENTHOST_FINDPREVIOUSONPAGE_BEGIN" task="PERF_CDOCUMENTHOST_FINDPREVIOUSONPAGE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="54" symbol="PERF_CDOCUMENTHOST_FINDPREVIOUSONPAGE_END" task="PERF_CDOCUMENTHOST_FINDPREVIOUSONPAGE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="55" symbol="PERF_CDOCUMENTHOST_CLEARFINDONPAGE_BEGIN" task="PERF_CDOCUMENTHOST_CLEARFINDONPAGE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="56" symbol="PERF_CDOCUMENTHOST_CLEARFINDONPAGE_END" task="PERF_CDOCUMENTHOST_CLEARFINDONPAGE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="57" symbol="PERF_CDOCUMENTTHREAD_IDLE_BEGIN" task="PERF_CDOCUMENTTHREAD_IDLE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="58" symbol="PERF_CDOCUMENTTHREAD_IDLE_END" task="PERF_CDOCUMENTTHREAD_IDLE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="59" symbol="PERF_CDOCUMENTTHREAD_CREATEEXTENSIONS_BEGIN" task="PERF_CDOCUMENTTHREAD_CREATEEXTENSIONS" opcode="win:Start" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="60" symbol="PERF_CDOCUMENTTHREAD_CREATEEXTENSIONS_END" task="PERF_CDOCUMENTTHREAD_CREATEEXTENSIONS" opcode="win:Stop" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="61" symbol="PERF_CDOCUMENTTHREAD_DESTROYEXTENSIONS_BEGIN" task="PERF_CDOCUMENTTHREAD_DESTROYEXTENSIONS" opcode="win:Start" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="62" symbol="PERF_CDOCUMENTTHREAD_DESTROYEXTENSIONS_END" task="PERF_CDOCUMENTTHREAD_DESTROYEXTENSIONS" opcode="win:Stop" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="63" symbol="PERF_CDOCUMENTTHREAD_THREADPROC_BEGIN" task="PERF_CDOCUMENTTHREAD_THREADPROC" opcode="win:Start" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="64" symbol="PERF_CDOCUMENTTHREAD_THREADPROC_END" task="PERF_CDOCUMENTTHREAD_THREADPROC" opcode="win:Stop" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="65" symbol="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL_BEGIN" task="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL" template="DocSuspendInfo" opcode="win:Start" keywords="DocState" level="win:Informational"/>
          <event value="66" symbol="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL_END" task="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL" opcode="win:Stop" keywords="DocState" level="win:Informational"/>
          <event value="67" symbol="PERF_CDOCUMENTHOST_SETDOCVISIBLITY_BEGIN" task="PERF_CDOCUMENTHOST_SETDOCVISIBILITY" template="DocVisibilityInfo" opcode="win:Start" keywords="DocState" level="win:Informational"/>
          <event value="68" symbol="PERF_CDOCUMENTHOST_SETDOCVISIBLITY_END" task="PERF_CDOCUMENTHOST_SETDOCVISIBILITY" opcode="win:Stop" keywords="DocState" level="win:Informational"/>
          <event value="69" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="70" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
      <!--<event value="71" symbol="PERF_TESTHOOKS_DOCUMENTIDLE_BEGIN" task="PERF_TESTHOOKS_DOCUMENTIDLE" opcode="win:Start" keywords="Performance" level="win:Informational"/>-->
      <!--<event value="72" symbol="PERF_TESTHOOKS_DOCUMENTIDLE_END" task="PERF_TESTHOOKS_DOCUMENTIDLE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>-->
          <event value="73" symbol="PERF_CDOCUMENTHREAD_BUSY_BEGIN" task="PERF_CDOCUMENTHREAD_BUSY" opcode="win:Start" keywords="ResponseTime" level="win:Informational"/>
          <event value="74" symbol="PERF_CDOCUMENTHREAD_BUSY_END" task="PERF_CDOCUMENTHREAD_BUSY" opcode="win:Stop" keywords="ResponseTime" level="win:Informational"/>
          <event value="75" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_TOPLEVEL_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_TOPLEVEL" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="76" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_TOPLEVEL_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_TOPLEVEL" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="77" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_TOPLEVEL_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_TOPLEVEL" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="78" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_TOPLEVEL_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_TOPLEVEL" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="79" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_TOPLEVEL_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_TOPLEVEL" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="80" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_TOPLEVEL_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_TOPLEVEL" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="81" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_TOPLEVEL_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_TOPLEVEL" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="82" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_TOPLEVEL_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_TOPLEVEL" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="83" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_TOPLEVEL_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_TOPLEVEL" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="84" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_TOPLEVEL_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_TOPLEVEL" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="85" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_TOPLEVEL_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_TOPLEVEL" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="86" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_TOPLEVEL_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_TOPLEVEL" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="87" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_TOPLEVEL_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_TOPLEVEL" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="88" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_TOPLEVEL_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_TOPLEVEL" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="89" symbol="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADSTART_BEGIN" task="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADSTART" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="90" symbol="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADSTART_END" task="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADSTART" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="91" symbol="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADCOMPLETE_BEGIN" task="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADCOMPLETE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="92" symbol="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADCOMPLETE_END" task="PERF_WEBPLATFORMDOWNLOADNOTIFY_DOWNLOADCOMPLETE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
      <!--<event value="93" symbol="PERF_SURFACEPROVIDER_GETTILES_BEGIN" task="PERF_SURFACEPROVIDER_GETTILES"  opcode="win:Start" keywords="Performance " level="win:Informational"/>-->
      <!--<event value="94" symbol="PERF_SURFACEPROVIDER_GETTILES_END" task="PERF_SURFACEPROVIDER_GETTILES"  template="GetTiles" opcode="win:Stop" keywords="Performance" level="win:Informational"/>-->
      <!--<event value="95" symbol="PERF_CDOCUMENTTHREAD_D3DDEVICEEVENT_BEGIN" task="PERF_CDOCUMENTTHREAD_D3DDEVICEEVENT" opcode="win:Start" keywords="DocumentThreadPump" level="win:Informational"/>-->
      <!--<event value="96" symbol="PERF_CDOCUMENTTHREAD_D3DDEVICEEVENT_END" task="PERF_CDOCUMENTTHREAD_D3DDEVICEEVENT" opcode="win:Stop" keywords="DocumentThreadPump" level="win:Informational"/>-->
          <event value="97" symbol="PERF_CDOCUMENTTHREAD_INTERRUPTTASK_BEGIN" task="PERF_CDOCUMENTTHREAD_INTERRUPTTASK" opcode="win:Start" keywords="DocumentThreadPump" level="win:Informational"/>
          <event value="98" symbol="PERF_CDOCUMENTTHREAD_INTERRUPTTASK_END" task="PERF_CDOCUMENTTHREAD_INTERRUPTTASK" opcode="win:Stop" keywords="DocumentThreadPump" level="win:Informational"/>
          <event value="99" symbol="PERF_CDOCUMENTTHREAD_NORMALTASK_BEGIN" task="PERF_CDOCUMENTTHREAD_NORMALTASK" opcode="win:Start" keywords="DocumentThreadPump" level="win:Informational"/>
          <event value="100" symbol="PERF_CDOCUMENTTHREAD_NORMALTASK_END" task="PERF_CDOCUMENTTHREAD_NORMALTASK" opcode="win:Stop" keywords="DocumentThreadPump" level="win:Informational"/>
          <event value="101" symbol="PERF_CDOCUMENTTHREAD_XOTASK_BEGIN" task="PERF_CDOCUMENTTHREAD_XOTASK" opcode="win:Start" keywords="DocumentThreadPump" level="win:Informational"/>
          <event value="102" symbol="PERF_CDOCUMENTTHREAD_XOTASK_END" task="PERF_CDOCUMENTTHREAD_XOTASK" opcode="win:Stop" keywords="DocumentThreadPump" level="win:Informational"/>
          <event value="103" symbol="PERF_CDOCUMENTTHREAD_GWESTASK_BEGIN" task="PERF_CDOCUMENTTHREAD_GWESTASK" template="WindowMessage" opcode="win:Start" keywords="DocumentThreadPump" level="win:Informational"/>
          <event value="104" symbol="PERF_CDOCUMENTTHREAD_GWESTASK_END" task="PERF_CDOCUMENTTHREAD_GWESTASK" opcode="win:Stop" keywords="DocumentThreadPump" level="win:Informational"/>
      <!--<event value="105" symbol="PERF_CDOCUMENTTHREAD_RENDERTASK_BEGIN" task="PERF_CDOCUMENTTHREAD_RENDERTASK" opcode="win:Start" keywords="DocumentThreadPump" level="win:Informational"/>-->
      <!--<event value="106" symbol="PERF_CDOCUMENTTHREAD_RENDERTASK_END" task="PERF_CDOCUMENTTHREAD_RENDERTASK" opcode="win:Stop" keywords="DocumentThreadPump" level="win:Informational"/>-->
          <event value="107" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_XO_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_XO" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="108" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_XO_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATE_XO" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="109" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_XO_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_XO" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="110" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_XO_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATECOMPLETE_XO" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="111" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN_XO_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN_XO" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="112" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN_XO_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADBEGIN_XO" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="113" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE_XO_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE_XO" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="114" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE_XO_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOWNLOADCOMPLETE_XO" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="115" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_XO_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_XO" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="116" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_XO_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOCUMENTCOMPLETE_XO" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="117" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_XO_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_XO" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="118" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_XO_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEERROR_XO" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="119" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_XO_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_XO" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="120" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_XO_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NAVIGATEREDIRECTED_XO" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="121" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW_XO_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW_XO" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="122" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW_XO_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_NEWWINDOW_XO" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="123" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_XO_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_XO" opcode="win:Start" keywords="Performance primarynav" level="win:Informational"/>
          <event value="124" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_XO_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DELEGATENAVIGATE_XO" opcode="win:Stop" keywords="Performance primarynav" level="win:Informational"/>
          <event value="125" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_XO_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_XO" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="126" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_XO_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_DOMCONTENTLOADED_XO" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="127" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="128" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="129" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_TOPLEVEL_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_TOPLEVEL" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="130" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_TOPLEVEL_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_TOPLEVEL" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="131" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_XO_BEGIN" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_XO" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="132" symbol="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_XO_END" task="PERF_WEBPLATFORMNAVIGATIONEVENT_BEFORENAVIGATEREFRESH_XO" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="133" symbol="PERF_WORDSELECT_TAP_BEGIN" task="PERF_WORDSELECT_TAP" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="134" symbol="PERF_WORDSELECT_TAP_END" task="PERF_WORDSELECT_TAP" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="135" symbol="PERF_WORDSELECT_EXTEND_BEGIN" task="PERF_WORDSELECT_EXTEND" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="136" symbol="PERF_WORDSELECT_EXTEND_END" task="PERF_WORDSELECT_EXTEND" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="137" symbol="PERF_WORDSELECT_CLEAR_BEGIN" task="PERF_WORDSELECT_CLEAR" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="138" symbol="PERF_WORDSELECT_CLEAR_END" task="PERF_WORDSELECT_CLEAR" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
      <!--<event value="139" symbol="PERF_TILEMANAGER_CREATE_BEGIN" task="PERF_TILEMANAGER_CREATE" opcode="win:Start" keywords="Performance" level="win:Informational"/>-->
      <!--<event value="140" symbol="PERF_TILEMANAGER_CREATE_END" task="PERF_TILEMANAGER_CREATE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>-->
          <event value="141" symbol="PERF_HANGDETECTIONMANAGER_CREATE_BEGIN" task="PERF_HANGDETECTIONMANAGER_CREATE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="142" symbol="PERF_HANGDETECTIONMANAGER_CREATE_END" task="PERF_HANGDETECTIONMANAGER_CREATE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="143" symbol="PERF_DEBUGENDPOINT_REGISTERCONTROL_BEGIN" task="PERF_DEBUGENDPOINT_REGISTERCONTROL" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="144" symbol="PERF_DEBUGENDPOINT_REGISTERCONTROL_END" task="PERF_DEBUGENDPOINT_REGISTERCONTROL" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="145" symbol="PERF_ADAPTER_INITIALIZE_BEGIN" task="PERF_ADAPTER_INITIALIZE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="146" symbol="PERF_ADAPTER_INITIALIZE_END" task="PERF_ADAPTER_INITIALIZE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="147" symbol="PERF_CWORDSELECT_INITIALIZE_BEGIN" task="PERF_CWORDSELECT_INITIALIZE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="148" symbol="PERF_CWORDSELECT_INITIALIZE_END" task="PERF_CWORDSELECT_INITIALIZE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="149" symbol="PERF_CHIGHLIGHT_INITIALIZE_BEGIN" task="PERF_CHIGHLIGHT_INITIALIZE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="150" symbol="PERF_CHIGHLIGHT_INITIALIZE_END" task="PERF_CHIGHLIGHT_INITIALIZE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
      <!--<event value="151" symbol="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL_BEGIN" task="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL" opcode="win:Start" keywords="Performance" level="win:Informational" template="GenericUInt32"/>-->
      <!--<event value="152" symbol="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL_END" task="PERF_CDOCUMENTHOST_SETSUSPENDLEVEL" opcode="win:Stop" keywords="Performance" level="win:Informational"/>-->
          <event value="153" symbol="PERF_CDOCUMENTHOST_CREATEWINDOW_BEGIN" task="PERF_CDOCUMENTHOST_CREATEWINDOW" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="154" symbol="PERF_CDOCUMENTHOST_CREATEWINDOW_END" task="PERF_CDOCUMENTHOST_CREATEWINDOW" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="155" symbol="PERF_CDOCUMENTHOST_CREATE_CPROGRESSLOGIC_BEGIN" task="PERF_CDOCUMENTHOST_CREATE_CPROGRESSLOGIC" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="156" symbol="PERF_CDOCUMENTHOST_CREATE_CPROGRESSLOGIC_END" task="PERF_CDOCUMENTHOST_CREATE_CPROGRESSLOGIC" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="157" symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMDOWNLOADNOTIFY_BEGIN" task="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMDOWNLOADNOTIFY" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="158" symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMDOWNLOADNOTIFY_END" task="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMDOWNLOADNOTIFY" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="159" symbol="PERF_CDOCUMENTHOST_CREATE_CAUTHENTICATE_BEGIN" task="PERF_CDOCUMENTHOST_CREATE_CAUTHENTICATE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="160" symbol="PERF_CDOCUMENTHOST_CREATE_CAUTHENTICATE_END" task="PERF_CDOCUMENTHOST_CREATE_CAUTHENTICATE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="161" symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUI_BEGIN" task="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUI" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="162" symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUI_END" task="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUI" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="163" symbol="PERF_CDOCUMENTHOST_CREATE_EXTERNALDISPATCH_BEGIN" task="PERF_CDOCUMENTHOST_CREATE_EXTERNALDISPATCH" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="164" symbol="PERF_CDOCUMENTHOST_CREATE_EXTERNALDISPATCH_END" task="PERF_CDOCUMENTHOST_CREATE_EXTERNALDISPATCH" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="165" symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMNAVIGATIONEVENTSINK_BEGIN" task="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMNAVIGATIONEVENTSINK" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="166" symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMNAVIGATIONEVENTSINK_END" task="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMNAVIGATIONEVENTSINK" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="167" symbol="PERF_CDOCUMENTHOST_CREATE_INTERNETSECURITYMANAGER_BEGIN" task="PERF_CDOCUMENTHOST_CREATE_INTERNETSECURITYMANAGER" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="168" symbol="PERF_CDOCUMENTHOST_CREATE_INTERNETSECURITYMANAGER_END" task="PERF_CDOCUMENTHOST_CREATE_INTERNETSECURITYMANAGER" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="169" symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUIPRIV_BEGIN" task="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUIPRIV" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="170" symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUIPRIV_END" task="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMHOSTUIPRIV" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="171" symbol="PERF_CDOCUMENTHOST_DOVERB_INPLACEACTIVATE_BEGIN" task="PERF_CDOCUMENTHOST_DOVERB_INPLACEACTIVATE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="172" symbol="PERF_CDOCUMENTHOST_DOVERB_INPLACEACTIVATE_END" task="PERF_CDOCUMENTHOST_DOVERB_INPLACEACTIVATE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
      <!--<event value="173" symbol="PERF_CDOCUMENTHOST_CREATE_CDOCUMENTD3D_BEGIN" task="PERF_CDOCUMENTHOST_CREATE_CDOCUMENTD3D" opcode="win:Start" keywords="Performance" level="win:Informational"/>-->
      <!--<event value="174" symbol="PERF_CDOCUMENTHOST_CREATE_CDOCUMENTD3D_END" task="PERF_CDOCUMENTHOST_CREATE_CDOCUMENTD3D" opcode="win:Stop" keywords="Performance" level="win:Informational"/>-->
          <event value="175" symbol="PERF_CDOCUMENTHOST_CREATE_CCARET_BEGIN" task="PERF_CDOCUMENTHOST_CREATE_CCARET" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="176" symbol="PERF_CDOCUMENTHOST_CREATE_CCARET_END" task="PERF_CDOCUMENTHOST_CREATE_CCARET" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="177" symbol="PERF_WEBPLATFORMDOWNLOADNOTIFY_SHOULDDOWNLOAD_BEGIN" task="PERF_WEBPLATFORMDOWNLOADNOTIFY_SHOULDDOWNLOAD" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="178" symbol="PERF_WEBPLATFORMDOWNLOADNOTIFY_SHOULDDOWNLOAD_END" task="PERF_WEBPLATFORMDOWNLOADNOTIFY_SHOULDDOWNLOAD" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="179" symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMPHISHINGFILTER_BEGIN" task="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMPHISHINGFILTER" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="180" symbol="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMPHISHINGFILTER_END" task="PERF_CDOCUMENTHOST_CREATE_CWEBPLATFORMPHISHINGFILTER" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="181" symbol="PERF_SUSPENDHELPER_SUSPEND_BEGIN" task="PERF_SUSPENDHELPER_SUSPEND" opcode="win:Start" keywords="Performance" level="win:Informational" template="GenericUInt32x2"/>
          <event value="182" symbol="PERF_SUSPENDHELPER_SUSPEND_END" task="PERF_SUSPENDHELPER_SUSPEND" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="183" symbol="PERF_SUSPENDHELPER_RELEASED3DRESOURCES_BEGIN" task="PERF_SUSPENDHELPER_RELEASED3DRESOURCES" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="184" symbol="PERF_SUSPENDHELPER_RELEASED3DRESOURCES_END" task="PERF_SUSPENDHELPER_RELEASED3DRESOURCES" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="185" symbol="PERF_CDOCUMENTTHREAD_DESTROY_BEGIN" task="PERF_CDOCUMENTTHREAD_DESTROY" opcode="win:Start" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="186" symbol="PERF_CDOCUMENTTHREAD_DESTROY_END" task="PERF_CDOCUMENTTHREAD_DESTROY" opcode="win:Stop" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="187" symbol="PERF_CFIRSTRENDERCOMPLETEREGISTRATION_ONRENDERCOMPLETE_BEGIN" task="PERF_CFIRSTRENDERCOMPLETEREGISTRATION_ONRENDERCOMPLETE" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="188" symbol="PERF_CFIRSTRENDERCOMPLETEREGISTRATION_ONRENDERCOMPLETE_END" task="PERF_CFIRSTRENDERCOMPLETEREGISTRATION_ONRENDERCOMPLETE" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="189" symbol="PERF_WEBBROWSERADAPTERCORE_HIDETRANSITIONLAYER_BEGIN" task="PERF_WEBBROWSERADAPTERCORE_HIDETRANSITIONLAYER" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="190" symbol="PERF_WEBBROWSERADAPTERCORE_HIDETRANSITIONLAYER_END" task="PERF_WEBBROWSERADAPTERCORE_HIDETRANSITIONLAYER" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="191" symbol="PERF_CDOCUMENTTHREAD_IDLE_VIOLATION" task="PERF_CDOCUMENTTHREAD_IDLE_VIOLATION" template="DocIdleViolationInfo" opcode="win:Start" keywords="DocState" level="win:Informational"/>

          <!-- keywords="Debug" -->
          <event value="1000" symbol="DEBUG_CDOCUMENTHOST_NAVIGATETO_INFO" task="DEBUG_CDOCUMENTHOST_NAVIGATETO" version="0" level="win:Informational" template="GenericString" keywords="Debug" message="$(string.Microsoft-WindowsPhone-IE-WebBrowserControlDebug.event.1000.message)" />
          <event value="1001" symbol="DEBUG_CDOCUMENTHOST_BEFORENAVIGATE_INFO" task="DEBUG_CDOCUMENTHOST_BEFORENAVIGATE" version="0" level="win:Informational" template="GenericString" keywords="Debug" message="$(string.Microsoft-WindowsPhone-IE-WebBrowserControlDebug.event.1001.message)" />
          <event value="1002" symbol="DEBUG_CDOCUMENTHOST_TIMER_INFO" task="DEBUG_CDOCUMENTHOST_TIMER" version="0" level="win:Informational" template="SuspendedTimerInfo" keywords="Debug" />

          <!-- opcode="win:Info" -->
          <event value="2000" symbol="PERF_CDOCUMENTHOST_IDLETIMER" task="PERF_CDOCUMENTHOST_IDLETIMER" opcode="win:Info" keywords="Performance primarynav" level="win:Informational"/>
      <!--<event value="2001" symbol="PERF_VISIBLE_CONTENT_AREA" task="PERF_VISIBLE_CONTENT_AREA" template="VisibleContentArea" opcode="win:Info" keywords="Performance" level="win:Informational"/>-->
          <event value="2002" symbol="PERF_MODULEREFERENCETHREAD_EXITTHREAD" task="PERF_MODULEREFERENCETHREAD_EXITTHREAD" opcode="win:Info" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="2003" symbol="PERF_MODULEREFERENCE_SLEEPTHREAD" task="PERF_MODULEREFERENCE_SLEEPTHREAD" opcode="win:Info" keywords="Performance SelfHost" level="win:Informational" template="GenericUInt32"/>
          <event value="2004" symbol="PERF_CDOCUMENTTHREAD_EXITMAINMESSAGELOOP" task="PERF_CDOCUMENTTHREAD_EXITMAINMESSAGELOOP" opcode="win:Info" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="2005" symbol="PERF_CDOCUMENTTHREAD_DRAINGWESQUEUE" task="PERF_CDOCUMENTTHREAD_DRAINGWESQUEUE" opcode="win:Info" keywords="Performance SelfHost" level="win:Informational"/>
          <event value="2006" symbol="PERF_CDOCUMENTTHREAD_RESUMETHREAD" task="PERF_CDOCUMENTTHREAD_RESUMETHREAD" opcode="win:Info" keywords="Performance SelfHost" level="win:Informational"/>        

          <!-- Touch, gestures, and keyboard -->
          <event value="3000" symbol="INPUT_SPINPUTADAPTER_GESTURESESSION_BEGIN" task="INPUT_SPINPUTADAPTER_GESTURESESSION" opcode="win:Start" keywords="Performance input" level="win:Informational" />
          <event value="3001" symbol="INPUT_SPINPUTADAPTER_GESTURESESSION_END" task="INPUT_SPINPUTADAPTER_GESTURESESSION" opcode="win:Stop" keywords="Performance input" level="win:Informational" />
          <event value="3002" symbol="INPUT_CDOCUMENTHOST_HITTEST_BEGIN" task="INPUT_CDOCUMENTHOST_HITTEST" opcode="win:Start" keywords="Performance input" level="win:Informational" />
          <event value="3003" symbol="INPUT_CDOCUMENTHOST_HITTEST_END" task="INPUT_CDOCUMENTHOST_HITTEST" opcode="win:Stop" keywords="Performance input" level="win:Informational" />
          <event value="3004" symbol="INPUT_SPINPUTADAPTER_KEYDOWN" task="INPUT_SPINPUTADAPTER_KEY" opcode="win:Start" keywords="Performance input" level="win:Informational" />
          <event value="3005" symbol="INPUT_SPINPUTADAPTER_KEYUP" task="INPUT_SPINPUTADAPTER_KEY" opcode="win:Stop" keywords="Performance input" level="win:Informational" />
          <event value="3006" symbol="INPUT_SPINPUTADAPTER_KEYCHAR" task="INPUT_SPINPUTADAPTER_KEYCHAR" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3007" symbol="INPUT_SPINPUTADAPTER_TAP" task="INPUT_SPINPUTADAPTER_TAP" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3008" symbol="INPUT_SPINPUTADAPTER_SHORTHOLD" task="INPUT_SPINPUTADAPTER_SHORTHOLD" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3009" symbol="INPUT_SPINPUTADAPTER_HOLD" task="INPUT_SPINPUTADAPTER_HOLD" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3010" symbol="INPUT_SPINPUTADAPTER_DOUBLETAP" task="INPUT_SPINPUTADAPTER_DOUBLETAP" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3011" symbol="INPUT_SPINPUTADAPTER_ONTAP" task="INPUT_SPINPUTADAPTER_ONTAP" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3012" symbol="INPUT_SPINPUTADAPTER_ONDOUBLETAP" task="INPUT_SPINPUTADAPTER_ONDOUBLETAP" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3013" symbol="INPUT_SPINPUTADAPTER_ONPINCHSTRETCH" task="INPUT_SPINPUTADAPTER_ONPINCHSTRETCH" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3014" symbol="INPUT_SPINPUTADAPTER_ONFLICK" task="INPUT_SPINPUTADAPTER_ONFLICK" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3015" symbol="INPUT_SPINPUTADAPTER_ONDRAG" task="INPUT_SPINPUTADAPTER_ONDRAG" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3016" symbol="INPUT_CDOCUMENTHOST_ANIMATEELEMENT_BEGIN" task="INPUT_CDOCUMENTHOST_ANIMATEELEMENT" opcode="win:Start" keywords="Performance input" level="win:Informational" />
          <event value="3017" symbol="INPUT_CDOCUMENTHOST_ANIMATEELEMENT_END" task="INPUT_CDOCUMENTHOST_ANIMATEELEMENT" opcode="win:Stop" keywords="Performance input" level="win:Informational" />
          <event value="3018" symbol="INPUT_SPWEBBROWSERADAPTER_PROCESSZOOMANDSCROLL" task="INPUT_SPWEBBROWSERADAPTER_PROCESSZOOMANDSCROLL" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3019" symbol="INPUT_CELEMENTANIMATIONSTATE_SCHEDULESCROLL" task="INPUT_CELEMENTANIMATIONSTATE_SCHEDULESCROLL" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3020" symbol="INPUT_INPUTADAPTER_PCP_BEGIN" task="INPUT_INPUTADAPTER_PCP" opcode="win:Start" keywords="Performance input" level="win:Informational" />
          <event value="3021" symbol="INPUT_INPUTADAPTER_PCP_END" task="INPUT_INPUTADAPTER_PCP" opcode="win:Stop" keywords="Performance input" level="win:Informational" />
          <event value="3022" symbol="INPUT_CHIGHLIGHT_SHOW" task="INPUT_CHIGHLIGHT_SHOW" opcode="win:Info" keywords="Performance input" level="win:Informational" />
          <event value="3023" symbol="INPUT_CHIGHLIGHT_HIDE" task="INPUT_CHIGHLIGHT_HIDE" opcode="win:Info" keywords="Performance input" level="win:Informational" />
 
          <!-- Gesture Navigation -->
          <event value="3200" symbol="PERF_GESTURENAVIGATION_CAPTURESCREENSHOT_BEGIN" task="PERF_GESTURENAVIGATION_CAPTURESCREENSHOT" opcode="win:Start" keywords="Performance GestureNavigation" level="win:Informational"/>
          <event value="3201" symbol="PERF_GESTURENAVIGATION_CAPTURESCREENSHOT_END" task="PERF_GESTURENAVIGATION_CAPTURESCREENSHOT" opcode="win:Stop" keywords="Performance GestureNavigation" level="win:Informational"/>
          <event value="3202" symbol="PERF_GESTURENAVIGATION_SCREENSHOTCOMPRESSION_BEGIN" task="PERF_GESTURENAVIGATION_SCREENSHOTCOMPRESSION" opcode="win:Start" keywords="Performance GestureNavigation" level="win:Informational"/>
          <event value="3203" symbol="PERF_GESTURENAVIGATION_SCREENSHOTCOMPRESSION_END" task="PERF_GESTURENAVIGATION_SCREENSHOTCOMPRESSION" opcode="win:Stop" keywords="Performance GestureNavigation" level="win:Informational"/>           

          <!-- VTab -->
          <event value="3500" symbol="VTAB_SUSPENDING" task="VTAB_SUSPENDING" opcode="win:Info" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3501" symbol="VTAB_RESUMED" task="VTAB_RESUMED" opcode="win:Info" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3502" symbol="VTAB_ADDVTAB_BEGIN" task="VTAB_ADDVTAB" opcode="win:Start" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3503" symbol="VTAB_ADDVTAB_END" task="VTAB_ADDVTAB" opcode="win:Stop" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3504" symbol="VTAB_CLOSEVTAB_BEGIN" task="VTAB_CLOSEVTAB" opcode="win:Start" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3505" symbol="VTAB_CLOSEVTAB_END" task="VTAB_CLOSEVTAB" opcode="win:Stop" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3506" symbol="VTAB_NAVIGATETOVTAB_BEGIN" task="VTAB_NAVIGATETOVTAB" opcode="win:Start" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3507" symbol="VTAB_NAVIGATETOVTAB_END" task="VTAB_NAVIGATETOVTAB" opcode="win:Stop" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3508" symbol="VTAB_SWITCHVTAB_BEGIN" task="VTAB_SWITCHVTAB" opcode="win:Start" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3509" symbol="VTAB_SWITCHVTAB_END" task="VTAB_SWITCHVTAB" opcode="win:Stop" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3510" symbol="VTAB_LOWMEMORY" task="VTAB_LOWMEMORY" opcode="win:Info" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3511" symbol="VTAB_ADDVTAB_ADDED" task="VTAB_ADDVTAB" opcode="win:Info" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3512" symbol="VTAB_DOCTHREAD_SUSPENDING" task="VTAB_DOCTHREAD_SUSPENDING" opcode="win:Info" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />
          <event value="3513" symbol="VTAB_DOCTHREAD_RESUMED" task="VTAB_DOCTHREAD_RESUMED" opcode="win:Info" keywords="Performance VTab" level="win:Informational" template="GenericUInt32x2" />

          <!-- Rendering Events -->
      <!--<event value="4000" symbol="RENDER_UPDATE_TILE" task="RENDER_UPDATE_TILE" template="Rectangle" opcode="win:Info" keywords="Performance rendering" level="win:Informational" />-->
      <!--<event value="4001" symbol="RENDER_CLEAR_TILE" task="RENDER_CLEAR_TILE" opcode="win:Info" keywords="Performance rendering" level="win:Informational" />-->
      <!--<event value="4002" symbol="ON_RENDER_EVENT_COMPLETE" task="ON_RENDER_EVENT_COMPLETE" opcode="win:Info" keywords="Performance rendering" level="win:Informational" />-->
      <!--<event value="4003" symbol="RENDER_SYNC_TICK_BEGIN" task="RENDER_SYNC_TICK" opcode="win:Start" keywords="Performance rendering" level="win:Informational"/>-->
      <!--<event value="4004" symbol="RENDER_SYNC_TICK_END" task="RENDER_SYNC_TICK" opcode="win:Stop" keywords="Performance rendering" level="win:Informational"/>-->
        
          <!-- managed WebBrowser control -->
          <event value="5000" symbol="PERF_AGCONTROL_INSTANTIATED_BEGIN" task="PERF_AGCONTROL_INSTANTIATED" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="5001" symbol="PERF_AGCONTROL_INSTANTIATED_END" task="PERF_AGCONTROL_INSTANTIATED" opcode="win:Stop" keywords="Performance" level="win:Informational"/>
          <event value="5002" symbol="PERF_AGCONTROL_RESUME_BEGIN" task="PERF_AGCONTROL_RESUME" opcode="win:Start" keywords="Performance" level="win:Informational"/>
          <event value="5003" symbol="PERF_AGCONTROL_RESUME_END" task="PERF_AGCONTROL_RESUME" opcode="win:Stop" keywords="Performance" level="win:Informational"/>

          <!-- Retail messages -->
          <event value="6000" symbol="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITE"                     task="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITE"                     opcode="win:Info" keywords="Debug" level="win:Informational" version="0" template="DebugConsoleWrite"                     message="$(string.Microsoft-WindowsPhone-IE-WebBrowserControl.event.6000.message)"/>
          <event value="6001" symbol="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURL"              task="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURL"              opcode="win:Info" keywords="Debug" level="win:Informational" version="0" template="DebugConsoleWriteWithUrl"              message="$(string.Microsoft-WindowsPhone-IE-WebBrowserControl.event.6001.message)"/>
          <event value="6002" symbol="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURLANDLINE"       task="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURLANDLINE"       opcode="win:Info" keywords="Debug" level="win:Informational" version="0" template="DebugConsoleWriteWithUrlAndLine"       message="$(string.Microsoft-WindowsPhone-IE-WebBrowserControl.event.6002.message)"/>
          <event value="6003" symbol="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURLLINEANDCOLUMN" task="RETAIL_BROWSERCONTROL_DEBUGCONSOLE_WRITEWITHURLLINEANDCOLUMN" opcode="win:Info" keywords="Debug" level="win:Informational" version="0" template="DebugConsoleWriteWithUrlLineAndColumn" message="$(string.Microsoft-WindowsPhone-IE-WebBrowserControl.event.6003.message)"/>
          <event value="6004" symbol="RETAIL_BROWSERCONTROL_HANGDETECTED"                           task="RETAIL_BROWSERCONTROL_HANGDETECTED"                           opcode="win:Info" keywords="Debug" level="win:Informational" version="0" template="HangDetected"                          message="$(string.Microsoft-WindowsPhone-IE-WebBrowserControl.event.6004.message)"/>
        </events>
      </provider>
      <provider
        name="Microsoft-WindowsPhone-EntityExtraction-Provider"
        guid="{62FA713A-6FC1-4c18-B1D2-29EBF8061105}"
        symbol="BERP_EntityExtraction"
        messageFileName="BrowserPlatformLogging.dll"
        resourceFileName="BrowserPlatformLogging.dll">
        <keywords>
          <keyword mask="0x0000000000000001" name="Debug"/>
          <keyword mask="0x0000000000000002" name="Performance"/>
        </keywords>
        <templates>
          <template tid="ProcessYouTubeLinkFailed">
            <data name="hr" inType="win:Int32" outType="win:HResult" />
          </template>
          <template tid="FormatHTMLReplacementTagFailed">
            <data name="hr" inType="win:Int32" outType="win:HResult" />
          </template>
        </templates>
        <tasks>
          <task name="PERF_EERUNTIME_FIND_ENTITIES"                   symbol="PERF_EERUNTIME_FIND_ENTITIES_TASK"                            value="1"/>
          <task name="PERF_EERUNTIME_PROCESS_ENTITIES"                symbol="PERF_EERUNTIME_PROCESS_ENTITIES_TASK"                         value="2"/>
          <task name="PERF_EERUNTIME_PROCESS_ADDRESS"                 symbol="PERF_EERUNTIME_PROCESS_ADDRESS_TASK"                          value="3"/>
          <task name="PERF_EERUNTIME_PROCESS_TEL"                     symbol="PERF_EERUNTIME_PROCESS_TEL_TASK"                              value="4"/>
          <task name="PERF_EERUNTIME_DOMSEARCH"                       symbol="PERF_EERUNTIME_DOMSEARCH_TASK"                                value="5"/>
          <task name="PERF_EERUNTIME_LOAD_TRAININGDATA"               symbol="PERF_EERUNTIME_LOAD_TRAININGDATA_TASK"                        value="6"/>
          <task name="PERF_EERUNTIME_FIND_TEXT"                       symbol="PERF_EERUNTIME_FIND_TEXT_TASK"                                value="7"/>
          <task name="PERF_EERUNTIME_GET_VISIBLETEXT"                 symbol="PERF_EERUNTIME_GET_VISIBLETEXT_TASK"                          value="8"/>
        </tasks>
        <events>
          <!-- opcode="win:Start/win:Stop" -->
          <event value="1"  symbol="PERF_EERUNTIME_FIND_ENTITIES_BEGIN"       task="PERF_EERUNTIME_FIND_ENTITIES"     opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="2"  symbol="PERF_EERUNTIME_FIND_ENTITIES_END"         task="PERF_EERUNTIME_FIND_ENTITIES"     opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="3"  symbol="PERF_EERUNTIME_PROCESS_ADDRESS_BEGIN"     task="PERF_EERUNTIME_PROCESS_ADDRESS"   opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="4"  symbol="PERF_EERUNTIME_PROCESS_ADDRESS_END"       task="PERF_EERUNTIME_PROCESS_ADDRESS"   opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="5"  symbol="PERF_EERUNTIME_PROCESS_ENTITIES_BEGIN"    task="PERF_EERUNTIME_PROCESS_ENTITIES"  opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="6"  symbol="PERF_EERUNTIME_PROCESS_ENTITIES_END"      task="PERF_EERUNTIME_PROCESS_ENTITIES"  opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="7"  symbol="PERF_EERUNTIME_PROCESS_TEL_BEGIN"         task="PERF_EERUNTIME_PROCESS_TEL"       opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="8"  symbol="PERF_EERUNTIME_PROCESS_TEL_END"           task="PERF_EERUNTIME_PROCESS_TEL"       opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="9"  symbol="PERF_EERUNTIME_DOMSEARCH_BEGIN"           task="PERF_EERUNTIME_DOMSEARCH"         opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="10" symbol="PERF_EERUNTIME_DOMSEARCH_END"             task="PERF_EERUNTIME_DOMSEARCH"         opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="11" symbol="PERF_EERUNTIME_LOAD_TRAININGDATA_BEGIN"   task="PERF_EERUNTIME_LOAD_TRAININGDATA" opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="12" symbol="PERF_EERUNTIME_LOAD_TRAININGDATA_END"     task="PERF_EERUNTIME_LOAD_TRAININGDATA" opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="13" symbol="PERF_EERUNTIME_FIND_TEXT_BEGIN"           task="PERF_EERUNTIME_FIND_TEXT"         opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="14" symbol="PERF_EERUNTIME_FIND_TEXT_END"             task="PERF_EERUNTIME_FIND_TEXT"         opcode="win:Stop"   keywords="Performance" level="win:Informational"/>
          <event value="15" symbol="PERF_EERUNTIME_GET_VISIBLETEXT_BEGIN"     task="PERF_EERUNTIME_GET_VISIBLETEXT"   opcode="win:Start"  keywords="Performance" level="win:Informational"/>
          <event value="16" symbol="PERF_EERUNTIME_GET_VISIBLETEXT_END"       task="PERF_EERUNTIME_GET_VISIBLETEXT"   opcode="win:Stop"   keywords="Performance" level="win:Informational"/>

          <!-- Retail messages -->
          <event value="2000"  symbol="Retail_EntityExtraction_ProcessYouTubeLinkFailed"          keywords="Debug"  level="win:Error" version="0" template="ProcessYouTubeLinkFailed"       message="$(string.Microsoft-WindowsPhone-EntityExtraction.event.2000.message)"/>
          <event value="2001"  symbol="Retail_EntityExtraction_FormatHTMLReplacementTagFailed"    keywords="Debug"  level="win:Error" version="0" template="FormatHTMLReplacementTagFailed" message="$(string.Microsoft-WindowsPhone-EntityExtraction.event.2001.message)"/>
          
        </events>
      </provider>
      
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="opcode.Start" value="Start">
        </string>
        <string id="opcode.Info" value="Info">
        </string>
        <string id="level.Warning" value="Warning">
        </string>
        <string id="level.Verbose" value="Verbose">
        </string>
        <string id="level.Error" value="Error">
        </string>
        
        <string id="Microsoft-WindowsPhone-IE-WebBrowserControlDebug.event.1000.message" value="Navigation: %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-WebBrowserControlDebug.event.1001.message" value="Before-Navigate: %1">
        </string>
        <string id="Microsoft-WindowsPhone-IE-WebBrowserControl.event.6000.message" value="DEBUG CONSOLE: %1 %2 - %3: %4">
        </string>
        <string id="Microsoft-WindowsPhone-IE-WebBrowserControl.event.6001.message" value="DEBUG CONSOLE: %1 %2 - %3: %4 [%5]">
        </string>
        <string id="Microsoft-WindowsPhone-IE-WebBrowserControl.event.6002.message" value="DEBUG CONSOLE: %1 %2 - %3: %4 [%5:line %6]">
        </string>
        <string id="Microsoft-WindowsPhone-IE-WebBrowserControl.event.6003.message" value="DEBUG CONSOLE: %1 %2 - %3: %4 [%5:line %6 column %7]">
        </string>
        <string id="Microsoft-WindowsPhone-IE-WebBrowserControl.event.6004.message" value="CHangDetectionManager::_HangDetected Calling TerminateProcess on 0x%x. If this is called during debugging, please disable Browser's hang detection from debug menu entry">
        </string>
      </stringTable>

      <stringTable>
        <string id="Microsoft-WindowsPhone-EntityExtraction.event.2000.message" value="[[EntityExtractionExtension]] - ProcessYoutubeLinks fails with %1">
        </string>
        <string id="Microsoft-WindowsPhone-EntityExtraction.event.2001.message" value="[[ EntityExtractionExtension ]] - Failed in FormatHTMLTag with : %1">
        </string>

      </stringTable>

      
    </resources>
  </localization>
</instrumentationManifest>
