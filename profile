# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export JAVA_PATH=/usr/lib/jvm/openjdk-8-jdk-amd64
export PROMPT_COMMAND='history -a'

source ./.myCommands
source "./.vim/bundle/gruvbox/gruvbox_256palette.sh"

expath /home/vodorok/bin
#expath /home/vodorok/ws/tools/thrift-0.9.3/compiler/cpp
#expath /home/vodorok/ws/tools/Codechecker-Releases/6.8.0/bin
#expath /home/vodorok/ws/cls/clang_build_env/build/bin

