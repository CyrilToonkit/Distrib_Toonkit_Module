@echo off
setlocal EnableDelayedExpansion

set NAME=Toonkit_Module
set VERSION=0_0_0
set INCLUDES=
set MAYANAME=Maya
set /a COUNTER=0
set GUI=

if [%1]==[] (
	set /p NAME=Distribution name ^(defaults to '%NAME%'^) 
) else set NAME=%1

if [%2]==[] (
	set /p VERSION=Version ^(defaults to '%VERSION%'^) 
) else set VERSION=%2

if [%3]==[] (
	set /p MAYANAME=Maya name ^(defaults to '%MAYANAME%'^) 
) else set MAYANAME=%3

if [%4]==[] (
	set GUI=TRUE
	set /p INCLUDES=Includes ^(defaults to '%INCLUDES%', 'Toonkit_Module_Base' always included^) 
) else (
	for %%a in (%*) do (
		if !COUNTER! LSS 3 (
			set /a COUNTER=COUNTER+1
		) else (
			set INCLUDES=!INCLUDES! %%a
		)
	)
)

set DISTRIBPATH=%~dp0Distributions\%NAME%_%VERSION%

call %~dp0..\Toonkit_Module_Base\DISTRIB.bat %DISTRIBPATH% %MAYANAME%

for %%a in (!INCLUDES!) do (
	call %~dp0..\%%a\DISTRIB.bat %DISTRIBPATH% %MAYANAME%
)

if [%GUI%] neq [] set /p TMP=Press any key to close...