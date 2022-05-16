@adb reboot bootloader
@fastboot erase nvram
@fastboot erase nvdata
::@fastboot format:ext4 nvdata
@echo OPEN MODEM META AND PRESS CONNECT BUTTON
@PAUSE 
@fastboot reboot-bootloader