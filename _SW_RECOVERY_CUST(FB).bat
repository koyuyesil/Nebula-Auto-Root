@adb reboot bootloader

@for /f "tokens=2 delims=: " %%i in ('@fastboot %* getvar product 2^>^&1 ^| findstr /r /c:"product:"') do (@set prd=%%i)

@ECHO Cihaz Kod Adi	: %PRD%
@echo RECOVERY HARICI DOSYADAN BOOT EDILIYOR...
::@for /f "tokens=2 delims=: " %%x in ('dir %PRD%*.img /b ^| findstr twrp*') do (@set filex=%%x)
::@for /f "tokens=2 delims=: " %%y in ('dir *%PRD%.zip /b ^| findstr twrp-installer*') do (@set filey=%%y)
::@for /f "tokens=2 delims=: " %%z in ('dir *.zip /s /b ^| findstr Magisk*') do (@set filez=%%z)
@set filex=%CONCRATES%\%PRD%_recovery.img
@set filey=%CONCRATES%\%PRD%_recovery.zip
@set filez=Magisk-v24.3.zip
@set rootapk=Magisk-v24.3.apk

@echo RECOVERY BOOTING
@fastboot boot %filex% 2> nul
@timeout -t 40
@ECHO SENDING APK...
@adb push %rootapk% /sdcard
::@ECHO SENDING TWRP SCRIPT...
::@adb push %filey% /sdcard
@ECHO SENDING ROOT SCRIPT...
@adb push %filez% /sdcard
pause
::@ECHO TWRP SCRIPT RUNNING...
::@adb shell twrp install /sdcard/%PRD%_recovery.zip 2> nul || @echo "no flashable recovery image"
::@timeout -t 40

@ECHO ROOT SCRIPT RUNNING
@adb shell twrp install /sdcard/%filez% 2> nul || @echo "no flashable root script"
@ECHO ROOT FINISH
@ECHO REBOOT
@pause
@adb reboot
@pause