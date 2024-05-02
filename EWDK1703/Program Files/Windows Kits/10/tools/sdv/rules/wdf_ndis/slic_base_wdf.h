/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/


/*
  IRQL

  The SDV Rules specifies IRQL requirements for various DDIs.

  The IRQLs are positive ordered numbers starting from 0.  The actual
  numbers are processer specific, on X86 ranging from 0 to 31 and on
  AMD64 and IA64 ranging from 0 to 15.  For all three platforms
  PASSIVE_LEVEL, APC_LEVEL and DISPATCH_LEVEL are respectively 0, 1
  and 2.

  SDV rules only distinguish between the concrete values
  PASSIVE_LEVEL, APC_LEVEL, DISPATCH_LEVEL and the predicate
  SDV_IRQL_ELEVATED_LEVEL for 'everything else' (3-31 on X86, 3-15 on
  AMD64 or IA64).  The SDV rules are unable to distinguish between
  DIRQL, CMC_LEVEL, HIGH_LEVEL, etc.  The OS header files provide the
  equivalent macro definitions except for the SDV_IRQL_ELEVATED_LEVEL
  predicate.

  The SDV OS Model declares the SDV_DIRQL macro for elevating to an
  arbitrary Device IRQL.  The definition of SDV_DIRQL and the
  definition of SDV_IRQL_ELEVATED_LEVEL implies that
  SDV_IRQL_ELEVATED_LEVEL(SDV_DIRQL)==TRUE.

  See the article "Scheduling, Thread Context, and IRQL" for more
  details.
*/

#define WdfDriverInitNonPnpDriver 1
#define WdfDriverInitNoDispatchOverride 2
#define WdfVerifyOn 4
#define WdfVerifierOn 8


#define WdfSynchronizationScopeInvalid 0
#define WdfSynchronizationScopeInheritFromParent 1
#define WdfSynchronizationScopeDevice 2
#define WdfSynchronizationScopeQueue 3
#define WdfSynchronizationScopeNone 4

#define WdfExecutionLevelInvalid 0
#define WdfExecutionLevelInheritFromParent 1
#define WdfExecutionLevelPassive 2
#define WdfExecutionLevelDispatch 3



#define WdfIoQueueDispatchInvalid 0
#define WdfIoQueueDispatchSequential 1 
#define WdfIoQueueDispatchParallel 2
#define WdfIoQueueDispatchManual 3
#define WdfIoQueueDispatchMax 4

#define PLUGPLAY_REGKEY_DEVICE  1
#define PLUGPLAY_REGKEY_DRIVER  2


#define  WdfIoTargetSentIoUndefined 0
#define  WdfIoTargetCancelSentIo 1
#define  WdfIoTargetWaitForSentIoToComplete 2
#define  WdfIoTargetLeaveSentIoPending 3 


#define SystemManagedIdleTimeout         1
#define SystemManagedIdleTimeoutWithHint 2

