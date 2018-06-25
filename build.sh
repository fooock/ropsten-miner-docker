#!/bin/bash

sudo su

# uninstall old versions
sudo apt-get remove docker docker-engine docker.io

# update and install
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common make

# add dokcer official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# verify key
sudo apt-key fingerprint 0EBFCD88

# setup stable repo
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# update and install
sudo apt-get update
sudo apt-get install -y docker-ce

# manage docker as non root user
sudo groupadd docker
sudo usermod -aG docker vagrant

# change DNS servers
echo "DOCKER_OPTS=\"--dns 8.8.8.8 --dns 8.8.4.4\"" >> /etc/default/docker
sudo service docker restart

# install docker compose
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o \
        /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
