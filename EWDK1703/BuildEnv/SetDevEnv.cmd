REM
REM   This is where you add your custom build environment settings.
REM 
REM
REM
REM   Put global custom environment settings before specifying targeted custom configs
REM  
REM   GLOBAL Settings

REM  SET SRCROOT=D:\_NTROOT

REM  Specfic targeted environment settings

if /i "%1" == "" goto :EOF else goto :Custom%1

echo Setting up Custom Envirnment for %1

:Custom%1
REM    :Custom<argument> - if multiple custom environments will be specified, you must change %1 to <specified argument>
REM     Where <Argument> is MyConfig
REM     Example :CustomMyConfig


goto :EOF
REM   Add additional :Custom<Argument> for each specific build type


:EOF