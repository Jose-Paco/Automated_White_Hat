#!/bin/bash
function swarm(){
    ip4=$(ip a | head -n9 | tail -1 | sed '1s!/! !g' | awk '{print $2}')
    sudo docker swarm init --advertise-addr $ip4
}
#mejorar eleccion de interfaces
