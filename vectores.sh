#!/bin/bash
vectores() {
   csrf=$(wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "csrf")
   login=$(wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "login")
#   comment=$(wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "comment")
   filter=$(wget -q -O -  "https://diccionarivalencia.com/?paraula=a" | grep "filter") 
   search=$(wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "search")
   category=$(wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "category")
   password=$(wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "password")
   username=$(wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "username")
   product=$(wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "product")
   if [[ wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "product" ]]  || [[ $url grep "product" ]]
   then
      product="a"
   fi
   if [[ wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "password" ]]  || [[ $url grep "password" ]]
   then
      password="a"
   fi
   if [[ wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "username" ]]  || [[ $url grep "username" ]]
   then
      username="a"
   fi
      if [[ wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "login" ]]  || [[ $url grep "login" ]]
   then
      login="a"
   fi
      if [[ wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "category" ]]  || [[ $url grep "category" ]]
   then
      category="a"
   fi
   if [[ wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "search" ]]  || [[ $url grep "search" ]]
   then
      search="a"
   fi
      if [[ wget -q -O - "https://diccionarivalencia.com/?paraula=a" | grep "filter" ]]  || [[ $url grep "filter" ]]
   then
      filter="a"
   fi
   if [ "$csrf" ]
   then
      vectores="csrf"
   else
    if [ "$login" ] || [ "$password" ] || [ "$username" ]
    then
       diccionario="diccionario"
    fi
    if [ "$filter" ] || [ "$category" ] || [ "$product" ]
    then
       sql="sql"
    fi
    if [ "$coment" ] || [ "$search" ]
    then
       xss="xss"
    fi
   fi
   vectores = $sql$xss$diccionario
   return $vectores
}
