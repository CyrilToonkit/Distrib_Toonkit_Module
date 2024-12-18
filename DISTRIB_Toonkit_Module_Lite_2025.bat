@echo off
setlocal EnableDelayedExpansion

set VERSION=1_5_6

if [%1]==[] (
	set /p VERSION=Version ^(defaults to '%VERSION%'^)
) else (
	if EXIST "%1" (
		set /p FILE_VERSION=< "%1"
		call :sub !FILE_VERSION!
		set VERSION=!SUBRESULT!
	) else (
		call :sub "%1"
		set VERSION=!SUBRESULT!
	)
)

call %~dp0DISTRIB.bat Toonkit_Module_Lite_2025 %VERSION% Maya2025 Toonkit_Module_2025
exit /b

:sub
set SUBRESULT=%~nx1
exit /b