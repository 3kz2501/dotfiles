#!/bin/bash

# install prezto for zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Backup zsh config if it exists
if [ -f ~/.zshrc ];
   then
       mv ~/.zshrc ~/.zshrc.backup
fi

# simbolic link to home directory
ln -sf ~/.zprezto/runcoms/zlogin ~/.zlogin
ln -sf ~/.zprezto/runcoms/zlogout ~/.zlogout
ln -sf ~/.zprezto/runcoms/zpreztorc ~/.zpreztorc
ln -sf ~/.zprezto/runcoms/zprofile ~/.zprofile
ln -sf ~/.zprezto/runcoms/zshenv ~/.zshenv
ln -sf ~/.zprezto/runcoms/zshrc ~/.zshrc

# simpolic link from dotfiles dir to prezto dir
BASEDIR=`pwd`
ln -sf "${BASEDIR}/prezto/zlogin" "${HOME}/.zprezto/runcoms/zlogin"
ln -sf "${BASEDIR}/prezto/zlogout" "${HOME}/.zprezto/runcoms/zlogout"
ln -sf "${BASEDIR}/prezto/zpreztorc" "${HOME}/.zprezto/runcoms/zpreztorc"
ln -sf "${BASEDIR}/prezto/zprofile" "${HOME}/.zprezto/runcoms/zprofile"
ln -sf "${BASEDIR}/prezto/zshenv" "${HOME}/.zprezto/runcoms/zshenv"
ln -sf "${BASEDIR}/prezto/zshrc" "${HOME}/.zprezto/runcoms/zshrc"

# simbolic link vim config from dotfiles dir
ln -sf "${BASEDIR}/vim/.vimrc" "${HOME}/.vimrc"

# simbolic link tmux config from dotfiles dir
ln -sf "${BASEDIR}/tmux/.tmux.conf" "${HOME}/.tmux.conf"

# install anyenv
git clone https://github.com/anyenv/anyenv "${HOME}"/.anyenv

####anyenv path####
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> "${HOME}"/.zhsrc
eval "$(${HOME}/.anyenv/bin/anyenv init -)"
source "${HOME}"/.zshrc
anyenv install --init
