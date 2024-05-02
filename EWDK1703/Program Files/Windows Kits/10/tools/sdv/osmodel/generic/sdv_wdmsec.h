/*
	Copyright (c) Microsoft Corporation.  All rights reserved.
*/

#ifndef _SDV_WDMSEC_H_
#define _SDV_WDMSEC_H_

#ifdef __cplusplus
extern "C" {
#endif

#ifdef IoCreateDeviceSecure
#undef IoCreateDeviceSecure
#endif
#define IoCreateDeviceSecure sdv_IoCreateDeviceSecure

NTSTATUS sdv_IoCreateDeviceSecure(
  __in      PDRIVER_OBJECT DriverObject,
  __in      ULONG DeviceExtensionSize,
  __in_opt  PUNICODE_STRING DeviceName,
  __in      DEVICE_TYPE DeviceType,
  __in      ULONG DeviceCharacteristics,
  __in      BOOLEAN Exclusive,
  __in      PCUNICODE_STRING DefaultSDDLString,
  __in_opt  LPCGUID DeviceClassGuid,
  __out     PDEVICE_OBJECT *DeviceObject
);

#ifdef __cplusplus
}
#endif

#endif
