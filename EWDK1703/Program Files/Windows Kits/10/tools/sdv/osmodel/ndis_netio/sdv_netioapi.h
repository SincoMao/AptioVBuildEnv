/*
	Copyright (c); Microsoft Corporation.  All rights reserved.
*/
#ifndef _SDV_NETIOAPI_H_
#define _SDV_NETIOAPI_H_

#ifdef GetIfTable2
#undef GetIfTable2
#endif
#define GetIfTable2 sdv_GetIfTable2


#ifdef GetIfEntry2
#undef GetIfEntry2
#endif
#define GetIfEntry2 sdv_GetIfEntry2

#ifdef GetIfTable2Ex
#undef GetIfTable2Ex
#endif
#define GetIfTable2Ex sdv_GetIfTable2Ex

#ifdef GetIfStackTable
#undef GetIfStackTable
#endif
#define GetIfStackTable sdv_GetIfStackTable

#ifdef GetInvertedIfStackTable
#undef GetInvertedIfStackTable
#endif
#define GetInvertedIfStackTable sdv_GetInvertedIfStackTable

#ifdef GetIpInterfaceEntry
#undef GetIpInterfaceEntry
#endif
#define GetIpInterfaceEntry sdv_GetIpInterfaceEntry

#ifdef GetIpInterfaceTable
#undef GetIpInterfaceTable
#endif
#define GetIpInterfaceTable sdv_GetIpInterfaceTable

#ifdef GetUnicastIpAddressTable
#undef GetUnicastIpAddressTable
#endif
#define GetUnicastIpAddressTable sdv_GetUnicastIpAddressTable

#ifdef GetAnycastIpAddressTable
#undef GetAnycastIpAddressTable
#endif
#define GetAnycastIpAddressTable sdv_GetAnycastIpAddressTable

#ifdef GetMulticastIpAddressTable
#undef GetMulticastIpAddressTable
#endif
#define GetMulticastIpAddressTable sdv_GetMulticastIpAddressTable

#ifdef GetIpForwardTable2
#undef GetIpForwardTable2
#endif
#define GetIpForwardTable2 sdv_GetIpForwardTable2

#ifdef GetIpPathTable
#undef GetIpPathTable
#endif
#define GetIpPathTable sdv_GetIpPathTable

#ifdef GetIpNetTable2
#undef GetIpNetTable2
#endif
#define GetIpNetTable2 sdv_GetIpNetTable2

#ifdef InitializeIpInterfaceEntry
#undef InitializeIpInterfaceEntry
#endif
#define InitializeIpInterfaceEntry sdv_InitializeIpInterfaceEntry

#ifdef SetIpInterfaceEntry
#undef SetIpInterfaceEntry
#endif
#define SetIpInterfaceEntry sdv_SetIpInterfaceEntry

#ifdef CreateUnicastIpAddressEntry
#undef CreateUnicastIpAddressEntry
#endif
#define CreateUnicastIpAddressEntry sdv_CreateUnicastIpAddressEntry

#ifdef DeleteUnicastIpAddressEntry
#undef DeleteUnicastIpAddressEntry
#endif
#define DeleteUnicastIpAddressEntry sdv_DeleteUnicastIpAddressEntry

#ifdef GetUnicastIpAddressEntry
#undef GetUnicastIpAddressEntry
#endif
#define GetUnicastIpAddressEntry sdv_GetUnicastIpAddressEntry

#ifdef SetUnicastIpAddressEntry
#undef SetUnicastIpAddressEntry
#endif
#define SetUnicastIpAddressEntry sdv_SetUnicastIpAddressEntry

#ifdef CreateAnycastIpAddressEntry
#undef CreateAnycastIpAddressEntry
#endif
#define CreateAnycastIpAddressEntry sdv_CreateAnycastIpAddressEntry

#ifdef DeleteAnycastIpAddressEntry
#undef DeleteAnycastIpAddressEntry
#endif
#define DeleteAnycastIpAddressEntry sdv_DeleteAnycastIpAddressEntry

#ifdef GetAnycastIpAddressEntry
#undef GetAnycastIpAddressEntry
#endif
#define GetAnycastIpAddressEntry sdv_GetAnycastIpAddressEntry

#ifdef GetMulticastIpAddressEntry
#undef GetMulticastIpAddressEntry
#endif
#define GetMulticastIpAddressEntry sdv_GetMulticastIpAddressEntry

