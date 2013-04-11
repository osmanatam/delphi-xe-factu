@echo off
color a
echo Instalando servicio 
ping localhost -n 2 >nul
cls
"%~d0%~p0\WSProyecto.exe" /install
net start WSPruebasMain