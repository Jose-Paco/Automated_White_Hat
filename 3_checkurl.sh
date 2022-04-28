#!/bin/bash
3_checkurl() {
read -p "introduce una url: " url
if [ "$url" != "" ]
then
    wget $url &> /dev/null
    while [ $? != "0" ]
    do
      'checkurl' 
    done
    if [ "$?" == "0" ]
    then
        return $url
    fi
fi
}
#main
#'checkurl'
