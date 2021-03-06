#! /bin/bash

# Install ruby, git, and make
sudo apt-get -y install ruby1.9.1-dev git-core make

# Installing Rake and Bundler
sudo gem install rake # Dep for dotfile install script 
sudo gem install bundler # Dep for command-t install

# Install hub
echo "INSTALLING HUB"
mkdir ~/bin
curl http://defunkt.io/hub/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub

# Setting up dotfiles
echo "INSTALLING DOTFILES"
mkdir ~/code && cd ~/code
git clone https://github.com/rjg/dotfiles
cd ~/code/dotfiles
git checkout -t origin/linode
rake install

# Nokogiri requirements
sudo apt-get -y install libxml2 libxml2-dev libxslt1-dev

# Getting vim plugins
cd ~/code/dotfiles/vim/ && rm -rf bundle && mkdir bundle && cd bundle
git clone https://github.com/tpope/vim-surround 
git clone https://github.com/tpope/vim-rake
git clone https://github.com/tpope/vim-ragtag
git clone https://github.com/godlygeek/csapprox 
git clone https://github.com/tpope/vim-commentary
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/tpope/vim-rails
git clone https://github.com/wincent/Command-T command-t
cd ~/code/dotfiles/vim/bundle/command-t
sudo bundle install --path vendor/bundle
rake make

exec $SHELL
