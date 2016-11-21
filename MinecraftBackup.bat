:: Change directory (across a disk) to C:
cd /d C:\

:: Set Source and Destination Locations
set copySource=%APPDATA%\.minecraft
set copyDest=\\DC\MinecraftBackup

:: Do not output any text to the command line
echo off

:: Copy the .minecraft directory to the backup directory
robocopy "%copySource%" "%copyDest%\Backup %Date%" /xo /e /mir /z /log+:"%copyDest%\_Logs\Backup %DATE%.txt"

::Quit the file
exit