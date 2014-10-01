# vim: filetype=zsh foldmethod=marker

# ANTIGEN {{{1
source ~/Git/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).

antigen bundles <<EOBUNDLES

# git tools
git
git-extras
git-flow

colored-man
colorize

# not available on Mac osx
command-not-found

brew

zsh-users/zsh-completions

# order matters
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search


EOBUNDLES

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

# }}}1

# MY CONFIGURATION {{{1
export MDX_DOT_FILES="${HOME}/Git/dot-files"

com="$MDX_DOT_FILES/shell"
osx="$com/osx"

# WARNING: line order matters.
source $osx/coreutils
source $osx/pyenv
source $osx/macvim

source $com/shell_alias
source $com/ls_colors
source $com/go_env
source $com/dot_bin
source $com/rvm
source $com/zsh_completions
source $com/zsh_syntax_highlighting
source $com/zsh_history_substring_search
source $com/hugo
source $com/z
source $com/zsh_random_theme

unset com
unset osx
# }}}1

# random oh-my-zsh theme
xtheme