/*#define	WdfDevStatePowerInvalid 	161
#define WdfDevStatePowerObjectCreated 	162
#define WdfDevStatePowerCheckDeviceType 	163
#define WdfDevStatePowerCheckDeviceTypeNP 	164
#define WdfDevStatePowerCheckParentState 	165
#define WdfDevStatePowerCheckParentStateNP 	166
#define WdfDevStatePowerEnablingWakeAtBus 	167
#define WdfDevStatePowerEnablingWakeAtBusNP 	168
#define WdfDevStatePowerD0 	169
#define WdfDevStatePowerD0NP 	2576
#define WdfDevStatePowerD0BusWakeOwner 	2577
#define WdfDevStatePowerD0BusWakeOwnerNP 	2578
#define WdfDevStatePowerD0ArmedForWake 	2579
#define WdfDevStatePowerD0ArmedForWakeNP 	2580
#define WdfDevStatePowerD0DisarmingWakeAtBus 	2581
#define WdfDevStatePowerD0DisarmingWakeAtBusNP 	2582
#define WdfDevStatePowerD0Starting 	2583
#define WdfDevStatePowerD0StartingConnectInterrupt 	2584
#define WdfDevStatePowerD0StartingDmaEnable 	2585
#define WdfDevStatePowerD0StartingStartSelfManagedIo 	2592
#define WdfDevStatePowerDecideD0State 	2593
#define WdfDevStatePowerGotoD3Stopped 	2594
#define WdfDevStatePowerStopped 	2595
#define WdfDevStatePowerStartingCheckDeviceType 	2596
#define WdfDevStatePowerStartingChild 	2597
#define WdfDevStatePowerDxDisablingWakeAtBus 	2598
#define WdfDevStatePowerDxDisablingWakeAtBusNP 	2599
#define WdfDevStatePowerGotoDx 	2600
#define WdfDevStatePowerGotoDxNP 	2601
#define WdfDevStatePowerGotoDxIoStopped 	2608
#define WdfDevStatePowerGotoDxIoStoppedNP 	2609
#define WdfDevStatePowerGotoDxNPFailed 	2610
#define WdfDevStatePowerDx 	2611
#define WdfDevStatePowerDxNP 	2612
#define WdfDevStatePowerGotoDxArmedForWake 	2613
#define WdfDevStatePowerGotoDxArmedForWakeNP 	2614
#define WdfDevStatePowerGotoDxIoStoppedArmedForWake 	2615
#define WdfDevStatePowerGotoDxIoStoppedArmedForWakeNP 	2616
#define WdfDevStatePowerDxArmedForWake 	2617
#define WdfDevStatePowerDxArmedForWakeNP 	2624
#define WdfDevStatePowerCheckParentStateArmedForWake 	2625
#define WdfDevStatePowerCheckParentStateArmedForWakeNP 	2626
#define WdfDevStatePowerWaitForParentArmedForWake 	2627
#define WdfDevStatePowerWaitForParentArmedForWakeNP 	2628
#define WdfDevStatePowerStartSelfManagedIo 	2629
#define WdfDevStatePowerStartSelfManagedIoNP 	2630
#define WdfDevStatePowerStartSelfManagedIoFailed 	2631
#define WdfDevStatePowerStartSelfManagedIoFailedNP 	2632
#define WdfDevStatePowerWaitForParent 	2633
#define WdfDevStatePowerWaitForParentNP 	2640
#define WdfDevStatePowerWakePending 	2641
#define WdfDevStatePowerWakePendingNP 	2642
#define WdfDevStatePowerWaking 	2643
#define WdfDevStatePowerWakingNP 	2644
#define WdfDevStatePowerWakingConnectInterrupt 	2645
#define WdfDevStatePowerWakingConnectInterruptNP 	2646
#define WdfDevStatePowerWakingConnectInterruptFailed 	2647
#define WdfDevStatePowerWakingConnectInterruptFailedNP 	2648
#define WdfDevStatePowerWakingDmaEnable 	2649
#define WdfDevStatePowerWakingDmaEnableNP 	2656
#define WdfDevStatePowerWakingDmaEnableFailed 	2657
#define WdfDevStatePowerWakingDmaEnableFailedNP 	2658
#define WdfDevStatePowerReportPowerUpFailedDerefParent 	2659
#define WdfDevStatePowerReportPowerUpFailed 	2660
#define WdfDevStatePowerPowerFailedPowerDown 	2661
#define WdfDevStatePowerReportPowerDownFailed 	2662
#define WdfDevStatePowerInitialConnectInterruptFailed 	2663
#define WdfDevStatePowerInitialDmaEnableFailed 	2664
#define WdfDevStatePowerInitialSelfManagedIoFailed 	2665
#define WdfDevStatePowerInitialPowerUpFailedDerefParent 	2672
#define WdfDevStatePowerInitialPowerUpFailed 	2673
#define WdfDevStatePowerDxStoppedDisarmWake 	2674
#define WdfDevStatePowerDxStoppedDisarmWakeNP 	2675
#define WdfDevStatePowerGotoDxStoppedDisableInterruptNP 	2676
#define WdfDevStatePowerGotoDxStopped 	2677
#define WdfDevStatePowerDxStopped 	2678
#define WdfDevStatePowerGotoStopped 	2679
#define WdfDevStatePowerStoppedCompleteDx 	2680
#define WdfDevStatePowerDxStoppedDecideDxState 	2681
#define WdfDevStatePowerDxStoppedArmForWake 	2688
#define WdfDevStatePowerDxStoppedArmForWakeNP 	2689
#define WdfDevStatePowerFinalPowerDownFailed 	2690
#define WdfDevStatePowerFinal 	2691
#define WdfDevStatePowerNull 	2692*/

