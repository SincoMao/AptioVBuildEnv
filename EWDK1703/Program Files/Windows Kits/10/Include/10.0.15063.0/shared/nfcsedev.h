/*++

Copyright (c) Microsoft Corporation.  All rights reserved.

Module Name:

    NfcSEDev.h

Abstract:

    Header file for the NFC SE device driver interface

--*/

#pragma once

#if (NTDDI_VERSION >= NTDDI_WINBLUE)

//
// Interface GUIDs
//
#ifdef DEFINE_GUID

// {8DC7C854-F5E5-4bed-815D-0C85AD047725}
DEFINE_GUID(GUID_DEVINTERFACE_NFCSE, 0x8dc7c854, 0xf5e5, 0x4bed, 0x81, 0x5d, 0xc, 0x85, 0xad, 0x4, 0x77, 0x25);

#endif

//
// Secure Element DDI
//
#define IOCTL_NFCSE_ENUM_ENDPOINTS             CTL_CODE(FILE_DEVICE_UNKNOWN, 0x0200, METHOD_BUFFERED, FILE_ANY_ACCESS) // Output: SECURE_ELEMENT_ENDPOINT_LIST
#define IOCTL_NFCSE_SUBSCRIBE_FOR_EVENT        CTL_CODE(FILE_DEVICE_UNKNOWN, 0x0201, METHOD_BUFFERED, FILE_ANY_ACCESS) // Input: SECURE_ELEMENT_EVENT_SUBSCRIPTION_INFO
#define IOCTL_NFCSE_GET_NEXT_EVENT             CTL_CODE(FILE_DEVICE_UNKNOWN, 0x0202, METHOD_BUFFERED, FILE_ANY_ACCESS) // Output: SECURE_ELEMENT_EVENT_INFO
#define IOCTL_NFCSE_SET_CARD_EMULATION_MODE    CTL_CODE(FILE_DEVICE_UNKNOWN, 0x0203, METHOD_BUFFERED, FILE_ANY_ACCESS) // Input: SECURE_ELEMENT_SET_CARD_EMULATION_MODE_INFO
#define IOCTL_NFCSE_GET_NFCC_CAPABILITIES      CTL_CODE(FILE_DEVICE_UNKNOWN, 0x0204, METHOD_BUFFERED, FILE_ANY_ACCESS) // Output: SECURE_ELEMENT_NFCC_CAPABILITIES
#define IOCTL_NFCSE_GET_ROUTING_TABLE          CTL_CODE(FILE_DEVICE_UNKNOWN, 0x0205, METHOD_BUFFERED, FILE_ANY_ACCESS) // Output: SECURE_ELEMENT_ROUTING_TABLE
#define IOCTL_NFCSE_SET_ROUTING_TABLE          CTL_CODE(FILE_DEVICE_UNKNOWN, 0x0206, METHOD_BUFFERED, FILE_ANY_ACCESS) // Input: SECURE_ELEMENT_ROUTING_TABLE
#define IOCTL_NFCSE_HCE_REMOTE_RECV            CTL_CODE(FILE_DEVICE_UNKNOWN, 0x0250, METHOD_BUFFERED, FILE_ANY_ACCESS) // Output: SECURE_ELEMENT_HCE_DATA_PACKET
#define IOCTL_NFCSE_HCE_REMOTE_SEND            CTL_CODE(FILE_DEVICE_UNKNOWN, 0x0251, METHOD_BUFFERED, FILE_ANY_ACCESS) // Input: SECURE_ELEMENT_HCE_DATA_PACKET

typedef enum _SECURE_ELEMENT_TYPE {
    Integrated = 0,
    External = 1,
    DeviceHost = 2
} SECURE_ELEMENT_TYPE, *PSECURE_ELEMENT_TYPE;

typedef enum _SECURE_ELEMENT_EVENT_TYPE {
    ExternalReaderArrival = 0,
    ExternalReaderDeparture = 1,
    ApplicationSelected = 2,
    Transaction = 3,
    HceActivated = 4,
    HceDeactivated = 5
} SECURE_ELEMENT_EVENT_TYPE, *PSECURE_ELEMENT_EVENT_TYPE;

typedef enum _SECURE_ELEMENT_CARD_EMULATION_MODE {
    EmulationOff = 0,
    EmulationOnPowerIndependent = 1,
    EmulationOnPowerDependent = 2,
} SECURE_ELEMENT_CARD_EMULATION_MODE, *PSECURE_ELEMENT_CARD_EMULATION_MODE;

typedef struct _SECURE_ELEMENT_ENDPOINT_INFO {
    GUID guidSecureElementId;
    SECURE_ELEMENT_TYPE eSecureElementType;
} SECURE_ELEMENT_ENDPOINT_INFO, *PSECURE_ELEMENT_ENDPOINT_INFO;

typedef struct _SECURE_ELEMENT_ENDPOINT_LIST {
    DWORD NumberOfEndpoints;
    _Field_size_(NumberOfEndpoints)
    SECURE_ELEMENT_ENDPOINT_INFO EndpointList[ANYSIZE_ARRAY];
} SECURE_ELEMENT_ENDPOINT_LIST, *PSECURE_ELEMENT_ENDPOINT_LIST;

#define SECURE_ELEMENT_ENDPOINT_LIST_AND_ENTRIES(n) struct { \
    SECURE_ELEMENT_ENDPOINT_LIST List; \
    SECURE_ELEMENT_ENDPOINT_INFO ExtraInfo[n-1]; \
}

typedef struct _SECURE_ELEMENT_EVENT_SUBSCRIPTION_INFO {
    GUID guidSecureElementId;
    SECURE_ELEMENT_EVENT_TYPE eEventType;
} SECURE_ELEMENT_EVENT_SUBSCRIPTION_INFO, *PSECURE_ELEMENT_EVENT_SUBSCRIPTION_INFO;

