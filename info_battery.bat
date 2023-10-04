@echo off
for /f "usebackq tokens=*" %%i in (`adb shell cat /sys/class/power_supply/battery/capacity`) do set capacity=%%i
for /f "usebackq tokens=*" %%i in (`adb shell cat /sys/class/power_supply/battery/health`) do set health=%%i
for /f "usebackq tokens=*" %%i in (`adb shell cat /sys/class/power_supply/battery/status`) do set status=%%i
for /f "usebackq tokens=*" %%i in (`adb shell cat /sys/class/power_supply/battery/voltage_now`) do set voltage_now=%%i
for /f "usebackq tokens=*" %%i in (`adb shell cat /sys/class/power_supply/battery/current_now`) do set current_now=%%i
for /f "usebackq tokens=*" %%i in (`adb shell cat /sys/class/power_supply/battery/temp`) do set tempature=%%i
for /f "usebackq tokens=*" %%i in (`adb shell cat /sys/class/power_supply/battery/technology`) do set technology=%%i
for /f "usebackq tokens=*" %%i in (`adb shell cat /sys/class/power_supply/battery/charge_counter`) do set charge_counter=%%i
for /f "usebackq tokens=*" %%i in (`adb shell cat /sys/class/power_supply/battery/charge_full_design`) do set charge_full_design=%%i
for /f "usebackq tokens=*" %%i in (`adb shell cat /sys/class/power_supply/battery/charge_full`) do set charge_full=%%i
echo Capacity: %capacity% uAh
echo Health: %health%
echo Status: %status%
echo Voltage: %voltage_now% uV
echo Current: %current_now% uA
echo Temperature: %tempature% mC
echo Technology: %technology%
echo Charge Counter: %charge_counter%
echo Charge Full Design: %charge_full_design% uAh
echo Charge Full: %charge_full% uAh

set /a percentage=charge_counter*100/charge_full

echo %charge_counter% is %percentage%%% of %charge_full%

pause