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

`INCLUDE um-header.tpl` 
`INCLUDE control.tpl`

#if ENABLE_WPP_RECORDER
`INCLUDE tracemacro-ifr.tpl`
#else
`INCLUDE tracemacro.tpl`
#endif

`INCLUDE provider.tpl`

`IF FOUND WPP_INIT_TRACING`
#define WPPINIT_EXPORT 
  `INCLUDE um-init.tpl`
`ENDIF`

//
// Tracing Macro name redefinition
//

// NoMsgArgs

`FORALL f IN Funcs WHERE !DoubleP && !MsgArgs`
#undef `f.Name`
#define `f.Name` WPP_(CALL)
`ENDFOR`

`FORALL f IN Funcs WHERE DoubleP && !MsgArgs`
#undef `f.Name`
#define `f.Name`(ARGS) WPP_(CALL) ARGS
`ENDFOR`


// MsgArgs

`FORALL f IN Funcs WHERE MsgArgs`
#undef `f.Name`
#define `f.Name`(`f.FixedArgs` MSGARGS) WPP_(CALL)(`f.FixedArgs` MSGARGS)
`ENDFOR`

`FORALL r IN Reorder`
#undef  WPP_R`r.Name`
#define WPP_R`r.Name`(`r.Arguments`) `r.Permutation`
`ENDFOR`

// NoMsgArgs and Etw
`FORALL f IN Funcs WHERE !DoubleP && !MsgArgs && Etw`
#undef `f.Name`
#define `f.Name` Event(Write)
`ENDFOR`
