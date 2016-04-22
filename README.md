mensajero_Windows_7
===================

Proposito del script: Este script en powershell emula el funcionamiento del mensajero de windows XP bajo windows 7 donde ya no funciona.

Instrucciones: 

* Descargar los archivos de este repositorio:
  Net_Send_Windows_7\Disparador_Net_Send_Echo_Windows_7.bat
  Net_Send_Windows_7\Net_Send_Echo_Windows_7.ps1

* Crear en la máquina windows la carpeta D:\Scripts\Net_Send_Windows_7

* Copiar los archivos descargados en la carpeta creada D:\Scripts\Net_Send_Windows_7

* Ejecutar el comando:
eventtriggers /create /tr echo_Net_Send /l SYSTEM /eid 26 /t "information" /d echo_net_send /tk "D:\Scripts\Net_Send_Windows_7\Disparador_Net_Send_Echo_Windows_7.bat"

Instrucciones detalladas de uso: http://kr1shn4murt1.blogspot.com/2014/10/activar-mensajero-en-windows-7-y-2008.html


