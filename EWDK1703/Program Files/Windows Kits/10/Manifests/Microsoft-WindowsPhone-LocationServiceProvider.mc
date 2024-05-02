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
  xmlns:ms="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:win="http://manifests.microsoft.com/win/2004/08/windows/events"
  xmlns:xs="http://www.w3.org/2001/XMLSchema">

  <instrumentation>
    <events>

      <provider name="Microsoft-WindowsPhone-LocationServiceProvider"
         message="$(string.Provider.LocationServiceProvider)"
         guid="{4D13548F-C7B8-4174-BB7A-D7F64BF22D29}"
         symbol="MICROSOFT_WINDOWSPHONE_LOCATIONSERVICEPROVIDER"
         messageFileName="%SystemRoot%\System32\LocationServiceProviderResources.dll"
         resourceFileName="%SystemRoot%\System32\LocationServiceProviderResources.dll">

        <channels>
          <channel
              chid="Debug"
              enabled="false"
              message="$(string.Channel.LocationServiceProvider.Debug)"
              name="Microsoft-WindowsPhone-LocationServiceProvider/Debug"
              type="Debug"
              />
        </channels>

        <!-- Common maps used for all event types -->
        <maps>
          <!-- enum for Status's returned from Orion, keep in sync with Utils.cpp -->
          <valueMap name="OrionResponse">
            <map value="0x00000000" message="$(string.Map.ORION_RESPONSE_OK)"/>
            <map value="0x800700E8" message="$(string.Map.ORION_RESPONSE_NOT_RESOLVABLE)"/>
            <map value="0x80070057" message="$(string.Map.ORION_RESPONSE_INVALID_PARAMETER)"/>
            <map value="0x801901F4" message="$(string.Map.ORION_SERVER_ERROR)"/>
            <map value="0x8007003A" message="$(string.Map.ORION_RESPONSE_INVALID_PAYLOAD)"/>
            <map value="0x80190005" message="$(string.Map.ORION_RESPONSE_OTHER_FAILURE)"/>
            <map value="0x80072F30" message="$(string.Map.WINHTTP_NO_CM_CONNECTION)"/>
            <map value="0x80072F80" message="$(string.Map.WINHTTP_NOT_REDIRECTED)"/>
            <!-- 
            0x80190004 = HTTP_E_STATUS_UNEXPECTED_CLIENT_ERROR defined additionally to differentiate
            client's failure before reaching the Orion server at all, in order to help identify and diagnose issues
            not related to server
            -->
            <map value="0x80190004" message="$(string.Map.ORION_CLIENT_ERROR)"/>
          </valueMap>
        </maps>

        <maps>
          <!-- enum for ComponentName - keep in sync with LocationFrameworkInternal.idl\LOCATION_COMPONENT -->
          <valueMap name="ComponentName">
            <map value="0x01" message="$(string.Map.LocationProviderHelper)"/>
            <map value="0x02" message="$(string.Map.LocationSession)"/>
            <map value="0x03" message="$(string.Map.LocationInformation)"/>
            <map value="0x04" message="$(string.Map.LocationServiceProxy)"/>

            <map value="0x10" message="$(string.Map.CpeLocationProvider)"/>
            <map value="0x11" message="$(string.Map.CpeLocationAcquireSingleShot)"/>
            <map value="0x12" message="$(string.Map.CpeLocationAcquirePeriodicTracking)"/>
            <map value="0x13" message="$(string.Map.CpeLocationAcquireDistanceTracking)"/>

            <map value="0x20" message="$(string.Map.WifiPeLocationProvider)"/>
            <map value="0x21" message="$(string.Map.WifiPeLocationAdapter)"/>
            <map value="0x22" message="$(string.Map.WifiPeLocationAcquireSingleShot)"/>

            <map value="0x30" message="$(string.Map.CellPeLocationProvider)"/>
            <map value="0x31" message="$(string.Map.CellPeLocationAdapter)"/>
            <map value="0x32" message="$(string.Map.CellPeLocationAcquireSingleShot)"/>

            <map value="0x40" message="$(string.Map.GnssPeLocationProvider)"/>
            <map value="0x41" message="$(string.Map.GnssPeLocationAcquireSingleShot)"/>
            <map value="0x42" message="$(string.Map.GnssPeLocationAcquirePeriodicTracking)"/>
            <map value="0x43" message="$(string.Map.GnssPeLocationAcquireDistanceTracking)"/>

            <map value="0x50" message="$(string.Map.GnssAdapter)"/>

            <map value="0x60" message="$(string.Map.Crowdsource)"/>
          </valueMap>

          <!-- enum for SessionType - keep in sync with LocationFramework.idl\LOCATIONREQUEST_SESSIONTYPE -->
          <valueMap name="SessionType">
            <map value="0" message="$(string.Map.Invalid)"/>
            <map value="1" message="$(string.Map.SingleShot)"/>
            <map value="2" message="$(string.Map.Distance)"/>
            <map value="3" message="$(string.Map.PeriodicTracking)"/>
            <map value="4" message="$(string.Map.Geofence)"/>
            <map value="5" message="$(string.Map.Passive)"/>
          </valueMap>

          <!-- enum for AccuracyType - keep in sync with LocationFramework.idl\LOCATIONREQUEST_ACCURACYTYPE -->
          <valueMap name="AccuracyType">
            <map value="1" message="$(string.Map.AccuracySpecific)"/>
            <map value="2" message="$(string.Map.AccuracyAny)"/>
            <map value="3" message="$(string.Map.AccuracyHighest)"/>
          </valueMap>

          <!-- enum for PEs - keep in sync with LocationFramework.idl\LOCATION_POSITIONINGENGINE -->
          <valueMap name="PeName">
            <map value="0" message="$(string.Map.UnknownPe)"/>
            <map value="1" message="$(string.Map.CompositePe)"/>
            <map value="2" message="$(string.Map.GnssPe)"/>
            <map value="3" message="$(string.Map.WifiPe)"/>
            <map value="4" message="$(string.Map.CellPe)"/>
            <map value="5" message="$(string.Map.VenuePe)"/>
            <map value="6" message="$(string.Map.IpAddrPe)"/>
            <map value="7" message="$(string.Map.UnknownPe)"/>
            <map value="8" message="$(string.Map.UserPe)"/>
            <map value="9" message="$(string.Map.LegacyPe)"/>
          </valueMap>

          <!-- enum for GNSS SessionType - keep in sync with GnssDriver.w\GNSS_FIXSESSIONTYPE -->
          <valueMap name="GnssSessionType">
            <map value="1" message="$(string.Map.GnssSingleShot)"/>
            <map value="2" message="$(string.Map.GnssDistanceTracking)"/>
            <map value="3" message="$(string.Map.GnssContinuousTracking)"/>
            <map value="4" message="$(string.Map.GnssLKG)"/>
          </valueMap>

          <!-- enum for legacy accuracy values -->
          <valueMap name="LegacyAccuracy">
            <map value="1" message="$(string.Map.AccuracyHigh)"/>
            <map value="2" message="$(string.Map.AccuracyPowerOptimized)"/>
          </valueMap>

          <!-- enum for legacy generate values -->
          <valueMap name="LegacyGenerate">
            <map value="1" message="$(string.Map.GenerateLast)"/>
            <map value="2" message="$(string.Map.GenerateFirst)"/>
            <map value="3" message="$(string.Map.GenerateBest)"/>
          </valueMap>

          <!-- enum for CertAction - keep in sync with GnssDriver.w\GNSS_DRIVERCOMMAND_TYPE -->
          <valueMap name="CertAction">
            <map value="1" message="$(string.Map.CertInject)"/>
            <map value="2" message="$(string.Map.CertDelete)"/>
            <map value="3" message="$(string.Map.CertPurge)"/>
          </valueMap>

          <!-- enum for AGNSS InjectionType - keep in sync with GnssDriver.w\GNSS_AGNSS_REQUEST_TYPE -->
          <valueMap name="AgnssInjectionType">
            <map value="1" message="$(string.Map.AgnssTimeInjection)"/>
            <map value="2" message="$(string.Map.AgnssPositionInjection)"/>
            <map value="3" message="$(string.Map.AgnssBlobInjection)"/>
          </valueMap>

          <!-- enum for AGNSS BlobFormat - keep in sync with GnssDriver.w\#defines -->
          <valueMap name="AgnssBlobFormat">
            <map value="1" message="$(string.Map.AgnssBlobFormatXtra1)"/>
            <map value="2" message="$(string.Map.AgnssBlobFormatXtra2)"/>
            <map value="4" message="$(string.Map.AgnssBlobFormatLto)"/>
            <map value="8" message="$(string.Map.AgnssBlobFormatXtra3)"/>
          </valueMap>

          <!-- enum for NI Request Type - keep in sync with GnssDriver.w\GNSS_NI_REQUEST_TYPE -->
          <valueMap name="NiRequestType">
            <map value="1" message="$(string.Map.NiRequestSingleShot)"/>
            <map value="2" message="$(string.Map.NiRequestAreaTrigger)"/>
          </valueMap>

          <!-- enum for NI Notification Type - keep in sync with GnssDriver.w\GNSS_NI_NOTIFICATION_TYPE -->
          <valueMap name="NiNotificationType">
            <map value="1" message="$(string.Map.NoNotifyNoVerify)"/>
            <map value="2" message="$(string.Map.NotifyOnly)"/>
            <map value="3" message="$(string.Map.NotifyVerifyDefaultAllow)"/>
            <map value="4" message="$(string.Map.NotifyVerifyDefaultNotAllow)"/>
            <map value="5" message="$(string.Map.PrivacyOverride)"/>
          </valueMap>

          <!-- enum for NI Request Plane Type - keep in sync with GnssDriver.w\GNSS_NI_PLANE_TYPE -->
          <valueMap name="NiPlaneType">
            <map value="1" message="$(string.Map.SUPL)"/>
            <map value="2" message="$(string.Map.CP)"/>
            <map value="3" message="$(string.Map.V2UPL)"/>
          </valueMap>

          <!-- enum for NI User Response - keep in sync with GnssDriver.w\GNSS_NI_USER_RESPONSE -->
          <valueMap name="NiUserResponse">
            <map value="1" message="$(string.Map.UserResponseAccept)"/>
            <map value="2" message="$(string.Map.UserResponseDeny)"/>
            <map value="3" message="$(string.Map.UserReponseTimeout)"/>
          </valueMap>

          <!-- enum for SUPL Trigger type - keep in sync with SuplHandler.cpp\SUPL_TRIGGER enum -->
          <valueMap name="SuplTrigger">
            <map value="0" message="$(string.Map.SUPL_TRIGGER_UNKNOWN)"/>
            <map value="1" message="$(string.Map.SUPL_TRIGGER_CAN_REMOVED)"/>
            <map value="2" message="$(string.Map.SUPL_TRIGGER_CSP_UPDATE)"/>
            <map value="3" message="$(string.Map.SUPL_TRIGGER_CELLULAR_UPDATE)"/>
          </valueMap>

          <!-- enum for cell registration status - keep in sync with MobileBroadbandAccountApi.idl\NetworkRegistrationState enum -->
          <valueMap name="NetworkRegistrationState">
            <map value="0" message="$(string.Map.RegState_None)"/>
            <map value="1" message="$(string.Map.RegState_Deregistered)"/>
            <map value="2" message="$(string.Map.RegState_Searching)"/>
            <map value="3" message="$(string.Map.RegState_Home)"/>
            <map value="4" message="$(string.Map.RegState_Roaming)"/>
            <map value="5" message="$(string.Map.RegState_Partner)"/>
            <map value="6" message="$(string.Map.RegState_Denied)"/>
          </valueMap>

          <!-- enum for SUPL HSLP source - keep in sync with enum in GnssDriverWrapper.h -->
          <valueMap name="SuplHslpSource">
            <map value="0" message="$(string.Map.SUPL_HSLP_SOURCE_UNKNOWN)"/>
            <map value="1" message="$(string.Map.SUPL_HSLP_SOURCE_CSP)"/>
            <map value="2" message="$(string.Map.SUPL_HSLP_SOURCE_UICC)"/>
            <map value="3" message="$(string.Map.SUPL_HSLP_SOURCE_IMSI)"/>
          </valueMap>

          <!-- enum for cell registration status - keep in sync with RilApiTypes.idl\RILREGSTAT enum -->
          <valueMap name="CellularRegistrationStatus">
            <map value="0" message="$(string.Map.RIL_REGSTAT_UNKNOWN)"/>
            <map value="1" message="$(string.Map.RIL_REGSTAT_UNREGISTERED)"/>
            <map value="2" message="$(string.Map.RIL_REGSTAT_HOME)"/>
            <map value="3" message="$(string.Map.RIL_REGSTAT_ATTEMPTING)"/>
            <map value="4" message="$(string.Map.RIL_REGSTAT_DENIED)"/>
            <map value="5" message="$(string.Map.RIL_REGSTAT_ROAMING)"/>
            <map value="6" message="$(string.Map.RIL_REGSTAT_ROAMING_DOMESTIC)"/>
          </valueMap>

          <!-- enum for Driver Command Type - keep in sync with GnssDriver.w\GNSS_SUPL_CERT_ACTION -->
          <valueMap name="DriverCommandType">
            <map value="1" message="$(string.Map.SetLocationServiceEnabled)"/>
            <map value="2" message="$(string.Map.SetLocationNIRequestAllowed)"/>
            <map value="3" message="$(string.Map.ForceSatelliteSystem)"/>
            <map value="4" message="$(string.Map.ForceOperationMode)"/>
            <map value="5" message="$(string.Map.SetEngineKeepWarmPeriod)"/>
            <map value="6" message="$(string.Map.SetEngineWarm)"/>
            <map value="7" message="$(string.Map.SetEngineCold)"/>
            <map value="8" message="$(string.Map.SetEngineHot)"/>
            <map value="9" message="$(string.Map.ResetEngine)"/>
            <map value="10" message="$(string.Map.ClearAgnssData)"/>
            <map value="11" message="$(string.Map.SetDefaultFixResponseTime)"/>
            <map value="12" message="$(string.Map.SetSuplVersion)"/>
            <map value="13" message="$(string.Map.SetNMEALogging)"/>
            <map value="14" message="$(string.Map.SetUplServerAccessInterval)"/>
            <map value="15" message="$(string.Map.SetNiTimeoutInterval)"/>
            <map value="16" message="$(string.Map.ResetGeofencesTracking)"/>
          </valueMap>

          <!-- enum for Operation Mode - keep in sync with GnssDriver.w -->
          <valueMap name="GnssOperationMode">
            <map value="0" message="$(string.Map.GNSS_OPERMODE_ANY)"/>
            <map value="1" message="$(string.Map.GNSS_OPERMODE_MSA)"/>
            <map value="2" message="$(string.Map.GNSS_OPERMODE_MSB)"/>
            <map value="4" message="$(string.Map.GNSS_OPERMODE_MSS)"/>
            <map value="8" message="$(string.Map.GNSS_OPERMODE_CELLID)"/>
            <map value="16" message="$(string.Map.GNSS_OPERMODE_AFLT)"/>
            <map value="32" message="$(string.Map.GNSS_OPERMODE_OTDOA)"/>
          </valueMap>

          <!-- enum for GNSS driver IOCTLs - keep in sync with GnssDriver.w -->
          <valueMap name="GnssDriverIoctl">
            <map value="0x00220004" message="$(string.Map.IOCTL_GNSS_SEND_PLATFORM_CAPABILITY)"/>
            <map value="0x00220008" message="$(string.Map.IOCTL_GNSS_GET_DEVICE_CAPABILITY)"/>
            <map value="0x0022000C" message="$(string.Map.IOCTL_GNSS_SEND_DRIVERCOMMAND)"/>
            <map value="0x00220040" message="$(string.Map.IOCTL_GNSS_START_FIXSESSION)"/>
            <map value="0x00220044" message="$(string.Map.IOCTL_GNSS_MODIFY_FIXSESSION)"/>
            <map value="0x00220048" message="$(string.Map.IOCTL_GNSS_STOP_FIXSESSION)"/>
            <map value="0x0022004C" message="$(string.Map.IOCTL_GNSS_GET_FIXDATA)"/>
            <map value="0x00220080" message="$(string.Map.IOCTL_GNSS_INJECT_AGNSS)"/>
            <map value="0x002200C0" message="$(string.Map.IOCTL_GNSS_LISTEN_AGNSS)"/>
            <map value="0x002200C4" message="$(string.Map.IOCTL_GNSS_LISTEN_ERROR)"/>
            <map value="0x002200C8" message="$(string.Map.IOCTL_GNSS_LISTEN_FAILOVER)"/>
            <map value="0x002200CC" message="$(string.Map.IOCTL_GNSS_LISTEN_CUSTOM)"/>
            <map value="0x00220100" message="$(string.Map.IOCTL_GNSS_LISTEN_NI)"/>
            <map value="0x00220104" message="$(string.Map.IOCTL_GNSS_SET_SUPL_HSLP)"/>
            <map value="0x00220108" message="$(string.Map.IOCTL_GNSS_CONFIG_SUPL_CERT)"/>
            <map value="0x0022010C" message="$(string.Map.IOCTL_GNSS_RESPOND_NI)"/>
            <map value="0x00220110" message="$(string.Map.IOCTL_GNSS_EXECUTE_CWTEST)"/>
            <map value="0x00220114" message="$(string.Map.IOCTL_GNSS_EXECUTE_SELFTEST)"/>
            <map value="0x00220118" message="$(string.Map.IOCTL_GNSS_GET_CHIPSETINFO)"/>
            <map value="0x0022011C" message="$(string.Map.IOCTL_GNSS_LISTEN_NMEA)"/>
            <map value="0x00220120" message="$(string.Map.IOCTL_GNSS_SET_V2UPL_CONFIG)"/>
          </valueMap>

          <!-- Crowdsource Trace maps - keep in sync with Crowdsource.idl -->
          <!-- enum for Dcp profile name -->
          <valueMap name="DcpProfileName">
            <map value="0x01" message="$(string.Map.DcpPrimaryProfile)"/>
            <map value="0x02" message="$(string.Map.DcpSecondaryProfile)"/>
          </valueMap>

          <valueMap name="CrowdsourceLevel">
            <map value="0x01" message="$(string.Map.CsLevelLow)"/>
            <map value="0x02" message="$(string.Map.CsLevelMedium)"/>
            <map value="0x03" message="$(string.Map.CsLevelHigh)"/>
          </valueMap>

          <valueMap name="CrowdsourceCollectionType">
            <map value="0x00" message="$(string.Map.CollectionTypeNone)"/>
            <map value="0x01" message="$(string.Map.CollectionTypeCell)"/>
            <map value="0x02" message="$(string.Map.CollectionTypeWiFi)"/>
            <map value="0x03" message="$(string.Map.CollectionTypeAll)"/>
          </valueMap>

        </maps>

        <!-- Webproxy Trace maps -->
        <!-- These values are also referenced same in enums in WebserviceProxy.cpp and WSConn.cpp -->
        <maps>

          <valueMap name="WebproxyAPIName">
            <map value="0x01" message="$(string.Map.CellInference)"/>
            <map value="0x02" message="$(string.Map.WiFiInference)"/>
            <map value="0x03" message="$(string.Map.AgnssData)"/>
            <map value="0x04" message="$(string.Map.ServerTimeData)"/>
            <map value="0x05" message="$(string.Map.WebproxyTileRequest)"/>
            <map value="0x06" message="$(string.Map.CrowdsourceData)"/>
            <map value="0x07" message="$(string.Map.VenueTileRequest)"/>
            <map value="0x08" message="$(string.Map.VenueModelRequest)"/>
          </valueMap>

          <valueMap name="WebproxySource">
            <map value="0x01" message="$(string.Map.WebproxyCaller)"/>
            <map value="0x02" message="$(string.Map.WebproxyInternal)"/>
            <map value="0x03" message="$(string.Map.WebproxyWinHttp)"/>
          </valueMap>

          <valueMap name="WinHttpEventName">
            <map value="0x01" message="$(string.Map.ResponseHeaderAvailable)"/>
            <map value="0x02" message="$(string.Map.ResponseReadComplete)"/>
            <map value="0x03" message="$(string.Map.ResponseWriteComplete)"/>
            <map value="0x04" message="$(string.Map.RequestError)"/>
            <map value="0x05" message="$(string.Map.RequestSendComplete)"/>
          </valueMap>

          <valueMap name="WinHttpAPIName">
            <map value="0x01" message="$(string.Map.WinHttpOpenRequest)"/>
            <map value="0x02" message="$(string.Map.WinHttpSendRequest)"/>
            <map value="0x03" message="$(string.Map.WinHttpWriteData)"/>
            <map value="0x04" message="$(string.Map.WinHttpReceiveResponse)"/>
            <map value="0x05" message="$(string.Map.WinHttpReadData)"/>
            <map value="0x06" message="$(string.Map.WinHttpPayloadConversionFailed)"/>
          </valueMap>

        </maps>

        <!-- GeoCoordinateWatcher Logging Event maps -->
        <maps>
          <valueMap name="GCWEventType">
            <map value="0x01" message="$(string.Map.GCWStart)" />
            <map value="0x02" message="$(string.Map.GCWStop)" />
            <map value="0x03" message="$(string.Map.GCWStopByDisposed)" />
            <map value="0x04" message="$(string.Map.GCWTryStart)" />
            <map value="0x05" message="$(string.Map.GCWExecution)" />
            <map value="0x06" message="$(string.Map.GCWPostStatus)" />
            <map value="0x07" message="$(string.Map.GCWPostPosition)" />
          </valueMap>

          <valueMap name="GCWEventSource">
            <map value="0x01" message="$(string.Map.Application)" />
            <map value="0x02" message="$(string.Map.Taskhost)" />
            <map value="0x03" message="$(string.Map.LocationService)" />
            <map value="0x04" message="$(string.Map.Internal)" />
          </valueMap>

          <valueMap name="TaskhostSource">
            <map value="0x01" message="$(string.Map.None)" />
            <map value="0x02" message="$(string.Map.Paused)" />
            <map value="0x03" message="$(string.Map.ResumedTombstone)" />
            <map value="0x04" message="$(string.Map.ResumedFAS)" />
          </valueMap>

          <valueMap name="CurrentApiState">
            <map value="0x01" message="$(string.Map.None)" />
            <map value="0x02" message="$(string.Map.Starting)" />
            <map value="0x03" message="$(string.Map.Started)" />
            <map value="0x04" message="$(string.Map.Stopping)" />
            <map value="0x05" message="$(string.Map.Stopped)" />
            <map value="0x06" message="$(string.Map.Executing)" />
          </valueMap>

          <valueMap name="GeoStatusMap">
            <map value="0x00" message="$(string.Map.Disabled)" />
            <map value="0x01" message="$(string.Map.Ready)" />
            <map value="0x02" message="$(string.Map.Initializing)" />
            <map value="0x03" message="$(string.Map.NoData)" />
          </valueMap>

          <valueMap name="GeoPermissionMap">
            <map value="0x00" message="$(string.Map.Unknown)" />
            <map value="0x01" message="$(string.Map.Granted)" />
            <map value="0x02" message="$(string.Map.Denied)" />
          </valueMap>

          <!-- Composite PE Trace maps -->
          <!-- enum for  Pe role - keep in sync with LocationCpeCommon.h -->
          <valueMap name="PeRole">
            <map value="0x01" message="$(string.Map.PeRolePrimary)"/>
            <map value="0x02" message="$(string.Map.PeRoleFallback)"/>
          </valueMap>

          <valueMap name="GeofenceStateMap">
            <map value="0x00" message="$(string.Map.GeofenceUnknownState)"/>
            <map value="0x01" message="$(string.Map.GeofenceInside)"/>
            <map value="0x02" message="$(string.Map.GeofenceOutside)"/>
          </valueMap>

          <valueMap name="GeofenceTriggerMap">
            <map value="0x00" message="$(string.Map.GeofenceUnknownTrigger)"/>
            <map value="0x01" message="$(string.Map.GeofenceEnter)"/>
            <map value="0x02" message="$(string.Map.GeofenceExit)"/>
            <map value="0x04" message="$(string.Map.GeofenceRemoved)"/>
          </valueMap>

          <valueMap name="GeofenceTrackerMap">
            <map value="0x00" message="$(string.Map.GeofenceUnknownTracker)"/>
            <map value="0x01" message="$(string.Map.GeofenceSoftwareTracker)"/>
            <map value="0x02" message="$(string.Map.GeofenceHardwareTracker)"/>
          </valueMap>

          <valueMap name="GeofenceTrackerStateMap">
            <map value="0x00" message="$(string.Map.TrackerStateUnknown)"/>
            <map value="0x01" message="$(string.Map.TrackerStateTracking)"/>
            <map value="0x02" message="$(string.Map.TrackerStateNotTracking)"/>
          </valueMap>

          <valueMap name="LocationTriggerType">
            <map value="0x00" message="$(string.Map.TriggerTypeGeofence)"/>
            <map value="0x01" message="$(string.Map.TriggerTypeGeofenceMonitor)"/>
          </valueMap>

          <valueMap name="GeofenceForegroundEvent">
            <map value="0" message="$(string.Map.GeofenceBackground)" />
            <map value="1" message="$(string.Map.GeofenceForeground)" />
          </valueMap>

          <valueMap name="GfForegroundEventSubType">
            <map value="0" message="$(string.Map.GenericForeground)" />
            <map value="1" message="$(string.Map.WnfForeground)" />
          </valueMap>

          <valueMap name="GeofenceRegistrationOperation">
            <map value="0" message="$(string.Map.GeofenceUnregister)" />
            <map value="1" message="$(string.Map.GeofenceRegister)" />
          </valueMap>

          <valueMap name="GeofenceRemovalReason">
            <map value="0" message="$(string.Map.GeofenceRemovalReasonUsed)" />
            <map value="1" message="$(string.Map.GeofenceRemovalReasonExpired)" />
          </valueMap>

          <valueMap name="TrackingStatusMap">
            <map value="0x00" message="$(string.Map.TrackingStatusNotTracking)"/>
            <map value="0x01" message="$(string.Map.TrackingStatusTracking)"/>
          </valueMap>

        </maps>

        <!-- Wifi Event maps corresponds to the enum WIFI_CONNECTION_STATE defined in WiFIPE.idl -->
        <maps>
          <valueMap name="WifiConnectionStateMap">
            <map value="0x00" message="$(string.Map.WiFiDisconnected)" />
            <map value="0x01" message="$(string.Map.WiFiConnected)" />
          </valueMap>
        </maps>

        <!-- Permission maps for enum LocationPermissionState -->
        <maps>
          <valueMap name="PermissionState">
            <map value="0x00" message="$(string.Map.PermissionUnset)" />
            <map value="0x01" message="$(string.Map.PermissionEnabled)" />
            <map value="0x02" message="$(string.Map.PermissionDisabled)" />
          </valueMap>
        </maps>

        <keywords>
          <!-- Keywords 1 and 2 are defined by WinPhone best practices. Others 
               are provider specific. -->
          <keyword mask="0x0000000000000001" name="Error" message="$(string.Keyword.Error)" />
          <keyword mask="0x0000000000000002" name="Performance" message="$(string.Keyword.Performance)" />
          <keyword mask="0x0000000000000004" name="Selfhost" message="$(string.Keyword.Selfhost)" />
          <keyword mask="0x0000000000000008" name="WiFiTracing" message="$(string.Keyword.WiFiTracing)" />
          <keyword mask="0x0000000000000010" name="Init" message="$(string.Keyword.Init)" />
          <keyword mask="0x0000000000000020" name="Position" message="$(string.Keyword.Position)" />
          <keyword mask="0x0000000000000040" name="FixSession" message="$(string.Keyword.FixSession)" />
          <keyword mask="0x0000000000000080" name="CompositePe" message="$(string.Keyword.CompositePe)" />
          <keyword mask="0x0000000000000100" name="Gnss" message="$(string.Keyword.Gnss)" />
          <keyword mask="0x0000000000000200" name="CellPe" message="$(string.Keyword.CellPe)" />
          <keyword mask="0x0000000000000400" name="WifiPe" message="$(string.Keyword.WifiPe)" />
          <keyword mask="0x0000000000000800" name="ClientApi" message="$(string.Keyword.ClientApi)" />
          <keyword mask="0x0000000000001000" name="Orion" message="$(string.Keyword.Orion)" />
          <keyword mask="0x0000000000002000" name="Supl" message="$(string.Keyword.Supl)" />
          <keyword mask="0x0000000000004000" name="Crowdsource" message="$(string.Keyword.Crowdsource)" />
          <keyword mask="0x0000000000008000" name="ManagedApi" message="$(string.Keyword.ManagedApi)" />
          <keyword mask="0x0000000000010000" name="GeofenceTracking" message="$(string.Keyword.GeofenceTracking)" />
          <keyword mask="0x0000000000020000" name="GeofenceStore" message="$(string.Keyword.GeofenceStore)" />

          <!-- Tracing type mask, the proposed convention as followings 0x08000000, 0x04000000, etc... -->
          <keyword mask="0x0000000008000000" name="WebproxyTracing" message="$(string.Keyword.WebproxyTracing)" />
          <keyword mask="0x0000000020000000" name="CellPeAdvanceTracing " message="$(string.Keyword.CellPeAdvanceTracing)" />
          <keyword mask="0x0000000040000000" name="SpeedEstimatorTracing" message="$(string.Keyword.SpeedEstimatorTracing)" />
          <keyword mask="0x0000000080000000" name="VenuePE" message="$(string.Keyword.VenuePE)" />

        </keywords>

        <!-- High level tasks -->
        <!-- Location service selfhost tasks -->
        <tasks>
          <task value="1" name="LocationSession" />
          <task value="2" name="Initialization" />
          <task value="3" name="OrionSession" />
          <task value="4" name="SuplSession" />
          <task value="5" name="CommonPE" />
          <task value="6" name="CellPE" />
          <task value="7" name="WifiPE" />
          <task value="8" name="Crowdsource" />
          <task value="9" name="CompositePE" />
          <task value="10" name="TraceMessage" />
          <task value="11" name="GeofenceTracking" />
          <task value="12" name="GeofenceStore" />
          <task value="13" name="GeofencePower"/>
          <task value="14" name="VenuePE"/>
          <task value="15" name="Permissions"/>
          <task value="16" name="Misc"/>
        </tasks>

        <!-- WebproxyTracing tasks -->
        <tasks>
          <task value="20" name="WebproxyRequest" />
          <task value="21" name="WebproxyResponse" />
          <task value="22" name="Canceled" />
          <task value="23" name="WinHttpEvent" />
          <task value="24" name="WinHttpAPICall" />
          <task value="25" name="WebproxyRequestInfo" />
          <task value="26" name="WebproxyResponseInfo" />
        </tasks>

        <!-- WiFiTracing tasks -->
        <tasks>
          <task value="40" name="WiFiAdapter" />
        </tasks>

        <!-- Geolocation tasks -->
        <tasks>
          <task value="50" name="Geolocation" />
          <task value="51" name="Geofencing" />
        </tasks>

        <!-- GeoCoordinateWatcher tasks -->
        <tasks>
          <task value="60" name="GCWLogEvent" />
          <task value="61" name="GCWStateLogEvent" />
        </tasks>

        <!-- CellPeAdvanceTracing tasks -->
        <tasks>
          <task value="70" name="CellPEAdvance" />
        </tasks>

        <!-- Common Templates shared for ALL event types -->
        <templates>
          <!-- Add templates that are generically common and re-used for all event types -->
          <template tid="tTracelogReport">
            <data name="HR" inType="win:UInt32" outType="win:HexInt32" />
            <data name="CustomMessage" inType="win:UnicodeString" />
            <data name="Function" inType="win:AnsiString" />
            <data name="CallingCode" inType="win:AnsiString" />
            <data name="Filename" inType="win:AnsiString" />
            <data name="Line" inType="win:UInt32" />
          </template>
          <template tid="tPdcRef">
            <data
                inType="win:Pointer"
                name="context"
                />
            <data
                inType="win:UInt32"
                name="component"
                />
            <data
                inType="win:Boolean"
                name="istakeref"
                />
          </template>
        </templates>

        <!-- Templates for Location service Selfhost events -->
        <templates>

          <template tid="tLocStringAndHexDword">
            <data name="Component" inType="win:UInt32" map="ComponentName"/>
            <data name="ComponentMsgId" inType="win:UInt32" />
            <data name="szCustomString" inType="win:UnicodeString" />
            <data name="dwArg1" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tGenericOperationResult">
            <data name="Status" inType="win:HexInt32" />
            <data name="Filename" inType="win:AnsiString"/>
            <data name="Line" inType="win:UInt32" />
          </template>

          <template tid="tLocHexResult">
            <data name="hrResult" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tWerReport">
            <data name="ExInfo0" inType="win:UInt32" outType="win:HexInt32" />
            <data name="ExInfo1" inType="win:UInt32" outType="win:HexInt32" />
            <data name="Result" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tTraceMessage">
            <data name="Message" inType="win:Pointer"/>
          </template>

          <!-- Legacy APIs -->
          <template tid="tLatLonParameters">
            <data name="Accuracy" inType="win:UInt32" map="LegacyAccuracy"/>
            <data name="Generate" inType="win:UInt32" map="LegacyGenerate"/>
            <data name="dwHint" inType="win:UInt32" />
            <data name="ErrorCode" inType="win:UInt32" />
          </template>

          <template tid="tLatLonReport">
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Altitude" inType="win:Double" />
            <data name="HorizontalAccuracy" inType="win:Double" />
            <data name="VerticalAccuracy" inType="win:Double" />
            <data name="Heading" inType="win:Double" />
            <data name="Velocity" inType="win:Double" />
            <data name="ErrorCode" inType="win:UInt32" />
          </template>

          <!-- Location Session -->
          <template tid="tStartSession">
            <data name="SessionId" inType="win:UInt32" />
            <data name="Pe" inType="win:UInt32" map="PeName"/>
            <data name="SessionType" inType="win:UInt32" map="SessionType"/>
            <data name="AccuracyType" inType="win:UInt32" map="AccuracyType"/>
            <data name="AccuracyValue" inType="win:UInt32" />
            <data name="RequestParameter" inType="win:UInt32" />
            <data name="AgeValue" inType="win:UInt32" />
            <data name="IsVenueMandatory" inType="win:Boolean" />
            <data name="IsClientSession" inType="win:Boolean" />
            <data name="AttachedAcquireId" inType="win:UInt32" />
            <data name="OwnerId" inType="win:UInt32" />
          </template>

          <template tid="tStopSession">
            <data name="SessionId" inType="win:UInt32" />
            <data name="Pe" inType="win:UInt32" map="PeName"/>
            <data name="Result" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tSessionLocationInformation">
            <data name="SessionId" inType="win:UInt32" />
            <data name="Pe" inType="win:UInt32" map="PeName"/>
            <data name="Status" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="SourcePe" inType="win:UInt32" map="PeName" />
            <data name="Timestamp" inType="win:FILETIME" />
            <data name="IsIntermediate" inType="win:Boolean" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="HorizontalAccuracy" inType="win:UInt32"/>
            <data name="Speed" inType="win:Double" />
            <data name="Floor" inType="win:UnicodeString" outType="xs:string" />
            <data name="VenueId" inType="win:UnicodeString" outType="xs:string"/>
          </template>

          <template tid="tSessionCallerInfo">
            <data name="SessionId" inType="win:UInt32" />
            <data name="Pe" inType="win:UInt32" map="PeName"/>
            <data name="ProductId" inType="win:GUID" />
            <data name="UserSid"   inType="win:UnicodeString" />
            <data name="PackageId"   inType="win:UnicodeString" />
            <data name="CallerName"  inType="win:UnicodeString" />
          </template>

          <!-- GNSS session (the same templates are used for both Adapter and Driver sessions) -->
          <template tid="tGnssStartSession">
            <data name="SessionId" inType="win:UInt32"/>
            <data name="SessionType" inType="win:UInt32" map="GnssSessionType"/>
            <data name="RequestParameter" inType="win:UInt32" />
          </template>

          <template tid="tGnssModifySession">
            <data name="SessionId" inType="win:UInt32"/>
            <data name="SessionType" inType="win:UInt32" map="GnssSessionType"/>
            <data name="RequestParameter" inType="win:UInt32" />
          </template>

          <template tid="tGnssStopSession">
            <data name="SessionId" inType="win:UInt32" />
          </template>

          <template tid="tGnssIoctlResult">
            <data name="SessionId" inType="win:UInt32"/>
            <data name="Ioctl" inType="win:UInt32" map="GnssDriverIoctl"/>
            <data name="Result" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="Duration" inType="win:UInt32" />
          </template>

          <template tid="tGnssEventError">
            <data name="Result" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="GnssEventType" inType="win:UInt32"/>
            <data name="NumberOfBytesTransferred" inType="win:UInt64"/>
            <data name="GnssEventSize" inType="win:UInt32"/>
          </template>

          <template tid="tGnssFixEventError">
            <data name="SessionId" inType="win:UInt32"/>
            <data name="Result" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="NumberOfBytesTransferred" inType="win:UInt64"/>
            <data name="FixLevelOfDetails" inType="win:UInt32"/>
            <data name="ExpectedMinimumBytes" inType="win:UInt32"/>
            <data name="ExpectedMinimumSatelliteBytes" inType="win:UInt32"/>
          </template>

          <template tid="tGnssLocationInformation">
            <data name="SessionId" inType="win:UInt32"/>
            <data name="Status" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="Timestamp" inType="win:FILETIME" />
            <data name="IsIntermediate" inType="win:Boolean" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Altitude" inType="win:Double" />
            <data name="Speed" inType="win:Double" />
            <data name="Heading" inType="win:Double" />
            <data name="hAccuracy" inType="win:UInt32"/>
            <data name="vAccuracy" inType="win:UInt32"/>
            <data name="SpeedAccuracy" inType="win:UInt32"/>
            <data name="hDilutionOfPrecision" inType="win:Float"/>
            <data name="PositionDilutionOfPrecision" inType="win:Float"/>
          </template>

          <template tid="tGnssSatellites">
            <data name="SessionId" inType="win:UInt32"/>
            <data name="SatelliteData" inType="win:UnicodeString" />
          </template>

          <!-- Orion -->
          <template tid="tOrionServerTime">
            <data name="Result" inType="win:UInt32" outType="win:HexInt32" />
            <data name="ReportStatus" inType="win:UInt32" outType="win:HexInt32" />
            <data name="Timestamp" inType="win:FILETIME" />
          </template>

          <template tid="tOrionAgnss">
            <data name="Result" inType="win:UInt32" outType="win:HexInt32" />
            <data name="ReportStatus" inType="win:UInt32" outType="win:HexInt32" />
            <data name="BlobSize" inType="win:UInt32" />
          </template>

          <template tid="tOrionInference">
            <data name="WinHttpResult" inType="win:UInt32" outType="win:HexInt32" />
            <data name="OrionResult" inType="win:UInt32" map="OrionResponse" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Accuracy" inType="win:Double" />
          </template>

          <!-- Misc GNSS -->
          <template tid="tSuplHslpConfig">
            <data name="Hslp" inType="win:AnsiString" />
            <data name="HslpSource" inType="win:UInt32" map="SuplHslpSource"/>
            <data name="HslpFromImsi" inType="win:AnsiString" />
          </template>

          <template tid="tSuplCert">
            <data name="Action" inType="win:UInt32" map="CertAction"/>
            <data name="Name" inType="win:AnsiString" />
            <data name="Size" inType="win:UInt32" />
          </template>

          <template tid="tSuplVersion">
            <data name="Major" inType="win:UInt32" />
            <data name="Minor" inType="win:UInt32" />
          </template>

          <template tid="tSuplReconfiguration">
            <data name="Trigger" inType="win:UInt32" map="SuplTrigger"/>
            <data name="RegStatus" inType="win:UInt32" map="CellularRegistrationStatus"/>
          </template>

          <template tid="tSuplPushConfiguration">
            <data name="Trigger" inType="win:UInt32" map="SuplTrigger"/>
            <data name="RegStatus" inType="win:UInt32" map="NetworkRegistrationState"/>
          </template>

          <template tid="tV2Uplconfig">
            <data name="MPC" inType="win:AnsiString" />
            <data name="PDE" inType="win:AnsiString" />
            <data name="ApplicationType" inType="win:UInt8" />
          </template>

          <template tid="tDriverCommandDword">
            <data name="CommandType" inType="win:UInt32" map="DriverCommandType"/>
            <data name="Value" inType="win:UInt32" />
          </template>

          <template tid="tGnssOperationMode">
            <data name="Value" inType="win:UInt32" map="GnssOperationMode"/>
          </template>

          <template tid="tAgnssRequest">
            <data name="InjectionType" inType="win:UInt32" map="AgnssInjectionType"/>
            <data name="BlobFormat"    inType="win:UInt32" map="AgnssBlobFormat" />
          </template>

          <template tid="tAgnssInject">
            <data name="InjectionType" inType="win:UInt32" map="AgnssInjectionType"/>
            <data name="InjectionStatus" inType="win:UInt32" outType="win:HexInt32" />
            <data name="InjectionDataSize" inType="win:UInt32" />
          </template>

          <template tid="tAgnssPositionInject">
            <data name="InjectionStatus" inType="win:UInt32" outType="win:HexInt32" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Altitude" inType="win:Double" />
            <data name="Speed" inType="win:Double" />
            <data name="Heading" inType="win:Double" />
            <data name="hAccuracy" inType="win:UInt32"/>
          </template>

          <template tid="tAgnssTimeInject">
            <data name="InjectionStatus" inType="win:UInt32" outType="win:HexInt32" />
            <data name="UtcTime" inType="win:FILETIME" />
            <data name="Uncertainty" inType="win:UInt32" />
          </template>

          <template tid="tAgnssBlobInject">
            <data name="InjectionStatus" inType="win:UInt32" outType="win:HexInt32" />
            <data name="BlobVersion" inType="win:UInt32" />
            <data name="BlobFormat"  inType="win:UInt32" map="AgnssBlobFormat" />
            <data name="BlobSize" inType="win:UInt32" />
          </template>

          <template tid="tAgnssClear">
            <data name="InjectionType" inType="win:UInt32" map="AgnssInjectionType"/>
          </template>

          <template tid="tNiResponse">
            <data name="RequestId" inType="win:UInt32"/>
            <data name="UserResponse" inType="win:UInt32" map="NiUserResponse" />
          </template>

          <template tid="tNiRequest">
            <data name="RequestId" inType="win:UInt32"/>
            <data name="RequestType" inType="win:UInt32" map="NiRequestType"/>
            <data name="RequestNotificationType" inType="win:UInt32" map="NiNotificationType"/>
            <data name="RequestPlaneType" inType="win:UInt32" map="NiPlaneType"/>
          </template>

          <template tid="tGeofenceAdd">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="ReturnId" inType="win:UInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tGeofenceRemove">
            <data name="Id" inType="win:UInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tResetGeofenceTracking">
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tGeofenceEvent">
            <data name="Id" inType="win:UInt32" />
            <data name="State" inType="win:UInt32" map="GeofenceTriggerMap"/>
          </template>

          <template tid="tTrackingStatus">
            <data name="State" inType="win:UInt32" map="TrackingStatusMap" />
          </template>

          <template tid="tGnssError">
            <data name="Status" inType="win:UInt32" outType="win:HexInt32" />
            <data name="IsRecoverable" inType="win:Boolean" />
            <data name="Description" inType="win:UnicodeString" />
          </template>

          <template tid="tOnGnssPnP">
            <data name="DeviceAvailable" inType="win:Boolean" />
            <data name="SymbolicLink" inType="win:UnicodeString" />
            <data name="DeviceInUse" inType="win:Boolean" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tPnPDeviceArrival">
            <data name="SymbolicLink" inType="win:UnicodeString" />
            <data name="IsExternal" inType="win:Boolean" />
          </template>

          <template tid="tPnPDeviceRemoval">
            <data name="SymbolicLink" inType="win:UnicodeString" />
            <data name="IsExternal" inType="win:Boolean" />
          </template>

          <template tid="tPnPDeviceAttachRetry">
            <data name="SymbolicLink" inType="win:UnicodeString" />
          </template>

          <!-- Cell PE -->
          <template tid="tGsmBeacon">
            <data name="ARFCN" inType="win:UInt32"/>
            <data name="BaseStationID" inType="win:UInt32"/>
            <data name="CellID" inType="win:UInt32"/>
            <data name="LocationAreaCode" inType="win:UInt32"/>
          </template>

          <template tid="tUmtsBeacon">
            <data name="MobileCountryCode" inType="win:UInt32"/>
            <data name="MobileNetworkCode" inType="win:UInt32"/>
            <data name="CellID" inType="win:UInt32"/>
            <data name="LocationAreaCode" inType="win:UInt32"/>
          </template>

          <template tid="tTdscdmaBeacon">
            <data name="MobileCountryCode" inType="win:UInt32"/>
            <data name="MobileNetworkCode" inType="win:UInt32"/>
            <data name="LocationAreaCode" inType="win:UInt32"/>
            <data name="CellID" inType="win:UInt32"/>
          </template>

          <template tid="tCdmaBeacon">
            <data name="BaseLat" inType="win:UInt32"/>
            <data name="BaseLong" inType="win:UInt32"/>
            <data name="BaseStationID" inType="win:UInt32"/>
            <data name="NID" inType="win:UInt32"/>
            <data name="SID" inType="win:UInt32"/>
          </template>

          <template tid="tLteBeacon">
            <data name="MobileCountryCode" inType="win:UInt32"/>
            <data name="MobileNetworkCode" inType="win:UInt32"/>
            <data name="CellID" inType="win:UInt32"/>
          </template>

          <template tid="tCellNeighbors">
            <data name="Neighbors" inType="win:UnicodeString"/>
          </template>

          <template tid="tCellNeighborsBeaconHash">
            <data name="NeighborsBeaconHash" inType="win:UnicodeString"/>
          </template>

          <template tid="tCellLocationUpdate">
            <data name="Params" inType="win:UInt32"/>
            <data name="Executor" inType="win:UInt32"/>
            <data name="UiccApp" inType="win:UInt32"/>
            <data name="LocationAreaCode" inType="win:UInt32"/>
            <data name="TrackingAreaCode" inType="win:UInt32"/>
            <data name="CellID" inType="win:UInt32"/>
          </template>

          <template tid="tCellLocationMulticell">
            <data name="IsMulticellUsed" inType="win:Boolean"/>
          </template>

          <!-- Common PE Events -->
          <template tid="tServerCache">
            <data name="Result" inType="win:UInt32" outType="win:HexInt32" />
            <data name="PE" inType="win:UInt32" map="PeName"/>
          </template>

          <template tid="tTileCache">
            <data name="Result" inType="win:UInt32" outType="win:HexInt32" />
            <data name="PE" inType="win:UInt32" map="PeName"/>
          </template>

          <template tid="tAdapterScanResult">
            <data name="AdapterName" inType="win:UInt32" map="ComponentName"/>
            <data name="Result" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <!-- Crowdsource -->
          <template tid="tDcpApiResult">
            <data name="DcpProfile" inType="win:UInt32" map="DcpProfileName"/>
            <data name="Result" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tSubmitCrowdsourceData">
            <data name="SizeInBytes" inType="win:UInt32"/>
            <data name="DcpProfile" inType="win:UInt32" map="DcpProfileName"/>
            <data name="Result" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tDataProcessingStart">
            <data name="rawDataListSize" inType="win:UInt32" />
            <data name="IsCollectionStateActive" inType="win:Boolean"/>
          </template>

          <template tid="tDataReceived">
            <data name="SourcePE" inType="win:UInt32" map="PeName"/>
            <data name="IsReadyForData" inType="win:Boolean"/>
            <data name="IsValidData" inType="win:Boolean"/>
            <data name="Result" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="tCrowdsourceState">
            <data name="Level" inType="win:UInt32" map="CrowdsourceLevel"/>
            <data name="CollectionType" inType="win:UInt32" map="CrowdsourceCollectionType"/>
            <data name="IsBufferFull" inType="win:Boolean"/>
            <data name="IsBatterySavings" inType="win:Boolean"/>
            <data name="IsUserPresenceOn" inType="win:Boolean"/>
          </template>

          <!-- Composite PE -->

          <template tid="tCandidatePes">
            <data name="PeCount" inType="win:UInt32" />
            <data name="Pe1" inType="win:UInt32" map="PeName"/>
            <data name="Pe2" inType="win:UInt32" map="PeName"/>
            <data name="Pe3" inType="win:UInt32" map="PeName"/>
            <data name="Pe4" inType="win:UInt32" map="PeName"/>
            <data name="Pe5" inType="win:UInt32" map="PeName"/>
            <data name="Pe6" inType="win:UInt32" map="PeName"/>
          </template>

          <template tid="tSelectedPes">
            <data name="PrimaryPE" inType="win:UInt32" map="PeName"/>
            <data name="AcquireId" inType="win:UInt32"/>
          </template>

          <template tid="tStartPrimitivePes">
            <data name="PeRole" inType="win:UInt32" map="PeRole"/>
            <data name="RemainingTime" inType="win:UInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="AcquireId" inType="win:UInt32"/>
          </template>

          <template tid="tAttemptFallback">
            <data name="Status" inType="win:UInt32" outType="win:HexInt32"/>
            <data name="SourcePe" inType="win:UInt32" map="PeName"/>
            <data name="Accuracy" inType="win:UInt32"/>
            <data name="AcquireId" inType="win:UInt32"/>
          </template>

          <template tid="tSpeedEstimate">
            <data name="SpeedEstimate" inType="win:Double"/>
            <data name="Bearing" inType="win:Double"/>
            <data name="NumberOfPositions" inType="win:UInt32"/>
          </template>

          <template tid="tSpeedEstimatorInput">
            <data name="Timestamp" inType="win:UInt64" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="hAccuracy" inType="win:Double"/>
          </template>

          <template tid="tDTWaitBetweenRequests">
            <data name="DistanceThreshold" inType="win:UInt32" />
            <data name="Speed" inType="win:Double"/>
            <data name="MDUsed" inType="win:Boolean"/>
            <data name="MovementPrecision" inType="win:UInt32" />
            <data name="SpeedBasedWaitTimeSec" inType="win:UInt32"/>
            <data name="MDBasedWaitTimeSec" inType="win:UInt32"/>
            <data name="MinWaitTimeToMeetBudgetSec" inType="win:UInt32"/>
            <data name="SelectedWaitTimeSec" inType="win:UInt32" />
            <data name="CumulativeRunningTimeSec" inType="win:UInt64" />
            <data name="CumulativeAcquireTimeSec" inType="win:UInt64" />
            <data name="RequestsCount" inType="win:UInt32" />
            <data name="IsSpeedUnknown" inType="win:Boolean" />
            <data name="RecentMovementTimeBoundApplied" inType="win:Boolean"/>
            <data name="AcquireId" inType="win:UInt32"/>
          </template>

          <template tid="tOffloadedAcquireStartTracking">
            <data name="PeName" inType="win:UInt32" map="PeName"/>
            <data name="IsPrimaryNativeTracking" inType="win:Boolean"/>
            <data name="AcquireId" inType="win:UInt32"/>
          </template>

          <template tid="tOffloadedAcquireSupport">
            <data name="SessionType" inType="win:UInt32" map="SessionType"/>
            <data name="IsSupportsNativePT" inType="win:Boolean"/>
            <data name="IsSupportsNativeDT" inType="win:Boolean"/>
            <data name="IsSupportsRequest"  inType="win:Boolean"/>
          </template>

          <template tid="tMDEvent">
            <data name="hr" inType="win:UInt32" outType="win:HexInt32" />
          </template>

          <template tid="tMDStart">
            <data name="hr" inType="win:UInt32" outType="win:HexInt32" />
            <data name="hrWifiRegistration" inType="win:UInt32" outType="win:HexInt32" />
            <data name="hrCellRegistration" inType="win:UInt32" outType="win:HexInt32" />
            <data name="WifiConnectionState" inType="win:UInt32" map="WifiConnectionStateMap" />
            <data name="WifiThrottlingOn" inType="win:Boolean"/>
            <data name="WifiThrottlingOnElapsedTimeSec" inType="win:UInt64" />
            <data name="CellThrottlingOn" inType="win:Boolean"/>
            <data name="CellThrottlingOnElapsedTimeSec" inType="win:UInt64" />
            <data name="ActivityDetectionThrottlingOn" inType="win:Boolean"/>
            <data name="ActivityDetectionThrottlingOnElapsedTimeSec" inType="win:UInt64" />
          </template>

          <template tid="tMDGetMovementPrecision">
            <data name="hr" inType="win:UInt32" outType="win:HexInt32" />
            <data name="WifiConnectionState" inType="win:UInt32" map="WifiConnectionStateMap" />
            <data name="WifiThrottlingOn" inType="win:Boolean"/>
            <data name="WifiThrottlingOnElapsedTimeSec" inType="win:UInt64" />
            <data name="CellThrottlingOn" inType="win:Boolean"/>
            <data name="CellThrottlingOnElapsedTimeSec" inType="win:UInt64" />
            <data name="ADThrottlingOn" inType="win:Boolean"/>
            <data name="ADThrottlingOnElapsedTimeSec" inType="win:UInt64" />
          </template>

          <template tid="tUnreliablePositionDetected">
            <data name="UnreliablePositionAccuracy" inType="win:UInt32"/>
            <data name="UnreliablePositionSourcePe" inType="win:UInt32" map="PeName"/>
            <data name="ReliablePositionAccuracy" inType="win:UInt32"/>
            <data name="ReliablePositionSourcePe" inType="win:UInt32" map="PeName"/>
            <data name="AcquireId" inType="win:UInt32"/>
          </template>

          <!-- Venue PE -->
          <template tid="tCachedPositionsForEZ">
            <data name="RequestId" inType="win:Pointer"/>
            <data name="CachedPositions" inType="win:UnicodeString"/>
          </template>

          <template tid="tVenueTransitionDetected">
            <data name="IsInsideVenue" inType="win:Boolean"/>
            <data name="Lat" inType="win:Double"/>
            <data name="Lon" inType="win:Double"/>
            <data name="Acc" inType="win:UInt32"/>
            <data name="SourcePe" inType="win:UInt32" map="PeName"/>
          </template>
        </templates>

        <!-- Template for WebproxyTracing Trace events -->
        <templates>

          <template tid="tRequestParameters">
            <data name="RequestId" inType="win:HexInt32" />
            <data name="RequestType" inType="win:UInt32" map="WebproxyAPIName" />
            <data name="EndpointLengthInChars" inType="win:UInt32" />
            <data name="Endpoint" inType="win:UnicodeString" outType="xs:string" length="EndpointLengthInChars" />
            <data name="TrackingIdLengthInChars" inType="win:UInt32" />
            <data name="TrackingId" inType="win:UnicodeString" outType="xs:string" length="TrackingIdLengthInChars" />
          </template>

          <template tid="tInferenceResult">
            <data name="RequestId" inType="win:HexInt32" />
            <data name="RequestType" inType="win:UInt32" map="WebproxyAPIName" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="ServerStatus" inType="win:UInt32" map="OrionResponse" />
            <data name="MappedHResult" inType="win:HexInt32" />
            <data name="Accuracy" inType="win:UInt32" />
            <data name="Floor" inType="win:UnicodeString" outType="xs:string" />
            <data name="VenueId" inType="win:UnicodeString" outType="xs:string"/>
            <data name="StatusStringLengthInChars" inType="win:UInt32" />
            <data name="StatusString" inType="win:UnicodeString" outType="xs:string" length="StatusStringLengthInChars" />
            <data name="OrionSource" inType="win:UInt32" map="PeName"/>
          </template>

          <template tid="tRequestResult">
            <data name="RequestId" inType="win:HexInt32" />
            <data name="RequestType" inType="win:UInt32" map="WebproxyAPIName" />
            <data name="ServerStatus" inType="win:UInt32" map="OrionResponse" />
            <data name="MappedHResult" inType="win:HexInt32" />
            <data name="StatusStringLengthInChars" inType="win:UInt32" />
            <data name="StatusString" inType="win:UnicodeString" outType="xs:string" length="StatusStringLengthInChars" />
          </template>

          <template tid="tRequestCanceled">
            <data name="RequestId" inType="win:HexInt32" />
            <data name="RequestType" inType="win:UInt32" map="WebproxyAPIName" />
            <data name="Reason" inType="win:UInt32" map="WebproxySource" />
            <data name="Status" inType="win:HexInt32"/>
          </template>

          <template tid="tWebproxyWinHttpApiCall">
            <data name="WebproxyRequestId" inType="win:HexInt32" />
            <data name="WebproxyRequestType" inType="win:UInt32" map="WebproxyAPIName" />
            <data name="WinHttpHandle" inType="win:HexInt32" />
            <data name="WinHttpApiType" inType="win:UInt32" map="WinHttpAPIName" />
            <data name="Status" inType="win:HexInt32" />
          </template>

          <template tid="tWebproxyWinHttpEventUpdate">
            <data name="WebproxyRequestId" inType="win:HexInt32" />
            <data name="WebproxyRequestType" inType="win:UInt32" map="WebproxyAPIName" />
            <data name="WinHttpHandle" inType="win:HexInt32" />
            <data name="WinHttpEventType" inType="win:UInt32" map="WinHttpEventName" />
            <data name="WinhttpCallbackStatus" inType="win:UInt32" />
          </template>

          <template tid="tWebproxyPayloadInfo">
            <data name="PayloadLengthInChars" inType="win:UInt32" />
            <data name="Payload" inType="win:UnicodeString" outType="xs:string" length="PayloadLengthInChars"/>
          </template>

          <template tid="tWebproxyAnsiPayloadInfo">
            <data name="PayloadLengthInChars" inType="win:UInt32" />
            <data name="Payload" inType="win:AnsiString" outType="xs:string" length="PayloadLengthInChars"/>
          </template>

        </templates>

        <!-- Template for WiFi Tracing events -->
        <templates>

          <template tid="tWiFiAccessPoint">
            <data name="MacAddress" inType="win:UnicodeString"/>
            <data name="SignalStrength" inType="win:Int32"/>
          </template>

          <template tid="tWiFiConnectionStateChange">
            <data name="Name" inType="win:UnicodeString" />
            <data name="State" inType="win:UInt32" map="WifiConnectionStateMap" />
          </template>

          <template tid="tWiFiMacAddressList">
            <data name="MacAddresses" inType="win:UnicodeString"/>
          </template>
        </templates>

        <!-- Template for Geolocation Trace events -->
        <templates>

          <template tid="tGeolocationStartOperation">
            <data name="GeolocationClass" inType="win:Pointer" />
            <data name="SessionType" inType="win:UInt32" map="SessionType"/>
            <data name="AgeValue" inType="win:UInt32" />
            <data name="AccuracyValue" inType="win:UInt32" />
            <data name="RequestParameter" inType="win:UInt32" />
          </template>

          <template tid="tGeolocationStartOperationResult">
            <data name="GeolocationClass" inType="win:Pointer" />
            <data name="Status" inType="win:HexInt32" />
          </template>

          <template tid="tGeolocationEventHandler">
            <data name="GeolocationClass" inType="win:Pointer" />
            <data name="PositionStatus" inType="win:HexInt32"/>
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="HorizontalAccuracy" inType="win:UInt32"/>
            <data name="Status" inType="win:HexInt32" />
          </template>

          <template tid="tGeolocationStopTrackingOperation">
            <data name="Geolocator" inType="win:Pointer" />
            <data name="Status" inType="win:HexInt32" />
          </template>

          <template tid="tGeolocationPromptAppState">
            <data name="State" inType="win:Int32" />
          </template>

          <template tid="tGfClientOperationAddOrRemoveGeofence">
            <data name="Index" inType="win:UInt32" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Radius" inType="win:Double" />
            <data name="StartTime" inType="win:UInt64" />
            <data name="Duration" inType="win:UInt64" />
            <data name="DwellTime" inType="win:UInt64" />
            <data name="SingleUse" inType="win:Boolean" />
          </template>

          <template tid="tGfClientRegisterForChanges">
            <data name="TriggerType" inType="win:UInt32" map="LocationTriggerType"/>
          </template>

          <template tid="tGfClientUnregisterForChanges">
            <data name="TriggerType" inType="win:UInt32" map="LocationTriggerType"/>
          </template>

          <template tid="tGfClientSignalled">
            <data name="TriggerType" inType="win:UInt32" map="LocationTriggerType"/>
          </template>

          <template tid="tGfClientCreateOrDeleteTrigger">
          </template>

          <template tid="tGeofenceData">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Radius" inType="win:Double" />
            <data name="StartTime" inType="win:FILETIME" />
            <data name="Duration" inType="win:UInt64" />
            <data name="DwellTime" inType="win:UInt64" />
            <data name="SingleUse" inType="win:Boolean" />
          </template>

          <template tid="tGfOperationAddGeofence">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Radius" inType="win:Double" />
            <data name="StartTime" inType="win:FILETIME" />
            <data name="Duration" inType="win:UInt64" />
            <data name="DwellTime" inType="win:UInt64" />
            <data name="SingleUse" inType="win:Boolean" />
            <data name="hr" inType="win:HexInt32" />
            <data name="CallerName"  inType="win:UnicodeString" />
          </template>

          <template tid="tGfOperationRemoveGeofence">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="hr" inType="win:HexInt32" />
            <data name="CallerName"  inType="win:UnicodeString" />
          </template>

          <template tid="tGfOperationRemoveAllGeofences">
            <data name="AppId" inType="win:UInt32" />
            <data name="hr" inType="win:HexInt32" />
            <data name="CallerName"  inType="win:UnicodeString" />
          </template>

          <template tid="tGfOperationListAllGeofences">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofencesCount" inType="win:UInt32" />
            <data name="hr" inType="win:HexInt32" />
          </template>

          <template tid="tGfOperationReadGeofenceReports">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceReportsCount" inType="win:UInt32" />
            <data name="hr" inType="win:HexInt32" />
          </template>

          <template tid="tGeofenceReport">
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="Trigger" inType="win:UInt32" map="GeofenceTriggerMap"/>
            <data name="RemovalReason" inType="win:UInt32" map="GeofenceRemovalReason" />
            <data name="PositionStatus" inType="win:HexInt32" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Accuracy"  inType="win:UInt32" />
          </template>

          <template tid="tGfBackgroundEventSignalled">
            <data name="ClientId" inType="win:UInt32"/>
            <data name="EventId" inType="win:UInt64" />
            <data name="hr" inType="win:HexInt32"/>
          </template>

          <template tid="tGfForegroundEventFired">
            <data name="WnfForegroundEvent" inType="win:UInt32" map="GfForegroundEventSubType"/>
          </template>

          <template tid="tGeofenceOperationResult">
            <data name="Operation" inType="win:AnsiString"/>
            <data name="Status" inType="win:HexInt32" />
          </template>

          <template tid="tGeofenceTriggerOperationResult">
            <data name="Operation" inType="win:AnsiString"/>
            <data name="ClientId" inType="win:UInt32"/>
            <data name="EventId" inType="win:GUID" />
            <data name="Status" inType="win:HexInt32"/>
          </template>

          <template tid="tGeofenceEventTriggerOperation">
            <data name="TriggerType" inType="win:UInt32" map="LocationTriggerType"/>
            <data name="ForegroundEvent" inType="win:UInt32" map="GeofenceForegroundEvent"/>
            <data name="RegistrationOperation" inType="win:UInt32" map="GeofenceRegistrationOperation" />
            <data name="ProccessId" inType="win:UInt32" />
            <data name="ApplicationId" inType="win:UInt32" />
            <data name="EventId" inType="win:GUID" />
            <data name="Status" inType="win:HexInt32" />
          </template>

        </templates>

        <templates>
          <!-- GeoCoordinateWatcher templates -->
          <template tid="tGCWLogEvent">
            <data name="InstanceId" inType="win:UInt32" />
            <data name="EventType" inType="win:UInt32" map="GCWEventType" />
            <data name="EventSource" inType="win:UInt32" map="GCWEventSource" />
            <data name="TaskhostSource" inType="win:UInt32" map="TaskhostSource" />
            <data name="CurrentState" inType="win:UInt32" map="CurrentApiState" />
            <data name="Timeout" inType="win:UInt32" />
          </template>

          <template tid="tGCWStateLogEvent">
            <data name="InstanceId" inType="win:UInt32" />
            <data name="GeoStatus" inType="win:UInt32" map="GeoStatusMap" />
            <data name="GeoPermission" inType="win:UInt32" map="GeoPermissionMap" />
          </template>

        </templates>

        <templates>
          <!-- Geofence Tracking templates -->
          <template tid="GeofenceTrigger">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="Trigger" inType="win:UInt32" map="GeofenceTriggerMap" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
          </template>

          <template tid="GeofenceTrackerStateChange">
            <data name="Tracker" inType="win:UInt32" map="GeofenceTrackerMap" />
            <data name="State"   inType="win:UInt32" map="GeofenceTrackerStateMap" />
          </template>

          <template tid="GeofenceTrackerEnable">
            <data name="Tracker" inType="win:UInt32" map="GeofenceTrackerMap" />
            <data name="Enabled" inType="win:Boolean" />
          </template>

          <template tid="GeofenceStateChange">
            <data name="Tracker" inType="win:UInt32" map="GeofenceTrackerMap" />
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="State" inType="win:UInt32" map="GeofenceStateMap" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
          </template>

          <template tid="EndRegionLoad">
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Radius" inType="win:Double" />
            <data name="NumberOfGeofences" inType="win:UInt32" />
          </template>

          <template tid="GeofenceStartTracking">
            <data name="Tracker" inType="win:UInt32" map="GeofenceTrackerMap" />
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Radius" inType="win:Double" />
            <data name="DwellTime" inType="win:UInt64" />
            <data name="StartTime" inType="win:FILETIME" />
            <data name="Duration" inType="win:UInt64" />
            <data name="SingleUse" inType="win:Boolean" />
          </template>

          <template tid="GeofenceStopTracking">
            <data name="Tracker" inType="win:UInt32" map="GeofenceTrackerMap" />
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
          </template>

          <template tid="AddGeofenceToTrackers">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Radius" inType="win:Double" />
            <data name="DwellTime" inType="win:UInt64" />
            <data name="StartTime" inType="win:FILETIME" />
            <data name="Duration" inType="win:UInt64" />
            <data name="SingleUse" inType="win:Boolean" />
            <data name="TrackedGeofencesCount" inType="win:UInt32" />
            <data name="InternalTrackedGeofencesCount" inType="win:UInt32" />
          </template>

          <template tid="RemoveGeofenceFromTrackers">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="TrackedGeofencesCount" inType="win:UInt32" />
            <data name="InternalTrackedGeofencesCount" inType="win:UInt32" />
          </template>

          <template tid="GeofenceNoTrack">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="Radius" inType="win:Double" />
            <data name="DwellTime" inType="win:UInt64" />
            <data name="StartTime" inType="win:FILETIME" />
            <data name="Duration" inType="win:UInt64" />
            <data name="SingleUse" inType="win:Boolean" />
          </template>

          <template tid="GeofenceStartTrackingApplication">
            <data name="AppId" inType="win:UInt32" />
          </template>

          <template tid="GeofenceStopTrackingApplication">
            <data name="AppId" inType="win:UInt32" />
          </template>

          <template tid="GeofenceSessionRequest">
            <data name="Active"   inType="win:Boolean"/>
            <data name="Distance" inType="win:Double" />
            <data name="Accuracy" inType="win:Double" />
          </template>

          <!---KPI templates-->
          <template tid="LocationKpiMetric">
            <data name="Scenario" inType="win:UnicodeString"/>
            <data name="TTFF" inType="win:UInt32"/>
            <data name="Accuracy" inType="win:UInt32"/>
          </template>
        </templates>

        <templates>
          <!-- Geofence Store templates -->
          <template tid="GeofenceStoreAdd">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GeofenceStoreRemove">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GeofenceStoreUpdate">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="TriggerState" inType="win:UInt32" map="GeofenceTriggerMap" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GeofenceStoreGetGeofence">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceId" inType="win:UInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GeofenceStoreDeleteAll">
            <data name="AppId" inType="win:UInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GeofenceStoreGetAppGeofences">
            <data name="AppId" inType="win:UInt32" />
            <data name="GeofenceCount" inType="win:UInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GeofenceStoreGetClosestGeofences">
            <data name="Latitude" inType="win:Double" />
            <data name="Longitude" inType="win:Double" />
            <data name="AppCount" inType="win:UInt32" />
            <data name="GeofenceCount" inType="win:UInt32" />
            <data name="TransitionGeofenceCount" inType="win:UInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GeofenceStoreDeleteApp">
            <data name="AppId" inType="win:UInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GeofenceStoreInternalError">
            <data name="Message" inType="win:UnicodeString"/>
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GeofenceStoreGetAppId">
            <data name="AppContext" inType="win:UnicodeString" />
            <data name="AppId" inType="win:UInt32" />
            <data name="hr" inType="win:UInt32" outType="win:HexInt32"/>
          </template>

          <template tid="GeofencePowerMetric">
            <data name="Scenario" inType="win:UnicodeString" />
          </template>
        </templates>

        <templates>
          <!-- Permission templates -->
          <template tid="PermissionClient">
            <data name="ClientID" inType="win:Pointer" />
            <data name="UserSid" inType="win:UnicodeString"/>
            <data name="PackageFamilyName" inType="win:UnicodeString"/>
          </template>

          <template tid="PermissionDenied">
            <data name="ClientID" inType="win:Pointer" />
            <data name="UnconditionalPermissions" inType="win:UInt32" map="PermissionState"/>
            <data name="PolicyPermissions" inType="win:UInt32" map="PermissionState"/>
            <data name="WinLegacyPolicyPermission" inType="win:UInt32" map="PermissionState"/>
            <data name="MasterPermissions" inType="win:UInt32" map="PermissionState"/>
            <data name="UserPermissions" inType="win:UInt32" map="PermissionState"/>
            <data name="UserWinLegacyPolicyPermissions" inType="win:UInt32" map="PermissionState"/>
            <data name="AppPermissions" inType="win:UInt32" map="PermissionState"/>
            <data name="IsAppContainer" inType="win:Boolean"/>
            <data name="UserSid" inType="win:UnicodeString"/>
            <data name="PackageFamilyName" inType="win:UnicodeString"/>
          </template>
        </templates>

        <templates>
          <!-- WiFi Acquirer -->
          <template tid="tPositionOnFreeWiFiScan">
            <data name="PositionId" inType="win:UInt32"/>
            <data name="InferenceResult" inType="win:UInt32"/>
            <data name="PositionSource" inType="win:UInt32" map="PeName"/>
            <data name="PositionStatus" inType="win:UInt32"/>
          </template>

        </templates>
        <events>

          <!-- TODO: Revisit the keywords assigned to events.
                keywords determine the sessions to which events are logged
                Also, Once the error mechanism and structures are finalized,
                add more specific templates and associate events with templates -->
          <!-- Basic logging-->

          <event
            channel="Debug"
            value="12"
            symbol="_ETWMESSAGE"
            keywords="Error Selfhost"
            task="TraceMessage"
            template="tTraceMessage" />

          <event
            channel="Debug"
            value="13"
            symbol="WerReport"
            keywords="Error Selfhost"
            level="win:Error"
            template="tWerReport"
            message="$(string.Event.WerReport)" />

          <event
            channel="Debug"
            value="14"
            symbol="InitializationEvent"
            keywords="Init Selfhost"
            level="win:Informational"
            template="tLocStringAndHexDword"
            message="$(string.Event.InitializationEvent)" />

          <event
            channel="Debug"
            value="15"
            symbol="GenericOperationResult"
            keywords="Error Selfhost"
            level="win:Informational"
            template="tGenericOperationResult"
            message="$(string.Event.GenericOperationResult)" />

          <event
            channel="Debug"
            value="16"
            symbol="TracelogReport"
            keywords="Error Selfhost"
            level="win:Informational"
            template="tTracelogReport"
            message="$(string.Event.TracelogReport)" />

          <event
              channel="Debug"
              keywords="Error Selfhost"
              level="win:Informational"
              message="$(string.Event.PdcRef)"
              symbol="PdcRef"
              template="tPdcRef"
              value="17"
              />

          <!-- Legacy API -->
          <event
            channel="Debug"
            value="100"
            symbol="LatLonRequest"
            task="LocationSession"
            keywords="FixSession ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tLatLonParameters"
            message="$(string.Event.LatLonRequest)" />

          <event
            channel="Debug"
            value="101"
            symbol="LatLonReport"
            task="LocationSession"
            keywords="Position FixSession ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tLatLonReport"
            message="$(string.Event.LatLonReport)" />

          <!-- GNSS adapter Session Events -->
          <event
            channel="Debug"
            value="200"
            symbol="GnssEventError"
            keywords="Gnss FixSession"
            level="win:Informational"
            opcode="win:Info"
            template="tGnssEventError"
            message="$(string.Event.GnssEventError)" />

          <event
            channel="Debug"
            value="201"
            symbol="GnssAdapterStartFixSession"
            task="LocationSession"
            keywords="Gnss FixSession"
            level="win:Informational"
            opcode="win:Start"
            template="tGnssStartSession"
            message="$(string.Event.GnssAdapterStartFixSession)" />

          <event
            channel="Debug"
            value="202"
            symbol="GnssAdapterStopFixSession"
            task="LocationSession"
            keywords="Gnss FixSession"
            level="win:Informational"
            opcode="win:Stop"
            template="tGnssStopSession"
            message="$(string.Event.GnssAdapterStopFixSession)" />

          <event
            channel="Debug"
            value="203"
            symbol="GnssDriverStartFixSession"
            task="LocationSession"
            keywords="Gnss FixSession"
            level="win:Informational"
            opcode="win:Start"
            template="tGnssStartSession"
            message="$(string.Event.GnssDriverStartFixSession)" />

          <event
            channel="Debug"
            value="204"
            symbol="GnssDriverStopFixSession"
            task="LocationSession"
            keywords="Gnss FixSession"
            level="win:Informational"
            opcode="win:Stop"
            template="tGnssStopSession"
            message="$(string.Event.GnssDriverStopFixSession)" />

          <event
            channel="Debug"
            value="205"
            symbol="GnssPosition"
            task="LocationSession"
            keywords="Gnss Position FixSession"
            level="win:Informational"
            opcode="win:Info"
            template="tGnssLocationInformation"
            message="$(string.Event.GnssPosition)" />

          <event
            channel="Debug"
            value="206"
            symbol="GnssDriverModifyFixSession"
            task="LocationSession"
            keywords="Gnss FixSession"
            level="win:Informational"
            opcode="win:Start"
            template="tGnssModifySession"
            message="$(string.Event.GnssDriverModifyFixSession)" />

          <event
            channel="Debug"
            value="207"
            symbol="GnssDriverIoctlResult"
            task="LocationSession"
            keywords="Gnss FixSession"
            level="win:Informational"
            opcode="win:Start"
            template="tGnssIoctlResult"
            message="$(string.Event.GnssDriverIoctlResult)" />

          <event
            channel="Debug"
            value="208"
            symbol="GnssSatellites"
            task="LocationSession"
            keywords="Gnss FixSession"
            level="win:Informational"
            opcode="win:Start"
            template="tGnssSatellites"
            message="$(string.Event.GnssSatellites)" />

          <event
            channel="Debug"
            value="209"
            symbol="GnssFixEventError"
            keywords="Gnss FixSession"
            level="win:Informational"
            opcode="win:Info"
            template="tGnssFixEventError"
            message="$(string.Event.GnssFixEventError)" />


          <!-- Location Session Events -->
          <event
            channel="Debug"
            value="210"
            symbol="StartSession"
            task="LocationSession"
            keywords="FixSession Selfhost"
            level="win:Informational"
            opcode="win:Start"
            template="tStartSession"
            message="$(string.Event.StartSession)" />

          <event
            channel="Debug"
            value="211"
            symbol="StopSession"
            task="LocationSession"
            keywords="FixSession"
            level="win:Informational"
            opcode="win:Stop"
            template="tStopSession"
            message="$(string.Event.StopSession)" />

          <event
            channel="Debug"
            value="212"
            symbol="SessionPosition"
            task="LocationSession"
            keywords="Position FixSession Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tSessionLocationInformation"
            message="$(string.Event.SessionPosition)" />

          <event
            channel="Debug"
            value="213"
            symbol="SessionCallerInfo"
            task="LocationSession"
            keywords="Position FixSession Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tSessionCallerInfo"
            message="$(string.Event.SessionCallerInfo)" />

          <!-- Orion Events -->
          <event
            channel="Debug"
            value="220"
            symbol="OrionServerTime"
            task="OrionSession"
            keywords="Orion Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tOrionServerTime"
            message="$(string.Event.OrionServerTime)" />

          <event
            channel="Debug"
            value="221"
            symbol="OrionAgnss"
            task="OrionSession"
            keywords="Orion Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tOrionAgnss"
            message="$(string.Event.OrionAgnss)" />

          <event
            channel="Debug"
            value="222"
            symbol="OrionInference"
            task="OrionSession"
            keywords="Orion Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tOrionInference"
            message="$(string.Event.OrionInference)" />

          <!-- Misc GNSS Events -->
          <event
            channel="Debug"
            value="230"
            symbol="SuplHslpConfig"
            task="SuplSession"
            keywords="Supl Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tSuplHslpConfig"
            message="$(string.Event.SuplHslpConfig)" />

          <event
            channel="Debug"
            value="231"
            symbol="V2Uplconfig"
            task="SuplSession"
            keywords="Supl Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tV2Uplconfig"
            message="$(string.Event.V2UplConfig)" />

          <event
            channel="Debug"
            value="232"
            symbol="SuplVersion"
            task="SuplSession"
            keywords="Supl Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tSuplVersion"
            message="$(string.Event.SuplVersion)" />

          <event
            channel="Debug"
            value="233"
            symbol="CertConfig"
            task="SuplSession"
            keywords="Supl Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tSuplCert"
            message="$(string.Event.CertConfig)" />

          <event
            channel="Debug"
            value="234"
            symbol="SendDrivercommandDword"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tDriverCommandDword"
            message="$(string.Event.DriverCommandDword)" />

          <event
            channel="Debug"
            value="235"
            symbol="AgnssInjection"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tAgnssInject"
            message="$(string.Event.AgnssInjection)" />

          <event
            channel="Debug"
            value="236"
            symbol="NiRequest"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tNiRequest"
            message="$(string.Event.NiRequest)" />

          <event
            channel="Debug"
            value="237"
            symbol="NiResponse"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tNiResponse"
            message="$(string.Event.NiResponse)" />

          <event
            channel="Debug"
            value="238"
            symbol="ForceOperationMode"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGnssOperationMode"
            message="$(string.Event.GnssOperationMode)" />

          <event
            channel="Debug"
            value="239"
            symbol="AgnssRequest"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tAgnssRequest"
            message="$(string.Event.AgnssRequest)" />

          <event
            channel="Debug"
            value="240"
            symbol="SuplReconfiguration"
            task="Initialization"
            keywords="Gnss Supl Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tSuplReconfiguration"
            message="$(string.Event.SuplReconfiguration)" />

          <event
            channel="Debug"
            value="241"
            symbol="AgnssClear"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tAgnssClear"
            message="$(string.Event.AgnssClear)" />

          <event
            channel="Debug"
            value="242"
            symbol="AgnssPositionInjection"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tAgnssPositionInject"
            message="$(string.Event.AgnssPositionInjection)" />

          <event
            channel="Debug"
            value="243"
            symbol="AgnssTimeInjection"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tAgnssTimeInject"
            message="$(string.Event.AgnssTimeInjection)" />

          <event
            channel="Debug"
            value="244"
            symbol="AgnssBlobInjection"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tAgnssBlobInject"
            message="$(string.Event.AgnssBlobInjection)" />

          <!--GNSS Adapter Geofence Events-->
          <event
            channel="Debug"
            value="245"
            symbol="GeofenceAdd"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGeofenceAdd"
            message="$(string.Event.GeofenceAdd)" />

          <event
            channel="Debug"
            value="246"
            symbol="GeofenceRemove"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGeofenceRemove"
            message="$(string.Event.GeofenceRemove)" />

          <event
            channel="Debug"
            value="247"
            symbol="ResetGeofenceTracking"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tResetGeofenceTracking"
            message="$(string.Event.ResetGeofenceTracking)" />

          <event
            channel="Debug"
            value="248"
            symbol="GeofenceEvent"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGeofenceEvent"
            message="$(string.Event.GeofenceEvent)" />

          <event
            channel="Debug"
            value="249"
            symbol="TrackingStatus"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tTrackingStatus"
            message="$(string.Event.TrackingStatus)" />

          <!--Note: 265 is in continuation from the Cell PE Events -->
          <event
            channel="Debug"
            value="265"
            symbol="GnssError"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGnssError"
            message="$(string.Event.GnssError)" />

          <event
            channel="Debug"
            value="266"
            symbol="OnGnssPnP"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tOnGnssPnP"
            message="$(string.Event.OnGnssPnP)" />

          <event
            channel="Debug"
            value="267"
            symbol="PnPDeviceArrival"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tPnPDeviceArrival"
            message="$(string.Event.PnPDeviceArrival)" />

          <event
            channel="Debug"
            value="268"
            symbol="PnPDeviceRemoval"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tPnPDeviceRemoval"
            message="$(string.Event.PnPDeviceRemoval)" />

          <event
            channel="Debug"
            value="269"
            symbol="PnPDeviceAttachRetry"
            task="Initialization"
            keywords="Gnss Init Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tPnPDeviceAttachRetry"
            message="$(string.Event.PnPDeviceAttachRetry)" />

          <!-- Cell PE Events -->
          <event
            channel="Debug"
            value="250"
            symbol="GsmBeacon"
            task="CellPE"
            keywords="CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGsmBeacon"
            message="$(string.Event.GsmBeacon)" />

          <event
            channel="Debug"
            value="251"
            symbol="UmtsBeacon"
            task="CellPE"
            keywords="CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tUmtsBeacon"
            message="$(string.Event.UmtsBeacon)" />

          <event
            channel="Debug"
            value="252"
            symbol="CdmaBeacon"
            task="CellPE"
            keywords="CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tCdmaBeacon"
            message="$(string.Event.CdmaBeacon)" />

          <event
            channel="Debug"
            value="253"
            symbol="LteBeacon"
            task="CellPE"
            keywords="CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tLteBeacon"
            message="$(string.Event.LteBeacon)" />

          <event
            channel="Debug"
            value="254"
            symbol="CellNeighbors"
            task="CellPE"
            keywords="CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tCellNeighbors"
            message="$(string.Event.CellNeighbors)" />

          <event
            channel="Debug"
            value="255"
            symbol="TdscdmaBeacon"
            task="CellPE"
            keywords="CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tTdscdmaBeacon"
            message="$(string.Event.TdscdmaBeacon)" />

          <event
            channel="Debug"
            value="256"
            symbol="CellLocationUpdate"
            task="CellPE"
            keywords="CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tCellLocationUpdate"
            message="$(string.Event.CellLocationUpdate)" />

          <event
            channel="Debug"
            value="257"
            symbol="CellLocationUpdateErrorState"
            task="CellPE"
            keywords="CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tLocHexResult"
            message="$(string.Event.CellLocationUpdateErrorState)" />

          <event
            channel="Debug"
            value="258"
            symbol="CellNeighborsBeaconHash"
            task="CellPE"
            keywords="CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tCellNeighborsBeaconHash"
            message="$(string.Event.CellNeighborsBeaconHash)" />

          <!-- CellPeAdvance -->
          <event
            channel="Debug"
            value="259"
            symbol="CellLocationMulticell"
            task="CellPEAdvance"
            keywords="CellPe Selfhost"
            level="win:Verbose"
            opcode="win:Info"
            template="tCellLocationMulticell"
            message="$(string.Event.CellLocationMulticell)" />

          <!-- Common PE Events -->
          <event
            channel="Debug"
            value="270"
            symbol="ServerCache"
            task="CommonPE"
            keywords="WifiPe CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tServerCache"
            message="$(string.Event.ServerCache)" />

          <event
            channel="Debug"
            value="271"
            symbol="TileCache"
            task="CommonPE"
            keywords="WifiPe CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tTileCache"
            message="$(string.Event.TileCache)" />

          <event
            channel="Debug"
            value="272"
            symbol="AdapterScanResult"
            task="CommonPE"
            keywords="WifiPe CellPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tAdapterScanResult"
            message="$(string.Event.AdapterScanResult)" />

          <!-- VenuePE -->
          <event
              channel="Debug"
              value="273"
              symbol="CachedPositionsForEZ"
              task="VenuePE"
              keywords="VenuePE Selfhost"
              level="win:Informational"
              opcode="win:Info"
              template="tCachedPositionsForEZ"
              message="$(string.Event.CachedPositionsForEZ)" />

          <event
             channel="Debug"
             value="274"
             symbol="VenueTransitionDetected"
             task="VenuePE"
             keywords="VenuePE Selfhost"
             level="win:Informational"
             opcode="win:Info"
             template="tVenueTransitionDetected"
             message="$(string.Event.VenueTransitionDetected)" />

          <!-- Crowdsource Events -->
          <event
            channel="Debug"
            value="280"
            symbol="InitializeDcpProfile"
            task="Crowdsource"
            keywords="Crowdsource Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tDcpApiResult"
            message="$(string.Event.InitializeDcpProfile)" />

          <event
            channel="Debug"
            value="281"
            symbol="SubmitData"
            task="Crowdsource"
            keywords="Crowdsource Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tSubmitCrowdsourceData"
            message="$(string.Event.SubmitData)" />

          <event
            channel="Debug"
            value="282"
              symbol="DataReceived"
              task="Crowdsource"
              keywords="Crowdsource Selfhost"
              level="win:Verbose"
              opcode="win:Info"
              template="tDataReceived"
              message="$(string.Event.DataReceived)" />

          <event
            channel="Debug"
            value="283"
              symbol="DataProcessingStart"
              task="Crowdsource"
              keywords="Crowdsource Selfhost"
              level="win:Verbose"
              opcode="win:Info"
              template="tDataProcessingStart"
              message="$(string.Event.DataProcessingStart)" />

          <event
            channel="Debug"
            value="284"
              symbol="CrowdsourceState"
              task="Crowdsource"
              keywords="Crowdsource Selfhost"
              level="win:Informational"
              opcode="win:Info"
              template="tCrowdsourceState"
              message="$(string.Event.CrowdsourceState)" />


          <!-- Composite PE Events -->
          <event
            channel="Debug"
            value="290"
             symbol="SelectedPes"
             task="CompositePE"
             keywords="CompositePe Selfhost"
             level="win:Verbose"
             opcode="win:Info"
             template="tSelectedPes"
             message="$(string.Event.SelectedPes)" />

          <event
            channel="Debug"
            value="291"
             symbol="StartPrimitivePes"
             task="CompositePE"
             keywords="CompositePe Selfhost"
             level="win:Verbose"
             opcode="win:Info"
             template="tStartPrimitivePes"
             message="$(string.Event.StartPrimitivePes)" />

          <event
            channel="Debug"
            value="292"
             symbol="AttemptFallback"
             task="CompositePE"
             keywords="CompositePe Selfhost"
             level="win:Informational"
             opcode="win:Info"
             template="tAttemptFallback"
             message="$(string.Event.AttemptFallback)" />

          <event
            channel="Debug"
            value="294"
             symbol="DTWaitBetweenRequests"
             task="CompositePE"
             keywords="CompositePe Selfhost"
             level="win:Informational"
             opcode="win:Info"
             template="tDTWaitBetweenRequests"
             message="$(string.Event.DTWaitBetweenRequests)" />

          <event
             channel="Debug"
             value="295"
              symbol="NewSpeedEstimate"
              task="CompositePE"
              keywords="SpeedEstimatorTracing"
              level="win:Verbose"
              opcode="win:Info"
              template="tSpeedEstimate"
              message="$(string.Event.NewSpeedEstimate)" />


          <event
            channel="Debug"
            value="296"
             symbol="SpeedEstimatorInput"
             task="CompositePE"
             keywords="SpeedEstimatorTracing"
             level="win:Verbose"
             opcode="win:Info"
             template="tSpeedEstimatorInput"
             message="$(string.Event.SpeedEstimatorInput)" />

          <event
            channel="Debug"
            value="298"
             symbol="UnreliablePositionDetected"
             task="CompositePE"
             keywords="CompositePe Selfhost"
             level="win:Informational"
             opcode="win:Info"
             template="tUnreliablePositionDetected"
             message="$(string.Event.UnreliablePositionDetected)" />

          <event
            channel="Debug"
            value="299"
             symbol="CandidatePes"
             task="CompositePE"
             keywords="CompositePe Selfhost"
             level="win:Informational"
             opcode="win:Info"
             template="tCandidatePes"
             message="$(string.Event.CandidatePes)" />

          <event
            channel="Debug"
            value="401"
             symbol="MDStart"
             task="CompositePE"
             keywords="CompositePe Selfhost"
             level="win:Informational"
             opcode="win:Info"
             template="tMDStart"
             message="$(string.Event.MDStart)" />

          <event
            channel="Debug"
            value="402"
             symbol="MDStop"
             task="CompositePE"
             keywords="CompositePe Selfhost"
             level="win:Informational"
             opcode="win:Info"
             template="tMDEvent"
             message="$(string.Event.MDStop)" />

          <event
           channel="Debug"
           value="403"
            symbol="MDNotifyMovement"
            task="CompositePE"
            keywords="CompositePe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tMDEvent"
            message="$(string.Event.MDNotifyMovement)" />

          <event
            channel="Debug"
            value="404"
             symbol="MDNotifyStateChanged"
             task="CompositePE"
             keywords="CompositePe Selfhost"
             level="win:Informational"
             opcode="win:Info"
             template="tMDEvent"
             message="$(string.Event.MDNotifyStateChanged)" />

          <event
            channel="Debug"
            value="405"
            symbol="MDGetMovementPrecision"
             task="CompositePE"
             keywords="CompositePe Selfhost"
             level="win:Informational"
             opcode="win:Info"
             template="tMDGetMovementPrecision"
             message="$(string.Event.MDGetMovementPrecision)" />


          <event
            channel="Debug"
            value="406"
            symbol="OffloadedAcquireStartTracking"
            task="CompositePE"
            keywords="CompositePe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tOffloadedAcquireStartTracking"
            message="$(string.Event.OffloadedAcquireStartTracking)" />

          <event
            channel="Debug"
            value="407"
            symbol="OffloadedAcquireSupport"
            task="CompositePE"
            keywords="CompositePe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tOffloadedAcquireSupport"
            message="$(string.Event.OffloadedAcquireSupport)" />

        </events>

        <!-- Events defined for WebproxyTracing -->
        <events>
          <event
            channel="Debug"
            value="300"
            symbol="WebproxyRequest"
            task="WebproxyRequest"
            keywords="Selfhost Orion WebproxyTracing"
            level="win:Informational"
            opcode="win:Info"
            template="tRequestParameters"
            message="$(string.Event.WebproxyRequest)" />

          <event
            channel="Debug"
            value="301"
            symbol="WebproxyInferenceResult"
            task="WebproxyResponse"
            keywords="Selfhost Orion WebproxyTracing"
            level="win:Informational"
            opcode="win:Info"
            template="tInferenceResult"
            message="$(string.Event.WebproxyInferenceResult)" />

          <event
            channel="Debug"
            value="303"
            symbol="WebproxyAgnssResult"
            task="WebproxyResponse"
            keywords="Selfhost Orion WebproxyTracing"
            level="win:Informational"
            opcode="win:Info"
            template="tRequestResult"
            message="$(string.Event.WebproxyAgnssResult)" />

          <event
            channel="Debug"
            value="304"
            symbol="WebproxyTileResult"
            task="WebproxyResponse"
            keywords="Selfhost Orion WebproxyTracing"
            level="win:Informational"
            opcode="win:Info"
            template="tRequestResult"
            message="$(string.Event.WebproxyTileResult)" />

          <event
            channel="Debug"
            value="306"
            symbol="RequestCanceled"
            task="Canceled"
            keywords="Selfhost Orion WebproxyTracing"
            level="win:Informational"
            opcode="win:Info"
            template="tRequestCanceled"
            message="$(string.Event.RequestCanceled)" />

          <event
            channel="Debug"
            value="307"
            symbol="WinHttpEvent"
            task="WinHttpEvent"
            keywords="WebproxyTracing"
            level="win:Verbose"
            opcode="win:Info"
            template="tWebproxyWinHttpEventUpdate"
            message="$(string.Event.WebproxyWinHttpEvent)" />

          <event
            channel="Debug"
            value="308"
            symbol="WinHttpAPICall"
            task="WinHttpAPICall"
            keywords="WebproxyTracing"
            level="win:Verbose"
            opcode="win:Info"
            template="tWebproxyWinHttpApiCall"
            message="$(string.Event.WebproxyWinHttpApiCall)" />

          <event
            channel="Debug"
            value="309"
            symbol="WebproxyRequestInfo"
            task="WebproxyRequestInfo"
            keywords="WebproxyTracing"
            level="win:Verbose"
            opcode="win:Info"
            template="tWebproxyPayloadInfo"
            message="$(string.Event.WebproxyRequestInfo)" />

          <event
            channel="Debug"
            value="310"
            symbol="WebproxyAnsiResponseInfo"
            task="WebproxyResponseInfo"
            keywords="WebproxyTracing"
            level="win:Verbose"
            opcode="win:Info"
            template="tWebproxyAnsiPayloadInfo"
            message="$(string.Event.WebproxyResponseInfo)" />
        </events>

        <!-- Event defined for WiFiTracing -->
        <events>
          <event
            channel="Debug"
            value="260"
            symbol="WiFiAccessPoint"
            task="WiFiAdapter"
            keywords="WiFiTracing"
            level="win:Verbose"
            opcode="win:Info"
            template="tWiFiAccessPoint"
            message="$(string.Event.WiFiAccessPoint)" />

          <event
            channel="Debug"
            value="261"
            symbol="WifiConnectionStateChange"
            task="WiFiAdapter"
            keywords="Selfhost WiFiTracing"
            level="win:Informational"
            opcode="win:Info"
            template="tWiFiConnectionStateChange"
            message="$(string.Event.WifiConnectionStateChange)" />

          <event
            channel="Debug"
            value="262"
            symbol="WiFiMacAddressList"
            task="WiFiAdapter"
            keywords="WiFiTracing"
            level="win:Informational"
            opcode="win:Info"
            template="tWiFiMacAddressList"
            message="$(string.Event.WiFiMacAddressList)" />
        </events>

        <!-- Geolocation events -->
        <events>
          <event
            channel="Debug"
            value="500"
            symbol="GeolocationStartOperation"
            task="Geolocation"
            keywords="FixSession ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGeolocationStartOperation"
            message="$(string.Event.GeolocationStartOperation)" />

          <event
            channel="Debug"
            value="501"
            symbol="GeolocationStartOperationResult"
            task="Geolocation"
            keywords="FixSession ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGeolocationStartOperationResult"
            message="$(string.Event.GeolocationStartOperationResult)" />

          <event
            channel="Debug"
            value="502"
            symbol="GeolocationEventHandler"
            task="Geolocation"
            keywords="Position FixSession ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGeolocationEventHandler"
            message="$(string.Event.GeolocationEventHandler)" />

          <event
            channel="Debug"
            value="503"
            symbol="GeolocationStopTrackingOperation"
            task="Geolocation"
            keywords="Position FixSession ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGeolocationStopTrackingOperation"
            message="$(string.Event.GeolocationStopTrackingOperation)" />

          <event
            channel="Debug"
            value="504"
            symbol="GeolocationPromptAppState"
            task="Geolocation"
            keywords="ClientApi"
            level="win:Verbose"
            opcode="win:Info"
            template="tGeolocationPromptAppState"
            message="$(string.Event.GeolocationPromptAppState)" />

          <!-- Geofence client api events-->

          <event
            channel="Debug"
            value="525"
            symbol="GfClientOperationAddGeofence"
            task="Geofencing"
            keywords="ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGfClientOperationAddOrRemoveGeofence"
            message="$(string.Event.GfClientOperationAddGeofence)" />

          <event
            channel="Debug"
            value="526"
            symbol="GfClientOperationRemoveGeofence"
            task="Geofencing"
            keywords="ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGfClientOperationAddOrRemoveGeofence"
            message="$(string.Event.GfClientOperationRemoveGeofence)" />

          <event
            channel="Debug"
            value="527"
            symbol="GfClientOperationClearAllGeofences"
            task="Geofencing"
            keywords="ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            message="$(string.Event.GfClientOperationClearAllGeofences)" />

          <event
            channel="Debug"
            value="528"
            symbol="GfClientRegisterForChanges"
            task="Geofencing"
            keywords="ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGfClientRegisterForChanges"
            message="$(string.Event.GfClientRegisterForChanges)" />

          <event
            channel="Debug"
            value="529"
            symbol="GfClientUnregisterForChanges"
            task="Geofencing"
            keywords="ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGfClientUnregisterForChanges"
            message="$(string.Event.GfClientUnregisterForChanges)" />

          <event
            channel="Debug"
            value="530"
            symbol="GfClientReadGeofenceReports"
            task="Geofencing"
            keywords="ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            message="$(string.Event.GfClientReadGeofenceReports)" />

          <event
            channel="Debug"
            value="531"
            symbol="GfClientSignalled"
            task="Geofencing"
            keywords="ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGfClientSignalled"
            message="$(string.Event.GfClientSignalled)" />

          <event
            channel="Debug"
            value="532"
            symbol="GfClientCreateTrigger"
            task="Geofencing"
            keywords="ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGfClientCreateOrDeleteTrigger"
            message="$(string.Event.GfClientCreateTrigger)" />

          <event
            channel="Debug"
            value="533"
            symbol="GfClientDeleteTrigger"
            task="Geofencing"
            keywords="ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGfClientCreateOrDeleteTrigger"
            message="$(string.Event.GfClientDeleteTrigger)" />

          <event
            channel="Debug"
            value="534"
            symbol="GeofenceData"
            task="Geofencing"
            keywords="ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGeofenceData"
            message="$(string.Event.GeofenceData)" />


          <event
            channel="Debug"
            value="550"
            symbol="GeofenceOperationResult"
            task="Geofencing"
            keywords="ClientApi Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGeofenceOperationResult"
            message="$(string.Event.GeofenceOperationResult)" />

          <event
            channel="Debug"
            value="551"
            symbol="GeofenceTriggerOperationResult"
            task="Geofencing"
            keywords="Selfhost ClientApi"
            level="win:Informational"
            opcode="win:Info"
            template="tGeofenceTriggerOperationResult"
            message="$(string.Event.GeofenceTriggerOperationResult)" />

          <event
            channel="Debug"
            value="552"
            symbol="GeofenceEventTriggerOperation"
            task="Geofencing"
            keywords="Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGeofenceEventTriggerOperation"
            message="$(string.Event.GeofenceEventTriggerOperation)" />

          <!-- Geofence service events-->

          <event
            channel="Debug"
            value="553"
           symbol="GfOperationAddGeofence"
           task="Geofencing"
           keywords="Selfhost"
           level="win:Informational"
           opcode="win:Info"
           template="tGfOperationAddGeofence"
           message="$(string.Event.GfOperationAddGeofence)" />

          <event
            channel="Debug"
            value="554"
           symbol="GfOperationRemoveGeofence"
           task="Geofencing"
           keywords="Selfhost"
           level="win:Informational"
           opcode="win:Info"
           template="tGfOperationRemoveGeofence"
           message="$(string.Event.GfOperationRemoveGeofence)" />

          <event
            channel="Debug"
            value="555"
           symbol="GfOperationRemoveAllGeofences"
           task="Geofencing"
           keywords="Selfhost"
           level="win:Informational"
           opcode="win:Info"
           template="tGfOperationRemoveAllGeofences"
           message="$(string.Event.GfOperationRemoveAllGeofences)" />

          <event
            channel="Debug"
            value="556"
           symbol="GfOperationListAllGeofences"
           task="Geofencing"
           keywords="Selfhost"
           level="win:Informational"
           opcode="win:Info"
           template="tGfOperationListAllGeofences"
           message="$(string.Event.GfOperationListAllGeofences)" />

          <event
             channel="Debug"
             value="557"
            symbol="GfOperationReadGeofenceReports"
            task="Geofencing"
            keywords="Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGfOperationReadGeofenceReports"
            message="$(string.Event.GfOperationReadGeofenceReports)" />

          <event
            channel="Debug"
            value="558"
           symbol="GeofenceReport"
           task="Geofencing"
           keywords="Selfhost"
           level="win:Informational"
           opcode="win:Info"
           template="tGeofenceReport"
           message="$(string.Event.GeofenceReport)" />

          <event
            channel="Debug"
            value="559"
            symbol="GfForegroundEventFired"
            task="Geofencing"
            keywords="Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGfForegroundEventFired"
            message="$(string.Event.GfForegroundEventFired)" />

          <event
            channel="Debug"
            value="560"
            symbol="GfBackgroundEventSignalled"
            task="Geofencing"
            keywords="Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGfBackgroundEventSignalled"
            message="$(string.Event.GfBackgroundEventSignalled)" />

        </events>

        <events>
          <!-- GeoCoordinateWatcher Managed APIs events -->

          <event
            channel="Debug"
            value="600"
            symbol="GCWLogEvent"
            task="GCWLogEvent"
            keywords="ManagedApi ClientApi FixSession Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGCWLogEvent"
            message="$(string.Event.GCWLogEvent)" />

          <event
            channel="Debug"
            value="601"
            symbol="GCWStateLogEvent"
            task="GCWStateLogEvent"
            keywords="ManagedApi ClientApi FixSession Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tGCWStateLogEvent"
            message="$(string.Event.GCWStateLogEvent)" />

        </events>

        <events>
          <!-- Geofence Tracker -->

          <event
            channel="Debug"
            value="700"
            symbol="GeofenceTrigger"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceTrigger"
            message="$(string.Event.GeofenceTrigger)" />

          <event
            channel="Debug"
            value="701"
            symbol="GeofenceStateChange"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStateChange"
            message="$(string.Event.GeofenceStateChange)" />

          <event
            channel="Debug"
            value="702"
            symbol="BeginRegionLoad"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            message="$(string.Event.BeginRegionLoad)" />

          <event
            channel="Debug"
            value="703"
            symbol="EndRegionLoad"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="EndRegionLoad"
            message="$(string.Event.EndRegionLoad)" />

          <event
            channel="Debug"
            value="704"
            symbol="GeofenceStartTrackingApplication"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStartTrackingApplication"
            message="$(string.Event.GeofenceStartTrackingApplication)" />

          <event
            channel="Debug"
            value="705"
            symbol="GeofenceStopTrackingApplication"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStopTrackingApplication"
            message="$(string.Event.GeofenceStopTrackingApplication)" />

          <event
            channel="Debug"
            value="706"
            symbol="GeofenceStartTracking"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStartTracking"
            message="$(string.Event.GeofenceStartTracking)" />

          <event
            channel="Debug"
            value="707"
            symbol="GeofenceStopTracking"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStopTracking"
            message="$(string.Event.GeofenceStopTracking)" />

          <event
            channel="Debug"
            value="708"
            symbol="GeofenceSessionRequest"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceSessionRequest"
            message="$(string.Event.GeofenceSessionRequest)" />

          <event
            channel="Debug"
            value="709"
            symbol="GeofenceNoTrack"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceNoTrack"
            message="$(string.Event.GeofenceNoTrack)" />

          <event
            channel="Debug"
            value="710"
            symbol="GeofenceTrackerStateChange"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceTrackerStateChange"
            message="$(string.Event.GeofenceTrackerStateChange)" />

          <event
            channel="Debug"
            value="711"
            symbol="GeofenceTrackerEnable"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceTrackerEnable"
            message="$(string.Event.GeofenceTrackerEnable)" />

          <event
            channel="Debug"
            value="712"
            symbol="AddGeofenceToTrackers"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="AddGeofenceToTrackers"
            message="$(string.Event.AddGeofenceToTrackers)" />

          <event
            channel="Debug"
            value="713"
            symbol="RemoveGeofenceFromTrackers"
            task="GeofenceTracking"
            keywords="GeofenceTracking Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="RemoveGeofenceFromTrackers"
            message="$(string.Event.RemoveGeofenceFromTrackers)" />

        </events>

        <events>
          <!--KPI Performance-->
          <event
            channel="Debug"
            value="800"
            symbol="LocationKpiMetric"
            task="LocationSession"
            keywords="Performance Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="LocationKpiMetric"
            message="$(string.Event.LocationKpiMetric)" />
        </events>

        <events>
          <!-- Geofence Store -->
          <event
            channel="Debug"
            value="900"
            symbol="GeofenceStoreAdd"
            task="GeofenceStore"
            keywords="GeofenceStore Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStoreAdd"
            message="$(string.Event.GeofenceStoreAdd)" />

          <event
            channel="Debug"
            value="901"
            symbol="GeofenceStoreRemove"
            task="GeofenceStore"
            keywords="GeofenceStore Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStoreRemove"
            message="$(string.Event.GeofenceStoreRemove)" />

          <event
            channel="Debug"
            value="902"
            symbol="GeofenceStoreUpdate"
            task="GeofenceStore"
            keywords="GeofenceStore Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStoreUpdate"
            message="$(string.Event.GeofenceStoreUpdate)" />

          <event
            channel="Debug"
            value="903"
            symbol="GeofenceStoreGetGeofence"
            task="GeofenceStore"
            keywords="GeofenceStore Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStoreGetGeofence"
            message="$(string.Event.GeofenceStoreGetGeofence)" />

          <event
            channel="Debug"
            value="904"
            symbol="GeofenceStoreDeleteAll"
            task="GeofenceStore"
            keywords="GeofenceStore Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStoreDeleteAll"
            message="$(string.Event.GeofenceStoreDeleteAll)" />

          <event
            channel="Debug"
            value="905"
            symbol="GeofenceStoreGetAppGeofences"
            task="GeofenceStore"
            keywords="GeofenceStore Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStoreGetAppGeofences"
            message="$(string.Event.GeofenceStoreGetAppGeofences)" />

          <event
            channel="Debug"
            value="906"
            symbol="GeofenceStoreGetClosestGeofences"
            task="GeofenceStore"
            keywords="GeofenceStore Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStoreGetClosestGeofences"
            message="$(string.Event.GeofenceStoreGetClosestGeofences)" />

          <event
            channel="Debug"
            value="907"
            symbol="GeofenceStoreDeleteApp"
            task="GeofenceStore"
            keywords="GeofenceStore Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStoreDeleteApp"
            message="$(string.Event.GeofenceStoreDeleteApp)" />

          <event
            channel="Debug"
            value="908"
            symbol="GeofenceStoreInternalError"
            task="GeofenceStore"
            keywords="GeofenceStore Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStoreInternalError"
            message="$(string.Event.GeofenceStoreInternalError)" />

          <event
            channel="Debug"
            value="909"
            symbol="GeofenceStoreGetAppId"
            task="GeofenceStore"
            keywords="GeofenceStore Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="GeofenceStoreGetAppId"
            message="$(string.Event.GeofenceStoreGetAppId)" />

        </events>

        <events>
          <!--Geofence Power-->
          <event
            channel="Debug"
            value="1000"
            symbol="GeofencePowerStart"
            task="GeofencePower"
            keywords="Performance Selfhost"
            level="win:Informational"
            opcode="win:Start"
            template="GeofencePowerMetric"
            message="$(string.Event.GeofencePowerStart)" />

          <event
            channel="Debug"
            value="1001"
            symbol="GeofencePowerStop"
            task="GeofencePower"
            keywords="Performance Selfhost"
            level="win:Informational"
            opcode="win:Stop"
            template="GeofencePowerMetric"
            message="$(string.Event.GeofencePowerStop)" />

        </events>

        <events>
          <!-- Permissions -->
          <event
            channel="Debug"
            value="1100"
            symbol="PermissionDenied"
            task="Permissions"
            keywords="Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="PermissionDenied"
            message="$(string.Event.PermissionDenied)" />

          <event
            channel="Debug"
            value="1101"
            symbol="PermissionDeniedNotFound"
            task="Permissions"
            keywords="Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="PermissionClient"
            message="$(string.Event.PermissionDeniedNotFound)" />
        </events>

        <events>
          <!-- Connected/Modern standby -->
          <event
            channel="Debug"
            value="1200"
            symbol="ModernStandbyDisableGeofencing"
            task="Misc"
            keywords="Selfhost"
            level="win:Informational"
            opcode="win:Info"
            message="$(string.Misc.ModernStandbyDisableGeofencing)" />

          <event
            channel="Debug"
            value="1201"
            symbol="ModernStandbyEnableGeofencing"
            task="Misc"
            keywords="Selfhost"
            level="win:Informational"
            opcode="win:Info"
            message="$(string.Misc.ModernStandbyEnableGeofencing)" />
        </events>

        <events>
          <!-- WiFi Acquire -->
          <event
            channel="Debug"
            value="1250"
            symbol="PositionOnFreeWiFiScan"
            task="WifiPE"
            keywords="WiFiTracing WifiPe Selfhost"
            level="win:Informational"
            opcode="win:Info"
            template="tPositionOnFreeWiFiScan"
            message="$(string.Event.PositionOnFreeWiFiScan)" />
        
          <!-- SUPL Config -->
          <event
              channel="Debug"
              symbol="SuplPushConfiguration"
              task="Initialization"
              keywords="Gnss Supl Init Selfhost"
              level="win:Informational"
              opcode="win:Info"
              template="tSuplPushConfiguration"
              message="$(string.Event.SuplPushConfiguration)"
              value="1251"
              />
        </events>
      </provider>
    </events>
  </instrumentation>


  <localization>
    <resources culture="en-US">
      <stringTable>
        <string id="Provider.LocationServiceProvider"       value="LocationServiceProvider" />
        <string id="Channel.LocationServiceProvider.Debug"  value="Debug" />
      </stringTable>

      <!-- Misc -->
      <stringTable>
        <string id="Misc.ModernStandbyDisableGeofencing" value="Disabling geofencing because we are entering into Disconnected standby" />
        <string id="Misc.ModernStandbyEnableGeofencing" value="Re-enabling geofencing because we are exiting Disconnected standby" />
      </stringTable>

      <!-- Common string table for ALL event types -->
      <stringTable>
        <string id="Map.ORION_RESPONSE_OK"                 value="OK" />
        <string id="Map.ORION_RESPONSE_NOT_RESOLVABLE"     value="Not resolvable" />
        <string id="Map.ORION_RESPONSE_INVALID_PARAMETER"  value="Invalid parameter" />
        <string id="Map.ORION_SERVER_ERROR"                value="Server Error" />
        <string id="Map.ORION_RESPONSE_INVALID_PAYLOAD"    value="Invalid Server Response" />
        <string id="Map.ORION_RESPONSE_OTHER_FAILURE"      value="Other failure" />
        <string id="Map.WINHTTP_NO_CM_CONNECTION"          value="WinHttp: No CM Connection"/>
        <string id="Map.WINHTTP_NOT_REDIRECTED"            value="WinHttp: Not Redirected"/>
        <string id="Map.ORION_CLIENT_ERROR"                value="Connectivity Error" />
      </stringTable>


      <!-- string table defined for Location service Selfhost events -->
      <stringTable>
        <string id="Map.LocationProviderHelper"                  value="ProviderHelper"/>
        <string id="Map.LocationSession"                         value="Session"/>
        <string id="Map.LocationInformation"                     value="LocationInformation"/>
        <string id="Map.LocationServiceProxy"                    value="ServiceProxy"/>

        <string id="Map.CpeLocationProvider"                     value="Cpe"/>
        <string id="Map.CpeLocationAcquireSingleShot"            value="CpeAcquireSingleShot"/>
        <string id="Map.CpeLocationAcquirePeriodicTracking"      value="CpeAcquirePeriodicTracking"/>
        <string id="Map.CpeLocationAcquireDistanceTracking"      value="CpeAcquireDistanceTracking"/>

        <string id="Map.WifiPeLocationProvider"                  value="WifiPe"/>
        <string id="Map.WifiPeLocationAdapter"                   value="WifiPeAdapter"/>
        <string id="Map.WifiPeLocationAcquireSingleShot"         value="WifiPeAcquireSingleShot"/>

        <string id="Map.WiFiDisconnected"                        value="WiFiDisconnected" />
        <string id="Map.WiFiConnecting"                          value="WiFiConnecting" />
        <string id="Map.WiFiWaitingForIp"                        value="WiFiWaitingForIp" />
        <string id="Map.WiFiExtAuth"                             value="WiFiExtAuth" />
        <string id="Map.WiFiHijacked"                            value="WiFiHijacked" />
        <string id="Map.WiFiConnected"                           value="WiFiConnected" />
        <string id="Map.WiFiDisconnecting"                       value="WiFiDisconnecting" />
        <string id="Map.WiFiDisconnectingHijacked"               value="WiFiDisconnectingHijacked" />
        <string id="Map.WiFiDisconnectingNoInternet"             value="WiFiDisconnectingNoInternet" />

        <string id="Map.CellPeLocationProvider"                  value="CellPe"/>
        <string id="Map.CellPeLocationAdapter"                   value="CellPeAdapter"/>
        <string id="Map.CellPeLocationAcquireSingleShot"         value="CellPeAcquireSingleShot"/>

        <string id="Map.GnssPeLocationProvider"                  value="GnssPe"/>
        <string id="Map.GnssPeLocationAcquireSingleShot"         value="GnssPeAcquireSingleShot"/>
        <string id="Map.GnssPeLocationAcquirePeriodicTracking"   value="GnssPeAcquirePeriodicTracking"/>
        <string id="Map.GnssPeLocationAcquireDistanceTracking"   value="GnssPeAcquireDistanceTracking"/>

        <string id="Map.GnssAdapter"            value="GnssAdapter"/>

        <string id="Map.Crowdsource"            value="Crowdsource"/>

        <string id="Map.Invalid"                value="Invalid" />
        <string id="Map.SingleShot"             value="SingleShot" />
        <string id="Map.Distance"               value="Distance" />
        <string id="Map.PeriodicTracking"       value="Periodic" />
        <string id="Map.Geofence"               value="Geofence" />
        <string id="Map.Passive"                value="Passive" />

        <string id="Map.GnssSingleShot"         value="SingleShot" />
        <string id="Map.GnssDistanceTracking"   value="Distance" />
        <string id="Map.GnssContinuousTracking"  value="Periodic" />
        <string id="Map.GnssLKG"                value="LKG" />

        <string id="Map.AccuracySpecific"       value="AccuracySpecific" />
        <string id="Map.AccuracyAny"            value="AccuracyAny" />
        <string id="Map.AccuracyHighest"        value="AccuracyHighest" />

        <string id="Map.AccuracyHigh"           value="AccuracyHigh" />
        <string id="Map.AccuracyPowerOptimized" value="AccuracyPowerOptimized" />
        <string id="Map.GenerateLast"           value="GenerateLast" />
        <string id="Map.GenerateFirst"          value="GenerateFirst" />
        <string id="Map.GenerateBest"           value="GenerateBest" />

        <string id="Map.UnknownPe"              value="Unknown" />
        <string id="Map.CompositePe"            value="Cpe" />
        <string id="Map.GnssPe"                 value="Gnss" />
        <string id="Map.WifiPe"                 value="Wifi" />
        <string id="Map.CellPe"                 value="Cell" />
        <string id="Map.VenuePe"                value="Venue" />
        <string id="Map.IpAddrPe"               value="IpAddr" />
        <string id="Map.UserPe"                 value="User" />
        <string id="Map.LegacyPe"               value="Legacy" />

        <string id="Map.DcpPrimaryProfile"      value="TimeBound" />
        <string id="Map.DcpSecondaryProfile"    value="BestEffort" />

        <string id="Map.CsLevelLow"             value="Low" />
        <string id="Map.CsLevelMedium"          value="Medium" />
        <string id="Map.CsLevelHigh"            value="High" />

        <string id="Map.CollectionTypeNone"     value="None" />
        <string id="Map.CollectionTypeCell"     value="Cell" />
        <string id="Map.CollectionTypeWiFi"     value="WiFi" />
        <string id="Map.CollectionTypeAll"      value="All" />

        <string id="Map.PeRolePrimary"          value="Primary" />
        <string id="Map.PeRoleFallback"         value="Fallback" />

        <string id="Map.CertInject"             value="Inject" />
        <string id="Map.CertDelete"             value="Delete" />
        <string id="Map.CertPurge"              value="Purge" />

        <string id="Map.AgnssTimeInjection"           value="Time" />
        <string id="Map.AgnssPositionInjection"       value="Position" />
        <string id="Map.AgnssBlobInjection"           value="Blob" />

        <string id="Map.AgnssBlobFormatXtra1"         value="XTRA1" />
        <string id="Map.AgnssBlobFormatXtra2"         value="XTRA2" />
        <string id="Map.AgnssBlobFormatXtra3"         value="XTRA3" />
        <string id="Map.AgnssBlobFormatLto"           value="LTO" />

        <string id="Map.NiRequestSingleShot"          value="SingleShot" />
        <string id="Map.NiRequestAreaTrigger"         value="AreaTrigger" />

        <string id="Map.SUPL_TRIGGER_UNKNOWN"         value="Unknown" />
        <string id="Map.SUPL_TRIGGER_CAN_REMOVED"     value="CAN_Removed" />
        <string id="Map.SUPL_TRIGGER_CSP_UPDATE"      value="Csp_Update" />
        <string id="Map.SUPL_TRIGGER_CELLULAR_UPDATE" value="Cellular_Update" />

        <string id="Map.SUPL_HSLP_SOURCE_UNKNOWN"     value="Unknown" />
        <string id="Map.SUPL_HSLP_SOURCE_CSP"         value="CSP" />
        <string id="Map.SUPL_HSLP_SOURCE_UICC"        value="UICC" />
        <string id="Map.SUPL_HSLP_SOURCE_IMSI"        value="IMSI" />

        <string id="Map.RIL_REGSTAT_UNKNOWN"          value="Unknown" />
        <string id="Map.RIL_REGSTAT_UNREGISTERED"     value="Unregistered" />
        <string id="Map.RIL_REGSTAT_HOME"             value="Home" />
        <string id="Map.RIL_REGSTAT_ATTEMPTING"       value="Attempting" />
        <string id="Map.RIL_REGSTAT_DENIED"           value="Denied" />
        <string id="Map.RIL_REGSTAT_ROAMING"          value="Roaming" />
        <string id="Map.RIL_REGSTAT_ROAMING_DOMESTIC" value="Domestic roaming" />

        <string id="Map.RegState_None"                value="None" />
        <string id="Map.RegState_Home"                value="Home" />
        <string id="Map.RegState_Deregistered"        value="Deregistered" />
        <string id="Map.RegState_Searching"           value="Searching" />
        <string id="Map.RegState_Denied"              value="Denied" />
        <string id="Map.RegState_Roaming"             value="Roaming" />
        <string id="Map.RegState_Partner"             value="Partner" />

        <string id="Map.NoNotifyNoVerify"             value="NoNotifyNoVerify" />
        <string id="Map.NotifyOnly"                   value="NotifyOnly" />
        <string id="Map.NotifyVerifyDefaultAllow"     value="NotifyVerifyDefaultAllow" />
        <string id="Map.NotifyVerifyDefaultNotAllow"  value="NotifyVerifyDefaultNotAllow" />
        <string id="Map.PrivacyOverride"              value="PrivacyOverride" />

        <string id="Map.GNSS_OPERMODE_ANY"            value="Any" />
        <string id="Map.GNSS_OPERMODE_MSA"            value="MSA" />
        <string id="Map.GNSS_OPERMODE_MSB"            value="MSB" />
        <string id="Map.GNSS_OPERMODE_MSS"            value="MSS" />
        <string id="Map.GNSS_OPERMODE_CELLID"         value="CellId" />
        <string id="Map.GNSS_OPERMODE_AFLT"           value="AFLT" />
        <string id="Map.GNSS_OPERMODE_OTDOA"          value="OTDOA" />

        <string id="Map.SUPL"                         value="SUPL" />
        <string id="Map.CP"                           value="CP" />
        <string id="Map.V2UPL"                        value="V2UPL" />

        <string id="Map.UserResponseAccept"           value="Accept" />
        <string id="Map.UserResponseDeny"             value="Deny" />
        <string id="Map.UserReponseTimeout"           value="Timeout" />

        <string id="Map.SetLocationServiceEnabled"    value="SetLocationServiceEnabled" />
        <string id="Map.SetLocationNIRequestAllowed"  value="SetLocationNIRequestAllowed" />
        <string id="Map.ForceSatelliteSystem"         value="ForceSatelliteSystem" />
        <string id="Map.ForceOperationMode"           value="ForceOperationMode" />
        <string id="Map.SetEngineKeepWarmPeriod"      value="SetEngineKeepWarmPeriod" />
        <string id="Map.SetEngineWarm"                value="SetEngineWarm" />
        <string id="Map.SetEngineCold"                value="SetEngineCold" />
        <string id="Map.SetEngineHot"                 value="SetEngineHot" />
        <string id="Map.ResetEngine"                  value="ResetEngine" />
        <string id="Map.ClearAgnssData"               value="ClearAgnssData" />
        <string id="Map.SetDefaultFixResponseTime"    value="SetDefaultFixResponseTime" />
        <string id="Map.SetSuplVersion"               value="SetSuplVersion" />
        <string id="Map.SetNMEALogging"               value="SetNMEALogging" />
        <string id="Map.SetUplServerAccessInterval"   value="SetUplServerAccessInterval" />
        <string id="Map.SetNiTimeoutInterval"         value="SetNiTimeoutInterval" />
        <string id="Map.ResetGeofencesTracking"       value="ResetGeofencesTracking" />

        <string id="Map.IOCTL_GNSS_SEND_PLATFORM_CAPABILITY"   value="SEND_PLATFORM_CAPABILITY" />
        <string id="Map.IOCTL_GNSS_GET_DEVICE_CAPABILITY"      value="GET_DEVICE_CAPABILITY" />
        <string id="Map.IOCTL_GNSS_SEND_DRIVERCOMMAND"         value="SEND_DRIVERCOMMAND" />
        <string id="Map.IOCTL_GNSS_START_FIXSESSION"           value="START_FIXSESSION" />
        <string id="Map.IOCTL_GNSS_MODIFY_FIXSESSION"          value="MODIFY_FIXSESSION" />
        <string id="Map.IOCTL_GNSS_STOP_FIXSESSION"            value="STOP_FIXSESSION" />
        <string id="Map.IOCTL_GNSS_GET_FIXDATA"                value="GET_FIXDATA" />
        <string id="Map.IOCTL_GNSS_INJECT_AGNSS"               value="INJECT_AGNSS" />
        <string id="Map.IOCTL_GNSS_LISTEN_AGNSS"               value="LISTEN_AGNSS" />
        <string id="Map.IOCTL_GNSS_LISTEN_ERROR"               value="LISTEN_ERROR" />
        <string id="Map.IOCTL_GNSS_LISTEN_FAILOVER"            value="LISTEN_FAILOVER" />
        <string id="Map.IOCTL_GNSS_LISTEN_CUSTOM"              value="LISTEN_CUSTOM" />
        <string id="Map.IOCTL_GNSS_LISTEN_NI"                  value="LISTEN_NI" />
        <string id="Map.IOCTL_GNSS_SET_SUPL_HSLP"              value="SET_SUPL_HSLP" />
        <string id="Map.IOCTL_GNSS_CONFIG_SUPL_CERT"           value="CONFIG_SUPL_CERT" />
        <string id="Map.IOCTL_GNSS_RESPOND_NI"                 value="RESPOND_NI" />
        <string id="Map.IOCTL_GNSS_EXECUTE_CWTEST"             value="EXECUTE_CWTEST" />
        <string id="Map.IOCTL_GNSS_EXECUTE_SELFTEST"           value="EXECUTE_SELFTEST" />
        <string id="Map.IOCTL_GNSS_GET_CHIPSETINFO"            value="GET_CHIPSETINFO" />
        <string id="Map.IOCTL_GNSS_LISTEN_NMEA"                value="LISTEN_NMEA" />
        <string id="Map.IOCTL_GNSS_SET_V2UPL_CONFIG"           value="SET_V2UPL_CONFIG" />

        <string id="Map.GeofenceUnknownTrigger"                value="Unknown" />
        <string id="Map.GeofenceEnter"                         value="Enter" />
        <string id="Map.GeofenceExit"                          value="Exit" />
        <string id="Map.GeofenceRemoved"                       value="Removed" />

        <string id="Map.TrackerStateUnknown"                   value="Unknown" />
        <string id="Map.TrackerStateTracking"                  value="Tracking" />
        <string id="Map.TrackerStateNotTracking"               value="NotTracking" />

        <string id="Map.GeofenceUnknownState"                  value="Unknown" />
        <string id="Map.GeofenceInside"                        value="Inside" />
        <string id="Map.GeofenceOutside"                       value="Outside" />

        <string id="Map.GeofenceUnknownTracker"                value="??" />
        <string id="Map.GeofenceSoftwareTracker"               value="SW" />
        <string id="Map.GeofenceHardwareTracker"               value="HW" />

        <string id="Map.TriggerTypeGeofence"                   value="Geofence" />
        <string id="Map.TriggerTypeGeofenceMonitor"            value="GeofenceMonitor" />

        <string id="Map.GeofenceForeground"                    value="Foreground" />
        <string id="Map.GeofenceBackground"                    value="Background" />

        <string id="Map.WnfForeground"                         value="WnfEvent" />
        <string id="Map.GenericForeground"                     value="Win32Event"/>

        <string id="Map.GeofenceRegister"                      value="Register" />
        <string id="Map.GeofenceUnregister"                    value="Unregister" />

        <string id="Map.GeofenceRemovalReasonUsed"             value="Used" />
        <string id="Map.GeofenceRemovalReasonExpired"          value="Expired" />

        <string id="Map.TrackingStatusTracking"                value="Tracking" />
        <string id="Map.TrackingStatusNotTracking"             value="NotTracking" />

        <string id="Keyword.Error"              value="Error" />
        <string id="Keyword.Performance"        value="Performance" />
        <string id="Keyword.Selfhost"           value="Selfhost" />
        <string id="Keyword.Init"               value="Init" />
        <string id="Keyword.Position"           value="Position" />
        <string id="Keyword.FixSession"         value="FixSession" />
        <string id="Keyword.Gnss"               value="Gnss" />
        <string id="Keyword.CompositePe"        value="CompositePe" />
        <string id="Keyword.CellPe"             value="CellPe" />
        <string id="Keyword.WifiPe"             value="WifiPe" />
        <string id="Keyword.ClientApi"          value="ClientApi" />
        <string id="Keyword.Orion"              value="Orion" />
        <string id="Keyword.Supl"               value="Supl" />
        <string id="Keyword.Crowdsource"        value="Crowdsource" />
        <string id="Keyword.ManagedApi"         value="ManagedApi" />
        <string id="Keyword.WebproxyTracing"    value="WebproxyTracing" />
        <string id="Keyword.WiFiTracing"        value="WiFiTracing" />
        <string id="Keyword.GeofenceTracking"   value="GeofenceTracing" />
        <string id="Keyword.GeofenceStore"      value="GeofenceStore" />
        <string id="Keyword.CellPeAdvanceTracing"       value="CellPeAdvanceTracing" />
        <string id="Keyword.SpeedEstimatorTracing"      value="SpeedEstimatorTracing" />
        <string id="Keyword.VenuePE"            value="VenuePE" />

        <string id="Event.InitializationEvent"            value="Init[%1, %2]: %3 [%4]" />
        <string id="Event.WerReport"                      value="WER Report: ExInfo[0]=%1, ExInfo[1]=%2, Result=%3" />
        <string id="Event.GenericOperationResult"         value="hr=%1, file=%2, line=%3" />
        <string id="Event.TracelogReport"                 value="hr=%1, custommessage=%2, function=%3 callingcode=%4 filename=%5 line=%6" />
        <string id="Event.PdcRef" value="context=%1, component=%2, istakeref=%3" />

        <string id="Event.LatLonRequest"                  value="LS_REQUEST_LATLON: %1 %2, dwHint=%3 error=%4 " />
        <string id="Event.LatLonReport"                   value="LS_REPORT_LATLON: error=%8, lat=%1, lon=%2, altitude=%3, hAccuracy=%4, vAccuracy=%5, heading=%6, velocity=%7" />

        <string id="Event.StartSession"                   value="Session[%1,%2] START %3, IsClient=%9, Acquire[attached=%10, owner=%11], Age=%7, %4, AccuracyValue=%5, VenueMandatory=%8, Param=%6"/>
        <string id="Event.StopSession"                    value="Session[%1,%2] STOP: hr=%3"/>
        <string id="Event.SessionPosition"                value="Session[%1,%2] POS: %5, Status=%3, SourcePe=%4, Intermediate=%6, lat=%7, lon=%8, HAcc=%9, Speed=%10, Floor=%11, Venue=%12" />
        <string id="Event.SessionCallerInfo"              value="Session[%1,%2] CallerName=%6, CallerProductId=%3, Sid=%4, PackageId=%5" />

        <string id="Event.GnssAdapterStartFixSession"     value="Gnss[id=%1, Adapter] START %2: param=%3"/>
        <string id="Event.GnssAdapterStopFixSession"      value="Gnss[id=%1, Adapter] STOP"/>
        <string id="Event.GnssDriverStartFixSession"      value="Gnss[id=%1, Driver] START %2: param=%3"/>
        <string id="Event.GnssDriverModifyFixSession"     value="Gnss[id=%1, Driver] MOD %2: param=%3"/>
        <string id="Event.GnssDriverStopFixSession"       value="Gnss[id=%1, Driver] STOP"/>
        <string id="Event.GnssDriverIoctlResult"          value="Gnss[id=%1, Driver] Ioctl=%2, hr=%3, Duration=%4"/>
        <string id="Event.GnssPosition"                   value="Gnss[id=%1] POS: %3, Intermediate=%4, lat=%5, lon=%6, alt=%7, speed=%8, head=%9, hAccuracy=%10, vAccuracy=%11, speedAcc=%12, HDOP=%13, PDOP=%14, Status=%2" />
        <string id="Event.GnssSatellites"                 value="Gnss[id=%1] SAT: %2" />
        <string id="Event.GnssEventError"                 value="GnssError hr=%1, eventType=%2, numBytesTransferred=%3, eventSize=%4"/>
        <string id="Event.GnssFixEventError"              value="Gnss[id=%1, Driver] FixEventError hr=%2, numBytesTransferred=%3, fixlevelofdetails=%4, expectedMinBytes=%5, expectedMinSatelliteBytes=%6"/>

        <string id="Event.OrionServerTime"                value="Orion ServerTime: hr=%1, Report hr=%2, time=%3"/>
        <string id="Event.OrionAgnss"                     value="Orion Agnss: hr=%1, Report hr=%2, BlobSize=%3"/>
        <string id="Event.OrionInference"                 value="Orion Inference: Winhttp hr=%1, Orion=%2, lat=%3, lon=%4, Accuracy=%5"/>

        <string id="Event.SuplHslpConfig"                 value="SUPL config: hslp=%1 (src=%2), hslp_from_imsi=%3"/>
        <string id="Event.CertConfig"                     value="Cert config: Action=%1, Name=%2, Size=%3"/>
        <string id="Event.SuplVersion"                    value="Set SUPL version: %1.%2"/>
        <string id="Event.V2UplConfig"                    value="V2UPL config: MPC=%1, PDE=%2, AppType=%3"/>
        <string id="Event.DriverCommandDword"             value="Driver cmd=%1, value=%2"/>
        <string id="Event.AgnssRequest"                   value="Agnss Request: type=%1 %2"/>
        <string id="Event.AgnssPositionInjection"         value="Agnss Position Inject: status=%1, lat=%2, lon=%3, alt=%4, speed=%5, head=%6, hAccuracy=%7"/>
        <string id="Event.AgnssTimeInjection"             value="Agnss Time Inject: status=%1, Time=%2, Uncertainty=%3"/>
        <string id="Event.AgnssBlobInjection"             value="Agnss Blob Inject: status=%1, Version=%2, Format=%3, Size=%4"/>
        <string id="Event.AgnssInjection"                 value="Agnss Inject: type=%1, status=%2, dataSize=%3"/>
        <string id="Event.AgnssClear"                     value="Agnss Clear: type=%1"/>
        <string id="Event.NiRequest"                      value="NI Request: id=%1, type=%2, NotType=%3, Plane=%4"/>
        <string id="Event.NiResponse"                     value="NI Response: id=%1, response=%2"/>
        <string id="Event.GnssOperationMode"              value="Driver: ForceOperationMode=%1"/>
        <string id="Event.SuplReconfiguration"            value="SUPL Reconfig: Trigger=%1, CurrentRegStatus=%2"/>
        <string id="Event.SuplPushConfiguration"          value="SUPL Reconfig: Trigger=%1, CurrentRegStatus=%2"/>

        <string id="Event.GeofenceAdd"                    value="GnssAdapt GFAdd Id=[%1:%2], hwId=%3 hr=%4"/>
        <string id="Event.GeofenceRemove"                 value="GnssAdapt GFRemove: hwId=%1, hr=%2"/>
        <string id="Event.ResetGeofenceTracking"          value="GnssAdapt GFResetTracking: hr=%1"/>
        <string id="Event.GeofenceEvent"                  value="GnssAdapt GFEvent: id=%1, triggerState=%2"/>
        <string id="Event.TrackingStatus"                 value="GnssAdapt GFTrackingStatus: state=%1"/>
        <string id="Event.GnssError"                      value="GnssAdapt GnssError Error=%1, Recoverable=%2, Description=%3"/>
        <string id="Event.OnGnssPnP"                      value="GnssAdapt DeviceAvailable = %1, SymbolicLink=%2, DeviceInUse=%3, hr= %4"/>
        <string id="Event.PnPDeviceArrival"               value="GnssPnPManager Device Arrival SymbolicLink= %1, IsExternal=%2"/>
        <string id="Event.PnPDeviceRemoval"               value="GnssPnPManager Device Removal SymbolicLink= %1, IsExternal=%2"/>
        <string id="Event.PnPDeviceAttachRetry"           value="GnssPnPManager Retrying for SymbolicLink= %1"/>

        <string id="Event.GsmBeacon"                      value="SC GSM MCC=%1, MNC=%2, CID=%3, LAC=%4"/>
        <string id="Event.UmtsBeacon"                     value="SC UMTS MCC=%1, MNC=%2, CID=%3, LAC=%4"/>
        <string id="Event.LteBeacon"                      value="SC LTE MCC=%1, MNC=%2, CID=%3"/>
        <string id="Event.CdmaBeacon"                     value="SC CDMA BaseLat=%1, BaseLong=%2, BSID=%3, NID=%4, SID=%5"/>
        <string id="Event.CellNeighbors"                  value="Neighbors: %1"/>
        <string id="Event.TdscdmaBeacon"                  value="SC TDSCDMA MCC=%1, MNC=%2, LAC=%3, CID=%4"/>
        <string id="Event.CellLocationUpdate"             value="[Cell Adapter]Cell Location update noficiation: Parms = %1, Exe= %2, UiccApp = %3, LAC=%4, TAC = %5, CID=%6"/>
        <string id="Event.CellLocationUpdateErrorState"   value="[Cell Adapter]Cell Location update notification Error state, hr =%1"/>
        <string id="Event.CellNeighborsBeaconHash"        value="Neighbors Used: %1"/>
        <!-- CellPeAdvanceTracing -->
        <string id="Event.CellLocationMulticell"          value="IsMulticellUsed=%1"/>

        <string id="Event.ServerCache"                    value="Server Cache IsHit=%1, PE=%2"/>
        <string id="Event.TileCache"                      value="Tile Cache IsHit=%1, PE=%2"/>
        <string id="Event.AdapterScanResult"              value="%1 Scan: Result=%2"/>

        <!-- strings for Crowdsource events -->
        <string id="Event.InitializeDcpProfile"           value="[CS]InitializeDcpProfile: DcpProfile=%1, hr=%2"/>
        <string id="Event.SubmitData"                     value="[CS]SubmitData: SizeInBytes=%1, DcpProfile=%2, hr=%3"/>
        <string id="Event.DataReceived"                   value="[CS]DataReceived: SourcePE=%1, IsReadyForData=%2, IsValidData=%3, hr=%4"/>
        <string id="Event.DataProcessingStart"            value="[CS]RawDataProcessing begins: DataListSize =%1, IsCollectionActive=%2"/>
        <string id="Event.CrowdsourceState"               value="[CS]State: Level=%1, CollectionType=%2, IsBufferFull=%3 IsBatterySavings=%4 IsUserPresenceOn=%5"/>

        <!-- strings for Composite PE events -->
        <string id="Event.OffloadedAcquireStartTracking"  value="Acquire[Id=%3, Cpe] StartTracking on Pe=%1, IsPrimaryNativeTracking=%2" />
        <string id="Event.OffloadedAcquireSupport"        value="[Cpe] SessionType=%1, IsSupportsNativePT=%2, IsSupportsNativeDT=%3, IsSupportsRequest=%4" />
        <string id="Event.CandidatePes"                   value="[Cpe] TotalPeCount=%1, AvailPes=[%2,%3,%4,%5,%6,%7]" />
        <string id="Event.SelectedPes"                    value="Acquire[Id=%2, Cpe] SelectedPes: PrimaryPe=%1" />
        <string id="Event.StartPrimitivePes"              value="Acquire[Id=%4, Cpe] StartPrimitivePes with Role=%1, Remaining time=%2, hr=%3" />
        <string id="Event.AttemptFallback"                value="Acquire[Id=%4, Cpe] AttemptFallback with best available position Status=%1, Sourcepe=%2, AccuracyValue=%3" />
        <string id="Event.SpeedEstimatorInput"            value="[Cpe] SpeedEstimate Input: Timestamp=%1, Latitude=%2, Longitude=%3, Accuracy=%4" />
        <string id="Event.NewSpeedEstimate"               value="[Cpe] New SpeedEstimate Speed(m/s)=%1, Bearing=%2, Positions=%3" />
        <string id="Event.UnreliablePositionDetected"     value="Acquire[Id=%5, Cpe] Unreliable position {acc=%1, sourcepe=%2} detected on validation with position{acc=%3, sourcepe=%4}"/>
        <string id="Event.DTWaitBetweenRequests"          value="Acquire[Id=%14, Cpe] DT: Wait: Dist(m)=%1, IsSpeedUnknown=%12, SpeedUsed(m/s)=%2, IsMDUsed=%3, MDPrecision(m)=%4, Speed_Wait(s)=%5, MD_Wait(s)=%6, MinWait_Budget(s)=%7, SelectedWait(s)=%8, TimeBoundApplied=%13 {Cumulative Runningtime(s)=%9, Acqtime(s)=%10, Requests=%11}" />
        <string id="Event.MDGetMovementPrecision"         value="[Cpe] MD: Get movementPrecision hr=%1, wifi{ConnState=%2, ThrottlingOn=%3, Elapsedtime=%4}, cell{ThrottlingOn=%5, Elapsedtime=%6} ad={ThrottlingOn=%7, Elapsedtime=%8}" />
        <string id="Event.MDStart"                        value="[Cpe] MD: Start MD, hr=%1, hrwifi=%2, hrcell=%3, wifi{ConnState=%4, ThrottlingOn=%5, Elapsedtime(s)=%6}, cell{ThrottlingOn=%7, Elapsedtime(s)=%8} ActivityDetection{ThrottlingOn=%9, Elapsedtime(s)=%10}" />
        <string id="Event.MDStop"                         value="[Cpe] MD: Stop MD, hr =%1 " />
        <string id="Event.MDNotifyMovement"               value="[Cpe] MD: Notify potential movement, hr =%1 " />
        <string id="Event.MDNotifyStateChanged"           value="[Cpe] MD: Notify state changed, hr =%1 " />

        <!-- Venue PE -->
        <string id="Event.CachedPositionsForEZ"              value="[VenuePE] Id=[%1], Positions:[%2]" />
        <string id="Event.VenueTransitionDetected"           value="[VenuePE] IsInsideVenue=%1, Pos[Lat=%2,Lon=%3,Acc=%4,Source=%5]" />
      </stringTable>

      <!-- string table defined for WebproxyTracing events -->
      <stringTable>
        <string id="Event.WebproxyRequest"          value="[%1] [%2], URL=%4, TrackingId=%6" />
        <string id="Event.WebproxyInferenceResult"  value="[%1] [%2]: Coordinate=[%3, %4], Acc=%7, Floor=%8, VenueId=%9, ServerStatus=[%5], WinHttpStatus=[%6], ProtocolStatus=[%11], OrionSource=[%12]" />
        <string id="Event.WebproxyAgnssResult"      value="[%1] [%2]: ServerStatus=[%3], WinHttpStatus=[%4], ProtocolStatus=[%6]" />
        <string id="Event.WebproxyTileResult"       value="[%1] [%2]: ServerStatus=[%3], WinHttpStatus=[%4], ProtocolStatus=[%6]" />

        <string id="Event.RequestCanceled"          value="[%1] [%2] Canceled By [%3], Status=[%4]" />

        <string id="Event.WebproxyWinHttpEvent"     value="[%1]: Request=[%2], WinhttpHandle=[%3], WinHttpEvent=[%4], Status=[%5]" />
        <string id="Event.WebproxyWinHttpApiCall"   value="[%1]: Request=[%2], WinhttpHandle=[%3], WinHttpAPI=[%4], Status=[%5]" />
        <string id="Event.WebproxyRequestInfo"      value="Request=[%2]" />
        <string id="Event.WebproxyResponseInfo"     value="Response=[%2]" />

        <string id="Map.CellInference"      value="CellInference"/>
        <string id="Map.WiFiInference"      value="WiFiInference"/>
        <string id="Map.AgnssData"          value="AgnssData"/>
        <string id="Map.ServerTimeData"     value="ServerTimeData"/>
        <string id="Map.WebproxyTileRequest"    value="WebproxyTileRequest"/>
        <string id="Map.CrowdsourceData"    value="CrowdsourceData"/>
        <string id="Map.VenueTileRequest"   value="VenueTileRequest"/>
        <string id="Map.VenueModelRequest"   value="VenueModelRequest"/>
        <string id="Map.WebproxyCaller"     value="WebproxyCaller"/>
        <string id="Map.WebproxyInternal"   value="WebproxyInternal"/>
        <string id="Map.WebproxyWinHttp"    value="WebproxyWinHttp"/>

        <string id="Map.ResponseHeaderAvailable"        value="WinHttpResponseHeaderAvail"/>
        <string id="Map.ResponseReadComplete"           value="WinHttpResponseReadComplete"/>
        <string id="Map.ResponseWriteComplete"          value="WinHttpResponseWriteComplete"/>
        <string id="Map.RequestError"                   value="WinHttpRequestError"/>
        <string id="Map.RequestSendComplete"            value="WinHttpRequestSendComplete"/>

        <string id="Map.WinHttpOpenRequest"             value="WinHttpOpenRequest"/>
        <string id="Map.WinHttpSendRequest"             value="WinHttpSendRequest"/>
        <string id="Map.WinHttpWriteData"               value="WinHttpWriteData"/>
        <string id="Map.WinHttpReceiveResponse"         value="WinHttpReceiveResponse"/>
        <string id="Map.WinHttpReadData"                value="WinHttpReadData"/>
        <string id="Map.WinHttpPayloadConversionFailed" value="WinHttpPayloadConversionFailed"/>

        <string id="Keyword.Inference"      value="Inference"/>
        <string id="Keyword.Agnss"          value="Agnss"/>
        <string id="Keyword.Tile"           value="Tile"/>
        <string id="Keyword.Canceled"       value="Canceled"/>
      </stringTable>

      <!-- String table defined for WiFiTracing events -->
      <stringTable>
        <string id="Event.WiFiAccessPoint"                value="Mac Address=%1, Signal Strength=%2"/>
        <string id="Event.WifiConnectionStateChange"      value="Wifi Change: Name=%1, State=%2"/>
        <string id="Event.WiFiMacAddressList"             value="Wifi MACs:%1"/>
      </stringTable>

      <!-- String table defined for Geolocation events -->
      <stringTable>

        <string id="Event.GeolocationStartOperation"         value="GeolocationStartOperation[%1] SessionType=%2, Age(ms)=%3, Accuracy(m)=%4, RequestParameter=%5" />
        <string id="Event.GeolocationStartOperationResult"   value="GeolocationStartOperation[%1] Status=%2" />
        <string id="Event.GeolocationEventHandler"           value="GeolocationEventHandler[%1] PositionStatus=%2, Latitude=%3, Longitude=%4, HAccuracy=%5, Status=%6" />
        <string id="Event.GeolocationStopTrackingOperation"  value="GeolocationStopTrackingOperation[%1] Status=%2" />
        <string id="Event.GeolocationPromptAppState"         value="GeolocationPromptAppState State=%1" />

        <string id="Event.GfClientOperationAddGeofence"     value="GFClient Add Geofence at Index = %1, Lat=%2, Lon=%3, Radius =%4, Starttime=%5, Duration=%6, Dwelltime=%7, SingleUse=%8" />
        <string id="Event.GfClientOperationRemoveGeofence"  value="GFClient Remove Geofence at Index = %1, Lat=%2, Lon=%3, Radius =%4, Starttime=%5, Duration=%6, Dwelltime=%7, SingleUse=%8" />
        <string id="Event.GfClientOperationClearAllGeofences" value="GFClient Clear all Geofences" />
        <string id="Event.GfClientReadGeofenceReports"     value="GFClient Read Geofence reports" />
        <string id="Event.GfClientRegisterForChanges"       value="GFClient Register for %1 changes " />
        <string id="Event.GfClientUnregisterForChanges"     value="GFClient Unregister for %1 changes" />
        <string id="Event.GfClientSignalled"                value="GFClient Event signalled on client for %1" />
        <string id="Event.GfClientCreateTrigger"            value="GFClient Create location trigger " />
        <string id="Event.GfClientDeleteTrigger"            value="GFClient Delete location trigger " />
        <string id="Event.GeofenceReport"                   value="GFClient  GeofenceReport: GfId=%1, Trigger=%2, RemovalReason=%3, Status=%4, Lat=%5, Lon=%6, HAcc=%7" />
        <string id="Event.GeofenceData"                     value="GFClient  Geofence: Id=[%1:%2] Lat=%3, Lon=%4, Radius=%5, Starttime=%6, Duration=%7, Dwelltime=%8, SingleUse=%9 " />


        <string id="Event.GeofenceOperationResult"          value="GeofenceOperation[%1] Status=%2" />
        <string id="Event.GeofenceTriggerOperationResult"   value="GFAppBoundary GeofenceOperation[%1] ClientId=%2, EventId=%3, Status=%4" />
        <string id="Event.GeofenceEventTriggerOperation"    value="GFAppBoundary %3 %2 %1Event: PID=%4, AppId=%5, EventId=%6, Status=%7" />
        <string id="Event.GfOperationAddGeofence"           value="GFAppBoundary  AddGeofence: CallerName=%11, Id=[%1:%2] Lat=%3, Lon=%4, Radius=%5, Starttime=%6, Duration=%7, Dwelltime=%8, SingleUse=%9, hr=%10" />
        <string id="Event.GfOperationRemoveGeofence"        value="GFAppBoundary  RemoveGeofence: CallerName=%4, Id=[%1:%2], hr = %3" />
        <string id="Event.GfOperationRemoveAllGeofences"    value="GFAppBoundary  RemoveAllGeofences: CallerName=%3, AppId=%1, hr = %2" />
        <string id="Event.GfOperationListAllGeofences"      value="GFAppBoundary  ListAllGeofences: AppId=%1, GeofencesCount=%2, hr=%3" />
        <string id="Event.GfOperationReadGeofenceReports"   value="GFAppBoundary  ReadGeofenceReports: AppId=%1, GeofenceReportsCount=%2, hr=%3" />
        <string id="Event.GfBackgroundEventSignalled"       value="GFAppBoundary  BackgroundEventSignalled ClientId=%1, EventId=%2, hr=%3" />
        <string id="Event.GfForegroundEventFired"           value="GFAppBoundary  ForegroundEventFired ForegroundEventType=%1" />

      </stringTable>

      <!-- String table defined for GeoCoordinateWatcher events -->
      <stringTable>
        <string id="Map.GCWStart"                   value="Start" />
        <string id="Map.GCWStop"                    value="Stop" />
        <string id="Map.GCWStopByDisposed"          value="StopByDisposed" />
        <string id="Map.GCWTryStart"                value="TryStart" />
        <string id="Map.GCWExecution"               value="Execution" />
        <string id="Map.GCWPostStatus"              value="PostStatusToApp" />
        <string id="Map.GCWPostPosition"            value="PostPositionToApp" />

        <string id="Map.Application"                value="Application" />
        <string id="Map.Taskhost"                   value="Taskhost" />
        <string id="Map.LocationService"            value="LocationService" />
        <string id="Map.Internal"                   value="InternalGCW" />

        <string id="Map.None"                       value="None" />
        <string id="Map.Paused"                     value="Paused" />
        <string id="Map.ResumedTombstone"           value="ResumedTombstone" />
        <string id="Map.ResumedFAS"                 value="ResumedFAS" />

        <string id="Map.Starting"                   value="Starting" />
        <string id="Map.Started"                    value="Started" />
        <string id="Map.Stopping"                   value="Stopping" />
        <string id="Map.Stopped"                    value="Stopped" />
        <string id="Map.Executing"                  value="Executing" />

        <string id="Event.GCWLogEvent"              value="GCW: Instance=[%1], Type=[%2], Source=[%3], Taskhost=[%4], CurrentState=[%5], Timeout=[%6]" />

        <string id="Map.Disabled"                   value="Disabled" />
        <string id="Map.Ready"                      value="Ready" />
        <string id="Map.Initializing"               value="Initializing" />
        <string id="Map.NoData"                     value="NoData" />
        <string id="Map.Unknown"                    value="Unknown" />
        <string id="Map.Granted"                    value="Granted" />
        <string id="Map.Denied"                     value="Denied" />

        <string id="Event.GCWStateLogEvent"         value="GCW: Instance=[%1], GeoStatus=[%2], GeoPermission=[%3]" />

      </stringTable>

      <!-- String table defined for Geofence Tracking events -->
      <stringTable>
        <string id="Event.GeofenceTrigger"                     value="TRK_RG Trigger: Id=[%1:%2], Trigger=%3, Lat=%4, Lon=%5" />
        <string id="Event.GeofenceTrackerStateChange"          value="TRK_RG Tracker State: Tracker=%1, NewState=%2" />
        <string id="Event.GeofenceTrackerEnable"               value="TRK_%1 Enable=%2" />
        <string id="Event.GeofenceStateChange"                 value="TRK_RG GF State: Tracker=%1, Id=[%2:%3], State=%4, Lat=%5, Lon=%6" />
        <string id="Event.BeginRegionLoad"                     value="TRK_RG BeginRegionLoad" />
        <string id="Event.EndRegionLoad"                       value="TRK_RG EndRegionLoad: Lat=%1, Lon=%2, Radius=%3, Geofences=%4" />
        <string id="Event.GeofenceStartTracking"               value="TRK_%1 Start Tracking: Id=[%2:%3], Lat=%4, Lon=%5, Radius=%6, Dwelltime=%7ms, Start=%8, Duration=%9ms, Singleuse=%10"/>
        <string id="Event.GeofenceStopTracking"                value="TRK_%1 Stop Tracking: Id=[%2:%3]" />
        <string id="Event.AddGeofenceToTrackers"               value="TRK_RG Add to Trackers: Id=[%1:%2], Lat=%3, Lon=%4, Radius=%5, Dwelltime=%6ms, Start=%7, Duration=%8ms, Singleuse=%9 {TrackedGeofencesCount=%10,InternalTrackedGeofencesCount=%11}"/>
        <string id="Event.RemoveGeofenceFromTrackers"          value="TRK_RG Remove from Trackers: Id=[%1:%2] {TrackedGeofencesCount=%3,InternalTrackedGeofencesCount=%4}" />
        <string id="Event.GeofenceNoTrack"                     value="TRK_RG Not Tracking: Id=[%1:%2], Lat=%3, Lon=%4, Radius=%5, Dwelltime=%6ms, Start=%7, Duration=%8ms, Singleuse=%9"/>
        <string id="Event.GeofenceStartTrackingApplication"    value="TRK_RG Start tracking for: AppId=[%1]"/>
        <string id="Event.GeofenceStopTrackingApplication"     value="TRK_RG Stop tracking for: AppId=[%1]" />
        <string id="Event.GeofenceSessionRequest"              value="TRK_SW Active=%1, Distance=%2, Accuracy=%3" />

      </stringTable>

      <!--String table for Location KPIs -->
      <stringTable>
        <string id="Event.LocationKpiMetric"			   value="Location KPI : [%1]:  , TTFF = %2msec, Accuracy = %3m"/>
      </stringTable>

      <!--String table for Geofence Store -->
      <stringTable>
        <string id="Event.GeofenceStoreAdd"                    value="GFStore Add: Id=[%1:%2], hr=%3 "/>
        <string id="Event.GeofenceStoreRemove"                 value="GFStore Remove: Id=[%1:%2], hr=%3 "/>
        <string id="Event.GeofenceStoreUpdate"                 value="GFStore Update: Id=[%1:%2], TriggerState= %3, hr=%4 "/>
        <string id="Event.GeofenceStoreGetGeofence"            value="GFStore Get Id=[%1:%2], hr=%3 "/>
        <string id="Event.GeofenceStoreDeleteAll"              value="GFStore DeleteAll: AppId=%1, hr=%2 "/>
        <string id="Event.GeofenceStoreGetAppGeofences"        value="GFStore GetAllGeofence: AppId=%1, Count=%2 hr=%3 "/>
        <string id="Event.GeofenceStoreGetClosestGeofences"    value="GFStore GetClosestGeofence: Lat=%1, Lon=%2, AppCount=%3, GFCount=%4 TransGFCount= %5, hr=%6 "/>
        <string id="Event.GeofenceStoreDeleteApp"              value="GFStore DeleteApp: AppId=%1, hr=%2 "/>
        <string id="Event.GeofenceStoreInternalError"          value="GFStore Internal: Messsage=%1, hr=%2 "/>
        <string id="Event.GeofenceStoreGetAppId"               value="GFStore GetAppID: AppContext= %1 AppId=%2, hr=%3 "/>
      </stringTable>

      <!--String table for Geofence Power -->
      <stringTable>
        <string id="Event.GeofencePowerStart"			   value="Location Geofence Power Scenario: [%1]:  , Start"/>
        <string id="Event.GeofencePowerStop"			   value="Location Geofence Power Scenario: [%1]:  , Stop"/>
      </stringTable>

      <!--String table for Permissions -->
      <stringTable>
        <string id="Event.PermissionDenied"               value="Permission denied for client = %1. Unconditional = %2, Policy = %3, LegacyPolicy = %4, Master = %5, User = %6, UserLegacyPolicy = %7, App = %8, is app container = %9. UserSid = %10, Package = %11"/>
        <string id="Event.PermissionDeniedNotFound"       value="Permission denied because client was not found, client = %1. User = %2, Package = %3"/>

        <string id="Map.PermissionUnset"                  value="Unset" />
        <string id="Map.PermissionEnabled"                value="Enabled" />
        <string id="Map.PermissionDisabled"               value="Disabled" />
      </stringTable>

      <!-- String table for WiFi Acquirer -->
      <stringTable>
        <string id="Event.PositionOnFreeWiFiScan"   value="WiFiAcquire: Id[0x%1], InferenceResult[%2], PositionSource[%3], PositionStatus[%4]"/>
      </stringTable>
    </resources>
  </localization>

</instrumentationManifest>