#ifdef CreateIpForwardEntry2
#undef CreateIpForwardEntry2
#endif
#define CreateIpForwardEntry2 sdv_CreateIpForwardEntry2

#ifdef DeleteIpForwardEntry2
#undef DeleteIpForwardEntry2
#endif
#define DeleteIpForwardEntry2 sdv_DeleteIpForwardEntry2

#ifdef GetIpForwardEntry2
#undef GetIpForwardEntry2
#endif
#define GetIpForwardEntry2 sdv_GetIpForwardEntry2

#ifdef InitializeIpForwardEntry
#undef InitializeIpForwardEntry
#endif
#define InitializeIpForwardEntry sdv_InitializeIpForwardEntry

#ifdef GetIpPathEntry
#undef GetIpPathEntry
#endif
#define GetIpPathEntry sdv_GetIpPathEntry

#ifdef CreateIpNetEntry2
#undef CreateIpNetEntry2
#endif
#define CreateIpNetEntry2 sdv_CreateIpNetEntry2

#ifdef DeleteIpNetEntry2
#undef DeleteIpNetEntry2
#endif
#define DeleteIpNetEntry2 sdv_DeleteIpNetEntry2

#ifdef NotifyIpInterfaceChange
#undef NotifyIpInterfaceChange
#endif
#define NotifyIpInterfaceChange sdv_NotifyIpInterfaceChange

#ifdef GetIpNetworkConnectionBandwidthEstimates
#undef GetIpNetworkConnectionBandwidthEstimates
#endif
#define GetIpNetworkConnectionBandwidthEstimates sdv_GetIpNetworkConnectionBandwidthEstimates

#ifdef InitializeUnicastIpAddressEntry
#undef InitializeUnicastIpAddressEntry
#endif
#define InitializeUnicastIpAddressEntry sdv_InitializeUnicastIpAddressEntry

#ifdef NotifyUnicastIpAddressChange
#undef NotifyUnicastIpAddressChange
#endif
#define NotifyUnicastIpAddressChange sdv_NotifyUnicastIpAddressChange

#ifdef NotifyStableUnicastIpAddressTable
#undef NotifyStableUnicastIpAddressTable
#endif
#define NotifyStableUnicastIpAddressTable sdv_NotifyStableUnicastIpAddressTable

#ifdef NotifyRouteChange2
#undef NotifyRouteChange2
#endif
#define NotifyRouteChange2 sdv_NotifyRouteChange2

#ifdef NotifyTeredoPortChange
#undef NotifyTeredoPortChange
#endif
#define NotifyTeredoPortChange sdv_NotifyTeredoPortChange

#ifdef GetIpNetEntry2
#undef GetIpNetEntry2
#endif
#define GetIpNetEntry2 sdv_GetIpNetEntry2

#ifdef SetIpNetEntry2
#undef SetIpNetEntry2
#endif
#define SetIpNetEntry2 sdv_SetIpNetEntry2

#ifdef FreeMibTable
#undef FreeMibTable
#endif
#define FreeMibTable sdv_FreeMibTable

#ifdef FlushIpPathTable
#undef FlushIpPathTable
#endif
#define FlushIpPathTable sdv_FlushIpPathTable

#ifdef FlushIpNetTable2
#undef FlushIpNetTable2
#endif
#define FlushIpNetTable2 sdv_FlushIpNetTable2

#ifdef CancelMibChangeNotify2
#undef CancelMibChangeNotify2
#endif
#define CancelMibChangeNotify2 sdv_CancelMibChangeNotify2

#ifdef GetTeredoPort
#undef GetTeredoPort
#endif
#define GetTeredoPort sdv_GetTeredoPort

#ifdef ResolveIpNetEntry2
#undef ResolveIpNetEntry2
#endif
#define ResolveIpNetEntry2 sdv_ResolveIpNetEntry2

#ifdef ConvertLengthToIpv4Mask
#undef ConvertLengthToIpv4Mask
#endif
#define ConvertLengthToIpv4Mask sdv_ConvertLengthToIpv4Mask

#ifdef ConvertIpv4MaskToLength
#undef ConvertIpv4MaskToLength
#endif
#define ConvertIpv4MaskToLength sdv_ConvertIpv4MaskToLength

#ifdef ConvertCompartmentGuidToId
#undef ConvertCompartmentGuidToId
#endif
#define ConvertCompartmentGuidToId sdv_ConvertCompartmentGuidToId

