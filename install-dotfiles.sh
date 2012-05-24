#! /bin/bash

# install hub
echo "INSTALLING HUB"
mkdir ~/bin
curl http://defunkt.io/hub/standalone -sLo ~/bin/hub && chmod +x ~/bin/hub

# Setting up dotfiles
echo "INSTALLING DOTFILES"
mkdir ~/code
cd ~/code
git clone https://github.com/rjg/dotfiles
cd ~/code/dotfiles
git checkout -t remote/linode
rake install
exec $SHELL

# nokogiri requirements
sudo apt-get -y install libxslt-dev libxml2-dev

# Getting vim plugins
cd ~/code/dotfiles/vim/ && rm -rf bundle && mkdir bundle && cd bundle
git clone tpope/vim-surround 
git clone tpope/vim-rake
git clone tpope/vim-ragtag
git clone godlygeek/csapprox 
git clone tpope/vim-commentary
git clone tpope/vim-fugitive
git clone tpope/vim-rails
git clone wincent/Command-T command-t
cd command-t
bundle install --path vendor/bundle
rake make
