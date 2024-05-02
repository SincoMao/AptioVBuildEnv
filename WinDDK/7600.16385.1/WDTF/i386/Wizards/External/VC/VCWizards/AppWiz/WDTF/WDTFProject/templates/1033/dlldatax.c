// wrapper for dlldata.c

#ifdef _MERGE_PROXYSTUB // merge proxy stub DLL

#ifndef __RPC__out
#define __RPC__out
#define __RPC__in
#define __RPC__deref_out_opt
#define __RPC__deref_out
#define __RPC__in_ecount_full(_)
#define __RPC__out_ecount_full(_)
#define __RPC__in_opt
#endif

#define REGISTER_PROXY_DLL //DllRegisterServer, etc.

#define _WIN32_WINNT 0x0500	//for WinNT 4.0 or Win95 with DCOM
#define USE_STUBLESS_PROXY	//defined only with MIDL switch /Oicf

#pragma comment(lib, "rpcns4.lib")
#pragma comment(lib, "rpcrt4.lib")

#define ENTRY_PREFIX	Prx

#include "dlldata.c"
#include "[!output PROJECT_NAME]_p.c"

#endif //_MERGE_PROXYSTUB
