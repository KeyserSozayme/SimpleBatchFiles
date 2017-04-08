@ECHO OFF

:: Change directory (across a disk) to C:
CD /D C:\

:: Set Source and Destination Locations
SET copySource=%APPDATA%\.minecraft
SET copyDest=\\DC\MinecraftBackup

ECHO Source     : %copySource%
ECHO Destination: %copyDest%

:: Copy the .minecraft directory to the backup directory
ROBOCOPY "%copySource%" "%copyDest%\Backup %Date%" /XO /E /MIR /Z /LOG+:"%copyDest%\_Logs\Backup %DATE%.txt"

::Quit the file
EXIT