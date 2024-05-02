//
// Copyright (c) Microsoft Corporation.  All rights reserved.
//
//
// Use of this sample source code is subject to the terms of the Microsoft
// license agreement under which you licensed this sample source code. If
// you did not accept the terms of the license agreement, you are not
// authorized to use this sample source code. For the terms of the license,
// please see the license agreement between you and Microsoft or, if applicable,
// see the LICENSE.RTF on your install media or the root of your tools installation.
// THE SAMPLE SOURCE CODE IS PROVIDED "AS IS", WITH NO WARRANTIES OR INDEMNITIES.
//
#ifndef __WTT_LOG_DEF_H__
#define __WTT_LOG_DEF_H__

#ifndef __WFILE__

//#define WTTLOG_WIDEN2(x) L ## x
//#define WTTLOG_WIDEN(x) WTTLOG_WIDEN2(x)
//#define __WFILE__ WTTLOG_WIDEN(__FILE__)

#define WIDEN2(x) L ## x
#define WIDEN(x) WIDEN2(x)
#define __WFILE__ WIDEN(__FILE__)

#endif

//
//  Device string option name
//

#define WTTLOG_VERSION_MQ25 L"WTTLOG_VERSION_MQ25"

//
//	Trace levels
//

#define WTT_LVL_MSG                   0x10000000
#define WTT_LVL_USER                  0x20000000
#define WTT_LVL_METADATA              0x40000000

#define WTT_LVL_ERR                   0x01000000
#define WTT_LVL_ASSERT                0x02000000
#define WTT_LVL_INVALID_PARAM         0x04000000
#define WTT_LVL_BUG                   0x08000000

#define WTT_LVL_BREAK                 0x00100000
#define WTT_LVL_WARN                  0x00200000

#define WTT_LVL_FUNCTION_ENTRY        0x00010000
#define WTT_LVL_FUNCTION_EXIT         0x00020000
#define WTT_LVL_CONTEXT_ENTRY         0x00040000
#define WTT_LVL_CONTEXT_EXIT          0x00080000

#define WTT_LVL_START_TEST            0x00000100
#define WTT_LVL_END_TEST              0x00000200
#define WTT_LVL_TCMINFO               0x00000400
#define WTT_LVL_MACHINEINFO           0x00000800

#define WTT_LVL_ROLLUP                0x00000010

#define WTT_LVL_STR_TRACEALWAYS       L"TraceAlways"
#define WTT_LVL_STR_TRACE1            L"Trace1"
#define WTT_LVL_STR_TRACE2            L"Trace2"

#define WTT_TRACE_METADATA_TESTCASE_REPORTING  0x1
#define WTT_TRACE_METADATA_ERROR_TRIAGE        0x2

//
//	Trace priorities
//

#define WTT_TRACE_PRIORITY_HIGH_CLASS       0xF0000000
#define WTT_TRACE_PRIORITY_MEDIUM_CLASS     0x0F000000
#define WTT_TRACE_PRIORITY_LOW_CLASS        0x00F00000
#define WTT_TRACE_PRIORITY_RESERVED_CLASS   0x000F0000
#define WTT_TRACE_PRIORITY_USER_CLASS       0x0000FFFF

#define WTT_PRI_MSG                   0x10000000 & WTT_TRACE_PRIORITY_HIGH_CLASS
#define WTT_PRI_METADATA              0x10000000 & WTT_TRACE_PRIORITY_HIGH_CLASS

#define WTT_PRI_ERR                   0x20000000 & WTT_TRACE_PRIORITY_HIGH_CLASS
#define WTT_PRI_ASSERT                0x20000000 & WTT_TRACE_PRIORITY_HIGH_CLASS
#define WTT_PRI_INVALID_PARAM         0x20000000 & WTT_TRACE_PRIORITY_HIGH_CLASS
#define WTT_PRI_BUG                   0x20000000 & WTT_TRACE_PRIORITY_HIGH_CLASS

#define WTT_PRI_BREAK                 0x40000000 & WTT_TRACE_PRIORITY_HIGH_CLASS
#define WTT_PRI_WARN                  0x40000000 & WTT_TRACE_PRIORITY_HIGH_CLASS

#define WTT_PRI_FUNCTION_ENTRY        0x00100000 & WTT_TRACE_PRIORITY_LOW_CLASS
#define WTT_PRI_FUNCTION_EXIT         0x00100000 & WTT_TRACE_PRIORITY_LOW_CLASS
#define WTT_PRI_CONTEXT_ENTRY         0x40000000 & WTT_TRACE_PRIORITY_HIGH_CLASS
#define WTT_PRI_CONTEXT_EXIT          0x40000000 & WTT_TRACE_PRIORITY_HIGH_CLASS

#define WTT_PRI_START_TEST            0x80000000 & WTT_TRACE_PRIORITY_HIGH_CLASS
#define WTT_PRI_END_TEST              0x80000000 & WTT_TRACE_PRIORITY_HIGH_CLASS
#define WTT_PRI_TCMINFO               0x01000000 & WTT_TRACE_PRIORITY_MEDIUM_CLASS
#define WTT_PRI_MACHINEINFO           0x01000000 & WTT_TRACE_PRIORITY_MEDIUM_CLASS

