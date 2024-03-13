#!/bin/bash

# Define options
options=("iTitanHosting.ro" "Other")

# Prompt user for selection
echo "Please select an option:"
select opt in "${options[@]}"; do
    case $opt in
        "iTitanHosting.ro")
            echo "You selected Option 1"
            # Add your code for Option 1 here
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
            ;;
        "Other")
            echo "You selected Other"
            echo "Unfortunatly more hosts will be added soon"
            echo "Program will exit now"
            sleep 5s
            break
            ;;
        *) 
            echo "Invalid option $REPLY"
            ;;
    esac
done
