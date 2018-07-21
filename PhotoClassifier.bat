@echo off
REM Photo Classifier

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

PAUSE