`**********************************************************************`
`* This is a template file for the tracewpp preprocessor.             *`
`* If you need to use a custom version of this file in your project,  *`
`* please clone it from this one and point WPP to it by specifying    *`
`* -gen:{yourfile}*.tmh on the RUN_WPP line in your sources file.     *`
`*                                                                    *`
`*    Copyright (c) Microsoft Corporation. All rights reserved.       *`
`**********************************************************************`
// `Compiler.Checksum` Generated file. Do not edit.
// File created by `Compiler.Name` compiler version `Compiler.Version`-`Compiler.Timestamp`
// from template `TemplateFile`

typedef
ULONG
(*PFN_WPPTRACEMESSAGE)(
    IN ULONG64  LoggerHandle,
    IN ULONG   MessageFlags,
    IN LPCGUID MessageGuid,
    IN USHORT  MessageNumber,
    IN ...
    );

`INCLUDE km-StorHeader.tpl` 
`INCLUDE km-StorControl.tpl`
`INCLUDE trmacro.tpl`

`IF FOUND WPP_INIT_TRACING`
#define WPPINIT_EXPORT 
  `INCLUDE km-StorInit.tpl`
`ENDIF`
