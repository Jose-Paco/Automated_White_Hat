#!/bin/bash
#source /repositorios/aquivanelrestodesh.
./funcion.sh
'controlerror'

#Muestra el menu general
function 3_menuPrincipal() {  
    clear
    url=$(checkurl)
    vector=$(vectores '$url')
    echo "Los ataques disponibles a la página web " . $url . " son los siguientes: " . ${vector[@]}
    while [$tipoDeAtaque > 3 | tipoDeAtaque < 1]
    do 
        echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SqlInjection pulsa 2.\nPara ejecutar un ataque de XSS pulsa 3."
        read -p "" tipoDeAtaque
    done
    instalaciones
    case $tipoDeAtaque in
		1)
			clear
			ataque_diccionario
			;;
		2)
			clear
			ataque_sql
			;;
		3)
			clear
			ataque_xss
			;;
	esac
}
#main
#'_menuPrincipal'
