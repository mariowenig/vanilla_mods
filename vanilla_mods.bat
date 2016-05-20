@echo off

::Author: Nappelinis
::Version: 1.0
::Date: 05/20/2016

::Current wot version
set myvers=0.9.14.1

::Statics
set resmods=res_mods
set resmods_mods=res_mods_MODS
set resmods_clean=res_mods_clean
set pythonlog=python.log
set mypath=%~dp0

::User input
set /p action=Action to take (v)anilla or (m)ods: 

::Vanilla the client
if "%action%"=="v" (

	::Creating mods folder
	echo Creating: %mypath%%resmods_mods%
	mkdir %mypath%%resmods_mods%

	::Copying mods folder + content
	echo Copying:  %mypath%%resmods% to %mypath%%resmods_mods%
	xcopy %mypath%%resmods% %mypath%%resmods_mods% /D /O /X /E /H /K /V /Q

	::Removing res_mods folder that has the mods
	echo Removing: %mypath%%resmods%
	rd %mypath%%resmods% /S /Q

	::Creating clean res_mods folder
	echo Creating: %mypath%%resmods%
	md %mypath%%resmods% 

	::Creating res_mods/<version> folder
	echo Creating: %mypath%%resmods%\%myvers%
	md %mypath%%resmods%\%myvers%

	::Deleting python.log
	echo Removing %pythonlog%
	del %mypath%%pythonlog%

	echo Done, Vanilla
)

::Mod the client
if "%action%"=="m" (
	
	::Remove res_mods folder
	rd %mypath%%resmods%
	
	::Copying mods folder + content
	echo Copying:  %mypath%%resmods% to %mypath%%resmods_mods%
	xcopy %mypath%%resmods_mods% %mypath%%resmods% /D /O /X /E /H /K /V /Q
	
	::Remove res_mods_MODS folder
	rd %mypath%%resmods_mods% /S /Q
	
	::Deleting python.log
	echo Removing %pythonlog%
	del %mypath%%pythonlog%	
	
	echo Done, Modding
)

PAUSE