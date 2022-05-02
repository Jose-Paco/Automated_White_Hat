#!/bin/bash
#source controlerror.sh
source volvermenu.sh
source instalaciones.sh
source diccionario.sh
source checkurl.sh
source xss.sh
source sqli.sh
source vectores.sh
menuPrincipal() {  
    clear
    #Llamamos a la funcion url para pedir al usuario la web a la que quiere atacar.
    url=$(checkurl)
    #Llamamos a la funcion vectores para, una vez identificada la web objetivo que analice los posibles vectores de ataque.
    vector=$(vectores '$url')
    #Sacamos por pantalla los posibles vectores de ataque.
    echo "Los ataques disponibles a la página web " . $url . " son los que aparecen a continuación: "
    if [ echo "$vector" | grep "xss" && grep "diccionario" && grep "sql" ]
    then
    	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectores y le pide al usuario que elija cual utilizar
    	echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SqlInjection pulsa 2.\nPara ejecutar un ataque de XSS pulsa 3."
     	read -p "" tipoDeAtaque
	'instalaciones'
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
		*)
			echo "Opcion no valida."
			'volvermenu'
	esac
    elif [ echo "$vector" | grep "xss" && grep "diccionario" ]
    then
    	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectores y le pide al usuario que elija cual utilizar
    	echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de XSS pulsa 2."
	     read -p "" tipoDeAtaque
	'instalaciones'
	case $tipoDeAtaque in
		1)
			clear
			'diccionario'
			;;
		2)
			clear
			'xss'
			;;
		*)
			echo "Opcion no valida."
			'volvermenu'
	esac
     elif [ echo "$vector" | grep "sql" && grep "diccionario" ]
     then
     	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectores y le pide al usuario que elija cual utilizar
	echo -e "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SQL pulsa 2."
	read -p "" tipoDeAtaque
	'instalaciones'
	case $tipoDeAtaque in
		1)
			clear
			'diccionario'
			;;
		2)
			clear
			'sqli'
			;;
		*)
			echo "Opcion no valida."
			'volvermenu'
	esac
     elif [ echo "$vector" | grep "diccionario" ]
     then
     	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectores y le pide al usuario que elija cual utilizar
	    echo -e "Para ejecutar un ataque de Diccionario pulsa 1."
	    read -p "" tipoDeAtaque
	    'instalaciones'
	    case $tipoDeAtaque in
		1)
			clear
			'diccionario'
			;;
		*)
			echo "Opcion no valida."
			'volvermenu'
	esac
     elif [ echo "$vector" | grep "xss" && grep "sql" ]
     then
     	echo -e "Para ejecutar un ataque de SQL pulsa 1.\nPara ejecutar un ataque de XSS pulsa 2."
	read -p "" tipoDeAtaque
	'instalaciones'
	case $tipoDeAtaque in
		1)
			clear
			'sqli'
			;;
		2)
			clear
			'xss'
			;;
		*)
			echo "Opcion no valida."
			'volvermenu'
	esac 
      elif [ echo "$vector" | grep "sql" ]
      then
      	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectores y le pide al usuario que elija cual utilizar
      	echo -e "Para ejecutar un ataque de SqlInjection pulsa 1.\n"
     	read -p "" tipoDeAtaque
	'instalaciones'
	case $tipoDeAtaque in
		1)
			clear
			'sqli'
			;;
		*)
			echo "Opcion no valida."
			'volvermenu'
	esac
      elif [ echo "$vector" | grep "xss" ]
      then
      	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectores y le pide al usuario que elija cual utilizar
        echo -e "Para ejecutar un ataque de XSS pulsa 1."
     	read -p "" tipoDeAtaque
	'instalaciones'
	case $tipoDeAtaque in
		1)
			clear
			'xss'
			;;
		*)
			echo "Opcion no valida."
			'volvermenu'
	esac
	fi
}
