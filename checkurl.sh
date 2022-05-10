#!/bin/bash
checkurl() {
#este script pide una url al usuario y si no dispone de una url vuelve a llamar a la funcion de pedir una url, si todo va bien, cierra la funcion y devuelve como valor un string con la url.
read -r -p "Dime la URL:" url
homer=$(curl -i -s "$url" | grep -q "200 OK")
if [ -n "$url" ]
then
    if [ -n "$homer" ]
    then
        return 0
    else
        echo "La url $url no es valida"
        'checkurl'
    fi
else
    echo "No has introducido ninguna URL"
    'checkurl'
fi
}
