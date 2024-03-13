#!/bin/bash -x


# e facut prost nu ma judeca :3

function print_help()
{
  echo -e "Syntax: $0 [-1] [-2] >&2"
  echo -e "\t[-1]: "
  echo -e "\t[-2]: "
  exit 1
}

#
function process_go()
{
  # to do: write code here
  # you can use debug function
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

}

#
function process_exit()
{

   exit 1
}

while getopts ":12" o
do
  case "$o" in
  1) process_go ;;
  2) process_exit ;;
  *)
  esac
done;