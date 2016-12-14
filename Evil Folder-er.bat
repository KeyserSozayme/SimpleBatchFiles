@ECHO OFF
SETLOCAL

::###############::
::## Variables ##::
::###############::

SET me=%~n0
SET localDesktop=%USERPROFILE%\Desktop
SET localTemp=%TMP% 
SET varFolderAmount=500
SET varFileAmount=500
SET varFileSize=1048576

::##########::
::## MAIN ##::
::##########::

SET /P varFolderAmount="How many Folders to create? (Default, %varFolderAmount%): "
SET /P varFileAmount="How many files would you like to create per folder? (Default, %varFileAmount%): "
SET /P varFileSize="How large would you like each file to be in bytes? (Default, %varFileSize%): "
CD /D "%localDesktop%"
CALL :funcCreateFolders

EXIT

::###############::
::## Functions ##::
::###############::

:funcCreateFolders
FOR /L %%G IN (1,1,%varFolderAmount%) DO (
  MKDIR "Please Log Out (%%G)" > NUL 2>&1 && ECHO %me% --^> Successfully Created Folder: %%G
  CALL :funcCreateFiles
  
)
GOTO:EOF

:funcCreatefiles
FOR /L %%H IN (1,1,%varFileAmount%) DO (
	FSUTIL FILE CREATENEW "Please Log Out (%%G)\Dummy %%H.txt" %varFileSize%
)
GOTO:EOF