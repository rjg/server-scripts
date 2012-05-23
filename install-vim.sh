#! /bin/bash

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
