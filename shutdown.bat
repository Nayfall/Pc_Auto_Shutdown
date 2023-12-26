@echo off

:askTime
set /P "time=Enter the time for shutdown (HH:MM) "

:: Extract hours and minutes
for /F "tokens=1,2 delims=:" %%a in ("%time%") do (
    set "hours=%%a"
    set "minutes=%%b"
)

:: Check if both hours and minutes are numbers
set "isValid=true"
for /F "delims=0123456789" %%i in ("%hours%%minutes%") do set "isValid=false"

:: Check validation
if not "%isValid%"=="true" (
    echo Please enter a valid time in HH:MM format.
    goto askTime
)

:: Convert to total minutes
set /A "totalMinutes=%hours%*60 + %minutes%"

:: Convert to seconds
set /A "seconds=%totalMinutes%*60"

:: Shutdown
rem shutdown -s -t %seconds%

echo Your pc will shutdown in: %hours% hours and %minutes% minutes (%seconds% seconds)

pause