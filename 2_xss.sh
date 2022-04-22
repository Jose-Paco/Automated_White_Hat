

search=$(wget -q -O - "$1" | grep "search")
comment=$(wget -q -O - "$1" | grep "comment")
if  [[ curl $URL | grep 'method=\"GET\"' ]]
then
  #aqui ejecutamos xss con get, checkear si esta search
  if [[ $search ]]
  then
    a=$(curl google.com | sed -e 's/ / /g')
b=$(echo $a | sed -e 's/./& /g')
else
  if  [[ curl $URL | grep 'method=\"POST\"' ]]
  then
  #aqui ejecutamos xss con post, checkear si tambien esta comment
    if [[ $comment ]]
    then
    
    else
      if [[ $search ]]
  else
  # aqui ejecutamos los  dos, checkear si esta search o comment
    if [[ $comment ]]
    then
    
    else [[ $search ]]
arrVar=("?search=%3Cscript%3Ealert%281%29%3C%2Fscript%3E")

curl --verbose $URLnueva | grep "200"
