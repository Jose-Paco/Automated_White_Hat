#!/bin/bash
checkurl() {
#este script pide una url al usuario y si no dispone de una url vuelve a llamar a la funcion de pedir una url, si todo va bien, cierra la funcion y devuelve como valor un string con la url.
read -p "Introduce una url: " url
if [ "$url" != "" ]
then
    if [ curl -i -s $url | grep "200 OK" ]
    then
        return $url
    else
        echo -e "La url $url no es valida"
    fi
else
    echo -e "No has introducido ninguna URL"
    'checkurl'
fi
}
