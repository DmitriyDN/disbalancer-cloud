#!/bin/bash

sudo apt update
sudo apt-get install zip unzip

## Install help packages
sudo apt update
sudo apt install nload
sudo apt-get install zip unzip
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}
id -nG

wget https://www.dropbox.com/s/4jsfde41t4kekko/launcher-disbalancer-docker-x64.zip
unzip ./launcher-disbalancer-docker-x64.zip
rm -rf ./__MACOSX

cd launcher-disbalancer-docker-x64
docker build -t disbalancer .

screen -S liberator -dm docker run --restart unless-stopped disbalancer
echo "Done!"