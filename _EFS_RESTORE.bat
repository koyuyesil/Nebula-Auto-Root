@ECHO BOLUM LISTESI
@PAUSE
@adb shell ls -l /dev/block/bootdevice/by-name/

@ECHO EFS GERI YUKLE
@PAUSE

::@adb shell dd if=/sdcard/NON-HLOS.bin of=/dev/block/bootdevice/by-name/modem
@adb shell dd if=/sdcard/modemst1.img of=/dev/block/bootdevice/by-name/modemst1
@adb shell dd if=/sdcard/modemst2.img of=/dev/block/bootdevice/by-name/modemst2
@adb shell dd if=/sdcard/fsg.img of=/dev/block/bootdevice/by-name/fsg
@adb shell dd if=/sdcard/fsc.img of=/dev/block/bootdevice/by-name/fsc
::@adb shell dd if=/sdcard/persist.img of=/dev/block/bootdevice/by-name/persist
@adb shell dd if=/sdcard/mdm1m9kefs1.img of=/dev/block/bootdevice/by-name/mdm1m9kefs1
@adb shell dd if=/sdcard/mdm1m9kefs2.img of=/dev/block/bootdevice/by-name/mdm1m9kefs2
@adb shell dd if=/sdcard/mdm1m9kefs3.img of=/dev/block/bootdevice/by-name/mdm1m9kefs3
@adb shell dd if=/sdcard/mdm1m9kefsc.img of=/dev/block/bootdevice/by-name/mdm1m9kefsc

@ECHO YENIDEN BASLAT
@PAUSE 
@adb reboot
