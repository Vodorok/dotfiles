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
ln -fsv ~/dotfiles/bashrc ~/.bashrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
cp -Rv ~/.vim/bundle/vim-colors-solarized/colors ~/.vim
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

sudo apt install build-essential cmake python3-dev
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe 
git submodule update --init --recursive
cd ~
python3  ~/.vim/bundle/YouCompleteMe/install.py --java-completer