#ifdef ConvertCompartmentIdToGuid
#undef ConvertCompartmentIdToGuid
#endif
#define ConvertCompartmentIdToGuid sdv_ConvertCompartmentIdToGuid

#ifdef ConvertInterfaceNameToLuidA
#undef ConvertInterfaceNameToLuidA
#endif
#define ConvertInterfaceNameToLuidA sdv_ConvertInterfaceNameToLuidA

#ifdef ConvertInterfaceNameToLuidW
#undef ConvertInterfaceNameToLuidW
#endif
#define ConvertInterfaceNameToLuidW sdv_ConvertInterfaceNameToLuidW

#ifdef ConvertInterfaceLuidToNameA
#undef ConvertInterfaceLuidToNameA
#endif
#define ConvertInterfaceLuidToNameA sdv_ConvertInterfaceLuidToNameA

#ifdef GetCurrentThreadCompartmentId
#undef GetCurrentThreadCompartmentId
#endif
#define GetCurrentThreadCompartmentId sdv_GetCurrentThreadCompartmentId

#ifdef SetCurrentThreadCompartmentId
#undef SetCurrentThreadCompartmentId
#endif
#define SetCurrentThreadCompartmentId sdv_SetCurrentThreadCompartmentId

#ifdef ConvertInterfaceLuidToIndex
#undef ConvertInterfaceLuidToIndex
#endif
#define ConvertInterfaceLuidToIndex sdv_ConvertInterfaceLuidToIndex

#ifdef ConvertInterfaceIndexToLuid
#undef ConvertInterfaceIndexToLuid
#endif
#define ConvertInterfaceIndexToLuid sdv_ConvertInterfaceIndexToLuid

#ifdef if_indextoname
#undef if_indextoname
#endif
#define if_indextoname sdv_if_indextoname

#ifdef ConvertInterfaceLuidToNameW
#undef ConvertInterfaceLuidToNameW
#endif
#define ConvertInterfaceLuidToNameW sdv_ConvertInterfaceLuidToNameW

#ifdef ConvertInterfaceLuidToAlias
#undef ConvertInterfaceLuidToAlias
#endif
#define ConvertInterfaceLuidToAlias sdv_ConvertInterfaceLuidToAlias

#ifdef ConvertInterfaceAliasToLuid
#undef ConvertInterfaceAliasToLuid
#endif
#define ConvertInterfaceAliasToLuid sdv_ConvertInterfaceAliasToLuid

#ifdef ConvertInterfaceLuidToGuid
#undef ConvertInterfaceLuidToGuid
#endif
#define ConvertInterfaceLuidToGuid sdv_ConvertInterfaceLuidToGuid

#ifdef ConvertInterfaceGuidToLuid
#undef ConvertInterfaceGuidToLuid
#endif
#define ConvertInterfaceGuidToLuid sdv_ConvertInterfaceGuidToLuid

#ifdef if_nametoindex
#undef if_nametoindex
#endif
#define if_nametoindex sdv_if_nametoindex

#ifdef GetCurrentThreadCompartmentScope
#undef GetCurrentThreadCompartmentScope
#endif
#define GetCurrentThreadCompartmentScope sdv_GetCurrentThreadCompartmentScope

#ifdef SetCurrentThreadCompartmentScope
#undef SetCurrentThreadCompartmentScope
#endif
#define SetCurrentThreadCompartmentScope sdv_SetCurrentThreadCompartmentScope

#ifdef GetSessionCompartmentId
#undef GetSessionCompartmentId
#endif
#define GetSessionCompartmentId sdv_GetSessionCompartmentId

#ifdef SetSessionCompartmentId
#undef SetSessionCompartmentId
#endif
#define SetSessionCompartmentId sdv_SetSessionCompartmentId

#ifdef SetNetworkInformation
#undef SetNetworkInformation
#endif
#define SetNetworkInformation sdv_SetNetworkInformation

#ifdef GetNetworkInformation
#undef GetNetworkInformation
#endif
#define GetNetworkInformation sdv_GetNetworkInformation

#ifdef GetBestRoute2
#undef GetBestRoute2
#endif
#define GetBestRoute2 sdv_GetBestRoute2

#ifdef CreateSortedAddressPairs
#undef CreateSortedAddressPairs
#endif
#define CreateSortedAddressPairs sdv_CreateSortedAddressPairs

