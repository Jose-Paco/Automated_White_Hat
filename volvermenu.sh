volvermenu() {
#esta funcion sirve para ser llamada cuando se acaba un ataque
    read -r -p "Introduzca Q o q para salir y m o M para volver al menu: " letra  #se guaradara lo que pongas en letra 
    case "$letra" in
        m|M)																	#si se cumple una de estas 2 directivas te devolvera al menu principal
            'menuprincipal'
            ;;
        q|Q)																	#si se cumple una de estas 2 directivas te sacara del programa
            exit
            ;;
        *)  
            echo "No has introducido m ni q"									#si marcas cualquier cosa te dara error y te devovlera al mismo menu hasta que pongas una de las 2 condiciones que hay
	    'volvermenu'
            ;;
    esac
}
