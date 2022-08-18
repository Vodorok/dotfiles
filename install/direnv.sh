#!/usr/bin/env bash

X86="https://github.com/direnv/direnv/releases/download/v2.31.0/direnv.linux-amd64"
ARM="https://github.com/direnv/direnv/releases/download/v2.31.0/direnv.linux-arm64"

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

PKG=direnv

# Install package under ~/.home
local_install() {
  mkdir -p "~/.local/bin"
  mkdir -p "~/.local/direnv"
  cp -v $PKG "~/.local/direnv/direnv"
  chmod u+x "~/.local/direnv/direnv"
  ln -fs "~/.local/direnv/direnv" "~/.local/bin/direnv"
}


# Install package under /opt
system_install() {
  sudo mkdir -p "/opt/bin"
  sudo mkdir -p "/opt/direnv"
  sudo cp -v $PKG "/opt/direnv/direnv"
  sudo chmod 777 "/opt/direnv/direnv"
  sudo ln -fs "/opt/direnv/direnv" "/opt/bin/direnv"
}

wget -O $PKG $URL
if [[ $1 -eq 1 ]]; then
  system_install
else
  local_install
fi
rm -f $PKG

