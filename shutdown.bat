@echo off

:askHours
set /P "hours=In how many hours you want to shutdown?"

:: Check if all digits are numbers
set "isValid=true"
for /F "delims=0123456789" %%i in ("%hours%") do set "isValid=false"

:: Check validation
if not "%isValid%"=="true" (
    echo Please enter a valid number.
    goto askHours
)

:: Minutes
set /A "minutes=%hours%*60"

:: Seconds
set /A "seconds=%minutes%*60"

:: Shutdown
shutdown -s -t %seconds%

echo Your pc will shutdown in: %seconds% seconds

pause