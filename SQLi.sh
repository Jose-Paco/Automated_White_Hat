#!/bin/bash
function ataque_sqli() {
declare -a myURL
URL=$(echo -e "$url")
myURL=($URL)
echo "${myURL[@]}"
