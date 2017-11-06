#!/usr/bin/env bash
# vim: fdm=marker

source ~/Git/dot-files/shell/jack_log

DOT=~/Git/dot-files
VIM=~/Git/vim-config

SDIR=$(dirname $(test -L "$0" && readlink -e "$0" || echo "$0"))

# DOT FILES {{{

mkdir ~/.config &>/dev/null

jackNote '\nInstall Dot Files\n'

# neovim
cat <<END

- Neovim
  ~/.vim
  ~/.config/nvim
  ~/.ctrlp-cmdhub-jobs

END

ln -sf -T $VIM ~/.vim
ln -sf -T $VIM ~/.config/nvim
ln -sf -T $VIM/ctrlp-cmdhub-jobs ~/.ctrlp-cmdhub-jobs

# ssh
cat <<END
- SSH
  ~/.ssh

END

ln -sf -T $DOT/ssh ~/.ssh

# LLDB
cat <<END
- LLDB
  ~/.lldb

END

ln -sf $DOT/lldbinit ~/.lldbinit

# tmux
cat <<END
- Tmux
  ~/.tmux.conf

END

ln -sf $DOT/tmux/tmux.conf ~/.tmux.conf

# git
cat <<END
- Git
  ~/.gitconfig
  ~/.cvsignore

END

ln -sf $DOT/git/gitconfig ~/.gitconfig
ln -sf $DOT/git/cvsignore ~/.cvsignore

# zsh
cat <<END
- Zsh
  ~/.zshrc

END

ln -sf $DOT/zshrc ~/.zshrc

# hammerspoon
cat <<END
- Hammerspoon
  ~/.hammerspoon

END
ln -sf -T $DOT/hammerspoon ~/.hammerspoon

# karabiner-element
cat <<END
- Karabiner-Element
  ~/.config/karabiner

END

ln -sf -T $DOT/karabiner ~/.config/karabiner

# python
cat <<END
- Python
  ~/.config/yapf
  ~/Library/Application Support/pip

END
ln -sf -T $DOT/python/yapf ~/.config/yapf
ln -sf -T $DOT/python/pip ~/Library/Application\ Support/pip

# vimperator
cat <<END
- Vimperator
  ~/.vimperatorrc

END

ln -sf $DOT/vimperatorrc ~/.vimperatorrc

# fzf-cmdhub
cat <<END
- Utility: fzf-cmdhub
  ~/.config/fzf-cmdhub

END

ln -sf -T $DOT/fzf-cmdhub ~/.config/fzf-cmdhub

# show results
jackInfo '\nMade following symbolic links:\n'
for dir in "$HOME" "$HOME/.config" "$HOME/Library/Application Support"; do
  echo
  find "$dir" -type l -maxdepth 1 | while read link; do
    printf '+ %-36s   ->   %s\n'                     \
      "$(realpath --relative-base=$HOME -s "$link")" \
      "$(realpath --relative-base=$HOME -e "$link")"
  done
done

# }}}

# HOMEBREW {{{

jackNote '\n\n\nInstall Homebrew\n'
if which -s brew; then
  jackWarn 'Homebrew already intalled, abort\n'
else
  /usr/bin/ruby -e \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
    || exit 1

  jackNote '\nInstall Formulas\n'
  brew install $(<$SDIR/brew-list)
  brew doctor
fi

# }}}
