#! /bin/bash

# Update system
sudo su
apt-get -y update && apt-get -y upgrade --show-upgraded
apt-get -y install zsh
chsh -s /bin/zsh ubuntu
exit 
exit
