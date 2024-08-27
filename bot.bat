@echo off
setlocal enabledelayedexpansion
set "rootDir=%cd%"

echo Memulai pencarian dan penghapusan node_modules dari %rootDir%
pause

rem Panggil fungsi recursiveDelete dengan rootDir sebagai parameter
call :recursiveDelete "%rootDir%"

pause
exit /b

:recursiveDelete
rem Untuk setiap folder di dalam direktori yang diberikan
for /d %%i in ("%1\*") do (
    rem Jika nama folder adalah node_modules, hapus folder tersebut
    if /I "%%~nxi"=="node_modules" (
        echo Menghapus "%%i"
        rd /s /q "%%i"
    ) else (
        rem Rekursif panggil fungsi ini lagi untuk folder tersebut
        call :recursiveDelete "%%i"
    )
)

exit /b
