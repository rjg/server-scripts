#! /bin/bash

# Ruby Dependencies
sudo apt-get -y install git-core

# Install rbenv
echo "INSTALLING RBENV"
curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
if [[ -d $HOME/.rbenv ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
exec $SHELL

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
