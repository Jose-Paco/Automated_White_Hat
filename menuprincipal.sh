#!/bin/bash
source controlerror.sh
source volvermenu.sh
source instalaciones.sh
source diccionario.sh
source checkurl.sh
source xss.sh
source sqli.sh
source vectores.sh
function menuPrincipal() {  
    clear
    url=$(checkurl)
    vector=$(vectores '$url')
    #if csrf "es segura la web contra esta herramienta, else lo siguiente
    echo "Los ataques disponibles a la página web " . $url . " son los que aparecen a continuación: "
    if [[ echo $vector | grep 'xss' ]]
    then
    	echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SqlInjection pulsa 2.\nPara ejecutar un ataque de XSS pulsa 3."
     	read -p "" tipoDeAtaque
	instalaciones
	case $tipoDeAtaque in
		1)
			clear
			'diccionario'
			;;
		2)
			clear
			'sqli'
			;;
		3)
			clear
			'xss'
			;;
	esac
     else
	if [[ echo $vector | grep 'xss' && grep 'diccionario' ]]
    then
    	echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de XSS pulsa 2."
     	read -p "" tipoDeAtaque
	instalaciones
	case $tipoDeAtaque in
		1)
			clear
			diccionario.sh
			;;
		2)
			clear
			xss.sh
			;;
	esac
      else
	if [[ echo $vector | grep 'sql' && grep 'diccionario' ]]
    then
    	echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SQL pulsa 2."
     	read -p "" tipoDeAtaque
	instalaciones
	case $tipoDeAtaque in
		1)
			clear
			diccionario.sh
			;;
		2)
			clear
			sqli.sh
			;;
	esac
      else
	if [[ echo $vector | grep 'diccionario' ]]
    then
    	echo -e "Para ejecutar un ataque de Diccionario pulsa 1."
     	read -p "" tipoDeAtaque
	instalaciones
	case $tipoDeAtaque in
		1)
			clear
			diccionario.sh
			;;
	esac
      else
	if [[ echo $vector | grep 'xss' && grep 'sql' ]]
    then
    	echo -e "Para ejecutar un ataque de SQL pulsa 1.\nPara ejecutar un ataque de XSS pulsa 2."
     	read -p "" tipoDeAtaque
	instalaciones
	case $tipoDeAtaque in
		1)
			clear
			sqli.sh
			;;
		2)
			clear
			xss.sh
			;;
	esac
    	if [[ echo $vector | grep 'diccionario' ]]
	then
		if [[ ${vector[@]} | grep 'sql' ]]
		then
		        echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SqlInjection pulsa 2.\nPara ejecutar un ataque de XSS pulsa 3."
     			read -p "" tipoDeAtaque
			instalaciones
			case $tipoDeAtaque in
				1)
					clear
					xss.sh
					;;
				2)
					clear
					sqli.sh
					;;
				3)
					clear
					xss.sh
					;;
			esac
					else
			echo -e "Para ejecutar un ataque de Diccionario pulsa 2.\nPara ejecutar un ataque de XSS pulsa 3."
     			read -p "" tipoDeAtaque
			instalaciones
			case $tipoDeAtaque in
				2)
					clear
					sqli.sh
					;;
				3)
					clear
					xss.sh
					;;
		fi
	else
		if [[ echo $vector | grep 'sql' ]]
		then
			echo -e "Para ejecutar un ataque de SqlInjection pulsa 1.\nPara ejecutar un ataque de XSS pulsa 3."
     			read -p "" tipoDeAtaque
			instalaciones
			case $tipoDeAtaque in
				1)
					clear
					xss.sh
					;;
				3)
					clear
					xss.sh
					;;
			esac
		else
			echo -e "Para ejecutar un ataque de XSS pulsa 3."
     			read -p "" tipoDeAtaque
			instalaciones
			case $tipoDeAtaque in
				1)
					clear
					xss.sh
					;;
			else
		fi
	fi
    else
	if [[ echo $vector | grep 'xss' ]]
    then
    	echo -e "Para ejecutar un ataque de XSS pulsa 1."
     	read -p "" tipoDeAtaque
	instalaciones
	case $tipoDeAtaque in
		1)
			clear
			xss.sh
			;;
	esac
    else
	if [[ echo $vector | grep 'sql' ]]
    then
    	echo -e "Para ejecutar un ataque de SQL pulsa 1."
     	read -p "" tipoDeAtaque
	instalaciones
	case $tipoDeAtaque in
		1)
			clear
			sqli.sh
			;;
	esac
    	if [[ echo $vector | grep 'sql' ]]
	then
		if [[ ${vector[@]} | grep 'diccionario' ]]
			echo -e "Para ejecutar un ataque de SqlInjection pulsa 2.\nPara ejecutar un ataque de Diccionario pulsa 3."
     			read -p "" tipoDeAtaque
			instalaciones
			case $tipoDeAtaque in
				2)
					clear
					sqli.sh
					;;
				3)
					clear
					xss.sh
					;;
			esac
		else
			echo -e "Para ejecutar un ataque de SqlInjection pulsa 2"
     			read -p "" tipoDeAtaque
			instalaciones
			case $tipoDeAtaque in
				2)
					clear
					sqli.sh
					;;
		fi
	else
		if [[ echo $vector | grep 'diccionario' ]]
			echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\n"
	     		read -p "" tipoDeAtaque
			instalaciones
			case $tipoDeAtaque in
				1)
					clear
					diccionario.sh
					;;

			esac
		esac
		else
		#esto va arriba
			if [[ echo $vector | grep 'csrf' ]]
			then
				echo -e "La web esta protegida contra los ataques que analizamos."
				exit 0
			fi
			echo -e "No es vulnerable a nada la web."
		fi
	fi
    fi
    
    
    
    #de aqui en adelante todo mal
    
    while [$vector > 3 | $vector < 1]
    do 
        echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SqlInjection pulsa 2.\nPara ejecutar un ataque de XSS pulsa 3."
        read -p "" tipoDeAtaque
}