typedef struct _SECURE_ELEMENT_EVENT_INFO {
    GUID guidSecureElementId;
    SECURE_ELEMENT_EVENT_TYPE eEventType;
    DWORD cbEventData;
    _Field_size_bytes_(cbEventData)
    BYTE pbEventData[ANYSIZE_ARRAY];
} SECURE_ELEMENT_EVENT_INFO, *PSECURE_ELEMENT_EVENT_INFO;

#define SECURE_ELEMENT_EVENT_INFO_HEADER offsetof(SECURE_ELEMENT_EVENT_INFO, pbEventData)

#define SECURE_ELEMENT_EVENT_INFO_AND_PAYLOAD(n) struct { \
    SECURE_ELEMENT_EVENT_INFO Info; \
    BYTE ExtraPayload[n-1]; \
}

typedef struct _SECURE_ELEMENT_SET_CARD_EMULATION_MODE_INFO {
    GUID guidSecureElementId;
    SECURE_ELEMENT_CARD_EMULATION_MODE eMode;
} SECURE_ELEMENT_SET_CARD_EMULATION_MODE_INFO, *PSECURE_ELEMENT_SET_CARD_EMULATION_MODE_INFO;

typedef struct _SECURE_ELEMENT_NFCC_CAPABILITIES {
    USHORT cbMaxRoutingTableSize;
    BOOLEAN IsAidRoutingSupported;
    BOOLEAN IsProtocolRoutingSupported;
    BOOLEAN IsTechRoutingSupported;
} SECURE_ELEMENT_NFCC_CAPABILITIES, *PSECURE_ELEMENT_NFCC_CAPABILITIES;

typedef enum _SECURE_ELEMENT_ROUTING_TYPE {
    RoutingTypeTech = 0,
    RoutingTypeProtocol = 1,
    RoutingTypeAid = 2
} SECURE_ELEMENT_ROUTING_TYPE, *PSECURE_ELEMENT_ROUTING_TYPE;

typedef struct _SECURE_ELEMENT_TECH_ROUTING_INFO {
    GUID guidSecureElementId;
    BYTE eRfTechType;
} SECURE_ELEMENT_TECH_ROUTING_INFO, *PSECURE_ELEMENT_TECH_ROUTING_INFO;

typedef struct _SECURE_ELEMENT_PROTO_ROUTING_INFO {
    GUID guidSecureElementId;
    BYTE eRfProtocolType;
} SECURE_ELEMENT_PROTO_ROUTING_INFO, *PSECURE_ELEMENT_PROTO_ROUTING_INFO;

#define ISO_7816_MINIMUM_AID_LENGTH 5
#define ISO_7816_MAXIMUM_AID_LENGTH 16

typedef struct _SECURE_ELEMENT_AID_ROUTING_INFO {
    GUID guidSecureElementId;
    _Field_range_(<= , ISO_7816_MAXIMUM_AID_LENGTH) DWORD cbAid;
    _Field_size_bytes_(cbAid) BYTE pbAid[ISO_7816_MAXIMUM_AID_LENGTH];
} SECURE_ELEMENT_AID_ROUTING_INFO, *PSECURE_ELEMENT_AID_ROUTING_INFO;

#pragma warning(push)
#pragma warning(disable:4201) // anonymous unions warning

typedef struct _SECURE_ELEMENT_ROUTING_TABLE_ENTRY {
    SECURE_ELEMENT_ROUTING_TYPE eRoutingType;
    union {
        SECURE_ELEMENT_TECH_ROUTING_INFO TechRoutingInfo;
        SECURE_ELEMENT_PROTO_ROUTING_INFO ProtoRoutingInfo;
        SECURE_ELEMENT_AID_ROUTING_INFO AidRoutingInfo;
    };
} SECURE_ELEMENT_ROUTING_TABLE_ENTRY, *PSECURE_ELEMENT_ROUTING_TABLE_ENTRY;

#pragma warning(pop)

typedef struct _SECURE_ELEMENT_ROUTING_TABLE {
    DWORD NumberOfEntries;
    _Field_size_(NumberOfEntries)
    SECURE_ELEMENT_ROUTING_TABLE_ENTRY TableEntries[ANYSIZE_ARRAY];
} SECURE_ELEMENT_ROUTING_TABLE, *PSECURE_ELEMENT_ROUTING_TABLE;

#define SECURE_ELEMENT_ROUTING_TABLE_AND_ENTRIES(n) struct { \
    SECURE_ELEMENT_ROUTING_TABLE Table; \
    SECURE_ELEMENT_ROUTING_TABLE_ENTRY ExtraEntries[n-1]; \
}

typedef struct _SECURE_ELEMENT_HCE_ACTIVATION_PAYLOAD {
    USHORT bConnectionId;
    BYTE eRfTechType;
    BYTE eRfProtocolType;
} SECURE_ELEMENT_HCE_ACTIVATION_PAYLOAD, *PSECURE_ELEMENT_HCE_ACTIVATION_PAYLOAD;

typedef struct _SECURE_ELEMENT_HCE_DATA_PACKET {
    USHORT bConnectionId;
    USHORT cbPayload;
    _Field_size_bytes_(cbPayload) BYTE pbPayload[ANYSIZE_ARRAY];
} SECURE_ELEMENT_HCE_DATA_PACKET, *PSECURE_ELEMENT_HCE_DATA_PACKET;

#define SECURE_ELEMENT_HCE_DATA_PACKET_HEADER offsetof(SECURE_ELEMENT_HCE_DATA_PACKET, pbPayload)

#endif  // NTDDI_VERSION
