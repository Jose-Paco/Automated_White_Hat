 #!/bin/bash
function vectores(){ 
   login= $(wget -q -O - $1 | grep "login")
   coment= $(wget -q -O - $1 | grep "comment")
   filter= $(wget -q -O -  $1 | grep "filter") 
   search= $(wget -q -O - $1 | grep "search")
   category= $(wget -q -O - $1 | grep "comment")
   password= $(wget -q -O - $1 | grep "password")
   username= $(wget -q -O - $1 | grep "username")
   img= $(wget -q -O -  $1 | grep "img")
   product= $(wget -q -O - $1 | grep "product") 
   if [ -e $login ] || [ -e $password ] || [ -e $username ]
      diccionario=true
   fi
   if [ -e $filter ] || [ -e $category ] || [ -e $product ]
      sql=true
   fi
   if [ -e $comment ] || [ -e $search ] || [ -e $img ] 
      xss=true
   fi
   declare -a vectores=('$xss' '$sql' '$diccionario')
   return $vectores
}
#podemos meter mas patrones al filtro
