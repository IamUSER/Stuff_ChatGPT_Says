@echo off
set dir_path=C:\example\directory
set reg_key=HKEY_CURRENT_USER\Software\Example

rem Removing the directory
if exist "%dir_path%" (
    rmdir /S /Q "%dir_path%"
    echo %dir_path% removed.
) else (
    echo %dir_path% does not exist.
)

rem Removing the registry key
reg delete "%reg_key%" /f >nul 2>&1
if not errorlevel 1 (
    echo %reg_key% removed.
) else (
    echo %reg_key% does not exist.
)