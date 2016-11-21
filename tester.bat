ECHO OFF
CLS
SETLOCAL ENABLEEXTENSIONS
SET me=%~n0
SET parent=%~dp0


ECHO This is Me: %me%
ECHO This is my parent: %parent%
ECHO This is my full path: %parent%%me%

CD /D %parent%
ECHO testestest > text.txt