#define WTT_PRI_ROLLUP                0x80000000 & WTT_TRACE_PRIORITY_HIGH_CLASS

#define WTT_PRI_MSG_TRACEALWAYS       WTT_PRI_MSG
#define WTT_PRI_MSG_TRACE1            0x00002000 & WTT_TRACE_PRIORITY_USER_CLASS
#define WTT_PRI_MSG_TRACE2            0x00004000 & WTT_TRACE_PRIORITY_USER_CLASS

//
//	Error code types
//

#define WTT_ERROR_TYPE_HRESULT        0x1
#define WTT_ERROR_TYPE_NTSTATUS       0x2
#define WTT_ERROR_TYPE_WIN32          0x4
#define WTT_ERROR_TYPE_BOOL           0x8

//
//	Error list types
//

#define WTT_ERROR_LIST_EXPECTED       0x1
#define WTT_ERROR_LIST_BREAKON        0x2

//
//	Test case types
//

#define WTTLOG_TESTCASE_TYPE_NOPARENT       0x1
#define WTTLOG_TESTCASE_TYPE_ISCHILD        0x2
#define WTTLOG_TESTCASE_TYPE_ISSIBLING      0x3
#define WTTLOG_TESTCASE_TYPE_SPECIFYPARENT  0x4

//
//	Result types
//

#define WTT_TESTCASE_RESULT_PASS      0x1
#define WTT_TESTCASE_RESULT_FAIL      0x2
#define WTT_TESTCASE_RESULT_BLOCKED   0x3
#define WTT_TESTCASE_RESULT_WARN      0x4
#define WTT_TESTCASE_RESULT_SKIPPED   0x5

//
//	BUG types
//

#define WTT_BUG_TYPE_BLOCKING         0x1
#define WTT_BUG_TYPE_NONBLOCKING      0x2

//
//	Roll up status
//

#define WTTLOG_ROLLUP_STATUS_INPROGRESS         0x1
#define WTTLOG_ROLLUP_STATUS_COMPLETE           0x2

//
//	Roll up type
//

#define WTTLOG_ROLLUP_TYPE_LATER                0x1
#define WTTLOG_ROLLUP_TYPE_NOW                  0x2
#define WTTLOG_ROLLUP_TYPE_KEEP_COUNTER         0x4
#define WTTLOG_ROLLUP_TYPE_CLEAR_COUNTER        0x8

//
//  The default heap size
//

#define WTTLOG_DEFAULT_HEAP_SIZE 2*1024*1024

//	
//	The default option name size
//

#define WTTLOG_DEFAULT_OPTION_NAME_SIZE 256

//
//	The maximum device string length
//

#define WTTLOG_MAX_DEVICE_STRING_LEN 1024

//
//	Device string option name
//

#define WTTLOG_DEVSTR_OPT "WTTLogDevStr:%ls"

//
//	Device string predefined name
//

#define WTTLOG_DEVSTR_PREDEFINED "WTTLogDevStrPredefined:%ls"

//
//	The maximum errors
//

#define WTTLOG_MAX_ERRORS 100

//
//	The maximum option length
//

#define WTTLOG_MAX_OPTIONLENGTH 32

//
//	The maximum trace string length
//

#define WTTLOG_CCH_MAX_TRACE_LENGTH 4096

//
//	Trace masks names
//

static LPCWSTR gs_pcwszTraceLvl        = L"TraceLvl";
static LPCWSTR gs_pcwszTracePri        = L"TracePri";
static LPCWSTR gs_pcwszTraceIfRelevant = L"TraceIfRelevant";
static LPCWSTR gs_pcwszTraceUserMask   = L"TraceUserMask";

//
//	Trace level enable/disable keywords
//

static LPCWSTR gs_pcwszEnableLvl          = L"EnableLvl";
static LPCWSTR gs_pcwszDisableLvl         = L"DisableLvl";
static LPCWSTR gs_pcwszLvlSeparator       = L"|";
static LPWSTR  gs_pwszDefaultEnabledLvls  = L"Msg|Error|Warn|Assert|InvalidParam|Machine|TCM|Break|Bug|StartTest|EndTest|PFRollup|TraceAlways|Metadata";

//	Resource ID based pass/fail keyword
//

static LPCWSTR gs_pcwszAssertMode         = L"WTTLogAssertMode";
static LPCWSTR gs_pcwszAssertDLL          = L"WTTLogAssertDLL";

//
//	Keyword for synchronous mode
//

static LPCSTR  gs_pcszSyncMode            = "WTTLogSyncMode";

//
//	Keyword for optional base name
//

static LPCWSTR  gs_pcwszBaseName          = L"WTTLogFileName";

//
//	PF statistics structure
//

typedef struct _tagWTTLogRollupInfo_
{
    ULONG      ulTotal;
    ULONG      ulPassed;
    ULONG      ulFailed;
    ULONG      ulBlocked;
    ULONG      ulWarned;
    ULONG      ulSkipped;
} WTTLOGROLLUPINFO, * PWTTLOGROLLUPINFO;


#endif
