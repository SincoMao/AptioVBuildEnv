<assembly 
    xmlns="urn:schemas-microsoft-com:asm.v3" 
    xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
    manifestVersion="1.0">
    <instrumentation 
        xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events">
        <events 
            xmlns="http://schemas.microsoft.com/win/2004/08/events">
            <provider 
                name="Microsoft-WindowsPhone-AppModelCore" 
                guid="{AEA0CB35-420E-43c4-8967-E53514EE1586}" 
                symbol="MICROSOFT_WINDOWSPHONE_APPMODELCORE"
                resourceFileName="AppModelCore.dll" 
                messageFileName="AppModelCore.dll"
                message="$(string.Provider.Name)">
                <keywords>
                    <keyword 
                        mask="0x0000000000000001" 
                        name="Error" 
                        message="$(string.Keyword.Error)"/>
                    <keyword 
                        mask="0x0000000000000002" 
                        name="Performance"
                        message="$(string.Keyword.Performance)"/>
                    <keyword 
                        mask="0x0000000000000100" 
                        name="Debug" 
                        message="$(string.Keyword.Debug)"/>
                    <keyword 
                        mask="0x0000000000000200" 
                        name="CoreApplication" 
                        message="$(string.Keyword.CoreApplication)"/>
                    <keyword
                        mask="0x0000000000000400"
                        name="CoreWindow"
                        message="$(string.Keyword.CoreWindow)"/>
                    <keyword 
                        mask="0x0000000000000800" 
                        name="NavigationClient" 
                        message="$(string.Keyword.NavigationClient)"/>
                    <keyword 
                        mask="0x0000000000001000" 
                        name="AppChromeListener" 
                        message="$(string.Keyword.AppChromeListener)"/>
                    <keyword
                        mask="0x0000000000002000"
                        name="CoreDispatcher"
                        message="$(string.Keyword.CoreDispatcher)"/>
                </keywords>
                <tasks>
                    <!-- CoreApplication value range: 2000 to 2099 --> 
                    <task 
                        name="CoreApplicationActivation" 
                        value="2000"/>
                    <task 
                        name="CoreApplicationSuspension" 
                        value="2002"/>
                    <task 
                        name="CoreApplicationExit" 
                        value="2004"/>
                    <task 
                        name="CoreApplicationRegistration" 
                        value="2006"/>
                    <task 
                        name="CoreApplicationInitialization" 
                        value="2008"/>
                    <task 
                        name="CoreApplicationFrameworkViewLoad" 
                        value="2010"/>
                    <task 
                        name="CoreApplicationFrameworkViewInitialization" 
                        value="2012"/>
                    <task 
                        name="CoreApplicationActivationHandlers" 
                        value="2014"/>
                    <task 
                        name="CoreApplicationSuspendHandlers" 
                        value="2016"/>
                    <task 
                        name="CoreApplicationResumeHandlers" 
                        value="2018"/>
                    <task 
                        name="CoreApplicationCreateNewView" 
                        value="2020"/>
                    <task
                        name="CoreApplicationPsmDoStateChange"
                        value="2040"/>
                    <task
                        name="CoreApplicationQuiescePsmBlockUnblockASTA"
                        value="2042"/>
                    <task
                        name="CoreApplicationResumePsmBlockUnblockASTA"
                        value="2044"/>
                    <task
                        name="CoreApplicationQuiesceWaitForAppResume"
                        value="2046"/>
                    <task
                        name="CoreApplicationFrameworkViewSetWindow"
                        value="2050"/>
                    <task
                        name="CoreApplicationFrameworkViewRun"
                        value="2052"/>
                    <task
                        name="CoreApplicationFrameworkViewUninitialization"
                        value="2054"/>
                    <!-- CoreWindow value range: 2100 to 2199 -->
                    <task
                        name="CoreWindowTouch"
                        value="2100"/>
                    <task
                        name="CoreWindowActivateHandler"
                        value="2101"/>
                    <task
                        name="CoreWindowVisibility"
                        value="2102"/>
                    <task
                        name="TouchData"
                        value="2103"/>
                    <task
                        name="Event"
                        value="2104"/>
                    <task
                        name="CoreWindowClose"
                        value="2105"/>
                    <task
                        name="CoreWindowConnectNavigationClient"
                        value="2106"/>
                    <task
                        name="CoreWindowActivate"
                        value="2108"/>
                    <task
                        name="CoreDispatcherProcessEvents"
                        value="2110"/>
                    <task
                        name="CoreDispatcherRunAsync"
                        value="2112"/>
                    <task
                        name="CoreDispatcherCallback"
                        value="2114"/>
                    <task
                        name="CoreDispatcherProcessMessage"
                        value="2116"/>
                    <task
                        name="CoreDispatcherStoping"
                        value="2118"/>
                    <task
                        name="CoreWindowOnTouchEvent"
                        value="2120"/>
                    <!-- NavigationClient value range: 2200 to 2299-->
                    <!-- NavigationClient -->
                    <task 
                        name="NavigationClientRuntimeClassInitialize"
                        value="2200" />    
                    <task 
                        name="NavigationClientUninitialize"
                        value="2202" />    
                    <task 
                        name="NavigationClientWaitForConnectionComplete"
                        value="2208" />    
                    <task
                        name="NavigationClientViewActivated"
                        value="2210" />
                    <task
                        name="NavigationClientWindowActivated"
                        value="2212" />
                    <!-- NavigationClient out-going messages -->
                    <task 
                        name="NavigationClientCreateNavigationTask"
                        value="2220" />   
                    <task 
                        name="NavigationClientCreateNavigationWindow"
                        value="2221" />   
                    <task 
                        name="NavigationClientNavigateToComplete"
                        value="2226" />   
                    <task 
                        name="NavigationClientNavigateAwayComplete"
                        value="2227" />   
                    <task 
                        name="NavigationClientSystemKeyHandled"
                        value="2228" />   
                    <task 
                        name="NavigationClientRequestClose"
                        value="2229" />   
                    <!-- NavigationClient incoming messages -->
                    <task 
                        name="NavigationClientConnectionComplete"
                        value="2250" />    
                    <task 
                        name="NavigationClientRegistrationComplete"
                        value="2251" />    
                    <task 
                        name="NavigationClientShow"
                        value="2252" />    
                    <task 
                        name="NavigationClientHide"
                        value="2253" />    
                    <task 
                        name="NavigationClientNavigateTo"
                        value="2254" />    
                    <task 
                        name="NavigationClientNavigateAway"
                        value="2255" />    
                    <task 
                        name="NavigationClientClose"
                        value="2256" />    
                    <task 
                        name="NavigationClientSystemKeyPressed"
                        value="2257" />    
                    <task 
                        name="NavigationClientLaunchChildTaskComplete"
                        value="2258" />    
                    <task 
                        name="NavigationClientLaunchSessionComplete"
                        value="2259" />    
                    <task 
                        name="NavigationClientPropertyChanged"
                        value="2260" />
                    <task 
                        name="NavigationClientProcessActivationDataHandler"
                        value="2262" />
                    <task 
                        name="NavigationClientProcessActivationData"
                        value="2264" />
                    <task 
                        name="NavigationClientNavigateToHandler"
                        value="2266" />
                    <!-- INavigationClient -->
                    <task 
                        name="NavigationClientLaunchSession"
                        value="2270" />
                    <task 
                        name="NavigationClientLaunchChildTask"
                        value="2272" />
                    <!-- NavigationClient:Shell protocol, value range: 2300 to 2399-->
                    <task 
                        name="NavigationClientConnectToShell"
                        value="2300" />
                    <task 
                        name="NavigationClientDisconnectFromShell"
                        value="2302" />
                    <task 
                        name="AppChromeListenerOnVisibleRegionChange"
                        value="2304" />
                    <task 
                        name="AppChromeListenerOnObscurityChange"
                        value="2306" />
                    <task 
                        name="AppChromeListenerOnLockScreenVisibilityChange"
                        value="2308" />
                    <task 
                        name="AppChromeListenerOnSipVisibilityChange"
                        value="2310" />
                    <task 
                        name="AppChromeListenerOnShowAnimationComplete"
                        value="2314" />
                    <task 
                        name="AppChromeListenerOnUIAutomationConnection"
                        value="2318" />
                    <task 
                        name="AppChromeListenerOnSearchButtonPress"
                        value="2320" />
                    <task 
                        name="NavigationClientRequestSplashScreen"
                        value="2322" />
                </tasks>
                <events> 
                    <event 
                        symbol="CoreApplicationActivationStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationActivation" 
                        opcode="win:Start" 
                        value="2000"
                        message="$(string.Event.CoreApplicationActivationStart)"/>
                    <event 
                        symbol="CoreApplicationActivationStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationActivation" 
                        opcode="win:Stop" 
                        value="2001"
                        message="$(string.Event.CoreApplicationActivationStop)"/>
                    <event 
                        symbol="CoreApplicationSuspensionStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationSuspension" 
                        opcode="win:Start" 
                        value="2002"
                        message="$(string.Event.CoreApplicationSuspensionStart)"/>
                    <event 
                        symbol="CoreApplicationSuspensionStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationSuspension" 
                        opcode="win:Stop" 
                        value="2003"
                        message="$(string.Event.CoreApplicationSuspensionStop)"/>
                    <event 
                        symbol="CoreApplicationExitStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationExit" 
                        opcode="win:Start" 
                        value="2004"
                        message="$(string.Event.CoreApplicationExitStart)"/>
                    <event 
                        symbol="CoreApplicationExitStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationExit" 
                        opcode="win:Stop" 
                        value="2005"
                        message="$(string.Event.CoreApplicationExitStop)"/>
                    <event 
                        symbol="CoreApplicationRegistrationStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationRegistration" 
                        opcode="win:Start" 
                        value="2006"
                        message="$(string.Event.CoreApplicationRegistrationStart)"/>
                    <event 
                        symbol="CoreApplicationRegistrationStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationRegistration" 
                        opcode="win:Stop" 
                        value="2007"
                        message="$(string.Event.CoreApplicationRegistrationStop)"/>
                    <event 
                        symbol="CoreApplicationInitializationStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationInitialization" 
                        opcode="win:Start" 
                        value="2008"
                        message="$(string.Event.CoreApplicationInitializationStart)"/>
                    <event 
                        symbol="CoreApplicationInitializationStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationInitialization" 
                        opcode="win:Stop" 
                        value="2009"
                        message="$(string.Event.CoreApplicationInitializationStop)"/>
                    <event 
                        symbol="CoreApplicationFrameworkViewLoadStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationFrameworkViewLoad" 
                        opcode="win:Start" 
                        value="2010"
                        message="$(string.Event.CoreApplicationFrameworkViewLoadStart)"/>
                    <event 
                        symbol="CoreApplicationFrameworkViewLoadStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationFrameworkViewLoad" 
                        opcode="win:Stop" 
                        value="2011"
                        message="$(string.Event.CoreApplicationFrameworkViewLoadStop)"/>
                    <event 
                        symbol="CoreApplicationFrameworkViewInitializationStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationFrameworkViewInitialization" 
                        opcode="win:Start" 
                        value="2012"
                        message="$(string.Event.CoreApplicationFrameworkViewInitializationStart)"/>
                    <event 
                        symbol="CoreApplicationFrameworkViewInitializationStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationFrameworkViewInitialization" 
                        opcode="win:Stop" 
                        value="2013"
                        message="$(string.Event.CoreApplicationFrameworkViewInitializationStop)"/>
                    <event 
                        symbol="CoreApplicationActivationHandlersStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationActivationHandlers" 
                        opcode="win:Start" 
                        value="2014"
                        message="$(string.Event.CoreApplicationActivationHandlersStart)"/>
                    <event 
                        symbol="CoreApplicationActivationHandlersStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationActivationHandlers" 
                        opcode="win:Stop" 
                        value="2015"
                        message="$(string.Event.CoreApplicationActivationHandlersStop)"/>
                    <event 
                        symbol="CoreApplicationSuspendHandlersStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationSuspendHandlers" 
                        opcode="win:Start" 
                        value="2016"
                        message="$(string.Event.CoreApplicationSuspendHandlersStart)"/>
                    <event 
                        symbol="CoreApplicationSuspendHandlersStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationSuspendHandlers" 
                        opcode="win:Stop" 
                        value="2017"
                        message="$(string.Event.CoreApplicationSuspendHandlersStop)"/>
                    <event 
                        symbol="CoreApplicationResumeHandlersStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationResumeHandlers" 
                        opcode="win:Start" 
                        value="2018"
                        message="$(string.Event.CoreApplicationResumeHandlersStart)"/>
                    <event 
                        symbol="CoreApplicationResumeHandlersStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationResumeHandlers" 
                        opcode="win:Stop" 
                        value="2019"
                        message="$(string.Event.CoreApplicationResumeHandlersStop)"/>
                    <event 
                        symbol="CoreApplicationCreateNewViewStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationCreateNewView" 
                        opcode="win:Start" 
                        value="2020"
                        message="$(string.Event.CoreApplicationCreateNewViewStart)"/>
                    <event 
                        symbol="CoreApplicationCreateNewViewStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationCreateNewView" 
                        opcode="win:Stop" 
                        value="2021"
                        message="$(string.Event.CoreApplicationCreateNewViewStop)"/>
                    <event
                        symbol="CoreApplication_PsmDoStateChange"
                        keywords="CoreApplication" 
                        level="win:Informational"
                        task="CoreApplicationPsmDoStateChange"
                        template="PsmQuiesceInfo"
                        opcode="win:Info"
                        value="2040"
                        message="$(string.Event.CoreApplicationPsmDoStateChangeMessage)"/>
                    <event
                        symbol="CoreApplication_Quiesce_Psm_Block_Unblock_ASTA"
                        keywords="CoreApplication" 
                        level="win:Informational"
                        task="CoreApplicationQuiescePsmBlockUnblockASTA"
                        template="PsmBlockUnblockInfo"
                        opcode="win:Info"
                        value="2042"
                        message="$(string.Event.CoreApplicationQuiescePsmBlockUnblockASTAMessage)"/>
                    <event
                        symbol="CoreApplication_Resume_Psm_Block_Unblock_ASTA"
                        keywords="CoreApplication" 
                        level="win:Informational"
                        task="CoreApplicationResumePsmBlockUnblockASTA"
                        template="PsmBlockUnblockInfo"
                        opcode="win:Info"
                        value="2044"
                        message="$(string.Event.CoreApplicationResumePsmBlockUnblockASTAMessage)"/>
                    <event
                        symbol="CoreApplication_Quiesce_Wait_For_App_Resume"
                        keywords="CoreApplication" 
                        level="win:Informational"
                        task="CoreApplicationQuiesceWaitForAppResume"
                        template="PsmThreadInfo"
                        opcode="win:Info"
                        value="2046"
                        message="$(string.Event.CoreApplicationQuiesceWaitForAppResumeMessage)"/>
                    <event 
                        symbol="CoreApplicationFrameworkViewSetWindowStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationFrameworkViewSetWindow" 
                        opcode="win:Start" 
                        value="2050"
                        message="$(string.Event.CoreApplicationFrameworkViewSetWindowStart)"/>
                    <event 
                        symbol="CoreApplicationFrameworkViewSetWindowStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationFrameworkViewSetWindow" 
                        opcode="win:Stop" 
                        value="2051"
                        message="$(string.Event.CoreApplicationFrameworkViewSetWindowStop)"/>
                    <event 
                        symbol="CoreApplicationFrameworkViewRunStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationFrameworkViewRun" 
                        opcode="win:Start" 
                        value="2052"
                        message="$(string.Event.CoreApplicationFrameworkViewRunStart)"/>
                    <event 
                        symbol="CoreApplicationFrameworkViewRunStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationFrameworkViewRun" 
                        opcode="win:Stop" 
                        value="2053"
                        message="$(string.Event.CoreApplicationFrameworkViewRunStop)"/>
                    <event 
                        symbol="CoreApplicationFrameworkViewUninitializationStart" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationFrameworkViewUninitialization" 
                        opcode="win:Start" 
                        value="2054"
                        message="$(string.Event.CoreApplicationFrameworkViewUninitializationStart)"/>
                    <event 
                        symbol="CoreApplicationFrameworkViewUninitializationStop" 
                        keywords="CoreApplication" 
                        level="win:Informational" 
                        task="CoreApplicationFrameworkViewUninitialization" 
                        opcode="win:Stop" 
                        value="2055"
                        message="$(string.Event.CoreApplicationFrameworkViewUninitializationStop)"/>
                    <!-- CoreWindow -->
                    <event
                        symbol="CoreWindowTouchStart"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowTouch"
                        opcode="win:Start"
                        value="2100"
                        message="$(string.Event.CoreWindowTouchStart)"/>
                    <event
                        symbol="CoreWindowTouchStop"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowTouch"
                        opcode="win:Stop"
                        value="2101"
                        message="$(string.Event.CoreWindowTouchStop)"/>
                    <event
                        symbol="CoreWindowTouchInfoDump"
                        keywords="CoreWindow"
                        level="win:Informational"
                        value="2102"
                        template="TouchInfoData"
                        opcode="win:Info"
                        task="TouchData"
                        message="$(string.Event.CoreWindowTouchInfoDump)"/>
                    <event
                        symbol="CoreWindowTouchContactDump"
                        keywords="CoreWindow"
                        level="win:Informational"
                        value="2103"
                        template="TouchContactData"
                        opcode="win:Info"
                        task="TouchData"
                        message="$(string.Event.CoreWindowTouchContactDump)"/>
                    <event
                        symbol="CoreWindowUnusedEvent"
                        keywords="CoreWindow"
                        level="win:Informational"
                        value="2104"
                        template="WideString"
                        task="Event"
                        message="$(string.Event.CoreWindowUnusedEvent)"/>
                    <event
                        symbol="CoreWindowPointerPressed"
                        keywords="CoreWindow"
                        level="win:Informational"
                        value="2105"
                        template="PointerData"
                        opcode="win:Info"
                        task="TouchData"
                        message="$(string.Event.CoreWindowPointerPressed)"/>
                    <event
                        symbol="CoreWindowPointerMoved"
                        keywords="CoreWindow"
                        level="win:Informational"
                        value="2106"
                        template="PointerData"
                        task="TouchData"
                        message="$(string.Event.CoreWindowPointerMoved)"/>
                    <event
                        symbol="CoreWindowPointerReleased"
                        keywords="CoreWindow"
                        level="win:Informational"
                        value="2107"
                        template="PointerData"
                        task="TouchData"
                        message="$(string.Event.CoreWindowPointerReleased)"/>
                    <event
                        symbol="CoreWindowActivateHandlerStart"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowActivateHandler"
                        opcode="win:Start"
                        value="2108"
                        template="ActivateData"
                        message="$(string.Event.CoreWindowActivateHandlerStart)"/>
                    <event
                        symbol="CoreWindowActivateHandlerStop"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowActivateHandler"
                        opcode="win:Stop"
                        value="2109"
                        message="$(string.Event.CoreWindowActivateHandlerStop)"/>
                    <event
                        symbol="CoreWindowVisibilityStart"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowVisibility"
                        opcode="win:Start"
                        value="2110"
                        template="BooleanData"
                        message="$(string.Event.CoreWindowVisibilityStart)"/>
                    <event
                        symbol="CoreWindowVisibilityStop"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowVisibility"
                        opcode="win:Stop"
                        value="2111"
                        message="$(string.Event.CoreWindowVisibilityStop)"/>
                    <event
                        symbol="CoreWindowCloseStart"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowClose"
                        opcode="win:Start"
                        value="2112"
                        message="$(string.Event.CoreWindowCloseStart)"/>
                    <event
                        symbol="CoreWindowCloseStop"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowClose"
                        opcode="win:Stop"
                        value="2113"
                        message="$(string.Event.CoreWindowCloseStop)"/>
                    <event
                        symbol="CoreWindowActivateStart"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowActivate"
                        opcode="win:Start"
                        value="2114"
                        message="$(string.Event.CoreWindowActivateStart)"/>
                    <event
                        symbol="CoreWindowActivateStop"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowActivate"
                        opcode="win:Stop"
                        value="2115"
                        template="HResultData"
                        message="$(string.Event.CoreWindowActivateStop)"/>
                    <event
                        symbol="CoreWindowConnectNavigationClientStart"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowConnectNavigationClient"
                        opcode="win:Start"
                        value="2116"
                        message="$(string.Event.CoreWindowConnectNavigationClientStart)"/>
                    <event
                        symbol="CoreWindowConnectNavigationClientStop"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowConnectNavigationClient"
                        opcode="win:Stop"
                        value="2117"
                        message="$(string.Event.CoreWindowConnectNavigationClientStop)"/>
                    <event
                        symbol="CoreWindowPointerEntered"
                        keywords="CoreWindow"
                        level="win:Informational"
                        template="PointerData"
                        task="TouchData"
                        value="2118"
                        message="$(string.Event.CoreWindowPointerEntered)"/>
                    <event
                        symbol="CoreWindowPointerExited"
                        keywords="CoreWindow"
                        level="win:Informational"
                        template="PointerData"
                        task="TouchData"
                        value="2119"
                        message="$(string.Event.CoreWindowPointerExited)"/>
						
                    <event
                        symbol="CoreDispatcherProcessEventsStart"
                        keywords="CoreDispatcher"
                        level="win:Verbose"
                        task="CoreDispatcherProcessEvents"
                        opcode="win:Start"
                        template="CoreDispatcherProcessEventsData"
                        value="2124"
                        message="$(string.Event.CoreDispatcherProcessEventsStart)"/>
                    <event
                        symbol="CoreDispatcherProcessEventsStop"
                        keywords="CoreDispatcher"
                        level="win:Verbose"
                        task="CoreDispatcherProcessEvents"
                        opcode="win:Stop"
                        value="2125"
                        template="HResultData"
                        message="$(string.Event.CoreDispatcherProcessEventsStop)"/>
                    <event
                        symbol="CoreDispatcherCallbackStart"
                        keywords="CoreDispatcher"
                        level="win:Informational"
                        task="CoreDispatcherCallback"
                        opcode="win:Start"
                        value="2126"
                        message="$(string.Event.CoreDispatcherCallbackStart)"/>
                    <event
                        symbol="CoreDispatcherCallbackStop"
                        keywords="CoreDispatcher"
                        level="win:Informational"
                        task="CoreDispatcherCallback"
                        opcode="win:Stop"
                        value="2127"
                        template="HResultData"
                        message="$(string.Event.CoreDispatcherCallbackStop)"/>
                    <event
                        symbol="CoreDispatcherProcessMessageStart"
                        keywords="CoreDispatcher"
                        level="win:Verbose"
                        task="CoreDispatcherProcessMessage"
                        opcode="win:Start"
                        value="2128"
                        message="$(string.Event.CoreDispatcherProcessMessageStart)"/>
                    <event
                        symbol="CoreDispatcherProcessMessageStop"
                        keywords="CoreDispatcher"
                        level="win:Verbose"
                        task="CoreDispatcherProcessMessage"
                        opcode="win:Stop"
                        value="2129"
                        template="BooleanData"
                        message="$(string.Event.CoreDispatcherProcessMessageStop)"/>
                    <event
                        symbol="CoreDispatcherRunAsyncStart"
                        keywords="CoreDispatcher"
                        level="win:Informational"
                        task="CoreDispatcherRunAsync"
                        opcode="win:Start"
                        value="2130"
                        message="$(string.Event.CoreDispatcherRunAsyncStart)"/>
                    <event
                        symbol="CoreDispatcherRunAsyncStop"
                        keywords="CoreDispatcher"
                        level="win:Informational"
                        task="CoreDispatcherRunAsync"
                        opcode="win:Stop"
                        value="2131"
                        template="HResultData"
                        message="$(string.Event.CoreDispatcherRunAsyncStop)"/>
                    <event
                        symbol="CoreDispatcherStopping"
                        keywords="CoreDispatcher"
                        level="win:Informational"
                        task="CoreDispatcherStoping"
                        opcode="win:Info"
                        value="2132"
                        message="$(string.Event.CoreDispatcherStopping)"/>
                    <event
                        symbol="CoreWindowOnTouchEventStart"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowOnTouchEvent"
                        opcode="win:Start"
                        value="2133"
                        message="$(string.Event.CoreWindowOnTouchEventStart)"/>
                    <event
                        symbol="CoreWindowOnTouchEventStop"
                        keywords="CoreWindow"
                        level="win:Informational"
                        task="CoreWindowOnTouchEvent"
                        opcode="win:Stop"
                        template="HResultData"
                        value="2134"
                        message="$(string.Event.CoreWindowOnTouchEventStop)"/>
                    <event 
                        symbol="NavigationClientRuntimeClassInitializeStart"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientRuntimeClassInitialize"
                        opcode="win:Start"
                        value="2200"
                        message="$(string.Event.NavigationClientRuntimeClassInitializeStart)" />
                    <event 
                        symbol="NavigationClientRuntimeClassInitializeStop"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientRuntimeClassInitialize"
                        opcode="win:Stop"
                        value="2201"
                        message="$(string.Event.NavigationClientRuntimeClassInitializeStop)" />
                    <event 
                        symbol="NavigationClientUninitializeStart"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientUninitialize"
                        opcode="win:Start"
                        value="2202"
                        message="$(string.Event.NavigationClientUninitializeStart)" />
                    <event 
                        symbol="NavigationClientUninitializeStop"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientUninitialize"
                        opcode="win:Stop"
                        value="2203"
                        message="$(string.Event.NavigationClientUninitializeStop)" />
                    <event 
                        symbol="NavigationClientWaitForConnectionCompleteStart"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientWaitForConnectionComplete"
                        opcode="win:Start"
                        value="2208"
                        message="$(string.Event.NavigationClientWaitForConnectionCompleteStart)" />
                    <event 
                        symbol="NavigationClientWaitForConnectionCompleteStop"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientWaitForConnectionComplete"
                        opcode="win:Stop"
                        value="2209"
                        message="$(string.Event.NavigationClientWaitForConnectionCompleteStop)" />
                    <event 
                        symbol="NavigationClientViewActivatedStart"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientViewActivated"
                        opcode="win:Start"
                        value="2210"
                        message="$(string.Event.NavigationClientViewActivatedStart)" />
                    <event 
                        symbol="NavigationClientViewActivatedStop"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientViewActivated"
                        opcode="win:Stop"
                        value="2211"
                        message="$(string.Event.NavigationClientViewActivatedStop)" />
                    <event 
                        symbol="NavigationClientWindowActivatedStart"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientWindowActivated"
                        opcode="win:Start"
                        value="2212"
                        message="$(string.Event.NavigationClientWindowActivatedStart)" />
                    <event 
                        symbol="NavigationClientWindowActivatedStop"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientWindowActivated"
                        opcode="win:Stop"
                        value="2213"
                        message="$(string.Event.NavigationClientWindowActivatedStop)" />
                    <event 
                        symbol="NavigationClientCreateNavigationTask"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientCreateNavigationTask"
                        opcode="win:Info"
                        value="2220"
                        message="$(string.Event.NavigationClientCreateNavigationTask)" />
                    <event 
                        symbol="NavigationClientCreateNavigationWindow"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientCreateNavigationWindow"
                        opcode="win:Info"
                        value="2221"
                        message="$(string.Event.NavigationClientCreateNavigationWindow)" />
                    <event 
                        symbol="NavigationClientNavigateToComplete"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientNavigateToComplete"
                        opcode="win:Info"
                        value="2226"
                        message="$(string.Event.NavigationClientNavigateToComplete)" />
                    <event 
                        symbol="NavigationClientNavigateAwayComplete"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientNavigateAwayComplete"
                        opcode="win:Info"
                        value="2227"
                        message="$(string.Event.NavigationClientNavigateAwayComplete)" />
                    <event 
                        symbol="NavigationClientSystemKeyHandled"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientSystemKeyHandled"
                        opcode="win:Info"
                        value="2228"
                        message="$(string.Event.NavigationClientSystemKeyHandled)" />
                    <event 
                        symbol="NavigationClientRequestClose"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientRequestClose"
                        opcode="win:Info"
                        value="2229"
                        message="$(string.Event.NavigationClientRequestClose)" />
                    <event 
                        symbol="NavigationClientConnectionComplete"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientConnectionComplete"
                        opcode="win:Info"
                        value="2250"
                        message="$(string.Event.NavigationClientConnectionComplete)" />
                    <event 
                        symbol="NavigationClientRegistrationComplete"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientRegistrationComplete"
                        opcode="win:Info"
                        value="2251"
                        message="$(string.Event.NavigationClientRegistrationComplete)" />
                    <event 
                        symbol="NavigationClientShow"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientShow"
                        opcode="win:Info"
                        value="2252"
                        template="ShowHideData"
                        message="$(string.Event.NavigationClientShow)" />
                    <event 
                        symbol="NavigationClientHide"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientHide"
                        opcode="win:Info"
                        value="2253"
                        template="ShowHideData"
                        message="$(string.Event.NavigationClientHide)" />
                    <event 
                        symbol="NavigationClientNavigateTo"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientNavigateTo"
                        opcode="win:Info"
                        value="2254"
                        template="NavigateToData"
                        message="$(string.Event.NavigationClientNavigateTo)" />
                    <event 
                        symbol="NavigationClientNavigateAway"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientNavigateAway"
                        opcode="win:Info"
                        value="2255"
                        template="NavigateAwayData"
                        message="$(string.Event.NavigationClientNavigateAway)" />
                    <event 
                        symbol="NavigationClientClose"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientClose"
                        opcode="win:Info"
                        value="2256"
                        message="$(string.Event.NavigationClientClose)" />
                    <event 
                        symbol="NavigationClientSystemKeyPressed"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientSystemKeyPressed"
                        opcode="win:Info"
                        value="2257"
                        template="NavigationSystemKeyData"
                        message="$(string.Event.NavigationClientSystemKeyPressed)" />
                    <event 
                        symbol="NavigationClientLaunchChildTaskComplete"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientLaunchChildTaskComplete"
                        opcode="win:Info"
                        value="2258"
                        template="HResultData"
                        message="$(string.Event.NavigationClientLaunchChildTaskComplete)" />
                    <event 
                        symbol="NavigationClientLaunchSessionComplete"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientLaunchSessionComplete"
                        opcode="win:Info"
                        value="2259"
                        template="HResultData"
                        message="$(string.Event.NavigationClientLaunchSessionComplete)" />
                    <event 
                        symbol="NavigationClientPropertyChanged"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientPropertyChanged"
                        opcode="win:Info"
                        value="2260"
                        template="Int32Data"
                        message="$(string.Event.NavigationClientPropertyChanged)" />
                    <event 
                        symbol="NavigationClientProcessActivationDataHandlerStart"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientProcessActivationDataHandler"
                        opcode="win:Start"
                        value="2262"
                        message="$(string.Event.NavigationClientProcessActivationDataHandlerStart)" />
                    <event 
                        symbol="NavigationClientProcessActivationDataHandlerStop"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientProcessActivationDataHandler"
                        opcode="win:Stop"
                        value="2263"
                        message="$(string.Event.NavigationClientProcessActivationDataHandlerStop)" />
                    <event 
                        symbol="NavigationClientProcessActivationData"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientProcessActivationData"
                        opcode="win:Info"
                        template="NavigationClientProcessActivationData"
                        value="2264"
                        message="$(string.Event.NavigationClientProcessActivationData)" />
                    <event 
                        symbol="NavigationClientNavigateToHandlerStart"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientNavigateToHandler"
                        opcode="win:Start"
                        value="2266"
                        message="$(string.Event.NavigationClientNavigateToHandlerStart)" />
                    <event 
                        symbol="NavigationClientNavigateToHandlerStop"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientNavigateToHandler"
                        opcode="win:Stop"
                        value="2267"
                        message="$(string.Event.NavigationClientNavigateToHandlerStop)" />
                    <event 
                        symbol="NavigationClientLaunchSession"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientLaunchSession"
                        opcode="win:Info"
                        template="LaunchData"
                        value="2270"
                        message="$(string.Event.NavigationClientLaunchSession)" />
                    <event 
                        symbol="NavigationClientLaunchChildTask"
                        keywords="NavigationClient"
                        level="win:Informational"
                        task="NavigationClientLaunchChildTask"
                        opcode="win:Info"
                        template="LaunchData"
                        value="2272"
                        message="$(string.Event.NavigationClientLaunchChildTask)" />
                    <!-- AppChromeListener -->
                    <event 
                        symbol="NavigationClientConnectToShellStart"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="NavigationClientConnectToShell"
                        opcode="win:Start"
                        value="2300"
                        message="$(string.Event.NavigationClientConnectToShellStart)" />
                    <event 
                        symbol="NavigationClientConnectToShellStop"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="NavigationClientConnectToShell"
                        opcode="win:Stop"
                        template="HResultData"
                        value="2301"
                        message="$(string.Event.NavigationClientConnectToShellStop)" />
                    <event 
                        symbol="NavigationClientDisconnectFromShellStart"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="NavigationClientDisconnectFromShell"
                        opcode="win:Start"
                        value="2302"
                        message="$(string.Event.NavigationClientDisconnectFromShellStart)" />
                    <event 
                        symbol="NavigationClientDisconnectFromShellStop"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="NavigationClientDisconnectFromShell"
                        opcode="win:Stop"
                        template="HResultData"
                        value="2303"
                        message="$(string.Event.NavigationClientDisconnectFromShellStop)" />
                    <event 
                        symbol="AppChromeListenerOnVisibleRegionChange"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="AppChromeListenerOnVisibleRegionChange"
                        opcode="win:Info"
                        template="RegionChangeData"
                        value="2304"
                        message="$(string.Event.AppChromeListenerOnVisibleRegionChange)" />
                    <event 
                        symbol="AppChromeListenerOnObscurityChange"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="AppChromeListenerOnObscurityChange"
                        opcode="win:Info"
                        template="BooleanData"
                        value="2306"
                        message="$(string.Event.AppChromeListenerOnObscurityChange)" />
                    <event 
                        symbol="AppChromeListenerOnLockScreenVisibilityChange"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="AppChromeListenerOnLockScreenVisibilityChange"
                        opcode="win:Info"
                        template="BooleanData"
                        value="2308"
                        message="$(string.Event.AppChromeListenerOnLockScreenVisibilityChange)" />
                    <event 
                        symbol="AppChromeListenerOnSipVisibilityChange"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="AppChromeListenerOnSipVisibilityChange"
                        opcode="win:Info"
                        template="BooleanData"
                        value="2310"
                        message="$(string.Event.AppChromeListenerOnSipVisibilityChange)" />
                    <event 
                        symbol="AppChromeListenerOnShowAnimationComplete"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="AppChromeListenerOnShowAnimationComplete"
                        opcode="win:Info"
                        value="2314"
                        message="$(string.Event.AppChromeListenerOnShowAnimationComplete)" />
                    <event 
                        symbol="AppChromeListenerOnUIAutomationConnection"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="AppChromeListenerOnUIAutomationConnection"
                        opcode="win:Info"
                        template="WideString"
                        value="2318"
                        message="$(string.Event.AppChromeListenerOnUIAutomationConnection)" />
                    <event 
                        symbol="AppChromeListenerOnSearchButtonPress"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="AppChromeListenerOnSearchButtonPress"
                        opcode="win:Info"
                        value="2320"
                        message="$(string.Event.AppChromeListenerOnSearchButtonPress)" />
                    <event 
                        symbol="NavigationClientRequestSplashScreen"
                        keywords="AppChromeListener"
                        level="win:Informational"
                        task="NavigationClientRequestSplashScreen"
                        opcode="win:Info"
                        template="SplashScreenData"
                        value="2322"
                        message="$(string.Event.NavigationClientRequestSplashScreen)" />
                </events>
                <maps>
                <!-- Has to agree with definition of CoreWindowActivationState in 
                     windows.ui.core.corewindow.idl -->
                <valueMap name="ActivationState">
                  <map value="0" message="$(string.ActivationState.CodeActivated)"/>
                  <map value="1" message="$(string.ActivationState.Deactivated)"/>
                  <map value="2" message="$(string.ActivationState.PointerActivated)"/>
                </valueMap>
                <valueMap name="CoreProcessEventsOption">
                  <map value="0" message="$(string.CoreProcessEventsOption.ProcessOneAndAllPending)"/>
                  <map value="1" message="$(string.CoreProcessEventsOption.ProcessOneIfPresent)"/>
                  <map value="2" message="$(string.CoreProcessEventsOption.ProcessUntilQuit)"/>
                  <map value="3" message="$(string.CoreProcessEventsOption.ProcessAllIfPresent)"/>
                </valueMap>
                <!-- Has to agree with definition of 
                     src\uxplat\coreui\published\inc\coreuigenerated.h -->
                <valueMap name="NavigationDirection">
                  <map value="0" message="$(string.NavigationDirection.Forward)"/>
                  <map value="1" message="$(string.NavigationDirection.Backward)"/>
                </valueMap>
                <valueMap name="ActivationReason">
                  <map value="0" message="$(string.ActivationReason.Invalid)"/>
                  <map value="1" message="$(string.ActivationReason.Launch)"/>
                  <map value="2" message="$(string.ActivationReason.Resume)"/>
                  <map value="3" message="$(string.ActivationReason.ReturnFromChildSuccess)"/>
                  <map value="4" message="$(string.ActivationReason.ReturnFromChildFailure)"/>
                  <map value="5" message="$(string.ActivationReason.Navigation)"/>
                </valueMap>
                <valueMap name="AnimationType">
                  <map value="0" message="$(string.AnimationType.Normal)"/>
                  <map value="1" message="$(string.AnimationType.None)"/>
                </valueMap>
                <valueMap name="NavigationSystemKey">
                  <map value="0" message="$(string.NavigationSystemKey.None)"/>
                  <map value="1" message="$(string.NavigationSystemKey.Back)"/>
                  <map value="2" message="$(string.NavigationSystemKey.Start)"/>
                  <map value="3" message="$(string.NavigationSystemKey.Search)"/>
                  <map value="4" message="$(string.NavigationSystemKey.FocusCamera)"/>
                  <map value="5" message="$(string.NavigationSystemKey.CaptureCamera)"/>
                </valueMap>
                <valueMap name="Obscurity">
                  <map value="0" message="$(string.Obscurity.Full)"/>
                  <map value="1" message="$(string.Obscurity.Partial)"/>
                  <map value="2" message="$(string.Obscurity.None)"/>
                </valueMap>
              </maps>
        <templates>
          <template 
            tid="PsmQuiesceInfo">
            <data
                inType="win:UInt32"
                name="QuiesceBool"/>
          </template>
          <template 
            tid="PsmBlockUnblockInfo">
            <data
                inType="win:UInt32"
                name="BlockUnblockBool"/>
            <data
                inType="win:UInt32"
                name="ThreadId"
                outType="win:HexInt32"/>
          </template>
          <template 
            tid="PsmThreadInfo">
            <data
                inType="win:UInt32"
                name="ThreadId"
                outType="win:HexInt32"/>
          </template>
          <template tid="TouchInfoData">
            <data name="wFlags" inType="win:UInt16" outType="win:HexInt16"/>
            <data name="dwTimeStamp" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="hSource" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="dwSessionID" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="cContacts" inType="win:UInt32" outType="xsd:unsignedInt"/>
          </template>
          <template tid="TouchContactData">
            <data name="wContactID" inType="win:UInt16" outType="xsd:unsignedShort"/>
            <data name="wFlags" inType="win:UInt16" outType="win:HexInt16"/>
            <data name="xScreen" inType="win:UInt16" outType="xsd:unsignedShort"/>
            <data name="yScreen" inType="win:UInt16" outType="xsd:unsignedShort"/>
            <data name="xWindow" inType="win:UInt16" outType="xsd:unsignedShort"/>
            <data name="yWindow" inType="win:UInt16" outType="xsd:unsignedShort"/>
          </template>
          <template tid="WideString">
            <data name="wsz" inType="win:UnicodeString" outType="xsd:string"/>
          </template>
          <template tid="PointerData">
            <data name="PointerId" inType="win:UInt32" outType="xsd:unsignedInt"/>
            <data name="X" inType="win:Float" outType="xsd:float"/>
            <data name="Y" inType="win:Float" outType="xsd:float"/>
            <data name="FrameId" inType="win:UInt32" outType="xsd:unsignedInt"/>
            <data name="Timestamp" inType="win:UInt64" outType="win:HexInt64"/>
          </template>
          <template tid="ActivateData">
            <data name="Activation" inType="win:UInt32" map="ActivationState"/>
          </template>
          <template tid="BooleanData">
            <data name="b" inType="win:Boolean" outType="xsd:boolean"/>
          </template>
          <template tid="NavigateToData">
            <data name="direction" inType="win:UInt32" map="NavigationDirection"/>
          </template>
          <template tid="NavigateAwayData">
            <data name="direction" inType="win:UInt32" map="NavigationDirection"/>
          </template>
          <template tid="ShowHideData">
            <data name="direction" inType="win:UInt32" map="NavigationDirection"/>
            <data name="animationType" inType="win:UInt32" map="AnimationType"/>
            <data name="animationFlags" inType="win:UInt32" outType="win:HexInt32"/>
          </template>
          <template tid="HResultData">
            <data name="hr" inType="win:Int32" outType="win:HResult"/>
          </template>
          <template tid="Int32Data">
            <data name="hr" inType="win:Int32" outType="xsd:int"/>
          </template>
          <template tid="NavigationSystemKeyData">
            <data name="systemKey" inType="win:UInt32" map="NavigationSystemKey"/>
          </template>
          <template tid="RegionChangeData">
            <data name="visibleLeft" inType="win:Int64" outType="xsd:long"/>
            <data name="visibleTop" inType="win:Int64" outType="xsd:long"/>
            <data name="visibleRight" inType="win:Int64" outType="xsd:long"/>
            <data name="visibleBottom" inType="win:Int64" outType="xsd:long"/>
            <data name="clientLeft" inType="win:Int64" outType="xsd:long"/>
            <data name="clientTop" inType="win:Int64" outType="xsd:long"/>
            <data name="clientRight" inType="win:Int64" outType="xsd:long"/>
            <data name="clientBottom" inType="win:Int64" outType="xsd:long"/>
          </template>
          <template tid="DwordData">
            <data name="value" inType="win:UInt64" outType="xsd:HexInt64"/>
          </template>
          <template tid="LaunchData">
            <data name="appUri" inType="win:UnicodeString" outType="xsd:string"/>
            <data name="dataSize" inType="win:UInt32" outType="xsd:unsignedInt"/>
          </template>
          <template tid="SplashScreenData">
            <data name="filePath" inType="win:UnicodeString" outType="xsd:string"/>
          </template>
          <template tid="CoreDispatcherProcessEventsData">
            <data name="option" inType="win:UInt32" map="CoreProcessEventsOption"/>
          </template>
          <template tid="NavigationClientProcessActivationData">
            <data name="reason" inType="win:UInt32" map="ActivationReason"/>
            <data name="uri" inType="win:UnicodeString" outType="xsd:string"/>
            <data name="dataSize" inType="win:UInt32" outType="xsd:unsignedInt" />
          </template>
        </templates>
      </provider>
    </events>
  </instrumentation>
  <localization>
    <resources culture="en-US">
      <stringTable>
          <string 
              id="Provider.Name" 
              value="Microsoft-WindowsPhone-AppModelCore"/>
          <string 
              id="Keyword.Error" 
              value="Error"/>
          <string 
              id="Keyword.Performance" 
              value="Performance"/>
          <string 
              id="Keyword.Debug" 
              value="Debug"/>
          <string 
              id="Keyword.CoreApplication" 
              value="CoreApplication"/>
          <string
              id="Keyword.CoreWindow"
              value="CoreWindow"/>
          <string
              id="Keyword.CoreDispatcher"
              value="CoreDispatcher"/>
          <string
              id="Keyword.NavigationClient" 
              value="NavigationClient"/>
          <string
              id="Keyword.AppChromeListener" 
              value="AppChromeListener"/>
          <string 
              id="Event.CoreApplicationActivationStart" 
              value="CoreApplication Activation Start"/>
          <string 
              id="Event.CoreApplicationActivationStop" 
              value="CoreApplication Activation Stop"/>
          <string 
              id="Event.CoreApplicationSuspensionStart" 
              value="CoreApplication Suspension Start"/>
          <string 
              id="Event.CoreApplicationSuspensionStop" 
              value="CoreApplication Suspension Stop"/>
          <string 
              id="Event.CoreApplicationExitStart" 
              value="CoreApplication Exit Start"/>
          <string 
              id="Event.CoreApplicationExitStop" 
              value="CoreApplication Exit Stop"/>
          <string 
              id="Event.CoreApplicationRegistrationStart" 
              value="CoreApplication Registration Start"/>
          <string 
              id="Event.CoreApplicationRegistrationStop" 
              value="CoreApplication Registration Stop"/>
          <string 
              id="Event.CoreApplicationInitializationStart" 
              value="CoreApplication Initialization Start"/>
          <string 
              id="Event.CoreApplicationInitializationStop" 
              value="CoreApplication Initialization Stop"/>
          <string 
              id="Event.CoreApplicationFrameworkViewLoadStart" 
              value="CoreApplication FrameworkView Load Start"/>
          <string 
              id="Event.CoreApplicationFrameworkViewLoadStop" 
              value="CoreApplication FrameworkView Load Stop"/>
          <string 
              id="Event.CoreApplicationFrameworkViewInitializationStart" 
              value="CoreApplication FrameworkView Initialization Start"/>
          <string 
              id="Event.CoreApplicationFrameworkViewInitializationStop" 
              value="CoreApplication FrameworkView Initialization Stop"/>
          <string 
              id="Event.CoreApplicationActivationHandlersStart" 
              value="CoreApplication ActivationHandlers Start"/>
          <string 
              id="Event.CoreApplicationActivationHandlersStop" 
              value="CoreApplication ActivationHandlers Stop"/>
          <string 
              id="Event.CoreApplicationSuspendHandlersStart" 
              value="CoreApplication SuspendHandlers Start"/>
          <string 
              id="Event.CoreApplicationSuspendHandlersStop" 
              value="CoreApplication SuspendHandlers Stop"/>
          <string 
              id="Event.CoreApplicationResumeHandlersStart" 
              value="CoreApplication ResumeHandlers Start"/>
          <string 
              id="Event.CoreApplicationResumeHandlersStop" 
              value="CoreApplication ResumeHandlers Stop"/>
          <string 
              id="Event.CoreApplicationCreateNewViewStart" 
              value="CoreApplication CreateNewView Start"/>
          <string 
              id="Event.CoreApplicationCreateNewViewStop" 
              value="CoreApplication CreateNewView Stop"/>
          <string 
              id="Event.CoreApplicationFrameworkViewSetWindowStart" 
              value="CoreApplication FrameworkView SetWindow Start"/>
          <string 
              id="Event.CoreApplicationFrameworkViewSetWindowStop" 
              value="CoreApplication FrameworkView SetWindow Stop"/>
          <string 
              id="Event.CoreApplicationFrameworkViewRunStart" 
              value="CoreApplication FrameworkView Run Start"/>
          <string 
              id="Event.CoreApplicationFrameworkViewRunStop" 
              value="CoreApplication FrameworkView Run Stop"/>
          <string 
              id="Event.CoreApplicationFrameworkViewUninitializationStart" 
              value="CoreApplication FrameworkView Uninitialization Start"/>
          <string 
              id="Event.CoreApplicationFrameworkViewUninitializationStop" 
              value="CoreApplication FrameworkView Uninitialization Stop"/>
          <string
              id="Event.CoreApplicationQuiescePsmBlockUnblockASTAMessage"
              value="CoreApplication Quiesce Calling PsmBlockUnblock %1 for ASTA %2"/>
          <string
              id="Event.CoreApplicationResumePsmBlockUnblockASTAMessage"
              value="CoreApplication Resume Calling PsmBlockUnblock %1 for ASTA %2"/>
          <string
              id="Event.CoreApplicationPsmDoStateChangeMessage"
              value="CoreApplication Quiesce Called PsmDoStateChange"/>
          <string
              id="Event.CoreApplicationQuiesceWaitForAppResumeMessage"
              value="CoreApplication Quiesce Called PsmWaitForAppResume"/>
          <string
              id="Event.CoreWindowTouchStart"
              value="CoreWindow Touch Start"/>
          <string
              id="Event.CoreWindowTouchStop"
              value="CoreWindow Touch Stop"/>
          <string
              id="Event.CoreWindowTouchInfoDump"
              value="CoreWindow TouchInfo %4 %1 %2 %3 %5"/>
          <string
              id="Event.CoreWindowTouchContactDump"
              value="CoreWindow TouchContact %1 %2 (%3,%4) (%5,%6)"/>
          <string
              id="Event.CoreWindowUnusedEvent"
              value="CoreWindow UnusedEvent %1"/>
          <string
              id="Event.CoreWindowPointerPressed"
              value="CoreWindow PointerPressed %1 (%2,%3) %4 %5"/>
          <string
              id="Event.CoreWindowPointerMoved"
              value="CoreWindow PointerMoved %1 (%2,%3) %4 %5"/>
          <string
              id="Event.CoreWindowPointerReleased"
              value="CoreWindow PointerReleased %1 (%2,%3) %4 %5"/>
          <string
              id="Event.CoreWindowPointerEntered"
              value="CoreWindow PointerEntered %1 (%2,%3) %4 %5"/>
          <string
              id="Event.CoreWindowPointerExited"
              value="CoreWindow PointerExited %1 (%2,%3) %4 %5"/>
          <string
              id="Event.CoreWindowActivateHandlerStart"
              value="CoreWindow Activate Start %1"/>
          <string
              id="Event.CoreWindowActivateHandlerStop"
              value="Corewindow Activate Stop"/>
          <string
              id="ActivationState.CodeActivated"
              value="CodeActivated"/>
          <string
              id="ActivationState.Deactivated"
              value="Deactivated"/>
          <string
              id="ActivationState.PointerActivated"
              value="PointerActivated"/>
          <string
              id="Event.CoreWindowVisibilityStart"
              value="CoreWindow Visibility Start %1"/>
          <string
              id="Event.CoreWindowVisibilityStop"
              value="Corewindow Visibility Stop"/>
          <string
              id="Event.CoreWindowCloseStart"
              value="CoreWindow Close Start"/>
          <string
              id="Event.CoreWindowCloseStop"
              value="Corewindow Close Stop"/>
          <string
              id="Event.CoreDispatcher"
              value="CoreDispatcher"/>
          <string 
              id="Event.CoreDispatcherProcessEventsStart"
              value="CoreDispatcher ProcessEvents Start option=%1" />
          <string 
              id="Event.CoreDispatcherProcessEventsStop" 
              value="CoreDispatcher ProcessEvents Stop hr=%1" />
          <string 
              id="Event.CoreDispatcherCallbackStart" 
              value="CoreDispatcher Callback Start" />
          <string 
              id="Event.CoreDispatcherCallbackStop" 
              value="CoreDispatcher Callback Stop hr=%1" />
          <string 
              id="Event.CoreDispatcherProcessMessageStart" 
              value="CoreDispatcher ProcessMessage Start" />
          <string 
              id="Event.CoreDispatcherProcessMessageStop" 
              value="CoreDispatcher ProcessMessage Stop, isRunning=%1" />
          <string 
              id="Event.CoreDispatcherRunAsyncStart" 
              value="CoreDispatcher RunAsync Start" />
          <string 
              id="Event.CoreDispatcherRunAsyncStop" 
              value="CoreDispatcher RunAsync Stop" />
          <string 
              id="Event.CoreDispatcherStopping" 
              value="CoreDispatcher Stopping" />
          <string 
              id="Event.CoreWindowOnTouchEventStart" 
              value="CoreWindow OnTouchEvent Start" />
          <string 
              id="Event.CoreWindowOnTouchEventStop" 
              value="CoreWindow OnTouchEvent Stop hr=%1" />
          <string
              id="Event.CoreWindowActivateStart"
              value="CoreWindow Activate Start"/>
          <string
              id="Event.CoreWindowActivateStop"
              value="Corewindow Activate Stop hr=%1"/>
          <string
              id="Event.CoreWindowConnectNavigationClientStart"
              value="Corewindow ConnectNavigationClient Start"/>
          <string
              id="Event.CoreWindowConnectNavigationClientStop"
              value="Corewindow ConnectNavigationClient Stop"/>
          <string 
              id="Event.NavigationClientRuntimeClassInitializeStart"
              value="NavigationClient RuntimeClassInitialize Start" />
          <string 
              id="Event.NavigationClientRuntimeClassInitializeStop"
              value="NavigationClient RuntimeClassInitialize Stop" />
          <string 
              id="Event.NavigationClientUninitializeStart"
              value="NavigationClient Uninitialize Start" />
          <string 
              id="Event.NavigationClientUninitializeStop"
              value="NavigationClient Uninitialize Stop" />
          <string 
              id="Event.NavigationClientWaitForConnectionCompleteStart"
              value="NavigationClient WaitForConnectionComplete Start" />  
          <string 
              id="Event.NavigationClientWaitForConnectionCompleteStop"
              value="NavigationClient WaitForConnectionComplete Stop" />
          <string 
              id="Event.NavigationClientViewActivatedStart"
              value="NavigationClient NavigationClientViewActivated Start" />
          <string 
              id="Event.NavigationClientViewActivatedStop"
              value="NavigationClient NavigationClientViewActivated Stop" />
          <string 
              id="Event.NavigationClientWindowActivatedStart"
              value="NavigationClient NavigationClientWindowActivated Start" />
          <string 
              id="Event.NavigationClientWindowActivatedStop"
              value="NavigationClient NavigationClientWindowActivated Stop" />
          <string 
              id="Event.NavigationClientCreateNavigationTask"
              value="NavigationClient CreateNavigationTask" />
          <string 
              id="Event.NavigationClientCreateNavigationWindow"
              value="NavigationClient CreateNavigationWindow" />
          <string 
              id="Event.NavigationClientNavigateToComplete"
              value="NavigationClient NavigateToComplete" />
          <string 
              id="Event.NavigationClientNavigateAwayComplete"
              value="NavigationClient NavigateAwayComplete" />
          <string 
              id="Event.NavigationClientSystemKeyHandled"
              value="NavigationClient SystemKeyHandled" />
          <string 
              id="Event.NavigationClientRequestClose"
              value="NavigationClient RequestClose" />
          <string 
              id="Event.NavigationClientConnectionComplete"
              value="NavigationClient ConnectionComplete" />
          <string 
              id="Event.NavigationClientRegistrationComplete"
              value="NavigationClient RegistrationComplete" />
          <string 
              id="Event.NavigationClientShow"
              value="NavigationClient Show direction=%1 animationType=%2 animationFlags=%3" />
          <string 
              id="Event.NavigationClientHide"
              value="NavigationClient Hide direction=%1 animationType=%2 animationFlags=%3" />
          <string 
              id="Event.NavigationClientNavigateTo"
              value="NavigationClient NavigateTo direction=%1" />
          <string 
              id="Event.NavigationClientNavigateAway"
              value="NavigationClient NavigateAway direction=%1" />
          <string 
              id="Event.NavigationClientClose"
              value="NavigationClient Close" />
          <string 
              id="Event.NavigationClientSystemKeyPressed"
              value="NavigationClient SystemKeyPressed systemKey=%1" />
          <string 
              id="Event.NavigationClientLaunchChildTaskComplete"
              value="NavigationClient LaunchChildTaskComplete hr=%1" />
          <string 
              id="Event.NavigationClientLaunchSessionComplete"
              value="NavigationClient LaunchSessionComplete hr=%1" />
          <string 
              id="Event.NavigationClientPropertyChanged"
              value="NavigationClient PropertyChanged propertyID=%1" />
          <string 
              id="Event.NavigationClientProcessActivationDataHandlerStart"
              value="NavigationClient ActivationHandler Start" />
          <string 
              id="Event.NavigationClientProcessActivationDataHandlerStop"
              value="NavigationClient ActivationHandler Stop" />
          <string
              id="Event.NavigationClientProcessActivationData"
              value="NavigationClient ProcessActivationData reason=%1 uri=%2 dataSize=%3" />
          <string 
              id="Event.NavigationClientNavigateToHandlerStart"
              value="NavigationClient ActivationHandler Start" />
          <string 
              id="Event.NavigationClientNavigateToHandlerStop"
              value="NavigationClient ActivationHandler Stop" />
          <string 
              id="Event.NavigationClientLaunchSession"
              value="NavigationClient LaunchSession appUri=%1 dataSize=%2" />
          <string 
              id="Event.NavigationClientLaunchChildTask"
              value="NavigationClient LaunchChildTask appUri=%1 dataSize=%2" />
          <string
              id="NavigationClientState.Uninitialized"
              value="Uninitialized" />
          <string
              id="NavigationClientState.Initializing"
              value="Initializing" />
          <string
              id="NavigationClientState.Running"
              value="Running" />
          <string
              id="NavigationClientState.WaitingForViewActivation"
              value="WaitingForViewActivation" />
          <string
              id="NavigationClientState.Current"
              value="Current" />
          <string
              id="NavigationClientState.WaitingForWindowActivation"
              value="WiatingForWindowActivation" />
          <string
              id="NavigationClientState.Visible"
              value="Visible" />
          <string
              id="NavigationClientState.Closed"
              value="Closed" />
          <string 
              id="NavigationDirection.Forward"
              value="Forward" />
          <string 
              id="NavigationDirection.Backward"
              value="Backward" />
          <string 
              id="ActivationReason.Invalid"
              value="Invalid" />
          <string 
              id="ActivationReason.Launch"
              value="Launch" />
          <string 
              id="ActivationReason.Resume"
              value="Resume" />
          <string 
              id="ActivationReason.ReturnFromChildSuccess"
              value="ReturnFromChildSuccess" />
          <string 
              id="ActivationReason.ReturnFromChildFailure"
              value="ReturnFromChildFailure" />
          <string 
              id="ActivationReason.Navigation"
              value="Navigation" />
          <string 
              id="AnimationType.Normal"
              value="Normal" />
          <string 
              id="AnimationType.None"
              value="None" />
          <string
              id="NavigationSystemKey.None"
              value="None"/>
          <string
              id="NavigationSystemKey.Back"
              value="Back"/>
          <string
              id="NavigationSystemKey.Start"
              value="Start"/>
          <string
              id="NavigationSystemKey.Search"
              value="Search"/>
          <string
              id="NavigationSystemKey.FocusCamera"
              value="FocusCamera"/>
          <string
              id="NavigationSystemKey.CaptureCamera"
              value="CaptureCamera"/>
          <string 
              id="Event.NavigationClientConnectToShellStart"
              value="NavigationClient ConnectToShell Start"/>
          <string 
              id="Event.NavigationClientConnectToShellStop"
              value="NavigationClient ConnectToShell Stop"/>
          <string 
              id="Event.NavigationClientDisconnectFromShellStart"
              value="NavigationClient DisconnectFromShell Start"/>
          <string 
              id="Event.NavigationClientDisconnectFromShellStop"
              value="NavigationClient DisconnectFromShell Stop hr=%1"/>
          <string 
              id="Event.AppChromeListenerOnVisibleRegionChange"
              value="AppChromeListener OnVisibleRegionChange (top, left, right, bottom): visibleRect(%1, %2, %3, %4) clientRect(%5, %6, %7, %8)"/>
          <string 
              id="Event.AppChromeListenerOnObscurityChange"
              value="AppChromeListener OnObscurityChange: %1"/>
          <string 
              id="Event.AppChromeListenerOnSipVisibilityChange"
              value="AppChromeListener OnSipVisibilityChange: %1"/>
          <string 
              id="Event.AppChromeListenerOnLockScreenVisibilityChange"
              value="AppChromeListener OnLockScreenVisibilityChange: %1"/>
          <string 
              id="Event.AppChromeListenerOnShowAnimationComplete"
              value="AppChromeListener OnShowAnimationComplete"/>
          <string 
              id="Event.AppChromeListenerOnUIAutomationConnection"
              value="AppChromeListener OnUIAutomationConnection"/>
          <string 
              id="Event.AppChromeListenerOnSearchButtonPress"
              value="AppChromeListener OnSearchButtonPress"/>
          <string 
              id="Event.NavigationClientRequestSplashScreen"
              value="NavigationClient RequestSplashScreen: %1"/>
          <string
              id="Obscurity.Full"
              value="Full"/>
          <string
              id="Obscurity.Partial"
              value="Partial"/>
          <string
              id="Obscurity.None"
              value="None"/>
          <string
              id="CoreProcessEventsOption.ProcessOneAndAllPending"
              value="ProcessOneAndAllPending"/>
          <string
              id="CoreProcessEventsOption.ProcessOneIfPresent"
              value="ProcessOneIfPresent"/>
          <string
              id="CoreProcessEventsOption.ProcessUntilQuit"
              value="ProcessUntilQuit"/>
          <string
              id="CoreProcessEventsOption.ProcessAllIfPresent"
              value="ProcessAllIfPresent"/>
      </stringTable>
    </resources>
  </localization>
</assembly>
