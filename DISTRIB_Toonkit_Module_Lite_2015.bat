@echo off

set VERSION=1_5_6

if [%1]==[] (
	set /p VERSION=Version ^(defaults to '%VERSION%'^) 
) else (
	call :sub %1
	set VERSION=%SUBRESULT%
)

call %~dp0DISTRIB.bat Toonkit_Module_Lite %VERSION% Maya2015 Toonkit_Module_2015
exit /b

:sub
set SUBRESULT=%~nx1
exit /b