@echo off
setlocal enabledelayedexpansion

REM Каталог для завантажень
set "DOWNLOAD_DIR=macos-images"
if not exist "%DOWNLOAD_DIR%" mkdir "%DOWNLOAD_DIR%"

REM Масив назв
set names[0]=BigSur_11.0.1
set names[1]=Ventura_13.0
set names[2]=Ventura_13.6
set names[3]=Sonoma_14.0
set names[4]=Monterey_12.6.1
set names[5]=Catalina_10.15.7
set names[6]=HighSierra_10.13.6
set names[7]=Mojave_10.14.6
set names[8]=ElCapitan_10.11.6
set names[9]=Yosemite_10.10.5

REM Масив URL-ів
set urls[0]=https://archive.org/download/mac-os-big-sur/macOS%20Big%20Sur%2011.0.1%20(20B29).iso
set urls[1]=https://archive.org/download/mac-os-ventura-13.0/Install%20macOS%20Ventura%2013.0_22A380.iso
set urls[2]=https://archive.org/download/mac-os-13.6-ventura/mac-os-13.6-ventura.iso
set urls[3]=https://archive.org/download/macos-ventura-and-sonoma/MacOS%20Sonoma.iso
set urls[4]=https://archive.org/download/macos-collection/Releases/Monterey%2012.6.1%20v17.6.11.iso
set urls[5]=https://archive.org/download/macos-collection/Releases/Catalina%2010.15.7%20v15.7.03.iso
set urls[6]=https://archive.org/download/macos-collection/Releases/High%20Sierra%2010.13.6%20v13.6.02.iso
set urls[7]=https://archive.org/download/macos-collection/Releases/Mojave%2010.14.6%20v14.6.06.iso
set urls[8]=https://archive.org/download/macos-collection/Releases/El%20Capitan%2010.11.6%20v1.7.50.iso
set urls[9]=https://archive.org/download/macos-collection/Releases/Yosemite%2010.10.5%20v1.6.43.iso

REM Кількість образів
set COUNT=10

echo ------------------------------------
echo Завантаження ISO-образів macOS
echo ------------------------------------

REM Основний цикл
for /L %%i in (0,1,%COUNT%) do (
    call set "name=%%names[%%i]%%"
    call set "url=%%urls[%%i]%%"

    echo.
    echo 🔄 Завантажую !name!...
    aria2c.exe -x16 -d "%DOWNLOAD_DIR%" -o "!name!.iso" "!url!"

    if errorlevel 1 (
        echo ❌ Не вдалося завантажити !name!
    ) else (
        echo ✅ Успішно: !name!
    )
)

echo.
echo ✅ Усі завантаження завершено!
pause
