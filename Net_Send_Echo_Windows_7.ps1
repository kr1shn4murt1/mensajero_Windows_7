#Autor: @kr1shn4murt1
#Fecha de creación: Octubre 25 de 2012
#Lenguaje: Powershell
# Instrucciones detalladas de uso: http://kr1shn4murt1.blogspot.com/2014/10/activar-mensajero-en-windows-7-y-2008.html
#Proposito del script: Este script emula el funcinamiento del mensajero de windows XP bajo windows 7 donde #ya no funciona. Ejecuta un proceso remoto
#en un listado de maquinas y haciendo uso del mensajero local, el comando msg *
#También se apoya en el comando evventtriggers para disparar la tarea, el parámetro de mensaje lo obtiene #del visor de eventos del servidor donde llego
#el net send luego lo replica al listado de maquinas de windows 7 o 2008 para que les llegue el mensaje.

write-host -----------------------------------------------------------------------------------------------------------------------------

$fechaHoraInicio = Get-Date #Se obtiene la fecha actual
write-host Hora de inicio del Script $fechaHoraInicio #Se imprime en pantalla la fecha actual

$log = get-eventlog -log system -source "Application Popup" -newest 1 | format-list -Property ReplacementStrings | Out-String #Se obtiene del visor de eventos el ultimo mensaje net send recibido por el #equipo

write-host $fechaHoraInicio # Se imprime la hora de inicio del script

$logfiltrado = $log.substring(150) # Se eliminan los caracteres basura del evento capturado como string
$logFinal = $logfiltrado -replace "}"

#Archivo donde están los PC's
$listado_Computadores = get-content D:\Scripts\Net_Send_Windows_7\Ips_Windows_7.txt # Se obtiene el listado de computadores de un archivo éste archivo tiene en cada linea una ip o nombre de equipo

$ComandoAEjecutar="msg * $logFinal" # Se declara el comando para ejecutarlo mas abajo
write-host Se enviara el mensaje $logFinal

foreach ($computador in $listado_Computadores) #Inicio Ciclo
    {
            
    write-host "Se esta enviando el mensaje al equipo $computador"
   
    ([WmiClass]"\\$computador\ROOT\CIMV2:Win32_Process").Create($ComandoAEjecutar) # Se crea el proceso #remoto en la maquina, aqui es donde se ve la emulación no se usa net send que está desactivado si no que #se usa el mensajero local de cada equipo pero activado desde un equipo remoto.
        
    } # Final ciclo

$fechaHoraFinal = Get-Date
write-host Hora de finalizacion del Script $fechaHoraFinal #se imprime la hora de finalizacion del script.
write-host ""
write-host *****************************************************************************************************************************