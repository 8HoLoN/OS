@echo off
setlocal enabledelayedexpansion
cls
:: HashAlgorithm choices: MD2 MD4 MD5 SHA1 SHA256 SHA384 SHA512
:: http://www.dostips.com/DtTutoFunctions.php
:: http://stackoverflow.com/questions/17605767/create-list-or-arrays-in-windows-batch

::copy /y nul fp.txt >nul

set "hash="

set n=0
for /r %%i in (*) do (
    set pathVector[!n!]=%%i
    set /A n+=1
)
set /A n-=1

set m=0
for /L %%i in (0,1,%n%) do (
    echo !pathVector[%%i]!
    FOR /F "usebackq" %%A IN ('!pathVector[%%i]!') DO set size=%%~zA
    if !size! LSS 1 (
        set hashVector[!m!]=d41d8cd98f00b204e9800998ecf8427e
    ) ELSE (
        set hash=
        call:computeHash hash !pathVector[%%i]!
        set hashVector[!m!]=!hash!
    )
    set /A m+=1
)

:: echo/
:: echo !hash! %%i >> fp.txt
(for /L %%i in (0,1,%n%) do (
    echo !hashVector[%%i]! !pathVector[%%i]!
)) > fp.txt

::echo.&pause&goto:eof
goto:eof
::--------------------------------------------------------
::-- Function section starts below here
::--------------------------------------------------------
:computeHash       -- Compute Hash
::                 -- %~1: return hash
::                 -- %~2: filename
REM.--function body here

for /f "delims=" %%a in ('CertUtil -hashfile %~2 MD5 ^| findstr /r /c:"^[0-9a-f][0-9a-f] [0-9a-f]"') do set hash=%%~a
set SEARCHTEXT= 
set REPLACETEXT=
SET cleanHash=!hash:%SEARCHTEXT%=%REPLACETEXT%!

(ENDLOCAL & REM -- RETURN VALUES
    IF "%~1" NEQ "" SET %~1=%cleanHash%
)
GOTO:EOF
