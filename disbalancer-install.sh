#!bin/bash

## Install cron
sudo apt install cron
sudo systemctl enable cron

## Go to home directory for the current user
cd /home/$(whoami)

## Download help scripts
wget https://www.dropbox.com/s/cmkhfenoepmici0/check-restart.sh
touch check.log

## Download disbalancer and build docker image
wget https://www.dropbox.com/s/4jsfde41t4kekko/launcher-disbalancer-docker-x64.zip
unzip ./launcher-disbalancer-docker-x64.zip
rm -rf ./__MACOSX
cd ./launcher-disbalancer-docker-x64
docker build -t launcher-disbalancer:0.0.7 .

docker run --name disbalancer-1 -d launcher-disbalancer:0.0.7
docker run --name disbalancer-2 -d launcher-disbalancer:0.0.7
docker run --name disbalancer-3 -d launcher-disbalancer:0.0.7
docker run --name disbalancer-4 -d launcher-disbalancer:0.0.7

echo "Set up cron with following"
echo "Run 'crontab -e'"
echo "Insert following at the beginning 'SHELL=/bin/bash'"
echo "Insert following at the end (cron for each minute) '* * * * * /home/$(whoami)/check-restart.sh >> /home/$(whoami)/cron.log 2>&1'"