@echo CONNECTING TO DEVICE SHELL
::@adb shell 2> nul || @echo DB001

@for /f "delims=" %%i in ('@adb shell getprop ro.build.product') do @set product=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.boot.hwlevel') do @set hwlevel=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.boot.hwversion') do @set hwversion=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.build.version.incremental') do @set version=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.cert') do @set cert=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.device') do @set device=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.manufacturer') do @set manufacturer=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.model') do @set model=%%i

@echo VERSION      :%version%
@echo CERT         :%cert%
@echo PRODUCT      :%product%
@echo DEVICE       :%device%
@echo MANUFACTURER :%manufacturer%
@echo MODEL        :%model%
@echo HW_VERSION   :%hwlevel%-%hwversion%

@set bkName=%device%-EFS-Backups-%date:~10%%date:~7,2%%date:~4,2%%time:~0,2%%time:~3,2%%time:~6,2%-%hwlevel%-%hwversion%
::@set bkName=%product%-EFS-Backups-%date:~10%%date:~7,2%%date:~4,2%%random%
@md "Backups\%bkName%" 2> nul && @echo FOLDER CREATED OK || @echo FOLDER CREATED ERROR
pause
::@adb shell "getprop" > "Backups\%bkName%\device_info.txt"  || @echo DEV INFO DUMPS ERROR

@echo SWITCHING TO FASTBOOT MODE
@adb reboot bootloader 2> nul || @echo FB001

@for /f "tokens=2 delims=: " %%i in ('fastboot %* getvar product 2^>^&1 ^| findstr /r /c:"product:"') do (@set dc=%%i)

@set rPth=%CONCRATES%\%dc%
::@set rPth=twrp_%dc%

@set prms=--disable-verity --disable-verification
@echo FLASHING CUSTOM RECOVERY IMAGE
@fastboot flash recovery %rPth%_recovery.img 2> nul || @echo CUSTOM RECOVERY IMAGE FLASHING FAIL
@fastboot %prms% flash vbmeta %rPth%_vbmeta.img 2> nul || @echo VBMETA FLASH NO 
@fastboot flash misc %rPth%_misc.bin 2> nul || @echo MISC PARTITION FLASHING NO

@echo IF MISC PARTITION NOT FLASHED, BEFORE DEVICE BOOT PRESS DEVICE'S RECOVERY KEY AND ANY KEYBOARD KEY.
@pause >nul
@fastboot reboot >nul && @timeout -t 60 >nul
@pause
@ECHO LISTING PARTITIONS
@set bName=/dev/block/platform/15570000.ufs/by-name
@set bName=/dev/block/bootdevice/by-name
@set sName=/sdcard/koyuyesil/%bkName%
@adb shell ls -l %bName%
ECHO ---%bkName%---
ECHO ---%sName%---

@adb shell mkdir -p %sName%
@ECHO EFS YEDEKLE
@adb shell dd if=%bName%/modemst1 of=%sName%/modemst1.img 2> nul || @echo "DIKKAT YEDEK ALINAMADI"
@adb shell dd if=%bName%/modemst2 of=%sName%/modemst2.img 2> nul || @echo "DIKKAT YEDEK ALINAMADI"
@adb shell dd if=%bName%/fsg of=%sName%/fsg.img 2> nul || @echo "DIKKAT YEDEK ALINAMADI"
@adb shell dd if=%bName%/fsc of=%sName%/fsc.img 2> nul || @echo "DIKKAT YEDEK ALINAMADI"
@adb shell dd if=%bName%/persist of=%sName%/persist.img 2> nul || @echo "DIKKAT YEDEK ALINAMADI"
@adb shell dd if=%bName%/mdm1m9kefs1 of=%sName%/mdm1m9kefs1.img 2> nul || @echo "DIKKAT YEDEK ALINAMADI"
@adb shell dd if=%bName%/mdm1m9kefs2 of=%sName%/mdm1m9kefs2.img 2> nul || @echo "DIKKAT YEDEK ALINAMADI"
@adb shell dd if=%bName%/mdm1m9kefs3 of=%sName%/mdm1m9kefs3.img 2> nul || @echo "DIKKAT YEDEK ALINAMADI"
@adb shell dd if=%bName%/mdm1m9kefsc of=%sName%/mdm1m9kefsc.img 2> nul || @echo "DIKKAT YEDEK ALINAMADI"
@adb shell cp /sdcard/DCIM/Screenshots/*.cit.png %sName%
@adb pull %sName% Backups

::@ECHO EFS SILINIYOR
::@PAUSE
::@adb shell dd if=/dev/zero of=%bName%/modemst1
::@adb shell dd if=/dev/zero of=%bName%/modemst2
::@adb shell dd if=/dev/zero of=%bName%/fsg
::@adb shell dd if=/dev/zero of=%bName%/fsc
::@adb shell dd if=/dev/zero of=%bName%/mdm1m9kefs1
::@adb shell dd if=/dev/zero of=%bName%/mdm1m9kefs2
::@adb shell dd if=/dev/zero of=%bName%/mdm1m9kefs3
::@adb shell dd if=/dev/zero of=%bName%/mdm1m9kefsc
::@ECHO EFS SILME TAMAMLANDI

:: TODO CHECK PIN AND DECYRIPTION
@ECHO SENDING TWRP SCRIPT....
@adb push %rPth%_recovery.zip /sdcard
@ECHO SENDING ROOT SCRIPT....
@adb push Magisk-v24.3.zip /sdcard
@adb push Magisk-v24.3.apk /sdcard
@ECHO TWRP SCRIPT RUNNING
@adb shell twrp install /sdcard/%dc%_recovery.zip 2> nul || @echo "full versiyon yok"
@timeout -t 60 >nul
@ECHO ROOT SCRIPT RUNNING
@adb shell twrp install /sdcard/Magisk-v24.3.zip
@ECHO ROOT FINISH

::@ECHO ANDROID SIDELOAD ACILIYOR....
::@adb shell "twrp sideload" 2> nul && @timeout -t 8
::@ECHO ROOT BETIK CALISTIRILIYIOR
::@adb sideload Magisk-v24.3.zip 2> nul
::@ECHO ROOT ISLEMI TAMAMLANDI
::@ECHO SIDELOAD KAPATILDI && @timeout -t 8

@ECHO REBOOTING
@adb reboot

@echo FOLLOW DEVICE SCREEN
@timeout -t 120
@adb shell "su -c setprop sys.usb.config diag,adb"