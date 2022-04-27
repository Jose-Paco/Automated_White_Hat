#!/bin/bash
#source /repositorios/aquivanelrestodesh.
#./funcion.sh
source 3_controlerror.sh
source 3_volvermenu.sh
source 3_instalaciones.sh
source 3_diccionario.sh
source 3_checkurl.sh
source 3_xss.sh
source 3_sqli.sh
source 3_vectores.sh
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
			3_xss.sh
			;;
		2)
			clear
			3_sqli.sh
			;;
		3)
			clear
			3_xss.sh
			;;
	esac
}
#main
#'_menuPrincipal'
