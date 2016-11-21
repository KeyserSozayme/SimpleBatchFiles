@ECHO OFF
SETLOCAL

::###############::
::## Variables ##::
::###############::

SET me=%~n0
SET localDesktop=%USERPROFILE%\Desktop
SET localTemp=%TMP% 
SET varFolderAmount=500

::##########::
::## MAIN ##::
::##########::

SET /P varFolderAmount="How many Folders to create?: "
CD /D "%localDesktop%"
CALL :funcCreateFolders

EXIT

::###############::
::## Functions ##::
::###############::

:funcCreateFolders
FOR /L %%G IN (1,1,%varFolderAmount%) DO (
  MKDIR "Please Log Out (%%G)" > NUL 2>&1 && ECHO %me% --^> Successfully Created Folder: %%G
)
GOTO:EOF