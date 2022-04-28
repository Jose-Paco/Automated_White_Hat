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
    url=$(3_checkurl)
    vector=$(3_vectores '$url')
    #if csrf "es segura la web contra esta herramienta, else lo siguiente
    echo "Los ataques disponibles a la página web " . $url . " son los que aparecen a continuación: "
    if [[ echo $vector | grep 'xss' ]]
    then
    	echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SqlInjection pulsa 2.\nPara ejecutar un ataque de XSS pulsa 3."
     	read -p "" tipoDeAtaque
	3_instalaciones
	case $tipoDeAtaque in
		1)
			clear
			3_diccionario.sh
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
     else
	if [[ echo $vector | grep 'xss' && grep 'diccionario' ]]
    then
    	echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de XSS pulsa 2."
     	read -p "" tipoDeAtaque
	3_instalaciones
	case $tipoDeAtaque in
		1)
			clear
			3_diccionario.sh
			;;
		2)
			clear
			3_xss.sh
			;;
	esac
      else
	if [[ echo $vector | grep 'sql' && grep 'diccionario' ]]
    then
    	echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SQL pulsa 2."
     	read -p "" tipoDeAtaque
	3_instalaciones
	case $tipoDeAtaque in
		1)
			clear
			3_diccionario.sh
			;;
		2)
			clear
			3_sqli.sh
			;;
	esac
      else
	if [[ echo $vector | grep 'diccionario' ]]
    then
    	echo -e "Para ejecutar un ataque de Diccionario pulsa 1."
     	read -p "" tipoDeAtaque
	3_instalaciones
	case $tipoDeAtaque in
		1)
			clear
			3_diccionario.sh
			;;
	esac
      else
	if [[ echo $vector | grep 'xss' && grep 'sql' ]]
    then
    	echo -e "Para ejecutar un ataque de SQL pulsa 1.\nPara ejecutar un ataque de XSS pulsa 2."
     	read -p "" tipoDeAtaque
	3_instalaciones
	case $tipoDeAtaque in
		1)
			clear
			3_sqli.sh
			;;
		2)
			clear
			3_xss.sh
			;;
	esac
    	if [[ echo $vector | grep 'diccionario' ]]
	then
		if [[ ${vector[@]} | grep 'sql' ]]
		then
		        echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SqlInjection pulsa 2.\nPara ejecutar un ataque de XSS pulsa 3."
     			read -p "" tipoDeAtaque
			3_instalaciones
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
					else
			echo -e "Para ejecutar un ataque de Diccionario pulsa 2.\nPara ejecutar un ataque de XSS pulsa 3."
     			read -p "" tipoDeAtaque
			3_instalaciones
			case $tipoDeAtaque in
				2)
					clear
					3_sqli.sh
					;;
				3)
					clear
					3_xss.sh
					;;
		fi
	else
		if [[ echo $vector | grep 'sql' ]]
		then
			echo -e "Para ejecutar un ataque de SqlInjection pulsa 1.\nPara ejecutar un ataque de XSS pulsa 3."
     			read -p "" tipoDeAtaque
			3_instalaciones
			case $tipoDeAtaque in
				1)
					clear
					3_xss.sh
					;;
				3)
					clear
					3_xss.sh
					;;
			esac
		else
			echo -e "Para ejecutar un ataque de XSS pulsa 3."
     			read -p "" tipoDeAtaque
			3_instalaciones
			case $tipoDeAtaque in
				1)
					clear
					3_xss.sh
					;;
			else
		fi
	fi
    else
	if [[ echo $vector | grep 'xss' ]]
    then
    	echo -e "Para ejecutar un ataque de XSS pulsa 1."
     	read -p "" tipoDeAtaque
	3_instalaciones
	case $tipoDeAtaque in
		1)
			clear
			3_xss.sh
			;;
	esac
    else
	if [[ echo $vector | grep 'sql' ]]
    then
    	echo -e "Para ejecutar un ataque de SQL pulsa 1."
     	read -p "" tipoDeAtaque
	3_instalaciones
	case $tipoDeAtaque in
		1)
			clear
			3_sqli.sh
			;;
	esac
    	if [[ echo $vector | grep 'sql' ]]
	then
		if [[ ${vector[@]} | grep 'diccionario' ]]
			echo -e "Para ejecutar un ataque de SqlInjection pulsa 2.\nPara ejecutar un ataque de Diccionario pulsa 3."
     			read -p "" tipoDeAtaque
			3_instalaciones
			case $tipoDeAtaque in
				2)
					clear
					3_sqli.sh
					;;
				3)
					clear
					3_xss.sh
					;;
			esac
		else
			echo -e "Para ejecutar un ataque de SqlInjection pulsa 2"
     			read -p "" tipoDeAtaque
			3_instalaciones
			case $tipoDeAtaque in
				2)
					clear
					3_sqli.sh
					;;
		fi
	else
		if [[ echo $vector | grep 'diccionario' ]]
			echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\n"
	     		read -p "" tipoDeAtaque
			3_instalaciones
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
#main
#'_menuPrincipal'