NETIOAPI_API
sdv_GetIfTable2(
    PMIB_IF_TABLE2 *Table
    );
NETIOAPI_API
sdv_GetIfEntry2(
		PMIB_IF_ROW2 Row
		);
NETIOAPI_API
sdv_GetIfTable2Ex(
		MIB_IF_TABLE_LEVEL Level,
		PMIB_IF_TABLE2 *Table
		);
NETIOAPI_API
sdv_GetIfStackTable(
  PMIB_IFSTACK_TABLE *Table
  );
NETIOAPI_API
sdv_GetInvertedIfStackTable(
  PMIB_INVERTEDIFSTACK_TABLE *Table
  );
NETIOAPI_API
 sdv_GetIpInterfaceEntry(
    PMIB_IPINTERFACE_ROW Row
);
NETIOAPI_API
	sdv_GetIpInterfaceTable(
		ADDRESS_FAMILY Family,
		PMIB_IPINTERFACE_TABLE *Table
		);
NETIOAPI_API
	sdv_GetUnicastIpAddressTable(
		ADDRESS_FAMILY Family,
		PMIB_UNICASTIPADDRESS_TABLE *Table
		);
NETIOAPI_API
	sdv_GetAnycastIpAddressTable(
		ADDRESS_FAMILY Family,
		PMIB_ANYCASTIPADDRESS_TABLE *Table
		);
NETIOAPI_API
	sdv_GetMulticastIpAddressTable(
		ADDRESS_FAMILY Family,
		PMIB_MULTICASTIPADDRESS_TABLE *Table
		);
NETIOAPI_API
  sdv_GetIpForwardTable2(
  ADDRESS_FAMILY Family,
  PMIB_IPFORWARD_TABLE2 *Table
  );
NETIOAPI_API
	sdv_GetIpPathTable(
		ADDRESS_FAMILY Family,
		PMIB_IPPATH_TABLE *Table
		);
NETIOAPI_API
	sdv_GetIpNetTable2(
		ADDRESS_FAMILY Family,
		PMIB_IPNET_TABLE2 *Table
		);
VOID
NETIOAPI_API_
  sdv_InitializeIpInterfaceEntry(
		PMIB_IPINTERFACE_ROW Row
		);
NETIOAPI_API
	sdv_SetIpInterfaceEntry(
		PMIB_IPINTERFACE_ROW Row
		);
NETIOAPI_API
	sdv_CreateUnicastIpAddressEntry(
		CONST MIB_UNICASTIPADDRESS_ROW *Row
		);
NETIOAPI_API
	sdv_DeleteUnicastIpAddressEntry(
		CONST MIB_UNICASTIPADDRESS_ROW *Row
		);
NETIOAPI_API
	sdv_GetUnicastIpAddressEntry(
		PMIB_UNICASTIPADDRESS_ROW Row
		);
NETIOAPI_API
	sdv_SetUnicastIpAddressEntry(
		CONST MIB_UNICASTIPADDRESS_ROW *Row
		);
NETIOAPI_API
	sdv_CreateAnycastIpAddressEntry(
		CONST MIB_ANYCASTIPADDRESS_ROW *Row
		);
NETIOAPI_API
		sdv_DeleteAnycastIpAddressEntry(
		CONST MIB_ANYCASTIPADDRESS_ROW *Row
		);
NETIOAPI_API
	sdv_GetAnycastIpAddressEntry(
		PMIB_ANYCASTIPADDRESS_ROW Row
		);
NETIOAPI_API
	sdv_GetMulticastIpAddressEntry(
		PMIB_MULTICASTIPADDRESS_ROW Row
		);
		
NETIOAPI_API
		sdv_CreateIpForwardEntry2(
		CONST MIB_IPFORWARD_ROW2 *Row
		);

NETIOAPI_API
	sdv_DeleteIpForwardEntry2(
		CONST MIB_IPFORWARD_ROW2 *Row
		);

NETIOAPI_API
		sdv_GetIpForwardEntry2(
		PMIB_IPFORWARD_ROW2 Row
		);

	NETIOAPI_API
		sdv_InitializeIpForwardEntry(
		PMIB_IPFORWARD_ROW2 Row
		);

NETIOAPI_API
	sdv_GetIpPathEntry(
		PMIB_IPPATH_ROW Row
		);
