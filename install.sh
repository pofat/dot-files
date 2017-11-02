#!/usr/bin/env bash

DOT=~/Git/dot-files
VIM=~/Git/vim-config

mkdir ~/.config &>/dev/null

############
#  neovim  #
############

ln -sf $VIM ~/.vim
ln -sf $VIM ~/.config/nvim
ln -sf $VIM/ctrlp-cmdhub-jobs ~/.ctrlp-cmdhub-jobs

##########
#  tmux  #
##########

ln -sf $VIM/tmux/tmux.conf ~/.tmux.conf

#########
#  git  #
#########

ln -sf $DOT/git/gitconfig ~/.gitconfig
ln -sf $DOT/git/cvsignore ~/.cvsignore

#########
#  zsh  #
#########

ln -sf $DOT/zshrc ~/.zshrc

#################
#  hammerspoon  #
#################

ln -sf $DOT/hammerspoon ~/.hammerspoon

###############
#  karabiner  #
###############

ln -sf $DOT/karabiner ~/.config/karabiner

############
#  python  #
############

ln -sf ~/Git/dot-files/yapf ~/.config/yapf
ln -sf ~/Git/dot-files/python/pip.conf ~/Library/Application\ Support/pip

#############
#  firefox  #
#############

ln -sf ~/Git/dot-files/vimperatorrc ~/.vimperatorrc

