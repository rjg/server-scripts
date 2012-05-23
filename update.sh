#! /bin/bash

# Update system
sudo su
apt-get update && apt-get upgrade --show-upgraded
apt-get -y install zsh
chsh -s /bin/zsh ubuntu
exit 
exit
