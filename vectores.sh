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
   if [ wget -q -O - "$1" | grep "product" ]  || [ "$url" grep "product" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      product="a"
   fi
   if [ wget -q -O - "$1" | grep "password" ]  || [ "$url" grep "password" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      password="a"
   fi
   if [ wget -q -O - "$1" | grep "username" ]  || [ "$url" grep "username" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      username="a"
   fi
      if [ wget -q -O - "$1" | grep "login" ] || [ "$url" grep "login" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      login="a"
   fi
      if [ wget -q -O - "$1" | grep "category" ]  || [ "$url" grep "category" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      category="a"
   fi
   if [ wget -q -O - "$1" | grep "search" ]  || [ "$url" grep "search" ]
   then
   
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
      search="a"
   fi
      if [ wget -q -O - "$1" | grep "filter" ]  || [ "$url" grep "filter" ]
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
