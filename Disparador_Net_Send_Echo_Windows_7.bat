rem archivo .bat que llama la ejecución del script "Net_Send_Windows_7\Net_Send_Echo_Windows_7.ps1"
rem se programa su ejecucion con el comando "eventtriggers" disponible en windows por defecto, leer archivo README.md para instrucciones resumidas

powershell.exe "D:\Scripts\Net_Send_Windows_7\Net_Send_Echo_Windows_7.ps1" >> D:\Scripts\Net_Send_Windows_7\log_Eco_Net_send.log
