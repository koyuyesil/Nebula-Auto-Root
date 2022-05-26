@setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
@rem @set prompt=$G
@echo off
REM
mode con:cols=60 lines=10
color 0E
:start

@set _count=0
@for /f "tokens=1,*" %%G in ('fastboot devices') do @call :AddAndDisplayDevice %%G %%H
@for /f "skip=1 tokens=1,*" %%G in ('adb devices') do @call :AddAndDisplayDevice %%G %%H

@set /p _choice=Enter number from above menu:
@if not defined _%_choice% @goto :BadSelection "%_choice%"
@call :DoIt %_choice%
rem @exit /b 0

:AddAndDisplayDevice
@set /a _count+=1
@echo %_count%. %*
@call :SetVar %_count% %1 %2
@exit /b 0

:BadSelection
@rem Up to you whether to loop back and try again.
cls
@echo Bad choice: %_choice%
goto end
@exit /b -1

:DoIt
cls
@set device_serial=!_%1!
@set device_description=!_dsc_%1!
if %device_description%==device set _mode=adb
if %device_description%==sideload set _mode=adb
if %device_description%==recovery set _mode=adb
if %device_description%==unauthorized set _mode=adb
if %device_description%==fastboot set _mode=fastboot
rem if %c%==15 (echo "The value of variable c is 15") else (echo "Unknown value")

echo User selected %1, device Id %device_serial%. Device in %device_description%mode.
echo 1. Reboot Android
echo 2. Reboot Recovery
echo 3. Reboot Fastboot

@set /p _command=Enter number from above menu:
if not '%_command%'=='' set _command=%_command:~0,1%
if '%_command%'=='1' goto reboot
if '%_command%'=='2' goto recovery
if '%_command%'=='3' goto bootloader
echo "%_command%" is not valid please try again
rem goto end
rem @exit /b 0







:SetVar
@rem Burada yeni değişkenler üretiliyor
set _%1=%2
set _dsc_%1=%3 
@exit /b 0

:end
@timeout 30 > nul
cls
goto start

:reboot
cls
echo DEVICE REBOOTING TO ANDROID
%_mode% -s %device_serial% reboot
goto end
:recovery
cls
echo DEVICE REBOOTING TO RECOVERY
%_mode% -s %device_serial% reboot recovery
goto end
:bootloader
cls
echo DEVICE REBOOTING TO FASTBOOT
%_mode% -s %device_serial% reboot bootloader
%_mode% -s %device_serial% reboot-bootloader
goto end