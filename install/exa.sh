#!/usr/bin/env bash

X86="https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-x86_64-v0.10.1.zip"
ARM="https://github.com/ogham/exa/releases/download/v0.10.1/exa-linux-armv7-v0.10.1.zip"

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

PKG=package.zip

# Install package under ~/.home
local_install() {
  unzip $PKG -d ~/.local
}


# Install package under /opt
system_install() {
  sudo unzip $PKG -d /opt/exa
  sudo mkdir -p /opt/bin
  sudo ln -fs /opt/exa/bin/exa /opt/bin/exa
}

wget -O $PKG $URL
if [[ $1 -eq 1 ]]; then
  system_install
else
  local_install
fi
rm -f $PKG

