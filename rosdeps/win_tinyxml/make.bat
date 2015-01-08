@echo off

rem ************************** Variables ********************************

set PWD=%~dp0
set COMMAND=%1
set CMAKE_INSTALL_PREFIX=C:\opt\rosdeps\hydro\x86

rem ************************** Options ********************************

if X%COMMAND%==X set COMMAND=help
if X%COMMAND%==Xhelp goto Help
if X%COMMAND%==Xclean goto Clean
if X%COMMAND%==Xcompile goto Compile
if X%COMMAND%==Xinstall goto Install
if X%COMMAND%==Xall goto Compile
goto Help

:Help
echo.
echo Usage: make [subcommand]
echo.
echo   compile    Cmake and nmake the static library
echo   install    Collected headers and static library together
echo   clean      Remove build directory
echo.
goto End

rem ************************** Targets ********************************

:Compile
mkdir %PWD%\build
cd %PWD%\build
cmake -G "NMake Makefiles" -DTINYXML_BUGGER_OFF_CATKIN=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX="%CMAKE_INSTALL_PREFIX%" ..
nmake
cd %PWD%
if X%COMMAND%==Xall goto Install
goto End

:Install
cd %PWD%\build
nmake install
cd %PWD%
if X%COMMAND%==Xall goto Clean
goto End

:Clean
echo "Cleaning build directory."
rm -rf build
goto End

:End
