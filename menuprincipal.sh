menuprincipal() {  
    clear
    #Llamamos a la funcion url para pedir al usuario la web a la que quiere atacar.
    'checkurl'
    #Llamamos a la funcion vectorees para, una vez identificada la web objetivo que analice los posibles vectorees de ataque.
    'vectores'
    #Sacamos por pantalla los posibles vectorees de ataque.
    echo "Los ataques disponibles a la página web " $url " son los que aparecen a continuación: $sqll $xsss $diccionarioo "
    if [ "$vectorees" = "sqlxssdiccionario" ]
    then
    	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectorees y le pide al usuario que elija cual utilizar
    	echo "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SqlInjection pulsa 2.\nPara ejecutar un ataque de XSS pulsa 3."
     	read -r -p "" tipoDeAtaque
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
    elif [ "$vectorees" = "xssdiccionario" ]
    then
    	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectorees y le pide al usuario que elija cual utilizar
    	echo "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de XSS pulsa 2."
	     read -r -p "" tipoDeAtaque
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
     elif [ "$vectorees" = "sqldiccionario" ]
     then
     	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectorees y le pide al usuario que elija cual utilizar
	echo "Para ejecutar un ataque de Diccionario pulsa 1.\nPara ejecutar un ataque de SQL pulsa 2."
	read -r -p "" tipoDeAtaque
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
     elif [ "$vectorees" = "diccionario" ]
     then
     	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectorees y le pide al usuario que elija cual utilizar
	    echo "Para ejecutar un ataque de Diccionario pulsa 1."
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
     elif [ "$vectorees" = "sqlxss" ]
     then
     	echo "Para ejecutar un ataque de SQL pulsa 1.\nPara ejecutar un ataque de XSS pulsa 2."
	read -r -p "" tipoDeAtaque
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
      elif [ "$vectorees" = "sql" ]
      then
      	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectorees y le pide al usuario que elija cual utilizar
      	echo "Para ejecutar un ataque de SqlInjection pulsa 1.\n"
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
      elif [ "$vectorees" = "xss" ]
      then
      	#Indicamos que tipo de ataque puede ejecutar segun el resultado de la funcion vectorees y le pide al usuario que elija cual utilizar
        echo "Para ejecutar un ataque de XSS pulsa 1."
     	read -r -p "" tipoDeAtaque
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
