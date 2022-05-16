@adb shell dd if=/sdcard/NON-HLOS.bin of=/dev/block/bootdevice/by-name/modem 2> nul || @echo "modem flash error"
::@adb shell dd if=/sdcard/factory_nv.img of=/dev/block/bootdevice/by-name/fsg 2> nul || @echo "fsg flash error"
::@adb shell dd if=/sdcard/factory_nv.img of=/dev/block/bootdevice/by-name/mdm1m9kefs3 2> nul || @echo "mdm1m9kefs3 flash error"
pause
adb reboot