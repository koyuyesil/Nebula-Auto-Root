@ECHO SIDELOAD ACILIYOR ROOT EDILIYOR
@adb shell twrp sideload
@timeout -t 5 >nul
@adb sideload Magisk-v25.2.zip
@ECHO YENIDEN BASLATMAK ICIN BIR TUSA BASALIM
@pause >nul
@adb reboot