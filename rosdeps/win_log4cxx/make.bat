@echo off

rem ************************** Variables ********************************

set PWD=%~dp0
set DIRECT=apache-log4cxx-0.10.0
set BUILD=Debug
set COMMAND=%1
set CMAKE_INSTALL_PREFIX=C:\opt\rosdeps\hydro\x86

rem ************************** Options ********************************

if X%COMMAND%==X set COMMAND=help
if X%COMMAND%==Xhelp goto Help
if X%COMMAND%==Xclean goto Clean
if X%COMMAND%==Xinstall goto Install
if X%COMMAND%==Xall goto Install
goto Help

:Help
echo.
echo Usage: make [subcommand]
echo.
echo   install    Collected headers and static library together
echo   clean      Remove build directory
echo.
goto End

rem ************************** Targets ********************************

:Install
xcopy %PWD%\cmake\log4cxx-config.cmake %CMAKE_INSTALL_PREFIX%\share\cmake\log4cxx\ /Y
xcopy %PWD%\%DIRECT%\projects\%BUILD%\log4cxx.dll %CMAKE_INSTALL_PREFIX%\bin\ /Y
xcopy %PWD%\%DIRECT%\projects\%BUILD%\log4cxx.lib %CMAKE_INSTALL_PREFIX%\lib\ /Y
xcopy %PWD%\%DIRECT%\src\main\include\log4cxx %CMAKE_INSTALL_PREFIX%\include\log4cxx\ /E /Y
if X%COMMAND%==Xall goto Clean
goto End

:Clean
echo "Cleaning build directory."
rm -rf %PWD%\%DIRECT%\projects\Debug
rm -rf %PWD%\%DIRECT%\projects\Release
rm -rf %PWD%\%DIRECT%\projects\Backup
rm -rf %PWD%\%DIRECT%\projects\log4cxx.sdf
rm -rf %PWD%\apr\LibR
rm -rf %PWD%\apr\LibD
rm -rf %PWD%\apr-util\LibR
rm -rf %PWD%\apr-util\LibD
rm -rf %PWD%\apr-util\xml\expat\lib\LibR
rm -rf %PWD%\apr-util\xml\expat\lib\LibD
goto End

:End
