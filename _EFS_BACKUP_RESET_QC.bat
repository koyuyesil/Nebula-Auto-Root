@for /f "delims=" %%i in ('@adb shell getprop ro.build.product') do @set product=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.device') do @set device=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.boot.hwlevel') do @set hwlevel=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.boot.hwversion') do @set hwversion=%%i
@set BackupFolder=Backups\%device%-EFS-Backups-%date:~10%%date:~7,2%%date:~4,2%%time:~0,2%%time:~3,2%%time:~6,2%-%hwlevel%-%hwversion%
@md %BackupFolder%

@ECHO BOLUM LISTESI
@PAUSE
@adb shell ls -l /dev/block/bootdevice/by-name/
::samsung 
@adb shell ls -l /dev/block/by-name/

@ECHO EFS YEDEKLE
@PAUSE
::@adb shell dd if=/dev/block/bootdevice/by-name/modem of=/sdcard/NON-HLOS.bin
@adb shell dd if=/dev/block/bootdevice/by-name/devinfo of=/sdcard/devinfo.img
@adb shell dd if=/dev/block/bootdevice/by-name/fsc of=/sdcard/fsc.img
@adb shell dd if=/dev/block/bootdevice/by-name/fsg of=/sdcard/fsg.img
@adb shell dd if=/dev/block/bootdevice/by-name/keystore of=/sdcard/keystore.img
@adb shell dd if=/dev/block/bootdevice/by-name/mdm1m9kefs1 of=/sdcard/mdm1m9kefs1.img
@adb shell dd if=/dev/block/bootdevice/by-name/mdm1m9kefs2 of=/sdcard/mdm1m9kefs2.img
@adb shell dd if=/dev/block/bootdevice/by-name/mdm1m9kefs3 of=/sdcard/mdm1m9kefs3.img
@adb shell dd if=/dev/block/bootdevice/by-name/mdm1m9kefsc of=/sdcard/mdm1m9kefsc.img
@adb shell dd if=/dev/block/bootdevice/by-name/modemst1 of=/sdcard/modemst1.img
@adb shell dd if=/dev/block/bootdevice/by-name/modemst2 of=/sdcard/modemst2.img
@adb shell dd if=/dev/block/bootdevice/by-name/persist of=/sdcard/persist.img
::samsung exynos
@adb shell "su -c dd if=/dev/block/by-name/efs of=/sdcard/efs.img"
@adb shell "su -c dd if=/dev/block/by-name/m9kefs1 of=/sdcard/m9kefs1.img"
@adb shell "su -c dd if=/dev/block/by-name/m9kefs2 of=/sdcard/m9kefs2.img"
@adb shell "su -c dd if=/dev/block/by-name/m9kefs3 of=/sdcard/m9kefs3.img"


@adb pull /sdcard/devinfo.img %BackupFolder%
@adb pull /sdcard/fsc.img %BackupFolder%
@adb pull /sdcard/fsg.img %BackupFolder%
@adb pull /sdcard/keystore.img %BackupFolder%
@adb pull /sdcard/modemst1.img %BackupFolder%
@adb pull /sdcard/modemst2.img %BackupFolder%
@adb pull /sdcard/persist.img %BackupFolder%
@adb pull /sdcard/NON-HLOS.bin %BackupFolder%
@adb pull /sdcard/mdm1m9kefs1.img %BackupFolder%
@adb pull /sdcard/mdm1m9kefs2.img %BackupFolder%
@adb pull /sdcard/mdm1m9kefs3.img %BackupFolder%
@adb pull /sdcard/mdm1m9kefsc.img %BackupFolder%
::samsung exynos
@adb pull /sdcard/efs.img %BackupFolder%
@adb pull /sdcard/m9kefs1.img %BackupFolder%
@adb pull /sdcard/m9kefs2.img %BackupFolder%
@adb pull /sdcard/m9kefs3.img %BackupFolder%


@ECHO EFS SIL
@PAUSE
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/devinfo
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/fsc
@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/fsg
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/keystore
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/mdm1m9kefs1
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/mdm1m9kefs2
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/mdm1m9kefs3
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/mdm1m9kefsc
@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/modemst1
@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/modemst2
::@adb shell dd if=/dev/zero of=/dev/block/bootdevice/by-name/persist
::samsung exynos
@adb shell "su -c dd if=/dev/zero of=/dev/block/by-name/efs"
@adb shell "su -c dd if=/dev/zero of=/dev/block/by-name/m9kefs1"
@adb shell "su -c dd if=/dev/zero of=/dev/block/by-name/m9kefs2"
@adb shell "su -c dd if=/dev/zero of=/dev/block/by-name/m9kefs3"


@ECHO EFS YUKLE
@PAUSE
::@adb shell dd if=/sdcard/NON-HLOS.bin of=/dev/block/bootdevice/by-name/modem
::@adb shell dd if=/sdcard/factory_nv.img of=/dev/block/bootdevice/by-name/fsg
::@adb shell dd if=/sdcard/factory_nv.img of=/dev/block/bootdevice/by-name/mdm1m9kefs3

@ECHO YENIDEN BASLAT
@PAUSE 
@adb reboot
