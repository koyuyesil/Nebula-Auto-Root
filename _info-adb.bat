@for /f "delims=" %%i in ('@adb shell getprop ro.system.build.product') do @set product=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.system.build.id') do @set buildid=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.system.build.version.release') do @set release=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.system.build.version.sdk') do @set sdk=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.system.build.version.incremental') do @set incremental=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.cert') do @set cert=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.device') do @set device=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.manufacturer') do @set manufacturer=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.brand') do @set brand=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.marketname') do @set marketname=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.mod_device') do @set mod_device=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.product.model') do @set model=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.boot.hwlevel') do @set hwlevel=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.boot.hwversion') do @set hwversion=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.ril.miui.imei0') do @set imei1=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.ril.miui.imei1') do @set imei2=%%i
::@for /f "delims=" %%i in ('@adb shell getprop ro.ril.oem.imei1') do @set imei1=%%i
::@for /f "delims=" %%i in ('@adb shell getprop ro.ril.oem.imei2') do @set imei1=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.ril.oem.psno') do @set psno=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.ril.oem.sno') do @set sno=%%i
@for /f "delims=" %%i in ('@adb shell getprop ro.boot.cpuid') do @set cpuid=%%i
@for /f "delims=" %%i in ('@adb shell getprop gsm.sim.state') do @set simstate=%%i
@for /f "delims=" %%i in ('@adb shell getprop gsm.version.baseband') do @set baseband=%%i

@set summary="_info-adb-sum-%device%-%hwlevel%-%hwversion%-%buildid%-%incremental%-%cpuid%.txt"

@echo PRODUCT	   :%product% > %summary%
@echo BUILD ID     :%buildid% >> %summary%
@echo ANDROID      :%release% >> %summary%
@echo SDK          :%sdk% >> %summary%
@echo incremental  :%incremental% >> %summary%
@echo CERT         :%cert% >> %summary%
@echo DEVICE       :%device% >> %summary%
@echo MANUFACTURER :%manufacturer% >> %summary%
@echo BRAND        :%brand% >> %summary%
@echo MARKETNAME   :%marketname% >> %summary%
@echo MOD_DEVICE   :%mod_device% >> %summary%
@echo MODEL        :%model% >> %summary%
@echo HW_VERSION   :%hwlevel%-%hwversion% >> %summary%
@echo RIL IMEI 1   :%imei1% >> %summary%
@echo RIL IMEI 2   :%imei2% >> %summary%
@echo PSNO         :%psno% >> %summary%
@echo SNO          :%sno% >> %summary%
@echo CPUID        :%cpuid% >> %summary%
@echo SIMSTATE     :%simstate% >> %summary%
@echo BASEBAND     :%baseband% >> %summary%

@echo off
echo echo|set /p="ANDROID 4 SS IMEI 	:"
adb shell "service call iphonesubinfo 1 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

echo echo|set /p="ANDROID 4 DS IMEI0	:"
adb shell "service call iphonesubinfo 1 i32 1 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

echo echo|set /p="ANDROID 4 DS IMEI1 	:"
adb shell "service call iphonesubinfo 1 i32 2 | cut -c 52-66 | tr -d '.[:space:]'"
echo . 

echo echo|set /p="ANDROID 5 SS IMEI 	:"
adb shell "service call iphonesubinfo 3 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

echo echo|set /p="ANDROID 5 DS IMEI0 	:"
adb shell "service call iphonesubinfo 3 i32 1 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

echo echo|set /p="ANDROID 5 DS IMEI1 	:"
adb shell "service call iphonesubinfo 3 i32 2 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

echo echo|set /p="ANDROID 6-10 SS IMEI 	:"
adb shell "service call iphonesubinfo 4 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

echo echo|set /p="ANDROID 6-10 DS IMEI0	:"
adb shell "service call iphonesubinfo 4 i32 1 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

echo echo|set /p="ANDROID 6-10 DS IMEI1	:"
adb shell "service call iphonesubinfo 4 i32 2 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

echo echo|set /p="ANDROID 6-10 DS IMEI2	:"
adb shell "service call iphonesubinfo 4 i32 4 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

echo echo|set /p="ANDROID 11 SS IMEI 	:"
adb shell "service call iphonesubinfo 5 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

echo echo|set /p="ANDROID 11 DS IMEI0	:"
adb shell "service call iphonesubinfo 5 i32 1 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

echo echo|set /p="ANDROID 11 DS IMEI1	:"
adb shell "service call iphonesubinfo 5 i32 2 | cut -c 52-66 | tr -d '.[:space:]'"
echo .

adb shell getprop > "_info-adb-all-%device%-%hwlevel%-%hwversion%-%buildid%-%incremental%-%cpuid%.txt"
@pause