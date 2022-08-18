#!/usr/bin/env bash

X86="https://github.com/sharkdp/bat/releases/download/v0.20.0/bat-v0.20.0-x86_64-unknown-linux-gnu.tar.gz"
ARM="https://github.com/sharkdp/bat/releases/download/v0.20.0/bat-v0.20.0-aarch64-unknown-linux-gnu.tar.gz"

ARCH=`arch`
echo $ARCH
if [[ $ARCH == "x86_64" ]]; then
  URL=$X86
elif [[ $ARCH == "aarch64" ]]; then 
  URL=$ARM
else
  echo "unsupported architecture"
  exit 1
fi
PKG=package.tar.gz

# Install package under ~/.home
local_install() {
  mkdir -p "~/.local/bin"
  mkdir -p "~/.local/share/man"
  mkdir -p "~/.local/bat"
  tar xvf $PKG -C "~/.local/bat" --strip-components 1
  sudo ln -fs "~/.local/bat/bat" "~/.local/bin/bat"
  #cp -v "~/.local/bat/bat" "~/.local/bin"
  cp -v "~/.local/bat/bat.1" "~/.local/share/man" 
  cp -rv "~/.local/bat/autocomplete" "~/.local/"
  rm -rf ./bat
}


# Install package under /opt
system_install() {
  sudo mkdir -p "/opt/bin"
  sudo mkdir -p "/opt/bat"
  sudo tar xvf $PKG -C "/opt/bat" --strip-components 1
  sudo mkdir -p "/opt/bin"
  sudo ln -fs "/opt/bat/bat" "/opt/bin/bat"
}

wget -O $PKG $URL
if [[ $1 -eq 1 ]]; then
  system_install
else
  local_install
fi
rm -f $PKG

