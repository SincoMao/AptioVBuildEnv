// compreg.h : Declaration of the CCompReg

#pragma once

#include "resource.h"       // main symbols
[!if !ATTRIBUTED]
#include "[!output PROJECT_NAME].h"
[!endif]

[!if ATTRIBUTED]

// IComponentRegistrar
[
	object,
	uuid(a817e7a2-43fa-11d0-9e44-00aa00b6770a),
	dual,
	helpstring("IComponentRegistrar Interface"),
	pointer_default(unique)
]
__interface IComponentRegistrar : IDispatch
{
	[id(1)]	HRESULT Attach([in] BSTR bstrPath);
	[id(2)]	HRESULT RegisterAll();
	[id(3)]	HRESULT UnregisterAll();
	[id(4)]	HRESULT GetComponents([out, satype(BSTR)] SAFEARRAY** pbstrCLSIDs, [out, satype(BSTR)] SAFEARRAY** pbstrDescriptions);
	[id(5)]	HRESULT RegisterComponent([in] BSTR bstrCLSID);
	[id(6)] HRESULT UnregisterComponent([in] BSTR bstrCLSID);
};
[!endif]


