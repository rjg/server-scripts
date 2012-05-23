#! /bin/bash

# Update system
sudo su
apt-get update && apt-get upgrade --show-upgraded
apt-get install zsh
chsh -s /bin/zsh ubuntu
sudo su ubuntu