NETIOAPI_API
	sdv_CreateIpNetEntry2(
		CONST MIB_IPNET_ROW2 *Row
		);
NETIOAPI_API
	sdv_DeleteIpNetEntry2(
		CONST MIB_IPNET_ROW2 *Row
		);
NETIOAPI_API
	sdv_NotifyIpInterfaceChange(
		ADDRESS_FAMILY Family,
		PIPINTERFACE_CHANGE_CALLBACK Callback,
		 PVOID CallerContext,
		BOOLEAN InitialNotification,
		HANDLE *NotificationHandle
		);
NETIOAPI_API
	sdv_GetIpNetworkConnectionBandwidthEstimates(
		NET_IFINDEX InterfaceIndex,
		ADDRESS_FAMILY AddressFamily,
		PMIB_IP_NETWORK_CONNECTION_BANDWIDTH_ESTIMATES BandwidthEstimates
		);
VOID
	NETIOAPI_API_
	sdv_InitializeUnicastIpAddressEntry(
		PMIB_UNICASTIPADDRESS_ROW Row
		);
NETIOAPI_API
	sdv_NotifyUnicastIpAddressChange(
		ADDRESS_FAMILY Family,
		PUNICAST_IPADDRESS_CHANGE_CALLBACK Callback,
		PVOID CallerContext,
		BOOLEAN InitialNotification,
		HANDLE *NotificationHandle
		);
NETIOAPI_API
	sdv_NotifyStableUnicastIpAddressTable(
		ADDRESS_FAMILY Family,
		PMIB_UNICASTIPADDRESS_TABLE* Table,
		PSTABLE_UNICAST_IPADDRESS_TABLE_CALLBACK CallerCallback,
		PVOID CallerContext,
		HANDLE *NotificationHandle
		);
NETIOAPI_API
	sdv_NotifyRouteChange2(
		ADDRESS_FAMILY AddressFamily,
		PIPFORWARD_CHANGE_CALLBACK Callback,
		PVOID CallerContext,
		BOOLEAN InitialNotification,
		HANDLE *NotificationHandle
		);
NETIOAPI_API
	sdv_NotifyTeredoPortChange(
		PTEREDO_PORT_CHANGE_CALLBACK Callback,
		PVOID CallerContext,
		BOOLEAN InitialNotification,
		HANDLE *NotificationHandle
		);
NETIOAPI_API
	sdv_GetIpNetEntry2(
		PMIB_IPNET_ROW2 Row
		);
NETIOAPI_API
	sdv_SetIpNetEntry2(
		PMIB_IPNET_ROW2 Row
		);
VOID
	NETIOAPI_API_
		sdv_FreeMibTable(
		PVOID Memory
		);
NETIOAPI_API
	sdv_FlushIpPathTable(
		ADDRESS_FAMILY Family
		);
NETIOAPI_API
	sdv_FlushIpNetTable2(
		ADDRESS_FAMILY Family,
		NET_IFINDEX InterfaceIndex
		);
NETIOAPI_API
	sdv_CancelMibChangeNotify2(
		HANDLE NotificationHandle
		);
NETIOAPI_API
	sdv_GetTeredoPort(
		USHORT *Port
		);
NETIOAPI_API
	sdv_ResolveIpNetEntry2(
		PMIB_IPNET_ROW2 Row,
		 CONST SOCKADDR_INET *SourceAddress
		);
NETIOAPI_API
	sdv_ConvertLengthToIpv4Mask(
		ULONG MaskLength,
		PULONG Mask
		);
NETIOAPI_API
	sdv_ConvertIpv4MaskToLength(
		ULONG Mask,
		PUINT8 MaskLength
		);
NETIOAPI_API
	sdv_ConvertCompartmentGuidToId(
		CONST GUID *CompartmentGuid,
		PNET_IF_COMPARTMENT_ID CompartmentId
		);
NETIOAPI_API
	sdv_ConvertCompartmentIdToGuid(
		NET_IF_COMPARTMENT_ID CompartmentId,
		GUID *CompartmentGuid
		);
NETIOAPI_API
	sdv_ConvertInterfaceNameToLuidA(
		CONST CHAR *InterfaceName,
		NET_LUID *InterfaceLuid
		);
NETIOAPI_API
	sdv_ConvertInterfaceNameToLuidW(
		CONST WCHAR *InterfaceName,
		NET_LUID *InterfaceLuid
		);
