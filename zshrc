# vim: filetype=zsh foldmethod=marker

# ANTIGEN {{{1
source ~/Git/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# bundles {{{2
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

zsh-users/zsh-completions src

# order matters
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search


# quick jump between paths
rupa/z


EOBUNDLES
# }}}2

# Tell antigen tha you're done.
antigen apply

# }}}1

# MY CONFIGURATION {{{1
export MDX_DOT_FILES="${HOME}/Git/dot-files"

com="$MDX_DOT_FILES/shell"
osx="$com/osx"
cygwin="$com/cygwin"

# WARNING: line order matters.
case $(uname -s) in
  CYGWIN* )   # Cygwin of Windows
    source $cygwin/mintty
    ;;
  Darwin )    # Mac OSX
    source $osx/coreutils
    source $osx/pyenv
    ;;
  * )
    echo "\e[31m [.zshrc]: un-recognized platform"
    ;;
esac


to_load=(                      \
  ls                           \
  rvm                          \
  zsh_syntax_highlighting      \
  zsh_history_substring_search \
  hugo                         \
  zsh_xtheme                   \
  git                          \
  )

for s in ${to_load[@]}; do
  source $com/$s
done

# variable cleanup
unset com
unset osx
unset cygwin
unset to_load

# }}}1

# random oh-my-zsh theme
xtheme
