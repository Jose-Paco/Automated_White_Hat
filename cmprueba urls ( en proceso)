#!/bin/bash
. ./menu.sh

function checkurl() {
read -p "introduce una url: " url
if [ "$url" != "" ]
then
    wget $url > /dev/null
    while [ $? != "0" ]
    do
      clear
      'checkurl'
    done
    if [ "$?" == "0" ]
    then
        '_menuPrincipal'
    #else
    #    echo "adios"
    fi
else
    echo "Pues si no me quires decir tu url peor para ti"
fi
}
#main
'checkurl'
