@echo off

rem ************************** Variables ********************************

set PWD=%~dp0
set COMMAND=%1
set CMAKE_INSTALL_PREFIX=C:\opt\rosdeps\hydro\x86


xcopy %PWD%\cmake\* %CMAKE_INSTALL_PREFIX%\share\cmake\eigen\ /Y
xcopy %PWD%\eigen3 %CMAKE_INSTALL_PREFIX%\include\eigen3\ /E /Y
