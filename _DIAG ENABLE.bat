@echo TELEFON EKRANINI TAKIP EDEREK KLAVYEDEN BIR TUSA BASINIZ
@adb shell "setprop sys.usb.config diag,adb"
@adb shell "su -c setprop sys.usb.config diag,adb"

@pause >nul