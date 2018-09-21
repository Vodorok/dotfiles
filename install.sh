#!/bin/bash

# install git first if not from git?
apt install git

#update dotfiles repo
git pull

# set git username
git config --global user.email "vodorok@gmail.com"
git config --global user.name "Vodorok"

ln -s /home/dotfiles/vimrc ~
