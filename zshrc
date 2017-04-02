# vim: filetype=zsh foldmethod=marker
#SHELL=$0

# macOS sierra issue
export EVENT_NOKQUEUE=1

export MDX_REPOS_ROOT="${HOME}/Git"

export LANG='en_US.UTF-8'

#unalias run-help
#autoload run-help
#HELPDIR=/usr/local/share/zsh/help

# Antigen
if [[ ! -d ${MDX_REPOS_ROOT}/antigen ]]; then
  echo "\e[31mneed [antigen], installing ...\e[0m"
  git clone "https://github.com/zsh-users/antigen.git" \
    "${MDX_REPOS_ROOT}/antigen"
fi

# ANTIGEN {{{1
#_ANTIGEN_CACHE_ENABLED=''
source "${MDX_REPOS_ROOT}/antigen/antigen.zsh"

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# bundles {{{2
antigen bundles <<EOBUNDLES

# git tools
git
git-extras
git-flow

colorize

# alias for brew: bubu & brews
brew

zsh-users/zsh-completions src

# order matters
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search

# put $(pwd) in clipboard.
copydir

# put file content in clipboard
copyfile

# my zsh plugins
Mudox/fzf-cmdhub

# alias tips
djui/alias-tips

# alias for tmux
tmux

battery

# quickly jump between paths
rupa/z

EOBUNDLES
# }}}2

# Tell antigen tha you're done.
antigen apply

# }}}1

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
	echo "\e[31m[.zshrc]: un-recognized linux distro."
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
  [[ -f "$s" ]] && source $s
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

# set initiali prompt theme & shell colorscheme.
zpn
[[ -z $TMUX ]] && basen # do not change color scheme in tmux

# Fix z not working issue
source /Users/mudox/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-rupa-SLASH-z.git/z.sh

mdxinfo() {
  printf "\e[33m%8s -> \e[1;35m%s\n" "PS" "${MDX_ZSH_THEME}"
  printf "\e[33m%8s -> \e[1;35m%s\n" "BASE16" "${MDX_BASE_COLOR}"
}

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
