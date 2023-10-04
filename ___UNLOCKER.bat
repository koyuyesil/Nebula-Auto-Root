@echo off
REM
mode con:cols=55 lines=10
color 0E
:start
echo UNLOCK
echo 1. flashing unlock
echo 2. oem unlock
echo 3. oem unlock-go
echo 4. NULL
echo 5. NULL

set choice=
set /p choice=SELECT UNLOCK MODE:
::if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto CHOICE1
if '%choice%'=='2' goto CHOICE2
if '%choice%'=='3' goto CHOICE3
if '%choice%'=='4' goto CHOICE4
if '%choice%'=='5' goto CHOICE5
echo '%choice%' is not valid please try again
@timeout 1 > nul
cls
goto start

:CHOICE1
echo You entered 1
fastboot flashing unlock
goto end
:CHOICE2
echo You entered 2
fastboot oem unlock
goto end
:CHOICE3
echo You entered 3
fastboot oem unlock-go
goto end
:CHOICE4
echo You entered 4

goto end
:CHOICE5
echo You entered 5

goto end
:end
echo PLEASE FOLLOW DEVICE SCREEN
@timeout 2
cls
goto start





