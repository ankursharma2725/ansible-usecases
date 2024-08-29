#!/bin/bash
#IFS=""

###########################
# -> User Credentials <- #
###########################

read -p 'GIT Username: ' GITUSERNAME
read -sp 'GIT Personal access token: ' GITPASSWORD
echo
read -p 'GIT Email: ' GITEMAIL
# read -sp 'Ansible key: ' ANSIBLEKEY
# echo
# echo 'Your Username' $GITUSERNAME
# echo 'Your Password' $GITUSERNAME
# echo 'Your email' $GITUSERNAME
# echo 'Your Key' $GITUSERNAME

# ####################
# -> User Setup <- ##
# ####################

## Add user
adduser main
## Add user to sudo group
usermod -aG sudo main

# ###########################
# # -> Environment Setup <- #
# ###########################
## Install required apps
apt -y update

apt install -y docker docker-compose

apt install -y xrdp git ansible wget curl nano npm nodejs jq gawk
#apt install -y ubuntu-desktop

snap install code --classic
snap install kubectl --classic
snap install postman
systemctl enable xrdp

## Install Azure-CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

## Add Microsoft Packages to install teams 
# curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
# sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
# apt install -y teams

## Install network tools
apt-get install network-manager-vpnc-gnome openssh-server net-tools samba cifs-utils

# ##########################
# # -> User permissions <- #
# ##########################

## Add user to docker group to run docker without sudo
usermod -aG docker main

## Set vm.max_map_count for elastic
echo "vm.max_map_count=262144" >> /etc/sysctl.conf
sysctl -w vm.max_map_count=262144

## Create Ansible key ###
mkdir -p ~/.secrets/
chmod 750 ~/.secrets/
echo -ne '$ANSIBLEKEY' ~/.secrets/ansible-vault

##########################
# -> Configure GIT    <- #
##########################

git config --local user.name "$GITUSERNAME"
git config --local user.email "$GITEMAIL"
git config -l

## Store Git credential
git config --global credential.helper cache

mkdir -p ~/projects
cd ~/projects

# git_org=taskiy
git_org=ankursharma2725

# git_repos=( tass-test-app tass-tutorials )
git_repos=(ansible-usecases)

for git_repo in "${git_repos[@]}"; do

git clone https://$GITUSERNAME:$GITPASSWORD@github.com/$git_org/$git_repo.git
# git clone https://$GITUSERNAME:$GITPASSWORD@github.com//$git_repo.git
cd $git_repo
git remote set-url origin https://$GITUSERNAME:$GITPASSWORD@github.com/$git_org/$git_repo.git
# git remote set-url origin https://$GITUSERNAME:$GITPASSWORD@github.com/$git_repo.git
npm install
cd -
done

