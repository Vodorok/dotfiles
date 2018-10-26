#!/bin/bash

# install git first if not from git?
apt install git

#update dotfiles repo
git pull

# set git username
git config --global user.email "vodorok@gmail.com"
git config --global user.name "Vodorok"

ln -fsv ~/dotfiles/vimrc ~/.vimrc
ln -fsv ~/dotfiles/bash_aliases ~/.bash_aliases

