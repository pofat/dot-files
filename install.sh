#!/usr/bin/env bash

DOT=~/Git/dot-files
VIM=~/Git/vim-config

mkdir ~/.config &>/dev/null

############
#  neovim  #
############

ln -sf -T $VIM ~/.vim
ln -sf -T $VIM ~/.config/nvim
ln -sf -T $VIM/ctrlp-cmdhub-jobs ~/.ctrlp-cmdhub-jobs

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

ln -sf -T $DOT/hammerspoon ~/.hammerspoon

###############
#  karabiner  #
###############

ln -sf -T $DOT/karabiner ~/.config/karabiner

############
#  python  #
############

ln -sf $VIM/python/yapf ~/.config/yapf
ln -sf -T $VIM/python/pip ~/Library/Application\ Support/pip

#############
#  firefox  #
#############

ln -sf $VIM/vimperatorrc ~/.vimperatorrc
