#                   __ _ _
#  _ __  _ __ ___  / _(_) | ___
# | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | | | (_) |  _| | |  __/
# | .__/|_|  \___/|_| |_|_|\___|
# |_|

# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.

export SHELL=`which zsh`
[ -z "$ZSH_VERSION" ] && exec "$SHELL" -l

# set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/bin" ] ; then
#     PATH="$HOME/bin:$PATH"
# fi

# if [ -d "$HOME/.local/bin" ] ; then
#     PATH="$HOME/.local/bin:$PATH"
# fi

# load custom scripts
if [ -d "$HOME/.local/bin" ] ; then
  PATH=$PATH$(find $HOME/.local/bin -type d -printf ":%p")
fi

[ -f ~/.bashrc ] && source ~/.bashrc

# root
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

# libs from golang
export GOPATH=$HOME/golib

# my folder
export GOPATH=$HOME/code
export PATH=$PATH:$GOPATH/bin