NETIOAPI_API
	sdv_ConvertInterfaceLuidToNameA(
		CONST NET_LUID *InterfaceLuid,
		PSTR InterfaceName,
		SIZE_T Length
		);
NETIOAPI_API
		sdv_GetCurrentThreadCompartmentId(
		VOID
		);
NETIOAPI_API
	sdv_SetCurrentThreadCompartmentId(
		NET_IF_COMPARTMENT_ID CompartmentId
		);
NETIOAPI_API
	sdv_ConvertInterfaceLuidToIndex(
		CONST NET_LUID *InterfaceLuid,
		PNET_IFINDEX InterfaceIndex
		);

NETIOAPI_API
	sdv_ConvertInterfaceIndexToLuid(
		NET_IFINDEX InterfaceIndex,
		PNET_LUID InterfaceLuid
		);
PCHAR
		NETIOAPI_API_
		sdv_if_indextoname(
		NET_IFINDEX InterfaceIndex,
		PCHAR InterfaceName
		);
NETIOAPI_API
	sdv_ConvertInterfaceLuidToNameW(
		CONST NET_LUID *InterfaceLuid,
		PWSTR InterfaceName,
		SIZE_T Length
		);
NETIOAPI_API
	sdv_ConvertInterfaceLuidToAlias(
		CONST NET_LUID *InterfaceLuid,
		 PWSTR InterfaceAlias,
		SIZE_T Length
		);
NETIOAPI_API
	sdv_ConvertInterfaceAliasToLuid(
		CONST WCHAR *InterfaceAlias,
		PNET_LUID InterfaceLuid
		);
NETIOAPI_API
	sdv_ConvertInterfaceLuidToGuid(
		CONST NET_LUID *InterfaceLuid,
		GUID *InterfaceGuid
		);
NETIOAPI_API
	sdv_ConvertInterfaceGuidToLuid(
		CONST GUID *InterfaceGuid,
		PNET_LUID InterfaceLuid
		);
NET_IFINDEX
	NETIOAPI_API_
	sdv_if_nametoindex(
		PCSTR InterfaceName
		);

NET_IF_COMPARTMENT_ID
	NETIOAPI_API_
	sdv_GetSessionCompartmentId(
		ULONG SessionId
		);
NETIOAPI_API
	sdv_SetSessionCompartmentId(
		ULONG SessionId,
		NET_IF_COMPARTMENT_ID CompartmentId
		);
NETIOAPI_API
	sdv_SetNetworkInformation(
		CONST NET_IF_NETWORK_GUID *NetworkGuid,
		NET_IF_COMPARTMENT_ID CompartmentId,
		CONST WCHAR *NetworkName
		);
NETIO_STATUS
	sdv_GetNetworkInformation(
		CONST NET_IF_NETWORK_GUID *NetworkGuid,
		PNET_IF_COMPARTMENT_ID CompartmentId,
		PULONG SiteId,
		PWCHAR NetworkName,
		ULONG Length
		);
NETIO_STATUS
	sdv_GetBestRoute2(
		NET_LUID *InterfaceLuid,
		NET_IFINDEX InterfaceIndex,
		CONST SOCKADDR_INET *SourceAddress,
		CONST SOCKADDR_INET *DestinationAddress,
		ULONG AddressSortOptions,
		PMIB_IPFORWARD_ROW2 BestRoute,
		SOCKADDR_INET *BestSourceAddress
		);
NETIO_STATUS
	sdv_CreateSortedAddressPairs(
		const PSOCKADDR_IN6 SourceAddressList,
		ULONG SourceAddressCount,
		const PSOCKADDR_IN6 DestinationAddressList,
		ULONG DestinationAddressCount,
		ULONG AddressSortOptions,
		PSOCKADDR_IN6_PAIR *SortedAddressPairList,
		ULONG *SortedAddressPairCount
		);

#if (NTDDI_VERSION >  NTDDI_WINBLUE)

VOID
	NETIOAPI_API_
	sdv_GetCurrentThreadCompartmentScope(
		PNET_IF_COMPARTMENT_SCOPE CompartmentScope,
		PNET_IF_COMPARTMENT_ID CompartmentId
		);

NETIOAPI_API
	sdv_SetCurrentThreadCompartmentScope(
		NET_IF_COMPARTMENT_SCOPE CompartmentScope
		);

#endif


#endif