#define SDV_WDFDDIs_Excluding_WdfDriverCreate \
    WdfChildListAddOrUpdateChildDescriptionAsPresent, \
    WdfChildListBeginIteration, \
    WdfChildListBeginScan, \
    WdfChildListCreate, \
    WdfChildListEndIteration, \
    WdfChildListEndScan, \
    WdfChildListGetDevice, \
    WdfChildListRequestChildEject, \
    WdfChildListRetrieveAddressDescription, \
    WdfChildListRetrieveNextDevice, \
    WdfChildListRetrievePdo, \
    WdfChildListUpdateAllChildDescriptionsAsPresent, \
    WdfChildListUpdateChildDescriptionAsMissing, \
    WdfCmResourceListAppendDescriptor, \
    WdfCmResourceListGetCount, \
    WdfCmResourceListGetDescriptor, \
    WdfCmResourceListInsertDescriptor, \
    WdfCmResourceListRemove, \
    WdfCmResourceListRemoveByDescriptor, \
    WdfCollectionAdd, \
    WdfCollectionCreate, \
    WdfCollectionGetCount, \
    WdfCollectionGetFirstItem, \
    WdfCollectionGetItem, \
    WdfCollectionGetLastItem, \
    WdfCollectionRemove, \
    WdfCollectionRemoveItem, \
    WdfCommonBufferCreate, \
    WdfCommonBufferCreateWithConfig, \
    WdfCommonBufferGetAlignedLogicalAddress, \
    WdfCommonBufferGetAlignedVirtualAddress, \
    WdfCommonBufferGetLength, \
    WdfControlDeviceInitAllocate, \
    WdfControlDeviceInitSetShutdownNotification, \
    WdfControlFinishInitializing, \
    WdfDeviceAddDependentUsageDeviceObject, \
    WdfDeviceAddQueryInterface, \
    WdfDeviceAddRemovalRelationsPhysicalDevice, \
    WdfDeviceAllocAndQueryProperty, \
    WdfDeviceAssignMofResourceName, \
    WdfDeviceAssignS0IdleSettings, \
    WdfDeviceAssignSxWakeSettings, \
    WdfDeviceClearRemovalRelationsDevices, \
    WdfDeviceConfigureRequestDispatching, \
    WdfDeviceCreate, \
    WdfDeviceCreateDeviceInterface, \
    WdfDeviceCreateSymbolicLink, \
    WdfDeviceEnqueueRequest, \
    WdfDeviceGetAlignmentRequirement, \
    WdfDeviceGetCharacteristics, \
    WdfDeviceGetDefaultQueue, \
    WdfDeviceGetDevicePnpState, \
    WdfDeviceGetDevicePowerPolicyState, \
    WdfDeviceGetDevicePowerState, \
    WdfDeviceGetDeviceState, \
    WdfDeviceGetDriver, \
    WdfDeviceGetFileObject, \
    WdfDeviceGetIoTarget, \
    WdfDeviceGetSystemPowerAction, \
    WdfDeviceIndicateWakeStatus, \
    WdfDeviceInitAssignName, \
    WdfDeviceInitAssignSDDLString, \
    WdfDeviceInitAssignWdmIrpPreprocessCallback, \
    WdfDeviceInitFree, \
    WdfDeviceInitRegisterPnpStateChangeCallback, \
    WdfDeviceInitRegisterPowerPolicyStateChangeCallback, \
    WdfDeviceInitRegisterPowerStateChangeCallback, \
    WdfDeviceInitSetCharacteristics, \
    WdfDeviceInitSetDeviceClass, \
    WdfDeviceInitSetDeviceType, \
    WdfDeviceInitSetExclusive, \
    WdfDeviceInitSetFileObjectConfig, \
    WdfDeviceInitSetIoInCallerContextCallback, \
    WdfDeviceInitSetIoType, \
    WdfDeviceInitSetPnpPowerEventCallbacks, \
    WdfDeviceInitSetPowerInrush, \
    WdfDeviceInitSetPowerNotPageable, \
    WdfDeviceInitSetPowerPageable, \
    WdfDeviceInitSetPowerPolicyEventCallbacks, \
    WdfDeviceInitSetPowerPolicyOwnership, \
    WdfDeviceInitSetRequestAttributes, \
    WdfDeviceOpenRegistryKey, \
    WdfDeviceQueryProperty, \
    WdfDeviceRemoveDependentUsageDeviceObject, \
    WdfDeviceRemoveRemovalRelationsPhysicalDevice, \
    WdfDeviceResumeIdle, \
    WdfDeviceRetrieveDeviceInterfaceString, \
    WdfDeviceRetrieveDeviceName, \
    WdfDeviceSetAlignmentRequirement, \
    WdfDeviceSetBusInformationForChildren, \
    WdfDeviceSetCharacteristics, \
    WdfDeviceSetDeviceInterfaceState, \
    WdfDeviceSetDeviceState, \
    WdfDeviceSetFailed, \
    WdfDeviceSetPnpCapabilities, \
    WdfDeviceSetPowerCapabilities, \
    WdfDeviceSetSpecialFileSupport, \
    WdfDeviceSetStaticStopRemove, \
    WdfDeviceStopIdle, \
    WdfDeviceWdmDispatchIrpToIoQueue, \
    WdfDeviceWdmDispatchPreprocessedIrp, \
    WdfDeviceWdmGetAttachedDevice, \
    WdfDeviceWdmGetDeviceObject, \
    WdfDeviceWdmGetPhysicalDevice, \
    WdfDmaEnablerCreate, \
    WdfDmaEnablerGetFragmentLength, \
    WdfDmaEnablerGetMaximumLength, \
    WdfDmaEnablerGetMaximumScatterGatherElements, \
    WdfDmaEnablerSetMaximumScatterGatherElements, \
    WdfDmaEnablerWdmGetDmaAdapter, \
    WdfDmaTransactionCreate, \
    WdfDmaTransactionDmaCompleted, \
    WdfDmaTransactionDmaCompletedFinal, \
    WdfDmaTransactionDmaCompletedWithLength, \
    WdfDmaTransactionExecute, \
    WdfDmaTransactionGetBytesTransferred, \
    WdfDmaTransactionGetCurrentDmaTransferLength, \
    WdfDmaTransactionGetDevice, \
    WdfDmaTransactionGetRequest, \
    WdfDmaTransactionInitialize, \
    WdfDmaTransactionInitializeUsingRequest, \
    WdfDmaTransactionRelease, \
    WdfDpcCancel, \
    WdfDpcCreate, \
    WdfDpcEnqueue, \
    WdfDpcGetParentObject, \
    WdfDpcWdmGetDpc, \
    WdfDriverGetRegistryPath, \
    WdfDriverIsVersionAvailable, \
    WdfDriverOpenParametersRegistryKey, \
    WdfDriverRetrieveVersionString, \
    WdfFdoAddStaticChild, \
    WdfFdoGetDefaultChildList, \
    WdfFdoInitAllocAndQueryProperty, \
    WdfFdoInitOpenRegistryKey, \
    WdfFdoInitQueryProperty, \
    WdfFdoInitSetDefaultChildListConfig, \
    WdfFdoInitSetEventCallbacks, \
    WdfFdoInitSetFilter, \
    WdfFdoInitWdmGetPhysicalDevice, \
    WdfFdoLockStaticChildListForIteration, \
    WdfFdoQueryForInterface, \
    WdfFdoRetrieveNextStaticChild, \
    WdfFdoUnlockStaticChildListFromIteration, \
    WdfFileObjectGetDevice, \
    WdfFileObjectGetFileName, \
    WdfFileObjectGetFlags, \
    WdfFileObjectWdmGetFileObject, \
    WdfInterruptAcquireLock, \
    WdfInterruptCreate, \
    WdfInterruptDisable, \
    WdfInterruptEnable, \
    WdfInterruptReleaseLock, \
    WdfInterruptSynchronize, \
    WdfInterruptWdmGetInterrupt, \
    WdfIoQueueCreate, \
    WdfIoQueueDrain, \
    WdfIoQueueDrainSynchronously, \
    WdfIoQueueFindRequest, \
    WdfIoQueueGetDevice, \
    WdfIoQueueGetState, \
    WdfIoQueuePurge, \
    WdfIoQueuePurgeSynchronously, \
    WdfIoQueueReadyNotify, \
    WdfIoQueueRetrieveFoundRequest, \
    WdfIoQueueRetrieveNextRequest, \
    WdfIoQueueRetrieveRequestByFileObject, \
    WdfIoQueueStart, \
    WdfIoQueueStop, \
    WdfIoQueueStopAndPurge, \
    WdfIoQueueStopAndPurgeSynchronously, \
    WdfIoQueueStopSynchronously, \
    WdfIoResourceListAppendDescriptor, \
    WdfIoResourceListCreate, \
    WdfIoResourceListGetCount, \
    WdfIoResourceListGetDescriptor, \
    WdfIoResourceListInsertDescriptor, \
    WdfIoResourceListRemove, \
    WdfIoResourceListRemoveByDescriptor, \
    WdfIoResourceListUpdateDescriptor, \
    WdfIoResourceRequirementsListAppendIoResList, \
    WdfIoResourceRequirementsListGetCount, \
    WdfIoResourceRequirementsListGetIoResList, \
    WdfIoResourceRequirementsListInsertIoResList, \
    WdfIoResourceRequirementsListRemove, \
    WdfIoResourceRequirementsListRemoveByIoResList, \
    WdfIoResourceRequirementsListSetInterfaceType, \
    WdfIoResourceRequirementsListSetSlotNumber, \
    WdfIoTargetAllocAndQueryTargetProperty, \
    WdfIoTargetClose, \
    WdfIoTargetCloseForQueryRemove, \
    WdfIoTargetCreate, \
    WdfIoTargetFormatRequestForInternalIoctl, \
    WdfIoTargetFormatRequestForInternalIoctlOthers, \
    WdfIoTargetFormatRequestForIoctl, \
    WdfIoTargetFormatRequestForRead, \
    WdfIoTargetFormatRequestForWrite, \
    WdfIoTargetGetDevice, \
    WdfIoTargetGetState, \
    WdfIoTargetOpen, \
    WdfIoTargetQueryForInterface, \
    WdfIoTargetQueryTargetProperty, \
    WdfIoTargetSendInternalIoctlOthersSynchronously, \
    WdfIoTargetSendInternalIoctlSynchronously, \
    WdfIoTargetSendIoctlSynchronously, \
    WdfIoTargetSendReadSynchronously, \
    WdfIoTargetSendWriteSynchronously, \
    WdfIoTargetStart, \
    WdfIoTargetStop, \
    WdfIoTargetWdmGetTargetDeviceObject, \
    WdfIoTargetWdmGetTargetFileHandle, \
    WdfIoTargetWdmGetTargetFileObject, \
    WdfIoTargetWdmGetTargetPhysicalDevice, \
    WdfLookasideListCreate, \
    WdfMemoryAssignBuffer, \
    WdfMemoryCopyFromBuffer, \
    WdfMemoryCopyToBuffer, \
    WdfMemoryCreate, \
    WdfMemoryCreatePreallocated, \
    WdfMemoryGetBuffer, \
    WdfObjectAcquireLock, \
    WdfObjectCreate, \
    WdfObjectDelete, \
    WdfObjectDereference, \
    WdfObjectReference, \
    WdfObjectReleaseLock, \
    WdfPdoAddEjectionRelationsPhysicalDevice, \
    WdfPdoClearEjectionRelationsDevices, \
    WdfPdoGetParent, \
    WdfPdoInitAddCompatibleID, \
    WdfPdoInitAddDeviceText, \
    WdfPdoInitAddHardwareID, \
    WdfPdoInitAllocate, \
    WdfPdoInitAssignDeviceID, \
    WdfPdoInitAssignInstanceID, \
    WdfPdoInitAssignRawDevice, \
    WdfPdoInitSetDefaultLocale, \
    WdfPdoInitSetEventCallbacks, \
    WdfPdoMarkMissing, \
    WdfPdoRemoveEjectionRelationsPhysicalDevice, \
    WdfPdoRequestEject, \
    WdfPdoRetrieveAddressDescription, \
    WdfPdoRetrieveIdentificationDescription, \
    WdfPdoUpdateAddressDescription, \
    WdfRegistryAssignMemory, \
    WdfRegistryAssignMultiString, \
    WdfRegistryAssignString, \
    WdfRegistryAssignULong, \
    WdfRegistryAssignUnicodeString, \
    WdfRegistryAssignValue, \
    WdfRegistryClose, \
    WdfRegistryCreateKey, \
    WdfRegistryOpenKey, \
    WdfRegistryQueryMemory, \
    WdfRegistryQueryMultiString, \
    WdfRegistryQueryString, \
    WdfRegistryQueryULong, \
    WdfRegistryQueryUnicodeString, \
    WdfRegistryQueryValue, \
    WdfRegistryRemoveKey, \
    WdfRegistryRemoveValue, \
    WdfRegistryWdmGetHandle, \
    WdfRequestAllocateTimer, \
    WdfRequestCancelSentRequest, \
    WdfRequestChangeTarget, \
    WdfRequestComplete, \
    WdfRequestCompleteWithInformation, \
    WdfRequestCompleteWithPriorityBoost, \
    WdfRequestCreate, \
    WdfRequestCreateFromIrp, \
    WdfRequestFormatRequestUsingCurrentType, \
    WdfRequestForwardToIoQueue, \
    WdfRequestGetCompletionParams, \
    WdfRequestGetFileObject, \
    WdfRequestGetInformation, \
    WdfRequestGetIoQueue, \
    WdfRequestGetParameters, \
    WdfRequestGetRequestorMode, \
    WdfRequestGetStatus, \
    WdfRequestIsCanceled, \
    WdfRequestIsFrom32BitProcess, \
    WdfRequestMarkCancelable, \
    WdfRequestProbeAndLockUserBufferForRead, \
    WdfRequestProbeAndLockUserBufferForWrite, \
    WdfRequestRequeue, \
    WdfRequestRetrieveInputBuffer, \
    WdfRequestRetrieveInputMemory, \
    WdfRequestRetrieveInputWdmMdl, \
    WdfRequestRetrieveOutputBuffer, \
    WdfRequestRetrieveOutputMemory, \
    WdfRequestRetrieveOutputWdmMdl, \
    WdfRequestRetrieveUnsafeUserInputBuffer, \
    WdfRequestRetrieveUnsafeUserOutputBuffer, \
    WdfRequestReuse, \
    WdfRequestSend, \
    WdfRequestSetCompletionRoutine, \
    WdfRequestSetInformation, \
    WdfRequestStopAcknowledge, \
    WdfRequestUnmarkCancelable, \
    WdfRequestWdmFormatUsingStackLocation, \
    WdfRequestWdmGetIrp, \
    WdfSpinLockAcquire, \
    WdfSpinLockCreate, \
    WdfSpinLockRelease, \
    WdfStringCreate, \
    WdfStringGetUnicodeString, \
    WdfTimerCreate, \
    WdfTimerStart, \
    WdfTimerStop, \
    WdfUsbInterfaceGetConfiguredPipe, \
    WdfUsbInterfaceGetConfiguredSettingIndex, \
    WdfUsbInterfaceGetDescriptor, \
    WdfUsbInterfaceGetEndpointInformation, \
    WdfUsbInterfaceGetInterfaceNumber, \
    WdfUsbInterfaceGetNumConfiguredPipes, \
    WdfUsbInterfaceGetNumEndpoints, \
    WdfUsbInterfaceGetNumSettings, \
    WdfUsbInterfaceSelectSetting, \
    WdfUsbTargetDeviceAllocAndQueryString, \
    WdfUsbTargetDeviceCreate, \
    WdfUsbTargetDeviceCyclePortSynchronously, \
    WdfUsbTargetDeviceFormatRequestForControlTransfer, \
    WdfUsbTargetDeviceFormatRequestForCyclePort, \
    WdfUsbTargetDeviceFormatRequestForString, \
    WdfUsbTargetDeviceFormatRequestForUrb, \
    WdfUsbTargetDeviceGetDeviceDescriptor, \
    WdfUsbTargetDeviceGetInterface, \
    WdfUsbTargetDeviceGetNumInterfaces, \
    WdfUsbTargetDeviceIsConnectedSynchronous, \
    WdfUsbTargetDeviceQueryString, \
    WdfUsbTargetDeviceResetPortSynchronously, \
    WdfUsbTargetDeviceRetrieveConfigDescriptor, \
    WdfUsbTargetDeviceRetrieveCurrentFrameNumber, \
    WdfUsbTargetDeviceRetrieveInformation, \
    WdfUsbTargetDeviceSelectConfig, \
    WdfUsbTargetDeviceSendControlTransferSynchronously, \
    WdfUsbTargetDeviceSendUrbSynchronously, \
    WdfUsbTargetDeviceWdmGetConfigurationHandle, \
    WdfUsbTargetPipeAbortSynchronously, \
    WdfUsbTargetPipeConfigContinuousReader, \
    WdfUsbTargetPipeFormatRequestForAbort, \
    WdfUsbTargetPipeFormatRequestForRead, \
    WdfUsbTargetPipeFormatRequestForReset, \
    WdfUsbTargetPipeFormatRequestForUrb, \
    WdfUsbTargetPipeFormatRequestForWrite, \
    WdfUsbTargetPipeGetInformation, \
    WdfUsbTargetPipeGetIoTarget, \
    WdfUsbTargetPipeGetType, \
    WdfUsbTargetPipeIsInEndpoint, \
    WdfUsbTargetPipeIsOutEndpoint, \
    WdfUsbTargetPipeReadSynchronously, \
    WdfUsbTargetPipeResetSynchronously, \
    WdfUsbTargetPipeSendUrbSynchronously, \
    WdfUsbTargetPipeSetNoMaximumPacketSizeCheck, \
    WdfUsbTargetPipeWdmGetPipeHandle, \
    WdfUsbTargetPipeWriteSynchronously, \
    WdfWaitLockAcquire, \
    WdfWaitLockCreate, \
    WdfWaitLockRelease, \
    WdfWdmDeviceGetWdfDeviceHandle, \
    WdfWdmDriverGetWdfDriverHandle, \
    WdfWmiInstanceCreate, \
    WdfWmiInstanceDeregister, \
    WdfWmiInstanceFireEvent, \
    WdfWmiInstanceGetDevice, \
    WdfWmiInstanceGetProvider, \
    WdfWmiInstanceRegister, \
    WdfWmiProviderCreate, \
    WdfWmiProviderGetDevice, \
    WdfWmiProviderGetTracingHandle, \
    WdfWmiProviderIsEnabled, \
    WdfWorkItemCreate, \
    WdfWorkItemEnqueue, \
    WdfWorkItemFlush, \
    WdfWorkItemGetParentObject, \
    WdfDeviceMiniportCreate, \
	WdfCxDeviceInitAllocate, \
    WdfCxDeviceInitAssignWdmIrpPreprocessCallback, \
    WdfCxDeviceInitSetFileObjectConfig, \
    WdfCxDeviceInitSetIoInCallerContextCallback, \
    WdfCxDeviceInitSetRequestAttributes, \
    WdfCxVerifierKeBugCheck, \
	WdfDeviceConfigureWdmIrpDispatchCallback, \
    WdfDeviceInitSetReleaseHardwareOrderOnFailure, \
    WdfDeviceInitSetRemoveLockOptions, \
	WdfDeviceWdmAssignPowerFrameworkSettings, \
    WdfDeviceWdmDispatchIrp, \
	WdfDmaEnablerConfigureSystemProfile, \
	WdfDmaTransactionAllocateResources, \
    WdfDmaTransactionCancel, \
	WdfDmaTransactionFreeResources, \
    WdfDmaTransactionGetTransferInfo, \
    WdfDmaTransactionInitializeUsingOffset, \
    WdfDmaTransactionSetChannelConfigurationCallback, \
    WdfDmaTransactionSetDeviceAddressOffset, \
    WdfDmaTransactionSetImmediateExecution, \
    WdfDmaTransactionSetMaximumLength, \
    WdfDmaTransactionSetTransferCompleteCallback, \
    WdfDmaTransactionStopSystemTransfer, \
    WdfDmaTransactionWdmGetTransferContext, \
	WdfDriverMiniportUnload, \
	WdfDriverRegisterTraceInfo, \
	WdfDriverWdmGetDriverObject, \
	WdfGetTriageInfo, \
	WdfInterruptGetDevice, \
	WdfInterruptGetInfo, \
	WdfInterruptQueueDpcForIsr, \
	WdfInterruptQueueWorkItemForIsr, \
	WdfInterruptReportActive, \
	WdfInterruptReportInactive, \
	WdfInterruptSetExtendedPolicy, \
	WdfInterruptSetPolicy, \
	WdfInterruptTryToAcquireLock, \
	WdfIoQueueAssignForwardProgressPolicy, \
	WdfIoTargetPurge, \
	WdfMemoryCreateFromLookaside, \
	WdfObjectAllocateContext, \
	WdfObjectContextGetObject, \
	WdfPdoInitAllowForwardingRequestToParent, \
	WdfPdoInitAssignContainerID, \
	WdfObjectGetTypedContextWorker, \
	WdfObjectQuery, \
	WdfObjectReferenceActual, \
	WdfObjectDereferenceActual, \
	WdfRequestForwardToParentDeviceIoQueue, \
	WdfRequestIsReserved, \
	WdfRequestMarkCancelableEx, \
	WdfTimerGetParentObject, \
	WdfUsbTargetDeviceCreateIsochUrb, \
	WdfUsbTargetDeviceCreateUrb, \
	WdfUsbTargetDeviceCreateWithParameters, \
	WdfUsbTargetDeviceQueryUsbCapability, \
	WdfVerifierDbgBreakPoint, \
	WdfVerifierKeBugCheck


