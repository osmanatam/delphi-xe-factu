@echo off

@echo ===============================================
@echo ====      Borrando ficheros temporales     ====
@echo ===============================================
@echo == 	Archivos *.~*
@echo on
del *.~* /s /Q	
@echo == 	Archivos *.bak
del *.bak /s /Q	
@echo == 	Archivos *.old
del *.old /s /Q	
@echo == 	Ficheros *.ddp
del *.ddp /s /Q	
echo ---------------------------------------------
@echo on