#!/bin/bash

# install git first if not from git?
sudo apt update
sudo apt install -y libncurses5-dev \
    libncursesw5-dev \
    build-essential \
    git \
    install python3.9 \
    unzip

mkdir -p ~/bin

# install bat
# not workgin atm
#sudo apt install bat
wget https://github.com/sharkdp/bat/releases/download/v0.18.0/bat_0.18.0_amd64.deb
sudo dpkg -i bat_0.18.0_amd64.deb
rm bat_0.18.0_amd64.de

# install exa
wget https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
unzip exa-linux-x86_64-0.9.0.zip -d ~/bin
rm exa-linux-x86_64-0.9.0.zip
ln -fs ~/bin/exa-linux-x86_64 ~/bin/exa

# set git username
git config --global user.email "vodorok@gmail.com"
git config --global user.name "Vodorok"

#install master vim

sudo apt remove vim vim-runtime gvim

git clone https://github.com/vim/vim.git ./vim
cd vim
./configure --with-features=huge \
    --enable-multibyte \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
    --enable-gui=gtk2 \
    --enable-cscope \
    --prefix=/usr/local

make vimruntimedir=/usr/local/share/vim/vim81
sudo make install

git clone https://github.com/morhetz/gruvbox.git ~/tmp
cp -r ~/tmp/colors ~/.vim/ && rm -rf ~/tmp

ln -fsv ~/dotfiles/vimrc ~/.vimrc
ln -fsv ~/dotfiles/bash_aliases ~/.bash_aliases
ln -fsv ~/dotfiles/bashrc ~/.bashrc
ln -fsv ~/dotfiles/gitconfig ~/.gitconfig
ln -fsv ~/dotfiles/bash_functions ~/.bash_functions

# git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
# git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
# git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
# git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
# cp -Rv ~/.vim/bundle/vim-colors-solarized/colors ~/.vim
# git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline

# sudo apt install build-essential cmake python3-dev
# git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
# cd ~/.vim/bundle/YouCompleteMe 
# git submodule update --init --recursive
# cd ~
# python3  ~/.vim/bundle/YouCompleteMe/install.py --java-completer

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
nvm install 14.15.5
