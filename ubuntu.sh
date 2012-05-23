#! /bin/bash

# Ruby Dependencies
sudo apt-get -y install git-core curl 

# Install rbenv
echo "INSTALLING RBENV"
curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshenv
echo 'eval "$(rbenv init -)"' >> ~/.zshenv
rbenv bootstrap-ubuntu-12-04

# Install ruby
echo "INSTALLING RUBY"
rbenv install 1.9.3-p194
rbenv global 1.9.3-p194
rbenv local 1.9.3-p194
rbenv rehash
exec $SHELL

# Installing gems
echo "INSTALLING SYSTEM GEMS"
gem install rake
gem install bundler
rbenv rehash

# Dependencies for vim
echo "INSTALLING DEPENDENCIES TO COMPILE VIM WITH RUBY"
sudo apt-get -y install libncurses-dev libgnome2-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev

# Compiling Vim with ruby
echo "INSTALLING VIM"
mkdir ~/downloads && cd ~/downloads
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2 
tar -xjvf vim-7.3.tar.bz2
cd ~/downloads/vim73
./configure --prefix=/usr/local --enable-gui=no --without-x --disable-nls --with-tlib=ncurses --enable-multibyte --enable-rubyinterp --with-features=huge --enable-gui=gnome2
make
sudo make install
sudo make clean

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
