# vim: filetype=zsh foldmethod=marker
SHELL=$0

export MDX_REPOS_ROOT="${HOME}/Git"

if [ ! -d "${MDX_REPOS_ROOT}/antigen" ]; then
  echo "\e[31mneed [antigen], installing ...\e[0m"
  git clone "https://github.com/zsh-users/antigen.git" \
    "${MDX_REPOS_ROOT}/antigen"
fi

# ANTIGEN {{{1
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

# not available on Mac osx
command-not-found

# alias for brew: bubu & brews
brew

zsh-users/zsh-completions src

# order matters
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search


# quickly jump between paths
rupa/z

# extract most types of compressed packages by one command.
extract

# put $(pwd) in clipboard.
copydir

# put file content in clipboard
copyfile


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
# NOTE: line order matters.
case $(uname -s) in
  Darwin )
    source "$osx/coreutils"
    source "$osx/pyenv"
    source "$osx/tree"
    ;;
  CYGWIN* )
    source "$cygwin/mintty"
    source "$cygwin/cygwin"
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
# NOTE: loading order matters
to_load=(                      \
  mdx_functions                \
  shell_alias                  \
  go_env                       \
  bin                          \
  ls                           \
  zsh_syntax_highlighting      \
  zsh_history_substring_search \
  hugo                         \
  fzf                          \
  zsh_xtheme                   \
  base16shell		       \
  git                          \
  man                          \
  rvm                          \
  )

for s in "${to_load[@]}"; do
  source "$com/$s"
done

# cleanup
unset com
unset osx
unset archlinux
unset cygwin
unset to_load
unset s

# remove duplicate paths in $PATH
mdx_uniq_path

# }}}1

# theme & shell colorscheme.
xtheme
basen

mdxinfo() {
  printf "%-20s : %s\n" "zsh theme" "${MDX_ZSH_THEME}"
  printf "%-20s : %s\n" "base colorscheme" "${MDX_BASE_COLOR}"
}
