@echo off
REM Photo Classifier
REM https://github.com/jayeeeeee/photo-classifier/
cls
echo "   ___ _           _                     "
echo "  / _ \ |__   ___ | |_ ___               "
echo " / /_)/ '_ \ / _ \| __/ _ \              "
echo "/ ___/| | | | (_) | || (_) |             "
echo "\/    |_| |_|\___/ \__\___/              "
echo "   ___ _               _  __ _           "
echo "  / __\ | __ _ ___ ___(_)/ _(_) ___ _ __ "
echo " / /  | |/ _` / __/ __| | |_| |/ _ \ '__|"
echo "/ /___| | (_| \__ \__ \ |  _| |  __/ |   "
echo "\____/|_|\__,_|___/___/_|_| |_|\___|_|   "
echo.
echo This will classify files under this directory by copying into classified folder.

REM Menu.
set /p choice=Start? (y/n):
if /I not "%choice%" == "y" goto :end

REM Setup.
set batchFilename=%~n0%~x0
set folderName="classified"

SETLOCAL ENABLEDELAYEDEXPANSION
for /r %%f in (*) do (
    REM Get filename.
    set filename=%%~nf
    set fileExtension=%%~xf
    set fullFilename=!filename!!fileExtension!

    if not !fullFilename! == %batchFilename% (
        REM Create directory by datetime.
        set lastModifiedDate=%%~tf
        set year=!lastModifiedDate:~0, 4!
        set month=!lastModifiedDate:~5, 2!
        set day=!lastModifiedDate:~8, 2!
        set directoryName=!year!.!month!.!day!
        if not exist %folderName%/!directoryName! md %folderName%/!directoryName!

        REM Copy file.
        echo !fullFilename!
        copy !fullFilename! "%folderName%/!directoryName!"
    )
) 

:end
PAUSE