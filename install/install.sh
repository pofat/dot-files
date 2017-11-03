#!/usr/bin/env bash
# vim: fdm=marker

source ~/Git/dot-files/shell/jack_log

DOT=~/Git/dot-files
VIM=~/Git/vim-config

# DOT FILES {{{

mkdir ~/.config &>/dev/null

jackNote '\nINSTALL DOT FILES\n'

# neovim
echo '- Neovim'
ln -sf -T $VIM ~/.vim
ln -sf -T $VIM ~/.config/nvim
ln -sf -T $VIM/ctrlp-cmdhub-jobs ~/.ctrlp-cmdhub-jobs

# tmux
echo '- Tmux'
ln -sf $DOT/tmux/tmux.conf ~/.tmux.conf

# git
ln -sf $DOT/git/gitconfig ~/.gitconfig
ln -sf $DOT/git/cvsignore ~/.cvsignore

# zsh
echo '- Zsh'
ln -sf $DOT/zshrc ~/.zshrc

# hammerspoon
echo '- Hammerspoon'
ln -sf -T $DOT/hammerspoon ~/.hammerspoon

# karabiner-element
echo '- Karabiner-Element'
ln -sf -T $DOT/karabiner ~/.config/karabiner

# python
echo '- Python'
ln -sf -T $DOT/python/yapf ~/.config/yapf
ln -sf -T $DOT/python/pip ~/Library/Application\ Support/pip

# vimperator
echo '- Vimperator'
ln -sf $DOT/vimperatorrc ~/.vimperatorrc
# }}}# vim: fdm=marker

# HOMEBREW {{{

# }}}
