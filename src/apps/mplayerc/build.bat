@ECHO OFF

REM Check if the needed files are present
IF "%VS90COMNTOOLS%"=="" GOTO :BadPaths
IF "%MINGW32%"=="" GOTO :BadPaths
IF "%MINGW64%"=="" GOTO :BadPaths

REM Detect if we are running on 64bit WIN and use Wow6432Node, set the path
REM of Inno Setup accordingly
IF "%PROGRAMFILES(x86)%zzz"=="zzz" (SET "U_=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
) ELSE (
SET "U_=HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
)

SET "I_=Inno Setup"
SET "A_=%I_% 5"
FOR /f "delims=" %%a IN (
	'REG QUERY "%U_%\%A_%_is1" /v "%I_%: App Path"2^>Nul^|FIND "REG_"') DO (
	SET "InnoSetupPath=%%a"&CALL :SubIS %%InnoSetupPath:*Z=%%)

GOTO :GoodPaths

:BadPaths
ECHO: "Not all build dependencies found. To build MPC-HC you need:"
ECHO: "* Visual Studio 2008 installed"
ECHO: "* MinGW 32 bit build environment with coreMSYS pointed to in MINGW32 env var"
ECHO: "* MinGW 64 bit build environment with coreMSYS pointed to in MINGW64 env var"
PAUSE
GOTO :EndGood

:GoodPaths
SET BUILDTYPE=/%1
IF "%1"=="" SET BUILDTYPE=/build

SET ORIGPATH="%CD%"
CALL "%VS90COMNTOOLS%vsvars32.bat"
CD %ORIGPATH%

devenv ../../../mpc-hc.sln %BUILDTYPE% "Release Unicode|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad

devenv mpciconlib.sln %BUILDTYPE% "Release Unicode|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Chinese simplified|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Chinese traditional|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Czech|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode French|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode German|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Hungarian|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Italian|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Korean|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Polish|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Portuguese|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Russian|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Slovak|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Spanish|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Turkish|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Ukrainian|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Belarusian|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Swedish|Win32"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad

IF "%1"=="clean" GOTO x64
MD Build_x86
XCOPY "Release Unicode\mpcresources.??.dll" ".\Build_x86\" /y 
XCOPY "Release Unicode\mpciconlib.dll" ".\Build_x86\" /y 
XCOPY "Release Unicode\mpc-hc.exe" ".\Build_x86\" /y
XCOPY AUTHORS ".\Build_x86\" /y
XCOPY ChangeLog ".\Build_x86\" /y
XCOPY ..\..\..\COPYING ".\Build_x86\" /y

IF DEFINED InnoSetupPath ("%InnoSetupPath%\iscc.exe" /Q^
 "..\..\..\distrib\mpc-hc_setup.iss") ELSE (GOTO :x64)

:x64

REM GOTO :Nox64
devenv ..\..\..\mpc-hc.sln %BUILDTYPE% "Release Unicode|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpciconlib.sln %BUILDTYPE% "Release Unicode|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Chinese simplified|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Chinese traditional|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Czech|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode French|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode German|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Hungarian|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Italian|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Korean|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Polish|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Portuguese|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Russian|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Slovak|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Spanish|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Turkish|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Ukrainian|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Unicode Belarusian|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad
devenv mpcresources.sln %BUILDTYPE% "Release Swedish|x64"
IF %ERRORLEVEL% NEQ 0 GOTO EndBad

IF "%1"=="clean" GOTO :Nox64
MD Build_x64
XCOPY "x64\Release Unicode\mpcresources.??.dll" ".\Build_x64\" /y 
XCOPY "x64\Release Unicode\mpciconlib.dll" ".\Build_x64\" /y 
XCOPY "x64\Release Unicode\mpc-hc64.exe" ".\Build_x64\" /y
XCOPY AUTHORS ".\Build_x64\" /y
XCOPY ChangeLog ".\Build_x64\" /y
XCOPY ..\..\..\COPYING ".\Build_x64\" /y

IF DEFINED InnoSetupPath ("%InnoSetupPath%\iscc.exe" /Q^
 "..\..\..\distrib\mpc-hc_setup.iss" /DBuildx64=True) ELSE (GOTO :Nox64)

:Nox64
GOTO :EndGood

:EndBad
ECHO: " "
ECHO: ERROR: Build failed and aborted
PAUSE
GOTO :EOF

:EndGood
GOTO :EOF

:SubIS
SET InnoSetupPath=%*
GOTO :EOF