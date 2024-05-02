//------------------------------------------------------------------------------
//
// Copyright (C) 2008 Microsoft Corporation. All Rights Reserved.
//
// Project: 
//
// Description:   WDTF C++ logger class.
//
// Author: Dieter Achtelstetter
//------------------------------------------------------------------------------

#pragma once

#if _DEBUG  
#define WDTFREF
#endif


//
//  CWDTFLOGGING
//

//#define CWDTFLOGGING_MAX_NESTED_TEST_CASES  10

typedef class CWDTFLOGGING * PCWDTFLOGGING;
class CWDTFLOGGING
	{

	private:

	ULONG m_nStartTestCaseCount;
	BOOL m_bDisabled ;
	BOOL m_bErrorLoggingDisabled;
 	BOOL m_bInit;
    LPVOID m_pPri;

	public:
	
	CWDTFLOGGING();
	~CWDTFLOGGING();

	BOOL
	Init(
		PCWSTR psCategory,
		BOOL bEnforceEnable = FALSE);

	VOID
	UnInit(
		VOID);

    BOOL
    IsObjectLoggingEnabled(
        VOID);

	VOID
	EnableObjectErrorLogging(
		void);
	VOID
	DisableObjectErrorLogging(
		void);


	BOOL
	StartTestCase(
		PCWSTR psTestCase,
		...);

	BOOL
	EndTestCase(
		VOID);
	
	BOOL
	OutputInfo(
		PCWSTR psInfoText,
		...);

	BOOL
	OutputError(
		PCWSTR psErrorText,
		...);

	BOOL
	OutputInfo(
		PCWSTR psInfoText,
		va_list argptr);

	BOOL
	OutputError(
		PCWSTR psErrorText,
		va_list argptr);

	BOOL
	OutputErrorOverrideable  (
		PCWSTR psErrorText,
		...);

	};


typedef class CWDTFLOGGINGPOINTER * PCWDTFLOGGINGPOINTER;
class CWDTFLOGGINGPOINTER
	{

	public:

	PCWDTFLOGGING m_pLog;
	
	CWDTFLOGGINGPOINTER();
	~CWDTFLOGGINGPOINTER();

	BOOL
	Init(
		PCWDTFLOGGING pLog);

	VOID
	UnInit(
		VOID);

    BOOL
    IsObjectLoggingEnabled(
        VOID);

	VOID
	EnableObjectErrorLogging(
		void);
	VOID
	DisableObjectErrorLogging(
		void);


	BOOL
	StartTestCase(
		PCWSTR psTestCase,
		...);

	BOOL
	EndTestCase(
		VOID);
	
	BOOL
	OutputInfo(
		PCWSTR psInfoText,
		...);

	BOOL
	OutputError(
		PCWSTR psErrorText,
		...);

	BOOL
	OutputInfo(
		PCWSTR psInfoText,
		va_list argptr);

	BOOL
	OutputError(
		PCWSTR psErrorText,
		va_list argptr);

	BOOL
	OutputErrorOverrideable  (
		PCWSTR psErrorText,
		...);

	};






