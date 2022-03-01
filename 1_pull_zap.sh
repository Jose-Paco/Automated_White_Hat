#!/bin/bash


function pull_zap(){
#  sudo docker pull debian
  sudo docker pull owasp/zap2docker-stable
#  sudo docker run debian
  sudo docker run owasp/zap2docker-stable
}
