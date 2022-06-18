@echo off
REM
mode con:cols=55 lines=10
color 0E
:start
echo QUALCOMM DIAGNOSTIC MODE SWITCHER
echo 1. DIAG ADB
echo 2. DIAG DIAGMDM ADB
echo 3. DIAG CDEV RMNET ADB
echo 4. DIAG CDEV RMNET DPL QDSS ADB
echo 5. DIAG DIAGMDM QDSS QDSSMDM CDEV DPL RMNET ADB

set choice=
set /p choice=SELECT DIAGNOSTIC MODE:
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
adb shell "su -c setprop sys.usb.config diag,adb"
goto end
:CHOICE2
echo You entered 2
adb shell "su -c setprop sys.usb.config diag,diag_mdm,adb"
goto end
:CHOICE3
echo You entered 3
adb shell "su -c setprop sys.usb.config diag,serial_cdev,rmnet,adb"
goto end
:CHOICE4
echo You entered 4
adb shell "su -c setprop sys.usb.config diag,serial_cdev,rmnet,dpl,qdss,adb"
goto end
:CHOICE5
echo You entered 5
adb shell "su -c setprop sys.usb.config diag,diag_mdm,qdss,qdss_mdm,serial_cdev,dpl,rmnet,adb"
goto end
:end
echo PLEASE FOLLOW DEVICE SCREEN AND GIVE ROOT PERMISSIONS
@timeout 2
cls
goto start





