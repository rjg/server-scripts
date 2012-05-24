#! /bin/bash

# Update system
sudo apt-get -y update && apt-get -y upgrade
sudo apt-get -y install zsh
sudo chsh -s /bin/zsh ubuntu
