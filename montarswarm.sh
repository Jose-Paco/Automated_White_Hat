#!/bin/bash
sudo apt update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io
ip4=$(ip a | head -n9 | tail -1 | sed '1s!/! !g' | awk '{print $2}')
sudo docker swarm init --advertise-addr $ip4
sudo docker pull debian
sudo docker pull owasp/zap2docker-stable
sudo docker run debian
sudo docker run owasp/zap2docker-stable
