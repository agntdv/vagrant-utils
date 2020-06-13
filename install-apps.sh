#!/bin/bash

sudo systemctl disable --now apt-daily{,-upgrade}.{timer,service}

sleep 3 
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y default-jdk
sudo snap install intellij-idea-ultimate --classic
sudo snap install code --classic
sudo snap install postman

### docker
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker vagrant

### nodejs
sudo apt-get install -y curl
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update -y && sudo apt-get install -y yarn

### nodejs global installations
### as per: 	
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
echo "export PATH=~/.npm-global/bin:\$PATH" >> ~/.profile
source ~/.profile

sudo apt-get install -y git

sudo systemctl enable --now apt-daily{,-upgrade}.{timer,service}
