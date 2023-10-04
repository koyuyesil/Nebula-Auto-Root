@echo off
setlocal enabledelayedexpansion
goto start
:start
REM SÇENEKLER
set "option0=ENG"
set "option1=citrus"
set "option2=courbet"
set "option3=lime"
set "option4=sweet"
set "option5=sweetin"
set "option6=tiare"
set "option7=tiffany"
set "option8=umi"

REM SEÇENEK NUMARALARI
set /a numara=1
echo Modemler:
echo 0. %option0%
echo 1. %option1%
echo 2. %option2%
echo 3. %option3%
echo 4. %option4%
echo 5. %option5%
echo 6. %option6%
echo 7. %option7%
echo 8. %option8%
echo.

:selected
REM SELECTED DEĞİŞKENİ TANIMLANMASI
echo "Cikmak icin 'q' tusuna basin"
echo "Yedeklemek icin 'b' tusuna basin(TWRP)"
set /p selected="Bir secenek numarasi girin(FASTBOOT): "

REM Q TUŞUNA BASILDIYSA ÇIK
if "%selected%"=="q" (
    echo Exit...
    exit /b
) else if "%selected%"=="b" ( 
    goto backup
)

REM SAYILARA BASILDIYSA BASILAN SAYIYA GÖRE DOSYA SEÇİLİR
if "%selected%"=="0" (
    set "option=%option0%"
) else if "%selected%"=="1" (
    set "option=%option1%"
) else if "%selected%"=="2" (
    set "option=%option2%"
) else if "%selected%"=="3" (
    set "option=%option3%"
) else if "%selected%"=="4" (
    set "option=%option4%"
) else if "%selected%"=="5" (
    set "option=%option5%"
) else if "%selected%"=="6" (
    set "option=%option6%"
) else if "%selected%"=="7" (
    set "option=%option7%"
) else if "%selected%"=="8" (
    set "option=%option8%"
) else (
    echo Gecersiz secenek! Lutfen tekrar deneyin.
    goto selected
)

REM SEÇİLEN DOSYAYA GÖRE KOMUT ÇALIŞIR
echo Secilen Secenek: %selected%. %option%
@fastboot flash modem modems\%option%_NON-HLOS.bin

REM KOMUT ÇALIŞIRSA BAŞA DÖNER
echo.
cls
goto start
:backup
::set /p filename="Modem icin dosya ismi yazin: "
for /f "delims=" %%i in ('adb shell getprop ro.product.device') do set filename=%%i
@md backups
@adb shell dd if=/dev/block/bootdevice/by-name/modem of=/sdcard/%filename%_NON-HLOS.bin
@adb pull /sdcard/%filename%_NON-HLOS.bin backups
cls
goto start