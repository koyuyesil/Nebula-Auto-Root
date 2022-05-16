@echo FASTBOOT MODA ALINIYOR
@adb reboot bootloader 2> nul || @echo ADB AYGITINA BAGLANILAMADI& echo.	Adb Izni Gerekli Olabilir & echo.	Birden Fazla Aygit Bagli Olabilir& echo.	Aygit Bagli Olmayabilir& echo.	Manuel olarak FASTBOOT moduna aliniz.
@echo FASTBOOT EKRANINDA ISE BIR TUSA BASALIM
@pause >nul
@for /f "tokens=2 delims=: " %%i in ('fastboot %* getvar product 2^>^&1 ^| findstr /r /c:"product:"') do (@set prd=%%i)
@ECHO Cihaz Kod Adi	: %PRD%
@echo RECOVERY FLASHLANIYOR

@fastboot flash boot images\boot.img
@fastboot flash recovery images\recovery.img
@fastboot reboot