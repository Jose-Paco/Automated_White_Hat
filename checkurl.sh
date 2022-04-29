#!/bin/bash
checkurl() {
#este script pide una url al usuario y si no dispone de una url vuelve a llamar a la funcion de pedir una url, si todo va bien, cierra la funcion y devuelve como valor un string con la url.
read -p "introduce una url: " url
if [ "$url" != "" ]
then
    wget $url &> /dev/null
    while [ $? != "0" ]
    do
      'checkurl' 
    done
    if [ "$?" == "0" ]
    then
        return $url
    fi
fi
}
