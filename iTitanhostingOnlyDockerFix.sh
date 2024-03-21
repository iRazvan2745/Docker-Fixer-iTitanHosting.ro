#!/bin/bash

clear
echo "Script will start now"

systemctl stop wings
apt remove docker-ce
apt install docker-ce
docker network remove pterodactyl_nw
docker network create pterodactyl_nw
cd /etc/docker
rm daemon.json
wget https://github.com/iRazvan2745/Docker-Fixer-iTitanHosting.ro/blob/main/Daemon.json
systemctl restart docker
docker network ls
systemctl start wings


echo "Script has ran succesfully"
