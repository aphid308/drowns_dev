#!/bin/bash

#06-15-18: Full rewrite of my dotfiles and system config automation
#Ubuntu Server 18.04 LTS "Bionic Beaver"

#Update Sources
sudo apt-get update

#Remove Packages
sudo apt-get purge vim
sudo apt-get remove vim

#Install Packages
sudo apt-get install -y \
    vim-nox python3-dev \
    ruby ruby-dev \
    tmux virtualenv \
    virtualenvwrapper python3-pip \
    build-essential make \
    libffi-dev libssl-dev \
    libjpeg-dev docker.io \
    libpq-dev postgresql \
    python-pip

#Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo groupadd docker
sudo gpasswd -a $USER docker

#Install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#Install Vim Plugins
vim +PluginInstall +qall

#Setup Command-T
cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t
ruby extconf.rb
make

sudo dd if=/dev/zero of=/var/swapfile bs=1M count=2048 &&
    sudo chmod 600 /var/swapfile &&
    sudo mkswap /var/swapfile &&
    echo /var/swapfile none swap defaults 0 0 | sudo tee -a /etc/fstab &&
    sudo swapon -a

#Compile YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
YCM_CORES=1 ./install.py --clang-completer

echo "source .bash_drowns" >> .bashrc
