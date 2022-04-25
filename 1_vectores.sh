 #!/bin/bash
function vectores(){
   declare -a vectores=()
   xss=false
   diccionario=false
   sql=false
   csrf=$(wget -q -O - "$1" | grep "csref")
   login=$(wget -q -O - "$1" | grep "login")
   coment=$(wget -q -O - "$1" | grep "comment")
   filter=$(wget -q -O -  "$1" | grep "filter") 
   search=$(wget -q -O - "$1" | grep "search")
   category=$(wget -q -O - "$1" | grep "category")
   password=$(wget -q -O - "$1" | grep "password")
   username=$(wget -q -O - "$1" | grep "username")
   product=$(wget -q -O - "$1" | grep "product") 
   if [ "$csrf" ]
   then
      echo "Lamentablemente esta pagina no es vulnerable a ningun tipo de ataque que proporciona nuestra herramienta."
      vectores="csrf"
   else
    if [ "$login" ] || [ "$password" ] || [ "$username" ]
    then
       vectores+=("diccionario")
    fi
    if [ "$filter" ] || [ "$category" ] || [ "$product" ]
    then
       vectores+=("sql")
    fi
    if [ "$coment" ] || [ "$search" ]
    then
       vectores+=("xss")
    fi
   fi
   return $vectores
}
#podemos meter mas patrones al filtro
