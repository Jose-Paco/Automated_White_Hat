 #!/bin/bash
function vectores(){ 
   login= $(wget $1 | grep "login")
   coment= $(wget $1 | grep "comment")
   filter= $(wget $1 | grep "filter") 
   search= $(wget $1 | grep "search")
   category= $(wget $1 | grep "comment")
   password= $(wget $1 | grep "password")
   username= $(wget $1 | grep "username")
   img= $(wget $1 | grep "img")
   product= $(wget $1 | grep "product") 
   if [ -e $login ] || [ -e $password ] || [ -e $username ]
      diccionario=true
   if [ -e $filter ] || [-e $category ] || [ -e $product ]
      sql=true
   if [ -e $comment ] || [ -e $search ] || [ -e $img ] 
      xss=true
}
#podemos meter mas patrones al filtro
