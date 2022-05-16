@ECHO SIDELOAD ACILIYOR ROOT EDILIYOR
@adb shell twrp sideload
@timeout -t 5 >nul
@adb sideload Magisk-v24.3.zip
@ECHO YENIDEN BASLATMAK ICIN BIR TUSA BASALIM
@pause >nul
@adb reboot