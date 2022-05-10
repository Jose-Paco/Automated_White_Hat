vectores() {
#creamos algunas variables con datos sobre el contenido de la web
   csrf=$(curl -s "$url" | grep "csrf")
   login=$(curl -s "$url" | grep "login")
   filter=$(curl -s "$url" | grep "filter") 
   search=$(curl -s "$url" | grep "search")
   category=$(curl -s "$url" | grep "category")
   password=$(curl -s "$url" | grep "password")
   username=$(curl -s "$url" | grep "username")
   product=$(curl -s "$url" | grep "product")
   csrf2=$(curl -s "$url" | grep "csrf")
   login2=$(echo "$url" | grep "login" )
   filter2=$(echo "$url" | grep "filter" ) 
   search2=$(echo "$url" | grep "search" )
   category2=$(echo "$url" | grep "category")
   password2=$(echo "$url" | grep "password" )
   username2=$(echo "$url" | grep "username" )
   product2=$(echo "$url" | grep "product")
   if [ -n "$product" ] || [ -n "$product2" ]
   then
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
       product3="a"
   fi
   if [ -n "$password" ] || [ -n "$password2" ]
   then
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
       password3="a"  
   fi
   if [ -n "$username" ]  || [ -n "$username2" ]
   then
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
       username3="a"
   fi
   if [ -n "$login" ] || [ -n "$login2" ]
   then
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
       login3="a"

   fi
   if [ -n "$category" ]  || [ -n "$category2" ]
   then
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
       category3="a"
   fi
   if [ -n "$search" ]  || [ -n "$search2" ]
   then

   #si estos parametros estan presentes en la web o la url, nos lo anotamos
       search3="a"
   fi
   if [ -n "$filter" ]  || [ -n "$filter2" ]
   then
   #si estos parametros estan presentes en la web o la url, nos lo anotamos
       filter3="a"
   fi
   if [ -n "$csrf" ]
   then
   #si dispone la web de un parametro CSRF (cros site request forgery) sabemos que disponen de un token CSRF y esta herramienta no puede hacer nada contra eso
       echo "Esta herramienta no puede atacar a esta URL.\n"
       echo "csrf $csrf"
       'volvermenu'
       
   else
    if [ -n "$login3" ] || [ -n "$password3" ] || [ -n "$username3" ]
    then
    #si estas variables contienen algo, damos a la variable diccionario el valor diccionario
       diccionarioo="diccionario"
    fi
    if [ -n "$filter3" ] || [ -n "$category3" ] || [ -n "$product3" ]
    then
    #si estas variables contienen algo, damos a la variable sql el valor sql
       sqll="sql"
    fi
    if [ -n "$search3" ]
    then
    #si esta variable contiene algo, damos a la variable xss el valor xss
       xsss="xss"
    fi
   fi
   #concatenamos las variables y las devolvemos como parametro resultante al llamar a la funcion
   vectorees=$sqll$xsss$diccionarioo
}
