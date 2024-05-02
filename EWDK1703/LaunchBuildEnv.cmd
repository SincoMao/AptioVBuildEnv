@ECHO OFF
CD "%~dp0\BuildEnv"
call "SetupBuildenv.cmd" %*
@ECHO OFF
cls
CD "%~dp0"