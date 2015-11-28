# vim: filetype=zsh foldmethod=marker
SHELL=bash

export MDX_REPOS_ROOT="${HOME}/Git"

export LANG='en_US.UTF-8'

# MY CONFIGURATION {{{1
export MDX_DOT_FILES="${MDX_REPOS_ROOT}/dot-files"

com="$MDX_DOT_FILES/shell"
osx="$com/osx"
cygwin="$com/cygwin"
archlinux="$com/archlinux"

# $PATH functions needed by subsequent sources
source "$com/path"

# system specific settings.
# NOTE: sourcing order matters.
case $(uname -s) in
  Darwin )
    for s in "$osx"/*; do
      [[ -f "$s" ]] && source "$s"
    done
    ;;
  CYGWIN* )
    for s in "$cygwin"/*; do
      [[ -f "$s" ]] && source "$s"
    done
    ;;
  Linux )
    case $(uname -r) in
      *ARCH ) # Arch Linux
	source "$archlinux/yaourt"
	source "$archlinux/vpn"
	;;
      * )
	echo "\e[31m[.zshrc]: un-covered linux distro."
	;;
    esac
    ;;
  * )
    echo "\e[31m[.zshrc]: un-recognized platform."
    ;;
esac

# across system settings
# NOTE: sourcing order matters
for s in "$com"/*; do
  [[ -f $s && ! $(basename $s) = zsh* ]] && source "$s"
done

# cleanup
unset com
unset osx
unset archlinux
unset cygwin
unset s

# remove duplicate paths in $PATH
mdx_uniq_path

# }}}1

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
