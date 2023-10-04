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
::@adb shell ls -l /dev/block/by-name/

@ECHO EFS YEDEKLE
@PAUSE

::REDMAGIC
@adb shell "su -c dd if=/dev/block/by-name/fsc of=/sdcard/fsc.img"
@adb shell "su -c dd if=/dev/block/by-name/fsg of=/sdcard/fsg.img"
@adb shell "su -c dd if=/dev/block/by-name/modemst1 of=/sdcard/modemst1.img"
@adb shell "su -c dd if=/dev/block/by-name/modemst2 of=/sdcard/modemst2.img"



@adb pull /sdcard/fsc.img %BackupFolder%
@adb pull /sdcard/fsg.img %BackupFolder%
@adb pull /sdcard/modemst1.img %BackupFolder%
@adb pull /sdcard/modemst2.img %BackupFolder%


::REDMAGIC
@adb pull /sdcard/fsc.img %BackupFolder%
@adb pull /sdcard/fsg.img %BackupFolder%
@adb pull /sdcard/modemst1.img %BackupFolder%
@adb pull /sdcard/modemst2.img %BackupFolder%


@ECHO EFS SIL
@PAUSE

@adb shell "su -c dd if=/dev/zero of=/dev/block/by-name/fsc"
@adb shell "su -c dd if=/dev/zero of=/dev/block/by-name/fsg"
@adb shell "su -c dd if=/dev/zero of=/dev/block/by-name/modemst1"
@adb shell "su -c dd if=/dev/zero of=/dev/block/by-name/modemst2"


@ECHO EFS YUKLE
@PAUSE
::@adb shell dd if=/sdcard/NON-HLOS.bin of=/dev/block/bootdevice/by-name/modem
::@adb shell dd if=/sdcard/factory_nv.img of=/dev/block/bootdevice/by-name/fsg
::@adb shell dd if=/sdcard/factory_nv.img of=/dev/block/bootdevice/by-name/mdm1m9kefs3

@ECHO YENIDEN BASLAT
@PAUSE 
@adb reboot
