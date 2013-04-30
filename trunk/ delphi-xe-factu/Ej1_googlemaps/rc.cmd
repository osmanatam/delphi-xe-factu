@echo off

echo **************************************************
echo      COMPILANDO RECURSOS 
echo **************************************************
del MapaRes.res
brcc32 MapaRes.rc > Errores.txt

type Errores.txt
pause