#!/bin/bash
#source /repositorios/aquivanelrestodesh.
#./funcion.sh
source controlerror.sh
source volvermenu.sh
source instalaciones.sh
source diccionario.sh
source checkurl.sh
source xss.sh
source sqli.sh
source vectores.sh
#Muestra el menu general
menuPrincipal() {  
    clear
    url=$(3_checkurl)
    vector=$(3_vectores '$url')
    echo "Los ataques disponibles a la página web " . $url . " son los que porponemos a continuacion:\n"
    if [[ echo $vector | grep 'xss' && grep 'diccionario' && grep 'sql' ]]
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
	if [[ $ echo $vector  | grep 'xss' && grep 'diccionario' ]]
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
	if [[  echo $vector | grep 'sql' && grep 'diccionario' ]]
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
	if [[  echo $vector  | grep 'diccionario' ]]
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
	if [[ ${vector[@]} | grep 'sql' ]]
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
    
}
#main
#'_menuPrincipal'
