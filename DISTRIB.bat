@echo off

set NAME=Toonkit_Module
set VERSION=0_0_0
set INCLUDES=
set MAYANAME=Maya

echo 1%1 2%2 3%3 4%4 5%5 6%6 7%7

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
	set /p INCLUDES=Includes ^(defaults to '%INCLUDES%', 'Toonkit_Module_Base' always included^) 
) else (
	set INCLUDES=%4
	if [%5] neq [] (
		set INCLUDES=%4 %5
		)
	if [%6] neq [] (
		set INCLUDES=%4 %5 %6
		)
	if [%7] neq [] (
		set INCLUDES=%4 %5 %6 %7
		)
	if [%8] neq [] (
		set INCLUDES=%4 %5 %6 %7 %8
		)
	if [%9] neq [] (
		set INCLUDES=%4 %5 %6 %7 %8 %9
		)
)

echo INCLUDES %INCLUDES%

set DISTRIBPATH=%~dp0Distributions\%NAME%_%VERSION%

call %~dp0..\Toonkit_Module_Base\DISTRIB.bat %DISTRIBPATH% %MAYANAME%

for %%a in (%INCLUDES%) do (
	call %~dp0..\%%a\DISTRIB.bat %DISTRIBPATH% %MAYANAME%
)

set /p TMP=Press any key to close...