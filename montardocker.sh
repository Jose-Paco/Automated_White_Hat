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
sudo apt install gitsome
gh repo clone stefpe/squid_proxy
sudo docker network create --subnet=172.20.0.0/24 customnetwork
sudo docker pull owasp/zap2docker-stable
sudo docker run -i owasp/zap2docker-stable zap-cli quick-scan --self-contained     --start-options '-config api.disablekey=true' https://acac1f0f1fb13e1fc1393f69001b00b8.web-security-academy.net
#ejemplo que levanta el docker
