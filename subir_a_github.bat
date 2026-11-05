@echo off
title ObraControl - Sincronizacion con GitHub
color 0A
echo ========================================================
echo   ObraControl - Sincronizando con GitHub (Push)
echo ========================================================
echo.
cd /d "%~dp0"
git status
echo.
echo Enviando cambios a GitHub...
git push origin main
echo.
echo ========================================================
echo Proceso finalizado.
echo ========================================================
pause
