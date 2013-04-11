@echo off
color a
cls
net stop WSPruebasMain
ping localhost -n 2 >nul
"%~d0%~p0\WSProyecto.exe" /uninstall
ping localhost -n 3 >nul
cls
exit
