#!/bin/bash
vectores() {
   csrf=$(wget -q -O - "$1" | grep "csrf")
   login=$(wget -q -O - "$1" | grep "login")
   filter=$(wget -q -O -  "$1" | grep "filter") 
   search=$(wget -q -O - "$1" | grep "search")
   category=$(wget -q -O - "$1" | grep "category")
   password=$(wget -q -O - "$1" | grep "password")
   username=$(wget -q -O - "$1" | grep "username")
   product=$(wget -q -O - "$1" | grep "product")
   if [[ wget -q -O - "$1" | grep "product" ]]  || [[ $url grep "product" ]]
   then
      product="a"
   fi
   if [[ wget -q -O - "$1" | grep "password" ]]  || [[ $url grep "password" ]]
   then
      password="a"
   fi
   if [[ wget -q -O - "$1" | grep "username" ]]  || [[ $url grep "username" ]]
   then
      username="a"
   fi
      if [[ wget -q -O - "$1" | grep "login" ]]  || [[ $url grep "login" ]]
   then
      login="a"
   fi
      if [[ wget -q -O - "$1" | grep "category" ]]  || [[ $url grep "category" ]]
   then
      category="a"
   fi
   if [[ wget -q -O - "$1" | grep "search" ]]  || [[ $url grep "search" ]]
   then
      search="a"
   fi
      if [[ wget -q -O - "$1" | grep "filter" ]]  || [[ $url grep "filter" ]]
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
