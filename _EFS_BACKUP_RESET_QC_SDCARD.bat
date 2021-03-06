@for /f "delims=" %%i in ('@adb shell getprop ro.build.product') do @set product=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.boot.hwlevel') do @set hwlevel=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.boot.hwversion') do @set hwversion=%%i
@set BackupFolder=Backups\%product%-EFS-Backups-%date:~10%%date:~7,2%%date:~4,2%%time:~0,2%%time:~3,2%%time:~6,2%-%hwlevel%-%hwversion%
@md %BackupFolder%

@ECHO BOLUM LISTESI
@PAUSE
@adb shell ls -l /dev/block/bootdevice/by-name/

@ECHO EFS YEDEKLE
@PAUSE
::@adb shell dd if=/dev/block/bootdevice/by-name/modem of=/sdcard1/NON-HLOS.bin
@adb shell dd if=/dev/block/bootdevice/by-name/devinfo of=/sdcard1/devinfo.img
@adb shell dd if=/dev/block/bootdevice/by-name/fsc of=/sdcard1/fsc.img
@adb shell dd if=/dev/block/bootdevice/by-name/fsg of=/sdcard1/fsg.img
@adb shell dd if=/dev/block/bootdevice/by-name/keystore of=/sdcard1/keystore.img
@adb shell dd if=/dev/block/bootdevice/by-name/mdm1m9kefs1 of=/sdcard1/mdm1m9kefs1.img
@adb shell dd if=/dev/block/bootdevice/by-name/mdm1m9kefs2 of=/sdcard1/mdm1m9kefs2.img
@adb shell dd if=/dev/block/bootdevice/by-name/mdm1m9kefs3 of=/sdcard1/mdm1m9kefs3.img
@adb shell dd if=/dev/block/bootdevice/by-name/mdm1m9kefsc of=/sdcard1/mdm1m9kefsc.img
@adb shell dd if=/dev/block/bootdevice/by-name/modemst1 of=/sdcard1/modemst1.img
@adb shell dd if=/dev/block/bootdevice/by-name/modemst2 of=/sdcard1/modemst2.img
@adb shell dd if=/dev/block/bootdevice/by-name/persist of=/sdcard1/persist.img
@adb shell dd if=/dev/block/bootdevice/by-name/secdata  of=/sdcard1/secdata.img
::@adb shell dd if=/dev/block/bootdevice/by-name/vendor of=/sdcard1/vendor.img

::@adb pull /sdcard1/NON-HLOS.bin %BackupFolder%
@adb pull /sdcard1/devinfo.img %BackupFolder%
@adb pull /sdcard1/fsc.img %BackupFolder%
@adb pull /sdcard1/fsg.img %BackupFolder%
@adb pull /sdcard1/keystore.img %BackupFolder%
::@adb pull /sdcard1/mdm1m9kefs1.img %BackupFolder%
::@adb pull /sdcard1/mdm1m9kefs2.img %BackupFolder%
::@adb pull /sdcard1/mdm1m9kefs3.img %BackupFolder%
::@adb pull /sdcard1/mdm1m9kefsc.img %BackupFolder%
@adb pull /sdcard1/modemst1.img %BackupFolder%
@adb pull /sdcard1/modemst2.img %BackupFolder%
@adb pull /sdcard1/persist.img %BackupFolder%
@adb pull /sdcard1/secdata.img %BackupFolder%
::@adb pull /sdcard1/vendor.img %BackupFolder%

@ECHO EFS SIL
@PAUSE
@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/modemst1
@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/modemst2
@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/fsg
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/fsc
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/persist
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/devinfo
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/keystore
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/mdm1m9kefs1
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/mdm1m9kefs2
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/mdm1m9kefs3
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/mdm1m9kefsc

@ECHO EFS YUKLE
@PAUSE
::@adb shell dd if=/sdcard1/NON-HLOS.bin of=/dev/block/bootdevice/by-name/modem
::@adb shell dd if=/sdcard1/factory_nv.img of=/dev/block/bootdevice/by-name/fsg
::@adb shell dd if=/sdcard1/factory_nv.img of=/dev/block/bootdevice/by-name/mdm1m9kefs3

@ECHO YENIDEN BASLAT
@PAUSE 
@adb reboot
